import art
import sys
import os

ADVENTUREGAMES_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BLIZZARDPASS_SKOOL = '{}/sources/blizzardpass/blizzardpass.skool'.format(ADVENTUREGAMES_HOME)
JEWELSOFBABYLON_SKOOL = '{}/sources/jewelsofbabylon/jewelsofbabylon.skool'.format(ADVENTUREGAMES_HOME)
WARLORD_SKOOL = '{}/sources/warlord/warlord.skool'.format(ADVENTUREGAMES_HOME)

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
SKOOLKIT_TOOLS = "{}/tools".format(SKOOLKIT_HOME)
if SKOOLKIT_HOME:
    if not os.path.isdir(SKOOLKIT_HOME):
        sys.stderr.write('SKOOLKIT_HOME={}: directory not found\n'.format(SKOOLKIT_HOME))
        sys.exit(1)
    sys.path.insert(0, SKOOLKIT_HOME)
    from skoolkit import skool2asm, skool2html, sna2skool, tap2sna
else:
    try:
        from skoolkit import skool2asm, skool2html, sna2skool, tap2sna
    except ImportError:
        sys.stderr.write('Error: SKOOLKIT_HOME is not set, and SkoolKit is not installed\n')
        sys.exit(1)

sys.stderr.write("Found SkoolKit in {}\n".format(skool2html.PACKAGE_DIR))

def run_skool2asm():
    skool2asm.main(sys.argv[1:] + [BLIZZARDPASS_SKOOL])
    skool2asm.main(sys.argv[1:] + [JEWELSOFBABYLON_SKOOL])
    skool2asm.main(sys.argv[1:] + [WARLORD_SKOOL])

def run_skool2html():
    options = '-c Config/InitModule={}:publish -d {}/build/html'.format(SKOOLKIT_TOOLS, ADVENTUREGAMES_HOME)

    art.tprint("Blizzard Pass")
    hex = '-H -c Config/GameDir=adventure-games/blizzardpass --var pub=2'
    dec = '-D -c Config/GameDir=adventure-games/blizzardpass/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [BLIZZARDPASS_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [BLIZZARDPASS_SKOOL])

    art.tprint("Jewels Of Babylon")
    hex = '-H -c Config/GameDir=adventure-games/jewelsofbabylon --var pub=2'
    dec = '-D -c Config/GameDir=adventure-games/jewelsofbabylon/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [JEWELSOFBABYLON_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [JEWELSOFBABYLON_SKOOL])

    art.tprint("Warlord")
    hex = '-H -c Config/GameDir=adventure-games/warlord --var pub=2'
    dec = '-D -c Config/GameDir=adventure-games/warlord/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [WARLORD_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [WARLORD_SKOOL])
