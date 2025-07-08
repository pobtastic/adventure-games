BUILDDIR = build

OPTIONS  = -d build/html -t

OPTIONS += $(foreach theme,$(THEMES),-T $(theme))
OPTIONS += $(HTML_OPTS)

.PHONY: usage clean aftershock blizzardpass forestatworldsend heroesofkarn jewelsofbabylon messagefromandromeda warlord
usage:
	@echo "Targets:"
	@echo "  usage                show this help"
	@echo "  aftershock           build the After Shock disassembly"
	@echo "  blizzardpass         build the Blizzard Pass disassembly"
	@echo "  forestatworldsend    build the Forest At World's End disassembly"
	@echo "  heroesofkarn         build the Heroes Of Karn disassembly"
	@echo "  jewelsofbabylon      build the Jewels Of Babylon disassembly"
	@echo "  messagefromandromeda build the Message from Andromeda disassembly"
	@echo "  warlord              build the Warlord disassembly"
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

.PHONY: jewelsofbabylon
jewelsofbabylon:
	if [ ! -f JewelsofBabylon.z80 ]; then tap2sna.py @jewelsofbabylon.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/jewelsofbabylon/jewelsofbabylon.ctl JewelsofBabylon.z80 > sources/jewelsofbabylon/jewelsofbabylon.skool
	@python -c "import art; art.tprint('Jewels Of Babylon')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/jewelsofbabylon --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/jewelsofbabylon/jewelsofbabylon.skool sources/jewelsofbabylon/jewelsofbabylon.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/jewelsofbabylon/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/jewelsofbabylon/jewelsofbabylon.skool sources/jewelsofbabylon/jewelsofbabylon.ref

.PHONY: messagefromandromeda
messagefromandromeda:
	if [ ! -f MessageFromAndromeda.z80 ]; then tap2sna.py @messagefromandromeda.t2s; fi
	sna2skool.py -H --ini ListRefs=2 -c sources/messagefromandromeda/messagefromandromeda.ctl MessageFromAndromeda.z80 > sources/messagefromandromeda/messagefromandromeda.skool
	@python -c "import art; art.tprint('Message From Andromeda')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/messagefromandromeda --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/messagefromandromeda/messagefromandromeda.skool sources/messagefromandromeda/messagefromandromeda.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/messagefromandromeda/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/messagefromandromeda/messagefromandromeda.skool sources/messagefromandromeda/messagefromandromeda.ref

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
