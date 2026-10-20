; Copyright Interceptor Software UK 1984, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @start
> $4000 @expand=#DEF1(#SKOOLKID(addr)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/#EVAL({addr},16,4).html">){name}#HTML(</a>))
@ $4000 org=$4000
> $4000 @rom
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @expand=#DEF(#MESSAGE(addr) #STR$addr,$08($b==$FF))
> $4000 @expand=#DEF(#INK(id) #LET(bright=$id&$40)#HTML(&#10;)#LET(flash=$id&$80)#HTML(&#10;)#LET(ink=$id&$07)#IF({ink}>=$00)(#HTML(&#10;)#MAP({ink})(#HTML(&#10;)UNKNOWN,0:BLACK,1:BLUE,2:RED,3:MAGENTA,4:GREEN,5:CYAN,6:YELLOW,7:WHITE))#IF({bright}>$00)( (BRIGHT))#IF({flash}>$00)( (FLASH: ON)))
> $4000 @set-handle-unsupported-macros=1

b $4000 Loading Screen
@ $4000 label=Loading
D $4000 #UDGTABLE
. { =h Heroes of Karn Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B00 Tape Loader
@ $5B00 label=TapeLoader
D $5B00 Load the screen, the room pictures and the game. The last block falls
. straight into the tape loading routine.
N $5B00 Load the first block: the loading screen.
  $5B00,$0C Load #N$1B00 bytes of the loading screen to #N$4000 with flag byte #N$D7.
N $5B0C Load the second block: the room pictures.
  $5B0C,$0C Load #N$4A2C bytes of picture data to #R$61A8 with flag byte #N$0A.
N $5B18 Load the third block: the game. Execution falls into #R$5B21.
  $5B18,$09 Load #N$5235 bytes of the game to #R$ABD4 with flag byte #N$2B.

c $5B21 Tape Loading
@ $5B21 label=TapeLoading
D $5B21 Pull one tape block into the address and length set up by the caller.
N $5B21 Tape loading routine.
  $5B21,$01 Set the carry flag to indicate "loading".
  $5B22,$01 This resets the Z flag (#REGd cannot hold +#N$FF.)
  $5B23,$01 The #REGa register holds +#N$00 for a header and +#N$FF for a block
. of data. The carry flag is reset for verifying and set for loading.
  $5B24,$01 Put back #REGd to its original value.
  $5B25,$01 Disable interrupts while the tape loads, as the start of #SKOOLKID$0556(LD_BYTES) would.
  $5B26,$04 Set the border to #INK$0F.
  $5B2A,$03 Call #SKOOLKID$0556(LD_BYTES) at #N$0562.
  $5B2D,$01 Remember whether the block loaded.
  $5B2E,$03 #REGa=*#SKOOLKID$5C48(BORDCR).
  $5B31,$02,b$01 Keep the border colour (bits 3-5 of *#SKOOLKID$5C48(BORDCR)).
  $5B33,$06 Move the border colour into the low three bits.
  $5B39,$02 Set border to the colour held by #REGa.
  $5B3B,$05 See whether SPACE is pressed.
  $5B40,$01 Re-enable interrupts, as the ROM does when its own load ends.
  $5B41,$03 Jump to #SKOOLKID$0000(START) if the carry flag is not set.
  $5B44,$01 Restore the load result from the stack (the carry flag is set when the block loaded).
  $5B45,$01 Return if the carry flag is set.
  $5B46,$06 Write *#SKOOLKID$5C53(PROG) to *#SKOOLKID$5C4B(VARS).
  $5B4C,$02 Write #N$80 to *#SKOOLKID$5C53(PROG).
  $5B4E,$01 Call #SKOOLKID$0008(ERROR_1).

u $5B4F Unused
D $5B4F The remainder of the printer buffer after the tape loader at #R$5B00.
. The game does not read these bytes.
B $5B4F,$01
S $5B50,$B0

i $5C00
S $5C00,$5A8

b $61A8 Graphics: The Field
@ $61A8 label=Image_TheField
D $61A8 #PUSHS
. #UDGTABLE
. { =h The Field }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-field) }
. UDGTABLE#
. #POPS
  $61A8,$098F

b $6B37 Graphics: The Monastery
@ $6B37 label=Image_TheMonastery
D $6B37 #PUSHS
. #UDGTABLE
. { =h The Monastery }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-monastery) }
. UDGTABLE#
. #POPS
  $6B37,$07DC

b $7313 Graphics: The King's Chamber
@ $7313 label=Image_TheKingsChamber
D $7313 #PUSHS
. #UDGTABLE
. { =h The King's Chamber }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-kings-chamber) }
. UDGTABLE#
. #POPS
  $7313,$06E1

b $79F4 Graphics: The Oil Room
@ $79F4 label=Image_TheOilRoom
D $79F4 #PUSHS
. #UDGTABLE
. { =h The Oil Room }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-oil-room) }
. UDGTABLE#
. #POPS
. The Acid Room shares this picture.
  $79F4,$0850

b $8244 Graphics: The Sea Cavern
@ $8244 label=Image_TheSeaCavern
D $8244 #PUSHS
. #UDGTABLE
. { =h The Sea Cavern }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-sea-cavern) }
. UDGTABLE#
. #POPS
  $8244,$06FD

b $8941 Graphics: The Long Barrow
@ $8941 label=Image_TheLongBarrow
D $8941 #PUSHS
. #UDGTABLE
. { =h The Long Barrow }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-long-barrow) }
. UDGTABLE#
. #POPS
  $8941,$0810

b $9151 Graphics: The Hall Of The Black Knight
@ $9151 label=Image_TheHallOfTheBlackKnight
D $9151 #PUSHS
. #UDGTABLE
. { =h The Hall Of The Black Knight }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-hall-of-the-black-knight) }
. UDGTABLE#
. #POPS
  $9151,$0A45

b $9B96 Graphics: The Treasury
@ $9B96 label=Image_TheTreasury
D $9B96 #PUSHS
. #UDGTABLE
. { =h The Treasury }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-treasury) }
. UDGTABLE#
. #POPS
  $9B96,$07BB

b $A351 Graphics: The Edge Of The Sea
@ $A351 label=Image_TheEdgeOfTheSea
D $A351 #PUSHS
. #UDGTABLE
. { =h The Edge Of The Sea }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-edge-of-the-sea) }
. UDGTABLE#
. #POPS
  $A351,$0883

c $ABD4 Game Entry Point
@ $ABD4 label=GameEntryPoint
D $ABD4 Turn caps lock on, set the screen line, and enter the cold start.
  $ABD4,$03 Point #REGhl at *#SKOOLKID$5C6A(FLAGS2).
  $ABD7,$02 Turn caps lock on.
  $ABD9,$05 Set the screen line to #N$18.
  $ABDE,$03 Continue at #R$B800.

c $ABE1 Get User Input
@ $ABE1 label=GetUserInput
D $ABE1 Wait until the player presses a key, then return that key.
R $ABE1 O:A The keypress value
  $ABE1,$03 #REGa=*#SKOOLKID$5C3B(FLAGS).
  $ABE4,$04 Jump back to #R$ABE1 until a new key is pressed.
  $ABE8,$02 Reset the "new key has been pressed" flag in #REGa.
  $ABEA,$03 Write it back to *#SKOOLKID$5C3B(FLAGS).
N $ABED Fetch the keypress.
  $ABED,$03 #REGa=*#SKOOLKID$5C08(LAST_K).
  $ABF0,$01 Return.

c $ABF1 Clear Screen
@ $ABF1 label=ClearScreen
D $ABF1 Clear the display before a new room or a full-screen message.
  $ABF1,$03 Call #R$AC1A to switch to the normal screen output.
  $ABF4,$03 Clear the display with #SKOOLKID$0D6B(CLS).
  $ABF7,$01 Return.

c $ABF8 Clear Lines
@ $ABF8 label=ClearLines
D $ABF8 Clear the lines given by *#R$AF38 from the bottom of the screen.
. Nothing calls this routine.
  $ABF8,$03 Call #R$AC1A to switch to the normal screen output.
  $ABFB,$07 Clear the number of lines held by *#R$AF38 from the bottom of the screen using #SKOOLKID$0E44(CL_LINE).
  $AC02,$01 Return.

c $AC03 Set Default Screen Position
@ $AC03 label=SetDefaultScreenPosition
D $AC03 Open the normal screen channel and park the cursor at the default line.
  $AC03,$03 Call #R$AC1A to switch to the normal screen output.
  $AC06,$06 Call #SKOOLKID$0DD9(CL_SET).
  $AC0C,$01 Return.

c $AC0D Set Screen Position
@ $AC0D label=SetScreenPosition
D $AC0D Open the normal screen channel and park the cursor on the current screen line.
  $AC0D,$03 Call #R$AC1A to switch to the normal screen output.
  $AC10,$03 Read the screen line into #REGa.
  $AC13,$01 Use the screen line as the cursor row.
  $AC14,$05 Call #SKOOLKID$0DD9(CL_SET).
  $AC19,$01 Return.

c $AC1A Switch To Normal Screen Output
@ $AC1A label=SwitchToNormalScreenOutput
D $AC1A Select the normal screen channel without losing the registers.
  $AC1A,$04 Hold the caller's values while the screen channel opens.
  $AC1E,$05 Call #SKOOLKID$1601(CHAN_OPEN).
  $AC23,$04 Restore the caller's values from the stack.
  $AC27,$01 Return.

c $AC28 Print String
@ $AC28 label=PrintString
D $AC28 Print an #N$FF-terminated string.
R $AC28 HL Pointer to string to be printed
  $AC28,$03 Call #R$AC1A to switch to the normal screen output.
N $AC2B Just keep looping and printing the fetched character until the termination byte is reached (#N$FF).
@ $AC2B label=PrintString_Loop
  $AC2B,$01 Load a character from the string pointer into #REGa.
  $AC2C,$01 Move the string pointer to the next character.
  $AC2D,$03 Return if the string termination character (#N$FF) has been
. reached.
  $AC30,$03 Call #R$AC47 to print the character.
  $AC33,$02 Print the next character.

c $AC35 Print String And A Newline
@ $AC35 label=PrintStringAndANewline
D $AC35 Print an #N$FF-terminated string and move to the next line.
  $AC35,$03 Call #R$AC28 to print the string.
N $AC38 Force a newline to be "printed".
  $AC38,$02 Load a "newline" character into #REGa (#N$0D).
  $AC3A,$03 Call #R$AC47 to print the character.
  $AC3D,$01 Return.

c $AC3E Scroll Screen
@ $AC3E label=ScrollScreen
D $AC3E Scroll the screen and put the cursor back on the default line.
  $AC3E,$01 Keep the caller's #REGbc, #REGde and #REGhl safe in the shadow registers while the screen scrolls.
N $AC3F Scroll the screen up.
  $AC3F,$03 Call #SKOOLKID$0DFE(CL_SC_ALL).
N $AC42 Reset the print position.
  $AC42,$03 Call #R$AC03.
  $AC45,$01 Bring back the caller's #REGbc, #REGde and #REGhl.
  $AC46,$01 Return.

c $AC47 Print Character
@ $AC47 label=PrintCharacter
D $AC47 Print one character on the screen channel.
R $AC47 A The character to print
  $AC47,$01 Keep the character to print on the stack.
  $AC48,$07 Jump to #R$AC62 if the line byte of #SKOOLKID$5C88(S_POSN) (#N$5C89) is not equal to #N$03.
  $AC4F,$02 Restore the character to print from the stack, keeping a copy there.
  $AC51,$04 Jump to #R$AC5A if this isn't a newline character (#N$0D).
N $AC55 This is a newline, so scroll the screen up to action it.
  $AC55,$03 Call #R$AC3E.
  $AC58,$01 Clear the character off the stack (as there's nothing to print for
. a newline, just the screen scroll).
  $AC59,$01 Return.
N $AC5A Check the column position.
@ $AC5A label=CheckColumnPosition
  $AC5A,$08 Call #R$AC3E if *#SKOOLKID$5C88(S_POSN) is equal to #N$01.
N $AC62 Actions printing #REGa to the screen.
@ $AC62 label=PrintCharacterDirect
  $AC62,$01 Restore the character to print from the stack.
  $AC63,$01 Print to the screen using #SKOOLKID$0010(PRINT_A_1).
  $AC64,$01 Return.

c $AC65 Pause Loop
@ $AC65 label=PauseLoop
D $AC65 Wait for the number of frames held in #REGb.
  $AC65,$01 Wait for the next frame.
  $AC66,$02 Count down #REGb and repeat from #R$AC65 until the count is exhausted.
  $AC68,$01 Return.

c $AC69 Fetch Frames
@ $AC69 label=FetchFrames
D $AC69 Read the ROM frame counter, used as a seed for chance.
  $AC69,$03 Read *#SKOOLKID$5C78(FRAMES) into #REGa.
  $AC6C,$01 Return.

c $AC6D Save Game
@ $AC6D label=SaveGame
D $AC6D Copy the configurable exits into the save buffer and write them to tape.
  $AC6D,$03 Read the configurable-exit count into #REGa.
  $AC70,$03 Jump to #R$AC8C if #REGa is zero.
N $AC73 #REGb counts the exits, #REGix walks their addresses and #REGde the save buffer.
  $AC73,$08 Take the exit count and point at the exit table and the save buffer.
  $AC7B,$02 Start with the first configurable exit.
@ $AC7D label=SaveGame_CopyExit
  $AC7D,$0F Copy each configurable exit's current destination into the save buffer.
@ $AC8C label=SaveGame_StartTape
  $AC8C,$06 Print "#MESSAGE$B05A" and start a new line.
  $AC92,$03 Call #R$ABE1 to read the player's key.
  $AC95,$04 Point #REGix at the item-location table.
  $AC99,$08 Save #N$0186 bytes from the item-location table to tape as a data block.
  $ACA1,$06 Print "#MESSAGE$B07C" and start a new line.
  $ACA7,$01 Return.

c $ACA8 Load From Tape
@ $ACA8 label=LoadFromTape
D $ACA8 Read a save block back from tape into the configurable exits.
  $ACA8,$06 Print "#MESSAGE$B01F" and start a new line.
  $ACAE,$04 Load the starting address into #REGix at the item-location table.
  $ACB2,$03 Set the block length in #REGde to #N$0186 bytes.
  $ACB5,$02 Set #REGa to #N$FF which indicates this is a data block.
  $ACB7,$01 Set the carry flag to indicate this is loading.
  $ACB8,$03 Call #SKOOLKID$0556(LD_BYTES).
  $ACBB,$02 Branch to #R$ACC5 if the block loaded without error (carry flag set).
  $ACBD,$06 Print "#MESSAGE$B034" and start a new line.
  $ACC3,$01 Set the carry flag to report that the load failed, so #R$F7AC restarts the game.
  $ACC4,$01 Return.
@ $ACC5 label=LoadTape_Success
  $ACC5,$03 Read the configurable-exit count into #REGa.
  $ACC8,$02 Return if #REGa is zero.
N $ACCA #REGb counts the exits, #REGix walks their addresses and #REGde the save buffer.
  $ACCA,$08 Take the exit count and point at the exit table and the save buffer.
  $ACD2,$02 Restore the first configurable exit.
@ $ACD4 label=LoadTape_RestoreExit
  $ACD4,$0F Copy each saved destination back into the configurable exits.
  $ACE3,$05 Show the room picture only when it has not already been seen.
  $ACE8,$01 Clear the carry flag to report that the load worked, so #R$F7AC goes back to the game.
  $ACE9,$01 Return.

c $ACEA Print Input Prompt
@ $ACEA label=PrintInputPrompt
D $ACEA Print the input prompt.
  $ACEA,$03 Point at the prompt graphic in the display file.
  $ACED,$03 Set the increment in #REGde for the next screen line.
  $ACF0,$03 Scan the eight pixel rows of the prompt cell.
@ $ACF3 label=PrintInputPrompt_Loop
  $ACF3,$01 Collect the pixels of this row of the prompt cell.
  $ACF4,$01 Move down one line.
  $ACF5,$02 Repeat for all eight pixel rows, so #REGa is non-zero if anything is already drawn in the cell.
  $ACF7,$03 Jump to #R$ACFF if #REGa is zero.
N $ACFA Force a newline to be "printed".
  $ACFA,$02 Use the ENTER key code.
  $ACFC,$03 Call #R$AC47 to print the character.
@ $ACFF label=PrintPrompt
  $ACFF,$06 Print "#MESSAGE$AF4D".
  $AD05,$01 Return.

c $AD06 Print Room Graphic
@ $AD06 label=PrintRoomGraphic
D $AD06 Expand one compressed room picture into the display.
R $AD06 IX Pointer to room image data
  $AD06,$03 Call #R$AC1A to switch to the normal screen output.
  $AD09,$03 Park the cursor where the room picture is printed.
  $AD0C,$03 Call #SKOOLKID$0DD9(CL_SET).
N $AD0F Reset graphic display area.
  $AD0F,$03 Point #REGhl at #SKOOLKID$5C8F(ATTR_T) which holds the current attribute value.
  $AD12,$01 Fetch the attribute byte.
  $AD13,$02,b$01 Keep only the PAPER bits 3-5.
  $AD15,$03 Move the PAPER bits into the INK bits.
  $AD18,$01 Store the result in #REGb.
  $AD19,$01 Fetch the attribute byte again.
  $AD1A,$02,b$01 Keep everything except the INK bits.
  $AD1C,$01 Combine the two values.
  $AD1D,$01 Write the result back to *#SKOOLKID$5C8F(ATTR_T).
  $AD1E,$03 Set a byte counter in #REGbc of #N($0200,$04,$04).
@ $AD21 label=Print_RoomGraphic_Loop
  $AD21,$01 Keep the byte counter on the stack.
  $AD22,$03 Point #REGhl at the character-cell buffer.
  $AD25,$02 Take the eight pixel rows of this character cell.
  $AD27,$03 Take this cell's mask byte.
  $AD2A,$02 Move past the mask byte.
  $AD2C,$02 Expand the first row of this cell.
  $AD2E,$01 Step to the next row of the cell.
  $AD2F,$02 Test the next mask bit.
  $AD31,$02 Skip the stored row when this mask bit is clear.
  $AD33,$03 Take the pixel row stored for this mask bit.
  $AD36,$02 Move past that pixel row.
  $AD38,$02 Store the pixel row for this mask bit.
  $AD3A,$01 Use a blank pixel row when this mask bit is clear.
  $AD3B,$01 Store the row in this cell.
  $AD3C,$02 Repeat for all eight pixel rows of this character cell.
  $AD3E,$03 Point #REGde at the character-cell buffer.
  $AD41,$03 Call #SKOOLKID$0B03(PO_FETCH).
  $AD44,$03 Call PR_ALL at #N$0B7F, part of #SKOOLKID$0B24(PO_ANY).
  $AD47,$03 Call #SKOOLKID$0ADC(PO_STORE).
  $AD4A,$01 Restore the byte counter from the stack.
  $AD4B,$01 Decrease the byte counter by one.
  $AD4C,$04 Jump back to #R$AD21 until the byte counter is zero.
  $AD50,$03 Call #SKOOLKID$0D4D(TEMPS).
  $AD53,$01 Return.

c $AD54 Colour Room Image
@ $AD54 label=ColourRoomImage
D $AD54 Copy the picture's attribute bytes onto the screen.
R $AD54 IX Pointer to the room attribute data
  $AD54,$03 Point #REGde at the attribute file.
  $AD57,$03 Copy the attribute pointer from #REGix into #REGhl.
  $AD5A,$03 Use #N$0200 as the count in #REGbc.
  $AD5D,$02 Copy the counted bytes from #REGhl to #REGde.
  $AD5F,$01 Return.

c $AD60 Print Room Image
@ $AD60 label=Print_RoomImage
D $AD60 Draw the room picture and then colour it.
  $AD60,$03 Call #R$AD06 to draw the room picture.
  $AD63,$03 Call #R$AD54 to colour the room picture.
  $AD66,$01 Return.

c $AD67 Clear Room Image
@ $AD67 label=ClearRoomImage
D $AD67 Copy one attribute byte across the #N$0200 cells of the picture.
. Nothing calls this routine.
R $AD67 A Attribute byte value
  $AD67,$03 Set a counter in #REGbc of #N$0200 bytes.
  $AD6A,$03 Point #REGhl at the attribute buffer (#N$5800).
  $AD6D,$01 Copy the attribute byte into #REGe.
@ $AD6E label=ClearRoomImage_Loop
  $AD6E,$01 Write the byte to the attribute buffer.
  $AD6F,$01 Advance #REGhl to the next cell.
  $AD70,$01 Step the picture-cell count down.
  $AD71,$02 See whether any picture cells remain.
  $AD73,$02 Branch to #R$AD6E while cells remain.
  $AD75,$01 Return.

g $AD76 Table: Item Locations
@ $AD76 label=Table_ItemLocations
D $AD76 One byte per item. The value is the room the item is in, #N$00 when
. the item is inactive, and the inventory room when the player is carrying it.
B $AD76,$01 Room #N(#PEEK(#PC)).
L $AD76,$01,$87

g $ADFD Game State
@ $ADFD label=GameState
D $ADFD Working flags copied from #R$FBDC. Named fields below are the
. bytes the engine addresses directly.
B $ADFD,$79

g $AE76 Flags: Room Change
@ $AE76 label=Flags_RoomChange
D $AE76 Bit 0 and bit 1 gate the special move out of room #N$37.
B $AE76,$02

g $AE78 Flag: Turn Scratch
@ $AE78 label=Flag_TurnScratch
D $AE78 Cleared at the start of every pass round the game loop.
B $AE78,$01

g $AE79 Game State
@ $AE79 label=Room_PourReturn
B $AE79,$0F

g $AE88 Flags: Turn-Based Events
@ $AE88 label=Flags_TurnBasedEvents
D $AE88 One bit per turn-based event. Process Game Events walks the bits.
B $AE88,$01

g $AE89 Turn-Based Event Counters
@ $AE89 label=Counters_TurnBasedEvents
D $AE89 One counter byte for each bit in the turn-based event flags.
B $AE89,$08

g $AE91 Flags: Event States
@ $AE91 label=Flags_EventStates
D $AE91 Set when a turn-based event has started.
B $AE91,$01

g $AE92 Table: Turn-Based Event Items
@ $AE92 label=Table_TurnBasedEventItems
D $AE92 Item id for each bit in the event-state flags.
B $AE92,$08

g $AE9A Game State
@ $AE9A label=Count_CarriedItems
B $AE9A,$01

g $AE9B Load/ Save Buffer
@ $AE9B label=LoadSaveBuffer
D $AE9B Save Game copies the configurable-exit bytes here before writing
. the tape block. The buffer is #N$32 bytes, ending at the current room.
B $AE9B,$32

g $AECD Current Room
@ $AECD label=CurrentRoom
D $AECD The room the player is in. The initial image starts in room #N$03.
B $AECD,$01

w $AECE Score
@ $AECE label=Score
D $AECE BCD score. Add To Score accumulates into this word.
W $AECE,$02

w $AED0 Pointer: Vocabulary Table
@ $AED0 label=Pointer_Vocabulary
D $AED0 Points at #R$E25C.
W $AED0,$02

w $AED2 Pointer: Turn-Based Events Jump Table
@ $AED2 label=Pointer_TurnBasedEvents
D $AED2 The initial image stores #N($0000,$04,$04). The engine loads this pointer into
. #REGix when it dispatches a turn-based event.
W $AED2,$02

w $AED4 Pointer: Room Map Table
@ $AED4 label=Pointer_RoomMap
D $AED4 Points at #R$E7E6.
W $AED4,$02

w $AED6 Pointer: Item Description Table
@ $AED6 label=Pointer_ItemDescriptions
D $AED6 Points at #R$CD58.
W $AED6,$02

w $AED8 Pointer: Rooms With Images Table
@ $AED8 label=Pointer_RoomsWithImages
D $AED8 Points at #R$FDFF.
W $AED8,$02

w $AEDA Pointer: Room Image Jump Table
@ $AEDA label=Pointer_RoomImage
D $AEDA Points at #R$FDEB.
W $AEDA,$02

w $AEDC Pointer: Room Description Table
@ $AEDC label=Pointer_RoomDescriptions
D $AEDC Points at #R$CE66.
W $AEDC,$02

w $AEDE Pointer: Item Grouping Table
@ $AEDE label=Pointer_ItemGrouping
D $AEDE Points at #R$E5F7.
W $AEDE,$02

w $AEE0 Pointer: Object Noun Phrases
@ $AEE0 label=Pointer_ObjectNounPhrases
D $AEE0 Points at #R$CEEA.
W $AEE0,$02

w $AEE2 Pointer: Character Set
@ $AEE2 label=Pointer_CharacterSet
D $AEE2 Points at #R$E4B8.
W $AEE2,$02

w $AEE4 Pointer: Verbs Jump Table
@ $AEE4 label=Pointer_Verbs
D $AEE4 Points at #R$FD63.
W $AEE4,$02

w $AEE6 Pointer: Configurable Exits Table
@ $AEE6 label=Pointer_ConfigurableExits
D $AEE6 Points at #R$E972.
W $AEE6,$02

w $AEE8 Pointer: Scenic Events Jump Table
@ $AEE8 label=Pointer_ScenicEvents
D $AEE8 The initial image stores #N($0000,$04,$04). This game ships with no scenic-event
. handlers.
W $AEE8,$02

w $AEEA Pointer: Verb Word Tokens
@ $AEEA label=Pointer_VerbWordTokens
D $AEEA Points at #R$E5D3.
W $AEEA,$02

w $AEEC Pointer: Spare
@ $AEEC label=Pointer_Spare
D $AEEC Unused pointer. The initial image stores #N($0000,$04,$04).
W $AEEC,$02

w $AEEE Pointer: Spare 2
@ $AEEE label=Pointer_Spare2
D $AEEE Unused pointer. The initial image stores #N($0000,$04,$04).
W $AEEE,$02

w $AEF0 Count: Items
@ $AEF0 label=Count_Items
D $AEF0 The game has #N$87 items.
W $AEF0,$02

w $AEF2 Count: Objects
@ $AEF2 label=Count_Objects
D $AEF2 The game has #N$48 objects.
W $AEF2,$02

w $AEF4 Count: Verb Tokens
@ $AEF4 label=Count_VerbTokens
D $AEF4 The game has #N$24 verb tokens.
W $AEF4,$02

w $AEF6 Count: Rooms With Images
@ $AEF6 label=Count_RoomsWithImages
D $AEF6 #N$0A room slots have a picture. The oil room and the acid room share one.
W $AEF6,$02

w $AEF8 Count: Scenic Events
@ $AEF8 label=Count_ScenicEvents
D $AEF8 The initial image stores #N($0000,$04,$04).
W $AEF8,$02

w $AEFA Count: Configurable Exits
@ $AEFA label=Count_ConfigurableExits
D $AEFA The game has #N$16 configurable exits.
W $AEFA,$02

b $AEFC Command Buffer
@ $AEFC label=CommandBuffer
D $AEFC The line the player is typing. The input handler clears all #N$32 bytes.
B $AEFC,$32

b $AF2E User Input: Word Tokens
@ $AF2E label=UserInput_Tokens
D $AF2E Ten parsed word tokens. Each unused slot is #N$FF.
B $AF2E,$01 Token #N(#PEEK(#PC)).
L $AF2E,$01,$0A

b $AF38 Line Number
@ $AF38 label=LineNumber
D $AF38 The entry point writes #N$18 here.
B $AF38,$01

b $AF39 Workspace
@ $AF39 label=Workspace
D $AF39 Four bytes between the line counter and the character-cell buffer.
B $AF39,$04

b $AF3D Character Cell Buffer
@ $AF3D label=CharacterCellBuffer
D $AF3D Eight pixel rows for the character cell being expanded.
B $AF3D,$08

b $AF45 Workspace: Word
@ $AF45 label=Workspace_Word
D $AF45 Scratch used while the parser walks the input.
B $AF45,$02

w $AF47 Workspace: Word Pointer
@ $AF47 label=Workspace_WordPointer
D $AF47 Pointer into the word being matched.
W $AF47,$02

b $AF49 Workspace: Tail
@ $AF49 label=Workspace_Tail
D $AF49 Four bytes between the word pointer and the system messages.
B $AF49,$04

t $AF4D Messaging: ">"
@ $AF4D label=Messaging_Prompt
  $AF4D,$02 "#MESSAGE$AF4D".
B $AF4F,$01 Terminator.

t $AF50 Messaging: "Control"
@ $AF50 label=Messaging_BackspaceSpaceBackspace
  $AF50,$03 "#MESSAGE$AF50".
B $AF53,$01 Terminator.

t $AF54 Messaging: "THE"
@ $AF54 label=Messaging_The
  $AF54,$04 "#MESSAGE$AF54".
B $AF58,$01 Terminator.

t $AF59 Messaging: "I don't understand."
@ $AF59 label=Messaging_IDontUnderstand
  $AF59,$13 "#MESSAGE$AF59".
B $AF6C,$01 Terminator.

t $AF6D Messaging: "I don't know the word:-"
@ $AF6D label=Messaging_IDontKnowTheWord
  $AF6D,$17 "#MESSAGE$AF6D".
B $AF84,$01 Terminator.

t $AF85 Messaging: "nothing."
@ $AF85 label=Messaging_Nothing
  $AF85,$08 "#MESSAGE$AF85".
B $AF8D,$01 Terminator.

t $AF8E Messaging: "You can see:-"
@ $AF8E label=Messaging_YouCanSee
  $AF8E,$0E "#MESSAGE$AF8E".
B $AF9C,$01 Terminator.

t $AF9D Messaging: "&"
@ $AF9D label=Messaging_Ampersand
  $AF9D,$03 "#MESSAGE$AF9D".
B $AFA0,$01 Terminator.

t $AFA1 Messaging: "There are exits:-"
@ $AFA1 label=Messaging_ThereAreExits
  $AFA1,$12 "#MESSAGE$AFA1".
B $AFB3,$01 Terminator.

t $AFB4 Messaging: "There is an exit"
@ $AFB4 label=Messaging_ThereIsAnExit
  $AFB4,$12 "#MESSAGE$AFB4".
B $AFC6,$01 Terminator.

t $AFC7 Messaging: "North"
@ $AFC7 label=Messaging_North
  $AFC7,$05 "#MESSAGE$AFC7".
B $AFCC,$01 Terminator.

t $AFCD Messaging: "South"
@ $AFCD label=Messaging_South
  $AFCD,$05 "#MESSAGE$AFCD".
B $AFD2,$01 Terminator.

t $AFD3 Messaging: "East"
@ $AFD3 label=Messaging_East
  $AFD3,$04 "#MESSAGE$AFD3".
B $AFD7,$01 Terminator.

t $AFD8 Messaging: "West"
@ $AFD8 label=Messaging_West
  $AFD8,$04 "#MESSAGE$AFD8".
B $AFDC,$01 Terminator.

t $AFDD Messaging: "Up"
@ $AFDD label=Messaging_Up
  $AFDD,$02 "#MESSAGE$AFDD".
B $AFDF,$01 Terminator.

t $AFE0 Messaging: "Down"
@ $AFE0 label=Messaging_Down
  $AFE0,$04 "#MESSAGE$AFE0".
B $AFE4,$01 Terminator.

t $AFE5 Messaging: "I can't see"
@ $AFE5 label=Messaging_ICantSee
  $AFE5,$0C "#MESSAGE$AFE5".
B $AFF1,$01 Terminator.

t $AFF2 Messaging: "here."
@ $AFF2 label=Messaging_Here
  $AFF2,$06 "#MESSAGE$AFF2".
B $AFF8,$01 Terminator.

t $AFF9 Messaging: "You are dead."
@ $AFF9 label=Messaging_YouAreDead
  $AFF9,$0D "#MESSAGE$AFF9".
B $B006,$01 Terminator.

t $B007 Messaging: "Want another game? Y/N."
@ $B007 label=Messaging_WantAnotherGameYN
  $B007,$17 "#MESSAGE$B007".
B $B01E,$01 Terminator.

t $B01F Messaging: "LOADING. Start tape."
@ $B01F label=Messaging_LoadingStartTape
  $B01F,$14 "#MESSAGE$B01F".
B $B033,$01 Terminator.

t $B034 Messaging: "Tape error. Press any key to restart."
@ $B034 label=Messaging_TapeError
  $B034,$25 "#MESSAGE$B034".
B $B059,$01 Terminator.

t $B05A Messaging: "SAVING. Start tape,press any key."
@ $B05A label=Messaging_SavingStartTapePressAnyKey
  $B05A,$21 "#MESSAGE$B05A".
B $B07B,$01 Terminator.

t $B07C Messaging: "Stop tape.Saving complete."
@ $B07C label=Messaging_StopTape
  $B07C,$1A "#MESSAGE$B07C".
B $B096,$01 Terminator.

t $B097 Messaging: "Want to save the game? Y/N."
@ $B097 label=Messaging_WantToSaveTheGameYN
  $B097,$1B "#MESSAGE$B097".
B $B0B2,$01 Terminator.

t $B0B3 Messaging: "Please be more specific."
@ $B0B3 label=Messaging_PleaseBeMoreSpecific
  $B0B3,$18 "#MESSAGE$B0B3".
B $B0CB,$01 Terminator.

t $B0CC Messaging: "Please rephrase that."
@ $B0CC label=Messaging_PleaseRephraseThat
  $B0CC,$15 "#MESSAGE$B0CC".
B $B0E1,$01 Terminator.

t $B0E2 Messaging: "You can't."
@ $B0E2 label=Messaging_YouCant
  $B0E2,$0A "#MESSAGE$B0E2".
B $B0EC,$01 Terminator.

t $B0ED Messaging: "O.K."
@ $B0ED label=Messaging_OK
  $B0ED,$04 "#MESSAGE$B0ED".
B $B0F1,$01 Terminator.

t $B0F2 Messaging: "You're already carrying"
@ $B0F2 label=Messaging_YoureAlreadyCarrying
  $B0F2,$18 "#MESSAGE$B0F2".
B $B10A,$01 Terminator.

t $B10B Messaging: "."
@ $B10B label=Messaging_FullStop
  $B10B,$01 "#MESSAGE$B10B".
B $B10C,$01 Terminator.

t $B10D Messaging: "it."
@ $B10D label=Messaging_It
  $B10D,$03 "#MESSAGE$B10D".
B $B110,$01 Terminator.

t $B111 Messaging: "them."
@ $B111 label=Messaging_Them
  $B111,$05 "#MESSAGE$B111".
B $B116,$01 Terminator.

t $B117 Messaging: "You can't carry any more."
@ $B117 label=Messaging_YouCantCarryAnyMore
  $B117,$19 "#MESSAGE$B117".
B $B130,$01 Terminator.

t $B131 Messaging: "You are carrying:-"
@ $B131 label=Messaging_YouAreCarrying
  $B131,$12 "#MESSAGE$B131".
B $B143,$01 Terminator.

t $B144 Messaging: "You can't go in that direction."
@ $B144 label=Messaging_YouCantGoInThatDirection
  $B144,$1F "#MESSAGE$B144".
B $B163,$01 Terminator.

t $B164 Messaging: "One at a time,please!"
@ $B164 label=Messaging_OneAtATimePlease
  $B164,$15 "#MESSAGE$B164".
B $B179,$01 Terminator.

t $B17A Messaging: "I don't see the point."
@ $B17A label=Messaging_IDontSeeThePoint
  $B17A,$16 "#MESSAGE$B17A".
B $B190,$01 Terminator.

t $B191 Messaging: "You're not carrying"
@ $B191 label=Messaging_YoureNotCarrying
  $B191,$14 "#MESSAGE$B191".
B $B1A5,$01 Terminator.

t $B1A6 Messaging: "You're not carrying anything."
@ $B1A6 label=Messaging_YoureNotCarryingAnything
  $B1A6,$1D "#MESSAGE$B1A6".
B $B1C3,$01 Terminator.

t $B1C4 Messaging: "You have scored"
@ $B1C4 label=Messaging_YouHaveScored
  $B1C4,$10 "#MESSAGE$B1C4".
B $B1D4,$01 Terminator.

t $B1D5 Messaging: "%."
@ $B1D5 label=Messaging_Percentage
  $B1D5,$02 "#MESSAGE$B1D5".
B $B1D7,$01 Terminator.

w $B1D8 Table: Direction Names
@ $B1D8 label=Table_DirectionNames
D $B1D8 One word per direction, in the order north, south, east, west, up, down.
W $B1D8,$02 #MESSAGE(#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $B1D8,$02,$06

c $B1E4 Messaging: "Please Rephrase That."
@ $B1E4 label=Messaging_PleaseRephraseThat_Newline
D $B1E4 Print "Please Rephrase That."
N $B1E4 Print it and start a new line: #MESSAGE$B0CC.
  $B1E4,$06 Point at the message and print it and start a new line.
  $B1EA,$01 Return.

c $B1EB Messaging: "Please Be More Specific."
@ $B1EB label=Messaging_PleaseBeMoreSpecific_Newline
D $B1EB Print "Please Be More Specific."
N $B1EB Print it and start a new line: #MESSAGE$B0B3.
  $B1EB,$06 Point at the message and print it and start a new line.
  $B1F1,$01 Return.

c $B1F2 Messaging: "You can't."
@ $B1F2 label=Messaging_YouCant_Newline
D $B1F2 Print "You can't." Nothing calls this copy; play uses #R$EAE2.
N $B1F2 Print it and start a new line: #MESSAGE$B0E2.
  $B1F2,$06 Point at the message and print it and start a new line.
  $B1F8,$01 Return.

c $B1F9 Messaging: "O.K."
@ $B1F9 label=Messaging_OK_Newline
D $B1F9 Print "O.K." Nothing calls this copy; play uses #R$EAE8.
N $B1F9 Print it and start a new line: #MESSAGE$B0ED.
  $B1F9,$06 Point at the message and print it and start a new line.
  $B1FF,$01 Return.

c $B200 Handler: User Input
@ $B200 label=HandlerUserInput
D $B200 Read a command, tokenise it, and reject words the game does not know.
  $B200,$03 Call #R$AC03 to park the cursor on the default line.
  $B203,$03 Point #REGhl at the command buffer.
  $B206,$04 Fill the command buffer with spaces.
@ $B20A label=HandlerUserInput_Loop
  $B20A,$01 Store #REGa at the buffer pointer.
  $B20B,$01 Advance #REGhl to the next byte.
  $B20C,$02 Count down #REGb and repeat from #R$B20A until the count is exhausted.
  $B20E,$03 Call #R$ACEA to print the input prompt.
  $B211,$03 Point #REGhl at the command buffer.
@ $B214 label=Handler_UserInput_ReadKey
  $B214,$03 Call #R$ABE1 to read the player's key.
  $B217,$04 Branch to #R$B237 when the player pressed DELETE.
  $B21B,$04 Branch to #R$B24E when the player pressed ENTER.
  $B21F,$04 Branch to #R$B214 unless the player pressed SPACE.
  $B223,$01 Move the buffer position into #REGde so it can be checked against the end of the command buffer.
  $B224,$09 Ignore a space once the command fills the buffer.
  $B22D,$01 Store #REGa at the buffer pointer.
  $B22E,$03 Call #R$AC1A to switch to the normal screen output.
  $B231,$03 Call #R$AC47 to print the character.
  $B234,$01 Advance #REGhl to the next byte.
  $B235,$02 Read the next key at #R$B214.

c $B237 Handler: User Pressed "DELETE"
@ $B237 label=HandlerUserPressedDELETE
D $B237 Rub out the last character of the command when the player presses DELETE.
R $B237 HL Current position in the command buffer
  $B237,$08 See whether the cursor is still on the first character.
  $B23F,$02 Ignore DELETE at the start of the command.
N $B241 Else delete the current character.
  $B241,$01 Keep the pointer to the command buffer on the stack.
  $B242,$06 Rub out the last character.
  $B248,$01 Restore the pointer to the command buffer from the stack.
N $B249 Now adjust the command buffer pointer to match the new position.
  $B249,$01 Decrease the pointer to the command buffer by one.
  $B24A,$02 Write an ASCII space (#N$20) into the command buffer at the current
. position.
  $B24C,$02 Read the next key.

c $B24E Handler: User Pressed "ENTER"
@ $B24E label=HandlerUserPressedENTER
D $B24E Turn the finished command into word tokens.
R $B24E HL Current position in the command buffer
R $B24E A Which contains #N$0D ("ENTER") at this point.
  $B24E,$01 Write #N$0D to the command buffer at the current position for use as a termination character.
N $B24F Force a newline to be "printed" to the screen.
  $B24F,$03 Call #R$AC1A.
  $B252,$03 Call #R$AC47 to print the character.
N $B255 Initialise the word token buffer. This buffer will store up to #N$0A vocabulary tokens (one per word in the command). Each token is the index of the word in the vocabulary table.
  $B255,$03 Point #REGhl at the first word token.
  $B258,$02 Use the the terminator key code.
  $B25A,$02 Set a counter in #REGb for the size of the word token buffer (#N$0A bytes).
N $B25C Fill the word token buffer with #N$FF (the terminator value) to mark all slots as empty.
@ $B25C label=EmptyWordTokenBuffer_Loop
  $B25C,$04 Mark every word slot empty.
  $B260,$03 Point #REGhl at the command buffer.
  $B263,$02 Allow ten words in the command.
@ $B265 label=ParserMatchInputWord
@ $B265 label=Parser_MatchInputWord
  $B265,$07 Blank the four-byte word scratch with spaces.
  $B26C,$04 Fill the word scratch with spaces.
  $B270,$05 Finish when every word slot is full.
  $B275,$01 Read the next character of the command.
  $B276,$05 Finish the command at ENTER.
  $B27B,$05 Copy the next word into the four-byte scratch.
  $B280,$01 Read the next character of this word.
  $B281,$04 End the word at ENTER.
  $B285,$04 End the word at a space.
  $B289,$04 End the word at a comma.
  $B28D,$01 Store that character in the word scratch.
  $B28E,$02 Advance through the command and the word scratch.
  $B290,$02 Copy up to four letters of this word into the word scratch.
  $B292,$01 Read the character past a word that did not fit.
  $B293,$04 Stop skipping once ENTER is reached.
  $B297,$04 Stop skipping at a space.
  $B29B,$04 Stop skipping at a comma.
  $B29F,$01 Skip the rest of a word that does not fit the scratch.
  $B2A0,$02 Keep skipping to the end of a long word.
  $B2A2,$01 Step past the space or comma between words.
  $B2A3,$01 Read the character after that space or comma.
  $B2A4,$04 Skip spaces between words.
  $B2A8,$04 Skip commas between words.
  $B2AC,$03 Remember the command, the scratch and the word count.
  $B2AF,$08 Compare the scratch word with "#MESSAGE$AF54".
@ $B2B7 label=CompareWord_Loop
  $B2B7,$04 Jump to #R$B2BF if the characters don't match (the word is not "The").
  $B2BB,$02 Compare the next letter of "THE".
  $B2BD,$02 Keep going until all four letters have been compared.
  $B2BF,$03 Restore #REGbc, #REGde, #REGhl from the stack.
  $B2C2,$02 Jump to #R$B265 if the words matched (this was "The", so skip it and
. process the next word).
  $B2C4,$01 Use up one of the ten word slots for this word.
  $B2C5,$03 Write #REGhl to the word scratch.
  $B2C8,$04 Write #REGde to the word pointer.
  $B2CC,$04 Write #REGbc to *#R$AF49.
N $B2D0 Look up the word in the vocabulary table. The vocabulary contains all recognised verbs, nouns, and other words the game understands. Each entry can have synonyms separated by commas.
  $B2D0,$03 Load the pointer for the vocabulary pointer into #REGhl.
  $B2D3,$02 Select the north exit.
@ $B2D5 label=VocabularyLookup_Loop
  $B2D5,$05 Jump to #R$B312 if *#REGhl is equal to #N$FF (end of vocabulary table).
@ $B2DA label=CompareVocabularyWord
  $B2DA,$05 Compare this vocabulary word with the scratch word.
@ $B2DF label=CompareVocabularyWord_Loop
  $B2DF,$04 Jump to #R$B303 if the characters don't match (this vocabulary entry doesn't match the word).
  $B2E3,$01 Move to the next character in the extracted word.
  $B2E4,$01 Move to the next character in the vocabulary entry.
  $B2E5,$02 Decrease counter by one and loop back to #R$B2DF until all #N$04 characters have been compared.
N $B2E7 Word matched in vocabulary! Calculate which slot in the token buffer to use (based on how many words have been processed so far) and store the vocabulary index as the token.
  $B2E7,$08 Work out which token slot this word fills.
  $B2EF,$01 Use the filled slot as an offset into the token buffer.
  $B2F0,$04 Calculate the address of the token buffer slot: #REGhl=the first word token+#REGde.
  $B2F4,$01 Store the vocabulary index (#REGc) in the token buffer slot.
  $B2F5,$03 Put back the command buffer position from the word scratch.
  $B2F8,$04 Put back the word buffer position from the word pointer.
  $B2FC,$04 Put back the word counter from *#R$AF49.
  $B300,$03 Take the next word.
@ $B303 label=VocabularyWordNoMatch
N $B303 Word didn't match this vocabulary entry. Check if there's a synonym (indicated by a comma). If found, try matching against the synonym instead.
  $B303,$04 Step past the vocabulary word that did not match.
  $B307,$01 Read the character at this position and store it in #REGa.
  $B308,$04 Jump to #R$B30F if this character is not a comma (#N($2C), meaning no synonym exists).
  $B30C,$01 Move past the comma to the synonym.
  $B30D,$02 Jump to #R$B2DA to try matching the synonym.
@ $B30F label=VocabularyNextEntry
  $B30F,$01 Advance to the next vocabulary word.
  $B310,$02 Jump to #R$B2D5 to check the next vocabulary entry.
@ $B312 label=ProcessUnrecognisedWords
N $B312 All recognised words have been tokenised. Now check if there are any unrecognised words remaining in the input. If so, display an error message to the player showing which word(s) weren't understood.
  $B312,$03 Load the pointer for the word scratch into #REGhl.
  $B315,$04 Restore the word pointer.
  $B319,$04 Restore the word count.
  $B31D,$04 Count the words still to check.
  $B321,$03 Point #REGhl at the command buffer.
@ $B324 label=ProcessUnrecognisedWords_Loop
  $B324,$01 Count off one recognised word; the unrecognised word is reached when the count runs out.
  $B325,$02 Jump to #R$B33F if #REGc is equal to #N$0A (no unrecognised words found).
@ $B327 label=FindUnrecognisedWord_Loop
  $B327,$01 Read the character from *#REGhl and store it in #REGa.
  $B328,$04 Jump to #R$B333 if the character is an ASCII "SPACE" (#N$20).
  $B32C,$04 Jump to #R$B333 if the character is an ASCII comma (#N$2C).
  $B330,$01 Move to the next character in the command buffer.
  $B331,$02 Keep reading this unrecognised word.
@ $B333 label=SkipDelimiters_Loop2
  $B333,$01 Move to the next character in the command buffer.
  $B334,$01 Read the character from *#REGhl and store it in #REGa.
  $B335,$04 Jump to #R$B333 if the character is an ASCII "SPACE" (#N$20).
  $B339,$04 Jump to #R$B333 if the character is an ASCII comma (#N$2C).
  $B33D,$02 Look for the next unrecognised word.
@ $B33F label=PrintUnrecognisedWord
N $B33F Print the unrecognised word(s) in quotes.
  $B33F,$01 Remember where the unrecognised word starts.
  $B340,$06 Print "#MESSAGE$AF6D" and start a new line.
  $B346,$01 Restore the start of the unrecognised word from the stack.
  $B347,$02 Open a quote around the unrecognised word.
  $B349,$03 Call #R$AC47 to print the character.
@ $B34C label=PrintUnrecognisedWord_Loop
  $B34C,$01 Read the character from *#REGhl and store it in #REGa.
  $B34D,$04 Jump to #R$B357 if this character is less than #N$21 (a control character, indicating end of word).
  $B351,$01 Move to the next character in the command buffer.
  $B352,$03 Call #R$AC47 to print the character.
  $B355,$02 Print the next character of the unrecognised word.
@ $B357 label=PrintUnrecognisedWord_End
  $B357,$02 Close the quote around the unrecognised word.
  $B359,$03 Call #R$AC47 to print the character.
  $B35C,$06 Print "#MESSAGE$B10B" and start a new line.
  $B362,$02 Read another command.

c $B364 Handler: Unknown Word
@ $B364 label=HandlerUnknownWord
D $B364 Answer a command the game cannot parse.
  $B364,$03 Read the first word token into #REGa.
  $B367,$03 Return when the command contains a word.
  $B36A,$06 Print "#MESSAGE$AF59" and start a new line.
  $B370,$03 Continue at #R$B200.

c $B373 Process Game Events
@ $B373 label=ProcessGameEvents
D $B373 Advance turn-based events, then any scenic events, before the player types again.
N $B373 First process the turn-based events (if any are active).
  $B373,$03 Load the turn-based event flags into #REGa.
  $B376,$03 Jump to #R$B3A5 if no turn-based events are currently active.
N $B379 One of the events has triggered, find which one.
  $B379,$01 Copy the turn-based event flags into #REGc.
  $B37A,$02 Set a counter in #REGb for the number of possible turn-based events
. (#N$08).
N $B37C Keep shifting the event flags one-by-one to find which bits are set.
@ $B37C label=GameEventChecker_Loop
  $B37C,$02 Test the next turn-based event flag.
  $B37E,$02 Jump to #R$B3A3 if this event bit isn't set.
N $B380 The currently processed turn-based event is active, so process it.
N $B380 This is: the turn-based event counters+(#N$08-the current event counter).
  $B380,$0B Calculate the turn-based event index and store it in #REGhl.
  $B38B,$01 Decrease the turn-based event counter at *#REGhl by one.
  $B38C,$02 Jump to #R$B3A3 if the event turn counter at *#REGhl was still more
. than zero.
N $B38E The event turn counter is zero, so activate the event itself.
  $B38E,$04 Load the turn-based handler pointer into #REGix.
  $B392,$02 Double the index as this table contains addresses.
  $B394,$02 Add this offset to #REGix to point to the current handler.
  $B396,$06 Get the handler address and store it in #REGhl.
  $B39C,$01 Keep the bit index and event flag byte on the stack.
  $B39D,$04 Push #R$B3A2 onto the stack so that the next return will go on to
. continue processing events.
  $B3A1,$01 Jump to the routine pointed to by *#REGhl to action the current
. event.
N $B3A2 Once the event handler has run, this is where the routine will resume.
@ $B3A2 label=GameEventChecker_Return
  $B3A2,$01 Restore the event bit index counter and event flag byte from the stack.
@ $B3A3 label=GameEventChecker_Next
  $B3A3,$02 Decrease the event bit counter by one and loop back to #R$B37C
. until all the event status bits have been processed.
N $B3A5 Process scenic events.
@ $B3A5 label=GameScenicEventsProcessor
  $B3A5,$01 #HTML(A spare <code>NOP</code>, probably where an instruction was patched out, before the scenic events are processed.)
  $B3A6,$03 Point #REGhl at the scenic-event list.
  $B3A9,$03 Read the scenic-event count into #REGa.
  $B3AC,$03 Leave scenic events alone when none are defined.
  $B3AF,$03 Count the scenic events and read the first one.
@ $B3B2 label=ScenicEvent_Loop
  $B3B2,$02 Read this scenic event's item.
  $B3B4,$01 Remember which scenic event this is.
  $B3B5,$03 Call #R$B5C6 to read which room holds the item.
  $B3B8,$01 Restore the pointer to this scenic event from the stack.
  $B3B9,$03 Skip a scenic event that is not in play.
  $B3BC,$01 Remember which room holds this scenic item.
  $B3BD,$03 Read the current room into #REGa.
  $B3C0,$03 Skip a scenic event that is already in this room.
  $B3C3,$02 Remember this scenic event while its next room is chosen.
  $B3C5,$03 Read the scenic-event count into #REGa.
  $B3C8,$02 Turn the remaining count into this event's index.
  $B3CA,$04 Point #REGix at this event's room list.
  $B3CE,$03 Call #R$B3F1 to look up the table entry.
  $B3D1,$03 Call #R$AC69 to read the frame counter.
  $B3D4,$01 Use the frame counter as a step through the room list.
  $B3D5,$02 Use #N$FF as the end of the room list.
  $B3D7,$06 Point at this event's room list.
  $B3DD,$02 Start at the first room in the list.
@ $B3DF label=ScenicEvent_PickRoom
  $B3DF,$01 Step to the next room in the list.
  $B3E0,$01 Stop at the end of the room list.
  $B3E1,$02 Wrap to the start of the list at the terminator.
  $B3E3,$02 Take another step while the frame count remains.
  $B3E5,$01 Take the room chosen for this scenic item.
  $B3E6,$01 Restore the pointer to this scenic event from the stack.
  $B3E7,$01 Take this scenic event's item.
  $B3E8,$01 Remember the scenic event while its item is moved.
  $B3E9,$03 Call #R$B5FD to store the item's room.
  $B3EC,$02 Restore #REGhl, #REGbc from the stack.
  $B3EE,$02 Step down #REGb by one and jump to #R$B3B2 until it is zero.
  $B3F0,$01 Return.

c $B3F1 Get Table Entry
@ $B3F1 label=GetTableEntry
D $B3F1 Look up one entry in a word table.
R $B3F1 E Index of item
R $B3F1 IX Base table address
R $B3F1 O:HL Address from the relevant table entry
R $B3F1 O:IX Address of the table entry
  $B3F1,$06 Double the entry index so it addresses a word in the table.
  $B3F7,$02 Step to the chosen entry in the word table.
  $B3F9,$06 Read the address stored in that entry.
  $B3FF,$01 Return.

c $B400 Print Objects
@ $B400 label=PrintObjects
D $B400 List the objects the player can see in this room.
R $B400 A #N$01 for inventory items, or room number for room objects
  $B400,$03 Point #REGhl at #R$AD76.
  $B403,$04 Load the number of items into #REGbc.
@ $B407 label=PrintObjects_Loop
  $B407,$02 Search #R$AD76 for the next item in this room.
  $B409,$01 Return if no matching items remain.
  $B40A,$01 Stash the current place in #R$AD76 on the stack.
  $B40B,$03 Call #R$B64B to see whether this item has a description.
  $B40E,$02 Skip an item that has no description.
  $B410,$02 Remember the room ID and the remaining count while the name is
. printed.
  $B412,$03 Call #R$AC35 to print the string and start a new line.
  $B415,$02 Restore the remaining count and the room ID from the stack.
@ $B417 label=PrintObjects_Next
  $B417,$01 Hold the room ID in #REGe.
  $B418,$01 Restore the current place in #R$AD76 from the stack.
  $B419,$02 See whether any items remain.
  $B41B,$01 Restore the room ID to #REGa.
  $B41C,$02 Jump to #R$B407 while items remain.
  $B41E,$01 Return.

c $B41F Handler: Display Room Image
@ $B41F label=HandlerDisplayRoomImage
D $B41F Show the picture for the current room when that room has one.
R $B41F E #N$01 If the image should be displayed, #N$00 if it should be skipped
N $B41F The game can also load without any graphics at all, so bail if there's nothing needed to do here.
  $B41F,$06 Jump to #R$B46B if the picture-room count is set to zero.
N $B425 The version of the game being played DOES have graphics, so continue.
  $B425,$03 Fetch the current room and load it into #REGa.
  $B428,$03 Fetch the address of the table from the rooms-with-images pointer.
  $B42B,$04 Fetch the count of the number of rooms in the table from the picture-room count.
  $B42F,$02 Search to see if the current room ID is in the table.
  $B431,$02 Jump to #R$B46B if the current room ID does not appear in the
. table.
N $B433 The current room does have an image associated with it.
  $B433,$03 Read the picture-room count into #REGa.
  $B436,$03 Turn the picture search into this room's image index.
N $B439 The #REGe register is used as a flag to indicate that the room image should not be displayed, e.g. after the player has requested to view their inventory and have seen the room image already when they entered the location.
  $B439,$04 Jump to #R$B459 if #REGe was set to #N$01 (Display the image).
N $B43D The game also maintains a table of "already seen room images" so the player doesn't have to view an image for a room they've already been in.
N $B43D The player can view it manually by typing "LOOK" (or just "L").
  $B43D,$03 Point #REGhl at the room-image-seen flags.
  $B440,$01 Copy the room image index into #REGa.
@ $B441 label=FindAlreadySeenByte_Loop
N $B441 Only two bytes hold the data for all #N$0C rooms with images so first - find the correct byte which references this room.
  $B441,$04 Jump to #R$B44A if the room index is less than #N$08.
  $B445,$02 Move this room into the next flag byte.
  $B447,$01 Increment the "image already seen" table pointer by one.
  $B448,$02 Jump back to #R$B441 until the flag byte for this room is found.
@ $B44A label=FoundAlreadySeenByte
N $B44A Now the correct byte has been found, check the appropriate bit.
N $B44A Create a mask with a single bit set corresponding to this rooms position (0-7) in the byte.
  $B44A,$01 Copy the "image already seen" byte into #REGb.
  $B44B,$01 Include a shift for bit 0.
  $B44C,$02 Start with all bits clear in #REGd.
@ $B44E label=AlreadySeenBitShift_Loop
  $B44E,$04 Slide this room's bit into place.
N $B452 Test the bit held in #REGd against the room flag.
  $B452,$01 Fetch the current room flag.
  $B453,$03 If the room image has already been seen ... jump to #R$B46B.
N $B456 The room image hasn't already been seen, so update the bit to indicate that the player will have viewed it for the next time this routine runs.
  $B456,$03 Merge the set room bit with the room flags and write the result
. back to the room flag byte.
@ $B459 label=DisplayRoomImage
N $B459 Finally! Display the room image.
  $B459,$05 Call #R$ABF1 to clear the screen, keeping the location image index in #REGc.
  $B45E,$04 Fetch the address of the table from the room-image jump pointer.
  $B462,$01 Load the location image index into #REGe.
  $B463,$03 Call #R$B3F1 to look up the table entry.
  $B466,$04 Push #R$B46B onto the stack so that the next return will go on to
. show the room exits.
  $B46A,$01 Jump to the routine pointed to by *#REGhl to display the room
. image.

c $B46B Handler: Display Room Exits
@ $B46B label=HandlerDisplayRoomExits
D $B46B Print the exits that leave the current room.
  $B46B,$03 Call #R$ABF1 to clear the screen.
  $B46E,$05 Set up the printing position.
  $B473,$03 Call #R$B503 which loads #REGhl with the room data pointer.
  $B476,$02 Store this in #REGde for later.
N $B478 Count the number of exits in the room data.
  $B478,$02 Set an "exits" counter in #REGb of #N$06.
  $B47A,$02 Initialise #REGc to #N$00 to count the number of valid exits.
  $B47C,$01 Set #REGa to #N$00 which is used just for the comparison.
@ $B47D label=RoomExitsCount_Loop
  $B47D,$01 Does this room have an exit?
  $B47E,$02 Jump to #R$B481 if this room doesn't have an exit for this
. position.
  $B480,$01 Increment the valid exits count by one.
@ $B481 label=RoomExitsCount_Skip
  $B481,$01 Move to the next byte of room data.
  $B482,$02 Decrease the exits counter by one and loop back to #R$B47D until
. all the exits have been checked.
N $B484 Process the exits count result.
  $B484,$03 Jump to #R$B4EF if no exits were found.
  $B487,$05 Jump to #R$B4AE if more than #N$01 exit was found.
N $B48C Only one exit was found:
  $B48C,$06 Print "#MESSAGE$AFB4".
  $B492,$02 Retrieve the room data pointer and load it into #REGhl.
  $B494,$04 Set a pointer in #REGix to #R$B1D8.
  $B498,$01 Set #REGa to #N$00 which is used just for the comparison.
  $B499,$02 Start at the north exit.
N $B49B Move both the pointers to the next item of data (increment by two for the direction name table pointer as it contains addresses).
@ $B49B label=RoomCheckForExit_Loop
  $B49B,$01 Move to the next byte of room data.
  $B49C,$04 Increment the direction name table pointer by two.
@ $B4A0 label=RoomCheckForExit
  $B4A0,$03 Jump to #R$B49B if the current exit isn't a valid exit.
  $B4A3,$06 Get the direction name from the direction name table.
  $B4A9,$03 Call #R$AC28 to print the direction name.
  $B4AC,$02 Finish the exit sentence.
N $B4AE More than one exit was found:
@ $B4AE label=RoomMultipleExits
  $B4AE,$06 Print "#MESSAGE$AFA1" and start a new line.
  $B4B4,$02 Retrieve the room data pointer and load it into #REGhl.
  $B4B6,$04 Set a pointer in #REGix to #R$B1D8.
  $B4BA,$01 Set #REGa to #N$00 which is used just for the comparison.
  $B4BB,$02 Start at the north exit.
N $B4BD So as not to corrupt the pointer to the room data (as #REGhl is also used when printing), it's temporarily held in #REGde.
@ $B4BD label=RoomExits_Initialise
  $B4BD,$01 Bring the room data pointer back into #REGhl.
N $B4BE Move both the pointers to the next item of data (increment by two for the direction name table pointer as it contains addresses).
@ $B4BE label=RoomCheckForExits_Loop
  $B4BE,$01 Move to the next byte of room data.
  $B4BF,$04 Increment the direction name table pointer by two.
@ $B4C3 label=RoomCheckForExits
  $B4C3,$03 Jump to #R$B4BE if the current exit isn't a valid exit.
  $B4C6,$01 Temporarily store the room data pointer in #REGde.
  $B4C7,$06 Get the direction name from the direction name table.
  $B4CD,$03 Call #R$AC28 to print the direction name.
  $B4D0,$01 Decrease the valid exits count by one.
  $B4D1,$05 Jump to #R$B4E9 if there are no more exits to process.
  $B4D6,$02 Jump to #R$B4E0 if there is only one exit left to process.
N $B4D8 #HTML(Print a comma character: "<code>#CHR$2C</code>".)
  $B4D8,$02 Print a comma between the exit names.
  $B4DA,$03 Call #R$AC47 to print the character.
  $B4DD,$01 Reset #REGa back to #N$00 for the comparison.
  $B4DE,$02 Jump back to #R$B4BD to continue processing.
@ $B4E0 label=RoomExits_PrintAmpersand
  $B4E0,$06 Print "#MESSAGE$AF9D".
  $B4E6,$01 Reset #REGa back to #N$00 for the comparison.
  $B4E7,$02 Jump to #R$B4BD to continue processing.
@ $B4E9 label=RoomExits_PrintFullStop
  $B4E9,$06 Print "#MESSAGE$B10B" and start a new line.
N $B4EF Are there any objects here?
@ $B4EF label=RoomExits_YouCanSee
  $B4EF,$03 Read the current room into #REGa.
  $B4F2,$03 Call #R$B62E to see which objects are in the room.
  $B4F5,$01 Return if no objects were found at this location.
  $B4F6,$06 Print "#MESSAGE$AF8E" and start a new line.
N $B4FC Print the objects at this location.
  $B4FC,$03 Read the current room into #REGa.
  $B4FF,$03 Call #R$B400 to list the objects here.
  $B502,$01 Return.

c $B503 Get Room Pointer
@ $B503 label=GetRoomPointer
D $B503 Point at the current room's six exit bytes.
R $B503 O:HL Pointer to the room data
  $B503,$03 Read the current room into #REGa.
  $B506,$0A Turn the room number into an offset of six bytes in the room map.
  $B510,$04 Load the register pair from the room-map pointer.
  $B514,$01 Point at this room's exits.
  $B515,$01 Return.

c $B516 Print Room Description
@ $B516 label=PrintRoomDescription
D $B516 Print the description of the current room.
R $B516 A Line number to begin printing
  $B516,$03 Store #REGa in the screen line.
  $B519,$03 Call #R$AC0D to park the cursor on the current screen line.
  $B51C,$03 Read the current room into #REGa.
  $B51F,$04 Load #REGix from the room-description pointer.
  $B523,$01 Use the room number to find its description.
  $B524,$03 Call #R$B3F1 to look up the table entry.
  $B527,$03 Call #R$AC35 to print the string and start a new line.
  $B52A,$01 Return.

c $B52B Action: Examine Item
@ $B52B label=ActionExamineItem
D $B52B Carry out the "Examine Item" command.
R $B52B C Item ID
R $B52B O:F Carry flag set when the item isn't present
  $B52B,$06 Turn the search position into this object's index.
  $B531,$01 Remember the object index.
  $B532,$04 Point #REGix at the item groups.
  $B536,$03 Call #R$B3F1 to look up the table entry.
  $B539,$01 Restore the object index from the stack.
  $B53A,$02 Check the first item in this group.
@ $B53C label=ExamineItem_Loop
  $B53C,$01 Step to the next item in this group.
@ $B53D label=ExamineItem
  $B53D,$05 Jump to #R$B548 if *#REGhl is equal to #N$FF.
  $B542,$03 Call #R$B560 to find where the object is.
  $B545,$02 Jump to #R$B53C if the item wasn't found.
  $B547,$01 Return.
N $B548 The item being examined isn't in the room or in the players inventory.
@ $B548 label=Response_ItemNotHere
  $B548,$06 Print "#MESSAGE$AFE5".
N $B54E Print the object name.
  $B54E,$04 Point #REGix at the noun for this item.
  $B552,$03 Call #R$B3F1 to look up the table entry.
  $B555,$03 Call #R$AC28 to print the string.
  $B558,$06 Print "#MESSAGE$AFF2" and start a new line.
  $B55E,$01 Set the carry flag to report that the item isn't here, so the command goes no further.
  $B55F,$01 Return.

c $B560 Get Object Location
@ $B560 label=Get_ObjectLocation
D $B560 Get Object Location.
R $B562 A Object number
R $B562 O:A Location of the object
  $B560,$02 Keep the caller's pointers.
  $B562,$07 Look this object up in the item-location table.
  $B569,$03 Read the current room into #REGa.
  $B56C,$03 Branch to #R$B572 when the byte at #REGhl means the values match.
  $B56F,$03 See whether the object is in the inventory.
@ $B572 label=Get_ObjectLocation_Return
  $B572,$02 Restore the caller's pointers from the stack, keeping the zero flag from the location test.
  $B574,$01 Return.

c $B575 Match Phrase Tokens
@ $B575 label=MatchPhraseTokens
D $B575 Match Phrase Tokens.
R $B575 HL A pointer to phrase token data
R $B575 O:F The Z flag is set if the input matches any pattern
  $B575,$01 Move the phrase token pointer into #REGde.
  $B576,$02 Start the match at the first pattern byte, #R$B579.
@ $B578 label=Match_PhraseTokens_Loop
  $B578,$01 Advance #REGde to the next byte.
@ $B579 label=MatchPhraseTokens_Next
  $B579,$03 Point #REGhl at the second word token.
  $B57C,$02 Compare the command from its first word at #R$B580.
@ $B57E label=MatchPhraseTokens_Loop
  $B57E,$01 Advance #REGhl to the next byte.
  $B57F,$01 Advance #REGde to the next byte.
@ $B580 label=Match_PhraseTokens_Compare
  $B580,$01 Read the next vocabulary byte into #REGa.
  $B581,$03 Branch to #R$B57E when the byte at #REGhl means the values match.
  $B584,$04 Branch to #R$B58C when #N$FE means the values differ.
  $B588,$04 Accept the phrase when the command has ended.
@ $B58C label=Match_PhraseTokens_Alternative
  $B58C,$04 Branch to #R$B596 when #N$FD means the values differ.
  $B590,$06 Match this alternative when the command has ended, and try the next one when the player typed another word.
@ $B596 label=Match_PhraseTokens_Skip
  $B596,$01 Advance #REGde to the next byte.
  $B597,$01 Read the next vocabulary byte into #REGa.
  $B598,$04 Branch to #R$B5A2 when #N$FE means the values match.
  $B59C,$04 Branch to #R$B596 when #N$FD means the values differ.
  $B5A0,$02 Try the next phrase alternative at #R$B578.
@ $B5A2 label=Match_PhraseTokens_Done
  $B5A2,$01 Test #REGa so the following branch can see whether it is zero.
  $B5A3,$01 Return.

c $B5A4 Parser: Count Item References
@ $B5A4 label=ParserCountItemReferences
D $B5A4 Parser: Count Item References.
R $B5A4 O:A The number of references to items in the user input tokens
R $B5A4 O:E As #REGa
R $B5A4 O:F The Z flag is set when there are no items present in the input
  $B5A4,$03 Set a pointer to the first word token in #REGhl.
  $B5A7,$02 Set a token count in #REGb of #N$0A which is the total length of
. the user input tokens.
  $B5A9,$02 Initialise the item counter held in #REGe to #N$00.
@ $B5AB label=Parser_CountItems_Loop
  $B5AB,$01 Fetch a user input token.
  $B5AC,$04 Jump to #R$B5C3 if the terminator character (#N$FF) has been
. reached.
  $B5B0,$02 Remember the token and the count while the object list is searched.
  $B5B2,$03 Load the pointer for the character-set pointer into #REGhl.
  $B5B5,$04 Fetch the count of the number of items in the table from the object count.
  $B5B9,$02 Search to see if the item room ID is in the table.
  $B5BB,$02 Restore #REGbc, #REGhl from the stack.
  $B5BD,$02 Jump to #R$B5C0 if this token doesn't refer to a game item.
N $B5BF This token does point to a game item, so increase the item counter.
  $B5BF,$01 Increment item counter by one.
@ $B5C0 label=Parser_CountItems_Skip
  $B5C0,$01 Move to the next token.
  $B5C1,$02 Decrease the token counter by one and loop back to #R$B5AB until
. all the tokens have been evaluated.
@ $B5C3 label=Parser_CountItems_Process
  $B5C3,$02 Leave the number of items named in the command in #REGa. The zero flag is set when none were named.
  $B5C5,$01 Return.

c $B5C6 Get Item Room
@ $B5C6 label=GetItemRoom
D $B5C6 Get Item Room.
  $B5C6,$07 Look this item up in the item-location table.
  $B5CD,$01 Read the room that holds this item.
  $B5CE,$01 Return.

c $B5CF Is Object In Inventory?
@ $B5CF label=IsObjectInInventory
D $B5CF Is Object In Inventory?.
R $B5CF A Object ID
R $B5CF O:F Z flag set if object is in the players inventory
N $B5CF The #R$B5C6 routine returns with #REGa containing the room ID of the requested object.
  $B5CF,$03 Call #R$B5C6.
  $B5D2,$02 See whether that room is the inventory.
  $B5D4,$01 Return.

c $B5D5 Handler: Destroy Item/ Event
@ $B5D5 label=HandlerDestroyItemEvent
D $B5D5 Destroy Item/ Event.
R $B5D5 A Item/ event ID
  $B5D5,$01 Hold the item while its room is cleared.
  $B5D6,$05 Call #R$B5FD to store the item's room.
  $B5DB,$01 Return.

c $B5DC Handler: Update Item/ Event For The Current Room
@ $B5DC label=HandlerUpdateItemEventForTheCurrentRoom
D $B5DC Update Item/ Event For The Current Room.
R $B5DC A Item/ event ID
  $B5DC,$01 Hold the item while the current room is read.
  $B5DD,$03 Read the current room into #REGa.
  $B5E0,$01 Give the item the player's current room.
  $B5E1,$03 Call #R$B5FD to store the item's room.
  $B5E4,$01 Return.

c $B5E5 Handler: Set Scenic Event As Triggered
@ $B5E5 label=ScenicEventTriggered
D $B5E5 Mark the scenic event in #REGa as already fired. The scenic-event
. count is zero, so nothing calls this routine.
R $B5E5 A Scenic event id
  $B5E5,$01 Copy the scenic event id into #REGb.
  $B5E6,$02 Use #N$FF for #REGc so the event is not repeated.
  $B5E8,$03 Call #R$B5FD to store the item's room.
  $B5EB,$01 Return.

c $B5EC Check Active Scenic Events
@ $B5EC label=CheckActiveScenicEvents
D $B5EC Check Active Scenic Events.
R $B5EC HL Pointer to scenic data
R $B5EC O:A The listed item that is here, or #N$FF if there is none
R $B5EC O:F The zero flag is set when an item on the list is here or carried
  $B5EC,$02 Check the first scenic item at #R$B5EF.
@ $B5EE label=CheckActiveScenicEvents_Loop
  $B5EE,$01 Advance #REGhl to the next byte.
@ $B5EF label=CheckActiveScenicEvents_Next
  $B5EF,$01 Read the next scenic item.
  $B5F0,$04 Stop at the end of the scenic list.
  $B5F4,$03 Call #R$B560 to find where the object is.
  $B5F7,$02 Try the next entry when this one is not here or carried.
  $B5F9,$02 Return the scenic item that is here.
@ $B5FB label=Check_ActiveScenicEvents_Done
  $B5FB,$01 Clear the zero flag (#REGa holds the #N$FF end marker) to report that nothing on the list is here.
  $B5FC,$01 Return.

c $B5FD Set Item Room
@ $B5FD label=SetItemRoom
D $B5FD Set Item Room.
  $B5FD,$03 Point #REGhl at the item-location table.
  $B600,$05 Write the room into the item's slot in the item-location table.
  $B605,$01 Return.

c $B606 Find Active Scenic Event
@ $B606 label=FindActiveScenicEvent
D $B606 Walk the scenic-event list at #REGhl and return the index of the
. first one that matches.
  $B606,$02 Start the index at #N$00.
  $B608,$02 Check the first scenic event at #R$B60C.
@ $B60A label=FindActiveScenicEvent_Loop
  $B60A,$01 Advance the index in #REGb.
  $B60B,$01 Advance #REGhl to the next event.
@ $B60C label=FindActiveScenicEvent_Next
  $B60C,$03 Call #R$B5EC to check the scenic events.
  $B60F,$02 Branch to #R$B60A to count each listed item that is here, until the end of the list.
  $B611,$01 Copy the index into #REGa.
  $B612,$01 Return.

c $B613 Transform Item
@ $B613 label=TransformItem
D $B613 Transform Item.
R $B613 B From item ID (the item to be destroyed)
R $B613 C To item ID (the item to be created)
N $B613 Get the location of the "from" item so the "to" item can be created in the same place.
  $B613,$01 Copy the "from" item ID into #REGa.
  $B614,$03 Call #R$B5C6 to get the room ID where the "from" item is located
. (returns in #REGa).
  $B617,$02 Remember the items and the room while the first is removed.
N $B619 Destroy the "from" item by setting its location to #N$00 (inactive).
  $B619,$02 Set the room ID to #N$00 to deactivate the "from" item.
  $B61B,$03 Call #R$B5FD to update the "from" item's location to #N$00.
  $B61E,$02 Restore #REGaf, #REGbc from the stack.
N $B620 Create the "to" item at the same location where the "from" item was.
  $B620,$01 Copy the "to" item ID into #REGb.
  $B621,$01 Copy the location (from #REGa) into #REGc.
  $B622,$03 Call #R$B5FD to create the "to" item at the stored location.
  $B625,$01 Return.

c $B626 Is Item In Current Room
@ $B626 label=IsItemInCurrentRoom
D $B626 Compare the item's room with the room the player is in.
R $B626 A Item id
R $B626 O:F The zero flag is set when the item is in the current room
  $B626,$03 Call #R$B5C6 to read which room holds the item.
  $B629,$03 Point #REGhl at the current room.
  $B62C,$01 See whether the item is in this room.
  $B62D,$01 Return.

c $B62E Check Room Objects
@ $B62E label=CheckRoomObjects
D $B62E Check Room Objects.
R $B62E A Room number
R $B62E O:A #N$00 or #N$01 if objects are found or not
  $B62E,$03 Point #REGhl at the item-location table.
  $B631,$04 Take the length of the item-location table.
@ $B635 label=CheckRoomObjects_Loop
  $B635,$02 Search for the room number in the table.
  $B637,$01 Return if no objects are found.
  $B638,$01 Keep the object location table pointer on the stack.
  $B639,$03 Call #R$B64B to check that the object is here.
  $B63C,$01 Restore the object location table pointer from the stack.
  $B63D,$02 Jump to #R$B649 if there are no objects found here.
  $B63F,$01 Temporarily store #REGa in #REGe.
  $B640,$02 Are there more objects to check?
  $B642,$01 Put back the #REGa register.
  $B643,$02 Jump to #R$B635 if there are more objects to check.
N $B645 Set the "successful" output.
  $B645,$02 Set #REGa to #N$01 to indicate that objects were found.
  $B647,$01 Clear the zero flag to report that objects were found.
  $B648,$01 Return.
N $B649 Set the "failure" output.
@ $B649 label=NoRoomObjectsFound
  $B649,$01 Set #REGa to #N$00 to indicate that no objects were found.
  $B64A,$01 Return.

c $B64B Validate Object
@ $B64B label=ValidateObject
D $B64B Validate Object.
  $B64B,$02 Remember the room and the search position.
  $B64D,$01 Advance #REGbc to the next byte.
  $B64E,$03 Read the item count into #REGa.
  $B651,$02 Turn the search position into this item's index.
  $B653,$07 Call #R$B3F1 to look up the table entry.
  $B65A,$01 Restore the search position from the stack.
  $B65B,$01 See whether this item has a description.
  $B65C,$01 Combine #REGl into the working value.
  $B65D,$02 Reject an item that has no description.
  $B65F,$01 Restore the room ID from the stack.
  $B660,$01 Test #REGa so the following branch can see whether it is zero.
  $B661,$01 Return.
@ $B662 label=ValidateObject_Next
  $B662,$01 Restore the room ID from the stack.
  $B663,$01 Report that this item has no description.
  $B664,$01 Return.

c $B665 Parser: Validate No Direct Object
@ $B665 label=ParserValidateNoDirectObject
D $B665 Parser: Validate No Direct Object.
R $B665 O:F The Z flag is set when there's no direct object present
R $B665 O:F The carry flag is set when there's a second token set
  $B665,$06 Return if the second token (*#N$AF2F) is the terminator
. character (#N$FF).
  $B66B,$03 Call #R$B1E4 to ask the player to rephrase.
  $B66E,$01 Set the carry flag to indicate the command is malformed.
  $B66F,$01 Return.

c $B670 Parser: Validate Direct Object
@ $B670 label=ParserValidateDirectObject
D $B670 Parser: Validate Direct Object.
R $B670 O:F The carry flag is set when the command is malformed
N $B670 The first token is the verb, so target the second token for the direct object.
  $B670,$03 Fetch the #N$AF2F(second token from the user input) and store it in
. #REGa.
  $B673,$04 Jump forward to #R$B67C if the token is anything other than the
. terminator character (#N$FF).
N $B677 The token was the terminator character (#N$FF), so the sentence is malformed.
N $B677 E.g. They tried "TAKE" but didn't write anything after it.
  $B677,$03 Call #R$B1EB.
  $B67A,$01 Set the carry flag to indicate this call was a failure.
  $B67B,$01 Return.
N $B67C Process the direct object.
@ $B67C label=DirectObject_Process
  $B67C,$03 Call #R$B5A4.
  $B67F,$01 Return if #REGa is not equal to #N$FF.
  $B680,$03 Call #R$B1E4 to ask the player to rephrase.
  $B683,$01 Set the carry flag to indicate the command is malformed.
  $B684,$01 Return.

c $B685 Parser: Validate Input Tokens
@ $B685 label=Parser_ValidateInputTokens
D $B685 Check the words after the verb, and ask for a rephrase when none of
. them is a known item. Nothing calls this routine.
R $B685 O:F The carry flag is set when the command is malformed
N $B685 The first token is the verb, so read the second token.
  $B685,$03 Read the second word token into #REGa.
  $B688,$02 Compare the token with the terminator.
  $B68A,$01 Return if there is no second token.
N $B68B There is a second token, so count the known items.
  $B68B,$03 Call #R$B5A4 to count how the command refers to the item.
  $B68E,$01 Return if a known item was named.
N $B68F The words are not known items.
  $B68F,$03 Call #R$B1E4 to ask the player to rephrase.
  $B692,$01 Mark the command as malformed.
  $B693,$01 Return.

c $B694 Parser: Validate Two Direct Objects
@ $B694 label=ParserValidateTwoDirectObjects
D $B694 Parser: Validate Two Direct Objects.
R $B694 O:F The carry flag is set when the command is malformed
  $B694,$03 Call #R$B670 to check that the command names an object.
  $B697,$01 Return if there is no direct object in the user input (so the
. command is malformed).
N $B698 #REGa now contains the count of the number of valid direct objects.
  $B698,$04 Jump to #R$B6A1 if the number of valid direct objects in the user
. input is not #N$01.
N $B69C There is only one valid direct object in the user input and the command needs two...
  $B69C,$03 Call #R$B1EB to ask for a more specific command.
  $B69F,$01 Set the carry flag to report that the command is malformed.
  $B6A0,$01 Return.
N $B6A1 There are two or more valid direct objects in the user input.
@ $B6A1 label=ValidateTwoDirectObjects
  $B6A1,$04 Jump to #R$B6A7 if the number of valid direct objects in the user
. input is greater than or equal to #N$03.
  $B6A5,$01 Clear the carry flag: exactly two objects were named, so the command is valid.
  $B6A6,$01 Return.
N $B6A7 There are more than two valid direct objects in the user input.
@ $B6A7 label=ValidateTwoDirectObjects_TooMany
  $B6A7,$03 Call #R$B1E4 to ask the player to rephrase.
  $B6AA,$01 Set the carry flag to report that the command is malformed.
  $B6AB,$01 Return.

c $B6AC Parser: Validate Any Direct Object
@ $B6AC label=ParserValidateAnyDirectObject
D $B6AC Parser: Validate Any Direct Object.
R $B6AC O:A The number of valid direct objects in the user input tokens
R $B6AC O:F The carry flag is set when the command is malformed
R $B6AC O:F The zero flag is set when there are no valid direct objects present in the input tokens
N $B6AC The first token is the verb, so target the second token for the direct object.
  $B6AC,$03 Fetch the #N$AF2F(second token from the user input) and store it in
. #REGa.
  $B6AF,$04 Jump forward to #R$B6B8 if the token is anything other than the
. terminator character (#N$FF).
N $B6B3 The token was the terminator character (#N$FF), so the sentence is malformed.
N $B6B3 E.g. They tried "TAKE" but didn't write anything after it.
  $B6B3,$03 Call #R$B1EB to ask for a more specific command.
  $B6B6,$01 Set the carry flag to indicate this call was a failure.
  $B6B7,$01 Return.
N $B6B8 The user input tokens have a direct object, return how many are in the command buffer.
@ $B6B8 label=ValidateAnyDirectObject
  $B6B8,$03 Call #R$B5A4.
  $B6BB,$01 Return.

c $B6BC Parser: Process Item
@ $B6BC label=ParserProcessItem
D $B6BC Parser: Process Item.
N $B6BC Set up to loop through all word tokens in the token buffer.
  $B6BC,$03 Set a pointer to the word token buffer (the first word token) in #REGhl.
  $B6BF,$02 Set a counter in #REGb for #N$0A tokens (the maximum number of words).
N $B6C1 Check if there are any tokens to process. Return immediately if the first token is the terminator (#N$FF), meaning the input was empty.
@ $B6C1 label=ProcessItem_Loop
  $B6C1,$04 Return if the current token is #N$FF (no more tokens to process).
  $B6C5,$02 Remember the token and the count while the object list is searched.
  $B6C7,$03 Load the object list table pointer into #REGhl.
  $B6CA,$04 #HTML(Load the number of objects into #REGbc (for the <code>CPIR</code> search).)
  $B6CE,$02 Search the object list table to see if the token matches any object ID.
  $B6D0,$02 Jump to #R$B6DA if the token doesn't match any object ID (not an item token).
N $B6D2 The token matches an object ID. Now verify that the item is actually present (in the current room or player's inventory).
  $B6D2,$03 Call #R$B52B to check if the item is present and accessible.
  $B6D5,$02 Jump to #R$B6DA to check the next token if the item is here (carry flag clear).
  $B6D7,$02 Restore #REGbc, #REGhl from the stack.
  $B6D9,$01 Return with the carry flag set, as a named item isn't here.
  $B6DA,$02 Restore #REGbc, #REGhl from the stack.
  $B6DC,$01 Move to the next token in the buffer.
  $B6DD,$02 Decrease the counter by one and loop back to #R$B6C1 until all #N$0A
. tokens have been checked.
  $B6DF,$01 Return (no valid item tokens were found in the input).

b $B6E0 Data
@ $B6E0 label=Handler_ScenicEvents
  $B6E0,$05

b $B6E5 Data
@ $B6E5 label=Handler_ScenicEvents_List
  $B6E5,$06

b $B6EB Data
@ $B6EB label=Handler_ScenicEvents_Loop
  $B6EB,$07

b $B6F2 Data
@ $B6F2 label=Handler_ScenicEvents_Found
  $B6F2,$04

b $B6F6 Data
@ $B6F6 label=Handler_ScenicEvents_Dispatch
  $B6F6,$14

b $B70A Data
@ $B70A label=Handler_ScenicEvents_Restore
  $B70A,$04

b $B70E Data
@ $B70E label=Handler_ScenicEvents_Next
  $B70E,$06

c $B714 Handler: Set Current Room
@ $B714 label=Handler_SetCurrentRoom
D $B714 Move the player into the room held in #REGa and update events there.
  $B714,$01 Remember the destination room.
  $B715,$03 Read the scenic-event count into #REGa.
  $B718,$03 Skip scenic events when the game defines none.
  $B71B,$01 Take the scenic-event count.
  $B71C,$03 Load the word at *#R$AEEC into #REGhl.
  $B71F,$02 Read the first scenic item at #R$B722.
@ $B721 label=Handler_SetCurrentRoom_Loop
  $B721,$01 Advance #REGhl to the next byte.
@ $B722 label=Handler_SetCurrentRoom_Scenic
  $B722,$01 Read this scenic item.
  $B723,$03 Call #R$B560 to find where the object is.
  $B726,$02 Leave a scenic item that is not here.
  $B728,$02 Keep this scenic item while it is moved.
  $B72A,$01 Read the buffer byte into #REGb.
  $B72B,$03 Call #R$B5FD to store the item's room.
  $B72E,$02 Restore the scenic item count and this scenic item from the stack.
@ $B730 label=Handler_SetCurrentRoom_ScenicNext
  $B730,$02 Count down #REGb and repeat from #R$B721 until the count is exhausted.
@ $B732 label=Handler_SetCurrentRoom_Next
  $B732,$01 Restore the destination room.
  $B733,$03 Store #REGa in the current room.
  $B736,$03 Read the event-state flags into #REGa.
  $B739,$02 Leave the turn-based events alone when none are armed.
  $B73B,$02 Use #N$08 as the count in #REGb.
  $B73D,$03 Point #REGhl at the turn-based event items.
  $B740,$01 Hold the event flags while each one is tested.
  $B741,$02 Test the first turn-based event at #R$B744.
@ $B743 label=Handler_SetCurrentRoom_EventLoop
  $B743,$01 Advance #REGhl to the next byte.
@ $B744 label=Handler_SetCurrentRoom_Event
  $B744,$02 Test the next turn-based event flag.
  $B746,$02 Branch to #R$B750 when the carry flag is clear.
  $B748,$01 Read the item this event places in the room.
  $B749,$02 Keep this turn-based event while its item is placed.
  $B74B,$03 Call #R$B5DC to update the item for this room.
  $B74E,$02 Restore the event count and flags, and this turn-based event from the stack.
@ $B750 label=Handler_SetCurrentRoom_EventNext
  $B750,$02 Count down #REGb and repeat from #R$B743 until the count is exhausted.
  $B752,$01 Return.

c $B753 Handler: Match Verb
@ $B753 label=HandlerMatchVerb
D $B753 Turn the first word token into a verb and run its action.
N $B753 Set up to search the verb word tokens table for the first word token.
  $B753,$03 Set a pointer to the verb-token pointer in #REGhl.
  $B756,$04 Load the verb-token count tokens into #REGbc for the search.
  $B75A,$03 Get the the first word token from the user input.
  $B75D,$02 Search the verb word tokens table for a matching token.
  $B75F,$02 Jump to #R$B768 if a match was found (Z flag is set).
N $B761 The token doesn't match any verb.
  $B761,$06 Print "#MESSAGE$AF59" and start a new line.
  $B767,$01 Return.
@ $B768 label=VerbMatched
N $B768 A verb was matched! Calculate its index in the table and jump to its handler routine.
  $B768,$04 Calculate the verb index: #REGa=the verb-token count-#REGc (total tokens minus
. remaining tokens after match).
  $B76C,$01 Adjust the index (decrease by one, as indices are zero-based).
  $B76D,$01 Store the verb index in #REGe for the table lookup.
  $B76E,$04 Set a pointer to the verb-jump pointer in #REGix.
  $B772,$03 Call #R$B3F1 to get the address of the verb handler routine for this
. index.
  $B775,$01 Jump to the verb handler routine to execute the command.

c $B776 Pause, Print String And Scroll
@ $B776 label=PausePrintStringAndScroll
D $B776 Pause, Print String And Scroll.
  $B776,$05 Call #R$AC65 to pause for the frame count in #REGb.
  $B77B,$03 Call #R$AC35 to print the string and start a new line.
  $B77E,$01 Return.

c $B77F Generate Random Number
@ $B77F label=GenerateRandomNumber
D $B77F Pick a number below the limit in #REGa.
R $B77F A Maximum value of generated number
  $B77F,$01 Remember the caller's registers.
  $B780,$01 Remember the upper limit.
  $B781,$03 Call #R$AC69 to read the frame counter.
  $B784,$02 Use the frame counter as the spin count.
@ $B786 label=GenerateRandomNumber_Loop
  $B786,$04 Count down inside the limit.
@ $B78A label=GenerateRandomNumber_Next
  $B78A,$02 Count down #REGb and repeat from #R$B786 until the count is exhausted.
  $B78C,$01 Step the count in #REGa down.
  $B78D,$01 Restore the caller's #REGbc from the stack, leaving the random number in #REGa.
  $B78E,$01 Return.

c $B78F Add To Score
@ $B78F label=AddToScore
D $B78F Add the points in #REGa to the BCD score.
  $B78F,$01 Remember the caller's pointer.
  $B790,$03 Load the word at the score into #REGhl.
  $B793,$03 Add the points into the decimal score.
  $B796,$02 Branch to #R$B799 when the carry flag is clear.
  $B798,$01 Advance the count in #REGh.
@ $B799 label=AddToScore_Next
  $B799,$03 Store #REGhl in the score.
  $B79C,$01 Restore the caller's pointer from the stack.
  $B79D,$01 Return.

c $B79E Messaging: "You Have Scored"
@ $B79E label=Messaging_YouHaveScored_Print
D $B79E Print "You Have Scored"
N $B79E Print it: #MESSAGE$B1C4.
  $B79E,$06 Point at the message and print it.
  $B7A4,$03 Load the word at the score into #REGhl.
  $B7A7,$01 Take the hundreds digit.
  $B7A8,$04 Skip a leading zero in the hundreds digit.
  $B7AC,$02 Add #N$30.
  $B7AE,$03 Call #R$AC47 to print the character.
@ $B7B1 label=PrintScore_Tens
  $B7B1,$01 Take the tens and units.
  $B7B2,$04 Print the tens digit when it is not zero.
  $B7B6,$04 Skip a leading zero in the tens digit.
  $B7BA,$01 The tens digit is zero but there is a hundreds digit, so print a "0".
@ $B7BB label=PrintScore_TensDigit
  $B7BB,$04 Move the tens digit into the low four bits.
  $B7BF,$02 Add #N$30.
  $B7C1,$03 Call #R$AC47 to print the character.
@ $B7C4 label=PrintScore_Units
  $B7C4,$01 Take the units digit.
  $B7C5,$02 Mask with #N$0F.
  $B7C7,$02 Add #N$30.
  $B7C9,$03 Call #R$AC47 to print the character.
N $B7CC Print it and start a new line: #MESSAGE$B1D5.
  $B7CC,$06 Point at the message and print it and start a new line.
  $B7D2,$01 Return.

c $B7D3 Handler: Dispatch Matching Phrase
@ $B7D3 label=Handler_DispatchPhrase
D $B7D3 Find the phrase pattern that matches the command and jump to its handler.
  $B7D3,$03 Copy the phrase table from #REGhl into #REGix.
@ $B7D6 label=Handler_DispatchPhrase_Loop
  $B7D6,$0D Call #R$B575 to match the phrase tokens.
  $B7E3,$04 Restore the phrase count and the handler and phrase table pointers from the stack.
  $B7E7,$02 Try the next phrase when this one does not match.
  $B7E9,$03 Copy the handler address from #REGde into #REGix.
  $B7EC,$06 Read the handler for this phrase.
  $B7F2,$01 Drop the return address into the action routine, so the phrase handler returns straight to its caller.
  $B7F3,$01 Jump to the handler address now in #REGhl.
@ $B7F4 label=Handler_DispatchPhrase_Next
  $B7F4,$04 Step to the next phrase entry.
  $B7F8,$01 Advance #REGde to the next byte.
  $B7F9,$01 Advance #REGde to the next byte.
  $B7FA,$01 Move #REGbc back one byte.
  $B7FB,$02 See whether another phrase remains.
  $B7FD,$02 Match the next phrase.
  $B7FF,$01 Return.

c $B800 Game Cold Start
@ $B800 label=GameColdStart
D $B800 Game Cold Start.
  $B800,$03 Continue at #R$E99E.

t $B803 Messaging: "Beren,the King."
@ $B803 label=Messaging_BerenTheKing
  $B803,$0F "#MESSAGE$B803".
B $B812,$01 Terminator.

t $B813 Messaging: "Istar,the wizard."
@ $B813 label=Messaging_IstarTheWizard
  $B813,$11 "#MESSAGE$B813".
B $B824,$01 Terminator.

t $B825 Messaging: "Haldir,the minstrel."
@ $B825 label=Messaging_HaldirTheMinstrel
  $B825,$14 "#MESSAGE$B825".
B $B839,$01 Terminator.

t $B83A Messaging: "Khadim,the dwarf."
@ $B83A label=Messaging_KhadimTheDwarf
  $B83A,$11 "#MESSAGE$B83A".
B $B84B,$01 Terminator.

t $B84C Messaging: "A tinderbox."
@ $B84C label=Messaging_ATinderbox
  $B84C,$0C "#MESSAGE$B84C".
B $B858,$01 Terminator.

t $B859 Messaging: "A frog."
@ $B859 label=Messaging_AFrog
  $B859,$07 "#MESSAGE$B859".
B $B860,$01 Terminator.

t $B861 Messaging: "A swamp lizard."
@ $B861 label=Messaging_ASwampLizard
  $B861,$0F "#MESSAGE$B861".
B $B870,$01 Terminator.

t $B871 Messaging: "A bear."
@ $B871 label=Messaging_ABear
  $B871,$07 "#MESSAGE$B871".
B $B878,$01 Terminator.

t $B879 Messaging: "A sleeping bear."
@ $B879 label=Messaging_ASleepingBear
  $B879,$10 "#MESSAGE$B879".
B $B889,$01 Terminator.

t $B88A Messaging: "Copper gates,to the South."
@ $B88A label=Messaging_CopperGatesToTheSouth
  $B88A,$1A "#MESSAGE$B88A".
B $B8A4,$01 Terminator.

t $B8A5 Messaging: "The gates are open."
@ $B8A5 label=Messaging_TheGatesAreOpen
  $B8A5,$13 "#MESSAGE$B8A5".
B $B8B8,$01 Terminator.

t $B8B9 Messaging: "The gates are closed."
@ $B8B9 label=Messaging_TheGatesAreClosed
  $B8B9,$15 "#MESSAGE$B8B9".
B $B8CE,$01 Terminator.

t $B8CF Messaging: "Copper gates,to the North."
@ $B8CF label=Messaging_CopperGatesToTheNorth
  $B8CF,$1A "#MESSAGE$B8CF".
B $B8E9,$01 Terminator.

t $B8EA Messaging: "Jewelled gates,to the East."
@ $B8EA label=Messaging_JewelledGatesToTheEast
  $B8EA,$1B "#MESSAGE$B8EA".
B $B905,$01 Terminator.

t $B906 Messaging: "Jewelled gates,to the West."
@ $B906 label=Messaging_JewelledGatesToTheWest
  $B906,$1B "#MESSAGE$B906".
B $B921,$01 Terminator.

t $B922 Messaging: "Golden gates,to the South."
@ $B922 label=Messaging_GoldenGatesToTheSouth
  $B922,$1A "#MESSAGE$B922".
B $B93C,$01 Terminator.

t $B93D Messaging: "Golden gates,to the North."
@ $B93D label=Messaging_GoldenGatesToTheNorth
  $B93D,$1A "#MESSAGE$B93D".
B $B957,$01 Terminator.

t $B958 Messaging: "Some money."
@ $B958 label=Messaging_SomeMoney
  $B958,$0B "#MESSAGE$B958".
B $B963,$01 Terminator.

t $B964 Messaging: "A barrowight."
@ $B964 label=Messaging_ABarrowight
  $B964,$0D "#MESSAGE$B964".
B $B971,$01 Terminator.

t $B972 Messaging: "A bible."
@ $B972 label=Messaging_ABible
  $B972,$08 "#MESSAGE$B972".
B $B97A,$01 Terminator.

t $B97B Messaging: "A wand."
@ $B97B label=Messaging_AWand
  $B97B,$07 "#MESSAGE$B97B".
B $B982,$01 Terminator.

t $B983 Messaging: "A scroll."
@ $B983 label=Messaging_AScroll
  $B983,$09 "#MESSAGE$B983".
B $B98C,$01 Terminator.

t $B98D Messaging: "A silver flute."
@ $B98D label=Messaging_ASilverFlute
  $B98D,$0F "#MESSAGE$B98D".
B $B99C,$01 Terminator.

t $B99D Messaging: "A carpet."
@ $B99D label=Messaging_ACarpet
  $B99D,$09 "#MESSAGE$B99D".
B $B9A6,$01 Terminator.

t $B9A7 Messaging: "A jewelled key."
@ $B9A7 label=Messaging_AJewelledKey
  $B9A7,$0F "#MESSAGE$B9A7".
B $B9B6,$01 Terminator.

t $B9B7 Messaging: "A spirit."
@ $B9B7 label=Messaging_ASpirit
  $B9B7,$09 "#MESSAGE$B9B7".
B $B9C0,$01 Terminator.

t $B9C1 Messaging: "A songbird."
@ $B9C1 label=Messaging_ASongbird
  $B9C1,$0B "#MESSAGE$B9C1".
B $B9CC,$01 Terminator.

t $B9CD Messaging: "A songbird in a wicker cage."
@ $B9CD label=Messaging_ASongbirdInAWickerCage
  $B9CD,$1C "#MESSAGE$B9CD".
B $B9E9,$01 Terminator.

t $B9EA Messaging: "A balrog."
@ $B9EA label=Messaging_ABalrog
  $B9EA,$09 "#MESSAGE$B9EA".
B $B9F3,$01 Terminator.

t $B9F4 Messaging: "A crystal bridge over the chasm."
@ $B9F4 label=Messaging_ACrystalBridgeOverTheChasm
  $B9F4,$20 "#MESSAGE$B9F4".
B $BA14,$01 Terminator.

t $BA15 Messaging: "A sword."
@ $BA15 label=Messaging_ASword
  $BA15,$08 "#MESSAGE$BA15".
B $BA1D,$01 Terminator.

t $BA1E Messaging: "A spear."
@ $BA1E label=Messaging_ASpear
  $BA1E,$08 "#MESSAGE$BA1E".
B $BA26,$01 Terminator.

t $BA27 Messaging: "A dagger."
@ $BA27 label=Messaging_ADagger
  $BA27,$09 "#MESSAGE$BA27".
B $BA30,$01 Terminator.

t $BA31 Messaging: "A velvet pillow."
@ $BA31 label=Messaging_AVelvetPillow
  $BA31,$10 "#MESSAGE$BA31".
B $BA41,$01 Terminator.

t $BA42 Messaging: "A falcon."
@ $BA42 label=Messaging_AFalcon
  $BA42,$09 "#MESSAGE$BA42".
B $BA4B,$01 Terminator.

t $BA4C Messaging: "A bottle."
@ $BA4C label=Messaging_ABottle
  $BA4C,$09 "#MESSAGE$BA4C".
B $BA55,$01 Terminator.

t $BA56 Messaging: "A bottle of water."
@ $BA56 label=Messaging_ABottleOfWater
  $BA56,$12 "#MESSAGE$BA56".
B $BA68,$01 Terminator.

t $BA69 Messaging: "A bottle of acid."
@ $BA69 label=Messaging_ABottleOfAcid
  $BA69,$11 "#MESSAGE$BA69".
B $BA7A,$01 Terminator.

t $BA7B Messaging: "A bottle of oil."
@ $BA7B label=Messaging_ABottleOfOil
  $BA7B,$10 "#MESSAGE$BA7B".
B $BA8B,$01 Terminator.

t $BA8C Messaging: "A broken bottle."
@ $BA8C label=Messaging_ABrokenBottle
  $BA8C,$10 "#MESSAGE$BA8C".
B $BA9C,$01 Terminator.

t $BA9D Messaging: "A serpent."
@ $BA9D label=Messaging_ASerpent
  $BA9D,$0A "#MESSAGE$BA9D".
B $BAA7,$01 Terminator.

t $BAA8 Messaging: "A dead serpent."
@ $BAA8 label=Messaging_ADeadSerpent
  $BAA8,$0F "#MESSAGE$BAA8".
B $BAB7,$01 Terminator.

t $BAB8 Messaging: "Istar,held behind crystal bars."
@ $BAB8 label=Messaging_IstarHeldBehindCrystalBars
  $BAB8,$1F "#MESSAGE$BAB8".
B $BAD7,$01 Terminator.

t $BAD8 Messaging: "A golden lyre."
@ $BAD8 label=Messaging_AGoldenLyre
  $BAD8,$0E "#MESSAGE$BAD8".
B $BAE6,$01 Terminator.

t $BAE7 Messaging: "A mandolin."
@ $BAE7 label=Messaging_AMandolin
  $BAE7,$0B "#MESSAGE$BAE7".
B $BAF2,$01 Terminator.

t $BAF3 Messaging: "A gold key."
@ $BAF3 label=Messaging_AGoldKey
  $BAF3,$0B "#MESSAGE$BAF3".
B $BAFE,$01 Terminator.

t $BAFF Messaging: "A hydra."
@ $BAFF label=Messaging_AHydra
  $BAFF,$08 "#MESSAGE$BAFF".
B $BB07,$01 Terminator.

t $BB08 Messaging: "A dead hydra."
@ $BB08 label=Messaging_ADeadHydra
  $BB08,$0D "#MESSAGE$BB08".
B $BB15,$01 Terminator.

t $BB16 Messaging: "A ruby."
@ $BB16 label=Messaging_ARuby
  $BB16,$07 "#MESSAGE$BB16".
B $BB1D,$01 Terminator.

t $BB1E Messaging: "A pool of oil."
@ $BB1E label=Messaging_APoolOfOil
  $BB1E,$0E "#MESSAGE$BB1E".
B $BB2C,$01 Terminator.

t $BB2D Messaging: "A pool of acid."
@ $BB2D label=Messaging_APoolOfAcid
  $BB2D,$0F "#MESSAGE$BB2D".
B $BB3C,$01 Terminator.

t $BB3D Messaging: "A diamond."
@ $BB3D label=Messaging_ADiamond
  $BB3D,$0A "#MESSAGE$BB3D".
B $BB47,$01 Terminator.

t $BB48 Messaging: "A venomous spider."
@ $BB48 label=Messaging_AVenomousSpider
  $BB48,$12 "#MESSAGE$BB48".
B $BB5A,$01 Terminator.

t $BB5B Messaging: "A sleeping spider."
@ $BB5B label=Messaging_ASleepingSpider
  $BB5B,$12 "#MESSAGE$BB5B".
B $BB6D,$01 Terminator.

t $BB6E Messaging: "A rusty,iron chest."
@ $BB6E label=Messaging_ARustyIronChest
  $BB6E,$13 "#MESSAGE$BB6E".
B $BB81,$01 Terminator.

t $BB82 Messaging: "A chest with oiled hinges."
@ $BB82 label=Messaging_AChestWithOiledHinges
  $BB82,$1A "#MESSAGE$BB82".
B $BB9C,$01 Terminator.

t $BB9D Messaging: "An open chest."
@ $BB9D label=Messaging_AnOpenChest
  $BB9D,$0E "#MESSAGE$BB9D".
B $BBAB,$01 Terminator.

t $BBAC Messaging: "A coffin."
@ $BBAC label=Messaging_ACoffin
  $BBAC,$09 "#MESSAGE$BBAC".
B $BBB5,$01 Terminator.

t $BBB6 Messaging: "An open coffin."
@ $BBB6 label=Messaging_AnOpenCoffin
  $BBB6,$0F "#MESSAGE$BBB6".
B $BBC5,$01 Terminator.

t $BBC6 Messaging: "A vampire."
@ $BBC6 label=Messaging_AVampire
  $BBC6,$0A "#MESSAGE$BBC6".
B $BBD0,$01 Terminator.

t $BBD1 Messaging: "The Black Knight."
@ $BBD1 label=Messaging_TheBlackKnight
  $BBD1,$11 "#MESSAGE$BBD1".
B $BBE2,$01 Terminator.

t $BBE3 Messaging: "The body of the Black Knight."
@ $BBE3 label=Messaging_TheBodyOfTheBlackKnight
  $BBE3,$1D "#MESSAGE$BBE3".
B $BC00,$01 Terminator.

t $BC01 Messaging: "A jade flower."
@ $BC01 label=Messaging_AJadeFlower
  $BC01,$0E "#MESSAGE$BC01".
B $BC0F,$01 Terminator.

t $BC10 Messaging: "Some jade fragments."
@ $BC10 label=Messaging_SomeJadeFragments
  $BC10,$14 "#MESSAGE$BC10".
B $BC24,$01 Terminator.

t $BC25 Messaging: "A waterfall."
@ $BC25 label=Messaging_AWaterfall
  $BC25,$0C "#MESSAGE$BC25".
B $BC31,$01 Terminator.

t $BC32 Messaging: "A wooden box."
@ $BC32 label=Messaging_AWoodenBox
  $BC32,$0D "#MESSAGE$BC32".
B $BC3F,$01 Terminator.

t $BC40 Messaging: "A sapphire."
@ $BC40 label=Messaging_ASapphire
  $BC40,$0B "#MESSAGE$BC40".
B $BC4B,$01 Terminator.

t $BC4C Messaging: "A dragon."
@ $BC4C label=Messaging_ADragon
  $BC4C,$09 "#MESSAGE$BC4C".
B $BC55,$01 Terminator.

t $BC56 Messaging: "A dead dragon."
@ $BC56 label=Messaging_ADeadDragon
  $BC56,$0E "#MESSAGE$BC56".
B $BC64,$01 Terminator.

t $BC65 Messaging: "A crowbar."
@ $BC65 label=Messaging_ACrowbar
  $BC65,$0A "#MESSAGE$BC65".
B $BC6F,$01 Terminator.

t $BC70 Messaging: "A shovel."
@ $BC70 label=Messaging_AShovel
  $BC70,$09 "#MESSAGE$BC70".
B $BC79,$01 Terminator.

t $BC7A Messaging: "A map."
@ $BC7A label=Messaging_AMap
  $BC7A,$06 "#MESSAGE$BC7A".
B $BC80,$01 Terminator.

t $BC81 Messaging: "A pirate."
@ $BC81 label=Messaging_APirate
  $BC81,$09 "#MESSAGE$BC81".
B $BC8A,$01 Terminator.

t $BC8B Messaging: "A dead pirate."
@ $BC8B label=Messaging_ADeadPirate
  $BC8B,$0E "#MESSAGE$BC8B".
B $BC99,$01 Terminator.

t $BC9A Messaging: "A wicker cage."
@ $BC9A label=Messaging_AWickerCage
  $BC9A,$0E "#MESSAGE$BC9A".
B $BCA8,$01 Terminator.

t $BCA9 Messaging: "A silver coin."
@ $BCA9 label=Messaging_ASilverCoin
  $BCA9,$0E "#MESSAGE$BCA9".
B $BCB7,$01 Terminator.

t $BCB8 Messaging: "Firegates lay North,East & West."
@ $BCB8 label=Messaging_FiregatesLayNorthEastWest
  $BCB8,$20 "#MESSAGE$BCB8".
B $BCD8,$01 Terminator.

t $BCD9 Messaging: "A firegate to the South."
@ $BCD9 label=Messaging_AFiregateToTheSouth
  $BCD9,$18 "#MESSAGE$BCD9".
B $BCF1,$01 Terminator.

t $BCF2 Messaging: "A firegate to the East."
@ $BCF2 label=Messaging_AFiregateToTheEast
  $BCF2,$17 "#MESSAGE$BCF2".
B $BD09,$01 Terminator.

t $BD0A Messaging: "A firegate to the West."
@ $BD0A label=Messaging_AFiregateToTheWest
  $BD0A,$17 "#MESSAGE$BD0A".
B $BD21,$01 Terminator.

t $BD22 Messaging: "A black potion."
@ $BD22 label=Messaging_ABlackPotion
  $BD22,$0F "#MESSAGE$BD22".
B $BD31,$01 Terminator.

t $BD32 Messaging: "A white potion."
@ $BD32 label=Messaging_AWhitePotion
  $BD32,$0F "#MESSAGE$BD32".
B $BD41,$01 Terminator.

t $BD42 Messaging: "A copper key."
@ $BD42 label=Messaging_ACopperKey
  $BD42,$0D "#MESSAGE$BD42".
B $BD4F,$01 Terminator.

t $BD50 Messaging: "The guard,looking at you through the bars."
@ $BD50 label=Messaging_TheGuardLookingAtYouThroughTheBars
  $BD50,$2A "#MESSAGE$BD50".
B $BD7A,$01 Terminator.

t $BD7B Messaging: "The door is open."
@ $BD7B label=Messaging_TheDoorIsOpen
  $BD7B,$11 "#MESSAGE$BD7B".
B $BD8C,$01 Terminator.

t $BD8D Messaging: "The door is closed."
@ $BD8D label=Messaging_TheDoorIsClosed
  $BD8D,$13 "#MESSAGE$BD8D".
B $BDA0,$01 Terminator.

t $BDA1 Messaging: "Some honey."
@ $BDA1 label=Messaging_SomeHoney
  $BDA1,$0B "#MESSAGE$BDA1".
B $BDAC,$01 Terminator.

t $BDAD Messaging: "Some meat."
@ $BDAD label=Messaging_SomeMeat
  $BDAD,$0A "#MESSAGE$BDAD".
B $BDB7,$01 Terminator.

t $BDB8 Messaging: "An emerald."
@ $BDB8 label=Messaging_AnEmerald
  $BDB8,$0B "#MESSAGE$BDB8".
B $BDC3,$01 Terminator.

t $BDC4 Messaging: "A giant clam,tightly closed."
@ $BDC4 label=Messaging_AGiantClamTightlyClosed
  $BDC4,$1C "#MESSAGE$BDC4".
B $BDE0,$01 Terminator.

t $BDE1 Messaging: "An open clam."
@ $BDE1 label=Messaging_AnOpenClam
  $BDE1,$0D "#MESSAGE$BDE1".
B $BDEE,$01 Terminator.

t $BDEF Messaging: "A pearl."
@ $BDEF label=Messaging_APearl
  $BDEF,$08 "#MESSAGE$BDEF".
B $BDF7,$01 Terminator.

t $BDF8 Messaging: "A tiny plant."
@ $BDF8 label=Messaging_ATinyPlant
  $BDF8,$0D "#MESSAGE$BDF8".
B $BE05,$01 Terminator.

t $BE06 Messaging: "A plant,6 feet in height."
@ $BE06 label=Messaging_APlant6FeetInHeight
  $BE06,$19 "#MESSAGE$BE06".
B $BE1F,$01 Terminator.

t $BE20 Messaging: "A massive beanstalk."
@ $BE20 label=Messaging_AMassiveBeanstalk
  $BE20,$14 "#MESSAGE$BE20".
B $BE34,$01 Terminator.

t $BE35 Messaging: "A witch."
@ $BE35 label=Messaging_AWitch
  $BE35,$08 "#MESSAGE$BE35".
B $BE3D,$01 Terminator.

t $BE3E Messaging: "A dead witch."
@ $BE3E label=Messaging_ADeadWitch
  $BE3E,$0D "#MESSAGE$BE3E".
B $BE4B,$01 Terminator.

t $BE4C Messaging: "A silver cross."
@ $BE4C label=Messaging_ASilverCross
  $BE4C,$0F "#MESSAGE$BE4C".
B $BE5B,$01 Terminator.

t $BE5C Messaging: "A giant bat."
@ $BE5C label=Messaging_AGiantBat
  $BE5C,$0C "#MESSAGE$BE5C".
B $BE68,$01 Terminator.

t $BE69 Messaging: "A dead bat."
@ $BE69 label=Messaging_ADeadBat
  $BE69,$0B "#MESSAGE$BE69".
B $BE74,$01 Terminator.

t $BE75 Messaging: "A magic mirror."
@ $BE75 label=Messaging_AMagicMirror
  $BE75,$0F "#MESSAGE$BE75".
B $BE84,$01 Terminator.

t $BE85 Messaging: "Anton,the Gypsy King. He says 'Find me a magic..."
@ $BE85 label=Messaging_AntonTheGypsyKingFind
  $BE85,$54 "#MESSAGE$BE85".
B $BED9,$01 Terminator.

t $BEDA Messaging: "Anton,the Gypsy King. He says 'Cross my palm w..."
@ $BEDA label=Messaging_AntonTheGypsyKingCross
  $BEDA,$3A "#MESSAGE$BEDA".
B $BF14,$01 Terminator.

t $BF15 Messaging: "Some hot ashes."
@ $BF15 label=Messaging_SomeHotAshes
  $BF15,$0F "#MESSAGE$BF15".
B $BF24,$01 Terminator.

t $BF25 Messaging: "A phoenix."
@ $BF25 label=Messaging_APhoenix
  $BF25,$0A "#MESSAGE$BF25".
B $BF2F,$01 Terminator.

t $BF30 Messaging: "A jade flower,resting on a velvet pillow."
@ $BF30 label=Messaging_AJadeFlowerRestingOnAVelvetPillow
  $BF30,$29 "#MESSAGE$BF30".
B $BF59,$01 Terminator.

t $BF5A Messaging: "The top of a giant beanstalk."
@ $BF5A label=Messaging_TheTopOfAGiantBeanstalk
  $BF5A,$1D "#MESSAGE$BF5A".
B $BF77,$01 Terminator.

t $BF78 Messaging: "Inside the Ruined Cottage."
@ $BF78 label=Messaging_InsideTheRuinedCottage
  $BF78,$1A "#MESSAGE$BF78".
B $BF92,$01 Terminator.

t $BF93 Messaging: "In the Field,to the East of a ruined cottage."
@ $BF93 label=Messaging_InTheFieldToTheEastOfARuinedCottage
  $BF93,$2D "#MESSAGE$BF93".
B $BFC0,$01 Terminator.

t $BFC1 Messaging: "The Open Moorland. The ground rises to the East."
@ $BFC1 label=Messaging_TheOpenMoorland
  $BFC1,$30 "#MESSAGE$BFC1".
B $BFF1,$01 Terminator.

t $BFF2 Messaging: "High on the Moors. It is bleak and desolate he..."
@ $BFF2 label=Messaging_HighOnTheMoors
  $BFF2,$4F "#MESSAGE$BFF2".
B $C041,$01 Terminator.

t $C042 Messaging: "The Dead Marshes. Rotting,reed-strewn undergro..."
@ $C042 label=Messaging_TheDeadMarshes
  $C042,$67 "#MESSAGE$C042".
B $C0A9,$01 Terminator.

t $C0AA Messaging: "The Narrow Path. Marshlands lay to West."
@ $C0AA label=Messaging_TheNarrowPath
  $C0AA,$28 "#MESSAGE$C0AA".
B $C0D2,$01 Terminator.

t $C0D3 Messaging: "The Valley. Wedged between the mountains, lush..."
@ $C0D3 label=Messaging_TheValley
  $C0D3,$61 "#MESSAGE$C0D3".
B $C134,$01 Terminator.

t $C135 Messaging: "The Gates of Karn. Fashioned from copper,the m..."
@ $C135 label=Messaging_TheGatesOfKarn
  $C135,$62 "#MESSAGE$C135".
B $C197,$01 Terminator.

t $C198 Messaging: "The Deserted Village. North of the Long Barrow."
@ $C198 label=Messaging_TheDesertedVillage
  $C198,$2F "#MESSAGE$C198".
B $C1C7,$01 Terminator.

t $C1C8 Messaging: "The Plain of Stones. There are buildings to th..."
@ $C1C8 label=Messaging_ThePlainOfStones
  $C1C8,$35 "#MESSAGE$C1C8".
B $C1FD,$01 Terminator.

t $C1FE Messaging: "The Gypsy Camp. Brightly decorated caravans su..."
@ $C1FE label=Messaging_TheGypsyCamp
  $C1FE,$39 "#MESSAGE$C1FE".
B $C237,$01 Terminator.

t $C238 Messaging: "Pilgrims' Hill. The path is worn deep by the p..."
@ $C238 label=Messaging_PilgrimsHill
  $C238,$65 "#MESSAGE$C238".
B $C29D,$01 Terminator.

t $C29E Messaging: "The Monastery. A sanctuary used by many during..."
@ $C29E label=Messaging_TheMonastery
  $C29E,$6C "#MESSAGE$C29E".
B $C30A,$01 Terminator.

t $C30B Messaging: "The Wizard's Chamber."
@ $C30B label=Messaging_TheWizardsChamber
  $C30B,$15 "#MESSAGE$C30B".
B $C320,$01 Terminator.

t $C321 Messaging: "The Sand Room."
@ $C321 label=Messaging_TheSandRoom
  $C321,$0E "#MESSAGE$C321".
B $C32F,$01 Terminator.

t $C330 Messaging: "The Hall of Gold. Ornate gilt columns tower ab..."
@ $C330 label=Messaging_TheHallOfGold
  $C330,$36 "#MESSAGE$C330".
B $C366,$01 Terminator.

t $C367 Messaging: "Within the Long Barrow. Stone arches support t..."
@ $C367 label=Messaging_WithinTheLongBarrow
  $C367,$42 "#MESSAGE$C367".
B $C3A9,$01 Terminator.

t $C3AA Messaging: "At the Edge of the Sea. North of the Castle."
@ $C3AA label=Messaging_AtTheEdgeOfTheSea
  $C3AA,$2C "#MESSAGE$C3AA".
B $C3D6,$01 Terminator.

t $C3D7 Messaging: "The Hall of the Mountain King."
@ $C3D7 label=Messaging_TheHallOfTheMountainKing
  $C3D7,$1E "#MESSAGE$C3D7".
B $C3F5,$01 Terminator.

t $C3F6 Messaging: "The King's Anteroom."
@ $C3F6 label=Messaging_TheKingsAnteroom
  $C3F6,$14 "#MESSAGE$C3F6".
B $C40A,$01 Terminator.

t $C40B Messaging: "The Hall of Wisdom."
@ $C40B label=Messaging_TheHallOfWisdom
  $C40B,$13 "#MESSAGE$C40B".
B $C41E,$01 Terminator.

t $C41F Messaging: "The Star Chamber. A curious golden star design..."
@ $C41F label=Messaging_TheStarChamber
  $C41F,$44 "#MESSAGE$C41F".
B $C463,$01 Terminator.

t $C464 Messaging: "The Bird Chamber. A profusion of branches grow..."
@ $C464 label=Messaging_TheBirdChamber
  $C464,$35 "#MESSAGE$C464".
B $C499,$01 Terminator.

t $C49A Messaging: "The Vast Hall. A wide chasm lays to the South."
@ $C49A label=Messaging_TheVastHall
  $C49A,$2E "#MESSAGE$C49A".
B $C4C8,$01 Terminator.

t $C4C9 Messaging: "The Sword Room."
@ $C4C9 label=Messaging_TheSwordRoom
  $C4C9,$0F "#MESSAGE$C4C9".
B $C4D8,$01 Terminator.

t $C4D9 Messaging: "The Gatehouse. Stone stairs lead down."
@ $C4D9 label=Messaging_TheGatehouse
  $C4D9,$26 "#MESSAGE$C4D9".
B $C4FF,$01 Terminator.

t $C500 Messaging: "The King's Chamber. Inlaid into the floor is a..."
@ $C500 label=Messaging_TheKingsChamber
  $C500,$41 "#MESSAGE$C500".
B $C541,$01 Terminator.

t $C542 Messaging: "The Falcon Chamber."
@ $C542 label=Messaging_TheFalconChamber
  $C542,$13 "#MESSAGE$C542".
B $C555,$01 Terminator.

t $C556 Messaging: "The King's Stairway. The broken,spiral stairca..."
@ $C556 label=Messaging_TheKingsStairway
  $C556,$41 "#MESSAGE$C556".
B $C597,$01 Terminator.

t $C598 Messaging: "The Crystal Room."
@ $C598 label=Messaging_TheCrystalRoom
  $C598,$11 "#MESSAGE$C598".
B $C5A9,$01 Terminator.

t $C5AA Messaging: "The Debris Room."
@ $C5AA label=Messaging_TheDebrisRoom
  $C5AA,$10 "#MESSAGE$C5AA".
B $C5BA,$01 Terminator.

t $C5BB Messaging: "The Stair Room. A silver staircase leads down...."
@ $C5BB label=Messaging_TheStairRoom
  $C5BB,$52 "#MESSAGE$C5BB".
B $C60D,$01 Terminator.

t $C60E Messaging: "The Hall of Music."
@ $C60E label=Messaging_TheHallOfMusic
  $C60E,$12 "#MESSAGE$C60E".
B $C620,$01 Terminator.

t $C621 Messaging: "The Hall of Infinity. The tall columns have a..."
@ $C621 label=Messaging_TheHallOfInfinity
  $C621,$4D "#MESSAGE$C621".
B $C66E,$01 Terminator.

t $C66F Messaging: "The Lair of the Hydra."
@ $C66F label=Messaging_TheLairOfTheHydra
  $C66F,$16 "#MESSAGE$C66F".
B $C685,$01 Terminator.

t $C686 Messaging: "The Star Cavern. A golden star has been set in..."
@ $C686 label=Messaging_TheStarCavern
  $C686,$42 "#MESSAGE$C686".
B $C6C8,$01 Terminator.

t $C6C9 Messaging: "The Hall of Smoke. Smoke forms a swirling,shif..."
@ $C6C9 label=Messaging_TheHallOfSmoke
  $C6C9,$4C "#MESSAGE$C6C9".
B $C715,$01 Terminator.

t $C716 Messaging: "The Oil Room."
@ $C716 label=Messaging_TheOilRoom
  $C716,$0D "#MESSAGE$C716".
B $C723,$01 Terminator.

t $C724 Messaging: "The Acid Room."
@ $C724 label=Messaging_TheAcidRoom
  $C724,$0E "#MESSAGE$C724".
B $C732,$01 Terminator.

t $C733 Messaging: "The Treasury."
@ $C733 label=Messaging_TheTreasury
  $C733,$0D "#MESSAGE$C733".
B $C740,$01 Terminator.

t $C741 Messaging: "The Crypt. The air is cold and clammy in this..."
@ $C741 label=Messaging_TheCrypt
  $C741,$43 "#MESSAGE$C741".
B $C784,$01 Terminator.

t $C785 Messaging: "The Hall of the Black Knight. Sombre rows of h..."
@ $C785 label=Messaging_TheHallOfTheBlackKnight
  $C785,$51 "#MESSAGE$C785".
B $C7D6,$01 Terminator.

t $C7D7 Messaging: "The Hall of Jade. Delicate silver branches are..."
@ $C7D7 label=Messaging_TheHallOfJade
  $C7D7,$52 "#MESSAGE$C7D7".
B $C829,$01 Terminator.

t $C82A Messaging: "The Ice Cavern."
@ $C82A label=Messaging_TheIceCavern
  $C82A,$0F "#MESSAGE$C82A".
B $C839,$01 Terminator.

t $C83A Messaging: "The Cascade Cavern."
@ $C83A label=Messaging_TheCascadeCavern
  $C83A,$13 "#MESSAGE$C83A".
B $C84D,$01 Terminator.

t $C84E Messaging: "The Volcano Cavern."
@ $C84E label=Messaging_TheVolcanoCavern
  $C84E,$13 "#MESSAGE$C84E".
B $C861,$01 Terminator.

t $C862 Messaging: "The Hall of the Four Winds. A raging maelstrom..."
@ $C862 label=Messaging_TheHallOfTheFourWinds
  $C862,$4D "#MESSAGE$C862".
B $C8AF,$01 Terminator.

t $C8B0 Messaging: "The Dragon's Lair."
@ $C8B0 label=Messaging_TheDragonsLair
  $C8B0,$12 "#MESSAGE$C8B0".
B $C8C2,$01 Terminator.

t $C8C3 Messaging: "The Toolroom."
@ $C8C3 label=Messaging_TheToolroom
  $C8C3,$0D "#MESSAGE$C8C3".
B $C8D0,$01 Terminator.

t $C8D1 Messaging: "The Torture Chamber. The room is filled with f..."
@ $C8D1 label=Messaging_TheTortureChamber
  $C8D1,$49 "#MESSAGE$C8D1".
B $C91A,$01 Terminator.

t $C91B Messaging: "The Pirate's Lair."
@ $C91B label=Messaging_ThePiratesLair
  $C91B,$12 "#MESSAGE$C91B".
B $C92D,$01 Terminator.

t $C92E Messaging: "The Sand Cavern."
@ $C92E label=Messaging_TheSandCavern
  $C92E,$10 "#MESSAGE$C92E".
B $C93E,$01 Terminator.

t $C93F Messaging: "The Hall of Fire. Light comes from a thousand..."
@ $C93F label=Messaging_TheHallOfFire
  $C93F,$3D "#MESSAGE$C93F".
B $C97C,$01 Terminator.

t $C97D Messaging: "The Hall of the Phoenix."
@ $C97D label=Messaging_TheHallOfThePhoenix
  $C97D,$18 "#MESSAGE$C97D".
B $C995,$01 Terminator.

t $C996 Messaging: "The Steam Cavern. Hissing jets of scalding vap..."
@ $C996 label=Messaging_TheSteamCavern
  $C996,$52 "#MESSAGE$C996".
B $C9E8,$01 Terminator.

t $C9E9 Messaging: "The Limestone Cavern."
@ $C9E9 label=Messaging_TheLimestoneCavern
  $C9E9,$15 "#MESSAGE$C9E9".
B $C9FE,$01 Terminator.

t $C9FF Messaging: "The Dungeon. The door is to the East."
@ $C9FF label=Messaging_TheDungeon
  $C9FF,$25 "#MESSAGE$C9FF".
B $CA24,$01 Terminator.

t $CA25 Messaging: "The Cellar."
@ $CA25 label=Messaging_TheCellar
  $CA25,$0B "#MESSAGE$CA25".
B $CA30,$01 Terminator.

t $CA31 Messaging: "The Sandy Beach."
@ $CA31 label=Messaging_TheSandyBeach
  $CA31,$10 "#MESSAGE$CA31".
B $CA41,$01 Terminator.

t $CA42 Messaging: "The Sea Cavern."
@ $CA42 label=Messaging_TheSeaCavern
  $CA42,$0F "#MESSAGE$CA42".
B $CA51,$01 Terminator.

t $CA52 Messaging: "The Plant Room. A broken spiral staircase lead..."
@ $CA52 label=Messaging_ThePlantRoom
  $CA52,$37 "#MESSAGE$CA52".
B $CA89,$01 Terminator.

t $CA8A Messaging: "The Hall of Black Magic."
@ $CA8A label=Messaging_TheHallOfBlackMagic
  $CA8A,$18 "#MESSAGE$CA8A".
B $CAA2,$01 Terminator.

t $CAA3 Messaging: "The Bat Cavern."
@ $CAA3 label=Messaging_TheBatCavern
  $CAA3,$0F "#MESSAGE$CAA3".
B $CAB2,$01 Terminator.

t $CAB3 Messaging: "The Hall of Stairs. A silver staircase leads u..."
@ $CAB3 label=Messaging_TheHallOfStairs
  $CAB3,$34 "#MESSAGE$CAB3".
B $CAE7,$01 Terminator.

t $CAE8 Messaging: "a ruby"
@ $CAE8 label=Messaging_ARubyNoun
  $CAE8,$06 "#MESSAGE$CAE8".
B $CAEE,$01 Terminator.

t $CAEF Messaging: "a diamond"
@ $CAEF label=Messaging_ADiamondNoun
  $CAEF,$09 "#MESSAGE$CAEF".
B $CAF8,$01 Terminator.

t $CAF9 Messaging: "a flower"
@ $CAF9 label=Messaging_AFlower
  $CAF9,$08 "#MESSAGE$CAF9".
B $CB01,$01 Terminator.

t $CB02 Messaging: "a sapphire"
@ $CB02 label=Messaging_ASapphireNoun
  $CB02,$0A "#MESSAGE$CB02".
B $CB0C,$01 Terminator.

t $CB0D Messaging: "an emerald"
@ $CB0D label=Messaging_AnEmeraldNoun
  $CB0D,$0A "#MESSAGE$CB0D".
B $CB17,$01 Terminator.

t $CB18 Messaging: "a pearl"
@ $CB18 label=Messaging_APearlNoun
  $CB18,$07 "#MESSAGE$CB18".
B $CB1F,$01 Terminator.

t $CB20 Messaging: "a tinderbox"
@ $CB20 label=Messaging_ATinderboxNoun
  $CB20,$0B "#MESSAGE$CB20".
B $CB2B,$01 Terminator.

t $CB2C Messaging: "a frog"
@ $CB2C label=Messaging_AFrogNoun
  $CB2C,$06 "#MESSAGE$CB2C".
B $CB32,$01 Terminator.

t $CB33 Messaging: "any money"
@ $CB33 label=Messaging_AnyMoney
  $CB33,$09 "#MESSAGE$CB33".
B $CB3C,$01 Terminator.

t $CB3D Messaging: "a bible"
@ $CB3D label=Messaging_ABibleNoun
  $CB3D,$07 "#MESSAGE$CB3D".
B $CB44,$01 Terminator.

t $CB45 Messaging: "a wand"
@ $CB45 label=Messaging_AWandNoun
  $CB45,$06 "#MESSAGE$CB45".
B $CB4B,$01 Terminator.

t $CB4C Messaging: "a scroll"
@ $CB4C label=Messaging_AScrollNoun
  $CB4C,$08 "#MESSAGE$CB4C".
B $CB54,$01 Terminator.

t $CB55 Messaging: "a flute"
@ $CB55 label=Messaging_AFlute
  $CB55,$07 "#MESSAGE$CB55".
B $CB5C,$01 Terminator.

t $CB5D Messaging: "a carpet"
@ $CB5D label=Messaging_ACarpetNoun
  $CB5D,$08 "#MESSAGE$CB5D".
B $CB65,$01 Terminator.

t $CB66 Messaging: "a key"
@ $CB66 label=Messaging_AKey
  $CB66,$05 "#MESSAGE$CB66".
B $CB6B,$01 Terminator.

t $CB6C Messaging: "a songbird"
@ $CB6C label=Messaging_ASongbirdNoun
  $CB6C,$0A "#MESSAGE$CB6C".
B $CB76,$01 Terminator.

t $CB77 Messaging: "a sword"
@ $CB77 label=Messaging_ASwordNoun
  $CB77,$07 "#MESSAGE$CB77".
B $CB7E,$01 Terminator.

t $CB7F Messaging: "a spear"
@ $CB7F label=Messaging_ASpearNoun
  $CB7F,$07 "#MESSAGE$CB7F".
B $CB86,$01 Terminator.

t $CB87 Messaging: "a dagger"
@ $CB87 label=Messaging_ADaggerNoun
  $CB87,$08 "#MESSAGE$CB87".
B $CB8F,$01 Terminator.

t $CB90 Messaging: "a pillow"
@ $CB90 label=Messaging_APillow
  $CB90,$08 "#MESSAGE$CB90".
B $CB98,$01 Terminator.

t $CB99 Messaging: "a falcon"
@ $CB99 label=Messaging_AFalconNoun
  $CB99,$08 "#MESSAGE$CB99".
B $CBA1,$01 Terminator.

t $CBA2 Messaging: "a bottle"
@ $CBA2 label=Messaging_ABottleNoun
  $CBA2,$08 "#MESSAGE$CBA2".
B $CBAA,$01 Terminator.

t $CBAB Messaging: "any water"
@ $CBAB label=Messaging_AnyWater
  $CBAB,$09 "#MESSAGE$CBAB".
B $CBB4,$01 Terminator.

t $CBB5 Messaging: "any acid"
@ $CBB5 label=Messaging_AnyAcid
  $CBB5,$08 "#MESSAGE$CBB5".
B $CBBD,$01 Terminator.

t $CBBE Messaging: "any oil"
@ $CBBE label=Messaging_AnyOil
  $CBBE,$07 "#MESSAGE$CBBE".
B $CBC5,$01 Terminator.

t $CBC6 Messaging: "a lyre"
@ $CBC6 label=Messaging_ALyre
  $CBC6,$06 "#MESSAGE$CBC6".
B $CBCC,$01 Terminator.

t $CBCD Messaging: "a mandolin"
@ $CBCD label=Messaging_AMandolinNoun
  $CBCD,$0A "#MESSAGE$CBCD".
B $CBD7,$01 Terminator.

t $CBD8 Messaging: "any fragments"
@ $CBD8 label=Messaging_AnyFragments
  $CBD8,$0D "#MESSAGE$CBD8".
B $CBE5,$01 Terminator.

t $CBE6 Messaging: "a box"
@ $CBE6 label=Messaging_ABox
  $CBE6,$05 "#MESSAGE$CBE6".
B $CBEB,$01 Terminator.

t $CBEC Messaging: "a crowbar"
@ $CBEC label=Messaging_ACrowbarNoun
  $CBEC,$09 "#MESSAGE$CBEC".
B $CBF5,$01 Terminator.

t $CBF6 Messaging: "a shovel"
@ $CBF6 label=Messaging_AShovelNoun
  $CBF6,$08 "#MESSAGE$CBF6".
B $CBFE,$01 Terminator.

t $CBFF Messaging: "a map"
@ $CBFF label=Messaging_AMapNoun
  $CBFF,$05 "#MESSAGE$CBFF".
B $CC04,$01 Terminator.

t $CC05 Messaging: "a cage"
@ $CC05 label=Messaging_ACage
  $CC05,$06 "#MESSAGE$CC05".
B $CC0B,$01 Terminator.

t $CC0C Messaging: "a coin"
@ $CC0C label=Messaging_ACoin
  $CC0C,$06 "#MESSAGE$CC0C".
B $CC12,$01 Terminator.

t $CC13 Messaging: "any honey"
@ $CC13 label=Messaging_AnyHoney
  $CC13,$09 "#MESSAGE$CC13".
B $CC1C,$01 Terminator.

t $CC1D Messaging: "any meat"
@ $CC1D label=Messaging_AnyMeat
  $CC1D,$08 "#MESSAGE$CC1D".
B $CC25,$01 Terminator.

t $CC26 Messaging: "a cross"
@ $CC26 label=Messaging_ACross
  $CC26,$07 "#MESSAGE$CC26".
B $CC2D,$01 Terminator.

t $CC2E Messaging: "a mirror"
@ $CC2E label=Messaging_AMirror
  $CC2E,$08 "#MESSAGE$CC2E".
B $CC36,$01 Terminator.

t $CC37 Messaging: "a lizard"
@ $CC37 label=Messaging_ALizard
  $CC37,$08 "#MESSAGE$CC37".
B $CC3F,$01 Terminator.

t $CC40 Messaging: "a bear"
@ $CC40 label=Messaging_ABearNoun
  $CC40,$06 "#MESSAGE$CC40".
B $CC46,$01 Terminator.

t $CC47 Messaging: "any gates"
@ $CC47 label=Messaging_AnyGates
  $CC47,$09 "#MESSAGE$CC47".
B $CC50,$01 Terminator.

t $CC51 Messaging: "a barrowight"
@ $CC51 label=Messaging_ABarrowightNoun
  $CC51,$0C "#MESSAGE$CC51".
B $CC5D,$01 Terminator.

t $CC5E Messaging: "a spirit"
@ $CC5E label=Messaging_ASpiritNoun
  $CC5E,$08 "#MESSAGE$CC5E".
B $CC66,$01 Terminator.

t $CC67 Messaging: "a balrog"
@ $CC67 label=Messaging_ABalrogNoun
  $CC67,$08 "#MESSAGE$CC67".
B $CC6F,$01 Terminator.

t $CC70 Messaging: "a star"
@ $CC70 label=Messaging_AStar
  $CC70,$06 "#MESSAGE$CC70".
B $CC76,$01 Terminator.

t $CC77 Messaging: "a serpent"
@ $CC77 label=Messaging_ASerpentNoun
  $CC77,$09 "#MESSAGE$CC77".
B $CC80,$01 Terminator.

t $CC81 Messaging: "any stairs"
@ $CC81 label=Messaging_AnyStairs
  $CC81,$0A "#MESSAGE$CC81".
B $CC8B,$01 Terminator.

t $CC8C Messaging: "any bars"
@ $CC8C label=Messaging_AnyBars
  $CC8C,$08 "#MESSAGE$CC8C".
B $CC94,$01 Terminator.

t $CC95 Messaging: "a hydra"
@ $CC95 label=Messaging_AHydraNoun
  $CC95,$07 "#MESSAGE$CC95".
B $CC9C,$01 Terminator.

t $CC9D Messaging: "a spider"
@ $CC9D label=Messaging_ASpider
  $CC9D,$08 "#MESSAGE$CC9D".
B $CCA5,$01 Terminator.

t $CCA6 Messaging: "a chest"
@ $CCA6 label=Messaging_AChest
  $CCA6,$07 "#MESSAGE$CCA6".
B $CCAD,$01 Terminator.

t $CCAE Messaging: "a coffin"
@ $CCAE label=Messaging_ACoffinNoun
  $CCAE,$08 "#MESSAGE$CCAE".
B $CCB6,$01 Terminator.

t $CCB7 Messaging: "a vampire"
@ $CCB7 label=Messaging_AVampireNoun
  $CCB7,$09 "#MESSAGE$CCB7".
B $CCC0,$01 Terminator.

t $CCC1 Messaging: "the Knight"
@ $CCC1 label=Messaging_TheKnight
  $CCC1,$0A "#MESSAGE$CCC1".
B $CCCB,$01 Terminator.

t $CCCC Messaging: "a dragon"
@ $CCCC label=Messaging_ADragonNoun
  $CCCC,$08 "#MESSAGE$CCCC".
B $CCD4,$01 Terminator.

t $CCD5 Messaging: "a pirate"
@ $CCD5 label=Messaging_APirateNoun
  $CCD5,$08 "#MESSAGE$CCD5".
B $CCDD,$01 Terminator.

t $CCDE Messaging: "any fire"
@ $CCDE label=Messaging_AnyFire
  $CCDE,$08 "#MESSAGE$CCDE".
B $CCE6,$01 Terminator.

t $CCE7 Messaging: "a potion"
@ $CCE7 label=Messaging_APotion
  $CCE7,$08 "#MESSAGE$CCE7".
B $CCEF,$01 Terminator.

t $CCF0 Messaging: "a guard"
@ $CCF0 label=Messaging_AGuard
  $CCF0,$07 "#MESSAGE$CCF0".
B $CCF7,$01 Terminator.

t $CCF8 Messaging: "a door"
@ $CCF8 label=Messaging_ADoor
  $CCF8,$06 "#MESSAGE$CCF8".
B $CCFE,$01 Terminator.

t $CCFF Messaging: "a clam"
@ $CCFF label=Messaging_AClam
  $CCFF,$06 "#MESSAGE$CCFF".
B $CD05,$01 Terminator.

t $CD06 Messaging: "a plant"
@ $CD06 label=Messaging_APlant
  $CD06,$07 "#MESSAGE$CD06".
B $CD0D,$01 Terminator.

t $CD0E Messaging: "a witch"
@ $CD0E label=Messaging_AWitchNoun
  $CD0E,$07 "#MESSAGE$CD0E".
B $CD15,$01 Terminator.

t $CD16 Messaging: "a bat"
@ $CD16 label=Messaging_ABat
  $CD16,$05 "#MESSAGE$CD16".
B $CD1B,$01 Terminator.

t $CD1C Messaging: "Anton"
@ $CD1C label=Messaging_Anton
  $CD1C,$05 "#MESSAGE$CD1C".
B $CD21,$01 Terminator.

t $CD22 Messaging: "Beren"
@ $CD22 label=Messaging_Beren
  $CD22,$05 "#MESSAGE$CD22".
B $CD27,$01 Terminator.

t $CD28 Messaging: "Istar"
@ $CD28 label=Messaging_Istar
  $CD28,$05 "#MESSAGE$CD28".
B $CD2D,$01 Terminator.

t $CD2E Messaging: "Haldir"
@ $CD2E label=Messaging_Haldir
  $CD2E,$06 "#MESSAGE$CD2E".
B $CD34,$01 Terminator.

t $CD35 Messaging: "Khadim"
@ $CD35 label=Messaging_Khadim
  $CD35,$06 "#MESSAGE$CD35".
B $CD3B,$01 Terminator.

t $CD3C Messaging: "a phoenix"
@ $CD3C label=Messaging_APhoenixNoun
  $CD3C,$09 "#MESSAGE$CD3C".
B $CD45,$01 Terminator.

t $CD46 Messaging: "any ashes"
@ $CD46 label=Messaging_AnyAshes
  $CD46,$09 "#MESSAGE$CD46".
B $CD4F,$01 Terminator.

t $CD50 Messaging: "any gas"
@ $CD50 label=Messaging_AnyGas
  $CD50,$07 "#MESSAGE$CD50".
B $CD57,$01 Terminator.

g $CD58 Table: Item Descriptions
@ $CD58 label=Table_ItemDescriptions
D $CD58 One word per item. Each entry points at an #N$FF-terminated name.
W $CD58,$02
L $CD58,$02,$87

g $CE66 Table: Room Descriptions
@ $CE66 label=Table_RoomDescriptions
D $CE66 One word per room. Rooms #N$00 and #N$01 are unused. The rest point at the room text.
W $CE66,$02
L $CE66,$02,$42

g $CEEA Table: Object Noun Phrases
@ $CEEA label=Table_ObjectNounPhrases
D $CEEA One word per object. Each entry points at the noun text.
W $CEEA,$02
L $CEEA,$02,$48

t $CF7A Messaging: "Congratulations !!! The heroes are rescued and..."
@ $CF7A label=Messaging_CongratulationsTheHeroesAreRescued
  $CF7A,$D1 "#MESSAGE$CF7A".
B $D04B,$01 Terminator.

t $D04C Messaging: "The scorching flames of the firegate have inci..."
@ $D04C label=Messaging_TheScorchingFlamesOfTheFiregateHave
  $D04C,$3A "#MESSAGE$D04C".
B $D086,$01 Terminator.

t $D087 Messaging: "Suddenly,the ashes burst into flames...."
@ $D087 label=Messaging_SuddenlyTheAshesBurstIntoFlames
  $D087,$28 "#MESSAGE$D087".
B $D0AF,$01 Terminator.

t $D0B0 Messaging: "A phoenix emerges from the fire and blocks you..."
@ $D0B0 label=Messaging_APhoenixEmergesFromTheFireAndBlocks
  $D0B0,$35 "#MESSAGE$D0B0".
B $D0E5,$01 Terminator.

t $D0E6 Messaging: "Read the information carefully."
@ $D0E6 label=Messaging_ReadTheInformationCarefully
  $D0E6,$1F "#MESSAGE$D0E6".
B $D105,$01 Terminator.

t $D106 Messaging: "It looks hungry."
@ $D106 label=Messaging_ItLooksHungry
  $D106,$10 "#MESSAGE$D106".
B $D116,$01 Terminator.

t $D117 Messaging: "Try a little music."
@ $D117 label=Messaging_TryALittleMusic
  $D117,$13 "#MESSAGE$D117".
B $D12A,$01 Terminator.

t $D12B Messaging: "Try corrosion."
@ $D12B label=Messaging_TryCorrosion
  $D12B,$0E "#MESSAGE$D12B".
B $D139,$01 Terminator.

t $D13A Messaging: "You don't really need it."
@ $D13A label=Messaging_YouDontReallyNeedIt
  $D13A,$19 "#MESSAGE$D13A".
B $D153,$01 Terminator.

t $D154 Messaging: "A guard appears...."
@ $D154 label=Messaging_AGuardAppears
  $D154,$13 "#MESSAGE$D154".
B $D167,$01 Terminator.

t $D168 Messaging: "You are taken away."
@ $D168 label=Messaging_YouAreTakenAway
  $D168,$13 "#MESSAGE$D168".
B $D17B,$01 Terminator.

t $D17C Messaging: "It appears to be bewitched."
@ $D17C label=Messaging_ItAppearsToBeBewitched
  $D17C,$1B "#MESSAGE$D17C".
B $D197,$01 Terminator.

t $D198 Messaging: "I see nothing special."
@ $D198 label=Messaging_ISeeNothingSpecial
  $D198,$16 "#MESSAGE$D198".
B $D1AE,$01 Terminator.

t $D1AF Messaging: "Like Pandora's maybe."
@ $D1AF label=Messaging_LikePandorasMaybe
  $D1AF,$15 "#MESSAGE$D1AF".
B $D1C4,$01 Terminator.

t $D1C5 Messaging: "It is very fragile."
@ $D1C5 label=Messaging_ItIsVeryFragile
  $D1C5,$13 "#MESSAGE$D1C5".
B $D1D8,$01 Terminator.

t $D1D9 Messaging: "The symbols are incomprehensible to you."
@ $D1D9 label=Messaging_TheSymbolsAreIncomprehensibleToYou
  $D1D9,$28 "#MESSAGE$D1D9".
B $D201,$01 Terminator.

t $D202 Messaging: "You're already carrying it."
@ $D202 label=Messaging_YoureAlreadyCarryingIt
  $D202,$1B "#MESSAGE$D202".
B $D21D,$01 Terminator.

t $D21E Messaging: "The swamp lizard prevents you."
@ $D21E label=Messaging_TheSwampLizardPreventsYou
  $D21E,$1E "#MESSAGE$D21E".
B $D23C,$01 Terminator.

t $D23D Messaging: "It is too high to reach."
@ $D23D label=Messaging_ItIsTooHighToReach
  $D23D,$18 "#MESSAGE$D23D".
B $D255,$01 Terminator.

t $D256 Messaging: "The spider prevents you."
@ $D256 label=Messaging_TheSpiderPreventsYou
  $D256,$18 "#MESSAGE$D256".
B $D26E,$01 Terminator.

t $D26F Messaging: "The barrowight prevents you."
@ $D26F label=Messaging_TheBarrowightPreventsYou
  $D26F,$1C "#MESSAGE$D26F".
B $D28B,$01 Terminator.

t $D28C Messaging: "A strange force stops you."
@ $D28C label=Messaging_AStrangeForceStopsYou
  $D28C,$1A "#MESSAGE$D28C".
B $D2A6,$01 Terminator.

t $D2A7 Messaging: "A jewelled key is revealed."
@ $D2A7 label=Messaging_AJewelledKeyIsRevealed
  $D2A7,$1B "#MESSAGE$D2A7".
B $D2C2,$01 Terminator.

t $D2C3 Messaging: "It is frightened of you and it flutters away."
@ $D2C3 label=Messaging_ItIsFrightenedOfYouAndItFluttersAway
  $D2C3,$2D "#MESSAGE$D2C3".
B $D2F0,$01 Terminator.

t $D2F1 Messaging: "It won't come to you."
@ $D2F1 label=Messaging_ItWontComeToYou
  $D2F1,$15 "#MESSAGE$D2F1".
B $D306,$01 Terminator.

t $D307 Messaging: "You now have a bottle of water."
@ $D307 label=Messaging_YouNowHaveABottleOfWater
  $D307,$1F "#MESSAGE$D307".
B $D326,$01 Terminator.

t $D327 Messaging: "You have nothing to carry it in."
@ $D327 label=Messaging_YouHaveNothingToCarryItIn
  $D327,$20 "#MESSAGE$D327".
B $D347,$01 Terminator.

t $D348 Messaging: "You now have a bottle of acid."
@ $D348 label=Messaging_YouNowHaveABottleOfAcid
  $D348,$1E "#MESSAGE$D348".
B $D366,$01 Terminator.

t $D367 Messaging: "You now have a bottle of oil."
@ $D367 label=Messaging_YouNowHaveABottleOfOil
  $D367,$1D "#MESSAGE$D367".
B $D384,$01 Terminator.

t $D385 Messaging: "As you take the pillow,the flower slips off on..."
@ $D385 label=Messaging_AsYouTakeThePillowTheFlowerSlips
  $D385,$48 "#MESSAGE$D385".
B $D3CD,$01 Terminator.

t $D3CE Messaging: "The flower now rests on the velvet pillow."
@ $D3CE label=Messaging_TheFlowerNowRestsOnTheVelvetPillow
  $D3CE,$2B "#MESSAGE$D3CE".
B $D3F9,$01 Terminator.

t $D3FA Messaging: "The flower drops and breaks into many fragments."
@ $D3FA label=Messaging_TheFlowerDropsAndBreaksIntoManyFragments
  $D3FA,$30 "#MESSAGE$D3FA".
B $D42A,$01 Terminator.

t $D42B Messaging: "The bat prevents you."
@ $D42B label=Messaging_TheBatPreventsYou
  $D42B,$15 "#MESSAGE$D42B".
B $D440,$01 Terminator.

t $D441 Messaging: "The dragon prevents you."
@ $D441 label=Messaging_TheDragonPreventsYou
  $D441,$18 "#MESSAGE$D441".
B $D459,$01 Terminator.

t $D45A Messaging: "I don't see the point."
@ $D45A label=Messaging_IDontSeeThePoint_Duplicate
  $D45A,$16 "#MESSAGE$D45A".
B $D470,$01 Terminator.

t $D471 Messaging: "You can't. It's sleeping."
@ $D471 label=Messaging_YouCantIts
  $D471,$19 "#MESSAGE$D471".
B $D48A,$01 Terminator.

t $D48B Messaging: "Anton takes the mirror and he examines it brie..."
@ $D48B label=Messaging_AntonTakesTheMirrorAndHeExaminesItBriefly
  $D48B,$77 "#MESSAGE$D48B".
B $D502,$01 Terminator.

t $D503 Messaging: "Anton takes the coin and says:- 'I see you pla..."
@ $D503 label=Messaging_AntonTakesTheCoinAndSaysISeeYouPlaying
  $D503,$72 "#MESSAGE$D503".
B $D575,$01 Terminator.

t $D576 Messaging: "The bear eats the honey,yawns and promptly goe..."
@ $D576 label=Messaging_TheBearEatsTheHoneyYawnsAndPromptlyGoes
  $D576,$39 "#MESSAGE$D576".
B $D5AF,$01 Terminator.

t $D5B0 Messaging: "The falcon eats the meat and becomes more doci..."
@ $D5B0 label=Messaging_TheFalconEatsTheMeatAndBecomesMoreDocile
  $D5B0,$31 "#MESSAGE$D5B0".
B $D5E1,$01 Terminator.

t $D5E2 Messaging: "It is greedily devoured."
@ $D5E2 label=Messaging_ItIsGreedilyDevoured
  $D5E2,$18 "#MESSAGE$D5E2".
B $D5FA,$01 Terminator.

t $D5FB Messaging: "Anton says:- 'No! Get me a' magic mirror.'"
@ $D5FB label=Messaging_AntonSaysNoGetMeAMagicMirror
  $D5FB,$2A "#MESSAGE$D5FB".
B $D625,$01 Terminator.

t $D626 Messaging: "You must be joking!"
@ $D626 label=Messaging_YouMustBeJoking
  $D626,$13 "#MESSAGE$D626".
B $D639,$01 Terminator.

t $D63A Messaging: "You kiss the frog... The air starts to shimmer..."
@ $D63A label=Messaging_YouKissTheFrog
  $D63A,$31 "#MESSAGE$D63A".
B $D66B,$01 Terminator.

t $D66C Messaging: "The frog vanishes,and Beren stands in its place."
@ $D66C label=Messaging_TheFrogVanishesAndBerenStandsInItsPlace
  $D66C,$30 "#MESSAGE$D66C".
B $D69C,$01 Terminator.

t $D69D Messaging: "You open the box and from it there issues a ho..."
@ $D69D label=Messaging_YouOpenTheBoxAndFromItThereIssuesAHowling
  $D69D,$52 "#MESSAGE$D69D".
B $D6EF,$01 Terminator.

t $D6F0 Messaging: "The smoke is blown away for a brief while."
@ $D6F0 label=Messaging_TheSmokeIsBlownAwayForABriefWhile
  $D6F0,$2A "#MESSAGE$D6F0".
B $D71A,$01 Terminator.

t $D71B Messaging: "You can see a ruby."
@ $D71B label=Messaging_YouCanSeeARuby
  $D71B,$13 "#MESSAGE$D71B".
B $D72E,$01 Terminator.

t $D72F Messaging: "It is already open."
@ $D72F label=Messaging_ItIsAlreadyOpen
  $D72F,$13 "#MESSAGE$D72F".
B $D742,$01 Terminator.

t $D743 Messaging: "It is already closed."
@ $D743 label=Messaging_ItIsAlreadyClosed
  $D743,$15 "#MESSAGE$D743".
B $D758,$01 Terminator.

t $D759 Messaging: "They are already open."
@ $D759 label=Messaging_TheyAreAlreadyOpen
  $D759,$16 "#MESSAGE$D759".
B $D76F,$01 Terminator.

t $D770 Messaging: "They are already closed."
@ $D770 label=Messaging_TheyAreAlreadyClosed
  $D770,$18 "#MESSAGE$D770".
B $D788,$01 Terminator.

t $D789 Messaging: "You need the proper key."
@ $D789 label=Messaging_YouNeedTheProperKey
  $D789,$18 "#MESSAGE$D789".
B $D7A1,$01 Terminator.

t $D7A2 Messaging: "The hinges are too rusty."
@ $D7A2 label=Messaging_TheHingesAreTooRusty
  $D7A2,$19 "#MESSAGE$D7A2".
B $D7BB,$01 Terminator.

t $D7BC Messaging: "With hinges protesting noisily, you open the c..."
@ $D7BC label=Messaging_WithHingesProtestingNoisilyYouOpenTheChest
  $D7BC,$46 "#MESSAGE$D7BC".
B $D802,$01 Terminator.

t $D803 Messaging: "They're not here!"
@ $D803 label=Messaging_TheyreNotHere
  $D803,$11 "#MESSAGE$D803".
B $D814,$01 Terminator.

t $D815 Messaging: "You open the coffin and a vampire jumps out."
@ $D815 label=Messaging_YouOpenTheCoffinAndAVampireJumpsOut
  $D815,$2C "#MESSAGE$D815".
B $D841,$01 Terminator.

t $D842 Messaging: "You make several attempts,but it is closed tig..."
@ $D842 label=Messaging_YouMakeSeveralAttemptsButItIsClosedTightly
  $D842,$33 "#MESSAGE$D842".
B $D875,$01 Terminator.

t $D876 Messaging: "The clam reluctantly opens, revealing a pearl."
@ $D876 label=Messaging_TheClamReluctantlyOpensRevealingAPearl
  $D876,$2E "#MESSAGE$D876".
B $D8A4,$01 Terminator.

t $D8A5 Messaging: "The guard takes the money then opens the door...."
@ $D8A5 label=Messaging_TheGuardTakesTheMoneyThenOpensTheDoor
  $D8A5,$49 "#MESSAGE$D8A5".
B $D8EE,$01 Terminator.

t $D8EF Messaging: "You find no salvation there."
@ $D8EF label=Messaging_YouFindNoSalvationThere
  $D8EF,$1C "#MESSAGE$D8EF".
B $D90B,$01 Terminator.

t $D90C Messaging: "Don't be ridiculous."
@ $D90C label=Messaging_DontBeRidiculous
  $D90C,$14 "#MESSAGE$D90C".
B $D920,$01 Terminator.

t $D921 Messaging: "You play a nice tune."
@ $D921 label=Messaging_YouPlayANiceTune
  $D921,$15 "#MESSAGE$D921".
B $D936,$01 Terminator.

t $D937 Messaging: "The bottle shatters."
@ $D937 label=Messaging_TheBottleShatters
  $D937,$14 "#MESSAGE$D937".
B $D94B,$01 Terminator.

t $D94C Messaging: "The flower drops onto the hard floor and shatt..."
@ $D94C label=Messaging_TheFlowerDropsOntoTheHardFloorAndShatters
  $D94C,$32 "#MESSAGE$D94C".
B $D97E,$01 Terminator.

t $D97F Messaging: "The flower drops and gently comes to rest on t..."
@ $D97F label=Messaging_TheFlowerDropsAndGentlyComesToRest
  $D97F,$38 "#MESSAGE$D97F".
B $D9B7,$01 Terminator.

t $D9B8 Messaging: "The bridge shudders and then crumbles away."
@ $D9B8 label=Messaging_TheBridgeShuddersAndThenCrumblesAway
  $D9B8,$2B "#MESSAGE$D9B8".
B $D9E3,$01 Terminator.

t $D9E4 Messaging: "The balrog tumbles to its death."
@ $D9E4 label=Messaging_TheBalrogTumblesToItsDeath
  $D9E4,$20 "#MESSAGE$D9E4".
B $DA04,$01 Terminator.

t $DA05 Messaging: "Your vision clears and you can now see the exit."
@ $DA05 label=Messaging_YourVisionClearsAndYouCanNowSeeTheExit
  $DA05,$30 "#MESSAGE$DA05".
B $DA35,$01 Terminator.

t $DA36 Messaging: "The bars tremble and break. Istar is free."
@ $DA36 label=Messaging_TheBarsTrembleAndBreak
  $DA36,$2A "#MESSAGE$DA36".
B $DA60,$01 Terminator.

t $DA61 Messaging: "With a great wailing the barrowight is destroy..."
@ $DA61 label=Messaging_WithAGreatWailingTheBarrowightIsDestroyed
  $DA61,$31 "#MESSAGE$DA61".
B $DA92,$01 Terminator.

t $DA93 Messaging: "In a flurry of flying feathers, the bird kills..."
@ $DA93 label=Messaging_InAFlurryOfFlyingFeathersTheBirdKills
  $DA93,$3B "#MESSAGE$DA93".
B $DACE,$01 Terminator.

t $DACF Messaging: "It is a fruitless exercise. As you strike off..."
@ $DACF label=Messaging_ItIsAFruitlessExercise
  $DACF,$53 "#MESSAGE$DACF".
B $DB22,$01 Terminator.

t $DB23 Messaging: "You pierce the monster's heart. Purple blood r..."
@ $DB23 label=Messaging_YouPierceTheMonstersHeart
  $DB23,$53 "#MESSAGE$DB23".
B $DB76,$01 Terminator.

t $DB77 Messaging: "It's already dead."
@ $DB77 label=Messaging_ItsAlreadyDead
  $DB77,$12 "#MESSAGE$DB77".
B $DB89,$01 Terminator.

t $DB8A Messaging: "He's already dead."
@ $DB8A label=Messaging_HesAlreadyDead
  $DB8A,$12 "#MESSAGE$DB8A".
B $DB9C,$01 Terminator.

t $DB9D Messaging: "The vampire screams,there is a blinding flash..."
@ $DB9D label=Messaging_TheVampireScreamsThereIsABlindingFlash
  $DB9D,$3E "#MESSAGE$DB9D".
B $DBDB,$01 Terminator.

t $DBDC Messaging: "As the light fades,you see Haldir standing the..."
@ $DBDC label=Messaging_AsTheLightFadesYouSeeHaldirStandingThere
  $DBDC,$31 "#MESSAGE$DBDC".
B $DC0D,$01 Terminator.

t $DC0E Messaging: "The Knight writhes in agony as the vitriolic l..."
@ $DC0E label=Messaging_TheKnightWrithesInAgonyAsTheVitriolic
  $DC0E,$56 "#MESSAGE$DC0E".
B $DC64,$01 Terminator.

t $DC65 Messaging: "Your blow strikes true. With a last faint roar..."
@ $DC65 label=Messaging_YourBlowStrikesTrue
  $DC65,$37 "#MESSAGE$DC65".
B $DC9C,$01 Terminator.

t $DC9D Messaging: "As you attack,the pirate hides in a tunnel,too..."
@ $DC9D label=Messaging_AsYouAttackThePirateHidesInATunnelTooSmall
  $DC9D,$46 "#MESSAGE$DC9D".
B $DCE3,$01 Terminator.

t $DCE4 Messaging: "The witch dies screaming."
@ $DCE4 label=Messaging_TheWitchDiesScreaming
  $DCE4,$19 "#MESSAGE$DCE4".
B $DCFD,$01 Terminator.

t $DCFE Messaging: "She is already dead."
@ $DCFE label=Messaging_SheIsAlreadyDead
  $DCFE,$14 "#MESSAGE$DCFE".
B $DD12,$01 Terminator.

t $DD13 Messaging: "It won't obey you."
@ $DD13 label=Messaging_ItWontObeyYou
  $DD13,$12 "#MESSAGE$DD13".
B $DD25,$01 Terminator.

t $DD26 Messaging: "You have no oil."
@ $DD26 label=Messaging_YouHaveNoOil
  $DD26,$10 "#MESSAGE$DD26".
B $DD36,$01 Terminator.

t $DD37 Messaging: "You have no water."
@ $DD37 label=Messaging_YouHaveNoWater
  $DD37,$12 "#MESSAGE$DD37".
B $DD49,$01 Terminator.

t $DD4A Messaging: "The plant grows swiftly then suddenly stops,at..."
@ $DD4A label=Messaging_ThePlantGrowsSwiftlyThenSuddenlyStopsAt
  $DD4A,$44 "#MESSAGE$DD4A".
B $DD8E,$01 Terminator.

t $DD8F Messaging: "The plant grows and forms a giant beanstalk re..."
@ $DD8F label=Messaging_ThePlantGrowsAndFormsAGiantBeanstalk
  $DD8F,$3C "#MESSAGE$DD8F".
B $DDCB,$01 Terminator.

t $DDCC Messaging: "The ashes sizzle fiercely for a moment,then th..."
@ $DDCC label=Messaging_TheAshesSizzleFiercelyForAMoment
  $DDCC,$41 "#MESSAGE$DDCC".
B $DE0D,$01 Terminator.

t $DE0E Messaging: "You take a refreshing drink."
@ $DE0E label=Messaging_YouTakeARefreshingDrink
  $DE0E,$1C "#MESSAGE$DE0E".
B $DE2A,$01 Terminator.

t $DE2B Messaging: "You drink the black potion. It is poisonous."
@ $DE2B label=Messaging_YouDrinkTheBlackPotion
  $DE2B,$2C "#MESSAGE$DE2B".
B $DE57,$01 Terminator.

t $DE58 Messaging: "You have nothing to dig with."
@ $DE58 label=Messaging_YouHaveNothingToDigWith
  $DE58,$1D "#MESSAGE$DE58".
B $DE75,$01 Terminator.

t $DE76 Messaging: "You find nothing."
@ $DE76 label=Messaging_YouFindNothing
  $DE76,$11 "#MESSAGE$DE76".
B $DE87,$01 Terminator.

t $DE88 Messaging: "You uncover an emerald!"
@ $DE88 label=Messaging_YouUncoverAnEmerald
  $DE88,$17 "#MESSAGE$DE88".
B $DE9F,$01 Terminator.

t $DEA0 Messaging: "That is biologically impossible."
@ $DEA0 label=Messaging_ThatIsBiologicallyImpossible
  $DEA0,$20 "#MESSAGE$DEA0".
B $DEC0,$01 Terminator.

t $DEC1 Messaging: "He's not keen on the idea."
@ $DEC1 label=Messaging_HesNotKeenOnTheIdea
  $DEC1,$1A "#MESSAGE$DEC1".
B $DEDB,$01 Terminator.

t $DEDC Messaging: "You have nothing to light it with."
@ $DEDC label=Messaging_YouHaveNothingToLightItWith
  $DEDC,$22 "#MESSAGE$DEDC".
B $DEFE,$01 Terminator.

t $DEFF Messaging: "The pungent vapour ignites and the lizard is i..."
@ $DEFF label=Messaging_ThePungentVapourIgnitesAndTheLizardIs
  $DEFF,$39 "#MESSAGE$DEFF".
B $DF38,$01 Terminator.

t $DF39 Messaging: "It isn't here."
@ $DF39 label=Messaging_ItIsntHere
  $DF39,$0E "#MESSAGE$DF39".
B $DF47,$01 Terminator.

t $DF48 Messaging: "Even Beren is unable to calm it."
@ $DF48 label=Messaging_EvenBerenIsUnableToCalmIt
  $DF48,$20 "#MESSAGE$DF48".
B $DF68,$01 Terminator.

t $DF69 Messaging: "The songbird ignores you."
@ $DF69 label=Messaging_TheSongbirdIgnoresYou
  $DF69,$19 "#MESSAGE$DF69".
B $DF82,$01 Terminator.

t $DF83 Messaging: "The falcon launches itself upward.It circles,b..."
@ $DF83 label=Messaging_TheFalconLaunchesItselfUpward
  $DF83,$6F "#MESSAGE$DF83".
B $DFF2,$01 Terminator.

t $DFF3 Messaging: "Nothing happens."
@ $DFF3 label=Messaging_NothingHappens
  $DFF3,$10 "#MESSAGE$DFF3".
B $E003,$01 Terminator.

t $E004 Messaging: "The wand emits a shaft of shimmering blue ligh..."
@ $E004 label=Messaging_TheWandEmitsAShaftOfShimmeringBlueLight
  $E004,$6A "#MESSAGE$E004".
B $E06E,$01 Terminator.

t $E06F Messaging: "In a dazzle of glory,a crystal bridge appears..."
@ $E06F label=Messaging_InADazzleOfGloryACrystalBridgeAppears
  $E06F,$40 "#MESSAGE$E06F".
B $E0AF,$01 Terminator.

t $E0B0 Messaging: "There is a balrog on the bridge, preventing yo..."
@ $E0B0 label=Messaging_ThereIsABalrogOnTheBridgePreventing
  $E0B0,$39 "#MESSAGE$E0B0".
B $E0E9,$01 Terminator.

t $E0EA Messaging: "The pirate prevents you."
@ $E0EA label=Messaging_ThePiratePreventsYou
  $E0EA,$18 "#MESSAGE$E0EA".
B $E102,$01 Terminator.

t $E103 Messaging: "It says:- 'Seek a treasure between the castle..."
@ $E103 label=Messaging_ItSaysSeekATreasureBetweenTheCastle
  $E103,$3B "#MESSAGE$E103".
B $E13E,$01 Terminator.

t $E13F Messaging: "It reads:- 'Say 'ORION' among the stars.'"
@ $E13F label=Messaging_ItReadsSayOrionAmongTheStars
  $E13F,$29 "#MESSAGE$E13F".
B $E168,$01 Terminator.

t $E169 Messaging: "Haldir's nimble fingers pluck the golden strin..."
@ $E169 label=Messaging_HaldirsNimbleFingersPluckTheGoldenStrings
  $E169,$5B "#MESSAGE$E169".
B $E1C4,$01 Terminator.

t $E1C5 Messaging: "The pirate hides in the tunnel but Khadim foll..."
@ $E1C5 label=Messaging_ThePirateHidesInTheTunnelButKhadimFollows
  $E1C5,$40 "#MESSAGE$E1C5".
B $E205,$01 Terminator.

t $E206 Messaging: "He says 'No'."
@ $E206 label=Messaging_HeSaysNo
  $E206,$0D "#MESSAGE$E206".
B $E213,$01 Terminator.

t $E214 Messaging: "It is empty already."
@ $E214 label=Messaging_ItIsEmptyAlready
  $E214,$14 "#MESSAGE$E214".
B $E228,$01 Terminator.

t $E229 Messaging: "You pour the liquid away. The bottle is now em..."
@ $E229 label=Messaging_YouPourTheLiquidAway
  $E229,$32 "#MESSAGE$E229".
B $E25B,$01 Terminator.

b $E25C Table: Vocabulary
@ $E25C label=Table_Vocabulary
D $E25C Four-character words, space-padded, with a comma between synonyms. An #N$FF ends the table.
  $E25C,$025C

b $E4B8 Table: Character Set
@ $E4B8 label=Table_CharacterSet
D $E4B8 Printable characters followed by token markers used when the parser expands a word.
  $E4B8,$48

b $E500 Table: Phrase Tokens
@ $E500 label=Table_PhraseTokens
D $E500 #N$FF-terminated token records. The grouping table at #R$E5F7 points into this block.
  $E500,$D3

b $E5D3 Table: Verb Word Tokens
@ $E5D3 label=Table_VerbWordTokens
D $E5D3 Pairs of token bytes, one pair for each verb synonym group.
  $E5D3,$24

w $E5F7 Table: Item Grouping
@ $E5F7 label=Table_ItemGrouping
D $E5F7 One word per object. Each entry points into #R$E500.
W $E5F7,$02
L $E5F7,$02,$48

b $E687 Table: Phrase Patterns
@ $E687 label=Table_PhrasePatterns
D $E687 Token lists for the verb phrase tables. Each list is a run of item
. tokens closed by #N$FE.
  $E687,$015F

b $E7E6 Table: Room Map
@ $E7E6 label=Table_RoomMap
D $E7E6 Six bytes per room, in the order north, south, east, west, up, down. A zero means there is no exit.
  $E7E6,$018C

w $E972 Table: Configurable Exits
@ $E972 label=Table_ConfigurableExits
D $E972 One word per configurable exit. Each entry points at the exit record Game Start clears.
W $E972,$02
L $E972,$02,$16

c $E99E Jump to Game Start
@ $E99E label=Jump_GameStart
D $E99E Game Cold Start lands here and jumps on to Game Start.
  $E99E,$03 Continue at #R$FBA9.

c $E9A1 Game Loop
@ $E9A1 label=GameLoop
D $E9A1 One turn: run events, read a command, and dispatch its verb.
  $E9A1,$03 Call #R$B373 to advance the turn-based events.
  $E9A4,$04 Clear the turn scratch flag (#N$08 marks an attack).
  $E9A8,$03 Call #R$B200 to read the next command.
  $E9AB,$03 Call #R$B6BC to apply the command to the item.
  $E9AE,$02 Start the next turn without running the verb if a named item isn't here (carry set by #R$B6BC).
  $E9B0,$03 Call #R$B753 to run the verb.
  $E9B3,$02 Take another turn at #R$E9A1.

c $E9B5 Messaging: "You are dead."
@ $E9B5 label=Messaging_YouAreDead_Continue
D $E9B5 Print "You are dead." and fall into the play-again question.
N $E9B5 Print it and start a new line: #MESSAGE$AFF9.
  $E9B5,$06 Point at the message and print it and start a new line.

c $E9BB Handler: Ask To Play Again
@ $E9BB label=HandlerAskToPlayAgain
D $E9BB Ask To Play Again.
  $E9BB,$03 Call #R$B79E to tell the player the score.
N $E9BE Print it and start a new line: #MESSAGE$B007.
  $E9BE,$06 Point at the message and print it and start a new line.
@ $E9C4 label=HandlerAskToPlayAgain_Loop
  $E9C4,$03 Call #R$ABE1 to read the player's key.
  $E9C7,$05 Branch to #SKOOLKID$0000(START) when the player pressed "N".
  $E9CC,$05 Branch to #R$ABD4 when the player pressed "Y".
  $E9D1,$02 Ask again at #R$E9C4 when the key is neither Y nor N.

c $E9D3 Game Complete
@ $E9D3 label=GameComplete
D $E9D3 Announce that the quest is over and offer another game.
  $E9D3,$03 Call #R$ABF1 to clear the screen.
  $E9D6,$03 Call #R$AC0D to park the cursor on the current screen line.
  $E9D9,$06 Call #R$AC35 to print the string and start a new line.
  $E9DF,$02 Offer another game at #R$E9BB.

c $E9E1 Handler: Change Room
@ $E9E1 label=Handler_ChangeRoom
D $E9E1 Change room, with the special cases for the gates and the cottage.
  $E9E1,$04 See whether the player is moving into the Hall of the Phoenix.
  $E9E5,$03 Point #REGhl at the room-change flags.
  $E9E8,$02 See whether the Hall of the Phoenix is safe to enter.
  $E9EA,$02 Jump to #R$E9F8 if the zero flag is clear.
  $E9EC,$05 Return via the "You are dead." message.
  $E9F1,$06 Print "#MESSAGE$D04C" and start a new line.
  $E9F7,$01 Return.
  $E9F8,$01 Remember the room being moved to.
  $E9F9,$03 Read the current room into #REGa.
  $E9FC,$04 See whether the player is leaving the Hall of the Phoenix.
  $EA00,$03 Point #REGhl at the room-change flags.
  $EA03,$02 See whether the ashes have already become a phoenix.
  $EA05,$02 Jump to #R$EA36 if the zero flag is clear.
  $EA07,$05 See whether the move is into the Hall of Black Magic.
  $EA0C,$06 Turn the hot ashes into a phoenix.
  $EA12,$04 Close the south exit from the Hall of the Phoenix.
@ $EA16 label=Handler_ChangeRoom_AshesBurst
  $EA16,$06 Print "#MESSAGE$D087" and start a new line.
@ $EA1C label=Handler_ChangeRoom_PhoenixAppears
  $EA1C,$06 Pause, print "#MESSAGE$D0B0" and scroll.
  $EA22,$01 Return.
  $EA23,$01 Take the destination room.
  $EA24,$01 Remember the destination room.
  $EA25,$05 Remove the phoenix.
  $EA2A,$05 Leave the hot ashes in this room.
  $EA2F,$05 Open the south exit from the Hall of the Phoenix into the Hall of Black Magic.
  $EA34,$01 Restore the destination room from the stack.
  $EA35,$01 Put the destination room back.
  $EA36,$01 Hand the destination room to the move.
  $EA37,$03 Call #R$B714 to move the player into the room.
  $EA3A,$03 Read the current room into #REGa.
  $EA3D,$04 See whether the player is inside the ruined cottage.
  $EA41,$03 Read the event-state flags into #REGa.
  $EA44,$04 See whether the cottage tasks are finished.
  $EA48,$07 Count how many of the five gems are here.
@ $EA4F label=Cottage_CountGem
  $EA4F,$01 Read the next gem.
  $EA50,$03 Call #R$B560 to find where the object is.
  $EA53,$02 Jump to #R$EA56 if the zero flag is clear.
  $EA55,$01 Count a gem that is here.
  $EA56,$01 Move on to the next gem.
  $EA57,$02 Step down #REGb by one and jump to #R$EA4F until it is zero.
  $EA59,$05 See whether all five gems are here.
  $EA5E,$06 Check the list of treasures at #N$E504.
  $EA64,$02 Jump to #R$EA75 if none of the items listed at #N$E504 is here or carried.
  $EA66,$02 Restore #REGhl, #REGhl from the stack.
  $EA68,$08 Score four points and finish the game.

b $EA70 Table: Gems
@ $EA70 label=Table_Gems
D $EA70 The ruby, diamond, sapphire, emerald and pearl counted in the cottage.
B $EA70,$01 Item #N(#PEEK(#PC)).
L $EA70,$01,$05

c $EA75 Handler: Show The New Room
@ $EA75 label=Handler_ShowNewRoom
D $EA75 Draw the new room after a move.
  $EA75,$05 Call #R$B41F to show the room picture.
  $EA7A,$05 Call #R$B560 to find where the object is.
  $EA7F,$02 Skip the guard when he is not here.
  $EA81,$05 Call #R$B5D5 to remove the item.
N $EA86 Pause, print it and scroll: #MESSAGE$D154.
  $EA86,$06 Point at the message and pause, print it and scroll.
N $EA8C Pause, print it and scroll: #MESSAGE$D168.
  $EA8C,$06 Point at the message and pause, print it and scroll.
  $EA92,$05 Call #R$AC65 to pause for the frame count in #REGb.
  $EA97,$05 Take the player to the Dungeon.
@ $EA9C label=Handler_ShowNewRoom_Next
  $EA9C,$01 Return.

b $EA9D Data
@ $EA9D label=Item_JadeFragments
  $EA9D,$01

c $EA9E Print Response
@ $EA9E label=PrintResponse
D $EA9E Print the message at #REGhl and return to the command.
  $EA9E,$03 Call #R$AC35 to print the string and start a new line.
  $EAA1,$01 Return.

c $EAA2 Pause, Print String And Scroll
@ $EAA2 label=PausePrintAndScroll
D $EAA2 Pause, print the string at #REGhl, and scroll. The phrase handlers
. call this entry.
  $EAA2,$03 Call #R$B776 to pause, print the string and scroll.
  $EAA5,$01 Return.

c $EAA6 Response: "Read The Information Carefully."
@ $EAA6 label=Messaging_ReadTheInformationCarefully_Reply
D $EAA6 Tell the player "Read The Information Carefully."
N $EAA6 Print it as the reply: #MESSAGE$D0E6.
  $EAA6,$06 Point at the message and print it as the reply.

c $EAAC Response: "Try A Little Music."
@ $EAAC label=Messaging_TryALittleMusic_Reply
D $EAAC Tell the player "Try A Little Music."
N $EAAC Print it as the reply: #MESSAGE$D117.
  $EAAC,$06 Point at the message and print it as the reply.

c $EAB2 Response: "You Don't Really Need It."
@ $EAB2 label=Messaging_YouDontReallyNeedIt_Reply
D $EAB2 Tell the player "You Don't Really Need It."
N $EAB2 Print it as the reply: #MESSAGE$D13A.
  $EAB2,$06 Point at the message and print it as the reply.

c $EAB8 Response: "You're Not Carrying Anything."
@ $EAB8 label=Messaging_YoureNotCarryingAnything_Reply
D $EAB8 Tell the player "You're Not Carrying Anything."
N $EAB8 Print it as the reply: #MESSAGE$B1A6.
  $EAB8,$06 Point at the message and print it as the reply.

c $EABE Response: "I See Nothing Special."
@ $EABE label=Messaging_ISeeNothingSpecial_Reply
D $EABE Tell the player "I See Nothing Special."
N $EABE Print it as the reply: #MESSAGE$D198.
  $EABE,$06 Point at the message and print it as the reply.

w $EAC4 Table: Pointers
@ $EAC4 label=Handler_ExamineReplies
D $EAC4 12 addresses.
W $EAC4,$02
L $EAC4,$02,$0C

c $EADC Response: "You Can't Go In That Direction."
@ $EADC label=Messaging_YouCantGoInThatDirection_Reply
D $EADC Tell the player "You Can't Go In That Direction."
N $EADC Print it as the reply: #MESSAGE$B144.
  $EADC,$06 Point at the message and print it as the reply.

c $EAE2 Response: "You Can't."
@ $EAE2 label=Messaging_YouCant_Reply
D $EAE2 Tell the player "You Can't."
N $EAE2 Print it as the reply: #MESSAGE$B0E2.
  $EAE2,$06 Point at the message and print it as the reply.

c $EAE8 Response: "O.k."
@ $EAE8 label=Messaging_OK_Reply
D $EAE8 Tell the player "O.k."
N $EAE8 Print it as the reply: #MESSAGE$B0ED.
  $EAE8,$06 Point at the message and print it as the reply.

b $EAEE Data
@ $EAEE label=Handler_AlreadyCarrying
  $EAEE,$0C

c $EAFA Handler: Print Carrying
@ $EAFA label=HandlerPrintCarrying
D $EAFA Print Carrying.
  $EAFA,$06 Print "#MESSAGE$B0F2".
  $EB00,$09 See whether the object is the jade fragments.
  $EB09,$02 Say "them" when the object is the jade fragments.
  $EB0B,$06 Print "#MESSAGE$B10D" as the reply.
  $EB11,$06 Print "#MESSAGE$B111" as the reply.

b $EB17 Data
@ $EB17 label=Handler_TakeIntoInventory
  $EB17,$78

c $EB8F Response: "He Says "no"."
@ $EB8F label=Messaging_HeSaysNo_Reply
D $EB8F Tell the player "He Says "no"."
N $EB8F Print it as the reply: #MESSAGE$E206.
  $EB8F,$06 Point at the message and print it as the reply.

b $EB95 Data
@ $EB95 label=Handler_TakePhrases
  $EB95,$0196

c $ED2B Response: "Nothing Happens."
@ $ED2B label=Messaging_NothingHappens_Reply
D $ED2B Tell the player "Nothing Happens."
N $ED2B Print it as the reply: #MESSAGE$DFF3.
  $ED2B,$06 Point at the message and print it as the reply.

b $ED31 Data
@ $ED31 label=Handler_TakePhrases_Next
  $ED31,$DB

b $EE0C Data
@ $EE0C label=Handler_TakeAndDropPhrases
  $EE0C,$57

c $EE63 Handler: Report The Kill
@ $EE63 label=Handler_ReportTheKill
D $EE63 Report The Kill.
  $EE63,$03 Remove the killed item.
  $EE66,$06 Knock the jade flower off its pillow.
  $EE6C,$06 Print "#MESSAGE$D3CE" as the reply.

b $EE72 Data
@ $EE72 label=Handler_DropPhrases
  $EE72,$5D

b $EECF Data
@ $EECF label=Handler_DropPhrases_Next
  $EECF,$0113

c $EFE2 Response: "I Don't See The Point."
@ $EFE2 label=Messaging_IDontSeeThePoint_Reply
D $EFE2 Tell the player "I Don't See The Point."
N $EFE2 Print it as the reply: #MESSAGE$D45A.
  $EFE2,$06 Point at the message and print it as the reply.

b $EFE8 Data
@ $EFE8 label=Handler_ThrowPhrases
  $EFE8,$B6

c $F09E Response: "You Must Be Joking!"
@ $F09E label=Messaging_YouMustBeJoking_Reply
D $F09E Tell the player "You Must Be Joking!"
N $F09E Print it as the reply: #MESSAGE$D626.
  $F09E,$06 Point at the message and print it as the reply.

b $F0A4 Data
@ $F0A4 label=Handler_GiveAndKiss
  $F0A4,$0161

c $F205 Response: "Don't Be Ridiculous."
@ $F205 label=Messaging_DontBeRidiculous_Reply
D $F205 Tell the player "Don't Be Ridiculous."
N $F205 Print it as the reply: #MESSAGE$D90C.
  $F205,$06 Point at the message and print it as the reply.

b $F20B Data
@ $F20B label=Handler_UseAndLaterPhrases
  $F20B,$032C

c $F537 Response: "You Have Nothing To Dig With."
@ $F537 label=Messaging_YouHaveNothingToDigWith_Reply
D $F537 Tell the player "You Have Nothing To Dig With."
N $F537 Print it as the reply: #MESSAGE$DE58.
  $F537,$06 Point at the message and print it as the reply.

c $F53D Response: "You Find Nothing."
@ $F53D label=Response_YouFindNothing
D $F53D Tell the player "You Find Nothing."
  $F53D,$03 Call #R$EAE8 to tell the player that worked.
N $F540 Print it as the reply: #MESSAGE$DE76.
  $F540,$06 Point at the message and print it as the reply.

c $F546 Response: "He's not keen on the idea."
@ $F546 label=Response_NotKeen
D $F546 Tell the player "He's not keen on the idea."
  $F546,$06 Print "#MESSAGE$DEC1" as the reply.

c $F54C Handler: Shift Input Tokens
@ $F54C label=Handler_ShiftInputTokens
D $F54C Slide the word tokens down one place so the verb is dropped.
  $F54C,$03 Point #REGhl at the second word token.
  $F54F,$0D Slide the word tokens down one place and mark the last slot empty.
  $F55C,$01 Return.

b $F55D Data
@ $F55D label=Handler_FillAndOtherPhrases
  $F55D,$01B8

c $F715 Action: Help
@ $F715 label=Action_Help
D $F715 Carry out the "Help" command.
  $F715,$04 Call #R$B665 to check that the command has no object, and return if it does not.
  $F719,$08 Send the player to read the information when the swamp lizard is here.
  $F721,$08 Send the player to read the information when the balrog is here.
  $F729,$07 Skip the bear's answer when the bear is not here.
N $F730 Print it as the reply: #MESSAGE$D106.
  $F730,$06 Point at the message and print it as the reply.
@ $F736 label=Action_Help_Next
  $F736,$08 Suggest a little music when the venomous spider is here.
  $F73E,$03 Read the current room into #REGa.
  $F741,$05 Branch to #R$EAAC when the room is #MESSAGE$C621.
  $F746,$07 Skip the corrosion hint when the Black Knight is not here.
N $F74D Print it as the reply: #MESSAGE$D12B.
  $F74D,$06 Point at the message and print it as the reply.
@ $F753 label=Action_Help_Next2
  $F753,$03 Continue at #R$EAB2.

c $F756 Action: Inventory
@ $F756 label=Action_Inventory
D $F756 Carry out the "Inventory" command.
  $F756,$03 Call #R$B665 to check that the command has no object.
N $F759 The "INVENTORY" command can only be called on its own.
  $F759,$01 Return if there's any token set in #N$AF2F.
  $F75A,$07 Jump to #R$EAB8 if *#R$AE9A is zero (the player isn't holding any
. items).
N $F761 Clear the screen and display the players inventory.
  $F761,$03 Call #R$ABF1.
  $F764,$03 Call #R$AC0D to park the cursor on the current screen line.
  $F767,$06 Print "#MESSAGE$B131" and start a new line.
  $F76D,$05 Call #R$B400 with a room ID of #N$01 which is the players
. inventory.
  $F772,$01 Return.

c $F773 Action: Look
@ $F773 label=Action_Look
D $F773 Carry out the "Look" command.
  $F773,$03 Call #R$B665 to check that the command has no object.
N $F776 The "LOOK" command can only be called on its own.
  $F776,$01 Return if there's any token set in #N$AF2F.
  $F777,$05 Call #R$B41F with #REGe set to #N$01 (which will force any room
. images to be re-displayed).
  $F77C,$01 Return.

c $F77D Action: Score
@ $F77D label=Action_Score
D $F77D Carry out the "Score" command.
  $F77D,$03 Call #R$B665 to check that the command has no object.
N $F780 The "LOAD" command can only be called on its own.
  $F780,$01 Return if there's any token set in #N$AF2F.
  $F781,$03 Call #R$B79E to tell the player the score.
  $F784,$01 Return.

c $F785 Action: Examine
@ $F785 label=Action_Examine
D $F785 Carry out the "Examine" command.
  $F785,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $F789,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$05 entries.
  $F795,$03 Continue at #R$EABE.

w $F798 Table: Examine Phrases
@ $F798 label=Table_ExaminePhrases
D $F798 Phrase pointers and handler pointers for Examine.
W $F798,$02
L $F798,$02,$0A

c $F7AC Action: Load
@ $F7AC label=Action_Load
D $F7AC Carry out the "Load" command.
  $F7AC,$04 Call #R$B665 to check that the command has no object, and return if it does not.
  $F7B0,$04 Call #R$ACA8 to read the saved game from tape, and return if it does not.
  $F7B4,$03 Call #R$ABE1 to read the player's key.
  $F7B7,$04 Restart at the game entry point.
  $F7BB,$01 Return.

c $F7BC Action: Save
@ $F7BC label=Action_Save
D $F7BC Carry out the "Save" command.
  $F7BC,$04 Call #R$B665 to check that the command has no object, and return if it does not.
  $F7C0,$03 Call #R$AC6D to write the game to tape.
  $F7C3,$01 Return.

c $F7C4 Action: Quit
@ $F7C4 label=Action_Quit
D $F7C4 Carry out the "Quit" command.
  $F7C4,$04 Call #R$B665 to check that the command has no object, and return if it does not.
  $F7C8,$03 Call #R$B79E to tell the player the score.
N $F7CB Print it and start a new line: #MESSAGE$B097.
  $F7CB,$06 Point at the message and print it and start a new line.
@ $F7D1 label=Action_Quit_Loop
  $F7D1,$03 Call #R$ABE1 to read the player's key.
  $F7D4,$04 Branch to #R$F7DF when the player pressed "N".
  $F7D8,$04 Branch to #R$F7D1 unless the player pressed "Y".
  $F7DC,$03 Call #R$AC6D to write the game to tape.
@ $F7DF label=Action_Quit_Next
  $F7DF,$04 Return to the play-again question.
  $F7E3,$01 Return.

c $F7E4 Action: North
@ $F7E4 label=Action_North
D $F7E4 Carry out the "North" command.
  $F7E4,$04 Head north and continue at #R$F7FA.

c $F7E8 Action: South
@ $F7E8 label=Action_South
D $F7E8 Carry out the "South" command.
  $F7E8,$04 Head south and continue at #R$F7FA.

c $F7EC Action: East
@ $F7EC label=Action_East
D $F7EC Carry out the "East" command.
  $F7EC,$04 Head east and continue at #R$F7FA.

c $F7F0 Action: West
@ $F7F0 label=Action_West
D $F7F0 Carry out the "West" command.
  $F7F0,$04 Head west and continue at #R$F7FA.

c $F7F4 Action: Up
@ $F7F4 label=Action_Up
D $F7F4 Carry out the "Up" command.
  $F7F4,$04 Head up and continue at #R$F7FA.

c $F7F8 Action: Down
@ $F7F8 label=Action_Down
D $F7F8 Carry out the "Down" command.
  $F7F8,$02 Select the down exit.
@ $F7FA label=Action_Move
  $F7FA,$03 Call #R$B665 to check that the command has no object.
  $F7FD,$01 Leave the routine when the carry flag is set.
  $F7FE,$05 Call #R$B503 to point at the current room's exits.
  $F803,$01 Point at the exit for this direction.
  $F804,$01 Read this exit's destination room.
  $F805,$04 Refuse the move when that exit is closed.
  $F809,$03 Call #R$E9E1 to change room.
  $F80C,$01 Return.

c $F80D Action: Take
@ $F80D label=Action_Take
D $F80D Carry out the "Take" command.
  $F80D,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $F811,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$2C entries.
  $F81D,$03 Continue at #R$EAE2.

w $F820 Table: Take Phrases
@ $F820 label=Table_TakePhrases
D $F820 Phrase pointers and handler pointers for Take. Drop uses the phrase half.
W $F820,$02
L $F820,$02,$58

c $F8D0 Action: Drop
@ $F8D0 label=Action_Drop
D $F8D0 Carry out the "Drop" command.
  $F8D0,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $F8D4,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$2C entries.
  $F8E0,$03 Continue at #R$EAE2.

w $F8E3 Table: Drop Handlers
@ $F8E3 label=Table_DropHandlers
D $F8E3 One word per Drop phrase, the handler to run when that phrase matches.
  $F8E3,$58

W $F8E3,$02
L $F8E3,$02,$2C

c $F93B Action: Throw
@ $F93B label=Action_Throw
D $F93B Carry out the "Throw" command.
  $F93B,$04 Call #R$B694 to check that the command names two objects, and return if it does not.
  $F93F,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$09 entries.
  $F94B,$03 Continue at #R$EFE2.

w $F94E Table: Throw Phrases
@ $F94E label=Table_ThrowPhrases
D $F94E Phrase pointers and handler pointers for Throw.
W $F94E,$02
L $F94E,$02,$12

c $F972 Action: Give
@ $F972 label=Action_Give
D $F972 Carry out the "Give" command.
  $F972,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $F976,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$01 entry.
  $F982,$03 Continue at #R$F09E.

w $F985 Table: Give Phrases
@ $F985 label=Table_GivePhrases
D $F985 The Give phrase pointer and its handler.
  $F985,$04

W $F985,$02
L $F985,$02,$02

c $F989 Action: Kiss
@ $F989 label=Action_Kiss
D $F989 Carry out the "Kiss" command.
  $F989,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $F98D,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$0B entries.
  $F999,$03 Continue at #R$EAE2.

w $F99C Table: Kiss Phrases
@ $F99C label=Table_KissPhrases
D $F99C Phrase pointers and handler pointers for Kiss.
W $F99C,$02
L $F99C,$02,$16

b $F9C8 Data
@ $F9C8 label=Table_GateItems
  $F9C8,$14

c $F9DC Action: Open
@ $F9DC label=Action_Open
D $F9DC Carry out the "Open" command.
  $F9DC,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $F9E0,$03 Continue at #R$EAE2.

c $F9E3 Action: Close
@ $F9E3 label=Action_Close
D $F9E3 Carry out the "Close" command.
  $F9E3,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $F9E7,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$03 entries.
  $F9F3,$03 Continue at #R$EAE2.

w $F9F6 Table: Close Phrases
@ $F9F6 label=Table_ClosePhrases
D $F9F6 Phrase pointers and handler pointers for Close.
  $F9F6,$0C

W $F9F6,$02
L $F9F6,$02,$06

c $FA02 Action: Read
@ $FA02 label=Action_Read
D $FA02 Carry out the "Read" command.
  $FA02,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FA06,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$01 entry.
  $FA12,$03 Continue at #R$F205.

w $FA15 Table: Read Phrases
@ $FA15 label=Table_ReadPhrases
D $FA15 The Read phrase pointer and its handler.
  $FA15,$04

W $FA15,$02
L $FA15,$02,$02

c $FA19 Action: Wave
@ $FA19 label=Action_Wave
D $FA19 Carry out the "Wave" command.
  $FA19,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FA1D,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$03 entries.
  $FA29,$03 Continue at #R$EAE2.

w $FA2C Table: Wave Phrases
@ $FA2C label=Table_WavePhrases
D $FA2C Phrase pointers and handler pointers for Wave.
  $FA2C,$0C

W $FA2C,$02
L $FA2C,$02,$06

c $FA38 Action: Play
@ $FA38 label=Action_Play
D $FA38 Carry out the "Play" command.
  $FA38,$04 Call #R$B694 to check that the command names two objects, and return if it does not.
  $FA3C,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$0A entries.
  $FA48,$03 Continue at #R$EAE2.

b $FA4B Table: Play Phrases
@ $FA4B label=Table_PlayPhrases
D $FA4B Phrase pointers and handler pointers for Play.
  $FA4B,$27

c $FA72 Action: Kill
@ $FA72 label=ActionCapture
D $FA72 Carry out the "Kill" command.
  $FA72,$01 Remember the caller's flags.
  $FA73,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FA77,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$01 entry.
  $FA83,$03 Continue at #R$EFE2.

w $FA86 Table: Kill Phrases
@ $FA86 label=Table_KillPhrases
D $FA86 The Kill phrase pointer and its handler.
  $FA86,$04

W $FA86,$02
L $FA86,$02,$02

c $FA8A Action: Oil
@ $FA8A label=Action_Oil
D $FA8A Carry out the "Oil" command.
  $FA8A,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FA8E,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$02 entries.
  $FA9A,$03 Continue at #R$F205.

w $FA9D Table: Oil Phrases
@ $FA9D label=Table_OilPhrases
D $FA9D Phrase pointers and handler pointers for Oil.
  $FA9D,$08

W $FA9D,$02
L $FA9D,$02,$04

c $FAA5 Action: Drink
@ $FAA5 label=Action_Drink
D $FAA5 Carry out the "Drink" command.
  $FAA5,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FAA9,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$04 entries.
  $FAB5,$03 Continue at #R$F205.

w $FAB8 Table: Drink Phrases
@ $FAB8 label=Table_DrinkPhrases
D $FAB8 Phrase pointers and handler pointers for Drink.
W $FAB8,$02
L $FAB8,$02,$08

c $FAC8 Action: Dig
@ $FAC8 label=Action_Dig
D $FAC8 Carry out the "Dig" command.
  $FAC8,$04 Call #R$B665 to check that the command has no object, and return if it does not.
  $FACC,$08 Refuse to dig without the shovel.
  $FAD4,$03 Read the current room into #REGa.
  $FAD7,$05 Branch to #R$F53D when #N$3C means the values differ.
  $FADC,$08 See whether this spot on the beach has already been dug.
  $FAE4,$02 Remember that this spot on the beach has been dug.
  $FAE6,$05 Call #R$B5DC to update the item for this room.
  $FAEB,$05 Call #R$B78F to add the points to the score.
  $FAF0,$03 Call #R$EAE8 to tell the player that worked.
N $FAF3 Print it as the reply: #MESSAGE$DE88.
  $FAF3,$06 Point at the message and print it as the reply.

c $FAF9 Action: Empty
@ $FAF9 label=Action_Empty
D $FAF9 Carry out the "Empty" command.
  $FAF9,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FAFD,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$01 entry.
N $FB09 Print it as the reply: #MESSAGE$DEA0.
  $FB09,$06 Point at the message and print it as the reply.

w $FB0F Table: Empty Phrases
@ $FB0F label=Table_EmptyPhrases
D $FB0F The Empty phrase pointer and its handler.
  $FB0F,$04

W $FB0F,$02
L $FB0F,$02,$02

c $FB13 Action: Light
@ $FB13 label=Action_Light
D $FB13 Carry out the "Light" command.
  $FB13,$06 Call #R$B575 to match the phrase tokens.
  $FB19,$03 Refuse to light when the words do not match.
  $FB1C,$04 Flag this turn as lighting.

c $FB20 Action: Rub
@ $FB20 label=Action_Rub
D $FB20 Carry out the "Rub" command.
  $FB20,$06 Call #R$B575 to match the phrase tokens.
  $FB26,$03 Refuse to rub when the words do not match.
  $FB29,$04 Flag this turn as rubbing.

c $FB2D Action: Say
@ $FB2D label=Action_Say
D $FB2D Carry out the "Say" command.
  $FB2D,$06 Call #R$B575 to match the phrase tokens.
  $FB33,$03 Refuse to say it when the words do not match.
  $FB36,$04 Flag this turn as saying.

c $FB3A Action: Attack
@ $FB3A label=Action_Attack
D $FB3A Carry out the "Attack" command.
  $FB3A,$06 Call #R$B575 to match the phrase tokens.
  $FB40,$03 Refuse to attack when the words do not match.
  $FB43,$02 Flag this turn as an attack.
  $FB45,$03 Store #REGa in the turn scratch flag.
  $FB48,$03 Call #R$F54C to drop the verb from the word tokens.
  $FB4B,$04 Hand the rest of the command to the verb dispatcher.
  $FB4F,$01 Return.

c $FB50 Action: Fill
@ $FB50 label=Action_Fill
D $FB50 Carry out the "Fill" command.
  $FB50,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FB54,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$01 entry.
  $FB60,$03 Continue at #R$EAE2.

w $FB63 Table: Fill Phrases
@ $FB63 label=Table_FillPhrases
D $FB63 The Fill phrase pointer and its handler.
  $FB63,$04

W $FB63,$02
L $FB63,$02,$02

c $FB67 Action: Pour
@ $FB67 label=Action_Pour
D $FB67 Carry out the "Pour" command.
  $FB67,$04 Call #R$B665 to check that the command has no object, and return if it does not.
  $FB6B,$03 Read the current room into #REGa.
  $FB6E,$08 See whether this room is one Pour carries to the cottage.
  $FB76,$02 Try to return when this room is not one of the three.
  $FB78,$03 Store #REGa in *#R$AE79.
  $FB7B,$04 Take the player inside the ruined cottage.
@ $FB7F label=Action_Pour_Next
  $FB7F,$05 Branch to #R$ED2B when the exit is east.
  $FB84,$03 Read *#R$AE79 into #REGa.
  $FB87,$04 Do nothing when Pour has nowhere to return.
@ $FB8B label=Action_Pour_ChangeRoom
  $FB8B,$03 Call #R$E9E1 to change room.
  $FB8E,$01 Return.

b $FB8F Table: Pour Tokens
@ $FB8F label=Table_PourTokens
D $FB8F The rooms in which Pour carries the player to the ruined cottage.
B $FB8F,$01 Room #N(#PEEK(#PC)).
L $FB8F,$01,$03

c $FB92 Action: Use
@ $FB92 label=Action_Use
D $FB92 Carry out the "Use" command.
  $FB92,$04 Call #R$B670 to check that the command names an object, and return if it does not.
  $FB96,$0C Call #R$B7D3 to dispatch the matching phrase, for #N$01 entry.
  $FBA2,$03 Continue at #R$F205.

w $FBA5 Table: Use Phrases
@ $FBA5 label=Table_UsePhrases
D $FBA5 The Use phrase pointer and its handler.
  $FBA5,$04

W $FBA5,$02
L $FBA5,$02,$02

c $FBA9 Game Start
@ $FBA9 label=GameStart
D $FBA9 Copy the default state into working memory, open the starting exits, and enter the game loop.
  $FBA9,$0B Copy #N$0186 bytes from #R$FBDC to the item-location table.
N $FBB4 Remove a bunch of room exits (as actions in the game will open them back up).
  $FBB4,$04 Point #REGix at the configurable exits.
  $FBB8,$04 Count the configurable exits to close.
  $FBBC,$01 Set #REGa to #N$00 which "removes" the exit.
@ $FBBD label=GameStart_Loop
  $FBBD,$0D Close this configurable exit.
  $FBCA,$05 Open the east exit from the Hall of Infinity into the Lair of the Hydra.
  $FBCF,$05 Open the south exit from the Hall of the Phoenix into the Hall of Black Magic.
  $FBD4,$05 Begin in the Field.
  $FBD9,$03 Continue at #R$E9A1.

g $FBDC Default Game State
@ $FBDC label=DefaultGameState
D $FBDC Game Start copies these #N$0186 bytes to the item-location table.
  $FBDC,$0186

u $FD62 Unused
@ $FD62 label=Unused_BeforeVerbTable
D $FD62 The byte between the default game state and the verb jump table.
. The state copy stops before it.
  $FD62,$01

w $FD63 Jump Table: Verbs
@ $FD63 label=JumpTable_Verbs
D $FD63 One word per verb token, in token order.
W $FD63,$02
L $FD63,$02,$24

c $FDAB Handler: The Field
@ $FDAB label=HandlerTheField
D $FDAB Show the picture for the Field.
  $FDAB,$04 Point at the picture of the Field.
  $FDAF,$02 Rejoin the shared picture display at #R$FDDF.

c $FDB1 Handler: The Monastery
@ $FDB1 label=HandlerTheMonastery
D $FDB1 Show the picture for the Monastery.
  $FDB1,$04 Point at the picture of the Monastery.
  $FDB5,$02 Rejoin the shared picture display at #R$FDDF.

c $FDB7 Handler: The King's Chamber
@ $FDB7 label=HandlerTheKingsChamber
D $FDB7 Show the picture for the King's Chamber.
  $FDB7,$04 Point at the picture of the King's Chamber.
  $FDBB,$02 Rejoin the shared picture display at #R$FDDF.

c $FDBD Handler: The Oil Room And The Acid Room
@ $FDBD label=HandlerTheOilRoomAndTheAcidRoom
D $FDBD Show the picture for the Oil Room And The Acid Room.
  $FDBD,$04 Point at the picture shared by the Oil Room and the Acid Room.
  $FDC1,$02 Rejoin the shared picture display at #R$FDDF.

c $FDC3 Handler: The Sea Cavern
@ $FDC3 label=HandlerTheSeaCavern
D $FDC3 Show the picture for the Sea Cavern.
  $FDC3,$04 Point at the picture of the Sea Cavern.
  $FDC7,$02 Rejoin the shared picture display at #R$FDDF.

c $FDC9 Handler: The Long Barrow
@ $FDC9 label=HandlerTheLongBarrow
D $FDC9 Show the picture for the Long Barrow.
  $FDC9,$04 Point at the picture of the Long Barrow.
  $FDCD,$02 Rejoin the shared picture display at #R$FDDF.

c $FDCF Handler: The Hall Of The Black Knight
@ $FDCF label=HandlerTheHallOfTheBlackKnight
D $FDCF Show the picture for the Hall Of The Black Knight.
  $FDCF,$04 Point at the picture of the Hall of the Black Knight.
  $FDD3,$02 Rejoin the shared picture display at #R$FDDF.

c $FDD5 Handler: The Treasury
@ $FDD5 label=HandlerTheTreasury
D $FDD5 Show the picture for the Treasury.
  $FDD5,$04 Point at the picture of the Treasury.
  $FDD9,$02 Rejoin the shared picture display at #R$FDDF.

c $FDDB Handler: The Edge Of The Sea
@ $FDDB label=HandlerTheEdgeOfTheSea
D $FDDB Show the picture for the Edge Of The Sea.
  $FDDB,$04 Point at the picture of the Edge of the Sea.
@ $FDDF label=Handler_ShowPicture
  $FDDF,$03 Call #R$AD60 to draw the room picture.
  $FDE2,$05 Call #R$B516 to print the room description.
  $FDE7,$03 Call #R$ABE1 to read the player's key.
  $FDEA,$01 Return.

w $FDEB Jump Table: Room Images
@ $FDEB label=JumpTable_RoomImages
D $FDEB One word per picture slot. The oil room and the acid room share the fourth entry.
W $FDEB,$02
L $FDEB,$02,$0A

b $FDFF Table: Rooms With Images
@ $FDFF label=Table_RoomsWithImages
D $FDFF Room ids that have a picture, in the same order as #R$FDEB, then an #N$00 end marker.
B $FDFF,$01 Room #N(#PEEK(#PC)).
L $FDFF,$01,$0A
B $FE09,$01 End marker.

u $FE0A Unused
D $FE0A RAM above the loaded game image.
