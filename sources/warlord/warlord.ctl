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

t $A663

g $A66C Table: Item Locations
@ $A66C label=Table_ItemLocations
D $A66C A table where the index is the item ID, and the value is the room it
. resides in (#N$00 for "currently inactive").
D $A66C When the item is in the players inventory, the room ID changes to
. #N$01.
B $A66C,$01 Item #N(#PC-$A66C) #ITEM(#PC-$A66C) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $A66C,$01,$86

g $A774

g $A77F

g $A77E Flags: Turn-Based Event States
@ $A77E label=Flag_TurnBasedEventState
D $A77E Holds a single byte, where each bit relates to a turn-based event as
. follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 |  }
. { #N$01 |  }
. { #N$02 |  }
. { #N$03 |  }
. { #N$04 |  }
. { #N$05 |  }
. { #N$06 |  }
. { #N$07 |  }
. TABLE#
. When the bit is set, this starts a turn counter (see ...).
B $A77E,$01

g $A791

g $A7C3

g $A7C4 Score
@ $A7C4 label=Score
W $A7C4,$02

g $A7C6
W $A7C6,$02

g $A7C8 Pointer: Turn-Based Events Jump Table
@ $A7C8 label=Pointer_TurnBasedEvents_Jump
D $A7C8 Pointer to the jump table containing turn-based events.
W $A7C8,$02

g $A7CA
W $A7CA,$02

g $A7CC Pointer: Item Description Table
@ $A7CC label=Pointer_ItemDescriptions
D $A7CC Pointer to the table containing item descriptions.
W $A7CC,$02

g $A7CE
W $A7CE,$02

g $A7D0
W $A7D0,$02

g $A7D2
W $A7D2,$02

g $A7D4
W $A7D4,$02

g $A7D6
W $A7D6,$02

g $A7D8
W $A7D8,$02

g $A7DA
W $A7DA,$02

g $A7DC Pointer: Configurable Exits Table
@ $A7DC label=Pointer_ConfigurableExits
W $A7DC,$02

g $A7DE
W $A7DE,$02

g $A7E0
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

g $A7E8
W $A7E8,$02

g $A7EA
W $A7EA,$02

g $A7EC
W $A7EC,$02

g $A7EE Number Of Scenic Events
@ $A7EE label=Count_ScenicEvents
E $A7EE The total number of scenic events in the game, see #R$E4E6.
W $A7EE,$02

g $A7F0 Number Of "Configurable Exits"
@ $A7F0 label=Count_ConfigurableExits
W $A7F0,$02

g $A7F2

g $A82E Line Number
@ $A82E label=LineNumber
E $A82E View the equivalent code in #JEWELS$BD70.
B $A82E,$01

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

t $A8BD Messaging: "North"
@ $A8BD label=Messaging_North
  $A8BD,$05 "#STR$A8BD,$08($b==$FF)".
B $A8C2,$01 Terminator.

t $A8C3 Messaging: "South"
@ $A8C3 label=Messaging_South
  $A8C3,$05 "#STR$A8C3,$08($b==$FF)".
B $A8C8,$01 Terminator.

t $A8C9 Messaging: "East"
@ $A8C9 label=Messaging_East
  $A8C9,$04 "#STR$A8C9,$08($b==$FF)".
B $A8CD,$01 Terminator.

t $A8CE Messaging: "West"
@ $A8CE label=Messaging_West_Duplicate
  $A8CE,$04 "#STR$A8CE,$08($b==$FF)".
B $A8D2,$01 Terminator.

t $A8D3 Messaging: "Up"
@ $A8D3 label=Messaging_Up
  $A8D3,$02 "#STR$A8D3,$08($b==$FF)".
B $A8D5,$01 Terminator.

t $A8D6 Messaging: "Down"
@ $A8D6 label=Messaging_Down
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

t $AAE2

c $AAEE Response: "Please Rephrase That"
@ $AAEE label=Response_PleaseRephraseThat
N $AAEE Print "#STR$A9D6,$08($b==$FF)".
  $AAEE,$03 #REGhl=#R$A9D6.
  $AAF1,$03 Call #R$A592.
  $AAF4,$01 Return.

c $AAF5 Response: "Please Be More Specific"
@ $AAF5 label=Response_PleaseBeMoreSpecific
N $AAF5 Print "#STR$A9BD,$08($b==$FF)".
  $AAF5,$03 #REGhl=#R$A9BD.
  $AAF8,$03 Call #R$A592.
  $AAFB,$01 Return.

c $AAFC Response: "You Can't"
@ $AAFC label=Response_YouCant
N $AAFC Print "#STR$A9EC,$08($b==$FF)".
  $AAFC,$03 #REGhl=#R$A9EC.
  $AAFF,$03 Call #R$A592.
  $AB02,$01 Return.

c $AB03 Response: "O.K"
@ $AB03 label=Response_OK
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
R $ABB6 E #N$01 If the image should be displayed, #N$00 if it should be skipped
D $ABB6 Determines if the current room has an image relating to it, and if it
. does - it jumps to the routine to display it.
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
R $ACAD A Line number to begin printing
  $ACAD,$03 Write #REGa to *#R$A82E.
  $ACB0,$03 Call #R$A56A.
  $ACB3,$03 #REGa=*#R$A7C3.
  $ACB6,$04 #REGix=*#R$A7D2.
  $ACBA,$01 Copy the room number into #REGe.
  $ACBB,$03 Call #R$AB88.
  $ACBE,$03 Call #R$A592.
  $ACC1,$01 Return.

c $ACC2

c $AE36 Action: Examine Item

c $AE6B Validate If Item Is Present

c $AE80 Match Phrase Tokens

c $AEAF Parser: Count Item References

c $AED1 Object/ Event Locator

c $AEDA Is Object In Inventory?

c $AEE0 Handler: Destroy Item/ Event

c $AEE7 Handler: Update Item/ Event For The Current Room

c $AEF0 Set Scenic Event As Triggered

c $AEF7 Check Active Scenic Events
  $AEF7,$02 Jump to #R$AEFA.
  $AEF9,$01 Increment #REGhl by one.
  $AEFA,$01 #REGa=*#REGhl.
  $AEFB,$02 Compare #REGa with #N$FF.
  $AEFD,$02 Jump to #R$AF06 if #REGa is equal to #N$FF.
  $AEFF,$03 Call #R$AE6B.
  $AF02,$02 Jump to #R$AEF9 if #REGa is not equal to #N$FF.
  $AF04,$01 #REGa=*#REGhl.
  $AF05,$01 Return.
  $AF06,$01 Set flags.
  $AF07,$01 Return.
  $AF08,$03 #REGhl=#R$A66C.
  $AF0B,$02 #REGd=#N$00.
  $AF0D,$01 #REGe=#REGb.
  $AF0E,$01 #REGhl+=#REGde.
  $AF0F,$01 Write #REGc to *#REGhl.
  $AF10,$01 Return.
  $AF11,$02 #REGb=#N$00.
  $AF13,$02 Jump to #R$AF17.
  $AF15,$01 Increment #REGb by one.
  $AF16,$01 Increment #REGhl by one.
  $AF17,$03 Call #R$AEF7.
  $AF1A,$02 Jump to #R$AF15 if #REGhl is equal to #REGa.
  $AF1C,$01 #REGa=#REGb.
  $AF1D,$01 Return.
  $AF1E,$01 #REGa=#REGb.
  $AF1F,$03 Call #R$AED1.
  $AF22,$02 Stash #REGbc and #REGaf on the stack.
  $AF24,$02 #REGc=#N$00.
  $AF26,$03 Call #R$AF08.
  $AF29,$02 Restore #REGaf and #REGbc from the stack.
  $AF2B,$01 #REGb=#REGc.
  $AF2C,$01 #REGc=#REGa.
  $AF2D,$03 Call #R$AF08.
  $AF30,$01 Return.
  $AF31,$03 Call #R$AED1.
  $AF34,$04 Compare #REGa with *#R$A7C3.
  $AF38,$01 Return.
  $AF39,$03 #REGhl=#R$A66C.
  $AF3C,$04 #REGbc=*#R$A7E6.
  $AF40,$02 CPIR.
  $AF42,$01 Return if #REGa is not equal to *#REGhl.
  $AF43,$01 Stash #REGhl on the stack.
  $AF44,$03 Call #R$AF56.
  $AF47,$01 Restore #REGhl from the stack.
  $AF48,$02 Jump to #R$AF54 if #REGa is not equal to *#REGhl.
  $AF4A,$01 #REGe=#REGa.
  $AF4B,$01 #REGa=#REGb.
  $AF4C,$01 Set the bits from #REGc.
  $AF4D,$01 #REGa=#REGe.
  $AF4E,$02 Jump to #R$AF40 if #REGa is not equal to #REGc.
  $AF50,$02 #REGa=#N$01.
  $AF52,$01 Set flags.
  $AF53,$01 Return.
  $AF54,$01 #REGa=#N$00.
  $AF55,$01 Return.

c $AF56

c $AF08

c $AF1E Transform Item

c $AF31

c $AF39 Check Room Objects

c $AF56 Validate Object
@ $AF56 label=ValidateObject
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

c $AF7B Parser: Validate Direct Object

c $AF90

c $AF9F

c $AFB7

c $AFC7 Parser: Process Item

c $AFEB

c $B05E

c $B081 Pause, Print String And Scroll

c $B08A Generate Random Number

c $B09A

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

c $B0DE

c $B10B Print Room Image
@ $B10B label=Print_RoomImage
R $B10B IX Pointer to room image data

c $B14A Game Start Alias
@ $B14A label=GameStart_Alias
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

t $BB9D Messaging: "A Dhield"
@ $BB9D label=Messaging_Dhield
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
@ $C101 label=Messaging_Swamp"
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

t $E0B1

g $E4E6 Table: Scenic Event Locations
@ $E4E6 label=Table_ScenicEventLocations
D $E4E6 A table where the index is the event ID, and the value is the room it
. resides in (#N$00 for "currently inactive"). See #R$A7EE for the count.
B $E4E6,$01 Event #N(#PC-$E4E6) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $E4E6,$01,$11

g $E508 Table: Scenic Event Locations 2
@ $E508 label=Table_ScenicEventLocations2
D $E508 A table where the index is the event ID, and the value is the room it
. resides in (#N$00 for "currently inactive"). See #R$A7EE for the count.
B $E508,$01 Event #N(#PC-$E508) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $E508,$01,$11

g $E978 Table: Configurable Exits
@ $E978 label=Table_ConfigurableExits
W $E978,$02
L $E978,$02,$0B

c $E98E

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

c $E9E9
  $E9E9,$03 #REGhl=#R$A77E.
  $E9EC,$02 Reset bit 1 of *#REGhl.
  $E9EE,$02 #REGa=#N$0F.
  $E9F0,$03 Call #R$AE6B.
  $E9F3,$01 Return if #REGa is not equal to #N$0F.
  $E9F4,$03 #REGhl=#R$CD9A.
  $E9F7,$03 Jump to #R$E9D0.

c $E9FA
  $E9FA,$03 #REGhl=#R$C97C.
  $E9FD,$03 Call #R$A592.
  $EA00,$02 #REGa=#N$00.
  $EA02,$03 Call #R$AEF0.
  $EA05,$02 #REGa=#N$01.
  $EA07,$03 Call #R$AEF0.
  $EA0A,$01 Return.

c $EA0B
  $EA0B,$02 #REGa=#N$03.
  $EA0D,$03 Call #R$AEE0.
  $EA10,$02 #REGa=#N$02.
  $EA12,$03 Call #R$AEE7.
  $EA15,$03 #REGhl=#R$C9AF.
  $EA18,$03 Call #R$A592.
  $EA1B,$02 #REGb=#N$14.
  $EA1D,$02 #REGa=#N$22.
  $EA1F,$03 Call #R$AED1.
  $EA22,$01 Set flags.
  $EA23,$02 Jump to #R$EA2D if #REGa is equal to #REGa.
  $EA25,$03 #REGhl=#R$CA1A.
  $EA28,$03 Call #R$B081.
  $EA2B,$02 #REGb=#N$0A.
  $EA2D,$01 #REGa=#REGb.
  $EA2E,$03 Call #R$B08A.
  $EA31,$02 Jump to #R$EA38 if #REGa is equal to #REGa.
  $EA33,$03 #REGhl=#R$C9E1.
  $EA36,$02 Jump to #R$EA40.
  $EA38,$01 Restore #REGhl from the stack.
  $EA39,$03 #REGhl=#R$E9B2.
  $EA3C,$01 Exchange the *#REGsp with the #REGhl register.
  $EA3D,$03 #REGhl=#R$CA46.
  $EA40,$03 Call #R$B081.
  $EA43,$01 Return.

c $EA44
  $EA44,$03 #REGhl=#R$CA79.
  $EA47,$03 Call #R$A592.
  $EA4A,$02 #REGa=#N$14.
  $EA4C,$03 Call #R$B08A.
  $EA4F,$03 #REGhl=#R$CA94.
  $EA52,$02 Jump to #R$EA5C if ?? is not equal to #N$14.
  $EA54,$01 Restore #REGhl from the stack.
  $EA55,$03 #REGhl=#R$E9B2.
  $EA58,$01 Exchange the *#REGsp with the #REGhl register.
  $EA59,$03 #REGhl=#R$CA46.
  $EA5C,$03 Call #R$B081.
  $EA5F,$01 Return.
  $EA60,$03 #REGhl=#R$CACD.
  $EA63,$03 Call #R$A592.
  $EA66,$02 #REGa=#N$06.
  $EA68,$03 Call #R$AEE0.
  $EA6B,$01 Return.
  $EA6C,$02 #REGa=#N$07.
  $EA6E,$03 Call #R$AEF0.
  $EA71,$01 Return.
  $EA72,$03 #REGhl=#R$CB19.
  $EA75,$03 Call #R$A592.
  $EA78,$03 #REGhl=#R$CB45.
  $EA7B,$03 Call #R$B081.
  $EA7E,$02 #REGa=#N$08.
  $EA80,$03 Call #R$AEE0.
  $EA83,$01 Return.
  $EA84,$03 #REGhl=#R$CB73.
  $EA87,$03 Call #R$A592.
  $EA8A,$02 #REGa=#N$09.
  $EA8C,$03 Call #R$AEE0.
  $EA8F,$01 Return.
  $EA90,$03 #REGhl=#R$CB9C.
  $EA93,$03 Call #R$A592.
  $EA96,$02 #REGa=#N$2D.
  $EA98,$03 Call #R$AEE0.
  $EA9B,$01 Return.
  $EA9C,$03 #REGhl=#R$CBCC.
  $EA9F,$03 Call #R$A592.
  $EAA2,$02 #REGa=#N$3E.
  $EAA4,$03 Call #R$AEE0.
  $EAA7,$02 #REGa=#N$3F.
  $EAA9,$03 Call #R$AEF0.
  $EAAC,$02 #REGb=#N$3D.
  $EAAE,$02 #REGc=#N$2C.
  $EAB0,$03 Call #R$AF08.
  $EAB3,$01 Return.
  $EAB4,$03 #REGhl=#R$CC26.
  $EAB7,$03 Call #R$A592.
  $EABA,$02 #REGa=#N$3F.
  $EABC,$03 Call #R$AEE0.
  $EABF,$02 #REGa=#N$40.
  $EAC1,$03 Call #R$AEF0.
  $EAC4,$02 #REGb=#N$3D.
  $EAC6,$02 #REGc=#N$2D.
  $EAC8,$03 Call #R$AF08.
  $EACB,$01 Return.
  $EACC,$03 #REGhl=#R$CC3C.
  $EACF,$03 Call #R$A592.
  $EAD2,$02 #REGa=#N$40.
  $EAD4,$03 Call #R$AEE0.
  $EAD7,$02 #REGa=#N$41.
  $EAD9,$03 Call #R$AEF0.
  $EADC,$02 #REGb=#N$3D.
  $EADE,$02 #REGc=#N$25.
  $EAE0,$03 Call #R$AF08.
  $EAE3,$01 Return.
  $EAE4,$03 #REGhl=#R$CC26.
  $EAE7,$03 Call #R$A592.
  $EAEA,$02 #REGa=#N$41.
  $EAEC,$03 Call #R$AEE0.
  $EAEF,$02 #REGb=#N$3D.
  $EAF1,$02 #REGc=#N$27.
  $EAF3,$03 Call #R$AF08.
  $EAF6,$01 Return.
  $EAF7,$03 #REGhl=#R$CC53.
  $EAFA,$03 Call #R$A592.
  $EAFD,$03 #REGhl=#R$CCCA.
  $EB00,$03 Call #R$B081.
  $EB03,$02 #REGa=#N$4A.
  $EB05,$03 Call #R$AEE0.
  $EB08,$01 Return.
  $EB09,$03 #REGhl=#R$CD00.
  $EB0C,$03 Call #R$A592.
  $EB0F,$01 Return.

c $EB10
B $EB3A,$0B
W $EB45,$02
L $EB45,$02,$0B
B $EB5B,$16
W $EB71,$02
L $EB71,$02,$16

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

g $FECB Jump Table: Turn-Based Events
@ $FECB label=JumpTable_TurnBasedEvents
W $FECB,$02 Event #N((#PC-$FECB)/$02).
L $FECB,$02,$08

c $FF12 Handler: Room Images
@ $FF12 label=DisplayImage_Mountains
N $FF12 Displays the image for the mountains.
  $FF12,$04 #REGix=#R$61A8.
  $FF16,$02 Jump to #R$FF4C.
@ $FF18 label=DisplayImage_Beach
N $FF18 Displays the image for the beach.
  $FF18,$04 #REGix=#R$6A34.
  $FF1C,$02 Jump to #R$FF4C.
@ $FF1E label=DisplayImage_Altar
N $FF1E Displays the image for the altar.
  $FF1E,$04 #REGix=#R$704F.
  $FF22,$02 Jump to #R$FF4C.
@ $FF24 label=DisplayImage_Cart
N $FF24 Displays the image for the cart.
  $FF24,$04 #REGix=#R$75DD.
  $FF28,$02 Jump to #R$FF4C.
@ $FF2A label=DisplayImage_Huts
N $FF2A Displays the image for the huts.
  $FF2A,$04 #REGix=#R$7C8D.
  $FF2E,$02 Jump to #R$FF4C.
@ $FF30 label=DisplayImage_Village
N $FF30 Displays the image for the village.
  $FF30,$04 #REGix=#R$8492.
  $FF34,$02 Jump to #R$FF4C.
@ $FF36 label=DisplayImage_Cave
N $FF36 Displays the image for the cave.
  $FF36,$04 #REGix=#R$8AF3.
  $FF3A,$02 Jump to #R$FF4C.
@ $FF3C label=DisplayImage_Henge
N $FF3C Displays the image for the henge.
  $FF3C,$04 #REGix=#R$915F.
  $FF40,$02 Jump to #R$FF4C.
@ $FF42 label=DisplayImage_Cavern
N $FF42 Displays the image for the cavern.
  $FF42,$04 #REGix=#R$983F.
  $FF46,$02 Jump to #R$FF4C.
@ $FF48 label=DisplayImage_Lake
N $FF48 Displays the image for the lake.
  $FF48,$04 #REGix=#R$A0EB.
N $FF4C All the image routines use this same routine.
@ $FF4C label=Handler_Images
  $FF4C,$03 Call #R$B10B.
  $FF4F,$05 Call #R$ACAD and use line number #N$08 to start printing.
  $FF54,$03 Call #R$A53E.
  $FF57,$01 Return.

g $FEFC
W $FEFC,$02
L $FEFC,$02,$0B

w $FF58
