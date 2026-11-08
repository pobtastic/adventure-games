; Copyright Infogrames 1985, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $5CCB @start
> $5CCB @remote=main:$4000
> $5CCB @remote=main:$8000
> $5CCB @remote=main:$FB00
b $5CCB BASIC Loader
@ $5CCB label=BasicLoader
D $5CCB The BASIC program "Vera Cruz" on the part 1 tape. It autostarts at line
. 10.
D $5CCB #LIST { Line 20 loads the first CODE block at #N($8000,$04,$04): a copy
. of #R$8000@main(DrawPicture) followed by the title card picture. } {
. Line 30 draws the title card (picture #N$01) straight onto the screen;
. see #R$4000@main(Loading). } { Line 40 prints "First Part" over it. } {
. Line 60 loads the main code block at #N($8000,$04,$04). } { Line 80
. loads the code block at #N($FB00,$04,$04) (see
. #R$FB00@main(DisplayFrame)). } { Line 120 loads the game itself, which
. is written in BASIC. } LIST#
B $5CCB,$54 Line 10: CLEAR 32767: BORDER 7: PAPER 7: BRIGHT 1: POKE
. 23624,BIN 01111111: INK 7: CLS
B $5D1F,$09 Line 20: LOAD ""CODE
B $5D28,$27 Line 30: POKE 32770,1: RANDOMIZE USR 32768
B $5D4F,$35 Line 40: PRINT AT 4,4; INK 2; BRIGHT 1;"First Part"
B $5D84,$17 Line 50: PRINT AT 0,0;
B $5D9B,$09 Line 60: LOAD ""CODE
B $5DA4,$17 Line 70: PRINT AT 0,0;
B $5DBB,$09 Line 80: LOAD ""CODE
B $5DC4,$17 Line 110: PRINT AT 0,0;
B $5DDB,$1E Line 120: POKE 23689,25: LOAD ""

i $5DF9
