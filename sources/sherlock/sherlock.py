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

import sys
from pathlib import Path

from skoolkit.skoolmacro import parse_strings, parse_ints, MacroParsingError
from skoolkit import (BASE_10, BASE_16, CASE_LOWER, CASE_UPPER)

_SOURCES_DIR = str(Path(__file__).resolve().parent.parent)
if _SOURCES_DIR not in sys.path:
    sys.path.insert(0, _SOURCES_DIR)
from linking import AdventureGamesHtmlWriter


class SherlockHtmlWriter(AdventureGamesHtmlWriter):
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

            output = []
            pos = address
            safety_count = 0

            while pos < len(self.snapshot) and safety_count < 120:
                safety_count += 1
                byte_val = self.snapshot[pos]

                if byte_val in (0x00, 0x1F):
                    break

                if byte_val & 0x80:
                    # Dictionary word. The low 12 bits select the word; the
                    # high nibble is a format flag used by the printer.
                    if pos + 1 >= len(self.snapshot):
                        break
                    param = self.snapshot[pos + 1]
                    token = ((byte_val & 0x7F) << 8) | param
                    output.append(" " + self.get_dict_word(token & 0x0FFF))
                    pos += 2
                    continue

                if byte_val >= 0x60:
                    # Common word. The table at $67B7 stores the dictionary id,
                    # and the printer adds $50 to the high byte before looking it up.
                    word_index = byte_val - 0x60
                    word_table_address = 0x67B7 + (word_index * 2)
                    if word_table_address + 1 >= len(self.snapshot):
                        break
                    raw = self.snapshot[word_table_address] | (self.snapshot[word_table_address + 1] << 8)
                    token = raw & 0xFF | ((((raw >> 8) + 0x50) & 0xFF) << 8)
                    output.append(" " + self.get_dict_word(token & 0x0FFF))
                    pos += 1
                    continue

                if byte_val >= 0x40:
                    # Bit-packed letters, five bits each, printed as ASCII+$60.
                    count = (byte_val & 0x1F) + 1
                    hl = pos + 1
                    bit = 0
                    letters = []
                    for _ in range(count):
                        code, hl, bit = self._unpack_text_letter(hl, bit)
                        letters.append(chr(code) if 32 <= code < 127 else "")
                    pos = hl + 1 if bit else hl
                    output.append("".join(letters))
                    continue

                if byte_val < 0x20:
                    if byte_val == 0x10:
                        output.append(" [SUBJECT]")
                    elif byte_val == 0x0D:
                        output.append("\\n")
                    else:
                        output.append(f" [{byte_val:02X}]")
                    pos += 1
                    continue

                output.append(chr(byte_val))
                pos += 1

            return end, "".join(output).strip()

        except Exception as e:
            return end, f"[ERROR: {str(e)}]"

    def _unpack_text_letter(self, hl, bit):
        """Unpack one 5-bit letter the way #R$A990 does."""
        if hl + 1 >= len(self.snapshot):
            return 0x20, hl, bit
        high = self.snapshot[hl]
        low = self.snapshot[hl + 1]
        if bit:
            for _ in range(bit):
                carry = (low >> 7) & 1
                low = (low << 1) & 0xFF
                high = ((high << 1) & 0xFF) | carry
        next_bit = bit + 5
        if next_bit >= 8:
            next_bit -= 8
            hl += 1
        code = high
        for _ in range(3):
            code = ((code & 1) << 7) | (code >> 1)
        return (code & 0x1F) + 0x60, hl, next_bit

    def expand_script(self, text, index, cwd):
        """Describe one slice of a character script: #SCRIPT(length)."""
        end, length = parse_ints(text, index, 1, (1,))
        address = int(self.pc)
        return end, self._describe_script_slice(address, length)

    def _describe_script_slice(self, address, length):
        if 0 <= address and length > 0 and address + length <= 0x10000:
            op = self.snapshot[address]
            if self._script_length(op) == length and self._script_addresses_ok(address, op):
                text = self._script_command_text(address, op)
                return text[0].upper() + text[1:] + "."
        return self._describe_script_bytes(address, length, address)

    def _script_base(self, op):
        return {
            0x0: 3, 0x1: 2, 0x2: 4, 0x3: 3, 0x4: 5, 0x5: 4, 0x6: 3, 0x7: 5,
            0x8: 2, 0x9: 2, 0xA: 1, 0xB: 1, 0xC: 5, 0xD: 2, 0xE: 3, 0xF: 1,
        }[op & 0x0F]

    def _script_length(self, op):
        """Byte length of one script command.

        A zero byte is padding skipped one byte at a time (#R$CC94). Bit 7
        adds the two-byte address #R$CE8F follows when the command does not
        branch, and bit 4 adds the two-byte address #R$CEB8 follows. #R$CEFE
        applies the bit-7 pair before the type advance; the bit-4 pair sits
        at the end of the command.
        """
        if op == 0:
            return 1
        extra = (2 if op & 0x80 else 0) + (2 if op & 0x10 else 0)
        return self._script_base(op) + extra

    def _script_addresses(self, address, op):
        """Message, text, goto and continuation addresses stored in one command."""
        kind = op & 0x0F
        size = self._script_length(op)
        base = 1 if op == 0 else self._script_base(op)
        raw = [self.snapshot[address + i] for i in range(size)]

        def word(offset):
            return raw[offset] | (raw[offset + 1] << 8)

        found = []
        if kind in (0x3, 0x6, 0x7) and size >= 3:
            found.append(word(1))
        if kind == 0x5 and size >= 4:
            found.append(word(2))
        if kind == 0xE and size >= 3:
            found.append(word(1))
        if op & 0x80 and size >= base + 2:
            found.append(word(base))
        if op & 0x10 and size >= 2:
            found.append(word(size - 2))
        return found

    def _script_addresses_ok(self, address, op):
        return all(addr >= 0x5B00 for addr in self._script_addresses(address, op))

    def _script_command_name(self, op):
        names = {
            0x0: "room-parameter",
            0x1: "simple-action",
            0x2: "room-parameter",
            0x3: "show-message",
            0x4: "queue-display",
            0x5: "describe-room",
            0x6: "print-message",
            0x7: "refresh-room",
            0x8: "push",
            0x9: "pop",
            0xA: "nested-script",
            0xB: "nested-script",
            0xC: "stop",
            0xD: "script-error",
            0xE: "goto",
            0xF: "script-error",
        }
        return names[op & 0x0F]

    def _script_param(self, value):
        special = {
            0xFA: "the current room",
            0xFB: "the current character",
            0xFC: "the high byte of the location",
            0xFD: "the low byte of the location",
        }
        if value in special:
            return special[value]
        if 0xF5 <= value <= 0xF9:
            return "the low byte of the location"
        if value <= 0x6D:
            return f"#OBJECT(${value:02X})"
        return f"#N${value:02X}"

    def _script_command_text(self, address, op):
        if op == 0:
            return "skip a padding byte in the character script"
        kind = op & 0x0F
        base = self._script_base(op)
        size = self._script_length(op)
        raw = [self.snapshot[address + i] for i in range(size)]
        body = raw[1:base]
        alternate = ""
        cont = []
        if op & 0x80 and len(raw) >= base + 2:
            cont.append(raw[base] | (raw[base + 1] << 8))
        if op & 0x10 and len(raw) >= 2:
            dest = raw[-2] | (raw[-1] << 8)
            if dest not in cont:
                cont.append(dest)
        if cont:
            links = " or ".join(self._code_link(dest) for dest in cont)
            alternate = f" and otherwise continue at {links}"

        def word_at(offset):
            return body[offset] | (body[offset + 1] << 8)

        if kind in (0x0, 0x2) and len(body) >= 3:
            params = ", ".join(self._script_param(b) for b in body[:3])
            return f"copy room parameters {params} into the display{alternate}"
        if kind == 0x1 and body:
            return f"perform the simple action for {self._script_param(body[0])}{alternate}"
        if kind == 0x3 and len(body) >= 2:
            dest = word_at(0)
            return f"show the message at {self._code_link(dest)}{alternate}"
        if kind == 0x6 and len(body) >= 2:
            dest = word_at(0)
            return f"print the message at {self._code_link(dest)}{alternate}"
        if kind == 0x5 and len(body) >= 3:
            room = self._script_param(body[0])
            dest = word_at(1)
            return f"describe {room} with the text at {self._code_link(dest)}{alternate}"
        if kind == 0x4 and len(body) >= 4:
            params = ", ".join(self._script_param(b) for b in body[:4])
            return f"queue a room display for {params}{alternate}"
        if kind == 0x7 and len(body) >= 4:
            dest = word_at(0)
            params = ", ".join(self._script_param(b) for b in body[2:4])
            return f"refresh the room from the text at {self._code_link(dest)}, using {params}{alternate}"
        if kind == 0x8 and body:
            return f"push {self._script_param(body[0])} for the character script{alternate}"
        if kind == 0x9 and body:
            return f"pop {self._script_param(body[0])} for the character script{alternate}"
        if kind in (0xA, 0xB):
            return f"run the nested character script{alternate}"
        if kind == 0xC:
            return f"stop this character script{alternate}"
        if kind == 0xE and len(body) >= 2:
            dest = word_at(0)
            return f"jump to the script at {self._code_link(dest)}{alternate}"
        if kind in (0xD, 0xF):
            return f"mark a script error and carry on{alternate}"
        return f"carry out script command #N${op:02X}{alternate}"

    def _code_link(self, address):
        """Link with #R only when the address is a disassembly line."""
        if 0x5B00 <= address <= 0xFFFF and self.parser.get_instruction(address):
            return f"#R${address:04X}"
        return f"#N${address & 0xFFFF:04X}"

    def _describe_script_bytes(self, address, length, origin):
        values = ", ".join(f"#N${self.snapshot[address + i]:02X}" for i in range(length))
        return f"Script bytes {values}."

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
