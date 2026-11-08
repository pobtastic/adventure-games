; Copyright Infogrames 1985, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $5CCB @start
> $5CCB @remote=main:$4000
> $5CCB @remote=main:$C350
> $5CCB @remote=main:$FB00
> $5CCB @remote=main:$FCA0
> $5CCB @remote=main:$FD0E
b $5CCB BASIC Loader
@ $5CCB label=BasicLoader
D $5CCB The BASIC program "Vera Cruz" on the part 2 tape. It autostarts at line
. 10.
D $5CCB #LIST { Line 20 loads the first CODE block at #N($C350,$04,$04): a copy
. of #R$C350@main(DrawPicture) followed by the title card picture. } {
. Line 30 draws the title card (picture #N$01) straight onto the screen;
. see #R$4000@main(Loading). } { Line 40 prints "Second Part" over it. } {
. Lines 50-80 load the main code block at #N($C350,$04,$04), then the code
. blocks at #N($FB00,$04,$04) (see #R$FB00@main(DisplayFrame)),
. #N($FCA0,$04,$04) (see #R$FCA0@main(ScrollWindow)) and #N($FD0E,$04,$04)
. (see #R$FD0E@main(PrintString)). } { Line 100 loads the game itself,
. which is written in BASIC. } LIST#
B $5CCB,$60 Line 10: POKE 23659,2: CLEAR 49999: PAPER 7: BRIGHT 1: POKE
. 23624,BIN 01111111: INK 7: CLS
B $5D2B,$09 Line 20: LOAD ""CODE
B $5D34,$27 Line 30: POKE 50002,1: RANDOMIZE USR 50000
B $5D5B,$36 Line 40: PRINT AT 4,3; INK 2; BRIGHT 1;"Second Part"
B $5D91,$1C Line 50: PRINT AT 0,0;: LOAD ""CODE
B $5DAD,$1C Line 60: PRINT AT 0,0;: LOAD ""CODE
B $5DC9,$1C Line 70: PRINT AT 0,0;: LOAD ""CODE
B $5DE5,$1C Line 80: PRINT AT 0,0;: LOAD ""CODE
B $5E01,$1A Line 90: POKE 23689,25
B $5E1B,$1B Line 100: PRINT AT 0,0;: LOAD ""

i $5E36
