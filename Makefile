# Copyright 2026 Paul Maddern (paul@arcadegeek.co.uk)
BUILDDIR = build

OPTIONS  = -d build/html -t

OPTIONS += $(foreach theme,$(THEMES),-T $(theme))
OPTIONS += $(HTML_OPTS)

.PHONY: usage clean aftershock blizzardpass forestatworldsend heroesofkarn hobbit jewelsofbabylon kentilla messagefromandromeda sherlock sidewalk sidneyaffair sidneyaffairside2 theinheritancepanicinlasvegas velnorslair veracruz veracruzpart2 warlord
usage:
	@echo "Targets:"
	@echo "  usage                         show this help"
	@echo "  aftershock                    build the After Shock disassembly"
	@echo "  blizzardpass                  build the Blizzard Pass disassembly"
	@echo "  forestatworldsend             build the Forest At World's End disassembly"
	@echo "  heroesofkarn                  build the Heroes Of Karn disassembly"
	@echo "  hobbit                        build the The Hobbit disassembly"
	@echo "  jewelsofbabylon               build the Jewels Of Babylon disassembly"
	@echo "  kentilla                      build the Kentilla disassembly"
	@echo "  messagefromandromeda          build the Message from Andromeda disassembly"
	@echo "  sherlock                      build the Sherlock disassembly"
	@echo "  sidewalk                      build the Sidewalk disassembly"
	@echo "  sidneyaffair                  build The Sidney Affair disassembly"
	@echo "  sidneyaffairside2             build The Sidney Affair (side 2) disassembly"
	@echo "  theinheritancepanicinlasvegas build The Inheritance: Panic in Las Vegas disassembly"
	@echo "  velnorslair                   build the Velnor's Lair disassembly"
	@echo "  veracruz                      build the Vera Cruz disassembly"
	@echo "  veracruzpart2                 build the Vera Cruz (part 2) disassembly"
	@echo "  warlord                       build the Warlord disassembly"
	@echo ""
	@echo "Variables:"
	@echo "  THEMES     CSS theme(s) to use"
	@echo "  HTML_OPTS  options passed to skool2html.py"

.PHONY: clean
clean:
	-rm -rf $(BUILDDIR)/*

.PHONY: aftershock
aftershock:
	if [ ! -f AfterShock.z80 ]; then tap2sna.py @aftershock.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/aftershock/aftershock.ctl AfterShock.z80 > sources/aftershock/aftershock.skool
	@python -c "import art; art.tprint('After Shock')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/aftershock --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/aftershock/aftershock.skool sources/aftershock/aftershock.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/aftershock/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/aftershock/aftershock.skool sources/aftershock/aftershock.ref

.PHONY: blizzardpass
blizzardpass:
	if [ ! -f BlizzardPass.z80 ]; then tap2sna.py @blizzardpass.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/blizzardpass/bank3.ctl -p 3 -s 49152 -e 65536 BlizzardPass.z80 > sources/blizzardpass/bank3.skool
	sna2skool.py -H --ini ListRefs=2 -c sources/blizzardpass/bank6.ctl -p 6 -s 49152 -e 65536 BlizzardPass.z80 > sources/blizzardpass/bank6.skool
	sna2skool.py -H --ini ListRefs=2 -c sources/blizzardpass/bank7.ctl -p 7 -s 49152 -e 65536 BlizzardPass.z80 > sources/blizzardpass/bank7.skool
	sna2skool.py -H --ini ListRefs=2 -c sources/blizzardpass/blizzardpass.ctl BlizzardPass.z80 > sources/blizzardpass/blizzardpass.skool
	@python -c "import art; art.tprint('Blizzard Pass')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/blizzardpass --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/blizzardpass/blizzardpass.skool sources/blizzardpass/blizzardpass.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/blizzardpass/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/blizzardpass/blizzardpass.skool sources/blizzardpass/blizzardpass.ref

.PHONY: forestatworldsend
forestatworldsend:
	if [ ! -f ForestAtWorldsEnd.z80 ]; then tap2sna.py @forestatworldsend.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/forestatworldsend/forestatworldsend.ctl ForestAtWorldsEnd.z80 > sources/forestatworldsend/forestatworldsend.skool
	@python -c "import art; art.tprint('Forest At World\'s End')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/forestatworldsend --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/forestatworldsend/forestatworldsend.skool sources/forestatworldsend/forestatworldsend.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/forestatworldsend/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/forestatworldsend/forestatworldsend.skool sources/forestatworldsend/forestatworldsend.ref

.PHONY: heroesofkarn
heroesofkarn:
	if [ ! -f HeroesOfKarn.z80 ]; then tap2sna.py @heroesofkarn.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/heroesofkarn/heroesofkarn.ctl HeroesOfKarn.z80 > sources/heroesofkarn/heroesofkarn.skool
	@python -c "import art; art.tprint('Heroes Of Karn')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/heroesofkarn --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/heroesofkarn/heroesofkarn.skool sources/heroesofkarn/heroesofkarn.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/heroesofkarn/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/heroesofkarn/heroesofkarn.skool sources/heroesofkarn/heroesofkarn.ref

.PHONY: hobbit
hobbit:
	if [ ! -f HobbitThe.z80 ]; then tap2sna.py @hobbit.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/hobbit/hobbit.ctl HobbitThe.z80 > sources/hobbit/hobbit.skool
	@python -c "import art; art.tprint('The Hobbit')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/hobbit --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/hobbit/hobbit.skool sources/hobbit/hobbit.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/hobbit/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/hobbit/hobbit.skool sources/hobbit/hobbit.ref

.PHONY: jewelsofbabylon
jewelsofbabylon:
	if [ ! -f JewelsofBabylon.z80 ]; then tap2sna.py @jewelsofbabylon.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/jewelsofbabylon/jewelsofbabylon.ctl JewelsofBabylon.z80 > sources/jewelsofbabylon/jewelsofbabylon.skool
	@python -c "import art; art.tprint('Jewels Of Babylon')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/jewelsofbabylon --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/jewelsofbabylon/jewelsofbabylon.skool sources/jewelsofbabylon/jewelsofbabylon.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/jewelsofbabylon/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/jewelsofbabylon/jewelsofbabylon.skool sources/jewelsofbabylon/jewelsofbabylon.ref

.PHONY: kentilla
kentilla:
	if [ ! -f Kentilla.z80 ]; then tap2sna.py @kentilla.t2s; fi
	if [ ! -f Kentilla-bootstrap.z80 ]; then tap2sna.py @kentilla-bootstrap.t2s; fi
	if [ ! -f Kentilla-loader.z80 ]; then tap2sna.py @kentilla-loader.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/kentilla/kentilla.ctl Kentilla.z80 > sources/kentilla/kentilla.skool
	sna2skool.py -H --ini ListRefs=2 -c sources/kentilla/loader.ctl Kentilla-loader.z80 > sources/kentilla/loader.skool
	@python -c "import art; art.tprint('Kentilla')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/kentilla --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/kentilla/kentilla.skool sources/kentilla/kentilla.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/kentilla/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/kentilla/kentilla.skool sources/kentilla/kentilla.ref

.PHONY: messagefromandromeda
messagefromandromeda:
	if [ ! -f MessageFromAndromeda.z80 ]; then tap2sna.py @messagefromandromeda.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/messagefromandromeda/messagefromandromeda.ctl MessageFromAndromeda.z80 > sources/messagefromandromeda/messagefromandromeda.skool
	@python -c "import art; art.tprint('Message From Andromeda')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/messagefromandromeda --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/messagefromandromeda/messagefromandromeda.skool sources/messagefromandromeda/messagefromandromeda.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/messagefromandromeda/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/messagefromandromeda/messagefromandromeda.skool sources/messagefromandromeda/messagefromandromeda.ref

.PHONY: sherlock
sherlock:
	if [ ! -f Sherlock.z80 ]; then tap2sna.py @sherlock.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/sherlock/sherlock.ctl Sherlock.z80 > sources/sherlock/sherlock.skool
	@python -c "import art; art.tprint('Sherlock')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/sherlock --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sherlock/sherlock.skool sources/sherlock/sherlock.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/sherlock/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sherlock/sherlock.skool sources/sherlock/sherlock.ref

.PHONY: sidewalk
sidewalk:
	if [ ! -f Sidewalk.z80 ]; then tap2sna.py @sidewalk.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/sidewalk/sidewalk.ctl Sidewalk.z80 > sources/sidewalk/sidewalk.skool
	@python -c "import art; art.tprint('Sidewalk')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/sidewalk --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sidewalk/sidewalk.skool sources/sidewalk/sidewalk.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/sidewalk/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sidewalk/sidewalk.skool sources/sidewalk/sidewalk.ref

.PHONY: sidneyaffair
sidneyaffair:
	if [ ! -f SidneyAffairSide1.z80 ]; then tap2sna.py @sidneyaffair-side1.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/sidneyaffair/sidneyaffair.ctl SidneyAffairSide1.z80 > sources/sidneyaffair/sidneyaffair.skool
	@python -c "import art; art.tprint('The Sidney Affair')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/sidneyaffair --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sidneyaffair/sidneyaffair.skool sources/sidneyaffair/sidneyaffair.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/sidneyaffair/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sidneyaffair/sidneyaffair.skool sources/sidneyaffair/sidneyaffair.ref

.PHONY: sidneyaffairside2
sidneyaffairside2:
	if [ ! -f SidneyAffairSide2.z80 ]; then tap2sna.py @sidneyaffair-side2.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/sidneyaffair/side2.ctl SidneyAffairSide2.z80 > sources/sidneyaffair/side2.skool
	@python -c "import art; art.tprint('The Sidney Affair 2')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/sidneyaffair/side2 --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sidneyaffair/side2.skool sources/sidneyaffair/side2.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/sidneyaffair/side2/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/sidneyaffair/side2.skool sources/sidneyaffair/side2.ref

.PHONY: theinheritancepanicinlasvegas
theinheritancepanicinlasvegas:
	if [ ! -f TheInheritancePart1.z80 ]; then tap2sna.py @theinheritance-part1.t2s; fi
	if [ ! -f TheInheritancePart2.z80 ]; then tap2sna.py @theinheritance-part2.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/theinheritancepanicinlasvegas/theinheritancepart1.ctl TheInheritancePart1.z80 > sources/theinheritancepanicinlasvegas/theinheritancepart1.skool
	sna2skool.py -H --ini ListRefs=2 -c sources/theinheritancepanicinlasvegas/theinheritancepart2.ctl TheInheritancePart2.z80 > sources/theinheritancepanicinlasvegas/theinheritancepart2.skool
	@python -c "import art; art.tprint('The Inheritance: Panic in Las Vegas')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part1 --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/theinheritancepanicinlasvegas/theinheritancepart1.skool sources/theinheritancepanicinlasvegas/theinheritancepart1.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part1/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/theinheritancepanicinlasvegas/theinheritancepart1.skool sources/theinheritancepanicinlasvegas/theinheritancepart1.ref
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part2 --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/theinheritancepanicinlasvegas/theinheritancepart2.skool sources/theinheritancepanicinlasvegas/theinheritancepart2.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/theinheritancepanicinlasvegas/part2/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/theinheritancepanicinlasvegas/theinheritancepart2.skool sources/theinheritancepanicinlasvegas/theinheritancepart2.ref

.PHONY: velnorslair
velnorslair:
	if [ ! -f VelnorsLair.z80 ]; then tap2sna.py @velnorslair.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/velnorslair/velnorslair.ctl VelnorsLair.z80 > sources/velnorslair/velnorslair.skool
	@python -c "import art; art.tprint('Velnor\'s Lair')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/velnorslair --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/velnorslair/velnorslair.skool sources/velnorslair/velnorslair.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/velnorslair/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/velnorslair/velnorslair.skool sources/velnorslair/velnorslair.ref

.PHONY: veracruz
veracruz:
	if [ ! -f VeraCruzPart1.z80 ]; then tap2sna.py @veracruz-part1.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/veracruz/veracruz.ctl VeraCruzPart1.z80 > sources/veracruz/veracruz.skool
	@python -c "import art; art.tprint('Vera Cruz')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/veracruz --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/veracruz/veracruz.skool sources/veracruz/veracruz.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/veracruz/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/veracruz/veracruz.skool sources/veracruz/veracruz.ref

.PHONY: veracruzpart2
veracruzpart2:
	if [ ! -f VeraCruzPart2.z80 ]; then tap2sna.py @veracruz-part2.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/veracruz/part2.ctl VeraCruzPart2.z80 > sources/veracruz/part2.skool
	@python -c "import art; art.tprint('Vera Cruz 2')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/veracruz/part2 --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/veracruz/part2.skool sources/veracruz/part2.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/veracruz/part2/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/veracruz/part2.skool sources/veracruz/part2.ref

.PHONY: warlord
warlord:
	if [ ! -f Warlord.z80 ]; then tap2sna.py @warlord.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/warlord/warlord.ctl Warlord.z80 > sources/warlord/warlord.skool
	@python -c "import art; art.tprint('Warlord')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/warlord --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/warlord/warlord.skool sources/warlord/warlord.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/warlord/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/warlord/warlord.skool sources/warlord/warlord.ref

all:
	utils/mkhtml.py $(OPTIONS)
.PHONY: all
