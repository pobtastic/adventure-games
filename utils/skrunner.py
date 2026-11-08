# Copyright 2026 Paul Maddern (paul@arcadegeek.co.uk)
import art
import sys
import os

ADVENTUREGAMES_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

AFTERSHOCK_SKOOL = '{}/sources/aftershock/aftershock.skool'.format(ADVENTUREGAMES_HOME)
BLIZZARDPASS_SKOOL = '{}/sources/blizzardpass/blizzardpass.skool'.format(ADVENTUREGAMES_HOME)
FORESTATWORLDSEND_SKOOL = '{}/sources/forestatworldsend/forestatworldsend.skool'.format(ADVENTUREGAMES_HOME)
HEROESOFKHAN_SKOOL = '{}/sources/heroesofkarn/heroesofkarn.skool'.format(ADVENTUREGAMES_HOME)
HOBBIT_SKOOL = '{}/sources/hobbit/hobbit.skool'.format(ADVENTUREGAMES_HOME)
JEWELSOFBABYLON_SKOOL = '{}/sources/jewelsofbabylon/jewelsofbabylon.skool'.format(ADVENTUREGAMES_HOME)
KENTILLA_SKOOL = '{}/sources/kentilla/kentilla.skool'.format(ADVENTUREGAMES_HOME)
MESSAGEFROMANDROMEDA_SKOOL  = '{}/sources/messagefromandromeda/messagefromandromeda.skool'.format(ADVENTUREGAMES_HOME)
SHERLOCK_SKOOL  = '{}/sources/sherlock/sherlock.skool'.format(ADVENTUREGAMES_HOME)
SIDEWALK_SKOOL = '{}/sources/sidewalk/sidewalk.skool'.format(ADVENTUREGAMES_HOME)
SIDNEYAFFAIR_SKOOL = '{}/sources/sidneyaffair/sidneyaffair.skool'.format(ADVENTUREGAMES_HOME)
THEINHERITANCE_PART1_SKOOL = '{}/sources/theinheritancepanicinlasvegas/theinheritancepart1.skool'.format(ADVENTUREGAMES_HOME)
THEINHERITANCE_PART2_SKOOL = '{}/sources/theinheritancepanicinlasvegas/theinheritancepart2.skool'.format(ADVENTUREGAMES_HOME)
VELNORSLAIR_SKOOL = '{}/sources/velnorslair/velnorslair.skool'.format(ADVENTUREGAMES_HOME)
VERACRUZ_SKOOL = '{}/sources/veracruz/veracruz.skool'.format(ADVENTUREGAMES_HOME)
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
    skool2asm.main(sys.argv[1:] + [AFTERSHOCK_SKOOL])
    skool2asm.main(sys.argv[1:] + [BLIZZARDPASS_SKOOL])
    skool2asm.main(sys.argv[1:] + [FORESTATWORLDSEND_SKOOL])
    skool2asm.main(sys.argv[1:] + [HEROESOFKHAN_SKOOL])
    skool2asm.main(sys.argv[1:] + [HOBBIT_SKOOL])
    skool2asm.main(sys.argv[1:] + [JEWELSOFBABYLON_SKOOL])
    skool2asm.main(sys.argv[1:] + [KENTILLA_SKOOL])
    skool2asm.main(sys.argv[1:] + [MESSAGEFROMANDROMEDA_SKOOL])
    skool2asm.main(sys.argv[1:] + [SHERLOCK_SKOOL])
    skool2asm.main(sys.argv[1:] + [SIDEWALK_SKOOL])
    skool2asm.main(sys.argv[1:] + [SIDNEYAFFAIR_SKOOL])
    skool2asm.main(sys.argv[1:] + [THEINHERITANCE_PART1_SKOOL])
    skool2asm.main(sys.argv[1:] + [THEINHERITANCE_PART2_SKOOL])
    skool2asm.main(sys.argv[1:] + [VELNORSLAIR_SKOOL])
    skool2asm.main(sys.argv[1:] + [VERACRUZ_SKOOL])
    skool2asm.main(sys.argv[1:] + [WARLORD_SKOOL])

def run_skool2html():
    options = '-c Config/InitModule={}:publish -d {}/build/html'.format(SKOOLKIT_TOOLS, ADVENTUREGAMES_HOME)

    art.tprint("After Shock")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/aftershock --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/aftershock/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [AFTERSHOCK_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [AFTERSHOCK_SKOOL])

    art.tprint("Blizzard Pass")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/blizzardpass --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/blizzardpass/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [BLIZZARDPASS_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [BLIZZARDPASS_SKOOL])

    art.tprint("Forest at World's End")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/forestatworldsend --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/forestatworldsend/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [FORESTATWORLDSEND_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [FORESTATWORLDSEND_SKOOL])

    art.tprint("Heroes Of Karn")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/heroesofkarn --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/heroesofkarn/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [HEROESOFKHAN_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [HEROESOFKHAN_SKOOL])

    art.tprint("The Hobbit")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/hobbit --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/hobbit/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [HOBBIT_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [HOBBIT_SKOOL])

    art.tprint("Jewels Of Babylon")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/jewelsofbabylon --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/jewelsofbabylon/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [JEWELSOFBABYLON_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [JEWELSOFBABYLON_SKOOL])

    art.tprint("Kentilla")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/kentilla --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/kentilla/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [KENTILLA_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [KENTILLA_SKOOL])

    art.tprint("Message From Andromeda")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/messagefromandromeda --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/messagefromandromeda/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [MESSAGEFROMANDROMEDA_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [MESSAGEFROMANDROMEDA_SKOOL])

    art.tprint("Sherlock")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/sherlock --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/sherlock/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [SHERLOCK_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [SHERLOCK_SKOOL])

    art.tprint("Sidewalk")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/sidewalk --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/sidewalk/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [SIDEWALK_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [SIDEWALK_SKOOL])

    art.tprint("The Sidney Affair")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/sidneyaffair --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/sidneyaffair/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [SIDNEYAFFAIR_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [SIDNEYAFFAIR_SKOOL])

    art.tprint("The Inheritance: Panic in Las Vegas")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part1 --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part1/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [THEINHERITANCE_PART1_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [THEINHERITANCE_PART1_SKOOL])
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part2 --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part2/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [THEINHERITANCE_PART2_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [THEINHERITANCE_PART2_SKOOL])

    art.tprint("Velnor's Lair")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/velnorslair --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/velnorslair/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [VELNORSLAIR_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [VELNORSLAIR_SKOOL])

    art.tprint("Vera Cruz")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/veracruz --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/veracruz/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [VERACRUZ_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [VERACRUZ_SKOOL])

    art.tprint("Warlord")
    hex = '-H --ini ListRefs=2 -c Config/GameDir=adventure-games/warlord --var pub=2'
    dec = '-D --ini ListRefs=2 -c Config/GameDir=adventure-games/warlord/dec --var pub=4'
    skool2html.main(options.split() + hex.split() + sys.argv[1:] + [WARLORD_SKOOL])
    skool2html.main(options.split() + dec.split() + sys.argv[1:] + [WARLORD_SKOOL])
