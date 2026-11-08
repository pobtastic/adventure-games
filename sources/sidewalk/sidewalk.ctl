; Copyright Infogrames 1987, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @start
@ $4000 org=$4000
> $4000 @rom
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @set-handle-unsupported-macros=1

b $4000 Loading Screen
D $4000 #UDGTABLE
. { =h Sidewalk Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

i $5B00
i $5C00

b $6100 Game Data

c $C800 Game Entry Point
@ $C800 label=GameEntryPoint
