# Copyright 2021 Paul Maddern
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

from skoolkit.graphics import Frame, Udg
from skoolkit.skoolhtml import HtmlWriter
from skoolkit.skoolmacro import parse_strings, parse_ints, parse_image_macro, MacroParsingError
from skoolkit import (BASE_10, BASE_16, CASE_LOWER, CASE_UPPER)

# The Hobbit (1982) graphics engine - Python port of hobbitgfx.js by Richard Carlsson.
# Graphics opcodes: 0x08 X Y = move to X Y; 0x80-0xFF = draw line; 0x40-0x7F X Y = fill;
# 0x20-0x3F H L N+ = paint background; 0x00 = stop.


def _draw_hobbit_graphic(snapshot, address):
    """Interpret Hobbit graphics bytecode from snapshot at address, return (bits, ink, paper).
    bits[y*256+x]=1 if pixel set; ink/paper are 16*32 attribute arrays (Spectrum layout).
    """
    bits = [0] * (128 * 256)
    ink = [0] * (16 * 32)
    paper = [0] * (16 * 32)
    pc = address

    border = snapshot[pc]
    pc += 1
    colours = snapshot[pc]
    pc += 1
    bg = (colours >> 3) & 7
    fg = colours & 7

    for i in range(128 * 256):
        bits[i] = 0
    for i in range(16 * 32):
        ink[i] = fg
        paper[i] = bg

    x = y = c = 0

    def check_pixel(px, py):
        return bits[py * 256 + px] == 1

    def draw_pixel(px, py, colour):
        bits[py * 256 + px] = 1
        ax, ay = px >> 3, py >> 3
        idx = ay * 32 + ax
        if paper[idx] == colour:
            ink[idx] = colour ^ 7
        else:
            ink[idx] = colour

    def draw_line(px, py, colour, d, n, m):
        m0 = m
        if d & 1:
            while True:
                draw_pixel(px, py, colour)
                if d & 2:
                    if py < 127:
                        py += 1
                    else:
                        return (px, py)
                else:
                    if py > 0:
                        py -= 1
                    else:
                        return (px, py)
                if m <= 0:
                    m = m0
                    if d & 4:
                        if px > 0:
                            px -= 1
                        else:
                            return (px, py)
                    else:
                        if px < 255:
                            px += 1
                        else:
                            return (px, py)
                else:
                    m -= 1
                n -= 1
                if n < 0:
                    break
        else:
            while True:
                draw_pixel(px, py, colour)
                if d & 4:
                    if px > 0:
                        px -= 1
                    else:
                        return (px, py)
                else:
                    if px < 255:
                        px += 1
                    else:
                        return (px, py)
                if m <= 0:
                    m = m0
                    if d & 2:
                        if py < 127:
                            py += 1
                        else:
                            return (px, py)
                    else:
                        if py > 0:
                            py -= 1
                        else:
                            return (px, py)
                else:
                    m -= 1
                n -= 1
                if n < 0:
                    break
        return (px, py)

    def paint_bg(a, colour, d, n):
        while True:
            if ink[a] == colour:
                ink[a] = colour ^ 7
            paper[a] = colour
            if d == 0:
                if a > 31:
                    a -= 32
            elif d == 1:
                if a < 511:
                    a += 1
            elif d == 2:
                if a < 480:
                    a += 32
            elif d == 3:
                if a > 0:
                    a -= 1
            n -= 1
            if n < 0:
                break
        return a

    def area_fill(fx, fy, colour):
        stack = [(fx, fy)]
        while stack:
            ia = ib = 0
            x, y = stack.pop()
            while True:
                if check_pixel(x, y):
                    draw_pixel(x, y, colour)
                    x += 1
                    break
                if x > 0:
                    x -= 1
                else:
                    break
            while True:
                if y > 0 and not check_pixel(x, y - 1):
                    if not ia:
                        stack.append((x, y - 1))
                        ia = 1
                else:
                    ia = 0
                if y < 127 and not check_pixel(x, y + 1):
                    if not ib:
                        stack.append((x, y + 1))
                        ib = 1
                else:
                    ib = 0
                draw_pixel(x, y, colour)
                if x >= 255 or check_pixel(x + 1, y):
                    break
                x += 1
            if x < 255 and check_pixel(x + 1, y):
                x += 1
                draw_pixel(x, y, colour)

    while True:
        op = snapshot[pc]
        pc += 1
        if op == 0:
            break
        if op == 8:
            x = snapshot[pc]
            pc += 1
            y = 127 - snapshot[pc]
            pc += 1
            draw_pixel(x, y, c)
        elif op > 0x7F:
            n = snapshot[pc] & 0x3F
            m = ((op & 0x78) >> 1) + ((snapshot[pc] & 0xC0) >> 6)
            x, y = draw_line(x, y, c, op & 0x07, n, m)
            pc += 1
        elif op > 0x3F:
            fx = snapshot[pc]
            pc += 1
            fy = 127 - snapshot[pc]
            pc += 1
            area_fill(fx, fy, op & 0x07)
        elif op > 0x1F:
            h = snapshot[pc]
            pc += 1
            lo = snapshot[pc]
            pc += 1
            a = (h * 256 + lo) - 0x5800
            while True:
                d = snapshot[pc]
                pc += 1
                if d == 0xFF:
                    break
                a = paint_bg(a, op & 0x07, d & 0x03, (d & 0xFC) >> 2)

    return bits, ink, paper, border


def _hobbit_graphic_to_udgs(bits, ink, paper):
    """Convert rendered bits/ink/paper to 32x16 UDG array for Skoolkit Frame.
    Spectrum attr: bits 0-2 = ink (drawn pixels), bits 3-5 = paper (background).
    """
    udg_rows = []
    for ay in range(16):
        row = []
        for ax in range(32):
            idx = ay * 32 + ax
            attr = (ink[idx] & 7) | ((paper[idx] & 7) << 3)
            data = []
            for dy in range(8):
                byte = 0
                for dx in range(8):
                    px, py = ax * 8 + dx, ay * 8 + dy
                    if bits[py * 256 + px]:
                        byte |= 0x80 >> dx
                data.append(byte)
            row.append(Udg(attr, data))
        udg_rows.append(row)
    return udg_rows


class HobbitHtmlWriter(HtmlWriter):
    def expand_drawing(self, text, index, cwd):
        # #DRAWINGaddress[,scale][{X,Y,W,H}](fname)
        # Renders Hobbit location graphics from bytecode at address (e.g. #DRAWING(#PC)(img.png)).
        end, crop_rect, fname, frame, alt, (address, scale) = parse_image_macro(
            text, index, (1,), ('address', 'scale')
        )
        if fname is None:
            raise MacroParsingError('Filename missing: #DRAWING{}'.format(text[index:end]))
        bits, ink, paper, _ = _draw_hobbit_graphic(self.snapshot, address)
        udg_array = _hobbit_graphic_to_udgs(bits, ink, paper)
        frame = Frame(udg_array, scale, 0, *crop_rect, name=frame)
        return end, self.handle_image(frame, fname, cwd, alt, 'ScreenshotImagePath')

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

    def expand_textmessage(self, text, index, cwd):
        # #TEXTMESSAGEaddress
        end, address = parse_ints(text, index, 1)
        words = []
        address = self.snapshot[address] + self.snapshot[address + 1] * 0x100
        while True:
            character = self.snapshot[address]
            if character & (1 << 7) == 0:
                if character < 0x20:
                    if character > 0x14:
                        break
                elif character >= 0x60:
                    words.append(self.get_common_word(character))
                address += 0x01
            else:
                lsb = character & 0x7F
                msb = self.snapshot[address + 1]
                if character & 0xF0 == 0x20 or character & 0xF0 == 0x30 or character & 0xF0 == 0x60:
                    words.append(self.get_word(msb * 0x100 + lsb))
                else:
                    words.append('')  # self.get_token(msb, lsb))
                address += 0x02
            # words.append(self.get_word((msb & 0xF0) * 0x100 + lsb))
        return end, ' '.join(words)

    def expand_locationname(self, text, index, cwd):
        # #LOCATIONNAMEid
        end, id = parse_ints(text, index, 1)
        address = 0xB9E0 + id * 0x02
        target = self.snapshot[address] + self.snapshot[address + 1] * 0x100
        target += 0x02
        return end, self.get_words(target, True)

    def expand_object(self, text, index, cwd):
        # #OBJECTid[,affix,hex][(prefix[,suffix])]
        end, id, affix, tohex = parse_ints(text, index, 3, (0, 0, 0))
        if affix:
            end, (prefix, suffix) = parse_strings(text, end, 2, ('', ''))
        else:
            prefix = suffix = ''
        if id == 0xFF:
            return end, "none"
        address = 0xC063
        while self.snapshot[address] != 0xFF:
            if self.snapshot[address] == id:
                break
            address += 3
        if self.snapshot[address] == 0xFF:
            return end, "invalid ID"
        address += 1
        target = self.snapshot[address] + self.snapshot[address + 1] * 0x100
        anchor = '#{}'.format(target)
        target += 0x08
        href = self._asm_relpath(cwd, 0xC11B, '') + anchor
        if self.base == BASE_16:
            if self.case == CASE_LOWER:
                link_text = '{}{:0{}x}{}'.format(prefix, id, 2, suffix)
            else:
                link_text = '{}{:0{}X}{}'.format(prefix, id, 2, suffix)
        else:
            link_text = '{}'.format(id)
        return end, '{} - "{}"'.format(self.format_link(href, link_text), self.get_words(target, True))

    def expand_texttoken(self, text, index, cwd):
        # #TEXTTOKENaddress[,order]
        end, address, order = parse_ints(text, index, 2, (0, 0))
        return end, self.get_words(address, order)

    def get_common_word(self, index):
        address = 0xAD3D + (index - 0x60) * 2
        lsb = self.snapshot[address]
        msb = self.snapshot[address + 1] + 0x50
        return self.get_token(msb, lsb)

    def get_token(self, msb, lsb):
        if (msb & 0x0F | lsb) == 0:
            return
        return self.get_word((msb & 0x0F) * 0x100 + lsb + 0x6000)

    def get_word(self, address):
        word = []
        while True:
            letter = self.snapshot[address]
            word.append(chr((letter & 0x1F) + 0x60))
            if letter & (1 << 7):
                break
            address += 1
        return ''.join(word)

    def get_words(self, address, order):
        words = []
        for i in range(0, 6, 2):
            lsb = self.snapshot[address + i]
            msb = self.snapshot[address + i + 1]
            if msb & 0x0F | lsb != 0x00:
                words.append(self.get_word(0x6000 + (msb & 0x0F) * 0x100 + lsb))
        if order and len(words) > 1:
            first = words.pop(0)
            words.append(first)
        return ' '.join(word.capitalize() for word in words)

    def expand_firstletter(self, text, index, cwd):
        # #FIRSTLETTERaddress
        end, address = parse_ints(text, index, 1)
        base_letter = self.snapshot[int(address)]
        extra_params = self.snapshot[int(address) + 1]
        suffix = ''
        # print(hex(base_letter))
        if base_letter & (1 << 7):
            base_letter &= 0x7F
            suffix = 'DUNNO'
        if base_letter & (1 << 6):
            base_letter &= 0x1F
            suffix = '(ARTICLE_MISC)'
        if extra_params & (1 << 6):
            suffix = '(PREPOSITION)'
        elif extra_params & (1 << 5):
            suffix = '(SYSTEM_PRONOUN)'
        return end, "%s %s" % (chr(0x40 + base_letter), suffix)

    def expand_letter(self, text, index, cwd):
        # #LETTERaddress
        end, address = parse_ints(text, index, 1)
        base_letter = self.snapshot[int(address)]
        suffix = ''
        if base_letter & (1 << 8):
            base_letter &= 0x8F
        elif base_letter & (1 << 7):
            base_letter &= 0x7F
            suffix = '+$80 (escape character)'
        elif base_letter & (1 << 6):
            base_letter -= 0x60
            suffix = '(PREPOSITION?)'
        elif base_letter & (1 << 5):
            base_letter -= 0x20
            suffix = '(SYSTEM_PRONOUN?)'
        return end, "%s %s" % (chr(0x40 + base_letter), suffix)
