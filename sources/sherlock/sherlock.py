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

    def expand_texttoken(self, text, index, cwd):
        # #TEXTTOKENaddress[,order]
        end, address, order = parse_ints(text, index, 2, (0, 0))
        return end, "BLAH"
