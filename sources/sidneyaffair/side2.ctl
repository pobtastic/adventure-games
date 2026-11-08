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
b $4000 Terminal Picture
D $4000 The terminal picture drawn by side 1. On a real machine side 1 also
. prints the title text over it; only this snapshot lacks that text.
D $4000 #UDGTABLE { =h Terminal Picture. }
. { #SCR$02(terminal) } UDGTABLE#
@ $4000 label=Terminal
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

i $5B00
i $5C00

b $5CCB BASIC Program
@ $5CCB label=BasicProgram
D $5CCB The second side is also written in BASIC. The machine code entry points
. it uses are:
D $5CCB #LIST {
. Line 3010: sets "ins" (#N($FB09,$04,$04)), "noi" (#N($FBC7,$04,$04)),
. "scr" (#N($FBFE,$04,$04)), "prn" (#N($FC86,$04,$04)), "iof"
. (#N($FF53,$04,$04)), "ion" (#N($FF55,$04,$04)) and "ist"
. (#N($FEC9,$04,$04)); those routines are loaded with side 1 and are zero
. in this snapshot. } { Lines 80-89: draw picture "z" with #R$C350, or draw
. picture "z1" into the buffer at #R$E000 and show frame "z2" with "ins". } {
. Line 8: prints "s$" with "prn". } { Lines 530 and 570: scroll and noise
. with "scr" and "noi". } LIST#
D $5CCB There is no BASIC loader on the side 2 tape; side 1 loads the two CODE
. blocks (see side 1 lines 18-28).
B $5CCB,$0023 Line 1.
B $5CEE,$001A Line 3.
B $5D08,$000C Line 8.
B $5D14,$001B Line 10.
B $5D2F,$0025 Line 12.
B $5D54,$007E Line 14.
B $5DD2,$0038 Line 15.
B $5E0A,$0024 Line 20.
B $5E2E,$0036 Line 21.
B $5E64,$003E Line 22.
B $5EA2,$0057 Line 23.
B $5EF9,$0024 Line 24.
B $5F1D,$004D Line 25.
B $5F6A,$0015 Line 27.
B $5F7F,$003A Line 28.
B $5FB9,$0006 Line 29.
B $5FBF,$0028 Line 30.
B $5FE7,$0066 Line 60.
B $604D,$001F Line 62.
B $606C,$002B Line 64.
B $6097,$001F Line 66.
B $60B6,$009B Line 68.
B $6151,$001B Line 70.
B $616C,$0019 Line 80.
B $6185,$0049 Line 82.
B $61CE,$003B Line 84.
B $6209,$0053 Line 86.
B $625C,$001C Line 88.
B $6278,$001A Line 89.
B $6292,$0025 Line 100.
B $62B7,$0032 Line 110.
B $62E9,$0027 Line 115.
B $6310,$003C Line 117.
B $634C,$000F Line 120.
B $635B,$0037 Line 125.
B $6392,$003E Line 130.
B $63D0,$0022 Line 140.
B $63F2,$0023 Line 150.
B $6415,$0017 Line 160.
B $642C,$0023 Line 170.
B $644F,$0023 Line 180.
B $6472,$000F Line 190.
B $6481,$006B Line 280.
B $64EC,$006F Line 290.
B $655B,$0011 Line 300.
B $656C,$002F Line 310.
B $659B,$0041 Line 320.
B $65DC,$003A Line 330.
B $6616,$00AE Line 340.
B $66C4,$0033 Line 350.
B $66F7,$001B Line 370.
B $6712,$0025 Line 380.
B $6737,$001B Line 390.
B $6752,$001D Line 400.
B $676F,$002E Line 410.
B $679D,$002D Line 510.
B $67CA,$0043 Line 520.
B $680D,$003F Line 530.
B $684C,$0013 Line 532.
B $685F,$0053 Line 535.
B $68B2,$0006 Line 537.
B $68B8,$0035 Line 540.
B $68ED,$0023 Line 570.
B $6910,$0012 Line 590.
B $6922,$0024 Line 600.
B $6946,$0038 Line 610.
B $697E,$0024 Line 620.
B $69A2,$0024 Line 630.
B $69C6,$0029 Line 640.
B $69EF,$0050 Line 650.
B $6A3F,$0023 Line 660.
B $6A62,$0032 Line 670.
B $6A94,$0021 Line 675.
B $6AB5,$0059 Line 680.
B $6B0E,$0063 Line 690.
B $6B71,$0024 Line 700.
B $6B95,$00CC Line 710.
B $6C61,$0050 Line 720.
B $6CB1,$000F Line 725.
B $6CC0,$0058 Line 730.
B $6D18,$0018 Line 740.
B $6D30,$002F Line 750.
B $6D5F,$0016 Line 755.
B $6D75,$0010 Line 758.
B $6D85,$000F Line 760.
B $6D94,$0010 Line 765.
B $6DA4,$001D Line 770.
B $6DC1,$0028 Line 780.
B $6DE9,$0016 Line 790.
B $6DFF,$0017 Line 795.
B $6E16,$0010 Line 800.
B $6E26,$0010 Line 805.
B $6E36,$001D Line 810.
B $6E53,$0028 Line 820.
B $6E7B,$000C Line 830.
B $6E87,$0090 Line 840.
B $6F17,$0083 Line 850.
B $6F9A,$0049 Line 860.
B $6FE3,$0026 Line 865.
B $7009,$0035 Line 870.
B $703E,$0028 Line 880.
B $7066,$004C Line 890.
B $70B2,$0032 Line 900.
B $70E4,$0029 Line 910.
B $710D,$0028 Line 920.
B $7135,$0062 Line 940.
B $7197,$0026 Line 945.
B $71BD,$0034 Line 950.
B $71F1,$0036 Line 960.
B $7227,$0028 Line 970.
B $724F,$0028 Line 980.
B $7277,$0028 Line 990.
B $729F,$001C Line 1000.
B $72BB,$0063 Line 1010.
B $731E,$0027 Line 1015.
B $7345,$0034 Line 1020.
B $7379,$003F Line 1030.
B $73B8,$0033 Line 1040.
B $73EB,$001C Line 1050.
B $7407,$004F Line 1060.
B $7456,$0026 Line 1065.
B $747C,$005B Line 1070.
B $74D7,$005A Line 1080.
B $7531,$0035 Line 1090.
B $7566,$0036 Line 1100.
B $759C,$0035 Line 1110.
B $75D1,$0035 Line 1120.
B $7606,$001C Line 1130.
B $7622,$0039 Line 1140.
B $765B,$0026 Line 1145.
B $7681,$0034 Line 1150.
B $76B5,$0028 Line 1160.
B $76DD,$004E Line 1170.
B $772B,$0026 Line 1175.
B $7751,$0034 Line 1180.
B $7785,$0035 Line 1190.
B $77BA,$0035 Line 1200.
B $77EF,$001C Line 1210.
B $780B,$005A Line 1220.
B $7865,$0026 Line 1225.
B $788B,$001D Line 1230.
B $78A8,$0034 Line 1235.
B $78DC,$001D Line 1240.
B $78F9,$0034 Line 1245.
B $792D,$0034 Line 1250.
B $7961,$0035 Line 1260.
B $7996,$0029 Line 1270.
B $79BF,$0029 Line 1280.
B $79E8,$001C Line 1290.
B $7A04,$0063 Line 1300.
B $7A67,$0026 Line 1305.
B $7A8D,$003F Line 1310.
B $7ACC,$0028 Line 1320.
B $7AF4,$004E Line 1330.
B $7B42,$0041 Line 1335.
B $7B83,$0028 Line 1340.
B $7BAB,$000F Line 1345.
B $7BBA,$0006 Line 1350.
B $7BC0,$0036 Line 1360.
B $7BF6,$0055 Line 1370.
B $7C4B,$0035 Line 1380.
B $7C80,$0008 Line 1390.
B $7C88,$000C Line 1391.
B $7C94,$0023 Line 1392.
B $7CB7,$0049 Line 1396.
B $7D00,$000B Line 1400.
B $7D0B,$002D Line 1401.
B $7D38,$0022 Line 1402.
B $7D5A,$001D Line 1403.
B $7D77,$0023 Line 1404.
B $7D9A,$0028 Line 1406.
B $7DC2,$0028 Line 1407.
B $7DEA,$000F Line 1408.
B $7DF9,$0023 Line 1409.
B $7E1C,$001C Line 1410.
B $7E38,$001A Line 1412.
B $7E52,$0028 Line 1413.
B $7E7A,$000F Line 1414.
B $7E89,$0006 Line 1420.
B $7E8F,$001B Line 1430.
B $7EAA,$00A0 Line 1440.
B $7F4A,$0046 Line 1450.
B $7F90,$0047 Line 1460.
B $7FD7,$0010 Line 1465.
B $7FE7,$0028 Line 1470.
B $800F,$0036 Line 1480.
B $8045,$0035 Line 1490.
B $807A,$0029 Line 1500.
B $80A3,$0035 Line 1510.
B $80D8,$0028 Line 1520.
B $8100,$0036 Line 1530.
B $8136,$005B Line 1540.
B $8191,$000F Line 1550.
B $81A0,$0028 Line 1560.
B $81C8,$0043 Line 1570.
B $820B,$0036 Line 1580.
B $8241,$000F Line 1590.
B $8250,$0045 Line 1600.
B $8295,$0084 Line 1610.
B $8319,$0090 Line 1620.
B $83A9,$0038 Line 1630.
B $83E1,$0025 Line 1640.
B $8406,$0010 Line 1645.
B $8416,$0057 Line 1650.
B $846D,$003F Line 1660.
B $84AC,$0029 Line 1670.
B $84D5,$0034 Line 1680.
B $8509,$0036 Line 1690.
B $853F,$000F Line 1700.
B $854E,$00C2 Line 1710.
B $8610,$004A Line 1720.
B $865A,$004B Line 1730.
B $86A5,$0013 Line 1740.
B $86B8,$009E Line 1750.
B $8756,$0042 Line 1760.
B $8798,$0059 Line 1770.
B $87F1,$000F Line 1800.
B $8800,$00D7 Line 1810.
B $88D7,$0094 Line 1820.
B $896B,$0089 Line 1830.
B $89F4,$0075 Line 1840.
B $8A69,$005F Line 1850.
B $8AC8,$0078 Line 1860.
B $8B40,$0038 Line 1870.
B $8B78,$0047 Line 1880.
B $8BBF,$0075 Line 1890.
B $8C34,$006E Line 1900.
B $8CA2,$009D Line 1910.
B $8D3F,$0042 Line 1920.
B $8D81,$0046 Line 1930.
B $8DC7,$0044 Line 1940.
B $8E0B,$0080 Line 1950.
B $8E8B,$0067 Line 1960.
B $8EF2,$003A Line 1970.
B $8F2C,$0077 Line 1980.
B $8FA3,$004C Line 1990.
B $8FEF,$0035 Line 2000.
B $9024,$0082 Line 2010.
B $90A6,$0042 Line 2020.
B $90E8,$0052 Line 2030.
B $913A,$003A Line 2040.
B $9174,$006F Line 2050.
B $91E3,$0054 Line 2060.
B $9237,$0042 Line 2070.
B $9279,$007A Line 2080.
B $92F3,$0059 Line 2090.
B $934C,$003F Line 2100.
B $938B,$0066 Line 2110.
B $93F1,$0058 Line 2120.
B $9449,$00A3 Line 2130.
B $94EC,$004F Line 2140.
B $953B,$005F Line 2141.
B $959A,$0047 Line 2142.
B $95E1,$0075 Line 2150.
B $9656,$0048 Line 2160.
B $969E,$0065 Line 2170.
B $9703,$0031 Line 2180.
B $9734,$006F Line 2190.
B $97A3,$004B Line 2200.
B $97EE,$0057 Line 2210.
B $9845,$00B2 Line 2220.
B $98F7,$0080 Line 2230.
B $9977,$00BD Line 2240.
B $9A34,$0031 Line 2250.
B $9A65,$003B Line 2260.
B $9AA0,$00D2 Line 2270.
B $9B72,$004E Line 2280.
B $9BC0,$004C Line 2290.
B $9C0C,$0056 Line 2300.
B $9C62,$0094 Line 2310.
B $9CF6,$0086 Line 2320.
B $9D7C,$00BB Line 2330.
B $9E37,$007D Line 2340.
B $9EB4,$003F Line 2350.
B $9EF3,$0054 Line 2360.
B $9F47,$009D Line 2370.
B $9FE4,$004B Line 2380.
B $A02F,$007F Line 2390.
B $A0AE,$0032 Line 2400.
B $A0E0,$0038 Line 2410.
B $A118,$0037 Line 2420.
B $A14F,$0036 Line 2430.
B $A185,$0058 Line 2440.
B $A1DD,$003F Line 2450.
B $A21C,$0023 Line 2460.
B $A23F,$004A Line 2470.
B $A289,$0027 Line 2480.
B $A2B0,$0031 Line 2490.
B $A2E1,$0030 Line 2500.
B $A311,$0059 Line 2510.
B $A36A,$00A6 Line 2520.
B $A410,$0095 Line 2530.
B $A4A5,$0040 Line 2540.
B $A4E5,$0099 Line 2550.
B $A57E,$00A8 Line 2560.
B $A626,$003D Line 2570.
B $A663,$0055 Line 3000.
B $A6B8,$008C Line 3010.
B $A744,$0030 Line 3020.
B $A774,$0036 Line 3030.
B $A7AA,$0033 Line 3040.
B $A7DD,$003C Line 3050.
B $A819,$006F Line 3060.
B $A888,$0006 Line 3070.
B $A88E,$002E Line 4000.
B $A8BC,$0020 Line 4010.
B $A8DC,$0024 Line 4020.
B $A900,$0012 Line 4050.
B $A912,$000D Line 4060.

b $A91F BASIC Variables
@ $A91F label=BasicVariables
D $A91F The BASIC variables, up to #SKOOLKID$5C59(E_LINE).
B $A91F,$07,$10
B $A926,$01 End marker.

b $A927 Edit Line
@ $A927 label=EditLine
D $A927 The current BASIC edit line, from #SKOOLKID$5C59(E_LINE) up to
. #SKOOLKID$5C61(WORKSP).
B $A927,$0D

b $A934 Workspace
@ $A934 label=Workspace
D $A934 Bytes from #SKOOLKID$5C61(WORKSP) to #SKOOLKID$5C63(STKBOT).
B $A934,$0011,$10

u $A945 Unused
D $A945 Free memory between #SKOOLKID$5C65(STKEND) and the machine stack.
. #N($A948,$04,$04)-#N($A952,$04,$04) contains non-zero bytes (calculator-stack
. leftovers); the rest is free memory.
B $A945,$0001,$10
S $A946,$1A02

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
. works on both sides of the game.
E $C350 View the equivalent code in;
. #LIST
. { #SIDNEY$8000(Draw Picture) }
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
. { #SIDNEY$8002(Draw Picture Parameters) }
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
. { #SIDNEY$8006(Draw Picture: Unpack) }
. LIST#
N $C356 Find out where this code is in memory. The call leaves its return
. address (#R$C359) just below the stack pointer. An interrupt at this point
. would overwrite it, so BASIC calls #SIDNEY$FF53(Disable Interrupts) first
. and #SIDNEY$FF55(Enable Interrupts) afterwards.
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


b $C47C Graphics: Desk
@ $C47C label=Graphics_Desk
D $C47C The desk screen drawn when "z" is #N$01 (line 115: Statement,
. Examination, Comparison and Arrest). Nothing in the game text names this
. picture.
D $C47C #PUSHS #POKES$C352,$01
. #UDGTABLE
. { =h Desk }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(desk) }
. UDGTABLE#
. #POPS
W $C47C,$02 Length of this record, less one (#N($0124,$04,$04)); the next
. record starts at #R$C5A1.
B $C47E,$01 Screen third to start at (#N$00).
B $C47F,$01 Number of thirds to draw (#N$03).
B $C480,$01 Flags (#N$01): bit 0 is set, so the pixel data is in row order.
@ $C481 label=Graphics_Desk_Pixels
B $C481,$0111,$10 Compressed pixel data.
@ $C592 label=Graphics_Desk_Attributes
B $C592,$000C,$10 Compressed attribute data.
B $C59E,$03 Never read: the attributes are complete before these bytes.

b $C5A1 Graphics: Computer Terminal
@ $C5A1 label=Graphics_ComputerTerminal
D $C5A1 The computer terminal, drawn when "z" is #N$02. Side 1 also draws this
. picture as the side 2 title screen (lines 22-24). Nothing in the game
. text names this picture.
D $C5A1 #PUSHS #POKES$C352,$02
. #UDGTABLE
. { =h Computer Terminal }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(computer-terminal) }
. UDGTABLE#
. #POPS
W $C5A1,$02 Length of this record, less one (#N($03DC,$04,$04)); the next
. record starts at #R$C97E.
B $C5A3,$01 Screen third to start at (#N$00).
B $C5A4,$01 Number of thirds to draw (#N$03).
B $C5A5,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $C5A6 label=Graphics_ComputerTerminal_Pixels
B $C5A6,$03B4,$10 Compressed pixel data.
@ $C95A label=Graphics_ComputerTerminal_Attributes
B $C95A,$0021,$10 Compressed attribute data.
B $C97B,$03 Never read: the attributes are complete before these bytes.

b $C97E Graphics: Portraits 1
@ $C97E label=Graphics_Portraits1
D $C97E Eight portraits, shown by frame when "z" is #N$31-#N$38. Each is named
. by the text the game prints with it:
. #LIST
. { Frame #N$01: Henri Lajoie, caretaker (line 2100) }
. { Frame #N$02: Patrick Languille (line 2160) }
. { Frame #N$03: Patrick Languille in profile (line 710) }
. { Frame #N$04: Sylvie Sidney (line 2000) }
. { Frame #N$05: Ludovic Sidney (line 2350) }
. { Frame #N$06: Peggy Gachet, house keeper (line 2070) }
. { Frame #N$07: Marianne Sidney (line 1940) }
. { Frame #N$08: Hubert Decol, solicitor (line 2040) }
. LIST#
D $C97E #PUSHS #POKES$C352,$03
. #UDGTABLE
. { =h Portraits 1 }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(portraits-1) }
. UDGTABLE#
. #POPS
W $C97E,$02 Length of this record, less one (#N($0C22,$04,$04)); the next
. record starts at #R$D5A1.
B $C980,$01 Screen third to start at (#N$00).
B $C981,$01 Number of thirds to draw (#N$03).
B $C982,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $C983 label=Graphics_Portraits1_Pixels
B $C983,$0BA3,$10 Compressed pixel data.
@ $D526 label=Graphics_Portraits1_Attributes
B $D526,$0078,$10 Compressed attribute data.
B $D59E,$03 Never read: the attributes are complete before these bytes.

b $D5A1 Graphics: Portraits 2
@ $D5A1 label=Graphics_Portraits2
D $D5A1 Three portraits, shown by frame when "z" is #N$41-#N$43. Each is named
. by the text the game prints with it:
. #LIST
. { Frame #N$01: Jeannot Estrade (line 1870) }
. { Frame #N$02: Robert Renard (line 1910) }
. { Frame #N$03: Tino di Nallo (line 2260) }
. LIST#
D $D5A1 #PUSHS #POKES$C352,$04
. #UDGTABLE
. { =h Portraits 2 }
. { #SIM(start=$C350,stop=$C433,sp=$C340)#SCR$02(portraits-2) }
. UDGTABLE#
. #POPS
W $D5A1,$02 Length of this record, less one (#N($0579,$04,$04)). This is the
. last record in the list.
B $D5A3,$01 Screen third to start at (#N$00).
B $D5A4,$01 Number of thirds to draw (#N$03).
B $D5A5,$01 Flags (#N$00): bit 0 is clear, so the pixel data is in column order.
@ $D5A6 label=Graphics_Portraits2_Pixels
B $D5A6,$0524,$10 Compressed pixel data.
@ $DACA label=Graphics_Portraits2_Attributes
B $DACA,$004E,$10 Compressed attribute data.
B $DB18,$03 Never read: the attributes are complete before these bytes.


u $DB1B Last Bytes Of Code Block
D $DB1B The last bytes of the CODE block at #N($C350,$04,$04); they are not
. part of any picture record.
S $DB1B,$009F

u $DBBA Unused
S $DBBA,$0446

b $E000 Picture Buffer
@ $E000 label=PictureBuffer
D $E000 BASIC draws a picture sheet here; the side 1 routine "ins" copies
. single frames from it to the screen.
S $E000,$1800 Pixels.
@ $F800 label=PictureBuffer_Attributes
S $F800,$0300 Attributes.

b $FB00 Side 1 Helper Routines
@ $FB00 label=Side1HelperRoutines
D $FB00 Zero in the snapshot. Side 2's BASIC still calls side 1's helper
. library here (line 3010 sets "ins", "noi", "scr", "prn", "iof", "ion",
. "ist" and "par" (#N($FF78,$04,$04)); line 1 PEEKs #N($FF81,$04,$04)). The
. routines are not on the side 2 tape; they remain from side 1. See
. #SIDNEY$FB09.
S $FB00,$0482

i $FF82
