; Copyright Infogrames 1985, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @start
> $4000 @org=$4000
> $4000 @rom
> $4000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
> $4000 @expand=#IF({asm})(#DEF(#VERACRUZ(addr)(link=Vera Cruz)$link))
> $4000 @expand=#IF({asm})(#DEF(#VERACRUZTWO(addr)(link=Vera Cruz: Part 2)$link))
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Vera Cruz Loading Screen. }
. { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

i $5B00
i $5C00

b $5CCB BASIC Program
@ $5CCB label=BasicProgram
D $5CCB The game itself is written in BASIC. The machine code entry points it
. uses are:
D $5CCB #LIST {
. Line 160: draws the scene of the crime into the buffer at #R$C000 by
. POKEing #N$C0 and #N$D8 into #R$807A and #R$80C3, with #R$8000 bracketed
. by the DI and EI routines at #R$FC00. } { Lines 260 and 630: copy that
. buffer to the screen with #R$FC00. } { Line 274: draws picture
. "z1" into the buffer at #R$E000. } { Line 280: shows frame "z2" of that
. sheet with #R$FB00. } LIST#
D $5CCB Lines 40-50 POKE the routines at #R$FC00, which are zero in the
. snapshot.
B $5CCB,$0008 Line 10.
B $5CD3,$0019 Line 30.
B $5CEC,$002A Line 40.
B $5D16,$00AD Line 50.
B $5DC3,$0020 Line 140.
B $5DE3,$009D Line 160.
B $5E80,$0034 Line 170.
B $5EB4,$002A Line 175.
B $5EDE,$001C Line 180.
B $5EFA,$0017 Line 190.
B $5F11,$001D Line 200.
B $5F2E,$003B Line 210.
B $5F69,$003B Line 220.
B $5FA4,$003C Line 230.
B $5FE0,$003C Line 240.
B $601C,$000F Line 250.
B $602B,$0068 Line 260.
B $6093,$002A Line 270.
B $60BD,$0098 Line 274.
B $6155,$0022 Line 280.
B $6177,$003D Line 285.
B $61B4,$0006 Line 290.
B $61BA,$001E Line 300.
B $61D8,$0022 Line 310.
B $61FA,$001E Line 320.
B $6218,$001E Line 330.
B $6236,$0006 Line 340.
B $623C,$0027 Line 350.
B $6263,$0027 Line 360.
B $628A,$0025 Line 370.
B $62AF,$0028 Line 380.
B $62D7,$0026 Line 390.
B $62FD,$003D Line 400.
B $633A,$0027 Line 410.
B $6361,$0032 Line 420.
B $6393,$0027 Line 430.
B $63BA,$0034 Line 440.
B $63EE,$0026 Line 450.
B $6414,$0006 Line 460.
B $641A,$0029 Line 470.
B $6443,$0029 Line 490.
B $646C,$001D Line 500.
B $6489,$0029 Line 510.
B $64B2,$0029 Line 520.
B $64DB,$001D Line 530.
B $64F8,$0029 Line 540.
B $6521,$0029 Line 550.
B $654A,$001D Line 560.
B $6567,$0029 Line 570.
B $6590,$001B Line 580.
B $65AB,$001C Line 590.
B $65C7,$000E Line 600.
B $65D5,$001D Line 610.
B $65F2,$0037 Line 620.
B $6629,$0044 Line 630.
B $666D,$003A Line 632.
B $66A7,$0037 Line 634.
B $66DE,$000D Line 636.
B $66EB,$0030 Line 640.
B $671B,$0030 Line 650.
B $674B,$0030 Line 660.
B $677B,$0030 Line 670.
B $67AB,$0030 Line 680.
B $67DB,$0030 Line 690.
B $680B,$0031 Line 700.
B $683C,$0032 Line 705.
B $686E,$0032 Line 706.
B $68A0,$0032 Line 710.
B $68D2,$0032 Line 720.
B $6904,$0032 Line 730.
B $6936,$0032 Line 735.
B $6968,$0032 Line 740.
B $699A,$0032 Line 750.
B $69CC,$0032 Line 752.
B $69FE,$0032 Line 755.
B $6A30,$0019 Line 757.
B $6A49,$001C Line 760.
B $6A65,$0016 Line 765.
B $6A7B,$001D Line 770.
B $6A98,$0017 Line 780.
B $6AAF,$000F Line 790.
B $6ABE,$0041 Line 800.
B $6AFF,$004D Line 810.
B $6B4C,$0077 Line 820.
B $6BC3,$0052 Line 830.
B $6C15,$0023 Line 840.
B $6C38,$0021 Line 850.
B $6C59,$000E Line 860.

b $6C67 BASIC Variables
@ $6C67 label=BasicVariables
D $6C67 The program has no variables in this snapshot, only the end marker.
B $6C67,$01 End marker.

b $6C68 Edit Line
@ $6C68 label=EditLine
D $6C68 The current BASIC edit line, from #SKOOLKID$5C59(E_LINE) up to
. #SKOOLKID$5C61(WORKSP).
B $6C68,$05

b $6C6D Workspace
@ $6C6D label=Workspace
D $6C6D Bytes from #SKOOLKID$5C61(WORKSP) to #SKOOLKID$5C63(STKBOT).
B $6C6D,$0022,$10

u $6C8F Unused
D $6C8F Free memory between #SKOOLKID$5C65(STKEND) and the machine stack. The
. non-zero bytes near the top are left over from earlier stack use.
B $6C8F,$0001,$10
S $6C90,$133E
B $7FCE,$002A,$10

b $7FF8 Machine Stack
@ $7FF8 label=MachineStack
D $7FF8 The machine stack and the GO SUB stack, from the stack pointer up to
. #SKOOLKID$5CB2(RAMTOP).
B $7FF8,$08,$02

c $8000 Draw Picture
@ $8000 label=DrawPicture
D $8000 Used by the BASIC program. Draws picture number *#R$8002 from the
. picture list that starts at #R$812C. The picture goes to the screen, or to a
. buffer when BASIC has POKEd the high bytes used by the instructions at
. #R$807A (pixels) and #R$80C3 (attributes).
D $8000 Each picture record is laid out as follows:
. #TABLE(default,centre,centre,centre)
. { =h Offset | =h Bytes | =h Contents }
. { #N$00 | #N$02 | The length of the record, less one }
. { #N$02 | #N$01 | The screen third to start at }
. { #N$03 | #N$01 | The number of thirds to draw }
. { #N$04 | #N$01 | Flags; see #R$8005 }
. { #N$05 | Varies | Pixel data, then attribute data }
. TABLE#
D $8000 Both lots of data are run-length encoded. A non-zero byte is written
. as it is. A zero byte is followed by a count and a value, and the value is
. written that many times (a count of zero writes it 256 times).
D $8000 When bit 0 of the flags is clear, the pixel data is in column order:
. each column is written from the top of the picture to the bottom, one byte
. for each pixel line, and then the next column to the right follows. When
. bit 0 is set, the pixel data is in row order: each pixel line is written
. from left to right, from the top of the picture to the bottom. The
. attribute data is always in the same order as the attribute file.
D $8000 The routine works out its own address as it runs, so the same code
. works in both parts of the game.
E $8000 View the equivalent code in;
. #LIST
. { #VERACRUZTWO$C350 }
. LIST#
  $8000,$02 Jump over the parameters to #R$8006.

g $8002 Draw Picture Parameters
@ $8002 label=DrawPicture_Number
D $8002 Parameters for #R$8000, read and written through #REGiy. BASIC only
. POKEs the picture number here; *#R$8003 and *#R$8004
. are always #N$FF in the snapshot, so the routine takes the screen third and
. the number of thirds from the picture record.
D $8002 The flags at #R$8005:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Pixel data order (set: rows; clear: columns) }
. { #N$02 | Set while a run of repeated bytes is being written }
. { #N$03 | Set while the attributes are being drawn }
. TABLE#
E $8002 View the equivalent code in;
. #LIST
. { #VERACRUZTWO$C352 }
. LIST#
@ $8003 label=DrawPicture_Third
@ $8004 label=DrawPicture_Thirds
@ $8005 label=DrawPicture_Flags
B $8002,$01 Picture number (#N$01 for the first picture in the list).
B $8003,$01 Screen third to start at, from #N$00 (top) to #N$02 (bottom).
. #N$FF means use the value in the picture record.
B $8004,$01 Number of thirds to draw, from #N$01 to #N$03. #N$FF means use the
. value in the picture record.
B $8005,$01 Flags, copied from the picture record.

c $8006 Draw Picture: Unpack
@ $8006 label=DrawPicture_Unpack
D $8006 Continues from #R$8000.
E $8006 View the equivalent code in;
. #LIST
. { #VERACRUZTWO$C356 }
. LIST#
N $8006 Find out where this code is in memory. The call leaves its return
. address (#R$8009) just below the stack pointer. An interrupt at this point
. would overwrite it, so BASIC calls #R$FC0E first and #R$FC10 afterwards.
  $8006,$03 Call the RET instruction at #N($007C,$04,$04), at the end of
. #SKOOLKID$0074,$007C(CH_ADD+1), which returns straight away.
@ $8009 label=DrawPicture_ReturnAddress
  $8009,$02 Move the stack pointer back down to the return address.
  $800B,$01 Swap it into #REGhl, so #REGhl=#R$8009.
  $800C,$02 Move the stack pointer back up again.
  $800E,$01 Clear the carry flag ready for the subtraction.
  $800F,$05 #REGhl=#R$8002 (#R$8009 less #N($0007,$04,$04)).
  $8014,$01 Stash the address of the parameters on the stack.
  $8015,$02 Restore the address of the parameters from the stack into #REGiy.
  $8017,$04 #REGhl=#R$812C (#R$8002 plus #N($012A,$04,$04)), the first picture
. record.
  $801B,$03 #REGa=the picture number from *#R$8002.
N $801E Skip over the records before the requested picture.
@ $801E label=DrawPicture_FindPicture
  $801E,$01 Decrease the picture number by one.
  $801F,$02 Jump to #R$8027 if #REGhl points to the requested picture.
  $8021,$03 #REGde=the length of this record, less one.
  $8024,$01 Add it to #REGhl, so #REGhl points to the next record.
  $8025,$02 Jump to #R$801E.
@ $8027 label=DrawPicture_Found
  $8027,$03 #REGde=#N($4000,$04,$04). This value is never used, as #REGd and
. #REGe are both set again before they are needed.
  $802A,$02 Move #REGhl past the length, to the record's screen third.
  $802C,$03 #REGa=*#R$8003.
  $802F,$01 Increment #REGa by one, so that #N$FF becomes zero.
  $8030,$02 Jump to #R$8036 if *#R$8003 is not #N$FF.
  $8032,$04 Else write the record's screen third to *#R$8003.
  $8036,$01 Move on to the record's number of thirds.
  $8037,$03 #REGa=*#R$8004.
  $803A,$01 Increment #REGa by one, so that #N$FF becomes zero.
  $803B,$02 Jump to #R$8041 if *#R$8004 is not #N$FF.
  $803D,$04 Else write the record's number of thirds to *#R$8004.
  $8041,$01 Move on to the record's flags.
  $8042,$04 Copy the record's flags to *#R$8005.
N $8046 Make sure the picture fits on the screen.
  $8046,$03 #REGa=*#R$8003.
  $8049,$04 Jump to #R$8051 if the screen third is less than #N$03.
  $804D,$04 Else start at the top third (write #N$00 to *#R$8003).
  $8051,$03 #REGa=*#R$8004.
  $8054,$04 Jump to #R$805C if the number of thirds is less than #N$04.
  $8058,$04 Else draw one third (write #N$01 to *#R$8004).
  $805C,$03 Add the screen third to #REGa. #REGa still holds the number of
. thirds read at #R$8051, even when it has just been changed.
  $805F,$04 Jump to #R$8067 if the picture ends on the screen (the total is
. less than #N$04).
  $8063,$04 Else draw one third (write #N$01 to *#R$8004).
  $8067,$03 #REGa=*#R$8004.
  $806A,$03 Jump to #R$8071 if the number of thirds is not zero.
  $806D,$04 Else draw one third (write #N$01 to *#R$8004).
N $8071 Draw the pixels.
@ $8071 label=DrawPicture_Pixels
  $8071,$01 Move #REGhl on to the start of the picture data.
  $8072,$02 #REGe=#N$00 (the left-hand column).
  $8074,$03 #REGa=*#R$8003.
  $8077,$03 Multiply it by #N$08, as each third of the screen is #N$08 pages
. long.
@ $807A label=DrawPicture_PixelsHighByte
  $807A,$02 Add the high byte of the start of the screen (#N$40). BASIC POKEs
. this byte to draw into a buffer instead.
  $807C,$02 Set #REGd and #REGc to the high byte of the top pixel line of the
. picture, so #REGde holds its screen address.
  $807E,$02 #REGb=#N$01 (one pass, for row order).
  $8080,$06 Jump to #R$8088 if bit 0 of *#R$8005 is set (row order).
  $8086,$02 Else #REGb=#N$20 (one pass for each column).
@ $8088 label=DrawPicture_PassLoop
  $8088,$01 Stash the pass counter on the stack.
  $8089,$03 #REGb=the number of thirds from *#R$8004.
@ $808C label=DrawPicture_ThirdLoop
  $808C,$01 Stash the thirds counter on the stack.
  $808D,$02 #REGb=#N$08 (character rows in a third).
@ $808F label=DrawPicture_RowLoop
  $808F,$01 Stash the character row counter on the stack.
  $8090,$02 #REGb=#N$08 (pixel lines in a character row).
@ $8092 label=DrawPicture_LineLoop
  $8092,$01 Stash the pixel line counter on the stack.
  $8093,$02 #REGb=#N$01 (one byte, for column order).
  $8095,$06 Jump to #R$809D if bit 0 of *#R$8005 is clear (column order).
  $809B,$02 Else #REGb=#N$20 (a whole pixel line, for row order).
  $809D,$01 Stash the screen address of this pixel line on the stack.
@ $809E label=DrawPicture_ByteLoop
  $809E,$01 Stash the byte counter on the stack.
  $809F,$02 Jump to #R$80E4 to write the next byte; it comes back to #R$80A1.
@ $80A1 label=DrawPicture_NextByte
  $80A1,$01 Restore the byte counter from the stack.
  $80A2,$01 Move right to the next screen byte.
  $80A3,$02 Decrease the byte counter by one and loop back to #R$809E until
. it is zero.
  $80A5,$01 Restore the screen address of this pixel line from the stack.
  $80A6,$01 Restore the pixel line counter from the stack.
  $80A7,$01 Move down to the next pixel line.
  $80A8,$02 Decrease the pixel line counter by one and loop back to #R$8092
. until all #N$08 pixel lines are done.
  $80AA,$04 Move #REGd back up to the top pixel line of this character row
. (subtract #N$08).
  $80AE,$04 Move down to the next character row (add #N$20 to #REGe).
  $80B2,$01 Restore the character row counter from the stack.
  $80B3,$02 Decrease the character row counter by one and loop back to
. #R$808F until all #N$08 character rows are done.
  $80B5,$04 Move down to the next third (add #N$08 to #REGd). #REGe has gone
. back round to the same column.
  $80B9,$01 Restore the thirds counter from the stack.
  $80BA,$02 Decrease the thirds counter by one and loop back to #R$808C until
. all the thirds are done.
  $80BC,$01 Move #REGd back up to the top of the picture (#REGd=#REGc).
  $80BD,$01 Move right to the next column.
  $80BE,$01 Restore the pass counter from the stack.
  $80BF,$02 Decrease the pass counter by one and loop back to #R$8088 until
. all the passes are done.
N $80C1 Draw the attributes.
@ $80C1 label=DrawPicture_Attributes
  $80C1,$02 #REGe=#N$00.
@ $80C3 label=DrawPicture_AttributesHighByte
  $80C3,$02 #REGa=#N$58, the high byte of the start of the attribute file.
. BASIC POKEs this byte to draw into a buffer instead.
  $80C5,$03 Add the screen third.
  $80C8,$01 #REGd=#REGa, so #REGde holds the address of the first attribute
. of the picture.
  $80C9,$04 #REGbc=the number of attributes to draw: 256 for each third
. (#REGb=*#R$8004 and #REGc=#N$00).
  $80CD,$04 Set bit 3 of *#R$8005, so that #R$80E4 comes back to #R$80D4.
@ $80D1 label=DrawPicture_AttributesLoop
  $80D1,$01 Stash the attribute counter on the stack.
  $80D2,$02 Jump to #R$80E4 to write the next attribute; it comes back to
. #R$80D4.
@ $80D4 label=DrawPicture_NextAttribute
  $80D4,$01 Restore the attribute counter from the stack.
  $80D5,$01 Decrease the attribute counter by one.
  $80D6,$01 Move on to the next attribute.
  $80D7,$04 Jump back to #R$80D1 until the attribute counter is zero.
  $80DB,$08 Write #N$FF to *#R$8003 and *#R$8004. BASIC never POKEs these
. bytes, so the next picture again takes its screen third and number of
. thirds from its own record.
  $80E3,$01 Return.
N $80E4 Write the next byte of picture data to *#REGde. While a run of
. repeated bytes is being written, bit 2 of *#R$8005 is set, #REGb' holds the
. count and #REGc' holds the value.
@ $80E4 label=DrawPicture_FetchByte
  $80E4,$06 Jump to #R$80F7 if no run is in progress.
  $80EA,$01 Switch to the shadow registers.
  $80EB,$01 Decrease the run count in #REGb' by one.
  $80EC,$01 #REGa=the run value from #REGc'.
  $80ED,$01 Switch back to the normal registers.
  $80EE,$02 Jump to #R$80F3 if the run has finished.
  $80F0,$01 Write the run value to *#REGde.
  $80F1,$02 Jump to #R$810B.
@ $80F3 label=DrawPicture_EndRun
  $80F3,$04 Clear bit 2 of *#R$8005, as the run has finished.
@ $80F7 label=DrawPicture_ReadByte
  $80F7,$02 #REGa=the next byte of picture data, and move #REGhl on.
  $80F9,$03 Jump to #R$810A if it is not zero, to write it as it is.
  $80FC,$04 A zero byte starts a run. #REGb'=the count.
  $8100,$01 Move #REGhl on to the value.
  $8101,$04 #REGc'=the value (#REGa holds it too).
  $8105,$01 Move #REGhl on to the next byte of picture data.
  $8106,$04 Set bit 2 of *#R$8005, as a run is in progress.
@ $810A label=DrawPicture_WriteByte
  $810A,$01 Write the byte to *#REGde.
@ $810B label=DrawPicture_Continue
  $810B,$06 Jump back to #R$80D4 if the attributes are being drawn.
  $8111,$02 Else jump back to #R$80A1.

u $8113 Unused
D $8113 These bytes follow the picture routine; nothing reads them.
B $8113,$19,$10

b $812C Graphics: The Scene Of The Crime
@ $812C label=Graphics_SceneOfTheCrime
D $812C The Forest Residence, where the victim lies on the floor; drawn into
. #R$C000 by line 160. The name comes from the instructions ("1. The Forest
. Residence: The scene of the Crime.").
D $812C #PUSHS #POKES$8002,$01
. #UDGTABLE
. { =h The Scene Of The Crime }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(scene-of-the-crime) }
. UDGTABLE#
. #POPS
W $812C,$02 Length of this record, less one (#N($0F3D,$04,$04)); the next
. record starts at #R$906A.
B $812E,$01 Screen third to start at (#N$00).
B $812F,$01 Number of thirds to draw (#N$03).
B $8130,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $8131 label=Graphics_SceneOfTheCrime_Pixels
B $8131,$0EF8,$10 Compressed pixel data.
@ $9029 label=Graphics_SceneOfTheCrime_Attributes
B $9029,$003E,$10 Compressed attribute data.
B $9067,$03 Never read: the attributes are complete before these bytes.

b $906A Graphics: Left Hand, Automatic Pistol, Left Arm
@ $906A label=Graphics_LeftHandPistolLeftArm
D $906A Three photographs, named by their own captions: "LEFT HAND" (frame
. #N$01), "Automatic Pistol" (frame #N$02) and "LEFT ARM" (frame #N$03).
D $906A #PUSHS #POKES$8002,$02
. #UDGTABLE
. { =h Left Hand, Automatic Pistol, Left Arm }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(left-hand-pistol-left-arm) }
. UDGTABLE#
. #POPS
W $906A,$02 Length of this record, less one (#N($0715,$04,$04)); the next
. record starts at #R$9780.
B $906C,$01 Screen third to start at (#N$00).
B $906D,$01 Number of thirds to draw (#N$03).
B $906E,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $906F label=Graphics_LeftHandPistolLeftArm_Pixels
B $906F,$0628,$10 Compressed pixel data.
@ $9697 label=Graphics_LeftHandPistolLeftArm_Attributes
B $9697,$00E6,$10 Compressed attribute data.
B $977D,$03 Never read: the attributes are complete before these bytes.

b $9780 Graphics: Cartridge, Ashtray, Rothmans
@ $9780 label=Graphics_CartridgeAshtrayRothmans
D $9780 Three photographs: "CARTRIDGE" (frame #N$01) and "Ashtray with two
. stubs" (frame #N$02) are their own captions; frame #N$03 has no caption and
. shows a packet printed "Rothmans King Size".
D $9780 #PUSHS #POKES$8002,$03
. #UDGTABLE
. { =h Cartridge, Ashtray, Rothmans }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(cartridge-ashtray-rothmans) }
. UDGTABLE#
. #POPS
W $9780,$02 Length of this record, less one (#N($07FC,$04,$04)); the next
. record starts at #R$9F7D.
B $9782,$01 Screen third to start at (#N$00).
B $9783,$01 Number of thirds to draw (#N$03).
B $9784,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $9785 label=Graphics_CartridgeAshtrayRothmans_Pixels
B $9785,$06D8,$10 Compressed pixel data.
@ $9E5D label=Graphics_CartridgeAshtrayRothmans_Attributes
B $9E5D,$011D,$10 Compressed attribute data.
B $9F7A,$03 Never read: the attributes are complete before these bytes.

b $9F7D Graphics: Bar Le Sympa, Handbag, Diary
@ $9F7D label=Graphics_BarLeSympaHandbagDiary
D $9F7D Three photographs: frame #N$01 has no caption and shows a book of
. matches printed "BAR LE Sympa"; "HANDBAG" (frame #N$02) and "Diary" (frame
. #N$03) are their own captions.
D $9F7D #PUSHS #POKES$8002,$04
. #UDGTABLE
. { =h Bar Le Sympa, Handbag, Diary }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(bar-le-sympa-handbag-diary) }
. UDGTABLE#
. #POPS
W $9F7D,$02 Length of this record, less one (#N($0624,$04,$04)); the next
. record starts at #R$A5A2.
B $9F7F,$01 Screen third to start at (#N$00).
B $9F80,$01 Number of thirds to draw (#N$03).
B $9F81,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $9F82 label=Graphics_BarLeSympaHandbagDiary_Pixels
B $9F82,$0508,$10 Compressed pixel data.
@ $A48A label=Graphics_BarLeSympaHandbagDiary_Attributes
B $A48A,$0115,$10 Compressed attribute data.
B $A59F,$03 Never read: the attributes are complete before these bytes.

b $A5A2 Graphics: Diary Page, Button, Goodbye Note
@ $A5A2 label=Graphics_DiaryPageButtonGoodbyeNote
D $A5A2 Three photographs. Frame #N$01 is the inside of the diary (line 610
. shows it when SPACE is pressed after the diary in line 580); "Button" (frame
. #N$02) is its own caption; frame #N$03 has no caption and shows a note reading
. "Goodbye! I must end it all", signed "Vera".
D $A5A2 #PUSHS #POKES$8002,$05
. #UDGTABLE
. { =h Diary Page, Button, Goodbye Note }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(diary-page-button-goodbye-note) }
. UDGTABLE#
. #POPS
W $A5A2,$02 Length of this record, less one (#N($05EB,$04,$04)). This is the
. last record in the list.
B $A5A4,$01 Screen third to start at (#N$00).
B $A5A5,$01 Number of thirds to draw (#N$03).
B $A5A6,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $A5A7 label=Graphics_DiaryPageButtonGoodbyeNote_Pixels
B $A5A7,$0508,$10 Compressed pixel data.
@ $AAAF label=Graphics_DiaryPageButtonGoodbyeNote_Attributes
B $AAAF,$00DC,$10 Compressed attribute data.
B $AB8B,$03 Never read: the attributes are complete before these bytes.

u $AB8E Unused
S $AB8E,$1472

b $C000 Screen Buffer
@ $C000 label=ScreenBuffer
D $C000 Line 160 draws the scene of the crime here; #R$FC00 copies it to the
. screen.
S $C000,$1800 Pixels.
S $D800,$0300 Attributes.

u $DB00 Unused
S $DB00,$0500

b $E000 Picture Buffer
@ $E000 label=PictureBuffer
D $E000 BASIC draws a picture sheet here; #R$FB00 copies single frames from it
. to the screen.
S $E000,$1800 Pixels.
@ $F800 label=PictureBuffer_Attributes
S $F800,$0300 Attributes.

c $FB00 Display Frame
@ $FB00 label=DisplayFrame
D $FB00 Copies one frame of the picture held in the buffer at #R$E000 to the
. screen: first the pixel rows, then the attributes from #R$F800. Called
. by BASIC with the frame number POKEd into #R$FB02.
D $FB00 The values in the snapshot describe rows of #N$03 frames of #N$0A by
. #N$11 characters, copied to column #N$03, row #N$02.
  $FB00,$02 Jump to #R$FB0C.

g $FB02 Display Frame Parameters
@ $FB02 label=DisplayFrame_Number
D $FB02 Parameters for #R$FB00.
@ $FB03 label=DisplayFrame_PerRow
@ $FB04 label=DisplayFrame_Width
@ $FB05 label=DisplayFrame_Height
@ $FB06 label=DisplayFrame_Column
@ $FB07 label=DisplayFrame_Row
@ $FB08 label=DisplayFrame_ScreenOffset
@ $FB0A label=DisplayFrame_BufferOffset
B $FB02,$01 Frame number (counting from #N$01).
B $FB03,$01 Frames in each row of the picture.
B $FB04,$01 Width of a frame, in characters.
B $FB05,$01 Height of a frame, in characters.
B $FB06,$01 Screen column to copy the frame to.
B $FB07,$01 Screen row to copy the frame to.
W $FB08,$02 Screen offset (work space).
W $FB0A,$02 Buffer offset (work space).

c $FB0C Display Frame: Copy
@ $FB0C label=DisplayFrame_Copy
D $FB0C Continues from #R$FB00.
@ $FB9F nowarn

c $FBC3 Display Frame: Calculate Offset
@ $FBC3 label=DisplayFrame_CalculateOffset
D $FBC3 Returns #REGhl = #REGl * #N$20 + #REGc.
R $FBC3 C Column
R $FBC3 L Row
R $FBC3 O:HL Offset

u $FBCD Unused
S $FBCD,$0033

b $FC00 Copy Screen Buffer
@ $FC00 label=CopyScreenBuffer
D $FC00 Zero in the snapshot. Lines 40-50 POKE three small routines here:
D $FC00 #LIST { #R$FC00: DI, copy #N($1B00,$04,$04) bytes from #R$C000 to the
. screen, EI, RET. } { #R$FC0E: DI, RET. } { #R$FC10: EI, RET. } LIST#
S $FC00,$0E
@ $FC0E label=DisableInterrupts
S $FC0E,$02
@ $FC10 label=EnableInterrupts
S $FC10,$02

u $FC12 Unused
D $FC12 The non-zero bytes at the end are left over from the stack used while
. the game was loading.
S $FC12,$0306
B $FF18,$0040,$10

i $FF58
