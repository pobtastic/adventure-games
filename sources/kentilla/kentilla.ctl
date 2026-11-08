; Copyright Micromega 1984, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction.

> $4000 @start
> $4000 @org=$4000
> $4000 @rom
> $4000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 This disassembly covers Kentilla (Micromega, 1984), using the
. archived Micromega-release tape image labelled ‘Corrected by Mikie’. All of
. its tape data blocks match TOSEC’s Micromega image byte for byte.
D $4000 #UDGTABLE
. { =h Kentilla Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

g $5B00 Print Left Margin Column
@ $5B00 label=PrintLeftMarginColumn
D $5B00 Remembers the left-margin column for #R$EEF1 newline
. (#N$1D) and sub-message (#N$1F) handling.
  $5B00,$01 Column.

i $5B01

g $5BA0 Parser State
@ $5BA0 label=ParserState
D $5BA0 Working bytes for vocabulary lookup and token walks:
D $5BA0 #TABLE(default,centre,centre)
. { =h Offset | =h Holds }
. { #R$5BA0 | BASIC/list pointer (#R$EE60) }
. { #R$5BA2 | Work-buffer pointer (#R$EEB9) }
. { #R$5BA4 | Minimum match length }
. { #R$5BA5 | Vocabulary word index }
. { #N$5BA6 | Unused }
. { #R$5BA7 | Current token start (#R$5BAE) }
. { #R$5BA9 | Next token start (#R$5BAE) }
. { #R$5BAB | First character of token }
. { #R$5BAC | Token delimiter }
. { #R$5BAD | BASIC-list entry count }
. TABLE#
  $5BA0,$02 BASIC/list pointer.
@ $5BA2 label=ParserState_WorkPointer
  $5BA2,$02 Work-buffer pointer.
@ $5BA4 label=ParserState_MatchLength
  $5BA4,$01 Minimum match length.
@ $5BA5 label=ParserState_WordIndex
  $5BA5,$01 Word index.
  $5BA6,$01 Unused.
@ $5BA7 label=InputBuffer_TokenStart
  $5BA7,$02 Current token start.
@ $5BA9 label=InputBuffer_NextToken
  $5BA9,$02 Next token start.
@ $5BAB label=ParserState_TokenChar
  $5BAB,$01 Token first character.
@ $5BAC label=ParserState_TokenDelimiter
  $5BAC,$01 Token delimiter.
@ $5BAD label=ParserState_EntryCount
  $5BAD,$01 BASIC-list entry count.

g $5BAE Input Buffer
@ $5BAE label=InputBuffer
D $5BAE Line buffer filled by #R$EB51. Holds up to #N$3E characters
. plus a trailing #N$0D written on Enter.
  $5BAE,$3F Input line.

i $5BED

g $5BF5 Print State
@ $5BF5 label=PrintState
D $5BF5 Working bytes for #R$EA8D / #R$EEF1:
D $5BF5 #TABLE(default,centre,centre)
. { =h Offset | =h Holds }
. { #R$5BF5 | Attribute byte }
. { #R$5BF6 | Flags }
. { #R$5BF7 | Column (0-31) }
. { #R$5BF8 | Row (0-23) }
. { #R$5BF9 | Character code }
. TABLE#
  $5BF5,$01 Attribute.
@ $5BF6 label=PrintState_Flags
  $5BF6,$01 Flags.
@ $5BF7 label=PrintState_Column
  $5BF7,$01 Column.
@ $5BF8 label=PrintState_Row
  $5BF8,$01 Row.
@ $5BF9 label=PrintState_Character
  $5BF9,$01 Character code.

g $5BFA Input Line State
@ $5BFA label=InputLineState
D $5BFA Working bytes for #R$EB51:
D $5BFA #TABLE(default,centre,centre)
. { =h Offset | =h Holds }
. { #R$5BFA | Cursor index into the input buffer }
. { #R$5BFB | Length of the current input line }
. { #R$5BFC | Previous key (#SKOOLKID$5C00(KSTATE)) }
. { #R$5BFD | Dirty flag (line changed since last redraw) }
. { #R$5BFE | Saved length (Caps Shift + 1) }
. TABLE#
  $5BFA,$01 Cursor index.
@ $5BFB label=InputLineState_Length
  $5BFB,$01 Line length.
@ $5BFC label=InputLineState_LastKey
  $5BFC,$01 Previous key.
@ $5BFD label=InputLineState_Dirty
  $5BFD,$01 Dirty flag.
@ $5BFE label=InputLineState_SavedLength
  $5BFE,$01 Saved length.

i $5BFF
i $5C00

b $5CCB BASIC Program
@ $5CCB label=BasicProgram
D $5CCB Kentilla by Derek Brewster, published by Micromega in 1984. It is
. the sequel to Velnor's Lair in his "Myths and Legends of Caraland" pair; see
. also #FACT(reviewer,Reviewed With His Own Ratings).
D $5CCB #HTML(The game is driven from BASIC. After the custom tape loader has
. finished, line 113 prints <code>What now?</code> and calls into the support
. code with <code>LET A=USR</code> #R$EA66 and <code>LET A=USR</code>
. #R$EA6C. Verb and command indices from #R$EA60 / #R$EA63 / #R$EA6F are
. dispatched in BASIC (see #R$EA60).)
D $5CCB #HTML(The original Micromega tape uses a REM bootstrap at
. <code>#N$5CD0</code> and a Micromega 1.1 loader at #R$E9B6; both are
. overwritten by the time this snapshot is taken. See the
. #LINK(loader-Index)(Loading Code) page.)

b $E56B BASIC Variables
@ $E56B label=BasicVariables
D $E56B #HTML(Saved BASIC variables for the main tape image, which end at
. <code>#N$E81C</code>.)

b $E81D Edit Line
@ $E81D label=EditLine
D $E81D The BASIC editor line (#SKOOLKID$5C59(E_LINE)).

b $E82C Workspace
@ $E82C label=Workspace
D $E82C BASIC workspace (#SKOOLKID$5C61(WORKSP)) through the calculator
. stack (#SKOOLKID$5C63(STKBOT) / #SKOOLKID$5C65(STKEND)).

u $E84E Unused
D $E84E #HTML(Spare RAM below #SKOOLKID$5CB2(RAMTOP) at
. <code>#N$E9B5</code>.)

b $E9AE Machine Stack
@ $E9AE label=MachineStack
D $E9AE The machine stack sits just below the support block; on load
. #REGsp points here.

b $E9B6 Loaded Machine Code
@ $E9B6 label=LoadedMachineCode
D $E9B6 The final tape block loads #N$164A bytes here through
. #N$FFFF. It overwrites the Micromega 1.1 loader that lived here
. during loading. BASIC reaches the support code through the jump table at
. #R$EA60.
D $E9B6 Documented so far: #R$EA60 (jump table, commands and all verb
. handlers), #R$EB51 (input line), vocabulary lookup / tables, #R$EA8D
. (character printing) and #R$EEF1 (message scripts). Location-graphic
. dispatch, work-buffer contents and charset buffers are left for later
. PRs.

c $EA60 Jump Table
@ $EA60 label=JumpTable
D $EA60 #HTML(Vector table of <code>JP</code> instructions. BASIC
. <code>USR</code> <code>n</code> lands on address <code>n</code> and
. bounces into the named routine:)
D $EA60 #TABLE(default,centre,centre)
. { =h Entry | =h Target }
. { #R$EA60 | #R$ED65 }
. { #R$EA63 | #R$ED2D }
. { #R$EA66 | #R$EB51 }
. { #R$EA69 | #R$ED71 }
. { #R$EA6C | #R$EDAF }
. { #R$EA6F | #R$ED7E }
. { #R$EA72 | #R$EDEE }
. { #R$EA75 | #R$EE60 }
. { #R$EA78 | #R$EEB9 }
. { #R$EA7B | #R$EEC8 }
. { #R$EA7E | #R$EEE7 }
. { #R$EA81 | #R$F14C }
. { #R$EA84 | #R$F140 }
. { #R$EA87 | #R$EFFB }
. { #R$EA8A | #R$F0D3 }
. TABLE#
D $EA60 #HTML(Action dispatch (BASIC). After #R$F0E6 returns from Enter,
. line 130 <code>GO SUB 1000</code>. Line 1010 calls <code>USR</code>
. #R$EA63 (#R$ED2D); on a hit, line 1020 advances the token, reads an
. optional noun via <code>USR</code> #R$EA69, then
. <code>GO TO n*100+1000</code> for verb index <code>n</code>. Separately,
. line 310 calls <code>USR</code> #R$EA6F (#R$ED7E) for #R$F99C:
. indices #N$01-#N$06 move; #N$07+ go to line 400.)
D $EA60 Core command handlers (BASIC, via #R$ED7E). LOOK at line
. 441 goes to 350 to redraw the room; lines 450-499 ("I see") are a
. shared subroutine reached from there and elsewhere.
D $EA60 #TABLE(default,centre,centre,centre)
. { =h Idx | =h Word | =h Summary }
. { #N$01-#N$06 | NORTH..DOWN | Exit; redraw }
. { #N$07 | INVENTORY | List carried }
. { #N$08 | LOOK | Redraw room }
. { #N$09 | HELP | Can't help }
. { #N$0A | SAVE | Tape SAVE }
. { #N$0B | LOAD | Tape LOAD }
. { #N$0C | QUIT | Quit }
. { #N$0D | SCORE | Completion % }
. { #N$0E | WAIT | "I wait." }
. TABLE#
D $EA60 #HTML(Core verb handlers (BASIC, via #R$ED2D then
. <code>n*100+1000</code>). Noun index from #R$ED71 is BASIC
. <code>x</code> where used. ENTER (<code>GO TO</code> 1800) and GO
. (<code>GO TO</code> 1900) share one handler at line 1910, since there
. are no lines from 1800 to 1909.)
D $EA60 #TABLE(default,centre,centre,centre)
. { =h Idx | =h Word | =h Summary }
. { #N$01 | GET | Take item }
. { #N$02 | TAKE | Same as GET }
. { #N$03 | DROP | Drop item }
. { #N$04 | EXAMINE | Examine; may reveal }
. { #N$05 | SEARCH | Find concealed items }
. { #N$08/#N$09 | ENTER/GO | Shared at 1910 }
. { #N$19 | LOOK | Look at noun/dir }
. TABLE#
D $EA60 #HTML(Remaining verbs in #R$FAA9 (indices #N$06-#N$2E
. except the core rows above). Line 1020 still uses
. <code>GO TO n*100+1000</code>; when that line is missing, BASIC
. continues at the next existing line.)
D $EA60 Combat and speech. ATTACK and KILL share one fight
. routine: with a carried weapon they injure or slay a creature in
. the room. SAY talks to creatures (and can trigger give/take replies).
. HIT smashes a magical ward or, with the staff, turns a foe to dust;
. BREAK is the same fight path. SHOOT fires the bow.
D $EA60 Movement and the boat. CLIMB covers the rope, a tree and
. the boat mast. SWIM crosses the river; SWING on a hanging rope joins
. that same crossing. PULL and MOVE share one routine for hauling the
. boat into the sea, tugging the tied rope, or opening a sliding panel.
. PUSH works the lever. LEAVE, ROW and BAIL handle getting out of nested
. places and travelling or emptying the boat (ROW needs the oars; BAIL
. needs a helmet).
D $EA60 Inventory and wearables. THROW drops a carried object into
. the scenery (river, tree, far bank). WEAR and REMOVE put on or take
. off clothing and gems. GIVE hands an object to a creature. EAT
. consumes food and can restore hits. PUT stashes things in containers,
. the furnace crucible, the black sack or a chest. INSERT seats the pin
. that locks the sword arm.
D $EA60 Doors, chests and light. UNLOCK, OPEN, CLOSE and LOCK all
. resolve the target door or chest through the shared helper at line
. 2650, then change its open/locked state (keys must fit). LIGHT and
. EXTINGUISH manage the torch. TURN works the furnace or the dial.
D $EA60 Magic and discovery. READ shows book and scroll texts.
. CAST spends a scroll plus its ingredient (fire protection, cure
. disease, heal). RUB the lamp for the Jinni. DIG may unearth a buried
. find; DIP melts metal in the furnace; LISTEN can reveal the death-
. beetle hint. TIE and UNTIE fasten or free the rope on a stalagmite
. (UNTIE also frees Timandra). USE only asks for a more specific verb.
D $EA60 #HTML(Landing notes where the nominal
. <code>n*100+1000</code> line is missing or shared:)
D $EA60 #TABLE(default,centre,centre,centre)
. { =h Idx | =h Word | =h Lands }
. { #N$06/#N$07 | ATTACK/KILL | 1701 (no 1600-1700) }
. { #N$0A | SAY | 2001 }
. { #N$0B | CLIMB | 2105 }
. { #N$0C | TIE | 2205 }
. { #N$0D | THROW | 2310 }
. { #N$0E | WEAR | 2410 }
. { #N$0F | REMOVE | 2510 }
. { #N$10 | UNLOCK | 2610 }
. { #N$11 | OPEN | 2715 }
. { #N$12 | CLOSE | 2810 }
. { #N$13 | READ | 2905 }
. { #N$14 | LOCK | 3010 }
. { #N$15 | SWIM | 3110 }
. { #N$16 | GIVE | 3205 }
. { #N$17/#N$18 | PULL/MOVE | 3410 (no 3300-3409) }
. { #N$1A | PUSH | 3605 }
. { #N$1B | EAT | 3700 }
. { #N$1C | LIGHT | 3820 }
. { #N$1D | EXTINGUISH | 3920 }
. { #N$1E | TURN | 4010 }
. { #N$1F | HIT | 4105 }
. { #N$20 | PUT | 4205 }
. { #N$21 | DIG | 4305 }
. { #N$22 | DIP | 4405 }
. { #N$23 | RUB | 4510 }
. { #N$24 | LISTEN | 4605 }
. { #N$25 | SHOOT | 4705 }
. { #N$26 | CAST | 4810 }
. { #N$27 | LEAVE | 4910 }
. { #N$28 | ROW | 5005 }
. { #N$29 | INSERT | 5110 }
. { #N$2A | UNTIE | 5210 }
. { #N$2B | BREAK | 5300→4100 (HIT) }
. { #N$2C | SWING | 5410→3130 (SWIM) }
. { #N$2D | BAIL | 5500 }
. { #N$2E | USE | 5600 }
. TABLE#
  $EA60,$03 Jump to #R$ED65.
@ $EA63 label=JumpTable_SearchVerbs
  $EA63,$03 Jump to #R$ED2D.
@ $EA66 label=JumpTable_InputLine
  $EA66,$03 Jump to #R$EB51.
@ $EA69 label=JumpTable_SearchNouns
  $EA69,$03 Jump to #R$ED71.
@ $EA6C label=JumpTable_AdvanceInputPointer
  $EA6C,$03 Jump to #R$EDAF.
@ $EA6F label=JumpTable_SearchCommands
  $EA6F,$03 Jump to #R$ED7E.
@ $EA72 label=JumpTable_TokenHelper
  $EA72,$03 Jump to #R$EDEE.
@ $EA75 label=JumpTable_BasicHelper
  $EA75,$03 Jump to #R$EE60.
@ $EA78 label=JumpTable_SeedPrimaryBuffer
  $EA78,$03 Jump to #R$EEB9.
@ $EA7B label=JumpTable_StepWorkBuffer
  $EA7B,$03 Jump to #R$EEC8.
@ $EA7E label=JumpTable_SeedSecondaryBuffer
  $EA7E,$03 Jump to #R$EEE7.
@ $EA81 label=JumpTable_ScanInputSpaces
  $EA81,$03 Jump to #R$F14C.
@ $EA84 label=JumpTable_CopyWorkBuffer
  $EA84,$03 Jump to #R$F140.
@ $EA87 label=JumpTable_LocationGraphicSetup
  $EA87,$03 Jump to #R$EFFB.
@ $EA8A label=JumpTable_ScrollAdjust
  $EA8A,$03 Jump to #R$F0D3.

c $EA8D Print Character
@ $EA8D label=PrintCharacter
D $EA8D Plots one character glyph into the display file. Callers set
. up #R$5BF5 first.
  $EA8D,$04 Stash the flags, counters, screen pointer and glyph pointer
. on the stack.
N $EA91 #HTML(Pick the plot opcode written into #R$EAF1: #N$AE (<code>XOR
. (HL)</code>) or #N$B6 (<code>OR (HL)</code>) from bit 2 of the flags.)
  $EA91,$05 Fetch *#R$5BF6 and test bit 2.
  $EA96,$04 Prefer #N$AE (XOR) unless bit 2 was set.
  $EA9A,$02 #REGa=#N$B6 (OR).
@ $EA9C label=PrintCharacter_SetPlotOpcode
@ $EA9C keep
  $EA9C,$03 Patch that opcode into #R$EAF1.
N $EA9F Point #REGhl at the 8-byte glyph. Codes below #N$8F use
. #SKOOLKID$5C36(CHARS); #N$90 and above were meant to index
. #SKOOLKID$5C7B(UDG), but the unconditional jump at #R$EAA4 always takes
. the #SKOOLKID$5C36(CHARS) path.
  $EA9F,$05 Fetch *#R$5BF9 and compare it with #N$8F.
@ $EAA4 label=PrintCharacter_ForceChars
  $EAA4,$02 Always take the #SKOOLKID$5C36(CHARS) path at #R$EAB6.
N $EAA6 Unreachable #SKOOLKID$5C7B(UDG) path (left in the binary after
. #R$EAA4).
  $EAA6,$0E Scale the UDG index and point #REGhl at #SKOOLKID$5C7B(UDG).
  $EAB4,$02 Jump to #R$EAC1.
@ $EAB6 label=PrintCharacter_CharsGlyph
  $EAB6,$0B Point #REGhl at glyph *#R$5BF9 in #SKOOLKID$5C36(CHARS).
@ $EAC1 label=PrintCharacter_ScreenAddress
N $EAC1 Convert row/column at #R$5BF7 into a display-file address in
. #REGde.
  $EAC1,$03 #REGde=#N$4000.
  $EAC4,$04 #REGbc=*#R$5BF7.
  $EAC8,$05 Jump to #R$EB39 if the column is out of range.
  $EACD,$05 Jump to #R$EB39 if the row is out of range.
@ $EAD2 label=PrintCharacter_RowThirds
  $EAD2,$04 Jump to #R$EAE0 if this row is already in the current third.
  $EAD6,$0A Move #REGd down one screen third and try again.
@ $EAE0 label=PrintCharacter_ColumnOffset
  $EAE0,$07 Fold the row remainder and column into #REGe.
N $EAE7 Copy or XOR the 8 glyph rows into the display file.
  $EAE7,$07 Jump to #R$EAF9 if bit 0 of *#R$5BF6 clears XOR mode.
  $EAEE,$02 #REGb=#N$08.
@ $EAF0 label=PrintCharacter_XorLoop
@ $EAF1 label=PrintCharacter_PlotOpcode
M $EAF0,$07 Plot one glyph row with the patched XOR/OR at #R$EAF1
. and move down a pixel line.
  $EAF7,$02 Jump to #R$EB01.
@ $EAF9 label=PrintCharacter_CopyLoop
  $EAF9,$02 #REGb=#N$08.
@ $EAFB label=PrintCharacter_CopyLoop_Body
M $EAFB,$06 Copy one glyph row into the display file and move down a
. pixel line.
@ $EB01 label=PrintCharacter_Attributes
N $EB01 Unless bit 1 of the flags is set, write the attribute from
. #R$5BF5 into the matching attribute-file cell.
  $EB01,$07 Jump to #R$EB28 if bit 1 of *#R$5BF6 skips attributes.
  $EB08,$0B Point #REGhl at the attribute-file cell for *#R$5BF7.
@ $EB13 label=PrintCharacter_AttrRow
  $EB13,$04 Jump to #R$EB19 if another attribute third remains.
  $EB17,$02 Jump to #R$EB1C.
@ $EB19 label=PrintCharacter_AttrNextThird
  $EB19,$03 Step #REGh to the next attribute third and retry.
@ $EB1C label=PrintCharacter_AttrColumn
  $EB1C,$06 Restore the row remainder and load the column.
  $EB22,$04 Add #N$20 per remaining row to reach the cell.
@ $EB26 label=PrintCharacter_WriteAttr
  $EB26,$02 Write *#R$5BF5 into that attribute-file cell.
@ $EB28 label=PrintCharacter_AdvanceCursor
N $EB28 Advance the cursor: move to the next column, or wrap to the next
. row.
  $EB28,$0A Advance the column; jump to #R$EB35 if still on this row.
  $EB32,$03 Wrap to column #N$00 on the next row.
@ $EB35 label=PrintCharacter_StoreCursor
  $EB35,$04 Store the updated cursor back in *#R$5BF7.
@ $EB39 label=PrintCharacter_Exit
  $EB39,$04 Restore the glyph pointer, screen pointer, counters and
. flags from the stack.
  $EB3D,$01 Return.

c $EB3E Input Line Symbol-Shift Remap
@ $EB3E label=InputLine_SymbolShiftRemap
D $EB3E #HTML(Reached from #R$EB81 when Symbol Shift is held. Remaps
. <code>P</code> to <code>"</code> and <code>J</code> to "-", then
. continues into #R$EB83; any other key returns to the poll loop at
. #R$EB5E.)
  $EB3E,$05 Jump to #R$EB48 unless the key is "P".
  $EB43,$05 #HTML(Remap it to <code>"</code> and handle it at #R$EB83.)
@ $EB48 label=InputLine_SymbolShiftRemap_J
  $EB48,$04 Jump to #R$EB5E unless the key is "J".
  $EB4C,$05 Remap it to "-" and handle it at #R$EB83.

c $EB51 Input Line
@ $EB51 label=InputLine
D $EB51 Main game entry from #R$EA66. Clears #R$5BFA, draws the cursor
. via #R$ECF0, then loops on #SKOOLKID$5C00(KSTATE) (second key slot) until the
. player presses Enter. Ordinary keys are echoed through #R$EA8D into the
. buffer at #R$5BAE; Caps Shift chords edit the line; Enter
. submits via #R$F0E6.)
  $EB51,$0A Clear the length, cursor and dirty flag.
  $EB5B,$03 Call #R$ECF0.
@ $EB5E label=InputLine_Poll
N $EB5E Wait for #SKOOLKID$5C00(KSTATE) (second key slot) to change to a new
. non-#N$FF value.
  $EB5E,$07 Remember the previous key; read #SKOOLKID$5C00(KSTATE).
  $EB65,$07 Store the key and jump to #R$EB5E if none is down.
  $EB6C,$03 Jump to #R$EB5E if the key has not changed.
N $EB70 Caps Shift held: dispatch editing chords at #R$EBF5.
  $EB6F,$01 #REGe=#REGa.
  $EB70,$0A Jump to #R$EBF5 when Caps Shift is held.
N $EB7A Test Symbol Shift on the CAPS/Symbol Shift row.
  $EB7A,$07 Fetch that row and test Symbol Shift.
N $EB81 Jump to #R$EB3E when Symbol Shift is held.
@ $EB81 label=InputLine_SymbolShiftHeld
  $EB81,$02 Jump to #R$EB3E when Symbol Shift is held.
@ $EB83 label=InputLine_HandleKey
  $EB83,$05 Jump to #R$EBD9 if Enter was pressed.
N $EB88 Append #REGe to the buffer when there is room (length < #N$3E).
  $EB88,$08 Jump to #R$EB5E if the line already holds #N$3E characters.
  $EB90,$0A Store the key into the buffer at #R$5BAE.
  $EB9A,$0E Set print state for echoing on row #N$16.
  $EBA8,$12 Wrap onto row #N$17 when the cursor column is past #N$20.
@ $EBBA label=InputLine_EchoChar
  $EBBA,$03 Call #R$EA8D.
  $EBBD,$0A Grow the stored length if this column is new.
@ $EBC7 label=InputLine_AdvanceCursor
  $EBC7,$08 Advance the cursor and redraw it.
  $EBCF,$0A Mark the line dirty, click, and poll again.
@ $EBD9 label=InputLine_Enter
N $EBD9 Terminate the buffer with #N($0D), point both read pointers at the
. input buffer, and submit via #R$F0E6.
  $EBD9,$10 Save the length and CR-terminate the buffer.
  $EBE9,$09 Point both token pointers at the input buffer.
  $EBF2,$03 Jump to #R$F0E6.
@ $EBF5 label=InputLine_CapsShift
N $EBF5 #HTML(Caps Shift chords: <code>1</code> restore length, <code>5</code>/
. <code>8</code> move the cursor, <code>9</code> insert a space,
. <code>0</code> delete, <code>2</code> is a no-op stub.)
  $EBF5,$05 Jump to #R$EC12 if Caps Shift + 1.
  $EBFA,$04 Jump to #R$EC25 if Caps Shift + 2.
  $EBFE,$04 Jump to #R$EC36 if Caps Shift + 5.
  $EC02,$04 Jump to #R$EC4D if Caps Shift + 8.
  $EC06,$05 Jump to #R$EC97 if Caps Shift + 0.
  $EC0B,$04 Jump to #R$EC68 if Caps Shift + 9.
  $EC0F,$03 Jump to #R$EB5E.
@ $EC12 label=InputLine_Caps1
  $EC12,$07 Jump to #R$EB5E if the line is dirty.
  $EC19,$0C Restore the saved length and redraw the line.
@ $EC25 label=InputLine_Caps2
  $EC25,$0A Jump to #R$EB5E (Caps Shift + 2 is a no-op).
  $EC2F,$07 Unreachable restore of the saved length.
@ $EC36 label=InputLine_Caps5
N $EC36 Move the cursor one column left and redraw it.
  $EC36,$07 Jump to #R$EB5E if already at the start.
  $EC3D,$10 Clear the old cursor, step left, and redraw.
@ $EC4D label=InputLine_Caps8
N $EC4D Move the cursor one column right (not past the line length).
  $EC4D,$0B Jump to #R$EB5E if already at the end of the line.
  $EC58,$10 Clear the old cursor, step right, and redraw.
@ $EC68 label=InputLine_Caps9
N $EC68 Insert a space at the cursor by shifting the tail right.
  $EC68,$08 Jump to #R$EB5E if the line is full.
  $EC70,$0D Grow the length and work out how many bytes to shift.
M $EC7D,$0F LDDR the tail right and write a space at the cursor.
  $EC8C,$0B Redraw, mark the line dirty, and poll again.
@ $EC97 label=InputLine_Caps0
N $EC97 Delete the character left of the cursor by shifting the tail left.
  $EC97,$07 Jump to #R$EB5E if already at the start.
  $EC9E,$0F Step the cursor left and shrink the stored length.
M $ECAD,$0D LDIR the tail left over the deleted character.
  $ECBA,$06 Redraw the line and poll again.
c $ECC0 Input Line Redraw
@ $ECC0 label=InputLine_Redraw
D $ECC0 Repaint the buffered characters at row #N$16 via #R$EA8D, pad
. with two spaces, then fall into #R$ECF0 to draw the cursor.
  $ECC0,$14 Point at the buffer and reset print state for row #N$16.
  $ECD4,$07 Jump to #R$ECE5 if the line is empty.
@ $ECDB label=InputLine_Redraw_Loop
M $ECDB,$0A Print each buffered character through #R$EA8D.
@ $ECE5 label=InputLine_Redraw_Pad
  $ECE5,$0B Pad with two spaces, then fall into the cursor draw.
@ $ECF0 label=InputLine_DrawCursor
D $ECF0 XOR a space at the cursor column with attribute #N$28 so the
. cursor blinks against the input row.
  $ECF0,$05 Use attribute #N$28 for the blinking cursor.
@ $ECF5 label=InputLine_DrawCursor_Body
  $ECF5,$0A Set XOR mode and load a space glyph.
  $ECFF,$0F Plot it on row #N$16 at the cursor column.
  $ED0E,$0A Wrap onto row #N$17 when the column is past #N$20.
@ $ED18 label=InputLine_DrawCursor_Print
  $ED18,$03 Call #R$EA8D.
  $ED1B,$01 Return.

c $ED1C Input Line Clear Cursor
@ $ED1C label=InputLine_ClearCursor
D $ED1C Same as #R$ECF0 but with attribute #N($05), used to erase the
. old cursor before moving it.
  $ED1C,$05 Use attribute #N$05 to erase the cursor.
  $ED21,$02 Jump to #R$ECF5.

c $ED23 Input Line Click
@ $ED23 label=InputLine_Click
D $ED23 Short click via ROM #SKOOLKID$03B5(BEEPER) after a character is
. accepted.
  $ED23,$09 Play a short click through #SKOOLKID$03B5(BEEPER).
  $ED2C,$01 Return.

c $ED2D Search Vocabulary (Verbs)
@ $ED2D label=SearchVocabulary_Verbs
D $ED2D #HTML(Jump-table target #R$EA63 (<code>USR</code> #R$EA63):
. search #R$FAA9 for the token at #R$5BA7. Sets #R$5BA4 to #N$02 and
. walks up to index #N$2E. On a hit, returns #REGbc=word index for
. BASIC <code>GO TO n*100+1000</code> (see #R$EA60); on a miss,
. #REGbc=#N($0000,$04,$04).)
  $ED2D,$05 Set the minimum match length to #N$02.
  $ED32,$05 Point #REGhl at #R$FAA9 with word limit #N$2F.
@ $ED37 label=SearchVocabulary_Loop
N $ED37 Shared search loop used by #R$ED2D, #R$ED65, #R$ED71 and #R$ED7E.
  $ED37,$05 Start the word index at #N$01.
@ $ED3C label=SearchVocabulary_TryWord
  $ED3C,$0B Compare the current table word to the token at #R$5BA7.
  $ED47,$02 Jump to #R$ED5E if the word matched.
@ $ED49 label=SearchVocabulary_SkipWord
  $ED49,$06 Skip ahead to the CR that ends this table word.
  $ED4F,$09 Advance the word index and try the next entry.
  $ED58,$02 Jump to #R$ED3C if there are more words to try.
  $ED5A,$03 #REGbc=#N($0000,$04,$04) on a miss.
  $ED5D,$01 Return.
@ $ED5E label=SearchVocabulary_Matched
  $ED5E,$06 #REGbc=the matched word index.
  $ED64,$01 Return.

c $ED65 Search Vocabulary (Prepositions)
@ $ED65 label=SearchVocabulary_Prepositions
D $ED65 #HTML(Jump-table target #R$EA60 (<code>USR</code> #R$EA60):
. search #R$FBA8 for the token at #R$5BA7. Same loop as #R$ED37 with
. match length #N$02.)
  $ED65,$0A Set match length #N$02 and point at #R$FBA8.
  $ED6F,$02 Jump to #R$ED37.

c $ED71 Search Vocabulary (Nouns)
@ $ED71 label=SearchVocabulary_Nouns
D $ED71 #HTML(Jump-table target #R$EA69 (<code>USR</code> #R$EA69):
. search #R$FBF4 for the token at #R$5BA7. BASIC stores the index as
. <code>x</code> for verb handlers (see #R$EA60).)
  $ED71,$0A Set match length #N$02 and point at #R$FBF4.
  $ED7B,$03 Jump to #R$ED37.

c $ED7E Search Vocabulary (Commands)
@ $ED7E label=SearchVocabulary_Commands
D $ED7E #HTML(Jump-table target #R$EA6F (<code>USR</code> #R$EA6F):
. search #R$F99C for the token at #R$5BA7. Match length #N$01 so short
. commands like <code>UP</code> still hit. BASIC line 310 uses the index
. for movement (#N$01-#N$06) or the command handlers at line 400+
. (see #R$EA60).)
  $ED7E,$0A Set match length #N$01 and point at #R$F99C.
  $ED88,$02 Jump to #R$ED37.

c $ED8A Compare Token To Vocabulary Word
@ $ED8A label=CompareTokenToWord
D $ED8A Compare the token at #REGde to the table word at #REGhl.
. Counts token characters until space, quote or control, requires at least
. *#R$5BA4 characters, then matches that many bytes. Returns with carry
. reset on a match, set on a miss.
  $ED8A,$03 Clear the length counter and stash the token pointer.
@ $ED8D label=CompareTokenToWord_Count
  $ED8D,$05 Jump to #R$ED9A if *#REGde is a control character (< #N$21).
  $ED92,$04 Jump to #R$ED9A if *#REGde is a quote.
  $ED96,$04 Count this character and keep scanning the token.
@ $ED9A label=CompareTokenToWord_CheckLength
  $ED9A,$09 Restore the token pointer; jump to #R$EDAD if it is too short.
@ $EDA3 label=CompareTokenToWord_Match
  $EDA3,$04 Jump to #R$EDAD if the next characters differ.
  $EDA7,$04 Advance both pointers and keep matching.
  $EDAB,$01 Clear carry on a full match.
  $EDAC,$01 Return.
@ $EDAD label=CompareTokenToWord_Miss
  $EDAD,$01 Set carry on a miss.
  $EDAE,$01 Return.

c $EDAF Advance Input Pointer
@ $EDAF label=AdvanceInputPointer
D $EDAF #HTML(Jump-table target #R$EA6C: advance #R$5BA7 / #R$5BA9 through
. #R$5BAE. Skips a leading <code>THE</code> via #R$FBA4, then leaves
. #R$5BAC holding the delimiter that ended the token.)
  $EDAF,$06 Fetch the current token and compare it with end-of-line.
  $EDB5,$01 Return if the current token is already at end-of-line.
  $EDB6,$0C Promote #R$5BA9 to #R$5BA7 and test for an empty token.
  $EDC2,$01 Return if that token is empty.
@ $EDC3 label=AdvanceInputPointer_Scan
  $EDC3,$06 Jump to #R$EDD7 at end-of-line or a quote.
  $EDC9,$04 Jump to #R$EDD7 on a quote.
  $EDCD,$04 Keep scanning until a space.
@ $EDD1 label=AdvanceInputPointer_SkipSpaces
  $EDD1,$06 Skip any run of spaces.
@ $EDD7 label=AdvanceInputPointer_Store
  $EDD7,$0B Store the delimiter and next-token pointer; require #N$03
. matching characters for "THE".
  $EDE2,$0B Skip a leading "THE" via #R$FBA4.
  $EDED,$01 Return if "THE" was not skipped.

c $EDEE Match Token In BASIC List
@ $EDEE label=MatchTokenInBasicList
D $EDEE Jump-table target #R$EA72: using the delimiter in #R$5BAC,
. try #R$ED65 (prepositions) and then walk a BASIC-resident word list via
. #R$EE9C. Returns #REGbc=index or #N($0000,$04,$04).
  $EDEE,$09 Set match length #N$02 and reset the word index.
  $EDF7,$0B Jump to #R$EE23 if the delimiter ends the line or is a quote.
  $EE02,$12 Stash #R$5BA7 in #REGhl, promote #R$5BA9 as the current
. token, try a preposition match (#R$ED65) and seed #R$5BA5 to #N$01.
  $EE14,$04 Pop the stashed pointer back into #R$5BA7 via #REGhl.
  $EE18,$04 Jump to #R$EE23 if #REGc holds a preposition hit.
  $EE1C,$07 Mark the line dirty and scan the BASIC list.
@ $EE23 label=MatchTokenInBasicList_ClearDirty
  $EE23,$06 Clear the dirty flag and use the BASIC-helper scan.
@ $EE29 label=MatchTokenInBasicList_Scan
  $EE29,$12 Compare the next BASIC-list word to the token at #R$5BA7.
@ $EE3B label=MatchTokenInBasicList_NextWord
  $EE3B,$0A Skip to the next space-separated word in this entry.
  $EE45,$0A Compare that word to the next input token.
@ $EE4F label=MatchTokenInBasicList_AdvanceEntry
  $EE4F,$06 Step to the next BASIC-list entry and keep scanning.
@ $EE55 label=MatchTokenInBasicList_Miss
  $EE55,$03 #REGbc=#N($0000,$04,$04) on a miss.
  $EE58,$01 Return.
@ $EE59 label=MatchTokenInBasicList_Hit
  $EE59,$06 #REGbc=the matched word index.
  $EE5F,$01 Return.

c $EE60 BASIC Helper
@ $EE60 label=BasicHelper
D $EE60 Jump-table target #R$EA75: reload #SKOOLKID$5C57(NSPPC) from
. #R$5BA0 and continue the BASIC-list match.
  $EE60,$0C Reload NSPPC from #R$5BA0; jump to #R$EE4F if dirty.
  $EE6C,$02 Jump to #R$EE94.
@ $EE6E label=BasicHelper_Scan
  $EE6E,$10 Compare the next BASIC-list word to the token at #R$5BA7.
  $EE7E,$02 Jump to #R$EE59 if matched.
@ $EE80 label=BasicHelper_NextWord
  $EE80,$0A Skip to the next space-separated word in this entry.
  $EE8A,$0A Compare that word to the token at #R$5BA7.
@ $EE94 label=BasicHelper_AdvanceEntry
  $EE94,$08 Step to the next entry or report a miss.

c $EE9C Step BASIC List Entry
@ $EE9C label=StepBasicListEntry
D $EE9C Advance #SKOOLKID$5C57(NSPPC) / #R$5BA0 to the next
. length-prefixed BASIC list entry and bump #R$5BA5.
  $EE9C,$0B Skip the length prefix and advance NSPPC by that many bytes.
  $EEA7,$06 Store the new NSPPC in #R$5BA0 as well.
  $EEAD,$0B Bump the word index; leave the entry limit in #REGb.
  $EEB8,$01 Return.

c $EEB9 Seed Primary Work Buffer
@ $EEB9 label=SeedPrimaryWorkBuffer
D $EEB9 #HTML(Jump-table target #R$EA78 (<code>USR</code> #R$EA78): point
. #R$5BA2 at #R$FA00 and scan up to #N$2D entries. BASIC uses this for
. INVENTORY / LOOK object lists (see #R$EA60).)
  $EEB9,$08 Point #R$5BA2 at #R$FA00 with #N$2D entries.
@ $EEC1 label=SeedWorkBuffer_Common
  $EEC1,$07 Remember the entry limit and clear the index.
@ $EEC8 label=StepWorkBuffer
N $EEC8 Jump-table target #R$EA7B: step #R$5BA2 and compare *#REGhl to
. #R$5BFD.
  $EEC8,$0F Step the work-buffer pointer and compare to #R$5BFD.
  $EED7,$07 Jump to #R$EE59 if this entry matches.
  $EEDE,$09 Keep scanning, or fall through to a miss.

c $EEE7 Seed Secondary Work Buffer
@ $EEE7 label=SeedSecondaryWorkBuffer
D $EEE7 #HTML(Jump-table target #R$EA7E (<code>USR</code> #R$EA7E): same
. as #R$EEB9 but starting at #R$FA2D with #N$22 entries.)
  $EEE7,$08 Point #R$5BA2 at #R$FA2D with #N$22 entries.
  $EEEF,$02 Jump to #R$EEC1.

c $EEF1 Print Message
@ $EEF1 label=PrintMessage
D $EEF1 Walks a message script pointed to by #REGhl. Most bytes are
. literal character codes passed to #R$EF82; values below #N$20 are
. control codes:
D $EEF1 #TABLE(default,centre,centre)
. { =h Code | =h Action }
. { #N$00-#N$17 | Set row, then column (also #R$5B00) }
. { #N$18 | Set attribute at #R$5BF5 }
. { #N$19 | Set flags at #R$5BF6 }
. { #N$1A | End of script (return) }
. { #N$1B | Repeat current character }
. { #N$1C | Fill a box of spaces }
. { #N$1D | New line from #R$5B00 }
. { #N$1E | Add to column; advance row }
. { #N$1F | Call sub-script via #R$EF92 }
. TABLE#
N $EEF1 Dispatch the next script byte to a control handler, or print it
. as a literal character.
  $EEF1,$02 Fetch the next script byte.
N $EEF3 Codes #N$00-#N$17 set the print row and column.
  $EEF3,$04 Jump to #R$EF17 if #REGa is less than #N$18.
N $EEF7 Code #N$18 sets the print attribute.
  $EEF7,$02 Jump to #R$EF24 if #REGa is #N$18.
N $EEF9 Code #N$1A ends the script.
  $EEF9,$02 Compare #REGa with #N$1A.
  $EEFB,$01 Return if this is the end-of-script code.
N $EEFC Code #N$19 sets the print flags.
  $EEFC,$02 Jump to #R$EF2B if #REGa is less than #N$1A.
N $EEFE Code #N$1B repeats the current character.
  $EEFE,$04 Jump to #R$EF32 if #REGa is less than #N$1C.
N $EF02 Code #N$1C fills a box of spaces.
  $EF02,$02 Jump to #R$EF3C if #REGa is #N$1C.
N $EF04 Code #N$1D starts a new line from the left margin.
  $EF04,$04 Jump to #R$EF67 if #REGa is less than #N$1E.
N $EF08 Code #N$1E adds to the column, then advances the row.
  $EF08,$02 Jump to #R$EF77 if #REGa is #N$1E.
N $EF0A Code #N$1F calls a location-art sub-script.
  $EF0A,$05 Jump to #R$EF92 if #REGa is #N$1F.
N $EF0F Literal character: store it and print via #R$EF82.
  $EF0F,$06 Store the character in *#R$5BF9 and print it.
  $EF15,$02 Jump to #R$EEF1.
@ $EF17 label=PrintMessage_SetPosition
  $EF17,$07 Store the new row and column in the print state.
  $EF1E,$06 Remember the left margin at #R$5B00 and continue.
@ $EF24 label=PrintMessage_SetAttribute
  $EF24,$07 Store the next script byte as the print attribute.
@ $EF2B label=PrintMessage_SetFlags
  $EF2B,$07 Store the next script byte as the print flags.
@ $EF32 label=PrintMessage_Repeat
  $EF32,$02 Load the repeat count from the script.
@ $EF34 label=PrintMessage_Repeat_Loop
  $EF34,$05 Print the current character that many times.
  $EF39,$03 Advance the script and continue.
@ $EF3C label=PrintMessage_FillBox
  $EF3C,$07 Set the fill character to a space and load the row count.
  $EF43,$09 Store the fill attribute and start row from the script.
@ $EF4C label=PrintMessage_FillBox_Row
  $EF4C,$08 Begin a row of #N$14 spaces from column #N$06.
@ $EF54 label=PrintMessage_FillBox_Column
  $EF54,$05 Print one row of spaces.
  $EF59,$0A Advance the print row and loop until the box is filled.
  $EF63,$04 Advance the script and continue.
@ $EF67 label=PrintMessage_NewLine
  $EF67,$06 Restore the column from the left-margin copy at #R$5B00.
@ $EF6D label=PrintMessage_AdvanceRow
  $EF6D,$07 Advance the print row.
  $EF74,$03 Jump to #R$EEF1.
@ $EF77 label=PrintMessage_AddColumn
  $EF77,$09 Add the next script byte to the left-margin column.
  $EF80,$02 Jump to #R$EF6D to advance the row.

c $EF82 Clip And Print Character
@ $EF82 label=ClipAndPrintCharacter
D $EF82 Gate before #R$EA8D: ignore columns past #N($1A), and skip
. printing for the left margin (columns below #N$06) while still
. advancing the cursor.
  $EF82,$05 Fetch the column and compare it with #N$1A.
  $EF87,$01 Return if the column is past #N$1A.
  $EF88,$05 Jump to #R$EA8D if the column is in the printable area.
  $EF8D,$04 Otherwise just bump the cursor.
  $EF91,$01 Return.

c $EF92 Call Sub-Message
@ $EF92 label=CallSubMessage
D $EF92 Control code #N$1F: read a new column and a sub-script id,
. then dispatch via #R$EFA4.
  $EF92,$08 Set the column and left margin from the next script byte.
  $EF9A,$03 Fetch the sub-script id and stash the script pointer.
  $EF9D,$04 Call #R$EFA4 and restore the script pointer.
  $EFA1,$03 Jump to #R$EEF1.

c $EFA4 Sub-Message Select
@ $EFA4 label=SubMessageSelect
D $EFA4 Picks one of the small graphic scripts at #R$FDE8 and jumps
. into #R$EEF1. Ids #N$00-#N$05 cover the fragments used while drawing
. location art.
  $EFA4,$04 Jump to #R$EFB9 if the id is #N$00.
  $EFA8,$02 Jump to #R$EFC4 if the id is #N$01.
  $EFAA,$04 Jump to #R$EFCF if the id is #N$02.
  $EFAE,$04 Jump to #R$EFDF if the id is #N$03.
  $EFB2,$02 Jump to #R$EFEA if the id is #N$04.
  $EFB4,$04 Jump to #R$EFF5 if the id is #N$05.
  $EFB8,$01 Return.
@ $EFB9 label=SubMessageSelect_DigitPunctuation
N $EFB9 Select sub-script #R$FDE8 (digit/punct rows at attr #N$0C).
  $EFB9,$08 Set row #N$01 and point at sub-script #R$FDE8.
  $EFC1,$03 Jump to #R$EEF1.
@ $EFC4 label=SubMessageSelect_Punctuation
N $EFC4 Select sub-script #R$FE12 (punct/symbol rows at attr #N$0C).
  $EFC4,$08 Set row #N$02 and point at sub-script #R$FE12.
  $EFCC,$03 Jump to #R$EEF1.
@ $EFCF label=SubMessageSelect_AlternateCharset
N $EFCF Select the alternate font at #R$F278 and sub-script #N$01.
@ $EFCF keep
  $EFCF,$09 Write #R$F278(#N$F178) to *#SKOOLKID$5C36(CHARS) and run
. sub-script #N$01.
@ $EFD8 keep
  $EFD8,$06 Write #R$F228(#N$F128) to *#SKOOLKID$5C36(CHARS).
  $EFDE,$01 Return.
@ $EFDF label=SubMessageSelect_DualGlyph
N $EFDF Select sub-script #R$FE2D (two glyphs at attr #N$27).
  $EFDF,$08 Set row #N$06 and point at sub-script #R$FE2D.
  $EFE7,$03 Jump to #R$EEF1.
@ $EFEA label=SubMessageSelect_TripleGlyph
N $EFEA Select sub-script #R$FE37 (three glyphs at attr #N$27).
  $EFEA,$08 Set row #N$05 and point at sub-script #R$FE37.
  $EFF2,$03 Jump to #R$EEF1.
@ $EFF5 label=SubMessageSelect_GlyphStrip
N $EFF5 Select sub-script #R$FE41 (glyph band at attr #N$28/#N$38).
  $EFF5,$03 #REGhl=#R$FE41.
  $EFF8,$03 Jump to #R$EEF1.

c $EFFB Location Graphic Setup
@ $EFFB label=LocationGraphicSetup
D $EFFB Jump-table target #R$EA87: points #SKOOLKID$5C36(CHARS) at the
. location charset and draws location art. Body left for a later PR.
  $EFFB,$02 #REGa=#N$05.

b $EFFD Bytes After Location Setup
@ $EFFD label=RemainderAfterLocationSetup
D $EFFD Body of #R$EFFB and related location-graphic dispatch; left for
. a later PR.

c $F0D3 Scroll Adjust
@ $F0D3 label=ScrollAdjust
D $F0D3 Jump-table target #R$EA8A: bumps the line byte of
. #SKOOLKID$5C88(S_POSN). Body left for a later PR.
  $F0D3,$03 Fetch the line byte of #SKOOLKID$5C88(S_POSN).

b $F0D6 Bytes After Scroll Adjust
@ $F0D6 label=RemainderAfterScrollAdjust
D $F0D6 Remainder of #R$F0D3; left for a later PR.

c $F0E6 Submit Input Line
@ $F0E6 label=SubmitInputLine
D $F0E6 #HTML(Reached from #R$EBD9 when Enter is pressed. Clears the input
. rows, adjusts the lower screen via #R$F0D3, prints a <code>></code>
. prompt, echoes #R$5BAE through #R$EA8D, then returns via #R$F0D3. Token
. walks and vocabulary lookup are separate jump-table entries (#R$EDAF,
. #R$ED7E and neighbours).)
  $F0E6,$16 Clear both input rows to spaces with blank attributes.
@ $F0FC label=SubmitInputLine_ClearLoop
  $F0FC,$05 Print spaces until the clear count is done.
  $F101,$07 Reset the column and call #R$F0D3.
  $F108,$17 Print a ">" prompt on the lower screen.
  $F11F,$08 Restore the echo attribute and point at #R$5BAE.
@ $F127 label=SubmitInputLine_Echo
  $F127,$05 Jump to #R$F135 at end-of-line.
  $F12C,$09 Echo this character through #R$EA8D and continue.
@ $F135 label=SubmitInputLine_ScrollBack
  $F135,$0B Scroll the lower screen back two rows via #R$F0D3.

c $F140 Copy Work Buffer
@ $F140 label=CopyWorkBuffer
D $F140 Jump-table target #R$EA84: copies #N($0096,$04,$04) bytes from
. near the start of #R$E9B6 into a work buffer.
@ $F143 keep
M $F140,$0B Copy #N($0096,$04,$04) bytes into the work buffer at
. #N$FA01.
  $F14B,$01 Return.

c $F14C Scan Input Spaces
@ $F14C label=ScanInputSpaces
D $F14C Jump-table target #R$EA81: walk #R$5BAE until a quote or a
. character below space. On quote, seed #R$5BA7 / #R$5BA9, call #R$EDAF,
. then set #REGbc=#N($0000,$04,$04). The early return for a character below
. #N$20 leaves #REGbc unchanged.
  $F14C,$04 Point #REGde at #R$5BAE.
@ $F150 label=ScanInputSpaces_Loop
  $F150,$04 Fetch the next character and compare it with space.
  $F154,$01 Return if the next character is below space.
  $F155,$04 Keep scanning until a quote.
  $F159,$0E Seed both token pointers, call #R$EDAF, and set
. #REGbc=#N($0000,$04,$04).
  $F167,$01 Return.

b $F168 Location Graphic Script: High Platform
@ $F168 label=LocationGraphicScript_HighPlatform
D $F168 Location graphic script for location id #N$0F (high
. platform), picked by the dispatcher in #R$EFFB. Also here:
. #R$F1D0 (arid scrubland, id #N$06) and #R$F1DE (scorched plains,
. id #N$05). Drawn through #R$EEF1 using character codes into
. #R$F228. The arid-scrubland script has no #N$1A terminator, so
. after drawing location #N$06 the interpreter continues into
. #R$F1DE.
  $F168,$68
@ $F1D0 label=LocationGraphicScript_AridScrubland
  $F1D0,$0E
@ $F1DE label=LocationGraphicScript_ScorchedPlains
N $F1DE Also reached when #R$F1D0 runs off without a #N$1A
. terminator.
  $F1DE,$36

u $F214 Unused
D $F214 Padding before the location font at #R$F228.
  $F214,$14

b $F228 Location Font
@ $F228 label=LocationFont
@ $F278 label=AlternateLocationFont
D $F228 8x8 glyphs for character codes #N$20-#N$B7 (#N$98 glyphs).
. Writes of #R$F228(#N$F128) to *#SKOOLKID$5C36(CHARS) make printable
. glyphs start here; writes of #R$F278(#N$F178) make them start at
. #R$F278 (ten glyphs further into this same bitmap).
  $F228,$4C0,$08

u $F6E8 Unused
D $F6E8 Padding before the location graphic script at #R$F744.
  $F6E8,$5C

b $F744 Location Graphic Script: Beside Tylon's Castle
@ $F744 label=LocationGraphicScript_BesideTylonsCastle
D $F744 Location graphic scripts picked by location id in #R$EFFB:
. this entry (beside Tylon's castle; id #N$1B) / #R$F7AA
. (Cavezats cavern; id #N$0E) / #R$F80B (Ogeron's house; id
. #N$01) / #R$F879 (edge of a large forest; id #N$02) /
. #R$F8CA (Urga-Maul dungeon; id #N$0B). Drawn through #R$EEF1
. using character codes into #R$F228.
  $F744,$66
@ $F7AA label=LocationGraphicScript_CavezatsCavern
  $F7AA,$61
@ $F80B label=LocationGraphicScript_OgeronsHouse
  $F80B,$6E
@ $F879 label=LocationGraphicScript_EdgeOfALargeForest
  $F879,$51
@ $F8CA label=LocationGraphicScript_UrgaMaulDungeon
  $F8CA,$57

u $F921 Unused
D $F921 Padding before the commands table at #R$F99C.
  $F921,$7B

t $F99C Table: Commands
@ $F99C label=Table_Commands
D $F99C CR-terminated words searched by #R$ED7E (index
. #N$01-#N$0E). Movement and command handlers are summarised at
. #R$EA60.
  $F99C,$06 "NORTH".
  $F9A2,$05 "EAST".
  $F9A7,$06 "SOUTH".
  $F9AD,$05 "WEST".
  $F9B2,$03 "UP".
  $F9B5,$05 "DOWN".
  $F9BA,$0A "INVENTORY".
  $F9C4,$05 "LOOK".
  $F9C9,$05 "HELP".
  $F9CE,$05 "SAVE".
  $F9D3,$05 "LOAD".
  $F9D8,$05 "QUIT".
  $F9DD,$06 "SCORE".
  $F9E3,$05 "WAIT".

b $F9E8 Work Buffers
@ $F9E8 label=WorkBuffers
D $F9E8 Scratch space before the verb table. Contents left for a
. later PR.
@ $FA00 label=PrimaryWorkBuffer
D $FA00 Work buffer seeded by #R$EEB9 (used by INVENTORY / LOOK).
@ $FA2D label=SecondaryWorkBuffer
D $FA2D Work buffer seeded by #R$EEE7.

t $FAA9 Table: Verbs
@ $FAA9 label=Table_Verbs
D $FAA9 #HTML(CR-terminated words searched by #R$ED2D (index
. #N$01-#N$2E). BASIC dispatches via <code>GO TO n*100+1000</code>;
. all verb handlers are summarised at #R$EA60.)
  $FAA9,$04 "GET".
  $FAAD,$05 "TAKE".
  $FAB2,$05 "DROP".
  $FAB7,$08 "EXAMINE".
  $FABF,$07 "SEARCH".
  $FAC6,$07 "ATTACK".
  $FACD,$05 "KILL".
  $FAD2,$06 "ENTER".
  $FAD8,$03 "GO".
  $FADB,$04 "SAY".
  $FADF,$06 "CLIMB".
  $FAE5,$04 "TIE".
  $FAE9,$06 "THROW".
  $FAEF,$05 "WEAR".
  $FAF4,$07 "REMOVE".
  $FAFB,$07 "UNLOCK".
  $FB02,$05 "OPEN".
  $FB07,$06 "CLOSE".
  $FB0D,$05 "READ".
  $FB12,$05 "LOCK".
  $FB17,$05 "SWIM".
  $FB1C,$05 "GIVE".
  $FB21,$05 "PULL".
  $FB26,$05 "MOVE".
  $FB2B,$05 "LOOK".
  $FB30,$05 "PUSH".
  $FB35,$04 "EAT".
  $FB39,$06 "LIGHT".
  $FB3F,$0B "EXTINGUISH".
  $FB4A,$05 "TURN".
  $FB4F,$04 "HIT".
  $FB53,$04 "PUT".
  $FB57,$04 "DIG".
  $FB5B,$04 "DIP".
  $FB5F,$04 "RUB".
  $FB63,$07 "LISTEN".
  $FB6A,$06 "SHOOT".
  $FB70,$05 "CAST".
  $FB75,$06 "LEAVE".
  $FB7B,$04 "ROW".
  $FB7F,$07 "INSERT".
  $FB86,$06 "UNTIE".
  $FB8C,$06 "BREAK".
  $FB92,$06 "SWING".
  $FB98,$05 "BAIL".
  $FB9D,$04 "USE".

u $FBA1 Unused
D $FBA1 Three unused bytes before #R$FBA4.
  $FBA1,$03

t $FBA4 Token: "THE"
@ $FBA4 label=Token_THE
D $FBA4 #HTML(Literal <code>THE</code> skipped by #R$EDAF while advancing
. tokens.)
  $FBA4,$04 "THE".

t $FBA8 Table: Prepositions
@ $FBA8 label=Table_Prepositions
D $FBA8 CR-terminated words searched by #R$ED65 (index
. #N$01-#N$07).
  $FBA8,$03 "TO".
  $FBAB,$05 "INTO".
  $FBB0,$05 "ONTO".
  $FBB5,$05 "WITH".
  $FBBA,$05 "OVER".
  $FBBF,$07 "ACROSS".
  $FBC6,$05 "FROM".

u $FBCB Unused
D $FBCB Padding before the noun table at #R$FBF4.
  $FBCB,$29

t $FBF4 Table: Nouns
@ $FBF4 label=Table_Nouns
D $FBF4 CR-terminated words searched by #R$ED71 (index
. #N$01-#N$42).
  $FBF4,$05 "DOOR".
  $FBF9,$04 "RED".
  $FBFD,$06 "GREEN".
  $FC03,$05 "BLUE".
  $FC08,$06 "SMALL".
  $FC0E,$05 "CAGE".
  $FC13,$09 "TRAPDOOR".
  $FC1C,$06 "CHEST".
  $FC22,$08 "DRAWERS".
  $FC2A,$05 "DESK".
  $FC2F,$07 "BOTTLE".
  $FC36,$05 "IDOL".
  $FC3B,$07 "CAVERN".
  $FC42,$06 "WALLS".
  $FC48,$07 "GROUND".
  $FC4F,$0B "VEGETATION".
  $FC5A,$05 "SAND".
  $FC5F,$06 "BEACH".
  $FC65,$0B "STALAGMITE".
  $FC70,$05 "DEAD".
  $FC75,$09 "TUNGSTEN".
  $FC7E,$09 "CRUCIBLE".
  $FC87,$08 "FURNACE".
  $FC8F,$04 "BED".
  $FC93,$08 "BEDPOST".
  $FC9B,$08 "DUNGEON".
  $FCA3,$05 "LAIR".
  $FCA8,$05 "RAGS".
  $FCAD,$07 "DEBRIS".
  $FCB4,$09 "SKELETON".
  $FCBD,$06 "RIVER".
  $FCC3,$05 "BANK".
  $FCC8,$06 "STONE".
  $FCCE,$05 "WARD".
  $FCD3,$07 "BRIDGE".
  $FCDA,$06 "WATER".
  $FCE0,$05 "BOAT".
  $FCE5,$09 "KENTILLA".
  $FCEE,$05 "TREE".
  $FCF3,$05 "ROPE".
  $FCF8,$06 "BLACK".
  $FCFE,$05 "SACK".
  $FD03,$06 "TORCH".
  $FD09,$05 "DIAL".
  $FD0E,$07 "BARREL".
  $FD15,$07 "LIQUID".
  $FD1C,$05 "FIRE".
  $FD21,$06 "MAGIC".
  $FD27,$05 "CURE".
  $FD2C,$05 "HEAL".
  $FD31,$05 "IRON".
  $FD36,$04 "ROD".
  $FD3A,$09 "TIMANDRA".
  $FD43,$08 "SAGAGOO".
  $FD4B,$06 "HELLO".
  $FD51,$04 "ALL".
  $FD55,$0B "EVERYTHING".
  $FD60,$05 "EARS".
  $FD65,$06 "FLOOR".
  $FD6B,$05 "ARMS".
  $FD70,$09 "GARGOYLE".
  $FD79,$07 "STATUE".
  $FD80,$07 "BUTTON".
  $FD87,$03 "ME".
  $FD8A,$08 "HISHARA".
  $FD92,$0A "WATERFALL".

b $FD9C Undocumented Bytes
@ $FD9C label=BytesBeforeVocabulary6
D $FD9C Bytes between the noun table and #R$FDE8; left for a later
. PR.


b $FDE8 Location Graphic Scripts
@ $FDE8 label=LocationGraphicScripts
D $FDE8 Message scripts consumed by #R$EEF1 / #R$EFA4. They are not
. English prose: the "characters" are UDG/charset indices that draw the
. illustrated location art. Control codes match the table at #R$EEF1.
D $FDE8 #TABLE(default,centre,centre,centre)
. { =h Id | =h Entry | =h Summary }
. { #N$00 | #R$FDE8 | Attr #N($0C), digit/punct rows }
. { #N$01 | #R$FE12 | Attr #N($0C), punct/symbol rows }
. { #N$03 | #R$FE2D | Attr #N($27), two glyphs }
. { #N$04 | #R$FE37 | Attr #N($27), three glyphs }
. { #N$05 | #R$FE41 | Attr #N$28/#N$38 glyph band }
. TABLE#
B $FDE8,$2A Sub-script #N$00.
@ $FE12 label=LocationGraphicScript_Punctuation
B $FE12,$1B Sub-script #N$01.
@ $FE2D label=LocationGraphicScript_DualGlyph
B $FE2D,$0A Sub-script #N$03.
@ $FE37 label=LocationGraphicScript_TripleGlyph
B $FE37,$0A Sub-script #N$04.
@ $FE41 label=LocationGraphicScript_GlyphStrip
B $FE41,$0117 Sub-script #N$05 and trailing location-graphic bytes.

b $FF58 User-Defined Graphics
@ $FF58 label=UserDefinedGraphics
D $FF58 The UDG area pointed to by #SKOOLKID$5C7B(UDG). Location
. graphic scripts above also reuse these bytes as glyph data.

c $FFFB ROM Return Stub
@ $FFFB label=RomReturnStub
D $FFFB #HTML(Two <code>DEC SP</code> instructions and a jump to ROM
. #SKOOLKID$1B7D(STMT_RET). The Mastertronic reissue POKEs the same five bytes
. before its ROM loads; on this Micromega image they arrive with the final
. support block.)
  $FFFB,$02 Decrease #REGsp by two.
  $FFFD,$03 Jump to #SKOOLKID$1B7D(STMT_RET).
