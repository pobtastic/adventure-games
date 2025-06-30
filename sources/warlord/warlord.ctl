; Copyright Interceptor Software UK 1985, 2025 ArcadeGeek LTD.
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
E $5B00 View the equivalent code in #JEWELS$5B00.
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

b $61A8 Graphics: The Wooded Vale
@ $61A8 label=Image_WoodedVale
D $61A8 #SIM(start=$5B46,stop=$5B4E)#SIM(start=$A54E,stop=$A554) #PUSHS #UDGTABLE
. { =h The Wooded Vale }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(wooded-vale) }
. UDGTABLE# #POPS
  $61A8

b $6A34 Graphics: The Evaporation Pits
@ $6A34 label=Image_EvaporationPits
D $6A34 #PUSHS #UDGTABLE
. { =h The Evaporation Pits }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(evaporation-pits) }
. UDGTABLE# #POPS
  $6A34

b $704F Graphics: The Shrine Of The Nemed
@ $704F label=Image_NemedShrine
D $704F #PUSHS #UDGTABLE
. { =h The Shrine Of The Nemed }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(shrine-nemed) }
. UDGTABLE# #POPS
  $704F

b $75DD Graphics: The Burial Pit
@ $75DD label=Image_BurialPit
D $75DD #PUSHS #UDGTABLE
. { =h The Burial Pit }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(burial-pit) }
. UDGTABLE# #POPS
  $75DD

b $7C8D Graphics: The Main Courtyard
@ $7C8D label=Image_MainCourtyard
D $7C8D #PUSHS #UDGTABLE
. { =h The Main Courtyard }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(main-courtyard) }
. UDGTABLE# #POPS
  $7C8D

b $8492 Graphics: The Deserted Broch
@ $8492 label=Image_DesertedBroch
D $8492 #PUSHS #UDGTABLE
. { =h The Deserted Broch }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(deserted-broch) }
. UDGTABLE# #POPS
  $8492

b $8AF3 Graphics: The Crystal Cavern
@ $8AF3 label=Image_CrystalCavern
D $8AF3 #PUSHS #UDGTABLE
. { =h The Crystal Cavern }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(crystal-cavern) }
. UDGTABLE# #POPS
  $8AF3

b $915F Graphics: The Circle of Stones
@ $915F label=Image_StoneCircle
D $915F #PUSHS #UDGTABLE
. { =h The Circle of Stones }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(stone-circle) }
. UDGTABLE# #POPS
  $915F

b $983F Graphics: The Fomorians' Cavern
@ $983F label=Image_FomoriansCavern
D $983F #PUSHS #UDGTABLE
. { =h The Fomorians' Cavern }
. { #SIM(start=$B10B,stop=$B149,ix=#PC)#SCR$02{$00,$00,$200,$100}(fomorians-cavern) }
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
E $A531 View the equivalent code in #JEWELS$BA50.
  $A531,$05 #HTML(Set CAPS LOCK on, using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6A.html">FLAGS2</a>).
  $A536,$05 Write #N$18 to *#R$A82E.
  $A53B,$03 Jump to #R$B14A.

c $A53E Get User Input
@ $A53E label=GetUserInput
E $A53E View the equivalent code in #JEWELS$BA5D.
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
E $A54E View the equivalent code in #JEWELS$BA6D.
  $A54E,$03 Call #R$A577.
  $A551,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D6B.html">CLS</a>.)
  $A554,$01 Return.

c $A555 Clear Lines
@ $A555 label=ClearLines
E $A555 View the equivalent code in #JEWELS$BA74.
  $A555,$03 Call #R$A577.
  $A558,$07 #HTML(Clear the number of lines held by *#R$A82E from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $A55F,$01 Return.

c $A560 Set Default Screen Position
@ $A560 label=SetDefaultScreenPosition
E $A560 View the equivalent code in #JEWELS$BA7F.
  $A560,$03 Call #R$A577.
  $A563,$03 #REGbc=#N($0321,$04,$04).
  $A566,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $A569,$01 Return.

c $A56A Set Screen Position
@ $A56A label=SetScreenPosition
E $A56A View the equivalent code in #JEWELS$BA89.
  $A56A,$03 Call #R$A577.
  $A56D,$04 #REGb=*#R$A82E.
  $A571,$05 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>
. with column number #N$21.)
  $A576,$01 Return.

c $A577 Switch To Normal Screen Output
@ $A577 label=SwitchNormalScreenOutput
E $A577 View the equivalent code in #JEWELS$BA96.
  $A577,$04 Stash #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $A57B,$05 #HTML(Set current output channel to <em>normal</em> screen output using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/1601.html">CHAN_OPEN</a> with stream #N$02.)
  $A580,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $A584,$01 Return.

c $A585 Print String
@ $A585 label=PrintString
D $A585 Standard printing loop, which prints the fetched character byte and
. loops until the termination byte is reached (#N$FF).
E $A585 View the equivalent code in #JEWELS$BAA4.
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
E $A592 View the equivalent code in #JEWELS$BAB1.
  $A592,$03 Call #R$A585.
N $A595 Force a newline to be "printed".
  $A595,$02 Load a "newline" character into #REGa (#N$0D).
  $A597,$03 Call #R$A5A4.
  $A59A,$01 Return.

c $A59B Scroll Screen
@ $A59B label=ScrollScreen
D $A59B Scrolls the screen up and then resets the print position.
E $A59B View the equivalent code in #JEWELS$BABA.
  $A59B,$01 Switch to the shadow registers.
N $A59C Scroll the screen up.
  $A59C,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0DFE.html">CL_SC_ALL</a>.)
N $A59F Reset the print position.
  $A59F,$03 Call #R$A560.
  $A5A2,$01 Switch back to the normal registers.
  $A5A3,$01 Return.

c $A5A4 Print Character
@ $A5A4 label=PrintCharacter
E $A5A4 View the equivalent code in #JEWELS$BAC3.
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
E $A5C2 View the equivalent code in #JEWELS$BB51.
R $A5C2 B Number of HALT commands to use
  $A5C2,$01 Halt operation (suspend CPU until the next interrupt).
  $A5C3,$02 Decrease counter by one and loop back to #R$A5C2 until counter is zero.
  $A5C5,$01 Return.

c $A5C6 Fetch Frames
@ $A5C6 label=FetchFrames
E $A5C6 View the equivalent code in #JEWELS$BB55.
R $A5C6 O:A #HTML(The first byte of the <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a> variable.)
  $A5C6,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>.)
  $A5C9,$01 Return.

c $A5CA Save Game
@ $A5CA label=SaveGame
E $A5CA View the equivalent code in #JEWELS$BB59.
  $A5CA,$03 #REGa=*#R$A7F0.
  $A5CD,$03 Jump to #R$A5E9 if #REGa is zero.
  $A5D0,$01 #REGb=#REGa.
  $A5D1,$04 #REGix=*#R$A7DC(#N$A7DC).
  $A5D5,$03 #REGde=#R$A791.
  $A5D8,$02 Jump to #R$A5DF.

  $A5DA,$04 Increment #REGix by two.
  $A5DE,$01 Increment #REGde by one.
  $A5DF,$03 #REGl=*#REGix+#N$00.
  $A5E2,$03 #REGh=*#REGix+#N$01.
  $A5E5,$02 Write *#REGhl to *#REGde.
  $A5E7,$02 Decrease counter by one and loop back to #R$A5DA until counter is zero.
N $A5E9 Print "#STR$A950,$08($b==$FF)".
  $A5E9,$03 #REGhl=#R$A950.
  $A5EC,$03 Call #R$A592.
  $A5EF,$03 Call #R$A53E.
  $A5F2,$04 #REGix=#R$A66C(#N$A66C).
  $A5F6,$03 #REGde=#N$0186.
  $A5F9,$02 Set #REGa to #N$FF which indicates this is a data block.
  $A5FB,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
N $A5FE Print "#STR$A986,$08($b==$FF)".
  $A5FE,$03 #REGhl=#R$A986.
  $A601,$03 Call #R$A592.
  $A604,$01 Return.

c $A605 Load From Tape
@ $A605 label=LoadTape
E $A605 View the equivalent code in #JEWELS$BB94.
N $A605 Print "#STR$A915,$08($b==$FF)".
  $A605,$03 #REGhl=#R$A915.
  $A608,$03 Call #R$A592.
  $A60B,$04 Load the starting address into #REGix at #R$A66C.
  $A60F,$03 Set the block length in #REGde to #N$0186 bytes.
  $A612,$02 Set #REGa to #N$FF which indicates this is a data block.
  $A614,$01 Set the carry flag to indicate this is loading.
  $A615,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0556.html">LD_BYTES</a>.)
  $A618,$02 Jump to #R$A622 if the carry flag is not set.
N $A61A Print "#STR$A92A,$08($b==$FF)".
  $A61A,$03 #REGhl=#R$A92A.
  $A61D,$03 Call #R$A592.
  $A620,$01
  $A621,$01 Return.
@ $A622 label=LoadTape_Success
  $A622,$03 #REGa=*#R$A7F0.
  $A625,$02 Return if #REGa is zero.
  $A627,$01 #REGb=#REGa.
  $A628,$04 #REGix=*#R$A7DC.
  $A62C,$03 #REGde=#R$A791.
  $A62F,$02 Jump to #R$A636.
@ $A631 label=LoadTape_WriteLoop
  $A631,$04 Increment #REGix by two.
  $A635,$01 Increment #REGde by one.
@ $A636 label=LoadTape_Write
  $A636,$03 #REGl=*#REGix+#N$00.
  $A639,$03 #REGh=*#REGix+#N$01.
  $A63C,$01 #REGa=*#REGde.
  $A63D,$01 Write #REGa to *#REGhl.
  $A63E,$02 Decrease counter by one and loop back to #R$A631 until counter is zero.
  $A640,$02 #REGe=#N$00.
  $A642,$03 Call #R$ABB6.
  $A645,$01 Set flags.
  $A646,$01 Return.

c $A647 Print Input Prompt
@ $A647 label=PrintInputPrompt
E $A647 View the equivalent code in #JEWELS$BBD4.
  $A647,$03 #REGhl=#N$5080 (screen buffer location).
  $A64A,$03 Set the increment in #REGde for the next screen line.
  $A64D,$02 #REGb=#N$08.
  $A64F,$01 #REGa=#N$00.
@ $A650 label=PrintInputPrompt_Loop
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

g $A663 Table: Delimiters
@ $A663 label=Table_Delimiters_Count
B $A663,$01 Number of delimiters in the table: #PEEK(#PC).
@ $A664 label=Table_Delimiters
T $A664,$01 "SPACE".
T $A665,$01 "COMMA".
T $A666,$01 "DOUBLE QUOTE".

g $A667 Table: Vocabulary For "THE"
@ $A667 label=Table_Vocabulary_The
D $A667 "Vocabulary Table" used for matching and removing "THE" from user
. input.
T $A667,$04 "#STR$A667,$08($b==$FF)".
B $A66B,$01 Terminator.

g $A66C Table: Item/ Event Locations
@ $A66C label=Table_ItemEventLocations
D $A66C A table where the index is the item/ event ID, and the value is the
. room it resides in (#N$00 for "currently inactive").
D $A66C When the item is in the players inventory, the room ID changes to
. #N$01.
B $A66C,$01 Event #N(#PC-$A66C) #ITEM(#PC-$A66C) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $A66C,$01,$0A
B $A676,$01 Item #N(#PC-$A66C) #ITEM(#PC-$A66C) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $A676,$01,$7D

g $A76C
B $A76C,$01

g $A772
B $A772,$01
B $A773,$01

g $A774 Table: Already Seen Room Images
@ $A774 label=Table_RoomImagesAlreadySeen
D $A774 Corresponds to whether the player has already seen the image for the following rooms:
.
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$FEF1,$FEF8,,1(n,{ #N(n-$FEF1) | #N(#PEEKn) | #ROOM(#PEEKn) })
. TABLE#
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$FEF9,$FEFB,,1(n,{ #N(n-$FEF9) | #N(#PEEKn) | #ROOM(#PEEKn) })
. #FOR$03,$07,,1(n,{ #Nn | N/A | N/A })
. TABLE#
D $A774 Used by the routine at #R$ABB6 but uses the bit index from #R$FEF1.
B $A774,b,$01
B $A775,b,$01

g $A776

g $A77E Flags: Turn-Based Event States
@ $A77E label=Flag_TurnBasedEventState
D $A77E Holds a single byte, where each bit relates to a turn-based event as
. follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 |  }
. { #N$01 | Fomorian Tribe }
. { #N$02 |  }
. { #N$03 |  }
. { #N$04 |  }
. { #N$05 |  }
. { #N$06 |  }
. { #N$07 |  }
. TABLE#
. When the bit is set, this starts a turn counter (see ...).
B $A77E,$01

g $A77F Turn-Based Event Counters
N $A77F Initialised to #N$05 by #R$EBFC.
@ $A77F label=Counter_01
N $A780 Initialised to #N$05 by #R$EC21.
@ $A780 label=Counter_FomorianTribe
N $A781
@ $A781 label=Counter_03
N $A782
@ $A782 label=Counter_04
N $A783
@ $A783 label=Counter_05
N $A784
@ $A784 label=Counter_06
N $A785
@ $A785 label=Counter_07
N $A786
@ $A786 label=Counter_08
B $A77F,$08,$01

g $A787 Flags: Event States
@ $A787 label=Flag_EventStates
D $A787 Holds a single byte, where each bit relates to an event as follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | The Roman Being Captured }
. { #N$01 |  }
. { #N$02 |  }
. { #N$03 |  }
. { #N$04 |  }
. { #N$05 |  }
. { #N$06 |  }
. { #N$07 |  }
. TABLE#
B $A787,$01

g $A788
B $A788,$01
L $A788,$01,$08

g $A790 Number Of Items In The Players Inventory
@ $A790 label=Count_InventoryItems
D $A790 The number of items the player is currently holding.
B $A790,$01

g $A791

g $A7C3 Current Room ID
@ $A7C3 label=CurrentRoom
D $A7C3 The room the player starts the game in is room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
B $A7C3,$01 Current room ID.

g $A7C4 Score
@ $A7C4 label=Score
W $A7C4,$02

g $A7C6 Pointer: Vocabulary Table
@ $A7C6 label=Pointer_Vocabulary
D $A7C6 Pointer to the table containing the game vocabulary.
W $A7C6,$02

g $A7C8 Pointer: Turn-Based Events Jump Table
@ $A7C8 label=Pointer_TurnBasedEvents_Jump
D $A7C8 Pointer to the jump table containing turn-based events.
W $A7C8,$02

g $A7CA Pointer: Room Map Table
@ $A7CA label=Pointer_RoomMap
D $A7CA Pointer to the table containing the relationships between rooms.
W $A7CA,$02

g $A7CC Pointer: Item Description Table
@ $A7CC label=Pointer_ItemDescriptions
D $A7CC Pointer to the table containing item descriptions.
W $A7CC,$02

g $A7CE Pointer: Rooms With Images Table
@ $A7CE label=Pointer_RoomsWithImages
D $A7CE Pointer to the table containing all the rooms which have an image to
. display.
W $A7CE,$02

g $A7D0 Pointer: Room Image Jump Table
@ $A7D0 label=Pointer_RoomImage
D $A7D0 Pointer to the jump table for displaying an image relating to a room.
W $A7D0,$02

g $A7D2 Pointer: Room Description Table
@ $A7D2 label=Pointer_RoomDescriptions
D $A7D2 Pointer to the table containing room descriptions.
W $A7D2,$02

g $A7D4 Pointer: Item Grouping Table
@ $A7D4 label=Pointer_ItemGroupingTable
W $A7D4,$02

g $A7D6 Pointer: Object Noun Phrases
@ $A7D6 label=Pointer_ObjectNounPhrases
W $A7D6,$02

g $A7D8 Pointer: Object List Table
@ $A7D8 label=Pointer_ObjectList
W $A7D8,$02

g $A7DA Pointer: Verbs Jump Table
@ $A7DA label=Pointer_JumpTable_Verbs
W $A7DA,$02

g $A7DC Pointer: Configurable Exits Table
@ $A7DC label=Pointer_ConfigurableExits
W $A7DC,$02

g $A7DE Pointer: Scenic Events Jump Table
@ $A7DE label=Pointer_JumpTable_ScenicEvents
W $A7DE,$02

g $A7E0 Pointer: Verb Word Tokens Table
@ $A7E0 label=Pointer_VerbWordTokens
W $A7E0,$02

g $A7E2 Pointer: Scenic Event Locations
@ $A7E2 label=Pointer_ScenicEventLocations
W $A7E2,$02

g $A7E4 Pointer: Scenic Event Rooms
@ $A7E4 label=Pointer_ScenicEventRooms
W $A7E4,$02

g $A7E6 Number Of Items
@ $A7E6 label=Count_Items
D $A7E6 The total number of items in the game.
W $A7E6,$02

g $A7E8 Number Of Objects
@ $A7E8 label=Count_Objects
D $A7E8 The total number of objects in the game.
W $A7E8,$02

g $A7EA Number Of Verb Tokens
@ $A7EA label=Count_VerbTokens
D $A7EA The total number of verb word tokens the game has. See #R$E489.
W $A7EA,$02

g $A7EC Number Of Rooms With Images
@ $A7EC label=Count_RoomsWithImages
D $A7EC The total number of rooms which have related images in the game.
W $A7EC,$02

g $A7EE Number Of Scenic Events
@ $A7EE label=Count_ScenicEvents
E $A7EE The total number of scenic events in the game, see #R$E4E6.
W $A7EE,$02

g $A7F0 Number Of "Configurable Exits"
@ $A7F0 label=Count_ConfigurableExits
W $A7F0,$02

g $A7F2 Command Buffer
@ $A7F2 label=CommandBuffer
B $A7F2,$32

g $A824 User Input: Word Tokens
@ $A824 label=UserInput_Token_1
@ $A825 label=UserInput_Token_2
B $A824,$01
L $A824,$01,$0A

g $A82E Line Number
@ $A82E label=LineNumber
E $A82E View the equivalent code in #JEWELS$BD70.
B $A82E,$01

g $A82F Four Letter Buffer
@ $A82F label=FourLetterBuffer
B $A82F,$04

g $A83B Temporary Storage Table Pointer
@ $A83B label=TempStore_TablePointer
W $A83B,$02

g $A83D Temporary Storage Table Index
@ $A83D label=TempStore_TableIndex
W $A83D,$02

t $A843 Messaging: "> "
@ $A843 label=Messaging_Prompt
  $A843,$02 "#STR$A843,$08($b==$FF)".
B $A845,$01 Terminator.

t $A846 Messaging: "<BS> <BS>"
@ $A846 label=Messaging_BackspaceSpaceBackspace
  $A846,$03 "#STR$A846,$08($b==$FF)".
B $A849,$01 Terminator.

t $A84A Messaging: "The "
@ $A84A label=Messaging_The
  $A84A,$04 "#STR$A84A,$08($b==$FF)".
B $A84E,$01 Terminator.

t $A84F Messaging: "I Don't Understand"
@ $A84F label=Messaging_IDontUnderstand
  $A84F,$13 "#STR$A84F,$08($b==$FF)".
B $A862,$01 Terminator.

t $A863 Messaging: "I Don't Know The Word:-"
@ $A863 label=Messaging_IDontKnowTheWord
  $A863,$17 "#STR$A863,$08($b==$FF)".
B $A87A,$01 Terminator.

t $A87B Messaging: "Nothing"
@ $A87B label=Messaging_Nothing
  $A87B,$08 "#STR$A87B,$08($b==$FF)".
B $A883,$01 Terminator.

t $A884 Messaging: "You Can See:-"
@ $A884 label=Messaging_YouCanSee
  $A884,$0E "#STR$A884,$08($b==$FF)".
B $A892,$01 Terminator.

t $A893 Messaging: "Ampersand"
@ $A893 label=Messaging_Ampersand
  $A893,$03 "#STR$A893,$08($b==$FF)".
B $A896,$01 Terminator.

t $A897 Messaging: "There Are Exits:-"
@ $A897 label=Messaging_ThereAreExits
  $A897,$12 "#STR$A897,$08($b==$FF)".
B $A8A9,$01 Terminator.

t $A8AA Messaging: "There Is An Exit"
@ $A8AA label=Messaging_ThereIsAnExit
  $A8AA,$12 "#STR$A8AA,$08($b==$FF)".
B $A8BC,$01 Terminator.

t $A8BD Exits Messaging: "North"
@ $A8BD label=MessagingExits_North
  $A8BD,$05 "#STR$A8BD,$08($b==$FF)".
B $A8C2,$01 Terminator.

t $A8C3 Exits Messaging: "South"
@ $A8C3 label=MessagingExits_South
  $A8C3,$05 "#STR$A8C3,$08($b==$FF)".
B $A8C8,$01 Terminator.

t $A8C9 Exits Messaging: "East"
@ $A8C9 label=MessagingExits_East
  $A8C9,$04 "#STR$A8C9,$08($b==$FF)".
B $A8CD,$01 Terminator.

t $A8CE Exits Messaging: "West"
@ $A8CE label=MessagingExits_West
  $A8CE,$04 "#STR$A8CE,$08($b==$FF)".
B $A8D2,$01 Terminator.

t $A8D3 Exits Messaging: "Up"
@ $A8D3 label=MessagingExits_Up
  $A8D3,$02 "#STR$A8D3,$08($b==$FF)".
B $A8D5,$01 Terminator.

t $A8D6 Exits Messaging: "Down"
@ $A8D6 label=MessagingExits_Down
  $A8D6,$04 "#STR$A8D6,$08($b==$FF)".
B $A8DA,$01 Terminator.

t $A8DB Messaging: "I Can't See"
@ $A8DB label=Messaging_ICantSee
  $A8DB,$0C "#STR$A8DB,$08($b==$FF)".
B $A8E7,$01 Terminator.

t $A8E8 Messaging: "Here"
@ $A8E8 label=Messaging_Here
  $A8E8,$06 "#STR$A8E8,$08($b==$FF)".
B $A8EE,$01 Terminator.

t $A8EF Messaging: "You Are Dead"
@ $A8EF label=Messaging_YouAreDead
  $A8EF,$0D "#STR$A8EF,$08($b==$FF)".
B $A8FC,$01 Terminator.

t $A8FD Messaging: "Want Another Game? Y/N"
@ $A8FD label=Messaging_WantAnotherGame
  $A8FD,$17 "#STR$A8FD,$08($b==$FF)".
B $A914,$01 Terminator.

t $A915 Messaging: "Loading. Press Play"
@ $A915 label=Messaging_LoadingPressPlay
  $A915,$14 "#STR$A915,$08($b==$FF)".
B $A929,$01 Terminator.

t $A92A Messaging: "Tape Error.press Any Key To Restart"
@ $A92A label=Messaging_TapeError
  $A92A,$25 "#STR$A92A,$08($b==$FF)".
B $A94F,$01 Terminator.

t $A950 Messaging: "Saving. Position Tape.Press Rec & Play,Then Any Key"
@ $A950 label=Messaging_Saving
  $A950,$35 "#STR$A950,$08($b==$FF)".
B $A985,$01 Terminator.

t $A986 Messaging: "Stop Tape.Saving Complete"
@ $A986 label=Messaging_StopTapeSavingComplete
  $A986,$1A "#STR$A986,$08($b==$FF)".
B $A9A0,$01 Terminator.

t $A9A1 Messaging: "Want To Save The Game? Y/N"
@ $A9A1 label=Messaging_WantToSaveTheGame
  $A9A1,$1B "#STR$A9A1,$08($b==$FF)".
B $A9BC,$01 Terminator.

t $A9BD Messaging: "Please Be More Specific"
@ $A9BD label=Messaging_PleaseBeMoreSpecific
  $A9BD,$18 "#STR$A9BD,$08($b==$FF)".
B $A9D5,$01 Terminator.

t $A9D6 Messaging: "Please Rephrase That"
@ $A9D6 label=Messaging_PleaseRephraseThat
  $A9D6,$15 "#STR$A9D6,$08($b==$FF)".
B $A9EB,$01 Terminator.

t $A9EC Messaging: "You Can't"
@ $A9EC label=Messaging_YouCant
  $A9EC,$0A "#STR$A9EC,$08($b==$FF)".
B $A9F6,$01 Terminator.

t $A9F7 Messaging: "O.K"
@ $A9F7 label=Messaging_OK
  $A9F7,$04 "#STR$A9F7,$08($b==$FF)".
B $A9FB,$01 Terminator.

t $A9FC Messaging: "You're Already Carrying"
@ $A9FC label=Messaging_YoureAlreadyCarrying
  $A9FC,$18 "#STR$A9FC,$08($b==$FF)".
B $AA14,$01 Terminator.

t $AA15 Messaging: "."
@ $AA15 label=Messaging_FullStop
  $AA15,$01 "#STR$AA15,$08($b==$FF)".
B $AA16,$01 Terminator.

t $AA17 Messaging: "It"
@ $AA17 label=Messaging_It
  $AA17,$03 "#STR$AA17,$08($b==$FF)".
B $AA1A,$01 Terminator.

t $AA1B Messaging: "Them"
@ $AA1B label=Messaging_Them
  $AA1B,$05 "#STR$AA1B,$08($b==$FF)".
B $AA20,$01 Terminator.

t $AA21 Messaging: "You Can't Carry Any More"
@ $AA21 label=Messaging_YouCantCarryAnyMore
  $AA21,$19 "#STR$AA21,$08($b==$FF)".
B $AA3A,$01 Terminator.

t $AA3B Messaging: "You Are Carrying:-"
@ $AA3B label=Messaging_YouAreCarrying
  $AA3B,$12 "#STR$AA3B,$08($b==$FF)".
B $AA4D,$01 Terminator.

t $AA4E Messaging: "You Can't Go In That Direction"
@ $AA4E label=Messaging_YouCantGoInThatDirection
  $AA4E,$1F "#STR$AA4E,$08($b==$FF)".
B $AA6D,$01 Terminator.

t $AA6E Messaging: "One At A Time,Please!"
@ $AA6E label=Messaging_OneAtATimeplease
  $AA6E,$15 "#STR$AA6E,$08($b==$FF)".
B $AA83,$01 Terminator.

t $AA84 Messaging: "I Don't See The Point"
@ $AA84 label=Messaging_IDontSeeThePoint
  $AA84,$16 "#STR$AA84,$08($b==$FF)".
B $AA9A,$01 Terminator.

t $AA9B Messaging: "You're Not Carrying"
@ $AA9B label=Messaging_YoureNotCarrying
  $AA9B,$14 "#STR$AA9B,$08($b==$FF)".
B $AAAF,$01 Terminator.

t $AAB0 Messaging: "You're Not Carrying Anything"
@ $AAB0 label=Messaging_YoureNotCarryingAnything
  $AAB0,$1D "#STR$AAB0,$08($b==$FF)".
B $AACD,$01 Terminator.

t $AACE Messaging: "You Have Scored"
@ $AACE label=Messaging_YouHaveScored
  $AACE,$10 "#STR$AACE,$08($b==$FF)".
B $AADE,$01 Terminator.

t $AADF Messaging: "%"
@ $AADF label=Messaging_Percentage
  $AADF,$02 "#STR$AADF,$08($b==$FF)".
B $AAE1,$01 Terminator.

g $AAE2 Table: Directions
@ $AAE2 label=Table_Directions
D $AAE2 Pointer to the table containing direction messaging.
W $AAE2,$02 "#STR$A8BD,$08($b==$FF)".
W $AAE4,$02 "#STR$A8C3,$08($b==$FF)".
W $AAE6,$02 "#STR$A8C9,$08($b==$FF)".
W $AAE8,$02 "#STR$A8CE,$08($b==$FF)".
W $AAEA,$02 "#STR$A8D3,$08($b==$FF)".
W $AAEC,$02 "#STR$A8D6,$08($b==$FF)".

c $AAEE Response: "Please Rephrase That"
@ $AAEE label=Response_PleaseRephraseThat
E $AAEE View the equivalent code in #JEWELS$BFEE.
N $AAEE Print "#STR$A9D6,$08($b==$FF)".
  $AAEE,$03 #REGhl=#R$A9D6.
  $AAF1,$03 Call #R$A592.
  $AAF4,$01 Return.

c $AAF5 Response: "Please Be More Specific"
@ $AAF5 label=Response_PleaseBeMoreSpecific
E $AAF5 View the equivalent code in #JEWELS$BFF5.
N $AAF5 Print "#STR$A9BD,$08($b==$FF)".
  $AAF5,$03 #REGhl=#R$A9BD.
  $AAF8,$03 Call #R$A592.
  $AAFB,$01 Return.

c $AAFC Response: "You Can't"
@ $AAFC label=Response_YouCant
E $AAFC View the equivalent code in #JEWELS$BFFC.
N $AAFC Print "#STR$A9EC,$08($b==$FF)".
  $AAFC,$03 #REGhl=#R$A9EC.
  $AAFF,$03 Call #R$A592.
  $AB02,$01 Return.

c $AB03 Response: "O.K"
@ $AB03 label=Response_OK
E $AB03 View the equivalent code in #JEWELS$C003.
N $AB03 Print "#STR$A9F7,$08($b==$FF)".
  $AB03,$03 #REGhl=#R$A9F7.
  $AB06,$03 Call #R$A592.
  $AB09,$01 Return.

c $AB0A Process Game Events
@ $AB0A label=GameEventsProcessor
D $AB0A This routine manages two types of in-game events:
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
E $AB0A View the equivalent code in #JEWELS$C17D.
N $AB0A First process the turn-based events (if any are active).
  $AB0A,$03 Load *#R$A77E into #REGa.
  $AB0D,$03 Jump to #R$AB3C if no turn-based events are currently active.
N $AB10 One of the events has triggered, find which one.
  $AB10,$01 Copy the turn-based event flags into #REGc.
  $AB11,$02 Set a counter in #REGb for the number of possible turn-based events
. (#N$08).
N $AB13 Keep shifting the event flags one-by-one to find which bits are set.
@ $AB13 label=GameEventChecker_Loop
  $AB13,$02 Shift #REGc one position left to check the next event flag bit.
  $AB15,$02 Jump to #R$AB3A if this event bit isn't set.
N $AB17 The currently processed turn-based event is active, so process it.
N $AB17 This is: #R$A77F+(#N$08-the current event counter).
  $AB17,$0B Calculate the turn-based event index and store it in #REGhl.
  $AB22,$01 Decrease the turn-based event counter at *#REGhl by one.
  $AB23,$02 Jump to #R$AB3A if the event turn counter at *#REGhl was still more
. than zero.
N $AB25 The event turn counter is zero, so activate the event itself.
  $AB25,$04 Load *#R$A7C8 into #REGix.
  $AB29,$02 Double the index as this table contains addresses.
  $AB2B,$02 Add this offset to #REGix to point to the current handler.
  $AB2D,$06 Get the handler address and store it in #REGhl.
  $AB33,$01 Stash the bit index and event flag byte on the stack.
  $AB34,$04 Push #R$AB39 onto the stack so that the next return will go on to
. continue processing events.
  $AB38,$01 Jump to the routine pointed to by *#REGhl to action the current
. event.
N $AB39 Once the event handler has run, this is where the routine will resume.
@ $AB39 label=GameEventChecker_Return
  $AB39,$01 Restore the event bit index counter and event flag byte from the
. stack.
@ $AB3A label=GameEventChecker_Next
  $AB3A,$02 Decrease the event bit counter by one and loop back to #R$AB13
. until all the event status bits have been processed.
N $AB3C Process scenic events.
@ $AB3C label=GameScenicEventsProcessor
  $AB3C,$01 No operation.
  $AB3D,$03 Load #REGhl with *#R$A7E2.
  $AB40,$03 Load *#R$A7EE into #REGa.
  $AB43,$03 Jump to #R$AB87 if there are no more scenic events to run (the
. count is zero).
  $AB46,$01 Copy *#R$A7EE into #REGb as an event counter for the loop.
  $AB47,$02 Jump to #R$AB4A.
N $AB49 This is the main scenic event loop.
@ $AB49 label=GameScenicEventChecker_Loop
  $AB49,$01 Increment the scenic event pointer location by one.
@ $AB4A label=GameScenicEventChecker


  $AB5A,$02 Stash the scenic event location pointer and event counter on the stack.
N $AB5C This is: #REGe=*#R$A7EE-#REGb.
  $AB5C,$05 Calculate the index of the currently processed event.
  $AB61,$04 Load *#R$A7E4 into #REGix.
N $AB65 The routine at #R$AB88 is usually used to fetch an address from the
. given table, but here it's used to move #REGix to point to the index of the
. currently processed event (and this routine will fetch the address itself).
  $AB65,$03 Call #R$AB88.
  $AB68,$04 Load a random number from #R$A5C6 into #REGb.
  $AB6C,$02 Set #REGa to #N$FF (the room group terminator) for the comparison.
N $AB6E The table at #R$A7E4 is indexed by event (there are #N$08 entries), but
. each address points to a "group" of room IDs where this event could occur.
. Each set of room IDs for the event is terminated using #N$FF.
@ $AB6E label=GameScenicEvent_FetchRoomGroup
  $AB6E,$06 Get the room group address pointer and store it in #REGhl.
  $AB74,$02 Jump to #R$AB77.
N $AB76 Use the random number to select a room from the group - this loops
. through the rooms using #REGb as a counter.
@ $AB76 label=GameScenicEvent_CountRooms_Loop
  $AB76,$01 Move to the next room ID in the group.
@ $AB77 label=GameScenicEvent_CountRoomsInGroup
  $AB77,$03 Jump to #R$AB6E if the terminator is read from *#REGhl.
  $AB7A,$02 Decrease the random counter by one and loop back to #R$AB76 until
. the counter is zero.

  $AB80,$03 Call #R$AF08.
  $AB83,$02 Restore the event counter and scenic event location pointer from the stack.
@ $AB85 label=GameScenicEventChecker_Next
  $AB85,$02 Decrease the scenic event counter by one and loop back to #R$AB49
. until all scenic events have been processed.
N $AB87 All done, now return.
@ $AB87 label=GameEventsProcessor_Return
  $AB87,$01 Return.

c $AB88 Get Table Entry
@ $AB88 label=GetTableEntry
D $AB88 Retrieves an address from a table using a given index.
E $AB88 View the equivalent code in #JEWELS$C1F0.
R $AB88 E Index of item
R $AB88 IX Base table address
R $AB88 O:HL Address from the relevant table entry
R $AB88 O:IX Address of the table entry
  $AB88,$06 Multiply the given index by #N$02 and store the result in #REGde.
  $AB8E,$02 Add #REGde to the base table address.
  $AB90,$06 Fetch the relevant table address and store it in #REGhl.
  $AB96,$01 Return.

c $AB97 Print Objects
@ $AB97 label=PrintObjects
E $AB97 View the equivalent code in #JEWELS$C1FF.
R $AB97 A #N$01 for inventory items, or room number for room objects
  $AB97,$03 #REGhl=#R$A66C.
  $AB9A,$04 #REGbc=*#R$A7E6.
@ $AB9E label=FindObject_Loop
  $AB9E,$02 Search for matching objects.
  $ABA0,$01 Return if no objects were found.
  $ABA1,$01 Stash the current place in #R$A66C on the stack.
  $ABA2,$03 Call #R$AF56.
  $ABA5,$02 Jump to #R$ABAE if the object is invalid.
  $ABA7,$02 Temporarily stash the object type and object counter on the stack.
  $ABA9,$03 Call #R$A592.
  $ABAC,$02 Restore the object counter and object type from the stack.
@ $ABAE label=FindObject_Next
  $ABAE,$01 Temporarily hold the object type in #REGe.
  $ABAF,$01 Restore the current place in #R$A66C from the stack.
  $ABB0,$02 Test if all objects have been checked...
  $ABB2,$01 Restore the object type to #REGa.
  $ABB3,$02 Jump to #R$AB9E until all objects in the table have been checked.
  $ABB5,$01 Return.

c $ABB6 Handler: Display Room Image
@ $ABB6 label=Handler_DisplayRoomImage
D $ABB6 Determines if the current room has an image relating to it, and if it
. does - it jumps to the routine to display it.
E $ABB6 View the equivalent code in #JEWELS$C21E.
R $ABB6 E #N$01 If the image should be displayed, #N$00 if it should be skipped
N $ABB6 The game can also load without any graphics at all, so bail if there's
. nothing needed to do here.
  $ABB6,$06 Jump to #R$AC02 if *#R$A7EC is set to zero.
N $ABBC The version of the game being played DOES have graphics, so continue.
  $ABBC,$03 Fetch *#R$A7C3 and load it into #REGa.
  $ABBF,$03 Fetch the address of the table from *#R$A7CE.
  $ABC2,$04 Fetch the count of the number of rooms in the table from *#R$A7EC.
  $ABC6,$02 Search to see if the current room ID is in the table.
  $ABC8,$02 Jump to #R$AC02 if the current room ID does not appear in the
. table.
N $ABCA The current room does have an image associated with it.
M $ABCA,$06 Calculate the index of the current room in the table.
  $ABCA,$03 #REGa=*#R$A7EC.
  $ABCD,$01 Increment #REGc by one.
  $ABCE,$01 #REGa-=#REGc.
  $ABCF,$01 #REGc=#REGa.
N $ABD0 The #REGe register is used as a flag to indicate that the room image
. should not be displayed, e.g. after the player has requested to view their
. inventory and have seen the room image already when they entered the
. location.
  $ABD0,$04 Jump to #R$ABF0 if #REGe was set to #N$01 (Display the image).
N $ABD4 The game also maintains a table of "already seen room images" so the
. player doesn't have to view an image for a room they've already been in.
N $ABD4 The player can view it manually by typing "LOOK" (or just "L").
  $ABD4,$03 #REGhl=#R$A774.
  $ABD7,$01 Copy the room image index into #REGa.
@ $ABD8 label=FindAlreadySeenByte_Loop
N $ABD8 Only two bytes hold the data for all #N$0C rooms with images so first -
. find the correct byte which references this room.
  $ABD8,$04 Jump to #R$ABE1 if the room index is less than #N$08.
  $ABDC,$02 Subtract #N$08 (number of bits in a byte) from the room index.
  $ABDE,$01 Increment the "image already seen" table pointer by one.
  $ABDF,$02 Jump back to #R$ABD8.
@ $ABE1 label=FoundAlreadySeenByte
N $ABE1 Now the correct byte has been found, check the appropriate bit.
N $ABE1 Create a mask with a single bit set corresponding to this rooms
. position (0-7) in the byte.
  $ABE1,$01 Copy the "image already seen" byte into #REGb.
  $ABE2,$01 Increment #REGb by one to get the correct number of shifts.
  $ABE3,$02 Start with all bits clear in #REGd.
@ $ABE5 label=AlreadySeenBitShift_Loop
  $ABE5,$02 Rotate 1 bit left into position.
  $ABE7,$02 Decrease the shift counter by one and loop back to #R$ABE5 until
. the bit is in the correct position.
N $ABE9 Test the bit held in #REGd against the room flag.
  $ABE9,$01 Fetch the current room flag.
  $ABEA,$03 If the room image has already been seen ... jump to #R$AC02.
N $ABED The room image hasn't already been seen, so update the bit to indicate
. that the player will have viewed it for the next time this routine runs.
  $ABED,$03 Merge the set room bit with the room flags and write the result
. back to the room flag byte.
@ $ABF0 label=DisplayRoomImage
N $ABF0 Finally! Display the room image.
  $ABF0,$01 Temporarily stash #REGbc on the stack.
  $ABF1,$03 Call #R$A54E.
  $ABF4,$01 Restore #REGbc from the stack.
  $ABF5,$04 Fetch the address of the table from *#R$A7D0.
  $ABF9,$01 Load the location image index into #REGe.
  $ABFA,$03 Call #R$AB88.
  $ABFD,$04 Push #R$AC02 onto the stack so that the next return will go on to
. show the room exits.
  $AC01,$01 Jump to the routine pointed to by *#REGhl to display the room
. image.

c $AC02 Handler: Display Room Exits
@ $AC02 label=Handler_RoomExits
D $AC02 Handles displaying the exits available for the current room.
E $AC02 View the equivalent code in #JEWELS$C26A.
  $AC02,$03 Call #R$A54E.
  $AC05,$05 Set up the printing position.
  $AC0A,$03 Call #R$AC9A which loads #REGhl with the room data pointer.
  $AC0D,$02 Store this in #REGde for later.
N $AC0F Count the number of exits in the room data.
  $AC0F,$02 Set an "exits" counter in #REGb of #N$06.
  $AC11,$02 Initialise #REGc to #N$00 to count the number of valid exits.
  $AC13,$01 Set #REGa to #N$00 which is used just for the comparison.
@ $AC14 label=RoomExitsCount_Loop
  $AC14,$01 Does this room have an exit?
  $AC15,$02 Jump to #R$AC18 if this room doesn't have an exit for this
. position.
  $AC17,$01 Increment the valid exits count by one.
@ $AC18 label=RoomExitsCount_Skip
  $AC18,$01 Move to the next byte of room data.
  $AC19,$02 Decrease the exits counter by one and loop back to #R$AC14 until
. all the exits have been checked.
N $AC1B Process the exits count result.
  $AC1B,$03 Jump to #R$AC86 if no exits were found.
  $AC1E,$05 Jump to #R$AC45 if more than #N$01 exit was found.
N $AC23 Only one exit was found:
N $AC23 Print "#STR$A8AA,$08($b==$FF)".
  $AC23,$03 #REGhl=#R$A8AA.
  $AC26,$03 Call #R$A585.
  $AC29,$02 Retrieve the room data pointer and load it into #REGhl.
  $AC2B,$04 Set a pointer in #REGix to #R$AAE2.
  $AC2F,$01 Set #REGa to #N$00 which is used just for the comparison.
  $AC30,$02 Jump to #R$AC37.
N $AC32 Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $AC32 label=RoomCheckForExit_Loop
  $AC32,$01 Move to the next byte of room data.
  $AC33,$04 Increment the direction name table pointer by two.
@ $AC37 label=RoomCheckForExit
  $AC37,$03 Jump to #R$AC32 if the current exit isn't a valid exit.
  $AC3A,$06 Get the direction name from the direction name table.
  $AC40,$03 Call #R$A585 to print the direction name.
  $AC43,$02 Jump to #R$AC80.
N $AC45 More than one exit was found:
N $AC45 Print "#STR$A897,$08($b==$FF)".
@ $AC45 label=RoomMultipleExits
  $AC45,$03 #REGhl=#R$A897.
  $AC48,$03 Call #R$A592.
  $AC4B,$02 Retrieve the room data pointer and load it into #REGhl.
  $AC4D,$04 Set a pointer in #REGix to #R$AAE2.
  $AC51,$01 Set #REGa to #N$00 which is used just for the comparison.
  $AC52,$02 Jump to #R$AC5A.
N $AC54 So as not to corrupt the pointer to the room data (as #REGhl is also
. used when printing), it's temporarily held in #REGde.
@ $AC54 label=RoomExits_Initialise
  $AC54,$01 Switch back the #REGde and #REGhl registers.
N $AC55 Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $AC55 label=RoomCheckForExits_Loop
  $AC55,$01 Move to the next byte of room data.
  $AC56,$04 Increment the direction name table pointer by two.
@ $AC5A label=RoomCheckForExits
  $AC5A,$03 Jump to #R$AC55 if the current exit isn't a valid exit.
  $AC5D,$01 Temporarily store the room data pointer in #REGde.
  $AC5E,$06 Get the direction name from the direction name table.
  $AC64,$03 Call #R$A585 to print the direction name.
  $AC67,$01 Decrease the valid exits count by one.
  $AC68,$05 Jump to #R$AC80 if there are no more exits to process.
  $AC6D,$02 Jump to #R$AC77 if there is only one exit left to process.
N $AC6F #HTML(Print a comma character: "<code>#CHR$2C</code>".)
  $AC6F,$02 #REGa=#N$2C.
  $AC71,$03 Call #R$A5A4.
  $AC74,$01 Reset #REGa back to #N$00 for the comparison.
  $AC75,$02 Jump back to #R$AC54 to continue processing.
@ $AC77 label=RoomExits_PrintAmpersand
N $AC77 Print "#STR$A893,$08($b==$FF)".
  $AC77,$03 #REGhl=#R$A893.
  $AC7A,$03 Call #R$A585.
  $AC7D,$01 Reset #REGa back to #N$00 for the comparison.
  $AC7E,$02 Jump to #R$AC54 to continue processing.
N $AC80 Print "#STR$AA15,$08($b==$FF)".
@ $AC80 label=RoomExits_PrintFullStop
  $AC80,$03 #REGhl=#R$AA15.
  $AC83,$03 Call #R$A592.
N $AC86 Are there any objects here?
@ $AC86 label=RoomExits_YouCanSee
  $AC86,$03 #REGa=*#R$A7C3.
  $AC89,$03 Call #R$AF39.
  $AC8C,$01 Return if no objects were found at this location.
N $AC8D Print "#STR$A884,$08($b==$FF)".
  $AC8D,$03 #REGhl=#R$A884.
  $AC90,$03 Call #R$A592.
N $AC93 Print the objects at this location.
  $AC93,$03 #REGa=*#R$A7C3.
  $AC96,$03 Call #R$AB97.
  $AC99,$01 Return.

c $AC9A Get Room Pointer
@ $AC9A label=GetRoomPointer
E $AC9A View the equivalent code in #JEWELS$C302.
R $AC9A O:HL Pointer to the room data
M $AC9A,$06 Load the *#R$A7C3 into #REGde.
  $AC9A,$04 #REGe=*#R$A7C3.
  $AC9E,$02 #REGd=#N$00.
  $ACA0,$02 Copy it into #REGhl.
  $ACA2,$05 Mulitply by #N$06.
  $ACA7,$05 Add the result to the base address *#R$A7CA, stored in #REGhl.
  $ACAC,$01 Return.

c $ACAD Print Room Description
@ $ACAD label=Print_RoomDescription
E $ACAD View the equivalent code in #JEWELS$C315.
R $ACAD A Line number to begin printing
  $ACAD,$03 Write #REGa to *#R$A82E.
  $ACB0,$03 Call #R$A56A.
  $ACB3,$03 #REGa=*#R$A7C3.
  $ACB6,$04 #REGix=*#R$A7D2.
  $ACBA,$01 Copy the room number into #REGe.
  $ACBB,$03 Call #R$AB88.
  $ACBE,$03 Call #R$A592.
  $ACC1,$01 Return.

g $ACC2 Temporary Storage Command Buffer Pointer
@ $ACC2 label=TempStore_CommandBufferPointer
W $ACC2,$02

g $ACC4 Temporary Storage Command Buffer Count
@ $ACC4 label=TempStore_CommandBufferCount
W $ACC4,$02

t $ACC6 Messaging: "SPACE<BS><BS>SPACE<BS>"
@ $ACC6 label=Messaging_SpaceBackspaceBackspaceSpaceBackspace
D $ACC6 Used by the routine at #R$AD32.
  $ACC6,$03 "#STR$ACC6,$08($b==$FF)".
N $ACC9 Messaging: "SPACE<BS>"
@ $ACC9 label=Messaging_SpaceBackspace
D $ACC9 Used by the routine at #R$AD32.
  $ACC9,$02 "#STR$ACC9,$08($b==$FF)".
B $ACCB,$01 Terminator.

t $ACCC Messaging: "_<BS>"
@ $ACCC label=Messaging_UnderscoreBackspace
D $ACCC Used by the routine at #R$AD32.
  $ACCC,$02 "#STR$ACCC,$08($b==$FF)".
B $ACCE,$01 Terminator.

c $ACCF Print Cursor
@ $ACCF label=Print_Cursor
  $ACCF,$01 Stash #REGhl on the stack.
N $ACD0 Print "#STR$ACCC,$08($b==$FF)".
  $ACD0,$03 #REGhl=#R$ACCC.
  $ACD3,$03 Call #R$A585.
  $ACD6,$01 Restore #REGhl from the stack.
  $ACD7,$01 Return.

c $ACD8 Is Character A Delimiter
@ $ACD8 label=IsDelimiter
R $ACD8 O:F The zero flag is set if a delimiter is found
  $ACD8,$02 Stash #REGhl and #REGbc on the stack.
  $ACDA,$03 #REGhl=#R$A663.
  $ACDD,$03 Fetch the delimiter count and store it in #REGbc.
  $ACE0,$01 Move #REGhl to point to the delimiter table.
  $ACE1,$02 Search for matching delimiters.
  $ACE3,$02 Restore #REGbc and #REGhl from the stack.
  $ACE5,$01 Return.

c $ACE6 Print User Input To Screen
@ $ACE6 label=Print_UserInputToScreen
R $ACE6 A User input keypress
R $ACE6 HL Pointer to the command buffer
  $ACE6,$01 Stash the user input keypress on the stack.
  $ACE7,$04 Jump to #R$ACF3 if "DELETE" was not pressed.
  $ACEB,$01 Stash the pointer to the command buffer on the stack.
N $ACEC Print "SPACE<BS>" to delete the letter from the screen.
  $ACEC,$03 #REGhl=#R$ACC9.
  $ACEF,$03 Call #R$A585.
  $ACF2,$01 Restore the pointer to the command buffer from the stack.
@ $ACF3 label=UserInputToScreen
  $ACF3,$01 Restore the user input keypress from the stack.
  $ACF4,$03 Call #R$A577.
N $ACF7 Print the user input keypress to the screen.
  $ACF7,$03 Call #R$A5A4.
  $ACFA,$01 Return.

c $ACFB
  $ACFB,$05 Stash #REGhl, #REGde, #REGbc and #REGix on the stack.
  $AD00,$03 #REGhl=*#R$A7C6.
  $AD03,$02 #REGc=#N$00.
  $AD05,$02 Jump to #R$AD14.
  $AD07,$01 #REGe=#REGb.
  $AD08,$02 #REGd=#N$00.
  $AD0A,$01 #REGhl+=#REGde.
  $AD0B,$01 #REGa=*#REGhl.
  $AD0C,$02 Compare #REGa with #N$2C.
  $AD0E,$02 Jump to #R$AD13 if #REGa is equal to #N$2C.
  $AD10,$01 Increment #REGc by one.
  $AD11,$02 Jump to #R$AD14.
  $AD13,$01 Increment #REGhl by one.
  $AD14,$05 Jump to #R$AD2C if *#REGhl is equal to #N$FF.
  $AD19,$04 #REGix=#R$A82F.
  $AD1D,$02 #REGb=#N$04.
  $AD1F,$06 Jump to #R$AD07 if *#REGix+#N$00 is not equal to *#REGhl.
  $AD25,$01 Increment #REGhl by one.
  $AD26,$02 Increment #REGix by one.
  $AD28,$02 Decrease counter by one and loop back to #R$AD1F until counter is zero.
  $AD2A,$01 #REGa=#REGc.
  $AD2B,$01 Set the carry flag.
  $AD2C,$05 Restore #REGix, #REGbc, #REGde and #REGhl from the stack.
  $AD31,$01 Return.

c $AD32 Handler: User Input
@ $AD32 label=Handler_UserInput
D $AD32 Handles keyboard input, tokenises commands and validates the
. vocabulary.
E $AD32 View the equivalent code in #JEWELS$C00A.
N $AD32 Reset the screen position to defaults.
  $AD32,$03 Call #R$A560.
  $AD35,$03 Call #R$A647.
N $AD38 Initialise the command buffer.
  $AD38,$03 #REGhl=#R$A7F2.
  $AD3B,$02 Initialise a letter counter in #REGb.
  $AD3D,$02 Jump to #R$AD41.
N $AD3F Main input loop - process each keypress.
@ $AD3F label=UserInput_Loop
  $AD3F,$01 Move to the next byte of the command buffer.
  $AD40,$01 Increment the letter counter by one.
@ $AD41 label=UserInput_Next
  $AD41,$03 Call #R$ACCF.
  $AD44,$03 Call #R$A53E.
  $AD47,$04 Jump to #R$AD5B if "DELETE" was not pressed.
N $AD4B The user pressed "DELETE".
  $AD4B,$04 Jump back to #R$AD41 if there hasn't been any input yet (nothing to
. delete).
N $AD4F There is input which can be deleted, so action a delete!
  $AD4F,$01 Temporarily stash the command buffer pointer in #REGde.
N $AD50 Print "SPACE BACKSPACE BACKSPACE SPACE BACKSPACE" to move the current
. print position on the screen to the previous character, and to delete the
. character present using a space.
  $AD50,$03 #REGhl=#R$ACC6.
  $AD53,$03 Call #R$A585.
N $AD56 Adjust the command buffer position and letter counter.
  $AD56,$01 Restore the command buffer pointer from #REGde.
  $AD57,$01 Decrease the command buffer pointer by one.
  $AD58,$01 Decrease the letter counter by one.
  $AD59,$02 Jump to #R$AD41.
N $AD5B Check which key the user pressed:
@ $AD5B label=ValidateUserInput
  $AD5B,$05 Jump to #R$AD6D if "ENTER" was pressed.
  $AD60,$04 If the keypress was any other control key (the value being under
. #N$20 ASCII "SPACE"), it's not valid input so jump back to #R$AD41.
  $AD64,$04 If the keypress was higher than #N$80, it's also not valid input so
. jump back to #R$AD41.
N $AD68 Is the command buffer full?
  $AD68,$05 Jump to #R$AD41 if the letter counter is #N$31.
N $AD6D Writes the keypress into the command buffer.
@ $AD6D label=UserInput_WriteKeypress
  $AD6D,$02 Write the user input key to *#REGhl.
  $AD6F,$03 Call #R$ACE6.
N $AD72 Did the user press "ENTER"?
  $AD72,$05 Jump to #R$AD3F if "DELETE" was not pressed.
N $AD77 The player pressed "ENTER" so begin to process the user input.
N $AD77 Clear down the user input tokens.
  $AD77,$03 #REGhl=#R$A824.
  $AD7A,$02 Set a counter in #REGb for all #N$0A user input tokens.
@ $AD7C label=EmptyUserInputTokens_Loop
  $AD7C,$02 Write a termination byte (#N$FF) to *#REGhl.
  $AD7E,$01 Increment #REGhl by one.
  $AD7F,$02 Decrease the user input tokens counter by one and loop back to
. #R$AD7C until all the tokens have been set to termination bytes (#N$FF).
N $AD81 Set up pointers for the command buffer, the user input tokens and the
. count of the number of user input tokens.
  $AD81,$03 #REGhl=#R$A7F2.
  $AD84,$04 #REGix=#R$A824.
  $AD88,$02 Set a counter in #REGc for the #N$0A user input tokens.
  $AD8A,$02 Jump to #R$ADF6.
N $AD8C What's been entered isn't parsable.
N $AD8C Print "#STR$A84F,$08($b==$FF)".
@ $AD8C label=UserInput_NotUnderstood
  $AD8C,$03 #REGhl=#R$A84F.
  $AD8F,$03 Call #R$A592.
  $AD92,$03 Jump to #R$AD32.
N $AD95 Process found word into user input token.
@ $AD95 label=ProcessFoundWord
  $AD95,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $AD98,$03 #REGhl=*#R$ACC2.
  $AD9B,$03 #REGde=#R$A82F.
  $AD9E,$03 #REGbc=#N($0004,$04,$04).
  $ADA1,$06 Jump to #R$ADA8 if *#R$ACC4 is greater than or equal to #REGc.
  $ADA7,$01 #REGc=#REGa.
N $ADA8 Copy the word (up to 4 characters into the four letter buffer).
@ $ADA8 label=CopyWordToBuffer
  $ADA8,$02 Copy 4 letters of the command buffer to the four letter buffer.
  $ADAA,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $ADAD,$01 Stash #REGhl on the stack.
N $ADAE Stash the vocabulary pointer for a separate check...
  $ADAE,$04 Stash *#R$A7C6 on the stack.
N $ADB2 Ignore any usage of "THE" - this is a very good idea! If the player
. enters: "EXAMINE THE SKULL", this ensures it's evaluated in the exact same
. way as "EXAMINE SKULL" (or really, "EXAM SKUL").
  $ADB2,$06 Write #R$A667 to *#R$A7C6.
  $ADB8,$03 Call #R$ACFB.
N $ADBB Do nothing with with this match - just restore the vocabulary pointer
. from the stack.
  $ADBB,$04 Restore *#R$A7C6 from the stack and write it back to *#R$A7C6.
  $ADBF,$01 Restore #REGhl from the stack.
  $ADC0,$02 Jump to #R$ADF6 if #REGa is less than #REGc.
  $ADC2,$03 Call #R$ACFB.
  $ADC5,$02 Jump to #R$ADEE if #REGa is less than #REGc.
N $ADC7 Nothing matched ... Inform the player.
N $ADC7 Print "#STR$A863,$08($b==$FF)".
  $ADC7,$03 #REGhl=#R$A863.
  $ADCA,$03 Call #R$A592.
N $ADCD #HTML(Print a double quote character: "<code>#CHR$22</code>".)
  $ADCD,$05 Call #R$A5A4 to print a double quote character (ASCII #N$22).
  $ADD2,$03 #REGhl=*#R$ACC4.
  $ADD5,$05 #REGhl+=*#R$ACC2.
  $ADDA,$02 Write #N$FF to *#REGhl.
  $ADDC,$01 Exchange the #REGde and #REGhl registers.
  $ADDD,$03 Call #R$A585.
N $ADE0 #HTML(Print a double quote character: "<code>#CHR$22</code>".)
  $ADE0,$05 Call #R$A5A4 to print another double quote character (ASCII #N$22).
N $ADE5 Print "#STR$AA15,$08($b==$FF)".
  $ADE5,$03 #REGhl=#R$AA15.
  $ADE8,$03 Call #R$A592.
  $ADEB,$03 Jump to #R$AD32.

  $ADEE,$03 Write #REGa to *#REGix+#N$00.
  $ADF1,$02 Increment #REGix by one.
  $ADF3,$01 Decrease #REGc by one.
  $ADF4,$02 Jump to #R$AE2D if #REGc is equal to #REGc.
N $ADF6 Token matching only uses four letters of every word so a buffer is used
. for processing.
N $ADF6 Start by clearing the buffer.
@ $ADF6 label=EmptyFourLetterBuffer
  $ADF6,$02 Stash the command buffer pointer and user input tokens counter on
. the stack.
  $ADF8,$03 Load #R$A82F into #REGhl.
  $ADFB,$02 Set a counter in #REGb for the #N$04 letters in the buffer.
@ $ADFD label=EmptyFourLetterBuffer_Loop
  $ADFD,$02 Write ASCII "SPACE" (#N$20) to *#REGhl.
  $ADFF,$01 Increment #REGhl by one.
  $AE00,$02 Decrease the letter buffer counter by one and loop back to #R$ADFD
. until all four letters have been cleared.
  $AE02,$02 Restore the user input tokens counter and command buffer pointer
. from the stack.
  $AE04,$01 Stash #REGde on the stack.
  $AE05,$02 Jump to #R$AE08.

  $AE07,$01 Increment #REGhl by one.
  $AE08,$01 Fetch a character from the command buffer.
  $AE09,$04 Jump to #R$AE29 if the character is "ENTER" (ASCII #N$0D).
  $AE0D,$03 Call #R$ACD8.
  $AE10,$02 Jump to #R$AE07 if the character is a delimiter.
  $AE12,$03 Write #REGhl to *#R$ACC2.
  $AE15,$03 #REGde=#N($0000,$04,$04).
  $AE18,$01 Increment #REGhl by one.
  $AE19,$01 Increment #REGde by one.
  $AE1A,$01 Fetch a character from the command buffer.
  $AE1B,$04 Jump to #R$AE24 if the character is "ENTER" (ASCII #N$0D).
  $AE1F,$03 Call #R$ACD8.
  $AE22,$02 Jump to #R$AE18 if the character was not a delimiter.
  $AE24,$04 Write #REGde to *#R$ACC4.
  $AE28,$01 Set the carry flag.
  $AE29,$01 Restore #REGde from the stack.
  $AE2A,$03 Jump to #R$AD95 if the carry flag is set.
  $AE2D,$08 Jump to #R$AD8C if *#R$A824 is equal to #N$FF.
  $AE35,$01 Return.

c $AE36 Parser: Validate Item
@ $AE36 label=Parser_ValidateItem
E $AE36 View the equivalent code in #JEWELS$C32A.
R $AE36 BC The position in the user input token of the object
R $AE36 O:F The carry flag is set when the item isn't present
  $AE36,$01 Adjust the counter for the sum.
  $AE37,$05 Calculate the index (*#R$A7E8-#REGc) and store the result in #REGe.
  $AE3C,$01 Stash #REGde on the stack.
  $AE3D,$07 Call #R$AB88 with *#R$A7D4.
  $AE44,$01 Restore #REGde from the stack.
  $AE45,$02 Jump to #R$AE48.
@ $AE47 label=ValidateItem_Loop
  $AE47,$01 Increment #REGhl by one.
@ $AE48 label=ValidateItem
  $AE48,$05 Jump to #R$AE53 if *#REGhl is equal to #N$FF.
  $AE4D,$03 Call #R$AE6B.
  $AE50,$02 Jump to #R$AE47 if the item wasn't found.
  $AE52,$01 Return.
N $AE53 The item being referenced isn't in the room or in the players inventory.
@ $AE53 label=Response_ItemNotHere
N $AE53 Print "#STR$A8DB,$08($b==$FF)".
  $AE53,$03 #REGhl=#R$A8DB.
  $AE56,$03 Call #R$A585.
N $AE59 Print the object name.
  $AE59,$07 Call #R$AB88 with *#R$A7D6.
  $AE60,$03 Call #R$A585.
N $AE63 Print "#STR$A8E8,$08($b==$FF)".
  $AE63,$03 #REGhl=#R$A8E8.
  $AE66,$03 Call #R$A592.
  $AE69,$01 Set the carry flag.
  $AE6A,$01 Return.

c $AE6B Validate If Item Is Present
@ $AE6B label=ValidateItemPresent
E $AE6B View the equivalent code in #JEWELS$C35F.
R $AE6B A Object ID
R $AE6B F Z flag set if the object is available
  $AE6B,$02 Stash #REGhl and #REGde on the stack.
  $AE6D,$03 Store the object ID in #REGde.
  $AE70,$03 #REGhl=#R$A66C.
  $AE73,$01 Add the object ID to the object/ event locations table.
  $AE74,$06 Jump to #R$AE7D if the object/ event table states that it's located
. in *#R$A7C3. Note also sets/ unsets the Z flag accordingly.
N $AE7A Check the players inventory, as an object can still be used if it's being held.
  $AE7A,$03 Lastly, set the Z flag if the item is in the players inventory.
@ $AE7D label=Handler_Objects_Return
N $AE7D Housekeeping; restore #REGde and #REGhl to their previous values.
  $AE7D,$02 Restore #REGde and #REGhl from the stack.
  $AE7F,$01 Return.

c $AE80 Match Phrase Tokens
@ $AE80 label=MatchPhraseTokens
D $AE80 Matches phrase patterns with multiple variations against user input
. tokens.
E $AE80 View the equivalent code in #JEWELS$C37F.
R $AE80 HL A pointer to phrase token data
R $AE80 O:F The Z flag is set if the input matches any pattern
  $AE80,$01 Switch the phrase token pointer to #REGde.
  $AE81,$02 Jump to #R$AE84.
N $AE83 Skip the separator.
@ $AE83 label=MatchPhraseTokens_Loop
  $AE83,$01 Increment the phrase token pointer by one.
N $AE84 Fetch the second user input token (not the first, as the first token
. is the verb and the second token onwards gives the context).
N $AE84 For example; "GET" (verb) "KEG OF GUNPOWDER" (direct object).
@ $AE84 label=MatchPhraseTokens_Start
  $AE84,$03 #REGhl=#R$A825.
  $AE87,$02 Jump to #R$AE8B.
N $AE89 The tokens matched so advance both pointers.
@ $AE89 label=MatchTokens_Loop
  $AE89,$01 Increment the input token pointer by one.
  $AE8A,$01 Increment the pattern token pointer by one.
N $AE8B Keep looping if the tokens match.
@ $AE8B label=CompareTokens
  $AE8B,$04 Jump to #R$AE89 if the pattern token and the input token are the
. same.
N $AE8F The tokens are different, but is it just that we are at the end of the
. pattern?
  $AE8F,$04 Jump to #R$AE97 unless this is the terminator character (#N$FE).
N $AE93 Yes! The input tokens all matched against the phrase pattern tokens.
  $AE93,$04 Return with Z flag result.
N $AE97 The tokens are different, but is this a separator character?
@ $AE97 label=CheckSeparator
  $AE97,$04 Jump to #R$AEA1 if this is not the separator (#N$FD).
  $AE9B,$05 Jump to #R$AE83 if the input tokens are not complete.
  $AEA0,$01 Return.
N $AEA1 The current variant doesn't match, so skip to the next one.
@ $AEA1 label=MatchPhraseTokens_Next
  $AEA1,$01 Increment the phrase token pointer by one.
  $AEA2,$05 Jump to #R$AEAD if the terminator has been reached (#N$FE).
  $AEA7,$04 Jump to #R$AEA1 if this is not the separator (#N$FD).
  $AEAB,$02 Jump to #R$AE83.
N $AEAD The input doesn't match any patterns.
@ $AEAD label=MatchPhraseTokens_Return
  $AEAD,$01 Clear the Z flag.
  $AEAE,$01 Return.

c $AEAF Parser: Count Item References
@ $AEAF label=Parser_CountItems
D $AEAF Count how many tokens in the user input refer to game items.
E $AEAF View the equivalent code in #JEWELS$C3AE.
R $AEAF O:A The number of references to items in the user input tokens
R $AEAF O:F The Z flag is set when there are no items present in the input
  $AEAF,$03 Set a pointer to #R$A824 in #REGhl.
  $AEB2,$02 Set a token count in #REGb of #N$0A which is the total length of
. the user input tokens.
  $AEB4,$02 Initialise the item counter held in #REGe to #N$00.
@ $AEB6 label=Parser_CountItems_Loop
  $AEB6,$01 Fetch a user input token.
  $AEB7,$04 Jump to #R$AECE if the terminator character (#N$FF) has been
. reached.
  $AEBB,$02 Stash the token pointer and token counter on the stack.
  $AEBD,$03 #REGhl=*#R$A7D8.
  $AEC0,$04 Fetch the count of the number of items in the table from *#R$A7E8.
  $AEC4,$02 Search to see if the item room ID is in the table.
  $AEC6,$02 Restore the token counter and token pointer from the stack.
  $AEC8,$02 Jump to #R$AECB if this token doesn't refer to a game item.
N $AECA This token does point to a game item, so increase the item counter.
  $AECA,$01 Increment item counter by one.
@ $AECB label=Parser_CountItems_Skip
  $AECB,$01 Move to the next token.
  $AECC,$02 Decrease the token counter by one and loop back to #R$AEB6 until
. all the tokens have been evaluated.
@ $AECE label=Parser_CountItems_Process
  $AECE,$02 Transfer the item count into #REGa and set flags accordingly.
  $AED0,$01 Return.

c $AED1 Item Locator
@ $AED1 label=ItemLocator
E $AED1 View the equivalent code in #JEWELS$C3D0.
R $AED1 A Item ID
R $AED1 O:A Either a room ID, #N$01 for the players inventory, or #N$00 for when the item is disabled
  $AED1,$03 Load the item ID into #REGde.
  $AED4,$04 #REGhl=#R$A66C+#REGde.
  $AED8,$01 Fetch the item location and store it in #REGa.
  $AED9,$01 Return.

c $AEDA Is Object In Inventory?
@ $AEDA label=CheckObjectInInventory
E $AEDA View the equivalent code in #JEWELS$C3E4.
R $AEDA A Object ID
R $AEDA O:F Z flag set if the item is in the players inventory
N $AEDA The #R$AED1 routine returns with #REGa containing the room ID of the
. requested object.
  $AEDA,$03 Call #R$AED1.
  $AEDD,$02 Compare #REGa with #N$01 (inventory).
  $AEDF,$01 Return.

c $AEE0 Handler: Destroy Item/ Event
@ $AEE0 label=Handler_DestroyItemEvent
D $AEE0 Updates a given item/ event ID so it's then "inactive" (has a location
. ID of #N$00).
E $AEE0 View the equivalent code in #JEWELS$C3EA.
R $AEE0 A Item/ event ID
  $AEE0,$01 Load the item/ event ID into #REGb.
  $AEE1,$02 Set the room ID to #N$00 which will deactivate the item/ event.
  $AEE3,$03 Call #R$AF08.
  $AEE6,$01 Return.

c $AEE7 Handler: Update Item/ Event For The Current Room
@ $AEE7 label=Handler_UpdateItemEventCurrentRoom
D $AEE7 Updates a given item/ event ID so it appears in the current room. Used
. for example, when an item is dropped (so it changes from being #N$01 - in the
. players inventory, to the current room ID).
E $AEE7 View the equivalent code in #JEWELS$C3F1.
R $AEE7 A Item/ event ID
  $AEE7,$01 Load the item/ event ID into #REGb.
  $AEE8,$04 Load #REGc with *#R$A7C3.
  $AEEC,$03 Call #R$AF08.
  $AEEF,$01 Return.

c $AEF0 Set Scenic Event As Triggered
@ $AEF0 label=ScenicEventTriggered
E $AEF0 View the equivalent code in #JEWELS$C3FA.
R $AEF0 A Scenic event ID (+#N$80)
  $AEF0,$01 Copy the scenic event ID into #REGb.
  $AEF1,$02 Set #REGc to #N$FF which denotes that the event has fired already
. and shouldn't be repeated.
  $AEF3,$03 Call #R$AF08.
  $AEF6,$01 Return.

c $AEF7 Check Item From Item Group Present
@ $AEF7 label=CheckItemGroupPresent
R $AEF7 HL Pointer to item group data
R $AEF7 O:A The related item ID from the item group data which is present
R $AEF7 O:F Z flag is set when no items from the group are present
  $AEF7,$02 Jump to #R$AEFA.
@ $AEF9 label=CheckItemGroupPresent_Loop
  $AEF9,$01 Increment #REGhl by one.
@ $AEFA label=CheckItemGroupPresent_Process
  $AEFA,$01 Fetch an item ID from the item group data in *#REGhl.
  $AEFB,$04 Jump to #R$AF06 if this is the terminator byte (#N$FF).
  $AEFF,$03 Call #R$AE6B.
  $AF02,$02 Jump back to #R$AEF9 if the item is not present either in the room or
. in the players inventory, to evaluate the next item ID.
N $AF04 The current item ID is either in the current room or in the players
. inventory, so restore the value and return with it in #REGa.
  $AF04,$01 #REGa=*#REGhl.
  $AF05,$01 Return.
N $AF06 Got to the end and didn't locate the item anywhere.
@ $AF06 label=CheckItemGroupPresent_Return
  $AF06,$01 Set flags.
  $AF07,$01 Return.

c $AF08 Handler: Update Item Location
@ $AF08 label=Handler_UpdateItemLocation
R $AF08 B Item ID
R $AF08 C Room ID
  $AF08,$03 #REGhl=#R$A66C.
  $AF0B,$03 Load the item ID into #REGde.
  $AF0E,$01 Add the item ID to #R$A66C.
  $AF0F,$01 Update the table with the new room ID in #REGc.
  $AF10,$01 Return.

c $AF11
R $AF11 HL Pointer to item group data
R $AF11 O:A The found index
  $AF11,$02 Initialise an index counter in #REGb to #N$00.
  $AF13,$02 Jump to #R$AF17.
N $AF15 Move past the termination byte in the item group.
  $AF15,$01 Increment the index counter in #REGb by one.
  $AF16,$01 Increment #REGhl by one.
  $AF17,$03 Call #R$AEF7.
  $AF1A,$02 Jump back to #R$AF15 until an item from the item group is matched.
N $AF1C An index was found.
  $AF1C,$01 Store the index from #REGb into #REGa.
  $AF1D,$01 Return.

c $AF1E Transform Item
@ $AF1E label=TransformItem
R $AF1E B From item ID
R $AF1E C To item ID
D $AF1E Rather than use item properties, the game just has separate objects
. that don't exist until an action is performed.
.
. An example is:
. #TABLE(default,centre,centre)
. { =h Item ID | =h Item Name }
. { #N$27 | #ITEM$27 }
. { #N$28 | #ITEM$28 }
. TABLE#
. When the match is lit by the player; item #N$02 is destroyed and replaced
. with item #N$03.
E $AF1E View the equivalent code in #JEWELS$C426.
  $AF1E,$04 Call #R$AED1 with the source item ID.
N $AF22 #REGa now contains the location of the source ID.
  $AF22,$02 Stash the item IDs and source item room ID on the stack.
  $AF24,$05 Call #R$AF08 and disable the source item.
  $AF29,$02 Restore the source item room ID and item IDs from the stack.
N $AF2B Activate the destination item in the same room.
  $AF2B,$01 Load the destination item ID into #REGb.
  $AF2C,$01 Load the source room ID into #REGc.
  $AF2D,$03 Call #R$AF08.
  $AF30,$01 Return.

c $AF31 Check Item In Current Room
@ $AF31 label=CheckItemInCurrentRoom
R $AF31 A Item ID
R $AF31 O:F Z flag is set if the item is in the current room
N $AF31 Fetch the room ID of the requested item using the table at #R$A66C.
  $AF31,$03 Call #R$AED1.
  $AF34,$04 Compare the room ID with *#R$A7C3.
  $AF38,$01 Return.

c $AF39 Check Room Objects
@ $AF39 label=CheckRoomObjects
E $AF39 View the equivalent code in #JEWELS$C439.
R $AF39 A Room number
R $AF39 O:A #N$00 or #N$01 if objects are found or not
  $AF39,$03 #REGhl=#R$A66C.
  $AF3C,$04 #REGbc=*#R$A7E6.
@ $AF40 label=CheckRoomObjects_Loop
  $AF40,$02 Search for the room number in the table.
  $AF42,$01 Return if no objects are found.
  $AF43,$01 Stash the object location table pointer on the stack.
  $AF44,$03 Call #R$AF56.
  $AF47,$01 Restore the object location table pointer from the stack.
  $AF48,$02 Jump to #R$AF54 if there are no objects found here.
  $AF4A,$01 Temporarily store #REGa in #REGe.
  $AF4B,$02 Are there more objects to check?
  $AF4D,$01 Restore the #REGa register.
  $AF4E,$02 Jump to #R$AF40 if there are more objects to check.
N $AF50 Set the "successful" output.
  $AF50,$02 Set #REGa to #N$01 to indicate that objects were found.
  $AF52,$01 Set flags.
  $AF53,$01 Return.
N $AF54 Set the "failure" output.
@ $AF54 label=NoRoomObjectsFound
  $AF54,$01 Set #REGa to #N$00 to indicate that no objects were found.
  $AF55,$01 Return.

c $AF56 Validate Object
@ $AF56 label=ValidateObject
E $AF56 View the equivalent code in #JEWELS$C456.
R $AF56 BC Object counter
R $AF56 O:F Z is unset if the object is valid, unset when invalid
  $AF56,$02 Stash #REGaf and #REGbc on the stack.
  $AF58,$01 Adjust the object counter.
  $AF59,$03 #REGa=*#R$A7E6.
  $AF5C,$02 Calculate the index and store the result in #REGe.
  $AF5E,$04 #REGix=*#R$A7CC.
  $AF62,$03 Call #R$AB88.
  $AF65,$01 Restore the object counter from the stack.
  $AF66,$04 Jump to #R$AF6D if the object is invalid.
  $AF6A,$01 Restore the object type from the stack.
  $AF6B,$01 Clear the Z flag.
  $AF6C,$01 Return.
@ $AF6D label=InvalidObject
  $AF6D,$01 Restore #REGaf from the stack.
  $AF6E,$01 Set the Z flag.
  $AF6F,$01 Return.

c $AF70 Parser: Validate No Direct Object
@ $AF70 label=Parser_ValidateNoDirectObject
D $AF70 The opposite of #R$AF7B, checks that there's no direct object.
E $AF70 View the equivalent code in #JEWELS$C470.
R $AF70 O:F The Z flag is set when there's no direct object present
R $AF70 O:F The carry flag is set when there's a second token set
  $AF70,$06 Return if the second token (*#R$A825) is the terminator
. character (#N$FF).
N $AF76 Print "#STR$A9D6,$08($b==$FF)".
  $AF76,$03 Call #R$AAEE.
  $AF79,$01 Set the carry flag to indicate the command is malformed.
  $AF7A,$01 Return.

c $AF7B Parser: Validate Direct Object
@ $AF7B label=Parser_ValidateDirectObject
D $AF7B In most adventure games, the structure for a command is "verb + direct
. object". This is usually how the player interacts with the game world.
. The verb describes the action, and the direct object is what the action is
. performed on. For example; "TAKE SHOE" uses the verb "TAKE" on the direct
. object "SHOE".
E $AF7B View the equivalent code in #JEWELS$C47B.
R $AF7B O:A The number of references to items in the user input tokens
R $AF7B O:F The carry flag is set when the command is malformed
N $AF7B The first token is the verb, so target the second token for the direct
. object.
  $AF7B,$03 Fetch the #R$A825(second token from the user input) and store it in
. #REGa.
  $AF7E,$04 Jump forward to #R$AF87 if the token is anything other than the
. terminator character (#N$FF).
N $AF82 The token was the terminator character (#N$FF), so the sentence is
. malformed.
N $AF82 E.g. They tried "TAKE" but didn't write anything after it.
  $AF82,$03 Call #R$AAF5.
  $AF85,$01 Set the carry flag to indicate this call was a failure.
  $AF86,$01 Return.
N $AF87 Process the direct object.
@ $AF87 label=DirectObject_Process
  $AF87,$03 Call #R$AEAF.
  $AF8A,$01 Return if there is at least one valid item mentioned in the user
. input tokens.
N $AF8B Any references are invalid.
N $AF8B Print "#STR$A9D6,$08($b==$FF)".
  $AF8B,$03 Call #R$AAEE.
  $AF8E,$01 Set the carry flag to indicate the command is malformed.
  $AF8F,$01 Return.

c $AF90 Parser: Validate Input Tokens
@ $AF90 label=Parser_ValidateInputTokens
E $AF90 View the equivalent code in #JEWELS$C490.
R $AF90 O:A The number of references to items in the user input tokens
R $AF90 O:F The zero flag is set when there is only a verb present
R $AF90 O:F The zero flag is unset when there is at least one valid direct object
R $AF90 O:F The carry flag is set when the command is malformed
N $AF90 The first token is the verb, so target the second token for the direct
. object.
  $AF90,$03 Fetch the #R$A825(second token from the user input) and store it in
. #REGa.
  $AF93,$03 Return if there is no second token.
N $AF96 There is a second token; so validate all direct objects after this
. point.
  $AF96,$03 Call #R$AEAF.
  $AF99,$01 Return if there is at least one valid item mentioned in the user
. input tokens.
N $AF9A Any references are invalid.
N $AF9A Print "#STR$A9D6,$08($b==$FF)".
  $AF9A,$03 Call #R$AAEE.
  $AF9D,$01 Set the carry flag.
  $AF9E,$01 Return.

c $AF9F Parser: Validate Two Direct Objects
@ $AF9F label=Parser_ValidateTwoDirectObjects
E $AF9F View the equivalent code in #JEWELS$C49F.
R $AF9F O:F The carry flag is set when the command is malformed
  $AF9F,$03 Call #R$AF7B.
  $AFA2,$01 Return if there is no direct object in the user input (so the
. command is malformed).
N $AFA3 #REGa now contains the count of the number of valid direct objects.
  $AFA3,$04 Jump to #R$AFAC if the number of valid direct objects in the user
. input is not #N$01.
N $AFA7 There is only one valid direct objects in the user input and the
. command needs two...
N $AFA7 Print "#STR$A9BD,$08($b==$FF)".
  $AFA7,$03 Call #R$AAF5.
  $AFAA,$01 Set the carry flag.
  $AFAB,$01 Return.
N $AFAC There are two or more valid direct objects in the user input.
@ $AFAC label=ValidateTwoDirectObjects
  $AFAC,$04 Jump to #R$AFB2 if the number of valid direct objects in the user
. input is greater than or equal to #N$03.
  $AFB0,$01 Set zero flag.
  $AFB1,$01 Return.
N $AFB2 There are more than two valid direct objects in the user input.
@ $AFB2 label=ValidateTwoDirectObjects_TooMany
N $AFB2 Print "#STR$A9D6,$08($b==$FF)".
  $AFB2,$03 Call #R$AAEE.
  $AFB5,$01 Set the carry flag.
  $AFB6,$01 Return.

c $AFB7 Parser: Validate Any Direct Object
@ $AFB7 label=Parser_ValidateAnyDirectObject
D $AFB7 In most adventure games, the structure for a command is "verb + direct
. object". This is usually how the player interacts with the game world.
. The verb describes the action, and the direct object is what the action is
. performed on. For example; "TAKE SHOE" uses the verb "TAKE" on the direct
. object "SHOE".
E $AFB7 View the equivalent code in #JEWELS$C4B7.
R $AFB7 O:A The number of valid direct objects in the user input tokens
R $AFB7 O:F The carry flag is set when the command is malformed
R $AFB7 O:F The zero flag is set when there are no valid direct objects present in the input tokens
N $AFB7 The first token is the verb, so target the second token for the direct
. object.
  $AFB7,$03 Fetch the #R$A825(second token from the user input) and store it in
. #REGa.
  $AFBA,$04 Jump forward to #R$AFC3 if the token is anything other than the
. terminator character (#N$FF).
N $AFBE The token was the terminator character (#N$FF), so the sentence is
. malformed.
N $AFBE E.g. They tried "TAKE" but didn't write anything after it.
N $AFBE Print "#STR$A9BD,$08($b==$FF)".
  $AFBE,$03 Call #R$AAF5.
  $AFC1,$01 Set the carry flag to indicate this call was a failure.
  $AFC2,$01 Return.
N $AFC3 The user input tokens have a direct object, return how many are in the
. command buffer.
@ $AFC3 label=ValidateAnyDirectObject
  $AFC3,$03 Call #R$AEAF.
  $AFC6,$01 Return.

c $AFC7 Parser: Process Item
@ $AFC7 label=Parser_ProcessItem
E $AFC7 View the equivalent code in #JEWELS$C4C7.
  $AFC7,$03 #REGhl=#R$A824.
  $AFCA,$02 Set a counter of #N$0A in #REGb of the maximum number of tokens
. available in the user input.
@ $AFCC label=ProcessItem_Loop
  $AFCC,$01 Fetch a token byte from the user input pointer.
  $AFCD,$03 Return if the terminator has been reached (#N$FF).
  $AFD0,$02 Stash the user input token pointer and max count on the stack.
  $AFD2,$03 Load *#R$A7D8 into #REGhl.
  $AFD5,$04 Load *#R$A7E8 into #REGbc.
  $AFD9,$02 Search for matching objects.
  $AFDB,$02 Jump to #R$AFE5 the current token wasn't found in the table.
  $AFDD,$03 Call #R$AE36.
  $AFE0,$02 Jump to #R$AFE5 if the carry flag is not set.
  $AFE2,$02 Restore the max count and user input token pointer from the stack.
  $AFE4,$01 Return.
@ $AFE5 label=ProcessItem_Next
  $AFE5,$02 Restore the max count and user input token pointer from the stack.
  $AFE7,$01 Increment the user input token pointer by one.
  $AFE8,$02 Decrease the max count by one and loop back to #R$AFCC until all of
. the user input tokens have been evaluated.
  $AFEA,$01 Return.

c $AFEB Handler: Scenic Events
@ $AFEB label=Handler_ScenicEvents
D $AFEB Handles checking if a scenic event should occur ... and also, handles
. jumping to the correct related scenic event routine to action it.
E $AFEB View the equivalent code in #JEWELS$C4EB.
  $AFEB,$03 #REGa=*#R$A7EE.
  $AFEE,$02 Return if *#R$A7EE is zero.
  $AFF0,$01 #REGb=#REGa.
  $AFF1,$03 #REGhl=*#R$A7E2.
  $AFF4,$02 Jump to #R$AFF7.
@ $AFF6 label=Handler_ScenicEvents_Loop
  $AFF6,$01 Increment #REGhl by one.
@ $AFF7 label=ScenicEvents_Process
  $AFF7,$01 #REGa=*#REGhl.
  $AFF8,$03 Call #R$AE6B.
  $AFFB,$02 Jump to #R$B01C if #REGhl is not equal to #REGa.
N $AFFD An event was found to be processed!
N $AFFD First though, stash away the current pointer and index in the search,
. so this can be resumed later.
  $AFFD,$03 Write #REGhl to *#R$A83B.
  $B000,$04 Write #REGbc to *#R$A83D.
N $B004 Calculate the event index and get the event handler.
  $B004,$05 #REGe=*#R$A7EE-#REGb.
  $B009,$04 Load #REGix with *#R$A7DE which contains a pointer to the scenic
. event rountines jump table.
  $B00D,$03 Call #R$AB88.
  $B010,$04 Push #R$B015 onto the stack (as the return address).
  $B014,$01 Jump to the event handler held by #REGhl.
N $B015 This is the return point after the handler has finished executing.
@ $B015 label=ScenicEvents_PostProcessing
  $B015,$03 Restore *#R$A83B to #REGhl.
  $B018,$04 Restore *#R$A83D to #REGbc.
@ $B01C label=ScenicEvents_Next
  $B01C,$02 Decrease the event counter by one and loop back to #R$AFF6 until
. all events have been processed.
  $B01E,$01 Return.

c $B01F
E $B01F View the equivalent code in #JEWELS$C520.
  $B01F,$01 #REGc=#REGa.
  $B020,$03 #REGa=*#R$A7EE.
  $B023,$03 Jump to #R$B03D if *#R$A7EE is zero.
  $B026,$01 #REGb=#REGa.
  $B027,$03 #REGhl=*#R$A7E2.
  $B02A,$02 Jump to #R$B02D.
  $B02C,$01 Increment #REGhl by one.
  $B02D,$01 #REGa=*#REGhl.
  $B02E,$03 Call #R$AE6B.
  $B031,$02 Jump to #R$B03B if #REGhl is not equal to #REGa.
  $B033,$02 Stash #REGhl and #REGbc on the stack.
  $B035,$01 #REGb=*#REGhl.
  $B036,$03 Call #R$AF08.
  $B039,$02 Restore #REGbc and #REGhl from the stack.
  $B03B,$02 Decrease counter by one and loop back to #R$B02C until counter is zero.
  $B03D,$04 Write #REGc to *#R$A7C3.
  $B041,$05 Return if *#R$A787 is zero.
  $B046,$02 #REGb=#N$08.
  $B048,$03 #REGhl=#R$A788.
  $B04B,$01 #REGc=#REGa.
  $B04C,$02 Jump to #R$B04F.
  $B04E,$01 Increment #REGhl by one.
  $B04F,$02 Shift #REGc right.
  $B051,$02 Jump to #R$B05B if #REGhl is greater than or equal to #REGa.
  $B053,$01 #REGa=*#REGhl.
  $B054,$02 Stash #REGhl and #REGbc on the stack.
  $B056,$03 Call #R$AEE7.
  $B059,$02 Restore #REGbc and #REGhl from the stack.
  $B05B,$02 Decrease counter by one and loop back to #R$B04E until counter is zero.
  $B05D,$01 Return.

c $B05E Handler: Match Verb
@ $B05E label=Handler_MatchVerb
E $B05E View the equivalent code in #JEWELS$C556.
  $B05E,$03 Load #REGhl with *#R$A7E0.
  $B061,$04 Set the length of the table from *#R$A7EA into #REGbc.
  $B065,$05 Search *#R$A7E0 for *#R$A824.
  $B06A,$02 Jump to #R$B073 if *#R$A824 was found in the table.
N $B06C The verb wasn't found.
N $B06C Print "#STR$A84F,$08($b==$FF)".
  $B06C,$03 #REGhl=#R$A84F.
  $B06F,$03 Call #R$A592.
  $B072,$01 Return.
N $B073 The verb token was found in the table, so jump to the appropriate
. routine.
@ $B073 label=Handler_Verb
M $B073,$06 Calculate the index using *#R$A7EA-#REGc-#N$01, and store the
. result in #REGe.
  $B073,$03 #REGa=*#R$A7EA.
  $B076,$01 #REGa-=#REGc.
  $B077,$01 Decrease #REGa by one.
  $B078,$01 #REGe=#REGa.
  $B079,$04 #REGix=*#R$A7DA.
  $B07D,$03 Call #R$AB88.
  $B080,$01 Jump to the verb handler held by #REGhl.

c $B081 Pause, Print String And Scroll
@ $B081 label=PausePrintStringAndScroll
D $B081 For dramatic effect! Used when an event occurs.
E $B081 View the equivalent code in #JEWELS$C579.
  $B081,$05 Call #R$A5C2 using #N$19 HALT loops (for a short pause).
  $B086,$03 Call #R$A592.
  $B089,$01 Return.

c $B08A Generate Random Number
@ $B08A label=GenerateRandomNumber
E $B08A View the equivalent code in #JEWELS$C582.
R $B08A A Maximum value of generated number
  $B08A,$01 Stash #REGbc on the stack.
  $B08B,$01 Store the maximum number in #REGc.
  $B08C,$03 Call #R$A5C6.
  $B08F,$01 Use the frames number as a loop counter in #REGb.
  $B090,$01 Restore the maximum number value back to #REGa.
@ $B091 label=GenerateRandomNumber_Loop
  $B091,$01 Decrease the maximum number value by one.
  $B092,$02 Jump to #R$B095 if the maximum number value is not equal to zero.
  $B094,$01 Restore the maximum number value back to #REGa.
@ $B095 label=GenerateRandomNumber_Next
  $B095,$02 Decrease the loop counter by one and loop back to #R$B091 until the
. loop counter is zero.
  $B097,$01 Decrease the maximum number value by one.
  $B098,$01 Restore #REGbc from the stack.
  $B099,$01 Return.

c $B09A Add To Score
@ $B09A label=AddToScore
R $B09A A Points to add
  $B09A,$01 Stash #REGhl on the stack.
  $B09B,$03 Load *#R$A7C4 into #REGhl.
  $B09E,$01 Add the points to the low byte.
  $B09F,$01 Decimal adjust for BCD (Binary Coded Decimal).
  $B0A0,$01 Store the adjusted result.
  $B0A1,$02 Jump to #R$B0A4 if there was no carry from the addition.
N $B0A3 If there was carry, increment the high byte.
  $B0A3,$01 Increment the high byte by one.
@ $B0A4 label=SaveScore
  $B0A4,$03 Write the updated score back to *#R$A7C4.
  $B0A7,$01 Restore #REGhl from the stack.
  $B0A8,$01 Return.

c $B0A9 Print Scoring
@ $B0A9 label=Print_Scoring
D $B0A9 Prints the players score as a percentage.
N $B0A9 Print "#STR$AACE,$08($b==$FF)".
  $B0A9,$03 #REGhl=#R$AACE.
  $B0AC,$03 Call #R$A585.
  $B0AF,$03 #REGhl=*#R$A7C4.
N $B0B2 Evaluate the first byte to see if it needs printing at all.
N $B0B2 So don't show "058%" - instead show "58%".
N $B0B2 This particular check is for the first character "1" to see if the
. score is printing "100%".
  $B0B2,$01 Take the first scoring byte and store it in #REGa.
M $B0B3,$04 Keep only bits 0-3 and jump to #R$B0BC if the result of this is
. zero.
  $B0B3,$02,b$01 Keep only bits 0-3.
  $B0B5,$02 Jump to #R$B0BC if the result is equal to #N$00.
  $B0B7,$05 Convert the number to ASCII by adding #N$30 and call #R$A5A4.
@ $B0BC label=Scoring_SecondDigit
  $B0BC,$01 Load the second scoring byte into #REGa.
M $B0BD,$04 Keep only bits 4-7 and jump to #R$B0C6 if the result is non-zero.
  $B0BD,$02,b$01 Keep only bits 4-7.
  $B0BF,$02 Jump to #R$B0C6 if the result is not equal to #N$00.
N $B0C1 The "tens" digit is zero, so check the "hundreds" digit again to avoid
. printing "05%" - instead show only "5%".
  $B0C1,$01 Load the first scoring byte into #REGa again.
  $B0C2,$03 Jump to #R$B0CF if no "hundreds" digit was printed.
N $B0C5 A "hundreds" digit was printed, so force a "0" to be printed.
  $B0C5,$01 Load #N$00 into #REGa for printing.
@ $B0C6 label=Scoring_PrintTens
  $B0C6,$04 Shift the bits four positions right. This moves the tens digit into
. the lower part of the byte for printing.
  $B0CA,$05 Convert the number to ASCII by adding #N$30 and call #R$A5A4..
N $B0CF Lastly, always print the "units".
@ $B0CF label=Scoring_ThirdDigit
  $B0CF,$01 Load the second scoring byte into #REGa.
  $B0D0,$02,b$01 Keep only bits 0-3.
  $B0D2,$05 Convert the number to ASCII by adding #N$30 and call #R$A5A4.
N $B0D7 Print "#STR$AADF,$08($b==$FF)".
  $B0D7,$03 #REGhl=#R$AADF.
  $B0DA,$03 Call #R$A592.
  $B0DD,$01 Return.

c $B0DE Action Routing
@ $B0DE label=ActionRouting
R $B0DE HL Table of pointers which reference item groups
R $B0DE DE Jump table of pointers which action each reference in #REGhl
R $B0DE BC Count of the number of table items to process
  $B0DE,$03 Load the item group table into #REGix (using the stack).
N $B0E1 Keep looping until a match is found.
@ $B0E1 label=ActionRouting_Loop
  $B0E1,$06 Fetch the phrase tokens from the item group and store the pointer
. in #REGhl.
  $B0E7,$04 Stash the item group table, the pointer to the jump table and the
. table items counter on the stack.
  $B0EB,$03 Call #R$AE80.
  $B0EE,$04 Restore the table items counter, the pointer to the jump table and
. the item group table from the stack.
N $B0F2 Skip to the next set of phrase tokens if nothing matched...
  $B0F2,$02 Jump to #R$B0FF if none of the input matches this set of phrase
. tokens.
N $B0F4 The phrase tokens matched! Handle jumping to the action routine.
  $B0F4,$03 Load the action table into #REGix (using the stack).
  $B0F7,$06 Fetch the action routine from the table and store it in #REGhl.
  $B0FD,$01 Discard the return address on the stack.
  $B0FE,$01 Jump to the action routine pointed to by *#REGhl.
N $B0FF Nothing matched, so move to the next set of pointers.
@ $B0FF label=ActionRouting_Next
  $B0FF,$04 Move to the next pointer in the item group table.
  $B103,$02 Move to the next pointer in the action pointers table.
  $B105,$01 Decrease the table items counter by one.
  $B106,$04 Jump back to #R$B0E1 until all the item groups have been processed.
  $B10A,$01 Return.

c $B10B Print Room Image
@ $B10B label=Print_RoomImage
R $B10B IX Pointer to room image data
  $B10B,$03 #REGhl=#REGix (using the stack).
  $B10E,$04 Add #N$0200 to the image data to skip the header.
  $B112,$03 Initialise the screen buffer pointer in #REGde to #N$4000 (the
. beginning of the screen buffer).
  $B115,$03 Set a counter in #REGbc for #N$0200 bytes to process.
@ $B118 label=DecompressPixelData_Loop
  $B118,$01 Stash the byte counter on the stack.
  $B119,$02 #REGb=#N$08.
  $B11B,$03 #REGc=*#REGix+#N$00.
  $B11E,$02 Shift #REGc left (with carry).
  $B120,$02 Jump to #R$B125 if ?? is greater than or equal to #N$08.
  $B122,$01 #REGa=*#REGhl.
  $B123,$01 Write #REGa to *#REGde.
  $B124,$01 Increment #REGhl by one.
  $B125,$01 Increment #REGde by one.
  $B126,$02 Decrease counter by one and loop back to #R$B11E until counter is zero.
  $B128,$02 Increment #REGix by one.
  $B12A,$01 Restore the byte counter from the stack.
  $B12B,$01 Decrease the byte counter by one.
  $B12C,$04 Jump back to #R$B118 until all bytes have been processed.
N $B130 Decompress the attribute data.
  $B130,$03 #REGix=#REGhl (using the stack).
  $B133,$03 Initialise the attribute buffer pointer in #REGhl to #N$5800 (the
. beginning of the attribute buffer).
@ $B136 label=DecompressAttributeData_Loop
  $B136,$03 Fetch the attribute byte from *#REGix+#N$00 and store it in #REGa.
  $B139,$03 Fetch the repeat count from *#REGix+#N$01 and store this in #REGb.
  $B13C,$04 Increment #REGix by two.
@ $B140 label=RepeatAttribute_Loop
  $B140,$01 Write the attribute byte to the attribute buffer pointer.
  $B141,$01 Increment the attribute buffer pointer by one.
  $B142,$02 Decrease the repeat counter by one and loop back to #R$B140 until
. the counter is zero.
N $B144 Keep looping back until the end of the attribute buffer is reached.
  $B144,$05 Jump back to #R$B136 until #REGh is equal to #N$5A.
  $B149,$01 Return.

c $B14A Game Start Alias
@ $B14A label=GameStart_Alias
E $B14A View the equivalent code in #JEWELS$C592.
  $B14A,$03 Jump to #R$FCCE.

t $B14D Messaging: "The Roman"
@ $B14D label=Messaging_TheRoman
  $B14D,$11 "#STR$B14D,$08($b==$FF)".
B $B15E,$01 Terminator.

t $B15F Messaging: "The Captured Roman"
@ $B15F label=Messaging_TheCapturedRoman
  $B15F,$13 "#STR$B15F,$08($b==$FF)".
B $B172,$01 Terminator.

t $B173 Messaging: "The Body Of The Roman"
@ $B173 label=Messaging_TheBodyOfTheRoman
  $B173,$16 "#STR$B173,$08($b==$FF)".
B $B189,$01 Terminator.

t $B18A Messaging: "The Body Of A Fomorian"
@ $B18A label=Messaging_BodyOfAFomorian
  $B18A,$17 "#STR$B18A,$08($b==$FF)".
B $B1A1,$01 Terminator.

t $B1A2 Messaging: "The Fomorian Tribe"
@ $B1A2 label=Messaging_FomorianTribe
  $B1A2,$34 "#STR$B1A2,$08($b==$FF)".
B $B1D6,$01 Terminator.

t $B1D7 Messaging: "Many Fomorian Bodies"
@ $B1D7 label=Messaging_ManyFomorianBodies
  $B1D7,$15 "#STR$B1D7,$08($b==$FF)".
B $B1EC,$01 Terminator.

t $B1ED Messaging: "A Great Fire Burns In The Centre Of The Cavern"
@ $B1ED label=Messaging_GreatFireBurns
  $B1ED,$2F "#STR$B1ED,$08($b==$FF)".
B $B21C,$01 Terminator.

t $B21D Messaging: "The Flickering Flames"
@ $B21D label=Messaging_FlickeringFlames
  $B21D,$63 "#STR$B21D,$08($b==$FF)".
B $B280,$01 Terminator.

t $B281 Messaging: "A Hare,caught By The Leg"
@ $B281 label=Messaging_HareCaughtByTheLeg
  $B281,$3A "#STR$B281,$08($b==$FF)".
B $B2BB,$01 Terminator.

t $B2BC Messaging: "A Deep Pool Of Water"
@ $B2BC label=Messaging_DeepPoolOfWater
  $B2BC,$15 "#STR$B2BC,$08($b==$FF)".
B $B2D1,$01 Terminator.

t $B2D2 Messaging: "Some Salt"
@ $B2D2 label=Messaging_SomeSalt
  $B2D2,$0A "#STR$B2D2,$08($b==$FF)".
B $B2DC,$01 Terminator.

t $B2DD Messaging: "A Clay Pot"
@ $B2DD label=Messaging_ClayPot
  $B2DD,$0B "#STR$B2DD,$08($b==$FF)".
B $B2E8,$01 Terminator.

t $B2E9 Messaging: "Some Acorns"
@ $B2E9 label=Messaging_SomeAcorns
  $B2E9,$0C "#STR$B2E9,$08($b==$FF)".
B $B2F5,$01 Terminator.

t $B2F6 Messaging: "An Urn"
@ $B2F6 label=Messaging_AnUrn
  $B2F6,$07 "#STR$B2F6,$08($b==$FF)".
B $B2FD,$01 Terminator.

t $B2FE Messaging: "A Raven"
@ $B2FE label=Messaging_RavenOnRoof
  $B2FE,$2C "#STR$B2FE,$08($b==$FF)".
B $B32A,$01 Terminator.

t $B32B Messaging: "A Bronze Helmet"
@ $B32B label=Messaging_BronzeHelmet
  $B32B,$10 "#STR$B32B,$08($b==$FF)".
B $B33B,$01 Terminator.

t $B33C Messaging: "A Bronze Helmet,Which You Are Wearing"
@ $B33C label=Messaging_BronzeHelmetWorn
  $B33C,$26 "#STR$B33C,$08($b==$FF)".
B $B362,$01 Terminator.

t $B363 Messaging: "A Fine Chariot"
@ $B363 label=Messaging_FineChariot
  $B363,$42 "#STR$B363,$08($b==$FF)".
B $B3A5,$01 Terminator.

t $B3A6 Messaging: "Some Food"
@ $B3A6 label=Messaging_SomeFood
  $B3A6,$0A "#STR$B3A6,$08($b==$FF)".
B $B3B0,$01 Terminator.

t $B3B1 Messaging: "Some Iron"
@ $B3B1 label=Messaging_SomeIron
  $B3B1,$0A "#STR$B3B1,$08($b==$FF)".
B $B3BB,$01 Terminator.

t $B3BC Messaging: "A Mighty Stone Monolith"
@ $B3BC label=Messaging_MightyStoneMonolith
  $B3BC,$36 "#STR$B3BC,$08($b==$FF)".
B $B3F2,$01 Terminator.

t $B3F3 Messaging: "An Armed Warrior.he Bars Your Path"
@ $B3F3 label=Messaging_AnArmedWarriorBarsYourPath
  $B3F3,$4B "#STR$B3F3,$08($b==$FF)".
B $B43E,$01 Terminator.

t $B43F Messaging: "An Armed Warrior.he Sees Lug's Helmet"
@ $B43F label=Messaging_AnArmedWarriorSeesLugsHelmet
  $B43F,$60 "#STR$B43F,$08($b==$FF)".
B $B49F,$01 Terminator.

t $B4A0 Messaging: "A Multitude Of Shadow-Like Demons"
@ $B4A0 label=Messaging_MultitudeOfShadowDemons
  $B4A0,$6D "#STR$B4A0,$08($b==$FF)".
B $B50D,$01 Terminator.

t $B50E Messaging: "The Vale Is Strangely Silent"
@ $B50E label=Messaging_ValeIsStrangelySilent
  $B50E,$1D "#STR$B50E,$08($b==$FF)".
B $B52B,$01 Terminator.

t $B52C Messaging: "A Small Hut,To The South"
@ $B52C label=Messaging_SmallHut
  $B52C,$19 "#STR$B52C,$08($b==$FF)".
B $B545,$01 Terminator.

t $B546 Messaging: "A Vase"
@ $B546 label=Messaging_Vase
  $B546,$07 "#STR$B546,$08($b==$FF)".
B $B54D,$01 Terminator.

t $B54E Messaging: "A Hut,To The North"
@ $B54E label=Messaging_HutNorth
  $B54E,$13 "#STR$B54E,$08($b==$FF)".
B $B561,$01 Terminator.

t $B562 Messaging: "A Cavern,To The West"
@ $B562 label=Messaging_CavernWest
  $B562,$15 "#STR$B562,$08($b==$FF)".
B $B577,$01 Terminator.

t $B578 Messaging: "A Cavern,To The East"
@ $B578 label=Messaging_CavernEast
  $B578,$15 "#STR$B578,$08($b==$FF)".
B $B58D,$01 Terminator.

t $B58E Messaging: "A Cavern,to The South"
@ $B58E label=Messaging_CavernSouth
  $B58E,$16 "#STR$B58E,$08($b==$FF)".
B $B5A4,$01 Terminator.

t $B5A5 Messaging: "A Sword"
@ $B5A5 label=Messaging_Sword
  $B5A5,$08 "#STR$B5A5,$08($b==$FF)".
B $B5AD,$01 Terminator.

t $B5AE Messaging: "Some Meat"
@ $B5AE label=Messaging_SomeMeat
  $B5AE,$0A "#STR$B5AE,$08($b==$FF)".
B $B5B8,$01 Terminator.

t $B5B9 Messaging: "A Human Skull"
@ $B5B9 label=Messaging_HumanSkull
  $B5B9,$0E "#STR$B5B9,$08($b==$FF)".
B $B5C7,$01 Terminator.

t $B5C8 Messaging: "A Trader,Selling Some Meat"
@ $B5C8 label=Messaging_TraderSellingMeat
  $B5C8,$1B "#STR$B5C8,$08($b==$FF)".
B $B5E3,$01 Terminator.

t $B5E4 Messaging: "A Young Woman"
@ $B5E4 label=Messaging_YoungWoman
  $B5E4,$0E "#STR$B5E4,$08($b==$FF)".
B $B5F2,$01 Terminator.

t $B5F3 Messaging: "A Pack Of Wolves"
@ $B5F3 label=Messaging_PackOfWolves
  $B5F3,$2B "#STR$B5F3,$08($b==$FF)".
B $B61E,$01 Terminator.

t $B61F Messaging: "Fire Protects The Western Exit"
@ $B61F label=Messaging_FireProtectsTheWesternExit
  $B61F,$1F "#STR$B61F,$08($b==$FF)".
B $B63E,$01 Terminator.

t $B63F Messaging: "A Bear"
@ $B63F label=Messaging_Bear
  $B63F,$07 "#STR$B63F,$08($b==$FF)".
B $B646,$01 Terminator.

t $B647 Messaging: "A Dead Bear"
@ $B647 label=Messaging_DeadBear
  $B647,$0C "#STR$B647,$08($b==$FF)".
B $B653,$01 Terminator.

t $B654 Messaging: "A Guard At The Entrance"
@ $B654 label=Messaging_GuardAtEntrance
  $B654,$2E "#STR$B654,$08($b==$FF)".
B $B682,$01 Terminator.

t $B683 Messaging: "A Druid.He Wears An Amulet"
@ $B683 label=Messaging_DruidWearingAmulet
  $B683,$2A "#STR$B683,$08($b==$FF)".
B $B6AD,$01 Terminator.

t $B6AE Messaging: "An Amulet"
@ $B6AE label=Messaging_Amulet
  $B6AE,$0A "#STR$B6AE,$08($b==$FF)".
B $B6B8,$01 Terminator.

t $B6B9 Messaging: "An Amulet,Which You Are Wearing"
@ $B6B9 label=Messaging_AmuletWorn
  $B6B9,$20 "#STR$B6B9,$08($b==$FF)".
B $B6D9,$01 Terminator.

t $B6DA Messaging: "A Ring Of Crystals"
@ $B6DA label=Messaging_RingOfCrystals
  $B6DA,$2D "#STR$B6DA,$08($b==$FF)".
B $B707,$01 Terminator.

t $B708 Messaging: "A Ring Of Crystals,Set Into The Ground"
@ $B708 label=Messaging_RingOfCrystalsInGround
  $B708,$27 "#STR$B708,$08($b==$FF)".
B $B72F,$01 Terminator.

t $B730 Messaging: "A Pig"
@ $B730 label=Messaging_Pig
  $B730,$06 "#STR$B730,$08($b==$FF)".
B $B736,$01 Terminator.

t $B737 Messaging: "A Dead Pig"
@ $B737 label=Messaging_DeadPig
  $B737,$0B "#STR$B737,$08($b==$FF)".
B $B742,$01 Terminator.

t $B743 Messaging: "A Piece Of Rope"
@ $B743 label=Messaging_PieceOfRope
  $B743,$10 "#STR$B743,$08($b==$FF)".
B $B753,$01 Terminator.

t $B754 Messaging: "A Wild Ox"
@ $B754 label=Messaging_WildOx
  $B754,$32 "#STR$B754,$08($b==$FF)".
B $B786,$01 Terminator.

t $B787 Messaging: "A Dead Ox.Tethered By A Piece Of Rope"
@ $B787 label=Messaging_TetheredDeadOx
  $B787,$26 "#STR$B787,$08($b==$FF)".
B $B7AD,$01 Terminator.

t $B7AE Messaging: "A Dead Ox"
@ $B7AE label=Messaging_DeadOx
  $B7AE,$0A "#STR$B7AE,$08($b==$FF)".
B $B7B8,$01 Terminator.

t $B7B9 Messaging: "A Cloak,Which You Are Wearing"
@ $B7B9 label=Messaging_CloakWorn
  $B7B9,$1E "#STR$B7B9,$08($b==$FF)".
B $B7D7,$01 Terminator.

t $B7D8 Messaging: "A Shield"
@ $B7D8 label=Messaging_Shield
  $B7D8,$09 "#STR$B7D8,$08($b==$FF)".
B $B7E1,$01 Terminator.

t $B7E2 Messaging: "Fire Protects The Eastern Exit"
@ $B7E2 label=Messaging_FireProtectsTheEasternExit
  $B7E2,$1F "#STR$B7E2,$08($b==$FF)".
B $B801,$01 Terminator.

t $B802 Messaging: "A Stone Slab"
@ $B802 label=Messaging_StoneSlab
  $B802,$33 "#STR$B802,$08($b==$FF)".
B $B835,$01 Terminator.

t $B836 Messaging: "A Shimmering Stone Slab"
@ $B836 label=Messaging_ShimmeringStoneSlab
  $B836,$34 "#STR$B836,$08($b==$FF)".
B $B86A,$01 Terminator.

t $B86B Messaging: "A Ladder"
@ $B86B label=Messaging_Ladder
  $B86B,$09 "#STR$B86B,$08($b==$FF)".
B $B874,$01 Terminator.

t $B875 Messaging: "A Ladder,On The Floor Below"
@ $B875 label=Messaging_LadderOnFloor
  $B875,$1C "#STR$B875,$08($b==$FF)".
B $B891,$01 Terminator.

t $B892 Messaging: "A Ladder,Leading Down"
@ $B892 label=Messaging_LadderLeadingDown
  $B892,$16 "#STR$B892,$08($b==$FF)".
B $B8A8,$01 Terminator.

t $B8A9 Messaging: "The Wooden Platform"
@ $B8A9 label=Messaging_WoodenPlatform
  $B8A9,$3A "#STR$B8A9,$08($b==$FF)".
B $B8E3,$01 Terminator.

t $B8E4 Messaging: "A Ladder,Leading Upward"
@ $B8E4 label=Messaging_LadderLeadingUpward
  $B8E4,$18 "#STR$B8E4,$08($b==$FF)".
B $B8FC,$01 Terminator.

t $B8FD Messaging: "A Pile Of Straw"
@ $B8FD label=Messaging_PileOfStraw
  $B8FD,$2D "#STR$B8FD,$08($b==$FF)".
B $B92A,$01 Terminator.

t $B92B Messaging: "Some Straw"
@ $B92B label=Messaging_SomeStraw
  $B92B,$0B "#STR$B92B,$08($b==$FF)".
B $B936,$01 Terminator.

t $B937 Messaging: "A Staff"
@ $B937 label=Messaging_Staff
  $B937,$08 "#STR$B937,$08($b==$FF)".
B $B93F,$01 Terminator.

t $B940 Messaging: "The Body Of A Young Man"
@ $B940 label=Messaging_BodyOfYoungMan
  $B940,$4C "#STR$B940,$08($b==$FF)".
B $B98C,$01 Terminator.

t $B98D Messaging: "The Body Of A Young Man"
@ $B98D label=Messaging_BodyOfAYoungMan
  $B98D,$3A "#STR$B98D,$08($b==$FF)".
B $B9C7,$01 Terminator.

t $B9C8 Messaging: "A White Cloak"
@ $B9C8 label=Messaging_WhiteCloak
  $B9C8,$0E "#STR$B9C8,$08($b==$FF)".
B $B9D6,$01 Terminator.

t $B9D7 Messaging: "Some Silver"
@ $B9D7 label=Messaging_SomeSilver
  $B9D7,$0C "#STR$B9D7,$08($b==$FF)".
B $B9E3,$01 Terminator.

t $B9E4 Messaging: "An Open Pit,Below"
@ $B9E4 label=Messaging_OpenPitBelow
  $B9E4,$12 "#STR$B9E4,$08($b==$FF)".
B $B9F6,$01 Terminator.

t $B9F7 Messaging: "A Torc"
@ $B9F7 label=Messaging_Torc
  $B9F7,$07 "#STR$B9F7,$08($b==$FF)".
B $B9FE,$01 Terminator.

t $B9FF Messaging: "A Torc,Which You Are Wearing"
@ $B9FF label=Messaging_TorcWorn
  $B9FF,$1D "#STR$B9FF,$08($b==$FF)".
B $BA1C,$01 Terminator.

t $BA1D Messaging: "A Dead Hare"
@ $BA1D label=Messaging_DeadHare
  $BA1D,$1D "#STR$BA1D,$08($b==$FF)".
B $BA3A,$01 Terminator.

t $BA3B Messaging: "The Body Of The Roman"
@ $BA3B label=Messaging_BodyOfRoman
  $BA3B,$2A "#STR$BA3B,$08($b==$FF)".
B $BA65,$01 Terminator.

t $BA66 Messaging: "The Roman"
@ $BA66 label=Messaging_Roman
  $BA66,$09 "#STR$BA66,$08($b==$FF)".
B $BA6F,$01 Terminator.

t $BA70 Messaging: "A Fomorian"
@ $BA70 label=Messaging_Fomorian
  $BA70,$0A "#STR$BA70,$08($b==$FF)".
B $BA7A,$01 Terminator.

t $BA7B Messaging: "A Boar"
@ $BA7B label=Messaging_Boar
  $BA7B,$06 "#STR$BA7B,$08($b==$FF)".
B $BA81,$01 Terminator.

t $BA82 Messaging: "Any Rats"
@ $BA82 label=Messaging_AnyRats
  $BA82,$08 "#STR$BA82,$08($b==$FF)".
B $BA8A,$01 Terminator.

t $BA8B Messaging: "A Hare"
@ $BA8B label=Messaging_Hare
  $BA8B,$06 "#STR$BA8B,$08($b==$FF)".
B $BA91,$01 Terminator.

t $BA92 Messaging: "A Trap"
@ $BA92 label=Messaging_Trap
  $BA92,$06 "#STR$BA92,$08($b==$FF)".
B $BA98,$01 Terminator.

t $BA99 Messaging: "A Pool"
@ $BA99 label=Messaging_Pool
  $BA99,$06 "#STR$BA99,$08($b==$FF)".
B $BA9F,$01 Terminator.

t $BAA0 Messaging: "Any Salt"
@ $BAA0 label=Messaging_AnySalt
  $BAA0,$08 "#STR$BAA0,$08($b==$FF)".
B $BAA8,$01 Terminator.

t $BAA9 Messaging: "A Pot"
@ $BAA9 label=Messaging_Pot
  $BAA9,$05 "#STR$BAA9,$08($b==$FF)".
B $BAAE,$01 Terminator.

t $BAAF Messaging: "Any Acorns"
@ $BAAF label=Messaging_AnyAcorns
  $BAAF,$0A "#STR$BAAF,$08($b==$FF)".
B $BAB9,$01 Terminator.

t $BABA Messaging: "An Urn"
@ $BABA label=Messaging_Urn
  $BABA,$06 "#STR$BABA,$08($b==$FF)".
B $BAC0,$01 Terminator.

t $BAC1 Messaging: "A Torc"
@ $BAC1 label=Messaging_Torc_Duplicate
  $BAC1,$06 "#STR$BAC1,$08($b==$FF)".
B $BAC7,$01 Terminator.

t $BAC8 Messaging: "A Raven"
@ $BAC8 label=Messaging_Raven
  $BAC8,$07 "#STR$BAC8,$08($b==$FF)".
B $BACF,$01 Terminator.

t $BAD0 Messaging: "A Helmet"
@ $BAD0 label=Messaging_Helmet
  $BAD0,$08 "#STR$BAD0,$08($b==$FF)".
B $BAD8,$01 Terminator.

t $BAD9 Messaging: "Any Food"
@ $BAD9 label=Messaging_AnyFood
  $BAD9,$08 "#STR$BAD9,$08($b==$FF)".
B $BAE1,$01 Terminator.

t $BAE2 Messaging: "Any Iron"
@ $BAE2 label=Messaging_AnyIron
  $BAE2,$08 "#STR$BAE2,$08($b==$FF)".
B $BAEA,$01 Terminator.

t $BAEB Messaging: "A Monolith"
@ $BAEB label=Messaging_Monolith
  $BAEB,$0A "#STR$BAEB,$08($b==$FF)".
B $BAF5,$01 Terminator.

t $BAF6 Messaging: "A Fissure"
@ $BAF6 label=Messaging_Fissure
  $BAF6,$09 "#STR$BAF6,$08($b==$FF)".
B $BAFF,$01 Terminator.

t $BB00 Messaging: "A Warrior"
@ $BB00 label=Messaging_Warrior
  $BB00,$09 "#STR$BB00,$08($b==$FF)".
B $BB09,$01 Terminator.

t $BB0A Messaging: "Any Demons"
@ $BB0A label=Messaging_AnyDemons
  $BB0A,$0A "#STR$BB0A,$08($b==$FF)".
B $BB14,$01 Terminator.

t $BB15 Messaging: "A Hut"
@ $BB15 label=Messaging_Hut
  $BB15,$05 "#STR$BB15,$08($b==$FF)".
B $BB1A,$01 Terminator.

t $BB1B Messaging: "A Vase"
@ $BB1B label=Messaging_Vase_Duplicate
  $BB1B,$06 "#STR$BB1B,$08($b==$FF)".
B $BB21,$01 Terminator.

t $BB22 Messaging: "A Cavern"
@ $BB22 label=Messaging_Cavern
  $BB22,$08 "#STR$BB22,$08($b==$FF)".
B $BB2A,$01 Terminator.

t $BB2B Messaging: "A Sword"
@ $BB2B label=Messaging_Sword_Duplicate
  $BB2B,$07 "#STR$BB2B,$08($b==$FF)".
B $BB32,$01 Terminator.

t $BB33 Messaging: "Any Meat"
@ $BB33 label=Messaging_AnyMeat
  $BB33,$08 "#STR$BB33,$08($b==$FF)".
B $BB3B,$01 Terminator.

t $BB3C Messaging: "A Trader"
@ $BB3C label=Messaging_Trader
  $BB3C,$08 "#STR$BB3C,$08($b==$FF)".
B $BB44,$01 Terminator.

t $BB45 Messaging: "A Woman"
@ $BB45 label=Messaging_Woman
  $BB45,$07 "#STR$BB45,$08($b==$FF)".
B $BB4C,$01 Terminator.

t $BB4D Messaging: "Any Wolves"
@ $BB4D label=Messaging_AnyWolves
  $BB4D,$0A "#STR$BB4D,$08($b==$FF)".
B $BB57,$01 Terminator.

t $BB58 Messaging: "A Bear"
@ $BB58 label=Messaging_Bear_Duplicate
  $BB58,$06 "#STR$BB58,$08($b==$FF)".
B $BB5E,$01 Terminator.

t $BB5F Messaging: "A Guard"
@ $BB5F label=Messaging_Guard
  $BB5F,$07 "#STR$BB5F,$08($b==$FF)".
B $BB66,$01 Terminator.

t $BB67 Messaging: "A Druid"
@ $BB67 label=Messaging_Druid
  $BB67,$07 "#STR$BB67,$08($b==$FF)".
B $BB6E,$01 Terminator.

t $BB6F Messaging: "An Amulet"
@ $BB6F label=Messaging_Amulet_Duplicate
  $BB6F,$09 "#STR$BB6F,$08($b==$FF)".
B $BB78,$01 Terminator.

t $BB79 Messaging: "A Ring"
@ $BB79 label=Messaging_Ring
  $BB79,$06 "#STR$BB79,$08($b==$FF)".
B $BB7F,$01 Terminator.

t $BB80 Messaging: "A Pig"
@ $BB80 label=Messaging_Pig_Duplicate
  $BB80,$05 "#STR$BB80,$08($b==$FF)".
B $BB85,$01 Terminator.

t $BB86 Messaging: "Any Rope"
@ $BB86 label=Messaging_AnyRope
  $BB86,$08 "#STR$BB86,$08($b==$FF)".
B $BB8E,$01 Terminator.

t $BB8F Messaging: "An Ox"
@ $BB8F label=Messaging_AnOx
  $BB8F,$05 "#STR$BB8F,$08($b==$FF)".
B $BB94,$01 Terminator.

t $BB95 Messaging: "A Skull"
@ $BB95 label=Messaging_Skull
  $BB95,$07 "#STR$BB95,$08($b==$FF)".
B $BB9C,$01 Terminator.

t $BB9D Messaging: "A Shield"
@ $BB9D label=Messaging_Shield_Duplicate
N $BB9D See #POKE#correct-typo(Correct Typo).
  $BB9D,$08 "#STR$BB9D,$08($b==$FF)".
B $BBA5,$01 Terminator.

t $BBA6 Messaging: "A Fire"
@ $BBA6 label=Messaging_Fire
  $BBA6,$06 "#STR$BBA6,$08($b==$FF)".
B $BBAC,$01 Terminator.

t $BBAD Messaging: "A Pit"
@ $BBAD label=Messaging_Pit
  $BBAD,$05 "#STR$BBAD,$08($b==$FF)".
B $BBB2,$01 Terminator.

t $BBB3 Messaging: "A Ladder"
@ $BBB3 label=Messaging_Ladder_Duplicate
  $BBB3,$08 "#STR$BBB3,$08($b==$FF)".
B $BBBB,$01 Terminator.

t $BBBC Messaging: "Any Straw"
@ $BBBC label=Messaging_AnyStraw
  $BBBC,$09 "#STR$BBBC,$08($b==$FF)".
B $BBC5,$01 Terminator.

t $BBC6 Messaging: "A Staff"
@ $BBC6 label=Messaging_Staff_Duplicate
  $BBC6,$07 "#STR$BBC6,$08($b==$FF)".
B $BBCD,$01 Terminator.

t $BBCE Messaging: "A Body"
@ $BBCE label=Messaging_Body
  $BBCE,$06 "#STR$BBCE,$08($b==$FF)".
B $BBD4,$01 Terminator.

t $BBD5 Messaging: "A Cloak"
@ $BBD5 label=Messaging_Cloak
  $BBD5,$07 "#STR$BBD5,$08($b==$FF)".
B $BBDC,$01 Terminator.

t $BBDD Messaging: "Any Silver"
@ $BBDD label=Messaging_AnySilver
  $BBDD,$0A "#STR$BBDD,$08($b==$FF)".
B $BBE7,$01 Terminator.

t $BBE8 Messaging: "A Platform"
@ $BBE8 label=Messaging_Platform
  $BBE8,$0A "#STR$BBE8,$08($b==$FF)".
B $BBF2,$01 Terminator.

t $BBF3 Messaging: "Any Water"
@ $BBF3 label=Messaging_AnyWater
  $BBF3,$09 "#STR$BBF3,$08($b==$FF)".
B $BBFC,$01 Terminator.

t $BBFD Messaging: "Lug"
@ $BBFD label=Messaging_Lug
  $BBFD,$03 "#STR$BBFD,$08($b==$FF)".
B $BC00,$01 Terminator.

t $BC01 Messaging: "Danu"
@ $BC01 label=Messaging_Danu
  $BC01,$04 "#STR$BC01,$08($b==$FF)".
B $BC05,$01 Terminator.

t $BC06 Messaging: "Minerva"
@ $BC06 label=Messaging_Minerva
  $BC06,$07 "#STR$BC06,$08($b==$FF)".
B $BC0D,$01 Terminator.

t $BC0E Messaging: "A Chariot"
@ $BC0E label=Messaging_Chariot
  $BC0E,$09 "#STR$BC0E,$08($b==$FF)".
B $BC17,$01 Terminator.

t $BC18 Messaging: "A Slab"
@ $BC18 label=Messaging_Slab
  $BC18,$06 "#STR$BC18,$08($b==$FF)".
B $BC1E,$01 Terminator.

t $BC1F Messaging: "A Groove"
@ $BC1F label=Messaging_Groove
  $BC1F,$08 "#STR$BC1F,$08($b==$FF)".
B $BC27,$01 Terminator.

t $BC28 Messaging: "The Lake"
@ $BC28 label=Messaging_Lake
  $BC28,$08 "#STR$BC28,$08($b==$FF)".
B $BC30,$01 Terminator.

t $BC31 Messaging: "A Hillfort"
@ $BC31 label=Messaging_Hillfort
  $BC31,$0A "#STR$BC31,$08($b==$FF)".
B $BC3B,$01 Terminator.

t $BC3C Messaging: "A Broch"
@ $BC3C label=Messaging_Broch
  $BC3C,$07 "#STR$BC3C,$08($b==$FF)".
B $BC43,$01 Terminator.

t $BC44 Messaging: "A Wooded Vale"
@ $BC44 label=Messaging_WoodedVale
  $BC44,$29 "#STR$BC44,$08($b==$FF)".
B $BC6D,$01 Terminator.

t $BC6E Messaging: "A Wooded Path"
@ $BC6E label=Messaging_WoodedPath
  $BC6E,$0E "#STR$BC6E,$08($b==$FF)".
B $BC7C,$01 Terminator.

t $BC7D Messaging: "The Sea Cavern"
@ $BC7D label=Messaging_SeaCavern
  $BC7D,$0F "#STR$BC7D,$08($b==$FF)".
B $BC8C,$01 Terminator.

t $BC8D Messaging: "The Rocky Beach"
@ $BC8D label=Messaging_RockyBeach
  $BC8D,$10 "#STR$BC8D,$08($b==$FF)".
B $BC9D,$01 Terminator.

t $BC9E Messaging: "The Evaporation Pits"
@ $BC9E label=Messaging_EvaporationPits
  $BC9E,$58 "#STR$BC9E,$08($b==$FF)".
B $BCF6,$01 Terminator.

t $BCF7 Messaging: "The Deserted Farm"
@ $BCF7 label=Messaging_DesertedFarm
  $BCF7,$33 "#STR$BCF7,$08($b==$FF)".
B $BD2A,$01 Terminator.

t $BD2B Messaging: "Mount Badon"
@ $BD2B label=Messaging_MountBadon
  $BD2B,$3A "#STR$BD2B,$08($b==$FF)".
B $BD65,$01 Terminator.

t $BD66 Messaging: "A Grassy Slope"
@ $BD66 label=Messaging_GrassySlope
  $BD66,$0F "#STR$BD66,$08($b==$FF)".
B $BD75,$01 Terminator.

t $BD76 Messaging: "The Vale Of Kells"
@ $BD76 label=Messaging_ValeOfKells
  $BD76,$61 "#STR$BD76,$08($b==$FF)".
B $BDD7,$01 Terminator.

t $BDD8 Messaging: "In A Deep Pool Of Water.Inside The Sea Cavern"
@ $BDD8 label=Messaging_DeepPoolOfWaterInSeaCavern
  $BDD8,$61 "#STR$BDD8,$08($b==$FF)".
B $BE39,$01 Terminator.

t $BE3A Messaging: "A Narrow Underwater Passage"
@ $BE3A label=Messaging_NarrowUnderwaterPassage
  $BE3A,$37 "#STR$BE3A,$08($b==$FF)".
B $BE71,$01 Terminator.

t $BE72 Messaging: "The Cliffs"
@ $BE72 label=Messaging_Cliffs
  $BE72,$20 "#STR$BE72,$08($b==$FF)".
B $BE92,$01 Terminator.

t $BE93 Messaging: "A Farm Track"
@ $BE93 label=Messaging_FarmTrack
  $BE93,$0D "#STR$BE93,$08($b==$FF)".
B $BEA0,$01 Terminator.

t $BEA1 Messaging: "The Shrine Of The Nemed"
@ $BEA1 label=Messaging_ShrineOfNemeda
  $BEA1,$56 "#STR$BEA1,$08($b==$FF)".
B $BEF7,$01 Terminator.

t $BEF8 Messaging: "A Mountain Slope"
@ $BEF8 label=Messaging_MountainSlope
  $BEF8,$11 "#STR$BEF8,$08($b==$FF)".
B $BF09,$01 Terminator.

t $BF0A Messaging: "A Woodland Path"
@ $BF0A label=Messaging_WoodlandPath
  $BF0A,$10 "#STR$BF0A,$08($b==$FF)".
B $BF1A,$01 Terminator.

t $BF1B Messaging: "Dense Woodland"
@ $BF1B label=Messaging_DenseWoodland
  $BF1B,$46 "#STR$BF1B,$08($b==$FF)".
B $BF61,$01 Terminator.

t $BF62 Messaging: "Lug's Cavern"
@ $BF62 label=Messaging_LugsCavern
  $BF62,$29 "#STR$BF62,$08($b==$FF)".
B $BF8B,$01 Terminator.

t $BF8C Messaging: "In A Deep Pool"
@ $BF8C label=Messaging_DeepPool
  $BF8C,$24 "#STR$BF8C,$08($b==$FF)".
B $BFB0,$01 Terminator.

t $BFB1 Messaging: "The Chalk Path"
@ $BFB1 label=Messaging_ChalkPath
  $BFB1,$0F "#STR$BFB1,$08($b==$FF)".
B $BFC0,$01 Terminator.

t $BFC1 Messaging: "The Burial Pit"
@ $BFC1 label=Messaging_BurialPit
  $BFC1,$26 "#STR$BFC1,$08($b==$FF)".
B $BFE7,$01 Terminator.

t $BFE8 Messaging: "Bleak Moorland"
@ $BFE8 label=Messaging_BleakMoorland
  $BFE8,$0F "#STR$BFE8,$08($b==$FF)".
B $BFF7,$01 Terminator.

t $BFF8 Messaging: "Inside The Fissure"
@ $BFF8 label=Messaging_InsideFissure
  $BFF8,$13 "#STR$BFF8,$08($b==$FF)".
B $C00B,$01 Terminator.

t $C00C Messaging: "A Mountain Path"
@ $C00C label=Messaging_MountainPath
  $C00C,$10 "#STR$C00C,$08($b==$FF)".
B $C01C,$01 Terminator.

t $C01D Messaging: "The Causeway"
@ $C01D label=Messaging_Causeway
  $C01D,$26 "#STR$C01D,$08($b==$FF)".
B $C043,$01 Terminator.

t $C044 Messaging: "The Rocky Path"
@ $C044 label=Messaging_RockyPath
  $C044,$0F "#STR$C044,$08($b==$FF)".
B $C053,$01 Terminator.

t $C054 Messaging: "A Narrow Path"
@ $C054 label=Messaging_NarrowPath
  $C054,$0E "#STR$C054,$08($b==$FF)".
B $C062,$01 Terminator.

t $C063 Messaging: "The Vale Of Rhia"
@ $C063 label=Messaging_ValeOfRhia
  $C063,$11 "#STR$C063,$08($b==$FF)".
B $C074,$01 Terminator.

t $C075 Messaging: "The Burial Ground"
@ $C075 label=Messaging_BurialGround
  $C075,$12 "#STR$C075,$08($b==$FF)".
B $C087,$01 Terminator.

t $C088 Messaging: "The Vale Of Whispers"
@ $C088 label=Messaging_ValeOfWhispers
  $C088,$15 "#STR$C088,$08($b==$FF)".
B $C09D,$01 Terminator.

t $C09E Messaging: "Cadwell Ridge"
@ $C09E label=Messaging_CadwellRidge
  $C09E,$0E "#STR$C09E,$08($b==$FF)".
B $C0AC,$01 Terminator.

t $C0AD Messaging: "The Bridon Road"
@ $C0AD label=Messaging_BridonRoad
  $C0AD,$10 "#STR$C0AD,$08($b==$FF)".
B $C0BD,$01 Terminator.

t $C0BE Messaging: "The Village Of Bridon"
@ $C0BE label=Messaging_VillageOfBridon
  $C0BE,$32 "#STR$C0BE,$08($b==$FF)".
B $C0F0,$01 Terminator.

t $C0F1 Messaging: "Inside The Hut"
@ $C0F1 label=Messaging_InsideHut
  $C0F1,$0F "#STR$C0F1,$08($b==$FF)".
B $C100,$01 Terminator.

t $C101 Messaging: "The Swamp"
@ $C101 label=Messaging_Swamp
  $C101,$33 "#STR$C101,$08($b==$FF)".
B $C134,$01 Terminator.

t $C135 Messaging: "In An Oozing Quagmire"
@ $C135 label=Messaging_InAnOozingQuagmire
  $C135,$32 "#STR$C135,$08($b==$FF)".
B $C167,$01 Terminator.

t $C168 Messaging: "The Forest Edge"
@ $C168 label=Messaging_ForestEdge
  $C168,$10 "#STR$C168,$08($b==$FF)".
B $C178,$01 Terminator.

t $C179 Messaging: "The Cadwell Road"
@ $C179 label=Messaging_CadwellRoad
  $C179,$11 "#STR$C179,$08($b==$FF)".
B $C18A,$01 Terminator.

t $C18B Messaging: "The Lake"
@ $C18B label=Messaging_LakeGrassyBank
  $C18B,$45 "#STR$C18B,$08($b==$FF)".
B $C1D0,$01 Terminator.

t $C1D1 Messaging: "A Small Clearing"
@ $C1D1 label=Messaging_SmallClearing
  $C1D1,$11 "#STR$C1D1,$08($b==$FF)".
B $C1E2,$01 Terminator.

t $C1E3 Messaging: "A Forest Path"
@ $C1E3 label=Messaging_ForestPath
  $C1E3,$0E "#STR$C1E3,$08($b==$FF)".
B $C1F1,$01 Terminator.

t $C1F2 Messaging: "The Deserted Broch"
@ $C1F2 label=Messaging_DesertedBrocha
  $C1F2,$6A "#STR$C1F2,$08($b==$FF)".
B $C25C,$01 Terminator.

t $C25D Messaging: "The Western Approach"
@ $C25D label=Messaging_WesternApproach
  $C25D,$15 "#STR$C25D,$08($b==$FF)".
B $C272,$01 Terminator.

t $C273 Messaging: "The Cadwell Hillfort"
@ $C273 label=Messaging_CadwellHillfort
  $C273,$35 "#STR$C273,$08($b==$FF)".
B $C2A8,$01 Terminator.

t $C2A9 Messaging: "The Eastern Approach"
@ $C2A9 label=Messaging_EasternApproach
  $C2A9,$15 "#STR$C2A9,$08($b==$FF)".
B $C2BE,$01 Terminator.

t $C2BF Messaging: "A Grassy Plain"
@ $C2BF label=Messaging_GrassyPlain
  $C2BF,$2B "#STR$C2BF,$08($b==$FF)".
B $C2EA,$01 Terminator.

t $C2EB Messaging: "The Circle Of Stones"
@ $C2EB label=Messaging_CircleOfStones
  $C2EB,$47 "#STR$C2EB,$08($b==$FF)".
B $C332,$01 Terminator.

t $C333 Messaging: "A Narrow Gorge"
@ $C333 label=Messaging_NarrowGorge
  $C333,$0F "#STR$C333,$08($b==$FF)".
B $C342,$01 Terminator.

t $C343 Messaging: "Inside A Rock Cavern"
@ $C343 label=Messaging_InsideRockCavern
  $C343,$15 "#STR$C343,$08($b==$FF)".
B $C358,$01 Terminator.

t $C359 Messaging: "The Crystal Cavern"
@ $C359 label=Messaging_CrystalCavern
  $C359,$13 "#STR$C359,$08($b==$FF)".
B $C36C,$01 Terminator.

t $C36D Messaging: "The Chieftain's Chamber"
@ $C36D label=Messaging_ChieftainsChamber
  $C36D,$18 "#STR$C36D,$08($b==$FF)".
B $C385,$01 Terminator.

t $C386 Messaging: "The Storage Chamber"
@ $C386 label=Messaging_StorageChamber
  $C386,$14 "#STR$C386,$08($b==$FF)".
B $C39A,$01 Terminator.

t $C39B Messaging: "The Inner Courtyard"
@ $C39B label=Messaging_InnerCourtyard
  $C39B,$14 "#STR$C39B,$08($b==$FF)".
B $C3AF,$01 Terminator.

t $C3B0 Messaging: "The Druid's Chamber"
@ $C3B0 label=Messaging_DruidsChamber
  $C3B0,$14 "#STR$C3B0,$08($b==$FF)".
B $C3C4,$01 Terminator.

t $C3C5 Messaging: "An Animal Pen"
@ $C3C5 label=Messaging_AnimalPen
  $C3C5,$0E "#STR$C3C5,$08($b==$FF)".
B $C3D3,$01 Terminator.

t $C3D4 Messaging: "The Main Courtyard"
@ $C3D4 label=Messaging_MainCourtyard
  $C3D4,$13 "#STR$C3D4,$08($b==$FF)".
B $C3E7,$01 Terminator.

t $C3E8 Messaging: "The Vale Of Shadows"
@ $C3E8 label=Messaging_ValeOfShadows
  $C3E8,$14 "#STR$C3E8,$08($b==$FF)".
B $C3FC,$01 Terminator.

t $C3FD Messaging: "The Enchanted Hills"
@ $C3FD label=Messaging_EnchantedHills
  $C3FD,$14 "#STR$C3FD,$08($b==$FF)".
B $C411,$01 Terminator.

t $C412 Messaging: "The Ruins Of Mag Gerin"
@ $C412 label=Messaging_RuinsOfMagGerin
  $C412,$48 "#STR$C412,$08($b==$FF)".
B $C45A,$01 Terminator.

t $C45B Messaging: "The Fomorians' Cavern"
@ $C45B label=Messaging_FomoriansCavern
  $C45B,$16 "#STR$C45B,$08($b==$FF)".
B $C471,$01 Terminator.

t $C472 Messaging: "The Mag Gerin Road"
@ $C472 label=Messaging_MagGerinRoad
  $C472,$13 "#STR$C472,$08($b==$FF)".
B $C485,$01 Terminator.

t $C486 Messaging: "The Danaan Settlement"
@ $C486 label=Messaging_DanaanSettlement
  $C486,$3E "#STR$C486,$08($b==$FF)".
B $C4C4,$01 Terminator.

t $C4C5 Messaging: "The Danaan Valley"
@ $C4C5 label=Messaging_DanaanValley
  $C4C5,$12 "#STR$C4C5,$08($b==$FF)".
B $C4D7,$01 Terminator.

t $C4D8 Messaging: "The Twisted Forest"
@ $C4D8 label=Messaging_TwistedForest
  $C4D8,$53 "#STR$C4D8,$08($b==$FF)".
B $C52B,$01 Terminator.

t $C52C Messaging: "Congratulations!!"
@ $C52C label=Messaging_Congratulations
  $C52C,$EB "#STR$C52C,$08($b==$FF)".
B $C617,$01 Terminator.

t $C618 Messaging: "The Vale Of Cuchulainn"
@ $C618 label=Messaging_ValeOfCuchulainn
  $C618,$17 "#STR$C618,$08($b==$FF)".
B $C62F,$01 Terminator.

t $C630 Messaging: "A Guard Chamber"
@ $C630 label=Messaging_GuardChamber
  $C630,$10 "#STR$C630,$08($b==$FF)".
B $C640,$01 Terminator.

t $C641 Messaging: "The Entrance Passage"
@ $C641 label=Messaging_EntrancePassage
  $C641,$15 "#STR$C641,$08($b==$FF)".
B $C656,$01 Terminator.

t $C657 Messaging: "The Outer Courtyard"
@ $C657 label=Messaging_OuterCourtyard
  $C657,$14 "#STR$C657,$08($b==$FF)".
B $C66B,$01 Terminator.

t $C66C Messaging: "A Muddy Passage"
@ $C66C label=Messaging_MuddyPassage
  $C66C,$10 "#STR$C66C,$08($b==$FF)".
B $C67C,$01 Terminator.

t $C67D Messaging: "The Entrance To The Inner Wall"
@ $C67D label=Messaging_EntranceToInnerWall
  $C67D,$1F "#STR$C67D,$08($b==$FF)".
B $C69C,$01 Terminator.

t $C69D Messaging: "Inside The Inner Wall Entrance"
@ $C69D label=Messaging_InsideInnerWallEntrance
  $C69D,$1F "#STR$C69D,$08($b==$FF)".
B $C6BC,$01 Terminator.

t $C6BD Messaging: "The Northern Chamber"
@ $C6BD label=Messaging_NorthernChamber
  $C6BD,$15 "#STR$C6BD,$08($b==$FF)".
B $C6D2,$01 Terminator.

t $C6D3 Messaging: "The Western Chamber"
@ $C6D3 label=Messaging_WesternChamber
  $C6D3,$14 "#STR$C6D3,$08($b==$FF)".
B $C6E7,$01 Terminator.

t $C6E8 Messaging: "The Eastern Chamber.Almost Totally Gutted By Fire"
@ $C6E8 label=Messaging_EasternChamberGuttedByFire
  $C6E8,$33 "#STR$C6E8,$08($b==$FF)".
B $C71B,$01 Terminator.

t $C71C Messaging: "The Southern Chamber"
@ $C71C label=Messaging_SouthernChamber
  $C71C,$15 "#STR$C71C,$08($b==$FF)".
B $C731,$01 Terminator.

g $C732 Table: Item Descriptions
@ $C732 label=Table_ItemDescriptions
W $C732,$02 Item #N((#PC-$C732)/$02): #ITEM((#PC-$C732)/$02).
L $C732,$02,$86

g $C83E Table: Object Noun Phrases
@ $C83E label=Table_ObjectNounPhrases
W $C83E,$02 Object #R(#PEEK(#PC+$01)*$100+#PEEK(#PC))(#N((#PC-$C83E)/$02)): #OBJECT((#PC-$C83E)/$02).
L $C83E,$02,$39

g $C8B0 Table: Room Descriptions
@ $C8B0 label=Table_RoomDescriptions
W $C8B0,$02 N/A.
W $C8B2,$02 N/A.
W $C8B4,$02 Room #R(#PEEK(#PC+$01)*$100+#PEEK(#PC))(#N((#PC-$C8B0)/$02)).
L $C8B4,$02,$64

t $C97C Messaging: "You Have The Feeling That YouAre Being Followed"
@ $C97C label=Messaging_HaveFeeling
  $C97C,$32 "#STR$C97C,$08($b==$FF)".
B $C9AE,$01 Terminator.

t $C9AF Messaging: "The Roman Suddenly Appears AndHe Attacks You..."
@ $C9AF label=Messaging_RomanSuddenlyAppears
  $C9AF,$31 "#STR$C9AF,$08($b==$FF)".
B $C9E0,$01 Terminator.

t $C9E1 Messaging: "You Are Too Fast For Him AndYou Easily Avoid The Blow"
@ $C9E1 label=Messaging_YouAreTooFastForHim
  $C9E1,$38 "#STR$C9E1,$08($b==$FF)".
B $CA19,$01 Terminator.

t $CA1A Messaging: "You Shouldn't Fight On An EmptyStomach..."
@ $CA1A label=Messaging_ShouldntFightOnEmptyStomach
  $CA1A,$2B "#STR$CA1A,$08($b==$FF)".
B $CA45,$01 Terminator.

t $CA46 Messaging: "You Are Taken By Surprise.The Blow Strikes True"
@ $CA46 label=Messaging_YouAreTakenBySurpriseBlowStrikesTrue
  $CA46,$32 "#STR$CA46,$08($b==$FF)".
B $CA78,$01 Terminator.

t $CA79 Messaging: "A Fomorian Attacks You..."
@ $CA79 label=Messaging_FomorianAttacksYou
  $CA79,$1A "#STR$CA79,$08($b==$FF)".
B $CA93,$01 Terminator.

t $CA94 Messaging: "You Match The Evil Creature'sSpeed And Avoid The Blow"
@ $CA94 label=Messaging_MatchEvilCreaturesSpeed
  $CA94,$38 "#STR$CA94,$08($b==$FF)".
B $CACC,$01 Terminator.

t $CACD Messaging: "A Wild Boar Rushes From TheUndergrowth,Squealling"
@ $CACD label=Messaging_WildBoarRushesFromUndergrowth
  $CACD,$4B "#STR$CACD,$08($b==$FF)".
B $CB18,$01 Terminator.

t $CB19 Messaging: "You Catch A Glimpse Of A FurtiveFigure..."
@ $CB19 label=Messaging_YouCatchGlimpseOfAFurtiveFigure
  $CB19,$2B "#STR$CB19,$08($b==$FF)".
B $CB44,$01 Terminator.

t $CB45 Messaging: "It Quickly Vanishes Into TheMilling Throng"
@ $CB45 label=Messaging_QuicklyVanishes
  $CB45,$2D "#STR$CB45,$08($b==$FF)".
B $CB72,$01 Terminator.

t $CB73 Messaging: "A Group Of Rats Scurry Off IntoHiding"
@ $CB73 label=Messaging_GroupOfRatsScurryOff
  $CB73,$28 "#STR$CB73,$08($b==$FF)".
B $CB9B,$01 Terminator.

t $CB9C Messaging: "From The Hut,You Hear A WomanSinging Sweetly"
@ $CB9C label=Messaging_FromTheHutYouHearWomanSinging
  $CB9C,$2F "#STR$CB9C,$08($b==$FF)".
B $CBCB,$01 Terminator.

t $CBCC Messaging: "The Woman Says:-"Warlord,I Can Guide You ThroughThe Swamp"
@ $CBCC label=Messaging_WomanSaysWarlordGuideSwamp
  $CBCC,$59 "#STR$CBCC,$08($b==$FF)".
B $CC25,$01 Terminator.

t $CC26 Messaging: "The Woman Goes East"
@ $CC26 label=Messaging_WomanGoesEast
  $CC26,$15 "#STR$CC26,$08($b==$FF)".
B $CC3B,$01 Terminator.

t $CC3C Messaging: "The Woman Goes South"
@ $CC3C label=Messaging_WomanGoesSouth
  $CC3C,$16 "#STR$CC3C,$08($b==$FF)".
B $CC52,$01 Terminator.

t $CC53 Messaging: "As You Watch,The Druid PerformsA Sacrificial Rite"
@ $CC53 label=Messaging_WatchDruidPerformsSacrificialRite
  $CC53,$76 "#STR$CC53,$08($b==$FF)".
B $CCC9,$01 Terminator.

t $CCCA Messaging: "The Unfortunate Slave PerishesAnd The Fire Goes Out"
@ $CCCA label=Messaging_SlavePerishes
  $CCCA,$35 "#STR$CCCA,$08($b==$FF)".
B $CCFF,$01 Terminator.

t $CD00 Messaging: "You Are Assailed By A FeelingOf Immense Fatigue"
@ $CD00 label=Messaging_FeelingImmenseFatigue
  $CD00,$5E "#STR$CD00,$08($b==$FF)".
B $CD5E,$01 Terminator.

t $CD5F Messaging: "You Cannot Hold Your Breath AnyLonger. You Are Drowning"
@ $CD5F label=Messaging_YouAreDrowning
  $CD5F,$3A "#STR$CD5F,$08($b==$FF)".
B $CD99,$01 Terminator.

t $CD9A Messaging: "You Fight Bravely,But The EvilCreatures Overwhelm You"
@ $CD9A label=Messaging_FightBravely
  $CD9A,$38 "#STR$CD9A,$08($b==$FF)".
B $CDD2,$01 Terminator.

t $CDD3 Messaging: "Don't Be Ridiculous"
@ $CDD3 label=Messaging_DontBeRidiculous
  $CDD3,$14 "#STR$CDD3,$08($b==$FF)".
B $CDE7,$01 Terminator.

t $CDE8 Messaging: "You've Done That Already"
@ $CDE8 label=Messaging_YouveDoneThatAlready
  $CDE8,$19 "#STR$CDE8,$08($b==$FF)".
B $CE01,$01 Terminator.

t $CE02 Messaging: "The Slab Lays Horizontally.A Groove Runs Along Its Length"
@ $CE02 label=Messaging_SlabLaysHorizontally
  $CE02,$3B "#STR$CE02,$08($b==$FF)".
B $CE3D,$01 Terminator.

t $CE3E Messaging: "You're Not Tired"
@ $CE3E label=Messaging_YoureNotTired
  $CE3E,$11 "#STR$CE3E,$08($b==$FF)".
B $CE4F,$01 Terminator.

t $CE50 Messaging: "You Fall Into A Deep Sleep"
@ $CE50 label=Messaging_YouFallIntoADeepSleep
  $CE50,$1B "#STR$CE50,$08($b==$FF)".
B $CE6B,$01 Terminator.

t $CE6C Messaging: "As You Slumber,A Shimmering,White,Female Figure"
@ $CE6C label=Messaging_AsYouSlumber
  $CE6C,$B5 "#STR$CE6C,$08($b==$FF)".
B $CF21,$01 Terminator.

t $CF22 Messaging: "You're Not Carrying Anything"
@ $CF22 label=Messaging_YoureNotCarryingAnything_Duplicate
  $CF22,$1D "#STR$CF22,$08($b==$FF)".
B $CF3F,$01 Terminator.

t $CF40 Messaging: "You See Nothing Special"
@ $CF40 label=Messaging_YouSeeNothingSpecial
  $CF40,$18 "#STR$CF40,$08($b==$FF)".
B $CF58,$01 Terminator.

t $CF59 Messaging: "It Is Looking Quite Bedraggled"
@ $CF59 label=Messaging_LookingQuiteBedraggled
  $CF59,$1F "#STR$CF59,$08($b==$FF)".
B $CF78,$01 Terminator.

t $CF79 Messaging: "It Is Sealed With Wax"
@ $CF79 label=Messaging_SealedWithWax
  $CF79,$C2 "#STR$CF79,$08($b==$FF)".
B $D03B,$01 Terminator.

t $D03C Messaging: "It Is The Helmet Of The God,Lug"
@ $D03C label=Messaging_HelmetOfGodlug
  $D03C,$20 "#STR$D03C,$08($b==$FF)".
B $D05C,$01 Terminator.

t $D05D Messaging: "There Is A Fissure In One Side"
@ $D05D label=Messaging_FissureInOneSide
  $D05D,$1F "#STR$D05D,$08($b==$FF)".
B $D07C,$01 Terminator.

t $D07D Messaging: "It's Perfectly Balanced For You"
@ $D07D label=Messaging_PerfectlyBalanced
  $D07D,$7A "#STR$D07D,$08($b==$FF)".
B $D0F7,$01 Terminator.

t $D0F8 Messaging: "The Blade Has A Blue Sheen"
@ $D0F8 label=Messaging_BladeWithBlueSheen
  $D0F8,$1B "#STR$D0F8,$08($b==$FF)".
B $D113,$01 Terminator.

t $D114 Messaging: "It Is Cut From A Precious Stone"
@ $D114 label=Messaging_CutFromPreciousStone
  $D114,$73 "#STR$D114,$08($b==$FF)".
B $D187,$01 Terminator.

t $D188 Messaging: "It Is Carved From Oak And IsStoutly Made"
@ $D188 label=Messaging_CarvedFromOak
  $D188,$2A "#STR$D188,$08($b==$FF)".
B $D1B2,$01 Terminator.

t $D1B3 Messaging: "The Body Is Very Emaciated"
@ $D1B3 label=Messaging_BodyVeryEmaciated
  $D1B3,$4B "#STR$D1B3,$08($b==$FF)".
B $D1FE,$01 Terminator.

t $D1FF Messaging: "This Neck Ring Is Fashioned FromGleaming Bronze"
@ $D1FF label=Messaging_NeckRingBronze
  $D1FF,$31 "#STR$D1FF,$08($b==$FF)".
B $D230,$01 Terminator.

t $D231 Messaging: "You Cannot Move It"
@ $D231 label=Messaging_YouCannotMoveIt
  $D231,$13 "#STR$D231,$08($b==$FF)".
B $D244,$01 Terminator.

t $D245 Messaging: "The Trader Snatches It Back,Angrily"
@ $D245 label=Messaging_TraderSnatchesItBack
  $D245,$25 "#STR$D245,$08($b==$FF)".
B $D26A,$01 Terminator.

t $D26B Messaging: "The Druid Is Deceptively Strong"
@ $D26B label=Messaging_DruidDeceptivelyStrong
  $D26B,$88 "#STR$D26B,$08($b==$FF)".
B $D2F3,$01 Terminator.

t $D2F4 Messaging: "He Doesn't Have It"
@ $D2F4 label=Messaging_HeDoesntHaveIt
  $D2F4,$13 "#STR$D2F4,$08($b==$FF)".
B $D307,$01 Terminator.

t $D308 Messaging: "The Body Does Not Have A Cloak"
@ $D308 label=Messaging_BodyDoesNotHaveCloak
  $D308,$1F "#STR$D308,$08($b==$FF)".
B $D327,$01 Terminator.

t $D328 Messaging: "The Bear Devours The Meat,ButIts Appetite Remains"
@ $D328 label=Messaging_BearDevoursMeat
  $D328,$33 "#STR$D328,$08($b==$FF)".
B $D35B,$01 Terminator.

t $D35C Messaging: "The Wolves Pounce Greedily OntoThe Meat"
@ $D35C label=Messaging_WolvesPounceGreedily
  $D35C,$4A "#STR$D35C,$08($b==$FF)".
B $D3A6,$01 Terminator.

t $D3A7 Messaging: "The Raven Takes The Acorns"
@ $D3A7 label=Messaging_RavenTakesAcorns
  $D3A7,$38 "#STR$D3A7,$08($b==$FF)".
B $D3DF,$01 Terminator.

t $D3E0 Messaging: "The Goddess Danu Stands BeforeYou"
@ $D3E0 label=Messaging_GoddessDanuStandsBeforeYou
  $D3E0,$C8 "#STR$D3E0,$08($b==$FF)".
B $D4A8,$01 Terminator.

t $D4A9 Messaging: "From Above,You Hear The BeatingOf Velvet Wings"
@ $D4A9 label=Messaging_FromAboveYouHear
  $D4A9,$4B "#STR$D4A9,$08($b==$FF)".
B $D4F4,$01 Terminator.

t $D4F5 Messaging: "He Doesn't Want It.He's Dropped It"
@ $D4F5 label=Messaging_HeDoesntWantIt
  $D4F5,$24 "#STR$D4F5,$08($b==$FF)".
B $D519,$01 Terminator.

t $D51A Messaging: "It Is Not On The Slab"
@ $D51A label=Messaging_ItIsNotOnTheSlab
  $D51A,$16 "#STR$D51A,$08($b==$FF)".
B $D530,$01 Terminator.

t $D531 Messaging: "The Guard Accepts The Salt"
@ $D531 label=Messaging_GuardAcceptsSalt
  $D531,$5D "#STR$D531,$08($b==$FF)".
B $D58E,$01 Terminator.

t $D58F Messaging: "He Accepts The Iron As Payment"
@ $D58F label=Messaging_AcceptsIronAsPayment
  $D58F,$57 "#STR$D58F,$08($b==$FF)".
B $D5E6,$01 Terminator.

t $D5E7 Messaging: "The Trader Takes It And Says:-Thank You!"
@ $D5E7 label=Messaging_TraderTakesItSaysThankYou
  $D5E7,$58 "#STR$D5E7,$08($b==$FF)".
B $D63F,$01 Terminator.

t $D640 Messaging: "The Druid Removes The Amulet"
@ $D640 label=Messaging_DruidRemovesTheAmulet
  $D640,$54 "#STR$D640,$08($b==$FF)".
B $D694,$01 Terminator.

t $D695 Messaging: "You Are Getting Too Close!"
@ $D695 label=Messaging_GettingTooClose
  $D695,$1A "#STR$D695,$08($b==$FF)".
B $D6AF,$01 Terminator.

t $D6B0 Messaging: "The Mighty Paws Encircle You"
@ $D6B0 label=Messaging_MightyPaws
  $D6B0,$32 "#STR$D6B0,$08($b==$FF)".
B $D6E2,$01 Terminator.

t $D6E3 Messaging: "The Wolves Are Upon You"
@ $D6E3 label=Messaging_WolvesUponYou
  $D6E3,$33 "#STR$D6E3,$08($b==$FF)".
B $D716,$01 Terminator.

t $D717 Messaging: "The Bear Eats The Food"
@ $D717 label=Messaging_BearEatsFood
  $D717,$17 "#STR$D717,$08($b==$FF)".
B $D72E,$01 Terminator.

t $D72F Messaging: "The Wolves Eat The Food"
@ $D72F label=Messaging_WolvesEatTheFood
  $D72F,$18 "#STR$D72F,$08($b==$FF)".
B $D747,$01 Terminator.

t $D748 Messaging: "You're Not In It"
@ $D748 label=Messaging_YoureNotInIt
  $D748,$11 "#STR$D748,$08($b==$FF)".
B $D759,$01 Terminator.

t $D75A Messaging: "It Isn't Tied"
@ $D75A label=Messaging_ItIsntTied
  $D75A,$0E "#STR$D75A,$08($b==$FF)".
B $D768,$01 Terminator.

t $D769 Messaging: "He Isn't Tied"
@ $D769 label=Messaging_HeIsntTied
  $D769,$0E "#STR$D769,$08($b==$FF)".
B $D777,$01 Terminator.

t $D778 Messaging: "Now Free,The Ox Becomes Enraged"
@ $D778 label=Messaging_OxBecomesEnraged
  $D778,$3D "#STR$D778,$08($b==$FF)".
B $D7B5,$01 Terminator.

t $D7B6 Messaging: "You Release Him"
@ $D7B6 label=Messaging_YouReleaseHim
  $D7B6,$42 "#STR$D7B6,$08($b==$FF)".
B $D7F8,$01 Terminator.

t $D7F9 Messaging: "The Air Becomes Charged WithImmense Power"
@ $D7F9 label=Messaging_AirChargedWithImmensePower
  $D7F9,$DB "#STR$D7F9,$08($b==$FF)".
B $D8D4,$01 Terminator.

t $D8D5 Messaging: "He Then Vanishes"
@ $D8D5 label=Messaging_ThenVanishes
  $D8D5,$11 "#STR$D8D5,$08($b==$FF)".
B $D8E6,$01 Terminator.

t $D8E7 Messaging: "You Drink Some Water"
@ $D8E7 label=Messaging_DrinkSomeWater
  $D8E7,$15 "#STR$D8E7,$08($b==$FF)".
B $D8FC,$01 Terminator.

t $D8FD Messaging: "You Can't. It's Salt Water"
@ $D8FD label=Messaging_CantSaltWater
  $D8FD,$1B "#STR$D8FD,$08($b==$FF)".
B $D918,$01 Terminator.

t $D919 Messaging: "You Plunge Into The Lake"
@ $D919 label=Messaging_PlungeIntoLake
  $D919,$59 "#STR$D919,$08($b==$FF)".
B $D972,$01 Terminator.

t $D973 Messaging: "You Take A Refreshing Dip"
@ $D973 label=Messaging_TakeARefreshingDip
  $D973,$2F "#STR$D973,$08($b==$FF)".
B $D9A2,$01 Terminator.

t $D9A3 Messaging: "You're In Nothing You Need ToClimb Out Of"
@ $D9A3 label=Messaging_YoureInNothingYouNeedToClimbOutOf
  $D9A3,$2B "#STR$D9A3,$08($b==$FF)".
B $D9CE,$01 Terminator.

t $D9CF Messaging: "The Ring Is Formed From Closeset Crystals"
@ $D9CF label=Messaging_RingIsFormedFromClosesetCrystals
  $D9CF,$54 "#STR$D9CF,$08($b==$FF)".
B $DA23,$01 Terminator.

t $DA24 Messaging: "Try A More Measured Approach"
@ $DA24 label=Messaging_TryMoreMeasuredApproach
  $DA24,$1D "#STR$DA24,$08($b==$FF)".
B $DA41,$01 Terminator.

t $DA42 Messaging: "You Plummet Onto The Rock Floor"
@ $DA42 label=Messaging_PlummetOntoTheRockFloor
  $DA42,$3F "#STR$DA42,$08($b==$FF)".
B $DA81,$01 Terminator.

t $DA82 Messaging: "You Are Already Wearing It"
@ $DA82 label=Messaging_AlreadyWearingIt
  $DA82,$1B "#STR$DA82,$08($b==$FF)".
B $DA9D,$01 Terminator.

t $DA9E Messaging: "The Urn Lands In The Fire"
@ $DA9E label=Messaging_UrnLandsInTheFire
  $DA9E,$72 "#STR$DA9E,$08($b==$FF)".
B $DB10,$01 Terminator.

t $DB11 Messaging: "From The Flames March TheShadowy Forms Of The Nemedianhost"
@ $DB11 label=Messaging_FromTheFlames
  $DB11,$AC "#STR$DB11,$08($b==$FF)".
B $DBBD,$01 Terminator.

t $DBBE Messaging: "You Already Carry The Shield InA Defensive Position"
@ $DBBE label=Messaging_AlreadyCarryShield
  $DBBE,$35 "#STR$DBBE,$08($b==$FF)".
B $DBF3,$01 Terminator.

t $DBF4 Messaging: "Don't Be Disgusting"
@ $DBF4 label=Messaging_DontBeDisgusting
  $DBF4,$14 "#STR$DBF4,$08($b==$FF)".
B $DC08,$01 Terminator.

t $DC09 Messaging: "You Must Be Joking"
@ $DC09 label=Messaging_MustBeJoking
  $DC09,$13 "#STR$DC09,$08($b==$FF)".
B $DC1C,$01 Terminator.

t $DC1D Messaging: "You Are Filled With RenewedEnergy"
@ $DC1D label=Messaging_FilledWithRenewedEnergy
  $DC1D,$23 "#STR$DC1D,$08($b==$FF)".
B $DC40,$01 Terminator.

t $DC41 Messaging: "It Was A Little Tough"
@ $DC41 label=Messaging_WasLittleTough
  $DC41,$16 "#STR$DC41,$08($b==$FF)".
B $DC57,$01 Terminator.

t $DC58 Messaging: "You Capture The UnsuspectingRoman"
@ $DC58 label=Messaging_CaptureTheUnsuspectingRoman
  $DC58,$44 "#STR$DC58,$08($b==$FF)".
B $DC9C,$01 Terminator.

t $DC9D Messaging: "What With?"
@ $DC9D label=Messaging_WhatWith
  $DC9D,$0A "#STR$DC9D,$08($b==$FF)".
B $DCA7,$01 Terminator.

t $DCA8 Messaging: "He's Not Interested"
@ $DCA8 label=Messaging_HesNotInterested
  $DCA8,$14 "#STR$DCA8,$08($b==$FF)".
B $DCBC,$01 Terminator.

t $DCBD Messaging: "You Feel A Sense Of RushingMovement..."
@ $DCBD label=Messaging_SenseOfRushingMovement
  $DCBD,$27 "#STR$DCBD,$08($b==$FF)".
B $DCE4,$01 Terminator.

t $DCE5 Messaging: "You Don't Have A Weopon"
@ $DCE5 label=Messaging_DontHaveAWeopon
  $DCE5,$18 "#STR$DCE5,$08($b==$FF)".
B $DCFD,$01 Terminator.

t $DCFE Messaging: "The Roman Is Unnerved By TheFerocity Of Your Attack"
@ $DCFE label=Messaging_RomanIsUnnerved
  $DCFE,$4B "#STR$DCFE,$08($b==$FF)".
B $DD49,$01 Terminator.

t $DD4A Messaging: "Your Blow Strikes True.He Is Dead"
@ $DD4A label=Messaging_BlowStrikesTrue
  $DD4A,$23 "#STR$DD4A,$08($b==$FF)".
B $DD6D,$01 Terminator.

t $DD6E Messaging: "That Was Very Cowardly"
@ $DD6E label=Messaging_VeryCowardly
  $DD6E,$17 "#STR$DD6E,$08($b==$FF)".
B $DD85,$01 Terminator.

t $DD86 Messaging: "You Attack In Vain"
@ $DD86 label=Messaging_AttackInVain
  $DD86,$2E "#STR$DD86,$08($b==$FF)".
B $DDB4,$01 Terminator.

t $DDB5 Messaging: "The Fomorian Is Unaffected ByYour Blows"
@ $DDB5 label=Messaging_FomorianUnaffected
  $DDB5,$29 "#STR$DDB5,$08($b==$FF)".
B $DDDE,$01 Terminator.

t $DDDF Messaging: "O.K. It No Longer Suffers"
@ $DDDF label=Messaging_NoLongerSuffers
  $DDDF,$1A "#STR$DDDF,$08($b==$FF)".
B $DDF9,$01 Terminator.

t $DDFA Messaging: "You Are Mobbed By The AngryVillagers"
@ $DDFA label=Messaging_MobbedByAngryVillagers
  $DDFA,$36 "#STR$DDFA,$08($b==$FF)".
B $DE30,$01 Terminator.

t $DE31 Messaging: "You Can't.There Are Too ManyOf Them"
@ $DE31 label=Messaging_YouCantTooManyOfThem
  $DE31,$25 "#STR$DE31,$08($b==$FF)".
B $DE56,$01 Terminator.

t $DE57 Messaging: "You Attack Boldly"
@ $DE57 label=Messaging_AttackBoldly
  $DE57,$46 "#STR$DE57,$08($b==$FF)".
B $DE9D,$01 Terminator.

t $DE9E Messaging: "Your Blow Strikes True.It Is Dead"
@ $DE9E label=Messaging_YourBlowStrikesTrue
  $DE9E,$23 "#STR$DE9E,$08($b==$FF)".
B $DEC1,$01 Terminator.

t $DEC2 Messaging: "A Guard,On The Rampart Above,Flings A Spear"
@ $DEC2 label=Messaging_GuardOnTheRampartAbove
  $DEC2,$2D "#STR$DEC2,$08($b==$FF)".
B $DEEF,$01 Terminator.

t $DEF0 Messaging: "The Druid Avoids Your Blow"
@ $DEF0 label=Messaging_DruidAvoidsBlow
  $DEF0,$42 "#STR$DEF0,$08($b==$FF)".
B $DF32,$01 Terminator.

t $DF33 Messaging: "You're Not In Water"
@ $DF33 label=Messaging_YoureNotInWater
  $DF33,$14 "#STR$DF33,$08($b==$FF)".
B $DF47,$01 Terminator.

t $DF48 Messaging: "As You Move Through The Firecurtain"
@ $DF48 label=Messaging_MoveThroughFirecurtain
  $DF48,$39 "#STR$DF48,$08($b==$FF)".
B $DF81,$01 Terminator.

t $DF82 Messaging: "The Woman Is Transformed..."
@ $DF82 label=Messaging_TheWomanTransformed
  $DF82,$6E "#STR$DF82,$08($b==$FF)".
B $DFF0,$01 Terminator.

t $DFF1 Messaging: "The Torc Warms Up As You Look"
@ $DFF1 label=Messaging_TorcWarmsUp
  $DFF1,$1D "#STR$DFF1,$08($b==$FF)".
B $E00E,$01 Terminator.

t $E00F Messaging: "Toward The Hut"
@ $E00F label=Messaging_TowardHut
  $E00F,$0F "#STR$E00F,$08($b==$FF)".
B $E01E,$01 Terminator.

t $E01F Messaging: "North"
@ $E01F label=Messaging_North_Duplicate
  $E01F,$06 "#STR$E01F,$08($b==$FF)".
B $E025,$01 Terminator.

t $E026 Messaging: "North,East & West"
@ $E026 label=Messaging_NorthEastWest
  $E026,$12 "#STR$E026,$08($b==$FF)".
B $E038,$01 Terminator.

t $E039 Messaging: "South & East"
@ $E039 label=Messaging_SouthEast
  $E039,$0D "#STR$E039,$08($b==$FF)".
B $E046,$01 Terminator.

t $E047 Messaging: "West"
@ $E047 label=Messaging_West
  $E047,$05 "#STR$E047,$08($b==$FF)".
B $E04C,$01 Terminator.

t $E04D Messaging: "South,East & West"
@ $E04D label=Messaging_SouthEastWest
  $E04D,$12 "#STR$E04D,$08($b==$FF)".
B $E05F,$01 Terminator.

t $E060 Messaging: "The Salt Has Dissolved"
@ $E060 label=Messaging_SaltHasDissolved
  $E060,$18 "#STR$E060,$08($b==$FF)".
B $E078,$01 Terminator.

t $E079 Messaging: "The Guard Prevents You"
@ $E079 label=Messaging_GuardPreventsYou
  $E079,$17 "#STR$E079,$08($b==$FF)".
B $E090,$01 Terminator.

t $E091 Messaging: "You've Nothing To Tie Him With"
@ $E091 label=Messaging_YouveNothingToTieHimWith
  $E091,$1F "#STR$E091,$08($b==$FF)".
B $E0B0,$01 Terminator.

t $E0B1 Table: Vocabulary
@ $E0B1 label=Table_Vocabulary
  $E0B1,$04 Command #N$00.
  $E0B5,$09 Command #N$01.
  $E0BE,$09 Command #N$02.
  $E0C7,$04 Command #N$03.
  $E0CB,$04 Command #N$04.
  $E0CF,$04 Command #N$05.
  $E0D3,$04 Command #N$06.
  $E0D7,$04 Command #N$07.
  $E0DB,$09 Command #N$08.
  $E0E4,$09 Command #N$09.
  $E0ED,$09 Command #N$0A.
  $E0F6,$09 Command #N$0B.
  $E0FF,$09 Command #N$0C.
  $E108,$09 Command #N$0D.
  $E111,$09 Command #N$0E.
  $E11A,$04 Command #N$0F.
  $E11E,$04 Command #N$10.
  $E122,$13 Command #N$11.
  $E135,$0E Command #N$12.
  $E143,$04 Command #N$13.
  $E147,$04 Command #N$14.
  $E14B,$04 Command #N$15.
  $E14F,$04 Command #N$16.
  $E153,$04 Command #N$17.
  $E157,$04 Command #N$18.
  $E15B,$13 Command #N$19.
  $E16E,$04 Command #N$1A.
  $E172,$04 Command #N$1B.
  $E176,$0E Command #N$1C.
  $E184,$09 Command #N$1D.
  $E18D,$04 Command #N$1E.
  $E191,$04 Command #N$1F.
  $E195,$04 Command #N$20.
  $E199,$04 Command #N$21.
  $E19D,$09 Command #N$22.
  $E1A6,$04 Command #N$23.
  $E1AA,$04 Command #N$24.
  $E1AE,$04 Command #N((#PC-$E11A)/$04).
L $E1AE,$04,$1F
  $E22A,$09 Command #N$44.
  $E233,$04 Command #N$45.
  $E237,$04 Command #N$46.
  $E23B,$04 Command #N$47.
  $E23F,$04 Command #N$48.
  $E243,$04 Command #N$49.
  $E247,$04 Command #N$4A.
  $E24B,$09 Command #N$4B.
  $E254,$04 Command #N((#PC-$E11A)/$04).
L $E254,$04,$20
  $E2D4,$09 Command #N$6E.
  $E2DD,$04 Command #N$6F.
  $E2E1,$09 Command #N$70.
  $E2EA,$09 Command #N$71.
  $E2F3,$04 Command #N((#PC-$E12F)/$04).
L $E2F3,$04,$05
B $E307,$01 Terminator.

g $E308 Table: Object List?
@ $E308 label=Table_ObjectList
B $E308,$01 Object #N(#PEEK(#PC)): #OBJECT(#PEEK(#PC)).
L $E308,$01,$39

g $E341 Data: Item Groups
D $E341 See #R$E417 for usage.
@ $E341 label=Data_ItemGroup_Roman
@ $E348 label=Data_ItemGroup_Fomorian
@ $E34F label=Data_ItemGroup_Boar
@ $E351 label=Data_ItemGroup_Rats
@ $E353 label=Data_ItemGroup_Hare
@ $E356 label=Data_ItemGroup_Trap
@ $E359 label=Data_ItemGroup_Pool
@ $E35E label=Data_ItemGroup_Salt
@ $E360 label=Data_ItemGroup_ClayPot
@ $E362 label=Data_ItemGroup_Acorns
@ $E364 label=Data_ItemGroup_Urn
@ $E366 label=Data_ItemGroup_Torc
@ $E369 label=Data_ItemGroup_Raven
@ $E36B label=Data_ItemGroup_Helmet
@ $E36E label=Data_ItemGroup_Food
@ $E370 label=Data_ItemGroup_Iron
@ $E372 label=Data_ItemGroup_StoneMonolith
@ $E374 label=Data_ItemGroup_Fissure
@ $E377 label=Data_ItemGroup_Warrior
@ $E37F label=Data_ItemGroup_ShadowLikeDemons
@ $E381 label=Data_ItemGroup_Hut
@ $E386 label=Data_ItemGroup_Vase
@ $E388 label=Data_ItemGroup_Cavern
@ $E392 label=Data_ItemGroup_Sword
@ $E396 label=Data_ItemGroup_Meat
@ $E399 label=Data_ItemGroup_Trader
@ $E39B label=Data_ItemGroup_Woman
@ $E39D label=Data_ItemGroup_Wolves
@ $E39F label=Data_ItemGroup_Bear
@ $E3A2 label=Data_ItemGroup_Guard
@ $E3A4 label=Data_ItemGroup_Druid
@ $E3A6 label=Data_ItemGroup_Amulet
@ $E3AA label=Data_ItemGroup_Ring
@ $E3AD label=Data_ItemGroup_Pig
@ $E3B0 label=Data_ItemGroup_Rope
@ $E3B6 label=Data_ItemGroup_Ox
@ $E3BA label=Data_ItemGroup_Skull
@ $E3BC label=Data_ItemGroup_Shield
@ $E3BE label=Data_ItemGroup_Fire
@ $E3C2 label=Data_ItemGroup_Pit
@ $E3C5 label=Data_ItemGroup_Ladder
@ $E3CA label=Data_ItemGroup_Straw
@ $E3CD label=Data_ItemGroup_Staff
@ $E3CF label=Data_ItemGroup_Body
@ $E3DD label=Data_ItemGroup_Cloak
@ $E3E1 label=Data_ItemGroup_Silver
@ $E3E3 label=Data_ItemGroup_Platform
@ $E3E7 label=Data_ItemGroup_Water
@ $E3EE label=Data_ItemGroup_Lug
@ $E3F0 label=Data_ItemGroup_Danu
@ $E3F2 label=Data_ItemGroup_Minerva
@ $E3F4 label=Data_ItemGroup_Chariot
@ $E3F6 label=Data_ItemGroup_Slab
@ $E3F9 label=Data_ItemGroup_Groove
@ $E3FC label=Data_ItemGroup_Lake
@ $E3FE label=Data_ItemGroup_Hillfort
@ $E407 label=Data_ItemGroup_Broch
B $E341,$01 #IF(#PEEK(#PC)==$FF)(Terminator,Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC))).
L $E341,$01,$D6

g $E417 Table: Item Grouping
@ $E417 label=Table_ItemGrouping
D $E417 Items may have several item IDs which relate to a single item, this
. table groups the items together to assist the parser with knowing that tokens
. refer to the same thing.
.
. Some examples are:
. #TABLE(default,centre,centre,centre)
. { =h Item ID | =h Item Name | =h Relates To: }
. { #R$E353(#N$13) | #ITEM$13 | =r2 The Hare }
. { #R$E354(#N$26) | #ITEM$26 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { #R$E36B(#N$1F) | #ITEM$1F | =r2 The Bronze Helmet }
. { #R$E36C(#N$20) | #ITEM$20 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { #R$E3AD(#N$4F) | #ITEM$4F | =r2 The Pig }
. { #R$E3AE(#N$50) | #ITEM$50 }
. TABLE#
W $E417,$02 Item Group: #N((#PC-$E417)/$02): #OBJECT((#PC-$E417)/$02).
L $E417,$02,$39

g $E489 Table: Verb Word Tokens
@ $E489 label=Table_VerbWordTokens
D $E489 A list of all available verb tokens in the game. See #R$A7EA.
B $E489,$01 Verb word token #N(#PEEK(#PC)): #TOKEN(#PEEK(#PC)).
L $E489,$01,$21

g $E4AA
B $E4AA,$01 #IF(#PEEK(#PC)==$FF)(Terminator,Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC))).
L $E4AA,$01,$3C

g $E4E6 Table: Scenic Event Locations
@ $E4E6 label=Table_ScenicEventLocations
D $E4E6 A table where the index is the event ID, and the value is the room it
. resides in (#N$00 for "currently inactive"). See #R$A7EE for the count.
B $E4E6,$01 Event #N(#PC-$E4E6) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $E4E6,$01,$11

g $E4F8
W $E4F8,$02
L $E4F8,$02,$08

g $E508 Table: Scenic Event Locations 2
@ $E508 label=Table_ScenicEventLocations2
D $E508 A table where the index is the event ID, and the value is the room it
. resides in (#N$00 for "currently inactive"). See #R$A7EE for the count.
B $E508,$01 Event #N(#PC-$E508) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $E508,$01,$11

g $E519 Data: Phrase Tokens
D $E519 The user input is broken down into tokens which represent the words
. they've entered. These tokens are then compared against these token patterns
. to determine the outcome the player was trying to communicate.
N $E519 Matches e.g. "urn".
@ $E519 label=PhraseTokens_Urn
N $E51B Matches e.g. "helmet", "bronze helmet".
@ $E51B label=PhraseTokens_Helmet
N $E520 Matches e.g. "monolith", "stone monolith".
@ $E520 label=PhraseTokens_Monolith
N $E525 Matches e.g. "sword".
@ $E525 label=PhraseTokens_Sword
N $E527 Matches e.g. "amulet", "talisman".
@ $E527 label=PhraseTokens_Amulet
N $E529 Matches e.g. "staff", "oak staff".
@ $E529 label=PhraseTokens_Staff
N $E52E Matches e.g. "body".
@ $E52E label=PhraseTokens_Body
N $E530 Matches e.g. "torc", "bronze torc".
@ $E530 label=PhraseTokens_Torc
N $E535 Matches e.g. "salt".
@ $E535 label=PhraseTokens_Salt
N $E537 Matches e.g. "pot", "clay pot".
@ $E537 label=PhraseTokens_Pot
N $E53C Matches e.g. "acorns".
@ $E53C label=PhraseTokens_Acorns
N $E53E Matches e.g. "food".
@ $E53E label=PhraseTokens_Food
N $E540 Matches e.g. "iron".
@ $E540 label=PhraseTokens_Iron
N $E542 Matches e.g. "vase".
@ $E542 label=PhraseTokens_Vase
N $E544 Matches e.g. "meat".
@ $E544 label=PhraseTokens_Meat
N $E546 Matches e.g. "slab", "stone slab".
@ $E546 label=PhraseTokens_Slab
N $E54B Matches e.g. "rope".
@ $E54B label=PhraseTokens_Rope
N $E54D Matches e.g. "skull", "human skull".
@ $E54D label=PhraseTokens_Skull
N $E552 Matches e.g. "shield".
@ $E552 label=PhraseTokens_Shield
N $E554 Matches e.g. "ladder".
@ $E554 label=PhraseTokens_Ladder
N $E556 Matches e.g. "cloak", "white cloak".
@ $E556 label=PhraseTokens_Cloak
N $E55B Matches e.g. "silver".
@ $E55B label=PhraseTokens_Silver
N $E55D Matches e.g. "meat from trader".
@ $E55D label=PhraseTokens_MeatFromTrader
N $E561 Matches e.g. "amulet from druid", "talisman from druid".
@ $E561 label=PhraseTokens_AmuletFromDruid
N $E565 Matches e.g. "cloak from body".
@ $E565 label=PhraseTokens_CloakFromBody
N $E569 Matches e.g. "meat to bear".
@ $E569 label=PhraseTokens_MeatToBear
N $E56D Matches e.g. "meat to wolves".
@ $E56D label=PhraseTokens_MeatToWolves
N $E571 Matches e.g. "acorns to raven".
@ $E571 label=PhraseTokens_AcornsToRaven
N $E575 Matches e.g. "sword to trader".
@ $E575 label=PhraseTokens_SwordToTrader
N $E579 Matches e.g. "salt to guard".
@ $E579 label=PhraseTokens_SaltToGuard
N $E57D Matches e.g. "iron to trader".
@ $E57D label=PhraseTokens_IronToTrader
N $E581 Matches e.g. "roman to druid".
@ $E581 label=PhraseTokens_RomanToDruid
N $E585 Matches e.g. "food to bear".
@ $E585 label=PhraseTokens_FoodToBear
N $E589 Matches e.g. "food to wolves".
@ $E589 label=PhraseTokens_FoodToWolves
N $E58D Matches e.g. "salt to trader".
@ $E58D label=PhraseTokens_SaltToTrader
N $E591 Matches e.g. "sword from slab", "sword from stone slab", "sword from
. groove".
@ $E591 label=PhraseTokens_SwordFromSlab
N $E59E Matches e.g. "salt to warrior", "salt to armed warrior".
@ $E59E label=PhraseTokens_SaltToWarrior
N $E5A7 Matches e.g. "helmet to trader", "bronze helmet to trader".
@ $E5A7 label=PhraseTokens_HelmetToTrader
N $E5B0 Matches e.g. "shield to trader".
@ $E5B0 label=PhraseTokens_ShieldToTrader
N $E5B4 Matches e.g. "iron to guard".
@ $E5B4 label=PhraseTokens_IronToGuard
N $E5B8 Matches e.g. "helmet to guard", "bronze helmet to guard".
@ $E5B8 label=PhraseTokens_HelmetToGuard
N $E5C1 Matches e.g. "silver to druid".
@ $E5C1 label=PhraseTokens_SilverToDruid
N $E5C5 Matches e.g. "helmet to druid", "bronze helmet to druid".
@ $E5C5 label=PhraseTokens_HelmetToDruid
N $E5CE Matches e.g. "iron to druid".
@ $E5CE label=PhraseTokens_IronToDruid
N $E5D2 Matches e.g. "meat at bear".
@ $E5D2 label=PhraseTokens_MeatAtBear
N $E5D6 Matches e.g. "meat at wolves".
@ $E5D6 label=PhraseTokens_MeatAtWolves
N $E5DA Matches e.g. "food at bear".
@ $E5DA label=PhraseTokens_FoodAtBear
N $E5DE Matches e.g. "food at wolves".
@ $E5DE label=PhraseTokens_FoodAtWolves
N $E5E2 Matches e.g. "roman".
@ $E5E2 label=PhraseTokens_Roman
N $E5E4 Matches e.g. "hare".
@ $E5E4 label=PhraseTokens_Hare
N $E5E6 Matches e.g. "ox", "wild ox".
@ $E5E6 label=PhraseTokens_Ox
N $E5EB Matches e.g. "trap", "hare from trap".
@ $E5EB label=PhraseTokens_Trap
N $E5F1 Matches e.g. "pig".
@ $E5F1 label=PhraseTokens_Pig
N $E5F3 Matches e.g. "water".
@ $E5F3 label=PhraseTokens_Water
N $E5F5 Matches e.g. "in pool", "into pool", "in pool of water", "into pool of
. water", "in deep pool", "into deep pool", "in deep pool of water", "into deep
. pool of water".
@ $E5F5 label=PhraseTokens_IntoPool
N $E607 Matches e.g. "in lake", "into lake".
@ $E607 label=PhraseTokens_IntoLake
N $E60A Matches e.g. "in water", "into water".
@ $E60A label=PhraseTokens_IntoWater
N $E60D Matches e.g. "on straw", "onto straw", "on pile of straw", "onto pile
. of straw", "on straw pile", "onto straw pile", "from platform".
@ $E60D label=PhraseTokens_OntoStraw
N $E61C Matches e.g. "out of pool", "out of pool of water", "out of deep pool",
. "out of deep pool of water".
@ $E61C label=PhraseTokens_OutOfPool
N $E632 Matches e.g. "out of lake".
@ $E632 label=PhraseTokens_OutOfLake
N $E636 Matches e.g. "out of water".
@ $E636 label=PhraseTokens_OutOfWater
N $E63A Matches e.g. "out".
@ $E63A label=PhraseTokens_Out
N $E63C Matches e.g. "u ladder", "up ladder".
@ $E63C label=PhraseTokens_UpLadder
N $E63F Matches e.g. "d ladder", "down ladder".
@ $E63F label=PhraseTokens_DownLadder
N $E642 Matches e.g. "n", "north".
@ $E642 label=PhraseTokens_North
N $E644 Matches e.g. "s", "south".
@ $E644 label=PhraseTokens_South
N $E646 Matches e.g. "e", "east".
@ $E646 label=PhraseTokens_East
N $E648 Matches e.g. "w", "west".
@ $E648 label=PhraseTokens_West
N $E64A Matches e.g. "u", "up".
@ $E64A label=PhraseTokens_Up
N $E64C Matches e.g. "d", "down".
@ $E64C label=PhraseTokens_Down
N $E64E Matches e.g. "fissure", "monolith", "stone monolith".
@ $E64E label=PhraseTokens_Fissure
N $E655 Matches e.g. "hut".
@ $E655 label=PhraseTokens_Hut
N $E657 Matches e.g. "cavern".
@ $E657 label=PhraseTokens_Cavern
N $E659 Matches e.g. "in ring", "into ring", "in crystal ring", "into crystal
. ring", "in ring of crystals", "into ring of crystals".
@ $E659 label=PhraseTokens_IntoRing
N $E665 Matches e.g. "ring", "crystal ring", "ring of crystals".
@ $E665 label=PhraseTokens_Ring
N $E66E Matches e.g. "urn in fire", "urn in flames", "urn into fire", "urn into
. flames".
@ $E66E label=PhraseTokens_UrnIntoFire
N $E672 Matches e.g. "ladder against platform".
@ $E672 label=PhraseTokens_LadderAgainstPlatform
N $E676 Matches e.g. "sword on slab", "sword onto slab", "sword on stone slab",
. "sword onto stone slab", "sword in groove", "sword into groove".
@ $E676 label=PhraseTokens_SwordOnSlab
N $E683 Matches e.g. "meat from trader", "meat".
@ $E683 label=PhraseTokens__MeatFromTrader
N $E689 Matches e.g. "meat with iron", "meat using iron", "meat from trader
. with iron", "meat from trader using iron".
@ $E689 label=PhraseTokens_MeatWithIron
N $E693 Matches e.g. "meat with salt", "meat using salt", "meat from trader
. with salt", "meat from trader using salt", "meat with acorns", "meat using
. acorns", "meat from trader with acorns", "meat from trader using acorns",
. "meat with helmet", "meat using helmet", "meat from trader with helmet",
. "meat from trader using helmet", "meat with sword", "meat using sword", "meat
. from trader with sword", "meat from trader using sword".
@ $E693 label=PhraseTokens_MeatWithSalt
N $E6BB Matches e.g. "in ring", "into ring", "in crystal ring", "into crystal
. ring", "in ring of crystals", "into ring of crystals".
@ $E6BB label=PhraseTokens_IntoRing_Duplicate
N $E6C7 Matches e.g. "roman", "roman with sword", "roman using sword".
@ $E6C7 label=PhraseTokens_RomanWithSword
N $E6CD Matches e.g. "fomorian", "fomorian with sword", "fomorian using sword".
@ $E6CD label=PhraseTokens_Fomorian
N $E6D3 Matches e.g. "hare", "hare with sword", "hare using sword".
@ $E6D3 label=PhraseTokens_HareWithSword
N $E6D9 Matches e.g. "trader", "trader with sword", "trader using sword".
@ $E6D9 label=PhraseTokens_Trader
N $E6DF Matches e.g. "warrior", "armed warrior".
@ $E6DF label=PhraseTokens_Warrior
N $E6E4 Matches e.g. "wolves", "wolves with sword", "wolves using sword".
@ $E6E4 label=PhraseTokens_Wolves
N $E6EA Matches e.g. "bear", "bear with sword", "bear using sword".
@ $E6EA label=PhraseTokens_Bear
N $E6F0 Matches e.g. "guard", "guard with sword", "guard using sword".
@ $E6F0 label=PhraseTokens_Guard
N $E6F6 Matches e.g. "druid", "druid with sword", "druid using sword".
@ $E6F6 label=PhraseTokens_Druid
N $E6FC Matches e.g. "pig", "pig with sword", "pig using sword".
@ $E6FC label=PhraseTokens_PigWithSword
N $E702 Matches e.g. "ox", "wild ox", "ox with sword", "ox using sword", "wild
. ox with sword", "wild ox using sword".
@ $E702 label=PhraseTokens_OxWithSword
N $E710 Matches e.g. "hill".
@ $E710 label=PhraseTokens_Hill
N $E712 Matches e.g. "broch".
@ $E712 label=PhraseTokens_Broch
B $E519,$01 #TOKEN(#PEEK(#PC)).
L $E519,$01,$1FB,$02

g $E714 Table: Room Map
@ $E714 label=Table_RoomMap
N $E714 Room #N((#PC-$E714)/$06): #ROOM((#PC-$E714)/$06).
B $E714,$01 #IF(#PEEK(#PC)>$00)(North to room: #R($E714+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E715,$01 #IF(#PEEK(#PC)>$00)(South to room: #R($E714+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E716,$01 #IF(#PEEK(#PC)>$00)(East to room: #R($E714+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E717,$01 #IF(#PEEK(#PC)>$00)(West to room: #R($E714+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E718,$01 #IF(#PEEK(#PC)>$00)(Up to room: #R($E714+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E719,$01 #IF(#PEEK(#PC)>$00)(Down to room: #R($E714+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
L $E714,$06,$66

g $E978 Table: Configurable Exits
@ $E978 label=Table_ConfigurableExits
W $E978,$02
L $E978,$02,$0B

c $E98E Event Routing
@ $E98E label=EventRouting
R $E98E DE
R $E98E HL
R $E98E A
  $E98E,$01 Stash #REGbc on the stack.
  $E98F,$02 CPIR.
  $E991,$01 Restore #REGhl from the stack.
  $E992,$01 Return if the item wasn't found.
  $E993,$03 #REGix=#REGde (using the stack).
  $E996,$01 Increment #REGbc by one.
  $E997,$03 #REGhl-=#REGbc.
  $E99A,$01 #REGe=#REGl.
  $E99B,$03 Call #R$AB88.
  $E99E,$01 Jump to *#REGhl.

c $E99F Game Loop
@ $E99F label=GameLoop
  $E99F,$03 Call #R$AB0A.
  $E9A2,$03 Call #R$AFEB.
  $E9A5,$03 Call #R$AD32.
  $E9A8,$03 Call #R$AFC7.
  $E9AB,$02 Jump to #R$E99F if the item isn't present.
  $E9AD,$03 Call #R$B05E.
  $E9B0,$02 Jump to #R$E99F.

c $E9B2 Game Over
@ $E9B2 label=GameOver
N $E9B2 Print "#STR$A8EF,$08($b==$FF)".
  $E9B2,$03 #REGhl=#R$A8EF.
  $E9B5,$03 Call #R$A592.
N $E9B8 Print the percentage of the game the player achieved.
@ $E9B8 label=GameOver_Score
  $E9B8,$03 Call #R$B0A9.
@ $E9BB label=WantAnotherGameInput
N $E9BB Print "#STR$A8FD,$08($b==$FF)".
  $E9BB,$03 #REGhl=#R$A8FD.
  $E9BE,$03 Call #R$A592.
@ $E9C1 label=WantAnotherGameInput_Loop
  $E9C1,$03 Call #R$A53E.
N $E9C4 The player is done with the game, so reset back to BASIC.
  $E9C4,$05 #HTML(Reset back to BASIC if the keypress is "<code>#CHR$4E</code>".)
N $E9C9 The player wants another go...
  $E9C9,$05 #HTML(Jump to #R$A531 if the keypress is "<code>#CHR$59</code>".)
N $E9CE Just loop round for any other input.
  $E9CE,$02 Jump to #R$E9C1.

c $E9D0
  $E9D0,$03 Call #R$A592.
  $E9D3,$02 Restore #REGhl and #REGhl from the stack.
  $E9D5,$03 Jump to #R$E9B2.

c $E9D8 Fatal Events: Drowning
@ $E9D8 label=Event_Drowning
N $E9D8 Make the "drowning" inactive.
  $E9D8,$05 Reset bit 0 of *#R$A77E which relates to the player drowning.
  $E9DD,$06 Return if *#R$A7C3 is not equal to #N$0D.
N $E9E3 Print "#STR$CD5F,$08($b==$FF)".
  $E9E3,$03 #REGhl=#R$CD5F.
  $E9E6,$03 Jump to #R$E9D0.

c $E9E9 Fatal Events: Fomorian Tribe
@ $E9E9 label=Event_FomorianTribe
N $E9E9 Make the "Fomorian tribe" inactive.
  $E9E9,$05 Reset bit 1 of *#R$A77E.
  $E9EE,$05 Call #R$AE6B with item #N$0F: #ITEM$0F.
  $E9F3,$01 Return if #ITEM$0F is not currently in the room.
N $E9F4 Print "#STR$CD9A,$08($b==$FF)".
  $E9F4,$03 #REGhl=#R$CD9A.
  $E9F7,$03 Jump to #R$E9D0.

c $E9FA
N $E9FA Print "#STR$C97C,$08($b==$FF)".
  $E9FA,$03 #REGhl=#R$C97C.
  $E9FD,$03 Call #R$A592.
  $EA00,$02 #REGa=#N$00.
  $EA02,$03 Call #R$AEF0.
  $EA05,$02 #REGa=#N$01.
  $EA07,$03 Call #R$AEF0.
  $EA0A,$01 Return.

c $EA0B Fatal Events: Roman
@ $EA0B label=Event_Roman
  $EA0B,$05 Call #R$AEE0 with #ITEM$03.
  $EA10,$05 Call #R$AEE7 with #ITEM$02.
N $EA15 Print "#STR$C9AF,$08($b==$FF)".
  $EA15,$03 #REGhl=#R$C9AF.
  $EA18,$03 Call #R$A592.
  $EA1B,$02 #REGb=#N$14.
  $EA1D,$05 Call #R$AED1 with item #N$22: #ITEM$22.
  $EA22,$03 Jump to #R$EA2D if #REGa is equal to #REGa.
N $EA25 Print "#STR$CA1A,$08($b==$FF)".
  $EA25,$03 #REGhl=#R$CA1A.
  $EA28,$03 Call #R$B081.
  $EA2B,$02 #REGb=#N$0A.
  $EA2D,$04 Call #R$B08A using the maximum value held in #REGb.
  $EA31,$02 Jump to #R$EA38 if the random number was zero.
N $EA33 Print "#STR$C9E1,$08($b==$FF)".
  $EA33,$03 #REGhl=#R$C9E1.
  $EA36,$02 Jump to #R$EA40.
  $EA38,$01 Restore #REGhl from the stack.
N $EA39 Bad luck!
  $EA39,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
N $EA3D Print "#STR$CA46,$08($b==$FF)".
  $EA3D,$03 #REGhl=#R$CA46.
  $EA40,$03 Call #R$B081.
  $EA43,$01 Return.

c $EA44 Fatal Events: Fomorian
@ $EA44 label=Event_Fomorian
N $EA44 Print "#STR$CA79,$08($b==$FF)".
  $EA44,$03 #REGhl=#R$CA79.
  $EA47,$03 Call #R$A592.
  $EA4A,$05 Call #R$B08A using #N$14 as a maximum value.
N $EA4F Print "#STR$CA94,$08($b==$FF)".
  $EA4F,$03 #REGhl=#R$CA94.
  $EA52,$02 Jump to #R$EA5C if the generated number was non-zero.
  $EA54,$01 Discard the return address on the stack.
N $EA55 Bad luck!
  $EA55,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
N $EA59 Print "#STR$CA46,$08($b==$FF)".
  $EA59,$03 #REGhl=#R$CA46.
@ $EA5C label=Fomorian_Return
  $EA5C,$03 Call #R$B081.
  $EA5F,$01 Return.

c $EA60 Fatal Events: Boar
@ $EA60 label=Event_Boar
N $EA60 Print "#STR$CACD,$08($b==$FF)".
  $EA60,$03 #REGhl=#R$CACD.
  $EA63,$03 Call #R$A592.
  $EA66,$05 Call #R$AEE0 with item #N$06: #ITEM$06.
  $EA6B,$01 Return.

c $EA6C Fatal Events:
@ $EA6C label=Event_
  $EA6C,$02 #REGa=#N$07.
  $EA6E,$03 Call #R$AEF0.
  $EA71,$01 Return.

c $EA72 Fatal Events: Furtive Figure
@ $EA72 label=Event_FurtiveFigure
N $EA72 Print "#STR$CB19,$08($b==$FF)".
  $EA72,$03 #REGhl=#R$CB19.
  $EA75,$03 Call #R$A592.
N $EA78 Print "#STR$CB45,$08($b==$FF)".
  $EA78,$03 #REGhl=#R$CB45.
  $EA7B,$03 Call #R$B081.
  $EA7E,$05 Call #R$AEE0 with item #N$08: #ITEM$08.
  $EA83,$01 Return.

c $EA84 Fatal Events: Rats
@ $EA84 label=Event_Rats
N $EA84 Print "#STR$CB73,$08($b==$FF)".
  $EA84,$03 #REGhl=#R$CB73.
  $EA87,$03 Call #R$A592.
  $EA8A,$05 Call #R$AEE0 with item #N$09: #ITEM$09.
  $EA8F,$01 Return.

c $EA90 Fatal Events: Woman
@ $EA90 label=Event_Woman
N $EA90 Print "#STR$CB9C,$08($b==$FF)".
  $EA90,$03 #REGhl=#R$CB9C.
  $EA93,$03 Call #R$A592.
  $EA96,$05 Call #R$AEE0 with item #N$2D: #ITEM$2D.
  $EA9B,$01 Return.

c $EA9C Fatal Events: Woman Guides Through Swamp - North
@ $EA9C label=Event_WomanGuidesThroughSwamp_North
N $EA9C Print "#STR$CBCC,$08($b==$FF)".
  $EA9C,$03 #REGhl=#R$CBCC.
  $EA9F,$03 Call #R$A592.
  $EAA2,$05 Call #R$AEE0 with item #N$3E: #ITEM$3E.
  $EAA7,$05 Call #R$AEF0 with item #N$3F: #ITEM$3F.
  $EAAC,$02 #REGb=#N$3D.
  $EAAE,$02 #REGc=#N$2C.
  $EAB0,$03 Call #R$AF08.
  $EAB3,$01 Return.

c $EAB4 Fatal Events: Woman Guides Through Swamp - East
@ $EAB4 label=Event_WomanGuidesThroughSwamp_East
N $EAB4 Print "#STR$CC26,$08($b==$FF)".
  $EAB4,$03 #REGhl=#R$CC26.
  $EAB7,$03 Call #R$A592.
  $EABA,$05 Call #R$AEE0 with item #N$3F: #ITEM$3F.
  $EABF,$05 Call #R$AEF0 with item #N$40: #ITEM$40.
  $EAC4,$02 #REGb=#N$3D.
  $EAC6,$02 #REGc=#N$2D.
  $EAC8,$03 Call #R$AF08.
  $EACB,$01 Return.

c $EACC Fatal Events: Woman Guides Through Swamp - South
@ $EACC label=Event_WomanGuidesThroughSwamp_South
N $EACC Print "#STR$CC3C,$08($b==$FF)".
  $EACC,$03 #REGhl=#R$CC3C.
  $EACF,$03 Call #R$A592.
  $EAD2,$05 Call #R$AEE0 with item #N$40: #ITEM$40.
  $EAD7,$05 Call #R$AEF0 with item #N$41: #ITEM$41.
  $EADC,$02 #REGb=#N$3D.
  $EADE,$02 #REGc=#N$25.
  $EAE0,$03 Call #R$AF08.
  $EAE3,$01 Return.

c $EAE4 Fatal Events: Woman Guides Through Swamp - East #2
@ $EAE4 label=Event_WomanGuidesThroughSwamp_East_2
N $EAE4 Print "#STR$CC26,$08($b==$FF)".
  $EAE4,$03 #REGhl=#R$CC26.
  $EAE7,$03 Call #R$A592.
  $EAEA,$05 Call #R$AEE0 with item #N$41: #ITEM$41.
  $EAEF,$02 #REGb=#N$3D.
  $EAF1,$02 #REGc=#N$27.
  $EAF3,$03 Call #R$AF08.
  $EAF6,$01 Return.

c $EAF7 Fatal Events: Druid
@ $EAF7 label=Event_Druid
N $EAF7 Print "#STR$CC53,$08($b==$FF)".
  $EAF7,$03 #REGhl=#R$CC53.
  $EAFA,$03 Call #R$A592.
N $EAFD Print "#STR$CCCA,$08($b==$FF)".
  $EAFD,$03 #REGhl=#R$CCCA.
  $EB00,$03 Call #R$B081.
  $EB03,$05 Call #R$AEE0 with item #N$4A: #ITEM$4A.
  $EB08,$01 Return.

c $EB09 Fatal Events: Feeling Immense Fatigue
@ $EB09 label=Event_FeelingImmenseFatigue
N $EB09 Print "#STR$CD00,$08($b==$FF)".
  $EB09,$03 #REGhl=#R$CD00.
  $EB0C,$03 Call #R$A592.
  $EB0F,$01 Return.

c $EB10
  $EB10,$03 Write #REGa to *#R$A773.
  $EB13,$03 #REGhl=#R$EB3A.
  $EB16,$03 #REGde=#R$EB45.
  $EB19,$03 #REGbc=#N($000B,$04,$04).
  $EB1C,$03 Call #R$E98E.
  $EB1F,$03 #REGa=*#R$A773.
  $EB22,$03 Call #R$B01F.
  $EB25,$02 #REGe=#N$00.
  $EB27,$03 Call #R$ABB6.
  $EB2A,$03 #REGa=*#R$A7C3.
  $EB2D,$03 #REGhl=#R$EB5B.
  $EB30,$03 #REGde=#R$EB71.
  $EB33,$03 #REGbc=#N$0016.
  $EB36,$03 Call #R$E98E.
  $EB39,$01 Return.
B $EB3A,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $EB3A,$01,$0B
W $EB45,$02
L $EB45,$02,$0B
B $EB5B,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $EB5B,$01,$16
W $EB71,$02
L $EB71,$02,$16

c $EB9D
  $EB9D,$03 Call #R$A592.
  $EBA0,$02 Restore #REGhl and #REGhl from the stack.
N $EBA2 Bad luck!
  $EBA2,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $EBA6,$01 Return.

c $EBA7
  $EBA7,$06 Return if *#R$A7C3 is not room #N$42: #ROOM$42.
  $EBAD,$05 Call #R$AEDA with #ITEM$6D.
  $EBB2,$01 Return if the player has #ITEM$6D in their inventory.
N $EBB3 Print "#STR$DF48,$08($b==$FF)".
  $EBB3,$03 #REGhl=#R$DF48.
  $EBB6,$03 Jump to #R$EB9D.

c $EBB9
  $EBB9,$06 Call #R$AEF7 with #R$E348.
  $EBBF,$01 Return if not zero?
  $EBC0,$03 Call #R$AEF0.
  $EBC3,$02 Jump to #R$EBB9.

c $EBC5
  $EBC5,$06 Call #R$AEF7 with #R$E341.
  $EBCB,$01 Return if not zero?
  $EBCC,$03 Return if #REGa is greater than #N$04.
  $EBCF,$05 Call #R$AEF0 with #N$02.
  $EBD4,$05 Call #R$AEF0 with #N$03.
  $EBD9,$01 Return.

c $EBDA
  $EBDA,$06 Return if bit 1 of *#R$A76C is set.
  $EBE0,$02 Set bit 1 of *#R$A76C.
  $EBE2,$05 Call #R$AEE0 with item #N$00: #ITEM$00.
  $EBE7,$05 Call #R$AEE0 with item #N$01: #ITEM$01.
  $EBEC,$05 Call #R$AEF0 with event #N$02: #ITEM$02.
  $EBF1,$05 Call #R$AEF0 with event #N$03: #ITEM$03.
  $EBF6,$05 Call #R$B09A to add #N$04 points to the score.
  $EBFB,$01 Return.

c $EBFC
  $EBFC,$05 Write #N$05 to *#R$A77F.
  $EC01,$05 Set bit 0 of *#R$A77E.
  $EC06,$01 Return.

c $EC07
  $EC07,$05 Call #R$B09A to add #N$04 points to the score.
  $EC0C,$02 Restore #REGhl and #REGhl from the stack.
  $EC0E,$04 Switch #R$E9B8 onto the stack so the next return actions printing
. the score and asking if you want another game?
  $EC12,$01 Return.

c $EC13
  $EC13,$05 Call #R$AE6B with item #N$3D: #ITEM$3D.
  $EC18,$03 Jump to #R$EBA0 if #ITEM$3D is not currently in the room.
N $EC1B Print "#STR$DF82,$08($b==$FF)".
  $EC1B,$03 #REGhl=#R$DF82.
  $EC1E,$03 Jump to #R$EB9D.

c $EC21
  $EC21,$05 Call #R$AE6B with item #N$0F: #ITEM$0F.
  $EC26,$01 Return if #ITEM$0F is not currently in the room.
  $EC27,$05 Write #N$05 to *#R$A780.
  $EC2C,$05 Set bit 1 of *#R$A77E.
  $EC31,$01 Return.

c $EC32
  $EC32,$06 Return if bit 0 of *#R$A76C is set.
  $EC38,$02 Set bit 0 of *#REGhl.
  $EC3A,$05 Call #R$B09A to add #N$04 points to the score.
  $EC3F,$01 Return.

c $EC40
  $EC40,$06 Return if bit 3 of *#R$A76C is set.
  $EC46,$02 Set bit 3 of *#REGhl.
  $EC48,$05 Call #R$B09A to add #N$04 points to the score.
  $EC4D,$01 Return.

c $EC4E
  $EC4E,$06 Return if bit 5 of *#R$A76C is set.
  $EC54,$02 Set bit 5 of *#REGhl.
  $EC56,$05 Call #R$B09A to add #N$04 points to the score.
  $EC5B,$01 Return.

c $EC5C
  $EC5C,$06 Return if bit 7 of *#R$A76C is set.
  $EC62,$02 Set bit 7 of *#REGhl.
  $EC64,$05 Call #R$B09A to add #N$04 points to the score.
  $EC69,$01 Return.

c $EC6A
  $EC6A,$06 Return if bit 0 of *#R$A76D is set.
  $EC70,$02 Set bit 0 of *#REGhl.
  $EC72,$05 Call #R$B09A to add #N$04 points to the score.
  $EC77,$01 Return.

c $EC78
  $EC78,$06 Return if bit 1 of *#R$A76D is set.
  $EC7E,$02 Set bit 1 of *#REGhl.
  $EC80,$05 Call #R$B09A to add #N$04 points to the score.
  $EC85,$01 Return.

c $EC86
  $EC86,$06 Return if bit 2 of *#R$A76D is set.
  $EC8C,$02 Set bit 2 of *#REGhl.
  $EC8E,$05 Call #R$B09A to add #N$04 points to the score.
  $EC93,$01 Return.

c $EC94
  $EC94,$06 Return if bit 6 of *#R$A76D is set.
  $EC9A,$02 Set bit 6 of *#REGhl.
  $EC9C,$05 Call #R$B09A to add #N$04 points to the score.
  $ECA1,$01 Return.

c $ECA2
  $ECA2,$05 Call #R$AED1 with item #N$27: #ITEM$27.
  $ECA7,$03 Return if the armed warrior is not in room #N$1B: #ROOM$1B.
N $ECAA To pass the armed warrior the player needs #ITEM$1F in their inventory.
  $ECAA,$05 Call #R$AEDA with item #N$1F: #ITEM$1F.
  $ECAF,$02 Jump to #R$ECB7 if the player has #ITEM$1F in their inventory.
N $ECB1 The player doesn't have #ITEM$1F in their inventory, but do they have
. #ITEM$20 instead?
  $ECB1,$05 Call #R$AEDA with item #N$20: #ITEM$20.
  $ECB6,$01 Return if the player doesn't have #ITEM$20 in their inventory.
N $ECB7 Change the warrior state!
  $ECB7,$06 Call #R$AF1E to transform item #N$27 (#ITEM$27) into item #N$28
. (#ITEM$28).
  $ECBD,$01 Return.

c $ECBE
  $ECBE,$05 Call #R$AE6B with item #N$28: #ITEM$28.
  $ECC3,$01 Return if item #N$28: #ITEM$28 is not in the current room or the
. players inventory.
  $ECC4,$05 Call #R$AEF0 with event #N$00: #ITEM$00.
  $ECC9,$05 Call #R$AEF0 with event #N$01: #ITEM$01.
  $ECCE,$05 Call #R$AEF0 with event #N$08: #ITEM$08.
  $ECD3,$05 Call #R$AEF0 with event #N$07: #ITEM$07.
  $ECD8,$05 Call #R$AEE0 with item #N$28: #ITEM$28.
  $ECDD,$05 Call #R$B09A to add #N$04 points to the score.
  $ECE2,$05 Write #N$1A to *#R$E7B9 to open up westbound access to #ROOM$1A
. from #ROOM$1B.
  $ECE7,$01 Return.

c $ECE8 Response: "The Torc Warms Up As You Look"
@ $ECE8 label=Response_TorcWarmsUpAsYouLook
N $ECE8 Print "#STR$DFF1,$08($b==$FF)".
  $ECE8,$03 #REGhl=#R$DFF1.
  $ECEB,$03 Call #R$A592.
  $ECEE,$01 Return.

c $ECEF
  $ECEF,$05 Call #R$AEDA with item #N$6A: #ITEM$6A.
  $ECF4,$01 Return if #ITEM$6A is not in the players inventory.
  $ECF5,$05 Call #R$AED1 with item #N$3D: #ITEM$3D.
  $ECFA,$03 Return if #ITEM$3D is not in room #N$24: #ROOM$24.
  $ECFD,$03 Call #R$ECE8.
N $ED00 Print "#STR$E00F,$08($b==$FF)".
  $ED00,$03 #REGhl=#R$E00F.
  $ED03,$03 Call #R$A592.
  $ED06,$01 Return.

c $ED07
  $ED07,$05 Call #R$AEDA with item #N$6A: #ITEM$6A.
  $ED0C,$01 Return if #ITEM$6A is not in the players inventory.
  $ED0D,$03 Call #R$ECE8.
N $ED10 Print "#STR$E01F,$08($b==$FF)".
  $ED10,$03 #REGhl=#R$E01F.
  $ED13,$03 Call #R$A592.
  $ED16,$01 Return.

c $ED17
  $ED17,$05 Call #R$AEDA with item #N$6A: #ITEM$6A.
  $ED1C,$01 Return if #ITEM$6A is not in the players inventory.
  $ED1D,$03 Call #R$ECE8.
N $ED20 Print "#STR$E04D,$08($b==$FF)".
  $ED20,$03 #REGhl=#R$E04D.
  $ED23,$03 Call #R$A592.
  $ED26,$01 Return.

c $ED27
  $ED27,$05 Call #R$AEDA with item #N$6A: #ITEM$6A.
  $ED2C,$01 Return if #ITEM$6A is not in the players inventory.
  $ED2D,$03 Call #R$ECE8.
N $ED30 Print "#STR$E039,$08($b==$FF)".
  $ED30,$03 #REGhl=#R$E039.
  $ED33,$03 Call #R$A592.
  $ED36,$01 Return.

c $ED37
  $ED37,$05 Call #R$AEDA with item #N$6A: #ITEM$6A.
  $ED3C,$01 Return if #ITEM$6A is not in the players inventory.
  $ED3D,$03 Call #R$ECE8.
N $ED40 Print "#STR$E047,$08($b==$FF)".
  $ED40,$03 #REGhl=#R$E047.
  $ED43,$03 Call #R$A592.
  $ED46,$01 Return.

c $ED47
  $ED47,$05 Call #R$AEDA with item #N$6A: #ITEM$6A.
  $ED4C,$01 Return if #ITEM$6A is not in the players inventory.
  $ED4D,$03 Call #R$ECE8.
N $ED50 Print "#STR$E026,$08($b==$FF)".
  $ED50,$03 #REGhl=#R$E026.
  $ED53,$03 Call #R$A592.
  $ED56,$01 Return.

c $ED57
  $ED57,$06 Return if *#R$A7C3 is not equal to room #N$43: #ROOM$43.
  $ED5D,$03 Jump to #R$EBAD.

c $ED60
  $ED60,$05 Call #R$AE6B with item #N$37: #ITEM$37.
  $ED65,$01 Return if ?? is not equal to #N$37.
  $ED66,$05 Call #R$AEF0 with item #N$37: #ITEM$37.
  $ED6B,$01 Return.

B $ED6C,$01

c $ED6D
  $ED6D,$03 Call #R$A592.
  $ED70,$01 Return.


c $ED71
  $ED71,$03 Call #R$B081.
  $ED74,$01 Return.

c $ED75
  $ED75,$03 Call #R$AEDA.
  $ED78,$02 Jump to #R$ED98 if the item isn't already in the players inventory.
  $ED7A,$01 Restore #REGhl from the stack.
N $ED7B Print "#STR$A9FC,$08($b==$FF)".
  $ED7B,$03 #REGhl=#R$A9FC.
  $ED7E,$03 Call #R$A585.
  $ED81,$03 #REGhl=#R$ED6C.
  $ED84,$01 #REGa=#REGe.
  $ED85,$03 #REGbc=#N($0001,$04,$04).
  $ED88,$02 CPIR.
  $ED8A,$02 Jump to #R$ED92 if #REGde is equal to #N$37.
N $ED8C Print "#STR$AA17,$08($b==$FF)".
  $ED8C,$03 #REGhl=#R$AA17.
  $ED8F,$03 Jump to #R$ED6D.

N $ED92 Print "#STR$AA1B,$08($b==$FF)".
  $ED92,$03 #REGhl=#R$AA1B.
  $ED95,$03 Jump to #R$ED6D.

  $ED98,$05 Compare *#R$A790 with #N$05.
  $ED9D,$01 #REGb=#REGe.
  $ED9E,$01 Return if *#R$A790 was not equal to #N$05.
  $ED9F,$01 Restore #REGhl from the stack.
N $EDA0 Print "#STR$AA21,$08($b==$FF)".
  $EDA0,$03 #REGhl=#R$AA21.
  $EDA3,$03 Jump to #R$ED6D.

c $EDA6
  $EDA6,$02 #REGc=#N$01.
  $EDA8,$03 Call #R$AF08.

  $EDAB,$04 Increment *#R$A790 by one.
N $EDAF Print "#STR$A9F7,$08($b==$FF)".
  $EDAF,$03 Jump to #R$EDF3.

c $EDB2
  $EDB2,$03 Call #R$ED75.
  $EDB5,$03 Jump to #R$EDA6.

c $EDB8 Handler: Drop Item
@ $EDB8 label=Handler_DropItem
R $EDB8 A Item ID
  $EDB8,$03 Call #R$AEDA.
N $EDBB Print "#STR$AA9B,$08($b==$FF)".
  $EDBB,$03 #REGhl=#R$AA9B.
  $EDBE,$03 Jump to #R$ED7E if the player is not carrying the item in their
. inventory.
N $EDC1 The item is in the players inventory, so move its location to the
. current room.
@ $EDC1 label=DropItem
  $EDC1,$01 Copy the item ID into #REGb.
  $EDC2,$04 #REGc=*#R$A7C3.
  $EDC6,$03 Call #R$AF08.
  $EDC9,$04 Decrease *#R$A790 by one.
N $EDCD Print "#STR$A9F7,$08($b==$FF)".
  $EDCD,$03 Jump to #R$EDF3.

c $EDD0 Is Player Carrying Item?
@ $EDD0 label=IsPlayerCarryingItem
R $EDD0 A Item ID
R $EDD0 O:F Z flag set if the item is in the players inventory
  $EDD0,$03 Call #R$AEDA.
  $EDD3,$01 Return if the item is in the players inventory.
  $EDD4,$01 Restore #REGhl from the stack.
N $EDD5 Print "#STR$AA9B,$08($b==$FF)".
  $EDD5,$03 #REGhl=#R$AA9B.
  $EDD8,$03 Jump to #R$ED7E.

c $EDDB Response: "You've Nothing To Tie Him With"
@ $EDDB label=Response_YouveNothingToTieHimWith
N $EDDB Print "#STR$E091,$08($b==$FF)".
  $EDDB,$03 #REGhl=#R$E091.
  $EDDE,$03 Jump to #R$ED6D.

c $EDE1 Response: "Please Be More Specific"
@ $EDE1 label=Response_PleaseBeMoreSpecific_Duplicate
N $EDE1 Print "#STR$A9BD,$08($b==$FF)".
  $EDE1,$03 #REGhl=#R$A9BD.
  $EDE4,$03 Jump to #R$ED6D.

c $EDE7 Response: "Please Rephrase That"
@ $EDE7 label=Response_PleaseRephraseThat_Duplicate
N $EDE7 Print "#STR$A9D6,$08($b==$FF)".
  $EDE7,$03 #REGhl=#R$A9D6.
  $EDEA,$03 Jump to #R$ED6D.

c $EDED Response: "You Can't"
@ $EDED label=Response_YouCant_Duplicate
N $EDED Print "#STR$A9EC,$08($b==$FF)".
  $EDED,$03 #REGhl=#R$A9EC.
  $EDF0,$03 Jump to #R$ED6D.

c $EDF3 Response: "O.K."
@ $EDF3 label=Response_OK_Duplicate
N $EDF3 Print "#STR$A9F7,$08($b==$FF)".
  $EDF3,$03 #REGhl=#R$A9F7.
  $EDF6,$03 Jump to #R$ED6D.

c $EDF9 Response: "I Don't See The Point"
@ $EDF9 label=Response_IDontSeeThePoint
N $EDF9 Print "#STR$AA84,$08($b==$FF)".
  $EDF9,$03 #REGhl=#R$AA84.
  $EDFC,$03 Jump to #R$ED6D.

c $EDFF Response: "You Can't Carry Any More"
@ $EDFF label=Response_YouCantCarryAnyMore
N $EDFF Print "#STR$AA21,$08($b==$FF)".
  $EDFF,$03 #REGhl=#R$AA21.
  $EE02,$03 Jump to #R$ED6D.

c $EE05 Response: "Don't Be Ridiculous"
@ $EE05 label=Response_DontBeRidiculous
N $EE05 Print "#STR$CDD3,$08($b==$FF)".
  $EE05,$03 #REGhl=#R$CDD3.
  $EE08,$03 Jump to #R$ED6D.

c $EE0B Response: "You've Done That Already"
@ $EE0B label=Response_YouveDoneThatAlready
N $EE0B Print "#STR$CDE8,$08($b==$FF)".
  $EE0B,$03 #REGhl=#R$CDE8.
  $EE0E,$03 Jump to #R$ED6D.

c $EE11 Response: "You're Not Tired"
@ $EE11 label=Response_YoureNotTired
N $EE11 Print "#STR$CE3E,$08($b==$FF)".
  $EE11,$03 #REGhl=#R$CE3E.
  $EE14,$03 Jump to #R$ED6D.

c $EE17 Response: "You're Not Carrying Anything"
@ $EE17 label=Response_YoureNotCarryingAnything
N $EE17 Print "#STR$CF22,$08($b==$FF)".
  $EE17,$03 #REGhl=#R$CF22.
  $EE1A,$03 Jump to #R$ED6D.

c $EE1D Response: "You Can't Go In That Direction"
@ $EE1D label=Response_YouCantGoInThatDirection
N $EE1D Print "#STR$AA4E,$08($b==$FF)".
  $EE1D,$03 #REGhl=#R$AA4E.
  $EE20,$03 Jump to #R$ED6D.

c $EE23 Response: "You Cannot Move It"
@ $EE23 label=Response_YouCannotMoveIt
N $EE23 Print "#STR$D231,$08($b==$FF)".
  $EE23,$03 #REGhl=#R$D231.
  $EE26,$03 Jump to #R$ED6D.

c $EE29 Process: Examine Monolith
@ $EE29 label=Process_ExamineMonolith
N $EE29 Print "#STR$D05D,$08($b==$FF)".
  $EE29,$03 #REGhl=#R$D05D.
  $EE2C,$03 Jump to #R$ED6D.

c $EE2F Response: "You're Not In It"
@ $EE2F label=Response_YoureNotInIt
N $EE2F Print "#STR$D748,$08($b==$FF)".
  $EE2F,$03 #REGhl=#R$D748.
  $EE32,$03 Jump to #R$ED6D.

c $EE35 Response: "It Isn't Tied"
@ $EE35 label=Response_ItIsntTied
  $EE35,$03 #REGhl=#R$D75A.
  $EE38,$03 Jump to #R$ED6D.

c $EE3B Response: "He Isn't Tied"
@ $EE3B label=Response_HeIsntTied
  $EE3B,$03 #REGhl=#R$D769.
  $EE3E,$03 Jump to #R$ED6D.

c $EE41 Response: "You Are Already Wearing It"
@ $EE41 label=Response_YouAreAlreadyWearingIt
  $EE41,$03 #REGhl=#R$DA82.
  $EE44,$03 Jump to #R$ED6D.

c $EE47 Response: "You Must Be Joking"
@ $EE47 label=Response_YouMustBeJoking
  $EE47,$03 #REGhl=#R$DC09.
  $EE4A,$03 Jump to #R$ED6D.

c $EE4D Response: "You're Not In Water"
@ $EE4D label=Response_YoureNotInWater
  $EE4D,$03 #REGhl=#R$DF33.
  $EE50,$03 Jump to #R$ED6D.

c $EE53 Response: "You See Nothing Special"
@ $EE53 label=Response_YouSeeNothingSpecial
  $EE53,$03 #REGhl=#R$CF40.
  $EE56,$03 Jump to #R$ED6D.

c $EE59 Process: Examine Urn
@ $EE59 label=Process_ExamineUrn
N $EE59 The player wants to examine the urn but is it in their inventory?
  $EE59,$05 Call #R$EDD0 with item #N$1C: #ITEM$1C.
N $EE5E Print "#STR$CF79,$08($b==$FF)".
  $EE5E,$03 #REGhl=#R$CF79.
  $EE61,$03 Jump to #R$ED6D.

c $EE64 Process: Examine Helmet
@ $EE64 label=Process_ExamineHelmet
N $EE64 Are any of the variations of the helmet in the current room/ players
. inventory?
  $EE64,$06 Call #R$AEF7 with #R$E36B.
N $EE6A The player wants to examine the helmet but is it in their inventory?
  $EE6A,$03 Call #R$EDD0.
N $EE6D Print "#STR$D03C,$08($b==$FF)".
  $EE6D,$03 #REGhl=#R$D03C.
  $EE70,$03 Jump to #R$ED6D.

c $EE73 Process: Examine Sword
@ $EE73 label=Process_ExamineSword
N $EE73 Are any of the variations of the sword in the current room/ players
. inventory?
  $EE73,$06 Call #R$AEF7 with #R$E392.
N $EE79 The player wants to examine the sword but is it in their inventory?
  $EE79,$03 Call #R$EDD0.
N $EE7C Restore the original item ID to check which item was found in the item
. group.
  $EE7C,$05 Jump to #R$EE87 if the original requested item ID is not equal to
. item #N$38: #ITEM$38.
N $EE81 Print "#STR$D07D,$08($b==$FF)".
  $EE81,$03 #REGhl=#R$D07D.
  $EE84,$03 Jump to #R$ED6D.
@ $EE87 label=ExamineSword_NotHeld
N $EE87 Print "#STR$D0F8,$08($b==$FF)"
  $EE87,$03 #REGhl=#R$D0F8.
  $EE8A,$03 Jump to #R$ED6D.

c $EE8D Process: Examine Amulet
@ $EE8D label=Process_ExamineAmulet
N $EE8D Are any of the variations of the amulet in the current room/ players
. inventory?
  $EE8D,$06 Call #R$AEF7 with #R$E3A6.
N $EE93 The player wants to examine the amulet but is it in their inventory?
  $EE93,$03 Call #R$EDD0.
N $EE96 Print "#STR$D114,$08($b==$FF)"
  $EE96,$03 #REGhl=#R$D114.
  $EE99,$03 Jump to #R$ED6D.

c $EE9C Process: Examine Staff
@ $EE9C label=Process_ExamineStaff
  $EE9C,$05 Call #R$EDD0 with item #N$61: #ITEM$61.
N $EEA1 Print "#STR$D188,$08($b==$FF)"
  $EEA1,$03 #REGhl=#R$D188.
  $EEA4,$03 Jump to #R$ED6D.

c $EEA7 Process: Examine Body
@ $EEA7 label=Process_ExamineBody
N $EEA7 Are any of the variations of the body in the current room/ players
. inventory?
  $EEA7,$06 Call #R$AEF7 with #R$F88F.

N $EEAD Print "#STR$CF40,$08($b==$FF)" if the body is not present in the
. current room.
  $EEAD,$03 Jump to #R$EE53 if the body is not present in the current room.
N $EEB0 Print "#STR$D1B3,$08($b==$FF)"
  $EEB0,$03 #REGhl=#R$D1B3.
  $EEB3,$03 Jump to #R$ED6D.

c $EEB6 Process: Examine Torc
@ $EEB6 label=Process_ExamineTorc
N $EEB6 Are any of the variations of the torc in the current room/ players
. inventory?
  $EEB6,$06 Call #R$AEF7 with #R$E366.
N $EEBC The player wants to examine the torc but is it in their inventory?
  $EEBC,$03 Call #R$EDD0.
N $EEBF Print "#STR$D1FF,$08($b==$FF)"
  $EEBF,$03 #REGhl=#R$D1FF.
  $EEC2,$03 Jump to #R$ED6D.

c $EEC5 Process: Get Salt
@ $EEC5 label=Process_GetSalt
  $EEC5,$05 Jump to #R$EDB2 with item #N$19: #ITEM$19.

c $EECA Process: Get Pot
@ $EECA label=Process_GetPot
  $EECA,$05 Jump to #R$EDB2 with item #N$1A: #ITEM$1A.

c $EECF Process: Get Acorns
@ $EECF label=Process_GetAcorns
  $EECF,$02 #REGa=item #N$1B: #ITEM$1B.
  $EED1,$03 Call #R$ED75.
  $EED4,$07 Jump to #R$EEE4 if bit 3 of *#R$A76D is set.
  $EEDB,$02 Set bit 3 of *#R$A76D.
  $EEDD,$02 #REGb=item #N$1D: #ITEM$1D.
  $EEDF,$02 #REGc=item #N$13: #ITEM$13.
  $EEE1,$03 Call #R$AF08.
  $EEE4,$02 #REGb=item #N$1B: #ITEM$1B.
  $EEE6,$03 Jump to #R$EDA6.

c $EEE9 Process: Get Urn
@ $EEE9 label=Process_GetUrn
  $EEE9,$05 Call #R$ED75 with item #N$1C: #ITEM$1C.
  $EEEE,$05 Call #R$AE6B with item #N$20: #ITEM$20.
  $EEF3,$03 Jump to #R$EE23 if #REGa is not equal to #N$20.
  $EEF6,$07 Jump to #R$EF04 if bit 4 of *#R$A76C is set.
  $EEFD,$02 Set bit 4 of *#REGhl.
  $EEFF,$05 Call #R$B09A to add #N$04 points to the score.
  $EF04,$02 #REGb=item #N$1C: #ITEM$1C.
  $EF06,$03 Jump to #R$EDA6.

c $EF09 Process: Get Torc
@ $EF09 label=Process_GetTorc
  $EF09,$06 Call #R$AEF7 with #R$E366.
  $EF0F,$03 Jump to #R$EDB2.

c $EF12 Process: Get Helmet
@ $EF12 label=Process_GetHelmet
  $EF12,$06 Call #R$AEF7 with #R$E36B.
  $EF18,$03 Jump to #R$EDB2.

c $EF1B Process: Get Food
@ $EF1B label=Process_GetFood
  $EF1B,$05 Jump to #R$EDB2 with item #N$22: #ITEM$22.

c $EF20 Process: Get Iron
@ $EF20 label=Process_GetIron
  $EF20,$05 Jump to #R$EDB2 with item #N$23: #ITEM$23.

c $EF25 Process: Get Vase
@ $EF25 label=Process_GetVase
  $EF25,$05 Jump to #R$EDB2 with item #N$2E: #ITEM$2E.

c $EF2A Process: Get Sword
@ $EF2A label=Process_GetSword
  $EF2A,$06 Call #R$AEF7 with #R$E392.
  $EF30,$05 Jump to #R$F1E5 if #REGa is equal to #N$59.
  $EF35,$03 Jump to #R$EDB2.

c $EF38 Process: Get Meat
@ $EF38 label=Process_GetMeat
  $EF38,$06 Call #R$AEF7 with #R$E396.
  $EF3E,$05 Jump to #R$EDB2 if #REGa is not equal to #N$3C.
N $EF43 Print "#STR$D245,$08($b==$FF)".
  $EF43,$03 #REGhl=#R$D245.
  $EF46,$03 Jump to #R$ED6D.

c $EF49 Process: Get Amulet
@ $EF49 label=Process_GetAmulet
  $EF49,$06 Call #R$AEF7 with #R$E3A6.
  $EF4F,$05 Jump to #R$EDB2 if #REGa is not equal to #N$49.
N $EF54 Print "#STR$D26B,$08($b==$FF)".
  $EF54,$03 #REGhl=#R$D26B.
  $EF57,$03 Jump to #R$ED6D.

c $EF5A Process: Get Rope
@ $EF5A label=Process_GetRope
  $EF5A,$06 Call #R$AEF7 with #R$E3B0.
  $EF60,$05 Jump to #R$EDED if #REGa is not equal to #N$51.
  $EF65,$03 Call #R$ED75.
  $EF68,$08 Jump to #R$EDA6 if bit 2 of *#R$A76C is set.
  $EF70,$02 Set bit 2 of *#R$A76C.
  $EF72,$05 Call #R$B09A to add #N$04 points to the score.
  $EF77,$02 #REGb=#N$51.
  $EF79,$03 Jump to #R$EDA6.

c $EF7C Process: Get Skull
@ $EF7C label=Process_GetSkull
  $EF7C,$05 Jump to #R$EDB2 with item #N$3B: #ITEM$3B.

c $EF81 Process: Get Shield
@ $EF81 label=Process_GetShield
  $EF81,$05 Jump to #R$EDB2 with item #N$56: #ITEM$56.

c $EF86 Process: Get Ladder
@ $EF86 label=Process_GetLadder
  $EF86,$06 Call #R$AEF7 with #R$E3C5.
  $EF8C,$05 Jump to #R$EDB2 if #REGa is equal to #N$5A.
  $EF91,$05 Jump to #R$EDED if #REGa is not equal to #N$5E.
  $EF96,$02 #REGa=#N$5A.
  $EF98,$03 Call #R$ED75.
  $EF9B,$02 #REGa=#N$5E.
  $EF9D,$03 Call #R$AEE0.
  $EFA0,$01 #REGa=#N$00.
  $EFA1,$03 Write #REGa to *#R$E959.
  $EFA4,$03 Write #REGa to *#R$E96A.
  $EFA7,$02 #REGb=#N$5A.
  $EFA9,$03 Jump to #R$EDA6.
  $EFAC,$01 Return.

c $EFAD Process: Get Cloak
@ $EFAD label=Process_GetCloak
  $EFAD,$06 Call #R$AEF7 with #R$E3DD.
  $EFB3,$05 Jump to #R$EDB2 if #REGa is equal to #N$64.
  $EFB8,$03 Call #R$ED75.
  $EFBB,$06 Call #R$AF1E to transform item #N$62 (#ITEM$62) into item #N$63
. (#ITEM$63).
  $EFC1,$05 Call #R$B09A to add #N$04 points to the score.
  $EFC6,$02 #REGb=#N$64.
  $EFC8,$03 Jump to #R$EDA6.

c $EFCB Process: Get Silver
@ $EFCB label=Process_GetSilver
  $EFCB,$05 Jump to #R$EDB2 with item #N$65: #ITEM$65.

c $EFD0
  $EFD0,$06 Call #R$AEF7 with #R$E3A6.
  $EFD6,$05 Jump to #R$EF54 if #REGa is equal to #N$49.
  $EFDB,$03 Call #R$ED75.
N $EFDE Print "#STR$D2F4,$08($b==$FF)".
  $EFDE,$03 #REGhl=#R$D2F4.
  $EFE1,$03 Jump to #R$ED6D.

  $EFE4,$05 Call #R$AE6B with item #N$62: #ITEM$62.
  $EFE9,$03 Jump to #R$EFAD if #REGa is equal to #N$62.
N $EFEC Print "#STR$D308,$08($b==$FF)".
  $EFEC,$03 #REGhl=#R$D308.
  $EFEF,$03 Jump to #R$ED6D.

c $EFF2 Process: Drop Salt
@ $EFF2 label=Process_DropSalt
  $EFF2,$05 Jump to #R$EDB8 with item #N$19: #ITEM$19.

c $EFF7 Process: Drop Pot
@ $EFF7 label=Process_DropPot
  $EFF7,$05 Jump to #R$EDB8 with item #N$1A: #ITEM$1A.

c $EFFC Process: Drop Acorns
@ $EFFC label=Process_DropAcorns
  $EFFC,$05 Jump to #R$EDB8 with item #N$1B: #ITEM$1B.

c $F001 Process: Drop Urn
@ $F001 label=Process_DropUrn
  $F001,$05 Jump to #R$EDB8 with item #N$1C: #ITEM$1C.

c $F006 Process: Drop Torc
@ $F006 label=Process_DropTorc
  $F006,$06 Call #R$AEF7 with #R$E366.
N $F00C The player wants to drop the torc but are they wearing it?
  $F00C,$05 Jump to #R$EDB8 if the item is not item #N$6A: #ITEM$6A.
N $F011 Else the player is wearing the torc, so "un-wear" it first before
. dropping it.
N $F011 Change the torc state!
  $F011,$06 Call #R$AF1E to transform item #N$6A (#ITEM$6A) into item #N$69
. (#ITEM$69).
  $F017,$05 Jump to #R$EDB8 with item #N$69: #ITEM$69.

c $F01C Process: Drop Helmet
@ $F01C label=Process_DropHelmet
  $F01C,$06 Call #R$AEF7 with #R$E36B.
N $F022 The player wants to drop the helmet but are they wearing it?
  $F022,$05 Jump to #R$EDB8 if the item is not item #N$20: #ITEM$20.
N $F027 Else the player is wearing the helmet, so "un-wear" it first before
. dropping it.
N $F027 Change the helmet state!
  $F027,$06 Call #R$AF1E to transform item #N$20 (#ITEM$20) into item #N$1F
. (#ITEM$1F).
  $F02D,$05 Jump to #R$EDB8 with item #N$1F: #ITEM$1F.

c $F032 Process: Drop Food
@ $F032 label=Process_DropFood
  $F032,$05 Jump to #R$EDB8 with item #N$22: #ITEM$22.

c $F037 Process: Drop Iron
@ $F037 label=Process_DropIron
  $F037,$05 Jump to #R$EDB8 with item #N$23: #ITEM$23.

c $F03C Process: Drop Vase
@ $F03C label=Process_DropVase
  $F03C,$05 Jump to #R$EDB8 with item #N$2E: #ITEM$2E.

c $F041 Process: Drop Sword
@ $F041 label=Process_DropSword
  $F041,$06 Call #R$AEF7 with #R$E392.
  $F047,$03 Jump to #R$EDB8.

c $F04A Process: Drop Meat
@ $F04A label=Process_DropMeat
  $F04A,$05 Jump to #R$EDB8 with item #N$3A: #ITEM$3A.

c $F04F Process: Buy Meat From Trader
@ $F04F label=Process_BuyMeatFromTrader
  $F04F,$05 Call #R$AE6B with item #N$3C: #ITEM$3C.
N $F054 Print "#STR$A9EC,$08($b==$FF)" if #ITEM$3C is not present in the
. current room.
  $F054,$03 Jump to #R$EDED if #ITEM$3C is not present in the current room.
N $F057 Print "#STR$DC9D,$08($b==$FF)".
  $F057,$03 #REGhl=#R$DC9D.
  $F05A,$03 Call #R$A592.
N $F05D Print "#STR$A9BD,$08($b==$FF)".
  $F05D,$03 Jump to #R$EDE1.

c $F060 Process: Drop Rope
@ $F060 label=Process_DropRope
  $F060,$06 Call #R$AEF7 with #R$E3B0.
  $F066,$03 Jump to #R$EDB8.

c $F069 Process: Drop Skull
@ $F069 label=Process_DropSkull
  $F069,$05 Jump to #R$EDB8 with item #N$3B: #ITEM$3B.

c $F06E Process: Drop Shield
@ $F06E label=Process_DropShield
  $F06E,$05 Jump to #R$EDB8 with item #N$56: #ITEM$56.

c $F073 Process: Drop Ladder
@ $F073 label=Process_DropLadder
  $F073,$06 Call #R$AEF7 with #R$E3C5.
  $F079,$03 Jump to #R$EDB8.

c $F07C Process: Drop Staff
@ $F07C label=Process_DropStaff
  $F07C,$05 Call #R$EDD0 with item #N$61: #ITEM$61.
  $F081,$02 #REGa=#N$50.
  $F083,$03 Write #REGa to *#R$E8F4.
  $F086,$03 Write #REGa to *#R$E8F6.
  $F089,$03 Write #REGa to *#R$E8F7.
  $F08C,$02 #REGa=#N$61.
  $F08E,$03 Jump to #R$EDB8.

c $F091 Process: Drop Cloak
@ $F091 label=Process_DropCloak
  $F091,$06 Call #R$AEF7 with #R$E3DD.
N $F097 The player wants to drop the cloak but are they wearing it?
  $F097,$05 Jump to #R$EDB8 if the item is not item #N$6D: #ITEM$6D.
N $F09C Else the player is wearing the cloak, so "un-wear" it first before
. dropping it.
N $F09C Change the cloak state!
  $F09C,$06 Call #R$AF1E to transform item #N$6D (#ITEM$6D) into item #N$64
. (#ITEM$64).
  $F0A2,$05 Jump to #R$EDB8 with item #N$64: #ITEM$64.

c $F0A7 Process: Drop Silver
@ $F0A7 label=Process_DropSilver
  $F0A7,$05 Jump to #R$EDB8 with item #N$65: #ITEM$65.

c $F0AC
  $F0AC,$02 #REGa=#N$61.
  $F0AE,$03 Call #R$ED75.
  $F0B1,$02 #REGa=#N$4C.
  $F0B3,$03 Write #REGa to *#R$E8F4.
  $F0B6,$01 #REGa=#N$00.
  $F0B7,$03 Write #REGa to *#R$E8F6.
  $F0BA,$03 Write #REGa to *#R$E8F7.
  $F0BD,$03 Jump to #R$EDA6.
  $F0C0,$02 #REGa=#N$45.
  $F0C2,$03 Call #R$AE6B.
  $F0C5,$03 Jump to #R$EE05 if #REGa is equal to #N$45.
  $F0C8,$02 #REGa=#N$3A.
  $F0CA,$03 Call #R$EDD0.
  $F0CD,$01 #REGa=#REGe.
  $F0CE,$03 Call #R$AEE0.
  $F0D1,$03 #REGhl=#R$A790.
  $F0D4,$01 Decrease *#REGhl by one.
  $F0D5,$03 #REGhl=#R$D328.
  $F0D8,$03 Jump to #R$ED6D.
  $F0DB,$02 #REGa=#N$3A.
  $F0DD,$03 Call #R$EDD0.
  $F0E0,$01 #REGa=#REGe.
  $F0E1,$03 Call #R$AEE0.
  $F0E4,$03 #REGhl=#R$A790.
  $F0E7,$01 Decrease *#REGhl by one.
  $F0E8,$02 #REGa=#N$30.
  $F0EA,$03 Write #REGa to *#R$E830.
  $F0ED,$02 #REGa=#N$42.
  $F0EF,$03 Call #R$AEE0.
  $F0F2,$05 Call #R$B09A to add #N$04 points to the score.
  $F0F7,$03 #REGhl=#R$D35C.
  $F0FA,$03 Jump to #R$ED6D.
  $F0FD,$02 #REGa=#N$1B.
  $F0FF,$03 Call #R$EDD0.
  $F102,$01 #REGa=#REGe.
  $F103,$03 Call #R$AEE0.
  $F106,$03 #REGhl=#R$A790.
  $F109,$01 Decrease *#REGhl by one.
  $F10A,$02 #REGa=#N$1D.
  $F10C,$03 Call #R$AEE0.
  $F10F,$02 #REGa=#N$69.
  $F111,$03 Call #R$AEE7.
  $F114,$03 #REGhl=#R$D3A7.
  $F117,$03 Call #R$A592.
  $F11A,$03 #REGhl=#R$D3E0.
  $F11D,$03 Call #R$B081.
  $F120,$03 #REGhl=#R$D4A9.
  $F123,$03 Jump to #R$ED71.
  $F126,$02 #REGa=#N$19.
  $F128,$03 Call #R$EDD0.
  $F12B,$03 Call #R$EDC1.
  $F12E,$03 #REGhl=#R$D4F5.
  $F131,$03 Jump to #R$ED6D.
  $F134,$02 #REGa=#N$19.
  $F136,$03 Call #R$EDD0.
  $F139,$01 #REGa=#REGe.
  $F13A,$03 Call #R$AEE0.
  $F13D,$03 #REGhl=#R$A790.
  $F140,$01 Decrease *#REGhl by one.
  $F141,$02 #REGa=#N$46.
  $F143,$03 Call #R$AEE0.
  $F146,$05 Call #R$B09A to add #N$04 points to the score.
  $F14B,$02 #REGa=#N$49.
  $F14D,$03 Write #REGa to *#R$E870.
  $F150,$03 #REGhl=#R$D531.
  $F153,$03 Jump to #R$ED6D.

c $F156 Process: Buy Meat From Trader With Iron
@ $F156 label=Process_BuyMeatFromTraderWithIron
  $F156,$05 Call #R$AE6B with item #N$3C: #ITEM$3C.
N $F15B If #ITEM$3C is not present in the current room then print
. "#STR$A9EC,$08($b==$FF)".
  $F15B,$03 Jump to #R$EDED if #ITEM$3C is not present in the current room.
N $F15E The trader is in the room, but is the player holding the iron?
  $F15E,$05 Call #R$EDD0 with item #N$23: #ITEM$23.
N $F163 The player is holding the iron and the trader is present.
N $F163 Change the iron/ meat state!
  $F163,$06 Call #R$AF1E to transform item #N$23 (#ITEM$23) into item #N$3A
. (#ITEM$3A).
  $F169,$05 Call #R$B09A to add #N$04 points to the score.
N $F16E The trader is no longer needed.
  $F16E,$05 Call #R$AEE0 with item #N$3C: #ITEM$3C.
N $F173 Print "#STR$D58F,$08($b==$FF)".
  $F173,$03 #REGhl=#R$D58F.
  $F176,$03 Jump to #R$ED6D.

c $F179
  $F179,$02 #REGa=#N$23.
  $F17B,$03 Call #R$EDD0.
  $F17E,$01 #REGa=#REGe.
  $F17F,$03 Call #R$AEE0.
  $F182,$02 #REGa=#N$3C.
  $F184,$03 Call #R$AEE0.
  $F187,$03 #REGhl=#R$A790.
  $F18A,$01 Decrease *#REGhl by one.
  $F18B,$03 #REGhl=#R$D5E7.
  $F18E,$03 Jump to #R$ED6D.
  $F191,$02 #REGa=#N$0B.
  $F193,$03 Call #R$AEE0.
  $F196,$05 Reset bit 0 of *#R$A787.
  $F19B,$06 Call #R$AF1E to transform item #N$49 (#ITEM$49) into item #N$4B
. (#ITEM$4B).
  $F1A1,$05 Call #R$B09A to add #N$04 points to the score.
  $F1A6,$03 #REGhl=#R$D640.
  $F1A9,$03 Jump to #R$ED6D.
  $F1AC,$02 #REGa=#N$45.
  $F1AE,$03 Call #R$AE6B.
  $F1B1,$03 Jump to #R$EE05 if *#REGhl is equal to #N$45.
  $F1B4,$03 #REGhl=#R$D695.
  $F1B7,$03 Call #R$A592.
N $F1BA Bad luck!
  $F1BA,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $F1BE,$03 #REGhl=#R$D6B0.
  $F1C1,$03 Jump to #R$ED71.

  $F1C4,$03 #REGhl=#R$D695.
  $F1C7,$03 Call #R$A592.
N $F1CA Bad luck!
  $F1CA,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $F1CE,$03 #REGhl=#R$D6E3.
  $F1D1,$03 Jump to #R$ED71.

  $F1D4,$02 #REGa=#N$19.
  $F1D6,$03 Jump to #R$F17B.

c $F1D9 Process: Examine Slab
@ $F1D9 label=Process_ExamineSlab
N $F1D9 Print "#STR$CE02,$08($b==$FF)".
  $F1D9,$03 #REGhl=#R$CE02.
  $F1DC,$03 Jump to #R$ED6D.

c $F1DF
  $F1DF,$03 #REGhl=#R$E392.
  $F1E2,$03 Call #R$AEF7.
  $F1E5,$03 Call #R$ED75.
  $F1E8,$01 #REGa=#REGb.
  $F1E9,$02 Compare #REGa with #N$59.
  $F1EB,$02 Jump to #R$F1F8 if #REGa is not equal to #N$59.
  $F1ED,$06 Call #R$AF1E to transform item #N$59 (#ITEM$59) into item #N$58
. (#ITEM$58).
  $F1F3,$02 #REGb=#N$39.
  $F1F5,$03 Jump to #R$EDA6.

  $F1F8,$03 #REGhl=#R$D51A.
  $F1FB,$03 Jump to #R$ED6D.

  $F1FE,$03 #REGhl=#R$E36B.
  $F201,$03 Call #R$AEF7.
  $F204,$02 Compare #REGa with #N$20.
  $F206,$03 Jump to #R$F17B if #REGa is not equal to #N$20.
  $F209,$06 Call #R$AF1E to transform item #N$20 (#ITEM$20) into item #N$1F
. (#ITEM$1F).
  $F20F,$02 #REGa=#N$1F.
  $F211,$03 Jump to #R$F17B.

  $F214,$02 #REGa=#N$38.
  $F216,$03 Jump to #R$F17B.

  $F219,$02 #REGa=#N$56.
  $F21B,$03 Jump to #R$F17B.
  $F21E,$02 #REGa=#N$23.
  $F220,$03 Jump to #R$F128.
  $F223,$03 #REGhl=#R$E36B.
  $F226,$03 Call #R$AEF7.
  $F229,$02 Compare #REGa with #N$20.
  $F22B,$03 Jump to #R$F128 if #REGa is not equal to #N$20.
  $F22E,$06 Call #R$AF1E to transform item #N$20 (#ITEM$20) into item #N$1F
. (#ITEM$1F).
  $F234,$02 #REGa=#N$1F.
  $F236,$03 Jump to #R$F128.

  $F239,$02 #REGa=#N$65.
  $F23B,$03 Jump to #R$F128.

  $F23E,$02 #REGa=#N$45.
  $F240,$03 Call #R$AE6B.
  $F243,$03 Jump to #R$EE05 if #REGa is equal to #N$45.
  $F246,$02 #REGa=#N$22.
  $F248,$03 Call #R$EDD0.
  $F24B,$01 #REGa=#REGe.
  $F24C,$03 Call #R$AEE0.
  $F24F,$03 #REGhl=#R$A790.
  $F252,$01 Decrease *#REGhl by one.
  $F253,$03 #REGhl=#R$D717.
  $F256,$03 Jump to #R$ED6D.
  $F259,$02 #REGa=#N$22.
  $F25B,$03 Call #R$EDD0.
  $F25E,$01 #REGa=#REGe.
  $F25F,$03 Call #R$AEE0.
  $F262,$03 #REGhl=#R$A790.
  $F265,$01 Decrease *#REGhl by one.
  $F266,$03 #REGhl=#R$D72F.
  $F269,$03 Jump to #R$ED6D.

c $F26C
  $F26C,$06 Call #R$AEF7 with #R$E3B6.
  $F272,$05 Jump to #R$EE35 if #REGa is equal to #N$54.
  $F277,$04 Jump to #R$F285 if #REGa is not equal to #N$52.
N $F27B Bad luck!
  $F27B,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $F27F,$03 #REGhl=#R$D778.
  $F282,$03 Jump to #R$ED6D.

  $F285,$03 #REGbc=#N$5354.
  $F288,$03 Call #R$AF1E.
  $F28B,$02 #REGa=#N$51.
  $F28D,$03 Call #R$AEE7.
  $F290,$03 Jump to #R$EDF3.

c $F293
  $F293,$06 Call #R$AEF7 with #R$E341.
  $F299,$04 Jump to #R$F2B0 if #REGa is equal to #N$0B.
  $F29D,$05 Jump to #R$EE3B if #REGa is not equal to #N$55.
  $F2A2,$03 #REGbc=#N$550C.
  $F2A5,$03 Call #R$AF1E.
  $F2A8,$02 #REGa=#N$51.
  $F2AA,$03 Call #R$AEE7.
  $F2AD,$03 Jump to #R$EDF3.

N $F2B0 Bad luck!
  $F2B0,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $F2B4,$03 #REGhl=#R$D7B6.
  $F2B7,$03 Jump to #R$ED6D.

c $F2BA
  $F2BA,$06 Call #R$AEF7 with #R$E353.
  $F2C0,$05 Jump to #R$EDF9 if #REGa is equal to #N$26.
  $F2C5,$03 Call #R$AEE0.
  $F2C8,$03 #REGhl=#R$D7F9.
  $F2CB,$03 Call #R$A592.
  $F2CE,$03 #REGhl=#R$D8D5.
  $F2D1,$03 Jump to #R$ED71.

c $F2D4
  $F2D4,$03 #REGhl=#R$E3B0.
  $F2D7,$03 Call #R$AEF7.
  $F2DA,$05 Jump to #R$EE35 if #REGa is equal to #N$51.
  $F2DF,$05 Jump to #R$F293 if #REGa is equal to #N$0B.
  $F2E4,$05 Jump to #R$F293 if #REGa is equal to #N$55.
  $F2E9,$03 Jump to #R$F26C.

c $F2EC Process: Drink
@ $F2EC label=Process_Drink
  $F2EC,$03 Load *#R$A7C3 into #REGa.
  $F2EF,$04 Jump to #R$F2F9 if the current room is not room #N$2A: #ROOM$2A.
N $F2F3 Print "#STR$D8E7,$08($b==$FF)".
  $F2F3,$03 #REGhl=#R$D8E7.
  $F2F6,$03 Jump to #R$ED6D.

N $F2F9 Print "#STR$D8FD,$08($b==$FF)".
@ $F2F9 label=Drink_SaltWater
  $F2F9,$03 #REGhl=#R$D8FD.
  $F2FC,$03 Jump to #R$ED6D.

c $F2FF Process:
  $F2FF,$03 Load *#R$A7C3 into #REGa.
  $F302,$05 Jump to #R$EE0B if the player is in room #N$0C: #ROOM$0C.
  $F307,$05 Jump to #R$EE0B if the player is in room #N$15: #ROOM$15.
  $F30C,$04 Jump to #R$F314 if the player is not in room #N$05: #ROOM$05.
  $F310,$02 Load item #N$0C: #ITEM$0C into #REGa.
  $F312,$02 Jump to #R$F316.

  $F314,$02 Load item #N$15: #ITEM$15 into #REGa.
  $F316,$03 Call #R$EB10.
  $F319,$03 Call #R$F7AC.
  $F31C,$01 Return.

c $F31D
  $F31D,$02 Load #N$37: #ITEM$37 into #REGa.
  $F31F,$03 Call #R$AE6B.
  $F322,$02 Jump to #R$F32E if #REGa is not equal to #N$37.
N $F324 Bad luck!
  $F324,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
N $F328 Print "#STR$D919,$08($b==$FF)".
  $F328,$03 #REGhl=#R$D919.
  $F32B,$03 Jump to #R$ED6D.
N $F32E Print "#STR$D973,$08($b==$FF)".
  $F32E,$03 #REGhl=#R$D973.
  $F331,$03 Call #R$A592.
  $F334,$03 Call #R$F7AC.
  $F337,$01 Return.

c $F338
  $F338,$03 #REGhl=#R$E3E7.
  $F33B,$03 Call #R$AEF7.
  $F33E,$05 Jump to #R$F31D if #REGa is equal to #N$6C.
  $F343,$05 Jump to #R$EE0B if #REGa is equal to #N$32.
  $F348,$03 Jump to #R$F2FF.

  $F34B,$08 Jump to #R$EE0B if *#R$A7C3 is equal to room #N$63: #ROOM$63.
  $F353,$02 #REGa=#N$63.
  $F355,$03 Call #R$EB10.
  $F358,$01 Return.

c $F359
  $F359,$03 Load *#R$A7C3 into #REGa.
  $F35C,$02 #REGb=#N$05.
  $F35E,$04 Jump to #R$F369 if the player is in room #N$0C: #ROOM$0C.
  $F362,$05 Jump to #R$EE2F if the player is not in room #N$15: #ROOM$15.
  $F367,$02 #REGb=#N$14.
  $F369,$01 #REGa=#REGb.
  $F36A,$03 Call #R$EB10.
  $F36D,$01 Return.

c $F36E
  $F36E,$03 Load *#R$A7C3 into #REGa.
  $F371,$05 Jump to #R$EDED if the player is in room #N$0D: #ROOM$0D.
  $F376,$05 Jump to #R$F359 if the player is in room #N$0C: #ROOM$0C.
  $F37B,$05 Jump to #R$F359 if the player is in room #N$15: #ROOM$15.
  $F380,$03 Jump to #R$EE2F.

c $F383
  $F383,$03 #REGa=*#R$A7C3.
  $F386,$05 Jump to #R$EDED if #REGa is equal to room #N$0D: #ROOM$0D.
  $F38B,$05 Jump to #R$F359 if #REGa is equal to room #N$0C: #ROOM$0C.
  $F390,$05 Jump to #R$F359 if #REGa is equal to room #N$15: #ROOM$15.
N $F395 Print "#STR$D9A3,$08($b==$FF)".
  $F395,$03 #REGhl=#R$D9A3.
  $F398,$03 Jump to #R$ED6D.

c $F39B Remove User Input Token 1
@ $F39B label=RemoveUserInput_Token_1
D $F39B Some commands like #R$FB89("GO") and #R$FC8D("SWIM") are just treated
. like aliases, where the second token (the direction) is shunted down to being
. the first token, and the second token is then just erased.
. Hence, using "GO NORTH" is just the same as typing "NORTH".
  $F39B,$04 Load #R$A824 into #REGix.
  $F39F,$06 Fetch *#REGix+#N$01 (#R$A825) and write it to #R$A824.
  $F3A5,$04 Write a termination character (#N$FF) to #R$A825.
  $F3A9,$03 Jump to #R$B05E.

c $F3AC
  $F3AC,$05 Call #R$AE6B with item #N$5E: #ITEM$5E.
  $F3B1,$03 Jump to #R$EDED if the item is not either in the current room or in
. the players inventory.
  $F3B4,$05 Call #R$EB10 with #N$60.
  $F3B9,$01 Return.

c $F3BA
  $F3BA,$02 #REGa=#N$5C.
  $F3BC,$03 Call #R$AE6B.
  $F3BF,$03 Jump to #R$EDED if ?? is not equal to #N$5C.
  $F3C2,$02 #REGa=#N$63.
  $F3C4,$03 Call #R$EB10.
  $F3C7,$01 Return.

c $F3C8
  $F3C8,$08 Jump to #R$EE0B if *#R$A7C3 is not equal to #N$18.
  $F3D0,$02 #REGa=#N$19.
  $F3D2,$03 Call #R$EB10.
  $F3D5,$01 Return.

c $F3D6
  $F3D6,$07 Jump to #R$F3E1 if *#R$A7C3 is not equal to #N$2C.
  $F3DD,$02 #REGa=#N$24.
  $F3DF,$02 Jump to #R$F3E8.

  $F3E1,$05 Jump to #R$EE0B if #REGa is not equal to #N$52.
  $F3E6,$02 #REGa=#N$4E.
  $F3E8,$03 Call #R$EB10.
  $F3EB,$01 Return.

c $F3EC
  $F3EC,$07 Jump to #R$F3F7 if *#R$A7C3 is not equal to #N$06.
  $F3F3,$02 #REGa=#N$05.
  $F3F5,$02 Jump to #R$F406.

  $F3F7,$04 Jump to #R$F3FF if #REGa is not equal to #N$41.
  $F3FB,$02 #REGa=#N$42.
  $F3FD,$02 Jump to #R$F406.

  $F3FF,$05 Jump to #R$EE0B if #REGa is not equal to #N$4B.
  $F404,$02 #REGa=#N$4F.
  $F406,$03 Call #R$EB10.
  $F409,$01 Return.

c $F40A
  $F40A,$03 #REGhl=#R$D9CF.
  $F40D,$03 Jump to #R$ED6D.

  $F410,$03 #REGhl=#R$DA24.
  $F413,$03 Jump to #R$ED6D.

  $F416,$08 Jump to #R$EDED if *#R$A7C3 is not equal to #N$60.
N $F41E Bad luck!
  $F41E,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $F422,$03 #REGhl=#R$DA42.
  $F425,$03 Jump to #R$ED6D.

c $F428 Process: Wear Torc
@ $F428 label=Process_WearTorc
R $F428 E The item ID currently being acted on
N $F428 The player was trying to wear the torc, but is it either in the room or
. in the players inventory?
  $F428,$06 Call #R$AEF7 with #R$E366.
N $F42E The torc is present but is the player already wearing it?
  $F42E,$03 Call #R$EDD0.
N $F431 The torc is in the players inventory.
N $F431 Restore the original item ID to check which item was found in the item
. group.
  $F431,$06 Jump to #R$EE41 if the original requested item ID is not equal to
. item #N$69: #ITEM$69 (so the found item is #N$6A: #ITEM$6A).
N $F437 Change the torc state!
  $F437,$06 Call #R$AF1E to transform item #N$69 (#ITEM$69) into item #N$6A
. (#ITEM$6A).
N $F43D Print "#STR$A9F7,$08($b==$FF)".
  $F43D,$03 Jump to #R$EDF3.

c $F440 Process: Wear Helmet
@ $F440 label=Process_WearHelmet
R $F440 E The item ID currently being acted on
N $F440 The player was trying to wear the helmet, but is it either in the
. room or in the players inventory?
  $F440,$06 Call #R$AEF7 with #R$E36B.
N $F446 The helmet is present but is the player already wearing it?
  $F446,$03 Call #R$EDD0.
  $F449,$06 Jump to #R$EE41 if the item found in the group is not equal to item
. #N$1F: #ITEM$1F (so the found item is #N$20: #ITEM$20).
N $F44F Change the helmet state!
  $F44F,$06 Call #R$AF1E to transform item #N$1F (#ITEM$1F) into item #N$20
. (#ITEM$20).
N $F455 Print "#STR$A9F7,$08($b==$FF)".
  $F455,$03 Jump to #R$EDF3.

c $F458 Process: Wear Amulet
@ $F458 label=Process_WearAmulet
R $F458 E The item ID currently being acted on
N $F458 The player was trying to wear the amulet, but is it either in the room
. or in the players inventory?
  $F458,$06 Call #R$AEF7 with #R$E3A6.
N $F45E The amulet is present but is the player already wearing it?
  $F45E,$03 Call #R$EDD0.
  $F461,$06 Jump to #R$EE41 if the item found in the group is not equal to item
. #N$4B: #ITEM$4B (so the found item is #N$4C: #ITEM$4C).
N $F467 Change the amulet state!
  $F467,$06 Call #R$AF1E to transform item #N$4B (#ITEM$4B) into item #N$4C
. (#ITEM$4C).
  $F46D,$06 Call #R$AF1E to transform item #N$29 (#ITEM$29) into item #N$2A
. (#ITEM$2A).
N $F473 Uncover an exit from #ROOM$20.
  $F473,$05 Write #N$18 to *#R$E7D5 to open up southbound access to #ROOM$18
. from #ROOM$20.
N $F478 Is the player in room #N$20: #ROOM$20?
  $F478,$08 Jump to #R$EDF3 if *#R$A7C3 is not equal to room #N$20: #ROOM$20.
N $F480 The player is in room #N$20: #ROOM$20.
N $F480 Print "#STR$A9F7,$08($b==$FF)".
  $F480,$03 Call #R$EDF3.
N $F483 Print "#STR$B50E,$08($b==$FF)".
  $F483,$03 #REGhl=#R$B50E.
  $F486,$03 Jump to #R$ED6D.

c $F489 Process: Drop Amulet
@ $F489 label=Process_DropAmulet
  $F489,$06 Call #R$AEF7 with #R$E3A6.
  $F48F,$03 Call #R$EDD0.
  $F492,$06 Jump to #R$EDC1 if #REGe is equal to item #N$4B: #ITEM$4B.
N $F498 Change the amulet state!
  $F498,$06 Call #R$AF1E to transform item #N$4C (#ITEM$4C) into item #N$4B
. (#ITEM$4B).
N $F49E Change the vale state!
  $F49E,$06 Call #R$AF1E to transform item #N$2A (#ITEM$2A) into item #N$29
. (#ITEM$29).
  $F4A4,$04 Write #N$00 to *#R$E7D5.
  $F4A8,$05 Call #R$EDC1 with item #N$4B: #ITEM$4B.
  $F4AD,$06 Return if *#R$A7C3 is not equal to room #N$20: #ROOM$20.
N $F4B3 Print "#STR$B4A0,$08($b==$FF)".
  $F4B3,$03 #REGhl=#R$B4A0.
  $F4B6,$03 Jump to #R$ED6D.

c $F4B9
  $F4B9,$08 Jump to #R$EDED if *#R$A7C3 is not equal to room #N$4F: #ROOM$4F.
  $F4C1,$05 Call #R$AEE0 with item #N$12: #ITEM$12.
  $F4C6,$05 Call #R$AEE0 with item #N$1C: #ITEM$1C.
  $F4CB,$05 Call #R$AEE0 with item #N$04: #ITEM$04.
  $F4D0,$05 Call #R$AEE0 with item #N$05: #ITEM$05.
N $F4D5 Change the Fomorian tribe state!
  $F4D5,$06 Call #R$AF1E to transform item #N$0F (#ITEM$0F) into item #N$10
. (#ITEM$10).
  $F4DB,$05 Set bit 5 of *#R$A76D.
  $F4E0,$05 Call #R$B09A to add #N$04 points to the score.
  $F4E5,$04 Decrease *#R$A790 by one.
N $F4E9 Print "#STR$DA9E,$08($b==$FF)".
  $F4E9,$03 #REGhl=#R$DA9E.
  $F4EC,$03 Call #R$A592.
N $F4EF Print "#STR$DB11,$08($b==$FF)".
  $F4EF,$03 #REGhl=#R$DB11.
  $F4F2,$03 Jump to #R$ED71.

c $F4F5 Process: Wear Shield
@ $F4F5 label=Process_WearShield
R $F4F5 E The item ID currently being acted on
N $F4F5 The player was trying to wear the shield, but are they carrying it? As
. carrying it at all counts as wearing it.
  $F4F5,$05 Call #R$EDD0 with item #N$56: #ITEM$56.
N $F4FA  Print "#STR$DBBE,$08($b==$FF)".
  $F4FA,$03 #REGhl=#R$DBBE.
  $F4FD,$03 Jump to #R$ED6D.

c $F500 Process: Wear Cloak
@ $F500 label=Process_WearCloak
R $F500 E The item ID currently being acted on
N $F500 The player was trying to wear the cloak, but is it either in the room
. or in the players inventory?
  $F500,$06 Call #R$AEF7 with #R$E3DD.
N $F506 The cloak is present but is the player already wearing it?
  $F506,$03 Call #R$EDD0.
  $F509,$06 Jump to #R$EE41 if the item found in the group is not equal to item
. #N$64: #ITEM$64 (so the found item is #N$6D: #ITEM$6D).
N $F50F Change the cloak state!
  $F50F,$06 Call #R$AF1E to transform item #N$64 (#ITEM$64) into item #N$6D
. (#ITEM$6D).
N $F515 Print "#STR$A9F7,$08($b==$FF)".
  $F515,$03 Jump to #R$EDF3.

c $F518 Process: Eat Food
@ $F518 label=Process_EatFood
R $F518 E The item ID currently being acted on
  $F518,$05 Call #R$EDD0 with item #N$22: #ITEM$22.
N $F51D The player has the food in their inventory, so eat it!
  $F51D,$04 Call #R$AEE0 with the item ID of the originally requsted item.
  $F521,$04 Decrease *#R$A790 by one.
N $F525 Print "#STR$A9F7,$08($b==$FF)".
  $F525,$03 Call #R$EDF3.
N $F528 Print "#STR$DC1D,$08($b==$FF)".
  $F528,$03 #REGhl=#R$DC1D.
  $F52B,$03 Jump to #R$ED6D.

c $F52E Process: Eat Meat
@ $F52E label=Process_EatMeat
R $F52E E The item ID currently being acted on
  $F52E,$05 Call #R$EDD0 with item #N$3A: #ITEM$3A.
N $F533 The player has the meat in their inventory, so eat it!
  $F533,$04 Call #R$AEE0 with the item ID of the originally requsted item.
  $F537,$04 Decrease *#R$A790 by one.
N $F53B Print "#STR$A9F7,$08($b==$FF)".
  $F53B,$03 Call #R$EDF3.
N $F53E Print "#STR$DC41,$08($b==$FF)".
  $F53E,$03 #REGhl=#R$DC41.
  $F541,$03 Jump to #R$ED6D.

c $F544 Process: Capture Roman
@ $F544 label=Process_CaptureRoman
  $F544,$06 Call #R$AEF7 with #R$E341.
N $F54A The player wants to capture the Roman but is he already captured?
N $F54A Print "#STR$CDE8,$08($b==$FF)" if the Roman is already captured.
  $F54A,$05 Jump to #R$EE0B if item #N$0B: #ITEM$0B is in the current room.
N $F54F The player wants to capture the Roman but is he even here?
N $F54F Print "#STR$A9EC,$08($b==$FF)" if the Roman isn't present in the room.
  $F54F,$05 Jump to #R$EDED if item #N$0A: #ITEM$0A isn't in the current room.
N $F554 Can the player even capture the Roman? Do they have the rope?
  $F554,$05 Call #R$AE6B with item #N$51: #ITEM$51.
  $F559,$03 Jump to #R$EDDB if item #N$51: #ITEM$51 isn't present in the
. current room or the players inventory.
N $F55C The Roman is here, and the player has the rope! Let's capture a Roman:
N $F55C Change the romans state!
  $F55C,$06 Call #R$AF1E to transform item #N$0A (#ITEM$0A) into item #N$0B
. (#ITEM$0B).
  $F562,$05 Call #R$B09A to add #N$04 points to the score.
N $F567 The rope as a separate item is no longer needed.
  $F567,$05 Call #R$AEE0 with item #N$51: #ITEM$51.
  $F56C,$04 Decrease *#R$A790 by one.
N $F570 Flag to the game that this has occurred.
  $F570,$05 Set bit 0 of *#R$A787 which relates to the roman being captured.
N $F575 Print "#STR$DC58,$08($b==$FF)".
  $F575,$03 #REGhl=#R$DC58.
  $F578,$03 Jump to #R$ED6D.

c $F57B
  $F57B,$03 #REGhl=#R$E3C5.
  $F57E,$03 Call #R$AEF7.
  $F581,$02 Compare #REGa with #N$5E.
  $F583,$03 Jump to #R$EE0B if #REGa is equal to #N$5E.
  $F586,$02 Compare #REGa with #N$5C.
  $F588,$03 Jump to #R$EE0B if #REGa is equal to #N$5C.
  $F58B,$03 Call #R$EDD0.
  $F58E,$02 #REGa=#N$5A.
  $F590,$03 Call #R$AEE0.
  $F593,$02 #REGa=#N$5E.
  $F595,$03 Call #R$AEE7.
  $F598,$03 #REGhl=#R$A790.
  $F59B,$01 Decrease *#REGhl by one.
  $F59C,$05 Write #N$60 to *#R$E96A.
  $F5A1,$05 Write #N$63 to *#R$E959.
  $F5A6,$03 #REGhl=#R$A76C.
  $F5A9,$02 Test bit 6 of *#REGhl.
  $F5AB,$03 Jump to #R$EDF3 if *#REGhl is not equal to #N$63.
  $F5AE,$02 Set bit 6 of *#REGhl.
  $F5B0,$05 Call #R$B09A to add #N$04 points to the score.
  $F5B5,$03 Jump to #R$EDF3.
  $F5B8,$03 #REGhl=#R$E392.
  $F5BB,$03 Call #R$AEF7.
  $F5BE,$02 Compare #REGa with #N$59.
  $F5C0,$03 Jump to #R$EE0B if #REGa is equal to #N$59.
  $F5C3,$02 Compare #REGa with #N$39.
  $F5C5,$03 Jump to #R$EDF9 if #REGa is equal to #N$39.
  $F5C8,$03 Call #R$EDD0.
  $F5CB,$01 #REGa=#REGe.
  $F5CC,$03 Call #R$AEE0.
  $F5CF,$06 Call #R$AF1E to transform item #N$58 (#ITEM$58) into item #N$59
. (#ITEM$59).
  $F5D5,$03 #REGhl=#R$A790.
  $F5D8,$01 Decrease *#REGhl by one.
  $F5D9,$03 #REGhl=#R$A76D.
  $F5DC,$02 Test bit 4 of *#REGhl.
  $F5DE,$03 Jump to #R$EDF3 if *#REGhl is not equal to #N$39.
  $F5E1,$02 Set bit 4 of *#REGhl.
  $F5E3,$05 Call #R$B09A to add #N$04 points to the score.
  $F5E8,$03 Jump to #R$EDF3.

c $F5EB Process: Buy Meat From Trader With Salt
@ $F5EB label=Process_BuyMeatFromTraderWithSalt
  $F5EB,$05 Call #R$AE6B with item #N$3C: #ITEM$3C.
N $F5F0 If #ITEM$3C is not present in the current room then print
. "#STR$A9EC,$08($b==$FF)".
  $F5F0,$03 Jump to #R$EDED if #ITEM$3C is not present in the current room.
N $F5F3 Print "#STR$DCA8,$08($b==$FF)".
  $F5F3,$03 #REGhl=#R$DCA8.
  $F5F6,$03 Jump to #R$ED6D.

c $F5F9
  $F5F9,$07 Jump to #R$F604 if *#R$A7C3 is not equal to room #N$43: #ROOM$43.
  $F600,$02 #REGa=#N$57.
  $F602,$02 Jump to #R$F60F.
  $F604,$02 #REGa=#N$43.
  $F606,$07 Jump to #R$F60F if bit 5 of *#R$A76D is not set.
  $F60D,$02 #REGa=#N$56.
  $F60F,$01 Stash #REGaf on the stack.
N $F610 Print "#STR$DCBD,$08($b==$FF)".
  $F610,$03 #REGhl=#R$DCBD.
  $F613,$03 Call #R$A592.
  $F616,$02 #REGb=#N$32.
  $F618,$03 Call #R$A5C2.
  $F61B,$01 Restore #REGaf from the stack.
  $F61C,$03 Call #R$EB10.
  $F61F,$01 Return.

c $F620
  $F620,$03 #REGhl=#R$A825.
  $F623,$03 #REGbc=#N($0009,$04,$04).
  $F626,$02 #REGa=#N$3C.
  $F628,$02 CPIR.
  $F62A,$01 Return.

  $F62B,$03 #REGhl=#R$E392.
  $F62E,$03 Call #R$AEF7.
  $F631,$03 Call #R$AEDA.
  $F634,$01 Return if #REGa is equal to #N$3C.
  $F635,$01 Restore #REGhl from the stack.
  $F636,$03 Call #R$F620.
  $F639,$01 #REGa=#REGe.
  $F63A,$03 Call #R$EDD0 if ?? is equal to #N$3C.
  $F63D,$03 #REGhl=#R$DCE5.
  $F640,$03 Jump to #R$ED6D.

  $F643,$03 #REGhl=#R$E341.
  $F646,$03 Call #R$AEF7.
  $F649,$05 Jump to #R$EE0B if #REGa is equal to #N$0C.
  $F64E,$05 Jump to #R$EE0B if #REGa is equal to #N$55.
  $F653,$03 Write #REGa to *#R$A773.
  $F656,$03 Call #R$F62B.
  $F659,$07 Jump to #R$F67B if *#R$A773 is greater than or equal to #N$04.
  $F660,$02 #REGa=#N$02.
  $F662,$03 Call #R$AEE0.
  $F665,$02 #REGa=#N$03.
  $F667,$03 Call #R$AEE0.
  $F66A,$02 #REGa=#N$08.
  $F66C,$03 Call #R$AEE0.
  $F66F,$06 Call #R$AF1E to transform item #N$07 (#ITEM$07) into item #N$0A
. (#ITEM$0A).
  $F675,$03 #REGhl=#R$DCFE.
  $F678,$03 Jump to #R$ED6D.

  $F67B,$04 Jump to #R$F68B if #REGa is not equal to #N$0A.
  $F67F,$06 Call #R$AF1E to transform item #N$0A (#ITEM$0A) into item #N$0C
. (#ITEM$0C).
  $F685,$03 #REGhl=#R$DD4A.
  $F688,$03 Jump to #R$ED6D.

  $F68B,$06 Call #R$AF1E to transform item #N$0B (#ITEM$0B) into item #N$55
. (#ITEM$55).
  $F691,$05 Reset bit 0 of *#R$A787.
  $F696,$03 Call #R$F685.
  $F699,$03 #REGhl=#R$DD6E.
  $F69C,$03 Jump to #R$ED6D.

  $F69F,$03 #REGhl=#R$E348.
  $F6A2,$03 Call #R$AEF7.
  $F6A5,$03 #REGhl=#R$FC8A.
  $F6A8,$03 #REGbc=#N($0003,$04,$04).
  $F6AB,$02 CPIR.
  $F6AD,$03 Jump to #R$EE0B if #REGa is equal to #N$0A.
  $F6B0,$03 Write #REGa to *#R$A773.
  $F6B3,$03 Call #R$F62B.
  $F6B6,$07 Jump to #R$F6C7 if *#R$A773 is not equal to #N$0F.
N $F6BD Bad luck!
  $F6BD,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $F6C1,$03 #REGhl=#R$DD86.
  $F6C4,$03 Jump to #R$ED6D.

  $F6C7,$02 #REGa=#N$39.
  $F6C9,$03 Call #R$AE6B.
  $F6CC,$02 Jump to #R$F6D4 if #REGa is equal to #N$39.
  $F6CE,$03 #REGhl=#R$DDB5.
  $F6D1,$03 Jump to #R$ED6D.

  $F6D4,$03 #REGa=*#R$A773.
  $F6D7,$01 #REGb=#REGa.
  $F6D8,$02 #REGa+=#N$09.
  $F6DA,$01 #REGc=#REGa.
  $F6DB,$03 Call #R$AF1E.
  $F6DE,$03 Jump to #R$F685.

  $F6E1,$02 #REGa=#N$26.
  $F6E3,$03 Call #R$AE6B.
  $F6E6,$03 Jump to #R$EE0B if #REGa is equal to #N$26.
  $F6E9,$03 Call #R$F620.
  $F6EC,$02 Jump to #R$F6F7 if #REGa is not equal to #N$26.
  $F6EE,$03 #REGhl=#R$E392.
  $F6F1,$03 Call #R$AEF7.
  $F6F4,$03 Call #R$EDD0.
  $F6F7,$06 Call #R$AF1E to transform item #N$13 (#ITEM$13) into item #N$26
. (#ITEM$26).
  $F6FD,$03 #REGhl=#R$DDDF.
  $F700,$03 Jump to #R$ED6D.

  $F703,$03 Write #REGhl to *#R$A772.
  $F706,$03 Call #R$F62B.
N $F709 Bad luck!
  $F709,$04 Switch #R$E9B2 onto the stack so the next return actions a "game
. over".
  $F70D,$03 #REGhl=*#R$A772.
  $F710,$03 Jump to #R$ED6D.

  $F713,$03 Call #R$F62B.
  $F716,$03 Call #R$F685.
  $F719,$03 #REGhl=#R$DDFA.
  $F71C,$03 Jump to #R$F703.

  $F71F,$03 #REGhl=#R$E377.
  $F722,$03 Call #R$AEF7.
  $F725,$05 Jump to #R$F69F if #REGa is not equal to #N$27.
  $F72A,$03 #REGhl=#R$DCE5.
  $F72D,$03 Jump to #R$ED6D.

  $F730,$03 Call #R$F62B.
  $F733,$03 #REGhl=#R$DE31.
  $F736,$03 Jump to #R$ED6D.

  $F739,$02 #REGa=#N$45.
  $F73B,$03 Call #R$AE6B.
  $F73E,$03 Jump to #R$EE0B if #REGa is equal to #N$45.
  $F741,$03 Call #R$F62B.
  $F744,$02 #REGa=#N$56.
  $F746,$03 Call #R$AEDA.
  $F749,$03 #REGhl=#R$DE57.
  $F74C,$03 Jump to #R$F703 if #REGa is not equal to #N$56.
  $F74F,$06 Call #R$AF1E to transform item #N$44 (#ITEM$44) into item #N$45
. (#ITEM$45).
  $F755,$05 Write #N$2C to *#R$E84D.
  $F75A,$05 Write #N$35 to *#R$E84E.
  $F75F,$05 Call #R$B09A to add #N$04 points to the score.
  $F764,$03 #REGhl=#R$DE9E.
  $F767,$03 Jump to #R$ED6D.

  $F76A,$03 Call #R$F62B.
  $F76D,$03 Call #R$F685.
  $F770,$03 #REGhl=#R$DEC2.
  $F773,$03 Jump to #R$F703.

  $F776,$03 Call #R$F62B.
  $F779,$03 #REGhl=#R$DEF0.
  $F77C,$03 Jump to #R$F703.

  $F77F,$02 #REGa=#N$50.
  $F781,$03 Call #R$AE6B.
  $F784,$03 Jump to #R$EE0B if #REGa is equal to #N$50.
  $F787,$03 Call #R$F62B.
  $F78A,$06 Call #R$AF1E to transform item #N$4F (#ITEM$4F) into item #N$50
. (#ITEM$50).
  $F790,$03 Jump to #R$F764.

  $F793,$02 #REGa=#N$52.
  $F795,$03 Call #R$AE6B.
  $F798,$03 Jump to #R$EE0B if #REGa is not equal to #N$52.
  $F79B,$03 Call #R$F62B.
  $F79E,$06 Call #R$AF1E to transform item #N$52 (#ITEM$52) into item #N$53
. (#ITEM$53).
  $F7A4,$05 Call #R$B09A to add #N$04 points to the score.
  $F7A9,$03 Jump to #R$F764.

  $F7AC,$02 #REGa=#N$19.
  $F7AE,$03 Call #R$AEDA.
  $F7B1,$01 Return if #REGa is not equal to #N$19.
  $F7B2,$01 #REGa=#REGe.
  $F7B3,$03 Call #R$AEE0.
  $F7B6,$04 Decrease *#R$A790 by one.
  $F7BA,$03 #REGhl=#R$E060.
  $F7BD,$03 Jump to #R$ED6D.

c $F7C0
  $F7C0,$02 #REGa=#N$46.
  $F7C2,$03 Call #R$AE6B.
  $F7C5,$02 Jump to #R$F7CD if *#REGhl is not equal to #N$46.
  $F7C7,$03 #REGhl=#R$E079.
  $F7CA,$03 Jump to #R$ED6D.

  $F7CD,$08 Jump to #R$EE0B if *#R$A7C3 is not equal to #N$3A.
  $F7D5,$02 #REGa=#N$49.
  $F7D7,$03 Call #R$EB10.
  $F7DA,$01 Return.

c $F7DB
  $F7DB,$08 Jump to #R$EE0B if *#R$A7C3 is not equal to #N$38.
  $F7E3,$02 #REGa=#N$59.
  $F7E5,$03 Call #R$EB10.
  $F7E8,$01 Return.

c $F7E9 Process: Get Staff
@ $F7E9 label=Process_GetStaff
  $F7E9,$02 #REGa=#N$61.
  $F7EB,$03 Call #R$ED75.
  $F7EE,$01 #REGa=#N$00.
  $F7EF,$03 Write #REGa to *#R$E8F6.
  $F7F2,$03 Write #REGa to *#R$E8F7.
  $F7F5,$05 Write #N$4C to *#R$E8F4.
  $F7FA,$03 Jump to #R$EDA6.

c $F7FD
  $F7FD,$03 Call #R$AF70.
N $F800 The "" command can only be called on its own.
  $F800,$01 Return if the carry flag is set.
  $F801,$05 Call #R$AE6B with item #N$37: #ITEM$37.
  $F806,$03 Jump to #R$EE11 if.
  $F809,$05 Call #R$AEE0 with item #N$37: #ITEM$37.
  $F80E,$05 Call #R$B09A to add #N$04 points to the score.
  $F813,$05 Call #R$AEE7 with item #N$38: #ITEM$38.
N $F818 Print "#STR$CE50,$08($b==$FF)".
  $F818,$03 #REGhl=#R$CE50.
  $F81B,$03 Call #R$A592.
N $F81E Print "#STR$CE6C,$08($b==$FF)".
  $F81E,$03 #REGhl=#R$CE6C.
  $F821,$03 Jump to #R$ED71.

c $F824 Action: Inventory
@ $F824 label=Action_Inventory
  $F824,$03 Call #R$AF70.
N $F827 The "INVENTORY" command can only be called on its own.
  $F827,$01 Return if there's any token set in #R$A825.
  $F828,$07 Jump to #R$EE17 if *#R$A790 is zero (the player isn't holding any
. items).
N $F82F Clear the screen and display the players inventory.
  $F82F,$03 Call #R$A54E.
  $F832,$03 Call #R$A56A.
N $F835 Print "#STR$AA3B,$08($b==$FF)".
  $F835,$03 #REGhl=#R$AA3B.
  $F838,$03 Call #R$A592.
  $F83B,$05 Call #R$AB97 with a room ID of #N$01 which is the players
. inventory.
  $F840,$01 Return.

c $F841 Action: Look
@ $F841 label=Action_Look
  $F841,$03 Call #R$AF70.
N $F844 The "LOOK" command can only be called on its own.
  $F844,$01 Return if there's any token set in #R$A825.
  $F845,$05 Call #R$ABB6 with #REGe set to #N$01 (which will force any room
. images to be re-displayed).
  $F84A,$01 Return.

c $F84B Action: Score
@ $F84B label=Action_Score
  $F84B,$03 Call #R$AF70.
N $F84E The "SCORE" command can only be called on its own.
  $F84E,$01 Return if there's any token set in #R$A825.
  $F84F,$03 Call #R$B0A9.
  $F852,$01 Return.

c $F853 Action: Examine
@ $F853 label=Action_Examine
  $F853,$03 Call #R$AF7B.
  $F856,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $F857,$05 Jump to #R$EDE7 if there were more than #N$02 direct objects
. referenced in the user input (so the command is malformed).
  $F85C,$03 #REGhl=#R$F86B.
  $F85F,$03 #REGde=#R$F87D.
  $F862,$03 #REGbc=#N($0009,$04,$04).
  $F865,$03 Call #R$B0DE.
N $F868 No phrase tokens matched the user input tokens.
N $F868 Print "#STR$CF40,$08($b==$FF)".
  $F868,$03 Jump to #R$EE53.
N $F86B The token table for the action "examine":
@ $F86B label=Table_ActionExamine_TokenGroup
W $F86B,$02 Token group #N($01+(#PC-$F86B)/$02).
L $F86B,$02,$09,$02
N $F87D The actions table for "examine":
@ $F87D label=Table_ActionsExamine
W $F87D,$02 Action routine #N($01+(#PC-$F87D)/$02).
L $F87D,$02,$09,$02

g $F88F Data: Item Group "Body"
@ $F88F label=Data_ItemGroup_Body_Duplicate
B $F88F,$01 #IF(#PEEK(#PC)==$FF)(Terminator,Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC))).
L $F88F,$01,$03,$02

c $F892 Action: Load
@ $F892 label=Action_Load
  $F892,$03 Call #R$AF70.
N $F895 The "LOAD" command can only be called on its own.
  $F895,$01 Return if there's any token set in #R$A825.
  $F896,$03 Call #R$A605.
  $F899,$01 Return if there was a tape loading error.
  $F89A,$03 Call #R$A53E.
  $F89D,$01 Restore #REGhl from the stack.
  $F89E,$03 Jump to #R$A531.

c $F8A1 Action: Save
@ $F8A1 label=Action_Save
  $F8A1,$03 Call #R$AF70.
N $F8A4 The "SAVE" command can only be called on its own.
  $F8A4,$01 Return if there's any token set in #R$A825.
  $F8A5,$03 Call #R$A5CA.
  $F8A8,$01 Return.

c $F8A9 Action: Quit
@ $F8A9 label=Action_Quit
  $F8A9,$03 Call #R$AF70.
N $F8AC The "QUIT" command can only be called on its own.
  $F8AC,$01 Return if there's any token set in #R$A825.
N $F8AD Inform the player of their score.
  $F8AD,$03 Call #R$B0A9.
N $F8B0 Print "#STR$A9A1,$08($b==$FF)".
  $F8B0,$03 #REGhl=#R$A9A1.
  $F8B3,$03 Call #R$A592.
@ $F8B6 label=WantToSave_Loop
  $F8B6,$03 Call #R$A53E.
N $F8B9 The player just wants to quit.
  $F8B9,$04 #HTML(Jump to #R$F8C4 if the keypress is "<code>#CHR$4E</code>".)
  $F8BD,$04 #HTML(Jump back to #R$F8B6 if the keypress is anything other than
. "<code>#CHR$59</code>".)
N $F8C1 The player does want to save before quitting...
  $F8C1,$03 Call #R$A5CA.
N $F8C4 Jump to asking if the player "wants another game?"
@ $F8C4 label=QuitGame
  $F8C4,$04 Switch #R$E9BB onto the stack so the next return action is asking
. if the player would "Want another game? Y/N.".
  $F8C8,$01 Return.

c $F8C9 Action: North
@ $F8C9 label=Action_North
  $F8C9,$02 Set #REGc to "NORTH" (#N$00).
  $F8CB,$02 Jump to #R$F8DF.

c $F8CD Action: South
@ $F8CD label=Action_South
  $F8CD,$02 Set #REGc to "SOUTH" (#N$01).
  $F8CF,$02 Jump to #R$F8DF.

c $F8D1 Action: East
@ $F8D1 label=Action_East
  $F8D1,$02 Set #REGc to "EAST" (#N$02).
  $F8D3,$02 Jump to #R$F8DF.

c $F8D5 Action: West
@ $F8D5 label=Action_West
  $F8D5,$02 Set #REGc to "WEST" (#N$03).
  $F8D7,$02 Jump to #R$F8DF.

c $F8D9 Action: Up
@ $F8D9 label=Action_Up
  $F8D9,$02 Set #REGc to "UP" (#N$04).
  $F8DB,$02 Jump to #R$F8DF.

c $F8DD Action: Down
@ $F8DD label=Action_Down
E $F8DD Continue on to #R$F8DF.
  $F8DD,$02 #REGc=#N$05.

c $F8DF Move Player
@ $F8DF label=MovePlayer
D $F8DF The data in #R$E714 is stored in a particular order for each room:
. #TABLE(default,centre,centre)
. { =h Offset | =h Exit To Room }
. { #N$00 | North }
. { #N$01 | South }
. { #N$02 | East }
. { #N$03 | West }
. { #N$04 | Up }
. { #N$05 | Down }
. TABLE#
. This is how the movement works; taking the current room from the map - we add
. a "movement value" (e.g. "East" which is #N$02) - this then points to data in
. the table which correlates to either a room number for the exit, or #N$00 to
. indicate there is no exit in that direction.
R $F8DF C A movement "value" from the action
  $F8DF,$03 Call #R$AF70.
N $F8E2 Directional commands can only be called on their own.
N $F8E2 Other commands like #R$FB89("GO") and #R$FC8D("SWIM") are just treated
. like aliases, where the second token (the direction) is shunted down to being
. the first token, and the second token is then just erased: #R$F39B.
  $F8E2,$01 Return if there's any token set in #R$A825.
  $F8E3,$02 Initialise #REGb with #N$00 so the movement value is now in #REGbc.
  $F8E5,$03 Call #R$AC9A.
N $F8E8 #REGhl now holds a pointer to the room data for the current room at
. #R$E714.
  $F8E8,$01 Add the movement value to #REGhl.
  $F8E9,$01 Fetch the entry from *#REGhl and store it in #REGa.
  $F8EA,$04 Jump to #R$EE1D if there is no exit at the requested memory
. location.
  $F8EE,$03 Call #R$EB10.
  $F8F1,$01 Return.

c $F8F2 Action: Take/ Get
@ $F8F2 label=Action_Get
  $F8F2,$03 Call #R$AF7B.
  $F8F5,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $F8F6,$05 Jump to #R$F956 if there were more than #N$02 direct objects
. referenced in the user input (so the command is malformed).
  $F8FB,$03 #REGhl=#R$F90A.
  $F8FE,$03 #REGde=#R$F930.
  $F901,$03 #REGbc=#N($0013,$04,$04).
  $F904,$03 Call #R$B0DE.
N $F907 No phrase tokens matched the user input tokens.
N $F907 Print "#STR$A9EC,$08($b==$FF)".
  $F907,$03 Jump to #R$EDED.
N $F90A The token table for the action "get":
@ $F90A label=Table_ActionGet_TokenGroup
W $F90A,$02 Token group #N($01+(#PC-$F90A)/$02).
L $F90A,$02,$13,$02
N $F930 The actions table for "get":
@ $F930 label=Table_ActionsGet
W $F930,$02 Action routine #N($01+(#PC-$F930)/$02).
L $F930,$02,$13,$02

c $F956
W $F965,$02
L $F965,$02,$04
W $F96D,$02
L $F96D,$02,$04

c $F975 Action: Drop
@ $F975 label=Action_Drop
  $F975,$03 Call #R$AF7B.
  $F978,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $F979,$05 Jump to #R$EDE7 if there were more than #N$02 direct objects
. referenced in the user input (so the command is malformed).
  $F97E,$03 #REGhl=#R$F90A.
  $F981,$03 #REGde=#R$F98D.
  $F984,$03 #REGbc=#N($0013,$04,$04).
  $F987,$03 Call #R$B0DE.
N $F98A No phrase tokens matched the user input tokens.
N $F98A Print "#STR$A9EC,$08($b==$FF)".
  $F98A,$03 Jump to #R$EDED.
N $F98D The actions table for "drop":
@ $F98D label=Table_ActionsDrop
W $F98D,$02 Action routine #N($01+(#PC-$F98D)/$02).
L $F98D,$02,$13,$02

c $F9B3 Action: Throw
@ $F9B3 label=Action_Throw
  $F9B3,$03 Call #R$AF9F.
  $F9B6,$01 Return if there are not two direct objects in the user input (so 
. the command is malformed).
  $F9B7,$03 #REGhl=#R$A825.
  $F9BA,$03 #REGbc=#N($0009,$04,$04).
  $F9BD,$02 Load token #N$6D #TOKEN$6D into #REGa.
  $F9BF,$02 Search for the matching token.
  $F9C1,$03 Jump to #R$EDE7 if .
  $F9C4,$03 #REGhl=#R$F9D2.
  $F9C7,$03 #REGde=#R$F9DA.
  $F9CA,$03 #REGbc=#N($0004,$04,$04).
  $F9CD,$03 Call #R$B0DE.
N $F9D0 No phrase tokens matched the user input tokens.
  $F9D0,$02 Jump to #R$F9E2.
N $F9D2 The token table for the action "throw":
@ $F9D2 label=Table_ActionThrow_TokenGroup
W $F9D2,$02 Token group #N($01+(#PC-$F9D2)/$02).
L $F9D2,$02,$04,$02
N $F9DA The actions table for "throw":
@ $F9DA label=Table_ActionThrow
W $F9DA,$02 Action routine #N($01+(#PC-$F9DA)/$02).
L $F9DA,$02,$04,$02


c $F9E2
  $F9E2,$03 #REGhl=#R$F9F1.
  $F9E5,$03 #REGde=#R$FA0D.
  $F9E8,$03 #REGbc=#N($000E,$04,$04).
  $F9EB,$03 Call #R$B0DE.
N $F9EE No phrase tokens matched the user input tokens.
N $F9EE Print "#STR$AA84,$08($b==$FF)".
  $F9EE,$03 Jump to #R$EDF9.
N $F9F1 The token table for the action "kill"/"throw":
@ $F9F1 label=Table_ActionKillThrow_TokenGroup
W $F9F1,$02 Token group #N($01+(#PC-$F9F1)/$02).
L $F9F1,$02,$0E,$02
N $FA0D The actions table for "kill"/"throw":
@ $FA0D label=Table_ActionsKillThrow
W $FA0D,$02 Action routine #N($01+(#PC-$FA0D)/$02).
L $FA0D,$02,$0E,$02

c $FA29 Action: Give?
@ $FA29 label=Action_Give
  $FA29,$03 Call #R$AF7B.
  $FA2C,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FA2D,$05 Jump to #R$F975 if there were less than #N$02 direct objects
. referenced in the user input.
N $FA32 Print "#STR$A9D6,$08($b==$FF)".
  $FA32,$05 Jump to #R$EDE7 if there were more than #N$03 direct objects
. referenced in the user input (so the command is malformed).
  $FA37,$03 #REGhl=#R$FA46.
  $FA3A,$03 #REGde=#R$FA58.
  $FA3D,$03 #REGbc=#N($0009,$04,$04).
  $FA40,$03 Call #R$B0DE.
N $FA43 No phrase tokens matched the user input tokens.
  $FA43,$03 Jump to #R$F9E2.
N $FA46 The token table for the action "give":
@ $FA46 label=Table_ActionGive_TokenGroup
W $FA46,$02 Token group #N($01+(#PC-$FA46)/$02).
L $FA46,$02,$09,$02
N $FA58 The actions table for "give":
@ $FA58 label=Table_ActionsGive
W $FA58,$02 Action routine #N($01+(#PC-$FA58)/$02).
L $FA58,$02,$09,$02

c $FA6A Action: Free
@ $FA6A label=Action_Free
  $FA6A,$03 Call #R$AF7B.
  $FA6D,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FA6E,$03 #REGhl=#R$FA7D.
  $FA71,$03 #REGde=#R$FA87.
  $FA74,$03 #REGbc=#N($0005,$04,$04).
  $FA77,$03 Call #R$B0DE.
N $FA7A No phrase tokens matched the user input tokens.
N $FA7A Print "#STR$A9EC,$08($b==$FF)".
  $FA7A,$03 Jump to #R$EDED.
N $FA7D The token table for the action "free":
@ $FA7D label=Table_ActionFree_TokenGroup
W $FA7D,$02 Token group #N($01+(#PC-$FA7D)/$02).
L $FA7D,$02,$05,$02
N $FA87 The actions table for "free":
@ $FA87 label=Table_ActionsFree
W $FA87,$02 Action routine #N($01+(#PC-$FA87)/$02).
L $FA87,$02,$05,$02

c $FA91 Action: Drink
@ $FA91 label=Action_Drink
  $FA91,$03 Call #R$AF7B.
  $FA94,$01 Return if there is no direct object in the user input (so the
. command is malformed).
N $FA95 Print "#STR$A9D6,$08($b==$FF)".
  $FA95,$05 Jump to #R$EDE7 if there were more than #N$02 direct objects
. referenced in the user input (so the command is malformed).
  $FA9A,$03 #REGhl=#R$FAA9.
  $FA9D,$03 #REGde=#R$FAAB.
  $FAA0,$03 #REGbc=#N($0001,$04,$04).
  $FAA3,$03 Call #R$B0DE.
N $FAA6 No phrase tokens matched the user input tokens.
N $FAA6 Print "#STR$A9EC,$08($b==$FF)".
  $FAA6,$03 Jump to #R$EDED.
N $FAA9 The token table for the action "drink":
@ $FAA9 label=Table_ActionDrink_TokenGroup
W $FAA9,$02 Token group #N($01+(#PC-$FAA9)/$02).
N $FAAB The actions table for "drink":
@ $FAAB label=Table_ActionsDrink
W $FAAB,$02 Action routine #N($01+(#PC-$FAAB)/$02).

c $FAAD Action: Jump
@ $FAAD label=Action_Jump
  $FAAD,$03 Call #R$AFB7.
  $FAB0,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FAB1,$05 Jump to #R$EDE7 if there were more than #N$03 direct objects
. referenced in the user input (so the command is malformed).
  $FAB6,$03 #REGhl=#R$FAC5.
  $FAB9,$03 #REGde=#R$FAD1.
  $FABC,$03 #REGbc=#N($0006,$04,$04).
  $FABF,$03 Call #R$B0DE.
N $FAC2 No phrase tokens matched the user input tokens.
N $FAC2 Print "#STR$A9EC,$08($b==$FF)".
  $FAC2,$03 Jump to #R$EDED.
N $FAC5 The token table for the action "jump":
@ $FAC5 label=Table_ActionJump_TokenGroup
W $FAC5,$02 Token group #N($01+(#PC-$FAC5)/$02).
L $FAC5,$02,$06,$02
N $FAD1 The actions table for "jump":
@ $FAD1 label=Table_ActionsJump
W $FAD1,$02 Action routine #N($01+(#PC-$FAD1)/$02).
L $FAD1,$02,$06,$02

c $FADD Action: Climb
@ $FADD label=Action_Climb
  $FADD,$03 Call #R$AFB7.
  $FAE0,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FAE1,$05 Jump to #R$EDE7 if there was more than #N$03 direct objects
. referenced in the user input (so the command is malformed).
  $FAE6,$03 #REGhl=#R$FAF5.
  $FAE9,$03 #REGde=#R$FB0B.
  $FAEC,$03 #REGbc=#N($000B,$04,$04).
  $FAEF,$03 Call #R$B0DE.
N $FAF2 No phrase tokens matched the user input tokens.
N $FAF2 Print "#STR$A9EC,$08($b==$FF)".
  $FAF2,$03 Jump to #R$EDED.
N $FAF5 The token table for the action "climb":
@ $FAF5 label=Table_ActionClimb_TokenGroup
W $FAF5,$02 Token group #N($01+(#PC-$FAF5)/$02).
L $FAF5,$02,$0B,$02
N $FB0B The actions table for "climb":
@ $FB0B label=Table_ActionsClimb
W $FB0B,$02 Action routine #N($01+(#PC-$FB0B)/$02).
L $FB0B,$02,$0B,$02

c $FB21 Action: Enter
@ $FB21 label=Action_Enter
  $FB21,$03 Call #R$AF7B.
  $FB24,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FB25,$05 Jump to #R$EDE7 if there were more than #N$02 direct objects
. referenced in the user input (so the command is malformed).
  $FB2A,$03 #REGhl=#R$FB39.
  $FB2D,$03 #REGde=#R$FB4B.
  $FB30,$03 #REGbc=#N($0009,$04,$04).
  $FB33,$03 Call #R$B0DE.
N $FB36 No phrase tokens matched the user input tokens.
N $FB36 Print "#STR$A9EC,$08($b==$FF)".
  $FB36,$03 Jump to #R$EDED.
N $FB39 The token table for the action "enter":
@ $FB39 label=Table_ActionEnter_TokenGroup
W $FB39,$02 Token group #N($01+(#PC-$FB39)/$02).
L $FB39,$02,$09,$02
N $FB4B The actions table for "enter":
@ $FB4B label=Table_ActionsEnter
W $FB4B,$02 Action routine #N($01+(#PC-$FB4B)/$02).
L $FB4B,$02,$09,$02

c $FB5D Action: Wear
@ $FB5D label=Action_Wear
  $FB5D,$03 Call #R$AF7B.
  $FB60,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FB61,$05 Jump to #R$EDE7 if there were more than #N$02 direct objects
. referenced in the user input (so the command is malformed).
  $FB66,$03 #REGhl=#R$FB75.
  $FB69,$03 #REGde=#R$FB7F.
  $FB6C,$03 #REGbc=#N($0005,$04,$04).
  $FB6F,$03 Call #R$B0DE.
N $FB72 No phrase tokens matched the user input tokens.
N $FB72 Print "#STR$CDD3,$08($b==$FF)".
  $FB72,$03 Jump to #R$EE05.
N $FB75 The token table for the action "wear":
@ $FB75 label=Table_ActionWear_TokenGroup
W $FB75,$02 Token group #N($01+(#PC-$FB75)/$02).
L $FB75,$02,$05,$02
N $FB7F The actions table for "wear":
@ $FB7F label=Table_ActionsWear
W $FB7F,$02 Action routine #N($01+(#PC-$FB7F)/$02).
L $FB7F,$02,$05,$02

c $FB89 Action: Go
@ $FB89 label=Action_Go
  $FB89,$03 Call #R$AFB7.
  $FB8C,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FB8D,$05 Jump to #R$EDE7 if there was more than #N$01 direct object
. referenced in the user input (so the command is malformed).
  $FB92,$03 #REGhl=#R$FBA1.
  $FB95,$03 #REGde=#R$FBAD.
  $FB98,$03 #REGbc=#N($0006,$04,$04).
  $FB9B,$03 Call #R$B0DE.
N $FB9E No phrase tokens matched the user input tokens.
N $FB9E Print "#STR$A9EC,$08($b==$FF)".
  $FB9E,$03 Jump to #R$EDED.
N $FBA1 The token table for the action "go":
@ $FBA1 label=Table_ActionGo_TokenGroup
W $FBA1,$02 Token group #N($01+(#PC-$FBA1)/$02).
L $FBA1,$02,$06,$02
N $FBAD The actions table for "go":
@ $FBAD label=Table_ActionsGo
W $FBAD,$02 Action routine #N($01+(#PC-$FBAD)/$02).
L $FBAD,$02,$06,$02

c $FBB9 Action: Swearing
@ $FBB9 label=Action_Swearing
  $FBB9,$03 Call #R$AF7B.
  $FBBC,$01 Return if there is no direct object in the user input (so the
. command is malformed).
N $FBBD Print "#STR$DBF4,$08($b==$FF)".
  $FBBD,$03 #REGhl=#R$DBF4.
  $FBC0,$03 Jump to #R$ED6D.

c $FBC3 Action: Eat
@ $FBC3 label=Action_Eat
  $FBC3,$03 Call #R$AF7B.
  $FBC6,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FBC7,$03 #REGhl=#R$FBD6.
  $FBCA,$03 #REGde=#R$FBDA.
  $FBCD,$03 #REGbc=#N($0002,$04,$04).
  $FBD0,$03 Call #R$B0DE.
N $FBD3 No phrase tokens matched the user input tokens.
N $FBD3 Print "#STR$DC09,$08($b==$FF)".
  $FBD3,$03 Jump to #R$EE47.
N $FBD6 The token table for the action "eat":
@ $FBD6 label=Table_ActionEat_TokenGroup
W $FBD6,$02 Token group #N($01+(#PC-$FBD6)/$02).
L $FBD6,$02,$02,$02
N $FBDA The actions table for "eat":
@ $FBDA label=Table_ActionEat
W $FBDA,$02 Action routine #N($01+(#PC-$FBDA)/$02).
L $FBDA,$02,$02,$02

c $FBDE Action: Capture
@ $FBDE label=Action_Capture
  $FBDE,$03 Call #R$AF7B.
  $FBE1,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FBE2,$03 #REGhl=#R$FBF1.
  $FBE5,$03 #REGde=#R$FBF3.
  $FBE8,$03 #REGbc=#N($0001,$04,$04).
  $FBEB,$03 Call #R$B0DE.
N $FBEE No phrase tokens matched the user input tokens.
N $FBEE Print "#STR$A9EC,$08($b==$FF)".
  $FBEE,$03 Jump to #R$EDED.
N $FBF1 The token table for the action "capture":
@ $FBF1 label=Table_ActionCapture_TokenGroup
W $FBF1,$02 Token group #N($01+(#PC-$FBF1)/$02).
N $FBF3 The actions table for "capture":
@ $FBF3 label=Table_ActionCapture
W $FBF3,$02 Action routine #N($01+(#PC-$FBF3)/$02).

c $FBF5 Action: Place/ Lean/ Lay
@ $FBF5 label=Action_Place
  $FBF5,$03 Call #R$AF9F.
  $FBF8,$01 Return if there are not two direct objects in the user input (so
. the command is malformed).
  $FBF9,$03 #REGhl=#R$FC08.
  $FBFC,$03 #REGde=#R$FC0C.
  $FBFF,$03 #REGbc=#N($0002,$04,$04).
  $FC02,$03 Call #R$B0DE.
N $FC05 No phrase tokens matched the user input tokens.
N $FC05 Print "#STR$A9EC,$08($b==$FF)".
  $FC05,$03 Jump to #R$EDED.
N $FC08 The token table for the action "place":
@ $FC08 label=Table_ActionPlace_TokenGroup
W $FC08,$02 Token group #N($01+(#PC-$FC08)/$02).
L $FC08,$02,$02,$02
N $FC0C The actions table for "place":
@ $FC0C label=Table_ActionPlace
W $FC0C,$02 Action routine #N($01+(#PC-$FC0C)/$02).
L $FC0C,$02,$02,$02

c $FC10 Action: Buy/ Purchase
@ $FC10 label=Action_Buy
  $FC10,$03 Call #R$AF7B.
  $FC13,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FC14,$03 #REGhl=#R$FC23.
  $FC17,$03 #REGde=#R$FC29.
  $FC1A,$03 #REGbc=#N($0004,$04,$04).
  $FC1D,$03 Call #R$B0DE.
N $FC20 No phrase tokens matched the user input tokens.
N $FC20 Print "#STR$A9EC,$08($b==$FF)".
  $FC20,$03 Jump to #R$EDED.
N $FC23 The token table for the action "buy"/"purchase":
@ $FC23 label=Table_ActionBuy_TokenGroup
W $FC23,$02 Token group #N($01+(#PC-$FC23)/$02).
L $FC23,$02,$03,$02
N $FC29 The actions table for "buy"/"purchase":
@ $FC29 label=Table_ActionBuy
W $FC29,$02 Action routine #N($01+(#PC-$FC29)/$02).
L $FC29,$02,$03,$02

c $FC2F Action: Step
@ $FC2F label=Action_Step
  $FC2F,$03 Call #R$AF7B.
  $FC32,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FC33,$05 Jump to #R$EDE7 if there were more than #N$02 direct objects
. referenced in the user input (so the command is malformed).
  $FC38,$03 #REGhl=#R$FC47.
  $FC3B,$03 #REGde=#R$FC49.
  $FC3E,$03 #REGbc=#N($0001,$04,$04).
  $FC41,$03 Call #R$B0DE.
N $FC44 No phrase tokens matched the user input tokens.
N $FC44 Print "#STR$A9EC,$08($b==$FF)".
  $FC44,$03 Jump to #R$EDED.
N $FC47 The token table for the action "step":
@ $FC47 label=Table_ActionStep_TokenGroup
W $FC47,$02 Token group #N($01+(#PC-$FC47)/$02).
N $FC49 The actions table for "step":
@ $FC49 label=Table_ActionStep
W $FC49,$02 Action routine #N($01+(#PC-$FC49)/$02).

c $FC4B Action: Kill/ Attack/ Hit/ Strike
@ $FC4B label=Action_Kill
  $FC4B,$03 Call #R$AF7B.
  $FC4E,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FC4F,$03 #REGhl=#R$FC5E.
  $FC52,$03 #REGde=#R$FC74.
  $FC55,$03 #REGbc=#N($000B,$04,$04).
  $FC58,$03 Call #R$B0DE.
N $FC5B No phrase tokens matched the user input tokens.
N $FC5B Print "#STR$A9EC,$08($b==$FF)".
  $FC5B,$03 Jump to #R$EDED.
N $FC5E The token table for the action "kill":
@ $FC5E label=Table_ActionKill_TokenGroup
W $FC5E,$02 Token group #N($01+(#PC-$FC5E)/$02).
L $FC5E,$02,$0B,$02
N $FC74 The actions table for "kill":
@ $FC74 label=Table_ActionKill
W $FC74,$02 Action routine #N($01+(#PC-$FC74)/$02).
L $FC74,$02,$0B,$02

u $FC8A
B $FC8A,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $FC8A,$01,$03

c $FC8D Action: Swim
@ $FC8D label=Action_Swim
  $FC8D,$03 Call #R$AFB7.
  $FC90,$01 Return if there is no direct object in the user input (so the
. command is malformed).
  $FC91,$05 Jump to #R$EDE7 if there was more than #N$01 direct object
. referenced in the user input (so the command is malformed).
  $FC96,$03 #REGa=*#R$A7C3.
  $FC99,$03 #REGhl=#R$FCCB.
  $FC9C,$03 #REGbc=#N($0003,$04,$04).
  $FC9F,$02 Search for the current room in the table.
  $FCA1,$03 Jump to #R$EE4D if none of the rooms in the table match the current
. room ID.
N $FCA4 The player is in one of the rooms, so process the action.
  $FCA4,$03 #REGhl=#R$FCB3.
  $FCA7,$03 #REGde=#R$FCBF.
  $FCAA,$03 #REGbc=#N($0006,$04,$04).
  $FCAD,$03 Call #R$B0DE.
N $FCB0 No phrase tokens matched the user input tokens.
N $FCB0 Print "#STR$A9EC,$08($b==$FF)".
  $FCB0,$03 Jump to #R$EDED.
N $FCB3 The token table for the action "swim":
@ $FCB3 label=Table_ActionSwim_TokenGroup
W $FCB3,$02 Token group #N($01+(#PC-$FCB3)/$02).
L $FCB3,$02,$06,$02
N $FCBF The actions table for "swim":
@ $FCBF label=Table_ActionSwim
W $FCBF,$02 Action routine #N($01+(#PC-$FCBF)/$02).
L $FCBF,$02,$06,$02
N $FCCB Table containing rooms where this action can be done.
@ $FCCB label=Table_ActionSwim_Rooms
B $FCCB,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $FCCB,$01,$03,$02

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
  $FCEF,$05 Enable the exit "north to room #R$E8F4(#N$50) for #ROOM$50".
  $FCF4,$03 Enable the exit "east to room #R$E8F6(#N$50) for #ROOM$50".
  $FCF7,$03 Enable the exit "west to room #R$E8F7(#N$50) for #ROOM$50".
  $FCFA,$05 Call #R$EB10 to room #N$02: #ROOM$02.
  $FCFF,$03 Jump to #R$E99F.

g $FD02 Default Game State
@ $FD02 label=DefaultGameState
B $FD02,$0186

g $FE89 Jump Table: Verbs
@ $FE89 label=JumpTable_Verbs
D $FE89 Used by the routine at #R$B05E.
W $FE89,$02 Verb word token #N((#PC-$FE89)/$02): #TOKEN((#PC-$FE89)/$02).
L $FE89,$02,$21

g $FECB
W $FECB,$02
L $FECB,$02,$02

g $FECF Jump Table: Scenic Events
@ $FECF label=JumpTable_ScenicEvents
W $FECF,$02 Event #N((#PC-$FECF)/$02).
L $FECF,$02,$11

g $FEF1 Table: Rooms With Images
@ $FEF1 label=Table_RoomsWithImages
D $FEF1 See #R$FEFC.
B $FEF1,$01 Location Slot: #N(#PC-$FEF1) - room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $FEF1,$01,$0B

g $FEFC Jump Table: Room Images
@ $FEFC label=JumpTable_RoomImages
D $FEFC See #R$FEF1.
W $FEFC,$02 Location Slot: #N((#PC-$FEFC)/$02).
L $FEFC,$02,$0B

c $FF12 Handler: Room Images
@ $FF12 label=DisplayImage_WoodedVale
N $FF12 Displays the image for The Wooded Vale.
N $FF12 #PUSHS #UDGTABLE #POKES$A7C3,$02
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-wooded-vale) }
. UDGTABLE# #POPS
  $FF12,$04 #REGix=#R$61A8.
  $FF16,$02 Jump to #R$FF4C.
@ $FF18 label=DisplayImage_EvaporationPits
N $FF18 Displays the image for The Evaporation Pits.
N $FF18 #PUSHS #UDGTABLE #POKES$A7C3,$07
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-evaporation-pits) }
. UDGTABLE# #POPS
  $FF18,$04 #REGix=#R$6A34.
  $FF1C,$02 Jump to #R$FF4C.
@ $FF1E label=DisplayImage_NemedShrine
N $FF1E Displays the image for The Shrine Of The Nemed.
N $FF1E #PUSHS #UDGTABLE #POKES$A7C3,$10
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-shrine-nemed) }
. UDGTABLE# #POPS
  $FF1E,$04 #REGix=#R$704F.
  $FF22,$02 Jump to #R$FF4C.
@ $FF24 label=DisplayImage_BurialPit
N $FF24 Displays the image for The Burial Pit.
N $FF24 #PUSHS #UDGTABLE #POKES$A7C3,$17
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-burial-pit) }
. UDGTABLE# #POPS
  $FF24,$04 #REGix=#R$75DD.
  $FF28,$02 Jump to #R$FF4C.
@ $FF2A label=DisplayImage_MainCourtyard
N $FF2A Displays the image for The Main Courtyard.
N $FF2A #PUSHS #UDGTABLE #POKES$A7C3,$49
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-courtyard) }
. UDGTABLE# #POPS
  $FF2A,$04 #REGix=#R$7C8D.
  $FF2E,$02 Jump to #R$FF4C.
@ $FF30 label=DisplayImage_DesertedBroch
N $FF30 Displays the image for The Deserted Broch.
N $FF30 #PUSHS #UDGTABLE #POKES$A7C3,$38
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-deserted-broch) }
. UDGTABLE# #POPS
  $FF30,$04 #REGix=#R$8492.
  $FF34,$02 Jump to #R$FF4C.
@ $FF36 label=DisplayImage_CrystalCavern
N $FF36 Displays the image for The Crystal Cavern.
N $FF36 #PUSHS #UDGTABLE #POKES$A7C3,$43
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-crystal-cavern) }
. UDGTABLE# #POPS
  $FF36,$04 #REGix=#R$8AF3.
  $FF3A,$02 Jump to #R$FF4C.
@ $FF3C label=DisplayImage_StoneCircle
N $FF3C Displays the image for The Circle of Stones.
N $FF3C #PUSHS #UDGTABLE #POKES$A7C3,$40
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-stone-circle) }
. UDGTABLE# #POPS
  $FF3C,$04 #REGix=#R$915F.
  $FF40,$02 Jump to #R$FF4C.
@ $FF42 label=DisplayImage_FomoriansCavern
N $FF42 Displays the image for The Fomorians' Cavern.
N $FF42 #PUSHS #UDGTABLE #POKES$A7C3,$4F
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-fomorians-cavern) }
. UDGTABLE# #POPS
  $FF42,$04 #REGix=#R$983F.
  $FF46,$02 Jump to #R$FF4C.
@ $FF48 label=DisplayImage_Lake
N $FF48 Displays the image for the lake.
N $FF48 #PUSHS #UDGTABLE #POKES$A7C3,$2A
. { #SIM(start=#PC,stop=$FF54)#SCR$01(game-lake) }
. UDGTABLE# #POPS
  $FF48,$04 #REGix=#R$A0EB.
N $FF4C All the image routines use this same routine.
@ $FF4C label=Handler_Images
  $FF4C,$03 Call #R$B10B.
  $FF4F,$05 Call #R$ACAD and use line number #N$08 to start printing.
  $FF54,$03 Call #R$A53E.
  $FF57,$01 Return.

i $FF58
