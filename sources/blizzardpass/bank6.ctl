; Copyright Adventuresoft UK Ltd 1986, 2026 ArcadeGeek LTD.
> $C000 @org=$C000
> $C000 @expand=#DEF1(#MESSAGE(addr)#STR{addr},$08($b==$5E||$b==$7E))

t $C000 Location Text
@ $C000 label=LocationText
D $C000 Plain-text descriptions for rooms below #N($66), paged in at #N$C000
. while a room is described. Each description terminates with #N$7E.
.
. It opens with the legendary: "#MESSAGE(#PC)".
  $C000,$AB "#MESSAGE(#PC)".
B $C0AB,$01 Terminator.
  $C0AC,$1A1 "#MESSAGE(#PC)".
B $C24D,$01 Terminator.
  $C24E,$A6 "#MESSAGE(#PC)".
B $C2F4,$01 Terminator.
  $C2F5,$FA "#MESSAGE(#PC)".
B $C3EF,$01 Terminator.
  $C3F0,$100 "#MESSAGE(#PC)".
B $C4F0,$01 Terminator.
  $C4F1,$8B "#MESSAGE(#PC)".
B $C57C,$01 Terminator.
  $C57D,$05 "#MESSAGE(#PC)".
B $C582,$01 Terminator.
  $C583,$CF "#MESSAGE(#PC)".
B $C652,$01 Terminator.
  $C653,$BD "#MESSAGE(#PC)".
B $C710,$01 Terminator.
  $C711,$05 "#MESSAGE(#PC)".
B $C716,$01 Terminator.
  $C717,$D1 "#MESSAGE(#PC)".
B $C7E8,$01 Terminator.
  $C7E9,$FD "#MESSAGE(#PC)".
B $C8E6,$01 Terminator.
  $C8E7,$8B "#MESSAGE(#PC)".
B $C972,$01 Terminator.
  $C973,$9F "#MESSAGE(#PC)".
B $CA12,$01 Terminator.
  $CA13,$87 "#MESSAGE(#PC)".
B $CA9A,$01 Terminator.
  $CA9B,$11C "#MESSAGE(#PC)".
B $CBB7,$01 Terminator.
  $CBB8,$D9 "#MESSAGE(#PC)".
B $CC91,$01 Terminator.
  $CC92,$C3 "#MESSAGE(#PC)".
B $CD55,$01 Terminator.
  $CD56,$7A "#MESSAGE(#PC)".
B $CDD0,$01 Terminator.
  $CDD1,$BF "#MESSAGE(#PC)".
B $CE90,$01 Terminator.
  $CE91,$8E "#MESSAGE(#PC)".
B $CF1F,$01 Terminator.
  $CF20,$3C "#MESSAGE(#PC)".
B $CF5C,$01 Terminator.
  $CF5D,$C6 "#MESSAGE(#PC)".
B $D023,$01 Terminator.
  $D024,$87 "#MESSAGE(#PC)".
B $D0AB,$01 Terminator.
  $D0AC,$C0 "#MESSAGE(#PC)".
B $D16C,$01 Terminator.
  $D16D,$87 "#MESSAGE(#PC)".
B $D1F4,$01 Terminator.
  $D1F5,$D9 "#MESSAGE(#PC)".
B $D2CE,$01 Terminator.
  $D2CF,$E0 "#MESSAGE(#PC)".
B $D3AF,$01 Terminator.
  $D3B0,$82 "#MESSAGE(#PC)".
B $D432,$01 Terminator.
  $D433,$92 "#MESSAGE(#PC)".
B $D4C5,$01 Terminator.
  $D4C6,$FA "#MESSAGE(#PC)".
B $D5C0,$01 Terminator.
  $D5C1,$4D "#MESSAGE(#PC)".
B $D60E,$01 Terminator.
  $D60F,$99 "#MESSAGE(#PC)".
B $D6A8,$01 Terminator.
  $D6A9,$CD "#MESSAGE(#PC)".
B $D776,$01 Terminator.
  $D777,$9C "#MESSAGE(#PC)".
B $D813,$01 Terminator.
  $D814,$A0 "#MESSAGE(#PC)".
B $D8B4,$01 Terminator.
  $D8B5,$17E "#MESSAGE(#PC)".
B $DA33,$01 Terminator.
  $DA34,$6F "#MESSAGE(#PC)".
B $DAA3,$01 Terminator.
  $DAA4,$89 "#MESSAGE(#PC)".
B $DB2D,$01 Terminator.
  $DB2E,$FA "#MESSAGE(#PC)".
B $DC28,$01 Terminator.
  $DC29,$AB "#MESSAGE(#PC)".
B $DCD4,$01 Terminator.
  $DCD5,$F3 "#MESSAGE(#PC)".
B $DDC8,$01 Terminator.
  $DDC9,$B5 "#MESSAGE(#PC)".
B $DE7E,$01 Terminator.
  $DE7F,$78 "#MESSAGE(#PC)".
B $DEF7,$01 Terminator.
  $DEF8,$A8 "#MESSAGE(#PC)".
B $DFA0,$01 Terminator.
  $DFA1,$BD "#MESSAGE(#PC)".
B $E05E,$01 Terminator.
  $E05F,$A9 "#MESSAGE(#PC)".
B $E108,$01 Terminator.
  $E109,$8A "#MESSAGE(#PC)".
B $E193,$01 Terminator.
  $E194,$6E "#MESSAGE(#PC)".
B $E202,$01 Terminator.
  $E203,$A9 "#MESSAGE(#PC)".
B $E2AC,$01 Terminator.
  $E2AD,$ED "#MESSAGE(#PC)".
B $E39A,$01 Terminator.
  $E39B,$A5 "#MESSAGE(#PC)".
B $E440,$01 Terminator.
  $E441,$F3 "#MESSAGE(#PC)".
B $E534,$01 Terminator.
  $E535,$7E "#MESSAGE(#PC)".
B $E5B3,$01 Terminator.
  $E5B4,$6F "#MESSAGE(#PC)".
B $E623,$01 Terminator.
  $E624,$70 "#MESSAGE(#PC)".
B $E694,$01 Terminator.
  $E695,$7D "#MESSAGE(#PC)".
B $E712,$01 Terminator.
  $E713,$88 "#MESSAGE(#PC)".
B $E79B,$01 Terminator.
  $E79C,$B4 "#MESSAGE(#PC)".
B $E850,$01 Terminator.
  $E851,$2A "#MESSAGE(#PC)".
B $E87B,$01 Terminator.
  $E87C,$B3 "#MESSAGE(#PC)".
B $E92F,$01 Terminator.
  $E930,$DF "#MESSAGE(#PC)".
B $EA0F,$01 Terminator.
  $EA10,$10D "#MESSAGE(#PC)".
B $EB1D,$01 Terminator.
  $EB1E,$A0 "#MESSAGE(#PC)".
B $EBBE,$01 Terminator.
  $EBBF,$18 "#MESSAGE(#PC)".
B $EBD7,$01 Terminator.
  $EBD8,$5F "#MESSAGE(#PC)".
B $EC37,$01 Terminator.
  $EC38,$113 "#MESSAGE(#PC)".
B $ED4B,$01 Terminator.
  $ED4C,$8C "#MESSAGE(#PC)".
B $EDD8,$01 Terminator.
  $EDD9,$F7 "#MESSAGE(#PC)".
B $EED0,$01 Terminator.
  $EED1,$AE "#MESSAGE(#PC)".
B $EF7F,$01 Terminator.
  $EF80,$AC "#MESSAGE(#PC)".
B $F02C,$01 Terminator.
  $F02D,$B9 "#MESSAGE(#PC)".
B $F0E6,$01 Terminator.
  $F0E7,$05 "#MESSAGE(#PC)".
B $F0EC,$01 Terminator.
  $F0ED,$78 "#MESSAGE(#PC)".
B $F165,$01 Terminator.
  $F166,$6B "#MESSAGE(#PC)".
B $F1D1,$01 Terminator.
  $F1D2,$88 "#MESSAGE(#PC)".
B $F25A,$01 Terminator.
  $F25B,$83 "#MESSAGE(#PC)".
B $F2DE,$01 Terminator.
  $F2DF,$65 "#MESSAGE(#PC)".
B $F344,$01 Terminator.
  $F345,$B7 "#MESSAGE(#PC)".
B $F3FC,$01 Terminator.
  $F3FD,$AB "#MESSAGE(#PC)".
B $F4A8,$01 Terminator.
  $F4A9,$AE "#MESSAGE(#PC)".
B $F557,$01 Terminator.
  $F558,$D3 "#MESSAGE(#PC)".
B $F62B,$01 Terminator.
  $F62C,$DD "#MESSAGE(#PC)".
B $F709,$01 Terminator.
  $F70A,$86 "#MESSAGE(#PC)".
B $F790,$01 Terminator.
  $F791,$AA "#MESSAGE(#PC)".
B $F83B,$01 Terminator.
  $F83C,$2E "#MESSAGE(#PC)".
B $F86A,$01 Terminator.
  $F86B,$7E "#MESSAGE(#PC)".
B $F8E9,$01 Terminator.
  $F8EA,$59 "#MESSAGE(#PC)".
B $F943,$01 Terminator.
  $F944,$3C "#MESSAGE(#PC)".
B $F980,$01 Terminator.
  $F981,$46 "#MESSAGE(#PC)".
B $F9C7,$01 Terminator.
  $F9C8,$9C "#MESSAGE(#PC)".
B $FA64,$01 Terminator.
  $FA65,$81 "#MESSAGE(#PC)".
B $FAE6,$01 Terminator.
  $FAE7,$58 "#MESSAGE(#PC)".
B $FB3F,$01 Terminator.
  $FB40,$87 "#MESSAGE(#PC)".
B $FBC7,$01 Terminator.
  $FBC8,$BE "#MESSAGE(#PC)".
B $FC86,$01 Terminator.
  $FC87,$95 "#MESSAGE(#PC)".
B $FD1C,$01 Terminator.
  $FD1D,$C6 "#MESSAGE(#PC)".
B $FDE3,$01 Terminator.
  $FDE4,$7B "#MESSAGE(#PC)".
B $FE5F,$01 Terminator.
  $FE60,$61 "#MESSAGE(#PC)".
B $FEC1,$01 Terminator.
  $FEC2,$BE "#MESSAGE(#PC)".
B $FF80,$01 Terminator.
  $FF81,$1E "#MESSAGE(#PC)".
B $FF9F,$01 Terminator.
  $FFA0,$1E "#MESSAGE(#PC)".
B $FFBE,$01 Terminator.
  $FFBF,$1E "#MESSAGE(#PC)".
B $FFDD,$01 Terminator.
  $FFDE,$1E "#MESSAGE(#PC)".
B $FFFC,$01 Terminator.
N $FFFD The bank ends three characters into the next
. description.
  $FFFD,$03 "you".
