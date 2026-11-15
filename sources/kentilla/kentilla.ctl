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
@ $4000 label=Loading
D $4000 This disassembly covers Kentilla (Micromega, 1984), using the
. archived Micromega-release tape image labelled ‘Corrected by Mikie’. All of
. its tape data blocks match TOSEC’s Micromega image byte for byte.
N $4000 #UDGTABLE
. { =h Kentilla Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

g $5B00 Print Left Margin Column
@ $5B00 label=PrintLeftMarginColumn
D $5B00 Remembers the left-margin column for #R$EEF1 newline
. (#N$1D) and sub-message (#N$1F) handling.
  $5B00,$01

g $5B01 Location Id
@ $5B01 label=LocationId
D $5B01 Current location. BASIC writes this before #R$EA87.
  $5B01,$01

i $5B02

g $5BA0 Parser List Pointer
@ $5BA0 label=ParserState
D $5BA0 Copy of #SKOOLKID$5C57(NSPPC) kept while walking a BASIC list.
  $5BA0,$02

g $5BA2 Parser Work Pointer
@ $5BA2 label=ParserState_WorkPointer
D $5BA2 Pointer into the work buffer at #R$FA00 or #R$FA2D.
  $5BA2,$02

g $5BA4 Parser Match Length
@ $5BA4 label=ParserState_MatchLength
D $5BA4 Characters required to accept a vocabulary match.
  $5BA4,$01

g $5BA5 Parser Word Index
@ $5BA5 label=ParserState_WordIndex
D $5BA5 Index of the matched word, returned to BASIC.
  $5BA5,$01

u $5BA6
  $5BA6,$01

g $5BA7 Token Start Pointer
@ $5BA7 label=InputBuffer_TokenStart
D $5BA7 Pointer to the current token in #R$5BAE.
  $5BA7,$02

g $5BA9 Next Token Pointer
@ $5BA9 label=InputBuffer_NextToken
D $5BA9 Pointer to the next token in #R$5BAE.
  $5BA9,$02

g $5BAB Parser Token Character
@ $5BAB label=ParserState_TokenChar
D $5BAB First character of the current token.
  $5BAB,$01

g $5BAC Parser Token Delimiter
@ $5BAC label=ParserState_TokenDelimiter
D $5BAC Character that ended the current token.
  $5BAC,$01

g $5BAD Parser Entry Count
@ $5BAD label=ParserState_EntryCount
D $5BAD Number of entries to scan in the current BASIC list.
  $5BAD,$01

g $5BAE Input Buffer
@ $5BAE label=InputBuffer
D $5BAE Line buffer filled by #R$EB51. Holds up to #N$3E characters
. plus a trailing #N$0D written on ENTER.
  $5BAE,$3F

i $5BED

g $5BF5 Print Attribute
@ $5BF5 label=PrintState
D $5BF5 Attribute byte written by #R$EA8D unless bit 1 of #R$5BF6 is
. set.
  $5BF5,$01

g $5BF6 Print Flags
@ $5BF6 label=PrintState_Flags
D $5BF6 #HTML(Bit 0 selects <code>XOR</code> vs copy, bit 1 skips
. attributes, bit 2 selects <code>OR</code> vs <code>XOR</code>.)
  $5BF6,$01

g $5BF7 Print Column
@ $5BF7 label=PrintState_Column
D $5BF7 Print column (#N$00-#N$1F), paired with #R$5BF8 as #REGbc.
  $5BF7,$01

g $5BF8 Print Row
@ $5BF8 label=PrintState_Row
D $5BF8 Print row (#N$00-#N$17), paired with #R$5BF7 as #REGbc.
  $5BF8,$01

g $5BF9 Print Character
@ $5BF9 label=PrintState_Character
D $5BF9 Character code plotted by #R$EA8D.
  $5BF9,$01

g $5BFA Input Cursor Index
@ $5BFA label=InputLineState
D $5BFA Index of the cursor in #R$5BAE.
  $5BFA,$01

g $5BFB Input Line Length
@ $5BFB label=InputLineState_Length
D $5BFB Length of the current input line.
  $5BFB,$01

g $5BFC Input Previous Key
@ $5BFC label=InputLineState_LastKey
D $5BFC Last #SKOOLKID$5C00(KSTATE) value, for edge detection.
  $5BFC,$01

g $5BFD Input Dirty Flag
@ $5BFD label=InputLineState_Dirty
D $5BFD Set when the line has changed since the last redraw.
  $5BFD,$01

g $5BFE Input Saved Length
@ $5BFE label=InputLineState_SavedLength
D $5BFE Length saved by Caps Shift + 1.
  $5BFE,$01

i $5BFF

i $5C00

b $5CCB BASIC Program
@ $5CCB label=BasicProgram
D $5CCB Kentilla by Derek Brewster, published by Micromega in 1984. It is
. the sequel to Velnor's Lair in his "Myths and Legends of Caraland" pair; see
. also #FACT(reviewer,Reviewed With His Own Ratings).
N $5CCB #HTML(The game is driven from BASIC. After the custom tape loader has
. finished, line 113 prints <code>What now?</code> and calls into the support
. code with <code>LET A=USR</code> #R$EA66 and <code>LET A=USR</code>
. #R$EA6C. Verb and command indices from #R$EA60 / #R$EA63 / #R$EA6F are
. dispatched in BASIC (see #R$EA60).)
N $5CCB #HTML(The original Micromega tape uses a REM bootstrap at
. <code>#R$5CCB(#N$5CD0)</code> and a Micromega 1.1 loader at #R$E9B6; both are
. overwritten by the time this snapshot is taken. See the
. #LINK(loader-Index)(Loading Code) page.)
N $5CCB See the recovered listing on the #LINK(Basic)(BASIC listing) page.
  $5CCB,$22 Line 1: SAVE "KENTILLA"CODE VAL "16384",VAL "43037".
  $5CED,$41 Line 2: POKE VAL "23659",z: LET n=PEEK VAL "23613"+VAL "256"*PEEK
. VAL "23614": POKE n,VAL "251": POKE n+o,wvv.
  $5D2E,$2D Line 3: POKE VAL "23624",z: PRINT AT (q*w)+r,z: LOAD ""CODE : POKE
. VAL "23659",w.
  $5D5B,$20 Line 5: GO SUB 9000: LET m=G: GO SUB 350.
  $5D7B,$1E Line 100: RANDOMIZE : GO SUB 6000: GO SUB 6300.
  $5D99,$19 Line 101: GO SUB E: IF co<>w THEN GO SUB 6210.
  $5DB2,$0E Line 102: RANDOMIZE : IF sp THEN GO SUB sp.
  $5DC0,$10 Line 103: GO SUB 6830.
  $5DD0,$52 Line 104: IF o(27) THEN LET o(27)=o(27)-o: IF o(27) THEN PRINT "The
. staff is glowing.".
  $5E22,$1D Line 105: IF O(28) THEN GO SUB 6800.
  $5E3F,$0D Line 106: LET go=go+O.
  $5E4C,$15 Line 112: IF NOT hp THEN GO TO 6700.
  $5E61,$37 Line 113: GO SUB e: PRINT INK s;"What now?": LET A=USR 60006: LET
. A=USR 60012.
  $5E98,$31 Line 120: IF PEEK 23468=13 THEN GO SUB 300: GO TO 100.
  $5EC9,$1D Line 130: RANDOMIZE : GO SUB 1000: GO TO 100.
  $5EE6,$26 Line 200: LET A=USR 60012: LET x=USR 60009: RETURN.
  $5F0C,$14 Line 310: LET m=USR 60015.
  $5F20,$15 Line 320: IF NOT m THEN PRINT "Pardon?": RETURN.
  $5F35,$1A Line 325: IF M>6 THEN GO TO 400.
  $5F4F,$15 Line 330: LET j=op: GO SUB 990.
  $5F64,$2D Line 341: IF NP=Z THEN PRINT "I CAN'T GO IN THAT DIRECTION.":
. RETURN.
  $5F91,$15 Line 342: IF se THEN GO SUB se: IF np=op THEN RETURN.
  $5FA6,$0B Line 343: IF NOT hp THEN RETURN.
  $5FB1,$67 Line 350: CLS : LET op=np: GO SUB 8100: IF DA THEN PRINT AT 7,0:
. POKE 23297,OP: RANDOMIZE USR 60039: GO SUB OP+9900: GO TO 360.
  $6018,$3D Line 351: PRINT "It's very dark. I can't see"'"anything.": PRINT AT
. s,z: GO TO VAL "372".
  $6055,$180 Line 360: INK V: RESTORE 9800+OP: READ A$: PRINT "EXITS : ";"NORTH
. " AND VAL A$( TO 2) AND VAL A$( TO 2)<75;"EAST " AND VAL A$(3 TO 4) AND VAL
. A$(3 TO 4)<75;"SOUTH " AND VAL A$(5 TO 6) AND VAL A$(5 TO 6)<75;"WEST " AND
. VAL A$(7 TO 8) AND VAL A$(7 TO 8)<75;"UP " AND VAL A$(9 TO 10) AND VAL A$(9 TO
. 10)<75;"DOWN " AND VAL A$(11 TO 12) AND VAL A$(11 TO 12)<75.
  $61D5,$35 Line 361: IF VAL A$( TO w)>74 THEN READ V$,N: GO SUB 369: PRINT V$;"
. NORTH ".
  $620A,$35 Line 362: IF VAL A$(R TO F)>74 THEN READ V$,N: GO SUB 369: PRINT
. V$;" EAST ".
  $623F,$36 Line 363: IF VAL A$(V TO I)>74 THEN READ V$,N: GO SUB 369: PRINT
. V$;" SOUTH ".
  $6275,$37 Line 364: IF VAL A$(OO TO OW)>75 THEN READ V$,N: GO SUB 369: PRINT
. V$;" DOWN ".
  $62AC,$40 Line 365: IF VAL A$(7 TO 8)>75 THEN READ V$,N: GO SUB 369: PRINT
. V$;" WEST".
  $62EC,$1E Line 366: INK I: IF PEEK 23689>OI THEN PRINT AT S,Z.
  $630A,$0F Line 367: GO TO 370.
  $6319,$3E Line 369: PRINT "  ";"OPEN " AND O(N)=w;"CLOSED " AND O(N)<w;"BROKEN
. " AND O(N)=r;: RETURN.
  $6357,$0F Line 370: GO SUB 445.
  $6366,$10 Line 371: GO SUB 6500.
  $6376,$4F Line 372: LET NP=Z: RESTORE 9800+OP: READ A$: IF LEN A$>OW THEN GO
. SUB 9500+V*VAL (A$(OR TO OF)): IF NP THEN GO TO 350.
  $63C5,$06 Line 375: RETURN.
  $63CB,$14 Line 410: IF M<>S THEN GO TO 440.
  $63DF,$46 Line 411: LET no=W: PRINT INK 7;"I'm carrying :": POKE 23549,WVV:
. LET x=USR 60024.
  $6425,$0F Line 420: GO SUB 455.
  $6434,$10 Line 422: IF no=w THEN LET no=O.
  $6444,$36 Line 425: POKE 23549,254: LET x=USR 60024: GO TO 455.
  $647A,$14 Line 440: IF m<>G THEN GO TO 500.
  $648E,$16 Line 441: LET NP=OP: GO TO 350.
  $64A4,$0A Line 445: LET n=op.
  $64AE,$37 Line 450: POKE 23549,n: LET no=o: PRINT INK s;"I see :": LET x=USR
. 60024.
  $64E5,$6E Line 455: IF x THEN RESTORE 9700+x: READ a$: GO SUB E: PRINT "  
. ";"The " AND VAL a$(O);a$(w TO );" (worn)" AND PEEK (t+x)=wvf: LET no=Z: LET
. x=USR 60027: GO TO 455.
  $6553,$1A Line 460: LET co=w: LET x=USR 60030.
  $656D,$70 Line 465: IF x THEN RESTORE 9600+x: LET co=z: READ a$: GO SUB e:
. PRINT "   ";"The " AND VAL a$(O);"dead " AND NOT PEEK (m2+X);a$(w TO ): LET
. no=Z: LET x=USR 60027: GO TO 465.
  $65DD,$15 Line 470: IF NO=O THEN PRINT "NOTHING".
  $65F2,$06 Line 499: RETURN.
  $65F8,$13 Line 500: IF m=ow THEN GO TO VAL "6900".
  $660B,$17 Line 501: IF m=of THEN PRINT "I wait.": RETURN.
  $6622,$2C Line 505: IF m=or THEN PRINT INK s;"You have completed ";l;"%":
. RETURN.
  $664E,$27 Line 520: IF m=q THEN PRINT "Sorry, I can't help you.": RETURN.
  $6675,$7C Line 540: IF m=oz THEN LET np=op: SAVE "1"CODE VAL "64e3",c: POKE
. VAL "23736",VAL "181": SAVE "2"CODE PEEK VAL "23627"+VAL "256"*PEEK VAL
. "23628",VAL "700": POKE VAL "23736",VAL "181": SAVE "3"CODE VAL "23552",c: GO
. TO h.
  $66F1,$1E Line 560: PRINT FLASH o; INK s;"LOAD GAME (Y OR N)?".
  $670F,$13 Line 565: IF INKEY$="n" OR INKEY$="N" THEN RETURN.
  $6722,$19 Line 570: IF INKEY$<>"y" AND INKEY$<>"Y" THEN GO TO VAL "565".
  $673B,$34 Line 580: CLS : PRINT AT r,oo;"START TAPE": INK o: LOAD "1"CODE :
. LOAD "2"CODE : LOAD "3"CODE : INK i: RETURN.
  $676F,$43 Line 990: RESTORE 9800+j: READ a$: LET np=VAL (a$(w*m-o TO w*m)): IF
. np<75 THEN GO TO 993.
  $67B2,$27 Line 992: RESTORE 9800+np: READ a,np: IF o(a)<w THEN LET np=z.
  $67D9,$2A Line 993: IF m=w AND j=42 AND PEEK (T+oi)=wvf THEN LET np=VAL "43".
  $6803,$06 Line 994: RETURN.
  $6809,$14 Line 1010: LET n=USR 60003.
  $681D,$3F Line 1020: IF n THEN LET A=USR 60012: LET x=USR 60009: GO TO
. n*100+1000.
  $685C,$1D Line 1050: PRINT "I don't understand ": RETURN.
  $6879,$10 Line 1101: GO TO 1200.
  $6889,$10 Line 1102: GO TO 1150.
  $6899,$3D Line 1105: RESTORE 9701: POKE 23469,45: LET A$="": LET N=USR 60018.
  $68D6,$0A Line 1110: IF NOT N THEN RETURN.
  $68E0,$23 Line 1115: READ a$: LET a$=("The " AND VAL a$(O))+a$(W TO ).
  $6903,$18 Line 1120: IF P=WVR AND PEEK (T+N)>WVR THEN RETURN.
  $691B,$16 Line 1125: IF PEEK (T+N)=P OR P=WVW THEN RETURN.
  $6931,$20 Line 1130: LET N=USR 60021: GO TO 1110.
  $6951,$3D Line 1155: RESTORE 9601: POKE 23469,35: LET A$="": LET N=USR 60018.
  $698E,$0A Line 1160: IF NOT N THEN RETURN.
  $6998,$41 Line 1165: READ A$: LET A$=("The " AND (VAL a$(O) OR NOT PEEK
. (m2+n)))+("dead " AND NOT PEEK (m2+n))+a$(W TO ).
  $69D9,$17 Line 1170: IF PEEK (m1+n)=p OR p=WVW THEN RETURN.
  $69F0,$20 Line 1175: LET n=USR 60021: GO TO 1160.
  $6A10,$27 Line 1180: IF j>26 THEN PRINT "It has no effect.": RETURN.
  $6A37,$27 Line 1202: IF x=56 OR x=57 THEN GO TO 1270.
  $6A5E,$2A Line 1205: LET p=WVW: GO SUB 1105: IF a$="" THEN GO TO 1235.
  $6A88,$44 Line 1207: IF a$="The ROPE" AND PEEK (T+3)=201 THEN POKE t+3,op: GO
. TO 1211.
  $6ACC,$29 Line 1209: IF n=20 THEN PRINT "It's far too heavy.": RETURN.
  $6AF5,$0C Line 1210: IF NOT n THEN GO TO ee.
  $6B01,$38 Line 1211: IF op=PEEK (t+n) OR (PEEK (t+n)=82 AND PEEK (t+F)=WVV)
. THEN GO TO 1220.
  $6B39,$A6 Line 1212: IF (PEEK (t+n)=80 AND OP=42 AND NOT o(16)) OR (PEEK
. (t+n)=81 AND PEEK (t+28)=WVV) OR (PEEK (t+n)=83 AND OP=43 AND O(OF)=W) OR
. (PEEK (t+n)=84 AND OP=OR AND O(OR)=W) THEN GO TO 1220.
  $6BDF,$53 Line 1215: IF (PEEK (t+n)<>85 OR OP<>41) AND (PEEK (t+n)<>86 OR
. OP<>55) THEN GO SUB VAL "1130": GO TO VAL "1210".
  $6C32,$2C Line 1220: IF ob<G THEN LET ob=ob+O: POKE t+n,WVV: PRINT "I take
. ";a$: RETURN.
  $6C5E,$21 Line 1221: PRINT "I can't carry any more.": RETURN.
  $6C7F,$1B Line 1235: IF x=20 THEN GO SUB 200.
  $6C9A,$16 Line 1239: LET p=op: GO SUB 1102.
  $6CB0,$14 Line 1240: IF NOT n THEN GO TO 3830.
  $6CC4,$22 Line 1245: IF PEEK (m2+n) THEN PRINT "I can't get ";a$: RETURN.
  $6CE6,$1C Line 1248: IF ob>7 THEN GO TO 1221.
  $6D02,$2C Line 1250: LET ob=ob+v: PRINT "I get ";a$: POKE m1+n,255: RETURN.
  $6D2E,$3C Line 1270: POKE 23549,OP: LET N=USR 60024: IF N=20 THEN GO TO 1286.
  $6D6A,$23 Line 1275: IF NOT n THEN PRINT "I see nothing to get.": RETURN.
  $6D8D,$16 Line 1280: IF oB>S THEN GO TO 1221.
  $6DA3,$2F Line 1285: GO SUB 1370: PRINT "I get ";a$: LET ob=ob+o: POKE
. t+n,wvv.
  $6DD2,$2C Line 1286: LET n=USR 60027: IF n=20 THEN GO TO 1286.
  $6DFE,$13 Line 1287: IF n THEN GO TO 1280.
  $6E11,$06 Line 1290: RETURN.
  $6E17,$27 Line 1302: IF x=56 OR x=57 THEN GO TO 1350.
  $6E3E,$2A Line 1305: LET p=wvr: GO SUB 1105: IF a$="" THEN GO TO 1320.
  $6E68,$0C Line 1310: IF NOT n THEN GO TO cc.
  $6E74,$25 Line 1315: LET OB=OB-O: POKE t+n,op: PRINT "I drop ";a$: RETURN.
  $6E99,$34 Line 1320: LET p=255: GO SUB 1102: IF a$="" THEN PRINT "Drop what?":
. RETURN.
  $6ECD,$29 Line 1325: IF n THEN POKE m1+n,op: LET ob=ob-v: PRINT "I drop ";a$:
. RETURN.
  $6EF6,$19 Line 1330: PRINT "I don't have"'a$: RETURN.
  $6F0F,$2B Line 1350: POKE 23549,255: LET n=USR 60024.
  $6F3A,$3B Line 1355: IF n THEN GO SUB 1370: GO SUB 1315: LET n=USR 60027: GO
. TO 1355.
  $6F75,$1E Line 1360: IF PEEK 23549=254 THEN RETURN.
  $6F93,$37 Line 1365: POKE 23549,254: LET n=USR 60024: GO TO 1355.
  $6FCA,$42 Line 1370: GO SUB e: RESTORE 9700+n: READ a$: LET a$=("The " AND VAL
. a$(1))+a$(2 TO ): RETURN.
  $700C,$10 Line 1400: GO TO 1500.
  $701C,$2C Line 1409: GO SUB 1370: PRINT "I've found ";a$: POKE T+N,op: RETURN.
  $7048,$50 Line 1410: IF (x=59 OR X=15 OR X=26) AND OP=11 AND NOT PEEK (T+2)
. THEN LET n=W: GO TO VAL "1409".
  $7098,$3D Line 1415: IF X=24 AND op=43 AND NOT PEEK (T+10) THEN LET n=oz: GO
. TO 1409.
  $70D5,$6A Line 1416: IF x=23 AND op=42 THEN PRINT "It is a small furnace with
. a"'"dial turned to ";"off." AND NOT o(oi);"on." AND o(oi): RETURN.
  $713F,$5B Line 1420: IF (X=15 OR X=27 OR X=59) AND OP=52 AND NOT PEEK (T+ov)
. THEN LET N=ov: LET o(VAL "28")=o: GO TO 1409.
  $719A,$4B Line 1422: IF x=12 AND op=57 THEN PRINT "It has a small hole in its
. left shoulder.": RETURN.
  $71E5,$39 Line 1425: IF X=9 AND NOT PEEK (T+16) AND OP=41 THEN LET N=OI: GO TO
. VAL "1409".
  $721E,$41 Line 1430: IF X=28 AND OP=44 AND NOT PEEK (T+6) THEN LET N=6: GO TO
. 1409.
  $725F,$78 Line 1431: IF NOT o(9) AND (x=61 OR x=62) AND op=44 THEN PRINT "It
. is a hideous beast, with armsraised as if ready to pounce.": RETURN.
  $72D7,$28 Line 1435: IF X<>16 OR OP<>47 THEN GO TO 1445.
  $72FF,$35 Line 1440: IF NOT PEEK (T+20) THEN LET o(OO)=O: LET N=20: GO TO
. 1409.
  $7334,$2C Line 1442: IF NOT PEEK (T+21) THEN LET n=21: GO TO 1409.
  $7360,$43 Line 1445: IF X=29 AND OP=58 AND NOT PEEK (T+22) AND o(oo) THEN LET
. N=VAL "22": GO TO VAL "1409".
  $73A3,$62 Line 1446: IF PEEK (t+4)=wvv AND (x=41 OR x=42) THEN PRINT "It's a
. magic sack. Items in it  weigh nothing.": RETURN.
  $7405,$44 Line 1447: IF X=25 AND NOT PEEK (T+11) AND OP=43 THEN LET N=oo: LET
. l=l+v: GO TO 1409.
  $7449,$5F Line 1455: IF (X=13 OR X=14 OR X=43) AND NOT PEEK (T+29) AND OP=14
. THEN LET N=VAL "29": LET l=l+w: GO TO 1409.
  $74A8,$50 Line 1465: IF X=31 AND (OP=8 OR OP=17) AND NOT PEEK (T+43) THEN LET
. n=43: GO TO 1409.
  $74F8,$29 Line 1470: LET P=OP: GO SUB 1102: IF A$="" THEN GO TO 1498.
  $7521,$1D Line 1475: IF NOT N THEN PRINT "I don't see ";a$: RETURN.
  $753E,$10 Line 1478: IF PEEK (m2+n) THEN GO TO u.
  $754E,$4A Line 1480: PRINT "I find ";: POKE 23549,100+n: LET n=USR 60024: IF
. NOT n THEN PRINT "nothing": RETURN.
  $7598,$1E Line 1485: POKE t+n,op: GO SUB 1370: PRINT a$: RETURN.
  $75B6,$0E Line 1498: IF NOT n AND NOT x THEN GO TO u.
  $75C4,$21 Line 1499: PRINT "I find nothing unusual.": RETURN.
  $75E5,$13 Line 1501: IF X THEN GO TO 1410.
  $75F8,$1E Line 1503: LET P=wvr: GO SUB b: IF a$="" THEN GO TO VAL "1470".
  $7616,$0C Line 1505: IF NOT n THEN GO TO cc.
  $7622,$38 Line 1511: IF N=O THEN PRINT "The name KENTILLA is engraved onthe
. hilt.": RETURN.
  $765A,$1E Line 1512: IF N=W THEN PRINT "It's very soft.": RETURN.
  $7678,$49 Line 1516: IF n=i AND NOT PEEK (t+VAL "31") THEN PRINT "It looks
. valuable, it's studded with diamonds.": RETURN.
  $76C1,$36 Line 1522: IF n=ow THEN PRINT "It is black with gold
. runic"'"designs.": RETURN.
  $76F7,$40 Line 1523: IF n=or THEN PRINT "It has inscribed on it -"'" STOLEN
. FROM ALADDIN.": RETURN.
  $7737,$26 Line 1524: IF n=of THEN PRINT "It is a healing plant.": RETURN.
  $775D,$51 Line 1528: IF n=oq AND da THEN PRINT "It's giving me a strange image
.  but I can't quite make it out.": RETURN.
  $77AE,$3C Line 1529: IF N=OQ THEN PRINT "It gives me the image of the"'"word
. SAGAGOO.": RETURN.
  $77EA,$3D Line 1535: IF N=17 OR N=33 OR N=40 OR N=42 THEN GO TO 2915.
  $7827,$34 Line 1540: IF N=S THEN PRINT "It's translucent and about 30
. cmwide.": RETURN.
  $785B,$10 Line 1590: GO TO 1499.
  $786B,$1D Line 1701: IF NOT da THEN PRINT "It's too dark.": RETURN.
  $7888,$19 Line 1705: LET P=OP: GO SUB b-r: IF A$="" THEN GO TO u.
  $78A1,$0C Line 1710: IF NOT n THEN GO TO ee.
  $78AD,$26 Line 1712: IF NOT PEEK (M2+N) THEN PRINT "I can't attack "'a$:
. RETURN.
  $78D3,$32 Line 1715: IF PEEK (T+o)<>wvv AND PEEK (T+V)<>WVV THEN PRINT "I have
. no weapon.": RETURN.
  $7905,$14 Line 1720: PRINT "I attack ";a$.
  $7919,$1C Line 1725: IF CO=z THEN LET CO=o: LET MO=PEEK (M3+N).
  $7935,$31 Line 1730: POKE M2+N,PEEK (M2+N)-OZ*RND: IF PEEK (M2+N)>VAL "230"
. THEN POKE (M2+N),Z.
  $7966,$38 Line 1735: PRINT a$;" is injured." AND PEEK (M2+N);" is killed." AND
. NOT PEEK (M2+N): RETURN.
  $799E,$20 Line 1910: IF x=VAL "66" AND OP=oi THEN LET NP=VAL "69": GO TO H.
  $79BE,$10 Line 1920: IF x<>VAL "37" THEN GO TO U.
  $79CE,$21 Line 1923: IF Op>VAL "70" THEN PRINT "I already am!": RETURN.
  $79EF,$33 Line 1924: IF o(oo)=o THEN PRINT "No point, it's not in the water.":
. RETURN.
  $7A22,$2F Line 1925: IF O(oo) AND (OP=VAL "47" OR OP=VAL "48") THEN LET
. Op=op+VAL "26": GO TO K.
  $7A51,$14 Line 1930: PRINT "What boat?": RETURN.
  $7A65,$1E Line 2001: LET m=USR 6e4: IF m THEN GO TO VAL "2020".
  $7A83,$10 Line 2002: IF X THEN GO TO VAL "2010".
  $7A93,$24 Line 2006: IF USR 60033 THEN PRINT "MISSING """"": RETURN.
  $7AB7,$14 Line 2008: LET X=USR 60009.
  $7ACB,$28 Line 2010: IF X<>38 AND X<>54 THEN PRINT "I talk.": RETURN.
  $7AF3,$1C Line 2011: IF x=54 THEN GO TO 2016.
  $7B0F,$47 Line 2012: IF PEEK (T+O)<>WVV THEN LET ob=ob+O: PRINT "The sword
. teleports to my hand.": POKE T+O,WVV: RETURN.
  $7B56,$07 Line 2014: GO TO y.
  $7B5D,$14 Line 2015: IF PEEK (t+OW)<>WVV THEN GO TO Y.
  $7B71,$14 Line 2016: IF PEEK (t+ow)<>wvv THEN GO TO y.
  $7B85,$10 Line 2018: GO TO 6600.
  $7B95,$16 Line 2020: IF m<>o THEN PRINT "Pardon?": RETURN.
  $7BAB,$23 Line 2022: GO SUB c: LET p=op: GO SUB 1102: IF a$="" THEN GO TO u.
  $7BCE,$0C Line 2024: IF NOT n THEN GO TO ee.
  $7BDA,$26 Line 2026: IF NOT PEEK (m2+n) THEN PRINT "I can't talk to"'a$:
. RETURN.
  $7C00,$24 Line 2027: IF USR 60033 THEN PRINT "Missing """"": RETURN.
  $7C24,$18 Line 2028: PRINT INK s;"I talk to ";a$.
  $7C3C,$21 Line 2030: IF n<oo OR n>26 THEN GO TO 2090.
  $7C5D,$39 Line 2034: LET p=n+c/w: LET b$=a$: LET j=n: LET n=USR 60003: IF NOT
. n THEN GO TO 2080.
  $7C96,$1F Line 2037: GO SUB c: IF n<>22 THEN GO TO 2054.
  $7CB5,$1A Line 2038: GO SUB b: IF a$="" THEN GO TO 2048.
  $7CCF,$0F Line 2040: GO SUB cn: IF m<>o THEN RETURN.
  $7CDE,$1B Line 2042: IF NOT n THEN PRINT b$;" says - ": GO TO cc.
  $7CF9,$1D Line 2044: IF USR 60009<>64 THEN RETURN.
  $7D16,$27 Line 2046: IF n=41 OR n=26 THEN GO TO 2099.
  $7D3D,$3E Line 2047: PRINT b$;" gives me ";CHR$ or AND LEN a$+LEN b$>w+oq;a$:
. POKE n+t,wvv: LET ob=ob+o: GO TO e.
  $7D7B,$12 Line 2048: IF x<>64 THEN RETURN.
  $7D8D,$10 Line 2050: GO SUB c: GO SUB b: IF NOT n THEN RETURN.
  $7D9D,$10 Line 2052: GO TO 2046.
  $7DAD,$15 Line 2054: IF n<>r THEN GO TO 2061.
  $7DC2,$10 Line 2055: GO SUB b: IF a$="" THEN RETURN.
  $7DD2,$14 Line 2056: IF NOT n THEN GO TO 2042.
  $7DE6,$27 Line 2058: IF n=41 OR n=26 THEN GO TO 2099.
  $7E0D,$34 Line 2060: PRINT b$;" drops ";CHR$ or AND LEN a$+LEN b$>23;a$: POKE
. n+t,op: RETURN.
  $7E41,$1B Line 2062: IF n>2 THEN GO TO 2070.
  $7E5C,$16 Line 2064: LET p=op: GO SUB b: IF a$="" THEN RETURN.
  $7E72,$19 Line 2066: IF NOT n THEN PRINT b$;"says -": GO TO cc.
  $7E8B,$38 Line 2068: PRINT b$;" takes ";CHR$ or AND LEN a$+LEN b$>23;a$: POKE
. n+t,c/w+j: GO TO e.
  $7EC3,$1C Line 2070: IF n<>37 THEN GO TO 2099.
  $7EDF,$3B Line 2072: IF PEEK (t+41)<>100+j OR PEEK (t+26)<>100+j THEN RETURN.
  $7F1A,$29 Line 2074: LET p=op: GO SUB b-r: IF a$(oo TO or)="DAR" THEN LET
. n=VAL "31".
  $7F43,$0A Line 2075: IF NOT n THEN RETURN.
  $7F4D,$27 Line 2076: IF n<>31 AND RND>.5 THEN GO TO 2099.
  $7F74,$10 Line 2078: GO TO 4730.
  $7F84,$1C Line 2080: IF j=23 THEN GO TO 8200.
  $7FA0,$30 Line 2081: IF RND>o/w OR USR VAL "60009"=VAL "55" THEN PRINT b$;"
. says - Hello.".
  $7FD0,$06 Line 2082: RETURN.
  $7FD6,$28 Line 2090: IF NOT co AND RND>.7 THEN LET co=o: LET mo=PEEK (m2+n):
. RETURN.
  $7FFE,$06 Line 2095: RETURN.
  $8004,$18 Line 2099: PRINT b$;" says - NO!": RETURN.
  $801C,$58 Line 2105: IF op=27 AND PEEK (M1+26)=op AND mo<>ow THEN LET np=37:
. GO SUB h: PRINT "Zelda and Timandra leave.": RETURN.
  $8074,$17 Line 2110: IF PEEK nn<>OR THEN GO SUB 200.
  $808B,$34 Line 2115: IF (op<>VAL "72" AND op<>VAL "36") OR (x<>VAL "39" AND
. x<>VAL "65") THEN GO TO VAL "2135".
  $80BF,$79 Line 2116: IF PEEK (m2+VAL "26") AND NOT O(o+oq) THEN PRINT "With
. one blast of her fiery"'"breath, Zelda burns me to a pileof smouldering
. ashes.": LET hp=Z: RETURN.
  $8138,$21 Line 2120: IF OP=36 THEN LET NP=72: GO TO h.
  $8159,$21 Line 2125: IF OP=72 THEN LET NP=36: GO TO h.
  $817A,$07 Line 2130: GO TO u.
  $8181,$13 Line 2135: IF x<>40 THEN GO TO u.
  $8194,$1D Line 2140: IF OP=OI THEN LET NP=OV: GO TO 350.
  $81B1,$0E Line 2145: IF OP<>OV THEN GO TO u.
  $81BF,$32 Line 2150: IF NOT O(S) OR O(S)=W THEN PRINT "It's not tied to
. anything.": RETURN.
  $81F1,$63 Line 2155: IF o(S)=O THEN PRINT "The stalagmite breaks!"'"I plunge
. to my death on the"'"jagged rocks below.": LET HP=Z: GO TO E.
  $8254,$0E Line 2160: LET np=OI: GO TO h.
  $8262,$19 Line 2205: IF x<>40 OR op<>ov THEN GO TO U.
  $827B,$25 Line 2206: IF PEEK (t+r)<>wvv THEN PRINT "I have no rope.": RETURN.
  $82A0,$1A Line 2210: IF PEEK nn=or THEN PRINT "To what?": RETURN.
  $82BA,$13 Line 2220: GO SUB C: GO SUB C: IF x<>OQ THEN GO TO U.
  $82CD,$46 Line 2225: PRINT "I tie the rope to a stalagmite.": LET ob=ob-o:
. POKE t+R,C: LET o(S)=o(S)+O: RETURN.
  $8313,$18 Line 2310: LET p=wvv: GO SUB b: IF a$="" THEN GO TO u.
  $832B,$0C Line 2315: IF NOT n THEN GO TO cc.
  $8337,$1C Line 2320: LET ob=ob-o: PRINT "I throw ";a$.
  $8353,$20 Line 2325: IF op<>g AND op<>17 THEN POKE t+n,op: RETURN.
  $8373,$2D Line 2330: IF n=r THEN PRINT "It hangs from a tree.": POKE t+n,c+o:
. RETURN.
  $83A0,$57 Line 2335: IF RND>.5 THEN PRINT "It lands in the river and
. is"'"carried down stream.": POKE t+n,16: RETURN.
  $83F7,$48 Line 2340: PRINT "It lands on the opposite river  bank.": POKE
. t+n,g*(op=os)+os*(op=g): RETURN.
  $843F,$1C Line 2410: LET p=253: GO SUB b: IF NOT n THEN GO TO cc.
  $845B,$3E Line 2420: IF N<>i AND N<>oz AND N<>16 AND N<>39 THEN PRINT "I can't
. wear the ";a$: RETURN.
  $8499,$29 Line 2430: IF PEEK (t+n)=254 THEN PRINT "I already am.": RETURN.
  $84C2,$14 Line 2440: IF PEEK (t+n)<>WVV THEN GO TO CC.
  $84D6,$27 Line 2450: PRINT "I wear the ";a$: POKE t+n,254: RETURN.
  $84FD,$14 Line 2510: LET p=252: GO SUB b.
  $8511,$0B Line 2520: IF NOT n THEN GO TO U.
  $851C,$29 Line 2525: IF N=31 AND PEEK nn<>13 THEN GO TO 2550.
  $8545,$3A Line 2530: IF PEEK (t+n)<>254 THEN PRINT "I'm not wearing ";CHR$ or
. AND LEN a$>oi;a$: RETURN.
  $857F,$23 Line 2540: POKE t+n,WVV: PRINT "I remove the ";a$: RETURN.
  $85A2,$1D Line 2550: GO SUB cn: IF m<>s THEN PRINT "From what?": RETURN.
  $85BF,$48 Line 2555: LET p=WVV: GO SUB b: IF n=i THEN PRINT "I remove the
. diamonds.": LET ob=ob+o: POKE t+31,wvv: RETURN.
  $8607,$07 Line 2560: GO TO U.
  $860E,$10 Line 2610: GO SUB 2650.
  $861E,$0A Line 2615: IF NOT j THEN RETURN.
  $8628,$20 Line 2620: IF O(j) THEN PRINT "It's not locked.": RETURN.
  $8648,$25 Line 2625: GO SUB c: IF PEEK nn=13 THEN PRINT "What with?": RETURN.
  $866D,$1E Line 2630: IF PEEK vn<>87 THEN GO TO 2625.
  $868B,$25 Line 2632: GO SUB C: LET p=wvv: GO SUB b: IF a$="" THEN PRINT
. "Pardon?": RETURN.
  $86B0,$0C Line 2633: IF NOT n THEN GO TO CC.
  $86BC,$29 Line 2634: IF n=23 AND (j=F OR j=V OR j=R) THEN LET o(j)=O: GO TO K.
  $86E5,$20 Line 2636: IF n=37 AND j=of THEN LET o(j)=O: GO TO K.
  $8705,$4D Line 2638: IF n=OO AND j=OF THEN PRINT "The lock is stiff. If I
. force itthe GOLD KEY will break.": RETURN.
  $8752,$26 Line 2639: IF N=38 AND J=13 THEN LET O(J)=O: GO TO K.
  $8778,$19 Line 2640: PRINT "It doesn't fit.": RETURN.
  $8791,$16 Line 2650: LET J=Z: LET N=Z: IF x=OO THEN RETURN.
  $87A7,$15 Line 2655: IF x<>G THEN GO TO 2674.
  $87BC,$1F Line 2660: IF op=43 THEN LET j=14: RETURN.
  $87DB,$13 Line 2665: IF op=OR THEN LET j=OR: RETURN.
  $87EE,$19 Line 2670: PRINT "I see no chest!": RETURN.
  $8807,$38 Line 2674: IF (x=q OR x=oz) AND (op=55 OR op=41) THEN LET j=29:
. RETURN.
  $883F,$23 Line 2675: IF x=S AND OP=57 THEN LET J=21: RETURN.
  $8862,$37 Line 2676: IF (x=O OR x=I) AND (OP=56 OR OP=59) THEN LET J=22:
. RETURN.
  $8899,$37 Line 2677: IF (x=V OR x=O) AND (OP=59 OR OP=60) THEN LET J=23:
. RETURN.
  $88D0,$0C Line 2679: IF x>F THEN GO TO U.
  $88DC,$16 Line 2680: IF OP=O OR OP=W THEN LET J=O: RETURN.
  $88F2,$36 Line 2685: IF OP=13 OR (OP=10 AND x=3) THEN LET J=4: RETURN.
  $8928,$36 Line 2688: IF OP=12 OR (OP=10 AND x=2) THEN LET J=5: RETURN.
  $895E,$36 Line 2690: IF OP=11 OR (OP=10 AND x=4) THEN LET J=3: RETURN.
  $8994,$22 Line 2695: IF OP=10 THEN PRINT "Which door?": RETURN.
  $89B6,$53 Line 2696: IF OP=39 OR OP=45 THEN PRINT "It's perfectly smooth,
. there's  nothing to grip.": RETURN.
  $8A09,$07 Line 2699: GO TO U.
  $8A10,$6B Line 2715: GO SUB 2650: IF X=7 AND OP=57 AND NOT O(OW) THEN PRINT "A
. huge sword crashes down and   slices me in two.": LET hp=z: RETURN.
  $8A7B,$2E Line 2716: IF x=oo AND PEEK (t+22)>253 THEN GO TO 2750.
  $8AA9,$0D Line 2717: IF X=oo THEN GO TO U.
  $8AB6,$0A Line 2718: IF NOT j THEN RETURN.
  $8AC0,$1D Line 2720: IF NOT o(j) THEN PRINT "It's locked.": RETURN.
  $8ADD,$24 Line 2730: IF o(j)=W THEN PRINT "It's already open.": RETURN.
  $8B01,$0F Line 2740: LET o(j)=W: GO TO K.
  $8B10,$5E Line 2750: GO SUB e: PRINT "A Jinni bursts from the bottle. The
. Jinni says - NOT YOU AGAIN.": LET OB=OB-O: POKE t+VAL "22",c.
  $8B6E,$4C Line 2752: GO SUB e: IF op=58 THEN PRINT "The Jinni smashes the
. stone door.": LET o(VAL "24")=r: LET l=l+v.
  $8BBA,$52 Line 2754: GO SUB e: IF op=PEEK (m1+26) AND PEEK (m2+26) THEN PRINT
. "The Jinni slays Zelda.": POKE m2+26,Z.
  $8C0C,$35 Line 2760: PRINT "The Jinni snatches the bottle   and leaves.":
. RETURN.
  $8C41,$16 Line 2810: GO SUB 2650: IF NOT j THEN RETURN.
  $8C57,$26 Line 2820: IF o(j)<>w THEN PRINT "It's already closed.": RETURN.
  $8C7D,$0F Line 2830: LET o(j)=O: GO TO K.
  $8C8C,$15 Line 2905: LET p=WVV: GO SUB b: IF NOT n THEN GO TO U.
  $8CA1,$22 Line 2910: IF PEEK (t+n)<254 THEN GO TO 2315.
  $8CC3,$53 Line 2915: IF n=17 THEN PRINT "It chronicles Tylon's
. failed"'"attempts to turn iron to gold.": RETURN.
  $8D16,$59 Line 2920: IF n=33 THEN PRINT "It's the FIRE PROTECTION SCROLL.You
. will need graphite to cast  it.": RETURN.
  $8D6F,$58 Line 2930: IF n=40 THEN PRINT "It's the CURE DISEASE SPELL."'"You
. will need dried moss to castit.": RETURN.
  $8DC7,$43 Line 2935: IF n=42 THEN PRINT "It's the HEAL SPELL. No"'"ingredients
. needed.": RETURN.
  $8E0A,$07 Line 2940: GO TO U.
  $8E11,$10 Line 3010: GO SUB 2650.
  $8E21,$0A Line 3015: IF NOT j THEN RETURN.
  $8E2B,$25 Line 3020: IF NOT o(j) THEN PRINT "It's already locked.": RETURN.
  $8E50,$1F Line 3025: GO SUB C: IF PEEK VN=OR THEN PRINT "What with?": RETURN.
  $8E6F,$2A Line 3035: GO SUB C: LET P=255: GO SUB 1105: IF A$="" THEN GO TO U.
  $8E99,$22 Line 3036: IF NOT N THEN PRINT "I don't have the ";a$: RETURN.
  $8EBB,$2A Line 3040: IF N=23 AND (J=F OR J=V OR J=R) THEN GO TO 3099.
  $8EE5,$27 Line 3045: IF N=37 AND J=14 THEN GO TO 3099.
  $8F0C,$12 Line 3080: PRINT "I can't.": RETURN.
  $8F1E,$0F Line 3099: LET O(J)=Z: GO TO K.
  $8F2D,$2D Line 3110: IF op<>G AND op<>OS THEN PRINT "It's far too dangerous.":
. RETURN.
  $8F5A,$24 Line 3120: IF OB THEN PRINT "I'm carrying too much.": RETURN.
  $8F7E,$17 Line 3130: IF op=g THEN LET Np=17.
  $8F95,$17 Line 3140: IF op=VAL "17" THEN LET Np=VAL "8".
  $8FAC,$07 Line 3150: GO TO h.
  $8FB3,$1B Line 3205: GO SUB e: LET p=wvr: GO SUB b: IF a$="" THEN GO TO U.
  $8FCE,$0C Line 3210: IF NOT n THEN GO TO cc.
  $8FDA,$09 Line 3215: LET j=n.
  $8FE3,$20 Line 3220: GO SUB cn: IF PEEK vn=VAL "13" THEN PRINT "To who?":
. RETURN.
  $9003,$29 Line 3230: LET p=op: GO SUB 1102: IF NOT PEEK (m2+n) OR a$="" THEN
. GO TO u.
  $902C,$1D Line 3235: IF NOT n THEN PRINT "I don't see "'a$: RETURN.
  $9049,$32 Line 3240: PRINT a$'"says - Thank you": LET ob=ob-o: POKE t+j,VAL
. "100"+n.
  $907B,$50 Line 3245: GO SUB e: IF j<>r AND mo<>s AND n=OG AND NOT o(I) THEN
. LET o(I)=O: LET l=l+v: PRINT "You may take anything you need.": RETURN.
  $90CB,$15 Line 3250: IF op<>VAL "68" OR j<>ow THEN RETURN.
  $90E0,$51 Line 3255: CLS : PRINT "Grako says - SAGAGOO"'"The moonstone burns
. brightly as power increases.".
  $9131,$28 Line 3260: GO SUB 6600: IF o(VAL "26")<>r THEN GO TO 6760.
  $9159,$10 Line 3265: GO TO 6675.
  $9169,$4A Line 3410: IF x=VAL "37" AND OP=VAL "47" AND O(oo)=o THEN LET
. o(oo)=w: PRINT "I pull the boat into the sea.": RETURN.
  $91B3,$4F Line 3411: IF NOT o(Q) AND x=VAL "60" AND op=VAL "44" THEN LET
. l=l+w: PRINT "O.K."'"I hear a sliding sound.": LET o(Q)=W: RETURN.
  $9202,$10 Line 3415: IF x<>VAL "40" THEN GO TO U.
  $9212,$1C Line 3416: IF PEEK (t+r)=c+o THEN GO TO 3430.
  $922E,$2E Line 3420: IF PEEK (t+R)<>C THEN PRINT "It's not tied to anything.":
. RETURN.
  $925C,$54 Line 3425: IF o(S)=O THEN LET l=l+w: PRINT "The stalagmite breaks":
. LET o(S)=W: POKE t+R,WVV: LET ob=ob+O: POKE t+VAL "25",op: RETURN.
  $92B0,$21 Line 3430: PRINT "It will hold my weight.": RETURN.
  $92D1,$27 Line 3502: LET M=USR 60015: IF M AND M<S THEN GO TO 3590.
  $92F8,$17 Line 3505: IF USR 60000=W THEN GO SUB C.
  $930F,$39 Line 3515: IF x=G AND OP=43 THEN LET M=14: LET N=83: GO TO 3580.
  $9348,$2D Line 3520: IF X=G AND OP=OR THEN LET M=OR: LET N=84: GO TO 3580.
  $9375,$34 Line 3525: IF X=23 AND OP=42 THEN LET N=80: GO TO 3585.
  $93A9,$47 Line 3530: IF (X=21 OR X=22) AND PEEK (T+28)=WVV THEN LET N=81: GO
. TO 3585.
  $93F0,$46 Line 3535: IF (X=41 OR X=42) AND PEEK (T+4)=WVV THEN LET N=82: GO TO
. 3585.
  $9436,$33 Line 3540: IF X=9 AND OP=41 THEN LET N=85: GO TO 3585.
  $9469,$34 Line 3545: IF x=10 AND op=55 THEN LET n=86: GO TO 3585.
  $949D,$10 Line 3575: GO TO 3830.
  $94AD,$07 Line 3577: GO TO u.
  $94B4,$25 Line 3580: IF O(M)<>W THEN PRINT "I can't. It's shut.": RETURN.
  $94D9,$0F Line 3585: GO TO 450.
  $94E8,$1D Line 3590: LET J=OP: GO SUB 990: IF NOT NP THEN GO TO U.
  $9505,$12 Line 3591: LET N=NP: GO TO VAL "450".
  $9517,$20 Line 3605: IF x=VAL "63" AND op=VAL "45" THEN LET np=di: GO TO h.
  $9537,$07 Line 3610: GO TO U.
  $953E,$18 Line 3700: LET p=wvv: GO SUB b: IF a$="" THEN GO TO u.
  $9556,$0C Line 3710: IF NOT n THEN GO TO cc.
  $9562,$40 Line 3720: IF n=of THEN POKE T+N,C: LET OB=OB-O: PRINT "I'm healed
. and refreshed.": LET hp=ov: RETURN.
  $95A2,$1E Line 3730: PRINT "I'm not that hungry.": RETURN.
  $95C0,$56 Line 3820: IF X=VAL "43" AND PEEK (36+T)=WVV AND PEEK (VAL
. "30"+T)=WVV THEN PRINT "Torch lit.": POKE VAL "36"+T,C: POKE VAL "29"+T,WVV:
. RETURN.
  $9616,$1A Line 3830: PRINT "I can't do that.": RETURN.
  $9630,$56 Line 3920: IF X=VAL "43" AND PEEK (T+VAL "29")=WVV THEN PRINT "Torch
. extinguished.": POKE T+VAL "29",C: POKE T+VAL "36",WVV: GO SUB VAL "8100":
. RETURN.
  $9686,$07 Line 3930: GO TO U.
  $968D,$10 Line 4010: IF X<>VAL "44" THEN GO TO U.
  $969D,$17 Line 4012: IF op<>VAL "42" THEN GO TO VAL "4040".
  $96B4,$31 Line 4015: IF O(OI) THEN PRINT "I turn the furnace off.": LET
. O(OI)=Z: RETURN.
  $96E5,$2F Line 4020: IF NOT O(OI) THEN PRINT "I turn the furnace on.": LET
. o(OI)=O.
  $9714,$10 Line 4025: IF o(OS)=W THEN GO TO Y.
  $9724,$58 Line 4030: PRINT "It heats up.": IF PEEK (t+VAL "31")=VAL "81" AND
. PEEK (t+VAL "28")=VAL "80" THEN LET l=l+v: POKE t+VAL "32",VAL "81": POKE
. t+VAL "31",c.
  $977C,$06 Line 4035: RETURN.
  $9782,$11 Line 4040: IF op<>VAL "45" THEN GO TO U.
  $9793,$55 Line 4050: GO SUB C: LET a=PEEK nn-48: LET n=PEEK (PEEK nd+256*PEEK
. (nd+o)+o)-48: IF n<>-35 THEN LET a=a*oz+n.
  $97E8,$17 Line 4055: IF a<O OR a>35 THEN GO TO U.
  $97FF,$25 Line 4060: LET di=a: PRINT "I turn the dial to ";a: RETURN.
  $9824,$1C Line 4105: IF x<>34 THEN GO TO 4150.
  $9840,$15 Line 4110: GO SUB c: IF USR VAL "6e4"<>f THEN GO TO U.
  $9855,$1A Line 4115: GO SUB C: LET p=WVV: GO SUB 1105.
  $986F,$0B Line 4120: IF NOT n THEN GO TO U.
  $987A,$1A Line 4125: IF n<>ow OR NOT o(27) THEN GO TO Y.
  $9894,$4A Line 4130: IF PEEK (t+oi)<>254 OR (op<>54 AND op<>67) THEN PRINT "I
. don't see a ward.": RETURN.
  $98DE,$20 Line 4135: IF op=54 THEN LET o(25)=O.
  $98FE,$20 Line 4140: IF op=67 THEN LET o(25)=W.
  $991E,$2C Line 4145: LET l=l+v: PRINT "The staff smashes the ward.": RETURN.
  $994A,$0A Line 4150: IF x THEN GO TO Y.
  $9954,$1D Line 4155: LET p=op: GO SUB 1102: IF NOT n THEN GO TO U.
  $9971,$2A Line 4160: LET j=n: LET b$=a$: IF NOT o(27) THEN GO TO 1710.
  $999B,$19 Line 4165: GO SUB cn: IF m<>f THEN GO TO 1710.
  $99B4,$15 Line 4170: LET p=wvr: GO SUB b: IF NOT n THEN GO TO U.
  $99C9,$16 Line 4175: IF n<>ow THEN GO TO 1710.
  $99DF,$27 Line 4180: IF j>26 THEN PRINT "It has no effect.": RETURN.
  $9A06,$32 Line 4185: PRINT b$;" is turned"'"to dust.": POKE m2+j,z: POKE
. m1+j,c: RETURN.
  $9A38,$1E Line 4205: LET P=253: GO SUB b: IF A$="" THEN GO TO U.
  $9A56,$0C Line 4210: IF NOT N THEN GO TO CC.
  $9A62,$B8 Line 4212: GO SUB e: IF n=og AND op=56 THEN LET OB=OB-O: LET l=l+v:
. PRINT "O.K."'"The Karush charges its own": GO SUB e: PRINT "reflection. The
. bars are bent   and the mirror is smashed into  fine fragments.": POKE T+og,c:
. GO TO 9555.
  $9B1A,$24 Line 4215: LET j=n: GO SUB C: IF PEEK NN=or THEN PRINT "Into what?":
. RETURN.
  $9B3E,$1E Line 4220: IF PEEK VN<>73 THEN GO TO 4215.
  $9B5C,$30 Line 4227: GO SUB C: IF X=58 AND PEEK (T+w)=WVV THEN POKE T+w,254:
. GO TO K.
  $9B8C,$15 Line 4230: IF X=g THEN GO TO 4280.
  $9BA1,$27 Line 4235: IF X=41 OR X=42 THEN GO TO 4270.
  $9BC8,$27 Line 4240: IF X=21 OR X=22 THEN GO TO 4260.
  $9BEF,$1F Line 4245: IF X<>23 OR OP<>42 THEN GO TO U.
  $9C0E,$51 Line 4250: IF J<>28 THEN PRINT "I can't. It's only designed to  take
. the TUNGSTEN CRUCIBLE.": RETURN.
  $9C5F,$1E Line 4254: POKE T+J,80: LET OB=ob-O: GO TO K.
  $9C7D,$1A Line 4260: IF PEEK (T+28)<>wvv THEN GO TO U.
  $9C97,$25 Line 4262: IF j<>31 THEN PRINT "It wont fit in.": RETURN.
  $9CBC,$1C Line 4264: POKE T+31,81: GO TO D.
  $9CD8,$38 Line 4270: IF PEEK (T+4)<>wvv THEN PRINT "I don't have the BLACK
. SACK.": RETURN.
  $9D10,$0D Line 4272: IF j=f THEN GO TO sl.
  $9D1D,$2F Line 4274: POKE 23549,82: LET M=Z: LET N=USR 60024.
  $9D4C,$2A Line 4275: IF N THEN LET M=M+o: LET N=USR 60027: GO TO 4275.
  $9D76,$28 Line 4276: IF m>r THEN PRINT "The sack is already full.": RETURN.
  $9D9E,$15 Line 4278: POKE T+J,82: GO TO D.
  $9DB3,$17 Line 4280: IF op=or THEN GO TO 4885.
  $9DCA,$26 Line 4281: IF op<>43 THEN PRINT "I see no chest.": RETURN.
  $9DF0,$1E Line 4282: IF o(of)=w THEN POKE T+J,83: GO TO D.
  $9E0E,$16 Line 4283: PRINT "It's closed.": RETURN.
  $9E24,$1E Line 4285: IF o(ow)=w THEN POKE T+J,84: GO TO D.
  $9E42,$10 Line 4286: GO TO 4883.
  $9E52,$10 Line 4299: LET OB=OB-O: GO TO K.
  $9E62,$15 Line 4305: IF PEEK NN=73 THEN GO SUB c.
  $9E77,$20 Line 4310: IF (x<>og AND X<>os) OR op<>46 THEN GO TO U.
  $9E97,$2A Line 4320: IF NOT PEEK (T+VAL "35") THEN LET l=l+w: LET N=VAL "35":
. GO TO VAL "1409".
  $9EC1,$1D Line 4330: PRINT "I've found nothing.": RETURN.
  $9EDE,$24 Line 4405: LET P=WVV: GO SUB b: IF A$="" OR OP<>42 THEN GO TO U.
  $9F02,$11 Line 4410: LET j=n: IF NOT N THEN GO TO CC.
  $9F13,$1D Line 4415: GO SUB CN: IF M<>W THEN PRINT "Into what?": RETURN.
  $9F30,$22 Line 4430: IF X<>R AND X<>45 AND X<>46 THEN GO TO U.
  $9F52,$2B Line 4435: IF j=oo OR j=oi THEN PRINT "It turns to IRON.": POKE
. t+j,c.
  $9F7D,$29 Line 4436: IF PEEK (T+OI)=WVF THEN POKE T+OI,C: POKE T+39,WVF.
  $9FA6,$20 Line 4440: IF j=oo THEN LET l=l+v: POKE t+VAL "37",wvv: RETURN.
  $9FC6,$1C Line 4445: IF j=oi THEN POKE 39+t,wvv: RETURN.
  $9FE2,$07 Line 4450: GO TO Y.
  $9FE9,$0E Line 4510: LET P=WVV: GO SUB b.
  $9FF7,$13 Line 4520: IF n<>or OR o(oo) THEN GO TO Y.
  $A00A,$8D Line 4530: LET l=l+r: PRINT "A Jinni bursts from the lamp."'"The
. Jinni says:": GO SUB e: PRINT "If you expect 3 wishes you're infantasy
. land."'"The Jinni disappears.": GO SUB e.
  $A097,$0F Line 4540: LET o(OO)=O: RETURN.
  $A0A6,$12 Line 4605: IF USR VAL "6e4"=o THEN GO SUB c.
  $A0B8,$2C Line 4606: IF PEEK (t+w)=wvf THEN PRINT "I can't hear anything.":
. RETURN.
  $A0E4,$0E Line 4610: LET p=wvv: GO SUB b.
  $A0F2,$53 Line 4620: IF n=35 AND PEEK (t+35)=wvv THEN PRINT "It says:"'"Death
. beetles hate blue mushroom": RETURN.
  $A145,$27 Line 4630: PRINT "I hear nothing in particular.": RETURN.
  $A16C,$46 Line 4705: IF PEEK (t+41)<>wvv OR PEEK (t+26)<>wvv THEN PRINT "I
. have nothing to shoot": RETURN.
  $A1B2,$20 Line 4710: LET p=op: GO SUB 1102: IF a$="" THEN GO TO u.
  $A1D2,$21 Line 4715: IF a$(oo TO or)="DAR" THEN LET n=31.
  $A1F3,$0C Line 4720: IF NOT n THEN GO TO ee.
  $A1FF,$1F Line 4725: IF RND<.8 THEN PRINT "I missed.": RETURN.
  $A21E,$13 Line 4727: PRINT "I shoot ";a$.
  $A231,$44 Line 4730: IF n<>VAL "31" AND n>VAL "25" THEN PRINT "The arrow
. bounces off its"'"rubbery hide.": RETURN.
  $A275,$26 Line 4735: PRINT "The arrow slays"'a$: POKE (m2+n),z: RETURN.
  $A29B,$1C Line 4810: IF x<>47 THEN GO TO 4830.
  $A2B7,$23 Line 4815: IF PEEK (t+33)<>wvv THEN GO TO 4880.
  $A2DA,$23 Line 4820: IF PEEK (t+32)<>wvv THEN GO TO 4885.
  $A2FD,$47 Line 4825: PRINT "I'm protected from FIRE.": POKE t+33,c: POKE
. t+32,c: LET ob=ob-w: RETURN.
  $A344,$1C Line 4850: IF x<>49 THEN GO TO 4870.
  $A360,$23 Line 4855: IF PEEK (t+40)<>wvv THEN GO TO 4880.
  $A383,$23 Line 4860: IF PEEK (t+44)<>wvv THEN GO TO 4885.
  $A3A6,$5C Line 4865: POKE t+40,c: POKE t+44,c: LET ob=ob-w: IF o(VAL "28")
. THEN LET l=l+v: PRINT "I've been cured.": LET o(VAL "28")=z: RETURN.
  $A402,$07 Line 4867: GO TO y.
  $A409,$13 Line 4870: IF x<>50 THEN GO TO U.
  $A41C,$23 Line 4872: IF PEEK (t+42)<>wvv THEN GO TO 4880.
  $A43F,$37 Line 4874: LET l=l+w: PRINT "I'm healed.": POKE t+VAL "42",c: LET
. ob=ob-o: LET hp=ov: RETURN.
  $A476,$22 Line 4880: PRINT "I don't have the SCROLL.": RETURN.
  $A498,$26 Line 4885: PRINT "I don't have the INGREDIENT.": RETURN.
  $A4BE,$1B Line 4910: IF op=69 THEN LET op=OI: GO TO H.
  $A4D9,$13 Line 4920: IF X<>37 THEN GO TO U.
  $A4EC,$2B Line 4925: IF op<71 THEN PRINT "I'm not in the boat.": RETURN.
  $A517,$1E Line 4930: IF op>VAL "72" THEN LET np=op-VAL "26": GO TO h.
  $A535,$08 Line 4935: GO TO sl.
  $A53D,$2C Line 5005: IF PEEK (t+21)<>wvv THEN PRINT "I have no oars!": RETURN.
  $A569,$37 Line 5010: IF op<71 OR op=72 THEN PRINT "I'm not in the boat!":
. RETURN.
  $A5A0,$18 Line 5015: IF PEEK nn<>or THEN GO SUB C: GO TO VAL "5015".
  $A5B8,$3B Line 5020: LET m=USR 60015: IF NOT m OR m>4 THEN PRINT "In which
. direction?": RETURN.
  $A5F3,$1A Line 5022: IF op<>71 THEN GO TO VAL "5050".
  $A60D,$44 Line 5025: IF m=O OR m=R THEN PRINT "The boat strikes jagged rocks  
. and sinks.": GO TO VAL "5065".
  $A651,$31 Line 5030: IF NOT o(19) THEN PRINT "The boat sinks.": GO TO 5065.
  $A682,$69 Line 5035: IF m=4 AND PEEK (t+2)<>254 THEN PRINT "I'm charmed by the
. Siren song   and the boat sinks.": GO TO 5065.
  $A6EB,$1F Line 5040: IF m=4 THEN LET np=74: GO TO h.
  $A70A,$14 Line 5045: LET np=73: GO TO h.
  $A71E,$25 Line 5050: IF m=w AND op=74 THEN LET np=71: GO TO h.
  $A743,$2B Line 5055: IF m=4 AND op=73 THEN LET np=71: GO TO h.
  $A76E,$28 Line 5060: PRINT "I can't row in that direction.": RETURN.
  $A796,$1F Line 5065: GO SUB e: PRINT "I'M DROWNED.": LET HP=Z: RETURN.
  $A7B5,$31 Line 5110: IF x<>52 OR PEEK (t+15)<>WVV OR op<>57 THEN GO TO U.
  $A7E6,$48 Line 5120: LET l=l+w: PRINT "O.K. The sword arm is locked.": POKE
. T+OV,C: LET OB=OB-O: LET o(OW)=O: RETURN.
  $A82E,$6B Line 5210: IF x=VAL "53" AND NOT O(VAL "20") AND OP=VAL "29" THEN
. LET l=l+v: PRINT "O.K."'"Timandra says - THANK YOU" AND PEEK (m2+24): LET
. o(20)=o: RETURN.
  $A899,$4B Line 5215: IF x=40 AND op=ov AND PEEK (t+r)=c THEN PRINT "I untie
. the rope.": POKE t+r,op: LET o(s)=o(s)-o: RETURN.
  $A8E4,$07 Line 5220: GO TO U.
  $A8EB,$0D Line 5300: GO TO VAL "4100".
  $A8F8,$1E Line 5410: IF PEEK (t+R)=c+o AND op=G THEN GO TO VAL "3130".
  $A916,$07 Line 5420: GO TO u.
  $A91D,$11 Line 5500: IF op<>VAL "71" THEN GO TO u.
  $A92E,$1C Line 5510: GO SUB cn: IF NOT m THEN PRINT "What with?": RETURN.
  $A94A,$12 Line 5515: IF m=g THEN GO TO VAL "5510".
  $A95C,$18 Line 5520: LET p=wvv: GO SUB b: IF a$="" THEN GO TO u.
  $A974,$0C Line 5530: IF NOT n THEN GO TO cc.
  $A980,$27 Line 5540: IF o(oq)=w OR n<>VAL "27" THEN PRINT "It's no use!":
. RETURN.
  $A9A7,$2F Line 5550: LET l=l+v: LET o(oq)=w: PRINT "I bail out the water.":
. RETURN.
  $A9D6,$22 Line 5600: PRINT "Please be more specific.": RETURN.
  $A9F8,$24 Line 6005: LET N=o+INT (RND*of): LET M=o+INT (RND*26).
  $AA1C,$19 Line 6010: IF NOT PEEK (n+m2) OR NOT PEEK (m+m2) THEN RETURN.
  $AA35,$27 Line 6015: IF PEEK (n+m1)<>PEEK (m+m1) OR PEEK (n+m3)=PEEK (m+m3)
. THEN RETURN.
  $AA5C,$1C Line 6020: GO SUB 6050: IF NOT PEEK (m2+m) THEN RETURN.
  $AA78,$21 Line 6025: LET A=N: LET N=M: LET M=A: GO SUB 6050: RETURN.
  $AA99,$6D Line 6050: GO SUB e: IF PEEK (M1+N)=OP THEN RESTORE 9600+N: READ A$:
. RESTORE 9600+M: READ b$: PRINT "The " AND VAL a$(o);a$(w TO );" attacks"'"the
. " AND VAL a$(o);b$(w TO ).
  $AB06,$16 Line 6055: RANDOMIZE : IF RND*oq<PEEK (m2+m) THEN RETURN.
  $AB1C,$61 Line 6060: GO SUB e: LET N$=" is injured.": POKE m2+m,PEEK
. (m2+m)-PEEK (m2+n)*w*RND: IF PEEK (m2+m)>230 THEN POKE m2+m,z: LET n$=" is
. killed.".
  $AB7D,$29 Line 6065: IF PEEK (m1+n)=op THEN PRINT "The " AND VAL b$(o);b$(w TO
. );n$.
  $ABA6,$06 Line 6070: RETURN.
  $ABAC,$12 Line 6105: IF PEEK (M1+N)<>op THEN RETURN.
  $ABBE,$3E Line 6110: GO SUB E: RESTORE 9600+n: READ a$: PRINT "The " AND VAL
. A$(o);a$(w TO );" attacks me.".
  $ABFC,$12 Line 6112: IF RND<.6 THEN RETURN.
  $AC0E,$36 Line 6115: LET hp=hp-PEEK (M2+N)/W: IF hp<=z THEN LET hp=z: PRINT
. "AGH ! I'm dead.": RETURN.
  $AC44,$1D Line 6120: PRINT "OUCH ! I'm injured.": RETURN.
  $AC61,$2C Line 6210: RANDOMIZE : LET co=z: POKE 23549,op: LET X=USR 60030.
  $AC8D,$0E Line 6220: IF NOT hp OR NOT x THEN RETURN.
  $AC9B,$2F Line 6230: IF PEEK (m3+X)=mo AND PEEK (m2+X) THEN LET CO=O: LET N=X:
. GO SUB 6100.
  $ACCA,$20 Line 6240: LET x=USR 60027: GO TO 6220.
  $ACEA,$06 Line 6250: RETURN.
  $ACF0,$29 Line 6300: IF op>=27 AND op<=36 THEN GO TO 6350.
  $AD19,$23 Line 6302: IF op=PEEK (m1+33) THEN GO TO 6370.
  $AD3C,$43 Line 6305: LET m=o+INT (RND*6): LET N=1+2*INT (RND*11): IF NOT PEEK
. (m2+n) THEN RETURN.
  $AD7F,$20 Line 6310: LET j=PEEK (m1+n): IF NOT j OR j>72 THEN RETURN.
  $AD9F,$16 Line 6312: GO SUB 990: IF NOT np THEN RETURN.
  $ADB5,$3D Line 6315: IF OP=j THEN RESTORE 9600+n: READ a$: PRINT "The " AND
. VAL a$(o);a$(w TO );" leaves.".
  $ADF2,$3D Line 6320: IF op=np THEN RESTORE 9600+n: READ a$: PRINT "The " AND
. VAL a$(O);a$(W TO );" enters".
  $AE2F,$0F Line 6325: POKE m1+n,np: RETURN.
  $AE3E,$28 Line 6351: LET P=PEEK (M1+1): IF P=255 THEN LET P=OP.
  $AE66,$23 Line 6352: POKE 23549,P: LET X=USR 60030.
  $AE89,$15 Line 6354: IF NOT X OR X>14 THEN RETURN.
  $AE9E,$3B Line 6356: IF (X=W OR X>10) AND PEEK (M2+X) THEN LET N=X: LET J=OP:
. LET NP=Z: GO SUB 6315.
  $AED9,$20 Line 6358: LET X=USR 60027: GO TO 6354.
  $AEF9,$58 Line 6370: IF PEEK (t+q)<>wvv AND PEEK (t+g)<>wvv THEN PRINT "I've
. been attacked and devoured by death beetles.": LET hp=z: RETURN.
  $AF51,$2A Line 6375: LET N=VAL "33": LET J=PEEK (M1+N): RESTORE 9800+J: READ
. a$.
  $AF7B,$30 Line 6377: FOR m=O TO F: LET NP=VAL (a$(W*m-O TO W*m)): IF NP THEN
. GO TO 6381.
  $AFAB,$09 Line 6380: NEXT m: RETURN.
  $AFB4,$25 Line 6381: IF NP=PEEK (t+G) OR NP=PEEK (t+Q) THEN GO TO 6380.
  $AFD9,$53 Line 6385: GO SUB 6315: IF PEEK (m2+29) THEN IF PEEK (m1+29)=PEEK
. (m1+33) THEN POKE m2+29,Z: LET x=V.
  $B02C,$47 Line 6390: IF PEEK (m2+30) THEN IF PEEK (m1+30)=PEEK (m1+33) THEN
. POKE m2+30,Z: LET x=V.
  $B073,$23 Line 6395: IF x=V THEN LET l=l+v: PRINT "I hear screams.".
  $B096,$06 Line 6396: RETURN.
  $B09C,$57 Line 6510: IF PEEK (m2+25) AND O(w) THEN IF PEEK (m1+25)<>op THEN
. POKE m1+25,op: PRINT "ELVA enters" AND op<70.
  $B0F3,$12D Line 6520: IF PEEK (m2+VAL "24") AND O(VAL "20")=O AND PEEK (M1+VAL
. "24")<>OP AND OP<48 THEN GO SUB e: PRINT "TIMANDRA enters": POKE m1+oq+v,op:
. IF OP=36 AND PEEK (m2+oq+7) THEN LET L=L+V: PRINT '"Timandra says - HELLO": GO
. SUB e: PRINT "Zelda says - HELLO"'"Timandra says - I rescued Zelda from one of
. those do-gooder": GO SUB e: PRINT "knights when she was only a"'"dragonette.":
. LET o(oq+o)=w: GO TO e.
  $B220,$06 Line 6530: RETURN.
  $B226,$83 Line 6605: GO SUB e: LET o(VAL "27")=R: LET o(VAL "26")=o(VAL
. "26")+O: PRINT "The staff glows faintly with"'"latent energy.": LET a$=" me":
. IF PEEK (t+12)<>WVV THEN LET A$=" Grako".
  $B2A9,$3E Line 6615: GO SUB e: IF o(VAL "26")=O THEN PRINT "I see a strange
. misty image"'"beside";a$.
  $B2E7,$48 Line 6620: IF o(26)>w THEN PRINT "I see a strange misty
. figure"'"clawing towards";a$.
  $B32F,$44 Line 6625: IF o(26)=W THEN PRINT "I see a strange human
. shaped"'"mist beside";a$.
  $B373,$79 Line 6630: GO SUB e: IF o(26)=F THEN LET hp=z: PRINT "The hand of
. Velnor strikes out  and drags";a$;" through the void"'"to the fires of
. Abyss.".
  $B3EC,$06 Line 6635: RETURN.
  $B3F2,$8D Line 6710: PAUSE C/W: GO SUB e: PRINT INK s;"The world enters
. eternal"'"darkness"'"Grako has achieved supreme power": GO SUB e: PRINT INK
. s;"I have failed and all is lost.": GO TO 6900.
  $B47F,$52 Line 6760: PAUSE C/W: PRINT INK s;"Congratulations on
. the"'"completion of your quest.": LET l=l+v: GO TO VAL "6900".
  $B4D1,$2A Line 6805: GO SUB e: LET O(VAL "28")=O(VAL "28")+o: IF O(VAL "28")<i
. THEN RETURN.
  $B4FB,$DA Line 6810: LET n=o(VAL "28"): PRINT "I feel ";"slightly " AND n>v
. AND n<oz;"rather " AND n>of AND n<VAL "20";"very " AND n>oq;"ill."'"The
. world's all misty and the   ground's spinning. HELP!" AND N>VAL "25": GO SUB
. e: IF N>VAL "26" THEN PRINT "I've just died from the black   death.": LET
. hp=z.
  $B5D5,$06 Line 6815: RETURN.
  $B5DB,$A2 Line 6835: GO SUB e: IF PEEK (t+S)=WVV THEN PRINT "The crystal is
. ";"glowing." AND o(og);"dull " AND NOT o(VAL "18"): IF o(og) AND op=PEEK
. (m1+34) THEN LET l=l+v: PRINT "The Troll is turned to stone.": POKE m1+VAL
. "34",c: POKE m2+VAL "34",z.
  $B67D,$17 Line 6840: IF PEEK (t+S)=82 THEN RETURN.
  $B694,$41 Line 6845: LET o(OG)=Z: IF op<Q OR (op>OI AND op<VAL "37") OR
. (op>VAL "45" AND op<VAL "49") THEN LET o(OG)=O.
  $B6D5,$06 Line 6850: RETURN.
  $B6DB,$38 Line 6900: GO SUB e: PRINT INK v'"You have completed ";l;"%": FOR
. n=z TO 70: NEXT n.
  $B713,$0D Line 6910: PAUSE Z: PAUSE z: GO TO V.
  $B720,$1A Line 8000: PRINT "Nothing happens.": RETURN.
  $B73A,$0E Line 8001: PRINT "O.K.": RETURN.
  $B748,$31 Line 8002: PRINT "I don't have ";CHR$ 13 AND LEN a$>15;a$: RETURN.
  $B779,$14 Line 8003: IF USR 60042 THEN RETURN.
  $B78D,$19 Line 8004: PRINT "Don't be silly!": RETURN.
  $B7A6,$19 Line 8005: PRINT "I don't see ";a$: RETURN.
  $B7BF,$29 Line 8050: LET m=USR 60000: IF m OR PEEK vn=13 THEN GO SUB c:
. RETURN.
  $B7E8,$13 Line 8060: GO SUB c: GO TO 8050.
  $B7FB,$84 Line 8100: LET da=o: IF (PEEK (t+29)<>wvv AND PEEK (t+29)<>op AND
. PEEK (t+29)<>125) AND ((op>37 AND op<44) OR (op>48 AND op<69)) THEN LET da=z.
  $B87F,$06 Line 8110: RETURN.
  $B885,$37 Line 8200: GO SUB e: LET b$=b$+" says - ": IF PEEK (T+OW)<>83 THEN
. GO TO 8220.
  $B8BC,$47 Line 8205: IF NOT O(g) THEN LET O(G)=O: PRINT B$;"Grakocan't be
. beaten without Velnor'sstaff.": RETURN.
  $B903,$29 Line 8210: PRINT b$;"Be"'"off and find the staff.": RETURN.
  $B92C,$4F Line 8220: IF NOT qq THEN PRINT b$;"Take care, you have the power to
. saveor damn the world!": LET qq=o: RETURN.
  $B97B,$25 Line 8225: PRINT b$;"Grakocan never be slain.": RETURN.
  $B9A0,$43 Line 9004: RANDOMIZE : LET l=z: LET qq=z: LET di=INT (RND*VAL
. "36")+O: LET mu=Z: LET go=Z: LET ob=Z: LET vn=nn-O: LET np=w.
  $B9E3,$40 Line 9005: LET MO=f: LET T1=I: LET T2=Z: LET DA=Z: LET SE=Z: LET
. sp=Z: INK I: PAPER Z: BORDER Z: CLS : LET HP=ov: LET co=o.
  $BA23,$43 Line 9026: DIM O(VAL "30"): LET o(VAL "29")=o: LET O(O)=O: LET
. O(oq+w)=O: LET O(oq+r)=O: LET O(oq+f)=O.
  $BA66,$26 Line 9029: RANDOMIZE USR 60036: POKE t+of,c/w+RND*VAL "25": RETURN.
  $BA8C,$6C Line 9405: IF RND>VAL ".7" THEN LET sp=Z: PRINT "The large Urga-maul
. enters. He  carries a nasty knife.": POKE m1+g,op: LET co=O: LET mo=F: LET
. o(R)=O: RETURN.
  $BAF8,$06 Line 9406: RETURN.
  $BAFE,$6C Line 9410: LET se=Z: IF PEEK (m2+34) AND np<>c/f THEN LET NP=OP: LET
. se=VAL "9410": PRINT "The Large Troll says - Ya cheekywert.": LET co=o: LET
. mo=og: RETURN.
  $BB6A,$06 Line 9411: RETURN.
  $BB70,$57 Line 9415: IF op=VAL "54" AND NOT o(VAL "25") AND PEEK (t+oi)=wvf
. THEN PRINT "The passage north is blocked by a glowing ward.".
  $BBC7,$19 Line 9416: IF op<>VAL "55" OR o(VAL "25") THEN RETURN.
  $BBE0,$5F Line 9417: PRINT "I've walked straight into a wardof disintegration
. and have been turned to dust.": LET hp=z: RETURN.
  $BC3F,$22 Line 9420: IF np=VAL "68" AND o(VAL "25")=o THEN GO TO VAL "9417".
  $BC61,$06 Line 9421: RETURN.
  $BC67,$2A Line 9425: IF op<>67 OR PEEK (m1+27)=c THEN LET sp=z: RETURN.
  $BC91,$86 Line 9426: IF PEEK (m1+VAL "27")=op AND PEEK (t+VAL "33")=c THEN LET
. l=l+v: PRINT "The Fire Demons notice my fire  protection and dissolve away.":
. POKE m1+27,c: POKE m1+VAL "28",c: RETURN.
  $BD17,$1C Line 9427: LET co=o: LET mo=PEEK (m3+VAL "27"): RETURN.
  $BD33,$2A Line 9430: IF PEEK (T+r)<VAL "121" OR NOT PEEK (M2+og) OR NP=of OR
. O(i) THEN RETURN.
  $BD5D,$37 Line 9431: LET NP=OP: PRINT "The Cavezats wont let thieves  
. leave.": RETURN.
  $BD94,$98 Line 9435: LET sp=z: IF PEEK (t+v)=VAL "125" AND PEEK (m1+VAL
. "25")=op AND NOT PEEK (t+VAL "26") AND RND>VAL ".8" THEN PRINT "Elva makes a
. Longbow and some   Arrows from an elm tree.": POKE t+VAL "26",VAL "125": POKE
. t+VAL "41",VAL "125".
  $BE2C,$06 Line 9436: RETURN.
  $BE32,$38 Line 9440: IF PEEK (VAL "26"+m2) AND NOT o(oq+1) AND PEEK (t+VAL
. "33")=wvv THEN GO TO VAL "2116".
  $BE6A,$06 Line 9441: RETURN.
  $BE70,$1B Line 9450: RANDOMIZE : IF op<>27 THEN LET sp=z: RETURN.
  $BE8B,$2E Line 9451: IF PEEK (M1+26)=OP AND RND>.9 THEN GO TO 9455.
  $BEB9,$45 Line 9452: IF PEEK (M1+24)<>PEEK (M1+26) OR NOT PEEK (M2+24) OR NOT
. PEEK (M2+26) THEN RETURN.
  $BEFE,$2A Line 9453: IF PEEK (M1+24)<>36 OR RND<.6 THEN RETURN.
  $BF28,$45 Line 9454: POKE M1+24,OP: POKE M1+26,OP: PRINT "Zelda flies in with
. Timandra.".
  $BF6D,$63 Line 9455: GO SUB e: PRINT "Timandra says - If you want to  cross
. the moat then climb up andwe'll fly you over.": GO SUB e: RETURN.
  $BFD0,$32 Line 9460: GO SUB e: IF OP<>PEEK (M1+22) OR NOT PEEK (M2+22) THEN
. LET SP=Z: RETURN.
  $C002,$48 Line 9461: LET B$="OGERON": LET J=21: LET A$="the SWORD": LET N=O:
. IF PEEK (T+O)=O THEN GO TO 2068.
  $C04A,$61 Line 9462: IF PEEK (T+O)=121 THEN GO SUB 2047: PRINT B$;" says -
. This is the sword of the great warrior Ashka.": GO TO e.
  $C0AB,$4B Line 9463: IF NOT o(os) THEN LET o(os)=o: PRINT b$;" says - Grako is
. held out in the Black tower.": RETURN.
  $C0F6,$65 Line 9464: IF RND>.7 THEN PRINT b$;" says - Be off! The fate  of the
. world lies in your hands and time is short.": RETURN.
  $C15B,$06 Line 9465: RETURN.
  $C161,$17 Line 9480: IF op<>65 THEN LET se=z.
  $C178,$50 Line 9481: IF PEEK (M2+30) AND np>65 THEN PRINT "I can't get past
. the Zalrogs.": LET np=65: RETURN.
  $C1C8,$13 Line 9490: LET sp=9491.
  $C1DB,$32 Line 9491: IF PEEK (t+43)=v THEN POKE t+VAL "43",z: POKE t+VAL
. "44",v: LET l=l+v.
  $C20D,$06 Line 9492: RETURN.
  $C213,$10 Line 9496: IF NOT mu THEN LET mu=go.
  $C223,$2A Line 9497: IF go>mu+20 AND NOT PEEK (t+q) THEN POKE t+q,72.
  $C24D,$06 Line 9498: RETURN.
  $C253,$0C Line 9505: IF O(w) THEN RETURN.
  $C25F,$A9 Line 9506: LET sp=9405: PRINT "I've been overpowered and"'"captured
. by Urga-Mauls. All of  my possessions have been taken.": LET o(w)=o: LET
. np=oo: FOR N=o TO VAL "45": IF PEEK (t+n)>wvr THEN POKE t+n,or: LET OB=OB-O.
  $C308,$09 Line 9507: NEXT N: RETURN.
  $C311,$12 Line 9515: LET co=O: LET MO=F: RETURN.
  $C323,$06 Line 9516: RETURN.
  $C329,$13 Line 9520: IF o(19) THEN RETURN.
  $C33C,$29 Line 9521: PRINT "The boat is filling with water.": RETURN.
  $C365,$47 Line 9525: IF PEEK (m2+34) THEN LET SE=9410: PRINT "A Large Troll
. stands guard here.".
  $C3AC,$06 Line 9526: RETURN.
  $C3B2,$10 Line 9530: LET CO=O: LET MO=W.
  $C3C2,$67 Line 9531: RANDOMIZE : IF PEEK (M1+O)<>WVV AND RND>.9 THEN PRINT "A
. giant tentacle rises from the swamp and drags me under.": GO TO 5065.
  $C429,$06 Line 9532: RETURN.
  $C42F,$3B Line 9545: IF op=VAL "42" AND PEEK (t+oi)=wvf THEN PRINT "I see a
. magic passage east.": RETURN.
  $C46A,$06 Line 9546: RETURN.
  $C470,$4D Line 9550: IF PEEK (t+og)<>c THEN PRINT "The Karush has pounced on
. me andtorn me to shreds.": LET hp=z: RETURN.
  $C4BD,$61 Line 9555: GO SUB e: IF PEEK (t+18)=200 AND PEEK (m2+20) THEN PRINT
. "The Karush has its head jammed  in the bars.": RETURN.
  $C51E,$06 Line 9556: RETURN.
  $C524,$61 Line 9565: LET se=9420: IF o(25)=o AND PEEK (t+oi)=wvf THEN PRINT
. "The passage south is blocked by a glowing ward.".
  $C585,$70 Line 9566: LET sp=9425: IF NOT PEEK (m1+27) THEN PRINT "Two Fire
. Demons rise from the   torches.": POKE m1+27,op: POKE m1+28,op.
  $C5F5,$06 Line 9567: RETURN.
  $C5FB,$2E Line 9570: LET SE=9480: LET co=o: LET mo=PEEK (m3+29): RETURN.
  $C629,$1C Line 9575: IF NOT o(i) THEN LET se=9430: RETURN.
  $C645,$06 Line 9578: RETURN.
  $C64B,$6C Line 9585: IF PEEK (m2+31) THEN PRINT "The Darg-Vool throws a spear.
.   Agh. I'm hit."'"I fall dying into the abyss.": LET hp=z: RETURN.
  $C6B7,$06 Line 9586: RETURN.
  $C6BD,$17 Line 9601: DATA "1RATTLING QUARG".
  $C6D4,$15 Line 9602: DATA "1GIANT SPIDER".
  $C6E9,$18 Line 9603: DATA "1DEADLY GARGOYLE".
  $C701,$17 Line 9604: DATA "1UGLY URGA-MAUL".
  $C718,$18 Line 9605: DATA "1NASTY URGA-MAUL".
  $C730,$16 Line 9606: DATA "1FAT URGA-MAUL".
  $C746,$17 Line 9607: DATA "1THIN URGA-MAUL".
  $C75D,$18 Line 9608: DATA "1LARGE URGA-MAUL".
  $C775,$18 Line 9609: DATA "1SMALL URGA-MAUL".
  $C78D,$18 Line 9610: DATA "1CHIEF URGA-MAUL".
  $C7A5,$16 Line 9611: DATA "1UGLY MARSHZAT".
  $C7BB,$17 Line 9612: DATA "1CHIEF MARSHZAT".
  $C7D2,$17 Line 9613: DATA "1LARGE MARSHZAT".
  $C7E9,$17 Line 9614: DATA "1NASTY MARSHZAT".
  $C800,$16 Line 9615: DATA "1LARGE CAVEZAT".
  $C816,$16 Line 9616: DATA "1SMALL CAVEZAT".
  $C82C,$14 Line 9617: DATA "1FAT CAVEZAT".
  $C840,$16 Line 9618: DATA "1CHIEF CAVEZAT".
  $C856,$15 Line 9619: DATA "1UGLY CAVEZAT".
  $C86B,$15 Line 9620: DATA "1GREY CAVEZAT".
  $C880,$18 Line 9621: DATA "1SHADOW CREATURE".
  $C898,$0F Line 9622: DATA "0OGERON".
  $C8A7,$18 Line 9623: DATA "1CARAWOOD ORACLE".
  $C8BF,$11 Line 9624: DATA "0TIMANDRA".
  $C8D0,$0D Line 9625: DATA "0ELVA".
  $C8DD,$15 Line 9626: DATA "1DRAGON ZELDA".
  $C8F2,$13 Line 9627: DATA "1FIRE DEMON".
  $C905,$13 Line 9628: DATA "1FIRE DEMON".
  $C918,$15 Line 9629: DATA "1GREEN ZALROG".
  $C92D,$13 Line 9630: DATA "1RED ZALROG".
  $C940,$18 Line 9631: DATA "1NASTY DARG-VOOL".
  $C958,$0E Line 9632: DATA "0GRAKO".
  $C966,$16 Line 9633: DATA "1DEATH BEETLES".
  $C97C,$14 Line 9634: DATA "1LARGE TROLL".
  $C990,$0E Line 9701: DATA "1SWORD".
  $C99E,$13 Line 9702: DATA "1CANDLE WAX".
  $C9B1,$0D Line 9703: DATA "1ROPE".
  $C9BE,$13 Line 9704: DATA "1BLACK SACK".
  $C9D1,$14 Line 9705: DATA "1NASTY KNIFE".
  $C9E5,$11 Line 9706: DATA "1TALISMAN".
  $C9F6,$16 Line 9707: DATA "1LARGE CRYSTAL".
  $CA0C,$17 Line 9708: DATA "1BLUE MUSHROOMS".
  $CA23,$17 Line 9709: DATA "1BLUE MUSHROOMS".
  $CA3A,$10 Line 9710: DATA "1BLANKET".
  $CA4A,$11 Line 9711: DATA "1GOLD KEY".
  $CA5B,$17 Line 9712: DATA "0VELNOR'S STAFF".
  $CA72,$13 Line 9713: DATA "1BRASS LAMP".
  $CA85,$11 Line 9714: DATA "1VELMISTA".
  $CA96,$11 Line 9715: DATA "1IRON ROD".
  $CAA7,$12 Line 9716: DATA "1GOLD RING".
  $CAB9,$0D Line 9717: DATA "1TOME".
  $CAC6,$0F Line 9718: DATA "1MIRROR".
  $CAD5,$10 Line 9719: DATA "1EMERALD".
  $CAE5,$14 Line 9720: DATA "1WOODEN BOAT".
  $CAF9,$0D Line 9721: DATA "1OARS".
  $CB06,$16 Line 9722: DATA "1CORKED BOTTLE".
  $CB1C,$12 Line 9723: DATA "1LARGE KEY".
  $CB2E,$14 Line 9724: DATA "1BLACK KNIFE".
  $CB42,$13 Line 9725: DATA "1STALAGMITE".
  $CB55,$10 Line 9726: DATA "1LONGBOW".
  $CB65,$17 Line 9727: DATA "1SILVER CHALICE".
  $CB7C,$1A Line 9728: DATA "1TUNGSTEN CRUCIBLE".
  $CB96,$12 Line 9729: DATA "1LIT TORCH".
  $CBA8,$12 Line 9730: DATA "1TINDERBOX".
  $CBBA,$11 Line 9731: DATA "1DIAMONDS".
  $CBCB,$11 Line 9732: DATA "1GRAPHITE".
  $CBDC,$15 Line 9733: DATA "1GREEN SCROLL".
  $CBF1,$16 Line 9734: DATA "1SILVER DAGGER".
  $CC07,$14 Line 9735: DATA "1CONCH SHELL".
  $CC1B,$14 Line 9736: DATA "1UNLIT TORCH".
  $CC2F,$11 Line 9737: DATA "1IRON KEY".
  $CC40,$12 Line 9738: DATA "1SMALL KEY".
  $CC52,$12 Line 9739: DATA "1IRON RING".
  $CC64,$13 Line 9740: DATA "1RED SCROLL".
  $CC77,$0F Line 9741: DATA "1ARROWS".
  $CC86,$16 Line 9742: DATA "1YELLOW SCROLL".
  $CC9C,$12 Line 9743: DATA "1DAMP MOSS".
  $CCAE,$13 Line 9744: DATA "1DRIED MOSS".
  $CCC1,$23 Line 9801: DATA "750000000000","DOOR",1.
  $CCE4,$23 Line 9802: DATA "040376050000","DOOR",1.
  $CD07,$16 Line 9803: DATA "09000002000001".
  $CD1D,$14 Line 9804: DATA "060002000000".
  $CD31,$16 Line 9805: DATA "060200070000-2".
  $CD47,$14 Line 9806: DATA "080405070000".
  $CD5B,$14 Line 9807: DATA "000605000015".
  $CD6F,$14 Line 9808: DATA "000006000000".
  $CD83,$16 Line 9809: DATA "00000300100002".
  $CD99,$52 Line 9810: DATA "79810077000903","RED DOOR",5,"BLUE DOOR",3,"GREEN
. DOOR",4.
  $CDEB,$23 Line 9811: DATA "000000820000","DOOR",3.
  $CE0E,$23 Line 9812: DATA "000080000014","DOOR",5.
  $CE31,$23 Line 9813: DATA "007800000000","DOOR",4.
  $CE54,$16 Line 9814: DATA "00000015120015".
  $CE6A,$14 Line 9815: DATA "001400070000".
  $CE7E,$14 Line 9816: DATA "000000000000".
  $CE92,$14 Line 9817: DATA "190000000000".
  $CEA6,$14 Line 9818: DATA "211920220000".
  $CEBA,$14 Line 9819: DATA "182117200000".
  $CECE,$14 Line 9820: DATA "231819220000".
  $CEE2,$14 Line 9821: DATA "261918260000".
  $CEF6,$14 Line 9822: DATA "242318200000".
  $CF0A,$14 Line 9823: DATA "252620220000".
  $CF1E,$14 Line 9824: DATA "472525220000".
  $CF32,$14 Line 9825: DATA "242623240000".
  $CF46,$14 Line 9826: DATA "252721230000".
  $CF5A,$14 Line 9827: DATA "280026000000".
  $CF6E,$16 Line 9828: DATA "00312736000006".
  $CF84,$16 Line 9829: DATA "00003500000006".
  $CF9A,$16 Line 9830: DATA "34313632000006".
  $CFB0,$16 Line 9831: DATA "00352830000006".
  $CFC6,$16 Line 9832: DATA "33300000000006".
  $CFDC,$14 Line 9833: DATA "343200460000".
  $CFF0,$16 Line 9834: DATA "00353033000006".
  $D006,$16 Line 9835: DATA "34293100000006".
  $D01C,$14 Line 9836: DATA "003028000000".
  $D030,$14 Line 9837: DATA "003800000000".
  $D044,$14 Line 9838: DATA "390040370000".
  $D058,$23 Line 9839: DATA "009138440000","STEEL DOOR",q.
  $D07B,$14 Line 9840: DATA "384200410000".
  $D08F,$14 Line 9841: DATA "004000000000".
  $D0A3,$14 Line 9842: DATA "000000400000".
  $D0B7,$14 Line 9843: DATA "000000420000".
  $D0CB,$14 Line 9844: DATA "003900000000".
  $D0DF,$23 Line 9845: DATA "000000920000","STEEL DOOR",q.
  $D102,$14 Line 9846: DATA "003347000000".
  $D116,$14 Line 9847: DATA "460024000000".
  $D12A,$14 Line 9848: DATA "000000490000".
  $D13E,$14 Line 9849: DATA "004800500000".
  $D152,$14 Line 9850: DATA "004900510000".
  $D166,$16 Line 9851: DATA "52500000540005".
  $D17C,$14 Line 9852: DATA "000051000000".
  $D190,$14 Line 9854: DATA "550000000051".
  $D1A4,$14 Line 9855: DATA "000054570000".
  $D1B8,$2B Line 9856: DATA "85005800000011","CAGE DOOR",22.
  $D1E3,$28 Line 9857: DATA "005500000083","TRAPDOOR",21.
  $D20B,$2A Line 9858: DATA "890000005700","STONE DOOR",24.
  $D235,$41 Line 9859: DATA "00878600000010","SMALL DOOR",23,"CAGE DOOR",22.
  $D276,$24 Line 9860: DATA "006100880000","DOOR",23.
  $D29A,$16 Line 9861: DATA "00620060000017".
  $D2B0,$14 Line 9862: DATA "630000610000".
  $D2C4,$14 Line 9863: DATA "000062640000".
  $D2D8,$14 Line 9864: DATA "006300650000".
  $D2EC,$16 Line 9865: DATA "66640000670014".
  $D302,$14 Line 9866: DATA "000065000000".
  $D316,$16 Line 9867: DATA "00006800006513".
  $D32C,$14 Line 9868: DATA "670000000000".
  $D340,$14 Line 9869: DATA "000000160000".
  $D354,$16 Line 9871: DATA "00000000000004".
  $D36A,$14 Line 9872: DATA "000000000036".
  $D37E,$14 Line 9873: DATA "000000000000".
  $D392,$14 Line 9874: DATA "000000000000".
  $D3A6,$09 Line 9875: DATA O,w.
  $D3AF,$09 Line 9876: DATA O,O.
  $D3B8,$0A Line 9877: DATA F,or.
  $D3C2,$0A Line 9878: DATA F,oz.
  $D3CC,$0A Line 9879: DATA V,ow.
  $D3D6,$0A Line 9880: DATA V,oz.
  $D3E0,$0A Line 9881: DATA R,oo.
  $D3EA,$0A Line 9882: DATA r,oz.
  $D3F4,$17 Line 9883: DATA 21,58.
  $D40B,$17 Line 9884: DATA 21,57.
  $D422,$17 Line 9885: DATA 22,59.
  $D439,$17 Line 9886: DATA 22,56.
  $D450,$17 Line 9887: DATA 23,60.
  $D467,$17 Line 9888: DATA 23,59.
  $D47E,$17 Line 9889: DATA 24,56.
  $D495,$17 Line 9890: DATA 24,58.
  $D4AC,$10 Line 9891: DATA q,45.
  $D4BC,$10 Line 9892: DATA q,39.
  $D4CC,$2F Line 9901: LET SP=9460: PRINT "I'm in Ogeron's house.": RETURN.
  $D4FB,$41 Line 9902: PRINT "I'm at Ogeron's house, on the   edge of a large
. forest.": RETURN.
  $D53C,$3C Line 9903: PRINT "I'm in dense forest beside a"'"large cave
. opening.": RETURN.
  $D578,$1F Line 9904: PRINT "I'm in dense forest.": RETURN.
  $D597,$24 Line 9905: PRINT "I'm on the scorched plains": RETURN.
  $D5BB,$1F Line 9906: PRINT "I'm in arid scrubland": RETURN.
  $D5DA,$42 Line 9907: PRINT "I'm in the shattered hills."'"A narrow crack leads
. down.": RETURN.
  $D61C,$70 Line 9908: PRINT "I'm on the fertile banks of"'"the fast flowing
. river Cara."'"A rope hangs from a tree here." AND PEEK (t+r)=c+o: RETURN.
  $D68C,$33 Line 9909: PRINT "I'm in the main hall of the"'"Urga-Mauls.":
. RETURN.
  $D6BF,$52 Line 9910: PRINT "I'm on a high balcony"'"overlooking a large cavern
. of   many Urga-Mauls.": RETURN.
  $D711,$27 Line 9911: PRINT "I'm in the Urga-Maul dungeon.": RETURN.
  $D738,$6A Line 9912: PRINT "I'm in a narrow stale smelling  passage. Urga-Maul
. skulls line  the sides of steps leading down.": RETURN.
  $D7A2,$4D Line 9913: PRINT "I'm in the Urga-Mauls' treasure room. There is a
. large chest"'"here": RETURN.
  $D7EF,$3A Line 9914: PRINT "I'm in the large comfortably litCavezats cavern.":
. RETURN.
  $D829,$7F Line 9915: PRINT "I'm on a high platform"'"overlooking a large
. subterraneanwaterfall.";" A rope is tied to a  stalagmite here." AND PEEK
. (t+r)=c: RETURN.
  $D8A8,$4C Line 9916: PRINT "I'm at the base of a large"'"waterfall. A rope
. hangs down    here.": RETURN.
  $D8F4,$48 Line 9917: PRINT "I'm on the north bank of the"'"Cara. Carawood is
. to the north.": RETURN.
  $D93C,$29 Line 9926: PRINT "I'm in Carawood.": LET sp=9435: RETURN.
  $D965,$59 Line 9927: PRINT "I stand beside Tylon's castle.  A moat of serpents
. surrounds it.": LET sp=9450: RETURN.
  $D9BE,$6A Line 9935: PRINT "I'm amongst the vile swamps of 
. Caradoom."'"Timandra is tied to a tree." AND op=29 AND NOT o(20): RETURN.
  $DA28,$62 Line 9936: LET sp=9440: PRINT "I'm in the dragons lair
. in"'"Caradoom. A huge"'"Hishara tree stands here.": RETURN.
  $DA8A,$31 Line 9937: PRINT "I'm at the entrance of Tylon's  castle.": RETURN.
  $DABB,$65 Line 9938: PRINT "I'm in a large dusty entrance"'"hall. The place
. hasn't been"'"lived in for quite some time.": RETURN.
  $DB20,$31 Line 9940: PRINT "I'm at the end of long dusty"'"passage.": RETURN.
  $DB51,$4A Line 9941: PRINT "I'm in a small dusty bedroom.   There are a set of
. drawers here.": RETURN.
  $DB9B,$74 Line 9942: LET sp=VAL "9545": PRINT "I'm in Tylon's laboratory.
. Thereis a furnace and a barrel of"'"green liquid here marked AU/FE.": RETURN.
  $DC0F,$55 Line 9943: PRINT "I'm in Tylon's bedroom. There isa four poster bed
. and a large   chest here.": RETURN.
  $DC64,$65 Line 9944: PRINT "I'm in the cloister garden, a   gargoyle statue
. stands amongst  rags & bones in the centre.": RETURN.
  $DCC9,$A3 Line 9945: PRINT "I'm in a strange metallic alcove.There is a dial
. marked from 1  to 35 and a button marked"'"ACTIVATE. I can hear a humming 
. noise. The dial is set on ";di: RETURN.
  $DD6C,$6A Line 9946: PRINT "I'm on a small beach at the edgeof the Serpent
. Sea. Across the  water stands Grako's black tower": RETURN.
  $DDD6,$56 Line 9947: PRINT "I'm amongst thick vegetation at the water's edge.
. I can see the black tower.": RETURN.
  $DE2C,$31 Line 9948: PRINT "I'm at the base of Black Tower  island.": RETURN.
  $DE5D,$30 Line 9949: PRINT "I'm at the entrance to the blacktower.": RETURN.
  $DE8D,$25 Line 9950: PRINT "I'm in a long dark passage.": RETURN.
  $DEB2,$76 Line 9951: PRINT "I'm in the Troll guard room. An iron spiral
. staircase leads up"'"A stone troll stands here." AND PEEK (m1+34)=c: RETURN.
  $DF28,$61 Line 9952: PRINT "I'm in the acrid smelling Troll lair. Several
. inches of putrid  fluid covers the floor.": RETURN.
  $DF89,$41 Line 9954: LET sp=VAL "9415": PRINT "I'm on a balcony overlooking
. theguard room.": RETURN.
  $DFCA,$36 Line 9955: PRINT "I'm in a small study. There is  a desk here.":
. RETURN.
  $E000,$80 Line 9956: PRINT "I'm in a natural cave. The"'"northern portion has
. been made  into a cage for a large Karush. (Pretty good guard-dog!).": RETURN.
  $E080,$74 Line 9957: PRINT "I'm at the shrine of Grako. A   huge demonic idol
. stands with   sword poised over a trapdoor in the floor.": RETURN.
  $E0F4,$76 Line 9958: PRINT "I'm in a natural cave. The flooris strewn with
. debris from a"'"recent rock fall. There is a"'"skeleton here.": RETURN.
  $E16A,$21 Line 9959: PRINT "I'm in the Karush cage.": RETURN.
  $E18B,$A5 Line 9960: PRINT "I'm in a large domed cavern. A  natural rock
. bridge spans a"'"bottomless abyss to the east."'"A Darg-vool guards the far
. side of the bridge." AND PEEK (m2+31): RETURN.
  $E230,$49 Line 9961: PRINT "I stand on a narrow rock bridge across a near
. bottomless abyss.": RETURN.
  $E279,$66 Line 9962: PRINT "I'm in a large domed cavern. A   natural rock
. bridge spans a"'"bottomless abyss to the east.": RETURN.
  $E2DF,$2D Line 9964: PRINT "I'm in a long winding"'"passageway.": RETURN.
  $E30C,$5B Line 9965: PRINT "I'm in a hot dusty cavern. A"'"fiery glow emanates
. from 40ft   up the south wall.": RETURN.
  $E367,$21 Line 9966: PRINT "I'm in the Zalrog lair.": RETURN.
  $E388,$28 Line 9967: PRINT "I'm in a long well lit passage": RETURN.
  $E3B0,$4A Line 9968: PRINT "I'm in Grako's lair. The walls  are adorned with
. images of hate.": RETURN.
  $E3FA,$23 Line 9969: PRINT "I'm in a small damp cave.": RETURN.
  $E41D,$66 Line 9971: PRINT "I'm at sea. To the west is the  Black Tower
. surounded by Sirens and to the east is Caraland.": RETURN.
  $E483,$35 Line 9972: LET se=9495: GO SUB se: PRINT "I'm up the Hishara tree.":
. RETURN.
  $E4B8,$55 Line 9973: PRINT "I'm in a boat at the shores of  Caraland. To the
. west is the"'"Black Tower.": RETURN.
  $E50D,$5E Line 9974: PRINT "I'm in a boat at the base of"'"Black Tower island.
. The sea is  swarming with sirens.": RETURN.

b $E56B BASIC Variables
@ $E56B label=BasicVariables
D $E56B Saved BASIC variables at load, from #SKOOLKID$5C4B(VARS) up to the
. #N$80 end marker. #HTML(<code>z</code>-<code>q</code>,
. <code>oz</code>-<code>oq</code> and <code>wvw</code>-<code>wvv</code>
. are numeric constants; adventure state, GO SUB line numbers,
. <code>DIM O(30)</code> and working strings follow. <code>b</code>,
. <code>m</code> and <code>n</code> are FOR-NEXT controls in this
. snapshot; <code>b</code>'s value is still 1105 for
. <code>GO SUB b</code>.)
N $E56B Numeric variable z (#N$00).
  $E56B,$06
N $E571 Numeric variable o (#N$01).
  $E571,$06
N $E577 Numeric variable w (#N$02).
  $E577,$06
N $E57D Numeric variable r (#N$03).
  $E57D,$06
N $E583 Numeric variable f (#N$04).
  $E583,$06
N $E589 Numeric variable v (#N$05).
  $E589,$06
N $E58F Numeric variable i (#N$06).
  $E58F,$06
N $E595 Numeric variable s (#N$07).
  $E595,$06
N $E59B Numeric variable g (#N$08).
  $E59B,$06
N $E5A1 Numeric variable q (#N$09).
  $E5A1,$06
N $E5A7 Numeric variable oz (#N$0A).
  $E5A7,$07
N $E5AE Numeric variable oo (#N$0B).
  $E5AE,$07
N $E5B5 Numeric variable ow (#N$0C).
  $E5B5,$07
N $E5BC Numeric variable or (#N$0D).
  $E5BC,$07
N $E5C3 Numeric variable of (#N$0E).
  $E5C3,$07
N $E5CA Numeric variable ov (#N$0F).
  $E5CA,$07
N $E5D1 Numeric variable oi (#N$10).
  $E5D1,$07
N $E5D8 Numeric variable os (#N$11).
  $E5D8,$07
N $E5DF Numeric variable og (#N$12).
  $E5DF,$07
N $E5E6 Numeric variable oq (#N$13).
  $E5E6,$07
N $E5ED Numeric variable wvw (#N$FC).
  $E5ED,$08
N $E5F5 Numeric variable wvr (#N$FD).
  $E5F5,$08
N $E5FD Numeric variable wvf (#N$FE).
  $E5FD,$08
N $E605 Numeric variable wvv (#N$FF).
  $E605,$08
N $E60D Numeric variable qq (#N$00).
  $E60D,$07
N $E614 Numeric variable di (dial position, #N$0E).
  $E614,$07
N $E61B Numeric variable mu (#N$00).
  $E61B,$07
N $E622 Numeric variable go (turn counter, #N$13).
  $E622,$07
N $E629 Numeric variable ob (carried count, #N$04).
  $E629,$07
N $E630 Numeric variable nn (#R$5BAC).
  $E630,$07
N $E637 Numeric variable vn (#R$5BAB).
  $E637,$07
N $E63E Numeric variable op (current location, #N$0A).
  $E63E,$07
N $E645 Numeric variable t (#R$FA00).
  $E645,$06
N $E64B Numeric variable nd (#R$5BA9).
  $E64B,$07
N $E652 Numeric variable mo (#N$04).
  $E652,$07
N $E659 Numeric variable t1 (#N$06).
  $E659,$07
N $E660 Numeric variable t2 (#N$00).
  $E660,$07
N $E667 Numeric variable da (daylight flag, #N$01).
  $E667,$07
N $E66E Numeric variable se (special-event GO SUB, #N$00).
  $E66E,$07
N $E675 Numeric variable sp (special-event GO SUB, #N$00).
  $E675,$07
N $E67C Numeric variable hp (hit points, #N$0F).
  $E67C,$07
N $E683 Numeric variable co (combat flag, #N$00).
  $E683,$07
N $E68A FOR-NEXT control variable b (value 1105).
  $E68A,$13
N $E69D Numeric variable cn (GO SUB 8050).
  $E69D,$07
N $E6A4 Numeric variable h (GO SUB 350).
  $E6A4,$06
N $E6AA Numeric variable cc (GO SUB 8002).
  $E6AA,$07
N $E6B1 Numeric variable e (GO SUB 8003).
  $E6B1,$06
N $E6B7 Numeric variable sl (GO SUB 8004).
  $E6B7,$07
N $E6BE Numeric variable d (GO SUB 4299).
  $E6BE,$06
N $E6C4 Numeric variable u (GO SUB 3830).
  $E6C4,$06
N $E6CA Numeric variable c (GO SUB 200).
  $E6CA,$06
N $E6D0 Numeric variable y (GO SUB 8000).
  $E6D0,$06
N $E6D6 Numeric variable k (GO SUB 8001).
  $E6D6,$06
N $E6DC Numeric variable m1 (#R$FA2D).
  $E6DC,$07
N $E6E3 Numeric variable m2 (#R$F9E8(#N$FA4F)).
  $E6E3,$07
N $E6EA Numeric variable m3 (#R$F9E8(#N$FA85)).
  $E6EA,$07
N $E6F1 FOR-NEXT control variable m (line 6377).
  $E6F1,$13
N $E704 Numeric variable np (next location, #N$00).
  $E704,$07
N $E70B FOR-NEXT control variable n (line 9506).
  $E70B,$13
N $E71E Numeric variable no (#N$00).
  $E71E,$07
N $E725 Numeric variable x (#N$00).
  $E725,$06
N $E72B Numeric variable p (#N$0B).
  $E72B,$06
N $E731 Numeric variable j (#N$03).
  $E731,$06
N $E737 Numeric variable a (#R$EA6C).
  $E737,$06
N $E73D Numeric variable ee (GO SUB 8005).
  $E73D,$07
N $E744 Numeric variable l (completion %, #N$00).
  $E744,$06
N $E74A String variable n$ (" is injured.").
  $E74A,$03 Name and length.
T $E74D,$0C " is injured."
N $E759 Numeric array o (DIM O(30)).
  $E759,$06 Name, length and dimensions.
  $E75F,$96 Element values.
N $E7F5 String variable b$ ("OGERON").
  $E7F5,$03 Name and length.
T $E7F8,$06 "OGERON"
N $E7FE String variable v$ ("GREEN DOOR").
  $E7FE,$03 Name and length.
T $E801,$0A "GREEN DOOR"
N $E80B String variable a$ ("09000002000001").
  $E80B,$03 Name and length.
T $E80E,$0E "09000002000001"
N $E81C End marker.
  $E81C,$01

b $E81D Edit Line
@ $E81D label=EditLine
D $E81D The current BASIC edit line, from #SKOOLKID$5C59(E_LINE) up to
. #SKOOLKID$5C61(WORKSP). Left over from #HTML(<code>LOAD ""</code>).
  $E81D,$0F

b $E82C Workspace
@ $E82C label=Workspace
D $E82C BASIC workspace (#SKOOLKID$5C61(WORKSP)) through the calculator
. stack (#SKOOLKID$5C63(STKBOT) / #SKOOLKID$5C65(STKEND)).
  $E82C,$22

u $E84E
  $E84E,$0160

b $E9AE Machine Stack
@ $E9AE label=MachineStack
D $E9AE The machine stack sits just below the support block; on load
. #REGsp points here.
  $E9AE,$08

b $E9B6 Loaded Machine Code
@ $E9B6 label=LoadedMachineCode
D $E9B6 The final tape block loads #N$164A bytes here through
. #N$FFFF. It overwrites the Micromega 1.1 loader that lived here
. during loading. BASIC reaches the support code through the jump table at
. #R$EA60.
N $E9B6 Documented so far: #R$EA60 (jump table, commands and all verb
. handlers), #R$EB51 (input line), vocabulary lookup / tables, #R$EA8D
. (character printing), #R$EEF1 (message scripts) and #R$EFFB
. (location graphics).
  $E9B6,$AA

c $EA60 Jump Table
@ $EA60 label=JumpTable
D $EA60 #HTML(BASIC <code>USR</code> <code>n</code> lands on address
. <code>n</code> and follows the <code>JP</code> there.)
N $EA60 #HTML(Action dispatch (BASIC). After #R$F0E6 returns from ENTER,
. line 130 <code>GO SUB 1000</code>. Line 1010 calls <code>USR</code>
. #R$EA63 (#R$ED2D); on a hit, line 1020 advances the token, reads an
. optional noun via <code>USR</code> #R$EA69, then
. <code>GO TO n*100+1000</code> for verb index <code>n</code>. Separately,
. line 310 calls <code>USR</code> #R$EA6F (#R$ED7E) for #R$F99C:
. indices #N$01-#N$06 move; #N$07+ go to line 400.)
N $EA60 Core command handlers (BASIC, via #R$ED7E). LOOK at line
. 441 goes to 350 to redraw the room; lines 450-499 ("I see") are a
. shared subroutine reached from there and elsewhere.
N $EA60 #TABLE(default,centre,centre,centre)
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
N $EA60 #HTML(Core verb handlers (BASIC, via #R$ED2D then
. <code>n*100+1000</code>). Noun index from #R$ED71 is BASIC
. <code>x</code> where used. ENTER (<code>GO TO</code> 1800) and GO
. (<code>GO TO</code> 1900) share one handler at line 1910, since there
. are no lines from 1800 to 1909.)
N $EA60 #TABLE(default,centre,centre,centre)
. { =h Idx | =h Word | =h Summary }
. { #N$01 | GET | Take item }
. { #N$02 | TAKE | Same as GET }
. { #N$03 | DROP | Drop item }
. { #N$04 | EXAMINE | Examine; may reveal }
. { #N$05 | SEARCH | Find concealed items }
. { #N$08/#N$09 | ENTER/GO | Shared at 1910 }
. { #N$19 | LOOK | Look at noun/dir }
. TABLE#
N $EA60 #HTML(Remaining verbs in #R$FAA9 (indices #N$06-#N$2E
. except the core rows above). Line 1020 still uses
. <code>GO TO n*100+1000</code>; when that line is missing, BASIC
. continues at the next existing line.)
N $EA60 Combat and speech. ATTACK and KILL share one fight
. routine: with a carried weapon they injure or slay a creature in
. the room. SAY talks to creatures (and can trigger give/take replies).
. HIT smashes a magical ward or, with the staff, turns a foe to dust;
. BREAK is the same fight path. SHOOT fires the bow.
N $EA60 Movement and the boat. CLIMB covers the rope, a tree and
. the boat mast. SWIM crosses the river; SWING on a hanging rope joins
. that same crossing. PULL and MOVE share one routine for hauling the
. boat into the sea, tugging the tied rope, or opening a sliding panel.
. PUSH works the lever. LEAVE, ROW and BAIL handle getting out of nested
. places and travelling or emptying the boat (ROW needs the oars; BAIL
. needs a helmet).
N $EA60 Inventory and wearables. THROW drops a carried object into
. the scenery (river, tree, far bank). WEAR and REMOVE put on or take
. off clothing and gems. GIVE hands an object to a creature. EAT
. consumes food and can restore hits. PUT stashes things in containers,
. the furnace crucible, the black sack or a chest. INSERT seats the pin
. that locks the sword arm.
N $EA60 Doors, chests and light. UNLOCK, OPEN, CLOSE and LOCK all
. resolve the target door or chest through the shared helper at line
. 2650, then change its open/locked state (keys must fit). LIGHT and
. EXTINGUISH manage the torch. TURN works the furnace or the dial.
N $EA60 Magic and discovery. READ shows book and scroll texts.
. CAST spends a scroll plus its ingredient (fire protection, cure
. disease, heal). RUB the lamp for the Jinni. DIG may unearth a buried
. find; DIP melts metal in the furnace; LISTEN can reveal the death-
. beetle hint. TIE and UNTIE fasten or free the rope on a stalagmite
. (UNTIE also frees Timandra). USE only asks for a more specific verb.
N $EA60 #HTML(Landing notes where the nominal
. <code>n*100+1000</code> line is missing or shared:)
N $EA60 #TABLE(default,centre,centre,centre)
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
N $EA91 #HTML(Pick the plot opcode written into #R$EAF0(#N$EAF1):
. #N$AE (<code>XOR (HL)</code>) or #N$B6 (<code>OR (HL)</code>) from
. bit 2 of the flags.)
  $EA91,$03 Fetch *#R$5BF6.
  $EA94,$02 Test bit 2.
  $EA96,$04 #HTML(Prefer #N$AE (<code>XOR</code>) unless bit 2 was set.)
  $EA9A,$02 #HTML(#REGa=#N$B6 (<code>OR</code>).)
@ $EA9C label=PrintCharacter_SetPlotOpcode
@ $EA9C keep
  $EA9C,$03 Patch that opcode into #R$EAF0(#N$EAF1).
N $EA9F Point #REGhl at the 8-byte glyph. Codes below #N$8F use
. #SKOOLKID$5C36(CHARS); #N$90 and above were meant to index
. #SKOOLKID$5C7B(UDG), but the unconditional jump at #R$EAA4 always takes
. the #SKOOLKID$5C36(CHARS) path.
  $EA9F,$05 Fetch *#R$5BF9 and compare it with #N$8F.
@ $EAA4 label=PrintCharacter_ForceChars
  $EAA4,$02 Always take the #SKOOLKID$5C36(CHARS) path at #R$EAB6.
N $EAA6 Unreachable #SKOOLKID$5C7B(UDG) path (left in the binary after
. #R$EAA4).
  $EAA6,$02 Jump to #R$EAB6 if carry is set.
  $EAA8,$0C Scale the UDG index and point #REGhl at
. #SKOOLKID$5C7B(UDG).
  $EAB4,$02 Jump to #R$EAC1.
@ $EAB6 label=PrintCharacter_CharsGlyph
  $EAB6,$0B Point #REGhl at glyph *#R$5BF9 in #SKOOLKID$5C36(CHARS).
N $EAC1 Convert row/column at #R$5BF7 into a display-file address in
. #REGde.
@ $EAC1 label=PrintCharacter_ScreenAddress
  $EAC1,$03 #REGde=#N$4000 (screen buffer).
  $EAC4,$04 #REGbc=*#R$5BF7.
  $EAC8,$05 Jump to #R$EB39 if the column is out of range.
  $EACD,$05 Jump to #R$EB39 if the row is out of range.
@ $EAD2 label=PrintCharacter_RowThirds
  $EAD2,$04 Jump to #R$EAE0 if this row is already in the current third.
  $EAD6,$0A Move #REGd down one screen third and try again.
@ $EAE0 label=PrintCharacter_ColumnOffset
  $EAE0,$07 Fold the row remainder and column into #REGe.
N $EAE7 #HTML(Copy or <code>XOR</code> the 8 glyph rows into the display
. file.)
  $EAE7,$03 Fetch *#R$5BF6.
  $EAEA,$02,b$01 Keep only bit 0.
  $EAEC,$02 #HTML(Jump to #R$EAF9 if <code>XOR</code> mode is clear.)
  $EAEE,$02 #REGb=#N$08.
@ $EAF0 label=PrintCharacter_XorLoop
M $EAF0,$07 #HTML(Plot one glyph row with the patched
. <code>XOR</code>/<code>OR</code> at #R$EAF0(#N$EAF1) and move down a
. pixel line.)
  $EAF7,$02 Jump to #R$EB01.
@ $EAF9 label=PrintCharacter_CopyLoop
  $EAF9,$02 #REGb=#N$08.
@ $EAFB label=PrintCharacter_CopyLoop_Body
M $EAFB,$06 Copy one glyph row into the display file and move down a
. pixel line.
N $EB01 Unless bit 1 of the flags is set, write the attribute from
. #R$5BF5 into the matching attribute-file cell.
@ $EB01 label=PrintCharacter_Attributes
  $EB01,$03 Fetch *#R$5BF6.
  $EB04,$02,b$01 Keep only bit 1.
  $EB06,$02 Jump to #R$EB28 if attributes are skipped.
  $EB08,$0B Point #REGhl at the attribute-file cell for *#R$5BF7.
@ $EB13 label=PrintCharacter_AttrRow
  $EB13,$04 Jump to #R$EB19 if another attribute third remains.
  $EB17,$02 Jump to #R$EB1C.
@ $EB19 label=PrintCharacter_AttrNextThird
  $EB19,$03 Step #REGh to the next attribute third and retry.
@ $EB1C label=PrintCharacter_AttrColumn
  $EB1C,$04 Restore the row remainder into #REGb and load the column.
  $EB20,$02 Jump to #R$EB26 if that remainder is zero.
  $EB22,$04 Add #N$20 per remaining row to reach the cell.
@ $EB26 label=PrintCharacter_WriteAttr
  $EB26,$02 Write *#R$5BF5 into that attribute-file cell.
N $EB28 Advance the cursor: move to the next column, or wrap to the next
. row.
@ $EB28 label=PrintCharacter_AdvanceCursor
  $EB28,$05 Advance the column.
  $EB2D,$05 Jump to #R$EB35 if the column is still on this row.
  $EB32,$03 Wrap to column #N$00 on the next row.
@ $EB35 label=PrintCharacter_StoreCursor
  $EB35,$04 Store the updated cursor back in *#R$5BF7.
@ $EB39 label=PrintCharacter_Exit
  $EB39,$04 Restore the glyph pointer, screen pointer, counters and
. flags from the stack.
  $EB3D,$01 Return.

c $EB3E Input Line Symbol-Shift Remap
@ $EB3E label=InputLine_SymbolShiftRemap
D $EB3E #HTML(Reached from #R$EB81. Any other key returns to #R$EB5E.)
  $EB3E,$05 Jump to #R$EB48 unless the key is "P".
  $EB43,$03 #HTML(#REGe=<code>"</code>.)
  $EB46,$02 Jump to #R$EB83.
@ $EB48 label=InputLine_SymbolShiftRemap_J
  $EB48,$04 Jump to #R$EB5E unless the key is "J".
  $EB4C,$03 #REGe="-".
  $EB4F,$02 Jump to #R$EB83.

c $EB51 Input Line
@ $EB51 label=InputLine
D $EB51 Main game entry from #R$EA66. ENTER submits via #R$F0E6.
  $EB51,$0A Write #N$00 to *#R$5BFB, *#R$5BFA and *#R$5BFD.
  $EB5B,$03 Call #R$ECF0.
N $EB5E Wait until a new key is down.
@ $EB5E label=InputLine_Poll
  $EB5E,$04 Copy *#R$5BFC to #REGd.
  $EB62,$03 Read #SKOOLKID$5C00(KSTATE) (second key slot).
  $EB65,$03 Write the key to *#R$5BFC.
  $EB68,$04 Jump to #R$EB5E if none is down.
  $EB6C,$03 Jump to #R$EB5E if the key has not changed.
  $EB6F,$01 #REGe=#REGa.
N $EB70 Test for Caps Shift.
  $EB70,$05 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FE | CAPS SHIFT | Z | X | C | V }
. TABLE#
  $EB75,$05 Jump to #R$EBF5 when Caps Shift is held.
  $EB7A,$05 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$7F | SPACE | SYMBOL SHIFT | M | N | B }
. TABLE#
  $EB7F,$02 Test the Symbol Shift bit.
N $EB81 Test for Symbol Shift.
@ $EB81 label=InputLine_SymbolShiftHeld
  $EB81,$02 Jump to #R$EB3E when it is held.
N $EB83 Handle an ordinary keypress.
@ $EB83 label=InputLine_HandleKey
  $EB83,$05 Jump to #R$EBD9 if ENTER was pressed.
N $EB88 Append the character to the input buffer.
  $EB88,$04 Fetch *#R$5BFA into #REGd.
  $EB8C,$04 Jump to #R$EB5E if the line already holds #N$3E characters.
  $EB90,$0A Store the key in #R$5BAE and *#R$5BF9.
  $EB9A,$0E Set #R$5BF8, #R$5BF6 and #R$5BF5 for echoing on row #N$16.
  $EBA8,$04 Copy *#R$5BFA to *#R$5BF7.
  $EBAC,$04 Jump to #R$EBBA if the column is still on this row.
  $EBB0,$0A Wrap onto row #N$17.
N $EBBA Echo it onto the input row.
@ $EBBA label=InputLine_EchoChar
  $EBBA,$03 Call #R$EA8D.
  $EBBD,$0A Grow *#R$5BFB if this column is new.
N $EBC7 Advance the cursor, click, and poll again.
@ $EBC7 label=InputLine_AdvanceCursor
  $EBC7,$05 Advance *#R$5BFA.
  $EBCC,$03 Call #R$ECF0.
  $EBCF,$05 Set *#R$5BFD.
  $EBD4,$03 Call #R$ED23.
  $EBD7,$02 Jump to #R$EB5E.
N $EBD9 Terminate the buffer with ENTER and submit the line.
@ $EBD9 label=InputLine_Enter
  $EBD9,$06 Copy *#R$5BFB to *#R$5BFE.
  $EBDF,$0A Write ENTER (#N$0D) at the end of #R$5BAE.
  $EBE9,$09 Point #R$5BA7 and #R$5BA9 at #R$5BAE.
  $EBF2,$03 Jump to #R$F0E6.
N $EBF5 #HTML(Caps Shift chords: <code>1</code> restore length, <code>5</code>/
. <code>8</code> move the cursor, <code>9</code> insert a space,
. <code>0</code> delete, <code>2</code> is a no-op stub.)
@ $EBF5 label=InputLine_CapsShift
  $EBF5,$05 Jump to #R$EC12 if Caps Shift + 1.
  $EBFA,$04 Jump to #R$EC25 if Caps Shift + 2.
  $EBFE,$04 Jump to #R$EC36 if Caps Shift + 5.
  $EC02,$04 Jump to #R$EC4D if Caps Shift + 8.
  $EC06,$05 Jump to #R$EC97 if Caps Shift + 0.
  $EC0B,$04 Jump to #R$EC68 if Caps Shift + 9.
  $EC0F,$03 Jump to #R$EB5E.
N $EC12 Restore the saved length and redraw.
@ $EC12 label=InputLine_Caps1
  $EC12,$07 Jump to #R$EB5E if *#R$5BFD is set.
  $EC19,$06 Copy *#R$5BFE to *#R$5BFB.
  $EC1F,$03 Call #R$ECC0.
  $EC22,$03 Jump to #R$EB5E.
N $EC25 Caps Shift + 2 is a no-op.
@ $EC25 label=InputLine_Caps2
  $EC25,$0A Jump to #R$EB5E.
  $EC2F,$06 Copy *#R$5BFE to *#R$5BFB.
  $EC35,$01 Return.
N $EC36 Move the cursor one column left and redraw it.
@ $EC36 label=InputLine_Caps5
  $EC36,$07 Jump to #R$EB5E if already at the start.
  $EC3D,$03 Call #R$ED1C.
  $EC40,$07 Decrease *#R$5BFA.
  $EC47,$03 Call #R$ECF0.
  $EC4A,$03 Jump to #R$EB5E.
N $EC4D Move the cursor one column right and redraw it.
@ $EC4D label=InputLine_Caps8
  $EC4D,$0B Jump to #R$EB5E if already at the end of the line.
  $EC58,$03 Call #R$ED1C.
  $EC5B,$07 Increase *#R$5BFA.
  $EC62,$03 Call #R$ECF0.
  $EC65,$03 Jump to #R$EB5E.
N $EC68 Insert a space at the cursor by shifting the tail right.
@ $EC68 label=InputLine_Caps9
  $EC68,$08 Jump to #R$EB5E if the line is full.
  $EC70,$04 Increase *#R$5BFB.
  $EC74,$08 Work out how many bytes to shift.
  $EC7C,$06 Point #REGhl at the end of #R$5BAE.
  $EC82,$02 Copy #REGhl to #REGde (using the stack).
  $EC84,$05 Shift the tail right.
  $EC89,$03 Write a space at the cursor.
  $EC8C,$03 Call #R$ECC0.
  $EC8F,$05 Set *#R$5BFD.
  $EC94,$03 Jump to #R$EB5E.
N $EC97 Delete the character left of the cursor by shifting the tail left.
@ $EC97 label=InputLine_Caps0
  $EC97,$07 Jump to #R$EB5E if already at the start.
  $EC9E,$04 Decrease *#R$5BFA.
  $ECA2,$08 Decrease *#R$5BFB.
  $ECAA,$03 Count the bytes to shift.
  $ECAD,$06 Point #REGhl at the cursor in #R$5BAE.
  $ECB3,$02 Copy #REGhl to #REGde (using the stack).
  $ECB5,$05 Shift the tail left.
  $ECBA,$03 Call #R$ECC0.
  $ECBD,$03 Jump to #R$EB5E.

c $ECC0 Input Line Redraw
@ $ECC0 label=InputLine_Redraw
D $ECC0 Redraws the input row, then the cursor at #R$ECF0.
  $ECC0,$03 Point #REGhl at #R$5BAE.
  $ECC3,$07 Write #N$00 to *#R$5BF6 and *#R$5BF7.
  $ECCA,$05 Write #N$05 to *#R$5BF5.
  $ECCF,$05 Write #N$16 to *#R$5BF8.
  $ECD4,$06 Jump to #R$ECE5 if the line is empty.
  $ECDA,$01 #REGb=the line length.
N $ECDB Print each buffered character.
@ $ECDB label=InputLine_Redraw_Loop
M $ECDB,$0A Call #R$EA8D for the next character.
N $ECE5 Pad the rest of the row with spaces.
@ $ECE5 label=InputLine_Redraw_Pad
  $ECE5,$05 Write a space to *#R$5BF9.
  $ECEA,$03 Call #R$EA8D.
  $ECED,$03 Call #R$EA8D.
N $ECF0 Draw the blinking cursor.
@ $ECF0 label=InputLine_DrawCursor
  $ECF0,$05 Write #N$28 to *#R$5BF5.
N $ECF5 #HTML(Set <code>XOR</code> mode and load a space glyph.)
@ $ECF5 label=InputLine_DrawCursor_Body
  $ECF5,$05 #HTML(Set <code>XOR</code> mode in *#R$5BF6.)
  $ECFA,$05 Write a space to *#R$5BF9.
  $ECFF,$05 Write #N$16 to *#R$5BF8.
  $ED04,$06 Copy *#R$5BFA to *#R$5BF7.
  $ED0A,$04 Jump to #R$ED18 if the column is still on this row.
  $ED0E,$0A Wrap onto row #N$17.
N $ED18 Print the cursor glyph.
@ $ED18 label=InputLine_DrawCursor_Print
  $ED18,$03 Call #R$EA8D.
  $ED1B,$01 Return.

c $ED1C Input Line Clear Cursor
@ $ED1C label=InputLine_ClearCursor
D $ED1C Same as #R$ECF0, used before moving the cursor.
  $ED1C,$05 Write #N$05 to *#R$5BF5.
  $ED21,$02 Jump to #R$ECF5.

c $ED23 Input Line Click
@ $ED23 label=InputLine_Click
D $ED23 Heard after a character is accepted.
  $ED23,$09 Play a short click through #SKOOLKID$03B5(BEEPER).
  $ED2C,$01 Return.

c $ED2D Search Vocabulary (Verbs)
@ $ED2D label=SearchVocabulary_Verbs
D $ED2D #HTML(Jump-table target #R$EA63 (<code>USR</code> #R$EA63). On a
. hit, BASIC <code>GO TO n*100+1000</code> for verb index <code>n</code>
. (see #R$EA60).)
  $ED2D,$05 Write #N$02 to *#R$5BA4.
  $ED32,$05 Point #REGhl at #R$FAA9 with word limit #N$2F.
N $ED37 Shared search loop used by #R$ED2D, #R$ED65, #R$ED71 and #R$ED7E.
@ $ED37 label=SearchVocabulary_Loop
  $ED37,$05 Write #N$01 to *#R$5BA5.
N $ED3C Compare this table word.
@ $ED3C label=SearchVocabulary_TryWord
  $ED3C,$02 Stash #REGhl and #REGbc on the stack.
  $ED3E,$04 Copy *#R$5BA7 to #REGde.
  $ED42,$03 Call #R$ED8A.
  $ED45,$02 Restore #REGbc and #REGhl from the stack.
  $ED47,$02 Jump to #R$ED5E if the word matched.
@ $ED49 label=SearchVocabulary_SkipWord
  $ED49,$06 Skip ahead to the ENTER that ends this table word.
  $ED4F,$01 Advance #REGhl past the ENTER.
  $ED50,$07 Increment *#R$5BA5.
  $ED57,$03 Jump to #R$ED3C if there are more words to try.
  $ED5A,$03 #REGbc=#N($0000,$04,$04) on a miss.
  $ED5D,$01 Return.
N $ED5E A vocabulary word matched.
@ $ED5E label=SearchVocabulary_Matched
  $ED5E,$06 Copy *#R$5BA5 into #REGbc.
  $ED64,$01 Return.

c $ED65 Search Vocabulary (Prepositions)
@ $ED65 label=SearchVocabulary_Prepositions
D $ED65 #HTML(Jump-table target #R$EA60 (<code>USR</code> #R$EA60). Uses
. the shared loop at #R$ED37.)
  $ED65,$05 Write #N$02 to *#R$5BA4.
  $ED6A,$05 Point #REGhl at #R$FBA8 with word limit #N$09.
  $ED6F,$02 Jump to #R$ED37.

c $ED71 Search Vocabulary (Nouns)
@ $ED71 label=SearchVocabulary_Nouns
D $ED71 #HTML(Jump-table target #R$EA69 (<code>USR</code> #R$EA69). BASIC
. stores the index as <code>x</code> for verb handlers (see #R$EA60).)
  $ED71,$05 Write #N$02 to *#R$5BA4.
  $ED76,$05 Point #REGhl at #R$FBF4 with word limit #N$43.
  $ED7B,$03 Jump to #R$ED37.

c $ED7E Search Vocabulary (Commands)
@ $ED7E label=SearchVocabulary_Commands
D $ED7E #HTML(Jump-table target #R$EA6F (<code>USR</code> #R$EA6F). Short
. commands like <code>UP</code> still hit. BASIC line 310 uses the index
. for movement (#N$01-#N$06) or the command handlers at line 400+
. (see #R$EA60).)
  $ED7E,$05 Write #N$01 to *#R$5BA4.
  $ED83,$05 Point #REGhl at #R$F99C with word limit #N$0F.
  $ED88,$02 Jump to #R$ED37.

c $ED8A Compare Token To Vocabulary Word
@ $ED8A label=CompareTokenToWord
D $ED8A Returns with carry reset on a match, set on a miss.
  $ED8A,$02 #REGb=#N$00.
  $ED8C,$01 Stash the token pointer on the stack.
@ $ED8D label=CompareTokenToWord_Count
  $ED8D,$05 Jump to #R$ED9A if *#REGde is a control character (< #N$21).
  $ED92,$04 Jump to #R$ED9A if *#REGde is a quote.
  $ED96,$04 Count this character and keep scanning the token.
@ $ED9A label=CompareTokenToWord_CheckLength
  $ED9A,$01 Restore the token pointer from the stack.
  $ED9B,$08 Jump to #R$EDAD if the token is shorter than *#R$5BA4.
@ $EDA3 label=CompareTokenToWord_Match
  $EDA3,$04 Jump to #R$EDAD if the next characters differ.
  $EDA7,$04 Advance both pointers and keep matching.
  $EDAB,$01 Clear carry on a full match.
  $EDAC,$01 Return.
N $EDAD The token did not match this table word.
@ $EDAD label=CompareTokenToWord_Miss
  $EDAD,$01 Set carry on a miss.
  $EDAE,$01 Return.

c $EDAF Advance Input Pointer
@ $EDAF label=AdvanceInputPointer
D $EDAF #HTML(Jump-table target #R$EA6C.)
  $EDAF,$04 Fetch *#R$5BA7.
  $EDB3,$03 Return if this token is ENTER.
N $EDB6 Move on to the next token.
  $EDB6,$06 Copy *#R$5BA9 to *#R$5BA7.
  $EDBC,$04 Write *#REGhl to *#R$5BAB.
  $EDC0,$03 Return if that token is ENTER.
N $EDC3 Walk to the delimiter that ends this token.
@ $EDC3 label=AdvanceInputPointer_Scan
  $EDC3,$06 Jump to #R$EDD7 if this character is ENTER.
  $EDC9,$04 Jump to #R$EDD7 on a quote.
  $EDCD,$04 Keep scanning until a space.
@ $EDD1 label=AdvanceInputPointer_SkipSpaces
  $EDD1,$06 Skip any run of spaces.
@ $EDD7 label=AdvanceInputPointer_Store
  $EDD7,$03 Write the delimiter to *#R$5BAC.
  $EDDA,$03 Write #REGhl to *#R$5BA9.
  $EDDD,$05 Write #N$03 to *#R$5BA4.
N $EDE2 Skip a leading "THE".
  $EDE2,$03 Copy *#R$5BA7 to #REGhl.
  $EDE5,$03 #REGde=#R$FBA4.
  $EDE8,$03 Call #R$ED8A.
  $EDEB,$02 Jump to #R$EDAF if "THE" was skipped.
  $EDED,$01 Return.

c $EDEE Match Token In BASIC List
@ $EDEE label=MatchTokenInBasicList
D $EDEE Jump-table target #R$EA72. Returns #REGbc=index or
. #N($0000,$04,$04).
  $EDEE,$05 Write #N$02 to *#R$5BA4.
  $EDF3,$04 Write #N$01 to *#R$5BA5.
  $EDF7,$07 Jump to #R$EE23 if *#R$5BAC is ENTER.
  $EDFE,$04 Jump to #R$EE23 if *#R$5BAC is a quote.
  $EE02,$04 Stash *#R$5BA7 on the stack.
  $EE06,$06 Copy *#R$5BA9 to *#R$5BA7.
  $EE0C,$03 Call #R$ED65.
  $EE0F,$05 Write #N$01 to *#R$5BA5.
  $EE14,$04 Restore *#R$5BA7 from the stack.
  $EE18,$04 Jump to #R$EE23 if #REGc holds a preposition hit.
  $EE1C,$05 Set *#R$5BFD.
  $EE21,$02 Jump to #R$EE29.
N $EE23 Clear the dirty flag and scan.
@ $EE23 label=MatchTokenInBasicList_ClearDirty
  $EE23,$04 Write #N$00 to *#R$5BFD.
  $EE27,$02 Jump to #R$EE6E.
N $EE29 Compare the next BASIC-list word.
@ $EE29 label=MatchTokenInBasicList_Scan
  $EE29,$07 Point #REGhl at the next BASIC-list word.
  $EE30,$04 Copy *#R$5BA7 to #REGde.
  $EE34,$01 Stash #REGhl on the stack.
  $EE35,$03 Call #R$ED8A.
  $EE38,$01 Restore #REGhl from the stack.
  $EE39,$02 Jump to #R$EE4F if it missed.
@ $EE3B label=MatchTokenInBasicList_NextWord
  $EE3B,$0A Skip to the next space-separated word in this entry.
  $EE45,$01 Advance #REGhl.
  $EE46,$04 Copy *#R$5BA9 to #REGde.
  $EE4A,$03 Call #R$ED8A.
  $EE4D,$02 Jump to #R$EE59 if it matched.
@ $EE4F label=MatchTokenInBasicList_AdvanceEntry
  $EE4F,$03 Call #R$EE9C.
  $EE52,$03 Jump to #R$EE29 if there are more entries.
@ $EE55 label=MatchTokenInBasicList_Miss
  $EE55,$03 #REGbc=#N($0000,$04,$04) on a miss.
  $EE58,$01 Return.
N $EE59 A BASIC-list word matched.
@ $EE59 label=MatchTokenInBasicList_Hit
  $EE59,$06 Copy *#R$5BA5 into #REGbc.
  $EE5F,$01 Return.

c $EE60 BASIC Helper
@ $EE60 label=BasicHelper
D $EE60 Jump-table target #R$EA75.
  $EE60,$06 Copy *#R$5BA0 to *#SKOOLKID$5C57(NSPPC).
  $EE66,$06 Jump to #R$EE4F if *#R$5BFD is set.
  $EE6C,$02 Jump to #R$EE94.
N $EE6E Compare the next BASIC-list word.
@ $EE6E label=BasicHelper_Scan
  $EE6E,$07 Point #REGhl at the next BASIC-list word.
  $EE75,$01 Stash #REGhl on the stack.
  $EE76,$04 Copy *#R$5BA7 to #REGde.
  $EE7A,$03 Call #R$ED8A.
  $EE7D,$01 Restore #REGhl from the stack.
  $EE7E,$02 Jump to #R$EE59 if it matched.
@ $EE80 label=BasicHelper_NextWord
  $EE80,$0A Skip to the next space-separated word in this entry.
  $EE8A,$01 Advance #REGhl.
  $EE8B,$04 Copy *#R$5BA7 to #REGde.
  $EE8F,$03 Call #R$ED8A.
  $EE92,$02 Jump to #R$EE59 if it matched.
@ $EE94 label=BasicHelper_AdvanceEntry
  $EE94,$03 Call #R$EE9C.
  $EE97,$03 Jump to #R$EE6E if there are more entries.
  $EE9A,$02 Jump to #R$EE55.

c $EE9C Step BASIC List Entry
@ $EE9C label=StepBasicListEntry
D $EE9C Step one length-prefixed BASIC-list entry.
  $EE9C,$0B Skip the length prefix and advance
. #SKOOLKID$5C57(NSPPC) by that many bytes.
  $EEA7,$06 Store the new #SKOOLKID$5C57(NSPPC) in #R$5BA0 as well.
  $EEAD,$04 Copy *#R$5BAD into #REGb.
  $EEB1,$07 Increment *#R$5BA5.
  $EEB8,$01 Return.

c $EEB9 Seed Primary Work Buffer
@ $EEB9 label=SeedPrimaryWorkBuffer
D $EEB9 #HTML(Jump-table target #R$EA78 (<code>USR</code> #R$EA78). BASIC
. uses this for INVENTORY / LOOK object lists (see #R$EA60).)
  $EEB9,$08 Point #R$5BA2 at #R$FA00 with #N$2D entries.
N $EEC1 Remember the entry limit and clear the word index.
@ $EEC1 label=SeedWorkBuffer_Common
  $EEC1,$03 Write #REGa to *#R$5BFB.
  $EEC4,$04 Write #N$00 to *#R$5BA5.
N $EEC8 Step to the next work-buffer entry.
@ $EEC8 label=StepWorkBuffer
  $EEC8,$08 Increment *#R$5BA5 into #REGc.
  $EED0,$07 Step *#R$5BA2.
  $EED7,$07 Jump to #R$EE59 if this entry matches.
  $EEDE,$06 Jump to #R$EEC8 if there are more entries.
  $EEE4,$03 Jump to #R$EE55.

c $EEE7 Seed Secondary Work Buffer
@ $EEE7 label=SeedSecondaryWorkBuffer
D $EEE7 #HTML(Jump-table target #R$EA7E (<code>USR</code> #R$EA7E). Same
. path as #R$EEB9 from the secondary buffer.)
  $EEE7,$08 Point #R$5BA2 at #R$FA2D with #N$22 entries.
  $EEEF,$02 Jump to #R$EEC1.

c $EEF1 Print Message
@ $EEF1 label=PrintMessage
D $EEF1 Walks a message script pointed to by #REGhl. Bytes below #N$20
. are control codes; the rest print as literals via #R$EF82.
  $EEF1,$02 Fetch the next script byte.
N $EEF3 Codes #N$00-#N$17 set the print row and column.
  $EEF3,$04 Jump to #R$EF17 if #REGa is less than #N$18.
N $EEF7 Code #N$18 sets the print attribute.
  $EEF7,$02 Jump to #R$EF24 if #REGa is #N$18.
N $EEF9 Code #N$1A ends the script.
  $EEF9,$03 Return if #REGa is #N$1A.
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
N $EF0F Literal character.
  $EF0F,$03 Write #REGa to *#R$5BF9.
  $EF12,$03 Call #R$EF82.
  $EF15,$02 Jump to #R$EEF1.
N $EF17 Set the print row, column and left margin.
@ $EF17 label=PrintMessage_SetPosition
  $EF17,$03 Write #REGa to *#R$5BF8.
  $EF1A,$04 Write the next script byte to *#R$5BF7.
  $EF1E,$03 Write #REGa to *#R$5B00.
  $EF21,$01 Advance #REGhl.
  $EF22,$02 Jump to #R$EEF1.
N $EF24 Set the print attribute.
@ $EF24 label=PrintMessage_SetAttribute
  $EF24,$04 Write the next script byte to *#R$5BF5.
  $EF28,$01 Advance #REGhl.
  $EF29,$02 Jump to #R$EEF1.
N $EF2B Set the print flags.
@ $EF2B label=PrintMessage_SetFlags
  $EF2B,$04 Write the next script byte to *#R$5BF6.
  $EF2F,$01 Advance #REGhl.
  $EF30,$02 Jump to #R$EEF1.
N $EF32 Repeat the current character.
@ $EF32 label=PrintMessage_Repeat
  $EF32,$02 Load the repeat count from the script.
@ $EF34 label=PrintMessage_Repeat_Loop
  $EF34,$05 Call #R$EF82 until the count is done.
  $EF39,$01 Advance #REGhl.
  $EF3A,$02 Jump to #R$EEF1.
N $EF3C Fill a box of spaces.
@ $EF3C label=PrintMessage_FillBox
  $EF3C,$01 #REGb=the row count.
  $EF3D,$05 Write a space to *#R$5BF9.
  $EF42,$05 Write the next script byte to *#R$5BF5.
  $EF47,$05 Write the next script byte to *#R$5BF8.
N $EF4C Print one row of the box.
@ $EF4C label=PrintMessage_FillBox_Row
  $EF4C,$01 Stash the row counter on the stack.
  $EF4D,$07 Begin a row of #N$14 spaces from column #N$06.
@ $EF54 label=PrintMessage_FillBox_Column
  $EF54,$05 Call #R$EF82 until the column count is done.
  $EF59,$07 Advance *#R$5BF8.
  $EF60,$03 Restore the row counter and loop.
  $EF63,$01 Advance #REGhl.
  $EF64,$03 Jump to #R$EEF1.
N $EF67 Start a new line from the left margin.
@ $EF67 label=PrintMessage_NewLine
  $EF67,$06 Restore the column from the left-margin copy at #R$5B00.
@ $EF6D label=PrintMessage_AdvanceRow
  $EF6D,$07 Advance *#R$5BF8.
  $EF74,$03 Jump to #R$EEF1.
N $EF77 Add to the column, then advance the row.
@ $EF77 label=PrintMessage_AddColumn
  $EF77,$08 Add the next script byte to the left-margin column.
  $EF7F,$01 Advance #REGhl.
  $EF80,$02 Jump to #R$EF6D.

c $EF82 Clip And Print Character
@ $EF82 label=ClipAndPrintCharacter
D $EF82 Gate before #R$EA8D.
  $EF82,$03 Fetch *#R$5BF7.
  $EF85,$03 Return if the column is past #N$1A.
N $EF88 Print, or just advance the cursor.
  $EF88,$05 Jump to #R$EA8D if the column is in the printable area.
  $EF8D,$04 Otherwise just bump the cursor.
  $EF91,$01 Return.

c $EF92 Call Sub-Message
@ $EF92 label=CallSubMessage
D $EF92 Control code #N$1F.
  $EF92,$07 Write the next script byte to *#R$5BF7 and *#R$5B00.
  $EF99,$01 Advance #REGhl.
  $EF9A,$02 Fetch the sub-script id.
  $EF9C,$01 Stash the script pointer on the stack.
  $EF9D,$03 Call #R$EFA4.
  $EFA0,$01 Restore the script pointer from the stack.
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
N $EFB9 Digit/punct rows at attribute #N$0C.
@ $EFB9 label=SubMessageSelect_DigitPunctuation
  $EFB9,$05 Write #N$01 to *#R$5BF8.
  $EFBE,$03 Point #REGhl at #R$FDE8.
  $EFC1,$03 Jump to #R$EEF1.
N $EFC4 Punct/symbol rows at attribute #N$0C.
@ $EFC4 label=SubMessageSelect_Punctuation
  $EFC4,$05 Write #N$02 to *#R$5BF8.
  $EFC9,$03 Point #REGhl at #R$FE12.
  $EFCC,$03 Jump to #R$EEF1.
N $EFCF Alternate font at #R$F278.
@ $EFCF label=SubMessageSelect_AlternateCharset
@ $EFCF keep
  $EFCF,$06 Write #R$F278(#N$F178) to *#SKOOLKID$5C36(CHARS).
  $EFD5,$03 Call #R$EFC4.
@ $EFD8 keep
  $EFD8,$06 Write #R$F228(#N$F128) to *#SKOOLKID$5C36(CHARS).
  $EFDE,$01 Return.
N $EFDF Two glyphs at attribute #N$27.
@ $EFDF label=SubMessageSelect_DualGlyph
  $EFDF,$05 Write #N$06 to *#R$5BF8.
  $EFE4,$03 Point #REGhl at #R$FE2D.
  $EFE7,$03 Jump to #R$EEF1.
N $EFEA Three glyphs at attribute #N$27.
@ $EFEA label=SubMessageSelect_TripleGlyph
  $EFEA,$05 Write #N$05 to *#R$5BF8.
  $EFEF,$03 Point #REGhl at #R$FE37.
  $EFF2,$03 Jump to #R$EEF1.
N $EFF5 Glyph band at attributes #N$28/#N$38.
@ $EFF5 label=SubMessageSelect_GlyphStrip
  $EFF5,$03 #REGhl=#R$FE41.
  $EFF8,$03 Jump to #R$EEF1.

c $EFFB Draw Location Graphic
@ $EFFB label=LocationGraphicSetup
D $EFFB Jump-table target #R$EA87. Points #SKOOLKID$5C36(CHARS) at
. #R$F228(#N$F128), draws the script for *#R$5B01, then restores the
. ROM font at #N$3C00.
  $EFFB,$05 Write #N$05 to *#R$5BF6.
  $F000,$06 Write #R$F228(#N$F128) to *#SKOOLKID$5C36(CHARS).
  $F006,$03 Call #R$F010.
N $F009 Restore the ROM font after #R$F010 returns.
  $F009,$06 Write #N$3C00 to *#SKOOLKID$5C36(CHARS).
  $F00F,$01 Return.
N $F010 Match *#R$5B01 to a location script and jump into #R$EEF1.
@ $F010 label=LocationGraphicSetup_SelectScript
  $F010,$03 Fetch *#R$5B01.
  $F013,$08 Jump to #R$EEF1 if the id is #N$04 (dense forest).
  $F01B,$08 Jump to #R$EEF1 if the id is #N$12 (Carawood).
  $F023,$08 Jump to #R$EEF1 if the id is #N$13 (Carawood).
  $F02B,$08 Jump to #R$EEF1 if the id is #N$14 (Carawood).
  $F033,$08 Jump to #R$EEF1 if the id is #N$15 (Carawood).
  $F03B,$08 Jump to #R$EEF1 if the id is #N$16 (Carawood).
  $F043,$08 Jump to #R$EEF1 if the id is #N$17 (Carawood).
  $F04B,$07 Jump to #R$F0D0 if the id is #N$18 (Carawood).
  $F052,$07 Jump to #R$F0D0 if the id is #N$19 (Carawood).
  $F059,$07 Jump to #R$F0D0 if the id is #N$1A (Carawood).
  $F060,$07 Jump to #R$F0D0 if the id is #N$47 (at sea).
  $F067,$07 Jump to #R$F0D0 if the id is #N$2F (water's edge).
  $F06E,$07 Jump to #R$F0D0 if the id is #N$2E (Serpent Sea beach).
  $F075,$07 Jump to #R$F0D0 if the id is #N$0F (high platform).
  $F07C,$07 Jump to #R$F0D0 if the id is #N$06 (arid scrubland).
  $F083,$07 Jump to #R$F0D0 if the id is #N$05 (scorched plains).
  $F08A,$07 Jump to #R$F0D0 if the id is #N$1B (beside Tylon's castle).
  $F091,$07 Jump to #R$F0D0 if the id is #N$0E (Cavezats cavern).
  $F098,$07 Jump to #R$F0D0 if the id is #N$01 (Ogeron's house).
  $F09F,$07 Jump to #R$F0D0 if the id is #N$02 (edge of a large forest).
  $F0A6,$07 Jump to #R$F0D0 if the id is #N$0B (Urga-Maul dungeon).
N $F0AD No graphic script. Print a row of asterisks instead.
  $F0AD,$05 Write #N$18 to the line byte of #SKOOLKID$5C88(S_POSN).
  $F0B2,$05 Write #N$03 to *#R$5BF5.
  $F0B7,$06 Write row #N$07 and column #N$00 to *#R$5BF7.
  $F0BD,$02 #REGb=#N$20.
  $F0BF,$05 #HTML(Write <code>*</code> to *#R$5BF9.)
  $F0C4,$06 Write #N$3C00 to *#SKOOLKID$5C36(CHARS).
N $F0CA Print one row of asterisks.
@ $F0CA label=LocationGraphicSetup_FillRow
  $F0CA,$05 Call #R$EA8D until the count is done.
  $F0CF,$01 Return.
N $F0D0 The later id matches cannot relative-jump to #R$EEF1.
@ $F0D0 label=LocationGraphicSetup_PrintScript
  $F0D0,$03 Jump to #R$EEF1.

c $F0D3 Scroll Screen
@ $F0D3 label=ScrollAdjust
D $F0D3 Jump-table target #R$EA8A. Raises the line byte of
. #SKOOLKID$5C88(S_POSN) until it is at least #N$05. Each step calls
. #SKOOLKID$0DFE,$0E00(CL_SCROLL).
  $F0D3,$06 Return if the line byte of #SKOOLKID$5C88(S_POSN) is at
. least #N$05.
  $F0D9,$04 Increment the line byte of #SKOOLKID$5C88(S_POSN).
  $F0DD,$07 Call #SKOOLKID$0DFE,$0E00(CL_SCROLL) #N$0F times.
  $F0E4,$02 Jump to #R$F0D3.

c $F0E6 Submit Input Line
@ $F0E6 label=SubmitInputLine
D $F0E6 #HTML(Reached from #R$EBD9 when ENTER is pressed. Token walks
. and vocabulary lookup are separate jump-table entries (#R$EDAF,
. #R$ED7E and neighbours).)
  $F0E6,$05 Write a space to *#R$5BF9.
  $F0EB,$02 #REGb=#N$40.
  $F0ED,$0A Write #N$00 to *#R$5BF6, *#R$5BF5 and *#R$5BF7.
  $F0F7,$05 Write #N$16 to *#R$5BF8.
N $F0FC Clear the input rows.
@ $F0FC label=SubmitInputLine_ClearLoop
  $F0FC,$05 Call #R$EA8D until the count is done.
  $F101,$04 Write #N$00 to *#R$5BF7.
  $F105,$03 Call #R$F0D3.
N $F108 Print a ">" prompt on the lower screen.
  $F108,$0A Write the prompt row to *#R$5BF8.
  $F112,$05 Write #N$07 to *#R$5BF5.
  $F117,$05 #HTML(Write <code>></code> to *#R$5BF9.)
  $F11C,$03 Call #R$EA8D.
N $F11F Echo the submitted line.
  $F11F,$05 Write #N$05 to *#R$5BF5.
  $F124,$03 Point #REGhl at #R$5BAE.
@ $F127 label=SubmitInputLine_Echo
  $F127,$01 Fetch the next character.
  $F128,$04 Jump to #R$F135 if it is ENTER.
  $F12C,$04 Write this character to *#R$5BF9.
  $F130,$03 Call #R$EA8D.
  $F133,$02 Jump to #R$F127.
N $F135 Scroll the lower screen back two rows.
@ $F135 label=SubmitInputLine_ScrollBack
  $F135,$08 Subtract #N$02 from the line byte of
. #SKOOLKID$5C88(S_POSN).
  $F13D,$03 Jump to #R$F0D3.

c $F140 Copy Work Buffer
@ $F140 label=CopyWorkBuffer
D $F140 Jump-table target #R$EA84. The copy source sits near the start
. of #R$E9B6.
@ $F143 keep
M   $F140,$0B Copy #N($0096,$04,$04) bytes into the work buffer at
. #R$FA00(#N$FA01).
  $F14B,$01 Return.

c $F14C Scan Input Spaces
@ $F14C label=ScanInputSpaces
D $F14C Jump-table target #R$EA81. A character below space returns
. with #REGbc unchanged.
  $F14C,$04 Point #REGde at #R$5BAE.
@ $F150 label=ScanInputSpaces_Loop
  $F150,$02 Fetch the next character.
  $F152,$03 Return if it is below space.
N $F155 A quote starts a token.
  $F155,$04 Keep scanning until a quote.
  $F159,$08 Write #REGde to *#R$5BA7 and *#R$5BA9.
  $F161,$03 Call #R$EDAF.
  $F164,$03 #REGbc=#N($0000,$04,$04).
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
N $F168 Location id #N$0F (high platform).
N $F168 #UDGTABLE
. { =h High Platform }
. { #UDGS$14,$08,$02(high-platform)(
. #LET(ch=#MAP($y)($20,0:#MAP($x)($20,0:$63,1:$63,2:$62,3:$62,4:$62,11:$6E,
. 12:$70,13:$6E,14:$62,15:$62,16:$63,17:$63,18:$64,19:$64),1:#MAP($x)($20,
. 11:$6F,12:$71,13:$6F),2:#MAP($x)($20,4:$5E,5:$3B,6:$5F),3:#MAP($x)($20,4:$74,
. 5:$74,6:$74),4:#MAP($x)($20,4:$72,5:$73,6:$72),5:#MAP($x)($20,4:$73,5:$72,
. 6:$73,8:$62,9:$63,10:$62,11:$75,12:$76,14:$75),6:#MAP($x)($20,0:$64,1:$65,
. 2:$65,3:$66,4:$67,5:$67,6:$68,7:$3B,8:$3B,9:$3B,10:$3B,11:$77,12:$78,14:$77,
. 15:$68,16:$68,17:$67,18:$67,19:$66),7:$20))
. #LET(at=#MAP($y)($00,0:#MAP($x)($00,0:$22,1:$22,2:$22,3:$22,4:$22,5:$22,6:$22,
. 7:$22,8:$22,9:$22,10:$22,11:$27,12:$27,13:$27,14:$22,15:$22,16:$22,17:$22,
. 18:$22,19:$22),1:#MAP($x)($00,0:$10,1:$10,2:$10,3:$10,4:$10,5:$10,6:$10,7:$10,
. 8:$10,9:$10,10:$10,11:$17,12:$17,13:$17,14:$10,15:$10,16:$10,17:$10,18:$10,
. 19:$10),2:$10,3:#MAP($x)($00,0:$10,1:$10,2:$10,3:$10,4:$01,5:$01,6:$01,7:$10,
. 8:$10,9:$10,10:$10,11:$10,12:$10,13:$10,14:$10,15:$10,16:$10,17:$10,18:$10,
. 19:$10),4:#MAP($x)($00,0:$10,1:$10,2:$10,3:$10,4:$0D,5:$0D,6:$0D,7:$10,8:$10,
. 9:$10,10:$10,11:$10,12:$10,13:$10,14:$10,15:$10,16:$10,17:$10,18:$10,19:$10),
. 5:#MAP($x)($00,0:$10,1:$10,2:$10,3:$10,4:$0D,5:$0D,6:$0D,7:$10,8:$14,9:$14,
. 10:$14,11:$17,12:$17,13:$17,14:$17,15:$10,16:$10,17:$10,18:$10,19:$10),
. 6:#MAP($x)($00,0:$14,1:$14,2:$14,3:$14,4:$0C,5:$0C,6:$0C,7:$0C,8:$0C,9:$0C,
. 10:$0C,11:$27,12:$27,13:$27,14:$27,15:$14,16:$14,17:$14,18:$14,19:$14),7:$20))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
  $F168,$68
N $F1D0 Location id #N$06 (arid scrubland).
N $F1D0 #UDGTABLE
. { =h Arid Scrubland }
. { #UDGS$14,$08,$02(arid-scrubland)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,13:$5E,14:$5F),2:#MAP($x)($20,
. 13:$60,14:$61),3:$20,4:#MAP($x)($20,0:$5B,1:$66,2:$65,3:$5A,4:$67,5:$5A,6:$3B,
. 7:$5B,8:$5A,9:$5B,10:$66,11:$65,12:$59,13:$67,14:$5A,15:$67,16:$5B,17:$66,
. 18:$5A,19:$5B),5:#MAP($x)($20,2:$A5,3:$A6,12:$96,13:$97),6:#MAP($x)($20,6:$96,
. 7:$97,12:$98,13:$99,15:$A5,16:$A6),7:#MAP($x)($20,6:$98,7:$99,9:$A5,10:$A6)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$08,9:$08,10:$08,11:$08,12:$08,13:$4E,14:$4E,15:$08,16:$08,
. 17:$08,18:$08,19:$08),2:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$08,9:$08,10:$08,11:$08,12:$08,13:$4E,14:$4E,15:$08,16:$08,
. 17:$08,18:$08,19:$08),3:$08,4:$0E,5:#MAP($x)($00,0:$32,1:$32,2:$0E,3:$0E,
. 4:$32,5:$32,6:$32,7:$32,8:$32,9:$32,10:$32,11:$32,12:$32,13:$32,14:$32,15:$32,
. 16:$32,17:$32,18:$32,19:$32),6:#MAP($x)($00,0:$32,1:$32,2:$32,3:$32,4:$32,
. 5:$32,6:$32,7:$32,8:$32,9:$32,10:$32,11:$32,12:$32,13:$32,14:$32,15:$0E,
. 16:$0E,17:$32,18:$32,19:$32),7:#MAP($x)($00,0:$32,1:$32,2:$32,3:$32,4:$32,
. 5:$32,6:$32,7:$32,8:$32,9:$0E,10:$0E,11:$32,12:$32,13:$32,14:$32,15:$32,
. 16:$32,17:$32,18:$32,19:$32)))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $F1D0 label=LocationGraphicScript_AridScrubland
  $F1D0,$0E
N $F1DE Location id #N$05 (scorched plains).
N $F1DE #UDGTABLE
. { =h Scorched Plains }
. { #UDGS$14,$08,$02(scorched-plains)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,13:$5E,14:$5F),2:#MAP($x)($20,
. 13:$60,14:$61),3:$20,4:#MAP($x)($20,0:$5B,1:$66,2:$65,3:$5A,4:$67,5:$5A,6:$3B,
. 7:$5B,8:$5A,9:$5B,10:$66,11:$65,12:$59,13:$67,14:$5A,15:$67,16:$5B,17:$66,
. 18:$5A,19:$5B),5:#MAP($x)($20,2:$A5,3:$A6),6:#MAP($x)($20,15:$A5,16:$A6),
. 7:#MAP($x)($20,9:$A5,10:$A6)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$08,9:$08,10:$08,11:$08,12:$08,13:$4E,14:$4E,15:$08,16:$08,
. 17:$08,18:$08,19:$08),2:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$08,9:$08,10:$08,11:$08,12:$08,13:$4E,14:$4E,15:$08,16:$08,
. 17:$08,18:$08,19:$08),3:$08,4:$0E,5:#MAP($x)($00,0:$32,1:$32,2:$0E,3:$0E,
. 4:$32,5:$32,6:$32,7:$32,8:$32,9:$32,10:$32,11:$32,12:$32,13:$32,14:$32,15:$32,
. 16:$32,17:$32,18:$32,19:$32),6:#MAP($x)($00,0:$32,1:$32,2:$32,3:$32,4:$32,
. 5:$32,6:$32,7:$32,8:$32,9:$32,10:$32,11:$32,12:$32,13:$32,14:$32,15:$0E,
. 16:$0E,17:$32,18:$32,19:$32),7:#MAP($x)($00,0:$32,1:$32,2:$32,3:$32,4:$32,
. 5:$32,6:$32,7:$32,8:$32,9:$0E,10:$0E,11:$32,12:$32,13:$32,14:$32,15:$32,
. 16:$32,17:$32,18:$32,19:$32)))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
N $F1DE Also reached when #R$F1D0 runs off without a #N$1A
. terminator.
@ $F1DE label=LocationGraphicScript_ScorchedPlains
  $F1DE,$36

u $F214
  $F214,$14

b $F228 Location Font
@ $F228 label=LocationFont
D $F228 The first ten 8x8 glyphs. Writes of #R$F228(#N$F128) to
. *#SKOOLKID$5C36(CHARS) make character code #N$20 read from here.
. The rest of the charset continues at #R$F278.
  $F228,$08 #UDGTABLE(default,centre)
. { #N($20+(#PC-$F228)/$08) | #UDG(#PC) }
. UDGTABLE#
L $F228,$08,$0A

b $F278 Alternate Location Font
@ $F278 label=AlternateLocationFont
D $F278 Remaining location-art glyphs. Writes of #R$F278(#N$F178) to
. *#SKOOLKID$5C36(CHARS) make character code #N$20 read from here.
. With #R$F228(#N$F128) these are codes #N$2A-#N$B7.
  $F278,$08 #UDGTABLE(default,centre)
. { #N($20+(#PC-$F278)/$08) | #UDG(#PC) }
. UDGTABLE#
L $F278,$08,$8E

u $F6E8
  $F6E8,$5C

b $F744 Location Graphic Script: Beside Tylon's Castle
@ $F744 label=LocationGraphicScript_BesideTylonsCastle
D $F744 Location graphic scripts picked by location id in #R$EFFB:
. this entry (beside Tylon's castle; id #N$1B) / #R$F7AA
. (Cavezats cavern; id #N$0E) / #R$F80B (Ogeron's house; id
. #N$01) / #R$F879 (edge of a large forest; id #N$02) /
. #R$F8CA (Urga-Maul dungeon; id #N$0B). Drawn through #R$EEF1
. using character codes into #R$F228.
N $F744 Location id #N$1B (beside Tylon's castle).
N $F744 #UDGTABLE
. { =h Beside Tylon's Castle }
. { #UDGS$14,$08,$02(beside-tylons-castle)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,5:$A7,6:$A7,7:$A7,8:$A7,9:$A7,
. 10:$A7,11:$A7,12:$A7,13:$A7,14:$35,15:$36,16:$36,17:$38,18:$39),
. 2:#MAP($x)($20,7:$7D,11:$7D,14:$3A,15:$3B,16:$3B,17:$3B,18:$3C),
. 3:#MAP($x)($20,7:$7E,11:$7E,14:$42,15:$43,16:$44,17:$45,18:$46),
. 4:#MAP($x)($20,9:$7F,14:$3D,15:$3E,16:$3F,17:$40,18:$41),5:#MAP($x)($20,0:$6A,
. 1:$6B,2:$6C,3:$69,4:$9B,5:$9C,7:$79,9:$80,11:$7B,13:$9D,14:$9E,15:$6B,16:$3F,
. 17:$6C,18:$6B,19:$6B),6:#MAP($x)($20,4:$69,5:$6D,7:$7A,11:$7C,13:$6D,14:$9F,
. 16:$47),7:#MAP($x)($20,6:$A1,7:$A0,8:$69,9:$A0,10:$A1,11:$A0,12:$A1)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$0E,
. 6:$0E,7:$0E,8:$0E,9:$0E,10:$0E,11:$0E,12:$0E,13:$0E,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$08),2:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$72,7:$72,8:$72,9:$72,10:$72,11:$72,12:$72,13:$08,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$08),3:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$72,7:$72,8:$72,9:$72,10:$72,11:$72,12:$72,13:$08,14:$0C,15:$0C,16:$14,
. 17:$0C,18:$0C,19:$08),4:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$70,7:$70,8:$70,9:$70,10:$70,11:$70,12:$70,13:$08,14:$0C,15:$0C,16:$0A,
. 17:$0C,18:$0C,19:$08),5:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$0C,4:$0C,5:$0C,
. 6:$70,7:$70,8:$70,9:$70,10:$70,11:$70,12:$70,13:$0C,14:$0C,15:$0C,16:$22,
. 17:$0C,18:$0C,19:$0C),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$0C,5:$0C,
. 6:$0C,7:$08,8:$08,9:$08,10:$08,11:$08,12:$08,13:$0C,14:$0C,15:$20,16:$22,
. 17:$20,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$0C,7:$0C,8:$0C,9:$0C,10:$0C,11:$0C,12:$0C,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20)))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
  $F744,$66
N $F7AA Location id #N$0E (Cavezats cavern).
N $F7AA #UDGTABLE
. { =h Cavezats Cavern }
. { #UDGS$14,$08,$02(cavezats-cavern)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,5:$81,12:$81),2:#MAP($x)($20,0:$81,
. 2:$85,3:$3B,4:$86,5:$82,12:$82,18:$81),3:#MAP($x)($20,0:$82,2:$87,3:$3B,4:$88,
. 18:$82),4:#MAP($x)($20,1:$89,2:$8A,3:$8B,4:$8C,5:$64,6:$65,7:$66,8:$67,9:$67,
. 10:$68,11:$68,12:$67,13:$67,14:$66,15:$65,16:$63),5:#MAP($x)($20,0:$A3,1:$8D,
. 14:$83,15:$84,17:$8A,18:$8B,19:$8C),6:#MAP($x)($20,5:$83,6:$84),7:$20))
. #LET(at=#MAP($y)($00,0:$32,1:$32,2:#MAP($x)($00,0:$32,1:$32,2:$32,3:$32,4:$32,
. 5:$31,6:$32,7:$32,8:$32,9:$32,10:$32,11:$32,12:$31,13:$32,14:$32,15:$32,
. 16:$32,17:$32,18:$32,19:$32),3:#MAP($x)($00,0:$31,1:$32,2:$32,3:$32,4:$32,
. 5:$32,6:$32,7:$32,8:$32,9:$32,10:$32,11:$32,12:$32,13:$32,14:$32,15:$32,
. 16:$32,17:$32,18:$31,19:$32),4:#MAP($x)($00,0:$32,1:$26,2:$22,3:$22,4:$22,
. 5:$34,6:$34,7:$34,8:$34,9:$34,10:$34,11:$34,12:$34,13:$34,14:$34,15:$34,
. 16:$34,17:$32,18:$32,19:$32),5:#MAP($x)($00,0:$26,1:$26,2:$23,3:$23,4:$23,
. 5:$23,6:$23,7:$23,8:$23,9:$23,10:$23,11:$23,12:$23,13:$23,14:$23,15:$23,
. 16:$23,17:$26,18:$26,19:$26),6:$23,7:$23))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $F7AA label=LocationGraphicScript_CavezatsCavern
  $F7AA,$61
N $F80B Location id #N$01 (Ogeron's house).
N $F80B #UDGTABLE
. { =h Ogeron's House }
. { #UDGS$14,$08,$02(ogerons-house)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,5:$8E,6:$8F),2:#MAP($x)($20,5:$90,
. 6:$91,12:$3B,13:$9A,16:$B5),3:#MAP($x)($20,4:$AC,5:$64,6:$64,7:$64,12:$3B,
. 16:$B6),4:#MAP($x)($20,3:$AD,4:$AE,5:$AF,6:$AF,7:$B0,12:$3B,13:$93,16:$B6),
. 5:#MAP($x)($20,2:$92,3:$B1,4:$B2,7:$B3,8:$3B,9:$3B,10:$3B,11:$3B,12:$3B,
. 13:$3B,14:$3B,15:$3B,16:$B7,17:$93),6:#MAP($x)($20,1:$92,2:$3B,3:$B4,4:$3B,
. 5:$3B,6:$3B,7:$B2,8:$3B,9:$3B,10:$3B,11:$3B,12:$3B,13:$3B,14:$3B,15:$3B,
. 16:$3B,17:$3B,18:$93),7:#MAP($x)($20,0:$92,1:$3B,2:$3B,3:$3B,4:$3B,5:$3B,
. 6:$3B,7:$3B,8:$3B,9:$3B,10:$3B,11:$3B,12:$3B,13:$3B,14:$3B,15:$3B,16:$3B,
. 17:$3B,18:$3B,19:$93)))
. #LET(at=#MAP($y)($00,0:#MAP($x)($00,0:$0A,1:$0A,2:$0A,3:$18,4:$18,5:$18,6:$18,
. 7:$18,8:$18,9:$18,10:$18,11:$18,12:$18,13:$18,14:$18,15:$18,16:$18,17:$0A,
. 18:$0A,19:$0A),1:#MAP($x)($00,0:$0A,1:$0A,2:$0A,3:$18,4:$18,5:$21,6:$21,7:$18,
. 8:$18,9:$18,10:$18,11:$18,12:$18,13:$18,14:$18,15:$18,16:$18,17:$0A,18:$0A,
. 19:$0A),2:#MAP($x)($00,0:$0A,1:$0A,2:$0A,3:$18,4:$18,5:$21,6:$21,7:$18,8:$18,
. 9:$18,10:$18,11:$18,12:$0C,13:$0C,14:$18,15:$18,16:$1E,17:$0A,18:$0A,19:$0A),
. 3:#MAP($x)($00,0:$0A,1:$0A,2:$0A,3:$18,4:$1E,5:$1E,6:$1E,7:$1E,8:$18,9:$18,
. 10:$18,11:$18,12:$0C,13:$0C,14:$18,15:$18,16:$1E,17:$0A,18:$0A,19:$0A),
. 4:#MAP($x)($00,0:$0A,1:$0A,2:$0A,3:$1E,4:$1E,5:$1E,6:$1E,7:$1E,8:$18,9:$18,
. 10:$18,11:$18,12:$0C,13:$0C,14:$18,15:$18,16:$1E,17:$0A,18:$0A,19:$0A),
. 5:#MAP($x)($00,0:$0A,1:$0A,2:$0A,3:$16,4:$16,5:$16,6:$16,7:$16,8:$0A,9:$0A,
. 10:$0A,11:$0A,12:$0A,13:$0A,14:$0A,15:$0A,16:$16,17:$0A,18:$0A,19:$0A),
. 6:#MAP($x)($00,0:$0A,1:$0A,2:$0A,3:$16,4:$0A,5:$0A,6:$0A,7:$16,8:$0A,9:$0A,
. 10:$0A,11:$0A,12:$0A,13:$0A,14:$0A,15:$0A,16:$0A,17:$0A,18:$0A,19:$0A),7:$0A))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $F80B label=LocationGraphicScript_OgeronsHouse
  $F80B,$6E
N $F879 Location id #N$02 (edge of a large forest).
N $F879 #UDGTABLE
. { =h Edge of a Large Forest }
. { #UDGS$14,$08,$02(edge-of-a-large-forest)(
. #LET(ch=#MAP($y)($20,0:#MAP($x)($20,4:$92,5:$68,6:$68,7:$68,8:$68,9:$68,
. 10:$68,11:$68,12:$68,13:$68,14:$68,15:$93),1:#MAP($x)($20,0:$36,1:$38,2:$39,
. 3:$92,4:$3B,5:$3B,6:$3B,7:$3B,8:$3B,9:$3B,10:$3B,11:$3B,12:$3B,13:$3B,14:$3B,
. 15:$3B,16:$93),2:#MAP($x)($20,0:$3B,1:$3B,2:$3C,15:$2B,16:$2C,17:$2D,18:$21,
. 19:$22),3:#MAP($x)($20,0:$44,1:$45,2:$46,5:$8E,6:$8F,13:$8E,14:$8F,15:$2E,
. 16:$2F,17:$30,18:$24,19:$25),4:#MAP($x)($20,0:$3F,1:$40,2:$41,5:$90,6:$91,
. 9:$5E,10:$5F,13:$90,14:$91,15:$31,16:$32,17:$33,18:$27,19:$28),5:#MAP($x)($20,
. 0:$3F,9:$9A,16:$34,19:$2A),6:#MAP($x)($20,0:$47),7:$20))
. #LET(at=#MAP($y)($00,0:$0A,1:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$0A,4:$0A,5:$0A,
. 6:$0A,7:$0A,8:$0A,9:$0A,10:$0A,11:$0A,12:$0A,13:$0A,14:$0A,15:$0A,16:$0A,
. 17:$0A,18:$0A,19:$0A),2:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$0A,4:$36,5:$36,
. 6:$36,7:$36,8:$36,9:$36,10:$36,11:$36,12:$36,13:$36,14:$36,15:$36,16:$0C,
. 17:$0C,18:$0C,19:$0C),3:#MAP($x)($00,0:$14,1:$0C,2:$0C,3:$0A,4:$36,5:$18,
. 6:$18,7:$36,8:$36,9:$36,10:$36,11:$36,12:$36,13:$18,14:$18,15:$36,16:$14,
. 17:$0C,18:$0C,19:$14),4:#MAP($x)($00,0:$0A,1:$0C,2:$0C,3:$0A,4:$36,5:$18,
. 6:$18,7:$36,8:$36,9:$31,10:$31,11:$36,12:$36,13:$18,14:$18,15:$36,16:$0A,
. 17:$0C,18:$0C,19:$0A),5:#MAP($x)($00,0:$22,1:$20,2:$20,3:$20,4:$36,5:$36,
. 6:$36,7:$36,8:$36,9:$0E,10:$0E,11:$36,12:$36,13:$36,14:$36,15:$36,16:$22,
. 17:$20,18:$20,19:$22),6:#MAP($x)($00,0:$22,1:$20,2:$20,3:$20,4:$36,5:$36,
. 6:$36,7:$36,8:$36,9:$0E,10:$0E,11:$36,12:$36,13:$36,14:$36,15:$36,16:$20,
. 17:$20,18:$20,19:$20),7:$20))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $F879 label=LocationGraphicScript_EdgeOfALargeForest
  $F879,$51
N $F8CA Location id #N$0B (Urga-Maul dungeon).
N $F8CA #UDGTABLE
. { =h Urga-Maul Dungeon }
. { #UDGS$14,$08,$02(urga-maul-dungeon)(
. #LET(ch=#MAP($y)($20,0:$20,1:$20,2:#MAP($x)($20,5:$A8,9:$5E,10:$5F,14:$A8),
. 3:#MAP($x)($20,9:$AA,10:$AB),4:$20,5:#MAP($x)($20,2:$92,3:$3B,4:$3B,5:$A9,
. 6:$3B,7:$3B,8:$3B,9:$3B,10:$3B,11:$3B,12:$83,13:$84,14:$A9,15:$3B,16:$3B,
. 17:$93),6:#MAP($x)($20,1:$92,2:$3B,3:$3B,4:$83,5:$84,6:$3B,7:$3B,8:$3B,9:$3B,
. 10:$3B,11:$3B,12:$3B,13:$3B,14:$3B,15:$3B,16:$3B,17:$3B,18:$93),
. 7:#MAP($x)($20,0:$92,1:$3B,2:$3B,3:$3B,4:$3B,5:$3B,6:$3B,7:$3B,8:$3B,9:$83,
. 10:$84,11:$3B,12:$3B,13:$3B,14:$3B,15:$3B,16:$3B,17:$3B,18:$3B,19:$93)))
. #LET(at=#MAP($y)($00,0:#MAP($x)($00,0:$13,1:$13,2:$13,3:$30,4:$30,5:$30,6:$30,
. 7:$30,8:$30,9:$30,10:$30,11:$30,12:$30,13:$30,14:$30,15:$30,16:$30,17:$13,
. 18:$13,19:$13),1:#MAP($x)($00,0:$13,1:$13,2:$13,3:$30,4:$30,5:$30,6:$30,7:$30,
. 8:$30,9:$30,10:$30,11:$30,12:$30,13:$30,14:$30,15:$30,16:$30,17:$13,18:$13,
. 19:$13),2:#MAP($x)($00,0:$13,1:$13,2:$13,3:$30,4:$30,5:$30,6:$30,7:$30,8:$30,
. 9:$34,10:$34,11:$30,12:$30,13:$30,14:$30,15:$30,16:$30,17:$13,18:$13,19:$13),
. 3:#MAP($x)($00,0:$13,1:$13,2:$13,3:$30,4:$30,5:$30,6:$30,7:$30,8:$30,9:$20,
. 10:$20,11:$30,12:$30,13:$30,14:$30,15:$30,16:$30,17:$13,18:$13,19:$13),
. 4:#MAP($x)($00,0:$13,1:$13,2:$13,3:$30,4:$30,5:$30,6:$30,7:$30,8:$30,9:$20,
. 10:$20,11:$30,12:$30,13:$30,14:$30,15:$30,16:$30,17:$13,18:$13,19:$13),
. 5:#MAP($x)($00,0:$13,1:$13,2:$13,3:$13,4:$13,5:$18,6:$13,7:$13,8:$13,9:$13,
. 10:$13,11:$13,12:$1C,13:$1C,14:$18,15:$13,16:$13,17:$13,18:$13,19:$13),
. 6:#MAP($x)($00,0:$13,1:$13,2:$13,3:$13,4:$1C,5:$1C,6:$13,7:$13,8:$13,9:$13,
. 10:$13,11:$13,12:$13,13:$13,14:$13,15:$13,16:$13,17:$13,18:$13,19:$13),
. 7:#MAP($x)($00,0:$13,1:$13,2:$13,3:$13,4:$13,5:$13,6:$13,7:$13,8:$13,9:$1C,
. 10:$1C,11:$13,12:$13,13:$13,14:$13,15:$13,16:$13,17:$13,18:$13,19:$13)))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $F8CA label=LocationGraphicScript_UrgaMaulDungeon
  $F8CA,$57

u $F921
  $F921,$7B

t $F99C Table: Commands
@ $F99C label=Table_Commands
D $F99C ENTER-terminated words searched by #R$ED7E (index
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
D $F9E8 Scratch space before the verb table. #R$EEB9 seeds #R$FA00
. for INVENTORY / LOOK. #R$EEE7 seeds #R$FA2D.
  $F9E8,$18
N $FA00 Work buffer seeded by #R$EEB9 (used by INVENTORY / LOOK).
@ $FA00 label=PrimaryWorkBuffer
  $FA00,$2D
N $FA2D Work buffer seeded by #R$EEE7.
@ $FA2D label=SecondaryWorkBuffer
  $FA2D,$7C

t $FAA9 Table: Verbs
@ $FAA9 label=Table_Verbs
D $FAA9 #HTML(ENTER-terminated words searched by #R$ED2D (index
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

u $FBA1
  $FBA1,$03

t $FBA4 Token: "THE"
@ $FBA4 label=Token_THE
D $FBA4 #HTML(Literal <code>THE</code> skipped by #R$EDAF while advancing
. tokens.)
  $FBA4,$04 "THE".

t $FBA8 Table: Prepositions
@ $FBA8 label=Table_Prepositions
D $FBA8 ENTER-terminated words searched by #R$ED65 (index
. #N$01-#N$07).
  $FBA8,$03 "TO".
  $FBAB,$05 "INTO".
  $FBB0,$05 "ONTO".
  $FBB5,$05 "WITH".
  $FBBA,$05 "OVER".
  $FBBF,$07 "ACROSS".
  $FBC6,$05 "FROM".

u $FBCB
  $FBCB,$29

t $FBF4 Table: Nouns
@ $FBF4 label=Table_Nouns
D $FBF4 ENTER-terminated words searched by #R$ED71 (index
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

u $FD9C
  $FD9C,$4C

b $FDE8 Location Graphic Scripts
@ $FDE8 label=LocationGraphicScripts
D $FDE8 Message scripts consumed by #R$EEF1 / #R$EFA4. They are not
. English prose: the "characters" are UDG/charset indices that draw the
. illustrated location art. #R$EFFB dispatches location ids into this
. table; the later scripts occupy the default UDG area.
N $FDE8 Sub-script #N$00, drawn by #R$EFB9.
B $FDE8,$2A
N $FE12 Sub-script #N$01, drawn by #R$EFC4.
@ $FE12 label=LocationGraphicScript_Punctuation
B $FE12,$1B
N $FE2D Sub-script #N$03, drawn by #R$EFDF.
@ $FE2D label=LocationGraphicScript_DualGlyph
B $FE2D,$0A
N $FE37 Sub-script #N$04, drawn by #R$EFEA.
@ $FE37 label=LocationGraphicScript_TripleGlyph
B $FE37,$0A
N $FE41 Sub-script #N$05, drawn by #R$EFF5.
@ $FE41 label=LocationGraphicScript_GlyphStrip
B $FE41,$38
N $FE79 Location id #N$04 (dense forest).
N $FE79 #UDGTABLE
. { =h Dense Forest }
. { #UDGS$14,$08,$02(dense-forest)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,4:$35,5:$36,6:$37,7:$38,8:$39,
. 11:$35,12:$36,13:$37,14:$38,15:$39),2:#MAP($x)($20,0:$22,1:$23,2:$21,3:$22,
. 4:$23,5:$3B,6:$3B,7:$3B,8:$3C,9:$21,10:$22,11:$23,12:$3B,13:$3B,14:$3B,15:$21,
. 16:$22,17:$23,18:$21,19:$22),3:#MAP($x)($20,0:$25,1:$26,2:$24,3:$25,4:$26,
. 5:$43,6:$44,7:$45,8:$46,9:$24,10:$25,11:$26,12:$43,13:$44,14:$45,15:$24,
. 16:$25,17:$26,18:$24,19:$25),4:#MAP($x)($20,0:$28,1:$29,2:$27,3:$28,4:$29,
. 5:$3E,6:$3F,7:$40,8:$41,9:$27,10:$28,11:$29,12:$3E,13:$3F,14:$40,15:$27,
. 16:$28,17:$29,18:$27,19:$28),5:#MAP($x)($20,0:$2A,3:$2A,6:$3F,10:$2A,13:$3F,
. 16:$2A,19:$2A),6:#MAP($x)($20,6:$47,13:$47),7:$20))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$0C,5:$0C,
. 6:$0C,7:$0C,8:$0C,9:$08,10:$08,11:$0C,12:$0C,13:$0C,14:$0C,15:$0C,16:$08,
. 17:$08,18:$08,19:$08),2:$0C,3:#MAP($x)($00,0:$14,1:$0C,2:$0C,3:$14,4:$0C,
. 5:$0C,6:$14,7:$0C,8:$0C,9:$0C,10:$14,11:$0C,12:$0C,13:$14,14:$0C,15:$0C,
. 16:$14,17:$0C,18:$0C,19:$14),4:#MAP($x)($00,0:$0A,1:$0C,2:$0C,3:$0A,4:$0C,
. 5:$0C,6:$0A,7:$0C,8:$0C,9:$0C,10:$0A,11:$0C,12:$0C,13:$0A,14:$0C,15:$0C,
. 16:$0A,17:$0C,18:$0C,19:$0A),5:#MAP($x)($00,0:$22,1:$20,2:$20,3:$22,4:$20,
. 5:$20,6:$22,7:$20,8:$20,9:$20,10:$22,11:$20,12:$20,13:$22,14:$20,15:$20,
. 16:$22,17:$20,18:$20,19:$22),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,
. 5:$20,6:$22,7:$20,8:$20,9:$20,10:$20,11:$20,12:$20,13:$22,14:$20,15:$20,
. 16:$20,17:$20,18:$20,19:$20),7:$20))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,2:$F178,3:$F178,
. 4:$F178,15:$F178,16:$F178,17:$F178),3:#MAP($x)($F128,2:$F178,3:$F178,4:$F178,
. 15:$F178,16:$F178,17:$F178),4:#MAP($x)($F128,2:$F178,3:$F178,4:$F178,15:$F178,
. 16:$F178,17:$F178),5:#MAP($x)($F128,3:$F178,16:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FE79 label=LocationGraphicScript_DenseForest
B $FE79,$1E
N $FE97 Location id #N$12 (Carawood).
N $FE97 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-18)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,0:$37,1:$38,2:$39,8:$35,9:$36,
. 10:$37,11:$38,12:$39),2:#MAP($x)($20,0:$3B,1:$3B,2:$3C,5:$21,6:$22,7:$23,
. 8:$3A,9:$3B,10:$3B,11:$3B,12:$3C,14:$21,15:$22,16:$23,17:$21,18:$22,19:$23),
. 3:#MAP($x)($20,0:$44,1:$45,2:$46,5:$24,6:$25,7:$26,8:$42,9:$43,10:$44,11:$45,
. 12:$46,14:$24,15:$25,16:$26,17:$24,18:$25,19:$26),4:#MAP($x)($20,0:$3F,1:$40,
. 2:$41,5:$27,6:$28,7:$29,8:$3D,9:$3E,10:$3F,11:$40,12:$41,14:$27,15:$28,16:$29,
. 17:$27,18:$28,19:$29),5:#MAP($x)($20,0:$3F,6:$2A,10:$3F,15:$2A,18:$2A),
. 6:#MAP($x)($20,0:$47,5:$48,6:$48,7:$48,10:$47),7:#MAP($x)($20,4:$49,5:$49,
. 6:$49,7:$4A)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$0C,9:$0C,10:$0C,11:$0C,12:$0C,13:$08,14:$08,15:$08,16:$08,
. 17:$08,18:$08,19:$08),2:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$08,4:$08,5:$0C,
. 6:$0C,7:$0C,8:$0C,9:$0C,10:$0C,11:$0C,12:$0C,13:$08,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$0C),3:#MAP($x)($00,0:$14,1:$0C,2:$0C,3:$08,4:$08,5:$0C,
. 6:$14,7:$0C,8:$0C,9:$0C,10:$14,11:$0C,12:$0C,13:$08,14:$0C,15:$14,16:$0C,
. 17:$0C,18:$14,19:$0C),4:#MAP($x)($00,0:$0A,1:$0C,2:$0C,3:$08,4:$08,5:$0C,
. 6:$0A,7:$0C,8:$0C,9:$0C,10:$0A,11:$0C,12:$0C,13:$08,14:$0C,15:$0A,16:$0C,
. 17:$0C,18:$0A,19:$0C),5:#MAP($x)($00,0:$22,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$22,7:$20,8:$20,9:$20,10:$22,11:$20,12:$20,13:$20,14:$20,15:$22,16:$20,
. 17:$20,18:$22,19:$20),6:#MAP($x)($00,0:$22,1:$20,2:$20,3:$20,4:$20,5:$27,
. 6:$27,7:$27,8:$20,9:$20,10:$22,11:$20,12:$20,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$22,5:$22,
. 6:$22,7:$22,8:$20,9:$20,10:$20,11:$20,12:$20,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20)))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,5:$F178,6:$F178,
. 7:$F178,14:$F178,15:$F178,16:$F178),3:#MAP($x)($F128,5:$F178,6:$F178,7:$F178,
. 14:$F178,15:$F178,16:$F178),4:#MAP($x)($F128,5:$F178,6:$F178,7:$F178,14:$F178,
. 15:$F178,16:$F178),5:#MAP($x)($F128,6:$F178,15:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FE97 label=LocationGraphicScript_CarawoodEighteen
B $FE97,$21
N $FEB8 Location id #N$13 (Carawood).
N $FEB8 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-19)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,6:$35,7:$36,8:$37,9:$38,10:$39),
. 2:#MAP($x)($20,1:$21,2:$22,3:$23,6:$3A,7:$3B,8:$3B,9:$3B,10:$3C,13:$21,14:$22,
. 15:$23,18:$21,19:$22),3:#MAP($x)($20,1:$24,2:$25,3:$26,6:$42,7:$43,8:$44,
. 9:$45,10:$46,13:$24,14:$25,15:$26,18:$24,19:$25),4:#MAP($x)($20,1:$27,2:$28,
. 3:$29,6:$3D,7:$3E,8:$3F,9:$40,10:$41,13:$27,14:$28,15:$29,18:$27,19:$28),
. 5:#MAP($x)($20,2:$2A,8:$3F,9:$4B,10:$4B,14:$2A,19:$2A),6:#MAP($x)($20,4:$48,
. 8:$47,9:$4D,10:$4D),7:#MAP($x)($20,3:$49,4:$4A,9:$4E,10:$4E)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$0C,7:$0C,8:$0C,9:$0C,10:$0C,11:$08,12:$08,13:$08,14:$08,15:$08,16:$08,
. 17:$08,18:$08,19:$08),2:#MAP($x)($00,0:$08,1:$0C,2:$0C,3:$0C,4:$08,5:$08,
. 6:$0C,7:$0C,8:$0C,9:$0C,10:$0C,11:$08,12:$08,13:$0C,14:$0C,15:$0C,16:$08,
. 17:$08,18:$0C,19:$0C),3:#MAP($x)($00,0:$08,1:$0C,2:$14,3:$0C,4:$08,5:$08,
. 6:$0C,7:$0C,8:$14,9:$0C,10:$0C,11:$08,12:$08,13:$0C,14:$14,15:$0C,16:$08,
. 17:$08,18:$0C,19:$14),4:#MAP($x)($00,0:$08,1:$0C,2:$0A,3:$0C,4:$08,5:$08,
. 6:$0C,7:$0C,8:$0A,9:$0C,10:$0C,11:$08,12:$08,13:$0C,14:$0A,15:$0C,16:$08,
. 17:$08,18:$0C,19:$0A),5:#MAP($x)($00,0:$20,1:$20,2:$22,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$22,9:$27,10:$27,11:$20,12:$20,13:$20,14:$22,15:$20,16:$20,
. 17:$20,18:$20,19:$22),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$27,5:$20,
. 6:$20,7:$20,8:$22,9:$27,10:$27,11:$20,12:$20,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$20,3:$22,4:$22,5:$20,
. 6:$20,7:$20,8:$20,9:$22,10:$22,11:$20,12:$20,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20)))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,13:$F178,14:$F178,
. 15:$F178),3:#MAP($x)($F128,13:$F178,14:$F178,15:$F178),4:#MAP($x)($F128,
. 13:$F178,14:$F178,15:$F178),5:#MAP($x)($F128,14:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FEB8 label=LocationGraphicScript_CarawoodNineteen
B $FEB8,$1E
N $FED6 Location id #N$14 (Carawood).
N $FED6 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-20)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,8:$35,9:$36,10:$37,11:$38,12:$39),
. 2:#MAP($x)($20,2:$21,3:$22,4:$23,8:$3A,9:$3B,10:$3B,11:$3B,12:$3C,14:$21,
. 15:$22,16:$23,17:$21,18:$22,19:$23),3:#MAP($x)($20,2:$24,3:$25,4:$26,8:$42,
. 9:$43,10:$44,11:$45,12:$46,14:$24,15:$25,16:$26,17:$24,18:$25,19:$26),
. 4:#MAP($x)($20,2:$27,3:$28,4:$29,8:$3D,9:$3E,10:$3F,11:$40,12:$41,14:$27,
. 15:$28,16:$29,17:$27,18:$28,19:$29),5:#MAP($x)($20,3:$2A,10:$3F,15:$2A,
. 18:$2A),6:#MAP($x)($20,10:$47,13:$48,14:$48,15:$48),7:#MAP($x)($20,12:$49,
. 13:$49,14:$49,15:$4A)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$0C,9:$0C,10:$0C,11:$0C,12:$0C,13:$08,14:$08,15:$08,16:$08,
. 17:$08,18:$08,19:$08),2:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0C,4:$0C,5:$08,
. 6:$08,7:$08,8:$0C,9:$0C,10:$0C,11:$0C,12:$0C,13:$08,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$0C),3:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$14,4:$0C,5:$08,
. 6:$08,7:$08,8:$0C,9:$0C,10:$14,11:$0C,12:$0C,13:$08,14:$0C,15:$14,16:$0C,
. 17:$0C,18:$14,19:$0C),4:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0A,4:$0C,5:$08,
. 6:$08,7:$08,8:$0C,9:$0C,10:$0A,11:$0C,12:$0C,13:$08,14:$0C,15:$0A,16:$0C,
. 17:$0C,18:$0A,19:$0C),5:#MAP($x)($00,0:$20,1:$20,2:$20,3:$22,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$20,10:$22,11:$20,12:$20,13:$20,14:$20,15:$22,16:$20,
. 17:$20,18:$22,19:$20),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$20,10:$22,11:$20,12:$20,13:$27,14:$27,15:$27,16:$20,
. 17:$20,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$20,10:$20,11:$20,12:$22,13:$22,14:$22,15:$22,16:$20,
. 17:$20,18:$20,19:$20)))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,14:$F178,15:$F178,
. 16:$F178),3:#MAP($x)($F128,14:$F178,15:$F178,16:$F178),4:#MAP($x)($F128,
. 14:$F178,15:$F178,16:$F178),5:#MAP($x)($F128,15:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FED6 label=LocationGraphicScript_CarawoodTwenty
B $FED6,$1E
N $FEF4 Location id #N$15 (Carawood).
N $FEF4 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-21)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,0:$37,1:$38,2:$39,13:$35,14:$36,
. 15:$37,16:$38,17:$39),2:#MAP($x)($20,0:$3B,1:$3B,2:$3C,4:$21,5:$22,6:$21,
. 7:$22,8:$23,13:$3A,14:$3B,15:$3B,16:$3B,17:$3C),3:#MAP($x)($20,0:$44,1:$45,
. 2:$46,4:$24,5:$25,6:$24,7:$25,8:$26,13:$42,14:$43,15:$44,16:$45,17:$46),
. 4:#MAP($x)($20,0:$3F,1:$40,2:$41,4:$27,5:$28,6:$27,7:$28,8:$29,13:$3D,14:$3E,
. 15:$3F,16:$40,17:$41),5:#MAP($x)($20,0:$3F,5:$2A,7:$2A,9:$4B,10:$4B,11:$4B,
. 15:$3F),6:#MAP($x)($20,0:$47,9:$4D,10:$4D,11:$4D,15:$47),7:#MAP($x)($20,9:$4E,
. 10:$4E,11:$4E)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$08,9:$08,10:$08,11:$08,12:$08,13:$0C,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$08,19:$08),2:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$08,4:$0C,5:$0C,
. 6:$0C,7:$0C,8:$0C,9:$08,10:$08,11:$08,12:$08,13:$0C,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$08,19:$08),3:#MAP($x)($00,0:$14,1:$0C,2:$0C,3:$08,4:$0C,5:$14,
. 6:$0C,7:$14,8:$0C,9:$08,10:$08,11:$08,12:$08,13:$0C,14:$0C,15:$14,16:$0C,
. 17:$0C,18:$08,19:$08),4:#MAP($x)($00,0:$0A,1:$0C,2:$0C,3:$08,4:$0C,5:$0A,
. 6:$0C,7:$0A,8:$0C,9:$08,10:$08,11:$08,12:$08,13:$0C,14:$0C,15:$0A,16:$0C,
. 17:$0C,18:$08,19:$08),5:#MAP($x)($00,0:$22,1:$20,2:$20,3:$20,4:$20,5:$22,
. 6:$20,7:$22,8:$20,9:$27,10:$27,11:$27,12:$20,13:$20,14:$20,15:$22,16:$20,
. 17:$20,18:$20,19:$20),6:#MAP($x)($00,0:$22,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$27,10:$27,11:$27,12:$20,13:$20,14:$20,15:$22,16:$20,
. 17:$20,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$22,10:$22,11:$22,12:$20,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20)))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,4:$F178,5:$F178),
. 3:#MAP($x)($F128,4:$F178,5:$F178),4:#MAP($x)($F128,4:$F178,5:$F178),
. 5:#MAP($x)($F128,5:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FEF4 label=LocationGraphicScript_CarawoodTwentyOne
B $FEF4,$1E
N $FF12 Location id #N$16 (Carawood).
N $FF12 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-22)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,3:$35,4:$36,5:$37,6:$38,7:$39,
. 16:$35,17:$36,18:$37,19:$38),2:#MAP($x)($20,0:$21,1:$22,2:$23,3:$3A,4:$3B,
. 5:$3B,6:$3B,7:$21,8:$22,9:$23,11:$21,12:$22,13:$23,16:$3A,17:$3B,18:$3B,
. 19:$3B),3:#MAP($x)($20,0:$24,1:$25,2:$26,3:$42,4:$43,5:$44,6:$45,7:$24,8:$25,
. 9:$26,11:$24,12:$25,13:$26,16:$42,17:$43,18:$44,19:$45),4:#MAP($x)($20,0:$27,
. 1:$28,2:$29,3:$3D,4:$3E,5:$3F,6:$40,7:$27,8:$28,9:$29,11:$27,12:$28,13:$29,
. 16:$3D,17:$3E,18:$3F,19:$40),5:#MAP($x)($20,1:$2A,5:$3F,8:$2A,12:$2A,18:$3F),
. 6:#MAP($x)($20,5:$47,6:$48,16:$48,18:$47),7:#MAP($x)($20,5:$49,6:$4A,15:$49,
. 16:$4A)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$0C,4:$0C,5:$0C,
. 6:$0C,7:$0C,8:$08,9:$08,10:$08,11:$08,12:$08,13:$08,14:$08,15:$08,16:$0C,
. 17:$0C,18:$0C,19:$0C),2:#MAP($x)($00,0:$0C,1:$0C,2:$0C,3:$0C,4:$0C,5:$0C,
. 6:$0C,7:$0C,8:$0C,9:$0C,10:$08,11:$0C,12:$0C,13:$0C,14:$08,15:$08,16:$0C,
. 17:$0C,18:$0C,19:$0C),3:#MAP($x)($00,0:$0C,1:$14,2:$0C,3:$0C,4:$0C,5:$14,
. 6:$0C,7:$0C,8:$14,9:$0C,10:$08,11:$0C,12:$14,13:$0C,14:$08,15:$08,16:$0C,
. 17:$0C,18:$14,19:$0C),4:#MAP($x)($00,0:$0C,1:$0A,2:$0C,3:$0C,4:$0C,5:$0A,
. 6:$0C,7:$0C,8:$0A,9:$0C,10:$08,11:$0C,12:$0A,13:$0C,14:$08,15:$08,16:$0C,
. 17:$0C,18:$0A,19:$0C),5:#MAP($x)($00,0:$20,1:$22,2:$20,3:$20,4:$20,5:$22,
. 6:$20,7:$20,8:$22,9:$20,10:$20,11:$20,12:$22,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$22,19:$20),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$22,
. 6:$27,7:$20,8:$20,9:$20,10:$20,11:$20,12:$20,13:$20,14:$20,15:$20,16:$27,
. 17:$20,18:$22,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$22,
. 6:$22,7:$20,8:$20,9:$20,10:$20,11:$20,12:$20,13:$20,14:$20,15:$22,16:$22,
. 17:$20,18:$20,19:$20)))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,7:$F178,8:$F178,
. 9:$F178),3:#MAP($x)($F128,7:$F178,8:$F178,9:$F178),4:#MAP($x)($F128,7:$F178,
. 8:$F178,9:$F178),5:#MAP($x)($F128,8:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FF12 label=LocationGraphicScript_CarawoodTwentyTwo
B $FF12,$1E
N $FF30 Location id #N$17 (Carawood).
N $FF30 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-23)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,11:$35,12:$36,13:$37,14:$38,15:$39),
. 2:#MAP($x)($20,2:$21,3:$22,4:$23,6:$21,7:$22,8:$23,11:$3A,12:$3B,13:$3B,
. 14:$3B,15:$3C,16:$21,17:$22,18:$23),3:#MAP($x)($20,2:$24,3:$25,4:$26,6:$24,
. 7:$25,8:$26,11:$42,12:$43,13:$44,14:$45,15:$46,16:$24,17:$25,18:$26),
. 4:#MAP($x)($20,2:$27,3:$28,4:$29,6:$27,7:$28,8:$29,11:$3D,12:$3E,13:$3F,
. 14:$40,15:$41,16:$27,17:$28,18:$29),5:#MAP($x)($20,3:$2A,7:$2A,13:$3F,17:$2A),
. 6:#MAP($x)($20,13:$47),7:$20))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$08,7:$08,8:$08,9:$08,10:$08,11:$0C,12:$0C,13:$0C,14:$0C,15:$0C,16:$08,
. 17:$08,18:$08,19:$08),2:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0C,4:$0C,5:$08,
. 6:$0C,7:$0C,8:$0C,9:$08,10:$08,11:$0C,12:$0C,13:$0C,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$08),3:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$14,4:$0C,5:$08,
. 6:$0C,7:$14,8:$0C,9:$08,10:$08,11:$0C,12:$0C,13:$14,14:$0C,15:$0C,16:$0C,
. 17:$14,18:$0C,19:$08),4:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0A,4:$0C,5:$08,
. 6:$0C,7:$0A,8:$0C,9:$08,10:$08,11:$0C,12:$0C,13:$0A,14:$0C,15:$0C,16:$0C,
. 17:$0A,18:$0C,19:$08),5:#MAP($x)($00,0:$20,1:$20,2:$20,3:$22,4:$20,5:$20,
. 6:$20,7:$22,8:$20,9:$20,10:$20,11:$20,12:$20,13:$22,14:$20,15:$20,16:$20,
. 17:$22,18:$20,19:$20),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$20,10:$20,11:$20,12:$20,13:$22,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20),7:$20))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,6:$F178,7:$F178,
. 8:$F178),3:#MAP($x)($F128,6:$F178,7:$F178,8:$F178),4:#MAP($x)($F128,6:$F178,
. 7:$F178,8:$F178),5:#MAP($x)($F128,7:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FF30 label=LocationGraphicScript_CarawoodTwentyThree
B $FF30,$15
N $FF45 Location id #N$18 (Carawood).
N $FF45 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-24)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,7:$35,8:$36,9:$37,10:$38,11:$39),
. 2:#MAP($x)($20,4:$21,5:$22,6:$23,7:$3A,8:$3B,9:$3B,10:$3B,11:$3C,15:$21,
. 16:$22,17:$23),3:#MAP($x)($20,4:$24,5:$25,6:$26,7:$42,8:$43,9:$44,10:$45,
. 11:$46,15:$24,16:$25,17:$26),4:#MAP($x)($20,4:$27,5:$28,6:$29,7:$3D,8:$3E,
. 9:$3F,10:$40,11:$41,15:$27,16:$28,17:$29),5:#MAP($x)($20,1:$4B,2:$4B,5:$2A,
. 9:$3F,16:$2A),6:#MAP($x)($20,1:$4D,2:$4D,9:$47,12:$48,13:$48),7:#MAP($x)($20,
. 1:$4E,2:$4E,11:$49,12:$49,13:$4A)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$08,5:$08,
. 6:$08,7:$0C,8:$0C,9:$0C,10:$0C,11:$0C,12:$08,13:$08,14:$08,15:$08,16:$08,
. 17:$08,18:$08,19:$08),2:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$0C,5:$0C,
. 6:$0C,7:$0C,8:$0C,9:$0C,10:$0C,11:$0C,12:$08,13:$08,14:$08,15:$0C,16:$0C,
. 17:$0C,18:$08,19:$08),3:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$0C,5:$14,
. 6:$0C,7:$0C,8:$0C,9:$14,10:$0C,11:$0C,12:$08,13:$08,14:$08,15:$0C,16:$14,
. 17:$0C,18:$08,19:$08),4:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$0C,5:$0A,
. 6:$0C,7:$0C,8:$0C,9:$0A,10:$0C,11:$0C,12:$08,13:$08,14:$08,15:$0C,16:$0A,
. 17:$0C,18:$08,19:$08),5:#MAP($x)($00,0:$20,1:$27,2:$27,3:$20,4:$20,5:$22,
. 6:$20,7:$20,8:$20,9:$22,10:$20,11:$20,12:$20,13:$20,14:$20,15:$20,16:$22,
. 17:$20,18:$20,19:$20),6:#MAP($x)($00,0:$20,1:$27,2:$27,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$22,10:$20,11:$20,12:$27,13:$27,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$22,2:$22,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$20,10:$20,11:$22,12:$22,13:$22,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20)))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,15:$F178,16:$F178,
. 17:$F178),3:#MAP($x)($F128,15:$F178,16:$F178,17:$F178),4:#MAP($x)($F128,
. 15:$F178,16:$F178,17:$F178),5:#MAP($x)($F128,16:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FF45 label=LocationGraphicScript_CarawoodTwentyFour
B $FF45,$1E
N $FF63 Location id #N$19 (Carawood).
N $FF63 #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood-25)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,4:$35,5:$36,6:$37,7:$38,8:$39,
. 14:$35,15:$36,16:$37,17:$38,18:$39),2:#MAP($x)($20,0:$22,1:$23,4:$3A,5:$3B,
. 6:$3B,7:$3B,8:$3C,9:$21,10:$22,11:$21,12:$22,13:$23,14:$3A,15:$3B,16:$3B,
. 17:$3B,18:$3C),3:#MAP($x)($20,0:$25,1:$26,4:$42,5:$43,6:$44,7:$45,8:$46,9:$24,
. 10:$25,11:$24,12:$25,13:$26,14:$42,15:$43,16:$44,17:$45,18:$46),
. 4:#MAP($x)($20,0:$28,1:$29,4:$3D,5:$3E,6:$3F,7:$40,8:$41,9:$27,10:$28,11:$27,
. 12:$28,13:$29,14:$3D,15:$3E,16:$3F,17:$40,18:$41),5:#MAP($x)($20,0:$2A,6:$3F,
. 10:$2A,12:$2A,16:$3F),6:#MAP($x)($20,6:$47,10:$48,16:$47),7:#MAP($x)($20,
. 9:$49,10:$4A)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$08,3:$08,4:$0C,5:$0C,
. 6:$0C,7:$0C,8:$0C,9:$08,10:$08,11:$08,12:$08,13:$08,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$08),2:#MAP($x)($00,0:$0C,1:$0C,2:$08,3:$08,4:$0C,5:$0C,
. 6:$0C,7:$0C,8:$0C,9:$0C,10:$0C,11:$0C,12:$0C,13:$0C,14:$0C,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$08),3:#MAP($x)($00,0:$14,1:$0C,2:$08,3:$08,4:$0C,5:$0C,
. 6:$14,7:$0C,8:$0C,9:$0C,10:$14,11:$0C,12:$14,13:$0C,14:$0C,15:$0C,16:$14,
. 17:$0C,18:$0C,19:$08),4:#MAP($x)($00,0:$0A,1:$0C,2:$08,3:$08,4:$0C,5:$0C,
. 6:$0A,7:$0C,8:$0C,9:$0C,10:$0A,11:$0C,12:$0A,13:$0C,14:$0C,15:$0C,16:$0A,
. 17:$0C,18:$0C,19:$08),5:#MAP($x)($00,0:$22,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$22,7:$20,8:$20,9:$20,10:$22,11:$20,12:$22,13:$20,14:$20,15:$20,16:$22,
. 17:$20,18:$20,19:$20),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$22,7:$20,8:$20,9:$20,10:$27,11:$20,12:$20,13:$20,14:$20,15:$20,16:$22,
. 17:$20,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$20,5:$20,
. 6:$20,7:$20,8:$20,9:$22,10:$22,11:$20,12:$20,13:$20,14:$20,15:$20,16:$20,
. 17:$20,18:$20,19:$20)))
. #LET(base=#MAP($y)($F128,0:$F128,1:$F128,2:#MAP($x)($F128,9:$F178,10:$F178,
. 11:$F178,12:$F178,13:$F178),3:#MAP($x)($F128,9:$F178,10:$F178,11:$F178,
. 12:$F178,13:$F178),4:#MAP($x)($F128,9:$F178,10:$F178,11:$F178,12:$F178,
. 13:$F178),5:#MAP($x)($F128,10:$F178,12:$F178),6:$F128,7:$F128))
. #UDG({base}+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FF63 label=LocationGraphicScript_CarawoodTwentyFive
B $FF63,$1B
N $FF7E Location id #N$1A (Carawood).
N $FF7E #UDGTABLE
. { =h Carawood }
. { #UDGS$14,$08,$02(carawood)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,2:$35,3:$36,4:$37,5:$38,6:$39,
. 15:$35,16:$36,17:$37,18:$38,19:$39),2:#MAP($x)($20,2:$3A,3:$3B,4:$3B,5:$3B,
. 6:$3C,10:$21,11:$22,12:$23,15:$3A,16:$3B,17:$3B,18:$3B,19:$3C),3:#MAP($x)($20,
. 2:$42,3:$43,4:$44,5:$45,6:$46,10:$24,11:$25,12:$26,15:$42,16:$43,17:$44,
. 18:$45,19:$46),4:#MAP($x)($20,2:$3D,3:$3E,4:$3F,5:$40,6:$41,10:$27,11:$28,
. 12:$29,15:$3D,16:$3E,17:$3F,18:$40,19:$41),5:#MAP($x)($20,4:$3F,8:$4B,11:$2A,
. 17:$3F),6:#MAP($x)($20,3:$48,4:$47,8:$4D,15:$48,17:$47),7:#MAP($x)($20,2:$49,
. 3:$4A,8:$4E,14:$49,15:$4A)))
. #LET(at=#MAP($y)($00,0:$08,1:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0C,4:$0C,5:$0C,
. 6:$0C,7:$08,8:$08,9:$08,10:$08,11:$08,12:$08,13:$08,14:$08,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$0C),2:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0C,4:$0C,5:$0C,
. 6:$0C,7:$08,8:$08,9:$08,10:$0C,11:$0C,12:$0C,13:$08,14:$08,15:$0C,16:$0C,
. 17:$0C,18:$0C,19:$0C),3:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0C,4:$14,5:$0C,
. 6:$0C,7:$08,8:$08,9:$08,10:$0C,11:$14,12:$0C,13:$08,14:$08,15:$0C,16:$0C,
. 17:$14,18:$0C,19:$0C),4:#MAP($x)($00,0:$08,1:$08,2:$0C,3:$0C,4:$0A,5:$0C,
. 6:$0C,7:$08,8:$08,9:$08,10:$0C,11:$0A,12:$0C,13:$08,14:$08,15:$0C,16:$0C,
. 17:$0A,18:$0C,19:$0C),5:#MAP($x)($00,0:$20,1:$20,2:$20,3:$20,4:$22,5:$20,
. 6:$20,7:$20,8:$27,9:$20,10:$20,11:$22,12:$20,13:$20,14:$20,15:$20,16:$20,
. 17:$22,18:$20,19:$20),6:#MAP($x)($00,0:$20,1:$20,2:$20,3:$27,4:$22,5:$20,
. 6:$20,7:$20,8:$27,9:$20,10:$20,11:$20,12:$20,13:$20,14:$20,15:$27,16:$20,
. 17:$22,18:$20,19:$20),7:#MAP($x)($00,0:$20,1:$20,2:$22,3:$22,4:$20,5:$20,
. 6:$20,7:$20,8:$22,9:$20,10:$20,11:$20,12:$20,13:$20,14:$22,15:$22,16:$20,
. 17:$20,18:$20,19:$20)))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FF7E label=LocationGraphicScript_Carawood
B $FF7E,$1B
N $FF99 Location id #N$47 (at sea).
N $FF99 #UDGTABLE
. { =h At Sea }
. { #UDGS$14,$08,$02(at-sea)(
. #LET(ch=#MAP($y)($20,0:$20,1:#MAP($x)($20,8:$4F,9:$50,10:$50,11:$51,16:$5E,
. 17:$5F),2:#MAP($x)($20,8:$52,9:$53,10:$53,11:$54,16:$60,17:$61),
. 3:#MAP($x)($20,8:$55,9:$53,10:$53,11:$56),4:#MAP($x)($20,8:$57,9:$5D,10:$53,
. 11:$58),5:$20,6:$20,7:$20))
. #LET(at=#MAP($y)($00,0:$28,1:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$28,10:$28,11:$28,12:$28,13:$28,14:$28,15:$28,16:$2E,
. 17:$2E,18:$28,19:$28),2:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$38,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$2E,
. 17:$2E,18:$28,19:$28),3:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$38,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$28,
. 17:$28,18:$28,19:$28),4:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$20,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$28,
. 17:$28,18:$28,19:$28),5:$0A,6:$0A,7:$0A))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FF99 label=LocationGraphicScript_AtSea
B $FF99,$11
N $FFAA Location id #N$2F (water's edge).
N $FFAA #UDGTABLE
. { =h Water's Edge }
. { #UDGS$14,$08,$02(waters-edge)(
. #LET(ch=#MAP($y)($20,0:#MAP($x)($20,8:$4F,9:$50,10:$50,11:$51),1:#MAP($x)($20,
. 8:$52,9:$53,10:$53,11:$54,16:$5E,17:$5F),2:#MAP($x)($20,8:$55,9:$53,10:$53,
. 11:$56,16:$60,17:$61),3:#MAP($x)($20,8:$57,9:$5D,10:$53,11:$58),
. 4:#MAP($x)($20,5:$59,6:$5A,7:$3B,8:$3B,9:$3B,10:$3B,11:$3B,12:$3B,13:$5B,
. 14:$5C),5:$20,6:$20,7:#MAP($x)($20,2:$6D,3:$6A,4:$6C,5:$6B,6:$69,7:$6B,8:$6A,
. 9:$69,10:$6A,11:$6B,12:$6C,13:$69,14:$6C,15:$6A,16:$6D)))
. #LET(at=#MAP($y)($00,0:$28,1:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$38,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$2E,
. 17:$2E,18:$28,19:$28),2:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$38,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$2E,
. 17:$2E,18:$28,19:$28),3:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$20,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$28,
. 17:$28,18:$28,19:$28),4:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$2A,
. 6:$2A,7:$2A,8:$2A,9:$2A,10:$2A,11:$2A,12:$2A,13:$2A,14:$2A,15:$28,16:$28,
. 17:$28,18:$28,19:$28),5:$0A,6:$0A,7:#MAP($x)($00,0:$0A,1:$0A,2:$0C,3:$0C,
. 4:$0C,5:$0C,6:$0C,7:$0C,8:$0C,9:$0C,10:$0C,11:$0C,12:$0C,13:$0C,14:$0C,15:$0C,
. 16:$0C,17:$0A,18:$0A,19:$0A)))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FFAA label=LocationGraphicScript_WatersEdge
B $FFAA,$24
N $FFCE Location id #N$2E (Serpent Sea beach).
N $FFCE #UDGTABLE
. { =h Serpent Sea Beach }
. { #UDGS$14,$08,$02(serpent-sea-beach)(
. #LET(ch=#MAP($y)($20,0:#MAP($x)($20,8:$4F,9:$50,10:$50,11:$51),1:#MAP($x)($20,
. 8:$52,9:$53,10:$53,11:$54,16:$5E,17:$5F),2:#MAP($x)($20,8:$55,9:$53,10:$53,
. 11:$56,16:$60,17:$61),3:#MAP($x)($20,8:$57,9:$5D,10:$53,11:$58),
. 4:#MAP($x)($20,5:$59,6:$5A,7:$3B,8:$3B,9:$3B,10:$3B,11:$3B,12:$3B,13:$5B,
. 14:$5C),5:$20,6:$20,7:#MAP($x)($20,0:$64,1:$65,2:$66,3:$66,4:$67,5:$67,6:$68,
. 7:$68,8:$3B,9:$3B,10:$3B,11:$3B,12:$68,13:$68,14:$67,15:$67,16:$66,17:$66,
. 18:$65,19:$64)))
. #LET(at=#MAP($y)($00,0:$28,1:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$38,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$2E,
. 17:$2E,18:$28,19:$28),2:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$38,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$2E,
. 17:$2E,18:$28,19:$28),3:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$28,
. 6:$28,7:$28,8:$28,9:$20,10:$38,11:$28,12:$28,13:$28,14:$28,15:$28,16:$28,
. 17:$28,18:$28,19:$28),4:#MAP($x)($00,0:$28,1:$28,2:$28,3:$28,4:$28,5:$2A,
. 6:$2A,7:$2A,8:$2A,9:$2A,10:$2A,11:$2A,12:$2A,13:$2A,14:$2A,15:$28,16:$28,
. 17:$28,18:$28,19:$28),5:$0A,6:$0A,7:$0E))
. #UDG($F128+$08*{ch},{at},$02)(*g)
. g
. ) }
. UDGTABLE#
@ $FFCE label=LocationGraphicScript_SerpentSeaBeach
B $FFCE,$25


u $FFF3
  $FFF3,$08

c $FFFB ROM Return Stub
@ $FFFB label=RomReturnStub
D $FFFB #HTML(The Mastertronic reissue POKEs these five bytes before its
. ROM loads; on this Micromega image they arrive with the final support
. block.)
  $FFFB,$02 Decrease #REGsp by two.
  $FFFD,$03 Jump to #SKOOLKID$1B7D(STMT_RET).
