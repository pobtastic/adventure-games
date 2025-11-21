; Copyright Melbourne House 1984, 2025 ArcadeGeek LTD. NOTE: Disassembly is 
; Work-In-Progress. Label naming is loosely based on Action_ActionName_SubAction 
; e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Sherlock Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B1B Game Entry Point Alias
@ $5B1B label=Alias_GameEntryPoint
N $5B1B #SIM(start=$A040,stop=$A04E)#SIM(start=$A05B,stop=$A071)
  $5B1B,$03 Jump to #R$A040.

b $5B1E

g $5D80 Table: Word index
@ $5D80 label=Table_WordIndex
W $5D80,$02 #LET(letter=($40+(#PC-$5D80)/$02))#IF(#PEEK(#PC+$01)*$100+#PEEK(#PC))("#R($5DBF+#PEEK(#PC+$01)*$100+#PEEK(#PC))(#CHR({letter}))",)
L $5D80,$02,$20

g $5DC0 Table Dictionary: "A"
@ $5DC0 Table_Dictionary_A
D $5DC0 All dictionary words starting with "A".

N $5DC0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0001)".
M $5DC0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DC0,$02,$01

N $5DC2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0003)".
M $5DC2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DC2,$02,$01

N $5DC4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0005)".
M $5DC4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DC4,$02,$01
M $5DC6,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5DC6,$04)
B $5DC6,$03,b$01

N $5DC9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($000A)".
M $5DC9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DC9,$02,$01
M $5DCB,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5DCB,$02)
B $5DCB,$02,b$01

N $5DCD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($000E)".
M $5DCD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DCD,$02,$01
M $5DCF,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($5DCF,$06)
B $5DCF,$04,b$01

N $5DD3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0014)".
M $5DD3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DD3,$02,$01
M $5DD5,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5DD5,$02)
B $5DD5,$02,b$01

N $5DD7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0018)".
M $5DD7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DD7,$02,$01
M $5DD9,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($5DD9,$06)
B $5DD9,$04,b$01

N $5DDD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($001E)".
M $5DDD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DDD,$02,$01
M $5DDF,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($5DDF,$08)
B $5DDF,$05,b$01

N $5DE4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0025)".
M $5DE4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DE4,$02,$01
M $5DE6,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5DE6,$04)
B $5DE6,$03,b$01

N $5DE9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($002A)".
M $5DE9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DE9,$02,$01
M $5DEB,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5DEB,$03)
B $5DEB,$02,b$01

N $5DED Word #N(#PC-$5DBF,$04,$04): "#TOKEN($002E)".
M $5DED,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DED,$02,$01
M $5DEF,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5DEF,$01)
B $5DEF,$01,b$01

N $5DF0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0031)".
M $5DF0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DF0,$02,$01
M $5DF2,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($5DF2,$08)
B $5DF2,$05,b$01

N $5DF7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0038)".
M $5DF7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DF7,$02,$01
M $5DF9,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5DF9,$03)
B $5DF9,$02,b$01

N $5DFB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($003C)".
M $5DFB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DFB,$02,$01
M $5DFD,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5DFD,$02)
B $5DFD,$02,b$01

N $5DFF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0040)".
M $5DFF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5DFF,$02,$01
M $5E01,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E01,$01)
B $5E01,$01,b$01

N $5E02 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0043)".
M $5E02,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E02,$02,$01
M $5E04,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E04,$03)
B $5E04,$02,b$01

N $5E06 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0047)".
M $5E06,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E06,$02,$01
M $5E08,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5E08,$05)
B $5E08,$04,b$01

N $5E0C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($004D)".
M $5E0C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E0C,$02,$01
M $5E0E,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($5E0E,$06)
B $5E0E,$04,b$01

N $5E12 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0053)".
M $5E12,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E12,$02,$01
M $5E14,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E14,$03)
B $5E14,$02,b$01

N $5E16 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0057)".
M $5E16,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E16,$02,$01
M $5E18,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E18,$01)
B $5E18,$01,b$01

N $5E19 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($005A)".
M $5E19,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E19,$02,$01
M $5E1B,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E1B,$01)
B $5E1B,$01,b$01

N $5E1C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($005D)".
M $5E1C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E1C,$02,$01
M $5E1E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E1E,$01)
B $5E1E,$01,b$01

N $5E1F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0060)".
M $5E1F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E1F,$02,$01
M $5E21,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5E21,$05)
B $5E21,$04,b$01

N $5E25 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0066)".
M $5E25,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E25,$02,$01
M $5E27,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5E27,$04)
B $5E27,$03,b$01

N $5E2A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($006B)".
M $5E2A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E2A,$02,$01
M $5E2C,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5E2C,$04)
B $5E2C,$03,b$01

N $5E2F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0070)".
M $5E2F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E2F,$02,$01
M $5E31,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($5E31,$06)
B $5E31,$04,b$01

N $5E35 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0076)".
M $5E35,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E35,$02,$01
M $5E37,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E37,$03)
B $5E37,$02,b$01

N $5E39 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($007A)".
M $5E39,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E39,$02,$01
M $5E3B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5E3B,$02)
B $5E3B,$02,b$01

N $5E3D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($007E)".
M $5E3D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E3D,$02,$01
M $5E3F,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($5E3F,$06)
B $5E3F,$04,b$01

N $5E43 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0084)".
M $5E43,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E43,$02,$01
M $5E45,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E45,$03)
B $5E45,$02,b$01

N $5E47 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0088)".
M $5E47,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E47,$02,$01
M $5E49,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E49,$03)
B $5E49,$02,b$01

N $5E4B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($008C)".
M $5E4B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E4B,$02,$01
M $5E4D,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E4D,$01)
B $5E4D,$01,b$01

N $5E4E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($008F)".
M $5E4E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E4E,$02,$01
M $5E50,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($5E50,$07)
B $5E50,$05,b$01

N $5E55 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0096)".
M $5E55,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E55,$02,$01
M $5E57,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5E57,$02)
B $5E57,$02,b$01

N $5E59 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($009A)".
M $5E59,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E59,$02,$01
M $5E5B,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E5B,$01)
B $5E5B,$01,b$01

N $5E5C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($009D)".
M $5E5C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E5C,$02,$01
M $5E5E,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5E5E,$05)
B $5E5E,$04,b$01

N $5E62 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00A3)".
M $5E62,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E62,$02,$01
M $5E64,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E64,$03)
B $5E64,$02,b$01


g $5E66 Table Dictionary: "B"
@ $5E66 Table_Dictionary_B
D $5E66 All dictionary words starting with "B".

N $5E66 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00A7)".
M $5E66,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E66,$02,$01
M $5E68,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E68,$03)
B $5E68,$02,b$01

N $5E6A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00AB)".
M $5E6A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E6A,$02,$01
M $5E6C,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E6C,$03)
B $5E6C,$02,b$01

N $5E6E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00AF)".
M $5E6E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E6E,$02,$01
M $5E70,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5E70,$02)
B $5E70,$02,b$01

N $5E72 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00B3)".
M $5E72,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E72,$02,$01
M $5E74,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5E74,$05)
B $5E74,$04,b$01

N $5E78 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00B9)".
M $5E78,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E78,$02,$01
M $5E7A,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5E7A,$03)
B $5E7A,$02,b$01

N $5E7C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00BD)".
M $5E7C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E7C,$02,$01
M $5E7E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E7E,$01)
B $5E7E,$01,b$01

N $5E7F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00C0)".
M $5E7F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E7F,$02,$01
M $5E81,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E81,$01)
B $5E81,$01,b$01

N $5E82 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00C3)".
M $5E82,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E82,$02,$01

N $5E84 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00C5)".
M $5E84,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E84,$02,$01
M $5E86,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5E86,$05)
B $5E86,$04,b$01

N $5E8A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00CB)".
M $5E8A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E8A,$02,$01
M $5E8C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5E8C,$01)
B $5E8C,$01,b$01

N $5E8D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00CE)".
M $5E8D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E8D,$02,$01
M $5E8F,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5E8F,$04)
B $5E8F,$03,b$01

N $5E92 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00D3)".
M $5E92,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E92,$02,$01
M $5E94,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5E94,$02)
B $5E94,$02,b$01

N $5E96 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00D7)".
M $5E96,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E96,$02,$01
M $5E98,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5E98,$04)
B $5E98,$03,b$01

N $5E9B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00DC)".
M $5E9B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5E9B,$02,$01
M $5E9D,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5E9D,$04)
B $5E9D,$03,b$01

N $5EA0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00E1)".
M $5EA0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EA0,$02,$01
M $5EA2,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5EA2,$05)
B $5EA2,$04,b$01

N $5EA6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00E7)".
M $5EA6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EA6,$02,$01
M $5EA8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5EA8,$02)
B $5EA8,$02,b$01

N $5EAA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00EB)".
M $5EAA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EAA,$02,$01
M $5EAC,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5EAC,$05)
B $5EAC,$04,b$01

N $5EB0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00F1)".
M $5EB0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EB0,$02,$01
M $5EB2,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5EB2,$02)
B $5EB2,$02,b$01

N $5EB4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00F5)".
M $5EB4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EB4,$02,$01
M $5EB6,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5EB6,$05)
B $5EB6,$04,b$01

N $5EBA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00FB)".
M $5EBA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EBA,$02,$01
M $5EBC,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5EBC,$01)
B $5EBC,$01,b$01

N $5EBD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($00FE)".
M $5EBD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EBD,$02,$01
M $5EBF,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($5EBF,$08)
B $5EBF,$05,b$01

N $5EC4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0105)".
M $5EC4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EC4,$02,$01
M $5EC6,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5EC6,$03)
B $5EC6,$02,b$01

N $5EC8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0109)".
M $5EC8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EC8,$02,$01
M $5ECA,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($5ECA,$07)
B $5ECA,$05,b$01

N $5ECF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0110)".
M $5ECF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5ECF,$02,$01
M $5ED1,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($5ED1,$07)
B $5ED1,$05,b$01

N $5ED6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0117)".
M $5ED6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5ED6,$02,$01
M $5ED8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5ED8,$02)
B $5ED8,$02,b$01

N $5EDA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($011B)".
M $5EDA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EDA,$02,$01
M $5EDC,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5EDC,$02)
B $5EDC,$02,b$01

N $5EDE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($011F)".
M $5EDE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EDE,$02,$01
M $5EE0,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5EE0,$04)
B $5EE0,$03,b$01

N $5EE3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0124)".
M $5EE3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EE3,$02,$01
M $5EE5,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5EE5,$04)
B $5EE5,$03,b$01

N $5EE8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0129)".
M $5EE8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EE8,$02,$01
W $5EEA,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $5EEC,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5EEC,$04)
B $5EEC,$03,b$01

N $5EEF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0130)".
M $5EEF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EEF,$02,$01
M $5EF1,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5EF1,$04)
B $5EF1,$03,b$01

N $5EF4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0135)".
M $5EF4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EF4,$02,$01
M $5EF6,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($5EF6,$06)
B $5EF6,$04,b$01

N $5EFA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($013B)".
M $5EFA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EFA,$02,$01
M $5EFC,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5EFC,$03)
B $5EFC,$02,b$01

N $5EFE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($013F)".
M $5EFE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5EFE,$02,$01
M $5F00,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5F00,$03)
B $5F00,$02,b$01

N $5F02 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0143)".
M $5F02,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F02,$02,$01
M $5F04,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F04,$02)
B $5F04,$02,b$01

N $5F06 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0147)".
M $5F06,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F06,$02,$01
M $5F08,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F08,$01)
B $5F08,$01,b$01

N $5F09 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($014A)".
M $5F09,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F09,$02,$01
M $5F0B,$06 Bit-packed letters (9 letters, 5 bits each):
. #BITGROUPS($5F0B,$09)
B $5F0B,$06,b$01

N $5F11 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0152)".
M $5F11,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F11,$02,$01
M $5F13,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5F13,$04)
B $5F13,$03,b$01

N $5F16 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0157)".
M $5F16,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F16,$02,$01
M $5F18,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F18,$02)
B $5F18,$02,b$01

N $5F1A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($015B)".
M $5F1A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F1A,$02,$01
M $5F1C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F1C,$01)
B $5F1C,$01,b$01

N $5F1D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($015E)".
M $5F1D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F1D,$02,$01
M $5F1F,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F1F,$01)
B $5F1F,$01,b$01

N $5F20 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0161)".
M $5F20,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F20,$02,$01
M $5F22,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F22,$01)
B $5F22,$01,b$01


g $5F23 Table Dictionary: "C"
@ $5F23 Table_Dictionary_C
D $5F23 All dictionary words starting with "C".

N $5F23 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0164)".
M $5F23,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F23,$02,$01
M $5F25,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F25,$02)
B $5F25,$02,b$01

N $5F27 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0168)".
M $5F27,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F27,$02,$01
M $5F29,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5F29,$03)
B $5F29,$02,b$01

N $5F2B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($016C)".
M $5F2B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F2B,$02,$01
M $5F2D,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F2D,$02)
B $5F2D,$02,b$01

N $5F2F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0170)".
M $5F2F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F2F,$02,$01
W $5F31,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $5F33 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0174)".
M $5F33,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F33,$02,$01
M $5F35,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5F35,$04)
B $5F35,$03,b$01

N $5F38 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0179)".
M $5F38,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F38,$02,$01
M $5F3A,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F3A,$01)
B $5F3A,$01,b$01

N $5F3B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($017C)".
M $5F3B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F3B,$02,$01
M $5F3D,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F3D,$01)
B $5F3D,$01,b$01

N $5F3E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($017F)".
M $5F3E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F3E,$02,$01
M $5F40,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5F40,$03)
B $5F40,$02,b$01

N $5F42 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0183)".
M $5F42,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F42,$02,$01
W $5F44,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $5F46,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5F46,$05)
B $5F46,$04,b$01

N $5F4A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($018B)".
M $5F4A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F4A,$02,$01
M $5F4C,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F4C,$02)
B $5F4C,$02,b$01

N $5F4E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($018F)".
M $5F4E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F4E,$02,$01

N $5F50 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0191)".
M $5F50,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F50,$02,$01
M $5F52,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F52,$02)
B $5F52,$02,b$01

N $5F54 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0195)".
M $5F54,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F54,$02,$01
M $5F56,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5F56,$04)
B $5F56,$03,b$01

N $5F59 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($019A)".
M $5F59,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F59,$02,$01
M $5F5B,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5F5B,$03)
B $5F5B,$02,b$01

N $5F5D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($019E)".
M $5F5D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F5D,$02,$01
M $5F5F,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5F5F,$03)
B $5F5F,$02,b$01

N $5F61 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01A2)".
M $5F61,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F61,$02,$01
M $5F63,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F63,$02)
B $5F63,$02,b$01

N $5F65 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01A6)".
M $5F65,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F65,$02,$01
M $5F67,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5F67,$04)
B $5F67,$03,b$01

N $5F6A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01AB)".
M $5F6A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F6A,$02,$01
M $5F6C,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($5F6C,$07)
B $5F6C,$05,b$01

N $5F71 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01B2)".
M $5F71,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F71,$02,$01
M $5F73,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5F73,$04)
B $5F73,$03,b$01

N $5F76 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01B7)".
M $5F76,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F76,$02,$01
M $5F78,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5F78,$03)
B $5F78,$02,b$01

N $5F7A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01BB)".
M $5F7A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F7A,$02,$01
M $5F7C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F7C,$01)
B $5F7C,$01,b$01

N $5F7D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01BE)".
M $5F7D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F7D,$02,$01
M $5F7F,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F7F,$02)
B $5F7F,$02,b$01

N $5F81 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01C2)".
M $5F81,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F81,$02,$01
M $5F83,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5F83,$01)
B $5F83,$01,b$01

N $5F84 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01C5)".
M $5F84,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F84,$02,$01
M $5F86,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5F86,$04)
B $5F86,$03,b$01

N $5F89 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01CA)".
M $5F89,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F89,$02,$01
M $5F8B,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5F8B,$05)
B $5F8B,$04,b$01

N $5F8F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01D0)".
M $5F8F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F8F,$02,$01
M $5F91,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5F91,$03)
B $5F91,$02,b$01

N $5F93 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01D4)".
M $5F93,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F93,$02,$01
M $5F95,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5F95,$02)
B $5F95,$02,b$01

N $5F97 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01D8)".
M $5F97,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F97,$02,$01
M $5F99,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($5F99,$07)
B $5F99,$05,b$01

N $5F9E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01DF)".
M $5F9E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5F9E,$02,$01
M $5FA0,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5FA0,$02)
B $5FA0,$02,b$01

N $5FA2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01E3)".
M $5FA2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FA2,$02,$01
M $5FA4,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5FA4,$04)
B $5FA4,$03,b$01

N $5FA7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01E8)".
M $5FA7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FA7,$02,$01
M $5FA9,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5FA9,$03)
B $5FA9,$02,b$01

N $5FAB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01EC)".
M $5FAB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FAB,$02,$01
M $5FAD,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5FAD,$02)
B $5FAD,$02,b$01

N $5FAF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01F0)".
M $5FAF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FAF,$02,$01
M $5FB1,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5FB1,$03)
B $5FB1,$02,b$01

N $5FB3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01F4)".
M $5FB3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FB3,$02,$01
M $5FB5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5FB5,$01)
B $5FB5,$01,b$01

N $5FB6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01F7)".
M $5FB6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FB6,$02,$01
M $5FB8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5FB8,$02)
B $5FB8,$02,b$01

N $5FBA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($01FB)".
M $5FBA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FBA,$02,$01
M $5FBC,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5FBC,$04)
B $5FBC,$03,b$01

N $5FBF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0200)".
M $5FBF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FBF,$02,$01
M $5FC1,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5FC1,$03)
B $5FC1,$02,b$01

N $5FC3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0204)".
M $5FC3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FC3,$02,$01
M $5FC5,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($5FC5,$05)
B $5FC5,$04,b$01

N $5FC9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($020A)".
M $5FC9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FC9,$02,$01
M $5FCB,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5FCB,$01)
B $5FCB,$01,b$01


g $5FCC Table Dictionary: "D"
@ $5FCC Table_Dictionary_D
D $5FCC All dictionary words starting with "D".

N $5FCC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($020D)".
M $5FCC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FCC,$02,$01
W $5FCE,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $5FD0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0211)".
M $5FD0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FD0,$02,$01
M $5FD2,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5FD2,$04)
B $5FD2,$03,b$01

N $5FD5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0216)".
M $5FD5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FD5,$02,$01
M $5FD7,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5FD7,$04)
B $5FD7,$03,b$01

N $5FDA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($021B)".
M $5FDA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FDA,$02,$01
M $5FDC,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5FDC,$01)
B $5FDC,$01,b$01

N $5FDD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($021E)".
M $5FDD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FDD,$02,$01
M $5FDF,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5FDF,$02)
B $5FDF,$02,b$01

N $5FE1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0222)".
M $5FE1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FE1,$02,$01
M $5FE3,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5FE3,$01)
B $5FE3,$01,b$01

N $5FE4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0225)".
M $5FE4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FE4,$02,$01
M $5FE6,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($5FE6,$03)
B $5FE6,$02,b$01

N $5FE8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0229)".
M $5FE8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FE8,$02,$01
M $5FEA,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5FEA,$02)
B $5FEA,$02,b$01

N $5FEC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($022D)".
M $5FEC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FEC,$02,$01
M $5FEE,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5FEE,$02)
B $5FEE,$02,b$01

N $5FF0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0231)".
M $5FF0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FF0,$02,$01
M $5FF2,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($5FF2,$01)
B $5FF2,$01,b$01

N $5FF3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0234)".
M $5FF3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FF3,$02,$01
M $5FF5,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($5FF5,$02)
B $5FF5,$02,b$01

N $5FF7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0238)".
M $5FF7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FF7,$02,$01
M $5FF9,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($5FF9,$04)
B $5FF9,$03,b$01

N $5FFC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($023D)".
M $5FFC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $5FFC,$02,$01
M $5FFE,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($5FFE,$07)
B $5FFE,$05,b$01

N $6003 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0244)".
M $6003,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6003,$02,$01
M $6005,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6005,$01)
B $6005,$01,b$01

N $6006 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0247)".
M $6006,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6006,$02,$01

N $6008 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0249)".
M $6008,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6008,$02,$01
M $600A,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($600A,$06)
B $600A,$04,b$01

N $600E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($024F)".
M $600E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $600E,$02,$01
M $6010,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6010,$04)
B $6010,$03,b$01

N $6013 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0254)".
M $6013,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6013,$02,$01
M $6015,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6015,$04)
B $6015,$03,b$01

N $6018 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0259)".
M $6018,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6018,$02,$01
M $601A,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($601A,$06)
B $601A,$04,b$01

N $601E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($025F)".
M $601E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $601E,$02,$01
M $6020,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6020,$02)
B $6020,$02,b$01

N $6022 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0263)".
M $6022,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6022,$02,$01
M $6024,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6024,$01)
B $6024,$01,b$01

N $6025 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0266)".
M $6025,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6025,$02,$01

N $6027 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0268)".
M $6027,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6027,$02,$01

N $6029 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($026A)".
M $6029,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6029,$02,$01
M $602B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($602B,$02)
B $602B,$02,b$01

N $602D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($026E)".
M $602D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $602D,$02,$01
M $602F,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($602F,$02)
B $602F,$02,b$01

N $6031 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0272)".
M $6031,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6031,$02,$01
M $6033,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6033,$02)
B $6033,$02,b$01

N $6035 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0276)".
M $6035,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6035,$02,$01
M $6037,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6037,$05)
B $6037,$04,b$01

N $603B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($027C)".
M $603B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $603B,$02,$01
M $603D,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($603D,$02)
B $603D,$02,b$01


g $603F Table Dictionary: "E"
@ $603F Table_Dictionary_E
D $603F All dictionary words starting with "E".

N $603F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0280)".
M $603F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $603F,$02,$01
W $6041,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $6043 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0284)".
M $6043,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6043,$02,$01
M $6045,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6045,$03)
B $6045,$02,b$01

N $6047 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0288)".
M $6047,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6047,$02,$01
M $6049,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6049,$04)
B $6049,$03,b$01

N $604C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($028D)".
M $604C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $604C,$02,$01
M $604E,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($604E,$06)
B $604E,$04,b$01

N $6052 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0293)".
M $6052,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6052,$02,$01
M $6054,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6054,$04)
B $6054,$03,b$01

N $6057 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0298)".
M $6057,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6057,$02,$01
M $6059,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6059,$03)
B $6059,$02,b$01

N $605B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($029C)".
M $605B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $605B,$02,$01
M $605D,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($605D,$05)
B $605D,$04,b$01

N $6061 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02A2)".
M $6061,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6061,$02,$01
M $6063,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6063,$05)
B $6063,$04,b$01

N $6067 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02A8)".
M $6067,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6067,$02,$01
M $6069,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6069,$03)
B $6069,$02,b$01

N $606B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02AC)".
M $606B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $606B,$02,$01
M $606D,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($606D,$01)
B $606D,$01,b$01

N $606E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02AF)".
M $606E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $606E,$02,$01
W $6070,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $6072,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6072,$06)
B $6072,$04,b$01

N $6076 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02B7)".
M $6076,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6076,$02,$01
M $6078,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6078,$06)
B $6078,$04,b$01

N $607C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02BD)".
M $607C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $607C,$02,$01
M $607E,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($607E,$03)
B $607E,$02,b$01

N $6080 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02C1)".
M $6080,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6080,$02,$01
M $6082,$07 Bit-packed letters (10 letters, 5 bits each):
. #BITGROUPS($6082,$0A)
B $6082,$07,b$01

N $6089 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02CA)".
M $6089,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6089,$02,$01
M $608B,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($608B,$01)
B $608B,$01,b$01

N $608C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02CD)".
M $608C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $608C,$02,$01
M $608E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($608E,$01)
B $608E,$01,b$01

N $608F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02D0)".
M $608F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $608F,$02,$01
M $6091,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($6091,$07)
B $6091,$05,b$01

N $6096 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02D7)".
M $6096,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6096,$02,$01
W $6098,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $609A,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($609A,$02)
B $609A,$02,b$01


g $609C Table Dictionary: "F"
@ $609C Table_Dictionary_F
D $609C All dictionary words starting with "F".

N $609C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02DD)".
M $609C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $609C,$02,$01
M $609E,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($609E,$03)
B $609E,$02,b$01

N $60A0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02E1)".
M $60A0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60A0,$02,$01
M $60A2,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($60A2,$02)
B $60A2,$02,b$01

N $60A4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02E5)".
M $60A4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60A4,$02,$01
M $60A6,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($60A6,$03)
B $60A6,$02,b$01

N $60A8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02E9)".
M $60A8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60A8,$02,$01
M $60AA,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($60AA,$02)
B $60AA,$02,b$01

N $60AC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02ED)".
M $60AC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60AC,$02,$01
M $60AE,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($60AE,$03)
B $60AE,$02,b$01

N $60B0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02F1)".
M $60B0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60B0,$02,$01
M $60B2,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($60B2,$01)
B $60B2,$01,b$01

N $60B3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02F4)".
M $60B3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60B3,$02,$01
M $60B5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($60B5,$01)
B $60B5,$01,b$01

N $60B6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02F7)".
M $60B6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60B6,$02,$01
M $60B8,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($60B8,$05)
B $60B8,$04,b$01

N $60BC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($02FD)".
M $60BC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60BC,$02,$01
M $60BE,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($60BE,$04)
B $60BE,$03,b$01

N $60C1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0302)".
M $60C1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60C1,$02,$01
M $60C3,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($60C3,$04)
B $60C3,$03,b$01

N $60C6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0307)".
M $60C6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60C6,$02,$01
M $60C8,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($60C8,$01)
B $60C8,$01,b$01

N $60C9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($030A)".
M $60C9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60C9,$02,$01
M $60CB,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($60CB,$07)
B $60CB,$05,b$01

N $60D0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0311)".
M $60D0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60D0,$02,$01
M $60D2,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($60D2,$02)
B $60D2,$02,b$01

N $60D4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0315)".
M $60D4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60D4,$02,$01
M $60D6,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($60D6,$02)
B $60D6,$02,b$01

N $60D8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0319)".
M $60D8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60D8,$02,$01
M $60DA,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($60DA,$05)
B $60DA,$04,b$01

N $60DE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($031F)".
M $60DE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60DE,$02,$01
M $60E0,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($60E0,$02)
B $60E0,$02,b$01

N $60E2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0323)".
M $60E2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60E2,$02,$01
M $60E4,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($60E4,$02)
B $60E4,$02,b$01

N $60E6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0327)".
M $60E6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60E6,$02,$01
M $60E8,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($60E8,$06)
B $60E8,$04,b$01

N $60EC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($032D)".
M $60EC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60EC,$02,$01
M $60EE,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($60EE,$05)
B $60EE,$04,b$01

N $60F2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0333)".
M $60F2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60F2,$02,$01
M $60F4,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($60F4,$03)
B $60F4,$02,b$01

N $60F6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0337)".
M $60F6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60F6,$02,$01
M $60F8,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($60F8,$08)
B $60F8,$05,b$01

N $60FD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($033E)".
M $60FD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $60FD,$02,$01
M $60FF,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($60FF,$01)
B $60FF,$01,b$01

N $6100 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0341)".
M $6100,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6100,$02,$01
M $6102,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6102,$02)
B $6102,$02,b$01

N $6104 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0345)".
M $6104,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6104,$02,$01
M $6106,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6106,$01)
B $6106,$01,b$01

N $6107 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0348)".
M $6107,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6107,$02,$01
M $6109,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6109,$03)
B $6109,$02,b$01

N $610B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($034C)".
M $610B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $610B,$02,$01
M $610D,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($610D,$04)
B $610D,$03,b$01

N $6110 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0351)".
M $6110,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6110,$02,$01
M $6112,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6112,$02)
B $6112,$02,b$01

N $6114 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0355)".
M $6114,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6114,$02,$01
M $6116,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6116,$02)
B $6116,$02,b$01

N $6118 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0359)".
M $6118,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6118,$02,$01
W $611A,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $611C,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($611C,$03)
B $611C,$02,b$01

N $611E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($035F)".
M $611E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $611E,$02,$01
M $6120,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6120,$02)
B $6120,$02,b$01

N $6122 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0363)".
M $6122,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6122,$02,$01
M $6124,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($6124,$07)
B $6124,$05,b$01


g $6129 Table Dictionary: "G"
@ $6129 Table_Dictionary_G
D $6129 All dictionary words starting with "G".

N $6129 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($036A)".
M $6129,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6129,$02,$01
M $612B,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($612B,$05)
B $612B,$04,b$01

N $612F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0370)".
M $612F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $612F,$02,$01
M $6131,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6131,$02)
B $6131,$02,b$01

N $6133 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0374)".
M $6133,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6133,$02,$01
M $6135,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6135,$01)
B $6135,$01,b$01

N $6136 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0377)".
M $6136,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6136,$02,$01
M $6138,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6138,$02)
B $6138,$02,b$01

N $613A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($037B)".
M $613A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $613A,$02,$01
M $613C,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($613C,$05)
B $613C,$04,b$01

N $6140 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0381)".
M $6140,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6140,$02,$01
M $6142,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6142,$01)
B $6142,$01,b$01

N $6143 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0384)".
M $6143,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6143,$02,$01
M $6145,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6145,$04)
B $6145,$03,b$01

N $6148 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0389)".
M $6148,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6148,$02,$01
M $614A,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($614A,$02)
B $614A,$02,b$01

N $614C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($038D)".
M $614C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $614C,$02,$01
M $614E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($614E,$01)
B $614E,$01,b$01

N $614F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0390)".
M $614F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $614F,$02,$01

N $6151 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0392)".
M $6151,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6151,$02,$01
M $6153,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6153,$02)
B $6153,$02,b$01

N $6155 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0396)".
M $6155,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6155,$02,$01
M $6157,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6157,$02)
B $6157,$02,b$01

N $6159 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($039A)".
M $6159,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6159,$02,$01
M $615B,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($615B,$01)
B $615B,$01,b$01

N $615C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($039D)".
M $615C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $615C,$02,$01
M $615E,$06 Bit-packed letters (9 letters, 5 bits each):
. #BITGROUPS($615E,$09)
B $615E,$06,b$01

N $6164 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03A5)".
M $6164,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6164,$02,$01
M $6166,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6166,$04)
B $6166,$03,b$01

N $6169 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03AA)".
M $6169,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6169,$02,$01
M $616B,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($616B,$04)
B $616B,$03,b$01

N $616E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03AF)".
M $616E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $616E,$02,$01
M $6170,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6170,$04)
B $6170,$03,b$01

N $6173 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03B4)".
M $6173,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6173,$02,$01
M $6175,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6175,$01)
B $6175,$01,b$01

N $6176 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03B7)".
M $6176,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6176,$02,$01
M $6178,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6178,$01)
B $6178,$01,b$01


g $6179 Table Dictionary: "H"
@ $6179 Table_Dictionary_H
D $6179 All dictionary words starting with "H".

N $6179 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03BA)".
M $6179,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6179,$02,$01
M $617B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($617B,$02)
B $617B,$02,b$01

N $617D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03BE)".
M $617D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $617D,$02,$01
M $617F,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($617F,$02)
B $617F,$02,b$01

N $6181 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03C2)".
M $6181,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6181,$02,$01
M $6183,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6183,$02)
B $6183,$02,b$01

N $6185 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03C6)".
M $6185,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6185,$02,$01
M $6187,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6187,$03)
B $6187,$02,b$01

N $6189 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03CA)".
M $6189,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6189,$02,$01
M $618B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($618B,$02)
B $618B,$02,b$01

N $618D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03CE)".
M $618D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $618D,$02,$01
M $618F,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($618F,$03)
B $618F,$02,b$01

N $6191 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03D2)".
M $6191,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6191,$02,$01
M $6193,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6193,$06)
B $6193,$04,b$01

N $6197 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03D8)".
M $6197,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6197,$02,$01
M $6199,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6199,$01)
B $6199,$01,b$01

N $619A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03DB)".
M $619A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $619A,$02,$01
M $619C,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($619C,$03)
B $619C,$02,b$01

N $619E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03DF)".
M $619E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $619E,$02,$01
M $61A0,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($61A0,$02)
B $61A0,$02,b$01

N $61A2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03E3)".
M $61A2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61A2,$02,$01
M $61A4,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61A4,$01)
B $61A4,$01,b$01

N $61A5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03E6)".
M $61A5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61A5,$02,$01
M $61A7,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($61A7,$02)
B $61A7,$02,b$01

N $61A9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03EA)".
M $61A9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61A9,$02,$01
M $61AB,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61AB,$01)
B $61AB,$01,b$01

N $61AC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03ED)".
M $61AC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61AC,$02,$01
M $61AE,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($61AE,$02)
B $61AE,$02,b$01

N $61B0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03F1)".
M $61B0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61B0,$02,$01
M $61B2,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($61B2,$03)
B $61B2,$02,b$01

N $61B4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03F5)".
M $61B4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61B4,$02,$01
M $61B6,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($61B6,$03)
B $61B6,$02,b$01

N $61B8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03F9)".
M $61B8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61B8,$02,$01
M $61BA,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61BA,$01)
B $61BA,$01,b$01

N $61BB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03FC)".
M $61BB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61BB,$02,$01
M $61BD,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61BD,$01)
B $61BD,$01,b$01

N $61BE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($03FF)".
M $61BE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61BE,$02,$01
M $61C0,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61C0,$01)
B $61C0,$01,b$01

N $61C1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0402)".
M $61C1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61C1,$02,$01
M $61C3,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($61C3,$04)
B $61C3,$03,b$01

N $61C6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0407)".
M $61C6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61C6,$02,$01
M $61C8,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61C8,$01)
B $61C8,$01,b$01

N $61C9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($040A)".
M $61C9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61C9,$02,$01
M $61CB,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61CB,$01)
B $61CB,$01,b$01

N $61CC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($040D)".
M $61CC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61CC,$02,$01
M $61CE,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($61CE,$03)
B $61CE,$02,b$01

N $61D0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0411)".
M $61D0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61D0,$02,$01
M $61D2,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61D2,$01)
B $61D2,$01,b$01

N $61D3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0414)".
M $61D3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61D3,$02,$01
M $61D5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61D5,$01)
B $61D5,$01,b$01

N $61D6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0417)".
M $61D6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61D6,$02,$01
M $61D8,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($61D8,$05)
B $61D8,$04,b$01

N $61DC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($041D)".
M $61DC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61DC,$02,$01
M $61DE,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($61DE,$03)
B $61DE,$02,b$01

N $61E0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0421)".
M $61E0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61E0,$02,$01
M $61E2,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61E2,$01)
B $61E2,$01,b$01

N $61E3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0424)".
M $61E3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61E3,$02,$01
M $61E5,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($61E5,$03)
B $61E5,$02,b$01

N $61E7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0428)".
M $61E7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61E7,$02,$01
M $61E9,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($61E9,$04)
B $61E9,$03,b$01


g $61EC Table Dictionary: "I"
@ $61EC Table_Dictionary_I
D $61EC All dictionary words starting with "I".

N $61EC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($042D)".
M $61EC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61EC,$02,$01
W $61EE,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $61F0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0431)".
M $61F0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61F0,$02,$01
M $61F2,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($61F2,$04)
B $61F2,$03,b$01

N $61F5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0436)".
M $61F5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61F5,$02,$01
M $61F7,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($61F7,$01)
B $61F7,$01,b$01

N $61F8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0439)".
M $61F8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61F8,$02,$01
M $61FA,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($61FA,$06)
B $61FA,$04,b$01

N $61FE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($043F)".
M $61FE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $61FE,$02,$01
M $6200,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($6200,$07)
B $6200,$05,b$01

N $6205 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0446)".
M $6205,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6205,$02,$01
M $6207,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($6207,$08)
B $6207,$05,b$01

N $620C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($044D)".
M $620C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $620C,$02,$01
M $620E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($620E,$01)
B $620E,$01,b$01

N $620F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0450)".
M $620F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $620F,$02,$01
W $6211,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $6213,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6213,$01)
B $6213,$01,b$01

N $6214 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0455)".
M $6214,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6214,$02,$01
M $6216,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6216,$06)
B $6216,$04,b$01

N $621A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($045B)".
M $621A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $621A,$02,$01
M $621C,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($621C,$04)
B $621C,$03,b$01

N $621F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0460)".
M $621F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $621F,$02,$01
M $6221,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6221,$06)
B $6221,$04,b$01

N $6225 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0466)".
M $6225,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6225,$02,$01
M $6227,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6227,$04)
B $6227,$03,b$01

N $622A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($046B)".
M $622A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $622A,$02,$01
M $622C,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($622C,$06)
B $622C,$04,b$01

N $6230 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0471)".
M $6230,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6230,$02,$01
M $6232,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6232,$06)
B $6232,$04,b$01

N $6236 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0477)".
M $6236,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6236,$02,$01
M $6238,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6238,$01)
B $6238,$01,b$01

N $6239 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($047A)".
M $6239,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6239,$02,$01
M $623B,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($623B,$07)
B $623B,$05,b$01

N $6240 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0481)".
M $6240,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6240,$02,$01
M $6242,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6242,$03)
B $6242,$02,b$01

N $6244 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0485)".
M $6244,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6244,$02,$01
M $6246,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6246,$01)
B $6246,$01,b$01

N $6247 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0488)".
M $6247,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6247,$02,$01
M $6249,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6249,$01)
B $6249,$01,b$01


g $624A Table Dictionary: "J"
@ $624A Table_Dictionary_J
D $624A All dictionary words starting with "J".

N $624A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($048B)".
M $624A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $624A,$02,$01
M $624C,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($624C,$04)
B $624C,$03,b$01

N $624F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0490)".
M $624F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $624F,$02,$01
M $6251,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6251,$03)
B $6251,$02,b$01


g $6253 Table Dictionary: "K"
@ $6253 Table_Dictionary_K
D $6253 All dictionary words starting with "K".

N $6253 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0494)".
M $6253,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6253,$02,$01
M $6255,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6255,$03)
B $6255,$02,b$01

N $6257 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0498)".
M $6257,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6257,$02,$01
M $6259,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6259,$02)
B $6259,$02,b$01

N $625B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($049C)".
M $625B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $625B,$02,$01
M $625D,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($625D,$03)
B $625D,$02,b$01

N $625F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04A0)".
M $625F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $625F,$02,$01
M $6261,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6261,$05)
B $6261,$04,b$01

N $6265 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04A6)".
M $6265,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6265,$02,$01
M $6267,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6267,$04)
B $6267,$03,b$01

N $626A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04AB)".
M $626A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $626A,$02,$01

N $626C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04AD)".
M $626C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $626C,$02,$01
M $626E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($626E,$01)
B $626E,$01,b$01


g $626F Table Dictionary: "L"
@ $626F Table_Dictionary_L
D $626F All dictionary words starting with "L".

N $626F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04B0)".
M $626F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $626F,$02,$01
W $6271,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $6273 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04B4)".
M $6273,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6273,$02,$01
M $6275,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6275,$04)
B $6275,$03,b$01

N $6278 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04B9)".
M $6278,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6278,$02,$01
M $627A,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($627A,$02)
B $627A,$02,b$01

N $627C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04BD)".
M $627C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $627C,$02,$01
M $627E,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($627E,$02)
B $627E,$02,b$01

N $6280 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04C1)".
M $6280,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6280,$02,$01
M $6282,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6282,$03)
B $6282,$02,b$01

N $6284 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04C5)".
M $6284,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6284,$02,$01
M $6286,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6286,$02)
B $6286,$02,b$01

N $6288 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04C9)".
M $6288,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6288,$02,$01
M $628A,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($628A,$03)
B $628A,$02,b$01

N $628C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04CD)".
M $628C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $628C,$02,$01
M $628E,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($628E,$06)
B $628E,$04,b$01

N $6292 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04D3)".
M $6292,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6292,$02,$01
M $6294,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6294,$04)
B $6294,$03,b$01

N $6297 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04D8)".
M $6297,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6297,$02,$01
M $6299,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6299,$02)
B $6299,$02,b$01

N $629B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04DC)".
M $629B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $629B,$02,$01
M $629D,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($629D,$06)
B $629D,$04,b$01

N $62A1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04E2)".
M $62A1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62A1,$02,$01
M $62A3,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62A3,$01)
B $62A3,$01,b$01

N $62A4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04E5)".
M $62A4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62A4,$02,$01
M $62A6,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($62A6,$04)
B $62A6,$03,b$01

N $62A9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04EA)".
M $62A9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62A9,$02,$01
M $62AB,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($62AB,$06)
B $62AB,$04,b$01

N $62AF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04F0)".
M $62AF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62AF,$02,$01
M $62B1,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($62B1,$03)
B $62B1,$02,b$01

N $62B3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04F4)".
M $62B3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62B3,$02,$01
M $62B5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62B5,$01)
B $62B5,$01,b$01

N $62B6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04F7)".
M $62B6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62B6,$02,$01
M $62B8,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62B8,$01)
B $62B8,$01,b$01

N $62B9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04FA)".
M $62B9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62B9,$02,$01

N $62BB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($04FC)".
M $62BB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62BB,$02,$01
M $62BD,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($62BD,$02)
B $62BD,$02,b$01

N $62BF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0500)".
M $62BF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62BF,$02,$01

N $62C1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0502)".
M $62C1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62C1,$02,$01
W $62C3,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $62C5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62C5,$01)
B $62C5,$01,b$01

N $62C6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0507)".
M $62C6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62C6,$02,$01
M $62C8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($62C8,$02)
B $62C8,$02,b$01

N $62CA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($050B)".
M $62CA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62CA,$02,$01
M $62CC,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($62CC,$03)
B $62CC,$02,b$01

N $62CE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($050F)".
M $62CE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62CE,$02,$01
M $62D0,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($62D0,$04)
B $62D0,$03,b$01

N $62D3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0514)".
M $62D3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62D3,$02,$01
M $62D5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62D5,$01)
B $62D5,$01,b$01

N $62D6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0517)".
M $62D6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62D6,$02,$01
M $62D8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($62D8,$02)
B $62D8,$02,b$01

N $62DA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($051B)".
M $62DA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62DA,$02,$01
M $62DC,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($62DC,$04)
B $62DC,$03,b$01

N $62DF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0520)".
M $62DF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62DF,$02,$01
M $62E1,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62E1,$01)
B $62E1,$01,b$01

N $62E2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0523)".
M $62E2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62E2,$02,$01
M $62E4,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($62E4,$02)
B $62E4,$02,b$01

N $62E6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0527)".
M $62E6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62E6,$02,$01
M $62E8,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62E8,$01)
B $62E8,$01,b$01

N $62E9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($052A)".
M $62E9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62E9,$02,$01
M $62EB,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($62EB,$04)
B $62EB,$03,b$01

N $62EE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($052F)".
M $62EE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62EE,$02,$01
M $62F0,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62F0,$01)
B $62F0,$01,b$01


g $62F1 Table Dictionary: "M"
@ $62F1 Table_Dictionary_M
D $62F1 All dictionary words starting with "M".

N $62F1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0532)".
M $62F1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62F1,$02,$01
W $62F3,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $62F5,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($62F5,$02)
B $62F5,$02,b$01

N $62F7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0538)".
M $62F7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62F7,$02,$01
M $62F9,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($62F9,$01)
B $62F9,$01,b$01

N $62FA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($053B)".
M $62FA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62FA,$02,$01
M $62FC,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($62FC,$02)
B $62FC,$02,b$01

N $62FE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($053F)".
M $62FE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $62FE,$02,$01
M $6300,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6300,$01)
B $6300,$01,b$01

N $6301 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0542)".
M $6301,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6301,$02,$01
M $6303,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6303,$03)
B $6303,$02,b$01

N $6305 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0546)".
M $6305,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6305,$02,$01
M $6307,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6307,$01)
B $6307,$01,b$01

N $6308 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0549)".
M $6308,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6308,$02,$01
M $630A,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($630A,$01)
B $630A,$01,b$01

N $630B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($054C)".
M $630B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $630B,$02,$01
M $630D,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($630D,$01)
B $630D,$01,b$01

N $630E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($054F)".
M $630E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $630E,$02,$01
M $6310,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6310,$02)
B $6310,$02,b$01

N $6312 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0553)".
M $6312,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6312,$02,$01
M $6314,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6314,$04)
B $6314,$03,b$01

N $6317 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0558)".
M $6317,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6317,$02,$01
M $6319,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6319,$01)
B $6319,$01,b$01

N $631A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($055B)".
M $631A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $631A,$02,$01
W $631C,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $631E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($631E,$01)
B $631E,$01,b$01

N $631F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0560)".
M $631F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $631F,$02,$01
M $6321,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6321,$02)
B $6321,$02,b$01

N $6323 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0564)".
M $6323,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6323,$02,$01
M $6325,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6325,$01)
B $6325,$01,b$01

N $6326 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0567)".
M $6326,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6326,$02,$01
M $6328,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6328,$03)
B $6328,$02,b$01

N $632A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($056B)".
M $632A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $632A,$02,$01
W $632C,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $632E,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($632E,$02)
B $632E,$02,b$01

N $6330 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0571)".
M $6330,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6330,$02,$01
M $6332,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6332,$02)
B $6332,$02,b$01

N $6334 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0575)".
M $6334,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6334,$02,$01
M $6336,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6336,$04)
B $6336,$03,b$01

N $6339 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($057A)".
M $6339,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6339,$02,$01
M $633B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($633B,$02)
B $633B,$02,b$01

N $633D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($057E)".
M $633D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $633D,$02,$01
M $633F,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($633F,$01)
B $633F,$01,b$01

N $6340 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0581)".
M $6340,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6340,$02,$01
M $6342,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6342,$01)
B $6342,$01,b$01

N $6343 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0584)".
M $6343,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6343,$02,$01
M $6345,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6345,$01)
B $6345,$01,b$01

N $6346 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0587)".
M $6346,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6346,$02,$01
M $6348,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6348,$03)
B $6348,$02,b$01

N $634A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($058B)".
M $634A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $634A,$02,$01
M $634C,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($634C,$04)
B $634C,$03,b$01

N $634F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0590)".
M $634F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $634F,$02,$01
M $6351,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6351,$02)
B $6351,$02,b$01

N $6353 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0594)".
M $6353,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6353,$02,$01
W $6355,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $6357,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6357,$01)
B $6357,$01,b$01


g $6358 Table Dictionary: "N"
@ $6358 Table_Dictionary_N
D $6358 All dictionary words starting with "N".

N $6358 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0599)".
M $6358,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6358,$02,$01
W $635A,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $635C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($059D)".
M $635C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $635C,$02,$01
M $635E,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($635E,$04)
B $635E,$03,b$01

N $6361 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05A2)".
M $6361,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6361,$02,$01
W $6363,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $6365,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6365,$01)
B $6365,$01,b$01

N $6366 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05A7)".
M $6366,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6366,$02,$01
M $6368,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6368,$03)
B $6368,$02,b$01

N $636A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05AB)".
M $636A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $636A,$02,$01
M $636C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($636C,$01)
B $636C,$01,b$01

N $636D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05AE)".
M $636D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $636D,$02,$01
M $636F,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($636F,$04)
B $636F,$03,b$01

N $6372 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05B3)".
M $6372,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6372,$02,$01
M $6374,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6374,$01)
B $6374,$01,b$01

N $6375 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05B6)".
M $6375,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6375,$02,$01
M $6377,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($6377,$07)
B $6377,$05,b$01

N $637C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05BD)".
M $637C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $637C,$02,$01
M $637E,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($637E,$05)
B $637E,$04,b$01

N $6382 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05C3)".
M $6382,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6382,$02,$01
M $6384,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6384,$03)
B $6384,$02,b$01

N $6386 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05C7)".
M $6386,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6386,$02,$01
M $6388,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6388,$04)
B $6388,$03,b$01

N $638B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05CC)".
M $638B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $638B,$02,$01
M $638D,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($638D,$02)
B $638D,$02,b$01

N $638F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05D0)".
M $638F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $638F,$02,$01
M $6391,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6391,$04)
B $6391,$03,b$01

N $6394 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05D5)".
M $6394,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6394,$02,$01
M $6396,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6396,$01)
B $6396,$01,b$01

N $6397 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05D8)".
M $6397,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6397,$02,$01
M $6399,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6399,$01)
B $6399,$01,b$01

N $639A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05DB)".
M $639A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $639A,$02,$01
M $639C,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($639C,$04)
B $639C,$03,b$01

N $639F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05E0)".
M $639F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $639F,$02,$01
M $63A1,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($63A1,$01)
B $63A1,$01,b$01

N $63A2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05E3)".
M $63A2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63A2,$02,$01
W $63A4,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $63A6,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($63A6,$01)
B $63A6,$01,b$01


g $63A7 Table Dictionary: "O"
@ $63A7 Table_Dictionary_O
D $63A7 All dictionary words starting with "O".

N $63A7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05E8)".
M $63A7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63A7,$02,$01
M $63A9,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($63A9,$02)
B $63A9,$02,b$01

N $63AB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05EC)".
M $63AB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63AB,$02,$01
M $63AD,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($63AD,$01)
B $63AD,$01,b$01

N $63AE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05EF)".
M $63AE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63AE,$02,$01
M $63B0,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($63B0,$01)
B $63B0,$01,b$01

N $63B1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05F2)".
M $63B1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63B1,$02,$01
M $63B3,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($63B3,$04)
B $63B3,$03,b$01

N $63B6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05F7)".
M $63B6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63B6,$02,$01
M $63B8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($63B8,$02)
B $63B8,$02,b$01

N $63BA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05FB)".
M $63BA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63BA,$02,$01
M $63BC,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($63BC,$02)
B $63BC,$02,b$01

N $63BE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($05FF)".
M $63BE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63BE,$02,$01
M $63C0,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($63C0,$01)
B $63C0,$01,b$01

N $63C1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0602)".
M $63C1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63C1,$02,$01

N $63C3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0604)".
M $63C3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63C3,$02,$01
M $63C5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($63C5,$01)
B $63C5,$01,b$01

N $63C6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0607)".
M $63C6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63C6,$02,$01
M $63C8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($63C8,$02)
B $63C8,$02,b$01

N $63CA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($060B)".
M $63CA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63CA,$02,$01
M $63CC,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($63CC,$03)
B $63CC,$02,b$01

N $63CE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($060F)".
M $63CE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63CE,$02,$01
M $63D0,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($63D0,$03)
B $63D0,$02,b$01

N $63D2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0613)".
M $63D2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63D2,$02,$01
M $63D4,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($63D4,$01)
B $63D4,$01,b$01

N $63D5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0616)".
M $63D5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63D5,$02,$01
M $63D7,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($63D7,$04)
B $63D7,$03,b$01

N $63DA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($061B)".
M $63DA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63DA,$02,$01
M $63DC,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($63DC,$04)
B $63DC,$03,b$01

N $63DF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0620)".
M $63DF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63DF,$02,$01
M $63E1,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($63E1,$02)
B $63E1,$02,b$01

N $63E3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0624)".
M $63E3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63E3,$02,$01
M $63E5,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($63E5,$04)
B $63E5,$03,b$01

N $63E8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0629)".
M $63E8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63E8,$02,$01
M $63EA,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($63EA,$03)
B $63EA,$02,b$01

N $63EC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($062D)".
M $63EC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63EC,$02,$01
M $63EE,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($63EE,$04)
B $63EE,$03,b$01

N $63F1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0632)".
M $63F1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63F1,$02,$01
M $63F3,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($63F3,$03)
B $63F3,$02,b$01


g $63F5 Table Dictionary: "P"
@ $63F5 Table_Dictionary_P
D $63F5 All dictionary words starting with "P".

N $63F5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0636)".
M $63F5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63F5,$02,$01
M $63F7,$06 Bit-packed letters (9 letters, 5 bits each):
. #BITGROUPS($63F7,$09)
B $63F7,$06,b$01

N $63FD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($063E)".
M $63FD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $63FD,$02,$01
M $63FF,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($63FF,$04)
B $63FF,$03,b$01

N $6402 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0643)".
M $6402,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6402,$02,$01
M $6404,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6404,$04)
B $6404,$03,b$01

N $6407 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0648)".
M $6407,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6407,$02,$01
M $6409,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6409,$03)
B $6409,$02,b$01

N $640B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($064C)".
M $640B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $640B,$02,$01
M $640D,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($640D,$08)
B $640D,$05,b$01

N $6412 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0653)".
M $6412,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6412,$02,$01
M $6414,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6414,$05)
B $6414,$04,b$01

N $6418 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0659)".
M $6418,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6418,$02,$01
M $641A,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($641A,$01)
B $641A,$01,b$01

N $641B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($065C)".
M $641B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $641B,$02,$01
M $641D,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($641D,$02)
B $641D,$02,b$01

N $641F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0660)".
M $641F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $641F,$02,$01
M $6421,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6421,$03)
B $6421,$02,b$01

N $6423 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0664)".
M $6423,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6423,$02,$01
M $6425,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6425,$01)
B $6425,$01,b$01

N $6426 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0667)".
M $6426,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6426,$02,$01
M $6428,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6428,$05)
B $6428,$04,b$01

N $642C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($066D)".
M $642C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $642C,$02,$01
M $642E,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($642E,$06)
B $642E,$04,b$01

N $6432 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0673)".
M $6432,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6432,$02,$01
M $6434,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6434,$03)
B $6434,$02,b$01

N $6436 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0677)".
M $6436,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6436,$02,$01
M $6438,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6438,$04)
B $6438,$03,b$01

N $643B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($067C)".
M $643B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $643B,$02,$01
M $643D,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($643D,$05)
B $643D,$04,b$01

N $6441 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0682)".
M $6441,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6441,$02,$01
M $6443,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6443,$04)
B $6443,$03,b$01

N $6446 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0687)".
M $6446,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6446,$02,$01
W $6448,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $644A,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($644A,$02)
B $644A,$02,b$01

N $644C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($068D)".
M $644C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $644C,$02,$01
M $644E,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($644E,$03)
B $644E,$02,b$01

N $6450 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0691)".
M $6450,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6450,$02,$01
M $6452,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6452,$02)
B $6452,$02,b$01

N $6454 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0695)".
M $6454,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6454,$02,$01
M $6456,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6456,$02)
B $6456,$02,b$01

N $6458 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0699)".
M $6458,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6458,$02,$01
M $645A,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($645A,$04)
B $645A,$03,b$01

N $645D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($069E)".
M $645D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $645D,$02,$01
M $645F,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($645F,$02)
B $645F,$02,b$01

N $6461 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06A2)".
M $6461,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6461,$02,$01
M $6463,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6463,$05)
B $6463,$04,b$01

N $6467 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06A8)".
M $6467,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6467,$02,$01
M $6469,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6469,$04)
B $6469,$03,b$01

N $646C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06AD)".
M $646C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $646C,$02,$01
M $646E,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($646E,$03)
B $646E,$02,b$01

N $6470 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06B1)".
M $6470,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6470,$02,$01
M $6472,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6472,$03)
B $6472,$02,b$01

N $6474 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06B5)".
M $6474,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6474,$02,$01
M $6476,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6476,$04)
B $6476,$03,b$01

N $6479 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06BA)".
M $6479,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6479,$02,$01
M $647B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($647B,$02)
B $647B,$02,b$01

N $647D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06BE)".
M $647D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $647D,$02,$01
M $647F,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($647F,$05)
B $647F,$04,b$01

N $6483 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06C4)".
M $6483,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6483,$02,$01
M $6485,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($6485,$07)
B $6485,$05,b$01

N $648A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06CB)".
M $648A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $648A,$02,$01
M $648C,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($648C,$03)
B $648C,$02,b$01

N $648E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06CF)".
M $648E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $648E,$02,$01
M $6490,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6490,$05)
B $6490,$04,b$01

N $6494 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06D5)".
M $6494,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6494,$02,$01
M $6496,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6496,$03)
B $6496,$02,b$01

N $6498 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06D9)".
M $6498,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6498,$02,$01
M $649A,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($649A,$05)
B $649A,$04,b$01

N $649E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06DF)".
M $649E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $649E,$02,$01
M $64A0,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($64A0,$01)
B $64A0,$01,b$01

N $64A1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06E2)".
M $64A1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64A1,$02,$01
M $64A3,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64A3,$03)
B $64A3,$02,b$01

N $64A5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06E6)".
M $64A5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64A5,$02,$01

N $64A7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06E8)".
M $64A7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64A7,$02,$01
M $64A9,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($64A9,$01)
B $64A9,$01,b$01


g $64AA Table Dictionary: "Q"
@ $64AA Table_Dictionary_Q
D $64AA All dictionary words starting with "Q".

N $64AA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06EB)".
M $64AA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64AA,$02,$01
W $64AC,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $64AE,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($64AE,$04)
B $64AE,$03,b$01

N $64B1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06F2)".
M $64B1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64B1,$02,$01
M $64B3,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($64B3,$02)
B $64B3,$02,b$01

N $64B5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06F6)".
M $64B5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64B5,$02,$01
M $64B7,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($64B7,$01)
B $64B7,$01,b$01


g $64B8 Table Dictionary: "R"
@ $64B8 Table_Dictionary_R
D $64B8 All dictionary words starting with "R".

N $64B8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06F9)".
M $64B8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64B8,$02,$01
M $64BA,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64BA,$03)
B $64BA,$02,b$01

N $64BC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($06FD)".
M $64BC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64BC,$02,$01
W $64BE,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $64C0,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64C0,$03)
B $64C0,$02,b$01

N $64C2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0703)".
M $64C2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64C2,$02,$01
M $64C4,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64C4,$03)
B $64C4,$02,b$01

N $64C6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0707)".
M $64C6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64C6,$02,$01
M $64C8,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($64C8,$01)
B $64C8,$01,b$01

N $64C9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($070A)".
M $64C9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64C9,$02,$01
M $64CB,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64CB,$03)
B $64CB,$02,b$01

N $64CD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($070E)".
M $64CD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64CD,$02,$01
M $64CF,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($64CF,$04)
B $64CF,$03,b$01

N $64D2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0713)".
M $64D2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64D2,$02,$01
M $64D4,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($64D4,$02)
B $64D4,$02,b$01

N $64D6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0717)".
M $64D6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64D6,$02,$01
M $64D8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($64D8,$02)
B $64D8,$02,b$01

N $64DA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($071B)".
M $64DA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64DA,$02,$01

N $64DC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($071D)".
M $64DC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64DC,$02,$01
M $64DE,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($64DE,$04)
B $64DE,$03,b$01

N $64E1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0722)".
M $64E1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64E1,$02,$01
M $64E3,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($64E3,$04)
B $64E3,$03,b$01

N $64E6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0727)".
M $64E6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64E6,$02,$01
M $64E8,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($64E8,$04)
B $64E8,$03,b$01

N $64EB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($072C)".
M $64EB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64EB,$02,$01

N $64ED Word #N(#PC-$5DBF,$04,$04): "#TOKEN($072E)".
M $64ED,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64ED,$02,$01
M $64EF,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64EF,$03)
B $64EF,$02,b$01

N $64F1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0732)".
M $64F1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64F1,$02,$01
M $64F3,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64F3,$03)
B $64F3,$02,b$01

N $64F5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0736)".
M $64F5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64F5,$02,$01
M $64F7,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($64F7,$04)
B $64F7,$03,b$01

N $64FA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($073B)".
M $64FA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64FA,$02,$01
M $64FC,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($64FC,$03)
B $64FC,$02,b$01

N $64FE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($073F)".
M $64FE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $64FE,$02,$01
M $6500,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6500,$03)
B $6500,$02,b$01

N $6502 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0743)".
M $6502,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6502,$02,$01
M $6504,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6504,$02)
B $6504,$02,b$01

N $6506 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0747)".
M $6506,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6506,$02,$01
M $6508,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6508,$02)
B $6508,$02,b$01

N $650A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($074B)".
M $650A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $650A,$02,$01
M $650C,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($650C,$06)
B $650C,$04,b$01

N $6510 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0751)".
M $6510,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6510,$02,$01
M $6512,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6512,$01)
B $6512,$01,b$01

N $6513 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0754)".
M $6513,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6513,$02,$01
M $6515,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6515,$06)
B $6515,$04,b$01


g $6519 Table Dictionary: "S"
@ $6519 Table_Dictionary_S
D $6519 All dictionary words starting with "S".

N $6519 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($075A)".
M $6519,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6519,$02,$01
W $651B,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $651D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($075E)".
M $651D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $651D,$02,$01
M $651F,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($651F,$03)
B $651F,$02,b$01

N $6521 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0762)".
M $6521,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6521,$02,$01
M $6523,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6523,$02)
B $6523,$02,b$01

N $6525 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0766)".
M $6525,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6525,$02,$01
M $6527,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6527,$02)
B $6527,$02,b$01

N $6529 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($076A)".
M $6529,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6529,$02,$01
M $652B,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($652B,$07)
B $652B,$05,b$01

N $6530 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0771)".
M $6530,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6530,$02,$01
M $6532,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6532,$03)
B $6532,$02,b$01

N $6534 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0775)".
M $6534,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6534,$02,$01
M $6536,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6536,$02)
B $6536,$02,b$01

N $6538 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0779)".
M $6538,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6538,$02,$01
W $653A,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $653C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($653C,$01)
B $653C,$01,b$01

N $653D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($077E)".
M $653D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $653D,$02,$01
M $653F,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($653F,$07)
B $653F,$05,b$01

N $6544 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0785)".
M $6544,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6544,$02,$01
W $6546,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $6548,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6548,$01)
B $6548,$01,b$01

N $6549 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($078A)".
M $6549,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6549,$02,$01
M $654B,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($654B,$04)
B $654B,$03,b$01

N $654E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($078F)".
M $654E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $654E,$02,$01
M $6550,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6550,$04)
B $6550,$03,b$01

N $6553 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0794)".
M $6553,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6553,$02,$01
M $6555,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6555,$01)
B $6555,$01,b$01

N $6556 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0797)".
M $6556,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6556,$02,$01
M $6558,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6558,$01)
B $6558,$01,b$01

N $6559 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($079A)".
M $6559,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6559,$02,$01
M $655B,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($655B,$01)
B $655B,$01,b$01

N $655C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($079D)".
M $655C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $655C,$02,$01
M $655E,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($655E,$04)
B $655E,$03,b$01

N $6561 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07A2)".
M $6561,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6561,$02,$01
M $6563,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6563,$01)
B $6563,$01,b$01

N $6564 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07A5)".
M $6564,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6564,$02,$01
M $6566,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6566,$02)
B $6566,$02,b$01

N $6568 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07A9)".
M $6568,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6568,$02,$01
M $656A,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($656A,$05)
B $656A,$04,b$01

N $656E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07AF)".
M $656E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $656E,$02,$01
M $6570,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6570,$04)
B $6570,$03,b$01

N $6573 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07B4)".
M $6573,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6573,$02,$01
M $6575,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6575,$01)
B $6575,$01,b$01

N $6576 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07B7)".
M $6576,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6576,$02,$01
M $6578,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6578,$02)
B $6578,$02,b$01

N $657A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07BB)".
M $657A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $657A,$02,$01
M $657C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($657C,$01)
B $657C,$01,b$01

N $657D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07BE)".
M $657D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $657D,$02,$01
M $657F,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($657F,$03)
B $657F,$02,b$01

N $6581 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07C2)".
M $6581,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6581,$02,$01
M $6583,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6583,$05)
B $6583,$04,b$01

N $6587 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07C8)".
M $6587,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6587,$02,$01
M $6589,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6589,$02)
B $6589,$02,b$01

N $658B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07CC)".
M $658B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $658B,$02,$01
M $658D,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($658D,$04)
B $658D,$03,b$01

N $6590 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07D1)".
M $6590,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6590,$02,$01
M $6592,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6592,$03)
B $6592,$02,b$01

N $6594 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07D5)".
M $6594,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6594,$02,$01
M $6596,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6596,$02)
B $6596,$02,b$01

N $6598 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07D9)".
M $6598,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6598,$02,$01
M $659A,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($659A,$02)
B $659A,$02,b$01

N $659C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07DD)".
M $659C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $659C,$02,$01
M $659E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($659E,$01)
B $659E,$01,b$01

N $659F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07E0)".
M $659F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $659F,$02,$01
M $65A1,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($65A1,$04)
B $65A1,$03,b$01

N $65A4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07E5)".
M $65A4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65A4,$02,$01
M $65A6,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($65A6,$04)
B $65A6,$03,b$01

N $65A9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07EA)".
M $65A9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65A9,$02,$01
M $65AB,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($65AB,$05)
B $65AB,$04,b$01

N $65AF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07F0)".
M $65AF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65AF,$02,$01
M $65B1,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($65B1,$03)
B $65B1,$02,b$01

N $65B3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07F4)".
M $65B3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65B3,$02,$01
M $65B5,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($65B5,$04)
B $65B5,$03,b$01

N $65B8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07F9)".
M $65B8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65B8,$02,$01
M $65BA,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($65BA,$01)
B $65BA,$01,b$01

N $65BB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($07FC)".
M $65BB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65BB,$02,$01
M $65BD,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($65BD,$02)
B $65BD,$02,b$01

N $65BF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0800)".
M $65BF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65BF,$02,$01
M $65C1,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($65C1,$01)
B $65C1,$01,b$01

N $65C2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0803)".
M $65C2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65C2,$02,$01
M $65C4,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($65C4,$03)
B $65C4,$02,b$01

N $65C6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0807)".
M $65C6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65C6,$02,$01
M $65C8,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($65C8,$01)
B $65C8,$01,b$01

N $65C9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($080A)".
M $65C9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65C9,$02,$01
M $65CB,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($65CB,$02)
B $65CB,$02,b$01

N $65CD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($080E)".
M $65CD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65CD,$02,$01
M $65CF,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($65CF,$03)
B $65CF,$02,b$01

N $65D1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0812)".
M $65D1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65D1,$02,$01
M $65D3,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($65D3,$03)
B $65D3,$02,b$01

N $65D5 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0816)".
M $65D5,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65D5,$02,$01
M $65D7,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($65D7,$03)
B $65D7,$02,b$01

N $65D9 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($081A)".
M $65D9,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65D9,$02,$01
M $65DB,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($65DB,$02)
B $65DB,$02,b$01

N $65DD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($081E)".
M $65DD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65DD,$02,$01
M $65DF,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($65DF,$04)
B $65DF,$03,b$01

N $65E2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0823)".
M $65E2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65E2,$02,$01
M $65E4,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($65E4,$02)
B $65E4,$02,b$01

N $65E6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0827)".
M $65E6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65E6,$02,$01
M $65E8,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($65E8,$04)
B $65E8,$03,b$01

N $65EB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($082C)".
M $65EB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65EB,$02,$01
W $65ED,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $65EF,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($65EF,$01)
B $65EF,$01,b$01

N $65F0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0831)".
M $65F0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65F0,$02,$01
M $65F2,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($65F2,$05)
B $65F2,$04,b$01

N $65F6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0837)".
M $65F6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65F6,$02,$01
M $65F8,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($65F8,$04)
B $65F8,$03,b$01

N $65FB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($083C)".
M $65FB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65FB,$02,$01

N $65FD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($083E)".
M $65FD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $65FD,$02,$01
M $65FF,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($65FF,$04)
B $65FF,$03,b$01

N $6602 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0843)".
M $6602,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6602,$02,$01
M $6604,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6604,$01)
B $6604,$01,b$01

N $6605 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0846)".
M $6605,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6605,$02,$01
M $6607,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6607,$06)
B $6607,$04,b$01

N $660B Word #N(#PC-$5DBF,$04,$04): "#TOKEN($084C)".
M $660B,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $660B,$02,$01
M $660D,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($660D,$01)
B $660D,$01,b$01

N $660E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($084F)".
M $660E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $660E,$02,$01
M $6610,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6610,$06)
B $6610,$04,b$01

N $6614 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0855)".
M $6614,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6614,$02,$01
M $6616,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6616,$03)
B $6616,$02,b$01

N $6618 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0859)".
M $6618,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6618,$02,$01
M $661A,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($661A,$03)
B $661A,$02,b$01

N $661C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($085D)".
M $661C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $661C,$02,$01
M $661E,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($661E,$03)
B $661E,$02,b$01

N $6620 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0861)".
M $6620,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6620,$02,$01
M $6622,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6622,$02)
B $6622,$02,b$01

N $6624 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0865)".
M $6624,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6624,$02,$01
M $6626,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6626,$03)
B $6626,$02,b$01

N $6628 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0869)".
M $6628,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6628,$02,$01
M $662A,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($662A,$03)
B $662A,$02,b$01

N $662C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($086D)".
M $662C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $662C,$02,$01
M $662E,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($662E,$04)
B $662E,$03,b$01

N $6631 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0872)".
M $6631,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6631,$02,$01
M $6633,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6633,$01)
B $6633,$01,b$01

N $6634 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0875)".
M $6634,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6634,$02,$01
M $6636,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6636,$02)
B $6636,$02,b$01

N $6638 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0879)".
M $6638,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6638,$02,$01
W $663A,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
M $663C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($663C,$01)
B $663C,$01,b$01

N $663D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($087E)".
M $663D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $663D,$02,$01
M $663F,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($663F,$03)
B $663F,$02,b$01


g $6641 Table Dictionary: "T"
@ $6641 Table_Dictionary_T
D $6641 All dictionary words starting with "T".

N $6641 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0882)".
M $6641,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6641,$02,$01
M $6643,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($6643,$04)
B $6643,$03,b$01

N $6646 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0887)".
M $6646,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6646,$02,$01
M $6648,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6648,$02)
B $6648,$02,b$01

N $664A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($088B)".
M $664A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $664A,$02,$01
M $664C,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($664C,$02)
B $664C,$02,b$01

N $664E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($088F)".
M $664E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $664E,$02,$01
M $6650,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6650,$03)
B $6650,$02,b$01

N $6652 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0893)".
M $6652,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6652,$02,$01
M $6654,$04 Bit-packed letters (6 letters, 5 bits each):
. #BITGROUPS($6654,$06)
B $6654,$04,b$01

N $6658 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0899)".
M $6658,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6658,$02,$01
M $665A,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($665A,$03)
B $665A,$02,b$01

N $665C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($089D)".
M $665C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $665C,$02,$01
M $665E,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($665E,$01)
B $665E,$01,b$01

N $665F Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08A0)".
M $665F,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $665F,$02,$01
M $6661,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6661,$02)
B $6661,$02,b$01

N $6663 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08A4)".
M $6663,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6663,$02,$01
M $6665,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6665,$01)
B $6665,$01,b$01

N $6666 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08A7)".
M $6666,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6666,$02,$01
M $6668,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6668,$01)
B $6668,$01,b$01

N $6669 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08AA)".
M $6669,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6669,$02,$01
M $666B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($666B,$02)
B $666B,$02,b$01

N $666D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08AE)".
M $666D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $666D,$02,$01
M $666F,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($666F,$04)
B $666F,$03,b$01

N $6672 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08B3)".
M $6672,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6672,$02,$01
M $6674,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6674,$01)
B $6674,$01,b$01

N $6675 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08B6)".
M $6675,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6675,$02,$01
M $6677,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6677,$01)
B $6677,$01,b$01

N $6678 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08B9)".
M $6678,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6678,$02,$01
M $667A,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($667A,$02)
B $667A,$02,b$01

N $667C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08BD)".
M $667C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $667C,$02,$01
M $667E,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($667E,$02)
B $667E,$02,b$01

N $6680 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08C1)".
M $6680,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6680,$02,$01
M $6682,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6682,$01)
B $6682,$01,b$01

N $6683 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08C4)".
M $6683,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6683,$02,$01
M $6685,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6685,$05)
B $6685,$04,b$01

N $6689 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08CA)".
M $6689,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6689,$02,$01
M $668B,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($668B,$03)
B $668B,$02,b$01

N $668D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08CE)".
M $668D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $668D,$02,$01
M $668F,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($668F,$04)
B $668F,$03,b$01

N $6692 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08D3)".
M $6692,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6692,$02,$01
M $6694,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6694,$03)
B $6694,$02,b$01

N $6696 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08D7)".
M $6696,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6696,$02,$01
M $6698,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6698,$02)
B $6698,$02,b$01

N $669A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08DB)".
M $669A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $669A,$02,$01
M $669C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($669C,$01)
B $669C,$01,b$01

N $669D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08DE)".
M $669D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $669D,$02,$01
M $669F,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($669F,$01)
B $669F,$01,b$01

N $66A0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08E1)".
M $66A0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66A0,$02,$01
M $66A2,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($66A2,$01)
B $66A2,$01,b$01

N $66A3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08E4)".
M $66A3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66A3,$02,$01
M $66A5,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($66A5,$01)
B $66A5,$01,b$01

N $66A6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08E7)".
M $66A6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66A6,$02,$01
M $66A8,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($66A8,$02)
B $66A8,$02,b$01

N $66AA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08EB)".
M $66AA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66AA,$02,$01
M $66AC,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($66AC,$04)
B $66AC,$03,b$01

N $66AF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08F0)".
M $66AF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66AF,$02,$01
M $66B1,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($66B1,$02)
B $66B1,$02,b$01

N $66B3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08F4)".
M $66B3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66B3,$02,$01
M $66B5,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($66B5,$04)
B $66B5,$03,b$01

N $66B8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08F9)".
M $66B8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66B8,$02,$01
M $66BA,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($66BA,$04)
B $66BA,$03,b$01

N $66BD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($08FE)".
M $66BD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66BD,$02,$01
M $66BF,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($66BF,$01)
B $66BF,$01,b$01

N $66C0 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0901)".
M $66C0,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66C0,$02,$01
M $66C2,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($66C2,$01)
B $66C2,$01,b$01

N $66C3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0904)".
M $66C3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66C3,$02,$01
M $66C5,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($66C5,$03)
B $66C5,$02,b$01

N $66C7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0908)".
M $66C7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66C7,$02,$01
M $66C9,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($66C9,$02)
B $66C9,$02,b$01


g $66CB Table Dictionary: "U"
@ $66CB Table_Dictionary_U
D $66CB All dictionary words starting with "U".

N $66CB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($090C)".
M $66CB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66CB,$02,$01
W $66CD,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $66CF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0910)".
M $66CF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66CF,$02,$01
M $66D1,$07 Bit-packed letters (10 letters, 5 bits each):
. #BITGROUPS($66D1,$0A)
B $66D1,$07,b$01

N $66D8 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0919)".
M $66D8,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66D8,$02,$01
M $66DA,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($66DA,$03)
B $66DA,$02,b$01

N $66DC Word #N(#PC-$5DBF,$04,$04): "#TOKEN($091D)".
M $66DC,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66DC,$02,$01
M $66DE,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($66DE,$08)
B $66DE,$05,b$01

N $66E3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0924)".
M $66E3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66E3,$02,$01
M $66E5,$05 Bit-packed letters (8 letters, 5 bits each):
. #BITGROUPS($66E5,$08)
B $66E5,$05,b$01

N $66EA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($092B)".
M $66EA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66EA,$02,$01
M $66EC,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($66EC,$04)
B $66EC,$03,b$01

N $66EF Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0930)".
M $66EF,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66EF,$02,$01
M $66F1,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($66F1,$02)
B $66F1,$02,b$01

N $66F3 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0934)".
M $66F3,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66F3,$02,$01
M $66F5,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($66F5,$02)
B $66F5,$02,b$01

N $66F7 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0938)".
M $66F7,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66F7,$02,$01
M $66F9,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($66F9,$03)
B $66F9,$02,b$01

N $66FB Word #N(#PC-$5DBF,$04,$04): "#TOKEN($093C)".
M $66FB,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66FB,$02,$01
M $66FD,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($66FD,$01)
B $66FD,$01,b$01

N $66FE Word #N(#PC-$5DBF,$04,$04): "#TOKEN($093F)".
M $66FE,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $66FE,$02,$01
M $6700,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6700,$02)
B $6700,$02,b$01

N $6702 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0943)".
M $6702,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6702,$02,$01
M $6704,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6704,$02)
B $6704,$02,b$01

N $6706 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0947)".
M $6706,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6706,$02,$01
M $6708,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6708,$02)
B $6708,$02,b$01


g $670A Table Dictionary: "V"
@ $670A Table_Dictionary_V
D $670A All dictionary words starting with "V".

N $670A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($094B)".
M $670A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $670A,$02,$01
M $670C,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($670C,$03)
B $670C,$02,b$01

N $670E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($094F)".
M $670E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $670E,$02,$01
M $6710,$05 Bit-packed letters (7 letters, 5 bits each):
. #BITGROUPS($6710,$07)
B $6710,$05,b$01

N $6715 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0956)".
M $6715,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6715,$02,$01
M $6717,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6717,$03)
B $6717,$02,b$01


g $6719 Table Dictionary: "W"
@ $6719 Table_Dictionary_W
D $6719 All dictionary words starting with "W".

N $6719 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($095A)".
M $6719,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6719,$02,$01
W $671B,$02 Synonym reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".

N $671D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($095E)".
M $671D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $671D,$02,$01
M $671F,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($671F,$03)
B $671F,$02,b$01

N $6721 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0962)".
M $6721,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6721,$02,$01
M $6723,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6723,$02)
B $6723,$02,b$01

N $6725 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0966)".
M $6725,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6725,$02,$01
M $6727,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6727,$02)
B $6727,$02,b$01

N $6729 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($096A)".
M $6729,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6729,$02,$01
M $672B,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($672B,$01)
B $672B,$01,b$01

N $672C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($096D)".
M $672C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $672C,$02,$01
M $672E,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($672E,$03)
B $672E,$02,b$01

N $6730 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0971)".
M $6730,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6730,$02,$01
M $6732,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6732,$03)
B $6732,$02,b$01

N $6734 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0975)".
M $6734,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6734,$02,$01
M $6736,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6736,$01)
B $6736,$01,b$01

N $6737 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0978)".
M $6737,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6737,$02,$01
M $6739,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6739,$01)
B $6739,$01,b$01

N $673A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($097B)".
M $673A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $673A,$02,$01
M $673C,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($673C,$01)
B $673C,$01,b$01

N $673D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($097E)".
M $673D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $673D,$02,$01
M $673F,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($673F,$04)
B $673F,$03,b$01

N $6742 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0983)".
M $6742,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6742,$02,$01
M $6744,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6744,$01)
B $6744,$01,b$01

N $6745 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0986)".
M $6745,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6745,$02,$01
M $6747,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6747,$02)
B $6747,$02,b$01

N $6749 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($098A)".
M $6749,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6749,$02,$01
M $674B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($674B,$02)
B $674B,$02,b$01

N $674D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($098E)".
M $674D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $674D,$02,$01
M $674F,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($674F,$02)
B $674F,$02,b$01

N $6751 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0992)".
M $6751,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6751,$02,$01
M $6753,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6753,$02)
B $6753,$02,b$01

N $6755 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($0996)".
M $6755,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6755,$02,$01
M $6757,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6757,$03)
B $6757,$02,b$01

N $6759 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($099A)".
M $6759,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6759,$02,$01
M $675B,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($675B,$02)
B $675B,$02,b$01

N $675D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($099E)".
M $675D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $675D,$02,$01
M $675F,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($675F,$02)
B $675F,$02,b$01

N $6761 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09A2)".
M $6761,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6761,$02,$01
M $6763,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6763,$03)
B $6763,$02,b$01

N $6765 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09A6)".
M $6765,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6765,$02,$01
M $6767,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6767,$01)
B $6767,$01,b$01

N $6768 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09A9)".
M $6768,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6768,$02,$01
M $676A,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($676A,$03)
B $676A,$02,b$01

N $676C Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09AD)".
M $676C,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $676C,$02,$01
M $676E,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($676E,$02)
B $676E,$02,b$01

N $6770 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09B1)".
M $6770,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6770,$02,$01
M $6772,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6772,$02)
B $6772,$02,b$01

N $6774 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09B5)".
M $6774,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6774,$02,$01
M $6776,$04 Bit-packed letters (5 letters, 5 bits each):
. #BITGROUPS($6776,$05)
B $6776,$04,b$01

N $677A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09BB)".
M $677A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $677A,$02,$01
M $677C,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($677C,$02)
B $677C,$02,b$01

N $677E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09BF)".
M $677E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $677E,$02,$01
M $6780,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6780,$02)
B $6780,$02,b$01

N $6782 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09C3)".
M $6782,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6782,$02,$01
M $6784,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($6784,$03)
B $6784,$02,b$01

N $6786 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09C7)".
M $6786,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6786,$02,$01
M $6788,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($6788,$01)
B $6788,$01,b$01

N $6789 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09CA)".
M $6789,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6789,$02,$01
M $678B,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($678B,$03)
B $678B,$02,b$01

N $678D Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09CE)".
M $678D,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $678D,$02,$01
M $678F,$03 Bit-packed letters (4 letters, 5 bits each):
. #BITGROUPS($678F,$04)
B $678F,$03,b$01

N $6792 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09D3)".
M $6792,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6792,$02,$01
M $6794,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6794,$02)
B $6794,$02,b$01

N $6796 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09D7)".
M $6796,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $6796,$02,$01
M $6798,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($6798,$02)
B $6798,$02,b$01

N $679A Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09DB)".
M $679A,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $679A,$02,$01
M $679C,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($679C,$02)
B $679C,$02,b$01


g $679E Table Dictionary: "X"
@ $679E Table_Dictionary_X
D $679E All dictionary words starting with "X".

N $679E Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09DF)".
M $679E,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $679E,$02,$01
M $67A0,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($67A0,$02)
B $67A0,$02,b$01


g $67A2 Table Dictionary: "Y"
@ $67A2 Table_Dictionary_Y
D $67A2 All dictionary words starting with "Y".

N $67A2 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09E3)".
M $67A2,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $67A2,$02,$01
M $67A4,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($67A4,$03)
B $67A4,$02,b$01

N $67A6 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09E7)".
M $67A6,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $67A6,$02,$01
M $67A8,$02 Bit-packed letters (3 letters, 5 bits each):
. #BITGROUPS($67A8,$03)
B $67A8,$02,b$01

N $67AA Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09EB)".
M $67AA,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $67AA,$02,$01
M $67AC,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($67AC,$01)
B $67AC,$01,b$01

N $67AD Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09EE)".
M $67AD,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $67AD,$02,$01
M $67AF,$02 Bit-packed letters (2 letters, 5 bits each):
. #BITGROUPS($67AF,$02)
B $67AF,$02,b$01

N $67B1 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09F2)".
M $67B1,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $67B1,$02,$01
M $67B3,$01 Bit-packed letters (1 letters, 5 bits each):
. #BITGROUPS($67B3,$01)
B $67B3,$01,b$01


g $67B4 Table Dictionary: "Z"
@ $67B4 Table_Dictionary_Z
D $67B4 All dictionary words starting with "Z".

N $67B4 Word #N(#PC-$5DBF,$04,$04): "#TOKEN($09F5)".
M $67B4,$02 Word configuration:
. #TABLE(default,centre,centre)
. { =h Type | #WORDTYPES(#PEEK(#PC)) }
. { =h Flection | #N(#PEEK(#PC)&$0F) }
. { =h Synonym | #IF((#PEEK(#PC+$01)&$80)>>$07)(YES,NO) }
. { =h Letters From Previous | #N((#PEEK(#PC+$01)&$70)>>$04) }
. { =h Length | #N(#PEEK(#PC+$01)&$0F) }
. TABLE#
B $67B4,$02,$01

B $67B6,$01 Terminator.

g $67B7 Table: Common Words
@ $67B7 label=Table_CommonWords
W $67B7,$02 Reference: "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
L $67B7,$02,$20

b $680B
b $682A
b $6830
b $68B1
b $68BC
b $68D1

b $68DD
  $68DD,$01,b$01

w $68DE

b $68E4
b $68E9

b $6929

b $6D9A
b $71ED

b $7207
b $7224
b $722D

b $7BC2
b $7BD7
b $7C9E
b $7CE7
b $7C4A

b $7E27

g $8259

g $840B Table: Locations
@ $840B label=Table_Locations
W $840B,$02 Room #N((#PC-$840B)/$02): "#ROOM((#PC-$840B)/$02)".
L $840B,$02,$6B

g $84E1 Room #N$00: "#ROOM$00"
@ $84E1 label=Room_00
B $84E1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $84E2,$02
W $84E4,$02
W $84E6,$02
W $84E8,$02
B $84EA,$01 Terminator.

g $84EB Room #N$01: "#ROOM$01"
@ $84EB label=Room_01
B $84EB,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $84EC,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $84EE,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $84F0,$02
W $84F2,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
B $84F4,$01 Terminator.

g $84F5 Room #N$02: "#ROOM$02"
@ $84F5 label=Room_02
B $84F5,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $84F6,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $84F8,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $84FA,$02
W $84FC,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
B $84FE,$01 Terminator.

g $84FF Room #N$03: "#ROOM$03"
@ $84FF label=Room_03
B $84FF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8500,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8502,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8504,$02
W $8506,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
B $8508,$01 Terminator.

g $8509 Room #N$04: "#ROOM$04"
@ $8509 label=Room_04
B $8509,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $850A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $850C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $850E,$02
W $8510,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
B $8512,$01 Terminator.

g $8513 Room #N$05: "#ROOM$05"
@ $8513 label=Room_05
B $8513,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8514,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8516,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8518,$02
W $851A,$02
N $851C Room exits:
B $851C,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($851C) }
. TABLE#
B $851F,$01 Terminator.

g $8520 Room #N$06: "#ROOM$06"
@ $8520 label=Room_06
B $8520,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8521,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8523,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8525,$02
W $8527,$02
N $8529 Room exits:
B $8529,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8529) }
. { #MOVEMENT($852C) }
. TABLE#
B $852F,$01 Terminator.

g $8530 Room #N$07: "#ROOM$07"
@ $8530 label=Room_07
B $8530,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8531,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8533,$02
W $8535,$02
W $8537,$02
N $8539 Room exits:
B $8539,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8539) }
. { #MOVEMENT($853C) }
. TABLE#
B $853F,$01 Terminator.

g $8540 Room #N$08: "#ROOM$08"
@ $8540 label=Room_08
B $8540,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8541,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8543,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8545,$02
W $8547,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8549 Room exits:
B $8549,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8549) }
. { #MOVEMENT($854C) }
. TABLE#
B $854F,$01 Terminator.

g $8550 Room #N$09: "#ROOM$09"
@ $8550 label=Room_09
B $8550,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8551,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8553,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8555,$02
W $8557,$02
N $8559 Room exits:
B $8559,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8559) }
. TABLE#
B $855C,$01 Terminator.

g $855D Room #N$0A: "#ROOM$0A"
@ $855D label=Room_10
B $855D,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $855E,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8560,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8562,$02
W $8564,$02
N $8566 Room exits:
B $8566,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8566) }
. TABLE#
B $8569,$01 Terminator.

g $856A Room #N$0B: "#ROOM$0B"
@ $856A label=Room_11
B $856A,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $856B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $856D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $856F,$02
W $8571,$02
N $8573 Room exits:
B $8573,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8573) }
. TABLE#
B $8576,$01 Terminator.

g $8577 Room #N$0C: "#ROOM$0C"
@ $8577 label=Room_12
B $8577,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8578,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $857A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $857C,$02
W $857E,$02
N $8580 Room exits:
B $8580,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8580) }
. TABLE#
B $8583,$01 Terminator.

g $8584 Room #N$0D: "#ROOM$0D"
@ $8584 label=Room_13
B $8584,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8585,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8587,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8589,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $858B,$02
N $858D Room exits:
B $858D,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($858D) }
. TABLE#
B $8590,$01 Terminator.

g $8591 Room #N$0E: "#ROOM$0E"
@ $8591 label=Room_14
B $8591,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8592,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8594,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8596,$02
W $8598,$02
N $859A Room exits:
B $859A,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($859A) }
. TABLE#
B $859D,$01 Terminator.

g $859E Room #N$0F: "#ROOM$0F"
@ $859E label=Room_15
B $859E,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $859F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85A1,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85A3,$02
W $85A5,$02
N $85A7 Room exits:
B $85A7,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85A7) }
. { #MOVEMENT($85AA) }
. TABLE#
B $85AD,$01 Terminator.

g $85AE Room #N$10: "#ROOM$10"
@ $85AE label=Room_16
B $85AE,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85AF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85B1,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85B3,$02
W $85B5,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $85B7 Room exits:
B $85B7,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85B7) }
. { #MOVEMENT($85BA) }
. TABLE#
B $85BD,$01 Terminator.

g $85BE Room #N$11: "#ROOM$11"
@ $85BE label=Room_17
B $85BE,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85BF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85C1,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85C3,$02
W $85C5,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $85C7 Room exits:
B $85C7,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85C7) }
. TABLE#
B $85CA,$01 Terminator.

g $85CB Room #N$12: "#ROOM$12"
@ $85CB label=Room_18
B $85CB,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85CC,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85CE,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85D0,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85D2,$02
N $85D4 Room exits:
B $85D4,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85D4) }
. TABLE#
B $85D7,$01 Terminator.

g $85D8 Room #N$13: "#ROOM$13"
@ $85D8 label=Room_19
B $85D8,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85D9,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85DB,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85DD,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85DF,$02
N $85E1 Room exits:
B $85E1,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85E1) }
. { #MOVEMENT($85E4) }
. TABLE#
B $85E7,$01 Terminator.

g $85E8 Room #N$14: "#ROOM$14"
@ $85E8 label=Room_20
B $85E8,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85E9,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85EB,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85ED,$02
W $85EF,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $85F1 Room exits:
B $85F1,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85F1) }
. { #MOVEMENT($85F4) }
. TABLE#
B $85F7,$01 Terminator.

g $85F8 Room #N$15: "#ROOM$15"
@ $85F8 label=Room_21
B $85F8,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85F9,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85FB,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $85FD,$02
W $85FF,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8601 Room exits:
B $8601,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8601) }
. { #MOVEMENT($8604) }
. TABLE#
B $8607,$01 Terminator.

g $8608 Room #N$16: "#ROOM$16"
@ $8608 label=Room_22
B $8608,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8609,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $860B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $860D,$02
W $860F,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8611 Room exits:
B $8611,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8611) }
. { #MOVEMENT($8614) }
. TABLE#
B $8617,$01 Terminator.

g $8618 Room #N$17: "#ROOM$17"
@ $8618 label=Room_23
B $8618,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8619,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $861B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $861D,$02
W $861F,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8621 Room exits:
B $8621,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8621) }
. TABLE#
B $8624,$01 Terminator.

g $8625 Room #N$18: "#ROOM$18"
@ $8625 label=Room_24
B $8625,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8626,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8628,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $862A,$02
W $862C,$02
N $862E Room exits:
B $862E,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($862E) }
. TABLE#
B $8631,$01 Terminator.

g $8632 Room #N$19: "#ROOM$19"
@ $8632 label=Room_25
B $8632,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8633,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8635,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8637,$02
W $8639,$02
N $863B Room exits:
B $863B,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($863B) }
. { #MOVEMENT($863E) }
. TABLE#
B $8641,$01 Terminator.

g $8642 Room #N$1A: "#ROOM$1A"
@ $8642 label=Room_26
B $8642,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8643,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8645,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8647,$02
W $8649,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $864B Room exits:
B $864B,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($864B) }
. { #MOVEMENT($864E) }
. TABLE#
B $8651,$01 Terminator.

g $8652 Room #N$1B: "#ROOM$1B"
@ $8652 label=Room_27
B $8652,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8653,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8655,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8657,$02
W $8659,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $865B Room exits:
B $865B,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($865B) }
. TABLE#
B $865E,$01 Terminator.

g $865F Room #N$1C: "#ROOM$1C"
@ $865F label=Room_28
B $865F,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8660,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8662,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8664,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8666,$02
N $8668 Room exits:
B $8668,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8668) }
. TABLE#
B $866B,$01 Terminator.

g $866C Room #N$1D: "#ROOM$1D"
@ $866C label=Room_29
B $866C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $866D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $866F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8671,$02
W $8673,$02
N $8675 Room exits:
B $8675,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8675) }
. { #MOVEMENT($8678) }
. TABLE#
B $867B,$01 Terminator.

g $867C Room #N$1E: "#ROOM$1E"
@ $867C label=Room_30
B $867C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $867D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $867F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8681,$02
W $8683,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8685 Room exits:
B $8685,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8685) }
. { #MOVEMENT($8688) }
. TABLE#
B $868B,$01 Terminator.

g $868C Room #N$1F: "#ROOM$1F"
@ $868C label=Room_31
B $868C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $868D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $868F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8691,$02
W $8693,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8695 Room exits:
B $8695,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8695) }
. TABLE#
B $8698,$01 Terminator.

g $8699 Room #N$20: "#ROOM$20"
@ $8699 label=Room_32
B $8699,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $869A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $869C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $869E,$02
W $86A0,$02
N $86A2 Room exits:
B $86A2,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86A2) }
. { #MOVEMENT($86A5) }
. TABLE#
B $86A8,$01 Terminator.

g $86A9 Room #N$21: "#ROOM$21"
@ $86A9 label=Room_33
B $86A9,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86AA,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86AC,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86AE,$02
W $86B0,$02
N $86B2 Room exits:
B $86B2,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86B2) }
. { #MOVEMENT($86B5) }
. { #MOVEMENT($86B8) }
. TABLE#
B $86BB,$01 Terminator.

g $86BC Room #N$22: "#ROOM$22"
@ $86BC label=Room_34
B $86BC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86BD,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86BF,$02
W $86C1,$02
W $86C3,$02
N $86C5 Room exits:
B $86C5,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86C5) }
. { #MOVEMENT($86C8) }
. { #MOVEMENT($86CB) }
. { #MOVEMENT($86CE) }
. TABLE#
B $86D1,$01 Terminator.

g $86D2 Room #N$23: "#ROOM$23"
@ $86D2 label=Room_35
B $86D2,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86D3,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86D5,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86D7,$02
W $86D9,$02
N $86DB Room exits:
B $86DB,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86DB) }
. { #MOVEMENT($86DE) }
. TABLE#
B $86E1,$01 Terminator.

g $86E2 Room #N$24: "#ROOM$24"
@ $86E2 label=Room_36
B $86E2,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86E3,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86E5,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86E7,$02
W $86E9,$02
N $86EB Room exits:
B $86EB,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86EB) }
. { #MOVEMENT($86EE) }
. TABLE#
B $86F1,$01 Terminator.

g $86F2 Room #N$25: "#ROOM$25"
@ $86F2 label=Room_37
B $86F2,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86F3,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86F5,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86F7,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $86F9,$02
N $86FB Room exits:
B $86FB,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86FB) }
. TABLE#
B $86FE,$01 Terminator.

g $86FF Room #N$26: "#ROOM$26"
@ $86FF label=Room_38
B $86FF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8700,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8702,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8704,$02
W $8706,$02
N $8708 Room exits:
B $8708,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8708) }
. TABLE#
B $870B,$01 Terminator.

g $870C Room #N$27: "#ROOM$27"
@ $870C label=Room_39
B $870C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $870D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $870F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8711,$02
W $8713,$02
N $8715 Room exits:
B $8715,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8715) }
. TABLE#
B $8718,$01 Terminator.

g $8719 Room #N$28: "#ROOM$28"
@ $8719 label=Room_40
B $8719,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $871A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $871C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $871E,$02
W $8720,$02
N $8722 Room exits:
B $8722,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8722) }
. TABLE#
B $8725,$01 Terminator.

g $8726 Room #N$29: "#ROOM$29"
@ $8726 label=Room_41
B $8726,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8727,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8729,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $872B,$02
W $872D,$02
N $872F Room exits:
B $872F,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($872F) }
. { #MOVEMENT($8732) }
. { #MOVEMENT($8735) }
. TABLE#
B $8738,$01 Terminator.

g $8739 Room #N$2A: "#ROOM$2A"
@ $8739 label=Room_42
B $8739,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $873A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $873C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $873E,$02
W $8740,$02
N $8742 Room exits:
B $8742,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8742) }
. TABLE#
B $8745,$01 Terminator.

g $8746 Room #N$2B: "#ROOM$2B"
@ $8746 label=Room_43
B $8746,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8747,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8749,$02
W $874B,$02
W $874D,$02
N $874F Room exits:
B $874F,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($874F) }
. { #MOVEMENT($8752) }
. TABLE#
B $8755,$01 Terminator.

g $8756 Room #N$2C: "#ROOM$2C"
@ $8756 label=Room_44
B $8756,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8757,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8759,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $875B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $875D,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $875F Room exits:
B $875F,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($875F) }
. TABLE#
B $8762,$01 Terminator.

g $8763 Room #N$2D: "#ROOM$2D"
@ $8763 label=Room_45
B $8763,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8764,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8766,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8768,$02
W $876A,$02
N $876C Room exits:
B $876C,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($876C) }
. TABLE#
B $876F,$01 Terminator.

g $8770 Room #N$2E: "#ROOM$2E"
@ $8770 label=Room_46
B $8770,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8771,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8773,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8775,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8777,$02
N $8779 Room exits:
B $8779,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8779) }
. { #MOVEMENT($877C) }
. TABLE#
B $877F,$01 Terminator.

g $8780 Room #N$2F: "#ROOM$2F"
@ $8780 label=Room_47
B $8780,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8781,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8783,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8785,$02
W $8787,$02
N $8789 Room exits:
B $8789,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8789) }
. { #MOVEMENT($878C) }
. { #MOVEMENT($878F) }
. TABLE#
B $8792,$01 Terminator.

g $8793 Room #N$30: "#ROOM$30"
@ $8793 label=Room_48
B $8793,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8794,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8796,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8798,$02
W $879A,$02
N $879C Room exits:
B $879C,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($879C) }
. TABLE#
B $879F,$01 Terminator.

g $87A0 Room #N$31: "#ROOM$31"
@ $87A0 label=Room_49
B $87A0,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87A1,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87A3,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87A5,$02
W $87A7,$02
N $87A9 Room exits:
B $87A9,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87A9) }
. TABLE#
B $87AC,$01 Terminator.

g $87AD Room #N$32: "#ROOM$32"
@ $87AD label=Room_50
B $87AD,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87AE,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87B0,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87B2,$02
W $87B4,$02
N $87B6 Room exits:
B $87B6,$0F,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87B6) }
. { #MOVEMENT($87B9) }
. { #MOVEMENT($87BC) }
. { #MOVEMENT($87BF) }
. { #MOVEMENT($87C2) }
. TABLE#
B $87C5,$01 Terminator.

g $87C6 Room #N$33: "#ROOM$33"
@ $87C6 label=Room_51
B $87C6,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87C7,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87C9,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87CB,$02
W $87CD,$02
N $87CF Room exits:
B $87CF,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87CF) }
. { #MOVEMENT($87D2) }
. { #MOVEMENT($87D5) }
. TABLE#
B $87D8,$01 Terminator.

g $87D9 Room #N$34: "#ROOM$34"
@ $87D9 label=Room_52
B $87D9,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87DA,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87DC,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87DE,$02
W $87E0,$02
N $87E2 Room exits:
B $87E2,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87E2) }
. { #MOVEMENT($87E5) }
. { #MOVEMENT($87E8) }
. TABLE#
B $87EB,$01 Terminator.

g $87EC Room #N$35: "#ROOM$35"
@ $87EC label=Room_53
B $87EC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87ED,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87EF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87F1,$02
W $87F3,$02
N $87F5 Room exits:
B $87F5,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87F5) }
. { #MOVEMENT($87F8) }
. TABLE#
B $87FB,$01 Terminator.

g $87FC Room #N$36: "#ROOM$36"
@ $87FC label=Room_54
B $87FC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87FD,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $87FF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8801,$02
W $8803,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8805 Room exits:
B $8805,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8805) }
. { #MOVEMENT($8808) }
. TABLE#
B $880B,$01 Terminator.

g $880C Room #N$37: "#ROOM$37"
@ $880C label=Room_55
B $880C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $880D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $880F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8811,$02
W $8813,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8815 Room exits:
B $8815,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8815) }
. TABLE#
B $8818,$01 Terminator.

g $8819 Room #N$38: "#ROOM$38"
@ $8819 label=Room_56
B $8819,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $881A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $881C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $881E,$02
W $8820,$02
N $8822 Room exits:
B $8822,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8822) }
. { #MOVEMENT($8825) }
. { #MOVEMENT($8828) }
. TABLE#
B $882B,$01 Terminator.

g $882C Room #N$39: "#ROOM$39"
@ $882C label=Room_57
B $882C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $882D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $882F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8831,$02
W $8833,$02
N $8835 Room exits:
B $8835,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8835) }
. { #MOVEMENT($8838) }
. { #MOVEMENT($883B) }
. TABLE#
B $883E,$01 Terminator.

g $883F Room #N$3A: "#ROOM$3A"
@ $883F label=Room_58
B $883F,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8840,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8842,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8844,$02
W $8846,$02
N $8848 Room exits:
B $8848,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8848) }
. TABLE#
B $884B,$01 Terminator.

g $884C Room #N$3B: "#ROOM$3B"
@ $884C label=Room_59
B $884C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $884D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $884F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8851,$02
W $8853,$02
N $8855 Room exits:
B $8855,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8855) }
. { #MOVEMENT($8858) }
. TABLE#
B $885B,$01 Terminator.

g $885C Room #N$3C: "#ROOM$3C"
@ $885C label=Room_60
B $885C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $885D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $885F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8861,$02
W $8863,$02
N $8865 Room exits:
B $8865,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8865) }
. { #MOVEMENT($8868) }
. TABLE#
B $886B,$01 Terminator.

g $886C Room #N$3D: "#ROOM$3D"
@ $886C label=Room_61
B $886C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $886D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $886F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8871,$02
W $8873,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
N $8875 Room exits:
B $8875,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8875) }
. { #MOVEMENT($8878) }
. TABLE#
B $887B,$01 Terminator.

g $887C Room #N$3E: "#ROOM$3E"
@ $887C label=Room_62
B $887C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $887D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $887F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8881,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8883,$02
N $8885 Room exits:
B $8885,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8885) }
. { #MOVEMENT($8888) }
. TABLE#
B $888B,$01 Terminator.

g $888C Room #N$3F: "#ROOM$3F"
@ $888C label=Room_63
B $888C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $888D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $888F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8891,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8893,$02
N $8895 Room exits:
B $8895,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8895) }
. { #MOVEMENT($8898) }
. TABLE#
B $889B,$01 Terminator.

g $889C Room #N$40: "#ROOM$40"
@ $889C label=Room_64
B $889C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $889D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $889F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88A1,$02
W $88A3,$02
N $88A5 Room exits:
B $88A5,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88A5) }
. { #MOVEMENT($88A8) }
. { #MOVEMENT($88AB) }
. TABLE#
B $88AE,$01 Terminator.

g $88AF Room #N$41: "#ROOM$41"
@ $88AF label=Room_65
B $88AF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88B0,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88B2,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88B4,$02
W $88B6,$02
N $88B8 Room exits:
B $88B8,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88B8) }
. { #MOVEMENT($88BB) }
. TABLE#
B $88BE,$01 Terminator.

g $88BF Room #N$42: "#ROOM$42"
@ $88BF label=Room_66
B $88BF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88C0,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88C2,$02
W $88C4,$02
W $88C6,$02
N $88C8 Room exits:
B $88C8,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88C8) }
. TABLE#
B $88CB,$01 Terminator.

g $88CC Room #N$43: "#ROOM$43"
@ $88CC label=Room_67
B $88CC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88CD,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88CF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88D1,$02
W $88D3,$02
N $88D5 Room exits:
B $88D5,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88D5) }
. { #MOVEMENT($88D8) }
. TABLE#
B $88DB,$01 Terminator.

g $88DC Room #N$44: "#ROOM$44"
@ $88DC label=Room_68
B $88DC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88DD,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88DF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88E1,$02
W $88E3,$02
N $88E5 Room exits:
B $88E5,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88E5) }
. { #MOVEMENT($88E8) }
. TABLE#
B $88EB,$01 Terminator.

g $88EC Room #N$45: "#ROOM$45"
@ $88EC label=Room_69
B $88EC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88ED,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88EF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $88F1,$02
W $88F3,$02
N $88F5 Room exits:
B $88F5,$0F,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88F5) }
. { #MOVEMENT($88F8) }
. { #MOVEMENT($88FB) }
. { #MOVEMENT($88FE) }
. { #MOVEMENT($8901) }
. TABLE#
B $8904,$01 Terminator.

g $8905 Room #N$46: "#ROOM$46"
@ $8905 label=Room_70
B $8905,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8906,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8908,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $890A,$02
W $890C,$02
N $890E Room exits:
B $890E,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($890E) }
. { #MOVEMENT($8911) }
. { #MOVEMENT($8914) }
. { #MOVEMENT($8917) }
. TABLE#
B $891A,$01 Terminator.

g $891B Room #N$47: "#ROOM$47"
@ $891B label=Room_71
B $891B,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $891C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $891E,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8920,$02
W $8922,$02
N $8924 Room exits:
B $8924,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8924) }
. TABLE#
B $8927,$01 Terminator.

g $8928 Room #N$48: "#ROOM$48"
@ $8928 label=Room_72
B $8928,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8929,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $892B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $892D,$02
W $892F,$02
N $8931 Room exits:
B $8931,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8931) }
. { #MOVEMENT($8934) }
. TABLE#
B $8937,$01 Terminator.

g $8938 Room #N$49: "#ROOM$49"
@ $8938 label=Room_73
B $8938,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8939,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $893B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $893D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $893F,$02
N $8941 Room exits:
B $8941,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8941) }
. { #MOVEMENT($8944) }
. TABLE#
B $8947,$01 Terminator.

g $8948 Room #N$4A: "#ROOM$4A"
@ $8948 label=Room_74
B $8948,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8949,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $894B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $894D,$02
W $894F,$02
N $8951 Room exits:
B $8951,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8951) }
. TABLE#
B $8954,$01 Terminator.

g $8955 Room #N$4B: "#ROOM$4B"
@ $8955 label=Room_75
B $8955,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8956,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8958,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $895A,$02
W $895C,$02
N $895E Room exits:
B $895E,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($895E) }
. TABLE#
B $8961,$01 Terminator.

g $8962 Room #N$4C: "#ROOM$4C"
@ $8962 label=Room_76
B $8962,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8963,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8965,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8967,$02
W $8969,$02
N $896B Room exits:
B $896B,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($896B) }
. { #MOVEMENT($896E) }
. { #MOVEMENT($8971) }
. { #MOVEMENT($8974) }
. TABLE#
B $8977,$01 Terminator.

g $8978 Room #N$4D: "#ROOM$4D"
@ $8978 label=Room_77
B $8978,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8979,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $897B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $897D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $897F,$02
N $8981 Room exits:
B $8981,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8981) }
. { #MOVEMENT($8984) }
. TABLE#
B $8987,$01 Terminator.

g $8988 Room #N$4E: "#ROOM$4E"
@ $8988 label=Room_78
B $8988,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8989,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $898B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $898D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $898F,$02
N $8991 Room exits:
B $8991,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8991) }
. { #MOVEMENT($8994) }
. { #MOVEMENT($8997) }
. TABLE#
B $899A,$01 Terminator.

g $899B Room #N$4F: "#ROOM$4F"
@ $899B label=Room_79
B $899B,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $899C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $899E,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89A0,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89A2,$02
N $89A4 Room exits:
B $89A4,$0F,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89A4) }
. { #MOVEMENT($89A7) }
. { #MOVEMENT($89AA) }
. { #MOVEMENT($89AD) }
. { #MOVEMENT($89B0) }
. TABLE#
B $89B3,$01 Terminator.

g $89B4 Room #N$50: "#ROOM$50"
@ $89B4 label=Room_80
B $89B4,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89B5,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89B7,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89B9,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89BB,$02
N $89BD Room exits:
B $89BD,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89BD) }
. { #MOVEMENT($89C0) }
. { #MOVEMENT($89C3) }
. TABLE#
B $89C6,$01 Terminator.

g $89C7 Room #N$51: "#ROOM$51"
@ $89C7 label=Room_81
B $89C7,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89C8,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89CA,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89CC,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89CE,$02
N $89D0 Room exits:
B $89D0,$0F,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89D0) }
. { #MOVEMENT($89D3) }
. { #MOVEMENT($89D6) }
. { #MOVEMENT($89D9) }
. { #MOVEMENT($89DC) }
. TABLE#
B $89DF,$01 Terminator.

g $89E0 Room #N$52: "#ROOM$52"
@ $89E0 label=Room_82
B $89E0,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89E1,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89E3,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89E5,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89E7,$02
N $89E9 Room exits:
B $89E9,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89E9) }
. { #MOVEMENT($89EC) }
. { #MOVEMENT($89EF) }
. TABLE#
B $89F2,$01 Terminator.

g $89F3 Room #N$53: "#ROOM$53"
@ $89F3 label=Room_83
B $89F3,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89F4,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89F6,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89F8,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $89FA,$02
N $89FC Room exits:
B $89FC,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89FC) }
. { #MOVEMENT($89FF) }
. { #MOVEMENT($8A02) }
. { #MOVEMENT($8A05) }
. TABLE#
B $8A08,$01 Terminator.

g $8A09 Room #N$54: "#ROOM$54"
@ $8A09 label=Room_84
B $8A09,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A0A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A0C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A0E,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A10,$02
N $8A12 Room exits:
B $8A12,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A12) }
. { #MOVEMENT($8A15) }
. TABLE#
B $8A18,$01 Terminator.

g $8A19 Room #N$55: "#ROOM$55"
@ $8A19 label=Room_85
B $8A19,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A1A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A1C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A1E,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A20,$02
N $8A22 Room exits:
B $8A22,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A22) }
. { #MOVEMENT($8A25) }
. TABLE#
B $8A28,$01 Terminator.

g $8A29 Room #N$56: "#ROOM$56"
@ $8A29 label=Room_86
B $8A29,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A2A,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A2C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A2E,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A30,$02
N $8A32 Room exits:
B $8A32,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A32) }
. { #MOVEMENT($8A35) }
. { #MOVEMENT($8A38) }
. TABLE#
B $8A3B,$01 Terminator.

g $8A3C Room #N$57: "#ROOM$57"
@ $8A3C label=Room_87
B $8A3C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A3D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A3F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A41,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A43,$02
N $8A45 Room exits:
B $8A45,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A45) }
. { #MOVEMENT($8A48) }
. { #MOVEMENT($8A4B) }
. TABLE#
B $8A4E,$01 Terminator.

g $8A4F Room #N$58: "#ROOM$58"
@ $8A4F label=Room_88
B $8A4F,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A50,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A52,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A54,$02
W $8A56,$02
N $8A58 Room exits:
B $8A58,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A58) }
. { #MOVEMENT($8A5B) }
. { #MOVEMENT($8A5E) }
. TABLE#
B $8A61,$01 Terminator.

g $8A62 Room #N$59: "#ROOM$59"
@ $8A62 label=Room_89
B $8A62,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A63,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A65,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A67,$02
W $8A69,$02
N $8A6B Room exits:
B $8A6B,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A6B) }
. { #MOVEMENT($8A6E) }
. { #MOVEMENT($8A71) }
. { #MOVEMENT($8A74) }
. TABLE#
B $8A77,$01 Terminator.

g $8A78 Room #N$5A: "#ROOM$5A"
@ $8A78 label=Room_90
B $8A78,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A79,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A7B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A7D,$02
W $8A7F,$02
N $8A81 Room exits:
B $8A81,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A81) }
. { #MOVEMENT($8A84) }
. { #MOVEMENT($8A87) }
. TABLE#
B $8A8A,$01 Terminator.

g $8A8B Room #N$5B: "#ROOM$5B"
@ $8A8B label=Room_91
B $8A8B,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A8C,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A8E,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8A90,$02
W $8A92,$02
N $8A94 Room exits:
B $8A94,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A94) }
. { #MOVEMENT($8A97) }
. { #MOVEMENT($8A9A) }
. { #MOVEMENT($8A9D) }
. TABLE#
B $8AA0,$01 Terminator.

g $8AA1 Room #N$5C: "#ROOM$5C"
@ $8AA1 label=Room_92
B $8AA1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AA2,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AA4,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AA6,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AA8,$02
N $8AAA Room exits:
B $8AAA,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8AAA) }
. { #MOVEMENT($8AAD) }
. TABLE#
B $8AB0,$01 Terminator.

g $8AB1 Room #N$5D: "#ROOM$5D"
@ $8AB1 label=Room_93
B $8AB1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AB2,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AB4,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AB6,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AB8,$02
N $8ABA Room exits:
B $8ABA,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8ABA) }
. { #MOVEMENT($8ABD) }
. TABLE#
B $8AC0,$01 Terminator.

g $8AC1 Room #N$5E: "#ROOM$5E"
@ $8AC1 label=Room_94
B $8AC1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AC2,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AC4,$02
W $8AC6,$02
W $8AC8,$02
N $8ACA Room exits:
B $8ACA,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8ACA) }
. { #MOVEMENT($8ACD) }
. TABLE#
B $8AD0,$01 Terminator.

g $8AD1 Room #N$5F: "#ROOM$5F"
@ $8AD1 label=Room_95
B $8AD1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AD2,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AD4,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AD6,$02
W $8AD8,$02
N $8ADA Room exits:
B $8ADA,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8ADA) }
. TABLE#
B $8ADD,$01 Terminator.

g $8ADE Room #N$60: "#ROOM$60"
@ $8ADE label=Room_96
B $8ADE,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8ADF,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AE1,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AE3,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AE5,$02
N $8AE7 Room exits:
B $8AE7,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8AE7) }
. { #MOVEMENT($8AEA) }
. { #MOVEMENT($8AED) }
. { #MOVEMENT($8AF0) }
. TABLE#
B $8AF3,$01 Terminator.

g $8AF4 Room #N$61: "#ROOM$61"
@ $8AF4 label=Room_97
B $8AF4,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AF5,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AF7,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8AF9,$02
W $8AFB,$02
N $8AFD Room exits:
B $8AFD,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8AFD) }
. { #MOVEMENT($8B00) }
. TABLE#
B $8B03,$01 Terminator.

g $8B04 Room #N$62: "#ROOM$62"
@ $8B04 label=Room_98
B $8B04,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B05,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B07,$02
W $8B09,$02
W $8B0B,$02
N $8B0D Room exits:
B $8B0D,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B0D) }
. TABLE#
B $8B10,$01 Terminator.

g $8B11 Room #N$63: "#ROOM$63"
@ $8B11 label=Room_99
B $8B11,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B12,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B14,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B16,$02
W $8B18,$02
N $8B1A Room exits:
B $8B1A,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B1A) }
. { #MOVEMENT($8B1D) }
. TABLE#
B $8B20,$01 Terminator.

g $8B21 Room #N$64: "#ROOM$64"
@ $8B21 label=Room_100
B $8B21,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B22,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B24,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B26,$02
W $8B28,$02
N $8B2A Room exits:
B $8B2A,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B2A) }
. { #MOVEMENT($8B2D) }
. TABLE#
B $8B30,$01 Terminator.

g $8B31 Room #N$65: "#ROOM$65"
@ $8B31 label=Room_101
B $8B31,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B32,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B34,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B36,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B38,$02
N $8B3A Room exits:
B $8B3A,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B3A) }
. TABLE#
B $8B3D,$01 Terminator.

g $8B3E Room #N$66: "#ROOM$66"
@ $8B3E label=Room_102
B $8B3E,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B3F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B41,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B43,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B45,$02
N $8B47 Room exits:
B $8B47,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B47) }
. { #MOVEMENT($8B4A) }
. TABLE#
B $8B4D,$01 Terminator.

g $8B4E Room #N$67: "#ROOM$67"
@ $8B4E label=Room_103
B $8B4E,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B4F,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B51,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B53,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B55,$02
B $8B57,$01 Terminator.

g $8B58 Room #N$68: "#ROOM$68"
@ $8B58 label=Room_104
B $8B58,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B59,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B5B,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B5D,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B5F,$02
N $8B61 Room exits:
B $8B61,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B61) }
. TABLE#
B $8B64,$01 Terminator.

g $8B65 Room #N$69: "#ROOM$69"
@ $8B65 label=Room_105
B $8B65,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B66,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B68,$02 #TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))
W $8B6A,$02
W $8B6C,$02 "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))"
B $8B6E,$01 Terminator.

g $8B6F Table: Objects
@ $8B6F label=Table_Objects
B $8B6F,$01 Object #N(#PEEK(#PC)): "#OBJECT(#PEEK(#PC))".
W $8B70,$02
L $8B6F,$03,$6E
B $8CB9,$01 Terminator.

g $8CBA Object #N$00: "#OBJECT$00"
@ $8CBA label=Object_00
B $8CBA,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8CBB,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8CBC,$01 Volume (?)
B $8CBD,$01 Mass (?)
B $8CBE,$01
B $8CBF,$01 Strength (?)
B $8CC0,$01
B $8CC1,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8CC2,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8CCA,$01 Terminator #N(#PEEK(#PC)).

g $8CCB Object #N$01: "#OBJECT$01"
@ $8CCB label=Object_01
B $8CCB,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8CCC,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8CCD,$01 Volume (?)
B $8CCE,$01 Mass (?)
B $8CCF,$01
B $8CD0,$01 Strength (?)
B $8CD1,$01
B $8CD2,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8CD3,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8CDB,$01 Terminator #N(#PEEK(#PC)).

g $8CDC Object #N$02: "#OBJECT$02"
@ $8CDC label=Object_02
B $8CDC,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8CDD,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8CDE,$01 Volume (?)
B $8CDF,$01 Mass (?)
B $8CE0,$01
B $8CE1,$01 Strength (?)
B $8CE2,$01
B $8CE3,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8CE4,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8CEC,$01 Terminator #N(#PEEK(#PC)).

g $8CED Object #N$03: "#OBJECT$03"
@ $8CED label=Object_03
B $8CED,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8CEE,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8CEF,$01 Volume (?)
B $8CF0,$01 Mass (?)
B $8CF1,$01
B $8CF2,$01 Strength (?)
B $8CF3,$01
B $8CF4,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8CF5,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8CFD,$01 Terminator #N(#PEEK(#PC)).

g $8CFE Object #N$04: "#OBJECT$04"
@ $8CFE label=Object_04
B $8CFE,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8CFF,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D00,$01 Volume (?)
B $8D01,$01 Mass (?)
B $8D02,$01
B $8D03,$01 Strength (?)
B $8D04,$01
B $8D05,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D06,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D0E,$01 Terminator #N(#PEEK(#PC)).

g $8D0F Object #N$05: "#OBJECT$05"
@ $8D0F label=Object_05
B $8D0F,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D10,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D11,$01 Volume (?)
B $8D12,$01 Mass (?)
B $8D13,$01
B $8D14,$01 Strength (?)
B $8D15,$01
B $8D16,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D17,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D1F,$01 Terminator #N(#PEEK(#PC)).

g $8D20 Object #N$06: "#OBJECT$06"
@ $8D20 label=Object_06
B $8D20,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D21,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D22,$01 Volume (?)
B $8D23,$01 Mass (?)
B $8D24,$01
B $8D25,$01 Strength (?)
B $8D26,$01
B $8D27,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D28,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D30,$01 Terminator #N(#PEEK(#PC)).

g $8D31 Object #N$07: "#OBJECT$07"
@ $8D31 label=Object_07
B $8D31,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D32,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D33,$01 Volume (?)
B $8D34,$01 Mass (?)
B $8D35,$01
B $8D36,$01 Strength (?)
B $8D37,$01
B $8D38,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D39,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D41,$01 Terminator #N(#PEEK(#PC)).

g $8D42 Object #N$08: "#OBJECT$08"
@ $8D42 label=Object_08
B $8D42,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D43,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D44,$01 Volume (?)
B $8D45,$01 Mass (?)
B $8D46,$01
B $8D47,$01 Strength (?)
B $8D48,$01
B $8D49,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D4A,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D52,$01 Terminator #N(#PEEK(#PC)).

g $8D53 Object #N$09: "#OBJECT$09"
@ $8D53 label=Object_09
B $8D53,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D54,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D55,$01 Volume (?)
B $8D56,$01 Mass (?)
B $8D57,$01
B $8D58,$01 Strength (?)
B $8D59,$01
B $8D5A,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D5B,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D63,$01 Terminator #N(#PEEK(#PC)).

g $8D64 Object #N$0A: "#OBJECT$0A"
@ $8D64 label=Object_10
B $8D64,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D65,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D66,$01 Volume (?)
B $8D67,$01 Mass (?)
B $8D68,$01
B $8D69,$01 Strength (?)
B $8D6A,$01
B $8D6B,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D6C,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D74,$01 Terminator #N(#PEEK(#PC)).

g $8D75 Object #N$0B: "#OBJECT$0B"
@ $8D75 label=Object_11
B $8D75,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D76,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D77,$01 Volume (?)
B $8D78,$01 Mass (?)
B $8D79,$01
B $8D7A,$01 Strength (?)
B $8D7B,$01
B $8D7C,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D7D,$0E,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D8B,$01 Terminator #N(#PEEK(#PC)).

g $8D8C Object #N$0C: "#OBJECT$0C"
@ $8D8C label=Object_12
B $8D8C,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D8D,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D8E,$01 Volume (?)
B $8D8F,$01 Mass (?)
B $8D90,$01
B $8D91,$01 Strength (?)
B $8D92,$01
B $8D93,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8D94,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8D9C,$01 Terminator #N(#PEEK(#PC)).

g $8D9D Object #N$0D: "#OBJECT$0D"
@ $8D9D label=Object_13
B $8D9D,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8D9E,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8D9F,$01 Volume (?)
B $8DA0,$01 Mass (?)
B $8DA1,$01
B $8DA2,$01 Strength (?)
B $8DA3,$01
B $8DA4,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8DA5,$0E,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8DB3,$01 Terminator #N(#PEEK(#PC)).

g $8DB4 Object #N$0E: "#OBJECT$0E"
@ $8DB4 label=Object_14
B $8DB4,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8DB5,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8DB6,$01 Volume (?)
B $8DB7,$01 Mass (?)
B $8DB8,$01
B $8DB9,$01 Strength (?)
B $8DBA,$01
B $8DBB,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8DBC,$0C,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8DC8,$01 Terminator #N(#PEEK(#PC)).

g $8DC9 Object #N$0F: "#OBJECT$0F"
@ $8DC9 label=Object_15
B $8DC9,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8DCA,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8DCB,$01 Volume (?)
B $8DCC,$01 Mass (?)
B $8DCD,$01
B $8DCE,$01 Strength (?)
B $8DCF,$01
B $8DD0,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8DD1,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8DD9,$01 Terminator #N(#PEEK(#PC)).

g $8DDA Object #N$10: "#OBJECT$10"
@ $8DDA label=Object_16
B $8DDA,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8DDB,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8DDC,$01 Volume (?)
B $8DDD,$01 Mass (?)
B $8DDE,$01
B $8DDF,$01 Strength (?)
B $8DE0,$01
B $8DE1,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8DE2,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8DEA,$01 Terminator #N(#PEEK(#PC)).

g $8DEB Object #N$11: "#OBJECT$11"
@ $8DEB label=Object_17
B $8DEB,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8DEC,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8DED,$01 Volume (?)
B $8DEE,$01 Mass (?)
B $8DEF,$01
B $8DF0,$01 Strength (?)
B $8DF1,$01
B $8DF2,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8DF3,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8DFB,$01 Terminator #N(#PEEK(#PC)).

g $8DFC Object #N$12: "#OBJECT$12"
@ $8DFC label=Object_18
B $8DFC,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8DFD,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8DFE,$01 Volume (?)
B $8DFF,$01 Mass (?)
B $8E00,$01
B $8E01,$01 Strength (?)
B $8E02,$01
B $8E03,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8E04,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8E0C,$01 Terminator #N(#PEEK(#PC)).

g $8E0D Object #N$13: "#OBJECT$13"
@ $8E0D label=Object_19
B $8E0D,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8E0E,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8E0F,$01 Volume (?)
B $8E10,$01 Mass (?)
B $8E11,$01
B $8E12,$01 Strength (?)
B $8E13,$01
B $8E14,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8E15,$11,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8E26,$01 Terminator #N(#PEEK(#PC)).

g $8E27 Object #N$14: "#OBJECT$14"
@ $8E27 label=Object_20
B $8E27,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8E28,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8E29,$01 Volume (?)
B $8E2A,$01 Mass (?)
B $8E2B,$01
B $8E2C,$01 Strength (?)
B $8E2D,$01
B $8E2E,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8E2F,$0F,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8E3E,$01 Terminator #N(#PEEK(#PC)).

g $8E3F Object #N$15: "#OBJECT$15"
@ $8E3F label=Object_21
B $8E3F,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8E40,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8E41,$01 Volume (?)
B $8E42,$01 Mass (?)
B $8E43,$01
B $8E44,$01 Strength (?)
B $8E45,$01
B $8E46,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8E47,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8E54,$01 Terminator #N(#PEEK(#PC)).

g $8E55 Object #N$16: "#OBJECT$16"
@ $8E55 label=Object_22
B $8E55,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8E56,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8E57,$01 Volume (?)
B $8E58,$01 Mass (?)
B $8E59,$01
B $8E5A,$01 Strength (?)
B $8E5B,$01
B $8E5C,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8E5D,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8E65,$01 Terminator #N(#PEEK(#PC)).

g $8E66 Object #N$17: "#OBJECT$17"
@ $8E66 label=Object_23
B $8E66,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8E67,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8E68,$01 Volume (?)
B $8E69,$01 Mass (?)
B $8E6A,$01
B $8E6B,$01 Strength (?)
B $8E6C,$01
B $8E6D,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8E6E,$12,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8E80,$01 Terminator #N(#PEEK(#PC)).

g $8E81 Object #N$18: "#OBJECT$18"
@ $8E81 label=Object_24
B $8E81,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8E82,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8E83,$01 Volume (?)
B $8E84,$01 Mass (?)
B $8E85,$01
B $8E86,$01 Strength (?)
B $8E87,$01
B $8E88,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8E89,$12,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8E9B,$01 Terminator #N(#PEEK(#PC)).

g $8E9C Object #N$19: "#OBJECT$19"
@ $8E9C label=Object_25
B $8E9C,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8E9D,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8E9E,$01 Volume (?)
B $8E9F,$01 Mass (?)
B $8EA0,$01
B $8EA1,$01 Strength (?)
B $8EA2,$01
B $8EA3,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8EA4,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8EAC,$01 Terminator #N(#PEEK(#PC)).

g $8EAD Object #N$1A: "#OBJECT$1A"
@ $8EAD label=Object_26
B $8EAD,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8EAE,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8EAF,$01 Volume (?)
B $8EB0,$01 Mass (?)
B $8EB1,$01
B $8EB2,$01 Strength (?)
B $8EB3,$01
B $8EB4,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8EB5,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8EBD,$01 Terminator #N(#PEEK(#PC)).

g $8EBE Object #N$1B: "#OBJECT$1B"
@ $8EBE label=Object_27
B $8EBE,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8EBF,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8EC0,$01 Volume (?)
B $8EC1,$01 Mass (?)
B $8EC2,$01
B $8EC3,$01 Strength (?)
B $8EC4,$01
B $8EC5,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8EC6,$0A,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8ED0,$01 Terminator #N(#PEEK(#PC)).

g $8ED1 Object #N$1C: "#OBJECT$1C"
@ $8ED1 label=Object_28
B $8ED1,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8ED2,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8ED3,$01 Volume (?)
B $8ED4,$01 Mass (?)
B $8ED5,$01
B $8ED6,$01 Strength (?)
B $8ED7,$01
B $8ED8,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8ED9,$0A,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8EE3,$01 Terminator #N(#PEEK(#PC)).

g $8EE4 Object #N$1D: "#OBJECT$1D"
@ $8EE4 label=Object_29
B $8EE4,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8EE5,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8EE6,$01 Volume (?)
B $8EE7,$01 Mass (?)
B $8EE8,$01
B $8EE9,$01 Strength (?)
B $8EEA,$01
B $8EEB,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8EEC,$09,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8EF5,$01 Terminator #N(#PEEK(#PC)).

g $8EF6 Object #N$1E: "#OBJECT$1E"
@ $8EF6 label=Object_30
B $8EF6,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8EF7,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8EF8,$01 Volume (?)
B $8EF9,$01 Mass (?)
B $8EFA,$01
B $8EFB,$01 Strength (?)
B $8EFC,$01
B $8EFD,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8EFE,$14,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8F12,$01 Terminator #N(#PEEK(#PC)).

g $8F13 Object #N$1F: "#OBJECT$1F"
@ $8F13 label=Object_31
B $8F13,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8F14,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8F15,$01 Volume (?)
B $8F16,$01 Mass (?)
B $8F17,$01
B $8F18,$01 Strength (?)
B $8F19,$01
B $8F1A,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8F1B,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8F2B,$01 Terminator #N(#PEEK(#PC)).

g $8F2C Object #N$20: "#OBJECT$20"
@ $8F2C label=Object_32
B $8F2C,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8F2D,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8F2E,$01 Volume (?)
B $8F2F,$01 Mass (?)
B $8F30,$01
B $8F31,$01 Strength (?)
B $8F32,$01
B $8F33,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8F34,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8F3C,$01 Terminator #N(#PEEK(#PC)).

g $8F3D Object #N$21: "#OBJECT$21"
@ $8F3D label=Object_33
B $8F3D,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8F3E,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8F3F,$01 Volume (?)
B $8F40,$01 Mass (?)
B $8F41,$01
B $8F42,$01 Strength (?)
B $8F43,$01
B $8F44,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8F45,$14,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8F59,$01 Terminator #N(#PEEK(#PC)).

g $8F5A Object #N$22: "#OBJECT$22"
@ $8F5A label=Object_34
B $8F5A,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8F5B,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8F5C,$01 Volume (?)
B $8F5D,$01 Mass (?)
B $8F5E,$01
B $8F5F,$01 Strength (?)
B $8F60,$01
B $8F61,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8F62,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8F72,$01 Terminator #N(#PEEK(#PC)).

g $8F73 Object #N$23: "#OBJECT$23"
@ $8F73 label=Object_35
B $8F73,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8F74,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8F75,$01 Volume (?)
B $8F76,$01 Mass (?)
B $8F77,$01
B $8F78,$01 Strength (?)
B $8F79,$01
B $8F7A,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8F7B,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8F83,$01 Terminator #N(#PEEK(#PC)).

g $8F84 Object #N$24: "#OBJECT$24"
@ $8F84 label=Object_36
B $8F84,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8F85,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8F86,$01 Volume (?)
B $8F87,$01 Mass (?)
B $8F88,$01
B $8F89,$01 Strength (?)
B $8F8A,$01
B $8F8B,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8F8C,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8F9C,$01 Terminator #N(#PEEK(#PC)).

g $8F9D Object #N$25: "#OBJECT$25"
@ $8F9D label=Object_37
B $8F9D,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8F9E,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8F9F,$01 Volume (?)
B $8FA0,$01 Mass (?)
B $8FA1,$01
B $8FA2,$01 Strength (?)
B $8FA3,$01
B $8FA4,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8FA5,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8FB5,$01 Terminator #N(#PEEK(#PC)).

g $8FB6 Object #N$26: "#OBJECT$26"
@ $8FB6 label=Object_38
B $8FB6,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8FB7,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8FB8,$01 Volume (?)
B $8FB9,$01 Mass (?)
B $8FBA,$01
B $8FBB,$01 Strength (?)
B $8FBC,$01
B $8FBD,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8FBE,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8FCE,$01 Terminator #N(#PEEK(#PC)).

g $8FCF Object #N$27: "#OBJECT$27"
@ $8FCF label=Object_39
B $8FCF,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8FD0,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8FD1,$01 Volume (?)
B $8FD2,$01 Mass (?)
B $8FD3,$01
B $8FD4,$01 Strength (?)
B $8FD5,$01
B $8FD6,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8FD7,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $8FE7,$01 Terminator #N(#PEEK(#PC)).

g $8FE8 Object #N$28: "#OBJECT$28"
@ $8FE8 label=Object_40
B $8FE8,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $8FE9,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $8FEA,$01 Volume (?)
B $8FEB,$01 Mass (?)
B $8FEC,$01
B $8FED,$01 Strength (?)
B $8FEE,$01
B $8FEF,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $8FF0,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9000,$01 Terminator #N(#PEEK(#PC)).

g $9001 Object #N$29: "#OBJECT$29"
@ $9001 label=Object_41
B $9001,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9002,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9003,$01 Volume (?)
B $9004,$01 Mass (?)
B $9005,$01
B $9006,$01 Strength (?)
B $9007,$01
B $9008,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9009,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9019,$01 Terminator #N(#PEEK(#PC)).

g $901A Object #N$2A: "#OBJECT$2A"
@ $901A label=Object_42
B $901A,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $901B,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $901C,$01 Volume (?)
B $901D,$01 Mass (?)
B $901E,$01
B $901F,$01 Strength (?)
B $9020,$01
B $9021,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9022,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9032,$01 Terminator #N(#PEEK(#PC)).

g $9033 Object #N$2B: "#OBJECT$2B"
@ $9033 label=Object_43
B $9033,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9034,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9035,$01 Volume (?)
B $9036,$01 Mass (?)
B $9037,$01
B $9038,$01 Strength (?)
B $9039,$01
B $903A,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $903B,$10,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $904B,$01 Terminator #N(#PEEK(#PC)).

g $904C Object #N$2C: "#OBJECT$2C"
@ $904C label=Object_44
B $904C,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $904D,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $904E,$01 Volume (?)
B $904F,$01 Mass (?)
B $9050,$01
B $9051,$01 Strength (?)
B $9052,$01
B $9053,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9054,$09,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $905D,$01 Terminator #N(#PEEK(#PC)).

g $905E Object #N$2D: "#OBJECT$2D"
@ $905E label=Object_45
B $905E,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $905F,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9060,$01 Volume (?)
B $9061,$01 Mass (?)
B $9062,$01
B $9063,$01 Strength (?)
B $9064,$01
B $9065,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9066,$0F,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9075,$01 Terminator #N(#PEEK(#PC)).

g $9076 Object #N$2E: "#OBJECT$2E"
@ $9076 label=Object_46
B $9076,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9077,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9078,$01 Volume (?)
B $9079,$01 Mass (?)
B $907A,$01
B $907B,$01 Strength (?)
B $907C,$01
B $907D,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $907E,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9086,$01 Terminator #N(#PEEK(#PC)).

g $9087 Object #N$2F: "#OBJECT$2F"
@ $9087 label=Object_47
B $9087,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9088,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9089,$01 Volume (?)
B $908A,$01 Mass (?)
B $908B,$01
B $908C,$01 Strength (?)
B $908D,$01
B $908E,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $908F,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9097,$01 Terminator #N(#PEEK(#PC)).

g $9098 Object #N$30: "#OBJECT$30"
@ $9098 label=Object_48
B $9098,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9099,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $909A,$01 Volume (?)
B $909B,$01 Mass (?)
B $909C,$01
B $909D,$01 Strength (?)
B $909E,$01
B $909F,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $90A0,$11,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $90B1,$01 Terminator #N(#PEEK(#PC)).

g $90B2 Object #N$31: "#OBJECT$31"
@ $90B2 label=Object_49
B $90B2,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $90B3,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $90B4,$01 Volume (?)
B $90B5,$01 Mass (?)
B $90B6,$01
B $90B7,$01 Strength (?)
B $90B8,$01
B $90B9,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $90BA,$11,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $90CB,$01 Terminator #N(#PEEK(#PC)).

g $90CC Object #N$32: "#OBJECT$32"
@ $90CC label=Object_50
B $90CC,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $90CD,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $90CE,$01 Volume (?)
B $90CF,$01 Mass (?)
B $90D0,$01
B $90D1,$01 Strength (?)
B $90D2,$01
B $90D3,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $90D4,$15,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $90E9,$01 Terminator #N(#PEEK(#PC)).

g $90EA Object #N$33: "#OBJECT$33"
@ $90EA label=Object_51
B $90EA,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $90EB,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $90EC,$01 Volume (?)
B $90ED,$01 Mass (?)
B $90EE,$01
B $90EF,$01 Strength (?)
B $90F0,$01
B $90F1,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $90F2,$0F,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9101,$01 Terminator #N(#PEEK(#PC)).

g $9102 Object #N$34: "#OBJECT$34"
@ $9102 label=Object_52
B $9102,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9103,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9104,$01 Volume (?)
B $9105,$01 Mass (?)
B $9106,$01
B $9107,$01 Strength (?)
B $9108,$01
B $9109,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $910A,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9117,$01 Terminator #N(#PEEK(#PC)).

g $9118 Object #N$35: "#OBJECT$35"
@ $9118 label=Object_53
B $9118,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9119,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $911A,$01 Volume (?)
B $911B,$01 Mass (?)
B $911C,$01
B $911D,$01 Strength (?)
B $911E,$01
B $911F,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9120,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $912D,$01 Terminator #N(#PEEK(#PC)).

g $912E Object #N$36: "#OBJECT$36"
@ $912E label=Object_54
B $912E,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $912F,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9130,$01 Volume (?)
B $9131,$01 Mass (?)
B $9132,$01
B $9133,$01 Strength (?)
B $9134,$01
B $9135,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9136,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9143,$01 Terminator #N(#PEEK(#PC)).

g $9144 Object #N$37: "#OBJECT$37"
@ $9144 label=Object_55
B $9144,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9145,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9146,$01 Volume (?)
B $9147,$01 Mass (?)
B $9148,$01
B $9149,$01 Strength (?)
B $914A,$01
B $914B,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $914C,$13,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $915F,$01 Terminator #N(#PEEK(#PC)).

g $9160 Object #N$38: "#OBJECT$38"
@ $9160 label=Object_56
B $9160,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9161,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9162,$01 Volume (?)
B $9163,$01 Mass (?)
B $9164,$01
B $9165,$01 Strength (?)
B $9166,$01
B $9167,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9168,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9175,$01 Terminator #N(#PEEK(#PC)).

g $9176 Object #N$39: "#OBJECT$39"
@ $9176 label=Object_57
B $9176,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9177,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9178,$01 Volume (?)
B $9179,$01 Mass (?)
B $917A,$01
B $917B,$01 Strength (?)
B $917C,$01
B $917D,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $917E,$09,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9187,$01 Terminator #N(#PEEK(#PC)).

g $9188 Object #N$3A: "#OBJECT$3A"
@ $9188 label=Object_58
B $9188,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9189,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $918A,$01 Volume (?)
B $918B,$01 Mass (?)
B $918C,$01
B $918D,$01 Strength (?)
B $918E,$01
B $918F,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9190,$09,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9199,$01 Terminator #N(#PEEK(#PC)).

g $919A Object #N$3B: "#OBJECT$3B"
@ $919A label=Object_59
B $919A,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $919B,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $919C,$01 Volume (?)
B $919D,$01 Mass (?)
B $919E,$01
B $919F,$01 Strength (?)
B $91A0,$01
B $91A1,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $91A2,$0F,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $91B1,$01 Terminator #N(#PEEK(#PC)).

g $91B2 Object #N$3C: "#OBJECT$3C"
@ $91B2 label=Object_60
B $91B2,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $91B3,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $91B4,$01 Volume (?)
B $91B5,$01 Mass (?)
B $91B6,$01
B $91B7,$01 Strength (?)
B $91B8,$01
B $91B9,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $91BA,$12,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $91CC,$01 Terminator #N(#PEEK(#PC)).

g $91CD Object #N$3D: "#OBJECT$3D"
@ $91CD label=Object_61
B $91CD,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $91CE,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $91CF,$01 Volume (?)
B $91D0,$01 Mass (?)
B $91D1,$01
B $91D2,$01 Strength (?)
B $91D3,$01
B $91D4,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $91D5,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $91DD,$01 Terminator #N(#PEEK(#PC)).

g $91DE Object #N$3E: "#OBJECT$3E"
@ $91DE label=Object_62
B $91DE,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $91DF,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $91E0,$01 Volume (?)
B $91E1,$01 Mass (?)
B $91E2,$01
B $91E3,$01 Strength (?)
B $91E4,$01
B $91E5,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $91E6,$0E,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $91F4,$01 Terminator #N(#PEEK(#PC)).

g $91F5 Object #N$3F: "#OBJECT$3F"
@ $91F5 label=Object_63
B $91F5,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $91F6,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $91F7,$01 Volume (?)
B $91F8,$01 Mass (?)
B $91F9,$01
B $91FA,$01 Strength (?)
B $91FB,$01
B $91FC,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $91FD,$0C,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9209,$01 Terminator #N(#PEEK(#PC)).

g $920A Object #N$40: "#OBJECT$40"
@ $920A label=Object_64
B $920A,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $920B,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $920C,$01 Volume (?)
B $920D,$01 Mass (?)
B $920E,$01
B $920F,$01 Strength (?)
B $9210,$01
B $9211,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9212,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $921A,$01 Terminator #N(#PEEK(#PC)).

g $921B Object #N$41: "#OBJECT$41"
@ $921B label=Object_65
B $921B,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $921C,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $921D,$01 Volume (?)
B $921E,$01 Mass (?)
B $921F,$01
B $9220,$01 Strength (?)
B $9221,$01
B $9222,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9223,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $922B,$01 Terminator #N(#PEEK(#PC)).

g $922C Object #N$42: "#OBJECT$42"
@ $922C label=Object_66
B $922C,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $922D,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $922E,$01 Volume (?)
B $922F,$01 Mass (?)
B $9230,$01
B $9231,$01 Strength (?)
B $9232,$01
B $9233,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9234,$0B,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $923F,$01 Terminator #N(#PEEK(#PC)).

g $9240 Object #N$43: "#OBJECT$43"
@ $9240 label=Object_67
B $9240,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9241,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9242,$01 Volume (?)
B $9243,$01 Mass (?)
B $9244,$01
B $9245,$01 Strength (?)
B $9246,$01
B $9247,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9248,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9250,$01 Terminator #N(#PEEK(#PC)).

g $9251 Object #N$44: "#OBJECT$44"
@ $9251 label=Object_68
B $9251,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9252,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9253,$01 Volume (?)
B $9254,$01 Mass (?)
B $9255,$01
B $9256,$01 Strength (?)
B $9257,$01
B $9258,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9259,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9266,$01 Terminator #N(#PEEK(#PC)).

g $9267 Object #N$45: "#OBJECT$45"
@ $9267 label=Object_69
B $9267,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9268,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9269,$01 Volume (?)
B $926A,$01 Mass (?)
B $926B,$01
B $926C,$01 Strength (?)
B $926D,$01
B $926E,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $926F,$0F,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $927E,$01 Terminator #N(#PEEK(#PC)).

g $927F Object #N$46: "#OBJECT$46"
@ $927F label=Object_70
B $927F,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9280,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9281,$01 Volume (?)
B $9282,$01 Mass (?)
B $9283,$01
B $9284,$01 Strength (?)
B $9285,$01
B $9286,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9287,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9294,$01 Terminator #N(#PEEK(#PC)).

g $9295 Object #N$47: "#OBJECT$47"
@ $9295 label=Object_71
B $9295,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9296,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9297,$01 Volume (?)
B $9298,$01 Mass (?)
B $9299,$01
B $929A,$01 Strength (?)
B $929B,$01
B $929C,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $929D,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $92A5,$01 Terminator #N(#PEEK(#PC)).

g $92A6 Object #N$48: "#OBJECT$48"
@ $92A6 label=Object_72
B $92A6,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $92A7,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $92A8,$01 Volume (?)
B $92A9,$01 Mass (?)
B $92AA,$01
B $92AB,$01 Strength (?)
B $92AC,$01
B $92AD,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $92AE,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $92B6,$01 Terminator #N(#PEEK(#PC)).

g $92B7 Object #N$49: "#OBJECT$49"
@ $92B7 label=Object_73
B $92B7,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $92B8,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $92B9,$01 Volume (?)
B $92BA,$01 Mass (?)
B $92BB,$01
B $92BC,$01 Strength (?)
B $92BD,$01
B $92BE,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $92BF,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $92CC,$01 Terminator #N(#PEEK(#PC)).

g $92CD Object #N$4A: "#OBJECT$4A"
@ $92CD label=Object_74
B $92CD,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $92CE,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $92CF,$01 Volume (?)
B $92D0,$01 Mass (?)
B $92D1,$01
B $92D2,$01 Strength (?)
B $92D3,$01
B $92D4,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $92D5,$0F,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $92E4,$01 Terminator #N(#PEEK(#PC)).

g $92E5 Object #N$4B: "#OBJECT$4B"
@ $92E5 label=Object_75
B $92E5,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $92E6,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $92E7,$01 Volume (?)
B $92E8,$01 Mass (?)
B $92E9,$01
B $92EA,$01 Strength (?)
B $92EB,$01
B $92EC,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $92ED,$09,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $92F6,$01 Terminator #N(#PEEK(#PC)).

g $92F7 Object #N$4C: "#OBJECT$4C"
@ $92F7 label=Object_76
B $92F7,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $92F8,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $92F9,$01 Volume (?)
B $92FA,$01 Mass (?)
B $92FB,$01
B $92FC,$01 Strength (?)
B $92FD,$01
B $92FE,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $92FF,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9307,$01 Terminator #N(#PEEK(#PC)).

g $9308 Object #N$4D: "#OBJECT$4D"
@ $9308 label=Object_77
B $9308,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9309,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $930A,$01 Volume (?)
B $930B,$01 Mass (?)
B $930C,$01
B $930D,$01 Strength (?)
B $930E,$01
B $930F,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9310,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9318,$01 Terminator #N(#PEEK(#PC)).

g $9319 Object #N$4E: "#OBJECT$4E"
@ $9319 label=Object_78
B $9319,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $931A,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $931B,$01 Volume (?)
B $931C,$01 Mass (?)
B $931D,$01
B $931E,$01 Strength (?)
B $931F,$01
B $9320,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9321,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9329,$01 Terminator #N(#PEEK(#PC)).

g $932A Object #N$4F: "#OBJECT$4F"
@ $932A label=Object_79
B $932A,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $932B,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $932C,$01 Volume (?)
B $932D,$01 Mass (?)
B $932E,$01
B $932F,$01 Strength (?)
B $9330,$01
B $9331,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9332,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $933F,$01 Terminator #N(#PEEK(#PC)).

g $9340 Object #N$50: "#OBJECT$50"
@ $9340 label=Object_80
B $9340,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9341,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9342,$01 Volume (?)
B $9343,$01 Mass (?)
B $9344,$01
B $9345,$01 Strength (?)
B $9346,$01
B $9347,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9348,$0A,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9352,$01 Terminator #N(#PEEK(#PC)).

g $9353 Object #N$51: "#OBJECT$51"
@ $9353 label=Object_81
B $9353,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9354,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9355,$01 Volume (?)
B $9356,$01 Mass (?)
B $9357,$01
B $9358,$01 Strength (?)
B $9359,$01
B $935A,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $935B,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9363,$01 Terminator #N(#PEEK(#PC)).

g $9364 Object #N$52: "#OBJECT$52"
@ $9364 label=Object_82
B $9364,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9365,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9366,$01 Volume (?)
B $9367,$01 Mass (?)
B $9368,$01
B $9369,$01 Strength (?)
B $936A,$01
B $936B,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $936C,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9374,$01 Terminator #N(#PEEK(#PC)).

g $9375 Object #N$53: "#OBJECT$53"
@ $9375 label=Object_83
B $9375,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9376,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9377,$01 Volume (?)
B $9378,$01 Mass (?)
B $9379,$01
B $937A,$01 Strength (?)
B $937B,$01
B $937C,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $937D,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9385,$01 Terminator #N(#PEEK(#PC)).

g $9386 Object #N$54: "#OBJECT$54"
@ $9386 label=Object_84
B $9386,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9387,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9388,$01 Volume (?)
B $9389,$01 Mass (?)
B $938A,$01
B $938B,$01 Strength (?)
B $938C,$01
B $938D,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $938E,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9396,$01 Terminator #N(#PEEK(#PC)).

g $9397 Object #N$55: "#OBJECT$55"
@ $9397 label=Object_85
B $9397,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9398,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9399,$01 Volume (?)
B $939A,$01 Mass (?)
B $939B,$01
B $939C,$01 Strength (?)
B $939D,$01
B $939E,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $939F,$0E,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $93AD,$01 Terminator #N(#PEEK(#PC)).

g $93AE Object #N$56: "#OBJECT$56"
@ $93AE label=Object_86
B $93AE,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $93AF,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $93B0,$01 Volume (?)
B $93B1,$01 Mass (?)
B $93B2,$01
B $93B3,$01 Strength (?)
B $93B4,$01
B $93B5,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $93B6,$0C,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $93C2,$01 Terminator #N(#PEEK(#PC)).

g $93C3 Object #N$57: "#OBJECT$57"
@ $93C3 label=Object_87
B $93C3,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $93C4,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $93C5,$01 Volume (?)
B $93C6,$01 Mass (?)
B $93C7,$01
B $93C8,$01 Strength (?)
B $93C9,$01
B $93CA,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $93CB,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $93D3,$01 Terminator #N(#PEEK(#PC)).

g $93D4 Object #N$58: "#OBJECT$58"
@ $93D4 label=Object_88
B $93D4,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $93D5,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $93D6,$01 Volume (?)
B $93D7,$01 Mass (?)
B $93D8,$01
B $93D9,$01 Strength (?)
B $93DA,$01
B $93DB,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $93DC,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $93E4,$01 Terminator #N(#PEEK(#PC)).

g $93E5 Object #N$59: "#OBJECT$59"
@ $93E5 label=Object_89
B $93E5,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $93E6,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $93E7,$01 Volume (?)
B $93E8,$01 Mass (?)
B $93E9,$01
B $93EA,$01 Strength (?)
B $93EB,$01
B $93EC,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $93ED,$0C,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $93F9,$01 Terminator #N(#PEEK(#PC)).

g $93FA Object #N$5A: "#OBJECT$5A"
@ $93FA label=Object_90
B $93FA,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $93FB,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $93FC,$01 Volume (?)
B $93FD,$01 Mass (?)
B $93FE,$01
B $93FF,$01 Strength (?)
B $9400,$01
B $9401,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9402,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $940A,$01 Terminator #N(#PEEK(#PC)).

g $940B Object #N$5B: "#OBJECT$5B"
@ $940B label=Object_91
B $940B,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $940C,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $940D,$01 Volume (?)
B $940E,$01 Mass (?)
B $940F,$01
B $9410,$01 Strength (?)
B $9411,$01
B $9412,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9413,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9420,$01 Terminator #N(#PEEK(#PC)).

g $9421 Object #N$5C: "#OBJECT$5C"
@ $9421 label=Object_92
B $9421,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9422,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9423,$01 Volume (?)
B $9424,$01 Mass (?)
B $9425,$01
B $9426,$01 Strength (?)
B $9427,$01
B $9428,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9429,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9431,$01 Terminator #N(#PEEK(#PC)).

g $9432 Object #N$5D: "#OBJECT$5D"
@ $9432 label=Object_93
B $9432,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9433,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9434,$01 Volume (?)
B $9435,$01 Mass (?)
B $9436,$01
B $9437,$01 Strength (?)
B $9438,$01
B $9439,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $943A,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9442,$01 Terminator #N(#PEEK(#PC)).

g $9443 Object #N$5E: "#OBJECT$5E"
@ $9443 label=Object_94
B $9443,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9444,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9445,$01 Volume (?)
B $9446,$01 Mass (?)
B $9447,$01
B $9448,$01 Strength (?)
B $9449,$01
B $944A,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $944B,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9453,$01 Terminator #N(#PEEK(#PC)).

g $9454 Object #N$5F: "#OBJECT$5F"
@ $9454 label=Object_95
B $9454,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9455,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9456,$01 Volume (?)
B $9457,$01 Mass (?)
B $9458,$01
B $9459,$01 Strength (?)
B $945A,$01
B $945B,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $945C,$0E,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $946A,$01 Terminator #N(#PEEK(#PC)).

g $946B Object #N$60: "#OBJECT$60"
@ $946B label=Object_96
B $946B,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $946C,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $946D,$01 Volume (?)
B $946E,$01 Mass (?)
B $946F,$01
B $9470,$01 Strength (?)
B $9471,$01
B $9472,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9473,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $947B,$01 Terminator #N(#PEEK(#PC)).

g $947C Object #N$61: "#OBJECT$61"
@ $947C label=Object_97
B $947C,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $947D,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $947E,$01 Volume (?)
B $947F,$01 Mass (?)
B $9480,$01
B $9481,$01 Strength (?)
B $9482,$01
B $9483,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9484,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $948C,$01 Terminator #N(#PEEK(#PC)).

g $948D Object #N$62: "#OBJECT$62"
@ $948D label=Object_98
B $948D,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $948E,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $948F,$01 Volume (?)
B $9490,$01 Mass (?)
B $9491,$01
B $9492,$01 Strength (?)
B $9493,$01
B $9494,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9495,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $949D,$01 Terminator #N(#PEEK(#PC)).

g $949E Object #N$63: "#OBJECT$63"
@ $949E label=Object_99
B $949E,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $949F,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $94A0,$01 Volume (?)
B $94A1,$01 Mass (?)
B $94A2,$01
B $94A3,$01 Strength (?)
B $94A4,$01
B $94A5,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $94A6,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $94AE,$01 Terminator #N(#PEEK(#PC)).

g $94AF Object #N$64: "#OBJECT$64"
@ $94AF label=Object_100
B $94AF,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $94B0,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $94B1,$01 Volume (?)
B $94B2,$01 Mass (?)
B $94B3,$01
B $94B4,$01 Strength (?)
B $94B5,$01
B $94B6,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $94B7,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $94BF,$01 Terminator #N(#PEEK(#PC)).

g $94C0 Object #N$65: "#OBJECT$65"
@ $94C0 label=Object_101
B $94C0,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $94C1,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $94C2,$01 Volume (?)
B $94C3,$01 Mass (?)
B $94C4,$01
B $94C5,$01 Strength (?)
B $94C6,$01
B $94C7,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $94C8,$0C,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $94D4,$01 Terminator #N(#PEEK(#PC)).

g $94D5 Object #N$66: "#OBJECT$66"
@ $94D5 label=Object_102
B $94D5,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $94D6,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $94D7,$01 Volume (?)
B $94D8,$01 Mass (?)
B $94D9,$01
B $94DA,$01 Strength (?)
B $94DB,$01
B $94DC,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $94DD,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $94E5,$01 Terminator #N(#PEEK(#PC)).

g $94E6 Object #N$67: "#OBJECT$67"
@ $94E6 label=Object_103
B $94E6,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $94E7,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $94E8,$01 Volume (?)
B $94E9,$01 Mass (?)
B $94EA,$01
B $94EB,$01 Strength (?)
B $94EC,$01
B $94ED,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $94EE,$0D,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $94FB,$01 Terminator #N(#PEEK(#PC)).

g $94FC Object #N$68: "#OBJECT$68"
@ $94FC label=Object_104
B $94FC,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $94FD,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $94FE,$01 Volume (?)
B $94FF,$01 Mass (?)
B $9500,$01
B $9501,$01 Strength (?)
B $9502,$01
B $9503,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9504,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $950C,$01 Terminator #N(#PEEK(#PC)).

g $950D Object #N$69: "#OBJECT$69"
@ $950D label=Object_105
B $950D,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $950E,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $950F,$01 Volume (?)
B $9510,$01 Mass (?)
B $9511,$01
B $9512,$01 Strength (?)
B $9513,$01
B $9514,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9515,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $951D,$01 Terminator #N(#PEEK(#PC)).

g $951E Object #N$6A: "#OBJECT$6A"
@ $951E label=Object_106
B $951E,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $951F,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9520,$01 Volume (?)
B $9521,$01 Mass (?)
B $9522,$01
B $9523,$01 Strength (?)
B $9524,$01
B $9525,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9526,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $952E,$01 Terminator #N(#PEEK(#PC)).

g $952F Object #N$6B: "#OBJECT$6B"
@ $952F label=Object_107
B $952F,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9530,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9531,$01 Volume (?)
B $9532,$01 Mass (?)
B $9533,$01
B $9534,$01 Strength (?)
B $9535,$01
B $9536,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9537,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $953F,$01 Terminator #N(#PEEK(#PC)).

g $9540 Object #N$6C: "#OBJECT$6C"
@ $9540 label=Object_108
B $9540,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9541,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9542,$01 Volume (?)
B $9543,$01 Mass (?)
B $9544,$01
B $9545,$01 Strength (?)
B $9546,$01
B $9547,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9548,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9550,$01 Terminator #N(#PEEK(#PC)).

g $9551 Object #N$6D: "#OBJECT$6D"
@ $9551 label=Object_109
B $9551,$01 Appears in the game #N(#PEEK(#PC)) #IF(#PEEK(#PC)>$01)(times,time).
B $9552,$01 #IF(#PEEK(#PC)==$FF)(No mother object,Mother object: #OBJECT(#PEEK(#PC))).
B $9553,$01 Volume (?)
B $9554,$01 Mass (?)
B $9555,$01
B $9556,$01 Strength (?)
B $9557,$01
B $9558,b$01 Attributes:
. #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre)
. { =h Visible | =h Animal | =h Open | =h Gives Light | =h Broken | =h Full | =h Fluid | =h Locked }
. { #FOR($07,$00,-$01)(x,#IF(#PEEK(#PC)&$01<<x)(yes,no), | ) } TABLE#
B $9559,$08,$02 Object Name: "#TEXTTOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
B $9561,$01 Terminator #N(#PEEK(#PC)).

g $956A

g $9860 Table: Timetable
@ $9860 label=Table_Timetable
D $9860 Holds character data.
.
. Note for Sherlock himself the character ID can also be:
. #TABLE(default,centre,centre)
. { =h ID Byte | =h Character }
. #FOREACH($00,$01,$64)(x,{ #Nx | "#OBJECTx" })
. TABLE#
. Due to Sherlock being able to wear disguises.
N $9860 Timetable #N((#PC-$9860)/$08).
B $9860,$01 Character: "#OBJECT(#PEEK(#PC))".
W $9861,$02
B $9863,$01 Location?
W $9864,$02
W $9866,$02 Timer?
L $9860,$08,$18
B $9920,$01 Terminator.

c $9921 Action: Sherlock

g $994D
W $994D,$02

g $99A9
g $99B7
g $99E3
g $99F1

c $9C6A Handler: Find Character Action
@ $9C6A label=Handler_FindCharacterAction
R $9C6A O:IX Action entry
R $9C6A O:A #N$FF is no action was found
R $9C6A O:F Zero flag is set if no action was found
  $9C6A,$03 Load *#R$A036 into #REGa.
  $9C6D,$04 Load #R$9C85 into #REGix.
  $9C71,$03 Call #R$D34E.
  $9C74,$02 Check if a character action was found.
  $9C76,$01 Return.

c $9C77 Execute Character Action
@ $9C77 label=ExecuteCharacterAction
R $9C77 IY Character timetable pointer
  $9C77,$03 Call #R$9C6A.
  $9C7A,$01 Return if no action was found (the termination character was
. returned #N$FF).
  $9C7B,$06 Fetch the action handler address and store it in #REGhl.
  $9C81,$03 Return if the action handler address is empty.
  $9C84,$01 Jump to the action handler.

g $9C85 Table: Character Actions
@ $9C85 label=Table_CharacterActions
N $9C85 #OBJECT(#PEEK(#PC)):
B $9C85,$01 Character: "#OBJECT(#PEEK(#PC))".
W $9C86,$02 Action routine: #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $9C85,$03,$09
N $9CA0 End of table data:
B $9CA0,$01 Terminator.

g $9CA1 Character State: Basil Phipps
@ $9CA1 label=CharacterState_BasilPhipps
B $9CA1,$01

c $9CA2 Character Action: Basil Phipps
@ $9CA2 label=CharacterAction_BasilPhipps
  $9CA2,$02 Load "#OBJECT$55" into #REGa.
  $9CA4,$03 Call #R$D237.
  $9CA7,$05 Return if bit 7 of *#REGix+#N$05 is not set.
  $9CAC,$03 #REGhl=#R$9CA1.
  $9CAF,$01 #REGa=*#REGhl.
  $9CB0,$03 Return if #REGa is equal to #N$FF.
  $9CB3,$01 Decrease *#REGhl by one.
  $9CB4,$01 Return if *#REGhl is not equal to #N$FF.
  $9CB5,$03 #REGhl=#N$015B.
  $9CB8,$03 Write #REGl to *#REGix+#N$09.
  $9CBB,$03 Write #REGh to *#REGix+#N$0A.
  $9CBE,$07 Write #N$00 to; #LIST { *#REGix+#N$0D } { *#REGix+#N$0E } LIST#
  $9CC5,$04 #REGix=#R$99B7.
  $9CC9,$04 Reset bit 1 of *#REGix+#N$03.
  $9CCD,$01 Return.

c $9CCE
  $9CCE,$04 #REGix=*#R$A017.
  $9CD2,$03 #REGb=*#REGix+#N$0F.
  $9CD5,$01 #REGa=#REGc.
  $9CD6,$03 Call #R$D237.
  $9CD9,$05 Return if *#REGix+#N$0F is not equal to #REGb.
  $9CDE,$01 #REGa=#REGc.
  $9CDF,$03 Call #R$C821.
  $9CE2,$02 Jump to #R$9CE6 if #REGa is equal to #REGb.
  $9CE4,$01 #REGa=#N$00.
  $9CE5,$01 Return.
  $9CE6,$02,b$01 Set bit 0.
  $9CE8,$01 Return.

c $9CE9
  $9CE9,$03 Call #R$9CF2.
  $9CEC,$03 #REGhl=#R$6929.
  $9CEF,$03 Jump to #R$A59F.

c $9CF2
  $9CF2,$04 Write #REGc to *#R$A034.
  $9CF6,$03 Call #R$9CCE.
  $9CF9,$02 Jump to #R$9D02 if the zero flag is set.
  $9CFB,$01 Decrease *#REGhl by one.
  $9CFC,$03 Jump to #R$9D00 if *#REGhl is greater than or equal to #N$00.
  $9CFF,$01 Increment *#REGhl by one.
  $9D00,$01 Restore #REGde from the stack.
  $9D01,$01 Return.

  $9D02,$04 Jump to #R$9D00 if *#REGhl is not zero.
  $9D06,$02 #REGa=#N$0F.
  $9D08,$03 Call #R$D2A4.
  $9D0B,$02 #REGa+=#N$1E.
  $9D0D,$01 Write #REGa to *#REGhl.
  $9D0E,$01 #REGa=#N$00.
  $9D0F,$01 Return.

g $9D10
B $9D10,$01
B $9D11,$01
B $9D12,$01

c $9D13 Character Action: Watson
@ $9D13 label=CharacterAction_Watson
  $9D13,$03 #REGhl=#R$9D10.
  $9D16,$02 #REGc=#N$00.
  $9D18,$03 Call #R$9CE9.
  $9D1B,$03 #REGhl=#R$9D11.
  $9D1E,$02 #REGc=#N$02.
  $9D20,$03 Call #R$9CE9.
  $9D23,$03 #REGhl=#R$9D12.
  $9D26,$02 #REGc=#N$04.
  $9D28,$03 Call #R$9CE9.
  $9D2B,$03 Jump to #R$E691.

g $9D2E
B $9D2E,$01
B $9D2F,$01

c $9D30 Character Action: Chief Constable Strak
@ $9D30 label=CharacterAction_ChiefConstableStrak
  $9D30,$05 Return if *#R$9D90 is zero.
  $9D35,$03 #REGhl=#R$9D2E.
  $9D38,$02 #REGc=#N$00.
  $9D3A,$03 Call #R$9CE9.
  $9D3D,$03 #REGhl=#R$9D2F.
  $9D40,$02 #REGc=#N$03.
  $9D42,$03 Jump to #R$9CE9.

g $9D45
B $9D45,$01
B $9D46,$01
B $9D47,$01

c $9D48 Character Action: Local Police Man #N$01
@ $9D48 label=CharacterAction_LocalPoliceMan_01
  $9D48,$05 Return if *#R$9D90 is not zero.
  $9D4D,$03 #REGhl=#R$9D45.
  $9D50,$02 #REGc=#N$00.
  $9D52,$03 Call #R$9D65.
  $9D55,$03 #REGhl=#R$9D46.
  $9D58,$02 #REGc=#N$03.
  $9D5A,$03 Call #R$9D65.
  $9D5D,$03 #REGhl=#R$9D47.
  $9D60,$02 #REGc=#N$07.
  $9D62,$03 Jump to #R$9D65.
  $9D65,$03 Call #R$9CF2.
  $9D68,$02 Write #N$01 to *#REGhl.
N $9D6A Print "#TEXTTOKEN($6D9A)".
  $9D6A,$03 #REGhl=#R$6D9A.
  $9D6D,$03 Jump to #R$A59F.

g $9D70
B $9D70,$01
B $9D71,$01
B $9D72,$01

c $9D73 Character Action: Local Police Man #N$02
@ $9D73 label=CharacterAction_LocalPoliceMan_02
  $9D73,$03 #REGa=*#R$9D90.
  $9D76,$02 Return if *#R$9D90 is not zero.
  $9D78,$03 #REGhl=#R$9D70.
  $9D7B,$02 #REGc=#N$00.
  $9D7D,$03 Call #R$9D65.
  $9D80,$03 #REGhl=#R$9D71.
  $9D83,$02 #REGc=#N$03.
  $9D85,$03 Call #R$9D65.
  $9D88,$03 #REGhl=#R$9D72.
  $9D8B,$02 #REGc=#N$07.
  $9D8D,$03 Jump to #R$9D65.

g $9D90
B $9D90,$01
B $9D91,$01
B $9D92,$01
B $9D93,$01
B $9D94,$01

c $9D95
  $9D95,$03 #REGhl=#R$9D91.
  $9D98,$02 #REGc=#N$00.
  $9D9A,$03 Call #R$9DC6.
  $9D9D,$03 #REGhl=#R$9D94.
  $9DA0,$02 #REGc=#N$00.
  $9DA2,$03 Call #R$9DD8.
  $9DA5,$03 #REGhl=#R$9D93.
  $9DA8,$02 #REGc=#N$03.
  $9DAA,$03 Call #R$9CE9.
  $9DAD,$04 #REGix=#R$99E3.
  $9DB1,$04 Reset bit 0 of *#REGix+#N$03.
  $9DB5,$04 #REGix=#R$99F1.
  $9DB9,$04 Reset bit 0 of *#REGix+#N$03.
  $9DBD,$04 #REGix=#R$99A9.
  $9DC1,$04 Reset bit 0 of *#REGix+#N$03.
  $9DC5,$01 Return.

  $9DC6,$01 Increment #REGhl by one.
  $9DC7,$03 Call #R$9CF2.
  $9DCA,$01 Decrease #REGhl by one.
  $9DCB,$01 #REGa=*#REGhl.
  $9DCC,$04 Jump to #R$9CEC if #REGa is not zero.
  $9DD0,$01 Increment #REGa by one.
  $9DD1,$01 Write #REGa to *#REGhl.
  $9DD2,$03 #REGhl=#R$71ED.
  $9DD5,$03 Jump to #R$A59F.

  $9DD8,$03 Call #R$9CF2.
  $9DDB,$02 Write #N$01 to *#REGhl.
  $9DDD,$03 Call #R$BC46.
  $9DE0,$03 Call #R$BC9C.
  $9DE3,$04 Jump to #R$9DF5 if #REGb is not zero.
  $9DE7,$03 Call #R$BC74.
  $9DEA,$01 Set flags.
  $9DEB,$01 Return if #REGa is equal to #REGa.
  $9DEC,$02 Stash #REGix on the stack.
N $9DEE Print "#TEXTTOKEN($722D)".
  $9DEE,$03 #REGhl=#R$722D.
  $9DF1,$03 Call #R$A59F.
  $9DF4,$01 Return.

  $9DF5,$05 Return if bit 4 of *#REGix+#N$03 is set.
  $9DFA,$02 #REGa=#N$01.
  $9DFC,$03 Jump to #R$BBE5.

c $9DFF Character Action: Inspector Lestrade
@ $9DFF label=CharacterAction_InspectorLestrade
  $9DFF,$02 #REGc=#N$04.
  $9E01,$03 Call #R$9CCE.
  $9E04,$02 Jump to #R$9D95 if the zero flag is not set.
  $9E06,$02 #REGc=#N$00.
  $9E08,$03 Call #R$9CCE.
  $9E0B,$02 Jump to #R$9D95 if the zero flag is not set.
  $9E0D,$05 Write #N$04 to *#R$A034.
  $9E12,$05 Write #N$01 to *#R$9D90.
  $9E17,$05 Call #R$D224 with room #N$5C: #ROOM$5C.
  $9E1C,$04 Write #N$00 to *#REGix+#N$0A.
  $9E20,$05 Call #R$D224 with room #N$3E: #ROOM$3E.
  $9E25,$04 Write #N$00 to *#REGix+#N$0A.
  $9E29,$06 Write #R$9D95 to *#R$9C86.
  $9E2F,$05 Write #N$01 to *#R$9D92.
  $9E34,$03 #REGa=*#R$9D91.
  $9E37,$01 Set flags.
  $9E38,$03 #REGhl=#R$7207.
  $9E3B,$02 Jump to #R$9E44 if ?? is not equal to #REGa.
  $9E3D,$01 Increment #REGa by one.
  $9E3E,$03 Write #REGa to *#R$9D91.
  $9E41,$03 #REGhl=#R$7224.
  $9E44,$03 Call #R$A59F.
  $9E47,$01 Return.

g $9E48
B $9E48,$01
B $9E49,$01

c $9E4A

g $9EC0 Character State: Daphne Strachan
@ $9EC0 label=CharacterState_DaphneStrachan
B $9EC0,$01

c $9EC1 Character Action: Daphne Strachan
@ $9EC1 label=CharacterAction_DaphneStrachan
  $9EC1,$03 #REGhl=#R$9EC0.
  $9EC4,$02 #REGc=#N$80.
  $9EC6,$02 #REGb=#N$4A.
  $9EC8,$02 Jump to #R$9ED7.

g $9ECA Character State:Cook
@ $9ECA label=CharacterState_Cook
B $9ECA,$01

c $9ECB Character Action: Cook
@ $9ECB label=CharacterAction_Cook
  $9ECB,$03 #REGhl=#R$9ECA.
  $9ECE,$02 Jump to #R$9ED4.

g $9ED0 Character State: Gardener
@ $9ED0 label=CharacterState_Gardener
B $9ED0,$01

c $9ED1 Character Action: Gardener
@ $9ED1 label=CharacterAction_Gardener
  $9ED1,$03 #REGhl=#R$9ED0.
  $9ED4,$03 #REGbc=#N($0000,$04,$04).
  $9ED7,$01 #REGa=*#REGhl.
  $9ED8,$03 Jump to #R$9EF2 if #REGa is zero.
  $9EDB,$01 #REGb=#REGa.
  $9EDC,$01 #REGa=#N$00.
  $9EDD,$03 #REGde=#N($0000,$04,$04).
  $9EE0,$03 Call #R$9F1E.
  $9EE3,$03 #REGa=*#R$A036.
  $9EE6,$01 #REGb=#REGc.
  $9EE7,$03 #REGde=#N($0000,$04,$04).
  $9EEA,$03 Call #R$F1C1.
  $9EED,$04 Set bit 6 of *#REGix+#N$05.
  $9EF1,$01 Return.

N $9EF2 Return if it's still morning.
  $9EF2,$06 Return if *#R$9FE2 is equal to ASCII #N$61 ("#CHR$61") e.g. is it
. AM still?
N $9EF8 It's afternoon now.
  $9EF8,$06 Return if *#R$9FE0 is not equal to #N$09.
  $9EFE,$03 #REGde=#N($01F8,$04,$04).
  $9F01,$02 #REGa=#N$1E.
  $9F03,$03 Call #R$D2A4.
  $9F06,$01 #REGa+=#REGe.
  $9F07,$01 #REGe=#REGa.
  $9F08,$03 #REGa=*#R$A00A.
  $9F0B,$03 Call #R$9F1E.
  $9F0E,$03 #REGa=*#R$A036.
  $9F11,$02 #REGb=#N$10.
  $9F13,$03 #REGde=#N($07F0,$04,$04).
  $9F16,$03 Call #R$F1C1.
  $9F19,$04 Reset bit 6 of *#REGix+#N$05.
  $9F1D,$01 Return.

  $9F1E,$01 Write #REGa to *#REGhl.
  $9F1F,$04 #REGix=*#R$A017.
  $9F23,$03 Write #REGb to *#REGix+#N$0F.
  $9F26,$04 Write #N$FF to *#REGix+#N$01.
  $9F2A,$03 #REGl=*#REGiy+#N$06.
  $9F2D,$03 #REGh=*#REGiy+#N$07.
  $9F30,$01 #REGhl+=#REGde.
  $9F31,$03 Write #REGl to *#REGiy+#N$06.
  $9F34,$03 Write #REGh to *#REGiy+#N$07.
  $9F37,$01 Return.

g $9F38
B $9F38,$01
W $9F39,$02
L $9F38,$03,$26
B $9FAA,$01 Terminator.

g $9FAB

c $9FC9
  $9FC9,$03 #REGhl=#R$9FCE.
  $9FCC,$01 #REGa=#N$00.
  $9FCD,$01 Return.
N $9FCE Print "#TEXTTOKEN($680B)".
  $9FCE,$03 #REGhl=#R$680B.
  $9FD1,$03 Jump to #R$A59F.

g $9FD4
W $9FD4,$02

g $9FD6

g $9FD9 Currently Processed Character Command Position
@ $9FD9 label=CurrentCharacter_CommandPosition
W $9FD9,$02

g $9FDB Currently Processed Character Timetable Pointer
@ $9FDB label=CurrentCharacter_TimetablePointer
W $9FDB,$02

g $9FDD Current Time Ticker
@ $9FDD label=CurrentTime_Ticker
D $9FDD Holds a value between #N($0000,$04,$04) to #N$FFFF, and just keeps
. incrementing all throughout the game.
W $9FDD,$02

g $9FDF Current Time
@ $9FDF label=CurrentTime_Minutes
@ $9FE0 label=CurrentTime_Hour
D $9FDF Holds the current in-game hours and minutes.
B $9FDF,$01
B $9FE0,$01

g $9FE1 Current Day Of The Week
@ $9FE1 label=CurrentDayOfWeek
D $9FE1 Represents the current day of the week, where:
. #TABLE(default,centre,centre)
. { =h Byte | =h Day }
. #FOR$00,$06,,$04(x,{ #Nx | #STR($BF59+x*$03,$04,$03) })
. TABLE#
.
. See #R$BF79.
B $9FE1,$01

g $9FE2 Messaging: AM/ PM
@ $9FE2 label=Messaging_AM_PM
D $9FE2 Holds just the "a" and the "p" for AM and PM, as the "m" is already in
. the string and so doesn't change.
T $9FE2,$01
T $9FE3,$01

g $9FE4

g $9FE7
W $9FE7,$02

g $9FEE
W $9FEE,$02

g $A008
B $A008,$01

g $A009
B $A009,$01

g $A00A
B $A00A,$01

g $A00B
B $A00B,$01

g $A00C
B $A00C,$01

g $A00D
W $A00D,$02

g $A00F
B $A00F,$01
B $A010,$01

g $A011
B $A011,$01

g $A013
W $A013,$02

g $A015
W $A015,$02

g $A017
W $A017,$02

g $A019
g $A01B

g $A01D
B $A01D,$01

g $A01E
B $A01E,$01

g $A01F Character Script Cycles
@ $A01F label=CharacterScriptCycles
B $A01F,$01

g $A022
W $A022,$02

g $A026
B $A026,$01

g $A027
B $A027,$01

g $A028
B $A028,$01

g $A033
B $A033,$01

g $A034 Room Display Parameter
@ $A034 label=RoomDisplayParameter
B $A034,$01

g $A035 Room Graphics Parameter
@ $A035 label=RoomGraphicsParameter
B $A035,$01

g $A036 Currently Processed Character ID
@ $A036 label=CurrentCharacter_ID
B $A036,$01

g $A037
B $A037,$01

c $A040 Game Entry Point
@ $A040 label=GameEntryPoint
  $A040,$07 Write #N$00 to #LIST { *#R$D6B8 } { *#R$A01B } LIST#
  $A047,$01 Disable interrupts.
  $A048,$03 Call #R$C14A.
  $A04B,$03 #REGsp=#R$5D80.
  $A04E,$03 Call #R$C415.
  $A051,$04 Jump to #R$A05B if the keypress is ASCII code #N$6E ("#CHR$6E").
  $A055,$02 Compare the keypress with ASCII code #N$4E ("#CHR$4E").
  $A057,$02 #REGa=#N$01.
  $A059,$02 Jump to #R$A05C if the keypress was not ASCII code #N$4E
. ("#CHR$4E").
N $A05B The player pressed either "N" or "n".
@ $A05B label=NoMeansNo
  $A05B,$01 #REGa=#N$00.
  $A05C,$03 Write #REGa to *#R$A011.
  $A05F,$05 Write the contents of the Memory Refresh Register to *#R$A037.
@ $A064 label=Game_Initialisation
  $A064,$04 Write #N$00 to *#R$A0DA.
@ $A068 label=Game_Loop
  $A068,$06 Jump to #R$A0E7 if *#R$A0DA is not zero.
  $A06E,$03 Call #R$BFD9.
  $A071,$03 Call #R$BF79.
N $A074 Handler for Sherlock (as he's the first character).
  $A074,$04 #REGiy=#R$9860.
  $A078,$03 Fetch Sherlocks location.
  $A07B,$04 Jump to #R$A093 if Sherlock isn't in room #N$32: #ROOM$32.
  $A07F,$03 Call #R$C41F.
  $A082,$08 Jump to #R$A093 if the keypress was not valid or if the keypress
. was not #N$8D ("ENTER") - which is ASCII code #N$0D with bit 7 set for being
. a valid keypress.
  $A08A,$09 Write *#R$9FDD to *#REGiy+#N$06/ *#REGiy+#N$07.
N $A093 Cycle through the character timetable and run through each characters
. script according to their schedule and current game time.
@ $A093 label=Handler_ProcessCharacters
  $A093,$04 Load #R$9860 into #REGiy.
@ $A097 label=CharacterProcessing_Loop
  $A097,$06 Jump to #R$A068 if the character ID is the termination character
. (#N$FF).
N $A09D This is a valid character so begin processing them.
  $A09D,$03 Load *#R$9FDD into #REGhl.
  $A0A0,$03 Call #R$A0DB.
  $A0A3,$02 Jump to #R$A0D1 if this character is not scheduled to have actions
. yet.
N $A0A5 The currently processed character has an active schedule so process it.
  $A0A5,$03 Fetch the character ID and store it in #REGa.
  $A0A8,$03 Stash the timetable pointer and character ID on the stack.
  $A0AB,$03 Call #R$CC37.
N $A0AE Repeatedly execute the characters script until it completes or
. encounters a wait condition.
@ $A0AE label=CharacterScript_Loop
  $A0AE,$01 Restore the character ID from the stack.
  $A0AF,$01 But keep a copy of the character ID on the stack.
  $A0B0,$03 Call #R$CC78.
N $A0B3 Keep looping until the script for this character is finished.
  $A0B3,$07 Jump back to #R$A0AE until *#R$A01F is zero.
  $A0BA,$03 Restore the character ID and timetable pointer from the stack.
N $A0BD Set up the next schedule time for this character.
  $A0BD,$07 Add the characters schedule time to the current time...
  $A0C4,$06 And write it back to the characters schedule.
  $A0CA,$02 Stash the timetable pointer on the stack briefly.
  $A0CC,$03 Call #R$9C77.
  $A0CF,$02 Restore the timetable pointer from the stack.
N $A0D1 Move to the next character in the timetable.
@ $A0D1 label=Character_Next
  $A0D1,$05 #REGiy+=#N($0008,$04,$04).
  $A0D6,$02 Jump to #R$A097.

b $A0D8
  $A0DA

c $A0DB Check Character Schedule
@ $A0DB label=CheckCharacterSchedule
R $A0DB HL Current game time
R $A0DB O:F Carry flag is set if the character should be skipped
  $A0DB,$06 Fetch the characters schedule offset and store it in #REGde.
  $A0E1,$03 Return if the high byte of the characters schedule doesn't match
. the current game time.
  $A0E4,$02 Set the carry flag if the schedule isn't for now.
  $A0E6,$01 Return.

c $A0E7
  $A0E7,$04 Jump to #R$A0F1 if #REGa is equal to #N$02.
  $A0EB,$03 Call #R$B0D7.
  $A0EE,$03 Jump to #R$A040.

  $A0F1,$03 Call #R$B0E4.
  $A0F4,$03 Jump to #R$A064.

c $A0F7
N $A0F7 This will be restored back into #REGhl by the end of the routine.
  $A0F7,$01 Stash #REGhl on the stack temporarily.
  $A0F8,$03 #REGl=*#REGix-#N$02.
  $A0FB,$03 #REGh=*#REGix-#N$01.
  $A0FE,$02 Is #REGhl zero?
N $A100 Pretty clever way of using the stack here.
  $A100,$01 Swap the *#REGsp with the object pointer, restoring #REGhl to the
. original value.
  $A101,$02 Restore the object pointer into #REGix (from the stack).
  $A103,$01 Return.

c $A104

g $A11A
W $A11A,$02

c $A11C

c $A1AF
  $A1AF,$01 Stash #REGhl on the stack.
  $A1B0,$03 #REGhl=#REGix (using the stack).
  $A1B3,$02 Jump to #R$A1C1.

c $A1B5

c $A1C7

c $A20C

g $A24D
W $A24D,$02 "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
L $A24D,$02,$08

c $A25D
  $A25D,$01 Stash #REGbc on the stack.
  $A25E,$01 #REGb=#REGa.
  $A25F,$06 Jump to #R$A275 if *#R$A011 is zero.
  $A265,$03 #REGhl=*#R$A0D8.
  $A268,$04 Jump to #R$A275 if #REGhl is zero.
  $A26C,$03 #REGix=#REGhl (using the stack).
  $A26F,$01 #REGa=#REGb.
  $A270,$03 Call #R$D34E.
  $A273,$02 Set the zero flag if the termination character was reached (#N$FF).
  $A275,$01 Restore #REGbc from the stack.
  $A276,$01 Return.

c $A277
  $A277,$05 Stash #REGix, #REGhl, #REGbc and #REGaf on the stack.
  $A27C,$03 Call #R$A25D.
  $A27F,$02 Jump to #R$A290 if the zero flag is set.
  $A281,$03 Call #R$A296.
  $A284,$03 Call #R$C129.
  $A287,$03 #REGl=*#REGix+#N$01.
  $A28A,$03 #REGh=*#REGix+#N$02.
  $A28D,$03 Call #R$F3C2.
  $A290,$05 Restore #REGaf, #REGbc, #REGhl and #REGix from the stack.
  $A295,$01 Return.

c $A296

c $A2A2

g $A2AA
B $A2AA,$01

c $A2AB

c $A2B1
  $A2B1,$01 Decrease #REGa by one.
  $A2B2,$01 #REGl=#REGa.
  $A2B3,$02 #REGh=#N$00.
  $A2B5,$03 Multiply #REGhl by #N$08.
  $A2B8,$04 #REGhl+=#R$8259.
  $A2BC,$01 Return.

c $A2BD
  $A2BD,$03 #REGa=*#REGix+#N$05.
  $A2C0,$01 RRCA.
  $A2C1,$01 RRCA.
  $A2C2,$01 RRCA.
  $A2C3,$01 RRCA.
  $A2C4,$02,b$01 Keep only bits 0-3.
  $A2C6,$01 #REGc=#REGa.
  $A2C7,$03 #REGa=*#REGix+#N$07.
  $A2CA,$02,b$01 Keep only bits 4-7.
  $A2CC,$01 #REGa+=#REGc.
  $A2CD,$03 Write #REGa to *#R$A01E.
  $A2D0,$03 #REGa=*#REGix+#N$01.
  $A2D3,$01 RRCA.
  $A2D4,$01 RRCA.
  $A2D5,$01 RRCA.
  $A2D6,$01 RRCA.
  $A2D7,$02,b$01 Keep only bits 0-3.
  $A2D9,$01 #REGc=#REGa.
  $A2DA,$03 #REGa=*#REGix+#N$03.
  $A2DD,$02,b$01 Keep only bits 4-7.
  $A2DF,$01 #REGa+=#REGc.
  $A2E0,$03 Write #REGa to *#R$A01D.
  $A2E3,$01 Return.

c $A2E4
  $A2E4,$05 Write #N$01 to *#R$A2AA.
  $A2E9,$07 Stash #REGiy, #REGbc, #REGix, #REGhl and #REGde on the stack.
  $A2F0,$06 Write *#R$A033 to *#R$A35D.
  $A2F6,$06 Write *#R$A034 to *#R$A35E.
  $A2FC,$04 #REGb=*#R$A00C.
  $A300,$01 Set flags.
  $A301,$02 #REGa=#N$01.
  $A303,$02 Jump to #R$A306 if ?? is equal to #REGa.
  $A305,$04 Write #N$00 to *#R$A027.
  $A309,$03 Call #R$D078.
  $A30C,$02 Jump to #R$A31A if ?? is greater than or equal to #REGa.
  $A30E,$01 #REGa=#REGb.
  $A30F,$01 Set flags.
  $A310,$02 Jump to #R$A31A if ?? is not equal to #REGa.
  $A312,$03 #REGhl=#R$68D1.
  $A315,$03 Call #R$A59F.
  $A318,$02 Jump to #R$A34E.
  $A31A,$03 #REGa=*#R$A35D.
  $A31D,$03 Call #R$A2B1.
  $A320,$03 #REGix=#REGhl (using the stack).
  $A323,$03 Call #R$A2BD.
  $A326,$03 #REGa=*#R$A01D.
  $A329,$02,b$01 Keep only bits 4.
  $A32B,$02 Jump to #R$A34E if ?? is not equal to #REGa.
  $A32D,$03 Jump to #R$A336 if #REGa is equal to #REGb.
  $A330,$03 Call #R$DC6C.
  $A333,$03 Call #R$A2A2 if #REGb is equal to #N$00.
  $A336,$03 Call #R$A724.
  $A339,$03 #REGde=#N$017F.
  $A33C,$04 Jump to #R$A348 if #REGb is not equal to #N$00.
  $A340,$03 Call #R$A887.
  $A343,$03 Call #R$A360.
  $A346,$02 Jump to #R$A34B.

  $A348,$03 Call #R$A37D.
  $A34B,$03 Call #R$A2A2.
  $A34E,$07 Write #N$00 to; #LIST { *#R$A2AA } { *#R$A027 } LIST#
  $A355,$07 Restore #REGde, #REGhl, #REGix, #REGbc and #REGiy from the stack.
  $A35C,$01 Return.

g $A35D
B $A35D,$01
B $A35E,$01
B $A35F,$01

c $A360

c $A37D

c $A4AB
  $A4AB,$03 Stash #REGix and #REGde on the stack.
  $A4AE,$03 Call #R$D224.
  $A4B1,$03 Load the location data pointer into #REGhl (using the stack).
  $A4B4,$04 #REGhl+=#N($0001,$04,$04).
  $A4B8,$03 Restore #REGix and #REGde from the stack.
  $A4BB,$01 Return.

c $A4BC Point To Object Attribute Byte
@ $A4BC label=PointToObjectAttributeByte
R $A4BC A Object ID
R $A4BC O:HL Pointer to the object attribute byte
  $A4BC,$03 Stash #REGde and #REGix on the stack.
  $A4BF,$03 Call #R$D237.
  $A4C2,$03 #REGhl=#REGix (using the stack).
  $A4C5,$04 #REGhl+=#N($0007,$04,$04).
  $A4C9,$03 Restore #REGix and #REGde from the stack.
  $A4CC,$01 Return.

c $A4CD

g $A55D Control Character Jump Table
@ $A55D label=JumpTable_ControlCharacters
W $A55D,$02 ID: #N((#PC-$A55D)/$02).
L $A55D,$02,$20

g $A59D
W $A59D,$02

c $A59F
  $A59F,$06 Stash #REGbc, #REGde, #REGix, #REGaf and #REGhl on the stack.
  $A5A5,$03 #REGhl=#N($000C,$04,$04).
  $A5A8,$01 #REGhl+=#REGsp.
  $A5A9,$03 Write #REGhl to *#R$A59D.
  $A5AC,$01 Restore #REGhl from the stack.
  $A5AD,$03 #REGa=*#R$A00B.
  $A5B0,$03 Jump to #R$A5B6 if #REGa is not zero.
  $A5B3,$03 Write #REGa to *#R$A00C.
  $A5B6,$03 Call #R$A5C4.
  $A5B9,$06 Restore #REGaf, #REGix, #REGde, #REGbc and #REGhl from the stack.
  $A5BF,$04 #REGsp=*#R$A59D.
@ $A5C3 label=IndirectJump
  $A5C3,$01 Jump to *#REGhl.

c $A5C4 Process Text Stream
@ $A5C4 label=ProcessTextStream
R $A5C4 HL Pointer to text data
  $A5C4,$03 Transfer the pointer to the text data to be printed into #REGix
. (using the stack).
N $A5C7 Keep on looping through until all of the text has been printed.
@ $A5C7 label=TextProcessing_Loop
  $A5C7,$03 Call #R$A5CD.
  $A5CA,$02 Jump back to #R$A5C7 until all the text has been processed.
  $A5CC,$01 Return.

c $A5CD Process Text Command
@ $A5CD label=ProcessTextCommand
R $A5CD IX Pointer to text data
  $A5CD,$03 #REGa=*#REGix+#N$00.
  $A5D0,$04 Jump to #R$A5F2 if bit 7 of #REGa is not set.
  $A5D4,$02,b$01 Keep only bits 0-6.
  $A5D6,$01 #REGd=#REGa.
  $A5D7,$03 #REGe=*#REGix+#N$01.
  $A5DA,$02 Increment #REGix by one.
  $A5DC,$02,b$01 Keep only bits 4-7.
  $A5DE,$04 Jump to #R$A647 if #REGa is equal to #N$30.
  $A5E2,$04 Jump to #R$A647 if #REGa is equal to #N$20.
  $A5E6,$04 Jump to #R$A647 if #REGa is equal to #N$60.
  $A5EA,$03 Call #R$A887.
  $A5ED,$02 Increment #REGix by one.
  $A5EF,$02,b$01 Set bit 0 to indicate there is further text to print.
  $A5F1,$01 Return.

  $A5F2,$04 Jump to #R$A621 if #REGa is less than #N$20.
  $A5F6,$05 Jump to #R$A83A if #REGa is greater than #N$60.
  $A5FB,$04 Jump to #R$A61C if #REGa is less than #N$40.
  $A5FF,$02,b$01 Keep only bits 0-4.
  $A601,$01 Increment #REGa by one.
  $A602,$01 #REGb=#REGa.
  $A603,$03 #REGhl=#REGix (using the stack).
  $A606,$01 Increment #REGhl by one.
  $A607,$02 #REGc=#N$00.
  $A609,$03 Call #R$A990.
  $A60C,$03 Call #R$A9B7.
  $A60F,$02 Decrease counter by one and loop back to #R$A609 until counter is zero.
  $A611,$03 #REGix=#REGhl (using the stack).
  $A614,$01 #REGa=#REGc.
  $A615,$01 Set flags.
  $A616,$02 Jump to #R$A5ED if #REGhl is not equal to #REGa.
  $A618,$02 Decrease #REGix by one.
  $A61A,$02 Jump to #R$A5ED.

  $A61C,$03 Call #R$A9B7.
  $A61F,$02 Jump to #R$A5ED.

  $A621,$01 Stash #REGde on the stack.
  $A622,$01 #REGe=#REGa.
  $A623,$02 #REGd=#N$00.
  $A625,$05 #REGhl=#R$A55D+(#REGde*#N$02).
  $A62A,$01 #REGe=*#REGhl.
  $A62B,$01 Increment #REGhl by one.
  $A62C,$01 #REGd=*#REGhl.
  $A62D,$01 Exchange the #REGde and #REGhl registers.
  $A62E,$01 Restore #REGde from the stack.
  $A62F,$04 Jump to #R$A5C3 if #REGa is greater than or equal to #N$1D.
  $A633,$03 Call #R$A5C3.
  $A636,$02 Jump to #R$A5ED if #REGa is equal to #N$1D.
  $A638,$02 Jump to #R$A5EA.

c $A63A
  $A63A,$03 Call #R$A9B7.
  $A63D,$01 #REGa=#N$00.
  $A63E,$01 Return.

c $A63F
  $A63F,$02 #REGd=#N$60.
  $A641,$02 Jump to #R$A64A.

c $A643
  $A643,$02 #REGd=#N$30.
  $A645,$02 Jump to #R$A64A.

c $A647
  $A647,$03 Call #R$A887.
  $A64A,$02 #REGa=#N$2E.
  $A64C,$04 Jump to #R$A657 if bit 6 of #REGd is set.
  $A650,$05 Call #R$A9B7 if bit 4 of #REGd is set.
  $A655,$05 Call #R$A2A2 if bit 4 of #REGd is set.

  $A65A,$01 #REGa=#N$00.
  $A65B,$01 Return.

c $A65C
  $A65C,$01 Return.

c $A65D
  $A65D,$04 Write #N$00 to *#R$A028.
  $A661,$03 Call #R$A66C.
  $A664,$01 Exchange the #REGde and #REGhl registers.
  $A665,$05 Call #R$A7BA if #REGhl is not zero.
  $A66A,$01 #REGa=#N$00.
  $A66B,$01 Return.

c $A66C
  $A66C,$03 #REGhl=*#R$A59D.
  $A66F,$01 #REGe=*#REGhl.
  $A670,$01 Increment #REGhl by one.
  $A671,$01 #REGd=*#REGhl.
  $A672,$01 Increment #REGhl by one.
  $A673,$03 Write #REGhl to *#R$A59D.
  $A676,$02,b$01 Set bit 0.
  $A678,$01 Return.

c $A679
  $A679,$03 #REGe=*#REGix+#N$01.
  $A67C,$03 #REGd=*#REGix+#N$02.
  $A67F,$01 Decrease #REGde by one.
  $A680,$02 #REGix+=#REGde.
  $A682,$01 #REGa=#N$00.
  $A683,$01 Return.

c $A684
  $A684,$03 Call #R$A66C.
  $A687,$03 #REGix=#REGde (using the stack).
  $A68A,$01 #REGa=#N$00.
  $A68B,$01 Return.

c $A68C Check Time-Period: Not 6 AM
@ $A68C label=CheckTimePeriod_Not6AM
  $A68C,$03 Call #R$C00C.
  $A68F,$03 Return if the time-period code is 6 AM.
N $A692 It's anything other than 6 AM.
  $A692,$02 Jump to #R$A6B2.

c $A694 Check Time-Period: Not Morning/ Midday
@ $A694 label=CheckTimePeriod_NotMorningMidday
  $A694,$03 Call #R$C00C.
  $A697,$03 Return if the time-period code is morning/ midday (7 AM - 12 PM).
N $A69A It's anything other than morning/ midday (7 AM - 12 PM).
  $A69A,$02 Jump to #R$A6B2.

c $A69C Check Time-Period: Not Afternoon
@ $A69C label=CheckTimePeriod_NotAfternoon
  $A69C,$03 Call #R$C00C.
  $A69F,$03 Return if the time-period code is afternoon (1 PM - 6 PM).
N $A6A2 It's anything other than afternoon (1 PM - 6 PM).
  $A6A2,$02 Jump to #R$A6B2.

c $A6A4 Check Time-Period: Not 7 PM
@ $A6A4 label=CheckTimePeriod_Not7PM
  $A6A4,$03 Call #R$C00C.
  $A6A7,$03 Return if the time-period code is 7 PM.
N $A6AA It's anything other than 7 PM.
  $A6AA,$02 Jump to #R$A6B2.

c $A6AC Check Time-Period: Not Late Night/ Evening
@ $A6AC label=CheckTimePeriod_NotLateNightEvening
  $A6AC,$03 Call #R$C00C.
  $A6AF,$03 Return if the time-period code is late night/ evening (8 PM - 5 AM).
N $A6B2 It's daytime; 6 AM - 7 PM.
  $A6B2,$02 Increment #REGix by one.
  $A6B4,$03 Call #R$A6BB.
  $A6B7,$02 Decrease #REGix by one.
  $A6B9,$01 #REGa=#N$00.
  $A6BA,$01 Return.

c $A6BB
  $A6BB,$03 #REGa=*#REGix+#N$00.
  $A6BE,$04 Jump to #R$A6CC if bit 7 of #REGa is set.
  $A6C2,$04 Jump to #R$A6CA if #REGa is equal to #N$02.
  $A6C6,$04 Jump to #R$A6CE if #REGa is not equal to #N$0B.
  $A6CA,$02 Increment #REGix by one.
  $A6CC,$02 Increment #REGix by one.
  $A6CE,$02 Increment #REGix by one.
  $A6D0,$01 Return.

g $A6D1
B $A6D1,$01

g $A6D2
B $A6D2,$01

c $A6D3
  $A6D3,$02 Increment #REGix by one.
  $A6D5,$03 #REGa=*#REGix+#N$00.
  $A6D8,$03 Write #REGa to *#R$A6D1.
  $A6DB,$01 Decrease #REGa by one.
  $A6DC,$03 Call #R$D2A4.
  $A6DF,$01 Increment #REGa by one.
  $A6E0,$03 Write #REGa to *#R$A6D2.
  $A6E3,$02 Increment #REGix by one.
  $A6E5,$03 #REGa=*#R$A6D2.
  $A6E8,$03 #REGhl=#R$A6D1.
  $A6EB,$03 Jump to #R$A6F5 if #REGa is not equal to *#REGhl.
  $A6EE,$02 Stash #REGix on the stack.
  $A6F0,$03 Call #R$A5CD.
  $A6F3,$02 Restore #REGix from the stack.
  $A6F5,$03 Call #R$A6BB.
  $A6F8,$04 Decrease *#R$A6D1 by one.
  $A6FC,$02 Jump back to #R$A6E5 until *#REGhl is zero.
  $A6FE,$02 Decrease #REGix by one.
  $A700,$01 #REGa=#N$00.
  $A701,$01 Return.

c $A702
  $A702,$04 #REGde=*#R$A00D.
  $A706,$02,b$01 Set bit 0.
  $A708,$01 Return.

c $A709
  $A709,$03 Call #R$A66C.
  $A70C,$03 Call #R$A80E.
  $A70F,$01 #REGa=#N$00.
  $A710,$01 Return.

c $A711
  $A711,$02 Stash #REGix on the stack.
  $A713,$03 Call #R$A66C.
  $A716,$03 #REGix=#REGde (using the stack).
  $A719,$03 Call #R$BF1C.
  $A71C,$02 Restore #REGix from the stack.
  $A71E,$01 #REGa=#N$00.
  $A71F,$01 Return.

c $A720
  $A720,$04 Write #N$00 to *#R$A028.
  $A724,$03 #REGa=*#R$A036.
  $A727,$03 Call #R$A82F.
  $A72A,$01 #REGa=#N$00.
  $A72B,$01 Return.

c $A72C
  $A72C,$05 Write #N$01 to *#R$A028.
  $A731,$03 #REGa=*#R$A034.
  $A734,$02 Jump to #R$A751.

c $A736
  $A736,$03 Call #R$A9B7.
  $A739,$01 #REGa=#N$00.
  $A73A,$01 Return.

c $A73B
  $A73B,$05 Write #N$01 to *#R$A028.
  $A740,$03 #REGa=*#R$A035.
  $A743,$02 Jump to #R$A751.

c $A745
  $A745,$02 Jump to #R$A751 if ?? is greater than or equal to #N$01.
  $A747,$01 Stash #REGhl on the stack.
  $A748,$03 Call #R$A4AB.
  $A74B,$03 Call #R$A7BA.
  $A74E,$01 Restore #REGhl from the stack.
  $A74F,$01 #REGa=#N$00.
  $A750,$01 Return.

c $A751
  $A751,$01 Stash #REGhl on the stack.
  $A752,$03 Call #R$A4BC.
  $A755,$03 Call #R$A7C5.
  $A758,$01 Restore #REGhl from the stack.
  $A759,$01 #REGa=#N$00.
  $A75A,$01 Return.

c $A75B
  $A75B,$02 Stash #REGix on the stack.
  $A75D,$01 Restore #REGhl from the stack.
  $A75E,$01 Stash #REGhl on the stack.
  $A75F,$03 #REGe=*#REGix+#N$01.
  $A762,$03 #REGd=*#REGix+#N$02.
  $A765,$01 #REGhl+=#REGde.
  $A766,$03 Call #R$A5C4.
  $A769,$02 Restore #REGix from the stack.
  $A76B,$02 Increment #REGix by one.
  $A76D,$02 Increment #REGix by one.
  $A76F,$01 #REGa=#N$00.
  $A770,$01 Return.

c $A771
  $A771,$02 Stash #REGix on the stack.
  $A773,$03 Call #R$A66C.
  $A776,$01 Exchange the #REGde and #REGhl registers.
  $A777,$05 Call #R$A5C4 if #REGhl is not zero.
  $A77C,$02 Restore #REGix from the stack.
  $A77E,$01 #REGa=#N$00.
  $A77F,$01 Return.

c $A780
  $A780,$03 #REGa=*#R$A036.
  $A783,$03 #REGde=#N$0414.
  $A786,$02 Return if #REGa is not zero.
  $A788,$03 #REGde=#N$09F2.
  $A78B,$02,b$01 Set bit 0.
  $A78D,$01 Return.

c $A78E
  $A78E,$03 #REGa=*#R$A034.
  $A791,$02 Jump to #R$A783.

c $A793
  $A793,$03 #REGa=*#R$A036.
  $A796,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $A797,$01 #REGa=#N$00.
  $A798,$03 Write #REGa to *#R$A028.
  $A79B,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $A79C,$01 Stash #REGaf on the stack.
  $A79D,$03 Call #R$A82F.
  $A7A0,$01 Restore #REGaf from the stack.
  $A7A1,$01 Set flags.
  $A7A2,$03 #REGde="#R($5DBF+$0485)(#TOKEN($0485))".
  $A7A5,$01 Return if ?? is not equal to #REGa.
  $A7A6,$03 #REGde="#R($5DBF+$007A)(#TOKEN($007A)).
  $A7A9,$02,b$01 Set bit 0.
  $A7AB,$01 Return.

c $A7AC
  $A7AC,$03 #REGa=*#R$A034.
  $A7AF,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $A7B0,$02 #REGa=#N$01.
  $A7B2,$02 Jump to #R$A798.

c $A7B4
  $A7B4,$03 Call #R$A66C.
  $A7B7,$01 #REGa=#REGd.
  $A7B8,$02 Jump to #R$A7AF.
  $A7BA,$02 Stash #REGiy on the stack.
  $A7BC,$03 #REGiy=#REGhl (using the stack).
  $A7BF,$03 Call #R$D405.
  $A7C2,$02 Restore #REGiy from the stack.
  $A7C4,$01 Return.

  $A7C5,$02 Stash #REGiy on the stack.
  $A7C7,$03 #REGiy=#REGhl (using the stack).
  $A7CA,$03 Call #R$D3E8.
  $A7CD,$02 Restore #REGiy from the stack.
  $A7CF,$01 Return.

c $A7D0
  $A7D0,$04 Write #N$00 to *#R$A7EA.
  $A7D4,$04 Jump to #R$A7EB if bit 7 of #REGd is not set.
  $A7D8,$01 #REGa=#REGe.
  $A7D9,$03 #REGhl=#N$09EE.
  $A7DC,$03 Jump to #R$A7E4 if #REGa is not equal to #REGl.
  $A7DF,$01 #REGa=#REGd.
  $A7E0,$02,b$01 Keep only bits 0-3.
  $A7E2,$02 Return if #REGa is equal to #REGh.
  $A7E4,$05 Write #N$01 to *#R$A7EA.
  $A7E9,$01 Return.

g $A7EA
B $A7EA,$01

c $A7EB
  $A7EB,$03 #REGhl=#R$A24D.
  $A7EE,$04 #REGe=*#R$A027.
  $A7F2,$03 #REGa=*#R$A2AA.
  $A7F5,$01 Set the bits from #REGe.
  $A7F6,$02 Jump to #R$A7FB if #REGa is equal to #REGe.
  $A7F8,$03 #REGhl=#R$A255.
  $A7FB,$01 #REGa=#REGd.
  $A7FC,$01 RRCA.
  $A7FD,$01 RRCA.
  $A7FE,$01 RRCA.
  $A7FF,$02,b$01 Keep only bits 1-4.
  $A801,$01 Stash #REGde on the stack.
  $A802,$01 #REGe=#REGa.
  $A803,$02 #REGd=#N$00.
  $A805,$01 #REGhl+=#REGde.
  $A806,$01 #REGe=*#REGhl.
  $A807,$01 Increment #REGhl by one.
  $A808,$01 #REGd=*#REGhl.
  $A809,$03 Call #R$A887.
  $A80C,$01 Restore #REGde from the stack.
  $A80D,$01 Return.

c $A80E
  $A80E,$01 Stash #REGde on the stack.
  $A80F,$03 Call #R$A7D0.
  $A812,$01 Restore #REGde from the stack.
  $A813,$02 #REGa=#N$50.
  $A815,$01 Stash #REGaf on the stack.
  $A816,$01 #REGa=#REGd.
  $A817,$02,b$01 Keep only bits 0-3.
  $A819,$01 #REGd=#REGa.
  $A81A,$01 Restore #REGaf from the stack.
  $A81B,$01 Set the bits from #REGd.
  $A81C,$01 #REGd=#REGa.
  $A81D,$02,b$01 Keep only bits 0-3.
  $A81F,$01 Set the bits from #REGe.
  $A820,$01 Return if the result is zero.
  $A821,$03 Call #R$A887.
  $A824,$03 #REGa=*#R$A7EA.
  $A827,$01 Stash #REGhl on the stack.
  $A828,$03 #REGhl=#R$A026.
  $A82B,$01 Set the bits from *#REGhl.
  $A82C,$01 Write #REGa to *#REGhl.
  $A82D,$01 Restore #REGhl from the stack.
  $A82E,$01 Return.

c $A82F
  $A82F,$05 Jump to #R$A751 if #REGa is not equal to #N$FF.
  $A834,$03 #REGde="#R($5DBF+$080E)(#TOKEN($080E))".
  $A837,$03 Jump to #R$A887.

c $A83A
  $A83A,$03 Call #R$A840.
  $A83D,$03 Jump to #R$A5EA.

c $A840 Get Common Word
@ $A840 label=GetCommonWord
R $A840 A Letter reference
R $A840 DE Common word address
  $A840,$02 Subtract #N$60 from the letter byte - anything higher than #N$60
. signifies the letter is a "common word".
  $A842,$03 Load the letter reference into #REGde.
  $A845,$05 #REGhl=#R$67B7+(#REGde*#N$02).
  $A84A,$01 Fetch the LSB of the word reference and store it in #REGe.
  $A84B,$05 Fetch the MSB of the word reference, add #N$50 and store it in
. #REGd.
  $A850,$01 Return.

b $A851

c $A852

g $A85C

c $A880
  $A880,$01 #REGe=*#REGhl.
  $A881,$01 Increment #REGhl by one.
  $A882,$01 #REGa=*#REGhl.
  $A883,$01 Increment #REGhl by one.
  $A884,$02,b$01 Keep only bits 0-3.
  $A886,$01 #REGd=#REGa.
  $A887,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3C.html">TV-FLAG</a>.)
  $A88A,$02 Return if #REGa is zero.
  $A88C,$04 Write #REGde to *#R$A022.
  $A890,$01 #REGa=#REGd.
  $A891,$02,b$01 Keep only bits 0-3.
  $A893,$01 Set the bits from #REGe.
  $A894,$01 Return if #REGhl is equal to #REGe.
  $A895,$05 Stash #REGix, #REGhl, #REGbc and #REGde on the stack.
  $A89A,$02 #REGa=#N$20.
  $A89C,$03 Call #R$A9B7.
  $A89F,$01 #REGa=#REGd.
  $A8A0,$02,b$01 Keep only bits 4-7.
  $A8A2,$03 Compare #REGc with #N$70.
  $A8A5,$02 #REGa=#N$01.
  $A8A7,$02 Jump to #R$A8AC if #REGc is not equal to #N$70.
  $A8A9,$03 Write #REGa to *#R$A026.
  $A8AC,$01 #REGa=#REGd.
  $A8AD,$02,b$01 Keep only bits 0-3.
  $A8AF,$01 #REGd=#REGa.
  $A8B0,$01 Exchange the #REGde and #REGhl registers.
  $A8B1,$01 Stash #REGhl on the stack.
  $A8B2,$01 #REGa=#REGh.
  $A8B3,$01 Set the bits from #REGc.
  $A8B4,$01 #REGh=#REGa.
  $A8B5,$03 Write #REGhl to *#R$A022.
  $A8B8,$01 Restore #REGhl from the stack.
  $A8B9,$01 Stash #REGbc on the stack.
  $A8BA,$04 #REGix=#R$5D80.
  $A8BE,$02 #REGb=#N$5F.
  $A8C0,$01 Increment #REGb by one.
  $A8C1,$06 Jump to #R$A8CF if *#REGix+#N$01 is less than #REGh.
  $A8C7,$02 Jump to #R$A8D9 if *#REGix+#N$01 is not equal to #REGh.
  $A8C9,$06 Jump to #R$A8D9 if *#REGix+#N$00 is greater than or equal to #REGl.
  $A8CF,$04 Increment #REGix by two.
  $A8D3,$05 Jump to #R$A8C0 if #REGb is not equal to #N$7B.
  $A8D8,$01 Increment #REGb by one.
  $A8D9,$02 Jump to #R$A8E0 if #REGb is zero.
  $A8DB,$04 Decrease #REGix by two.
  $A8DF,$01 Decrease #REGb by one.
  $A8E0,$03 #REGe=*#REGix+#N$00.
  $A8E3,$03 #REGd=*#REGix+#N$01.
  $A8E6,$04 Jump to #R$A8DB until #REGde is zero.
  $A8EA,$01 #REGa=#REGb.
  $A8EB,$03 Call #R$A9B7.
  $A8EE,$04 #REGhl+=#N$5DBF.
  $A8F2,$01 Stash #REGhl on the stack.
  $A8F3,$01 Exchange the #REGde and #REGhl registers.
  $A8F4,$01 #REGhl+=#REGbc.
  $A8F5,$01 Stash #REGhl on the stack.
  $A8F6,$03 #REGhl-=#REGde (with carry).
  $A8F9,$01 Restore #REGhl from the stack.
  $A8FA,$01 Stash #REGaf on the stack.
  $A8FB,$03 Call #R$A95B.
  $A8FE,$01 Restore #REGaf from the stack.
  $A8FF,$02 Jump to #R$A8F5 if #REGb is not equal to #REGa.
  $A901,$02 Restore #REGhl and #REGbc from the stack.
  $A903,$05 Jump to #R$A91C if #REGc is equal to #N$50.
  $A908,$04 Jump to #R$A919 if #REGc is equal to #N$40.
  $A90C,$02 Compare #REGc with #N$10.
  $A90E,$03 #REGa=*#R$A034.
  $A911,$02 Jump to #R$A916 if #REGc is equal to #N$10.
  $A913,$06 Jump to #R$A91C if *#R$A036 is zero.
  $A919,$03 Call #R$A92F.
  $A91C,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C42.html">NEWPPC</a>.)
  $A91F,$01 #REGa=*#REGhl.
  $A920,$03 Jump to #R$A929 if #REGa is zero.
  $A923,$03 Call #R$A9B7.
  $A926,$01 Increment #REGhl by one.
  $A927,$02 Jump to #R$A91F.
  $A929,$05 Restore #REGde, #REGbc, #REGhl and #REGix from the stack.
  $A92E,$01 Return.

c $A92F

c $A990
  $A990,$01 Stash #REGde on the stack.
  $A991,$01 #REGd=*#REGhl.
  $A992,$01 Increment #REGhl by one.
  $A993,$01 #REGe=*#REGhl.
  $A994,$01 Decrease #REGhl by one.
  $A995,$04 Jump to #R$A9A0 if #REGc is zero.
  $A999,$02 Shift #REGe left (with carry).
  $A99B,$02 Rotate #REGd left.
  $A99D,$01 Decrease #REGa by one.
  $A99E,$02 Jump to #R$A999 if #REGa is not equal to #REGa.
  $A9A0,$01 #REGa=#REGc.
  $A9A1,$02 #REGa+=#N$05.
  $A9A3,$04 Jump to #R$A9AA if #REGa is less than #N$08.
  $A9A7,$02 #REGa-=#N$08.
  $A9A9,$01 Increment #REGhl by one.
  $A9AA,$01 #REGc=#REGa.
  $A9AB,$01 #REGa=#REGd.
  $A9AC,$01 Restore #REGde from the stack.
  $A9AD,$01 RRCA.
  $A9AE,$01 RRCA.
  $A9AF,$01 RRCA.
  $A9B0,$02,b$01 Keep only bits 0-4.
  $A9B2,$02 #REGa+=#N$60.
  $A9B4,$01 Return.

g $A9B5
W $A9B5,$02

c $A9B7

g $AA71

g $AAAC

c $AFE1

c $B015

c $B0AC
  $B0AC,$06 Write #N($0000,$04,$04) to *#R$9FDD.
  $B0B2,$04 #REGix=#R$9860.
  $B0B6,$03 Write #REGl to *#REGix+#N$06.
  $B0B9,$03 Write #REGh to *#REGix+#N$07.
  $B0BC,$01 Increment #REGhl by one.
  $B0BD,$03 Write #REGhl to *#R$A01F.
  $B0C0,$04 Write #REGl to *#R$A0DA.
  $B0C4,$01 Set flags.
  $B0C5,$01 Return.

  $B0C6,$03 Call #R$AFE1.
  $B0C9,$06 Write #N($0001,$04,$04) to *#R$A01F.
  $B0CF,$05 Write #N$02 to *#R$A0DA.
  $B0D4,$03 Jump to #R$B015.

c $B0D7
  $B0D7,$03 Call #R$B0EE.
  $B0DA,$03 Call #R$C0DF.
  $B0DD,$02 Jump back to #R$B0D7 if there was a tape loading error to try
. again.
  $B0DF,$04 #REGiy=*#R$9FD4.
  $B0E3,$01 Return.

c $B0E4
  $B0E4,$04 Write #REGiy to #R$9FD4.
  $B0E8,$03 Call #R$B0EE.
  $B0EB,$03 Jump to #R$C040.

c $B0EE
  $B0EE,$04 #REGix=#R$840B.
  $B0F2,$03 #REGhl=#R$A01F.
  $B0F5,$03 #REGde=#R$840B.
  $B0F8,$03 #REGhl-=#REGde (with carry).
  $B0FB,$01 Exchange the #REGde and #REGhl registers.
  $B0FC,$01 Return.

c $B0FD

g $B16D

c $B191

g $B39C
B $B39C,$01

c $B39D

g $B4A2
B $B4A2,$01

c $B4A3

g $B549
B $B549,$01

c $B54A

g $B6D6
W $B6D6,$02
W $B6D8,$02

c $B6DA

c $B6F0

c $B6FD
  $B6FD,$04 Write #N$00 to *#R$B77E.
  $B701,$03 Write #REGhl to *#R$B6D8.
  $B704,$03 Call #R$D33C.
  $B707,$03 #REGl=*#REGix+#N$07.
  $B70A,$03 #REGh=*#REGix+#N$08.
  $B70D,$03 Return if #REGhl is zero.
  $B710,$03 #REGix=#REGhl (using the stack).
  $B713,$06 Write #N($0000,$04,$04) to *#R$B6D6.
  $B719,$04 #REGiy=#R$AAAC.
  $B71D,$03 #REGhl=#R$AAAC.
  $B720,$02 #REGb=#N$06.
  $B722,$03 Call #R$A2AB.
  $B725,$03 Call #R$B77F.
  $B728,$01 Return if the zero flag is set.
  $B729,$03 Call #R$B772.
  $B72C,$04 Jump to #R$B75A if #REGa is equal to #N$50.
  $B730,$04 Jump to #R$B725 if #REGa is not equal to #N$60.
  $B734,$03 Write #REGe to *#REGiy+#N$02.
  $B737,$03 Write #REGd to *#REGiy+#N$03.
  $B73A,$03 Call #R$B77F.
  $B73D,$01 Return if the zero flag is set.
  $B73E,$03 Call #R$B772.
  $B741,$04 Jump to #R$B75A if #REGa is equal to #N$50.
  $B745,$04 Jump to #R$B71D if #REGa is not equal to #N$60.
  $B749,$03 Write #REGe to *#REGiy+#N$04.
  $B74C,$03 Write #REGd to *#REGiy+#N$05.
  $B74F,$03 Call #R$B77F.
  $B752,$01 Return if the zero flag is set.
  $B753,$03 Call #R$B772.
  $B756,$04 Jump to #R$B71D if #REGa is not equal to #N$50.
  $B75A,$03 Write #REGe to *#REGiy+#N$00.
  $B75D,$03 Write #REGd to *#REGiy+#N$01.
  $B760,$03 #REGhl=*#R$B6D8.
  $B763,$03 Call #R$A4E0.
  $B766,$02 Jump to #R$B71D if the zero flag is not set.
  $B768,$04 #REGix=*#R$B6D6.
  $B76C,$03 Call #R$A1AF.
  $B76F,$02,b$01 Set bit 0.
  $B771,$01 Return.

g $B6D6
W $B6D6,$02
W $B6D8,$02

c $B6DA

c $B772
  $B772,$03 #REGhl=#N$5DBF.
  $B775,$01 #REGa=#REGd.
  $B776,$02,b$01 Keep only bits 0-3.
  $B778,$01 #REGd=#REGa.
  $B779,$01 #REGhl+=#REGde.
  $B77A,$01 #REGa=*#REGhl.
  $B77B,$02,b$01 Keep only bits 4-7.
  $B77D,$01 Return.

g $B77E
B $B77E,$01

c $B77F
  $B77F,$07 Jump to #R$B7AA if *#R$B77E is not equal to #N$FF.
  $B786,$03 #REGhl=*#R$B6D6.
  $B789,$03 Return if #REGhl is zero.
  $B78C,$04 Write #N$00 to *#R$B77E.
  $B790,$03 #REGix=#REGhl (using the stack).
  $B793,$03 #REGl=*#REGix-#N$02.
  $B796,$03 #REGh=*#REGix-#N$01.
  $B799,$03 Write #REGhl to *#R$B6D6.
  $B79C,$03 #REGl=*#REGix+#N$00.
  $B79F,$03 #REGh=*#REGix+#N$01.
  $B7A2,$03 Call #R$A1C7.
  $B7A5,$02 Increment #REGhl by two.
  $B7A7,$03 #REGix=#REGhl (using the stack).
  $B7AA,$03 #REGa=*#REGix+#N$00.
  $B7AD,$02 Increment #REGix by one.
  $B7AF,$04 Jump to #R$B7CD if  bit 7 of #REGa is not set.
  $B7B3,$01 #REGd=#REGa.
  $B7B4,$03 #REGe=*#REGix+#N$00.
  $B7B7,$02 Increment #REGix by one.
  $B7B9,$02,b$01 Keep only bits 4-6.
  $B7BB,$04 Jump to #R$B7C6 if #REGa is equal to #N$60.
  $B7BF,$04 Jump to #R$B7C6 if #REGa is equal to #N$30.
  $B7C3,$03 Return if #REGa is not equal to #N$20.
  $B7C6,$05 Write #N$FF to *#R$B77E.
  $B7CB,$01 Set flags.
  $B7CC,$01 Return.

  $B7CD,$04 Jump to #R$B7F7 if #REGa is less than #N$20.
  $B7D1,$04 Jump to #R$B7DD if #REGa is less than #N$60.
  $B7D5,$03 Call #R$A840.
  $B7D8,$02,b$01 Set bit 0.
  $B7DA,$02 #REGa=#N$00.
  $B7DC,$01 Return.

  $B7DD,$02,b$01 Keep only bits 0-4.
  $B7DF,$01 Increment #REGa by one.
  $B7E0,$01 #REGb=#REGa.
  $B7E1,$03 #REGhl=#REGix (using the stack).
  $B7E4,$01 Increment #REGhl by one.
  $B7E5,$02 #REGc=#N$00.
  $B7E7,$03 Call #R$A990.
  $B7EA,$02 Decrease counter by one and loop back to #R$B7E7 until counter is zero.
  $B7EC,$03 #REGix=#REGhl (using the stack).
  $B7EF,$01 #REGa=#REGc.
  $B7F0,$03 Jump to #R$B7AA if #REGhl is not equal to #REGa.
  $B7F3,$02 Decrease #REGix by one.
  $B7F5,$02 Jump to #R$B7AA.

c $B91F
  $B91F,$04 #REGix=#R$9FF0.
  $B923,$03 Call #R$A0F7.
  $B926,$02 Jump to #R$B931 if the zero flag is set.
  $B928,$07 Return if *#R$A036 is equal to *#REGix+#N$00.
  $B92F,$02 Jump to #R$B923.
  $B931,$02,b$01 Set bit 0.
  $B933,$01 Return.

g $B934
B $B934,$01
B $B935,$01

c $B936

c $B9FA

g $BA13

c $BA20

c $BBE5

c $BC21

c $BC46

c $BC74

c $BC9C

c $BCC9

c $BD06

c $BD4B

c $BD51

c $BD7E

c $BE5A

c $BE72

c $BF08

c $BF1C

c $BF45

t $BF59 Table: Days Of The Week Strings
@ $BF59 label=Table_DaysOfWeekStrings
  $BF59,$15,$03

g $BF6E Messaging: Current Date
@ $BF6E label=Messaging_CurrentDate
T $BF6E,$0B "#STR$BF6E,$08,$0B".

c $BF79 Handler: Date Bar
@ $BF79 label=Handler_DateBar
N $BF79 #PUSHS #SIM(start=$BF79,stop=$C1BF)
. #UDGTABLE {
.   #SCR$02{$00,$120,$200,$10}(date-bar)
. } UDGTABLE# #POPS
  $BF79,$04 #REGix=#R$BF6E.
  $BF7D,$03 #REGa=*#R$9FE1.
  $BF80,$03 #REGhl=#R$BF59.
  $BF83,$03 Call #R$BFC6.
  $BF86,$02 Increment #REGix by one.
  $BF88,$03 #REGa=*#R$9FE0.
  $BF8B,$03 Call #R$BFB0.
  $BF8E,$02 Increment #REGix by one.
  $BF90,$03 #REGa=*#R$9FDF.
  $BF93,$03 Call #R$BFB0.
  $BF96,$06 Write *#R$9FE2 to *#REGix+#N$00.
N $BF9C Now the date bar has been updated, set up printing it to the screen.
  $BF9C,$03 Load #REGhl with a pointer to #R$BF6E.
  $BF9F,$02 Set the length of the date bar in #REGb (#N$0B bytes).
  $BFA1,$03 Jump to #R$C1A8.

c $BFA4

c $BFB0
  $BFB0,$01 #REGl=#REGa.
  $BFB1,$02 #REGh=#N$00.
  $BFB3,$03 #REGde=#N($000A,$04,$04).
  $BFB6,$03 Call #R$BFBB.
  $BFB9,$02 Jump to #R$BFA4.

  $BFBB,$02 #REGc=#N$2F.
  $BFBD,$01 Increment #REGc by one.
  $BFBE,$03 #REGhl-=#REGde (with carry).
  $BFC1,$02 Jump to #R$BFBD if #REGc is greater than or equal to #REGa.
  $BFC3,$01 #REGhl+=#REGde.
  $BFC4,$01 #REGa=#REGc.
  $BFC5,$01 Return.

c $BFC6 Populate Day Of The Week
@ $BFC6 label=PopulateDayOfWeek
R $BFC6 A Number representing the current day of the week
R $BFC6 HL Pointer to the table containing the days of the week strings
R $BFC6 IX Pointer to the current date messaging
  $BFC6,$06 Multiply the day of the week by #N$03 and store the result in
. #REGbc.
  $BFCC,$01 Add this to the base address of the table containing the days of
. the week strings.
N $BFCD Each day string is three characters long (e.g. "Mon" for Monday).
  $BFCD,$02 Set a counter in #REGb for three characters.
@ $BFCF label=PopulateDayOfWeek_Loop
  $BFCF,$01 Fetch a character from the table containing the days of the week
. strings.
  $BFD0,$03 Write the character to the current date messaging.
  $BFD3,$02 Move to the next character in the current date messaging.
  $BFD5,$01 Move to the next character in the days of the week string table.
  $BFD6,$02 Decrease the character counter by one and loop back to #R$BFCF
. until all three characters of the current day have been copied into the
. current date messaging bar.
  $BFD8,$01 Return.

c $BFD9 Handler: Game Clock
@ $BFD9 label=Handler_GameClock
N $BFD9 Handle the game ticker.
  $BFD9,$07 Increment *#R$9FDD by one.
N $BFE0 Handle the clock minutes.
  $BFE0,$04 Increment *#R$9FDF by one.
  $BFE4,$04 Return if *#REGhl is not equal to 60 (e.g. it's less than 60
. minutes).
N $BFE8 The minutes is at 60, which is invalid - so handle rolling the clock
. hour digits.
  $BFE8,$02 Reset the minutes back to #N$00 at *#REGhl.
N $BFEA Handle the clock hours.
  $BFEA,$04 Increment *#R$9FE0 by one.
  $BFEE,$05 Jump to #R$BFF6 if *#REGhl is not equal to 13 (e.g. it's less than
. 13 o'clock).
N $BFF3 The hours is at 13. which is invalid - so handle rolling the clock.
  $BFF3,$02 Reset the hours back to #N$01 at *#REGhl.
  $BFF5,$01 Return.
N $BFF6 Is it midday yet?
@ $BFF6 label=Handler_GameClock_AM_PM
  $BFF6,$03 Return if *#REGhl is not equal to 12.
N $BFF9 It's either midday or midnight, so flip between AM and PM.
  $BFF9,$03 #REGa=*#R$9FE2.
N $BFFC Smart way of altering the letter from "a" to "p" and back again.
. #TABLE(default,centre,centre)
. { =h Letter | =h Bits }
. { "a" | #EVAL($61,$02,$08) }
. { "p" | #EVAL($70,$02,$08) }
. TABLE#
  $BFFC,$02,b$01 Flip bits 0, 4.
  $BFFE,$03 Write this back to *#R$9FE2.
N $C001 If the clock went from PM to AM, handle rolling the day of the week.
  $C001,$03 Return if #REGa is not equal to ASCII #N$61 ("#CHR$61").
  $C004,$07 Increment *#R$9FE1 by one.
  $C00B,$01 Return.

c $C00C Get Time Period
@ $C00C label=GetTimePeriod
R $C00C O:A Time period code
D $C00C Handles calculating a time-period code for scheduling events.
. #TABLE(default,centre)
. { =h Time Period Code | =h Meaning }
. { #N$01 | Late night/ evening (8 PM - 5 AM) }
. { #N$02 | 7 PM }
. { #N$03 | Afternoon (1 PM - 6 PM) }
. { #N$04 | Morning/ Midday (7 AM - 12 PM) }
. { #N$05 | 6 AM }
. TABLE#
  $C00C,$03 Fetch *#R$9FE2.
  $C00F,$02 Check if its "A" for AM.
  $C011,$03 Load *#R$9FE0 into #REGa.
N $C014 Is it morning?
  $C014,$02 Jump to #R$C02B if *#R$9FE2 is ASCII #N$61 ("#CHR$61").
N $C016 It's the afternoon (as in, "PM").
  $C016,$04 Jump to #R$C035 if it's noon (12 PM).
  $C01A,$04 Jump to #R$C021 if it's before 8 PM.
N $C01E It's late PM/ evening; 8 PM - 11 PM.
@ $C01E label=TimePeriod_LateEvening
  $C01E,$02 #REGa=#N$01.
  $C020,$01 Return.
N $C021 It's before 8 PM, but break this down further.
@ $C021 label=TimePeriod_Pre_8PM
  $C021,$04 Jump to #R$C028 if its not 7 PM.
N $C025 It's 7 PM.
  $C025,$02 #REGa=#N$02.
  $C027,$01 Return.
N $C028 It's afternoon/ early PM; 1 PM - 6 PM.
@ $C028 label=TimePeriod_Afternoon
  $C028,$02 #REGa=#N$03.
  $C02A,$01 Return.
N $C02B It's morning, but break this down further.
@ $C02B label=TimePeriod_AM
  $C02B,$04 Jump to #R$C01E if it's midnight (12 AM).
  $C02F,$04 Jump to #R$C01E if it's before 6 AM.
  $C033,$02 Jump to #R$C038 if it's 6 AM.
N $C035 It's morning; 7 AM - noon (12 PM).
@ $C035 label=TimePeriod_Morning
  $C035,$02 #REGa=#N$04.
  $C037,$01 Return.
N $C038 It's early morning; 6 AM.
@ $C038 label=TimePeriod_EarlyMorning
  $C038,$02 #REGa=#N$05.
  $C03A,$01 Return.

c $C03B

c $C040 Save Game
@ $C040 label=SaveGame
N $C040 Prints "#STR$09A2".
  $C040,$03 #REGhl=#N$09A2.
  $C043,$03 Call #R$C1C0.
  $C046,$04 Write #REGde to *#R$C109.
  $C04A,$04 Write #REGix to *#R$C10B.
  $C04E,$04 #REGix=#R$C0FE.
  $C052,$03 #REGde=#N($0011,$04,$04).
  $C055,$01 Set #REGa to #N$00 to indicate this is a header block.
  $C056,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
  $C059,$02 #REGb=#N$32.
@ $C05B label=SaveGame_PauseLoop
  $C05B,$01 Halt operation (suspend CPU until the next interrupt).
  $C05C,$02 Decrease counter by one and loop back to #R$C05B until counter is zero.
  $C05E,$01 Disable interrupts.
  $C05F,$04 #REGde=*#R$C109.
  $C063,$04 #REGix=*#R$C10B.
  $C067,$02 Set #REGa to #N$FF to indicate this is a data block.
  $C069,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
  $C06C,$01 Disable interrupts.
N $C06D Prints "#STR$C0A5".
  $C06D,$03 #REGhl=#R$C0A5.
  $C070,$03 Call #R$C1CB.
N $C073 Prints "#STR$09AC".
  $C073,$03 #REGhl=#N$09AC.
  $C076,$03 Call #R$C1C0.
  $C079,$04 #REGix=#R$C0FE.
  $C07D,$03 #REGde=#N($0011,$04,$04).
  $C080,$02 Set #REGa to #N$00 to indicate this is a header block.
  $C082,$01 Set flags.
  $C083,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0556.html">LD_BYTES</a>.)
  $C086,$02 Jump to #R$C098 if there was any error returned.
  $C088,$01 Set flags.
@ $C089 label=LoadGameData
  $C089,$04 #REGde=*#R$C109.
  $C08D,$04 #REGix=*#R$C10B.
  $C091,$02 Set #REGa to #N$FF to indicate this is a data block.
  $C093,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0556.html">LD_BYTES</a>.)
  $C096,$01 Disable interrupts.
  $C097,$01 Return if there were no tape loading errors.
N $C098 There were errors ... so alert the player.
@ $C098 label=SaveGame_Error
  $C098,$01 Disable interrupts.
N $C099 Prints "#STR$C0B1".
  $C099,$03 #REGhl=#R$C0B1.
  $C09C,$03 Call #R$C1CB.
N $C09F Prints "#STR$09B2".
  $C09F,$03 #REGhl=#N$09B2.
  $C0A2,$03 Jump to #R$C1C0.

t $C0A5 Messaging: Rewind Tape
@ $C0A5 label=Messaging_RewindTape
  $C0A5 "#STR$C0A5".

t $C0B1 Messaging: Tape Error
@ $C0B1 label=Messaging_TapeError
  $C0B1,$0B "#STR$C0B1".

t $C0BC Messaging: Play Saved Game Tape
@ $C0BC label=Messaging_PlaySavedGameTape
  $C0BC,$23 "#STR$C0BC".

c $C0DF Load Game
@ $C0DF label=LoadGame
  $C0DF,$04 Write #REGde to *#R$C109.
  $C0E3,$04 Write #REGix to *#R$C10B.
N $C0E7 "#STR$C0BC".
  $C0E7,$03 #REGhl=#R$C0BC.
  $C0EA,$03 Call #R$C1CB.
@ $C0ED label=TryLoading
  $C0ED,$04 #REGix=#R$C0FE.
  $C0F1,$03 #REGde=#N($0011,$04,$04).
  $C0F4,$02 Set #REGa to #N$00 to indicate this is a header block.
  $C0F6,$01 Set flags.
  $C0F7,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0556.html">LD_BYTES</a>.)
  $C0FA,$02 Jump back to #R$C0ED if there was a tape loading error to try
. again.
  $C0FC,$02 Jump to #R$C089.

b $C0FE
W $C109
W $C10B

c $C10F Clear Screen
@ $C10F label=ClearScreen
  $C10F,$04 Set border colour to #INK$07.
  $C113,$03 #REGhl=#N$4000 (screen buffer location).
  $C116,$03 #REGde=#N$4001.
  $C119,$03 #REGbc=#N$1800.
  $C11C,$02 Write #N$00 to the screen buffer.
  $C11E,$02 Copy the #N$00 across the rest of the screen buffer bytes.
  $C120,$03 #REGbc=#N$02FF.
  $C123,$02 Write #COLOUR$38 to the attribute buffer.
  $C125,$02 Copy the #N$38 across the rest of the attribute buffer bytes.
  $C127,$01 Return.

g $C128
B $C128,$01

c $C129
  $C129,$04 Write #N$00 to *#R$A019.
  $C12D,$04 Write #N$01 to *#R$C128.
  $C131,$02 #REGa=#N$12.
  $C133,$03 Write #REGa to *#R$C1F5.
  $C136,$06 Write #N$5020 (screen buffer location) to *#R$C1F8.
  $C13C,$05 Write #N$02 to *#R$C1FA.
  $C141,$01 Return.

c $C142
  $C142,$04 Write #N$00 to *#R$C128.
  $C146,$02 #REGa=#N$24.
  $C148,$02 Jump to #R$C133.

c $C14A Draw Decorative Line
@ $C14A label=DrawDecorativeLine
D $C14A Draws a decorative horizontal pattern on screen as a separator.
.
. #PUSHS #SIM(start=$C14A,stop=$C18F)
. #UDGTABLE
. { #SCR$02{$00,$120,$200,$10}(decorative-line) }
. UDGTABLE# #POPS
  $C14A,$03 Call #R$C10F.
  $C14D,$05 Store the width value (#N$24) at *#R$C1F4.
  $C152,$06 Initialise the screen buffer starting point (#N$50E0) at *#R$C1F6.
  $C158,$02 Load the height value (#N$02) into #REGa.
@ $C15A label=DrawDecorativeLine_Custom
  $C15A,$03 Store the height value in *#R$C1FB.
  $C15D,$03 Call #R$C142.
  $C160,$03 #REGhl=#N$5140 (screen buffer location).
  $C163,$03 #REGde=#R$C190.
  $C166,$02 Set a counter in #REGb for #N$06 rows.
@ $C168 label=DrawDecorativeLine_RowLoop
  $C168,$02 Set a counter in #REGc for #N$08 repetitions.
  $C16A,$02 Stash the row counters and screen position on the stack.
@ $C16C label=DrawDecorativeLine_SegmentLoop
  $C16C,$02 #REGb=#N$04.
  $C16E,$01 Stash #REGde on the stack.
@ $C16F label=DrawDecorativeLine_CopyPatternLoop
  $C16F,$02 Copy the pattern byte to the current screen position.
  $C171,$01 Increment the pattern pointer by one.
  $C172,$01 Increment the screen position column by one.
  $C173,$02 Decrease counter by one and loop back to #R$C16F until counter is zero.
  $C175,$01 Restore the pattern pointer from the stack.
  $C176,$01 Decrease the segment counter by one.
  $C177,$02 Jump back to #R$C16C until all segments have been drawn.
N $C179 Skip to the next pattern.
  $C179,$04 Increment the pattern pointer by four.
  $C17D,$02 Restore #REGhl and #REGbc from the stack.
  $C17F,$01 Increment #REGh by one.
  $C180,$02 Decrease counter by one and loop back to #R$C168 until counter is zero.
N $C182 Now colour the line BRIGHT WHITE.
  $C182,$0D Write #COLOUR$78 to #N($0020,$04,$04) bytes starting from #N$5A40
. (attribute buffer location).
  $C18F,$01 Return.

b $C190 Data: Decorative Line
@ $C190 label=Data_DecorativeLine
  $C190,$08

c $C1A8 Print Date Bar
@ $C1A8 label=PrintDateBar
R $C1A8 HL Date messaging string
R $C1A8 B Length of messaging string
  $C1A8,$03 Set the screen buffer position in #REGhl (#N$5041).
  $C1AB,$01 #REGde=Pointer to date bar messaging string.
  $C1AC,$02 #REGc=#N$00.
N $C1AE Print a "SPACE" before the date string.
  $C1AE,$02 Load ASCII "SPACE" (#N$20) into #REGa.
  $C1B0,$03 Call #R$C388.
N $C1B3 Loop through the date messaging string and output it to the screen.
@ $C1B3 label=PrintDateBar_Loop
  $C1B3,$01 Fetch a character from *#REGde and store it in #REGa.
  $C1B4,$03 Call #R$C388.
  $C1B7,$01 Move to the next character of the message.
  $C1B8,$02 Decrease the string length counter by one and loop back to #R$C1B3
. until the whole of the date bar has been printed to the screen.
N $C1BA Print a "SPACE" after the date string.
  $C1BA,$02 Load ASCII "SPACE" (#N$20) into #REGa.
  $C1BC,$03 Call #R$C388.
  $C1BF,$01 Return.

c $C1C0 Print String And Wait For Keypress
@ $C1C0 label=PrintStringAndWaitForKeypress
  $C1C0,$03 Call #R$C1CB.
  $C1C3,$03 Call #R$C415.
  $C1C6,$02 Load "ENTER" (ASCII #N$0D) into #REGa for printing a newline
. character.
  $C1C8,$03 Jump to #R$C1FD.

c $C1CB Print String
@ $C1CB label=PrintString
R $C1CB HL Pointer to the string data
  $C1CB,$01 #REGa=*#REGhl.
N $C1CC Strip off the termination bit to leave only the ASCII value.
  $C1CC,$02,b$01 Keep only bits 0-6.
  $C1CE,$03 Call #R$C1FD.
N $C1D1 The string is terminated by bit 7 being set, so check if this is the
. final character or not.
  $C1D1,$03 Return if bit 7 of *#REGhl is set.
  $C1D4,$01 Move to the next byte in the string.
  $C1D5,$02 Jump back to #R$C1CB.

u $C1D7
  $C1D7,$01 Return.

c $C1D8 Error: Out Of Memory
@ $C1D8 label=Error_OutOfMemory
N $C1D8 Prints "#STR$13C5".
  $C1D8,$03 #REGhl=#N$13C5.
  $C1DB,$03 Call #R$C1C0.
  $C1DE,$03 Jump to #R$A0EB.


c $C1E1
  $C1E1,$01 Stash #REGaf on the stack.
  $C1E2,$06 #HTML(Jump to #R$C1EA if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3C.html">TV-FLAG</a> is not zero.)
  $C1E8,$01 Restore #REGaf from the stack.
  $C1E9,$01 Return.

  $C1EA,$06 Jump to #R$C1FC if *#R$A027 is not zero.
  $C1F0,$01 Restore #REGaf from the stack.
  $C1F1,$03 Jump to #R$C2BA.

g $C1F4 Storage Decorative Line Width
@ $C1F4 label=DecorativeLine_Width
B $C1F4,$01

g $C1F5
B $C1F5,$01

g $C1F6 Storage Decorative Line Screen Position
@ $C1F6 label=DecorativeLine_ScreenPosition
W $C1F6,$02

g $C1FA
B $C1FA,$01

g $C1FB
B $C1FB,$01

c $C1FC
  $C1FC,$01 Restore #REGaf from the stack.
  $C1FD,$03 Stash #REGhl, #REGbc and #REGaf on the stack.
  $C200,$04 #REGc=*#R$C1FB.
  $C204,$01 Restore #REGaf from the stack.
  $C205,$01 Stash #REGaf on the stack.
  $C206,$03 #REGhl=*#R$C1F6.
  $C209,$04 Jump to #R$C214 if #REGa is not equal to #N$0D.
  $C20D,$02 #REGa=#N$20.
  $C20F,$03 Call #R$C388.
  $C212,$02 Jump to #R$C224.
  $C214,$04 Jump to #R$C249 if #REGa is equal to #N$08.
  $C218,$03 Call #R$C240.
  $C21B,$03 Call #R$C388.
  $C21E,$03 #REGa=*#R$C1F4.
  $C221,$01 Decrease #REGa by one.
  $C222,$02 Jump to #R$C22D if #REGa is not equal to #N$08.
  $C224,$02 #REGl=#N$E0.
  $C226,$02 #REGc=#N$02.
  $C228,$03 Call #R$C271.
  $C22B,$02 #REGa=#N$24.
  $C22D,$03 Write #REGa to *#R$C1F4.
  $C230,$04 Write #REGc to *#R$C1FB.
  $C234,$03 Write #REGhl to *#R$C1F6.
  $C237,$02 Load #REGa with ASCII code #N$2B ("#CHR$2B").
  $C239,$03 Call #R$C388.
  $C23C,$03 Restore #REGaf, #REGbc and #REGhl from the stack.
  $C23F,$01 Return.

c $C240 Validate Keypress
@ $C240 label=ValidateKeypress
  $C240,$06 Return if the keypress ASCII code is less than #N$61 ("#CHR$61") or
. greater than #N$7A ("#CHR$7A").
  $C246,$02,b$01 Keep only bits 0-4, 6.
  $C248,$01 Return.

c $C249
  $C249,$02 #REGa=#N$20.
  $C24B,$03 Call #R$C388.
  $C24E,$03 Call #R$C267.
  $C251,$03 Call #R$C267.
  $C254,$03 #REGa=*#R$C1F4.
  $C257,$01 Increment #REGa by one.
  $C258,$04 Jump to #R$C22D if #REGa is not equal to #N$25.
  $C25C,$02 #REGl=#N$FE.
  $C25E,$02 #REGc=#N$07.
  $C260,$03 Call #R$C29C.
  $C263,$02 #REGa=#N$01.
  $C265,$02 Jump to #R$C22D.
  $C267,$04 #REGc-=#N$07.
  $C26B,$01 Return if the carry flag isn't set.
  $C26C,$01 Decrease #REGl by one.
  $C26D,$03 #REGc=#REGa+#N$08.
  $C270,$01 Return.

c $C271
  $C271,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $C274,$03 #REGhl=#N$5080 (screen buffer location).
  $C277,$03 #REGde=#N$5060 (screen buffer location).
  $C27A,$02 #REGa=#N$08.
  $C27C,$02 Stash #REGhl and #REGde on the stack.
  $C27E,$03 #REGbc=#N($0080,$04,$04).
  $C281,$02 LDIR.
  $C283,$02 Restore #REGde and #REGhl from the stack.
  $C285,$01 Increment #REGh by one.
  $C286,$01 Increment #REGd by one.
  $C287,$01 Decrease #REGa by one.
  $C288,$02 Jump to #R$C27C if #REGa is not equal to #N$08.
  $C28A,$03 #REGhl=#N$50E0 (screen buffer location).
  $C28D,$02 #REGb=#N$24.
  $C28F,$02 #REGc=#N$01.
  $C291,$02 #REGa=#N$20.
  $C293,$03 Call #R$C388.
  $C296,$02 Decrease counter by one and loop back to #R$C293 until counter is zero.
  $C298,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $C29B,$01 Return.

c $C29C
  $C29C,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $C29F,$03 #REGhl=#N$50DF (screen buffer location).
  $C2A2,$03 #REGde=#N$50FF (screen buffer location).
  $C2A5,$02 #REGa=#N$08.
  $C2A7,$02 Stash #REGhl and #REGde on the stack.
  $C2A9,$03 #REGbc=#N($0080,$04,$04).
  $C2AC,$02 LDDR.
  $C2AE,$02 Restore #REGde and #REGhl from the stack.
  $C2B0,$01 Increment #REGh by one.
  $C2B1,$01 Increment #REGd by one.
  $C2B2,$01 Decrease #REGa by one.
  $C2B3,$02 Jump to #R$C2A7 if #REGa is not equal to #N$08.
  $C2B5,$03 #REGhl=#N$5060 (screen buffer location).
  $C2B8,$02 Jump to #R$C28D.

c $C2BA
  $C2BA,$03 Stash #REGhl, #REGbc and #REGaf on the stack.
  $C2BD,$03 #REGhl=*#R$C1F8.
  $C2C0,$04 #REGc=*#R$C1FA.
  $C2C4,$01 Restore #REGaf from the stack.
  $C2C5,$01 Stash #REGaf on the stack.
  $C2C6,$04 Jump to #R$C2EE if #REGa is not equal to #N$0D.
  $C2CA,$03 #REGa=*#R$A019.
  $C2CD,$04 Jump to #R$C2D6 if #REGa is not equal to #N$0F.
  $C2D1,$03 Call #R$C306.
  $C2D4,$02 #REGa=#N$FF.
  $C2D6,$01 Increment #REGa by one.
  $C2D7,$03 Write #REGa to *#R$A019.
  $C2DA,$03 #REGhl=#N$5020 (screen buffer location).
  $C2DD,$02 #REGc=#N$02.
  $C2DF,$03 Call #R$C316.
  $C2E2,$03 #REGa=*#R$C128.
  $C2E5,$01 Set flags.
  $C2E6,$02 #REGa=#N$24.
  $C2E8,$02 Jump to #R$C2F8 if #REGa is equal to #REGa.
  $C2EA,$02 #REGa=#N$12.
  $C2EC,$02 Jump to #R$C2F8.

  $C2EE,$03 Call #R$C388.
  $C2F1,$03 #REGa=*#R$C1F5.
  $C2F4,$01 Decrease #REGa by one.
  $C2F5,$03 Jump to #R$C2CA if #REGa is zero.
  $C2F8,$03 Write #REGa to *#R$C1F5.
  $C2FB,$03 Write #REGhl to *#R$C1F8.
  $C2FE,$04 Write #REGc to *#R$C1FA.
  $C302,$03 Restore #REGaf, #REGbc and #REGhl from the stack.
  $C305,$01 Return.

c $C306
  $C306,$01 Stash #REGhl on the stack.
  $C307,$03 #REGhl=#N$5A5F (attribute buffer location).
  $C30A,$02 Set bit 7 of *#REGhl.
  $C30C,$03 Call #R$C415.
  $C30F,$02 Reset bit 7 of *#REGhl.
  $C311,$03 Call #R$C142.
  $C314,$01 Restore #REGhl from the stack.
  $C315,$01 Return.

c $C316
  $C316,$03 #REGa=*#R$C128.
  $C319,$01 Set flags.
  $C31A,$03 Call #R$C3E4 if #REGa is equal to #N$00.
  $C31D,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $C320,$03 #REGhl=#N$4020 (screen buffer location).
  $C323,$03 #REGde=#N$4000.
  $C326,$03 #REGbc=#N($0011,$04,$04).
  $C329,$03 #REGa=*#R$C128.
  $C32C,$01 Set flags.
  $C32D,$02 #REGa=#N$20.
  $C32F,$02 Jump to #R$C333 if #REGa is equal to #REGa.
  $C331,$02 #REGa=#N$10.
  $C333,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $C336,$02 #REGc=#N$08.
  $C338,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $C33B,$01 #REGc=#REGa.
  $C33C,$02 LDIR.
  $C33E,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $C341,$01 Increment #REGh by one.
  $C342,$01 Increment #REGd by one.
  $C343,$01 Decrease #REGc by one.
  $C344,$02 Jump to #R$C338 if #REGc is not equal to #REGa.
  $C346,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $C349,$01 Stash #REGaf on the stack.
  $C34A,$03 Call #R$C37D.
  $C34D,$03 Call #R$C37D.
  $C350,$01 Restore #REGaf from the stack.
  $C351,$01 Decrease #REGc by one.
  $C352,$02 Jump to #R$C333 if #REGc is not equal to #REGa.
  $C354,$04 Jump to #R$C363 if #REGa is equal to #N$10.
  $C358,$03 #REGhl=#N$5820 (attribute buffer location).
  $C35B,$03 #REGde=#N$5800 (screen buffer location).
  $C35E,$03 #REGbc=#N$0220.
  $C361,$02 LDIR.
  $C363,$03 #REGa=*#R$C128.
  $C366,$01 Set flags.
  $C367,$02 #REGb=#N$24.
  $C369,$02 Jump to #R$C36D if #REGa is equal to #REGa.
  $C36B,$02 #REGb=#N$12.
  $C36D,$03 #REGhl=#N$5020 (screen buffer location).
  $C370,$02 #REGc=#N$02.
  $C372,$02 #REGa=#N$20.
  $C374,$03 Call #R$C388.
  $C377,$02 Decrease counter by one and loop back to #R$C374 until counter is zero.
  $C379,$03 Restore #REGde, #REGhl and #REGbc from the stack.
  $C37C,$01 Return.

c $C37D
  $C37D,$01 Exchange the #REGde and #REGhl registers.
  $C37E,$01 #REGa=#REGl.
  $C37F,$02 #REGa+=#N$20.
  $C381,$01 #REGl=#REGa.
  $C382,$01 Return if #REGa is greater than #REGa.
  $C383,$01 #REGa=#REGh.
  $C384,$02 #REGa+=#N$08.
  $C386,$01 #REGh=#REGa.
  $C387,$01 Return.

c $C388 Print Character
@ $C388 label=PrintCharacter
R $C388 A Character to print
R $C388 HL Screen buffer address
  $C388,$04 Stash #REGaf, #REGbc, #REGde and #REGhl on the stack.
  $C38C,$03 Load the character into #REGhl.
  $C38F,$03 Multiply by #N$08 (each font character is #N$08 bytes of data).
  $C392,$05 #HTML(#REGde+=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $C397,$01 Restore the screen buffer address from the stack.
  $C398,$01 But stash a copy of it back on the stack.
  $C399,$02 Set a counter in #REGb for #N$08 bytes of the font data.
  $C39B,$01 #REGa=*#REGde.
  $C39C,$02 Stash #REGbc and #REGaf on the stack.
  $C39E,$01 Decrease #REGc by one.
  $C39F,$01 Increment #REGc by one.
  $C3A0,$02 #REGb=#N$FF.
  $C3A2,$02 Jump to #R$C3AB if #REGc is zero.
  $C3A4,$02 Shift #REGa right.
  $C3A6,$02 Shift #REGb right.
  $C3A8,$01 Decrease #REGc by one.
  $C3A9,$02 Jump to #R$C3A4 if #REGc is not zero.
  $C3AB,$01 #REGc=#REGa.
  $C3AC,$01 #REGa=#REGb.
  $C3AD,$01 Invert the bits in #REGa.
  $C3AE,$01 Merge the bits from *#REGhl.
  $C3AF,$01 Set the bits from #REGc.
  $C3B0,$01 Write #REGa to *#REGhl.
  $C3B1,$02 Restore #REGaf and #REGbc from the stack.
  $C3B3,$01 Decrease #REGc by one.
  $C3B4,$01 Increment #REGc by one.
  $C3B5,$02 Jump to #R$C3D0 if #REGc is equal to #REGc.
  $C3B7,$02 Stash #REGbc and #REGaf on the stack.
  $C3B9,$02 #REGa=#N$08.
  $C3BB,$01 #REGa-=#REGc.
  $C3BC,$01 #REGc=#REGa.
  $C3BD,$01 Restore #REGaf from the stack.
  $C3BE,$02 #REGb=#N$FF.
  $C3C0,$02 Shift #REGa left (with carry).
  $C3C2,$02 Shift #REGb left (with carry).
  $C3C4,$01 Decrease #REGc by one.
  $C3C5,$02 Jump to #R$C3C0 if #REGc is not equal to #REGc.
  $C3C7,$01 #REGc=#REGa.
  $C3C8,$01 #REGa=#REGb.
  $C3C9,$01 Invert the bits in #REGa.
  $C3CA,$01 Increment #REGhl by one.
  $C3CB,$01 Merge the bits from *#REGhl.
  $C3CC,$01 Set the bits from #REGc.
  $C3CD,$01 Write #REGa to *#REGhl.
  $C3CE,$01 Decrease #REGhl by one.
  $C3CF,$01 Restore #REGbc from the stack.
  $C3D0,$01 Increment #REGde by one.
  $C3D1,$01 Increment #REGh by one.
  $C3D2,$02 Decrease counter by one and loop back to #R$C39B until counter is zero.
  $C3D4,$03 Restore #REGhl, #REGde and #REGbc from the stack.
  $C3D7,$01 #REGa=#REGc.
  $C3D8,$02 #REGa+=#N$07.
  $C3DA,$02 Compare #REGa with #N$08.
  $C3DC,$02 Jump to #R$C3E1 if #REGa is less than #N$08.
  $C3DE,$02 #REGa-=#N$08.
  $C3E0,$01 Increment #REGl by one.
  $C3E1,$01 #REGc=#REGa.
  $C3E2,$01 Restore #REGaf from the stack.
  $C3E3,$01 Return.
  $C3E4,$03 #REGa=*#R$A008.
  $C3E7,$01 Set flags.
  $C3E8,$01 Return if #REGl is equal to #REGa.
  $C3E9,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $C3EC,$03 #REGhl=#N($4000,$04,$04).
  $C3EF,$02 #REGb=#N$08.
  $C3F1,$02 Stash #REGbc and #REGhl on the stack.
  $C3F3,$03 Call #R$C403.
  $C3F6,$01 Restore #REGhl from the stack.
  $C3F7,$01 Increment #REGh by one.
  $C3F8,$01 Restore #REGbc from the stack.
  $C3F9,$02 Decrease counter by one and loop back to #R$C3F1 until counter is zero.
  $C3FB,$02 #REGa=#N$04.
  $C3FD,$02 OUT #N$FB
  $C3FF,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $C402,$01 Return.
  $C403,$01 #REGa=#REGb.
  $C404,$02 Compare #REGa with #N$03.
  $C406,$01 #REGa-=#REGa.
  $C407,$02,b$01 Keep only bits 1.
  $C409,$02 OUT #N$FB
  $C40B,$01 #REGd=#REGa.
  $C40C,$02 #REGa=byte from port #N$FB.
  $C40E,$01 #REGa+=#REGa.
  $C40F,$01 Return if #REGa is lower than #N$03.
  $C410,$02 Jump to #R$C40C if #REGa is greater than or equal to #N$03.
  $C412,$03 #HTML(Jump to <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0EF4.html#0F12">COPY_LINE#0F12</a>.)

c $C415 Wait For Keypress
@ $C415 label=WaitForKeypress_Loop
R $C415 O:A The ASCII code keypress value
N $C415 Bit 7 is only set after a key has been pressed.
  $C415,$03 Call #R$C41F.
  $C418,$04 Jump to back #R$C415 until a key has been pressed.
N $C41C Strip off the set bit for the response.
  $C41C,$02,b$01 Keep only bits 0-6.
  $C41E,$01 Return.

c $C41F Get Keypress
@ $C41F label=GetKeypress
R $C41F O:A Keypress value, or #N$00 for no keypress
  $C41F,$07 Stash #REGiy, #REGix, #REGhl, #REGde and #REGbc on the stack.
  $C426,$04 #HTML(#REGiy=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3A.html">ERR_NR</a>.)
  $C42A,$01 Enable interrupts.
  $C42B,$01 Halt operation (suspend CPU until the next interrupt).
  $C42C,$01 Disable interrupts.
  $C42D,$07 #HTML(Jump to #R$C437 if bit 5 of 
. *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>
. is set, indicating that a key has been pressed.)
N $C434 No key has been pressed.
  $C434,$01 Load #REGa with #N$00 (no keypress).
  $C435,$02 Jump to #R$C456.
N $C437 A key has been pressed, so process it.
@ $C437 label=GetKeypress_Process
  $C437,$05 #HTML(Reset bit 5 of *<a href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>
. which resets "when a new key has been pressed".)
  $C43C,$07 #HTML(Jump to #R$C445 if
. *<a href="https://skoolkid.github.io/rom/asm/5C08.html">LAST-K</a> (last key
. pressed) is not ASCII #N$5F ("#CHR$5F").)
  $C443,$02 #REGa=#N$18.
N $C445 Did the player press "DELETE"?
@ $C445 label=GetKeypress_CheckDelete
  $C445,$04 #HTML(Jump to #R$C44B if
. *<a href="https://skoolkid.github.io/rom/asm/5C08.html">LAST-K</a> (last key
. pressed) is not ASCII #N$0C ("DELETE").)
  $C449,$02 Load #REGa with #N$08 (delete was pressed).
N $C44B Did the player press "UP"?
@ $C44B label=GetKeypress_CheckUp
  $C44B,$04 #HTML(Jump to #R$C451 if
. *<a href="https://skoolkid.github.io/rom/asm/5C08.html">LAST-K</a> (last key
. pressed) is not ASCII #N$0B ("UP").)
  $C44F,$02 Load #REGa with #N$5B (up was pressed).
@ $C451 label=GetKeypress_Validate
  $C451,$03 Call #R$C240.
  $C454,$02 Set bit 7 of #REGa.
@ $C456 label=GetKeypress_Return
  $C456,$07 Restore #REGbc, #REGde, #REGhl, #REGix and #REGiy from the stack.
  $C45D,$01 Return.

c $C45E

c $C493

c $C4B2

c $C4D1

c $C821
  $C821,$03 Stash #REGix and #REGbc on the stack.
  $C824,$03 Call #R$D237.
  $C827,$01 #REGb=#REGa.
  $C828,$03 #REGa=*#R$A036.
  $C82B,$03 Call #R$C863.
  $C82E,$03 Jump to #R$C85D if #REGa is equal to #REGb.
  $C831,$06 Jump to #R$C85A if bit 7 of *#REGix+#N$05 is not set.
  $C837,$01 #REGc=#REGa.
  $C838,$01 #REGa=#REGb.
  $C839,$01 #REGb=#REGc.
  $C83A,$03 Call #R$C863.
  $C83D,$01 #REGc=#REGa.
  $C83E,$03 #REGa=*#R$A036.
  $C841,$03 Jump to #R$C85D if #REGa is equal to #REGc.
  $C844,$01 #REGa=#REGc.
  $C845,$03 Jump to #R$C85A if #REGa is not equal to #REGb.
  $C848,$01 Increment #REGa by one.
  $C849,$02 Jump to #R$C85D if #REGa is not equal to #REGb.
  $C84B,$03 #REGb=*#REGix+#N$00.
  $C84E,$08 Jump to #R$C85D if *#R$A00A is equal to *#REGix+#N$0F.
  $C856,$02 Increment #REGix by one.
  $C858,$02 Decrease counter by one and loop back to #R$C851 until counter is zero.
  $C85A,$01 #REGa=#N$00.
  $C85B,$02 Jump to #R$C85F.

  $C85D,$02,b$01 Set bit 0.
  $C85F,$03 Restore #REGbc and #REGix from the stack.
  $C862,$01 Return.

c $C863
  $C863,$02 Stash #REGix on the stack.
  $C865,$03 Call #R$D237.
  $C868,$03 Call #R$C86E.
  $C86B,$02 Restore #REGix from the stack.
  $C86D,$01 Return.

c $C86E

c $C8A7
  $C8A7,$03 Call #R$D237.
  $C8AA,$03 #REGa=*#REGix+#N$00.
  $C8AD,$01 Decrease #REGa by one.
  $C8AE,$01 Return.

c $C8AF
  $C8AF,$03 Call #R$D237.
  $C8B2,$03 #REGa=*#REGix+#N$01.
  $C8B5,$03 Return if #REGa is equal to #N$FF.
  $C8B8,$03 Call #R$C8BE.
  $C8BB,$01 Return if #REGa is not equal to #N$FF.
  $C8BC,$02 Jump to #R$C8B2.

c $C8BE
  $C8BE,$03 Call #R$D237.
  $C8C1,$04 Test bit 6 of *#REGix+#N$05.
  $C8C5,$01 Return.

c $C8C6

c $C8EF
  $C8EF,$07 Jump to #R$C90C if *#R$A034 is greater than or equal to #N$FE.
  $C8F6,$05 Compare *#R$A00F with #N$05.
  $C8FB,$03 #REGa=*#R$A034.
  $C8FE,$02 Jump to #R$C905 if *#R$A00F is greater than or equal to #N$05.
  $C900,$03 Call #R$D224.
  $C903,$02 Jump to #R$C908.

  $C905,$03 Call #R$D237.
  $C908,$04 Write #REGix to *#R$A013.
  $C90C,$06 Return if *#R$A035 is greater than #N$FE.
  $C912,$05 Compare *#R$A010 with #N$05.
  $C917,$03 #REGa=*#R$A035.
  $C91A,$02 Jump to #R$C921 if *#R$A010 is greater than or equal to #N$05.
  $C91C,$03 Call #R$D224.
  $C91F,$02 Jump to #R$C924.
  $C921,$03 Call #R$D237.
  $C924,$04 Write #REGix to *#R$A015.
  $C928,$01 Return.

c $C929
  $C929,$03 Call #R$C8EF.
  $C92C,$07 Jump to #R$C972 if *#R$A034 is greater than or equal to #N$FE.
  $C933,$04 #REGix=*#R$A017.
  $C937,$06 Jump to #R$C94D if bit 6 of *#REGix+#N$05 is not set.
  $C93D,$01 #REGa=#N$00.
  $C93E,$03 Call #R$D1DC.
  $C941,$02 Jump to #R$C94D if #REGa is greater than or equal to #N$FE.
  $C943,$03 #REGa=*#R$A033.
  $C946,$03 Call #R$D349.
  $C949,$04 Jump to #R$C960 if #REGa is not equal to #N$FF.
  $C94D,$07 Jump to #R$C972 if *#R$A00F is less than #N$07.
  $C954,$04 #REGix=*#R$A013.
  $C958,$03 #REGa=*#R$A033.
  $C95B,$03 Call #R$D1DC.
  $C95E,$02 Jump to #R$C972 if #REGa is greater than or equal to #N$07.
  $C960,$03 #REGa=*#REGix+#N$01.
  $C963,$01 #REGe=#REGa.
  $C964,$02 #REGd=#N$00.
  $C966,$03 #REGhl=#R$AA71.
  $C969,$01 Decrease #REGde by one.
  $C96A,$01 #REGhl+=#REGde.
  $C96B,$01 #REGhl+=#REGde.
  $C96C,$01 #REGe=*#REGhl.
  $C96D,$01 Increment #REGhl by one.
  $C96E,$01 #REGd=*#REGhl.
  $C96F,$01 Exchange the #REGde and #REGhl registers.
  $C970,$02 Jump to #R$C996.

  $C972,$03 #REGa=*#R$A033.
  $C975,$04 #REGix=#R$9F38.
  $C979,$03 Call #R$D34E.
  $C97C,$05 Jump to #R$DC15 if #REGa is equal to #N$FF.
  $C981,$03 #REGl=*#REGix+#N$01.
  $C984,$03 #REGh=*#REGix+#N$02.
  $C987,$02 Jump to #R$C996.

c $C989
  $C989,$03 #REGhl=#REGix (using the stack).
  $C98C,$01 Stash #REGhl on the stack.
  $C98D,$03 Call #R$C8EF.
  $C990,$03 Call #R$C996.
  $C993,$02 Restore #REGix from the stack.
  $C995,$01 Return.

c $C996

g $CB28
W $CB28,$02
W $CB2A,$02

c $CB2C

c $CB43

g $CB79
B $CB79,$01
B $CB7A,$01

c $CB7B

c $CBA7

c $CBC2

g $CC0B
B $CC0B,$01
B $CC0C,$01
B $CC0D,$01

c $CC0E Find Character
@ $CC0E label=FindCharacter
R $CC0E A Character ID
R $CC0E O:A The character ID or #N$FF if it wasn't found
R $CC0E O:IY Pointer to character data
R $CC0E O:F The zero flag will be set if the character wasn't found
N $CC0E Stash some registers so they don't get corrrupted.
  $CC0E,$02 Stash #REGde and #REGbc on the stack.
  $CC10,$01 Store the character ID in #REGc.
  $CC11,$03 Load the length of the character data #N($0008,$04,$04) bytes into
. #REGde.
  $CC14,$04 #REGiy=#R$9860.
@ $CC18 label=FindCharacter_Loop
  $CC18,$03 Fetch the current characters ID from the timetable pointer.
  $CC1B,$03 Jump to #R$CC26 if this character ID and the requested character ID
. match.
  $CC1E,$04 Jump to #R$CC26 if the termination character has been reached
. (#N$FF).
  $CC22,$02 Add #N($0008,$04,$04) bytes to the timetable pointer to move to the
. next set of character data.
  $CC24,$02 Jump to #R$CC18.
N $CC26 Return with some housekeeping.
@ $CC26 label=FindCharacter_Return
  $CC26,$02 Restore #REGbc and #REGde from the stack.
  $CC28,$01 Return.

c $CC29
  $CC29,$03 #REGa=*#R$A036.
  $CC2C,$03 Call #R$D495.
  $CC2F,$04 Write #REGix to *#R$A017.
  $CC33,$03 Write #REGa to *#R$A00A.
  $CC36,$01 Return.

c $CC37
  $CC37,$01 Stash the character ID on the stack briefly.
  $CC38,$04 Write #N$00 to *#R$CC0B.
  $CC3C,$01 Restore the character ID from the stack.
  $CC3D,$03 Call #R$CC0E.
  $CC40,$02 Was the character ID found?
  $CC42,$03 #REGhl=#N($0001,$04,$04).
  $CC45,$03 Jump to #R$CC74 if the character ID wasn't found, and the
. termination character was returned instead.
N $CC48 The character is active in the timetable.
  $CC48,$04 Write the characters timetable pointer to *#R$9FDB.
  $CC4C,$03 Write the character ID to *#R$A036.
  $CC4F,$03 Call #R$B91F.
  $CC52,$02 #REGa=#N$00.
  $CC54,$02 Jump to #R$CC57 if #REGa is not equal to #N$00.
  $CC56,$01 Increment #REGa by one.
  $CC57,$03 Write #REGa to *#R$CC0D.
  $CC5A,$03 Call #R$CC29.
  $CC5D,$03 Call #R$D045.
  $CC60,$01 #REGa-=#REGa.
  $CC61,$03 #HTML(Write #REGa to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3C.html">TV-FLAG</a>.)
  $CC64,$03 #REGa=*#R$9860.
  $CC67,$03 Call #R$C821.
  $CC6A,$02 Jump to #R$CC71 if #REGa is equal to #N$00.
  $CC6C,$05 #HTML(Write #N$01 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3C.html">TV-FLAG</a>.)
  $CC71,$03 #REGhl=#N($0000,$04,$04).
  $CC74,$03 Write #REGhl to *#R$A01F.
  $CC77,$01 Return.

c $CC78 Script Interpreter
@ $CC78 label=ScriptInterpreter
R $CC78 A Character ID
  $CC78,$03 Call #R$CC5A.
  $CC7B,$04 #REGiy=#R$9FDB.
  $CC7F,$03 Call #R$D008.
  $CC82,$06 Get the characters script position.
  $CC88,$04 Write #N$00 to *#R$B934.
  $CC8C,$08 Jump to #R$CD8B if *#R$CC0B is equal to #N$0A.
@ $CC94 label=FindNextCommand
  $CC94,$04 Jump to #R$CC9B if *#REGhl is not equal to #REGa.
  $CC98,$01 Increment #REGhl by one.
  $CC99,$02 Jump to #R$CC94.
N $CC9B Process the current script command.
@ $CC9B label=ProcessScriptCommand
  $CC9B,$03 #REGix=#REGhl (using the stack).
  $CC9E,$03 Write #REGhl to *#R$9FD9.
  $CCA1,$02,b$01 Keep only bits 0-3.
  $CCA3,$04 Jump to #R$CCF3 if #REGa is greater than or equal to #N$0A.
  $CCA7,$07 Jump to #R$CCC7 if *#R$CC0D is not equal to #N$01.
  $CCAE,$01 #REGa-=#REGa.
  $CCAF,$03 Write #REGa to *#R$CC0D.
  $CCB2,$01 #REGa=*#REGhl.
  $CCB3,$03 Call #R$B936.
  $CCB6,$03 Jump to #R$CD91 if #REGa is less than #N$01.
  $CCB9,$02 Jump to #R$CCC7 if #REGa is equal to #N$01.
  $CCBB,$03 Call #R$C4D1.
  $CCBE,$01 Return if #REGa is greater than #N$01.
  $CCBF,$03 Call #R$CFB6.
  $CCC2,$04 Write #N$02 to *#REGix+#N$05.
  $CCC6,$01 Return.

c $CCC7 Execute Character Command
@ $CCC7 label=ExecuteCharacterCommand
  $CCC7,$01 Get the command byte.
  $CCC8,$02,b$01 Extract the command type.
  $CCCA,$05 Jump to #R$CE3B for command type #N$07.
  $CCCF,$05 Jump to #R$CD95 for command type #N$06.
  $CCD4,$05 Jump to #R$CDA1 for command type #N$05.
  $CCD9,$05 Jump to #R$CDBF for command type #N$04.
  $CCDE,$05 Jump to #R$CE6A for command type #N$01.
  $CCE3,$05 Jump to #R$CE4F for command type #N$03.
  $CCE8,$04 Jump to #R$CD24 for command type #N$08.
  $CCEC,$04 Jump to #R$CD47 for command type #N$09.
  $CCF0,$03 Jump to #R$CE18.

c $CCF3
  $CCF3,$04 Jump to #R$CD06 if #REGa is not equal to #N$0E.
  $CCF7,$06 Write *#REGix+#N$01 to *#REGiy+#N$01.
  $CCFD,$06 Write *#REGix+#N$02 to *#REGiy+#N$02.
  $CD03,$03 Jump to #R$CC82.

  $CD06,$04 Jump to #R$CD08 if #REGa is equal to #N$0C.
  $CD0A,$04 Jump to #R$CD17 if #REGa is not equal to #N$0B.
  $CD0E,$03 Call #R$CFCF.
  $CD11,$03 Return if #REGa is equal to #N$02.
  $CD14,$03 Jump to #R$CE8F.

  $CD17,$04 Jump to #R$CD82 if #REGa is not equal to #N$0A.
  $CD1B,$03 Call #R$CFCF.
  $CD1E,$03 Return if #REGa is equal to #N$02.
  $CD21,$03 Jump to #R$CEB8.

c $CD24 Handle Push Stack
@ $CD24 label=HandlePushStack
  $CD24,$03 #REGa=*#REGix+#N$01.
  $CD27,$01 Stash #REGaf on the stack.
  $CD28,$02 #REGa=#N$02.
  $CD2A,$03 Call #R$A11C.
  $CD2D,$03 #REGhl=*#R$9FE7.
  $CD30,$04 Write #REGix to *#R$9FE7.
  $CD34,$03 Write #REGl to *#REGix-#N$02.
  $CD37,$03 Write #REGh to *#REGix-#N$01.
  $CD3A,$06 Write *#R$A036 to *#REGix+#N$00.
  $CD40,$01 Restore #REGaf from the stack.
  $CD41,$03 Write #REGa to *#REGix+#N$01.
  $CD44,$03 Jump to #R$CE8F.

c $CD47 Handle Pop Stack
@ $CD47 label=HandlePopStack
  $CD47,$03 #REGb=*#REGix+#N$01.
  $CD4A,$04 #REGix=#R$9FE9.
  $CD4E,$03 Call #R$A0F7.
  $CD51,$03 Jump to #R$CEB8 if #REGa is equal to #N$02.
  $CD54,$08 Jump to #R$CD4E if *#R$A036 is not equal to *#REGix+#N$01.
  $CD5C,$06 Jump to #R$CD4E if #REGb is not equal to *#REGix+#N$00.
  $CD62,$02 Stash #REGiy on the stack.
  $CD64,$03 #REGde=#REGix (using the stack).
  $CD67,$04 #REGiy=#R$9FE7.
  $CD6B,$03 Call #R$A104.
  $CD6E,$03 #REGl=*#REGix-#N$02.
  $CD71,$03 #REGh=*#REGix-#N$01.
  $CD74,$03 Write #REGl to *#REGiy-#N$02.
  $CD77,$03 Write #REGh to *#REGiy-#N$01.
  $CD7A,$03 Call #R$A1C7.
  $CD7D,$02 Restore #REGiy from the stack.
  $CD7F,$03 Jump to #R$CE8F.

c $CD82 Set Character Script Error
@ $CD82 label=SetCharacterScriptError
N $CD82 Set script completion flag.
  $CD82,$06 Write #N($0001,$04,$04) to *#R$A01F.
  $CD88,$03 Jump to #R$CE8F.

c $CD8B Terminate Character Script
@ $CD8B label=TerminateCharacterScript
N $CD8B Set script completion flag.
  $CD8B,$06 Write #N($0001,$04,$04) to *#R$A01F.
  $CD91,$03 Call #R$D026.
  $CD94,$01 Return.

c $CD95 Handle Display Text
@ $CD95 label=HandleDisplayText
  $CD95,$03 #REGl=*#REGix+#N$01.
  $CD98,$03 #REGh=*#REGix+#N$02.
  $CD9B,$03 Call #R$A59F.
  $CD9E,$03 Jump to #R$CE8F.

c $CDA1
  $CDA1,$03 #REGl=*#REGix+#N$02.
  $CDA4,$03 #REGh=*#REGix+#N$03.
  $CDA7,$01 Stash #REGhl on the stack.
  $CDA8,$03 #REGa=*#REGix+#N$01.
  $CDAB,$03 Call #R$CEDE.
  $CDAE,$03 Write #REGa to *#R$A034.
  $CDB1,$05 Write #N$07 to *#R$A00F.
  $CDB6,$03 #REGhl=#R$6830.
  $CDB9,$03 Call #R$A59F.
  $CDBC,$03 Jump to #R$CE8F.

  $CDBF,$05 Write #N$2E to *#R$A033.
  $CDC4,$03 #REGa=*#REGix+#N$01.
  $CDC7,$03 Call #R$CEDE.
  $CDCA,$03 Write #REGa to *#R$A034.
  $CDCD,$03 #REGa=*#REGix+#N$02.
  $CDD0,$03 Write #REGa to *#R$A35D.
  $CDD3,$03 #REGa=*#REGix+#N$03.
  $CDD6,$03 Call #R$CEDE.
  $CDD9,$03 Write #REGa to *#R$A35E.
  $CDDC,$03 #REGa=*#REGix+#N$04.
  $CDDF,$03 Call #R$CEDE.
  $CDE2,$03 Write #REGa to *#R$A35F.
  $CDE5,$02 #REGa=#N$08.
  $CDE7,$03 Call #R$A11C.
  $CDEA,$03 #REGa=*#R$A034.
  $CDED,$03 Write #REGa to *#REGix+#N$00.
  $CDF0,$04 Write #N$FF to *#REGix+#N$01.
  $CDF4,$03 #REGa=*#R$A35D.
  $CDF7,$03 Write #REGa to *#REGix+#N$02.
  $CDFA,$03 #REGhl=*#R$A35E.
  $CDFD,$03 Write #REGl to *#REGix+#N$03.
  $CE00,$03 Write #REGh to *#REGix+#N$04.
  $CE03,$03 #REGhl=*#R$9FEE.
  $CE06,$04 Write #REGix to *#R$9FEE.
  $CE0A,$03 Write #REGl to *#REGix+#N$FE.
  $CE0D,$03 Write #REGh to *#REGix+#N$FF.
  $CE10,$03 #REGhl=#R$682A.
  $CE13,$03 Call #R$A59F.
  $CE16,$02 Jump to #R$CE8F.
  $CE18,$03 #REGa=*#REGix+#N$01.
  $CE1B,$03 Call #R$CEDE.
  $CE1E,$03 Write #REGa to *#R$A033.
  $CE21,$03 #REGa=*#REGix+#N$02.
  $CE24,$03 Call #R$CEDE.
  $CE27,$03 Write #REGa to *#R$A034.
  $CE2A,$03 #REGa=*#REGix+#N$03.
  $CE2D,$03 Call #R$CEDE.
  $CE30,$03 Write #REGa to *#R$A035.
  $CE33,$03 Call #R$C4D1.
  $CE36,$01 Return if #REGa is less than #N$08.
  $CE37,$02 Jump to #R$CEB8 if #REGa is equal to #N$08.
  $CE39,$02 Jump to #R$CE8F.

c $CE3B HandleRoomDisplay
@ $CE3B label=HandleRoomDisplay
  $CE3B,$03 Get the room display parameter.
  $CE3E,$03 Call #R$CEDE.
  $CE41,$03 Write the room display parameter to *#R$A034.
  $CE44,$03 Get the room graphics parameter.
  $CE47,$03 Call #R$CEDE.
  $CE4A,$03 Write the room graphics parameter to *#R$A035.
  $CE4D,$02 Jump to #R$CE57.

c $CE4F
  $CE4F,$08 Write #N$FF to; #LIST { *#R$A034 } { *#R$A035 } LIST#

@ $CE57 label=ShowRoomDescription
N $CE57 Set the room description marker.
  $CE57,$05 Write #N$FF to *#R$A033.
  $CE5C,$06 Fetch the room address from *#REGix+#N$01/ *#REGix+#N$02 and store
. it in #REGhl.
  $CE62,$03 Call #R$C591.
  $CE65,$01 Return if the room description can't be displayed.
  $CE66,$02 Jump to #R$CEB8 if #REGa is equal to #N$FF.
  $CE68,$02 Jump to #R$CE8F.

c $CE6A Handle Simple Action
@ $CE6A label=HandleSimpleAction
  $CE6A,$03 #REGa=*#REGix+#N$01.
  $CE6D,$03 Call #R$CEDE.
  $CE70,$03 Write #REGa to *#R$A033.
  $CE73,$08 Write #N$FF to; #LIST { *#R$A034 } { *#R$A035 } LIST#
  $CE7B,$03 Call #R$C4D1.
  $CE7E,$01 Return if #REGa is less than #N$FF.
  $CE7F,$02 Jump to #R$CEB8 if #REGa is equal to #N$FF.
  $CE81,$02 Jump to #R$CE8F.

c $CE83 Get Current Script State
@ $CE83 label=GetCurrentScriptState
  $CE83,$04 #REGiy=*#R$9FDB.
  $CE87,$06 #REGix=*#R$9FD9 (using the stack).
  $CE8D,$01 Get the current command byte.
  $CE8E,$01 Return.

c $CE8F Continue Script Execution
@ $CE8F label=ContinueScriptExecution
  $CE8F,$03 Call #R$CE83.
  $CE92,$03 Call #R$CF03.
  $CE95,$06 Jump to #R$CEA1 if bit 7 of *#REGix+#N$00 is not set.
  $CE9B,$01 #REGe=*#REGhl.
  $CE9C,$01 Increment #REGhl by one.
  $CE9D,$01 #REGd=*#REGhl.
  $CE9E,$01 Exchange the #REGde and #REGhl registers.
  $CE9F,$02 Jump to #R$CEA8.

  $CEA1,$07 Call #R$CF40 if bit 4 of *#REGix+#N$00 is set.
  $CEA8,$07 Call #R$CF43 if bit 5 of *#REGix+#N$00 is set.
  $CEAF,$03 Write #REGl to *#REGiy+#N$01.
  $CEB2,$03 Write #REGh to *#REGiy+#N$02.
  $CEB5,$03 Jump to #R$CD91.

c $CEB8
  $CEB8,$04 Increment *#R$CC0B by one.
  $CEBC,$03 Call #R$CE83.
  $CEBF,$03 Call #R$CEFE.
  $CEC2,$06 Jump to #R$CECC if bit 4 of *#REGix+#N$00 is not set.
  $CEC8,$01 #REGe=*#REGhl.
  $CEC9,$01 Increment #REGhl by one.
  $CECA,$01 #REGd=*#REGhl.
  $CECB,$01 Exchange the #REGde and #REGhl registers.
  $CECC,$03 Write #REGl to *#REGiy+#N$01.
  $CECF,$03 Write #REGh to *#REGiy+#N$02.
  $CED2,$03 #REGde=#REGix (using the stack).
  $CED5,$03 #REGhl-=#REGde (with carry).
  $CED8,$03 Jump to #R$CD8B if #REGhl is equal to #REGa.
  $CEDB,$03 Jump to #R$CC82.

c $CEDE

c $CEFE

c $CF43

c $CF80

c $CFB6

c $CFCF

c $D008

c $D026

c $D045 Is Sherlock Wearing The China Man Disguise?
@ $D045 label=IsSherlockTheChinaMan
N $D045 Sherlocks character ID can vary depending on whether he is wearing a
. disguise or not.
  $D045,$03 Fetch Sherlocks current character ID from *#R$9860.
  $D048,$03 Call #R$D495.
  $D04B,$03 Write #REGa to *#R$A009.
  $D04E,$01 Return.

c $D04F Adjust Object Table For Sum
@ $D04F label=AdjustObjectTableForSum
  $D04F,$04 #REGix=#R$8B6F.
  $D053,$06 Decrease #REGix by three.
  $D059,$01 Return.

g $D05A Table: Tokens
@ $D05A label=Table_Tokens
W $D05A,$02 "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
L $D05A,$02,$05

g $D064 Table: Direction Tokens
@ $D064 label=Table_DirectionTokens
W $D064 "#R($5DBF+(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC)))".
L $D064,$02,$0A

c $D078
  $D078,$05 Stash #REGix, #REGiy and #REGbc on the stack.
  $D07D,$04 #REGix=*#R$A017.
  $D081,$03 #REGa=*#REGix+#N$04.
  $D084,$02,b$01 Keep only bit 7.
  $D086,$02 Jump to #R$D0C6 if ?? is equal to #N$00.
  $D088,$03 Call #R$C86E.
  $D08B,$01 Increment #REGa by one.
  $D08C,$02 Jump to #R$D09E if #REGa is not equal to #N$00.
  $D08E,$03 Call #R$D33C.
  $D091,$06 Jump to #R$D0C6 if bit 7 of *#REGix+#N$00 is set.
  $D097,$03 Call #R$C00C.
  $D09A,$04 Jump to #R$D0C6 if the time-period code is anything other than late
. night/ evening (8 PM - 5 AM).
N $D09E It's late night/ evening (8 PM - 5 AM).
  $D09E,$04 #REGix=#R$8B6F.
  $D0A2,$03 Call #R$D206.
  $D0A5,$02 Jump to #R$D0C9 if #REGa is equal to #N$01.
  $D0A7,$07 Jump to #R$D0A2 if *#REGiy+#N$00 is not equal to #N$01.
  $D0AE,$03 #REGa=*#REGiy+#N$05.
  $D0B1,$02,b$01 Flip bits 0-2, 4-5, 7.
  $D0B3,$02,b$01 Keep only bits 2-4, 6.
  $D0B5,$02 Jump to #R$D0A2 if #REGa is not equal to #N$01.
  $D0B7,$03 #REGa=*#REGiy+#N$04.
  $D0BA,$02,b$01 Keep only bit 7.
  $D0BC,$02 Jump to #R$D0A2 if #REGa is equal to #N$01.
  $D0BE,$03 #REGa=*#REGix+#N$00.
  $D0C1,$03 Call #R$C821.
  $D0C4,$02 Jump to #R$D0A2 if #REGa is equal to #N$01.
  $D0C6,$01 Set flags.
  $D0C7,$02 Jump to #R$D0CA.
  $D0C9,$01 Set the carry flag.
  $D0CA,$05 Restore #REGbc, #REGiy and #REGix from the stack.
  $D0CF,$01 Return.

c $D0D0
  $D0D0,$01 Stash #REGde on the stack.
  $D0D1,$03 #REGde=#R$68DE.
  $D0D4,$01 Exchange the #REGde and #REGhl registers.
  $D0D5,$02 Set bit 7 of #REGd.
  $D0D7,$01 Write #REGd to *#REGhl.
  $D0D8,$01 Increment #REGhl by one.
  $D0D9,$01 Write #REGe to *#REGhl.
  $D0DA,$01 Restore #REGde from the stack.
  $D0DB,$01 Return.

g $D0DC
B $D0DC,$01

c $D0DD
  $D0DD,$01 Stash #REGaf on the stack.
  $D0DE,$03 Call #R$D224.
  $D0E1,$03 #REGa=*#R$D0DC.
  $D0E4,$01 Set flags.
  $D0E5,$03 #REGhl=#R$68E4.
  $D0E8,$02 Jump to #R$D100 if ?? is not equal to #REGa.
  $D0EA,$03 #REGa=*#REGix+#N$00.
  $D0ED,$02,b$01 Keep only bits 1-3.
  $D0EF,$01 #REGe=#REGa.
  $D0F0,$02 #REGd=#N$00.
  $D0F2,$03 #REGhl=#R$D05A.
  $D0F5,$01 #REGhl+=#REGde.
  $D0F6,$01 #REGe=*#REGhl.
  $D0F7,$01 Increment #REGhl by one.
  $D0F8,$01 #REGd=*#REGhl.
  $D0F9,$01 Exchange the #REGde and #REGhl registers.
  $D0FA,$03 Call #R$D0D0.
  $D0FD,$03 #REGhl=#R$68DD.
  $D100,$01 Restore #REGaf from the stack.
  $D101,$01 Return.

c $D102

  $D135,$03 #REGhl=#R$68DD.
  $D138,$03 Call #R$A59F.

c $D1B2

c $D1DB

c $D1DC

c $D206 Fetch Next Object
@ $D206 label=FetchNextObject
R $D206 IX Pointer to objects table
R $D206 O:IX Pointer to object table
R $D206 O:IY Pointer to object data
R $D206 O:F The zero flag is set if the end of the table is reached
  $D206,$01 Switch to the shadow registers.
  $D207,$05 Add #N($0003,$04,$04) to the object table pointer in #REGix.
  $D20C,$09 Fetch the pointer to the object data and store it in #REGiy.
  $D215,$05 Check the object ID at *#REGix+#N$00 to see if the terminator
. character (#N$FF) has been reached.
  $D21A,$01 Switch back to the normal registers.
  $D21B,$01 Return.

c $D21C
  $D21C,$01 Stash #REGbc on the stack.
  $D21D,$01 #REGb=#REGa.
  $D21E,$03 Call #R$D206.
  $D221,$01 #REGa=#REGb.
  $D222,$01 Restore #REGbc from the stack.
  $D223,$01 Return.

c $D224 Fetch Location Data Pointer
@ $D224 label=FetchLocationDataPointer
R $D224 A Room ID
R $D224 O:IX Pointer to location data
  $D224,$01 Stash #REGde on the stack.
  $D225,$03 Load #R$840B into #REGde.
  $D228,$01 Stash #REGhl on the stack.
  $D229,$03 Load the room ID into #REGhl.
  $D22C,$01 Double the offset value held in #REGhl.
  $D22D,$01 Add the base table address to the offset to point to the requested
. room address.
  $D22E,$06 Fetch the location data address and store the pointer in #REGix.
  $D234,$02 Restore #REGhl and #REGde from the stack.
  $D236,$01 Return.

c $D237 Fetch Object Data Pointer
@ $D237 label=FetchObjectDataPointer
D $D237 Looks up an object in the objects table and returns a pointer to it's
. data structure.
R $D237 A Object ID
R $D237 O:IX Pointer to object data
  $D237,$04 #REGix=#R$8B6F.
  $D23B,$03 Call #R$D34E.
N $D23E This will be restored back into #REGhl by the end of the routine.
  $D23E,$01 Stash #REGhl on the stack temporarily.
N $D23F Pretty clever way of using the stack here.
  $D23F,$06 Load the object pointer into #REGhl.
  $D245,$01 Swap the *#REGsp with the object pointer, restoring #REGhl to the
. original value.
  $D246,$02 Restore the object pointer into #REGix (from the stack).
  $D248,$01 Return.

c $D249
  $D249,$04 Stash #REGiy and #REGix on the stack.
  $D24D,$03 Call #R$D04F.
  $D250,$03 Call #R$D21C.
  $D253,$02 Jump to #R$D267 if ?? is equal to #N$00.
  $D255,$05 Jump to #R$D250 if #REGa is not equal to *#REGiy+#N$01.
  $D25A,$03 Write #REGb to *#REGiy+#N$0F.
  $D25D,$01 Stash #REGaf on the stack.
  $D25E,$03 #REGa=*#REGix+#N$00.
  $D261,$03 Call #R$D249.
  $D264,$01 Restore #REGaf from the stack.
  $D265,$02 Jump to #R$D250.
  $D267,$04 Restore #REGix and #REGiy from the stack.
  $D26B,$01 Return.

c $D26C
  $D26C,$01 Stash #REGhl on the stack.
  $D26D,$03 #REGa=*#R$A034.
  $D270,$03 Call #R$D275.
  $D273,$01 Restore #REGhl from the stack.
  $D274,$01 Return.

c $D275

c $D29D

c $D2A4

c $D2F2

c $D33C
  $D33C,$01 Stash #REGaf on the stack.
  $D33D,$04 #REGix=*#R$A017.
  $D341,$03 #REGa=*#REGix+#N$0F.
  $D344,$03 Call #R$D224.
  $D347,$01 Restore #REGaf from the stack.
  $D348,$01 Return.

c $D349 Search Two-Byte Length Table
@ $D349 label=SearchTwoByteTable
R $D349 A Table ID to match
R $D349 IX Table to search
  $D349,$01 Switch to the shadow registers.
  $D34A,$02 Set the length of the data in #REGe (#N$02 bytes).
  $D34C,$02 Jump to #R$D351.

c $D34E Search Three-Byte Length Table
@ $D34E label=SearchThreeByteTable
R $D34E A Table ID to match
R $D34E IX Table to search
R $D34E O:A Entry ID or #N$FF for no entry found
R $D34E O:IX Pointer to found entry
R $D34E O:F The zero flag is set when no entry was found
  $D34E,$01 Switch to the shadow registers.
  $D34F,$02 Set the length of the data in #REGe (#N$03 bytes).
@ $D351 label=SearchTable_Start
  $D351,$03 Copy the table for searching into #REGhl (using the stack).
  $D354,$01 Copy the table ID into #REGb.
  $D355,$02 Reset #REGd to #N$00 for the length offset calculation.
@ $D357 label=SearchTable_Loop
  $D357,$01 Fetch a byte from the table.
  $D358,$07 Jump to #R$D363 if the byte is the table ID we're searching
. for or if the termination character has been reached (#N$FF).
  $D35F,$01 Move to the next table entry.
  $D360,$03 Jump back to #R$D357.
N $D363 Either the table ID was matched, or the terminator was reached.
@ $D363 label=SearchTable_Return
  $D363,$03 Copy the table pointer into #REGix (using the stack).
  $D366,$02 Set the zero flag if the termination character was reached (#N$FF).
  $D368,$01 Switch back to the normal registers.
  $D369,$01 Return.

c $D36A

c $D3E8

c $D405

c $D471

c $D495 Is The Character Wearing The China Man Disguise?
@ $D495 label=IsCharacterTheChinaMan
R $D495 A Character ID
R $D495 O:A Either #N$FF for when the character isn't the China man, else the attribute byte
  $D495,$03 Return if the character is inactive (#N$FF).
  $D498,$03 Call #R$D237.
  $D49B,$05 Is the character the "#OBJECT$01"?
  $D4A0,$02 Set a default in #REGa of #N$FF for when the character isn't
. wearing the China mans disguise.
  $D4A2,$01 Return if the character isn't the "#OBJECT$01".
N $D4A3 The character is wearing the disguise, so return with the attribute
. byte instead.
  $D4A3,$03 #REGa=*#REGix+#N$0F.
  $D4A6,$01 Return.

c $D4A7
  $D4A7,$04 Stash #REGiy, #REGaf and #REGbc on the stack.
  $D4AB,$02 #REGa=#N$FF.
  $D4AD,$03 Call #R$D4CC.
  $D4B0,$02 Jump to #R$D4C7 if #REGa is equal to #N$FF.
  $D4B2,$01 Stash #REGaf on the stack.
N $D4B3 Print "#TEXTTOKEN($68E4)".
  $D4B3,$03 #REGhl=#R$68E4.
  $D4B6,$03 Call #R$A59F.
  $D4B9,$01 Restore #REGbc from the stack.
  $D4BA,$01 #REGc=#REGb.
  $D4BB,$02 #REGa=#N$FF.
  $D4BD,$04 #REGiy=*#R$A017.
  $D4C1,$03 #REGb=*#REGiy+#N$0F.
  $D4C4,$03 Call #R$D51A.
  $D4C7,$04 Restore #REGbc, #REGaf and #REGiy from the stack.
  $D4CB,$01 Return.

c $D4CC
  $D4CC,$06 Stash #REGix, #REGiy, #REGhl and #REGbc on the stack.
  $D4D2,$03 Call #R$D04F.
  $D4D5,$02 #REGb=#N$00.
  $D4D7,$01 #REGc=#REGa.
  $D4D8,$03 Call #R$D206.
  $D4DB,$02 Jump to #R$D4E6 if the terminator character was reached (#N$FF).
  $D4DD,$01 #REGa=#REGc.
  $D4DE,$03 Call #R$D4EF.
  $D4E1,$02 Jump to #R$D4D8 if #REGa is greater than or equal to #N$00.
  $D4E3,$01 Increment #REGb by one.
  $D4E4,$02 Jump to #R$D4D8.
  $D4E6,$01 #REGa=#REGb.
  $D4E7,$01 Set flags.
  $D4E8,$06 Restore #REGbc, #REGhl, #REGiy and #REGix from the stack.
  $D4EE,$01 Return.

c $D4EF
  $D4EF,$03 Compare #REGa with *#REGiy+#N$01.
  $D4F2,$02 Jump to #R$D518 if #REGb is not equal to #REGa.
  $D4F4,$03 #REGa=*#R$A036.
  $D4F7,$03 Compare #REGa with *#REGix+#N$00.
  $D4FA,$02 Jump to #R$D518 if #REGb is equal to #REGa.
  $D4FC,$03 #REGa=*#REGix+#N$00.
  $D4FF,$03 Call #R$C821.
  $D502,$02 Jump to #R$D518 if #REGb is equal to #REGa.
  $D504,$03 #REGa=*#REGiy+#N$00.
  $D507,$02 Compare #REGa with #N$02.
  $D509,$02 Jump to #R$D518 if #REGa is greater than or equal to #N$02.
  $D50B,$03 #REGa=*#R$A036.
  $D50E,$02 Stash #REGix on the stack.
  $D510,$01 Restore #REGhl from the stack.
  $D511,$03 Call #R$D278.
  $D514,$02 Jump to #R$D518 if #REGa is less than #N$02.
  $D516,$01 Set the carry flag.
  $D517,$01 Return.
  $D518,$01 Set flags.
  $D519,$01 Return.

c $D51A
  $D51A,$04 Stash #REGiy, #REGde and #REGbc on the stack.
  $D51E,$03 Call #R$D526.
  $D521,$04 Restore #REGbc, #REGde and #REGiy from the stack.
  $D525,$01 Return.

c $D526
  $D526,$02 Stash #REGix on the stack.
  $D528,$03 Call #R$D04F.
  $D52B,$01 Stash #REGaf on the stack.
  $D52C,$03 Call #R$D57D.
  $D52F,$02 Jump to #R$D55A if #REGa is less than #REGa.
  $D531,$04 Set bit 7 of *#REGiy+#N$06.
  $D535,$01 #REGa-=#REGa.
  $D536,$03 Write #REGa to *#R$A028.
  $D539,$03 Call #R$D3D9.
  $D53C,$01 Decrease #REGc by one.
  $D53D,$01 #REGa=#REGc.
  $D53E,$01 Set flags.
  $D53F,$02 Jump to #R$D546 if #REGc is not equal to #REGa.
  $D541,$03 Call #R$A414.
  $D544,$02 Jump to #R$D557.
  $D546,$02 Compare #REGa with #N$01.
  $D548,$02 Jump to #R$D551 if #REGa is equal to #N$01.
  $D54A,$02 #REGa=#N$2C.
  $D54C,$03 Call #R$A9B7.
  $D54F,$02 Jump to #R$D557.
  $D551,$03 #REGde=#N($005D,$04,$04).
  $D554,$03 Call #R$A887.
  $D557,$01 Restore #REGaf from the stack.
  $D558,$02 Jump to #R$D52B.
  $D55A,$01 Restore #REGaf from the stack.
  $D55B,$03 Call #R$D04F.
  $D55E,$01 Stash #REGaf on the stack.
  $D55F,$03 Call #R$D57D.
  $D562,$02 Jump to #R$D578 if #REGa is less than #N$2C.
  $D564,$01 Stash #REGaf on the stack.
  $D565,$03 Call #R$D4CC.
  $D568,$02 Jump to #R$D574 if #REGa is equal to #N$2C.
  $D56A,$01 #REGc=#REGa.
  $D56B,$01 Restore #REGaf from the stack.
  $D56C,$03 Call #R$D590.
  $D56F,$03 Call #R$D526.
  $D572,$02 Jump to #R$D575.
  $D574,$02 Restore #REGaf and #REGaf from the stack.
  $D576,$02 Jump to #R$D55E.
  $D578,$01 Restore #REGaf from the stack.
  $D579,$02 Restore #REGix from the stack.
  $D57B,$01 Return.
  $D57C,$01 Restore #REGaf from the stack.
  $D57D,$03 Call #R$D21C.
  $D580,$02 Jump to #R$D584 if #REGa is not equal to #N$2C.
  $D582,$01 Set the carry flag.
  $D583,$01 Return.
  $D584,$01 Stash #REGaf on the stack.
  $D585,$03 Call #R$D4EF.
  $D588,$02 Jump to #R$D57C if #REGa is greater than or equal to #N$2C.
  $D58A,$01 Restore #REGaf from the stack.
  $D58B,$03 #REGa=*#REGix+#N$00.
  $D58E,$01 Set flags.
  $D58F,$01 Return.

c $D590
  $D590,$04 Stash #REGix, #REGbc and #REGaf on the stack.
  $D594,$03 Call #R$D237.
  $D597,$06 Jump to #R$D5A5 if bit 6 of *#REGix+#N$05 is not set.
  $D59D,$01 Restore #REGaf from the stack.
  $D59E,$02 Stash #REGaf and #REGaf on the stack.
  $D5A0,$03 #REGhl=#R$68B1.
  $D5A3,$02 Jump to #R$D5C1.

  $D5A5,$03 #REGhl=#N$0485.
  $D5A8,$01 Decrease #REGc by one.
  $D5A9,$02 Jump to #R$D5AE if #REGc is equal to #REGa.
  $D5AB,$03 #REGhl=#N($007A,$04,$04).
  $D5AE,$01 Stash #REGhl on the stack.
  $D5AF,$03 Call #R$D5D3.
  $D5B2,$05 Write #N$01 to *#R$A2AA.
  $D5B7,$03 Call #R$D3D5.
  $D5BA,$04 Write #N$00 to *#R$A2AA.
  $D5BE,$03 #REGhl=#R$68D9.
  $D5C1,$03 Call #R$A59F.
  $D5C4,$04 Restore #REGaf, #REGbc and #REGix from the stack.
  $D5C8,$01 Return.

b $D5C9

c $D5D3
  $D5D3,$03 #REGhl=#R$D5C9.
  $D5D6,$03 #REGa=*#REGix+#N$04.
  $D5D9,$02,b$01 Keep only bits 0-2.
  $D5DB,$02 Compare #REGa with #N$05.
  $D5DD,$01 Stash #REGaf on the stack.
  $D5DE,$01 Decrease #REGa by one.
  $D5DF,$01 #REGe=#REGa.
  $D5E0,$02 #REGd=#N$00.
  $D5E2,$01 #REGhl+=#REGde.
  $D5E3,$01 #REGhl+=#REGde.
  $D5E4,$03 Call #R$A880.
  $D5E7,$01 Restore #REGaf from the stack.
  $D5E8,$01 Return if #REGa is not equal to #N$00.
  $D5E9,$03 #REGde=#N$08DB.
  $D5EC,$03 Jump to #R$A887.

c $D5EF
  $D5EF,$03 Call #R$D224.
  $D5F2,$05 #REGix+=#N$0006.
  $D5F7,$03 #REGbc=#N$0003.
  $D5FA,$01 Return.

c $D5FB Get Direction Token
@ $D5FB label=GetDirectionToken
D $D5FB This routine converts a direction value into the address of its
. corresponding token string.
R $D5FB A Direction value
R $D5FB O:DE Address of token string
  $D5FB,$03 Load #R$D064 into #REGhl.
  $D5FE,$02 Adjust #REGhl for sum.
  $D600,$01 Copy directional value into #REGe.
  $D601,$02 Reset bit 7 of #REGe.
  $D603,$02 Clear the high byte in #REGd.
  $D605,$02 Add #N$02 times the offset to the base table address.
  $D607,$03 Fetch the token address from the table and load it into #REGde.
  $D60A,$01 Return.

c $D60B
  $D60B,$06 Stash #REGbc, #REGde, #REGiy and #REGix on the stack.
  $D611,$03 Call #R$D5EF.
  $D614,$04 #REGiy=#REGix (using the stack).
  $D618,$02 Jump to #R$D660.
  $D61A,$06 Jump to #R$D660 if *#REGiy+#N$01 is zero.
  $D620,$07 Jump to #R$D660 if *#REGiy+#N$00 is greater than or equal to #N$0B.
  $D627,$03 #REGa=*#REGiy+#N$01.
  $D62A,$03 Call #R$D237.
  $D62D,$06 Jump to #R$D660 if bit 7 of *#REGix+#N$05 is not set.
  $D633,$03 #REGa=*#REGiy+#N$00.
  $D636,$03 Call #R$D5FB.
  $D639,$04 Jump to #R$D647 if #REGa is less than #N$09.
  $D63D,$03 #REGde=#N($000A,$04,$04).
  $D640,$02 Jump to #R$D64D if #REGa is equal to #N$09.
  $D642,$03 #REGde=#N($00E7,$04,$04).
  $D645,$02 Jump to #R$D64D.

  $D647,$03 #REGhl=#R$68BC.
  $D64A,$03 Call #R$A59F.
  $D64D,$03 Call #R$A887.
  $D650,$03 #REGhl=#R$68E9.
  $D653,$03 Call #R$A59F.
  $D656,$02 Stash #REGiy on the stack.
  $D658,$03 Call #R$D3D5.
  $D65B,$03 Call #R$A414.
  $D65E,$02 Restore #REGiy from the stack.
  $D660,$02 #REGiy+=#REGbc.
  $D662,$08 Jump to #R$D61A if *#REGiy+#N$00 is not equal to #N$FF.
  $D66A,$06 Restore #REGix, #REGiy, #REGde and #REGbc from the stack.
  $D670,$01 Return.

c $D671
  $D671,$02 #REGix+=#REGbc.
  $D673,$02 #REGa=#N$FF.
  $D675,$03 Compare #REGa with *#REGix+#N$00.
  $D678,$01 Return if #REGa is equal to #N$FF.
  $D679,$01 #REGa=#N$00.
  $D67A,$03 Compare #REGa with *#REGix+#N$01.
  $D67D,$02 Jump to #R$D671 if #REGa is not equal to #N$FF.
  $D67F,$03 #REGa=*#REGix+#N$00.
  $D682,$01 Set flags.
  $D683,$02 Jump to #R$D671 if #REGa is equal to #REGa.
  $D685,$02 Compare #REGa with #N$0B.
  $D687,$02 Jump to #R$D671 if #REGa is greater than or equal to #N$0B.
  $D689,$02,b$01 Set bit 0.
  $D68B,$01 Return.

c $D68C
  $D68C,$06 Stash #REGix, #REGiy, #REGde and #REGbc on the stack.
  $D692,$03 Call #R$D5EF.
  $D695,$03 Call #R$D671.
  $D698,$02 Jump to #R$D6B1 if the zero flag is not set.
  $D69A,$03 #REGhl=#R$68F1.
  $D69D,$03 Call #R$A59F.
  $D6A0,$03 #REGa=*#REGix+#N$00.
  $D6A3,$03 Call #R$D5FB.
  $D6A6,$03 Call #R$A887.
  $D6A9,$03 Call #R$D671.
  $D6AC,$02 Jump to #R$D6A0 if the zero flag is not set.
  $D6AE,$03 Call #R$A414.
  $D6B1,$06 Restore #REGbc, #REGde, #REGiy and #REGix from the stack.
  $D6B7,$01 Return.

g $D6B8

c $DC15

c $DC6C

c $E151

g $E16B
B $E16B,$01
W $E16C,$02
L $E16B,$03,$05
B $E17A,$01 Terminator.

c $E17B

c $E691

c $F1C1
c $F555
c $F55E
c $F565
c $F56E
