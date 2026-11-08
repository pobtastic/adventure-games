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
D $5CCB The second part is also written in BASIC. The machine code entry points
. it uses are:
D $5CCB #LIST { Line 8: prints "s$" in the 64-column font with #R$FD0E. } { Line
. 19: scrolls a window of the screen with #R$FCA0. } { Lines 26-28: draw
. picture "Z" with #R$C350; numbers above #N$02 draw picture "Z1"-1 into the
. buffer at #R$E000 and show frame "Z2" with #R$FB00. } LIST#
D $5CCB Line 2040 POKEs DI/RET and EI/RET into #R$FC00 and sets the frame layout
. at #R$FB03.
B $5CCB,$0019 Line 2.
B $5CE4,$0006 Line 3.
B $5CEA,$0050 Line 4.
B $5D3A,$0014 Line 5.
B $5D4E,$003A Line 6.
B $5D88,$003A Line 7.
B $5DC2,$0014 Line 8.
B $5DD6,$0024 Line 9.
B $5DFA,$0032 Line 10.
B $5E2C,$000E Line 11.
B $5E3A,$002D Line 15.
B $5E67,$0087 Line 16.
B $5EEE,$002D Line 17.
B $5F1B,$000E Line 18.
B $5F29,$006A Line 19.
B $5F93,$0043 Line 22.
B $5FD6,$0035 Line 23.
B $600B,$006F Line 24.
B $607A,$0019 Line 25.
B $6093,$0049 Line 26.
B $60DC,$009A Line 27.
B $6176,$0030 Line 28.
B $61A6,$001B Line 30.
B $61C1,$0023 Line 40.
B $61E4,$0024 Line 41.
B $6208,$001C Line 42.
B $6224,$0042 Line 43.
B $6266,$002E Line 44.
B $6294,$0063 Line 45.
B $62F7,$000E Line 46.
B $6305,$0051 Line 47.
B $6356,$0033 Line 48.
B $6389,$000E Line 49.
B $6397,$0046 Line 50.
B $63DD,$0030 Line 60.
B $640D,$0037 Line 70.
B $6444,$0030 Line 80.
B $6474,$0018 Line 90.
B $648C,$0017 Line 100.
B $64A3,$0018 Line 110.
B $64BB,$0018 Line 120.
B $64D3,$000E Line 130.
B $64E1,$005E Line 140.
B $653F,$006C Line 150.
B $65AB,$0006 Line 155.
B $65B1,$0011 Line 160.
B $65C2,$002F Line 170.
B $65F1,$0043 Line 180.
B $6634,$003A Line 190.
B $666E,$00B1 Line 200.
B $671F,$0032 Line 210.
B $6751,$0010 Line 215.
B $6761,$001B Line 220.
B $677C,$0024 Line 230.
B $67A0,$001B Line 240.
B $67BB,$001D Line 250.
B $67D8,$002E Line 260.
B $6806,$001A Line 380.
B $6820,$002F Line 390.
B $684F,$0006 Line 400.
B $6855,$002F Line 410.
B $6884,$0006 Line 420.
B $688A,$0034 Line 430.
B $68BE,$0033 Line 440.
B $68F1,$000E Line 450.
B $68FF,$002E Line 460.
B $692D,$002D Line 470.
B $695A,$002E Line 480.
B $6988,$002E Line 490.
B $69B6,$002E Line 500.
B $69E4,$002E Line 510.
B $6A12,$0034 Line 520.
B $6A46,$0072 Line 530.
B $6AB8,$0065 Line 540.
B $6B1D,$0066 Line 550.
B $6B83,$002E Line 560.
B $6BB1,$0064 Line 570.
B $6C15,$004E Line 580.
B $6C63,$0066 Line 590.
B $6CC9,$0065 Line 600.
B $6D2E,$005C Line 610.
B $6D8A,$000F Line 615.
B $6D99,$006E Line 620.
B $6E07,$0079 Line 630.
B $6E80,$000F Line 635.
B $6E8F,$002C Line 640.
B $6EBB,$00E4 Line 650.
B $6F9F,$00DA Line 660.
B $7079,$00D9 Line 670.
B $7152,$00B5 Line 680.
B $7207,$002D Line 690.
B $7234,$0039 Line 691.
B $726D,$003A Line 692.
B $72A7,$003E Line 695.
B $72E5,$00CA Line 700.
B $73AF,$00D5 Line 710.
B $7484,$00CE Line 720.
B $7552,$000F Line 725.
B $7561,$00A3 Line 730.
B $7604,$000F Line 735.
B $7613,$0067 Line 740.
B $767A,$000F Line 745.
B $7689,$0065 Line 750.
B $76EE,$002B Line 760.
B $7719,$001C Line 770.
B $7735,$00F5 Line 780.
B $782A,$007E Line 790.
B $78A8,$007E Line 800.
B $7926,$008C Line 810.
B $79B2,$008B Line 820.
B $7A3D,$0042 Line 830.
B $7A7F,$0061 Line 835.
B $7AE0,$0026 Line 837.
B $7B06,$007C Line 840.
B $7B82,$007D Line 850.
B $7BFF,$0043 Line 860.
B $7C42,$0079 Line 864.
B $7CBB,$0026 Line 866.
B $7CE1,$004F Line 870.
B $7D30,$0062 Line 875.
B $7D92,$0026 Line 877.
B $7DB8,$0041 Line 880.
B $7DF9,$0061 Line 885.
B $7E5A,$0026 Line 887.
B $7E80,$002E Line 890.
B $7EAE,$003F Line 900.
B $7EED,$0056 Line 910.
B $7F43,$0034 Line 920.
B $7F77,$0022 Line 930.
B $7F99,$0013 Line 940.
B $7FAC,$0007 Line 950.
B $7FB3,$001C Line 960.
B $7FCF,$0042 Line 970.
B $8011,$007D Line 980.
B $808E,$000E Line 982.
B $809C,$0032 Line 985.
B $80CE,$000F Line 986.
B $80DD,$0030 Line 990.
B $810D,$003C Line 1000.
B $8149,$003A Line 1005.
B $8183,$002F Line 1010.
B $81B2,$002F Line 1020.
B $81E1,$0055 Line 1030.
B $8236,$001A Line 1040.
B $8250,$0029 Line 1050.
B $8279,$00AD Line 1060.
B $8326,$003A Line 1070.
B $8360,$0039 Line 1080.
B $8399,$0039 Line 1090.
B $83D2,$0039 Line 1100.
B $840B,$0039 Line 1110.
B $8444,$0039 Line 1120.
B $847D,$0038 Line 1130.
B $84B5,$0038 Line 1140.
B $84ED,$0039 Line 1150.
B $8526,$003A Line 1160.
B $8560,$0010 Line 1170.
B $8570,$004C Line 1180.
B $85BC,$004D Line 1190.
B $8609,$0032 Line 1200.
B $863B,$0010 Line 1205.
B $864B,$0083 Line 1210.
B $86CE,$0039 Line 1220.
B $8707,$0006 Line 1225.
B $870D,$004F Line 1230.
B $875C,$0032 Line 1240.
B $878E,$0010 Line 1245.
B $879E,$009D Line 1250.
B $883B,$008C Line 1260.
B $88C7,$004F Line 1265.
B $8916,$008D Line 1270.
B $89A3,$008E Line 1280.
B $8A31,$001D Line 1290.
B $8A4E,$001D Line 1300.
B $8A6B,$0019 Line 1305.
B $8A84,$0010 Line 1307.
B $8A94,$003F Line 1310.
B $8AD3,$0010 Line 1320.
B $8AE3,$002E Line 1325.
B $8B11,$007F Line 1330.
B $8B90,$0052 Line 1340.
B $8BE2,$0062 Line 1350.
B $8C44,$0010 Line 1355.
B $8C54,$00ED Line 1360.
B $8D41,$0086 Line 1370.
B $8DC7,$00A7 Line 1380.
B $8E6E,$0095 Line 1390.
B $8F03,$0010 Line 1395.
B $8F13,$009E Line 1400.
B $8FB1,$0046 Line 1410.
B $8FF7,$009D Line 1420.
B $9094,$0071 Line 1430.
B $9105,$0039 Line 1435.
B $913E,$00FD Line 1440.
B $923B,$0056 Line 1450.
B $9291,$004F Line 1460.
B $92E0,$0062 Line 1470.
B $9342,$00E8 Line 1480.
B $942A,$0092 Line 1490.
B $94BC,$008E Line 1500.
B $954A,$0095 Line 1510.
B $95DF,$00C5 Line 1520.
B $96A4,$012C Line 1530.
B $97D0,$00BF Line 1540.
B $988F,$0066 Line 1550.
B $98F5,$0140 Line 1560.
B $9A35,$0031 Line 1570.
B $9A66,$00E8 Line 1580.
B $9B4E,$0083 Line 1590.
B $9BD1,$00DE Line 1600.
B $9CAF,$00B9 Line 1610.
B $9D68,$011B Line 1620.
B $9E83,$007D Line 1630.
B $9F00,$00E6 Line 1640.
B $9FE6,$00D6 Line 1650.
B $A0BC,$00E3 Line 1660.
B $A19F,$0058 Line 1670.
B $A1F7,$0102 Line 1680.
B $A2F9,$0077 Line 1690.
B $A370,$0103 Line 1700.
B $A473,$00A4 Line 1710.
B $A517,$00EF Line 1720.
B $A606,$00D8 Line 1730.
B $A6DE,$00C9 Line 1740.
B $A7A7,$001C Line 1750.
B $A7C3,$008B Line 1760.
B $A84E,$0019 Line 1770.
B $A867,$00B9 Line 1780.
B $A920,$00D0 Line 1790.
B $A9F0,$00B4 Line 1800.
B $AAA4,$00FF Line 1810.
B $ABA3,$0098 Line 1820.
B $AC3B,$00F6 Line 1830.
B $AD31,$002E Line 1840.
B $AD5F,$00EC Line 1850.
B $AE4B,$0060 Line 1860.
B $AEAB,$0105 Line 1870.
B $AFB0,$009F Line 1880.
B $B04F,$00ED Line 1890.
B $B13C,$00E8 Line 1900.
B $B224,$001D Line 1910.
B $B241,$00E1 Line 1920.
B $B322,$00F1 Line 1930.
B $B413,$00F8 Line 1940.
B $B50B,$00E9 Line 1950.
B $B5F4,$0006 Line 2000.
B $B5FA,$0146 Line 2010.
B $B740,$0033 Line 2020.
B $B773,$001E Line 2030.
B $B791,$00CB Line 2040.
B $B85C,$0006 Line 2050.
B $B862,$0015 Line 2100.
B $B877,$0017 Line 2110.
B $B88E,$0024 Line 2120.
B $B8B2,$0022 Line 2130.
B $B8D4,$003C Line 2140.
B $B910,$001D Line 2200.
B $B92D,$006A Line 2300.
B $B997,$0033 Line 3000.
B $B9CA,$0091 Line 7000.

b $BA5B BASIC Variables
@ $BA5B label=BasicVariables
D $BA5B The BASIC variables, up to #SKOOLKID$5C59(E_LINE).
B $BA5B,$01A6,$10
B $BC01,$01 End marker.

b $BC02 Edit Line
@ $BC02 label=EditLine
D $BC02 The current BASIC edit line, from #SKOOLKID$5C59(E_LINE) up to
. #SKOOLKID$5C61(WORKSP).
B $BC02,$05

b $BC07 Workspace
@ $BC07 label=Workspace
D $BC07 Bytes from #SKOOLKID$5C61(WORKSP) to #SKOOLKID$5C63(STKBOT).
B $BC07,$0022,$10

u $BC29 Unused
D $BC29 Free memory between #SKOOLKID$5C65(STKEND) and the machine stack.
B $BC29,$0001,$10
S $BC2A,$06F4
B $C31E,$002A,$10

b $C348 Machine Stack
@ $C348 label=MachineStack
D $C348 The machine stack and the GO SUB stack, from the stack pointer up to
. #SKOOLKID$5CB2(RAMTOP).
B $C348,$08,$02

c $C350 Draw Picture
@ $C350 label=DrawPicture
D $C350 Used by the BASIC program. Draws picture number *#R$C352 from the
. picture list that starts at #R$C47C. The picture goes to the screen, or to a
. buffer when BASIC has POKEd the high bytes used by the instructions at
. #R$C3CA (pixels) and #R$C413 (attributes).
D $C350 Each picture record is laid out as follows:
. #TABLE(default,centre,centre,centre)
. { =h Offset | =h Bytes | =h Contents }
. { #N$00 | #N$02 | The length of the record, less one }
. { #N$02 | #N$01 | The screen third to start at }
. { #N$03 | #N$01 | The number of thirds to draw }
. { #N$04 | #N$01 | Flags; see #R$C355 }
. { #N$05 | Varies | Pixel data, then attribute data }
. TABLE#
D $C350 Both lots of data are run-length encoded. A non-zero byte is written
. as it is. A zero byte is followed by a count and a value, and the value is
. written that many times (a count of zero writes it 256 times).
D $C350 When bit 0 of the flags is clear, the pixel data is in column order:
. each column is written from the top of the picture to the bottom, one byte
. for each pixel line, and then the next column to the right follows. When
. bit 0 is set, the pixel data is in row order: each pixel line is written
. from left to right, from the top of the picture to the bottom. The
. attribute data is always in the same order as the attribute file.
D $C350 The routine works out its own address as it runs, so the same code
. works in both parts of the game.
E $C350 View the equivalent code in;
. #LIST
. { #VERACRUZ$8000(Vera Cruz: Part 1) }
. LIST#
  $C350,$02 Jump over the parameters to #R$C356.

g $C352 Draw Picture Parameters
@ $C352 label=DrawPicture_Number
D $C352 Parameters for #R$C350, read and written through #REGiy. BASIC only
. POKEs the picture number here; *#R$C353 and *#R$C354
. are always #N$FF in the snapshot, so the routine takes the screen third and
. the number of thirds from the picture record.
D $C352 The flags at #R$C355:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Pixel data order (set: rows; clear: columns) }
. { #N$02 | Set while a run of repeated bytes is being written }
. { #N$03 | Set while the attributes are being drawn }
. TABLE#
E $C352 View the equivalent code in;
. #LIST
. { #VERACRUZ$8002(Vera Cruz: Part 1) }
. LIST#
@ $C353 label=DrawPicture_Third
@ $C354 label=DrawPicture_Thirds
@ $C355 label=DrawPicture_Flags
B $C352,$01 Picture number (#N$01 for the first picture in the list).
B $C353,$01 Screen third to start at, from #N$00 (top) to #N$02 (bottom).
. #N$FF means use the value in the picture record.
B $C354,$01 Number of thirds to draw, from #N$01 to #N$03. #N$FF means use the
. value in the picture record.
B $C355,$01 Flags, copied from the picture record.

c $C356 Draw Picture: Unpack
@ $C356 label=DrawPicture_Unpack
D $C356 Continues from #R$C350.
E $C356 View the equivalent code in;
. #LIST
. { #VERACRUZ$8006(Vera Cruz: Part 1) }
. LIST#
N $C356 Find out where this code is in memory. The call leaves its return
. address (#R$C359) just below the stack pointer. An interrupt at this point
. would overwrite it, so BASIC calls #R$FC00 first and #R$FC02 afterwards.
  $C356,$03 Call the RET instruction at #N($007C,$04,$04), at the end of
. #SKOOLKID$0074,$007C(CH_ADD+1), which returns straight away.
@ $C359 label=DrawPicture_ReturnAddress
  $C359,$02 Move the stack pointer back down to the return address.
  $C35B,$01 Swap it into #REGhl, so #REGhl=#R$C359.
  $C35C,$02 Move the stack pointer back up again.
  $C35E,$01 Clear the carry flag ready for the subtraction.
  $C35F,$05 #REGhl=#R$C352 (#R$C359 less #N($0007,$04,$04)).
  $C364,$01 Stash the address of the parameters on the stack.
  $C365,$02 Restore the address of the parameters from the stack into #REGiy.
  $C367,$04 #REGhl=#R$C47C (#R$C352 plus #N($012A,$04,$04)), the first picture
. record.
  $C36B,$03 #REGa=the picture number from *#R$C352.
N $C36E Skip over the records before the requested picture.
@ $C36E label=DrawPicture_FindPicture
  $C36E,$01 Decrease the picture number by one.
  $C36F,$02 Jump to #R$C377 if #REGhl points to the requested picture.
  $C371,$03 #REGde=the length of this record, less one.
  $C374,$01 Add it to #REGhl, so #REGhl points to the next record.
  $C375,$02 Jump to #R$C36E.
@ $C377 label=DrawPicture_Found
  $C377,$03 #REGde=#N($4000,$04,$04). This value is never used, as #REGd and
. #REGe are both set again before they are needed.
  $C37A,$02 Move #REGhl past the length, to the record's screen third.
  $C37C,$03 #REGa=*#R$C353.
  $C37F,$01 Increment #REGa by one, so that #N$FF becomes zero.
  $C380,$02 Jump to #R$C386 if *#R$C353 is not #N$FF.
  $C382,$04 Else write the record's screen third to *#R$C353.
  $C386,$01 Move on to the record's number of thirds.
  $C387,$03 #REGa=*#R$C354.
  $C38A,$01 Increment #REGa by one, so that #N$FF becomes zero.
  $C38B,$02 Jump to #R$C391 if *#R$C354 is not #N$FF.
  $C38D,$04 Else write the record's number of thirds to *#R$C354.
  $C391,$01 Move on to the record's flags.
  $C392,$04 Copy the record's flags to *#R$C355.
N $C396 Make sure the picture fits on the screen.
  $C396,$03 #REGa=*#R$C353.
  $C399,$04 Jump to #R$C3A1 if the screen third is less than #N$03.
  $C39D,$04 Else start at the top third (write #N$00 to *#R$C353).
  $C3A1,$03 #REGa=*#R$C354.
  $C3A4,$04 Jump to #R$C3AC if the number of thirds is less than #N$04.
  $C3A8,$04 Else draw one third (write #N$01 to *#R$C354).
  $C3AC,$03 Add the screen third to #REGa. #REGa still holds the number of
. thirds read at #R$C3A1, even when it has just been changed.
  $C3AF,$04 Jump to #R$C3B7 if the picture ends on the screen (the total is
. less than #N$04).
  $C3B3,$04 Else draw one third (write #N$01 to *#R$C354).
  $C3B7,$03 #REGa=*#R$C354.
  $C3BA,$03 Jump to #R$C3C1 if the number of thirds is not zero.
  $C3BD,$04 Else draw one third (write #N$01 to *#R$C354).
N $C3C1 Draw the pixels.
@ $C3C1 label=DrawPicture_Pixels
  $C3C1,$01 Move #REGhl on to the start of the picture data.
  $C3C2,$02 #REGe=#N$00 (the left-hand column).
  $C3C4,$03 #REGa=*#R$C353.
  $C3C7,$03 Multiply it by #N$08, as each third of the screen is #N$08 pages
. long.
@ $C3CA label=DrawPicture_PixelsHighByte
  $C3CA,$02 Add the high byte of the start of the screen (#N$40). BASIC POKEs
. this byte to draw into a buffer instead.
  $C3CC,$02 Set #REGd and #REGc to the high byte of the top pixel line of the
. picture, so #REGde holds its screen address.
  $C3CE,$02 #REGb=#N$01 (one pass, for row order).
  $C3D0,$06 Jump to #R$C3D8 if bit 0 of *#R$C355 is set (row order).
  $C3D6,$02 Else #REGb=#N$20 (one pass for each column).
@ $C3D8 label=DrawPicture_PassLoop
  $C3D8,$01 Stash the pass counter on the stack.
  $C3D9,$03 #REGb=the number of thirds from *#R$C354.
@ $C3DC label=DrawPicture_ThirdLoop
  $C3DC,$01 Stash the thirds counter on the stack.
  $C3DD,$02 #REGb=#N$08 (character rows in a third).
@ $C3DF label=DrawPicture_RowLoop
  $C3DF,$01 Stash the character row counter on the stack.
  $C3E0,$02 #REGb=#N$08 (pixel lines in a character row).
@ $C3E2 label=DrawPicture_LineLoop
  $C3E2,$01 Stash the pixel line counter on the stack.
  $C3E3,$02 #REGb=#N$01 (one byte, for column order).
  $C3E5,$06 Jump to #R$C3ED if bit 0 of *#R$C355 is clear (column order).
  $C3EB,$02 Else #REGb=#N$20 (a whole pixel line, for row order).
  $C3ED,$01 Stash the screen address of this pixel line on the stack.
@ $C3EE label=DrawPicture_ByteLoop
  $C3EE,$01 Stash the byte counter on the stack.
  $C3EF,$02 Jump to #R$C434 to write the next byte; it comes back to #R$C3F1.
@ $C3F1 label=DrawPicture_NextByte
  $C3F1,$01 Restore the byte counter from the stack.
  $C3F2,$01 Move right to the next screen byte.
  $C3F3,$02 Decrease the byte counter by one and loop back to #R$C3EE until
. it is zero.
  $C3F5,$01 Restore the screen address of this pixel line from the stack.
  $C3F6,$01 Restore the pixel line counter from the stack.
  $C3F7,$01 Move down to the next pixel line.
  $C3F8,$02 Decrease the pixel line counter by one and loop back to #R$C3E2
. until all #N$08 pixel lines are done.
  $C3FA,$04 Move #REGd back up to the top pixel line of this character row
. (subtract #N$08).
  $C3FE,$04 Move down to the next character row (add #N$20 to #REGe).
  $C402,$01 Restore the character row counter from the stack.
  $C403,$02 Decrease the character row counter by one and loop back to
. #R$C3DF until all #N$08 character rows are done.
  $C405,$04 Move down to the next third (add #N$08 to #REGd). #REGe has gone
. back round to the same column.
  $C409,$01 Restore the thirds counter from the stack.
  $C40A,$02 Decrease the thirds counter by one and loop back to #R$C3DC until
. all the thirds are done.
  $C40C,$01 Move #REGd back up to the top of the picture (#REGd=#REGc).
  $C40D,$01 Move right to the next column.
  $C40E,$01 Restore the pass counter from the stack.
  $C40F,$02 Decrease the pass counter by one and loop back to #R$C3D8 until
. all the passes are done.
N $C411 Draw the attributes.
@ $C411 label=DrawPicture_Attributes
  $C411,$02 #REGe=#N$00.
@ $C413 label=DrawPicture_AttributesHighByte
  $C413,$02 #REGa=#N$58, the high byte of the start of the attribute file.
. BASIC POKEs this byte to draw into a buffer instead.
  $C415,$03 Add the screen third.
  $C418,$01 #REGd=#REGa, so #REGde holds the address of the first attribute
. of the picture.
  $C419,$04 #REGbc=the number of attributes to draw: 256 for each third
. (#REGb=*#R$C354 and #REGc=#N$00).
  $C41D,$04 Set bit 3 of *#R$C355, so that #R$C434 comes back to #R$C424.
@ $C421 label=DrawPicture_AttributesLoop
  $C421,$01 Stash the attribute counter on the stack.
  $C422,$02 Jump to #R$C434 to write the next attribute; it comes back to
. #R$C424.
@ $C424 label=DrawPicture_NextAttribute
  $C424,$01 Restore the attribute counter from the stack.
  $C425,$01 Decrease the attribute counter by one.
  $C426,$01 Move on to the next attribute.
  $C427,$04 Jump back to #R$C421 until the attribute counter is zero.
  $C42B,$08 Write #N$FF to *#R$C353 and *#R$C354. BASIC never POKEs these
. bytes, so the next picture again takes its screen third and number of
. thirds from its own record.
  $C433,$01 Return.
N $C434 Write the next byte of picture data to *#REGde. While a run of
. repeated bytes is being written, bit 2 of *#R$C355 is set, #REGb' holds the
. count and #REGc' holds the value.
@ $C434 label=DrawPicture_FetchByte
  $C434,$06 Jump to #R$C447 if no run is in progress.
  $C43A,$01 Switch to the shadow registers.
  $C43B,$01 Decrease the run count in #REGb' by one.
  $C43C,$01 #REGa=the run value from #REGc'.
  $C43D,$01 Switch back to the normal registers.
  $C43E,$02 Jump to #R$C443 if the run has finished.
  $C440,$01 Write the run value to *#REGde.
  $C441,$02 Jump to #R$C45B.
@ $C443 label=DrawPicture_EndRun
  $C443,$04 Clear bit 2 of *#R$C355, as the run has finished.
@ $C447 label=DrawPicture_ReadByte
  $C447,$02 #REGa=the next byte of picture data, and move #REGhl on.
  $C449,$03 Jump to #R$C45A if it is not zero, to write it as it is.
  $C44C,$04 A zero byte starts a run. #REGb'=the count.
  $C450,$01 Move #REGhl on to the value.
  $C451,$04 #REGc'=the value (#REGa holds it too).
  $C455,$01 Move #REGhl on to the next byte of picture data.
  $C456,$04 Set bit 2 of *#R$C355, as a run is in progress.
@ $C45A label=DrawPicture_WriteByte
  $C45A,$01 Write the byte to *#REGde.
@ $C45B label=DrawPicture_Continue
  $C45B,$06 Jump back to #R$C424 if the attributes are being drawn.
  $C461,$02 Else jump back to #R$C3F1.

u $C463 Unused
D $C463 These bytes follow the picture routine; nothing reads them.
B $C463,$19,$10

b $C47C Graphics: Department Of National Police
@ $C47C label=Graphics_DepartmentOfNationalPolice
D $C47C The main screen, drawn straight to the screen when "Z" is #N$01.
. Line 900 prints "Department of NATIONAL POLICE" into the bar along its
. bottom edge.
D $C47C #PUSHS #POKES$C352,$01
. #UDGTABLE
. { =h Department Of National Police }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(department-of-national-police) }
. UDGTABLE#
. #POPS
W $C47C,$02 Length of this record, less one (#N($0124,$04,$04)); the next
. record starts at #R$C5A1.
B $C47E,$01 Screen third to start at (#N$00).
B $C47F,$01 Number of thirds to draw (#N$03).
B $C480,$01 Flags (#N$01): bit 0 is set, so the pixel data is in row order.
@ $C481 label=Graphics_DepartmentOfNationalPolice_Pixels
B $C481,$0111,$10 Compressed pixel data.
@ $C592 label=Graphics_DepartmentOfNationalPolice_Attributes
B $C592,$000C,$10 Compressed attribute data.
B $C59E,$03 Never read: the attributes are complete before these bytes.

b $C5A1 Graphics: Diamond Computer Network
@ $C5A1 label=Graphics_DiamondComputerNetwork
D $C5A1 The computer terminal for the Diamond Network, drawn straight to the
. screen when "Z" is #N$02 (line 50, reached by pressing "M"). The name comes
. from the instructions ("Code M (Message)", "the DIAMOND COMPUTER NETWORK").
D $C5A1 #PUSHS #POKES$C352,$02
. #UDGTABLE
. { =h Diamond Computer Network }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(diamond-computer-network) }
. UDGTABLE#
. #POPS
W $C5A1,$02 Length of this record, less one (#N($03DC,$04,$04)); the next
. record starts at #R$C97E.
B $C5A3,$01 Screen third to start at (#N$00).
B $C5A4,$01 Number of thirds to draw (#N$03).
B $C5A5,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $C5A6 label=Graphics_DiamondComputerNetwork_Pixels
B $C5A6,$03B4,$10 Compressed pixel data.
@ $C95A label=Graphics_DiamondComputerNetwork_Attributes
B $C95A,$0021,$10 Compressed attribute data.
B $C97B,$03 Never read: the attributes are complete before these bytes.

b $C97E Graphics: Portraits 1
@ $C97E label=Graphics_Portraits1
D $C97E Eight portraits, shown by frame when "Z" is #N$29-#N$30. Each is named
. by the text the game prints with it:
. #LIST
. { Frame #N$01: Nadine LAFEUILLE (line 790) }
. { Frame #N$02: Eva DELARUE (lines 700 and 850) }
. { Frame #N$03: Simone DUPLAT, the caretaker (line 820) }
. { Frame #N$04: Hubert DELROCHE (line 800) }
. { Frame #N$05: Philibert ZIEGLER, known as "Gypsy" (lines 660 and 835) }
. { Frame #N$06: Abdoulah HOCINE, known as "Fuzzy" (lines 650 and 840) }
. { Frame #N$07: Nestor MARTIN (line 810) }
. { Frame #N$08: Stanislas KOWALSKI (lines 670 and 885) }
. LIST#
D $C97E #PUSHS #POKES$C352,$03
. #UDGTABLE
. { =h Portraits 1 }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(portraits-1) }
. UDGTABLE#
. #POPS
W $C97E,$02 Length of this record, less one (#N($0D48,$04,$04)); the next
. record starts at #R$D6C7.
B $C980,$01 Screen third to start at (#N$00).
B $C981,$01 Number of thirds to draw (#N$03).
B $C982,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $C983 label=Graphics_Portraits1_Pixels
B $C983,$0CBD,$10 Compressed pixel data.
@ $D640 label=Graphics_Portraits1_Attributes
B $D640,$0084,$10 Compressed attribute data.
B $D6C4,$03 Never read: the attributes are complete before these bytes.

b $D6C7 Graphics: Portraits 2
@ $D6C7 label=Graphics_Portraits2
D $D6C7 Three portraits and five empty frames, shown by frame when "Z" is
. #N$33-#N$35. Each is named by the text the game prints with it:
. #LIST
. { Frame #N$01: Philippe BLANC (lines 720 and 875) }
. { Frame #N$02: Gilles BLANC (lines 680 and 864) }
. { Frame #N$03: Vera CRUZ (line 710) }
. LIST#
D $D6C7 #PUSHS #POKES$C352,$04
. #UDGTABLE
. { =h Portraits 2 }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(portraits-2) }
. UDGTABLE#
. #POPS
W $D6C7,$02 Length of this record, less one (#N($0549,$04,$04)). This is the
. last record in the list.
B $D6C9,$01 Screen third to start at (#N$00).
B $D6CA,$01 Number of thirds to draw (#N$03).
B $D6CB,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $D6CC label=Graphics_Portraits2_Pixels
B $D6CC,$0536,$10 Compressed pixel data.
@ $DC02 label=Graphics_Portraits2_Attributes
B $DC02,$000C,$10 Compressed attribute data.
B $DC0E,$03 Never read: the attributes are complete before these bytes.

u $DC11 Last Byte Of Code Block
D $DC11 The last byte loaded from tape; it is not part of any picture record.
S $DC11,$01

u $DC12 Unused
S $DC12,$03EE

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
D $FB00 The values in the snapshot describe rows of #N$04 frames of #N$07 by
. #N$0A characters after line 2040, copied to column #N$18, row #N$02.
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

b $FC00 Interrupt Switches
@ $FC00 label=DisableInterrupts
D $FC00 Zero in the snapshot. Line 2040 POKEs two routines here: DI, RET at
. #R$FC00 and EI, RET at #R$FC02. Line 28 calls them either side of
. #R$C350.
S $FC00,$02
@ $FC02 label=EnableInterrupts
S $FC02,$02

u $FC04 Unused
S $FC04,$009C

c $FCA0 Scroll Window
@ $FCA0 label=ScrollWindow
D $FCA0 Scrolls a window of the screen up one pixel line at a time, filling the
. bottom line with the byte at #R$FCA7. Line 19 POKEs the parameters
. before calling it.
  $FCA0,$02 Jump to #R$FCA8.

g $FCA2 Scroll Window Parameters
@ $FCA2 label=ScrollWindow_Count
D $FCA2 Parameters for #R$FCA0.
@ $FCA3 label=ScrollWindow_Left
@ $FCA4 label=ScrollWindow_Top
@ $FCA5 label=ScrollWindow_Right
@ $FCA6 label=ScrollWindow_Bottom
@ $FCA7 label=ScrollWindow_Fill
B $FCA2,$01 Number of pixel lines to scroll.
B $FCA3,$01 Left column.
B $FCA4,$01 Top pixel line.
B $FCA5,$01 Right column.
B $FCA6,$01 Bottom pixel line.
B $FCA7,$01 Fill byte.

c $FCA8 Scroll Window: Scroll
@ $FCA8 label=ScrollWindow_Scroll
D $FCA8 Continues from #R$FCA0.

c $FCDE Scroll Window: Screen Address
@ $FCDE label=ScrollWindow_ScreenAddress
D $FCDE Returns the screen address of pixel line #REGc, column #REGb.
R $FCDE B Column
R $FCDE C Pixel line
R $FCDE O:HL Screen address

c $FCF4 Scroll Window: Next Pixel Line
@ $FCF4 label=ScrollWindow_NextLine
D $FCF4 Moves #REGhl down one pixel line on the screen.
R $FCF4 HL Screen address

c $FD03 Scroll Window: Fill Bottom Line
@ $FD03 label=ScrollWindow_FillLine
D $FD03 Fills the bottom pixel line of the window with the byte at #R$FCA7.

c $FD0E Print String
@ $FD0E label=PrintString
D $FD0E Prints the BASIC string "s$" at the current print position in a
. 64-column font. It finds the string with the ROM routine
. #SKOOLKID$28B2(LOOK-VARS), using the name at #R$FD94, and stops with an
. error if it is missing. Codes below #N$20 go straight to RST #N$10;
. codes from #N$90 upwards are skipped.
B $FD2C,$01 Error code for the RST #N$08 above.

c $FD56 Print String: Print Character
@ $FD56 label=PrintString_Character
D $FD56 Builds two 4-pixel characters side by side in the UDG for "U" (graphic
. code #N$A4) from the font at #R$FD98, and prints that UDG after every
. second character. The flag at #R$FD97 records whether a half is waiting.
R $FD56 A Character code

b $FD94 Print String Data
@ $FD94 label=PrintString_VariableName
@ $FD97 label=PrintString_HalfFlag
D $FD94 Data used by #R$FD0E.
T $FD94,$03 Name of the string variable to print ("S$", then a space).
B $FD97,$01 Half-character flag.

b $FD98 Font
@ $FD98 label=Font
D $FD98 The 4x8 font used by #R$FD0E for character codes #N$20 to #N$8F. Each
. character is four bytes, each byte holding two pixel rows in its two
. nibbles.
B $FD98,$01C0,$04

i $FF58
