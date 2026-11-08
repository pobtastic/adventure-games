; Copyright Infogrames 1987, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @start
> $4000 @org=$4000
> $4000 @rom
> $4000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
> $4000 @expand=#IF({asm})(#DEF(#SIDNEY(addr)(link=The Sidney Affair)$link))
> $4000 @expand=#IF({asm})(#DEF(#SIDNEYTWO(addr)(link=The Sidney Affair: Side 2)$link))
> $4000 @expand=#IF({asm})(#DEF(#VERACRUZ(addr)(link=Vera Cruz)$link))
> $4000 @expand=#IF({asm})(#DEF(#VERACRUZTWO(addr)(link=Vera Cruz: Part 2)$link))
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h The Sidney Affair Loading Screen. }
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
. Line 45: sets #R$FB09 (ins), #R$FBC7 (noi), #R$FBFE (scr), #R$FC86 (prn),
. #R$FF53 (iof), #R$FF55 (ion), #R$FF57 (ref) and #R$8000 (lib). } {
. Lines 80-86: draw picture "z1" into the buffer at #R$E000 and show frame
. "z2" with #R$FB09. } { Line 105: draws picture "aa" (which can be #N$03 or
. #N$04) into the buffer at #R$C000. } { Line 200: copies that buffer to the
. screen with #R$FF57. } {
. Lines 240 and 270: print "s$" with #R$FC86. } { Line 845: plays noise with
. #R$FBC7. } LIST#
B $5CCB,$0023 Line 5.
B $5CEE,$000E Line 10.
B $5CFC,$000A Line 15.
B $5D06,$0030 Line 16.
B $5D36,$000C Line 17.
B $5D42,$003D Line 18.
B $5D7F,$0009 Line 19.
B $5D88,$0045 Line 21.
B $5DCD,$001F Line 22.
B $5DEC,$0070 Line 23.
B $5E5C,$0050 Line 24.
B $5EAC,$0016 Line 25.
B $5EC2,$002F Line 27.
B $5EF1,$001D Line 28.
B $5F0E,$0006 Line 29.
B $5F14,$006C Line 30.
B $5F80,$0051 Line 40.
B $5FD1,$0018 Line 42.
B $5FE9,$008E Line 45.
B $6077,$003C Line 47.
B $60B3,$001A Line 50.
B $60CD,$009C Line 60.
B $6169,$0052 Line 70.
B $61BB,$003B Line 80.
B $61F6,$0089 Line 84.
B $627F,$001C Line 86.
B $629B,$006C Line 90.
B $6307,$001F Line 100.
B $6326,$008D Line 105.
B $63B3,$000E Line 110.
B $63C1,$0062 Line 120.
B $6423,$0047 Line 130.
B $646A,$0048 Line 140.
B $64B2,$0063 Line 150.
B $6515,$0017 Line 160.
B $652C,$001D Line 170.
B $6549,$001E Line 172.
B $6567,$0063 Line 174.
B $65CA,$000F Line 180.
B $65D9,$0008 Line 190.
B $65E1,$0025 Line 200.
B $6606,$002E Line 210.
B $6634,$0025 Line 220.
B $6659,$0033 Line 230.
B $668C,$0021 Line 240.
B $66AD,$001E Line 250.
B $66CB,$0020 Line 260.
B $66EB,$0021 Line 270.
B $670C,$0006 Line 310.
B $6712,$001D Line 320.
B $672F,$0025 Line 325.
B $6754,$0025 Line 330.
B $6779,$0025 Line 340.
B $679E,$0030 Line 350.
B $67CE,$000F Line 355.
B $67DD,$0024 Line 360.
B $6801,$0025 Line 370.
B $6826,$0026 Line 380.
B $684C,$000F Line 390.
B $685B,$0049 Line 400.
B $68A4,$003B Line 410.
B $68DF,$003B Line 420.
B $691A,$0062 Line 430.
B $697C,$003B Line 440.
B $69B7,$000E Line 450.
B $69C5,$0017 Line 455.
B $69DC,$0055 Line 460.
B $6A31,$0049 Line 470.
B $6A7A,$0049 Line 480.
B $6AC3,$0049 Line 490.
B $6B0C,$0024 Line 510.
B $6B30,$0091 Line 520.
B $6BC1,$002D Line 530.
B $6BEE,$0028 Line 540.
B $6C16,$0094 Line 550.
B $6CAA,$0057 Line 560.
B $6D01,$0026 Line 570.
B $6D27,$0046 Line 580.
B $6D6D,$0040 Line 590.
B $6DAD,$0024 Line 700.
B $6DD1,$0028 Line 710.
B $6DF9,$0007 Line 720.
B $6E00,$0029 Line 730.
B $6E29,$0029 Line 735.
B $6E52,$0006 Line 740.
B $6E58,$004E Line 790.
B $6EA6,$004E Line 791.
B $6EF4,$0049 Line 792.
B $6F3D,$0050 Line 793.
B $6F8D,$004A Line 794.
B $6FD7,$004B Line 795.
B $7022,$0006 Line 800.
B $7028,$002D Line 810.
B $7055,$0084 Line 820.
B $70D9,$001A Line 830.
B $70F3,$001C Line 840.
B $710F,$001E Line 845.
B $712D,$003D Line 850.
B $716A,$001C Line 860.
B $7186,$0006 Line 880.
B $718C,$0037 Line 900.
B $71C3,$003C Line 905.
B $71FF,$003A Line 910.
B $7239,$0037 Line 915.
B $7270,$000D Line 920.
B $727D,$0030 Line 930.
B $72AD,$0030 Line 935.
B $72DD,$0030 Line 940.
B $730D,$0030 Line 945.
B $733D,$0030 Line 950.
B $736D,$0030 Line 955.
B $739D,$0031 Line 960.
B $73CE,$0031 Line 962.
B $73FF,$0031 Line 964.
B $7430,$0031 Line 965.
B $7461,$0031 Line 970.
B $7492,$0031 Line 975.
B $74C3,$0031 Line 977.
B $74F4,$0031 Line 980.
B $7525,$0031 Line 985.
B $7556,$0031 Line 990.
B $7587,$0031 Line 995.
B $75B8,$000E Line 1000.
B $75C6,$0016 Line 1010.
B $75DC,$001E Line 1020.
B $75FA,$0016 Line 1030.
B $7610,$0010 Line 1040.
B $7620,$0041 Line 1050.
B $7661,$004D Line 1060.
B $76AE,$0077 Line 1070.
B $7725,$0052 Line 1080.
B $7777,$000E Line 1090.
B $7785,$0038 Line 1100.
B $77BD,$0014 Line 1110.
B $77D1,$002E Line 4000.
B $77FF,$0021 Line 4010.
B $7820,$0020 Line 4020.
B $7840,$0024 Line 4030.
B $7864,$0012 Line 4040.
B $7876,$000D Line 4060.

b $7883 BASIC Variables
@ $7883 label=BasicVariables
D $7883 The BASIC variables, up to #SKOOLKID$5C59(E_LINE).
B $7883,$07,$10
B $788A,$01 End marker.

b $788B Edit Line
@ $788B label=EditLine
D $788B The current BASIC edit line, from #SKOOLKID$5C59(E_LINE) up to
. #SKOOLKID$5C61(WORKSP).
B $788B,$0D

b $7898 Workspace
@ $7898 label=Workspace
D $7898 Bytes from #SKOOLKID$5C61(WORKSP) to #SKOOLKID$5C63(STKBOT).
B $7898,$0011,$10

u $78A9 Unused
D $78A9 Free memory between #SKOOLKID$5C65(STKEND) and the machine stack.
. #N($78AC,$04,$04)-#N($78B6,$04,$04) contains non-zero bytes (tape leftovers);
. the non-zero bytes near the top are left over from earlier stack use.
S $78A9,$0725
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
. works on both sides of the game.
E $8000 View the equivalent code in;
. #LIST
. { #SIDNEYTWO$C350 }
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
. { #SIDNEYTWO$C352 }
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
. { #SIDNEYTWO$C356 }
. LIST#
N $8006 Find out where this code is in memory. The call leaves its return
. address (#R$8009) just below the stack pointer. An interrupt at this point
. would overwrite it, so BASIC calls #R$FF53 first and #R$FF55 afterwards.
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


b $812C Graphics: Crosshair
@ $812C label=Graphics_Crosshair
D $812C A crosshair on a black screen; drawn by line 810 before the face
. animation. Nothing in the game text names this picture.
D $812C #PUSHS #POKES$8002,$01
. #UDGTABLE
. { =h Crosshair }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(crosshair) }
. UDGTABLE#
. #POPS
W $812C,$02 Length of this record, less one (#N($01A4,$04,$04)); the next
. record starts at #R$82D1.
B $812E,$01 Screen third to start at (#N$00).
B $812F,$01 Number of thirds to draw (#N$03).
B $8130,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $8131 label=Graphics_Crosshair_Pixels
B $8131,$0149,$10 Compressed pixel data.
@ $827A label=Graphics_Crosshair_Attributes
B $827A,$0054,$10 Compressed attribute data.
B $82CE,$03 Never read: the attributes are complete before these bytes.

b $82D1 Graphics: Face Animation
@ $82D1 label=Graphics_FaceAnimation
D $82D1 Eight frames of a man's face with a crosshair, shown by frames
. #N$01-#N$08 when "z" is #N$21-#N$28 (lines 830-850). Nothing in the game
. text names this picture.
D $82D1 #PUSHS #POKES$8002,$02
. #UDGTABLE
. { =h Face Animation }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(face-animation) }
. UDGTABLE#
. #POPS
W $82D1,$02 Length of this record, less one (#N($0BAA,$04,$04)); the next
. record starts at #R$8E7C.
B $82D3,$01 Screen third to start at (#N$00).
B $82D4,$01 Number of thirds to draw (#N$03).
B $82D5,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $82D6 label=Graphics_FaceAnimation_Pixels
B $82D6,$0B6C,$10 Compressed pixel data.
@ $8E42 label=Graphics_FaceAnimation_Attributes
B $8E42,$0037,$10 Compressed attribute data.
B $8E79,$03 Never read: the attributes are complete before these bytes.

b $8E7C Graphics: The Scene Of The Crime
@ $8E7C label=Graphics_SceneOfTheCrime
D $8E7C The outdoor scene with the victim on the pavement; drawn into #R$C000
. when "aa" is #N$03 (line 105). The name comes from the on-screen text in
. lines 930-945 ("scene of the crime").
D $8E7C #PUSHS #POKES$8002,$03
. #UDGTABLE
. { =h The Scene Of The Crime }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(scene-of-the-crime) }
. UDGTABLE#
. #POPS
W $8E7C,$02 Length of this record, less one (#N($0A7F,$04,$04)); the next
. record starts at #R$98FC.
B $8E7E,$01 Screen third to start at (#N$00).
B $8E7F,$01 Number of thirds to draw (#N$03).
B $8E80,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $8E81 label=Graphics_SceneOfTheCrime_Pixels
B $8E81,$0902,$10 Compressed pixel data.
@ $9783 label=Graphics_SceneOfTheCrime_Attributes
B $9783,$0176,$10 Compressed attribute data.
B $98F9,$03 Never read: the attributes are complete before these bytes.

b $98FC Graphics: Room With Open Window
@ $98FC label=Graphics_RoomWithOpenWindow
D $98FC The interior room with an open window, plant-pot and chair; drawn into
. #R$C000 when "aa" is #N$04 (line 174). Nothing in the game text names this
. picture; the evidence text refers to the window and the plant-pot.
D $98FC #PUSHS #POKES$8002,$04
. #UDGTABLE
. { =h Room With Open Window }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)#SCR$02(room-with-open-window) }
. UDGTABLE#
. #POPS
W $98FC,$02 Length of this record, less one (#N($082F,$04,$04)); the next
. record starts at #R$A12C.
B $98FE,$01 Screen third to start at (#N$00).
B $98FF,$01 Number of thirds to draw (#N$03).
B $9900,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $9901 label=Graphics_RoomWithOpenWindow_Pixels
B $9901,$06C3,$10 Compressed pixel data.
@ $9FC4 label=Graphics_RoomWithOpenWindow_Attributes
B $9FC4,$0165,$10 Compressed attribute data.
B $A129,$03 Never read: the attributes are complete before these bytes.

b $A12C Graphics: Briefcase, Key, Wallet, Bullet Hole, Diary, Photograph
@ $A12C label=Graphics_BriefcaseKeyWalletBulletHoleDiaryPhotograph
D $A12C Six evidence photographs, shown by frame when "z" is #N$51-#N$56. Each
. is named by the text the game prints with it:
. #LIST
. { Frame #N$01: a locked briefcase, marked SJ (line 540) }
. { Frame #N$02: a key with the initials SJ (line 510) }
. { Frame #N$03: wallet with driving licence and cards of James Sidney (line
. 520) }
. { Frame #N$04: a bullet hole in the house wall (line 530) }
. { Frame #N$05: diary contents (line 550) }
. { Frame #N$06: black and white photograph of a kissing couple (line 560) }
. LIST#
D $A12C #PUSHS #POKES$8002,$05
. #UDGTABLE
. { =h Briefcase, Key, Wallet, Bullet Hole, Diary, Photograph }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)
. #SCR$02(briefcase-key-wallet-bullet-hole-diary-photograph) }
. UDGTABLE#
. #POPS
W $A12C,$02 Length of this record, less one (#N($06EE,$04,$04)); the next
. record starts at #R$A81B.
B $A12E,$01 Screen third to start at (#N$00).
B $A12F,$01 Number of thirds to draw (#N$03).
B $A130,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $A131 label=Graphics_BriefcaseKeyWalletBulletHoleDiaryPhotograph_Pixels
B $A131,$067E,$10 Compressed pixel data.
@ $A7AF label=Graphics_BriefcaseKeyWalletBulletHoleDiaryPhotograph_Attributes
B $A7AF,$0069,$10 Compressed attribute data.
B $A818,$03 Never read: the attributes are complete before these bytes.

b $A81B Graphics: Fingerprint, Cigarette Butt, Spent Cartridge
@ $A81B label=Graphics_FingerprintCigaretteButtSpentCartridge
D $A81B Three evidence photographs, shown by frame when "z" is #N$61-#N$63.
. Each is named by the text the game prints with it:
. #LIST
. { Frame #N$01: a fingerprint on the window (line 570) }
. { Frame #N$02: cigarette butt, marked CAMEL (line 580) }
. { Frame #N$03: spent cartridge, 7x64 (line 590) }
. LIST#
D $A81B #PUSHS #POKES$8002,$06
. #UDGTABLE
. { =h Fingerprint, Cigarette Butt, Spent Cartridge }
. { #SIM(start=$8000,stop=$80E3,sp=$7FF0)
. #SCR$02(fingerprint-cigarette-butt-spent-cartridge) }
. UDGTABLE#
. #POPS
W $A81B,$02 Length of this record, less one (#N($04B1,$04,$04)). This is the
. last record in the list.
B $A81D,$01 Screen third to start at (#N$00).
B $A81E,$01 Number of thirds to draw (#N$03).
B $A81F,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $A820 label=Graphics_FingerprintCigaretteButtSpentCartridge_Pixels
B $A820,$049A,$10 Compressed pixel data.
@ $ACBA label=Graphics_FingerprintCigaretteButtSpentCartridge_Attributes
B $ACBA,$0010,$10 Compressed attribute data.
B $ACCA,$03 Never read: the attributes are complete before these bytes.


u $ACCD Last Bytes Of Code Block
D $ACCD The picture sheets end at #N($ACCC,$04,$04). These last bytes of the
. CODE block at #N($8000,$04,$04) (the zero list terminator and padding) are
. not part of any picture record.
S $ACCD,$001F

u $ACEC Unused
S $ACEC,$1314

b $C000 Screen Buffer
@ $C000 label=ScreenBuffer
D $C000 Lines 105 and 174 draw a room scene here; #R$FF57 copies it to the
. screen.
S $C000,$1800 Pixels.
S $D800,$0300 Attributes.

u $DB00 Unused
S $DB00,$0500

b $E000 Picture Buffer
@ $E000 label=PictureBuffer
D $E000 BASIC draws a picture sheet here; #R$FB09 copies single frames from it
. to the screen.
S $E000,$1800 Pixels.
@ $F800 label=PictureBuffer_Attributes
S $F800,$0300 Attributes.

g $FB00 Display Frame Parameters
@ $FB00 label=DisplayFrame_BufferBase
D $FB00 Parameters for #R$FB09. BASIC POKEs them relative to "ins".
@ $FB02 label=DisplayFrame_Number
@ $FB03 label=DisplayFrame_PerRow
@ $FB04 label=DisplayFrame_Width
@ $FB05 label=DisplayFrame_Height
@ $FB06 label=DisplayFrame_Column
@ $FB07 label=DisplayFrame_Row
@ $FB08 label=DisplayFrame_LineWidth
W $FB00,$02 Buffer base address (#N($E000,$04,$04) in the snapshot).
B $FB02,$01 Frame number (counting from #N$01).
B $FB03,$01 Frames in each row of the picture.
B $FB04,$01 Width of a frame, in characters.
B $FB05,$01 Height of a frame, in characters.
B $FB06,$01 Screen column to copy the frame to.
B $FB07,$01 Screen row to copy the frame to.
B $FB08,$01 Width of a pixel line to copy, in bytes.

c $FB09 Display Frame
@ $FB09 label=DisplayFrame
D $FB09 Copies one frame of the picture held in the buffer at #R$E000 to the
. screen: first the pixel rows, then the attributes from #R$F800. Called by
. BASIC as "ins" (#N($FB09,$04,$04)) with the frame number POKEd into
. #R$FB02.
D $FB09 The routine works out the frame's row and column in the sheet from
. *#R$FB02 and *#R$FB03, converts those to byte offsets with #R$FBB9, and
. copies *#R$FB05 character rows of *#R$FB08 bytes from the buffer to the
. screen at *#R$FB06 / *#R$FB07. It then copies the matching attributes from
. the buffer (offset by #N($1800,$04,$04)) to the attribute file.
D $FB09 The values in the snapshot describe rows of #N$04 frames of #N$08 by
. #N$0A characters, copied to column #N$19, row #N$03 after line 60.
  $FB09,$01 Disable interrupts.
@ $FB6A nowarn
@ $FB6D nowarn
@ $FBA0 nowarn

c $FBB9 Display Frame: Calculate Offset
@ $FBB9 label=DisplayFrame_CalculateOffset
D $FBB9 Returns #REGhl = #REGl * #N$20 + #REGc.
R $FBB9 C Column
R $FBB9 L Row
R $FBB9 O:HL Offset

g $FBC3 Display Frame Work Space
@ $FBC3 label=DisplayFrame_ScreenOffset
@ $FBC5 label=DisplayFrame_BufferOffset
D $FBC3 Work space used by #R$FB09 for the screen and buffer character
. offsets of the frame.
W $FBC3,$02 Screen character offset.
W $FBC5,$02 Buffer character offset.

c $FBC7 Sound: Noise
@ $FBC7 label=Sound_Noise
D $FBC7 Makes a short noise on the speaker by toggling bit 4 of port
. #N($FE,$02,$02) for #N($0080,$04,$04) pulses. Called by BASIC as "noi"
. (#N($FBC7,$04,$04)).
  $FBC7,$01 Disable interrupts.

g $FBF6 Scroll Window Parameters
@ $FBF6 label=ScrollWindow_Fill
D $FBF6 Parameters for #R$FBFE. BASIC POKEs them relative to "scr".
@ $FBF9 label=ScrollWindow_Lines
@ $FBFA label=ScrollWindow_Left
@ $FBFB label=ScrollWindow_Top
@ $FBFC label=ScrollWindow_Right
@ $FBFD label=ScrollWindow_Bottom
B $FBF6,$03 Fill bytes for the bottom line of the window (left, middle,
. right).
B $FBF9,$01 Number of pixel lines to scroll.
B $FBFA,$01 Left column.
B $FBFB,$01 Top pixel line.
B $FBFC,$01 Right column.
B $FBFD,$01 Bottom pixel line.

c $FBFE Scroll Window
@ $FBFE label=ScrollWindow
D $FBFE Scrolls a window of the screen up one pixel line at a time, filling
. the new bottom line from #R$FBF6. Called by BASIC as "scr"
. (#N($FBFE,$04,$04)).
  $FBFE,$01 Disable interrupts.
@ $FC0C nowarn
@ $FC25 nowarn

c $FC45 Scroll Window: Screen Address
@ $FC45 label=ScrollWindow_ScreenAddress
D $FC45 Returns the screen address of pixel line #REGc, column #REGb.
R $FC45 B Column
R $FC45 C Pixel line
R $FC45 O:HL Screen address

c $FC5B Scroll Window: Next Pixel Line
@ $FC5B label=ScrollWindow_NextLine
D $FC5B Moves #REGhl down one pixel line on the screen. Returns with the zero
. flag set when a new character row has been entered.
R $FC5B HL Screen address

c $FC6C Scroll Window: Fill Bottom Line
@ $FC6C label=ScrollWindow_FillLine
D $FC6C Fills the bottom pixel line of the window from #R$FBF6: the left byte,
. a run of the middle byte, then the right byte.

b $FC83 Print String Variable Name
@ $FC83 label=PrintString_VariableName
D $FC83 Name of the string variable printed by #R$FC86 ("S$", then a space).
T $FC83,$03

c $FC86 Print String
@ $FC86 label=PrintString
D $FC86 Prints the BASIC string "s$" at the current print position in a
. 64-column font. It finds the string with the ROM routine
. #SKOOLKID$28B2(LOOK-VARS), using the name at #R$FC83, and stops with an
. error if it is missing. Codes below #N$20 go straight to RST #N$10; codes
. from #N$90 upwards are skipped. Called by BASIC as "prn"
. (#N($FC86,$04,$04)).
  $FC86,$01 Disable interrupts.

c $FCC4 Print String: Print Character
@ $FCC4 label=PrintString_Character
D $FCC4 Builds two 4-pixel characters side by side in the UDG for "U" (graphic
. code #N$A4) from the font at #R$FD03, and prints that UDG after every second
. character. The flag at #R$FD02 records whether a half is waiting.
R $FCC4 A Character code

g $FD02 Print String Half Flag
@ $FD02 label=PrintString_HalfFlag
D $FD02 Half-character flag for #R$FC86.
B $FD02,$01

b $FD03 Font
@ $FD03 label=Font
D $FD03 The 4x8 font used by #R$FC86 for character codes #N$20 to #N$8F. Each
. character is four bytes, each byte holding two pixel rows in its two
. nibbles.
B $FD03,$01C0,$04

b $FEC3 Match String Data
@ $FEC3 label=MatchString_BName
@ $FEC6 label=MatchString_ZName
D $FEC3 Variable names used by #R$FEC9.
T $FEC3,$03 Name of the string to search ("B$", then a space).
T $FEC6,$03 Name of the substring to find ("Z$", then a space).

c $FEC9 Match String
@ $FEC9 label=MatchString
D $FEC9 Finds the BASIC string "z$" inside "b$" and returns the match position
. in #REGbc (or zero if there is no match). Called by BASIC on side 2 as
. "ist" (#N($FEC9,$04,$04)).
  $FEC9,$01 Disable interrupts.

c $FF35 Match String: Look Up Variable
@ $FF35 label=MatchString_LookUpVariable
D $FF35 Calls #SKOOLKID$28B2(LOOK-VARS) for the name pointed to by #REGhl.
. Returns with the zero flag set if the variable is missing or empty; else
. #REGhl points to the string body and #REGbc holds its length.
R $FF35 HL Pointer to the variable name
B $FF51,$01 Error code for the RST #N$08 above.
B $FF52,$01

c $FF53 Disable Interrupts
@ $FF53 label=DisableInterrupts
D $FF53 Called by BASIC as "iof" (#N($FF53,$04,$04)) either side of
. #R$8000.
  $FF53,$02 Disable interrupts and return.

c $FF55 Enable Interrupts
@ $FF55 label=EnableInterrupts
D $FF55 Called by BASIC as "ion" (#N($FF55,$04,$04)).
  $FF55,$02 Enable interrupts and return.

c $FF57 Copy Screen Buffer
@ $FF57 label=CopyScreenBuffer
D $FF57 Copies #N($1B00,$04,$04) bytes from #R$C000 to the screen. Called by
. BASIC as "ref" (#N($FF57,$04,$04)).
  $FF57,$03 #REGhl=#R$C000.
  $FF5A,$01 Disable interrupts.
  $FF5B,$03 #REGde=#N($4000,$04,$04).
  $FF5E,$03 #REGbc=#N($1B00,$04,$04).
  $FF61,$02 Copy the bytes.
  $FF63,$01 Return.

c $FF64 Prepare BASIC Return
@ $FF64 label=PrepareBasicReturn
D $FF64 Writes the address #R$FF6F into the error stack pointed to by
. #SKOOLKID$5C3D(ERR_SP). Called by BASIC line 4040 as #N($FF64,$04,$04)
. before returning to the editor after a SAVE.
  $FF64,$01 Disable interrupts.
  $FF65,$09 #REGhl=*#SKOOLKID$5C3D(ERR_SP); write #R$FF6F there.
  $FF6E,$01 Return.

c $FF6F Return To BASIC
@ $FF6F label=ReturnToBasic
D $FF6F Continues into the ROM at #SKOOLKID$1B7D(STMT-RET).
  $FF6F,$03 #REGhl=#R$FF6F.
  $FF72,$01 Stash #REGhl on the stack.
  $FF73,$03 Jump to #SKOOLKID$1B7D(STMT-RET).

g $FF76 Temporary Storage
@ $FF76 label=TemporaryStorage_StackPointer
D $FF76 Work space used by the routines above to hold the stack pointer while
. they switch to a temporary stack.
W $FF76,$02 Saved stack pointer.
@ $FF78 label=BasicParameter
D $FF78 BASIC's "par" (#N($FF78,$04,$04)); side 2 also PEEKs #N($FF81,$04,$04)
. from this area.
S $FF78,$0A

i $FF82
