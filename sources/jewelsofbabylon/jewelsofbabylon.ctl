; Copyright Interceptor Software UK 1985, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction
; e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
> $4000 @expand=#DEF(#POKE #LINK:Pokes)
> $4000 @expand=#DEF(#FACT #LINK:Facts)
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Jewels of Babylon Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B00 Tape Loader
@ $5B00 label=TapeLoader
E $5B00 View the equivalent code in #WARLORD$5B00.
N $5B00 Load the first block: screen data.
  $5B00,$04 #REGix=#R$4000(#N$4000).
  $5B04,$03 #REGde=#N$1B00.
  $5B07,$02 #REGa=#N$5B.
  $5B09,$03 Call #R$5B21.
N $5B0C Load the second block: graphics data.
  $5B0C,$04 #REGix=#R$607C(#N$607C).
  $5B10,$03 #REGde=#N$59D4.
  $5B13,$02 #REGa=#N$E1.
  $5B15,$03 Call #R$5B21.
N $5B18 Load the third block: game data.
  $5B18,$04 #REGix=#R$BA50(#N$BA50).
  $5B1C,$03 #REGde=#N$4572.
  $5B1F,$02 #REGa=#N$21.
N $5B21 Tape loading routine.
@ $5B21 label=TapeLoading
  $5B21,$01 Set the carry flag to indicate "loading".
  $5B22,$01 This resets the Z flag. (#REGd cannot hold +#N$FF.)
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
  $5B46,$06 #HTML(Write *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C53.html">PROG</a> to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C4B.html">VARS</a>.)
  $5B4C,$02 #HTML(Write #N$80 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C53.html">PROG</a>.)
  $5B4E,$01 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0008.html">ERROR_1</a>.)

u $5B4F

b $607C Graphics: Boat
@ $607C label=Image_Boat
D $607C #SIM(start=$5B46,stop=$5B4E) #PUSHS #UDGTABLE
. { =h On Your Boat }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(boat) }
. UDGTABLE# #POPS
  $607C

b $6CA4 Graphics: Sand Dunes
@ $6CA4 label=Image_SandDunes
D $6CA4 #PUSHS #UDGTABLE
. { =h Sand Dunes }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(sand-dunes) }
. UDGTABLE# #POPS
  $6CA4

b $7731 Graphics: Bridge
@ $7731 label=Image_Bridge
D $7731 #PUSHS #UDGTABLE
. { =h Bridge }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(bridge) }
. UDGTABLE# #POPS
  $7731

b $8171 Graphics: Cave
@ $8171 label=Image_Cave
D $8171 #PUSHS #UDGTABLE
. { =h Cave }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(cave) }
. UDGTABLE# #POPS
  $8171

b $8BC3 Graphics: Door
@ $8BC3 label=Image_Door
D $8BC3 #PUSHS #UDGTABLE
. { =h Door }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(door) }
. UDGTABLE# #POPS
  $8BC3

b $966A Graphics: Huts
@ $966A label=Image_Huts
D $966A #PUSHS #UDGTABLE
. { =h Huts }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(huts) }
. UDGTABLE# #POPS
  $966A

b $A042 Graphics: Cliffs
@ $A042 label=Image_Cliffs
D $A042 #PUSHS #UDGTABLE
. { =h Cliffs }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(cliffs) }
. UDGTABLE# #POPS
  $A042

b $A958 Graphics: Cavern
@ $A958 label=Image_Cavern
D $A958 #PUSHS #UDGTABLE
. { =h Dunno }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(cavern) }
. UDGTABLE# #POPS
  $A958

b $B2A7 Graphics: Treasure
@ $B2A7 label=Image_Treasure
D $B2A7 #PUSHS #UDGTABLE
. { =h Treasure }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(treasure) }
. UDGTABLE# #POPS
  $B2A7

c $BA50 Game Entry Point
@ $BA50 label=GameEntryPoint
E $BA50 View the equivalent code in #WARLORD$A531.
  $BA50,$05 #HTML(Set CAPS LOCK on, using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6A.html">FLAGS2</a>).
  $BA55,$05 Write #N$18 to *#R$BD70.
  $BA5A,$03 Jump to #R$C592.

c $BA5D Get User Input
@ $BA5D label=GetUserInput
E $BA5D View the equivalent code in #WARLORD$A53E.
R $BA5D O:A The keypress value
  $BA5D,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
  $BA60,$04 Jump back to #R$BA5D until a new key is pressed.
  $BA64,$02 Reset the "new key has been pressed" flag in #REGa.
  $BA66,$03 #HTML(Write it back to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
N $BA69 Fetch the keypress.
  $BA69,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C08.html">LAST_K</a>.)
  $BA6C,$01 Return.

c $BA6D Clear Screen
@ $BA6D label=ClearScreen
E $BA6D View the equivalent code in #WARLORD$A54E.
  $BA6D,$03 Call #R$BA96.
  $BA70,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D6B.html">CLS</a>.)
  $BA73,$01 Return.

c $BA74 Clear Lines
@ $BA74 label=ClearLines
E $BA74 View the equivalent code in #WARLORD$A555.
  $BA74,$03 Call #R$BA96.
  $BA77,$07 #HTML(Clear the number of lines held by *#R$BD70 from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $BA7E,$01 Return.

c $BA7F Set Default Screen Position
@ $BA7F label=SetDefaultScreenPosition
E $BA7F View the equivalent code in #WARLORD$A560.
  $BA7F,$03 Call #R$BA96.
  $BA82,$03 #REGbc=#N$0321.
  $BA85,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $BA88,$01 Return.

c $BA89 Set Screen Position
@ $BA89 label=SetScreenPosition
E $BA89 View the equivalent code in #WARLORD$A56A.
  $BA89,$03 Call #R$BA96.
  $BA8C,$04 #REGb=*#R$BD70.
  $BA90,$05 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>
. with column number #N$21.)
  $BA95,$01 Return.

c $BA96 Switch To Normal Screen Output
@ $BA96 label=SwitchNormalScreenOutput
E $BA96 View the equivalent code in #WARLORD$A577.
  $BA96,$04 Stash #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $BA9A,$05 #HTML(Set current output channel to <em>normal</em> screen output using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/1601.html">CHAN_OPEN</a> with stream #N$02.)
  $BA9F,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $BAA3,$01 Return.

c $BAA4 Print String
@ $BAA4 label=PrintString
D $BAA4 Standard printing loop, which prints the fetched character byte and
. loops until the termination byte is reached (#N$FF).
E $BAA4 View the equivalent code in #WARLORD$A585.
R $BAA4 HL Pointer to string to be printed
  $BAA4,$03 Call #R$BA96.
N $BAA7 Just keep looping and printing the fetched character until the
. termination byte is reached (#N$FF).
@ $BAA7 label=PrintString_Loop
  $BAA7,$01 Load a character from the string pointer into #REGa.
  $BAA8,$01 Move the string pointer to the next character.
  $BAA9,$03 Return if the string termination character (#N$FF) has been
. reached.
  $BAAC,$03 Call #R$BAC3.
  $BAAF,$02 Jump to #R$BAA7.

c $BAB1 Print String And A Newline
@ $BAB1 label=PrintStringAndNewline
D $BAB1 Shortcut print routine which prints a newline after it's done.
E $BAB1 View the equivalent code in #WARLORD$A592.
  $BAB1,$03 Call #R$BAA4.
N $BAB4 Force a newline to be "printed".
  $BAB4,$02 Load a "newline" character into #REGa (#N$0D).
  $BAB6,$03 Call #R$BAC3.
  $BAB9,$01 Return.

c $BABA Scroll Screen
@ $BABA label=ScrollScreen
D $BABA Scrolls the screen up and then resets the print position.
E $BABA View the equivalent code in #WARLORD$A59B.
  $BABA,$01 Switch to the shadow registers.
N $BABB Scroll the screen up.
  $BABB,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0DFE.html">CL_SC_ALL</a>.)
N $BABE Reset the print position.
  $BABE,$03 Call #R$BA7F.
  $BAC1,$01 Switch back to the normal registers.
  $BAC2,$01 Return.

c $BAC3 Print Character
@ $BAC3 label=PrintCharacter
E $BAC3 View the equivalent code in #WARLORD$A5A4.
R $BAC3 A The character to print
  $BAC3,$01 Stash the character to print on the stack.
  $BAC4,$07 #HTML(Jump to #R$BADE if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html#5C89">S_POSN</a> is not equal to #N$03.)
  $BACB,$02 Load the character to print into #REGa but keep a copy on the
. stack.
  $BACD,$04 Jump to #R$BAD6 if this isn't a newline character (#N$0D).
N $BAD1 This is a newline, so scroll the screen up to action it.
  $BAD1,$03 Call #R$BABA.
  $BAD4,$01 Clear the character off the stack (as there's nothing to print for
. a newline, just the screen scroll).
  $BAD5,$01 Return.
N $BAD6 Check the column position.
@ $BAD6 label=CheckColumnPosition
  $BAD6,$08 #HTML(Call #R$BABA if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a> is equal to #N$01.)
N $BADE Actions printing #REGa to the screen.
@ $BADE label=PrintCharacterDirect
  $BADE,$01 Restore the character to print from the stack.
  $BADF,$01 #HTML(Print to the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">PRINT_A_1</a>.)
  $BAE0,$01 Return.

c $BAE1 Print Room Graphic
@ $BAE1 label=Print_RoomGraphic
R $BAE1 IX Pointer to room image data
  $BAE1,$03 Call #R$BA96.
  $BAE4,$03 #REGbc=#N($1821,$04,$04).
  $BAE7,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $BAEA Reset graphic display area.
  $BAEA,$03 #HTML(Point #REGhl at <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR-T</a> which holds the current attribute value.)
  $BAED,$01 Fetch the attribute byte.
  $BAEE,$02,b$01 Keep only the PAPER bits 3-5.
  $BAF0,$03 Move the PAPER bits into the INK bits.
  $BAF3,$01 Store the result in #REGb.
  $BAF4,$01 Fetch the attribute byte again.
  $BAF5,$02,b$01 Keep everything except the INK bits.
  $BAF7,$01 Combine the two values.
  $BAF8,$01 #HTML(Write the result back to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR-T</a>.)
  $BAF9,$03 Set a byte counter in #REGbc of #N($0200,$04,$04).
@ $BAFC label=Print_RoomGraphic_Loop
  $BAFC,$01 Stash the byte counter on the stack.
  $BAFD,$03 #REGhl=#R$BD75.
  $BB00,$02 #REGb=#N$08.
  $BB02,$03 #REGc=*#REGix+#N$00.
  $BB05,$02 Increment #REGix by one.
  $BB07,$02 Jump to #R$BB0A.
  $BB09,$01 Increment #REGhl by one.
  $BB0A,$02 Shift #REGc right.
  $BB0C,$02 Jump to #R$BB15 if #REGhl is greater than or equal to #REGb.
  $BB0E,$03 #REGa=*#REGix+#N$00.
  $BB11,$02 Increment #REGix by one.
  $BB13,$02 Jump to #R$BB16.
  $BB15,$01 #REGa=#N$00.
  $BB16,$01 Write #REGa to *#REGhl.
  $BB17,$02 Decrease counter by one and loop back to #R$BB09 until counter is zero.
  $BB19,$03 #REGde=#R$BD75.
  $BB1C,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0B03.html">PO_FETCH</a>.)
  $BB1F,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0B24.html#0B7F">PR_ALL</a>.)
  $BB22,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0ADC.html">PO_STORE</a>.)
  $BB25,$01 Restore the byte counter from the stack.
  $BB26,$01 Decrease the byte counter by one.
  $BB27,$04 Jump back to #R$BAFC until the byte counter is zero.
  $BB2B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D4D.html">TEMPS</a>.)
  $BB2E,$01 Return.

c $BB2F Colour Room Image
@ $BB2F label=Colour_RoomImage
R $BB2F IX Pointer to the room attribute data
  $BB2F,$03 #REGde=#N$5800 (attribute buffer location).
  $BB32,$03 #REGhl=#REGix (using the stack).
  $BB35,$05 Copy #N($0200,$04,$04) of attribute data from #REGhl to #REGde
. (into the attribute buffer).
  $BB3A,$01 Return.

c $BB3B Print Room Image
@ $BB3B label=Print_RoomImage
R $BB3B IX Pointer to room image data
  $BB3B,$03 Call #R$BAE1.
  $BB3E,$03 Call #R$BB2F.
  $BB41,$01 Return.

c $BB42 Clear Room Image
@ $BB42 label=ClearRoomImage
D $BB42 Copies a given attribute byte to the #N$0200 bytes where the location
. image attribute bytes are (so clears the area).
R $BB42 A Attribute byte value
  $BB42,$03 Set a counter in #REGbc of #N$0200 bytes.
  $BB45,$03 Load #N$5800 (the beginning of the attribute buffer) into #REGhl.
  $BB48,$01 Copy the attribute byte into the #REGe register.
@ $BB49 label=ClearRoomImage_Loop
  $BB49,$01 Write the byte to the attribute buffer.
  $BB4A,$01 Increment the attribute buffer pointer by one.
  $BB4B,$01 Decrease the room image byte counter by one.
  $BB4C,$04 Jump back to #R$BB49 until the whole room image has been covered.
  $BB50,$01 Return.

c $BB51 Pause Loop
@ $BB51 label=Pause_Loop
D $BB51 Pauses a given number of HALT loops.
E $BB51 View the equivalent code in #WARLORD$A5C2.
R $BB51 B Number of HALT commands to use
  $BB51,$01 Halt operation (suspend CPU until the next interrupt).
  $BB52,$02 Decrease counter by one and loop back to #R$BB51 until counter is zero.
  $BB54,$01 Return.

c $BB55 Fetch Frames
@ $BB55 label=FetchFrames
E $BB55 View the equivalent code in #WARLORD$A5C6.
R $BB55 O:A #HTML(The first byte of the <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a> variable.)
  $BB55,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>.)
  $BB58,$01 Return.

c $BB59 Save Game
@ $BB59 label=SaveGame
E $BB59 View the equivalent code in #WARLORD$A5CA.
  $BB59,$03 #REGa=*#R$BD32.
  $BB5C,$03 Jump to #R$BB78 if #REGa is zero.
  $BB5F,$01 #REGb=#REGa.
  $BB60,$04 #REGix=*#R$BD22(#N$BD22).
  $BB64,$03 #REGde=#R$BC99.
  $BB67,$02 Jump to #R$BB6E.

  $BB69,$04 Increment #REGix by two.
  $BB6D,$01 Increment #REGde by one.
  $BB6E,$03 #REGl=*#REGix+#N$00.
  $BB71,$03 #REGh=*#REGix+#N$01.
  $BB74,$02 Write *#REGhl to *#REGde.
  $BB76,$02 Decrease counter by one and loop back to #R$BB69 until counter is zero.
N $BB78 Print "#STR$BE78,$08($b==$FF)".
  $BB78,$03 #REGhl=#R$BE78.
  $BB7B,$03 Call #R$BAB1.
  $BB7E,$03 Call #R$BA5D.
  $BB81,$04 #REGix=#R$BBF0(#N$BBF0).
  $BB85,$03 #REGde=#N$0144.
  $BB88,$02 Set #REGa to #N$FF which indicates this is a data block.
  $BB8A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
N $BB8D Print "#STR$BE9A,$08($b==$FF)".
  $BB8D,$03 #REGhl=#R$BE9A.
  $BB90,$03 Call #R$BAB1.
  $BB93,$01 Return.

c $BB94 Load From Tape
@ $BB94 label=LoadTape
E $BB94 View the equivalent code in #WARLORD$A605.
N $BB94 Print "#STR$BE57,$08($b==$FF)".
  $BB94,$03 #REGhl=#R$BE57.
  $BB97,$03 Call #R$BAB1.
  $BB9A,$04 Load the starting address into #REGix at #R$BBF0.
  $BB9E,$03 Set the block length in #REGde to #N$0144 bytes.
  $BBA1,$02 Set #REGa to #N$FF which indicates this is a data block.
  $BBA3,$01 Set the carry flag to indicate this is loading.
  $BBA4,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0556.html">LD_BYTES</a>.)
  $BBA7,$02 Jump to #R$BBB0 if the carry flag is not set.
N $BBA9 Print "#STR$BE6C,$08($b==$FF)".
  $BBA9,$03 #REGhl=#R$BE6C.
  $BBAC,$03 Call #R$BAB1.
  $BBAF,$01 Return.
@ $BBB0 label=LoadTape_Success
  $BBB0,$03 #REGa=*#R$BD32.
  $BBB3,$02 Return if #REGa is zero.
  $BBB5,$01 #REGb=#REGa.
  $BBB6,$04 #REGix=*#R$BD22.
  $BBBA,$03 #REGde=#R$BC99.
  $BBBD,$02 Jump to #R$BBC4.
@ $BBBF label=LoadTape_WriteLoop
  $BBBF,$04 Increment #REGix by two.
  $BBC3,$01 Increment #REGde by one.
@ $BBC4 label=LoadTape_Write
  $BBC4,$03 #REGl=*#REGix+#N$00.
  $BBC7,$03 #REGh=*#REGix+#N$01.
  $BBCA,$01 #REGa=*#REGde.
  $BBCB,$01 Write #REGa to *#REGhl.
  $BBCC,$02 Decrease counter by one and loop back to #R$BBBF until counter is zero.
  $BBCE,$02 #REGe=#N$00.
  $BBD0,$03 Call #R$C21E.
  $BBD3,$01 Return.

c $BBD4 Print Input Prompt
@ $BBD4 label=PrintInputPrompt
E $BBD4 View the equivalent code in #WARLORD$A647.
  $BBD4,$03 #REGhl=#N$5080 (screen buffer location).
  $BBD7,$03 Set the increment in #REGde for the next screen line.
  $BBDA,$02 #REGb=#N$08.
  $BBDC,$01 #REGa=#N$00.
  $BBDD,$01 Set the bits from *#REGhl.
  $BBDE,$01 Move down one line.
  $BBDF,$02 Decrease counter by one and loop back to #R$BBDD until counter is zero.
  $BBE1,$03 Jump to #R$BBE9 if #REGa is zero.
N $BBE4 Force a newline to be "printed".
  $BBE4,$02 #REGa=#N$0D.
  $BBE6,$03 Call #R$BAC3.
@ $BBE9 label=PrintPrompt
N $BBE9 Print "#STR$BD85,$08($b==$FF)".
  $BBE9,$03 #REGhl=#R$BD85.
  $BBEC,$03 Call #R$BAA4.
  $BBEF,$01 Return.

g $BBF0 Table: Item Locations
@ $BBF0 label=Table_ItemLocations
D $BBF0 A table where the index is the item ID, and the value is the room it
. resides in (#N$00 for "currently inactive").
D $BBF0 When the item is in the players inventory, the room ID changes to
. #N$01.
B $BBF0,$01 Item #N(#PC-$BBF0) #ITEM(#PC-$BBF0) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $BBF0,$01,$4F

g $BC54 Game Flags
@ $BC54 label=GameFlags_Help
D $BC54 Holds a single byte, where each bit relates to help states as follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$01 | Cannibals }
. { #N$02 | Swearing #1 }
. { #N$03 | Swearing #2 }
. TABLE#
B $BC54,$01

u $BC55

g $BC5C Table: Already Seen Room Images
@ $BC5C label=Table_RoomImagesAlreadySeen
D $BC5C Corresponds to whether the player has already seen the image for the following rooms:
.
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$E95D,$E964,,1(n,{ #N(n-$E95D) | #N(#PEEKn) | #ROOM(#PEEKn) })
. TABLE#
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$E965,$E969,,1(n,{ #N(n-$E965) | #N(#PEEKn) | #ROOM(#PEEKn) })
. #FOR$05,$07,,1(n,{ #Nn | N/A | N/A })
. TABLE#
D $BC5C Used by the routine at #R$C21E but uses the bit index from #R$E95D.
B $BC5C,b,$01
B $BC5D,b,$01

b $BC5E

g $BC66 Flags: Turn-Based Event States
@ $BC66 label=Flag_TurnBasedEventState
D $BC66 Holds a single byte, where each bit relates to a turn-based event as
. follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Crab }
. { #N$01 | Tentacle }
. { #N$02 | Drunk }
. { #N$03 | Lion }
. { #N$04 | Crocodile }
. { #N$05 | Cannibals }
. { #N$06 | Match }
. { #N$07 | Wave }
. TABLE#
. When the bit is set, this starts a turn counter (see #R$BC67).
B $BC66,$01

g $BC67 Turn-Based Event Counters
N $BC67 Initialised to #N$06.
@ $BC67 label=Counter_Crab
N $BC68 Initialised to #N$05 by #R$EFA7.
@ $BC68 label=Counter_Tentacle
N $BC69 Being drunk is initialised to #N$06 turns in #R$F9E4.
@ $BC69 label=Counter_Drunk
N $BC6A Initialised to #N$07.
@ $BC6A label=Counter_Lion
N $BC6B Initialised to #N$0B.
@ $BC6B label=Counter_Crocodile
N $BC6C Initialised to #N$09.
@ $BC6C label=Counter_Cannibals
N $BC6D The match is initialised to #N$06 turns in #R$FC24.
@ $BC6D label=Counter_Match
N $BC6E The wave is initialised to #N$05 turns by the #R$EF54 routine.
@ $BC6E label=Counter_Wave
B $BC67,$08,$01

g $BC6F Flags: Event States
@ $BC6F label=Flag_EventState
D $BC6F Holds a single byte, where each bit relates to an event as follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Crab }
. { #N$01 | Tentacle }
. { #N$02 | Drunk }
. { #N$03 | Lion }
. { #N$04 | Crocodile }
. { #N$05 | Cannibals }
. { #N$06 | Match }
. { #N$07 | Wave }
. TABLE#
. When the bit is set, this indicates that a turn-based event has started.
B $BC6F,$01

g $BC70
  $BC70,$08,$01

g $BC78 Table: Scenic Event Locations
@ $BC78 label=Table_ScenicEventLocations
D $BC78 A table where the index is the event ID, and the value is the room it
. resides in (#N$00 for "currently inactive"). See #R$BD30 for the count.
B $BC78,$01 Event #N(#PC-$BC78) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $BC78,$01,$09

g $BC81

g $BC98 Number Of Items In The Players Inventory
@ $BC98 label=Count_InventoryItems
D $BC98 The number of items the player is currently holding.
B $BC98,$01

b $BC99

g $BCCB Current Room ID
@ $BCCB label=CurrentRoom
D $BCCB The room the player starts the game in is room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
B $BCCB,$01 Current room ID.

g $BCCC Table: Scenic Event Rooms
@ $BCCC label=Table_ScenicEventRooms
D $BCCC Pointer to the table containing groups of room IDs that an event could
. occur in.
W $BCCC,$02 Event #N((#PC-$BCCC)/$02).
L $BCCC,$02,$09

g $BCDE

g $BD0C Pointer: Vocabulary Table
@ $BD0C label=Pointer_Vocabulary
D $BD0C Pointer to the table containing the game vocabulary.
W $BD0C,$02

g $BD0E Pointer: Turn-Based Events Jump Table
@ $BD0E label=Pointer_TurnBasedEvents_Jump
D $BD0E Pointer to the jump table containing turn-based events.
W $BD0E,$02

g $BD10 Pointer: Room Map Table
@ $BD10 label=Pointer_RoomMap
D $BD10 Pointer to the table containing the relationships between rooms.
W $BD10,$02

g $BD12 Pointer: Item Description Table
@ $BD12 label=Pointer_ItemDescriptions
D $BD12 Pointer to the table containing item descriptions.
W $BD12,$02

g $BD14 Pointer: Rooms With Images Table
@ $BD14 label=Pointer_RoomsWithImages
D $BD14 Pointer to the table containing all the rooms which have an image to
. display.
W $BD14,$02

g $BD16 Pointer: Room Image Jump Table
@ $BD16 label=Pointer_RoomImage
D $BD16 Pointer to the jump table for displaying an image relating to a room.
W $BD16,$02

g $BD18 Pointer: Room Description Table
@ $BD18 label=Pointer_RoomDescriptions
D $BD18 Pointer to the table containing room descriptions.
W $BD18,$02

g $BD1A Pointer: Item Grouping Table
@ $BD1A label=Pointer_ItemGroupingTable
W $BD1A,$02

g $BD1C Pointer: Object Noun Phrases
@ $BD1C label=Pointer_ObjectNounPhrases
W $BD1C,$02

g $BD1E Pointer: Object List Table
@ $BD1E label=Pointer_ObjectList
W $BD1E,$02

g $BD20 Pointer: Jump Table
@ $BD20 label=Pointer_JumpTable
W $BD20,$02

g $BD22 Pointer: Configurable Exits Table
@ $BD22 label=Pointer_ConfigurableExits
W $BD22,$02

g $BD24 Pointer: Scenic Events Jump Table
@ $BD24 label=Pointer_JumpTable_ScenicEvents
W $BD24,$02

g $BD26 Pointer: Verb Word Tokens Table
@ $BD26 label=Pointer_VerbWordTokens
W $BD26,$02

g $BD28 Number Of Items
@ $BD28 label=Count_Items
D $BD28 The total number of items in the game.
W $BD28,$02

g $BD2A Number Of Objects
@ $BD2A label=Count_Objects
D $BD2A The total number of objects in the game.
W $BD2A,$02

g $BD2C Number Of Verb Tokens
@ $BD2C label=Count_VerbTokens
D $BD2C The total number of verb word tokens the game has. See #R$E90D.
W $BD2C,$02

g $BD2E Number Of Rooms With Images
@ $BD2E label=Count_RoomsWithImages
D $BD2E The total number of rooms which have related images in the game.
W $BD2E,$02

g $BD30 Number Of Scenic Events
@ $BD30 label=Count_ScenicEvents
E $BD30 The total number of scenic events in the game, see #R$BC78.
W $BD30,$02

g $BD32 Number Of "Configurable Exits"
@ $BD32 label=Count_ConfigurableExits
W $BD32,$02

g $BD34 Command Buffer
@ $BD34 label=CommandBuffer
B $BD34,$32

g $BD66 User Input: Word Tokens
@ $BD66 label=UserInput_Token_1
@ $BD67 label=UserInput_Token_2
B $BD66,$01
L $BD66,$01,$0A

g $BD70 Line Number
@ $BD70 label=LineNumber
E $BD70 View the equivalent code in #JEWELS$A82E.
B $BD70,$01

g $BD71

  $BD75

g $BD7D Temporary Storage Table Pointer
@ $BD7D label=TempStore_TablePointer
W $BD7D,$02

g $BD7F Temporary Storage Table Index
@ $BD7F label=TempStore_TableIndex
W $BD7F,$02

g $BD81

t $BD85 Messaging: "> "
@ $BD85 label=Messaging_Prompt
  $BD85,$02 "#STR$BD85,$08($b==$FF)".
B $BD87,$01 Terminator.

t $BD88 Messaging: "<BS> <BS>"
@ $BD88 label=Messaging_BackspaceSpaceBackspace
D $BD88 Used by the routine at #R$C041.
  $BD88,$03 "#STR$BD88,$08($b==$FF)".
B $BD8B,$01 Terminator.

t $BD8C Messaging: "The "
@ $BD8C label=Messaging_The
  $BD8C,$04 "#STR$BD8C,$08($b==$FF)".
B $BD90,$01 Terminator.

t $BD91 Messaging: "I Don't Understand"
@ $BD91 label=Messaging_IDontUnderstand
  $BD91,$13 "#STR$BD91,$08($b==$FF)".
B $BDA4,$01 Terminator.

t $BDA5 Messaging: "I Don't Know The Word"
@ $BDA5 label=Messaging_IDontKnowTheWord
  $BDA5,$17 "#STR$BDA5,$08($b==$FF)".
B $BDBC,$01 Terminator.

t $BDBD Messaging: "Nothing"
@ $BDBD label=Messaging_Nothing
  $BDBD,$08 "#STR$BDBD,$08($b==$FF)".
B $BDC5,$01 Terminator.

t $BDC6 Messaging: "You Can See"
@ $BDC6 label=Messaging_YouCanSee
  $BDC6,$0E "#STR$BDC6,$08($b==$FF)".
B $BDD4,$01 Terminator.

t $BDD5 Messaging: "Ampersand "
@ $BDD5 label=Messaging_Ampersand
  $BDD5,$03 "#STR$BDD5,$08($b==$FF)".
B $BDD8,$01 Terminator.

t $BDD9 Messaging: "There Are Exits"
@ $BDD9 label=Messaging_ThereAreExits
  $BDD9,$12 "#STR$BDD9,$08($b==$FF)".
B $BDEB,$01 Terminator.

t $BDEC Messaging: "There Is An Exit "
@ $BDEC label=Messaging_ThereIsAnExit
  $BDEC,$12 "#STR$BDEC,$08($b==$FF)".
B $BDFE,$01 Terminator.

t $BDFF Messaging: "North"
@ $BDFF label=Messaging_North
  $BDFF,$05 "#STR$BDFF,$08($b==$FF)".
B $BE04,$01 Terminator.

t $BE05 Messaging: "South"
@ $BE05 label=Messaging_South
  $BE05,$05 "#STR$BE05,$08($b==$FF)".
B $BE0A,$01 Terminator.

t $BE0B Messaging: "East"
@ $BE0B label=Messaging_East
  $BE0B,$04 "#STR$BE0B,$08($b==$FF)".
B $BE0F,$01 Terminator.

t $BE10 Messaging: "West"
@ $BE10 label=Messaging_West
  $BE10,$04 "#STR$BE10,$08($b==$FF)".
B $BE14,$01 Terminator.

t $BE15 Messaging: "Up"
@ $BE15 label=Messaging_Up
  $BE15,$02 "#STR$BE15,$08($b==$FF)".
B $BE17,$01 Terminator.

t $BE18 Messaging: "Down"
@ $BE18 label=Messaging_Down
  $BE18,$04 "#STR$BE18,$08($b==$FF)".
B $BE1C,$01 Terminator.

t $BE1D Messaging: "I Can't See "
@ $BE1D label=Messaging_ICantSee
  $BE1D,$0C "#STR$BE1D,$08($b==$FF)".
B $BE29,$01 Terminator.

t $BE2A Messaging: " Here"
@ $BE2A label=Messaging_Here
  $BE2A,$06 "#STR$BE2A,$08($b==$FF)".
B $BE30,$01 Terminator.

t $BE31 Messaging: "You Are Dead"
@ $BE31 label=Messaging_YouAreDead
  $BE31,$0D "#STR$BE31,$08($b==$FF)".
B $BE3E,$01 Terminator.

t $BE3F Messaging: "Want Another Game? Y/N"
@ $BE3F label=Messaging_WantAnotherGame
  $BE3F,$17 "#STR$BE3F,$08($b==$FF)".
B $BE56,$01 Terminator.

t $BE57 Messaging: "Loading. Start Tape"
@ $BE57 label=Messaging_LoadingStartTape
  $BE57,$14 "#STR$BE57,$08($b==$FF)".
B $BE6B,$01 Terminator.

t $BE6C Messaging: "Tape Error"
@ $BE6C label=Messaging_TapeError
  $BE6C,$0B "#STR$BE6C,$08($b==$FF)".
B $BE77,$01 Terminator.

t $BE78 Messaging: "Saving. Start Tape,Press Any Key"
@ $BE78 label=Messaging_SavingStartTape
  $BE78,$21 "#STR$BE78,$08($b==$FF)".
B $BE99,$01 Terminator.

t $BE9A Messaging: "Stop Tape.Saving Complete"
@ $BE9A label=Messaging_StopTape
  $BE9A,$1A "#STR$BE9A,$08($b==$FF)".
B $BEB4,$01 Terminator.

t $BEB5 Messaging: "Want To Save The Game? Y/N"
@ $BEB5 label=Messaging_WantToSaveTheGame
  $BEB5,$1B "#STR$BEB5,$08($b==$FF)".
B $BED0,$01 Terminator.

t $BED1 Messaging: "Please Be More Specific"
@ $BED1 label=Messaging_PleaseBeMoreSpecific
  $BED1,$18 "#STR$BED1,$08($b==$FF)".
B $BEE9,$01 Terminator.

t $BEEA Messaging: "Please Rephrase That"
@ $BEEA label=Messaging_PleaseRephraseThat
  $BEEA,$15 "#STR$BEEA,$08($b==$FF)".
B $BEFF,$01 Terminator.

t $BF00 Messaging: "You Can't"
@ $BF00 label=Messaging_YouCant
  $BF00,$0A "#STR$BF00,$08($b==$FF)".
B $BF0A,$01 Terminator.

t $BF0B Messaging: "O.K"
@ $BF0B label=Messaging_OK
  $BF0B,$04 "#STR$BF0B,$08($b==$FF)".
B $BF0F,$01 Terminator.

t $BF10 Messaging: "You're Already Carrying "
@ $BF10 label=Messaging_YoureAlreadyCarrying
  $BF10,$18 "#STR$BF10,$08($b==$FF)".
B $BF28,$01 Terminator.

t $BF29 Messaging: "Full Stop"
@ $BF29 label=Messaging_FullStop
  $BF29,$01 "#STR$BF29,$08($b==$FF)".
B $BF2A,$01 Terminator.

t $BF2B Messaging: "It"
@ $BF2B label=Messaging_It
  $BF2B,$03 "#STR$BF2B,$08($b==$FF)".
B $BF2E,$01 Terminator.

t $BF2F Messaging: "Them"
@ $BF2F label=Messaging_Them
  $BF2F,$05 "#STR$BF2F,$08($b==$FF)".
B $BF34,$01 Terminator.

t $BF35 Messaging: "You Can't Carry Any More"
@ $BF35 label=Messaging_YouCantCarryAnyMore
  $BF35,$19 "#STR$BF35,$08($b==$FF)".
B $BF4E,$01 Terminator.

t $BF4F Messaging: "You Are Carrying"
@ $BF4F label=Messaging_YouAreCarrying
  $BF4F,$12 "#STR$BF4F,$08($b==$FF)".
B $BF61,$01 Terminator.

t $BF62 Messaging: "You Can't Go In That Direction"
@ $BF62 label=Messaging_YouCantGoInThatDirection
  $BF62,$1F "#STR$BF62,$08($b==$FF)".
B $BF81,$01 Terminator.

t $BF82 Messaging: "One At A Time, Please!"
@ $BF82 label=Messaging_OneAtATimePlease
  $BF82,$15 "#STR$BF82,$08($b==$FF)".
B $BF97,$01 Terminator.

t $BF98 Messaging: "I Don't See The Point"
@ $BF98 label=Messaging_IDontSeeThePoint
  $BF98,$16 "#STR$BF98,$08($b==$FF)".
B $BFAE,$01 Terminator.

t $BFAF Messaging: "You're Not Carrying "
@ $BFAF label=Messaging_YoureNotCarrying
  $BFAF,$14 "#STR$BFAF,$08($b==$FF)".
B $BFC3,$01 Terminator.

t $BFC4 Messaging: "You're Not Carrying Anything"
@ $BFC4 label=Messaging_YoureNotCarryingAnything
  $BFC4,$1D "#STR$BFC4,$08($b==$FF)".
B $BFE1,$01 Terminator.

g $BFE2 Table: Directions
@ $BFE2 label=Table_Directions
D $BFE2 Pointer to the table containing direction messaging.
W $BFE2,$02 "#STR$BDFF,$08($b==$FF)".
W $BFE4,$02 "#STR$BE05,$08($b==$FF)".
W $BFE6,$02 "#STR$BE0B,$08($b==$FF)".
W $BFE8,$02 "#STR$BE10,$08($b==$FF)".
W $BFEA,$02 "#STR$BE15,$08($b==$FF)".
W $BFEC,$02 "#STR$BE18,$08($b==$FF)".

c $BFEE Response: "Please Rephrase That"
@ $BFEE label=Response_PleaseRephraseThat
N $BFEE Print "#STR$BEEA,$08($b==$FF)".
  $BFEE,$03 #REGhl=#R$BEEA.
  $BFF1,$03 Call #R$BAB1.
  $BFF4,$01 Return.

c $BFF5 Response: "Please Be More Specific"
@ $BFF5 label=Response_PleaseBeMoreSpecific
N $BFF5 Print "#STR$BED1,$08($b==$FF)".
  $BFF5,$03 #REGhl=#R$BED1.
  $BFF8,$03 Call #R$BAB1.
  $BFFB,$01 Return.

c $BFFC Response: "You Can't"
@ $BFFC label=Response_YouCant
N $BFFC Print "#STR$BF00,$08($b==$FF)".
  $BFFC,$03 #REGhl=#R$BF00.
  $BFFF,$03 Call #R$BAB1.
  $C002,$01 Return.

c $C003 Response: "O.K."
@ $C003 label=Response_OK
N $C003 Print "#STR$BF0B,$08($b==$FF)".
  $C003,$03 #REGhl=#R$BF0B.
  $C006,$03 Call #R$BAB1.
  $C009,$01 Return.

c $C00A Handler: User Input
@ $C00A label=Handler_UserInput
N $C00A Reset the screen position to defaults.
  $C00A,$03 Call #R$BA7F.
N $C00D Clear down the command buffer which will hold the users input.
  $C00D,$03 #REGhl=#R$BD34.
  $C010,$02 Store the ASCII code for "SPACE" ("#CHR$20") into #REGa.
  $C012,$02 Set a counter in #REGb for the size of the command buffer (#N$32
. bytes).
N $C014 Write "SPACE" #N$32 times wiping the entire command buffer.
@ $C014 label=EmptyCommandBuffer_Loop
  $C014,$01 Write #REGa to *#REGhl.
  $C015,$01 Increment #REGhl by one.
  $C016,$02 Decrease the command buffer counter by one and loop back to #R$C014
. until the whole buffer is cleared.
N $C018 Now print the prompt icon ">".
  $C018,$03 Call #R$BBD4.
N $C01B Initialise the command buffer.
  $C01B,$03 #REGhl=#R$BD34.
N $C01E Collect the users keypress.
@ $C01E label=UserInput_Loop
  $C01E,$03 Call #R$BA5D.
N $C021 Check the two valid control keys "DELETE" and "ENTER".
  $C021,$04 Jump to #R$C041 if "DELETE" was pressed.
  $C025,$04 Jump to #R$C058 if "ENTER" was pressed.
  $C029,$04 If the keypress was any other control key (the value being under
. #N$20 ASCII "SPACE"), it's not valid input so jump back to #R$C01E.
N $C02D Test if the current position in the command buffer is at the end
. (#R$BD34(#N$BD65)) of the buffer.
. For example: #PUSHS #TABLE(default,centre,centre) { =h Position | =h Output }
. #FOR($BD34,$BD65,$07,$04)(x,#SIM(start=$C02D,stop=$C035,hl=x)
. { #Nx | #N({sim[DE]}) })
. TABLE# #POPS
  $C02D,$0A Jump back to #R$C01E if the input has reached the end of the
. command buffer (so don't process it).
N $C037 The keypress is valid, so process it and print it to the screen.
  $C037,$01 Write the keypress into the command buffer at the current position.
  $C038,$03 Call #R$BA96.
  $C03B,$03 Call #R$BAC3.
  $C03E,$01 Increment the pointer to the command buffer by one.
  $C03F,$02 Jump back to #R$C01E.

c $C041 Handler: User Pressed "DELETE"
@ $C041 label=UserInput_Delete
D $C041 Handles the user pressing delete.
R $C041 HL Current position in the command buffer
N $C041 Test if the current position in the command buffer is at the start
. (#R$BD34(#N$BD34)) of the buffer.
  $C041,$0A Jump back to #R$C01E if the user is already at the beginning of the
. command buffer.
N $C04B Else delete the current character.
  $C04B,$01 Stash the pointer to the command buffer on the stack.
N $C04C Print "BACKSPACE SPACE BACKSPACE" to move the current print position on
. the screen to the previous character, and to delete the charactr present
. using a space.
  $C04C,$03 #REGhl=#R$BD88.
  $C04F,$03 Call #R$BAA4.
  $C052,$01 Restore the pointer to the command buffer from the stack.
N $C053 Now adjust the command buffer pointer to match the new position.
  $C053,$01 Decrease the pointer to the command buffer by one.
  $C054,$02 Write an ASCII space (#N$20) into the command buffer at the current
. position.
  $C056,$02 Jump to #R$C01E.

c $C058 Handler: User Pressed "ENTER"
@ $C058 label=UserInput_Enter
D $C058 Handles the user pressing "ENTER".
R $C058 HL Current position in the command buffer
R $C058 A Which contains #N$0D ("ENTER") at this point.
  $C058,$01 Write #N$0D to the command buffer pointer for use as a termination
. character.
N $C059 Force a newline to be "printed" to the screen.
  $C059,$03 Call #R$BA96.
  $C05C,$03 Call #R$BAC3.
N $C05F Clear down the word token buffer which will eventually hold the
. tokenised input.
  $C05F,$03 #REGhl=#R$BD66.
  $C062,$02 #REGa=#N$FF.
  $C064,$02 Set a counter in #REGb for the size of the word token buffer (#N$0A bytes).
N $C066 Write #N$FF #N$0A times wiping the word token buffer.
@ $C066 label=EmptyWordTokenBuffer_Loop
  $C066,$01 Write #REGa to *#REGhl.
  $C067,$01 Increment #REGhl by one.
  $C068,$02 Decrease the word token buffer counter by one and loop back to
. #R$C066 until the whole buffer is cleared.
  $C06A,$03 #REGhl=#R$BD34.
  $C06D,$02 #REGc=#N$0A.
N $C06F Now begin tokenising the user input.
@ $C06F label=UserInputParser_Loop
  $C06F,$03 #REGde=#R$BD71.
  $C072,$02 #REGb=#N$04.
  $C074,$03 Write ASCII "SPACE" (#N$20) to *#REGde.
  $C077,$01 Increment #REGde by one.
  $C078,$02 Decrease counter by one and loop back to #R$C076 until counter is zero.
  $C07A,$01 #REGa=#N$00.
  $C07B,$01 Set the bits from #REGc.
  $C07C,$03 Jump to #R$C16E if #REGde is equal to #REGc.
  $C07F,$06 Jump to #R$C16E if *#REGhl is equal to #N$0D.
  $C085,$02 #REGb=#N$04.
  $C087,$03 #REGde=#R$BD71.
  $C08A,$01 #REGa=*#REGhl.
  $C08B,$04 Jump to #R$C0B6 if #REGa is equal to #N$0D.
  $C08F,$04 Jump to #R$C0AC if #REGa is equal to #N$20.
  $C093,$04 Jump to #R$C0AC if #REGa is equal to #N$2C.
  $C097,$01 Write #REGa to *#REGde.
  $C098,$01 Increment #REGhl by one.
  $C099,$01 Increment #REGde by one.
  $C09A,$02 Decrease counter by one and loop back to #R$C08A until counter is zero.
  $C09C,$01 #REGa=*#REGhl.
  $C09D,$04 Jump to #R$C0B6 if #REGa is equal to #N$0D.
  $C0A1,$04 Jump to #R$C0AC if #REGa is equal to #N$20.
  $C0A5,$04 Jump to #R$C0AC if #REGa is equal to #N$2C.
  $C0A9,$01 Increment #REGhl by one.
  $C0AA,$02 Jump to #R$C09C.
  $C0AC,$01 Increment #REGhl by one.
  $C0AD,$01 #REGa=*#REGhl.
  $C0AE,$04 Jump to #R$C0AC if #REGa is equal to #N$20.
  $C0B2,$04 Jump to #R$C0AC if #REGa is equal to #N$2C.
  $C0B6,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $C0B9,$03 #REGhl=#R$BD8C.
  $C0BC,$03 #REGde=#R$BD71.
  $C0BF,$02 #REGb=#N$04.
  $C0C1,$04 Jump to #R$C0C9 if *#REGde is not equal to *#REGhl.
  $C0C5,$01 Increment #REGde by one.
  $C0C6,$01 Increment #REGhl by one.
  $C0C7,$02 Decrease counter by one and loop back to #R$C0C1 until counter is zero.
  $C0C9,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $C0CC,$02 Jump to #R$C06F if #REGhl is equal to *#REGhl.
  $C0CE,$01 Decrease #REGc by one.
  $C0CF,$03 Write #REGhl to *#R$BD7D.
  $C0D2,$04 Write #REGde to *#R$BD7F.
  $C0D6,$04 Write #REGbc to *#R$BD81.
  $C0DA,$03 #REGhl=*#R$BD0C.
  $C0DD,$02 #REGc=#N$00.
  $C0DF,$05 Jump to #R$C11C if *#REGhl is equal to #N$FF.
  $C0E4,$03 #REGde=#R$BD71.
  $C0E7,$02 #REGb=#N$04.
  $C0E9,$04 Jump to #R$C10D if *#REGde is not equal to *#REGhl.
  $C0ED,$01 Increment #REGde by one.
  $C0EE,$01 Increment #REGhl by one.
  $C0EF,$02 Decrease counter by one and loop back to #R$C0E9 until counter is zero.
  $C0F1,$03 #REGhl=#R$BD81.
  $C0F4,$02 #REGa=#N$09.
  $C0F6,$01 #REGa-=*#REGhl.
  $C0F7,$02 #REGd=#N$00.
  $C0F9,$01 #REGe=#REGa.
  $C0FA,$04 #REGhl=#R$BD66+#REGde.
  $C0FE,$01 Write #REGc to *#REGhl.
  $C0FF,$03 #REGhl=*#R$BD7D.
  $C102,$04 #REGde=*#R$BD7F.
  $C106,$04 #REGbc=*#R$BD81.
  $C10A,$03 Jump to #R$C06F.

  $C10D,$01 #REGe=#REGb.
  $C10E,$02 #REGd=#N$00.
  $C110,$01 #REGhl+=#REGde.
  $C111,$01 #REGa=*#REGhl.
  $C112,$04 Jump to #R$C119 if #REGa is not equal to #N$2C.
  $C116,$01 Increment #REGhl by one.
  $C117,$02 Jump to #R$C0E4.

  $C119,$01 Increment #REGc by one.
  $C11A,$02 Jump to #R$C0DF.

  $C11C,$03 #REGhl=*#R$BD7D.
  $C11F,$04 #REGde=*#R$BD7F.
  $C123,$04 #REGbc=*#R$BD81.
  $C127,$04 #REGc=#N$0A-#REGc.
  $C12B,$03 #REGhl=#R$BD34.
  $C12E,$01 Decrease #REGc by one.
  $C12F,$02 Jump to #R$C149 if #REGc is equal to #N$0A.
  $C131,$01 #REGa=*#REGhl.
  $C132,$04 Jump to #R$C13D if #REGa is equal to #N$20.
  $C136,$04 Jump to #R$C13D if #REGa is equal to #N$2C.
  $C13A,$01 Increment #REGhl by one.
  $C13B,$02 Jump to #R$C131.
  $C13D,$01 Increment #REGhl by one.
  $C13E,$01 #REGa=*#REGhl.
  $C13F,$04 Jump to #R$C13D if #REGa is equal to #N$20.
  $C143,$04 Jump to #R$C13D if #REGa is equal to #N$2C.
  $C147,$02 Jump to #R$C12E.

  $C149,$01 Stash #REGhl on the stack.
N $C14A Print "#STR$BDA5,$08($b==$FF)".
  $C14A,$03 #REGhl=#R$BDA5.
  $C14D,$03 Call #R$BAB1.
  $C150,$01 Restore #REGhl from the stack.
M $C151,$05 #HTML(Print a double quote character: "<code>#CHR$22</code>".)
  $C151,$02 #REGa=#N$22.
  $C153,$03 Call #R$BAC3.
  $C156,$01 #REGa=*#REGhl.
  $C157,$04 Jump to #R$C161 if #REGa is less than #N$21.
  $C15B,$01 Increment #REGhl by one.
  $C15C,$03 Call #R$BAC3.
  $C15F,$02 Jump to #R$C156.
M $C161,$05 #HTML(Print a double quote character: "<code>#CHR$22</code>".)
  $C161,$02 #REGa=#N$22.
  $C163,$03 Call #R$BAC3.
N $C166 Print "#STR$BF29,$08($b==$FF)".
  $C166,$03 #REGhl=#R$BF29.
  $C169,$03 Call #R$BAB1.
  $C16C,$02 Jump to #R$C17A.

  $C16E,$06 Return if *#R$BD66 is not equal to #N$FF.
N $C174 Print "#STR$BD91,$08($b==$FF)".
  $C174,$03 #REGhl=#R$BD91.
  $C177,$03 Call #R$BAB1.
  $C17A,$03 Jump to #R$C00A.

c $C17D Process Game Events
@ $C17D label=GameEventsProcessor
D $C17D This routine manages two types of in-game events:
. #HTML(<dl><dt>1. Turn-Based Events</dt>
. <dd>These are timer-based hazards that count down with each game turn. When a
. turn counter reaches zero, the associated event handler is called via a jump
. table.</dd>
. <dt>2. Scenic Events</dt>
. <dd>Mostly atmospheric events that randomly appear in different locations to
. add flavor to the game world (like seagulls appearing at the beach).</dd>
. <dd>The routine maintains a table of current locations for each scenic event.
. On each turn, it checks if any scenic event is NOT in the current room, then
. randomly relocates it to one of its valid rooms.</dd>
. <dd>Each scenic event has a predefined group of rooms where the event can
. appear.</dd></dl>)
. The routine ensures that:
. #LIST
. { Multiple turn-based dangers can threaten the player simultaneously }
. { Scenic events don't repeatedly trigger in the same room }
. { The game world feels dynamic with events occurring in different locations }
. LIST#
N $C17D First process the turn-based events (if any are active).
  $C17D,$03 Load *#R$BC66 into #REGa.
  $C180,$03 Jump to #R$C1AF if no turn-based events are currently active.
N $C183 One of the events has triggered, find which one.
  $C183,$01 Copy the turn-based event flags into #REGc.
  $C184,$02 Set a counter in #REGb for the number of possible turn-based events
. (#N$08).
N $C186 Keep shifting the event flags one-by-one to find which bits are set.
@ $C186 label=GameEventChecker_Loop
  $C186,$02 Shift #REGc one position left to check the next event flag bit.
  $C188,$02 Jump to #R$C1AD if this event bit isn't set.
N $C18A The currently processed turn-based event is active, so process it.
N $C18A This is: #R$BC67+(#N$08-the current event counter).
  $C18A,$0B Calculate the turn-based event index and store it in #REGhl.
  $C195,$01 Decrease the turn-based event counter at *#REGhl by one.
  $C196,$02 Jump to #R$C1AD if the event turn counter at *#REGhl was still more
. than zero.
N $C198 The event turn counter is zero, so activate the event itself.
  $C198,$04 Load *#R$BD0E into #REGix.
  $C19C,$02 Double the index as this table contains addresses.
  $C19E,$02 Add this offset to #REGix to point to the current handler.
  $C1A0,$06 Get the handler address and store it in #REGhl.
  $C1A6,$01 Stash the bit index and event flag byte on the stack.
  $C1A7,$04 Push #R$C1AC onto the stack so that the next return will go on to
. continue processing events.
  $C1AB,$01 Jump to the routine pointed to by *#REGhl to action the current
. event.
N $C1AC Once the event handler has run, this is where the routine will resume.
@ $C1AC label=GameEventChecker_Return
  $C1AC,$01 Restore the event bit index counter and event flag byte from the
. stack.
@ $C1AD label=GameEventChecker_Next
  $C1AD,$02 Decrease the event bit counter by one and loop back to #R$C186
. until all the event status bits have been processed.
N $C1AF Process scenic events.
@ $C1AF label=GameScenicEventsProcessor
  $C1AF,$01 No operation.
  $C1B0,$03 Load #REGhl with #R$BC78.
  $C1B3,$03 Load *#R$BD30 into #REGa.
  $C1B6,$03 Jump to #R$C1EF if there are no more scenic events to run (the
. count is zero).
  $C1B9,$01 Copy *#R$BD30 into #REGb as an event counter for the loop.
  $C1BA,$02 Jump to #R$C1BD.
N $C1BC This is the main scenic event loop.
@ $C1BC label=GameScenicEventChecker_Loop
  $C1BC,$01 Increment the scenic event pointer location by one.
@ $C1BD label=GameScenicEventChecker
  $C1BD,$04 Jump to #R$C1ED if the event room is #N$00 (deactivated).
  $C1C1,$06 Jump to #R$C1ED if *#R$BCCB is equal to the event room.
  $C1C7,$02 Stash the scenic event location pointer and event counter on the stack.
N $C1C9 This is: #REGe=*#R$BD30-#REGb.
  $C1C9,$05 Calculate the index of the currently processed event.
  $C1CE,$04 Load #R$BCCC into #REGix.
N $C1D2 The routine at #R$C1F0 is usually used to fetch an address from the
. given table, but here it's used to move #REGix to point to the index of the
. currently processed event (and this routine will fetch the address itself).
  $C1D2,$03 Call #R$C1F0.
  $C1D5,$04 Load a random number from #R$BB55 into #REGb.
  $C1D9,$02 Set #REGa to #N$FF (the room group terminator) for the comparison.
N $C1DB The table at #R$BCCC is indexed by event (there are #N$08 entries), but
. each address points to a "group" of room IDs where this event could occur.
. Each set of room IDs for the event is terminated using #N$FF.
@ $C1DB label=GameScenicEvent_FetchRoomGroup
  $C1DB,$06 Get the room group address pointer and store it in #REGhl.
  $C1E1,$02 Jump to #R$C1E4.
N $C1E3 Use the random number to select a room from the group - this loops
. through the rooms using #REGb as a counter.
@ $C1E3 label=GameScenicEvent_CountRooms_Loop
  $C1E3,$01 Move to the next room ID in the group.
@ $C1E4 label=GameScenicEvent_CountRoomsInGroup
  $C1E4,$03 Jump to #R$C1DB if the terminator is read from *#REGhl.
  $C1E7,$02 Decrease the random counter by one and loop back to #R$C1E3 until
. the counter is zero.
  $C1E9,$01 Load the current room ID into #REGa.
  $C1EA,$02 Restore the event counter and scenic event location pointer from the stack.
  $C1EC,$01 Update the scenic event location with the newly selected room.
@ $C1ED label=GameScenicEventChecker_Next
  $C1ED,$02 Decrease the scenic event counter by one and loop back to #R$C1BC
. until all scenic events have been processed.
N $C1EF All done, now return.
@ $C1EF label=GameEventsProcessor_Return
  $C1EF,$01 Return.

c $C1F0 Get Table Entry
@ $C1F0 label=GetTableEntry
D $C1F0 Retrieves an address from a table using a given index.
R $C1F0 E Index of item
R $C1F0 IX Base table address
R $C1F0 O:HL Address from the relevant table entry
R $C1F0 O:IX Address of the table entry
  $C1F0,$06 Multiply the given index by #N$02 and store the result in #REGde.
  $C1F6,$02 Add #REGde to the base table address.
  $C1F8,$06 Fetch the relevant table address and store it in #REGhl.
  $C1FE,$01 Return.

c $C1FF Print Objects
@ $C1FF label=PrintObjects
R $C1FF A #N$01 for inventory items, or room number for room objects
  $C1FF,$03 #REGhl=#R$BBF0.
  $C202,$04 #REGbc=*#R$BD28.
@ $C206 label=FindObject_Loop
  $C206,$02 Search for matching objects.
  $C208,$01 Return if no objects were found.
  $C209,$01 Stash the current place in #R$BBF0 on the stack.
  $C20A,$03 Call #R$C456.
  $C20D,$02 Jump to #R$C216 if the object is invalid.
  $C20F,$02 Temporarily stash the object type and object counter on the stack.
  $C211,$03 Call #R$BAB1.
  $C214,$02 Restore the object counter and object type from the stack.
@ $C216 label=FindObject_Next
  $C216,$01 Temporarily hold the object type in #REGe.
  $C217,$01 Restore the current place in #R$BBF0 from the stack.
  $C218,$02 Test if all objects have been checked...
  $C21A,$01 Restore the object type to #REGa.
  $C21B,$02 Jump to #R$C206 until all objects in the table have been checked.
  $C21D,$01 Return.

c $C21E Handler: Display Room Image
@ $C21E label=Handler_DisplayRoomImage
R $C21E E #N$01 If the image should be displayed, #N$00 if it should be skipped
D $C21E Determines if the current room has an image relating to it, and if it
. does - it jumps to the routine to display it.
N $C21E The game can also load without any graphics at all, so bail if there's
. nothing needed to do here.
  $C21E,$06 Jump to #R$C26A if *#R$BD2E is set to zero.
N $C224 The version of the game being played DOES have graphics, so continue.
  $C224,$03 Fetch *#R$BCCB and load it into #REGa.
  $C227,$03 Fetch the address of the table from *#R$BD14.
  $C22A,$04 Fetch the count of the number of rooms in the table from *#R$BD2E.
  $C22E,$02 Search to see if the current room ID is in the table.
  $C230,$02 Jump to #R$C26A if the current room ID does not appear in the
. table.
N $C232 The current room does have an image associated with it.
M $C232,$06 Calculate the index of the current room in the table.
  $C232,$03 #REGa=*#R$BD2E.
  $C235,$01 Increment #REGc by one.
  $C236,$01 #REGa-=#REGc.
  $C237,$01 #REGc=#REGa.
N $C238 The #REGe register is used as a flag to indicate that the room image
. should not be displayed, e.g. after the player has requested to view their
. inventory and have seen the room image already when they entered the
. location.
  $C238,$04 Jump to #R$C258 if #REGe was set to #N$01 (Display the image).
N $C23C The game also maintains a table of "already seen room images" so the
. player doesn't have to view an image for a room they've already been in.
N $C23C The player can view it manually by typing "LOOK" (or just "L").
  $C23C,$03 #REGhl=#R$BC5C.
  $C23F,$01 Copy the room image index into #REGa.
@ $C240 label=FindAlreadySeenByte_Loop
N $C240 Only two bytes hold the data for all #N$0C rooms with images so first -
. find the correct byte which references this room.
  $C240,$04 Jump to #R$C249 if the room index is less than #N$08.
  $C244,$02 Subtract #N$08 (number of bits in a byte) from the room index.
  $C246,$01 Increment the "image already seen" table pointer by one.
  $C247,$02 Jump back to #R$C240.
@ $C249 label=FoundAlreadySeenByte
N $C249 Now the correct byte has been found, check the appropriate bit.
N $C249 Create a mask with a single bit set corresponding to this rooms
. position (0-7) in the byte.
  $C249,$01 Copy the "image already seen" byte into #REGb.
  $C24A,$01 Increment #REGb by one to get the correct number of shifts.
  $C24B,$02 Start with all bits clear in #REGd.
@ $C24D label=AlreadySeenBitShift_Loop
  $C24D,$02 Rotate 1 bit left into position.
  $C24F,$02 Decrease the shift counter by one and loop back to #R$C24D until
. the bit is in the correct position.
N $C251 Test the bit held in #REGd against the room flag.
  $C251,$01 Fetch the current room flag.
  $C252,$03 If the room image has already been seen ... jump to #R$C26A.
N $C255 The room image hasn't already been seen, so update the bit to indicate
. that the player will have viewed it for the next time this routine runs.
  $C255,$03 Merge the set room bit with the room flags and write the result
. back to the room flag byte.
@ $C258 label=DisplayRoomImage
N $C258 Finally! Display the room image.
  $C258,$01 Temporarily stash #REGbc on the stack.
  $C259,$03 Call #R$BA6D.
  $C25C,$01 Restore #REGbc from the stack.
  $C25D,$04 Fetch the address of the table from *#R$BD16.
  $C261,$01 Load the location image index into #REGe.
  $C262,$03 Call #R$C1F0.
  $C265,$04 Push #R$C26A onto the stack so that the next return will go on to
. show the room exits.
  $C269,$01 Jump to the routine pointed to by *#REGhl to display the room
. image.

c $C26A Handler: Display Room Exits
@ $C26A label=Handler_RoomExits
D $C26A Handles displaying the exits available for the current room.
  $C26A,$03 Call #R$BA6D.
  $C26D,$05 Set up the printing position.
  $C272,$03 Call #R$C302 which loads #REGhl with the room data pointer.
  $C275,$02 Store this in #REGde for later.
N $C277 Count the number of exits in the room data.
  $C277,$02 Set an "exits" counter in #REGb of #N$06.
  $C279,$02 Initialise #REGc to #N$00 to count the number of valid exits.
  $C27B,$01 Set #REGa to #N$00 which is used just for the comparison.
@ $C27C label=RoomExitsCount_Loop
  $C27C,$01 Does this room have an exit?
  $C27D,$02 Jump to #R$C280 if this room doesn't have an exit for this
. position.
  $C27F,$01 Increment the valid exits count by one.
@ $C280 label=RoomExitsCount_Skip
  $C280,$01 Move to the next byte of room data.
  $C281,$02 Decrease the exits counter by one and loop back to #R$C27C until
. all the exits have been checked.
N $C283 Process the exits count result.
  $C283,$03 Jump to #R$C2EE if no exits were found.
  $C286,$05 Jump to #R$C2AD if more than #N$01 exit was found.
N $C28B Only one exit was found:
N $C28B Print "#STR$BDEC,$08($b==$FF)".
  $C28B,$03 #REGhl=#R$BDEC.
  $C28E,$03 Call #R$BAA4.
  $C291,$02 Retrieve the room data pointer and load it into #REGhl.
  $C293,$04 Set a pointer in #REGix to #R$BFE2.
  $C297,$01 Set #REGa to #N$00 which is used just for the comparison.
  $C298,$02 Jump to #R$C29F.
N $C29A Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $C29A label=RoomCheckForExit_Loop
  $C29A,$01 Move to the next byte of room data.
  $C29B,$04 Increment the direction name table pointer by two.
@ $C29F label=RoomCheckForExit
  $C29F,$03 Jump to #R$C29A if the current exit isn't a valid exit.
  $C2A2,$06 Get the direction name from the direction name table.
  $C2A8,$03 Call #R$BAA4 to print the direction name.
  $C2AB,$02 Jump to #R$C2E8.
N $C2AD More than one exit was found:
N $C2AD Print "#STR$BDD9,$08($b==$FF)".
@ $C2AD label=RoomMultipleExits
  $C2AD,$03 #REGhl=#R$BDD9.
  $C2B0,$03 Call #R$BAB1.
  $C2B3,$02 Retrieve the room data pointer and load it into #REGhl.
  $C2B5,$04 Set a pointer in #REGix to #R$BFE2.
  $C2B9,$01 Set #REGa to #N$00 which is used just for the comparison.
  $C2BA,$02 Jump to #R$C2C2.
N $C2BC So as not to corrupt the pointer to the room data (as #REGhl is also
. used when printing), it's temporarily held in #REGde.
@ $C2BC label=RoomExits_Initialise
  $C2BC,$01 Switch back the #REGde and #REGhl registers.
N $C2BD Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $C2BD label=RoomCheckForExits_Loop
  $C2BD,$01 Move to the next byte of room data.
  $C2BE,$04 Increment the direction name table pointer by two.
@ $C2C2 label=RoomCheckForExits
  $C2C2,$03 Jump to #R$C2BD if the current exit isn't a valid exit.
  $C2C5,$01 Temporarily store the room data pointer in #REGde.
  $C2C6,$06 Get the direction name from the direction name table.
  $C2CC,$03 Call #R$BAA4 to print the direction name.
  $C2CF,$01 Decrease the valid exits count by one.
  $C2D0,$05 Jump to #R$C2E8 if there are no more exits to process.
  $C2D5,$02 Jump to #R$C2DF if there is only one exit left to process.
N $C2D7 #HTML(Print a comma character: "<code>#CHR$2C</code>".)
  $C2D7,$02 #REGa=#N$2C.
  $C2D9,$03 Call #R$BAC3.
  $C2DC,$01 Reset #REGa back to #N$00 for the comparison.
  $C2DD,$02 Jump back to #R$C2BC to continue processing.
@ $C2DF label=RoomExits_PrintAmpersand
N $C2DF Print "#STR$BDD5,$08($b==$FF)".
  $C2DF,$03 #REGhl=#R$BDD5.
  $C2E2,$03 Call #R$BAA4.
  $C2E5,$01 Reset #REGa back to #N$00 for the comparison.
  $C2E6,$02 Jump to #R$C2BC to continue processing.
N $C2E8 Print "#STR$BF29,$08($b==$FF)".
@ $C2E8 label=RoomExits_PrintFullStop
  $C2E8,$03 #REGhl=#R$BF29.
  $C2EB,$03 Call #R$BAB1.
N $C2EE Are there any objects here?
@ $C2EE label=RoomExits_YouCanSee
  $C2EE,$03 #REGa=*#R$BCCB.
  $C2F1,$03 Call #R$C439.
  $C2F4,$01 Return if no objects were found at this location.
N $C2F5 Print "#STR$BDC6,$08($b==$FF)".
  $C2F5,$03 #REGhl=#R$BDC6.
  $C2F8,$03 Call #R$BAB1.
N $C2FB Print the objects at this location.
  $C2FB,$03 #REGa=*#R$BCCB.
  $C2FE,$03 Call #R$C1FF.
  $C301,$01 Return.

c $C302 Get Room Pointer
@ $C302 label=GetRoomPointer
R $C302 O:HL Pointer to the room data
M $C302,$06 Load the *#R$BCCB into #REGde.
  $C302,$04 #REGe=*#R$BCCB.
  $C306,$02 #REGd=#N$00.
  $C308,$02 Copy it into #REGhl.
  $C30A,$05 Mulitply by #N$06.
  $C30F,$05 Add the result to the base address *#R$BD10, stored in #REGhl.
  $C314,$01 Return.

c $C315 Print Room Description
@ $C315 label=Print_RoomDescription
R $C315 A Line number to begin printing
  $C315,$03 Write #REGa to *#R$BD70.
  $C318,$03 Call #R$BA89.
  $C31B,$03 #REGa=*#R$BCCB.
  $C31E,$04 #REGix=*#R$BD18.
  $C322,$01 Copy the room number into #REGe.
  $C323,$03 Call #R$C1F0.
  $C326,$03 Call #R$BAB1.
  $C329,$01 Return.

c $C32A Action: Examine Item
@ $C32A label=Action_ExamineItem
R $C32A C Item ID
R $C32A O:F Carry flag set when the item isn't present
  $C32A,$01 Increment #REGbc by one.
  $C32B,$05 #REGe=*#R$BD2A-#REGc.
  $C330,$01 Stash #REGde on the stack.
  $C331,$04 #REGix=*#R$BD1A.
  $C335,$03 Call #R$C1F0.
  $C338,$01 Restore #REGde from the stack.
  $C339,$02 Jump to #R$C33C.
@ $C33B label=ExamineItem_Loop
  $C33B,$01 Increment #REGhl by one.
@ $C33C label=ExamineItem
  $C33C,$05 Jump to #R$C347 if *#REGhl is equal to #N$FF.
  $C341,$03 Call #R$C35F.
  $C344,$02 Jump to #R$C33B if the item wasn't found.
  $C346,$01 Return.
N $C347 The item being examined isn't in the room or in the players inventory.
@ $C347 label=Response_ItemNotHere
N $C347 Print "#STR$BE1D,$08($b==$FF)".
  $C347,$03 #REGhl=#R$BE1D.
  $C34A,$03 Call #R$BAA4.
N $C34D Print the object name.
  $C34D,$04 #REGix=*#R$BD1C.
  $C351,$03 Call #R$C1F0.
  $C354,$03 Call #R$BAA4.
N $C357 Print "#STR$BE2A,$08($b==$FF)".
  $C357,$03 #REGhl=#R$BE2A.
  $C35A,$03 Call #R$BAB1.
  $C35D,$01 Set the carry flag.
  $C35E,$01 Return.

c $C35F Validate If Item Is Present
@ $C35F label=ValidateItemPresent
R $C35F A Object ID
R $C35F F Z flag set if the object is available
  $C35F,$02 Stash #REGhl and #REGde on the stack.
  $C361,$03 Store the object ID in #REGde.
  $C364,$04 Jump to #R$C36D if this is a scenic object.
N $C368 Else check the regular objects.
  $C368,$03 #REGhl=#R$BBF0.
  $C36B,$02 Jump to #R$C372.
N $C36D Prepare object ID for use.
@ $C36D label=Objects_UseScenicTable
  $C36D,$02 Clear the scenic flag.
  $C36F,$03 #REGhl=#R$BC78.
N $C372 Both object types continue from here.
@ $C372 label=Objects_CheckLocation
  $C372,$01 Add the object ID to the object/ event locations table.
  $C373,$06 Jump to #R$C37C if the object/ event table states that it's located
. in *#R$BCCB(the current room). Note also sets/ unsets the Z flag accordingly.
N $C379 Check the players inventory, as an object can still be used if it's
. being held.
  $C379,$03 Lastly, set the Z flag if the item is in the players inventory.
@ $C37C label=Handler_Objects_Return
N $C37C Housekeeping; restore #REGde and #REGhl to their previous values.
  $C37C,$02 Restore #REGde and #REGhl from the stack.
  $C37E,$01 Return.

c $C37F Match Phrase Tokens
@ $C37F label=MatchPhraseTokens
D $C37F Matches phrase patterns with multiple variations against user input
. tokens.
R $C37F HL A pointer to phrase token data
R $C37F O:F The Z flag is set if the input matches any pattern
  $C37F,$01 Switch the phrase token pointer to #REGde.
  $C380,$02 Jump to #R$C383.
N $C382 Skip the separator.
@ $C382 label=MatchPhraseTokens_Loop
  $C382,$01 Increment the phrase token pointer by one.
N $C383 Fetch the second user input token (not the first, as the first token
. is the verb and the second token onwards gives the context).
N $C383 For example; "GET" (verb) "KEG OF GUNPOWDER" (direct object).
@ $C383 label=MatchPhraseTokens_Start
  $C383,$03 #REGhl=#R$BD67.
  $C386,$02 Jump to #R$C38A.
N $C388 The tokens matched so advance both pointers.
@ $C388 label=MatchTokens_Loop
  $C388,$01 Increment the input token pointer by one.
  $C389,$01 Increment the pattern token pointer by one.
N $C38A Keep looping if the tokens match.
@ $C38A label=CompareTokens
  $C38A,$04 Jump to #R$C388 if the pattern token and the input token are the
. same.
N $C38E The tokens are different, but is it just that we are at the end of the
. pattern?
  $C38E,$04 Jump to #R$C396 unless this is the terminator character (#N$FE).
N $C392 Yes! The input tokens all matched against the phrase pattern tokens.
  $C392,$04 Return with Z flag result.
N $C396 The tokens are different, but is this a separator character?
@ $C396 label=CheckSeparator
  $C396,$04 Jump to #R$C3A0 if this is not the separator (#N$FD).
  $C39A,$05 Jump to #R$C382 if the input tokens are not complete.
  $C39F,$01 Return.
N $C3A0 The current variant doesn't match, so skip to the next one.
@ $C3A0 label=MatchPhraseTokens_Next
  $C3A0,$01 Increment the phrase token pointer by one.
  $C3A1,$05 Jump to #R$C3AC if the terminator has been reached (#N$FE).
  $C3A6,$04 Jump to #R$C3A0 if this is not the separator (#N$FD).
  $C3AA,$02 Jump to #R$C382.
N $C3AC The input doesn't match any patterns.
@ $C3AC label=MatchPhraseTokens_Return
  $C3AC,$01 Clear the Z flag.
  $C3AD,$01 Return.

c $C3AE Parser: Count Item References
@ $C3AE label=Parser_CountItems
D $C3AE Count how many tokens in the user input refer to game items.
R $C3AE O:A The number of references to items in the user input tokens
R $C3AE O:E As #REGa
R $C3AE O:F The Z flag is set when there are no items present in the input
  $C3AE,$03 Set a pointer to #R$BD66 in #REGhl.
  $C3B1,$02 Set a token count in #REGb of #N$0A which is the total length of
. the user input tokens.
  $C3B3,$02 Initialise the item counter held in #REGe to #N$00.
@ $C3B5 label=Parser_CountItems_Loop
  $C3B5,$01 Fetch a user input token.
  $C3B6,$04 Jump to #R$C3CD if the terminator character (#N$FF) has been
. reached.
  $C3BA,$02 Stash the token pointer and token counter on the stack.
  $C3BC,$03 #REGhl=*#R$BD1E.
  $C3BF,$04 Fetch the count of the number of items in the table from *#R$BD2A.
  $C3C3,$02 Search to see if the item room ID is in the table.
  $C3C5,$02 Restore the token counter and token pointer from the stack.
  $C3C7,$02 Jump to #R$C3CA if this token doesn't refer to a game item.
N $C3C9 This token does point to a game item, so increase the item counter.
  $C3C9,$01 Increment item counter by one.
@ $C3CA label=Parser_CountItems_Skip
  $C3CA,$01 Move to the next token.
  $C3CB,$02 Decrease the token counter by one and loop back to #R$C3B5 until
. all the tokens have been evaluated.
@ $C3CD label=Parser_CountItems_Process
  $C3CD,$02 Transfer the item count into #REGa and set flags accordingly.
  $C3CF,$01 Return.

c $C3D0 Object/ Event Locator
@ $C3D0 label=ObjectEventLocator
R $C3D0 A Object/ event ID
R $C3D0 O:A Room ID where the object is located
  $C3D0,$03 Load the event ID into #REGde.
  $C3D3,$04 Jump to #R$C3DC if this is a scenic object/ event.
N $C416 Handle non-scenic events.
  $C3D7,$03 #REGhl=#R$BBF0.
  $C3DA,$02 Jump to #R$C3E1.
@ $C3DC label=ObjectEventLocator_ScenicEvents
  $C3DC,$03 #REGhl=#R$BC78.
N $C3DF Prepare object/ event ID for use.
  $C3DF,$02 Clear the scenic flag.
@ $C3E1 label=ObjectEventLocator_Return
  $C3E1,$01 Add the event ID to the event locations table.
  $C3E2,$01 #REGa=*#REGhl.
  $C3E3,$01 Return.

c $C3E4 Is Object In Inventory?
@ $C3E4 label=CheckObjectInInventory
R $C3E4 A Object ID
R $C3E4 O:F Z flag set if object is in the players inventory
N $C3E4 The #R$C3D0 routine returns with #REGa containing the room ID of the
. requested object.
  $C3E4,$03 Call #R$C3D0.
  $C3E7,$02 Compare #REGa with #N$01 (inventory).
  $C3E9,$01 Return.

c $C3EA Handler: Destroy Item/ Event
@ $C3EA label=Handler_DestroyItemEvent
D $C3EA Updates a given item/ event ID so it's then "inactive" (has a location
. ID of #N$00).
R $C3EA A Item/ event ID
  $C3EA,$01 Load the item/ event ID into #REGb.
  $C3EB,$02 Set the room ID to #N$00 which will deactivate the item/ event.
  $C3ED,$03 Call #R$C412.
  $C3F0,$01 Return.

c $C3F1 Handler: Update Item/ Event For The Current Room
@ $C3F1 label=Handler_UpdateItemEventCurrentRoom
D $C3F1 Updates a given item/ event ID so it appears in the current room. Used
. for example, when an item is dropped (so it changes from being #N$01 - in the
. players inventory, to the current room ID).
R $C3F1 A Item/ event ID
  $C3F1,$01 Load the item/ event ID into #REGb.
  $C3F2,$04 Load #REGc with *#R$BCCB.
  $C3F6,$03 Call #R$C412.
  $C3F9,$01 Return.

c $C3FA Set Scenic Event As Triggered
@ $C3FA label=ScenicEventTriggered
R $C3FA A Scenic event ID (+#N$80)
  $C3FA,$01 Copy the scenic event ID into #REGb.
  $C3FB,$02 Set #REGc to #N$FF which denotes that the event has fired already
. and shouldn't be repeated.
  $C3FD,$03 Call #R$C412.
  $C400,$01 Return.

c $C401 Check Active Scenic Events
@ $C401 label=CheckActiveScenicEvents
R $C401 HL Pointer to scenic data
R $C401 A 
R $C401 O:F The Z flag is set then there are no matching scenic events
  $C401,$02 Jump to #R$C404.
@ $C403 label=ActiveScenicEvents_Loop
  $C403,$01 Move to the next event ID.
@ $C404 label=ActiveScenicEvents_CheckNext
  $C404,$05 Jump to #R$C410 if *#REGhl is equal to #N$FF.
  $C409,$03 Call #R$C35F.
  $C40C,$02 Jump to #R$C403 if the Z flag is not set.
  $C40E,$01 #REGa=*#REGhl.
  $C40F,$01 Return.
@ $C410 label=NoActiveScenicEvents
  $C410,$01 Set Z flag.
  $C411,$01 Return.

c $C412 Handler: Update Object Location
@ $C412 label=Handler_UpdateObjectLocation
R $C412 B Object/ event ID
R $C412 C Room ID for the update (can also be #N$00)
  $C412,$04 Jump to #R$C41D if this is a normal object/ event.
N $C416 Prepare object/ event ID for use.
  $C416,$02 Clear the scenic flag.
  $C418,$03 #REGhl=#R$BC78.
  $C41B,$02 Jump to #R$C420.
@ $C41D label=UpdateObjectLocation_NonScenic
N $C41D Handle non-scenic events.
  $C41D,$03 #REGhl=#R$BBF0.
N $C420 Both object/ event types continue from here.
@ $C420 label=UpdateObjectLocation
  $C420,$03 Load the event ID into #REGde.
  $C423,$01 Add the event ID to the event locations table.
  $C424,$01 Update the table with the new room ID in #REGc.
  $C425,$01 Return.

c $C426 Transform Item
@ $C426 label=TransformItem
R $C426 B From item ID
R $C426 C To item ID
D $C426 Rather than use item properties, the game just has separate objects
. that don't exist until an action is performed.
.
. An example is:
. #TABLE(default,centre,centre)
. { =h Item ID | =h Item Name }
. { #N$02 | #ITEM$02 }
. { #N$03 | #ITEM$03 }
. TABLE#
. When the match is lit by the player; item #N$02 is destroyed and replaced
. with item #N$03.
  $C426,$01 #REGa=#REGb.
  $C427,$03 Call #R$C3D0.
  $C42A,$02 Stash #REGbc and #REGaf on the stack.
  $C42C,$02 #REGc=#N$00.
  $C42E,$03 Call #R$C412.
  $C431,$02 Restore #REGaf and #REGbc from the stack.
  $C433,$01 #REGb=#REGc.
  $C434,$01 #REGc=#REGa.
  $C435,$03 Call #R$C412.
  $C438,$01 Return.

c $C439 Check Room Objects
@ $C439 label=CheckRoomObjects
R $C439 A Room number
R $C439 O:A #N$00 or #N$01 if objects are found or not
  $C439,$03 #REGhl=#R$BBF0.
  $C43C,$04 #REGbc=*#R$BD28.
@ $C440 label=CheckRoomObjects_Loop
  $C440,$02 Search for the room number in the table.
  $C442,$01 Return if no objects are found.
  $C443,$01 Stash the object location table pointer on the stack.
  $C444,$03 Call #R$C456.
  $C447,$01 Restore the object location table pointer from the stack.
  $C448,$02 Jump to #R$C454 if there are no objects found here.
  $C44A,$01 Temporarily store #REGa in #REGe.
  $C44B,$02 Are there more objects to check?
  $C44D,$01 Restore the #REGa register.
  $C44E,$02 Jump to #R$C440 if there are more objects to check.
N $C450 Set the "successful" output.
  $C450,$02 Set #REGa to #N$01 to indicate that objects were found.
  $C452,$01 Set flags.
  $C453,$01 Return.
N $C454 Set the "failure" output.
@ $C454 label=NoRoomObjectsFound
  $C454,$01 Set #REGa to #N$00 to indicate that no objects were found.
  $C455,$01 Return.

c $C456 Validate Object
@ $C456 label=ValidateObject
R $C456 BC Object counter
R $C456 O:F Z is unset if the object is valid, unset when invalid 
  $C456,$02 Stash #REGaf and #REGbc on the stack.
  $C458,$01 Adjust the object counter.
  $C459,$03 #REGa=*#R$BD28.
  $C45C,$02 Calculate the index and store the result in #REGe.
  $C45E,$04 #REGix=*#R$BD12.
  $C462,$03 Call #R$C1F0.
  $C465,$01 Restore the object counter from the stack.
  $C466,$04 Jump to #R$C46D if the object is invalid.
  $C46A,$01 Restore the object type from the stack.
  $C46B,$01 Clear the Z flag.
  $C46C,$01 Return.
@ $C46D label=InvalidObject
  $C46D,$01 Restore #REGaf from the stack.
  $C46E,$01 Set the Z flag.
  $C46F,$01 Return.

c $C470 Parser: Validate No Direct Object
@ $C470 label=Parser_ValidateNoDirectObject
D $C470 The opposite of #R$C47B, checks that there's no direct object.
R $C470 O:F The Z flag is set when there's no direct object present
R $C470 O:F The carry flag is set when there's a second token set
  $C470,$06 Return if the second token (*#R$BD67) is the terminator
. character (#N$FF).
N $C476 Print "#STR$BEEA,$08($b==$FF)".
  $C476,$03 Call #R$BFEE.
  $C479,$01 Set the carry flag to indicate the command is malformed.
  $C47A,$01 Return.

c $C47B Parser: Validate Direct Object
@ $C47B label=Parser_ValidateDirectObject
D $C47B In most adventure games, the structure for a command is "verb + direct
. object". This is usually how the player interacts with the game world.
. The verb describes the action, and the direct object is what the action is
. performed on. For example; "TAKE SHOE" uses the verb "TAKE" on the direct
. object "SHOE".
R $C47B O:F The carry flag is set when the command is malformed
N $C47B The first token is the verb, so target the second token for the direct
. object.
  $C47B,$03 Fetch the #R$BD67(second token from the user input) and store it in
. #REGa.
  $C47E,$04 Jump forward to #R$C487 if the token is anything other than the
. terminator character (#N$FF).
N $C482 The token was the terminator character (#N$FF), so the sentence is
. malformed.
N $C482 E.g. They tried "TAKE" but didn't write anything after it.
  $C482,$03 Call #R$BFF5.
  $C485,$01 Set the carry flag to indicate this call was a failure.
  $C486,$01 Return.
N $C487 Process the direct object.
@ $C487 label=DirectObject_Process
  $C487,$03 Call #R$C3AE.
  $C48A,$01 Return if #REGa is not equal to #N$FF.
  $C48B,$03 Call #R$BFEE.
  $C48E,$01 Set the carry flag to indicate the command is malformed.
  $C48F,$01 Return.

c $C490
  $C490,$03 #REGa=*#R$BD67.
  $C493,$03 Return if #REGa is equal to #N$FF.
  $C496,$03 Call #R$C3AE.
  $C499,$01 Return if #REGa is not equal to #N$FF.
  $C49A,$03 Call #R$BFEE.
  $C49D,$01 Set the carry flag.
  $C49E,$01 Return.

c $C49F
  $C49F,$03 Call #R$C47B.
  $C4A2,$01 Return if the direct object is malformed.
  $C4A3,$04 Jump to #R$C4AC if #REGa is not equal to #N$01.
  $C4A7,$03 Call #R$BFF5.
  $C4AA,$01 Set the carry flag.
  $C4AB,$01 Return.
  $C4AC,$04 Jump to #R$C4B2 if #REGa is greater than or equal to #N$03.
  $C4B0,$01 Set flags.
  $C4B1,$01 Return.
  $C4B2,$03 Call #R$BFEE.
  $C4B5,$01 Set the carry flag.
  $C4B6,$01 Return.

c $C4B7
  $C4B7,$03 #REGa=*#R$BD67.
  $C4BA,$04 Jump to #R$C4C3 if #REGa is not equal to #N$FF.
  $C4BE,$03 Call #R$BFF5.
  $C4C1,$01 Set the carry flag.
  $C4C2,$01 Return.
  $C4C3,$03 Call #R$C3AE.
  $C4C6,$01 Return.

c $C4C7 Parser: Process Item
@ $C4C7 label=Parser_ProcessItem
  $C4C7,$03 #REGhl=#R$BD66.
  $C4CA,$02 #REGb=#N$0A.
  $C4CC,$04 Return if *#REGhl is equal to #N$FF.
  $C4D0,$02 Stash #REGhl and #REGbc on the stack.
  $C4D2,$03 #REGhl=*#R$BD1E.
  $C4D5,$04 #REGbc=*#R$BD2A.
  $C4D9,$02 CPIR.
  $C4DB,$02 Jump to #R$C4E5 if #REGa is not equal to #N$FF.
  $C4DD,$03 Call #R$C32A.
  $C4E0,$02 Jump to #R$C4E5 if #REGa is greater than or equal to #N$FF.
  $C4E2,$02 Restore #REGbc and #REGhl from the stack.
  $C4E4,$01 Return.

  $C4E5,$02 Restore #REGbc and #REGhl from the stack.
  $C4E7,$01 Increment #REGhl by one.
  $C4E8,$02 Decrease counter by one and loop back to #R$C4CC until counter is zero.
  $C4EA,$01 Return.

c $C4EB Handler: Scenic Events
@ $C4EB label=Handler_ScenicEvents
D $C4EB Handles checking if a scenic event should occur ... and also, handles
. jumping to the correct related scenic event routine to action it.
  $C4EB,$03 #REGhl=#R$BC78.
  $C4EE,$04 Set a counter in #REGbc for *#R$BD30.
@ $C4F2 label=Handler_ScenicEvents_Loop
  $C4F2,$03 Load *#R$BCCB into #REGa.
  $C4F5,$02 Search for the matching room.
  $C4F7,$02 Jump to #R$C51F if no events at all were found in the table.
N $C4F9 An event was found to be processed!
N $C4F9 First though, stash away the current pointer and index in the search,
. so this can be resumed later.
  $C4F9,$03 Write the table position to *#R$BD7D.
  $C4FC,$04 Write the counter to *#R$BD7F.
N $C500 Calculate the event index and get the event handler.
  $C500,$01 Adjust the counter for the sum.
  $C501,$03 #REGhl=*#R$BD30.
  $C504,$03 Calculate the index.
  $C507,$01 Move the index into #REGde (as #R$C1F0 uses #REGe).
  $C508,$04 Load #REGix with *#R$BD24 which contains a pointer to the scenic
. event rountines jump table.
  $C50C,$03 Call #R$C1F0.
  $C50F,$04 Push #R$C514 onto the stack (as the return address).
  $C513,$01 Jump to the event handler held by #REGhl.
N $C514 This is the return point after the handler has finished executing.
@ $C514 label=ScenicEvents_PostProcessing
  $C514,$03 Restore *#R$BD7D to #REGhl.
  $C517,$04 Restore *#R$BD7F to #REGbc.
  $C51B,$04 Jump to #R$C4F2 if there are any further events to process.
@ $C51F label=ScenicEvents_Return
  $C51F,$01 Return.

c $C520
  $C520,$01 #REGc=#REGa.
  $C521,$04 #REGb=*#R$BD30.
  $C525,$03 #REGa=*#R$BCCB.
  $C528,$03 #REGhl=#R$BC78.
  $C52B,$02 Jump to #R$C52E.
  $C52D,$01 Increment #REGhl by one.
  $C52E,$03 Jump to #R$C532 if #REGa is not equal to *#REGhl.
  $C531,$01 Write #REGc to *#REGhl.
  $C532,$02 Decrease counter by one and loop back to #R$C52D until counter is zero.
  $C534,$01 #REGa=#REGc.
  $C535,$03 Write #REGa to *#R$BCCB.
  $C538,$03 #REGa=*#R$BC6F.
  $C53B,$03 Jump to #R$C555 if #REGa is zero.
  $C53E,$02 #REGb=#N$08.
  $C540,$03 #REGhl=#R$BC70.
  $C543,$01 #REGc=#REGa.
  $C544,$02 Jump to #R$C547.
  $C546,$01 Increment #REGhl by one.
  $C547,$02 Shift #REGc right.
  $C549,$02 Jump to #R$C553 if #REGhl is greater than or equal to #REGa.
  $C54B,$01 #REGa=*#REGhl.
  $C54C,$02 Stash #REGhl and #REGbc on the stack.
  $C54E,$03 Call #R$C3F1.
  $C551,$02 Restore #REGbc and #REGhl from the stack.
  $C553,$02 Decrease counter by one and loop back to #R$C546 until counter is zero.
  $C555,$01 Return.

c $C556
  $C556,$03 #REGhl=*#R$BD26.
  $C559,$04 #REGbc=*#R$BD2C.
  $C55D,$03 #REGa=*#R$BD66.
  $C560,$02 CPIR.
  $C562,$02 Jump to #R$C56B if ?? is equal to #N$00.
N $C564 Print "#STR$BD91,$08($b==$FF)".
  $C564,$03 #REGhl=#R$BD91.
  $C567,$03 Call #R$BAB1.
  $C56A,$01 Return.

  $C56B,$04 #REGa=*#R$BD2C-#REGc.
  $C56F,$01 Decrease #REGa by one.
  $C570,$01 Store the result in #REGe.
  $C571,$04 #REGix=*#R$BD20.
  $C575,$03 Call #R$C1F0.
  $C578,$01 Jump to *#REGhl.

c $C579 Pause, Print String And Scroll
@ $C579 label=PausePrintStringAndScroll
D $C579 For dramatic effect! Used when an event occurs.
  $C579,$05 Call #R$BB51 using #N$19 HALT loops (for a short pause).
  $C57E,$03 Call #R$BAB1.
  $C581,$01 Return.

c $C582 Generate Random Number
@ $C582 label=GenerateRandomNumber
R $C582 A Maximum value of generated number
  $C582,$01 Stash #REGbc on the stack.
  $C583,$01 Store the maximum number in #REGc.
  $C584,$03 Call #R$BB55.
  $C587,$01 Use the frames number as a loop counter in #REGb.
  $C588,$01 Restore the maximum number value back to #REGa.
@ $C589 label=GenerateRandomNumber_Loop
  $C589,$01 Decrease the maximum number value by one.
  $C58A,$02 Jump to #R$C58D if the maximum number value is not equal to zero.
  $C58C,$01 Restore the maximum number value back to #REGa.
@ $C58D label=GenerateRandomNumber_Next
  $C58D,$02 Decrease the loop counter by one and loop back to #R$C589 until the
. loop counter is zero.
  $C58F,$01 Decrease the maximum number value by one.
  $C590,$01 Restore #REGbc from the stack.
  $C591,$01 Return.

c $C592 Game Start Alias
@ $C592 label=GameStart_Alias
  $C592,$03 Jump to #R$FD82.

t $C595 Messaging: "A Ladder Leading Down To A<CR>Small Rowing Boat Alongside."
@ $C595 label=Messaging_LadderLeadingDownToASmallRowingBoat
  $C595,$37 "#STR$C595,$08($b==$FF)".
B $C5CC,$01 Terminator.

t $C5CD Messaging: "You Are Alongside Your Ship.<CR>A Ladder Leads Up To The Deck."
@ $C5CD label=Messaging_AlongsideYourShip
  $C5CD,$3B "#STR$C5CD,$08($b==$FF)".
B $C608,$01 Terminator.

t $C609 Messaging: "A Match."
@ $C609 label=Messaging_Match
  $C609,$08 "#STR$C609,$08($b==$FF)".
B $C611,$01 Terminator.

t $C612 Messaging: "A Lighted Match."
@ $C612 label=Messaging_LitMatch
  $C612,$10 "#STR$C612,$08($b==$FF)".
B $C622,$01 Terminator.

t $C623 Messaging: "A Plank."
@ $C623 label=Messaging_Plank
  $C623,$08 "#STR$C623,$08($b==$FF)".
B $C62B,$01 Terminator.

t $C62C Messaging: "A Plank,Spanning The Pit."
@ $C62C label=Messaging_PlankSpanningThePit
  $C62C,$19 "#STR$C62C,$08($b==$FF)".
B $C645,$01 Terminator.

t $C646 Messaging: "A Coconut."
@ $C646 label=Messaging_Coconut
  $C646,$0A "#STR$C646,$08($b==$FF)".
B $C650,$01 Terminator.

t $C651 Messaging: "A Rod."
@ $C651 label=Messaging_Rod
  $C651,$06 "#STR$C651,$08($b==$FF)".
B $C657,$01 Terminator.

t $C658 Messaging: "A Small Round Hole To<CR>The Side Of The Door."
@ $C658 label=Messaging_SmallRoundHoleSideOfTheDoor
  $C658,$2B "#STR$C658,$08($b==$FF)".
B $C683,$01 Terminator.

t $C684 Messaging: "A Hole With A Rod Inserted,<CR>To The Side Of The Door."
@ $C684 label=Messaging_HoleWithARodInserted
  $C684,$34 "#STR$C684,$08($b==$FF)".
B $C6B8,$01 Terminator.

t $C6B9 Messaging: "A Bottle."
@ $C6B9 label=Messaging_Bottle
  $C6B9,$09 "#STR$C6B9,$08($b==$FF)".
B $C6C2,$01 Terminator.

t $C6C3 Messaging: "A Bottle Of Rum."
@ $C6C3 label=Messaging_BottleOfRum
  $C6C3,$10 "#STR$C6C3,$08($b==$FF)".
B $C6D3,$01 Terminator.

t $C6D4 Messaging: "Some Fruit."
@ $C6D4 label=Messaging_Fruit
  $C6D4,$0B "#STR$C6D4,$08($b==$FF)".
B $C6DF,$01 Terminator.

t $C6E0 Messaging: "A Gun."
@ $C6E0 label=Messaging_Gun
  $C6E0,$06 "#STR$C6E0,$08($b==$FF)".
B $C6E6,$01 Terminator.

t $C6E7 Messaging: "An Eyepatch."
@ $C6E7 label=Messaging_Eyepatch
  $C6E7,$0C "#STR$C6E7,$08($b==$FF)".
B $C6F3,$01 Terminator.

t $C6F4 Messaging: "An Eyepatch,<CR>Which You Are Wearing."
@ $C6F4 label=Messaging_EyepatchWorn
  $C6F4,$23 "#STR$C6F4,$08($b==$FF)".
B $C717,$01 Terminator.

t $C718 Messaging: "A Keg Of Gunpowder."
@ $C718 label=Messaging_KegOfGunpowder
  $C718,$13 "#STR$C718,$08($b==$FF)".
B $C72B,$01 Terminator.

t $C72C Messaging: "A Crocodile."
@ $C72C label=Messaging_Crocodile
  $C72C,$0C "#STR$C72C,$08($b==$FF)".
B $C738,$01 Terminator.

t $C739 Messaging: "A Crocodile,With A Keg Of<CR>Gunpowder In Its Mouth.<CR>The Powder Is Spilling Out."
@ $C739 label=Messaging_CrocodileWithKegOfGunpowder
  $C739,$4D "#STR$C739,$08($b==$FF)".
B $C786,$01 Terminator.

t $C787 Messaging: "A Shoe."
@ $C787 label=Messaging_Shoe
  $C787,$07 "#STR$C787,$08($b==$FF)".
B $C78E,$01 Terminator.

t $C78F Messaging: "A Sextant."
@ $C78F label=Messaging_Sextant
  $C78F,$0A "#STR$C78F,$08($b==$FF)".
B $C799,$01 Terminator.

t $C79A Messaging: "A Watch."
@ $C79A label=Messaging_Watch
  $C79A,$08 "#STR$C79A,$08($b==$FF)".
B $C7A2,$01 Terminator.

t $C7A3 Messaging: "You Are Surrounded By Natives.<CR>They Are Licking Their Lips<CR>In A Very Disturbing Manner.<CR>One Brandishes A Spear."
@ $C7A3 label=Messaging_Cannibals
  $C7A3,$6F "#STR$C7A3,$08($b==$FF)".
B $C812,$01 Terminator.

t $C813 Messaging: "A Group Of Natives,<CR>Examining A Watch."
@ $C813 label=Messaging_CannibalsWithWatch
  $C813,$26 "#STR$C813,$08($b==$FF)".
B $C839,$01 Terminator.

t $C83A Messaging: "A Spear."
@ $C83A label=Messaging_Spear
  $C83A,$08 "#STR$C83A,$08($b==$FF)".
B $C842,$01 Terminator.

t $C843 Messaging: "A Strangely Coloured Fish."
@ $C843 label=Messaging_Fish
  $C843,$1A "#STR$C843,$08($b==$FF)".
B $C85D,$01 Terminator.

t $C85E Messaging: "A Red Herring."
@ $C85E label=Messaging_RedHerring
  $C85E,$0E "#STR$C85E,$08($b==$FF)".
B $C86C,$01 Terminator.

t $C86D Messaging: "The Jewels Of Babylon."
@ $C86D label=Messaging_Jewels
  $C86D,$16 "#STR$C86D,$08($b==$FF)".
B $C883,$01 Terminator.

t $C884 Messaging: "A Crowbar."
@ $C884 label=Messaging_Crowbar
  $C884,$0A "#STR$C884,$08($b==$FF)".
B $C88E,$01 Terminator.

t $C88F Messaging: "A Key."
@ $C88F label=Messaging_Key
  $C88F,$06 "#STR$C88F,$08($b==$FF)".
B $C895,$01 Terminator.

t $C896 Messaging: "A Human Skull."
@ $C896 label=Messaging_Skull
  $C896,$0E "#STR$C896,$08($b==$FF)".
B $C8A4,$01 Terminator.

t $C8A5 Messaging: "You Are At The Island."
@ $C8A5 label=Messaging_YouAreAtTheIsland
  $C8A5,$16 "#STR$C8A5,$08($b==$FF)".
B $C8BB,$01 Terminator.

t $C8BC Messaging: "A Sleeping Pirate."
@ $C8BC label=Messaging_SleepingPirate
  $C8BC,$12 "#STR$C8BC,$08($b==$FF)".
B $C8CE,$01 Terminator.

t $C8CF Messaging: "A Dead Pirate."
@ $C8CF label=Messaging_DeadPirate
  $C8CF,$0E "#STR$C8CF,$08($b==$FF)".
B $C8DD,$01 Terminator.

t $C8DE Messaging: "A Parrot,Eyeing You<CR>With Suspicion."
@ $C8DE label=Messaging_SuspiciousParrot
  $C8DE,$23 "#STR$C8DE,$08($b==$FF)".
B $C901,$01 Terminator.

t $C902 Messaging: "A Dead Parrot."
@ $C902 label=Messaging_DeadParrot
  $C902,$0E "#STR$C902,$08($b==$FF)".
B $C910,$01 Terminator.

t $C911 Messaging: "A Giant Crab.<CR>It Advances Toward You."
@ $C911 label=Messaging_GiantCrab
  $C911,$25 "#STR$C911,$08($b==$FF)".
B $C936,$01 Terminator.

t $C937 Messaging: "A Lion.<CR>It Is About To Pounce On You."
@ $C937 label=Messaging_Lion
  $C937,$25 "#STR$C937,$08($b==$FF)".
B $C95C,$01 Terminator.

t $C95D Messaging: "A Giant Octopus."
@ $C95D label=Messaging_Octopus
  $C95D,$10 "#STR$C95D,$08($b==$FF)".
B $C96D,$01 Terminator.

t $C96E Messaging: "A Closed Door."
@ $C96E label=Messaging_ClosedDoor
  $C96E,$0E "#STR$C96E,$08($b==$FF)".
B $C97C,$01 Terminator.

t $C97D Messaging: "An Open Door."
@ $C97D label=Messaging_OpenDoor
  $C97D,$0D "#STR$C97D,$08($b==$FF)".
B $C98A,$01 Terminator.

t $C98B Messaging: "The Door Is Open."
@ $C98B label=Messaging_DoorIsOpen
  $C98B,$11 "#STR$C98B,$08($b==$FF)".
B $C99C,$01 Terminator.

t $C99D Messaging: "The Door Is Closed."
@ $C99D label=Messaging_DoorIsClosed
  $C99D,$13 "#STR$C99D,$08($b==$FF)".
B $C9B0,$01 Terminator.

t $C9B1 Messaging: "A Smooth,Vertical Slab Of Rock."
@ $C9B1 label=Messaging_Rock
  $C9B1,$1F "#STR$C9B1,$08($b==$FF)".
B $C9D0,$01 Terminator.

t $C9D1 Messaging: "An Open Trapdoor."
@ $C9D1 label=Messaging_OpenTrapdoor
  $C9D1,$11 "#STR$C9D1,$08($b==$FF)".
B $C9E2,$01 Terminator.

t $C9E3 Messaging: "The Body Of A Sailor."
@ $C9E3 label=Messaging_Sailor
  $C9E3,$15 "#STR$C9E3,$08($b==$FF)".
B $C9F8,$01 Terminator.

t $C9F9 Messaging: "A Makeshift Bridge.<CR>It Spans The Ravine."
@ $C9F9 label=Messaging_BridgeAcrossRavine
  $C9F9,$28 "#STR$C9F9,$08($b==$FF)".
B $CA21,$01 Terminator.

t $CA22 Messaging: "A Makeshift Bridge."
@ $CA22 label=Messaging_Bridge
  $CA22,$13 "#STR$CA22,$08($b==$FF)".
B $CA35,$01 Terminator.

t $CA36 Messaging: "A Boulder,Teetering On The<CR>Brink Of A Ledge,Far Above."
@ $CA36 label=Messaging_BoulderOnLedge
  $CA36,$36 "#STR$CA36,$08($b==$FF)".
B $CA6C,$01 Terminator.

t $CA6D Messaging: "A Boulder."
@ $CA6D label=Messaging_Boulder
  $CA6D,$0A "#STR$CA6D,$08($b==$FF)".
B $CA77,$01 Terminator.

t $CA78 Messaging: "A Ring,Set Into The Floor."
@ $CA78 label=Messaging_Ring
  $CA78,$1A "#STR$CA78,$08($b==$FF)".
B $CA92,$01 Terminator.

t $CA93 Messaging: "A Trail Of Slime,Leading<CR>Into The Cave."
@ $CA93 label=Messaging_Slime
  $CA93,$27 "#STR$CA93,$08($b==$FF)".
B $CABA,$01 Terminator.

t $CABB Messaging: "A Very Large Stone."
@ $CABB label=Messaging_LargeStone
  $CABB,$13 "#STR$CABB,$08($b==$FF)".
B $CACE,$01 Terminator.

t $CACF Messaging: "A Rowing Boat."
@ $CACF label=Messaging_RowingBoat
  $CACF,$0E "#STR$CACF,$08($b==$FF)".
B $CADD,$01 Terminator.

t $CADE Messaging: "A Ship Anchored Offshore,<CR>To The South."
@ $CADE label=Messaging_Ship
  $CADE,$27 "#STR$CADE,$08($b==$FF)".
B $CB05,$01 Terminator.

t $CB06 Messaging: "The Open Sea.<CR>You Are Totally Lost."
@ $CB06 label=Messaging_OpenSea
  $CB06,$23 "#STR$CB06,$08($b==$FF)".
B $CB29,$01 Terminator.

t $CB2A Messaging: "On Board Your Ship,Anchored<CR>To The South Of A Large Island."
@ $CB2A label=Messaging_OnBoardYourShip
  $CB2A,$3B "#STR$CB2A,$08($b==$FF)".
B $CB65,$01 Terminator.

t $CB66 Messaging: "In A Rowing Boat."
@ $CB66 label=Messaging_InRowingBoat
  $CB66,$11 "#STR$CB66,$08($b==$FF)".
B $CB77,$01 Terminator.

t $CB78 Messaging: "The Long Sandy Beach."
@ $CB78 label=Messaging_LongSandyBeach
  $CB78,$15 "#STR$CB78,$08($b==$FF)".
B $CB8D,$01 Terminator.

t $CB8E Messaging: "The Dunes.<CR>Among Towering Mounds Of<CR>Drifting Sand."
@ $CB8E label=Messaging_TheDunes
  $CB8E,$32 "#STR$CB8E,$08($b==$FF)".
B $CBC0,$01 Terminator.

t $CBC1 Messaging: "The Stand Of Palm Trees.<CR>The Large Leaves Gently Sway<CR>In The Warm,Tropical Breeze."
@ $CBC1 label=Messaging_StandOfPalmTrees
  $CBC1,$52 "#STR$CBC1,$08($b==$FF)".
B $CC13,$01 Terminator.

t $CC14 Messaging: "The Hillside Path."
@ $CC14 label=Messaging_HillsidePath
  $CC14,$12 "#STR$CC14,$08($b==$FF)".
B $CC26,$01 Terminator.

t $CC27 Messaging: "By A Pool Of Clear,Glistening<CR>Water."
@ $CC27 label=Messaging_PoolClearWater
  $CC27,$24 "#STR$CC27,$08($b==$FF)".
B $CC4B,$01 Terminator.

t $CC4C Messaging: "The Narrow Gulley.<CR>Cut Into The Rock By Water<CR>From The Pool Above."
@ $CC4C label=Messaging_NarrowGulley
  $CC4C,$42 "#STR$CC4C,$08($b==$FF)".
B $CC8E,$01 Terminator.

t $CC8F Messaging: "The Hilltop.<CR>The Highest Point Of The Island."
@ $CC8F label=Messaging_TheHilltop
  $CC8F,$2D "#STR$CC8F,$08($b==$FF)".
B $CCBC,$01 Terminator.

t $CCBD Messaging: "The Waterfall.<CR>A Mighty Torrent Of Cascading<CR>Water."
@ $CCBD label=Messaging_TheWaterfall
  $CCBD,$33 "#STR$CCBD,$08($b==$FF)".
B $CCF0,$01 Terminator.

t $CCF1 Messaging: "The Narrow Path.<CR>Behind The Waterfall."
@ $CCF1 label=Messaging_NarrowPath
  $CCF1,$26 "#STR$CCF1,$08($b==$FF)".
B $CD17,$01 Terminator.

t $CD18 Messaging: "The Thicket.<CR>A Maze Of Paths Lead<CR>Through The Undergrowth."
@ $CD18 label=Messaging_Thicket
  $CD18,$3A "#STR$CD18,$08($b==$FF)".
B $CD52,$01 Terminator.

t $CD53 Messaging: "The Cannibals' Village."
@ $CD53 label=Messaging_CannibalsVillage
  $CD53,$17 "#STR$CD53,$08($b==$FF)".
B $CD6A,$01 Terminator.

t $CD6B Messaging: "The Woodland Path."
@ $CD6B label=Messaging_WoodlandPath
  $CD6B,$12 "#STR$CD6B,$08($b==$FF)".
B $CD7D,$01 Terminator.

t $CD7E Messaging: "The Woodland Clearing.<CR>Trees And Undergrowth Have<CR>Been Cut Down."
@ $CD7E label=Messaging_WoodlandClearing
  $CD7E,$40 "#STR$CD7E,$08($b==$FF)".
B $CDBE,$01 Terminator.

t $CDBF Messaging: "The High Ridge."
@ $CDBF label=Messaging_HighRidge
  $CDBF,$0F "#STR$CDBF,$08($b==$FF)".
B $CDCE,$01 Terminator.

t $CDCF Messaging: "The Valley.<CR>A Thin Miasma Of Mist Covers<CR>The Rich Verdant Grass."
@ $CDCF label=Messaging_TheValley
  $CDCF,$40 "#STR$CDCF,$08($b==$FF)".
B $CE0F,$01 Terminator.

t $CE10 Messaging: "The Fruit Grove."
@ $CE10 label=Messaging_TheFruitGrove
  $CE10,$10 "#STR$CE10,$08($b==$FF)".
B $CE20,$01 Terminator.

t $CE21 Messaging: "The Cliff Path."
@ $CE21 label=Messaging_TheCliffPath
  $CE21,$0F "#STR$CE21,$08($b==$FF)".
B $CE30,$01 Terminator.

t $CE31 Messaging: "The Clifftop.<CR>Overlooking The Sea."
@ $CE31 label=Messaging_Clifftop
  $CE31,$22 "#STR$CE31,$08($b==$FF)".
B $CE53,$01 Terminator.

t $CE54 Messaging: "The Rocky Path."
@ $CE54 label=Messaging_RockyPath
  $CE54,$0F "#STR$CE54,$08($b==$FF)".
B $CE63,$01 Terminator.

t $CE64 Messaging: "The Bottom Of A Rocky Slope."
@ $CE64 label=Messaging_BottomRockySlope
  $CE64,$1C "#STR$CE64,$08($b==$FF)".
B $CE80,$01 Terminator.

t $CE81 Messaging: "The Canyon.<CR>The Walls Rise Dauntingly<CR>On Both Sides."
@ $CE81 label=Messaging_TheCanyon
  $CE81,$34 "#STR$CE81,$08($b==$FF)".
B $CEB5,$01 Terminator.

t $CEB6 Messaging: "The Secluded Beach."
@ $CEB6 label=Messaging_SecludedBeach
  $CEB6,$13 "#STR$CEB6,$08($b==$FF)".
B $CEC9,$01 Terminator.

t $CECA Messaging: "The Rockpool.<CR>A Deep Trough Of Crystal Clear<CR>Water."
@ $CECA label=Messaging_TheRockpool
  $CECA,$33 "#STR$CECA,$08($b==$FF)".
B $CEFD,$01 Terminator.

t $CEFE Messaging: "Wreckers' Cove."
@ $CEFE label=Messaging_WreckersCove
  $CEFE,$0F "#STR$CEFE,$08($b==$FF)".
B $CF0D,$01 Terminator.

t $CF0E Messaging: "The Jungle.<CR>There Are Game Paths In All<CR>Directions."
@ $CF0E label=Messaging_TheJungle
  $CF0E,$33 "#STR$CF0E,$08($b==$FF)".
B $CF41,$01 Terminator.

t $CF42 Messaging: "The Grassy Slope.<CR>Near The Jungle."
@ $CF42 label=Messaging_GrassySlope
  $CF42,$22 "#STR$CF42,$08($b==$FF)".
B $CF64,$01 Terminator.

t $CF65 Messaging: "The Rocky Beach."
@ $CF65 label=Messaging_RockyBeach
  $CF65,$10 "#STR$CF65,$08($b==$FF)".
B $CF75,$01 Terminator.

t $CF76 Messaging: "The Mouth Of A Large Cave."
@ $CF76 label=Messaging_CaveMouth
  $CF76,$1A "#STR$CF76,$08($b==$FF)".
B $CF90,$01 Terminator.

t $CF91 Messaging: "The Cave.<CR>A Deep Pool Of Water Lays In<CR>Its Centre."
@ $CF91 label=Messaging_TheCave
  $CF91,$32 "#STR$CF91,$08($b==$FF)".
B $CFC3,$01 Terminator.

t $CFC4 Messaging: "A Dead End."
@ $CFC4 label=Messaging_DeadEnd
  $CFC4,$0B "#STR$CFC4,$08($b==$FF)".
B $CFCF,$01 Terminator.

t $CFD0 Messaging: "The Mossy Path.<CR>The Ground Is Waterlogged."
@ $CFD0 label=Messaging_MossyPath
  $CFD0,$2A "#STR$CFD0,$08($b==$FF)".
B $CFFA,$01 Terminator.

t $CFFB Messaging: "The Swamp.<CR>Muddy Paths Lead Off In All<CR>Directions."
@ $CFFB label=Messaging_TheSwamp
  $CFFB,$32 "#STR$CFFB,$08($b==$FF)".
B $D02D,$01 Terminator.

t $D02E Messaging: "The Ravine.<CR>A River Runs Far Below."
@ $D02E label=Messaging_TheRavine
  $D02E,$23 "#STR$D02E,$08($b==$FF)".
B $D051,$01 Terminator.

t $D052 Messaging: "The Cliffs.<CR>Overlooking A Natural Harbour."
@ $D052 label=Messaging_OverlookingHarbour
  $D052,$2A "#STR$D052,$08($b==$FF)".
B $D07C,$01 Terminator.

t $D07D Messaging: "The Cliff Bottom."
@ $D07D label=Messaging_CliffBottom
  $D07D,$11 "#STR$D07D,$08($b==$FF)".
B $D08E,$01 Terminator.

t $D08F Messaging: "The Harbour Beach.<CR>At A Cave Entrance."
@ $D08F label=Messaging_HarbourBeach
  $D08F,$26 "#STR$D08F,$08($b==$FF)".
B $D0B5,$01 Terminator.

t $D0B6 Messaging: "The Vast Cavern."
@ $D0B6 label=Messaging_VastCavern
  $D0B6,$10 "#STR$D0B6,$08($b==$FF)".
B $D0C6,$01 Terminator.

t $D0C7 Messaging: "The Warren Of Passages."
@ $D0C7 label=Messaging_WarrenOfPassages
  $D0C7,$17 "#STR$D0C7,$08($b==$FF)".
B $D0DE,$01 Terminator.

t $D0DF Messaging: "The Narrow Passage."
@ $D0DF label=Messaging_NarrowPassage
  $D0DF,$13 "#STR$D0DF,$08($b==$FF)".
B $D0F2,$01 Terminator.

t $D0F3 Messaging: "The Dusty Corridor."
@ $D0F3 label=Messaging_DustyCorridor
  $D0F3,$13 "#STR$D0F3,$08($b==$FF)".
B $D106,$01 Terminator.

t $D107 Messaging: "The Pirate Treasure Chamber."
@ $D107 label=Messaging_TreasureChamber
  $D107,$1C "#STR$D107,$08($b==$FF)".
B $D123,$01 Terminator.

t $D124 Messaging: "The Damp Passage.<CR>Water Trickles Down The Walls."
@ $D124 label=Messaging_DampPassage
  $D124,$30 "#STR$D124,$08($b==$FF)".
B $D154,$01 Terminator.

t $D155 Messaging: "The Wide Pit."
@ $D155 label=Messaging_WidePit
  $D155,$0D "#STR$D155,$08($b==$FF)".
B $D162,$01 Terminator.

t $D163 Messaging: "The Pit Bottom."
@ $D163 label=Messaging_PitBottom
  $D163,$0F "#STR$D163,$08($b==$FF)".
B $D172,$01 Terminator.

t $D173 Messaging: "The Southern Side Of The Pit."
@ $D173 label=Messaging_PitSouthernSide
  $D173,$1D "#STR$D173,$08($b==$FF)".
B $D190,$01 Terminator.

t $D191 Messaging: "The Mighty Rock Door."
@ $D191 label=Messaging_MightyRockDoor
  $D191,$15 "#STR$D191,$08($b==$FF)".
B $D1A6,$01 Terminator.

t $D1A7 Messaging: "The Bridge."
@ $D1A7 label=Messaging_TheBridge
  $D1A7,$0B "#STR$D1A7,$08($b==$FF)".
B $D1B2,$01 Terminator.

t $D1B3 Messaging: "A Match"
@ $D1B3 label=Messaging_Match_Duplicate
  $D1B3,$07 "#STR$D1B3,$08($b==$FF)".
B $D1BA,$01 Terminator.

t $D1BB Messaging: "A Plank"
@ $D1BB label=Messaging_Plank_Duplicate
  $D1BB,$07 "#STR$D1BB,$08($b==$FF)".
B $D1C2,$01 Terminator.

t $D1C3 Messaging: "A Coconut"
@ $D1C3 label=Messaging_Coconut_Duplicate
  $D1C3,$09 "#STR$D1C3,$08($b==$FF)".
B $D1CC,$01 Terminator.

t $D1CD Messaging: "A Rod"
@ $D1CD label=Messaging_Rod_Duplicate
  $D1CD,$05 "#STR$D1CD,$08($b==$FF)".
B $D1D2,$01 Terminator.

t $D1D3 Messaging: "A Bottle"
  $D1D3,$08 "#STR$D1D3,$08($b==$FF)".
B $D1DB,$01 Terminator.

t $D1DC Messaging: "Any Rum"
  $D1DC,$07 "#STR$D1DC,$08($b==$FF)".
B $D1E3,$01 Terminator.

t $D1E4 Messaging: "Any Fruit"
  $D1E4,$09 "#STR$D1E4,$08($b==$FF)".
B $D1ED,$01 Terminator.

t $D1EE Messaging: "A Gun"
  $D1EE,$05 "#STR$D1EE,$08($b==$FF)".
B $D1F3,$01 Terminator.

t $D1F4 Messaging: "An Eyepatch"
  $D1F4,$0B "#STR$D1F4,$08($b==$FF)".
B $D1FF,$01 Terminator.

t $D200 Messaging: "Any Gunpowder"
  $D200,$0D "#STR$D200,$08($b==$FF)".
B $D20D,$01 Terminator.

t $D20E Messaging: "A Keg"
  $D20E,$05 "#STR$D20E,$08($b==$FF)".
B $D213,$01 Terminator.

t $D214 Messaging: "A Shoe"
  $D214,$06 "#STR$D214,$08($b==$FF)".
B $D21A,$01 Terminator.

t $D21B Messaging: "A Sextant"
  $D21B,$09 "#STR$D21B,$08($b==$FF)".
B $D224,$01 Terminator.

t $D225 Messaging: "A Watch"
  $D225,$07 "#STR$D225,$08($b==$FF)".
B $D22C,$01 Terminator.

t $D22D Messaging: "A Fish"
  $D22D,$06 "#STR$D22D,$08($b==$FF)".
B $D233,$01 Terminator.

t $D234 Messaging: "Any Jewels"
  $D234,$0A "#STR$D234,$08($b==$FF)".
B $D23E,$01 Terminator.

t $D23F Messaging: "A Crowbar"
  $D23F,$09 "#STR$D23F,$08($b==$FF)".
B $D248,$01 Terminator.

t $D249 Messaging: "A Key"
  $D249,$05 "#STR$D249,$08($b==$FF)".
B $D24E,$01 Terminator.

t $D24F Messaging: "A Skull"
  $D24F,$07 "#STR$D24F,$08($b==$FF)".
B $D256,$01 Terminator.

t $D257 Messaging: "A Spear"
  $D257,$07 "#STR$D257,$08($b==$FF)".
B $D25E,$01 Terminator.

t $D25F Messaging: "A Ladder"
  $D25F,$08 "#STR$D25F,$08($b==$FF)".
B $D267,$01 Terminator.

t $D268 Messaging: "A Boat"
  $D268,$06 "#STR$D268,$08($b==$FF)".
B $D26E,$01 Terminator.

t $D26F Messaging: "Any Oars"
  $D26F,$08 "#STR$D26F,$08($b==$FF)".
B $D277,$01 Terminator.

t $D278 Messaging: "Any Cannibals"
  $D278,$0D "#STR$D278,$08($b==$FF)".
B $D285,$01 Terminator.

t $D286 Messaging: "A Pirate"
  $D286,$08 "#STR$D286,$08($b==$FF)".
B $D28E,$01 Terminator.

t $D28F Messaging: "A Parrot"
  $D28F,$08 "#STR$D28F,$08($b==$FF)".
B $D297,$01 Terminator.

t $D298 Messaging: "A Crab"
  $D298,$06 "#STR$D298,$08($b==$FF)".
B $D29E,$01 Terminator.

t $D29F Messaging: "A Crocodile"
  $D29F,$0B "#STR$D29F,$08($b==$FF)".
B $D2AA,$01 Terminator.

t $D2AB Messaging: "A Lion"
  $D2AB,$06 "#STR$D2AB,$08($b==$FF)".
B $D2B1,$01 Terminator.

t $D2B2 Messaging: "A Seagull"
  $D2B2,$09 "#STR$D2B2,$08($b==$FF)".
B $D2BB,$01 Terminator.

t $D2BC Messaging: "An Octopus"
  $D2BC,$0A "#STR$D2BC,$08($b==$FF)".
B $D2C6,$01 Terminator.

t $D2C7 Messaging: "A Door"
  $D2C7,$06 "#STR$D2C7,$08($b==$FF)".
B $D2CD,$01 Terminator.

t $D2CE Messaging: "A Sailor"
  $D2CE,$08 "#STR$D2CE,$08($b==$FF)".
B $D2D6,$01 Terminator.

t $D2D7 Messaging: "A Snake"
  $D2D7,$07 "#STR$D2D7,$08($b==$FF)".
B $D2DE,$01 Terminator.

t $D2DF Messaging: "A Spider"
  $D2DF,$08 "#STR$D2DF,$08($b==$FF)".
B $D2E7,$01 Terminator.

t $D2E8 Messaging: "A Bridge"
  $D2E8,$08 "#STR$D2E8,$08($b==$FF)".
B $D2F0,$01 Terminator.

t $D2F1 Messaging: "A Boulder"
  $D2F1,$09 "#STR$D2F1,$08($b==$FF)".
B $D2FA,$01 Terminator.

t $D2FB Messaging: "A Ring"
  $D2FB,$06 "#STR$D2FB,$08($b==$FF)".
B $D301,$01 Terminator.

t $D302 Messaging: "A Trapdoor"
  $D302,$0A "#STR$D302,$08($b==$FF)".
B $D30C,$01 Terminator.

t $D30D Messaging: "A Cave"
  $D30D,$06 "#STR$D30D,$08($b==$FF)".
B $D313,$01 Terminator.

t $D314 Messaging: "A Pit"
  $D314,$05 "#STR$D314,$08($b==$FF)".
B $D319,$01 Terminator.

t $D31A Messaging: "A Ship"
  $D31A,$06 "#STR$D31A,$08($b==$FF)".
B $D320,$01 Terminator.

t $D321 Messaging: "A Hole"
@ $D321 label=Messaging_Hole
  $D321,$06 "#STR$D321,$08($b==$FF)".
B $D327,$01 Terminator.

t $D328 Messaging: "A Deer"
@ $D328 label=Messaging_Deer
  $D328,$06 "#STR$D328,$08($b==$FF)".
B $D32E,$01 Terminator.

t $D32F Messaging: "A Body"
@ $D32F label=Messaging_Body
  $D32F,$06 "#STR$D32F,$08($b==$FF)".
B $D335,$01 Terminator.

t $D336 Messaging: "A Rat"
@ $D336 label=Messaging_Rat
  $D336,$05 "#STR$D336,$08($b==$FF)".
B $D33B,$01 Terminator.

t $D33C Messaging: "A Stone"
@ $D33C label=Messaging_Stone
  $D33C,$07 "#STR$D33C,$08($b==$FF)".
B $D343,$01 Terminator.

t $D344 Messaging: "Any Water"
@ $D344 label=Messaging_AnyWater
  $D344,$09 "#STR$D344,$08($b==$FF)".
B $D34D,$01 Terminator.

g $D34E Table: Item Descriptions
@ $D34E label=Table_ItemDescriptions
W $D34E,$02 Item #N((#PC-$D34E)/$02): #ITEM((#PC-$D34E)/$02).
L $D34E,$02,$4F

g $D3EC Table: Room Descriptions
@ $D3EC label=Table_RoomDescriptions
W $D3EC,$02 N/A.
W $D3EE,$02 N/A.
W $D3F0,$02 Room #R(#PEEK(#PC+$01)*$100+#PEEK(#PC))(#N((#PC-$D3EC)/$02)).
L $D3F0,$02,$6B

g $D4C6 Table: Object Noun Phrases
@ $D4C6 label=Table_ObjectNounPhrases
W $D4C6,$02 Object #R(#PEEK(#PC+$01)*$100+#PEEK(#PC))(#N((#PC-$D4C6)/$02)): #OBJECT((#PC-$D4C6)/$02).
L $D4C6,$02,$30

t $D526 Messaging: "Congratulations!!<CR>Your Quest Has Been Successful.<CR>You Weigh Anchor And Then Sail<CR>Off Into The Sunset With The<CR>Fabulous Jewels Of Babylon."
@ $D526 label=Messaging_Congratulations
  $D526,$89 "#STR$D526,$08($b==$FF)".
B $D5AF,$01 Terminator.

t $D5B0 Messaging: "The Crab Has Reached You.<CR>A Monstrous Claw Darts Out<CR>And Crushes You."
  $D5B0,$45 "#STR$D5B0,$08($b==$FF)".
B $D5F5,$01 Terminator.

t $D5F6 Messaging: "A Tentacle Suddenly Encircles<CR>You And Crushes You."
  $D5F6,$32 "#STR$D5F6,$08($b==$FF)".
B $D628,$01 Terminator.

t $D629 Messaging: "You Drank Too Much Rum.<CR>You Stumble And Slip<CR>And Fall Over The Edge."
  $D629,$44 "#STR$D629,$08($b==$FF)".
B $D66D,$01 Terminator.

t $D66E Messaging: "The Lion Pounces Upon You.<CR>It Mauls You Savagely."
  $D66E,$31 "#STR$D66E,$08($b==$FF)".
B $D69F,$01 Terminator.

t $D6A0 Messaging: "The Crocodile Lunges At You.<CR>You Are Caught In The<CR>Vicious,Snapping Jaws."
  $D6A0,$49 "#STR$D6A0,$08($b==$FF)".
B $D6E9,$01 Terminator.

t $D6EA Messaging: "<CR>A Seagull Soars In The Breeze<CR>Above You..."
  $D6EA,$2B "#STR$D6EA,$08($b==$FF)".
B $D715,$01 Terminator.

t $D716 Messaging: "It Wheels Gently,<CR>And Then Flies Off."
  $D716,$25 "#STR$D716,$08($b==$FF)".
B $D73B,$01 Terminator.

t $D73C Messaging: "<CR>A Rat Runs Out On To The<CR>Path,In Front Of You..."
  $D73C,$31 "#STR$D73C,$08($b==$FF)".
B $D76D,$01 Terminator.

t $D76E Messaging: "It Sniffs The Air And Then<CR>Scurries Off."
  $D76E,$28 "#STR$D76E,$08($b==$FF)".
B $D796,$01 Terminator.

t $D797 Messaging: "<CR>A Deer Appears..."
  $D797,$12 "#STR$D797,$08($b==$FF)".
B $D7A9,$01 Terminator.

t $D7AA Messaging: "It Sees You And Runs Away."
  $D7AA,$1A "#STR$D7AA,$08($b==$FF)".
B $D7C4,$01 Terminator.

t $D7C5 Messaging: "<CR>A Pirate Attacks You..."
  $D7C5,$18 "#STR$D7C5,$08($b==$FF)".
B $D7DD,$01 Terminator.

t $D7DE Messaging: "But You Avoid His Blow."
  $D7DE,$17 "#STR$D7DE,$08($b==$FF)".
B $D7F5,$01 Terminator.

t $D7F6 Messaging: "After A Fierce Struggle<CR>He Overpowers You."
  $D7F6,$2A "#STR$D7F6,$08($b==$FF)".
B $D820,$01 Terminator.

t $D821 Messaging: "<CR>A Long Water Snake<CR>Slithers Toward You..."
  $D821,$2A "#STR$D821,$08($b==$FF)".
B $D84B,$01 Terminator.

t $D84C Messaging: "It Suddenly Strikes At You..."
  $D84C,$1D "#STR$D84C,$08($b==$FF)".
B $D869,$01 Terminator.

t $D86A Messaging: "The Venomous Fangs Sink<CR>Into You."
  $D86A,$21 "#STR$D86A,$08($b==$FF)".
B $D88B,$01 Terminator.

t $D88C Messaging: "But It Misses And Slips Away."
  $D88C,$1D "#STR$D88C,$08($b==$FF)".
B $D8A9,$01 Terminator.

t $D8AA Messaging: "It Regards You For A Moment,<CR>Then Slips Away."
  $D8AA,$2D "#STR$D8AA,$08($b==$FF)".
B $D8D7,$01 Terminator.

t $D8D8 Messaging: "<CR>A Poisonous Spider Drops On You."
@ $D8D8 label=Messaging_PoisonousSpiderDropsOnYou
  $D8D8,$21 "#STR$D8D8,$08($b==$FF)".
B $D8F9,$01 Terminator.

t $D8FA Messaging: "It Lingers A Moment,<CR>Then Scuttles Off."
@ $D8FA label=Messaging_PoisonousSpiderScuttlesOff
  $D8FA,$27 "#STR$D8FA,$08($b==$FF)".
B $D921,$01 Terminator.

t $D922 Messaging: "It Stings You."
@ $D922 label=Messaging_PoisonousSpiderStingsYou
  $D922,$0E "#STR$D922,$08($b==$FF)".
B $D930,$01 Terminator.

t $D931 Messaging: "The Natives Close In.<CR>You Struggle Bravely But<CR>They Overwhelm You."
  $D931,$42 "#STR$D931,$08($b==$FF)".
B $D973,$01 Terminator.

t $D974 Messaging: "You're Really In The Soup Now."
  $D974,$1E "#STR$D974,$08($b==$FF)".
B $D992,$01 Terminator.

t $D993 Messaging: "Sorry...<CR>That Was In Poor Taste."
  $D993,$20 "#STR$D993,$08($b==$FF)".
B $D9B3,$01 Terminator.

t $D9B4 Messaging: "Try Distracting Them."
  $D9B4,$15 "#STR$D9B4,$08($b==$FF)".
B $D9C9,$01 Terminator.

t $D9CA Messaging: "Keep The Noise Down."
  $D9CA,$14 "#STR$D9CA,$08($b==$FF)".
B $D9DE,$01 Terminator.

t $D9DF Messaging: "Look At Those Jaws!"
  $D9DF,$13 "#STR$D9DF,$08($b==$FF)".
B $D9F2,$01 Terminator.

t $D9F3 Messaging: "Work It Out For Yourself."
  $D9F3,$19 "#STR$D9F3,$08($b==$FF)".
B $DA0C,$01 Terminator.

t $DA0D Messaging: "You Don't Really Need It."
  $DA0D,$19 "#STR$DA0D,$08($b==$FF)".
B $DA26,$01 Terminator.

t $DA27 Messaging: "Nice Pussy!"
  $DA27,$0B "#STR$DA27,$08($b==$FF)".
B $DA32,$01 Terminator.

t $DA33 Messaging: "Pretty Polly!"
  $DA33,$0D "#STR$DA33,$08($b==$FF)".
B $DA40,$01 Terminator.

t $DA41 Messaging: "Now You're Really Lost."
  $DA41,$17 "#STR$DA41,$08($b==$FF)".
B $DA58,$01 Terminator.

t $DA59 Messaging: "Try Climbing."
  $DA59,$0D "#STR$DA59,$08($b==$FF)".
B $DA66,$01 Terminator.

t $DA67 Messaging: "Try Rowing!"
  $DA67,$0B "#STR$DA67,$08($b==$FF)".
B $DA72,$01 Terminator.

t $DA73 Messaging: "It's Full Of Rum!"
  $DA73,$11 "#STR$DA73,$08($b==$FF)".
B $DA84,$01 Terminator.

t $DA85 Messaging: "It's A Red Herring!"
  $DA85,$13 "#STR$DA85,$08($b==$FF)".
B $DA98,$01 Terminator.

t $DA99 Messaging: "It Appears To Work."
  $DA99,$13 "#STR$DA99,$08($b==$FF)".
B $DAAC,$01 Terminator.

t $DAAD Messaging: "It Is Quite Well Made<CR>And In Good Condition."
  $DAAD,$2C "#STR$DAAD,$08($b==$FF)".
B $DAD9,$01 Terminator.

t $DADA Messaging: "It Has A Circular Cross-Section."
  $DADA,$20 "#STR$DADA,$08($b==$FF)".
B $DAFA,$01 Terminator.

t $DAFB Messaging: "It Looks Delicious."
  $DAFB,$13 "#STR$DAFB,$08($b==$FF)".
B $DB0E,$01 Terminator.

t $DB0F Messaging: "Be Careful.<CR>It Won't Carry Much Weight."
  $DB0F,$27 "#STR$DB0F,$08($b==$FF)".
B $DB36,$01 Terminator.

t $DB37 Messaging: "They Are Very Beautiful<CR>And Very Heavy."
  $DB37,$27 "#STR$DB37,$08($b==$FF)".
B $DB5E,$01 Terminator.

t $DB5F Messaging: "That's Not Such A Good Idea."
  $DB5F,$1C "#STR$DB5F,$08($b==$FF)".
B $DB7B,$01 Terminator.

t $DB7C Messaging: "The Door Rolls Shut."
  $DB7C,$14 "#STR$DB7C,$08($b==$FF)".
B $DB90,$01 Terminator.

t $DB91 Messaging: "<CR>Ouch!!<CR>The Match Has Burned Away,<CR>Scorching Your Fingers."
  $DB91,$3A "#STR$DB91,$08($b==$FF)".
B $DBCB,$01 Terminator.

t $DBCC Messaging: "As You Start To Move,<CR>The Parrot Squawks...<CR>The Pirate Wakes<CR>And Quickly Shoots You."
  $DBCC,$54 "#STR$DBCC,$08($b==$FF)".
B $DC20,$01 Terminator.

t $DC21 Messaging: "You're In It Already."
@ $DC21 label=Messaging_YoureInItAlready
  $DC21,$15 "#STR$DC21,$08($b==$FF)".
B $DC36,$01 Terminator.

t $DC37 Messaging: "You're Not In The Boat."
@ $DC37 label=Messaging_YoureNotInTheBoat
  $DC37,$17 "#STR$DC37,$08($b==$FF)".
B $DC4E,$01 Terminator.

t $DC4F Messaging: "You Fling The Spear,But The<CR>Lion Easily Avoids It."
@ $DC4F label=Messaging_ThrowSpearAtLion
  $DC4F,$32 "#STR$DC4F,$08($b==$FF)".
B $DC81,$01 Terminator.

t $DC82 Messaging: "The Coconut Bounces Off<CR>The Lion's Head.He Shakes His<CR>Long Mane In Anger.I Think<CR>You've Got His Attention."
@ $DC82 label=Messaging_ThrowCoconutAtLion
  $DC82,$6A "#STR$DC82,$08($b==$FF)".
B $DCEC,$01 Terminator.

t $DCED Messaging: "He Sniffs The Fruit But<CR>Otherwise Ignores It."
@ $DCED label=Messaging_ThrowFruitAtLion
  $DCED,$2D "#STR$DCED,$08($b==$FF)".
B $DD1A,$01 Terminator.

t $DD1B Messaging: "The Lion Takes The Fish In<CR>His Massive Jaws And Then<CR>Disappears Into The Jungle."
@ $DD1B label=Messaging_ThrowFishAtLion
  $DD1B,$50 "#STR$DD1B,$08($b==$FF)".
B $DD6B,$01 Terminator.

t $DD6C Messaging: "The Parrot Catches The Fruit<CR>In Its Beak And Swallows It.<CR>It Flutters Momentarily,Then<CR>Falls To The Ground,Dead."
@ $DD6C label=Messaging_ThrowFruitAtParrot
  $DD6C,$70 "#STR$DD6C,$08($b==$FF)".
B $DDDC,$01 Terminator.

t $DDDD Messaging: "The Cannibal Drops The Spear<CR>And Takes The Watch.<CR>He Examines It Briefly And<CR>Places It To His Ear. The<CR>Other Natives Gather Round Him<CR>And Lose All Interest In You."
@ $DDDD label=Messaging_ThrowWatchAtCannibals
  $DDDD,$A3 "#STR$DDDD,$08($b==$FF)".
B $DE80,$01 Terminator.

t $DE81 Messaging: "The Spear Pierces The Oily<CR>Skin And The Octopus Sinks<CR>Beneath The Surface In A<CR>Fury Of Froth And Foam.<CR>The Spear Is Lost."
@ $DE81 label=Messaging_ThrowSpearAtOctopus
  $DE81,$79 "#STR$DE81,$08($b==$FF)".
B $DEFA,$01 Terminator.

t $DEFB Messaging: "You've Done That Already."
@ $DEFB label=Messaging_YouveDoneThatAlready
  $DEFB,$19 "#STR$DEFB,$08($b==$FF)".
B $DF14,$01 Terminator.

t $DF15 Messaging: "The Crocodile Opens Its Huge<CR>Jaws And Catches The Keg.<CR>Its Jaws Close On It And<CR>Start To Crush It.<CR>Gunpowder Spills Out."
@ $DF15 label=Messaging_ThrowKegAtCrocodile
  $DF15,$78 "#STR$DF15,$08($b==$FF)".
B $DF8D,$01 Terminator.

t $DF8E Messaging: "The Match Ignites The<CR>Spilled Gunpowder.<CR>There Is A Mighty Flash<CR>And A Thunderous Explosion.<CR>The Crocodile Has Disintegrated."
@ $DF8E label=Messaging_ThrowMatchAtGunpowder
  $DF8E,$7D "#STR$DF8E,$08($b==$FF)".
B $E00B,$01 Terminator.

t $E00C Messaging: "The Plank Now Spans The Pit."
@ $E00C label=Messaging_PlankAcrossPit
  $E00C,$1C "#STR$E00C,$08($b==$FF)".
B $E028,$01 Terminator.

t $E029 Messaging: "There Is A Faint Click And<CR>The Rock Door Slowly Rumbles<CR>Open."
@ $E029 label=Messaging_OpenRockDoor
  $E029,$3D "#STR$E029,$08($b==$FF)".
B $E066,$01 Terminator.

t $E067 Messaging: "You're Not Carrying It."
@ $E067 label=Messaging_YoureNotCarryingIt
  $E067,$17 "#STR$E067,$08($b==$FF)".
B $E07E,$01 Terminator.

t $E07F Messaging: "You Stab At The Lion<CR>But The Beast Easily Avoids It."
  $E07F,$34 "#STR$E07F,$08($b==$FF)".
B $E0B3,$01 Terminator.

t $E0B4 Messaging: "The Cannibals Turn On You.<CR>They Quickly Overwhelm You."
  $E0B4,$36 "#STR$E0B4,$08($b==$FF)".
B $E0EA,$01 Terminator.

t $E0EB Messaging: "You Take A Shot...."
  $E0EB,$13 "#STR$E0EB,$08($b==$FF)".
B $E0FE,$01 Terminator.

t $E0FF Messaging: "Good Shooting!<CR>The Pirate Is Dead."
  $E0FF,$22 "#STR$E0FF,$08($b==$FF)".
B $E121,$01 Terminator.

t $E122 Messaging: "Bad Luck.<CR>You Missed."
  $E122,$15 "#STR$E122,$08($b==$FF)".
B $E137,$01 Terminator.

t $E138 Messaging: "He's Dead Already."
  $E138,$12 "#STR$E138,$08($b==$FF)".
B $E14A,$01 Terminator.

t $E14B Messaging: "It's Already Dead."
  $E14B,$12 "#STR$E14B,$08($b==$FF)".
B $E15D,$01 Terminator.

t $E15E Messaging: "You Haven't Got A Gun."
  $E15E,$16 "#STR$E15E,$08($b==$FF)".
B $E174,$01 Terminator.

t $E175 Messaging: "You Eat The Fish.<CR>It Was Quite Tasty."
  $E175,$25 "#STR$E175,$08($b==$FF)".
B $E19A,$01 Terminator.

t $E19B Messaging: "You Start To Eat The Fruit.<CR>You Suddenly Feel Very Unwell.<CR>Too Late,You Realise That<CR>The Fruit Is Poisonous."
  $E19B,$6C "#STR$E19B,$08($b==$FF)".
B $E207,$01 Terminator.

t $E208 Messaging: "No. You Don't Like Coconut."
  $E208,$1B "#STR$E208,$08($b==$FF)".
B $E223,$01 Terminator.

t $E224 Messaging: "You Must Be Joking."
  $E224,$13 "#STR$E224,$08($b==$FF)".
B $E237,$01 Terminator.

t $E238 Messaging: "You Drink The Golden Liquid.<CR>It Was Delicious..Hic..<CR>You Feel Decidedly Light-Headed."
  $E238,$55 "#STR$E238,$08($b==$FF)".
B $E28D,$01 Terminator.

t $E28E Messaging: "You Can't.<CR>That's Salt Water."
@ $E28E label=Messaging_YouCantThatsSaltWater
  $E28E,$1D "#STR$E28E,$08($b==$FF)".
B $E2AB,$01 Terminator.

t $E2AC Messaging: "You Take A Refreshing Drink."
@ $E2AC label=Messaging_YouTakeARefreshingDrink
  $E2AC,$1C "#STR$E2AC,$08($b==$FF)".
B $E2C8,$01 Terminator.

t $E2C9 Messaging: "It's Already Open."
@ $E2C9 label=Messaging_ItsAlreadyOpen
  $E2C9,$12 "#STR$E2C9,$08($b==$FF)".
B $E2DB,$01 Terminator.

t $E2DC Messaging: "It's Already Closed."
@ $E2DC label=Messaging_ItsAlreadyClosed
  $E2DC,$14 "#STR$E2DC,$08($b==$FF)".
B $E2F0,$01 Terminator.

t $E2F1 Messaging: "The Door Is Locked."
  $E2F1,$13 "#STR$E2F1,$08($b==$FF)".
B $E304,$01 Terminator.

t $E305 Messaging: "It's Much Too Heavy."
  $E305,$14 "#STR$E305,$08($b==$FF)".
B $E319,$01 Terminator.

t $E31A Messaging: "No. I Can't Be Bothered."
  $E31A,$18 "#STR$E31A,$08($b==$FF)".
B $E332,$01 Terminator.

t $E333 Messaging: "The Whole Canyon Vibrates.<CR>The Boulder Is Dislodged..."
  $E333,$36 "#STR$E333,$08($b==$FF)".
B $E369,$01 Terminator.

t $E36A Messaging: "It Falls And Crushes You."
  $E36A,$19 "#STR$E36A,$08($b==$FF)".
B $E383,$01 Terminator.

t $E384 Messaging: "It Falls And Crushes The Crab."
  $E384,$1E "#STR$E384,$08($b==$FF)".
B $E3A2,$01 Terminator.

t $E3A3 Messaging: "Don't Be Disgusting!"
  $E3A3,$14 "#STR$E3A3,$08($b==$FF)".
B $E3B7,$01 Terminator.

t $E3B8 Messaging: "I've Warned You Before!<CR>This Deviant Practice<CR>Has Got To Stop."
  $E3B8,$3E "#STR$E3B8,$08($b==$FF)".
B $E3F6,$01 Terminator.

t $E3F7 Messaging: "I Didn't Hear That!"
  $E3F7,$13 "#STR$E3F7,$08($b==$FF)".
B $E40A,$01 Terminator.

t $E40B Messaging: "A Small Section Of Floor<CR>Lifts Up,Revealing It To Be<CR>A Trapdoor."
  $E40B,$40 "#STR$E40B,$08($b==$FF)".
B $E44B,$01 Terminator.

t $E44C Messaging: "You're Wearing It Already."
@ $E44C label=Messaging_YoureWearingItAlready
  $E44C,$1A "#STR$E44C,$08($b==$FF)".
B $E466,$01 Terminator.

t $E467 Messaging: "I Think You Look Quite Stupid."
@ $E467 label=Messaging_WearEyepatch
  $E467,$1E "#STR$E467,$08($b==$FF)".
B $E485,$01 Terminator.

t $E486 Messaging: "No!<CR>I'm Not Letting You Hop Around,<CR>With One Shoe On."
@ $E486 label=Messaging_WearShoe
  $E486,$35 "#STR$E486,$08($b==$FF)".
B $E4BB,$01 Terminator.

t $E4BC Messaging: "Don't Be Ridiculous."
@ $E4BC label=Messaging_DontBeRidiculous
  $E4BC,$14 "#STR$E4BC,$08($b==$FF)".
B $E4D0,$01 Terminator.

t $E4D1 Messaging: "The Match Flares Into Life.<CR>Hurry It Will Go Out Soon."
@ $E4D1 label=Messaging_TheMatchFlaresIntoLife
  $E4D1,$36 "#STR$E4D1,$08($b==$FF)".
B $E507,$01 Terminator.

t $E508 Messaging: "Using The Crowbar As A Lever,<CR>You Slowly Move The Stone<CR>And Uncover A Ring Set Into<CR>The Floor."
@ $E508 label=Messaging_UsingTheCrowbarAsALever
  $E508,$5E "#STR$E508,$08($b==$FF)".
B $E566,$01 Terminator.

t $E567 Messaging: "A Massive Wave Hits The Boat.<CR>It Overturns. You're Drowning."
@ $E567 label=Messaging_AMassiveWaveHitsTheBoat
  $E567,$3C "#STR$E567,$08($b==$FF)".
B $E5A3,$01 Terminator.

t $E5A4 Messaging: "You Can't Swim."
@ $E5A4 label=Messaging_YouCantSwim
  $E5A4,$0F "#STR$E5A4,$08($b==$FF)".
B $E5B3,$01 Terminator.

t $E5B4 Messaging: "It Has No Apparent Effect."
@ $E5B4 label=Messaging_ItHasNoApparentEffect
  $E5B4,$1A "#STR$E5B4,$08($b==$FF)".
B $E5CE,$01 Terminator.

t $E5CF Messaging: "The Bridge Begins To Shake..."
@ $E5CF label=Messaging_TheBridgeBeginsToShake
  $E5CF,$1D "#STR$E5CF,$08($b==$FF)".
B $E5EC,$01 Terminator.

t $E5ED Messaging: "Suddenly,It Collapses."
@ $E5ED label=Messaging_SuddenlyItCollapses
  $E5ED,$16 "#STR$E5ED,$08($b==$FF)".
B $E603,$01 Terminator.

t $E604 Messaging: "You Haven't Got The Key."
@ $E604 label=Messaging_YouHaventGotTheKey
  $E604,$18 "#STR$E604,$08($b==$FF)".
B $E61C,$01 Terminator.

t $E61D Table: Vocabulary
@ $E61D label=Table_Vocabulary
  $E61D,$04 Command #N((#PC-$E61D)/$04): #OBJECT((#PC-$E61D)/$04).
L $E61D,$04,$08
  $E63D,$09 Command #N((#PC-$E61D)/$04): #OBJECT((#PC-$E61D)/$04).
  $E646,$09 Command #N((#PC-$E621)/$04): #OBJECT((#PC-$E621)/$04).
  $E64F,$04 Command #N((#PC-$E625)/$04): #OBJECT((#PC-$E625)/$04).
L $E64F,$04,$04
  $E65F,$09 Command #N((#PC-$E625)/$04): #OBJECT((#PC-$E625)/$04).
  $E668,$04 Command #N((#PC-$E629)/$04): #OBJECT((#PC-$E629)/$04).
L $E668,$04,$08
  $E688,$09 Command #N((#PC-$E629)/$04): #OBJECT((#PC-$E629)/$04).
  $E691,$04 Command #N((#PC-$E631)/$04): #OBJECT((#PC-$E631)/$04).
L $E691,$04,$16
  $E6E9,$09 Command #N$2E.
  $E6F2,$09 Command #N$2F.
  $E6FB,$09 Command #N$30.
  $E704,$09 Command #N$31.
  $E70D,$09 Command #N$32.
  $E716,$09 Command #N$33.
  $E71F,$09 Command #N$34.
  $E728,$09 Command #N$35.
  $E731,$09 Command #N$36.
  $E73A,$04 Command #N((#PC-$E65E)/$04).
L $E73A,$04,$08
  $E75A,$0E Command #N$3F.
  $E768,$04 Command #N((#PC-$E668)/$04).
L $E768,$04,$06
  $E780,$09 Command #N$46.
  $E789,$04 Command #N((#PC-$E66D)/$04).
L $E789,$04,$06
  $E7A1,$09 Command #N$4D.
  $E7AA,$04 Command #N((#PC-$E672)/$04).
L $E7AA,$04,$07
  $E7C6,$09 Command #N$55.
  $E7CF,$04 Command #N((#PC-$E677)/$04).
L $E7CF,$04,$02
  $E7D7,$09 Command #N$58.
  $E7E0,$04 Command #N$59.
  $E7E4,$09 Command #N$5A.
  $E7ED,$04 Command #N((#PC-$E681)/$04).
L $E7ED,$04,$03
  $E7F9,$0E Command #N$5E.
  $E807,$04 Command #N((#PC-$E68B)/$04).
L $E807,$04,$05
  $E81B,$09 Command #N$64.
  $E824,$04 Command #N((#PC-$E690)/$04).
L $E824,$04,$02
  $E82C,$09 Command #N$67.
  $E835,$04 Command #N((#PC-$E695)/$04).
L $E835,$04,$02
B $E83D,$01 Terminator.

g $E83E Table: Object List?
@ $E83E label=Table_ObjectList
B $E83E,$01 Object #N(#PEEK(#PC)): #OBJECT(#PEEK(#PC)).
L $E83E,$01,$30

g $E86E Data: Item Groups
D $E86E See #R$E96A for usage.
@ $E86E label=Data_ItemGroup_Match
@ $E871 label=Data_ItemGroup_Plank
@ $E875 label=Data_ItemGroup_Coconut
@ $E877 label=Data_ItemGroup_Rod
@ $E87A label=Data_ItemGroup_Bottle_1
@ $E87E label=Data_ItemGroup_Bottle_2
@ $E881 label=Data_ItemGroup_Fruit
@ $E883 label=Data_ItemGroup_Gun
@ $E885 label=Data_ItemGroup_Eyepatch
@ $E888 label=Data_ItemGroup_CrocodileWithKeg_1
@ $E88B label=Data_ItemGroup_CrocodileWithKeg_2
@ $E88E label=Data_ItemGroup_Shoe
@ $E890 label=Data_ItemGroup_Sextant
@ $E892 label=Data_ItemGroup_CannibalsWithWatch
@ $E895 label=Data_ItemGroup_Fish
@ $E898 label=Data_ItemGroup_Jewels
@ $E89A label=Data_ItemGroup_Crowbar
@ $E89C label=Data_ItemGroup_Key
@ $E89E label=Data_ItemGroup_Skull
@ $E8A0 label=Data_ItemGroup_CannibalsWithSpear
@ $E8A3 label=Data_ItemGroup_Ladder_1
@ $E8A6 label=Data_ItemGroup_Boats
@ $E8AB label=Data_ItemGroup_Ladder_2
@ $E8AF label=Data_ItemGroup_Cannibals
@ $E8B2 label=Data_ItemGroup_Pirate
@ $E8BC label=Data_ItemGroup_Parrot
@ $E8BF label=Data_ItemGroup_Crab
@ $E8C1 label=Data_ItemGroup_Crocodile
@ $E8C4 label=Data_ItemGroup_Lion
@ $E8C6 label=Data_ItemGroup_Seagull
@ $E8C8 label=Data_ItemGroup_Octopus
@ $E8CA label=Data_ItemGroup_Door
@ $E8D2 label=Data_ItemGroup_Sailor
@ $E8D4 label=Data_ItemGroup_Snake
@ $E8D6 label=Data_ItemGroup_Spider
@ $E8D8 label=Data_ItemGroup_Bridge
@ $E8DC label=Data_ItemGroup_Boulder
@ $E8DF label=Data_ItemGroup_TrapdoorWithRing
@ $E8E2 label=Data_ItemGroup_Trapdoor
@ $E8E4 label=Data_ItemGroup_CaveSlime
@ $E8E9 label=Data_ItemGroup_Pit
@ $E8ED label=Data_ItemGroup_Ship
@ $E8F2 label=Data_ItemGroup_DoorWithHole
@ $E8F5 label=Data_ItemGroup_Deer
@ $E8F7 label=Data_ItemGroup_DeadPirate
@ $E8FE label=Data_ItemGroup_Rat
@ $E900 label=Data_ItemGroup_Stone
@ $E902 label=Data_ItemGroup_Water
B $E86E,$01 #IF(#PEEK(#PC)==$FF)(Terminator,Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC))).
L $E86E,$01,$9F

g $E90D Table: Verb Word Tokens
@ $E90D label=Table_VerbWordTokens
D $E90D A list of all available verb tokens in the game. See #R$BD2C.
B $E90D,$01 Verb word token #N(#PEEK(#PC)): #TOKEN(#PEEK(#PC)).
L $E90D,$01,$26

g $E933 Data: Scenic Event Rooms
@ $E933 label=Data_ScenicEvents_01
@ $E937 label=Data_ScenicEvents_02
@ $E93B label=Data_ScenicEvents_03
@ $E93F label=Data_ScenicEvents_04
@ $E943 label=Data_ScenicEvents_05
@ $E947 label=Data_ScenicEvents_06
@ $E94D label=Data_ScenicEvents_07
@ $E953 label=Data_ScenicEvents_08
@ $E95B label=Data_ScenicEvents_09
B $E933,$01 #IF(#PEEK(#PC)==$FF)(Terminator,Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC))).
L $E933,$01,$2A

g $E95D Table: Rooms With Images
@ $E95D label=Table_RoomsWithImages
D $E95D See #R$FFA8.
B $E95D,$01 Location Slot: #N(#PC-$E95D) - room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $E95D,$01,$0D

g $E96A Table: Item Grouping
@ $E96A label=Table_ItemGrouping
D $E96A Items may have several item IDs which relate to a single item, this
. table groups the items together to assist the parser with knowing that tokens
. refer to the same thing.
.
. Some examples are:
. #TABLE(default,centre,centre,centre)
. { =h Item ID | =h Item Name | =h Relates To: }
. { #R$E86E(#N$02) | #ITEM$02 | =r2 The Match }
. { #R$E86F(#N$03) | #ITEM$03 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { #R$E885(#N$10) | #ITEM$10 | =r2 The Eyepatch }
. { #R$E886(#N$11) | #ITEM$11 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { #R$E8BC(#N$27) | #ITEM$27 | =r2 The Parrot }
. { #R$E8BD(#N$28) | #ITEM$28 }
. TABLE#
W $E96A,$02 Item Group: #N((#PC-$E96A)/$02): #OBJECT((#PC-$E96A)/$02).
L $E96A,$02,$30

g $E9CA Data: Phrase Tokens
D $E9CA The user input is broken down into tokens which represent the words
. they've entered. These tokens are then compared against these token patterns
. to determine the outcome the player was trying to communicate.
N $E9CA Matches e.g. "bottle".
@ $E9CA label=PhraseTokens_Bottle
N $E9CC Matches e.g. "fish", "herring", "red fish", "red herring", "coloured fish",
. "coloured herring".
@ $E9CC label=PhraseTokens_Fish
N $E9D1 Matches e.g. "watch".
@ $E9D1 label=PhraseTokens_Watch
N $E9D3 Matches e.g. "shoe".
@ $E9D3 label=PhraseTokens_Shoe
N $E9D5 Matches e.g. "rod".
@ $E9D5 label=PhraseTokens_Rod
N $E9D7 Matches e.g. "fruit".
@ $E9D7 label=PhraseTokens_Fruit
N $E9D9 Matches e.g. "bridge".
@ $E9D9 label=PhraseTokens_Bridge
N $E9DB Matches e.g. "jewels", "jewels of babylon".
@ $E9DB label=PhraseTokens_Jewels
N $E9E1 Matches e.g. "match".
@ $E9E1 label=PhraseTokens_Match
N $E9E3 Matches e.g. "plank".
@ $E9E3 label=PhraseTokens_Plank
N $E9E5 Matches e.g. "coconut".
@ $E9E5 label=PhraseTokens_Coconut
N $E9E7 Matches e.g. "bottle", "rum", "bottle of rum".
@ $E9E7 label=PhraseTokens_BottleOfRum
N $E9EF Matches e.g. "gun".
@ $E9EF label=PhraseTokens_Gun
N $E9F1 Matches e.g. "eyepatch", "patch".
@ $E9F1 label=PhraseTokens_Eyepatch
N $E9F3 Matches e.g. "gunpowder", "powder", "keg", "keg of gunpowder",
. "keg of powder".
@ $E9F3 label=PhraseTokens_KegGunPowder
N $E9FB Matches e.g. "sextant".
@ $E9FB label=PhraseTokens_Sextant
N $E9FD Matches e.g. "crowbar".
@ $E9FD label=PhraseTokens_Crowbar
N $E9FF Matches e.g. "key".
@ $E9FF label=PhraseTokens_Key
N $EA01 Matches e.g. "skull", "human skull".
@ $EA01 label=PhraseTokens_Skull
N $EA06 Matches e.g. "spear".
@ $EA06 label=PhraseTokens_Spear
N $EA08 Matches e.g. "parrot", "dead parrot".
@ $EA08 label=PhraseTokens_Parrot
N $EA0D Matches e.g. "into boat", "in to boat", "in at boat", "into rowing boat",
. "in to rowing boat", "in at rowing boat".
@ $EA0D label=PhraseTokens_IntoBoat
N $EA1D Matches e.g. "out of boat", "out of rowing boat".
@ $EA1D label=PhraseTokens_OutOfBoat
N $EA26 Matches e.g. "plank across pit", "plank over pit".
@ $EA26 label=PhraseTokens_PlankAcrossPit
N $EA2A Matches e.g. "spear to lion", "spear at lion".
@ $EA2A label=PhraseTokens_SpearAtLion
N $EA2E Matches e.g. "coconut to lion", "coconut at lion".
@ $EA2E label=PhraseTokens_CoconutAtLion
N $EA32 Matches e.g. "fruit to lion", "fruit at lion".
@ $EA32 label=PhraseTokens_FruitAtLion
N $EA36 Matches e.g. "fish to lion", "fish at lion", "herring to lion",
. "herring at lion", "red fish to lion", "red fish at lion",
. "red herring to lion", "red herring at lion",
. "coloured fish to lion", "coloured fish at lion",
. "coloured herring to lion", "coloured herring at lion".
@ $EA36 label=PhraseTokens_FishAtLion
N $EA3F Matches e.g. "fruit to parrot", "fruit at parrot".
@ $EA3F label=PhraseTokens_FruitAtParrot
N $EA43 Matches e.g. "watch to cannibals", "watch at cannibals",
. "watch to natives", "watch at natives".
@ $EA43 label=PhraseTokens_WatchAtCannibals
N $EA47 Matches e.g. "spear to octopus", "spear at octopus",
. "spear to giant octopus", "spear at giant octopus".
@ $EA47 label=PhraseTokens_SpearAtOctopus
N $EA50 Matches e.g. "gunpowder to crocodile", "gunpowder at crocodile",
. "powder to crocodile", "powder at crocodile", "keg to crocodile",
. "keg at crocodile", "keg of gunpowder to crocodile",
. "keg of gunpowder at crocodile", "keg of powder to crocodile",
. "keg of powder at crocodile".
@ $EA50 label=PhraseTokens_KegAtCrocodile
N $EA5E Matches e.g. "match to keg", "match at keg", "match to gunpowder",
. "match at gunpowder", "match to powder", "match at powder",
. "match to keg of gunpowder", "match at keg of gunpowder",
. "match to keg of powder", "match at keg of powder".
@ $EA5E label=PhraseTokens_MatchAtKeg
N $EA6C Matches e.g. "match to crocodile", "match at crocodile".
@ $EA6C label=PhraseTokens_MatchAtCrocodile
N $EA70 Matches e.g. "rod in hole", "rod in round hole", "rod into hole",
. "rod into round hole", "rod in to hole", "rod in at hole",
. "rod in to round hole", "rod in at round hole".
@ $EA70 label=PhraseTokens_RodInHole
N $EA8D Matches e.g. "octopus with spear", "octopus using spear",
. "giant octopus with spear", "giant octopus using spear".
@ $EA8D label=PhraseTokens_OctopusWithSpear
N $EA96 Matches e.g. "lion with spear", "lion using spear".
@ $EA96 label=PhraseTokens_LionWithSpear
N $EA9A Matches e.g. "cannibals with spear", "cannibals using spear",
. "natives with spear", "natives using spear".
@ $EA9A label=PhraseTokens_CannibalsWithSpear
N $EA9E Matches e.g. "pirate with gun", "pirate using gun".
@ $EA9E label=PhraseTokens_PirateWithGun
N $EAA2 Matches e.g. "parrot with gun", "parrot using gun".
@ $EAA2 label=PhraseTokens_ParrotWithGun
N $EAA6 Matches e.g. "pirate", "pirate with gun", "pirate using gun".
@ $EAA6 label=PhraseTokens_PirateWithGun_2
N $EAAC Matches e.g. "parrot", "parrot with gun", "parrot using gun".
@ $EAAC label=PhraseTokens_ParrotWithGun_2
N $EAB2 Matches e.g. "u ladder", "up ladder".
@ $EAB2 label=PhraseTokens_UpLadder
N $EAB5 Matches e.g. "d ladder", "down ladder".
@ $EAB5 label=PhraseTokens_DownLadder
N $EAB8 Matches e.g. "rum".
@ $EAB8 label=PhraseTokens_Rum
N $EABA Matches e.g. "water".
@ $EABA label=PhraseTokens_Water
N $EABC Matches e.g. "ladder".
@ $EABC label=PhraseTokens_Ladder
N $EABE Matches e.g. "door".
@ $EABE label=PhraseTokens_Door
N $EAC0 Matches e.g. "rock door", "door".
@ $EAC0 label=PhraseTokens_RockDoor
N $EAC5 Matches e.g. "trapdoor".
@ $EAC5 label=PhraseTokens_TrapDoor
N $EAC7 Matches e.g. "shout" on its own, or "shout loud".
@ $EAC7 label=PhraseTokens_Shout
N $EACB Matches e.g. "ring".
@ $EACB label=PhraseTokens_Ring
N $EACD Matches e.g. "cave".
@ $EACD label=PhraseTokens_Cave
N $EACF Matches e.g. "boat", "rowing boat", "ship", "pit".
@ $EACF label=PhraseTokens_Boat
N $EAD8 Matches e.g. "stone", "large stone".
@ $EAD8 label=PhraseTokens_Stone
N $EADD Matches e.g. "stone with crowbar", "stone using crowbar",
. "large stone with crowbar", "large stone using crowbar".
@ $EADD label=PhraseTokens_StoneWithCrowbar
N $EAE6 Matches e.g. "door", "door with key", "door using key".
@ $EAE6 label=PhraseTokens_Door_2
N $EAEC Matches e.g. "n", "north", "boat n", "boat north", "rowing boat n"
. "rowing boat north".
@ $EAEC label=PhraseTokens_North
N $EAF5 Matches e.g. "s", "south", "boat s", "boat south", "rowing boat s",
. "rowing boat south".
@ $EAF5 label=PhraseTokens_South
N $EAFE Matches e.g. "e", "east", "boat e", "boat east", "rowing boat e",
. "rowing boat east".
@ $EAFE label=PhraseTokens_East
N $EB07 Matches e.g. "w", "west", "boat w", "boat west", "rowing boat w",
. "rowing boat west".
@ $EB07 label=PhraseTokens_West
B $E9CA,$01 #TOKEN(#PEEK(#PC)).
L $E9CA,$01,$146,$02

g $EB10 Table: Room Map
@ $EB10 label=Table_RoomMap
N $EB10 Room #N((#PC-$EB10)/$06): #ROOM((#PC-$EB10)/$06).
B $EB10,$01 #IF(#PEEK(#PC)>$00)(North to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB11,$01 #IF(#PEEK(#PC)>$00)(South to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB12,$01 #IF(#PEEK(#PC)>$00)(East to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB13,$01 #IF(#PEEK(#PC)>$00)(West to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB14,$01 #IF(#PEEK(#PC)>$00)(Up to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB15,$01 #IF(#PEEK(#PC)>$00)(Down to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
L $EB10,$06,$6D

g $ED9E Table: Configurable Exits
@ $ED9E label=Table_ConfigurableExits
W $ED9E,$02
L $ED9E,$02,$13

c $EDC4 Game Loop
@ $EDC4 label=GameLoop

c $EDD7 Game Over
@ $EDD7 label=GameOver
N $EDD7 Print "#STR$BE31,$08($b==$FF)".
  $EDD7,$03 #REGhl=#R$BE31.
  $EDDA,$03 Call #R$BAB1.
@ $EDDD label=WantAnotherGameInput
N $EDDD Print "#STR$BE3F,$08($b==$FF)".
  $EDDD,$03 #REGhl=#R$BE3F.
  $EDE0,$03 Call #R$BAB1.
@ $EDE3 label=WantAnotherGameInput_Loop
  $EDE3,$03 Call #R$BA5D.
N $EDE6 The player is done with the game, so reset back to BASIC.
  $EDE6,$05 #HTML(Reset back to BASIC if the keypress is "<code>#CHR$4E</code>".)
N $EDEB The player wants another go...
  $EDEB,$05 #HTML(Jump to #R$BA50 if the keypress is "<code>#CHR$59</code>".)
N $EDF0 Just loop round for any other input.
  $EDF0,$02 Jump to #R$EDE3.

c $EDF2 Game Complete
@ $EDF2 label=GameComplete
N $EDF8 Print "#STR$D526,$08($b==$FF)".

c $EE00 Fatal Events: Crab
@ $EE00 label=Event_Crab
N $EE00 Make the crab inactive.
  $EE00,$05 Reset bit 0 of *#R$BC66 which relates to the crab being active.
  $EE05,$05 Call #R$C35F using item: #ITEM$29.
  $EE0A,$01 Return if the crab is not in the current room.
N $EE0B Print "#STR$D5B0,$08($b==$FF)".
  $EE0B,$03 #REGhl=#R$D5B0.
  $EE0E,$03 Jump to #R$EE9B.

c $EE11 Fatal Events: Tentacle
@ $EE11 label=Event_Tentacle
N $EE11 Make the tentacle inactive.
  $EE11,$05 Reset bit 1 of *#R$BC66 which relates to the tentacle being active.
  $EE16,$05 Call #R$C35F using item: #ITEM$2B.
  $EE1B,$01 Return if the tentacle is not in the current room.
N $EE1C Print "#STR$D5F6,$08($b==$FF)".
  $EE1C,$03 #REGhl=#R$D5F6.
  $EE1F,$03 Jump to #R$EE9B.

c $EE22 Fatal Events: Drunk
@ $EE22 label=Event_Drunk
N $EE22 Make the drunkenness inactive.
  $EE22,$05 Reset bit 2 of *#R$BC66 which relates to the player being drunk.
  $EE27,$03 Load *#R$BCCB into #REGa.
  $EE2A,$03 Set the length of the high places table in #REGbc.
  $EE2D,$03 Set a pointer in #REGhl at #R$EE39.
  $EE30,$02 Search for the current room in the high places table.
  $EE32,$01 Return if the player is not currently in any rooms in the table.
N $EE33 The player is both drunk, and in a listed "high place". Uh oh...
N $EE33 Print "#STR$D629,$08($b==$FF)".
  $EE33,$03 #REGhl=#R$D629.
  $EE36,$03 Jump to #R$EE9B.
@ $EE39 label=Table_HighPlaces
N $EE39 All locations where a drunken player could potentially fall from a
. great height.
B $EE39,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $EE39,$01,$07,$02

c $EE40 Fatal Events: Lion
@ $EE40 label=Event_Lion
N $EE40 Make the lion inactive.
  $EE40,$05 Reset bit 3 of *#R$BC66 which relates to the lion being active.
  $EE45,$05 Call #R$C35F using item: #ITEM$2A.
  $EE4A,$01 Return if the lion is not in the current room.
N $EE4B Print "#STR$D66E,$08($b==$FF)".
  $EE4B,$03 #REGhl=#R$D66E.
  $EE4E,$03 Jump to #R$EE9B.

c $EE51 Fatal Events: Crocodile
@ $EE51 label=Event_Crocodile
N $EE51 Make the crocodile inactive.
  $EE51,$05 Reset bit 4 of *#R$BC66 which relates to the crocodile being
. active.
  $EE56,$06 Call #R$C401 with #R$E8C1.
  $EE5C,$01 Return if the crocodile is not in the current room.
N $EE5D Print "#STR$D6A0,$08($b==$FF)".
  $EE5D,$03 #REGhl=#R$D6A0.
  $EE60,$03 Jump to #R$EE9B.

c $EE63 Fatal Events: Cannibals
@ $EE63 label=Event_Cannibals
N $EE63 Make the cannibals inactive.
  $EE63,$05 Reset bit 5 of *#R$BC66 which relates to the natives being active.
  $EE68,$05 Call #R$C35F using item: #ITEM$18.
  $EE6D,$01 Return if the cannibals are not in the current room.
N $EE6E Print "#STR$D931,$08($b==$FF)".
  $EE6E,$03 #REGhl=#R$D931.
  $EE71,$03 Jump to #R$EE9B.

c $EE74 Events: Match
@ $EE74 label=Event_Match
N $EE74 Make the match inactive.
  $EE74,$05 Reset bit 6 of *#R$BC66 which relates to the match being active.
  $EE79,$05 Call #R$C3E4 with item #N$03: #ITEM$03.
  $EE7E,$02 Jump to #R$EE8A if the match is not in the players inventory.
N $EE80 The player is holding the lit match, and it's burned away so handle the
. messaging.
  $EE80,$03 #REGhl=#R$BC98.
  $EE83,$01 Decrease *#REGhl by one.
N $EE84 Print "#STR$DB91,$08($b==$FF)".
  $EE84,$03 #REGhl=#R$DB91.
  $EE87,$03 Call #R$BAB1.
N $EE8A The match can no longer be used, so destroy it.
@ $EE8A label=Event_Match_Return
  $EE8A,$05 Call #R$C3EA using item: #ITEM$03.
  $EE8F,$01 Return.

c $EE90 Fatal Events: Wave
@ $EE90 label=Event_Wave
N $EE90 Make the wave inactive.
  $EE90,$05 Reset bit 7 of *#R$BC66 which relates to the wave.
N $EE95 Print "#STR$E567,$08($b==$FF)".
  $EE95,$03 #REGhl=#R$E567.
  $EE98,$03 Jump to #R$EE9B.

c $EE9B Events: Game Over
@ $EE9B label=Events_GameOver
N $EE9B Force a newline to be "printed".
  $EE9B,$02 #REGa=#N$0D.
  $EE9D,$03 Call #R$BAC3.
  $EEA0,$03 Call #R$BAB1.
N $EEA3 Tidy up the stack.
  $EEA3,$03 Restore #REGhl, #REGhl and #REGhl from the stack.
  $EEA6,$03 Jump to #R$EDD7.

c $EEA9 Events: Seagull
@ $EEA9 label=Event_Seagull
D $EEA9 This event handles the seagull appearing.
N $EEA9 Print "#STR$D6EA,$08($b==$FF)".
  $EEA9,$03 #REGhl=#R$D6EA.
  $EEAC,$03 Call #R$BAB1.
N $EEAF Print "#STR$D716,$08($b==$FF)".
  $EEAF,$03 #REGhl=#R$D716.
  $EEB2,$03 Call #R$C579.
  $EEB5,$05 Call #R$C3EA using scenic event: #R$BC78(#N$00).
  $EEBA,$01 Return.

c $EEBB Events: Rat
@ $EEBB label=Event_Rat
D $EEBB This event handles the rat appearing.
N $EEBB Print "#STR$D73C,$08($b==$FF)".
  $EEBB,$03 #REGhl=#R$D73C.
  $EEBE,$03 Call #R$BAB1.
N $EEC1 Print "#STR$D76E,$08($b==$FF)".
  $EEC1,$03 #REGhl=#R$D76E.
  $EEC4,$03 Call #R$C579.
  $EEC7,$02 #REGa=#N$81 (event ID: #N($81&$7F)).
  $EEC9,$03 Call #R$C3EA.
  $EECC,$01 Return.

c $EECD Events: Deer
@ $EECD label=Event_Deer
D $EECD This event handles the deer appearing.
N $EECD Print "#STR$D797,$08($b==$FF)".
  $EECD,$03 #REGhl=#R$D797.
  $EED0,$03 Call #R$BAB1.
N $EED3 Print "#STR$D7AA,$08($b==$FF)".
  $EED3,$03 #REGhl=#R$D7AA.
  $EED6,$03 Call #R$C579.
  $EED9,$02 #REGa=#N$82 (event ID: #N($82&$7F)).
  $EEDB,$03 Call #R$C3EA.
  $EEDE,$01 Return.

c $EEDF Events: Pirate
@ $EEDF label=Event_Pirate
D $EEDF This event handles the pirate.
N $EEDF Print "#STR$D7C5,$08($b==$FF)".
  $EEDF,$03 #REGhl=#R$D7C5.
  $EEE2,$03 Call #R$BAB1.
  $EEE5,$05 Call #R$C582 with a maximum value of #N$0F.
  $EEEA,$02 Jump to #R$EEF5 if the random generator returns a non-zero
. response.
N $EEEC Bad luck!
  $EEEC,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $EEF0 Print "#STR$D7F6,$08($b==$FF)".
  $EEF0,$03 #REGhl=#R$D7F6.
  $EEF3,$02 Jump to #R$EEF8.
N $EEF5 Handle that the pirate should work out more.
@ $EEF5 label=Event_Pirate_Safe
N $EEF5 Print "#STR$D7DE,$08($b==$FF)".
  $EEF5,$03 #REGhl=#R$D7DE.
@ $EEF8 label=Event_Pirate_PrintAndReturn
  $EEF8,$03 Call #R$C579.
  $EEFB,$01 Return.

c $EEFC Events: Water Snake
@ $EEFC label=Event_WaterSnake
D $EEFC This event handles the water snake.
N $EEFC Print "#STR$D821,$08($b==$FF)".
  $EEFC,$03 #REGhl=#R$D821.
  $EEFF,$03 Call #R$BAB1.
  $EF02,$05 Call #R$C582 with a maximum value of #N$04.
  $EF07,$02 Jump to #R$EF1F if the random generator returns a non-zero
. response.
N $EF09 Bad luck #1!
N $EF09 Print "#STR$D84C,$08($b==$FF)".
  $EF09,$03 #REGhl=#R$D84C.
  $EF0C,$03 Call #R$C579.
  $EF0F,$05 Call #R$C582 with a maximum value of #N$14.
  $EF14,$02 Jump to #R$EF24 if the random generator returns a non-zero
. response.
N $EF16 Bad luck #2!
  $EF16,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $EF1A Print "#STR$D86A,$08($b==$FF)".
  $EF1A,$03 #REGhl=#R$D86A.
  $EF1D,$02 Jump to #R$EF2E.
N $EF1F Handle that the water snake just doesn't mess with you.
@ $EF1F label=Event_WaterSnake_Safe_1
N $EF1F Print "#STR$D8AA,$08($b==$FF)".
  $EF1F,$03 #REGhl=#R$D8AA.
  $EF22,$02 Jump to #R$EF27.
N $EF24 Handle that the water snake has terrible eyesight.
@ $EF24 label=Event_WaterSnake_Safe_2
N $EF24 Print "#STR$D88C,$08($b==$FF)".
  $EF24,$03 #REGhl=#R$D88C.
@ $EF27 label=WaterSnake_Safe_Continue
  $EF27,$01 Stash #REGhl on the stack.
  $EF28,$02 #REGa=#N$86 (event ID: #N($86&$7F)).
  $EF2A,$03 Call #R$C3EA.
  $EF2D,$01 Restore #REGhl from the stack.
@ $EF2E label=WaterSnake_PrintAndReturn
  $EF2E,$03 Call #R$C579.
  $EF31,$01 Return.

c $EF32 Events: Spider
@ $EF32 label=Event_Spider
D $EF32 This event handles the poisonous spider.
N $EF32 Print "#STR$D8D8,$08($b==$FF)".
  $EF32,$03 #REGhl=#R$D8D8.
  $EF35,$03 Call #R$BAB1.
  $EF38,$05 Call #R$C582 with a maximum value of #N$0A.
  $EF3D,$02 Jump to #R$EF48 if the random generator returns a non-zero
. response.
N $EF3F Bad luck! 
  $EF3F,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $EF43 Print "#STR$D922,$08($b==$FF)".
  $EF43,$03 #REGhl=#R$D922.
  $EF46,$02 Jump to #R$EF50.
N $EF48 Handle that the poisonous spider didn't sting you.
@ $EF48 label=Event_Spider_Safe
  $EF48,$02 #REGa=#N$87 (event ID: #N($87&$7F)).
  $EF4A,$03 Call #R$C3EA.
N $EF4D Print "#STR$D8FA,$08($b==$FF)".
  $EF4D,$03 #REGhl=#R$D8FA.
@ $EF50 label=Event_Spider_PrintAndReturn
  $EF50,$03 Call #R$C579.
  $EF53,$01 Return.

c $EF54
R $EF54 A Room ID
  $EF54,$03 #REGhl=#R$BC6F.
  $EF57,$04 Jump to #R$EF7B if bit 0 of *#REGhl is unset.
  $EF5B,$05 Initialise #R$BC67 to #N$06.
  $EF60,$04 Jump to #R$EF7B if #REGa is not equal to #N$2C.
  $EF64,$05 Reset bit 0 of *#R$BC6F.
  $EF69,$01 Stash #REGaf on the stack.
N $EF6A Spawn the giant crab in #ROOM$30.
  $EF6A,$06 Call #R$C412 using item #ITEM$29 to create it in #ROOM$30.
  $EF70,$01 Restore #REGaf from the stack.
  $EF71,$05 Write #N$2F to *#R$EC27 to open up westbound access to #ROOM$2F
. from #ROOM$2E.
  $EF76,$05 Write #N$30 to *#R$EC2A to open up northbound access to #ROOM$30
. from #ROOM$2F.
  $EF7B,$03 Call #R$C520.
  $EF7E,$02 #REGe=#N$00.
  $EF80,$03 Call #R$C21E.
  $EF83,$07 Jump to #R$EFA7 if *#R$BCCB is not room #N$30: "#ROOM$30".
  $EF8A,$05 Call #R$C35F with #ITEM$29.
  $EF8F,$02 Jump to #R$EFA7 if #REGa is not equal to #N$29.
  $EF91,$05 Set bit 0 of *#R$BC6F.
  $EF96,$04 Write #N$00 to *#R$EC27 to remove access to #ROOM$2F from #ROOM$2E.
  $EF9A,$03 Write #N$00 to *#R$EC2A to remove access to #ROOM$30 from #ROOM$2F.
  $EF9D,$05 Set bit 0 of *#R$BC66 which relates to the crab being active.
  $EFA2,$05 Write #N$06 to *#R$BC67.
  $EFA7,$05 Call #R$C35F with #ITEM$2B.
  $EFAC,$02 Jump to #R$EFB8 if #ITEM$2B isn't in the current room.
  $EFAE,$05 Set bit 1 of *#R$BC66 which relates to the tentacle being active.
  $EFB3,$05 Write #N$05 to *#R$BC68.
  $EFB8,$05 Call #R$C35F with #ITEM$2A.
  $EFBD,$02 Jump to #R$EFC9 if #ITEM$2A isn't in the current room.
  $EFBF,$05 Set bit 3 of *#R$BC66 which relates to the lion being active.
  $EFC4,$05 Write #N$07 to *#R$BC6A.
  $EFC9,$06 Call #R$C401 with #R$E8C1.
  $EFCF,$02 Jump to #R$EFDB if #REGa is not equal to #N$07.
  $EFD1,$05 Set bit 4 of *#R$BC66 which relates to the crocodile being active.
  $EFD6,$05 Write #N$0B to *#R$BC6B.
  $EFDB,$05 Call #R$C35F with #ITEM$18.
  $EFE0,$02 Jump to #R$EFEC if #ITEM$18 isn't in the current room.
  $EFE2,$05 Set bit 5 of *#R$BC66 which relates to the cannibals being active.
  $EFE7,$05 Initialise the turn counter at *#R$BC6C with #N$09.
  $EFEC,$07 Jump to #R$EFFF if *#R$BCCB is not room #N$03: "#ROOM$03".
  $EFF3,$05 Call #R$C35F with #ITEM$1D.
  $EFF8,$02 Jump to #R$EFFF if #ITEM$1D isn't in the current room.
  $EFFA,$02 Restore #REGhl and #REGhl from the stack.
  $EFFC,$03 Jump to #R$EDF2.
  $EFFF,$07 Jump to #R$F019 if *#R$BCCB is not room #N$02: "#ROOM$02".
  $F006,$07 Jump to #R$F019 if bit 5 of *#R$BC54 is set.
  $F00D,$02 Set bit 5 of *#REGhl.
  $F00F,$05 Set bit 7 of *#R$BC66 which relates to the wave being active.
  $F014,$05 Write #N$05 to *#R$BC6E.
  $F019,$07 Jump to #R$F039 if *#R$BCCB is not room #N$6C: "#ROOM$6C".
  $F020,$05 Call #R$C35F with #ITEM$1D.
  $F025,$02 Jump to #R$F039 if #ITEM$1D isn't in the current room.
N $F027 Print "#STR$E5CF,$08($b==$FF)".
  $F027,$03 #REGhl=#R$E5CF.
  $F02A,$03 Call #R$BAB1.
  $F02D,$01 Restore #REGhl from the stack.
N $F02E Bad luck!
  $F02E,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $F032 Print "#STR$E5ED,$08($b==$FF)".
  $F032,$03 #REGhl=#R$E5ED.
  $F035,$03 Call #R$C579.
  $F038,$01 Return.

  $F039,$01 Return.

c $F03A Print String And Newline Alias
@ $F03A label=PrintStringAndNewline_Alias
  $F03A,$03 Call #R$BAB1.
  $F03D,$01 Return.

c $F03E Pause, Print String And Scroll Alias
@ $F03E label=PausePrintStringAndScroll_Alias
  $F03E,$03 Call #R$C579.
  $F041,$01 Return.

c $F042 Response: "Work It Out For Yourself"
@ $F042 label=Response_WorkItOutForYourself
N $F042 Print "#STR$D9F3,$08($b==$FF)".
  $F042,$03 #REGhl=#R$D9F3.
  $F045,$02 Jump to #R$F03A.

c $F047 Response: "You Really Don't Need It"
@ $F047 label=Response_YouReallyDontNeedIt
N $F047 Print "#STR$DA0D,$08($b==$FF)".
  $F047,$03 #REGhl=#R$DA0D.
  $F04A,$02 Jump to #R$F03A.

c $F04C Response: "You're Not Carrying Anything"
@ $F04C label=Response_YoureNotCarryingAnything
N $F04C Print "#STR$BFC4,$08($b==$FF)".
  $F04C,$03 #REGhl=#R$BFC4.
  $F04F,$02 Jump to #R$F03A.

c $F051 Response: "Try Climbing"
@ $F051 label=Response_TryClimbing
N $F051 Print "#STR$DA59,$08($b==$FF)".
  $F051,$03 #REGhl=#R$DA59.
  $F054,$02 Jump to #R$F03A.

c $F056 Response: "Try Rowing"
@ $F056 label=Response_TryRowing
N $F056 Print "#STR$DA67,$08($b==$FF)".
  $F056,$03 #REGhl=#R$DA67.
  $F059,$02 Jump to #R$F03A.

c $F05B Response: "You Can't Go In That Direction"
@ $F05B label=Response_YouCantGoInThatDirection
N $F05B Print "#STR$BF62,$08($b==$FF)".
  $F05B,$03 #REGhl=#R$BF62.
  $F05E,$02 Jump to #R$F03A.

c $F060 Response: "One At A Time, Please"
@ $F060 label=Response_OneAtATimePlease
N $F060 Print "#STR$BF82,$08($b==$FF)".
  $F060,$03 #REGhl=#R$BF82.
  $F063,$02 Jump to #R$F03A.

c $F065 Response: "I Don't See The Point"
@ $F065 label=Response_IDontSeeThePoint
N $F065 Print "#STR$BF98,$08($b==$FF)".
  $F065,$03 #REGhl=#R$BF98.
  $F068,$02 Jump to #R$F03A.

c $F06A Response: "O.K."
@ $F06A label=Response_OK_Duplicate
N $F06A Print "#STR$BF0B,$08($b==$FF)".
  $F06A,$03 #REGhl=#R$BF0B.
  $F06D,$02 Jump to #R$F03A.

c $F06F Response: "You Can't"
@ $F06F label=Response_YouCant_Duplicate
N $F06F Print "#STR$BF00,$08($b==$FF)".
  $F06F,$03 #REGhl=#R$BF00.
  $F072,$02 Jump to #R$F03A.

c $F074 Response: "Please Rephrase That"
@ $F074 label=Response_PleaseRephraseThat_Duplicate
N $F074 Print "#STR$BEEA,$08($b==$FF)".
  $F074,$03 #REGhl=#R$BEEA.
  $F077,$02 Jump to #R$F03A.

c $F079 Response: "You've Done That Already"
@ $F079 label=Response_YouveDoneThatAlready
N $F079 Print "#STR$DEFB,$08($b==$FF)".
  $F079,$03 #REGhl=#R$DEFB.
  $F07C,$02 Jump to #R$F03A.

c $F07E Response: "You're Not Carrying It"
@ $F07E label=Response_YoureNotCarryingIt
N $F07E Print "#STR$E067,$08($b==$FF)".
  $F07E,$03 #REGhl=#R$E067.
  $F081,$02 Jump to #R$F03A.

c $F083 Response: "You Must Be Joking"
@ $F083 label=Response_YouMustBeJoking
N $F083 Print "#STR$E224,$08($b==$FF)".
  $F083,$03 #REGhl=#R$E224.
  $F086,$02 Jump to #R$F03A.

c $F088 Response: "It's Already Open"
@ $F088 label=Response_ItsAlreadyOpen
N $F088 Print "#STR$E2C9,$08($b==$FF)".
  $F088,$03 #REGhl=#R$E2C9.
  $F08B,$02 Jump to #R$F03A.

c $F08D Response: "It's Already Closed"
@ $F08D label=Response_ItsAlreadyClosed
N $F08D Print "#STR$E2DC,$08($b==$FF)".
  $F08D,$03 #REGhl=#R$E2DC.
  $F090,$02 Jump to #R$F03A.

c $F092 Response: "Don't Be Ridiculous"
@ $F092 label=Response_DontBeRidiculous
N $F092 Print "#STR$E4BC,$08($b==$FF)".
  $F092,$03 #REGhl=#R$E4BC.
  $F095,$02 Jump to #R$F03A.

c $F097 Response: "It Has No Apparent Effect"
@ $F097 label=Response_ItHasNoApparentEffect
N $F097 Print "#STR$E5B4,$08($b==$FF)".
  $F097,$03 #REGhl=#R$E5B4.
  $F09A,$02 Jump to #R$F03A.

c $F09C Action: Help
@ $F09C label=Action_Help
  $F09C,$03 Call #R$C470.
N $F09F The "HELP" command can only be called on its own; you can't type "HELP
. CROCODILE" or "HELP WITH MATCH".
  $F09F,$01 Return if there's any token set in #R$BD67.
N $F0A0 Does the player want help with the natives/ cannibals?
  $F0A0,$07 Jump to #R$F0C2 if #R$C35F reports the player isn't in the room
. where you're #ITEM$18.
N $F0A7 Provide an initial full response for the natives/ cannibals.
  $F0A7,$07 Jump to #R$F0BC if bit 1 of *#R$BC54 is set, which relates to
. asking for help a second time.
N $F0AE This is the first time the player has asked for help on this topic, so
. flag that it's been answered from now on.
  $F0AE,$02 Set bit 1 of *#R$BC54 which relates to asking for help about the
. natives/ cannibals.
N $F0B0 Print "#STR$D974,$08($b==$FF)".
  $F0B0,$03 #REGhl=#R$D974.
  $F0B3,$03 Call #R$BAB1.
N $F0B6 Print "#STR$D993,$08($b==$FF)".
  $F0B6,$03 #REGhl=#R$D993.
  $F0B9,$03 Call #R$C579.
@ $F0BC label=Action_Help_Cannibals
N $F0BC Print "#STR$D9B4,$08($b==$FF)".
  $F0BC,$03 #REGhl=#R$D9B4.
  $F0BF,$03 Jump to #R$F03E.
N $F0C2 Does the player want help with the boulder?
@ $F0C2 label=Action_Help_Boulder
  $F0C2,$07 Jump to #R$F0CF if #R$C35F reports the player isn't in the room
. where there's a #ITEM$39.
N $F0C9 The player is where the boulder is, so provide some pretty good help.
N $F0C9 Print "#STR$D9CA,$08($b==$FF)".
  $F0C9,$03 #REGhl=#R$D9CA.
  $F0CC,$03 Jump to #R$F03A.
N $F0CF Does the player want help with the crocodile?
@ $F0CF label=Action_Help_Crocodile
  $F0CF,$07 Jump to #R$F0DC if #R$C35F reports the player isn't in the room
. where there's #ITEM$13.
N $F0D6 The player is where the crocodile is, so provide some abstract
. unhelpful help.
N $F0D6 Print "#STR$D9DF,$08($b==$FF)".
  $F0D6,$03 #REGhl=#R$D9DF.
  $F0D9,$03 Jump to #R$F03A.
N $F0DC Does the player want help with the crocodile with the keg in its mouth?
@ $F0DC label=label=Action_Help_CrocodileKeg
  $F0DC,$08 Jump to #R$F042 if #R$C35F reports that #ITEM$14 is in the same
. room as the player.
N $F0E4 Does the player want help with the giant octopus?
  $F0E4,$08 Jump to #R$F042 if #R$C35F reports that #ITEM$2B is in the same
. room as the player.
N $F0EC Does the player want help with the lion?
  $F0EC,$07 Jump to #R$F0F9 if #R$C35F reports the player isn't in the room
. where there's #ITEM$2A.
N $F0F3 The player is where the lion is, so provide some abstract unhelpful
. help.
N $F0F3 Print "#STR$DA27,$08($b==$FF)".
  $F0F3,$03 #REGhl=#R$DA27.
  $F0F6,$03 Jump to #R$F03A.
N $F0F9 Does the player want help with the parrot?
@ $F0F9 label=Action_Help_Parrot
  $F0F9,$07 Jump to #R$F106 if #R$C35F reports the player isn't in the room
. where there's #ITEM$27.
N $F100 The player is where the parrot is, so provide some abstract unhelpful
. help.
N $F100 Print "#STR$DA33,$08($b==$FF)".
  $F100,$03 #REGhl=#R$DA33.
  $F103,$03 Jump to #R$F03A.
N $F106 Does the player want help when they're at sea?
@ $F106 label=Action_Help_Sea
  $F106,$07 Jump to #R$F113 if the *#R$BCCB is not room #N$02: "#ROOM$02".
N $F10D More unhelpful help ...
N $F10D Print "#STR$DA41,$08($b==$FF)".
  $F10D,$03 #REGhl=#R$DA41.
  $F110,$03 Jump to #R$F03A.
N $F113 Does the player want help with the door?
@ $F113 label=Action_Help_Door
  $F113,$08 Jump to #R$F042 if #R$C35F reports that #ITEM$32 is in the same
. room as the player.
N $F11B Does the player want help with the pit?
  $F11B,$06 Call #R$C401 with #R$E8E9.
  $F121,$02 Jump to #R$F12B if the player is not in the room with the pit.
N $F123 Does the player want help with the plank?
  $F123,$08 Jump to #R$F042 if #R$C35F reports that #ITEM$04 is in the same
. room as the player.
N $F12B There's no more help available...
@ $F12B label=Action_Help_GiveUp
  $F12B,$03 Jump to #R$F047.

c $F12E Action: Inventory
@ $F12E label=Action_Inventory
  $F12E,$03 Call #R$C470.
N $F131 The "INVENTORY" command can only be called on its own.
  $F131,$01 Return if there's any token set in #R$BD67.
  $F132,$07 Jump to #R$F04C if *#R$BC98 is zero (the player isn't holding any
. items).
N $F139 Clear the screen and display the players inventory.
  $F139,$03 Call #R$BA6D.
  $F13C,$03 Call #R$BA89.
N $F13F Print "#STR$BF4F,$08($b==$FF)".
  $F13F,$03 #REGhl=#R$BF4F.
  $F142,$03 Call #R$BAB1.
  $F145,$05 Call #R$C1FF with a room ID of #N$01 which is the players
. inventory.
  $F14A,$01 Return.

c $F14B Action: Look
@ $F14B label=Action_Look
  $F14B,$03 Call #R$C470.
N $F14E The "LOOK" command can only be called on its own.
  $F14E,$01 Return if there's any token set in #R$BD67.
  $F14F,$05 Call #R$C21E with #REGe set to #N$01 (which will force any room
. images to be re-displayed).
  $F154,$01 Return.

c $F155 Action: North
@ $F155 label=Action_North
  $F155,$02 Set #REGc to "NORTH" (#N$00).
  $F157,$02 Jump to #R$F16B.

c $F159 Action: South
@ $F159 label=Action_South
  $F159,$02 Set #REGc to "SOUTH" (#N$01).
  $F15B,$02 Jump to #R$F16B.

c $F15D Action: East
@ $F15D label=Action_East
  $F15D,$02 Set #REGc to "EAST" (#N$02).
  $F15F,$02 Jump to #R$F16B.

c $F161 Action: West
@ $F161 label=Action_West
  $F161,$02 Set #REGc to "WEST" (#N$03).
  $F163,$02 Jump to #R$F16B.

c $F165 Action: Up
@ $F165 label=Action_Up
  $F165,$02 Set #REGc to "UP" (#N$04).
  $F167,$02 Jump to #R$F16B.

c $F169 Action: Down
@ $F169 label=Action_Down
E $F169 Continue on to #R$F16B.
  $F169,$02 Set #REGc to "DOWN" (#N$05).

c $F16B Move Player
@ $F16B label=MovePlayer
R $F16B C Requested direction where: #TABLE { #N$00 | NORTH } { #N$01 | SOUTH } { #N$02 | EAST } { #N$03 | WEST } { #N$04 | UP } { #N$05 | DOWN } TABLE#
  $F16B,$03 Call #R$C470.
N $F16E All "MOVE" commands can only be called on their own; you can't type
. "NORTH TO BEACH" or "UP LADDER".
  $F16E,$01 Return if there's any token set in #R$BD67.
  $F16F,$02 Set #REGb to #N$00, so that #REGbc now holds the direction number.
  $F171,$03 Call #R$C302.
  $F174,$01 #REGhl+=#REGbc.
  $F175,$01 #REGa=*#REGhl.
  $F176,$03 Jump to #R$F17D if #REGa is zero.
  $F179,$03 Call #R$EF54.
  $F17C,$01 Return.
N $F17D Is the player stuck out on the rowing boat?
@ $F17D label=CheckPlayer_RowingBoat
  $F17D,$07 Skip forward to #R$F190 if the *#R$BCCB is not room #N$04:
. "#ROOM$04".
N $F184 The player is stuck in the rowing boat...
  $F184,$06 Jump to #R$F051 if the player was trying to move "UP" (#N$04).
. Instead they must #R$F91B(climb) the ladder.
  $F18A,$03 Jump to #R$F056 if the player was trying to move "NORTH", "SOUTH",
. "EAST" or "WEST". Instead, they need to #R$FD02(row).
N $F18D Else, the player was trying to move "DOWN"...
  $F18D,$03 Jump to #R$F05B.
N $F190 Is the player stuck out at sea?
@ $F190 label=CheckPlayer_AtSea
  $F190,$04 Jump to #R$F19A if *#R$BCCB is not room #N$02: "#ROOM$02".
N $F194 As above, except there's now no ladder!
  $F194,$06 Jump to #R$F056 if the player was trying to move "NORTH", "SOUTH",
. "EAST" or "WEST".
N $F19A Nothing else is valid.
N $F19A Print "#STR$BF62,$08($b==$FF)".
@ $F19A label=MovePlayer_Invalid
  $F19A,$03 Jump to #R$F05B.

c $F19D Action: Examine
@ $F19D label=Action_Examine
  $F19D,$03 Call #R$C47B.
  $F1A0,$01 Return if the direct object is malformed.
  $F1A1,$05 Jump to #R$F060 if #REGa is not equal to #N$01.
N $F1A6 Was the player trying to examine ... the bottle?
  $F1A6,$06 Call #R$C37F with #R$E9CA.
  $F1AC,$02 Jump to #R$F1C4 if the token isn't for the bottle.
N $F1AE The player was trying to examine the bottle, but the bottle has
. "states" - before you examine it for the first time it's simply #ITEM$0B but
. after, it becomes #ITEM$0C! So is it currently only #ITEM$0B?
  $F1AE,$06 Call #R$C401 with #R$E87A.
  $F1B4,$04 Jump to #R$F1C4 if the bottle is not item #N$0B: #ITEM$0B (if it's
. already been declared to contain rum).
N $F1B8 Change the bottle state!
  $F1B8,$06 Call #R$C426 to transform item #N$0B (#ITEM$0B) into item #N$0C
. (#ITEM$0C).
N $F1BE Print "#STR$DA73,$08($b==$FF)".
  $F1BE,$03 #REGhl=#R$DA73.
  $F1C1,$03 Jump to #R$F03A.
N $F1C4 Was the player trying to examine ... the fish?
@ $F1C4 label=Validate_Examine_Fish
  $F1C4,$06 Call #R$C37F with #R$E9CC.
  $F1CA,$02 Jump to #R$F1DF if the token isn't for the fish.
N $F1CC The player was trying to examine the fish, it also has "states"
. similarly to the bottle. Before you examine it for the first time, it's
. simply #ITEM$1B and afterwards it becomes #ITEM$1C!
  $F1CC,$05 Call #R$C35F with #ITEM$1B.
  $F1D1,$02 Jump to #R$F1DF if #ITEM$1B isn't in the current room or players
. inventory.
N $F1D3 Change the fish state!
  $F1D3,$06 Call #R$C426 to transform item #N$1B (#ITEM$1B) into item #N$1C
. (#ITEM$1C).
N $F1D9 Print "#STR$DA85,$08($b==$FF)".
  $F1D9,$03 #REGhl=#R$DA85.
  $F1DC,$03 Jump to #R$F03A.
N $F1DF Was the player trying to examine ... the watch?
@ $F1DF label=Validate_Examine_Watch
  $F1DF,$06 Call #R$C37F with #R$E9D1.
  $F1E5,$02 Jump to #R$F1ED if the token isn't for the watch.
N $F1E7 Print "#STR$DA99,$08($b==$FF)".
  $F1E7,$03 #REGhl=#R$DA99.
  $F1EA,$03 Jump to #R$F03A.
N $F1ED Was the player trying to examine ... the shoe?
@ $F1ED label=Validate_Examine_Shoe
  $F1ED,$06 Call #R$C37F with #R$E9D3.
  $F1F3,$02 Jump to #R$F1FB if the token isn't for the shoe.
N $F1F5 Print "#STR$DAAD,$08($b==$FF)".
  $F1F5,$03 #REGhl=#R$DAAD.
  $F1F8,$03 Jump to #R$F03A.
N $F1FB Was the player trying to examine ... the rod?
@ $F1FB label=Validate_Examine_Rod
  $F1FB,$06 Call #R$C37F with #R$E9D5.
  $F201,$02 Jump to #R$F209 if the token isn't for the rod.
N $F203 Print "#STR$DADA,$08($b==$FF)".
  $F203,$03 #REGhl=#R$DADA.
  $F206,$03 Jump to #R$F03A.
N $F209 Was the player trying to examine ... the fruit?
@ $F209 label=Validate_Examine_Fruit
  $F209,$06 Call #R$C37F with #R$E9D7.
  $F20F,$02 Jump to #R$F217 if the token isn't for the fruit.
N $F211 Print "#STR$DAFB,$08($b==$FF)".
  $F211,$03 #REGhl=#R$DAFB.
  $F214,$03 Jump to #R$F03A.
N $F217 Was the player trying to examine ... the bridge?
@ $F217 label=Validate_Examine_Bridge
  $F217,$06 Call #R$C37F with #R$E9D9.
  $F21D,$02 Jump to #R$F225 if the token isn't for the bridge.
N $F21F Print "#STR$DB0F,$08($b==$FF)".
  $F21F,$03 #REGhl=#R$DB0F.
  $F222,$03 Jump to #R$F03A.
N $F225 Was the player trying to examine ... the jewels?
@ $F225 label=Validate_Examine_Jewels
  $F225,$06 Call #R$C37F with #R$E9DB.
  $F22B,$02 Jump to #R$F233 if the token isn't for the jewels.
N $F22D Print "#STR$DB37,$08($b==$FF)".
  $F22D,$03 #REGhl=#R$DB37.
  $F230,$03 Jump to #R$F03A.
N $F233 Nothing else is valid.
@ $F233 label=Examine_Invalid
  $F233,$03 Jump to #R$F065.

c $F236 Action: Load
@ $F236 label=Action_Load
  $F236,$03 Call #R$C470.
N $F239 The "LOAD" command can only be called on its own.
  $F239,$01 Return if there's any token set in #R$BD67.
  $F23A,$03 Call #R$BB94.
  $F23D,$01 Return.

c $F23E Action: Save
@ $F23E label=Action_Save
  $F23E,$03 Call #R$C470.
N $F241 The "SAVE" command can only be called on its own.
  $F241,$01 Return if there's any token set in #R$BD67.
  $F242,$03 Call #R$BB59.
  $F245,$01 Return.

c $F246 Action: Quit
@ $F246 label=Action_Quit
  $F246,$03 Call #R$C470.
N $F249 The "QUIT" command can only be called on its own.
  $F249,$01 Return if there's any token set in #R$BD67.
N $F24A Print "#STR$BEB5,$08($b==$FF)".
  $F24A,$03 #REGhl=#R$BEB5.
  $F24D,$03 Call #R$BAB1.
@ $F250 label=WantToSave_Loop
  $F250,$03 Call #R$BA5D.
N $F253 The player just wants to quit.
  $F253,$04 #HTML(Jump to #R$F25E if the keypress is "<code>#CHR$4E</code>".)
  $F257,$04 #HTML(Jump back to #R$F250 if the keypress is anything other than
. "<code>#CHR$59</code>".)
N $F25B The player does want to save before quitting...
  $F25B,$03 Call #R$BB59.
N $F25E Jump to asking if the player "wants another game?"
@ $F25E label=QuitGame
  $F25E,$04 Switch #R$EDDD onto the stack so the next return action is asking
. if the player would "Want another game? Y/N.".
  $F262,$01 Return.

c $F263 Action: Take
@ $F263 label=Action_Take
  $F263,$03 Call #R$C47B.
  $F266,$01 Return if the direct object is malformed.
N $F267 Start by calling the chain of items to check...
  $F267,$03 Jump to #R$F2A8.
N $F26A Check if the player is holding the requested item?
@ $F26A label=Take_IsPlayerHoldingItem
  $F26A,$03 Call #R$C3E4.
  $F26D,$02 Jump to #R$F28D if #REGa is not equal to #N$59.
  $F26F,$01 Restore #REGhl from the stack.
N $F270 Print "#STR$BF10,$08($b==$FF)".
  $F270,$03 #REGhl=#R$BF10.
  $F273,$03 Call #R$BAA4.
  $F276,$03 #REGhl=#R$F29B.
  $F279,$01 #REGa=#REGe.
  $F27A,$03 #REGbc=#N($0001,$04,$04).
  $F27D,$02 CPIR.
  $F27F,$02 Jump to #R$F287 if #REGa is equal to #N$59.
N $F281 Print "#STR$BF2B,$08($b==$FF)".
  $F281,$03 #REGhl=#R$BF2B.
  $F284,$03 Jump to #R$F03A.

N $F287 Print "#STR$BF2F,$08($b==$FF)".
  $F287,$03 #REGhl=#R$BF2F.
  $F28A,$03 Jump to #R$F03A.

  $F28D,$05 Compare *#R$BC98 with #N$05...
  $F292,$01 #REGb=#REGe.
  $F293,$01 Return if *#R$BC98 is not equal to #N$05.
  $F294,$01 Restore #REGhl from the stack.
N $F295 Print "#STR$BF35,$08($b==$FF)".
  $F295,$03 #REGhl=#R$BF35.
  $F298,$03 Jump to #R$F03A.
N $F29B Table: All the items in the game which are plural.
N $F29B Which is ... the jewels.
@ $F29B label=Table_ItemsWhichArePlural
B $F29B,$01 Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC)).
N $F29C The player can take the item.
@ $F29C label=TakeItem
  $F29C,$02 Load #REGc with #N$01 which indicates the item will be in the
. players inventory.
  $F29E,$03 Call #R$C412.
  $F2A1,$04 Increment *#R$BC98 by one.
  $F2A5,$03 Jump to #R$F06A.
N $F2A8 Was the player trying to take the bottle of rum?
@ $F2A8 label=Validate_Take_BottleOfRum
  $F2A8,$06 Call #R$C37F with #R$E9E7.
  $F2AE,$02 Jump to #R$F2BC if the token isn't for the bottle of rum.
  $F2B0,$06 Call #R$C401 with #R$E87A.
  $F2B6,$03 Call #R$F26A.
  $F2B9,$03 Jump to #R$F29C.
N $F2BC Was the player trying to take the fish?
@ $F2BC label=Validate_Take_Fish
  $F2BC,$06 Call #R$C37F with #R$E9CC.
  $F2C2,$02 Jump to #R$F2D0 if the token isn't for the fish.
  $F2C4,$06 Call #R$C401 with #R$E895.
  $F2CA,$03 Call #R$F26A.
  $F2CD,$03 Jump to #R$F29C.
N $F2D0 Was the player trying to take the watch?
@ $F2D0 label=Validate_Take_Watch
  $F2D0,$06 Call #R$C37F with #R$E9D1.
  $F2D6,$02 Jump to #R$F2ED if the token isn't for the watch.
  $F2D8,$05 Call #R$C35F with #ITEM$19.
  $F2DD,$02 Jump to #R$F2E5 if #ITEM$19 isn't in the current room.
N $F2DF Print "#STR$DB5F,$08($b==$FF)".
  $F2DF,$03 #REGhl=#R$DB5F.
  $F2E2,$03 Jump to #R$F03A.

  $F2E5,$05 Call #R$F26A with #ITEM$17.
  $F2EA,$03 Jump to #R$F29C.
N $F2ED Was the player trying to take the shoe?
@ $F2ED label=Validate_Take_Shoe
  $F2ED,$06 Call #R$C37F with #R$E9D3.
  $F2F3,$02 Jump to #R$F2FD if the token isn't for the shoe.
  $F2F5,$05 Call #R$F26A with #ITEM$15.
  $F2FA,$03 Jump to #R$F29C.
N $F2FD Was the player trying to take the fruit?
@ $F2FD label=Validate_Take_Fruit
  $F2FD,$06 Call #R$C37F with #R$E9D7.
  $F303,$02 Jump to #R$F30D if the token isn't for the fruit.
  $F305,$05 Call #R$F26A with #ITEM$0E.
  $F30A,$03 Jump to #R$F29C.
N $F30D Was the player trying to take the rod?
@ $F30D label=Validate_Take_Rod
  $F30D,$06 Call #R$C37F with #R$E9D5.
  $F313,$02 Jump to #R$F347 if the token isn't for the rod.
  $F315,$05 Call #R$F26A with #ITEM$08.
  $F31A,$01 #REGa=#REGb.
  $F31B,$03 Call #R$C35F.
  $F31E,$02 #REGb=#N$08.
  $F320,$03 Jump to #R$F29C if *#REGhl is equal to #N$08.
  $F323,$06 Call #R$C426 to transform item #N$0A (#ITEM$0A) into item #N$09
. (#ITEM$09).
  $F329,$06 Call #R$C426 to transform item #N$31 (#ITEM$31) into item #N$32
. (#ITEM$32).
  $F32F,$06 Call #R$C412 using item #ITEM$33 to create it in #ROOM$15.
  $F335,$04 Write #N$00 to *#R$EB90 to remove access to #ROOM$6A from #ROOM$15.
  $F339,$03 Write #N$00 to *#R$ED8D to remove access to #ROOM$15 from #ROOM$6A.
  $F33C,$02 #REGb=#N$08.
  $F33E,$03 Call #R$F29C.
N $F341 Print "#STR$DB7C,$08($b==$FF)".
  $F341,$03 #REGhl=#R$DB7C.
  $F344,$03 Jump to #R$F03A.
N $F347 Was the player trying to take the jewels?
@ $F347 label=Validate_Take_Jewels
  $F347,$06 Call #R$C37F with #R$E9DB.
  $F34D,$02 Jump to #R$F357 if the token isn't for the jewels.
  $F34F,$05 Call #R$F26A with #ITEM$1D.
  $F354,$03 Jump to #R$F29C.
N $F357 Was the player trying to take the match?
@ $F357 label=Validate_Take_Match
  $F357,$06 Call #R$C37F with #R$E9E1.
  $F35D,$02 Jump to #R$F36B if the token isn't for the match.
  $F35F,$06 Call #R$C401 with #R$E86E.
  $F365,$03 Call #R$F26A.
  $F368,$03 Jump to #R$F29C.
N $F36B Was the player trying to take the plank?
@ $F36B label=Validate_Take_Plank
  $F36B,$06 Call #R$C37F with #R$E9E3.
  $F371,$02 Jump to #R$F398 if the token isn't for the plank.
  $F373,$06 Call #R$C401 with #R$E871.
  $F379,$03 Call #R$F26A.
  $F37C,$01 #REGa=#REGb.
  $F37D,$05 Jump to #R$F29C if #REGa is equal to #N$04.
  $F382,$02 #REGa=#N$05 (event ID: #N($05&$7F)).
  $F384,$03 Call #R$C3EA.
  $F387,$02 #REGa=#N$06 (event ID: #N($06&$7F)).
  $F389,$03 Call #R$C3EA.
  $F38C,$02 #REGb=#N$04.
  $F38E,$07 Write #N$00 to: #LIST { *#R$ED75 } { *#R$ED80 } LIST#
  $F395,$03 Jump to #R$F29C.
N $F398 Was the player trying to take the coconut?
@ $F398 label=Validate_Take_Coconut
  $F398,$06 Call #R$C37F with #R$E9E5.
  $F39E,$02 Jump to #R$F3A8 if the token isn't for the coconut.
  $F3A0,$05 Call #R$F26A with #ITEM$07.
  $F3A5,$03 Jump to #R$F29C.
N $F3A8 Was the player trying to take the gun?
@ $F3A8 label=Validate_Take_Gun
  $F3A8,$06 Call #R$C37F with #R$E9EF.
  $F3AE,$02 Jump to #R$F3D5 if the token isn't for the gun.
  $F3B0,$05 Call #R$F26A with #ITEM$0F.
  $F3B5,$05 Call #R$C35F with #ITEM$27.
  $F3BA,$02 Jump to #R$F3CB if #ITEM$27 is present in the current room.
  $F3BC,$02 #REGa=#N$22 (event ID: #N($22&$7F)).
  $F3BE,$03 Call #R$C3EA.
  $F3C1,$02 #REGa=#N$88.
  $F3C3,$03 Call #R$C3FA.
  $F3C6,$02 #REGb=#N$0F.
  $F3C8,$03 Jump to #R$F29C.

N $F3CB Bad luck!
  $F3CB,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $F3CF Print "#STR$DBCC,$08($b==$FF)".
  $F3CF,$03 #REGhl=#R$DBCC.
  $F3D2,$03 Jump to #R$F03A.
N $F3D5 Was the player trying to take the eyepatch?
@ $F3D5 label=Validate_Take_Eyepatch
  $F3D5,$06 Call #R$C37F with #R$E9F1.
  $F3DB,$02 Jump to #R$F3E9 if the token isn't for the eyepatch.
  $F3DD,$06 Call #R$C401 with #R$E885.
  $F3E3,$03 Call #R$F26A.
  $F3E6,$03 Jump to #R$F29C.
N $F3E9 Was the player trying to take the keg of gunpowder?
@ $F3E9 label=Validate_Take_KegOfGunpowder
  $F3E9,$06 Call #R$C37F with #R$E9F3.
  $F3EF,$02 Jump to #R$F403 if the token isn't for the keg of gunpowder.
  $F3F1,$06 Call #R$C401 with #R$E888.
  $F3F7,$03 Call #R$F26A.
  $F3FA,$01 #REGa=#REGb.
  $F3FB,$02 Compare #REGa with #N$12.
  $F3FD,$03 Jump to #R$F29C if #REGa is equal to #N$12.
  $F400,$03 Jump to #R$F06F.
N $F403 Was the player trying to take the sextant?
@ $F403 label=Validate_Take_Sextant
  $F403,$06 Call #R$C37F with #R$E9FB.
  $F409,$02 Jump to #R$F413 if the token isn't for the sextant.
  $F40B,$05 Call #R$F26A with #ITEM$16.
  $F410,$03 Jump to #R$F29C.
N $F413 Was the player trying to take the crowbar?
@ $F413 label=Validate_Take_Crowbar
  $F413,$06 Call #R$C37F with #R$E9FD.
  $F419,$02 Jump to #R$F423 if the token isn't for the crowbar.
  $F41B,$05 Call #R$F26A with #ITEM$1E.
  $F420,$03 Jump to #R$F29C.
N $F423 Was the player trying to take the key?
@ $F423 label=Validate_Take_Key
  $F423,$06 Call #R$C37F with #R$E9FF.
  $F429,$02 Jump to #R$F433 if the token isn't for the key.
  $F42B,$05 Call #R$F26A with #ITEM$1F.
  $F430,$03 Jump to #R$F29C.
N $F433 Was the player trying to take the skull?
@ $F433 label=Validate_Take_Skull
  $F433,$06 Call #R$C37F with #R$EA01.
  $F439,$02 Jump to #R$F443 if the token isn't for the skull.
  $F43B,$05 Call #R$F26A with #ITEM$20.
  $F440,$03 Jump to #R$F29C.
N $F443 Was the player trying to take the spear?
@ $F443 label=Validate_Take_Spear
  $F443,$06 Call #R$C37F with #R$EA06.
  $F449,$02 Jump to #R$F45D if the token isn't for the spear.
  $F44B,$06 Call #R$C401 with #R$E8A0.
  $F451,$03 Call #R$F26A.
  $F454,$01 #REGa=#REGb.
  $F455,$02 Compare #REGa with #N$1A.
  $F457,$03 Jump to #R$F29C if #REGa is equal to #N$1A.
  $F45A,$03 Jump to #R$F06F.
N $F45D Was the player trying to take the parrot?
@ $F45D label=Validate_Take_Parrot
  $F45D,$06 Call #R$C37F with #R$EA08.
  $F463,$02 Jump to #R$F47E if the token isn't for the parrot.
  $F465,$06 Call #R$C401 with #R$E8BC.
  $F46B,$03 Call #R$F26A.
  $F46E,$01 #REGa=#REGb.
  $F46F,$02 Compare #REGa with #N$28.
  $F471,$03 Jump to #R$F29C if #REGa is equal to #N$28.
N $F474 Bad luck!
  $F474,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $F478 Print "#STR$DBCC,$08($b==$FF)".
  $F478,$03 #REGhl=#R$DBCC.
  $F47B,$03 Jump to #R$F03A.
N $F47E Nothing else is valid.
@ $F47E label=Take_Invalid
  $F47E,$03 Jump to #R$F06F.

c $F481 Action: Get
@ $F481 label=Action_Get
  $F481,$03 Call #R$C47B.
  $F484,$01 Return if the direct object is malformed.
N $F485 Confirm if the player intended to "GET INTO BOAT" (or similar).
  $F485,$06 Call #R$C37F with #R$EA0D.
  $F48B,$02 Jump to #R$F4AC if the token isn't for getting into the boat.
N $F48D The player has typed any variation of wanting to get into the boat.
@ $F48D label=Validate_GetIntoBoat
  $F48D,$07 Jump to #R$F498 if the *#R$BCCB is room #N$04: "#ROOM$04". So the
. player is already in the boat.
  $F494,$04 Jump to #R$F49E if the *#R$BCCB is not room #N$6B: "#ROOM$6B" (a
. room variation, but the player being in the boat).
N $F498 The player is definitely already in the boat, so tell them this.
N $F498 Print "#STR$DC21,$08($b==$FF)".
@ $F498 label=AlreadyInTheBoat
  $F498,$03 #REGhl=#R$DC21.
  $F49B,$03 Jump to #R$F03A.
N $F49E The player can only get into the boat from room #N$03: "#ROOM$03".
@ $F49E label=Action_GetIntoBoat
  $F49E,$04 Jump to #R$F4A6 if the *#R$BCCB is not room #N$03: "#ROOM$03"
  $F4A2,$04 Jump to #R$F4A8 using room #N$04: #ROOM$04 as the destination.
@ $F4A6 label=WhereIsTheBoat
  $F4A6,$02 Load room #N$6B: #ROOM$6B into #REGa.
@ $F4A8 label=SetBoatDestination
  $F4A8,$03 Call #R$EF54 to set the room destination from #REGa.
  $F4AB,$01 Return.
N $F4AC Confirm if the player intended to "GET OUT OF BOAT" (or similar).
@ $F4AC label=GetOutOfBoat_Check
  $F4AC,$06 Call #R$C37F with #R$EA1D.
  $F4B2,$02 Jump to #R$F4D1 if the token isn't for the getting out of the boat.
@ $F4B4 label=IsPlayerInRowingBoat_1
  $F4B4,$07 Jump to #R$F4C1 if the *#R$BCCB is not room #N$04: "#ROOM$04".
  $F4BB,$05 Call #R$EF54 to room #N$03: #ROOM$03.
  $F4C0,$01 Return.
N $F4C1 Also check the room variation, as the player is in the boat in both.
@ $F4C1 label=IsPlayerInRowingBoat_2
  $F4C1,$04 Jump to #R$F4CB if the *#R$BCCB is not room #N$6B: "#ROOM$6B".
  $F4C5,$05 Call #R$EF54 to room #N$06: #ROOM$06.
  $F4CA,$01 Return.
N $F4CB Print "#STR$DC37,$08($b==$FF)".
@ $F4CB label=NotInTheBoat
  $F4CB,$03 #REGhl=#R$DC37.
  $F4CE,$03 Jump to #R$F03A.
N $F4D1 Pivot to "TAKE" as a synonym.
@ $F4D1 label=Synonym_Take
  $F4D1,$03 Jump to #R$F263.

c $F4D4 Action: Drop/ Throw
@ $F4D4 label=Action_DropThrow
  $F4D4,$03 Call #R$C47B.
  $F4D7,$01 Return if the direct object is malformed.
N $F4D8 Start by calling the chain of items to check...
  $F4D8,$02 Jump to #R$F50B.
N $F4DA Check if the player is holding the requested item?
@ $F4DA label=DropThrow_IsPlayerHoldingItem
  $F4DA,$03 Call #R$C3E4.
  $F4DD,$02 Jump to #R$F4FC if the player is holding the requested item.
N $F4DF Print "#STR$BFAF,$08($b==$FF)".
  $F4DF,$03 #REGhl=#R$BFAF.
  $F4E2,$03 Call #R$BAA4.
  $F4E5,$01 #REGa=#REGe.
  $F4E6,$03 #REGhl=#R$F29B.
  $F4E9,$03 #REGbc=#N($0001,$04,$04).
  $F4EC,$02 CPIR.
  $F4EE,$02 Jump to #R$F4F6 if #REGa is equal to #N$06.
N $F4F0 Print "#STR$BF2B,$08($b==$FF)".
  $F4F0,$03 #REGhl=#R$BF2B.
  $F4F3,$03 Jump to #R$F03A.
@ $F4F6 label=NotCarryingItem_Plural
N $F4F6 Print "#STR$BF2F,$08($b==$FF)".
  $F4F6,$03 #REGhl=#R$BF2F.
  $F4F9,$03 Jump to #R$F03A.
N $F4FC The player has the item in their inventory so drop/ throw it.
@ $F4FC label=DropItem
  $F4FC,$01 Copy the item ID into #REGb.
  $F4FD,$04 #REGc=*#R$BCCB.
N $F501 Alter the items location from the players inventory to the current room
. ID.
  $F501,$03 Call #R$C412.
  $F504,$04 Decrease *#R$BC98 by one.
  $F508,$03 Jump to #R$F06A.
N $F50B Was the player trying to drop or throw the bottle of rum?
@ $F50B label=Validate_DropThrow_BottleRum
  $F50B,$06 Call #R$C37F with #R$E9E7.
  $F511,$02 Jump to #R$F51C if the token isn't for the bottle of rum.
N $F513 The player is trying to drop or throw the bottle of rum.
  $F513,$06 Call #R$C401 with #R$E87A.
  $F519,$03 Jump to #R$F4DA.
N $F51C Was the player trying to drop or throw the fish?
@ $F51C label=Validate_DropThrow_Fish
  $F51C,$06 Call #R$C37F with #R$E9CC.
  $F522,$02 Jump to #R$F52D if the token isn't for the fish.
N $F524 The player is trying to drop or throw the fish.
  $F524,$06 Call #R$C401 with #R$E895.
  $F52A,$03 Jump to #R$F4DA.
N $F52D Was the player trying to drop or throw the watch?
@ $F52D label=Validate_DropThrow_Watch
  $F52D,$06 Call #R$C37F with #R$E9D1.
  $F533,$02 Jump to #R$F53A if the token isn't for the watch.
N $F535 The player is trying to drop or throw the watch.
  $F535,$05 Jump to #R$F4DA with item #N$17: #ITEM$17.
N $F53A Was the player trying to drop or throw the shoe?
@ $F53A label=Validate_DropThrow_Shoe
  $F53A,$06 Call #R$C37F with #R$E9D3.
  $F540,$02 Jump to #R$F547 if the token isn't for the shoe.
N $F542 The player is trying to drop or throw the shoe.
  $F542,$05 Jump to #R$F4DA with item #N$15: #ITEM$15.
N $F547 Was the player trying to drop or throw the rod?
@ $F547 label=Validate_DropThrow_Rod
  $F547,$06 Call #R$C37F with #R$E9D5.
  $F54D,$02 Jump to #R$F554 if the token isn't for the rod.
N $F54F The player is trying to drop or throw the rod.
  $F54F,$05 Jump to #R$F4DA with item #N$08: #ITEM$08.
N $F554 Was the player trying to drop or throw the fruit?
@ $F554 label=Validate_DropThrow_Fruit
  $F554,$06 Call #R$C37F with #R$E9D7.
  $F55A,$02 Jump to #R$F561 if the token isn't for the fruit.
N $F55C The player is trying to drop or throw the fruit.
  $F55C,$05 Jump to #R$F4DA with item #N$0E: #ITEM$0E.
N $F561 Was the player trying to drop or throw the jewels?
@ $F561 label=Validate_DropThrow_Jewels
  $F561,$06 Call #R$C37F with #R$E9DB.
  $F567,$02 Jump to #R$F56E if the token isn't for the jewels.
N $F569 The player is trying to drop or throw the jewels.
  $F569,$05 Jump to #R$F4DA with item #N$1D: #ITEM$1D.
N $F56E Was the player trying to drop or throw the match?
@ $F56E label=Validate_DropThrow_Match
  $F56E,$06 Call #R$C37F with #R$E9E1.
  $F574,$02 Jump to #R$F57F if the token isn't for the match.
  $F576,$06 Call #R$C401 with #R$E86E.
  $F57C,$03 Jump to #R$F4DA.
N $F57F Was the player trying to drop or throw the plank?
@ $F57F label=Validate_DropThrow_Plank
  $F57F,$06 Call #R$C37F with #R$E9E3.
  $F585,$02 Jump to #R$F58C if the token isn't for the plank.
  $F587,$05 Jump to #R$F4DA with item #N$04: #ITEM$04.
N $F58C Was the player trying to drop or throw the coconut?
@ $F58C label=Validate_DropThrow_Coconut
  $F58C,$06 Call #R$C37F with #R$E9E5.
  $F592,$02 Jump to #R$F599 if the token isn't for the coconut.
  $F594,$05 Jump to #R$F4DA with item #N$07: #ITEM$07.
N $F599 Was the player trying to drop or throw the gun?
@ $F599 label=Validate_DropThrow_Gun
  $F599,$06 Call #R$C37F with #R$E9EF.
  $F59F,$02 Jump to #R$F5A6 if the token isn't for the gun.
  $F5A1,$05 Jump to #R$F4DA with item #N$0F: #ITEM$0F.
N $F5A6 Was the player trying to drop or throw the eyepatch?
@ $F5A6 label=Validate_DropThrow_Eyepatch
  $F5A6,$06 Call #R$C37F with #R$E9F1.
  $F5AC,$02 Jump to #R$F5C4 if the token isn't for the eyepatch.
  $F5AE,$06 Call #R$C401 with #R$E885.
  $F5B4,$05 Jump to #R$F4DA if #REGa is not equal to #N$11.
  $F5B9,$06 Call #R$C426 to transform item #N$11 (#ITEM$11) into item #N$10
. (#ITEM$10).
  $F5BF,$05 Jump to #R$F4DA with item #N$10: #ITEM$10.
N $F5C4 Was the player trying to drop or throw the keg of gunpowder?
@ $F5C4 label=Validate_DropThrow_KegGunpowder
  $F5C4,$06 Call #R$C37F with #R$E9F3.
  $F5CA,$02 Jump to #R$F5D1 if the token isn't for the keg of gunpowder.
  $F5CC,$05 Jump to #R$F4DA with item #N$12: #ITEM$12.
N $F5D1 Was the player trying to drop or throw the sextant?
@ $F5D1 label=Validate_DropThrow_Sextant
  $F5D1,$06 Call #R$C37F with #R$E9FB.
  $F5D7,$02 Jump to #R$F5DE if the token isn't for the sextant.
  $F5D9,$05 Jump to #R$F4DA with item #N$16: #ITEM$16.
N $F5DE Was the player trying to drop or throw the crowbar?
@ $F5DE label=Validate_DropThrow_Crowbar
  $F5DE,$06 Call #R$C37F with #R$E9FD.
  $F5E4,$02 Jump to #R$F5EB if the token isn't for the crowbar.
  $F5E6,$05 Jump to #R$F4DA with item #N$1E: #ITEM$1E.
N $F5EB Was the player trying to drop or throw the key?
@ $F5EB label=Validate_DropThrow_Key
  $F5EB,$06 Call #R$C37F with #R$E9FF.
  $F5F1,$02 Jump to #R$F5F8 if the token isn't for the key.
  $F5F3,$05 Jump to #R$F4DA with item #N$1F: #ITEM$1F.
N $F5F8 Was the player trying to drop or throw the skull?
@ $F5F8 label=Validate_DropThrow_Skull
  $F5F8,$06 Call #R$C37F with #R$EA01.
  $F5FE,$02 Jump to #R$F605 if the token isn't for the skull.
  $F600,$05 Jump to #R$F4DA with item #N$20: #ITEM$20.
N $F605 Was the player trying to drop or throw the spear?
@ $F605 label=Validate_DropThrow_Spear
  $F605,$06 Call #R$C37F with #R$EA06.
  $F60B,$02 Jump to #R$F612 if the token isn't for the spear.
  $F60D,$05 Jump to #R$F4DA with item #N$1A: #ITEM$1A.
N $F612 Was the player trying to drop or throw the parrot?
@ $F612 label=Validate_DropThrow_Parrot
  $F612,$06 Call #R$C37F with #R$EA08.
  $F618,$02 Jump to #R$F61F if the token isn't for the parrot.
  $F61A,$05 Jump to #R$F4DA with item #N$28: #ITEM$28.
N $F61F Was the player trying to drop or throw the plank across the pit?
@ $F61F label=Validate_DropThrow_PlankAcrossPit
  $F61F,$06 Call #R$C37F with #R$EA26.
  $F625,$03 Jump to #R$F074 if the token is for dropping/ throwing the plank
. across the pit.
  $F628,$08 Jump to #R$F633 if *#R$BD66 is equal to #N$3E.
  $F630,$03 Jump to #R$F06F.

  $F633,$02 Jump to #R$F646.

  $F635,$03 Call #R$C3E4.
  $F638,$01 Return if #REGa is not equal to #N$3E.
  $F639,$01 #REGb=#REGe.
  $F63A,$04 #REGc=*#R$BCCB.
  $F63E,$03 Call #R$C412.
  $F641,$03 #REGhl=#R$BC98.
  $F644,$01 Decrease *#REGhl by one.
  $F645,$01 Return.

  $F646,$06 Call #R$C37F with #R$EA2A.
  $F64C,$02 Jump to #R$F659 if the token isn't for dropping/ throwing the spear
. at the lion.
  $F64E,$02 #REGa=#N$1A.
  $F650,$03 Call #R$F635.
N $F653 Print "#STR$DC4F,$08($b==$FF)".
  $F653,$03 #REGhl=#R$DC4F.
  $F656,$03 Jump to #R$F03A.
  $F659,$06 Call #R$C37F with #R$EA2E.
  $F65F,$02 Jump to #R$F66C if the token isn't for dropping/ throwing the
. coconut at the lion.
  $F661,$02 #REGa=#N$07.
  $F663,$03 Call #R$F635.
N $F666 Print "#STR$DC82,$08($b==$FF)".
  $F666,$03 #REGhl=#R$DC82.
  $F669,$03 Jump to #R$F03A.

  $F66C,$06 Call #R$C37F with #R$EA32.
  $F672,$02 Jump to #R$F67F if the token isn't for dropping/ throwing the fruit
. at the lion.
  $F674,$02 #REGa=#N$0E.
  $F676,$03 Call #R$F635.
N $F679 Print "#STR$DCED,$08($b==$FF)".
  $F679,$03 #REGhl=#R$DCED.
  $F67C,$03 Jump to #R$F03A.

  $F67F,$06 Call #R$C37F with #R$EA36.
  $F685,$02 Jump to #R$F6A4 if the token isn't for the .
  $F687,$06 Call #R$C401 with #R$E895.
  $F68D,$03 Call #R$F635.
  $F690,$01 #REGa=#REGe.
  $F691,$03 Call #R$C3EA.
  $F694,$02 #REGa=#N$2A (event ID: #N($2A&$7F)).
  $F696,$03 Call #R$C3EA.
  $F699,$05 Write #N$3C to *#R$EC3F.
N $F69E Print "#STR$DD1B,$08($b==$FF)".
  $F69E,$03 #REGhl=#R$DD1B.
  $F6A1,$03 Jump to #R$F03A.

  $F6A4,$06 Call #R$C37F with #R$EA3F.
  $F6AA,$02 Jump to #R$F6C2 if the token isn't for the .
  $F6AC,$02 Load #ITEM$0E into #REGa.
  $F6AE,$03 Call #R$F635.
  $F6B1,$03 Call #R$C426 to transform item #N$27 (#ITEM$27) into item #N$28
. (#ITEM$28).
  $F6B7,$05 Call #R$C3EA with #ITEM$0E (as the parrot ate it).
N $F6BC Print "#STR$DD6C,$08($b==$FF)".
  $F6BC,$03 #REGhl=#R$DD6C.
  $F6BF,$03 Jump to #R$F03A.

  $F6C2,$06 Call #R$C37F with #R$EA43.
  $F6C8,$02 Jump to #R$F6FD if the token isn't for the .
  $F6CA,$05 Call #R$C35F with #ITEM$17.
  $F6CF,$03 Jump to #R$F079 #ITEM$17 isn't in the current room.
  $F6D2,$02 Load #ITEM$17 into #REGa.
  $F6D4,$03 Call #R$F635.
  $F6D7,$06 Call #R$C426 to transform item #N$18 (#ITEM$18) into item #N$19
. (#ITEM$19).
  $F6DD,$06 Call #R$C426 to transform item #N$17 (#ITEM$17) into item #N$1A
. (#ITEM$1A).
  $F6E3,$05 Write #N$1D to *#R$EBCD to open up westbound access to #ROOM$1D
. from #ROOM$1F.
  $F6E8,$05 Write #N$20 to *#R$EBCB to open up southbound access to #ROOM$20
. from #ROOM$1F.
  $F6ED,$05 Write #N$21 to *#R$EBCC to open up eastbound access to #ROOM$21
. from #ROOM$1F.
  $F6F2,$05 Write #N$23 to *#R$EBCA to open up northbound access to #ROOM$23
. from #ROOM$1F.
N $F6F7 Print "#STR$DDDD,$08($b==$FF)".
  $F6F7,$03 #REGhl=#R$DDDD.
  $F6FA,$03 Jump to #R$F03A.

  $F6FD,$06 Call #R$C37F with #R$EA47.
  $F703,$02 Jump to #R$F729 if the token isn't for the .
  $F705,$05 Call #R$F635 using #ITEM$1A.
  $F70A,$05 Call #R$C3EA with #ITEM$2B.
  $F70F,$05 Call #R$C3EA with #ITEM$1A.
  $F714,$05 Write #N$40 to *#R$EC8A to open up northbound access to #ROOM$40
. from #ROOM$3F.
  $F719,$05 Write #N$41 to *#R$EC8B to open up southbound access to #ROOM$41
. from #ROOM$3F.
  $F71E,$05 Write #N$42 to *#R$EC8C to open up eastbound access to #ROOM$42
. from #ROOM$3F.
N $F723 Print "#STR$DE81,$08($b==$FF)".
  $F723,$03 #REGhl=#R$DE81.

  $F726,$03 Jump to #R$F03A.
  $F729,$06 Call #R$C37F with #R$EA50.
  $F72F,$02 Jump to #R$F74F if the token isn't for the .
  $F731,$05 Call #R$C35F with #ITEM$12.
  $F736,$03 Jump to #R$F079 if #ITEM$12 isn't in the current room.
  $F739,$02 #REGa=#N$12.
  $F73B,$03 Call #R$F635.
  $F73E,$02 #REGa=#N$12 (event ID: #N($12&$7F)).
  $F740,$03 Call #R$C3EA.
  $F743,$06 Call #R$C426 to transform item #N$13 (#ITEM$13) into item #N$14
. (#ITEM$14).
N $F749 Print "#STR$DF15,$08($b==$FF)".
  $F749,$03 #REGhl=#R$DF15.
  $F74C,$03 Jump to #R$F03A.

  $F74F,$06 Call #R$C37F with #R$EA5E.
  $F755,$02 Jump to #R$F78D if the token isn't for the .
  $F757,$05 Call #R$C3E4 with item #N$12: #ITEM$12.
  $F75C,$03 Jump to #R$F06F if *#REGhl is equal to #N$12.
  $F75F,$06 Call #R$C401 with #R$E86E.
  $F765,$03 Call #R$F635.
  $F768,$05 Call #R$C35F with #ITEM$12.
  $F76D,$03 Jump to #R$F06A if #ITEM$12 is present in the current room.
  $F770,$05 Call #R$C35F with #ITEM$02.
  $F775,$03 Jump to #R$F06A if #ITEM$02 is present in the current room.
  $F778,$05 Call #R$C3EA with #ITEM$03.
  $F77D,$05 Call #R$C3EA with #ITEM$14.
  $F782,$05 Write #N$4E to *#R$ECBC to open up eastbound access to #ROOM$4E
. from #ROOM$47.
N $F787 Print "#STR$DF8E,$08($b==$FF)".
  $F787,$03 #REGhl=#R$DF8E.
  $F78A,$03 Jump to #R$F03A.

  $F78D,$06 Call #R$C37F with #R$EA6C.
  $F793,$02 Jump to #R$F7A8 if the token isn't for the .
  $F795,$06 Call #R$C401 with #R$E86E.
  $F79B,$03 Call #R$F635.
  $F79E,$05 Call #R$C35F with #ITEM$14.
  $F7A3,$02 Jump to #R$F770 if #ITEM$14 is present in the current room.
  $F7A5,$03 Jump to #R$F06A.
  $F7A8,$03 Jump to #R$F065.

c $F7AB Action: Lay/ Place/ Put
@ $F7AB label=Action_LayPlacePut
  $F7AB,$03 Call #R$C49F.
  $F7AE,$01 Return if the direct object is malformed.
N $F7AF Was the player trying to lay/ place/ put fruit at the lion?
  $F7AF,$06 Call #R$C37F with #R$EA32.
  $F7B5,$03 Jump to #R$F674 if so, and pivot to "THROW" as a synonym.
N $F7B8 Was the player trying to lay/ place/ put the fish at the lion?
  $F7B8,$06 Call #R$C37F with #R$EA36.
  $F7BE,$03 Jump to #R$F687 if so, and pivot to "THROW" as a synonym.
N $F7C1 Was the player trying to lay/ place/ put the fruit at the parrot?
  $F7C1,$06 Call #R$C37F with #R$EA3F.
  $F7C7,$03 Jump to #R$F6AC if so, and pivot to "THROW" as a synonym.
N $F7CA Was the player trying to lay/ place/ put the watch at the cannibals.
  $F7CA,$06 Call #R$C37F with #R$EA43.
  $F7D0,$03 Jump to #R$F6CA if so, and pivot to "THROW" as a synonym.
N $F7D3 Nothing else is valid.
  $F7D3,$03 Jump to #R$F065.

c $F7D6 Action: ???
@ $F7D6 label=Action_???
  $F7D6,$03 Call #R$C49F.
  $F7D9,$01 Return if the direct object is malformed.
  $F7DA,$06 Call #R$C37F with #R$EA26.
  $F7E0,$02 Jump to #R$F813 if the token isn't for the .
  $F7E2,$05 Call #R$C35F with #ITEM$04.
  $F7E7,$03 Jump to #R$F079 if #ITEM$04 isn't in the current room.
  $F7EA,$02 #REGa=#N$04.
  $F7EC,$03 Call #R$F635.
  $F7EF,$02 #REGa=#N$04 (event ID: #N($04&$7F)).
  $F7F1,$03 Call #R$C3EA.
  $F7F4,$06 Call #R$C412 using item #ITEM$05 to create it in #ROOM$66.
  $F7FA,$06 Call #R$C412 using item #ITEM$06 to create it in #ROOM$68.
  $F800,$05 Write #N$68 to *#R$ED75.
  $F805,$05 Write #N$66 to *#R$ED80.
  $F80A,$03 Call #R$F06A.
N $F80D Print "#STR$E00C,$08($b==$FF)".
  $F80D,$03 #REGhl=#R$E00C.
  $F810,$03 Jump to #R$F03A.

  $F813,$06 Call #R$C37F with #R$EA70.
  $F819,$02 Jump to #R$F84E if the token isn't for the .
  $F81B,$05 Call #R$C35F with #ITEM$08.
  $F820,$03 Jump to #R$F079 if #ITEM$08 isn't in the current room.
  $F823,$05 Call #R$F635 with #ITEM$08.
  $F828,$05 Call #R$C3EA with #ITEM$08.
  $F82D,$06 Call #R$C426 to transform item #N$09 (#ITEM$09) into item #N$0A
. (#ITEM$0A).
  $F833,$06 Call #R$C426 to transform item #N$32 (#ITEM$32) into item #N$31
. (#ITEM$31).
  $F839,$05 Call #R$C3EA with #ITEM$33.
  $F83E,$05 Write #N$6A to *#R$EB90 to open up eastbound access to #ROOM$6A
. from #ROOM$15.
  $F843,$05 Write #N$15 to *#R$ED8D to open up southbound access to #ROOM$15
. from #ROOM$6A.
N $F848 Print "#STR$E029,$08($b==$FF)".
  $F848,$03 #REGhl=#R$E029.
  $F84B,$03 Jump to #R$F03A.
  $F84E,$03 Jump to #R$F06F.

c $F851 Action: Kill
@ $F851 label=Action_Kill
  $F851,$03 Call #R$C49F.
  $F854,$01 Return if the direct object is malformed.
N $F855 Was the player trying to kill ... the octopus with the spear?
  $F855,$06 Call #R$C37F with #R$EA8D.
  $F85B,$02 Jump to #R$F888 if the token isn't for the .
  $F85D,$05 Call #R$C3E4 with item #N$1A: #ITEM$1A.
  $F862,$03 Jump to #R$F07E if *#REGhl is not equal to #N$1A.
  $F865,$05 Call #R$C3EA with #ITEM$1A.
  $F86A,$05 Call #R$C3EA with #ITEM$2B.
  $F86F,$03 #REGhl=#R$BC98.
  $F872,$01 Decrease *#REGhl by one.
  $F873,$05 Write #N$40 to *#R$EC8A to open up northbound access to #ROOM$40
. from #ROOM$3F.
  $F878,$05 Write #N$41 to *#R$EC8B to open up southbound access to #ROOM$41
. from #ROOM$3F.
  $F87D,$05 Write #N$42 to *#R$EC8C to open up eastbound access to #ROOM$42
. from #ROOM$3F.
N $F882 Print "#STR$DE81,$08($b==$FF)".
  $F882,$03 #REGhl=#R$DE81.
  $F885,$03 Jump to #R$F03A.

  $F888,$06 Call #R$C37F with #R$EA96.
  $F88E,$02 Jump to #R$F89E if the token isn't for the .
  $F890,$05 Call #R$C3E4 with item #N$1A: #ITEM$1A.
  $F895,$03 Jump to #R$F07E if *#REGhl is not equal to #N$1A.
N $F898 Print "#STR$E07F,$08($b==$FF)".
  $F898,$03 #REGhl=#R$E07F.
  $F89B,$03 Jump to #R$F03A.

  $F89E,$06 Call #R$C37F with #R$EA9A.
  $F8A4,$02 Jump to #R$F8B8 if the token isn't for the .
  $F8A6,$05 Call #R$C3E4 with item #N$1A: #ITEM$1A.
  $F8AB,$03 Jump to #R$F07E if *#REGhl is not equal to #N$1A.
N $F8AE Bad luck!
  $F8AE,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $F8B2 Print "#STR$E0B4,$08($b==$FF)".
  $F8B2,$03 #REGhl=#R$E0B4.
  $F8B5,$03 Jump to #R$F03A.

  $F8B8,$06 Call #R$C37F with #R$EA9E.
  $F8BE,$02 Jump to #R$F90A if the token isn't for the .
  $F8C0,$05 Call #R$C3E4 with item #N$0F: #ITEM$0F.
  $F8C5,$03 Jump to #R$F07E if ?? is not equal to #N$0F.
  $F8C8,$06 Call #R$C401 with #R$E8B2.
  $F8CE,$01 #REGb=#REGa.
  $F8CF,$02 Test bit 7 of #REGa.
  $F8D1,$02 Jump to #R$F8D9 if ?? is not equal to #N$0F.
N $F8D3 Print "#STR$E138,$08($b==$FF)".
  $F8D3,$03 #REGhl=#R$E138.
  $F8D6,$03 Jump to #R$F03A.

c $F8D9 Action: Shooting
@ $F8D9 label=Action_Shooting
  $F8D9,$01 Stash #REGbc on the stack.
N $F8DA Print "#STR$E0EB,$08($b==$FF)".
  $F8DA,$03 #REGhl=#R$E0EB.
  $F8DD,$03 Call #R$BAB1.
  $F8E0,$02 #REGa=#N$05.
  $F8E2,$03 Call #R$C582.
  $F8E5,$01 Restore #REGbc from the stack.
  $F8E6,$02 Jump to #R$F8EE if the random generator returns a non-zero response.
N $F8E8 Print "#STR$E122,$08($b==$FF)".
  $F8E8,$03 #REGhl=#R$E122.
  $F8EB,$03 Jump to #R$F03E.
@ $F8EE label=Action_Shooting_Success
  $F8EE,$01 #REGa=#REGb.
  $F8EF,$02 #REGa-=#N$03.
  $F8F1,$02 Reset bit 7 of #REGa.
  $F8F3,$01 #REGe=#REGa.
  $F8F4,$02 #REGd=#N$00.
  $F8F6,$03 #REGhl=#R$F904.
  $F8F9,$01 #REGhl+=#REGde.
  $F8FA,$01 #REGc=*#REGhl.
  $F8FB,$03 Call #R$C426.
N $F8FE Print "#STR$E0FF,$08($b==$FF)".
  $F8FE,$03 #REGhl=#R$E0FF.
  $F901,$03 Jump to #R$F03E.
B $F904,$06
  $F90A,$06 Call #R$C37F with #R$EAA2.
  $F910,$02 Jump to #R$F918 if the token isn't for the .
N $F912 Print "#STR$E14B,$08($b==$FF)".
  $F912,$03 #REGhl=#R$E14B.
  $F915,$03 Jump to #R$F03A.
  $F918,$03 Jump to #R$F06F.

  $F91B,$03 Call #R$C47B.
  $F91E,$01 Return if the direct object is malformed.
  $F91F,$05 Call #R$C3E4 with item: #ITEM$0F.
  $F924,$02 Jump to #R$F92C if the player has the gun in their inventory.
N $F926 Print "#STR$E15E,$08($b==$FF)".
  $F926,$03 #REGhl=#R$E15E.
  $F929,$03 Jump to #R$F03A.
@ $F92C label=PlayerHasGun
  $F92C,$06 Call #R$C37F with #R$EAA6.
  $F932,$03 Jump to #R$F8C8 if the token is for the .
  $F935,$06 Call #R$C37F with #R$EAAC.
  $F93B,$02 Jump to #R$F943 if the token isn't for the .
N $F93D Print "#STR$E14B,$08($b==$FF)".
  $F93D,$03 #REGhl=#R$E14B.
  $F940,$03 Jump to #R$F03A.
N $F943 Nothing else is valid.
@ $F943 label=Shooting_Invalid
  $F943,$03 Jump to #R$F097.

c $F946 Action: Climb
@ $F946 label=Action_Climb
  $F946,$03 Call #R$C47B.
  $F949,$01 Return if the direct object is malformed.
  $F94A,$06 Call #R$C37F with #R$EAB2.
  $F950,$02 Jump to #R$F960 if the token isn't for the .
  $F952,$08 Jump to #R$F06F if *#R$BCCB is not room #N$04: "#ROOM$04".
  $F95A,$05 Call #R$EF54 to room #N$03: #ROOM$03.
  $F95F,$01 Return.

  $F960,$06 Call #R$C37F with #R$EAB5.
  $F966,$02 Jump to #R$F976 if the token isn't for the .
  $F968,$08 Jump to #R$F06F if *#R$BCCB is not room #N$03: "#ROOM$03".
  $F970,$05 Call #R$EF54 to room #N$04: #ROOM$04.
  $F975,$01 Return.

  $F976,$06 Call #R$C37F with #R$EABC.
  $F97C,$02 Jump to #R$F984 if the token isn't for the .
N $F97E Print "#STR$BED1,$08($b==$FF)".
  $F97E,$03 #REGhl=#R$BED1.
  $F981,$03 Jump to #R$F03A.

  $F984,$06 Call #R$C37F with #R$EA0D.
  $F98A,$03 Jump to #R$F48D if the token is for the .
  $F98D,$06 Call #R$C37F with #R$EA1D.
  $F993,$03 Jump to #R$F4B4 if the token is for the .
  $F996,$03 Jump to #R$F06F.

c $F999 Action: Eat
@ $F999 label=Action_Eat
  $F999,$03 Call #R$C47B.
  $F99C,$01 Return if the direct object is malformed.
  $F99D,$06 Call #R$C37F with #R$E9CC.
  $F9A3,$02 Jump to #R$F9C1 if the token isn't for the .
  $F9A5,$06 Call #R$C401 with #R$E895.
  $F9AB,$01 #REGb=#REGa.
  $F9AC,$01 Stash #REGbc on the stack.
  $F9AD,$03 Call #R$C3E4.
  $F9B0,$02 Jump to #R$F9B6 if #REGa is not equal to #N$04.
  $F9B2,$03 #REGhl=#R$BC98.
  $F9B5,$01 Decrease *#REGhl by one.
  $F9B6,$01 Restore #REGbc from the stack.
  $F9B7,$01 #REGa=#REGb.
  $F9B8,$03 Call #R$C3EA.
N $F9BB Print "#STR$E175,$08($b==$FF)".
  $F9BB,$03 #REGhl=#R$E175.
  $F9BE,$03 Jump to #R$F03A.
  $F9C1,$06 Call #R$C37F with #R$E9D7.
  $F9C7,$02 Jump to #R$F9D3 if the token isn't for the .
N $F9C9 Bad luck!
  $F9C9,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $F9CD Print "#STR$E19B,$08($b==$FF)".
  $F9CD,$03 #REGhl=#R$E19B.
  $F9D0,$03 Jump to #R$F03A.

  $F9D3,$06 Call #R$C37F with #R$E9E5.
  $F9D9,$02 Jump to #R$F9E1 if the token isn't for the .
N $F9DB Print "#STR$E208,$08($b==$FF)".
  $F9DB,$03 #REGhl=#R$E208.
  $F9DE,$03 Jump to #R$F03A.
  $F9E1,$03 Jump to #R$F083.

c $F9E4 Action: Drink
@ $F9E4 label=Action_Drink
  $F9E4,$03 Call #R$C47B.
  $F9E7,$01 Return if the direct object is malformed.
N $F9E8 Was the player trying to drink the rum?
  $F9E8,$06 Call #R$C37F with #R$EAB8.
  $F9EE,$02 Jump to #R$FA14 if the token isn't for the rum.
N $F9F0 The player was trying to drink the rum.
  $F9F0,$06 Call #R$C401 with #R$E87A.
  $F9F6,$01 Load the bottle into #REGb as the source item.
  $F9F7,$02 Load item #N$0D: #ITEM$0D into #REGc as the destination item.
  $F9F9,$01 Stash the source/ destination items on the stack briefly.
N $F9FA Is the player either carrying the bottle of rum, or is it in the
. current room?
  $F9FA,$03 Call #R$C3E4.
  $F9FD,$01 Restore the source/ destination items from the stack.
  $F9FE,$03 Jump to #R$F07E if the bottle of rum is not in the room or the
. players inventory.
N $FA01 Change the bottle state!
  $FA01,$03 Call #R$C426.
  $FA04,$05 Set bit 2 of *#R$BC66 which relates to the player being drunk.
N $FA09 Set a turn counter, which means the player should keep away from
. particularly high places.
  $FA09,$05 Write #N$06 turns to *#R$BC69.
N $FA0E Print "#STR$E238,$08($b==$FF)".
  $FA0E,$03 #REGhl=#R$E238.
  $FA11,$03 Jump to #R$F03A.
N $FA14 Handle drinking water.
@ $FA14 label=Handler_DrinkWater
  $FA14,$06 Call #R$C37F with #R$EABA.
  $FA1A,$02 Jump to #R$FA39 if the token isn't for drinking the water.
N $FA1C The player wants to drink water but determine what type of water...
  $FA1C,$03 Load #REGa with *#R$BCCB.
  $FA1F,$03 Set #REGhl to point to #R$FA35.
  $FA22,$03 Set a counter in #REGbc of #N($0004,$04,$04) which is the number of
. rooms in the table.
  $FA25,$02 Search for the current room in the "rooms with water" table.
  $FA27,$02 Jump to #R$FA2F if the current room contains fresh water.
N $FA29 Else it must be salt water - so report this.
N $FA29 Print "#STR$E28E,$08($b==$FF)".
  $FA29,$03 #REGhl=#R$E28E.
  $FA2C,$03 Jump to #R$F03A.
@ $FA2F label=Action_DrinkFreshWater
N $FA2F Print "#STR$E2AC,$08($b==$FF)".
  $FA2F,$03 #REGhl=#R$E2AC.
  $FA32,$03 Jump to #R$F03A.
@ $FA35 label=Table_RoomsFreshWater
N $FA35 Any room ID which contains fresh, drinkable water.
B $FA35,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $FA35,$01,$04,$02
@ $FA39 label=Drink_Invalid
N $FA39 Nothing else is valid.
  $FA39,$03 Jump to #R$F06F.

c $FA3C Action: Open
@ $FA3C label=Action_Open
  $FA3C,$03 Call #R$C47B.
  $FA3F,$01 Return if the direct object is malformed.
N $FA40 Was the player trying to open the door?
  $FA40,$06 Call #R$C37F with #R$EABE.
  $FA46,$02 Jump to #R$FA85 if the token isn't for the door.
N $FA48 The player was trying to open the door but which door? Was it the
. "normal" door?
  $FA48,$07 Jump to #R$FA53 if *#R$BCCB is room #N$61: "#ROOM$61".
  $FA4F,$04 Jump to #R$FA85 if *#R$BCCB is not room #N$62: "#ROOM$62".
N $FA53 The player is in either of #ROOM$61 or #ROOM$62, but the door has a few
. "states" it can be in.
@ $FA53 label=Validate_Open_LockedDoor
  $FA53,$06 Call #R$C401 with #R$E8CA.
N $FA59 Is the door locked?
  $FA59,$04 Jump to #R$FA63 if the player is not in the room with the #ITEM$2E.
N $FA5D Print "#STR$E2F1,$08($b==$FF)".
  $FA5D,$03 #REGhl=#R$E2F1.
  $FA60,$03 Jump to #R$F03A.
N $FA63 Is the door just closed?
@ $FA63 label=Validate_Open_ClosedDoor
  $FA63,$04 Jump to #R$FA6C if the player is in the room with the #ITEM$2D.
  $FA67,$05 Jump to #R$F088 if the player is not in the room with the #ITEM$30.
N $FA6C Change the door states!
@ $FA6C label=Open_ClosedDoor
  $FA6C,$06 Call #R$C426 to transform item #N$2D (#ITEM$2D) into item #N$2C
. (#ITEM$2C).
  $FA72,$06 Call #R$C426 to transform item #N$30 (#ITEM$30) into item #N$2F
. (#ITEM$2F).
N $FA78 Now the door is opened, this opens up various routes.
  $FA78,$05 Write #N$62 to *#R$ED57 to open up southbound access to #ROOM$62
. from #ROOM$61.
  $FA7D,$05 Write #N$61 to *#R$ED5C to open up northbound access to #ROOM$61
. from #ROOM$62.
  $FA82,$03 Jump to #R$F06A.
N $FA85 Was the player trying to open the rock door?
@ $FA85 label=Open_RockDoor
  $FA85,$06 Call #R$C37F with #R$EAC0.
  $FA8B,$02 Jump to #R$FAA5 if the token isn't for the rock door.
N $FA8D The player was trying to open the rock door, but is it in the current
. room with them?
  $FA8D,$07 Jump to #R$FAA5 if *#R$BCCB is not room #N$6A: "#ROOM$6A".
N $FA94 Is the rock door already open?
  $FA94,$05 Call #R$C35F with #ITEM$31.
  $FA99,$03 Jump to #R$F088 if #ITEM$31 is present in the current room.
N $FA9C The rock door is here, but ...
N $FA9C Print "#STR$BF00,$08($b==$FF)".
  $FA9C,$03 Call #R$F06F.
N $FA9F Print "#STR$E305,$08($b==$FF)".
  $FA9F,$03 #REGhl=#R$E305.
  $FAA2,$03 Jump to #R$F03A.
N $FAA5 Nothing else is valid.
@ $FAA5 label=Open_Invalid
  $FAA5,$03 Jump to #R$F06F.

c $FAA8 Action: Close/ Shut
@ $FAA8 label=Action_CloseShut
  $FAA8,$03 Call #R$C47B.
  $FAAB,$01 Return if the direct object is malformed.
N $FAAC Was the player trying to close/ shut the door?
  $FAAC,$06 Call #R$C37F with #R$EABE.
  $FAB2,$02 Jump to #R$FAE5 if the token isn't for closing the door.
N $FAB4 The player is trying to close the door but which door? Was it the
. "normal" door?
  $FAB4,$07 Jump to #R$FABF if *#R$BCCB is room #N$61: "#ROOM$61".
  $FABB,$04 Jump to #R$FAE5 if *#R$BCCB is not room #N$62: "#ROOM$62".
N $FABF The player is in either of #ROOM$61 or #ROOM$62, but the door has a few
. "states" it can be in.
@ $FABF label=Validate_CloseShut_Door
  $FABF,$06 Call #R$C401 with #R$E8CA.
N $FAC5 Is the door already closed?
  $FAC5,$0A Jump to #R$F08D if the player is by item #N$2D: #ITEM$2D or item
. #N$30: #ITEM$30.
N $FACF Change the door states!
  $FACF,$06 Call #R$C426 to transform item #N$2C (#ITEM$2C) into item #N$2D
. (#ITEM$2D).
  $FAD5,$06 Call #R$C426 to transform item #N$2F (#ITEM$2F) into item #N$30
. (#ITEM$30).
N $FADB Now the door is shut, this closes off various routes.
  $FADB,$04 Write #N$00 to *#R$ED57 to close off southbound access to #ROOM$62
. from #ROOM$61.
  $FADF,$03 Write #N$00 to *#R$ED5C to close off northbound access to #ROOM$61
. from #ROOM$62.
  $FAE2,$03 Jump to #R$F06A.
N $FAE5 Was the player trying to close/ shut the rock door?
@ $FAE5 label=CloseShut_RockDoor
  $FAE5,$06 Call #R$C37F with #R$EAC0.
  $FAEB,$02 Jump to #R$FB05 if the token isn't for the rock door.
N $FAED The player is trying to close the rock door, but is it in the current
. room with them?
  $FAED,$07 Jump to #R$FB05 if *#R$BCCB is not room #N$6A: "#ROOM$6A".
N $FAF4 Is the rock door already closed?
  $FAF4,$05 Call #R$C35F with #ITEM$32.
  $FAF9,$03 Jump to #R$F08D if #ITEM$32 is present in the current room.
N $FAFC Print "#STR$BF00,$08($b==$FF)".
  $FAFC,$03 Call #R$F06F.
N $FAFF Print "#STR$E305,$08($b==$FF)".
  $FAFF,$03 #REGhl=#R$E305.
  $FB02,$03 Jump to #R$F03A.
N $FB05 Was the player trying to close/ shut the trapdoor?
@ $FB05 label=CloseShut_TrapDoor
  $FB05,$06 Call #R$C37F with #R$EAC5.
  $FB0B,$02 Jump to #R$FB13 if the token isn't for the trapdoor.
N $FB0D Print "#STR$E31A,$08($b==$FF)".
  $FB0D,$03 #REGhl=#R$E31A.
  $FB10,$03 Jump to #R$F03A.
N $FB13 Nothing else is valid.
@ $FB13 label=CloseShut_Invalid
  $FB13,$03 Jump to #R$F06F.

c $FB16 Action: Shout
@ $FB16 label=Action_Shout
  $FB16,$03 Call #R$C3AE.
N $FB19 Print "#STR$BEEA,$08($b==$FF)".
  $FB19,$03 Jump to #R$F074 if any item(s) were referenced in the input.
N $FB1C Was the player trying to shout/ shout loud?
  $FB1C,$06 Call #R$C37F with #R$EAC7.
  $FB22,$02 Jump to #R$FB6E if the token isn't for shouting.
N $FB24 The player was trying to shout, but are they in the room with the
. boulder?
  $FB24,$05 Call #R$C35F with #ITEM$39.
  $FB29,$03 Jump to #R$F06A if #ITEM$39 isn't in the current room.
N $FB2C The player is in the room with the boulder, but is the crab also here?
  $FB2C,$05 Call #R$C35F with #ITEM$29.
  $FB31,$02 Jump to #R$FB43 if the crab is in the current room.
N $FB33 Bad luck!
  $FB33,$04 Switch #R$EDD7 onto the stack so the next return actions a "game
. over".
N $FB37 Print "#STR$E333,$08($b==$FF)".
  $FB37,$03 #REGhl=#R$E333.
  $FB3A,$03 Call #R$BAB1.
N $FB3D Print "#STR$E36A,$08($b==$FF)".
  $FB3D,$03 #REGhl=#R$E36A.
  $FB40,$03 Jump to #R$F03E.
N $FB43 Both the boulder and the crab are in the room.
@ $FB43 label=Shout_Crab
  $FB43,$05 Reset bit 0 of *#R$BC6F which relates to the crab being active.
N $FB48 Make the crab inactive.
  $FB48,$05 Call #R$C3EA with item #N$29: #ITEM$29.
N $FB4D Change the boulder state!
  $FB4D,$06 Call #R$C426 to transform item #N$39 (#ITEM$39) into item #N$3A
. (#ITEM$3A).
N $FB53 Now the crab is gone, this opens up various routes.
  $FB53,$05 Write #N$2F to *#R$EC27 to open up westbound access to #ROOM$2F
. from #ROOM$2E.
  $FB58,$05 Write #N$30 to *#R$EC2A to open up northbound access to #ROOM$30
. from #ROOM$2F.
  $FB5D,$05 Write #N$31 to *#R$EC30 to open up northbound access to #ROOM$31
. from #ROOM$30.
N $FB62 Print "#STR$E333,$08($b==$FF)".
  $FB62,$03 #REGhl=#R$E333.
  $FB65,$03 Call #R$BAB1.
N $FB68 Print "#STR$E384,$08($b==$FF)".
  $FB68,$03 #REGhl=#R$E384.
  $FB6B,$03 Jump to #R$F03E.
N $FB6E Nothing else is valid.
@ $FB6E label=Shout_Invalid
  $FB6E,$03 Jump to #R$F074.

c $FB71 Action: Insert
@ $FB71 label=Action_Insert
  $FB71,$03 Call #R$C49F.
  $FB74,$01 Return if direct object is malformed.
N $FB75 Was the player trying to insert ... the rod into the hole?
  $FB75,$06 Call #R$C37F with #R$EA70.
  $FB7B,$02 Jump to #R$FB80 if the token isn't for inserting the rod into the
. hole.
N $FB7D The player was trying to insert the rod into the hole.
  $FB7D,$03 Jump to #R$F81B.
N $FB80 Nothing else is valid.
@ $FB80 label=Insert_Invalid
  $FB80,$03 Jump to #R$F06F.

c $FB83 Action: Swearing
@ $FB83 label=Action_Swearing
  $FB83,$03 Call #R$C47B.
  $FB86,$01 Return if the direct object is malformed.
N $FB87 Provide an initial full response for when the player swears.
  $FB87,$07 Jump to #R$FB96 if bit 2 of *#R$BC54 is set, which relates to
. whether the player has sworn in the game already.
N $FB8E This is the first time the player has sworn, so flag that they've been
. sweary.
  $FB8E,$02 Set bit 2 of *#R$BC54 which relates to the player swearing.
N $FB90 Print "#STR$E3A3,$08($b==$FF)".
  $FB90,$03 #REGhl=#R$E3A3.
  $FB93,$03 Jump to #R$F03A.
N $FB96 The is the second time the player has sworn, so flag that they have
. issues.
@ $FB96 label=Swearing_AtLeastOnce
  $FB96,$04 Jump to #R$FBA2 if bit 3 of *#R$BC54 is set, which relates to
. whether the player has sworn in the game already.
N $FB9A The player has sworn twice now, mark that they're a potty-mouth.
  $FB9A,$02 Set bit 3 of *#R$BC54 which relates to the player swearing at least
. twice.
N $FB9C Print "#STR$E3B8,$08($b==$FF)".
  $FB9C,$03 #REGhl=#R$E3B8.
  $FB9F,$03 Jump to #R$F03A.
N $FBA2 Print "#STR$E3F7,$08($b==$FF)".
@ $FBA2 label=Swearing_AtLeastTwice
  $FBA2,$03 #REGhl=#R$E3F7.
  $FBA5,$03 Jump to #R$F03A.

c $FBA8 Action: Pull
@ $FBA8 label=Action_Pull
  $FBA8,$03 Call #R$C47B.
  $FBAB,$01 Return if the direct object is malformed.
  $FBAC,$05 Jump to #R$F074 if #REGa is greater than #N$02.
N $FBB1 Was the player trying to pull ... the ring?
  $FBB1,$06 Call #R$C37F with #R$EACB.
  $FBB7,$02 Jump to #R$FBD2 if the token isn't for the ring.
N $FBB9 The player was trying to pull the ring, but did they do that already?
  $FBB9,$05 Call #R$C35F with #ITEM$34.
  $FBBE,$03 Jump to #R$F065 if the trapdoor is already open.
N $FBC1 Change the ring/ trapdoor state!
  $FBC1,$06 Call #R$C426 to transform item #N$3B (#ITEM$3B) into item #N$34
. (#ITEM$34).
  $FBC7,$05 Write #N$60 to *#R$ED4F to open up downward access to #ROOM$60
. from #ROOM$5F.
N $FBCC Print "#STR$E40B,$08($b==$FF)".
  $FBCC,$03 #REGhl=#R$E40B.
  $FBCF,$03 Jump to #R$F03A.
N $FBD2 Nothing else is valid.
@ $FBD2 label=Pull_Invalid
  $FBD2,$03 Jump to #R$F06F.

c $FBD5 Action: Wear
@ $FBD5 label=Action_Wear
  $FBD5,$03 Call #R$C47B.
  $FBD8,$01 Return if the direct object is malformed.
  $FBD9,$05 Jump to #R$F074 if #REGa is greater than #N$02.
N $FBDE Was the player trying to wear ... the eyepatch?
  $FBDE,$06 Call #R$C37F with #R$E9F1.
  $FBE4,$02 Jump to #R$FC0A if the token isn't for the eyepatch.
N $FBE6 The player was trying to wear the eyepatch, but are they wearing it
. already?
  $FBE6,$05 Call #R$C35F with #ITEM$11.
  $FBEB,$02 Jump to #R$FBF3 if #ITEM$11 isn't in the current room.
N $FBED Print "#STR$E44C,$08($b==$FF)".
  $FBED,$03 #REGhl=#R$E44C.
  $FBF0,$03 Jump to #R$F03A.
N $FBF3 The player was trying to wear the eyepatch, but is it either in the
. room or in the players inventory?
@ $FBF3 label=Validate_Wear_Eyepatch
  $FBF3,$05 Call #R$C3E4 using item #N$10: #ITEM$10.
  $FBF8,$03 Jump to #R$F07E if the eyepatch is either not in the room or not in
. the players inventory.
N $FBFB Change the eyepatch state!
  $FBFB,$06 Call #R$C426 to transform item #N$10 (#ITEM$10) into item #N$11
. (#ITEM$11).
  $FC01,$03 Call #R$F06A.
N $FC04 Print "#STR$E467,$08($b==$FF)".
  $FC04,$03 #REGhl=#R$E467.
  $FC07,$03 Jump to #R$F03A.
N $FC0A Was the player trying to wear ... the shoe?
@ $FC0A label=Wear_CheckShoe
  $FC0A,$06 Call #R$C37F with #R$E9D3.
  $FC10,$02 Jump to #R$FC18 if the token isn't for the shoe.
N $FC12 Print "#STR$E486,$08($b==$FF)".
  $FC12,$03 #REGhl=#R$E486.
  $FC15,$03 Jump to #R$F03A.
N $FC18 Was the player trying to wear ... the jewels?
@ $FC18 label=Wear_CheckJewels
  $FC18,$06 Call #R$C37F with #R$E9DB.
  $FC1E,$03 Jump to #R$F06F if the token is for the jewels.
N $FC21 Nothing else is valid.
  $FC21,$03 Jump to #R$F092.

c $FC24 Action: Light/ Strike
@ $FC24 label=Action_LightStrike
  $FC24,$03 Call #R$C47B.
  $FC27,$01 Return if the direct object is malformed.
  $FC28,$05 Jump to #R$F074 if #REGa is greater than #N$02.
N $FC2D Was the player trying to light ... the match?
  $FC2D,$06 Call #R$C37F with #R$E9E1.
N $FC33 The match is the only item which is light/ strikable.
  $FC33,$02 Jump to #R$FC5E if the token isn't for the match.
N $FC35 The player definitely wants to light/ strike the match ... but is it
. already lit?
  $FC35,$05 Call #R$C35F using item: #ITEM$03.
  $FC3A,$03 Jump to #R$F079 if the lit match is already in the players
. possession.
N $FC3D The match isn't already lit, but is it either in the room, or in the
. players inventory?
  $FC3D,$05 Call #R$C3E4 using item #N$02: #ITEM$02.
  $FC42,$03 Jump to #R$F07E if the player is not holding the (unlit) match.
N $FC45 The player can light the match- so go ahead and do this.
  $FC45,$06 Call #R$C426 to transform item #N$02 (#ITEM$02) into item #N$03
. (#ITEM$03).
  $FC4B,$05 Set bit 6 of *#R$BC66 which activates lighting the match.
N $FC50 The event is turn-based, the player only has the lit match for #N$06
. turns.
  $FC50,$05 Write #N$06 to *#R$BC6D.
  $FC55,$03 Call #R$F06A.
N $FC58 Print "#STR$E4D1,$08($b==$FF)".
  $FC58,$03 #REGhl=#R$E4D1.
  $FC5B,$03 Jump to #R$F03A.
N $FC5E Nothing else is valid.
@ $FC5E label=LightStrike_Invalid
  $FC5E,$03 Jump to #R$F06F.

c $FC61 Action: Enter
@ $FC61 label=Action_Enter
  $FC61,$03 Call #R$C47B.
  $FC64,$01 Return if the direct object is malformed.
  $FC65,$05 Jump to #R$F074 if #REGa is greater than #N$02.
N $FC6A Was the player trying to enter ... the cave?
  $FC6A,$06 Call #R$C37F with #R$EACD.
  $FC70,$02 Jump to #R$FC8C if the token isn't for the cave.
N $FC72 The player is attempting to enter the cave.
N $FC72 Validate that the player isn't already inside the cave.
  $FC72,$0D Jump to #R$F079 if *#R$BCCB is either room #N$52: "#ROOM$52" or
. room #N$3F: "#ROOM$3F".
N $FC7F Default to the player entering the cave if they're in "#ROOM$3E".
  $FC7F,$02 Load room #N$3F: "#ROOM$3F" into #REGb as the destination room.
  $FC81,$04 Jump to #R$FC87 if *#R$BCCB is room #N$3E: "#ROOM$3E".
N $FC85 Else take the player to #ROOM$52.
  $FC85,$02 Load room #N$52: "#ROOM$52" into #REGb as the destination room.
@ $FC87 label=Enter_SetDestinationRoom
  $FC87,$04 Copy #REGb into the #REGa register and call #R$EF54.
  $FC8B,$01 Return.
N $FC8C Was the player trying to enter ... the boat?
@ $FC8C label=Enter_CheckBoat
  $FC8C,$06 Call #R$C37F with #R$EACF.
N $FC92 Either way, it's a bad outcome.
  $FC92,$03 Jump to #R$F074 if the token is for the boat.
N $FC95 Nothing else is able to be entered, so provide a generic response.
  $FC95,$03 Jump to #R$F06F.

c $FC98 Action: Move
@ $FC98 label=Action_Move
  $FC98,$03 Call #R$C47B.
  $FC9B,$01 Return if the direct object is malformed.
N $FC9C Was the player trying to move the stone?
  $FC9C,$06 Call #R$C37F with #R$EAD8.
  $FCA2,$02 Jump to #R$FCAA if the token isn't for the stone.
N $FCA4 The player is asking to move the stone.
N $FCA4 Print "#STR$E305,$08($b==$FF)".
  $FCA4,$03 #REGhl=#R$E305.
  $FCA7,$03 Jump to #R$F03A.
N $FCAA Was the player trying to move the stone with the crowbar?
@ $FCAA label=Move_StoneWithCrowbar
  $FCAA,$06 Call #R$C37F with #R$EADD.
  $FCB0,$02 Jump to #R$FCCA if the token isn't asking to move the stone with
. the crowbar.
N $FCB2 The player is asking to move the stone with the crowbar.
N $FCB2 But ... have they done this already?
  $FCB2,$08 Jump to #R$F079 if #R$C35F reports that #ITEM$4A is in the same
. room as the player.
N $FCBA Handle moving the stone with the crowbar.
N $FCBA This brings items #ITEM$4A and #ITEM$3B into the current room.
  $FCBA,$05 Call #R$C3F1 with item #N$4A: #ITEM$4A.
  $FCBF,$05 Call #R$C3F1 with item #N$3B: #ITEM$3B.
N $FCC4 Print "#STR$E508,$08($b==$FF)".
  $FCC4,$03 #REGhl=#R$E508.
  $FCC7,$03 Jump to #R$F03A.
N $FCCA Nothing else is valid.
@ $FCCA label=Move_Invalid
  $FCCA,$03 Jump to #R$F074.

c $FCCD Action: Unlock
@ $FCCD label=Action_Unlock
  $FCCD,$03 Call #R$C47B.
  $FCD0,$01 Return if the direct object is malformed.
N $FCD1 Was the player trying to unlock the door?
  $FCD1,$06 Call #R$C37F with #R$EAE6.
  $FCD7,$02 Jump to #R$FCFF if the token isn't for the door.
N $FCD9 The player was trying to unlock the door, but is the door even in the
. current room?
  $FCD9,$08 Jump to #R$F06F if *#R$BCCB is room #N$6A: "#ROOM$6A".
N $FCE1 It's the correct door, but is it already unlocked?
  $FCE1,$05 Call #R$C35F with #ITEM$2E.
  $FCE6,$03 Jump to #R$F079 if #ITEM$2E isn't in the current room.
N $FCE9 And does the player have the key?
  $FCE9,$05 Call #R$C3E4 with item #N$1F: #ITEM$1F.
  $FCEE,$02 Jump to #R$FCF6 if the key is either in the room, or in the players
. inventory.
N $FCF0 Print "#STR$E604,$08($b==$FF)".
  $FCF0,$03 #REGhl=#R$E604.
  $FCF3,$03 Jump to #R$F03A.
N $FCF6 Change the door state!
@ $FCF6 label=Unlock_Door
  $FCF6,$06 Call #R$C426 to transform item #N$2E (#ITEM$2E) into item #N$2D
. (#ITEM$2D).
  $FCFC,$03 Jump to #R$F06A.
N $FCFF Nothing else is valid.
@ $FCFF label=Unlock_Invalid
  $FCFF,$03 Jump to #R$F06F.

c $FD02 Action: Row
@ $FD02 label=Action_Row
  $FD02,$03 Call #R$C4B7.
  $FD05,$01 Return if the direct object is malformed.
  $FD06,$05 Jump to #R$F074 if #REGa is greater than #N$02.
N $FD0B Is the player in a room where they're able to row something?
  $FD0B,$03 Load #REGa with *#R$BCCB.
  $FD0E,$03 Set #REGhl to point to #R$FD1E.
  $FD11,$03 Set a counter in #REGbc of #N($0003,$04,$04) which is the number of
. rooms in the table.
  $FD14,$02 Search for the current room in the "rowing boat rooms" table.
  $FD16,$02 Jump to #R$FD21 if there's something to row in this room.
N $FD18 Print "#STR$DC37,$08($b==$FF)".
  $FD18,$03 #REGhl=#R$DC37.
  $FD1B,$03 Jump to #R$F03A.
@ $FD1E label=Table_RoomsRowingBoat
N $FD1E A table containing any room ID in which you're in the rowing boat.
B $FD1E,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $FD1E,$01,$03,$02
N $FD21 The player is in a room containing a rowing boat, but which one?
@ $FD21 label=Row_OpenSea
  $FD21,$04 Jump to #R$FD29 if the room match was not room #N$02: #ROOM$02.
  $FD25,$03 Call #R$EF54.
  $FD28,$01 Return.
N $FD29 The player is in either room #N$6B or #N$04, but which direction were
. they attempting to travel in?
@ $FD28 Was the player trying to row north?
@ $FD29 label=Row_North
  $FD29,$06 Call #R$C37F with #R$EAEC.
  $FD2F,$02 Jump to #R$FD3F if the token isn't for rowing north.
  $FD31,$08 Jump to #R$F079 if *#R$BCCB is not room #N$04: "#ROOM$04".
  $FD39,$05 Call #R$EF54 to room #N$6B: #ROOM$6B.
  $FD3E,$01 Return.
N $FD3F Was the player trying to row south?
@ $FD3F label=Row_South
  $FD3F,$06 Call #R$C37F with #R$EAF5.
  $FD45,$02 Jump to #R$FD54 if the token isn't for rowing south.
  $FD47,$07 Jump to #R$FD67 if *#R$BCCB is not room #N$6B: "#ROOM$6B".
  $FD4E,$05 Call #R$EF54 to room #N$04: #ROOM$04.
  $FD53,$01 Return.
N $FD54 Was the player trying to row east?
@ $FD54 label=Row_East
  $FD54,$06 Call #R$C37F with #R$EAFE.
  $FD5A,$02 Jump to #R$FD67 if the token is for rowing east.
N $FD5C West it is then.
  $FD5C,$06 Call #R$C37F with #R$EB07.
  $FD62,$02 Jump to #R$FD67 if the token is for rowing west.
N $FD64 Nothing else is valid.
  $FD64,$03 Jump to #R$F074.
N $FD67 Player is now lost...
@ $FD67 label=Row_Lost
  $FD67,$05 Call #R$EF54 to room #N$02: #ROOM$02.
  $FD6C,$01 Return.

c $FD6D Action: Swim
@ $FD6D label=Action_Swim
  $FD6D,$03 Call #R$C47B.
  $FD70,$01 Return if the direct object is malformed.
  $FD71,$05 Jump to #R$F074 if #REGa is equal to #N$02.
N $FD76 Print "#STR$DB5F,$08($b==$FF)".
  $FD76,$03 #REGhl=#R$DB5F.
  $FD79,$03 Jump to #R$F03A.
N $FD7C Print "#STR$E5A4,$08($b==$FF)".
  $FD7C,$03 #REGhl=#R$E5A4.
  $FD7F,$03 Jump to #R$F03A.

c $FD82 Game Start
@ $FD82 label=GameStart
  $FD82,$0B Copy #N$0144 bytes from #R$FDB5 to #R$BBF0.
N $FD8D Remove a bunch of room exits (as actions in the game will open them
. back up).
  $FD8D,$04 #REGix=#R$ED9E.
  $FD91,$04 #REGb=*#R$BD32.
  $FD95,$01 Set #REGa to #N$00 which "removes" the exit.
@ $FD96 label=GameStart_Loop
  $FD96,$03 #REGl=*#REGix+#N$00.
  $FD99,$03 #REGh=*#REGix+#N$01.
  $FD9C,$01 Write #REGa to *#REGhl.
  $FD9D,$04 Move to the next address in the table.
  $FDA1,$02 Decrease the exits counter by one and loop back to #R$FD96 until
. all the room exits have been cleared.
N $FDA3 Ensure two exits are "open" (as they can become blocked in the game).
  $FDA3,$05 Enable the exit "west to room #R$EC27(#N$2F)" for #ROOM$2E.
  $FDA8,$05 Enable the exit "north to room #R$EC2A(#N$30)" for #ROOM$2F.
  $FDAD,$05 Call #R$EF54 to room #N$03: #ROOM$03.
  $FDB2,$03 Jump to #R$EDC4.

g $FDB5 Default Game State
@ $FDB5 label=DefaultGameState
B $FDB5,$0144

u $FEF9
B $FEF9,$01

c $FEFA Handler: Room Images
N $FEFA Displays the image for the boat.
@ $FEFA label=DisplayImage_Boat
  $FEFA,$04 #REGix=#R$607C.
  $FEFE,$02 Jump to #R$FF2E.
N $FF00 Displays the image for the sand dunes.
@ $FF00 label=DisplayImage_SandDunes
  $FF00,$04 #REGix=#R$6CA4.
  $FF04,$02 Jump to #R$FF2E.
N $FF06 Displays the image for the bridge.
@ $FF06 label=DisplayImage_Bridge
  $FF06,$04 #REGix=#R$7731.
  $FF0A,$02 Jump to #R$FF2E.
N $FF0C Displays the image for the cave.
@ $FF0C label=DisplayImage_Cave
  $FF0C,$04 #REGix=#R$8171.
  $FF10,$02 Jump to #R$FF2E.
N $FF12 Displays the image for the door.
@ $FF12 label=DisplayImage_Door
  $FF12,$04 #REGix=#R$8BC3.
  $FF16,$02 Jump to #R$FF2E.
N $FF18 Displays the image for the huts.
@ $FF18 label=DisplayImage_Huts
  $FF18,$04 #REGix=#R$966A.
  $FF1C,$02 Jump to #R$FF2E.
N $FF1E Displays the image for the cliffs.
@ $FF1E label=DisplayImage_Cliffs
  $FF1E,$04 #REGix=#R$A042.
  $FF22,$02 Jump to #R$FF2E.
N $FF24 Displays the image for the cavern.
@ $FF24 label=DisplayImage_Cavern
  $FF24,$04 #REGix=#R$A958.
  $FF28,$02 Jump to #R$FF2E.
N $FF2A Displays the image for the treasure chest.
@ $FF2A label=DisplayImage_Treasure
  $FF2A,$04 #REGix=#R$B2A7.
N $FF2E All the image routines use this same routine.
@ $FF2E label=Handler_Images
  $FF2E,$03 Call #R$BB3B.
  $FF31,$05 Call #R$C315 and use line number #N$08 to start printing.
  $FF36,$03 Call #R$BA5D.
  $FF39,$01 Return.

g $FF3A Jump Table: Verbs
@ $FF3A label=JumpTable_Verbs
W $FF3A,$02 Verb word token #N($2E+(#PC-$FF3A)/$02): #TOKEN($2E+(#PC-$FF3A)/$02).
L $FF3A,$02,$26

g $FF86 Jump Table: Turn-Based Events
@ $FF86 label=JumpTable_TurnBasedEvents
W $FF86,$02 Event #N((#PC-$FF86)/$02).
L $FF86,$02,$08

g $FF96 Jump Table: Scenic Events
@ $FF96 label=JumpTable_ScenicEvents
W $FF96,$02 Event #N((#PC-$FF96)/$02).
L $FF96,$02,$09

g $FFA8 Jump Table: Room Images
@ $FFA8 label=JumpTable_RoomImages
D $FFA8 See #R$E95D.
W $FFA8,$02 Location Slot: #N((#PC-$FFA8)/$02).
L $FFA8,$02,$0D

u $FFC2
