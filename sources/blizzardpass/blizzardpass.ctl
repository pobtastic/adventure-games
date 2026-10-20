; Copyright Adventuresoft UK Ltd 1986, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.
; Alan Cox's Ashminster engine: a four-letter verb and noun, object locations
; and flag bytes. The names below describe this code.
; The 48K window at $C000 is RAM bank 0, the picture data, not bank 7.
; The snapshot's port $7FFD holds $10, and the page value saved at $66D7 is
; $10 as well. $66BD ORs $10 into A and writes $7FFD, so during play $C000 is
; bank 0 except while a description pages bank 6 or the prompt pages bank 3.
; The loader's OUT 32765,23 pages bank 7 only so 128 BASIC can LOAD. The
; copier writes the adventure into banks 6, 3 and 0 and then pages bank 0
; back; the game never copies itself into bank 7 and never selects it again,
; which is why that bank is the BASIC residue 128 BASIC had already left at
; $FF18. Banks 1 and 4 are empty. Bank 3 (the parser) and bank 6 (the location
; text) are disassembled beside this file and pulled in by the @bank directives.

> $4000 @start=$FFE9
@ $4000 org=$4000
> $4000 @expand=#DEF(#COLOUR(id) #LET(ink=$id&$07)#IF({ink}>=$00)(INK:#HTML(&#10;)#MAP({ink})(#HTML(&#10;)UNKNOWN,0:BLACK,1:BLUE,2:RED,3:MAGENTA,4:GREEN,5:CYAN,6:YELLOW,7:WHITE)),#HTML(&#10;)#LET(paper=$id>>$03&$07)#IF({paper}>=$00)(PAPER:#HTML(&#10;)#MAP({paper})(#HTML(&#10;)UNKNOWN,0:BLACK,1:BLUE,2:RED,3:MAGENTA,4:GREEN,5:CYAN,6:YELLOW,7:WHITE))#HTML(&#10;)#LET(bright=$id&$40)#IF({bright}>$00)((BRIGHT))#HTML(&#10;)#LET(flash=$id&$80)#IF({flash}>$00)(FLASH: ON))
> $4000 @expand=#DEF1(#SKOOLKID(addr)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/#EVAL({addr},16,4).html">){name}#HTML(</a>))
> $4000 @expand=#DEF(#FAIL Jump to #R$6753 to reject this bytecode condition.)
> $4000 @expand=#DEF1(#PAGE(bank) page RAM bank #N({bank}) in at #N($C000), keeping the 48K ROM)
> $4000 @expand=#DEF1(#NOWHERE(addr) #IF(#PEEK({addr})==$FC)(nowhere)#IF(#PEEK({addr})!=$FC)(room #N(#PEEK({addr}))))
> $4000 @expand=#DEF(#LOCATIONS #BANK6#MESSAGE($C000)#BANK0)
> $4000 @expand=#DEF1(#MESSAGE(addr)#STR{addr},$08($b==$5E||$b==$7E))
> $4000 @expand=#DEF(#RECORDLINKS Found by #R$6E43 and drawn by #R$6E53.)
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @expand=#DEF(#PICTURE(room)(fname,title) #SIM(start=$$66C1,stop=$$66C5,a=$$00,bc=$$7FFD)#PUSHS #UDGTABLE { =h $title } { #SIM(start=$$600F,stop=$$6051,sp=$$5D84)#POKES$$5D87,$room#SIM(start=$$6DFA,stop=$$6E38,sp=$$5D84)#SCR$$02,$$00,$$00,$$20,$$0C($fname) } UDGTABLE# #POPS)
> $4000 @set-handle-unsupported-macros=1

b $4000 Loading Screen
@ $4000 label=Loading
@ $4000 bank=3,sources/blizzardpass/bank3.skool
@ $4000 bank=6,sources/blizzardpass/bank6.skool
@ $4000 bank=7,sources/blizzardpass/bank7.skool
@ $4000 bank=0
D $4000 The title picture shown while the 128K loader copies each block into
. place.
D $4000 #UDGTABLE { =h Blizzard Pass Loading Screen. } { #SCR$02(loading) } UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

b $5B00 Command Buffer
@ $5B00 label=CommandBuffer
D $5B00 Characters typed at the prompt, in capitals, ending with ENTER. The
. parser refuses a line longer than #N$5E characters.
  $5B00,$5E

b $5B60 Word Being Printed
@ $5B60 label=WordBuffer
D $5B60 The printer collects one word here and flushes it when it hits a
. space, ENTER, or a message terminator.
  $5B60,$19

g $5B79 Script Matched
@ $5B79 label=ScriptMatched
D $5B79 Set when a bytecode line's verb and noun matched. The next line is
. skipped until this is cleared.

g $5B7A Search Hit
@ $5B7A label=SearchHit
D $5B7A Set when a movement or an object list finds what it is looking for.

b $5B7B Word Under Test
@ $5B7B label=WordToken
D $5B7B Four characters of the word currently being matched, padded with
. spaces.
  $5B7B,$04

g $5B7F Verb
@ $5B7F label=Verb
D $5B7F Token of the first word. Directions are #N$01 to #N($0A), inventory is
. #N($0B), GET is #N($0C), DROP is #N($0D), WEAR is #N$0E and QUIT is #N$10.

g $5B80 Noun
@ $5B80 label=Noun
D $5B80 Token of the second word. IT and THEM reuse the previous noun.

g $5B81 Counter #N$01
@ $5B81 label=Counter1
D $5B81 Bytecode counter compared by condition #N$11.

g $5B82 Counter #N$02
@ $5B82 label=Counter2
D $5B82 Bytecode counter compared by condition #N$12.

g $5B83 Counter #N$03
@ $5B83 label=Counter3
D $5B83 Bytecode counter compared by condition #N$13.

g $5B84 Exit Key
@ $5B84 label=ExitKey
D $5B84 The current room plus #N($80), which is how that room is keyed in the
. exit table.

g $5B85 Continuation
@ $5B85 label=Continuation
D $5B85 Non-zero when a comma left more of the command line for the next turn.

g $5B86 Word Slot
@ $5B86 label=WordSlot
D $5B86 How many words of this command have been stored. The script runner
. clears it after the first matched line.

g $5B87 Print Address
@ $5B87 label=PrintAddress
D $5B87 Spectrum display address where the next glyph is plotted.

g $5B89 Print Row
@ $5B89 label=PrintRow
D $5B89 Character row of the cursor. It is saved and restored as a pair with
. the column.

g $5B8A Print Column
@ $5B8A label=PrintColumn
D $5B8A Character column of the cursor. The text window is #N$2B columns wide.

g $5B8B Words Recognised
@ $5B8B label=WordCount
D $5B8B How many vocabulary words the parser kept from the current line.

g $5B8C Rest Of The Line
@ $5B8C label=InputPointer
D $5B8C Where to resume after a comma, and the pointer the vocabulary scan
. restores.

g $5B8E Input Length
@ $5B8E label=InputLength
D $5B8E Characters currently in the command buffer. DELETE is ignored when
. this is zero.

g $5B8F Message Number
@ $5B8F label=MessageNumber
D $5B8F Which terminated message to print, counted from the start of the
. chosen table.

g $5B90 Message Pointer
@ $5B90 label=MessagePointer
D $5B90 Address of the message byte just printed.

g $5B92 Scratch
@ $5B92 label=Scratch92
D $5B92 Two unused bytes between the message pointer and the subtraction
. scratch.

g $5B94 Subtraction Scratch
@ $5B94 label=SubtractScratch
D $5B94 Holds the amount being subtracted from a flag byte.

g $5B95 Room Changed
@ $5B95 label=RoomChanged
D $5B95 Set when a script or a movement changes the room, so the loop
. describes it again.

g $5B96 Which Script Table
@ $5B96 label=ScriptSet
D $5B96 #N$FF while the high-priority scripts run, and zero for the ordinary
. command scripts.

g $5B97 Bottom Row
@ $5B97 label=BottomRow
D $5B97 Last character row the text window may use before it scrolls.

g $5B98 Word Length
@ $5B98 label=WordLength
D $5B98 Characters collected for the word that is about to be flushed.

g $5B99 Word Pointer
@ $5B99 label=WordPointer
D $5B99 Next free byte in the word buffer.

g $5B9B Last Character
@ $5B9B label=LastCharacter
D $5B9B The character just expanded. A full stop here makes the next letter a
. capital.

g $5B9C Previous Glyph
@ $5B9C label=PreviousGlyph
D $5B9C The glyph just plotted, so a second space in a row can be rubbed out.

g $5B9D Previous Noun
@ $5B9D label=PreviousNoun
D $5B9D The noun IT and THEM refer to.

b $5B9E Picture Workspace
@ $5B9E label=PictureWorkspace
D $5B9E Coordinates, shape bytes and the last matched verb used while an
. illustration is drawn.
  $5B9E,$32

w $5BD0 Screen Row Addresses
@ $5BD0 label=ScreenRows
D $5BD0 Pixel address of each character row in the text window. Row 0 is the
. top of the display.
N $5BD0 The rows are #FOR$5BD0,$5BFE,$02||x|#N((x-$5BD0)/$02) at
. #N(#PEEK(x)+$100*#PEEK(x+$01))|, | and ||.
  $5BD0,$02 Row #N((#PC-$5BD0)/$02).
L $5BD0,$02,$18,$02

b $5C00 System Variables
@ $5C00 label=SystemVariables
D $5C00 The ROM's system variables, still in use while the game runs. IY is
. left pointing at #SKOOLKID$5C3A(ERR_NR), and the maskable interrupt keeps
. #SKOOLKID$5C78(FRAMES), #SKOOLKID$5C00(KSTATE), #SKOOLKID$5C08(LAST_K) and
. #SKOOLKID$5C3B(FLAGS) up to date for the routines that read them.
  $5C00,$B6

b $5CB6 Stack
@ $5CB6 label=StackSpace
D $5CB6 The channel information and the BASIC loader, left as they were when
. the game started. #R$5ECB(#N$5ED1) sets the stack pointer to #R$5D84, just
. below the room state, and the stack grows down from there into the end of
. this block.
  $5CB6,$CE

g $5D84 Stack Top
@ $5D84 label=StackTop
D $5D84 The stack pointer installed at the start of the game loop. Two bytes
. sit under the room byte.

g $5D87 Current Room
@ $5D87 label=CurrentRoom
D $5D87 The room the player is in. Its short text at #R$75CE is used for rooms
. #N$66 and above, and for every room while pictures are on. Otherwise the
. long description comes from bank 6.

g $5D88 Darkness
@ $5D88 label=Darkness
D $5D88 Non-zero when the location is dark and must be described as such.

g $5D89 Carried Object
@ $5D89 label=CarriedObject
D $5D89 Object in the hands. #N$FD means the hands are empty.

g $5D8A Worn Object
@ $5D8A label=WornObject
D $5D8A Object being worn. #N$FE means nothing is worn.

g $5D8B State Byte
@ $5D8B label=StateByte
D $5D8B Copied from the initial state as flag byte 4. The bytecode addresses
. it through #R$67FF.

g $5D8C Carried Count
@ $5D8C label=CarriedCount
D $5D8C How many objects are currently carried. GET increments it and DROP
. decrements it.

g $5D8D Object Total
@ $5D8D label=ObjectTotal
D $5D8D How many object slots to scan when listing what is here. It starts at
. #N$96.

g $5D8E Repeat Counter
@ $5D8E label=RepeatCounter
D $5D8E While this is non-zero the game loop reruns the scripts and redraws,
. then decrements it.

b $5D8F Flag Bytes
@ $5D8F label=FlagBytes
D $5D8F The rest of the flag area the bytecode indexes from #R$5D87. It is
. cleared at the start of a game.
  $5D8F,$3B

b $5DCA Object Locations
@ $5DCA label=ObjectLocations
D $5DCA One byte per object, copied from #R$B6A8 at the start of a game. The
. byte is the room the object is in, or #N$FC when it is nowhere. Slots #N$3B
. and #N$3E are also the 'J' markers tested before the scripts run.
  $5DCA,$100

g $5ECA Condition Failed
@ $5ECA label=ConditionFailed
D $5ECA Set when a bytecode condition fails or an action wants the rest of the
. line skipped.

c $5ECB Game Loop
@ $5ECB label=GameLoop
D $5ECB Runs the adventure. It prepares a new game, describes the room, runs
. the location scripts, draws the picture, then reads a command and obeys it.
. A ROM error returns with the stack at #R$6B41.
N $5ECB Install the word at #R$6B41 as the ROM error handler and give the game
. its own stack.
  $5ECB,$06 Store #R$6B41 in #SKOOLKID$5C3D(ERR_SP).
  $5ED1,$03 The stack grows down from #R$5D84.
N $5ED4 Start in the first room with an empty inventory.
  $5ED4,$03 Call #R$600F to prepare a new game.
  $5ED7,$04 The picture has not been drawn yet.
@ $5EDE label=GameLoop_Act
N $5EDE Run the high-priority scripts, and describe the room again if they
. moved the player.
  $5EDE,$04 Write #N$00 to *#R$5D8E.
  $5EE2,$03 Call #R$6058 to run the high-priority scripts.
  $5EE5,$06 Jump to #R$5EEE when the room stayed the same.
  $5EEB,$03 Call #R$6187 to describe the new room.
@ $5EEE label=GameLoop_Draw
N $5EEE Draw the illustration once for this room, then either repeat or ask
. for a command.
  $5EEE,$03 Call #R$6B15 to draw the picture if this room is not already on
. screen.
  $5EF1,$04 Write #N$00 to *#R$5B95.
  $5EF5,$06 Jump to #R$5F46 while a script asked for another look.
N $5EFB Read a command. An empty line is a complaint, not an action.
  $5EFB,$03 Call #R$66C7 to read the next command from bank 3.
  $5EFE,$06 Jump to #R$5F21 when a verb was recognised.
  $5F04,$06 Jump to #R$5F21 when a noun was recognised.
  $5F0A,$05 Message #N$0B: that input contained no recognised words.
  $5F0F,$04 A failed line does not keep a comma continuation.
  $5F13,$02 Jump to #R$5EDE for another turn.

g $5F15 Pictured Object
@ $5F15 label=PicturedObject
D $5F15 The room-change scan compares a picture record with this byte. Nothing
. in the game writes it, so the comparison is against zero.

c $5F16 Character Row Address
@ $5F16 label=RowAddress
D $5F16 Turns a character row in #REGa into the display address of that row.
R $5F16 O:DE Display address of character row #REGa.
  $5F16,$04 Double the row number.
  $5F1A,$04 Add the screen-row table at #R$5BD0.
  $5F1E,$03 Enter #SKOOLKID$2AEE(DE (DE+1)) at #N$2AF0 to load the row address
. into #REGde.

c $5F21 Obey Command
@ $5F21 label=ObeyCommand
D $5F21 Turns the verb and noun into a movement or a scripted action. PUSH,
. PULL, ROLL or MOVE with CURTAINS is rewritten to noun #N$2B. WET, COOL, DAMP
. or SOAK is refused, except with the robe, the door or the running water.
N $5F21 Curtains are a special noun for the pushing verbs.
  $5F21,$04 Verb #N$1B (PUSH, PULL, ROLL or MOVE) continues.
  $5F25,$07 Noun #N$85 (CURTAINS) continues.
  $5F2C,$05 That pair becomes noun #N$2B.
N $5F31 A movement that matches an exit changes the room and skips the
. scripts.
@ $5F31 label=ObeyCommand_Move
  $5F31,$03 Call #R$5FF1 to take an exit in the direction just typed.
  $5F34,$07 A matched exit is remembered as a room change, and the scripts are
. not run.
  $5F3D,$03 Call #R$6074 to run the ordinary command scripts.
  $5F40,$04 Jump to #R$5F65 when no script line matched.
@ $5F46 label=ObeyCommand_Repeat
N $5F46 A script asked for the location to be reconsidered several times.
  $5F46,$06 Jump to #R$5EDE once the repeat count has run out.
  $5F4C,$07 Run the high-priority scripts again without keeping the old
. room-changed flag.
  $5F59,$03 Call #R$6187 when those scripts moved the player.
@ $5F5C label=ObeyCommand_Redraw
  $5F5C,$07 Redraw, then count down one repeat.
@ $5F65 label=ObeyCommand_Wet
N $5F65 WET, COOL, DAMP or SOAK only works on the robe, the door or the
. running water.
  $5F65,$07 Only verb #N$1C (WET, COOL, DAMP or SOAK) continues.
  $5F6C,$07 The robe, noun #N($B8), is allowed.
  $5F73,$04 The running water, noun #N($DE), is allowed.
  $5F77,$04 The door, noun #N($D1), is allowed.
  $5F7B,$05 The sentence at #R$5F8F is #N$1B characters.
@ $5F80 label=ObeyCommand_Water
  $5F80,$07 Print one character of it.
  $5F87,$05 Finish that sentence with ENTER and take another turn.

t $5F8F That Will Not Absorb Water
@ $5F8F label=AbsorbWater
D $5F8F Printed when something is asked to soak up water and cannot. The text
. is "#STR(#PC,,$1B)".
  $5F8F,$1B

c $5FAA Refuse Command
@ $5FAA label=RefuseCommand
D $5FAA The scripts did not handle the command. A direction says you cannot go
. that way, any other verb is beyond the game, and a blank verb produces the
. longer refusal.
  $5FAA,$04 Drop any comma continuation.
  $5FAE,$06 A blank verb is not a direction.
  $5FB4,$04 Verbs #N$01 to #N$0A are the directions that use message #N$18.
@ $5FBC label=RefuseCommand_Verb
  $5FBC,$08 Some other verb selects message #N$0C: it's beyond my power to do
. that.
@ $5FCA label=RefuseCommand_None
  $5FCA,$02 Message #N$20: I don't understand that verb.
@ $5FC4 label=RefuseCommand_Print
  $5FC4,$03 Call #R$63D4 to print the chosen refusal.
  $5FC7,$03 Jump to #R$5EDE for another turn.

c $5FCE Find Room In Exit Table
@ $5FCE label=FindExits
D $5FCE Looks through #R$AB67 for the current room. The room is stored as
. itself plus #N$80.
R $5FCE O:HL The matching room key, or the end of a full sweep of the table.
  $5FCE,$08 The search key is the room plus #N$80.
  $5FD6,$04 Nothing has matched yet.
@ $5FE0 label=FindExits_Scan
  $5FE0,$04 A matching key is this room.
  $5FE4,$06 The table wraps when the pointer reaches #N$34CE.
  $5FEA,$05 Otherwise keep scanning.
@ $5FEF label=FindExits_Found
  $5FEF,$02 Return.

c $5FF1 Take Exit
@ $5FF1 label=TakeExit
D $5FF1 If the verb is one of the directions listed for this room, move to the
. destination that follows it.
  $5FF1,$04 Call #R$5FCE to find this room's exits.
@ $5FF5 label=TakeExit_Next
N $5FF5 Each exit is a verb byte with bit 7 clear, then the destination room.
. Bit 7 ends the room.
  $5FF5,$06 Bit 7 ends this room's exits.
  $5FFB,$04 Keep the exit whose verb is the one just typed.
  $6001,$08 Remember the match and clear the last-matched verb.
  $6009,$05 Move to the destination room.
@ $600E label=TakeExit_Done
  $600E,$01 Return.

c $600F Prepare New Game
@ $600F label=PrepareGame
D $600F Clears the screen, forgets the previous command and copies the initial
. object locations and state into place.
N $600F The text window sits on rows #N$16 and #N$17 until a location
. description moves it.
  $600F,$05 The text window uses rows #N$16 and #N$17.
  $6014,$05 The cursor starts on row #N$16.
  $6019,$03 Call #R$654B to home that row.
  $601C,$04 Column 0.
  $6020,$03 Call #R$6618 to blank the display.
N $6023 Forget the verb, the noun and the three counters.
  $6023,$03 Point at the five command bytes at #R$5B7F.
  $6026,$02 Five bytes: the verb, the noun and the three counters.
@ $6028 label=PrepareGame_ClearCommand
  $6028,$05 Clear one byte and step on.
  $602D,$04 There is no comma left over from a previous game.
N $6031 A new game starts in room 0 with empty flags, then the authored state
. is copied in.
  $6031,$03 Point at the state and flag area at #R$5D87.
  $6034,$02 #N$41 bytes, through the last flag.
@ $6036 label=PrepareGame_ClearState
  $6036,$05 Clear one byte and step on.
  $603B,$0B Copy the initial object locations from #R$B6A8.
  $6046,$0B Copy the six initial state bytes from #R$6052 onto #R$5D88.
  $6051,$01 Return.

b $6052 Initial State
@ $6052 label=InitialState
D $6052 Copied onto #R$5D88 at the start of a game: not dark, nothing carried
. (#N$FD), nothing worn (#N$FE), flag byte 4 set to #N($04), nothing in the
. carried count, and #N$96 objects to scan.
  $6052,$06

c $6058 Run High-Priority Scripts
@ $6058 label=RunPriorityScripts
D $6058 Clears the first 'J' marker when both marker slots hold #N($4A), then
. runs the script table at #R$96D9.
N $6058 The loader subtracted 3 from the address written below, so the
. snapshot clears #N$5E05 rather than #N$5E08.
  $6058,$07 Object slot #N$3B must hold 'J' (#N$4A).
  $605F,$07 Object slot #N$3E must hold 'J' as well.
  $6066,$04 Clear slot #N$3B. A fresh game has #N$FC in slot #N($3E), so this
. does not fire.
@ $606A label=RunPriorityScripts_Run
  $606A,$08 Select the high-priority table and fall into the runner.

c $6074 Run Script Table
@ $6074 label=RunScripts
D $6074 Walks a bytecode table. A line whose verb and noun match is executed;
. a failed condition or a bit-6 action stops the line. #N$7F ends the table.
N $6074 The ordinary command scripts live at #R$9A54 and are marked by a clear
. script-set flag.
  $6074,$07 Select the ordinary scripts. The high-priority entry joins here.
@ $607B label=RunScripts_Line
  $607B,$02 Keep the line pointer in #REGde while #REGhl walks it.
  $607D,$07 No line has matched yet, and no condition has failed.
  $6084,$03 Call #R$6155 to test the verb and noun.
  $6087,$02 The next byte is a condition or an action.
@ $6089 label=RunScripts_Failed
  $6089,$07 A failed line is abandoned and the next one is tried.
@ $6090 label=RunScripts_Next
  $6090,$03 Return at the #N$7F end marker.
  $6093,$04 Bit 7 on the current byte starts the actions.
@ $6097 label=RunScripts_Condition
N $6097 A condition byte, shifted, picks a routine from #R$67CB. The object
. byte in front of it is looked up in #R$5DCA.
  $6097,$03 Shift the condition number so it indexes a word.
  $609A,$09 Index the condition table at #R$67CB.
  $60A3,$0C Plant that routine over the call at #R$60C1.
  $60AF,$04 The next bytecode byte is the object number.
  $60B3,$06 Point at that object's location in #R$5DCA.
  $60B9,$05 The location itself is what the condition compares.
  $60BE,$03 The byte after the object is the condition's parameter.
  $60C1,$08 The condition routine returns normally when it passes, or sets
. #R$5ECA when it fails.
  $60C9,$06 A failure skips the rest of this line.
  $60CF,$04 Otherwise keep testing while bit 7 is clear.
@ $60D3 label=RunScripts_Matched
N $60D3 The line matched. Remember that, and perform each action until one
. asks to stop.
  $60D3,$05 Remember that a line matched.
@ $60D8 label=RunScripts_NextAction
  $60D8,$06 The word slot is clear, so nothing to forget.
  $60DE,$04 The first matched line of a command clears #R$5B86.
@ $60E2 label=RunScripts_Action
  $60E2,$09 Bit 6 asks the runner to stop after this action.
@ $60EB label=RunScripts_Do
  $60EB,$05 Keep the action number in the low six bits and double it.
  $60F0,$09 Index from the word inside #R$6AD4. Action 0 is the beeper
. operand; the routines start at #R$6AD7.
  $60F9,$0C Plant that routine over the call at #R$6117.
  $6105,$03 The next bytecode byte is the object number.
  $6108,$07 Point at that object's location in #R$5DCA.
  $610F,$05 The location itself is passed to the action.
  $6114,$03 The byte after the object is the action's parameter.
  $6117,$03 Call the patched action.
  $611A,$02 Restore the line pointer and the table pointer.
  $611C,$03 Call #R$6133 to step past the action.
  $611F,$05 Stop the table when the action raised #R$5ECA.
  $6124,$04 Bit 7 continues this line's next action.
  $6128,$03 Jump to #R$6089 to start the next line.

c $612B Step Past Condition
@ $612B label=SkipCondition
D $612B Moves HL past a condition and its parameter. Condition numbers below
. #N$15 have no extra object byte.
  $612B,$05 Step past the condition byte and its object byte.
  $6130,$01 Conditions below #N$15 have no further parameter.
  $6131,$01 Step past the parameter byte.
  $6132,$01 Return.

c $6133 Step Past Action
@ $6133 label=SkipAction
D $6133 Moves HL past an action. Actions #N$09 to #N$15 carry one extra byte,
. and higher actions carry two.
  $6133,$04 Keep the action number and step past it.
  $6137,$03 Actions below #N$09 have no parameter.
  $613A,$04 Actions #N$09 to #N$15 carry one extra byte.
  $613E,$01 Higher actions carry a second extra byte.
@ $613F label=SkipAction_One
  $613F,$01 Step past the last parameter byte.
  $6140,$01 Return.

c $6141 Skip Failed Line
@ $6141 label=SkipLine
D $6141 Drops the remaining conditions and actions of a line that has already
. failed.
  $6141,$02 Take the saved line pointer.
@ $6143 label=SkipLine_Conditions
  $6143,$04 Bit 7 ends the conditions.
@ $6147 label=SkipLine_Condition
  $6147,$03 Step past one condition.
  $614A,$04 Keep going while bit 7 is clear.
@ $614E label=SkipLine_Action
  $614E,$03 Step past one action.
  $6151,$04 Keep going while bit 7 is set.

c $6155 Match Verb And Noun
@ $6155 label=MatchCommand
D $6155 Accepts a script line whose verb and noun match the command. #N$7E
. matches any word. The high-priority table matches every line.
R $6155 O:HL Zero at the end of the table, otherwise the first condition or action.
  $6155,$05 The end marker #N$7F is not a verb.
  $615A,$03 It returns a zero pointer.
  $615D,$01 Return.
@ $615E label=MatchCommand_Verb
  $615E,$06 The high-priority table matches every line.
  $6164,$05 A verb of #N$7E matches any command.
  $6169,$06 Otherwise the verb must be the one just typed.
  $616F,$03 A miss skips this line.
@ $6172 label=MatchCommand_Noun
  $6172,$06 A noun of #N$7E matches any noun.
  $6178,$06 Otherwise the noun must be the one just typed.
@ $617E label=MatchCommand_NounOk
  $617E,$01 The noun matched, so the line's tests follow.
@ $617F label=MatchCommand_Hit
  $617F,$02 Remember this line.
  $6181,$01 Return.
@ $6182 label=MatchCommand_Miss
  $6182,$03 Try the next line.

g $6185 Picture Already Drawn
@ $6185 label=PictureDrawn
D $6185 The room whose illustration is already on screen. A different room is
. drawn.

g $6186 Pause At The Bottom
@ $6186 label=PauseFlag
D $6186 While a location is being described, reaching row #N$13 waits for a
. key and scrolls.

c $6187 Describe Location
@ $6187 label=DescribeLocation
D $6187 Prints where the player is, what is here, and which ways lead out.
. Bank 6 supplies the long text for rooms below #N($66), and it opens
. "#LOCATIONS". A dark room says so and lists nothing. The text is underlined
. before the cursor is put back for the prompt.
N $6187 Remember the cursor, and choose a row. Pictures use row #N$0D so the
. text sits under the illustration.
  $6187,$05 The description pauses at the bottom of the picture.
  $618C,$05 A full stop makes the first letter a capital.
  $6191,$08 Save the cursor so it can be restored under the rule.
  $6199,$03 Call #R$65ED to clear the text rows.
  $619C,$04 Pictures off forces row 0.
  $61A0,$05 Pictures on use row #N$0D.
@ $61A5 label=DescribeLocation_Row
  $61A5,$03 Remember that row.
  $61A8,$07 Call #R$654B and home the cursor.
  $61AF,$06 Darkness skips the description.
  $61B5,$05 Message #N$19: it is dark, you cannot see.
  $61BA,$03 Jump to #R$6262 to underline the description.
@ $61BD label=DescribeLocation_Text
N $61BD Rooms under #N$66 with pictures switched off are read from bank 6.
. Every other room uses the tokenised text at #R$75CE.
  $61BD,$03 The default text is the tokenised list at #R$75CE.
  $61C0,$07 Rooms at or above #N$66 have no long description.
  $61C7,$09 Pictures on also keep the short text.
@ $61D0 label=DescribeLocation_Page
  $61D0,$06 #PAGE$06.
  $61D6,$04 The long description starts at #N$C000.
@ $61DA label=DescribeLocation_Print
  $61DA,$03 Store the room as the message number.
  $61DD,$03 Call #R$629D to print that description.
  $61E0,$04 #PAGE$00.
  $61E4,$08 No object has been listed yet. Start the scan at #R$5DCA.
@ $61EC label=DescribeLocation_Objects
N $61EC List every object whose location byte is this room. The first one is
. introduced with a colon.
  $61EC,$06 This object is in the current room.
  $61F2,$06 Another object in the same room skips the introduction.
  $61F8,$05 An index below #N$46 is named without the introduction.
  $61FD,$06 Message 0: ". You can see ".
  $6203,$0A Print a space and a colon.
  $620D,$0A Print a dash and a space.
@ $6217 label=DescribeLocation_Seen
  $6217,$05 Remember that an object was listed.
@ $621C label=DescribeLocation_Name
  $621C,$04 Call #R$63D7 to print this object's name.
@ $6220 label=DescribeLocation_Next
  $6220,$06 Stop at the object total.
  $6226,$04 The next location byte belongs to the next object.
@ $622A label=DescribeLocation_Exits
N $622A After the objects, list the directions that leave this room.
  $622A,$06 An empty list needs no tidy-up.
  $6230,$0A Two backspaces remove the comma after the last object.
@ $623A label=DescribeLocation_Moves
  $623A,$03 Call #R$5FCE to find this room's exits.
  $623D,$05 No exits means no "you can go" line.
  $6242,$05 Message #N$0D: ". You can go".
@ $6247 label=DescribeLocation_Exit
  $6247,$05 Bit 7 ends the list of directions.
  $624C,$07 Print the direction and step to the next exit.
@ $6253 label=DescribeLocation_Stop
  $6253,$0A Rub out the last comma.
  $625D,$05 Finish with a full stop.
@ $6262 label=DescribeLocation_Rule
N $6262 Underline the description and restore the cursor the caller had saved.
  $6262,$04 The description is finished, so scrolling may resume.
  $6266,$05 Start the rule on a new line.
  $626B,$09 Pictures on keep the row the text already reached.
  $6274,$05 Pictures off force row #N$0F.
  $6279,$09 Home the cursor and keep that row.
@ $6282 label=DescribeLocation_Bottom
  $6282,$04 The rule sits on the row under the text.
  $6286,$02 Forty-two underscores fill the row.
@ $6288 label=DescribeLocation_Bar
  $6288,$07 Print one underscore.
  $628F,$05 Close the rule with ENTER.
  $6294,$08 Restore the cursor saved before the description from the stack.
  $629C,$01 Return.

c $629D Print Terminated Message
@ $629D label=PrintMessage
D $629D Prints message number #R$5B8F from the table at HL. Each message ends
. at #N$5E or #N$7E.
  $629D,$04 Call #R$62A2 and return with interrupts enabled.

c $62A2 Find And Print Message
@ $62A2 label=FindMessage
D $62A2 Skips earlier messages by counting #N$5E and #N$7E terminators, then
. expands each byte as a dictionary word.
@ $62B2 label=FindMessage_Skip
  $62A2,$08 The next word is collected at #R$5B60.
  $62AA,$07 Message 0 is already under #REGhl.
  $62B1,$01 The scan starts on the byte before the message.
  $62B2,$06 Look at the next byte.
  $62B8,$06 #N$7E ends a message too, otherwise keep scanning.
@ $62BE label=FindMessage_Count
  $62BE,$03 Count down the messages and land on the chosen one.
@ $62C1 label=FindMessage_Byte
  $62C1,$07 Remember this byte and expand it.
  $62C8,$06 #N$7E ends the message.
  $62CE,$03 #N$5E ends the message.
  $62D1,$06 Otherwise expand the next byte.

c $62D7 Expand Dictionary Word
@ $62D7 label=ExpandToken
D $62D7 Treats A as an index into #R$B1BC. Word 0 is empty. Every other word
. ends with bit 7 set.
@ $62DF label=ExpandToken_Scan
  $62D7,$07 Token 0 is the first dictionary word.
  $62DE,$01 The scan starts on the byte before the dictionary.
  $62DF,$07 Skip to the end of one word. Bit 7 marks it.
@ $62E6 label=ExpandToken_Next
  $62E6,$02 Count down to the requested word.
@ $62E8 label=ExpandToken_Word
  $62E8,$01 Step onto its first character.
@ $62E9 label=ExpandToken_Character
  $62E9,$04 Print this character.
  $62ED,$05 Bit 7 ends the word.

c $62F2 Capitalise After A Full Stop
@ $62F2 label=Capitalise
D $62F2 After a full stop, a letter is forced to capitals. A space is handled
. by #R$6B2B so a terminator cannot split a word.
  $62F2,$02 Keep the character while the last one is inspected.
  $62F4,$07 A preceding full stop capitalises the next letter.
  $62FB,$07 A character below #N$40 is not a letter.
  $6302,$08 #N$5E and #N$7E are terminators, not letters.
  $630A,$03 Clear bit 5 to make the letter a capital.
@ $630D label=Capitalise_Plain
  $630D,$06 The printer sees the character without bit 7. A space flushes the
. word.
  $6313,$03 A space is finished by #R$6B2B.
  $6316,$03 Remember this character as the last one printed.

c $6319 Collect A Word
@ $6319 label=CollectWord
D $6319 Adds the character to the current word. A space, ENTER or a terminator
. flushes the word, wrapping when it would pass column #N$2B.
@ $633C label=CollectWord_Flush
  $6319,$04 Save the registers around the word buffer.
  $631D,$08 Store the character and advance the word pointer.
  $6325,$04 Count it.
  $6329,$08 A space or ENTER flushes the word.
  $6331,$08 #N$5E or #N$7E flushes it too.
  $6339,$03 Any other character returns.
  $633C,$03 Point at the length.
  $633F,$08 #N$5E or #N$7E is not part of the width.
  $6347,$04 A space is not part of the width either.
@ $634B label=CollectWord_Drop
  $634B,$01 Drop that character from the count.
@ $634C label=CollectWord_Width
  $634C,$01 Remember the character being flushed.
  $634D,$06 Wrap when the column plus the word would pass #N$2A.
  $6353,$03 Call #R$6378 when the word does not fit.
  $6356,$01 Restore the character from the stack.
  $6357,$03 The buffered word starts at #R$5B60.
@ $635A label=CollectWord_Character
  $635A,$05 #N$7E is printed as a space and finishes the message.
  $635F,$07 Print that space and finish.
@ $6366 label=CollectWord_End
  $6366,$04 #N$5E finishes the message.
  $636A,$08 A space or ENTER finishes after it is printed.
  $6372,$06 Print this character and continue the word.
@ $6378 label=WrapLine
N $6378 The word does not fit on this row.
  $6378,$05 Start a new line.
  $637D,$01 Return.
@ $637E label=CollectWord_Newline
  $637E,$07 #N$5E starts a new line and then resets the word.
@ $6385 label=CollectWord_Break
  $6385,$03 A space or ENTER is printed before the reset.
@ $6388 label=CollectWord_Reset
  $6388,$06 Point the next word back at #R$5B60.
  $638E,$06 Clear the length and restore the registers.

c $6394 Print Character
@ $6394 label=PrintCharacter
D $6394 Plots A. A space that would sit on top of another space is rubbed out
. first. ENTER pads the row out to the margin.
  $6394,$07 A space may need to rub out a previous space.
@ $639B label=PrintCharacter_Other
  $639B,$08 Only column 1 can be a doubled space.
@ $63A3 label=PrintCharacter_Rub
  $63A3,$07 The previous glyph is a space.
  $63AA,$05 Rub it out.
@ $63AF label=PrintCharacter_Keep
  $63AF,$04 Remember this glyph.
  $63B3,$04 Save the registers around the plot.
  $63B7,$08 ENTER pads the line out to column #N$2A.
@ $63BF label=PrintCharacter_Pad
  $63BF,$01 One more column.
  $63C0,$05 Stop at column #N$2A.
  $63C5,$07 Print a pad space and continue.
@ $63CC label=PrintCharacter_Plot
  $63CC,$03 Call #R$63FC to plot any other character.
@ $63CF label=PrintCharacter_Done
  $63CF,$04 Restore the registers from the stack.
  $63D3,$01 Return.

c $63D4 Print System Message
@ $63D4 label=PrintSystemMessage
D $63D4 Prints system message A from #R$7E26. The messages are the game's
. stock replies: what you can see, what you are carrying, and why a command
. failed.
  $63D4,$03 Jump to #R$63E6 with the message number in #REGb.

c $63D7 Print Object Name
@ $63D7 label=PrintObjectName
D $63D7 Prints object text A from #R$8CE6, the phrases used when a location
. lists what is here.
  $63D7,$04 Save the registers the printer will use.
  $63DB,$09 Print object text A from #R$8CE6.
  $63E4,$02 Join #R$63CF to restore the registers and return.

c $63E6 Print Numbered Message
@ $63E6 label=PrintNumberedMessage
D $63E6 Prints message B from #R$7E26, forcing a capital at the start.
  $63E6,$04 Save the registers the printer will use.
  $63EA,$05 A full stop makes the first letter a capital.
  $63EF,$04 #REGb is the system message number.
  $63F3,$06 Print that message from #R$7E26.
  $63F9,$03 Join #R$63CF to restore the registers and return to the caller.

c $63FC Plot Character
@ $63FC label=PlotCharacter
D $63FC Puts A on the screen. #N$0C rubs out the previous character. #N$0D
. moves to the next row, pausing and scrolling when the text hits the bottom
. of the window.
N $63FC DELETE is printed as a space and then another DELETE, so the cursor
. steps back.
  $63FC,$04 DELETE prints a space and then rubs it out.
  $6400,$08 Plot the space, then pass DELETE on.
  $6408,$02 DELETE is the character that falls through.
@ $640A label=PlotCharacter_Byte
  $640A,$04 Save the screen address and the character.
  $640E,$05 ENTER starts a new row.
  $6413,$04 Anything except DELETE is a glyph.
  $6417,$06 Column 0 wraps to the previous row.
  $641D,$05 Column #N$29 of the row above.
  $6422,$09 The previous row, then the pixel address moves back.
@ $642B label=PlotCharacter_Back
  $642B,$04 Step one column left.
  $642F,$07 A column whose low bits are 2 does not move the pixel address.
@ $6436 label=PlotCharacter_Pixel
  $6436,$0A Otherwise the pixel address moves back one byte.
@ $6440 label=PlotCharacter_Newline
N $6440 ENTER on row #N$13 while a description is on screen waits for a key.
. Below the window, the text scrolls.
  $6440,$07 Row #N$13 is the pause row while a description is on screen.
  $6447,$06 The pause only happens when #R$6186 is set.
  $644D,$05 The pause row's bottom is #N$0D.
  $6452,$06 Wait for a key and scroll.
  $6458,$04 Stay on row #N$13.
@ $645C label=PlotCharacter_Low
  $645C,$04 A row below #N$17 simply advances.
  $6460,$05 Row #N$17 scrolls and stays put.
@ $6465 label=PlotCharacter_Stay
  $6465,$0A Home the cursor on that row.
  $646F,$03 Return to the plotter.
@ $6472 label=PlotCharacter_Down
  $6472,$07 Advance one row.
  $6479,$07 Home the cursor on it.
  $6480,$03 Return to the plotter.

c $6483 Plot Glyph
@ $6483 label=PlotGlyph
D $6483 Draws character A at the print position, using the ROM font. The eight
. bytes are shifted into whichever pixel column the cursor occupies inside its
. display byte, then ORed into the screen.
N $6483 The ROM character set lives at #SKOOLKID$3D00(Character set).
. Subtracting #N$0100 makes the character code times 8 land on its glyph.
  $6483,$07 Keep the screen address. The font is the ROM character set minus
. #N$0100.
  $648A,$03 Character A, widened.
  $648D,$04 Times eight, plus the font base.
  $6491,$02 The screen address and the glyph address are restored after the
. copy.
  $6493,$06 The eight glyph bytes are copied into #R$6B23. C starts clear.
@ $6499 label=PlotGlyph_Copy
  $6499,$04 Copy one byte of the glyph.
  $649D,$06 Bit 1 of a byte marks a descender.
@ $64A3 label=PlotGlyph_Copied
  $64A3,$02 The next byte.
@ $64A5 label=PlotGlyph_Align
N $64A5 Tip the glyph so it sits in the right-hand pixels of its byte. A
. descender in the source sets the marker in #REGc.
  $64A5,$05 Eight glyph bytes are shifted in #R$6B23.
@ $64AA label=PlotGlyph_Row
  $64AA,$06 A source bit carried out sets the top bit.
@ $64B0 label=PlotGlyph_Nibble
  $64B0,$04 The descender marker shifts the glyph one place further.
  $64B4,$04 Split the byte into nibbles.
  $64B8,$06 The low nibble moves into the neighbouring byte.
@ $64BE label=PlotGlyph_Mask
  $64BE,$06 Store the aligned byte and do the next row.
  $64C4,$02 Restore the glyph address and the screen address from the stack.
  $64C6,$05 Point #REGde at the buffer and #REGhl at the screen byte.
@ $64CB label=PlotGlyph_Column
N $64CB The column within the byte chooses how the shifted glyph is merged
. with the pixels already there.
  $64CB,$05 The column within the byte is 0, 1, 2 or 3.
  $64D0,$03 Column 1 uses the two-pixel shift.
  $64D3,$03 Column 2 uses the four-pixel shift.
  $64D6,$03 Column 3 keeps the top two pixels.
  $64D9,$02 Column 0 copies eight fresh bytes.
@ $64DB label=PlotGlyph_Byte0
  $64DB,$04 Copy one glyph byte and step to the next pixel row.
  $64DF,$02 All eight bytes.
@ $64E1 label=PlotGlyph_Stored
  $64E1,$05 The print address moves on one byte.
  $64E6,$02 Join #R$6538 to advance the column.
@ $64E8 label=PlotGlyph_Byte1
  $64E8,$02 Eight pixel rows.
@ $64EA label=PlotGlyph_Shift2
  $64EA,$02 Take the glyph byte and the previous screen byte.
  $64EC,$04 Make room for two pixels.
  $64F0,$08 Shift two pixels of the glyph in.
  $64F8,$02 Store the shifted byte.
  $64FA,$02 The next pixel row.
  $64FC,$02 All eight.
  $64FE,$02 Join the shared advance at #R$64E1.
@ $6500 label=PlotGlyph_Byte2
  $6500,$02 Eight pixel rows.
@ $6502 label=PlotGlyph_Shift4
  $6502,$02 Take one glyph byte and the previous screen byte.
  $6504,$08 Make room for four pixels.
  $650C,$08 Shift the first two pixels in.
  $6514,$08 Shift the other two pixels in.
  $651C,$02 Store the shifted byte on this pixel row.
  $651E,$02 The next pixel row.
  $6520,$02 All eight.
  $6522,$03 This column restores the screen address itself and advances.
@ $6525 label=PlotGlyph_Byte3
  $6525,$02 Eight pixel rows.
@ $6527 label=PlotGlyph_Top
  $6527,$04 Keep the top two pixels already on screen.
  $652B,$05 Shift the glyph right by two.
  $6530,$02 OR it into the screen byte.
  $6532,$06 The next pixel row, then the shared advance.
@ $6538 label=PlotGlyph_Advance
N $6538 The next character moves one column right. Column #N$29 is the margin,
. so the cursor wraps.
  $6538,$05 Keep the character and read the column.
  $653D,$05 Column #N$29 wraps to the next row.
  $6542,$04 Otherwise the cursor moves one column right.
@ $6546 label=PlotGlyph_Done
  $6546,$04 Restore the registers saved around the glyph from the stack.
  $654A,$01 Return.

c $654B Home Cursor On A Row
@ $654B label=HomeRow
D $654B Moves the cursor to the left of the row in #R$5B89.
  $654B,$06 Call #R$5F16 to find the row.
  $6551,$08 Column 0, and store the print address.
  $6559,$01 Return.

w $655A Key Repeat Timer
@ $655A label=RepeatTimer
D $655A How long to wait before scrolling, measured against the ROM frame
. counter. The cursor keys store #N($0000,$04,$04), #N$0190 or #N($00C8,$04,$04) here.
  $655A,$02 Delay.
  $655C,$02 Rows already scrolled.

c $655E Scroll Text Window
@ $655E label=ScrollWindow
D $655E Moves every pixel row of the text window up by one character and
. clears the bottom row. During a description the picture is left where it is.
N $655E A short delay, taken from #R$655A, lets the player read before the
. next scroll.
  $655E,$04 The bottom row.
  $6562,$04 Blank lines left are #N$16 minus that row.
  $6566,$06 Fewer scrolls than blank lines means scroll now.
  $656C,$06 Otherwise copy the repeat delay into the frame counter,
. #SKOOLKID$5C78(FRAMES).
@ $6572 label=ScrollWindow_Wait
  $6572,$07 A key releases the pause.
  $6579,$09 Call the RET at the end of #SKOOLKID$0038(MASKABLE INTERRUPT) and
. scroll once the frame counter has moved.
@ $6582 label=ScrollWindow_Row
  $6582,$04 Count this scroll.
  $6586,$03 The bottom row is the first one to move.
@ $6589 label=ScrollWindow_Up
  $6589,$03 Address of that character row.
  $658C,$01 Keep this row.
  $658D,$04 Address of the row below it.
  $6591,$02 That address is the destination.
  $6593,$02 Eight pixel rows.
@ $6595 label=ScrollWindow_Pixels
  $6595,$03 Save the row pair.
  $6598,$05 Copy one pixel row, #N$20 bytes.
  $659D,$03 Restore the row pair from the stack.
  $65A0,$02 The next pixel row.
  $65A2,$02 All eight pixel rows.
  $65A4,$04 Row #N$13 is the pause row.
  $65A8,$04 Row #N$17 is the bottom of the window.
  $65AC,$02 Otherwise the blank line is the bottom row.
@ $65AE label=ScrollWindow_Pause
  $65AE,$07 A description in progress blanks the pause row instead.
  $65B5,$04 The blank line is at #N$5060 while the description is paused.
  $65B9,$02 Clear that line.
@ $65BB label=ScrollWindow_More
  $65BB,$03 Keep copying while the window has not been reached.
@ $65BE label=ScrollWindow_Bottom
  $65BE,$03 The ordinary blank line is at #N$50E0.
@ $65C1 label=ScrollWindow_Clear
  $65C1,$03 The cleared row is copied onto itself, one byte on.
  $65C4,$02 Eight pixel rows.
@ $65C6 label=ScrollWindow_Wipe
  $65C6,$03 Save the row.
  $65C9,$07 Write a zero and copy it across the row.
  $65D0,$03 Restore the row from the stack.
  $65D3,$02 The next pixel row.
  $65D5,$02 All eight.
  $65D7,$06 A paused description leaves the cursor on the pause row.
  $65DD,$03 That row is #N$5060.
  $65E0,$02 Home there.
@ $65E2 label=ScrollWindow_Home
  $65E2,$03 Otherwise the cursor sits on #N$50E0.
@ $65E5 label=ScrollWindow_Cursor
  $65E5,$03 Store the print address.
  $65E8,$04 Column 0.
  $65EC,$01 Return.

c $65ED Clear Rows Under Picture
@ $65ED label=ClearLowerRows
D $65ED Blanks the pixel rows down to the bottom of the text window. Pictures
. on start at row #N($0C), under the illustration. Pictures off start at row 0.
  $65ED,$06 Pictures off start clearing at row 0.
  $65F3,$02 Pictures on start at row #N$0C.
@ $65F5 label=ClearLower_Adjust
  $65F5,$01 Pictures off arrive here with zero, so this wraps to #N$FF.
@ $65F6 label=ClearLower_Row
  $65F6,$01 The increment restores row 0, or restores #N$0C when pictures are on.
  $65F7,$06 Stop when this row reaches the bottom row.
  $65FD,$05 Address of this character row.
  $6602,$03 Eight pixel rows, filled from the next byte.
@ $6605 label=ClearLower_Pixel
  $6605,$03 Save the row.
  $6608,$07 Blank the rest of the pixel row.
  $660F,$03 Restore the row from the stack.
  $6612,$02 The next pixel row.
  $6614,$02 All eight.
  $6616,$02 The next character row.

c $6618 Clear Screen
@ $6618 label=ClearScreen
D $6618 Blanks the display and paints the attributes white on black.
  $6618,$06 Point at the pixel display.
  $661E,$03 #N$1800 pixel bytes.
  $6621,$04 Fill them with zero.
  $6625,$07 Paint the attributes #COLOUR$38.
  $662C,$01 Return.

c $662D Wait For Key
@ $662D label=WaitForKey
D $662D Waits until the interrupt routine has seen a new key, ignores the
. characters the printer uses as terminators, and treats EDIT as the picture
. switch. The cursor keys change how long a scroll waits.
R $662D O:A The key, with letters as typed.
N $662D Bit 5 of #SKOOLKID$5C3B(FLAGS) is set by the maskable interrupt when
. a new key is ready. Calling the RET at the end of that routine lets one
. interrupt through.
  $662D,$0B Call the RET at the end of #SKOOLKID$0038(MASKABLE INTERRUPT),
. then wait for bit 5 of #SKOOLKID$5C3B(FLAGS).
  $663E,$08 Stir #REGr into the signature byte at #R$676E.
  $6646,$0A Read that stirred byte back.
  $6650,$06 Mix #REGr in again.
  $6656,$03 Save #REGbc.
  $6659,$04 Save #REGde, #REGhl and #REGix.
  $665D,$05 Sound the key click. A is #N$1E.
  $6662,$05 Restore the caller's registers from the stack.
@ $6667 label=WaitForKey_Cursor
  $6667,$03 #REGa is #SKOOLKID$5C08(LAST_K).
  $666A,$08 Cursor key #N$C7 stores no scroll delay.
  $6672,$07 Cursor key #N$C9 stores a long delay, #N$0190.
  $6679,$07 Cursor key #N$C8 stores a short delay, #N($00C8,$04,$04).
@ $6680 label=WaitForKey_Delay
  $6680,$03 Store the delay at #R$655A.
@ $6683 label=WaitForKey_Ignore
  $6683,$01 Restore the key from the stack.
  $6684,$08 #N$5E and #N$5F are ignored.
  $668C,$08 #N$7F and #N$7E are ignored.
@ $6694 label=WaitForKey_Pictures
N $6694 EDIT toggles the picture. The illustration attributes are cleared when
. pictures turn off, and the room is redrawn from bank 0.
  $6694,$03 EDIT is #N$0E. Any other key returns.
  $6697,$03 Save the registers around the redraw.
  $669A,$03 Call #R$65ED to clear the lower rows.
  $669D,$08 Pictures turning off clear the illustration colours.
  $66A5,$03 Toggle #R$66D6.
  $66A8,$04 #PAGE$00.
  $66AC,$03 Call #R$6B43 to redraw the room.
  $66AF,$05 Remember bank 3 and page it back in.
  $66B4,$03 Restore the registers from the stack.
  $66B7,$03 Jump to #R$662D to read the next key.

c $66BA Remember Paged Bank
@ $66BA label=RememberBank
D $66BA Stores A in #R$66D7 and pages that RAM bank in.
  $66BA,$03 Fall through.

c $66BD Page RAM Bank
@ $66BD label=PageBank
D $66BD Selects RAM bank #REGa at #N$C000 and forces the 48K ROM, which is the ROM
. this game's calls expect. #REGa is the bank in the low three bits. Callers pass
. 0, 3 or 6. Bank 7, which the loader paged with OUT 32765,23, is never
. requested again.
  $66BD,$04 Save what the caller passed in, since #REGbc is needed for the memory paging port #N$7FFD.
  $66C1,$04 Force the 48K ROM and write the bank in the low three bits.
  $66C5,$01 Restore #REGbc from the stack.
  $66C6,$01 Return.

c $66C7 Read Command
@ $66C7 label=ReadCommand
D $66C7 Pages the parser in bank 3 over #N($C000), calls it, then pages bank 0
. back so the picture data is visible again.
  $66C7,$05 #PAGE$03.
  $66CC,$03 Call the parser at the top of bank 3.
  $66CF,$06 #PAGE$00 and return with the parser's flags.

g $66D6 Pictures On
@ $66D6 label=PicturesOn
D $66D6 Non-zero when illustrations are drawn. EDIT toggles it. It starts on.

g $66D7 Bank Paged In
@ $66D7 label=PagedBank
D $66D7 The last value passed to #R$66BA. It starts at #N($10), so the resting
. window is bank 0 with the 48K ROM bit already set. #R$66BD sets that bit
. again before the port write.

c $66D8 Clear Illustration Colours
@ $66D8 label=ClearPictureAttributes
D $66D8 Paints the top twelve character rows black ink on white paper, which
. is the area the illustration occupies.
  $66D8,$05 Save #REGaf and point at the attribute file.
  $66DD,$03 #N$0180 bytes, the top twelve rows.
@ $66E0 label=ClearPicture_Byte
  $66E0,$04 Paint one attribute #COLOUR$38.
  $66E4,$04 Continue until the block is done.
  $66E8,$02 Restore #REGhl and #REGaf from the stack.
  $66EA,$01 Return.

c $66EB Condition: Room Is Parameter
@ $66EB label=RoomIs
D $66EB Passes when the current room is the parameter in #REGb.
  $66EB,$06 #FAIL
  $66F1,$01 Return.

c $66F2 Condition: Room Is Not Parameter
@ $66F2 label=RoomIsNot
D $66F2 Passes when the current room is not the parameter in #REGb.
  $66F2,$06 #FAIL
  $66F8,$01 Return.

c $66F9 Condition: Room Above Parameter
@ $66F9 label=RoomAbove
D $66F9 Passes when the current room is higher than the parameter in #REGb.
  $66F9,$03 Compare the room with the parameter.
  $66FC,$05 #FAIL
  $6701,$01 Return.

c $6702 Condition: Room Below Parameter
@ $6702 label=RoomBelow
D $6702 Passes when the current room is lower than the parameter in #REGb.
  $6702,$06 #FAIL
  $6708,$01 Return.

c $6709 Condition: Carrying, Wearing Or Here
@ $6709 label=HoldingOrHere
D $6709 Passes when the object is carried, worn, or in this room.
  $6709,$05 Pass when the object is the one being carried.
  $670E,$05 Pass when it is the one being worn.
  $6713,$04 The current room must be the object's location.
  $6717,$02 #FAIL
  $6719,$01 Return.

c $671A Condition: Not Carrying, Wearing Or Here
@ $671A label=NotHoldingOrHere
D $671A Passes when the object is neither carried, nor worn, nor in this room.
  $671A,$06 #FAIL when the object is carried.
  $6720,$06 #FAIL when it is worn.
  $6726,$06 #FAIL when it is in this room.
  $672C,$01 Return.

c $672D Condition: Object Is Somewhere
@ $672D label=Somewhere
D $672D Passes when the object's location is not #N$FC.
  $672D,$06 #FAIL

c $6733 Condition: Object Is Nowhere
@ $6733 label=Nowhere
D $6733 Passes when the object's location is #N$FC.
  $6733,$06 #FAIL

c $6739 Condition: Object Is Carried
@ $6739 label=IsCarried
D $6739 Passes when the object is the one being carried.
  $6739,$07 #FAIL

c $6740 Condition: Object Is Worn
@ $6740 label=IsWorn
D $6740 Passes when the object is the one being worn.
  $6740,$07 #FAIL

c $6747 Condition: Object Is Not Worn
@ $6747 label=IsNotWorn
D $6747 Passes when the object is not being worn.
  $6747,$07 #FAIL

c $674E Condition: Object Is Not Carried
@ $674E label=IsNotCarried
D $674E Passes when the object is not being carried.
  $674E,$05 #FAIL

c $6753 Condition: Reject
@ $6753 label=RejectCondition
D $6753 Marks the current script line as failed so its actions are not
. performed.
  $6753,$05 Write #N$01 to *#R$5ECA.
  $6758,$01 Return.

c $6759 Condition: Counter #N$01 Equals Parameter
@ $6759 label=Counter1Is
D $6759 Passes when counter 1 equals the parameter.
  $6759,$07 #FAIL

c $6760 Condition: Counter #N$02 Equals Parameter
@ $6760 label=Counter2Is
D $6760 Passes when counter 2 equals the parameter.
  $6760,$07 #FAIL

c $6767 Condition: Counter #N$03 Equals Parameter
@ $6767 label=Counter3Is
D $6767 Passes when counter 3 equals the parameter.
  $6767,$07 #FAIL

t $676E Adventure Signature
@ $676E label=Signature
D $676E The bytes spell ADVENTURE. The key routine and the random condition
. overwrite them and use the first byte as scratch.
  $676E,$09

c $6777 Condition: Random
@ $6777 label=RandomTest
D $6777 Passes when a value stirred from the frame counter and the signature
. comes out below the parameter.
  $6777,$06 Plant the signature over the address read next.
  $677D,$07 Read through that stirred address.
  $6784,$03 Widen the stirred byte.
  $6787,$03 Remember the first partial product.
  $678A,$04 Shift further and remember that product.
  $678E,$02 Double once more.
  $6790,$03 Add both saved products. The mix is the byte times #N$64.
  $6793,$09 Fold the low three bits of the frame counter into the signature.
  $679C,$04 #FAIL
  $67A0,$01 Return.

c $67A1 Condition: Flag Is Zero
@ $67A1 label=FlagZero
D $67A1 Passes when the flag byte selected by the parameter is zero.
  $67A1,$03 Call #R$67FF to point at the flag.
  $67A4,$03 Pass when the flag is zero.
  $67A7,$02 #FAIL

c $67A9 Condition: Flag Is Not Zero
@ $67A9 label=FlagNotZero
D $67A9 Passes when the flag byte selected by the parameter is not zero.
  $67A9,$03 Call #R$67FF to point at the flag.
  $67AC,$03 Pass when the flag is not zero.
  $67AF,$02 #FAIL

c $67B1 Condition: Flag Equals Parameter
@ $67B1 label=FlagEquals
D $67B1 Passes when the selected flag equals #REGa.
  $67B1,$07 #FAIL

c $67B8 Condition: Flag Differs From Parameter
@ $67B8 label=FlagDiffers
D $67B8 Passes when the selected flag differs from #REGa.
  $67B8,$07 #FAIL

c $67BF Condition: Flag Below Parameter
@ $67BF label=FlagBelow
D $67BF Passes when the selected flag is below #REGa.
  $67BF,$07 #FAIL

c $67C6 Condition: Flag Not Below Parameter
@ $67C6 label=FlagNotBelow
D $67C6 Passes when the selected flag is not below #REGa. The failing jump at
. #R$67CB is also the first word of the condition table, so condition 0 does
. not have a routine of its own.
N $67C6 The remaining condition routines are
. #FOR$67CD,$67FD,$02||a|#N(#PEEK(a)+$100*#PEEK(a+$01))|, | and ||.
  $67C6,$05 Call #R$67FF to address the flag.
  $67CB,$02 #FAIL

w $67CD Table: Condition Routines
@ $67CD label=ConditionTable
D $67CD One address per bytecode condition, after the dummy first word that
. overlaps #R$67CB. The runner shifts the condition number and reads the
. address from here.
N $67CD Condition #N($01+(#PC-$67CB)/$02).
  $67CD,$02 Routine #N(#PEEK(#PC)+$100*#PEEK(#PC+$01)).
L $67CD,$02,$19,$02

c $67FF Address Flag
@ $67FF label=FlagAddress
D $67FF Returns the address of flag byte #REGb. The flag bytes begin at the
. current room.
R $67FF O:HL Flag byte #REGb.
  $67FF,$03 The flag bytes begin at the current room.
@ $6802 label=FlagAddress_Add
  $6802,$04 Add the parameter in #REGb.
  $6806,$01 Return.

c $6807 Address Object
@ $6807 label=ObjectAddress
D $6807 Returns the address of object #REGb's location byte.
R $6807 O:HL Location of object #REGb.
  $6807,$05 Count #REGb bytes on from #R$5DCA, sharing the addition in #R$67FF.

c $680C Action: Inventory
@ $680C label=ListCarried
D $680C Prints message #N($10), you are carrying the following, then every
. carried or worn object. Nothing carried says so. A worn object is marked
. with message #N$1E.
  $680C,$05 Message #N$10: you are carrying the following.
  $6811,$04 Nothing has been listed yet.
  $6815,$05 #N$A0 object slots, from the first location byte.
@ $681A label=ListCarried_Scan
  $681A,$07 A carried object is printed.
  $6821,$07 A worn object is printed.
  $6828,$03 The next object.
  $682B,$06 An empty list says so.
  $6831,$05 Message #N$11: nothing at all.
@ $6836 label=ListCarried_End
  $6836,$0A Two backspaces remove the trailing comma.
  $6840,$05 A full stop ends the list.
@ $6845 label=ListCarried_One
  $6845,$03 The object id is #N$A0 minus the countdown.
  $6848,$03 Call #R$63D7 to print its name.
  $684B,$03 Remember that something was listed.
  $684E,$05 Message #N$1E marks the worn object.
  $6853,$06 Print " (worn),".
  $6859,$01 Restore the countdown from the stack.
  $685A,$01 Return.

c $685B Action: Play Again
@ $685B label=OfferAnotherGame
D $685B Prints message #N($12), the game is over, and asks Y or N. Y starts
. again at #R$5ECB. N resets the machine.
  $685B,$03 Call #R$6187 to describe the ending.
  $685E,$04 The picture may be drawn again.
  $6862,$03 Call #R$6B15 to draw it.
  $6865,$05 Message #N$12 asks whether to play again.
@ $686A label=OfferAnotherGame_Key
  $686A,$03 Wait for a key.
  $686D,$04 N (#N$4E) resets the Spectrum.
  $6871,$04 Any key but Y (#N$59) asks again.
  $6875,$03 Jump to #R$5ECB to start another game.

c $6878 Reset Machine
@ $6878 label=ResetMachine
D $6878 The answer N to 'play again' executes RST #N($00), which restarts the
. Spectrum.

c $6879 Action: Reject Line
@ $6879 label=RejectLine
D $6879 Sets the condition-failed flag so the runner stops this line. GET and
. DROP use it after explaining why they cannot.
  $6879,$05 Write #N$01 to *#R$5ECA.
  $687E,$01 Return.

c $687F Action: Press Any Key
@ $687F label=PressAnyKey
D $687F Prints message #N($14), press any key to continue, and waits until a
. key is down.
  $687F,$05 Fall into the wait.

c $6884 Wait For Key Down
@ $6884 label=WaitKeyDown
D $6884 Spins while the second key slot of #SKOOLKID$5C00(KSTATE) is
. #N($FF), which is the value it holds when nothing is pressed.
R $6884 O:A The key state.
@ $6887 label=WaitKeyDown_Spin
  $6884,$03 Save the registers around the wait.
  $6887,$07 Spin while the second key slot of #SKOOLKID$5C00(KSTATE) is #N$FF.
  $688E,$03 Restore the registers from the stack.
  $6891,$01 Return.

c $6892 Action: Move To Room
@ $6892 label=MoveToRoom
D $6892 Makes the parameter the current room and marks the room as changed.
  $6892,$07 Store the room, then jump to #R$696C to mark it changed.

c $6899 Action: Wait
@ $6899 label=WaitAWhile
D $6899 Pauses for B times #N$32 halted frames.
@ $689B label=WaitAWhile_Frame
  $6899,$02 #N$32 frames, once for each count in #REGb.
  $689B,$04 Halt for one frame.
  $689F,$02 Repeat for the count in #REGb.

c $68A2 Action: Move To Object
@ $68A2 label=MoveToObject
D $68A2 Makes the object's location the current room.
  $68A2,$07 Point at object #REGb's location byte.
  $68A9,$04 That location becomes the current room.
  $68AD,$03 Jump to #R$696C so the new room is described.

c $68B0 Action: Get
@ $68B0 label=GetObject
D $68B0 Picks the object up. It must be in the room, not already carried, and
. not worn. The carried id is written into the object's own location slot and
. the carried count increases.
  $68B0,$08 Already carried is message #N$15.
@ $68B8 label=GetObject_Refuse
  $68B8,$0A Print the refusal, drop any comma continuation, and reject the
. line.
@ $68C2 label=GetObject_Worn
  $68C2,$06 Already worn is message #N$1D.
  $68C8,$04 Print that refusal.
@ $68CC label=GetObject_Here
  $68CC,$06 In this room, take it.
  $68D2,$04 Message #N$16: it is not here.
@ $68D6 label=GetObject_Take
  $68D6,$03 Point at the object's location byte.
  $68D9,$08 Write the carried id there and count it.
  $68E1,$03 Jump to #R$696C so the room is described again.

c $68E4 Action: Drop
@ $68E4 label=DropObject
D $68E4 Puts a carried or worn object down in the current room. Message #N$17
. says you don't have it.
  $68E4,$06 An object that is worn is put down without changing the carried
. count.
  $68EA,$06 An object that is carried is counted down.
  $68F0,$04 Message #N$17: you don't have it.
@ $68F4 label=DropObject_Count
  $68F4,$04 One fewer object is carried.
@ $68F8 label=DropObject_Put
  $68F8,$07 Write the current room into the object's location.
  $68FF,$03 Jump to #R$696C so the room is described again.

c $6902 Action: Save
@ $6902 label=SaveGame
D $6902 Asks for a key, then writes #N$0141 bytes from the room state as a
. SAVE block named with marker #N$2A. The ROM returns to #R$6914.
  $6902,$03 Call #R$687F to wait for a key.
  $6905,$0C Jump into #SKOOLKID$04C2(SA-BYTES) at #N$04C5 so #REGhl is the
. return address #R$6914.

c $6914 Return From Saving
@ $6914 label=Saved
D $6914 Comes back from the ROM save. The border is turned white, the break
. flag is cleared, and the picture is allowed to be drawn again.
  $6914,$04 The border goes white.
  $6918,$05 Clear the break flag and allow interrupts.
  $691D,$04 Forget the drawn picture so it can be drawn again.
  $6921,$03 Jump to #R$696C so the room is described again.

c $6924 Action: Restore
@ $6924 label=RestoreGame
D $6924 Asks message #N($1A), do you want to restore a saved game. N returns. Y
. loads #N$0141 bytes back over the room state and jumps into the ROM loader.
  $6924,$06 Remember the pointer and select message #N$1A.
  $692A,$03 Print the question.
@ $692D label=RestoreGame_Key
  $692D,$03 Wait for a key.
  $6930,$04 N (#N$4E) leaves the saved game alone.
  $6934,$04 Anything except Y (#N$59) asks again.
@ $6938 label=RestoreGame_Load
  $6938,$03 N returns without loading.
  $693B,$07 Return through #R$6953 with the state block in #REGix.
  $6942,$06 #N$0141 bytes, marker #N($2A), with carry set for a headerless
. block.
  $6948,$04 The loader wants interrupts off, and the border dance around the
. alternate accumulator.
  $694C,$04 Border yellow.
  $6950,$03 Jump into #SKOOLKID$0556(LD-BYTES) at #N$0561.

c $6953 Return From Loading
@ $6953 label=Restored
D $6953 Comes back from the ROM loader. A failed load starts a new game; a
. successful one joins the save-return path.
  $6953,$08 Jump to #R$5ECB when the load failed, otherwise join #R$6914.

c $695D Action: Remove Object
@ $695D label=RemoveObject
D $695D Puts the object nowhere by storing #N($FC), then marks the room
. changed.
  $695D,$08 Fall into the room-changed handler.

c $6965 Action: Put Object Here
@ $6965 label=PutObjectHere
D $6965 Stores the current room as the object's location.
  $6965,$07 Fall into the room-changed handler.

c $696C Action: Room Changed
@ $696C label=RoomHasChanged
D $696C Sets the room-changed flag and walks the per-room records at #R$B798
. so an illustration that depended on an object is redrawn. Verbs #N($43),
. #N($8A), #N($8B), #N$85 and #N$8E skip that walk.
  $696C,$05 The room has changed.
  $6971,$04 Keep the line pointer. The last-matched verb may skip the picture
. walk.
  $6975,$04 Verb #N$43 skips it.
  $6979,$04 Verb #N$8A skips it.
  $697D,$04 Verb #N$8B skips it.
  $6981,$04 Verb #N$85 skips it.
  $6985,$04 Verb #N$8E skips it.
  $6989,$08 The records live at #R$B798, one per room.
  $6991,$02 A record ends at #N$FF.
@ $6993 label=RoomHasChanged_Sep
  $6993,$04 Skip to the next separator.
  $6997,$02 Count one separator per room until this room's record.
@ $6999 label=RoomHasChanged_Record
  $6999,$04 #N$FF ends this room's record.
  $699D,$05 Only an #N$F8 record names an object.
  $69A2,$07 Compare the record with #R$5F15, which nothing writes, so it
. matches a zero.
  $69A9,$07 Point at that object's location.
  $69B0,$06 The picture is left alone when the object is in this room.
@ $69B6 label=RoomHasChanged_Redraw
  $69B6,$05 Forget the drawn picture, restore the picture record pointer from the stack.
  $69BB,$01 Return.
@ $69BC label=RoomHasChanged_Keep
  $69BC,$01 Restore the picture record pointer from the stack.
  $69BD,$02 The next byte of the record.

c $69BF Action: Swap Objects
@ $69BF label=SwapObjects
D $69BF Exchanges the locations of the object in the parameter and the object
. addressed by #REGa, then marks the room changed.
  $69BF,$04 Point at the first object's location.
  $69C3,$04 Point at the second object.
  $69C7,$04 Exchange the two location bytes.
  $69CB,$02 Jump to #R$696C once the two locations have been exchanged.

c $69CD Action: Swap Flags
@ $69CD label=SwapFlags
D $69CD Exchanges flag #REGb with the flag addressed by #REGa.
  $69CD,$04 Point at flag #REGb.
  $69D1,$05 Point at the flag selected by #REGa.
  $69D6,$04 Exchange the two flag bytes.
  $69DA,$01 Return.

c $69DB Action: Set Flag On
@ $69DB label=SetFlagOn
D $69DB Writes #N$FF to flag #REGb.
  $69DB,$06 Return.

c $69E2 Action: Clear Flag
@ $69E2 label=ClearFlag
D $69E2 Writes zero to flag #REGb.
  $69E2,$06 Return.

c $69E8 Action: Force Verb And Noun
@ $69E8 label=ForceCommand
D $69E8 Replaces the command with verb #REGb and noun #REGa, and forgets that a script
. line has already matched so the new command can be tried.
  $69E8,$07 #REGa becomes the noun and #REGb becomes the verb.
  $69EF,$04 Forget that a script line has already matched, so the new command
. can be tried.
  $69F3,$01 Return.

c $69F4 Action: Add To Flag
@ $69F4 label=AddToFlag
D $69F4 Adds #REGa to flag #REGb, sticking at #N$FF instead of wrapping.
  $69F4,$04 Point at flag #REGb and add #REGa.
  $69F8,$04 The sum sticks at #N$FF.
@ $69FC label=AddFlag_Store
  $69FC,$01 Store it.
  $69FD,$01 Return.

c $69FE Action: Subtract From Flag
@ $69FE label=SubtractFromFlag
D $69FE Subtracts #REGa from flag #REGb, sticking at zero.
  $69FE,$06 Point at flag #REGb. #REGa is the amount to subtract.
  $6A04,$05 The flag minus the amount, via the scratch byte.
  $6A09,$05 The result sticks at zero.
@ $6A0E label=SubtractFlag_Store
  $6A0E,$02 Store the result.
  $6A10,$01 Return.

c $6A11 Action: Set Flag
@ $6A11 label=SetFlag
D $6A11 Writes #REGa into flag #REGb.
  $6A11,$05 Return.

c $6A16 Action: Set Object Location
@ $6A16 label=SetObjectLocation
D $6A16 Writes a new location for the object. A value of 1 for an object
. numbered #N$46 or higher is stored as zero. If the new location is the
. current room, the room is marked changed.
  $6A16,$04 Point at the object's location. C is the new one.
  $6A1A,$05 An index below #N$46 is stored as given.
  $6A1F,$07 Location 1 on an object numbered #N$46 or above is stored as 0.
@ $6A26 label=SetObject_Write
  $6A26,$01 Write the location.
@ $6A27 label=SetObject_Here
  $6A27,$07 The current room means the picture and the description change.
  $6A2E,$01 Return.

c $6A2F Action: Copy Object Location
@ $6A2F label=CopyObjectLocation
D $6A2F Gives the object in #REGb the same location as the object addressed by #REGa.
  $6A2F,$05 Point at object #REGb.
  $6A34,$05 Read object #REGa's location.
  $6A39,$01 Copy that location onto object #REGb.
  $6A3A,$02 Join #R$6A27 so a copy into this room is described.

c $6A3C Action: Print Flag
@ $6A3C label=PrintFlag
D $6A3C Prints flag #REGb as a decimal number followed by a space. The conversion
. goes through the DAA instruction, so the flag is treated as two decimal
. digits.
  $6A3C,$07 Read flag #REGb. Zero prints as a single 0.
  $6A43,$02 Count that value through DAA.
@ $6A45 label=PrintFlag_Tens
  $6A45,$04 Each pass through DAA builds one decimal step.
@ $6A49 label=PrintFlag_High
  $6A49,$04 The high digit is the tens.
  $6A4D,$08 Shift the tens digit down.
  $6A55,$05 Print the tens digit when it is not zero.
@ $6A5A label=PrintFlag_Units
  $6A5A,$08 Print the units digit.
  $6A62,$05 Print a following space.
  $6A67,$01 Return.

c $6A68 Action: Drop Everything
@ $6A68 label=DropEverything
D $6A68 Puts every object that is carried down in the current room and clears
. the carried count.
  $6A68,$05 Visit every object location. B counts #N$FE slots.
@ $6A6D label=DropEverything_One
  $6A6D,$06 A carried object is selected.
  $6A73,$04 It is given the current room.
@ $6A77 label=DropEverything_Next
  $6A77,$03 The next object.
  $6A7A,$04 Clear the carried count.
  $6A7E,$03 Jump to #R$696C now that the carried objects are in this room.

g $6A81 Restore Pointer Scratch
@ $6A81 label=RestoreScratch
D $6A81 Two bytes overwritten when a restore is offered. They are not read
. back.

c $6A83 Action: Wear
@ $6A83 label=WearObject
D $6A83 Wears the object. It must be carried and in this room, and it must not
. already be worn. The worn id replaces the object's location and the carried
. count drops.
  $6A83,$09 Point at the object. Already worn is refused.
  $6A8C,$05 Message #N$1D: you are wearing it.
@ $6A91 label=WearObject_Held
  $6A91,$06 A carried object is taken off the carried count.
  $6A97,$06 In this room, it can be worn.
  $6A9D,$05 Message #N$16: it is not here.
@ $6AA2 label=WearObject_Count
  $6AA2,$06 One fewer object is carried.
@ $6AA8 label=WearObject_Take
  $6AA8,$04 The worn id replaces the object's location.
  $6AAC,$01 Return.

c $6AAD Action: Take Object Off
@ $6AAD label=RemoveWorn
D $6AAD Stops wearing the object and carries it instead. Message #N$1C says
. you are not wearing it.
  $6AAD,$03 Point at the object's location.
  $6AB0,$06 Not worn continues to the refusal.
  $6AB6,$05 Message #N$1C: you are not wearing it.
@ $6ABB label=RemoveWorn_Do
  $6ABB,$08 The carried id replaces the worn location, and the carried count
. rises.
  $6AC3,$01 Return.

c $6AC4 Action: Beep
@ $6AC4 label=Beep
D $6AC4 Turns #REGa and #REGb into a duration and a pitch and hands them to the ROM
. beeper. The key click uses #REGa equal to #N$1E. Action 0 of the bytecode jumps
. straight to the same ROM routine, whose address is the operand of the jump
. below.
  $6AC4,$03 Duration #REGa is the low byte of #REGhl, and #REGb is the pitch.
  $6AC7,$03 The high byte of the duration, and #REGd, start at zero.
  $6ACA,$04 Shift the pitch two places, keeping the overflow in #REGd.
  $6ACE,$02 Save that pitch.
  $6AD0,$03 Call #SKOOLKID$30A9(HL=HL*DE) to scale the duration by the pitch.
  $6AD3,$01 Restore the pitch for the beeper from the stack.
  $6AD4,$03 Jump to #SKOOLKID$03B5(BEEPER).

w $6AD7 Table: Action Routines
@ $6AD7 label=ActionTable
D $6AD7 One address per bytecode action, after action 0, which is the BEEPER
. entry embedded in #R$6AC4. The runner shifts the action number and calls the
. address.
N $6AD7 The actions are
. #FOR$6AD5,$6B13,$02||a|#N(#PEEK(a)+$100*#PEEK(a+$01))|, | and ||.
  $6AD7,$02 Action #N($01+(#PC-$6AD5)/$02) at
. #N(#PEEK(#PC)+$100*#PEEK(#PC+$01)).
L $6AD7,$02,$1F,$02

c $6B15 Draw Room Once
@ $6B15 label=DrawRoomOnce
D $6B15 Draws the illustration when the room on screen is not the current one,
. and remembers the room.
  $6B15,$07 The picture is drawn only when #R$6185 is not this room.
  $6B1C,$05 Remember the room and draw it with interrupts off.
  $6B21,$01 Allow interrupts again.
  $6B22,$01 Return.

b $6B23 Glyph Buffer
@ $6B23 label=GlyphBuffer
D $6B23 Eight bytes of the character currently being shifted onto the screen.
. It starts full of #N$FF.
  $6B23,$08

c $6B2B Finish Word On Terminator
@ $6B2B label=FinishWord
D $6B2B A space that follows a message terminator is forced, so the terminator
. itself is not printed in the middle of a word.
  $6B2B,$07 A last character of #N$7E is a terminator.
  $6B32,$07 A last character of #N$5E is a terminator. Anything else is
. collected as a space.
@ $6B39 label=FinishWord_Space
  $6B39,$05 A terminator is replaced by a space as the last character.
  $6B3E,$03 Jump to #R$6319 to collect that space.

w $6B41 Error Stack
@ $6B41 label=ErrorStack
D $6B41 Stored in #SKOOLKID$5C3D(ERR_SP) when the game starts. A ROM error sets
. the stack to this word, whose value is the address of the glyph buffer.
  $6B41,$02

c $6B43 Action: Redraw
@ $6B43 label=RedrawLocation
D $6B43 Draws the picture, describes the room, and marks the room changed so
. the following turn keeps the description in step.
  $6B43,$09 Jump to #R$696C after the picture and the description.

c $6B4C Draw Picture When Enabled
@ $6B4C label=DrawIfPictures
D $6B4C Returns immediately while pictures are switched off. Otherwise paints
. the illustration.
  $6B4C,$07 Pictures off are the path that returns.
  $6B53,$01 Restore #REGaf from the stack.
  $6B54,$01 Return.
@ $6B55 label=DrawIfPictures_On
  $6B55,$01 Restore #REGaf from the stack.
  $6B56,$03 Jump to #R$6DFA to paint the illustration.

u $6B59 Unused Action Tail
@ $6B59 label=UnusedActionTail
D $6B59 A second copy of the action-table tail, the redraw routine and the
. glyph buffer. Nothing calls it; the live copies are the routines above.
  $6B59,$121

b $6C7A Illustration Attribute Buffer
@ $6C7A label=AttributeBuffer
D $6C7A The top twelve rows of attributes. The picture bytecode paints into
. this buffer and the result is copied to the screen.
  $6C7A,$180

c $6DFA Clear Illustration
@ $6DFA label=ClearIllustration
D $6DFA Blanks the illustration from pixel row #N$AF down to #N($50), lets the
. picture bytecode paint the saved attributes, then copies that buffer onto
. the screen.

c $6E39 Draw Room Picture
@ $6E39 label=DrawRoomPicture
D $6E39 Returns at once in the dark or in room 0. Otherwise finds this room's
. picture record and interprets it.

c $6E43 Find Room Picture Record
@ $6E43 label=FindPictureRecord
D $6E43 Walks #R$B798, whose records are separated by #N($FF), until it reaches
. the current room. Rooms from #N$60 up run on into bank 0 at #R$C000.

c $6E53 Interpret Picture Record
@ $6E53 label=PictureRecord
D $6E53 Reads the next record byte. #N$FF ends it. #N$FE reflects the left
. half of the picture onto the right, #N$FD changes one colour to another in
. the ink and paper, #N$FC paints a run of attributes, #N$FB brightens the
. picture, #N$FA mirrors it left to right, and #N$F9 draws another room's
. record. Any other byte goes to #R$6E7F.

c $6E7F Dispatch Picture Opcode
@ $6E7F label=DispatchShape
D $6E7F Opcodes #N$F8 to #N$EE jump to their own drawers. A smaller byte is a
. shape plotted by the routine below.

c $6EC1 Plot Shape
@ $6EC1 label=PlotShape
D $6EC1 Clears the suppress flag, reads the shape's coordinates and paints it
. into the attribute buffer.

g $6EEE Shape Suppressed
@ $6EEE label=ShapeSuppressed
D $6EEE Cleared before each shape is plotted. A later test uses it to skip a
. shape that should not be drawn.

c $6EEF Change Colour In Ink And Paper
@ $6EEF label=ChangeInkAndPaperColour
D $6EEF Changes colour #REGc to colour #REGl across the saved attribute buffer,
. first in the ink bits and then, with both colours moved up three bits, in
. the paper bits.

c $6F0A Change Matching Colour Bits
@ $6F0A label=ChangeMatchingColourBits
D $6F0A Walks the attribute buffer. Wherever the bits selected by #REGb equal
. #REGc, those bits are replaced with #REGl and the bits in #REGh are kept.

c $6F2C Change Picture Colour
@ $6F2C label=ChangePictureColour
D $6F2C Used for picture record #N$FD. Reads two colours from the record and
. changes one colour to another in the ink and paper: every ink of the first
. colour across the picture becomes the second, and so does every paper.

c $6F44 Brighten Illustration
@ $6F44 label=BrightenAttributes
D $6F44 Sets the bright bit on every byte of the attribute buffer.

c $6F57 Address Picture Byte
@ $6F57 label=PictureAddress
D $6F57 Turns a character row into a pointer inside the attribute buffer,
. using the same row table as the text printer.

c $6F6C Read Shape Byte
@ $6F6C label=ReadShapeByte
D $6F6C Fetches the next shape byte and remembers it for the shift that
. follows.

c $6FA5 Handle Special Shape Marker
@ $6FA5 label=SpecialShape
D $6FA5 Marker #N$FA reads a parameter block. Other markers adjust the
. coordinate that follows.

c $6FC9 Scale Shape Coordinate
@ $6FC9 label=ScaleShape
D $6FC9 Multiplies the coordinate by eight and adds the picture origin.

c $710E Paint Shape Bytes
@ $710E label=PaintShape
D $710E Copies the expanded shape into the attribute buffer, honouring the
. #N$FE and #N$FB markers that end or repeat a run.

c $718B Find Shape In Picture Font
@ $718B label=FindShape
D $718B Looks the shape number up in the picture font that follows this
. routine and remembers its address.

c $7213 Draw Shape When Object Is Here
@ $7213 label=ShapeIfPresent
D $7213 Opcode #N$F8 names an object. The following shape is drawn only when
. that object is in the current room, and the object id is planted in the low
. address byte (#N$5F11) of LD (#R$5B85),A at #R$5ECB(#N$5F10). When the object
. is absent that byte is cleared again.

c $728C Patch Shift Immediate
@ $728C label=PatchShift
D $728C Writes the next picture byte over the immediate of the shift that
. follows, so the shape can move by a fraction of a pixel.

c $72B5 Draw With Patched Shift
@ $72B5 label=DrawPatched
D $72B5 Opcode #N$F2 patches the shift, draws, and steps the picture pointer
. on by five bytes.

c $72C0 Draw With Fixed Shift
@ $72C0 label=DrawFixedShift
D $72C0 Used for picture record #N$FE. The shift immediate is forced to #N$0C.

c $733B Set Drawing Origin
@ $733B label=SetOrigin
D $733B Stores the next coordinates as the origin later shapes are drawn from.

c $7382 Draw From Origin
@ $7382 label=DrawFromOrigin
D $7382 Opcode #N$F1 sets the origin, draws, and steps on by five bytes.

c $738D Reset Drawing Origin
@ $738D label=ResetOrigin
D $738D Opcode #N$F3 zeroes the origin and restores the default margins.

c $73BE Picture Opcode F7
@ $73BE label=OpcodeF7
D $73BE Steps the picture pointer and draws with ink offset #N$0C.

c $73C8 Picture Opcode F5
@ $73C8 label=OpcodeF5
D $73C8 Steps the picture pointer and draws with ink offset #N$04.

c $73D2 Picture Opcode F6
@ $73D2 label=OpcodeF6
D $73D2 Steps the picture pointer and draws with ink offset #N$08.

c $73DC Select Shape For Object
@ $73DC label=ShapeForObject
D $73DC Uses an object location to choose which of the following shapes is
. drawn.

c $73F1 Address Pixel Row
@ $73F1 label=PixelRow
D $73F1 Turns a pixel row in #REGb into a display address via the character-row
. table.

c $7428 Draw Horizontal Run
@ $7428 label=HorizontalRun
D $7428 Opcode #N$F0 draws a horizontal run of pixels, patching its own length
. and shift bytes, then steps on by five.

c $746E Draw Shifted Run
@ $746E label=VerticalRun
D $746E Opcode #N$EF draws a run that is shifted across the pixel columns,
. using the same five-byte operand layout.

c $7512 Draw Vertical Opcode
@ $7512 label=DrawVertical
D $7512 Opcode #N$EE patches the vertical shift and steps the picture pointer
. on by five.

c $751D Draw Fixed Vertical Stroke
@ $751D label=FixedVertical
D $751D Used for picture record #N$FA. The shift is forced to #N$0C.

c $7532 Look Up Screen Row
@ $7532 label=RowWord
D $7532 The picture engine's copy of the row lookup. A is a character row and
. DE comes back with its pixel address.

c $753E Paint Attribute Run
@ $753E label=PaintAttributeRun
D $753E Writes a run of attribute bytes into the illustration buffer and
. returns to the record loop.

s $7569 Unused Gap Before Location Text
@ $7569 label=UnusedBeforeText
D $7569 Zero bytes between the picture interpreter and the tokenised location
. text. Nothing reads them.
  $7569,$65

t $75CE Tokenised Location Text
@ $75CE label=TokenisedLocations
D $75CE Short location text for every room, used for rooms #N$66 and above
. and for every room while pictures are on. Each byte is a dictionary word,
. and a message ends at #N$5E or #N$7E. The opening expands to the welcome
. for Blizzard Pass, dedicated to Hawkwind.
  $75CE,$27E
N $784C Room #N($1E), "A Sinister Foreboding Crypt". The game spells it
. "sinsister", see #FACT(sinsister,Facts).
  $784C,$10
  $785C,$5CA

t $7E26 System Messages
@ $7E26 label=SystemMessages
D $7E26 The stock replies, 172 of them, each ending at #N$5E (stay on the
. line) or #N$7E (start a new line). Directions #N$01 to #N$0A are the compass
. points. Message #N$0B is the unrecognised-word reply, #N$10 is the inventory
. heading, #N$12 asks whether to play again, and #N$19 is the darkness line.
  $7E26,$EBC

t $8CE6 Object Text
@ $8CE6 label=ObjectText
D $8CE6 Phrases printed for objects and scenery, in the same terminated-token
. form as the system messages. The location lister and the inventory use them.
  $8CE6,$986

s $966C Unused Gap Before Scripts
@ $966C label=UnusedBeforeScripts
D $966C Zero bytes between the object text and the high-priority scripts.
  $966C,$6D

b $96D9 High-Priority Scripts
@ $96D9 label=PriorityScripts
D $96D9 Bytecode run at the start of every turn, before the player's command
. is considered. Lines are matched by #R$6155 and performed by #R$6074.
  $96D9,$2BD

s $9996 Unused Gap In Scripts
@ $9996 label=UnusedScriptGap
D $9996 Zero bytes between the two script tables, with a single #N$FF at
. #R$9A1B.
  $9996,$85

b $9A1B Script Break
@ $9A1B label=ScriptBreak
D $9A1B A single #N$FF between the two unused gaps.
  $9A1B,$01

s $9A1C Unused Gap Before Command Scripts
@ $9A1C label=UnusedBeforeCommands
D $9A1C Zero bytes immediately before the ordinary command scripts.
  $9A1C,$38

b $9A54 Command Scripts
@ $9A54 label=CommandScripts
D $9A54 Bytecode for the player's verbs: movement that the exit table did not
. handle, GET, DROP, WEAR and the rest. #R$6074 runs it after a command has
. been parsed.
  $9A54,$CCB

b $A71F Vocabulary Lead-In
@ $A71F label=VocabularyLead
D $A71F The matcher at the top of bank 3 starts one byte after this, on
. #R$A720.
  $A71F,$01

b $A720 Vocabulary
@ $A720 label=Vocabulary
D $A720 Four-letter words and their token ids. A short word is padded with
. spaces. Id 0 is ignored, ids below #N$55 are verbs, #N$80 is IT or THEM, and
. #N$FF ends the table. Directions, GET, DROP, WEAR and QUIT are the first
. entries.
N $A720 There are #N$DA words, then the terminator at #R$AB62.
  $A720,$04 "#CHR(#PEEK(#PC))#CHR(#PEEK(#PC+$01))#CHR(#PEEK(#PC+$02))#CHR(#PEEK(#PC+$03))"
  $A724,$01 Token #N(#PEEK(#PC)).
L $A720,$05,$DA,$02

b $AB62 End Of Vocabulary
@ $AB62 label=VocabularyEnd
D $AB62 The dummy word XXXX with id #N($FF), which stops the matcher.
  $AB62,$05

b $AB67 Exit Table
@ $AB67 label=ExitTable
D $AB67 For each room, a key of room plus #N($80), then direction verbs and the
. rooms they lead to. Bit 7 on a verb ends that room. #R$5FCE scans it.
  $AB67,$447

s $AFAE Unused Gap Before Dictionary
@ $AFAE label=UnusedBeforeDictionary
D $AFAE Zero bytes between the exit table and the dictionary.
  $AFAE,$20E

t $B1BC Dictionary
@ $B1BC label=Dictionary
D $B1BC 256 words used by the message printer. A word ends with bit 7 set on
. its last letter. The first word is empty: its only byte is #N$80. Later
. words include the letters of the alphabet, so a token in that range is
. printed as itself.
  $B1BC,$2D2

s $B48E Unused Gap Before World Tables
@ $B48E label=UnusedBeforeWorld
D $B48E Zero bytes between the dictionary and the duplicate object list.
  $B48E,$1DE

u $B66C Unused Object List Copy
@ $B66C label=UnusedObjectCopy
D $B66C The first #N$3C bytes of the initial object locations, repeated.
. Nothing points here; the game copies #R$B6A8.
  $B66C,$3C

b $B6A8 Initial Object Locations
@ $B6A8 label=InitialObjects
D $B6A8 Where each object starts, one byte per object: a room number, or #N$FC
. when the object is nowhere. #R$600F(#N$603B) copies these bytes to
. #R$5DCA at the start of a game. Room descriptions (#R$6187(#N$61EC)) look at
. objects #N$00 to #N($96), stopping at #R$5D8D, and the inventory
. (#R$680C) looks at all #N$A0 of them. Every object from #N$96 on starts
. nowhere.
N $B6A8 Object #N(#PC-$B6A8).
  $B6A8,$01 #NOWHERE(#PC).
L $B6A8,$01,$A0

b $B748 Initial Object Locations Padding
@ $B748 label=InitialObjects_Padding
D $B748 Seven more #N$FC bytes after the last of the #N$A0 objects at #R$B6A8.
. The copy at #R$600F(#N$603B) takes them to #R$5DCA too, but no object uses
. them. #R$6A68, which visits #N$FE slots, finds nothing carried here, and the
. script runner at #R$6074 only loads one when a counter test or a message
. number is #N$A0 or more, and those routines ignore the location. In
. practice the padding is unused.
  $B748,$07

t $B74F Assembler Source Leftovers
@ $B74F label=AssemblerSource_Leftovers
D $B74F Part of the game's assembler source that happened to be in memory when
. the data was saved. Each line is a two-byte line number, a length byte, the
. text and #N$0D. The copy at #R$600F(#N$603B) takes #N$0100 bytes from
. #R$B6A8, so it runs on through these bytes and into the first #N$10 bytes
. of #R$B798. None of these bytes is #N($FD), so #R$6A68, which visits #N$FE
. slots, never treats them as carried. It does treat slot #N$F4 as carried,
. because the #N$FD at #R$B79C lands there, so #R$6A68 also writes the
. current room to #R$5DCA(#N$5EBE), a slot no object uses, when dropping
. everything.
  $B74F,$0B The end of the line before, "...RD A,(DE)".
  $B75A,$0B Line 1090: CP (HL).
  $B765,$0F Line 1100: JR Z,found.
  $B774,$0A Line 1110: INC DE.
  $B77E,$0A Line 1120: LD A,E.
  $B788,$0A Line 1130: CP mem.
  $B792,$06 Line 1140, cut off after "JR ".

b $B798 Per-Room Picture Records
@ $B798 label=RoomRecords
D $B798 One record per room, each ended by #N$FF. This first #N$FF is the
. record for room 0, the opening message, which has no picture. #R$6E43 counts
. the terminators to find a room, so the records run on past #R$BFF1 into RAM
. bank 0, where rooms #N$60 to #N$6B live at #R$C000 onwards. #R$696C walks the
. same table. Inside a record (see #R$6E53 and #R$6E7F), a byte below #N$EE is
. a shape number followed by its column and row. #N$F9 draws another room's
. record, #N$F8 names an object whose shape is drawn only while it is here,
. #N$FD changes one colour to another in the ink and paper, #N$FC paints a run
. of attributes, #N$FB brightens the picture, #N$FA mirrors it left to right,
. and #N$FE reflects its left half onto the right.
  $B798,$01

b $B799 Picture: A Snowy Pass Below A Window
@ $B799 label=Picture_SnowyPassBelowWindow
D $B799 Room #N$01 reuses the whole picture of room #N$50 (a rocky pass) at
. #R$BECB. #RECORDLINKS
D $B799 #PICTURE($01)(a-snowy-pass-below-a-window,A Snowy Pass Below A Window)
  $B799,$03

b $B79C Picture: Lost In A Freezing Blizzard
@ $B79C label=Picture_FreezingBlizzard
D $B79C Room #N($02), drawn entirely from its own shapes. #RECORDLINKS
D $B79C #PICTURE($02)(lost-in-a-freezing-blizzard,Lost In A Freezing Blizzard)
  $B79C,$0C

b $B7A8 Picture: Hanging Onto A Cliff Beside A Window
@ $B7A8 label=Picture_CliffBesideWindow
D $B7A8 Room #N($03), drawn entirely from its own shapes. #RECORDLINKS
D $B7A8 #PICTURE($03)(hanging-onto-a-cliff-beside-a-window,Hanging Onto A Cliff Beside A Window)
  $B7A8,$2C

b $B7D4 Picture: A Small Rock Gallery
@ $B7D4 label=Picture_SmallRockGallery
D $B7D4 Room #N$04 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $B7D4 #PICTURE($04)(a-small-rock-gallery,A Small Rock Gallery)
  $B7D4,$14

b $B7E8 Picture: A Very Dim Shadowy Room
@ $B7E8 label=Picture_DimShadowyRoom
D $B7E8 Room #N($05), drawn entirely from its own shapes. #RECORDLINKS
D $B7E8 #PICTURE($05)(a-very-dim-shadowy-room,A Very Dim Shadowy Room)
  $B7E8,$1A

b $B802 Empty Picture Record
@ $B802 label=Picture_EmptyAfterShadowyRoom
D $B802 Room #N$06 ("empty") has no picture; its record is just the #N$FF
. terminator. #RECORDLINKS
  $B802,$01

b $B803 Picture: A Wide Dark Passage
@ $B803 label=Picture_WideDarkPassage
D $B803 Room #N($07), drawn entirely from its own shapes. #RECORDLINKS
D $B803 #PICTURE($07)(a-wide-dark-passage,A Wide Dark Passage)
  $B803,$31

b $B834 Picture: A Long Dark Passage
@ $B834 label=Picture_LongDarkPassage
D $B834 Room #N($08), drawn entirely from its own shapes. Object #N$02 ("And it
. has been moved to reveal a hole leading down") adds a shape only while it is
. in this room. #RECORDLINKS
D $B834 #PICTURE($08)(a-long-dark-passage,A Long Dark Passage)
  $B834,$21

b $B855 Empty Picture Record
@ $B855 label=Picture_EmptyAfterLongDarkPassage
D $B855 Room #N$09 ("empty") has no picture; its record is just the #N$FF
. terminator. #RECORDLINKS
  $B855,$01

b $B856 Picture: A Passage Hidden Beneath A Large Statue
@ $B856 label=Picture_PassageBeneathStatue
D $B856 Room #N($0A), drawn entirely from its own shapes. #RECORDLINKS
D $B856 #PICTURE($0A)(a-passage-hidden-beneath-a-large-statue,A Passage Hidden Beneath A Large Statue)
  $B856,$31

b $B887 Picture: A Desecrated Temple
@ $B887 label=Picture_DesecratedTemple
D $B887 Room #N($0B), drawn entirely from its own shapes. #RECORDLINKS
D $B887 #PICTURE($0B)(a-desecrated-temple,A Desecrated Temple)
  $B887,$0C

b $B893 Picture: A Small Room (Above The Landing)
@ $B893 label=Picture_SmallRoomAboveLanding
D $B893 Room #N$0C starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $B893 #PICTURE($0C)(a-small-room-above-the-landing,A Small Room (Above The Landing))
  $B893,$11

b $B8A4 Picture: A Corridor With A Room To The North
@ $B8A4 label=Picture_CorridorWithRoomNorth
D $B8A4 Room #N($0D), drawn entirely from its own shapes. #RECORDLINKS
D $B8A4 #PICTURE($0D)(a-corridor-with-a-room-to-the-north,A Corridor With A Room To The North)
  $B8A4,$36

b $B8DA Picture: A Small Room (North Of The Corridor)
@ $B8DA label=Picture_SmallRoomNorthOfCorridor
D $B8DA Room #N$0E starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $B8DA #PICTURE($0E)(a-small-room-north-of-the-corridor,A Small Room (North Of The Corridor))
  $B8DA,$19

b $B8F3 Picture: A Huge Pillared Mystical Hall
@ $B8F3 label=Picture_PillaredMysticalHall
D $B8F3 Room #N($0F), drawn entirely from its own shapes. #RECORDLINKS
D $B8F3 #PICTURE($0F)(a-huge-pillared-mystical-hall,A Huge Pillared Mystical Hall)
  $B8F3,$14

b $B907 Picture: A Landing Above A Hall Of Zombie Guards
@ $B907 label=Picture_LandingAboveZombieGuards
D $B907 Room #N$10 starts from the picture of room #N$0C (a small room, above
. the landing) at #R$B893, then adds its own shapes. #RECORDLINKS
D $B907 #PICTURE($10)(a-landing-above-a-hall-of-zombie-guards,A Landing Above A Hall Of Zombie Guards)
  $B907,$06

b $B90D Picture: A Shattered Ruined Hall
@ $B90D label=Picture_ShatteredRuinedHall
D $B90D Room #N($11), drawn entirely from its own shapes. Object #N$05 ("But it
. has been bridged with a stone pillar") adds a shape only while it is in this
. room. Object #N$4C ("Sixty foot pillar") adds a shape only while it is in
. this room. #RECORDLINKS
D $B90D #PICTURE($11)(a-shattered-ruined-hall,A Shattered Ruined Hall)
  $B90D,$3D

b $B94A Picture: A Low Narrow Corridor
@ $B94A label=Picture_LowNarrowCorridor
D $B94A Room #N$12 starts from the picture of room #N$08 (a long dark passage)
. at #R$B834, then adds its own shapes. Object #N$02 ("And it has been moved to
. reveal a hole leading down") adds a shape only while it is in this room.
. #RECORDLINKS
D $B94A #PICTURE($12)(a-low-narrow-corridor,A Low Narrow Corridor)
  $B94A,$12

b $B95C Picture: A Large Rest Chamber
@ $B95C label=Picture_LargeRestChamber
D $B95C Room #N$13 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $B95C #PICTURE($13)(a-large-rest-chamber,A Large Rest Chamber)
  $B95C,$12

b $B96E Picture: A Smelly Earthen Cave
@ $B96E label=Picture_SmellyEarthenCave
D $B96E Room #N($14), drawn entirely from its own shapes. #RECORDLINKS
D $B96E #PICTURE($14)(a-smelly-earthen-cave,A Smelly Earthen Cave)
  $B96E,$2E

b $B99C Picture: A Shadowy Corridor
@ $B99C label=Picture_ShadowyCorridor
D $B99C Room #N$15 starts from the picture of room #N$12 (a low narrow
. corridor) at #R$B94A, then adds its own shapes. Object #N$02 ("And it has
. been moved to reveal a hole leading down") adds a shape only while it is in
. this room. Object #N$0B ("An open door leads south into a room") adds a shape
. only while it is in this room. #RECORDLINKS
D $B99C #PICTURE($15)(a-shadowy-corridor,A Shadowy Corridor)
  $B99C,$27

b $B9C3 Picture: A Cave
@ $B9C3 label=Picture_Cave
D $B9C3 Room #N($16), drawn entirely from its own shapes. Object #N$4F
. ("Vampire") adds a shape only while it is in this room. #RECORDLINKS
D $B9C3 #PICTURE($16)(a-cave,A Cave)
  $B9C3,$0D

b $B9D0 Picture: A Work Room
@ $B9D0 label=Picture_WorkRoom
D $B9D0 Room #N$17 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$1D ("Open") adds a
. shape only while it is in this room. #RECORDLINKS
D $B9D0 #PICTURE($17)(a-work-room,A Work Room)
  $B9D0,$16

b $B9E6 Picture: A Low Dark Passage Covered In Mould
@ $B9E6 label=Picture_MouldyLowPassage
D $B9E6 Room #N($18), drawn entirely from its own shapes. #RECORDLINKS
D $B9E6 #PICTURE($18)(a-low-dark-passage-covered-in-mould,A Low Dark Passage Covered In Mould)
  $B9E6,$0E

b $B9F4 Picture: A Sinister Torture Chamber
@ $B9F4 label=Picture_TortureChamber
D $B9F4 Room #N$19 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $B9F4 #PICTURE($19)(a-sinister-torture-chamber,A Sinister Torture Chamber)
  $B9F4,$0E

b $BA02 Picture: A Dank And Dripping Dungeon
@ $BA02 label=Picture_DankDrippingDungeon
D $BA02 Room #N($1A), drawn entirely from its own shapes. Object #N$0C ("You
. can go east through a broken down door") adds a shape only while it is in
. this room. #RECORDLINKS
D $BA02 #PICTURE($1A)(a-dank-and-dripping-dungeon,A Dank And Dripping Dungeon)
  $BA02,$30

b $BA32 Picture: The Hanging Room
@ $BA32 label=Picture_HangingRoom
D $BA32 Room #N$1B starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$0E ("A wizard is hung
. from a rope here") adds a shape only while it is in this room. #RECORDLINKS
D $BA32 #PICTURE($1B)(the-hanging-room,The Hanging Room)
  $BA32,$0B

b $BA3D Picture: A Stinking Damp Cell
@ $BA3D label=Picture_StinkingDampCell
D $BA3D Room #N($1C), drawn entirely from its own shapes. Object #N$0F ("A
. metal ring for tying prisoners to is set into the wall") adds a shape only
. while it is in this room. Object #N$10 ("A secret passage exits through one
. wall") adds a shape only while it is in this room. #RECORDLINKS
D $BA3D #PICTURE($1C)(a-stinking-damp-cell,A Stinking Damp Cell)
  $BA3D,$41

b $BA7E Picture: The Robing Room
@ $BA7E label=Picture_RobingRoom
D $BA7E Room #N$1D starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $BA7E #PICTURE($1D)(the-robing-room,The Robing Room)
  $BA7E,$0F

b $BA8D Picture: A Sinister Foreboding Crypt
@ $BA8D label=Picture_ForebodingCrypt
D $BA8D Room #N($1E), drawn entirely from its own shapes. Object #N$56
. ("Ghoul") adds a shape only while it is in this room. #RECORDLINKS
D $BA8D #PICTURE($1E)(a-sinister-foreboding-crypt,A #FACT(sinsister,Sinister) Foreboding Crypt)
  $BA8D,$24

b $BAB1 Picture: A Small Entry Chamber
@ $BAB1 label=Picture_SmallEntryChamber
D $BAB1 Room #N($1F), drawn entirely from its own shapes. #RECORDLINKS
D $BAB1 #PICTURE($1F)(a-small-entry-chamber,A Small Entry Chamber)
  $BAB1,$08

b $BAB9 Picture: The Library
@ $BAB9 label=Picture_Library
D $BAB9 Room #N$20 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $BAB9 #PICTURE($20)(the-library,The Library)
  $BAB9,$22

b $BADB Picture: A Large Water Cave With A Well
@ $BADB label=Picture_WaterCave
D $BADB Room #N$21 starts from the picture of room #N$16 (a cave) at #R$B9C3,
. then adds its own shapes. Object #N$4F ("Vampire") adds a shape only while it
. is in this room. #RECORDLINKS
D $BADB #PICTURE($21)(a-large-water-cave-with-a-well,A Large Water Cave With A Well)
  $BADB,$06

b $BAE1 Picture: Down A Small Dried Up Well
@ $BAE1 label=Picture_DriedUpWell
D $BAE1 Room #N($22), drawn entirely from its own shapes. Object #N$10 ("A
. secret passage exits through one wall") adds a shape only while it is in this
. room. #RECORDLINKS
D $BAE1 #PICTURE($22)(down-a-small-dried-up-well,Down A Small Dried Up Well)
  $BAE1,$1F

b $BB00 Picture: A Massive Hall Decorated With Shields
@ $BB00 label=Picture_HallOfShields
D $BB00 Room #N($23), drawn entirely from its own shapes. #RECORDLINKS
D $BB00 #PICTURE($23)(a-massive-hall-decorated-with-shields,A Massive Hall Decorated With Shields)
  $BB00,$2E

b $BB2E Picture: A Huge Cavern Above A Stream Of Lava
@ $BB2E label=Picture_CavernAboveLava
D $BB2E Room #N$24 starts from the picture of room #N$27 (the path right beside
. the lava) at #R$BB7C, then adds its own shapes. #RECORDLINKS
D $BB2E #PICTURE($24)(a-huge-cavern-above-a-stream-of-lava,A Huge Cavern Above A Stream Of Lava)
  $BB2E,$19

b $BB47 Picture: A Musty Secret Chamber
@ $BB47 label=Picture_MustySecretChamber
D $BB47 Room #N($25), drawn entirely from its own shapes. Object #N$17
. ("Suspended in the centre of the room, protected by a forcefield is a magical
. rod") adds a shape only while it is in this room. #RECORDLINKS
D $BB47 #PICTURE($25)(a-musty-secret-chamber,A Musty Secret Chamber)
  $BB47,$2A

b $BB71 Picture: An Inscribed Rune Covered Chamber
@ $BB71 label=Picture_RuneCoveredChamber
D $BB71 Room #N($26), drawn entirely from its own shapes. #RECORDLINKS
D $BB71 #PICTURE($26)(an-inscribed-rune-covered-chamber,An Inscribed Rune Covered Chamber)
  $BB71,$0B

b $BB7C Picture: The Path Right Beside The Lava
@ $BB7C label=Picture_PathBesideLava
D $BB7C Room #N($27), drawn entirely from its own shapes. #RECORDLINKS
D $BB7C #PICTURE($27)(the-path-right-beside-the-lava,The Path Right Beside The Lava)
  $BB7C,$33

b $BBAF Picture: The End Of The Path
@ $BBAF label=Picture_EndOfPath
D $BBAF Room #N$28 starts from the picture of room #N$22 (down a small dried up
. well) at #R$BAE1, then adds its own shapes. Object #N$10 ("A secret passage
. exits through one wall") adds a shape only while it is in this room. Object
. #N$12 ("A sword is set deep into the stone") adds a shape only while it is in
. this room. #RECORDLINKS
D $BBAF #PICTURE($28)(the-end-of-the-path,The End Of The Path)
  $BBAF,$21

b $BBD0 Picture: A Ledge In A Huge Fissure
@ $BBD0 label=Picture_LedgeInFissure
D $BBD0 Room #N($29), drawn entirely from its own shapes. Object #N$23 ("Rope
. spans the fissure") adds a shape only while it is in this room. #RECORDLINKS
D $BBD0 #PICTURE($29)(a-ledge-in-a-huge-fissure,A Ledge In A Huge Fissure)
  $BBD0,$0D

b $BBDD Picture: The Bottom Of A Deep Fissure
@ $BBDD label=Picture_BottomOfFissure
D $BBDD Room #N($2A), drawn entirely from its own shapes. #RECORDLINKS
D $BBDD #PICTURE($2A)(the-bottom-of-a-deep-fissure,The Bottom Of A Deep Fissure)
  $BBDD,$0C

b $BBE9 Picture: A Narrow Crack
@ $BBE9 label=Picture_NarrowCrack
D $BBE9 Room #N$2B starts from the picture of room #N$22 (down a small dried up
. well) at #R$BAE1, then adds its own shapes. Object #N$10 ("A secret passage
. exits through one wall") adds a shape only while it is in this room. Object
. #N$13 ("A boulder blocks the way east") adds a shape only while it is in this
. room. Object #N$14 ("A narrow hole leads into a passage") adds a shape only
. while it is in this room. #RECORDLINKS
D $BBE9 #PICTURE($2B)(a-narrow-crack,A Narrow Crack)
  $BBE9,$10

b $BBF9 Picture: A Gallery Above A Guardroom
@ $BBF9 label=Picture_GalleryAboveGuardroom
D $BBF9 Room #N($2C), drawn entirely from its own shapes. #RECORDLINKS
D $BBF9 #PICTURE($2C)(a-gallery-above-a-guardroom,A Gallery Above A Guardroom)
  $BBF9,$28

b $BC21 Picture: A Guardroom Beside The Zombie Warriors
@ $BC21 label=Picture_GuardroomBesideZombieWarriors
D $BC21 Room #N($2D), drawn entirely from its own shapes. #RECORDLINKS
D $BC21 #PICTURE($2D)(a-guardroom-beside-the-zombie-warriors,A Guardroom Beside The Zombie Warriors)
  $BC21,$30

b $BC51 Picture: A Guardroom With Stairs Up
@ $BC51 label=Picture_GuardroomWithStairs
D $BC51 Room #N$2E is the picture of room #N$10 (a landing above a hall of
. zombie guards) at #R$B907, with its colours changed. #RECORDLINKS
D $BC51 #PICTURE($2E)(a-guardroom-with-stairs-up,A Guardroom With Stairs Up)
  $BC51,$09

b $BC5A Picture: A Wide Passageway
@ $BC5A label=Picture_WidePassageway
D $BC5A Room #N$2F starts from the picture of room #N$18 (a low dark passage
. covered in mould) at #R$B9E6, then adds its own shapes. #RECORDLINKS
D $BC5A #PICTURE($2F)(a-wide-passageway,A Wide Passageway)
  $BC5A,$06

b $BC60 Picture: A Fissure On A Narrow Ledge
@ $BC60 label=Picture_NarrowLedgeInFissure
D $BC60 Room #N($30), drawn entirely from its own shapes. Object #N$20 ("Rope
. spans the fissure") adds a shape only while it is in this room. #RECORDLINKS
D $BC60 #PICTURE($30)(a-fissure-on-a-narrow-ledge,A Fissure On A Narrow Ledge)
  $BC60,$0C

b $BC6C Picture: A Huge Cavern At The West End
@ $BC6C label=Picture_HugeCavernWestEnd
D $BC6C Room #N($31), drawn entirely from its own shapes. #RECORDLINKS
D $BC6C #PICTURE($31)(a-huge-cavern-at-the-west-end,A Huge Cavern At The West End)
  $BC6C,$11

b $BC7D Picture: A Large Cave With A Huge Deep Channel
@ $BC7D label=Picture_LargeCaveWithChannel
D $BC7D Room #N($32), drawn entirely from its own shapes. Object #N$29 ("Which
. has a drawbridge in the up position in front of it") adds a shape only while
. it is in this room. Object #N$27 ("Crossed by a metal drawbridge") adds a
. shape only while it is in this room. Object #N$26 ("Bridged by a plank") adds
. a shape only while it is in this room. #RECORDLINKS
D $BC7D #PICTURE($32)(a-large-cave-with-a-huge-deep-channel,A Large Cave With A Huge Deep Channel)
  $BC7D,$38

b $BCB5 Picture: A Large Cave At The East End
@ $BCB5 label=Picture_LargeCaveEastEnd
D $BCB5 Room #N$33 is the picture of room #N$31 (a huge cavern at the west end)
. at #R$BC6C, mirrored left to right. #RECORDLINKS
D $BCB5 #PICTURE($33)(a-large-cave-at-the-east-end,A Large Cave At The East End)
  $BCB5,$04

b $BCB9 Picture: The Hall Of Fire
@ $BCB9 label=Picture_HallOfFire
D $BCB9 Room #N($34), drawn entirely from its own shapes. #RECORDLINKS
D $BCB9 #PICTURE($34)(the-hall-of-fire,The Hall Of Fire)
  $BCB9,$0C

b $BCC5 Picture: A Narrow Canyon Beside A Stream
@ $BCC5 label=Picture_NarrowCanyon
D $BCC5 Room #N($35), drawn entirely from its own shapes. #RECORDLINKS
D $BCC5 #PICTURE($35)(a-narrow-canyon-beside-a-stream,A Narrow Canyon Beside A Stream)
  $BCC5,$20

b $BCE5 Picture: The Canyon On The East Bank Of The Stream
@ $BCE5 label=Picture_EastBankOfStream
D $BCE5 Room #N$36 starts from the picture of room #N$35 (a narrow canyon
. beside a stream) at #R$BCC5, then adds its own shapes. #RECORDLINKS
D $BCE5 #PICTURE($36)(the-canyon-on-the-east-bank-of-the-stream,The Canyon On The East Bank Of The Stream)
  $BCE5,$12

b $BCF7 Picture: A Ledge High Over A Pool Of Lava
@ $BCF7 label=Picture_LedgeOverLava
D $BCF7 Room #N($37), drawn entirely from its own shapes. Object #N$34 ("A
. crystal bridge spans the pit of lava") adds a shape only while it is in this
. room. #RECORDLINKS
D $BCF7 #PICTURE($37)(a-ledge-high-over-a-pool-of-lava,A Ledge High Over A Pool Of Lava)
  $BCF7,$32

b $BD29 Picture: A Wet Dripping Cave
@ $BD29 label=Picture_WetDrippingCave
D $BD29 Room #N($38), drawn entirely from its own shapes. Object #N$2D
. ("Tentacles of slime are reaching out towards me from a pit of oily slime")
. adds a shape only while it is in this room. #RECORDLINKS
D $BD29 #PICTURE($38)(a-wet-dripping-cave,A Wet Dripping Cave)
  $BD29,$10

b $BD39 Picture: An Arched Entry Hall
@ $BD39 label=Picture_ArchedEntryHall
D $BD39 Room #N($39), drawn entirely from its own shapes. #RECORDLINKS
D $BD39 #PICTURE($39)(an-arched-entry-hall,An Arched Entry Hall)
  $BD39,$0E

b $BD47 Picture: A Magnificent Pillared Throne Hall
@ $BD47 label=Picture_PillaredThroneHall
D $BD47 Room #N($3A), drawn entirely from its own shapes. #RECORDLINKS
D $BD47 #PICTURE($3A)(a-magnificent-pillared-throne-hall,A Magnificent Pillared Throne Hall)
  $BD47,$09

b $BD50 Picture: A Small Room (Off The Entry Hall)
@ $BD50 label=Picture_SmallRoomOffEntryHall
D $BD50 Room #N$3B starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$36 ("Broken") adds a
. shape only while it is in this room. #RECORDLINKS
D $BD50 #PICTURE($3B)(a-small-room-off-the-entry-hall,A Small Room (Off The Entry Hall))
  $BD50,$17

b $BD67 Picture: A Treasure Room
@ $BD67 label=Picture_TreasureRoom
D $BD67 Room #N$3C is the picture of room #N$0A (a passage hidden beneath a
. large statue) at #R$B856, with its colours changed. #RECORDLINKS
D $BD67 #PICTURE($3C)(a-treasure-room,A Treasure Room)
  $BD67,$06

b $BD6D Picture: A Low Passage With A Danger Sign
@ $BD6D label=Picture_LowPassageWithSign
D $BD6D Room #N$3D is the picture of room #N$18 (a low dark passage covered in
. mould) at #R$B9E6, with its colours changed. #RECORDLINKS
D $BD6D #PICTURE($3D)(a-low-passage-with-a-danger-sign,A Low Passage With A Danger Sign)
  $BD6D,$06

b $BD73 Picture: A Huge Glittering Cave
@ $BD73 label=Picture_GlitteringCave
D $BD73 Room #N($3E), drawn entirely from its own shapes. #RECORDLINKS
D $BD73 #PICTURE($3E)(a-huge-glittering-cave,A Huge Glittering Cave)
  $BD73,$0B

b $BD7E Picture: A Slime Pit
@ $BD7E label=Picture_SlimePit
D $BD7E Room #N($3F), drawn entirely from its own shapes. #RECORDLINKS
D $BD7E #PICTURE($3F)(a-slime-pit,A Slime Pit)
  $BD7E,$14

b $BD92 Empty Picture Record
@ $BD92 label=Picture_CeasedToExist
D $BD92 Room #N$40 ("you have ceased to exist") has no picture; its record is
. just the #N$FF terminator. #RECORDLINKS
  $BD92,$01

b $BD93 Picture: The Far Side Of The Lava Pit
@ $BD93 label=Picture_FarSideOfLavaPit
D $BD93 Room #N($41), drawn entirely from its own shapes. Object #N$35 ("A
. crystal bridge spans the pit of lava") adds a shape only while it is in this
. room. #RECORDLINKS
D $BD93 #PICTURE($41)(the-far-side-of-the-lava-pit,The Far Side Of The Lava Pit)
  $BD93,$32

b $BDC5 Picture: A Sinister Evil Temple
@ $BDC5 label=Picture_EvilTemple
D $BDC5 Room #N($42), drawn entirely from its own shapes. Object #N$78 ("The
. evil wizard") adds a shape only while it is in this room. Object #N$41 ("A
. lightning bolt is arcing towards you") adds a shape only while it is in this
. room. Object #N$39 ("A ball of flame is streaking towards me") adds a shape
. only while it is in this room. #RECORDLINKS
D $BDC5 #PICTURE($42)(a-sinister-evil-temple,A Sinister Evil Temple)
  $BDC5,$18

b $BDDD Picture: A Workroom (Beside The Evil Temple)
@ $BDDD label=Picture_WorkroomBesideEvilTemple
D $BDDD Room #N$43 is the picture of room #N$05 (a very dim shadowy room) at
. #R$B7E8, with its colours changed. #RECORDLINKS
D $BDDD #PICTURE($43)(a-workroom-beside-the-evil-temple,A Workroom (Beside The Evil Temple))
  $BDDD,$06

b $BDE3 Picture: A Snowstorm Outside The Barred Sorcerors Gate
@ $BDE3 label=Picture_OutsideSorcerorsGate
D $BDE3 Room #N($44), drawn entirely from its own shapes. #RECORDLINKS
D $BDE3 #PICTURE($44)(a-snowstorm-outside-the-barred-sorcerors-gate,A Snowstorm Outside The Barred Sorcerors Gate)
  $BDE3,$54

b $BE37 Picture: A Snowstorm Beside A Crevasse
@ $BE37 label=Picture_SnowstormBesideCrevasse
D $BE37 Room #N$45 draws its own shapes and, part way through, the picture of
. room #N$02 (lost in a freezing blizzard) at #R$B79C. #RECORDLINKS
D $BE37 #PICTURE($45)(a-snowstorm-beside-a-crevasse,A Snowstorm Beside A Crevasse)
  $BE37,$2B

b $BE62 Picture: The Crevasse
@ $BE62 label=Picture_Crevasse
D $BE62 Room #N($46), drawn entirely from its own shapes. #RECORDLINKS
D $BE62 #PICTURE($46)(the-crevasse,The Crevasse)
  $BE62,$18

b $BE7A Picture: The Temple Of The Elements
@ $BE7A label=Picture_TempleOfTheElements
D $BE7A Room #N($47), drawn entirely from its own shapes. #RECORDLINKS
D $BE7A #PICTURE($47)(the-temple-of-the-elements,The Temple Of The Elements)
  $BE7A,$0F

b $BE89 Empty Picture Record
@ $BE89 label=Picture_EmptyAfterTempleOfElements
D $BE89 Room #N$48 ("empty") has no picture; its record is just the #N$FF
. terminator. #RECORDLINKS
  $BE89,$01

b $BE8A Picture: A Glittering Ice Cave
@ $BE8A label=Picture_GlitteringIceCave
D $BE8A Room #N($49), drawn entirely from its own shapes. #RECORDLINKS
D $BE8A #PICTURE($49)(a-glittering-ice-cave,A Glittering Ice Cave)
  $BE8A,$06

b $BE90 Picture: A Snowy Pass With A Cavemouth
@ $BE90 label=Picture_SnowyPassAtCavemouth
D $BE90 Room #N$4A starts from the picture of room #N$50 (a rocky pass) at
. #R$BECB, then adds its own shapes. Object #N$82 ("Yeti") adds a shape only
. while it is in this room. Object #N$3F ("Huge piles of snow cover the floor
. of the pass") adds a shape only while it is in this room. #RECORDLINKS
D $BE90 #PICTURE($4A)(a-snowy-pass-with-a-cavemouth,A Snowy Pass With A Cavemouth)
  $BE90,$10

b $BEA0 Picture: A Snowy Pass (South Of The Cavemouth)
@ $BEA0 label=Picture_SnowyPassSouthOfCavemouth
D $BEA0 Room #N$4B is the picture of room #N$50 (a rocky pass) at #R$BECB,
. mirrored left to right. #RECORDLINKS
D $BEA0 #PICTURE($4B)(a-snowy-pass-south-of-the-cavemouth,A Snowy Pass (South Of The Cavemouth))
  $BEA0,$04

b $BEA4 Picture: An Icy Pass
@ $BEA4 label=Picture_IcyPass
D $BEA4 Room #N$4C reuses the whole picture of room #N$50 (a rocky pass) at
. #R$BECB. #RECORDLINKS
D $BEA4 #PICTURE($4C)(an-icy-pass,An Icy Pass)
  $BEA4,$03

b $BEA7 Picture: A Path Up The Mountainside To A Temple
@ $BEA7 label=Picture_MountainsidePath
D $BEA7 Room #N$4D is the picture of room #N$50 (a rocky pass) at #R$BECB,
. mirrored left to right and with its left half then reflected onto the right.
. #RECORDLINKS
D $BEA7 #PICTURE($4D)(a-path-up-the-mountainside-to-a-temple,A Path Up The Mountainside To A Temple)
  $BEA7,$05

b $BEAC Picture: The Ruins Of A Temple
@ $BEAC label=Picture_RuinsOfTemple
D $BEAC Room #N$4E starts from the picture of room #N$02 (lost in a freezing
. blizzard) at #R$B79C, then adds its own shapes. #RECORDLINKS
D $BEAC #PICTURE($4E)(the-ruins-of-a-temple,The Ruins Of A Temple)
  $BEAC,$0C

b $BEB8 Picture: A Snowy Pass (North Of The Rocky Pass)
@ $BEB8 label=Picture_SnowyPassNorthOfRockyPass
D $BEB8 Room #N$4F starts from the picture of room #N$50 (a rocky pass) at
. #R$BECB, then adds its own shapes. Object #N$86 ("Several border guards")
. adds a shape only while it is in this room. #RECORDLINKS
D $BEB8 #PICTURE($4F)(a-snowy-pass-north-of-the-rocky-pass,A Snowy Pass (North Of The Rocky Pass))
  $BEB8,$13

b $BECB Picture: A Rocky Pass
@ $BECB label=Picture_RockyPass
D $BECB Room #N($50), drawn entirely from its own shapes. #RECORDLINKS
D $BECB #PICTURE($50)(a-rocky-pass,A Rocky Pass)
  $BECB,$52

b $BF1D Picture: A Green And Fair Valley
@ $BF1D label=Picture_GreenAndFairValley
D $BF1D Room #N($51), drawn entirely from its own shapes. #RECORDLINKS
D $BF1D #PICTURE($51)(a-green-and-fair-valley,A Green And Fair Valley)
  $BF1D,$08

b $BF25 Picture: A Humpbacked Bridge Over A Stream
@ $BF25 label=Picture_HumpbackedBridge
D $BF25 Room #N$52 starts from the picture of room #N$58 (a field beside a
. stream) at #R$BF96, then adds its own shapes. #RECORDLINKS
D $BF25 #PICTURE($52)(a-humpbacked-bridge-over-a-stream,A Humpbacked Bridge Over A Stream)
  $BF25,$09

b $BF2E Picture: A Square Of Grass In The Centre Of A Village
@ $BF2E label=Picture_VillageGreen
D $BF2E Room #N$53 reuses the whole picture of room #N$55 (your cottage) at
. #R$BF51. #RECORDLINKS
D $BF2E #PICTURE($53)(a-square-of-grass-in-the-centre-of-a-village,A Square Of Grass In The Centre Of A Village)
  $BF2E,$03

b $BF31 Picture: A Wooden Church
@ $BF31 label=Picture_WoodenChurch
D $BF31 Room #N($54), drawn entirely from its own shapes. #RECORDLINKS
D $BF31 #PICTURE($54)(a-wooden-church,A Wooden Church)
  $BF31,$20

b $BF51 Picture: Your Cottage
@ $BF51 label=Picture_Cottage
D $BF51 Room #N($55), drawn entirely from its own shapes. #RECORDLINKS
D $BF51 #PICTURE($55)(your-cottage,Your Cottage)
  $BF51,$18

b $BF69 Picture: A Green Wood
@ $BF69 label=Picture_GreenWood
D $BF69 Room #N($56), drawn entirely from its own shapes. #RECORDLINKS
D $BF69 #PICTURE($56)(a-green-wood,A Green Wood)
  $BF69,$07

b $BF70 Picture: A Secluded Clearing Beside A Waterfall
@ $BF70 label=Picture_ClearingByWaterfall
D $BF70 Room #N($57), drawn entirely from its own shapes. #RECORDLINKS
D $BF70 #PICTURE($57)(a-secluded-clearing-beside-a-waterfall,A Secluded Clearing Beside A Waterfall)
  $BF70,$26

b $BF96 Picture: A Field Beside A Stream
@ $BF96 label=Picture_FieldBesideStream
D $BF96 Room #N($58), drawn entirely from its own shapes. #RECORDLINKS
D $BF96 #PICTURE($58)(a-field-beside-a-stream,A Field Beside A Stream)
  $BF96,$27

b $BFBD Picture: The Woods Beside A Stream
@ $BFBD label=Picture_WoodsBesideStream
D $BFBD Room #N$59 reuses the whole picture of room #N$5A (the woods) at
. #R$BFC0. #RECORDLINKS
D $BFBD #PICTURE($59)(the-woods-beside-a-stream,The Woods Beside A Stream)
  $BFBD,$03

b $BFC0 Picture: The Woods
@ $BFC0 label=Picture_Woods
D $BFC0 Room #N($5A), drawn entirely from its own shapes. #RECORDLINKS
D $BFC0 #PICTURE($5A)(the-woods,The Woods)
  $BFC0,$05

b $BFC5 Picture: A Shady Clearing Deep In The Woods
@ $BFC5 label=Picture_ShadyClearing
D $BFC5 Room #N$5B is the picture of room #N$5A (the woods) at #R$BFC0,
. mirrored left to right. #RECORDLINKS
D $BFC5 #PICTURE($5B)(a-shady-clearing-deep-in-the-woods,A Shady Clearing Deep In The Woods)
  $BFC5,$04

b $BFC9 Picture: A Clearing Beside A Crystal Clear Pool
@ $BFC9 label=Picture_ClearingByPool
D $BFC9 Room #N$5C starts from the picture of room #N$58 (a field beside a
. stream) at #R$BF96, then adds its own shapes. #RECORDLINKS
D $BFC9 #PICTURE($5C)(a-clearing-beside-a-crystal-clear-pool,A Clearing Beside A Crystal Clear Pool)
  $BFC9,$0B

b $BFD4 Picture: A Glittering Hall Made Entirely Of Ice
@ $BFD4 label=Picture_HallOfIce
D $BFD4 Room #N($5D), drawn entirely from its own shapes. #RECORDLINKS
D $BFD4 #PICTURE($5D)(a-glittering-hall-made-entirely-of-ice,A Glittering Hall Made Entirely Of Ice)
  $BFD4,$09

b $BFDD Picture: The Magicians Research Room
@ $BFDD label=Picture_ResearchRoomOfIce
D $BFDD Room #N$5E starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$45 ("There is a hole in
. the roof, through which light streams") adds a shape only while it is in this
. room. #RECORDLINKS
D $BFDD #PICTURE($5E)(the-magicians-research-room,The Magicians Research Room)
  $BFDD,$14

b $BFF1 Picture: A Huge Hall At The Centre Of The Ice Palace
@ $BFF1 label=Picture_IcePalaceHall
D $BFF1 Room #N($5F), drawn entirely from its own shapes. #RECORDLINKS
D $BFF1 #PICTURE($5F)(a-huge-hall-at-the-centre-of-the-ice-palace,A Huge Hall At The Centre Of The Ice Palace)
  $BFF1,$0F

b $C000 Picture: An Icy Throne Hall
@ $C000 label=Picture_IcyThroneHall
@ $C000 refs=:$66C7
D $C000 Room #N($60), drawn entirely from its own shapes. From here on the
. records are in RAM bank 0, the bank #R$66C7(#N$66CF) pages back in at #N$C000
. after each command, so the picture code reads them directly. #RECORDLINKS
D $C000 #PICTURE($60)(an-icy-throne-hall,An Icy Throne Hall)
  $C000,$2E

b $C02E Picture: The Royal Bedroom
@ $C02E label=Picture_RoyalBedroom
D $C02E Room #N$61 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$32 ("Open, revealing
. what is in fact a room beyond") adds a shape only while it is in this room.
. #RECORDLINKS
D $C02E #PICTURE($61)(the-royal-bedroom,The Royal Bedroom)
  $C02E,$0E

b $C03C Picture: A Secret Room
@ $C03C label=Picture_SecretRoom
D $C03C Room #N$62 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $C03C #PICTURE($62)(a-secret-room,A Secret Room)
  $C03C,$06

b $C042 Picture: The Priests Room
@ $C042 label=Picture_PriestsRoom
D $C042 Room #N$63 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. #RECORDLINKS
D $C042 #PICTURE($63)(the-priests-room,The Priests Room)
  $C042,$0C

b $C04E Picture: A Maze Of Catacombs (Dead End)
@ $C04E label=Picture_CatacombsDeadEnd
D $C04E Room #N($64), drawn entirely from its own shapes. #RECORDLINKS
D $C04E #PICTURE($64)(a-maze-of-catacombs-dead-end,A Maze Of Catacombs (Dead End))
  $C04E,$11

b $C05F Picture: A Maze Of Catacombs (South Of The Priests Room)
@ $C05F label=Picture_CatacombsSouthOfPriestsRoom
D $C05F Room #N($65), drawn entirely from its own shapes. #RECORDLINKS
D $C05F #PICTURE($65)(a-maze-of-catacombs-south-of-the-priests-room,A Maze Of Catacombs (South Of The Priests Room))
  $C05F,$17

b $C076 Picture: A Maze Of Catacombs (Middle)
@ $C076 label=Picture_CatacombsMiddle
D $C076 Room #N$66 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F. #RECORDLINKS
D $C076 #PICTURE($66)(a-maze-of-catacombs-middle,A Maze Of Catacombs (Middle))
  $C076,$03

b $C079 Picture: A Maze Of Catacombs (Twisting)
@ $C079 label=Picture_CatacombsTwisting
D $C079 Room #N$67 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F. #RECORDLINKS
D $C079 #PICTURE($67)(a-maze-of-catacombs-twisting,A Maze Of Catacombs (Twisting))
  $C079,$03

b $C07C Picture: A Maze Of Catacombs (Loop)
@ $C07C label=Picture_CatacombsLoop
D $C07C Room #N$68 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F. #RECORDLINKS
D $C07C #PICTURE($68)(a-maze-of-catacombs-loop,A Maze Of Catacombs (Loop))
  $C07C,$03

b $C07F Picture: A Maze Of Catacombs (By The Crypt)
@ $C07F label=Picture_CatacombsByCrypt
D $C07F Room #N$69 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F. #RECORDLINKS
D $C07F #PICTURE($69)(a-maze-of-catacombs-by-the-crypt,A Maze Of Catacombs (By The Crypt))
  $C07F,$03

b $C082 Picture: A Crypt Beneath The Temple
@ $C082 label=Picture_CryptBeneathTemple
D $C082 Room #N($6A), drawn entirely from its own shapes. #RECORDLINKS
D $C082 #PICTURE($6A)(a-crypt-beneath-the-temple,A Crypt Beneath The Temple)
  $C082,$11

b $C093 Empty Picture Record
@ $C093 label=Picture_EmptyAfterCryptBeneathTemple
D $C093 Room #N$6B ("empty") has no picture; its record is just the #N$FF
. terminator. #RECORDLINKS
  $C093,$01

b $C094 End Of Picture Records
@ $C094 label=RoomRecordsEnd
D $C094 One more #N$FF after the record for room #N$6B closes the table. The
. zero bytes after it are not part of any picture.
  $C094,$01

s $C095 Unused After Picture Records
@ $C095 label=UnusedAfterRecords
D $C095 Zero bytes between the end of the picture records at #R$C094 and the
. picture tiles. Nothing reads them.
  $C095,$2BB

b $C350 Picture Tiles And Shapes
@ $C350 label=PictureTilesAndShapes
D $C350 What the picture records draw with. #R$6FC9 turns a tile number into
. eight bytes counted from #N(#PC), so tile 0 here is blank, and #R$718B finds
. a shape by counting #N$FE terminators from #N$C708.
  $C350,$36A8

s $F9F8 Unused Top Of Bank 0
@ $F9F8 label=UnusedBankTop
D $F9F8 Zero bytes between the picture stream and the 128 BASIC residue.
  $F9F8,$520

b $FF18 BASIC Residue
@ $FF18 label=BasicResidue
D $FF18 A fragment of the 128 BASIC character set left at the top of bank 0.
. The glyph plotter uses the ROM font, not this copy. Bank 7 holds a different
. fragment at the same addresses; that copy is not this one, and it is not
. game code.
  $FF18,$C4

c $FFDC Start Game
@ $FFDC label=StartGame
D $FFDC The last loader block. It loads #N$0100 bytes over the command buffer
. and falls into the game. The snapshot is paused on the call into #R$5ECB.
@ $FFE9 label=GameEntry
N $FFDC The #N$0100 bytes are a headerless block, flagged by the carry.
  $FFDC,$0A Load into #R$5B00.
  $FFE6,$03 Call #SKOOLKID$0556(LD-BYTES).
  $FFE9,$03 Call #R$5ECB to run the adventure.

b $FFEC Bytes After Entry
@ $FFEC label=AfterEntry
D $FFEC Not executed. The call into the game loop does not return here.
  $FFEC,$14
