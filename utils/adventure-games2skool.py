#!/usr/bin/env python3
import inflect
import sys
import os
import argparse
from collections import OrderedDict

try:
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool
except ImportError:
    SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
    if not SKOOLKIT_HOME:
        sys.stderr.write('SKOOLKIT_HOME is not set; aborting\n')
        sys.exit(1)
    if not os.path.isdir(SKOOLKIT_HOME):
        sys.stderr.write('SKOOLKIT_HOME={}; directory not found\n'.format(SKOOLKIT_HOME))
        sys.exit(1)
    sys.path.insert(0, SKOOLKIT_HOME)
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool

ADVENTUREGAMES_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUILD_DIR = '{}/sources'.format(ADVENTUREGAMES_HOME)


class AdventureGame:
    """Base class for all adventure games"""
    def __init__(self, snapshot):
        self.snapshot = snapshot

    def get_text(self, start, end):
        """Extract text data from the game"""
        lines = []
        pc = start
        while pc < end:
            start = pc
            string, pc = self.get_string(pc)
            words = [word.capitalize() for word in string.split()]
            label = [''.join(c for c in word if c.isalpha()) for word in words]
            lines.append(f"t ${start:04X} Messaging: \"{' '.join(words)}\"")
            lines.append(f"@ ${start:04X} label=Messaging_{''.join(label)}")
            lines.append(f"  ${start:04X},${pc-start:02X} \"#STR${start:04X},$08($b==$FF)\".")
            lines.append(f"B ${pc:04X},$01 Terminator.")
            lines.append("")
            pc += 0x01
        return lines

    def get_disassembly(self):
        """Generate disassembly for the game"""
        raise NotImplementedError("Subclass must implement get_disassembly()")

    def get_byte(self, address):
        """Helper method to get a byte from snapshot"""
        return self.snapshot[address]

    def get_word(self, address):
        """Helper method to get a word from snapshot"""
        return self.snapshot[address] + 0x100 * self.snapshot[address + 0x01]

    def get_string(self, address, terminator=0xFF):
        """Helper method to extract a string from snapshot"""
        chars = []
        start = address
        while self.snapshot[address] != terminator:
            if 0x20 <= self.snapshot[address] <= 0x7E:
                chars.append(chr(self.snapshot[address]))
            address += 0x01
        return ''.join(chars), address


class AfterShock(AdventureGame):
    def _expand_byte(self, byte, result, processed, newline_as_space=True):
        """Common byte expansion logic for decoding"""
        if byte < 0x5F:
            ascii_val = byte + 0x20
            if ascii_val == 0x7E:
                result.append(' ' if newline_as_space else '\n')
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

            self._expand_byte(self.snapshot[dict_base + dict_offset], result, processed, newline_as_space)
            self._expand_byte(self.snapshot[dict_base + dict_offset + 0x01], result, processed, newline_as_space)
            processed.remove(byte)

    def get_decoded_string(self, address, terminator=0x5F):
        """Extract and decode a string from snapshot"""
        result = []
        processed = set()
        start = address

        while address < 0x10000 and self.snapshot[address] != terminator:
            self._expand_byte(self.snapshot[address], result, processed)
            address += 1

        return ''.join(result), address

    def get_text(self):
        """Extract text data from the game"""
        start = 0xF195
        end = 0xFF1D
        lines = []
        pc = start
        while pc < end:
            start = pc
            decoded_string, pc = self.get_decoded_string(pc)
            words = [word.capitalize() for word in decoded_string.split()]
            label = [''.join(c for c in word if c.isalpha()) for word in words]
            lines.append(f"t ${start:04X} Messaging: \"{' '.join(words)}\"")
            lines.append(f"@ ${start:04X} label=Messaging_{''.join(label)}")
            lines.append(f"N ${start:04X} Print \"#DECODESTR(#PC)\".")
            lines.append(f"B ${start:04X},$01 \"#DECODE(#PEEK(#PC))\".")
            lines.append(f"L ${start:04X},$01,${pc-start:02X},$02")
            lines.append(f"B ${pc:04X},$01 Terminator.")
            lines.append("")
            pc += 0x01
        return '\n'.join(lines)


class BlizzardPass(AdventureGame):
    def get_text(self):
        return "# BlizzardPass text data\n"


class ForestAtWorldsEnd(AdventureGame):
    def get_text(self):
        return "# ForestAtWorldsEnd text data\n"


class HeroesOfKarn(AdventureGame):
    def get_text(self):
        return "# HeroesOfKarn text data\n"


class JewelsOfBabylon(AdventureGame):
    def get_text(self):
        return "# JewelsOfBabylon text data\n"


class MessageFromAndromeda(AdventureGame):
    def get_text(self):
        return "# MessageFromAndromeda text data\n"


class Warlord(AdventureGame):
    def get_text(self):
        lines = super().get_text(0xC97C, 0xE0B0)
        return '\n'.join(lines)


GAMES = OrderedDict((
    ('aftershock', {
        'class': AfterShock,
        'z80': '{}/AfterShock.z80'.format(ADVENTUREGAMES_HOME),
        't2s': '{}/aftershock.t2s'.format(ADVENTUREGAMES_HOME),
        'name': 'After Shock'
    }),
    ('blizzardpass', {
        'class': BlizzardPass,
        'z80': '{}/BlizzardPass.z80'.format(ADVENTUREGAMES_HOME),
        't2s': '{}/blizzardpass.t2s'.format(ADVENTUREGAMES_HOME),
        'name': 'Blizzard Pass'
    }),
    ('forestatworldsend', {
        'class': ForestAtWorldsEnd,
        'z80': '{}/ForestAtWorldsEnd.z80'.format(ADVENTUREGAMES_HOME),
        't2s': '{}/forestatworldsend.t2s'.format(ADVENTUREGAMES_HOME),
        'name': "Forest at World's End"
    }),
    ('heroesofkarn', {
        'class': HeroesOfKarn,
        'z80': '{}/HeroesOfKarn.z80'.format(ADVENTUREGAMES_HOME),
        't2s': '{}/heroesofkarn.t2s'.format(ADVENTUREGAMES_HOME),
        'name': 'Heroes Of Karn'
    }),
    ('jewelsofbabylon', {
        'class': JewelsOfBabylon,
        'z80': '{}/JewelsofBabylon.z80'.format(ADVENTUREGAMES_HOME),
        't2s': '{}/jewelsofbabylon.t2s'.format(ADVENTUREGAMES_HOME),
        'name': 'Jewels of Babylon'
    }),
    ('messagefromandromeda', {
        'class': MessageFromAndromeda,
        'z80': '{}/MessageFromAndromeda.z80'.format(ADVENTUREGAMES_HOME),
        't2s': '{}/messagefromandromeda.t2s'.format(ADVENTUREGAMES_HOME),
        'name': 'Message From Andromeda'
    }),
    ('warlord', {
        'class': Warlord,
        'z80': '{}/Warlord.z80'.format(ADVENTUREGAMES_HOME),
        't2s': '{}/warlord.t2s'.format(ADVENTUREGAMES_HOME),
        'name': 'Warlord'
    })
))


def run(game_name, subcommand):
    if not os.path.isdir(BUILD_DIR):
        os.mkdir(BUILD_DIR)

    game_config = GAMES[game_name]
    z80_file = game_config['z80']
    t2s_file = game_config['t2s']

    if not os.path.isfile(z80_file):
        tap2sna.main(('-d', BUILD_DIR, '@{}'.format(t2s_file)))

    game_class = game_config['class']
    game = game_class(get_snapshot(z80_file))

    ctlfile = '{}/{}/{}.ctl'.format(BUILD_DIR, game_name, subcommand)
    with open(ctlfile, 'wt') as f:
        f.write(getattr(game, methods[subcommand][0])())


###############################################################################
# Begin
###############################################################################
methods = OrderedDict((
    ('text', ('get_text', 'Text Data')),
    ('disassemble', ('get_disassembly', 'Disassemble'))
))

games_list = '\n'.join('  {} - {}'.format(k, v['name']) for k, v in GAMES.items())
subcommands = '\n'.join('  {} - {}'.format(k, v[1]) for k, v in methods.items())

parser = argparse.ArgumentParser(
    usage='%(prog)s GAME SUBCOMMAND',
    description="Produce a skool file snippet for an Adventure Game.\n\n"
                "GAME must be one of:\n{}\n\n"
                "SUBCOMMAND must be one of:\n{}".format(games_list, subcommands),
    formatter_class=argparse.RawTextHelpFormatter,
    add_help=False
)
parser.add_argument('game', help=argparse.SUPPRESS, nargs='?')
parser.add_argument('subcommand', help=argparse.SUPPRESS, nargs='?')

namespace, unknown_args = parser.parse_known_args()

if unknown_args or namespace.game not in GAMES or namespace.subcommand not in methods:
    parser.exit(2, parser.format_help())

run(namespace.game, namespace.subcommand)
