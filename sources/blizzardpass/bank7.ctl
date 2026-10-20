> $C000 @org=$C000

s $C000 Unused Bank 7
@ $C000 label=UnusedBank7
D $C000 Not the picture bytecode, and not the bank paged at #N$C000 in the
. resting snapshot or during play. That window is bank 0: port #N$7FFD holds
. #N($10), and the game's saved page value at #N$66D7 is #N$10. The page
. routine at #N$66BD ORs #N$10 and writes the port, and it is only ever asked
. for banks 0, 3 and 6. The BASIC loader does OUT 32765,23 so that LOAD runs
. with this bank visible, but the copier then writes the adventure into banks
. 6, 3 and 0 and pages bank 0 back. Nothing is copied here, so the body is
. zero.
  $C000,$3F18

b $FF18 BASIC Residue In Bank 7
@ $FF18 label=Bank7Residue
D $FF18 128 BASIC had already left its character set and a few words at the
. top of this bank while it was paged at #N$C000. They survive because the
. game never writes bank 7 after that OUT. The same addresses in bank 0 hold
. a different fragment plus the start-up routine. This copy is not game code.
  $FF18,$E8
