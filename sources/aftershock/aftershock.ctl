; Copyright Interceptor Software UK 1986, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
> $4000 @expand=#DEF(#POKE #LINK:Pokes)
> $4000 @expand=#DEF(#FACT #LINK:Facts)
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h After Shock Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

g $61A8

c $9DCC Game Entry Point Alias
  $9DCC,$02 Jump to #R$9DD7.

g $9DCE Table: Delimiters
@ $9DCE label=Table_Delimiters_Count
D $9DCE A table of delimiter characters used for matching user input in...
B $9DCE,$01 Number of delimiters in the table: #PEEK(#PC).
@ $9DCF label=Table_Delimiters
T $9DCF,$01 "SPACE".
T $9DD0,$01 "COMMA".
T $9DD1,$01 "DOUBLE QUOTE".

g $9DD2 Table: Vocabulary For "THE"
@ $9DD2 label=Table_Vocabulary_The
D $9DD2 "Vocabulary Table" used for matching and removing "THE" from user
. input.
T $9DD2,$04 "#STR$9DD2,$08($b==$FF)".
B $9DD6,$01 Terminator.

c $9DD7 Game Entry Point
@ $9DD7 label=GameEntryPoint
E $9DD7 View the equivalent code in;
. #LIST
. { #JEWELS$BA50 }
. { #WARLORD$A531 }
. LIST#
  $9DD7,$05 #HTML(Set CAPS LOCK on, using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6A.html">FLAGS2</a>).
  $9DDC,$05 #HTML(Set keyboard mode "L", using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
  $9DE1,$04 #HTML(Write #N$00 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C41.html">MODE</a>.)
  $9DE5,$05 #HTML(Set current output channel to <em>normal</em> screen output using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/1601.html">CHAN_OPEN</a> with stream #N$02.)
  $9DEA,$05 #HTML(Reset printing to the lower screen, using bit 0 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3C.html">TV_FLAG</a>.)
  $9DEF,$04 #HTML(Write #N$00 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6B.html">DF_SZ</a>.)
  $9DF3,$05 #HTML(Write #N$FF to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8C.html">SCR_CT</a>.)
  $9DF8,$03 Jump to #R$ADA1.

c $9DFB Get User Input
@ $9DFB label=GetUserInput
E $9DFB View the equivalent code in;
. #LIST
. { #JEWELS$BA5D }
. { #WARLORD$A53E }
. LIST#
R $9DFB O:A The keypress value
  $9DFB,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
  $9DFE,$04 Jump back to #R$9DFB until a new key is pressed.
  $9E02,$02 Reset the "new key has been pressed" flag in #REGa.
  $9E04,$03 #HTML(Write it back to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
N $9E07 Fetch the keypress.
  $9E07,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C08.html">LAST_K</a>.)
  $9E0A,$01 Return.

c $9E0B Clear Lines
@ $9E0B label=ClearLines
E $9E0B View the equivalent code in;
. #LIST
. { #JEWELS$BA74 }
. { #WARLORD$A555 }
. LIST#
  $9E0B,$04 Stash #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $9E0F,$05 #HTML(Clear #N$18 lines from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $9E14,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $9E18,$01 Return.

c $9E19 Set Default Screen Position
@ $9E19 label=SetDefaultScreenPosition
E $9E19 View the equivalent code in;
. #LIST
. { #JEWELS$BA7F }
. { #WARLORD$A560 }
. LIST#
  $9E19,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $9E1C,$03 #REGbc=#N($0021,$04,$04).
  $9E1F,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $9E22,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $9E25,$01 Return.

c $9E26 Print Character
@ $9E26 label=PrintCharacter
E $9E26 View the equivalent code in;
. #LIST
. { #JEWELS$BAC3 }
. { #WARLORD$A5A4 }
. LIST#
R $A5A4 A The character to print
  $9E26,$01 Stash the character to print on the stack.
  $9E27,$05 #HTML(Write #N$FF to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8C.html">SCR_CT</a>.)
  $9E2C,$01 Restore the character to print from the stack.
  $9E2D,$01 #HTML(Print to the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">PRINT_A_1</a>.)
  $9E2E,$01 Return.

c $9E2F Pause Loop
@ $9E2F label=Pause_Loop
D $9E2F Pauses a given number of HALT loops.
E $9E2F View the equivalent code in;
. #LIST
. { #JEWELS$BB51 }
. { #WARLORD$A5C2 }
. LIST#
R $9E2F B Number of HALT commands to use
  $9E2F,$01 Halt operation (suspend CPU until the next interrupt).
  $9E30,$02 Decrease counter by one and loop back to #R$9E2F until counter is zero.
  $9E32,$01 Return.

t $9E33 Messaging: "Press REC & PLAY On Tape... Then Press Any Key"
@ $9E33 label=Messaging_Saving
  $9E33,$2F "#STR$9E33,$08($b==$FF)".
B $9E62,$01 Terminator.

t $9E63 Messaging: "Saving Complete...Stop Tape"
@ $9E63 label=Messaging_StopTapeSavingComplete
  $9E63,$1C "#STR$9E63,$08($b==$FF)".
B $9E7F,$01 Terminator.

c $9E80 Save Game
@ $9E80 label=SaveGame
  $9E80,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
  $9E85,$03 #REGa=*#R$BBD1.
  $9E88,$01 Set the bits from #REGa.
  $9E89,$02 Jump to #R$9EA4 if ?? is equal to #REGa.
  $9E8B,$01 #REGb=#REGa.
  $9E8C,$04 #REGix=#R$BAF9.
  $9E90,$03 #REGde=#R$A0D4.
  $9E93,$02 Jump to #R$9E9A.

  $9E95,$04 Increment #REGix by two.
  $9E99,$01 Increment #REGde by one.
  $9E9A,$03 #REGl=*#REGix+#N$00.
  $9E9D,$03 #REGh=*#REGix+#N$01.
  $9EA0,$01 #REGa=*#REGhl.
  $9EA1,$01 Write #REGa to *#REGde.
  $9EA2,$02 Decrease counter by one and loop back to #R$9E95 until counter is zero.
N $9EA4 Print "#STR$9E33,$08($b==$FF)".
  $9EA4,$03 #REGhl=#R$9E33.
  $9EA7,$03 Call #R$A275.
  $9EAA,$03 Call #R$9DFB.
  $9EAD,$04 #REGix=#R$9F88.
  $9EB1,$03 #REGde=#N$0181.
  $9EB4,$02 #REGa=#N$FF.
  $9EB6,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
  $9EB9,$03 #REGhl=#R$9E63.
  $9EBC,$03 Call #R$A275.
  $9EBF,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $9EC4,$01 Return.

t $9EC5 Messaging: "LOADING...Start Tape"
@ $9EC5 label=Messaging_LoadingPressPlay
  $9EC5,$15 "#STR$9EC5,$08($b==$FF)".
B $9EDA,$01 Terminator.

c $9EDB Load From Tape
@ $9EDB label=LoadTape
  $9EDB,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
N $9EE0 Print "#STR$9EC5,$08($b==$FF)".
  $9EE0,$03 #REGhl=#R$9EC5.
  $9EE3,$03 Call #R$A275.
  $9EE6,$04 Load the starting address into #REGix at #R$9F88.
  $9EEA,$03 Set the block length in #REGde to #N$0181 bytes.
  $9EED,$02 Set #REGa to #N$FF which indicates this is a data block.
  $9EEF,$01 Set the carry flag to indicate this is loading.
  $9EF0,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0556.html">LD_BYTES</a>.)
  $9EF3,$02 Jump to #R$9EFD if the carry flag is not set.
N $9EF5 Print "#DECODESTR$CD8F".
  $9EF5,$03 #REGhl=#R(#OFFSET($0013)).

@ $9F21 label=LoadTape_Return
  $9F21,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $9F26,$01 Return.

c $9F27 Just Return
@ $9F27 label=JustReturn
  $9F27,$01 Return.

c $9F28 Print Room Image
@ $9F28 label=Print_RoomImage
R $9F28 IX Pointer to room image data
  $9F28,$03 #REGhl=#REGix (using the stack).

c $9F67 Handler: Room Images
@ $9F67 label=Handler_Images
  $9F67,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
  $9F6C,$01 #REGe=#REGa.
  $9F6D,$04 #REGix=*#R$BBD5.
  $9F71,$03 Call #R$A305.
  $9F74,$05 #REGhl+=*#R$BBD5.
  $9F79,$03 #REGix=#REGhl (using the stack).
  $9F7C,$03 Call #R$9F28.
  $9F7F,$03 Call #R$9DFB.
  $9F82,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $9F87,$01 Return.

g $9F88 Table: Item Locations
@ $9F88 label=Table_ItemLocations
D $9F88 A table where the index is the item ID, and the value is the room it
. resides in (#N$00 for "currently inactive").
D $9F88 When the item is in the players inventory, the room ID changes to
. #N$01.
E $9F88 View the equivalent code in #JEWELS$BBF0.
B $9F88,$01 Item #N(#PC-$9F88) #ITEM(#PC-$9F88) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $9F88,$01,$88

g $A0D2
B $A0D2,$01

g $A0D3
B $A0D3,$01

g $A0D4

g $A106 Current Room ID
@ $A106 label=CurrentRoom
D $A106 The room the player starts the game in is room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
B $A106,$01 Current room ID.

g $A107 Score
@ $A107 label=Score
W $A107,$02

g $A109 Command Buffer
@ $A109 label=CommandBuffer
B $A109,$32

g $A13B User Input: Word Tokens
@ $A13B label=UserInput_Token_1
@ $A13C label=UserInput_Token_2
B $A13B,$01
L $A13B,$01,$0A

g $A145
B $A145,$01
L $A145,$01,$04

g $A149 Table: Directions
@ $A149 label=Table_Directions
D $A149 Pointer to the table containing direction messaging.
W $A149,$02 #R(#OFFSET($0008)) "#DECODESTR$CD48".
W $A14B,$02 #R(#OFFSET($0009)) "#DECODESTR$CD4C".
W $A14D,$02 #R(#OFFSET($000A)) "#DECODESTR$CD50".
W $A14F,$02 #R(#OFFSET($000B)) "#DECODESTR$CD53".
W $A151,$02 #R(#OFFSET($000C)) "#DECODESTR$CD56".
W $A153,$02 #R(#OFFSET($000D)) "#DECODESTR$CD59".

c $A155

c $A16D

c $A1B4

c $A1C8
  $A1C8,$01 Stash #REGhl on the stack.
  $A1C9,$03 #REGhl=#R$A088.
  $A1CC,$03 Call #R$A1B4.
  $A1CF,$01 Merge the bits from *#REGhl.
  $A1D0,$01 Restore #REGhl from the stack.
  $A1D1,$01 Return.

c $A1D2
  $A1D2,$01 Stash #REGhl on the stack.
  $A1D3,$03 #REGhl=#R$A088.
  $A1D6,$03 Call #R$A1B4.
  $A1D9,$01 Set the bits from *#REGhl.
  $A1DA,$01 Write #REGa to *#REGhl.
  $A1DB,$01 Restore #REGhl from the stack.
  $A1DC,$01 Return.

c $A1DD
  $A1DD,$01 Stash #REGhl on the stack.
  $A1DE,$03 #REGhl=#R$A088.
  $A1E1,$03 Call #R$A1B4.
  $A1E4,$01 Invert the bits in #REGa.
  $A1E5,$01 Merge the bits from *#REGhl.
  $A1E6,$01 Write #REGa to *#REGhl.
  $A1E7,$01 Restore #REGhl from the stack.
  $A1E8,$01 Return.

t $A1E9 Messaging: "> "
@ $A1E9 label=Messaging_Prompt
  $A1E9,$03 "#STR$A1E9,$08($b==$FF)".
  $A1EC,$01 Terminator.

c $A1ED Print Input Prompt
@ $A1ED label=PrintPrompt
  $A1ED,$03 #REGhl=#R$A1E9.
  $A1F0,$03 Call #R$A267.
  $A1F3,$01 Return.

c $A1F4 Print Compressed String
@ $A1F4 label=PrintCompressedString
D $A1F4 Prints a compressed text string using a dictionary lookup.
R $A1F4 HL Messaging string ID
  $A1F4,$06 Stash #REGix, #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $A1FA,$01 Double the messaging string ID held in #REGhl.
  $A1FB,$07 Add the result to #R$CA2B.
  $A202,$06 Fetch the address from the string pointer table and store it in
. #REGhl.
  $A208,$04 #REGhl+=#R$C8E9.
  $A20C,$02 Jump to #R$A223.
  $A20E,$04 Jump to #R$A217 if #REGa is less than #N$60.
  $A212,$03 Call #R$A22F.
  $A215,$02 Jump to #R$A222.
  $A217,$02 #REGa+=#N$20.
  $A219,$04 Jump to #R$A21F if #REGa is not equal to #N$7E.
  $A21D,$02 #REGa=#N$0D.
  $A21F,$03 Call #R$9E26.
  $A222,$01 Increment #REGhl by one.
  $A223,$01 #REGa=*#REGhl.
  $A224,$04 Jump to #R$A20E if #REGa is not equal to #N$5F.
  $A228,$06 Restore #REGaf, #REGbc, #REGde, #REGhl and #REGix from the stack.
  $A22E,$01 Return.

  $A22F,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $A232,$02 #REGa-=#N$60.
  $A234,$03 Create an offset in #REGhl using #REGa.
  $A237,$01 Double the offset held in #REGhl.
  $A238,$04 #REGhl+=#R$C8EB.
  $A23C,$02 #REGb=#N$02.

  $A23E,$02 Jump to #R$A241.
  $A240,$01 Increment #REGhl by one.
  $A241,$01 #REGa=*#REGhl.
  $A242,$04 Jump to #R$A24B if #REGa is less than #N$60.
  $A246,$03 Call #R$A22F.
  $A249,$02 Jump to #R$A256.
  $A24B,$02 #REGa+=#N$20.
  $A24D,$04 Jump to #R$A253 if #REGa is not equal to #N$7E.
  $A251,$02 #REGa=#N$0D.
  $A253,$03 Call #R$9E26.
  $A256,$02 Decrease counter by one and loop back to #R$A240 until counter is zero.
  $A258,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $A25B,$01 Return.

c $A25C Print Compressed String And A Newline
@ $A25C label=PrintCompressedStringAndNewline
D $A25C Shortcut print routine which prints a newline after it's done.
E $A25C View the equivalent code in;
. #LIST
. { #JEWELS$BAB1 }
. { #WARLORD$A592 }
. LIST#
  $A25C,$01 Stash the character to print on the stack.
  $A25D,$03 Call #R$A1F4.
N $A260 Force a newline to be "printed".
  $A260,$02 Load a "newline" character into #REGa (#N$0D).
  $A262,$03 Call #R$9E26.
  $A265,$01 Restore the character to print from the stack.
  $A266,$01 Return.

c $A267 Print String
@ $A267 label=PrintString
D $A267 Standard printing loop, which prints the fetched character byte and
. loops until the termination byte is reached (#N$FF).
E $A267 View the equivalent code in;
. #LIST
. { #JEWELS$BAA4 }
. { #WARLORD$A585 }
. LIST#
R $A267 HL Pointer to string to be printed
  $A267,$01 Push the character to print on the stack.
  $A268,$02 Jump to #R$A26E.
N $A26A Just keep looping and printing the fetched character until the
. termination byte is reached (#N$FF).
@ $A26A label=PrintString_Loop
  $A26A,$03 Call #R$9E26.
  $A26D,$01 Move the string pointer to the next character.
@ $A26E label=FetchByteToPrint
  $A26E,$01 Load a character from the string pointer into #REGa.
  $A26F,$04 Jump back to #R$A26A until the string termination character (#N$FF)
. has been reached.
  $A273,$01 Restore the character to print from the stack.
  $A274,$01 Return.

c $A275 Print String And A Newline
@ $A275 label=PrintStringAndNewline
D $A275 Shortcut print routine which prints a newline after it's done.
E $A275 View the equivalent code in;
. #LIST
. { #JEWELS$BAB1 }
. { #WARLORD$A592 }
. LIST#
  $A275,$03 Call #R$A267.
  $A278,$01 Stash the character to print on the stack.
N $A279 Force a newline to be "printed".
  $A279,$02 Load a "newline" character into #REGa (#N$0D).
  $A27B,$03 Call #R$9E26.
  $A27E,$01 Restore the character to print from the stack.
  $A27F,$01 Return.

c $A280

c $A305 Get Table Entry
@ $A305 label=GetTableEntry
D $A305 Retrieves an address from a table using a given index.
E $A305 View the equivalent code in;
. #LIST
. { #JEWELS$C1F0 }
. { #WARLORD$AB88 }
. LIST#
R $A305 E Index of item
R $A305 IX Base table address
R $A305 O:HL Address from the relevant table entry
R $A305 O:IX Address of the table entry
  $A305,$06 Multiply the given index by #N$02 and store the result in #REGde.
  $A30B,$02 Add #REGde to the base table address.
  $A30D,$06 Fetch the relevant table address and store it in #REGhl.
  $A313,$01 Return.

c $A314 Print Objects
@ $A314 label=PrintObjects
E $A314 View the equivalent code in;
. #LIST
. { #JEWELS$C1FF }
. { #WARLORD$AB97 }
. LIST#
R $A314 A #N$01 for inventory items, or room number for room objects
  $A314,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $A317,$03 #REGhl=#R$9F88.
  $A31A,$04 #REGbc=*#R$BBC7.
@ $A31E label=FindObject_Loop
  $A31E,$02 Search for matching objects.
  $A320,$02 Jump to #R$A336 if no objects were found.
  $A322,$01 Stash the current place in #R$A66C on the stack.
  $A323,$03 Call #R$A6B1.
  $A326,$02 Jump to #R$A32F if the object is invalid.
  $A328,$02 Temporarily stash the object type and object counter on the stack.
  $A32A,$03 Call #R$A25C.
  $A32D,$02 Restore the object counter and object type from the stack.
@ $A32F label=FindObject_Next
  $A32F,$01 Temporarily hold the object type in #REGe.
  $A330,$01 Restore the current place in #R$9F88 from the stack.
  $A331,$02 Test if all objects have been checked...
  $A333,$01 Restore the object type to #REGa.
  $A334,$02 Jump to #R$A31E until all objects in the table have been checked.
@ $A336 label=PrintObjects_Return
  $A336,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $A339,$01 Return.

c $A33A Handler: Display Room Exits
@ $A33A label=Handler_RoomExits
D $A33A Handles displaying the exits available for the current room.
E $A33A View the equivalent code in;
. #LIST
. { #JEWELS$C26A }
. { #WARLORD$AC02 }
. LIST#
  $A33A,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
  $A33F,$06 Jump to #R$A379 if *#R$BBCD is set to zero.
N $A345 The version of the game being played DOES have graphics, so continue.
  $A345,$03 Fetch *#R$A106 and load it into #REGa.
  $A348,$03 Fetch the address of the table from #R$BB93.
  $A34B,$04 Fetch the count of the number of rooms in the table from *#R$BBCD.
  $A34F,$02 Search to see if the current room ID is in the table.
  $A351,$02 Jump to #R$A379 if the current room ID does not appear in the
. table.
N $A353 The current room does have an image associated with it.
  $A353,$06 Calculate the index of the current room in the table.
  $A359,$01 #REGa=#N$00.
  $A35A,$01 Set the bits from #REGe.
  $A35B,$02 Jump to #R$A36B if #REGc is not equal to #REGe.
  $A35D,$03 #REGhl=#R$A0A8.
  $A360,$01 #REGa=#REGb.
  $A361,$03 Call #R$A1B4.
  $A364,$01 #REGc=#REGa.
  $A365,$01 Merge the bits from *#REGhl.
  $A366,$02 Jump to #R$A379 if #REGc is not equal to *#REGhl.
  $A368,$01 #REGa=*#REGhl.
  $A369,$01 Set the bits from #REGc.
  $A36A,$01 Write #REGa to *#REGhl.
  $A36B,$03 Call #R$9E0B.
  $A36E,$03 #REGhl=#R$BBA6.
  $A371,$01 #REGe=#REGb.
  $A372,$02 #REGd=#N$00.
  $A374,$01 #REGhl+=#REGde.
  $A375,$01 #REGa=*#REGhl.
  $A376,$03 Call #R$9F67.
  $A379,$03 Call #R$9E0B.
  $A37C,$03 Call #R$9E19.
  $A37F,$03 Call #R$A42F.
  $A382,$03 Call #R$A41C.
  $A385,$02 Store this in #REGde for later.
N $A387 Count the number of exits in the room data.
  $A387,$02 Set an "exits" counter in #REGb of #N$06.
  $A389,$02 Initialise #REGc to #N$00 to count the number of valid exits.
  $A38B,$01 Set #REGa to #N$00 which is used just for the comparison.
@ $A38C label=RoomExitsCount_Loop
  $A38C,$01 Does this room have an exit?
  $A38D,$02 Jump to #R$A390 if this room doesn't have an exit for this position.
  $A38F,$01 Increment the valid exits count by one.
@ $A390 label=RoomExitsCount_Skip
  $A390,$01 Move to the next byte of room data.
  $A391,$02 Decrease the exits counter by one and loop back to #R$A38C until
. all the exits have been checked.
N $A393 Process the exits count result.
  $A393,$03 Jump to #R$A402 if no exits were found
  $A396,$05 Jump to #R$A3BD if more than #N$01 exit was found.
N $A39B Only one exit was found:
N $A39B Print "#DECODESTR$CD3E".
  $A39B,$03 #REGhl=#R(#OFFSET($0007)).
  $A39E,$03 Call #R$A1F4.
  $A3A1,$02 Retrieve the room data pointer and load it into #REGhl.
  $A3A3,$04 Set a pointer in #REGix to #R$A149.
  $A3A7,$01 Set #REGa to #N$00 which is used just for the comparison.
  $A3A8,$02 Jump to #R$A3AF.
N $A3AA Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $A3AA label=RoomCheckForExit_Loop
  $A3AA,$01 Move to the next byte of room data.
  $A3AB,$04 Increment the direction name table pointer by two.
@ $A3AF label=RoomCheckForExit
  $A3AF,$03 Jump to #R$A3AA if the current exit isn't a valid exit.
  $A3B2,$06 Get the direction name from the direction name table.
  $A3B8,$03 Call #R$A1F4 to print the direction name.
  $A3BB,$02 Jump to #R$A3F8.
N $A3BD More than one exit was found:
N $A3BD Print "#DECODESTR$CD33".
@ $A3BD label=RoomMultipleExits
  $A3BD,$03 #REGhl=#R(#OFFSET($0006)).
  $A3C0,$03 Call #R$A25C.
  $A3C3,$02 Retrieve the room data pointer and load it into #REGhl.
  $A3C5,$04 Set a pointer in #REGix to #R$A149.
  $A3C9,$01 Set #REGa to #N$00 which is used just for the comparison.
  $A3CA,$02 Jump to #R$A3D2.
N $A3CC So as not to corrupt the pointer to the room data (as #REGhl is also
. used when printing), it's temporarily held in #REGde.
@ $A3CC label=RoomExits_Initialise
  $A3CC,$01 Switch back the #REGde and #REGhl registers.
@ $A3CD label=RoomCheckForExits_Loop
  $A3CD,$01 Move to the next byte of room data.
  $A3CE,$04 Increment the direction name table pointer by two.
@ $A3D2 label=RoomCheckForExits
  $A3D2,$03 Jump to #R$A3CD if the current exit isn't a valid exit.
  $A3D5,$01 Temporarily store the room data pointer in #REGde.
  $A3D6,$06 Get the direction name from the direction name table.
  $A3DC,$03 Call #R$A1F4 to print the direction name.
  $A3DF,$01 Decrease the valid exits count by one.
  $A3E0,$05 Jump to #R$A3F8 if there are no more exits to process.
  $A3E5,$02 Jump to #R$A3EF if there is only one exit left to process.
N $A3E7 Print a comma character: ",".
  $A3E7,$02 #REGa=#N$2C.
  $A3E9,$03 Call #R$9E26.
  $A3EC,$01 Reset #REGa back to #N$00 for the comparison.
  $A3ED,$02 Jump to #R$A3CC to continue processing.
N $A3EF Print "#DECODESTR$CD2F".
@ $A3EF label=RoomExits_PrintAmpersand
  $A3EF,$03 #REGhl=#R(#OFFSET($0005)).
  $A3F2,$03 Call #R$A1F4.
  $A3F5,$01 #REGa=#N$00.
  $A3F6,$02 Jump to #R$A3CC.
N $A3F8 Print ".".
@ $A3F8 label=RoomExits_PrintFullStop
  $A3F8,$02 #REGa=#N$2E.
  $A3FA,$03 Call #R$9E26.
N $A3FD Print a newline.
  $A3FD,$02 #REGa=#N$0D.
  $A3FF,$03 Call #R$9E26.
N $A402 Are there any objects here?
@ $A402 label=RoomExits_YouCanSee
  $A402,$03 #REGa=*#R$A106.
  $A405,$03 Call #R$A694.
  $A408,$02 Jump to #R$A416 if no objects were found at this location.
N $A40A Print "#DECODESTR$CD26".
  $A40A,$03 #REGhl=#R(#OFFSET($0004)).
  $A40D,$03 Call #R$A25C.
N $A410 Print the objects at this location.
  $A410,$03 #REGa=*#R$A106.
  $A413,$03 Call #R$A314.
@ $A416 label=RoomExits_Return
  $A416,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $A41B,$01 Return.

c $A41C Get Room Pointer
@ $A41C label=GetRoomPointer
E $A41C View the equivalent code in;
. #LIST
. { #JEWELS$C302 }
. { #WARLORD$AC9A }
. LIST#
R $A41C O:HL Pointer to the room data
  $A41C,$01 Stash #REGde on the stack.
  $A41D,$06 Load the *#R$A106 into #REGhl.
  $A423,$03 #REGde=#N($0006,$04,$04).
  $A426,$03 Call #R$A16D.
  $A429,$04 Add the result to the base address #R$B8DD and store the result in
. #REGhl.
  $A42D,$01 Restore #REGde from the stack.
  $A42E,$01 Return.

c $A42F
  $A42F,$02 #REGa=#N$0D.
  $A431,$03 Call #R$9E26.
  $A434,$03 #REGa=*#R$A106.
  $A437,$04 #REGix=#R$AE7D.
  $A43B,$01 #REGe=#REGa.
  $A43C,$03 Call #R$A305.
  $A43F,$03 Call #R$A25C.
  $A442,$01 Return.

g $A443

t $A447 Messaging: "SPACE<BS><BS>SPACE<BS>"
@ $A447 label=Messaging_SpaceBackspaceBackspaceSpaceBackspace
D $A447 Used by the routine at #R$A4B0.
  $A447,$03 "#STR$A447,$08($b==$FF)".
N $A44A Messaging: "SPACE<BS>"
@ $A44A label=Messaging_SpaceBackspace
D $A44A Used by the routine at #R$A4B0?
  $A44A,$02 "#STR$A44A,$08($b==$FF)".
B $A44C,$01 Terminator.

t $A44D Messaging: "_<BS>"
@ $A44D label=Messaging_UnderscoreBackspace
D $A44D Used by the routine at #R$A450.
  $A44D,$02 "#STR$A44D,$08($b==$FF)".
B $A44F,$01 Terminator.

c $A450 Print Cursor
@ $A450 label=Print_Cursor
  $A450,$01 Stash #REGhl on the stack.
N $A451 Print "#STR$A44D,$08($b==$FF)".
  $A451,$03 #REGhl=#R$A44D.
  $A454,$03 Call #R$A267.
  $A457,$01 Restore #REGhl from the stack.
  $A458,$01 Return.

c $A459 Is Character A Delimiter
@ $A459 label=IsDelimiter
R $A459 O:F The zero flag is set if a delimiter is found
  $A459,$02 Stash #REGhl and #REGbc on the stack.
  $A45B,$03 #REGhl=#R$9DCE.
  $A45E,$03 Fetch the delimiter count and store it in #REGbc.
  $A461,$01 Move #REGhl to point to the delimiter table.
  $A462,$02 Search for matching delimiters.
  $A464,$02 Restore #REGbc and #REGhl from the stack.
  $A466,$01 Return.

c $A467 Print User Input To Screen
@ $A467 label=Print_UserInputToScreen
R $A467 A User input keypress
R $A467 HL Pointer to the command buffer
  $A467,$01 Stash the user input keypress on the stack.
  $A468,$04 Jump to #R$A474 if "DELETE" was not pressed.
  $A46C,$01 Stash the pointer to the command buffer on the stack.
N $A46D Print "SPACE<BS>" to delete the letter from the screen.
  $A46D,$03 #REGhl=#R$A44A.
  $A470,$03 Call #R$A267.
  $A473,$01 Restore the pointer to the command buffer from the stack.
@ $A474 label=UserInputToScreen
  $A474,$01 Restore the user input keypress from the stack.
N $A475 Print the user input keypress to the screen.
  $A475,$03 Call #R$9E26.
  $A478,$01 Return.

c $A479 Handler: Match Item
@ $A479 label=Handler_MatchItem
R $A479 O:F The carry flag is set to indicate that an item was found
  $A479,$05 Stash #REGhl, #REGde, #REGbc and #REGix on the stack.

c $A4B0 Handler: User Input
@ $A4B0 label=Handler_UserInput
D $A4B0 Handles keyboard input, tokenises commands and validates the
. vocabulary.
E $A4B0 View the equivalent code in;
. #LIST
. { #JEWELS$C00A }
. { #WARLORD$AD32 }
. LIST#
N $A4B0 Reset the screen position to defaults.
  $A4B0,$03 Call #R$A1ED.
  $A4B3,$03 #REGhl=#R$A109.
N $A4B6 Initialise the command buffer.
  $A4B6,$02 Initialise a letter counter in #REGb.
  $A4B8,$02 Jump to #R$A4BC.
N $A4BA Main input loop - process each keypress.
@ $A4BA label=UserInput_Loop
  $A4BA,$01 Move to the next byte of the command buffer.
  $A4BB,$01 Increment the letter counter by one.
@ $A4BC label=UserInput_Next
  $A4BC,$03 Call #R$A450.
  $A4BF,$03 Call #R$9DFB.
  $A4C2,$04 Jump to #R$A4D6 if "DELETE" was not pressed.
N $A4C6 The user pressed "DELETE".
  $A4C6,$04 Jump back to #R$A4BC if there hasn't been any input yet (nothing to
. delete).
N $A4CA There is input which can be deleted, so action a delete!
  $A4CA,$01 Temporarily stash the command buffer pointer in #REGde.
N $A4CB Print "SPACE BACKSPACE BACKSPACE SPACE BACKSPACE" to move the current
. print position on the screen to the previous character, and to delete the
. character present using a space.
  $A4CB,$03 #REGhl=#R$A447.
  $A4CE,$03 Call #R$A267.
N $A4D1 Adjust the command buffer position and letter counter.
  $A4D1,$01 Restore the command buffer pointer from #REGde.
  $A4D2,$01 Decrease the command buffer pointer by one.
  $A4D3,$01 Decrease the letter counter by one.
  $A4D4,$02 Jump to #R$A4BC.
N $A4D6 Check which key the user pressed:
@ $A4D6 label=ValidateUserInput
  $A4D6,$05 Jump to #R$A4E8 if "ENTER" was pressed.
  $A4DB,$04 If the keypress was any other control key (the value being under
. #N$20 ASCII "SPACE"), it's not valid input so jump back to #R$A4BC.
  $A4DF,$04 If the keypress was higher than #N$80, it's also not valid input so
. jump back to #R$A4BC.
N $A4E3 Is the command buffer full?
  $A4E3,$05 Jump to #R$A4BC if the letter counter is #N$31 (so the buffer is
. full).
N $A4E8 Writes the keypress into the command buffer and print it to the screen.
@ $A4E8 label=UserInput_WriteKeypress
  $A4E8,$02 Write the user input key to *#REGhl.
  $A4EA,$03 Call #R$A467.
N $A4ED Did the user press "ENTER"?
  $A4ED,$05 Jump to #R$A4BA if "ENTER" was not pressed.
N $A4F2 The player pressed "ENTER" so begin to process the user input.
N $A4F2 Clear down the user input tokens.
  $A4F2,$03 #REGhl=#R$A13B.
  $A4F5,$02 Set a counter in #REGb for all #N$0A user input tokens.
@ $A4F7 label=EmptyUserInputTokens_Loop
  $A4F7,$02 Write a termination byte (#N$FF) to *#REGhl.
  $A4F9,$01 Increment #REGhl by one.
  $A4FA,$02 Decrease the user input tokens counter by one and loop back to
. #R$A4F7 until all the tokens have been set to termination bytes (#N$FF).
N $A4FC Set up pointers for the command buffer, the user input tokens and the
. count of the number of user input tokens.
  $A4FC,$03 #REGhl=#R$A109.
  $A4FF,$04 #REGix=#R$A13B.
  $A503,$02 Set a counter in #REGc for the #N$0A user input tokens.
  $A505,$02 Jump to #R$A551.
N $A507 Print "#DECODESTR$CD0B".
  $A507,$03 #REGhl=#R(#OFFSET($0001)).
  $A50A,$03 Call #R$A25C.
  $A50D,$03 Jump to #R$A4B0.
@ $A549 label=StoreTokenAndContinue
@ $A551 label=EmptyFourLetterBuffer

c $A591 Parser: Validate Item
@ $A591 label=Parser_ValidateItem
E $A591 View the equivalent code in;
. #LIST
. { #JEWELS$C32A }
. { #WARLORD$AE36 }
. LIST#
R $A591 BC The position in the user input token of the object
R $A591 O:F The carry flag is set when the item isn't present
  $A591,$01 Adjust the counter for the sum.
  $A592,$05 Calculate the index (*#R$BBC9-#REGc) and store the result in #REGe.
  $A597,$01 Stash #REGde on the stack.
  $A598,$07 Call #R$A305 with #R$B60E.
  $A59F,$01 Restore #REGde from the stack.
  $A5A0,$02 Jump to #R$A5A3.
@ $A5A2 label=ValidateItem_Loop
  $A5A2,$01 Increment #REGhl by one.
@ $A5A3 label=ValidateItem
  $A5A3,$05 Jump to #R$A5AE if *#REGhl is equal to #N$FF.
  $A5A8,$03 Call #R$A5C6.
  $A5AB,$02 Jump to #R$A5A2 if the item wasn't found.
  $A5AD,$01 Return.
N $A5AE The item being referenced isn't in the room or in the players inventory.
@ $A5AE label=Response_ItemNotHere
N $A5AE Print "#DECODESTR$CD5D".
  $A5AE,$03 #REGhl=#R(#OFFSET($000E)).
  $A5B1,$03 Call #R$A1F4.
N $A5B4 Print the object name.
  $A5B4,$07 Call #R$A305 with #R$AF31.
  $A5BB,$03 Call #R$A1F4.
N $A5BE Print "#DECODESTR$CD66".
  $A5BE,$03 #REGhl=#R(#OFFSET($000F)).
  $A5C1,$03 Call #R$A25C.
  $A5C4,$01 Set the carry flag.
  $A5C5,$01 Return.

c $A5C6 Validate If Item Is Present
@ $A5C6 label=ValidateItemPresent
E $A5C6 View the equivalent code in;
. #LIST
. { #JEWELS$C35F }
. { #WARLORD$AE6B }
. LIST#
R $A5C6 A Object ID
R $A5C6 F Z flag set if the object is available
  $A5C6,$02 Stash #REGhl and #REGde on the stack.
  $A5C8,$03 Store the object ID in #REGde.
  $A5CB,$03 #REGhl=#R$9F88.
  $A5CE,$01 Add the object ID to the object/ event locations table.
  $A5CF,$06 Jump to #R$A5D8 if the object/ event table states that it's located
. in *#R$A106. Note also sets/ unsets the Z flag accordingly.
N $A5D5 Check the players inventory, as an object can still be used if it's being held.
  $A5D5,$03 Lastly, set the Z flag if the item is in the players inventory.
@ $A5D8 label=Handler_Objects_Return
N $A5D8 Housekeeping; restore #REGde and #REGhl to their previous values.
  $A5D8,$02 Restore #REGde and #REGhl from the stack.
  $A5DA,$01 Return.

c $A5DB Match Phrase Tokens
@ $A5DB label=MatchPhraseTokens
D $A5DB Matches phrase patterns with multiple variations against user input
. tokens.
E $A5DB View the equivalent code in;
. #LIST
. { #JEWELS$C37F }
. { #WARLORD$AE80 }
. LIST#
R $A5DB HL A pointer to phrase token data
R $A5DB O:F The Z flag is set if the input matches any pattern
  $A5DB,$01 Switch the phrase token pointer to #REGde.
  $A5DC,$02 Jump to #R$A5DF.
N $A5DE Skip the separator.
@ $A5DE label=MatchPhraseTokens_Loop
  $A5DE,$01 Increment the phrase token pointer by one.
N $A5DF Fetch the second user input token (not the first, as the first token
. is the verb and the second token onwards gives the context).
N $A5DF For example; "GET" (verb) "KEG OF GUNPOWDER" (direct object).
@ $A5DF label=MatchPhraseTokens_Start
  $A5DF,$03 #REGhl=#R$A13C.
  $A5E2,$02 Jump to #R$A5E6.
N $A5E4 The tokens matched so advance both pointers.
@ $A5E4 label=MatchTokens_Loop

  $A5E4,$01 Increment the input token pointer by one.
  $A5E5,$01 Increment the pattern token pointer by one.
N $A5E6 Keep looping if the tokens match.
@ $A5E6 label=CompareTokens
  $A5E6,$04 Jump to #R$A5E4 if the pattern token and the input token are the
. same.
N $A5EA The tokens are different, but is it just that we are at the end of the
. pattern?
  $A5EA,$04 Jump to #R$A5F2 unless this is the terminator character (#N$FE).
N $A5EE Yes! The input tokens all matched against the phrase pattern tokens.
  $A5EE,$04 Return with Z flag result.
N $A5F2 The tokens are different, but is this a separator character?
@ $A5F2 label=CheckSeparator
  $A5F2,$04 Jump to #R$A5FC if this is not the separator (#N$FD).
  $A5F6,$05 Jump to #R$A5DE if the input tokens are not complete.
  $A5FB,$01 Return.
N $A5FC The current variant doesn't match, so skip to the next one.
@ $A5FC label=MatchPhraseTokens_Next
  $A5FC,$01 Increment the phrase token pointer by one.
  $A5FD,$05 Jump to #R$A608 if the terminator has been reached (#N$FE).
  $A602,$04 Jump to #R$A5FC if this is not the separator (#N$FD).
  $A606,$02 Jump to #R$A5DE.
N $A608 The input doesn't match any patterns.
@ $A608 label=MatchPhraseTokens_Return
  $A608,$01 Clear the Z flag.
  $A609,$01 Return.

c $A60A Parser: Count Item References
@ $A60A label=Parser_CountItems
D $A60A Count how many tokens in the user input refer to game items.
E $A60A View the equivalent code in;
. #LIST
. { #JEWELS$C3AE }
. { #WARLORD$AEAF }
. LIST#
R $A60A O:A The number of references to items in the user input tokens
R $A60A O:F The Z flag is set when there are no items present in the input
  $A60A,$03 Set a pointer to #R$A13B in #REGhl.
  $A60D,$02 Set a token count in #REGb of #N$0A which is the total length of
. the user input tokens.
  $A60F,$02 Initialise the item counter held in #REGe to #N$00.
@ $A611 label=Parser_CountItems_Loop
  $A611,$01 Fetch a user input token.
  $A612,$04 Jump to #R$A629 if the terminator character (#N$FF) has been
. reached.
  $A616,$02 Stash the token pointer and token counter on the stack.
  $A618,$03 #REGhl=#R$B49E.
  $A61B,$04 Fetch the count of the number of items in the table from *#R$BBC9.
  $A61F,$02 Search to see if the item ID is in the table.
  $A621,$02 Restore the token counter and token pointer from the stack.
  $A623,$02 Jump to #R$A626 if this token doesn't refer to a game item.
N $A625 This token does point to a game item, so increase the item counter.
  $A625,$01 Increment item counter by one.
@ $A626 label=Parser_CountItems_Skip
  $A626,$01 Move to the next token.
  $A627,$02 Decrease the token counter by one and loop back to #R$A611 until
. all the tokens have been evaluated.
@ $A629 label=Parser_CountItems_Process
  $A629,$02 Transfer the item count into #REGa and set flags accordingly.
  $A62B,$01 Return.

c $A62C Item Locator
@ $A62C label=ItemLocator
D $A62C Given an item ID, this routine returns the byte stored for its location
. (#N$00 for when an item/ event is disabled, #N$01 for when an item is in the
. players inventory, or pass back the room ID).
E $A62C View the equivalent code in;
. #LIST
. { #JEWELS$C3D0 }
. { #WARLORD$AED1 }
. LIST#
R $A62C A Item ID
R $A62C O:A Either a room ID, #N$01 for the players inventory, or #N$00 for when the item is disabled
N $A62C Create an offset in #REGde.
  $A62C,$03 Load the item ID into #REGde.
  $A62F,$04 Add the item ID offset to #R$9F88.
  $A633,$01 Fetch the item location and store it in #REGa.
  $A634,$01 Return.

c $A635 Is Object In Inventory?
@ $A635 label=CheckObjectInInventory
D $A635 Checks if a given item is in the players inventory or not.
E $A635 View the equivalent code in;
. #LIST
. { #JEWELS$C3E4 }
. { #WARLORD$AEDA }
. LIST#
R $A635 A Object ID
R $A635 O:F The zero flag is set if the item is in the players inventory
N $A635 The #R$A62C routine returns with #REGa containing the room ID of the
. requested object, #N$00 for when the item is disabled or #N$01 for the
. players inventory.
  $A635,$03 Call #R$A62C.
  $A638,$02 Compare #REGa with #N$01 (inventory).
  $A63A,$01 Return.

c $A63B Handler: Destroy Item/ Event
@ $A63B label=Handler_DestroyItemEvent
D $A63B Updates a given item/ event ID so it's then "inactive" (has a location
. ID of #N$00).
E $A63B View the equivalent code in;
. #LIST
. { #JEWELS$C3EA }
. { #WARLORD$AEE0 }
. LIST#
R $A63B A Item/ event ID
N $A63B Set the item ID and location (which will be #N$00 to deactivate it).
  $A63B,$01 Load the item/ event ID into #REGb.
  $A63C,$02 Set the room ID to #N$00 which will deactivate the item/ event.
  $A63E,$03 Call #R$A663.
  $A641,$01 Return.

c $A642 Handler: Update Item/ Event For The Current Room
@ $A642 label=Handler_UpdateItemEventCurrentRoom
D $A642 Updates a given item/ event ID so it appears in the current room. Used
. for example, when an item is dropped (so it changes from being #N$01 - in the
. players inventory, to the current room ID).
E $A642 View the equivalent code in;
. #LIST
. { #JEWELS$C3F1 }
. { #WARLORD$AEE7 }
. LIST#
R $A642 A Item/ event ID
  $A642,$01 Load the item/ event ID into #REGb.
  $A643,$04 Load #REGc with *#R$A106.
  $A647,$03 Call #R$A663.
  $A64A,$01 Return.

c $A64B Set Scenic Event As Triggered
@ $A64B label=ScenicEventTriggered
E $A64B View the equivalent code in;
. #LIST
. { #JEWELS$C3FA }
. { #WARLORD$AEF0 }
. LIST#
R $A64B A Scenic event ID (+#N$80)
  $A64B,$01 Copy the scenic event ID into #REGb.
  $A64C,$02 Set #REGc to #N$FF which denotes that the event has fired already
. and shouldn't be repeated.
  $A64E,$03 Call #R$A663.
  $A651,$01 Return.

c $A652 Check Active Scenic Events
@ $A652 label=CheckActiveScenicEvents
E $A652 View the equivalent code in #JEWELS$C401.
R $A652 HL Pointer to scenic data
R $A652 O:A
R $A652 O:F The Z flag is set then there are no matching scenic events
  $A652,$02 Jump to #R$A655.
@ $A654 label=ActiveScenicEvents_Loop
  $A654,$01 Move to the next event ID.
@ $A655 label=ActiveScenicEvents_CheckNext
  $A655,$05 Jump to #R$A661 if *#REGhl is equal to #N$FF.
  $A65A,$03 Call #R$A5C6.
  $A65D,$02 Jump to #R$A654 if the Z flag is not set.
  $A65F,$01 #REGa=*#REGhl.
  $A660,$01 Return.
@ $A661 label=NoActiveScenicEvents
  $A661,$01 Set Z flag.
  $A662,$01 Return.

c $A663 Handler: Update Item Location
@ $A663 label=Handler_UpdateItemLocation
R $A663 B Item ID
R $A663 C Room ID
  $A663,$03 #REGhl=#R$9F88.
  $A666,$03 Load the item ID into #REGde.
  $A669,$01 Add the item ID to #R$9F88.
  $A66A,$01 Update the table with the new room ID in #REGc.
  $A66B,$01 Return.

u $A66C Find Index Of Item From Item Group Present
@ $A66C label=FindIndexOfItemFromItemGroupPresent
R $A66C HL Pointer to item group data
R $A66C O:A The found index
C $A66C,$02 Initialise an index counter in #REGb to #N$00.
C $A66E,$02 Jump to #R$A672.
@ $A670 label=FindIndexOfItemFromItemGroupPresent_Loop
N $A670 Move past the termination byte in the item group.
C $A670,$01 Increment the index counter in #REGb by one.
C $A671,$01 Increment #REGhl by one.
@ $A672 label=Call_CheckItemGroupPresent
C $A672,$03 Call #R$A652.
C $A675,$02 Jump back to #R$A670 until an item from the item group is matched.
N $A677 An index was found.
C $A677,$01 Store the index from #REGb into #REGa.
C $A678,$01 Return.

c $A679 Transform Item
@ $A679 label=TransformItem
R $A679 B From item ID
R $A679 C To item ID
D $A679 Rather than use item properties, the game just has separate objects
. that don't exist until an action is performed.
.
. An example is:
. #TABLE(default,centre,centre)
. { =h Item ID | =h Item Name }
. { #N$1F | #ITEM$1F }
. { #N$20 | #ITEM$20 }
. TABLE#
. When the helmet is worn by the player; item #N$1F is destroyed and replaced
. with item #N$20.
E $A679 View the equivalent code in;
. #LIST
. { #JEWELS$C426 }
. { #WARLORD$AF1E }
. LIST#
  $A679,$04 Call #R$A62C with the source item ID.
N $A67D #REGa now contains the location of the source ID.
  $A67D,$02 Stash the item IDs and source item room ID on the stack.
  $A67F,$05 Call #R$A663 and disable the source item.
  $A684,$02 Restore the source item room ID and item IDs from the stack.
N $A686 Activate the destination item in the same room.
  $A686,$01 Load the destination item ID into #REGb.
  $A687,$01 Load the source room ID into #REGc.
  $A688,$03 Call #R$A663.
  $A68B,$01 Return.

c $A68C Check Item In Current Room
@ $A68C label=CheckItemInCurrentRoom
R $A68C A Item ID
R $A68C O:F Z flag is set if the item is in the current room
N $A68C Fetch the room ID of the requested item using the table at #R$9F88.
  $A68C,$03 Call #R$A62C.
  $A68F,$04 Compare the room ID with *#R$A106.
  $A693,$01 Return.

c $A694 Check Room Objects
@ $A694 label=CheckRoomObjects
E $A694 View the equivalent code in;
. #LIST
. { #JEWELS$C439 }
. { #WARLORD$AF39 }
. LIST#
R $A694 A Room number
R $A694 O:A #N$00 or #N$01 if objects are found or not
  $A694,$03 #REGhl=#R$9F88.
  $A697,$04 #REGbc=*#R$BBC7.
@ $A69B label=CheckRoomObjects_Loop
  $A69B,$02 Search for the room number in the table.
  $A69D,$01 Return if no objects are found.
  $A69E,$01 Stash the object location table pointer on the stack.
  $A69F,$03 Call #R$A6B1.
  $A6A2,$01 Restore the object location table pointer from the stack.
  $A6A3,$02 Jump to #R$A6AF if there are no objects found here.
  $A6A5,$01 Temporarily store #REGa in #REGe.
  $A6A6,$02 Are there more objects to check?
  $A6A8,$01 Restore the #REGa register.
  $A6A9,$02 Jump to #R$A69B if there are more objects to check.
N $A6AB Set the "successful" output.
  $A6AB,$02 Set #REGa to #N$01 to indicate that objects were found.
  $A6AD,$01 Set flags.
  $A6AE,$01 Return.
N $A6AF Set the "failure" output.
@ $A6AF label=NoRoomObjectsFound
  $A6AF,$01 Set #REGa to #N$00 to indicate that no objects were found.
  $A6B0,$01 Return.

c $A6B1 Validate Object
@ $A6B1 label=ValidateObject
E $A6B1 View the equivalent code in;
. #LIST
. { #JEWELS$C456 }
. { #WARLORD$AF56 }
. LIST#
R $A6B1 BC Object counter
R $A6B1 O:F Z is unset if the object is valid, unset when invalid
  $A6B1,$02 Stash #REGaf and #REGbc on the stack.
  $A6B3,$01 Adjust the object counter.
  $A6B4,$03 #REGa=*#R$BBC7.
  $A6B7,$02 Calculate the index and store the result in #REGe.
  $A6B9,$02
  $A6BB,$04 #REGix=#R$AFDD.
  $A6BF,$03 Call #R$A305.
  $A6C2,$02
  $A6C4,$01 Restore the object counter from the stack.
  $A6C5,$04 Jump to #R$A6CC if the object is invalid.
  $A6C9,$01 Restore the object type from the stack.
  $A6CA,$01 Clear the Z flag.
  $A6CB,$01 Return.
@ $A6CC label=InvalidObject
  $A6CC,$01 Restore #REGaf from the stack.
  $A6CD,$01 Set the Z flag.
  $A6CE,$01 Return.

c $A6CF Response: "You're Not Carrying Anything"
@ $A6CF label=Response_YoureNotCarryingAnything
  $A6CF,$06 Jump to #R$A6DC if *#R$A0D2 is not #N$00.
N $A6D5 Print "#DECODESTR$CE2D".
  $A6D5,$03 #REGhl=#R(#OFFSET($0020)).
  $A6D8,$03 Call #R$A25C.
  $A6DB,$01 Return.
@ $A6DC label=Response_YouAreCarrying
N $A6DC Print "#DECODESTR$CE3B".
  $A6DC,$03 #REGhl=#R(#OFFSET($0021)).
  $A6DF,$03 Call #R$A25C.
  $A6E2,$05 Call #R$A314 with a room ID of #N$01 which is the players
. inventory.
  $A6E7,$01 Return.

c $A6E8 Move Player
@ $A6E8 label=MovePlayer
D $A6E8 The data in #R$B8DD is stored in a particular order for each room:
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
R $A6E8 C A movement "value" from the action
  $A6E8,$02 Initialise #REGb with #N$00 so the movement value is now in #REGbc.
  $A6EA,$03 Call #R$A41C.
N $A6ED #REGhl now holds a pointer to the room data for the current room at
. #R$B8DD.
  $A6ED,$01 Add the movement value to #REGhl.
  $A6EE,$01 Fetch the entry from *#REGhl and store it in #REGa.
  $A6EF,$03 Jump to #R$A6F6 if there is no exit at the requested memory
. location.
  $A6F2,$03 Call #R$AD79.
  $A6F5,$01 Return.
@ $A6F6 label=Response_YouCantGoInThatDirection
N $A6F6 Print "#DECODESTR$CE44".
  $A6F6,$03 #REGhl=#R(#OFFSET($0022)).
  $A6F9,$03 Call #R$A25C.
  $A6FC,$01 Return.

g $A6FD
W $A6FD,$02

c $A6FF

g $A779

c $A808

c $AC45
N $AC45 Print "#DECODESTR$CDD1".
  $AC45,$03 #REGhl=#R(#OFFSET($0018)).
  $AC48,$03 Call #R$A25C.
  $AC4B,$01 Set the carry flag.
  $AC4C,$01 Return.

c $AC4D
  $AC4D,$07 Jump to #R$AC5C if tthe second token (*#R$A13C) is not the
. termintor character (#N$FF).
N $AC54 Print "#DECODESTR$CDC1".
  $AC54,$03 #REGhl=#R(#OFFSET($0017)).
  $AC57,$03 Call #R$A25C.
  $AC5A,$01 Set the carry flag.
  $AC5B,$01 Return.
  $AC5C,$03 Call #R$A60A.
  $AC5F,$01 Return.

c $AC60

g $AC84
W $AC84,$02

g $AC86
W $AC86,$02

c $AC88

c $ACBD Move Player To Room
@ $ACBD label=MovePlayerToRoom
R $ACBD A Destination room ID
E $ACBD View the equivalent code in;
. #LIST
. { #JEWELS$C520 }
. { #WARLORD$B01F }
. LIST#
  $ACBD,$01 Load the destination room ID into #REGc.
  $ACBE,$06 Jump to #R$ACDB if *#R$BBCF is zero.

c $ACFC

c $AD43 Print Scoring
@ $AD43 label=Print_Scoring
D $AD43 Prints the players score as a percentage.
N $AD43 Print "#DECODESTR$CE65".
  $AD43,$03 #REGhl=#R(#OFFSET($0024)).
  $AD46,$03 Call #R$A1F4.
  $AD49,$03 #REGhl=*#R$A107.
N $AD4C Evaluate the first byte to see if it needs printing at all.
N $AD4C So don't show "058%" - instead show "58%".
N $AD4C This particular check is for the first character "1" to see if the
. score is printing "100%".
  $AD4C,$01 Take the first scoring byte and store it in #REGa.
M $AD4D,$04 Keep only bits 0-3 and jump to #R$AD56 if the result of this is
. zero.
  $AD4D,$02,b$01 Keep only bits 0-3.
  $AD4F,$02 Jump to #R$AD56 if the result is equal to #N$00.
  $AD51,$05 Convert the number to ASCII by adding #N$30 and call #R$9E26.
@ $AD56 label=Scoring_SecondDigit
  $AD56,$01 Load the second scoring byte into #REGa.
M $AD57,$04 Keep only bits 4-7 and jump to #R$AD60 if the result is non-zero.
  $AD57,$02,b$01 Keep only bits 4-7.
  $AD59,$02 Jump to #R$AD60 if the result is not equal to #N$00.
N $AD5B The "tens" digit is zero, so check the "hundreds" digit again to avoid
. printing "05%" - instead show only "5%".
  $AD5B,$01 Load the first scoring byte into #REGa again.
  $AD5C,$03 Jump to #R$AD69 if no "hundreds" digit was printed.
N $AD5F A "hundreds" digit was printed, so force a "0" to be printed.
  $AD5F,$01 Load #N$00 into #REGa for printing.
@ $AD60 label=Scoring_PrintTens
  $AD60,$04 Shift the bits four positions right. This moves the tens digit into
. the lower part of the byte for printing.
  $AD64,$05 Convert the number to ASCII by adding #N$30 and call #R$9E26.
N $AD69 Lastly, always print the "units".
@ $AD69 label=Scoring_ThirdDigit
  $AD69,$01 Load the second scoring byte into #REGa.
  $AD6A,$02,b$01 Keep only bits 0-3.
  $AD6C,$05 Convert the number to ASCII by adding #N$30 and call #R$9E26.
N $AD71 Print "#DECODESTR$CE6E".
  $AD71,$03 #REGhl=#R(#OFFSET($0025)).
  $AD74,$03 Call #R$A25C.
  $AD77,$01 Return.

g $AD78 Table:
B $AD78,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).

c $AD79 Change Room
@ $AD79 label=ChangeRoom
R $AD79 A Destination room ID
  $AD79,$03 Store the room ID in *#R$AD78.
  $AD7C,$02 Stash #REGix on the stack.
  $AD7E,$04 #REGix=#R$BBD8.
  $AD82,$03 Call #R$A6FF.
  $AD85,$02 #REGa=#N$00.
  $AD87,$03 Call #R$A1C8.
  $AD8A,$02 Jump to #R$AD9E if ?? is not equal to #N$00.
  $AD8C,$03 Restore the destination room ID from *#R$AD78.
  $AD8F,$03 Call #R$ACBD.
  $AD92,$02 #REGe=#N$00.
  $AD94,$03 Call #R$A33A.
  $AD97,$04 #REGix=#R$BC4C.
  $AD9B,$03 Call #R$A6FF.
  $AD9E,$02 Restore #REGix from the stack.
  $ADA0,$01 Return.

c $ADA1 Game Start
@ $ADA1 label=GameStart
  $ADA1,$03 #REGhl=#R$9F88.
  $ADA4,$03 #REGbc=#N($0181,$04,$04).
  $ADA7,$02 Write #N$00 to *#REGhl.
  $ADA9,$01 Increment #REGhl by one.
  $ADAA,$01 Decrease #REGbc by one.
  $ADAB,$04 Jump to #R$ADA7 until #REGbc is zero.
  $ADAF,$0C Copy #N($0088,$04,$04) bytes of data (count is via *#R$BBC7) from
. #R$BB0B to #R$9F88.
  $ADBB,$06 Write *#R$BBD7 to *#R$A0D3.
  $ADC1,$04 #REGix=#R$BAF9.
  $ADC5,$03 #REGde=#R$BB05.
  $ADC8,$04 #REGb=*#R$BBD1.
  $ADCC,$03 #REGl=*#REGix+#N$00.
  $ADCF,$03 #REGh=*#REGix+#N$01.
  $ADD2,$01 #REGa=*#REGde.
  $ADD3,$01 Write #REGa to *#REGhl.
  $ADD4,$04 Increment #REGix by two.
  $ADD8,$01 Increment #REGde by one.
  $ADD9,$02 Decrease counter by one and loop back to #R$ADCC until counter is zero.
  $ADDB,$03 Call #R$9F27.
  $ADDE,$06 Write *#R$BBD3 to *#R$A106.
  $ADE4,$03 Call #R$AD79.
  $ADE7,$03 Call #R$A280.
  $ADEA,$03 Call #R$AC88.
  $ADED,$02 #REGa=#N$00.
  $ADEF,$03 Call #R$A1C8.
  $ADF2,$02 Jump to #R$AE0D if #REGde is not equal to #REGc.
  $ADF4,$02 #REGa=#N$01.
  $ADF6,$03 Call #R$A1C8.
  $ADF9,$02 Jump to #R$AE13 if #REGde is not equal to #REGc.
  $ADFB,$02 #REGa=#N$02.
  $ADFD,$03 Call #R$A1C8.
  $AE00,$02 Jump to #R$AE16 if #REGde is not equal to #REGc.
  $AE02,$03 Call #R$A4B0.
  $AE05,$03 Call #R$AC60.
  $AE08,$03 Call #R$ACFC if #REGc is greater than #N$02.
  $AE0B,$02 Jump to #R$ADE7.

c $AE0D Game Over
@ $AE0D label=GameOver
N $AE0D Print "#DECODESTR$CD6B".
  $AE0D,$03 #REGhl=#R(#OFFSET($0010)).
  $AE10,$03 Call #R$A25C.
N $AE13 Print the percentage of the game the player achieved.
@ $AE13 label=GameOver_Score
  $AE13,$03 Call #R$AD43.
@ $AE16 label=WantAnotherGameInput
N $AE16 Print "#DECODESTR$CD72".
  $AE16,$03 #REGhl=#R(#OFFSET($0011)).
  $AE19,$03 Call #R$A25C.
@ $AE1C label=WantAnotherGameInput_Loop
  $AE1C,$03 Call #R$9DFB.
N $AE1F The player is done with the game, so reset back to BASIC.
  $AE1F,$05 #HTML(Reset back to BASIC if the keypress is "<code>#CHR$4E</code>".)
N $AE24 The player wants another go...
  $AE24,$05 #HTML(Jump to #R$9DD7 if the keypress is "<code>#CHR$59</code>".)
N $AE29 Just loop round for any other input.
  $AE29,$03 Jump to #R$AE1C.

c $AE2C

c $AE5E

g $AE7D Table: Room Descriptions
@ $AE7D label=Table_RoomDescriptions
E $AE7D View the equivalent code in;
. #LIST
. { #JEWELS$D3EC }
. { #WARLORD$C8B0 }
. LIST#
W $AE7D,$02 Unused (denotes when an item is "inactive").
W $AE7F,$02 Unused (denotes when an item is in the players inventory).
W $AE81,$02 Room #N((#PC-$AE7D)/$02):
. #IF(#EVAL(#PEEK(#PC)+#PEEK(#PC+$01)*$100)>$0000)(#R(#OFFSET(#PEEK(#PC)+#PEEK(#PC+$01)*$100)),N/A).
L $AE81,$02,$58

g $AF31 Table: Object Noun Phrases
@ $AF31 label=Table_ObjectNounPhrases
E $AF31 View the equivalent code in;
. #LIST
. { #JEWELS$D4C6 }
. { #WARLORD$C83E }
. LIST#
W $AF31,$02 Object #R(#OFFSET(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#N((#PC-$AF31)/$02)): #OBJECT((#PC-$AF31)/$02).
L $AF31,$02,$56

g $AFDD Table: Item Descriptions
@ $AFDD label=Table_ItemDescriptions
E $AFDD View the equivalent code in;
. #LIST
. { #JEWELS$D34E }
. { #WARLORD$C732 }
. LIST#
W $AFDD,$02 Item #N((#PC-$AFDD)/$02):
. #IF(#EVAL(#PEEK(#PC)+#PEEK(#PC+$01)*$100)>$0000)(#R(#OFFSET(#PEEK(#PC)+#PEEK(#PC+$01)*$100)) #ITEM((#PC-$AFDD)/$02),N/A).
L $AFDD,$02,$88

t $B0ED Table: Vocabulary
@ $B0ED label=Table_Vocabulary
  $B0ED,$09 Command #N((#PC-$B0ED)/$09).
L $B0ED,$09,$0A
  $B147,$04 Command #N((#PC-$B11F)/$04).
L $B147,$04,$02
  $B14F,$09 Command #N$0C.
  $B158,$04 Command #N((#PC-$B124)/$04).
L $B158,$04,$02
  $B160,$09 Command #N$0F.
  $B169,$04 Command #N((#PC-$B129)/$04).
L $B169,$04,$03
  $B175,$09 Command #N$13.
  $B17E,$13 Command #N$14.
  $B191,$09 Command #N$15.
  $B19A,$04 Command #N((#PC-$B142)/$04).
L $B19A,$04,$04
  $B1AA,$09 Command #N$1A.
  $B1B3,$04 Command #N$1B.
  $B1B7,$09 Command #N$1C.
  $B1C0,$04 Command #N$1D.
  $B1C4,$09 Command #N$1E.
  $B1CD,$04 Command #N((#PC-$B151)/$04).
L $B1CD,$04,$02
  $B1D5,$09 Command #N$21.
  $B1DE,$04 Command #N((#PC-$B156)/$04).
L $B1DE,$04,$0A
  $B206,$09 Command #N$2C.
  $B20F,$04 Command #N$2D.
  $B213,$09 Command #N$2E.
  $B21C,$04 Command #N((#PC-$B160)/$04).
L $B21C,$04,$02
  $B224,$09 Command #N$31.
  $B22D,$04 Command #N$32.
  $B231,$09 Command #N$33.
  $B23A,$04 Command #N((#PC-$B16A)/$04).
L $B23A,$04,$02
  $B242,$09 Command #N((#PC-$B05C)/$09).
L $B242,$09,$02
  $B254,$04 Command #N((#PC-$B174)/$04).
L $B254,$04,$04
  $B264,$0E Command #N$3C.
  $B272,$04 Command #N((#PC-$B17E)/$04).
L $B272,$04,$02
  $B27A,$09 Command #N$3F.
  $B283,$04 Command #N((#PC-$B183)/$04).
L $B283,$04,$04
  $B293,$09 Command #N$44.
  $B29C,$04 Command #N((#PC-$B188)/$04).
L $B29C,$04,$11
  $B2E0,$09 Command #N$56.
  $B2E9,$04 Command #N((#PC-$B18D)/$04).
L $B2E9,$04,$1C
  $B359,$09 Command #N$73.
  $B362,$04 Command #N((#PC-$B192)/$04).
L $B362,$04,$07
  $B37E,$09 Command #N$7B.
  $B387,$04 Command #N((#PC-$B197)/$04).
L $B387,$04,$04
  $B397,$09 Command #N$80.
  $B3A0,$04 Command #N((#PC-$B19C)/$04).
L $B3A0,$04,$04
  $B3B0,$09 Command #N$85.
  $B3B9,$04 Command #N$86.
  $B3BD,$13 Command #N$87.
  $B3D0,$04 Command #N((#PC-$B1B0)/$04).
L $B3D0,$04,$05
  $B3E4,$09 Command #N$8D.
  $B3ED,$04 Command #N((#PC-$B1B5)/$04).
L $B3ED,$04,$02
  $B3F5,$09 Command #N$90.
  $B3FE,$04 Command #N((#PC-$B1BA)/$04).
L $B3FE,$04,$02
  $B406,$09 Command #N$93.
  $B40F,$04 Command #N((#PC-$B1BF)/$04).
L $B40F,$04,$04
B $B41F,$01 Terminator.

g $B420

g $B49E Pointer: Token Item List Table
g $B49E Table: Token Item List
@ $B49E label=Table_TokenItemList
D $B49E A list of all tokens which relate to items.
E $B49E View the equivalent code in;
. #LIST
. { #JEWELS$E83E }
. { #WARLORD$E308 }
. LIST#
B $B49E,$01 Token #N(#PEEK(#PC)): #TOKEN(#PEEK(#PC)).
L $B49E,$01,$56

g $B4F4 Data: Item Groups
D $B4F4 See #R$B60E for usage.
@ $B4F4 label=Data_ItemGroup_Roman
B $B4F4,$01 #IF(#PEEK(#PC)==$FF)(Terminator,Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC))).
L $B4F4,$01,$11A

g $B60E Table: Item Grouping
@ $B60E label=Table_ItemGrouping
D $B60E Items may have several item IDs which relate to a single item, this
. table groups the items together to assist the parser with knowing that tokens
. refer to the same thing.
.
. Some examples are:
. #TABLE(default,centre,centre,centre)
. { =h Item ID | =h Item Name | =h Relates To: }
. { R$E353(#N$13) | #ITEM$13 | =r2 The Hare }
. { R$E354(#N$26) | #ITEM$26 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { R$E36B(#N$1F) | #ITEM$1F | =r2 The Bronze Helmet }
. { R$E36C(#N$20) | #ITEM$20 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { R$E3AD(#N$4F) | #ITEM$4F | =r2 The Pig }
. { R$E3AE(#N$50) | #ITEM$50 }
. TABLE#
W $B60E,$02 Item Group: #N((#PC-$B60E)/$02): #OBJECT((#PC-$B60E)/$02).
L $B60E,$02,$56

g $B6BA

g $B8DD Table: Room Map
@ $B8DD label=Table_RoomMap
N $B8DD Room #N((#PC-$B8DD)/$06): #ROOM((#PC-$B8DD)/$06).
B $B8DD,$01 #IF(#PEEK(#PC)>$00)(North to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8DE,$01 #IF(#PEEK(#PC)>$00)(South to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8DF,$01 #IF(#PEEK(#PC)>$00)(East to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8E0,$01 #IF(#PEEK(#PC)>$00)(West to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8E1,$01 #IF(#PEEK(#PC)>$00)(Up to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8E2,$01 #IF(#PEEK(#PC)>$00)(Down to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
L $B8DD,$06,$2F

g $BA00
g $BA04
g $BA4D

g $BAF9
W $BAF9,$02
L $BAF9,$02,$06,$02

g $BB05

g $BB0B
B $BB0B

g $BB93 Table: Rooms With Images
@ $BB93 label=Table_RoomsWithImages
D $BB93 See #R$A33A.
B $BB93,$01 Location Slot: #N(#PC-$BB93) - room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $BB93,$01,$13

g $BBA6

g $BBC7 Number Of Object
@ $BBC7 label=Count_Objects_1
D $BBC7 The total number of objects in the game.
W $BBC7,$02

g $BBC9 Number Of Objects
@ $BBC9 label=Count_Objects_2
D $BBC9 The total number of objects in the game.
W $BBC9,$02

g $BBCB

g $BBCD Number Of Rooms With Images
@ $BBCD label=Count_RoomsWithImages
D $BBCD The total number of rooms which have related images in the game.
W $BBCD,$02

g $BBCF

g $BBD1
B $BBD1,$01

g $BBD3 Starting Room
@ $BBD3 label=StartingRoom
B $BBD3,$01

g $BBD4
B $BBD4,$01

g $BBD5
W $BBD5,$02

g $BBD7
B $BBD7,$01

g $BC4C

g $CA2B Table: Messaging Offsets
@ $CA2B label=Table_MessagingOffsets
W $CA2B,$02 Leads to: #R($C8E9+#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $CA2B,$02,$170

g $C8E9 Data: Strings
@ $C8E9 label=Data_Strings
B $C8E9,$01 "#DECODE(#PEEK(#PC))".
L $C8E9,$01,$90

t $CD0B Messaging: "Give Me A Command!"
@ $CD0B label=Messaging_GiveMeACommand
N $CD0B Print "#DECODESTR(#PC)".
B $CD0B,$01 "#DECODE(#PEEK(#PC))".
L $CD0B,$01,$0A,$02
B $CD15,$01 Terminator.

t $CD16 Messaging: "Try Another Command"
@ $CD16 label=Messaging_TryAnotherCommand
N $CD16 Print "#DECODESTR(#PC)".
B $CD16,$01 "#DECODE(#PEEK(#PC))".
L $CD16,$01,$0B,$02
B $CD21,$01 Terminator.

t $CD22 Messaging: "Nothing"
@ $CD22 label=Messaging_Nothing
N $CD22 Print "#DECODESTR(#PC)".
B $CD22,$01 "#DECODE(#PEEK(#PC))".
L $CD22,$01,$03,$02
B $CD25,$01 Terminator.

t $CD26 Messaging: "You Can See:-"
@ $CD26 label=Messaging_YouCanSee
N $CD26 Print "#DECODESTR(#PC)".
B $CD26,$01 "#DECODE(#PEEK(#PC))".
L $CD26,$01,$08,$02
B $CD2E,$01 Terminator.

t $CD2F Messaging: "&"
@ $CD2F label=Messaging_Ampersand
N $CD2F Print "#DECODESTR(#PC)".
B $CD2F,$01 "#DECODE(#PEEK(#PC))".
L $CD2F,$01,$03,$02
B $CD32,$01 Terminator.

t $CD33 Messaging: "There Are Exits:-"
@ $CD33 label=Messaging_ThereAreExits
N $CD33 Print "#DECODESTR(#PC)".
B $CD33,$01 "#DECODE(#PEEK(#PC))".
L $CD33,$01,$0A,$02
B $CD3D,$01 Terminator.

t $CD3E Messaging: "There Is An Exit"
@ $CD3E label=Messaging_ThereIsAnExit
N $CD3E Print "#DECODESTR(#PC)".
B $CD3E,$01 "#DECODE(#PEEK(#PC))".
L $CD3E,$01,$09,$02
B $CD47,$01 Terminator.

t $CD48 Exits Messaging: "North"
@ $CD48 label=MessagingExits_North
N $CD48 Print "#DECODESTR(#PC)".
B $CD48,$01 "#DECODE(#PEEK(#PC))".
L $CD48,$01,$03,$02
B $CD4B,$01 Terminator.

t $CD4C Exits Messaging: "South"
@ $CD4C label=MessagingExits_South
N $CD4C Print "#DECODESTR(#PC)".
B $CD4C,$01 "#DECODE(#PEEK(#PC))".
L $CD4C,$01,$03,$02
B $CD4F,$01 Terminator.

t $CD50 Exits Messaging: "East"
@ $CD50 label=MessagingExits_East
N $CD50 Print "#DECODESTR(#PC)".
B $CD50,$01 "#DECODE(#PEEK(#PC))".
L $CD50,$01,$02,$02
B $CD52,$01 Terminator.

t $CD53 Exits Messaging: "West"
@ $CD53 label=MessagingExits_West
N $CD53 Print "#DECODESTR(#PC)".
B $CD53,$01 "#DECODE(#PEEK(#PC))".
L $CD53,$01,$02,$02
B $CD55,$01 Terminator.

t $CD56 Exits Messaging: "Up"
@ $CD56 label=MessagingExits_Up
N $CD56 Print "#DECODESTR(#PC)".
B $CD56,$01 "#DECODE(#PEEK(#PC))".
L $CD56,$01,$02,$02
B $CD58,$01 Terminator.

t $CD59 Exits Messaging: "Down"
@ $CD59 label=MessagingExits_Down
N $CD59 Print "#DECODESTR(#PC)".
B $CD59,$01 "#DECODE(#PEEK(#PC))".
L $CD59,$01,$03,$02
B $CD5C,$01 Terminator.

t $CD5D Messaging: "I Can't See"
@ $CD5D label=Messaging_ICantSee
N $CD5D Print "#DECODESTR(#PC)".
B $CD5D,$01 "#DECODE(#PEEK(#PC))".
L $CD5D,$01,$08,$02
B $CD65,$01 Terminator.

t $CD66 Messaging: "Here"
@ $CD66 label=Messaging_Here
N $CD66 Print "#DECODESTR(#PC)".
B $CD66,$01 "#DECODE(#PEEK(#PC))".
L $CD66,$01,$04,$02
B $CD6A,$01 Terminator.

t $CD6B Messaging: "You Are Dead"
@ $CD6B label=Messaging_YouAreDead
N $CD6B Print "#DECODESTR(#PC)".
B $CD6B,$01 "#DECODE(#PEEK(#PC))".
L $CD6B,$01,$06,$02
B $CD71,$01 Terminator.

t $CD72 Messaging: "Want Another Game? Y/N"
@ $CD72 label=Messaging_WantAnotherGame
N $CD72 Print "#DECODESTR(#PC)".
B $CD72,$01 "#DECODE(#PEEK(#PC))".
L $CD72,$01,$0F,$02
B $CD81,$01 Terminator.

t $CD82 Messaging: "Loading Status File"
@ $CD82 label=Messaging_LoadingStatusFile
N $CD82 Print "#DECODESTR(#PC)".
B $CD82,$01 "#DECODE(#PEEK(#PC))".
L $CD82,$01,$0C,$02
B $CD8E,$01 Terminator.

t $CD8F Messaging: "Status File Not Found"
@ $CD8F label=Messaging_StatusFileNotFound
N $CD8F Print "#DECODESTR(#PC)".
B $CD8F,$01 "#DECODE(#PEEK(#PC))".
L $CD8F,$01,$0D,$02
B $CD9C,$01 Terminator.

t $CD9D Messaging: "Saving Status"
@ $CD9D label=Messaging_SavingStatus
N $CD9D Print "#DECODESTR(#PC)".
B $CD9D,$01 "#DECODE(#PEEK(#PC))".
L $CD9D,$01,$08,$02
B $CDA5,$01 Terminator.

t $CDA6 Messaging: "Saving Complete"
@ $CDA6 label=Messaging_SavingComplete
N $CDA6 Print "#DECODESTR(#PC)".
B $CDA6,$01 "#DECODE(#PEEK(#PC))".
L $CDA6,$01,$09,$02
B $CDAF,$01 Terminator.

t $CDB0 Messaging: "Want To Save The Game? Y/N"
@ $CDB0 label=Messaging_WantToSaveTheGame
N $CDB0 Print "#DECODESTR(#PC)".
B $CDB0,$01 "#DECODE(#PEEK(#PC))".
L $CDB0,$01,$10,$02
B $CDC0,$01 Terminator.

t $CDC1 Messaging: "Please Be More Specific"
@ $CDC1 label=Messaging_PleaseBeMoreSpecific
N $CDC1 Print "#DECODESTR(#PC)".
B $CDC1,$01 "#DECODE(#PEEK(#PC))".
L $CDC1,$01,$0F,$02
B $CDD0,$01 Terminator.

t $CDD1 Messaging: "Please Rephrase That"
@ $CDD1 label=Messaging_PleaseRephraseThat
N $CDD1 Print "#DECODESTR(#PC)".
B $CDD1,$01 "#DECODE(#PEEK(#PC))".
L $CDD1,$01,$0C,$02
B $CDDD,$01 Terminator.

t $CDDE Messaging: "You Can't"
@ $CDDE label=Messaging_YouCant
N $CDDE Print "#DECODESTR(#PC)".
B $CDDE,$01 "#DECODE(#PEEK(#PC))".
L $CDDE,$01,$06,$02
B $CDE4,$01 Terminator.

t $CDE5 Messaging: "O.K"
@ $CDE5 label=Messaging_OK
N $CDE5 Print "#DECODESTR(#PC)".
B $CDE5,$01 "#DECODE(#PEEK(#PC))".
L $CDE5,$01,$04,$02
B $CDE9,$01 Terminator.

t $CDEA Messaging: "You're Already Carrying It"
@ $CDEA label=Messaging_YoureAlreadyCarryingIt
N $CDEA Print "#DECODESTR(#PC)".
B $CDEA,$01 "#DECODE(#PEEK(#PC))".
L $CDEA,$01,$0D,$02
B $CDF7,$01 Terminator.

t $CDF8 Messaging: "You're Already Carrying Them"
@ $CDF8 label=Messaging_YoureAlreadyCarryingThem
N $CDF8 Print "#DECODESTR(#PC)".
B $CDF8,$01 "#DECODE(#PEEK(#PC))".
L $CDF8,$01,$0E,$02
B $CE06,$01 Terminator.

t $CE07 Messaging: "You're Not Carrying It"
@ $CE07 label=Messaging_YoureNotCarryingIt
N $CE07 Print "#DECODESTR(#PC)".
B $CE07,$01 "#DECODE(#PEEK(#PC))".
L $CE07,$01,$0B,$02
B $CE12,$01 Terminator.

t $CE13 Messaging: "You're Not Carrying Them"
@ $CE13 label=Messaging_YoureNotCarryingThem
N $CE13 Print "#DECODESTR(#PC)".
B $CE13,$01 "#DECODE(#PEEK(#PC))".
L $CE13,$01,$0C,$02
B $CE1F,$01 Terminator.

t $CE20 Messaging: "You Can't Carry Any More"
@ $CE20 label=Messaging_YouCantCarryAnyMore
N $CE20 Print "#DECODESTR(#PC)".
B $CE20,$01 "#DECODE(#PEEK(#PC))".
L $CE20,$01,$0C,$02
B $CE2C,$01 Terminator.

t $CE2D Messaging: "You're Not Carrying Anything"
@ $CE2D label=Messaging_YoureNotCarryingAnything
N $CE2D Print "#DECODESTR(#PC)".
B $CE2D,$01 "#DECODE(#PEEK(#PC))".
L $CE2D,$01,$0D,$02
B $CE3A,$01 Terminator.

t $CE3B Messaging: "You Are Carrying:-"
@ $CE3B label=Messaging_YouAreCarrying
N $CE3B Print "#DECODESTR(#PC)".
B $CE3B,$01 "#DECODE(#PEEK(#PC))".
L $CE3B,$01,$08,$02
B $CE43,$01 Terminator.

t $CE44 Messaging: "You Can't Go In That Direction"
@ $CE44 label=Messaging_YouCantGoInThatDirection
N $CE44 Print "#DECODESTR(#PC)".
B $CE44,$01 "#DECODE(#PEEK(#PC))".
L $CE44,$01,$11,$02
B $CE55,$01 Terminator.

t $CE56 Messaging: "I Don't See The Point"
@ $CE56 label=Messaging_IDontSeeThePoint
N $CE56 Print "#DECODESTR(#PC)".
B $CE56,$01 "#DECODE(#PEEK(#PC))".
L $CE56,$01,$0E,$02
B $CE64,$01 Terminator.

t $CE65 Messaging: "You Have Scored"
@ $CE65 label=Messaging_YouHaveScored
N $CE65 Print "#DECODESTR(#PC)".
B $CE65,$01 "#DECODE(#PEEK(#PC))".
L $CE65,$01,$08,$02
B $CE6D,$01 Terminator.

t $CE6E Messaging: "%"
@ $CE6E label=Messaging_Percentage
N $CE6E Print "#DECODESTR(#PC)".
B $CE6E,$01 "#DECODE(#PEEK(#PC))".
L $CE6E,$01,$02,$02
B $CE70,$01 Terminator.

t $CE71 Messaging: ""
N $CE71 Print "#DECODESTR(#PC)".
B $CE71,$01 "#DECODE(#PEEK(#PC))".
L $CE71,$01,$01,$02
B $CE72,$01 Terminator.
N $CE73 Print "#DECODESTR(#PC)".
B $CE73,$01 "#DECODE(#PEEK(#PC))".
L $CE73,$01,$01,$02
B $CE74,$01 Terminator.

t $CE75 Messaging: "North Street"
@ $CE75 label=Messaging_NorthStreet
N $CE75 Print "#DECODESTR(#PC)".
B $CE75,$01 "#DECODE(#PEEK(#PC))".
L $CE75,$01,$93,$02
B $CF08,$01 Terminator.

t $CF09 Messaging: "Columbus Avenue"
@ $CF09 label=Messaging_ColumbusAvenue
N $CF09 Print "#DECODESTR(#PC)".
B $CF09,$01 "#DECODE(#PEEK(#PC))".
L $CF09,$01,$45,$02
B $CF4E,$01 Terminator.

t $CF4F Messaging: "Darwin Street"
@ $CF4F label=Messaging_DarwinStreet
N $CF4F Print "#DECODESTR(#PC)".
B $CF4F,$01 "#DECODE(#PEEK(#PC))".
L $CF4F,$01,$AE,$02
B $CFFD,$01 Terminator.

t $CFFE Messaging: "The Lion Enclosure"
@ $CFFE label=Messaging_LionEnclosure
N $CFFE Print "#DECODESTR(#PC)".
B $CFFE,$01 "#DECODE(#PEEK(#PC))".
L $CFFE,$01,$72,$02
B $D070,$01 Terminator.

t $D071 Messaging: "The Monkey Cage"
@ $D071 label=Messaging_MonkeyCage
N $D071 Print "#DECODESTR(#PC)".
B $D071,$01 "#DECODE(#PEEK(#PC))".
L $D071,$01,$4B,$02
B $D0BC,$01 Terminator.

t $D0BD Messaging: "The Elephant House"
@ $D0BD label=Messaging_ElephantHouse
N $D0BD Print "#DECODESTR(#PC)".
B $D0BD,$01 "#DECODE(#PEEK(#PC))".
L $D0BD,$01,$73,$02
B $D130,$01 Terminator.

t $D131 Messaging: "Livingstone Square"
@ $D131 label=Messaging_LivingstoneSquare
N $D131 Print "#DECODESTR(#PC)".
B $D131,$01 "#DECODE(#PEEK(#PC))".
L $D131,$01,$7D,$02
B $D1AE,$01 Terminator.

t $D1AF Messaging: "Legion Parade"
@ $D1AF label=Messaging_LegionParade
N $D1AF Print "#DECODESTR(#PC)".
B $D1AF,$01 "#DECODE(#PEEK(#PC))".
L $D1AF,$01,$6E,$02
B $D21D,$01 Terminator.

t $D21E Messaging: "Parkview Road"
@ $D21E label=Messaging_ParkviewRoad
N $D21E Print "#DECODESTR(#PC)".
B $D21E,$01 "#DECODE(#PEEK(#PC))".
L $D21E,$01,$78,$02
B $D296,$01 Terminator.

t $D297 Messaging: "The Zoo Entrance"
@ $D297 label=Messaging_ZooEntrance
N $D297 Print "#DECODESTR(#PC)".
B $D297,$01 "#DECODE(#PEEK(#PC))".
L $D297,$01,$5B,$02
B $D2F2,$01 Terminator.

t $D2F3 Messaging: "The Park Area"
@ $D2F3 label=Messaging_ParkArea
N $D2F3 Print "#DECODESTR(#PC)".
B $D2F3,$01 "#DECODE(#PEEK(#PC))".
L $D2F3,$01,$A5,$02
B $D398,$01 Terminator.

t $D399 Messaging: "The Insect House"
@ $D399 label=Messaging_InsectHouse
N $D399 Print "#DECODESTR(#PC)".
B $D399,$01 "#DECODE(#PEEK(#PC))".
L $D399,$01,$56,$02
B $D3EF,$01 Terminator.

t $D3F0 Messaging: "Jessop Street"
@ $D3F0 label=Messaging_JessopStreet
N $D3F0 Print "#DECODESTR(#PC)".
B $D3F0,$01 "#DECODE(#PEEK(#PC))".
L $D3F0,$01,$74,$02
B $D464,$01 Terminator.

t $D465 Messaging: "Clarence Square"
@ $D465 label=Messaging_ClarenceSquare
N $D465 Print "#DECODESTR(#PC)".
B $D465,$01 "#DECODE(#PEEK(#PC))".
L $D465,$01,$84,$02
B $D4E9,$01 Terminator.

t $D4EA Messaging: "The Reptile House"
@ $D4EA label=Messaging_ReptileHouse
N $D4EA Print "#DECODESTR(#PC)".
B $D4EA,$01 "#DECODE(#PEEK(#PC))".
L $D4EA,$01,$7F,$02
B $D569,$01 Terminator.

t $D56A Messaging: "The Circus Tent"
@ $D56A label=Messaging_CircusTent
N $D56A Print "#DECODESTR(#PC)".
B $D56A,$01 "#DECODE(#PEEK(#PC))".
L $D56A,$01,$81,$02
B $D5EB,$01 Terminator.

t $D5EC Messaging: "The Bear Cage"
@ $D5EC label=Messaging_BearCage
N $D5EC Print "#DECODESTR(#PC)".
B $D5EC,$01 "#DECODE(#PEEK(#PC))".
L $D5EC,$01,$54,$02
B $D640,$01 Terminator.

t $D641 Messaging: "The Roof Of An Apartment Block"
@ $D641 label=Messaging_ApartmentBlockRoof
N $D641 Print "#DECODESTR(#PC)".
B $D641,$01 "#DECODE(#PEEK(#PC))".
L $D641,$01,$57,$02
B $D698,$01 Terminator.

t $D699 Messaging: "The Parapet"
@ $D699 label=Messaging_Parapet
N $D699 Print "#DECODESTR(#PC)".
B $D699,$01 "#DECODE(#PEEK(#PC))".
L $D699,$01,$61,$02
B $D6FA,$01 Terminator.

t $D6FB Messaging: "The Roof Of The Old Building"
@ $D6FB label=Messaging_OldBuildingRoof
N $D6FB Print "#DECODESTR(#PC)".
B $D6FB,$01 "#DECODE(#PEEK(#PC))".
L $D6FB,$01,$8F,$02
B $D78A,$01 Terminator.

t $D78B Messaging: "Cook Street"
@ $D78B label=Messaging_CookStreet
N $D78B Print "#DECODESTR(#PC)".
B $D78B,$01 "#DECODE(#PEEK(#PC))".
L $D78B,$01,$C1,$02
B $D84C,$01 Terminator.

t $D84D Messaging: "Cook Street Underground Station"
@ $D84D label=Messaging_CookStreetUndergroundStation
N $D84D Print "#DECODESTR(#PC)".
B $D84D,$01 "#DECODE(#PEEK(#PC))".
L $D84D,$01,$92,$02
B $D8DF,$01 Terminator.

t $D8E0 Messaging: "Byron Square Underground Station"
@ $D8E0 label=Messaging_ByronSquareUndergroundStation
N $D8E0 Print "#DECODESTR(#PC)".
B $D8E0,$01 "#DECODE(#PEEK(#PC))".
L $D8E0,$01,$71,$02
B $D951,$01 Terminator.

t $D952 Messaging: "Byron Square"
@ $D952 label=Messaging_ByronSquare
N $D952 Print "#DECODESTR(#PC)".
B $D952,$01 "#DECODE(#PEEK(#PC))".
L $D952,$01,$6B,$02
B $D9BD,$01 Terminator.

t $D9BE Messaging: "Virgil Close"
@ $D9BE label=Messaging_VirgilClose
N $D9BE Print "#DECODESTR(#PC)".
B $D9BE,$01 "#DECODE(#PEEK(#PC))".
L $D9BE,$01,$30,$02
B $D9EE,$01 Terminator.

t $D9EF Messaging: "A Corridor"
@ $D9EF label=Messaging_Corridor
N $D9EF Print "#DECODESTR(#PC)".
B $D9EF,$01 "#DECODE(#PEEK(#PC))".
L $D9EF,$01,$41,$02
B $DA30,$01 Terminator.

t $DA31 Messaging: "The Kitchen"
@ $DA31 label=Messaging_Kitchen
N $DA31 Print "#DECODESTR(#PC)".
B $DA31,$01 "#DECODE(#PEEK(#PC))".
L $DA31,$01,$76,$02
B $DAA7,$01 Terminator.

t $DAA8 Messaging: "Scott Street"
@ $DAA8 label=Messaging_ScottStreet
N $DAA8 Print "#DECODESTR(#PC)".
B $DAA8,$01 "#DECODE(#PEEK(#PC))".
L $DAA8,$01,$9F,$02
B $DB47,$01 Terminator.

t $DB48 Messaging: "The Storm Drain"
@ $DB48 label=Messaging_StormDrain
N $DB48 Print "#DECODESTR(#PC)".
B $DB48,$01 "#DECODE(#PEEK(#PC))".
L $DB48,$01,$89,$02
B $DBD1,$01 Terminator.

t $DBD2 Messaging: "Shakespeare Avenue"
@ $DBD2 label=Messaging_ShakespeareAvenue
N $DBD2 Print "#DECODESTR(#PC)".
B $DBD2,$01 "#DECODE(#PEEK(#PC))".
L $DBD2,$01,$5F,$02
B $DC31,$01 Terminator.

t $DC32 Messaging: "Burns Road"
@ $DC32 label=Messaging_BurnsRoad
N $DC32 Print "#DECODESTR(#PC)".
B $DC32,$01 "#DECODE(#PEEK(#PC))".
L $DC32,$01,$D4,$02
B $DD06,$01 Terminator.

t $DD07 Messaging: "An Apartment Block"
@ $DD07 label=Messaging_ApartmentBlock
N $DD07 Print "#DECODESTR(#PC)".
B $DD07,$01 "#DECODE(#PEEK(#PC))".
L $DD07,$01,$39,$02
B $DD40,$01 Terminator.

t $DD41 Messaging: "The West Wing"
@ $DD41 label=Messaging_WestWing
N $DD41 Print "#DECODESTR(#PC)".
B $DD41,$01 "#DECODE(#PEEK(#PC))".
L $DD41,$01,$20,$02
B $DD61,$01 Terminator.

t $DD62 Messaging: "The Western End Of The Dining Room"
@ $DD62 label=Messaging_DiningRoomWesternEnd
N $DD62 Print "#DECODESTR(#PC)".
B $DD62,$01 "#DECODE(#PEEK(#PC))".
L $DD62,$01,$21,$02
B $DD83,$01 Terminator.

t $DD84 Messaging: "The Eastern End Of The Dining Room"
@ $DD84 label=Messaging_DiningRoomEasternEnd
N $DD84 Print "#DECODESTR(#PC)".
B $DD84,$01 "#DECODE(#PEEK(#PC))".
L $DD84,$01,$5A,$02
B $DDDE,$01 Terminator.

t $DDDF Messaging: "The East Wing"
@ $DDDF label=Messaging_EastWing
N $DDDF Print "#DECODESTR(#PC)".
B $DDDF,$01 "#DECODE(#PEEK(#PC))".
L $DDDF,$01,$48,$02
B $DE27,$01 Terminator.

t $DE28 Messaging: "Royal Street"
@ $DE28 label=Messaging_RoyalStreet
N $DE28 Print "#DECODESTR(#PC)".
B $DE28,$01 "#DECODE(#PEEK(#PC))".
L $DE28,$01,$A6,$02
B $DECE,$01 Terminator.

t $DECF Messaging: "Manor Drive"
@ $DECF label=Messaging_ManorDrive
N $DECF Print "#DECODESTR(#PC)".
B $DECF,$01 "#DECODE(#PEEK(#PC))".
L $DECF,$01,$63,$02
B $DF32,$01 Terminator.

t $DF33 Messaging: "Waste Ground"
@ $DF33 label=Messaging_WasteGround
N $DF33 Print "#DECODESTR(#PC)".
B $DF33,$01 "#DECODE(#PEEK(#PC))".
L $DF33,$01,$46,$02
B $DF79,$01 Terminator.

t $DF7A Messaging: "The Filling Station"
@ $DF7A label=Messaging_FillingStation
N $DF7A Print "#DECODESTR(#PC)".
B $DF7A,$01 "#DECODE(#PEEK(#PC))".
L $DF7A,$01,$83,$02
B $DFFD,$01 Terminator.

t $DFFE Messaging: "East Street"
@ $DFFE label=Messaging_EastStreet
N $DFFE Print "#DECODESTR(#PC)".
B $DFFE,$01 "#DECODE(#PEEK(#PC))".
L $DFFE,$01,$6F,$02
B $E06D,$01 Terminator.

t $E06E Messaging: "Castle Road"
@ $E06E label=Messaging_CastleRoad
N $E06E Print "#DECODESTR(#PC)".
B $E06E,$01 "#DECODE(#PEEK(#PC))".
L $E06E,$01,$4B,$02
B $E0B9,$01 Terminator.

t $E0BA Messaging: "The Desert Road"
@ $E0BA label=Messaging_DesertRoad
N $E0BA Print "#DECODESTR(#PC)".
B $E0BA,$01 "#DECODE(#PEEK(#PC))".
L $E0BA,$01,$95,$02
B $E14F,$01 Terminator.

t $E150 Messaging: "The Gatehouse"
@ $E150 label=Messaging_TheGatehouse
N $E150 Print "#DECODESTR(#PC)".
B $E150,$01 "#DECODE(#PEEK(#PC))".
L $E150,$01,$2E,$02
B $E17E,$01 Terminator.

t $E17F Messaging: "The Hallway Of A Derelict House"
@ $E17F label=Messaging_DerelictHouseHallway
N $E17F Print "#DECODESTR(#PC)".
B $E17F,$01 "#DECODE(#PEEK(#PC))".
L $E17F,$01,$45,$02
B $E1C4,$01 Terminator.

t $E1C5 Messaging: "An Overgrown Garden"
@ $E1C5 label=Messaging_OvergrownGarden
N $E1C5 Print "#DECODESTR(#PC)".
B $E1C5,$01 "#DECODE(#PEEK(#PC))".
L $E1C5,$01,$7A,$02
B $E23F,$01 Terminator.

t $E240 Messaging: "Kings Close"
@ $E240 label=Messaging_KingsClose
N $E240 Print "#DECODESTR(#PC)".
B $E240,$01 "#DECODE(#PEEK(#PC))".
L $E240,$01,$B4,$02
B $E2F4,$01 Terminator.

t $E2F5 Messaging: "South Way"
@ $E2F5 label=Messaging_SouthWay
N $E2F5 Print "#DECODESTR(#PC)".
B $E2F5,$01 "#DECODE(#PEEK(#PC))".
L $E2F5,$01,$D1,$02
B $E3C6,$01 Terminator.

t $E3C7 Messaging: "The Western Office"
@ $E3C7 label=Messaging_WesternOffice
N $E3C7 Print "#DECODESTR(#PC)".
B $E3C7,$01 "#DECODE(#PEEK(#PC))".
L $E3C7,$01,$37,$02
B $E3FE,$01 Terminator.

t $E3FF Messaging: "A Corridor"
@ $E3FF label=Messaging__Corridor
N $E3FF Print "#DECODESTR(#PC)".
B $E3FF,$01 "#DECODE(#PEEK(#PC))".
L $E3FF,$01,$13,$02
B $E412,$01 Terminator.

t $E413 Messaging: "The Reception Area"
@ $E413 label=Messaging_ReceptionArea
N $E413 Print "#DECODESTR(#PC)".
B $E413,$01 "#DECODE(#PEEK(#PC))".
L $E413,$01,$5F,$02
B $E472,$01 Terminator.

t $E473 Messaging: "A Corridor"
@ $E473 label=Messaging_CorridorOfficesAtEasternEnd
N $E473 Print "#DECODESTR(#PC)".
B $E473,$01 "#DECODE(#PEEK(#PC))".
L $E473,$01,$1C,$02
B $E48F,$01 Terminator.

t $E490 Messaging: "The Eastern Office"
@ $E490 label=Messaging_EasternOffice
N $E490 Print "#DECODESTR(#PC)".
B $E490,$01 "#DECODE(#PEEK(#PC))".
L $E490,$01,$4C,$02
B $E4DC,$01 Terminator.

t $E4DD Messaging: "South Way"
@ $E4DD label=Messaging__SouthWay
N $E4DD Print "#DECODESTR(#PC)".
B $E4DD,$01 "#DECODE(#PEEK(#PC))".
L $E4DD,$01,$7D,$02
B $E55A,$01 Terminator.

t $E55B Messaging: "The Control Room"
@ $E55B label=Messaging_ControlRoom
N $E55B Print "#DECODESTR(#PC)".
B $E55B,$01 "#DECODE(#PEEK(#PC))".
L $E55B,$01,$E9,$02
B $E644,$01 Terminator.

t $E645 Messaging: "The Maintenance Area"
@ $E645 label=Messaging_MaintenanceArea
N $E645 Print "#DECODESTR(#PC)".
B $E645,$01 "#DECODE(#PEEK(#PC))".
L $E645,$01,$88,$02
B $E6CD,$01 Terminator.

t $E6CE Messaging: "Cactus Drive"
@ $E6CE label=Messaging_CactusDrive
N $E6CE Print "#DECODESTR(#PC)".
B $E6CE,$01 "#DECODE(#PEEK(#PC))".
L $E6CE,$01,$2E,$02
B $E6FC,$01 Terminator.

t $E6FD Messaging: "The Reactor Service Corridor"
@ $E6FD label=Messaging_ReactorServiceCorridor
N $E6FD Print "#DECODESTR(#PC)".
B $E6FD,$01 "#DECODE(#PEEK(#PC))".
L $E6FD,$01,$65,$02
B $E762,$01 Terminator.

t $E763 Messaging: "The Reactor Room"
@ $E763 label=Messaging_ReactorRoom
N $E763 Print "#DECODESTR(#PC)".
B $E763,$01 "#DECODE(#PEEK(#PC))".
L $E763,$01,$B4,$02
B $E817,$01 Terminator.

t $E818 Messaging: "A Corridor"
@ $E818 label=Messaging_CorridorMaintenanceAccess
N $E818 Print "#DECODESTR(#PC)".
B $E818,$01 "#DECODE(#PEEK(#PC))".
L $E818,$01,$2F,$02
B $E847,$01 Terminator.

t $E848 Messaging: "The Storage Yard"
@ $E848 label=Messaging_StorageYard
N $E848 Print "#DECODESTR(#PC)".
B $E848,$01 "#DECODE(#PEEK(#PC))".
L $E848,$01,$38,$02
B $E880,$01 Terminator.

t $E881 Messaging: "Congratulations!!!"
@ $E881 label=Messaging_Congratulations
N $E881 Print "#DECODESTR(#PC)".
B $E881,$01 "#DECODE(#PEEK(#PC))".
L $E881,$01,$BC,$02
B $E93D,$01 Terminator.

t $E93E Messaging: "The Office Roof"
@ $E93E label=Messaging_OfficeRoof
N $E93E Print "#DECODESTR(#PC)".
B $E93E,$01 "#DECODE(#PEEK(#PC))".
L $E93E,$01,$7B,$02
B $E9B9,$01 Terminator.

t $E9BA Messaging: "The Top Of The Lift Shaft"
@ $E9BA label=Messaging_LiftShaftTop
N $E9BA Print "#DECODESTR(#PC)".
B $E9BA,$01 "#DECODE(#PEEK(#PC))".
L $E9BA,$01,$33,$02
B $E9ED,$01 Terminator.

t $E9EE Messaging: "The Stairs"
@ $E9EE label=Messaging_Stairs
N $E9EE Print "#DECODESTR(#PC)".
B $E9EE,$01 "#DECODE(#PEEK(#PC))".
L $E9EE,$01,$2F,$02
B $EA1D,$01 Terminator.

t $EA1E Messaging: "The Stairwell"
@ $EA1E label=Messaging_Stairwell
N $EA1E Print "#DECODESTR(#PC)".
B $EA1E,$01 "#DECODE(#PEEK(#PC))".
L $EA1E,$01,$4F,$02
B $EA6D,$01 Terminator.

t $EA6E Messaging: "On Top Of A Lift"
@ $EA6E label=Messaging_TopOfLift
N $EA6E Print "#DECODESTR(#PC)".
B $EA6E,$01 "#DECODE(#PEEK(#PC))".
L $EA6E,$01,$66,$02
B $EAD4,$01 Terminator.

t $EAD5 Messaging: "Your Office"
@ $EAD5 label=Messaging_YourOffice
N $EAD5 Print "#DECODESTR(#PC)".
B $EAD5,$01 "#DECODE(#PEEK(#PC))".
L $EAD5,$01,$E4,$02
B $EBB9,$01 Terminator.

t $EBBA Messaging: "The Main Office"
@ $EBBA label=Messaging_MainOffice
N $EBBA Print "#DECODESTR(#PC)".
B $EBBA,$01 "#DECODE(#PEEK(#PC))".
L $EBBA,$01,$5E,$02
B $EC18,$01 Terminator.

t $EC19 Messaging: "The Lift"
@ $EC19 label=Messaging_TheLift
N $EC19 Print "#DECODESTR(#PC)".
B $EC19,$01 "#DECODE(#PEEK(#PC))".
L $EC19,$01,$87,$02
B $ECA0,$01 Terminator.

t $ECA1 Messaging: "The Bottom Of The Lift Shaft"
@ $ECA1 label=Messaging_LiftShaftBottom
N $ECA1 Print "#DECODESTR(#PC)".
B $ECA1,$01 "#DECODE(#PEEK(#PC))".
L $ECA1,$01,$3F,$02
B $ECE0,$01 Terminator.

t $ECE1 Messaging: "An Alley"
@ $ECE1 label=Messaging_Alley
N $ECE1 Print "#DECODESTR(#PC)".
B $ECE1,$01 "#DECODE(#PEEK(#PC))".
L $ECE1,$01,$32,$02
B $ED13,$01 Terminator.

t $ED14 Messaging: "The Washroom"
@ $ED14 label=Messaging_Washroom
N $ED14 Print "#DECODESTR(#PC)".
B $ED14,$01 "#DECODE(#PEEK(#PC))".
L $ED14,$01,$55,$02
B $ED69,$01 Terminator.

t $ED6A Messaging: "The Utility Room"
@ $ED6A label=Messaging_UtilityRoom
N $ED6A Print "#DECODESTR(#PC)".
B $ED6A,$01 "#DECODE(#PEEK(#PC))".
L $ED6A,$01,$55,$02
B $EDBF,$01 Terminator.

t $EDC0 Messaging: "The Basement"
@ $EDC0 label=Messaging_Basement
N $EDC0 Print "#DECODESTR(#PC)".
B $EDC0,$01 "#DECODE(#PEEK(#PC))".
L $EDC0,$01,$25,$02
B $EDE5,$01 Terminator.

t $EDE6 Messaging: "The Service Tunnel"
@ $EDE6 label=Messaging_ServiceTunnel
N $EDE6 Print "#DECODESTR(#PC)".
B $EDE6,$01 "#DECODE(#PEEK(#PC))".
L $EDE6,$01,$56,$02
B $EE3C,$01 Terminator.

t $EE3D Messaging: "The Service Tunnel"
@ $EE3D label=Messaging_ServiceTunnelEasternEnd
N $EE3D Print "#DECODESTR(#PC)".
B $EE3D,$01 "#DECODE(#PEEK(#PC))".
L $EE3D,$01,$2E,$02
B $EE6B,$01 Terminator.

t $EE6C Messaging: "The Sewer"
@ $EE6C label=Messaging_Sewer
N $EE6C Print "#DECODESTR(#PC)".
B $EE6C,$01 "#DECODE(#PEEK(#PC))".
L $EE6C,$01,$37,$02
B $EEA3,$01 Terminator.

t $EEA4 Messaging: "Inside The Kiosk"
@ $EEA4 label=Messaging_InsideKiosk
N $EEA4 Print "#DECODESTR(#PC)".
B $EEA4,$01 "#DECODE(#PEEK(#PC))".
L $EEA4,$01,$55,$02
B $EEF9,$01 Terminator.

t $EEFA Messaging: ""
N $EEFA Print "#DECODESTR(#PC)".
B $EEFA,$01 "#DECODE(#PEEK(#PC))".
L $EEFA,$01,$01,$02
B $EEFB,$01 Terminator.

t $EEFC Messaging: ""
N $EEFC Print "#DECODESTR(#PC)".
B $EEFC,$01 "#DECODE(#PEEK(#PC))".
L $EEFC,$01,$01,$02
B $EEFD,$01 Terminator.

t $EEFE Messaging: ""
N $EEFE Print "#DECODESTR(#PC)".
B $EEFE,$01 "#DECODE(#PEEK(#PC))".
L $EEFE,$01,$01,$02
B $EEFF,$01 Terminator.

t $EF00 Messaging: ""
N $EF00 Print "#DECODESTR(#PC)".
B $EF00,$01 "#DECODE(#PEEK(#PC))".
L $EF00,$01,$01,$02
B $EF01,$01 Terminator.

t $EF02 Messaging: ""
N $EF02 Print "#DECODESTR(#PC)".
B $EF02,$01 "#DECODE(#PEEK(#PC))".
L $EF02,$01,$01,$02
B $EF03,$01 Terminator.

t $EF04 Messaging: ""
N $EF04 Print "#DECODESTR(#PC)".
B $EF04,$01 "#DECODE(#PEEK(#PC))".
L $EF04,$01,$01,$02
B $EF05,$01 Terminator.

t $EF06 Messaging: "A Plate"
@ $EF06 label=Messaging_Plate
N $EF06 Print "#DECODESTR(#PC)".
B $EF06,$01 "#DECODE(#PEEK(#PC))".
L $EF06,$01,$05,$02
B $EF0B,$01 Terminator.

t $EF0C Messaging: "A Diamond"
@ $EF0C label=Messaging_Diamond
N $EF0C Print "#DECODESTR(#PC)".
B $EF0C,$01 "#DECODE(#PEEK(#PC))".
L $EF0C,$01,$06,$02
B $EF12,$01 Terminator.

t $EF13 Messaging: "Any Bodies"
@ $EF13 label=Messaging_AnyBodies
N $EF13 Print "#DECODESTR(#PC)".
B $EF13,$01 "#DECODE(#PEEK(#PC))".
L $EF13,$01,$05,$02
B $EF18,$01 Terminator.

t $EF19 Messaging: "A Tanker"
@ $EF19 label=Messaging_Tanker
N $EF19 Print "#DECODESTR(#PC)".
B $EF19,$01 "#DECODE(#PEEK(#PC))".
L $EF19,$01,$05,$02
B $EF1E,$01 Terminator.

t $EF1F Messaging: "Any Oil"
@ $EF1F label=Messaging_AnyOil
N $EF1F Print "#DECODESTR(#PC)".
B $EF1F,$01 "#DECODE(#PEEK(#PC))".
L $EF1F,$01,$03,$02
B $EF22,$01 Terminator.

t $EF23 Messaging: "Any Lions"
@ $EF23 label=Messaging_AnyLions
N $EF23 Print "#DECODESTR(#PC)".
B $EF23,$01 "#DECODE(#PEEK(#PC))".
L $EF23,$01,$04,$02
B $EF27,$01 Terminator.

t $EF28 Messaging: "A Cage"
@ $EF28 label=Messaging_Cage
N $EF28 Print "#DECODESTR(#PC)".
B $EF28,$01 "#DECODE(#PEEK(#PC))".
L $EF28,$01,$04,$02
B $EF2C,$01 Terminator.

t $EF2D Messaging: "A Monkey"
@ $EF2D label=Messaging_Monkey
N $EF2D Print "#DECODESTR(#PC)".
B $EF2D,$01 "#DECODE(#PEEK(#PC))".
L $EF2D,$01,$05,$02
B $EF32,$01 Terminator.

t $EF33 Messaging: "Any Fruit"
@ $EF33 label=Messaging_AnyFruit
N $EF33 Print "#DECODESTR(#PC)".
B $EF33,$01 "#DECODE(#PEEK(#PC))".
L $EF33,$01,$04,$02
B $EF37,$01 Terminator.

t $EF38 Messaging: "Any Meat"
@ $EF38 label=Messaging_AnyMeat
N $EF38 Print "#DECODESTR(#PC)".
B $EF38,$01 "#DECODE(#PEEK(#PC))".
L $EF38,$01,$04,$02
B $EF3C,$01 Terminator.

t $EF3D Messaging: "A Shop"
@ $EF3D label=Messaging_Shop
N $EF3D Print "#DECODESTR(#PC)".
B $EF3D,$01 "#DECODE(#PEEK(#PC))".
L $EF3D,$01,$03,$02
B $EF40,$01 Terminator.

t $EF41 Messaging: "A Television"
@ $EF41 label=Messaging_Television
N $EF41 Print "#DECODESTR(#PC)".
B $EF41,$01 "#DECODE(#PEEK(#PC))".
L $EF41,$01,$06,$02
B $EF47,$01 Terminator.

t $EF48 Messaging: "A Gate"
@ $EF48 label=Messaging_Gate
N $EF48 Print "#DECODESTR(#PC)".
B $EF48,$01 "#DECODE(#PEEK(#PC))".
L $EF48,$01,$04,$02
B $EF4C,$01 Terminator.

t $EF4D Messaging: "A Bin"
@ $EF4D label=Messaging_Bin
N $EF4D Print "#DECODESTR(#PC)".
B $EF4D,$01 "#DECODE(#PEEK(#PC))".
L $EF4D,$01,$03,$02
B $EF50,$01 Terminator.

t $EF51 Messaging: "A Bottle"
@ $EF51 label=Messaging_Bottle
N $EF51 Print "#DECODESTR(#PC)".
B $EF51,$01 "#DECODE(#PEEK(#PC))".
L $EF51,$01,$05,$02
B $EF56,$01 Terminator.

t $EF57 Messaging: "Any Insects"
@ $EF57 label=Messaging_AnyInsects
N $EF57 Print "#DECODESTR(#PC)".
B $EF57,$01 "#DECODE(#PEEK(#PC))".
L $EF57,$01,$05,$02
B $EF5C,$01 Terminator.

t $EF5D Messaging: "A Car"
@ $EF5D label=Messaging_Car
N $EF5D Print "#DECODESTR(#PC)".
B $EF5D,$01 "#DECODE(#PEEK(#PC))".
L $EF5D,$01,$02,$02
B $EF5F,$01 Terminator.

t $EF60 Messaging: "A Stick"
@ $EF60 label=Messaging_Stick
N $EF60 Print "#DECODESTR(#PC)".
B $EF60,$01 "#DECODE(#PEEK(#PC))".
L $EF60,$01,$04,$02
B $EF64,$01 Terminator.

t $EF65 Messaging: "A Statue"
@ $EF65 label=Messaging_Statue
N $EF65 Print "#DECODESTR(#PC)".
B $EF65,$01 "#DECODE(#PEEK(#PC))".
L $EF65,$01,$05,$02
B $EF6A,$01 Terminator.

t $EF6B Messaging: "An Alligator"
@ $EF6B label=Messaging_Alligator
N $EF6B Print "#DECODESTR(#PC)".
B $EF6B,$01 "#DECODE(#PEEK(#PC))".
L $EF6B,$01,$06,$02
B $EF71,$01 Terminator.

t $EF72 Messaging: "A Tent"
@ $EF72 label=Messaging_Tent
N $EF72 Print "#DECODESTR(#PC)".
B $EF72,$01 "#DECODE(#PEEK(#PC))".
L $EF72,$01,$03,$02
B $EF75,$01 Terminator.

t $EF76 Messaging: "A Bear"
@ $EF76 label=Messaging_Bear
N $EF76 Print "#DECODESTR(#PC)".
B $EF76,$01 "#DECODE(#PEEK(#PC))".
L $EF76,$01,$03,$02
B $EF79,$01 Terminator.

t $EF7A Messaging: "An Elephant"
@ $EF7A label=Messaging_Elephant
N $EF7A Print "#DECODESTR(#PC)".
B $EF7A,$01 "#DECODE(#PEEK(#PC))".
L $EF7A,$01,$07,$02
B $EF81,$01 Terminator.

t $EF82 Messaging: "A Ramp"
@ $EF82 label=Messaging_Ramp
N $EF82 Print "#DECODESTR(#PC)".
B $EF82,$01 "#DECODE(#PEEK(#PC))".
L $EF82,$01,$04,$02
B $EF86,$01 Terminator.

t $EF87 Messaging: "A Parapet"
@ $EF87 label=Messaging__Parapet
N $EF87 Print "#DECODESTR(#PC)".
B $EF87,$01 "#DECODE(#PEEK(#PC))".
L $EF87,$01,$04,$02
B $EF8B,$01 Terminator.

t $EF8C Messaging: "A Roof"
@ $EF8C label=Messaging_Roof
N $EF8C Print "#DECODESTR(#PC)".
B $EF8C,$01 "#DECODE(#PEEK(#PC))".
L $EF8C,$01,$03,$02
B $EF8F,$01 Terminator.

t $EF90 Messaging: "Any Stairs"
@ $EF90 label=Messaging_AnyStairs
N $EF90 Print "#DECODESTR(#PC)".
B $EF90,$01 "#DECODE(#PEEK(#PC))".
L $EF90,$01,$05,$02
B $EF95,$01 Terminator.

t $EF96 Messaging: "A Nail"
@ $EF96 label=Messaging_Nail
N $EF96 Print "#DECODESTR(#PC)".
B $EF96,$01 "#DECODE(#PEEK(#PC))".
L $EF96,$01,$04,$02
B $EF9A,$01 Terminator.

t $EF9B Messaging: "A Cap"
@ $EF9B label=Messaging_Cap
N $EF9B Print "#DECODESTR(#PC)".
B $EF9B,$01 "#DECODE(#PEEK(#PC))".
L $EF9B,$01,$03,$02
B $EF9E,$01 Terminator.

t $EF9F Messaging: "A Trumpet"
@ $EF9F label=Messaging_Trumpet
N $EF9F Print "#DECODESTR(#PC)".
B $EF9F,$01 "#DECODE(#PEEK(#PC))".
L $EF9F,$01,$05,$02
B $EFA4,$01 Terminator.

t $EFA5 Messaging: "Any Adverts"
@ $EFA5 label=Messaging_Adverts
N $EFA5 Print "#DECODESTR(#PC)".
B $EFA5,$01 "#DECODE(#PEEK(#PC))".
L $EFA5,$01,$05,$02
B $EFAA,$01 Terminator.

t $EFAB Messaging: "A Tunnel"
@ $EFAB label=Messaging_Tunnel
N $EFAB Print "#DECODESTR(#PC)".
B $EFAB,$01 "#DECODE(#PEEK(#PC))".
L $EFAB,$01,$05,$02
B $EFB0,$01 Terminator.

t $EFB1 Messaging: "Any Water"
@ $EFB1 label=Messaging_Water
N $EFB1 Print "#DECODESTR(#PC)".
B $EFB1,$01 "#DECODE(#PEEK(#PC))".
L $EFB1,$01,$04,$02
B $EFB5,$01 Terminator.

t $EFB6 Messaging: "Any Graffiti"
@ $EFB6 label=Messaging_Graffiti
N $EFB6 Print "#DECODESTR(#PC)".
B $EFB6,$01 "#DECODE(#PEEK(#PC))".
L $EFB6,$01,$07,$02
B $EFBD,$01 Terminator.

t $EFBE Messaging: "A Ticket"
@ $EFBE label=Messaging_Ticket
N $EFBE Print "#DECODESTR(#PC)".
B $EFBE,$01 "#DECODE(#PEEK(#PC))".
L $EFBE,$01,$05,$02
B $EFC3,$01 Terminator.

t $EFC4 Messaging: "A Ladder"
@ $EFC4 label=Messaging_Ladder
N $EFC4 Print "#DECODESTR(#PC)".
B $EFC4,$01 "#DECODE(#PEEK(#PC))".
L $EFC4,$01,$05,$02
B $EFC9,$01 Terminator.

t $EFCA Messaging: "A Doll"
@ $EFCA label=Messaging_Doll
N $EFCA Print "#DECODESTR(#PC)".
B $EFCA,$01 "#DECODE(#PEEK(#PC))".
L $EFCA,$01,$04,$02
B $EFCE,$01 Terminator.

t $EFCF Messaging: "A Garden"
@ $EFCF label=Messaging_Garden
N $EFCF Print "#DECODESTR(#PC)".
B $EFCF,$01 "#DECODE(#PEEK(#PC))".
L $EFCF,$01,$04,$02
B $EFD3,$01 Terminator.

t $EFD4 Messaging: "Any Soldiers"
@ $EFD4 label=Messaging_Soldiers
N $EFD4 Print "#DECODESTR(#PC)".
B $EFD4,$01 "#DECODE(#PEEK(#PC))".
L $EFD4,$01,$07,$02
B $EFDB,$01 Terminator.

t $EFDC Messaging: "Any Looters"
@ $EFDC label=Messaging_Looters
N $EFDC Print "#DECODESTR(#PC)".
B $EFDC,$01 "#DECODE(#PEEK(#PC))".
L $EFDC,$01,$05,$02
B $EFE1,$01 Terminator.

t $EFE2 Messaging: "Any Rubble"
@ $EFE2 label=Messaging_Rubble
N $EFE2 Print "#DECODESTR(#PC)".
B $EFE2,$01 "#DECODE(#PEEK(#PC))".
L $EFE2,$01,$05,$02
B $EFE7,$01 Terminator.

t $EFE8 Messaging: "A Kiosk"
@ $EFE8 label=Messaging_Kiosk
N $EFE8 Print "#DECODESTR(#PC)".
B $EFE8,$01 "#DECODE(#PEEK(#PC))".
L $EFE8,$01,$06,$02
B $EFEE,$01 Terminator.

t $EFEF Messaging: "Any Petrol"
@ $EFEF label=Messaging_Petrol
N $EFEF Print "#DECODESTR(#PC)".
B $EFEF,$01 "#DECODE(#PEEK(#PC))".
L $EFEF,$01,$05,$02
B $EFF4,$01 Terminator.

t $EFF5 Messaging: "The Desert"
@ $EFF5 label=Messaging_Desert
N $EFF5 Print "#DECODESTR(#PC)".
B $EFF5,$01 "#DECODE(#PEEK(#PC))".
L $EFF5,$01,$05,$02
B $EFFA,$01 Terminator.

t $EFFB Messaging: "Any Tumbleweed"
@ $EFFB label=Messaging_Tumbleweed
N $EFFB Print "#DECODESTR(#PC)".
B $EFFB,$01 "#DECODE(#PEEK(#PC))".
L $EFFB,$01,$09,$02
B $F004,$01 Terminator.

t $F005 Messaging: "A Horse"
@ $F005 label=Messaging_Horse
N $F005 Print "#DECODESTR(#PC)".
B $F005,$01 "#DECODE(#PEEK(#PC))".
L $F005,$01,$04,$02
B $F009,$01 Terminator.

t $F00A Messaging: "A Swing"
@ $F00A label=Messaging_Swing
N $F00A Print "#DECODESTR(#PC)".
B $F00A,$01 "#DECODE(#PEEK(#PC))".
L $F00A,$01,$04,$02
B $F00E,$01 Terminator.

t $F00F Messaging: "A Beam"
@ $F00F label=Messaging_Beam
N $F00F Print "#DECODESTR(#PC)".
B $F00F,$01 "#DECODE(#PEEK(#PC))".
L $F00F,$01,$03,$02
B $F012,$01 Terminator.

t $F013 Messaging: "A Door"
@ $F013 label=Messaging_Door
N $F013 Print "#DECODESTR(#PC)".
B $F013,$01 "#DECODE(#PEEK(#PC))".
L $F013,$01,$04,$02
B $F017,$01 Terminator.

t $F018 Messaging: "Any Trees"
@ $F018 label=Messaging_Trees
N $F018 Print "#DECODESTR(#PC)".
B $F018,$01 "#DECODE(#PEEK(#PC))".
L $F018,$01,$04,$02
B $F01C,$01 Terminator.

t $F01D Messaging: "Any Weeds"
@ $F01D label=Messaging_Weeds
N $F01D Print "#DECODESTR(#PC)".
B $F01D,$01 "#DECODE(#PEEK(#PC))".
L $F01D,$01,$05,$02
B $F022,$01 Terminator.

t $F023 Messaging: "A Wall"
@ $F023 label=Messaging_Wall
N $F023 Print "#DECODESTR(#PC)".
B $F023,$01 "#DECODE(#PEEK(#PC))".
L $F023,$01,$03,$02
B $F026,$01 Terminator.

t $F027 Messaging: "A Chasm"
@ $F027 label=Messaging_Chasm
N $F027 Print "#DECODESTR(#PC)".
B $F027,$01 "#DECODE(#PEEK(#PC))".
L $F027,$01,$04,$02
B $F02B,$01 Terminator.

t $F02C Messaging: "A Key"
@ $F02C label=Messaging_Key
N $F02C Print "#DECODESTR(#PC)".
B $F02C,$01 "#DECODE(#PEEK(#PC))".
L $F02C,$01,$03,$02
B $F02F,$01 Terminator.

t $F030 Messaging: "A Desk"
@ $F030 label=Messaging_Desk
N $F030 Print "#DECODESTR(#PC)".
B $F030,$01 "#DECODE(#PEEK(#PC))".
L $F030,$01,$04,$02
B $F034,$01 Terminator.

t $F035 Messaging: "A Chair"
@ $F035 label=Messaging_Chair
N $F035 Print "#DECODESTR(#PC)".
B $F035,$01 "#DECODE(#PEEK(#PC))".
L $F035,$01,$04,$02
B $F039,$01 Terminator.

t $F03A Messaging: "A Display"
@ $F03A label=Messaging_Display
N $F03A Print "#DECODESTR(#PC)".
B $F03A,$01 "#DECODE(#PEEK(#PC))".
L $F03A,$01,$06,$02
B $F040,$01 Terminator.

t $F041 Messaging: "A Siren"
@ $F041 label=Messaging_Siren
N $F041 Print "#DECODESTR(#PC)".
B $F041,$01 "#DECODE(#PEEK(#PC))".
L $F041,$01,$04,$02
B $F045,$01 Terminator.

t $F046 Messaging: "A Button"
@ $F046 label=Messaging_Button
N $F046 Print "#DECODESTR(#PC)".
B $F046,$01 "#DECODE(#PEEK(#PC))".
L $F046,$01,$05,$02
B $F04B,$01 Terminator.

t $F04C Messaging: "A Valve"
@ $F04C label=Messaging_Valve
N $F04C Print "#DECODESTR(#PC)".
B $F04C,$01 "#DECODE(#PEEK(#PC))".
L $F04C,$01,$04,$02
B $F050,$01 Terminator.

t $F051 Messaging: "Any Wires"
@ $F051 label=Messaging_Wires
N $F051 Print "#DECODESTR(#PC)".
B $F051,$01 "#DECODE(#PEEK(#PC))".
L $F051,$01,$04,$02
B $F055,$01 Terminator.

t $F056 Messaging: "A Pipe"
@ $F056 label=Messaging_Pipe
N $F056 Print "#DECODESTR(#PC)".
B $F056,$01 "#DECODE(#PEEK(#PC))".
L $F056,$01,$05,$02
B $F05B,$01 Terminator.

t $F05C Messaging: "A Screwdriver"
@ $F05C label=Messaging_Screwdriver
N $F05C Print "#DECODESTR(#PC)".
B $F05C,$01 "#DECODE(#PEEK(#PC))".
L $F05C,$01,$08,$02
B $F064,$01 Terminator.

t $F065 Messaging: "A Fire"
@ $F065 label=Messaging_Fire
N $F065 Print "#DECODESTR(#PC)".
B $F065,$01 "#DECODE(#PEEK(#PC))".
L $F065,$01,$03,$02
B $F068,$01 Terminator.

t $F069 Messaging: "A Lift"
@ $F069 label=Messaging_Lift
N $F069 Print "#DECODESTR(#PC)".
B $F069,$01 "#DECODE(#PEEK(#PC))".
L $F069,$01,$03,$02
B $F06C,$01 Terminator.

t $F06D Messaging: "A Pen"
@ $F06D label=Messaging_Pen
N $F06D Print "#DECODESTR(#PC)".
B $F06D,$01 "#DECODE(#PEEK(#PC))".
L $F06D,$01,$03,$02
B $F070,$01 Terminator.

t $F071 Messaging: "A Radio"
@ $F071 label=Messaging_Radio
N $F071 Print "#DECODESTR(#PC)".
B $F071,$01 "#DECODE(#PEEK(#PC))".
L $F071,$01,$05,$02
B $F076,$01 Terminator.

t $F077 Messaging: "A Panel"
@ $F077 label=Messaging_Panel
N $F077 Print "#DECODESTR(#PC)".
B $F077,$01 "#DECODE(#PEEK(#PC))".
L $F077,$01,$04,$02
B $F07B,$01 Terminator.

t $F07C Messaging: "The Ceiling"
@ $F07C label=Messaging_Ceiling
N $F07C Print "#DECODESTR(#PC)".
B $F07C,$01 "#DECODE(#PEEK(#PC))".
L $F07C,$01,$05,$02
B $F081,$01 Terminator.

t $F082 Messaging: "A Basin"
@ $F082 label=Messaging_Basin
N $F082 Print "#DECODESTR(#PC)".
B $F082,$01 "#DECODE(#PEEK(#PC))".
L $F082,$01,$04,$02
B $F086,$01 Terminator.

t $F087 Messaging: "A Mirror"
@ $F087 label=Messaging_Mirror
N $F087 Print "#DECODESTR(#PC)".
B $F087,$01 "#DECODE(#PEEK(#PC))".
L $F087,$01,$05,$02
B $F08C,$01 Terminator.

t $F08D Messaging: "A Workbench"
@ $F08D label=Messaging_Workbench
N $F08D Print "#DECODESTR(#PC)".
B $F08D,$01 "#DECODE(#PEEK(#PC))".
L $F08D,$01,$07,$02
B $F094,$01 Terminator.

t $F095 Messaging: "A Pickaxe"
@ $F095 label=Messaging_Pickaxe
N $F095 Print "#DECODESTR(#PC)".
B $F095,$01 "#DECODE(#PEEK(#PC))".
L $F095,$01,$07,$02
B $F09C,$01 Terminator.

t $F09D Messaging: "A Torch"
@ $F09D label=Messaging_Torch
N $F09D Print "#DECODESTR(#PC)".
B $F09D,$01 "#DECODE(#PEEK(#PC))".
L $F09D,$01,$04,$02
B $F0A1,$01 Terminator.

t $F0A2 Messaging: "Any Tissues"
@ $F0A2 label=Messaging_AnyTissues
N $F0A2 Print "#DECODESTR(#PC)".
B $F0A2,$01 "#DECODE(#PEEK(#PC))".
L $F0A2,$01,$05,$02
B $F0A7,$01 Terminator.

t $F0A8 Messaging: "An Isolator"
@ $F0A8 label=Messaging_Isolator
N $F0A8 Print "#DECODESTR(#PC)".
B $F0A8,$01 "#DECODE(#PEEK(#PC))".
L $F0A8,$01,$05,$02
B $F0AD,$01 Terminator.

t $F0AE Messaging: "Any Cables"
@ $F0AE label=Messaging_AnyCables
N $F0AE Print "#DECODESTR(#PC)".
B $F0AE,$01 "#DECODE(#PEEK(#PC))".
L $F0AE,$01,$05,$02
B $F0B3,$01 Terminator.

t $F0B4 Messaging: "A Handle"
@ $F0B4 label=Messaging_Handle
N $F0B4 Print "#DECODESTR(#PC)".
B $F0B4,$01 "#DECODE(#PEEK(#PC))".
L $F0B4,$01,$04,$02
B $F0B8,$01 Terminator.

t $F0B9 Messaging: "A Shaft"
@ $F0B9 label=Messaging_Shaft
N $F0B9 Print "#DECODESTR(#PC)".
B $F0B9,$01 "#DECODE(#PEEK(#PC))".
L $F0B9,$01,$04,$02
B $F0BD,$01 Terminator.

t $F0BE Messaging: "A Sluice"
@ $F0BE label=Messaging_Sluice
N $F0BE Print "#DECODESTR(#PC)".
B $F0BE,$01 "#DECODE(#PEEK(#PC))".
L $F0BE,$01,$05,$02
B $F0C3,$01 Terminator.

t $F0C4 Messaging: "Any Sweets"
@ $F0C4 label=Messaging_AnySweets
N $F0C4 Print "#DECODESTR(#PC)".
B $F0C4,$01 "#DECODE(#PEEK(#PC))".
L $F0C4,$01,$06,$02
B $F0CA,$01 Terminator.

t $F0CB Messaging: "An Ambulance"
@ $F0CB label=Messaging_Ambulance
N $F0CB Print "#DECODESTR(#PC)".
B $F0CB,$01 "#DECODE(#PEEK(#PC))".
L $F0CB,$01,$06,$02
B $F0D1,$01 Terminator.

t $F0D2 Messaging: "A Truck"
@ $F0D2 label=Messaging_Truck
N $F0D2 Print "#DECODESTR(#PC)".
B $F0D2,$01 "#DECODE(#PEEK(#PC))".
L $F0D2,$01,$04,$02
B $F0D6,$01 Terminator.

t $F0D7 Messaging: "Any Geese"
@ $F0D7 label=Messaging_AnyGeese
N $F0D7 Print "#DECODESTR(#PC)".
B $F0D7,$01 "#DECODE(#PEEK(#PC))".
L $F0D7,$01,$05,$02
B $F0DC,$01 Terminator.

t $F0DD Messaging: "Any Buns"
@ $F0DD label=Messaging_AnyBuns
N $F0DD Print "#DECODESTR(#PC)".
B $F0DD,$01 "#DECODE(#PEEK(#PC))".
L $F0DD,$01,$04,$02
B $F0E1,$01 Terminator.

t $F0E2 Messaging: "A Woman"
@ $F0E2 label=Messaging_Woman
N $F0E2 Print "#DECODESTR(#PC)".
B $F0E2,$01 "#DECODE(#PEEK(#PC))".
L $F0E2,$01,$04,$02
B $F0E6,$01 Terminator.

t $F0E7 Messaging: ""
N $F0E7 Print "#DECODESTR(#PC)".
B $F0E7,$01 "#DECODE(#PEEK(#PC))".
L $F0E7,$01,$01,$02
B $F0E8,$01 Terminator.

t $F0E9 Messaging: ""
N $F0E9 Print "#DECODESTR(#PC)".
B $F0E9,$01 "#DECODE(#PEEK(#PC))".
L $F0E9,$01,$01,$02
B $F0EA,$01 Terminator.

t $F0EB Messaging: ""
N $F0EB Print "#DECODESTR(#PC)".
B $F0EB,$01 "#DECODE(#PEEK(#PC))".
L $F0EB,$01,$01,$02
B $F0EC,$01 Terminator.

t $F0ED Messaging: ""
N $F0ED Print "#DECODESTR(#PC)".
B $F0ED,$01 "#DECODE(#PEEK(#PC))".
L $F0ED,$01,$01,$02
B $F0EE,$01 Terminator.

t $F0EF Messaging: ""
N $F0EF Print "#DECODESTR(#PC)".
B $F0EF,$01 "#DECODE(#PEEK(#PC))".
L $F0EF,$01,$01,$02
B $F0F0,$01 Terminator.

t $F0F1 Messaging: ""
N $F0F1 Print "#DECODESTR(#PC)".
B $F0F1,$01 "#DECODE(#PEEK(#PC))".
L $F0F1,$01,$01,$02
B $F0F2,$01 Terminator.

t $F0F3 Messaging: ""
N $F0F3 Print "#DECODESTR(#PC)".
B $F0F3,$01 "#DECODE(#PEEK(#PC))".
L $F0F3,$01,$01,$02
B $F0F4,$01 Terminator.

t $F0F5 Messaging: ""
N $F0F5 Print "#DECODESTR(#PC)".
B $F0F5,$01 "#DECODE(#PEEK(#PC))".
L $F0F5,$01,$01,$02
B $F0F6,$01 Terminator.

t $F0F7 Messaging: ""
N $F0F7 Print "#DECODESTR(#PC)".
B $F0F7,$01 "#DECODE(#PEEK(#PC))".
L $F0F7,$01,$01,$02
B $F0F8,$01 Terminator.

t $F0F9 Messaging: "A Diamond"
@ $F0F9 label=Messaging__Diamond
N $F0F9 Print "#DECODESTR(#PC)".
B $F0F9,$01 "#DECODE(#PEEK(#PC))".
L $F0F9,$01,$07,$02
B $F100,$01 Terminator.

t $F101 Messaging: "Some Fruit"
@ $F101 label=Messaging_Fruit
N $F101 Print "#DECODESTR(#PC)".
B $F101,$01 "#DECODE(#PEEK(#PC))".
L $F101,$01,$06,$02
B $F107,$01 Terminator.

t $F108 Messaging: "Some Meat"
@ $F108 label=Messaging_Meat
N $F108 Print "#DECODESTR(#PC)".
B $F108,$01 "#DECODE(#PEEK(#PC))".
L $F108,$01,$06,$02
B $F10E,$01 Terminator.

t $F10F Messaging: "A Television"
@ $F10F label=Messaging__Television
N $F10F Print "#DECODESTR(#PC)".
B $F10F,$01 "#DECODE(#PEEK(#PC))".
L $F10F,$01,$07,$02
B $F116,$01 Terminator.

t $F117 Messaging: "A Bottle"
@ $F117 label=Messaging__Bottle
N $F117 Print "#DECODESTR(#PC)".
B $F117,$01 "#DECODE(#PEEK(#PC))".
L $F117,$01,$06,$02
B $F11D,$01 Terminator.

t $F11E Messaging: "A Bottle Of Oil"
@ $F11E label=Messaging_BottleOfOil
N $F11E Print "#DECODESTR(#PC)".
B $F11E,$01 "#DECODE(#PEEK(#PC))".
L $F11E,$01,$0A,$02
B $F128,$01 Terminator.

t $F129 Messaging: "A Bottle Of Water"
@ $F129 label=Messaging_BottleOfWater
N $F129 Print "#DECODESTR(#PC)".
B $F129,$01 "#DECODE(#PEEK(#PC))".
L $F129,$01,$0B,$02
B $F134,$01 Terminator.

t $F135 Messaging: "A Wooden Stick"
@ $F135 label=Messaging_WoodenStick
N $F135 Print "#DECODESTR(#PC)".
B $F135,$01 "#DECODE(#PEEK(#PC))".
L $F135,$01,$09,$02
B $F13E,$01 Terminator.

t $F13F Messaging: "An Elephant Standing On A Wooden Ramp"
@ $F13F label=Messaging_ElephantOnRamp
N $F13F Print "#DECODESTR(#PC)".
B $F13F,$01 "#DECODE(#PEEK(#PC))".
L $F13F,$01,$16,$02
B $F155,$01 Terminator.

t $F156 Messaging: "A Wooden Ramp"
@ $F156 label=Messaging_WoodenRamp
N $F156 Print "#DECODESTR(#PC)".
B $F156,$01 "#DECODE(#PEEK(#PC))".
L $F156,$01,$09,$02
B $F15F,$01 Terminator.

t $F160 Messaging: "A Rusty Nail"
@ $F160 label=Messaging_RustyNail
N $F160 Print "#DECODESTR(#PC)".
B $F160,$01 "#DECODE(#PEEK(#PC))".
L $F160,$01,$08,$02
B $F168,$01 Terminator.

t $F169 Messaging: "A Cap"
@ $F169 label=Messaging__Cap
N $F169 Print "#DECODESTR(#PC)".
B $F169,$01 "#DECODE(#PEEK(#PC))".
L $F169,$01,$04,$02
B $F16D,$01 Terminator.

t $F16E Messaging: "A Cap Which You Are Wearing"
@ $F16E label=Messaging_CapWorn
N $F16E Print "#DECODESTR(#PC)".
B $F16E,$01 "#DECODE(#PEEK(#PC))".
L $F16E,$01,$0E,$02
B $F17C,$01 Terminator.

t $F17D Messaging: "The Tunnel Is Flooded"
@ $F17D label=Messaging_FloodedTunnel
N $F17D Print "#DECODESTR(#PC)".
B $F17D,$01 "#DECODE(#PEEK(#PC))".
L $F17D,$01,$0C,$02
B $F189,$01 Terminator.

t $F18A Messaging: "The Tunnel Is Dry"
@ $F18A label=Messaging_DryTunnel
N $F18A Print "#DECODESTR(#PC)".
B $F18A,$01 "#DECODE(#PEEK(#PC))".
L $F18A,$01,$0A,$02
B $F194,$01 Terminator.

t $F195 Messaging: "A Ticket"
@ $F195 label=Messaging__Ticket
N $F195 Print "#DECODESTR(#PC)".
B $F195,$01 "#DECODE(#PEEK(#PC))".
L $F195,$01,$06,$02
B $F19B,$01 Terminator.

t $F19C Messaging: "A Trumpet"
@ $F19C label=Messaging__Trumpet
N $F19C Print "#DECODESTR(#PC)".
B $F19C,$01 "#DECODE(#PEEK(#PC))".
L $F19C,$01,$06,$02
B $F1A2,$01 Terminator.

t $F1A3 Messaging: "The Gates Are Open"
@ $F1A3 label=Messaging_OpenGates
N $F1A3 Print "#DECODESTR(#PC)".
B $F1A3,$01 "#DECODE(#PEEK(#PC))".
L $F1A3,$01,$08,$02
B $F1AB,$01 Terminator.

t $F1AC Messaging: "The Gates Are Closed"
@ $F1AC label=Messaging_ClosedGates
N $F1AC Print "#DECODESTR(#PC)".
B $F1AC,$01 "#DECODE(#PEEK(#PC))".
L $F1AC,$01,$0A,$02
B $F1B6,$01 Terminator.

t $F1B7 Messaging: "A Stout Wooden Beam"
@ $F1B7 label=Messaging_StoutWoodenBeam
N $F1B7 Print "#DECODESTR(#PC)".
B $F1B7,$01 "#DECODE(#PEEK(#PC))".
L $F1B7,$01,$0B,$02
B $F1C2,$01 Terminator.

t $F1C3 Messaging: "The Stairs Are Supported By A Stout Wooden Beam"
@ $F1C3 label=Messaging_StairsSupportedByBeam
N $F1C3 Print "#DECODESTR(#PC)".
B $F1C3,$01 "#DECODE(#PEEK(#PC))".
L $F1C3,$01,$1A,$02
B $F1DD,$01 Terminator.

t $F1DE Messaging: "A Closed Door"
@ $F1DE label=Messaging_ClosedDoor
N $F1DE Print "#DECODESTR(#PC)".
B $F1DE,$01 "#DECODE(#PEEK(#PC))".
L $F1DE,$01,$09,$02
B $F1E7,$01 Terminator.

t $F1E8 Messaging: "An Open Door"
@ $F1E8 label=Messaging_OpenDoor
N $F1E8 Print "#DECODESTR(#PC)".
B $F1E8,$01 "#DECODE(#PEEK(#PC))".
L $F1E8,$01,$08,$02
B $F1F0,$01 Terminator.

t $F1F1 Messaging: "A Key"
@ $F1F1 label=Messaging__Key
N $F1F1 Print "#DECODESTR(#PC)".
B $F1F1,$01 "#DECODE(#PEEK(#PC))".
L $F1F1,$01,$03,$02
B $F1F4,$01 Terminator.

t $F1F5 Messaging: "One Limp Body Lays Slumped Over The Steering Wheel Of A Nearby Car"
@ $F1F5 label=Messaging_LimpBody
N $F1F5 Print "#DECODESTR(#PC)".
B $F1F5,$01 "#DECODE(#PEEK(#PC))".
L $F1F5,$01,$27,$02
B $F21C,$01 Terminator.

t $F21D Messaging: "A Body Laying Near To The Chasm"
@ $F21D label=Messaging_Body
N $F21D Print "#DECODESTR(#PC)".
B $F21D,$01 "#DECODE(#PEEK(#PC))".
L $F21D,$01,$12,$02
B $F22F,$01 Terminator.

t $F230 Messaging: "A Wooden Ramp At The Edge Of The Chasm"
@ $F230 label=Messaging_WoodenRampAtEdgeOfChasm
N $F230 Print "#DECODESTR(#PC)".
B $F230,$01 "#DECODE(#PEEK(#PC))".
L $F230,$01,$15,$02
B $F245,$01 Terminator.

t $F246 Messaging: "An Empty Car"
@ $F246 label=Messaging_EmptyCar
N $F246 Print "#DECODESTR(#PC)".
B $F246,$01 "#DECODE(#PEEK(#PC))".
L $F246,$01,$08,$02
B $F24E,$01 Terminator.

t $F24F Messaging: "A Car Lays Wedged Into The Chasm, Forming A Bridge"
@ $F24F label=Messaging_CarWedgedIntoChasm
N $F24F Print "#DECODESTR(#PC)".
B $F24F,$01 "#DECODE(#PEEK(#PC))".
L $F24F,$01,$1E,$02
B $F26D,$01 Terminator.

t $F26E Messaging: "You Are Sitting In The Car; The Engine Is Running"
@ $F26E label=Messaging_SittingInCarEngineRunning
N $F26E Print "#DECODESTR(#PC)".
B $F26E,$01 "#DECODE(#PEEK(#PC))".
L $F26E,$01,$15,$02
B $F283,$01 Terminator.

t $F284 Messaging: "A Flashing Display"
@ $F284 label=Messaging_FlashingDisplay
N $F284 Print "#DECODESTR(#PC)".
B $F284,$01 "#DECODE(#PEEK(#PC))".
L $F284,$01,$31,$02
B $F2B5,$01 Terminator.

t $F2B6 Messaging: "A Valve"
@ $F2B6 label=Messaging__Valve
N $F2B6 Print "#DECODESTR(#PC)".
B $F2B6,$01 "#DECODE(#PEEK(#PC))".
L $F2B6,$01,$05,$02
B $F2BB,$01 Terminator.

t $F2BC Messaging: "There Is A Valve Missing From A Section Of The Blue Coolant Pipe"
@ $F2BC label=Messaging_MissingValve
N $F2BC Print "#DECODESTR(#PC)".
B $F2BC,$01 "#DECODE(#PEEK(#PC))".
L $F2BC,$01,$36,$02
B $F2F2,$01 Terminator.

t $F2F3 Messaging: "A Pair Of Wires Dangling Near To A Valve Fitted To The Blue Coolant Pipe"
@ $F2F3 label=Messaging_PairOfWiresDangling
N $F2F3 Print "#DECODESTR(#PC)".
B $F2F3,$01 "#DECODE(#PEEK(#PC))".
L $F2F3,$01,$2D,$02
B $F320,$01 Terminator.

t $F321 Messaging: "A Pair Of Wires Connected To A Valve In The Blue Coolant Pipe"
@ $F321 label=Messaging_PairOfWiresConnectedValve
N $F321 Print "#DECODESTR(#PC)".
B $F321,$01 "#DECODE(#PEEK(#PC))".
L $F321,$01,$25,$02
B $F346,$01 Terminator.

t $F347 Messaging: "A Screwdriver"
@ $F347 label=Messaging__Screwdriver
N $F347 Print "#DECODESTR(#PC)".
B $F347,$01 "#DECODE(#PEEK(#PC))".
L $F347,$01,$09,$02
B $F350,$01 Terminator.

t $F351 Messaging: "A Chair"
@ $F351 label=Messaging__Chair
N $F351 Print "#DECODESTR(#PC)".
B $F351,$01 "#DECODE(#PEEK(#PC))".
L $F351,$01,$05,$02
B $F356,$01 Terminator.

t $F357 Messaging: "A Desk"
@ $F357 label=Messaging__Desk
N $F357 Print "#DECODESTR(#PC)".
B $F357,$01 "#DECODE(#PEEK(#PC))".
L $F357,$01,$05,$02
B $F35C,$01 Terminator.

t $F35D Messaging: "You Are Standing On A Chair"
@ $F35D label=Messaging_StandingOnChair
N $F35D Print "#DECODESTR(#PC)".
B $F35D,$01 "#DECODE(#PEEK(#PC))".
L $F35D,$01,$0B,$02
B $F368,$01 Terminator.

t $F369 Messaging: "A Pen"
@ $F369 label=Messaging__Pen
N $F369 Print "#DECODESTR(#PC)".
B $F369,$01 "#DECODE(#PEEK(#PC))".
L $F369,$01,$04,$02
B $F36D,$01 Terminator.

t $F36E Messaging: "A Radio"
@ $F36E label=Messaging__Radio
N $F36E Print "#DECODESTR(#PC)".
B $F36E,$01 "#DECODE(#PEEK(#PC))".
L $F36E,$01,$06,$02
B $F374,$01 Terminator.

t $F375 Messaging: "You Are Sitting In The Car"
@ $F375 label=Messaging_SittingInCar
N $F375 Print "#DECODESTR(#PC)".
B $F375,$01 "#DECODE(#PEEK(#PC))".
L $F375,$01,$0A,$02
B $F37F,$01 Terminator.

t $F380 Messaging: "A Panel Set Into The Ceiling"
@ $F380 label=Messaging_PanelInCeiling
N $F380 Print "#DECODESTR(#PC)".
B $F380,$01 "#DECODE(#PEEK(#PC))".
L $F380,$01,$0D,$02
B $F38D,$01 Terminator.

t $F38E Messaging: "A Panel"
@ $F38E label=Messaging__Panel
N $F38E Print "#DECODESTR(#PC)".
B $F38E,$01 "#DECODE(#PEEK(#PC))".
L $F38E,$01,$05,$02
B $F393,$01 Terminator.

t $F394 Messaging: "The Isolator Is Switched On"
@ $F394 label=Messaging_IsolatorOn
N $F394 Print "#DECODESTR(#PC)".
B $F394,$01 "#DECODE(#PEEK(#PC))".
L $F394,$01,$0F,$02
B $F3A3,$01 Terminator.

t $F3A4 Messaging: "The Isolator Is Switched Off"
@ $F3A4 label=Messaging_IsolatorOff
N $F3A4 Print "#DECODESTR(#PC)".
B $F3A4,$01 "#DECODE(#PEEK(#PC))".
L $F3A4,$01,$10,$02
B $F3B4,$01 Terminator.

t $F3B5 Messaging: "A Torch"
@ $F3B5 label=Messaging__Torch
N $F3B5 Print "#DECODESTR(#PC)".
B $F3B5,$01 "#DECODE(#PEEK(#PC))".
L $F3B5,$01,$05,$02
B $F3BA,$01 Terminator.

t $F3BB Messaging: "A Torch Which Is Switched On"
@ $F3BB label=Messaging_TorchOn
N $F3BB Print "#DECODESTR(#PC)".
B $F3BB,$01 "#DECODE(#PEEK(#PC))".
L $F3BB,$01,$12,$02
B $F3CD,$01 Terminator.

t $F3CE Messaging: "Some Tissues"
@ $F3CE label=Messaging_Tissues
N $F3CE Print "#DECODESTR(#PC)".
B $F3CE,$01 "#DECODE(#PEEK(#PC))".
L $F3CE,$01,$07,$02
B $F3D5,$01 Terminator.

t $F3D6 Messaging: "A Pickaxe"
@ $F3D6 label=Messaging__Pickaxe
N $F3D6 Print "#DECODESTR(#PC)".
B $F3D6,$01 "#DECODE(#PEEK(#PC))".
L $F3D6,$01,$07,$02
B $F3DD,$01 Terminator.

t $F3DE Messaging: "The Cables Spark Ominously"
@ $F3DE label=Messaging_Cables
N $F3DE Print "#DECODESTR(#PC)".
B $F3DE,$01 "#DECODE(#PEEK(#PC))".
L $F3DE,$01,$0E,$02
B $F3EC,$01 Terminator.

t $F3ED Messaging: "A Handle"
@ $F3ED label=Messaging__Handle
N $F3ED Print "#DECODESTR(#PC)".
B $F3ED,$01 "#DECODE(#PEEK(#PC))".
L $F3ED,$01,$05,$02
B $F3F2,$01 Terminator.

t $F3F3 Messaging: "A Closed Sluicegate"
@ $F3F3 label=Messaging_ClosedSluicegate
N $F3F3 Print "#DECODESTR(#PC)".
B $F3F3,$01 "#DECODE(#PEEK(#PC))".
L $F3F3,$01,$0C,$02
B $F3FF,$01 Terminator.

t $F400 Messaging: "A Closed Sluicegate With A Handle Fitted To The Operating Shaft"
@ $F400 label=Messaging_ClosedSluicegateWithHandle
N $F400 Print "#DECODESTR(#PC)".
B $F400,$01 "#DECODE(#PEEK(#PC))".
L $F400,$01,$25,$02
B $F425,$01 Terminator.

t $F426 Messaging: "An Open Sluicegate With A Handle Fitted To The Operating Shaft"
@ $F426 label=Messaging_OpenSluicegateWithHandle
N $F426 Print "#DECODESTR(#PC)".
B $F426,$01 "#DECODE(#PEEK(#PC))".
L $F426,$01,$20,$02
B $F446,$01 Terminator.

t $F447 Messaging: "Some Sweets"
@ $F447 label=Messaging_Sweets
N $F447 Print "#DECODESTR(#PC)".
B $F447,$01 "#DECODE(#PEEK(#PC))".
L $F447,$01,$07,$02
B $F44E,$01 Terminator.

t $F44F Messaging: "A Ceiling Panel Has Been Removed"
@ $F44F label=Messaging_CeilingPanel
N $F44F Print "#DECODESTR(#PC)".
B $F44F,$01 "#DECODE(#PEEK(#PC))".
L $F44F,$01,$16,$02
B $F465,$01 Terminator.

t $F466 Messaging: "Some Buns"
@ $F466 label=Messaging_Buns
N $F466 Print "#DECODESTR(#PC)".
B $F466,$01 "#DECODE(#PEEK(#PC))".
L $F466,$01,$05,$02
B $F46B,$01 Terminator.

t $F46C Messaging: ""
N $F46C Print "#DECODESTR(#PC)".
B $F46C,$01 "#DECODE(#PEEK(#PC))".
L $F46C,$01,$01,$02
B $F46D,$01 Terminator.

t $F46E Messaging: ""
N $F46E Print "#DECODESTR(#PC)".
B $F46E,$01 "#DECODE(#PEEK(#PC))".
L $F46E,$01,$01,$02
B $F46F,$01 Terminator.

t $F470 Messaging: ""
N $F470 Print "#DECODESTR(#PC)".
B $F470,$01 "#DECODE(#PEEK(#PC))".
L $F470,$01,$01,$02
B $F471,$01 Terminator.

t $F472 Messaging: ""
N $F472 Print "#DECODESTR(#PC)".
B $F472,$01 "#DECODE(#PEEK(#PC))".
L $F472,$01,$01,$02
B $F473,$01 Terminator.

t $F474 Messaging: ""
N $F474 Print "#DECODESTR(#PC)".
B $F474,$01 "#DECODE(#PEEK(#PC))".
L $F474,$01,$01,$02
B $F475,$01 Terminator.

t $F476 Messaging: ""
N $F476 Print "#DECODESTR(#PC)".
B $F476,$01 "#DECODE(#PEEK(#PC))".
L $F476,$01,$01,$02
B $F477,$01 Terminator.

t $F478 Messaging: ""
N $F478 Print "#DECODESTR(#PC)".
B $F478,$01 "#DECODE(#PEEK(#PC))".
L $F478,$01,$01,$02
B $F479,$01 Terminator.

t $F47A Messaging: "It's Very Dark In Here"
@ $F47A label=Messaging_VeryDarkInHere
N $F47A Print "#DECODESTR(#PC)".
B $F47A,$01 "#DECODE(#PEEK(#PC))".
L $F47A,$01,$3C,$02
B $F4B6,$01 Terminator.

t $F4B7 Messaging: "The Floor Collapses"
@ $F4B7 label=Messaging_FloorCollapses
N $F4B7 Print "#DECODESTR(#PC)".
B $F4B7,$01 "#DECODE(#PEEK(#PC))".
L $F4B7,$01,$22,$02
B $F4D9,$01 Terminator.

t $F4DA Messaging: "The Weakened Stairs Collapse"
@ $F4DA label=Messaging_WeakenedStairsCollapse
N $F4DA Print "#DECODESTR(#PC)".
B $F4DA,$01 "#DECODE(#PEEK(#PC))".
L $F4DA,$01,$1D,$02
B $F4F7,$01 Terminator.

t $F4F8 Messaging: "The Snaking, Sparking Cable Touches You"
@ $F4F8 label=Messaging_SnakingSparkingCableTouchesYou
N $F4F8 Print "#DECODESTR(#PC)".
B $F4F8,$01 "#DECODE(#PEEK(#PC))".
L $F4F8,$01,$19,$02
B $F511,$01 Terminator.

t $F512 Messaging: "With A Vicious Snapping Of Its Jaws, An Alligator Is Upon You..."
@ $F512 label=Messaging_ViciousSnappingAlligator
N $F512 Print "#DECODESTR(#PC)".
B $F512,$01 "#DECODE(#PEEK(#PC))".
L $F512,$01,$29,$02
B $F53B,$01 Terminator.

t $F53C Messaging: "You Neither Hear The Explosion"
@ $F53C label=Messaging_DontHearExplosion
N $F53C Print "#DECODESTR(#PC)".
B $F53C,$01 "#DECODE(#PEEK(#PC))".
L $F53C,$01,$63,$02
B $F59F,$01 Terminator.

t $F5A0 Messaging: "As You Enter The Street"
@ $F5A0 label=Messaging_EnterTheStreet
N $F5A0 Print "#DECODESTR(#PC)".
B $F5A0,$01 "#DECODE(#PEEK(#PC))".
L $F5A0,$01,$69,$02
B $F609,$01 Terminator.

t $F60A Messaging: "He Shouts:-"
@ $F60A label=Messaging_HeShouts
N $F60A Print "#DECODESTR(#PC)".
B $F60A,$01 "#DECODE(#PEEK(#PC))".
L $F60A,$01,$33,$02
B $F63D,$01 Terminator.

t $F63E Messaging: "He Shouts:- At Ease Men"
@ $F63E label=Messaging_HeShoutsAtEaseMen
N $F63E Print "#DECODESTR(#PC)".
B $F63E,$01 "#DECODE(#PEEK(#PC))".
L $F63E,$01,$27,$02
B $F665,$01 Terminator.

t $F666 Messaging: "As You Enter The Street"
@ $F666 label=Messaging_EnterTheStreetLooters
N $F666 Print "#DECODESTR(#PC)".
B $F666,$01 "#DECODE(#PEEK(#PC))".
L $F666,$01,$88,$02
B $F6EE,$01 Terminator.

t $F6EF Messaging: "He Says:-"
@ $F6EF label=Messaging_HeSays
N $F6EF Print "#DECODESTR(#PC)".
B $F6EF,$01 "#DECODE(#PEEK(#PC))".
L $F6EF,$01,$3F,$02
B $F72E,$01 Terminator.

t $F72F Messaging: "He Says "hey Boys, Look What We've Found!""
@ $F72F label=Messaging_HeSayLookWhatWeFound
N $F72F Print "#DECODESTR(#PC)".
B $F72F,$01 "#DECODE(#PEEK(#PC))".
L $F72F,$01,$4A,$02
B $F779,$01 Terminator.

t $F77A Messaging: "A Speeding Ambulance Rushes Past; The Siren Blaring"
@ $F77A label=Messaging_SpeedingAmbulance
N $F77A Print "#DECODESTR(#PC)".
B $F77A,$01 "#DECODE(#PEEK(#PC))".
L $F77A,$01,$1E,$02
B $F798,$01 Terminator.

t $F799 Messaging: "You Look Up"
@ $F799 label=Messaging_YouLookUp
N $F799 Print "#DECODESTR(#PC)".
B $F799,$01 "#DECODE(#PEEK(#PC))".
L $F799,$01,$3A,$02
B $F7D3,$01 Terminator.

t $F7D4 Messaging: "A Rescue Truck Tears Past You"
@ $F7D4 label=Messaging_RescueTruckTearsPast
N $F7D4 Print "#DECODESTR(#PC)".
B $F7D4,$01 "#DECODE(#PEEK(#PC))".
L $F7D4,$01,$3B,$02
B $F80F,$01 Terminator.

t $F810 Messaging: "Nasty Leak That!"
@ $F810 label=Messaging_NastyLeakThat
N $F810 Print "#DECODESTR(#PC)".
B $F810,$01 "#DECODE(#PEEK(#PC))".
L $F810,$01,$08,$02
B $F818,$01 Terminator.

t $F819 Messaging: "Try Examining Things"
@ $F819 label=Messaging_TryExaminingThings
N $F819 Print "#DECODESTR(#PC)".
B $F819,$01 "#DECODE(#PEEK(#PC))".
L $F819,$01,$0B,$02
B $F824,$01 Terminator.

t $F825 Messaging: "You Don't Really Need It"
@ $F825 label=Messaging_YouDontReallyNeedIt
N $F825 Print "#DECODESTR(#PC)".
B $F825,$01 "#DECODE(#PEEK(#PC))".
L $F825,$01,$0D,$02
B $F832,$01 Terminator.

t $F833 Messaging: "You See That This Is The Body Of A Young Woman. In Her Jacket Pocket, You Find A Key"
@ $F833 label=Messaging_SeeThisIsBodyYoungWoman
N $F833 Print "#DECODESTR(#PC)".
B $F833,$01 "#DECODE(#PEEK(#PC))".
L $F833,$01,$2E,$02
B $F861,$01 Terminator.

t $F862 Messaging: "You Turn The Body Over, A New Valve Drops From A Limp Hand"
@ $F862 label=Messaging_TurnTheBodyOver
N $F862 Print "#DECODESTR(#PC)".
B $F862,$01 "#DECODE(#PEEK(#PC))".
L $F862,$01,$22,$02
B $F884,$01 Terminator.

t $F885 Messaging: "The Bottle Is Empty"
@ $F885 label=Messaging_BottleIsEmpty
N $F885 Print "#DECODESTR(#PC)".
B $F885,$01 "#DECODE(#PEEK(#PC))".
L $F885,$01,$0B,$02
B $F890,$01 Terminator.

t $F891 Messaging: "It's Full Of Water"
@ $F891 label=Messaging_FullOfWater
N $F891 Print "#DECODESTR(#PC)".
B $F891,$01 "#DECODE(#PEEK(#PC))".
L $F891,$01,$0E,$02
B $F89F,$01 Terminator.

t $F8A0 Messaging: "It's Full Of Oil"
@ $F8A0 label=Messaging_FullOfOil
N $F8A0 Print "#DECODESTR(#PC)".
B $F8A0,$01 "#DECODE(#PEEK(#PC))".
L $F8A0,$01,$0D,$02
B $F8AD,$01 Terminator.

t $F8AE Messaging: "You Have Found A Bottle"
@ $F8AE label=Messaging_FoundABottle
N $F8AE Print "#DECODESTR(#PC)".
B $F8AE,$01 "#DECODE(#PEEK(#PC))".
L $F8AE,$01,$0C,$02
B $F8BA,$01 Terminator.

t $F8BB Messaging: "They Look Very Unsafe"
@ $F8BB label=Messaging_LookVeryUnsafe
N $F8BB Print "#DECODESTR(#PC)".
B $F8BB,$01 "#DECODE(#PEEK(#PC))".
L $F8BB,$01,$2F,$02
B $F8EA,$01 Terminator.

t $F8EB Messaging: "It's Not Worth It At The Best Of Times"
@ $F8EB label=Messaging_NotWorthIt
N $F8EB Print "#DECODESTR(#PC)".
B $F8EB,$01 "#DECODE(#PEEK(#PC))".
L $F8EB,$01,$17,$02
B $F902,$01 Terminator.

t $F903 Messaging: "It Would Appear That Someone Called "kilroy" Has Passed This Way"
@ $F903 label=Messaging_WouldAppearKilroy
N $F903 Print "#DECODESTR(#PC)".
B $F903,$01 "#DECODE(#PEEK(#PC))".
L $F903,$01,$29,$02
B $F92C,$01 Terminator.

t $F92D Messaging: "You Have Found A Key"
@ $F92D label=Messaging_FoundKey
N $F92D Print "#DECODESTR(#PC)".
B $F92D,$01 "#DECODE(#PEEK(#PC))".
L $F92D,$01,$09,$02
B $F936,$01 Terminator.

t $F937 Messaging: "It Is Meant To Have Wires Connected To It"
@ $F937 label=Messaging_MeantWiresConnected
N $F937 Print "#DECODESTR(#PC)".
B $F937,$01 "#DECODE(#PEEK(#PC))".
L $F937,$01,$1B,$02
B $F952,$01 Terminator.

t $F953 Messaging: "You Have Found A Panel In The Ceiling"
@ $F953 label=Messaging_FoundPanelInCeiling
N $F953 Print "#DECODESTR(#PC)".
B $F953,$01 "#DECODE(#PEEK(#PC))".
L $F953,$01,$12,$02
B $F965,$01 Terminator.

t $F966 Messaging: "You Have Found A Torch"
@ $F966 label=Messaging_FoundTorch
N $F966 Print "#DECODESTR(#PC)".
B $F966,$01 "#DECODE(#PEEK(#PC))".
L $F966,$01,$0B,$02
B $F971,$01 Terminator.

t $F972 Messaging: "You Find Nothing Of Interest"
@ $F972 label=Messaging_FindNothingOfInterest
N $F972 Print "#DECODESTR(#PC)".
B $F972,$01 "#DECODE(#PEEK(#PC))".
L $F972,$01,$0D,$02
B $F97F,$01 Terminator.

t $F980 Messaging: "You Have Nothing To Carry It In"
@ $F980 label=Messaging_YouHaveNothingToCarryItIn
N $F980 Print "#DECODESTR(#PC)".
B $F980,$01 "#DECODE(#PEEK(#PC))".
L $F980,$01,$10,$02
B $F990,$01 Terminator.

t $F991 Messaging: "You're Already Wearing It"
@ $F991 label=Messaging_YoureAlreadyWearingIt
N $F991 Print "#DECODESTR(#PC)".
B $F991,$01 "#DECODE(#PEEK(#PC))".
L $F991,$01,$0C,$02
B $F99D,$01 Terminator.

t $F99E Messaging: "You Can't, You're Standing On It"
@ $F99E label=Messaging_YouCantYoureStandingOnIt
N $F99E Print "#DECODESTR(#PC)".
B $F99E,$01 "#DECODE(#PEEK(#PC))".
L $F99E,$01,$10,$02
B $F9AE,$01 Terminator.

t $F9AF Messaging: "You Need Both Hands To Carry It, So Drop Everything Else"
@ $F9AF label=Messaging_YouNeedBothHands
N $F9AF Print "#DECODESTR(#PC)".
B $F9AF,$01 "#DECODE(#PEEK(#PC))".
L $F9AF,$01,$21,$02
B $F9D0,$01 Terminator.

t $F9D1 Messaging: "You Can't. You're Sitting In The Car"
@ $F9D1 label=Messaging_YouCantSittingInTheCar
N $F9D1 Print "#DECODESTR(#PC)".
B $F9D1,$01 "#DECODE(#PEEK(#PC))".
L $F9D1,$01,$12,$02
B $F9E3,$01 Terminator.

t $F9E4 Messaging: "I Don't See The Point Of Dropping Things In The Car"
@ $F9E4 label=Messaging_IDontSeeThePointInCar
N $F9E4 Print "#DECODESTR(#PC)".
B $F9E4,$01 "#DECODE(#PEEK(#PC))".
L $F9E4,$01,$1E,$02
B $FA02,$01 Terminator.

t $FA03 Messaging: "The Lions Devour The Meat Greedily"
@ $FA03 label=Messaging_LionsDevourMeat
N $FA03 Print "#DECODESTR(#PC)".
B $FA03,$01 "#DECODE(#PEEK(#PC))".
L $FA03,$01,$17,$02
B $FA1A,$01 Terminator.

t $FA1B Messaging: "The Chimps Squabble Over The Fruit, Noisily"
@ $FA1B label=Messaging_ChimpsSquabbleOverFruit
N $FA1B Print "#DECODESTR(#PC)".
B $FA1B,$01 "#DECODE(#PEEK(#PC))".
L $FA1B,$01,$18,$02
B $FA33,$01 Terminator.

t $FA34 Messaging: "The Elephant Takes The Buns"
@ $FA34 label=Messaging_ElephantTakesBuns
N $FA34 Print "#DECODESTR(#PC)".
B $FA34,$01 "#DECODE(#PEEK(#PC))".
L $FA34,$01,$57,$02
B $FA8B,$01 Terminator.

t $FA8C Messaging: "You Have Some Already"
@ $FA8C label=Messaging_YouHaveSomeAlready
N $FA8C Print "#DECODESTR(#PC)".
B $FA8C,$01 "#DECODE(#PEEK(#PC))".
L $FA8C,$01,$09,$02
B $FA95,$01 Terminator.

t $FA96 Messaging: "No. It May Be Contaminated"
@ $FA96 label=Messaging_ItMayBeContaminated
N $FA96 Print "#DECODESTR(#PC)".
B $FA96,$01 "#DECODE(#PEEK(#PC))".
L $FA96,$01,$12,$02
B $FAA8,$01 Terminator.

t $FAA9 Messaging: "It Isn't Full Of Anything"
@ $FAA9 label=Messaging_ItIsntFullOfAnything
N $FAA9 Print "#DECODESTR(#PC)".
B $FAA9,$01 "#DECODE(#PEEK(#PC))".
L $FAA9,$01,$10,$02
B $FAB9,$01 Terminator.

t $FABA Messaging: "You Don't Know How To Do That"
@ $FABA label=Messaging_YouDontKnowHowToDoThat
N $FABA Print "#DECODESTR(#PC)".
B $FABA,$01 "#DECODE(#PEEK(#PC))".
L $FABA,$01,$12,$02
B $FACC,$01 Terminator.

t $FACD Messaging: "The Elephant Totally Ignores You"
@ $FACD label=Messaging_ElephantTotallyIgnoresYou
N $FACD Print "#DECODESTR(#PC)".
B $FACD,$01 "#DECODE(#PEEK(#PC))".
L $FACD,$01,$16,$02
B $FAE3,$01 Terminator.

t $FAE4 Messaging: "As The Steel Head Strikes The Rubble, Bright Sparks Fly"
@ $FAE4 label=Messaging_SteelHeadStrikesRubbleBrightSparksFly
N $FAE4 Print "#DECODESTR(#PC)".
B $FAE4,$01 "#DECODE(#PEEK(#PC))".
L $FAE4,$01,$47,$02
B $FB2B,$01 Terminator.

t $FB2C Messaging: "The Elephant Trumpets Angrily"
@ $FB2C label=Messaging_ElephantTrumpets
N $FB2C Print "#DECODESTR(#PC)".
B $FB2C,$01 "#DECODE(#PEEK(#PC))".
L $FB2C,$01,$67,$02
B $FB93,$01 Terminator.

t $FB94 Messaging: "It Has No Noticeable Effect"
@ $FB94 label=Messaging_HasNoNoticeableEffect
N $FB94 Print "#DECODESTR(#PC)".
B $FB94,$01 "#DECODE(#PEEK(#PC))".
L $FB94,$01,$13,$02
B $FBA7,$01 Terminator.

t $FBA8 Messaging: "You're Already There"
@ $FBA8 label=Messaging_YoureAlreadyThere
N $FBA8 Print "#DECODESTR(#PC)".
B $FBA8,$01 "#DECODE(#PEEK(#PC))".
L $FBA8,$01,$0A,$02
B $FBB2,$01 Terminator.

t $FBB3 Messaging: "You Make A Valiant Attempt, But It Is Too Wide..."
@ $FBB3 label=Messaging_YouMakeAttempt
N $FBB3 Print "#DECODESTR(#PC)".
B $FBB3,$01 "#DECODE(#PEEK(#PC))".
L $FBB3,$01,$1D,$02
B $FBD0,$01 Terminator.

t $FBD1 Messaging: "Don't Be Ridiculous"
@ $FBD1 label=Messaging_DontBeRidiculous
N $FBD1 Print "#DECODESTR(#PC)".
B $FBD1,$01 "#DECODE(#PEEK(#PC))".
L $FBD1,$01,$0D,$02
B $FBDE,$01 Terminator.

t $FBDF Messaging: "You Must Be Joking!"
@ $FBDF label=Messaging_YouMustBeJoking
N $FBDF Print "#DECODESTR(#PC)".
B $FBDF,$01 "#DECODE(#PEEK(#PC))".
L $FBDF,$01,$0C,$02
B $FBEB,$01 Terminator.

t $FBEC Messaging: "You're Not In It"
@ $FBEC label=Messaging_YoureNotInIt
N $FBEC Print "#DECODESTR(#PC)".
B $FBEC,$01 "#DECODE(#PEEK(#PC))".
L $FBEC,$01,$09,$02
B $FBF5,$01 Terminator.

t $FBF6 Messaging: "You Can't Reach It"
@ $FBF6 label=Messaging_YouCantReachIt
N $FBF6 Print "#DECODESTR(#PC)".
B $FBF6,$01 "#DECODE(#PEEK(#PC))".
L $FBF6,$01,$0B,$02
B $FC01,$01 Terminator.

t $FC02 Messaging: "You've Done That Already"
@ $FC02 label=Messaging_YouveDoneThatAlready
N $FC02 Print "#DECODESTR(#PC)".
B $FC02,$01 "#DECODE(#PEEK(#PC))".
L $FC02,$01,$0C,$02
B $FC0E,$01 Terminator.

t $FC0F Messaging: "It's Already Open"
@ $FC0F label=Messaging_AlreadyOpen
N $FC0F Print "#DECODESTR(#PC)".
B $FC0F,$01 "#DECODE(#PEEK(#PC))".
L $FC0F,$01,$0B,$02
B $FC1A,$01 Terminator.

t $FC1B Messaging: "It's Already Closed"
@ $FC1B label=Messaging_AlreadyClosed
N $FC1B Print "#DECODESTR(#PC)".
B $FC1B,$01 "#DECODE(#PEEK(#PC))".
L $FC1B,$01,$0D,$02
B $FC28,$01 Terminator.

t $FC29 Messaging: "You Can't It's Locked"
@ $FC29 label=Messaging_ItsLocked
N $FC29 Print "#DECODESTR(#PC)".
B $FC29,$01 "#DECODE(#PEEK(#PC))".
L $FC29,$01,$0C,$02
B $FC35,$01 Terminator.

t $FC36 Messaging: "You See A Square Ended Shaft Protruding From The Operating Mechanism"
@ $FC36 label=Messaging_SeeSquareEndedShaft
N $FC36 Print "#DECODESTR(#PC)".
B $FC36,$01 "#DECODE(#PEEK(#PC))".
L $FC36,$01,$25,$02
B $FC5B,$01 Terminator.

t $FC5C Messaging: "You See A Square Hole Through The Boss At One End"
@ $FC5C label=Messaging_SeeSquareHole
N $FC5C Print "#DECODESTR(#PC)".
B $FC5C,$01 "#DECODE(#PEEK(#PC))".
L $FC5C,$01,$1D,$02
B $FC79,$01 Terminator.

t $FC7A Messaging: "The Mechanism Appears To Be Seized With Rust"
@ $FC7A label=Messaging_MechanismSeizedWithRust
N $FC7A Print "#DECODESTR(#PC)".
B $FC7A,$01 "#DECODE(#PEEK(#PC))".
L $FC7A,$01,$1B,$02
B $FC95,$01 Terminator.

t $FC96 Messaging: "The Sluicegate Opens, Releasing A Torrent Of Water Into The Sewer. This Continues For Several Minutes Before Finally Subsiding"
@ $FC96 label=Messaging_SluicegateOpens
N $FC96 Print "#DECODESTR(#PC)".
B $FC96,$01 "#DECODE(#PEEK(#PC))".
L $FC96,$01,$49,$02
B $FCDF,$01 Terminator.

t $FCE0 Messaging: "The Engine Is Already Running"
@ $FCE0 label=Messaging_EngineAlreadyRunning
N $FCE0 Print "#DECODESTR(#PC)".
B $FCE0,$01 "#DECODE(#PEEK(#PC))".
L $FCE0,$01,$0E,$02
B $FCEE,$01 Terminator.

t $FCEF Messaging: "You Don't Have A Key"
@ $FCEF label=Messaging_YouDontHaveAKey
N $FCEF Print "#DECODESTR(#PC)".
B $FCEF,$01 "#DECODE(#PEEK(#PC))".
L $FCEF,$01,$0A,$02
B $FCF9,$01 Terminator.

t $FCFA Messaging: "The Engine Bursts Into Life"
@ $FCFA label=Messaging_EngineBurstsIntoLife
N $FCFA Print "#DECODESTR(#PC)".
B $FCFA,$01 "#DECODE(#PEEK(#PC))".
L $FCFA,$01,$0E,$02
B $FD08,$01 Terminator.

t $FD09 Messaging: "The Circuit Is Energised"
@ $FD09 label=Messaging_CircuitIsEnergised
N $FD09 Print "#DECODESTR(#PC)".
B $FD09,$01 "#DECODE(#PEEK(#PC))".
L $FD09,$01,$48,$02
B $FD51,$01 Terminator.

t $FD52 Messaging: "The Circuit Is De-energised And The Display Disappears"
@ $FD52 label=Messaging_CircuitIsDeenergised
N $FD52 Print "#DECODESTR(#PC)".
B $FD52,$01 "#DECODE(#PEEK(#PC))".
L $FD52,$01,$1F,$02
B $FD71,$01 Terminator.

t $FD72 Messaging: "As You Touch The Wires"
@ $FD72 label=Messaging_TouchTheWires
N $FD72 Print "#DECODESTR(#PC)".
B $FD72,$01 "#DECODE(#PEEK(#PC))".
L $FD72,$01,$3F,$02
B $FDB1,$01 Terminator.

t $FDB2 Messaging: "You Won't Get In There, Carrying That"
@ $FDB2 label=Messaging_YouWontGetInThereCarryingThat
N $FDB2 Print "#DECODESTR(#PC)".
B $FDB2,$01 "#DECODE(#PEEK(#PC))".
L $FDB2,$01,$13,$02
B $FDC5,$01 Terminator.

t $FDC6 Messaging: "The Car Hurtles At The Ramp"
@ $FDC6 label=Messaging_CarHurtlesAtRamp
N $FDC6 Print "#DECODESTR(#PC)".
B $FDC6,$01 "#DECODE(#PEEK(#PC))".
L $FDC6,$01,$8C,$02
B $FE52,$01 Terminator.

t $FE53 Messaging: "You Drag The Body Out Of The Car And Lay It Down"
@ $FE53 label=Messaging_DragBodyOutOfTheCar
N $FE53 Print "#DECODESTR(#PC)".
B $FE53,$01 "#DECODE(#PEEK(#PC))".
L $FE53,$01,$23,$02
B $FE76,$01 Terminator.

t $FE77 Messaging: "It Isn't Switched On"
@ $FE77 label=Messaging_ItIsntSwitchedOn
N $FE77 Print "#DECODESTR(#PC)".
B $FE77,$01 "#DECODE(#PEEK(#PC))".
L $FE77,$01,$0E,$02
B $FE85,$01 Terminator.

t $FE86 Messaging: "You Can't, It's Uncooked"
@ $FE86 label=Messaging_YouCantItsUncooked
N $FE86 Print "#DECODESTR(#PC)".
B $FE86,$01 "#DECODE(#PEEK(#PC))".
L $FE86,$01,$10,$02
B $FE96,$01 Terminator.

t $FE97 Messaging: "That Was Delicious"
@ $FE97 label=Messaging_ThatWasDelicious
N $FE97 Print "#DECODESTR(#PC)".
B $FE97,$01 "#DECODE(#PEEK(#PC))".
L $FE97,$01,$0B,$02
B $FEA2,$01 Terminator.

t $FEA3 Messaging: "You've Eaten Them All"
@ $FEA3 label=Messaging_YouveEatenThemAll
N $FEA3 Print "#DECODESTR(#PC)".
B $FEA3,$01 "#DECODE(#PEEK(#PC))".
L $FEA3,$01,$17,$02
B $FEBA,$01 Terminator.

t $FEBB Messaging: "You Eat The Sweets"
@ $FEBB label=Messaging_YouEatTheSweets
N $FEBB Print "#DECODESTR(#PC)".
B $FEBB,$01 "#DECODE(#PEEK(#PC))".
L $FEBB,$01,$09,$02
B $FEC4,$01 Terminator.

t $FEC5 Messaging: "You Are A Sick Person"
@ $FEC5 label=Messaging_YouAreASickPerson
N $FEC5 Print "#DECODESTR(#PC)".
B $FEC5,$01 "#DECODE(#PEEK(#PC))".
L $FEC5,$01,$0B,$02
B $FED0,$01 Terminator.

t $FED1 Messaging: "That Is Not Advisable"
@ $FED1 label=Messaging_ThatIsNotAdvisable
N $FED1 Print "#DECODESTR(#PC)".
B $FED1,$01 "#DECODE(#PEEK(#PC))".
L $FED1,$01,$0C,$02
B $FEDD,$01 Terminator.

t $FEDE Messaging: "It Isn't Locked"
@ $FEDE label=Messaging_ItIsntLocked
N $FEDE Print "#DECODESTR(#PC)".
B $FEDE,$01 "#DECODE(#PEEK(#PC))".
L $FEDE,$01,$0A,$02
B $FEE8,$01 Terminator.

t $FEE9 Messaging: "You Haven't Got Any Oil"
@ $FEE9 label=Messaging_YouHaventGotAnyOil
N $FEE9 Print "#DECODESTR(#PC)".
B $FEE9,$01 "#DECODE(#PEEK(#PC))".
L $FEE9,$01,$0D,$02
B $FEF6,$01 Terminator.

t $FEF7 Messaging: "You Don't Have A Screwdriver"
@ $FEF7 label=Messaging_YouDontHaveAScrewdriver
N $FEF7 Print "#DECODESTR(#PC)".
B $FEF7,$01 "#DECODE(#PEEK(#PC))".
L $FEF7,$01,$10,$02
B $FF07,$01 Terminator.

t $FF08 Messaging: "You Have Your Hands Full At The Moment"
@ $FF08 label=Messaging_YouHaveYourHandsFullAtTheMoment
N $FF08 Print "#DECODESTR(#PC)".
B $FF08,$01 "#DECODE(#PEEK(#PC))".
L $FF08,$01,$15,$02
B $FF1D,$01 Terminator.

u $FF1E

g $FF40

