#!/usr/bin/env python3
"""Generate skoolkit code for Hobbit location graphic data.

Produces structured annotations grouping bytes by instruction (move, draw line,
fill, paint background, stop).

Usage:
  python hobbit_gfx2skool.py SUBCOMMAND
  python hobbit_gfx2skool.py graphics
  python hobbit_gfx2skool.py gfx_CC43

Graphics opcodes:
  0x00: Stop
  0x08 X Y: Move to X, Y
  0x80-0xFF: Draw line (op + 1 data byte)
  0x40-0x7F X Y: Fill at X, Y
  0x20-0x3F H L N+: Paint background (H, L, then d/n bytes until 0xFF)
"""
import argparse
import os
import sys
from collections import OrderedDict

try:
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna
except ImportError:
    SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
    if SKOOLKIT_HOME and os.path.isdir(SKOOLKIT_HOME):
        sys.path.insert(0, SKOOLKIT_HOME)
        from skoolkit.snapshot import get_snapshot
        from skoolkit import tap2sna
    else:
        raise

ADVENTUREGAMES_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUILD_DIR = '{}/sources/hobbit'.format(ADVENTUREGAMES_HOME)
HOBBIT_Z80 = '{}/HobbitThe.z80'.format(ADVENTUREGAMES_HOME)

# Graphics addresses and metadata from hobbit.ctl.
# (address, title, label_suffix, image_filename, location_id)
GFX_DATA = [
    (0xCC43, "Tunnel Like Hall", "TunnelLikeHall", "tunnel-like-hall.png", "$01"),
    (0xCE77, "Great River", "GreatRiver", "great-river.png", "$31"),
    (0xCFB2, "Trolls Path", "TrollsPath", "trolls-path.png", "$06"),
    (0xD24E, "Narrow Place", "NarrowPlace", "narrow-place.png", "$0B"),
    (0xD367, "Dragons Desolation", "DragonsDesolation", "dragons-desolation.png", "$25"),
    (0xD5B5, "Smooth Straight Passage", "SmoothStraightPassage", "smooth-straight-passage.png", "$2B"),
    (0xD713, "Dale Valley", "DaleValley", "dale-valley.png", "$26"),
    (0xD92A, "Trolls Cave", "TrollsCave", "trolls-cave.png", "$07"),
    (0xDBA8, "Forest Gate", "ForestGate", "forest-gate.png", "$18"),
    (0xDD79, "Lake Town", "LakeTown", "lake-town.png", "$23"),
    (0xE02C, "Goblins Dungeon", "GoblinsDungeon", "goblins-dungeon.png", "$0D"),
    (0xE049, "Dark Dungeon", "DarkDungeon", "dark-dungeon.png", "$1F"),
    (0xE142, "Trolls Clearing", "TrollsClearing", "trolls-clearing.png", "$05"),
    (0xE19F, "Levelled Elvish Clearing", "LevelledElvishClearing", "levelled-elvish-clearing.png", "$1C"),
    (0xE3FE, "Lonelands", "Lonelands", "lonelands.png", "$04"),
    (0xE47A, "Elvenkings Cellar", "ElvenkingsCellar", "elvenkings-cellar.png", "$20"),
    (0xE6E4, "Big Goblins Cavern", "BigGoblinsCavern", "big-goblins-cavern.png", "$10"),
    (0xE9EE, "Bewitched Gloomy Place", "BewitchedGloomyPlace", "bewitched-gloomy-place.png", "$19"),
    (0xEC3E, "Running River", "RunningRiver", "running-river.png", "$08"),
    (0xEE43, "Lower Halls", "LowerHalls", "lower-halls.png", "$29"),
    (0xF001, "Spider Threads Place", "SpiderThreadsPlace", "spider-threads-place.png", "$1A"),
    (0xF1E6, "Front Gate", "FrontGate", "front-gate.png", "$27"),
]
DEFAULT_GFX_ADDRESSES = [a for a, _t, _l, _i, _loc in GFX_DATA]
GFX_BY_ADDR = {a: (title, label, img, loc) for a, title, label, img, loc in GFX_DATA}


def parse_gfx_instructions(snapshot, address, end_address=None):
    """Walk graphics bytecode and yield (addr, length, description) for each instruction.
    If end_address is set, stop before consuming bytesPast it (avoids overlap with next block).
    """
    pc = address
    size = len(snapshot)
    end = end_address if end_address is not None else size

    def past_end(required):
        return pc + required > end or pc + required > size

    # Header: border, colours
    if past_end(2):
        return
    yield pc, 2, "Border: #INK(#PEEK(#PC)). Colours: #COLOUR(#PEEK(#PC+$01))."
    pc += 2

    while pc < size and pc < end:
        addr = pc
        op = snapshot[pc]
        pc += 1

        if op == 0:
            yield addr, 1, "Stop."
            break
        elif op == 0x08:
            if past_end(2):
                yield addr, 1, "Move (incomplete)."
                break
            pc += 2
            yield addr, 3, "Move to X: #N(#PEEK(#PC+$01))/ Y: #N(#PEEK(#PC+$02))."
        elif op > 0x7F:
            if past_end(1):
                yield addr, 1, "Draw line (incomplete)."
                break
            pc += 1
            yield addr, 2, (
                "Draw a line #MAP(#PEEK(#PC)&$07)(?,$00:UP,$01:RIGHT,$02:DOWN,$03:LEFT,"
                "$04:UP-RIGHT,$05:DOWN-RIGHT,$06:DOWN-LEFT,$07:UP-LEFT) "
                "#N(#PEEK(#PC+$01)&$3F) pixels, step every #N((((#PEEK(#PC)&$78)>>1)+((#PEEK(#PC+$01)&$C0)>>6))) pixel(s)."
            )
        elif op > 0x3F:
            if past_end(2):
                yield addr, 1, "Fill (incomplete)."
                break
            pc += 2
            yield addr, 3, "Fill at X: #N(#PEEK(#PC+$01))/ Y: #N(#PEEK(#PC+$02)) with colour #COLOUR(#PEEK(#PC))."
        elif op > 0x1F:
            if past_end(2):
                yield addr, 1, "Paint background (incomplete)."
                break
            pc += 2
            yield addr, 3, (
                "Paint background at attribute buffer location #N((#PEEK(#PC+$01)*$100+#PEEK(#PC+$02))), "
                "colour #COLOUR(#PEEK(#PC))."
            )
            while pc < size and pc < end:
                d = snapshot[pc]
                pc += 1
                if d == 0xFF:
                    yield pc - 1, 1, "Paint terminator."
                    break
                dir_names = ["up", "right", "down", "left"]
                direction = dir_names[d & 0x03] if (d & 0x03) < 4 else "#N(#PEEK(#PC)&$03)"
                yield pc - 1, 1, "Step {}: #N((#PEEK(#PC)&$FC)>>2) steps.".format(direction)
        else:
            yield addr, 1, "Unknown opcode #N(#PEEK(#PC))."


def emit_b_lines(snapshot, address, end_address=None):
    """Emit B directive lines for graphics at address."""
    return [
        f"  ${addr:04X},${length:02X} {desc}"
        for addr, length, desc in parse_gfx_instructions(snapshot, address, end_address)
    ]


class HobbitGfx:
    def __init__(self, snapshot):
        self.snapshot = snapshot

    def get_graphics(self, addresses=None):
        """Emit skool directives for all graphics addresses."""
        addrs = addresses or DEFAULT_GFX_ADDRESSES
        all_lines = []
        for i, addr in enumerate(addrs):
            if addr != addrs[0]:
                all_lines.append("")
            meta = GFX_BY_ADDR.get(addr)
            if meta:
                title, label, img, loc = meta
                all_lines.append(f"b ${addr:04X} Graphics: {title}")
                all_lines.append(f"@ ${addr:04X} label=Graphics_{label}")
                all_lines.append(f"N ${addr:04X} #DRAWING(#PC,scale=$02)({img})")
                all_lines.append(f'N ${addr:04X} Location #LOCATION{loc}: "#LOCATIONNAME{loc}".')
            end_address = addrs[i + 1] if i + 1 < len(addrs) else None
            all_lines.extend(emit_b_lines(self.snapshot, addr, end_address))
        return "\n".join(all_lines)


def run(subcommand):
    if not os.path.isdir(BUILD_DIR):
        os.mkdir(BUILD_DIR)
    if not os.path.isfile(HOBBIT_Z80):
        tap2sna.main(('-d', ADVENTUREGAMES_HOME, '@{}/hobbit.t2s'.format(ADVENTUREGAMES_HOME)))
    hobbit = HobbitGfx(get_snapshot(HOBBIT_Z80))
    method_name, _desc = methods[subcommand]
    ctlfile = '{}/{}.ctl'.format(BUILD_DIR, subcommand)
    with open(ctlfile, 'wt') as f:
        f.write(getattr(hobbit, method_name)())


###############################################################################
# Begin
###############################################################################
methods = OrderedDict((
    ('graphics', ('get_graphics', 'Location graphics B directives (all addresses)')),
))
subcommands = '\n'.join('  {} - {}'.format(k, v[1]) for k, v in methods.items())
parser = argparse.ArgumentParser(
    usage='%(prog)s SUBCOMMAND',
    description="Produce a skool file snippet for Hobbit location graphics. SUBCOMMAND must be one of:\n\n{}".format(
        subcommands),
    formatter_class=argparse.RawTextHelpFormatter,
    add_help=False
)
parser.add_argument('subcommand', help=argparse.SUPPRESS, nargs='?')
namespace, unknown_args = parser.parse_known_args()
if unknown_args or namespace.subcommand not in methods:
    parser.exit(2, parser.format_help())
run(namespace.subcommand)
