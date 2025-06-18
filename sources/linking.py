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
from skoolkit.skoolmacro import parse_r

class AdventureGamesHtmlWriter(HtmlWriter):
	def init(self):
		self._type = 'asm' if self.base == 16 else 'dec/asm'

	def expand_blizzardpass(self, text, index, cwd):
		# #PASSaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Blizzard Pass"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/blizzardpass/{self._type}/{href}", link_text)

	def expand_jewelsofbabylon(self, text, index, cwd):
		# #JEWELSaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Jewels Of Babylon"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/jewelsofbabylon/{self._type}/{href}", link_text)

	def expand_warlord(self, text, index, cwd):
		# #WARLORDaddress[#anchor][(link text)]
		end, addr_str, address, code_id, anchor, link_text = parse_r(self.fields, text, index)
		if not link_text:
			link_text = "Warlord"
		href = self._asm_relpath(cwd, address, code_id, True)
		return end, self.format_link(f"/adventure-games/warlord/{self._type}/{href}", link_text)
