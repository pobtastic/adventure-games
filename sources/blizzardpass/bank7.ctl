; Copyright Adventuresoft UK Ltd 1986, 2026 ArcadeGeek LTD.
> $C000 @org=$C000
> $C000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
> $C000 @remote=main:$66BD
> $C000 @remote=main:$66D7
> $C000 @remote=main:$FFDC

s $C000 Unused Bank 7
@ $C000 label=UnusedBank7
D $C000 Not the picture bytecode, and not the bank paged at #N$C000 in the
. resting snapshot or during play. That window is bank 0: port #N$7FFD holds
. #N($10), and the game's saved page value at #R$66D7@main(PagedBank) is #N$10.
. The page routine at #R$66BD@main(PageBank) ORs #N$10 and writes the port, and
. it is only ever asked for banks 0, 3 and 6. The BASIC loader does OUT 32765,23
. so that LOAD runs with this bank visible, but the copier then writes the
. adventure into banks 6, 3 and 0 and pages bank 0 back. Nothing is copied here,
. so the body is zero.
  $C000,$3F18

b $FF18 Machine Stack
@ $FF18 label=MachineStack
D $FF18 Leftover 128 BASIC machine stack and GO SUB stack, from the stack
. pointer up to #SKOOLKID$5CB2(RAMTOP). Frozen when the loader paged this bank
. out. The words are ROM return addresses and screen pointers, not game data.
  $FF18,$40,$02

b $FF58 User-Defined Graphics
@ $FF58 label=UDG
D $FF58 The default UDGs copied from the ROM (letters A-U), pointed to by
. #SKOOLKID$5C7B(UDG). The glyph plotter uses the ROM font, not this copy. Bank
. 0 holds a truncated fragment at the same addresses, overwritten by
. #R$FFDC@main(StartGame).
N $FF58 UDG A (CHR$ #N$90).
  $FF58,$08 #UDG(#PC)
N $FF60 UDG B (CHR$ #N$91).
  $FF60,$08 #UDG(#PC)
N $FF68 UDG C (CHR$ #N$92).
  $FF68,$08 #UDG(#PC)
N $FF70 UDG D (CHR$ #N$93).
  $FF70,$08 #UDG(#PC)
N $FF78 UDG E (CHR$ #N$94).
  $FF78,$08 #UDG(#PC)
N $FF80 UDG F (CHR$ #N$95).
  $FF80,$08 #UDG(#PC)
N $FF88 UDG G (CHR$ #N$96).
  $FF88,$08 #UDG(#PC)
N $FF90 UDG H (CHR$ #N$97).
  $FF90,$08 #UDG(#PC)
N $FF98 UDG I (CHR$ #N$98).
  $FF98,$08 #UDG(#PC)
N $FFA0 UDG J (CHR$ #N$99).
  $FFA0,$08 #UDG(#PC)
N $FFA8 UDG K (CHR$ #N$9A).
  $FFA8,$08 #UDG(#PC)
N $FFB0 UDG L (CHR$ #N$9B).
  $FFB0,$08 #UDG(#PC)
N $FFB8 UDG M (CHR$ #N$9C).
  $FFB8,$08 #UDG(#PC)
N $FFC0 UDG N (CHR$ #N$9D).
  $FFC0,$08 #UDG(#PC)
N $FFC8 UDG O (CHR$ #N$9E).
  $FFC8,$08 #UDG(#PC)
N $FFD0 UDG P (CHR$ #N$9F).
  $FFD0,$08 #UDG(#PC)
N $FFD8 UDG Q (CHR$ #N$A0).
  $FFD8,$08 #UDG(#PC)
N $FFE0 UDG R (CHR$ #N$A1).
  $FFE0,$08 #UDG(#PC)
N $FFE8 UDG S (CHR$ #N$A2).
  $FFE8,$08 #UDG(#PC)
N $FFF0 UDG T (CHR$ #N$A3).
  $FFF0,$08 #UDG(#PC)
N $FFF8 UDG U (CHR$ #N$A4).
  $FFF8,$08 #UDG(#PC)
