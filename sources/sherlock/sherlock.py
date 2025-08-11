# Copyright 2025 Paul Maddern
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

from skoolkit.skoolhtml import HtmlWriter
from skoolkit.skoolmacro import parse_strings, parse_ints, MacroParsingError
from skoolkit import (BASE_10, BASE_16, CASE_LOWER, CASE_UPPER)


class SherlockHtmlWriter(HtmlWriter):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.dict_index = []
        self.dict_entries = []
        self.dictionary_built = False

    def build_dictionary(self):
        """Build dictionary exactly like the C Build_Dictionary function"""
        if self.dictionary_built:
            return

        # Constants from C program
        DICTIONARY_INDEX_ADR = 0x5D80
        DICTIONARY_START_ADR = 0x5DC0
        DICTIONARY_END = 0x67B6

        # Read dictionary index (32 entries)
        adr = DICTIONARY_INDEX_ADR
        self.dict_index = []
        for i in range(32):
            if adr + 1 < len(self.snapshot):
                letter = chr(ord('A') - 1 + i)
                letter_start_adr = self.snapshot[adr] + 0x100 * self.snapshot[adr + 1]
                self.dict_index.append({
                    'letter': letter,
                    'start_adr': letter_start_adr
                })
                adr += 2

        # Read dictionary entries
        adr = DICTIONARY_START_ADR
        current_letter = '@'
        current_dict_index = 0
        self.dict_entries = []

        while adr <= DICTIONARY_END and adr < len(self.snapshot):
            # Check if we have reached the next letter
            if (current_dict_index + 1 < len(self.dict_index) and
                self.dict_index[current_dict_index + 1]['start_adr'] == (adr - (DICTIONARY_START_ADR - 1))):
                current_letter = chr(ord(current_letter) + 1)
                current_dict_index += 1
                continue

            if adr + 1 >= len(self.snapshot):
                break

            entry_start_adr = adr

            # Read entry header
            byte1 = self.snapshot[adr]
            entry_type = (byte1 & 0xF0) >> 4
            flection = byte1 & 0x0F
            adr += 1

            byte2 = self.snapshot[adr]
            synonym_bit = (byte2 & 0x80) >> 7
            letters_previous = (byte2 & 0x70) >> 4
            letters_current = byte2 & 0x0F
            adr += 1

            # Handle synonym
            synonym_adr = 0
            if synonym_bit:
                if adr + 1 < len(self.snapshot):
                    synonym_adr = (self.snapshot[adr] + 0x100 * self.snapshot[adr + 1] +
                                  DICTIONARY_START_ADR - 1)
                    adr += 0x02

            # Build word - start with first letter
            word = current_letter

            # Add letters from previous word
            if letters_previous > 0 and len(self.dict_entries) > 0:
                prev_word = self.dict_entries[-1]['word']
                for i in range(letters_previous):
                    if i + 1 < len(prev_word):
                        word += prev_word[i + 1]

            # Decode current letters (bit-packed, 5 bits each)
            bit_offset = 0x00
            for i in range(letters_current):
                if bit_offset >= 0x08:
                    bit_offset -= 0x08
                    adr += 0x01

                if adr + 0x01 >= len(self.snapshot):
                    break

                # Get 16-bit word and extract 5 bits (like C code)
                w = (self.snapshot[adr] << 8) + self.snapshot[adr + 1]  # Changed from 0x100 * to <<8
                w <<= bit_offset
                w &= 0xF800
                w >>= 11

                # Convert to letter (like C code)
                if w > 0:
                    letter = chr(w + ord('A') - 0x01)
                    word += letter

                bit_offset += 0x05

            # Advance address past bit-packed data (like C code)
            if letters_current >= 0x01:
                adr += 0x01
            if bit_offset >= (4 + 5):
                adr += 0x01

            # Create dictionary entry
            entry = {
                'address': entry_start_adr,
                'word': word,
                'type': entry_type,
                'flection': flection,
                'synonym': synonym_adr,
                'byte1': byte1,
                'byte2': byte2
            }

            self.dict_entries.append(entry)

        self.dictionary_built = True

    def get_dict_word(self, word_address):
        """Get dictionary word by address like C GetDictWord function"""
        if not self.dictionary_built:
            self.build_dictionary()

        if word_address == 0:
            return ""

        # Add dictionary start offset like C code
        wa = word_address + 0x5DC0 - 1

        # Search through entries for matching address
        for entry in self.dict_entries:
            if entry['address'] == wa:
                return entry['word']

        return "??? UNKNOWN WORD ???"

    def expand_texttoken(self, text, index, cwd):
        """Process text token using dictionary system"""
        try:
            end, address = parse_ints(text, index, 1, (0,))

            if address >= len(self.snapshot):
                return end, "[ERROR: Address out of bounds]"

            # Build dictionary if needed
            if not self.dictionary_built:
                self.build_dictionary()

            output = ""
            pos = address
            safety_count = 0

            while pos < len(self.snapshot) and safety_count < 100:
                byte_val = self.snapshot[pos]
                safety_count += 1

                if byte_val & 0x80:
                    # Multi-byte command
                    if pos + 1 < len(self.snapshot):
                        cmd_type = byte_val & 0x7F
                        param = self.snapshot[pos + 1]
                        output += f"[CMD:{cmd_type:02X}:{param:02X}] "
                        pos += 2
                    else:
                        pos += 1

                elif byte_val >= 0x60:
                    # Common word reference - look up in table at 0x67B7
                    word_index = byte_val - 0x60
                    word_table_address = 0x67B7 + (word_index * 2)

                    if word_table_address + 1 < len(self.snapshot):
                        word_addr_low = self.snapshot[word_table_address]
                        word_addr_high = self.snapshot[word_table_address + 1]
                        word_address = (word_addr_high << 8) | word_addr_low

                        # Get the word from dictionary
                        if 0x5DC0 <= word_address <= 0x67B6:
                            # Dictionary reference
                            dict_word = self.get_dict_word(word_address - 0x5DC0 + 1)
                            output += dict_word + " "
                        else:
                            # Direct string
                            word = ""
                            addr = word_address
                            while addr < len(self.snapshot) and len(word) < 50:
                                char_byte = self.snapshot[addr]
                                if char_byte == 0:
                                    break
                                elif 32 <= char_byte <= 126:
                                    word += chr(char_byte)
                                else:
                                    break
                                addr += 1
                            output += word + " "
                    pos += 1

                elif byte_val >= 0x40:
                    # Repeated character
                    if pos + 1 < len(self.snapshot):
#                        repeat_count = (byte_val & 0x1F) + 1
#                        char_to_repeat = self.snapshot[pos + 1]
#                        if 32 <= char_to_repeat <= 126:
#                            output += chr(char_to_repeat) * repeat_count
                        pos += 2
                    else:
                        pos += 1

                elif byte_val < 0x20:
                    # Control character
                    if byte_val == 0x00 or byte_val == 0x1F:
                        break
                    elif byte_val == 0x10:
                        output += "[SUBJECT] "
                    elif byte_val == 0x0D:
                        output += "\\n"
                    else:
                        output += f"[CTRL:{byte_val:02X}] "
                    pos += 1

                else:
                    # Regular character
                    output += chr(byte_val)
                    pos += 1

            return end, output.strip()

        except Exception as e:
            return end, f"[ERROR: {str(e)}]"

    def expand_bitgroups(self, text, index, cwd):
        """Show 5-bit groups in a table: #BITGROUPS(address,count)"""
        try:
            end, address, count = parse_ints(text, index, 2, (0, 8))

            bytes_needed = ((count * 5) + 7) // 8
            if address + bytes_needed > len(self.snapshot):
                return end, "[BOUNDS_ERROR]"

            # Build complete bit string
            bit_string = ""
            for i in range(bytes_needed):
                bit_string += f"{self.snapshot[address + i]:08b}"

            # Start the table
            result = "#TABLE(default,centre,centre)\n"
            result += "{ =h Bits | =h Letter }\n"

            # Add each 5-bit group as a table row
            for i in range(count):
                start_bit = i * 5
                if start_bit + 5 <= len(bit_string):
                    five_bits = bit_string[start_bit:start_bit + 5]
                    bit_value = int(five_bits, 2)
                    letter = chr(bit_value + ord('A') - 1) if 1 <= bit_value <= 26 else '?'
                    result += f"{{ {five_bits} | {letter} }}\n"

            result += "TABLE#"
            return end, result

        except Exception as e:
            return end, f"[ERROR: {str(e)}]"

    def expand_locationattribute(self, attribute, index, cwd):
        # #LOCATIONATTRIBUTEbyte
        end, attribute = parse_ints(attribute, index, 1)
        attributes = []
        if attribute & (1 << 7):
            attributes.append('Light')
        else:
            attributes.append('Dark')
        if attribute & (1 << 1) and attribute & (1 << 2):
            attributes.append('ON')
        elif attribute & (1 << 1):
            attributes.append('INSIDE')
        elif attribute & (1 << 2):
            attributes.append('IN')
        elif attribute & (1 << 3):
            attributes.append('AT')
        else:
            attributes.append('OUTSIDE')
        return end, '; '.join(attributes)
