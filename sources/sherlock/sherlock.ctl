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

c $5B1B Game Entry Point
@ $5B1B label=GameEntryPoint
N $5B1B #SIM(start=$A040,stop=$A04E)#SIM(start=$A05B,stop=$A071)
  $5B1B,$03 Jump to #R$A040.

b $5B1E

b $5D80

g $67B7 Table: Common Words
@ $67B7 label=Table_CommonWords
W $67B7,$02
L $67B7,$02,$20

b $68B1
b $68BC
b $68D1
b $68DD

w $68DE

b $68E4
b $68E9

g $8259

g $840B Table: Locations
@ $840B label=Table_Locations
W $840B,$02 Room #N((#PC-$840B)/$02): "#ROOM((#PC-$840B)/$02)".
L $840B,$02,$6B

g $84E1 Room #N$00: "#ROOM$00"
B $84E1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $84E2,$02 #TEXTTOKEN(#PC)
W $84E4,$02 #TEXTTOKEN(#PC)
W $84E6,$02 #TEXTTOKEN(#PC)
W $84E8,$02 #TEXTTOKEN(#PC)
B $84EA,$01 Terminator.

g $84EB Room #N$01: "#ROOM$01"
B $84EB,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $84EC,$02 #TEXTTOKEN(#PC)
W $84EE,$02 #TEXTTOKEN(#PC)
W $84F0,$02 #TEXTTOKEN(#PC)
W $84F2,$02 #TEXTTOKEN(#PC)
B $84F4,$01 Terminator.

g $84F5 Room #N$02: "#ROOM$02"
B $84F5,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $84F6,$02 #TEXTTOKEN(#PC)
W $84F8,$02 #TEXTTOKEN(#PC)
W $84FA,$02 #TEXTTOKEN(#PC)
W $84FC,$02 #TEXTTOKEN(#PC)
B $84FE,$01 Terminator.

g $84FF Room #N$03: "#ROOM$03"
B $84FF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8500,$02 #TEXTTOKEN(#PC)
W $8502,$02 #TEXTTOKEN(#PC)
W $8504,$02 #TEXTTOKEN(#PC)
W $8506,$02 #TEXTTOKEN(#PC)
B $8508,$01 Terminator.

g $8509 Room #N$04: "#ROOM$04"
B $8509,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $850A,$02 #TEXTTOKEN(#PC)
W $850C,$02 #TEXTTOKEN(#PC)
W $850E,$02 #TEXTTOKEN(#PC)
W $8510,$02 #TEXTTOKEN(#PC)
B $8512,$01 Terminator.

g $8513 Room #N$05: "#ROOM$05"
B $8513,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8514,$02 #TEXTTOKEN(#PC)
W $8516,$02 #TEXTTOKEN(#PC)
W $8518,$02 #TEXTTOKEN(#PC)
W $851A,$02 #TEXTTOKEN(#PC)
B $851C,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($851C) }
. TABLE#
B $851F,$01 Terminator.

g $8520 Room #N$06: "#ROOM$06"
B $8520,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8521,$02 #TEXTTOKEN(#PC)
W $8523,$02 #TEXTTOKEN(#PC)
W $8525,$02 #TEXTTOKEN(#PC)
W $8527,$02 #TEXTTOKEN(#PC)
B $8529,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8529) }
. { #MOVEMENT($852C) }
. TABLE#
B $852F,$01 Terminator.

g $8530 Room #N$07: "#ROOM$07"
B $8530,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8531,$02 #TEXTTOKEN(#PC)
W $8533,$02 #TEXTTOKEN(#PC)
W $8535,$02 #TEXTTOKEN(#PC)
W $8537,$02 #TEXTTOKEN(#PC)
B $8539,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8539) }
. { #MOVEMENT($853C) }
. TABLE#
B $853F,$01 Terminator.

g $8540 Room #N$08: "#ROOM$08"
B $8540,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8541,$02 #TEXTTOKEN(#PC)
W $8543,$02 #TEXTTOKEN(#PC)
W $8545,$02 #TEXTTOKEN(#PC)
W $8547,$02 #TEXTTOKEN(#PC)
B $8549,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8549) }
. { #MOVEMENT($854C) }
. TABLE#
B $854F,$01 Terminator.

g $8550 Room #N$09: "#ROOM$09"
B $8550,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8551,$02 #TEXTTOKEN(#PC)
W $8553,$02 #TEXTTOKEN(#PC)
W $8555,$02 #TEXTTOKEN(#PC)
W $8557,$02 #TEXTTOKEN(#PC)
B $8559,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8559) }
. TABLE#
B $855C,$01 Terminator.

g $855D Room #N$0A: "#ROOM$0A"
B $855D,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $855E,$02 #TEXTTOKEN(#PC)
W $8560,$02 #TEXTTOKEN(#PC)
W $8562,$02 #TEXTTOKEN(#PC)
W $8564,$02 #TEXTTOKEN(#PC)
B $8566,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8566) }
. TABLE#
B $8569,$01 Terminator.

g $856A Room #N$0B: "#ROOM$0B"
B $856A,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $856B,$02 #TEXTTOKEN(#PC)
W $856D,$02 #TEXTTOKEN(#PC)
W $856F,$02 #TEXTTOKEN(#PC)
W $8571,$02 #TEXTTOKEN(#PC)
B $8573,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8573) }
. TABLE#
B $8576,$01 Terminator.

g $8577 Room #N$0C: "#ROOM$0C"
B $8577,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8578,$02 #TEXTTOKEN(#PC)
W $857A,$02 #TEXTTOKEN(#PC)
W $857C,$02 #TEXTTOKEN(#PC)
W $857E,$02 #TEXTTOKEN(#PC)
B $8580,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8580) }
. TABLE#
B $8583,$01 Terminator.

g $8584 Room #N$0D: "#ROOM$0D"
B $8584,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8585,$02 #TEXTTOKEN(#PC)
W $8587,$02 #TEXTTOKEN(#PC)
W $8589,$02 #TEXTTOKEN(#PC)
W $858B,$02 #TEXTTOKEN(#PC)
B $858D,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($858D) }
. TABLE#
B $8590,$01 Terminator.

g $8591 Room #N$0E: "#ROOM$0E"
B $8591,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8592,$02 #TEXTTOKEN(#PC)
W $8594,$02 #TEXTTOKEN(#PC)
W $8596,$02 #TEXTTOKEN(#PC)
W $8598,$02 #TEXTTOKEN(#PC)
B $859A,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($859A) }
. TABLE#
B $859D,$01 Terminator.

g $859E Room #N$0F: "#ROOM$0F"
B $859E,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $859F,$02 #TEXTTOKEN(#PC)
W $85A1,$02 #TEXTTOKEN(#PC)
W $85A3,$02 #TEXTTOKEN(#PC)
W $85A5,$02 #TEXTTOKEN(#PC)
B $85A7,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85A7) }
. { #MOVEMENT($85AA) }
. TABLE#
B $85AD,$01 Terminator.

g $85AE Room #N$10: "#ROOM$10"
B $85AE,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85AF,$02 #TEXTTOKEN(#PC)
W $85B1,$02 #TEXTTOKEN(#PC)
W $85B3,$02 #TEXTTOKEN(#PC)
W $85B5,$02 #TEXTTOKEN(#PC)
B $85B7,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85B7) }
. { #MOVEMENT($85BA) }
. TABLE#
B $85BD,$01 Terminator.

g $85BE Room #N$11: "#ROOM$11"
B $85BE,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85BF,$02 #TEXTTOKEN(#PC)
W $85C1,$02 #TEXTTOKEN(#PC)
W $85C3,$02 #TEXTTOKEN(#PC)
W $85C5,$02 #TEXTTOKEN(#PC)
B $85C7,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85C7) }
. TABLE#
B $85CA,$01 Terminator.

g $85CB Room #N$12: "#ROOM$12"
B $85CB,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85CC,$02 #TEXTTOKEN(#PC)
W $85CE,$02 #TEXTTOKEN(#PC)
W $85D0,$02 #TEXTTOKEN(#PC)
W $85D2,$02 #TEXTTOKEN(#PC)
B $85D4,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85D4) }
. TABLE#
B $85D7,$01 Terminator.

g $85D8 Room #N$13: "#ROOM$13"
B $85D8,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85D9,$02 #TEXTTOKEN(#PC)
W $85DB,$02 #TEXTTOKEN(#PC)
W $85DD,$02 #TEXTTOKEN(#PC)
W $85DF,$02 #TEXTTOKEN(#PC)
B $85E1,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85E1) }
. { #MOVEMENT($85E4) }
. TABLE#
B $85E7,$01 Terminator.

g $85E8 Room #N$14: "#ROOM$14"
B $85E8,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85E9,$02 #TEXTTOKEN(#PC)
W $85EB,$02 #TEXTTOKEN(#PC)
W $85ED,$02 #TEXTTOKEN(#PC)
W $85EF,$02 #TEXTTOKEN(#PC)
B $85F1,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($85F1) }
. { #MOVEMENT($85F4) }
. TABLE#
B $85F7,$01 Terminator.

g $85F8 Room #N$15: "#ROOM$15"
B $85F8,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $85F9,$02 #TEXTTOKEN(#PC)
W $85FB,$02 #TEXTTOKEN(#PC)
W $85FD,$02 #TEXTTOKEN(#PC)
W $85FF,$02 #TEXTTOKEN(#PC)
B $8601,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8601) }
. { #MOVEMENT($8604) }
. TABLE#
B $8607,$01 Terminator.

g $8608 Room #N$16: "#ROOM$16"
B $8608,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8609,$02 #TEXTTOKEN(#PC)
W $860B,$02 #TEXTTOKEN(#PC)
W $860D,$02 #TEXTTOKEN(#PC)
W $860F,$02 #TEXTTOKEN(#PC)
B $8611,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8611) }
. { #MOVEMENT($8614) }
. TABLE#
B $8617,$01 Terminator.

g $8618 Room #N$17: "#ROOM$17"
B $8618,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8619,$02 #TEXTTOKEN(#PC)
W $861B,$02 #TEXTTOKEN(#PC)
W $861D,$02 #TEXTTOKEN(#PC)
W $861F,$02 #TEXTTOKEN(#PC)
B $8621,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8621) }
. TABLE#
B $8624,$01 Terminator.

g $8625 Room #N$18: "#ROOM$18"
B $8625,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8626,$02 #TEXTTOKEN(#PC)
W $8628,$02 #TEXTTOKEN(#PC)
W $862A,$02 #TEXTTOKEN(#PC)
W $862C,$02 #TEXTTOKEN(#PC)
B $862E,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($862E) }
. TABLE#
B $8631,$01 Terminator.

g $8632 Room #N$19: "#ROOM$19"
B $8632,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8633,$02 #TEXTTOKEN(#PC)
W $8635,$02 #TEXTTOKEN(#PC)
W $8637,$02 #TEXTTOKEN(#PC)
W $8639,$02 #TEXTTOKEN(#PC)
B $863B,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($863B) }
. { #MOVEMENT($863E) }
. TABLE#
B $8641,$01 Terminator.

g $8642 Room #N$1A: "#ROOM$1A"
B $8642,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8643,$02 #TEXTTOKEN(#PC)
W $8645,$02 #TEXTTOKEN(#PC)
W $8647,$02 #TEXTTOKEN(#PC)
W $8649,$02 #TEXTTOKEN(#PC)
B $864B,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($864B) }
. { #MOVEMENT($864E) }
. TABLE#
B $8651,$01 Terminator.

g $8652 Room #N$1B: "#ROOM$1B"
B $8652,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8653,$02 #TEXTTOKEN(#PC)
W $8655,$02 #TEXTTOKEN(#PC)
W $8657,$02 #TEXTTOKEN(#PC)
W $8659,$02 #TEXTTOKEN(#PC)
B $865B,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($865B) }
. TABLE#
B $865E,$01 Terminator.

g $865F Room #N$1C: "#ROOM$1C"
B $865F,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8660,$02 #TEXTTOKEN(#PC)
W $8662,$02 #TEXTTOKEN(#PC)
W $8664,$02 #TEXTTOKEN(#PC)
W $8666,$02 #TEXTTOKEN(#PC)
B $8668,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8668) }
. TABLE#
B $866B,$01 Terminator.

g $866C Room #N$1D: "#ROOM$1D"
B $866C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $866D,$02 #TEXTTOKEN(#PC)
W $866F,$02 #TEXTTOKEN(#PC)
W $8671,$02 #TEXTTOKEN(#PC)
W $8673,$02 #TEXTTOKEN(#PC)
B $8675,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8675) }
. { #MOVEMENT($8678) }
. TABLE#
B $867B,$01 Terminator.

g $867C Room #N$1E: "#ROOM$1E"
B $867C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $867D,$02 #TEXTTOKEN(#PC)
W $867F,$02 #TEXTTOKEN(#PC)
W $8681,$02 #TEXTTOKEN(#PC)
W $8683,$02 #TEXTTOKEN(#PC)
B $8685,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8685) }
. { #MOVEMENT($8688) }
. TABLE#
B $868B,$01 Terminator.

g $868C Room #N$1F: "#ROOM$1F"
B $868C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $868D,$02 #TEXTTOKEN(#PC)
W $868F,$02 #TEXTTOKEN(#PC)
W $8691,$02 #TEXTTOKEN(#PC)
W $8693,$02 #TEXTTOKEN(#PC)
B $8695,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8695) }
. TABLE#
B $8698,$01 Terminator.

g $8699 Room #N$20: "#ROOM$20"
B $8699,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $869A,$02 #TEXTTOKEN(#PC)
W $869C,$02 #TEXTTOKEN(#PC)
W $869E,$02 #TEXTTOKEN(#PC)
W $86A0,$02 #TEXTTOKEN(#PC)
B $86A2,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86A2) }
. { #MOVEMENT($86A5) }
. TABLE#
B $86A8,$01 Terminator.

g $86A9 Room #N$21: "#ROOM$21"
B $86A9,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86AA,$02 #TEXTTOKEN(#PC)
W $86AC,$02 #TEXTTOKEN(#PC)
W $86AE,$02 #TEXTTOKEN(#PC)
W $86B0,$02 #TEXTTOKEN(#PC)
B $86B2,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86B2) }
. { #MOVEMENT($86B5) }
. { #MOVEMENT($86B8) }
. TABLE#
B $86BB,$01 Terminator.

g $86BC Room #N$22: "#ROOM$22"
B $86BC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86BD,$02 #TEXTTOKEN(#PC)
W $86BF,$02 #TEXTTOKEN(#PC)
W $86C1,$02 #TEXTTOKEN(#PC)
W $86C3,$02 #TEXTTOKEN(#PC)
B $86C5,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86C5) }
. { #MOVEMENT($86C8) }
. { #MOVEMENT($86CB) }
. { #MOVEMENT($86CE) }
. TABLE#
B $86D1,$01 Terminator.

g $86D2 Room #N$23: "#ROOM$23"
B $86D2,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86D3,$02 #TEXTTOKEN(#PC)
W $86D5,$02 #TEXTTOKEN(#PC)
W $86D7,$02 #TEXTTOKEN(#PC)
W $86D9,$02 #TEXTTOKEN(#PC)
B $86DB,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86DB) }
. { #MOVEMENT($86DE) }
. TABLE#
B $86E1,$01 Terminator.

g $86E2 Room #N$24: "#ROOM$24"
B $86E2,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86E3,$02 #TEXTTOKEN(#PC)
W $86E5,$02 #TEXTTOKEN(#PC)
W $86E7,$02 #TEXTTOKEN(#PC)
W $86E9,$02 #TEXTTOKEN(#PC)
B $86EB,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86EB) }
. { #MOVEMENT($86EE) }
. TABLE#
B $86F1,$01 Terminator.

g $86F2 Room #N$25: "#ROOM$25"
B $86F2,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $86F3,$02 #TEXTTOKEN(#PC)
W $86F5,$02 #TEXTTOKEN(#PC)
W $86F7,$02 #TEXTTOKEN(#PC)
W $86F9,$02 #TEXTTOKEN(#PC)
B $86FB,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($86FB) }
. TABLE#
B $86FE,$01 Terminator.

g $86FF Room #N$26: "#ROOM$26"
B $86FF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8700,$02 #TEXTTOKEN(#PC)
W $8702,$02 #TEXTTOKEN(#PC)
W $8704,$02 #TEXTTOKEN(#PC)
W $8706,$02 #TEXTTOKEN(#PC)
B $8708,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8708) }
. TABLE#
B $870B,$01 Terminator.

g $870C Room #N$27: "#ROOM$27"
B $870C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $870D,$02 #TEXTTOKEN(#PC)
W $870F,$02 #TEXTTOKEN(#PC)
W $8711,$02 #TEXTTOKEN(#PC)
W $8713,$02 #TEXTTOKEN(#PC)
B $8715,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8715) }
. TABLE#
B $8718,$01 Terminator.

g $8719 Room #N$28: "#ROOM$28"
B $8719,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $871A,$02 #TEXTTOKEN(#PC)
W $871C,$02 #TEXTTOKEN(#PC)
W $871E,$02 #TEXTTOKEN(#PC)
W $8720,$02 #TEXTTOKEN(#PC)
B $8722,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8722) }
. TABLE#
B $8725,$01 Terminator.

g $8726 Room #N$29: "#ROOM$29"
B $8726,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8727,$02 #TEXTTOKEN(#PC)
W $8729,$02 #TEXTTOKEN(#PC)
W $872B,$02 #TEXTTOKEN(#PC)
W $872D,$02 #TEXTTOKEN(#PC)
B $872F,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($872F) }
. { #MOVEMENT($8732) }
. { #MOVEMENT($8735) }
. TABLE#
B $8738,$01 Terminator.

g $8739 Room #N$2A: "#ROOM$2A"
B $8739,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $873A,$02 #TEXTTOKEN(#PC)
W $873C,$02 #TEXTTOKEN(#PC)
W $873E,$02 #TEXTTOKEN(#PC)
W $8740,$02 #TEXTTOKEN(#PC)
B $8742,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8742) }
. TABLE#
B $8745,$01 Terminator.

g $8746 Room #N$2B: "#ROOM$2B"
B $8746,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8747,$02 #TEXTTOKEN(#PC)
W $8749,$02 #TEXTTOKEN(#PC)
W $874B,$02 #TEXTTOKEN(#PC)
W $874D,$02 #TEXTTOKEN(#PC)
B $874F,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($874F) }
. { #MOVEMENT($8752) }
. TABLE#
B $8755,$01 Terminator.

g $8756 Room #N$2C: "#ROOM$2C"
B $8756,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8757,$02 #TEXTTOKEN(#PC)
W $8759,$02 #TEXTTOKEN(#PC)
W $875B,$02 #TEXTTOKEN(#PC)
W $875D,$02 #TEXTTOKEN(#PC)
B $875F,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($875F) }
. TABLE#
B $8762,$01 Terminator.

g $8763 Room #N$2D: "#ROOM$2D"
B $8763,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8764,$02 #TEXTTOKEN(#PC)
W $8766,$02 #TEXTTOKEN(#PC)
W $8768,$02 #TEXTTOKEN(#PC)
W $876A,$02 #TEXTTOKEN(#PC)
B $876C,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($876C) }
. TABLE#
B $876F,$01 Terminator.

g $8770 Room #N$2E: "#ROOM$2E"
B $8770,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8771,$02 #TEXTTOKEN(#PC)
W $8773,$02 #TEXTTOKEN(#PC)
W $8775,$02 #TEXTTOKEN(#PC)
W $8777,$02 #TEXTTOKEN(#PC)
B $8779,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8779) }
. { #MOVEMENT($877C) }
. TABLE#
B $877F,$01 Terminator.

g $8780 Room #N$2F: "#ROOM$2F"
B $8780,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8781,$02 #TEXTTOKEN(#PC)
W $8783,$02 #TEXTTOKEN(#PC)
W $8785,$02 #TEXTTOKEN(#PC)
W $8787,$02 #TEXTTOKEN(#PC)
B $8789,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8789) }
. { #MOVEMENT($878C) }
. { #MOVEMENT($878F) }
. TABLE#
B $8792,$01 Terminator.

g $8793 Room #N$30: "#ROOM$30"
B $8793,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8794,$02 #TEXTTOKEN(#PC)
W $8796,$02 #TEXTTOKEN(#PC)
W $8798,$02 #TEXTTOKEN(#PC)
W $879A,$02 #TEXTTOKEN(#PC)
B $879C,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($879C) }
. TABLE#
B $879F,$01 Terminator.

g $87A0 Room #N$31: "#ROOM$31"
B $87A0,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87A1,$02 #TEXTTOKEN(#PC)
W $87A3,$02 #TEXTTOKEN(#PC)
W $87A5,$02 #TEXTTOKEN(#PC)
W $87A7,$02 #TEXTTOKEN(#PC)
B $87A9,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87A9) }
. TABLE#
B $87AC,$01 Terminator.

g $87AD Room #N$32: "#ROOM$32"
B $87AD,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87AE,$02 #TEXTTOKEN(#PC)
W $87B0,$02 #TEXTTOKEN(#PC)
W $87B2,$02 #TEXTTOKEN(#PC)
W $87B4,$02 #TEXTTOKEN(#PC)
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
B $87C6,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87C7,$02 #TEXTTOKEN(#PC)
W $87C9,$02 #TEXTTOKEN(#PC)
W $87CB,$02 #TEXTTOKEN(#PC)
W $87CD,$02 #TEXTTOKEN(#PC)
B $87CF,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87CF) }
. { #MOVEMENT($87D2) }
. { #MOVEMENT($87D5) }
. TABLE#
B $87D8,$01 Terminator.

g $87D9 Room #N$34: "#ROOM$34"
B $87D9,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87DA,$02 #TEXTTOKEN(#PC)
W $87DC,$02 #TEXTTOKEN(#PC)
W $87DE,$02 #TEXTTOKEN(#PC)
W $87E0,$02 #TEXTTOKEN(#PC)
B $87E2,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87E2) }
. { #MOVEMENT($87E5) }
. { #MOVEMENT($87E8) }
. TABLE#
B $87EB,$01 Terminator.

g $87EC Room #N$35: "#ROOM$35"
B $87EC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87ED,$02 #TEXTTOKEN(#PC)
W $87EF,$02 #TEXTTOKEN(#PC)
W $87F1,$02 #TEXTTOKEN(#PC)
W $87F3,$02 #TEXTTOKEN(#PC)
B $87F5,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($87F5) }
. { #MOVEMENT($87F8) }
. TABLE#
B $87FB,$01 Terminator.

g $87FC Room #N$36: "#ROOM$36"
B $87FC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $87FD,$02 #TEXTTOKEN(#PC)
W $87FF,$02 #TEXTTOKEN(#PC)
W $8801,$02 #TEXTTOKEN(#PC)
W $8803,$02 #TEXTTOKEN(#PC)
B $8805,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8805) }
. { #MOVEMENT($8808) }
. TABLE#
B $880B,$01 Terminator.

g $880C Room #N$37: "#ROOM$37"
B $880C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $880D,$02 #TEXTTOKEN(#PC)
W $880F,$02 #TEXTTOKEN(#PC)
W $8811,$02 #TEXTTOKEN(#PC)
W $8813,$02 #TEXTTOKEN(#PC)
B $8815,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8815) }
. TABLE#
B $8818,$01 Terminator.

g $8819 Room #N$38: "#ROOM$38"
B $8819,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $881A,$02 #TEXTTOKEN(#PC)
W $881C,$02 #TEXTTOKEN(#PC)
W $881E,$02 #TEXTTOKEN(#PC)
W $8820,$02 #TEXTTOKEN(#PC)
B $8822,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8822) }
. { #MOVEMENT($8825) }
. { #MOVEMENT($8828) }
. TABLE#
B $882B,$01 Terminator.

g $882C Room #N$39: "#ROOM$39"
B $882C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $882D,$02 #TEXTTOKEN(#PC)
W $882F,$02 #TEXTTOKEN(#PC)
W $8831,$02 #TEXTTOKEN(#PC)
W $8833,$02 #TEXTTOKEN(#PC)
B $8835,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8835) }
. { #MOVEMENT($8838) }
. { #MOVEMENT($883B) }
. TABLE#
B $883E,$01 Terminator.

g $883F Room #N$3A: "#ROOM$3A"
B $883F,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8840,$02 #TEXTTOKEN(#PC)
W $8842,$02 #TEXTTOKEN(#PC)
W $8844,$02 #TEXTTOKEN(#PC)
W $8846,$02 #TEXTTOKEN(#PC)
B $8848,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8848) }
. TABLE#
B $884B,$01 Terminator.

g $884C Room #N$3B: "#ROOM$3B"
B $884C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $884D,$02 #TEXTTOKEN(#PC)
W $884F,$02 #TEXTTOKEN(#PC)
W $8851,$02 #TEXTTOKEN(#PC)
W $8853,$02 #TEXTTOKEN(#PC)
B $8855,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8855) }
. { #MOVEMENT($8858) }
. TABLE#
B $885B,$01 Terminator.

g $885C Room #N$3C: "#ROOM$3C"
B $885C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $885D,$02 #TEXTTOKEN(#PC)
W $885F,$02 #TEXTTOKEN(#PC)
W $8861,$02 #TEXTTOKEN(#PC)
W $8863,$02 #TEXTTOKEN(#PC)
B $8865,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8865) }
. { #MOVEMENT($8868) }
. TABLE#
B $886B,$01 Terminator.

g $886C Room #N$3D: "#ROOM$3D"
B $886C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $886D,$02 #TEXTTOKEN(#PC)
W $886F,$02 #TEXTTOKEN(#PC)
W $8871,$02 #TEXTTOKEN(#PC)
W $8873,$02 #TEXTTOKEN(#PC)
B $8875,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8875) }
. { #MOVEMENT($8878) }
. TABLE#
B $887B,$01 Terminator.

g $887C Room #N$3E: "#ROOM$3E"
B $887C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $887D,$02 #TEXTTOKEN(#PC)
W $887F,$02 #TEXTTOKEN(#PC)
W $8881,$02 #TEXTTOKEN(#PC)
W $8883,$02 #TEXTTOKEN(#PC)
B $8885,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8885) }
. { #MOVEMENT($8888) }
. TABLE#
B $888B,$01 Terminator.

g $888C Room #N$3F: "#ROOM$3F"
B $888C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $888D,$02 #TEXTTOKEN(#PC)
W $888F,$02 #TEXTTOKEN(#PC)
W $8891,$02 #TEXTTOKEN(#PC)
W $8893,$02 #TEXTTOKEN(#PC)
B $8895,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8895) }
. { #MOVEMENT($8898) }
. TABLE#
B $889B,$01 Terminator.

g $889C Room #N$40: "#ROOM$40"
B $889C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $889D,$02 #TEXTTOKEN(#PC)
W $889F,$02 #TEXTTOKEN(#PC)
W $88A1,$02 #TEXTTOKEN(#PC)
W $88A3,$02 #TEXTTOKEN(#PC)
B $88A5,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88A5) }
. { #MOVEMENT($88A8) }
. { #MOVEMENT($88AB) }
. TABLE#
B $88AE,$01 Terminator.

g $88AF Room #N$41: "#ROOM$41"
B $88AF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88B0,$02 #TEXTTOKEN(#PC)
W $88B2,$02 #TEXTTOKEN(#PC)
W $88B4,$02 #TEXTTOKEN(#PC)
W $88B6,$02 #TEXTTOKEN(#PC)
B $88B8,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88B8) }
. { #MOVEMENT($88BB) }
. TABLE#
B $88BE,$01 Terminator.

g $88BF Room #N$42: "#ROOM$42"
B $88BF,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88C0,$02 #TEXTTOKEN(#PC)
W $88C2,$02 #TEXTTOKEN(#PC)
W $88C4,$02 #TEXTTOKEN(#PC)
W $88C6,$02 #TEXTTOKEN(#PC)
B $88C8,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88C8) }
. TABLE#
B $88CB,$01 Terminator.

g $88CC Room #N$43: "#ROOM$43"
B $88CC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88CD,$02 #TEXTTOKEN(#PC)
W $88CF,$02 #TEXTTOKEN(#PC)
W $88D1,$02 #TEXTTOKEN(#PC)
W $88D3,$02 #TEXTTOKEN(#PC)
B $88D5,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88D5) }
. { #MOVEMENT($88D8) }
. TABLE#
B $88DB,$01 Terminator.

g $88DC Room #N$44: "#ROOM$44"
B $88DC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88DD,$02 #TEXTTOKEN(#PC)
W $88DF,$02 #TEXTTOKEN(#PC)
W $88E1,$02 #TEXTTOKEN(#PC)
W $88E3,$02 #TEXTTOKEN(#PC)
B $88E5,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($88E5) }
. { #MOVEMENT($88E8) }
. TABLE#
B $88EB,$01 Terminator.

g $88EC Room #N$45: "#ROOM$45"
B $88EC,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $88ED,$02 #TEXTTOKEN(#PC)
W $88EF,$02 #TEXTTOKEN(#PC)
W $88F1,$02 #TEXTTOKEN(#PC)
W $88F3,$02 #TEXTTOKEN(#PC)
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
B $8905,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8906,$02 #TEXTTOKEN(#PC)
W $8908,$02 #TEXTTOKEN(#PC)
W $890A,$02 #TEXTTOKEN(#PC)
W $890C,$02 #TEXTTOKEN(#PC)
B $890E,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($890E) }
. { #MOVEMENT($8911) }
. { #MOVEMENT($8914) }
. { #MOVEMENT($8917) }
. TABLE#
B $891A,$01 Terminator.

g $891B Room #N$47: "#ROOM$47"
B $891B,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $891C,$02 #TEXTTOKEN(#PC)
W $891E,$02 #TEXTTOKEN(#PC)
W $8920,$02 #TEXTTOKEN(#PC)
W $8922,$02 #TEXTTOKEN(#PC)
B $8924,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8924) }
. TABLE#
B $8927,$01 Terminator.

g $8928 Room #N$48: "#ROOM$48"
B $8928,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8929,$02 #TEXTTOKEN(#PC)
W $892B,$02 #TEXTTOKEN(#PC)
W $892D,$02 #TEXTTOKEN(#PC)
W $892F,$02 #TEXTTOKEN(#PC)
B $8931,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8931) }
. { #MOVEMENT($8934) }
. TABLE#
B $8937,$01 Terminator.

g $8938 Room #N$49: "#ROOM$49"
B $8938,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8939,$02 #TEXTTOKEN(#PC)
W $893B,$02 #TEXTTOKEN(#PC)
W $893D,$02 #TEXTTOKEN(#PC)
W $893F,$02 #TEXTTOKEN(#PC)
B $8941,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8941) }
. { #MOVEMENT($8944) }
. TABLE#
B $8947,$01 Terminator.

g $8948 Room #N$4A: "#ROOM$4A"
B $8948,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8949,$02 #TEXTTOKEN(#PC)
W $894B,$02 #TEXTTOKEN(#PC)
W $894D,$02 #TEXTTOKEN(#PC)
W $894F,$02 #TEXTTOKEN(#PC)
B $8951,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8951) }
. TABLE#
B $8954,$01 Terminator.

g $8955 Room #N$4B: "#ROOM$4B"
B $8955,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8956,$02 #TEXTTOKEN(#PC)
W $8958,$02 #TEXTTOKEN(#PC)
W $895A,$02 #TEXTTOKEN(#PC)
W $895C,$02 #TEXTTOKEN(#PC)
B $895E,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($895E) }
. TABLE#
B $8961,$01 Terminator.

g $8962 Room #N$4C: "#ROOM$4C"
B $8962,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8963,$02 #TEXTTOKEN(#PC)
W $8965,$02 #TEXTTOKEN(#PC)
W $8967,$02 #TEXTTOKEN(#PC)
W $8969,$02 #TEXTTOKEN(#PC)
B $896B,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($896B) }
. { #MOVEMENT($896E) }
. { #MOVEMENT($8971) }
. { #MOVEMENT($8974) }
. TABLE#
B $8977,$01 Terminator.

g $8978 Room #N$4D: "#ROOM$4D"
B $8978,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8979,$02 #TEXTTOKEN(#PC)
W $897B,$02 #TEXTTOKEN(#PC)
W $897D,$02 #TEXTTOKEN(#PC)
W $897F,$02 #TEXTTOKEN(#PC)
B $8981,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8981) }
. { #MOVEMENT($8984) }
. TABLE#
B $8987,$01 Terminator.

g $8988 Room #N$4E: "#ROOM$4E"
B $8988,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8989,$02 #TEXTTOKEN(#PC)
W $898B,$02 #TEXTTOKEN(#PC)
W $898D,$02 #TEXTTOKEN(#PC)
W $898F,$02 #TEXTTOKEN(#PC)
B $8991,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8991) }
. { #MOVEMENT($8994) }
. { #MOVEMENT($8997) }
. TABLE#
B $899A,$01 Terminator.

g $899B Room #N$4F: "#ROOM$4F"
B $899B,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $899C,$02 #TEXTTOKEN(#PC)
W $899E,$02 #TEXTTOKEN(#PC)
W $89A0,$02 #TEXTTOKEN(#PC)
W $89A2,$02 #TEXTTOKEN(#PC)
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
B $89B4,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89B5,$02 #TEXTTOKEN(#PC)
W $89B7,$02 #TEXTTOKEN(#PC)
W $89B9,$02 #TEXTTOKEN(#PC)
W $89BB,$02 #TEXTTOKEN(#PC)
B $89BD,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89BD) }
. { #MOVEMENT($89C0) }
. { #MOVEMENT($89C3) }
. TABLE#
B $89C6,$01 Terminator.

g $89C7 Room #N$51: "#ROOM$51"
B $89C7,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89C8,$02 #TEXTTOKEN(#PC)
W $89CA,$02 #TEXTTOKEN(#PC)
W $89CC,$02 #TEXTTOKEN(#PC)
W $89CE,$02 #TEXTTOKEN(#PC)
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
B $89E0,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89E1,$02 #TEXTTOKEN(#PC)
W $89E3,$02 #TEXTTOKEN(#PC)
W $89E5,$02 #TEXTTOKEN(#PC)
W $89E7,$02 #TEXTTOKEN(#PC)
B $89E9,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89E9) }
. { #MOVEMENT($89EC) }
. { #MOVEMENT($89EF) }
. TABLE#
B $89F2,$01 Terminator.

g $89F3 Room #N$53: "#ROOM$53"
B $89F3,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $89F4,$02 #TEXTTOKEN(#PC)
W $89F6,$02 #TEXTTOKEN(#PC)
W $89F8,$02 #TEXTTOKEN(#PC)
W $89FA,$02 #TEXTTOKEN(#PC)
B $89FC,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($89FC) }
. { #MOVEMENT($89FF) }
. { #MOVEMENT($8A02) }
. { #MOVEMENT($8A05) }
. TABLE#
B $8A08,$01 Terminator.

g $8A09 Room #N$54: "#ROOM$54"
B $8A09,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A0A,$02 #TEXTTOKEN(#PC)
W $8A0C,$02 #TEXTTOKEN(#PC)
W $8A0E,$02 #TEXTTOKEN(#PC)
W $8A10,$02 #TEXTTOKEN(#PC)
B $8A12,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A12) }
. { #MOVEMENT($8A15) }
. TABLE#
B $8A18,$01 Terminator.

g $8A19 Room #N$55: "#ROOM$55"
B $8A19,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A1A,$02 #TEXTTOKEN(#PC)
W $8A1C,$02 #TEXTTOKEN(#PC)
W $8A1E,$02 #TEXTTOKEN(#PC)
W $8A20,$02 #TEXTTOKEN(#PC)
B $8A22,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A22) }
. { #MOVEMENT($8A25) }
. TABLE#
B $8A28,$01 Terminator.

g $8A29 Room #N$56: "#ROOM$56"
B $8A29,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A2A,$02 #TEXTTOKEN(#PC)
W $8A2C,$02 #TEXTTOKEN(#PC)
W $8A2E,$02 #TEXTTOKEN(#PC)
W $8A30,$02 #TEXTTOKEN(#PC)
B $8A32,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A32) }
. { #MOVEMENT($8A35) }
. { #MOVEMENT($8A38) }
. TABLE#
B $8A3B,$01 Terminator.

g $8A3C Room #N$57: "#ROOM$57"
B $8A3C,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A3D,$02 #TEXTTOKEN(#PC)
W $8A3F,$02 #TEXTTOKEN(#PC)
W $8A41,$02 #TEXTTOKEN(#PC)
W $8A43,$02 #TEXTTOKEN(#PC)
B $8A45,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A45) }
. { #MOVEMENT($8A48) }
. { #MOVEMENT($8A4B) }
. TABLE#
B $8A4E,$01 Terminator.

g $8A4F Room #N$58: "#ROOM$58"
B $8A4F,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A50,$02 #TEXTTOKEN(#PC)
W $8A52,$02 #TEXTTOKEN(#PC)
W $8A54,$02 #TEXTTOKEN(#PC)
W $8A56,$02 #TEXTTOKEN(#PC)
B $8A58,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A58) }
. { #MOVEMENT($8A5B) }
. { #MOVEMENT($8A5E) }
. TABLE#
B $8A61,$01 Terminator.

g $8A62 Room #N$59: "#ROOM$59"
B $8A62,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A63,$02 #TEXTTOKEN(#PC)
W $8A65,$02 #TEXTTOKEN(#PC)
W $8A67,$02 #TEXTTOKEN(#PC)
W $8A69,$02 #TEXTTOKEN(#PC)
B $8A6B,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A6B) }
. { #MOVEMENT($8A6E) }
. { #MOVEMENT($8A71) }
. { #MOVEMENT($8A74) }
. TABLE#
B $8A77,$01 Terminator.

g $8A78 Room #N$5A: "#ROOM$5A"
B $8A78,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A79,$02 #TEXTTOKEN(#PC)
W $8A7B,$02 #TEXTTOKEN(#PC)
W $8A7D,$02 #TEXTTOKEN(#PC)
W $8A7F,$02 #TEXTTOKEN(#PC)
B $8A81,$09,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A81) }
. { #MOVEMENT($8A84) }
. { #MOVEMENT($8A87) }
. TABLE#
B $8A8A,$01 Terminator.

g $8A8B Room #N$5B: "#ROOM$5B"
B $8A8B,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8A8C,$02 #TEXTTOKEN(#PC)
W $8A8E,$02 #TEXTTOKEN(#PC)
W $8A90,$02 #TEXTTOKEN(#PC)
W $8A92,$02 #TEXTTOKEN(#PC)
B $8A94,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8A94) }
. { #MOVEMENT($8A97) }
. { #MOVEMENT($8A9A) }
. { #MOVEMENT($8A9D) }
. TABLE#
B $8AA0,$01 Terminator.

g $8AA1 Room #N$5C: "#ROOM$5C"
B $8AA1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AA2,$02 #TEXTTOKEN(#PC)
W $8AA4,$02 #TEXTTOKEN(#PC)
W $8AA6,$02 #TEXTTOKEN(#PC)
W $8AA8,$02 #TEXTTOKEN(#PC)
B $8AAA,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8AAA) }
. { #MOVEMENT($8AAD) }
. TABLE#
B $8AB0,$01 Terminator.

g $8AB1 Room #N$5D: "#ROOM$5D"
B $8AB1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AB2,$02 #TEXTTOKEN(#PC)
W $8AB4,$02 #TEXTTOKEN(#PC)
W $8AB6,$02 #TEXTTOKEN(#PC)
W $8AB8,$02 #TEXTTOKEN(#PC)
B $8ABA,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8ABA) }
. { #MOVEMENT($8ABD) }
. TABLE#
B $8AC0,$01 Terminator.

g $8AC1 Room #N$5E: "#ROOM$5E"
B $8AC1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AC2,$02 #TEXTTOKEN(#PC)
W $8AC4,$02 #TEXTTOKEN(#PC)
W $8AC6,$02 #TEXTTOKEN(#PC)
W $8AC8,$02 #TEXTTOKEN(#PC)
B $8ACA,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8ACA) }
. { #MOVEMENT($8ACD) }
. TABLE#
B $8AD0,$01 Terminator.

g $8AD1 Room #N$5F: "#ROOM$5F"
B $8AD1,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AD2,$02 #TEXTTOKEN(#PC)
W $8AD4,$02 #TEXTTOKEN(#PC)
W $8AD6,$02 #TEXTTOKEN(#PC)
W $8AD8,$02 #TEXTTOKEN(#PC)
B $8ADA,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8ADA) }
. TABLE#
B $8ADD,$01 Terminator.

g $8ADE Room #N$60: "#ROOM$60"
B $8ADE,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8ADF,$02 #TEXTTOKEN(#PC)
W $8AE1,$02 #TEXTTOKEN(#PC)
W $8AE3,$02 #TEXTTOKEN(#PC)
W $8AE5,$02 #TEXTTOKEN(#PC)
B $8AE7,$0C,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8AE7) }
. { #MOVEMENT($8AEA) }
. { #MOVEMENT($8AED) }
. { #MOVEMENT($8AF0) }
. TABLE#
B $8AF3,$01 Terminator.

g $8AF4 Room #N$61: "#ROOM$61"
B $8AF4,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8AF5,$02 #TEXTTOKEN(#PC)
W $8AF7,$02 #TEXTTOKEN(#PC)
W $8AF9,$02 #TEXTTOKEN(#PC)
W $8AFB,$02 #TEXTTOKEN(#PC)
B $8AFD,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8AFD) }
. { #MOVEMENT($8B00) }
. TABLE#
B $8B03,$01 Terminator.

g $8B04 Room #N$62: "#ROOM$62"
B $8B04,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B05,$02 #TEXTTOKEN(#PC)
W $8B07,$02 #TEXTTOKEN(#PC)
W $8B09,$02 #TEXTTOKEN(#PC)
W $8B0B,$02 #TEXTTOKEN(#PC)
B $8B0D,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B0D) }
. TABLE#
B $8B10,$01 Terminator.

g $8B11 Room #N$63: "#ROOM$63"
B $8B11,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B12,$02 #TEXTTOKEN(#PC)
W $8B14,$02 #TEXTTOKEN(#PC)
W $8B16,$02 #TEXTTOKEN(#PC)
W $8B18,$02 #TEXTTOKEN(#PC)
B $8B1A,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B1A) }
. { #MOVEMENT($8B1D) }
. TABLE#
B $8B20,$01 Terminator.

g $8B21 Room #N$64: "#ROOM$64"
B $8B21,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B22,$02 #TEXTTOKEN(#PC)
W $8B24,$02 #TEXTTOKEN(#PC)
W $8B26,$02 #TEXTTOKEN(#PC)
W $8B28,$02 #TEXTTOKEN(#PC)
B $8B2A,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B2A) }
. { #MOVEMENT($8B2D) }
. TABLE#
B $8B30,$01 Terminator.

g $8B31 Room #N$65: "#ROOM$65"
B $8B31,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B32,$02 #TEXTTOKEN(#PC)
W $8B34,$02 #TEXTTOKEN(#PC)
W $8B36,$02 #TEXTTOKEN(#PC)
W $8B38,$02 #TEXTTOKEN(#PC)
B $8B3A,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B3A) }
. TABLE#
B $8B3D,$01 Terminator.

g $8B3E Room #N$66: "#ROOM$66"
B $8B3E,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B3F,$02 #TEXTTOKEN(#PC)
W $8B41,$02 #TEXTTOKEN(#PC)
W $8B43,$02 #TEXTTOKEN(#PC)
W $8B45,$02 #TEXTTOKEN(#PC)
B $8B47,$06,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B47) }
. { #MOVEMENT($8B4A) }
. TABLE#
B $8B4D,$01 Terminator.

g $8B4E Room #N$67: "#ROOM$67"
B $8B4E,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B4F,$02 #TEXTTOKEN(#PC)
W $8B51,$02 #TEXTTOKEN(#PC)
W $8B53,$02 #TEXTTOKEN(#PC)
W $8B55,$02 #TEXTTOKEN(#PC)
B $8B57,$01 Terminator.

g $8B58 Room #N$68: "#ROOM$68"
B $8B58,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B59,$02 #TEXTTOKEN(#PC)
W $8B5B,$02 #TEXTTOKEN(#PC)
W $8B5D,$02 #TEXTTOKEN(#PC)
W $8B5F,$02 #TEXTTOKEN(#PC)
B $8B61,$03,$03 #TABLE(default,centre,centre,centre)
. { =h Direction | =h Via | =h Destination }
. { #MOVEMENT($8B61) }
. TABLE#
B $8B64,$01 Terminator.

g $8B65 Room #N$69: "#ROOM$69"
B $8B65,b$01 #LOCATIONATTRIBUTE(#PEEK(#PC))
W $8B66,$02 #TEXTTOKEN(#PC)
W $8B68,$02 #TEXTTOKEN(#PC)
W $8B6A,$02 #TEXTTOKEN(#PC)
W $8B6C,$02 #TEXTTOKEN(#PC)
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
B $8CC2,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8CD3,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8CE4,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8CF5,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D06,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D17,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D28,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D39,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D4A,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D5B,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D6C,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D7D,$0E,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8D94,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8DA5,$0E,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8DBC,$0C,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8DD1,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8DE2,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8DF3,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8E04,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8E15,$11,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8E2F,$0F,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8E47,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8E5D,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8E6E,$12,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8E89,$12,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8EA4,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8EB5,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8EC6,$0A,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8ED9,$0A,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8EEC,$09,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8EFE,$14,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8F1B,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8F34,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8F45,$14,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8F62,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8F7B,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8F8C,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8FA5,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8FBE,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8FD7,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $8FF0,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9009,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9022,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $903B,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9054,$09,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9066,$0F,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $907E,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $908F,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $90A0,$11,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $90BA,$11,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $90D4,$15,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $90F2,$0F,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $910A,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9120,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9136,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $914C,$13,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9168,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $917E,$09,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9190,$09,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $91A2,$0F,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $91BA,$12,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $91D5,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $91E6,$0E,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $91FD,$0C,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9212,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9223,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9234,$0B,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9248,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9259,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $926F,$0F,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9287,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $929D,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $92AE,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $92BF,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $92D5,$0F,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $92ED,$09,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $92FF,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9310,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9321,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9332,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9348,$0A,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $935B,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $936C,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $937D,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $938E,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $939F,$0E,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $93B6,$0C,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $93CB,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $93DC,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $93ED,$0C,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9402,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9413,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9429,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $943A,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $944B,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $945C,$0E,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9473,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9484,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9495,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $94A6,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $94B7,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $94C8,$0C,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $94DD,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $94EE,$0D,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9504,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9515,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9526,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9537,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9548,$08,$02 Object Name: "#TEXTTOKEN(#PC)".
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
B $9559,$10,$02 Object Name: "#TEXTTOKEN(#PC)".
B $9569,$01 Terminator #N(#PEEK(#PC)).

g $956A

g $9860
B $9860,$01
B $9863,$01
W $9866,$02

g $994D
W $994D,$02

c $9C6A
  $9C6A,$03 #REGa=*#R$A036.
  $9C6D,$04 #REGix=#R$9C85.
  $9C71,$03 Call #R$D34E.
  $9C74,$02 Compare #REGa with #N$FF.
  $9C76,$01 Return.

c $9C77
  $9C77,$03 Call #R$9C6A.
  $9C7A,$01 Return if #REGa is equal to #N$FF.
  $9C7B,$03 #REGl=*#REGix+#N$01.
  $9C7E,$03 #REGh=*#REGix+#N$02.
  $9C81,$01 #REGa=#REGl.
  $9C82,$01 Set the bits from #REGh.
  $9C83,$01 Return if #REGa is equal to #REGh.
  $9C84,$01 Jump to *#REGhl.

b $9C85

c $9CA2

g $9FD4
W $9FD4,$02

g $9FD6

g $9FDD
W $9FDD,$02

g $9FDF
g $9FE0

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

g $9FE2
g $A008
g $A00B
g $A00C

g $A00D
W $A00D,$02

g $A00F
g $A011
g $A017
g $A019
g $A01B

g $A01D
B $A01D,$01

g $A01E
B $A01E,$01

g $A01F
B $A01F,$01

g $A026
B $A026,$01

g $A027
B $A027,$01

g $A028
B $A028,$01

g $A033
B $A033,$01

g $A034
B $A034,$01

g $A035
B $A035,$01

g $A036
B $A036,$01

g $A037
B $A037,$01

c $A040
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
  $A064,$04 Write #N$00 to *#R$A0DA.
  $A068,$06 Jump to #R$A0E7 if *#R$A0DA is not zero.
  $A06E,$03 Call #R$BFD9.
  $A071,$03 Call #R$BF79.
  $A074,$04 #REGiy=#R$9860.
  $A078,$03 #REGa=*#REGiy+#N$03.
  $A07B,$04 Jump to #R$A093 if #REGa is not equal to #N$32.
  $A07F,$03 Call #R$C41F.
  $A082,$04 Jump to #R$A093 if bit 7 of #REGa is not set.
  $A086,$04 Jump to #R$A093 if #REGa is not equal to #N$8D.
  $A08A,$03 #REGhl=*#R$9FDD.
  $A08D,$03 Write #REGl to *#REGiy+#N$06.
  $A090,$03 Write #REGh to *#REGiy+#N$07.
  $A093,$04 #REGiy=#R$9860.
  $A097,$03 #REGa=*#REGiy+#N$00.
  $A09A,$01 Increment #REGa by one.
  $A09B,$02 Jump to #R$A068 if #REGa is equal to #N$8D.
  $A09D,$03 #REGhl=*#R$9FDD.
  $A0A0,$03 Call #R$A0DB.
  $A0A3,$02 Jump to #R$A0D1 if #REGa is less than #N$8D.
  $A0A5,$03 #REGa=*#REGiy+#N$00.
  $A0A8,$03 Stash #REGiy and #REGaf on the stack.
  $A0AB,$03 Call #R$CC37.
  $A0AE,$01 Restore #REGaf from the stack.
  $A0AF,$01 Stash #REGaf on the stack.
  $A0B0,$03 Call #R$CC78.
  $A0B3,$03 #REGhl=*#R$A01F.
  $A0B6,$04 Jump back to #R$A0AE until #REGhl is zero.
  $A0BA,$03 Restore #REGaf and #REGiy from the stack.
  $A0BD,$03 #REGe=*#REGiy+#N$06.
  $A0C0,$03 #REGd=*#REGiy+#N$07.
  $A0C3,$01 #REGhl+=#REGde.
  $A0C4,$03 Write #REGl to *#REGiy+#N$06.
  $A0C7,$03 Write #REGh to *#REGiy+#N$07.
  $A0CA,$02 Stash #REGiy on the stack.
  $A0CC,$03 Call #R$9C77.
  $A0CF,$02 Restore #REGiy from the stack.
  $A0D1,$03 #REGde=#N($0008,$04,$04).
  $A0D4,$02 #REGiy+=#REGde.
  $A0D6,$02 Jump to #R$A097.

b $A0D8
  $A0DA

c $A0DB
  $A0DB,$03 #REGe=*#REGiy+#N$06.
  $A0DE,$03 #REGd=*#REGiy+#N$07.
  $A0E1,$03 Return if #REGh is not equal to #REGd.
  $A0E4,$02 Compare #REGl with #REGe.
  $A0E6,$01 Return.

c $A0E7
  $A0E7,$04 Jump to #R$A0F1 if #REGa is equal to #N$02.
  $A0EB,$03 Call #R$B0D7.
  $A0EE,$03 Jump to #R$A040.

  $A0F1,$03 Call #R$B0E4.
  $A0F4,$03 Jump to #R$A064.

c $A0F7

w $A24D

c $A25D

c $A277

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
  $A32D,$01 Compare #REGa with #REGb.
  $A32E,$02 Jump to #R$A336 if #REGa is equal to #REGb.
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
W $A35E,$02

c $A360

c $A37D

c $A4AB

c $A4BC

c $A4CD

w $A55D

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
  $A5C3,$01 Jump to *#REGhl.

c $A5C4
  $A5C4,$03 #REGix=#REGhl (using the stack).
  $A5C7,$03 Call #R$A5CD.
  $A5CA,$02 Jump to #R$A5C7 if ?? is not equal to #N$00.
  $A5CC,$01 Return.

c $A5CD
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
  $A5EF,$02,b$01 Set bit 0.
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

c $A68C

c $A694

c $A69C

c $A6A4

c $A6AC
  $A6AC,$03 Call #R$C00C.
  $A6AF,$03 Return if #REGa is equal to #N$01.
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
  $A6F8,$03 #REGhl=#R$A6D1.
  $A6FB,$01 Decrease *#REGhl by one.
  $A6FC,$02 Jump to #R$A6E5 if *#REGhl is not equal to *#REGhl.
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
  $A7A2,$03 #REGde=#N$0485.
  $A7A5,$01 Return if ?? is not equal to #REGa.
  $A7A6,$03 #REGde=#N($007A,$04,$04).
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
  $A7BC,$01 Stash #REGhl on the stack.
  $A7BD,$02 Restore #REGiy from the stack.
  $A7BF,$03 Call #R$D405.
  $A7C2,$02 Restore #REGiy from the stack.
  $A7C4,$01 Return.

  $A7C5,$02 Stash #REGiy on the stack.
  $A7C7,$01 Stash #REGhl on the stack.
  $A7C8,$02 Restore #REGiy from the stack.
  $A7CA,$03 Call #R$D3E8.
  $A7CD,$02 Restore #REGiy from the stack.
  $A7CF,$01 Return.

  $A7D0,$01 #REGa=#N$00.
  $A7D1,$03 Write #REGa to *#R$A7EA.
  $A7D4,$02 Test bit 7 of #REGd.
  $A7D6,$02 Jump to #R$A7EB if ?? is equal to #REGa.
  $A7D8,$01 #REGa=#REGe.
  $A7D9,$03 #REGhl=#N$09EE.
  $A7DC,$01 Compare #REGa with #REGl.
  $A7DD,$02 Jump to #R$A7E4 if #REGa is not equal to #REGl.
  $A7DF,$01 #REGa=#REGd.
  $A7E0,$02,b$01 Keep only bits 0-3.
  $A7E2,$01 Compare #REGa with #REGh.
  $A7E3,$01 Return if #REGa is equal to #REGh.
  $A7E4,$02 #REGa=#N$01.
  $A7E6,$03 Write #REGa to *#R$A7EA.
  $A7E9,$01 Return.

g $A7EA
B $A7EA,$01

c $A7EB
  $A7EB,$03 #REGhl=#R$A24D.
  $A7EE,$03 #REGa=*#R$A027.
  $A7F1,$01 #REGe=#REGa.
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
  $A834,$03 #REGde=#N$080E.
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

c $A880

c $A990

g $A9B5
W $A9B5,$02

c $A9B7

c $B0D7
  $B0D7,$03 Call #R$B0EE.
  $B0DA,$03 Call #R$C0DF.
  $B0DD,$02 Jump to #R$B0D7 if the carry flag is not set.
  $B0DF,$04 #REGiy=*#R$9FD4.
  $B0E3,$01 Return.

c $B0E4
  $B0E4,$04 Write #REGiy to #R$9FD4.
  $B0E8,$03 Call #R$B0EE.
  $B0EB,$03 Jump to #R$C040.

  $B0EE,$04 #REGix=#R$840B.
  $B0F2,$03 #REGhl=#R$A01F.
  $B0F5,$03 #REGde=#R$840B.
  $B0F8,$03 #REGhl-=#REGde (with carry).
  $B0FB,$01 Exchange the #REGde and #REGhl registers.
  $B0FC,$01 Return.

c $B0FD

t $BF59 Table: Days Of The Week Strings
@ $BF59 label=Table_DaysOfWeekStrings
  $BF59,$15,$03

g $BF6E Messaging: Current Date
@ $BF6E label=Messaging_CurrentDate
T $BF6E,$0B "#STR$BF6E,$08,$0B".

c $BF79 Handler: Date Bar
@ $BF79 label=Handler_DateBar
N $BF79 #PUSHS #SIM(start=$BF9C,stop=$C1BF)
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

c $BFD9 Handler: Counters
@ $BFD9 label=Handler_Counters
  $BFD9,$07 Increment *#R$9FDD by one.
  $BFE0,$03 #REGhl=#R$9FDF.
  $BFE3,$01 Increment *#REGhl by one.
  $BFE4,$04 Return if *#REGhl is not equal to #N$3C.
  $BFE8,$02 Write #N$00 to *#REGhl.
  $BFEA,$03 #REGhl=#R$9FE0.
  $BFED,$01 Increment *#REGhl by one.
  $BFEE,$05 Jump to #R$BFF6 if *#REGhl is not equal to #N$0D.
  $BFF3,$02 Write #N$01 to *#REGhl.
  $BFF5,$01 Return.
@ $BFF6 label=Counters
  $BFF6,$03 Return if *#REGhl is not equal to #N$0C.
  $BFF9,$03 #REGa=*#R$9FE2.
  $BFFC,$02,b$01 Flip bits 0, 4.
  $BFFE,$03 Write #REGa to *#R$9FE2.

  $C001,$03 Return if #REGa is not equal to #N$61.
  $C004,$07 Increment *#R$9FE1 by one.
  $C00B,$01 Return.

c $C00C

c $C040
N $C040 Prints "#STR$09A2".
  $C040,$03 #REGhl=#N$09A2.
  $C043,$03 Call #R$C1C0.
  $C046,$04 Write #REGde to *#R$C109.
  $C04A,$04 Write #REGix to *#R$C10B.
  $C04E,$04 #REGix=#R$C0FE.
  $C052,$03 #REGde=#N($0011,$04,$04).
  $C055,$01 #REGa=#N$00.
  $C056,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
  $C059,$02 #REGb=#N$32.
  $C05B,$01 Halt operation (suspend CPU until the next interrupt).
  $C05C,$02 Decrease counter by one and loop back to #R$C05B until counter is zero.
  $C05E,$01 Disable interrupts.
  $C05F,$04 #REGde=*#R$C109.
  $C063,$04 #REGix=*#R$C10B.
  $C067,$02 Set #REGa to #N$FF to indicate this is a data block.
  $C069,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
  $C06C,$01 Disable interrupts.
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
  $C086,$02 Jump to #R$C098 if ?? is greater than or equal to #REGa.
  $C088,$01 Set flags.
  $C089,$04 #REGde=*#R$C109.
  $C08D,$04 #REGix=*#R$C10B.
  $C091,$02 Set #REGa to #N$FF to indicate this is a data block.
  $C093,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0556.html">LD_BYTES</a>.)
  $C096,$01 Disable interrupts.
  $C097,$01 Return if ?? is less than #REGa.
  $C098,$01 Disable interrupts.
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
  $C0B1 "#STR$C0B1".

t $C0BC Messaging: Play Saved Game Tape
@ $C0BC label=Messaging_PlaySavedGameTape
  $C0BC,$23 "#STR$C0BC".

c $C0DF
  $C0DF,$04 Write #REGde to *#R$C109.
  $C0E3,$04 Write #REGix to *#R$C10B.
N $C0E7 "#STR$C0BC".
  $C0E7,$03 #REGhl=#R$C0BC.
  $C0EA,$03 Call #R$C1CB.
  $C0ED,$04 #REGix=#R$C0FE.
  $C0F1,$03 #REGde=#N($0011,$04,$04).
  $C0F4,$02 Set #REGa to #N$00 to indicate this is a header block.
  $C0F6,$01 Set flags.
  $C0F7,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0556.html">LD_BYTES</a>.)
  $C0FA,$02 Jump to #R$C0ED if there was a tape loading error.
  $C0FC,$02 Jump to #R$C089.

b $C0FE
W $C109
W $C10B

c $C10F
  $C10F,$04 Set border colour to #INK$07.
  $C113,$03 #REGhl=#N$4000.
  $C116,$03 #REGde=#N$4001 (screen buffer location).
  $C119,$03 #REGbc=#N$1800.
  $C11C,$02 Write #N$00 to *#REGhl.
  $C11E,$02 LDIR.
  $C120,$03 #REGbc=#N$02FF.
  $C123,$02 Write #COLOUR$38 to *#REGhl.
  $C125,$02 LDIR.
  $C127,$01 Return.

g $C128
B $C128,$01

c $C129
  $C129,$04 Write #N$00 to *#R$A019.
  $C12D,$04 Write #N$01 to *#R$C128.
  $C131,$05 Write #N$12 to *#R$C1F5.
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

c $C1C0
  $C1C0,$03 Call #R$C1CB.
  $C1C3,$03 Call #R$C415.
  $C1C6,$02 #REGa=#N$0D.
  $C1C8,$03 Jump to #R$C1FD.

c $C1CB
  $C1CB,$01 #REGa=*#REGhl.
  $C1CC,$02,b$01 Keep only bits 0-6.
  $C1CE,$03 Call #R$C1FD.
  $C1D1,$03 Return if bit 7 of *#REGhl is set.
  $C1D4,$01 Increment #REGhl by one.
  $C1D5,$02 Jump to #R$C1CB.
  $C1D7,$01 Return.

c $C1D8
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
  $C1FC,$01 Stash #REGaf on the stack.
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

c $C415
  $C415,$03 Call #R$C41F.
  $C418,$04 Jump to #R$C415 if bit 7 of #REGa.
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
N $C44B Did the player press "ENTER"?
@ $C44B label=GetKeypress_CheckEnter
  $C44B,$04 #HTML(Jump to #R$C451 if
. *<a href="https://skoolkid.github.io/rom/asm/5C08.html">LAST-K</a> (last key
. pressed) is not ASCII #N$0B ("ENTER").)
  $C44F,$02 Load #REGa with #N$5B (enter was pressed).
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

c $C863

c $C86E

c $C8A7

c $C8AF

c $C8BE

c $C8C6

c $C8EF

c $C929

c $C989

c $CC0E
  $CC0E,$02 Stash #REGde and #REGbc on the stack.
  $CC10,$01 #REGc=#REGa.
  $CC11,$03 #REGde=#N($0008,$04,$04).
  $CC14,$04 #REGiy=#R$9860.
  $CC18,$03 #REGa=*#REGiy+#N$00.
  $CC1B,$03 Jump to #R$CC26 if #REGa is equal to #REGc.
  $CC1E,$04 Jump to #R$CC26 if #REGa is equal to #N$FF.
  $CC22,$02 #REGiy+=#REGde.
  $CC24,$02 Jump to #R$CC18.

  $CC26,$02 Restore #REGbc and #REGde from the stack.
  $CC28,$01 Return.

c $CC29

c $CC37

c $CC78

c $D008

c $D026

c $D045

c $D04F Adjust Object Table For Sum
@ $D04F label=AdjustObjectTableForSum
  $D04F,$04 #REGix=#R$8B6F.
  $D053,$06 Decrease #REGix by three.
  $D059,$01 Return.

w $D05A
  $D05A,$02 "#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
L $D05A,$02,$05

g $D064 Table: Direction Tokens
@ $D064 label=Table_DirectionTokens
W $D064 "#TOKEN(#PEEK(#PC+$01)*$100+#PEEK(#PC))".
L $D064,$02,$0A

c $D078

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

c $D237

c $D275

c $D29D

c $D2A4

c $D2F2

c $D33C

c $D349

c $D34E

c $D36A

c $D3E8

c $D405

c $D471

c $D495
  $D495,$02 Compare #REGa with #N$FF.
  $D497,$01 Return if #REGa is equal to #N$FF.
  $D498,$03 Call #R$D237.
  $D49B,$02 #REGa=#N$01.
  $D49D,$03 Compare #REGa with *#REGix+#N$00.
  $D4A0,$02 #REGa=#N$FF.
  $D4A2,$01 Return if #REGa is not equal to #N$FF.
  $D4A3,$03 #REGa=*#REGix+#N$0F.
  $D4A6,$01 Return.

c $D4A7
  $D4A7,$04 Stash #REGiy, #REGaf and #REGbc on the stack.
  $D4AB,$02 #REGa=#N$FF.
  $D4AD,$03 Call #R$D4CC.
  $D4B0,$02 Jump to #R$D4C7 if #REGa is equal to #N$FF.
  $D4B2,$01 Stash #REGaf on the stack.
  $D4B3,$03 #REGhl=#R$68E4.
  $D4B6,$03 Call #R$A59F.
  $D4B9,$01 Restore #REGbc from the stack.
  $D4BA,$01 #REGc=#REGb.
  $D4BB,$02 #REGa=#N$FF.
  $D4BD,$04 #REGiy=#R$A017.
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

c $DC6C
