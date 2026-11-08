; Copyright Infogrames 1987, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $5CCB @start
> $5CCB @remote=main:$4000
> $5CCB @remote=main:$8000
> $5CCB @remote=main:$FB09
> $5CCB @remote=main:$FF57
b $5CCB BASIC Loader
@ $5CCB label=BasicLoader
D $5CCB The BASIC program "SIDNEY" on the side 1 tape. It autostarts at line
. 10.
D $5CCB #LIST { Line 20 loads the first CODE block at #N($8000,$04,$04): a copy
. of #R$8000@main(DrawPicture) followed by the title card picture. } {
. Line 30 draws the title card (picture #N$01) straight onto the screen;
. see #R$4000@main(Loading). } { Line 60 loads the main code block at
. #N($8000,$04,$04). } { Line 80 loads the code block at #N($FB00,$04,$04)
. (see #R$FB09@main(DisplayFrame)). } { Line 120 loads the game itself,
. which is written in BASIC. } LIST#
B $5CCB,$54 Line 10: CLEAR 32767: BORDER 7: PAPER 7: BRIGHT 0: POKE
. 23624,BIN 00111111: INK 7: CLS
B $5D1F,$09 Line 20: LOAD ""CODE
B $5D28,$30 Line 30: POKE 32770,1: RANDOMIZE USR 32768: BRIGHT 1
B $5D58,$1C Line 60: PRINT AT 0,0;: LOAD ""CODE
B $5D74,$1C Line 80: PRINT AT 0,0;: LOAD ""CODE
B $5D90,$1A Line 110: POKE 23689,25
B $5DAA,$1C Line 120: PRINT AT 0,0;: LOAD ""CODE

i $5DC6
