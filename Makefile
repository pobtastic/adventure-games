BUILDDIR = build

OPTIONS  = -d build/html -t

OPTIONS += $(foreach theme,$(THEMES),-T $(theme))
OPTIONS += $(HTML_OPTS)

.PHONY: usage clean blizzardpass jewelsofbabylon warlord
usage:
	@echo "Targets:"
	@echo "  usage           show this help"
	@echo "  blizzardpass    build the Blizzard Pass disassembly"
	@echo "  jewelsofbabylon build the Jewels Of Babylon disassembly"
	@echo "  warlord         build the Warlord disassembly"
	@echo ""
	@echo "Variables:"
	@echo "  THEMES     CSS theme(s) to use"
	@echo "  HTML_OPTS  options passed to skool2html.py"

.PHONY: clean
clean:
	-rm -rf $(BUILDDIR)/*

.PHONY: blizzardpass
blizzardpass:
	if [ ! -f BlizzardPass.z80 ]; then tap2sna.py @blizzardpass.t2s; fi
	sna2skool.py -H -c sources/blizzardpass/blizzardpass.ctl BlizzardPass.z80 > sources/blizzardpass/blizzardpass.skool
	@python -c "import art; art.tprint('Blizzard Pass')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/blizzardpass --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/blizzardpass/blizzardpass.skool sources/blizzardpass/blizzardpass.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/blizzardpass/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/blizzardpass/blizzardpass.skool sources/blizzardpass/blizzardpass.ref

.PHONY: jewelsofbabylon
jewelsofbabylon:
	if [ ! -f JewelsofBabylon.z80 ]; then tap2sna.py @jewelsofbabylon.t2s; fi
	sna2skool.py -H -c sources/jewelsofbabylon/jewelsofbabylon.ctl JewelsofBabylon.z80 > sources/jewelsofbabylon/jewelsofbabylon.skool
	@python -c "import art; art.tprint('Jewels Of Babylon')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/jewelsofbabylon --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/jewelsofbabylon/jewelsofbabylon.skool sources/jewelsofbabylon/jewelsofbabylon.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/jewelsofbabylon/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/jewelsofbabylon/jewelsofbabylon.skool sources/jewelsofbabylon/jewelsofbabylon.ref

.PHONY: warlord
warlord:
	if [ ! -f Warlord.z80 ]; then tap2sna.py @warlord.t2s; fi
	sna2skool.py -H -c sources/warlord/warlord.ctl Warlord.z80 > sources/warlord/warlord.skool
	@python -c "import art; art.tprint('Warlord')"
	skool2html.py $(OPTIONS) -H -c Config/GameDir=adventure-games/warlord --var pub=2 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/warlord/warlord.skool sources/warlord/warlord.ref
	skool2html.py $(OPTIONS) -D -c Config/GameDir=adventure-games/warlord/dec --var pub=4 -c Config/InitModule=$(SKOOLKIT_HOME)/tools:publish sources/warlord/warlord.skool sources/warlord/warlord.ref

all:
	utils/mkhtml.py $(OPTIONS)
.PHONY: all
