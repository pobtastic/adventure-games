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
from skoolkit.skoolmacro import parse_ints, parse_r

class AdventureGamesHtmlWriter(HtmlWriter):
	def init(self):
		self._type = 'asm' if self.base == 16 else 'dec/asm'

	def expand_shock(self, text, index, cwd):
		# #SHOCKaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "After Shock"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/aftershock/{self._type}/{href}", link_text)

	def expand_pass(self, text, index, cwd):
		# #PASSaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Blizzard Pass"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/blizzardpass/{self._type}/{href}", link_text)

	def expand_jewels(self, text, index, cwd):
		# #JEWELSaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "The Jewels Of Babylon"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/jewelsofbabylon/{self._type}/{href}", link_text)

	def expand_forest(self, text, index, cwd):
		# #FORESTaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Forest At Worlds End"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/forestatworldsend/{self._type}/{href}", link_text)

	def expand_heroes(self, text, index, cwd):
		# #HEROESaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Heroes Of Karn"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/heroesofkarn/{self._type}/{href}", link_text)

	def expand_hobbit(self, text, index, cwd):
		# #HOBBITaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "The Hobbit"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/hobbit/{self._type}/{href}", link_text)

	def expand_andromeda(self, text, index, cwd):
		# #ANDROMEDAaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Message From Andromeda"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/messagefromandromeda/{self._type}/{href}", link_text)

	def expand_sherlock(self, text, index, cwd):
		# #SHERLOCKaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Sherlock"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/sherlock/{self._type}/{href}", link_text)

	def expand_warlord(self, text, index, cwd):
		# #WARLORDaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Warlord"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/warlord/{self._type}/{href}", link_text)

	def decode_byte(self, byte, result, processed):
		"""Common byte expansion logic for both DECODE macros"""
		if byte < 0x5F:
			ascii_val = byte + 0x20
			if ascii_val == 0x7E:
				result.append(' ')  # Space for single line output
			else:
				result.append(chr(ascii_val))
		elif byte == 0x5F:
			pass
		elif byte in processed:
			result.append(f'[Loop:${byte:02X}]')
		else:
			processed.add(byte)
			dict_offset = (byte - 0x60) * 0x02
			dict_base = 0xC8EB

			self.decode_byte(self.snapshot[dict_base + dict_offset], result, processed)
			self.decode_byte(self.snapshot[dict_base + dict_offset + 0x01], result, processed)
			processed.remove(byte)

	def expand_decode(self, text, index, cwd):
		# #DECODEvalue
		end, value = parse_ints(text, index, 1)

		result = []
		self.decode_byte(value, result, set())
		return end, ''.join(result)

	def expand_decodestr(self, text, index, cwd):
		# #DECODESTRaddress
		end, address = parse_ints(text, index, 1)

		result = []
		processed = set()

		addr = address
		while addr < 0x10000 and self.snapshot[addr] != 0x5F:
			self.decode_byte(self.snapshot[addr], result, processed)
			addr += 1

		return end, ''.join(result)
