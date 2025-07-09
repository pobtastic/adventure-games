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

c $9DCC Game Entry Point Alias
  $9DCC,$02 Jump to #R$9DD7.

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
E $9E0B View the equivalent code in #JEWELS$BA74.
  $9E0B,$04
  $9E0F,$05 #HTML(Clear #N$18 lines from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $9E14,$04
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

c $9E26

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

w $9E33

c $9E80

w $9EC5

c $9EDB

c $9F27

c $9F67

g $9F88 Table: Item Locations
@ $9F88 label=Table_ItemLocations
D $9F88 A table where the index is the item ID, and the value is the room it
. resides in (#N$00 for "currently inactive").
D $9F88 When the item is in the players inventory, the room ID changes to
. #N$01.
E $9F88 View the equivalent code in #JEWELS$BBF0.
B $9F88,$01 Item #N(#PC-$9F88) #ITEM(#PC-$9F88) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $9F88,$01,$88

c $A0D3

g $A106 Current Room ID
@ $A106 label=CurrentRoom
D $A106 The room the player starts the game in is room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
B $A106,$01 Current room ID.

g $A13B User Input: Word Tokens
@ $A13B label=UserInput_Token_1
@ $A13C label=UserInput_Token_2
B $A13B,$01
L $A13B,$01,$0A

c $A16D

c $A1C8

c $A1F4 Print String
@ $A1F4 label=PrintString

c $A25C Print String And A Newline
@ $A25C label=PrintStringAndNewline
D $A25C Shortcut print routine which prints a newline after it's done.
E $A25C View the equivalent code in;
. #LIST
. { #JEWELS$BAB1 }
. { #WARLORD$A592 }
. LIST#
  $A25C,$01
  $A25D,$03 Call #R$A1F4.
N $A260 Force a newline to be "printed".
  $A260,$02 Load a "newline" character into #REGa (#N$0D).
  $A262,$03 Call #R$9E26.
  $A265,$01
  $A266,$01 Return.

c $A267

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

c $A314

c $A33A

c $A4B0

c $A591 Action: Examine Item
@ $A591 label=Action_ExamineItem
R $A591 C Item ID
R $A591 O:F Carry flag set when the item isn't present
  $A591,$01 Increment #REGbc by one.
  $A592,$05 #REGe=*#R$BBC9-#REGc.
  $A597,$01 Stash #REGde on the stack.
  $A598,$04 #REGix=*#R$B60E.
  $A59C,$03 Call #R$A305.
  $A59F,$01 Restore #REGde from the stack.
  $A5A0,$02 Jump to #R$A5A3.
@ $A5A2 label=ExamineItem_Loop
  $A5A2,$01 Increment #REGhl by one.
@ $A5A3 label=ExamineItem
  $A5A3,$05 Jump to #R$A5AE if *#REGhl is equal to #N$FF.
  $A5A8,$03 Call #R$A5C6.
  $A5AB,$02 Jump to #R$A5A2 if the item wasn't found.
  $A5AD,$01 Return.
N $A5AE The item being examined isn't in the room or in the players inventory.
@ $A5AE label=Response_ItemNotHere
N $A5AE Print "STR$000E,$08($b==$FF)".
  $A5AE,$03 #REGhl=#N$000E.
  $A5B1,$03 Call #R$A1F4.
N $A5B4 Print the object name.
  $A5B4,$04 #REGix=*#R$AF31.
  $A5B8,$03 Call #R$A305.
  $A5BB,$03 Call #R$A1F4.
N $A5BE Print "STR$000F,$08($b==$FF)".
  $A5BE,$03 #REGhl=#N$000F.
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
N $A635 The #R$AED1 routine returns with #REGa containing the room ID of the
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

c $A6CF

c $A6E8

W $A6FD,$02

c $A6FF

g $A779

c $A808

c $AC60

c $AC88

c $ACFC

c $AD43

c $AD79

c $ADA1
  $ADA1,$03 #REGhl=#R$9F88.
  $ADA4,$03 #REGbc=#N($0181,$04,$04).
  $ADA7,$02 Write #N$00 to *#REGhl.
  $ADA9,$01 Increment #REGhl by one.
  $ADAA,$01 Decrease #REGbc by one.
  $ADAB,$04 Jump to #R$ADA7 until #REGbc is zero.
  $ADAF,$03 #REGhl=#R$BB0B.
  $ADB2,$03 #REGde=#R$9F88.
  $ADB5,$04 #REGbc=*#R$BBC7.
  $ADB9,$02 LDIR.
  $ADBB,$03 #REGa=*#R$BBD7.
  $ADBE,$03 Write #REGa to *#R$A0D3.
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
  $ADDE,$03 #REGa=*#R$BBD3.
  $ADE1,$03 Write #REGa to *#R$A106.
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

  $AE0D,$03 #REGhl=#N($0010,$04,$04).
  $AE10,$03 Call #R$A25C.
  $AE13,$03 Call #R$AD43.
  $AE16,$03 #REGhl=#N($0011,$04,$04).
  $AE19,$03 Call #R$A25C.
  $AE1C,$03 Call #R$9DFB.
  $AE1F,$05 Jump to #N$0000 if #REGa is equal to #N$4E.
  $AE24,$05 Jump to #R$9DD7 if #REGa is equal to #N$59.
  $AE29,$03 Jump to #R$AE1C.

c $AE2C

g $AFDD Table: Item Descriptions
@ $AFDD label=Table_ItemDescriptions
E $AFDD View the equivalent code in;
. #LIST
. { #JEWELS$D34E }
. { #WARLORD$C732 }
. LIST#
W $AFDD,$02 Item #N((#PC-$AFDD)/$02): #ITEM((#PC-$AFDD)/$02).
L $AFDD,$02,$86

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

g $B4F4
W $B4F4,$02
L $B4F4,$02,$56

g $B60E
W $B60E,$02

g $B969
g $B9EC
g $B9FA
g $BA00
g $BA04
g $BA4D

g $BAF9
W $BAF9,$02
L $BAF9,$02,$06,$02

g $BB05

g $BB0B
B $BB0B

g $BBC7 Number Of Object
@ $BBC7 label=Count_Objects_1
D $BBC7 The total number of objects in the game.
W $BBC7,$02

g $BBC9 Number Of Objects
@ $BBC9 label=Count_Objects_2
D $BBC9 The total number of objects in the game.
W $BBC9,$02

g $BBCB

g $BBD1
B $BBD1,$01

g $BBD3
B $BBD3,$01

g $BBD7
B $BBD7,$01

g $CA2B
W $CA2B,$02
L $CA2B,$02,$25

g $C8E9
T $C8E9
