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
  $A645,$01 Return.

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

g $A7C3

g $A7C8 Pointer: Turn-Based Events Jump Table
@ $A7C8 label=Pointer_TurnBasedEvents_Jump
D $A7C8 Pointer to the jump table containing turn-based events.
W $A7C8,$02

g $A7CA

g $A7CC Pointer: Item Description Table
@ $A7CC label=Pointer_ItemDescriptions
D $A7CC Pointer to the table containing item descriptions.
W $A7CC,$02

g $A7CE

g $A7D0

g $A7D2

g $A7DC Pointer: Configurable Exits Table
@ $A7DC label=Pointer_ConfigurableExits
W $A7DC,$02

g $A7DE

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

g $A7EC

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

t $A843

t $A884

t $A791

t $A893

t $A897

t $A8AA

t $A915

t $A92A

t $A950

t $A986

t $A9BD

t $A9D6

t $A9EC

t $A9F7

t $AA15

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

c $AB03 Response: "O.K."
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

c $B0A9

c $B0DE

c $B10B

c $B14A Game Start Alias
@ $B14A label=GameStart_Alias
  $B14A,$03 Jump to #R$FCCE.

t $B14D


g $C732 Table: Item Descriptions
@ $C732 label=Table_ItemDescriptions
W $C732,$02 Item #N((#PC-$C732)/$02): #ITEM((#PC-$C732)/$02).
L $C732,$02,$86

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


b $E978

c $E98E

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

g $FECB Jump Table: Turn-Based Events
@ $FECB label=JumpTable_TurnBasedEvents
W $FECB,$02 Event #N((#PC-$FECB)/$02).
L $FECB,$02,$08

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
