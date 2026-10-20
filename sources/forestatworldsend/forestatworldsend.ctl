; Copyright Interceptor Software UK 1984, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction
; e.g. Print_HighScore_Loop.

> $4000 @start
> $4000 @expand=#DEF1(#SKOOLKID(addr)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/#EVAL({addr},16,4).html">){name}#HTML(</a>))
@ $4000 org=$4000
> $4000 @rom
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @expand=#DEF(#MESSAGE(addr) #STR$addr,$08($b==$FF))
> $4000 @set-handle-unsupported-macros=1

b $4000 Loading Screen
@ $4000 label=Loading
D $4000 #UDGTABLE
. { =h Forest At World's End Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B00 Tape Loader
@ $5B00 label=TapeLoader
D $5B00 Load the picture, the room graphics and the game from tape, then start.
N $5B00 Load the picture.
  $5B00,$07 Load #N$1B00 bytes of the picture to #N$4000.
  $5B07,$03 Call #R$5B1B to load the picture.
N $5B0A Load the room graphics.
  $5B0A,$07 Load #N$581D bytes of the room graphics to #R$61A8.
  $5B11,$03 Call #R$5B1B to load the room graphics.
N $5B14 Load the game, then fall into the loader.
@ $5B14 nowarn
  $5B14,$07 Load #N$41C8 bytes of the game to #R$B9C5.

c $5B1B Tape Loading
@ $5B1B label=TapeLoading
D $5B1B Load one tape block into the address and length set up by the caller.
N $5B1B Load the next block from tape.
  $5B1B,$02 This is a data block (#N$45).
  $5B1D,$01 Set the carry flag to indicate "loading".
  $5B1E,$03 Call #SKOOLKID$0802(LD_BLOCK).
  $5B21,$01 Return.

u $5B22 Unused
D $5B22 Padding between the tape loader and the system variables.

i $5C00
B $5C00,$5A8

b $61A8 Graphics: The Great Valley
@ $61A8 label=Image_TheGreatValley
D $61A8 #PUSHS
. #UDGTABLE
. { =h The Great Valley }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$00)#SCR$02{$00,$00,$200,$100}(great-valley) }
. UDGTABLE#
. #POPS
  $61A8,$0843

b $69EB Graphics: The Woodman's Hut
@ $69EB label=Image_TheWoodmansHut
D $69EB #PUSHS
. #UDGTABLE
. { =h The Woodman's Hut }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$01)#SCR$02{$00,$00,$200,$100}(woodmans-hut) }
. UDGTABLE#
. #POPS
  $69EB,$0A97

b $7482 Graphics: The Old Well
@ $7482 label=Image_TheOldWell
D $7482 #PUSHS
. #UDGTABLE
. { =h The Old Well }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$02)#SCR$02{$00,$00,$200,$100}(old-well) }
. UDGTABLE#
. #POPS
  $7482,$06EF

b $7B71 Graphics: The Volcano
@ $7B71 label=Image_TheVolcano
D $7B71 #PUSHS
. #UDGTABLE
. { =h The Volcano }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$03)#SCR$02{$00,$00,$200,$100}(volcano) }
. UDGTABLE#
. #POPS
  $7B71,$07ED

b $835E Graphics: The Witch's Hovel
@ $835E label=Image_TheWitchsHovel
D $835E #PUSHS
. #UDGTABLE
. { =h The Witch's Hovel }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$04)#SCR$02{$00,$00,$200,$100}(witchs-hovel) }
. UDGTABLE#
. #POPS
  $835E,$087C

b $8BDA Graphics: The Burned Out Farm
@ $8BDA label=Image_TheBurnedOutFarm
D $8BDA #PUSHS
. #UDGTABLE
. { =h The Burned Out Farm }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$05)#SCR$02{$00,$00,$200,$100}(burned-out-farm) }
. UDGTABLE#
. #POPS
  $8BDA,$0801

b $93DB Graphics: The Enchanted Wood
@ $93DB label=Image_TheEnchantedWood
D $93DB #PUSHS
. #UDGTABLE
. { =h The Enchanted Wood }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$06)#SCR$02{$00,$00,$200,$100}(enchanted-wood) }
. UDGTABLE#
. #POPS
  $93DB,$0AA4

b $9E7F Graphics: The Dungeon
@ $9E7F label=Image_TheDungeon
D $9E7F #PUSHS
. #UDGTABLE
. { =h The Dungeon }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$09)#SCR$02{$00,$00,$200,$100}(dungeon) }
. UDGTABLE#
. #POPS
  $9E7F,$084A

b $A6C9 Graphics: Marl's Gateway
@ $A6C9 label=Image_MarlsGateway
D $A6C9 #PUSHS
. #UDGTABLE
. { =h Marl's Gateway }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$0A)#SCR$02{$00,$00,$200,$100}(marls-gateway) }
. UDGTABLE#
. #POPS
  $A6C9,$07B1

b $AE7A Graphics: The Cavern of Silence
@ $AE7A label=Image_TheCavernOfSilence
D $AE7A #PUSHS
. #UDGTABLE
. { =h The Cavern of Silence }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$0B)#SCR$02{$00,$00,$200,$100}(cavern-of-silence) }
. UDGTABLE#
. #POPS
  $AE7A,$0B4B

c $B9C5 Game Entry Point
@ $B9C5 label=GameEntryPoint
D $B9C5 Enter the game by jumping to the initialisation routine.
  $B9C5,$03 Jump to #R$F964 to start a new game.

b $B9C8 Game State
@ $B9C8 label=GameState
D $B9C8 Workspace filled from #R$F992 by the routine at #R$F964.
. Object locations occupy the #N$4A bytes at #R$B9C8. The current room
. is *#R$BA9B. Pointers to the message, exit and handler tables follow.
B $B9C8,$01
L $B9C8,$01,$13C

b $BB04 Input Buffer
@ $BB04 label=InputBuffer
D $BB04 The line being typed, the parsed tokens, and the eight-byte
. picture expansion buffer at #R$BB45.
B $BB04,$01
L $BB04,$01,$51

t $BB55 Messaging: "> "
@ $BB55 label=Messaging_Message
  $BB55,$02 "#MESSAGE$BB55".
B $BB57,$01 Terminator.

t $BB58 Messaging: "<BS> <BS>"
@ $BB58 label=Messaging_BackspaceSpaceBackspace
D $BB58 Rubs out the input prompt.
  $BB58,$03 "#MESSAGE$BB58".
B $BB5B,$01 Terminator.

t $BB5C Messaging: "THE"
@ $BB5C label=Messaging_THE
  $BB5C,$04 "#MESSAGE$BB5C".
B $BB60,$01 Terminator.

t $BB61 Messaging: "I Don't Understand"
@ $BB61 label=Messaging_IDontUnderstand
  $BB61,$13 "#MESSAGE$BB61".
B $BB74,$01 Terminator.

t $BB75 Messaging: "I Don't Know The Word"
@ $BB75 label=Messaging_IDontKnowTheWord
  $BB75,$17 "#MESSAGE$BB75".
B $BB8C,$01 Terminator.

t $BB8D Messaging: "Nothing"
@ $BB8D label=Messaging_Nothing
  $BB8D,$08 "#MESSAGE$BB8D".
B $BB95,$01 Terminator.

t $BB96 Messaging: "You Can See"
@ $BB96 label=Messaging_YouCanSee
  $BB96,$0E "#MESSAGE$BB96".
B $BBA4,$01 Terminator.

t $BBA5 Messaging: "Ampersand "
@ $BBA5 label=Messaging_Ampersand
  $BBA5,$03 "#MESSAGE$BBA5".
B $BBA8,$01 Terminator.

t $BBA9 Messaging: "There Are Exits"
@ $BBA9 label=Messaging_ThereAreExits
  $BBA9,$12 "#MESSAGE$BBA9".
B $BBBB,$01 Terminator.

t $BBBC Messaging: "There Is An Exit"
@ $BBBC label=Messaging_ThereIsAnExit
  $BBBC,$12 "#MESSAGE$BBBC".
B $BBCE,$01 Terminator.

t $BBCF Exits Messaging: "North"
@ $BBCF label=MessagingExits_North
  $BBCF,$05 "#MESSAGE$BBCF".
B $BBD4,$01 Terminator.

t $BBD5 Exits Messaging: "South"
@ $BBD5 label=MessagingExits_South
  $BBD5,$05 "#MESSAGE$BBD5".
B $BBDA,$01 Terminator.

t $BBDB Exits Messaging: "East"
@ $BBDB label=MessagingExits_East
  $BBDB,$04 "#MESSAGE$BBDB".
B $BBDF,$01 Terminator.

t $BBE0 Exits Messaging: "West"
@ $BBE0 label=MessagingExits_West
  $BBE0,$04 "#MESSAGE$BBE0".
B $BBE4,$01 Terminator.

t $BBE5 Exits Messaging: "Up"
@ $BBE5 label=MessagingExits_Up
  $BBE5,$02 "#MESSAGE$BBE5".
B $BBE7,$01 Terminator.

t $BBE8 Exits Messaging: "Down"
@ $BBE8 label=MessagingExits_Down
  $BBE8,$04 "#MESSAGE$BBE8".
B $BBEC,$01 Terminator.

t $BBED Messaging: "I Can't See"
@ $BBED label=Messaging_ICantSee
  $BBED,$0C "#MESSAGE$BBED".
B $BBF9,$01 Terminator.

t $BBFA Messaging: "Here"
@ $BBFA label=Messaging_Here
  $BBFA,$06 "#MESSAGE$BBFA".
B $BC00,$01 Terminator.

t $BC01 Messaging: "You Are Dead"
@ $BC01 label=Messaging_YouAreDead
  $BC01,$0D "#MESSAGE$BC01".
B $BC0E,$01 Terminator.

t $BC0F Messaging: "Want Another Game? Y/N"
@ $BC0F label=Messaging_WantAnotherGameYN
  $BC0F,$17 "#MESSAGE$BC0F".
B $BC26,$01 Terminator.

t $BC27 Messaging: "LOADING. Start Tape"
@ $BC27 label=Messaging_LOADINGStartTape
  $BC27,$14 "#MESSAGE$BC27".
B $BC3B,$01 Terminator.

t $BC3C Messaging: "Tape Error"
@ $BC3C label=Messaging_TapeError
  $BC3C,$0B "#MESSAGE$BC3C".
B $BC47,$01 Terminator.

t $BC48 Messaging: "SAVING"
@ $BC48 label=Messaging_SAVING
  $BC48,$21 "#MESSAGE$BC48".
B $BC69,$01 Terminator.

t $BC6A Messaging: "Stop Tape.Saving Complete"
@ $BC6A label=Messaging_StopTapeSavingComplete
  $BC6A,$1A "#MESSAGE$BC6A".
B $BC84,$01 Terminator.

t $BC85 Messaging: "Want To Save The Game? Y/N"
@ $BC85 label=Messaging_WantToSaveTheGameYN
  $BC85,$1B "#MESSAGE$BC85".
B $BCA0,$01 Terminator.

t $BCA1 Messaging: "Please Be More Specific"
@ $BCA1 label=Messaging_PleaseBeMoreSpecific
  $BCA1,$18 "#MESSAGE$BCA1".
B $BCB9,$01 Terminator.

t $BCBA Messaging: "Please Rephrase That"
@ $BCBA label=Messaging_PleaseRephraseThat
  $BCBA,$15 "#MESSAGE$BCBA".
B $BCCF,$01 Terminator.

t $BCD0 Messaging: "You Can't"
@ $BCD0 label=Messaging_YouCant
  $BCD0,$0A "#MESSAGE$BCD0".
B $BCDA,$01 Terminator.

t $BCDB Messaging: "O.K"
@ $BCDB label=Messaging_OK
  $BCDB,$04 "#MESSAGE$BCDB".
B $BCDF,$01 Terminator.

t $BCE0 Messaging: "You're Already Carrying"
@ $BCE0 label=Messaging_YoureAlreadyCarrying
  $BCE0,$18 "#MESSAGE$BCE0".
B $BCF8,$01 Terminator.

t $BCF9 Messaging: "Full Stop"
@ $BCF9 label=Messaging_FullStop
  $BCF9,$01 "#MESSAGE$BCF9".
B $BCFA,$01 Terminator.

t $BCFB Messaging: "It"
@ $BCFB label=Messaging_It
  $BCFB,$03 "#MESSAGE$BCFB".
B $BCFE,$01 Terminator.

t $BCFF Messaging: "Them"
@ $BCFF label=Messaging_Them
  $BCFF,$05 "#MESSAGE$BCFF".
B $BD04,$01 Terminator.

t $BD05 Messaging: "You Can't Carry Any More"
@ $BD05 label=Messaging_YouCantCarryAnyMore
  $BD05,$19 "#MESSAGE$BD05".
B $BD1E,$01 Terminator.

t $BD1F Messaging: "You Are Carrying"
@ $BD1F label=Messaging_YouAreCarrying
  $BD1F,$12 "#MESSAGE$BD1F".
B $BD31,$01 Terminator.

t $BD32 Messaging: "You Can't Go In That Direction"
@ $BD32 label=Messaging_YouCantGoInThatDirection
  $BD32,$1F "#MESSAGE$BD32".
B $BD51,$01 Terminator.

t $BD52 Messaging: "One At A Time,Please"
@ $BD52 label=Messaging_OneAtATimePlease
  $BD52,$15 "#MESSAGE$BD52".
B $BD67,$01 Terminator.

t $BD68 Messaging: "I Don't See The Point"
@ $BD68 label=Messaging_IDontSeeThePoint
  $BD68,$16 "#MESSAGE$BD68".
B $BD7E,$01 Terminator.

t $BD7F Messaging: "You're Not Carrying"
@ $BD7F label=Messaging_YoureNotCarrying
  $BD7F,$14 "#MESSAGE$BD7F".
B $BD93,$01 Terminator.

t $BD94 Messaging: "You're Not Carrying Anything"
@ $BD94 label=Messaging_YoureNotCarryingAnything
  $BD94,$1D "#MESSAGE$BD94".
B $BDB1,$01 Terminator.

g $BDB2 Table: Directions
@ $BDB2 label=Table_Directions
D $BDB2 Pointers to the direction names, in the order north, south,
. east, west, up and down.
W $BDB2,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $BDB2,$02,$06

c $BDBE Response: "Please Rephrase That"
@ $BDBE label=Response_PleaseRephraseThat
D $BDBE Tell the player to rephrase the command.
  $BDBE,$06 Print "#MESSAGE$BCBA".
  $BDC4,$01 Return.

c $BDC5 Response: "Please Be More Specific"
@ $BDC5 label=Response_PleaseBeMoreSpecific
D $BDC5 Ask the player to be more specific.
  $BDC5,$06 Print "#MESSAGE$BCA1".
  $BDCB,$01 Return.

c $BDCC Response: "You Can't"
@ $BDCC label=Response_YouCant
D $BDCC Tell the player the command is impossible.
  $BDCC,$06 Print "#MESSAGE$BCD0".
  $BDD2,$01 Return.

c $BDD3 Response: "O.K"
@ $BDD3 label=Response_Ok
D $BDD3 Acknowledge the command.
  $BDD3,$06 Print "#MESSAGE$BCDB".
  $BDD9,$01 Return.

c $BDDA Get User Input
@ $BDDA label=GetUserInput
D $BDDA Wait for a new keypress.
R $BDDA O:A The keypress value
  $BDDA,$07 Read *#SKOOLKID$5C3B(FLAGS) and jump back to #R$BDDA until a new key is pressed.
  $BDE1,$02 Reset the "new key has been pressed" flag.
  $BDE3,$03 Write it back to *#SKOOLKID$5C3B(FLAGS).
N $BDE6 Fetch the keypress.
  $BDE6,$03 Copy the key from *#SKOOLKID$5C08(LAST_K).
  $BDE9,$01 Return.

c $BDEA Clear Screen
@ $BDEA label=ClearScreen
D $BDEA Clear the screen and select the text channel.
  $BDEA,$03 Call #R$BE13 to select the screen channel.
  $BDED,$03 Call #SKOOLKID$0D6B(CLS).
  $BDF0,$01 Return.

c $BDF1 Clear Lines
@ $BDF1 label=ClearLines
D $BDF1 Clear the picture lines, using the line count stored at #R$BB40.
R $BDF1 B Line count from *#R$BB40
  $BDF1,$03 Call #R$BE13 to select the screen channel.
  $BDF4,$07 Clear the number of lines held by *#R$BB40 from the bottom of the screen using #SKOOLKID$0E44(CL_LINE).
  $BDFB,$01 Return.

c $BDFC Set Default Screen Position
@ $BDFC label=SetDefaultScreenPosition
D $BDFC Park the cursor at the top-left of the text window.
  $BDFC,$03 Call #R$BE13 to select the screen channel.
  $BDFF,$03 Park the cursor at column #N$21 of row #N$03.
  $BE02,$03 Call #SKOOLKID$0DD9(CL_SET).
  $BE05,$01 Return.

c $BE06 Set Screen Position
@ $BE06 label=SetScreenPosition
D $BE06 Park the cursor on the text row stored at #R$BB40.
R $BE06 A Line number to start printing at
  $BE06,$03 Call #R$BE13 to select the screen channel.
  $BE09,$04 Take the text row from *#R$BB40.
  $BE0D,$05 Call #SKOOLKID$0DD9(CL_SET) with column #N$21.
  $BE12,$01 Return.

c $BE13 Switch To Normal Screen Output
@ $BE13 label=SwitchToNormalScreenOutput
D $BE13 Open the upper screen channel without disturbing the registers.
  $BE13,$09 Save the registers and open the upper screen with #SKOOLKID$1601(CHAN_OPEN) on stream #N$02.
  $BE1C,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $BE20,$01 Return.

c $BE21 Print String
@ $BE21 label=PrintString
D $BE21 Print a message terminated by #N$FF.
R $BE21 HL Pointer to a message terminated by #N$FF
  $BE21,$03 Call #R$BE13 to select the screen channel.
N $BE24 Keep printing until the #N$FF terminator.
@ $BE24 label=PrintString_Loop
  $BE24,$02 Read the next character and advance the pointer.
  $BE26,$03 Return if this character is the #N$FF terminator.
N $BE29 Print this character.
  $BE29,$03 Call #R$BE37.
  $BE2C,$02 Jump back to #R$BE24 for the next character.

c $BE2E Print String And A Newline
@ $BE2E label=PrintStringAndANewline
D $BE2E Print a message terminated by #N($FF), then move to the next line.
R $BE2E HL Pointer to a message terminated by #N$FF
N $BE2E Print the message.
  $BE2E,$03 Call #R$BE21.
N $BE31 Force a newline.
  $BE31,$02 Start a new line (#N$0D).
  $BE33,$03 Call #R$BE37 to print the newline.
  $BE36,$01 Return.

c $BE37 Print Character
@ $BE37 label=PrintCharacter
D $BE37 Print one character, scrolling the text window when the cursor reaches its edge.
R $BE37 A Character to print
  $BE37,$01 Keep the character safe on the stack.
  $BE38,$07 Jump to #R$BE52 if the line byte of #SKOOLKID$5C88(S_POSN) (#N$5C89) is not row #N$03.
  $BE3F,$02 Restore the character from the stack, leaving a copy.
  $BE41,$04 Jump to #R$BE4A if this is not a newline (#N$0D).
N $BE45 A newline scrolls the text window and prints nothing.
  $BE45,$03 Call #R$BE55.
  $BE48,$01 Discard the character from the stack.
  $BE49,$01 Return.
N $BE4A Check the column.
@ $BE4A label=PrintCharacter_CheckColumn
  $BE4A,$08 Call #R$BE55 if *#SKOOLKID$5C88(S_POSN) is column #N$01.
N $BE52 Print the character.
@ $BE52 label=PrintCharacter_Direct
  $BE52,$01 Restore the character from the stack.
  $BE53,$01 Print it with #SKOOLKID$0010(PRINT_A_1).
  $BE54,$01 Return.

c $BE55 Scroll Screen
@ $BE55 label=ScrollScreen
D $BE55 Scroll the text up and put the cursor back on the top line.
  $BE55,$01 Switch to the shadow registers.
N $BE56 Scroll the text up.
  $BE56,$03 Call #SKOOLKID$0DFE(CL_SC_ALL).
N $BE59 Put the cursor back at the top of the text window.
  $BE59,$03 Call #R$BDFC to put the cursor back at the top.
  $BE5C,$01 Switch back to the main registers.
  $BE5D,$01 Return.

c $BE5E Print Room Graphic
@ $BE5E label=Print_RoomGraphic
D $BE5E Unpack a room picture into the display, drawing it in the paper colour.
R $BE5E IX Pointer to room image data
  $BE5E,$03 Call #R$BE13 to select the screen channel.
  $BE61,$03 Set the cursor to row #N($18), column #N$21.
  $BE64,$03 Call #SKOOLKID$0DD9(CL_SET).
N $BE67 Draw the picture in the paper colour.
  $BE67,$03 Take the current attribute from *#SKOOLKID$5C8F(ATTR_T).
  $BE6A,$01 Fetch the attribute byte.
  $BE6B,$02 Keep only the PAPER bits.
  $BE6D,$03 Move the PAPER bits into the INK bits.
  $BE70,$01 Keep that ink colour.
  $BE71,$01 Fetch the attribute byte again.
  $BE72,$02 Keep everything except the old INK bits.
  $BE74,$01 Combine the two values.
  $BE75,$01 Write the result back to *#SKOOLKID$5C8F(ATTR_T).
  $BE76,$03 Count #N$0200 picture bytes.
@ $BE79 label=Print_RoomGraphic_Loop
  $BE79,$01 Keep the byte counter safe.
  $BE7A,$03 Use the scanline buffer (#R$BB45).
  $BE7D,$02 Count #N$08 bits.
  $BE7F,$05 Read the next control byte and advance through the picture.
  $BE84,$02 Jump to #R$BE87 to test the first control bit.
@ $BE86 label=Print_RoomGraphic_NextByte
  $BE86,$01 Advance to the next byte of the scanline.
@ $BE87 label=Print_RoomGraphic_ShiftBit
  $BE87,$02 Take the next control bit; a set bit means this scanline byte comes from the picture data.
  $BE89,$02 Jump to #R$BE92 when that bit is reset, so the byte is blank.
  $BE8B,$05 Read the next picture byte and advance through the picture.
  $BE90,$02 Jump to #R$BE93 to store the picture byte.
@ $BE92 label=Print_RoomGraphic_BlankByte
  $BE92,$01 Use a blank byte.
@ $BE93 label=Print_RoomGraphic_StoreByte
  $BE93,$01 Store the byte in the scanline buffer.
  $BE94,$02 Repeat from #R$BE86 until the eight bits of this control byte are used.
  $BE96,$03 Take the finished scanline (#R$BB45).
  $BE99,$03 Call #SKOOLKID$0B03(PO_FETCH).
  $BE9C,$03 Call PR_ALL at #N($0B7F), part of #SKOOLKID$0B24(PO_ANY).
  $BE9F,$03 Call #SKOOLKID$0ADC(PO_STORE).
  $BEA2,$01 Restore the byte counter from the stack.
  $BEA3,$01 Step the byte counter down.
  $BEA4,$04 Jump back to #R$BE79 until every picture byte has been drawn.
  $BEA8,$03 Call #SKOOLKID$0D4D(TEMPS).
  $BEAB,$01 Return.

c $BEAC Colour Room Image
@ $BEAC label=Colour_RoomImage
D $BEAC Copy the #N$0200 attribute bytes that follow a picture into the screen.
R $BEAC IX Pointer to the room attribute data
  $BEAC,$03 Point #REGde at the attribute file (#N$5800).
  $BEAF,$03 Copy the attribute pointer from #REGix into #REGhl.
  $BEB2,$05 Copy #N$0200 attribute bytes onto the screen.
  $BEB7,$01 Return.

c $BEB8 Print Room Image
@ $BEB8 label=Print_RoomImage
D $BEB8 Draw a room picture and then its colours.
R $BEB8 IX Pointer to room image data
N $BEB8 Draw the picture, then its colours.
  $BEB8,$03 Call #R$BE5E.
  $BEBB,$03 Call #R$BEAC.
  $BEBE,$01 Return.

c $BEBF Clear Room Image
@ $BEBF label=ClearRoomImage
D $BEBF Flood the picture's attribute area with the given colour.
R $BEBF A Attribute byte value
  $BEBF,$06 Start at the attribute file and count #N$0200 bytes.
  $BEC5,$01 Keep that attribute colour.
@ $BEC6 label=ClearRoomImage_Loop
  $BEC6,$05 Write that colour through the picture attributes.
  $BECB,$02 Jump back to #R$BEC6 until the picture area is filled.
  $BECD,$01 Return.

c $BECE Handler: Turn-Based Events
@ $BECE label=Handler_TurnBasedEvents
D $BECE Count down the timed threats and, when one expires, run its handler.
  $BECE,$06 Jump to #R$BF00 when the event mask is zero.
  $BED4,$07 Count the eight event bits, and skip a threat whose bit is clear.
@ $BED7 label=Handler_TurnBasedEvents_Loop
  $BEDB,$03 #REGde=#N($0000,$04,$04).
  $BEDE,$0B Count this threat's timer down. Leave it alone while time
. remains.
  $BEE9,$0E Take this threat's handler.
  $BEF7,$06 Keep the bit scan safe, return here, and jump to that handler.
  $BEFD,$01 Restore the bit scan from the stack.
@ $BEFE label=Handler_TurnBasedEvents_Next
  $BEFE,$02 Repeat from #R$BED7 for the remaining event bits.
@ $BF00 label=Handler_TurnBasedEvents_Scenic
  $BF00,$0A Start at the scenic list. Jump to #R$BF40 when the scenic count is
. zero.
  $BF0A,$03 Start at the first scenic entry.
@ $BF0D label=Handler_TurnBasedEvents_ScenicAdvance
  $BF0D,$01 Advance to the next scenic entry.
@ $BF0E label=Handler_TurnBasedEvents_ScenicSlot
  $BF0E,$04 Jump to #R$BF3E when this scenic slot is empty.
  $BF12,$06 Jump to #R$BF3E when this event is already in the current room.
  $BF18,$0E Call #R$C0C3 to fetch this event's room list.
  $BF26,$0E Use the frame counter as a step count and start at the first room in
. the list.
@ $BF2C label=Handler_TurnBasedEvents_RoomWalk
@ $BF34 label=Handler_TurnBasedEvents_RoomStep
  $BF34,$01 Step to the next room in the list.
@ $BF35 label=Handler_TurnBasedEvents_RoomCheck
  $BF35,$03 Jump back to #R$BF2C when the end marker matches.
  $BF38,$02 Repeat from #R$BF34 until the step count runs out.
  $BF3A,$01 Take the room the walk landed on.
  $BF3B,$02 Restore the scenic counter and scenic entry pointer from the stack.
  $BF3D,$01 Store that room back in this scenic slot.
@ $BF3E label=Handler_TurnBasedEvents_ScenicNext
  $BF3E,$02 Repeat from #R$BF0D for the remaining scenic events.
@ $BF40 label=Handler_TurnBasedEvents_Return
  $BF40,$01 Return.

c $BF41 Pause Loop
@ $BF41 label=Pause_Loop
D $BF41 Wait for the given number of frames.
R $BF41 B Number of frames to wait
  $BF41,$01 Halt for one frame.
  $BF42,$02 Repeat until those frames have passed.
  $BF44,$01 Return.

c $BF45 Generate Random Number
@ $BF45 label=GenerateRandomNumber
D $BF45 Return a number between #N$00 and the limit passed in.
R $BF45 O:A A random number derived from *#SKOOLKID$5C78(FRAMES)
  $BF45,$07 Save the limit and take the low byte of *#SKOOLKID$5C78(FRAMES) as the scramble.
@ $BF4C label=GenerateRandomNumber_Loop
  $BF4C,$04 Step the result down, wrapping to the limit when it passes zero.
@ $BF50 label=GenerateRandomNumber_Repeat
  $BF50,$02 Repeat that step once for each frame count.
  $BF52,$01 Step the result down once more, so the range starts at zero.
  $BF53,$01 Restore the saved limit from the stack.
  $BF54,$01 Return.

c $BF55 Handler: Update Object Location
@ $BF55 label=UpdateObjectLocation
D $BF55 Write a new location for an object, or for a scenic-event room.
N $BF55 Bit 7 selects the scenic-room list instead of the object table.
  $BF55,$04 Jump to #R$BF60 for an ordinary object.
  $BF59,$05 Clear that bit and use the scenic list (#R$BA48).
  $BF5E,$02 Jump to #R$BF63 to write the location.
@ $BF60 label=UpdateObjectLocation_Objects
  $BF60,$03 Look up the object locations (#R$B9C8).
@ $BF63 label=UpdateObjectLocation_Write
  $BF63,$05 Write the new location.
  $BF68,$01 Return.

c $BF69 Is Object Present?
@ $BF69 label=IsObjectPresent
D $BF69 Report whether this object occurs anywhere in the location table.
  $BF69,$09 Search the object locations at #R$B9C8 for this object.
  $BF72,$01 Return.

c $BF73 Handler: User Input
@ $BF73 label=Handler_UserInput
D $BF73 Read a line of text, then turn it into vocabulary tokens.
N $BF73 Reset the cursor to the top of the text window.
  $BF73,$03 Call #R$BDFC to park the cursor at the top of the text.
N $BF76 Clear the command buffer.
  $BF76,$03 Start at the command buffer (#R$BB04).
  $BF79,$04 Prepare a space (#N$20) and a counter of #N$32 bytes.
@ $BF7D label=UserInput_Clear
  $BF7D,$04 Write spaces through the whole command buffer.
N $BF81 Print the "&gt;" prompt.
  $BF81,$03 Call #R$C3C0.
N $BF84 Collect keypresses.
  $BF84,$03 Start again at the beginning of the command.
N $BF87 Wait for the next key.
@ $BF87 label=UserInput_Loop
  $BF87,$03 Call #R$BDDA.
N $BF8A DELETE rubs out a character. ENTER finishes the line. Any other control key
. is ignored.
  $BF8A,$04 Jump to #R$BFAA if DELETE was pressed.
  $BF8E,$04 Jump to #R$BFC1 if ENTER was pressed.
  $BF92,$04 Jump back to #R$BF87 when the key is below SPACE.
N $BF96 Is the command buffer full?
  $BF96,$0A Jump back to #R$BF87 once the pointer has reached the sentinel at #R$BB35.
N $BFA0 The key is valid, so store it and print it.
  $BFA0,$01 Write the key into the command buffer.
  $BFA1,$03 Call #R$BE13 to select the screen channel.
  $BFA4,$03 Call #R$BE37 to echo the key.
  $BFA7,$01 Advance to the next space in the buffer.
  $BFA8,$02 Jump back to #R$BF87 for the next key.
@ $BFAA label=UserInput_Delete
N $BFAA The player pressed DELETE.
  $BFAA,$0A Jump back to #R$BF87 when the buffer is still empty.
N $BFB4 Rub the previous character off the screen.
  $BFB4,$01 Keep the buffer pointer safe.
  $BFB5,$06 Print "#MESSAGE$BB58".
  $BFBB,$01 Restore the buffer pointer from the stack.
  $BFBC,$03 Step back one character and blank it.
  $BFBF,$02 Jump back to #R$BF87 for the next key.
@ $BFC1 label=UserInput_Enter
N $BFC1 The player pressed ENTER, so close the command and clear the tokens.
  $BFC1,$01 Store ENTER as the end of the command.
  $BFC2,$03 Call #R$BE13 to select the screen channel.
  $BFC5,$03 Call #R$BE37 to echo ENTER.
  $BFC8,$07 Start at the token buffer (#R$BB36) and prepare the empty marker
. #N$FF.
@ $BFCF label=UserInput_ClearTokens
  $BFCF,$04 Write #N$FF into each of the #N$0A token slots.
  $BFD3,$05 Start at the command and allow #N$0A words, then fall into the
. parser.

c $BFD8 Parser: Match Input Word
@ $BFD8 label=Parser_MatchInputWord
D $BFD8 Split the command into words and look each one up in the vocabulary.
N $BFD8 Blank the four-character word buffer.
  $BFD8,$03 Start at the word buffer (#R$BB41).
  $BFDB,$04 Prepare a space and a counter of #N$04 characters.
@ $BFDF label=MatchInputWord_Clear
  $BFDF,$04 Write spaces through the word buffer.
  $BFE3,$0B Jump to #R$C0B4 when no token slots remain, or the command has ended.
N $BFEE Copy the next word, up to #N$04 characters, stopping at a space, a comma or
. ENTER.
  $BFEE,$05 Copy up to #N$04 characters into the word buffer.
@ $BFF3 label=MatchInputWord_Copy
  $BFF3,$05 Jump to #R$C01F when the character is ENTER.
  $BFF8,$08 Jump to #R$C015 when the character is a space or a comma.
  $C000,$03 Copy the character into the word buffer and advance both pointers.
  $C003,$02 Repeat from #R$BFF3 until four characters have been copied.
N $C005 A longer word is skipped up to the next delimiter.
@ $C005 label=MatchInputWord_Skip
  $C005,$0D Jump to #R$C01F on ENTER, or to #R$C015 on a space or a comma.
  $C012,$03 Skip this character and keep looking for a delimiter.
@ $C015 label=MatchInputWord_Delimiter
  $C015,$0A Skip consecutive spaces and commas.
N $C01F Ignore the word "THE ".
@ $C01F label=MatchInputWord_IgnoreThe
  $C01F,$09 Switch in the spare registers and point them at "THE " and the word.
@ $C028 label=MatchInputWord_The
  $C028,$08 Compare the four characters.
@ $C030 label=MatchInputWord_AfterThe
  $C030,$01 Switch back to the main registers to act on the comparison.
  $C031,$02 Jump back to #R$BFD8 when the word was THE, so it is not tokenised.
  $C033,$02 Use up one token slot.
N $C035 Look the word up in the vocabulary. A comma separates synonyms.
  $C035,$05 Start at the vocabulary, with the token index at zero.
@ $C03A label=MatchInputWord_Vocabulary
  $C03A,$05 Jump to #R$C06C when the vocabulary is exhausted.
@ $C03F label=MatchInputWord_CompareWord
  $C03F,$05 Compare the next vocabulary word with the word buffer.
@ $C044 label=MatchInputWord_CompareChar
  $C044,$02 Compare the next character.
  $C046,$06 Jump to #R$C05D when it does not match.
  $C04C,$08 Turn the vocabulary index into a token-slot offset.
  $C054,$09 Store that token in its slot at #R$BB36 and parse the next word.
@ $C05D label=MatchInputWord_NextWord
  $C05D,$04 Step to the end of this vocabulary word.
  $C061,$08 Jump back to #R$C03F to try the synonym after a comma.
@ $C069 label=MatchInputWord_NextEntry
  $C069,$03 Try the next vocabulary word.
N $C06C The word is not in the vocabulary, so quote it and ask again.
@ $C06C label=MatchInputWord_Unknown
  $C06C,$08 Find the unknown word in the command buffer.
@ $C074 label=MatchInputWord_SeekWord
  $C074,$03 Step back through the copied word count.
@ $C077 label=MatchInputWord_FindWord
  $C077,$0C Skip characters until a space or a comma.
@ $C083 label=MatchInputWord_FindDelimiter
  $C083,$0C Skip spaces and commas, then look for the next word.
@ $C08F label=MatchInputWord_PrintUnknown
  $C08F,$07 Print "#MESSAGE$BB75".
  $C096,$01 Restore the command pointer from the stack.
  $C097,$05 Print a quote.
@ $C09C label=MatchInputWord_Quote
  $C09C,$0B Print the unknown word up to the next space.
@ $C0A7 label=MatchInputWord_CloseQuote
  $C0A7,$05 Print a closing quote.
  $C0AC,$08 Print "#MESSAGE$BCF9" and read another command.

c $C0B4 Handler: Unknown Word
@ $C0B4 label=Handler_UnknownWord
D $C0B4 Say "I don't understand" when the first token was never filled in.
  $C0B4,$06 Return when the first token was recognised.
  $C0BA,$06 Print "#MESSAGE$BB61".
@ $C0C0 label=Handler_UnknownWord_Retry
  $C0C0,$03 Jump to #R$BF73 to read another command.

c $C0C3 Get Table Entry
@ $C0C3 label=GetTableEntry
D $C0C3 Fetch one address from a table of addresses.
R $C0C3 E Index of the entry
R $C0C3 IX Base table address
R $C0C3 O:HL Address from the table entry
R $C0C3 O:IX Address of the table entry
  $C0C3,$08 Double the index and add it to the table.
  $C0CB,$06 Copy that address out of the table.
  $C0D1,$01 Return.

c $C0D2 Print Objects
@ $C0D2 label=PrintObjects
D $C0D2 Print every object in the given place.
  $C0D2,$07 Look up the object locations.
@ $C0D9 label=PrintObjects_Loop
  $C0D9,$03 Return if the search did not find a match.
  $C0DC,$09 Keep the search and turn the match into an object index.
  $C0E5,$07 Call #R$C0C3 to fetch this object's description.
  $C0EC,$03 Call #R$BE2E to print the description and start a new line.
  $C0EF,$03 Restore the search from the stack.
  $C0F2,$06 Look for another object here.
  $C0F8,$01 Return.

c $C0F9 Handler: Display Room
@ $C0F9 label=Handler_DisplayRoom
D $C0F9 On the first visit, show the picture and the long description, then list what is here and which ways lead out.
  $C0F9,$01 Keep #REGde safe on the stack.
  $C0FA,$03 Call #R$BDEA to clear the screen.
  $C0FD,$01 Restore #REGde from the stack.
  $C0FE,$06 Jump to #R$C14F when room descriptions are switched off.
  $C104,$0E Search the picture list for this room. Jump to #R$C14F when it has
. no picture.
  $C112,$0A Jump to #R$C138 when this visit should show the picture.
  $C11C,$08 Find this room's visited flag.
@ $C120 label=Handler_DisplayRoom_Loop
  $C124,$05 This room's flag is in the next flag byte.
@ $C129 label=Handler_DisplayRoom_Next
  $C129,$08 Turn that bit number into a flag mask.
@ $C12D label=Handler_DisplayRoom_FlagBit
  $C131,$04 Jump to #R$C14F when this room has already been visited.
  $C135,$03 Mark this room as visited.
@ $C138 label=Handler_DisplayRoom_FirstVisit
  $C138,$0A Remember that the long description was shown, and set the text row
. to #N$08.
  $C142,$08 Call #R$C0C3 to fetch this room's picture handler.
@ $C14A nowarn
  $C14A,$05 Return to #R$C14F afterwards and jump to that handler.
@ $C14F label=Handler_DisplayRoom_PrintDescription
  $C14F,$03 Call #R$BE06 to move the cursor to the text line stored at #R$BB40.
  $C152,$05 Set the text row to #N($18), under the picture.
  $C157,$0B Call #R$C0C3 to fetch this room's long description.
  $C162,$03 Call #R$BE2E to print the room description and start a new line.
  $C165,$07 Skip the key-wait unless the long description was just shown.
  $C16C,$05 Clear that flag and wait for a key.
@ $C171 label=Handler_DisplayRoom_ListExits
  $C171,$03 Call #R$C201 to fetch this room's six exits.
  $C174,$0E Count how many of the six exits leave this room.
@ $C17B label=Handler_DisplayRoom_CountExits
@ $C17F label=Handler_DisplayRoom_CountNext
  $C182,$03 Jump to #R$C1ED when there are no exits.
  $C185,$05 Jump to #R$C1AC when more than one exit is open.
  $C18A,$06 Print "#MESSAGE$BBBC".
  $C190,$09 Point back at the exits and the direction names for the one way out.
@ $C199 label=Handler_DisplayRoom_SkipClosed
  $C199,$08 Skip a closed exit and move on to the next way out.
@ $C19E label=Handler_DisplayRoom_OneExit
  $C1A1,$09 Call #R$BE21 to print the direction name.
  $C1AA,$02 Jump to #R$C1E7 to finish the exit sentence.
@ $C1AC label=Handler_DisplayRoom_ManyExits
  $C1AC,$06 Print "#MESSAGE$BBA9".
  $C1B2,$09 Point back at the exits and the direction names.
@ $C1BB label=Handler_DisplayRoom_NextExit
  $C1BB,$09 Exchange the exit list back into #REGhl and step to the next open way out.
@ $C1BC label=Handler_DisplayRoom_StepExit
@ $C1C1 label=Handler_DisplayRoom_ExitOpen
  $C1C4,$0A Call #R$BE21 to print the direction name.
  $C1CE,$06 Jump to #R$C1E7 when no exits remain.
  $C1D4,$02 Jump to #R$C1DE to join the last exit with "and".
  $C1D6,$05 Print a comma between the exits.
  $C1DB,$03 Jump back to #R$C1BB for the next exit.
@ $C1DE label=Handler_DisplayRoom_And
  $C1DE,$06 Print "#MESSAGE$BBA5".
  $C1E4,$03 Jump back to #R$C1BB for the next exit.
@ $C1E7 label=Handler_DisplayRoom_FullStop
  $C1E7,$06 Print "#MESSAGE$BCF9".
@ $C1ED label=Handler_DisplayRoom_ListObjects
  $C1ED,$07 Call #R$BF69 to see whether this room holds anything. Return when it
. does not.
  $C1F4,$06 Print "#MESSAGE$BB96".
  $C1FA,$06 Call #R$C0D2 to list what is in this room.
  $C200,$01 Return.

c $C201 Get Room Pointer
@ $C201 label=GetRoomPointer
D $C201 Fetch the six exit bytes for the current room.
  $C201,$06 Fetch the current room into #REGde.
  $C207,$03 #REGhl=#N($0006,$04,$04).
  $C20A,$03 Call #SKOOLKID$30A9(HL_MULT_DE).
  $C20D,$05 Add the table base to the offset.
  $C212,$01 Return.

c $C213 Parser: Resolve Phrase
@ $C213 label=Parser_ResolvePhrase
D $C213 Turn a matched word into an object name, or say it cannot be seen.
  $C213,$0F Scan the phrase list for the end marker.
@ $C222 label=Parser_ResolvePhrase_Loop
  $C222,$01 Step to the next byte of the phrase.
@ $C223 label=Parser_ResolvePhrase_SkipMarker
  $C223,$04 Keep skipping while this byte is the marker being sought.
@ $C227 label=Parser_ResolvePhrase_Next
  $C227,$02 Repeat from #R$C223 until the phrase list is finished.
  $C229,$02 Jump to #R$C22C to test the first object.
@ $C22B label=Parser_ResolvePhrase_NextObject
  $C22B,$01 Step to the next object in the phrase.
@ $C22C label=Parser_ResolvePhrase_TestObject
  $C22C,$05 Return when this object is in this room.
  $C231,$06 Jump back to #R$C22B when the end of a phrase matches.
  $C237,$06 Print "#MESSAGE$BBED".
  $C23D,$07 Call #R$C0C3 to look up the object's name.
  $C244,$03 Call #R$BE21 to print the name.
  $C247,$06 Print "#MESSAGE$BBFA".
  $C24D,$01 Set the carry flag to reject the command.
  $C24E,$01 Return.

c $C24F Is Object In The Current Room?
@ $C24F label=IsObjectInCurrentRoom
D $C24F Set the zero flag when this object is in this room or in the scenic list.
R $C24F A Object number
R $C24F O:F Zero flag set when the object is in the current room
  $C24F,$09 Jump to #R$C25D when this is a scenic entry rather than an object.
  $C258,$05 Use the object locations and join the room test.
@ $C25D label=IsObjectInCurrentRoom_Next
  $C25D,$05 Clear the scenic marker and use the scenic list.
@ $C262 label=IsObjectInCurrentRoom_Compare
  $C262,$07 Jump to #R$C26C when the object is in the current room.
  $C269,$03 Treat a carried object as present.
@ $C26C label=IsObjectInCurrentRoom_Found
  $C26C,$02 Restore #REGde and #REGhl from the stack.
  $C26E,$01 Return.

c $C26F Parser: Advance To Separator
@ $C26F label=Parser_AdvanceToSeparator
D $C26F Walk a phrase from the word list. The zero flag is set when the typed words match it.
  $C26F,$03 Hand the typed tokens to the phrase walk.
@ $C272 label=Parser_AdvanceToSeparator_Loop
  $C272,$01 Advance to the next byte.
@ $C273 label=Parser_AdvanceToSeparator_Next
  $C273,$05 Compare against the typed tokens.
@ $C278 label=Parser_AdvanceToSeparator_Match
  $C278,$06 Advance through both phrases while the characters still match.
@ $C27A label=Parser_AdvanceToSeparator_Compare
  $C27E,$04 Jump to #R$C286 unless the end of a phrase matches.
  $C282,$03 Fetch the next phrase byte and test for the end marker.
  $C285,$01 Return.
@ $C286 label=Parser_AdvanceToSeparator_Alt
  $C286,$04 Jump to #R$C290 unless the alternative in a phrase matches.
  $C28A,$05 Jump back to #R$C272 if the end-of-list marker was not pressed.
  $C28F,$01 Return.
@ $C290 label=Parser_AdvanceToSeparator_SkipAlt
  $C290,$06 Jump to #R$C29C when the end of a phrase matches.
  $C296,$04 Jump back to #R$C290 unless the alternative in a phrase matches.
  $C29A,$02 Jump back to #R$C272 to try the phrase's other wording.
@ $C29C label=Parser_AdvanceToSeparator_Done
  $C29C,$01 Clear the carry flag; the phrase matched.
  $C29D,$01 Return.

c $C29E Parser: Find Phrase
@ $C29E label=Parser_FindPhrase
D $C29E Count how many of the typed tokens are real nouns.
  $C29E,$07 Start at the token buffer.
@ $C2A5 label=Parser_FindPhrase_Loop
  $C2A5,$05 Jump to #R$C2BB if the end-of-list marker was pressed.
  $C2AA,$0D Jump to #R$C2B8 if the search did not find a match.
  $C2B7,$01 Count one more match.
@ $C2B8 label=Parser_FindPhrase_Next
  $C2B8,$03 Repeat from #R$C2A5 for the remaining tokens.
@ $C2BB label=Parser_FindPhrase_Done
  $C2BB,$02 Test whether #REGe is zero.
  $C2BD,$01 Return.

c $C2BE Get Object Location
@ $C2BE label=GetObjectLocation
D $C2BE Return where this object is. #N$01 means it is being carried.
R $C2BE A Object number
R $C2BE O:A Location of the object
  $C2BE,$07 Jump to #R$C2CA when this is a scenic entry rather than an object.
  $C2C5,$05 Use the object locations and join the lookup.
@ $C2CA label=GetObjectLocation_Next
  $C2CA,$05 Clear the scenic marker and use the scenic list.
@ $C2CF label=GetObjectLocation_Index
  $C2CF,$02 Add the index to the base address.
  $C2D1,$01 Return.

c $C2D2 Is Object Carried?
@ $C2D2 label=IsObjectCarried
D $C2D2 Set the zero flag when this object is being carried.
  $C2D2,$03 Call #R$C2BE to fetch where the object is.
  $C2D5,$02 Compare the location with #N$01 (carried).
  $C2D7,$01 Return.

c $C2D8 Handler: Destroy Item
@ $C2D8 label=Handler_DestroyItem
D $C2D8 Destroy an object by giving it location #N$00.
  $C2D8,$06 Call #R$BF55 to destroy the object.
  $C2DE,$01 Return.

c $C2DF Handler: Update Item For The Current Room
@ $C2DF label=Handler_UpdateItemForTheCurrentRoom
D $C2DF Put an object down in the room the player is standing in.
  $C2DF,$08 Call #R$BF55 to move the object to this room.
  $C2E7,$01 Return.

c $C2E8 Handler: Remove Item From Play
@ $C2E8 label=Handler_RemoveItemFromPlay
D $C2E8 Take an object out of the game by giving it location #N$FF.
  $C2E8,$06 Call #R$BF55 to take the object out of the game.
  $C2EE,$01 Return.

c $C2EF Parser: Skip Token
@ $C2EF label=Parser_SkipToken
D $C2EF Step through a phrase until the object it names is reached.
  $C2EF,$02 Start at the first byte of the phrase.
@ $C2F1 label=Parser_SkipToken_Loop
  $C2F1,$01 Step to the next byte of the phrase.
@ $C2F2 label=Parser_SkipToken_Next
  $C2F2,$05 Jump back to #R$C2F1 when the end of a phrase matches.
  $C2F7,$05 Jump back to #R$C2F1 unless the end of a phrase matches.
  $C2FC,$01 Fetch the next phrase byte into #REGa.
  $C2FD,$01 Return.

c $C2FE Parser: Validate No Direct Object
@ $C2FE label=Parser_ValidateNoDirectObject
D $C2FE Set the carry flag, after asking for a rephrase, when a direct object was typed.
  $C2FE,$06 Return if the end-of-list marker was pressed.
N $C304 The command must not name an object.
  $C304,$03 Call #R$BDBE.
  $C307,$01 Set the carry flag to reject the command.
  $C308,$01 Return.

c $C309 Parser: Validate Direct Object
@ $C309 label=Parser_ValidateDirectObject
D $C309 Set the carry flag unless the command names exactly one object.
  $C309,$07 Jump to #R$C315 if the end-of-list marker was not pressed.
N $C310 The command names no object.
  $C310,$03 Call #R$BDC5.
  $C313,$01 Set the carry flag to reject the command.
  $C314,$01 Return.
@ $C315 label=Parser_ValidateDirectObject_Next
  $C315,$04 Call #R$C29E to count the nouns, and return when one was named.
N $C319 The named object is not valid for this command.
  $C319,$03 Call #R$BDBE.
  $C31C,$01 Set the carry flag to reject the command.
  $C31D,$01 Return.

c $C31E Parser: Match Or Rephrase
@ $C31E label=Parser_MatchOrRephrase
D $C31E Allow a command with no object. Otherwise require the phrase to match.
  $C31E,$06 Return if the end-of-list marker was pressed.
  $C324,$04 Call #R$C29E to count the nouns, and return when one was named.
N $C328 The phrase does not match.
  $C328,$03 Call #R$BDBE.
  $C32B,$01 Set the carry flag to reject the command.
  $C32C,$01 Return.

c $C32D Parser: Validate Input Tokens
@ $C32D label=Parser_ValidateInputTokens
D $C32D Accept a command that names one or two objects, and reject the rest.
  $C32D,$04 Return if the words after the verb are not valid for this command.
  $C331,$04 Jump to #R$C33A unless the carried location matches.
N $C335 Only one object was named.
  $C335,$03 Call #R$BDC5.
  $C338,$01 Set the carry flag to reject the command.
  $C339,$01 Return.
@ $C33A label=Parser_ValidateInputTokens_Next
  $C33A,$04 Jump to #R$C340 when the value #N$03 succeeded.
  $C33E,$01 Clear the carry flag; the input tokens are valid.
  $C33F,$01 Return.
@ $C340 label=Parser_ValidateInputTokens_Rephrase
N $C340 Too many objects were named.
  $C340,$03 Call #R$BDBE.
  $C343,$01 Set the carry flag to reject the command.
  $C344,$01 Return.

c $C345 Save Game
@ $C345 label=SaveGame
D $C345 Ask for a tape and write the game state out.
  $C345,$06 Jump to #R$C364 when *#R$BB02 is zero, so there is no flag state to copy.
  $C34B,$0A Take the flag addresses and the save area.
@ $C355 label=SaveGame_Copy
  $C355,$05 Step to the next flag address and the next save byte.
@ $C35A label=SaveGame_StoreFlag
  $C35A,$0A Copy that flag into the save area and repeat until every flag is
. stored.
N $C364 Print "#MESSAGE$BC48".
@ $C364 label=SaveGame_PrintSaving
  $C364,$09 Print "#MESSAGE$BC48" and wait for a key.
  $C36D,$09 Point the save at the game state (#R$B9C8) for #N$013C bytes, marked as a
. data block.
  $C376,$03 Call #SKOOLKID$04C2(SA_BYTES).
N $C379 Print "#MESSAGE$BC6A".
  $C379,$06 Print "#MESSAGE$BC6A".
  $C37F,$01 Return.

c $C380 Load From Tape
@ $C380 label=LoadFromTape
D $C380 Ask for a tape and read a previously saved game state back in.
N $C380 Print "#MESSAGE$BC27".
  $C380,$06 Print "#MESSAGE$BC27".
  $C386,$07 Point the load at the game state (#R$B9C8) for #N$013C bytes.
  $C38D,$03 Mark it as a data block and set the carry flag for "loading".
  $C390,$03 Call #SKOOLKID$0556(LD_BYTES).
  $C393,$02 Jump to #R$C39C when the load succeeded.
N $C395 Print "#MESSAGE$BC3C".
  $C395,$06 Print "#MESSAGE$BC3C".
  $C39B,$01 Return.
@ $C39C label=LoadFromTape_Success
  $C39C,$05 Return when *#R$BB02 is zero, so there is no flag state to restore.
  $C3A1,$0A Take the flag addresses and the saved bytes.
@ $C3AB label=LoadFromTape_Restore
  $C3AB,$05 Step to the next flag address and the next saved byte.
@ $C3B0 label=LoadFromTape_StoreFlag
  $C3B0,$0A Write that saved byte back and repeat until every flag is restored.
  $C3BA,$05 Call #R$C0F9 to show the restored room.
  $C3BF,$01 Return.

c $C3C0 Print Input Prompt
@ $C3C0 label=PrintInputPrompt
D $C3C0 Start a new line when the text window is not empty, then print the prompt.
  $C3C0,$08 Scan eight rows from the top of the screen.
  $C3C8,$01 Start with no text found.
@ $C3C9 label=PrintInputPrompt_Collect
  $C3C9,$04 Collect whether any of those rows already holds text.
  $C3CD,$03 Jump to #R$C3D5 when the text window is still empty.
  $C3D0,$05 Print a newline so the prompt starts on a fresh line.
@ $C3D5 label=PrintInputPrompt_Print
  $C3D5,$06 Print "#MESSAGE$BB55".
  $C3DB,$01 Return.

c $C3DC Parser: Match Vocabulary
@ $C3DC label=Parser_MatchVocabulary
D $C3DC Check each typed token against the noun list and resolve its phrase.
  $C3DC,$05 Start at the token buffer.
@ $C3E1 label=Parser_MatchVocabulary_Loop
  $C3E1,$04 Return if the end-of-list marker was pressed.
  $C3E5,$0C Jump to #R$C3F5 if the search did not find a match.
  $C3F1,$04 Call #R$C213 to resolve the phrase and complain if it is not understood,
. and return if the comparison failed.
@ $C3F5 label=Parser_MatchVocabulary_Next
  $C3F5,$04 Repeat from #R$C3E1 for the remaining tokens.
  $C3F9,$01 Return.

c $C3FA Handler: Scenic Events
@ $C3FA label=Handler_ScenicEvents
D $C3FA If this room has a scenic event, run it.
  $C3FA,$07 Start at the scenic list.
@ $C401 label=Handler_ScenicEvents_Loop
  $C401,$07 Read the current room. Jump to #R$C42E if the search did not find a match.
  $C408,$0F Save the scenic search and turn the match into a handler index.
  $C417,$07 Call #R$C0C3 to fetch this room's scenic handler.
@ $C41E nowarn
  $C41E,$05 Return to #R$C423 afterwards and jump to that handler.
  $C423,$0B Restore the scenic search and repeat while entries remain.
@ $C42E label=Handler_ScenicEvents_Next
  $C42E,$01 Return.

c $C42F Move Player To Room
@ $C42F label=MovePlayerToRoom
D $C42F Move the player to the given room and retarget any scenic events that watched the old room.
  $C42F,$0D Read the current room and the scenic list. Jump to #R$C43D to
. continue.
@ $C43C label=MovePlayerToRoom_Loop
  $C43C,$01 Step to the next scenic entry.
@ $C43D label=MovePlayerToRoom_Next
  $C43D,$03 Jump to #R$C441 unless this scenic entry watched the old room.
  $C440,$01 Retarget this scenic entry to the new room.
@ $C441 label=MovePlayerToRoom_ScenicNext
  $C441,$02 Repeat from #R$C43C for the remaining scenic entries.
  $C443,$0A Remember the new room. Return when no event bits are set.
  $C44D,$08 Take the eight event bits and the objects they summon.
@ $C455 label=MovePlayerToRoom_EventAdvance
  $C455,$01 Step to the next event object.
@ $C456 label=MovePlayerToRoom_EventBit
  $C456,$04 Skip this object when its event bit is clear.
  $C45A,$05 Call #R$C2DF to move that event's object into this room.
  $C45F,$01 Switch back to the event scan.
@ $C460 label=MovePlayerToRoom_EventNext
  $C460,$02 Repeat from #R$C455 for the remaining event bits.
@ $C462 label=MovePlayerToRoom_Return
  $C462,$01 Return.

c $C463 Handler: Match Verb
@ $C463 label=Handler_MatchVerb
D $C463 Jump to the handler for the first vocabulary token, or admit the verb is unknown.
  $C463,$0E Jump to #R$C478 if the search found a match.
  $C471,$06 Print "#MESSAGE$BB61".
  $C477,$01 Return.
@ $C478 label=Handler_MatchVerb_Next
  $C478,$0D Call #R$C0C3 to look up the verb's handler.
  $C485,$01 Jump to that handler.

c $C486 Pause, Print String And Scroll
@ $C486 label=PausePrintStringAndScroll
D $C486 Pause for a moment, then print the given message.
  $C486,$05 Call #R$BF41 to pause for a moment.
  $C48B,$03 Call #R$BE2E to print the message and start a new line.
  $C48E,$01 Return.

c $C48F Transform Item
@ $C48F label=TransformItem
D $C48F Put the new object where the old one was, and clear the old one.
  $C48F,$04 Call #R$C2BE to fetch where the original object is.
  $C493,$07 Call #R$BF55 to clear the original object.
  $C49A,$02 Restore the new object and its destination from the stack.
  $C49C,$05 Call #R$BF55 to put the new object in its place.
  $C4A1,$01 Return.

t $C4A2 Messaging: "Some Food"
@ $C4A2 label=Messaging_SomeFood
  $C4A2,$0A "#MESSAGE$C4A2".
B $C4AC,$01 Terminator.

t $C4AD Messaging: "The Well Is Completely Dry"
@ $C4AD label=Messaging_TheWellIsCompletelyDry
  $C4AD,$1B "#MESSAGE$C4AD".
B $C4C8,$01 Terminator.

t $C4C9 Messaging: "A Silver Coin"
@ $C4C9 label=Messaging_ASilverCoin
  $C4C9,$0E "#MESSAGE$C4C9".
B $C4D7,$01 Terminator.

t $C4D8 Messaging: "A Bow"
@ $C4D8 label=Messaging_ABow
  $C4D8,$06 "#MESSAGE$C4D8".
B $C4DE,$01 Terminator.

t $C4DF Messaging: "Some Arrows"
@ $C4DF label=Messaging_SomeArrows
  $C4DF,$0C "#MESSAGE$C4DF".
B $C4EB,$01 Terminator.

t $C4EC Messaging: "It Looks Too Steep To Climb"
@ $C4EC label=Messaging_ItLooksTooSteepToClimb
  $C4EC,$1C "#MESSAGE$C4EC".
B $C508,$01 Terminator.

t $C509 Messaging: "A Pair Of Oars"
@ $C509 label=Messaging_APairOfOars
  $C509,$0F "#MESSAGE$C509".
B $C518,$01 Terminator.

t $C519 Messaging: "A Ring"
@ $C519 label=Messaging_ARing
  $C519,$07 "#MESSAGE$C519".
B $C520,$01 Terminator.

t $C521 Messaging: "A Rope"
@ $C521 label=Messaging_ARope
  $C521,$07 "#MESSAGE$C521".
B $C528,$01 Terminator.

t $C529 Messaging: "A Horn"
@ $C529 label=Messaging_AHorn
  $C529,$07 "#MESSAGE$C529".
B $C530,$01 Terminator.

t $C531 Messaging: "A Sword"
@ $C531 label=Messaging_ASword
  $C531,$08 "#MESSAGE$C531".
B $C539,$01 Terminator.

t $C53A Messaging: "A Chest"
@ $C53A label=Messaging_AChest
  $C53A,$08 "#MESSAGE$C53A".
B $C542,$01 Terminator.

t $C543 Messaging: "A Closed Chest"
@ $C543 label=Messaging_AClosedChest
  $C543,$0F "#MESSAGE$C543".
B $C552,$01 Terminator.

t $C553 Messaging: "An Open Chest Containing"
@ $C553 label=Messaging_AnOpenChestContaining
  $C553,$30 "#MESSAGE$C553".
B $C583,$01 Terminator.

t $C584 Messaging: "An Empty Chest"
@ $C584 label=Messaging_AnEmptyChest
  $C584,$0F "#MESSAGE$C584".
B $C593,$01 Terminator.

t $C594 Messaging: "The Crystals Of Vulcan"
@ $C594 label=Messaging_TheCrystalsOfVulcan
  $C594,$17 "#MESSAGE$C594".
B $C5AB,$01 Terminator.

t $C5AC Messaging: "A Key"
@ $C5AC label=Messaging_AKey
  $C5AC,$06 "#MESSAGE$C5AC".
B $C5B2,$01 Terminator.

t $C5B3 Messaging: "It Seems Too Wide"
@ $C5B3 label=Messaging_ItSeemsTooWide
  $C5B3,$21 "#MESSAGE$C5B3".
B $C5D4,$01 Terminator.

t $C5D5 Messaging: "The Body Of A Dead Elf"
@ $C5D5 label=Messaging_TheBodyOfADeadElf
  $C5D5,$17 "#MESSAGE$C5D5".
B $C5EC,$01 Terminator.

t $C5ED Messaging: "A Dragon"
@ $C5ED label=Messaging_ADragon
  $C5ED,$1D "#MESSAGE$C5ED".
B $C60A,$01 Terminator.

t $C60B Messaging: "A Dead Dragon"
@ $C60B label=Messaging_ADeadDragon
  $C60B,$0E "#MESSAGE$C60B".
B $C619,$01 Terminator.

t $C61A Messaging: "A Dead Flying Lizard"
@ $C61A label=Messaging_ADeadFlyingLizard
  $C61A,$15 "#MESSAGE$C61A".
B $C62F,$01 Terminator.

t $C630 Messaging: "Some Dead Wolves"
@ $C630 label=Messaging_SomeDeadWolves
  $C630,$11 "#MESSAGE$C630".
B $C641,$01 Terminator.

t $C642 Messaging: "The Body Of A Wood Nymph"
@ $C642 label=Messaging_TheBodyOfAWoodNymph
  $C642,$19 "#MESSAGE$C642".
B $C65B,$01 Terminator.

t $C65C Messaging: "A Rowing Boat"
@ $C65C label=Messaging_ARowingBoat
  $C65C,$0E "#MESSAGE$C65C".
B $C66A,$01 Terminator.

t $C66B Messaging: "A Monster From The Slime"
@ $C66B label=Messaging_AMonsterFromTheSlime
  $C66B,$19 "#MESSAGE$C66B".
B $C684,$01 Terminator.

t $C685 Messaging: "SPARE"
@ $C685 label=Messaging_SPARE
  $C685,$05 "#MESSAGE$C685".
B $C68A,$01 Terminator.

t $C68B Messaging: "The Current Is Very Strong"
@ $C68B label=Messaging_TheCurrentIsVeryStrong
  $C68B,$1B "#MESSAGE$C68B".
B $C6A6,$01 Terminator.

t $C6A7 Messaging: "A Projection Of Rock"
@ $C6A7 label=Messaging_AProjectionOfRock
  $C6A7,$37 "#MESSAGE$C6A7".
B $C6DE,$01 Terminator.

t $C6DF Messaging: "A Projection Of Rock With A Rope"
@ $C6DF label=Messaging_AProjectionOfRockWithARope
  $C6DF,$54 "#MESSAGE$C6DF".
B $C733,$01 Terminator.

t $C734 Messaging: "The Once Beautiful Buildings,"
@ $C734 label=Messaging_TheOnceBeautifulBuildings
  $C734,$2F "#MESSAGE$C734".
B $C763,$01 Terminator.

t $C764 Messaging: "The Blacksmith"
@ $C764 label=Messaging_TheBlacksmith
  $C764,$99 "#MESSAGE$C764".
B $C7FD,$01 Terminator.

t $C7FE Messaging: "The Blacksmith After Forging The Sword"
@ $C7FE label=Messaging_TheBlacksmithAfterForgingTheSword
  $C7FE,$0F "#MESSAGE$C7FE".
B $C80D,$01 Terminator.

t $C80E Messaging: "The Body Of The Blacksmith"
@ $C80E label=Messaging_TheBodyOfTheBlacksmith
  $C80E,$1B "#MESSAGE$C80E".
B $C829,$01 Terminator.

t $C82A Messaging: "The Flames From The"
@ $C82A label=Messaging_TheFlamesFromThe
  $C82A,$23 "#MESSAGE$C82A".
B $C84D,$01 Terminator.

t $C84E Messaging: "Some Demons Are Attacking You"
@ $C84E label=Messaging_SomeDemonsAreAttackingYou
  $C84E,$50 "#MESSAGE$C84E".
B $C89E,$01 Terminator.

t $C89F Messaging: "The Wizard,Zarn"
@ $C89F label=Messaging_TheWizardZarn
  $C89F,$36 "#MESSAGE$C89F".
B $C8D5,$01 Terminator.

t $C8D6 Messaging: "The Body Of The Wizard"
@ $C8D6 label=Messaging_TheBodyOfTheWizard
  $C8D6,$17 "#MESSAGE$C8D6".
B $C8ED,$01 Terminator.

t $C8EE Messaging: "The Princess,Mara"
@ $C8EE label=Messaging_ThePrincessMara
  $C8EE,$12 "#MESSAGE$C8EE".
B $C900,$01 Terminator.

t $C901 Messaging: "The Body Of The Princess"
@ $C901 label=Messaging_TheBodyOfThePrincess
  $C901,$19 "#MESSAGE$C901".
B $C91A,$01 Terminator.

t $C91B Messaging: "The Witch"
@ $C91B label=Messaging_TheWitch
  $C91B,$0A "#MESSAGE$C91B".
B $C925,$01 Terminator.

t $C926 Messaging: "The Old Man"
@ $C926 label=Messaging_TheOldMan
  $C926,$8A "#MESSAGE$C926".
B $C9B0,$01 Terminator.

t $C9B1 Messaging: "Spare Object Slots After The Old Man"
@ $C9B1 label=Messaging_SpareObjectSlotsAfterTheOldMan
  $C9B1,$05 "#MESSAGE$C9B1".
B $C9B6,$01 Terminator.

t $C9B7 Messaging: "A Glowing Rock"
@ $C9B7 label=Messaging_AGlowingRock
  $C9B7,$0F "#MESSAGE$C9B7".
B $C9C6,$01 Terminator.

t $C9C7 Messaging: "A Dead Warrior"
@ $C9C7 label=Messaging_ADeadWarrior
  $C9C7,$0F "#MESSAGE$C9C7".
B $C9D6,$01 Terminator.

t $C9D7 Messaging: "An Open Door"
@ $C9D7 label=Messaging_AnOpenDoor
  $C9D7,$0D "#MESSAGE$C9D7".
B $C9E4,$01 Terminator.

t $C9E5 Messaging: "A Closed Door"
@ $C9E5 label=Messaging_AClosedDoor
  $C9E5,$0E "#MESSAGE$C9E5".
B $C9F3,$01 Terminator.

t $C9F4 Messaging: "A Giant Spider"
@ $C9F4 label=Messaging_AGiantSpider
  $C9F4,$27 "#MESSAGE$C9F4".
B $CA1B,$01 Terminator.

t $CA1C Messaging: "The Body Of A Giant Spider"
@ $CA1C label=Messaging_TheBodyOfAGiantSpider
  $CA1C,$1B "#MESSAGE$CA1C".
B $CA37,$01 Terminator.

t $CA38 Messaging: "A Ring,Which You Are Wearing"
@ $CA38 label=Messaging_ARingWhichYouAreWearing
  $CA38,$1D "#MESSAGE$CA38".
B $CA55,$01 Terminator.

t $CA56 Messaging: "A Log"
@ $CA56 label=Messaging_ALog
  $CA56,$06 "#MESSAGE$CA56".
B $CA5C,$01 Terminator.

t $CA5D Messaging: "A Log,Bridging The Chasm"
@ $CA5D label=Messaging_ALogBridgingTheChasm
  $CA5D,$19 "#MESSAGE$CA5D".
B $CA76,$01 Terminator.

t $CA77 Messaging: "Spare Object Slot After The Log Bridge"
@ $CA77 label=Messaging_SpareObjectSlotAfterTheLogBridge
  $CA77,$05 "#MESSAGE$CA77".
B $CA7C,$01 Terminator.

t $CA7D Messaging: "You Are Seriously Injured"
@ $CA7D label=Messaging_YouAreSeriouslyInjured
  $CA7D,$1A "#MESSAGE$CA7D".
B $CA97,$01 Terminator.

t $CA98 Messaging: "You Are Sweating Profusely"
@ $CA98 label=Messaging_YouAreSweatingProfusely
  $CA98,$3B "#MESSAGE$CA98".
B $CAD3,$01 Terminator.

t $CAD4 Messaging: "Inside The Farmhouse"
@ $CAD4 label=Messaging_InsideTheFarmhouse
  $CAD4,$15 "#MESSAGE$CAD4".
B $CAE9,$01 Terminator.

t $CAEA Messaging: "At A Large Farmhouse"
@ $CAEA label=Messaging_AtALargeFarmhouse
  $CAEA,$30 "#MESSAGE$CAEA".
B $CB1A,$01 Terminator.

t $CB1B Messaging: "On A Long Farm Track"
@ $CB1B label=Messaging_OnALongFarmTrack
  $CB1B,$41 "#MESSAGE$CB1B".
B $CB5C,$01 Terminator.

t $CB5D Messaging: "The Great Valley"
@ $CB5D label=Messaging_TheGreatValley
  $CB5D,$2D "#MESSAGE$CB5D".
B $CB8A,$01 Terminator.

t $CB8B Messaging: "The Vale Of Shadows"
@ $CB8B label=Messaging_TheValeOfShadows
  $CB8B,$67 "#MESSAGE$CB8B".
B $CBF2,$01 Terminator.

t $CBF3 Messaging: "In The Forest"
@ $CBF3 label=Messaging_InTheForest
  $CBF3,$20 "#MESSAGE$CBF3".
B $CC13,$01 Terminator.

t $CC14 Messaging: "The Leafy Glade"
@ $CC14 label=Messaging_TheLeafyGlade
  $CC14,$3F "#MESSAGE$CC14".
B $CC53,$01 Terminator.

t $CC54 Messaging: "The Woodman's Clearing"
@ $CC54 label=Messaging_TheWoodmansClearing
  $CC54,$17 "#MESSAGE$CC54".
B $CC6B,$01 Terminator.

t $CC6C Messaging: "At The Woodman's Hut"
@ $CC6C label=Messaging_AtTheWoodmansHut
  $CC6C,$15 "#MESSAGE$CC6C".
B $CC81,$01 Terminator.

t $CC82 Messaging: "Inside The Woodman's Hut"
@ $CC82 label=Messaging_InsideTheWoodmansHut
  $CC82,$40 "#MESSAGE$CC82".
B $CCC2,$01 Terminator.

t $CCC3 Messaging: "A Burned Out Farm"
@ $CCC3 label=Messaging_ABurnedOutFarm
  $CCC3,$12 "#MESSAGE$CCC3".
B $CCD5,$01 Terminator.

t $CCD6 Messaging: "An Overgrown Fruit Grove"
@ $CCD6 label=Messaging_AnOvergrownFruitGrove
  $CCD6,$47 "#MESSAGE$CCD6".
B $CD1D,$01 Terminator.

t $CD1E Messaging: "On A Forest Path"
@ $CD1E label=Messaging_OnAForestPath
  $CD1E,$11 "#MESSAGE$CD1E".
B $CD2F,$01 Terminator.

t $CD30 Messaging: "The Western Edge Of A Chasm"
@ $CD30 label=Messaging_TheWesternEdgeOfAChasm
  $CD30,$1C "#MESSAGE$CD30".
B $CD4C,$01 Terminator.

t $CD4D Messaging: "The Eastern Edge Of A Chasm"
@ $CD4D label=Messaging_TheEasternEdgeOfAChasm
  $CD4D,$1C "#MESSAGE$CD4D".
B $CD69,$01 Terminator.

t $CD6A Messaging: "The Brink Of A Precipice"
@ $CD6A label=Messaging_TheBrinkOfAPrecipice
  $CD6A,$30 "#MESSAGE$CD6A".
B $CD9A,$01 Terminator.

t $CD9B Messaging: "The Old Well"
@ $CD9B label=Messaging_TheOldWell
  $CD9B,$29 "#MESSAGE$CD9B".
B $CDC4,$01 Terminator.

t $CDC5 Messaging: "The Wooded Vale"
@ $CDC5 label=Messaging_TheWoodedVale
  $CDC5,$10 "#MESSAGE$CDC5".
B $CDD5,$01 Terminator.

t $CDD6 Messaging: "The Western Bank"
@ $CDD6 label=Messaging_TheWesternBank
  $CDD6,$22 "#MESSAGE$CDD6".
B $CDF8,$01 Terminator.

t $CDF9 Messaging: "The Eastern Bank"
@ $CDF9 label=Messaging_TheEasternBank
  $CDF9,$22 "#MESSAGE$CDF9".
B $CE1B,$01 Terminator.

t $CE1C Messaging: "The Swamp"
@ $CE1C label=Messaging_TheSwamp
  $CE1C,$30 "#MESSAGE$CE1C".
B $CE4C,$01 Terminator.

t $CE4D Messaging: "In The Boat"
@ $CE4D label=Messaging_InTheBoat
  $CE4D,$0C "#MESSAGE$CE4D".
B $CE59,$01 Terminator.

t $CE5A Messaging: "The Pit Of Oozing Slime"
@ $CE5A label=Messaging_ThePitOfOozingSlime
  $CE5A,$18 "#MESSAGE$CE5A".
B $CE72,$01 Terminator.

t $CE73 Messaging: "On An Open Plain"
@ $CE73 label=Messaging_OnAnOpenPlain
  $CE73,$29 "#MESSAGE$CE73".
B $CE9C,$01 Terminator.

t $CE9D Messaging: "On A High Plateau"
@ $CE9D label=Messaging_OnAHighPlateau
  $CE9D,$2D "#MESSAGE$CE9D".
B $CECA,$01 Terminator.

t $CECB Messaging: "On Marshy Ground"
@ $CECB label=Messaging_OnMarshyGround
  $CECB,$11 "#MESSAGE$CECB".
B $CEDC,$01 Terminator.

t $CEDD Messaging: "The Enchanted Wood"
@ $CEDD label=Messaging_TheEnchantedWood
  $CEDD,$2B "#MESSAGE$CEDD".
B $CF08,$01 Terminator.

t $CF09 Messaging: "On A Rocky Outcrop"
@ $CF09 label=Messaging_OnARockyOutcrop
  $CF09,$13 "#MESSAGE$CF09".
B $CF1C,$01 Terminator.

t $CF1D Messaging: "The Forest Of Sighs"
@ $CF1D label=Messaging_TheForestOfSighs
  $CF1D,$27 "#MESSAGE$CF1D".
B $CF44,$01 Terminator.

t $CF45 Messaging: "In A Tangle Of"
@ $CF45 label=Messaging_InATangleOf
  $CF45,$25 "#MESSAGE$CF45".
B $CF6A,$01 Terminator.

t $CF6B Messaging: "At The Bottom Of The Precipice"
@ $CF6B label=Messaging_AtTheBottomOfThePrecipice
  $CF6B,$1F "#MESSAGE$CF6B".
B $CF8A,$01 Terminator.

t $CF8B Messaging: "In Wildmoor Woods"
@ $CF8B label=Messaging_InWildmoorWoods
  $CF8B,$12 "#MESSAGE$CF8B".
B $CF9D,$01 Terminator.

t $CF9E Messaging: "In The Forest Of Night"
@ $CF9E label=Messaging_InTheForestOfNight
  $CF9E,$42 "#MESSAGE$CF9E".
B $CFE0,$01 Terminator.

t $CFE1 Messaging: "At The Witch's Hovel"
@ $CFE1 label=Messaging_AtTheWitchsHovel
  $CFE1,$2A "#MESSAGE$CFE1".
B $D00B,$01 Terminator.

t $D00C Messaging: "Inside The Witch's Hovel"
@ $D00C label=Messaging_InsideTheWitchsHovel
  $D00C,$19 "#MESSAGE$D00C".
B $D025,$01 Terminator.

t $D026 Messaging: "A Rock Wall"
@ $D026 label=Messaging_ARockWall
  $D026,$0C "#MESSAGE$D026".
B $D032,$01 Terminator.

t $D033 Messaging: "The Plain Of Marl"
@ $D033 label=Messaging_ThePlainOfMarl
  $D033,$2C "#MESSAGE$D033".
B $D05F,$01 Terminator.

t $D060 Messaging: "At The Blacksmith's Forge"
@ $D060 label=Messaging_AtTheBlacksmithsForge
  $D060,$1A "#MESSAGE$D060".
B $D07A,$01 Terminator.

t $D07B Messaging: "Inside The Forge"
@ $D07B label=Messaging_InsideTheForge
  $D07B,$11 "#MESSAGE$D07B".
B $D08C,$01 Terminator.

t $D08D Messaging: "At The Base Of A Volcano"
@ $D08D label=Messaging_AtTheBaseOfAVolcano
  $D08D,$36 "#MESSAGE$D08D".
B $D0C3,$01 Terminator.

t $D0C4 Messaging: "On A Narrow Ledge On The"
@ $D0C4 label=Messaging_OnANarrowLedgeOnThe
  $D0C4,$2D "#MESSAGE$D0C4".
B $D0F1,$01 Terminator.

t $D0F2 Messaging: "The Cavern Of Silence"
@ $D0F2 label=Messaging_TheCavernOfSilence
  $D0F2,$16 "#MESSAGE$D0F2".
B $D108,$01 Terminator.

t $D109 Messaging: "The Top Of The Volcano"
@ $D109 label=Messaging_TheTopOfTheVolcano
  $D109,$35 "#MESSAGE$D109".
B $D13E,$01 Terminator.

t $D13F Messaging: "Inside The Volcano"
@ $D13F label=Messaging_InsideTheVolcano
  $D13F,$4D "#MESSAGE$D13F".
B $D18C,$01 Terminator.

t $D18D Messaging: "In A Rock Passage"
@ $D18D label=Messaging_InARockPassage
  $D18D,$2D "#MESSAGE$D18D".
B $D1BA,$01 Terminator.

t $D1BB Messaging: "In The Great Hall Of Zarn"
@ $D1BB label=Messaging_InTheGreatHallOfZarn
  $D1BB,$1A "#MESSAGE$D1BB".
B $D1D5,$01 Terminator.

t $D1D6 Messaging: "In A High Tower"
@ $D1D6 label=Messaging_InAHighTower
  $D1D6,$27 "#MESSAGE$D1D6".
B $D1FD,$01 Terminator.

t $D1FE Messaging: "The Dungeon"
@ $D1FE label=Messaging_TheDungeon
  $D1FE,$2D "#MESSAGE$D1FE".
B $D22B,$01 Terminator.

t $D22C Messaging: "Marl's Gateway"
@ $D22C label=Messaging_MarlsGateway
  $D22C,$0F "#MESSAGE$D22C".
B $D23B,$01 Terminator.

t $D23C Messaging: "Any Food"
@ $D23C label=Messaging_AnyFood
  $D23C,$08 "#MESSAGE$D23C".
B $D244,$01 Terminator.

t $D245 Messaging: "Any Water"
@ $D245 label=Messaging_AnyWater
  $D245,$09 "#MESSAGE$D245".
B $D24E,$01 Terminator.

t $D24F Messaging: "A Coin"
@ $D24F label=Messaging_ACoin
  $D24F,$06 "#MESSAGE$D24F".
B $D255,$01 Terminator.

t $D256 Messaging: "A Bow Noun Match"
@ $D256 label=Messaging_ABow_NounMatch
  $D256,$05 "#MESSAGE$D256".
B $D25B,$01 Terminator.

t $D25C Messaging: "Any Arrows"
@ $D25C label=Messaging_AnyArrows
  $D25C,$0A "#MESSAGE$D25C".
B $D266,$01 Terminator.

t $D267 Messaging: "A Ring Noun Match"
@ $D267 label=Messaging_ARing_NounMatch
  $D267,$06 "#MESSAGE$D267".
B $D26D,$01 Terminator.

t $D26E Messaging: "A Rope Noun Match"
@ $D26E label=Messaging_ARope_NounMatch
  $D26E,$06 "#MESSAGE$D26E".
B $D274,$01 Terminator.

t $D275 Messaging: "A Log Noun Match"
@ $D275 label=Messaging_ALog_NounMatch
  $D275,$05 "#MESSAGE$D275".
B $D27A,$01 Terminator.

t $D27B Messaging: "A Well"
@ $D27B label=Messaging_AWell
  $D27B,$06 "#MESSAGE$D27B".
B $D281,$01 Terminator.

t $D282 Messaging: "A Horn Noun Match"
@ $D282 label=Messaging_AHorn_NounMatch
  $D282,$06 "#MESSAGE$D282".
B $D288,$01 Terminator.

t $D289 Messaging: "A Sword Noun Match"
@ $D289 label=Messaging_ASword_NounMatch
  $D289,$07 "#MESSAGE$D289".
B $D290,$01 Terminator.

t $D291 Messaging: "A Chest Noun Match"
@ $D291 label=Messaging_AChest_NounMatch
  $D291,$07 "#MESSAGE$D291".
B $D298,$01 Terminator.

t $D299 Messaging: "Any Crystals"
@ $D299 label=Messaging_AnyCrystals
  $D299,$0C "#MESSAGE$D299".
B $D2A5,$01 Terminator.

t $D2A6 Messaging: "A Key Noun Match"
@ $D2A6 label=Messaging_AKey_NounMatch
  $D2A6,$05 "#MESSAGE$D2A6".
B $D2AB,$01 Terminator.

t $D2AC Messaging: "A Chasm"
@ $D2AC label=Messaging_AChasm
  $D2AC,$07 "#MESSAGE$D2AC".
B $D2B3,$01 Terminator.

t $D2B4 Messaging: "An Elf"
@ $D2B4 label=Messaging_AnElf
  $D2B4,$06 "#MESSAGE$D2B4".
B $D2BA,$01 Terminator.

t $D2BB Messaging: "A Dragon Noun Match"
@ $D2BB label=Messaging_ADragon_NounMatch
  $D2BB,$08 "#MESSAGE$D2BB".
B $D2C3,$01 Terminator.

t $D2C4 Messaging: "A Lizard"
@ $D2C4 label=Messaging_ALizard
  $D2C4,$08 "#MESSAGE$D2C4".
B $D2CC,$01 Terminator.

t $D2CD Messaging: "Any Wolves"
@ $D2CD label=Messaging_AnyWolves
  $D2CD,$0A "#MESSAGE$D2CD".
B $D2D7,$01 Terminator.

t $D2D8 Messaging: "A Nymph"
@ $D2D8 label=Messaging_ANymph
  $D2D8,$07 "#MESSAGE$D2D8".
B $D2DF,$01 Terminator.

t $D2E0 Messaging: "A Centaur"
@ $D2E0 label=Messaging_ACentaur
  $D2E0,$09 "#MESSAGE$D2E0".
B $D2E9,$01 Terminator.

t $D2EA Messaging: "A Boat"
@ $D2EA label=Messaging_ABoat
  $D2EA,$06 "#MESSAGE$D2EA".
B $D2F0,$01 Terminator.

t $D2F1 Messaging: "A Monster"
@ $D2F1 label=Messaging_AMonster
  $D2F1,$09 "#MESSAGE$D2F1".
B $D2FA,$01 Terminator.

t $D2FB Messaging: "A Hut"
@ $D2FB label=Messaging_AHut
  $D2FB,$05 "#MESSAGE$D2FB".
B $D300,$01 Terminator.

t $D301 Messaging: "A Hovel"
@ $D301 label=Messaging_AHovel
  $D301,$07 "#MESSAGE$D301".
B $D308,$01 Terminator.

t $D309 Messaging: "A Spider"
@ $D309 label=Messaging_ASpider
  $D309,$08 "#MESSAGE$D309".
B $D311,$01 Terminator.

t $D312 Messaging: "A River"
@ $D312 label=Messaging_ARiver
  $D312,$07 "#MESSAGE$D312".
B $D319,$01 Terminator.

t $D31A Messaging: "A Precipice"
@ $D31A label=Messaging_APrecipice
  $D31A,$0B "#MESSAGE$D31A".
B $D325,$01 Terminator.

t $D326 Messaging: "A Projection"
@ $D326 label=Messaging_AProjection
  $D326,$0C "#MESSAGE$D326".
B $D332,$01 Terminator.

t $D333 Messaging: "A Body"
@ $D333 label=Messaging_ABody
  $D333,$06 "#MESSAGE$D333".
B $D339,$01 Terminator.

t $D33A Messaging: "A Farmhouse"
@ $D33A label=Messaging_AFarmhouse
  $D33A,$0B "#MESSAGE$D33A".
B $D345,$01 Terminator.

t $D346 Messaging: "Any Oars"
@ $D346 label=Messaging_AnyOars
  $D346,$08 "#MESSAGE$D346".
B $D34E,$01 Terminator.

t $D34F Messaging: "A Blacksmith"
@ $D34F label=Messaging_ABlacksmith
  $D34F,$0C "#MESSAGE$D34F".
B $D35B,$01 Terminator.

t $D35C Messaging: "A Forge"
@ $D35C label=Messaging_AForge
  $D35C,$07 "#MESSAGE$D35C".
B $D363,$01 Terminator.

t $D364 Messaging: "Any Demons"
@ $D364 label=Messaging_AnyDemons
  $D364,$0A "#MESSAGE$D364".
B $D36E,$01 Terminator.

t $D36F Messaging: "The Wizard"
@ $D36F label=Messaging_TheWizard
  $D36F,$0A "#MESSAGE$D36F".
B $D379,$01 Terminator.

t $D37A Messaging: "The Princess"
@ $D37A label=Messaging_ThePrincess
  $D37A,$0C "#MESSAGE$D37A".
B $D386,$01 Terminator.

t $D387 Messaging: "A Witch"
@ $D387 label=Messaging_AWitch
  $D387,$07 "#MESSAGE$D387".
B $D38E,$01 Terminator.

t $D38F Messaging: "The Old Man Noun Match"
@ $D38F label=Messaging_TheOldMan_NounMatch
  $D38F,$0B "#MESSAGE$D38F".
B $D39A,$01 Terminator.

t $D39B Messaging: "A Rock"
@ $D39B label=Messaging_ARock
  $D39B,$06 "#MESSAGE$D39B".
B $D3A1,$01 Terminator.

t $D3A2 Messaging: "A Korl Warrior"
@ $D3A2 label=Messaging_AKorlWarrior
  $D3A2,$0E "#MESSAGE$D3A2".
B $D3B0,$01 Terminator.

t $D3B1 Messaging: "A Door"
@ $D3B1 label=Messaging_ADoor
  $D3B1,$06 "#MESSAGE$D3B1".
B $D3B7,$01 Terminator.

g $D3B8 Table: Object Descriptions
@ $D3B8 label=Table_ObjectDescriptions
D $D3B8 #N$4A pointers to the object messages. Indexed with the count
. stored at *#R$BAF8.
W $D3B8,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D3B8,$02,$4A

g $D44C Table: Room Descriptions
@ $D44C label=Table_RoomDescriptions
D $D44C One pointer per room. Room #N$00 and room #N$01 are unused.
. The starting room is #N($05), The Great Valley.
W $D44C,$02 #IF(#PEEK(#PC)+#PEEK(#PC+$01)==$00)(Unused.,#R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).)
L $D44C,$02,$4D

g $D4E6 Table: Nouns
@ $D4E6 label=Table_Nouns
D $D4E6 #N$2A pointers to the noun phrases the parser matches.
W $D4E6,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D4E6,$02,$2A

t $D53A Messaging: "Congratulations"
@ $D53A label=Messaging_Congratulations
  $D53A,$CD "#MESSAGE$D53A".
B $D607,$01 Terminator.

t $D608 Messaging: "You Open The Chest,Revealing"
@ $D608 label=Messaging_YouOpenTheChestRevealing
  $D608,$3B "#MESSAGE$D608".
B $D643,$01 Terminator.

t $D644 Messaging: "The Wood Nymph Leaves You"
@ $D644 label=Messaging_TheWoodNymphLeavesYou
  $D644,$41 "#MESSAGE$D644".
B $D685,$01 Terminator.

t $D686 Messaging: "The Spider Spins A Web"
@ $D686 label=Messaging_TheSpiderSpinsAWeb
  $D686,$2F "#MESSAGE$D686".
B $D6B5,$01 Terminator.

t $D6B6 Messaging: "The Monster Engulfs And"
@ $D6B6 label=Messaging_TheMonsterEngulfsAnd
  $D6B6,$29 "#MESSAGE$D6B6".
B $D6DF,$01 Terminator.

t $D6E0 Messaging: "The Demons Make A Determined"
@ $D6E0 label=Messaging_TheDemonsMakeADetermined
  $D6E0,$35 "#MESSAGE$D6E0".
B $D715,$01 Terminator.

t $D716 Messaging: "The Wizard Completes His Spell"
@ $D716 label=Messaging_TheWizardCompletesHisSpell
  $D716,$3C "#MESSAGE$D716".
B $D752,$01 Terminator.

t $D753 Messaging: "An Elf Attacks You"
@ $D753 label=Messaging_AnElfAttacksYou
  $D753,$14 "#MESSAGE$D753".
B $D767,$01 Terminator.

t $D768 Messaging: "But You Are Too Fast And"
@ $D768 label=Messaging_ButYouAreTooFastAnd
  $D768,$2C "#MESSAGE$D768".
B $D794,$01 Terminator.

t $D795 Messaging: "You Were Caught By Surprise"
@ $D795 label=Messaging_YouWereCaughtBySurprise
  $D795,$3B "#MESSAGE$D795".
B $D7D0,$01 Terminator.

t $D7D1 Messaging: "A Flying Lizard Attacks You"
@ $D7D1 label=Messaging_AFlyingLizardAttacksYou
  $D7D1,$1D "#MESSAGE$D7D1".
B $D7EE,$01 Terminator.

t $D7EF Messaging: "But You Deftly Avoid The"
@ $D7EF label=Messaging_ButYouDeftlyAvoidThe
  $D7EF,$33 "#MESSAGE$D7EF".
B $D822,$01 Terminator.

t $D823 Messaging: "You Move Too Slowly"
@ $D823 label=Messaging_YouMoveTooSlowly
  $D823,$29 "#MESSAGE$D823".
B $D84C,$01 Terminator.

t $D84D Messaging: "A Centaur Appears"
@ $D84D label=Messaging_ACentaurAppears
  $D84D,$13 "#MESSAGE$D84D".
B $D860,$01 Terminator.

t $D861 Messaging: "It Sees You,Then Gallops Off"
@ $D861 label=Messaging_ItSeesYouThenGallopsOff
  $D861,$1D "#MESSAGE$D861".
B $D87E,$01 Terminator.

t $D87F Messaging: "The Old Man Appears"
@ $D87F label=Messaging_TheOldManAppears
  $D87F,$15 "#MESSAGE$D87F".
B $D894,$01 Terminator.

t $D895 Messaging: "He Says"
@ $D895 label=Messaging_HeSays
  $D895,$33 "#MESSAGE$D895".
B $D8C8,$01 Terminator.

t $D8C9 Messaging: "He Says Seek The Smith To Fashion The Hellblade"
@ $D8C9 label=Messaging_HeSaysSeekTheSmithToFashionTheHellblade
  $D8C9,$73 "#MESSAGE$D8C9".
B $D93C,$01 Terminator.

t $D93D Messaging: "He Suddenly Vanishes"
@ $D93D label=Messaging_HeSuddenlyVanishes
  $D93D,$15 "#MESSAGE$D93D".
B $D952,$01 Terminator.

t $D953 Messaging: "You Catch A Fleeting Glimpse Of A Wood Nymph"
@ $D953 label=Messaging_YouCatchAFleetingGlimpseOfAWoodNymph
  $D953,$4D "#MESSAGE$D953".
B $D9A0,$01 Terminator.

t $D9A1 Messaging: "She Darts Out Of Sight As"
@ $D9A1 label=Messaging_SheDartsOutOfSightAs
  $D9A1,$2E "#MESSAGE$D9A1".
B $D9CF,$01 Terminator.

t $D9D0 Messaging: "A Wood Nymph Appears"
@ $D9D0 label=Messaging_AWoodNymphAppears
  $D9D0,$16 "#MESSAGE$D9D0".
B $D9E6,$01 Terminator.

t $D9E7 Messaging: "She Kneels Beside You And"
@ $D9E7 label=Messaging_SheKneelsBesideYouAnd
  $D9E7,$41 "#MESSAGE$D9E7".
B $DA28,$01 Terminator.

t $DA29 Messaging: "Within A Few Minutes,No"
@ $DA29 label=Messaging_WithinAFewMinutesNo
  $DA29,$37 "#MESSAGE$DA29".
B $DA60,$01 Terminator.

t $DA61 Messaging: "A Pack Of Wolves Appears"
@ $DA61 label=Messaging_APackOfWolvesAppears
  $DA61,$1A "#MESSAGE$DA61".
B $DA7B,$01 Terminator.

t $DA7C Messaging: "You Have Nothing To Fight With"
@ $DA7C label=Messaging_YouHaveNothingToFightWith
  $DA7C,$35 "#MESSAGE$DA7C".
B $DAB1,$01 Terminator.

t $DAB2 Messaging: "You Successfully Fight Them Off"
@ $DAB2 label=Messaging_YouSuccessfullyFightThemOff
  $DAB2,$50 "#MESSAGE$DAB2".
B $DB02,$01 Terminator.

t $DB03 Messaging: "A Korl Warrior Appears"
@ $DB03 label=Messaging_AKorlWarriorAppears
  $DB03,$34 "#MESSAGE$DB03".
B $DB37,$01 Terminator.

t $DB38 Messaging: "You Can't Move"
@ $DB38 label=Messaging_YouCantMove
  $DB38,$2A "#MESSAGE$DB38".
B $DB62,$01 Terminator.

t $DB63 Messaging: "The Witch Sees You,Chuckles"
@ $DB63 label=Messaging_TheWitchSeesYouChuckles
  $DB63,$7A "#MESSAGE$DB63".
B $DBDD,$01 Terminator.

t $DBDE Messaging: "The Witch Sees The Ring On"
@ $DBDE label=Messaging_TheWitchSeesTheRingOn
  $DBDE,$56 "#MESSAGE$DBDE".
B $DC34,$01 Terminator.

t $DC35 Messaging: "Work It Out For Yourself"
@ $DC35 label=Messaging_WorkItOutForYourself
  $DC35,$19 "#MESSAGE$DC35".
B $DC4E,$01 Terminator.

t $DC4F Messaging: "Help Is On The Way"
@ $DC4F label=Messaging_HelpIsOnTheWay
  $DC4F,$13 "#MESSAGE$DC4F".
B $DC62,$01 Terminator.

t $DC63 Messaging: "They Are Not Removable"
@ $DC63 label=Messaging_TheyAreNotRemovable
  $DC63,$17 "#MESSAGE$DC63".
B $DC7A,$01 Terminator.

t $DC7B Messaging: "It Is Unlocked"
@ $DC7B label=Messaging_ItIsUnlocked
  $DC7B,$0F "#MESSAGE$DC7B".
B $DC8A,$01 Terminator.

t $DC8B Messaging: "It Already Is"
@ $DC8B label=Messaging_ItAlreadyIs
  $DC8B,$0E "#MESSAGE$DC8B".
B $DC99,$01 Terminator.

t $DC9A Messaging: "You Are In The Boat Already"
@ $DC9A label=Messaging_YouAreInTheBoatAlready
  $DC9A,$1C "#MESSAGE$DC9A".
B $DCB6,$01 Terminator.

t $DCB7 Messaging: "There Are Curious Runic Symbols"
@ $DCB7 label=Messaging_ThereAreCuriousRunicSymbols
  $DCB7,$38 "#MESSAGE$DCB7".
B $DCEF,$01 Terminator.

t $DCF0 Messaging: "It Is Locked"
@ $DCF0 label=Messaging_ItIsLocked
  $DCF0,$0D "#MESSAGE$DCF0".
B $DCFD,$01 Terminator.

t $DCFE Messaging: "The Log Now Spans The Chasm,"
@ $DCFE label=Messaging_TheLogNowSpansTheChasm
  $DCFE,$39 "#MESSAGE$DCFE".
B $DD37,$01 Terminator.

t $DD38 Messaging: "You Can't.He's Dead"
@ $DD38 label=Messaging_YouCantHesDead
  $DD38,$14 "#MESSAGE$DD38".
B $DD4C,$01 Terminator.

t $DD4D Messaging: "You Give Him The Crystals"
@ $DD4D label=Messaging_YouGiveHimTheCrystals
  $DD4D,$36 "#MESSAGE$DD4D".
B $DD83,$01 Terminator.

t $DD84 Messaging: "After Some Time,"
@ $DD84 label=Messaging_AfterSomeTime
  $DD84,$61 "#MESSAGE$DD84".
B $DDE5,$01 Terminator.

t $DDE6 Messaging: "You Start To Climb"
@ $DDE6 label=Messaging_YouStartToClimb
  $DDE6,$4C "#MESSAGE$DDE6".
B $DE32,$01 Terminator.

t $DE33 Messaging: "You're Not In The Boat"
@ $DE33 label=Messaging_YoureNotInTheBoat
  $DE33,$17 "#MESSAGE$DE33".
B $DE4A,$01 Terminator.

t $DE4B Messaging: "You Eat The Food"
@ $DE4B label=Messaging_YouEatTheFood
  $DE4B,$25 "#MESSAGE$DE4B".
B $DE70,$01 Terminator.

t $DE71 Messaging: "You Take A Refreshing"
@ $DE71 label=Messaging_YouTakeARefreshing
  $DE71,$25 "#MESSAGE$DE71".
B $DE96,$01 Terminator.

t $DE97 Messaging: "He's Already Dead"
@ $DE97 label=Messaging_HesAlreadyDead
  $DE97,$12 "#MESSAGE$DE97".
B $DEA9,$01 Terminator.

t $DEAA Messaging: "She's Already Dead"
@ $DEAA label=Messaging_ShesAlreadyDead
  $DEAA,$13 "#MESSAGE$DEAA".
B $DEBD,$01 Terminator.

t $DEBE Messaging: "It's Already Dead"
@ $DEBE label=Messaging_ItsAlreadyDead
  $DEBE,$12 "#MESSAGE$DEBE".
B $DED0,$01 Terminator.

t $DED1 Messaging: "You Have No Arrows"
@ $DED1 label=Messaging_YouHaveNoArrows
  $DED1,$13 "#MESSAGE$DED1".
B $DEE4,$01 Terminator.

t $DEE5 Messaging: "You Fire An Arrow"
@ $DEE5 label=Messaging_YouFireAnArrow
  $DEE5,$13 "#MESSAGE$DEE5".
B $DEF8,$01 Terminator.

t $DEF9 Messaging: "Bad Luck.You Missed"
@ $DEF9 label=Messaging_BadLuckYouMissed
  $DEF9,$14 "#MESSAGE$DEF9".
B $DF0D,$01 Terminator.

t $DF0E Messaging: "Well Done! A Perfect Shot"
@ $DF0E label=Messaging_WellDoneAPerfectShot
  $DF0E,$1A "#MESSAGE$DF0E".
B $DF28,$01 Terminator.

t $DF29 Messaging: "You're Not Carrying A Bow"
@ $DF29 label=Messaging_YoureNotCarryingABow
  $DF29,$1A "#MESSAGE$DF29".
B $DF43,$01 Terminator.

t $DF44 Messaging: "Your Blow Strikes True"
@ $DF44 label=Messaging_YourBlowStrikesTrue
  $DF44,$17 "#MESSAGE$DF44".
B $DF5B,$01 Terminator.

t $DF5C Messaging: "You Swing The Sword"
@ $DF5C label=Messaging_YouSwingTheSword
  $DF5C,$15 "#MESSAGE$DF5C".
B $DF71,$01 Terminator.

t $DF72 Messaging: "You're Not Carrying The Sword"
@ $DF72 label=Messaging_YoureNotCarryingTheSword
  $DF72,$1E "#MESSAGE$DF72".
B $DF90,$01 Terminator.

t $DF91 Messaging: "First Unused Response Message"
@ $DF91 label=Messaging_FirstUnusedResponseMessage
  $DF91,$05 "#MESSAGE$DF91".
B $DF96,$01 Terminator.

t $DF97 Messaging: "Second Unused Response Message"
@ $DF97 label=Messaging_SecondUnusedResponseMessage
  $DF97,$05 "#MESSAGE$DF97".
B $DF9C,$01 Terminator.

t $DF9D Messaging: "Third Unused Response Message"
@ $DF9D label=Messaging_ThirdUnusedResponseMessage
  $DF9D,$05 "#MESSAGE$DF9D".
B $DFA2,$01 Terminator.

t $DFA3 Messaging: "The Elf Is Dead"
@ $DFA3 label=Messaging_TheElfIsDead
  $DFA3,$10 "#MESSAGE$DFA3".
B $DFB3,$01 Terminator.

t $DFB4 Messaging: "The Lizard Falls To The Ground"
@ $DFB4 label=Messaging_TheLizardFallsToTheGround
  $DFB4,$2B "#MESSAGE$DFB4".
B $DFDF,$01 Terminator.

t $DFE0 Messaging: "You Have Killed It"
@ $DFE0 label=Messaging_YouHaveKilledIt
  $DFE0,$13 "#MESSAGE$DFE0".
B $DFF3,$01 Terminator.

t $DFF4 Messaging: "You Have Killed Her"
@ $DFF4 label=Messaging_YouHaveKilledHer
  $DFF4,$14 "#MESSAGE$DFF4".
B $E008,$01 Terminator.

t $E009 Messaging: "The Stricken Monster Slides"
@ $E009 label=Messaging_TheStrickenMonsterSlides
  $E009,$37 "#MESSAGE$E009".
B $E040,$01 Terminator.

t $E041 Messaging: "The Demons Scream With Panic,"
@ $E041 label=Messaging_TheDemonsScreamWithPanic
  $E041,$2D "#MESSAGE$E041".
B $E06E,$01 Terminator.

t $E06F Messaging: "Arrows Have No Effect"
@ $E06F label=Messaging_ArrowsHaveNoEffect
  $E06F,$16 "#MESSAGE$E06F".
B $E085,$01 Terminator.

t $E086 Messaging: "You Have Killed Him"
@ $E086 label=Messaging_YouHaveKilledHim
  $E086,$14 "#MESSAGE$E086".
B $E09A,$01 Terminator.

t $E09B Messaging: "The Wizard Falls To The Floor"
@ $E09B label=Messaging_TheWizardFallsToTheFloor
  $E09B,$77 "#MESSAGE$E09B".
B $E112,$01 Terminator.

t $E113 Messaging: "You Kiss Her"
@ $E113 label=Messaging_YouKissHer
  $E113,$25 "#MESSAGE$E113".
B $E138,$01 Terminator.

t $E139 Messaging: "Don't Be Ridiculous"
@ $E139 label=Messaging_DontBeRidiculous
  $E139,$14 "#MESSAGE$E139".
B $E14D,$01 Terminator.

t $E14E Messaging: "It's Too Late For That,"
@ $E14E label=Messaging_ItsTooLateForThat
  $E14E,$23 "#MESSAGE$E14E".
B $E171,$01 Terminator.

t $E172 Messaging: "It's Already Open"
@ $E172 label=Messaging_ItsAlreadyOpen
  $E172,$12 "#MESSAGE$E172".
B $E184,$01 Terminator.

t $E185 Messaging: "It's Already Closed"
@ $E185 label=Messaging_ItsAlreadyClosed
  $E185,$14 "#MESSAGE$E185".
B $E199,$01 Terminator.

t $E19A Messaging: "You're Inside Already"
@ $E19A label=Messaging_YoureInsideAlready
  $E19A,$16 "#MESSAGE$E19A".
B $E1B0,$01 Terminator.

t $E1B1 Messaging: "You're Wearing It Already"
@ $E1B1 label=Messaging_YoureWearingItAlready
  $E1B1,$1A "#MESSAGE$E1B1".
B $E1CB,$01 Terminator.

t $E1CC Messaging: "It Has No Apparent Effect"
@ $E1CC label=Messaging_ItHasNoApparentEffect
  $E1CC,$1A "#MESSAGE$E1CC".
B $E1E6,$01 Terminator.

t $E1E7 Messaging: "As You Touch The Rock,"
@ $E1E7 label=Messaging_AsYouTouchTheRock
  $E1E7,$34 "#MESSAGE$E1E7".
B $E21B,$01 Terminator.

t $E21C Messaging: "You Plunge Into The Water"
@ $E21C label=Messaging_YouPlungeIntoTheWater
  $E21C,$5D "#MESSAGE$E21C".
B $E279,$01 Terminator.

t $E27A Messaging: "You Make A Tremondous Leap,"
@ $E27A label=Messaging_YouMakeATremondousLeap
  $E27A,$47 "#MESSAGE$E27A".
B $E2C1,$01 Terminator.

t $E2C2 Messaging: "O.K. The Rope Dangles Down, Into The Volcano"
@ $E2C2 label=Messaging_OKTheRopeDanglesDownIntoTheVolcano
  $E2C2,$2D "#MESSAGE$E2C2".
B $E2EF,$01 Terminator.

t $E2F0 Messaging: "The Rope Is Already Tied"
@ $E2F0 label=Messaging_TheRopeIsAlreadyTied
  $E2F0,$19 "#MESSAGE$E2F0".
B $E309,$01 Terminator.

t $E30A Messaging: "Don't Be Disgusting"
@ $E30A label=Messaging_DontBeDisgusting
  $E30A,$14 "#MESSAGE$E30A".
B $E31E,$01 Terminator.

t $E31F Messaging: "She Evades Your Grasp"
@ $E31F label=Messaging_SheEvadesYourGrasp
  $E31F,$2A "#MESSAGE$E31F".
B $E349,$01 Terminator.

t $E34A Messaging: "You Row Across To"
@ $E34A label=Messaging_YouRowAcrossTo
  $E34A,$24 "#MESSAGE$E34A".
B $E36E,$01 Terminator.

t $E36F Messaging: "It Is Already Unlocked"
@ $E36F label=Messaging_ItIsAlreadyUnlocked
  $E36F,$17 "#MESSAGE$E36F".
B $E386,$01 Terminator.

t $E387 Messaging: "You're Not Carrying A Key"
@ $E387 label=Messaging_YoureNotCarryingAKey
  $E387,$1A "#MESSAGE$E387".
B $E3A1,$01 Terminator.

t $E3A2 Messaging: "You're No Carrying A Horn"
@ $E3A2 label=Messaging_YoureNoCarryingAHorn
  $E3A2,$1A "#MESSAGE$E3A2".
B $E3BC,$01 Terminator.

t $E3BD Messaging: "The Dragon Leaps Into The Air,"
@ $E3BD label=Messaging_TheDragonLeapsIntoTheAir
  $E3BD,$86 "#MESSAGE$E3BD".
B $E443,$01 Terminator.

t $E444 Messaging: "The Dragon Swoops Down"
@ $E444 label=Messaging_TheDragonSwoopsDown
  $E444,$52 "#MESSAGE$E444".
B $E496,$01 Terminator.

t $E497 Messaging: "You Can't. It's Locked"
@ $E497 label=Messaging_YouCantItsLocked
  $E497,$17 "#MESSAGE$E497".
B $E4AE,$01 Terminator.

t $E4AF Table: Vocabulary
@ $E4AF label=Table_Vocabulary
D $E4AF Four-character words. A comma binds synonyms to the same command.
  $E4AF,$09 Command #N$00.
  $E4B8,$09 Command #N$01.
  $E4C1,$09 Command #N$02.
  $E4CA,$09 Command #N$03.
  $E4D3,$09 Command #N$04.
  $E4DC,$09 Command #N$05.
  $E4E5,$09 Command #N$06.
  $E4EE,$09 Command #N$07.
  $E4F7,$09 Command #N$08.
  $E500,$04 Command #N$09.
  $E504,$04 Command #N$0A.
  $E508,$04 Command #N$0B.
  $E50C,$04 Command #N$0C.
  $E510,$0E Command #N$0D.
  $E51E,$18 Command #N$0E.
  $E536,$04 Command #N$0F.
  $E53A,$04 Command #N$10.
  $E53E,$04 Command #N$11.
  $E542,$04 Command #N$12.
  $E546,$0E Command #N$13.
  $E554,$04 Command #N$14.
  $E558,$04 Command #N$15.
  $E55C,$09 Command #N$16.
  $E565,$04 Command #N$17.
  $E569,$04 Command #N$18.
  $E56D,$09 Command #N$19.
  $E576,$04 Command #N$1A.
  $E57A,$04 Command #N$1B.
  $E57E,$04 Command #N$1C.
  $E582,$04 Command #N$1D.
  $E586,$0E Command #N$1E.
  $E594,$04 Command #N$1F.
  $E598,$04 Command #N$20.
  $E59C,$04 Command #N$21.
  $E5A0,$04 Command #N$22.
  $E5A4,$04 Command #N$23.
  $E5A8,$04 Command #N$24.
  $E5AC,$04 Command #N$25.
  $E5B0,$04 Command #N$26.
  $E5B4,$04 Command #N$27.
  $E5B8,$04 Command #N$28.
  $E5BC,$04 Command #N$29.
  $E5C0,$04 Command #N$2A.
  $E5C4,$04 Command #N$2B.
  $E5C8,$04 Command #N$2C.
  $E5CC,$04 Command #N$2D.
  $E5D0,$04 Command #N$2E.
  $E5D4,$04 Command #N$2F.
  $E5D8,$04 Command #N$30.
  $E5DC,$04 Command #N$31.
  $E5E0,$04 Command #N$32.
  $E5E4,$04 Command #N$33.
  $E5E8,$04 Command #N$34.
  $E5EC,$09 Command #N$35.
  $E5F5,$04 Command #N$36.
  $E5F9,$04 Command #N$37.
  $E5FD,$04 Command #N$38.
  $E601,$04 Command #N$39.
  $E605,$04 Command #N$3A.
  $E609,$04 Command #N$3B.
  $E60D,$04 Command #N$3C.
  $E611,$04 Command #N$3D.
  $E615,$04 Command #N$3E.
  $E619,$04 Command #N$3F.
  $E61D,$04 Command #N$40.
  $E621,$04 Command #N$41.
  $E625,$04 Command #N$42.
  $E629,$04 Command #N$43.
  $E62D,$04 Command #N$44.
  $E631,$04 Command #N$45.
  $E635,$09 Command #N$46.
  $E63E,$09 Command #N$47.
  $E647,$04 Command #N$48.
  $E64B,$04 Command #N$49.
  $E64F,$04 Command #N$4A.
  $E653,$04 Command #N$4B.
  $E657,$04 Command #N$4C.
  $E65B,$04 Command #N$4D.
  $E65F,$04 Command #N$4E.
  $E663,$04 Command #N$4F.
  $E667,$04 Command #N$50.
  $E66B,$09 Command #N$51.
  $E674,$04 Command #N$52.
  $E678,$09 Command #N$53.
  $E681,$04 Command #N$54.
  $E685,$04 Command #N$55.
  $E689,$04 Command #N$56.
  $E68D,$04 Command #N$57.
  $E691,$04 Command #N$58.
  $E695,$04 Command #N$59.
  $E699,$04 Command #N$5A.
  $E69D,$04 Command #N$5B.
  $E6A1,$09 Command #N$5C.
  $E6AA,$09 Command #N$5D.
  $E6B3,$04 Command #N$5E.
  $E6B7,$04 Command #N$5F.
B $E6BB,$01 Terminator.

b $E6BC Table: Match Characters
@ $E6BC label=Table_MatchCharacters
D $E6BC Characters used while comparing a typed word with the vocabulary.
B $E6BC,$01 Character #N(#PEEK(#PC)): #CHR(#PEEK(#PC)).
L $E6BC,$01,$2A

b $E6E6 Table: Phrase Tokens
@ $E6E6 label=Table_PhraseTokens
D $E6E6 Token lists terminated by #N$FE. Each list names the objects a
. verb phrase may refer to.
B $E6E6,$01 #IF(#PEEK(#PC)==$FE)(End of phrase.,Object #N(#PEEK(#PC)).)
L $E6E6,$01,$C8

b $E7AE Table: Verb Tokens
@ $E7AE label=Table_VerbTokens
D $E7AE The vocabulary command number for each entry in #R$FB0D.
B $E7AE,$01 Command #N(#PEEK(#PC)).
L $E7AE,$01,$22

b $E7D0 Table: Message Groups
@ $E7D0 label=Table_MessageGroups
D $E7D0 Lists of message numbers, each list terminated by #N$FF.
B $E7D0,$01 #IF(#PEEK(#PC)==$FF)(End of group.,Message #N(#PEEK(#PC)).)
L $E7D0,$01,$164

g $E934 Table: Room Exits
@ $E934 label=Table_RoomExits
@ $E941 label=Exit_FarmhouseSouth
@ $E996 label=Exit_WoodmansHutEast
@ $E9B4 label=Exit_WesternChasmEast
@ $E9BB label=Exit_EasternChasmWest
@ $EAA4 label=Exit_WitchsHovelEast
@ $EAAA label=Exit_RockWallEast
@ $EADA label=Exit_CavernEast
D $E934 Six direction bytes for each room, in the order used by #R$C201:
. north, south, east, west, up, down. #N$00 means no exit. Some of
. these bytes are rewritten when a door opens or an event moves the
. player.
B $E934,$01 Direction #N((#PC-$E934)%$06) of room #N((#PC-$E934)/$06): #N(#PEEK(#PC)).
L $E934,$01,$1CE

g $EB02 Table: Flags To Clear
@ $EB02 label=Table_FlagsToClear
D $EB02 Addresses zeroed by the routine at #R$F964 before the game starts.
W $EB02,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $EB02,$02,$07

c $EB10 Game Loop
@ $EB10 label=GameLoop
D $EB10 One turn: threats, local events, a command, then the matching verb.
N $EB10 Run any timed threat, then the room's scenic event.
  $EB10,$03 Call #R$BECE.
N $EB13 Run the room's scenic event.
  $EB13,$03 Call #R$C3FA.
N $EB16 Read a command and match it against the vocabulary.
  $EB16,$03 Call #R$BF73 to read a command.
N $EB19 Match the command against the vocabulary.
  $EB19,$03 Call #R$C3DC.
  $EB1C,$02 Jump back to #R$EB10 when the command was not understood.
  $EB1E,$03 Call #R$C463 to carry out the verb.
  $EB21,$02 Jump back to #R$EB10 for the next turn.

c $EB23 Game Over
@ $EB23 label=GameOver
D $EB23 Tell the player they are dead and ask whether to play again.
N $EB23 Tell the player they are dead.
  $EB23,$06 Print "#MESSAGE$BC01".
N $EB29 Ask whether to play again.
@ $EB29 label=GameOver_WantAnother
  $EB29,$06 Print "#MESSAGE$BC0F".
@ $EB2F label=GameOver_Ask
  $EB2F,$03 Call #R$BDDA to wait for the player's answer.
  $EB32,$05 Jump to #SKOOLKID$0000(START) if the player pressed "N".
  $EB37,$05 Jump to #R$B9C5 to play again if the player pressed "Y".
  $EB3C,$02 Jump back to #R$EB2F until the answer is Y or N.

c $EB3E Game Complete
@ $EB3E label=GameComplete
D $EB3E Show the winning text, then ask whether to play again.
N $EB3E Clear the screen for the winning text.
  $EB3E,$03 Call #R$BDEA.
  $EB41,$03 Call #R$BE06 to place the cursor for the win text.
N $EB44 Print "#MESSAGE$D53A".
  $EB44,$06 Print "#MESSAGE$D53A".
  $EB4A,$02 Jump to #R$EB29 to ask whether to play again.

c $EB4C Events: Wood Nymph
@ $EB4C label=Events_WoodNymph
D $EB4C The wood nymph appears, heals the player and then leaves.
  $EB4C,$0B Clear the nymph's event and return unless she is here.
  $EB57,$05 Destroy object #N$8A (the wood nymph).
  $EB5C,$05 Move object #N$07 (the ring) into the current room.
  $EB61,$06 Print "#MESSAGE$D644".
  $EB67,$01 Return.

c $EB68 Fatal Events: Spider
@ $EB68 label=Events_Spider
D $EB68 The spider kills the player when they are still in her room.
  $EB68,$0B Clear the spider's event and return unless she is here.
  $EB73,$05 Print "#MESSAGE$D686" to announce the death.

c $EB78 Fatal Events: Slime Monster
@ $EB78 label=Events_SlimeMonster
D $EB78 The slime monster kills the player when they are still in the pit.
  $EB78,$0B Clear the slime's event and return unless it is here.
  $EB83,$05 Print "#MESSAGE$D6B6" to announce the death.

c $EB88 Fatal Events: Demons
@ $EB88 label=Events_Demons
D $EB88 The demons kill the player if the fight is still going on.
  $EB88,$0B Clear the demons' event and return unless they are here.
  $EB93,$05 Print "#MESSAGE$D6E0" to announce the death.

c $EB98 Fatal Events: Wizard
@ $EB98 label=Events_Wizard
D $EB98 Zarn kills the player, and the game ends at once.
  $EB98,$0B Clear Zarn's event and return unless he is here.
  $EBA3,$03 Print "#MESSAGE$D716".
@ $EBA6 label=Events_AnnounceDeath
  $EBA6,$03 Print the death message and start a new line.
  $EBA9,$03 Discard the return addresses on the stack.
  $EBAC,$03 Jump back to #R$EB23 to end the game.

c $EBAF Events: Elf
@ $EBAF label=Events_Elf
D $EBAF An elf attacks. Sometimes the blow is fatal.
  $EBAF,$06 Print "#MESSAGE$D753".
  $EBB5,$07 Jump to #R$EBC5 unless a roll of #N$0F comes up zero.
@ $EBBC nowarn
  $EBBC,$09 Make the blow fatal and print "#MESSAGE$D795".
@ $EBC5 label=Events_Elf_Next
  $EBC5,$03 The blow only glances, with "#MESSAGE$D768".
@ $EBC8 label=Events_Elf_Print
  $EBC8,$03 Call #R$C486 to pause, then print that message and start a new line.
  $EBCB,$01 Return.

c $EBCC Events: Flying Lizard
@ $EBCC label=Events_FlyingLizard
D $EBCC A flying lizard attacks. Sometimes the blow is fatal.
  $EBCC,$06 Print "#MESSAGE$D7D1".
  $EBD2,$07 Jump to #R$EBE2 unless a roll of #N$0F comes up zero.
@ $EBD9 nowarn
  $EBD9,$09 Make the blow fatal and print "#MESSAGE$D823".
@ $EBE2 label=Events_FlyingLizard_Next
  $EBE2,$03 The blow only glances, with "#MESSAGE$D7EF".
@ $EBE5 label=Events_FlyingLizard_Print
  $EBE5,$03 Call #R$C486 to pause, then print that message and start a new line.
  $EBE8,$01 Return.

c $EBE9 Events: Centaur
@ $EBE9 label=Events_Centaur
D $EBE9 A centaur appears and is placed in the current room.
  $EBE9,$06 Print "#MESSAGE$D84D".
  $EBEF,$05 Destroy object #N$86 (the centaur).
  $EBF4,$06 Print "#MESSAGE$D861".
  $EBFA,$01 Return.

c $EBFB Events: Old Man
@ $EBFB label=Events_OldMan
D $EBFB The old man appears, speaks, and is placed in the current room.
  $EBFB,$06 Print "#MESSAGE$D87F".
  $EC01,$06 Print "#MESSAGE$D895".
  $EC07,$06 Print "#MESSAGE$D93D".
  $EC0D,$05 Destroy object #N$87 (the old man).
  $EC12,$01 Return.

c $EC13 Events: Old Man's Quest
@ $EC13 label=Events_OldMansQuest
D $EC13 The old man returns with his quest and is placed in the current room.
  $EC13,$06 Print "#MESSAGE$D87F".
  $EC19,$06 Print "#MESSAGE$D8C9".
  $EC1F,$06 Print "#MESSAGE$D93D".
  $EC25,$05 Destroy object #N$88 (the old man's quest).
  $EC2A,$01 Return.

c $EC2B Events: Wood Nymph's Glimpse
@ $EC2B label=Events_WoodNymphsGlimpse
D $EC2B The player glimpses the wood nymph, who is then placed nearby.
  $EC2B,$06 Print "#MESSAGE$D953".
  $EC31,$06 Print "#MESSAGE$D9A1".
  $EC37,$05 Destroy object #N$89 (the nymph's glimpse).
  $EC3C,$01 Return.

c $EC3D Events: Wood Nymph Heals
@ $EC3D label=Events_WoodNymphHeals
D $EC3D The wood nymph appears, heals the injury and arms the nymph event again.
  $EC3D,$06 Print "#MESSAGE$D9D0".
  $EC43,$06 Print "#MESSAGE$D9E7".
  $EC49,$06 Print "#MESSAGE$DA29".
  $EC4F,$05 Destroy object #N$48 (the injury).
  $EC54,$0A Arm the wood nymph for the next turn.
  $EC5E,$01 Return.

c $EC5F Events: Wolves
@ $EC5F label=Events_Wolves
D $EC5F Wolves attack. The bow drives them off; otherwise the player dies.
  $EC5F,$06 Print "#MESSAGE$DA61".
  $EC65,$07 Jump to #R$EC73 if the player is not carrying object #N$03 (the bow).
  $EC6C,$07 Jump to #R$EC7E when the player is carrying object #N$04 (the arrows).
@ $EC73 label=Events_Wolves_Next
  $EC73,$06 Print "#MESSAGE$DA7C".
@ $EC79 nowarn
  $EC79,$04 Switch #R$EB23 onto the stack.
  $EC7D,$01 Return.
@ $EC7E label=Events_Wolves_FightOff
  $EC7E,$06 Print "#MESSAGE$DAB2".
  $EC84,$05 Move object #N$48 (the injury) into the current room.
  $EC89,$05 Destroy object #N$8B (the wolves).
  $EC8E,$05 Move object #N$1B (the dead wolves) into the current room.
  $EC93,$05 Remove object #N$8A (the wood nymph) from the game.
  $EC98,$01 Return.

c $EC99 Events: Korl Warrior
@ $EC99 label=Events_KorlWarrior
D $EC99 A Korl warrior attacks. Sometimes the blow is fatal.
  $EC99,$06 Print "#MESSAGE$DB03".
  $EC9F,$07 Jump to #R$ECAF unless a roll of #N$14 comes up zero.
@ $ECA6 nowarn
  $ECA6,$09 Make the blow fatal and print "#MESSAGE$D795".
@ $ECAF label=Events_KorlWarrior_Next
  $ECAF,$03 The blow only glances, with "#MESSAGE$D768".
@ $ECB2 label=Events_KorlWarrior_Print
  $ECB2,$03 Call #R$C486 to pause, then print that message and start a new line.
  $ECB5,$01 Return.

c $ECB6 Handler: Injury Check
@ $ECB6 label=Handler_InjuryCheck
D $ECB6 Refuse the move while the player is badly hurt. Otherwise change rooms and arm the local dangers.
  $ECB6,$08 Call #R$C24F to test whether the injury is in this room. Jump to
. #R$ECC5 when the player is not too badly hurt.
  $ECBE,$06 Print "#MESSAGE$DB38".
  $ECC4,$01 Return.
@ $ECC5 label=Handler_InjuryCheck_Next
  $ECC5,$04 Call #R$C42F to move the player into that room.
  $ECC9,$05 Call #R$C0F9 to describe the current room.
  $ECCE,$07 Jump to #R$ECDF if object #N$41 (the giant spider) is not here.
  $ECD5,$0A Arm the giant spider for six turns.
@ $ECDF label=Handler_InjuryCheck_SlimeMonster
  $ECDF,$07 Jump to #R$ECF0 if object #N$1E (the slime monster) is not here.
  $ECE6,$0A Arm the slime monster for six turns.
@ $ECF0 label=Handler_InjuryCheck_Demons
  $ECF0,$07 Jump to #R$ED01 if object #N$29 (the demons) is not here.
  $ECF7,$0A Arm the demons for six turns.
@ $ED01 label=Handler_InjuryCheck_Zarn
  $ED01,$07 Jump to #R$ED12 if object #N$2A (Zarn) is not here.
  $ED08,$0A Arm Zarn for six turns.
@ $ED12 label=Handler_InjuryCheck_Witch
  $ED12,$07 Jump to #R$ED37 if object #N$2E (the witch) is not here.
  $ED19,$07 Jump to #R$ED2C when the player is carrying object #N$43 (the ring being
. worn).
  $ED20,$06 Print "#MESSAGE$DB63".
@ $ED27 nowarn
  $ED26,$01 Discard the return address on the stack.
  $ED27,$04 Switch #R$EB23 onto the stack so the player dies.
  $ED2B,$01 Return.
@ $ED2C label=Handler_InjuryCheck_WitchSeesRing
  $ED2C,$06 Print "#MESSAGE$DBDE".
  $ED32,$05 Destroy object #N$2E (the witch).
@ $ED37 label=Handler_InjuryCheck_OldMan
  $ED37,$07 Jump to #R$ED53 if object #N$2F (the old man) is not here.
  $ED3E,$05 Destroy object #N$2F (the old man).
  $ED43,$05 Move object #N$03 (the bow) into the current room.
  $ED48,$05 Move object #N$04 (the arrows) into the current room.
  $ED4D,$06 Print "#MESSAGE$D93D".
@ $ED53 label=Handler_InjuryCheck_GreatValley
  $ED53,$07 Jump to #R$ED65 unless the player is in room #N$05 (The Great Valley).
  $ED5A,$07 Jump to #R$ED65 if object #N$2C (Princess Mara) is not here.
  $ED61,$01 Discard the return address on the stack.
  $ED62,$03 Jump back to #R$EB3E to announce the win.
@ $ED65 label=Handler_InjuryCheck_Return
  $ED65,$01 Return.

c $ED66 Print Response
@ $ED66 label=PrintResponse
D $ED66 Print the given message and go back to the game loop.
  $ED66,$03 Call #R$BE2E to print the message and start a new line.
  $ED69,$01 Return.

c $ED6A Pause And Print Response
@ $ED6A label=PauseAndPrintResponse
D $ED6A Pause, print the given message and go back to the game loop.
  $ED6A,$03 Call #R$C486 to pause, then print the message and start a new line.
  $ED6D,$01 Return.

c $ED6E Response: "You Can't"
@ $ED6E label=Response_YouCant_GameLoop
D $ED6E Print "You Can't" and return to the caller.
N $ED6E Reply with "#MESSAGE$BCD0".
  $ED6E,$05 Print "#MESSAGE$BCD0" and return to the game loop.

c $ED73 Response: "One At A Time, Please"
@ $ED73 label=Response_OneAtATimePlease
D $ED73 Print "One At A Time, Please" and return to the caller.
N $ED73 Reply with "#MESSAGE$BD52".
  $ED73,$05 Print "#MESSAGE$BD52" and return to the game loop.

c $ED78 Response: "I Don't See The Point"
@ $ED78 label=Response_IDontSeeThePoint
D $ED78 Print "I Don't See The Point" and return to the caller.
N $ED78 Reply with "#MESSAGE$BD68".
  $ED78,$05 Print "#MESSAGE$BD68" and return to the game loop.

c $ED7D Response: "Please Rephrase That"
@ $ED7D label=Response_PleaseRephraseThat_GameLoop
D $ED7D Print "Please Rephrase That" and return to the caller.
N $ED7D Reply with "#MESSAGE$BCBA".
  $ED7D,$05 Print "#MESSAGE$BCBA" and return to the game loop.

c $ED82 Response: "He's Already Dead"
@ $ED82 label=Response_HesAlreadyDead
D $ED82 Print "He's Already Dead" and return to the caller.
N $ED82 Reply with "#MESSAGE$DE97".
  $ED82,$05 Print "#MESSAGE$DE97" and return to the game loop.

c $ED87 Response: "She's Already Dead"
@ $ED87 label=Response_ShesAlreadyDead
D $ED87 Print "She's Already Dead" and return to the caller.
N $ED87 Reply with "#MESSAGE$DEAA".
  $ED87,$05 Print "#MESSAGE$DEAA" and return to the game loop.

c $ED8C Response: "It's Already Dead"
@ $ED8C label=Response_ItsAlreadyDead
D $ED8C Print "It's Already Dead" and return to the caller.
N $ED8C Reply with "#MESSAGE$DEBE".
  $ED8C,$05 Print "#MESSAGE$DEBE" and return to the game loop.

c $ED91 Response: "Don't Be Ridiculous"
@ $ED91 label=Response_DontBeRidiculous
D $ED91 Print "Don't Be Ridiculous" and return to the caller.
N $ED91 Reply with "#MESSAGE$E139".
  $ED91,$05 Print "#MESSAGE$E139" and return to the game loop.

c $ED96 Response: "O.K."
@ $ED96 label=Response_OK
D $ED96 Print "O.K." and return to the caller.
N $ED96 Reply with "#MESSAGE$BCDB".
  $ED96,$05 Print "#MESSAGE$BCDB" and return to the game loop.

c $ED9B Response: "You're Inside Already"
@ $ED9B label=Response_YoureInsideAlready
D $ED9B Print "You're Inside Already" and return to the caller.
N $ED9B Reply with "#MESSAGE$E19A".
  $ED9B,$05 Print "#MESSAGE$E19A" and return to the game loop.

c $EDA0 Response: "Please Rephrase That"
@ $EDA0 label=Response_PleaseRephraseThat_EnterTheBoat
D $EDA0 Print "Please Rephrase That" and return to the caller.
N $EDA0 Reply with "#MESSAGE$BCBA".
  $EDA0,$05 Print "#MESSAGE$BCBA" and return to the game loop.

c $EDA5 Response: "It Has No Apparent Effect"
@ $EDA5 label=Response_ItHasNoApparentEffect
D $EDA5 Print "It Has No Apparent Effect" and return to the caller.
N $EDA5 Reply with "#MESSAGE$E1CC".
  $EDA5,$05 Print "#MESSAGE$E1CC" and return to the game loop.

c $EDAA Response: "Don't Be Disgusting"
@ $EDAA label=Response_DontBeDisgusting
D $EDAA Print "Don't Be Disgusting" and return to the caller.
N $EDAA Reply with "#MESSAGE$E30A".
  $EDAA,$05 Print "#MESSAGE$E30A" and return to the game loop.

c $EDAF Response: "You're Not Carrying Anything"
@ $EDAF label=Response_YoureNotCarryingAnything
D $EDAF Print "You're Not Carrying Anything" and return to the caller.
N $EDAF Reply with "#MESSAGE$BD94".
  $EDAF,$05 Print "#MESSAGE$BD94" and return to the game loop.

c $EDB4 Response: "You Can't. It's Locked"
@ $EDB4 label=Response_YouCantItsLocked
D $EDB4 Print "You Can't. It's Locked" and return to the caller.
N $EDB4 Reply with "#MESSAGE$E497".
  $EDB4,$05 Print "#MESSAGE$E497" and return to the game loop.

c $EDB9 Response: "It's Already Open"
@ $EDB9 label=Response_ItsAlreadyOpen
D $EDB9 Print "It's Already Open" and return to the caller.
N $EDB9 Reply with "#MESSAGE$E172".
  $EDB9,$05 Print "#MESSAGE$E172" and return to the game loop.

c $EDBE Response: "It's Already Closed"
@ $EDBE label=Response_ItsAlreadyClosed
D $EDBE Print "It's Already Closed" and return to the caller.
N $EDBE Reply with "#MESSAGE$E185".
  $EDBE,$05 Print "#MESSAGE$E185" and return to the game loop.

c $EDC3 Action: Help
@ $EDC3 label=Action_Help
D $EDC3 Explain how badly hurt the player is, if at all.
  $EDC3,$04 Return if the words after the verb are not valid for this command.
  $EDC7,$07 Jump to #R$EDE2 if object #N$48 (the injury) is not here.
  $EDCE,$07 Jump to #R$EDE2 when object #N$8A (the wood nymph) is here.
  $EDD5,$05 Call #R$C2BE to fetch where the wood nymph is.
  $EDDA,$03 Jump to #R$EDE2 when the injury is not in play.
  $EDDD,$05 Print "#MESSAGE$DC4F" to say help is on the way.
@ $EDE2 label=Action_Help_Next
  $EDE2,$03 The player is not hurt, so say "#MESSAGE$DC35".
@ $EDE5 label=Action_Help_Reply
  $EDE5,$03 Return through the shared reply at #R$ED66.

c $EDE8 Action: Inventory
@ $EDE8 label=Action_Inventory
D $EDE8 List everything the player is carrying.
  $EDE8,$04 Return if the words after the verb are not valid for this command.
  $EDEC,$07 Jump back to #R$EDAF when the number of objects carried is zero.
  $EDF3,$03 Call #R$BDEA to clear the screen.
  $EDF6,$03 Call #R$BE06 to move the cursor to the text line stored at #R$BB40.
  $EDF9,$06 Print "#MESSAGE$BD1F".
  $EDFF,$05 Call #R$C0D2 to list what is being carried.
  $EE04,$01 Return.

c $EE05 Action: Look
@ $EE05 label=Action_Look
D $EE05 Describe the room again, including the long text.
  $EE05,$04 Return if the words after the verb are not valid for this command.
  $EE09,$05 Call #R$C0F9 to describe the current room.
  $EE0E,$01 Return.

c $EE0F Action: North
@ $EE0F label=Action_North
D $EE0F Try to leave to the north.
  $EE0F,$04 Choose the north exit and join the movement routine at #R$EE25.

c $EE13 Action: South
@ $EE13 label=Action_South
D $EE13 Try to leave to the south.
  $EE13,$04 Choose the south exit and join the movement routine at #R$EE25.

c $EE17 Action: East
@ $EE17 label=Action_East
D $EE17 Try to leave to the east.
  $EE17,$04 Choose the east exit and join the movement routine at #R$EE25.

c $EE1B Action: West
@ $EE1B label=Action_West
D $EE1B Try to leave to the west.
  $EE1B,$04 Choose the west exit and join the movement routine at #R$EE25.

c $EE1F Action: Up
@ $EE1F label=Action_Up
D $EE1F Try to leave upwards.
  $EE1F,$04 Choose the up exit and join the movement routine at #R$EE25.

c $EE23 Action: Down
@ $EE23 label=Action_Down
D $EE23 Try to leave downwards.
  $EE23,$02 Choose the down exit and join the movement routine.
@ $EE25 label=Action_TryExit
  $EE25,$04 Call #R$C2FE to reject the command when a direct object was typed. Return
. if the comparison failed.
  $EE29,$05 Call #R$C201 to fetch this room's six exits.
  $EE2E,$05 Jump to #R$EE37 when that way out is closed.
  $EE33,$03 Call #R$ECB6 to enter that room, unless the player is too badly hurt.
  $EE36,$01 Return.
@ $EE37 label=Action_Down_Next
N $EE37 Reply with "#MESSAGE$BD32".
  $EE37,$06 Print "#MESSAGE$BD32" and return to the game loop.

c $EE3D Action: Examine
@ $EE3D label=Action_Examine
D $EE3D Describe the single object the player named.
  $EE3D,$04 Return if the words after the verb are not valid for this command.
  $EE41,$05 Jump back to #R$ED73 unless the carried location matches.
  $EE46,$08 Jump to #R$EE54 unless the player named Mara's body.
N $EE4E Reply with "#MESSAGE$DCB7".
  $EE4E,$06 Print "#MESSAGE$DCB7" and return to the game loop.
@ $EE54 label=Action_Examine_Next
  $EE54,$08 Jump to #R$EE69 unless the player named the witch.
  $EE5C,$07 Jump to #R$EE69 if object #N$0B (the chest) is not here.
N $EE63 Reply with "#MESSAGE$DCF0".
  $EE63,$06 Print "#MESSAGE$DCF0" and return to the game loop.
@ $EE69 label=Action_Examine_WitchClosedChest
  $EE69,$08 Jump to #R$EE7E unless the player named the witch.
  $EE71,$07 Jump to #R$EE7E if object #N$0C (the closed chest) is not here.
N $EE78 Reply with "#MESSAGE$DC7B".
  $EE78,$06 Print "#MESSAGE$DC7B" and return to the game loop.
@ $EE7E label=Action_Examine_NoPoint
  $EE7E,$03 Jump back to #R$ED78 to say there is no point.

c $EE81 Action: Load
@ $EE81 label=Action_Load
D $EE81 Load a saved position from tape.
  $EE81,$04 Return if the words after the verb are not valid for this command.
  $EE85,$03 Call #R$C380 to load a saved game from tape.
  $EE88,$01 Return.

c $EE89 Action: Save
@ $EE89 label=Action_Save
D $EE89 Save the position to tape.
  $EE89,$04 Return if the words after the verb are not valid for this command.
  $EE8D,$03 Call #R$C345 to save the game to tape.
  $EE90,$01 Return.

c $EE91 Action: Quit
@ $EE91 label=Action_Quit
D $EE91 Ask whether to abandon the game and, if so, offer to save it.
  $EE91,$04 Return if the words after the verb are not valid for this command.
  $EE95,$06 Print "#MESSAGE$BC85".
@ $EE9B label=Action_Quit_Loop
  $EE9B,$03 Call #R$BDDA to wait for a keypress.
  $EE9E,$04 Jump to #R$EEA9 if "N" was pressed.
  $EEA2,$04 Jump back to #R$EE9B if "Y" was not pressed.
  $EEA6,$03 Call #R$C345 to save the game to tape.
@ $EEA9 label=Action_Quit_Next
@ $EEA9 nowarn
  $EEA9,$04 Switch #R$EB29 onto the stack.
  $EEAD,$01 Return.

c $EEAE Action: Take
@ $EEAE label=Action_Take
D $EEAE Pick up the single object the player named.
  $EEAE,$04 Return if the words after the verb are not valid for this command.
  $EEB2,$05 Jump back to #R$ED7D unless the carried location matches.
  $EEB7,$03 Jump to #R$EEFC to take the named object.

c $EEBA Handler: Already Carrying
@ $EEBA label=Handler_AlreadyCarrying
D $EEBA Refuse when that object is already being carried.
  $EEBA,$05 Jump to #R$EEDD when the object is not being carried.
  $EEBF,$01 Discard the return address on the stack.

c $EEC0 Handler: Print Carrying
@ $EEC0 label=Handler_PrintCarrying
D $EEC0 Finish the sentence "You're already carrying" with "it" or "them".
  $EEC0,$06 Print "#MESSAGE$BCE0".
  $EEC6,$04 Point at the plural-object list with this object.
  $EECA,$03 #REGbc=#N($0002,$04,$04).
  $EECD,$04 Jump to #R$EED7 if the search found a match.
N $EED1 Reply with "#MESSAGE$BCFB".
  $EED1,$06 Print "#MESSAGE$BCFB" and return to the game loop.
@ $EED7 label=Handler_PrintCarrying_Next
N $EED7 Reply with "#MESSAGE$BCFF".
  $EED7,$06 Print "#MESSAGE$BCFF" and return to the game loop.

c $EEDD Handler: Inventory Full
@ $EEDD label=Handler_InventoryFull
D $EEDD Refuse the object when the player is already holding #N$06 things.
  $EEDD,$07 Return unless a full inventory of #N$06 things matches.
  $EEE4,$01 Discard the return address on the stack.
  $EEE5,$06 Print "#MESSAGE$BD05" and return to the game loop.

b $EEEB List: Plural Objects
@ $EEEB label=List_PluralObjects
D $EEEB Object numbers that take the plural response "them".
B $EEEB,$01 Object #N(#PEEK(#PC)).
L $EEEB,$01,$02

c $EEED Handler: Pick Up Item
@ $EEED label=Handler_PickUpItem
D $EEED Mark the object as carried, count it, and acknowledge.
  $EEED,$05 Call #R$BF55 to mark the object as carried.
  $EEF2,$0A Count one more thing carried, then print "#MESSAGE$BCDB" and
. return to the game loop.

c $EEFC Action: Examine Item
@ $EEFC label=Action_ExamineItem
D $EEFC Describe, and sometimes change, the one thing the player is examining.
  $EEFC,$08 Jump to #R$EF14 unless the player named Mara's body.
  $EF04,$05 Stop if object #N$0A (the sword) is already carried, or if the player is
. holding #N$06 things.
  $EF09,$06 Put object #N$33 (the glowing rock) in room #N$3E (A Rock Wall).
  $EF0F,$05 Jump back to #R$EEED to pick the object up.
@ $EF14 label=Action_ExamineItem_Next
  $EF14,$08 Jump to #R$EF28 unless the player named the witch.
  $EF1C,$06 Call #R$C2EF to skip to the object named by this phrase.
  $EF22,$03 Call #R$EEBA to stop if that object is already carried, or if six things
. are already held.
  $EF25,$03 Jump back to #R$EEED to pick the object up.
@ $EF28 label=Action_ExamineItem_RopeOverhang
  $EF28,$08 Jump to #R$EF38 unless the player named the rope on the overhang.
  $EF30,$05 Stop if object #N$00 (the food) is already carried, or if the player is
. holding #N$06 things.
  $EF35,$03 Jump back to #R$EEED to pick the object up.
@ $EF38 label=Action_ExamineItem_SilverCoin
  $EF38,$08 Jump to #R$EF48 unless the player named the blacksmith.
  $EF40,$05 Stop if object #N$02 (the silver coin) is already carried, or if the
. player is holding #N$06 things.
  $EF45,$03 Jump back to #R$EEED to pick the object up.
@ $EF48 label=Action_ExamineItem_Bow
  $EF48,$08 Jump to #R$EF58 unless the player named the blacksmith.
  $EF50,$05 Stop if object #N$03 (the bow) is already carried, or if the player is
. holding #N$06 things.
  $EF55,$03 Jump back to #R$EEED to pick the object up.
@ $EF58 label=Action_ExamineItem_Arrows
  $EF58,$08 Jump to #R$EF68 unless the player named the dead blacksmith.
  $EF60,$05 Stop if object #N$04 (the arrows) is already carried, or if the player is
. holding #N$06 things.
  $EF65,$03 Jump back to #R$EEED to pick the object up.
@ $EF68 label=Action_ExamineItem_Furnace
  $EF68,$08 Jump to #R$EF7C unless the player named the furnace.
  $EF70,$06 Call #R$C2EF to skip to the object named by this phrase.
  $EF76,$03 Call #R$EEBA to stop if that object is already carried, or if six things
. are already held.
  $EF79,$03 Jump back to #R$EEED to pick the object up.
@ $EF7C label=Action_ExamineItem_Continue
  $EF7C,$02 Carry on with the next object.
@ $EF7E label=Action_ExamineItem_Zarn
  $EF7E,$08 Jump to #R$EFAD unless the player named Zarn.
  $EF86,$05 Stop if object #N$44 (the log) is already carried, or if the player is
. holding #N$06 things.
  $EF8B,$05 Destroy object #N$45 (the log bridge).
  $EF90,$05 Destroy object #N$46 (the log bridge).
  $EF95,$06 Put object #N$11 (the chasm) in room #N$15 (The Western Edge of a Chasm).
  $EF9B,$06 Put object #N$12 (the chasm) in room #N$16 (The Eastern Edge of a Chasm).
  $EFA1,$0C Jump back to #R$EEED to pick the object up.
@ $EFAD label=Action_ExamineItem_PrincessMara
  $EFAD,$08 Jump to #R$EFBD unless the player named Princess Mara.
  $EFB5,$05 Stop if object #N$09 (the horn) is already carried, or if the player is
. holding #N$06 things.
  $EFBA,$03 Jump back to #R$EEED to pick the object up.
@ $EFBD label=Action_ExamineItem_OldMan
  $EFBD,$08 Jump to #R$EFE8 unless the player named the old man.
  $EFC5,$06 Call #R$C2EF to skip to the object named by this phrase.
  $EFCB,$05 Jump to #R$EFD5 when the object is not being carried.
  $EFD0,$05 Jump back to #R$EEC0 to finish the carrying sentence.
@ $EFD5 label=Action_ExamineItem_TakeChest
  $EFD5,$03 Call #R$EEDD to refuse the object when six things are already carried.
  $EFD8,$05 Jump to #R$EFE3 when the value #N$0F matches.
  $EFDD,$06 Replace object #N$0D (the open chest) with object #N$0E (the empty chest).
@ $EFE3 label=Action_ExamineItem_PickUp
  $EFE3,$05 Jump back to #R$EEED to pick the object up.
@ $EFE8 label=Action_ExamineItem_Key
  $EFE8,$08 Jump to #R$EFF8 unless the player named the key.
  $EFF0,$05 Stop if object #N$10 (the key) is already carried, or if the player is
. holding #N$06 things.
  $EFF5,$03 Jump back to #R$EEED to pick the object up.
@ $EFF8 label=Action_ExamineItem_DeadSpider
  $EFF8,$08 Jump to #R$F006 unless the player named the dead spider.
N $F000 Reply with "#MESSAGE$DC63".
  $F000,$06 Print "#MESSAGE$DC63" and return to the game loop.
@ $F006 label=Action_ExamineItem_TakeRingOff
  $F006,$08 Jump to #R$F011 unless the player named taking the ring off.
  $F00E,$03 Jump back to #R$ED7D to ask for a rephrase.
@ $F011 label=Action_ExamineItem_Demons
  $F011,$08 Jump to #R$F037 unless the player named the demons.
  $F019,$07 Jump to #R$F037 when the player is in room #N$48 (Inside the Volcano).
  $F020,$05 Stop if object #N$08 (the rope) is already carried, or if the player is
. holding #N$06 things.
  $F025,$07 Jump to #R$F032 if object #N$23 (the rope on the overhang) is not here.
  $F02C,$06 Replace object #N$23 (the rope on the overhang) with object #N$22 (the
. rock overhang).
@ $F032 label=Action_ExamineItem_TakeRope
  $F032,$05 Jump back to #R$EEED to pick the object up.
@ $F037 label=Action_ExamineItem_YouCant
  $F037,$03 Tell the player the command is impossible.

c $F03A Action: Drop
@ $F03A label=Action_Drop
D $F03A Drop one of the objects the player named.
  $F03A,$04 Return if the words after the verb are not valid for this command.
  $F03E,$04 Jump to #R$F079 if the value #N$03 failed.
  $F042,$03 Jump back to #R$ED7D to ask for a rephrase.

c $F045 Handler: Not Carrying It
@ $F045 label=Handler_NotCarryingIt
D $F045 Put the object in this room, with special cases for the log, the chest and the ring.
  $F045,$05 Jump to #R$F067 when the object is being carried.
  $F04A,$06 Print "#MESSAGE$BD7F".
  $F050,$04 Point at the plural-object list with this object.
  $F054,$03 #REGbc=#N($0002,$04,$04).
  $F057,$04 Jump to #R$F061 if the search found a match.
N $F05B Reply with "#MESSAGE$BCFB".
  $F05B,$06 Print "#MESSAGE$BCFB" and return to the game loop.
@ $F061 label=Handler_NotCarryingIt_Next
N $F061 Reply with "#MESSAGE$BCFF".
  $F061,$06 Print "#MESSAGE$BCFF" and return to the game loop.
@ $F067 label=Handler_NotCarryingIt_DropHere
  $F067,$08 Call #R$BF55 to drop the object in this room.
  $F06F,$0A Count one fewer thing carried, then print "#MESSAGE$BCDB" and
. return to the game loop.
@ $F079 label=Handler_NotCarryingIt_MarasBody
  $F079,$08 Jump to #R$F08B unless the player named Mara's body.
  $F081,$05 Destroy object #N$33 (the glowing rock).
  $F086,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F08B label=Handler_NotCarryingIt_Witch
  $F08B,$08 Jump to #R$F09C unless the player named the witch.
  $F093,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F099,$03 Jump back to #R$F045 to drop it in the ordinary way.
@ $F09C label=Handler_NotCarryingIt_RopeOverhang
  $F09C,$08 Jump to #R$F0A9 unless the player named the rope on the overhang.
  $F0A4,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F0A9 label=Handler_NotCarryingIt_BlacksmithCoin
  $F0A9,$08 Jump to #R$F0B6 unless the player named the blacksmith.
  $F0B1,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F0B6 label=Handler_NotCarryingIt_BlacksmithBow
  $F0B6,$08 Jump to #R$F0C3 unless the player named the blacksmith.
  $F0BE,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F0C3 label=Handler_NotCarryingIt_DeadBlacksmith
  $F0C3,$08 Jump to #R$F0D0 unless the player named the dead blacksmith.
  $F0CB,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F0D0 label=Handler_NotCarryingIt_Furnace
  $F0D0,$08 Jump to #R$F0EA unless the player named the furnace.
  $F0D8,$07 Jump to #R$F0E5 if the player is not carrying object #N$43 (the ring being
. worn).
  $F0DF,$06 Replace object #N$43 (the ring being worn) with object #N$07 (the ring).
@ $F0E5 label=Handler_NotCarryingIt_DropRing
  $F0E5,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F0EA label=Handler_NotCarryingIt_Demons
  $F0EA,$08 Jump to #R$F0F7 unless the player named the demons.
  $F0F2,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F0F7 label=Handler_NotCarryingIt_Zarn
  $F0F7,$08 Jump to #R$F104 unless the player named Zarn.
  $F0FF,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F104 label=Handler_NotCarryingIt_Log
  $F104,$08 Jump to #R$F14F unless the player named Zarn.
  $F10C,$07 Jump to #R$F119 when object #N$44 (the log) is here.
N $F113 Reply with "#MESSAGE$DC8B".
  $F113,$06 Print "#MESSAGE$DC8B" and return to the game loop.
@ $F119 label=Handler_NotCarryingIt_CarryingLog
  $F119,$07 Jump to #R$F124 if the player is not carrying object #N$44 (the log).
  $F120,$04 Count one fewer thing carried.
@ $F124 label=Handler_NotCarryingIt_PlaceBridge
  $F124,$05 Destroy object #N$44 (the log).
  $F129,$06 Put object #N$45 (the log bridge) in room #N$15 (The Western Edge of a
. Chasm).
  $F12F,$06 Put object #N$46 (the log bridge) in room #N$16 (The Eastern Edge of a
. Chasm).
  $F135,$05 Destroy object #N$11 (the chasm).
  $F13A,$05 Destroy object #N$12 (the chasm).
  $F13F,$0A Open the log bridge across the chasm, both ways.
  $F149,$06 Print "#MESSAGE$DCFE" and return to the game loop.
@ $F14F label=Handler_NotCarryingIt_PrincessMara
  $F14F,$08 Jump to #R$F15C unless the player named Princess Mara.
  $F157,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F15C label=Handler_NotCarryingIt_OldMan
  $F15C,$08 Jump to #R$F180 unless the player named the old man.
  $F164,$07 Jump to #R$F17B if the player is not carrying object #N$0D (the open
. chest).
  $F16B,$06 Put object #N$0F (the Crystals of Vulcan) in the player's inventory.
  $F171,$06 Replace object #N$0D (the open chest) with object #N$0E (the empty chest).
  $F177,$04 Count one more thing carried.
@ $F17B label=Handler_NotCarryingIt_DropChest
  $F17B,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F180 label=Handler_NotCarryingIt_Key
  $F180,$08 Jump to #R$F18D unless the player named the key.
  $F188,$05 Jump back to #R$F045 to drop it in the ordinary way.
@ $F18D label=Handler_NotCarryingIt_YouCant
  $F18D,$03 Tell the player the command is impossible.

c $F190 Action: Climb
@ $F190 label=Action_Climb
D $F190 Climb the rope, the volcano or down into the boat.
  $F190,$04 Return if the words after the verb are not valid for this command.
  $F194,$08 Jump to #R$F1B2 unless the player named the rope.
  $F19C,$08 Jump to #R$ED6E unless the player is in room #N$47 (The Top of the
. Volcano).
  $F1A4,$08 Jump to #R$ED6E if object #N$23 (the rope on the overhang) is not here.
  $F1AC,$05 Try to enter room #N$48 (Inside the Volcano).
  $F1B1,$01 Return.
@ $F1B2 label=Action_Climb_Next
  $F1B2,$08 Jump to #R$F1C8 unless the player named the ring.
  $F1BA,$08 Jump to #R$ED6E unless the player is in room #N$48 (Inside the Volcano).
  $F1C2,$05 Try to enter room #N$47 (The Top of the Volcano).
  $F1C7,$01 Return.
@ $F1C8 label=Action_Climb_WearRing
  $F1C8,$08 Jump to #R$F1DA unless the player named the ring.
@ $F1D0 nowarn
  $F1D0,$0A Print "#MESSAGE$DDE6" and end the game.
@ $F1DA label=Action_Climb_IntoBoat
  $F1DA,$08 Jump to #R$F1F5 unless the player named getting into the boat.
  $F1E2,$07 Jump to #R$F1EF when object #N$1D (the boat) is here.
N $F1E9 Reply with "#MESSAGE$DC9A".
  $F1E9,$06 Print "#MESSAGE$DC9A" and return to the game loop.
@ $F1EF label=Action_Climb_EnterBoat
  $F1EF,$05 Try to enter room #N$1D (In the Boat).
  $F1F4,$01 Return.
@ $F1F5 label=Action_Climb_OutOfBoat
  $F1F5,$08 Jump to #R$F213 unless the player named getting out of the boat.
  $F1FD,$07 Jump to #R$F20A when the player is in room #N$1D (In the Boat).
N $F204 Reply with "#MESSAGE$DE33".
  $F204,$06 Print "#MESSAGE$DE33" and return to the game loop.
@ $F20A label=Action_Climb_LeaveBoat
  $F20A,$05 Call #R$C2BE to fetch where the boat is.
  $F20F,$03 Call #R$ECB6 to enter where the boat is, unless the player is too badly hurt.
  $F212,$01 Return.
@ $F213 label=Action_Climb_YouCant
  $F213,$03 Tell the player the command is impossible.

c $F216 Action: Give
@ $F216 label=Action_Give
D $F216 Give the chest or the crystals to the blacksmith.
  $F216,$04 Return if the words after the verb are not valid for this command.
  $F21A,$08 Jump to #R$F26A unless the player named the old man.
  $F222,$07 Jump to #R$F22F when object #N$25 (the blacksmith) is here.
N $F229 Reply with "#MESSAGE$DD38".
  $F229,$06 Print "#MESSAGE$DD38" and return to the game loop.
@ $F22F label=Action_Give_Next
  $F22F,$07 Jump to #R$F23E if object #N$0D (the open chest) is not here.
  $F236,$06 Replace object #N$0D (the open chest) with object #N$0E (the empty chest).
  $F23C,$02 Jump to #R$F249 to hand the crystals over.
@ $F23E label=Action_Give_CheckCrystals
  $F23E,$07 Jump to #R$F249 if the player is not carrying object #N$0F (the Crystals
. of Vulcan).
  $F245,$04 Count one fewer thing carried.
@ $F249 label=Action_Give_HandOver
  $F249,$05 Destroy object #N$0F (the Crystals of Vulcan).
  $F24E,$06 Replace object #N$25 (the blacksmith) with object #N$26 (the blacksmith).
  $F254,$05 Destroy object #N$88 (the old man's quest).
  $F259,$05 Move object #N$0A (the sword) into the current room.
  $F25E,$06 Print "#MESSAGE$DD4D".
N $F264 Reply with "#MESSAGE$DD84".
  $F264,$06 Print "#MESSAGE$DD84" and return to the game loop.
@ $F26A label=Action_Give_YouCant
  $F26A,$03 Tell the player the command is impossible.

c $F26D Action: Eat
@ $F26D label=Action_Eat
D $F26D Eat the food, if it is being carried.
  $F26D,$04 Return if the words after the verb are not valid for this command.
  $F271,$08 Jump to #R$F284 unless the player named the rope on the overhang.
  $F279,$07 Jump to #R$F284 if the player is not carrying object #N$00 (the food).
  $F280,$04 Count one fewer thing carried.
@ $F284 label=Action_Eat_Next
  $F284,$05 Destroy object #N$00 (the food).
N $F289 Reply with "#MESSAGE$DE4B".
  $F289,$06 Print "#MESSAGE$DE4B" and return to the game loop.

c $F28F Response: "You Can't"
@ $F28F label=Response_YouCantJump
D $F28F Tell the player the command is impossible.
  $F28F,$03 Tell the player the command is impossible.

c $F292 Action: Drink
@ $F292 label=Action_Drink
D $F292 Drinking does nothing useful here.
  $F292,$04 Return if the words after the verb are not valid for this command.
  $F296,$08 Jump to #R$F2A4 unless the player named the ruins.
N $F29E Reply with "#MESSAGE$DE71".
  $F29E,$06 Print "#MESSAGE$DE71" and return to the game loop.
@ $F2A4 label=Action_Drink_Next
  $F2A4,$03 Tell the player the command is impossible.

c $F2A7 Action: Kill
@ $F2A7 label=Action_Kill
D $F2A7 Fight the opponent the player named.
  $F2A7,$04 Return if the words after the verb are not valid for this command.
  $F2AB,$03 Jump to #R$F30B to fight the named opponent.

c $F2AE Handler: Check Weapon
@ $F2AE label=Handler_CheckWeapon
D $F2AE Require the bow, and an arrow, before combat continues.
  $F2AE,$07 Jump to #R$F2C0 if the player is not carrying object #N$03 (the bow).
  $F2B5,$06 Return when the player is carrying object #N$04 (the arrows).
  $F2BB,$05 Print "#MESSAGE$DED1" to say the arrows are missing.
@ $F2C0 label=Handler_CheckWeapon_Next
  $F2C0,$03 The bow is missing, so say "#MESSAGE$DF29".
@ $F2C3 label=Handler_CheckWeapon_Reply
  $F2C3,$01 Discard the return address on the stack.
  $F2C4,$03 Jump back to #R$ED66 to print that reply and return to the game loop.

c $F2C7 Handler: Require Sword
@ $F2C7 label=Handler_RequireSword
D $F2C7 Require the sword before combat continues.
  $F2C7,$06 Return when the player is carrying object #N$0A (the sword).
  $F2CD,$03 Print "#MESSAGE$DF72".
  $F2D0,$01 Discard the return address on the stack.
  $F2D1,$03 Jump back to #R$ED66 to return to the game loop.

c $F2D4 Handler: Announce Arrow
@ $F2D4 label=Handler_AnnounceArrow
D $F2D4 Tell the player an arrow has been loosed.
  $F2D4,$06 Print "#MESSAGE$DEE5" and start a new line.

c $F2DA Handler: Resolve Attack
@ $F2DA label=Handler_ResolveAttack
D $F2DA Print the attack, then sometimes announce that it missed.
  $F2DA,$04 The sword swings, with "#MESSAGE$DF5C".
@ $F2DE label=Handler_ResolveAttack_Print
  $F2DE,$03 Print that message and start a new line.
  $F2E1,$01 Restore the miss flag from the stack.
  $F2E2,$02 Return when this attack cannot miss.
  $F2E4,$04 Call #R$BF45 to roll the miss chance, and return when the blow lands.
  $F2E8,$03 The blow missed. Print "#MESSAGE$DEF9".
  $F2EB,$01 Discard the return address on the stack.
  $F2EC,$03 Jump back to #R$ED6A to return to the game loop.

c $F2EF Handler: Apply Combat Result
@ $F2EF label=Handler_ApplyCombatResult
D $F2EF Replace a defeated creature with its body.
  $F2EF,$0D Call #R$C48F to turn the defeated creature into its corpse.
  $F2FC,$01 Return.

c $F2FD Handler: Apply Second Combat Result
@ $F2FD label=Handler_ApplySecondCombatResult
D $F2FD Replace a second defeated creature with its body.
  $F2FD,$0D Call #R$C48F to turn the second defeated creature into its corpse.
  $F30A,$01 Return.

c $F30B Handler: Fight Opponent
@ $F30B label=Handler_FightOpponent
D $F30B Fight whichever opponent the player named.
  $F30B,$08 Jump to #R$F344 unless the player named the elf with the sword.
  $F313,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F319,$05 Jump back to #R$ED82 when the named opponent is already dead.
  $F31E,$06 Call #R$F2C7 to make sure the player is holding the sword.
  $F324,$05 Call #R$F2DA to resolve the attack on the named opponent.
  $F329,$03 Call #R$F2EF to turn the defeated opponent into its corpse.
  $F32C,$07 Jump to #R$F338 unless the value #N$82 matches.
  $F333,$05 Remove object #N$86 (the centaur) from the game.
@ $F338 label=Handler_FightOpponent_Next
  $F338,$06 Print "#MESSAGE$DF44".
N $F33E Reply with "#MESSAGE$DFA3".
  $F33E,$06 Print "#MESSAGE$DFA3" and return to the game loop.
@ $F344 label=Handler_FightOpponent_ElfBow
  $F344,$08 Jump to #R$F37D unless the player named the elf with the bow.
  $F34C,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F352,$05 Jump back to #R$ED82 when the named opponent is already dead.
  $F357,$06 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F35D,$05 Call #R$F2D4 to announce the arrow.
  $F362,$03 Call #R$F2EF to turn the defeated opponent into its corpse.
  $F365,$07 Jump to #R$F371 unless the value #N$82 matches.
  $F36C,$05 Remove object #N$86 (the centaur) from the game.
@ $F371 label=Handler_FightOpponent_PerfectShot
  $F371,$06 Print "#MESSAGE$DF0E".
N $F377 Reply with "#MESSAGE$DFA3".
  $F377,$06 Print "#MESSAGE$DFA3" and return to the game loop.
@ $F37D label=Handler_FightOpponent_WarriorSword
  $F37D,$08 Jump to #R$F3AA unless the player named the dead warrior.
  $F385,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F38B,$05 Jump back to #R$ED8C when the named opponent is already dead.
  $F390,$06 Call #R$F2C7 to make sure the player is holding the sword.
  $F396,$05 Call #R$F2DA to resolve the attack on the named opponent.
  $F39B,$03 Call #R$F2FD to turn the second defeated opponent into its corpse.
  $F39E,$06 Print "#MESSAGE$DF44".
N $F3A4 Reply with "#MESSAGE$DFB4".
  $F3A4,$06 Print "#MESSAGE$DFB4" and return to the game loop.
@ $F3AA label=Handler_FightOpponent_WarriorBow
  $F3AA,$08 Jump to #R$F3D7 unless the player named the dead warrior.
  $F3B2,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F3B8,$05 Jump back to #R$ED8C when the named opponent is already dead.
  $F3BD,$06 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F3C3,$05 Call #R$F2D4 to announce the arrow.
  $F3C8,$03 Call #R$F2FD to turn the second defeated opponent into its corpse.
  $F3CB,$06 Print "#MESSAGE$DF0E".
N $F3D1 Reply with "#MESSAGE$DFB4".
  $F3D1,$06 Print "#MESSAGE$DFB4" and return to the game loop.
@ $F3D7 label=Handler_FightOpponent_MonsterBow
  $F3D7,$08 Jump to #R$F3F8 unless the player named the monster with the bow.
  $F3DF,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F3E2,$05 Call #R$F2D4 to announce the arrow.
  $F3E7,$05 Destroy object #N$1E (the slime monster).
  $F3EC,$06 Print "#MESSAGE$DF0E".
N $F3F2 Reply with "#MESSAGE$E009".
  $F3F2,$06 Print "#MESSAGE$E009" and return to the game loop.
@ $F3F8 label=Handler_FightOpponent_GlowingRock
  $F3F8,$08 Jump to #R$F41B unless the player named the glowing rock.
  $F400,$08 Jump to #R$ED8C if object #N$16 (the dragon) is not here.
  $F408,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F40B,$04 Call #R$F2D4 to announce the arrow.
  $F40F,$06 Replace object #N$16 (the dragon) with object #N$17 (the dead dragon).
N $F415 Reply with "#MESSAGE$DFE0".
  $F415,$06 Print "#MESSAGE$DFE0" and return to the game loop.
@ $F41B label=Handler_FightOpponent_ClosedDoor
  $F41B,$08 Jump to #R$F443 unless the player named a closed door.
  $F423,$08 Jump to #R$ED87 if object #N$8A (the wood nymph) is not here.
  $F42B,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F42E,$04 Call #R$F2D4 to announce the arrow.
  $F432,$06 Replace object #N$8A (the wood nymph) with object #N$1C (the dead wood
. nymph).
  $F438,$05 Destroy object #N$89 (the nymph's glimpse).
N $F43D Reply with "#MESSAGE$DFF4".
  $F43D,$06 Print "#MESSAGE$DFF4" and return to the game loop.
@ $F443 label=Handler_FightOpponent_LogBridgeSword
  $F443,$08 Jump to #R$F463 unless the player named the log bridge.
  $F44B,$03 Call #R$F2C7 to make sure the player is holding the sword.
  $F44E,$05 Call #R$F2DA to resolve the attack on the named opponent.
  $F453,$05 Destroy object #N$29 (the demons).
  $F458,$0B Open the way east, then pause and print "#MESSAGE$E041" and
. return to the game loop.
@ $F463 label=Handler_FightOpponent_LogBridgeBow
  $F463,$08 Jump to #R$F474 unless the player named the log bridge.
  $F46B,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
N $F46E Reply with "#MESSAGE$E06F".
  $F46E,$06 Print "#MESSAGE$E06F" and return to the game loop.
@ $F474 label=Handler_FightOpponent_RingWornSword
  $F474,$08 Jump to #R$F49D unless the player named the ring being worn.
  $F47C,$08 Jump to #R$ED82 when object #N$27 (the dead blacksmith) is here.
  $F484,$03 Call #R$F2C7 to make sure the player is holding the sword.
  $F487,$04 Call #R$F2DA to resolve the attack on the named opponent.

c $F48B Handler: Kill The Warrior
@ $F48B label=Handler_KillTheWarrior
D $F48B Fight the Korl warrior.
  $F48B,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F491,$06 Call #R$C48F to turn the warrior into the dead blacksmith.
N $F497 Reply with "#MESSAGE$E086".
  $F497,$06 Print "#MESSAGE$E086" and return to the game loop.
@ $F49D label=Handler_KillTheWarrior_RingWornBow
  $F49D,$08 Jump to #R$F4B7 unless the player named the ring being worn.
  $F4A5,$08 Jump to #R$ED82 when object #N$27 (the dead blacksmith) is here.
  $F4AD,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F4B0,$04 Call #R$F2D4 to announce the arrow.
  $F4B4,$03 Jump back to #R$F48B to finish off the warrior.
@ $F4B7 label=Handler_KillTheWarrior_Next
  $F4B7,$08 Jump to #R$F4E6 unless the player named the log bridge.
  $F4BF,$08 Jump to #R$ED82 if object #N$2A (Zarn) is not here.
  $F4C7,$03 Call #R$F2C7 to make sure the player is holding the sword.
  $F4CA,$05 Call #R$F2DA to resolve the attack on the named opponent.
  $F4CF,$06 Replace object #N$2A (Zarn) with object #N$2B (Zarn's body).
  $F4D5,$0B Arm Princess Mara's arrival, then pause and print "#MESSAGE$DF44"
. and start a new line.
N $F4E0 Reply with "#MESSAGE$E09B".
  $F4E0,$06 Print "#MESSAGE$E09B" and return to the game loop.
@ $F4E6 label=Handler_KillTheWarrior_LogBridgeBow
  $F4E6,$08 Jump to #R$F4FF unless the player named the log bridge.
  $F4EE,$08 Jump to #R$ED82 if object #N$2A (Zarn) is not here.
  $F4F6,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
N $F4F9 Reply with "#MESSAGE$E06F".
  $F4F9,$06 Print "#MESSAGE$E06F" and return to the game loop.
@ $F4FF label=Handler_KillTheWarrior_PrincessSword
  $F4FF,$08 Jump to #R$F527 unless the player named the princess with the sword.
  $F507,$08 Jump to #R$ED87 if object #N$2C (Princess Mara) is not here.
  $F50F,$03 Call #R$F2C7 to make sure the player is holding the sword.
  $F512,$04 Call #R$F2DA to resolve the attack on the named opponent.

c $F516 Handler: Kill The Witch
@ $F516 label=Handler_KillTheWitch
D $F516 Fight the witch.
  $F516,$06 Replace object #N$2C (Princess Mara) with object #N$2D (Mara's body).
  $F51C,$0B Stop Princess Mara appearing, then pause and print "#MESSAGE$DFF4"
. and return to the game loop.
@ $F527 label=Handler_KillTheWitch_PrincessBow
  $F527,$08 Jump to #R$F541 unless the player named the princess with the bow.
  $F52F,$08 Jump to #R$ED87 if object #N$2C (Princess Mara) is not here.
  $F537,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F53A,$04 Call #R$F2D4 to announce the arrow.
  $F53E,$03 Jump back to #R$F516 to finish off the witch.
@ $F541 label=Handler_KillTheWitch_Next
  $F541,$08 Jump to #R$F56B unless the player named the warrior with the sword.
  $F549,$08 Jump to #R$ED82 if object #N$8C is not here.
  $F551,$03 Call #R$F2C7 to make sure the player is holding the sword.
  $F554,$05 Call #R$F2DA to resolve the attack on the named opponent.
  $F559,$03 The sword lands, with "#MESSAGE$DF44".

c $F55C Handler: Kill The Blacksmith
@ $F55C label=Handler_KillTheBlacksmith
D $F55C Fight the blacksmith.
  $F55C,$03 Call #R$C486 to pause, then print that message and start a new line.
  $F55F,$06 Replace object #N$8C with object #N$34 (the dead warrior).
N $F565 Reply with "#MESSAGE$E086".
  $F565,$06 Print "#MESSAGE$E086" and return to the game loop.
@ $F56B label=Handler_KillTheBlacksmith_WarriorBow
  $F56B,$08 Jump to #R$F589 unless the player named the warrior with the bow.
  $F573,$08 Jump to #R$ED82 if object #N$8C is not here.
  $F57B,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F57E,$05 Call #R$F2D4 to announce the arrow.
  $F583,$06 Print "#MESSAGE$DF0E" and strike the blacksmith.
@ $F589 label=Handler_KillTheBlacksmith_Next
  $F589,$08 Jump to #R$F5B3 unless the player named the spider with the bow.
  $F591,$08 Jump to #R$ED8C if object #N$41 (the giant spider) is not here.
  $F599,$03 Call #R$F2AE to make sure the player is holding the bow and some arrows.
  $F59C,$05 Call #R$F2D4 to announce the arrow.
  $F5A1,$06 Replace object #N$41 (the giant spider) with object #N$42 (the dead
. spider).
  $F5A7,$06 Print "#MESSAGE$DF0E".
N $F5AD Reply with "#MESSAGE$DFE0".
  $F5AD,$06 Print "#MESSAGE$DFE0" and return to the game loop.
@ $F5B3 label=Handler_KillTheBlacksmith_YouCant
  $F5B3,$03 Tell the player the command is impossible.

c $F5B6 Action: Kiss
@ $F5B6 label=Action_Kiss
D $F5B6 Kiss Princess Mara, if she is here and still alive.
  $F5B6,$04 Return if the words after the verb are not valid for this command.
  $F5BA,$02 Jump to #R$F5C8 to kiss Princess Mara.

c $F5BC Response: "It's Too Late"
@ $F5BC label=Response_ItsTooLate
D $F5BC Say that it is too late.
N $F5BC Reply with "#MESSAGE$E14E".
  $F5BC,$06 Print "#MESSAGE$E14E" and return to the game loop.

c $F5C2 Handler: Kiss The Princess
@ $F5C2 label=Handler_KissThePrincess
D $F5C2 Kiss Mara. She is saved only in the Great Hall, and only while the player lives.
N $F5C2 Reply with "#MESSAGE$E113".
  $F5C2,$06 Print "#MESSAGE$E113" and return to the game loop.
@ $F5C8 label=Handler_KissThePrincess_Princess
  $F5C8,$08 Jump to #R$F5DB unless the player named the princess.
  $F5D0,$08 Jump to #R$F5BC if object #N$2C (Princess Mara) is not here.
  $F5D8,$03 Jump back to #R$F5C2 to kiss her.
@ $F5DB label=Handler_KissThePrincess_Next
  $F5DB,$08 Jump to #R$F5EE unless the player named a closed door.
  $F5E3,$08 Jump to #R$F5BC when object #N$1C (the dead wood nymph) is here.
  $F5EB,$03 Jump back to #R$F5C2 to kiss her.
@ $F5EE label=Handler_KissThePrincess_Refuse
  $F5EE,$03 Jump back to #R$ED91 to refuse.

c $F5F1 Action: Open
@ $F5F1 label=Action_Open
D $F5F1 Open the named door, gate or chest.
  $F5F1,$04 Return if the words after the verb are not valid for this command.
  $F5F5,$09 Jump to #R$F665 unless the player named the door.
  $F5FE,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F604,$04 Jump to #R$F60E when the named door is closed.
N $F608 Reply with "#MESSAGE$E172".
  $F608,$06 Print "#MESSAGE$E172" and return to the game loop.
@ $F60E label=Action_Open_Next
  $F60E,$07 Jump to #R$F619 when the player is in room #N$02 (Inside the Farmhouse).
  $F615,$04 Jump to #R$F62D unless the player is in room #N$03 (At a large Farmhouse).
@ $F619 label=Action_Open_Farmhouse
  $F619,$06 Replace object #N$36 (a closed door) with object #N$35 (an open door).
  $F61F,$06 Replace object #N$38 with object #N$37.
  $F625,$08 Jump back to #R$ED96 to confirm.
@ $F62D label=Action_Open_WoodmansHutCheck
  $F62D,$04 Jump to #R$F635 when the player is in room #N$0F (At the Woodman's Hut).
  $F631,$04 Jump to #R$F649 unless the player is in room #N$10 (Inside the Woodman's
. Hut).
@ $F635 label=Action_Open_WoodmansHut
  $F635,$06 Replace object #N$3A with object #N$39.
  $F63B,$06 Replace object #N$3C with object #N$3B.
  $F641,$08 Jump back to #R$ED96 to confirm.
@ $F649 label=Action_Open_WitchsHovelCheck
  $F649,$04 Jump to #R$F651 when the player is in room #N$3C (At the Witch's Hovel).
  $F64D,$04 Jump to #R$F665 unless the player is in room #N$3D (Inside the Witch's
. Hovel).
@ $F651 label=Action_Open_WitchsHovel
  $F651,$06 Replace object #N$3E with object #N$3D.
  $F657,$06 Replace object #N$40 with object #N$3F.
  $F65D,$08 Jump back to #R$ED96 to confirm.

c $F665 Handler: Open The Chest
@ $F665 label=Handler_OpenTheChest
D $F665 Open the chest when the player has already found it.
  $F665,$08 Jump to #R$F689 unless the player named the witch.
  $F66D,$08 Jump to #R$EDB4 when object #N$0B (the chest) is here.
  $F675,$08 Jump to #R$EDB9 if object #N$0C (the closed chest) is not here.
  $F67D,$06 Replace object #N$0C (the closed chest) with object #N$0D (the open
. chest).
N $F683 Reply with "#MESSAGE$D608".
  $F683,$06 Print "#MESSAGE$D608" and return to the game loop.
@ $F689 label=Handler_OpenTheChest_Next
  $F689,$03 Tell the player the command is impossible.

c $F68C Action: Close
@ $F68C label=Action_Close
D $F68C Close the named door, gate or chest.
  $F68C,$04 Return if the words after the verb are not valid for this command.
  $F690,$09 Jump to #R$F6FD unless the player named the door.
  $F699,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F69F,$04 Jump to #R$F6A9 when the named door is open.
N $F6A3 Reply with "#MESSAGE$E185".
  $F6A3,$06 Print "#MESSAGE$E185" and return to the game loop.
@ $F6A9 label=Action_Close_Next
  $F6A9,$07 Jump to #R$F6B4 when the player is in room #N$02 (Inside the Farmhouse).
  $F6B0,$04 Jump to #R$F6C7 unless the player is in room #N$03 (At a large Farmhouse).
@ $F6B4 label=Action_Close_Farmhouse
  $F6B4,$06 Replace object #N$35 (an open door) with object #N$36 (a closed door).
  $F6BA,$06 Replace object #N$37 with object #N$38.
  $F6C0,$07 Jump back to #R$ED96 to confirm.
@ $F6C7 label=Action_Close_WoodmansHutCheck
  $F6C7,$04 Jump to #R$F6CF when the player is in room #N$0F (At the Woodman's Hut).
  $F6CB,$04 Jump to #R$F6E2 unless the player is in room #N$10 (Inside the Woodman's
. Hut).
@ $F6CF label=Action_Close_WoodmansHut
  $F6CF,$06 Replace object #N$39 with object #N$3A.
  $F6D5,$06 Replace object #N$3B with object #N$3C.
  $F6DB,$07 Jump back to #R$ED96 to confirm.
@ $F6E2 label=Action_Close_WitchsHovelCheck
  $F6E2,$04 Jump to #R$F6EA when the player is in room #N$3C (At the Witch's Hovel).
  $F6E6,$04 Jump to #R$F6FD unless the player is in room #N$3D (Inside the Witch's
. Hovel).
@ $F6EA label=Action_Close_WitchsHovel
  $F6EA,$06 Replace object #N$3D with object #N$3E.
  $F6F0,$06 Replace object #N$3F with object #N$40.
  $F6F6,$07 Jump back to #R$ED96 to confirm.

c $F6FD Handler: Close The Chest
@ $F6FD label=Handler_CloseTheChest
D $F6FD Close the chest.
  $F6FD,$08 Jump to #R$F718 unless the player named the witch.
  $F705,$08 Jump to #R$EDBE when object #N$0B (the chest) is here.
  $F70D,$08 Jump to #R$EDBE when object #N$0C (the closed chest) is here.
  $F715,$03 Jump back to #R$ED78 to say there is no point.
@ $F718 label=Handler_CloseTheChest_Next
  $F718,$03 Tell the player the command is impossible.

c $F71B Action: Enter
@ $F71B label=Action_Enter
D $F71B Go into the farmhouse, the hut, the forge, the hovel or the boat.
  $F71B,$04 Return if the words after the verb are not valid for this command.
  $F71F,$08 Jump to #R$F73D unless the player named the giant spider.
  $F727,$08 Jump to #R$ED9B unless the player is in room #N$03 (At a large Farmhouse).
  $F72F,$08 Jump to #R$ED6E if object #N$35 (an open door) is not here.
  $F737,$05 Try to enter room #N$02 (Inside the Farmhouse).
  $F73C,$01 Return.
@ $F73D label=Action_Enter_Next
  $F73D,$08 Jump to #R$F75B unless the player named the hut.
  $F745,$08 Jump to #R$ED9B unless the player is in room #N$0F (At the Woodman's Hut).
  $F74D,$08 Jump to #R$ED6E if object #N$39 is not here.
  $F755,$05 Try to enter room #N$10 (Inside the Woodman's Hut).
  $F75A,$01 Return.
@ $F75B label=Action_Enter_Hovel
  $F75B,$08 Jump to #R$F779 unless the player named the hovel.
  $F763,$08 Jump to #R$ED9B unless the player is in room #N$3C (At the Witch's Hovel).
  $F76B,$08 Jump to #R$ED6E if object #N$3D is not here.
  $F773,$05 Try to enter room #N$3D (Inside the Witch's Hovel).
  $F778,$01 Return.
@ $F779 label=Action_Enter_Log
  $F779,$08 Jump to #R$F78F unless the player named the log.
  $F781,$08 Jump to #R$ED9B unless the player is in room #N$42 (At the Blacksmith's
. Forge).
  $F789,$05 Try to enter room #N$43 (Inside the Forge).
  $F78E,$01 Return.
@ $F78F label=Action_Enter_Boat
  $F78F,$08 Jump to #R$F79A unless the player named the boat.
  $F797,$03 Jump back to #R$EDA0 to ask for a rephrase.
@ $F79A label=Action_Enter_YouCant
  $F79A,$03 Tell the player the command is impossible.

c $F79D Action: Wear
@ $F79D label=Action_Wear
D $F79D Wear the ring.
  $F79D,$04 Return if the words after the verb are not valid for this command.
  $F7A1,$08 Jump to #R$F7BF unless the player named the furnace.
  $F7A9,$07 Jump to #R$F7B6 if the player is not carrying object #N$43 (the ring being
. worn).
N $F7B0 Reply with "#MESSAGE$E1B1".
  $F7B0,$06 Print "#MESSAGE$E1B1" and return to the game loop.
@ $F7B6 label=Action_Wear_Next
  $F7B6,$06 Replace object #N$07 (the ring) with object #N$43 (the ring being worn).
  $F7BC,$03 Jump back to #R$ED96 to confirm.
@ $F7BF label=Action_Wear_YouCant
  $F7BF,$03 Tell the player the command is impossible.

c $F7C2 Action: Touch
@ $F7C2 label=Action_Touch
D $F7C2 Touch the glowing rock and open the way east.
  $F7C2,$04 Return if the words after the verb are not valid for this command.
  $F7C6,$08 Jump to #R$F7E8 unless the player named the glowing rock.
  $F7CE,$08 Jump to #R$EDA5 if object #N$33 (the glowing rock) is not here.
  $F7D6,$07 Jump back to #R$EDA5 when the rock wall already has a way east.
  $F7DD,$0B Open the way east and print "#MESSAGE$E1E7" and return to the
. game loop.
@ $F7E8 label=Action_Touch_Next
  $F7E8,$03 Jump back to #R$EDA5 to say it has no effect.

c $F7EB Action: Swim
@ $F7EB label=Action_Swim
D $F7EB Swimming is fatal.
  $F7EB,$04 Return if the words after the verb are not valid for this command.
  $F7EF,$08 Jump to #R$F801 unless the player named the river.
@ $F7F7 nowarn
  $F7F7,$0A Print "#MESSAGE$E21C" and end the game.
@ $F801 label=Action_Swim_Next
  $F801,$03 Jump back to #R$ED91 to refuse.

c $F804 Action: Jump
@ $F804 label=Action_Jump
D $F804 Jump the chasm, which cannot be done.
  $F804,$04 Return if the words after the verb are not valid for this command.
  $F808,$08 Jump to #R$F81A unless the player named the chasm.
@ $F810 nowarn
  $F810,$0A Print "#MESSAGE$E27A" and end the game.
@ $F81A label=Action_Jump_Next
  $F81A,$03 Jump back to #R$ED78 to say there is no point.

c $F81D Action: Kick
@ $F81D label=Action_Kick
D $F81D Kicking has no effect.
  $F81D,$04 Return if the words after the verb are not valid for this command.
  $F821,$03 Jump back to #R$EDA5 to say it has no effect.

c $F824 Action: Tie
@ $F824 label=Action_Tie
D $F824 Tie the rope to the rock above the volcano.
  $F824,$04 Return if the words after the verb are not valid for this command.
  $F828,$08 Jump to #R$F866 unless the player named the demons.
  $F830,$07 Jump to #R$F83D if object #N$23 (the rope on the overhang) is not here.
N $F837 Reply with "#MESSAGE$E2F0".
  $F837,$06 Print "#MESSAGE$E2F0" and return to the game loop.
@ $F83D label=Action_Tie_Next
  $F83D,$08 Jump to #R$ED78 unless the player is in room #N$47 (The Top of the
. Volcano).
  $F845,$07 Jump to #R$F855 if the player is not carrying object #N$08 (the rope).
  $F84C,$09 Count one fewer thing carried and put the rope down here.
@ $F855 label=Action_Tie_DestroyRope
  $F855,$05 Destroy object #N$08 (the rope).
  $F85A,$06 Replace object #N$22 (the rock overhang) with object #N$23 (the rope on
. the overhang).
N $F860 Reply with "#MESSAGE$E2C2".
  $F860,$06 Print "#MESSAGE$E2C2" and return to the game loop.
@ $F866 label=Action_Tie_YouCant
  $F866,$03 Tell the player the command is impossible.

c $F869 Action: Swearing
@ $F869 label=Action_Swearing
D $F869 Swearing has no effect.
  $F869,$04 Return if the words after the verb are not valid for this command.
  $F86D,$08 Jump to #R$F88D unless the player named the princess.
  $F875,$08 Jump to #R$EDAA if object #N$2C (Princess Mara) is not here.
  $F87D,$0A Take Princess Mara out of play.
N $F887 Reply with "#MESSAGE$E31F".
  $F887,$06 Print "#MESSAGE$E31F" and return to the game loop.
@ $F88D label=Action_Swearing_Next
  $F88D,$08 Jump to #R$F8A8 unless the player named a closed door.
  $F895,$08 Jump to #R$EDAA when object #N$1C (the dead wood nymph) is here.
  $F89D,$05 Destroy object #N$8A (the wood nymph).
N $F8A2 Reply with "#MESSAGE$E31F".
  $F8A2,$06 Print "#MESSAGE$E31F" and return to the game loop.
@ $F8A8 label=Action_Swearing_Refuse
  $F8A8,$03 Jump back to #R$EDAA to object.

c $F8AB Action: Row
@ $F8AB label=Action_Row
D $F8AB Row the boat, if the player is in it and has the oars.
  $F8AB,$04 Return if the words after the verb are not valid for this command.
  $F8AF,$08 Jump to #R$F8E1 unless the player named crossing the river.
  $F8B7,$07 Jump to #R$F8C4 when the player is in room #N$1D (In the Boat).
N $F8BE Reply with "#MESSAGE$DE33".
  $F8BE,$06 Print "#MESSAGE$DE33" and return to the game loop.
@ $F8C4 label=Action_Row_Next
  $F8C4,$05 Call #R$C2BE to fetch where the boat is.
  $F8C9,$04 Jump to #R$F8D5 unless the boat is in room #N$1A (The Western Bank of a
. Broad River).
  $F8CD,$06 Put object #N$1D (the boat) in room #N$1B (The Eastern Bank of a Broad
. River).
  $F8D3,$02 Jump to #R$F8DB to say the boat has crossed.
@ $F8D5 label=Action_Row_WesternBank
  $F8D5,$06 Put object #N$1D (the boat) in room #N$1A (The Western Bank of a Broad
. River).
@ $F8DB label=Action_Row_Across
N $F8DB Reply with "#MESSAGE$E34A".
  $F8DB,$06 Print "#MESSAGE$E34A" and return to the game loop.
@ $F8E1 label=Action_Row_YouCant
  $F8E1,$03 Tell the player the command is impossible.

c $F8E4 Action: Unlock
@ $F8E4 label=Action_Unlock
D $F8E4 Unlock a door with the key.
  $F8E4,$04 Return if the words after the verb are not valid for this command.
  $F8E8,$08 Jump to #R$F913 unless the player named the witch.
  $F8F0,$07 Jump to #R$F8FD when object #N$0B (the chest) is here.
N $F8F7 Reply with "#MESSAGE$E36F".
  $F8F7,$06 Print "#MESSAGE$E36F" and return to the game loop.
@ $F8FD label=Action_Unlock_Next
  $F8FD,$07 Jump to #R$F90A when the player is carrying object #N$10 (the key).
N $F904 Reply with "#MESSAGE$E387".
  $F904,$06 Print "#MESSAGE$E387" and return to the game loop.
@ $F90A label=Action_Unlock_Chest
  $F90A,$06 Replace object #N$0B (the chest) with object #N$0C (the closed chest).
  $F910,$03 Jump back to #R$ED96 to confirm.
@ $F913 label=Action_Unlock_YouCant
  $F913,$03 Tell the player the command is impossible.

c $F916 Action: Blow
@ $F916 label=Action_Blow
D $F916 Blow the horn.
  $F916,$04 Return if the words after the verb are not valid for this command.
  $F91A,$08 Jump to #R$F961 unless the player named Princess Mara.
  $F922,$07 Jump to #R$F92F when the player is carrying object #N$09 (the horn).
N $F929 Reply with "#MESSAGE$E3A2".
  $F929,$06 Print "#MESSAGE$E3A2" and return to the game loop.
@ $F92F label=Action_Blow_Next
  $F92F,$07 Jump to #R$F93B when the player is in room #N$17 (The Brink of a
. Precipice).
  $F936,$05 Jump back to #R$EDA5 unless the value #N$34 matches.
@ $F93B label=Action_Blow_FetchDragon
  $F93B,$05 Call #R$C2BE to fetch where the dragon is.
  $F940,$04 Jump back to #R$EDA5 when the dragon is not in play.
  $F944,$07 Jump to #R$F956 unless the player is in room #N$17 (The Brink of a
. Precipice).
  $F94B,$05 Call #R$C42F to move the player to the bottom of the precipice.
N $F950 Reply with "#MESSAGE$E3BD".
  $F950,$06 Print "#MESSAGE$E3BD" and return to the game loop.
@ $F956 label=Action_Blow_ToPrecipice
  $F956,$05 Call #R$C42F to move the player to the brink of the precipice.
N $F95B Reply with "#MESSAGE$E444".
  $F95B,$06 Print "#MESSAGE$E444" and return to the game loop.
@ $F961 label=Action_Blow_NoEffect
  $F961,$03 Jump back to #R$EDA5 to say it has no effect.

c $F964 Game Start
@ $F964 label=GameStart
D $F964 Turn caps lock on, clear the flags, copy in a fresh game and enter the Great Valley.
  $F964,$05 Turn CAPS LOCK on, using bit 3 of *#SKOOLKID$5C6A(FLAGS2).
N $F969 Seal the passages that the player has to open.
  $F969,$0D Seal the farmhouse, the woodman's hut and both sides of the chasm.
  $F976,$09 Seal the witch's hovel, the rock wall and the cavern.
N $F97F Install a fresh game.
  $F97F,$0B Copy #N$013C bytes from #R$F992 over the game state at #R$B9C8.
  $F98A,$02 Enter room #N($05), the Great Valley.
  $F98C,$03 Call #R$ECB6 to enter the Great Valley.
  $F98F,$03 Jump to #R$EB10 to take the first turn.

b $F992 Default Game State
@ $F992 label=DefaultGameState
D $F992 Copied to #R$B9C8 by the routine at #R$F964.
B $F992,$01
L $F992,$01,$13C

u $FACE Unused
D $FACE Padding.

c $FACF Handler: Room Image: The Great Valley
@ $FACF label=Handler_RoomImageTheGreatValley
D $FACF Draw The Great Valley.
  $FACF,$04 Start at The Great Valley (#R$61A8).
  $FAD3,$02 Jump to #R$FB09 to draw it.

c $FAD5 Handler: Room Image: The Woodman's Hut
@ $FAD5 label=Handler_RoomImageTheWoodmansHut
D $FAD5 Draw The Woodman's Hut.
  $FAD5,$04 Start at The Woodman's Hut (#R$69EB).
  $FAD9,$02 Jump to #R$FB09 to draw it.

c $FADB Handler: Room Image: The Old Well
@ $FADB label=Handler_RoomImageTheOldWell
D $FADB Draw The Old Well.
  $FADB,$04 Start at The Old Well (#R$7482).
  $FADF,$02 Jump to #R$FB09 to draw it.

c $FAE1 Handler: Room Image: The Volcano
@ $FAE1 label=Handler_RoomImageTheVolcano
D $FAE1 Draw The Volcano.
  $FAE1,$04 Start at The Volcano (#R$7B71).
  $FAE5,$02 Jump to #R$FB09 to draw it.

c $FAE7 Handler: Room Image: The Witch's Hovel
@ $FAE7 label=Handler_RoomImageTheWitchsHovel
D $FAE7 Draw The Witch's Hovel.
  $FAE7,$04 Start at The Witch's Hovel (#R$835E).
  $FAEB,$02 Jump to #R$FB09 to draw it.

c $FAED Handler: Room Image: The Burned Out Farm
@ $FAED label=Handler_RoomImageTheBurnedOutFarm
D $FAED Draw The Burned Out Farm.
  $FAED,$04 Start at The Burned Out Farm (#R$8BDA).
  $FAF1,$02 Jump to #R$FB09 to draw it.

c $FAF3 Handler: Room Image: The Enchanted Wood
@ $FAF3 label=Handler_RoomImageTheEnchantedWood
D $FAF3 Draw The Enchanted Wood.
  $FAF3,$04 Start at The Enchanted Wood (#R$93DB).
  $FAF7,$02 Jump to #R$FB09 to draw it.

c $FAF9 Handler: Room Image: The Dungeon
@ $FAF9 label=Handler_RoomImageTheDungeon
D $FAF9 Draw The Dungeon.
  $FAF9,$04 Start at The Dungeon (#R$9E7F).
  $FAFD,$02 Jump to #R$FB09 to draw it.

c $FAFF Handler: Room Image: Marl's Gateway
@ $FAFF label=Handler_RoomImageMarlsGateway
D $FAFF Draw Marl's Gateway.
  $FAFF,$04 Start at Marl's Gateway (#R$A6C9).
  $FB03,$02 Jump to #R$FB09 to draw it.

c $FB05 Handler: Room Image: The Cavern of Silence
@ $FB05 label=Handler_RoomImageTheCavernOfSilence
D $FB05 Draw The Cavern of Silence.
  $FB05,$04 Start at The Cavern of Silence (#R$AE7A).
N $FB09 Draw that picture.
@ $FB09 label=Handler_RoomImageTheCavernOfSilence_Next
  $FB09,$03 Call #R$BEB8.
  $FB0C,$01 Return.

g $FB0D Jump Table: Verbs
@ $FB0D label=JumpTable_Verbs
D $FB0D Verb routines in the same order as #R$E7AE. Used by #R$C463.
W $FB0D,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB0D,$02,$22

g $FB51 Jump Table: Turn-Based Events
@ $FB51 label=JumpTable_TurnBasedEvents
D $FB51 The first five timed events. The remaining three entries are the
. first three scenic handlers at #R$FB5B, which the routine at #R$BECE
. also reads.
W $FB51,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB51,$02,$05

g $FB5B Jump Table: Scenic Events
@ $FB5B label=JumpTable_ScenicEvents
D $FB5B Handlers run when the current room matches an entry in the room
. list at #R$BA48. Used by #R$C3FA.
W $FB5B,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB5B,$02,$0D

g $FB75 Jump Table: Room Images
@ $FB75 label=JumpTable_RoomImages
D $FB75 Handlers that draw the ten location pictures. Three entries share
. The Enchanted Wood.
W $FB75,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB75,$02,$0C

u $FB8D Unused
D $FB8D RAM above the loaded game. A fragment of the character set remains
. from the loader; the game does not read it.
