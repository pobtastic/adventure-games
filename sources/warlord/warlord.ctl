; Copyright Adventuresoft UK Ltd 1985, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
> $4000 @expand=#DEF(#POKE #LINK:Pokes)
> $4000 @expand=#DEF(#FACT #LINK:Facts)
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Warlord Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B00 Tape Loader
@ $5B00 label=TapeLoader
N $5B00 Load the first block: screen data.
  $5B00,$04 #REGix=#R$4000(#N$4000).
  $5B04,$03 #REGde=#N$1B00.
  $5B07,$02 #REGa=#N$52.
  $5B09,$03 Call #R$5B21.
N $5B0C Load the second block: graphics data.
  $5B0C,$04 #REGix=#R$61A8.
  $5B10,$03 #REGde=#N$4389.
  $5B13,$02 #REGa=#N$2A.
  $5B15,$03 Call #R$5B21.
N $5B18 Load the third block: game data.
  $5B18,$04 #REGix=#R$A531.
  $5B1C,$03 #REGde=#N$5A27.
  $5B1F,$02 #REGa=#N$A0.
N $5B21 Tape loading routine.
@ $5B21 label=TapeLoading
  $5B21,$01 Set the carry flag to indicate "loading".
  $5B22,$01 This resets the zero flag. (#REGd cannot hold +#N$FF.)
  $5B23,$01 The #REGa register holds +#N$00 for a header and +#N$FF for a block
. of data. The carry flag is reset for verifying and set for loading.
  $5B24,$01 Restore #REGd to its original value.
  $5B25,$01 Disable interrupts.
  $5B26,$04 Set the border to #INK$0F.
  $5B2A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0556.html#0562">LD_BYTES##N$0562</a>.)
  $5B2D,$01 Stash #REGaf on the stack.
  $5B2E,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C48.html">BORDCR</a>.)
  $5B31,$02,b$01 Keep only bits 3-5.
  $5B33,$06 Rotate #REGa right (with carry).
  $5B39,$02 Set border to the colour held by #REGa.
  $5B3B,$02 #REGa=#N$7F.
  $5B3D,$02 Make an initial read of port '#N$FE'.
  $5B3F,$01 Rotate the byte obtained.
  $5B40,$01 Enable interrupts.
  $5B41,$03 #HTML(Jump to <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0000.html">START</a> if the carry flag is not set.)
  $5B44,$01 Restore #REGaf from the stack.
  $5B45,$01 Return if the carry flag is set.
  $5B46,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C53.html">PROG</a>.)
  $5B49,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C4B.html">VARS</a>.)
  $5B4C,$02 Write #N$80 to *#REGhl.
  $5B4E,$01 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0008.html">ERROR_1</a>.)

u $5B4F

b $61A8 Graphics: Mountains
@ $61A8 label=Image_Mountains
D $61A8 #SIM(start=$5B46,stop=$5B4E)#SIM(start=$A54E,stop=$A554) #PUSHS #UDGTABLE
. { =h Mountains }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(mountains) }
. UDGTABLE# #POPS
  $61A8

b $6A34 Graphics: Beach
@ $6A34 label=Image_Beach
D $6A34 #PUSHS #UDGTABLE
. { =h Beach }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(beach) }
. UDGTABLE# #POPS
  $6A34

b $704F Graphics: Altar
@ $704F label=Image_Altar
D $704F #PUSHS #UDGTABLE
. { =h Altar }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(altar) }
. UDGTABLE# #POPS
  $704F

b $75DD Graphics: Cart
@ $75DD label=Image_Cart
D $75DD #PUSHS #UDGTABLE
. { =h Cart }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(cart) }
. UDGTABLE# #POPS
  $75DD

b $7C8D Graphics: Huts
@ $7C8D label=Image_Huts
D $7C8D #PUSHS #UDGTABLE
. { =h Huts }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(huts) }
. UDGTABLE# #POPS
  $7C8D

b $8492 Graphics: Village
@ $8492 label=Image_Village
D $8492 #PUSHS #UDGTABLE
. { =h Village }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(village) }
. UDGTABLE# #POPS
  $8492

b $8AF3 Graphics: Cave
@ $8AF3 label=Image_Cave
D $8AF3 #PUSHS #UDGTABLE
. { =h Cave }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(cave) }
. UDGTABLE# #POPS
  $8AF3

b $915F Graphics: Henge
@ $915F label=Image_Henge
D $915F #PUSHS #UDGTABLE
. { =h Henge }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(henge) }
. UDGTABLE# #POPS
  $915F

b $983F Graphics: Cavern
@ $983F label=Image_Cavern
D $983F #PUSHS #UDGTABLE
. { =h Cavern }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(cavern) }
. UDGTABLE# #POPS
  $983F

b $A0EB Graphics: Lake
@ $A0EB label=Image_Lake
D $A0EB #PUSHS #UDGTABLE
. { =h Lake }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(lake) }
. UDGTABLE# #POPS
  $A0EB

c $A531 Game Entry Point
@ $A531 label=GameEntryPoint
  $A531,$05 #HTML(Set CAPS LOCK on, using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6A.html">FLAGS2</a>).
  $A536,$05 Write #N$18 to *#R$A82E.
  $A53B,$03 Jump to #R$B14A.

c $A53E Get User Input
@ $A53E label=GetUserInput
R $A53E O:A The keypress value
  $A53E,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
  $A541,$04 Jump back to #R$A53E until a new key is pressed.
  $A545,$02 Reset the "new key has been pressed" flag in #REGa.
  $A547,$03 #HTML(Write it back to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
N $A54A Fetch the keypress.
  $A54A,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C08.html">LAST_K</a>.)
  $A54D,$01 Return.

c $A54E Clear Screen
@ $A54E label=ClearScreen
  $A54E,$03 Call #R$A577.
  $A551,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D6B.html">CLS</a>.)
  $A554,$01 Return.

c $A555 Clear Lines
@ $A555 label=ClearLines
  $A555,$03 Call #R$A577.
  $A558,$07 #HTML(Clear the number of lines held by *#R$A82E from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $A55F,$01 Return.

c $A560 Set Default Screen Position
@ $A560 label=SetDefaultScreenPosition
  $A560,$03 Call #R$A577.
  $A563,$03 #REGbc=#N($0321,$04,$04).
  $A566,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $A569,$01 Return.

c $A56A Set Screen Position
@ $A56A label=SetScreenPosition
  $A56A,$03 Call #R$A577.
  $A56D,$04 #REGb=*#R$A82E.
  $A571,$05 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>
. with column number #N$21.)
  $A576,$01 Return.

c $A577 Switch To Upper Screen
@ $A577 label=SwitchScreenUpper
  $A577,$04 Stash #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $A57B,$05 #HTML(Switch to upper screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/1601.html">CHAN_OPEN</a>.)
  $A580,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $A584,$01 Return.

c $A585 Print String
@ $A585 label=PrintString
D $A585 Standard printing loop, which prints the fetched character byte and
. loops until the termination byte is reached (#N$FF).
R $A585 HL Pointer to string to be printed
  $A585,$03 Call #R$A577.
N $A588 Just keep looping and printing the fetched character until the
. termination byte is reached (#N$FF).
@ $A588 label=PrintString_Loop
  $A588,$01 Load a character from the string pointer into #REGa.
  $A589,$01 Move the string pointer to the next character.
  $A58A,$03 Return if the string termination character (#N$FF) has been
. reached.
  $A58D,$03 Call #R$A5A4.
  $A590,$02 Jump to #R$A588.

c $A592 Print String And A Newline
@ $A592 label=PrintStringAndNewline
D $A592 Shortcut print routine which prints a newline after it's done.
  $A592,$03 Call #R$A585.
N $A595 Force a newline to be "printed".
  $A595,$02 Load a "newline" character into #REGa (#N$0D).
  $A597,$03 Call #R$A5A4.
  $A59A,$01 Return.

c $A59B Scroll Screen
@ $A59B label=ScrollScreen
D $A59B Scrolls the screen up and then resets the print position.
  $A59B,$01 Switch to the shadow registers.
N $A59C Scroll the screen up.
  $A59C,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0DFE.html">CL_SC_ALL</a>.)
N $A59F Reset the print position.
  $A59F,$03 Call #R$A560.
  $A5A2,$01 Switch back to the normal registers.
  $A5A3,$01 Return.

c $A5A4 Print Character
@ $A5A4 label=PrintCharacter
R $A5A4 A The character to print
  $A5A4,$01 Stash the character to print on the stack.
  $A5A5,$07 #HTML(Jump to #R$A5BF if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html#5C89">S_POSN</a> is not equal to #N$03.)
  $A5AC,$02 Load the character to print into #REGa but keep a copy on the
. stack.
  $A5AE,$04 Jump to #R$A5B7 if this isn't a newline character (#N$0D).
N $A5B2 This is a newline, so scroll the screen up to action it.
  $A5B2,$03 Call #R$A59B.
  $A5B5,$01 Clear the character off the stack (as there's nothing to print for
. a newline, just the screen scroll).
  $A5B6,$01 Return.
N $A5B7 Check the column position.
@ $A5B7 label=CheckColumnPosition
  $A5B7,$08 #HTML(Call #R$A59B if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a> is equal to #N$01.)
N $A5BF Actions printing #REGa to the screen.
@ $A5BF label=PrintCharacterDirect
  $A5BF,$01 Restore the character to print from the stack.
  $A5C0,$01 #HTML(Print to the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">PRINT_A_1</a>.)
  $A5C1,$01 Return.

c $A5C2 Pause Loop
@ $A5C2 label=Pause_Loop
D $A5C2 Pauses a given number of HALT loops.
R $A5C2 B Number of HALT commands to use
  $A5C2,$01 Halt operation (suspend CPU until the next interrupt).
  $A5C3,$02 Decrease counter by one and loop back to #R$A5C2 until counter is zero.
  $A5C5,$01 Return.

c $A5C6 Fetch Frames
@ $A5C6 label=FetchFrames
R $A5C6 O:A #HTML(The first byte of the <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a> variable.)
  $A5C6,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>.)
  $A5C9,$01 Return.

c $A5CA Save Game

c $A647 Print Input Prompt
@ $A647 label=PrintInputPrompt
  $A647,$03 #REGhl=#N$5080 (screen buffer location).
  $A64A,$03 Set the increment in #REGde for the next screen line.
  $A64D,$02 #REGb=#N$08.
  $A64F,$01 #REGa=#N$00.
  $A650,$01 Set the bits from *#REGhl.
  $A651,$01 Move down one line.
  $A652,$02 Decrease counter by one and loop back to #R$A650 until counter is zero.
  $A654,$03 Jump to #R$A65C if #REGa is zero.
N $A657 Force a newline to be "printed".
  $A657,$02 #REGa=#N$0D.
  $A659,$03 Call #R$A5A4.
@ $A65C label=PrintPrompt
N $A65C Print "#STR$A843,$08($b==$FF)".
  $A65C,$03 #REGhl=#R$A843.
  $A65F,$03 Call #R$A585.
  $A662,$01 Return.

g $A66C

g $A7F0

g $A82E Line Number
@ $A82E label=LineNumber
B $A82E,$01

t $A843

t $A9D6

c $AAEE Response: "Please Rephrase That"
@ $AAEE label=Response_PleaseRephraseThat
N $AAEE Print "#STR$A9D6,$08($b==$FF)".
  $AAEE,$03 #REGhl=#R$A9D6.
  $AAF1,$03 Call #R$A592.
  $AAF4,$01 Return.

c $ACAD

c $B10B

c $B14A Game Start Alias
@ $B14A label=GameStart_Alias
  $B14A,$03 Jump to #R$FCCE.

c $E99F

c $FCCE Game Start
@ $FCCE label=GameStart
  $FCCE,$0B Copy #N$0186 bytes from #R$FD02 to #R$A66C.
N $FCD9 Remove a bunch of room exits (as actions in the game will open them
. back up).
  $FCD9,$04 #REGix=#R$E978.
  $FCDD,$04 #REGb=*#R$A7F0.
  $FCE1,$01 Set #REGa to #N$00 which "removes" the exit.
@ $FCE2 label=GameStart_Loop
  $FCE2,$03 #REGl=*#REGix+#N$00.
  $FCE5,$03 #REGh=*#REGix+#N$01.
  $FCE8,$01 Write #REGa to *#REGhl.
  $FCE9,$04 Move to the next address in the table.
  $FCED,$02 Decrease the exits counter by one and loop back to #R$FCE2 until
. all the room exits have been cleared.
N $FCEF Ensure three exits are "open" (as they can become blocked in the game).

  $FDAD,$05 Call #R$EB10 to room #N$02: #ROOM$02.
  $FCFF,$03 Jump to #R$E99F.

g $FD02 Default Game State
@ $FD02 label=DefaultGameState
B $FD02,$0186

c $FF12 Handler: Room Images
  $FF12,$04 #REGix=#R$61A8.
  $FF16,$02 Jump to #R$FF4C.
  $FF18,$04 #REGix=#R$6A34.
  $FF1C,$02 Jump to #R$FF4C.
  $FF1E,$04 #REGix=#R$704F.
  $FF22,$02 Jump to #R$FF4C.
  $FF24,$04 #REGix=#R$75DD.
  $FF28,$02 Jump to #R$FF4C.
  $FF2A,$04 #REGix=#R$7C8D.
  $FF2E,$02 Jump to #R$FF4C.
  $FF30,$04 #REGix=#R$8492.
  $FF34,$02 Jump to #R$FF4C.
  $FF36,$04 #REGix=#R$8AF3.
  $FF3A,$02 Jump to #R$FF4C.
  $FF3C,$04 #REGix=#R$915F.
  $FF40,$02 Jump to #R$FF4C.
  $FF42,$04 #REGix=#R$983F.
  $FF46,$02 Jump to #R$FF4C.
@ $FF48 label=DisplayImage_Treasure
  $FF48,$04 #REGix=#R$A0EB.
N $FF4C All the image routines use this same routine.
@ $FF4C label=Handler_Images
  $FF4C,$03 Call #R$B10B.
  $FF4F,$05 Call #R$ACAD and use line number #N$08 to start printing.
  $FF54,$03 Call #R$A53E.
  $FF57,$01 Return.

w $FF58
