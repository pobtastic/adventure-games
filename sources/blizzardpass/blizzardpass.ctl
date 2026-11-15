; Copyright Adventuresoft UK Ltd 1986, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction
; e.g. Print_HighScore_Loop.
;
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
> $4000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
> $4000 @expand=#DEF1(#PAGE(bank) page RAM bank #N({bank}) in at #N($C000), keeping the 48K ROM)
> $4000 @expand=#DEF1(#NOWHERE(addr) #IF(#PEEK({addr})==$FC)(nowhere)#IF(#PEEK({addr})!=$FC)(room #N(#PEEK({addr}))))
> $4000 @expand=#DEF1(#MESSAGE(addr)#STR{addr},$08($b==$5E||$b==$7E))
> $4000 @expand=#DEF1(#BUILDICT #LET(dict[]=(0))#LET(d=$B1BC)#FOR$00,$FF||q|#LET(dict[q]={{d}})#WHILE((#PEEK({{d}})&$80)==0)(#LET(d={{d}}+1))#LET(d={{d}}+1)||)
> $4000 @expand=#DEF1(#TOKENS(n) #FOR($00,{n}-1)||x|#R({{dict[#PEEK(#PC+x)]}})(#STR({{dict[#PEEK(#PC+x)]}}))|, ||)
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
N $4000 #UDGTABLE
. { =h Blizzard Pass Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

b $5B00 Command Buffer
@ $5B00 label=CommandBuffer
D $5B00 Characters typed at the prompt, in capitals, ending with ENTER. The
. parser refuses a line longer than #N$5E characters.
  $5B00,$5E

b $5B60 Word Being Printed
@ $5B60 label=WordBuffer
D $5B60 The printer collects one word here and flushes it when it hits a space,
. ENTER, or a message terminator.
  $5B60,$19

g $5B79 Script Matched
@ $5B79 label=ScriptMatched
D $5B79 Set when a bytecode line's verb and noun matched. The next line is
. skipped until this is cleared.
  $5B79,$01

g $5B7A Search Hit
@ $5B7A label=SearchHit
D $5B7A Set when a movement or an object list finds what it is looking for.
  $5B7A,$01

b $5B7B Word Under Test
@ $5B7B label=WordToken
D $5B7B Four characters of the word currently being matched, padded with spaces.
  $5B7B,$04

g $5B7F Verb
@ $5B7F label=Verb
D $5B7F Token of the first word. Directions are #N$01 to #N($0A), inventory is
. #N($0B), GET is #N($0C), DROP is #N($0D), WEAR is #N$0E and QUIT is #N$10.
  $5B7F,$01

g $5B80 Noun
@ $5B80 label=Noun
D $5B80 Token of the second word. IT and THEM reuse the previous noun.
  $5B80,$01

g $5B81 Counter #N$01
@ $5B81 label=Counter1
D $5B81 Bytecode counter compared by #R$6759.
  $5B81,$01

g $5B82 Counter #N$02
@ $5B82 label=Counter2
D $5B82 Bytecode counter compared by #R$6760.
  $5B82,$01

g $5B83 Counter #N$03
@ $5B83 label=Counter3
D $5B83 Bytecode counter compared by #R$6767.
  $5B83,$01

g $5B84 Exit Key
@ $5B84 label=ExitKey
D $5B84 The current room plus #N($80), which is how that room is keyed in the
. exit table.
  $5B84,$01

g $5B85 Continuation
@ $5B85 label=Continuation
D $5B85 Non-zero when a comma left more of the command line for the next turn.
  $5B85,$01

g $5B86 Word Slot
@ $5B86 label=WordSlot
D $5B86 How many words of this command have been stored. The script runner
. clears it after the first matched line.
  $5B86,$01

g $5B87 Print Address
@ $5B87 label=PrintAddress
D $5B87 Spectrum display address where the next glyph is plotted.
  $5B87,$02

g $5B89 Print Row
@ $5B89 label=PrintRow
D $5B89 Character row of the cursor. It is saved and restored as a pair with the
. column.
  $5B89,$01

g $5B8A Print Column
@ $5B8A label=PrintColumn
D $5B8A Character column of the cursor. The text window is #N$2B columns wide.
  $5B8A,$01

g $5B8B Words Recognised
@ $5B8B label=WordCount
D $5B8B How many vocabulary words the parser kept from the current line.
  $5B8B,$01

g $5B8C Rest Of The Line
@ $5B8C label=InputPointer
D $5B8C Where to resume after a comma, and the pointer the vocabulary scan
. restores.
  $5B8C,$02

g $5B8E Input Length
@ $5B8E label=InputLength
D $5B8E Characters currently in the command buffer. DELETE is ignored when this
. is zero.
  $5B8E,$01

g $5B8F Message Number
@ $5B8F label=MessageNumber
D $5B8F Which terminated message to print, counted from the start of the chosen
. table.
  $5B8F,$01

g $5B90 Message Pointer
@ $5B90 label=MessagePointer
D $5B90 Address of the message byte just printed.
  $5B90,$02

g $5B92 Scratch
@ $5B92 label=Scratch92
D $5B92 Two unused bytes between the message pointer and the subtraction
. scratch.
  $5B92,$02

g $5B94 Subtraction Scratch
@ $5B94 label=SubtractScratch
D $5B94 Amount subtracted from a flag by #R$69FE.
  $5B94,$01

g $5B95 Room Changed
@ $5B95 label=RoomChanged
D $5B95 Set when a script or a movement changes the room, so the loop describes
. it again.
  $5B95,$01

g $5B96 Which Script Table
@ $5B96 label=ScriptSet
D $5B96 #N$FF while the high-priority scripts run, and zero for the ordinary
. command scripts.
  $5B96,$01

g $5B97 Bottom Row
@ $5B97 label=BottomRow
D $5B97 Last character row the text window may use before it scrolls.
  $5B97,$01

g $5B98 Word Length
@ $5B98 label=WordLength
D $5B98 Characters collected for the word that is about to be flushed.
  $5B98,$01

g $5B99 Word Pointer
@ $5B99 label=WordPointer
D $5B99 Next free byte in the word buffer.
  $5B99,$02

g $5B9B Last Character
@ $5B9B label=LastCharacter
D $5B9B The character just expanded. A full stop here makes the next letter a
. capital.
  $5B9B,$01

g $5B9C Previous Glyph
@ $5B9C label=PreviousGlyph
D $5B9C The glyph just plotted, so a second space in a row can be rubbed out.
  $5B9C,$01

g $5B9D Previous Noun
@ $5B9D label=PreviousNoun
D $5B9D The noun IT and THEM refer to.
  $5B9D,$01

g $5B9E Parameter Count
@ $5B9E label=Parameter_Count
D $5B9E Remaining times #R$5B9F is returned from the copied parameter block.
  $5B9E,$01

g $5B9F Parameter Byte
@ $5B9F label=Parameter_Byte
D $5B9F Byte returned while #R$5B9E is non-zero.
  $5B9F,$01

b $5BA0 Parameter Bytes
@ $5BA0 label=Parameter_Bytes
D $5BA0 Further bytes of the parameter block copied onto #R$5B9E by
. #R$71FF.
  $5BA0,$12

b $5BB2 Tile Workspace
@ $5BB2 label=Tile_Workspace
D $5BB2 Eight shifted tile bytes used while a shape is scaled.
  $5BB2,$08

g $5BBA Picture Destination
@ $5BBA label=Picture_Destination
D $5BBA Next byte in the illustration buffer being painted.
  $5BBA,$02

g $5BBC Shape Pointer
@ $5BBC label=Shape_Pointer
D $5BBC Next byte of the shape currently being drawn.
  $5BBC,$02

g $5BBE Shift Flags
@ $5BBE label=Shift_Flags
D $5BBE How the current tile is shifted and merged.
  $5BBE,$01

g $5BBF Shift Flag
@ $5BBF label=Shift_Flag
D $5BBF Copy of #R$5BBE. Bit 0 chooses the tile page.
  $5BBF,$01

g $5BC0 Run Count
@ $5BC0 label=Run_Count
D $5BC0 Remaining repeats of the current tile or attribute byte.
  $5BC0,$01

g $5BC1 Picture X
@ $5BC1 label=Picture_X
D $5BC1 Character column of the shape being drawn.
  $5BC1,$01

g $5BC2 Picture Y
@ $5BC2 label=Picture_Y
D $5BC2 Character row of the shape being drawn.
  $5BC2,$01

g $5BC3 Drawing Y
@ $5BC3 label=Drawing_Y
D $5BC3 Working copy of #R$5BC2, stepped after each character row.
  $5BC3,$01

g $5BC4 Row Width
@ $5BC4 label=Row_Width
D $5BC4 Width of the shape in character columns.
  $5BC4,$01

g $5BC5 Row Height
@ $5BC5 label=Row_Height
D $5BC5 Height of the shape in character rows.
  $5BC5,$01

g $5BC6 Column Counter
@ $5BC6 label=Column_Counter
D $5BC6 Columns left in the current row.
  $5BC6,$01

g $5BC7 Rows Remaining
@ $5BC7 label=Rows_Remaining
D $5BC7 Rows left in the current shape.
  $5BC7,$01

g $5BC8 Combine Mode
@ $5BC8 label=Combine_Mode
D $5BC8 How tile bytes are merged: #N$04 OR, #N$08 AND, #N$0C XOR.
  $5BC8,$01

g $5BC9 Destination Base
@ $5BC9 label=Destination_Base
D $5BC9 Start of the attribute destination for this shape.
  $5BC9,$02

g $5BCB Last Painted Byte
@ $5BCB label=Last_Painted_Byte
D $5BCB Attribute byte to repeat when a run continues.
  $5BCB,$01

g $5BCC Saved Shape Pointer
@ $5BCC label=Saved_Shape_Pointer
D $5BCC Shape stream position remembered while a parameter block is copied.
  $5BCC,$02

u $5BCE
B $5BCE,$01

g $5BCF Last Matched Verb
@ $5BCF label=Last_Matched_Verb
D $5BCF Verb that last matched an exit. #R$5FF1 clears it.
  $5BCF,$01

w $5BD0 Screen Row Addresses
@ $5BD0 label=ScreenRows
D $5BD0 Pixel address of each character row in the text window. Row 0 is the top
. of the display.
N $5BD0 The rows are #FOR$5BD0,$5BFE,$02||x|#N((x-$5BD0)/$02) at
. #N(#PEEK(x)+$100*#PEEK(x+$01))|, | and ||.
  $5BD0,$02 Row #N((#PC-$5BD0)/$02).
L $5BD0,$02,$18,$02

b $5C00 System Variables
@ $5C00 label=SystemVariables
D $5C00 The ROM's system variables, still in use while the game runs. IY is left
. pointing at #SKOOLKID$5C3A(ERR_NR), and the maskable interrupt keeps
. #SKOOLKID$5C78(FRAMES), #SKOOLKID$5C00(KSTATE), #SKOOLKID$5C08(LAST_K) and
. #SKOOLKID$5C3B(FLAGS) up to date for the routines that read them.
  $5C00,$B6

b $5CB6 Stack
@ $5CB6 label=StackSpace
D $5CB6 The channel information and the BASIC loader, left as they were when the
. game started. #R$5ECB(#N$5ED1) sets the stack pointer to #R$5D84, just below
. the room state, and the stack grows down from there into the end of this
. block.
  $5CB6,$CE

g $5D84 Stack Top
@ $5D84 label=StackTop
D $5D84 The stack pointer installed at the start of the game loop. Two bytes sit
. under the room byte.
  $5D84,$03

g $5D87 Current Room
@ $5D87 label=CurrentRoom
D $5D87 The room the player is in. Its short text at #R$75CE is used for rooms
. #N$66 and above, and for every room while pictures are on. Otherwise the long
. description comes from bank 6.
  $5D87,$01

g $5D88 Darkness
@ $5D88 label=Darkness
D $5D88 Non-zero when the location is dark and must be described as such.
  $5D88,$01

g $5D89 Carried Object
@ $5D89 label=CarriedObject
D $5D89 Object in the hands. #N$FD means the hands are empty.
  $5D89,$01

g $5D8A Worn Object
@ $5D8A label=WornObject
D $5D8A Object being worn. #N$FE means nothing is worn.
  $5D8A,$01

g $5D8B State Byte
@ $5D8B label=StateByte
D $5D8B Copied from the initial state as flag byte 4. The bytecode addresses it
. through #R$67FF.
  $5D8B,$01

g $5D8C Carried Count
@ $5D8C label=CarriedCount
D $5D8C How many objects are currently carried. GET increments it and DROP
. decrements it.
  $5D8C,$01

g $5D8D Object Total
@ $5D8D label=ObjectTotal
D $5D8D How many object slots to scan when listing what is here. It starts at
. #N$96.
  $5D8D,$01

g $5D8E Repeat Counter
@ $5D8E label=RepeatCounter
D $5D8E While this is non-zero the game loop reruns the scripts and redraws,
. then decrements it.
  $5D8E,$01

b $5D8F Flag Bytes
@ $5D8F label=FlagBytes
D $5D8F The rest of the flag area the bytecode indexes from #R$5D87, from flag
. #N$08. It is cleared at the start of a game.
N $5D8F Flag #N($08+(#PC-$5D8F)).
  $5D8F,$01
L $5D8F,$01,$3B,$02

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
  $5ECA,$01

c $5ECB Game Loop
@ $5ECB label=GameLoop
D $5ECB Runs the adventure. It prepares a new game, describes the room, runs the
. location scripts, draws the picture, then reads a command and obeys it. A ROM
. error returns with the stack at #R$6B41.
N $5ECB Install the word at #R$6B41 as the ROM error handler and give the game
. its own stack.
  $5ECB,$06 Store #R$6B41 in #SKOOLKID$5C3D(ERR_SP).
  $5ED1,$03 #REGsp=#R$5D84.
N $5ED4 Start in the first room with an empty inventory.
  $5ED4,$03 Call #R$600F.
  $5ED7,$04 Clear *#R$6185.
N $5EDB Describe the first room.
  $5EDB,$03 Call #R$6187.
N $5EDE Run the high-priority scripts, and describe the room again if they moved
. the player.
@ $5EDE label=GameLoop_Act
  $5EDE,$04 Clear *#R$5D8E.
  $5EE2,$03 Call #R$6058.
  $5EE5,$06 Jump to #R$5EEE if *#R$5B95 is unset.
N $5EEB Describe the new room.
  $5EEB,$03 Call #R$6187.
N $5EEE Draw the illustration once for this room, then either repeat or ask for
. a command.
@ $5EEE label=GameLoop_Draw
  $5EEE,$03 Call #R$6B15.
  $5EF1,$04 Clear *#R$5B95.
  $5EF5,$06 Jump to #R$5F46 if *#R$5D8E is set.
N $5EFB Read a command. An empty line is a complaint, not an action.
  $5EFB,$03 Call #R$66C7.
  $5EFE,$06 Jump to #R$5F21 if *#R$5B7F is set.
  $5F04,$06 Jump to #R$5F21 if *#R$5B80 is set.
N $5F0A Print "that input contained no recognised words.".
  $5F0A,$05 Print #R$7E65 using #R$63D4.
  $5F0F,$04 Clear *#R$5B85.
N $5F13 Start another turn.
  $5F13,$02 Jump to #R$5EDE.

g $5F15 Pictured Object
@ $5F15 label=PicturedObject
D $5F15 The room-change scan compares a picture record with this byte. Nothing
. in the game writes it, so the comparison is against zero.
  $5F15,$01

c $5F16 Character Row Address
@ $5F16 label=RowAddress
D $5F16 Turns a character row in #REGa into the display address of that row.
R $5F16 A Character row
R $5F16 O:DE Display address of character row #REGa
  $5F16,$03 Copy the row into #REGhl.
  $5F19,$05 Point at that word in #R$5BD0.
  $5F1E,$03 Enter #SKOOLKID$2AEE,$2AF0(DE_DE_1) at #N$2AF0 to load the row
. address into #REGde.

c $5F21 Obey Command
@ $5F21 label=ObeyCommand
D $5F21 Turns the verb and noun into a movement or a scripted action. PUSH,
. PULL, ROLL or MOVE with CURTAINS is rewritten to noun #N$2B. WET, COOL, DAMP
. or SOAK is refused, except with the robe, the door or the running water.
N $5F21 Curtains are a special noun for the pushing verbs.
  $5F21,$04 Verb #N$1B (PUSH, PULL, ROLL or MOVE) continues.
  $5F25,$07 Noun #N$85 (CURTAINS) continues.
  $5F2C,$05 That pair becomes noun #N$2B.
N $5F31 A movement that matches an exit changes the room and skips the scripts.
@ $5F31 label=ObeyCommand_Move
  $5F31,$03 Call #R$5FF1.
  $5F34,$06 Write the match into #R$5B95.
  $5F3A,$03 Jump to #R$5EDE if an exit was taken.
N $5F3D Run the ordinary command scripts.
  $5F3D,$03 Call #R$6074.
  $5F40,$06 Jump to #R$5F65 when no script line matched.
N $5F46 A script asked for the location to be reconsidered several times.
@ $5F46 label=ObeyCommand_Repeat
  $5F46,$06 Jump to #R$5EDE once the repeat count has run out.
  $5F4C,$04 Write #N$00 to #R$5B95.
N $5F50 Run the high-priority scripts.
  $5F50,$03 Call #R$6058.
  $5F53,$06 Jump to #R$5F5C if the room did not change.
  $5F59,$03 Call #R$6187 when those scripts moved the player.
N $5F5C Count down one repeat after the redraw.
@ $5F5C label=ObeyCommand_Redraw
  $5F5C,$03 Call #R$6B15.
  $5F5F,$03 Point #REGhl at #R$5D8E.
  $5F62,$01 Count down one repeat.
  $5F63,$02 Jump to #R$5F46.
N $5F65 WET, COOL, DAMP or SOAK only works on the robe, the door or the running
. water.
@ $5F65 label=ObeyCommand_Wet
  $5F65,$07 Only verb #N$1C (WET, COOL, DAMP or SOAK) continues.
  $5F6C,$07 The robe, noun #N($B8), is allowed.
  $5F73,$04 The running water, noun #N($DE), is allowed.
  $5F77,$04 The door, noun #N($D1), is allowed.
  $5F7B,$03 Point #REGhl at #R$5F8F.
  $5F7E,$02 #N$1B characters.
N $5F80 Print the refusal one character at a time.
@ $5F80 label=ObeyCommand_Water
  $5F80,$01 Fetch this character.
  $5F81,$03 Call #R$63FC.
  $5F84,$01 Advance to the next character.
  $5F85,$02 Jump to #R$5F80 until the sentence is done.
  $5F87,$05 Print ENTER.
  $5F8C,$03 Jump to #R$5EDE.

t $5F8F That Will Not Absorb Water
@ $5F8F label=AbsorbWater
D $5F8F Printed when something is asked to soak up water and cannot. The text is
. "#STR(#PC,,$1B)".
  $5F8F,$1B

c $5FAA Refuse Command
@ $5FAA label=RefuseCommand
D $5FAA The scripts did not handle the command. A direction says you cannot go
. that way, any other verb is beyond the game, and a blank verb produces the
. longer refusal.
  $5FAA,$04 Clear *#R$5B85.
  $5FAE,$06 Jump to #R$5FBC if *#R$5B7F is unset.
  $5FB4,$04 Jump to #R$5FBC if the verb is not a direction.
N $5FB8 Print "you can't go that way.".
  $5FB8,$04 Print #R$7F24 using #R$63D4.
N $5FBC A recognised verb that is not a direction, or no verb at all.
@ $5FBC label=RefuseCommand_Verb
  $5FBC,$06 Jump to #R$5FCA if *#R$5B7F is unset.
N $5FC2 Print "it's beyond my power to do that.".
  $5FC2,$02 Print #R$7E7E using #R$63D4.
N $5FC4 Print the chosen refusal.
@ $5FC4 label=RefuseCommand_Print
  $5FC4,$03 Call #R$63D4.
  $5FC7,$03 Jump to #R$5EDE.
N $5FCA Print "I don't understand that verb".
@ $5FCA label=RefuseCommand_None
  $5FCA,$04 Print #R$7F79 using #R$63D4.

c $5FCE Find Room In Exit Table
@ $5FCE label=FindExits
D $5FCE Looks through #R$AB67 for the current room. The room is stored as itself
. plus #N$80.
R $5FCE O:HL The matching room key, or the end of a full sweep of the table
  $5FCE,$03 Fetch #R$5D87.
  $5FD1,$05 Write that room plus #N$80 to #R$5B84.
  $5FD6,$04 Write #N$00 to #R$5B7A.
  $5FDA,$03 Point #REGde at #R$AB67.
  $5FDD,$03 Point #REGhl at #R$5B84.
N $5FE0 Scan the exit table.
@ $5FE0 label=FindExits_Scan
  $5FE0,$01 Fetch this key.
  $5FE1,$03 Jump to #R$5FEF if it matches this room.
  $5FE4,$06 The table wraps when the pointer reaches #N$34CE.
  $5FEA,$05 Otherwise keep scanning.
N $5FEF The matching room key, or the end of the table.
@ $5FEF label=FindExits_Found
  $5FEF,$01 Put the table pointer in #REGhl.
  $5FF0,$01 Return.

c $5FF1 Take Exit
@ $5FF1 label=TakeExit
D $5FF1 If the verb is one of the directions listed for this room, move to the
. destination that follows it.
N $5FF1 Find this room's exits.
  $5FF1,$03 Call #R$5FCE.
  $5FF4,$01 Step back one byte so the walk starts at the first exit.
N $5FF5 Each exit is a verb byte with bit 7 clear, then the destination room.
. Bit 7 ends the room.
@ $5FF5 label=TakeExit_Next
  $5FF5,$02 Advance to the next exit.
  $5FF7,$04 Jump to #R$600E if bit 7 is set.
  $5FFB,$06 Jump to #R$5FF5 if this exit is not the typed verb.
  $6001,$04 Write #N$00 to #R$5BCF.
  $6005,$04 Write #N$01 to #R$5B7A.
  $6009,$02 Fetch the destination room.
  $600B,$03 Write it to #R$5D87.
N $600E No more exits, or the move is done.
@ $600E label=TakeExit_Done
  $600E,$01 Return.

c $600F Prepare New Game
@ $600F label=PrepareGame
D $600F Clears the screen, forgets the previous command and copies the initial
. object locations and state into place.
N $600F The text window sits on rows #N$16 and #N$17 until a location
. description moves it.
  $600F,$05 Write #N$17 to #R$5B97.
  $6014,$05 Write #N$16 to #R$5B89.
  $6019,$03 Call #R$654B.
  $601C,$04 Write #N$00 to #R$5B8A.
  $6020,$03 Call #R$6618.
N $6023 Forget the verb, the noun and the three counters.
  $6023,$03 Point at the five command bytes at #R$5B7F.
  $6026,$02 Five bytes: the verb, the noun and the three counters.
N $6028 Clear the command bytes.
@ $6028 label=PrepareGame_ClearCommand
  $6028,$02 Write #N$00.
  $602A,$01 Advance.
  $602B,$02 Jump to #R$6028 until the five bytes are done.
  $602D,$04 Write #N$00 to #R$5B85.
N $6031 A new game starts in room 0 with empty flags, then the authored state is
. copied in.
  $6031,$03 Point at the state and flag area at #R$5D87.
  $6034,$02 #N$41 bytes, through the last flag.
N $6036 Clear the state and flags.
@ $6036 label=PrepareGame_ClearState
  $6036,$02 Write #N$00.
  $6038,$01 Advance.
  $6039,$02 Jump to #R$6036 until the state is cleared.
  $603B,$03 Point #REGhl at #R$B6A8.
  $603E,$03 Point #REGde at #R$5DCA.
  $6041,$03 #N$0100 bytes.
  $6044,$02 Copy them.
  $6046,$03 Point #REGhl at #R$6052.
  $6049,$03 Point #REGde at #R$5D88.
  $604C,$03 #N($0006,$04,$04) bytes.
  $604F,$02 Copy them.
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
N $6058 The loader subtracted 3 from the address written below, so the snapshot
. clears #R$5DCA(#N$5E05) rather than #R$5DCA(#N$5E08).
  $6058,$07 Object slot #N$3B must hold 'J' (#N$4A).
  $605F,$07 Object slot #N$3E must hold 'J' as well.
  $6066,$04 Clear slot #N$3B. A fresh game has #N$FC in slot #N($3E), so this
. does not fire.
N $606A Run the high-priority table.
@ $606A label=RunPriorityScripts_Run
  $606A,$03 Point at the high-priority table at #R$96D9.
  $606D,$05 Write #N$FF to #R$5B96.
  $6072,$02 Jump to #R$607B.

c $6074 Run Script Table
@ $6074 label=RunScripts
D $6074 Walks a bytecode table. A line whose verb and noun match is executed; a
. failed condition or a bit-6 action stops the line. #N$7F ends the table.
N $6074 The ordinary command scripts live at #R$9A54 and are marked by a clear
. script-set flag.
  $6074,$03 Point at the ordinary scripts at #R$9A54.
  $6077,$04 Write #N$00 to #R$5B96.
N $607B Walk one script line.
@ $607B label=RunScripts_Line
  $607B,$02 Keep the line pointer in #REGde while #REGhl walks it.
  $607D,$07 No line has matched yet, and no condition has failed.
N $6084 Test the verb and noun.
  $6084,$03 Call #R$6155.
  $6087,$02 Jump to #R$6090.
N $6089 This line failed.
@ $6089 label=RunScripts_Failed
  $6089,$04 Write #N$00 to #R$5ECA.
N $608D Skip the rest of this line.
  $608D,$03 Call #R$6141.
N $6090 Advance to the next line.
@ $6090 label=RunScripts_Next
  $6090,$03 Return at the #N$7F end marker.
  $6093,$04 Bit 7 on the current byte starts the actions.
N $6097 A condition byte, shifted, picks a routine from #R$67CB. The object byte
. in front of it is looked up in #R$5DCA.
@ $6097 label=RunScripts_Condition
  $6097,$01 Fetch the condition number.
  $6098,$02 Double it so it indexes a word.
  $609A,$04 Point #REGix at #R$67CB.
  $609E,$05 Index by the condition number.
  $60A3,$0C Plant that routine over the call at #R$60C1.
  $60AF,$01 Stash the line pointer on the stack.
  $60B0,$01 Advance to the object number.
  $60B1,$02 Fetch it into #REGc.
  $60B3,$04 Point #REGix at #R$5DCA.
  $60B7,$02 Add the object number.
  $60B9,$01 Keep the object number.
  $60BA,$04 Fetch that object's location into #REGc.
  $60BE,$01 Advance to the parameter.
  $60BF,$01 Fetch it.
  $60C0,$01 Stash #REGde on the stack.
  $60C1,$03 Call the planted condition routine.
  $60C4,$02 Restore #REGde and #REGhl from the stack.
  $60C6,$03 Call #R$612B.
  $60C9,$06 A failure skips the rest of this line.
  $60CF,$04 Otherwise keep testing while bit 7 is clear.
N $60D3 The line matched. Remember that, and perform each action until one asks
. to stop.
@ $60D3 label=RunScripts_Matched
  $60D3,$05 Write #N$01 to *#R$5B79.
N $60D8 Perform the next action.
@ $60D8 label=RunScripts_NextAction
  $60D8,$06 Jump to #R$60E2 if *#R$5B86 is zero.
  $60DE,$04 The first matched line of a command clears #R$5B86.
N $60E2 Decode this action.
@ $60E2 label=RunScripts_Action
  $60E2,$04 Jump to #R$60EB if bit 6 is clear.
  $60E6,$05 Write #N$01 to #R$5ECA.
N $60EB Call the action.
@ $60EB label=RunScripts_Do
  $60EB,$01 Fetch the action byte.
  $60EC,$02,b$01 Keep only bits 0-5.
  $60EE,$02 Double the action number.
  $60F0,$04 Point #REGix at the word inside #R$6AD4. Action 0 is the
. beeper operand, and the routines start at #R$6AD7.
  $60F4,$05 Index by the action number.
  $60F9,$0C Plant that routine over the call at #R$6117.
  $6105,$01 Stash the line pointer on the stack.
  $6106,$01 Advance to the object number.
  $6107,$01 Fetch it.
  $6108,$04 Point #REGix at #R$5DCA.
  $610C,$01 Copy the object number into #REGc.
  $610D,$02 Add it.
  $610F,$01 Keep the object number.
  $6110,$04 Fetch that object's location into #REGc.
  $6114,$01 Advance to the parameter.
  $6115,$01 Fetch it.
  $6116,$01 Stash #REGde on the stack.
  $6117,$03 Call the patched action.
  $611A,$02 Restore the line pointer and the table pointer.
  $611C,$03 Call #R$6133.
  $611F,$05 Stop the table when the action raised #R$5ECA.
  $6124,$04 Bit 7 continues this line's next action.
N $6128 Start the next line.
  $6128,$03 Jump to #R$6089.

c $612B Step Past Condition
@ $612B label=SkipCondition
D $612B Moves HL past a condition and its parameter. Condition numbers below
. #N$15 have no extra object byte.
  $612B,$01 Fetch the condition number.
  $612C,$02 Step past the condition and its object byte.
  $612E,$03 Return if the condition number is below #N$15.
  $6131,$01 Step past the parameter byte.
  $6132,$01 Return.

c $6133 Step Past Action
@ $6133 label=SkipAction
D $6133 Moves HL past an action. Actions #N$09 to #N$15 carry one extra byte,
. and higher actions carry two.
  $6133,$01 Fetch the action byte.
  $6134,$02,b$01 Keep only bits 0-5.
  $6136,$01 Step past the action.
  $6137,$03 Return if the action number is below #N$09.
  $613A,$04 Actions #N$09 to #N$15 carry one extra byte.
  $613E,$01 Higher actions carry a second extra byte.
N $613F Step past the last parameter.
@ $613F label=SkipAction_One
  $613F,$01 Step past the last parameter byte.
  $6140,$01 Return.

c $6141 Skip Failed Line
@ $6141 label=SkipLine
D $6141 Drops the remaining conditions and actions of a line that has already
. failed.
E $6141 Continue on to #R$6155.
  $6141,$02 Copy the saved line pointer into #REGhl (using the stack).
N $6143 Skip remaining conditions.
@ $6143 label=SkipLine_Conditions
  $6143,$04 Bit 7 ends the conditions.
N $6147 Skip one condition.
@ $6147 label=SkipLine_Condition
  $6147,$03 Call #R$612B.
  $614A,$04 Keep going while bit 7 is clear.
N $614E Skip remaining actions.
@ $614E label=SkipLine_Action
  $614E,$03 Call #R$6133.
  $6151,$04 Keep going while bit 7 is set.

c $6155 Match Verb And Noun
@ $6155 label=MatchCommand
D $6155 Accepts a script line whose verb and noun match the command. #N$7E
. matches any word. The high-priority table matches every line.
R $6155 O:HL Zero at the end of the table, otherwise the first condition or action
  $6155,$05 The end marker #N$7F is not a verb.
  $615A,$03 It returns a zero pointer.
  $615D,$01 Return.
N $615E Test the verb.
@ $615E label=MatchCommand_Verb
  $615E,$06 The high-priority table matches every line.
  $6164,$05 A verb of #N$7E matches any command.
  $6169,$06 Otherwise the verb must be the one just typed.
  $616F,$01 Advance to the noun.
  $6170,$02 Jump to #R$6182.
N $6172 Test the noun.
@ $6172 label=MatchCommand_Noun
  $6172,$01 Advance to the noun.
  $6173,$05 Jump to #R$617E if the noun is #N$7E.
  $6178,$06 Otherwise the noun must be the one just typed.
N $617E The noun matched.
@ $617E label=MatchCommand_NounOk
  $617E,$01 The noun matched, so the line's tests follow.
N $617F This line is a hit.
@ $617F label=MatchCommand_Hit
  $617F,$02 Remember this line.
  $6181,$01 Return.
N $6182 This line missed.
@ $6182 label=MatchCommand_Miss
  $6182,$01 Advance past the noun.
  $6183,$02 Jump to #R$6143.

g $6185 Picture Already Drawn
@ $6185 label=PictureDrawn
D $6185 The room whose illustration is already on screen. A different room is
. drawn.
  $6185,$01

g $6186 Pause At The Bottom
@ $6186 label=PauseFlag
D $6186 While a location is being described, reaching row #N$13 waits for a key
. and scrolls.
  $6186,$01

c $6187 Describe Location
@ $6187 label=DescribeLocation
D $6187 Prints where the player is, what is here, and which ways lead out. Bank
. 6 supplies the long text for rooms below #N($66), and it opens
. "#BANK6#MESSAGE($C000)#BANK0". A dark room says so and lists nothing. The
. text is underlined before the cursor is put back for the prompt.
N $6187 Remember the cursor, and choose a row. Pictures use row #N$0D so the
. text sits under the illustration.
  $6187,$05 The description pauses at the bottom of the picture.
  $618C,$05 A full stop makes the first letter a capital.
  $6191,$04 Stash the cursor on the stack.
  $6195,$04 Stash the print address on the stack.
N $6199 Clear the text rows.
  $6199,$03 Call #R$65ED.
  $619C,$04 Test whether pictures are on.
  $61A0,$05 Pictures on use row #N$0D.
N $61A5 Home the chosen row.
@ $61A5 label=DescribeLocation_Row
  $61A5,$03 Write it to *#R$5B89.
  $61A8,$03 Call #R$654B.
  $61AB,$04 Write #N$00 to #R$5B8A.
  $61AF,$06 Jump to #R$61BD if *#R$5D88 is zero.
N $61B5 Print "It is dark. You cannot see.".
  $61B5,$05 Print #R$7F2F using #R$63D4.
N $61BA Underline the description.
  $61BA,$03 Jump to #R$6262.
N $61BD Rooms under #N$66 with pictures switched off are read from bank 6. Every
. other room uses the tokenised text at #R$75CE.
@ $61BD label=DescribeLocation_Text
  $61BD,$03 The default text is the tokenised list at #R$75CE.
  $61C0,$07 Jump to #R$61DA if *#R$5D87 is at least #N$66.
  $61C7,$04 Test whether pictures are on.
  $61CB,$03 Fetch #R$5D87.
  $61CE,$02 Jump to #R$61DA if pictures are on.
N $61D0 Page in the long descriptions.
@ $61D0 label=DescribeLocation_Page
  $61D0,$01 Stash the room number on the stack.
  $61D1,$05 #PAGE$06.
  $61D6,$03 Point #REGhl at #R$C000@bank6.
  $61D9,$01 Restore the room number from the stack.
N $61DA Print this room's text.
@ $61DA label=DescribeLocation_Print
  $61DA,$03 Write it to *#R$5B8F.
  $61DD,$03 Call #R$629D.
  $61E0,$04 #PAGE$00.
  $61E4,$04 Write #N$00 to #R$5B7A.
  $61E8,$03 Point #REGhl at #R$5DCA.
  $61EB,$01 Start with a zero count.
N $61EC List every object whose location byte is this room. The first one is
. introduced with a colon.
@ $61EC label=DescribeLocation_Objects
  $61EC,$06 Jump to #R$6220 if it is not *#R$5D87.
  $61F2,$06 Jump to #R$6217 if *#R$5B7A is set.
  $61F8,$05 An index below #N$46 is named without the introduction.
N $61FD Print ". You can see".
  $61FD,$01 Print #R$7E26 using #R$63D4.
  $61FE,$05 Call #R$63D4.
  $6203,$05 Print a space.
  $6208,$05 Print a colon.
  $620D,$05 Print a dash.
  $6212,$05 Print a space.
N $6217 An object was listed.
@ $6217 label=DescribeLocation_Seen
  $6217,$05 Write #N$01 to *#R$5B7A.
N $621C Print this object's name.
@ $621C label=DescribeLocation_Name
  $621C,$04 Call #R$63D7.
N $6220 Step to the next object.
@ $6220 label=DescribeLocation_Next
  $6220,$06 Jump to #R$622A if #REGb equals *#R$5D8D.
  $6226,$02 The next location byte belongs to the next object.
  $6228,$02 Jump to #R$61EC.
N $622A After the objects, list the directions that leave this room.
@ $622A label=DescribeLocation_Exits
  $622A,$06 An empty list needs no tidy-up.
  $6230,$0A Two backspaces remove the comma after the last object.
N $623A List the ways out.
@ $623A label=DescribeLocation_Moves
  $623A,$03 Call #R$5FCE.
  $623D,$01 Advance to the first exit.
  $623E,$04 Jump to #R$6262 if bit 7 is set.
N $6242 Print ". You can go".
  $6242,$05 Print #R$7E91 using #R$63D4.
N $6247 Print one direction.
@ $6247 label=DescribeLocation_Exit
  $6247,$05 Bit 7 ends the list of directions.
  $624C,$03 Call #R$63D4.
  $624F,$02 Advance to the next exit.
  $6251,$02 Jump to #R$6247.
N $6253 Finish the exit list.
@ $6253 label=DescribeLocation_Stop
  $6253,$0A Rub out the last comma.
  $625D,$05 Finish with a full stop.
N $6262 Underline the description and restore the cursor the caller had saved.
@ $6262 label=DescribeLocation_Rule
  $6262,$04 The description is finished, so scrolling may resume.
  $6266,$05 Start the rule on a new line.
  $626B,$04 Test whether pictures are on.
  $626F,$03 Fetch #R$5B89.
  $6272,$02 Jump to #R$6282 if pictures are on.
  $6274,$05 Pictures off force row #N$0F.
  $6279,$04 Write #N$00 to #R$5B8A.
  $627D,$03 Call #R$654B.
  $6280,$02 Row #N($0F), ready for the rule.
N $6282 Draw the underline.
@ $6282 label=DescribeLocation_Bottom
  $6282,$04 The rule sits on the row under the text.
  $6286,$02 Forty-two underscores fill the row.
N $6288 Print the rule.
@ $6288 label=DescribeLocation_Bar
  $6288,$05 Print this underscore.
  $628D,$02 Jump to #R$6288 until the row is filled.
  $628F,$05 Close the rule with ENTER.
  $6294,$04 Restore the print address from the stack.
  $6298,$04 Restore the cursor from the stack.
  $629C,$01 Return.

c $629D Print Terminated Message
@ $629D label=PrintMessage
D $629D Prints message number #R$5B8F from the table at HL. Each message ends at
. #N$5E or #N$7E.
  $629D,$03 Call #R$62A2.
  $62A0,$01 Enable interrupts.
  $62A1,$01 Return.

c $62A2 Find And Print Message
@ $62A2 label=FindMessage
D $62A2 Skips earlier messages by counting #N$5E and #N$7E terminators, then
. expands each byte as a dictionary word.
  $62A2,$08 Point the next word at #R$5B60 (using the stack).
  $62AA,$04 Fetch #R$5B8F into #REGb.
  $62AE,$03 Jump to #R$62C1 if it is message 0.
  $62B1,$01 The scan starts on the byte before the message.
N $62B2 Skip earlier messages.
@ $62B2 label=FindMessage_Skip
  $62B2,$02 Advance to the next byte.
  $62B4,$04 Jump to #R$62BE if it is #N$5E.
  $62B8,$04 Jump to #R$62BE if it is #N$7E.
  $62BC,$02 Jump to #R$62B2.
N $62BE Count down to the chosen message.
@ $62BE label=FindMessage_Count
  $62BE,$02 Jump to #R$62B2 until this is the chosen message.
  $62C0,$01 Step onto the chosen message.
N $62C1 Expand this message byte.
@ $62C1 label=FindMessage_Byte
  $62C1,$01 Fetch this byte.
  $62C2,$03 Write #REGhl to *#R$5B90.
  $62C5,$03 Call #R$62D7.
  $62C8,$03 Fetch #R$5B9B.
  $62CB,$03 Return if it is #N$7E.
  $62CE,$03 #N$5E ends the message.
  $62D1,$03 Fetch #R$5B90.
  $62D4,$01 Advance it.
  $62D5,$02 Jump to #R$62C1.

c $62D7 Expand Dictionary Word
@ $62D7 label=ExpandToken
D $62D7 Treats A as an index into #R$B1BC. Word 0 is empty. Every other word
. ends with bit 7 set.
  $62D7,$03 Point #REGhl at #R$B1BC.
  $62DA,$01 Copy the token number into #REGb.
  $62DB,$03 Jump to #R$62E9 if it is token 0.
  $62DE,$01 The scan starts on the byte before the dictionary.
N $62DF Skip to the next word.
@ $62DF label=ExpandToken_Scan
  $62DF,$01 Advance to the next character.
  $62E0,$04 Jump to #R$62E6 if bit 7 is set.
  $62E4,$02 Jump to #R$62DF.
N $62E6 Count down to the requested word.
@ $62E6 label=ExpandToken_Next
  $62E6,$02 Count down to the requested word.
N $62E8 Step onto the first character.
@ $62E8 label=ExpandToken_Word
  $62E8,$01 Step onto its first character.
N $62E9 Print this dictionary character.
@ $62E9 label=ExpandToken_Character
  $62E9,$01 Fetch this character.
  $62EA,$03 Call #R$62F2.
  $62ED,$03 Return if bit 7 is set.
  $62F0,$02 Jump to #R$62E8.

c $62F2 Capitalise After A Full Stop
@ $62F2 label=Capitalise
D $62F2 After a full stop, a letter is forced to capitals. A space is handled by
. #R$6B2B so a terminator cannot split a word.
E $62F2 Continue on to #R$6319.
  $62F2,$01 Stash #REGbc on the stack.
  $62F3,$01 Copy the character into #REGb.
  $62F4,$07 A preceding full stop capitalises the next letter.
  $62FB,$01 The character is in #REGb.
  $62FC,$02,b$01 Keep only bits 0-6.
  $62FE,$04 Jump to #R$630D if it is below #N$40.
  $6302,$04 Jump to #R$630D if it is #N$5E.
  $6306,$04 Jump to #R$630D if it is #N$7E.
  $630A,$02 Clear bit 5 to make the letter a capital.
  $630C,$01 Copy it into #REGb.
N $630D Restore the character.
@ $630D label=Capitalise_Plain
  $630D,$01 Copy the character back into #REGa.
  $630E,$01 Restore #REGbc from the stack.
  $630F,$02,b$01 Keep only bits 0-6.
  $6311,$05 Jump to #R$6B2B if the character is a space.
  $6316,$03 Remember this character as the last one printed.

c $6319 Collect A Word
@ $6319 label=CollectWord
D $6319 Adds the character to the current word. A space, ENTER or a terminator
. flushes the word, wrapping when it would pass column #N$2B.
  $6319,$04 Stash the registers around the word buffer.
  $631D,$04 Store the character.
  $6321,$04 Advance the word pointer.
  $6325,$03 Point #REGhl at #R$5B98.
  $6328,$01 Count it.
  $6329,$04 Jump to #R$633C if it is a space.
  $632D,$04 Jump to #R$633C if it is ENTER.
  $6331,$04 Jump to #R$633C if it is #N$5E.
  $6335,$04 Jump to #R$633C if it is #N$7E.
  $6339,$03 Any other character returns.
N $633C Flush the buffered word.
@ $633C label=CollectWord_Flush
  $633C,$03 Point #REGhl at #R$5B98.
  $633F,$04 Jump to #R$634B if it is #N$5E.
  $6343,$04 Jump to #R$634B if it is #N$7E.
  $6347,$04 A space is not part of the width either.
N $634B Drop the terminator from the width.
@ $634B label=CollectWord_Drop
  $634B,$01 Drop that character from the count.
N $634C See whether the word fits.
@ $634C label=CollectWord_Width
  $634C,$01 Remember the character being flushed.
  $634D,$09 Call #R$6378 when *#R$5B8A plus the word would pass #N$2A.
  $6356,$01 Restore the character from the stack.
  $6357,$03 The buffered word starts at #R$5B60.
N $635A Print the flushed characters.
@ $635A label=CollectWord_Character
  $635A,$05 Jump to #R$6366 if it is not #N$7E.
  $635F,$05 Print a space.
  $6364,$02 Jump to #R$6388.
N $6366 Finish the message or keep printing.
@ $6366 label=CollectWord_End
  $6366,$04 #N$5E finishes the message.
  $636A,$04 Jump to #R$6385 if it is a space.
  $636E,$04 Jump to #R$6385 if it is ENTER.
  $6372,$03 Call #R$6394.
  $6375,$01 Advance to the next buffered character.
  $6376,$02 Jump to #R$635A.
N $6378 The word does not fit on this row.
@ $6378 label=WrapLine
  $6378,$05 Start a new line.
  $637D,$01 Return.
N $637E Start a new line, then reset the word.
@ $637E label=CollectWord_Newline
  $637E,$01 Stash the character on the stack.
  $637F,$03 Call #R$6378.
  $6382,$01 Restore the character from the stack.
  $6383,$02 Jump to #R$6388.
N $6385 A space or ENTER is printed before the reset.
@ $6385 label=CollectWord_Break
  $6385,$03 Call #R$6394.
N $6388 Reset the word buffer.
@ $6388 label=CollectWord_Reset
  $6388,$06 Point the next word back at #R$5B60.
  $638E,$04 Write #N$00 to #R$5B98.
  $6392,$02 Jump to #R$63CF.

c $6394 Print Character
@ $6394 label=PrintCharacter
D $6394 Plots A. A space that would sit on top of another space is rubbed out
. first. ENTER pads the row out to the margin.
  $6394,$04 Jump to #R$639B if this is not a space.
  $6398,$01 Stash the space on the stack.
  $6399,$02 Jump to #R$63A3.
N $639B Any other character, or a space that is not doubled.
@ $639B label=PrintCharacter_Other
  $639B,$01 Stash the character on the stack.
  $639C,$07 Jump to #R$63AF if *#R$5B8A is not #N$01.
N $63A3 Rub out a previous space.
@ $63A3 label=PrintCharacter_Rub
  $63A3,$07 Jump to #R$63AF if *#R$5B9C is not a space.
  $63AA,$05 Rub it out.
N $63AF Plot this character.
@ $63AF label=PrintCharacter_Keep
  $63AF,$04 Write it to *#R$5B9C.
  $63B3,$04 Stash the registers around the plot.
  $63B7,$04 Jump to #R$63CC if this is not ENTER.
  $63BB,$04 Copy *#R$5B8A into #REGb.
N $63BF Pad the row to the margin.
@ $63BF label=PrintCharacter_Pad
  $63BF,$01 One more column.
  $63C0,$05 Stop at column #N$2A.
  $63C5,$05 Print a pad space.
  $63CA,$02 Jump to #R$63BF.
N $63CC Plot any other character.
@ $63CC label=PrintCharacter_Plot
  $63CC,$03 Call #R$63FC.
N $63CF Restore the registers.
@ $63CF label=PrintCharacter_Done
  $63CF,$04 Restore the registers from the stack.
  $63D3,$01 Return.

c $63D4 Print System Message
@ $63D4 label=PrintSystemMessage
D $63D4 Prints system message A from #R$7E26. The messages are the game's stock
. replies: what you can see, what you are carrying, and why a command failed.
  $63D4,$03 Jump to #R$63E6 with the message number in #REGb.

c $63D7 Print Object Name
@ $63D7 label=PrintObjectName
D $63D7 Prints object text A from #R$8CE6, the phrases used when a location
. lists what is here.
  $63D7,$04 Stash the registers the printer will use.
  $63DB,$03 Write it to *#R$5B8F.
  $63DE,$03 Point #REGhl at #R$8CE6.
  $63E1,$03 Call #R$629D.
  $63E4,$02 Jump to #R$63CF to restore the registers and return.

c $63E6 Print Numbered Message
@ $63E6 label=PrintNumberedMessage
D $63E6 Prints message B from #R$7E26, forcing a capital at the start.
  $63E6,$04 Stash the registers the printer will use.
  $63EA,$05 A full stop makes the first letter a capital.
  $63EF,$04 #REGb is the system message number.
  $63F3,$03 Point #REGhl at #R$7E26.
  $63F6,$03 Call #R$629D.
  $63F9,$03 Jump to #R$63CF to restore the registers and return.

c $63FC Plot Character
@ $63FC label=PlotCharacter
D $63FC Puts A on the screen. #N$0C rubs out the previous character. #N$0D moves
. to the next row, pausing and scrolling when the text hits the bottom of the
. window.
N $63FC DELETE is printed as a space and then another DELETE, so the cursor
. steps back.
  $63FC,$04 Jump to #R$640A if this is not DELETE.
  $6400,$03 Call #R$640A.
  $6403,$05 Plot a space.
  $6408,$02 DELETE is the character that falls through.
N $640A Plot this byte, or handle ENTER and DELETE.
@ $640A label=PlotCharacter_Byte
  $640A,$04 Save the screen address and the character.
  $640E,$05 ENTER starts a new row.
  $6413,$04 Anything except DELETE is a glyph.
  $6417,$06 Jump to #R$642B if *#R$5B8A is not zero.
  $641D,$05 Write #N$29 to *#R$5B8A.
  $6422,$07 Decrement *#R$5B89.
  $6429,$02 Jump to #R$6436.
N $642B Step one column left.
@ $642B label=PlotCharacter_Back
  $642B,$04 Decrement *#R$5B8A.
  $642F,$02,b$01 Keep only bits 0-1.
  $6431,$05 Jump to #R$6546 if the column is #N$02.
N $6436 Move the pixel address back one byte.
@ $6436 label=PlotCharacter_Pixel
  $6436,$07 Decrement *#R$5B87.
  $643D,$03 Jump to #R$6546.
N $6440 ENTER on row #N$13 while a description is on screen waits for a key.
. Below the window, the text scrolls.
@ $6440 label=PlotCharacter_Newline
  $6440,$07 Jump to #R$645C if *#R$5B89 is not #N$13.
  $6447,$06 The pause only happens when #R$6186 is set.
  $644D,$05 The pause row's bottom is #N$0D.
  $6452,$03 Call #R$6884.
  $6455,$03 Call #R$655E.
  $6458,$04 Stay on row #N$13.
N $645C Rows below the pause line.
@ $645C label=PlotCharacter_Low
  $645C,$04 A row below #N$17 simply advances.
  $6460,$03 Call #R$655E.
  $6463,$02 Stay on row #N$17.
N $6465 Stay on this row.
@ $6465 label=PlotCharacter_Stay
  $6465,$03 Write the row to #R$5B89.
  $6468,$03 Call #R$654B.
  $646B,$04 Write #N$00 to #R$5B8A.
  $646F,$03 Jump to #R$6546.
N $6472 Advance one row.
@ $6472 label=PlotCharacter_Down
  $6472,$07 Increment *#R$5B89.
  $6479,$03 Call #R$654B.
  $647C,$04 Write #N$00 to #R$5B8A.
  $6480,$03 Jump to #R$6546.

c $6483 Plot Glyph
@ $6483 label=PlotGlyph
D $6483 Draws character A at the print position, using the ROM font. The eight
. bytes are shifted into whichever pixel column the cursor occupies inside its
. display byte, then ORed into the screen.
N $6483 The ROM character set lives at #SKOOLKID$3D00(CHARSET). Subtracting
. #N$0100 makes the character code times 8 land on its glyph.
  $6483,$04 Keep the screen address.
  $6487,$03 The font is #SKOOLKID$3D00(CHARSET) minus #N$0100.
  $648A,$03 Character A, widened.
  $648D,$03 Times eight.
  $6490,$01 Add the font base.
  $6491,$02 Stash the screen address and the glyph address on the stack.
  $6493,$03 Point #REGde at #R$6B23.
  $6496,$03 Eight bytes, with #REGc clear.
N $6499 Copy the glyph into the buffer.
@ $6499 label=PlotGlyph_Copy
  $6499,$02 Copy one byte of the glyph.
  $649B,$02 Step both pointers.
  $649D,$04 Jump to #R$64A3 if bit 1 is clear.
  $64A1,$02 Mark a descender.
N $64A3 The next glyph byte.
@ $64A3 label=PlotGlyph_Copied
  $64A3,$02 The next byte.
N $64A5 Tip the glyph so it sits in the right-hand pixels of its byte. A
. descender in the source sets the marker in #REGc.
@ $64A5 label=PlotGlyph_Align
  $64A5,$03 Point #REGde at #R$6B23.
  $64A8,$02 Eight glyph bytes.
N $64AA Shift one glyph row.
@ $64AA label=PlotGlyph_Row
  $64AA,$01 Fetch the glyph byte.
  $64AB,$01 Rotate it left.
  $64AC,$02 Jump to #R$64B0 if there is no carry.
  $64AE,$02,b$01 Set bit 7.
N $64B0 Merge the shifted nibbles.
@ $64B0 label=PlotGlyph_Nibble
  $64B0,$04 The descender marker shifts the glyph one place further.
  $64B4,$01 Copy the byte.
  $64B5,$02,b$01 Keep only bits 0-3.
  $64B7,$01 Store the low nibble.
  $64B8,$01 Fetch the saved byte.
  $64B9,$02,b$01 Keep only bits 4-7.
  $64BB,$03 Merge in the shifted low nibble.
N $64BE Store the aligned byte.
@ $64BE label=PlotGlyph_Mask
  $64BE,$02,b$01 Keep only bits 2-7.
  $64C0,$01 Store the aligned byte.
  $64C1,$01 Step on.
  $64C2,$02 Jump to #R$64AA until eight rows are done.
  $64C4,$02 Restore the glyph address and the screen address from the stack.
  $64C6,$03 Point #REGhl at #R$6B23.
  $64C9,$01 Swap the buffer into #REGde.
  $64CA,$01 Stash the screen address on the stack.
N $64CB The column within the byte chooses how the shifted glyph is merged with
. the pixels already there.
@ $64CB label=PlotGlyph_Column
  $64CB,$03 Fetch #R$5B8A.
  $64CE,$02,b$01 Keep only bits 0-1.
  $64D0,$03 Column 1 uses the two-pixel shift.
  $64D3,$03 Column 2 uses the four-pixel shift.
  $64D6,$03 Column 3 keeps the top two pixels.
  $64D9,$02 Column 0 copies eight fresh bytes.
N $64DB Copy eight unshifted bytes.
@ $64DB label=PlotGlyph_Byte0
  $64DB,$02 Copy one glyph byte.
  $64DD,$02 Step to the next pixel row.
  $64DF,$02 All eight bytes.
N $64E1 Advance the print address.
@ $64E1 label=PlotGlyph_Stored
  $64E1,$01 Restore the screen address from the stack.
  $64E2,$04 Move the print address on one byte.
  $64E6,$02 Jump to #R$6538 to advance the column.
N $64E8 Shift two pixels.
@ $64E8 label=PlotGlyph_Byte1
  $64E8,$02 Eight pixel rows.
N $64EA Merge a two-pixel shift.
@ $64EA label=PlotGlyph_Shift2
  $64EA,$01 Fetch the glyph byte.
  $64EB,$01 Step back to the previous screen byte.
  $64EC,$04 Make room for two pixels.
  $64F0,$08 Shift two pixels of the glyph in.
  $64F8,$02 Store the shifted byte.
  $64FA,$02 The next pixel row.
  $64FC,$02 All eight.
  $64FE,$02 Jump to #R$64E1.
N $6500 Shift four pixels.
@ $6500 label=PlotGlyph_Byte2
  $6500,$02 Eight pixel rows.
N $6502 Merge a four-pixel shift.
@ $6502 label=PlotGlyph_Shift4
  $6502,$01 Fetch the glyph byte.
  $6503,$01 Step back to the previous screen byte.
  $6504,$08 Make room for four pixels.
  $650C,$08 Shift the first two pixels in.
  $6514,$08 Shift the other two pixels in.
  $651C,$02 Store the shifted byte on this pixel row.
  $651E,$02 The next pixel row.
  $6520,$02 All eight.
  $6522,$01 Restore the screen address from the stack.
  $6523,$02 Jump to #R$6538.
N $6525 Keep the top two pixels.
@ $6525 label=PlotGlyph_Byte3
  $6525,$02 Eight pixel rows.
N $6527 Merge a six-pixel shift.
@ $6527 label=PlotGlyph_Top
  $6527,$04 Keep the top two pixels already on screen.
  $652B,$01 Fetch the glyph byte.
  $652C,$04 Shift it right by two.
  $6530,$02 #HTML(Merge the shifted glyph into the screen byte with
. <code>OR</code>.)
  $6532,$02 Step both pointers.
  $6534,$02 Jump to #R$6527 until eight pixel rows are done.
  $6536,$02 Jump to #R$64E1.
N $6538 The next character moves one column right. Column #N$29 is the margin,
. so the cursor wraps.
@ $6538 label=PlotGlyph_Advance
  $6538,$02 Keep the character on the stack.
  $653A,$03 Fetch #R$5B8A.
  $653D,$05 Column #N$29 wraps to the next row.
  $6542,$04 Otherwise the cursor moves one column right.
N $6546 Restore the registers.
@ $6546 label=PlotGlyph_Done
  $6546,$04 Restore the registers saved around the glyph from the stack.
  $654A,$01 Return.

c $654B Home Cursor On A Row
@ $654B label=HomeRow
D $654B Moves the cursor to the left of the row in #R$5B89.
  $654B,$03 Fetch #R$5B89.
  $654E,$03 Call #R$5F16.
  $6551,$04 Write #N$00 to #R$5B8A.
  $6555,$04 Store it in #R$5B87.
  $6559,$01 Return.

w $655A Key Repeat Timer
@ $655A label=RepeatTimer
D $655A How long to wait before scrolling, measured against the ROM frame
. counter. The cursor keys store #N($00), #N$0190 or #N$C8 here.
  $655A,$02 Delay.
N $655C Rows already scrolled.
@ $655C label=RowsScrolled
  $655C,$02 Rows already scrolled.

c $655E Scroll Text Window
@ $655E label=ScrollWindow
D $655E Moves every pixel row of the text window up by one character and clears
. the bottom row. During a description the picture is left where it is.
N $655E A short delay, taken from #R$655A, lets the player read before the next
. scroll.
  $655E,$04 Copy #R$5B97 into #REGb.
  $6562,$04 Blank lines left are #N$16 minus that row.
  $6566,$06 Fewer scrolls than blank lines means scroll now.
  $656C,$06 Otherwise copy the repeat delay into the frame counter,
. #SKOOLKID$5C78(FRAMES).
N $6572 Wait for a key or the delay.
@ $6572 label=ScrollWindow_Wait
  $6572,$07 A key releases the pause.
  $6579,$03 #HTML(Call the <code>RET</code> at the end of
. #SKOOLKID$0038(MASK_INT).)
  $657C,$06 Jump to #R$6572 until #SKOOLKID$5C78,$5C79(FRAMES) has moved.
N $6582 Scroll the window up one character.
@ $6582 label=ScrollWindow_Row
  $6582,$03 Point #REGhl at #R$655C.
  $6585,$01 Count this scroll.
  $6586,$03 Fetch #R$5B97.
N $6589 Copy one character row onto the row above.
@ $6589 label=ScrollWindow_Up
  $6589,$03 Call #R$5F16.
  $658C,$01 Keep this row.
  $658D,$01 The next character row.
  $658E,$03 Call #R$5F16.
  $6591,$02 That address is the destination.
  $6593,$02 Eight pixel rows.
N $6595 Copy eight pixel rows.
@ $6595 label=ScrollWindow_Pixels
  $6595,$03 Save the row pair.
  $6598,$05 Copy one pixel row, #N($0020,$04,$04) bytes.
  $659D,$03 Restore the row pair from the stack.
  $65A0,$02 The next pixel row.
  $65A2,$02 All eight pixel rows.
  $65A4,$04 Row #N$13 is the pause row.
  $65A8,$04 Row #N$17 is the bottom of the window.
  $65AC,$02 Otherwise the blank line is the bottom row.
N $65AE Blank the pause row during a description.
@ $65AE label=ScrollWindow_Pause
  $65AE,$01 Stash #REGaf on the stack.
  $65AF,$06 Jump to #R$65BB if a description is not in progress.
  $65B5,$01 Restore #REGaf from the stack.
  $65B6,$03 The blank line is at #N$5060 (screen buffer).
  $65B9,$02 Clear that line.
N $65BB Keep copying rows.
@ $65BB label=ScrollWindow_More
  $65BB,$01 Restore #REGaf from the stack.
  $65BC,$02 Jump to #R$6589.
N $65BE Blank the bottom of the window.
@ $65BE label=ScrollWindow_Bottom
  $65BE,$03 The ordinary blank line is at #N$50E0 (screen buffer).
N $65C1 Clear the vacated row.
@ $65C1 label=ScrollWindow_Clear
  $65C1,$02 Copy #REGhl to #REGde (using the stack).
  $65C3,$01 Advance the destination.
  $65C4,$02 Eight pixel rows.
N $65C6 Wipe eight pixel rows.
@ $65C6 label=ScrollWindow_Wipe
  $65C6,$03 Save the row.
  $65C9,$02 Write a zero.
  $65CB,$05 Copy it across the rest of the row.
  $65D0,$03 Restore the row from the stack.
  $65D3,$02 The next pixel row.
  $65D5,$02 All eight.
  $65D7,$06 A paused description leaves the cursor on the pause row.
  $65DD,$03 That row is #N$5060 (screen buffer).
  $65E0,$02 Home there.
N $65E2 Home the cursor after the scroll.
@ $65E2 label=ScrollWindow_Home
  $65E2,$03 Otherwise the cursor sits on #N$50E0 (screen buffer).
N $65E5 Store the print address.
@ $65E5 label=ScrollWindow_Cursor
  $65E5,$03 Write #REGhl to *#R$5B87.
  $65E8,$04 Write #N$00 to #R$5B8A.
  $65EC,$01 Return.

c $65ED Clear Rows Under Picture
@ $65ED label=ClearLowerRows
D $65ED Blanks the pixel rows down to the bottom of the text window. Pictures on
. start at row #N($0C), under the illustration. Pictures off start at row 0.
  $65ED,$06 Pictures off start clearing at row 0.
  $65F3,$02 Pictures on start at row #N$0C.
N $65F5 Pictures off wrap the start row.
@ $65F5 label=ClearLower_Adjust
  $65F5,$01 Pictures off arrive here with zero, so this wraps to #N$FF.
N $65F6 Blank one character row.
@ $65F6 label=ClearLower_Row
  $65F6,$01 The increment restores row 0, or restores #N$0C when pictures are
. on.
  $65F7,$03 Point #REGhl at #R$5B97.
  $65FA,$01 Fetch *#R$5B97 into #REGb.
  $65FB,$02 Return if this row has reached it.
  $65FD,$03 Call #R$5F16.
  $6600,$02 Copy #REGde to #REGhl (using the stack).
  $6602,$03 Eight pixel rows, filled from the next byte.
N $6605 Blank eight pixel rows.
@ $6605 label=ClearLower_Pixel
  $6605,$03 Save the row.
  $6608,$03 #N($001F,$04,$04) more bytes.
  $660B,$04 Write #N$00 across the rest of the row.
  $660F,$03 Restore the row from the stack.
  $6612,$02 The next pixel row.
  $6614,$02 All eight.
  $6616,$02 The next character row.

c $6618 Clear Screen
@ $6618 label=ClearScreen
D $6618 Blanks the display and paints the attributes white on black.
  $6618,$03 Point #REGhl at #N$4000 (screen buffer).
  $661B,$03 Point #REGde at the next byte.
  $661E,$03 #N$1800 pixel bytes.
  $6621,$04 Fill them with zero.
  $6625,$02 Paint this attribute #COLOUR$38.
  $6627,$05 Copy it across the block.
  $662C,$01 Return.

c $662D Wait For Key
@ $662D label=WaitForKey
D $662D Waits until the interrupt routine has seen a new key, ignores the
. characters the printer uses as terminators, and treats EDIT as the picture
. switch. The cursor keys change how long a scroll waits.
R $662D O:A The key, with letters as typed
N $662D #HTML(Bit 5 of #SKOOLKID$5C3B(FLAGS) is set by the maskable interrupt
. when a new key is ready. Calling the <code>RET</code> at the end of that
. routine lets one interrupt through.)
  $662D,$03 #HTML(Call the <code>RET</code> at the end of
. #SKOOLKID$0038(MASK_INT).)
  $6630,$04 Set bit 3 of #SKOOLKID$5C6A(FLAGS2) (CAPS LOCK).
  $6634,$06 Jump to #R$662D until bit 5 of #SKOOLKID$5C3B(FLAGS) is set.
  $663A,$04 Clear that bit for the next wait.
  $663E,$02 Read #REGr.
  $6640,$02,b$01 Keep only bits 0-2.
  $6642,$04 Write #REGr+#N$01 into the signature at #R$676E.
  $6646,$04 Point #REGix at #R$676E.
  $664A,$06 Plant that stirred byte over the next instruction.
  $6650,$06 Mix #REGr in again.
  $6656,$01 Stash #REGbc on the stack.
  $6657,$02 Five passes.
  $6659,$04 Save #REGde, #REGhl and #REGix.
  $665D,$05 Sound the key click with #REGa equal to #N$1E.
  $6662,$05 Restore the caller's registers from the stack.
N $6667 Cursor keys change the scroll delay.
@ $6667 label=WaitForKey_Cursor
  $6667,$03 #REGa is #SKOOLKID$5C08(LAST_K).
  $666A,$01 Stash #REGhl on the stack.
  $666B,$07 Cursor key #N$C7 stores no scroll delay.
  $6672,$07 Cursor key #N$C9 stores a long delay, #N$0190.
  $6679,$07 Cursor key #N$C8 stores a short delay, #N($00C8,$04,$04).
N $6680 Store the delay.
@ $6680 label=WaitForKey_Delay
  $6680,$03 Store the delay at #R$655A.
N $6683 Ignore printer terminators.
@ $6683 label=WaitForKey_Ignore
  $6683,$01 Restore the key from the stack.
  $6684,$04 Jump to #R$662D if it is #N$5E.
  $6688,$04 Jump to #R$662D if it is #N$5F.
  $668C,$04 Jump to #R$662D if it is #N$7F.
  $6690,$04 Jump to #R$662D if it is #N$7E.
N $6694 EDIT toggles the picture. The illustration attributes are cleared when
. pictures turn off, and the room is redrawn from bank 0.
@ $6694 label=WaitForKey_Pictures
  $6694,$03 EDIT is #N$0E. Any other key returns.
  $6697,$03 Stash the registers around the redraw.
  $669A,$03 Call #R$65ED.
  $669D,$03 Point #REGhl at #R$66D6.
  $66A0,$05 Call #R$66D8 if pictures are currently on.
  $66A5,$02,b$01 Flip bit 0.
  $66A7,$01 Write the new picture flag to *#R$66D6.
  $66A8,$04 #PAGE$00.
N $66AC Redraw the room.
  $66AC,$03 Call #R$6B43.
  $66AF,$05 Page RAM bank #N$03 back in.
  $66B4,$03 Restore the registers from the stack.
N $66B7 Read the next key.
  $66B7,$03 Jump to #R$662D.

c $66BA Remember Paged Bank
@ $66BA label=RememberBank
D $66BA Stores A in #R$66D7 and pages that RAM bank in.
E $66BA Continue on to #R$66BD.
  $66BA,$03 Write #REGa to #R$66D7.

c $66BD Page RAM Bank
@ $66BD label=PageBank
D $66BD Selects RAM bank #REGa at #N$C000 and forces the 48K ROM, which is the
. ROM this game's calls expect. #REGa is the bank in the low three bits. Callers
. pass 0, 3 or 6. Bank 7, which the loader paged with OUT 32765,23, is never
. requested again.
  $66BD,$01 Stash #REGbc on the stack.
  $66BE,$03 Point #REGbc at port #N$7FFD.
  $66C1,$02,b$01 Keep bit 4 set (48K ROM).
  $66C3,$02 Write the page to port #N$7FFD.
  $66C5,$01 Restore #REGbc from the stack.
  $66C6,$01 Return.

c $66C7 Read Command
@ $66C7 label=ReadCommand
D $66C7 Pages the parser in bank 3 over #N($C000), calls it, then pages bank 0
. back so the picture data is visible again.
  $66C7,$05 Call #R$66BA using #PAGE$03.
  $66CC,$03 Call #R$C000@bank3(ReadCommand).
  $66CF,$01 Stash #REGaf on the stack.
  $66D0,$04 Call #R$66BA using #PAGE$00.
  $66D4,$01 Restore #REGaf from the stack.
  $66D5,$01 Return.

g $66D6 Pictures On
@ $66D6 label=PicturesOn
D $66D6 Non-zero when illustrations are drawn. EDIT toggles it. It starts on.
  $66D6,$01

g $66D7 Bank Paged In
@ $66D7 label=PagedBank
D $66D7 The last value passed to #R$66BA. It starts at #N($10), so the resting
. window is bank 0 with the 48K ROM bit already set. #R$66BD sets that bit again
. before the port write.
  $66D7,$01

c $66D8 Clear Illustration Colours
@ $66D8 label=ClearPictureAttributes
D $66D8 Paints the top twelve character rows black ink on white paper, which is
. the area the illustration occupies.
  $66D8,$02 Stash #REGaf and #REGhl on the stack.
  $66DA,$03 Point #REGhl at #N$5800 (attribute buffer).
  $66DD,$03 #N$0180 bytes, the top twelve rows.
N $66E0 Paint one attribute byte.
@ $66E0 label=ClearPicture_Byte
  $66E0,$02 Paint one attribute #COLOUR$38.
  $66E2,$02 Step on.
  $66E4,$04 Continue until the block is done.
  $66E8,$02 Restore #REGhl and #REGaf from the stack.
  $66EA,$01 Return.

c $66EB Condition: Room Is Parameter
@ $66EB label=RoomIs
D $66EB Passes when the current room is the parameter in #REGb.
R $66EB B Room number
R $66EB O:F The zero flag is set when *#R$5D87 is the parameter
  $66EB,$06 Jump to #R$6753 to reject this bytecode condition
. when *#R$5D87 is not the parameter.
  $66F1,$01 Return.

c $66F2 Condition: Room Is Not Parameter
@ $66F2 label=RoomIsNot
D $66F2 Passes when the current room is not the parameter in #REGb.
R $66F2 B Room number
R $66F2 O:F The zero flag is unset on a pass return
  $66F2,$06 Jump to #R$6753 to reject this bytecode condition
. when *#R$5D87 is the parameter.
  $66F8,$01 Return.

c $66F9 Condition: Room Above Parameter
@ $66F9 label=RoomAbove
D $66F9 Passes when the current room is higher than the parameter in #REGb.
R $66F9 B Room number
R $66F9 O:F Carry and zero are unset on a pass return
  $66F9,$08 Jump to #R$6753 to reject this bytecode condition
. when *#R$5D87 is not above the parameter.
  $6701,$01 Return.

c $6702 Condition: Room Below Parameter
@ $6702 label=RoomBelow
D $6702 Passes when the current room is lower than the parameter in #REGb.
R $6702 B Room number
R $6702 O:F Carry is set when *#R$5D87 is below the parameter
  $6702,$06 Jump to #R$6753 to reject this bytecode condition
. when *#R$5D87 is not below the parameter.
  $6708,$01 Return.

c $6709 Condition: Carrying, Wearing Or Here
@ $6709 label=HoldingOrHere
D $6709 Passes when the object is carried, worn, or in this room.
R $6709 C Object location
R $6709 O:F The zero flag is set when the object is carried, worn or here
E $6709 Continue on to #R$6713.
  $6709,$05 Pass when it is *#R$5D89.
  $670E,$05 Pass when it is *#R$5D8A.

c $6713 Condition: Object Is Here
@ $6713 label=IsHere
D $6713 Loads *#R$5D87 and continues into #R$6716.
R $6713 C Object location
R $6713 O:F The zero flag is set when the object is *#R$5D87
E $6713 Continue on to #R$6716.
  $6713,$03 Fetch #R$5D87.

c $6716 Condition: Location Is Parameter
@ $6716 label=LocationIsParameter
D $6716 Passes when the object's location equals #REGa.
R $6716 A Location to match
R $6716 C Object location
R $6716 O:F The zero flag is set when the location equals #REGa
N $6716 Compare the object's location with #REGa.
  $6716,$03 Jump to #R$6753 to reject this bytecode condition
. when it is not #REGa.
  $6719,$01 Return.

c $671A Condition: Not Carrying, Wearing Or Here
@ $671A label=NotHoldingOrHere
D $671A Passes when the object is neither carried, nor worn, nor in this room.
R $671A C Object location
R $671A O:F The zero flag is unset on a pass return
E $671A Continue on to #R$6726.
  $671A,$06 Jump to #R$6753 to reject this bytecode condition
. when it is *#R$5D89.
  $6720,$06 Jump to #R$6753 to reject this bytecode condition
. when it is *#R$5D8A.

c $6726 Condition: Object Is Not Here
@ $6726 label=IsNotHere
D $6726 Passes when the object is not in this room.
R $6726 C Object location
R $6726 O:F The zero flag is unset on a pass return
  $6726,$06 Jump to #R$6753 to reject this bytecode condition
. when it is *#R$5D87.
  $672C,$01 Return.

c $672D Condition: Object Is Somewhere
@ $672D label=Somewhere
D $672D Passes when the object's location is not #N$FC.
R $672D C Object location
R $672D O:F The zero flag is unset on a pass return
  $672D,$06 Jump to #R$6753 to reject this bytecode condition.

c $6733 Condition: Object Is Nowhere
@ $6733 label=Nowhere
D $6733 Passes when the object's location is #N$FC.
R $6733 C Object location
R $6733 O:F The zero flag is set when the object is nowhere
  $6733,$06 Jump to #R$6753 to reject this bytecode condition.

c $6739 Condition: Object Is Carried
@ $6739 label=IsCarried
D $6739 Passes when the object is the one being carried.
R $6739 C Object location
R $6739 O:F The zero flag is set when the object is *#R$5D89
  $6739,$07 Jump to #R$6753 to reject this bytecode condition
. when it is not *#R$5D89.

c $6740 Condition: Object Is Worn
@ $6740 label=IsWorn
D $6740 Passes when the object is the one being worn.
R $6740 C Object location
R $6740 O:F The zero flag is set when the object is *#R$5D8A
  $6740,$07 Jump to #R$6753 to reject this bytecode condition
. when it is not *#R$5D8A.

c $6747 Condition: Object Is Not Worn
@ $6747 label=IsNotWorn
D $6747 Passes when the object is not being worn.
R $6747 C Object location
R $6747 O:F The zero flag is unset on a pass return
  $6747,$07 Jump to #R$6753 to reject this bytecode condition
. when it is *#R$5D8A.

c $674E Condition: Object Is Not Carried
@ $674E label=IsNotCarried
D $674E Passes when the object is not being carried.
R $674E C Object location
R $674E O:F The zero flag is unset on a pass return
E $674E Continue on to #R$6753.
  $674E,$05 Jump to #R$6753 to reject this bytecode condition
. when it is *#R$5D89.

c $6753 Condition: Reject
@ $6753 label=RejectCondition
D $6753 Marks the current script line as failed so its actions are not
. performed.
  $6753,$05 Write #N$01 to *#R$5ECA.
  $6758,$01 Return.

c $6759 Condition: Counter #N$01 Equals Parameter
@ $6759 label=Counter1Is
D $6759 Passes when #R$5B81 equals the parameter.
R $6759 B Value
R $6759 O:F The zero flag is set when *#R$5B81 is the parameter
  $6759,$07 Jump to #R$6753 to reject this bytecode condition
. when *#R$5B81 is not the parameter.

c $6760 Condition: Counter #N$02 Equals Parameter
@ $6760 label=Counter2Is
D $6760 Passes when #R$5B82 equals the parameter.
R $6760 B Value
R $6760 O:F The zero flag is set when *#R$5B82 is the parameter
  $6760,$07 Jump to #R$6753 to reject this bytecode condition
. when *#R$5B82 is not the parameter.

c $6767 Condition: Counter #N$03 Equals Parameter
@ $6767 label=Counter3Is
D $6767 Passes when #R$5B83 equals the parameter.
R $6767 B Value
R $6767 O:F The zero flag is set when *#R$5B83 is the parameter
  $6767,$07 Jump to #R$6753 to reject this bytecode condition
. when *#R$5B83 is not the parameter.

t $676E Adventure Signature
@ $676E label=Signature
D $676E The bytes spell ADVENTURE. The key routine and the random condition
. overwrite them and use the first byte as scratch.
  $676E,$09

c $6777 Condition: Random
@ $6777 label=RandomTest
D $6777 Passes when a value stirred from the frame counter and the signature
. comes out below the parameter.
R $6777 B Threshold
R $6777 O:F Carry is set when the stirred value is below the parameter
  $6777,$06 Plant the signature over the address read next.
  $677D,$04 Point #REGix at #R$676E.
  $6781,$03 Fetch the stirred byte.
  $6784,$03 Widen the stirred byte.
  $6787,$02 Times four.
  $6789,$01 Stash that product on the stack.
  $678A,$03 Shift further.
  $678D,$01 Stash that product on the stack.
  $678E,$01 Double once more.
  $678F,$01 Restore the first product from the stack.
  $6790,$03 Add both saved products. The mix is the byte times #N$64.
  $6793,$03 Fetch #SKOOLKID$5C78(FRAMES).
  $6796,$02,b$01 Keep only bits 0-2.
  $6798,$04 Write that value plus #N$01 into the signature at #R$676E.
  $679C,$04 Jump to #R$6753 to reject this bytecode condition.
  $67A0,$01 Return.

c $67A1 Condition: Flag Is Zero
@ $67A1 label=FlagZero
D $67A1 Passes when the flag byte selected by the parameter is zero.
R $67A1 B Flag number
R $67A1 O:F The zero flag is set when the selected flag is zero
  $67A1,$03 Call #R$67FF.
  $67A4,$03 Return with pass when the flag is zero.
  $67A7,$02 Jump to #R$6753 to reject this bytecode condition.

c $67A9 Condition: Flag Is Not Zero
@ $67A9 label=FlagNotZero
D $67A9 Passes when the flag byte selected by the parameter is not zero.
R $67A9 B Flag number
R $67A9 O:F The zero flag is unset on a pass return
  $67A9,$03 Call #R$67FF.
  $67AC,$03 Return with pass when the flag is not zero.
  $67AF,$02 Jump to #R$6753 to reject this bytecode condition.

c $67B1 Condition: Flag Equals Parameter
@ $67B1 label=FlagEquals
D $67B1 Passes when the selected flag equals #REGa.
R $67B1 A Value
R $67B1 B Flag number
R $67B1 O:F The zero flag is set when the selected flag equals #REGa
  $67B1,$03 Call #R$67FF.
  $67B4,$02 Return with pass when the selected flag equals #REGa.
  $67B6,$02 Jump to #R$6753 to reject this bytecode condition.

c $67B8 Condition: Flag Differs From Parameter
@ $67B8 label=FlagDiffers
D $67B8 Passes when the selected flag differs from #REGa.
R $67B8 A Value
R $67B8 B Flag number
R $67B8 O:F The zero flag is unset on a pass return
  $67B8,$03 Call #R$67FF.
  $67BB,$02 Return with pass when the selected flag differs from #REGa.
  $67BD,$02 Jump to #R$6753 to reject this bytecode condition.

c $67BF Condition: Flag Below Parameter
@ $67BF label=FlagBelow
D $67BF Passes when the selected flag is below #REGa.
R $67BF A Value
R $67BF B Flag number
R $67BF O:F Carry is set when the selected flag is below #REGa
  $67BF,$03 Call #R$67FF.
  $67C2,$02 Return with pass when the selected flag is below #REGa.
  $67C4,$02 Jump to #R$6753 to reject this bytecode condition.

c $67C6 Condition: Flag Not Below Parameter
@ $67C6 label=FlagNotBelow
D $67C6 Passes when the selected flag is not below #REGa. The failing jump at
. #R$67CB is also the first word of the condition table, so condition 0 does not
. have a routine of its own.
R $67C6 A Value
R $67C6 B Flag number
R $67C6 O:F Carry is unset when the selected flag is not below #REGa
  $67C6,$03 Call #R$67FF.
  $67C9,$02 Return with pass when the selected flag is not below #REGa.
  $67CB,$02 Jump to #R$6753 to reject this bytecode condition.

w $67CD Table: Condition Routines
@ $67CD label=ConditionTable
D $67CD One address per bytecode condition, after the dummy first word that
. overlaps #R$67CB. The runner shifts the condition number and reads the address
. from here.
N $67CD Condition #N($01+(#PC-$67CB)/$02).
  $67CD,$02 "#D(#PEEK(#PC)+$100*#PEEK(#PC+$01))".
L $67CD,$02,$19,$02

c $67FF Address Flag
@ $67FF label=FlagAddress
D $67FF Returns the address of flag byte #REGb. The flag bytes begin at the
. current room.
R $67FF B Flag number
R $67FF O:HL Flag byte #REGb
  $67FF,$03 Point #REGhl at #R$5D87.
N $6802 Add the flag number.
@ $6802 label=FlagAddress_Add
  $6802,$04 Add the parameter in #REGb.
  $6806,$01 Return.

c $6807 Address Object
@ $6807 label=ObjectAddress
D $6807 Returns the address of object #REGb's location byte.
R $6807 B Object number
R $6807 O:HL Location of object #REGb
  $6807,$03 Point #REGhl at #R$5DCA.
  $680A,$02 Jump to #R$6802.

c $680C Action: Inventory
@ $680C label=ListCarried
D $680C Prints message #N($10), you are carrying the following, then every
. carried or worn object. Nothing carried says so. A worn object is marked with
. message #N$1E.
N $680C Print "you are carrying the following:".
  $680C,$05 Print #R$7EB6 using #R$63D4.
  $6811,$04 Write #N$00 to #R$5B7A.
  $6815,$02 #N$A0 object slots.
  $6817,$03 Point #REGhl at #R$5DCA.
N $681A Scan the object locations.
@ $681A label=ListCarried_Scan
  $681A,$07 Call #R$6845 if it is *#R$5D89.
  $6821,$07 Call #R$6845 if it is *#R$5D8A.
  $6828,$01 The next object.
  $6829,$02 Jump to #R$681A until every slot is done.
  $682B,$06 Jump to #R$6836 if *#R$5B7A is set.
N $6831 Print "nothing at all.".
  $6831,$05 Print #R$7EC5 using #R$63D4.
N $6836 Finish the inventory list.
@ $6836 label=ListCarried_End
  $6836,$0A Two backspaces remove the trailing comma.
  $6840,$05 A full stop ends the list.
N $6845 Print one carried or worn object.
@ $6845 label=ListCarried_One
  $6845,$03 The object id is #N$A0 minus the countdown.
  $6848,$03 Call #R$63D7.
  $684B,$03 Write it to *#R$5B7A.
  $684E,$05 Return if it is not *#R$5D8A.
  $6853,$01 Stash the countdown on the stack.
N $6854 Print " (worn),".
  $6854,$05 Print #R$7F64 using #R$63D4.
  $6859,$01 Restore the countdown from the stack.
  $685A,$01 Return.

c $685B Action: Play Again
@ $685B label=OfferAnotherGame
D $685B Prints message #N($12), the game is over, and asks Y or N. Y starts
. again at #R$5ECB. N resets the machine.
N $685B Describe the ending.
  $685B,$03 Call #R$6187.
  $685E,$04 The picture may be drawn again.
  $6862,$03 Call #R$6B15.
N $6865 Print "game's now over. do you want to play again (Y/N) ?".
  $6865,$05 Print #R$7ECD using #R$63D4.
N $686A Wait for Y or N.
@ $686A label=OfferAnotherGame_Key
  $686A,$03 Call #R$6884.
  $686D,$04 N (#N$4E) resets the Spectrum.
  $6871,$04 Any key but Y (#N$59) asks again.
N $6875 Start another game.
  $6875,$03 Jump to #R$5ECB.

c $6878 Reset Machine
@ $6878 label=ResetMachine
D $6878 The answer N to 'play again' executes #SKOOLKID$0000(START),
. which restarts the Spectrum.
  $6878,$01 Jump to #SKOOLKID$0000(START).

c $6879 Action: Reject Line
@ $6879 label=RejectLine
D $6879 Sets the condition-failed flag so the runner stops this line. GET and
. DROP use it after explaining why they cannot.
  $6879,$05 Write #N$01 to *#R$5ECA.
  $687E,$01 Return.

c $687F Action: Press Any Key
@ $687F label=PressAnyKey
D $687F Prints message #N($14), press any key to continue, and waits until a key
. is down.
E $687F Continue on to #R$6884.
N $687F Print "press any key to continue.".
  $687F,$05 Print #R$7EEF using #R$63D4.

c $6884 Wait For Key Down
@ $6884 label=WaitKeyDown
D $6884 Spins while the second key slot of #SKOOLKID$5C00(KSTATE) is #N($FF),
. which is the value it holds when nothing is pressed.
R $6884 O:A The key state
  $6884,$03 Stash the registers around the wait.
N $6887 Spin until a key is down.
@ $6887 label=WaitKeyDown_Spin
  $6887,$07 Spin while the second key slot of #SKOOLKID$5C00(KSTATE) is #N$FF.
  $688E,$03 Restore the registers from the stack.
  $6891,$01 Return.

c $6892 Action: Move To Room
@ $6892 label=MoveToRoom
D $6892 Makes the parameter the current room and marks the room as changed.
R $6892 B Room number
  $6892,$04 Write #REGb to *#R$5D87.
  $6896,$03 Jump to #R$696C.

c $6899 Action: Wait
@ $6899 label=WaitAWhile
D $6899 Pauses for B times #N$32 halted frames.
R $6899 B Count
  $6899,$02 #N$32 frames, once for each count in #REGb.
N $689B Halt until this batch of frames is done.
@ $689B label=WaitAWhile_Frame
  $689B,$04 Halt for one frame.
  $689F,$02 Repeat for the count in #REGb.
  $68A1,$01 Return.

c $68A2 Action: Move To Object
@ $68A2 label=MoveToObject
D $68A2 Makes the object's location the current room.
R $68A2 B Object number
  $68A2,$03 Copy the object number into #REGbc.
  $68A5,$04 Point #REGhl at this object's location in #R$5DCA.
  $68A9,$04 Write it to *#R$5D87.
N $68AD Describe the new room.
  $68AD,$03 Jump to #R$696C.

c $68B0 Action: Get
@ $68B0 label=GetObject
D $68B0 Picks the object up. It must be in the room, not already carried, and
. not worn. The carried id is written into the object's own location slot and
. the carried count increases.
R $68B0 B Object number
R $68B0 C Object location
  $68B0,$06 Jump to #R$68C2 if it is not *#R$5D89.
N $68B6 Print "you already have it.".
  $68B6,$02 Print #R$7F00 using #R$63D4.
N $68B8 Print the refusal and reject the line.
@ $68B8 label=GetObject_Refuse
  $68B8,$03 Call #R$63D4.
  $68BB,$04 Write #N$00 to #R$5B85.
  $68BF,$03 Jump to #R$6879.
N $68C2 Already worn.
@ $68C2 label=GetObject_Worn
  $68C2,$06 Jump to #R$68CC if it is not *#R$5D8A.
N $68C8 Print "you are wearing it.".
  $68C8,$04 Print #R$7F5C using #R$63D4.
N $68CC Take it if it is here.
@ $68CC label=GetObject_Here
  $68CC,$06 Jump to #R$68D6 if it is *#R$5D87.
N $68D2 Print "sorry, I don't see it here.".
  $68D2,$04 Print #R$7F09 using #R$63D4.
N $68D6 Pick the object up.
@ $68D6 label=GetObject_Take
  $68D6,$03 Call #R$6807.
  $68D9,$04 Write *#R$5D89 into the object's location.
  $68DD,$04 Increment *#R$5D8C.
N $68E1 Describe the room again.
  $68E1,$03 Jump to #R$696C.

c $68E4 Action: Drop
@ $68E4 label=DropObject
D $68E4 Puts a carried or worn object down in the current room. Message #N$17
. says you don't have it.
R $68E4 B Object number
R $68E4 C Object location
  $68E4,$06 Jump to #R$68F8 if it is *#R$5D8A.
  $68EA,$06 Jump to #R$68F4 if it is *#R$5D89.
N $68F0 Print "you don't have it.".
  $68F0,$04 Print #R$7F1B using #R$63D4.
N $68F4 Count one fewer carried object.
@ $68F4 label=DropObject_Count
  $68F4,$04 Decrement *#R$5D8C.
N $68F8 Put the object in this room.
@ $68F8 label=DropObject_Put
  $68F8,$03 Call #R$6807.
  $68FB,$04 Write *#R$5D87 into its location.
N $68FF Describe the room again.
  $68FF,$03 Jump to #R$696C.

c $6902 Action: Save
@ $6902 label=SaveGame
D $6902 Asks for a key, then writes #N$0141 bytes from the room state as a SAVE
. block named with marker #N$2A. The ROM returns to #R$6914.
  $6902,$03 Call #R$687F.
  $6905,$04 Point #REGix at the state.
  $6909,$03 #N$0141 bytes.
  $690C,$03 The return address is #R$6914.
  $690F,$02 Marker #N($2A).
  $6911,$03 Jump into #SKOOLKID$04C2,$04C5(SA_BYTES) at #N$04C5.

c $6914 Return From Saving
@ $6914 label=Saved
D $6914 Comes back from the ROM save. The border is turned white, the break flag
. is cleared, and the picture is allowed to be drawn again.
  $6914,$04 Set the border to #INK$07.
  $6918,$04 Clear the break flag.
  $691C,$01 Enable interrupts.
  $691D,$04 Forget the drawn picture so it can be drawn again.
N $6921 Describe the room again.
  $6921,$03 Jump to #R$696C.

c $6924 Action: Restore
@ $6924 label=RestoreGame
D $6924 Asks message #N($1A), do you want to restore a saved game. N returns. Y
. loads #N$0141 bytes back over the room state and jumps into the ROM loader.
N $6924 Print "do you want to restore a saved game ?".
  $6924,$02 Print #R$7F3C using #R$63D4.
  $6926,$04 Store the pointer at #R$6A81.
  $692A,$03 Call #R$63D4.
N $692D Wait for Y or N.
@ $692D label=RestoreGame_Key
  $692D,$03 Call #R$6884.
  $6930,$04 N (#N$4E) leaves the saved game alone.
  $6934,$04 Anything except Y (#N$59) asks again.
N $6938 Load the saved state.
@ $6938 label=RestoreGame_Load
  $6938,$03 N returns without loading.
  $693B,$03 Point #REGhl at #R$6953.
  $693E,$04 Point #REGix at the state block.
  $6942,$03 #N$0141 bytes.
  $6945,$02 Marker #N($2A).
  $6947,$01 Set carry.
  $6948,$03 The border dance around the alternate accumulator.
  $694B,$01 Disable interrupts.
  $694C,$04 Border yellow.
  $6950,$03 Jump into #SKOOLKID$0556,$0561(LD_BYTES) at #N$0561.

c $6953 Return From Loading
@ $6953 label=Restored
D $6953 Comes back from the ROM loader. A failed load starts a new game; a
. successful one joins the save-return path.
  $6953,$01 Enable interrupts.
  $6954,$04 Set the border to #INK$07.
  $6958,$03 Jump to #R$5ECB when the load failed.
  $695B,$02 Jump to #R$6914.

c $695D Action: Remove Object
@ $695D label=RemoveObject
D $695D Puts the object nowhere by storing #N($FC), then marks the room changed.
R $695D B Object number
  $695D,$03 Call #R$6807.
  $6960,$03 Write #N($FC) to its location.
  $6963,$02 Jump to #R$696C.

c $6965 Action: Put Object Here
@ $6965 label=PutObjectHere
D $6965 Stores the current room as the object's location.
R $6965 B Object number
E $6965 Continue on to #R$696C.
  $6965,$03 Call #R$6807.
  $6968,$04 Write *#R$5D87 into its location.

c $696C Action: Room Changed
@ $696C label=RoomHasChanged
D $696C Sets the room-changed flag and walks the per-room records at #R$B798 so
. an illustration that depended on an object is redrawn. Verb #N($43), CAVE
. (#N$8A), LEVE (#N$8B), CURT (#N$85) and PIT (#N$8E) skip that walk.
  $696C,$05 The room has changed.
  $6971,$01 Stash the line pointer on the stack.
  $6972,$03 Fetch #R$5BCF.
  $6975,$14 Jump to #R$69B6 if the verb is #N($43), CAVE (#N$8A),
. LEVE (#N$8B), CURT (#N$85) or PIT (#N$8E).
  $6989,$01 Discard the saved line pointer.
  $698A,$03 Point #REGhl at #R$B798.
  $698D,$04 Fetch #R$5D87 into #REGb.
  $6991,$02 A record terminates with #N$FF.
N $6993 Skip bytes until the next terminator.
@ $6993 label=RoomHasChanged_Sep
  $6993,$04 Advance until this record ends.
  $6997,$02 Jump to #R$6993 until this is the current room's record.
N $6999 Walk this room's picture record.
@ $6999 label=RoomHasChanged_Record
  $6999,$01 Fetch the next record byte.
  $699A,$03 Return if it is the terminator #N$FF.
  $699D,$01 Advance to the opcode.
  $699E,$04 Jump to #R$6999 if it is not #N$F8.
  $69A2,$01 Stash the record pointer on the stack.
  $69A3,$06 Compare the record with #R$5F15.
  $69A9,$03 Copy the object number into #REGbc.
  $69AC,$03 Point #REGhl at #R$5DCA.
  $69AF,$01 Add the object number.
  $69B0,$06 Jump to #R$69BC if it is *#R$5D87.
N $69B6 Force the picture to be drawn again.
@ $69B6 label=RoomHasChanged_Redraw
  $69B6,$04 Write #N$00 to #R$6185.
  $69BA,$01 Restore the record pointer from the stack.
  $69BB,$01 Return.
N $69BC Keep scanning this record.
@ $69BC label=RoomHasChanged_Keep
  $69BC,$01 Restore the picture record pointer from the stack.
  $69BD,$02 Jump to #R$6999.

c $69BF Action: Swap Objects
@ $69BF label=SwapObjects
D $69BF Exchanges the locations of the object in the parameter and the object
. addressed by #REGa, then marks the room changed.
R $69BF A Second object
R $69BF B First object
R $69BF C First object location
N $69BF Address the first object.
  $69BF,$03 Call #R$6807.
  $69C2,$01 Stash that pointer on the stack.
  $69C3,$04 Point at the second object.
  $69C7,$04 Exchange the two location bytes.
  $69CB,$02 Jump to #R$696C.

c $69CD Action: Swap Flags
@ $69CD label=SwapFlags
D $69CD Exchanges flag #REGb with the flag addressed by #REGa.
R $69CD A Second flag
R $69CD B First flag
  $69CD,$03 Call #R$67FF.
  $69D0,$01 Stash that pointer on the stack.
  $69D1,$01 Keep the first flag's value.
  $69D2,$04 Point at the flag selected by #REGa.
  $69D6,$04 Exchange the two flag bytes.
  $69DA,$01 Return.

c $69DB Action: Set Flag On
@ $69DB label=SetFlagOn
D $69DB Writes #N$FF to flag #REGb.
R $69DB B Flag number
  $69DB,$03 Call #R$67FF.
  $69DE,$03 Write #N$FF there.
  $69E1,$01 Return.

c $69E2 Action: Clear Flag
@ $69E2 label=ClearFlag
D $69E2 Writes zero to flag #REGb.
R $69E2 B Flag number
  $69E2,$03 Call #R$67FF.
  $69E5,$02 Write #N$00 there.
  $69E7,$01 Return.

c $69E8 Action: Force Verb And Noun
@ $69E8 label=ForceCommand
D $69E8 Replaces the command with verb #REGb and noun #REGa, and forgets that a
. script line has already matched so the new command can be tried.
R $69E8 A Noun
R $69E8 B Verb
  $69E8,$03 Write #REGa to #R$5B80.
  $69EB,$04 Write #REGb to #R$5B7F.
  $69EF,$04 Forget that a script line has already matched, so the new command
. can be tried.
  $69F3,$01 Return.

c $69F4 Action: Add To Flag
@ $69F4 label=AddToFlag
D $69F4 Adds #REGa to flag #REGb, sticking at #N$FF instead of wrapping.
R $69F4 A Amount
R $69F4 B Flag number
  $69F4,$03 Call #R$67FF.
  $69F7,$01 Add the flag to #REGa.
  $69F8,$04 The sum sticks at #N$FF.
N $69FC Store the sum.
@ $69FC label=AddFlag_Store
  $69FC,$01 Store it.
  $69FD,$01 Return.

c $69FE Action: Subtract From Flag
@ $69FE label=SubtractFromFlag
D $69FE Subtracts #REGa from flag #REGb, sticking at #N$00 instead of wrapping.
R $69FE A Amount
R $69FE B Flag number
  $69FE,$03 Call #R$67FF.
  $6A01,$03 Write the amount to *#R$5B94.
  $6A04,$01 Fetch the flag.
  $6A05,$01 Stash the flag pointer on the stack.
  $6A06,$03 Point #REGhl at #R$5B94.
  $6A09,$02 Subtract the amount.
  $6A0B,$03 The difference sticks at #N$00.
N $6A0E Store the difference.
@ $6A0E label=SubtractFlag_Store
  $6A0E,$01 Restore the flag pointer from the stack.
  $6A0F,$01 Store it.
  $6A10,$01 Return.

c $6A11 Action: Set Flag
@ $6A11 label=SetFlag
D $6A11 Writes #REGa into flag #REGb.
R $6A11 A Value
R $6A11 B Flag number
  $6A11,$03 Call #R$67FF.
  $6A14,$01 Write #REGa there.
  $6A15,$01 Return.

c $6A16 Action: Set Object Location
@ $6A16 label=SetObjectLocation
D $6A16 Writes a new location for the object. A value of 1 for an object
. numbered #N$46 or higher is stored as zero. If the new location is the current
. room, the room is marked changed.
R $6A16 A New location
R $6A16 B Object number
  $6A16,$03 Call #R$6807.
  $6A19,$01 #REGc is the new location.
  $6A1A,$05 An index below #N$46 is stored as given.
  $6A1F,$05 Jump to #R$6A26 if the location is #N$01.
  $6A24,$02 Store #N$00 instead.
N $6A26 Write the new location.
@ $6A26 label=SetObject_Write
  $6A26,$01 Write the location.
N $6A27 Redraw if the object is here.
@ $6A27 label=SetObject_Here
  $6A27,$03 Point #REGhl at #R$5D87.
  $6A2A,$04 Jump to #R$696C if it is *#R$5D87.
  $6A2E,$01 Return.

c $6A2F Action: Copy Object Location
@ $6A2F label=CopyObjectLocation
D $6A2F Gives the object in #REGb the same location as the object addressed by
. #REGa.
R $6A2F A Source object
R $6A2F B Destination object
N $6A2F Address the destination object.
  $6A2F,$03 Call #R$6807.
  $6A32,$01 Stash the destination pointer on the stack.
  $6A33,$01 Copy the source object into #REGb.
N $6A34 Address the source object.
  $6A34,$03 Call #R$6807.
  $6A37,$01 Fetch its location.
  $6A38,$01 Restore the destination pointer from the stack.
  $6A39,$01 Copy that location onto object #REGb.
  $6A3A,$02 Jump to #R$6A27 so a copy into this room is described.

c $6A3C Action: Print Flag
@ $6A3C label=PrintFlag
D $6A3C #HTML(Prints flag #REGb as a decimal number followed by a space. The
. conversion goes through the <code>DAA</code> instruction, so the flag is
. treated as two decimal digits.)
R $6A3C B Flag number
  $6A3C,$03 Call #R$67FF.
  $6A3F,$04 Jump to #R$6A49 if the flag is zero.
  $6A43,$02 #HTML(Count that value through <code>DAA</code>.)
N $6A45 Count the flag into two decimal digits.
@ $6A45 label=PrintFlag_Tens
  $6A45,$04 #HTML(Each pass through <code>DAA</code> builds one decimal step.)
N $6A49 Print the tens digit when it is not zero.
@ $6A49 label=PrintFlag_High
  $6A49,$01 Stash the decimal byte on the stack.
  $6A4A,$03 Jump to #R$6A5A if the tens digit is zero.
  $6A4D,$08 Shift the tens digit down.
  $6A55,$02 Convert the tens digit to ASCII.
  $6A57,$03 Call #R$6394.
N $6A5A Print the units digit.
@ $6A5A label=PrintFlag_Units
  $6A5A,$01 Restore the decimal byte from the stack.
  $6A5B,$02,b$01 Keep only bits 0-3.
  $6A5D,$02 Convert the units digit to ASCII.
  $6A5F,$03 Call #R$6394.
  $6A62,$05 Print a following space.
  $6A67,$01 Return.

c $6A68 Action: Drop Everything
@ $6A68 label=DropEverything
D $6A68 Puts every object that is carried down in the current room and clears
. the carried count.
  $6A68,$02 Count #N$FE object slots.
  $6A6A,$03 Point #REGhl at #R$5DCA.
N $6A6D Drop one carried object into this room.
@ $6A6D label=DropEverything_One
  $6A6D,$06 Jump to #R$6A77 if it is not *#R$5D89.
  $6A73,$04 Write *#R$5D87 into its location.
N $6A77 Move on to the next object.
@ $6A77 label=DropEverything_Next
  $6A77,$01 The next object.
  $6A78,$02 Jump to #R$6A6D until every slot is done.
  $6A7A,$04 Write #N$00 to *#R$5D8C.
N $6A7E The carried objects are now in this room.
  $6A7E,$03 Jump to #R$696C.

g $6A81 Restore Pointer Scratch
@ $6A81 label=RestoreScratch
D $6A81 Two bytes overwritten when a restore is offered. They are not read back.
  $6A81,$02

c $6A83 Action: Wear
@ $6A83 label=WearObject
D $6A83 Wears the object. It must be carried and in this room, and it must not
. already be worn. The worn id replaces the object's location and the carried
. count drops.
R $6A83 B Object number
R $6A83 C Object location
  $6A83,$03 Call #R$6807.
  $6A86,$06 Jump to #R$6A91 if it is not *#R$5D8A.
N $6A8C Print "you are wearing it.".
  $6A8C,$05 Print #R$7F5C using #R$63D4.
N $6A91 Wear it if it is carried or here.
@ $6A91 label=WearObject_Held
  $6A91,$06 Jump to #R$6AA2 if it is *#R$5D89.
  $6A97,$06 Jump to #R$6AA8 if it is *#R$5D87.
N $6A9D Print "sorry, I don't see it here.".
  $6A9D,$05 Print #R$7F09 using #R$63D4.
N $6AA2 Count one fewer carried object.
@ $6AA2 label=WearObject_Count
  $6AA2,$01 Stash #REGhl on the stack.
  $6AA3,$04 Decrement *#R$5D8C.
  $6AA7,$01 Restore #REGhl from the stack.
N $6AA8 Mark the object as worn.
@ $6AA8 label=WearObject_Take
  $6AA8,$04 Write *#R$5D8A into the object's location.
  $6AAC,$01 Return.

c $6AAD Action: Take Object Off
@ $6AAD label=RemoveWorn
D $6AAD Stops wearing the object and carries it instead. Message #N$1C says you
. are not wearing it.
R $6AAD B Object number
R $6AAD C Object location
  $6AAD,$03 Call #R$6807.
  $6AB0,$06 Jump to #R$6ABB if it is *#R$5D8A.
N $6AB6 Print "you are not wearing it.".
  $6AB6,$05 Print #R$7F52 using #R$63D4.
N $6ABB The worn object is now carried.
@ $6ABB label=RemoveWorn_Do
  $6ABB,$04 Write *#R$5D89 into the object's location.
  $6ABF,$04 Increment *#R$5D8C.
  $6AC3,$01 Return.

c $6AC4 Action: Beep
@ $6AC4 label=Beep
D $6AC4 Turns #REGa and #REGb into a duration and a pitch and hands them to the
. ROM beeper. The key click uses #REGa equal to #N$1E. Action 0 of the bytecode
. jumps straight to the same ROM routine, whose address is the operand of the
. jump below.
R $6AC4 A Duration
R $6AC4 B Pitch
  $6AC4,$01 Carry is clear.
  $6AC5,$01 Put the duration in #REGl.
  $6AC6,$01 Copy the pitch into #REGa.
  $6AC7,$03 The high byte of the duration, and #REGd, start at zero.
  $6ACA,$04 Shift the pitch two places, keeping the overflow in #REGd.
  $6ACE,$02 Save that pitch.
  $6AD0,$03 Call #SKOOLKID$30A9(HL_HLxDE) to scale the duration by the pitch.
  $6AD3,$01 Restore the pitch for the beeper from the stack.
  $6AD4,$03 Jump to #SKOOLKID$03B5(BEEPER).

w $6AD7 Table: Action Routines
@ $6AD7 label=ActionTable
D $6AD7 One address per bytecode action, after action 0, which is the BEEPER
. entry embedded in #R$6AC4. The runner shifts the action number and calls the
. address.
N $6AD7 The actions are #FOR$6AD5,$6B13,$02||a|#N(#PEEK(a)+$100*#PEEK(a+$01))|,
. | and ||.
  $6AD7,$02 Action #N($01+(#PC-$6AD5)/$02) at
. #N(#PEEK(#PC)+$100*#PEEK(#PC+$01)).
L $6AD7,$02,$1F,$02

c $6B15 Draw Room Once
@ $6B15 label=DrawRoomOnce
D $6B15 Draws the illustration when the room on screen is not the current one,
. and remembers the room.
  $6B15,$03 Point #REGhl at #R$6185.
  $6B18,$03 Fetch #R$5D87.
  $6B1B,$01 Test the room on screen.
  $6B1C,$01 Disable interrupts.
  $6B1D,$01 Remember this room.
  $6B1E,$03 Call #R$6B4C if the room on screen was not this one.
  $6B21,$01 Allow interrupts again.
  $6B22,$01 Return.

b $6B23 Glyph Buffer
@ $6B23 label=GlyphBuffer
D $6B23 Eight bytes of the character currently being shifted onto the screen. It
. starts full of #N$FF.
  $6B23,$08

c $6B2B Finish Word On Terminator
@ $6B2B label=FinishWord
D $6B2B A space that follows a message terminator is forced, so the terminator
. itself is not printed in the middle of a word.
  $6B2B,$07 Jump to #R$6B39 if *#R$5B9B is #N$7E.
  $6B32,$07 Jump to #R$6319 with a space if *#R$5B9B is not #N$5E.
N $6B39 Collect a space after the terminator.
@ $6B39 label=FinishWord_Space
  $6B39,$05 Write #N$20 to *#R$5B9B.
  $6B3E,$03 Jump to #R$6319.

w $6B41 Error Stack
@ $6B41 label=ErrorStack
D $6B41 Stored in #SKOOLKID$5C3D(ERR_SP) when the game starts. A ROM error sets
. the stack to this word, whose value is the address of the glyph buffer.
  $6B41,$02

c $6B43 Action: Redraw
@ $6B43 label=RedrawLocation
D $6B43 Draws the picture, describes the room, and marks the room changed so the
. following turn keeps the description in step.
  $6B43,$03 Call #R$6B4C.
  $6B46,$03 Call #R$6187.
  $6B49,$03 Jump to #R$696C.

c $6B4C Draw Picture When Enabled
@ $6B4C label=DrawIfPictures
D $6B4C Returns immediately while pictures are switched off. Otherwise paints
. the illustration.
  $6B4C,$01 Stash #REGaf on the stack.
  $6B4D,$06 Jump to #R$6B55 if pictures are on.
  $6B53,$01 Restore #REGaf from the stack.
  $6B54,$01 Return.
N $6B55 Draw the illustration.
@ $6B55 label=DrawIfPictures_On
  $6B55,$01 Restore #REGaf from the stack.
  $6B56,$03 Jump to #R$6DFA.

u $6B59
C $6B59,$121

b $6C7A Illustration Attribute Buffer
@ $6C7A label=AttributeBuffer
D $6C7A The top twelve rows of attributes. The picture bytecode paints into this
. buffer and the result is copied to the screen.
  $6C7A,$180

c $6DFA Clear Illustration
@ $6DFA label=ClearIllustration
D $6DFA Blanks the illustration from pixel row #N$AF down to #N($50), lets the
. picture bytecode paint the saved attributes, then copies that buffer onto the
. screen.
N $6DFA Blank the illustration pixels, row by row, from row #N$AF down to
. row #N($50).
  $6DFA,$03 Pixel row #N($AF), column #N$00.
N $6DFD Blank one pixel row of #N($20) bytes.
@ $6DFD label=ClearIllustration_Row
  $6DFD,$01 Stash the row counter on the stack.
  $6DFE,$03 Call #SKOOLKID$22AA(PIXEL_ADD) for this row's screen address.
  $6E01,$02 Copy the screen address to #REGde (using the stack).
  $6E03,$01 Advance to the next byte.
  $6E04,$03 #N($001F,$04,$04) more bytes.
  $6E07,$04 Write #N$00 across the rest of the row.
  $6E0B,$01 Restore the row counter from the stack.
  $6E0C,$01 Count down one row.
  $6E0D,$05 Jump to #R$6DFD until row #N($50) has been cleared.
N $6E12 Clear the matching attribute rows, then copy them into the
. illustration buffer.
  $6E12,$03 Point #REGhl at #N$5800 (attribute buffer).
  $6E15,$03 Point #REGde at the next byte.
  $6E18,$03 #N($017F,$04,$04) more bytes.
  $6E1B,$04 Write #N$00 across the block.
  $6E1F,$0B Copy #N$0180 bytes from #N$5800 (attribute buffer) to #R$6C7A.
N $6E2A Paint the picture into the buffer.
  $6E2A,$03 Call #R$6E39.
N $6E2D Copy the painted attributes back onto the screen.
  $6E2D,$0B Copy #N$0180 bytes from #R$6C7A to #N$5800 (attribute buffer).
  $6E38,$01 Return.

c $6E39 Draw Room Picture
@ $6E39 label=DrawRoomPicture
D $6E39 Returns at once in the dark or in room 0. Otherwise finds this room's
. picture record and interprets it.
E $6E39 Continue on to #R$6E43.
  $6E39,$05 Return if *#R$5D88 is set.
  $6E3E,$05 Return if *#R$5D87 is #N$00.

c $6E43 Find Room Picture Record
@ $6E43 label=FindPictureRecord
D $6E43 Walks #R$B798, whose records are separated by #N($FF), until it reaches
. the current room. Rooms from #N$60 up run on into bank 0 at #R$C000.
R $6E43 A Room number
R $6E43 O:IX Picture record for that room
E $6E43 Continue on to #R$6E53.
  $6E43,$04 Point #REGix at #R$B798.
  $6E47,$01 Copy the room number into the counter.
  $6E48,$02 Load the record terminator.
N $6E4A Skip bytes until the next terminator.
@ $6E4A label=FindPictureRecord_Skip
  $6E4A,$07 Advance until this record ends.
  $6E51,$02 Jump to #R$6E4A until this is the wanted room.

c $6E53 Interpret Picture Record
@ $6E53 label=PictureRecord
D $6E53 Reads the next record byte. #N$FF ends it. #N$FE draws with a fixed
. shift, #N$FD changes one colour to another in the ink and paper, #N$FC
. paints a run of attributes, #N$FB brightens the picture, #N$FA draws a
. fixed vertical stroke, and #N$F9 draws another room's record. Any other
. byte goes to #R$6E7F.
  $6E53,$03 Fetch the next record byte.
N $6E56 Opcode #N$FF ends the record.
  $6E56,$02 Return if it is the terminator #N$FF.
N $6E58 Opcode #N$FE draws with the shift forced to #N$0C.
  $6E58,$04 Jump to #R$72C0 if it is #N$FE.
N $6E5C Opcode #N$FD changes one colour to another.
  $6E5C,$04 Jump to #R$6F2C if it is #N$FD.
N $6E60 Opcode #N$FC paints a run of attributes.
  $6E60,$04 Jump to #R$753E if it is #N$FC.
N $6E64 Opcode #N$FB sets bright on every attribute.
  $6E64,$04 Jump to #R$6F44 if it is #N$FB.
N $6E68 Opcode #N$FA draws a fixed vertical stroke.
  $6E68,$04 Jump to #R$751D if it is #N$FA.
N $6E6C Any other opcode except #N$F9 goes to #R$6E7F.
  $6E6C,$03 Jump to #R$6E7F if it is not #N$F9.
N $6E6F Opcode #N$F9 draws another room's picture record.
  $6E6F,$02 Advance the record pointer.
  $6E71,$03 Fetch the room number.
  $6E74,$02 Stash the record pointer on the stack.
  $6E76,$03 Call #R$6E43.
  $6E79,$02 Restore the record pointer from the stack.
  $6E7B,$02 Advance the record pointer.
  $6E7D,$02 Jump to #R$6E53.

c $6E7F Dispatch Picture Opcode
@ $6E7F label=DispatchShape
D $6E7F Opcodes #N$F8 to #N$EE jump to their own drawers. A smaller byte is a
. shape plotted by the routine below.
E $6E7F Continue on to #R$6EC1.
  $6E7F,$03 Fetch the opcode.
N $6E82 Opcode #N$F8 draws the following shape only when that object is here.
  $6E82,$05 Jump to #R$7213 if it is #N$F8.
N $6E87 Opcode #N$F7 draws with ink offset #N$0C.
  $6E87,$05 Jump to #R$73BE if it is #N$F7.
N $6E8C Opcode #N$F6 draws with ink offset #N$08.
  $6E8C,$05 Jump to #R$73D2 if it is #N$F6.
N $6E91 Opcode #N$F5 draws with ink offset #N$04.
  $6E91,$05 Jump to #R$73C8 if it is #N$F5.
N $6E96 Opcode #N$F4 continues the record only when that object is here.
  $6E96,$05 Jump to #R$73DC if it is #N$F4.
N $6E9B Opcode #N$F3 zeroes the origin and restores the default margins.
  $6E9B,$05 Jump to #R$738D if it is #N$F3.
N $6EA0 Opcode #N$F2 patches the shift and draws.
  $6EA0,$05 Jump to #R$72B5 if it is #N$F2.
N $6EA5 Opcode #N$F1 sets the origin and draws.
  $6EA5,$05 Jump to #R$7382 if it is #N$F1.
N $6EAA Opcode #N$F0 draws a horizontal run of pixels.
  $6EAA,$05 Jump to #R$7428 if it is #N$F0.
N $6EAF Opcode #N$EF draws a run shifted across the pixel columns.
  $6EAF,$05 Jump to #R$746E if it is #N$EF.
N $6EB4 Opcode #N$EE patches the vertical shift.
  $6EB4,$05 Jump to #R$7512 if it is #N$EE.
N $6EB9 A smaller byte is a shape, plotted below.
  $6EB9,$02 Compare with #N$EC.
  $6EBB,$01 Copy the opcode into #REGb.
  $6EBC,$01 Clear the suppress flag.
N $6EBD Store the suppress flag and plot the shape.
@ $6EBD label=DispatchShape_Flag
  $6EBD,$03 Write the suppress flag to #R$6EEE.
  $6EC0,$01 Restore the opcode.

c $6EC1 Plot Shape
@ $6EC1 label=PlotShape
D $6EC1 Clears the suppress flag, reads the shape's coordinates and paints it
. into the attribute buffer.
N $6EC1 Find the shape in the picture font.
  $6EC1,$03 Call #R$718B.
  $6EC4,$02 Advance the record pointer.
  $6EC6,$07 Read the X coordinate into #R$5BC1 and #REGc.
  $6ECD,$02 Advance the record pointer.
  $6ECF,$09 Read the Y coordinate into #R$5BC2 and #R$5BC3.
  $6ED8,$02 Advance the record pointer.
  $6EDA,$02 Stash the record pointer on the stack.
N $6EDC Address the destination byte.
  $6EDC,$03 Call #R$6F57.
  $6EDF,$07 Write #R$6C7A to #R$5BC9.
  $6EE6,$03 Call #R$710E.
  $6EE9,$02 Restore the record pointer from the stack.
  $6EEB,$03 Jump to #R$6E53.

g $6EEE Shape Suppressed
@ $6EEE label=ShapeSuppressed
D $6EEE Cleared before each shape is plotted. A later test uses it to skip a
. shape that should not be drawn.
  $6EEE,$01

c $6EEF Change Colour In Ink And Paper
@ $6EEF label=ChangeInkAndPaperColour
D $6EEF Changes colour #REGc to colour #REGl across the saved attribute buffer,
. first in the ink bits and then, with both colours moved up three bits, in the
. paper bits.
  $6EEF,$04 The ink mask is #N($07), keeping bits 3-7.
N $6EF3 Replace matching bits.
  $6EF3,$03 Call #R$6F0A.
N $6EF6 Move both colours into the paper bits.
  $6EF6,$08 Shift the source colour left by three.
  $6EFE,$08 Shift the destination colour left by three.
  $6F06,$04 Prepare the paper mask.
N $6F0A Walks the attribute buffer. Wherever the bits selected by #REGb equal
. #REGc, those bits are replaced with #REGl and the bits in #REGh are kept.
@ $6F0A label=ChangeMatchingColourBits
  $6F0A,$02 Stash #REGix on the stack.
  $6F0C,$04 Point #REGix at #R$6C7A.
  $6F10,$03 #N$0180 bytes.
N $6F13 Test this attribute byte.
@ $6F13 label=ChangeMatchingColourBits_Byte
  $6F13,$07 Jump to #R$6F22 if the selected bits are not #REGc.
  $6F1A,$08 Replace those bits with #REGl.
N $6F22 Advance through the buffer.
@ $6F22 label=ChangeMatchingColourBits_Next
  $6F22,$02 Advance the buffer pointer.
  $6F24,$05 Jump to #R$6F13 until the buffer is done.
  $6F29,$02 Restore #REGix from the stack.
  $6F2B,$01 Return.

c $6F2C Change Picture Colour
@ $6F2C label=ChangePictureColour
D $6F2C Used for picture record #N$FD. Reads two colours from the record and
. changes one colour to another in the ink and paper: every ink of the first
. colour across the picture becomes the second, and so does every paper.
  $6F2C,$02 Advance the record pointer.
  $6F2E,$03 Fetch the source colour.
  $6F31,$02,b$01 Keep only bits 0-2.
  $6F33,$01 That colour is #REGc.
  $6F34,$02 Advance the record pointer.
  $6F36,$03 Fetch the destination colour.
  $6F39,$02,b$01 Keep only bits 0-2.
  $6F3B,$01 That colour is #REGl.
N $6F3C Recolour the buffer.
  $6F3C,$03 Call #R$6EEF.
  $6F3F,$02 Advance the record pointer.
  $6F41,$03 Jump to #R$6E53.

c $6F44 Brighten Illustration
@ $6F44 label=BrightenAttributes
D $6F44 Sets the bright bit on every byte of the attribute buffer.
  $6F44,$03 Point #REGhl at #R$6C7A.
  $6F47,$03 #N$0180 bytes.
N $6F4A Set bright on each attribute byte.
@ $6F4A label=BrightenAttributes_Byte
  $6F4A,$02 Set the bright bit.
  $6F4C,$06 Jump to #R$6F4A until the buffer is done.
  $6F52,$02 Advance the record pointer.
  $6F54,$03 Jump to #R$6E53.

c $6F57 Address Picture Byte
@ $6F57 label=PictureAddress
D $6F57 Turns a character row into a pointer inside the attribute buffer, using
. the same row table as the text printer.
R $6F57 A Character row
R $6F57 HL Shape pointer
R $6F57 O:HL Shape pointer
E $6F57 Continue on to #R$6F6C.
  $6F57,$01 Stash #REGhl on the stack.
  $6F58,$03 Call #R$7532.
  $6F5B,$02 Add the picture origin.
  $6F5D,$03 Store the buffer address in #R$5BBA.
  $6F60,$01 Restore the shape pointer from the stack.
  $6F61,$04 Store the next shape pointer in #R$5BBC.
  $6F65,$07 Write #N$00 to #R$5BC8 and #R$5BC0.

c $6F6C Read Shape Byte
@ $6F6C label=ReadShapeByte
D $6F6C Fetches the next shape byte and remembers it for the shift that follows.
E $6F6C Continue on to #R$6FC9.
  $6F6C,$04 Write #N$00 to #R$5BBE.
  $6F70,$01 Fetch the next shape byte.
N $6F71 Marker #N$FB replaces this byte from the parameter block.
  $6F71,$05 Call #R$71EB if it is #N$FB.
N $6F76 Marker #N$EF stores a run count of #N$01.
  $6F76,$04 Jump to #R$6F7E if it is not #N$EF.
  $6F7A,$04 Use a run count of #N$01.
N $6F7E Marker #N$EE stores a run count of #N$02.
@ $6F7E label=ReadShapeByte_Marker
  $6F7E,$04 Jump to #R$6F86 if it is not #N$EE.
  $6F82,$04 Use a run count of #N$02.
N $6F86 Marker #N$EB stores a run count of #N$03.
@ $6F86 label=ReadShapeByte_Wide
  $6F86,$04 Jump to #R$6F8E if it is not #N$EB.
  $6F8A,$04 Use a run count of #N$03.
N $6F8E Marker #N$F3 takes the next byte as the run count.
@ $6F8E label=ReadShapeByte_Literal
  $6F8E,$04 Jump to #R$6FA5 if it is not #N$F3.
  $6F92,$02 Fetch the run count.
N $6F94 Store the run count and the default shift flags.
@ $6F94 label=ReadShapeByte_Store
  $6F94,$03 Store it in #R$5BC0.
  $6F97,$08 Write #N$82 to #R$5BBE and #R$5BBF.
  $6F9F,$03 Store #REGhl in #R$5BBC.
  $6FA2,$01 #REGa is clear.
  $6FA3,$02 Jump to #R$6FC9.
N $6FA5 Marker #N$FA copies a parameter block. Other markers adjust the
. coordinate that follows.
@ $6FA5 label=SpecialShape
  $6FA5,$04 Jump to #R$6FAE if it is not #N$FA.
N $6FA9 Copy the parameter block.
  $6FA9,$03 Call #R$71FF.
  $6FAC,$02 Jump to #R$6F6C.
N $6FAE Adjust the coordinate that follows.
@ $6FAE label=SpecialShape_Other
  $6FAE,$03 Store #REGhl in #R$5BBC.
  $6FB1,$04 Jump to #R$6FC9 if bit 7 is reset.
  $6FB5,$06 Copy the marker into #R$5BBE and #R$5BBF.
  $6FBB,$02,b$01 Keep only bit 1.
  $6FBD,$02 Jump to #R$6FC4 if bit 1 is reset.
  $6FBF,$02 Advance to the run count.
  $6FC1,$03 Store it in #R$5BC0.
N $6FC4 Step on to the coordinate.
@ $6FC4 label=SpecialShape_Advance
  $6FC4,$04 Advance #R$5BBC.
  $6FC8,$01 Fetch the coordinate.

c $6FC9 Scale Shape Coordinate
@ $6FC9 label=ScaleShape
D $6FC9 Multiplies the coordinate by eight and adds the picture origin.
  $6FC9,$03 Copy the coordinate into #REGhl.
  $6FCC,$03 Point #REGbc at #R$C350.
  $6FCF,$07 Jump to #R$6FDA if bit 0 of #R$5BBF is reset.
  $6FD6,$04 Add #N$0400 to the tile base.
N $6FDA Point at the tile bytes and choose a shift.
@ $6FDA label=ScaleShape_Offset
  $6FDA,$03 Multiply the coordinate by eight.
  $6FDD,$01 Add the tile base.
  $6FDE,$03 Point #REGix at those bytes (using the stack).
  $6FE1,$03 Point #REGhl at #R$5BB2.
  $6FE4,$02 Eight pixel rows.
  $6FE6,$03 Fetch #R$5BBE.
  $6FE9,$02,b$01 Keep only bits 4-5.
  $6FEB,$02 Jump to #R$6FF8 if a shift is needed.
N $6FED Copy eight unshifted bytes.
@ $6FED label=ScaleShape_Copy
  $6FED,$04 Copy one tile byte.
  $6FF1,$03 Step both pointers.
  $6FF4,$02 Jump to #R$6FED until eight bytes are copied.
  $6FF6,$02 Jump to #R$704A.
N $6FF8 Shift left when bits 4-5 are #N$10.
@ $6FF8 label=ScaleShape_Left
  $6FF8,$04 Jump to #R$7014 if the shift is not #N$10.
  $6FFC,$02 Eight passes.
N $6FFE One left-shift pass.
@ $6FFE label=ScaleShape_LeftPass
  $6FFE,$02 Eight bits.
  $7000,$03 Fetch this tile byte.
N $7003 Rotate one tile byte left into the workspace.
@ $7003 label=ScaleShape_LeftBit
  $7003,$04 Rotate this bit into the workspace.
  $7007,$01 Advance the workspace pointer.
  $7008,$02 Jump to #R$7003 until eight bits are done.
  $700A,$03 Point #REGhl at #R$5BB2.
  $700D,$02 Advance the tile pointer.
  $700F,$03 Jump to #R$6FFE until eight bytes have been shifted.
  $7012,$02 Jump to #R$704A.
N $7014 Shift right when bits 4-5 are #N$20.
@ $7014 label=ScaleShape_Right
  $7014,$04 Jump to #R$7030 if the shift is not #N$20.
  $7018,$02 Eight passes.
  $701A,$03 Point #REGhl at #R$5BB2(#N$5BB9).
N $701D One right-shift pass.
@ $701D label=ScaleShape_RightPass
  $701D,$02 Eight bits.
  $701F,$03 Fetch this tile byte.
N $7022 Rotate one tile byte left into the workspace, backwards.
@ $7022 label=ScaleShape_RightBit
  $7022,$06 Rotate this bit into the workspace.
  $7028,$03 Step both pointers.
  $702B,$03 Jump to #R$701D until eight bytes have been shifted.
  $702E,$02 Jump to #R$704A.
N $7030 Shift right when bits 4-5 are #N$30.
@ $7030 label=ScaleShape_Srl
  $7030,$04 Jump to #R$704A if the shift is not #N$30.
  $7034,$02 Eight passes.
N $7036 One logical-right pass.
@ $7036 label=ScaleShape_SrlPass
  $7036,$02 Eight bits.
  $7038,$03 Fetch this tile byte.
N $703B Rotate one tile byte right into the workspace.
@ $703B label=ScaleShape_SrlBit
  $703B,$04 Rotate this bit into the workspace.
  $703F,$01 Advance the workspace pointer.
  $7040,$02 Jump to #R$703B until eight bits are done.
  $7042,$03 Point #REGhl at #R$5BB2.
  $7045,$02 Advance the tile pointer.
  $7047,$03 Jump to #R$7036 until eight bytes have been shifted.
N $704A Optionally rotate the workspace once more.
@ $704A label=ScaleShape_Rotate
  $704A,$03 Fetch #R$5BBE.
  $704D,$02,b$01 Keep only bit 6.
  $704F,$03 Jump to #R$7064 if bit 6 is reset.
  $7052,$02 Eight passes.
  $7054,$03 Point #REGhl at #R$5BB2.
N $7057 One extra left-shift pass.
@ $7057 label=ScaleShape_RotatePass
  $7057,$03 Fetch eight bits of this workspace byte.
N $705A Rotate this workspace byte left.
@ $705A label=ScaleShape_RotateBit
  $705A,$06 Rotate this bit in place.
  $7060,$01 Advance the workspace pointer.
  $7061,$03 Jump to #R$7057 until eight bytes have been shifted.
N $7064 Combine the workspace with the destination.
@ $7064 label=ScaleShape_Combine
  $7064,$04 Point #REGde at #R$5BBA.
  $7068,$03 Point #REGhl at #R$5BB2.
  $706B,$02 Eight pixel rows.
N $706D Choose how this byte is merged.
@ $706D label=ScaleShape_Merge
  $706D,$07 Jump to #R$7078 if #R$5BC8 is not #N$04.
  $7074,$04 OR the workspace byte into the destination.
N $7078 AND when the combine mode is #N$08.
@ $7078 label=ScaleShape_And
  $7078,$04 Jump to #R$7080 if #R$5BC8 is not #N$08.
  $707C,$04 AND the workspace byte into the destination.
N $7080 XOR when the combine mode is #N$0C.
@ $7080 label=ScaleShape_Xor
  $7080,$04 Jump to #R$7088 if #R$5BC8 is not #N$0C.
  $7084,$04 XOR the workspace byte into the destination.
N $7088 Write the merged byte.
@ $7088 label=ScaleShape_Plain
  $7088,$01 Use the workspace byte as-is.
N $7089 Store this byte and step to the next pixel row.
@ $7089 label=ScaleShape_Write
  $7089,$02 Write the byte to the destination and the workspace.
  $708B,$02 Step both pointers.
  $708D,$02 Jump to #R$706D until eight rows are done.
  $708F,$03 Fetch #R$5BBE.
  $7092,$02,b$01 Keep only bits 2-3.
  $7094,$03 Store that in #R$5BC8.
  $7097,$02 Jump to #R$70BD if it is set.
N $7099 Repeat the copy for the remaining run count.
@ $7099 label=ScaleShape_Repeat
  $7099,$06 Jump to #R$70BA if #R$5BC0 has reached #N$00.
  $709F,$03 Call #R$70C7.
  $70A2,$02 Eight pixel rows.
  $70A4,$03 Point #REGhl at #R$5BB2.
  $70A7,$04 Point #REGde at #R$5BBA.
N $70AB Copy eight bytes to the destination.
@ $70AB label=ScaleShape_RepeatCopy
  $70AB,$02 Copy this byte.
  $70AD,$02 Step both pointers.
  $70AF,$02 Jump to #R$70AB until eight rows are done.
  $70B1,$07 Count down #R$5BC0.
  $70B8,$02 Jump to #R$7099 until the run is done.
N $70BA Step the destination on after the run.
@ $70BA label=ScaleShape_Step
  $70BA,$03 Call #R$70C7.
N $70BD Fetch the next shape byte.
@ $70BD label=ScaleShape_Next
  $70BD,$07 Advance #R$5BBC.
  $70C4,$03 Jump to #R$6F6C.
N $70C7 Step the destination to the next column, wrapping at the row width.
@ $70C7 label=ScaleShape_Column
  $70C7,$09 Advance #R$5BBA.
  $70D0,$03 Point #REGhl at #R$5BC6.
  $70D3,$02 Return if this row still has columns left.
  $70D5,$03 Point #REGhl at #R$5BC7.
  $70D8,$03 Jump to #R$70F6 if the remaining rows have run out.
  $70DB,$06 Copy #R$5BC4 into #R$5BC6.
  $70E1,$07 Step #R$5BC3.
N $70E8 Look up the new row.
  $70E8,$03 Call #R$7532.
  $70EB,$06 Copy #R$5BC1 into #REGhl.
  $70F1,$01 Add the destination.
  $70F2,$03 Store it in #R$5BBA.
  $70F5,$01 Return.
N $70F6 Abandon the rest of this shape.
@ $70F6 label=ScaleShape_Done
  $70F6,$01 Drop the return address.
  $70F7,$01 Return.
N $70F8 Paint onto the attribute file instead of the illustration buffer,
. then continue on to #R$710E.
@ $70F8 label=ScaleShape_Screen
  $70F8,$03 Call #R$718B.
  $70FB,$06 Copy #R$5BC1 into #REGbc.
  $7101,$03 Fetch #R$5BC2.
N $7104 Address the picture byte.
  $7104,$03 Call #R$6F57.
  $7107,$03 Point #REGde at #N$5800 (attribute buffer).
  $710A,$04 Store it in #R$5BC9.

c $710E Paint Shape Bytes
@ $710E label=PaintShape
D $710E Copies the expanded shape into the attribute buffer, honouring the #N$FE
. and #N$FB markers that end or repeat a run.
  $710E,$03 Fetch #R$5BBC.
  $7111,$01 Step to the first shape byte.
  $7112,$01 Stash that pointer on the stack.
  $7113,$06 Copy #R$5BC4 into #R$5BC6.
  $7119,$03 Fetch #R$5BC2.
  $711C,$02 Keep only the low byte.
  $711E,$03 Call #SKOOLKID$0E44,$0E93(CL_LINE).
  $7121,$06 Copy #R$5BC1 into #REGde.
  $7127,$01 Add the X coordinate.
  $7128,$04 Fetch #R$5BC9.
  $712C,$01 Add it.
  $712D,$01 Swap the destination into #REGde.
  $712E,$01 Restore the shape pointer from the stack.
N $712F Paint the next shape byte.
@ $712F label=PaintShape_Byte
  $712F,$01 Stash the shape pointer on the stack.
  $7130,$01 Fetch this shape byte.
  $7131,$04 Jump to #R$713C if it is not #N$FB.
  $7135,$01 Stash the destination on the stack.
N $7136 Fetch the parameter byte.
  $7136,$03 Call #R$71EB.
  $7139,$01 Restore the destination from the stack.
  $713A,$02 Replace the shape pointer (using the stack).
N $713C The terminator #N$FE ends the shape, and #N$FA copies a parameter
. block.
@ $713C label=PaintShape_Markers
  $713C,$04 Jump to #R$70F6 if it is the terminator #N$FE.
  $7140,$04 Jump to #R$714C if it is not #N$FA.
N $7144 Copy the parameter block.
  $7144,$05 Call #R$71FF.
  $7149,$01 Drop the old pointer.
  $714A,$02 Jump to #R$712F.
N $714C A run-length byte has bit 7 set.
@ $714C label=PaintShape_Run
  $714C,$04 Jump to #R$7159 if bit 7 is reset.
  $7150,$02,b$01 Keep only bits 0-6.
  $7152,$04 Store that in #R$5BC0.
  $7156,$03 Fetch #R$5BCB.
N $7159 Write this attribute byte.
@ $7159 label=PaintShape_Write
  $7159,$01 Write the byte.
  $715A,$03 Store it in #R$5BCB.
  $715D,$01 Advance the destination.
  $715E,$03 Point #REGhl at #R$5BC6.
  $7161,$03 Jump to #R$7175 if this row still has columns left.
  $7164,$01 Stash the column counter on the stack.
  $7165,$06 Copy #R$5BC4 into #R$5BC6.
  $716B,$05 #N$20 minus the columns used.
  $7170,$04 Add that gap to the destination.
  $7174,$01 Restore the column counter from the stack.
N $7175 Repeat the last byte for the remaining run count.
@ $7175 label=PaintShape_Repeat
  $7175,$06 Jump to #R$7184 if #R$5BC0 has reached #N$00.
  $717B,$04 Decrement #R$5BC0.
  $717F,$03 Fetch #R$5BCB.
  $7182,$02 Jump to #R$7159.
N $7184 Step on to the next shape byte.
@ $7184 label=PaintShape_Next
  $7184,$01 Restore the shape pointer from the stack.
  $7185,$01 Advance it.
  $7186,$02 Jump to #R$712F.

g $7188 Last Shape Number
@ $7188 label=LastShapeNumber
D $7188 The shape last looked up by #R$718B. It starts at #N$FF so the first
. search does not reuse a match.
  $7188,$01

g $7189 Last Shape Address
@ $7189 label=LastShapeAddress
D $7189 The picture-font pointer of that shape. The same number is served from
. here without walking the font again.
W $7189,$02

c $718B Find Shape In Picture Font
@ $718B label=FindShape
D $718B Looks the shape number up in the picture font that follows this routine
. and remembers its address.
  $718B,$03 Point #REGhl at #R$7188.
  $718E,$03 Jump to #R$7199 if this is not the last matched shape.
  $7191,$03 Reuse the last matched address.
  $7194,$03 Point #REGbc at this shape number.
  $7197,$02 Jump to #R$71AF.
N $7199 Walk the picture font from #R$C350(#N$C708).
@ $7199 label=FindShape_Search
  $7199,$03 Point at the picture font at #R$C350(#N$C708).
  $719C,$02 Copy the shape number into #REGbc.
  $719E,$03 Remember it at #R$7188.
  $71A1,$03 Jump to #R$71AF if the shape number is #N$00.
N $71A4 Skip to the next #N$FE terminator.
@ $71A4 label=FindShape_Skip
  $71A4,$02 Advance to the next byte.
  $71A6,$04 Jump to #R$71AC if it is the terminator #N$FE.
  $71AA,$02 Jump to #R$71A4.
N $71AC Count down through the remaining shapes.
@ $71AC label=FindShape_Count
  $71AC,$02 Jump to #R$71A4 until this shape is reached.
  $71AE,$01 Step to its first byte.
N $71AF Remember the match and decode its size.
@ $71AF label=FindShape_Size
  $71AF,$03 Store it in #R$7189.
  $71B2,$01 Fetch the header.
  $71B3,$01 Stash it on the stack.
  $71B4,$02,b$01 Keep only bits 4-7.
  $71B6,$04 Shift that width down.
  $71BA,$01 Add one.
  $71BB,$01 Stash the width on the stack.
N $71BC Some shape numbers are sixteen pixels wider.
  $71BC,$01 Fetch the shape number.
  $71BD,$14 Jump to #R$71D5 if it is #N($0D), #N($22), #N($6F),
. #N($0F) or #N$11.
  $71D1,$04 Jump to #R$71D9 if it is not #N$55.
N $71D5 Add sixteen to the width of those shapes.
@ $71D5 label=FindShape_Wide
  $71D5,$04 Add #N$10 to the width.
N $71D9 Store the width and height.
@ $71D9 label=FindShape_Store
  $71D9,$01 Restore the width from the stack.
  $71DA,$06 Store the width in #R$5BC4 and #R$5BC6.
  $71E0,$01 Restore the header from the stack.
  $71E1,$02,b$01 Keep only bits 0-3.
  $71E3,$01 Add one.
  $71E4,$06 Store the height in #R$5BC5 and #R$5BC7.
  $71EA,$01 Return.
N $71EB Fetch a byte from the parameter block, or the next shape byte.
@ $71EB label=FindShape_Param
  $71EB,$06 Jump to #R$71FA if #R$5B9E is #N$00.
  $71F1,$04 Count one fewer in #R$5B9E.
  $71F5,$03 Point #REGhl at #R$5B9F.
  $71F8,$01 Fetch that byte.
  $71F9,$01 Return.
N $71FA Fetch the next shape byte after the parameters.
@ $71FA label=FindShape_Stream
  $71FA,$03 Fetch #R$5BCC.
  $71FD,$01 Fetch that byte.
  $71FE,$01 Return.
N $71FF Copy a parameter block out of the shape stream.
@ $71FF label=FindShape_Copy
  $71FF,$01 Step to the length.
  $7200,$03 Fetch it into #REGbc.
  $7203,$03 Point #REGde at #R$5B9E.
  $7206,$01 Step past the length.
  $7207,$02 Copy those bytes.
  $7209,$03 Store #REGhl in #R$5BCC.
  $720C,$03 Point #REGhl at #R$5B9F.
  $720F,$03 Terminate that copy with #N$FB.
  $7212,$01 Return.

c $7213 Draw Shape When Object Is Here
@ $7213 label=ShapeIfPresent
D $7213 #HTML[Opcode #N$F8 names an object. The following shape is drawn only
. when that object is in the current room, and the object id is planted in the
. low address byte (#R$5F0F(#N$5F11)) of <code>LD (#R$5B85),#REGa</code> at
. #R$5F0F. When the object is absent that byte is cleared again.]
  $7213,$02 Advance the record pointer.
  $7215,$03 Fetch the object id.
  $7218,$03 Point #REGhl at #R$5DCA.
  $721B,$04 Index by the object number.
  $721F,$06 Jump to #R$7233 if it is not in *#R$5D87.
  $7225,$06 Plant the object id in #R$5F0F(#N$5F11).
  $722B,$02 Advance the record pointer.
  $722D,$03 Fetch the shape number.
  $7230,$03 Jump to #R$6EC1.
N $7233 Skip the shape when the object is elsewhere.
@ $7233 label=ShapeIfPresent_Skip
  $7233,$08 Step past the unused operands.
  $723B,$04 Write #N$00 to #R$5F0F(#N$5F11).
  $723F,$03 Jump to #R$6E53.

c $7242 Reverse Pixel Row
@ $7242 label=ShapeIfPresent_Mirror
D $7242 Reverses each pixel row of the current strip into the illustration.
  $7242,$01 Stash the row counter on the stack.
  $7243,$03 Call #R$73F1.
  $7246,$01 Stash the start of the row on the stack.
  $7247,$03 Load the patched width.
  $724A,$02 Eight pixel rows.
  $724C,$03 Point #REGde at the start and #REGhl at the far end.
N $724F Reverse one pixel row.
@ $724F label=ShapeIfPresent_MirrorRow
  $724F,$03 Stash the row pointers and the bit counter.
  $7252,$02 Copy #N$0100 bytes.
N $7254 Reverse one byte.
@ $7254 label=ShapeIfPresent_MirrorByte
  $7254,$01 Fetch the source byte.
  $7255,$02 Bit 7 of #REGc is set.
N $7257 Rotate its bits into #REGc.
@ $7257 label=ShapeIfPresent_MirrorBit
  $7257,$06 Jump to #R$7257 until the byte is reversed.
  $725D,$01 Write the reversed byte.
  $725E,$02 Step both pointers.
  $7260,$02 Jump to #R$7254 until the row is done.
  $7262,$03 Restore the bit counter and the row pointers.
  $7265,$02 Step both pointers.
  $7267,$02 Jump to #R$724F until eight pixel rows are done.
  $7269,$01 Restore the row counter from the stack.
  $726A,$06 Jump to #R$7242 until the patched row count is done.
  $7270,$01 Return.

c $7271 Reverse Attribute Row
@ $7271 label=ShapeIfPresent_Copy
D $7271 Copies a reversed attribute row into the illustration buffer.
  $7271,$01 Stash the row counter on the stack.
  $7272,$03 Call #R$738D.
  $7275,$03 Load the patched width.
  $7278,$04 Point #REGde at the start and #REGhl at the far end.
  $727C,$02 Copy #N$0100 bytes.
N $727E Copy one reversed byte.
@ $727E label=ShapeIfPresent_CopyByte
  $727E,$02 Copy this byte.
  $7280,$02 Step both pointers.
  $7282,$02 Jump to #R$727E until the row is done.
  $7284,$01 Restore the row counter from the stack.
  $7285,$06 Jump to #R$7271 until the patched row count is done.
  $728B,$01 Return.

c $728C Patch Shift Immediate
@ $728C label=PatchShift
D $728C Writes the next picture byte over the immediate of the shift that
. follows, so the shape can move by a fraction of a pixel.
  $728C,$09 Write the row count over both loop immediates.
  $7295,$03 Fetch the shift.
  $7298,$03 Fetch the Y coordinate.
  $729B,$03 Fetch the X coordinate.
N $729E Patch the offset immediates and draw both layers.
@ $729E label=PatchShift_Draw
  $729E,$06 Write the shift into both offset immediates.
  $72A4,$02 Halve the shift.
  $72A6,$06 Write it into both inner byte counts.
N $72AC Reverse the pixels.
  $72AC,$05 Call #R$7242.
N $72B1 Reverse the attributes.
  $72B1,$03 Call #R$7271.
  $72B4,$01 Return.

c $72B5 Draw With Patched Shift
@ $72B5 label=DrawPatched
D $72B5 Opcode #N$F2 patches the shift, draws, and steps the picture pointer on
. by five bytes.
  $72B5,$03 Call #R$728C.
  $72B8,$05 Step the record pointer on by five.
  $72BD,$03 Jump to #R$6E53.

c $72C0 Draw With Fixed Shift
@ $72C0 label=DrawFixedShift
D $72C0 Used for picture record #N$FE. The shift immediate is forced to #N$0C.
  $72C0,$08 Write #N$0C over the row-count immediates.
  $72C8,$02 Width #N$20.
  $72CA,$03 Offset #N($0000,$04,$04).
  $72CD,$03 Call #R$729E.
  $72D0,$02 Advance the record pointer.
  $72D2,$03 Jump to #R$6E53.

c $72D5 Copy Origin Attributes
@ $72D5 label=DrawFixedShift_Attrs
D $72D5 Copies one attribute strip from the source origin to the destination.
  $72D5,$04 Fetch the source origin.
  $72D9,$03 Call #R$738D.
  $72DC,$01 Stash the source pointer on the stack.
  $72DD,$04 Fetch the destination origin.
  $72E1,$03 Call #R$738D.
  $72E4,$01 Copy the source pointer into #REGde (using the stack).
  $72E5,$03 Load the patched width.
  $72E8,$01 Swap source and destination.
  $72E9,$02 Copy those bytes.
  $72EB,$07 Step the source Y coordinate.
  $72F2,$07 Decrement the remaining row count.
  $72F9,$04 Jump to #R$72D5 until it reaches #N$00.
  $72FD,$01 Return.

c $72FE Copy Origin Pixels
@ $72FE label=DrawFixedShift_Pixels
D $72FE Copies one pixel strip from the source origin to the destination.
  $72FE,$04 Fetch the source origin.
  $7302,$03 Call #R$73F1.
  $7305,$01 Stash the source pointer on the stack.
  $7306,$04 Fetch the destination origin.
  $730A,$03 Call #R$73F1.
  $730D,$01 Copy the source pointer into #REGde (using the stack).
  $730E,$04 Move the destination seven rows down.
  $7312,$02 Eight pixel rows.
  $7314,$01 Switch the destination into #REGde.
N $7315 Copy eight pixel rows.
@ $7315 label=DrawFixedShift_PixelRow
  $7315,$03 Stash the counters on the stack.
  $7318,$03 Load the patched width.
  $731B,$02 Copy those bytes.
  $731D,$03 Restore the counters from the stack.
  $7320,$02 Step both pointers.
  $7322,$02 Jump to #R$7315 until eight pixel rows are done.
  $7324,$07 Step the source Y coordinate.
  $732B,$07 Decrement the remaining row count.
  $7332,$04 Jump to #R$72FE until it reaches #N$00.
  $7336,$01 Return.

g $7337 Source Origin
@ $7337 label=SourceOrigin
D $7337 Column and row copied from by #R$72FE and #R$72D5.
  $7337,$01
N $7338 Source row.
@ $7338 label=SourceOrigin_Row
  $7338,$01

g $7339 Destination Origin
@ $7339 label=DestinationOrigin
D $7339 Column and remaining height written with the source origin.
  $7339,$01
N $733A Remaining height.
@ $733A label=DestinationOrigin_Height
  $733A,$01

c $733B Set Drawing Origin
@ $733B label=SetOrigin
D $733B Stores the next coordinates as the origin later shapes are drawn from.
  $733B,$09 Write the source X into both origin bytes.
  $7344,$06 Write the source Y.
  $734A,$06 Write the remaining height.
  $7350,$09 Write the width over both copy immediates.
  $7359,$06 Subtract the source Y from the destination Y.
  $735F,$02 Halve it.
N $7361 Patch the loop counts and copy from the origin.
@ $7361 label=SetOrigin_Copy
  $7361,$06 Write that half-height over both loop immediates.
  $7367,$04 Fetch the source origin.
  $736B,$04 Fetch the destination origin.
  $736F,$02 Stash #REGbc and #REGde on the stack.
N $7371 Copy the pixels.
  $7371,$03 Call #R$72FE.
  $7374,$02 Restore #REGde and #REGbc from the stack.
  $7376,$04 Store the source origin.
  $737A,$04 Store the destination origin.
N $737E Copy the attributes.
  $737E,$03 Call #R$72D5.
  $7381,$01 Return.

c $7382 Draw From Origin
@ $7382 label=DrawFromOrigin
D $7382 Opcode #N$F1 sets the origin, draws, and steps on by five bytes.
  $7382,$03 Call #R$733B.
  $7385,$05 Step the record pointer on by five.
  $738A,$03 Jump to #R$6E53.

c $738D Reset Drawing Origin
@ $738D label=ResetOrigin
D $738D Opcode #N$F3 zeroes the origin and restores the default margins.
  $738D,$0A Write #N$00 to the origin.
  $7397,$05 Write #N$0B as the remaining height.
  $739C,$08 Write #N$20 over both copy immediates.
  $73A4,$05 Call #R$7361 with half-height #N$05.
  $73A9,$02 Advance the record pointer.
  $73AB,$03 Jump to #R$6E53.
N $73AE Turns a character row in #REGb and a column in #REGc into a pointer
. inside #R$6C7A.
@ $73AE label=ResetOrigin_Address
  $73AE,$03 Copy the row into #REGhl.
  $73B1,$05 Multiply by #N($20).
  $73B6,$03 Point #REGde at #R$6C7A.
  $73B9,$01 Add that buffer.
  $73BA,$03 Add the column.
  $73BD,$01 Return.

c $73BE Draw Offset #N$0C
@ $73BE label=OpcodeF7
D $73BE Steps the picture pointer and draws with ink offset #N$0C.
  $73BE,$03 Fetch the following shape.
  $73C1,$02 Ink offset #N$0C.
  $73C3,$02 Advance the record pointer.
  $73C5,$03 Jump to #R$6EBD.

c $73C8 Draw Offset #N$04
@ $73C8 label=OpcodeF5
D $73C8 Steps the picture pointer and draws with ink offset #N$04.
  $73C8,$03 Fetch the following shape.
  $73CB,$02 Ink offset #N$04.
  $73CD,$02 Advance the record pointer.
  $73CF,$03 Jump to #R$6EBD.

c $73D2 Draw Offset #N$08
@ $73D2 label=OpcodeF6
D $73D2 Steps the picture pointer and draws with ink offset #N$08.
  $73D2,$03 Fetch the following shape.
  $73D5,$02 Ink offset #N$08.
  $73D7,$02 Advance the record pointer.
  $73D9,$03 Jump to #R$6EBD.

c $73DC Continue If Present
@ $73DC label=ShapeForObject
D $73DC Continues the picture record when the named object is in this room. If
. it is elsewhere, the rest of the picture is abandoned.
  $73DC,$03 Fetch the object number.
  $73DF,$03 Point #REGhl at #R$5DCA.
  $73E2,$03 Index by the object number.
  $73E5,$05 Return if it is not in *#R$5D87.
  $73EA,$04 Step past this opcode and the object.
  $73EE,$03 Jump to #R$6E53.

c $73F1 Address Pixel Row
@ $73F1 label=PixelRow
D $73F1 Turns a pixel row in #REGb into a display address via the character-row
. table.
R $73F1 B Pixel row
R $73F1 C Column
R $73F1 O:HL Display address
  $73F1,$04 Call #R$7532 with the pixel row.
  $73F5,$02 Copy the screen address to #REGhl (using the stack).
  $73F7,$03 Add the column.
  $73FA,$01 Return.

c $73FB Rotate Row Left
@ $73FB label=PixelRow_Left
D $73FB Rotates one character row left by one bit.
  $73FB,$02 Stash #REGbc and #REGhl on the stack.
  $73FD,$04 Add the patched width.
  $7401,$01 Copy the width into #REGb.
  $7402,$01 Point at the last byte.
  $7403,$02 Copy that address into #REGde (using the stack).
N $7405 Rotate this row left by one bit.
@ $7405 label=PixelRow_LeftBit
  $7405,$02 Rotate this byte left.
  $7407,$01 Step back one byte.
  $7408,$02 Jump to #R$7405 until the width is rotated.
  $740A,$07 Wrap the outgoing bit into bit 0.
  $7411,$02 Restore #REGhl and #REGbc from the stack.
  $7413,$01 Step to the next pixel row.
  $7414,$02 Jump to #R$73FB until eight pixel rows are done.
  $7416,$01 Return.

c $7417 Rotate Rows Left
@ $7417 label=PixelRow_LeftRun
D $7417 Rotates consecutive character rows left.
  $7417,$01 Stash the row counter on the stack.
  $7418,$03 Call #R$73F1.
  $741B,$05 Call #R$73FB with eight pixel rows.
  $7420,$01 Restore the row counter from the stack.
  $7421,$06 Jump to #R$7417 until the patched row count is done.
  $7427,$01 Return.

c $7428 Draw Horizontal Run
@ $7428 label=HorizontalRun
D $7428 Opcode #N$F0 draws a horizontal run of pixels, patching its own length
. and shift bytes, then steps on by five.
  $7428,$03 Fetch the column.
  $742B,$03 Fetch the row.
  $742E,$06 Write the row count over the loop immediate.
  $7434,$06 Write the width over the rotate immediate.
  $743A,$03 Call #R$7417.
  $743D,$05 Step the record pointer on by five.
  $7442,$03 Jump to #R$6E53.

c $7445 Rotate Row Right
@ $7445 label=HorizontalRun_Right
D $7445 Rotates one character row right by one bit.
  $7445,$02 Stash #REGbc and #REGhl on the stack.
  $7447,$02 Force a full-width rotate.
  $7449,$02 Copy #REGhl to #REGde (using the stack).
N $744B Rotate this row right by one bit.
@ $744B label=HorizontalRun_RightBit
  $744B,$02 Rotate this byte right.
  $744D,$01 Step on one byte.
  $744E,$02 Jump to #R$744B until the width is rotated.
  $7450,$07 Wrap the outgoing bit into bit 7.
  $7457,$02 Restore #REGhl and #REGbc from the stack.
  $7459,$01 Step to the next pixel row.
  $745A,$02 Jump to #R$7445 until eight pixel rows are done.
  $745C,$01 Return.

c $745D Rotate Rows Right
@ $745D label=HorizontalRun_RightRun
D $745D Rotates consecutive character rows right.
  $745D,$01 Stash the row counter on the stack.
  $745E,$03 Call #R$73F1.
  $7461,$05 Call #R$7445 with eight pixel rows.
  $7466,$01 Restore the row counter from the stack.
  $7467,$06 Jump to #R$745D until the patched row count is done.
  $746D,$01 Return.

c $746E Draw Shifted Run
@ $746E label=VerticalRun
D $746E Opcode #N$EF draws a run that is shifted across the pixel columns, using
. the same five-byte operand layout.
  $746E,$03 Fetch the column.
  $7471,$03 Fetch the row.
  $7474,$06 Write the row count over the loop immediate.
  $747A,$06 Write the width over the rotate immediate.
  $7480,$03 Call #R$745D.
  $7483,$05 Step the record pointer on by five.
  $7488,$03 Jump to #R$6E53.

c $748B Mirror Pixel Row
@ $748B label=VerticalRun_Mirror
D $748B Reverses a pixel row about its midpoint.
  $748B,$01 Stash the row counter on the stack.
  $748C,$03 Call #R$73F1.
  $748F,$01 Stash the start of the row on the stack.
  $7490,$03 Load the patched width.
  $7493,$02 Eight pixel rows.
  $7495,$03 Point #REGde at the start and #REGhl at the far end.
N $7498 Reverse eight bytes of this pixel row.
@ $7498 label=VerticalRun_MirrorRow
  $7498,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $749B,$02 Force a full-width reverse.
N $749D Reverse one pair of bytes.
@ $749D label=VerticalRun_MirrorByte
  $749D,$08 Reverse the bytes at both ends of the row.
  $74A5,$06 Swap those two bytes.
  $74AB,$02 Step both pointers.
  $74AD,$02 Jump to #R$749D until the row is done.
  $74AF,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $74B2,$02 Step both pointers.
  $74B4,$02 Jump to #R$7498 until eight pixel rows are done.
  $74B6,$01 Restore the row counter from the stack.
  $74B7,$06 Jump to #R$748B until the patched row count is done.
  $74BD,$01 Return.

c $74BE Mirror Attribute Row
@ $74BE label=VerticalRun_Copy
D $74BE Reverses an attribute row about its midpoint.
  $74BE,$01 Stash the row counter on the stack.
  $74BF,$03 Call #R$738D.
  $74C2,$03 Load the patched width.
  $74C5,$04 Point #REGde at the start and #REGhl at the far end.
  $74C9,$02 Copy #N$0100 bytes.
N $74CB Swap one reversed pair.
@ $74CB label=VerticalRun_CopyByte
  $74CB,$06 Swap this pair.
  $74D1,$02 Step both pointers.
  $74D3,$02 Jump to #R$74CB until the row is done.
  $74D5,$01 Restore the row counter from the stack.
  $74D6,$06 Jump to #R$74BE until the patched row count is done.
  $74DC,$01 Return.

c $74DD Reverse Byte Bits
@ $74DD label=VerticalRun_Reverse
D $74DD Reverses the bits of one byte.
  $74DD,$01 Point #REGhl at this end.
  $74DE,$02 Bit 7 of #REGc is set.
N $74E0 Rotate its bits into #REGc.
@ $74E0 label=VerticalRun_ReverseBit
  $74E0,$06 Jump to #R$74E0 until the byte is reversed.
  $74E6,$01 Write the reversed byte back.
  $74E7,$01 Swap the pointers.
  $74E8,$01 Return.

c $74E9 Patch Vertical Shift
@ $74E9 label=VerticalRun_Patch
D $74E9 Writes the next picture byte over the vertical-shift immediates and
. draws both layers.
  $74E9,$09 Write the row count over both loop immediates.
  $74F2,$03 Fetch the shift.
  $74F5,$03 Fetch the Y coordinate.
  $74F8,$03 Fetch the X coordinate.
N $74FB Patch the offset immediates and draw both layers.
@ $74FB label=VerticalRun_Draw
  $74FB,$06 Write the shift into both offset immediates.
  $7501,$02 Halve the shift.
  $7503,$06 Write it into both inner byte counts.
N $7509 Reverse the pixels.
  $7509,$05 Call #R$748B.
N $750E Reverse the attributes.
  $750E,$03 Call #R$74BE.
  $7511,$01 Return.

c $7512 Draw Vertical Shift
@ $7512 label=DrawVertical
D $7512 Opcode #N$EE patches the vertical shift and steps the picture pointer on
. by five.
  $7512,$03 Call #R$74E9.
  $7515,$05 Step the record pointer on by five.
  $751A,$03 Jump to #R$6E53.

c $751D Draw Fixed Vertical Stroke
@ $751D label=FixedVertical
D $751D Used for picture record #N$FA. The shift is forced to #N$0C.
  $751D,$08 Write #N$0C over the row-count immediates.
  $7525,$02 Width #N$20.
  $7527,$03 Offset #N($0000,$04,$04).
  $752A,$03 Call #R$74FB.
  $752D,$02 Advance the record pointer.
  $752F,$03 Jump to #R$6E53.

c $7532 Look Up Screen Row
@ $7532 label=RowWord
D $7532 The picture engine's copy of the row lookup.
R $7532 A Character row
R $7532 O:DE Pixel address of that row
  $7532,$03 Copy the row into #REGhl.
  $7535,$05 Point at that word in #R$5BD0.
  $753A,$03 Fetch the screen address.
  $753D,$01 Return.

c $753E Paint Attribute Run
@ $753E label=PaintAttributeRun
D $753E Writes a run of attribute bytes into the illustration buffer and returns
. to the record loop.
N $753E Read the column, row, attribute and run length.
  $753E,$02 Advance the record pointer.
  $7540,$05 Copy the row into #REGhl.
  $7545,$05 Multiply by #N($20).
  $754A,$05 Fetch the column.
  $754F,$04 Step past the column and row.
  $7553,$01 Add the column.
  $7554,$03 Point #REGde at #R$6C7A.
  $7557,$01 Add that buffer.
  $7558,$03 Fetch the attribute byte.
  $755B,$02 Advance the record pointer.
  $755D,$03 Fetch the run length.
  $7560,$02 Advance the record pointer.
N $7562 Write the run.
@ $7562 label=PaintAttributeRun_Byte
  $7562,$01 Write this attribute.
  $7563,$01 Advance the destination.
  $7564,$02 Jump to #R$7562 until the run is done.
  $7566,$03 Jump to #R$6E53.

u $7569
B $7569,$65

t $75CE Tokenised Location Text
@ $75CE label=TokenisedLocations
D $75CE #BUILDICT Short location text for every room, used for rooms #N$66 and
. above and for every room while pictures are on. Each byte is a dictionary
. word, and a message ends at #N$5E or #N$7E. The opening expands to the welcome
. for Blizzard Pass, dedicated to Hawkwind.
N $75CE Room #N($00), "welcome to Blizzard Pass I. Dedicated to Hawkwind. Any
. resemblance between the characters in the game and your mother in law is total
. coincidence. Adventure, original concept and graphics by Alan Cox, G4PTS.".
. See #FACT(hawkwind,Facts).
B $75CE,$74 #TOKENS$74
B $7642,$01 Terminator.
N $7643 Room #N($01), "you are in a snowy pass. The cliffs here are nowhere near
. as steep as the rest of the pass and half way up I can see a window".
B $7643,$31 #TOKENS$31
B $7674,$01 Terminator.
N $7675 Room #N($02),
. "you are lost in a freezing blizzard blasted by snow and an icy wind".
B $7675,$1B #TOKENS$1B
B $7690,$01 Terminator.
N $7691 Room #N($03), "you are hanging onto a cliff beside a window. Far below
. you the pass seems an awfully long way below".
B $7691,$2A #TOKENS$2A
B $76BB,$01 Terminator.
N $76BC Room #N($04),
. "you are in a small rock gallery with a somewhat vandalised window".
B $76BC,$19 #TOKENS$19
B $76D5,$01 Terminator.
N $76D6 Room #N($05), "you are in a very dim shadowy room".
B $76D6,$0E #TOKENS$0E
B $76E4,$01 Terminator.
N $76E5 Room #N($06), "empty".
B $76E5,$03 #TOKENS$03
B $76E8,$01 Terminator.
N $76E9 Room #N($07),
. "you are in a wide dark passage which comes south to a T junction".
B $76E9,$1A #TOKENS$1A
B $7703,$01 Terminator.
N $7704 Room #N($08), "you are in a long dark passage. A small room is north".
B $7704,$13 #TOKENS$13
B $7717,$01 Terminator.
N $7718 Room #N($09), "empty".
B $7718,$03 #TOKENS$03
B $771B,$01 Terminator.
N $771C Room #N($0A), "you are in a passage hidden beneath a large statue. The
. passage runs south while grooves in the wall enable you to climb back up".
B $771C,$37 #TOKENS$37
B $7753,$01 Terminator.
N $7754 Room #N($0B), "you are in a desecrated temple".
B $7754,$0B #TOKENS$0B
B $775F,$01 Terminator.
N $7760 Room #N($0C), "you are in a small room".
B $7760,$05 #TOKENS$05
B $7765,$01 Terminator.
N $7766 Room #N($0D), "you are in a corridor with a room to the north".
B $7766,$0F #TOKENS$0F
B $7775,$01 Terminator.
N $7776 Room #N($0E), "you are in a small room".
B $7776,$05 #TOKENS$05
B $777B,$01 Terminator.
N $777C Room #N($0F),
. "you are in a huge pillared mystical hall deep within the mountain".
B $777C,$16 #TOKENS$16
B $7792,$01 Terminator.
N $7793 Room #N($10), "you are on a landing. Stairs lead down into a hall full
. of zombie guards".
B $7793,$20 #TOKENS$20
B $77B3,$01 Terminator.
N $77B4 Room #N($11), "you are in a shattered ruined hall".
B $77B4,$0D #TOKENS$0D
B $77C1,$01 Terminator.
N $77C2 Room #N($12), "you are in a low narrow corridor".
B $77C2,$0C #TOKENS$0C
B $77CE,$01 Terminator.
N $77CF Room #N($13), "you are in a large rest chamber".
B $77CF,$0C #TOKENS$0C
B $77DB,$01 Terminator.
N $77DC Room #N($14), "you are in a smelly earthen cave".
B $77DC,$09 #TOKENS$09
B $77E5,$01 Terminator.
N $77E6 Room #N($15), "you are in a shadowy corridor".
B $77E6,$0B #TOKENS$0B
B $77F1,$01 Terminator.
N $77F2 Room #N($16), "you are in a cave".
B $77F2,$05 #TOKENS$05
B $77F7,$01 Terminator.
N $77F8 Room #N($17), "you are in a work room".
B $77F8,$06 #TOKENS$06
B $77FE,$01 Terminator.
N $77FF Room #N($18), "you are in a low dark passage covered in mould".
B $77FF,$0F #TOKENS$0F
B $780E,$01 Terminator.
N $780F Room #N($19), "you are in a sinister torture chamber".
B $780F,$0E #TOKENS$0E
B $781D,$01 Terminator.
N $781E Room #N($1A), "you are in a dank and dripping dungeon".
B $781E,$0E #TOKENS$0E
B $782C,$01 Terminator.
N $782D Room #N($1B), "you are in the hanging room".
B $782D,$08 #TOKENS$08
B $7835,$01 Terminator.
N $7836 Room #N($1C), "you are in a stinking damp cell".
B $7836,$0E #TOKENS$0E
B $7844,$01 Terminator.
N $7845 Room #N($1D), "you are in the robing room".
B $7845,$06 #TOKENS$06
B $784B,$01 Terminator.
N $784C Room #N($1E), "you are in a sinsister foreboding crypt". The game spells
. it "sinsister", see #FACT(sinsister,Facts).
B $784C,$0F #TOKENS$0F
B $785B,$01 Terminator.
N $785C Room #N($1F), "you are in a small entry chamber".
B $785C,$0B #TOKENS$0B
B $7867,$01 Terminator.
N $7868 Room #N($20), "you are in the library, surrounded by empty bookcases".
B $7868,$17 #TOKENS$17
B $787F,$01 Terminator.
N $7880 Room #N($21), "you are in a large water cave with a well at one end".
B $7880,$14 #TOKENS$14
B $7894,$01 Terminator.
N $7895 Room #N($22), "you are down a small dried up well".
B $7895,$11 #TOKENS$11
B $78A6,$01 Terminator.
N $78A7 Room #N($23), "you are in a massive hall decorated with shields".
B $78A7,$17 #TOKENS$17
B $78BE,$01 Terminator.
N $78BF Room #N($24), "you are in a huge cavern above a flaming stream of lava.
. A path runs beside the lava".
B $78BF,$1F #TOKENS$1F
B $78DE,$01 Terminator.
N $78DF Room #N($25), "you are in musty secret chamber".
B $78DF,$0E #TOKENS$0E
B $78ED,$01 Terminator.
N $78EE Room #N($26), "you are in an inscribed rune covered chamber".
B $78EE,$13 #TOKENS$13
B $7901,$01 Terminator.
N $7902 Room #N($27),
. "you are on the path right beside the lava. The heat is incredible".
B $7902,$18 #TOKENS$18
B $791A,$01 Terminator.
N $791B Room #N($28), "you are at the end of the path".
B $791B,$09 #TOKENS$09
B $7924,$01 Terminator.
N $7925 Room #N($29), "you are on a ledge in a huge fissure. You can jump down
. to another ledge below you".
B $7925,$20 #TOKENS$20
B $7945,$01 Terminator.
N $7946 Room #N($2A), "you are at the bottom of a deep fissure".
B $7946,$0C #TOKENS$0C
B $7952,$01 Terminator.
N $7953 Room #N($2B), "you are in a narrow crack".
B $7953,$0A #TOKENS$0A
B $795D,$01 Terminator.
N $795E Room #N($2C), "you are in a gallery above a guardroom".
B $795E,$11 #TOKENS$11
B $796F,$01 Terminator.
N $7970 Room #N($2D), "you are in a guardroom, to the west is a similar room
. full of zombie warriors".
B $7970,$24 #TOKENS$24
B $7994,$01 Terminator.
N $7995 Room #N($2E),
. "you are in a guardroom with stairs up, surrounded by zombie guards".
B $7995,$1D #TOKENS$1D
B $79B2,$01 Terminator.
N $79B3 Room #N($2F), "you are in a wide passageway".
B $79B3,$06 #TOKENS$06
B $79B9,$01 Terminator.
N $79BA Room #N($30), "you are in a fissure on a narrow ledge. Above on the
. opposite side is another fissure".
B $79BA,$24 #TOKENS$24
B $79DE,$01 Terminator.
N $79DF Room #N($31), "you are in a huge cavern, at the west end. Steps lead
. down into a canyon along which a stream flows".
B $79DF,$2B #TOKENS$2B
B $7A0A,$01 Terminator.
N $7A0B Room #N($32), "you are in a large cave. A huge deep channel".
B $7A0B,$12 #TOKENS$12
B $7A1D,$01 Terminator.
N $7A1E Room #N($33), "you are in a large cave, at the east end.".
B $7A1E,$0F #TOKENS$0F
B $7A2D,$01 Terminator.
N $7A2E Room #N($34), "you are in the hall of fire. A red pentacle is near one
. wall beside a carved picture. A lever on one wall is beside a drawbridge that
. is".
B $7A2E,$34 #TOKENS$34
B $7A62,$01 Terminator.
N $7A63 Room #N($35), "you are in a narrow canyon beside a stream".
B $7A63,$10 #TOKENS$10
B $7A73,$01 Terminator.
N $7A74 Room #N($36), "you are in the canyon on the east bank of the stream".
B $7A74,$10 #TOKENS$10
B $7A84,$01 Terminator.
N $7A85 Room #N($37), "you are on a ledge high over a pool of lava. There is a
. ledge on the other side".
B $7A85,$1E #TOKENS$1E
B $7AA3,$01 Terminator.
N $7AA4 Room #N($38), "you are in a wet dripping cave".
B $7AA4,$0A #TOKENS$0A
B $7AAE,$01 Terminator.
N $7AAF Room #N($39), "you are in an arched entry hall".
B $7AAF,$0B #TOKENS$0B
B $7ABA,$01 Terminator.
N $7ABB Room #N($3A), "you are in a magnificent pillared throne hall. Dark
. curtains cover the walls".
B $7ABB,$20 #TOKENS$20
B $7ADB,$01 Terminator.
N $7ADC Room #N($3B), "you are in a small room with a".
B $7ADC,$07 #TOKENS$07
B $7AE3,$01 Terminator.
N $7AE4 Room #N($3C),
. "you are in a treasure room. There is a broken grille in the ceiling".
B $7AE4,$17 #TOKENS$17
B $7AFB,$01 Terminator.
N $7AFC Room #N($3D), "you are in a low passage. A sign on the wall reads DANGER
. STORM GIANTS CAN SERIOUSLY DAMAGE YOUR ELF".
B $7AFC,$40 #TOKENS$40
B $7B3C,$01 Terminator.
N $7B3D Room #N($3E), "you are in a huge glittering cave".
B $7B3D,$0A #TOKENS$0A
B $7B47,$01 Terminator.
N $7B48 Room #N($3F), "you are in a slime pit".
B $7B48,$05 #TOKENS$05
B $7B4D,$01 Terminator.
N $7B4E Room #N($40), "you have ceased to exist".
B $7B4E,$0B #TOKENS$0B
B $7B59,$01 Terminator.
N $7B5A Room #N($41), "you are on the far side of the lava pit".
B $7B5A,$0B #TOKENS$0B
B $7B65,$01 Terminator.
N $7B66 Room #N($42), "you are in a sinister evil temple".
B $7B66,$0B #TOKENS$0B
B $7B71,$01 Terminator.
N $7B72 Room #N($43), "you are in a workroom".
B $7B72,$07 #TOKENS$07
B $7B79,$01 Terminator.
N $7B7A Room #N($44),
. "you are in a snowstorm outside the now barred sorcerors gate".
B $7B7A,$19 #TOKENS$19
B $7B93,$01 Terminator.
N $7B94 Room #N($45), "you are in a snowstorm beside a crevasse".
B $7B94,$0E #TOKENS$0E
B $7BA2,$01 Terminator.
N $7BA3 Room #N($46), "you are in the crevasse".
B $7BA3,$08 #TOKENS$08
B $7BAB,$01 Terminator.
N $7BAC Room #N($47), "you are in the temple of the elements".
B $7BAC,$0B #TOKENS$0B
B $7BB7,$01 Terminator.
N $7BB8 Room #N($48), "empty".
B $7BB8,$03 #TOKENS$03
B $7BBB,$01 Terminator.
N $7BBC Room #N($49), "you are in a glittering ice cave. The floor is covered in
. deep snow. The cavemouth is blocked by snow from the avalanche".
B $7BBC,$2A #TOKENS$2A
B $7BE6,$01 Terminator.
N $7BE7 Room #N($4A), "you are in a snowy pass. There is a cavemouth here".
B $7BE7,$0D #TOKENS$0D
B $7BF4,$01 Terminator.
N $7BF5 Room #N($4B), "you are in a snowy pass".
B $7BF5,$06 #TOKENS$06
B $7BFB,$01 Terminator.
N $7BFC Room #N($4C), "you are in an icy pass".
B $7BFC,$07 #TOKENS$07
B $7C03,$01 Terminator.
N $7C04 Room #N($4D),
. "you are on a path leading up the mountainside to a temple".
B $7C04,$15 #TOKENS$15
B $7C19,$01 Terminator.
N $7C1A Room #N($4E), "you are in the ruins of a temple".
B $7C1A,$0B #TOKENS$0B
B $7C25,$01 Terminator.
N $7C26 Room #N($4F), "you are in a snowy pass".
B $7C26,$06 #TOKENS$06
B $7C2C,$01 Terminator.
N $7C2D Room #N($50), "you are in a rocky pass".
B $7C2D,$07 #TOKENS$07
B $7C34,$01 Terminator.
N $7C35 Room #N($51),
. "you are in a green and fair valley amidst the gently murmuring oaks".
B $7C35,$1E #TOKENS$1E
B $7C53,$01 Terminator.
N $7C54 Room #N($52), "you are on a humpbacked bridge over a stream".
B $7C54,$13 #TOKENS$13
B $7C67,$01 Terminator.
N $7C68 Room #N($53), "you are in a square of grass in the centre of a village.
. Your cottage is east".
B $7C68,$1E #TOKENS$1E
B $7C86,$01 Terminator.
N $7C87 Room #N($54), "you are in a wooden church".
B $7C87,$0A #TOKENS$0A
B $7C91,$01 Terminator.
N $7C92 Room #N($55), "you are in your cottage, home and safe at last".
B $7C92,$15 #TOKENS$15
B $7CA7,$01 Terminator.
N $7CA8 Room #N($56), "you are in a green wood".
B $7CA8,$08 #TOKENS$08
B $7CB0,$01 Terminator.
N $7CB1 Room #N($57), "you are in a secluded clearing beside a waterfall which
. sprays cool water gently over you".
B $7CB1,$28 #TOKENS$28
B $7CD9,$01 Terminator.
N $7CDA Room #N($58), "you are in a field beside a gently burbling stream".
B $7CDA,$13 #TOKENS$13
B $7CED,$01 Terminator.
N $7CEE Room #N($59), "you are in the woods beside a stream".
B $7CEE,$0B #TOKENS$0B
B $7CF9,$01 Terminator.
N $7CFA Room #N($5A), "you are in the woods".
B $7CFA,$06 #TOKENS$06
B $7D00,$01 Terminator.
N $7D01 Room #N($5B), "you are in a shady clearing deep in the woods".
B $7D01,$10 #TOKENS$10
B $7D11,$01 Terminator.
N $7D12 Room #N($5C), "you are in a clearing beside a crystal clear pool".
B $7D12,$10 #TOKENS$10
B $7D22,$01 Terminator.
N $7D23 Room #N($5D), "you are in a glittering hall made entirely of ice".
B $7D23,$15 #TOKENS$15
B $7D38,$01 Terminator.
N $7D39 Room #N($5E),
. "you are in the magicians research room made entirely of ice".
B $7D39,$19 #TOKENS$19
B $7D52,$01 Terminator.
N $7D53 Room #N($5F),
. "you are in a huge hall forming the centre of the ice palace".
B $7D53,$14 #TOKENS$14
B $7D67,$01 Terminator.
N $7D68 Room #N($60), "you are in an icy throne hall. A huge crystal throne
. dominates one wall. A wizard lies dead on the floor".
B $7D68,$26 #TOKENS$26
B $7D8E,$01 Terminator.
N $7D8F Room #N($61), "you are in the royal bedroom with a large cupboard on the
. south wall. The cupboard is".
B $7D8F,$20 #TOKENS$20
B $7DAF,$01 Terminator.
N $7DB0 Room #N($62), "you are in a secret room".
B $7DB0,$06 #TOKENS$06
B $7DB6,$01 Terminator.
N $7DB7 Room #N($63), "you are in the priests room".
B $7DB7,$07 #TOKENS$07
B $7DBE,$01 Terminator.
N $7DBF Room #N($64), "you are in a maze of catacombs".
B $7DBF,$0C #TOKENS$0C
B $7DCB,$01 Terminator.
N $7DCC Room #N($65), "you are in a maze of catacombs".
B $7DCC,$0C #TOKENS$0C
B $7DD8,$01 Terminator.
N $7DD9 Room #N($66), "you are in a maze of catacombs".
B $7DD9,$0C #TOKENS$0C
B $7DE5,$01 Terminator.
N $7DE6 Room #N($67), "you are in a maze of catacombs".
B $7DE6,$0C #TOKENS$0C
B $7DF2,$01 Terminator.
N $7DF3 Room #N($68), "you are in a maze of catacombs".
B $7DF3,$0C #TOKENS$0C
B $7DFF,$01 Terminator.
N $7E00 Room #N($69), "you are in a maze of catacombs".
B $7E00,$0C #TOKENS$0C
B $7E0C,$01 Terminator.
N $7E0D Room #N($6A), "you are in a crypt beneath the temple".
B $7E0D,$0F #TOKENS$0F
B $7E1C,$01 Terminator.
N $7E1D Room #N($6B), "empty".
B $7E1D,$03 #TOKENS$03
B $7E20,$01 Terminator.
B $7E21,$05

t $7E26 System Messages
@ $7E26 label=SystemMessages
D $7E26 #BUILDICT The stock replies, 172 of them, each ending at #N$5E (stay on
. the line) or #N$7E (start a new line). Each byte is a token into #R$B1BC.
. Directions #N$01 to #N$0A are the compass points. Message #N$0B is the
. unrecognised-word reply, #N$10 is the inventory heading, #N$12 asks whether to
. play again, and #N$19 is the darkness line.
N $7E26 ". You can see".
B $7E26,$06 #TOKENS$06
B $7E2C,$01 Terminator.
N $7E2D " north,".
@ $7E2D label=SystemMessage_01
B $7E2D,$05 #TOKENS$05
B $7E32,$01 Terminator.
N $7E33 " south,".
@ $7E33 label=SystemMessage_02
B $7E33,$03 #TOKENS$03
B $7E36,$01 Terminator.
N $7E37 " east,".
@ $7E37 label=SystemMessage_03
B $7E37,$03 #TOKENS$03
B $7E3A,$01 Terminator.
N $7E3B " west,".
@ $7E3B label=SystemMessage_04
B $7E3B,$04 #TOKENS$04
B $7E3F,$01 Terminator.
N $7E40 " up,".
@ $7E40 label=SystemMessage_05
B $7E40,$03 #TOKENS$03
B $7E43,$01 Terminator.
N $7E44 " down,".
@ $7E44 label=SystemMessage_06
B $7E44,$02 #TOKENS$02
B $7E46,$01 Terminator.
N $7E47 " north east,".
@ $7E47 label=SystemMessage_07
B $7E47,$07 #TOKENS$07
B $7E4E,$01 Terminator.
N $7E4F " north west,".
@ $7E4F label=SystemMessage_08
B $7E4F,$08 #TOKENS$08
B $7E57,$01 Terminator.
N $7E58 " south east,".
@ $7E58 label=SystemMessage_09
B $7E58,$05 #TOKENS$05
B $7E5D,$01 Terminator.
N $7E5E " south west,".
@ $7E5E label=SystemMessage_0A
B $7E5E,$06 #TOKENS$06
B $7E64,$01 Terminator.
N $7E65 "that input contained no recognised words.".
@ $7E65 label=SystemMessage_0B
B $7E65,$18 #TOKENS$18
B $7E7D,$01 Terminator.
N $7E7E "it's beyond my power to do that.".
@ $7E7E label=SystemMessage_0C
B $7E7E,$12 #TOKENS$12
B $7E90,$01 Terminator.
N $7E91 ". You can go".
@ $7E91 label=SystemMessage_0D
B $7E91,$06 #TOKENS$06
B $7E97,$01 Terminator.
N $7E98 "what do you want to do now".
@ $7E98 label=SystemMessage_0E
B $7E98,$0C #TOKENS$0C
B $7EA4,$01 Terminator.
N $7EA5 "you're carrying too much.".
@ $7EA5 label=SystemMessage_0F
B $7EA5,$10 #TOKENS$10
B $7EB5,$01 Terminator.
N $7EB6 "you are carrying the following:".
@ $7EB6 label=SystemMessage_10
B $7EB6,$0E #TOKENS$0E
B $7EC4,$01 Terminator.
N $7EC5 "nothing at all.".
@ $7EC5 label=SystemMessage_11
B $7EC5,$07 #TOKENS$07
B $7ECC,$01 Terminator.
N $7ECD "game's now over. do you want to play again (Y/N) ?".
@ $7ECD label=SystemMessage_12
B $7ECD,$1D #TOKENS$1D
B $7EEA,$01 Terminator.
N $7EEB "Ok.".
@ $7EEB label=SystemMessage_13
B $7EEB,$03 #TOKENS$03
B $7EEE,$01 Terminator.
N $7EEF "press any key to continue.".
@ $7EEF label=SystemMessage_14
B $7EEF,$10 #TOKENS$10
B $7EFF,$01 Terminator.
N $7F00 "you already have it.".
@ $7F00 label=SystemMessage_15
B $7F00,$08 #TOKENS$08
B $7F08,$01 Terminator.
N $7F09 "sorry, I don't see it here.".
@ $7F09 label=SystemMessage_16
B $7F09,$11 #TOKENS$11
B $7F1A,$01 Terminator.
N $7F1B "you don't have it.".
@ $7F1B label=SystemMessage_17
B $7F1B,$08 #TOKENS$08
B $7F23,$01 Terminator.
N $7F24 "you can't go that way.".
@ $7F24 label=SystemMessage_18
B $7F24,$0A #TOKENS$0A
B $7F2E,$01 Terminator.
N $7F2F "It is dark. You cannot see.".
@ $7F2F label=SystemMessage_19
B $7F2F,$0C #TOKENS$0C
B $7F3B,$01 Terminator.
N $7F3C "do you want to restore a saved game ?".
@ $7F3C label=SystemMessage_1A
B $7F3C,$13 #TOKENS$13
B $7F4F,$01 Terminator.
N $7F50 "".
@ $7F50 label=SystemMessage_1B
B $7F50,$01 #TOKENS$01
B $7F51,$01 Terminator.
N $7F52 "you are not wearing it.".
@ $7F52 label=SystemMessage_1C
B $7F52,$09 #TOKENS$09
B $7F5B,$01 Terminator.
N $7F5C "you are wearing it.".
@ $7F5C label=SystemMessage_1D
B $7F5C,$07 #TOKENS$07
B $7F63,$01 Terminator.
N $7F64 " (worn),".
@ $7F64 label=SystemMessage_1E
B $7F64,$07 #TOKENS$07
B $7F6B,$01 Terminator.
N $7F6C "No help at this stage.".
@ $7F6C label=SystemMessage_1F
B $7F6C,$0C #TOKENS$0C
B $7F78,$01 Terminator.
N $7F79 "I don't understand that verb".
@ $7F79 label=SystemMessage_20
B $7F79,$10 #TOKENS$10
B $7F89,$01 Terminator.
N $7F8A "the snow melts turning into a handfull of slush.".
@ $7F8A label=SystemMessage_21
B $7F8A,$19 #TOKENS$19
B $7FA3,$01 Terminator.
N $7FA4 "it is too narrow to squeeze through.".
@ $7FA4 label=SystemMessage_22
B $7FA4,$15 #TOKENS$15
B $7FB9,$01 Terminator.
N $7FBA "there are hundreds of little cracks in the rock around its rim.".
@ $7FBA label=SystemMessage_23
B $7FBA,$1F #TOKENS$1F
B $7FD9,$01 Terminator.
N $7FDA "the slush melts away.".
@ $7FDA label=SystemMessage_24
B $7FDA,$0B #TOKENS$0B
B $7FE5,$01 Terminator.
N $7FE6 "the slush freezes cracking the rock around the window which falls
. away.".
@ $7FE6 label=SystemMessage_25
B $7FE6,$20 #TOKENS$20
B $8006,$01 Terminator.
N $8007 "it is mounted on runners.".
@ $8007 label=SystemMessage_26
B $8007,$0B #TOKENS$0B
B $8012,$01 Terminator.
N $8013 "it won't shift.".
@ $8013 label=SystemMessage_27
B $8013,$09 #TOKENS$09
B $801C,$01 Terminator.
N $801D "You have found something.".
@ $801D label=SystemMessage_28
B $801D,$0B #TOKENS$0B
B $8028,$01 Terminator.
N $8029 "the forcefield stops you.".
@ $8029 label=SystemMessage_29
B $8029,$0E #TOKENS$0E
B $8037,$01 Terminator.
N $8038 "glowing runes on the rod read 'Seek three power stones to gain the rod
. of power if that is what you seek'.".
@ $8038 label=SystemMessage_2A
B $8038,$32 #TOKENS$32
B $806A,$01 Terminator.
N $806B "no more will come off the wall.".
@ $806B label=SystemMessage_2B
B $806B,$10 #TOKENS$10
B $807B,$01 Terminator.
N $807C "it is now very shiny.".
@ $807C label=SystemMessage_2C
B $807C,$0A #TOKENS$0A
B $8086,$01 Terminator.
N $8087 "the rod drops to the floor as the forcefield vanishes.".
@ $8087 label=SystemMessage_2D
B $8087,$1A #TOKENS$1A
B $80A1,$01 Terminator.
N $80A2 "as you open the coffin a ghoul climbs out!".
@ $80A2 label=SystemMessage_2E
B $80A2,$14 #TOKENS$14
B $80B6,$01 Terminator.
N $80B7 "the fierce heat drives you back.".
@ $80B7 label=SystemMessage_2F
B $80B7,$10 #TOKENS$10
B $80C7,$01 Terminator.
N $80C8 "ouch, it is too hot to hold!".
@ $80C8 label=SystemMessage_30
B $80C8,$0E #TOKENS$0E
B $80D6,$01 Terminator.
N $80D7 "the sword slides smoothly out of the stone.".
@ $80D7 label=SystemMessage_31
B $80D7,$12 #TOKENS$12
B $80E9,$01 Terminator.
N $80EA "it is magical.".
@ $80EA label=SystemMessage_32
B $80EA,$06 #TOKENS$06
B $80F0,$01 Terminator.
N $80F1 "the shield protects you from the worst of the heat.".
@ $80F1 label=SystemMessage_33
B $80F1,$15 #TOKENS$15
B $8106,$01 Terminator.
N $8107 "the ghoul turns to dust as the sword strikes.".
@ $8107 label=SystemMessage_34
B $8107,$15 #TOKENS$15
B $811C,$01 Terminator.
N $811D "the ghoul is chasing you.".
@ $811D label=SystemMessage_35
B $811D,$0A #TOKENS$0A
B $8127,$01 Terminator.
N $8128 "the ghoul tears you apart and begins to eat.".
@ $8128 label=SystemMessage_36
B $8128,$14 #TOKENS$14
B $813C,$01 Terminator.
N $813D "on it is written 'Open not lest foul undead slay thee'.".
@ $813D label=SystemMessage_37
B $813D,$1E #TOKENS$1E
B $815B,$01 Terminator.
N $815C "in amongst the runes is a picture of a man inside a pentagram which
. appears to be stopping a demon from attacking him.".
@ $815C label=SystemMessage_38
B $815C,$34 #TOKENS$34
B $8190,$01 Terminator.
N $8191 "the dark figure throws you out of the library.".
@ $8191 label=SystemMessage_39
B $8191,$19 #TOKENS$19
B $81AA,$01 Terminator.
N $81AB "the floor opens and you tumble down.".
@ $81AB label=SystemMessage_3A
B $81AB,$0F #TOKENS$0F
B $81BA,$01 Terminator.
N $81BB "your weapons are having no effect!".
@ $81BB label=SystemMessage_3B
B $81BB,$13 #TOKENS$13
B $81CE,$01 Terminator.
N $81CF "red to red, wave to wave, thus pass away from cave to cave. Seek the
. sorcerors doom, near the once wet place, not a room. Seek the hidden way in
. the dungeons. He is across the pit of fire bridged by a sceptre. Aranus last
. wiza....".
@ $81CF label=SystemMessage_3C
B $81CF,$72 #TOKENS$72
B $8241,$01 Terminator.
N $8242 "it is too heavy.".
@ $8242 label=SystemMessage_3D
B $8242,$08 #TOKENS$08
B $824A,$01 Terminator.
N $824B "you drop the boulder.".
@ $824B label=SystemMessage_3E
B $824B,$0A #TOKENS$0A
B $8255,$01 Terminator.
N $8256 "you feel stronger.".
@ $8256 label=SystemMessage_3F
B $8256,$0A #TOKENS$0A
B $8260,$01 Terminator.
N $8261 "the boulder splatters the ogre.".
@ $8261 label=SystemMessage_40
B $8261,$0E #TOKENS$0E
B $826F,$01 Terminator.
N $8270 "what at ?".
@ $8270 label=SystemMessage_41
B $8270,$05 #TOKENS$05
B $8275,$01 Terminator.
N $8276 "the ogre decides to redesign your head ....".
@ $8276 label=SystemMessage_42
B $8276,$18 #TOKENS$18
B $828E,$01 Terminator.
N $828F "the strength spell ends.".
@ $828F label=SystemMessage_43
B $828F,$0E #TOKENS$0E
B $829D,$01 Terminator.
N $829E "it is too far.".
@ $829E label=SystemMessage_44
B $829E,$07 #TOKENS$07
B $82A5,$01 Terminator.
N $82A6 "the pillar falls down the fissure taking the snake with it.".
@ $82A6 label=SystemMessage_45
B $82A6,$19 #TOKENS$19
B $82BF,$01 Terminator.
N $82C0 "you roll the pillar across the fissure, but in doing so wake a gigantic
. snake that was sleeping underneath!".
@ $82C0 label=SystemMessage_46
B $82C0,$39 #TOKENS$39
B $82F9,$01 Terminator.
N $82FA "it is locked.".
@ $82FA label=SystemMessage_47
B $82FA,$05 #TOKENS$05
B $82FF,$01 Terminator.
N $8300 "it is furry with baggy pockets and in truth looks rather silly.".
@ $8300 label=SystemMessage_48
B $8300,$22 #TOKENS$22
B $8322,$01 Terminator.
N $8323 "you have no suitable key.".
@ $8323 label=SystemMessage_49
B $8323,$10 #TOKENS$10
B $8333,$01 Terminator.
N $8334 "you find nothing.".
@ $8334 label=SystemMessage_4A
B $8334,$08 #TOKENS$08
B $833C,$01 Terminator.
N $833D "the wire appears to have triggered a cave in burying you alive.".
@ $833D label=SystemMessage_4B
B $833D,$1B #TOKENS$1B
B $8358,$01 Terminator.
N $8359 "the door looks very weak.".
@ $8359 label=SystemMessage_4C
B $8359,$0E #TOKENS$0E
B $8367,$01 Terminator.
N $8368 "the vampire is trying to keep away from the garlic.".
@ $8368 label=SystemMessage_4D
B $8368,$17 #TOKENS$17
B $837F,$01 Terminator.
N $8380 "the vampire sinks his teeth into you, what a pain in the neck!".
@ $8380 label=SystemMessage_4E
B $8380,$1F #TOKENS$1F
B $839F,$01 Terminator.
N $83A0 "a wizard appears bathed in shimmering multicoloured light. He says
. 'flee if you can for the high wizard of the mountains has become evil. What
. little help I can offer you is buried in the cave'. He vanishes in a cloud of
. smoke.".
@ $83A0 label=SystemMessage_4F
B $83A0,$6E #TOKENS$6E
B $840E,$01 Terminator.
N $840F "the snake bites you. It is poisonous. Some days nothing ever seems to
. go right...".
@ $840F label=SystemMessage_50
B $840F,$29 #TOKENS$29
B $8438,$01 Terminator.
N $8439 "he's totally BATTY!!!!".
@ $8439 label=SystemMessage_51
B $8439,$11 #TOKENS$11
B $844A,$01 Terminator.
N $844B "the rope doesn't carry far enough.".
@ $844B label=SystemMessage_52
B $844B,$14 #TOKENS$14
B $845F,$01 Terminator.
N $8460 "it is too slippy to climb.".
@ $8460 label=SystemMessage_53
B $8460,$0E #TOKENS$0E
B $846E,$01 Terminator.
N $846F "there is nothing here you can tie it too, as it is stiff and quite
. slippery. (THE ROPE THAT IS!)".
@ $846F label=SystemMessage_54
B $846F,$36 #TOKENS$36
B $84A5,$01 Terminator.
N $84A6 "you loop the rope end through the ring.".
@ $84A6 label=SystemMessage_55
B $84A6,$12 #TOKENS$12
B $84B8,$01 Terminator.
N $84B9 "the rope, and the wizard fall to the floor.".
@ $84B9 label=SystemMessage_56
B $84B9,$0C #TOKENS$0C
B $84C5,$01 Terminator.
N $84C6 "the ring comes out of the wall.".
@ $84C6 label=SystemMessage_57
B $84C6,$09 #TOKENS$09
B $84CF,$01 Terminator.
N $84D0 "it is fastened.".
@ $84D0 label=SystemMessage_58
B $84D0,$06 #TOKENS$06
B $84D6,$01 Terminator.
N $84D7 "the slime touches you and within seconds you are covered in a mass of
. slime.".
@ $84D7 label=SystemMessage_59
B $84D7,$1E #TOKENS$1E
B $84F5,$01 Terminator.
N $84F6 "it won't open.".
@ $84F6 label=SystemMessage_5A
B $84F6,$08 #TOKENS$08
B $84FE,$01 Terminator.
N $84FF "it is full.".
@ $84FF label=SystemMessage_5B
B $84FF,$06 #TOKENS$06
B $8505,$01 Terminator.
N $8506 "the slime kills the giant.".
@ $8506 label=SystemMessage_5C
B $8506,$0A #TOKENS$0A
B $8510,$01 Terminator.
N $8511 "it is empty.".
@ $8511 label=SystemMessage_5D
B $8511,$05 #TOKENS$05
B $8516,$01 Terminator.
N $8517 "tucked in the lining of the box is a spell.".
@ $8517 label=SystemMessage_5E
B $8517,$12 #TOKENS$12
B $8529,$01 Terminator.
N $852A "the zombie guards rip me to pieces.".
@ $852A label=SystemMessage_5F
B $852A,$13 #TOKENS$13
B $853D,$01 Terminator.
N $853E "the harp cries 'Thief, thief'. The giant wakes up and decides to squash
. you. TRY READING YOUR FAIRY TALES IN FUTURE!.".
@ $853E label=SystemMessage_60
B $853E,$50 #TOKENS$50
B $858E,$01 Terminator.
N $858F "the bucket is too wide to fit down the passage.".
@ $858F label=SystemMessage_61
B $858F,$14 #TOKENS$14
B $85A3,$01 Terminator.
N $85A4 "the plank falls into the channel behind me.".
@ $85A4 label=SystemMessage_62
B $85A4,$14 #TOKENS$14
B $85B8,$01 Terminator.
N $85B9 "the sides of the channel look weak at one end.".
@ $85B9 label=SystemMessage_63
B $85B9,$17 #TOKENS$17
B $85D0,$01 Terminator.
N $85D1 "there is a small explosion.".
@ $85D1 label=SystemMessage_64
B $85D1,$0E #TOKENS$0E
B $85DF,$01 Terminator.
N $85E0 "the dam breaks and the lava flows once again.".
@ $85E0 label=SystemMessage_65
B $85E0,$15 #TOKENS$15
B $85F5,$01 Terminator.
N $85F6 "the sides of the channel cave in and the lava starts to rise behind it,
. while the lava in the channel drains away.".
@ $85F6 label=SystemMessage_66
B $85F6,$2B #TOKENS$2B
B $8621,$01 Terminator.
N $8622 "slime sprays everywhere.".
@ $8622 label=SystemMessage_67
B $8622,$0E #TOKENS$0E
B $8630,$01 Terminator.
N $8631 "it is a picture of waves breaking on a moonlit shore.".
@ $8631 label=SystemMessage_68
B $8631,$1A #TOKENS$1A
B $864B,$01 Terminator.
N $864C "the soap breaks up the oily slime and it collapses back into the pit.".
@ $864C label=SystemMessage_69
B $864C,$20 #TOKENS$20
B $866C,$01 Terminator.
N $866D "the plank burns up in the heat of the lava.".
@ $866D label=SystemMessage_6A
B $866D,$10 #TOKENS$10
B $867D,$01 Terminator.
N $867E "there is a huge explosion deep in the mountain which in turn explodes
. and exploding mountains are not the most healthy place to be in.".
@ $867E label=SystemMessage_6B
B $867E,$3D #TOKENS$3D
B $86BB,$01 Terminator.
N $86BC "the lava is rising fast behind the dam.".
@ $86BC label=SystemMessage_6C
B $86BC,$0F #TOKENS$0F
B $86CB,$01 Terminator.
N $86CC "you are freezing.".
@ $86CC label=SystemMessage_6D
B $86CC,$07 #TOKENS$07
B $86D3,$01 Terminator.
N $86D4 "you have frozen to death.".
@ $86D4 label=SystemMessage_6E
B $86D4,$0C #TOKENS$0C
B $86E0,$01 Terminator.
N $86E1 "you are buried deep in the snow.".
@ $86E1 label=SystemMessage_6F
B $86E1,$0A #TOKENS$0A
B $86EB,$01 Terminator.
N $86EC "the snows topple forward and a huge avalanche comes cascading down the
. pass. The snow buries the yeti.".
@ $86EC label=SystemMessage_70
B $86EC,$2A #TOKENS$2A
B $8716,$01 Terminator.
N $8717 "the snows topple forward and a huge avalanche comes cascading down the
. pass.".
@ $8717 label=SystemMessage_71
B $8717,$1F #TOKENS$1F
B $8736,$01 Terminator.
N $8737 "the yeti forcibly prevents me from entering the cave.".
@ $8737 label=SystemMessage_72
B $8737,$18 #TOKENS$18
B $874F,$01 Terminator.
N $8750 "the yeti tears me to pieces.".
@ $8750 label=SystemMessage_73
B $8750,$0E #TOKENS$0E
B $875E,$01 Terminator.
N $875F "you sink deep into the snow and soon freeze to death trapped helplessly
. in the snow.".
@ $875F label=SystemMessage_74
B $875F,$28 #TOKENS$28
B $8787,$01 Terminator.
N $8788 "as you dig the yeti suddenely smashes its way out of the snow.".
@ $8788 label=SystemMessage_75
B $8788,$1E #TOKENS$1E
B $87A6,$01 Terminator.
N $87A7 "one of the stones is loose and seems to cover an opening.".
@ $87A7 label=SystemMessage_76
B $87A7,$17 #TOKENS$17
B $87BE,$01 Terminator.
N $87BF "the stones snaps into several pieces.".
@ $87BF label=SystemMessage_77
B $87BF,$13 #TOKENS$13
B $87D2,$01 Terminator.
N $87D3 "as you shift the pieces they fall down the hole you uncover.".
@ $87D3 label=SystemMessage_78
B $87D3,$19 #TOKENS$19
B $87EC,$01 Terminator.
N $87ED "you fall....".
@ $87ED label=SystemMessage_79
B $87ED,$07 #TOKENS$07
B $87F4,$01 Terminator.
N $87F5 "it doesn't catch on anything.".
@ $87F5 label=SystemMessage_7A
B $87F5,$10 #TOKENS$10
B $8805,$01 Terminator.
N $8806 "no he's a friend(and he's also bigger than you are!)".
@ $8806 label=SystemMessage_7B
B $8806,$1E #TOKENS$1E
B $8824,$01 Terminator.
N $8825 "the elf says 'We need your help someone must slay the now evil high
. wizard of the mountains before he destroys us all'.".
@ $8825 label=SystemMessage_7C
B $8825,$39 #TOKENS$39
B $885E,$01 Terminator.
N $885F "it is wet, cold and generally whitish in colour!".
@ $885F label=SystemMessage_7D
B $885F,$18 #TOKENS$18
B $8877,$01 Terminator.
N $8878 "one guard steps forward and says 'You cannot pass the road is closed
. for evil has entered the mountains we cannot let you into our valley'.".
@ $8878 label=SystemMessage_7E
B $8878,$43 #TOKENS$43
B $88BB,$01 Terminator.
N $88BC "the guards run off screaming 'YETI YETI'.".
@ $88BC label=SystemMessage_7F
B $88BC,$1B #TOKENS$1B
B $88D7,$01 Terminator.
N $88D8 "so you're feeling suicidal today are you ?".
@ $88D8 label=SystemMessage_80
B $88D8,$17 #TOKENS$17
B $88EF,$01 Terminator.
N $88F0 "you get off the chair.".
@ $88F0 label=SystemMessage_81
B $88F0,$09 #TOKENS$09
B $88F9,$01 Terminator.
N $88FA "you get off the crate.".
@ $88FA label=SystemMessage_82
B $88FA,$09 #TOKENS$09
B $8903,$01 Terminator.
N $8904 "the roof is cracked and looks both thin and weak.".
@ $8904 label=SystemMessage_83
B $8904,$15 #TOKENS$15
B $8919,$01 Terminator.
N $891A "you can't reach.".
@ $891A label=SystemMessage_84
B $891A,$07 #TOKENS$07
B $8921,$01 Terminator.
N $8922 "the roof shudders and a piece falls from the centre leaving a hole.".
@ $8922 label=SystemMessage_85
B $8922,$1F #TOKENS$1F
B $8941,$01 Terminator.
N $8942 "the priest says We need your help someone must slay the now evil high
. wizard of the mountains before he slays us all, I can only give you this bless
. spell as help but it is a start.".
@ $8942 label=SystemMessage_86
B $8942,$58 #TOKENS$58
B $899A,$01 Terminator.
N $899B "you are dead, slain by the sorcery of the evil wizard, who even now
. gloats over your corpse as he prepares to destroy your village.".
@ $899B label=SystemMessage_87
B $899B,$3D #TOKENS$3D
B $89D8,$01 Terminator.
N $89D9 "you are sealed in crystal, for all eternity, all you can do is watch as
. the wizard prepares to destroy your village.".
@ $89D9 label=SystemMessage_88
B $89D9,$32 #TOKENS$32
B $8A0B,$01 Terminator.
N $8A0C "the demon tries to attack you, but is stopped by the pentagram.".
@ $8A0C label=SystemMessage_89
B $8A0C,$1B #TOKENS$1B
B $8A27,$01 Terminator.
N $8A28 "You think (this is questionable) therefore you are, still it seems to
. have worked!".
@ $8A28 label=SystemMessage_8A
B $8A28,$2B #TOKENS$2B
B $8A53,$01 Terminator.
N $8A54 "a wall of ice appears in front of you.".
@ $8A54 label=SystemMessage_8B
B $8A54,$12 #TOKENS$12
B $8A66,$01 Terminator.
N $8A67 "it has a beautiful tone.".
@ $8A67 label=SystemMessage_8C
B $8A67,$10 #TOKENS$10
B $8A77,$01 Terminator.
N $8A78 "the fireball explodes on the ice melting it away(and annoying the
. wizard somewhat!).".
@ $8A78 label=SystemMessage_8D
B $8A78,$29 #TOKENS$29
B $8AA1,$01 Terminator.
N $8AA2 "....and promptly melts again.".
@ $8AA2 label=SystemMessage_8E
B $8AA2,$13 #TOKENS$13
B $8AB5,$01 Terminator.
N $8AB6 "a gust of wind blows.".
@ $8AB6 label=SystemMessage_8F
B $8AB6,$0A #TOKENS$0A
B $8AC0,$01 Terminator.
N $8AC1 "the light bounces back of the polished shield and temporarily blinds
. the wizard.".
@ $8AC1 label=SystemMessage_90
B $8AC1,$24 #TOKENS$24
B $8AE5,$01 Terminator.
N $8AE6 "the wizard reels back clutching at his head.".
@ $8AE6 label=SystemMessage_91
B $8AE6,$14 #TOKENS$14
B $8AFA,$01 Terminator.
N $8AFB "the wizard casts a spell.".
@ $8AFB label=SystemMessage_92
B $8AFB,$0A #TOKENS$0A
B $8B05,$01 Terminator.
N $8B06 "the wizard in one final attempt summons his demon master!".
@ $8B06 label=SystemMessage_93
B $8B06,$1A #TOKENS$1A
B $8B20,$01 Terminator.
N $8B21 "the wizard reels back clutching at his head.".
@ $8B21 label=SystemMessage_94
B $8B21,$14 #TOKENS$14
B $8B35,$01 Terminator.
N $8B36 "the wizard dies, and all his sorcery is undone.".
@ $8B36 label=SystemMessage_95
B $8B36,$14 #TOKENS$14
B $8B4A,$01 Terminator.
N $8B4B "the wizard says 'BE NOT!' and you are not!".
@ $8B4B label=SystemMessage_96
B $8B4B,$12 #TOKENS$12
B $8B5D,$01 Terminator.
N $8B5E "the wizard points at me and utters a hideous curse.".
@ $8B5E label=SystemMessage_97
B $8B5E,$17 #TOKENS$17
B $8B75,$01 Terminator.
N $8B76 "you stand on the crate.".
@ $8B76 label=SystemMessage_98
B $8B76,$07 #TOKENS$07
B $8B7D,$01 Terminator.
N $8B7E "you stand on the chair.".
@ $8B7E label=SystemMessage_99
B $8B7E,$07 #TOKENS$07
B $8B85,$01 Terminator.
N $8B86 "sparks leap from the wizard.".
@ $8B86 label=SystemMessage_9A
B $8B86,$0C #TOKENS$0C
B $8B92,$01 Terminator.
N $8B93 "on it is written slayer of sorcerors(IS THIS A HINT ?)".
@ $8B93 label=SystemMessage_9B
B $8B93,$24 #TOKENS$24
B $8BB7,$01 Terminator.
N $8BB8 "with a hideous laugh the wizard rubs out part of your pentagram!".
@ $8BB8 label=SystemMessage_9C
B $8BB8,$1D #TOKENS$1D
B $8BD5,$01 Terminator.
N $8BD6 "the slush melts".
@ $8BD6 label=SystemMessage_9D
B $8BD6,$09 #TOKENS$09
B $8BDF,$01 Terminator.
N $8BE0 "you have scored".
@ $8BE0 label=SystemMessage_9E
B $8BE0,$07 #TOKENS$07
B $8BE7,$01 Terminator.
N $8BE8 "you have scored 100% and have completed the entire adventure,
. congratulations".
@ $8BE8 label=SystemMessage_9F
B $8BE8,$28 #TOKENS$28
B $8C10,$01 Terminator.
N $8C11 "you have completed".
@ $8C11 label=SystemMessage_A0
B $8C11,$08 #TOKENS$08
B $8C19,$01 Terminator.
N $8C1A "% of the adventure, and have returned safely home".
@ $8C1A label=SystemMessage_A1
B $8C1A,$16 #TOKENS$16
B $8C30,$01 Terminator.
N $8C31 "it looks as if you could push it".
@ $8C31 label=SystemMessage_A2
B $8C31,$12 #TOKENS$12
B $8C43,$01 Terminator.
N $8C44 "not enough is reflected...".
@ $8C44 label=SystemMessage_A3
B $8C44,$0F #TOKENS$0F
B $8C53,$01 Terminator.
N $8C54 "it is phosphorescent.".
@ $8C54 label=SystemMessage_A4
B $8C54,$0A #TOKENS$0A
B $8C5E,$01 Terminator.
N $8C5F "you see nothing special".
@ $8C5F label=SystemMessage_A5
B $8C5F,$28 #TOKENS$28
B $8C87,$01 Terminator.
N $8C88 "it leaks".
@ $8C88 label=SystemMessage_A6
B $8C88,$04 #TOKENS$04
B $8C8C,$01 Terminator.
N $8C8D "Be more specific".
@ $8C8D label=SystemMessage_A7
B $8C8D,$0A #TOKENS$0A
B $8C97,$01 Terminator.
N $8C98 "Some form of electrical control".
@ $8C98 label=SystemMessage_A8
B $8C98,$12 #TOKENS$12
B $8CAA,$01 Terminator.
N $8CAB "An explosive spell".
@ $8CAB label=SystemMessage_A9
B $8CAB,$0D #TOKENS$0D
B $8CB8,$01 Terminator.
N $8CB9 "Opposite of a curse".
@ $8CB9 label=SystemMessage_AA
B $8CB9,$0B #TOKENS$0B
B $8CC4,$01 Terminator.
N $8CC5 "See the cassette box for details of hint sheets".
@ $8CC5 label=SystemMessage_AB
B $8CC5,$1C #TOKENS$1C
B $8CE1,$01 Terminator.
N $8CE2 Unused bytes after the last terminator.
B $8CE2,$04

t $8CE6 Object Text
@ $8CE6 label=ObjectText
D $8CE6 #BUILDICT Phrases printed for objects and scenery, 165 of them, in the
. same terminated-token form as the system messages. Each byte is a token into
. #R$B1BC, and a message ends at #N$5E or #N$7E. The location lister and the
. inventory use them.
N $8CE6 Object #N($00), ". above me is a window".
B $8CE6,$0B #TOKENS$0B
B $8CF1,$01 Terminator.
N $8CF2 Object #N($01), ". A huge stone statue stands against the wall".
B $8CF2,$12 #TOKENS$12
B $8D04,$01 Terminator.
N $8D05 Object #N($02), " and it has been moved to reveal a hole leading down".
B $8D05,$15 #TOKENS$15
B $8D1A,$01 Terminator.
N $8D1B Object #N($03), ". There is a red pentacle on the floor".
B $8D1B,$0B #TOKENS$0B
B $8D26,$01 Terminator.
N $8D27 Object #N($04), ". A thirty foot wide fissure bars the way east".
B $8D27,$11 #TOKENS$11
B $8D38,$01 Terminator.
N $8D39 Object #N($05), " but it has been bridged with a stone pillar".
B $8D39,$11 #TOKENS$11
B $8D4A,$01 Terminator.
N $8D4B Object #N($06), ". A thirty foot wide fissure bars the way west".
B $8D4B,$12 #TOKENS$12
B $8D5D,$01 Terminator.
N $8D5E Object #N($07),
. " and a giant snake is crawling along the pillar that bridges it".
B $8D5E,$1D #TOKENS$1D
B $8D7B,$01 Terminator.
N $8D7C Object #N($08), ". A tripwire is carefully set along the floor".
B $8D7C,$16 #TOKENS$16
B $8D92,$01 Terminator.
N $8D93 Object #N($09), ". There is a locked door to the south".
B $8D93,$0C #TOKENS$0C
B $8D9F,$01 Terminator.
N $8DA0 Object #N($0A), ". There is a closed door to the south".
B $8DA0,$0D #TOKENS$0D
B $8DAD,$01 Terminator.
N $8DAE Object #N($0B), ". An open door leads south into a room".
B $8DAE,$11 #TOKENS$11
B $8DBF,$01 Terminator.
N $8DC0 Object #N($0C), ". You can go east through a broken down door".
B $8DC0,$15 #TOKENS$15
B $8DD5,$01 Terminator.
N $8DD6 Object #N($0D), ". You can go west through a broken down door".
B $8DD6,$16 #TOKENS$16
B $8DEC,$01 Terminator.
N $8DED Object #N($0E), ". A wizard is hung from a rope here".
B $8DED,$0E #TOKENS$0E
B $8DFB,$01 Terminator.
N $8DFC Object #N($0F),
. ". A metal ring for tying prisoners to is set into the wall".
B $8DFC,$18 #TOKENS$18
B $8E14,$01 Terminator.
N $8E15 Object #N($10), ". A secret passage exits through one wall".
B $8E15,$11 #TOKENS$11
B $8E26,$01 Terminator.
N $8E27 Object #N($11), ". At the end of the passage is a huge stone".
B $8E27,$0C #TOKENS$0C
B $8E33,$01 Terminator.
N $8E34 Object #N($12), ". A sword is set deep into the stone".
B $8E34,$0F #TOKENS$0F
B $8E43,$01 Terminator.
N $8E44 Object #N($13), ". A boulder blocks the way east".
B $8E44,$0C #TOKENS$0C
B $8E50,$01 Terminator.
N $8E51 Object #N($14), ". A narrow hole leads into a passage".
B $8E51,$0E #TOKENS$0E
B $8E5F,$01 Terminator.
N $8E60 Object #N($15), " which has been widened".
B $8E60,$0B #TOKENS$0B
B $8E6B,$01 Terminator.
N $8E6C Object #N($16), ". There is a locked door to the east".
B $8E6C,$0C #TOKENS$0C
B $8E78,$01 Terminator.
N $8E79 Object #N($17), ". Suspended in the centre of the room, protected by a
. forcefield is a magical rod".
B $8E79,$24 #TOKENS$24
B $8E9D,$01 Terminator.
N $8E9E Object #N($18), ". A secret passage leads into a room".
B $8E9E,$0C #TOKENS$0C
B $8EAA,$01 Terminator.
N $8EAB Object #N($19),
. ". An ogre is stomping backwards and forwards across the room below".
B $8EAB,$1E #TOKENS$1E
B $8EC9,$01 Terminator.
N $8ECA Object #N($1A), ". A door leads out, it is ".
B $8ECA,$0A #TOKENS$0A
B $8ED4,$01 Terminator.
N $8ED5 Object #N($1B), "locked".
B $8ED5,$03 #TOKENS$03
B $8ED8,$01 Terminator.
N $8ED9 Object #N($1C), "shut".
B $8ED9,$04 #TOKENS$04
B $8EDD,$01 Terminator.
N $8EDE Object #N($1D), "open".
B $8EDE,$02 #TOKENS$02
B $8EE0,$01 Terminator.
N $8EE1 Object #N($1E), ". A".
B $8EE1,$02 #TOKENS$02
B $8EE3,$01 Terminator.
N $8EE4 Object #N($1F), " knotted".
B $8EE4,$05 #TOKENS$05
B $8EE9,$01 Terminator.
N $8EEA Object #N($20), " rope spans the fissure".
B $8EEA,$0A #TOKENS$0A
B $8EF4,$01 Terminator.
N $8EF5 Object #N($21), ". A".
B $8EF5,$02 #TOKENS$02
B $8EF7,$01 Terminator.
N $8EF8 Object #N($22), " knotted".
B $8EF8,$05 #TOKENS$05
B $8EFD,$01 Terminator.
N $8EFE Object #N($23), " rope spans the fissure".
B $8EFE,$0A #TOKENS$0A
B $8F08,$01 Terminator.
N $8F09 Object #N($24), ". There is a hole in the ground".
B $8F09,$09 #TOKENS$09
B $8F12,$01 Terminator.
N $8F13 Object #N($25), " full of lava".
B $8F13,$07 #TOKENS$07
B $8F1A,$01 Terminator.
N $8F1B Object #N($26), " bridged by a plank".
B $8F1B,$08 #TOKENS$08
B $8F23,$01 Terminator.
N $8F24 Object #N($27), " crossed by a metal drawbridge".
B $8F24,$11 #TOKENS$11
B $8F35,$01 Terminator.
N $8F36 Object #N($28), " seperates the room from a gateway".
B $8F36,$0F #TOKENS$0F
B $8F45,$01 Terminator.
N $8F46 Object #N($29),
. " which has a drawbridge in the up position in front of it".
B $8F46,$1C #TOKENS$1C
B $8F62,$01 Terminator.
N $8F63 Object #N($2A),
. ". The air around you is vibrating with a strange sound".
B $8F63,$16 #TOKENS$16
B $8F79,$01 Terminator.
N $8F7A Object #N($2B), "up".
B $8F7A,$01 #TOKENS$01
B $8F7B,$01 Terminator.
N $8F7C Object #N($2C), "down".
B $8F7C,$03 #TOKENS$03
B $8F7F,$01 Terminator.
N $8F80 Object #N($2D), ". Tentacles of slime are reaching out towards me from a
. pit of oily slime".
B $8F80,$1E #TOKENS$1E
B $8F9E,$01 Terminator.
N $8F9F Object #N($2E), ". There is a pit of oily slime in the floor".
B $8F9F,$0D #TOKENS$0D
B $8FAC,$01 Terminator.
N $8FAD Object #N($2F), ". There is a pit in the floor".
B $8FAD,$07 #TOKENS$07
B $8FB4,$01 Terminator.
N $8FB5 Object #N($30), ". You are surrounded by a spirals of strange colours
. that seem to reach into your mind".
B $8FB5,$24 #TOKENS$24
B $8FD9,$01 Terminator.
N $8FDA Object #N($31), " concealing a secret passage".
B $8FDA,$0B #TOKENS$0B
B $8FE5,$01 Terminator.
N $8FE6 Object #N($32), "open, revealing what is in fact a room beyond".
B $8FE6,$16 #TOKENS$16
B $8FFC,$01 Terminator.
N $8FFD Object #N($33), ". A flagstone in the floor is broken".
B $8FFD,$0C #TOKENS$0C
B $9009,$01 Terminator.
N $900A Object #N($34), "a crystal bridge spans the pit of lava".
B $900A,$0F #TOKENS$0F
B $9019,$01 Terminator.
N $901A Object #N($35), "a crystal bridge spans the pit of lava".
B $901A,$0F #TOKENS$0F
B $9029,$01 Terminator.
N $902A Object #N($36), "broken ".
B $902A,$04 #TOKENS$04
B $902E,$01 Terminator.
N $902F Object #N($37), "grille in the floor".
B $902F,$06 #TOKENS$06
B $9035,$01 Terminator.
N $9036 Object #N($38), ". Puddles of slime cover the floor".
B $9036,$0E #TOKENS$0E
B $9044,$01 Terminator.
N $9045 Object #N($39), ". A ball of flame is streaking towards me".
B $9045,$10 #TOKENS$10
B $9055,$01 Terminator.
N $9056 Object #N($3A), ". A tunnel leads beneath the snow".
B $9056,$0F #TOKENS$0F
B $9065,$01 Terminator.
N $9066 Object #N($3B), ". Masses of snow is piled up the sides of the pass".
B $9066,$12 #TOKENS$12
B $9078,$01 Terminator.
N $9079 Object #N($3C),
. ". A wall of intense blinding light is coming towards me".
B $9079,$15 #TOKENS$15
B $908E,$01 Terminator.
N $908F Object #N($3D), "shut".
B $908F,$04 #TOKENS$04
B $9093,$01 Terminator.
N $9094 Object #N($3E), ". An avalanche is sweeping towards me".
B $9094,$11 #TOKENS$11
B $90A5,$01 Terminator.
N $90A6 Object #N($3F), ". Huge piles of snow cover the floor of the pass".
B $90A6,$10 #TOKENS$10
B $90B6,$01 Terminator.
N $90B7 Object #N($40),
. "a flagstone has been moved to reveal a hole leading into darkness".
B $90B7,$1F #TOKENS$1F
B $90D6,$01 Terminator.
N $90D7 Object #N($41), ". A lightning bolt is arcing towards you".
B $90D7,$10 #TOKENS$10
B $90E7,$01 Terminator.
N $90E8 Object #N($42), ". A demon stands glaring at you".
B $90E8,$0D #TOKENS$0D
B $90F5,$01 Terminator.
N $90F6 Object #N($43), ". You are surrounded by a cloud of thick vapours".
B $90F6,$19 #TOKENS$19
B $910F,$01 Terminator.
N $9110 Object #N($44), ". The very air around me is crystalising".
B $9110,$12 #TOKENS$12
B $9122,$01 Terminator.
N $9123 Object #N($45),
. ". There is a hole in the roof, through which light streams".
B $9123,$17 #TOKENS$17
B $913A,$01 Terminator.
N $913B Object #N($46), "some slush, ".
B $913B,$09 #TOKENS$09
B $9144,$01 Terminator.
N $9145 Object #N($47), "rock, ".
B $9145,$03 #TOKENS$03
B $9148,$01 Terminator.
N $9149 Object #N($48), "dead priest, ".
B $9149,$06 #TOKENS$06
B $914F,$01 Terminator.
N $9150 Object #N($49), "brass key, ".
B $9150,$08 #TOKENS$08
B $9158,$01 Terminator.
N $9159 Object #N($4A), "soap, ".
B $9159,$05 #TOKENS$05
B $915E,$01 Terminator.
N $915F Object #N($4B), "polish, ".
B $915F,$06 #TOKENS$06
B $9165,$01 Terminator.
N $9166 Object #N($4C), "sixty foot pillar, ".
B $9166,$0C #TOKENS$0C
B $9172,$01 Terminator.
N $9173 Object #N($4D), "giant snake, ".
B $9173,$08 #TOKENS$08
B $917B,$01 Terminator.
N $917C Object #N($4E), "power stone, ".
B $917C,$06 #TOKENS$06
B $9182,$01 Terminator.
N $9183 Object #N($4F), "vampire, ".
B $9183,$05 #TOKENS$05
B $9188,$01 Terminator.
N $9189 Object #N($50), "bright red wand, ".
B $9189,$08 #TOKENS$08
B $9191,$01 Terminator.
N $9192 Object #N($51), "power stone, ".
B $9192,$06 #TOKENS$06
B $9198,$01 Terminator.
N $9199 Object #N($52), "rope ".
B $9199,$03 #TOKENS$03
B $919C,$01 Terminator.
N $919D Object #N($53), "body, ".
B $919D,$04 #TOKENS$04
B $91A1,$01 Terminator.
N $91A2 Object #N($54), "wet ".
B $91A2,$03 #TOKENS$03
B $91A5,$01 Terminator.
N $91A6 Object #N($55), "black robe, ".
B $91A6,$07 #TOKENS$07
B $91AD,$01 Terminator.
N $91AE Object #N($56), "ghoul, ".
B $91AE,$03 #TOKENS$03
B $91B1,$01 Terminator.
N $91B2 Object #N($57), "power stone, ".
B $91B2,$06 #TOKENS$06
B $91B8,$01 Terminator.
N $91B9 Object #N($58), "dark hooded figure, ".
B $91B9,$0D #TOKENS$0D
B $91C6,$01 Terminator.
N $91C7 Object #N($59), "chair, ".
B $91C7,$03 #TOKENS$03
B $91CA,$01 Terminator.
N $91CB Object #N($5A), "scroll, ".
B $91CB,$06 #TOKENS$06
B $91D1,$01 Terminator.
N $91D2 Object #N($5B), "dead wizard, ".
B $91D2,$05 #TOKENS$05
B $91D7,$01 Terminator.
N $91D8 Object #N($5C), "strength spell, ".
B $91D8,$06 #TOKENS$06
B $91DE,$01 Terminator.
N $91DF Object #N($5D), "ogre, ".
B $91DF,$04 #TOKENS$04
B $91E3,$01 Terminator.
N $91E4 Object #N($5E), "sinister coffin, ".
B $91E4,$08 #TOKENS$08
B $91EC,$01 Terminator.
N $91ED Object #N($5F), "garlic, ".
B $91ED,$05 #TOKENS$05
B $91F2,$01 Terminator.
N $91F3 Object #N($60), "The Rod Of Power, ".
B $91F3,$0E #TOKENS$0E
B $9201,$01 Terminator.
N $9202 Object #N($61), "earth spell, ".
B $9202,$03 #TOKENS$03
B $9205,$01 Terminator.
N $9206 Object #N($62), "metal ring, ".
B $9206,$06 #TOKENS$06
B $920C,$01 Terminator.
N $920D Object #N($63), "sceptre, ".
B $920D,$06 #TOKENS$06
B $9213,$01 Terminator.
N $9214 Object #N($64), "boulder, ".
B $9214,$05 #TOKENS$05
B $9219,$01 Terminator.
N $921A Object #N($65), "glowing rock, ".
B $921A,$06 #TOKENS$06
B $9220,$01 Terminator.
N $9221 Object #N($66), "open coffin, ".
B $9221,$06 #TOKENS$06
B $9227,$01 Terminator.
N $9228 Object #N($67), "sword, ".
B $9228,$05 #TOKENS$05
B $922D,$01 Terminator.
N $922E Object #N($68), "large shield, ".
B $922E,$08 #TOKENS$08
B $9236,$01 Terminator.
N $9237 Object #N($69), "knotted ".
B $9237,$04 #TOKENS$04
B $923B,$01 Terminator.
N $923C Object #N($6A), "rope, ".
B $923C,$03 #TOKENS$03
B $923F,$01 Terminator.
N $9240 Object #N($6B), "with a ring tied to it, ".
B $9240,$08 #TOKENS$08
B $9248,$01 Terminator.
N $9249 Object #N($6C), "sceptre, ".
B $9249,$06 #TOKENS$06
B $924F,$01 Terminator.
N $9250 Object #N($6D), "body, ".
B $9250,$04 #TOKENS$04
B $9254,$01 Terminator.
N $9255 Object #N($6E), "open ".
B $9255,$03 #TOKENS$03
B $9258,$01 Terminator.
N $9259 Object #N($6F), "closed ".
B $9259,$04 #TOKENS$04
B $925D,$01 Terminator.
N $925E Object #N($70), "metal tin, ".
B $925E,$06 #TOKENS$06
B $9264,$01 Terminator.
N $9265 Object #N($71), "earth spell, ".
B $9265,$03 #TOKENS$03
B $9268,$01 Terminator.
N $9269 Object #N($72), "bucket made of antimagic stone, ".
B $9269,$12 #TOKENS$12
B $927B,$01 Terminator.
N $927C Object #N($73), "full of slime, ".
B $927C,$08 #TOKENS$08
B $9284,$01 Terminator.
N $9285 Object #N($74), "chalk, ".
B $9285,$04 #TOKENS$04
B $9289,$01 Terminator.
N $928A Object #N($75), "chalk pentagram on the floor, ".
B $928A,$0B #TOKENS$0B
B $9295,$01 Terminator.
N $9296 Object #N($76), "sleeping giant, ".
B $9296,$09 #TOKENS$09
B $929F,$01 Terminator.
N $92A0 Object #N($77), "magic harp, ".
B $92A0,$08 #TOKENS$08
B $92A8,$01 Terminator.
N $92A9 Object #N($78), "the evil wizard, ".
B $92A9,$07 #TOKENS$07
B $92B0,$01 Terminator.
N $92B1 Object #N($79), "magic orb, ".
B $92B1,$07 #TOKENS$07
B $92B8,$01 Terminator.
N $92B9 Object #N($7A), "The Crown Of The Mountains, ".
B $92B9,$13 #TOKENS$13
B $92CC,$01 Terminator.
N $92CD Object #N($7B), "gold bar, ".
B $92CD,$07 #TOKENS$07
B $92D4,$01 Terminator.
N $92D5 Object #N($7C), "diamond, ".
B $92D5,$06 #TOKENS$06
B $92DB,$01 Terminator.
N $92DC Object #N($7D), "blast spell, ".
B $92DC,$04 #TOKENS$04
B $92E0,$01 Terminator.
N $92E1 Object #N($7E), "blast spell, ".
B $92E1,$04 #TOKENS$04
B $92E5,$01 Terminator.
N $92E6 Object #N($7F), "plank, ".
B $92E6,$04 #TOKENS$04
B $92EA,$01 Terminator.
N $92EB Object #N($80), "teleport spell, ".
B $92EB,$07 #TOKENS$07
B $92F2,$01 Terminator.
N $92F3 Object #N($81), "wind spell, ".
B $92F3,$03 #TOKENS$03
B $92F6,$01 Terminator.
N $92F7 Object #N($82), "yeti, ".
B $92F7,$04 #TOKENS$04
B $92FB,$01 Terminator.
N $92FC Object #N($83), "body, ".
B $92FC,$04 #TOKENS$04
B $9300,$01 Terminator.
N $9301 Object #N($84), "snowshoes, ".
B $9301,$05 #TOKENS$05
B $9306,$01 Terminator.
N $9307 Object #N($85), "yeti skin, ".
B $9307,$07 #TOKENS$07
B $930E,$01 Terminator.
N $930F Object #N($86), "several border guards, ".
B $930F,$0D #TOKENS$0D
B $931C,$01 Terminator.
N $931D Object #N($87), "holy priest, ".
B $931D,$06 #TOKENS$06
B $9323,$01 Terminator.
N $9324 Object #N($88), "bless spell, ".
B $9324,$05 #TOKENS$05
B $9329,$01 Terminator.
N $932A Object #N($89), "shatter spell, ".
B $932A,$05 #TOKENS$05
B $932F,$01 Terminator.
N $9330 Object #N($8A), "dead wizard, ".
B $9330,$05 #TOKENS$05
B $9335,$01 Terminator.
N $9336 Object #N($8B), "crate, ".
B $9336,$03 #TOKENS$03
B $9339,$01 Terminator.
N $933A Object #N($8C), "mystic book, ".
B $933A,$08 #TOKENS$08
B $9342,$01 Terminator.
N $9343 Object #N($8D), "ice wall spell, ".
B $9343,$04 #TOKENS$04
B $9347,$01 Terminator.
N $9348 Object #N($8E), "small silver obelisk, ".
B $9348,$0D #TOKENS$0D
B $9355,$01 Terminator.
N $9356 Object #N($8F), "".
B $9356,$01 Terminator.
N $9357 Object #N($90), "mind shield spell, ".
B $9357,$07 #TOKENS$07
B $935E,$01 Terminator.
N $935F Object #N($91), "skinned yeti, ".
B $935F,$09 #TOKENS$09
B $9368,$01 Terminator.
N $9369 Object #N($92), "dead yeti, ".
B $9369,$07 #TOKENS$07
B $9370,$01 Terminator.
N $9371 Object #N($93), "".
B $9371,$01 Terminator.
N $9372 Object #N($94), "".
B $9372,$01 Terminator.
N $9373 Object #N($95), "".
B $9373,$01 Terminator.
N $9374 Object #N($96), "".
B $9374,$01 Terminator.
N $9375 Object #N($97), "".
B $9375,$01 Terminator.
N $9376 Object #N($98), "".
B $9376,$01 Terminator.
N $9377 Object #N($99), "".
B $9377,$01 Terminator.
N $9378 Object #N($9A), "".
B $9378,$01 Terminator.
N $9379 Object #N($9B), "".
B $9379,$01 Terminator.
N $937A Object #N($9C), "".
B $937A,$01 Terminator.
N $937B Object #N($9D), "".
B $937B,$01 Terminator.
N $937C Object #N($9E), "".
B $937C,$01 Terminator.
N $937D Object #N($9F), "".
B $937D,$01 Terminator.
N $937E Object #N($A0), "".
B $937E,$01 Terminator.
N $937F Object #N($A1), "".
B $937F,$01 Terminator.
N $9380 Object #N($A2), "".
B $9380,$01 Terminator.
N $9381 Object #N($A3), "".
B $9381,$01 Terminator.
N $9382 Object #N($A4), "".
B $9382,$01 Terminator.

u $9383
B $9383,$2E9

u $966C
B $966C,$6D

b $96D9 High-Priority Scripts
@ $96D9 label=PriorityScripts
D $96D9 Bytecode run at the start of every turn, before the player's command is
. considered. #R$6058 points here and #R$6074 performs each line; #R$6155
. matches every line, so there is no verb or noun. Conditions follow while bit 7
. is clear, then actions while bit 7 is set. #N$7F ends the table. Action bit 6
. stops the runner after that action.
N $96D9 Flag #R$5D95(#N$0E) is not zero, object #N$46 is held or here.
  $96D9,$02 #R$67A9 #R$5D95(#N$0E).
  $96DB,$02 #R$6709 "#R$913B(some slush)".
  $96DD,$02 #R$695D "#R$913B(some slush)".
  $96DF,$02 #R$63E6 "#R$8BD6(the slush melts)".
N $96E1 Flag #R$5DA8(#N$21) equals #N($02), object #N$59 is not here.
  $96E1,$03 #R$67B1 #R$5DA8(#N$21) and #N$02.
  $96E4,$02 #R$6726 "#R$91C7(chair)".
  $96E6,$02 #R$69E2 #R$5DA8(#N$21).
  $96E8,$02 #R$63E6 "#R$88F0(you get off the chair.)".
N $96EA Flag #R$5DA8(#N$21) equals #N($01), object #N$8B is not here.
  $96EA,$03 #R$67B1 #R$5DA8(#N$21) and #N$01.
  $96ED,$02 #R$6726 "#R$9336(crate)".
  $96EF,$02 #R$69E2 #R$5DA8(#N$21).
  $96F1,$02 #R$63E6 "#R$88FA(you get off the crate.)".
N $96F3 Room #N$00.
  $96F3,$02 #R$66EB #R$75CE(#N$00).
  $96F5,$01 #R$6924.
N $96F6 Room #N$00.
  $96F6,$02 #R$66EB #R$75CE(#N$00).
  $96F8,$02 #R$6892 #R$7B7A(#N$44), then stop.
N $96FA Object #N$56 is here.
  $96FA,$02 #R$6713 "#R$91AE(ghoul)".
  $96FC,$02 #R$63E6 "#R$8128(the ghoul tears you apart and begins to eat.)".
  $96FE,$01 #R$685B.
N $96FF Object #N$56 is not held or here, object #N$56 is somewhere.
  $96FF,$02 #R$671A "#R$91AE(ghoul)".
  $9701,$02 #R$672D "#R$91AE(ghoul)".
  $9703,$02 #R$6965 "#R$91AE(ghoul)".
  $9705,$02 #R$63E6 "#R$811D(the ghoul is chasing you.)".
N $9707 Room #N($20), object #N$55 is not worn.
  $9707,$02 #R$66EB
. "#R$7868(you are in the library, surrounded by empty bookcases)".
  $9709,$02 #R$6747 "#R$91A6(black robe)".
  $970B,$02 #R$63E6 "#R$8191(the dark figure throws you out of the library.)".
  $970D,$02 #R$6892 "#R$785C(you are in a small entry chamber)".
N $970F Room #N($27), object #N$68 is not held or here.
  $970F,$02 #R$66EB #R$7902(#N$27).
  $9711,$02 #R$671A "#R$922E(large shield)".
  $9713,$02 #R$63E6 "#R$80B7(the fierce heat drives you back.)".
  $9715,$02 #R$6892 #R$78BF(#N$24).
N $9717 Room #N($28), object #N$68 is not held or here.
  $9717,$02 #R$66EB "#R$791B(you are at the end of the path)".
  $9719,$02 #R$671A "#R$922E(large shield)".
  $971B,$02 #R$63E6 "#R$80B7(the fierce heat drives you back.)".
  $971D,$02 #R$6892 #R$78BF(#N$24).
N $971F Room above #N($26), room below #N$29.
  $971F,$02 #R$66F9 "#R$78EE(you are in an inscribed rune covered chamber)".
  $9721,$02 #R$6702 #R$7925(#N$29).
  $9723,$02 #R$63E6
. "#R$80F1(the shield protects you from the worst of the heat.)".
N $9725 Object #N$17 is here, object #N$57 is here, object #N$51 is here, object
. #N$4E is here.
  $9725,$02 #R$6713 #R$8E79(#N$17).
  $9727,$02 #R$6713 "#R$91B2(power stone)".
  $9729,$02 #R$6713 "#R$9192(power stone)".
  $972B,$02 #R$6713 "#R$917C(power stone)".
  $972D,$03 #R$69BF #R$8E79(#N$17) and "#R$91F3(The Rod Of Power)".
  $9730,$02 #R$63E6
. "#R$8087(the rod drops to the floor as the forcefield vanishes.)".
N $9732 Object #N$5D is here.
  $9732,$02 #R$6713 "#R$91DF(ogre)".
  $9734,$02 #R$63E6 "#R$8276(the ogre decides to redesign your head ....)".
  $9736,$01 #R$685B.
N $9737 Flag #R$5D9A(#N$13) is not zero.
  $9737,$02 #R$67A9 #R$5D9A(#N$13).
  $9739,$03 #R$69FE #R$5D9A(#N$13) and #N$01.
N $973C Flag #R$5D9A(#N$13) equals #N$01.
  $973C,$03 #R$67B1 #R$5D9A(#N$13) and #N$01.
  $973F,$02 #R$63E6 "#R$828F(the strength spell ends.)".
N $9741 Flag #R$5D9A(#N$13) equals #N($01), object #N$64 is carried.
  $9741,$03 #R$67B1 #R$5D9A(#N$13) and #N$01.
  $9744,$02 #R$6739 "#R$9214(boulder)".
  $9746,$02 #R$63E6 "#R$824B(you drop the boulder.)".
  $9748,$02 #R$68E4 "#R$9214(boulder)".
N $974A Object #N$47 is held or here, room #N$04.
  $974A,$02 #R$6709 "#R$9145(rock)".
  $974C,$02 #R$66EB #R$76BC(#N$04).
  $974E,$03 #R$69BF "#R$9145(rock)" and "#R$921A(glowing rock)".
N $9751 Object #N$4F is held or here, object #N$5F is not carried.
  $9751,$02 #R$6709 "#R$9183(vampire)".
  $9753,$02 #R$674E "#R$91ED(garlic)".
  $9755,$02 #R$63E6 #R$8380(#N$4E).
  $9757,$01 #R$685B.
N $9758 Object #N$4F is held or here.
  $9758,$02 #R$6709 "#R$9183(vampire)".
  $975A,$02 #R$63E6
. "#R$8368(the vampire is trying to keep away from the garlic.)".
N $975C Room #N($13), flag #R$5D9B(#N$14) is zero.
  $975C,$02 #R$66EB "#R$77CF(you are in a large rest chamber)".
  $975E,$02 #R$67A1 #R$5D9B(#N$14).
  $9760,$02 #R$69DB #R$5D9B(#N$14).
  $9762,$03 #R$696C #N$00 and #N$00.
  $9765,$02 #R$63E6 #R$83A0(#N$4F).
N $9767 Object #N$4D is here, flag #R$5D9C(#N$15) is not zero.
  $9767,$02 #R$6713 "#R$9173(giant snake)".
  $9769,$02 #R$67A9 #R$5D9C(#N$15).
  $976B,$02 #R$63E6 #R$840F(#N$50).
  $976D,$01 #R$685B.
N $976E Object #N$4D is here.
  $976E,$02 #R$6713 "#R$9173(giant snake)".
  $9770,$02 #R$69DB #R$5D9C(#N$15).
N $9772 Object #N$07 is here, flag #R$5D9D(#N$16) is not zero.
  $9772,$02 #R$6713 #R$8D5E(#N$07).
  $9774,$02 #R$67A9 #R$5D9D(#N$16).
  $9776,$02 #R$63E6 #R$840F(#N$50).
  $9778,$01 #R$685B.
N $9779 Object #N$07 is here.
  $9779,$02 #R$6713 #R$8D5E(#N$07).
  $977B,$02 #R$69DB #R$5D9D(#N$16).
N $977D Room #N$2E.
  $977D,$02 #R$66EB #R$7995(#N$2E).
  $977F,$02 #R$63E6 "#R$852A(the zombie guards rip me to pieces.)".
  $9781,$01 #R$685B.
N $9782 Object #N$38 is here.
  $9782,$02 #R$6713 "#R$9036(Puddles of slime cover the floor)".
  $9784,$02 #R$63E6 #R$84D7(#N$59).
  $9786,$01 #R$685B.
N $9787 Object #N$77 is carried, object #N$76 is held or here.
  $9787,$02 #R$6739 "#R$92A0(magic harp)".
  $9789,$02 #R$6709 "#R$9296(sleeping giant)".
  $978B,$02 #R$63E6 #R$853E(#N$60).
  $978D,$01 #R$685B.
N $978E Flag #R$5D9F(#N$18) equals #N($04), object #N$2F is nowhere.
  $978E,$03 #R$67B1 #R$5D9F(#N$18) and #N$04.
  $9791,$02 #R$6733 "#R$8FAD(There is a pit in the floor)".
  $9793,$03 #R$69BF
. "#R$8F9F(There is a pit of oily slime in the floor)" and
. "#R$8FAD(There is a pit in the floor)".
N $9796 Room #N($36), object #N$72 is held or here.
  $9796,$02 #R$66EB
. "#R$7A74(you are in the canyon on the east bank of the stream)".
  $9798,$02 #R$6709 "#R$9269(bucket made of antimagic stone)".
  $979A,$02 #R$63E6 "#R$858F(the bucket is too wide to fit down the passage.)".
  $979C,$02 #R$6892 "#R$7AA4(you are in a wet dripping cave)".
N $979E Room #N($39), object #N$2D is somewhere.
  $979E,$02 #R$66EB "#R$7AAF(you are in an arched entry hall)".
  $97A0,$02 #R$672D #R$8F80(#N$2D).
  $97A2,$02 #R$63E6 #R$84D7(#N$59).
  $97A4,$01 #R$685B.
N $97A5 Object #N$25 is held or here, object #N$26 is held or here.
  $97A5,$02 #R$6709 "#R$8F13(full of lava)".
  $97A7,$02 #R$6709 "#R$8F1B(bridged by a plank)".
  $97A9,$02 #R$63E6 "#R$866D(the plank burns up in the heat of the lava.)".
  $97AB,$02 #R$695D "#R$8F1B(bridged by a plank)".
N $97AD Object #N$25 is somewhere.
  $97AD,$02 #R$672D "#R$8F13(full of lava)".
  $97AF,$02 #R$695D "#R$8F1B(bridged by a plank)".
N $97B1 Object #N$25 is nowhere.
  $97B1,$02 #R$6733 "#R$8F13(full of lava)".
  $97B3,$03 #R$69F4 #R$5DA1(#N$1A) and #N$01.
N $97B6 Room above #N($31), room below #N($35), not room #N($33), object #N$25
. is nowhere.
  $97B6,$02 #R$66F9 #R$79DF(#N$31).
  $97B8,$02 #R$6702 "#R$7A63(you are in a narrow canyon beside a stream)".
  $97BA,$02 #R$66F2 "#R$7A1E(you are in a large cave, at the east end.)".
  $97BC,$02 #R$6733 "#R$8F13(full of lava)".
  $97BE,$02 #R$63E6 "#R$86BC(the lava is rising fast behind the dam.)".
N $97C0 Flag #R$5DA1(#N$1A) equals #N$06.
  $97C0,$03 #R$67B1 #R$5DA1(#N$1A) and #N$06.
  $97C3,$02 #R$63E6 #R$867E(#N$6B).
  $97C5,$01 #R$685B.
N $97C6 Object #N$7D is nowhere, object #N$7E is somewhere.
  $97C6,$02 #R$6733 "#R$92DC(blast spell)".
  $97C8,$02 #R$672D "#R$92E1(blast spell)".
  $97CA,$03 #R$69BF "#R$92DC(blast spell)" and "#R$92E1(blast spell)".
N $97CD Object #N$55 is not worn, flag #R$5D95(#N$0E) is zero.
  $97CD,$02 #R$6747 "#R$91A6(black robe)".
  $97CF,$02 #R$67A1 #R$5D95(#N$0E).
  $97D1,$03 #R$69F4 #R$5DA2(#N$1B) and #N$01.
N $97D4 Room #N$51.
  $97D4,$02 #R$66EB #R$7C35(#N$51).
  $97D6,$02 #R$69DB #R$5D95(#N$0E).
N $97D8 Room #N$50.
  $97D8,$02 #R$66EB "#R$7C2D(you are in a rocky pass)".
  $97DA,$02 #R$69E2 #R$5D95(#N$0E).
N $97DC Flag #R$5DA2(#N$1B) is below #N($06), flag #R$5D95(#N$0E) is zero,
. object #N$55 is not
. worn.
  $97DC,$03 #R$67BF #R$5DA2(#N$1B) and #N$06.
  $97DF,$02 #R$67A1 #R$5D95(#N$0E).
  $97E1,$02 #R$6747 "#R$91A6(black robe)".
  $97E3,$02 #R$63E6 "#R$86CC(you are freezing.)".
N $97E5 Flag #R$5DA2(#N$1B) is below #N($0F), flag #R$5D95(#N$0E) is zero,
. object #N$55 is not
. worn.
  $97E5,$03 #R$67BF #R$5DA2(#N$1B) and #N$0F.
  $97E8,$02 #R$67A1 #R$5D95(#N$0E).
  $97EA,$02 #R$6747 "#R$91A6(black robe)".
  $97EC,$02 #R$63E6 "#R$86D4(you have frozen to death.)".
  $97EE,$01 #R$685B.
N $97EF Object #N$3E is held or here.
  $97EF,$02 #R$6709 "#R$9094(An avalanche is sweeping towards me)".
  $97F1,$02 #R$63E6 "#R$86E1(you are buried deep in the snow.)".
  $97F3,$01 #R$685B.
N $97F4 Object #N$3E is somewhere.
  $97F4,$02 #R$672D "#R$9094(An avalanche is sweeping towards me)".
  $97F6,$03 #R$69BF
. "#R$9094(An avalanche is sweeping towards me)" and
. "#R$90A6(Huge piles of snow cover the floor of the pass)".
N $97F9 Flag #R$5DA3(#N$1C) is not zero.
  $97F9,$02 #R$67A9 #R$5DA3(#N$1C).
  $97FB,$02 #R$69E2 #R$5DA3(#N$1C).
  $97FD,$02 #R$6965 "#R$9094(An avalanche is sweeping towards me)".
  $97FF,$02 #R$63E6 #R$86EC(#N$70).
  $9801,$02 #R$695D "#R$92F7(yeti)".
N $9803 Room #N($4B), object #N$84 is not worn, flag #R$5DA4(#N$1D) is not zero,
. object
. #N$3F is somewhere.
  $9803,$02 #R$66EB "#R$7BF5(you are in a snowy pass)".
  $9805,$02 #R$6747 "#R$9301(snowshoes)".
  $9807,$02 #R$67A9 #R$5DA4(#N$1D).
  $9809,$02 #R$672D "#R$90A6(Huge piles of snow cover the floor of the pass)".
  $980B,$02 #R$63E6 #R$875F(#N$74).
  $980D,$01 #R$685B.
  $980E,$02 #R$69E2 #R$5DA4(#N$1D).
N $9810 Room #N$4A.
  $9810,$02 #R$66EB
. "#R$7BE7(you are in a snowy pass. There is a cavemouth here)".
  $9812,$02 #R$69DB #R$5DA4(#N$1D).
N $9814 Object #N$3F is somewhere, object #N$82 is nowhere, object #N$91 is
. nowhere, object #N$92 is nowhere.
  $9814,$02 #R$672D "#R$90A6(Huge piles of snow cover the floor of the pass)".
  $9816,$02 #R$6733 "#R$92F7(yeti)".
  $9818,$02 #R$6733 "#R$935F(skinned yeti)".
  $981A,$02 #R$6733 "#R$9369(dead yeti)".
  $981C,$03 #R$69F4 #R$5DA5(#N$1E) and #N$01.
N $981F Flag #R$5DA7(#N$20) is not zero, flag #R$5DA6(#N$1F) is not zero,
. object #N$88 is nowhere.
  $981F,$02 #R$67A9 #R$5DA7(#N$20).
  $9821,$02 #R$67A9 #R$5DA6(#N$1F).
  $9823,$02 #R$6733 "#R$9324(bless spell)".
  $9825,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9828,$02 #R$6965 "#R$9324(bless spell)".
  $982A,$02 #R$63E6 #R$8942(#N$86).
N $982C Object #N$8F is held or here.
  $982C,$02 #R$6709 #R$9356(#N$8F).
  $982E,$01 #R$6B43.
  $982F,$02 #R$695D #R$9356(#N$8F).
  $9831,$02 #R$63E6 #R$8825(#N$7C).
  $9833,$02 #R$6899 #N$01.
N $9835 Room #N($50), object #N$86 is somewhere.
  $9835,$02 #R$66EB "#R$7C2D(you are in a rocky pass)".
  $9837,$02 #R$672D "#R$930F(several border guards)".
  $9839,$02 #R$63E6 #R$8878(#N$7E).
  $983B,$02 #R$6892 "#R$7C26(you are in a snowy pass)".
N $983D Object #N$86 is held or here, object #N$85 is worn.
  $983D,$02 #R$6709 "#R$930F(several border guards)".
  $983F,$02 #R$6740 "#R$9307(yeti skin)".
  $9841,$02 #R$63E6 "#R$88BC(the guards run off screaming 'YETI YETI'.)".
  $9843,$01 #R$6B43.
  $9844,$02 #R$6899 #N$02.
  $9846,$02 #R$695D "#R$930F(several border guards)".
N $9848 Object #N$65 is held or here, flag #R$5D88 is not zero.
  $9848,$02 #R$6709 "#R$921A(glowing rock)".
  $984A,$02 #R$67A9 #R$5D88.
  $984C,$02 #R$69E2 #R$5D88.
N $984E Room above #N($06), room below #N($27), object #N$65 is not held or
. here, flag #R$5D88 is zero.
  $984E,$02 #R$66F9 "#R$76E5(empty)".
  $9850,$02 #R$6702 #R$7902(#N$27).
  $9852,$02 #R$671A "#R$921A(glowing rock)".
  $9854,$02 #R$67A1 #R$5D88.
  $9856,$02 #R$69DB #R$5D88.
N $9858 Room above #N($28), room below #N($44), not room #N($40), not room
. #N($32), object #N$65 is not held or here, flag #R$5D88 is zero.
  $9858,$02 #R$66F9 "#R$791B(you are at the end of the path)".
  $985A,$02 #R$6702 #R$7B7A(#N$44).
  $985C,$02 #R$66F2 "#R$7B4E(you have ceased to exist)".
  $985E,$02 #R$66F2 "#R$7A0B(you are in a large cave. A huge deep channel)".
  $9860,$02 #R$671A "#R$921A(glowing rock)".
  $9862,$02 #R$67A1 #R$5D88.
  $9864,$02 #R$69DB #R$5D88.
N $9866 Room above #N($26), room below #N($29), flag #R$5D88 is not zero.
  $9866,$02 #R$66F9 "#R$78EE(you are in an inscribed rune covered chamber)".
  $9868,$02 #R$6702 #R$7925(#N$29).
  $986A,$02 #R$67A9 #R$5D88.
  $986C,$02 #R$69E2 #R$5D88.
N $986E Room #N($32), flag #R$5D88 is not zero.
  $986E,$02 #R$66EB "#R$7A0B(you are in a large cave. A huge deep channel)".
  $9870,$02 #R$67A9 #R$5D88.
  $9872,$02 #R$69E2 #R$5D88.
N $9874 Room below #N($07), flag #R$5D88 is not zero.
  $9874,$02 #R$6702 #R$76E9(#N$07).
  $9876,$02 #R$67A9 #R$5D88.
  $9878,$02 #R$69E2 #R$5D88.
N $987A Room above #N($5C), room below #N($6C), object #N$65 is not held or
. here, flag #R$5D88 is zero.
  $987A,$02 #R$66F9
. "#R$7D12(you are in a clearing beside a crystal clear pool)".
  $987C,$02 #R$6702 #R$AD4F(#N$6C).
  $987E,$02 #R$671A "#R$921A(glowing rock)".
  $9880,$02 #R$67A1 #R$5D88.
  $9882,$02 #R$69DB #R$5D88.
N $9884 Room below #N($5C), room above #N($43), flag #R$5D88 is not zero.
  $9884,$02 #R$6702
. "#R$7D12(you are in a clearing beside a crystal clear pool)".
  $9886,$02 #R$66F9 "#R$7B72(you are in a workroom)".
  $9888,$02 #R$67A9 #R$5D88.
  $988A,$02 #R$69E2 #R$5D88.
N $988C Room #N($40), flag #R$5D88 is not zero.
  $988C,$02 #R$66EB "#R$7B4E(you have ceased to exist)".
  $988E,$02 #R$67A9 #R$5D88.
  $9890,$02 #R$69E2 #R$5D88.
N $9892 Room #N($55), object #N$60 is held or here.
  $9892,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $9894,$02 #R$6709 "#R$91F3(The Rod Of Power)".
  $9896,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
N $9899 Room #N($55), object #N$67 is held or here.
  $9899,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $989B,$02 #R$6709 "#R$9228(sword)".
  $989D,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
N $98A0 Room #N($55), object #N$77 is held or here.
  $98A0,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $98A2,$02 #R$6709 "#R$92A0(magic harp)".
  $98A4,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
N $98A7 Room #N($55), object #N$79 is held or here.
  $98A7,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $98A9,$02 #R$6709 "#R$92B1(magic orb)".
  $98AB,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
N $98AE Room #N($55), object #N$7A is held or here.
  $98AE,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $98B0,$02 #R$6709 "#R$92B9(The Crown Of The Mountains)".
  $98B2,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
N $98B5 Object #N$41 is held or here.
  $98B5,$02 #R$6709 "#R$90D7(A lightning bolt is arcing towards you)".
  $98B7,$02 #R$63E6 #R$899B(#N$87).
  $98B9,$01 #R$685B.
N $98BA Room #N($55), object #N$6C is held or here.
  $98BA,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $98BC,$02 #R$6709 "#R$9249(sceptre)".
  $98BE,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
N $98C1 Room #N($55), flag #R$5DAD(#N$26) equals #N$64.
  $98C1,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $98C3,$03 #R$67B1 #R$5DAD(#N$26) and #N$64.
  $98C6,$02 #R$63E6 #R$8BE8(#N$9F).
  $98C8,$01 #R$685B.
N $98C9 Room #N$55.
  $98C9,$02 #R$66EB "#R$7C92(you are in your cottage, home and safe at last)".
  $98CB,$02 #R$63E6 "#R$8C11(you have completed)".
  $98CD,$02 #R$6A3C #R$5DAD(#N$26).
  $98CF,$02 #R$63E6
. "#R$8C1A(% of the adventure, and have returned safely home)".
  $98D1,$01 #R$685B.
N $98D2 Object #N$42 is held or here, object #N$75 is not held or here.
  $98D2,$02 #R$6709 "#R$90E8(A demon stands glaring at you)".
  $98D4,$02 #R$671A "#R$928A(chalk pentagram on the floor)".
  $98D6,$02 #R$63E6 #R$899B(#N$87).
  $98D8,$01 #R$685B.
N $98D9 Object #N$43 is held or here.
  $98D9,$02 #R$6709 "#R$90F6(You are surrounded by a cloud of thick vapours)".
  $98DB,$02 #R$63E6 #R$899B(#N$87).
  $98DD,$01 #R$685B.
N $98DE Object #N$44 is held or here.
  $98DE,$02 #R$6709 "#R$9110(The very air around me is crystalising)".
  $98E0,$02 #R$63E6 #R$89D9(#N$88).
  $98E2,$01 #R$685B.
N $98E3 Object #N$42 is held or here.
  $98E3,$02 #R$6709 "#R$90E8(A demon stands glaring at you)".
  $98E5,$02 #R$63E6 #R$8A0C(#N$89).
N $98E7 Object #N$30 is held or here.
  $98E7,$02 #R$6709 #R$8FB5(#N$30).
  $98E9,$02 #R$63E6 #R$899B(#N$87).
  $98EB,$01 #R$685B.
N $98EC Object #N$39 is held or here.
  $98EC,$02 #R$6709 "#R$9045(A ball of flame is streaking towards me)".
  $98EE,$02 #R$63E6 #R$899B(#N$87).
  $98F0,$01 #R$685B.
N $98F1 Object #N$3C is held or here.
  $98F1,$02 #R$6709
. "#R$9079(A wall of intense blinding light is coming towards me)".
  $98F3,$02 #R$63E6 #R$899B(#N$87).
  $98F5,$01 #R$685B.
N $98F6 Object #N$2A is held or here.
  $98F6,$02 #R$6709
. "#R$8F63(The air around you is vibrating with a strange sound)".
  $98F8,$02 #R$63E6 #R$899B(#N$87).
  $98FA,$01 #R$685B.
N $98FB Flag #R$5DAB(#N$24) equals #N$02.
  $98FB,$03 #R$67B1 #R$5DAB(#N$24) and #N$02.
  $98FE,$02 #R$69DB #R$5DAB(#N$24).
  $9900,$02 #R$63E6 "#R$8B36(the wizard dies, and all his sorcery is undone.)".
  $9902,$03 #R$69F4 #R$5DAD(#N$26) and #N$07.
  $9905,$02 #R$695D "#R$92A9(the evil wizard)".
  $9907,$02 #R$695D "#R$90E8(A demon stands glaring at you)".
N $9909 Room #N($41), object #N$78 is somewhere,
. flag #R$5DA9(#N$22) is not zero.
  $9909,$02 #R$66EB "#R$7B5A(you are on the far side of the lava pit)".
  $990B,$02 #R$672D "#R$92A9(the evil wizard)".
  $990D,$02 #R$67A9 #R$5DA9(#N$22).
  $990F,$02 #R$63E6 #R$899B(#N$87).
  $9911,$01 #R$685B.
N $9912 Room #N($43), object #N$78 is somewhere,
. flag #R$5DA9(#N$22) is not zero.
  $9912,$02 #R$66EB "#R$7B72(you are in a workroom)".
  $9914,$02 #R$672D "#R$92A9(the evil wizard)".
  $9916,$02 #R$67A9 #R$5DA9(#N$22).
  $9918,$02 #R$63E6 #R$899B(#N$87).
  $991A,$01 #R$685B.
N $991B Object #N$78 is held or here.
  $991B,$02 #R$6709 "#R$92A9(the evil wizard)".
  $991D,$03 #R$69F4 #R$5DA9(#N$22) and #N$01.
N $9920 Flag #R$5DAA(#N$23) is not zero.
  $9920,$02 #R$67A9 #R$5DAA(#N$23).
  $9922,$02 #R$63E6 #R$899B(#N$87).
  $9924,$01 #R$685B.
N $9925 Flag #R$5DA9(#N$22) equals #N($01), object #N$78 is held or here.
  $9925,$03 #R$67B1 #R$5DA9(#N$22) and #N$01.
  $9928,$02 #R$6709 "#R$92A9(the evil wizard)".
  $992A,$02 #R$6965 "#R$90D7(A lightning bolt is arcing towards you)".
  $992C,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $992E Flag #R$5DA9(#N$22) equals #N($02), object #N$78 is held or here.
  $992E,$03 #R$67B1 #R$5DA9(#N$22) and #N$02.
  $9931,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9933,$02 #R$6965 "#R$9045(A ball of flame is streaking towards me)".
  $9935,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $9937 Flag #R$5DA9(#N$22) equals #N($03), object #N$78 is held or here.
  $9937,$03 #R$67B1 #R$5DA9(#N$22) and #N$03.
  $993A,$02 #R$6709 "#R$92A9(the evil wizard)".
  $993C,$02 #R$6965 #R$8FB5(#N$30).
  $993E,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $9940 Flag #R$5DA9(#N$22) equals #N($04), object #N$78 is held or here.
  $9940,$03 #R$67B1 #R$5DA9(#N$22) and #N$04.
  $9943,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9945,$02 #R$6965 "#R$90F6(You are surrounded by a cloud of thick vapours)".
  $9947,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $9949 Flag #R$5DA9(#N$22) equals #N($05), object #N$78 is held or here.
  $9949,$03 #R$67B1 #R$5DA9(#N$22) and #N$05.
  $994C,$02 #R$6709 "#R$92A9(the evil wizard)".
  $994E,$02 #R$6965 "#R$9110(The very air around me is crystalising)".
  $9950,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $9952 Flag #R$5DA9(#N$22) equals #N($06), object #N$78 is held or here.
  $9952,$03 #R$67B1 #R$5DA9(#N$22) and #N$06.
  $9955,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9957,$02 #R$6965
. "#R$8F63(The air around you is vibrating with a strange sound)".
  $9959,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $995B Flag #R$5DA9(#N$22) equals #N($07), object #N$78 is held or here.
  $995B,$03 #R$67B1 #R$5DA9(#N$22) and #N$07.
  $995E,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9960,$02 #R$6965 "#R$90D7(A lightning bolt is arcing towards you)".
  $9962,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $9964 Flag #R$5DA9(#N$22) equals #N($08), object #N$78 is held or here.
  $9964,$03 #R$67B1 #R$5DA9(#N$22) and #N$08.
  $9967,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9969,$02 #R$6965
. "#R$9079(A wall of intense blinding light is coming towards me)".
  $996B,$02 #R$63E6 "#R$8AFB(the wizard casts a spell.)".
N $996D Flag #R$5DA9(#N$22) equals #N($0A), object #N$78 is held or here.
  $996D,$03 #R$67B1 #R$5DA9(#N$22) and #N$0A.
  $9970,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9972,$02 #R$63E6 "#R$8B4B(the wizard says 'BE NOT!' and you are not!)".
  $9974,$02 #R$6892 "#R$7B4E(you have ceased to exist)".
N $9976 Flag #R$5DA9(#N$22) equals #N($0B), object #N$78 is held or here.
  $9976,$03 #R$67B1 #R$5DA9(#N$22) and #N$0B.
  $9979,$02 #R$6709 "#R$92A9(the evil wizard)".
  $997B,$02 #R$63E6
. "#R$8B5E(the wizard points at me and utters a hideous curse.)".
  $997D,$02 #R$69DB #R$5DAA(#N$23).
N $997F Flag #R$5DA9(#N$22) equals #N($0C), object #N$78 is held or here.
  $997F,$03 #R$67B1 #R$5DA9(#N$22) and #N$0C.
  $9982,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9984,$02 #R$63E6 #R$8B06(#N$93).
  $9986,$02 #R$6965 "#R$90E8(A demon stands glaring at you)".
N $9988 Flag #R$5DA9(#N$22) equals #N($0E), object #N$78 is held or here.
  $9988,$03 #R$67B1 #R$5DA9(#N$22) and #N$0E.
  $998B,$02 #R$6709 "#R$92A9(the evil wizard)".
  $998D,$02 #R$63E6 #R$8BB8(#N$9C).
  $998F,$02 #R$695D "#R$928A(chalk pentagram on the floor)".
  $9991,$03 #R$6A11 #R$5D8E and #N$01.
N $9994 End of the table.
  $9994,$01

u $9995
B $9995,$86

b $9A1B Script Break
@ $9A1B label=ScriptBreak
D $9A1B A single #N$FF between the two unused gaps.
  $9A1B,$01

u $9A1C
B $9A1C,$38

b $9A54 Command Scripts
@ $9A54 label=CommandScripts
D $9A54 Bytecode for the player's verbs: movement that the exit table did not
. handle, GET, DROP, WEAR and the rest. #R$6074 runs it after a command has been
. parsed. Each line is a verb and a noun, then conditions while bit 7 of the
. next byte is clear, then actions while bit 7 is set. Verb or noun #N$7E
. matches any word. #N$7F ends the table. Action bit 6 stops the runner after
. that action.
N $9A54 DOWN PASS.
  $9A54,$02 Verb DOWN or D, noun PASS, HOLE, TUNN or CREV.
  $9A56,$03 #R$69E8 as #R$9C9E(GO PASS).
N $9A59 DOWN PASS.
  $9A59,$02 Verb DOWN or D, noun PASS, HOLE, TUNN or CREV.
  $9A5B,$03 #R$69E8 as #R$9C9E(GO PASS).
N $9A5E THRO WIND.
  $9A5E,$02 Verb THRO or HURL, noun WIND.
  $9A60,$03 #R$69E8 as #R$9C51(GO WIND).
N $9A63 THRO DOOR.
  $9A63,$02 Verb THRO or HURL, noun DOOR.
  $9A65,$03 #R$69E8 as #R$9F87(GO DOOR).
N $9A68 CROS FISS.
  $9A68,$02 Verb CROS, noun FISS, LAVA or CHAN.
  $9A6A,$03 #R$69E8 as #R$9ECD(GO PILL).
N $9A6D CROS PILL.
  $9A6D,$02 Verb CROS, noun PILL.
  $9A6F,$03 #R$69E8 as #R$9ECD(GO PILL).
N $9A72 PUSH CURT.
  $9A72,$02 Verb PUSH, PULL, ROLL or MOVE, noun CURT.
  $9A74,$03 #R$69E8 as #R$9A85(OPEN CURT).
  $9A77,$01 #R$6A68.
  $9A78,$01 #R$6902.
  $9A79,$03 #R$69E8 as #R$9A85(OPEN CURT).
N $9A7C DRY ROBE.
  $9A7C,$02 Verb DRY, noun ROBE.
  $9A7E,$02 #R$6709 "#R$91A2(wet)".
  $9A80,$02 #R$695D "#R$91A2(wet)", then stop.
N $9A82 GO TRIP.
  $9A82,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun TRIP or WIRE.
  $9A84,$01 #R$6B43, then stop.
N $9A85 OPEN CURT.
  $9A85,$02 Verb OPEN, noun CURT.
  $9A87,$03 #R$69E8 as #R$A2F7(EXAM CURT).
N $9A8A DRAW CURT.
  $9A8A,$02 Verb DRAW, MARK, WRIT, SCRI or INSC, noun CURT.
  $9A8C,$03 #R$69E8 as #R$A2F7(EXAM CURT).
N $9A8F WEST any.
  $9A8F,$02 Verb WEST or W, noun any.
  $9A91,$02 #R$66EB "#R$7836(you are in a stinking damp cell)".
  $9A93,$03 #R$69E8 as #R$9F87(GO DOOR).
N $9A96 EAST any.
  $9A96,$02 Verb EAST or E, noun any.
  $9A98,$02 #R$66EB "#R$781E(you are in a dank and dripping dungeon)".
  $9A9A,$03 #R$69E8 as #R$9F87(GO DOOR).
N $9A9D NORT any.
  $9A9D,$02 Verb NORT or N, noun any.
  $9A9F,$02 #R$66EB "#R$77F8(you are in a work room)".
  $9AA1,$03 #R$69E8 as #R$9F87(GO DOOR).
N $9AA4 SOUT any.
  $9AA4,$02 Verb SOUT or S, noun any.
  $9AA6,$02 #R$66EB "#R$77E6(you are in a shadowy corridor)".
  $9AA8,$03 #R$69E8 as #R$9F87(GO DOOR).
N $9AAB UP any.
  $9AAB,$02 Verb UP or U, noun any.
  $9AAD,$02 #R$66EB #R$7643(#N$01).
  $9AAF,$03 #R$69E8 as #R$9C4B(GO CLIF).
N $9AB2 OPEN CRAT.
  $9AB2,$02 Verb OPEN, noun CRAT.
  $9AB4,$03 #R$69E8 as #R$A562(KILL CRAT).
N $9AB7 DROP PLAN.
  $9AB7,$02 Verb DROP, noun PLAN.
  $9AB9,$02 #R$6759 #N$CC.
  $9ABB,$03 #R$69E8 as #R$A37E(PUT PLAN).
N $9ABE PUSH BOUL.
  $9ABE,$02 Verb PUSH, PULL, ROLL or MOVE, noun BOUL.
  $9AC0,$03 #R$69E8 as #R$9E23(GET BOUL).
N $9AC3 MOVE BOUL.
  $9AC3,$02 Verb MOVE, LIFT or SHIF, noun BOUL.
  $9AC5,$03 #R$69E8 as #R$9E23(GET BOUL).
N $9AC8 DIG PASS.
  $9AC8,$02 Verb DIG, noun PASS, HOLE, TUNN or CREV.
  $9ACA,$02 #R$6759 #N$E6.
  $9ACC,$03 #R$69E8 as #R$9F6D(DIG CEIL).
N $9ACF WAVE ROD.
  $9ACF,$02 Verb WAVE, noun ROD.
  $9AD1,$02 #R$6709 "#R$91F3(The Rod Of Power)".
  $9AD3,$02 #R$6709 "#R$92A9(the evil wizard)".
  $9AD5,$03 #R$69F4 #R$5DAB(#N$24) and #N$01.
  $9AD8,$02 #R$63E6
. "#R$8AE6(the wizard reels back clutching at his head.)", then stop.
N $9ADA PUSH STON.
  $9ADA,$02 Verb PUSH, PULL, ROLL or MOVE, noun STON.
  $9ADC,$02 #R$66EB "#R$7C1A(you are in the ruins of a temple)".
  $9ADE,$03 #R$69E8 as #R$9AE8(GET STON).
N $9AE1 MOVE STON.
  $9AE1,$02 Verb MOVE, LIFT or SHIF, noun STON.
  $9AE3,$02 #R$66EB "#R$7C1A(you are in the ruins of a temple)".
  $9AE5,$03 #R$69E8 as #R$9AE8(GET STON).
N $9AE8 GET STON.
  $9AE8,$02 Verb GET or TAKE, noun STON.
  $9AEA,$02 #R$671A "#R$8FFD(A flagstone in the floor is broken)".
  $9AEC,$02 #R$671A #R$90B7(#N$40).
  $9AEE,$02 #R$66EB "#R$7C1A(you are in the ruins of a temple)".
  $9AF0,$02 #R$63E6 "#R$8242(it is too heavy.)", then stop.
N $9AF2 GET STON.
  $9AF2,$02 Verb GET or TAKE, noun STON.
  $9AF4,$02 #R$6709 "#R$8FFD(A flagstone in the floor is broken)".
  $9AF6,$03 #R$69BF
. "#R$8FFD(A flagstone in the floor is broken)" and #R$90B7(#N$40).
  $9AF9,$02 #R$63E6 #R$87D3(#N$78), then stop.
N $9AFB CAST BLAS.
  $9AFB,$02 Verb CAST, noun BLAS.
  $9AFD,$02 #R$6709 "#R$9066(Masses of snow is piled up the sides of the pass)".
  $9AFF,$02 #R$6709 "#R$92DC(blast spell)".
  $9B01,$02 #R$69DB #R$5DA3(#N$1C).
  $9B03,$02 #R$695D "#R$92DC(blast spell)", then stop.
N $9B05 CUT TRIP.
  $9B05,$02 Verb CUT or CHOP, noun TRIP or WIRE.
  $9B07,$03 #R$69E8 as #R$9F66(PUSH TRIP).
N $9B0A WEAR YETI.
  $9B0A,$02 Verb WEAR, noun YETI.
  $9B0C,$02 #R$6759 #N$F9.
  $9B0E,$03 #R$69E8 as #R$A069(WEAR SKIN).
N $9B11 PUT ON.
  $9B11,$02 Verb PUT or TOUC, noun ON, OFF or AT.
  $9B13,$02 #R$6759 #N$F8.
  $9B15,$02 #R$6760 #N$F9.
  $9B17,$03 #R$69E8 as #R$A069(WEAR SKIN).
N $9B1A GET ON.
  $9B1A,$02 Verb GET or TAKE, noun ON, OFF or AT.
  $9B1C,$02 #R$6759 #N$F8.
  $9B1E,$02 #R$6760 #N$F9.
  $9B20,$03 #R$69E8 as #R$A075(REMO SKIN).
N $9B23 REMO YETI.
  $9B23,$02 Verb REMO, noun YETI.
  $9B25,$02 #R$6759 #N$F9.
  $9B27,$03 #R$69E8 as #R$A075(REMO SKIN).
N $9B2A GET YETI.
  $9B2A,$02 Verb GET or TAKE, noun YETI.
  $9B2C,$02 #R$6759 #N$F9.
  $9B2E,$03 #R$69E8 as #R$A061(GET SKIN).
N $9B31 DROP YETI.
  $9B31,$02 Verb DROP, noun YETI.
  $9B33,$02 #R$6759 #N$F9.
  $9B35,$03 #R$69E8 as #R$A065(DROP SKIN).
N $9B38 GET ROPE.
  $9B38,$02 Verb GET or TAKE, noun ROPE.
  $9B3A,$02 #R$6713 "#R$8DED(A wizard is hung from a rope here)".
  $9B3C,$03 #R$69E8 as #R$A1D0(CUT ROPE).
N $9B3F GET RING.
  $9B3F,$02 Verb GET or TAKE, noun RING.
  $9B41,$02 #R$6713 #R$8DFC(#N$0F).
  $9B43,$02 #R$63E6 "#R$84D0(it is fastened.)", then stop.
N $9B45 GET SNOW.
  $9B45,$02 Verb GET or TAKE, noun SNOW or SLUS.
  $9B47,$02 #R$6713 "#R$9301(snowshoes)".
  $9B49,$02 #R$68B0 "#R$9301(snowshoes)", then stop.
N $9B4B GET ON.
  $9B4B,$02 Verb GET or TAKE, noun ON, OFF or AT.
  $9B4D,$02 #R$6759 #N$AA.
  $9B4F,$03 #R$69E8 as #R$9B5E(REMO SNOW).
N $9B52 DROP SNOW.
  $9B52,$02 Verb DROP, noun SNOW or SLUS.
  $9B54,$02 #R$6739 "#R$9301(snowshoes)".
  $9B56,$02 #R$68E4 "#R$9301(snowshoes)", then stop.
N $9B58 DROP SNOW.
  $9B58,$02 Verb DROP, noun SNOW or SLUS.
  $9B5A,$02 #R$6740 "#R$9301(snowshoes)".
  $9B5C,$02 #R$68E4 "#R$9301(snowshoes)", then stop.
N $9B5E REMO SNOW.
  $9B5E,$02 Verb REMO, noun SNOW or SLUS.
  $9B60,$02 #R$6AAD "#R$9301(snowshoes)", then stop.
N $9B62 PUT ON.
  $9B62,$02 Verb PUT or TOUC, noun ON, OFF or AT.
  $9B64,$02 #R$6759 #N$AA.
  $9B66,$03 #R$69E8 as #R$9B69(WEAR SNOW).
N $9B69 WEAR SNOW.
  $9B69,$02 Verb WEAR, noun SNOW or SLUS.
  $9B6B,$02 #R$6A83 "#R$9301(snowshoes)", then stop.
N $9B6D QUIT any.
  $9B6D,$02 Verb QUIT, noun any.
  $9B6F,$01 #R$685B.
N $9B70 INVE any.
  $9B70,$02 Verb INVE, I or INV, noun any.
  $9B72,$01 #R$680C, then stop.
N $9B73 PUT ON.
  $9B73,$02 Verb PUT or TOUC, noun ON, OFF or AT.
  $9B75,$02 #R$6759 #N$B8.
  $9B77,$03 #R$69E8 as #R$9BFD(WEAR ROBE).
N $9B7A GET ON.
  $9B7A,$02 Verb GET or TAKE, noun ON, OFF or AT.
  $9B7C,$02 #R$6759 #N$B8.
  $9B7E,$03 #R$69E8 as #R$9C03(REMO ROBE).
N $9B81 GET SNOW.
  $9B81,$02 Verb GET or TAKE, noun SNOW or SLUS.
  $9B83,$02 #R$6713 "#R$913B(some slush)".
  $9B85,$02 #R$68B0 "#R$913B(some slush)", then stop.
N $9B87 DROP SNOW.
  $9B87,$02 Verb DROP, noun SNOW or SLUS.
  $9B89,$02 #R$68E4 "#R$913B(some slush)", then stop.
N $9B8B GET SNOW.
  $9B8B,$02 Verb GET or TAKE, noun SNOW or SLUS.
  $9B8D,$02 #R$67A1 #R$5D95(#N$0E).
  $9B8F,$02 #R$6965 "#R$913B(some slush)".
  $9B91,$02 #R$68B0 "#R$913B(some slush)".
  $9B93,$02 #R$63E6
. "#R$7F8A(the snow melts turning into a handfull of slush.)", then stop.
N $9B95 GET ROCK.
  $9B95,$02 Verb GET or TAKE, noun ROCK.
  $9B97,$02 #R$6713 "#R$9145(rock)".
  $9B99,$02 #R$68B0 "#R$9145(rock)", then stop.
N $9B9B GET ROCK.
  $9B9B,$02 Verb GET or TAKE, noun ROCK.
  $9B9D,$02 #R$68B0 "#R$921A(glowing rock)", then stop.
N $9B9F DROP ROCK.
  $9B9F,$02 Verb DROP, noun ROCK.
  $9BA1,$02 #R$6739 "#R$9145(rock)".
  $9BA3,$02 #R$68E4 "#R$9145(rock)", then stop.
N $9BA5 DROP ROCK.
  $9BA5,$02 Verb DROP, noun ROCK.
  $9BA7,$02 #R$68E4 "#R$921A(glowing rock)", then stop.
N $9BA9 GET KEY.
  $9BA9,$02 Verb GET or TAKE, noun KEY.
  $9BAB,$02 #R$68B0 "#R$9150(brass key)", then stop.
N $9BAD DROP KEY.
  $9BAD,$02 Verb DROP, noun KEY.
  $9BAF,$02 #R$68E4 "#R$9150(brass key)", then stop.
N $9BB1 GET SOAP.
  $9BB1,$02 Verb GET or TAKE, noun SOAP.
  $9BB3,$02 #R$68B0 "#R$9159(soap)", then stop.
N $9BB5 DROP SOAP.
  $9BB5,$02 Verb DROP, noun SOAP.
  $9BB7,$02 #R$68E4 "#R$9159(soap)", then stop.
N $9BB9 GET POLI.
  $9BB9,$02 Verb GET or TAKE, noun POLI.
  $9BBB,$02 #R$68B0 "#R$915F(polish)", then stop.
N $9BBD DROP POLI.
  $9BBD,$02 Verb DROP, noun POLI.
  $9BBF,$02 #R$68E4 "#R$915F(polish)", then stop.
N $9BC1 GET STON.
  $9BC1,$02 Verb GET or TAKE, noun STON.
  $9BC3,$02 #R$6713 "#R$9192(power stone)".
  $9BC5,$02 #R$68B0 "#R$9192(power stone)", then stop.
N $9BC7 GET STON.
  $9BC7,$02 Verb GET or TAKE, noun STON.
  $9BC9,$02 #R$6713 "#R$91B2(power stone)".
  $9BCB,$02 #R$68B0 "#R$91B2(power stone)", then stop.
N $9BCD GET STON.
  $9BCD,$02 Verb GET or TAKE, noun STON.
  $9BCF,$02 #R$68B0 "#R$917C(power stone)", then stop.
N $9BD1 DROP STON.
  $9BD1,$02 Verb DROP, noun STON.
  $9BD3,$02 #R$6739 "#R$9192(power stone)".
  $9BD5,$02 #R$68E4 "#R$9192(power stone)", then stop.
N $9BD7 DROP STON.
  $9BD7,$02 Verb DROP, noun STON.
  $9BD9,$02 #R$6739 "#R$91B2(power stone)".
  $9BDB,$02 #R$68E4 "#R$91B2(power stone)", then stop.
N $9BDD DROP STON.
  $9BDD,$02 Verb DROP, noun STON.
  $9BDF,$02 #R$68E4 "#R$917C(power stone)", then stop.
N $9BE1 GET WAND.
  $9BE1,$02 Verb GET or TAKE, noun WAND.
  $9BE3,$02 #R$68B0 "#R$9189(bright red wand)", then stop.
N $9BE5 DROP WAND.
  $9BE5,$02 Verb DROP, noun WAND.
  $9BE7,$02 #R$68E4 "#R$9189(bright red wand)", then stop.
N $9BE9 GET ROBE.
  $9BE9,$02 Verb GET or TAKE, noun ROBE.
  $9BEB,$02 #R$6713 "#R$91A2(wet)".
  $9BED,$02 #R$68B0 "#R$91A2(wet)".
N $9BEF GET ROBE.
  $9BEF,$02 Verb GET or TAKE, noun ROBE.
  $9BF1,$02 #R$68B0 "#R$91A6(black robe)", then stop.
N $9BF3 DROP ROBE.
  $9BF3,$02 Verb DROP, noun ROBE.
  $9BF5,$02 #R$6739 "#R$91A2(wet)".
  $9BF7,$02 #R$68E4 "#R$91A2(wet)".
N $9BF9 DROP ROBE.
  $9BF9,$02 Verb DROP, noun ROBE.
  $9BFB,$02 #R$68E4 "#R$91A6(black robe)", then stop.
N $9BFD WEAR ROBE.
  $9BFD,$02 Verb WEAR, noun ROBE.
  $9BFF,$02 #R$6739 "#R$91A6(black robe)".
  $9C01,$02 #R$6A83 "#R$91A6(black robe)", then stop.
N $9C03 REMO ROBE.
  $9C03,$02 Verb REMO, noun ROBE.
  $9C05,$02 #R$6740 "#R$91A6(black robe)".
  $9C07,$02 #R$6AAD "#R$91A6(black robe)", then stop.
N $9C09 GET CHAI.
  $9C09,$02 Verb GET or TAKE, noun CHAI.
  $9C0B,$02 #R$68B0 "#R$91C7(chair)", then stop.
N $9C0D DROP CHAI.
  $9C0D,$02 Verb DROP, noun CHAI.
  $9C0F,$02 #R$68E4 "#R$91C7(chair)", then stop.
N $9C11 GET SCRO.
  $9C11,$02 Verb GET or TAKE, noun SCRO.
  $9C13,$02 #R$68B0 "#R$91CB(scroll)", then stop.
N $9C15 DROP SCRO.
  $9C15,$02 Verb DROP, noun SCRO.
  $9C17,$02 #R$68E4 "#R$91CB(scroll)", then stop.
N $9C19 GET STRE.
  $9C19,$02 Verb GET or TAKE, noun STRE.
  $9C1B,$02 #R$68B0 "#R$91D8(strength spell)", then stop.
N $9C1D DROP STRE.
  $9C1D,$02 Verb DROP, noun STRE.
  $9C1F,$02 #R$68E4 "#R$91D8(strength spell)", then stop.
N $9C21 GET GARL.
  $9C21,$02 Verb GET or TAKE, noun GARL.
  $9C23,$02 #R$68B0 "#R$91ED(garlic)", then stop.
N $9C25 DROP GARL.
  $9C25,$02 Verb DROP, noun GARL.
  $9C27,$02 #R$68E4 "#R$91ED(garlic)", then stop.
N $9C29 GET ROD.
  $9C29,$02 Verb GET or TAKE, noun ROD.
  $9C2B,$02 #R$6713 "#R$91F3(The Rod Of Power)".
  $9C2D,$02 #R$68B0 "#R$91F3(The Rod Of Power)", then stop.
N $9C2F DROP ROD.
  $9C2F,$02 Verb DROP, noun ROD.
  $9C31,$02 #R$68E4 "#R$91F3(The Rod Of Power)", then stop.
N $9C33 GET EART.
  $9C33,$02 Verb GET or TAKE, noun EART.
  $9C35,$02 #R$6713 "#R$9202(earth spell)".
  $9C37,$02 #R$68B0 "#R$9202(earth spell)", then stop.
N $9C39 DROP EART.
  $9C39,$02 Verb DROP, noun EART.
  $9C3B,$02 #R$6739 "#R$9202(earth spell)".
  $9C3D,$02 #R$68E4 "#R$9202(earth spell)", then stop.
N $9C3F GET RING.
  $9C3F,$02 Verb GET or TAKE, noun RING.
  $9C41,$02 #R$6713 "#R$9206(metal ring)".
  $9C43,$02 #R$68B0 "#R$9206(metal ring)", then stop.
N $9C45 DROP RING.
  $9C45,$02 Verb DROP, noun RING.
  $9C47,$02 #R$6713 "#R$9206(metal ring)".
  $9C49,$02 #R$68E4 "#R$9206(metal ring)", then stop.
N $9C4B GO CLIF.
  $9C4B,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun CLIF.
  $9C4D,$02 #R$66EB #R$7643(#N$01).
  $9C4F,$02 #R$6892 #R$7691(#N$03), then stop.
N $9C51 GO WIND.
  $9C51,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun WIND.
  $9C53,$02 #R$6713 "#R$8E60(which has been widened)".
  $9C55,$02 #R$69DB #R$5D95(#N$0E).
  $9C57,$02 #R$6892 #R$76BC(#N$04), then stop.
N $9C59 GO WIND.
  $9C59,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun WIND.
  $9C5B,$02 #R$66EB #R$76BC(#N$04).
  $9C5D,$02 #R$69E2 #R$5D95(#N$0E).
  $9C5F,$02 #R$6892 #R$7691(#N$03), then stop.
N $9C61 GO WIND.
  $9C61,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun WIND.
  $9C63,$02 #R$6713 "#R$8CE6(above me is a window)".
  $9C65,$02 #R$63E6 "#R$7FA4(it is too narrow to squeeze through.)", then stop.
N $9C67 PUT SNOW.
  $9C67,$02 Verb PUT or TOUC, noun SNOW or SLUS.
  $9C69,$02 #R$6759 #N$DD.
  $9C6B,$02 #R$671A "#R$8E60(which has been widened)".
  $9C6D,$02 #R$6709 "#R$8CE6(above me is a window)".
  $9C6F,$02 #R$6709 "#R$913B(some slush)".
  $9C71,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9C74,$02 #R$6965 "#R$8E60(which has been widened)".
  $9C76,$02 #R$695D "#R$913B(some slush)".
  $9C78,$02 #R$63E6 #R$7FE6(#N$25), then stop.
N $9C7A FILL CRAC.
  $9C7A,$02 Verb FILL, noun CRAC.
  $9C7C,$02 #R$6759 #N$AA.
  $9C7E,$02 #R$671A "#R$8E60(which has been widened)".
  $9C80,$02 #R$6709 "#R$8CE6(above me is a window)".
  $9C82,$02 #R$6709 "#R$913B(some slush)".
  $9C84,$02 #R$6965 "#R$8E60(which has been widened)".
  $9C86,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9C89,$02 #R$695D "#R$913B(some slush)".
  $9C8B,$02 #R$63E6 #R$7FE6(#N$25), then stop.
N $9C8D EXAM WIND.
  $9C8D,$02 Verb EXAM, LOOK, SEAR or READ, noun WIND.
  $9C8F,$02 #R$66EB #R$7691(#N$03).
  $9C91,$02 #R$671A "#R$8E60(which has been widened)".
  $9C93,$02 #R$63E6 #R$7FBA(#N$23), then stop.
N $9C95 DOWN any.
  $9C95,$02 Verb DOWN or D, noun any.
  $9C97,$02 #R$66EB
. "#R$7704(you are in a long dark passage. A small room is north)".
  $9C99,$02 #R$6709
. "#R$8D05(and it has been moved to reveal a hole leading down)".
  $9C9B,$03 #R$69E8 as #R$9C9E(GO PASS).
N $9C9E GO PASS.
  $9C9E,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $9CA0,$02 #R$6713
. "#R$8D05(and it has been moved to reveal a hole leading down)".
  $9CA2,$02 #R$6892 #R$771C(#N$0A), then stop.
N $9CA4 EXAM STAT.
  $9CA4,$02 Verb EXAM, LOOK, SEAR or READ, noun STAT.
  $9CA6,$02 #R$66EB
. "#R$7704(you are in a long dark passage. A small room is north)".
  $9CA8,$02 #R$63E6 "#R$8007(it is mounted on runners.)", then stop.
N $9CAA WET STAT.
  $9CAA,$02 Verb WET, COOL, DAMP or SOAK, noun STAT.
  $9CAC,$03 #R$69E8 as #R$9CAF(WET RUNN).
N $9CAF WET RUNN.
  $9CAF,$02 Verb WET, COOL, DAMP or SOAK, noun RUNN.
  $9CB1,$02 #R$66EB
. "#R$7704(you are in a long dark passage. A small room is north)".
  $9CB3,$02 #R$67A1 #R$5D96(#N$0F).
  $9CB5,$02 #R$6709 "#R$91A2(wet)".
  $9CB7,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9CBA,$02 #R$695D "#R$91A2(wet)".
  $9CBC,$02 #R$69DB #R$5D96(#N$0F), then stop.
N $9CBE PUSH STAT.
  $9CBE,$02 Verb PUSH, PULL, ROLL or MOVE, noun STAT.
  $9CC0,$02 #R$6709
. "#R$8D05(and it has been moved to reveal a hole leading down)".
  $9CC2,$02 #R$695D
. "#R$8D05(and it has been moved to reveal a hole leading down)", then stop.
N $9CC4 PUSH STAT.
  $9CC4,$02 Verb PUSH, PULL, ROLL or MOVE, noun STAT.
  $9CC6,$02 #R$67A1 #R$5D96(#N$0F).
  $9CC8,$02 #R$66EB
. "#R$7704(you are in a long dark passage. A small room is north)".
  $9CCA,$02 #R$63E6 "#R$8013(it won't shift.)", then stop.
N $9CCC PUSH STAT.
  $9CCC,$02 Verb PUSH, PULL, ROLL or MOVE, noun STAT.
  $9CCE,$02 #R$66EB
. "#R$7704(you are in a long dark passage. A small room is north)".
  $9CD0,$02 #R$6965
. "#R$8D05(and it has been moved to reveal a hole leading down)", then stop.
N $9CD2 WET ROBE.
  $9CD2,$02 Verb WET, COOL, DAMP or SOAK, noun ROBE.
  $9CD4,$02 #R$67A1 #R$5D95(#N$0E).
  $9CD6,$02 #R$671A "#R$91A2(wet)".
  $9CD8,$02 #R$6739 "#R$91A6(black robe)".
  $9CDA,$02 #R$6965 "#R$91A2(wet)".
  $9CDC,$02 #R$68B0 "#R$91A2(wet)", then stop.
N $9CDE WET ROBE.
  $9CDE,$02 Verb WET, COOL, DAMP or SOAK, noun ROBE.
  $9CE0,$02 #R$671A "#R$91A2(wet)".
  $9CE2,$02 #R$66F9 #R$7CB1(#N$57).
  $9CE4,$02 #R$6702 "#R$7CFA(you are in the woods)".
  $9CE6,$02 #R$6965 "#R$91A2(wet)".
  $9CE8,$02 #R$68B0 "#R$91A2(wet)", then stop.
N $9CEA WET ROBE.
  $9CEA,$02 Verb WET, COOL, DAMP or SOAK, noun ROBE.
  $9CEC,$02 #R$67A1 #R$5D95(#N$0E).
  $9CEE,$02 #R$671A "#R$91A2(wet)".
  $9CF0,$02 #R$6740 "#R$91A6(black robe)".
  $9CF2,$02 #R$6965 "#R$91A2(wet)".
  $9CF4,$02 #R$68B0 "#R$91A2(wet)", then stop.
N $9CF6 WET ROBE.
  $9CF6,$02 Verb WET, COOL, DAMP or SOAK, noun ROBE.
  $9CF8,$02 #R$671A "#R$91A2(wet)".
  $9CFA,$02 #R$66F9 #R$7A2E(#N$34).
  $9CFC,$02 #R$6702 #R$7A85(#N$37).
  $9CFE,$02 #R$6965 "#R$91A2(wet)".
  $9D00,$02 #R$68B0 "#R$91A2(wet)", then stop.
N $9D02 GO WELL.
  $9D02,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun WELL.
  $9D04,$02 #R$66EB
. "#R$7880(you are in a large water cave with a well at one end)".
  $9D06,$02 #R$6892 "#R$7895(you are down a small dried up well)", then stop.
N $9D08 EXAM any.
  $9D08,$02 Verb EXAM, LOOK, SEAR or READ, noun any.
  $9D0A,$02 #R$66EB "#R$7895(you are down a small dried up well)".
  $9D0C,$02 #R$671A "#R$8E9E(A secret passage leads into a room)".
  $9D0E,$02 #R$6965 "#R$8E9E(A secret passage leads into a room)".
  $9D10,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9D13,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $9D15 GO PASS.
  $9D15,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $9D17,$02 #R$6709 "#R$8E9E(A secret passage leads into a room)".
  $9D19,$02 #R$6892 "#R$78DF(you are in musty secret chamber)", then stop.
N $9D1B GET ROD.
  $9D1B,$02 Verb GET or TAKE, noun ROD.
  $9D1D,$02 #R$6709 #R$8E79(#N$17).
  $9D1F,$02 #R$63E6 "#R$8029(the forcefield stops you.)", then stop.
N $9D21 EXAM ROD.
  $9D21,$02 Verb EXAM, LOOK, SEAR or READ, noun ROD.
  $9D23,$02 #R$6709 #R$8E79(#N$17).
  $9D25,$02 #R$63E6 #R$8038(#N$2A), then stop.
N $9D27 EXAM COFF.
  $9D27,$02 Verb EXAM, LOOK, SEAR or READ, noun COFF.
  $9D29,$02 #R$6709 "#R$91E4(sinister coffin)".
  $9D2B,$02 #R$63E6 #R$813D(#N$37), then stop.
N $9D2D EXAM COFF.
  $9D2D,$02 Verb EXAM, LOOK, SEAR or READ, noun COFF.
  $9D2F,$02 #R$6709 "#R$9221(open coffin)".
  $9D31,$02 #R$6733 "#R$91B2(power stone)".
  $9D33,$02 #R$63E6 "#R$801D(You have found something.)".
  $9D35,$02 #R$6965 "#R$91B2(power stone)", then stop.
N $9D37 OPEN COFF.
  $9D37,$02 Verb OPEN, noun COFF.
  $9D39,$02 #R$6709 "#R$91E4(sinister coffin)".
  $9D3B,$02 #R$67A1 #R$5D97(#N$10).
  $9D3D,$03 #R$6A16 "#R$91AE(ghoul)" and #R$75CE(#N$00).
  $9D40,$02 #R$63E6 "#R$80A2(as you open the coffin a ghoul climbs out!)".
N $9D42 OPEN COFF.
  $9D42,$02 Verb OPEN, noun COFF.
  $9D44,$02 #R$6709 "#R$91E4(sinister coffin)".
  $9D46,$03 #R$69BF
. "#R$91E4(sinister coffin)" and "#R$9221(open coffin)", then stop.
N $9D49 CLOS COFF.
  $9D49,$02 Verb CLOS or SHUT, noun COFF.
  $9D4B,$02 #R$6709 "#R$9221(open coffin)".
  $9D4D,$03 #R$69BF
. "#R$9221(open coffin)" and "#R$91E4(sinister coffin)", then stop.
N $9D50 KILL GHOU.
  $9D50,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun GHOU.
  $9D52,$02 #R$6709 "#R$91AE(ghoul)".
  $9D54,$02 #R$6739 "#R$9228(sword)".
  $9D56,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9D59,$02 #R$69DB #R$5D97(#N$10).
  $9D5B,$02 #R$695D "#R$91AE(ghoul)".
  $9D5D,$02 #R$63E6
. "#R$8107(the ghoul turns to dust as the sword strikes.)", then stop.
N $9D5F KILL GHOU.
  $9D5F,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun GHOU.
  $9D61,$02 #R$6709 "#R$91AE(ghoul)".
  $9D63,$02 #R$63E6 "#R$81BB(your weapons are having no effect!)", then stop.
N $9D65 SAY any.
  $9D65,$02 Verb SAY, YELL, SHOU, YELL, YODL, TALK or SPEA, noun any.
  $9D67,$02 #R$66EB
. "#R$7868(you are in the library, surrounded by empty bookcases)".
  $9D69,$02 #R$6892 "#R$785C(you are in a small entry chamber)".
  $9D6B,$02 #R$63E6
. "#R$8191(the dark figure throws you out of the library.)", then stop.
N $9D6D PUSH BOOK.
  $9D6D,$02 Verb PUSH, PULL, ROLL or MOVE, noun BOOK.
  $9D6F,$02 #R$66EB
. "#R$7868(you are in the library, surrounded by empty bookcases)".
  $9D71,$02 #R$63E6 "#R$81AB(the floor opens and you tumble down.)".
  $9D73,$02 #R$6899 #N$01.
  $9D75,$02 #R$6892 #R$7925(#N$29), then stop.
N $9D77 EXAM BOOK.
  $9D77,$02 Verb EXAM, LOOK, SEAR or READ, noun BOOK.
  $9D79,$02 #R$66EB
. "#R$7868(you are in the library, surrounded by empty bookcases)".
  $9D7B,$02 #R$63E6 "#R$8C31(it looks as if you could push it)", then stop.
N $9D7D KILL FIGU.
  $9D7D,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun FIGU.
  $9D7F,$02 #R$66EB "#R$785C(you are in a small entry chamber)".
  $9D81,$02 #R$63E6 "#R$81BB(your weapons are having no effect!)", then stop.
N $9D83 DIG any.
  $9D83,$02 Verb DIG, noun any.
  $9D85,$02 #R$66EB #R$7675(#N$02).
  $9D87,$02 #R$6733 "#R$91ED(garlic)".
  $9D89,$03 #R$69F4 #R$5DAD(#N$26) and #N$01.
  $9D8C,$02 #R$6965 "#R$91ED(garlic)".
  $9D8E,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $9D90 GET SHIE.
  $9D90,$02 Verb GET or TAKE, noun SHIE.
  $9D92,$02 #R$6713 "#R$922E(large shield)".
  $9D94,$02 #R$68B0 "#R$922E(large shield)", then stop.
N $9D96 DROP SHIE.
  $9D96,$02 Verb DROP, noun SHIE.
  $9D98,$02 #R$6739 "#R$922E(large shield)".
  $9D9A,$02 #R$68E4 "#R$922E(large shield)", then stop.
N $9D9C DROP SWOR.
  $9D9C,$02 Verb DROP, noun SWOR.
  $9D9E,$02 #R$68E4 "#R$9228(sword)", then stop.
N $9DA0 GET SHIE.
  $9DA0,$02 Verb GET or TAKE, noun SHIE.
  $9DA2,$02 #R$66EB "#R$78A7(you are in a massive hall decorated with shields)".
  $9DA4,$02 #R$6733 "#R$922E(large shield)".
  $9DA6,$02 #R$6965 "#R$922E(large shield)".
  $9DA8,$02 #R$68B0 "#R$922E(large shield)", then stop.
N $9DAA GET SHIE.
  $9DAA,$02 Verb GET or TAKE, noun SHIE.
  $9DAC,$02 #R$66EB "#R$78A7(you are in a massive hall decorated with shields)".
  $9DAE,$02 #R$6733 "#R$922E(large shield)".
  $9DB0,$02 #R$6965 "#R$922E(large shield)".
  $9DB2,$03 #R$69F4 #R$5DAD(#N$26) and #N$01.
  $9DB5,$02 #R$68B0 "#R$922E(large shield)", then stop.
N $9DB7 GET SHIE.
  $9DB7,$02 Verb GET or TAKE, noun SHIE.
  $9DB9,$02 #R$68B0 "#R$922E(large shield)", then stop.
N $9DBB VPOL SHIE.
  $9DBB,$02 Verb VPOL, noun SHIE.
  $9DBD,$02 #R$6709 "#R$922E(large shield)".
  $9DBF,$02 #R$6709 "#R$915F(polish)".
  $9DC1,$02 #R$69DB #R$5D98(#N$11).
  $9DC3,$02 #R$63E6 "#R$807C(it is now very shiny.)", then stop.
N $9DC5 EXAM SWOR.
  $9DC5,$02 Verb EXAM, LOOK, SEAR or READ, noun SWOR.
  $9DC7,$02 #R$6709 "#R$9228(sword)".
  $9DC9,$02 #R$63E6 "#R$80EA(it is magical.)", then stop.
N $9DCB GET SWOR.
  $9DCB,$02 Verb GET or TAKE, noun SWOR.
  $9DCD,$02 #R$6713 "#R$8E34(A sword is set deep into the stone)".
  $9DCF,$02 #R$67A1 #R$5D99(#N$12).
  $9DD1,$02 #R$63E6 "#R$80C8(ouch, it is too hot to hold!)", then stop.
N $9DD3 GET SWOR.
  $9DD3,$02 Verb GET or TAKE, noun SWOR.
  $9DD5,$02 #R$6713 "#R$8E34(A sword is set deep into the stone)".
  $9DD7,$03 #R$69BF
. "#R$8E34(A sword is set deep into the stone)" and "#R$9228(sword)".
  $9DDA,$02 #R$63E6 "#R$80D7(the sword slides smoothly out of the stone.)".
  $9DDC,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
N $9DDF GET SWOR.
  $9DDF,$02 Verb GET or TAKE, noun SWOR.
  $9DE1,$02 #R$68B0 "#R$9228(sword)", then stop.
N $9DE3 WET SWOR.
  $9DE3,$02 Verb WET, COOL, DAMP or SOAK, noun SWOR.
  $9DE5,$02 #R$6713 "#R$8E34(A sword is set deep into the stone)".
  $9DE7,$02 #R$6709 "#R$91A2(wet)".
  $9DE9,$02 #R$695D "#R$91A2(wet)".
  $9DEB,$02 #R$69DB #R$5D99(#N$12), then stop.
N $9DED EXAM any.
  $9DED,$02 Verb EXAM, LOOK, SEAR or READ, noun any.
  $9DEF,$02 #R$66EB "#R$78EE(you are in an inscribed rune covered chamber)".
  $9DF1,$02 #R$63E6 #R$815C(#N$38), then stop.
N $9DF3 EXAM SCRO.
  $9DF3,$02 Verb EXAM, LOOK, SEAR or READ, noun SCRO.
  $9DF5,$02 #R$6709 "#R$91CB(scroll)".
  $9DF7,$02 #R$63E6 #R$81CF(#N$3C), then stop.
N $9DF9 DROP BOUL.
  $9DF9,$02 Verb DROP, noun BOUL.
  $9DFB,$02 #R$6759 #N$DF.
  $9DFD,$02 #R$6760 #N$C1.
  $9DFF,$02 #R$6739 "#R$9214(boulder)".
  $9E01,$02 #R$6709 #R$8EAB(#N$19).
  $9E03,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9E06,$02 #R$695D #R$8EAB(#N$19).
  $9E08,$03 #R$6A16 "#R$9214(boulder)" and #R$7970(#N$2D).
  $9E0B,$02 #R$695D "#R$91DF(ogre)".
  $9E0D,$02 #R$63E6 "#R$8261(the boulder splatters the ogre.)", then stop.
N $9E0F DROP BOUL.
  $9E0F,$02 Verb DROP, noun BOUL.
  $9E11,$02 #R$6759 #N$C1.
  $9E13,$02 #R$6739 "#R$9214(boulder)".
  $9E15,$02 #R$6709 #R$8EAB(#N$19).
  $9E17,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9E1A,$02 #R$695D #R$8EAB(#N$19).
  $9E1C,$03 #R$6A16 "#R$9214(boulder)" and #R$7970(#N$2D).
  $9E1F,$02 #R$695D "#R$91DF(ogre)".
  $9E21,$02 #R$63E6 "#R$8261(the boulder splatters the ogre.)", then stop.
N $9E23 GET BOUL.
  $9E23,$02 Verb GET or TAKE, noun BOUL.
  $9E25,$02 #R$6713 "#R$9214(boulder)".
  $9E27,$02 #R$67A1 #R$5D9A(#N$13).
  $9E29,$02 #R$63E6 "#R$8242(it is too heavy.)", then stop.
N $9E2B GET BOUL.
  $9E2B,$02 Verb GET or TAKE, noun BOUL.
  $9E2D,$02 #R$6713 "#R$8E44(A boulder blocks the way east)".
  $9E2F,$02 #R$67A1 #R$5D9A(#N$13).
  $9E31,$02 #R$63E6 "#R$8242(it is too heavy.)", then stop.
N $9E33 GET BOUL.
  $9E33,$02 Verb GET or TAKE, noun BOUL.
  $9E35,$02 #R$6713 "#R$8E44(A boulder blocks the way east)".
  $9E37,$03 #R$69BF
. "#R$8E44(A boulder blocks the way east)" and
. "#R$8E51(A narrow hole leads into a passage)".
  $9E3A,$02 #R$6965 "#R$9214(boulder)".
  $9E3C,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
N $9E3F GET BOUL.
  $9E3F,$02 Verb GET or TAKE, noun BOUL.
  $9E41,$02 #R$68B0 "#R$9214(boulder)", then stop.
N $9E43 CAST STRE.
  $9E43,$02 Verb CAST, noun STRE.
  $9E45,$02 #R$6709 "#R$91D8(strength spell)".
  $9E47,$03 #R$6A16 "#R$91D8(strength spell)" and #R$75CE(#N$00).
  $9E4A,$03 #R$6A11 #R$5D9A(#N$13) and #N$08.
  $9E4D,$02 #R$63E6 "#R$8256(you feel stronger.)", then stop.
N $9E4F EXAM WIZA.
  $9E4F,$02 Verb EXAM, LOOK, SEAR or READ, noun WIZA.
  $9E51,$02 #R$6709 "#R$91D2(dead wizard)".
  $9E53,$02 #R$6733 "#R$91D8(strength spell)".
  $9E55,$03 #R$69F4 #R$5DAD(#N$26) and #N$01.
  $9E58,$02 #R$6965 "#R$91D8(strength spell)".
  $9E5A,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $9E5C DROP BOUL.
  $9E5C,$02 Verb DROP, noun BOUL.
  $9E5E,$02 #R$68E4 "#R$9214(boulder)", then stop.
N $9E60 THRO BOUL.
  $9E60,$02 Verb THRO or HURL, noun BOUL.
  $9E62,$02 #R$6739 "#R$9214(boulder)".
  $9E64,$02 #R$6709 #R$8EAB(#N$19).
  $9E66,$02 #R$695D #R$8EAB(#N$19).
  $9E68,$03 #R$6A16 "#R$9214(boulder)" and #R$7970(#N$2D).
  $9E6B,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9E6E,$02 #R$695D "#R$91DF(ogre)".
  $9E70,$02 #R$63E6 "#R$8261(the boulder splatters the ogre.)", then stop.
N $9E72 GO PASS.
  $9E72,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $9E74,$02 #R$6709 "#R$8E51(A narrow hole leads into a passage)".
  $9E76,$02 #R$6892
. "#R$795E(you are in a gallery above a guardroom)", then stop.
N $9E78 SAVE any.
  $9E78,$02 Verb SAVE, noun any.
  $9E7A,$01 #R$6902.
N $9E7B GO FISS.
  $9E7B,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun FISS, LAVA or CHAN.
  $9E7D,$02 #R$66F9 #R$7793(#N$10).
  $9E7F,$02 #R$6702 "#R$77CF(you are in a large rest chamber)".
  $9E81,$02 #R$63E6 "#R$829E(it is too far.)", then stop.
N $9E83 GET PILL.
  $9E83,$02 Verb GET or TAKE, noun PILL.
  $9E85,$02 #R$6713 "#R$9166(sixty foot pillar)".
  $9E87,$02 #R$63E6 "#R$8242(it is too heavy.)", then stop.
N $9E89 GET PILL.
  $9E89,$02 Verb GET or TAKE, noun PILL.
  $9E8B,$02 #R$6713 "#R$8D39(but it has been bridged with a stone pillar)".
  $9E8D,$02 #R$63E6 "#R$8242(it is too heavy.)", then stop.
N $9E8F GET PILL.
  $9E8F,$02 Verb GET or TAKE, noun PILL.
  $9E91,$02 #R$6713 #R$8D5E(#N$07).
  $9E93,$02 #R$63E6 "#R$8242(it is too heavy.)", then stop.
N $9E95 PUSH PILL.
  $9E95,$02 Verb PUSH, PULL, ROLL or MOVE, noun PILL.
  $9E97,$03 #R$69E8 as #R$9EAE(PUSH PILL).
N $9E9A PUT PILL.
  $9E9A,$02 Verb PUT or TOUC, noun PILL.
  $9E9C,$02 #R$6759 #N$CC.
  $9E9E,$03 #R$69E8 as #R$9EAE(PUSH PILL).
N $9EA1 PUT PILL.
  $9EA1,$02 Verb PUT or TOUC, noun PILL.
  $9EA3,$02 #R$6760 #N$CC.
  $9EA5,$03 #R$69E8 as #R$9EAE(PUSH PILL).
N $9EA8 GET PILL.
  $9EA8,$02 Verb GET or TAKE, noun PILL.
  $9EAA,$02 #R$6713 #R$8D5E(#N$07).
  $9EAC,$02 #R$63E6 "#R$8242(it is too heavy.)", then stop.
N $9EAE PUSH PILL.
  $9EAE,$02 Verb PUSH, PULL, ROLL or MOVE, noun PILL.
  $9EB0,$02 #R$6713 #R$8D5E(#N$07).
  $9EB2,$02 #R$63E6 #R$82A6(#N$45).
  $9EB4,$02 #R$695D "#R$9173(giant snake)".
  $9EB6,$02 #R$695D "#R$8D39(but it has been bridged with a stone pillar)".
  $9EB8,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9EBB,$02 #R$695D #R$8D5E(#N$07), then stop.
N $9EBD PUSH PILL.
  $9EBD,$02 Verb PUSH, PULL, ROLL or MOVE, noun PILL.
  $9EBF,$02 #R$6713 "#R$8D27(A thirty foot wide fissure bars the way east)".
  $9EC1,$02 #R$6713 "#R$9166(sixty foot pillar)".
  $9EC3,$03 #R$69BF
. "#R$9166(sixty foot pillar)" and
. "#R$8D39(but it has been bridged with a stone pillar)".
  $9EC6,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9EC9,$02 #R$6965 "#R$9173(giant snake)".
  $9ECB,$02 #R$63E6 #R$82C0(#N$46), then stop.
N $9ECD GO PILL.
  $9ECD,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PILL.
  $9ECF,$02 #R$6713 "#R$8D39(but it has been bridged with a stone pillar)".
  $9ED1,$02 #R$6892 "#R$77C2(you are in a low narrow corridor)", then stop.
N $9ED3 EXAM ROBE.
  $9ED3,$02 Verb EXAM, LOOK, SEAR or READ, noun ROBE.
  $9ED5,$02 #R$6709 "#R$91A6(black robe)".
  $9ED7,$02 #R$63E6 #R$8300(#N$48), then stop.
N $9ED9 EXAM POCK.
  $9ED9,$02 Verb EXAM, LOOK, SEAR or READ, noun POCK.
  $9EDB,$02 #R$6709 "#R$91A6(black robe)".
  $9EDD,$02 #R$6733 "#R$9150(brass key)".
  $9EDF,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9EE2,$02 #R$6965 "#R$9150(brass key)".
  $9EE4,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $9EE6 OPEN DOOR.
  $9EE6,$02 Verb OPEN, noun DOOR.
  $9EE8,$02 #R$6713 "#R$8D93(There is a locked door to the south)".
  $9EEA,$02 #R$63E6 "#R$82FA(it is locked.)", then stop.
N $9EEC OPEN DOOR.
  $9EEC,$02 Verb OPEN, noun DOOR.
  $9EEE,$02 #R$6713 "#R$8ED5(locked)".
  $9EF0,$02 #R$63E6 "#R$82FA(it is locked.)", then stop.
N $9EF2 OPEN DOOR.
  $9EF2,$02 Verb OPEN, noun DOOR.
  $9EF4,$02 #R$6713 "#R$8ED9(shut)".
  $9EF6,$03 #R$69BF "#R$8ED9(shut)" and "#R$8EDE(open)".
  $9EF9,$03 #R$69BF
. "#R$8DA0(There is a closed door to the south)" and
. "#R$8DAE(An open door leads south into a room)", then stop.
N $9EFC OPEN DOOR.
  $9EFC,$02 Verb OPEN, noun DOOR.
  $9EFE,$02 #R$6713 "#R$8DA0(There is a closed door to the south)".
  $9F00,$03 #R$69BF "#R$8ED9(shut)" and "#R$8EDE(open)".
  $9F03,$03 #R$69BF
. "#R$8DA0(There is a closed door to the south)" and
. "#R$8DAE(An open door leads south into a room)", then stop.
N $9F06 CLOS DOOR.
  $9F06,$02 Verb CLOS or SHUT, noun DOOR.
  $9F08,$02 #R$6713 "#R$8EDE(open)".
  $9F0A,$03 #R$69BF "#R$8ED9(shut)" and "#R$8EDE(open)".
  $9F0D,$03 #R$69BF
. "#R$8DA0(There is a closed door to the south)" and
. "#R$8DAE(An open door leads south into a room)", then stop.
N $9F10 CLOS DOOR.
  $9F10,$02 Verb CLOS or SHUT, noun DOOR.
  $9F12,$02 #R$6713 "#R$8DAE(An open door leads south into a room)".
  $9F14,$03 #R$69BF "#R$8ED9(shut)" and "#R$8EDE(open)".
  $9F17,$03 #R$69BF
. "#R$8DA0(There is a closed door to the south)" and
. "#R$8DAE(An open door leads south into a room)", then stop.
N $9F1A LOCK DOOR.
  $9F1A,$02 Verb LOCK, noun DOOR.
  $9F1C,$02 #R$6713 "#R$8ED9(shut)".
  $9F1E,$03 #R$69BF "#R$8ED9(shut)" and "#R$8ED5(locked)".
  $9F21,$03 #R$69BF
. "#R$8DA0(There is a closed door to the south)" and
. "#R$8D93(There is a locked door to the south)", then stop.
N $9F24 LOCK DOOR.
  $9F24,$02 Verb LOCK, noun DOOR.
  $9F26,$02 #R$6713 "#R$8EDE(open)".
  $9F28,$03 #R$69BF "#R$8EDE(open)" and "#R$8ED5(locked)".
  $9F2B,$03 #R$69BF
. "#R$8DAE(An open door leads south into a room)" and
. "#R$8D93(There is a locked door to the south)", then stop.
N $9F2E LOCK DOOR.
  $9F2E,$02 Verb LOCK, noun DOOR.
  $9F30,$02 #R$6713 "#R$8DA0(There is a closed door to the south)".
  $9F32,$03 #R$69BF "#R$8ED9(shut)" and "#R$8ED5(locked)".
  $9F35,$03 #R$69BF
. "#R$8DA0(There is a closed door to the south)" and
. "#R$8D93(There is a locked door to the south)", then stop.
N $9F38 LOCK DOOR.
  $9F38,$02 Verb LOCK, noun DOOR.
  $9F3A,$02 #R$6713 "#R$8DAE(An open door leads south into a room)".
  $9F3C,$03 #R$69BF "#R$8EDE(open)" and "#R$8ED5(locked)".
  $9F3F,$03 #R$69BF
. "#R$8DAE(An open door leads south into a room)" and
. "#R$8D93(There is a locked door to the south)", then stop.
N $9F42 UNLO DOOR.
  $9F42,$02 Verb UNLO, noun DOOR.
  $9F44,$02 #R$6713 "#R$8ED5(locked)".
  $9F46,$02 #R$6709 "#R$9150(brass key)".
  $9F48,$03 #R$69BF "#R$8ED5(locked)" and "#R$8ED9(shut)".
  $9F4B,$03 #R$69BF
. "#R$8D93(There is a locked door to the south)" and
. "#R$8DA0(There is a closed door to the south)", then stop.
N $9F4E UNLO DOOR.
  $9F4E,$02 Verb UNLO, noun DOOR.
  $9F50,$02 #R$6713 "#R$8D93(There is a locked door to the south)".
  $9F52,$02 #R$6709 "#R$9150(brass key)".
  $9F54,$03 #R$69BF "#R$8ED5(locked)" and "#R$8ED9(shut)".
  $9F57,$03 #R$69BF
. "#R$8D93(There is a locked door to the south)" and
. "#R$8DA0(There is a closed door to the south)", then stop.
N $9F5A UNLO DOOR.
  $9F5A,$02 Verb UNLO, noun DOOR.
  $9F5C,$02 #R$6713 "#R$8D93(There is a locked door to the south)".
  $9F5E,$02 #R$63E6 "#R$8323(you have no suitable key.)", then stop.
N $9F60 UNLO DOOR.
  $9F60,$02 Verb UNLO, noun DOOR.
  $9F62,$02 #R$6713 "#R$8ED5(locked)".
  $9F64,$02 #R$63E6 "#R$8323(you have no suitable key.)", then stop.
N $9F66 PUSH TRIP.
  $9F66,$02 Verb PUSH, PULL, ROLL or MOVE, noun TRIP or WIRE.
  $9F68,$02 #R$66EB "#R$77FF(you are in a low dark passage covered in mould)".
  $9F6A,$02 #R$63E6 #R$833D(#N$4B).
  $9F6C,$01 #R$685B.
N $9F6D DIG CEIL.
  $9F6D,$02 Verb DIG, noun CEIL or ROOF.
  $9F6F,$02 #R$66EB "#R$77DC(you are in a smelly earthen cave)".
  $9F71,$02 #R$6733 "#R$9202(earth spell)".
  $9F73,$02 #R$63E6 "#R$801D(You have found something.)".
  $9F75,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $9F78,$02 #R$6965 "#R$9202(earth spell)", then stop.
N $9F7A UNLO DOOR.
  $9F7A,$02 Verb UNLO, noun DOOR.
  $9F7C,$02 #R$6713 "#R$8E6C(There is a locked door to the east)".
  $9F7E,$02 #R$63E6 "#R$8323(you have no suitable key.)", then stop.
N $9F80 KILL DOOR.
  $9F80,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun DOOR.
  $9F82,$02 #R$6713 "#R$8E6C(There is a locked door to the east)".
  $9F84,$03 #R$69BF
. "#R$8E6C(There is a locked door to the east)" and
. "#R$8DC0(You can go east through a broken down door)", then stop.
N $9F87 GO DOOR.
  $9F87,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun DOOR.
  $9F89,$02 #R$6713 "#R$8E6C(There is a locked door to the east)".
  $9F8B,$02 #R$63E6 "#R$82FA(it is locked.)", then stop.
N $9F8D GO DOOR.
  $9F8D,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun DOOR.
  $9F8F,$02 #R$6713 "#R$8DC0(You can go east through a broken down door)".
  $9F91,$02 #R$6892 "#R$7836(you are in a stinking damp cell)", then stop.
N $9F93 GO DOOR.
  $9F93,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun DOOR.
  $9F95,$02 #R$6713 "#R$8DD6(You can go west through a broken down door)".
  $9F97,$02 #R$6892
. "#R$781E(you are in a dank and dripping dungeon)", then stop.
N $9F99 EXAM DOOR.
  $9F99,$02 Verb EXAM, LOOK, SEAR or READ, noun DOOR.
  $9F9B,$02 #R$6713 "#R$8E6C(There is a locked door to the east)".
  $9F9D,$02 #R$63E6 "#R$8359(the door looks very weak.)", then stop.
N $9F9F OPEN DOOR.
  $9F9F,$02 Verb OPEN, noun DOOR.
  $9FA1,$02 #R$6713 "#R$8E6C(There is a locked door to the east)".
  $9FA3,$02 #R$63E6 "#R$82FA(it is locked.)", then stop.
N $9FA5 EXAM PRIE.
  $9FA5,$02 Verb EXAM, LOOK, SEAR or READ, noun PRIE.
  $9FA7,$02 #R$6709 "#R$9149(dead priest)".
  $9FA9,$02 #R$6733 "#R$92DC(blast spell)".
  $9FAB,$02 #R$6965 "#R$92DC(blast spell)".
  $9FAD,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $9FAF GO DOOR.
  $9FAF,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun DOOR.
  $9FB1,$02 #R$6713 "#R$8EDE(open)".
  $9FB3,$02 #R$6892 "#R$77E6(you are in a shadowy corridor)", then stop.
N $9FB5 GO DOOR.
  $9FB5,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun DOOR.
  $9FB7,$02 #R$6713 "#R$8DAE(An open door leads south into a room)".
  $9FB9,$02 #R$6892 "#R$77F8(you are in a work room)", then stop.
N $9FBB EXAM VAMP.
  $9FBB,$02 Verb EXAM, LOOK, SEAR or READ, noun VAMP.
  $9FBD,$02 #R$6709 "#R$9183(vampire)".
  $9FBF,$02 #R$63E6 "#R$8439(he's totally BATTY!!!!)", then stop.
N $9FC1 GET SCEP.
  $9FC1,$02 Verb GET or TAKE, noun SCEP.
  $9FC3,$02 #R$68B0 "#R$9249(sceptre)", then stop.
N $9FC5 DROP SCEP.
  $9FC5,$02 Verb DROP, noun SCEP.
  $9FC7,$02 #R$68E4 "#R$9249(sceptre)", then stop.
N $9FC9 GET TIN.
  $9FC9,$02 Verb GET or TAKE, noun TIN.
  $9FCB,$02 #R$6713 "#R$9255(open)".
  $9FCD,$02 #R$68B0 "#R$9255(open)".
N $9FCF GET TIN.
  $9FCF,$02 Verb GET or TAKE, noun TIN.
  $9FD1,$02 #R$6713 "#R$9259(closed)".
  $9FD3,$02 #R$68B0 "#R$9259(closed)".
N $9FD5 GET TIN.
  $9FD5,$02 Verb GET or TAKE, noun TIN.
  $9FD7,$02 #R$68B0 "#R$925E(metal tin)", then stop.
N $9FD9 DROP TIN.
  $9FD9,$02 Verb DROP, noun TIN.
  $9FDB,$02 #R$6739 "#R$9255(open)".
  $9FDD,$02 #R$68E4 "#R$9255(open)".
N $9FDF DROP TIN.
  $9FDF,$02 Verb DROP, noun TIN.
  $9FE1,$02 #R$6739 "#R$9259(closed)".
  $9FE3,$02 #R$68E4 "#R$9259(closed)".
N $9FE5 DROP TIN.
  $9FE5,$02 Verb DROP, noun TIN.
  $9FE7,$02 #R$68E4 "#R$925E(metal tin)", then stop.
N $9FE9 GET EART.
  $9FE9,$02 Verb GET or TAKE, noun EART.
  $9FEB,$02 #R$68B0 "#R$9265(earth spell)", then stop.
N $9FED DROP EART.
  $9FED,$02 Verb DROP, noun EART.
  $9FEF,$02 #R$68E4 "#R$9265(earth spell)", then stop.
N $9FF1 GET BUCK.
  $9FF1,$02 Verb GET or TAKE, noun BUCK.
  $9FF3,$02 #R$6713 "#R$927C(full of slime)".
  $9FF5,$02 #R$68B0 "#R$927C(full of slime)".
N $9FF7 GET BUCK.
  $9FF7,$02 Verb GET or TAKE, noun BUCK.
  $9FF9,$02 #R$68B0 "#R$9269(bucket made of antimagic stone)", then stop.
N $9FFB DROP BUCK.
  $9FFB,$02 Verb DROP, noun BUCK.
  $9FFD,$02 #R$6713 "#R$927C(full of slime)".
  $9FFF,$02 #R$68E4 "#R$927C(full of slime)".
N $A001 DROP BUCK.
  $A001,$02 Verb DROP, noun BUCK.
  $A003,$02 #R$68E4 "#R$9269(bucket made of antimagic stone)", then stop.
N $A005 GET CHAL.
  $A005,$02 Verb GET or TAKE, noun CHAL.
  $A007,$02 #R$68B0 "#R$9285(chalk)", then stop.
N $A009 DROP CHAL.
  $A009,$02 Verb DROP, noun CHAL.
  $A00B,$02 #R$68E4 "#R$9285(chalk)", then stop.
N $A00D GET HARP.
  $A00D,$02 Verb GET or TAKE, noun HARP.
  $A00F,$02 #R$68B0 "#R$92A0(magic harp)", then stop.
N $A011 DROP HARP.
  $A011,$02 Verb DROP, noun HARP.
  $A013,$02 #R$68E4 "#R$92A0(magic harp)", then stop.
N $A015 GET ORB.
  $A015,$02 Verb GET or TAKE, noun ORB or SPEL.
  $A017,$02 #R$68B0 "#R$92B1(magic orb)", then stop.
N $A019 DROP ORB.
  $A019,$02 Verb DROP, noun ORB or SPEL.
  $A01B,$02 #R$68E4 "#R$92B1(magic orb)", then stop.
N $A01D GET CROW.
  $A01D,$02 Verb GET or TAKE, noun CROW.
  $A01F,$02 #R$68B0 "#R$92B9(The Crown Of The Mountains)", then stop.
N $A021 DROP CROW.
  $A021,$02 Verb DROP, noun CROW.
  $A023,$02 #R$68E4 "#R$92B9(The Crown Of The Mountains)", then stop.
N $A025 GET GOLD.
  $A025,$02 Verb GET or TAKE, noun GOLD or BAR.
  $A027,$02 #R$68B0 "#R$92CD(gold bar)", then stop.
N $A029 DROP GOLD.
  $A029,$02 Verb DROP, noun GOLD or BAR.
  $A02B,$02 #R$68E4 "#R$92CD(gold bar)", then stop.
N $A02D GET DIAM.
  $A02D,$02 Verb GET or TAKE, noun DIAM.
  $A02F,$02 #R$68B0 "#R$92D5(diamond)", then stop.
N $A031 DROP DIAM.
  $A031,$02 Verb DROP, noun DIAM.
  $A033,$02 #R$68E4 "#R$92D5(diamond)", then stop.
N $A035 GET BLAS.
  $A035,$02 Verb GET or TAKE, noun BLAS.
  $A037,$02 #R$6713 "#R$92DC(blast spell)".
  $A039,$02 #R$68B0 "#R$92DC(blast spell)", then stop.
N $A03B GET BLAS.
  $A03B,$02 Verb GET or TAKE, noun BLAS.
  $A03D,$02 #R$68B0 "#R$92E1(blast spell)", then stop.
N $A03F DROP BLAS.
  $A03F,$02 Verb DROP, noun BLAS.
  $A041,$02 #R$6739 "#R$92DC(blast spell)".
  $A043,$02 #R$68E4 "#R$92DC(blast spell)", then stop.
N $A045 DROP BLAS.
  $A045,$02 Verb DROP, noun BLAS.
  $A047,$02 #R$68E4 "#R$92E1(blast spell)", then stop.
N $A049 GET PLAN.
  $A049,$02 Verb GET or TAKE, noun PLAN.
  $A04B,$02 #R$68B0 "#R$92E6(plank)", then stop.
N $A04D DROP PLAN.
  $A04D,$02 Verb DROP, noun PLAN.
  $A04F,$02 #R$68E4 "#R$92E6(plank)", then stop.
N $A051 GET TELE.
  $A051,$02 Verb GET or TAKE, noun TELE.
  $A053,$02 #R$68B0 "#R$92EB(teleport spell)", then stop.
N $A055 DROP TELE.
  $A055,$02 Verb DROP, noun TELE.
  $A057,$02 #R$68E4 "#R$92EB(teleport spell)", then stop.
N $A059 GET WIND.
  $A059,$02 Verb GET or TAKE, noun WIND.
  $A05B,$02 #R$68B0 "#R$92F3(wind spell)", then stop.
N $A05D DROP WIND.
  $A05D,$02 Verb DROP, noun WIND.
  $A05F,$02 #R$68E4 "#R$92F3(wind spell)", then stop.
N $A061 GET SKIN.
  $A061,$02 Verb GET or TAKE, noun SKIN.
  $A063,$02 #R$68B0 "#R$9307(yeti skin)", then stop.
N $A065 DROP SKIN.
  $A065,$02 Verb DROP, noun SKIN.
  $A067,$02 #R$68E4 "#R$9307(yeti skin)", then stop.
N $A069 WEAR SKIN.
  $A069,$02 Verb WEAR, noun SKIN.
  $A06B,$02 #R$6A83 "#R$9307(yeti skin)", then stop.
N $A06D GET BLES.
  $A06D,$02 Verb GET or TAKE, noun BLES.
  $A06F,$02 #R$68B0 "#R$9324(bless spell)", then stop.
N $A071 DROP BLES.
  $A071,$02 Verb DROP, noun BLES.
  $A073,$02 #R$68E4 "#R$9324(bless spell)", then stop.
N $A075 REMO SKIN.
  $A075,$02 Verb REMO, noun SKIN.
  $A077,$02 #R$6AAD "#R$92FC(body)", then stop.
N $A079 GET SHAT.
  $A079,$02 Verb GET or TAKE, noun SHAT.
  $A07B,$02 #R$68B0 "#R$932A(shatter spell)", then stop.
N $A07D DROP SHAT.
  $A07D,$02 Verb DROP, noun SHAT.
  $A07F,$02 #R$68E4 "#R$932A(shatter spell)", then stop.
N $A081 GET CRAT.
  $A081,$02 Verb GET or TAKE, noun CRAT.
  $A083,$02 #R$68B0 "#R$9336(crate)", then stop.
N $A085 DROP CRAT.
  $A085,$02 Verb DROP, noun CRAT.
  $A087,$02 #R$68E4 "#R$9336(crate)", then stop.
N $A089 GET BOOK.
  $A089,$02 Verb GET or TAKE, noun BOOK.
  $A08B,$02 #R$68B0 "#R$933A(mystic book)", then stop.
N $A08D DROP BOOK.
  $A08D,$02 Verb DROP, noun BOOK.
  $A08F,$02 #R$68E4 "#R$933A(mystic book)", then stop.
N $A091 GET ICE.
  $A091,$02 Verb GET or TAKE, noun ICE or WALL.
  $A093,$02 #R$68B0 "#R$9343(ice wall spell)", then stop.
N $A095 DROP ICE.
  $A095,$02 Verb DROP, noun ICE or WALL.
  $A097,$02 #R$68E4 "#R$9343(ice wall spell)", then stop.
N $A099 GET SILV.
  $A099,$02 Verb GET or TAKE, noun SILV or OBEL.
  $A09B,$02 #R$68B0 "#R$9348(small silver obelisk)", then stop.
N $A09D DROP SILV.
  $A09D,$02 Verb DROP, noun SILV or OBEL.
  $A09F,$02 #R$68E4 "#R$9348(small silver obelisk)", then stop.
N $A0A1 GET MIND.
  $A0A1,$02 Verb GET or TAKE, noun MIND.
  $A0A3,$02 #R$68B0 "#R$9357(mind shield spell)", then stop.
N $A0A5 DROP MIND.
  $A0A5,$02 Verb DROP, noun MIND.
  $A0A7,$02 #R$68E4 "#R$9357(mind shield spell)", then stop.
N $A0A9 UNTI ROPE.
  $A0A9,$02 Verb UNTI or UNFA, noun ROPE.
  $A0AB,$02 #R$6713 "#R$8EE1(A)".
  $A0AD,$03 #R$69E8 as #R$A0B7(GET ROPE).
N $A0B0 UNTI ROPE.
  $A0B0,$02 Verb UNTI or UNFA, noun ROPE.
  $A0B2,$02 #R$6713 "#R$8EF5(A)".
  $A0B4,$03 #R$69E8 as #R$A0B7(GET ROPE).
N $A0B7 GET ROPE.
  $A0B7,$02 Verb GET or TAKE, noun ROPE.
  $A0B9,$02 #R$6713 "#R$8EE4(knotted)".
  $A0BB,$03 #R$69BF "#R$8EE4(knotted)" and "#R$9237(knotted)".
  $A0BE,$02 #R$695D "#R$8EF8(knotted)".
N $A0C0 GET ROPE.
  $A0C0,$02 Verb GET or TAKE, noun ROPE.
  $A0C2,$02 #R$6713 "#R$8EF8(knotted)".
  $A0C4,$03 #R$69BF "#R$8EF8(knotted)" and "#R$9237(knotted)".
  $A0C7,$02 #R$695D "#R$8EE4(knotted)".
N $A0C9 GET ROPE.
  $A0C9,$02 Verb GET or TAKE, noun ROPE.
  $A0CB,$02 #R$67A9 #R$5D9E(#N$17).
  $A0CD,$02 #R$6965 "#R$9240(with a ring tied to it)".
N $A0CF GET ROPE.
  $A0CF,$02 Verb GET or TAKE, noun ROPE.
  $A0D1,$02 #R$6713 "#R$8EE1(A)".
  $A0D3,$02 #R$695D "#R$8EE1(A)".
  $A0D5,$02 #R$695D "#R$8EF5(A)".
  $A0D7,$02 #R$695D "#R$8EEA(rope spans the fissure)".
  $A0D9,$02 #R$695D "#R$8EFE(rope spans the fissure)".
  $A0DB,$02 #R$6965 "#R$923C(rope)".
N $A0DD GET ROPE.
  $A0DD,$02 Verb GET or TAKE, noun ROPE.
  $A0DF,$02 #R$6713 "#R$8EF5(A)".
  $A0E1,$02 #R$695D "#R$8EE1(A)".
  $A0E3,$02 #R$695D "#R$8EF5(A)".
  $A0E5,$02 #R$695D "#R$8EEA(rope spans the fissure)".
  $A0E7,$02 #R$695D "#R$8EFE(rope spans the fissure)".
  $A0E9,$02 #R$6965 "#R$923C(rope)".
N $A0EB GET ROPE.
  $A0EB,$02 Verb GET or TAKE, noun ROPE.
  $A0ED,$02 #R$6713 "#R$9237(knotted)".
  $A0EF,$02 #R$68B0 "#R$9237(knotted)".
N $A0F1 GET ROPE.
  $A0F1,$02 Verb GET or TAKE, noun ROPE.
  $A0F3,$02 #R$6713 "#R$9240(with a ring tied to it)".
  $A0F5,$02 #R$68B0 "#R$9240(with a ring tied to it)".
N $A0F7 GET ROPE.
  $A0F7,$02 Verb GET or TAKE, noun ROPE.
  $A0F9,$02 #R$68B0 "#R$923C(rope)", then stop.
N $A0FB DROP ROPE.
  $A0FB,$02 Verb DROP, noun ROPE.
  $A0FD,$02 #R$6739 "#R$9237(knotted)".
  $A0FF,$02 #R$68E4 "#R$9237(knotted)".
N $A101 TIE ROPE.
  $A101,$02 Verb TIE or FAST, noun ROPE.
  $A103,$02 #R$6759 #N$00.
  $A105,$02 #R$63E6 "#R$8C8D(Be more specific)", then stop.
N $A107 TIE ROPE.
  $A107,$02 Verb TIE or FAST, noun ROPE.
  $A109,$02 #R$6759 #N$00.
  $A10B,$02 #R$63E6 "#R$7E26(. You can see)", then stop.
N $A10D DROP ROPE.
  $A10D,$02 Verb DROP, noun ROPE.
  $A10F,$02 #R$6739 "#R$9240(with a ring tied to it)".
  $A111,$02 #R$68E4 "#R$9240(with a ring tied to it)".
N $A113 TIE ROPE.
  $A113,$02 Verb TIE or FAST, noun ROPE.
  $A115,$02 #R$6759 #N$CE.
  $A117,$03 #R$69E8 as #R$A125(TIE RING).
N $A11A TIE ROPE.
  $A11A,$02 Verb TIE or FAST, noun ROPE.
  $A11C,$02 #R$6760 #N$CE.
  $A11E,$03 #R$69E8 as #R$A125(TIE RING).
N $A121 DROP ROPE.
  $A121,$02 Verb DROP, noun ROPE.
  $A123,$02 #R$68E4 "#R$923C(rope)", then stop.
N $A125 TIE RING.
  $A125,$02 Verb TIE or FAST, noun RING.
  $A127,$02 #R$6709 "#R$923C(rope)".
  $A129,$02 #R$6709 #R$8DFC(#N$0F).
  $A12B,$03 #R$69BF #R$8DFC(#N$0F) and "#R$9206(metal ring)".
  $A12E,$02 #R$63E6 "#R$84C6(the ring comes out of the wall.)".
N $A130 TIE RING.
  $A130,$02 Verb TIE or FAST, noun RING.
  $A132,$02 #R$6709 "#R$9206(metal ring)".
  $A134,$02 #R$6713 "#R$923C(rope)".
  $A136,$02 #R$6965 "#R$9240(with a ring tied to it)".
  $A138,$02 #R$695D "#R$9206(metal ring)".
  $A13A,$02 #R$69DB #R$5D9E(#N$17).
  $A13C,$02 #R$63E6
. "#R$84A6(you loop the rope end through the ring.)", then stop.
N $A13E TIE RING.
  $A13E,$02 Verb TIE or FAST, noun RING.
  $A140,$02 #R$6709 "#R$9206(metal ring)".
  $A142,$02 #R$6739 "#R$923C(rope)".
  $A144,$02 #R$6965 "#R$9240(with a ring tied to it)".
  $A146,$02 #R$695D "#R$9206(metal ring)".
  $A148,$02 #R$68B0 "#R$9240(with a ring tied to it)".
  $A14A,$02 #R$69DB #R$5D9E(#N$17).
  $A14C,$02 #R$63E6
. "#R$84A6(you loop the rope end through the ring.)", then stop.
N $A14E UNTI RING.
  $A14E,$02 Verb UNTI or UNFA, noun RING.
  $A150,$02 #R$6709 "#R$9240(with a ring tied to it)".
  $A152,$03 #R$69BF "#R$9240(with a ring tied to it)" and "#R$9206(metal ring)".
  $A155,$02 #R$69E2 #R$5D9E(#N$17), then stop.
N $A157 THRO ROPE.
  $A157,$02 Verb THRO or HURL, noun ROPE.
  $A159,$02 #R$66EB #R$79BA(#N$30).
  $A15B,$02 #R$6709 "#R$923C(rope)".
  $A15D,$02 #R$671A "#R$9240(with a ring tied to it)".
  $A15F,$02 #R$63E6 "#R$844B(the rope doesn't carry far enough.)", then stop.
N $A161 THRO ROPE.
  $A161,$02 Verb THRO or HURL, noun ROPE.
  $A163,$02 #R$66EB #R$7925(#N$29).
  $A165,$02 #R$6709 "#R$923C(rope)".
  $A167,$02 #R$671A "#R$9240(with a ring tied to it)".
  $A169,$02 #R$63E6 "#R$844B(the rope doesn't carry far enough.)", then stop.
N $A16B THRO ROPE.
  $A16B,$02 Verb THRO or HURL, noun ROPE.
  $A16D,$02 #R$66EB #R$79BA(#N$30).
  $A16F,$02 #R$6709 "#R$9237(knotted)".
  $A171,$02 #R$695D "#R$9237(knotted)".
  $A173,$02 #R$6965 "#R$8EE4(knotted)".
  $A175,$03 #R$6A16 "#R$8EF8(knotted)" and #R$7925(#N$29).
N $A178 THRO ROPE.
  $A178,$02 Verb THRO or HURL, noun ROPE.
  $A17A,$02 #R$66EB #R$7925(#N$29).
  $A17C,$02 #R$6709 "#R$9237(knotted)".
  $A17E,$02 #R$695D "#R$9237(knotted)".
  $A180,$03 #R$6A16 "#R$8EE4(knotted)" and #R$79BA(#N$30).
  $A183,$02 #R$6965 "#R$8EF8(knotted)".
N $A185 THRO ROPE.
  $A185,$02 Verb THRO or HURL, noun ROPE.
  $A187,$02 #R$66EB #R$79BA(#N$30).
  $A189,$02 #R$6709 "#R$923C(rope)".
  $A18B,$02 #R$695D "#R$923C(rope)".
  $A18D,$02 #R$6965 "#R$8EE1(A)".
  $A18F,$02 #R$6965 "#R$8EEA(rope spans the fissure)".
  $A191,$03 #R$6A16 "#R$8EF5(A)" and #R$7925(#N$29).
  $A194,$03 #R$6A16 "#R$8EFE(rope spans the fissure)" and #R$7925(#N$29).
  $A197,$02 #R$695D "#R$9240(with a ring tied to it)", then stop.
N $A199 THRO ROPE.
  $A199,$02 Verb THRO or HURL, noun ROPE.
  $A19B,$02 #R$66EB #R$7925(#N$29).
  $A19D,$02 #R$6709 "#R$923C(rope)".
  $A19F,$02 #R$695D "#R$923C(rope)".
  $A1A1,$03 #R$6A16 "#R$8EE1(A)" and #R$79BA(#N$30).
  $A1A4,$03 #R$6A16 "#R$8EEA(rope spans the fissure)" and #R$79BA(#N$30).
  $A1A7,$02 #R$6965 "#R$8EF5(A)".
  $A1A9,$02 #R$6965 "#R$8EFE(rope spans the fissure)".
  $A1AB,$02 #R$695D "#R$9240(with a ring tied to it)", then stop.
N $A1AD GO ROPE.
  $A1AD,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun ROPE.
  $A1AF,$02 #R$6713 "#R$8EE4(knotted)".
  $A1B1,$02 #R$6892 #R$7925(#N$29), then stop.
N $A1B3 GO ROPE.
  $A1B3,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun ROPE.
  $A1B5,$02 #R$6713 "#R$8EF8(knotted)".
  $A1B7,$02 #R$6892 #R$79BA(#N$30), then stop.
N $A1B9 GO ROPE.
  $A1B9,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun ROPE.
  $A1BB,$02 #R$6713 "#R$8EE1(A)".
  $A1BD,$02 #R$63E6 "#R$8460(it is too slippy to climb.)", then stop.
N $A1BF GO ROPE.
  $A1BF,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun ROPE.
  $A1C1,$02 #R$6713 "#R$8EF5(A)".
  $A1C3,$02 #R$63E6 "#R$8460(it is too slippy to climb.)", then stop.
N $A1C5 TIE KNOT.
  $A1C5,$02 Verb TIE or FAST, noun KNOT.
  $A1C7,$03 #R$69E8 as #R$A1DB(KNOT ROPE).
N $A1CA TIE any.
  $A1CA,$02 Verb TIE or FAST, noun any.
  $A1CC,$02 #R$6709 "#R$923C(rope)".
  $A1CE,$02 #R$63E6 #R$846F(#N$54), then stop.
N $A1D0 CUT ROPE.
  $A1D0,$02 Verb CUT or CHOP, noun ROPE.
  $A1D2,$02 #R$6713 "#R$8DED(A wizard is hung from a rope here)".
  $A1D4,$03 #R$69BF
. "#R$8DED(A wizard is hung from a rope here)" and "#R$923C(rope)".
  $A1D7,$02 #R$6965 "#R$919D(body)".
  $A1D9,$02 #R$63E6
. "#R$84B9(the rope, and the wizard fall to the floor.)", then stop.
N $A1DB KNOT ROPE.
  $A1DB,$02 Verb KNOT, noun ROPE.
  $A1DD,$02 #R$6713 "#R$923C(rope)".
  $A1DF,$02 #R$671A "#R$9237(knotted)".
  $A1E1,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
  $A1E4,$02 #R$6965 "#R$9237(knotted)", then stop.
N $A1E6 KNOT ROPE.
  $A1E6,$02 Verb KNOT, noun ROPE.
  $A1E8,$02 #R$6739 "#R$923C(rope)".
  $A1EA,$02 #R$671A "#R$9237(knotted)".
  $A1EC,$02 #R$6965 "#R$9237(knotted)".
  $A1EE,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
  $A1F1,$02 #R$68B0 "#R$9237(knotted)", then stop.
N $A1F3 KILL RING.
  $A1F3,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun RING.
  $A1F5,$03 #R$69E8 as #R$A1F8(PUSH RING).
N $A1F8 PUSH RING.
  $A1F8,$02 Verb PUSH, PULL, ROLL or MOVE, noun RING.
  $A1FA,$02 #R$6713 #R$8DFC(#N$0F).
  $A1FC,$03 #R$69BF #R$8DFC(#N$0F) and "#R$9206(metal ring)".
  $A1FF,$02 #R$63E6 "#R$84C6(the ring comes out of the wall.)", then stop.
N $A201 TURN RING.
  $A201,$02 Verb TURN or TWIS, noun RING.
  $A203,$02 #R$6713 #R$8DFC(#N$0F).
  $A205,$02 #R$6733 "#R$8E15(A secret passage exits through one wall)".
  $A207,$02 #R$63E6 "#R$801D(You have found something.)".
  $A209,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
  $A20C,$02 #R$6965
. "#R$8E15(A secret passage exits through one wall)", then stop.
N $A20E GO PASS.
  $A20E,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A210,$02 #R$6713 "#R$8E15(A secret passage exits through one wall)".
  $A212,$02 #R$6892 #R$79BA(#N$30), then stop.
N $A214 SWIM any.
  $A214,$02 Verb SWIM, noun any.
  $A216,$02 #R$66F9 #R$7A2E(#N$34).
  $A218,$02 #R$6702 #R$7A85(#N$37).
  $A21A,$02 #R$6740 "#R$91A6(black robe)".
  $A21C,$02 #R$6965 "#R$91A2(wet)".
  $A21E,$02 #R$68B0 "#R$91A2(wet)".
N $A220 SWIM any.
  $A220,$02 Verb SWIM, noun any.
  $A222,$02 #R$66F9 #R$7A2E(#N$34).
  $A224,$02 #R$6702 #R$7A85(#N$37).
  $A226,$02 #R$6739 "#R$91A6(black robe)".
  $A228,$02 #R$6965 "#R$91A2(wet)".
  $A22A,$02 #R$68B0 "#R$91A2(wet)".
N $A22C SWIM any.
  $A22C,$02 Verb SWIM, noun any.
  $A22E,$02 #R$66EB "#R$7A63(you are in a narrow canyon beside a stream)".
  $A230,$02 #R$6892
. "#R$7A74(you are in the canyon on the east bank of the stream)", then stop.
N $A232 SWIM any.
  $A232,$02 Verb SWIM, noun any.
  $A234,$02 #R$66EB
. "#R$7A74(you are in the canyon on the east bank of the stream)".
  $A236,$02 #R$6892
. "#R$7A63(you are in a narrow canyon beside a stream)", then stop.
N $A238 GO PIT.
  $A238,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PIT.
  $A23A,$02 #R$66EB "#R$7AA4(you are in a wet dripping cave)".
  $A23C,$02 #R$671A "#R$8FAD(There is a pit in the floor)".
  $A23E,$02 #R$63E6 #R$84D7(#N$59).
  $A240,$01 #R$685B.
N $A241 GO PIT.
  $A241,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PIT.
  $A243,$02 #R$66EB "#R$7AA4(you are in a wet dripping cave)".
  $A245,$02 #R$6892 "#R$7B48(you are in a slime pit)", then stop.
N $A247 OPEN GRIL.
  $A247,$02 Verb OPEN, noun GRIL.
  $A249,$02 #R$6713 "#R$902F(grille in the floor)".
  $A24B,$02 #R$63E6 "#R$84F6(it won't open.)", then stop.
N $A24D KILL GRIL.
  $A24D,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun GRIL.
  $A24F,$02 #R$6709 "#R$902F(grille in the floor)".
  $A251,$02 #R$671A "#R$902A(broken)".
  $A253,$02 #R$6965 "#R$902A(broken)", then stop.
N $A255 GO GRIL.
  $A255,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun GRIL.
  $A257,$02 #R$6709 "#R$902A(broken)".
  $A259,$02 #R$6892 #R$7AE4(#N$3C), then stop.
N $A25B GO GRIL.
  $A25B,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun GRIL.
  $A25D,$02 #R$66EB #R$7AE4(#N$3C).
  $A25F,$02 #R$6892 "#R$7ADC(you are in a small room with a)", then stop.
N $A261 PUT TENT.
  $A261,$02 Verb PUT or TOUC, noun TENT or SLIM.
  $A263,$02 #R$6759 #N$EC.
  $A265,$03 #R$69E8 as #R$A274(FILL BUCK).
N $A268 GET TENT.
  $A268,$02 Verb GET or TAKE, noun TENT or SLIM.
  $A26A,$02 #R$6709 "#R$9269(bucket made of antimagic stone)".
  $A26C,$03 #R$69E8 as #R$A274(FILL BUCK).
N $A26F DROP TENT.
  $A26F,$02 Verb DROP, noun TENT or SLIM.
  $A271,$03 #R$69E8 as #R$A29D(EMPT BUCK).
N $A274 FILL BUCK.
  $A274,$02 Verb FILL, noun BUCK.
  $A276,$02 #R$6709 "#R$927C(full of slime)".
  $A278,$02 #R$63E6 "#R$84FF(it is full.)", then stop.
N $A27A FILL BUCK.
  $A27A,$02 Verb FILL, noun BUCK.
  $A27C,$02 #R$6713 "#R$9269(bucket made of antimagic stone)".
  $A27E,$02 #R$66EB "#R$7AA4(you are in a wet dripping cave)".
  $A280,$02 #R$6709 "#R$8F9F(There is a pit of oily slime in the floor)".
  $A282,$03 #R$69F4 #R$5D9F(#N$18) and #N$01.
  $A285,$02 #R$6965 "#R$927C(full of slime)".
N $A287 FILL BUCK.
  $A287,$02 Verb FILL, noun BUCK.
  $A289,$02 #R$6739 "#R$9269(bucket made of antimagic stone)".
  $A28B,$02 #R$66EB "#R$7AA4(you are in a wet dripping cave)".
  $A28D,$02 #R$6709 "#R$8F9F(There is a pit of oily slime in the floor)".
  $A28F,$03 #R$69F4 #R$5D9F(#N$18) and #N$01.
  $A292,$02 #R$6965 "#R$927C(full of slime)".
  $A294,$02 #R$68B0 "#R$927C(full of slime)".
N $A296 POUR TENT.
  $A296,$02 Verb POUR, noun TENT or SLIM.
  $A298,$02 #R$6726 "#R$9296(sleeping giant)".
  $A29A,$03 #R$69E8 as #R$A29D(EMPT BUCK).
N $A29D EMPT BUCK.
  $A29D,$02 Verb EMPT, noun BUCK.
  $A29F,$02 #R$66F2 "#R$7ADC(you are in a small room with a)".
  $A2A1,$02 #R$6709 "#R$927C(full of slime)".
  $A2A3,$02 #R$6965 "#R$9036(Puddles of slime cover the floor)".
  $A2A5,$02 #R$695D "#R$927C(full of slime)", then stop.
N $A2A7 EMPT BUCK.
  $A2A7,$02 Verb EMPT, noun BUCK.
  $A2A9,$02 #R$6709 "#R$927C(full of slime)".
  $A2AB,$02 #R$6713 "#R$902A(broken)".
  $A2AD,$02 #R$695D "#R$927C(full of slime)".
  $A2AF,$03 #R$6A16
. "#R$9036(Puddles of slime cover the floor)" and #R$7AE4(#N$3C), then stop.
N $A2B2 EMPT BUCK.
  $A2B2,$02 Verb EMPT, noun BUCK.
  $A2B4,$02 #R$6709 "#R$927C(full of slime)".
  $A2B6,$02 #R$6713 "#R$902F(grille in the floor)".
  $A2B8,$03 #R$67B1 #R$5D9F(#N$18) and #N$03.
  $A2BB,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $A2BE,$02 #R$63E6 "#R$801D(You have found something.)".
  $A2C0,$02 #R$6965 "#R$92E1(blast spell)".
N $A2C2 EMPT BUCK.
  $A2C2,$02 Verb EMPT, noun BUCK.
  $A2C4,$02 #R$6709 "#R$927C(full of slime)".
  $A2C6,$02 #R$6713 "#R$902F(grille in the floor)".
  $A2C8,$02 #R$695D "#R$927C(full of slime)".
  $A2CA,$03 #R$6A16
. "#R$9036(Puddles of slime cover the floor)" and #R$7AE4(#N$3C), then stop.
N $A2CD THRO TENT.
  $A2CD,$02 Verb THRO or HURL, noun TENT or SLIM.
  $A2CF,$02 #R$6759 #N$EE.
  $A2D1,$03 #R$69E8 as #R$A304(THRO BUCK).
N $A2D4 THRO TENT.
  $A2D4,$02 Verb THRO or HURL, noun TENT or SLIM.
  $A2D6,$02 #R$6760 #N$EE.
  $A2D8,$03 #R$69E8 as #R$A304(THRO BUCK).
N $A2DB PUT TENT.
  $A2DB,$02 Verb PUT or TOUC, noun TENT or SLIM.
  $A2DD,$02 #R$6759 #N$EE.
  $A2DF,$03 #R$69E8 as #R$A304(THRO BUCK).
N $A2E2 PUT TENT.
  $A2E2,$02 Verb PUT or TOUC, noun TENT or SLIM.
  $A2E4,$02 #R$6760 #N$EE.
  $A2E6,$03 #R$69E8 as #R$A304(THRO BUCK).
N $A2E9 POUR TENT.
  $A2E9,$02 Verb POUR, noun TENT or SLIM.
  $A2EB,$02 #R$6759 #N$EE.
  $A2ED,$03 #R$69E8 as #R$A304(THRO BUCK).
N $A2F0 POUR TENT.
  $A2F0,$02 Verb POUR, noun TENT or SLIM.
  $A2F2,$02 #R$6760 #N$EE.
  $A2F4,$03 #R$69E8 as #R$A304(THRO BUCK).
N $A2F7 EXAM CURT.
  $A2F7,$02 Verb EXAM, LOOK, SEAR or READ, noun CURT.
  $A2F9,$02 #R$66EB #R$7ABB(#N$3A).
  $A2FB,$02 #R$6733 "#R$8FDA(concealing a secret passage)".
  $A2FD,$02 #R$6965 "#R$8FDA(concealing a secret passage)".
  $A2FF,$03 #R$69F4 #R$5DAD(#N$26) and #N$01.
  $A302,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $A304 THRO BUCK.
  $A304,$02 Verb THRO or HURL, noun BUCK.
  $A306,$02 #R$6713 "#R$9296(sleeping giant)".
  $A308,$02 #R$6709 "#R$927C(full of slime)".
  $A30A,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $A30D,$02 #R$695D "#R$9296(sleeping giant)".
  $A30F,$02 #R$695D "#R$927C(full of slime)".
  $A311,$02 #R$63E6 "#R$8506(the slime kills the giant.)", then stop.
N $A313 GO PASS.
  $A313,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A315,$02 #R$6713 "#R$8FDA(concealing a secret passage)".
  $A317,$02 #R$6892 #R$7AFC(#N$3D), then stop.
N $A319 EXAM BODY.
  $A319,$02 Verb EXAM, LOOK, SEAR or READ, noun BODY.
  $A31B,$02 #R$6709 "#R$9250(body)".
  $A31D,$02 #R$6733 "#R$925E(metal tin)".
  $A31F,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $A322,$02 #R$63E6 "#R$801D(You have found something.)".
  $A324,$02 #R$6965 "#R$9259(closed)".
  $A326,$02 #R$6965 "#R$925E(metal tin)".
  $A328,$02 #R$6965 "#R$9265(earth spell)", then stop.
N $A32A OPEN TIN.
  $A32A,$02 Verb OPEN, noun TIN.
  $A32C,$02 #R$6709 "#R$9259(closed)".
  $A32E,$03 #R$69BF "#R$9259(closed)" and "#R$9255(open)".
  $A331,$02 #R$63E6 "#R$8511(it is empty.)", then stop.
N $A333 CLOS TIN.
  $A333,$02 Verb CLOS or SHUT, noun TIN.
  $A335,$02 #R$6709 "#R$9255(open)".
  $A337,$03 #R$69BF "#R$9259(closed)" and "#R$9255(open)", then stop.
N $A33A EXAM TIN.
  $A33A,$02 Verb EXAM, LOOK, SEAR or READ, noun TIN.
  $A33C,$02 #R$6709 "#R$9255(open)".
  $A33E,$02 #R$6733 "#R$92EB(teleport spell)".
  $A340,$03 #R$69F4 #R$5DAD(#N$26) and #N$03.
  $A343,$02 #R$6965 "#R$92EB(teleport spell)".
  $A345,$02 #R$63E6
. "#R$8517(tucked in the lining of the box is a spell.)", then stop.
N $A347 CAST TELE.
  $A347,$02 Verb CAST, noun TELE.
  $A349,$02 #R$6709 "#R$92EB(teleport spell)".
  $A34B,$02 #R$671A "#R$9269(bucket made of antimagic stone)".
  $A34D,$03 #R$6A16 "#R$92EB(teleport spell)" and #R$75CE(#N$00).
  $A350,$02 #R$69DB #R$5D95(#N$0E).
  $A352,$02 #R$6892 #R$777C(#N$0F), then stop.
N $A354 CAST TELE.
  $A354,$02 Verb CAST, noun TELE.
  $A356,$02 #R$6709 "#R$92EB(teleport spell)".
  $A358,$03 #R$6A16 "#R$92EB(teleport spell)" and #R$75CE(#N$00), then stop.
N $A35B PUSH LEVE.
  $A35B,$02 Verb PUSH, PULL, ROLL or MOVE, noun LEVE.
  $A35D,$02 #R$66EB #R$7A2E(#N$34).
  $A35F,$03 #R$69BF
. "#R$8F24(crossed by a metal drawbridge)" and #R$8F46(#N$29).
  $A362,$03 #R$69BF "#R$8F7A(up)" and "#R$8F7C(down)", then stop.
N $A365 GO BRID.
  $A365,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun BRID or DRAW.
  $A367,$02 #R$6713 "#R$8F7C(down)".
  $A369,$02 #R$6892
. "#R$7A0B(you are in a large cave. A huge deep channel)", then stop.
N $A36B GO BRID.
  $A36B,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun BRID or DRAW.
  $A36D,$02 #R$6713 "#R$8F24(crossed by a metal drawbridge)".
  $A36F,$02 #R$6892 #R$7A2E(#N$34), then stop.
N $A371 GO PLAN.
  $A371,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PLAN.
  $A373,$02 #R$6713 "#R$8F1B(bridged by a plank)".
  $A375,$03 #R$69BF "#R$8F7A(up)" and "#R$8F7C(down)".
  $A378,$02 #R$6892 #R$7A2E(#N$34).
  $A37A,$02 #R$695D "#R$8F1B(bridged by a plank)".
  $A37C,$02 #R$63E6
. "#R$85A4(the plank falls into the channel behind me.)", then stop.
N $A37E PUT PLAN.
  $A37E,$02 Verb PUT or TOUC, noun PLAN.
  $A380,$02 #R$6759 #N$CC.
  $A382,$02 #R$6709 "#R$92E6(plank)".
  $A384,$02 #R$66EB "#R$7A0B(you are in a large cave. A huge deep channel)".
  $A386,$02 #R$695D "#R$92E6(plank)".
  $A388,$02 #R$6965 "#R$8F1B(bridged by a plank)".
N $A38A EXAM FISS.
  $A38A,$02 Verb EXAM, LOOK, SEAR or READ, noun FISS, LAVA or CHAN.
  $A38C,$02 #R$66EB "#R$7A0B(you are in a large cave. A huge deep channel)".
  $A38E,$02 #R$6709 "#R$8F13(full of lava)".
  $A390,$02 #R$63E6
. "#R$85B9(the sides of the channel look weak at one end.)", then stop.
N $A392 CAST BLAS.
  $A392,$02 Verb CAST, noun BLAS.
  $A394,$02 #R$6709 "#R$92DC(blast spell)".
  $A396,$02 #R$66EB "#R$781E(you are in a dank and dripping dungeon)".
  $A398,$02 #R$671A "#R$8E6C(There is a locked door to the east)".
  $A39A,$02 #R$695D "#R$92DC(blast spell)".
  $A39C,$02 #R$6965 "#R$8E6C(There is a locked door to the east)".
  $A39E,$02 #R$63E6 "#R$85D1(there is a small explosion.)".
  $A3A0,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $A3A2 CAST BLAS.
  $A3A2,$02 Verb CAST, noun BLAS.
  $A3A4,$02 #R$6709 "#R$92DC(blast spell)".
  $A3A6,$02 #R$66EB #R$7A2E(#N$34).
  $A3A8,$02 #R$6733 "#R$8F13(full of lava)".
  $A3AA,$03 #R$6A16
. "#R$8F13(full of lava)" and
. "#R$7A0B(you are in a large cave. A huge deep channel)".
  $A3AD,$02 #R$63E6 "#R$85D1(there is a small explosion.)".
  $A3AF,$02 #R$63E6 "#R$85E0(the dam breaks and the lava flows once again.)".
  $A3B1,$02 #R$695D "#R$92DC(blast spell)", then stop.
N $A3B3 CAST BLAS.
  $A3B3,$02 Verb CAST, noun BLAS.
  $A3B5,$02 #R$6709 "#R$92DC(blast spell)".
  $A3B7,$02 #R$66EB "#R$7A0B(you are in a large cave. A huge deep channel)".
  $A3B9,$02 #R$671A "#R$8F13(full of lava)".
  $A3BB,$02 #R$6965 "#R$8F13(full of lava)".
  $A3BD,$02 #R$63E6 "#R$85D1(there is a small explosion.)".
  $A3BF,$02 #R$63E6 "#R$85E0(the dam breaks and the lava flows once again.)".
  $A3C1,$02 #R$695D "#R$92DC(blast spell)", then stop.
N $A3C3 CAST BLAS.
  $A3C3,$02 Verb CAST, noun BLAS.
  $A3C5,$02 #R$6709 "#R$92DC(blast spell)".
  $A3C7,$02 #R$6709 "#R$8F13(full of lava)".
  $A3C9,$02 #R$63E6 "#R$85D1(there is a small explosion.)".
  $A3CB,$02 #R$63E6 #R$85F6(#N$66).
  $A3CD,$02 #R$695D "#R$92DC(blast spell)".
  $A3CF,$02 #R$695D "#R$8F13(full of lava)", then stop.
N $A3D1 CAST BLAS.
  $A3D1,$02 Verb CAST, noun BLAS.
  $A3D3,$02 #R$6709 "#R$92DC(blast spell)".
  $A3D5,$02 #R$6709 #R$8F80(#N$2D).
  $A3D7,$02 #R$63E6 "#R$8622(slime sprays everywhere.)".
  $A3D9,$01 #R$685B.
N $A3DA CAST BLAS.
  $A3DA,$02 Verb CAST, noun BLAS.
  $A3DC,$02 #R$6709 "#R$92DC(blast spell)".
  $A3DE,$02 #R$695D "#R$92DC(blast spell)".
  $A3E0,$02 #R$63E6 "#R$85D1(there is a small explosion.)", then stop.
N $A3E2 WAVE WAND.
  $A3E2,$02 Verb WAVE, noun WAND.
  $A3E4,$02 #R$6759 #N$8F.
  $A3E6,$02 #R$66EB #R$7A2E(#N$34).
  $A3E8,$02 #R$6709 "#R$9189(bright red wand)".
  $A3EA,$02 #R$67A1 #R$5DA0(#N$19).
  $A3EC,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A3EF WAVE WAND.
  $A3EF,$02 Verb WAVE, noun WAND.
  $A3F1,$02 #R$6760 #N$8F.
  $A3F3,$02 #R$66EB #R$7A2E(#N$34).
  $A3F5,$02 #R$6709 "#R$9189(bright red wand)".
  $A3F7,$02 #R$67A1 #R$5DA0(#N$19).
  $A3F9,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A3FC WAVE WAND.
  $A3FC,$02 Verb WAVE, noun WAND.
  $A3FE,$02 #R$6759 #N$8F.
  $A400,$02 #R$66EB #R$7A2E(#N$34).
  $A402,$02 #R$6709 "#R$9189(bright red wand)".
  $A404,$02 #R$6892 #R$777C(#N$0F), then stop.
N $A406 WAVE WAND.
  $A406,$02 Verb WAVE, noun WAND.
  $A408,$02 #R$6760 #N$8F.
  $A40A,$02 #R$66EB #R$7A2E(#N$34).
  $A40C,$02 #R$6709 "#R$9189(bright red wand)".
  $A40E,$02 #R$6892 #R$777C(#N$0F), then stop.
N $A410 PUT WAND.
  $A410,$02 Verb PUT or TOUC, noun WAND.
  $A412,$02 #R$6760 #N$CB.
  $A414,$02 #R$6709 "#R$9189(bright red wand)".
  $A416,$02 #R$66EB #R$7A2E(#N$34).
  $A418,$02 #R$69DB #R$5DA0(#N$19), then stop.
N $A41A PUT PENT.
  $A41A,$02 Verb PUT or TOUC, noun PENT.
  $A41C,$02 #R$6759 #N$B4.
  $A41E,$02 #R$6709 "#R$9189(bright red wand)".
  $A420,$02 #R$66EB #R$7A2E(#N$34).
  $A422,$02 #R$69DB #R$5DA0(#N$19), then stop.
N $A424 PUT WAND.
  $A424,$02 Verb PUT or TOUC, noun WAND.
  $A426,$02 #R$6759 #N$CB.
  $A428,$02 #R$6709 "#R$9189(bright red wand)".
  $A42A,$02 #R$66EB #R$7A2E(#N$34).
  $A42C,$02 #R$69DB #R$5DA0(#N$19), then stop.
N $A42E PUT WAND.
  $A42E,$02 Verb PUT or TOUC, noun WAND.
  $A430,$02 #R$6759 #N$CB.
  $A432,$02 #R$6709 "#R$9189(bright red wand)".
  $A434,$02 #R$66EB #R$7A2E(#N$34).
  $A436,$02 #R$69DB #R$5DA0(#N$19), then stop.
N $A438 PUT PENT.
  $A438,$02 Verb PUT or TOUC, noun PENT.
  $A43A,$02 #R$6759 #N$B4.
  $A43C,$02 #R$6709 "#R$9189(bright red wand)".
  $A43E,$02 #R$66EB #R$7A2E(#N$34).
  $A440,$02 #R$69DB #R$5DA0(#N$19), then stop.
N $A442 WAVE SCEP.
  $A442,$02 Verb WAVE, noun SCEP.
  $A444,$02 #R$66EB #R$7A85(#N$37).
  $A446,$02 #R$6709 "#R$9249(sceptre)".
  $A448,$02 #R$6733 "#R$900A(a crystal bridge spans the pit of lava)".
  $A44A,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $A44D,$02 #R$6965 "#R$900A(a crystal bridge spans the pit of lava)".
  $A44F,$03 #R$6A16
. "#R$901A(a crystal bridge spans the pit of lava)" and
. "#R$7B5A(you are on the far side of the lava pit)", then stop.
N $A452 GO BRID.
  $A452,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun BRID or DRAW.
  $A454,$02 #R$6709 "#R$900A(a crystal bridge spans the pit of lava)".
  $A456,$02 #R$6892
. "#R$7B5A(you are on the far side of the lava pit)", then stop.
N $A458 GO BRID.
  $A458,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun BRID or DRAW.
  $A45A,$02 #R$6709 "#R$901A(a crystal bridge spans the pit of lava)".
  $A45C,$02 #R$6892 #R$7A85(#N$37), then stop.
N $A45E WAVE WAND.
  $A45E,$02 Verb WAVE, noun WAND.
  $A460,$02 #R$6709 "#R$9189(bright red wand)".
  $A462,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A465 WAVE SCEP.
  $A465,$02 Verb WAVE, noun SCEP.
  $A467,$02 #R$6709 "#R$9249(sceptre)".
  $A469,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A46C EXAM PICT.
  $A46C,$02 Verb EXAM, LOOK, SEAR or READ, noun PICT.
  $A46E,$02 #R$66EB #R$7A2E(#N$34).
  $A470,$02 #R$63E6
. "#R$8631(it is a picture of waves breaking on a moonlit shore.)", then stop.
N $A472 THRO SOAP.
  $A472,$02 Verb THRO or HURL, noun SOAP.
  $A474,$02 #R$6709 #R$8F80(#N$2D).
  $A476,$02 #R$6709 "#R$9159(soap)".
  $A478,$03 #R$69F4 #R$5DAD(#N$26) and #N$03.
  $A47B,$02 #R$63E6 #R$864C(#N$69).
  $A47D,$02 #R$695D "#R$9159(soap)".
  $A47F,$03 #R$69BF
. #R$8F80(#N$2D) and
. "#R$8F9F(There is a pit of oily slime in the floor)", then stop.
N $A482 THRO SOAP.
  $A482,$02 Verb THRO or HURL, noun SOAP.
  $A484,$02 #R$6709 "#R$9159(soap)".
  $A486,$02 #R$6965 "#R$9159(soap)", then stop.
N $A488 SAY any.
  $A488,$02 Verb SAY, YELL, SHOU, YELL, YODL, TALK or SPEA, noun any.
  $A48A,$02 #R$6709 "#R$9066(Masses of snow is piled up the sides of the pass)".
  $A48C,$03 #R$69F4 #R$5DAD(#N$26) and #N$05.
  $A48F,$02 #R$69DB #R$5DA3(#N$1C), then stop.
N $A491 GO CAVE.
  $A491,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun CAVE.
  $A493,$02 #R$66EB
. "#R$7BE7(you are in a snowy pass. There is a cavemouth here)".
  $A495,$02 #R$671A "#R$90A6(Huge piles of snow cover the floor of the pass)".
  $A497,$02 #R$671A "#R$92F7(yeti)".
  $A499,$02 #R$6892 #R$7BBC(#N$49), then stop.
N $A49B GO CAVE.
  $A49B,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun CAVE.
  $A49D,$02 #R$6709 "#R$92F7(yeti)".
  $A49F,$02 #R$63E6
. "#R$8737(the yeti forcibly prevents me from entering the cave.)", then stop.
N $A4A1 KILL YETI.
  $A4A1,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun YETI.
  $A4A3,$02 #R$6709 "#R$92F7(yeti)".
  $A4A5,$02 #R$63E6 "#R$8750(the yeti tears me to pieces.)".
  $A4A7,$01 #R$685B.
N $A4A8 EXAM BODY.
  $A4A8,$02 Verb EXAM, LOOK, SEAR or READ, noun BODY.
  $A4AA,$02 #R$6709 "#R$92FC(body)".
  $A4AC,$02 #R$6733 "#R$9301(snowshoes)".
  $A4AE,$03 #R$69F4 #R$5DAD(#N$26) and #N$01.
  $A4B1,$02 #R$6965 "#R$9301(snowshoes)".
  $A4B3,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $A4B5 DIG any.
  $A4B5,$02 Verb DIG, noun any.
  $A4B7,$02 #R$6709 "#R$90A6(Huge piles of snow cover the floor of the pass)".
  $A4B9,$03 #R$67BF #R$5DA5(#N$1E) and #N$1E.
  $A4BC,$02 #R$6733 "#R$92F7(yeti)".
  $A4BE,$02 #R$6733 "#R$935F(skinned yeti)".
  $A4C0,$02 #R$6733 "#R$9369(dead yeti)".
  $A4C2,$02 #R$6965 "#R$9369(dead yeti)", then stop.
N $A4C4 DIG any.
  $A4C4,$02 Verb DIG, noun any.
  $A4C6,$02 #R$6709 "#R$90A6(Huge piles of snow cover the floor of the pass)".
  $A4C8,$03 #R$67C6 #R$5DA5(#N$1E) and #N$1F.
  $A4CB,$02 #R$6733 "#R$92F7(yeti)".
  $A4CD,$02 #R$6965 "#R$92F7(yeti)".
  $A4CF,$02 #R$63E6 #R$8788(#N$75), then stop.
N $A4D1 VSKI YETI.
  $A4D1,$02 Verb VSKI, noun YETI.
  $A4D3,$02 #R$6709 "#R$9369(dead yeti)".
  $A4D5,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $A4D8,$03 #R$69BF "#R$935F(skinned yeti)" and "#R$9369(dead yeti)".
  $A4DB,$02 #R$6965 "#R$9307(yeti skin)".
N $A4DD EXAM any.
  $A4DD,$02 Verb EXAM, LOOK, SEAR or READ, noun any.
  $A4DF,$02 #R$66EB "#R$7C1A(you are in the ruins of a temple)".
  $A4E1,$02 #R$671A "#R$8FFD(A flagstone in the floor is broken)".
  $A4E3,$02 #R$671A #R$90B7(#N$40).
  $A4E5,$02 #R$63E6 #R$87A7(#N$76), then stop.
N $A4E7 KILL STON.
  $A4E7,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun STON.
  $A4E9,$02 #R$671A "#R$8FFD(A flagstone in the floor is broken)".
  $A4EB,$02 #R$671A #R$90B7(#N$40).
  $A4ED,$02 #R$66EB "#R$7C1A(you are in the ruins of a temple)".
  $A4EF,$02 #R$6965 "#R$8FFD(A flagstone in the floor is broken)".
  $A4F1,$02 #R$63E6 "#R$87BF(the stones snaps into several pieces.)", then stop.
N $A4F3 GO PASS.
  $A4F3,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A4F5,$02 #R$6709 #R$90B7(#N$40).
  $A4F7,$02 #R$63E6 "#R$87ED(you fall....)".
  $A4F9,$02 #R$6892 "#R$7E0D(you are in a crypt beneath the temple)", then stop.
N $A4FB THRO ROPE.
  $A4FB,$02 Verb THRO or HURL, noun ROPE.
  $A4FD,$02 #R$6709 "#R$923C(rope)".
  $A4FF,$02 #R$63E6 "#R$87F5(it doesn't catch on anything.)", then stop.
N $A501 GO PASS.
  $A501,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A503,$02 #R$66EB "#R$7B94(you are in a snowstorm beside a crevasse)".
  $A505,$02 #R$63E6 "#R$87ED(you fall....)".
  $A507,$02 #R$6892 "#R$7BA3(you are in the crevasse)", then stop.
N $A509 PRAY any.
  $A509,$02 Verb PRAY, noun any.
  $A50B,$02 #R$66EB "#R$7C87(you are in a wooden church)".
  $A50D,$02 #R$69DB #R$5DA6(#N$1F), then stop.
N $A50F PRAY any.
  $A50F,$02 Verb PRAY, noun any.
  $A511,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A514 SAY PRIE.
  $A514,$02 Verb SAY, YELL, SHOU, YELL, YODL, TALK or SPEA, noun PRIE.
  $A516,$02 #R$66EB "#R$7C87(you are in a wooden church)".
  $A518,$02 #R$69DB #R$5DA7(#N$20), then stop.
N $A51A KILL PRIE.
  $A51A,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun PRIE.
  $A51C,$02 #R$66EB "#R$7C87(you are in a wooden church)".
  $A51E,$02 #R$63E6 #R$8806(#N$7B), then stop.
N $A520 EXAM SNOW.
  $A520,$02 Verb EXAM, LOOK, SEAR or READ, noun SNOW or SLUS.
  $A522,$02 #R$63E6
. "#R$885F(it is wet, cold and generally whitish in colour!)", then stop.
N $A524 KILL GUAR.
  $A524,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun GUAR.
  $A526,$02 #R$6709 "#R$930F(several border guards)".
  $A528,$02 #R$63E6 "#R$88D8(so you're feeling suicidal today are you ?)".
  $A52A,$01 #R$685B.
N $A52B DIG any.
  $A52B,$02 Verb DIG, noun any.
  $A52D,$02 #R$66EB #R$7BBC(#N$49).
  $A52F,$02 #R$671A "#R$9056(A tunnel leads beneath the snow)".
  $A531,$02 #R$63E6 "#R$801D(You have found something.)".
  $A533,$03 #R$69F4 #R$5DAD(#N$26) and #N$02.
  $A536,$02 #R$6965 "#R$9056(A tunnel leads beneath the snow)", then stop.
N $A538 GO HOLE.
  $A538,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun HOLE, ENTR or TUNN.
  $A53A,$02 #R$6709 "#R$9056(A tunnel leads beneath the snow)".
  $A53C,$02 #R$6892
. "#R$7D23(you are in a glittering hall made entirely of ice)", then stop.
N $A53E EXAM WIZA.
  $A53E,$02 Verb EXAM, LOOK, SEAR or READ, noun WIZA.
  $A540,$02 #R$66EB #R$7D68(#N$60).
  $A542,$02 #R$6733 "#R$9357(mind shield spell)".
  $A544,$02 #R$6965 "#R$9357(mind shield spell)".
  $A546,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $A548 OPEN CUPB.
  $A548,$02 Verb OPEN, noun CUPB.
  $A54A,$02 #R$6709 "#R$908F(shut)".
  $A54C,$03 #R$69BF
. "#R$908F(shut)" and
. "#R$8FE6(open, revealing what is in fact a room beyond)", then stop.
N $A54F CLOS CUPB.
  $A54F,$02 Verb CLOS or SHUT, noun CUPB.
  $A551,$02 #R$6709 "#R$8FE6(open, revealing what is in fact a room beyond)".
  $A553,$03 #R$69BF
. "#R$908F(shut)" and
. "#R$8FE6(open, revealing what is in fact a room beyond)", then stop.
N $A556 GO CUPB.
  $A556,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun CUPB.
  $A558,$02 #R$6709 "#R$8FE6(open, revealing what is in fact a room beyond)".
  $A55A,$02 #R$6892 "#R$7DB0(you are in a secret room)", then stop.
N $A55C GO PASS.
  $A55C,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A55E,$02 #R$6709 "#R$8FE6(open, revealing what is in fact a room beyond)".
  $A560,$02 #R$6892 "#R$7DB0(you are in a secret room)", then stop.
N $A562 KILL CRAT.
  $A562,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun CRAT.
  $A564,$02 #R$6709 "#R$9336(crate)".
  $A566,$03 #R$69F4 #R$5DAD(#N$26) and #N$01.
  $A569,$02 #R$695D "#R$9336(crate)".
  $A56B,$02 #R$6965 "#R$933A(mystic book)".
  $A56D,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $A56F EXAM BOOK.
  $A56F,$02 Verb EXAM, LOOK, SEAR or READ, noun BOOK.
  $A571,$02 #R$6709 "#R$933A(mystic book)".
  $A573,$02 #R$6733 "#R$9343(ice wall spell)".
  $A575,$03 #R$69F4 #R$5DAD(#N$26) and #N$01.
  $A578,$02 #R$6965 "#R$9343(ice wall spell)".
  $A57A,$02 #R$63E6 "#R$801D(You have found something.)", then stop.
N $A57C GO ON.
  $A57C,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun ON, OFF or AT.
  $A57E,$02 #R$6759 #N$FE.
  $A580,$03 #R$69E8 as #R$A58A(GO CRAT).
N $A583 GO ON.
  $A583,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun ON, OFF or AT.
  $A585,$02 #R$6759 #N$BD.
  $A587,$03 #R$69E8 as #R$A593(GO CHAI).
N $A58A GO CRAT.
  $A58A,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun CRAT.
  $A58C,$02 #R$6713 "#R$9336(crate)".
  $A58E,$03 #R$6A11 #R$5DA8(#N$21) and #N$01.
  $A591,$02 #R$63E6 "#R$8B76(you stand on the crate.)", then stop.
N $A593 GO CHAI.
  $A593,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun CHAI.
  $A595,$02 #R$6713 "#R$91C7(chair)".
  $A597,$03 #R$6A11 #R$5DA8(#N$21) and #N$02.
  $A59A,$02 #R$63E6 "#R$8B7E(you stand on the chair.)", then stop.
N $A59C GO DOWN.
  $A59C,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun DOWN or D.
  $A59E,$02 #R$67A9 #R$5DA8(#N$21).
  $A5A0,$03 #R$69E8 as #R$A5A3(GET ON).
N $A5A3 GET ON.
  $A5A3,$02 Verb GET or TAKE, noun ON, OFF or AT.
  $A5A5,$02 #R$67A9 #R$5DA8(#N$21).
  $A5A7,$02 #R$69E2 #R$5DA8(#N$21), then stop.
N $A5A9 DIG CEIL.
  $A5A9,$02 Verb DIG, noun CEIL or ROOF.
  $A5AB,$02 #R$66EB #R$7D39(#N$5E).
  $A5AD,$02 #R$67A9 #R$5DA8(#N$21).
  $A5AF,$02 #R$671A #R$9123(#N$45).
  $A5B1,$03 #R$69F4 #R$5DA5(#N$1E) and #N$02.
  $A5B4,$02 #R$6965 #R$9123(#N$45).
  $A5B6,$03 #R$6A16
. "#R$8F09(There is a hole in the ground)" and #R$7643(#N$01), then stop.
N $A5B9 EXAM CEIL.
  $A5B9,$02 Verb EXAM, LOOK, SEAR or READ, noun CEIL or ROOF.
  $A5BB,$02 #R$66EB #R$7D39(#N$5E).
  $A5BD,$02 #R$63E6
. "#R$8904(the roof is cracked and looks both thin and weak.)", then stop.
N $A5BF DIG CEIL.
  $A5BF,$02 Verb DIG, noun CEIL or ROOF.
  $A5C1,$02 #R$66EB #R$7D39(#N$5E).
  $A5C3,$02 #R$67A1 #R$5DA8(#N$21).
  $A5C5,$02 #R$63E6 "#R$891A(you can't reach.)", then stop.
N $A5C7 GO PASS.
  $A5C7,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A5C9,$02 #R$6709 "#R$8F09(There is a hole in the ground)".
  $A5CB,$02 #R$6892 #R$7D39(#N$5E), then stop.
N $A5CD GO PASS.
  $A5CD,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A5CF,$02 #R$6709 #R$9123(#N$45).
  $A5D1,$02 #R$67A1 #R$5DA8(#N$21).
  $A5D3,$02 #R$63E6 "#R$891A(you can't reach.)", then stop.
N $A5D5 GO PASS.
  $A5D5,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PASS, HOLE, TUNN or
. CREV.
  $A5D7,$02 #R$6709 #R$9123(#N$45).
  $A5D9,$02 #R$6892 #R$7643(#N$01).
  $A5DB,$02 #R$69E2 #R$5DA8(#N$21), then stop.
N $A5DD CAST SHAT.
  $A5DD,$02 Verb CAST, noun SHAT.
  $A5DF,$02 #R$66EB #R$7D39(#N$5E).
  $A5E1,$02 #R$671A #R$9123(#N$45).
  $A5E3,$02 #R$6709 "#R$932A(shatter spell)".
  $A5E5,$02 #R$63E6 #R$8922(#N$85).
  $A5E7,$02 #R$695D "#R$932A(shatter spell)".
  $A5E9,$02 #R$6965 #R$9123(#N$45).
  $A5EB,$03 #R$6A16
. "#R$8F09(There is a hole in the ground)" and #R$7643(#N$01), then stop.
N $A5EE THIN any.
  $A5EE,$02 Verb THIN, noun any.
  $A5F0,$02 #R$66EB "#R$7B4E(you have ceased to exist)".
  $A5F2,$02 #R$63E6 #R$8A28(#N$8A).
  $A5F4,$02 #R$6892 "#R$7B66(you are in a sinister evil temple)", then stop.
N $A5F6 CAST EART.
  $A5F6,$02 Verb CAST, noun EART.
  $A5F8,$02 #R$6709 "#R$9265(earth spell)".
  $A5FA,$03 #R$6A16 "#R$9265(earth spell)" and #R$75CE(#N$00).
  $A5FD,$02 #R$695D
. "#R$90D7(A lightning bolt is arcing towards you)", then stop.
N $A5FF CAST EART.
  $A5FF,$02 Verb CAST, noun EART.
  $A601,$02 #R$6709 "#R$9202(earth spell)".
  $A603,$03 #R$6A16 "#R$9202(earth spell)" and #R$75CE(#N$00).
  $A606,$02 #R$695D "#R$90D7(A lightning bolt is arcing towards you)".
N $A608 PLAY HARP.
  $A608,$02 Verb PLAY or STRU, noun HARP.
  $A60A,$02 #R$6709 "#R$92A0(magic harp)".
  $A60C,$02 #R$695D
. "#R$8F63(The air around you is vibrating with a strange sound)".
  $A60E,$02 #R$63E6 "#R$8A67(it has a beautiful tone.)", then stop.
N $A610 CAST ICE.
  $A610,$02 Verb CAST, noun ICE or WALL.
  $A612,$02 #R$6709 "#R$9343(ice wall spell)".
  $A614,$02 #R$6709 "#R$9045(A ball of flame is streaking towards me)".
  $A616,$02 #R$63E6 "#R$8A54(a wall of ice appears in front of you.)".
  $A618,$02 #R$63E6 #R$8A78(#N$8D).
  $A61A,$03 #R$6A16 "#R$9343(ice wall spell)" and #R$75CE(#N$00).
  $A61D,$02 #R$695D
. "#R$9045(A ball of flame is streaking towards me)", then stop.
N $A61F CAST ICE.
  $A61F,$02 Verb CAST, noun ICE or WALL.
  $A621,$02 #R$6709 "#R$9343(ice wall spell)".
  $A623,$03 #R$6A16 "#R$9343(ice wall spell)" and #R$75CE(#N$00).
  $A626,$02 #R$63E6 "#R$8A54(a wall of ice appears in front of you.)".
  $A628,$02 #R$63E6 "#R$8AA2(....and promptly melts again.)", then stop.
N $A62A CAST MIND.
  $A62A,$02 Verb CAST, noun MIND.
  $A62C,$02 #R$6709 "#R$9357(mind shield spell)".
  $A62E,$03 #R$6A16 "#R$9357(mind shield spell)" and #R$75CE(#N$00).
  $A631,$02 #R$695D #R$8FB5(#N$30), then stop.
N $A633 CAST WIND.
  $A633,$02 Verb CAST, noun WIND.
  $A635,$02 #R$6709 "#R$92F3(wind spell)".
  $A637,$02 #R$63E6 "#R$8AB6(a gust of wind blows.)".
  $A639,$02 #R$695D "#R$90F6(You are surrounded by a cloud of thick vapours)".
  $A63B,$02 #R$695D "#R$92F3(wind spell)".
N $A63D CAST SHAT.
  $A63D,$02 Verb CAST, noun SHAT.
  $A63F,$02 #R$6709 "#R$932A(shatter spell)".
  $A641,$02 #R$695D "#R$932A(shatter spell)".
  $A643,$02 #R$695D
. "#R$9110(The very air around me is crystalising)", then stop.
N $A645 REFL LIGH.
  $A645,$02 Verb REFL, noun LIGH.
  $A647,$02 #R$6739 "#R$922E(large shield)".
  $A649,$02 #R$67A9 #R$5D98(#N$11).
  $A64B,$02 #R$6709
. "#R$9079(A wall of intense blinding light is coming towards me)".
  $A64D,$02 #R$63E6 #R$8AC1(#N$90).
  $A64F,$02 #R$695D
. "#R$9079(A wall of intense blinding light is coming towards me)", then stop.
N $A651 CAST BLES.
  $A651,$02 Verb CAST, noun BLES.
  $A653,$02 #R$6709 "#R$9324(bless spell)".
  $A655,$02 #R$69E2 #R$5DAA(#N$23).
  $A657,$03 #R$6A16 "#R$9324(bless spell)" and #R$75CE(#N$00), then stop.
N $A65A DRAW PENT.
  $A65A,$02 Verb DRAW, MARK, WRIT, SCRI or INSC, noun PENT.
  $A65C,$02 #R$6709 "#R$9285(chalk)".
  $A65E,$02 #R$6965 "#R$928A(chalk pentagram on the floor)".
  $A660,$02 #R$695D "#R$9285(chalk)", then stop.
N $A662 WAVE ROD.
  $A662,$02 Verb WAVE, noun ROD.
  $A664,$02 #R$6709 "#R$91F3(The Rod Of Power)".
  $A666,$02 #R$6709 "#R$92A9(the evil wizard)".
  $A668,$03 #R$69F4 #R$5DAB(#N$24) and #N$01.
  $A66B,$02 #R$63E6 "#R$8AE6(the wizard reels back clutching at his head.)".
N $A66D KILL WIZA.
  $A66D,$02 Verb KILL, ATTA, HIT, SLAY, BREA, SMAS or FORC, noun WIZA.
  $A66F,$02 #R$6709 "#R$92A9(the evil wizard)".
  $A671,$02 #R$63E6 "#R$8B86(sparks leap from the wizard.)".
  $A673,$02 #R$63E6 #R$899B(#N$87).
  $A675,$01 #R$685B.
N $A676 EXAM ROD.
  $A676,$02 Verb EXAM, LOOK, SEAR or READ, noun ROD.
  $A678,$02 #R$6709 "#R$91F3(The Rod Of Power)".
  $A67A,$02 #R$63E6 #R$8B93(#N$9B), then stop.
N $A67C SWIM any.
  $A67C,$02 Verb SWIM, noun any.
  $A67E,$02 #R$6740 "#R$91A6(black robe)".
  $A680,$02 #R$66F9 #R$7CB1(#N$57).
  $A682,$02 #R$6702 "#R$7CFA(you are in the woods)".
  $A684,$02 #R$6965 "#R$91A2(wet)".
  $A686,$02 #R$68B0 "#R$91A2(wet)".
N $A688 SWIM any.
  $A688,$02 Verb SWIM, noun any.
  $A68A,$02 #R$6739 "#R$91A6(black robe)".
  $A68C,$02 #R$66F9 #R$7CB1(#N$57).
  $A68E,$02 #R$6702 "#R$7CFA(you are in the woods)".
  $A690,$02 #R$6965 "#R$91A2(wet)".
  $A692,$02 #R$68B0 "#R$91A2(wet)".
N $A694 SWIM any.
  $A694,$02 Verb SWIM, noun any.
  $A696,$02 #R$66EB
. "#R$7CDA(you are in a field beside a gently burbling stream)".
  $A698,$02 #R$6892 "#R$7CEE(you are in the woods beside a stream)", then stop.
N $A69A SWIM any.
  $A69A,$02 Verb SWIM, noun any.
  $A69C,$02 #R$66EB "#R$7CEE(you are in the woods beside a stream)".
  $A69E,$02 #R$6892
. "#R$7CDA(you are in a field beside a gently burbling stream)", then stop.
N $A6A0 GET ROCK.
  $A6A0,$02 Verb GET or TAKE, noun ROCK.
  $A6A2,$02 #R$6709 "#R$9145(rock)".
  $A6A4,$02 #R$63E6 "#R$8C54(it is phosphorescent.)", then stop.
N $A6A6 GET ROCK.
  $A6A6,$02 Verb GET or TAKE, noun ROCK.
  $A6A8,$02 #R$6709 "#R$921A(glowing rock)".
  $A6AA,$02 #R$63E6 "#R$8C54(it is phosphorescent.)", then stop.
N $A6AC FILL TIN.
  $A6AC,$02 Verb FILL, noun TIN.
  $A6AE,$02 #R$6709 "#R$9255(open)".
  $A6B0,$02 #R$63E6 "#R$8C88(it leaks)", then stop.
N $A6B2 FILL TIN.
  $A6B2,$02 Verb FILL, noun TIN.
  $A6B4,$02 #R$6709 "#R$9259(closed)".
  $A6B6,$02 #R$63E6 "#R$8C88(it leaks)", then stop.
N $A6B8 FILL TIN.
  $A6B8,$02 Verb FILL, noun TIN.
  $A6BA,$02 #R$6709 "#R$925E(metal tin)".
  $A6BC,$02 #R$63E6 "#R$8C88(it leaks)", then stop.
N $A6BE EXAM ROCK.
  $A6BE,$02 Verb EXAM, LOOK, SEAR or READ, noun ROCK.
  $A6C0,$02 #R$6709 "#R$9145(rock)".
  $A6C2,$02 #R$63E6 "#R$8C54(it is phosphorescent.)", then stop.
N $A6C4 EXAM ROCK.
  $A6C4,$02 Verb EXAM, LOOK, SEAR or READ, noun ROCK.
  $A6C6,$02 #R$6709 "#R$921A(glowing rock)".
  $A6C8,$02 #R$63E6 "#R$8C54(it is phosphorescent.)", then stop.
N $A6CA EXAM EART.
  $A6CA,$02 Verb EXAM, LOOK, SEAR or READ, noun EART.
  $A6CC,$02 #R$6709 "#R$9202(earth spell)".
  $A6CE,$02 #R$63E6 "#R$8C98(Some form of electrical control)", then stop.
N $A6D0 EXAM EART.
  $A6D0,$02 Verb EXAM, LOOK, SEAR or READ, noun EART.
  $A6D2,$02 #R$6709 "#R$9265(earth spell)".
  $A6D4,$02 #R$63E6 "#R$8C98(Some form of electrical control)", then stop.
N $A6D6 EXAM BLAS.
  $A6D6,$02 Verb EXAM, LOOK, SEAR or READ, noun BLAS.
  $A6D8,$02 #R$6709 "#R$92DC(blast spell)".
  $A6DA,$02 #R$63E6 "#R$8CAB(An explosive spell)", then stop.
N $A6DC EXAM BLES.
  $A6DC,$02 Verb EXAM, LOOK, SEAR or READ, noun BLES.
  $A6DE,$02 #R$6709 "#R$9324(bless spell)".
  $A6E0,$02 #R$63E6 "#R$8CB9(Opposite of a curse)", then stop.
N $A6E2 HELP any.
  $A6E2,$02 Verb HELP, noun any.
  $A6E4,$02 #R$63E6
. "#R$8CC5(See the cassette box for details of hint sheets)", then stop.
N $A6E6 GO PILL.
  $A6E6,$02 Verb GO, ENTE, EXIT, CLIM, JUMP or STAN, noun PILL.
  $A6E8,$02 #R$66EB "#R$77C2(you are in a low narrow corridor)".
  $A6EA,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A6ED WAIT any.
  $A6ED,$02 Verb WAIT, noun any.
  $A6EF,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A6F2 EXAM any.
  $A6F2,$02 Verb EXAM, LOOK, SEAR or READ, noun any.
  $A6F4,$02 #R$63E6 "#R$8C5F(you see nothing special)", then stop.
N $A6F6 DIG any.
  $A6F6,$02 Verb DIG, noun any.
  $A6F8,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A6FB WAVE ROD.
  $A6FB,$02 Verb WAVE, noun ROD.
  $A6FD,$02 #R$6709 "#R$91F3(The Rod Of Power)".
  $A6FF,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A702 PUT WAND.
  $A702,$02 Verb PUT or TOUC, noun WAND.
  $A704,$02 #R$6709 "#R$9189(bright red wand)".
  $A706,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A709 VPOL any.
  $A709,$02 Verb VPOL, noun any.
  $A70B,$03 #R$69BF
. "#R$8CE6(above me is a window)" and
. "#R$8CE6(above me is a window)", then stop.
N $A70E SCOR any.
  $A70E,$02 Verb SCOR, noun any.
  $A710,$02 #R$63E6 "#R$8BE0(you have scored)".
  $A712,$02 #R$6A3C #R$5DAD(#N$26).
N $A714 REFL any.
  $A714,$02 Verb REFL, noun any.
  $A716,$02 #R$6709
. "#R$9079(A wall of intense blinding light is coming towards me)".
  $A718,$02 #R$63E6 "#R$8C44(not enough is reflected...)", then stop.
N $A71A any ORB.
  $A71A,$02 Verb any, noun ORB or SPEL.
  $A71C,$02 #R$63E6 "#R$8C8D(Be more specific)", then stop.
N $A71E End of the table.
  $A71E,$01

b $A71F Vocabulary Lead-In
@ $A71F label=VocabularyLead
D $A71F The matcher at the top of bank 3 starts one byte after this, on #R$A720.
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
L $A720,$05,$DB,$02

b $AB67 Exit Table
@ $AB67 label=ExitTable
D $AB67 For each room, a key of the room plus #N($80), then pairs of a direction
. verb and a destination room. The next room's key has bit 7 set, so it ends the
. previous room. Rooms with no exits are a key alone. Directions are #N$01 to
. #N$0A. #R$5FCE scans it.
N $AB67 Room #N$00.
  $AB67,$01 Room #N$00 with bit 7 set.
N $AB68 Room #N$01.
  $AB68,$01 Room #N$01 with bit 7 set.
  $AB69,$02 North to room #N$02.
  $AB6B,$02 South to room #N$4A.
N $AB6D Room #N$02.
  $AB6D,$01 Room #N$02 with bit 7 set.
  $AB6E,$02 North to room #N$02.
  $AB70,$02 South to room #N$01.
  $AB72,$02 East to room #N$45.
  $AB74,$02 West to room #N$44.
N $AB76 Room #N$03.
  $AB76,$01 Room #N$03 with bit 7 set.
  $AB77,$02 Down to room #N$01.
N $AB79 Room #N$04.
  $AB79,$01 Room #N$04 with bit 7 set.
  $AB7A,$02 North to room #N$05.
  $AB7C,$02 South to room #N$07.
N $AB7E Room #N$05.
  $AB7E,$01 Room #N$05 with bit 7 set.
  $AB7F,$02 South to room #N$04.
N $AB81 Room #N$06.
  $AB81,$01 Room #N$06 with bit 7 set.
N $AB82 Room #N$07.
  $AB82,$01 Room #N$07 with bit 7 set.
  $AB83,$02 North to room #N$04.
  $AB85,$02 East to room #N$1E.
  $AB87,$02 West to room #N$08.
N $AB89 Room #N$08.
  $AB89,$01 Room #N$08 with bit 7 set.
  $AB8A,$02 North to room #N$1D.
  $AB8C,$02 East to room #N$07.
  $AB8E,$02 West to room #N$0C.
N $AB90 Room #N$09.
  $AB90,$01 Room #N$09 with bit 7 set.
N $AB91 Room #N$0A.
  $AB91,$01 Room #N$0A with bit 7 set.
  $AB92,$02 South to room #N$0B.
  $AB94,$02 Up to room #N$08.
N $AB96 Room #N$0B.
  $AB96,$01 Room #N$0B with bit 7 set.
  $AB97,$02 North to room #N$0A.
N $AB99 Room #N$0C.
  $AB99,$01 Room #N$0C with bit 7 set.
  $AB9A,$02 East to room #N$08.
  $AB9C,$02 West to room #N$0D.
  $AB9E,$02 Down to room #N$10.
N $ABA0 Room #N$0D.
  $ABA0,$01 Room #N$0D with bit 7 set.
  $ABA1,$02 North to room #N$0E.
  $ABA3,$02 East to room #N$0C.
  $ABA5,$02 West to room #N$0F.
N $ABA7 Room #N$0E.
  $ABA7,$01 Room #N$0E with bit 7 set.
  $ABA8,$02 South to room #N$0D.
N $ABAA Room #N$0F.
  $ABAA,$01 Room #N$0F with bit 7 set.
  $ABAB,$02 East to room #N$0D.
N $ABAD Room #N$10.
  $ABAD,$01 Room #N$10 with bit 7 set.
  $ABAE,$02 East to room #N$11.
  $ABB0,$02 Up to room #N$0C.
  $ABB2,$02 Down to room #N$2E.
N $ABB4 Room #N$11.
  $ABB4,$01 Room #N$11 with bit 7 set.
  $ABB5,$02 West to room #N$10.
N $ABB7 Room #N$12.
  $ABB7,$01 Room #N$12 with bit 7 set.
  $ABB8,$02 South to room #N$13.
  $ABBA,$02 East to room #N$14.
N $ABBC Room #N$13.
  $ABBC,$01 Room #N$13 with bit 7 set.
  $ABBD,$02 North to room #N$12.
N $ABBF Room #N$14.
  $ABBF,$01 Room #N$14 with bit 7 set.
  $ABC0,$02 East to room #N$15.
  $ABC2,$02 West to room #N$12.
N $ABC4 Room #N$15.
  $ABC4,$01 Room #N$15 with bit 7 set.
  $ABC5,$02 East to room #N$16.
  $ABC7,$02 West to room #N$14.
N $ABC9 Room #N$16.
  $ABC9,$01 Room #N$16 with bit 7 set.
  $ABCA,$02 South to room #N$18.
  $ABCC,$02 West to room #N$15.
N $ABCE Room #N$17.
  $ABCE,$01 Room #N$17 with bit 7 set.
N $ABCF Room #N$18.
  $ABCF,$01 Room #N$18 with bit 7 set.
  $ABD0,$02 North to room #N$16.
  $ABD2,$02 South to room #N$1A.
N $ABD4 Room #N$19.
  $ABD4,$01 Room #N$19 with bit 7 set.
  $ABD5,$02 East to room #N$1A.
N $ABD7 Room #N$1A.
  $ABD7,$01 Room #N$1A with bit 7 set.
  $ABD8,$02 North to room #N$18.
  $ABDA,$02 South to room #N$1B.
  $ABDC,$02 West to room #N$19.
N $ABDE Room #N$1B.
  $ABDE,$01 Room #N$1B with bit 7 set.
  $ABDF,$02 North to room #N$1A.
N $ABE1 Room #N$1C.
  $ABE1,$01 Room #N$1C with bit 7 set.
N $ABE2 Room #N$1D.
  $ABE2,$01 Room #N$1D with bit 7 set.
  $ABE3,$02 South to room #N$08.
N $ABE5 Room #N$1E.
  $ABE5,$01 Room #N$1E with bit 7 set.
  $ABE6,$02 South to room #N$1F.
  $ABE8,$02 East to room #N$21.
  $ABEA,$02 West to room #N$07.
N $ABEC Room #N$1F.
  $ABEC,$01 Room #N$1F with bit 7 set.
  $ABED,$02 North to room #N$1E.
  $ABEF,$02 South to room #N$20.
N $ABF1 Room #N$20.
  $ABF1,$01 Room #N$20 with bit 7 set.
  $ABF2,$02 North to room #N$1F.
N $ABF4 Room #N$21.
  $ABF4,$01 Room #N$21 with bit 7 set.
  $ABF5,$02 South to room #N$23.
  $ABF7,$02 West to room #N$1E.
N $ABF9 Room #N$22.
  $ABF9,$01 Room #N$22 with bit 7 set.
  $ABFA,$02 Up to room #N$21.
N $ABFC Room #N$23.
  $ABFC,$01 Room #N$23 with bit 7 set.
  $ABFD,$02 North to room #N$21.
  $ABFF,$02 South to room #N$24.
  $AC01,$02 East to room #N$26.
N $AC03 Room #N$24.
  $AC03,$01 Room #N$24 with bit 7 set.
  $AC04,$02 North to room #N$23.
  $AC06,$02 Down to room #N$27.
N $AC08 Room #N$25.
  $AC08,$01 Room #N$25 with bit 7 set.
  $AC09,$02 West to room #N$22.
N $AC0B Room #N$26.
  $AC0B,$01 Room #N$26 with bit 7 set.
  $AC0C,$02 West to room #N$23.
N $AC0E Room #N$27.
  $AC0E,$01 Room #N$27 with bit 7 set.
  $AC0F,$02 East to room #N$28.
  $AC11,$02 Up to room #N$24.
N $AC13 Room #N$28.
  $AC13,$01 Room #N$28 with bit 7 set.
  $AC14,$02 West to room #N$27.
N $AC16 Room #N$29.
  $AC16,$01 Room #N$29 with bit 7 set.
  $AC17,$02 Down to room #N$2A.
N $AC19 Room #N$2A.
  $AC19,$01 Room #N$2A with bit 7 set.
  $AC1A,$02 South to room #N$2B.
N $AC1C Room #N$2B.
  $AC1C,$01 Room #N$2B with bit 7 set.
  $AC1D,$02 North to room #N$2A.
N $AC1F Room #N$2C.
  $AC1F,$01 Room #N$2C with bit 7 set.
  $AC20,$02 West to room #N$2B.
  $AC22,$02 Down to room #N$2D.
N $AC24 Room #N$2D.
  $AC24,$01 Room #N$2D with bit 7 set.
  $AC25,$02 East to room #N$2F.
  $AC27,$02 West to room #N$2E.
  $AC29,$02 Up to room #N$2C.
N $AC2B Room #N$2E.
  $AC2B,$01 Room #N$2E with bit 7 set.
  $AC2C,$02 South to room #N$01.
  $AC2E,$02 East to room #N$01.
  $AC30,$02 West to room #N$01.
  $AC32,$02 Up to room #N$10.
  $AC34,$02 Down to room #N$01.
N $AC36 Room #N$2F.
  $AC36,$01 Room #N$2F with bit 7 set.
  $AC37,$02 North to room #N$31.
  $AC39,$02 East to room #N$32.
  $AC3B,$02 West to room #N$2D.
N $AC3D Room #N$30.
  $AC3D,$01 Room #N$30 with bit 7 set.
  $AC3E,$02 West to room #N$1C.
N $AC40 Room #N$31.
  $AC40,$01 Room #N$31 with bit 7 set.
  $AC41,$02 South to room #N$2F.
  $AC43,$02 East to room #N$33.
  $AC45,$02 Down to room #N$35.
N $AC47 Room #N$32.
  $AC47,$01 Room #N$32 with bit 7 set.
  $AC48,$02 West to room #N$2F.
N $AC4A Room #N$33.
  $AC4A,$01 Room #N$33 with bit 7 set.
  $AC4B,$02 West to room #N$31.
N $AC4D Room #N$34.
  $AC4D,$01 Room #N$34 with bit 7 set.
  $AC4E,$02 East to room #N$37.
N $AC50 Room #N$35.
  $AC50,$01 Room #N$35 with bit 7 set.
  $AC51,$02 Up to room #N$31.
N $AC53 Room #N$36.
  $AC53,$01 Room #N$36 with bit 7 set.
  $AC54,$02 East to room #N$38.
N $AC56 Room #N$37.
  $AC56,$01 Room #N$37 with bit 7 set.
  $AC57,$02 West to room #N$34.
N $AC59 Room #N$38.
  $AC59,$01 Room #N$38 with bit 7 set.
  $AC5A,$02 East to room #N$39.
  $AC5C,$02 West to room #N$36.
N $AC5E Room #N$39.
  $AC5E,$01 Room #N$39 with bit 7 set.
  $AC5F,$02 North to room #N$3A.
  $AC61,$02 East to room #N$3B.
  $AC63,$02 West to room #N$38.
N $AC65 Room #N$3A.
  $AC65,$01 Room #N$3A with bit 7 set.
  $AC66,$02 South to room #N$39.
N $AC68 Room #N$3B.
  $AC68,$01 Room #N$3B with bit 7 set.
  $AC69,$02 West to room #N$39.
N $AC6B Room #N$3C.
  $AC6B,$01 Room #N$3C with bit 7 set.
  $AC6C,$02 Up to room #N$3B.
N $AC6E Room #N$3D.
  $AC6E,$01 Room #N$3D with bit 7 set.
  $AC6F,$02 North to room #N$3E.
  $AC71,$02 South to room #N$3A.
N $AC73 Room #N$3E.
  $AC73,$01 Room #N$3E with bit 7 set.
  $AC74,$02 South to room #N$3D.
N $AC76 Room #N$3F.
  $AC76,$01 Room #N$3F with bit 7 set.
  $AC77,$02 Up to room #N$38.
N $AC79 Room #N$40.
  $AC79,$01 Room #N$40 with bit 7 set.
N $AC7A Room #N$41.
  $AC7A,$01 Room #N$41 with bit 7 set.
  $AC7B,$02 South to room #N$42.
N $AC7D Room #N$42.
  $AC7D,$01 Room #N$42 with bit 7 set.
  $AC7E,$02 North to room #N$41.
  $AC80,$02 East to room #N$43.
N $AC82 Room #N$43.
  $AC82,$01 Room #N$43 with bit 7 set.
  $AC83,$02 West to room #N$42.
N $AC85 Room #N$44.
  $AC85,$01 Room #N$44 with bit 7 set.
  $AC86,$02 South to room #N$02.
  $AC88,$02 East to room #N$02.
  $AC8A,$02 West to room #N$02.
N $AC8C Room #N$45.
  $AC8C,$01 Room #N$45 with bit 7 set.
  $AC8D,$02 North to room #N$02.
  $AC8F,$02 South to room #N$02.
  $AC91,$02 West to room #N$02.
N $AC93 Room #N$46.
  $AC93,$01 Room #N$46 with bit 7 set.
  $AC94,$02 East to room #N$47.
N $AC96 Room #N$47.
  $AC96,$01 Room #N$47 with bit 7 set.
  $AC97,$02 West to room #N$46.
N $AC99 Room #N$48.
  $AC99,$01 Room #N$48 with bit 7 set.
N $AC9A Room #N$49.
  $AC9A,$01 Room #N$49 with bit 7 set.
N $AC9B Room #N$4A.
  $AC9B,$01 Room #N$4A with bit 7 set.
  $AC9C,$02 North to room #N$01.
  $AC9E,$02 South to room #N$4B.
N $ACA0 Room #N$4B.
  $ACA0,$01 Room #N$4B with bit 7 set.
  $ACA1,$02 North to room #N$4A.
  $ACA3,$02 South to room #N$4C.
N $ACA5 Room #N$4C.
  $ACA5,$01 Room #N$4C with bit 7 set.
  $ACA6,$02 North to room #N$4B.
  $ACA8,$02 South to room #N$4F.
  $ACAA,$02 East to room #N$4D.
N $ACAC Room #N$4D.
  $ACAC,$01 Room #N$4D with bit 7 set.
  $ACAD,$02 West to room #N$4C.
  $ACAF,$02 East to room #N$4E.
N $ACB1 Room #N$4E.
  $ACB1,$01 Room #N$4E with bit 7 set.
  $ACB2,$02 West to room #N$4D.
N $ACB4 Room #N$4F.
  $ACB4,$01 Room #N$4F with bit 7 set.
  $ACB5,$02 North to room #N$4C.
  $ACB7,$02 South to room #N$50.
N $ACB9 Room #N$50.
  $ACB9,$01 Room #N$50 with bit 7 set.
  $ACBA,$02 North to room #N$4F.
  $ACBC,$02 East to room #N$51.
N $ACBE Room #N$51.
  $ACBE,$01 Room #N$51 with bit 7 set.
  $ACBF,$02 South to room #N$56.
  $ACC1,$02 East to room #N$52.
  $ACC3,$02 West to room #N$50.
N $ACC5 Room #N$52.
  $ACC5,$01 Room #N$52 with bit 7 set.
  $ACC6,$02 East to room #N$53.
  $ACC8,$02 West to room #N$51.
N $ACCA Room #N$53.
  $ACCA,$01 Room #N$53 with bit 7 set.
  $ACCB,$02 North to room #N$54.
  $ACCD,$02 East to room #N$55.
  $ACCF,$02 West to room #N$52.
N $ACD1 Room #N$54.
  $ACD1,$01 Room #N$54 with bit 7 set.
  $ACD2,$02 South to room #N$53.
N $ACD4 Room #N$55.
  $ACD4,$01 Room #N$55 with bit 7 set.
  $ACD5,$02 West to room #N$53.
N $ACD7 Room #N$56.
  $ACD7,$01 Room #N$56 with bit 7 set.
  $ACD8,$02 North to room #N$51.
  $ACDA,$02 South to room #N$5B.
  $ACDC,$02 East to room #N$57.
N $ACDE Room #N$57.
  $ACDE,$01 Room #N$57 with bit 7 set.
  $ACDF,$02 South to room #N$5C.
  $ACE1,$02 East to room #N$58.
  $ACE3,$02 West to room #N$56.
N $ACE5 Room #N$58.
  $ACE5,$01 Room #N$58 with bit 7 set.
  $ACE6,$02 North to room #N$52.
  $ACE8,$02 West to room #N$57.
N $ACEA Room #N$59.
  $ACEA,$01 Room #N$59 with bit 7 set.
  $ACEB,$02 South to room #N$5A.
  $ACED,$02 East to room #N$5A.
N $ACEF Room #N$5A.
  $ACEF,$01 Room #N$5A with bit 7 set.
  $ACF0,$02 North to room #N$53.
  $ACF2,$02 South to room #N$5A.
  $ACF4,$02 East to room #N$5A.
  $ACF6,$02 West to room #N$59.
N $ACF8 Room #N$5B.
  $ACF8,$01 Room #N$5B with bit 7 set.
  $ACF9,$02 North to room #N$56.
N $ACFB Room #N$5C.
  $ACFB,$01 Room #N$5C with bit 7 set.
  $ACFC,$02 North to room #N$57.
N $ACFE Room #N$5D.
  $ACFE,$01 Room #N$5D with bit 7 set.
  $ACFF,$02 North to room #N$49.
  $AD01,$02 South to room #N$5F.
N $AD03 Room #N$5E.
  $AD03,$01 Room #N$5E with bit 7 set.
  $AD04,$02 East to room #N$5F.
N $AD06 Room #N$5F.
  $AD06,$01 Room #N$5F with bit 7 set.
  $AD07,$02 North to room #N$5D.
  $AD09,$02 South to room #N$61.
  $AD0B,$02 East to room #N$60.
  $AD0D,$02 West to room #N$5E.
N $AD0F Room #N$60.
  $AD0F,$01 Room #N$60 with bit 7 set.
  $AD10,$02 West to room #N$5F.
N $AD12 Room #N$61.
  $AD12,$01 Room #N$61 with bit 7 set.
  $AD13,$02 North to room #N$5F.
N $AD15 Room #N$62.
  $AD15,$01 Room #N$62 with bit 7 set.
  $AD16,$02 North to room #N$61.
N $AD18 Room #N$63.
  $AD18,$01 Room #N$63 with bit 7 set.
  $AD19,$02 South to room #N$65.
N $AD1B Room #N$64.
  $AD1B,$01 Room #N$64 with bit 7 set.
  $AD1C,$02 East to room #N$65.
N $AD1E Room #N$65.
  $AD1E,$01 Room #N$65 with bit 7 set.
  $AD1F,$02 North to room #N$63.
  $AD21,$02 South to room #N$66.
  $AD23,$02 East to room #N$66.
  $AD25,$02 West to room #N$64.
N $AD27 Room #N$66.
  $AD27,$01 Room #N$66 with bit 7 set.
  $AD28,$02 North to room #N$67.
  $AD2A,$02 South to room #N$69.
  $AD2C,$02 East to room #N$67.
  $AD2E,$02 West to room #N$65.
N $AD30 Room #N$67.
  $AD30,$01 Room #N$67 with bit 7 set.
  $AD31,$02 North to room #N$66.
  $AD33,$02 South to room #N$68.
  $AD35,$02 East to room #N$68.
  $AD37,$02 West to room #N$69.
N $AD39 Room #N$68.
  $AD39,$01 Room #N$68 with bit 7 set.
  $AD3A,$02 North to room #N$67.
  $AD3C,$02 South to room #N$67.
  $AD3E,$02 East to room #N$69.
  $AD40,$02 West to room #N$69.
N $AD42 Room #N$69.
  $AD42,$01 Room #N$69 with bit 7 set.
  $AD43,$02 North to room #N$66.
  $AD45,$02 South to room #N$67.
  $AD47,$02 East to room #N$68.
  $AD49,$02 West to room #N$6A.
N $AD4B Room #N$6A.
  $AD4B,$01 Room #N$6A with bit 7 set.
  $AD4C,$02 East to room #N$69.
N $AD4E Room #N$6B.
  $AD4E,$01 Room #N$6B with bit 7 set.
N $AD4F Room #N$6C.
  $AD4F,$01 Room #N$6C with bit 7 set.
N $AD50 Room #N$6D.
  $AD50,$01 Room #N$6D with bit 7 set.
N $AD51 Room #N$6E.
  $AD51,$01 Room #N$6E with bit 7 set.
N $AD52 Room #N$6F.
  $AD52,$01 Room #N$6F with bit 7 set.

t $AD53 Assembler Source (Scroll)
@ $AD53 label=AssemblerSource_Scroll
D $AD53 Part of the game's assembler source that happened to be in memory when
. the data was saved, after the exit table at #R$AB67. Each line is a two-byte
. line number, a length byte, the text and #N($0D), the same layout as #R$B74F.
. The lines are 3760 to 4140 of a cursor-scroll listing.
  $AD53,$02 The end of the line before.
  $AD55,$13 #HTML(Line 3760: <code>LD (CURSADD),#REGhl</code>.)
  $AD68,$0C #HTML(Line 3770: <code>JP dispr</code>.)
  $AD74,$09 #HTML(Line 3780: <code>.scro</code>.)
  $AD7D,$12 #HTML(Line 3790: <code>LD #REGa,(CURSROW)</code>.)
  $AD8F,$09 #HTML(Line 3800: <code>CP 19</code>.)
  $AD98,$0F #HTML(Line 3810: <code>JR NZ,not19</code>.)
  $ADA7,$0E #HTML(Line 3820: <code>LD #REGa,(dck)</code>.)
  $ADB5,$07 #HTML(Line 3830: <code>#N$84 #REGa</code>.)
  $ADBC,$0E #HTML(Line 3840: <code>JR Z,not19</code>.)
  $ADCA,$0B #HTML(Line 3850: <code>LD #REGa,13</code>.)
  $ADD5,$0F #HTML(Line 3860: <code>LD (wbot),#REGa</code>.)
  $ADE4,$11 #HTML(Line 3870: <code>#N$D6 ak:#N$D6 scrbot</code>.)
  $ADF5,$12 #HTML(Line 3880: <code>LD #REGa,19:JR lds</code>.)
  $AE07,$0A #HTML(Line 3890: <code>.not19</code>.)
  $AE11,$09 #HTML(Line 3900: <code>CP 23</code>.)
  $AE1A,$0D #HTML(Line 3910: <code>JR C,nsc1</code>.)
  $AE27,$0D #HTML(Line 3920: <code> #N$D6 scrbot</code>.)
  $AE34,$0B #HTML(Line 3930: <code>LD #REGa,23</code>.)
  $AE3F,$1C #HTML(Line 3940: <code>.lds LD (CURSROW),#REGa:#N$D6 fa</code>.)
  $AE5B,$18 #HTML(Line 3950: <code>XOR #REGa:LD (CURSCOL),#REGa</code>.)
  $AE73,$0C #HTML(Line 3960: <code>JP dispr</code>.)
  $AE7F,$09 #HTML(Line 3970: <code>.nsc1</code>.)
  $AE88,$12 #HTML(Line 3980: <code>LD #REGa,(CURSROW)</code>.)
  $AE9A,$09 #HTML(Line 3990: <code>INC #REGa</code>.)
  $AEA3,$12 #HTML(Line 4000: <code>LD (CURSROW),#REGa</code>.)
  $AEB5,$08 #HTML(Line 4010: <code>#N$D6 fa</code>.)
  $AEBD,$18 #HTML(Line 4020: <code>XOR #REGa:LD (CURSCOL),#REGa</code>.)
  $AED5,$0C #HTML(Line 4030: <code>JP dispr</code>.)
  $AEE1,$08 #HTML(Line 4040: <code>.nsc</code>.)
  $AEE9,$13 #HTML(Line 4050: <code>LD #REGde,(CURSADD)</code>.)
  $AEFC,$10 #HTML(Line 4060: <code> LD #REGbc,15360</code>.)
  $AF0C,$0A #HTML(Line 4070: <code>LD #REGh,0</code>.)
  $AF16,$0A #HTML(Line 4080: <code>LD #REGl,#REGa</code>.)
  $AF20,$0D #HTML(Line 4090: <code>ADD #REGhl,#REGhl</code>.)
  $AF2D,$0D #HTML(Line 4100: <code>ADD #REGhl,#REGhl</code>.)
  $AF3A,$0D #HTML(Line 4110: <code>ADD #REGhl,#REGhl</code>.)
  $AF47,$0D #HTML(Line 4120: <code>ADD #REGhl,#REGbc</code>.)
  $AF54,$2A #HTML(Line 4130: <code>PUSH #REGde:PUSH #REGhl:LD #REGde,BILB:LD
. #REGbc,8*256</code>.)
  $AF7E,$30 #HTML(Line 4140, cut off after "<code> .acchasc LD #REGa,(#REGhl):LD
. (#REGde),#REGa:INC #REGhl:INC #REGde:B</code> ".)

u $AFAE
B $AFAE,$20E

t $B1BC Dictionary
@ $B1BC label=Dictionary
D $B1BC 256 words used by the message printer. A word ends with bit 7 set on its
. last letter. The first word is empty: its only byte is #N$80. Later words
. include the letters of the alphabet, so a token in that range is printed as
. itself.
N $B1BC "#STR(#PC)".
  $B1BC,$01,c$01 Terminator.
N $B1BD "#STR(#PC)".
@ $B1BD label=Dictionary_01
  $B1BD,$07
  $B1C4,$01,c$01 Terminator.
N $B1C5 "#STR(#PC)".
@ $B1C5 label=Dictionary_02
  $B1C5,$07
  $B1CC,$01,c$01 Terminator.
N $B1CD "#STR(#PC)".
@ $B1CD label=Dictionary_03
  $B1CD,$07
  $B1D4,$01,c$01 Terminator.
N $B1D5 "#STR(#PC)".
@ $B1D5 label=Dictionary_04
  $B1D5,$07
  $B1DC,$01,c$01 Terminator.
N $B1DD "#STR(#PC)".
@ $B1DD label=Dictionary_05
  $B1DD,$07
  $B1E4,$01,c$01 Terminator.
N $B1E5 "#STR(#PC)".
@ $B1E5 label=Dictionary_06
  $B1E5,$07
  $B1EC,$01,c$01 Terminator.
N $B1ED "#STR(#PC)".
@ $B1ED label=Dictionary_07
  $B1ED,$07
  $B1F4,$01,c$01 Terminator.
N $B1F5 "#STR(#PC)".
@ $B1F5 label=Dictionary_08
  $B1F5,$07
  $B1FC,$01,c$01 Terminator.
N $B1FD "#STR(#PC)".
@ $B1FD label=Dictionary_09
  $B1FD,$07
  $B204,$01,c$01 Terminator.
N $B205 "#STR(#PC)".
@ $B205 label=Dictionary_0A
  $B205,$07
  $B20C,$01,c$01 Terminator.
N $B20D "#STR(#PC)".
@ $B20D label=Dictionary_0B
  $B20D,$07
  $B214,$01,c$01 Terminator.
N $B215 "#STR(#PC)".
@ $B215 label=Dictionary_0C
  $B215,$06
  $B21B,$01,c$01 Terminator.
N $B21C "#STR(#PC)".
@ $B21C label=Dictionary_0D
  $B21C,$06
  $B222,$01,c$01 Terminator.
N $B223 "#STR(#PC)".
@ $B223 label=Dictionary_0E
  $B223,$06
  $B229,$01,c$01 Terminator.
N $B22A "#STR(#PC)".
@ $B22A label=Dictionary_0F
  $B22A,$05
  $B22F,$01,c$01 Terminator.
N $B230 "#STR(#PC)".
@ $B230 label=Dictionary_10
  $B230,$05
  $B235,$01,c$01 Terminator.
N $B236 "#STR(#PC)".
@ $B236 label=Dictionary_11
  $B236,$05
  $B23B,$01,c$01 Terminator.
N $B23C "#STR(#PC)".
@ $B23C label=Dictionary_12
  $B23C,$05
  $B241,$01,c$01 Terminator.
N $B242 "#STR(#PC)".
@ $B242 label=Dictionary_13
  $B242,$05
  $B247,$01,c$01 Terminator.
N $B248 "#STR(#PC)".
@ $B248 label=Dictionary_14
  $B248,$05
  $B24D,$01,c$01 Terminator.
N $B24E "#STR(#PC)".
@ $B24E label=Dictionary_15
  $B24E,$05
  $B253,$01,c$01 Terminator.
N $B254 "#STR(#PC)".
@ $B254 label=Dictionary_16
  $B254,$05
  $B259,$01,c$01 Terminator.
N $B25A "#STR(#PC)".
@ $B25A label=Dictionary_17
  $B25A,$05
  $B25F,$01,c$01 Terminator.
N $B260 "#STR(#PC)".
@ $B260 label=Dictionary_18
  $B260,$04
  $B264,$01,c$01 Terminator.
N $B265 "#STR(#PC)".
@ $B265 label=Dictionary_19
  $B265,$04
  $B269,$01,c$01 Terminator.
N $B26A "#STR(#PC)".
@ $B26A label=Dictionary_1A
  $B26A,$01,c$01 Terminator.
N $B26B "#STR(#PC)".
@ $B26B label=Dictionary_1B
  $B26B,$04
  $B26F,$01,c$01 Terminator.
N $B270 "#STR(#PC)".
@ $B270 label=Dictionary_1C
  $B270,$04
  $B274,$01,c$01 Terminator.
N $B275 "#STR(#PC)".
@ $B275 label=Dictionary_1D
  $B275,$04
  $B279,$01,c$01 Terminator.
N $B27A "#STR(#PC)".
@ $B27A label=Dictionary_1E
  $B27A,$04
  $B27E,$01,c$01 Terminator.
N $B27F "#STR(#PC)".
@ $B27F label=Dictionary_1F
  $B27F,$04
  $B283,$01,c$01 Terminator.
N $B284 "#STR(#PC)".
@ $B284 label=Dictionary_20
  $B284,$01,c$01 Terminator.
N $B285 "#STR(#PC)".
@ $B285 label=Dictionary_21
  $B285,$01,c$01 Terminator.
N $B286 "#STR(#PC)".
@ $B286 label=Dictionary_22
  $B286,$04
  $B28A,$01,c$01 Terminator.
N $B28B "#STR(#PC)".
@ $B28B label=Dictionary_23
  $B28B,$04
  $B28F,$01,c$01 Terminator.
N $B290 "#STR(#PC)".
@ $B290 label=Dictionary_24
  $B290,$04
  $B294,$01,c$01 Terminator.
N $B295 "#STR(#PC)".
@ $B295 label=Dictionary_25
  $B295,$01,c$01 Terminator.
N $B296 "#STR(#PC)".
@ $B296 label=Dictionary_26
  $B296,$04
  $B29A,$01,c$01 Terminator.
N $B29B "#STR(#PC)".
@ $B29B label=Dictionary_27
  $B29B,$01,c$01 Terminator.
N $B29C "#STR(#PC)".
@ $B29C label=Dictionary_28
  $B29C,$01,c$01 Terminator.
N $B29D "#STR(#PC)".
@ $B29D label=Dictionary_29
  $B29D,$01,c$01 Terminator.
N $B29E "#STR(#PC)".
@ $B29E label=Dictionary_2A
  $B29E,$04
  $B2A2,$01,c$01 Terminator.
N $B2A3 "#STR(#PC)".
@ $B2A3 label=Dictionary_2B
  $B2A3,$04
  $B2A7,$01,c$01 Terminator.
N $B2A8 "#STR(#PC)".
@ $B2A8 label=Dictionary_2C
  $B2A8,$01,c$01 Terminator.
N $B2A9 "#STR(#PC)".
@ $B2A9 label=Dictionary_2D
  $B2A9,$04
  $B2AD,$01,c$01 Terminator.
N $B2AE "#STR(#PC)".
@ $B2AE label=Dictionary_2E
  $B2AE,$01,c$01 Terminator.
N $B2AF "#STR(#PC)".
@ $B2AF label=Dictionary_2F
  $B2AF,$01,c$01 Terminator.
N $B2B0 "#STR(#PC)".
@ $B2B0 label=Dictionary_30
  $B2B0,$01,c$01 Terminator.
N $B2B1 "#STR(#PC)".
@ $B2B1 label=Dictionary_31
  $B2B1,$01,c$01 Terminator.
N $B2B2 "#STR(#PC)".
@ $B2B2 label=Dictionary_32
  $B2B2,$04
  $B2B6,$01,c$01 Terminator.
N $B2B7 "#STR(#PC)".
@ $B2B7 label=Dictionary_33
  $B2B7,$04
  $B2BB,$01,c$01 Terminator.
N $B2BC "#STR(#PC)".
@ $B2BC label=Dictionary_34
  $B2BC,$01,c$01 Terminator.
N $B2BD "#STR(#PC)".
@ $B2BD label=Dictionary_35
  $B2BD,$04
  $B2C1,$01,c$01 Terminator.
N $B2C2 "#STR(#PC)".
@ $B2C2 label=Dictionary_36
  $B2C2,$03
  $B2C5,$01,c$01 Terminator.
N $B2C6 "#STR(#PC)".
@ $B2C6 label=Dictionary_37
  $B2C6,$03
  $B2C9,$01,c$01 Terminator.
N $B2CA "#STR(#PC)".
@ $B2CA label=Dictionary_38
  $B2CA,$03
  $B2CD,$01,c$01 Terminator.
N $B2CE "#STR(#PC)".
@ $B2CE label=Dictionary_39
  $B2CE,$03
  $B2D1,$01,c$01 Terminator.
N $B2D2 "#STR(#PC)".
@ $B2D2 label=Dictionary_3A
  $B2D2,$01,c$01 Terminator.
N $B2D3 "#STR(#PC)".
@ $B2D3 label=Dictionary_3B
  $B2D3,$03
  $B2D6,$01,c$01 Terminator.
N $B2D7 "#STR(#PC)".
@ $B2D7 label=Dictionary_3C
  $B2D7,$03
  $B2DA,$01,c$01 Terminator.
N $B2DB "#STR(#PC)".
@ $B2DB label=Dictionary_3D
  $B2DB,$01,c$01 Terminator.
N $B2DC "#STR(#PC)".
@ $B2DC label=Dictionary_3E
  $B2DC,$03
  $B2DF,$01,c$01 Terminator.
N $B2E0 "#STR(#PC)".
@ $B2E0 label=Dictionary_3F
  $B2E0,$01,c$01 Terminator.
N $B2E1 "#STR(#PC)".
@ $B2E1 label=Dictionary_40
  $B2E1,$03
  $B2E4,$01,c$01 Terminator.
N $B2E5 "#STR(#PC)".
@ $B2E5 label=Dictionary_41
  $B2E5,$01,c$01 Terminator.
N $B2E6 "#STR(#PC)".
@ $B2E6 label=Dictionary_42
  $B2E6,$01,c$01 Terminator.
N $B2E7 "#STR(#PC)".
@ $B2E7 label=Dictionary_43
  $B2E7,$01,c$01 Terminator.
N $B2E8 "#STR(#PC)".
@ $B2E8 label=Dictionary_44
  $B2E8,$01,c$01 Terminator.
N $B2E9 "#STR(#PC)".
@ $B2E9 label=Dictionary_45
  $B2E9,$01,c$01 Terminator.
N $B2EA "#STR(#PC)".
@ $B2EA label=Dictionary_46
  $B2EA,$01,c$01 Terminator.
N $B2EB "#STR(#PC)".
@ $B2EB label=Dictionary_47
  $B2EB,$01,c$01 Terminator.
N $B2EC "#STR(#PC)".
@ $B2EC label=Dictionary_48
  $B2EC,$01,c$01 Terminator.
N $B2ED "#STR(#PC)".
@ $B2ED label=Dictionary_49
  $B2ED,$01,c$01 Terminator.
N $B2EE "#STR(#PC)".
@ $B2EE label=Dictionary_4A
  $B2EE,$03
  $B2F1,$01,c$01 Terminator.
N $B2F2 "#STR(#PC)".
@ $B2F2 label=Dictionary_4B
  $B2F2,$03
  $B2F5,$01,c$01 Terminator.
N $B2F6 "#STR(#PC)".
@ $B2F6 label=Dictionary_4C
  $B2F6,$01,c$01 Terminator.
N $B2F7 "#STR(#PC)".
@ $B2F7 label=Dictionary_4D
  $B2F7,$01,c$01 Terminator.
N $B2F8 "#STR(#PC)".
@ $B2F8 label=Dictionary_4E
  $B2F8,$01,c$01 Terminator.
N $B2F9 "#STR(#PC)".
@ $B2F9 label=Dictionary_4F
  $B2F9,$01,c$01 Terminator.
N $B2FA "#STR(#PC)".
@ $B2FA label=Dictionary_50
  $B2FA,$01,c$01 Terminator.
N $B2FB "#STR(#PC)".
@ $B2FB label=Dictionary_51
  $B2FB,$03
  $B2FE,$01,c$01 Terminator.
N $B2FF "#STR(#PC)".
@ $B2FF label=Dictionary_52
  $B2FF,$01,c$01 Terminator.
N $B300 "#STR(#PC)".
@ $B300 label=Dictionary_53
  $B300,$01,c$01 Terminator.
N $B301 "#STR(#PC)".
@ $B301 label=Dictionary_54
  $B301,$01,c$01 Terminator.
N $B302 "#STR(#PC)".
@ $B302 label=Dictionary_55
  $B302,$01,c$01 Terminator.
N $B303 "#STR(#PC)".
@ $B303 label=Dictionary_56
  $B303,$03
  $B306,$01,c$01 Terminator.
N $B307 "#STR(#PC)".
@ $B307 label=Dictionary_57
  $B307,$01,c$01 Terminator.
N $B308 "#STR(#PC)".
@ $B308 label=Dictionary_58
  $B308,$03
  $B30B,$01,c$01 Terminator.
N $B30C "#STR(#PC)".
@ $B30C label=Dictionary_59
  $B30C,$01,c$01 Terminator.
N $B30D "#STR(#PC)".
@ $B30D label=Dictionary_5A
  $B30D,$03
  $B310,$01,c$01 Terminator.
N $B311 "#STR(#PC)".
@ $B311 label=Dictionary_5B
  $B311,$03
  $B314,$01,c$01 Terminator.
N $B315 "#STR(#PC)".
@ $B315 label=Dictionary_5C
  $B315,$03
  $B318,$01,c$01 Terminator.
N $B319 "#STR(#PC)".
@ $B319 label=Dictionary_5D
  $B319,$03
  $B31C,$01,c$01 Terminator.
N $B31D "#STR(#PC)".
@ $B31D label=Dictionary_5E
  $B31D,$01,c$01 Terminator.
N $B31E "#STR(#PC)".
@ $B31E label=Dictionary_5F
  $B31E,$03
  $B321,$01,c$01 Terminator.
N $B322 "#STR(#PC)".
@ $B322 label=Dictionary_60
  $B322,$03
  $B325,$01,c$01 Terminator.
N $B326 "#STR(#PC)".
@ $B326 label=Dictionary_61
  $B326,$01,c$01 Terminator.
N $B327 "#STR(#PC)".
@ $B327 label=Dictionary_62
  $B327,$01,c$01 Terminator.
N $B328 "#STR(#PC)".
@ $B328 label=Dictionary_63
  $B328,$01,c$01 Terminator.
N $B329 "#STR(#PC)".
@ $B329 label=Dictionary_64
  $B329,$01,c$01 Terminator.
N $B32A "#STR(#PC)".
@ $B32A label=Dictionary_65
  $B32A,$01,c$01 Terminator.
N $B32B "#STR(#PC)".
@ $B32B label=Dictionary_66
  $B32B,$01,c$01 Terminator.
N $B32C "#STR(#PC)".
@ $B32C label=Dictionary_67
  $B32C,$01,c$01 Terminator.
N $B32D "#STR(#PC)".
@ $B32D label=Dictionary_68
  $B32D,$01,c$01 Terminator.
N $B32E "#STR(#PC)".
@ $B32E label=Dictionary_69
  $B32E,$01,c$01 Terminator.
N $B32F "#STR(#PC)".
@ $B32F label=Dictionary_6A
  $B32F,$01,c$01 Terminator.
N $B330 "#STR(#PC)".
@ $B330 label=Dictionary_6B
  $B330,$01,c$01 Terminator.
N $B331 "#STR(#PC)".
@ $B331 label=Dictionary_6C
  $B331,$01,c$01 Terminator.
N $B332 "#STR(#PC)".
@ $B332 label=Dictionary_6D
  $B332,$01,c$01 Terminator.
N $B333 "#STR(#PC)".
@ $B333 label=Dictionary_6E
  $B333,$01,c$01 Terminator.
N $B334 "#STR(#PC)".
@ $B334 label=Dictionary_6F
  $B334,$01,c$01 Terminator.
N $B335 "#STR(#PC)".
@ $B335 label=Dictionary_70
  $B335,$01,c$01 Terminator.
N $B336 "#STR(#PC)".
@ $B336 label=Dictionary_71
  $B336,$01,c$01 Terminator.
N $B337 "#STR(#PC)".
@ $B337 label=Dictionary_72
  $B337,$01,c$01 Terminator.
N $B338 "#STR(#PC)".
@ $B338 label=Dictionary_73
  $B338,$01,c$01 Terminator.
N $B339 "#STR(#PC)".
@ $B339 label=Dictionary_74
  $B339,$01,c$01 Terminator.
N $B33A "#STR(#PC)".
@ $B33A label=Dictionary_75
  $B33A,$01,c$01 Terminator.
N $B33B "#STR(#PC)".
@ $B33B label=Dictionary_76
  $B33B,$01,c$01 Terminator.
N $B33C "#STR(#PC)".
@ $B33C label=Dictionary_77
  $B33C,$01,c$01 Terminator.
N $B33D "#STR(#PC)".
@ $B33D label=Dictionary_78
  $B33D,$01,c$01 Terminator.
N $B33E "#STR(#PC)".
@ $B33E label=Dictionary_79
  $B33E,$01,c$01 Terminator.
N $B33F "#STR(#PC)".
@ $B33F label=Dictionary_7A
  $B33F,$01,c$01 Terminator.
N $B340 "#STR(#PC)".
@ $B340 label=Dictionary_7B
  $B340,$03
  $B343,$01,c$01 Terminator.
N $B344 "#STR(#PC)".
@ $B344 label=Dictionary_7C
  $B344,$03
  $B347,$01,c$01 Terminator.
N $B348 "#STR(#PC)".
@ $B348 label=Dictionary_7D
  $B348,$03
  $B34B,$01,c$01 Terminator.
N $B34C "#STR(#PC)".
@ $B34C label=Dictionary_7E
  $B34C,$01,c$01 Terminator.
N $B34D "#STR(#PC)".
@ $B34D label=Dictionary_7F
  $B34D,$03
  $B350,$01,c$01 Terminator.
N $B351 "#STR(#PC)".
@ $B351 label=Dictionary_80
  $B351,$03
  $B354,$01,c$01 Terminator.
N $B355 "#STR(#PC)".
@ $B355 label=Dictionary_81
  $B355,$03
  $B358,$01,c$01 Terminator.
N $B359 "#STR(#PC)".
@ $B359 label=Dictionary_82
  $B359,$03
  $B35C,$01,c$01 Terminator.
N $B35D "#STR(#PC)".
@ $B35D label=Dictionary_83
  $B35D,$02
  $B35F,$01,c$01 Terminator.
N $B360 "#STR(#PC)".
@ $B360 label=Dictionary_84
  $B360,$02
  $B362,$01,c$01 Terminator.
N $B363 "#STR(#PC)".
@ $B363 label=Dictionary_85
  $B363,$02
  $B365,$01,c$01 Terminator.
N $B366 "#STR(#PC)".
@ $B366 label=Dictionary_86
  $B366,$02
  $B368,$01,c$01 Terminator.
N $B369 "#STR(#PC)".
@ $B369 label=Dictionary_87
  $B369,$02
  $B36B,$01,c$01 Terminator.
N $B36C "#STR(#PC)".
@ $B36C label=Dictionary_88
  $B36C,$02
  $B36E,$01,c$01 Terminator.
N $B36F "#STR(#PC)".
@ $B36F label=Dictionary_89
  $B36F,$02
  $B371,$01,c$01 Terminator.
N $B372 "#STR(#PC)".
@ $B372 label=Dictionary_8A
  $B372,$02
  $B374,$01,c$01 Terminator.
N $B375 "#STR(#PC)".
@ $B375 label=Dictionary_8B
  $B375,$02
  $B377,$01,c$01 Terminator.
N $B378 "#STR(#PC)".
@ $B378 label=Dictionary_8C
  $B378,$02
  $B37A,$01,c$01 Terminator.
N $B37B "#STR(#PC)".
@ $B37B label=Dictionary_8D
  $B37B,$02
  $B37D,$01,c$01 Terminator.
N $B37E "#STR(#PC)".
@ $B37E label=Dictionary_8E
  $B37E,$02
  $B380,$01,c$01 Terminator.
N $B381 "#STR(#PC)".
@ $B381 label=Dictionary_8F
  $B381,$02
  $B383,$01,c$01 Terminator.
N $B384 "#STR(#PC)".
@ $B384 label=Dictionary_90
  $B384,$02
  $B386,$01,c$01 Terminator.
N $B387 "#STR(#PC)".
@ $B387 label=Dictionary_91
  $B387,$02
  $B389,$01,c$01 Terminator.
N $B38A "#STR(#PC)".
@ $B38A label=Dictionary_92
  $B38A,$02
  $B38C,$01,c$01 Terminator.
N $B38D "#STR(#PC)".
@ $B38D label=Dictionary_93
  $B38D,$02
  $B38F,$01,c$01 Terminator.
N $B390 "#STR(#PC)".
@ $B390 label=Dictionary_94
  $B390,$02
  $B392,$01,c$01 Terminator.
N $B393 "#STR(#PC)".
@ $B393 label=Dictionary_95
  $B393,$02
  $B395,$01,c$01 Terminator.
N $B396 "#STR(#PC)".
@ $B396 label=Dictionary_96
  $B396,$02
  $B398,$01,c$01 Terminator.
N $B399 "#STR(#PC)".
@ $B399 label=Dictionary_97
  $B399,$02
  $B39B,$01,c$01 Terminator.
N $B39C "#STR(#PC)".
@ $B39C label=Dictionary_98
  $B39C,$02
  $B39E,$01,c$01 Terminator.
N $B39F "#STR(#PC)".
@ $B39F label=Dictionary_99
  $B39F,$02
  $B3A1,$01,c$01 Terminator.
N $B3A2 "#STR(#PC)".
@ $B3A2 label=Dictionary_9A
  $B3A2,$02
  $B3A4,$01,c$01 Terminator.
N $B3A5 "#STR(#PC)".
@ $B3A5 label=Dictionary_9B
  $B3A5,$02
  $B3A7,$01,c$01 Terminator.
N $B3A8 "#STR(#PC)".
@ $B3A8 label=Dictionary_9C
  $B3A8,$02
  $B3AA,$01,c$01 Terminator.
N $B3AB "#STR(#PC)".
@ $B3AB label=Dictionary_9D
  $B3AB,$02
  $B3AD,$01,c$01 Terminator.
N $B3AE "#STR(#PC)".
@ $B3AE label=Dictionary_9E
  $B3AE,$02
  $B3B0,$01,c$01 Terminator.
N $B3B1 "#STR(#PC)".
@ $B3B1 label=Dictionary_9F
  $B3B1,$02
  $B3B3,$01,c$01 Terminator.
N $B3B4 "#STR(#PC)".
@ $B3B4 label=Dictionary_A0
  $B3B4,$02
  $B3B6,$01,c$01 Terminator.
N $B3B7 "#STR(#PC)".
@ $B3B7 label=Dictionary_A1
  $B3B7,$02
  $B3B9,$01,c$01 Terminator.
N $B3BA "#STR(#PC)".
@ $B3BA label=Dictionary_A2
  $B3BA,$02
  $B3BC,$01,c$01 Terminator.
N $B3BD "#STR(#PC)".
@ $B3BD label=Dictionary_A3
  $B3BD,$02
  $B3BF,$01,c$01 Terminator.
N $B3C0 "#STR(#PC)".
@ $B3C0 label=Dictionary_A4
  $B3C0,$02
  $B3C2,$01,c$01 Terminator.
N $B3C3 "#STR(#PC)".
@ $B3C3 label=Dictionary_A5
  $B3C3,$02
  $B3C5,$01,c$01 Terminator.
N $B3C6 "#STR(#PC)".
@ $B3C6 label=Dictionary_A6
  $B3C6,$02
  $B3C8,$01,c$01 Terminator.
N $B3C9 "#STR(#PC)".
@ $B3C9 label=Dictionary_A7
  $B3C9,$02
  $B3CB,$01,c$01 Terminator.
N $B3CC "#STR(#PC)".
@ $B3CC label=Dictionary_A8
  $B3CC,$02
  $B3CE,$01,c$01 Terminator.
N $B3CF "#STR(#PC)".
@ $B3CF label=Dictionary_A9
  $B3CF,$02
  $B3D1,$01,c$01 Terminator.
N $B3D2 "#STR(#PC)".
@ $B3D2 label=Dictionary_AA
  $B3D2,$02
  $B3D4,$01,c$01 Terminator.
N $B3D5 "#STR(#PC)".
@ $B3D5 label=Dictionary_AB
  $B3D5,$02
  $B3D7,$01,c$01 Terminator.
N $B3D8 "#STR(#PC)".
@ $B3D8 label=Dictionary_AC
  $B3D8,$02
  $B3DA,$01,c$01 Terminator.
N $B3DB "#STR(#PC)".
@ $B3DB label=Dictionary_AD
  $B3DB,$02
  $B3DD,$01,c$01 Terminator.
N $B3DE "#STR(#PC)".
@ $B3DE label=Dictionary_AE
  $B3DE,$02
  $B3E0,$01,c$01 Terminator.
N $B3E1 "#STR(#PC)".
@ $B3E1 label=Dictionary_AF
  $B3E1,$02
  $B3E3,$01,c$01 Terminator.
N $B3E4 "#STR(#PC)".
@ $B3E4 label=Dictionary_B0
  $B3E4,$02
  $B3E6,$01,c$01 Terminator.
N $B3E7 "#STR(#PC)".
@ $B3E7 label=Dictionary_B1
  $B3E7,$02
  $B3E9,$01,c$01 Terminator.
N $B3EA "#STR(#PC)".
@ $B3EA label=Dictionary_B2
  $B3EA,$02
  $B3EC,$01,c$01 Terminator.
N $B3ED "#STR(#PC)".
@ $B3ED label=Dictionary_B3
  $B3ED,$02
  $B3EF,$01,c$01 Terminator.
N $B3F0 "#STR(#PC)".
@ $B3F0 label=Dictionary_B4
  $B3F0,$02
  $B3F2,$01,c$01 Terminator.
N $B3F3 "#STR(#PC)".
@ $B3F3 label=Dictionary_B5
  $B3F3,$02
  $B3F5,$01,c$01 Terminator.
N $B3F6 "#STR(#PC)".
@ $B3F6 label=Dictionary_B6
  $B3F6,$02
  $B3F8,$01,c$01 Terminator.
N $B3F9 "#STR(#PC)".
@ $B3F9 label=Dictionary_B7
  $B3F9,$02
  $B3FB,$01,c$01 Terminator.
N $B3FC "#STR(#PC)".
@ $B3FC label=Dictionary_B8
  $B3FC,$02
  $B3FE,$01,c$01 Terminator.
N $B3FF "#STR(#PC)".
@ $B3FF label=Dictionary_B9
  $B3FF,$02
  $B401,$01,c$01 Terminator.
N $B402 "#STR(#PC)".
@ $B402 label=Dictionary_BA
  $B402,$02
  $B404,$01,c$01 Terminator.
N $B405 "#STR(#PC)".
@ $B405 label=Dictionary_BB
  $B405,$01
  $B406,$01,c$01 Terminator.
N $B407 "#STR(#PC)".
@ $B407 label=Dictionary_BC
  $B407,$01
  $B408,$01,c$01 Terminator.
N $B409 "#STR(#PC)".
@ $B409 label=Dictionary_BD
  $B409,$01
  $B40A,$01,c$01 Terminator.
N $B40B "#STR(#PC)".
@ $B40B label=Dictionary_BE
  $B40B,$01
  $B40C,$01,c$01 Terminator.
N $B40D "#STR(#PC)".
@ $B40D label=Dictionary_BF
  $B40D,$01
  $B40E,$01,c$01 Terminator.
N $B40F "#STR(#PC)".
@ $B40F label=Dictionary_C0
  $B40F,$01
  $B410,$01,c$01 Terminator.
N $B411 "#STR(#PC)".
@ $B411 label=Dictionary_C1
  $B411,$01
  $B412,$01,c$01 Terminator.
N $B413 "#STR(#PC)".
@ $B413 label=Dictionary_C2
  $B413,$01
  $B414,$01,c$01 Terminator.
N $B415 "#STR(#PC)".
@ $B415 label=Dictionary_C3
  $B415,$01
  $B416,$01,c$01 Terminator.
N $B417 "#STR(#PC)".
@ $B417 label=Dictionary_C4
  $B417,$01
  $B418,$01,c$01 Terminator.
N $B419 "#STR(#PC)".
@ $B419 label=Dictionary_C5
  $B419,$01
  $B41A,$01,c$01 Terminator.
N $B41B "#STR(#PC)".
@ $B41B label=Dictionary_C6
  $B41B,$01
  $B41C,$01,c$01 Terminator.
N $B41D "#STR(#PC)".
@ $B41D label=Dictionary_C7
  $B41D,$01
  $B41E,$01,c$01 Terminator.
N $B41F "#STR(#PC)".
@ $B41F label=Dictionary_C8
  $B41F,$01
  $B420,$01,c$01 Terminator.
N $B421 "#STR(#PC)".
@ $B421 label=Dictionary_C9
  $B421,$01
  $B422,$01,c$01 Terminator.
N $B423 "#STR(#PC)".
@ $B423 label=Dictionary_CA
  $B423,$01
  $B424,$01,c$01 Terminator.
N $B425 "#STR(#PC)".
@ $B425 label=Dictionary_CB
  $B425,$01
  $B426,$01,c$01 Terminator.
N $B427 "#STR(#PC)".
@ $B427 label=Dictionary_CC
  $B427,$01
  $B428,$01,c$01 Terminator.
N $B429 "#STR(#PC)".
@ $B429 label=Dictionary_CD
  $B429,$01
  $B42A,$01,c$01 Terminator.
N $B42B "#STR(#PC)".
@ $B42B label=Dictionary_CE
  $B42B,$01
  $B42C,$01,c$01 Terminator.
N $B42D "#STR(#PC)".
@ $B42D label=Dictionary_CF
  $B42D,$01
  $B42E,$01,c$01 Terminator.
N $B42F "#STR(#PC)".
@ $B42F label=Dictionary_D0
  $B42F,$01
  $B430,$01,c$01 Terminator.
N $B431 "#STR(#PC)".
@ $B431 label=Dictionary_D1
  $B431,$01
  $B432,$01,c$01 Terminator.
N $B433 "#STR(#PC)".
@ $B433 label=Dictionary_D2
  $B433,$01
  $B434,$01,c$01 Terminator.
N $B435 "#STR(#PC)".
@ $B435 label=Dictionary_D3
  $B435,$01
  $B436,$01,c$01 Terminator.
N $B437 "#STR(#PC)".
@ $B437 label=Dictionary_D4
  $B437,$01
  $B438,$01,c$01 Terminator.
N $B439 "#STR(#PC)".
@ $B439 label=Dictionary_D5
  $B439,$01
  $B43A,$01,c$01 Terminator.
N $B43B "#STR(#PC)".
@ $B43B label=Dictionary_D6
  $B43B,$01
  $B43C,$01,c$01 Terminator.
N $B43D "#STR(#PC)".
@ $B43D label=Dictionary_D7
  $B43D,$01
  $B43E,$01,c$01 Terminator.
N $B43F "#STR(#PC)".
@ $B43F label=Dictionary_D8
  $B43F,$01
  $B440,$01,c$01 Terminator.
N $B441 "#STR(#PC)".
@ $B441 label=Dictionary_D9
  $B441,$01
  $B442,$01,c$01 Terminator.
N $B443 "#STR(#PC)".
@ $B443 label=Dictionary_DA
  $B443,$01
  $B444,$01,c$01 Terminator.
N $B445 "#STR(#PC)".
@ $B445 label=Dictionary_DB
  $B445,$01
  $B446,$01,c$01 Terminator.
N $B447 "#STR(#PC)".
@ $B447 label=Dictionary_DC
  $B447,$01
  $B448,$01,c$01 Terminator.
N $B449 "#STR(#PC)".
@ $B449 label=Dictionary_DD
  $B449,$01
  $B44A,$01,c$01 Terminator.
N $B44B "#STR(#PC)".
@ $B44B label=Dictionary_DE
  $B44B,$01
  $B44C,$01,c$01 Terminator.
N $B44D "#STR(#PC)".
@ $B44D label=Dictionary_DF
  $B44D,$01
  $B44E,$01,c$01 Terminator.
N $B44F "#STR(#PC)".
@ $B44F label=Dictionary_E0
  $B44F,$01
  $B450,$01,c$01 Terminator.
N $B451 "#STR(#PC)".
@ $B451 label=Dictionary_E1
  $B451,$01
  $B452,$01,c$01 Terminator.
N $B453 "#STR(#PC)".
@ $B453 label=Dictionary_E2
  $B453,$01
  $B454,$01,c$01 Terminator.
N $B455 "#STR(#PC)".
@ $B455 label=Dictionary_E3
  $B455,$01
  $B456,$01,c$01 Terminator.
N $B457 "#STR(#PC)".
@ $B457 label=Dictionary_E4
  $B457,$01
  $B458,$01,c$01 Terminator.
N $B459 "#STR(#PC)".
@ $B459 label=Dictionary_E5
  $B459,$01
  $B45A,$01,c$01 Terminator.
N $B45B "#STR(#PC)".
@ $B45B label=Dictionary_E6
  $B45B,$01
  $B45C,$01,c$01 Terminator.
N $B45D "#STR(#PC)".
@ $B45D label=Dictionary_E7
  $B45D,$01
  $B45E,$01,c$01 Terminator.
N $B45F "#STR(#PC)".
@ $B45F label=Dictionary_E8
  $B45F,$01
  $B460,$01,c$01 Terminator.
N $B461 "#STR(#PC)".
@ $B461 label=Dictionary_E9
  $B461,$01
  $B462,$01,c$01 Terminator.
N $B463 "#STR(#PC)".
@ $B463 label=Dictionary_EA
  $B463,$01
  $B464,$01,c$01 Terminator.
N $B465 "#STR(#PC)".
@ $B465 label=Dictionary_EB
  $B465,$01
  $B466,$01,c$01 Terminator.
N $B467 "#STR(#PC)".
@ $B467 label=Dictionary_EC
  $B467,$01
  $B468,$01,c$01 Terminator.
N $B469 "#STR(#PC)".
@ $B469 label=Dictionary_ED
  $B469,$01
  $B46A,$01,c$01 Terminator.
N $B46B "#STR(#PC)".
@ $B46B label=Dictionary_EE
  $B46B,$01
  $B46C,$01,c$01 Terminator.
N $B46D "#STR(#PC)".
@ $B46D label=Dictionary_EF
  $B46D,$01
  $B46E,$01,c$01 Terminator.
N $B46F "#STR(#PC)".
@ $B46F label=Dictionary_F0
  $B46F,$01
  $B470,$01,c$01 Terminator.
N $B471 "#STR(#PC)".
@ $B471 label=Dictionary_F1
  $B471,$01
  $B472,$01,c$01 Terminator.
N $B473 "#STR(#PC)".
@ $B473 label=Dictionary_F2
  $B473,$01
  $B474,$01,c$01 Terminator.
N $B475 "#STR(#PC)".
@ $B475 label=Dictionary_F3
  $B475,$01
  $B476,$01,c$01 Terminator.
N $B477 "#STR(#PC)".
@ $B477 label=Dictionary_F4
  $B477,$01
  $B478,$01,c$01 Terminator.
N $B479 "#STR(#PC)".
@ $B479 label=Dictionary_F5
  $B479,$01
  $B47A,$01,c$01 Terminator.
N $B47B "#STR(#PC)".
@ $B47B label=Dictionary_F6
  $B47B,$01
  $B47C,$01,c$01 Terminator.
N $B47D "#STR(#PC)".
@ $B47D label=Dictionary_F7
  $B47D,$01
  $B47E,$01,c$01 Terminator.
N $B47F "#STR(#PC)".
@ $B47F label=Dictionary_F8
  $B47F,$01
  $B480,$01,c$01 Terminator.
N $B481 "#STR(#PC)".
@ $B481 label=Dictionary_F9
  $B481,$01
  $B482,$01,c$01 Terminator.
N $B483 "#STR(#PC)".
@ $B483 label=Dictionary_FA
  $B483,$01
  $B484,$01,c$01 Terminator.
N $B485 "#STR(#PC)".
@ $B485 label=Dictionary_FB
  $B485,$01
  $B486,$01,c$01 Terminator.
N $B487 "#STR(#PC)".
@ $B487 label=Dictionary_FC
  $B487,$01
  $B488,$01,c$01 Terminator.
N $B489 "#STR(#PC)".
@ $B489 label=Dictionary_FD
  $B489,$01
  $B48A,$01,c$01 Terminator.
N $B48B "#STR(#PC)".
@ $B48B label=Dictionary_FE
  $B48B,$01,c$01 Terminator.
N $B48C "#STR(#PC)".
@ $B48C label=Dictionary_FF
  $B48C,$01
  $B48D,$01,c$01 Terminator.

u $B48E
B $B48E,$1DE

u $B66C
B $B66C,$3C

b $B6A8 Initial Object Locations
@ $B6A8 label=InitialObjects
D $B6A8 Where each object starts, one byte per object: a room number, or #N$FC
. when the object is nowhere. #R$600F(#N$603B) copies these bytes to #R$5DCA at
. the start of a game. Room descriptions (#R$6187(#N$61EC)) look at objects
. #N$00 to #N($96), stopping at #R$5D8D, and the inventory (#R$680C) looks at
. all #N$A0 of them. Every object from #N$96 on starts nowhere.
N $B6A8 Object #N(#PC-$B6A8).
  $B6A8,$01 #NOWHERE(#PC).
L $B6A8,$01,$A0

b $B748 Initial Object Locations Padding
@ $B748 label=InitialObjects_Padding
D $B748 Seven more #N$FC bytes after the last of the #N$A0 objects at #R$B6A8.
. The copy at #R$600F(#N$603B) takes them to #R$5DCA too, but no object uses
. them. #R$6A68, which visits #N$FE slots, finds nothing carried here, and the
. script runner at #R$6074 only loads one when a counter test or a message
. number is #N$A0 or more, and those routines ignore the location. In practice
. the padding is unused.
  $B748,$07

t $B74F Assembler Source Leftovers
@ $B74F label=AssemblerSource_Leftovers
D $B74F Part of the game's assembler source that happened to be in memory when
. the data was saved. Each line is a two-byte line number, a length byte, the
. text and #N$0D. The copy at #R$600F(#N$603B) takes #N$0100 bytes from #R$B6A8,
. so it runs on through these bytes and into the first #N$10 bytes of #R$B798.
. None of these bytes is #N($FD), so #R$6A68, which visits #N$FE slots, never
. treats them as carried. It does treat slot #N$F4 as carried, because the #N$FD
. at #R$B79C lands there, so #R$6A68 also writes the current room to
. #R$5DCA(#N$5EBE), a slot no object uses, when dropping everything.
  $B74F,$0B The end of the line before, "...RD #REGa,(#REGde)".
  $B75A,$0B #HTML[Line 1090: <code>CP (#REGhl)</code>.]
  $B765,$0F #HTML(Line 1100: <code>JR Z,found</code>.)
  $B774,$0A #HTML(Line 1110: <code>INC #REGde</code>.)
  $B77E,$0A #HTML(Line 1120: <code>LD #REGa,#REGe</code>.)
  $B788,$0A #HTML(Line 1130: <code>CP mem</code>.)
  $B792,$06 #HTML(Line 1140, cut off after "<code>JR</code> ".)

b $B798 Per-Room Picture Records
@ $B798 label=RoomRecords
D $B798 One record per room, each ended by #N$FF. This first #N$FF is the record
. for room 0, the opening message, which has no picture. #R$6E43 counts the
. terminators to find a room, so the records run on past #R$BFF1 into RAM bank
. 0, where rooms #N$60 to #N$6B live at #R$C000 onwards. #R$696C walks the same
. table. Inside a record (see #R$6E53 and #R$6E7F), a byte below #N$EE is a
. shape number followed by its column and row. #N$F9 draws another room's
. record, #N$F8 names an object whose shape is drawn only while it is here,
. #N$FD changes one colour to another in the ink and paper, #N$FC paints a run
. of attributes, #N$FB brightens the picture, #N$FA draws a fixed vertical
. stroke, and #N$FE draws with the shift forced to #N$0C.
  $B798,$01

b $B799 Picture: A Snowy Pass Below A Window
@ $B799 label=Picture_SnowyPassBelowWindow
D $B799 Room #N$01 reuses the whole picture of room #N$50 (a rocky pass) at
. #R$BECB.
. Found by #R$6E43 and drawn by #R$6E53.
N $B799 #PICTURE($01)(a-snowy-pass-below-a-window,A Snowy Pass Below A Window)
  $B799,$03

b $B79C Picture: Lost In A Freezing Blizzard
@ $B79C label=Picture_FreezingBlizzard
D $B79C Room #N($02), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B79C #PICTURE($02)(lost-in-a-freezing-blizzard,Lost In A Freezing Blizzard)
  $B79C,$0C

b $B7A8 Picture: Hanging Onto A Cliff Beside A Window
@ $B7A8 label=Picture_CliffBesideWindow
D $B7A8 Room #N($03), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B7A8 #PICTURE($03)(hanging-onto-a-cliff-beside-a-window,Hanging Onto A Cliff Beside A Window)
  $B7A8,$2C

b $B7D4 Picture: A Small Rock Gallery
@ $B7D4 label=Picture_SmallRockGallery
D $B7D4 Room #N$04 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B7D4 #PICTURE($04)(a-small-rock-gallery,A Small Rock Gallery)
  $B7D4,$14

b $B7E8 Picture: A Very Dim Shadowy Room
@ $B7E8 label=Picture_DimShadowyRoom
D $B7E8 Room #N($05), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B7E8 #PICTURE($05)(a-very-dim-shadowy-room,A Very Dim Shadowy Room)
  $B7E8,$1A

b $B802 Empty Picture Record
@ $B802 label=Picture_EmptyAfterShadowyRoom
D $B802 Room #N$06 ("empty") has no picture; its record is just the #N$FF
. terminator.
. Found by #R$6E43 and drawn by #R$6E53.
  $B802,$01

b $B803 Picture: A Wide Dark Passage
@ $B803 label=Picture_WideDarkPassage
D $B803 Room #N($07), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B803 #PICTURE($07)(a-wide-dark-passage,A Wide Dark Passage)
  $B803,$31

b $B834 Picture: A Long Dark Passage
@ $B834 label=Picture_LongDarkPassage
D $B834 Room #N($08), drawn entirely from its own shapes. Object #N$02 ("And it
. has been moved to reveal a hole leading down") adds a shape only while it is
. in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $B834 #PICTURE($08)(a-long-dark-passage,A Long Dark Passage)
  $B834,$21

b $B855 Empty Picture Record
@ $B855 label=Picture_EmptyAfterLongDarkPassage
D $B855 Room #N$09 ("empty") has no picture; its record is just the #N$FF
. terminator.
. Found by #R$6E43 and drawn by #R$6E53.
  $B855,$01

b $B856 Picture: A Passage Hidden Beneath A Large Statue
@ $B856 label=Picture_PassageBeneathStatue
D $B856 Room #N($0A), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B856 #PICTURE($0A)(a-passage-hidden-beneath-a-large-statue,A Passage Hidden Beneath A Large Statue)
  $B856,$31

b $B887 Picture: A Desecrated Temple
@ $B887 label=Picture_DesecratedTemple
D $B887 Room #N($0B), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B887 #PICTURE($0B)(a-desecrated-temple,A Desecrated Temple)
  $B887,$0C

b $B893 Picture: A Small Room (Above The Landing)
@ $B893 label=Picture_SmallRoomAboveLanding
D $B893 Room #N$0C starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B893 #PICTURE($0C)(a-small-room-above-the-landing,A Small Room (Above The Landing))
  $B893,$11

b $B8A4 Picture: A Corridor With A Room To The North
@ $B8A4 label=Picture_CorridorWithRoomNorth
D $B8A4 Room #N($0D), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B8A4 #PICTURE($0D)(a-corridor-with-a-room-to-the-north,A Corridor With A Room To The North)
  $B8A4,$36

b $B8DA Picture: A Small Room (North Of The Corridor)
@ $B8DA label=Picture_SmallRoomNorthOfCorridor
D $B8DA Room #N$0E starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B8DA #PICTURE($0E)(a-small-room-north-of-the-corridor,A Small Room (North Of The Corridor))
  $B8DA,$19

b $B8F3 Picture: A Huge Pillared Mystical Hall
@ $B8F3 label=Picture_PillaredMysticalHall
D $B8F3 Room #N($0F), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B8F3 #PICTURE($0F)(a-huge-pillared-mystical-hall,A Huge Pillared Mystical Hall)
  $B8F3,$14

b $B907 Picture: A Landing Above A Hall Of Zombie Guards
@ $B907 label=Picture_LandingAboveZombieGuards
D $B907 Room #N$10 starts from the picture of room #N$0C (a small room, above
. the landing) at #R$B893, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B907 #PICTURE($10)(a-landing-above-a-hall-of-zombie-guards,A Landing Above A Hall Of Zombie Guards)
  $B907,$06

b $B90D Picture: A Shattered Ruined Hall
@ $B90D label=Picture_ShatteredRuinedHall
D $B90D Room #N($11), drawn entirely from its own shapes. Object #N$05 ("But it
. has been bridged with a stone pillar") adds a shape only while it is in this
. room. Object #N$4C ("Sixty foot pillar") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $B90D #PICTURE($11)(a-shattered-ruined-hall,A Shattered Ruined Hall)
  $B90D,$3D

b $B94A Picture: A Low Narrow Corridor
@ $B94A label=Picture_LowNarrowCorridor
D $B94A Room #N$12 starts from the picture of room #N$08 (a long dark passage)
. at #R$B834, then adds its own shapes. Object #N$02 ("And it has been moved to
. reveal a hole leading down") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $B94A #PICTURE($12)(a-low-narrow-corridor,A Low Narrow Corridor)
  $B94A,$12

b $B95C Picture: A Large Rest Chamber
@ $B95C label=Picture_LargeRestChamber
D $B95C Room #N$13 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B95C #PICTURE($13)(a-large-rest-chamber,A Large Rest Chamber)
  $B95C,$12

b $B96E Picture: A Smelly Earthen Cave
@ $B96E label=Picture_SmellyEarthenCave
D $B96E Room #N($14), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B96E #PICTURE($14)(a-smelly-earthen-cave,A Smelly Earthen Cave)
  $B96E,$2E

b $B99C Picture: A Shadowy Corridor
@ $B99C label=Picture_ShadowyCorridor
D $B99C Room #N$15 starts from the picture of room #N$12 (a low narrow corridor)
. at #R$B94A, then adds its own shapes. Object #N$02 ("And it has been moved to
. reveal a hole leading down") adds a shape only while it is in this room.
. Object #N$0B ("An open door leads south into a room") adds a shape only while
. it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $B99C #PICTURE($15)(a-shadowy-corridor,A Shadowy Corridor)
  $B99C,$27

b $B9C3 Picture: A Cave
@ $B9C3 label=Picture_Cave
D $B9C3 Room #N($16), drawn entirely from its own shapes. Object #N$4F
. ("Vampire") adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $B9C3 #PICTURE($16)(a-cave,A Cave)
  $B9C3,$0D

b $B9D0 Picture: A Work Room
@ $B9D0 label=Picture_WorkRoom
D $B9D0 Room #N$17 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$1D ("Open") adds a shape
. only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $B9D0 #PICTURE($17)(a-work-room,A Work Room)
  $B9D0,$16

b $B9E6 Picture: A Low Dark Passage Covered In Mould
@ $B9E6 label=Picture_MouldyLowPassage
D $B9E6 Room #N($18), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B9E6 #PICTURE($18)(a-low-dark-passage-covered-in-mould,A Low Dark Passage Covered In Mould)
  $B9E6,$0E

b $B9F4 Picture: A Sinister Torture Chamber
@ $B9F4 label=Picture_TortureChamber
D $B9F4 Room #N$19 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $B9F4 #PICTURE($19)(a-sinister-torture-chamber,A Sinister Torture Chamber)
  $B9F4,$0E

b $BA02 Picture: A Dank And Dripping Dungeon
@ $BA02 label=Picture_DankDrippingDungeon
D $BA02 Room #N($1A), drawn entirely from its own shapes. Object #N$0C ("You can
. go east through a broken down door") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BA02 #PICTURE($1A)(a-dank-and-dripping-dungeon,A Dank And Dripping Dungeon)
  $BA02,$30

b $BA32 Picture: The Hanging Room
@ $BA32 label=Picture_HangingRoom
D $BA32 Room #N$1B starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$0E ("A wizard is hung
. from a rope here") adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BA32 #PICTURE($1B)(the-hanging-room,The Hanging Room)
  $BA32,$0B

b $BA3D Picture: A Stinking Damp Cell
@ $BA3D label=Picture_StinkingDampCell
D $BA3D Room #N($1C), drawn entirely from its own shapes. Object #N$0F ("A metal
. ring for tying prisoners to is set into the wall") adds a shape only while it
. is in this room. Object #N$10 ("A secret passage exits through one wall") adds
. a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BA3D #PICTURE($1C)(a-stinking-damp-cell,A Stinking Damp Cell)
  $BA3D,$41

b $BA7E Picture: The Robing Room
@ $BA7E label=Picture_RobingRoom
D $BA7E Room #N$1D starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BA7E #PICTURE($1D)(the-robing-room,The Robing Room)
  $BA7E,$0F

b $BA8D Picture: A Sinister Foreboding Crypt
@ $BA8D label=Picture_ForebodingCrypt
D $BA8D Room #N($1E), drawn entirely from its own shapes. Object #N$56 ("Ghoul")
. adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BA8D #PICTURE($1E)(a-sinister-foreboding-crypt,A #FACT(sinsister,Sinister) Foreboding Crypt)
  $BA8D,$24

b $BAB1 Picture: A Small Entry Chamber
@ $BAB1 label=Picture_SmallEntryChamber
D $BAB1 Room #N($1F), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BAB1 #PICTURE($1F)(a-small-entry-chamber,A Small Entry Chamber)
  $BAB1,$08

b $BAB9 Picture: The Library
@ $BAB9 label=Picture_Library
D $BAB9 Room #N$20 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BAB9 #PICTURE($20)(the-library,The Library)
  $BAB9,$22

b $BADB Picture: A Large Water Cave With A Well
@ $BADB label=Picture_WaterCave
D $BADB Room #N$21 starts from the picture of room #N$16 (a cave) at #R$B9C3,
. then adds its own shapes. Object #N$4F ("Vampire") adds a shape only while it
. is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BADB #PICTURE($21)(a-large-water-cave-with-a-well,A Large Water Cave With A Well)
  $BADB,$06

b $BAE1 Picture: Down A Small Dried Up Well
@ $BAE1 label=Picture_DriedUpWell
D $BAE1 Room #N($22), drawn entirely from its own shapes. Object #N$10 ("A
. secret passage exits through one wall") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BAE1 #PICTURE($22)(down-a-small-dried-up-well,Down A Small Dried Up Well)
  $BAE1,$1F

b $BB00 Picture: A Massive Hall Decorated With Shields
@ $BB00 label=Picture_HallOfShields
D $BB00 Room #N($23), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BB00 #PICTURE($23)(a-massive-hall-decorated-with-shields,A Massive Hall Decorated With Shields)
  $BB00,$2E

b $BB2E Picture: A Huge Cavern Above A Stream Of Lava
@ $BB2E label=Picture_CavernAboveLava
D $BB2E Room #N$24 starts from the picture of room #N$27 (the path right beside
. the lava) at #R$BB7C, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BB2E #PICTURE($24)(a-huge-cavern-above-a-stream-of-lava,A Huge Cavern Above A Stream Of Lava)
  $BB2E,$19

b $BB47 Picture: A Musty Secret Chamber
@ $BB47 label=Picture_MustySecretChamber
D $BB47 Room #N($25), drawn entirely from its own shapes. Object #N$17
. ("Suspended in the centre of the room, protected by a forcefield is a magical
. rod") adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BB47 #PICTURE($25)(a-musty-secret-chamber,A Musty Secret Chamber)
  $BB47,$2A

b $BB71 Picture: An Inscribed Rune Covered Chamber
@ $BB71 label=Picture_RuneCoveredChamber
D $BB71 Room #N($26), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BB71 #PICTURE($26)(an-inscribed-rune-covered-chamber,An Inscribed Rune Covered Chamber)
  $BB71,$0B

b $BB7C Picture: The Path Right Beside The Lava
@ $BB7C label=Picture_PathBesideLava
D $BB7C Room #N($27), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BB7C #PICTURE($27)(the-path-right-beside-the-lava,The Path Right Beside The Lava)
  $BB7C,$33

b $BBAF Picture: The End Of The Path
@ $BBAF label=Picture_EndOfPath
D $BBAF Room #N$28 starts from the picture of room #N$22 (down a small dried up
. well) at #R$BAE1, then adds its own shapes. Object #N$10 ("A secret passage
. exits through one wall") adds a shape only while it is in this room. Object
. #N$12 ("A sword is set deep into the stone") adds a shape only while it is in
. this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BBAF #PICTURE($28)(the-end-of-the-path,The End Of The Path)
  $BBAF,$21

b $BBD0 Picture: A Ledge In A Huge Fissure
@ $BBD0 label=Picture_LedgeInFissure
D $BBD0 Room #N($29), drawn entirely from its own shapes. Object #N$23 ("Rope
. spans the fissure") adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BBD0 #PICTURE($29)(a-ledge-in-a-huge-fissure,A Ledge In A Huge Fissure)
  $BBD0,$0D

b $BBDD Picture: The Bottom Of A Deep Fissure
@ $BBDD label=Picture_BottomOfFissure
D $BBDD Room #N($2A), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BBDD #PICTURE($2A)(the-bottom-of-a-deep-fissure,The Bottom Of A Deep Fissure)
  $BBDD,$0C

b $BBE9 Picture: A Narrow Crack
@ $BBE9 label=Picture_NarrowCrack
D $BBE9 Room #N$2B starts from the picture of room #N$22 (down a small dried up
. well) at #R$BAE1, then adds its own shapes. Object #N$10 ("A secret passage
. exits through one wall") adds a shape only while it is in this room. Object
. #N$13 ("A boulder blocks the way east") adds a shape only while it is in this
. room. Object #N$14 ("A narrow hole leads into a passage") adds a shape only
. while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BBE9 #PICTURE($2B)(a-narrow-crack,A Narrow Crack)
  $BBE9,$10

b $BBF9 Picture: A Gallery Above A Guardroom
@ $BBF9 label=Picture_GalleryAboveGuardroom
D $BBF9 Room #N($2C), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BBF9 #PICTURE($2C)(a-gallery-above-a-guardroom,A Gallery Above A Guardroom)
  $BBF9,$28

b $BC21 Picture: A Guardroom Beside The Zombie Warriors
@ $BC21 label=Picture_GuardroomBesideZombieWarriors
D $BC21 Room #N($2D), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BC21 #PICTURE($2D)(a-guardroom-beside-the-zombie-warriors,A Guardroom Beside The Zombie Warriors)
  $BC21,$30

b $BC51 Picture: A Guardroom With Stairs Up
@ $BC51 label=Picture_GuardroomWithStairs
D $BC51 Room #N$2E is the picture of room #N$10 (a landing above a hall of
. zombie guards) at #R$B907, with its colours changed.
. Found by #R$6E43 and drawn by #R$6E53.
N $BC51 #PICTURE($2E)(a-guardroom-with-stairs-up,A Guardroom With Stairs Up)
  $BC51,$09

b $BC5A Picture: A Wide Passageway
@ $BC5A label=Picture_WidePassageway
D $BC5A Room #N$2F starts from the picture of room #N$18 (a low dark passage
. covered in mould) at #R$B9E6, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BC5A #PICTURE($2F)(a-wide-passageway,A Wide Passageway)
  $BC5A,$06

b $BC60 Picture: A Fissure On A Narrow Ledge
@ $BC60 label=Picture_NarrowLedgeInFissure
D $BC60 Room #N($30), drawn entirely from its own shapes. Object #N$20 ("Rope
. spans the fissure") adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BC60 #PICTURE($30)(a-fissure-on-a-narrow-ledge,A Fissure On A Narrow Ledge)
  $BC60,$0C

b $BC6C Picture: A Huge Cavern At The West End
@ $BC6C label=Picture_HugeCavernWestEnd
D $BC6C Room #N($31), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BC6C #PICTURE($31)(a-huge-cavern-at-the-west-end,A Huge Cavern At The West End)
  $BC6C,$11

b $BC7D Picture: A Large Cave With A Huge Deep Channel
@ $BC7D label=Picture_LargeCaveWithChannel
D $BC7D Room #N($32), drawn entirely from its own shapes. Object #N$29 ("Which
. has a drawbridge in the up position in front of it") adds a shape only while
. it is in this room. Object #N$27 ("Crossed by a metal drawbridge") adds a
. shape only while it is in this room. Object #N$26 ("Bridged by a plank") adds
. a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BC7D #PICTURE($32)(a-large-cave-with-a-huge-deep-channel,A Large Cave With A Huge Deep Channel)
  $BC7D,$38

b $BCB5 Picture: A Large Cave At The East End
@ $BCB5 label=Picture_LargeCaveEastEnd
D $BCB5 Room #N$33 is the picture of room #N$31 (a huge cavern at the west end)
. at #R$BC6C, mirrored left to right.
. Found by #R$6E43 and drawn by #R$6E53.
N $BCB5 #PICTURE($33)(a-large-cave-at-the-east-end,A Large Cave At The East End)
  $BCB5,$04

b $BCB9 Picture: The Hall Of Fire
@ $BCB9 label=Picture_HallOfFire
D $BCB9 Room #N($34), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BCB9 #PICTURE($34)(the-hall-of-fire,The Hall Of Fire)
  $BCB9,$0C

b $BCC5 Picture: A Narrow Canyon Beside A Stream
@ $BCC5 label=Picture_NarrowCanyon
D $BCC5 Room #N($35), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BCC5 #PICTURE($35)(a-narrow-canyon-beside-a-stream,A Narrow Canyon Beside A Stream)
  $BCC5,$20

b $BCE5 Picture: The Canyon On The East Bank Of The Stream
@ $BCE5 label=Picture_EastBankOfStream
D $BCE5 Room #N$36 starts from the picture of room #N$35 (a narrow canyon beside
. a stream) at #R$BCC5, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BCE5 #PICTURE($36)(the-canyon-on-the-east-bank-of-the-stream,The Canyon On The East Bank Of The Stream)
  $BCE5,$12

b $BCF7 Picture: A Ledge High Over A Pool Of Lava
@ $BCF7 label=Picture_LedgeOverLava
D $BCF7 Room #N($37), drawn entirely from its own shapes. Object #N$34 ("A
. crystal bridge spans the pit of lava") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BCF7 #PICTURE($37)(a-ledge-high-over-a-pool-of-lava,A Ledge High Over A Pool Of Lava)
  $BCF7,$32

b $BD29 Picture: A Wet Dripping Cave
@ $BD29 label=Picture_WetDrippingCave
D $BD29 Room #N($38), drawn entirely from its own shapes. Object #N$2D
. ("Tentacles of slime are reaching out towards me from a pit of oily slime")
. adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD29 #PICTURE($38)(a-wet-dripping-cave,A Wet Dripping Cave)
  $BD29,$10

b $BD39 Picture: An Arched Entry Hall
@ $BD39 label=Picture_ArchedEntryHall
D $BD39 Room #N($39), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD39 #PICTURE($39)(an-arched-entry-hall,An Arched Entry Hall)
  $BD39,$0E

b $BD47 Picture: A Magnificent Pillared Throne Hall
@ $BD47 label=Picture_PillaredThroneHall
D $BD47 Room #N($3A), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD47 #PICTURE($3A)(a-magnificent-pillared-throne-hall,A Magnificent Pillared Throne Hall)
  $BD47,$09

b $BD50 Picture: A Small Room (Off The Entry Hall)
@ $BD50 label=Picture_SmallRoomOffEntryHall
D $BD50 Room #N$3B starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$36 ("Broken") adds a
. shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD50 #PICTURE($3B)(a-small-room-off-the-entry-hall,A Small Room (Off The Entry Hall))
  $BD50,$17

b $BD67 Picture: A Treasure Room
@ $BD67 label=Picture_TreasureRoom
D $BD67 Room #N$3C is the picture of room #N$0A (a passage hidden beneath a
. large statue) at #R$B856, with its colours changed.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD67 #PICTURE($3C)(a-treasure-room,A Treasure Room)
  $BD67,$06

b $BD6D Picture: A Low Passage With A Danger Sign
@ $BD6D label=Picture_LowPassageWithSign
D $BD6D Room #N$3D is the picture of room #N$18 (a low dark passage covered in
. mould) at #R$B9E6, with its colours changed.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD6D #PICTURE($3D)(a-low-passage-with-a-danger-sign,A Low Passage With A Danger Sign)
  $BD6D,$06

b $BD73 Picture: A Huge Glittering Cave
@ $BD73 label=Picture_GlitteringCave
D $BD73 Room #N($3E), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD73 #PICTURE($3E)(a-huge-glittering-cave,A Huge Glittering Cave)
  $BD73,$0B

b $BD7E Picture: A Slime Pit
@ $BD7E label=Picture_SlimePit
D $BD7E Room #N($3F), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD7E #PICTURE($3F)(a-slime-pit,A Slime Pit)
  $BD7E,$14

b $BD92 Empty Picture Record
@ $BD92 label=Picture_CeasedToExist
D $BD92 Room #N$40 ("you have ceased to exist") has no picture; its record is
. just the #N$FF terminator.
. Found by #R$6E43 and drawn by #R$6E53.
  $BD92,$01

b $BD93 Picture: The Far Side Of The Lava Pit
@ $BD93 label=Picture_FarSideOfLavaPit
D $BD93 Room #N($41), drawn entirely from its own shapes. Object #N$35 ("A
. crystal bridge spans the pit of lava") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BD93 #PICTURE($41)(the-far-side-of-the-lava-pit,The Far Side Of The Lava Pit)
  $BD93,$32

b $BDC5 Picture: A Sinister Evil Temple
@ $BDC5 label=Picture_EvilTemple
D $BDC5 Room #N($42), drawn entirely from its own shapes. Object #N$78 ("The
. evil wizard") adds a shape only while it is in this room. Object #N$41 ("A
. lightning bolt is arcing towards you") adds a shape only while it is in this
. room. Object #N$39 ("A ball of flame is streaking towards me") adds a shape
. only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BDC5 #PICTURE($42)(a-sinister-evil-temple,A Sinister Evil Temple)
  $BDC5,$18

b $BDDD Picture: A Workroom (Beside The Evil Temple)
@ $BDDD label=Picture_WorkroomBesideEvilTemple
D $BDDD Room #N$43 is the picture of room #N$05 (a very dim shadowy room) at
. #R$B7E8, with its colours changed.
. Found by #R$6E43 and drawn by #R$6E53.
N $BDDD #PICTURE($43)(a-workroom-beside-the-evil-temple,A Workroom (Beside The Evil Temple))
  $BDDD,$06

b $BDE3 Picture: A Snowstorm Outside The Barred Sorcerors Gate
@ $BDE3 label=Picture_OutsideSorcerorsGate
D $BDE3 Room #N($44), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BDE3 #PICTURE($44)(a-snowstorm-outside-the-barred-sorcerors-gate,A Snowstorm Outside The Barred Sorcerors Gate)
  $BDE3,$54

b $BE37 Picture: A Snowstorm Beside A Crevasse
@ $BE37 label=Picture_SnowstormBesideCrevasse
D $BE37 Room #N$45 draws its own shapes and, part way through, the picture of
. room #N$02 (lost in a freezing blizzard) at #R$B79C.
. Found by #R$6E43 and drawn by #R$6E53.
N $BE37 #PICTURE($45)(a-snowstorm-beside-a-crevasse,A Snowstorm Beside A Crevasse)
  $BE37,$2B

b $BE62 Picture: The Crevasse
@ $BE62 label=Picture_Crevasse
D $BE62 Room #N($46), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BE62 #PICTURE($46)(the-crevasse,The Crevasse)
  $BE62,$18

b $BE7A Picture: The Temple Of The Elements
@ $BE7A label=Picture_TempleOfTheElements
D $BE7A Room #N($47), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BE7A #PICTURE($47)(the-temple-of-the-elements,The Temple Of The Elements)
  $BE7A,$0F

b $BE89 Empty Picture Record
@ $BE89 label=Picture_EmptyAfterTempleOfElements
D $BE89 Room #N$48 ("empty") has no picture; its record is just the #N$FF
. terminator.
. Found by #R$6E43 and drawn by #R$6E53.
  $BE89,$01

b $BE8A Picture: A Glittering Ice Cave
@ $BE8A label=Picture_GlitteringIceCave
D $BE8A Room #N($49), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BE8A #PICTURE($49)(a-glittering-ice-cave,A Glittering Ice Cave)
  $BE8A,$06

b $BE90 Picture: A Snowy Pass With A Cavemouth
@ $BE90 label=Picture_SnowyPassAtCavemouth
D $BE90 Room #N$4A starts from the picture of room #N$50 (a rocky pass) at
. #R$BECB, then adds its own shapes. Object #N$82 ("Yeti") adds a shape only
. while it is in this room. Object #N$3F ("Huge piles of snow cover the floor of
. the pass") adds a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BE90 #PICTURE($4A)(a-snowy-pass-with-a-cavemouth,A Snowy Pass With A Cavemouth)
  $BE90,$10

b $BEA0 Picture: A Snowy Pass (South Of The Cavemouth)
@ $BEA0 label=Picture_SnowyPassSouthOfCavemouth
D $BEA0 Room #N$4B is the picture of room #N$50 (a rocky pass) at #R$BECB,
. mirrored left to right.
. Found by #R$6E43 and drawn by #R$6E53.
N $BEA0 #PICTURE($4B)(a-snowy-pass-south-of-the-cavemouth,A Snowy Pass (South Of The Cavemouth))
  $BEA0,$04

b $BEA4 Picture: An Icy Pass
@ $BEA4 label=Picture_IcyPass
D $BEA4 Room #N$4C reuses the whole picture of room #N$50 (a rocky pass) at
. #R$BECB.
. Found by #R$6E43 and drawn by #R$6E53.
N $BEA4 #PICTURE($4C)(an-icy-pass,An Icy Pass)
  $BEA4,$03

b $BEA7 Picture: A Path Up The Mountainside To A Temple
@ $BEA7 label=Picture_MountainsidePath
D $BEA7 Room #N$4D is the picture of room #N$50 (a rocky pass) at #R$BECB,
. mirrored left to right and with its left half then reflected onto the
. right.
. Found by #R$6E43 and drawn by #R$6E53.
N $BEA7 #PICTURE($4D)(a-path-up-the-mountainside-to-a-temple,A Path Up The Mountainside To A Temple)
  $BEA7,$05

b $BEAC Picture: The Ruins Of A Temple
@ $BEAC label=Picture_RuinsOfTemple
D $BEAC Room #N$4E starts from the picture of room #N$02 (lost in a freezing
. blizzard) at #R$B79C, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BEAC #PICTURE($4E)(the-ruins-of-a-temple,The Ruins Of A Temple)
  $BEAC,$0C

b $BEB8 Picture: A Snowy Pass (North Of The Rocky Pass)
@ $BEB8 label=Picture_SnowyPassNorthOfRockyPass
D $BEB8 Room #N$4F starts from the picture of room #N$50 (a rocky pass) at
. #R$BECB, then adds its own shapes. Object #N$86 ("Several border guards") adds
. a shape only while it is in this room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BEB8 #PICTURE($4F)(a-snowy-pass-north-of-the-rocky-pass,A Snowy Pass (North Of The Rocky Pass))
  $BEB8,$13

b $BECB Picture: A Rocky Pass
@ $BECB label=Picture_RockyPass
D $BECB Room #N($50), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BECB #PICTURE($50)(a-rocky-pass,A Rocky Pass)
  $BECB,$52

b $BF1D Picture: A Green And Fair Valley
@ $BF1D label=Picture_GreenAndFairValley
D $BF1D Room #N($51), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF1D #PICTURE($51)(a-green-and-fair-valley,A Green And Fair Valley)
  $BF1D,$08

b $BF25 Picture: A Humpbacked Bridge Over A Stream
@ $BF25 label=Picture_HumpbackedBridge
D $BF25 Room #N$52 starts from the picture of room #N$58 (a field beside a
. stream) at #R$BF96, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF25 #PICTURE($52)(a-humpbacked-bridge-over-a-stream,A Humpbacked Bridge Over A Stream)
  $BF25,$09

b $BF2E Picture: A Square Of Grass In The Centre Of A Village
@ $BF2E label=Picture_VillageGreen
D $BF2E Room #N$53 reuses the whole picture of room #N$55 (your cottage) at
. #R$BF51.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF2E #PICTURE($53)(a-square-of-grass-in-the-centre-of-a-village,A Square Of Grass In The Centre Of A Village)
  $BF2E,$03

b $BF31 Picture: A Wooden Church
@ $BF31 label=Picture_WoodenChurch
D $BF31 Room #N($54), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF31 #PICTURE($54)(a-wooden-church,A Wooden Church)
  $BF31,$20

b $BF51 Picture: Your Cottage
@ $BF51 label=Picture_Cottage
D $BF51 Room #N($55), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF51 #PICTURE($55)(your-cottage,Your Cottage)
  $BF51,$18

b $BF69 Picture: A Green Wood
@ $BF69 label=Picture_GreenWood
D $BF69 Room #N($56), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF69 #PICTURE($56)(a-green-wood,A Green Wood)
  $BF69,$07

b $BF70 Picture: A Secluded Clearing Beside A Waterfall
@ $BF70 label=Picture_ClearingByWaterfall
D $BF70 Room #N($57), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF70 #PICTURE($57)(a-secluded-clearing-beside-a-waterfall,A Secluded Clearing Beside A Waterfall)
  $BF70,$26

b $BF96 Picture: A Field Beside A Stream
@ $BF96 label=Picture_FieldBesideStream
D $BF96 Room #N($58), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BF96 #PICTURE($58)(a-field-beside-a-stream,A Field Beside A Stream)
  $BF96,$27

b $BFBD Picture: The Woods Beside A Stream
@ $BFBD label=Picture_WoodsBesideStream
D $BFBD Room #N$59 reuses the whole picture of room #N$5A (the woods) at
. #R$BFC0.
. Found by #R$6E43 and drawn by #R$6E53.
N $BFBD #PICTURE($59)(the-woods-beside-a-stream,The Woods Beside A Stream)
  $BFBD,$03

b $BFC0 Picture: The Woods
@ $BFC0 label=Picture_Woods
D $BFC0 Room #N($5A), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BFC0 #PICTURE($5A)(the-woods,The Woods)
  $BFC0,$05

b $BFC5 Picture: A Shady Clearing Deep In The Woods
@ $BFC5 label=Picture_ShadyClearing
D $BFC5 Room #N$5B is the picture of room #N$5A (the woods) at #R$BFC0, mirrored
. left to right.
. Found by #R$6E43 and drawn by #R$6E53.
N $BFC5 #PICTURE($5B)(a-shady-clearing-deep-in-the-woods,A Shady Clearing Deep In The Woods)
  $BFC5,$04

b $BFC9 Picture: A Clearing Beside A Crystal Clear Pool
@ $BFC9 label=Picture_ClearingByPool
D $BFC9 Room #N$5C starts from the picture of room #N$58 (a field beside a
. stream) at #R$BF96, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BFC9 #PICTURE($5C)(a-clearing-beside-a-crystal-clear-pool,A Clearing Beside A Crystal Clear Pool)
  $BFC9,$0B

b $BFD4 Picture: A Glittering Hall Made Entirely Of Ice
@ $BFD4 label=Picture_HallOfIce
D $BFD4 Room #N($5D), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BFD4 #PICTURE($5D)(a-glittering-hall-made-entirely-of-ice,A Glittering Hall Made Entirely Of Ice)
  $BFD4,$09

b $BFDD Picture: The Magicians Research Room
@ $BFDD label=Picture_ResearchRoomOfIce
D $BFDD Room #N$5E starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$45 ("There is a hole in
. the roof, through which light streams") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $BFDD #PICTURE($5E)(the-magicians-research-room,The Magicians Research Room)
  $BFDD,$14

b $BFF1 Picture: A Huge Hall At The Centre Of The Ice Palace
@ $BFF1 label=Picture_IcePalaceHall
D $BFF1 Room #N($5F), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $BFF1 #PICTURE($5F)(a-huge-hall-at-the-centre-of-the-ice-palace,A Huge Hall At The Centre Of The Ice Palace)
  $BFF1,$0F

b $C000 Picture: An Icy Throne Hall
@ $C000 label=Picture_IcyThroneHall
@ $C000 refs=:$66C7
D $C000 Room #N($60), drawn entirely from its own shapes. From here on the
. records are in RAM bank 0, the bank #R$66C7(#N$66CF) pages back in at #N$C000
. after each command, so the picture code reads them directly.
. Found by #R$6E43 and drawn by #R$6E53.
N $C000 #PICTURE($60)(an-icy-throne-hall,An Icy Throne Hall)
  $C000,$2E

b $C02E Picture: The Royal Bedroom
@ $C02E label=Picture_RoyalBedroom
D $C02E Room #N$61 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes. Object #N$32 ("Open, revealing
. what is in fact a room beyond") adds a shape only while it is in this
. room.
. Found by #R$6E43 and drawn by #R$6E53.
N $C02E #PICTURE($61)(the-royal-bedroom,The Royal Bedroom)
  $C02E,$0E

b $C03C Picture: A Secret Room
@ $C03C label=Picture_SecretRoom
D $C03C Room #N$62 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $C03C #PICTURE($62)(a-secret-room,A Secret Room)
  $C03C,$06

b $C042 Picture: The Priests Room
@ $C042 label=Picture_PriestsRoom
D $C042 Room #N$63 starts from the picture of room #N$05 (a very dim shadowy
. room) at #R$B7E8, then adds its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $C042 #PICTURE($63)(the-priests-room,The Priests Room)
  $C042,$0C

b $C04E Picture: A Maze Of Catacombs (Dead End)
@ $C04E label=Picture_CatacombsDeadEnd
D $C04E Room #N($64), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $C04E #PICTURE($64)(a-maze-of-catacombs-dead-end,A Maze Of Catacombs (Dead End))
  $C04E,$11

b $C05F Picture: A Maze Of Catacombs (South Of The Priests Room)
@ $C05F label=Picture_CatacombsSouthOfPriestsRoom
D $C05F Room #N($65), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $C05F #PICTURE($65)(a-maze-of-catacombs-south-of-the-priests-room,A Maze Of Catacombs (South Of The Priests Room))
  $C05F,$17

b $C076 Picture: A Maze Of Catacombs (Middle)
@ $C076 label=Picture_CatacombsMiddle
D $C076 Room #N$66 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F.
. Found by #R$6E43 and drawn by #R$6E53.
N $C076 #PICTURE($66)(a-maze-of-catacombs-middle,A Maze Of Catacombs (Middle))
  $C076,$03

b $C079 Picture: A Maze Of Catacombs (Twisting)
@ $C079 label=Picture_CatacombsTwisting
D $C079 Room #N$67 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F.
. Found by #R$6E43 and drawn by #R$6E53.
N $C079 #PICTURE($67)(a-maze-of-catacombs-twisting,A Maze Of Catacombs (Twisting))
  $C079,$03

b $C07C Picture: A Maze Of Catacombs (Loop)
@ $C07C label=Picture_CatacombsLoop
D $C07C Room #N$68 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F.
. Found by #R$6E43 and drawn by #R$6E53.
N $C07C #PICTURE($68)(a-maze-of-catacombs-loop,A Maze Of Catacombs (Loop))
  $C07C,$03

b $C07F Picture: A Maze Of Catacombs (By The Crypt)
@ $C07F label=Picture_CatacombsByCrypt
D $C07F Room #N$69 reuses the whole picture of room #N$65 (a maze of catacombs,
. south of the priests room) at #R$C05F.
. Found by #R$6E43 and drawn by #R$6E53.
N $C07F #PICTURE($69)(a-maze-of-catacombs-by-the-crypt,A Maze Of Catacombs (By The Crypt))
  $C07F,$03

b $C082 Picture: A Crypt Beneath The Temple
@ $C082 label=Picture_CryptBeneathTemple
D $C082 Room #N($6A), drawn entirely from its own shapes.
. Found by #R$6E43 and drawn by #R$6E53.
N $C082 #PICTURE($6A)(a-crypt-beneath-the-temple,A Crypt Beneath The Temple)
  $C082,$11

b $C093 Empty Picture Record
@ $C093 label=Picture_EmptyAfterCryptBeneathTemple
D $C093 Room #N$6B ("empty") has no picture; its record is just the #N$FF
. terminator.
. Found by #R$6E43 and drawn by #R$6E53.
  $C093,$01

b $C094 End Of Picture Records
@ $C094 label=RoomRecordsEnd
D $C094 One more #N$FF after the record for room #N$6B closes the table. The
. zero bytes after it are not part of any picture.
  $C094,$01

u $C095
B $C095,$2BB

b $C350 Picture Tiles And Shapes
@ $C350 label=PictureTilesAndShapes
D $C350 What the picture records draw with. #R$6FC9 turns a tile number into
. eight bytes counted from #N(#PC), so tile 0 here is blank, and #R$718B finds a
. shape by counting #N$FE terminators from #R$C350(#N$C708).
  $C350,$36A8

u $F9F8
B $F9F8,$520

b $FF18 BASIC Residue
@ $FF18 label=BasicResidue
D $FF18 Leftover 128 BASIC machine stack and a truncated copy of the default
. UDGs. The glyph plotter uses the ROM font, not this copy. Bank 7 keeps the
. intact stack at #R$FF18@bank7 and the UDGs at #R$FF58@bank7.
  $FF18,$C4

c $FFDC Start Game
@ $FFDC label=StartGame
D $FFDC The last loader block. It loads #N$0100 bytes over the command buffer
. and falls into the game. The snapshot is paused on the call into #R$5ECB.
N $FFDC The #N$0100 bytes are a headerless block, flagged by the carry.
  $FFDC,$04 Point #REGix at #R$5B00.
  $FFE0,$03 #N$0100 bytes.
  $FFE3,$03 A headerless block.
  $FFE6,$03 Call #SKOOLKID$0556(LD_BYTES).
N $FFE9 Enter the game.
@ $FFE9 label=GameEntry
  $FFE9,$03 Call #R$5ECB.

b $FFEC Bytes After Entry
@ $FFEC label=AfterEntry
D $FFEC Not executed. The call into the game loop does not return here.
  $FFEC,$14
