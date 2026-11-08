# Copyright 2026 Paul Maddern (paul@arcadegeek.co.uk)
#
# tap2sna.py --ram call helper for The Sidney Affair side 2.
# Draws picture 2 (the side 2 title path in lines 22-24 of side 1) onto the
# screen so the snapshot has a loading screen for #SCR.

from skoolkit import ROM48
from skoolkit.simulator import Simulator

def prepare(snapshot):
    rom = open(ROM48, 'rb').read()
    mem = bytearray(snapshot)
    mem[:16384] = rom
    mem[0xC352] = 2
    for i in range(0x4000, 0x5B00):
        mem[i] = 0
    sim = Simulator(mem, registers={'SP': 0xC340}, state={'iff': 0, 'im': 1})
    sim.run(0xC350, 0xC433)
    snapshot[0x4000:0x5B00] = sim.memory[0x4000:0x5B00]
