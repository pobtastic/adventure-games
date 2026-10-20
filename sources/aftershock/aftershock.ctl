; Copyright Interceptor Software UK 1986, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @start
@ $4000 org=$4000
> $4000 @rom
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @expand=#DEF1(#MESSAGE(addr) #STR${addr:04X},$08($b==$FF))
> $4000 @expand=#DEF(#ROOM(id) #IF($01<$id<=$59)(#HTML(&#10;)#SIM(start=$A305,stop=$A313,ix=$AE7D,de=$id)#HTML(&#10;)#R(#OFFSET({sim[HL]}))(#MAP({sim[HL]})(#HTML(&#10;)UNKNOWN,0040:North Street,0041:Columbus Avenue,0042:Darwin Street,0043:The Lion Enclosure,0044:The Monkey Cage,0045:The Elephant House,0046:Livingstone Square,0047:Legion Parade,0048:Parkview Road,0049:The Zoo Entrance,0050:The Park Area,0051:The Insect House,0052:Jessop Street,0053:Clarence Square,0054:The Reptile House,0055:The Circus Tent,0056:The Bear Cage,0057:The Roof Of An Apartment Block,0058:The Parapet,0059:The Roof Of The Old Building,0060:Cook Street,0061:Cook Street Underground Station,0062:Byron Square Underground Station,0063:Byron Square,0064:Virgil Close,0065:A Corridor,0066:The Kitchen,0067:Scott Street,0068:The Storm Drain,0069:Shakespeare Avenue,0070:Burns Road,0071:An Apartment Block,0072:The West Wing,0073:The Western End Of The Dining Room,0074:The Eastern End Of The Dining Room,0075:The East Wing,0076:Royal Street,0077:Manor Drive,0078:Waste Ground,0079:The Filling Station,0080:East Street,0081:Castle Road,0082:The Desert Road,0083:The Gatehouse,0084:The Hallway Of A Derelict House,0085:An Overgrown Garden,0086:Kings Close,0087:South Way,0088:The Western Office,0089:A Corridor (Offices To West),0090:The Reception Area,0091:A Corridor (Offices To East),0092:The Eastern Office,0093:South Way,0094:The Control Room,0095:The Maintenance Area,0096:Cactus Drive,0097:The Reactor Service Corridor,0098:The Reactor Room,0099:A Corridor (Maintenance Access),0100:The Storage Yard,0101:Congratulations!!!,0102:The Office Roof,0103:The Top Of The Lift Shaft,0104:The Stairs,0105:The Stairwell,0106:On Top Of A Lift,0107:Your Office,0108:The Main Office,0109:The Lift,0110:The Bottom Of The Lift Shaft,0111:An Alley,0112:The Washroom,0113:The Utility Room,0114:The Basement,0115:The Service Tunnel,0116:The Service Tunnel (Eastern End),0117:The Sewer,0118:Inside the Kiosk)),#HTML(&#10;)N/A))
> $4000 @expand=#DEF(#ITEM(id) #MAP($id)(#HTML(&#10;)N/A,001:"A diamond",007:"Some fruit",008:"Some meat",110:"Fire protects the western exit"))
> $4000 @expand=#DEF(#OBJECT(id) #MAP($id)(#HTML(&#10;)N/A,00:Plate,01:Diamond,02:Bodies,03:Tanker,04:Oil,05:Lions,06:Cage,07:Monkey,08:Fruit,09:Meat,10:Shop,11:Television,12:Gate,13:Bin,14:Bottle,15:Insects,16:Car,17:Stick,18:Statue,19:Alligator,20:Tent,21:Bear,22:Elephant,23:Ramp,24:Parapet,25:Roof,26:Stairs,27:Nail,28:Cap,29:Trumpet,30:Adverts,31:Tunnel,32:Water,33:Graffiti,34:Ticket,35:Ladder,36:Doll,37:Garden,38:Soldiers,39:Looters,40:Rubble,41:Kiosk,42:Petrol,43:Desert,44:Tumbleweed,45:Horse,46:Swing,47:Beam,48:Door,49:Trees,50:Weeds,51:Wall,52:Chasm,53:Key,54:Desk,55:Chair,56:Display,57:Siren,58:Button,59:Valve,60:Wires,61:Pipe,62:Screwdriver,63:Fire,64:Lift,65:Pen,66:Radio,67:Panel,68:Ceiling,69:Basin,70:Mirror,71:Workbench,72:Pickaxe,73:Torch,74:Tissues,75:Isolator,76:Cables,77:Handle,78:Shaft,79:Sluice,80:Sweets,81:Ambulance,82:Truck,83:Geese,84:Buns,85:Woman))
> $4000 @expand=#DEF(#TOKEN(id) #MAP($id)(#HTML(&#10;)UNKNOWN,000:"H#RAW(,)HELP",001:"I#RAW(,)INVE",002:"L#RAW(,)LOOK",003:"Q#RAW(,)QUIT",004:"N#RAW(,)NORT",005:"S#RAW(,)SOUT",006:"E#RAW(,)EAST",007:"W#RAW(,)WEST",008:"U#RAW(,)UP",009:"D#RAW(,)DOWN",010:"LOAD",011:"SAVE",012:"EXAM#RAW(,)SEAR",013:"SCOR",014:"TAKE",015:"DROP#RAW(,)LAY",016:"GIVE",017:"THRO",018:"FILL",019:"EMPT#RAW(,)DRAI",020:"HIT#RAW(,)STRI#RAW(,)JAB#RAW(,)POKE",021:"JUMP#RAW(,)LEAP",022:"CLIM",023:"SLID",024:"READ",025:"DRIN",026:"KILL#RAW(,)ATTA",027:"ENTE",028:"SUPP#RAW(,)BRAC",029:"OPEN",030:"CLOS#RAW(,)SHUT",031:"STAR",032:"PRES",033:"FIT#RAW(,)CONN",034:"DRIV",035:"REMO",036:"SWIT",037:"WEAR",038:"EAT",039:"FUCK",040:"UNLO",041:"LUBR",042:"xxxx",043:"xxxx",044:"PLAT#RAW(,)NAME",045:"DIAM",046:"BODY#RAW(,)BODI",047:"TANK",048:"OIL",049:"LION#RAW(,)CUBS",050:"CAGE",051:"MONK#RAW(,)CHIM",052:"FRUI",053:"MEAT",054:"SHOP#RAW(,)STOR",055:"TELE#RAW(,)TV",056:"GATE",057:"BIN",058:"BOTT",059:"INSE",060:"CAR#RAW(,)CARS#RAW(,)ENGI",061:"STIC",062:"STAT",063:"REPT#RAW(,)ALLI",064:"TENT",065:"BEAR",066:"ELEP",067:"RAMP",068:"PARA#RAW(,)COLL",069:"ROOF",070:"STAI",071:"NAIL",072:"CAP",073:"TRUM",074:"ADVE",075:"TUNN",076:"WATE",077:"GRAF",078:"TICK",079:"LADD",080:"DOLL",081:"GARD",082:"SOLD",083:"LOOT",084:"RUBB",085:"KIOS",086:"PETR#RAW(,)FUME",087:"DESE",088:"TUMB",089:"HORS",090:"SWIN",091:"BEAM",092:"DOOR",093:"TREE",094:"WEED",095:"WALL",096:"CHAS",097:"KEY",098:"DESK",099:"CHAI",100:"DISP",101:"SIRE",102:"BUTT",103:"VALV",104:"WIRE",105:"PIPE",106:"SCRE",107:"FIRE",108:"LIFT",109:"PEN",110:"RADI",111:"PANE",112:"CEIL",113:"BASI",114:"MIRR",115:"WORK#RAW(,)BENC",116:"PICK",117:"TORC",118:"TISS",119:"ISOL",120:"CABL",121:"HAND",122:"SHAF",123:"SLUI#RAW(,)MECH",124:"SWEE",125:"AMBU",126:"TRUC",127:"GEES",128:"BUN#RAW(,)BUNS",129:"WOMA",130:"xxxx",131:"xxxx",132:"xxxx",133:"WITH#RAW(,)USIN",134:"BRAS",135:"TO#RAW(,)AT#RAW(,)ONTO#RAW(,)ON",136:"LITT",137:"WOOD",138:"CIRC",139:"BROW",140:"IRON",141:"ACRO#RAW(,)OVER",142:"RUST",143:"RAG",144:"IN#RAW(,)INTO",145:"OUT",146:"OF",147:"NEAR#RAW(,)BY",148:"RED",149:"BLUE",150:"OFF",151:"FROM",253:Separator,254:Terminator))
> $4000 @expand=#DEF(#OFFSET(id) #LET(addr=$CA2B+$id*$02)#LET(offset=#PEEK({addr})+#PEEK({addr}+$01)*$100)#EVAL($C8E9+{offset}))
> $4000 @expand=#IF({asm})(#DEF(#DECODE(value)))
> $4000 @expand=#IF({asm})(#DEF(#DECODESTR(addr)))
> $4000 @expand=#IF({asm})(#DEF(#JEWELS(addr)(link=The Jewels Of Babylon){link}))
> $4000 @expand=#IF({asm})(#DEF(#WARLORD(addr)(link=Warlord){link}))
> $4000 @expand=#IF({asm})(#DEF(#COLOUR(id)))
> $4000 @expand=#DEF1(#SKOOLKID(addr)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/#EVAL({addr},16,4).html">){name}#HTML(</a>))
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE
. { =h After Shock Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

g $61A8 Table: Room Image Offsets
@ $61A8 label=Table_RoomImageOffsets
D $61A8 Word offsets from #R$61A8 to the room images. #R$BBD5 points at this
. table. Entry #N$00 is unused, and entries #N$01 to #N$0A select the ten
. pictures #FOR($01,$0A)||n|#R($61A8+#PEEK($61A8+n*$02)+#PEEK($61A8+n*$02+$01)*$100)|, | and ||.
W $61A8,$02 #R($61A8+#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $61A8,$02,$0B

b $61BE Graphics: Your Office
@ $61BE label=Image_YourOffice
D $61BE #SIM(start=$9E0B,stop=$9E18) #PUSHS
. #UDGTABLE
. { =h Your Office }
. { #SIM(start=$9F67,stop=$9F7F,a=$01)#SCR$02{$00,$00,$200,$100}(your-office) }
. UDGTABLE#
. #POPS
D $61BE Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $61BE,$0200 Mask data.

b $63BE Graphics: Your Office (Pixels)
@ $63BE label=Image_YourOffice_Pixels
D $63BE Pixel data used by #R$9F28.
  $63BE,$02E2 Pixel data.

b $66A0 Graphics: Your Office (Attributes)
@ $66A0 label=Image_YourOffice_Attributes
D $66A0 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $66A0,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $66A0,$02,$73

b $6786 Graphics: The Sewer
@ $6786 label=Image_TheSewer
D $6786 #PUSHS
. #UDGTABLE
. { =h Your Sewer }
. { #SIM(start=$9F67,stop=$9F7F,a=$02)#SCR$02{$00,$00,$200,$100}(the-sewer) }
. UDGTABLE#
. #POPS
D $6786 Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $6786,$0200 Mask data.

b $6986 Graphics: The Sewer (Pixels)
@ $6986 label=Image_TheSewer_Pixels
D $6986 Pixel data used by #R$9F28.
  $6986,$0278 Pixel data.

b $6BFE Graphics: The Sewer (Attributes)
@ $6BFE label=Image_TheSewer_Attributes
D $6BFE #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop). The first pair here uses that
. zero count.)
B $6BFE,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $6BFE,$02,$1A

b $6C32 Graphics: Rubble
@ $6C32 label=Image_Rubble
D $6C32 #PUSHS
. #UDGTABLE
. { =h Rubble }
. { #SIM(start=$9F67,stop=$9F7F,a=$03)#SCR$02{$00,$00,$200,$100}(rubble) }
. UDGTABLE#
. #POPS
D $6C32 Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $6C32,$0200 Mask data.

b $6E32 Graphics: Rubble (Pixels)
@ $6E32 label=Image_Rubble_Pixels
D $6E32 Pixel data used by #R$9F28.
  $6E32,$035D Pixel data.

b $718F Graphics: Rubble (Attributes)
@ $718F label=Image_Rubble_Attributes
D $718F #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $718F,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $718F,$02,$78

b $727F Graphics: Alleyway
@ $727F label=Image_Alleyway
D $727F #PUSHS
. #UDGTABLE
. { =h Alleyway }
. { #SIM(start=$9F67,stop=$9F7F,a=$04)#SCR$02{$00,$00,$200,$100}(alleyway) }
. UDGTABLE#
. #POPS
D $727F Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $727F,$0200 Mask data.

b $747F Graphics: Alleyway (Pixels)
@ $747F label=Image_Alleyway_Pixels
D $747F Pixel data used by #R$9F28.
  $747F,$02D8 Pixel data.

b $7757 Graphics: Alleyway (Attributes)
@ $7757 label=Image_Alleyway_Attributes
D $7757 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $7757,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $7757,$02,$74

b $783F Graphics: Control Room
@ $783F label=Image_ControlRoom
D $783F #PUSHS
. #UDGTABLE
. { =h Control Room }
. { #SIM(start=$9F67,stop=$9F7F,a=$05)#SCR$02{$00,$00,$200,$100}(control-room) }
. UDGTABLE#
. #POPS
D $783F Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $783F,$0200 Mask data.

b $7A3F Graphics: Control Room (Pixels)
@ $7A3F label=Image_ControlRoom_Pixels
D $7A3F Pixel data used by #R$9F28.
  $7A3F,$04A1 Pixel data.

b $7EE0 Graphics: Control Room (Attributes)
@ $7EE0 label=Image_ControlRoom_Attributes
D $7EE0 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $7EE0,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $7EE0,$02,$62

b $7FA4 Graphics: Wreckage
@ $7FA4 label=Image_Wreckage
D $7FA4 #PUSHS
. #UDGTABLE
. { =h Wreckage }
. { #SIM(start=$9F67,stop=$9F7F,a=$06)#SCR$02{$00,$00,$200,$100}(wreckage) }
. UDGTABLE#
. #POPS
D $7FA4 Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $7FA4,$0200 Mask data.

b $81A4 Graphics: Wreckage (Pixels)
@ $81A4 label=Image_Wreckage_Pixels
D $81A4 Pixel data used by #R$9F28.
  $81A4,$068C Pixel data.

b $8830 Graphics: Wreckage (Attributes)
@ $8830 label=Image_Wreckage_Attributes
D $8830 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $8830,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $8830,$02,$8F

b $894E Graphics: Desert
@ $894E label=Image_Desert
D $894E #PUSHS
. #UDGTABLE
. { =h Desert }
. { #SIM(start=$9F67,stop=$9F7F,a=$07)#SCR$02{$00,$00,$200,$100}(desert) }
. UDGTABLE#
. #POPS
D $894E Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $894E,$0200 Mask data.

b $8B4E Graphics: Desert (Pixels)
@ $8B4E label=Image_Desert_Pixels
D $8B4E Pixel data used by #R$9F28.
  $8B4E,$00D8 Pixel data.

b $8C26 Graphics: Desert (Attributes)
@ $8C26 label=Image_Desert_Attributes
D $8C26 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop). The first pair here uses that
. zero count.)
B $8C26,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $8C26,$02,$2A

b $8C7A Graphics: Home
@ $8C7A label=Image_Home
D $8C7A #PUSHS
. #UDGTABLE
. { =h Home }
. { #SIM(start=$9F67,stop=$9F7F,a=$08)#SCR$02{$00,$00,$200,$100}(home) }
. UDGTABLE#
. #POPS
D $8C7A Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $8C7A,$0200 Mask data.

b $8E7A Graphics: Home (Pixels)
@ $8E7A label=Image_Home_Pixels
D $8E7A Pixel data used by #R$9F28.
  $8E7A,$03AD Pixel data.

b $9227 Graphics: Home (Attributes)
@ $9227 label=Image_Home_Attributes
D $9227 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $9227,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $9227,$02,$8B

b $933D Graphics: Museum
@ $933D label=Image_Museum
D $933D #PUSHS
. #UDGTABLE
. { =h Museum }
. { #SIM(start=$9F67,stop=$9F7F,a=$09)#SCR$02{$00,$00,$200,$100}(museum) }
. UDGTABLE#
. #POPS
D $933D Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $933D,$0200 Mask data.

b $953D Graphics: Museum (Pixels)
@ $953D label=Image_Museum_Pixels
D $953D Pixel data used by #R$9F28.
  $953D,$0289 Pixel data.

b $97C6 Graphics: Museum (Attributes)
@ $97C6 label=Image_Museum_Attributes
D $97C6 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $97C6,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $97C6,$02,$79

b $98B8 Graphics: Stadium
@ $98B8 label=Image_Stadium
D $98B8 #PUSHS
. #UDGTABLE
. { =h Stadium }
. { #SIM(start=$9F67,stop=$9F7F,a=$0A)#SCR$02{$00,$00,$200,$100}(stadium) }
. UDGTABLE#
. #POPS
D $98B8 Mask data used by #R$9F28. Each bit stands for one screen byte (#N$08
. pixels). When a bit is clear, the routine skips that screen byte so those
. #N$08 pixels stay blank.
  $98B8,$0200 Mask data.

b $9AB8 Graphics: Stadium (Pixels)
@ $9AB8 label=Image_Stadium_Pixels
D $9AB8 Pixel data used by #R$9F28.
  $9AB8,$028E Pixel data.

b $9D46 Graphics: Stadium (Attributes)
@ $9D46 label=Image_Stadium_Attributes
D $9D46 #HTML(Attribute pairs expanded by #R$9F28. A count of #N$00 means
. #N$0100 cells (the #R$9F5D <code>DJNZ</code> loop).)
B $9D46,$02 Attribute #N(#PEEK(#PC)) (#COLOUR(#PEEK(#PC))) for #IF(#PEEK(#PC+$01))(#N(#PEEK(#PC+$01)),#N$0100) cells.
L $9D46,$02,$43

c $9DCC Game Entry Point Alias
  $9DCC,$02 Jump to #R$9DD7.

g $9DCE Table: Delimiters
@ $9DCE label=Table_Delimiters_Count
D $9DCE A table of delimiter characters used for matching user input in...
B $9DCE,$01 Number of delimiters in the table: #PEEK(#PC).
@ $9DCF label=Table_Delimiters
T $9DCF,$01 "SPACE".
T $9DD0,$01 "COMMA".
T $9DD1,$01 "DOUBLE QUOTE".

g $9DD2 Table: Vocabulary For "THE"
@ $9DD2 label=Table_Vocabulary_The
D $9DD2 "Vocabulary Table" used for matching and removing "THE" from user
. input.
T $9DD2,$04 "#MESSAGE$9DD2".
B $9DD6,$01 Terminator.

c $9DD7 Game Entry Point
@ $9DD7 label=GameEntryPoint
E $9DD7 View the equivalent code in;
. #LIST
. { #JEWELS$BA50 }
. { #WARLORD$A531 }
. LIST#
  $9DD7,$05 Set CAPS LOCK on, using bit 3 of *#SKOOLKID$5C6A(FLAGS2).
  $9DDC,$05 Set keyboard mode "L", using bit 3 of *#SKOOLKID$5C3B(FLAGS).
  $9DE1,$04 Write #N$00 to *#SKOOLKID$5C41(MODE).
  $9DE5,$05 Set the current output channel to the main screen using #SKOOLKID$1601(CHAN_OPEN) with stream #N$02.
  $9DEA,$05 Reset printing to the lower screen, using bit 0 of *#SKOOLKID$5C3C(TV_FLAG).
  $9DEF,$04 Write #N$00 to *#SKOOLKID$5C6B(DF_SZ).
  $9DF3,$05 Write #N$FF to *#SKOOLKID$5C8C(SCR_CT).
  $9DF8,$03 Jump to #R$ADA1.

c $9DFB Get User Input
@ $9DFB label=GetUserInput
E $9DFB View the equivalent code in;
. #LIST
. { #JEWELS$BA5D }
. { #WARLORD$A53E }
. LIST#
R $9DFB O:A The keypress value
  $9DFB,$03 #REGa=*#SKOOLKID$5C3B(FLAGS).
  $9DFE,$04 Jump back to #R$9DFB until a new key is pressed.
  $9E02,$02 Reset the "new key has been pressed" flag in #REGa.
  $9E04,$03 Write it back to *#SKOOLKID$5C3B(FLAGS).
N $9E07 Fetch the keypress.
  $9E07,$03 #REGa=*#SKOOLKID$5C08(LAST_K).
  $9E0A,$01 Return.

c $9E0B Clear Lines
@ $9E0B label=ClearLines
E $9E0B View the equivalent code in;
. #LIST
. { #JEWELS$BA74 }
. { #WARLORD$A555 }
. LIST#
  $9E0B,$04 Stash #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $9E0F,$05 Clear #N$18 lines from the bottom of the screen using #SKOOLKID$0E44(CL_LINE).
  $9E14,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $9E18,$01 Return.

c $9E19 Set Default Screen Position
@ $9E19 label=SetDefaultScreenPosition
E $9E19 View the equivalent code in;
. #LIST
. { #JEWELS$BA7F }
. { #WARLORD$A560 }
. LIST#
  $9E19,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $9E1C,$03 #REGbc=#N($0021,$04,$04).
  $9E1F,$03 Call #SKOOLKID$0DD9(CL_SET).
  $9E22,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $9E25,$01 Return.

c $9E26 Print Character
@ $9E26 label=PrintCharacter
E $9E26 View the equivalent code in;
. #LIST
. { #JEWELS$BAC3 }
. { #WARLORD$A5A4 }
. LIST#
R $A5A4 A The character to print
  $9E26,$01 Stash the character to print on the stack.
  $9E27,$05 Write #N$FF to *#SKOOLKID$5C8C(SCR_CT).
  $9E2C,$01 Restore the character to print from the stack.
  $9E2D,$01 Print to the screen using #SKOOLKID$0010(PRINT_A_1).
  $9E2E,$01 Return.

c $9E2F Pause Loop
@ $9E2F label=Pause_Loop
D $9E2F #HTML(Pauses a given number of <code>HALT</code> loops.)
E $9E2F View the equivalent code in;
. #LIST
. { #JEWELS$BB51 }
. { #WARLORD$A5C2 }
. LIST#
R $9E2F B #HTML(Number of <code>HALT</code> commands to use)
  $9E2F,$01 #HTML(Wait for the next interrupt (<code>HALT</code>).)
  $9E30,$02 Decrease the pause counter and loop back to #R$9E2F until the wait is over.
  $9E32,$01 Return.

t $9E33 Messaging: "Press REC & PLAY On Tape... Then Press Any Key"
@ $9E33 label=Messaging_Saving
  $9E33,$2F "#MESSAGE$9E33".
B $9E62,$01 Terminator.

t $9E63 Messaging: "Saving Complete...Stop Tape"
@ $9E63 label=Messaging_StopTapeSavingComplete
  $9E63,$1C "#MESSAGE$9E63".
B $9E7F,$01 Terminator.

c $9E80 Save Game
@ $9E80 label=SaveGame
  $9E80,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
  $9E85,$03 #REGa=*#R$BBD1.
N $9E88 Skip packing the save when there are no state bytes.
  $9E88,$03 Jump to #R$9EA4 if there are no saved state bytes.
  $9E8B,$01 #REGb=#REGa.
  $9E8C,$04 #REGix=#R$BAF9.
  $9E90,$03 #REGde=#R$A0D4.
  $9E93,$02 Jump to #R$9E9A.
  $9E95,$04 Move #REGix on to the next saved-state address.
  $9E99,$01 Move #REGde on to the next packed state byte.
  $9E9A,$03 #REGl=*#REGix+#N$00.
  $9E9D,$03 #REGh=*#REGix+#N$01.
  $9EA0,$01 #REGa=*#REGhl.
  $9EA1,$01 Store that state byte in the packed save buffer.
  $9EA2,$02 Decrease the pack counter and loop back to #R$9E95 until every state byte is packed.
N $9EA4 Print "#MESSAGE$9E33".
  $9EA4,$03 #REGhl=#R$9E33.
  $9EA7,$03 Call #R$A275.
  $9EAA,$03 Call #R$9DFB.
  $9EAD,$04 #REGix=#R$9F88.
  $9EB1,$03 #REGde=#N$0181.
  $9EB4,$02 #REGa=#N$FF.
  $9EB6,$03 Call #SKOOLKID$04C2(SA_BYTES).
  $9EB9,$03 #REGhl=#R$9E63.
  $9EBC,$03 Call #R$A275.
  $9EBF,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $9EC4,$01 Return.

t $9EC5 Messaging: "LOADING...Start Tape"
@ $9EC5 label=Messaging_LoadingPressPlay
  $9EC5,$15 "#MESSAGE$9EC5".
B $9EDA,$01 Terminator.

c $9EDB Load From Tape
@ $9EDB label=LoadTape
  $9EDB,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
N $9EE0 Print "#MESSAGE$9EC5".
  $9EE0,$03 #REGhl=#R$9EC5.
  $9EE3,$03 Call #R$A275.
  $9EE6,$04 Load the starting address into #REGix at #R$9F88.
  $9EEA,$03 Set the block length in #REGde to #N$0181 bytes.
  $9EED,$02 Set #REGa to #N$FF which indicates this is a data block.
  $9EEF,$01 Set the carry flag to indicate this is loading.
  $9EF0,$03 Call #SKOOLKID$0556(LD_BYTES).
  $9EF3,$02 Jump to #R$9EFD if the block loaded without error (carry flag set).
N $9EF5 Print "#DECODESTR$CD8F".
  $9EF5,$03 #REGhl=#R(#OFFSET($0013)).
N $9EF8 The tape load failed.
  $9EF8,$05 Print "#DECODESTR$CD8F" and leave the game state unchanged.
N $9EFD There is nothing to unpack when no state bytes were saved.
  $9EFD,$06 Jump to #R$9F21 if there are no saved state bytes.
N $9F03 Write the packed bytes at #R$A0D4 back through the addresses in
. #R$BAF9.
  $9F03,$08 The addresses are listed in #R$BAF9 and the copies sit at #R$A0D4.
  $9F0B,$02 Start with the first address.
@ $9F0D label=RestoreState_Loop
N $9F0D The next saved address.
  $9F0D,$05 Advance to the next saved address.
  $9F12,$08 Write that byte back into the game.
  $9F1A,$02 Repeat until every saved byte is restored.
N $9F1C Describe the room the save returned to.
  $9F1C,$02 Show the room as the player last saw it.
  $9F1E,$03 Call #R$A33A.
@ $9F21 label=LoadTape_Return
  $9F21,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $9F26,$01 Return.

c $9F27 Just Return
@ $9F27 label=JustReturn
  $9F27,$01 Return.

c $9F28 Print Room Image
@ $9F28 label=Print_RoomImage
R $9F28 IX Pointer to room image data
  $9F28,$03 Copy the room-image pointer from #REGix into #REGhl.
N $9F2B Step over the #N$0200 mask bytes and aim at the display file.
  $9F2B,$07 The pixel data follows the mask.
N $9F32 Expand each mask byte. Each bit stands for one screen byte (#N$08
. pixels).
  $9F32,$03 #N$0200 mask bytes cover the screen, eight screen bytes at a time.
@ $9F35 label=PixelControl_Loop
  $9F35,$06 Take the next mask byte.
@ $9F3B label=PixelBit_Loop
N $9F3B A set bit copies the next pixel byte onto the screen. When the bit is
. clear, #REGde still advances but nothing is written, so those #N$08 pixels
. stay blank.
  $9F3B,$04 Jump to #R$9F42 if the mask bit is clear (skip that screen byte).
  $9F3F,$03 Copy the next pixel byte onto the screen.
  $9F42,$01 Move along the screen.
  $9F43,$04 This mask byte's eight screen bytes are done.
  $9F47,$02 Restore the mask-byte counter from the stack and decrease it.
  $9F49,$04 Another mask byte remains.
N $9F4D The bytes that follow are the attribute stream.
  $9F4D,$03 Copy the attribute-stream pointer from #REGhl into #REGix.
N $9F50 Paint attributes from #N$5800 until the display ends at #N$5A00.
  $9F50,$03 Start at the attribute file.
@ $9F53 label=Attribute_Loop
  $9F53,$0A The colour, and how many cells it covers (#N$00 means #N$0100).
  $9F5D,$04 #HTML(Paint that many cells (#REGb=#N$00 runs the <code>DJNZ</code> loop #N$0100 times).)
  $9F61,$05 Continue until the attribute file is full.
N $9F66 The picture is on screen.
  $9F66,$01 Return.

c $9F67 Handler: Room Images
@ $9F67 label=Handler_Images
  $9F67,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
  $9F6C,$01 #REGe=#REGa.
  $9F6D,$04 #REGix=*#R$BBD5.
  $9F71,$03 Call #R$A305.
  $9F74,$05 #REGhl+=*#R$BBD5.
  $9F79,$03 Copy the room-image address from #REGhl into #REGix.
  $9F7C,$03 Call #R$9F28.
  $9F7F,$03 Call #R$9DFB.
  $9F82,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $9F87,$01 Return.

g $9F88 Table: Item Locations
@ $9F88 label=Table_ItemLocations
D $9F88 A table where the index is the item ID, and the value is the room it
. resides in (#N$00 for "currently inactive").
D $9F88 When the item is in the players inventory, the room ID changes to
. #N$01.
E $9F88 View the equivalent code in #JEWELS$BBF0.
B $9F88,$01 Item #N(#PC-$9F88) #ITEM(#PC-$9F88) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $9F88,$01,$88

u $A010 Unused

g $A088 Flags: Game States
@ $A088 label=Flags_GameStates
D $A088 Bit flags tested and changed by #R$A1C8, #R$A1D2 and #R$A1DD. The bit
. index selects both the byte and the bit inside it.
B $A088,$01 Flag byte #N(#PC-$A088).
L $A088,$01,$20

g $A0A8 Flags: Already Seen Room Images
@ $A0A8 label=Flags_SeenRoomImages
D $A0A8 One bit for each entry in #R$BB93. #R$A33A sets the bit after the
. picture has been shown so the same room does not draw it again.
B $A0A8,$01 Seen-image bits #N((#PC-$A0A8)*$08) to #N((#PC-$A0A8)*$08+$07).
L $A0A8,$01,$03

u $A0AB Unused

g $A0C8 Flags: Turn-Based Event States
@ $A0C8 label=Flags_TurnEvents
D $A0C8 One bit per turn-based event. #R$A280 counts a bit down while it is
. set, and the script actions #R$AB4A and #R$AB5E change the bits.
B $A0C8,$01

g $A0C9 Turn-Based Event Counters
@ $A0C9 label=TurnEventCounters
D $A0C9 One counter byte for each bit in #R$A0C8. #R$A280 decreases the
. counter for every active event, and #R$AB37 stores a new count.
B $A0C9,$01 Counter for event bit #N(#PC-$A0C9).
L $A0C9,$01,$08

g $A0D1 Flags: Event States
@ $A0D1 label=Flags_EventStates
D $A0D1 Bits that #R$ACBD honours after a move. #R$AB0E sets a bit and #R$AB22
. clears one.
B $A0D1,$01

g $A0D2 Number Of Items In The Players Inventory
@ $A0D2 label=Count_InventoryItems
D $A0D2 The number of items the player is currently holding.
B $A0D2,$01

g $A0D3 Carrying Limit
@ $A0D3 label=CarryingLimit
D $A0D3 The most items the player may carry. #R$AE2C compares it with #R$A0D2.
. The game starts it from #R$BBD7, and #R$ABE8 can replace it.
B $A0D3,$01 #N(#PEEK(#PC)).

g $A0D4 Saved State Bytes
@ $A0D4 label=SavedStateBytes
D $A0D4 The #N$06 bytes copied to and from the addresses in #R$BAF9 while
. saving and loading. The count is #R$BBD1.
B $A0D4,$01 Saved state byte #N(#PC-$A0D4).
L $A0D4,$01,$06

u $A0DA Unused

g $A106 Current Room ID
@ $A106 label=CurrentRoom
D $A106 The room the player starts the game in is room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
B $A106,$01 Current room ID.

g $A107 Score
@ $A107 label=Score
W $A107,$02

g $A109 Command Buffer
@ $A109 label=CommandBuffer
B $A109,$32

g $A13B User Input: Word Tokens
@ $A13B label=UserInput_Token_1
@ $A13C label=UserInput_Token_2
B $A13B,$01
L $A13B,$01,$0A

g $A145 Four Letter Buffer
@ $A145 label=FourLetterBuffer
D $A145 The four characters of the word #R$A4B0 is currently matching. Spare
. letters are spaces.
B $A145,$01
L $A145,$01,$04

g $A149 Table: Directions
@ $A149 label=Table_Directions
D $A149 Pointer to the table containing direction messaging:
. #FOR($08,$0D)||n|#R(#OFFSET(n))|, | and ||.
W $A149,$02 #R(#OFFSET(#PEEK(#PC)+#PEEK(#PC+$01)*$100)) "#DECODESTR($C8E9+#PEEK($CA2B+(#PEEK(#PC)+#PEEK(#PC+$01)*$100)*$02)+#PEEK($CA2B+(#PEEK(#PC)+#PEEK(#PC+$01)*$100)*$02+$01)*$100)".
L $A149,$02,$06

c $A155 Calculate Bit Address
@ $A155 label=CalculateBitAddress
D $A155 Divides the bit index in #REGhl by #N$08.
D $A155 The byte offset is left in #REGhl and the bit number in #REGc.
R $A155 HL Bit index
R $A155 O:HL Byte offset
R $A155 O:C Bit number within the byte
  $A155,$01 Stash #REGaf on the stack.
  $A156,$04,$01,b$02,$01 Keep the bit number within the byte (bits 0-2 of the bit index) in #REGc.
  $A15A,$08 Divide the bit index in #REGhl by eight (three passes, counted in #REGb) to give the offset of the byte holding the flag.
  $A162,$01 Restore #REGaf from the stack.
  $A163,$01 Return.

c $A164 Divide Word By Four
@ $A164 label=DivideWordByFour
D $A164 Divides #REGhl by four. Nothing in the game calls or jumps here and no
. table holds its address, so it looks like leftover code (compare #R$A155 just
. above, which divides a bit index by eight).
R $A164 HL Word to divide
R $A164 O:HL The word divided by four
  $A164,$08 Divide #REGhl by four, dropping the remainder.
  $A16C,$01 Return.

c $A16D Multiply Words
@ $A16D label=MultiplyWords
D $A16D Multiplies the word in #REGhl by the word in #REGde. #R$A41C uses it to multiply the current room number by #N$06 to find that room's record in #R$B8DD.
R $A16D HL Multiplicand
R $A16D DE Multiplier
R $A16D O:HL Product
  $A16D,$01 Stash #REGbc on the stack.
  $A16E,$02 #REGb=#N$10.
  $A170,$01 #REGa=#REGh.
  $A171,$01 #REGc=#REGl.
  $A172,$03 #REGhl=#N($0000,$04,$04).
  $A175,$01 #REGhl+=#REGhl.
N $A176 For each bit of the multiplier, shift it into the carry and add the
. multiplicand when that bit is set.
  $A176,$09 Fold the next multiplier bit into the product.
  $A17F,$01 Restore #REGbc from the stack, leaving the product in #REGhl.
  $A180,$01 Return.

c $A181 Divide Words
@ $A181 label=DivideWords
D $A181 Divides the word in #REGhl by the word in #REGde. Nothing in the game
. calls it.
R $A181 HL Dividend
R $A181 DE Divisor
R $A181 O:HL Quotient
R $A181 O:DE Remainder
N $A181 Nothing in the game divides one word by another.
  $A181,$04 Hold the dividend.
  $A185,$06 The remainder starts at zero, for sixteen bits.
@ $A18B label=DivideWords_NextBit
N $A18B Try the next bit of the dividend.
  $A18B,$05 Bring that bit into the remainder.
  $A190,$04 See whether the divisor fits.
  $A194,$05 The quotient gains a bit, and the next bit follows.
@ $A199 label=DivideWords_Restore
N $A199 The divisor did not fit.
  $A199,$06 Put the remainder back.
  $A19F,$05 Try the next bit.
N $A1A4 Nothing in the game uses this quotient.
  $A1A4,$03 Nothing in the game uses this quotient.
  $A1A7,$02 Restore #REGaf and #REGbc from the stack.
  $A1A9,$01 Return.

c $A1AA Negate Word
@ $A1AA label=NegateWord
D $A1AA Negates the word in #REGhl. Nothing in the game calls it.
R $A1AA HL Word to negate
R $A1AA O:HL The negated word
N $A1AA Negate the word in #REGhl. Nothing in the game calls this.
  $A1AA,$08 Nothing in the game uses this negated word.
  $A1B2,$01 Restore #REGde from the stack.
  $A1B3,$01 Return.

c $A1B4 Build Flag Mask
@ $A1B4 label=BuildFlagMask
D $A1B4 Turns a bit index into the flag address and the bit mask used by
. #R$A1C8, #R$A1D2 and #R$A1DD.
R $A1B4 A Bit index
R $A1B4 HL Flag base address
R $A1B4 O:HL Address of the flag byte
R $A1B4 O:A Bit mask
  $A1B4,$02 Stash #REGde and #REGbc on the stack.
  $A1B6,$01 Switch the flag table base into #REGde so #REGhl can hold the bit index.
  $A1B7,$03 Put the bit index into #REGhl.
  $A1BA,$03 Call #R$A155 to split the bit index into a byte offset (#REGhl) and a bit number (#REGc).
  $A1BD,$01 Point #REGhl at the flag byte holding this bit.
  $A1BE,$01 Use the bit number as the rotate count.
  $A1BF,$01 Count one extra rotate so the mask lands on this bit.
  $A1C0,$01 Start the mask with no bits set.
  $A1C1,$01 Seed a single set bit for the mask.
  $A1C2,$01 Build the mask for this flag bit.
  $A1C3,$02 Keep rotating until the set bit reaches this flag's position.
  $A1C5,$02 Restore #REGbc and #REGde from the stack.
  $A1C7,$01 Return.

c $A1C8 Test Flag
@ $A1C8 label=TestFlag
D $A1C8 Tests one bit of the flags at #R$A088.
R $A1C8 A Bit index
R $A1C8 O:F The zero flag is set when the bit is clear
R $A1C8 O:A The flag byte merged with the bit mask
  $A1C8,$01 Stash #REGhl on the stack.
  $A1C9,$03 Use the game state flags at #R$A088.
  $A1CC,$03 Call #R$A1B4 to find the flag byte and the mask for this flag.
  $A1CF,$01 Test the flag; the zero flag is set when it is clear.
  $A1D0,$01 Restore #REGhl from the stack.
  $A1D1,$01 Return.

c $A1D2 Set Flag
@ $A1D2 label=SetFlag
D $A1D2 Sets one bit of the flags at #R$A088.
R $A1D2 A Bit index
  $A1D2,$01 Stash #REGhl on the stack.
  $A1D3,$03 Use the game state flags at #R$A088.
  $A1D6,$03 Call #R$A1B4 to find the flag byte and the mask for this flag.
  $A1D9,$02 Set this flag in its flag byte.
  $A1DB,$01 Restore #REGhl from the stack.
  $A1DC,$01 Return.

c $A1DD Clear Flag
@ $A1DD label=ClearFlag
D $A1DD Clears one bit of the flags at #R$A088.
R $A1DD A Bit index
  $A1DD,$01 Stash #REGhl on the stack.
  $A1DE,$03 Use the game state flags at #R$A088.
  $A1E1,$03 Call #R$A1B4 to find the flag byte and the mask for this flag.
  $A1E4,$01 Flip the mask so the matching flag bit can be cleared.
  $A1E5,$02 Clear this flag in its flag byte.
  $A1E7,$01 Restore #REGhl from the stack.
  $A1E8,$01 Return.

t $A1E9 Messaging: "> "
@ $A1E9 label=Messaging_Prompt
  $A1E9,$03 "#MESSAGE$A1E9".
  $A1EC,$01 Terminator.

c $A1ED Print Input Prompt
@ $A1ED label=PrintPrompt
N $A1ED Print "#MESSAGE$A1E9".
  $A1ED,$03 #REGhl=#R$A1E9.
  $A1F0,$03 Call #R$A267.
  $A1F3,$01 Return.

c $A1F4 Print Compressed String
@ $A1F4 label=PrintCompressedString
D $A1F4 Prints a compressed text string using a dictionary lookup.
R $A1F4 HL Messaging string ID
  $A1F4,$06 Stash #REGix, #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $A1FA,$01 Double the messaging string ID held in #REGhl.
  $A1FB,$07 Add the result to #R$CA2B.
  $A202,$06 Fetch the address from the string pointer table and store it in
. #REGhl.
  $A208,$04 #REGhl+=#R$C8E9.
  $A20C,$02 Jump to #R$A223.
  $A20E,$04 Jump to #R$A217 if #REGa is less than #N$60.
  $A212,$03 Call #R$A22F.
  $A215,$02 Jump to #R$A222.
  $A217,$02 #REGa+=#N$20.
  $A219,$04 Jump to #R$A21F if #REGa is not equal to #N$7E.
  $A21D,$02 #REGa=#N$0D.
  $A21F,$03 Call #R$9E26.
  $A222,$01 Move #REGhl on to the next compressed character.
  $A223,$01 #REGa=*#REGhl.
  $A224,$04 Jump to #R$A20E if #REGa is not equal to #N$5F.
  $A228,$06 Restore #REGaf, #REGbc, #REGde, #REGhl and #REGix from the stack.
  $A22E,$01 Return.

  $A22F,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $A232,$02 #REGa-=#N$60.
  $A234,$03 Create an offset in #REGhl using #REGa.
  $A237,$01 Double the offset held in #REGhl.
  $A238,$04 #REGhl+=#R$C8EB.
  $A23C,$02 #REGb=#N$02.

  $A23E,$02 Jump to #R$A241.
  $A240,$01 Move #REGhl on to the next dictionary character.
  $A241,$01 #REGa=*#REGhl.
  $A242,$04 Jump to #R$A24B if #REGa is less than #N$60.
  $A246,$03 Call #R$A22F.
  $A249,$02 Jump to #R$A256.
  $A24B,$02 #REGa+=#N$20.
  $A24D,$04 Jump to #R$A253 if #REGa is not equal to #N$7E.
  $A251,$02 #REGa=#N$0D.
  $A253,$03 Call #R$9E26.
  $A256,$02 Decrease the dictionary-character counter and loop back to #R$A240 until both bytes are done.
  $A258,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $A25B,$01 Return.

c $A25C Print Compressed String And A Newline
@ $A25C label=PrintCompressedStringAndNewline
D $A25C Shortcut print routine which prints a newline after it's done.
E $A25C View the equivalent code in;
. #LIST
. { #JEWELS$BAB1 }
. { #WARLORD$A592 }
. LIST#
  $A25C,$01 Stash the character to print on the stack.
  $A25D,$03 Call #R$A1F4.
N $A260 Force a newline to be "printed".
  $A260,$02 Load a "newline" character into #REGa (#N$0D).
  $A262,$03 Call #R$9E26.
  $A265,$01 Restore the character to print from the stack.
  $A266,$01 Return.

c $A267 Print String
@ $A267 label=PrintString
D $A267 Standard printing loop, which prints the fetched character byte and
. loops until the termination byte is reached (#N$FF).
E $A267 View the equivalent code in;
. #LIST
. { #JEWELS$BAA4 }
. { #WARLORD$A585 }
. LIST#
R $A267 HL Pointer to string to be printed
  $A267,$01 Push the character to print on the stack.
  $A268,$02 Jump to #R$A26E.
N $A26A Just keep looping and printing the fetched character until the
. termination byte is reached (#N$FF).
@ $A26A label=PrintString_Loop
  $A26A,$03 Call #R$9E26.
  $A26D,$01 Move the string pointer to the next character.
@ $A26E label=FetchByteToPrint
  $A26E,$01 Load a character from the string pointer into #REGa.
  $A26F,$04 Jump back to #R$A26A until the string termination character (#N$FF)
. has been reached.
  $A273,$01 Restore the character to print from the stack.
  $A274,$01 Return.

c $A275 Print String And A Newline
@ $A275 label=PrintStringAndNewline
D $A275 Shortcut print routine which prints a newline after it's done.
E $A275 View the equivalent code in;
. #LIST
. { #JEWELS$BAB1 }
. { #WARLORD$A592 }
. LIST#
  $A275,$03 Call #R$A267.
  $A278,$01 Stash the character to print on the stack.
N $A279 Force a newline to be "printed".
  $A279,$02 Load a "newline" character into #REGa (#N$0D).
  $A27B,$03 Call #R$9E26.
  $A27E,$01 Restore the character to print from the stack.
  $A27F,$01 Return.

c $A280 Handler: Process Game Events
@ $A280 label=Handler_GameEvents
D $A280 Counts down the turn-based events in #R$A0C8 and, when a counter
. reaches zero, runs the handler from #R$BBB9.
D $A280 Then relocates any scenic event that is not already in the current
. room, picking the new room from the group at #R$B6BF.
N $A280 A turn-based event runs only while its bit in #R$A0C8 is set.
  $A280,$06 Leave the events alone when none are armed.
N $A286 Eight turn-based events share the flag byte.
  $A286,$03 Start with the first turn-based event.
@ $A289 label=TurnEvent_NextBit
N $A289 This event is not running.
  $A289,$04 Skip an event that is not armed.
N $A28D Count down this event. It fires when the counter at #R$A0C9 reaches
. zero.
  $A28D,$0E Leave the event for a later turn when the counter is still
. running.
N $A29B The counter has expired, so run this event's script from #R$BBB9.
  $A29B,$07 The scripts are listed at #R$BBB9.
  $A2A2,$04 This is the event whose counter expired.
  $A2A6,$06 Read that script's address.
  $A2AC,$03 Copy the script address from #REGhl into #REGix.
  $A2AF,$03 Run that script.
  $A2B2,$03 Restore the event counter and event pointer from the stack.
N $A2B5 Test the next turn-based event.
  $A2B5,$02 Every armed event is considered once per turn.
N $A2B7 Scenic events live in #R$B6BA.
  $A2B7,$09 There is nothing to move when no scenic event is active.
  $A2C0,$03 Visit each scenic event in turn.
@ $A2C3 label=ScenicEvent_Next
N $A2C3 Room #N$00 means this scenic item is inactive.
  $A2C3,$01 The next scenic item.
@ $A2C4 label=ScenicEvent_Item
  $A2C4,$02 Its item id.
  $A2C6,$03 Call #R$A62C to read where this item is.
  $A2C9,$01 Restore the event-list pointer from the stack.
  $A2CA,$03 An inactive item is left where it is.
N $A2CD An event that is already in the player's room stays there.
  $A2CD,$07 Skip an event whose room is #R$A106.
N $A2D4 Each scenic event has a room group in #R$B6BF.
  $A2D4,$04 The scenic scan waits while a room is chosen.
  $A2D8,$05 Which event's group this is.
  $A2DD,$04 The room groups are listed at #R$B6BF.
  $A2E1,$03 This event's room group.
N $A2E4 The refresh register picks how far to walk into the room group.
. #N$FF ends the group and the walk wraps.
  $A2E4,$0D Choose a room from this event's group.
@ $A2F1 label=ScenicRoom_Next
N $A2F1 Walk the room group. #N$FF restarts it, and the refresh count chooses
. where to stop. Then move the scenic item there.
  $A2F1,$06 #N$FF restarts the group. Otherwise step to the next room.
  $A2F7,$01 Fetch the destination room into #REGc.
  $A2F8,$01 Restore the scenic-event pointer from the stack.
  $A2F9,$02 Fetch the item ID into #REGb and stash the pointer again.
  $A2FB,$03 Call #R$A663.
  $A2FE,$04 Restore the scenic scan from the stack.
N $A302 Move on to the next scenic event.
  $A302,$02 Every scenic event is considered once.
  $A304,$01 Return.

c $A305 Get Table Entry
@ $A305 label=GetTableEntry
D $A305 Retrieves an address from a table using a given index.
E $A305 View the equivalent code in;
. #LIST
. { #JEWELS$C1F0 }
. { #WARLORD$AB88 }
. LIST#
R $A305 E Index of item
R $A305 IX Base table address
R $A305 O:HL Address from the relevant table entry
R $A305 O:IX Address of the table entry
  $A305,$06 Multiply the given index by #N$02 and store the result in #REGde.
  $A30B,$02 Add #REGde to the base table address.
  $A30D,$06 Fetch the relevant table address and store it in #REGhl.
  $A313,$01 Return.

c $A314 Print Objects
@ $A314 label=PrintObjects
E $A314 View the equivalent code in;
. #LIST
. { #JEWELS$C1FF }
. { #WARLORD$AB97 }
. LIST#
R $A314 A #N$01 for inventory items, or room number for room objects
  $A314,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $A317,$03 #REGhl=#R$9F88.
  $A31A,$04 #REGbc=*#R$BBC7.
@ $A31E label=FindObject_Loop
  $A31E,$02 Search for matching objects.
  $A320,$02 Jump to #R$A336 if no objects were found.
  $A322,$01 Stash the current place in #R$A66C on the stack.
  $A323,$03 Call #R$A6B1.
  $A326,$02 Jump to #R$A32F if the object is invalid.
  $A328,$02 Temporarily stash the object type and object counter on the stack.
  $A32A,$03 Call #R$A25C.
  $A32D,$02 Restore the object counter and object type from the stack.
@ $A32F label=FindObject_Next
  $A32F,$01 Temporarily hold the object type in #REGe.
  $A330,$01 Restore the current place in #R$9F88 from the stack.
  $A331,$02 Test if all objects have been checked...
  $A333,$01 Restore the object type to #REGa.
  $A334,$02 Jump to #R$A31E until all objects in the table have been checked.
@ $A336 label=PrintObjects_Return
  $A336,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $A339,$01 Return.

c $A33A Handler: Display Room Exits
@ $A33A label=Handler_RoomExits
D $A33A Handles displaying the exits available for the current room.
E $A33A View the equivalent code in;
. #LIST
. { #JEWELS$C26A }
. { #WARLORD$AC02 }
. LIST#
  $A33A,$05 Stash #REGix, #REGhl, #REGde and #REGbc on the stack.
  $A33F,$06 Jump to #R$A379 if *#R$BBCD is set to zero.
N $A345 The version of the game being played DOES have graphics, so continue.
  $A345,$03 Fetch *#R$A106 and load it into #REGa.
  $A348,$03 Fetch the address of the table from #R$BB93.
  $A34B,$04 Fetch the count of the number of rooms in the table from *#R$BBCD.
  $A34F,$02 Search to see if the current room ID is in the table.
  $A351,$02 Jump to #R$A379 if the current room ID does not appear in the
. table.
N $A353 The current room does have an image associated with it.
  $A353,$06 Calculate the index of the current room in the table.
  $A359,$01 Clear #REGa so the next instruction tests the picture request in #REGe.
N $A35A A non-zero picture request shows the image even when the player has
. seen it.
  $A35A,$03 Show the picture even when the player has seen this room.
  $A35D,$03 Use the already-seen room image flags at #R$A0A8.
  $A360,$04 Call #R$A1B4 with this room's index to find its seen bit.
  $A364,$01 Keep the mask for this room in #REGc.
  $A365,$01 Test whether this room's picture has already been shown.
  $A366,$02 Jump to #R$A379 if this room's picture has already been shown.
  $A368,$03 Mark this room's picture as shown, so it isn't drawn again on the next visit.
  $A36B,$03 Call #R$9E0B to clear the text lines.
  $A36E,$08 Look up this room's image number in #R$BBA6.
  $A376,$03 Call #R$9F67 to draw the room image.
  $A379,$03 Call #R$9E0B to clear the text lines.
  $A37C,$03 Call #R$9E19.
  $A37F,$03 Call #R$A42F.
  $A382,$03 Call #R$A41C.
  $A385,$02 Store this in #REGde for later.
N $A387 Count the number of exits in the room data.
  $A387,$02 Set an "exits" counter in #REGb of #N$06.
  $A389,$02 Initialise #REGc to #N$00 to count the number of valid exits.
  $A38B,$01 Set #REGa to #N$00 which is used just for the comparison.
@ $A38C label=RoomExitsCount_Loop
  $A38C,$01 Does this room have an exit?
  $A38D,$02 Jump to #R$A390 if this room doesn't have an exit for this position.
  $A38F,$01 Increment the valid exits count by one.
@ $A390 label=RoomExitsCount_Skip
  $A390,$01 Move to the next byte of room data.
  $A391,$02 Decrease the exits counter by one and loop back to #R$A38C until
. all the exits have been checked.
N $A393 Process the exits count result.
  $A393,$03 Jump to #R$A402 if no exits were found
  $A396,$05 Jump to #R$A3BD if more than #N$01 exit was found.
N $A39B Only one exit was found:
N $A39B Print "#DECODESTR$CD3E".
  $A39B,$03 #REGhl=#R(#OFFSET($0007)).
  $A39E,$03 Call #R$A1F4.
  $A3A1,$02 Retrieve the room data pointer and load it into #REGhl.
  $A3A3,$04 Set a pointer in #REGix to #R$A149.
  $A3A7,$01 Set #REGa to #N$00 which is used just for the comparison.
  $A3A8,$02 Jump to #R$A3AF.
N $A3AA Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $A3AA label=RoomCheckForExit_Loop
  $A3AA,$01 Move to the next byte of room data.
  $A3AB,$04 Increment the direction name table pointer by two.
@ $A3AF label=RoomCheckForExit
  $A3AF,$03 Jump to #R$A3AA if the current exit isn't a valid exit.
  $A3B2,$06 Get the direction name from the direction name table.
  $A3B8,$03 Call #R$A1F4 to print the direction name.
  $A3BB,$02 Jump to #R$A3F8.
N $A3BD More than one exit was found:
N $A3BD Print "#DECODESTR$CD33".
@ $A3BD label=RoomMultipleExits
  $A3BD,$03 #REGhl=#R(#OFFSET($0006)).
  $A3C0,$03 Call #R$A25C.
  $A3C3,$02 Retrieve the room data pointer and load it into #REGhl.
  $A3C5,$04 Set a pointer in #REGix to #R$A149.
  $A3C9,$01 Set #REGa to #N$00 which is used just for the comparison.
  $A3CA,$02 Jump to #R$A3D2.
N $A3CC So as not to corrupt the pointer to the room data (as #REGhl is also
. used when printing), it's temporarily held in #REGde.
@ $A3CC label=RoomExits_Initialise
  $A3CC,$01 Switch back the #REGde and #REGhl registers.
@ $A3CD label=RoomCheckForExits_Loop
  $A3CD,$01 Move to the next byte of room data.
  $A3CE,$04 Increment the direction name table pointer by two.
@ $A3D2 label=RoomCheckForExits
  $A3D2,$03 Jump to #R$A3CD if the current exit isn't a valid exit.
  $A3D5,$01 Temporarily store the room data pointer in #REGde.
  $A3D6,$06 Get the direction name from the direction name table.
  $A3DC,$03 Call #R$A1F4 to print the direction name.
  $A3DF,$01 Decrease the valid exits count by one.
  $A3E0,$05 Jump to #R$A3F8 if there are no more exits to process.
  $A3E5,$02 Jump to #R$A3EF if there is only one exit left to process.
N $A3E7 Print a comma character: ",".
  $A3E7,$02 #REGa=#N$2C.
  $A3E9,$03 Call #R$9E26.
  $A3EC,$01 Reset #REGa back to #N$00 for the comparison.
  $A3ED,$02 Jump to #R$A3CC to continue processing.
N $A3EF Print "#DECODESTR$CD2F".
@ $A3EF label=RoomExits_PrintAmpersand
  $A3EF,$03 #REGhl=#R(#OFFSET($0005)).
  $A3F2,$03 Call #R$A1F4.
  $A3F5,$01 #REGa=#N$00.
  $A3F6,$02 Jump to #R$A3CC.
N $A3F8 Print ".".
@ $A3F8 label=RoomExits_PrintFullStop
  $A3F8,$02 #REGa=#N$2E.
  $A3FA,$03 Call #R$9E26.
N $A3FD Print a newline.
  $A3FD,$02 #REGa=#N$0D.
  $A3FF,$03 Call #R$9E26.
N $A402 Are there any objects here?
@ $A402 label=RoomExits_YouCanSee
  $A402,$03 #REGa=*#R$A106.
  $A405,$03 Call #R$A694.
  $A408,$02 Jump to #R$A416 if no objects were found at this location.
N $A40A Print "#DECODESTR$CD26".
  $A40A,$03 #REGhl=#R(#OFFSET($0004)).
  $A40D,$03 Call #R$A25C.
N $A410 Print the objects at this location.
  $A410,$03 #REGa=*#R$A106.
  $A413,$03 Call #R$A314.
@ $A416 label=RoomExits_Return
  $A416,$05 Restore #REGbc, #REGde, #REGhl and #REGix from the stack.
  $A41B,$01 Return.

c $A41C Get Room Pointer
@ $A41C label=GetRoomPointer
E $A41C View the equivalent code in;
. #LIST
. { #JEWELS$C302 }
. { #WARLORD$AC9A }
. LIST#
R $A41C O:HL Pointer to the room data
  $A41C,$01 Stash #REGde on the stack.
  $A41D,$06 Load the *#R$A106 into #REGhl.
  $A423,$03 #REGde=#N($0006,$04,$04).
  $A426,$03 Call #R$A16D.
  $A429,$04 Add the result to the base address #R$B8DD and store the result in
. #REGhl.
  $A42D,$01 Restore #REGde from the stack.
  $A42E,$01 Return.

c $A42F Print Room Description
@ $A42F label=PrintRoomDescription
D $A42F Prints a newline and the compressed description of the current room.
  $A42F,$02 #REGa=#N$0D.
  $A431,$03 Call #R$9E26.
  $A434,$03 #REGa=*#R$A106.
  $A437,$04 #REGix=#R$AE7D.
  $A43B,$01 #REGe=#REGa.
  $A43C,$03 Call #R$A305.
  $A43F,$03 Call #R$A25C.
  $A442,$01 Return.

g $A443 Pointer: Command Word
@ $A443 label=Pointer_CommandWord
D $A443 The address and length of the command-buffer word being tokenised.
W $A443,$02 Address of the current word in #R$A109.
@ $A445 label=CommandWordLength
W $A445,$02 Length of that word.

t $A447 Messaging: "SPACE<BS><BS>SPACE<BS>"
@ $A447 label=Messaging_SpaceBackspaceBackspaceSpaceBackspace
D $A447 Used by the routine at #R$A4B0.
  $A447,$03 "#MESSAGE$A447".
N $A44A Messaging: "SPACE<BS>"
@ $A44A label=Messaging_SpaceBackspace
D $A44A Used by the routine at #R$A4B0?
  $A44A,$02 "#MESSAGE$A44A".
B $A44C,$01 Terminator.

t $A44D Messaging: "_<BS>"
@ $A44D label=Messaging_UnderscoreBackspace
D $A44D Used by the routine at #R$A450.
  $A44D,$02 "#MESSAGE$A44D".
B $A44F,$01 Terminator.

c $A450 Print Cursor
@ $A450 label=Print_Cursor
  $A450,$01 Stash #REGhl on the stack.
N $A451 Print "#MESSAGE$A44D".
  $A451,$03 #REGhl=#R$A44D.
  $A454,$03 Call #R$A267.
  $A457,$01 Restore #REGhl from the stack.
  $A458,$01 Return.

c $A459 Is Character A Delimiter
@ $A459 label=IsDelimiter
R $A459 O:F The zero flag is set if a delimiter is found
  $A459,$02 Stash #REGhl and #REGbc on the stack.
  $A45B,$03 #REGhl=#R$9DCE.
  $A45E,$03 Fetch the delimiter count and store it in #REGbc.
  $A461,$01 Move #REGhl to point to the delimiter table.
  $A462,$02 Search for matching delimiters.
  $A464,$02 Restore #REGbc and #REGhl from the stack.
  $A466,$01 Return.

c $A467 Print User Input To Screen
@ $A467 label=Print_UserInputToScreen
R $A467 A User input keypress
R $A467 HL Pointer to the command buffer
  $A467,$01 Stash the user input keypress on the stack.
  $A468,$04 Jump to #R$A474 if "DELETE" was not pressed.
  $A46C,$01 Stash the pointer to the command buffer on the stack.
N $A46D Print "SPACE<BS>" to delete the letter from the screen.
  $A46D,$03 #REGhl=#R$A44A.
  $A470,$03 Call #R$A267.
  $A473,$01 Restore the pointer to the command buffer from the stack.
@ $A474 label=UserInputToScreen
  $A474,$01 Restore the user input keypress from the stack.
N $A475 Print the user input keypress to the screen.
  $A475,$03 Call #R$9E26.
  $A478,$01 Return.

c $A479 Handler: Match Item
@ $A479 label=Handler_MatchItem
R $A479 O:F The carry flag is set to indicate that an item was found
  $A479,$05 Stash #REGhl, #REGde, #REGbc and #REGix on the stack.
N $A47E Search the vocabulary from the address written into this instruction, which starts as #R$B0ED.
  $A47E,$07 A comma separates synonyms and #N$FF ends the table.
@ $A485 label=MatchItem_NextWord
N $A485 Step to the next synonym. Each comma advances the token number.
  $A485,$0D Skip a comma and keep the token number of the word before it.
@ $A492 label=MatchItem_Word
N $A492 The vocabulary is exhausted.
  $A492,$05 Jump to #R$A4AA if the word is the #N$FF terminator.
N $A497 Compare the four-letter buffer at #R$A145 with this word.
  $A497,$06 Four letters, starting at #R$A145.
@ $A49D label=MatchItem_Letter
  $A49D,$06 This letter does not match, so try the next synonym.
  $A4A3,$05 The next letter of both words.
N $A4A8 The word matched, so return its token with the carry set.
  $A4A8,$02 The token number is the count of commas passed on the way.
@ $A4AA label=MatchItem_Return
N $A4AA Hand back the registers the search borrowed.
  $A4AA,$05 Restore #REGix, #REGbc, #REGde and #REGhl from the stack.
  $A4AF,$01 Return.

c $A4B0 Handler: User Input
@ $A4B0 label=Handler_UserInput
D $A4B0 Handles keyboard input, tokenises commands and validates the
. vocabulary.
E $A4B0 View the equivalent code in;
. #LIST
. { #JEWELS$C00A }
. { #WARLORD$AD32 }
. LIST#
N $A4B0 Reset the screen position to defaults.
  $A4B0,$03 Call #R$A1ED.
  $A4B3,$03 #REGhl=#R$A109.
N $A4B6 Initialise the command buffer.
  $A4B6,$02 Initialise a letter counter in #REGb.
  $A4B8,$02 Jump to #R$A4BC.
N $A4BA Main input loop - process each keypress.
@ $A4BA label=UserInput_Loop
  $A4BA,$01 Move to the next byte of the command buffer.
  $A4BB,$01 Increment the letter counter by one.
@ $A4BC label=UserInput_Next
  $A4BC,$03 Call #R$A450.
  $A4BF,$03 Call #R$9DFB.
  $A4C2,$04 Jump to #R$A4D6 if "DELETE" was not pressed.
N $A4C6 The user pressed "DELETE".
  $A4C6,$04 Jump back to #R$A4BC if there hasn't been any input yet (nothing to
. delete).
N $A4CA There is input which can be deleted, so action a delete!
  $A4CA,$01 Temporarily stash the command buffer pointer in #REGde.
N $A4CB Print "SPACE BACKSPACE BACKSPACE SPACE BACKSPACE" to move the current
. print position on the screen to the previous character, and to delete the
. character present using a space.
  $A4CB,$03 #REGhl=#R$A447.
  $A4CE,$03 Call #R$A267.
N $A4D1 Adjust the command buffer position and letter counter.
  $A4D1,$01 Restore the command buffer pointer from #REGde.
  $A4D2,$01 Decrease the command buffer pointer by one.
  $A4D3,$01 Decrease the letter counter by one.
  $A4D4,$02 Jump to #R$A4BC.
N $A4D6 Check which key the user pressed:
@ $A4D6 label=ValidateUserInput
  $A4D6,$05 Jump to #R$A4E8 if "ENTER" was pressed.
  $A4DB,$04 If the keypress was any other control key (the value being under
. #N$20 ASCII "SPACE"), it's not valid input so jump back to #R$A4BC.
  $A4DF,$04 If the keypress was higher than #N$80, it's also not valid input so
. jump back to #R$A4BC.
N $A4E3 Is the command buffer full?
  $A4E3,$05 Jump to #R$A4BC if the letter counter is #N$31 (so the buffer is
. full).
N $A4E8 Writes the keypress into the command buffer and print it to the screen.
@ $A4E8 label=UserInput_WriteKeypress
  $A4E8,$02 Write the user input key to *#REGhl.
  $A4EA,$03 Call #R$A467.
N $A4ED Did the user press "ENTER"?
  $A4ED,$05 Jump to #R$A4BA if "ENTER" was not pressed.
N $A4F2 The player pressed "ENTER" so begin to process the user input.
N $A4F2 Clear down the user input tokens.
  $A4F2,$03 #REGhl=#R$A13B.
  $A4F5,$02 Set a counter in #REGb for all #N$0A user input tokens.
@ $A4F7 label=EmptyUserInputTokens_Loop
  $A4F7,$02 Write a termination byte (#N$FF) to *#REGhl.
  $A4F9,$01 Move #REGhl on to the next user input token.
  $A4FA,$02 Decrease the user input tokens counter by one and loop back to
. #R$A4F7 until all the tokens have been set to termination bytes (#N$FF).
N $A4FC Set up pointers for the command buffer, the user input tokens and the
. count of the number of user input tokens.
  $A4FC,$03 #REGhl=#R$A109.
  $A4FF,$04 #REGix=#R$A13B.
  $A503,$02 Set a counter in #REGc for the #N$0A user input tokens.
  $A505,$02 Jump to #R$A551.
N $A507 Print "#DECODESTR$CD0B".
  $A507,$03 #REGhl=#R(#OFFSET($0001)).
  $A50A,$03 Call #R$A25C.
  $A50D,$03 Jump to #R$A4B0.
@ $A510 label=TokeniseWord
N $A510 Copy up to four letters of the current word into #R$A145.
  $A510,$03 The command scan waits.
  $A513,$06 The word starts at the address in #R$A443, and lands in #R$A145.
  $A519,$03 Four letters is the most a word contributes.
  $A51C,$07 A shorter word copies only as many letters as #R$A445 holds.
  $A523,$02 Copy those letters into #R$A145.
  $A525,$03 Restore #REGbc, #REGde and #REGhl from the stack.
N $A528 Ignore a leading "THE" from #R$9DD2, then search the main vocabulary
. at #R$B0ED.
  $A528,$07 Point the search at "THE" in #R$9DD2.
  $A52F,$03 Call #R$A479.
  $A532,$06 The next search uses the main vocabulary at #R$B0ED.
  $A538,$01 Restore the command-buffer pointer from the stack.
  $A539,$02 Jump to #R$A551 if "THE" was matched.
N $A53B The word is in the vocabulary.
  $A53B,$05 Jump to #R$A549 if the word matched.
N $A540 The word is not in the vocabulary.
  $A540,$09 Print "#DECODESTR$CD16" and read the command again.
@ $A549 label=StoreTokenAndContinue
N $A549 Store the token and stop after #N$0A tokens.
  $A549,$08 The token buffer at #R$A13B holds the words understood so far.
@ $A551 label=EmptyFourLetterBuffer
N $A551 Clear the four-letter buffer to spaces before the next word.
  $A551,$0C Clear the four-letter buffer to spaces so a short word cannot match the previous one's tail.
  $A55D,$02 Restore #REGbc and #REGhl from the stack.
N $A55F Find the next word. ENTER finishes the command, and #R$A459 marks a
. gap between words.
  $A55F,$03 Start at this character.
@ $A562 label=SkipDelimiter
  $A562,$01 The next character.
  $A563,$05 ENTER finishes the command.
  $A568,$03 Call #R$A459.
  $A56B,$02 Skip the gap and keep looking.
N $A56D Remember where this word starts and how long it is, then tokenise
. it.
  $A56D,$06 Remember where this word starts.
@ $A573 label=MeasureWord
  $A573,$02 Count this letter.
  $A575,$05 ENTER ends the word.
  $A57A,$03 Call #R$A459.
  $A57D,$02 A gap has not been reached yet.
@ $A57F label=MeasureWord_Store
  $A57F,$04 Store the length at #R$A445.
  $A583,$01 The word is ready to tokenise.
N $A584 Tokenise the word that was just measured.
  $A584,$01 Restore the command-scan pointer from the stack.
  $A585,$03 Jump to #R$A510 if another word was found.
N $A588 Nothing was understood.
  $A588,$08 Jump to #R$A507 if no token was stored.
  $A590,$01 Return.

c $A591 Parser: Validate Item
@ $A591 label=Parser_ValidateItem
E $A591 View the equivalent code in;
. #LIST
. { #JEWELS$C32A }
. { #WARLORD$AE36 }
. LIST#
R $A591 BC The position in the user input token of the object
R $A591 O:F The carry flag is set when the item isn't present
  $A591,$01 Adjust the counter for the sum.
  $A592,$05 Calculate the index (*#R$BBC9-#REGc) and store the result in #REGe.
  $A597,$01 Stash #REGde on the stack.
  $A598,$07 Call #R$A305 with #R$B60E.
  $A59F,$01 Restore #REGde from the stack.
  $A5A0,$02 Jump to #R$A5A3.
@ $A5A2 label=ValidateItem_Loop
  $A5A2,$01 Move #REGhl on to the next item ID in the room/ inventory list.
@ $A5A3 label=ValidateItem
  $A5A3,$05 Jump to #R$A5AE if *#REGhl is equal to #N$FF.
  $A5A8,$03 Call #R$A5C6.
  $A5AB,$02 Jump to #R$A5A2 if the item wasn't found.
  $A5AD,$01 Return.
N $A5AE The item being referenced isn't in the room or in the players inventory.
@ $A5AE label=Response_ItemNotHere
N $A5AE Print "#DECODESTR$CD5D".
  $A5AE,$03 #REGhl=#R(#OFFSET($000E)).
  $A5B1,$03 Call #R$A1F4.
N $A5B4 Print the object name.
  $A5B4,$07 Call #R$A305 with #R$AF31.
  $A5BB,$03 Call #R$A1F4.
N $A5BE Print "#DECODESTR$CD66".
  $A5BE,$03 #REGhl=#R(#OFFSET($000F)).
  $A5C1,$03 Call #R$A25C.
  $A5C4,$01 Set the carry flag; the referenced item is not here.
  $A5C5,$01 Return.

c $A5C6 Validate If Item Is Present
@ $A5C6 label=ValidateItemPresent
E $A5C6 View the equivalent code in;
. #LIST
. { #JEWELS$C35F }
. { #WARLORD$AE6B }
. LIST#
R $A5C6 A Object ID
R $A5C6 F Z flag set if the object is available
  $A5C6,$02 Stash #REGhl and #REGde on the stack.
  $A5C8,$03 Store the object ID in #REGde.
  $A5CB,$03 #REGhl=#R$9F88.
  $A5CE,$01 Add the object ID to the object/ event locations table.
  $A5CF,$06 Jump to #R$A5D8 if the object/ event table states that it's located
. in *#R$A106. Note also sets/ unsets the Z flag accordingly.
N $A5D5 Check the players inventory, as an object can still be used if it's being held.
  $A5D5,$03 Lastly, set the Z flag if the item is in the players inventory.
@ $A5D8 label=Handler_Objects_Return
N $A5D8 Housekeeping; restore #REGde and #REGhl to their previous values.
  $A5D8,$02 Restore #REGde and #REGhl from the stack.
  $A5DA,$01 Return.

c $A5DB Match Phrase Tokens
@ $A5DB label=MatchPhraseTokens
D $A5DB Matches phrase patterns with multiple variations against user input
. tokens.
E $A5DB View the equivalent code in;
. #LIST
. { #JEWELS$C37F }
. { #WARLORD$AE80 }
. LIST#
R $A5DB HL A pointer to phrase token data
R $A5DB O:F The Z flag is set if the input matches any pattern
  $A5DB,$01 Switch the phrase token pointer to #REGde.
  $A5DC,$02 Jump to #R$A5DF.
N $A5DE Skip the separator.
@ $A5DE label=MatchPhraseTokens_Loop
  $A5DE,$01 Increment the phrase token pointer by one.
N $A5DF Fetch the second user input token (not the first, as the first token
. is the verb and the second token onwards gives the context).
N $A5DF For example; "GET" (verb) "KEG OF GUNPOWDER" (direct object).
@ $A5DF label=MatchPhraseTokens_Start
  $A5DF,$03 #REGhl=#R$A13C.
  $A5E2,$02 Jump to #R$A5E6.
N $A5E4 The tokens matched so advance both pointers.
@ $A5E4 label=MatchTokens_Loop

  $A5E4,$01 Increment the input token pointer by one.
  $A5E5,$01 Increment the pattern token pointer by one.
N $A5E6 Keep looping if the tokens match.
@ $A5E6 label=CompareTokens
  $A5E6,$04 Jump to #R$A5E4 if the pattern token and the input token are the
. same.
N $A5EA The tokens are different, but is it just that we are at the end of the
. pattern?
  $A5EA,$04 Jump to #R$A5F2 unless this is the terminator character (#N$FE).
N $A5EE Yes! The input tokens all matched against the phrase pattern tokens.
  $A5EE,$04 Return with Z flag result.
N $A5F2 The tokens are different, but is this a separator character?
@ $A5F2 label=CheckSeparator
  $A5F2,$04 Jump to #R$A5FC if this is not the separator (#N$FD).
  $A5F6,$05 Jump to #R$A5DE if the input tokens are not complete.
  $A5FB,$01 Return.
N $A5FC The current variant doesn't match, so skip to the next one.
@ $A5FC label=MatchPhraseTokens_Next
  $A5FC,$01 Increment the phrase token pointer by one.
  $A5FD,$05 Jump to #R$A608 if the terminator has been reached (#N$FE).
  $A602,$04 Jump to #R$A5FC if this is not the separator (#N$FD).
  $A606,$02 Jump to #R$A5DE.
N $A608 The input doesn't match any patterns.
@ $A608 label=MatchPhraseTokens_Return
  $A608,$01 Clear the zero flag; no phrase variant matched.
  $A609,$01 Return.

c $A60A Parser: Count Item References
@ $A60A label=Parser_CountItems
D $A60A Count how many tokens in the user input refer to game items.
E $A60A View the equivalent code in;
. #LIST
. { #JEWELS$C3AE }
. { #WARLORD$AEAF }
. LIST#
R $A60A O:A The number of references to items in the user input tokens
R $A60A O:F The Z flag is set when there are no items present in the input
  $A60A,$03 Set a pointer to #R$A13B in #REGhl.
  $A60D,$02 Set a token count in #REGb of #N$0A which is the total length of
. the user input tokens.
  $A60F,$02 Initialise the item counter held in #REGe to #N$00.
@ $A611 label=Parser_CountItems_Loop
  $A611,$01 Fetch a user input token.
  $A612,$04 Jump to #R$A629 if the terminator character (#N$FF) has been
. reached.
  $A616,$02 Stash the token pointer and token counter on the stack.
  $A618,$03 #REGhl=#R$B49E.
  $A61B,$04 Fetch the count of the number of items in the table from *#R$BBC9.
  $A61F,$02 Search to see if the item ID is in the table.
  $A621,$02 Restore the token counter and token pointer from the stack.
  $A623,$02 Jump to #R$A626 if this token doesn't refer to a game item.
N $A625 This token does point to a game item, so increase the item counter.
  $A625,$01 Increment item counter by one.
@ $A626 label=Parser_CountItems_Skip
  $A626,$01 Move to the next token.
  $A627,$02 Decrease the token counter by one and loop back to #R$A611 until
. all the tokens have been evaluated.
@ $A629 label=Parser_CountItems_Process
  $A629,$02 Transfer the item count into #REGa and set flags accordingly.
  $A62B,$01 Return.

c $A62C Item Locator
@ $A62C label=ItemLocator
D $A62C Given an item ID, this routine returns the byte stored for its
. location (#N$00 for when an item/ event is disabled, #N$01 for when an item
. is in the players inventory, or pass back the room ID).
E $A62C View the equivalent code in;
. #LIST
. { #JEWELS$C3D0 }
. { #WARLORD$AED1 }
. LIST#
R $A62C A Item ID
R $A62C O:A Either a room ID, #N$01 for the players inventory, or #N$00 for when the item is disabled
N $A62C Create an offset in #REGde.
  $A62C,$03 Load the item ID into #REGde.
  $A62F,$04 Add the item ID offset to #R$9F88.
  $A633,$01 Fetch the item location and store it in #REGa.
  $A634,$01 Return.

c $A635 Is Object In Inventory?
@ $A635 label=CheckObjectInInventory
D $A635 Checks if a given item is in the players inventory or not.
E $A635 View the equivalent code in;
. #LIST
. { #JEWELS$C3E4 }
. { #WARLORD$AEDA }
. LIST#
R $A635 A Object ID
R $A635 O:F The zero flag is set if the item is in the players inventory
N $A635 The #R$A62C routine returns with #REGa containing the room ID of the
. requested object, #N$00 for when the item is disabled or #N$01 for the
. players inventory.
  $A635,$03 Call #R$A62C.
  $A638,$02 Set the zero flag if that location is the inventory (#N$01).
  $A63A,$01 Return.

c $A63B Handler: Destroy Item/ Event
@ $A63B label=Handler_DestroyItemEvent
D $A63B Updates a given item/ event ID so it's then "inactive" (has a location
. ID of #N$00).
E $A63B View the equivalent code in;
. #LIST
. { #JEWELS$C3EA }
. { #WARLORD$AEE0 }
. LIST#
R $A63B A Item/ event ID
N $A63B Set the item ID and location (which will be #N$00 to deactivate it).
  $A63B,$01 Load the item/ event ID into #REGb.
  $A63C,$02 Set the room ID to #N$00 which will deactivate the item/ event.
  $A63E,$03 Call #R$A663.
  $A641,$01 Return.

c $A642 Handler: Update Item/ Event For The Current Room
@ $A642 label=Handler_UpdateItemEventCurrentRoom
D $A642 Updates a given item/ event ID so it appears in the current room. Used
. for example, when an item is dropped (so it changes from being #N$01 - in
. the players inventory, to the current room ID).
E $A642 View the equivalent code in;
. #LIST
. { #JEWELS$C3F1 }
. { #WARLORD$AEE7 }
. LIST#
R $A642 A Item/ event ID
  $A642,$01 Load the item/ event ID into #REGb.
  $A643,$04 Fetch the current room ID from *#R$A106 into #REGc.
  $A647,$03 Call #R$A663.
  $A64A,$01 Return.

c $A64B Set Scenic Event As Triggered
@ $A64B label=ScenicEventTriggered
E $A64B View the equivalent code in;
. #LIST
. { #JEWELS$C3FA }
. { #WARLORD$AEF0 }
. LIST#
R $A64B A Scenic event ID (+#N$80)
  $A64B,$01 Copy the scenic event ID into #REGb.
  $A64C,$02 Set #REGc to #N$FF which denotes that the event has fired already
. and shouldn't be repeated.
  $A64E,$03 Call #R$A663.
  $A651,$01 Return.

c $A652 Check Active Scenic Events
@ $A652 label=CheckActiveScenicEvents
E $A652 View the equivalent code in #JEWELS$C401.
R $A652 HL Pointer to scenic data
R $A652 O:A The listed item that is here, or #N$FF if there is none
R $A652 O:F The zero flag is set when an item on the list is here or carried
  $A652,$02 Jump to #R$A655.
@ $A654 label=ActiveScenicEvents_Loop
  $A654,$01 Move to the next event ID.
@ $A655 label=ActiveScenicEvents_CheckNext
  $A655,$05 Jump to #R$A661 if *#REGhl is equal to #N$FF.
  $A65A,$03 Call #R$A5C6.
  $A65D,$02 Jump to #R$A654 if the Z flag is not set.
  $A65F,$01 #REGa=*#REGhl.
  $A660,$01 Return.
@ $A661 label=NoActiveScenicEvents
  $A661,$01 Clear the zero flag (#REGa holds the #N$FF end marker) to report that nothing on the list is here.
  $A662,$01 Return.

c $A663 Handler: Update Item Location
@ $A663 label=Handler_UpdateItemLocation
R $A663 B Item ID
R $A663 C Room ID
  $A663,$03 #REGhl=#R$9F88.
  $A666,$03 Load the item ID into #REGde.
  $A669,$01 Add the item ID to #R$9F88.
  $A66A,$01 Update the table with the new room ID in #REGc.
  $A66B,$01 Return.

u $A66C Find Index Of Item From Item Group Present
@ $A66C label=FindIndexOfItemFromItemGroupPresent
R $A66C HL Pointer to item group data
R $A66C O:A The found index
C $A66C,$02 Initialise an index counter in #REGb to #N$00.
C $A66E,$02 Jump to #R$A672.
@ $A670 label=FindIndexOfItemFromItemGroupPresent_Loop
N $A670 Move past the termination byte in the item group.
C $A670,$01 Increment the index counter in #REGb by one.
C $A671,$01 Move #REGhl past the termination byte.
@ $A672 label=Call_CheckItemGroupPresent
C $A672,$03 Call #R$A652.
C $A675,$02 Jump back to #R$A670 until an item from the item group is matched.
N $A677 An index was found.
C $A677,$01 Store the index from #REGb into #REGa.
C $A678,$01 Return.

c $A679 Transform Item
@ $A679 label=TransformItem
R $A679 B From item ID
R $A679 C To item ID
D $A679 Rather than use item properties, the game just has separate objects
. that don't exist until an action is performed.
.
. An example is:
. #TABLE(default,centre,centre)
. { =h Item ID | =h Item Name }
. { #N$1F | #ITEM$1F }
. { #N$20 | #ITEM$20 }
. TABLE#
. When the helmet is worn by the player; item #N$1F is destroyed and replaced
. with item #N$20.
E $A679 View the equivalent code in;
. #LIST
. { #JEWELS$C426 }
. { #WARLORD$AF1E }
. LIST#
  $A679,$04 Call #R$A62C with the source item ID.
N $A67D #REGa now contains the location of the source ID.
  $A67D,$02 Stash the item IDs and source item room ID on the stack.
  $A67F,$05 Call #R$A663 and disable the source item.
  $A684,$02 Restore the source item room ID and item IDs from the stack.
N $A686 Activate the destination item in the same room.
  $A686,$01 Load the destination item ID into #REGb.
  $A687,$01 Load the source room ID into #REGc.
  $A688,$03 Call #R$A663.
  $A68B,$01 Return.

c $A68C Check Item In Current Room
@ $A68C label=CheckItemInCurrentRoom
R $A68C A Item ID
R $A68C O:F Z flag is set if the item is in the current room
N $A68C Fetch the room ID of the requested item using the table at #R$9F88.
  $A68C,$03 Call #R$A62C.
  $A68F,$04 Set the zero flag if that location is the current room in *#R$A106.
  $A693,$01 Return.

c $A694 Check Room Objects
@ $A694 label=CheckRoomObjects
E $A694 View the equivalent code in;
. #LIST
. { #JEWELS$C439 }
. { #WARLORD$AF39 }
. LIST#
R $A694 A Room number
R $A694 O:A #N$00 or #N$01 if objects are found or not
  $A694,$03 #REGhl=#R$9F88.
  $A697,$04 #REGbc=*#R$BBC7.
@ $A69B label=CheckRoomObjects_Loop
  $A69B,$02 Search for the room number in the table.
  $A69D,$01 Return if no objects are found.
  $A69E,$01 Stash the object location table pointer on the stack.
  $A69F,$03 Call #R$A6B1.
  $A6A2,$01 Restore the object location table pointer from the stack.
  $A6A3,$02 Jump to #R$A6AF if there are no objects found here.
  $A6A5,$01 Temporarily store #REGa in #REGe.
  $A6A6,$02 Are there more objects to check?
  $A6A8,$01 Restore the #REGa register.
  $A6A9,$02 Jump to #R$A69B if there are more objects to check.
N $A6AB Set the "successful" output.
  $A6AB,$02 Set #REGa to #N$01 to indicate that objects were found.
  $A6AD,$01 The room has objects in it.
  $A6AE,$01 Return.
N $A6AF Set the "failure" output.
@ $A6AF label=NoRoomObjectsFound
  $A6AF,$01 Set #REGa to #N$00 to indicate that no objects were found.
  $A6B0,$01 Return.

c $A6B1 Validate Object
@ $A6B1 label=ValidateObject
E $A6B1 View the equivalent code in;
. #LIST
. { #JEWELS$C456 }
. { #WARLORD$AF56 }
. LIST#
R $A6B1 BC Object counter
R $A6B1 O:F Z is unset if the object is valid, unset when invalid
  $A6B1,$02 Stash #REGaf and #REGbc on the stack.
  $A6B3,$01 Adjust the object counter.
  $A6B4,$03 #REGa=*#R$BBC7.
  $A6B7,$02 Calculate the index and store the result in #REGe.
N $A6B9 Find the object's name in #R$AFDD.
  $A6B9,$02 Find the object's name in #R$AFDD.
  $A6BB,$04 #REGix=#R$AFDD.
  $A6BF,$03 Call #R$A305.
N $A6C2 The object's name can now be printed.
  $A6C2,$02 Restore #REGix from the stack.
  $A6C4,$01 Restore the object counter from the stack.
  $A6C5,$04 Jump to #R$A6CC if the object is invalid.
  $A6C9,$01 Restore the object type from the stack.
  $A6CA,$01 Clear the zero flag; the object name is valid.
  $A6CB,$01 Return.
@ $A6CC label=InvalidObject
  $A6CC,$01 Restore #REGaf from the stack.
  $A6CD,$01 Set the zero flag; the object name is invalid.
  $A6CE,$01 Return.

c $A6CF Response: "You're Not Carrying Anything"
@ $A6CF label=Response_YoureNotCarryingAnything
  $A6CF,$06 Jump to #R$A6DC if *#R$A0D2 is not #N$00.
N $A6D5 Print "#DECODESTR$CE2D".
  $A6D5,$03 #REGhl=#R(#OFFSET($0020)).
  $A6D8,$03 Call #R$A25C.
  $A6DB,$01 Return.
@ $A6DC label=Response_YouAreCarrying
N $A6DC Print "#DECODESTR$CE3B".
  $A6DC,$03 #REGhl=#R(#OFFSET($0021)).
  $A6DF,$03 Call #R$A25C.
  $A6E2,$05 Call #R$A314 with a room ID of #N$01 which is the players
. inventory.
  $A6E7,$01 Return.

c $A6E8 Move Player
@ $A6E8 label=MovePlayer
D $A6E8 The data in #R$B8DD is stored in a particular order for each room:
. #TABLE(default,centre,centre)
. { =h Offset | =h Exit To Room }
. { #N$00 | North }
. { #N$01 | South }
. { #N$02 | East }
. { #N$03 | West }
. { #N$04 | Up }
. { #N$05 | Down }
. TABLE#
. This is how the movement works; taking the current room from the map - we add
. a "movement value" (e.g. "East" which is #N$02) - this then points to data in
. the table which correlates to either a room number for the exit, or #N$00 to
. indicate there is no exit in that direction.
R $A6E8 C A movement "value" from the action
  $A6E8,$02 Initialise #REGb with #N$00 so the movement value is now in #REGbc.
  $A6EA,$03 Call #R$A41C.
N $A6ED #REGhl now holds a pointer to the room data for the current room at
. #R$B8DD.
  $A6ED,$01 Add the movement value to #REGhl.
  $A6EE,$01 Fetch the entry from *#REGhl and store it in #REGa.
  $A6EF,$03 Jump to #R$A6F6 if there is no exit at the requested memory
. location.
  $A6F2,$03 Call #R$AD79.
  $A6F5,$01 Return.
@ $A6F6 label=Response_YouCantGoInThatDirection
N $A6F6 Print "#DECODESTR$CE44".
  $A6F6,$03 #REGhl=#R(#OFFSET($0022)).
  $A6F9,$03 Call #R$A25C.
  $A6FC,$01 Return.

g $A6FD Script Condition State
@ $A6FD label=ScriptConditionMask
D $A6FD Working bytes for #R$A6FF. The mask collects condition results and the
. operator selects AND or OR.
B $A6FD,$01 Condition mask.
@ $A6FE label=ScriptConditionOperator
B $A6FE,$01 #N$FF selects AND and #N$FE selects OR.

c $A6FF Handler: Run Script
@ $A6FF label=Handler_RunScript
D $A6FF Executes the bytecode at #REGix.
D $A6FF Each instruction is a condition from #R$A785 followed by an action
. from #R$A7C1. A condition that fails skips its action.
D $A6FF #N$FE selects OR for the next condition and #N$FF selects AND.
D $A6FF #N$FF ends the instruction and starts another one.
R $A6FF IX Pointer to the script bytecode
  $A6FF,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $A702,$03 #REGhl=#R$A6FD.
  $A705,$02 Start the condition mask at #N$40 (only the zero flag set, meaning the conditions hold).
  $A707,$01 Move #REGhl on to the condition operator.
  $A708,$02 Start with the AND operator (#N$FF).
  $A70A,$03 #REGe=*#REGix+#N$00.
  $A70D,$02 Stash #REGix on the stack.
  $A70F,$04 #REGix=#R$A785.
  $A713,$03 Call #R$A305.
  $A716,$02 Restore #REGix from the stack.
  $A718,$01 Jump to *#REGhl.
  $A719,$08 Move #REGix past the four bytes of that condition.
  $A721,$02 Copy the result flags of this condition into #REGc (bit 6 is its zero flag).
  $A723,$05 See whether the current operator in *#R$A6FE is OR (#N$FE).
  $A728,$03 #REGa=*#R$A6FD.
  $A72B,$02 Jump to #R$A730 if *#R$A6FE is not equal to #N$FE.
  $A72D,$01 #HTML(The script operator is "or", so this check passes if either condition held (<code>OR C</code>).)
  $A72E,$02 Jump to #R$A731.
  $A730,$01 #HTML(Otherwise both conditions must hold (<code>AND C</code>).)
  $A731,$03 Store the combined condition result.
  $A734,$03 #REGa=*#REGix+#N$00.
  $A737,$04 Jump to #R$A744 if #REGa is less than #N$FE.
  $A73B,$03 Store the new operator.
  $A73E,$02 Move #REGix on to the next script byte.
  $A740,$02 Jump to #R$A70A.

  $A742,$02 Move #REGix on to the action code.
  $A744,$03 #REGe=*#REGix+#N$00.
  $A747,$02 Stash #REGix on the stack.
  $A749,$04 #REGix=#R$A7C1.
  $A74D,$03 Call #R$A305.
  $A750,$02 Restore #REGix from the stack.
  $A752,$06 Pass the condition mask to the action as its flags, so the zero flag says whether the conditions hold.
  $A758,$01 Jump to *#REGhl.

  $A759,$08 Move #REGix past the four bytes of that action.
  $A761,$03 #REGa=*#REGix+#N$00.
  $A764,$04 Jump to #R$A742 if #REGa is equal to #N$FF.
  $A768,$02 Jump to #R$A702.
  $A76A,$02 Jump to #R$A770 if #REGa is not equal to #N$FF.
  $A76C,$02 #REGa=#N$01.
  $A76E,$01 The condition does not hold.
  $A76F,$01 Return.
  $A770,$01 #REGa=#N$00.
  $A771,$01 Return.
  $A772,$03 Return if #REGa is not equal to #N$FF.
  $A775,$03 #REGa=*#R$A805.
  $A778,$01 Return.

g $A779 Jump Table: Parser Checks
@ $A779 label=JumpTable_ParserChecks
D $A779 Parser routines called by #R$A924 and #R$A947. The first entry is
. unused.
W $A779,$02 Check #N((#PC-$A779)/$02).
L $A779,$02,$06

g $A785 Jump Table: Script Conditions
@ $A785 label=JumpTable_ScriptConditions
D $A785 Condition routines indexed by the opcodes in a script.
W $A785,$02 Condition #N((#PC-$A785)/$02).
L $A785,$02,$1E

g $A7C1 Jump Table: Script Actions
@ $A7C1 label=JumpTable_ScriptActions
D $A7C1 Action routines indexed by the opcodes in a script.
W $A7C1,$02 Action #N((#PC-$A7C1)/$02).
L $A7C1,$02,$22

g $A805 Script Result
@ $A805 label=ScriptMatchedItem
D $A805 #R$A805 holds the item ID found by #R$A8B2. An operand of #N$FF makes
. #R$A772 substitute it. #R$A806 holds the value returned by the latest parser
. check.
B $A805,$01 Matched item ID.
@ $A806 label=ScriptParserResult
B $A806,$01 Parser result.

c $A807 Condition: Always Succeeds
@ $A807 label=Condition_AlwaysSucceeds
D $A807 The condition succeeds without reading an operand.
R $A807 O:F The zero flag is set
N $A807 The condition always succeeds, with no operand.
  $A807,$04 Resume the script at #R$A71F.

c $A80B Condition: Item Is Present
@ $A80B label=Condition_ItemIsPresent
D $A80B Succeeds when the item operand is in the current room or the
. inventory.
R $A80B O:F The zero flag is set when the item is present
N $A80B Is the item in the current room or the inventory? #N$FF stands for
. the matched item.
  $A80B,$03 The operand names the item.
  $A80E,$03 #N$FF stands for the matched item.
  $A811,$03 Call #R$A5C6.
  $A814,$03 Resume the script.

c $A817 Condition: Item Is Absent
@ $A817 label=Condition_ItemIsAbsent
D $A817 Succeeds when the item operand is not in the current room or the
. inventory.
R $A817 O:F The zero flag is set when the item is absent
N $A817 Invert the presence test so the condition succeeds when the item is
. absent.
  $A817,$03 The operand names the item.
  $A81A,$03 #N$FF stands for the matched item.
  $A81D,$03 Call #R$A5C6 to check whether the matched item is here.
  $A820,$03 Succeed when the item is absent.
  $A823,$03 Resume the script.

c $A826 Condition: Item Is Carried
@ $A826 label=Condition_ItemIsCarried
D $A826 Succeeds when the item operand is in the inventory.
R $A826 O:F The zero flag is set when the item is carried
N $A826 Is the item in the inventory? #N$FF stands for the matched item.
  $A826,$03 The operand names the item.
  $A829,$03 #N$FF stands for the matched item.
  $A82C,$03 Call #R$A635.
  $A82F,$03 Resume the script.

c $A832 Condition: Item Is Not Carried
@ $A832 label=Condition_ItemIsNotCarried
D $A832 Succeeds when the item operand is not in the inventory.
R $A832 O:F The zero flag is set when the item is not carried
N $A832 Invert the carrying test so the condition succeeds when the item is
. not held.
  $A832,$03 The operand names the item.
  $A835,$03 #N$FF stands for the matched item.
  $A838,$03 Call #R$A635.
  $A83B,$03 Succeed when the item is not held.
  $A83E,$03 Resume the script.

c $A841 Condition: Item Is Here
@ $A841 label=Condition_ItemIsHere
D $A841 Succeeds when the item operand is in the current room.
R $A841 O:F The zero flag is set when the item is here
N $A841 Is the item in the current room? #N$FF stands for the matched item.
  $A841,$03 The operand names the item.
  $A844,$03 #N$FF stands for the matched item.
  $A847,$03 Call #R$A68C.
  $A84A,$03 Resume the script.

c $A84D Condition: In Room
@ $A84D label=Condition_InRoom
D $A84D Succeeds when #R$A106 is the room operand.
R $A84D O:F The zero flag is set when the rooms match
N $A84D Is the player in the room operand?
  $A84D,$09 The condition succeeds when #R$A106 is that room.

c $A856 Condition: Not In Room
@ $A856 label=Condition_NotInRoom
D $A856 Succeeds when #R$A106 is not the room operand.
R $A856 O:F The zero flag is set when the rooms differ
N $A856 Invert the room test so the condition succeeds anywhere else.
  $A856,$0C The condition succeeds when #R$A106 is not the room operand.

c $A862 Condition: Item Location Equals
@ $A862 label=Condition_ItemLocationEquals
D $A862 Succeeds when the item operand is in the room given by the second
. operand.
R $A862 O:F The zero flag is set when the location matches
N $A862 Is the item in the room given by the second operand?
  $A862,$03 The operand names the item.
  $A865,$03 #N$FF stands for the matched item.
  $A868,$03 Call #R$A62C to read the item's room.
  $A86B,$03 Is the item in the room operand?
  $A86E,$03 Resume the script.

c $A871 Condition: Item Location Differs
@ $A871 label=Condition_ItemLocationDiffers
D $A871 Succeeds when the item operand is not in the room given by the second
. operand.
R $A871 O:F The zero flag is set when the location differs
N $A871 Invert the location test so the condition succeeds when the item is
. somewhere else.
  $A871,$03 The operand names the item.
  $A874,$03 #N$FF stands for the matched item.
  $A877,$03 Call #R$A62C.
  $A87A,$03 Is the item in the room operand?
  $A87D,$03 Succeed when it is somewhere else.
  $A880,$03 Resume the script.

c $A883 Condition: Flag Is Set
@ $A883 label=Condition_FlagIsSet
D $A883 Succeeds when the flag bit operand is set in #R$A088.
R $A883 O:F The zero flag is set when the bit is set
N $A883 The flag test reports a clear bit, so invert it. The condition
. succeeds when the flag operand is set.
  $A883,$03 The operand selects the flag.
  $A886,$03 Call #R$A1C8.
  $A889,$03 Succeed when that flag is set.
  $A88C,$03 Resume the script.

c $A88F Condition: Flag Is Clear
@ $A88F label=Condition_FlagIsClear
D $A88F Succeeds when the flag bit operand is clear in #R$A088.
R $A88F O:F The zero flag is set when the bit is clear
N $A88F Is the flag operand clear?
  $A88F,$03 The operand selects the flag.
  $A892,$03 Call #R$A1C8.
  $A895,$03 Resume the script.

c $A898 Condition: Group Item Equals
@ $A898 label=Condition_GroupItemEquals
D $A898 Succeeds when the active item in the group operand equals the second
. operand.
R $A898 O:F The zero flag is set when the item matches
N $A898 Does the active item in this group equal the second operand? #R$A652
. returns with the zero flag set, so the early exit is never taken.
  $A898,$09 The operand selects a group from #R$B60E.
  $A8A1,$03 That group's list.
  $A8A4,$02 Restore the script pointer from the stack.
  $A8A6,$03 Call #R$A652.
  $A8A9,$03 The active-item check always continues.
  $A8AC,$03 The active item is the second operand.
  $A8AF,$03 Resume the script.

c $A8B2 Condition: Group Item Differs
@ $A8B2 label=Condition_GroupItemDiffers
D $A8B2 Succeeds when the active item in the group operand is not the second
. operand.
D $A8B2 Stores the active item ID at #R$A805.
R $A8B2 O:F The zero flag is set when the item differs
N $A8B2 Remember the group's active item at #R$A805, and succeed when it is
. not the second operand.
  $A8B2,$09 The operand selects a group from #R$B60E.
  $A8BB,$03 That group's list.
  $A8BE,$02 Restore the script pointer from the stack.
  $A8C0,$03 Call #R$A652.
  $A8C3,$03 Remember the active item at #R$A805.
  $A8C6,$03 It is not the second operand.
  $A8C9,$03 The condition succeeds when the items differ.
  $A8CC,$03 Resume the script.

c $A8CF Condition: Inventory Count Equals
@ $A8CF label=Condition_InventoryCountEquals
D $A8CF Succeeds when #R$A0D2 equals the operand.
R $A8CF O:F The zero flag is set when the counts match
N $A8CF Does the player hold the given number of items?
  $A8CF,$09 The condition succeeds when #R$A0D2 equals the operand.

c $A8D8 Condition: Inventory Count Differs
@ $A8D8 label=Condition_InventoryCountDiffers
D $A8D8 Succeeds when #R$A0D2 is not the operand.
R $A8D8 O:F The zero flag is set when the counts differ
N $A8D8 Succeed when the inventory count is not the operand.
  $A8D8,$0C The condition succeeds when #R$A0D2 differs from the operand.

c $A8E4 Condition: Marked Room Equals
@ $A8E4 label=Condition_MarkedRoomEquals
D $A8E4 Succeeds when #R$AD78 equals the room operand.
R $A8E4 O:F The zero flag is set when the rooms match
N $A8E4 Is the marked room the room operand?
  $A8E4,$09 The condition succeeds when #R$AD78 equals the operand.

c $A8ED Condition: Marked Room Differs
@ $A8ED label=Condition_MarkedRoomDiffers
D $A8ED Succeeds when #R$AD78 is not the room operand.
R $A8ED O:F The zero flag is set when the rooms differ
N $A8ED Succeed when the marked room is somewhere else.
  $A8ED,$0C The condition succeeds when #R$AD78 differs from the operand.

c $A8F9 Condition: Phrase Matches
@ $A8F9 label=Condition_PhraseMatches
D $A8F9 Succeeds when the player input matches the phrase at #R$B83D indexed
. by the operand.
R $A8F9 O:F The zero flag is set when the phrase matches
N $A8F9 Does the player's command match the phrase selected from #R$B83D?
  $A8F9,$09 The operand selects a phrase from #R$B83D.
  $A902,$03 That phrase.
  $A905,$03 Call #R$A5DB.
  $A908,$02 Restore the script pointer from the stack.
  $A90A,$03 Resume the script.

c $A90D Condition: Phrase Does Not Match
@ $A90D label=Condition_PhraseDoesNotMatch
D $A90D Succeeds when the player input does not match the indexed phrase.
R $A90D O:F The zero flag is set when the phrase does not match
N $A90D Invert the phrase test so the condition succeeds when the command
. does not match.
  $A90D,$09 The operand selects a phrase from #R$B83D.
  $A916,$03 That phrase.
  $A919,$03 Call #R$A5DB.
  $A91C,$02 Restore the script pointer from the stack.
  $A91E,$03 Succeed when the command does not match.
  $A921,$03 Resume the script.

c $A924 Condition: Parser Succeeds
@ $A924 label=Condition_ParserSucceeds
D $A924 Calls the parser check indexed in #R$A779 and succeeds when it returns
. with the carry clear.
D $A924 Stores #REGa at #R$A806.
R $A924 O:F The zero flag is set when the check succeeds
N $A924 Run the parser check selected from #R$A779. It returns to #R$A935,
. its result is stored at #R$A806, and the condition succeeds when the carry
. is clear.
  $A924,$09 The operand selects a check from #R$A779.
  $A92D,$03 That check.
  $A930,$05 Run that check. It returns here.
@ $A935 label=ParserSucceeds_Return
  $A935,$02 Restore the script pointer from the stack.
  $A937,$03 Remember the check's result at #R$A806.
  $A93A,$02 The check failed.
  $A93C,$04 The parser check passed.
@ $A940 label=ParserSucceeds_Failed
  $A940,$07 The parser check failed.

c $A947 Condition: Parser Fails
@ $A947 label=Condition_ParserFails
D $A947 Calls the parser check indexed in #R$A779 and succeeds when it returns
. with the carry set.
D $A947 Stores #REGa at #R$A806.
R $A947 O:F The zero flag is set when the check fails
N $A947 Run the parser check selected from #R$A779. It returns to #R$A958,
. its result is stored at #R$A806, and the condition succeeds when the carry
. is set.
  $A947,$09 The operand selects a check from #R$A779.
  $A950,$03 That check.
  $A953,$05 Run that check. It returns here.
@ $A958 label=ParserFails_Return
  $A958,$02 Restore the script pointer from the stack.
  $A95A,$03 Remember the check's result at #R$A806.
  $A95D,$02 The check passed.
  $A95F,$04 The parser check failed, so this condition succeeds.
@ $A963 label=ParserFails_Passed
  $A963,$07 The parser check passed, so this condition does not.

c $A96A Condition: Parser Result Equals
@ $A96A label=Condition_ParserResultEquals
D $A96A Succeeds when #R$A806 equals the operand.
R $A96A O:F The zero flag is set when the values match
N $A96A Does the saved parser result equal the operand?
  $A96A,$09 The condition succeeds when #R$A806 equals the operand.

c $A973 Condition: Parser Result Differs
@ $A973 label=Condition_ParserResultDiffers
D $A973 Succeeds when #R$A806 is not the operand.
R $A973 O:F The zero flag is set when the values differ
N $A973 Succeed when the saved parser result is not the operand.
  $A973,$0C The condition succeeds when #R$A806 differs from the operand.

c $A97F Condition: Room Pair Matches
@ $A97F label=Condition_RoomPairMatches
D $A97F Succeeds when #R$A106 is the first operand and #R$AD78 is the second.
R $A97F O:F The zero flag is set when both rooms match
N $A97F Succeed only when the player is in the first room and the marked
. room is the second.
  $A97F,$08 The player is in the first room.
  $A987,$06 The marked room is the second.
@ $A98D label=RoomPairMatches_Done
  $A98D,$03 Resume the script.

c $A990 Condition: Room Pair Differs
@ $A990 label=Condition_RoomPairDiffers
D $A990 Succeeds unless #R$A106 is the first operand and #R$AD78 is the
. second.
R $A990 O:F The zero flag is set unless both rooms match
N $A990 Succeed unless the player is in the first room and the marked room
. is the second.
  $A990,$08 The player is in the first room.
  $A998,$06 The marked room is the second.
@ $A99E label=RoomPairDiffers_Invert
  $A99E,$03 Succeed unless both rooms match.
  $A9A1,$03 Resume the script.

c $A9A4 Condition: Can Take Item
@ $A9A4 label=Condition_CanTakeItem
D $A9A4 Succeeds when #R$AE2C allows the item operand to be taken.
R $A9A4 O:F The zero flag is set when the item can be taken
N $A9A4 Can the player take the item operand?
  $A9A4,$03 The operand names the item.
  $A9A7,$03 #N$FF stands for the matched item.
  $A9AA,$03 Call #R$AE2C.
  $A9AD,$03 Resume the script.

c $A9B0 Condition: Cannot Take Item
@ $A9B0 label=Condition_CannotTakeItem
D $A9B0 Succeeds when #R$AE2C rejects the item operand.
R $A9B0 O:F The zero flag is set when the item cannot be taken
N $A9B0 Invert the take test so the condition succeeds when the item cannot
. be taken.
  $A9B0,$03 The operand names the item.
  $A9B3,$03 #N$FF stands for the matched item.
  $A9B6,$03 Call #R$AE2C.
  $A9B9,$03 Succeed when the item cannot be taken.
  $A9BC,$03 Resume the script.
C $A9BF

c $A9BF Condition: Is Carrying For Drop
@ $A9BF label=Condition_IsCarryingForDrop
D $A9BF Succeeds when #R$AE5E confirms the item operand is carried.
R $A9BF O:F The zero flag is set when the item is carried
N $A9BF Is the player carrying the item operand, as a drop requires?
  $A9BF,$03 The operand names the item.
  $A9C2,$03 #N$FF stands for the matched item.
  $A9C5,$03 Call #R$AE5E.
  $A9C8,$03 Resume the script.

c $A9CB Condition: Is Not Carrying For Drop
@ $A9CB label=Condition_IsNotCarryingForDrop
D $A9CB Succeeds when #R$AE5E rejects the item operand.
R $A9CB O:F The zero flag is set when the item is not carried
N $A9CB Invert the drop test so the condition succeeds when the item is not
. carried.
  $A9CB,$03 The operand names the item.
  $A9CE,$03 #N$FF stands for the matched item.
  $A9D1,$03 Call #R$AE5E.
  $A9D4,$03 Succeed when the item is not carried.
  $A9D7,$03 Resume the script.

c $A9DA Action: Jump To Script
@ $A9DA label=Action_JumpToScript
D $A9DA Continues execution at the script address in the operand when the
. condition succeeded.
N $A9DA When the condition succeeded, continue at the script address in the
. operand.
  $A9DA,$09 Continue at the script named by the operand.
  $A9E3,$03 Copy the script address from #REGhl into #REGix.
  $A9E6,$03 Jump to #R$A761.

c $A9E9 Action: Call Script
@ $A9E9 label=Action_CallScript
D $A9E9 Runs the script addressed by the operand, then returns to the
. instruction after this one.
N $A9E9 When the condition succeeded, run the operand script and come back
. to the next instruction.
  $A9E9,$03 Leave this action alone.
  $A9EC,$06 The script named by the operand.
  $A9F2,$08 Come back to the next action afterwards.
  $A9FA,$03 Copy the called script address from #REGhl into #REGix.
  $A9FD,$03 Jump to #R$A761.

c $AA00 Action: Return From Script
@ $AA00 label=Action_ReturnFromScript
D $AA00 Restores the script pointer saved by #R$A9E9.
N $AA00 When the condition succeeded, resume the script that #R$A9E9 saved.
  $AA00,$03 Jump to #R$A75F if the condition failed.
  $AA03,$02 Restore the saved script pointer from the stack.
  $AA05,$03 Jump to #R$A761.

c $AA08 Action: Print Message
@ $AA08 label=Action_PrintMessage
D $AA08 Prints the compressed message addressed by the operand.
N $AA08 When the condition succeeded, print the message addressed by the
. operand.
  $AA08,$03 Leave the message unprinted.
  $AA0B,$06 The message addressed by the operand.
  $AA11,$03 Call #R$A1F4.
  $AA14,$03 Resume the script.

c $AA17 Action: Print Message And Newline
@ $AA17 label=Action_PrintMessageAndNewline
D $AA17 Prints the compressed message addressed by the operand, then a
. newline.
N $AA17 When the condition succeeded, print the message addressed by the
. operand and start a new line.
  $AA17,$03 Leave the message unprinted.
  $AA1A,$06 The message addressed by the operand.
  $AA20,$03 Call #R$A25C.
  $AA23,$03 Resume the script.

c $AA26 Action: Place Item
@ $AA26 label=Action_PlaceItem
D $AA26 Moves the item operand to the room given by the second operand.
N $AA26 When the condition succeeded, put the item operand in the room given
. by the second operand. #N$FF stands for the matched item.
  $AA26,$03 Leave the item where it is.
  $AA29,$03 The operand names the item.
  $AA2C,$03 #N$FF stands for the matched item.
  $AA2F,$04 The item, and the room it moves to.
  $AA33,$03 Call #R$A663.
  $AA36,$03 Resume the script.

c $AA39 Action: Bring Item Here
@ $AA39 label=Action_BringItemHere
D $AA39 Moves the item operand into the current room.
N $AA39 When the condition succeeded, bring the item operand into the
. current room.
  $AA39,$03 Leave the item where it is.
  $AA3C,$03 The operand names the item.
  $AA3F,$03 #N$FF stands for the matched item.
  $AA42,$03 Call #R$A642.
  $AA45,$03 Resume the script.

c $AA48 Action: Transform Item
@ $AA48 label=Action_TransformItem
D $AA48 Replaces the first item operand with the second, in the same room.
N $AA48 When the condition succeeded, replace the first item operand with
. the second, in the same room.
  $AA48,$03 Leave both items as they are.
  $AA4B,$03 The first operand names the item.
  $AA4E,$03 #N$FF stands for the matched item.
  $AA51,$01 The item being replaced.
  $AA52,$03 The second operand names the replacement.
  $AA55,$03 #N$FF stands for the matched item.
  $AA58,$01 The item that replaces it.
  $AA59,$03 Call #R$A679.
  $AA5C,$03 Resume the script.

c $AA5F Action: Destroy Item
@ $AA5F label=Action_DestroyItem
D $AA5F Removes the item operand from the game.
N $AA5F When the condition succeeded, remove the item operand from the game.
  $AA5F,$03 Leave the item in the game.
  $AA62,$03 The operand names the item.
  $AA65,$03 #N$FF stands for the matched item.
  $AA68,$03 Call #R$A63B.
  $AA6B,$03 Resume the script.

c $AA6E Handler: Pick Up Item
@ $AA6E label=Handler_PickUpItem
E $AA6E View the equivalent code in;
. #LIST
. { #WARLORD$EDA6 }
. LIST#
  $AA6E,$03 The item stays where it is.
  $AA71,$03 #REGa=*#REGix+#N$01.
  $AA74,$03 Call #R$A772.
N $AA77 Call #R$A663 using the item ID, to change the location to #N$01 (to the
. players inventory).
  $AA77,$01 #REGb=#REGa.
  $AA78,$02 #REGc=#N$01.
  $AA7A,$03 Call #R$A663.
N $AA7D Player has picked up an item so handle the inventory count.
  $AA7D,$04 Increment *#R$A0D2 by one.
N $AA81 Print "#DECODESTR$CDE5".
  $AA81,$03 #REGhl=#R(#OFFSET($001A)).
  $AA84,$03 Call #R$A25C.
  $AA87,$03 Jump to #R$A75D.

c $AA8A Handler: Drop Item
@ $AA8A label=Handler_DropItem
E $AA8A View the equivalent code in;
. #LIST
. { #WARLORD$EDB8 }
. LIST#
  $AA8A,$03 The item stays in the inventory.
  $AA8D,$03 #REGa=*#REGix+#N$01.
  $AA90,$03 Call #R$A772.
N $AA93 The item is in the players inventory, so move its location to the
. current room.
  $AA93,$01 #REGb=#REGa.
  $AA94,$04 #REGc=*#R$A106.
  $AA98,$03 Call #R$A663.
N $AA9B Player has dropped an item so handle the inventory count.
  $AA9B,$04 Decrease *#R$A0D2 by one.
N $AA9F Print "#DECODESTR$CDE5".
  $AA9F,$03 #REGhl=#R(#OFFSET($001A)).
  $AAA2,$03 Call #R$A25C.
  $AAA5,$03 Jump to #R$A75D.

c $AAA8 Action: Go To Room
@ $AAA8 label=Action_GoToRoom
D $AAA8 Moves the player to the room operand.
N $AAA8 When the condition succeeded, move the player to the room operand.
  $AAA8,$03 The player stays in this room.
  $AAAB,$03 The operand names the destination.
  $AAAE,$03 Call #R$AD79.
  $AAB1,$03 Resume the script.

c $AAB4 Action: Set Flag
@ $AAB4 label=Action_SetFlag
D $AAB4 Sets the flag bit operand in #R$A088.
N $AAB4 When the condition succeeded, set the flag bit operand.
  $AAB4,$03 Leave that flag clear.
  $AAB7,$03 The operand selects the flag.
  $AABA,$03 Call #R$A1D2.
  $AABD,$03 Resume the script.

c $AAC0 Action: Clear Flag
@ $AAC0 label=Action_ClearFlag
D $AAC0 Clears the flag bit operand in #R$A088.
N $AAC0 When the condition succeeded, clear the flag bit operand.
  $AAC0,$03 Leave that flag set.
  $AAC3,$03 The operand selects the flag.
  $AAC6,$03 Call #R$A1DD.
  $AAC9,$03 Resume the script.

c $AACC Action: Add To Score
@ $AACC label=Action_AddToScore
D $AACC Adds the operand to the score at #R$A107.
N $AACC When the condition succeeded, add the operand to the score.
  $AACC,$03 Leave the score unchanged.
  $AACF,$03 The operand is the points to add.
  $AAD2,$03 Call #R$AD34.
  $AAD5,$03 Resume the script.

c $AAD8 Action: Pause
@ $AAD8 label=Action_Pause
D $AAD8 Waits for the operand number of interrupts.
N $AAD8 When the condition succeeded, wait for the operand number of frames.
  $AAD8,$03 Do not wait.
  $AADB,$03 The operand is how many frames to wait.
  $AADE,$03 Call #R$9E2F.
  $AAE1,$03 Resume the script.

c $AAE4 Action: Mark Scenic Event
@ $AAE4 label=Action_MarkScenicEvent
D $AAE4 Marks the scenic event operand as already triggered.
N $AAE4 When the condition succeeded, mark the scenic event operand as
. already triggered.
  $AAE4,$03 Leave that scenic event untriggered.
  $AAE7,$03 The operand names the scenic event.
  $AAEA,$03 #N$FF stands for the matched item.
  $AAED,$03 Call #R$A64B.
  $AAF0,$03 Resume the script.

c $AAF3 Action: End Script
@ $AAF3 label=Action_EndScript
D $AAF3 Restores the registers saved by #R$A6FF and returns to its caller.
N $AAF3 This is not the end of the script.
  $AAF3,$03 The script keeps running.
N $AAF6 The script is finished.
  $AAF6,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $AAF9,$01 Return.

c $AAFA Action: Increment Inventory
@ $AAFA label=Action_IncrementInventory
D $AAFA Increases #R$A0D2 by one.
N $AAFA When the condition succeeded, the player has gained an item.
  $AAFA,$0A Add one to the inventory count at #R$A0D2.

c $AB04 Action: Decrement Inventory
@ $AB04 label=Action_DecrementInventory
D $AB04 Decreases #R$A0D2 by one.
N $AB04 When the condition succeeded, the player has lost an item.
  $AB04,$0A Remove one from the inventory count at #R$A0D2.

c $AB0E Action: Set Event Flag
@ $AB0E label=Action_SetEventFlag
D $AB0E Sets the bit operand in #R$A0D1.
N $AB0E When the condition succeeded, set the operand bit in #R$A0D1 so the
. matching event follows the player.
  $AB0E,$03 That event does not start following the player.
  $AB11,$06 The operand selects which event.
@ $AB17 label=BuildEventMask
  $AB17,$03 Build the mask for that event.
  $AB1A,$05 That event now follows the player.
  $AB1F,$03 Resume the script.

c $AB22 Action: Clear Event Flag
@ $AB22 label=Action_ClearEventFlag
D $AB22 Clears the bit operand in #R$A0D1.
N $AB22 When the condition succeeded, clear the operand bit in #R$A0D1.
  $AB22,$03 That event keeps following the player.
  $AB25,$06 The operand selects which event.
@ $AB2B label=ClearEventMask
  $AB2B,$03 Build the mask for that event.
  $AB2E,$06 That event no longer follows the player.
  $AB34,$03 Resume the script.

c $AB37 Action: Set Turn Counter
@ $AB37 label=Action_SetTurnCounter
D $AB37 Writes the second operand into the turn counter selected by the first
. operand.
N $AB37 When the condition succeeded, store the second operand in the turn
. counter selected by the first.
  $AB37,$03 Leave the turn counters alone.
  $AB3A,$09 The counter selected by the first operand.
  $AB43,$04 That counter now holds the second operand.
  $AB47,$03 Resume the script.

c $AB4A Action: Start Turn Event
@ $AB4A label=Action_StartTurnEvent
D $AB4A Sets the bit operand in #R$A0C8, which arms that turn-based event.
N $AB4A When the condition succeeded, arm the turn-based event selected by
. the operand.
  $AB4A,$03 Leave that turn-based event disarmed.
  $AB4D,$06 The operand selects which event.
@ $AB53 label=StartTurnEvent_Mask
  $AB53,$03 Build the mask for that event.
  $AB56,$05 That turn-based event is now armed.
  $AB5B,$03 Resume the script.

c $AB5E Action: Stop Turn Event
@ $AB5E label=Action_StopTurnEvent
D $AB5E Clears the bit operand in #R$A0C8.
N $AB5E When the condition succeeded, disarm the turn-based event selected
. by the operand.
  $AB5E,$03 Leave that turn-based event armed.
  $AB61,$06 The operand selects which event.
@ $AB67 label=StopTurnEvent_Mask
  $AB67,$03 Build the mask for that event.
  $AB6A,$06 That turn-based event is now disarmed.
  $AB70,$03 Resume the script.

c $AB73 Action: Write Saved Byte
@ $AB73 label=Action_WriteSavedByte
D $AB73 Writes the second operand through the state-byte pointer selected from
. #R$BAF9.
N $AB73 When the condition succeeded, write the second operand through the
. address selected from #R$BAF9.
  $AB73,$03 Leave the saved bytes alone.
  $AB76,$05 The first operand selects a saved byte.
  $AB7B,$03 The second operand is the new value.
  $AB7E,$05 Look up its address in #R$BAF9.
  $AB83,$04 That address.
  $AB87,$01 Write the new value there.
  $AB88,$03 Resume the script.

c $AB8B Action: Load Game
@ $AB8B label=Action_LoadGame
D $AB8B Loads a saved position from tape.
N $AB8B When the condition succeeded, load a saved position from tape.
  $AB8B,$03 Leave the saved position alone.
  $AB8E,$03 Call #R$9EDB.
  $AB91,$03 Resume the script.

c $AB94 Action: Save Game
@ $AB94 label=Action_SaveGame
D $AB94 Saves the current position to tape.
N $AB94 When the condition succeeded, save the current position to tape.
  $AB94,$03 Leave the position unsaved.
  $AB97,$03 Call #R$9E80.
  $AB9A,$03 Resume the script.

c $AB9D Action: Describe Room
@ $AB9D label=Action_DescribeRoom
D $AB9D Prints the current room, including its picture when the room has one.
N $AB9D When the condition succeeded, describe the current room and force
. its picture.
  $AB9D,$03 Leave the room undescribed.
  $ABA0,$02 Force its picture.
  $ABA2,$03 Call #R$A33A.
  $ABA5,$03 Resume the script.

c $ABA8 Action: List Inventory
@ $ABA8 label=Action_ListInventory
D $ABA8 Prints the inventory, or the empty-inventory message.
N $ABA8 When the condition succeeded, list what the player is carrying.
  $ABA8,$03 Leave the inventory unlisted.
  $ABAB,$03 Call #R$A6CF.
  $ABAE,$03 Resume the script.

c $ABB1 Action: Move Player
@ $ABB1 label=Action_MovePlayer
D $ABB1 Moves the player in the direction given by the operand.
N $ABB1 When the condition succeeded, move in the direction given by the
. operand.
  $ABB1,$03 The player stays in this room.
  $ABB4,$03 The operand names the direction.
  $ABB7,$03 Call #R$A6E8.
  $ABBA,$03 Resume the script.

c $ABBD Action: Offer Save
@ $ABBD label=Action_OfferSave
D $ABBD Prints the score, asks whether to save, and sets flag bit #N$02.
N $ABBD Do not offer to save.
  $ABBD,$03 Do not offer to save.
N $ABC0 Show the score, then ask "#DECODESTR$CDB0".
  $ABC0,$03 Show the score.
  $ABC3,$03 Ask whether to save.
  $ABC6,$03 Call #R$A25C.
@ $ABC9 label=SavePrompt_Loop
N $ABC9 N declines the save and Y writes the position to tape.
  $ABC9,$03 Read the answer.
  $ABCC,$04 N declines the save.
  $ABD0,$04 Anything but Y asks again.
  $ABD4,$03 Write the position to tape.
N $ABD7 Remember that the offer was made by setting flag bit #N$02, then
. resume the script.
  $ABD7,$02 Flag bit #N$02 records the offer.
  $ABD9,$03 Call #R$A1D2.
  $ABDC,$03 Resume the script.

c $ABDF Action: Print Score
@ $ABDF label=Action_PrintScore
D $ABDF Prints the score.
N $ABDF When the condition succeeded, print the score.
  $ABDF,$03 Leave the score unprinted.
  $ABE2,$03 Call #R$AD43.
  $ABE5,$03 Resume the script.

c $ABE8 Action: Set Carrying Limit
@ $ABE8 label=Action_SetCarryingLimit
D $ABE8 Writes the operand to #R$A0D3.
N $ABE8 When the condition succeeded, change how much the player can carry.
  $ABE8,$0C The player can now carry that many items.

c $ABF4 Parser: Validate No Direct Object
@ $ABF4 label=Parser_ValidateNoDirectObject
D $ABF4 The opposite of #R$AC02, checks that there's no direct object.
E $ABF4 View the equivalent code in;
. #LIST
. { #JEWELS$C470 }
. { #WARLORD$AF70 }
. LIST#
R $ABF4 O:F The Z flag is set when there's no direct object present
R $ABF4 O:F The carry flag is set when there's a second token set
  $ABF4,$06 Return if the second token (*#R$A13C) is the terminator
. character (#N$FF).
N $ABFA Print "#DECODESTR$CDD1".
  $ABFA,$03 #REGhl=#R(#OFFSET($0018)).
  $ABFD,$03 Call #R$A25C.
  $AC00,$01 Set the carry flag to indicate the command is malformed.
  $AC01,$01 Return.

c $AC02 Parser: Validate Direct Object
@ $AC02 label=Parser_ValidateDirectObject
D $AC02 In most adventure games, the structure for a command is "verb + direct
. object". This is usually how the player interacts with the game world. The
. verb describes the action, and the direct object is what the action is
. performed on. For example; "TAKE SHOE" uses the verb "TAKE" on the direct
. object "SHOE".
E $AC02 View the equivalent code in;
. #LIST
. { #JEWELS$C47B }
. { #WARLORD$AF7B }
. LIST#
R $AC02 O:A The number of references to items in the user input tokens
R $AC02 O:F The carry flag is set when the command is malformed
N $AC02 The first token is the verb, so target the second token for the direct
. object.
  $AC02,$03 Fetch the #R$A13C(second token from the user input) and store it in
. #REGa.
  $AC05,$04 Jump forward to #R$AC11 if the token is anything other than the
. terminator character (#N$FF).
N $AC09 The token was the terminator character (#N$FF), so the sentence is
. malformed.
N $AC09 E.g. They tried "TAKE" but didn't write anything after it.
N $AC09 Print "#DECODESTR$CDC1".
  $AC09,$03 #REGhl=#R(#OFFSET($0017)).
  $AC0C,$03 Call #R$A25C.
  $AC0F,$01 Set the carry flag to indicate this call was a failure.
  $AC10,$01 Return.
N $AC11 Process the direct object.
@ $AC11 label=DirectObject_Process
  $AC11,$03 Call #R$A60A.
  $AC14,$01 Return if there is at least one valid item mentioned in the user
. input tokens.
N $AC15 Any references are invalid.
N $AC15 Print "#DECODESTR$CDD1".
  $AC15,$03 #REGhl=#R(#OFFSET($0018)).
  $AC18,$03 Call #R$A25C.
  $AC1B,$01 Set the carry flag to indicate the command is malformed.
  $AC1C,$01 Return.

c $AC1D Parser: Validate Input Tokens
@ $AC1D label=Parser_ValidateInputTokens
E $AC1D View the equivalent code in;
. #LIST
. { #JEWELS$C490 }
. { #WARLORD$AF90 }
. LIST#
R $AC1D O:A The number of references to items in the user input tokens
R $AC1D O:F The zero flag is set when there is only a verb present
R $AC1D O:F The zero flag is unset when there is at least one valid direct object
R $AC1D O:F The carry flag is set when the command is malformed
N $AC1D The first token is the verb, so target the second token for the direct
. object.
  $AC1D,$03 Fetch the #R$A13C(second token from the user input) and store it in
. #REGa.
  $AC20,$03 Return if there is no second token.
N $AC23 There is a second token; so validate all direct objects after this
. point.
  $AC23,$03 Call #R$A60A.
  $AC26,$01 Return if there is at least one valid item mentioned in the user
. input tokens.
N $AC27 Any references are invalid.
N $AC27 Print "#DECODESTR$CDD1".
  $AC27,$03 #REGhl=#R(#OFFSET($0018)).
  $AC2A,$03 Call #R$A25C.
  $AC2D,$01 Set the carry flag; the command is malformed.
  $AC2E,$01 Return.

c $AC2F Parser: Validate Two Direct Objects
@ $AC2F label=Parser_ValidateTwoDirectObjects
E $AC2F View the equivalent code in;
. #LIST
. { #JEWELS$C49F }
. { #WARLORD$AF9F }
. LIST#
R $AC2F O:F The carry flag is set when the command is malformed
  $AC2F,$03 Call #R$AC02.
  $AC32,$01 Return if there is no direct object in the user input (so the
. command is malformed).
N $AC33 #REGa now contains the count of the number of valid direct objects.
  $AC33,$04 Jump to #R$AC3F if the number of valid direct objects in the user
. input is not #N$01.
N $AC37 There is only one valid direct object in the user input and the
. command needs two...
  $AC37,$06 Call #R$A25C to print "#DECODESTR$CDC1" and start a new line.
  $AC3D,$01 Set the carry flag; the command needs another object.
  $AC3E,$01 Return.
N $AC3F There are two or more valid direct objects in the user input.
@ $AC3F label=ValidateTwoDirectObjects
  $AC3F,$04 Jump to #R$AC45 if the number of valid direct objects in the user
. input is greater than or equal to #N$03.
  $AC43,$01 #HTML(Clear the carry flag (<code>AND A</code>) to signal that both objects were accepted.)
  $AC44,$01 Return.
N $AC45 There are more than two valid direct objects in the user input.
@ $AC45 label=ValidateTwoDirectObjects_TooMany
  $AC45,$06 Call #R$A25C to print "#DECODESTR$CDD1" and start a new line.
  $AC4B,$01 Set the carry flag; there are too many objects.
  $AC4C,$01 Return.

c $AC4D Parser: Validate Any Direct Object
@ $AC4D label=Parser_ValidateAnyDirectObject
D $AC4D In most adventure games, the structure for a command is "verb + direct
. object". This is usually how the player interacts with the game world. The
. verb describes the action, and the direct object is what the action is
. performed on. For example; "TAKE SHOE" uses the verb "TAKE" on the direct
. object "SHOE".
E $AC4D View the equivalent code in;
. #LIST
. { #JEWELS$C4B7 }
. { #WARLORD$AFB7 }
. LIST#
R $AC4D O:A The number of valid direct objects in the user input tokens
R $AC4D O:F The carry flag is set when the command is malformed
R $AC4D O:F The zero flag is set when there are no valid direct objects present in the input tokens
N $AC4D The first token is the verb, so target the second token for the direct
. object.
  $AC4D,$03 Fetch the #R$A13C(second token from the user input) and store it in
. #REGa.
  $AC50,$04 Jump forward to #R$AC5C if the token is anything other than the
. terminator character (#N$FF).
N $AC54 The token was the terminator character (#N$FF), so the sentence is
. malformed.
N $AC54 E.g. They tried "TAKE" but didn't write anything after it.
N $AC54 Print "#DECODESTR$CDC1".
  $AC54,$03 #REGhl=#R(#OFFSET($0017)).
  $AC57,$03 Call #R$A25C.
  $AC5A,$01 Set the carry flag to indicate this call was a failure.
  $AC5B,$01 Return.
N $AC5C The user input tokens have a direct object, return how many are in the
. command buffer.
@ $AC5C label=ValidateAnyDirectObject
  $AC5C,$03 Call #R$A60A.
  $AC5F,$01 Return.

c $AC60 Parser: Process Item
@ $AC60 label=Parser_ProcessItem
E $AC60 View the equivalent code in;
. #LIST
. { #JEWELS$C4C7 }
. { #WARLORD$AFC7 }
. LIST#
  $AC60,$03 #REGhl=#R$A13B.
  $AC63,$02 Set a counter of #N$0A in #REGb of the maximum number of tokens
. available in the user input.
@ $AC65 label=ProcessItem_Loop
  $AC65,$01 Fetch a token byte from the user input pointer.
  $AC66,$03 Return if the terminator has been reached (#N$FF).
  $AC69,$02 Stash the user input token pointer and max count on the stack.
  $AC6B,$03 Load #R$B49E into #REGhl.
  $AC6E,$04 Load *#R$BBC9 into #REGbc.
  $AC72,$02 Search for matching objects.
  $AC74,$02 Jump to #R$AC7E the current token wasn't found in the table.
  $AC76,$03 Call #R$A591.
  $AC79,$02 Jump to #R$AC7E if the carry flag is not set.
  $AC7B,$02 Restore the max count and user input token pointer from the stack.
  $AC7D,$01 Return.
@ $AC7E label=ProcessItem_Next
  $AC7E,$02 Restore the max count and user input token pointer from the stack.
  $AC80,$01 Increment the user input token pointer by one.
  $AC81,$02 Decrease the max count by one and loop back to #R$AC65 until all of
. the user input tokens have been evaluated.
  $AC83,$01 Return.

g $AC84 Temporary Storage Table Pointer
@ $AC84 label=TempStore_TablePointer
W $AC84,$02

g $AC86 Temporary Storage Table Index
@ $AC86 label=TempStore_TableIndex
W $AC86,$02

c $AC88 Handler: Scenic Events
@ $AC88 label=Handler_ScenicEvents
D $AC88 Handles checking if a scenic event should occur ... and also, handles
. jumping to the correct related scenic event routine to action it.
E $AC88 View the equivalent code in;
. #LIST
. { #JEWELS$C4EB }
. { #WARLORD$AFEB }
. LIST#
  $AC88,$03 #REGa=*#R$BBCF.
  $AC8B,$02 Return if *#R$BBCF is zero.
  $AC8D,$01 #REGb=#REGa.
  $AC8E,$03 #REGhl=#R$B6BA.
  $AC91,$02 Jump to #R$AC94.
@ $AC93 label=Handler_ScenicEvents_Loop
  $AC93,$01 Move #REGhl on to the next scenic event room ID.
@ $AC94 label=ScenicEvents_Process
  $AC94,$01 #REGa=*#REGhl.
  $AC95,$03 Call #R$A5C6.
  $AC98,$02 Jump to #R$ACBA if #REGhl is not equal to #REGa.
N $AC9A An event was found to be processed!
N $AC9A First though, stash away the current pointer and index in the search,
. so this can be resumed later.
  $AC9A,$03 Write #REGhl to *#R$AC84.
  $AC9D,$04 Write #REGbc to *#R$AC86.
N $ACA1 Calculate the event index and get the event handler.
  $ACA1,$05 #REGe=*#R$BBCF-#REGb.
  $ACA6,$04 Load #REGix with #R$BBBD which contains a pointer to the scenic
. event rountines jump table.
  $ACAA,$03 Call #R$A305.
  $ACAD,$03 Copy the scenic-event script address from #REGhl into #REGix.
  $ACB0,$03 Call #R$A6FF.
N $ACB3 This is the return point after the handler has finished executing.
@ $ACB3 label=ScenicEvents_PostProcessing
  $ACB3,$03 Restore *#R$AC84 to #REGhl.
  $ACB6,$04 Restore *#R$AC86 to #REGbc.
@ $ACBA label=ScenicEvents_Next
  $ACBA,$02 Decrease the event counter by one and loop back to #R$AC93 until
. all events have been processed.
  $ACBC,$01 Return.

c $ACBD Move Player To Room
@ $ACBD label=MovePlayerToRoom
R $ACBD A Destination room ID
E $ACBD View the equivalent code in;
. #LIST
. { #JEWELS$C520 }
. { #WARLORD$B01F }
. LIST#
  $ACBD,$01 Load the destination room ID into #REGc.
  $ACBE,$06 Jump to #R$ACDB if *#R$BBCF is zero.
N $ACC4 Scenic events that are present come with the player to the
. destination room.
  $ACC4,$06 The scenic items are listed at #R$B6BA.
@ $ACCA label=ScenicItem_Advance
  $ACCA,$01 The next scenic item.
@ $ACCB label=ScenicItem_Next
  $ACCB,$01 Its item id.
  $ACCC,$03 Call #R$A5C6.
  $ACCF,$02 It is not coming with the player.
  $ACD1,$03 This scenic item, and the destination room.
  $ACD4,$03 Call #R$A663.
  $ACD7,$02 Restore the scenic scan from the stack.
@ $ACD9 label=ScenicItem_Count
  $ACD9,$02 On to the next scenic item.
N $ACDB The destination room is now the current room.
  $ACDB,$08 Remember it at #R$A106 and read the event flags.
N $ACE3 No event flag is set, so the move is finished.
  $ACE3,$01 Return.
N $ACE4 For each set bit in #R$A0D1, bring the corresponding byte from
. #R$B6F4 into the room.
  $ACE4,$08 Eight event bits, and the items at #R$B6F4.
@ $ACEC label=EventFlag_Advance
  $ACEC,$01 The next event.
@ $ACED label=EventFlag_Next
  $ACED,$04 This event is not following the player.
  $ACF1,$03 This event's item.
  $ACF4,$03 Call #R$A642.
  $ACF7,$02 Restore the event scan from the stack.
@ $ACF9 label=EventFlag_Count
  $ACF9,$02 The remaining event bits.
N $ACFB The move is complete.
  $ACFB,$01 Return.

c $ACFC Handler: Dispatch Verb
@ $ACFC label=Handler_DispatchVerb
D $ACFC Finds the first input token in #R$B420 and runs the matching script
. from #R$B44A. Prints the rephrase message when the token is unknown.
N $ACFC Look up the first token in the verb list at #R$B420.
  $ACFC,$0E Jump to #R$AD11 when the verb is known.
N $AD0A The verb is not one this game understands.
  $AD0A,$06 Print "#DECODESTR$CDD1".
  $AD10,$01 Return.
N $AD11 Run the verb script from #R$B44A.
  $AD11,$06 This verb's place in #R$B44A.
  $AD17,$04 The verb scripts are listed at #R$B44A.
  $AD1B,$03 This verb's script.
  $AD1E,$03 Restore the verb script address into #REGix from the stack.
  $AD21,$03 Run that script.
  $AD24,$01 Return.

c $AD25 Generate Random Number
@ $AD25 label=GenerateRandomNumber
D $AD25 Returns a number from #N$00 up to, but not including, #REGa.
D $AD25 The refresh register chooses how far to walk around that range.
D $AD25 Nothing in the game calls it.
R $AD25 A Exclusive upper bound
R $AD25 O:A The generated number
@ $AD2B label=Random_Mix
N $AD25 Mix the refresh register into a number below the limit in #REGa.
. Nothing in the game calls this.
  $AD25,$0D Walk around the range until the refresh count runs out.
  $AD32,$01 Restore #REGbc from the stack.
  $AD33,$01 Return.

c $AD34 Add To Score
@ $AD34 label=AddToScore
D $AD34 Adds #REGa to the BCD score at #R$A107.
R $AD34 A Points to add
N $AD34 Add the points in #REGa to the BCD score at #R$A107.
  $AD34,$0D Add the points in #REGa to the BCD score at #R$A107.
  $AD41,$01 Restore #REGhl from the stack.
  $AD42,$01 Return.

c $AD43 Print Scoring
@ $AD43 label=Print_Scoring
D $AD43 Prints the players score as a percentage.
N $AD43 Print "#DECODESTR$CE65".
  $AD43,$03 #REGhl=#R(#OFFSET($0024)).
  $AD46,$03 Call #R$A1F4.
  $AD49,$03 #REGhl=*#R$A107.
N $AD4C Evaluate the first byte to see if it needs printing at all.
N $AD4C So don't show "058%" - instead show "58%".
N $AD4C This particular check is for the first character "1" to see if the
. score is printing "100%".
  $AD4C,$01 Take the first scoring byte and store it in #REGa.
M $AD4D,$04 Keep the hundreds digit and jump to #R$AD56 if it is zero.
  $AD4D,$02,b$01 Keep the hundreds digit in bits 0-3.
  $AD4F,$02 Jump to #R$AD56 if there is no hundreds digit to print.
  $AD51,$05 Convert the number to ASCII by adding #N$30 and call #R$9E26.
@ $AD56 label=Scoring_SecondDigit
  $AD56,$01 Load the second scoring byte into #REGa.
M $AD57,$04 Keep the tens digit and jump to #R$AD60 if it is non-zero.
  $AD57,$02,b$01 Keep the tens digit in bits 4-7.
  $AD59,$02 Jump to #R$AD60 if there is a tens digit to print.
N $AD5B The "tens" digit is zero, so check the "hundreds" digit again to avoid
. printing "05%" - instead show only "5%".
  $AD5B,$01 Load the first scoring byte into #REGa again.
  $AD5C,$03 Jump to #R$AD69 if no "hundreds" digit was printed.
N $AD5F A "hundreds" digit was printed, so force a "0" to be printed.
  $AD5F,$01 Load #N$00 into #REGa for printing.
@ $AD60 label=Scoring_PrintTens
  $AD60,$04 Shift the bits four positions right. This moves the tens digit into
. the lower part of the byte for printing.
  $AD64,$05 Convert the number to ASCII by adding #N$30 and call #R$9E26.
N $AD69 Lastly, always print the "units".
@ $AD69 label=Scoring_ThirdDigit
  $AD69,$01 Load the second scoring byte into #REGa.
  $AD6A,$02,b$01 Keep the units digit in bits 0-3.
  $AD6C,$05 Convert the number to ASCII by adding #N$30 and call #R$9E26.
N $AD71 Print "#DECODESTR$CE6E".
  $AD71,$03 #REGhl=#R(#OFFSET($0025)).
  $AD74,$03 Call #R$A25C.
  $AD77,$01 Return.

g $AD78 Temporary Room ID
@ $AD78 label=TemporaryRoom
D $AD78 The room #R$AD79 is about to enter. The script can test it before the
. move is committed.
B $AD78,$01 Room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).

c $AD79 Change Room
@ $AD79 label=ChangeRoom
R $AD79 A Destination room ID
  $AD79,$03 Store the room ID in *#R$AD78.
  $AD7C,$02 Stash #REGix on the stack.
  $AD7E,$04 #REGix=#R$BBD8.
  $AD82,$03 Call #R$A6FF.
  $AD85,$02 #REGa=#N$00.
  $AD87,$03 Call #R$A1C8.
  $AD8A,$02 Do not enter the room when the player is dead.
  $AD8C,$03 Restore the destination room ID from *#R$AD78.
  $AD8F,$03 Call #R$ACBD.
  $AD92,$02 #REGe=#N$00.
  $AD94,$03 Call #R$A33A.
  $AD97,$04 #REGix=#R$BC4C.
  $AD9B,$03 Call #R$A6FF.
  $AD9E,$02 Restore #REGix from the stack.
  $ADA0,$01 Return.

c $ADA1 Game Start
@ $ADA1 label=GameStart
  $ADA1,$03 #REGhl=#R$9F88.
  $ADA4,$03 #REGbc=#N($0181,$04,$04).
  $ADA7,$02 Write #N$00 to *#REGhl.
  $ADA9,$01 Move #REGhl on to the next byte to clear.
  $ADAA,$05 Count down the #N($0181,$04,$04) bytes and loop back to #R$ADA7 until all are cleared.
  $ADAF,$0C Copy #N($0088,$04,$04) bytes of data (count is via *#R$BBC7) from
. #R$BB0B to #R$9F88.
  $ADBB,$06 Write *#R$BBD7 to *#R$A0D3.
  $ADC1,$04 #REGix=#R$BAF9.
  $ADC5,$03 #REGde=#R$BB05.
  $ADC8,$04 #REGb=*#R$BBD1.
  $ADCC,$03 #REGl=*#REGix+#N$00.
  $ADCF,$03 #REGh=*#REGix+#N$01.
  $ADD2,$01 #REGa=*#REGde.
  $ADD3,$01 Write that initial-state byte through the address from #R$BAF9.
  $ADD4,$04 Move #REGix on to the next initial-state address.
  $ADD8,$01 Move #REGde on to the next initial-state byte.
  $ADD9,$02 Decrease the init counter and loop back to #R$ADCC until every saved-state address is primed.
  $ADDB,$03 Call #R$9F27.
  $ADDE,$06 Write *#R$BBD3 to *#R$A106.
  $ADE4,$03 Call #R$AD79.
  $ADE7,$03 Call #R$A280.
  $ADEA,$03 Call #R$AC88.
  $ADED,$02 #REGa=#N$00.
  $ADEF,$03 Call #R$A1C8.
  $ADF2,$02 End the game when the player is dead.
  $ADF4,$02 #REGa=#N$01.
  $ADF6,$03 Call #R$A1C8.
  $ADF9,$02 End the game and show the score.
  $ADFB,$02 #REGa=#N$02.
  $ADFD,$03 Call #R$A1C8.
  $AE00,$02 End the game and ask for another one.
  $AE02,$03 Call #R$A4B0.
  $AE05,$03 Call #R$AC60.
  $AE08,$03 Call #R$ACFC if #REGc is greater than #N$02.
  $AE0B,$02 Jump to #R$ADE7.

c $AE0D Game Over
@ $AE0D label=GameOver
N $AE0D Print "#DECODESTR$CD6B".
  $AE0D,$03 #REGhl=#R(#OFFSET($0010)).
  $AE10,$03 Call #R$A25C.
N $AE13 Print the percentage of the game the player achieved.
@ $AE13 label=GameOver_Score
  $AE13,$03 Call #R$AD43.
@ $AE16 label=WantAnotherGameInput
N $AE16 Print "#DECODESTR$CD72".
  $AE16,$03 #REGhl=#R(#OFFSET($0011)).
  $AE19,$03 Call #R$A25C.
@ $AE1C label=WantAnotherGameInput_Loop
  $AE1C,$03 Call #R$9DFB.
N $AE1F The player is done with the game, so reset back to BASIC.
  $AE1F,$05 #HTML(Reset back to BASIC if the keypress is "<code>#CHR$4E</code>".)
N $AE24 The player wants another go...
  $AE24,$05 #HTML(Jump to #R$9DD7 if the keypress is "<code>#CHR$59</code>".)
N $AE29 Just loop round for any other input.
  $AE29,$03 Jump to #R$AE1C.

c $AE2C Handler: Can Take Item
@ $AE2C label=Handler_CanTakeItem
D $AE2C Rejects a take when the item is already carried or the inventory is
. full.
D $AE2C Plural items in #R$B6F1 use the "them" message.
R $AE2C A Item ID
R $AE2C O:A #N$00 when the item can be taken, otherwise #N$01
R $AE2C O:F The zero flag is set when the item can be taken
  $AE2C,$03 Call #R$A635.
  $AE2F,$02 Jump to #R$AE48 when it is not in the inventory.
N $AE31 Print "#DECODESTR$CDEA".
  $AE31,$03 #REGhl=#R(#OFFSET($001B)).
  $AE34,$03 #REGbc=#N($0003,$04,$04).
N $AE37 Skip the plural-item search when the list length in #REGc is zero.
  $AE37,$04 Jump to #R$AE55 when the plural list is empty.
  $AE3B,$01 Stash #REGhl on the stack.
  $AE3C,$03 #REGhl=#R$B6F1.
  $AE3F,$01 #REGa=#REGe.
  $AE40,$02 Search the plural-item list.
  $AE42,$01 Restore #REGhl from the stack.
  $AE43,$02 Jump to #R$AE55 when this item is singular.
  $AE45,$01 Move #REGhl on to the plural article string.
  $AE46,$02 Jump to #R$AE55.
N $AE48 Print "#DECODESTR$CE20".
  $AE48,$03 #REGhl=#R(#OFFSET($001F)).
  $AE4B,$0A Jump to #R$AE5C if *#R$A0D2 is less than *#R$A0D3.
  $AE55,$03 Call #R$A25C.
  $AE58,$02 #REGa=#N$01.
  $AE5A,$01 The take is rejected.
  $AE5B,$01 Return.
  $AE5C,$01 #REGa=#N$00.
  $AE5D,$01 Return.

c $AE5E Handler: Is Carrying Item
@ $AE5E label=Handler_IsCarryingItem
D $AE5E Rejects a drop when the item is not carried.
D $AE5E Plural items in #R$B6F1 use the "them" message.
R $AE5E A Item ID
R $AE5E O:A #N$00 when the item is carried, otherwise #N$01
R $AE5E O:F The zero flag is set when the item is carried
N $AE5E The drop is valid when the item is already being carried.
  $AE5E,$03 Call #R$A635.
N $AE61 The item is being carried.
  $AE61,$01 Return.
N $AE62 Tell the player the item is not carried. A plural form from #R$B6F1
. is used when the item is one of those three.
  $AE62,$03 The message for a singular item.
  $AE65,$05 Three items can take the plural message.
  $AE6A,$02 No plural list, so keep the singular wording.
  $AE6C,$06 Search the plural-item list.
  $AE72,$01 Restore the message pointer from the stack.
  $AE73,$02 Jump to #R$AE76 when this item is singular.
  $AE75,$01 This item is plural, so use the next message.
  $AE76,$03 Call #R$A25C.
  $AE79,$03 The drop is rejected.
N $AE7C The drop is rejected.
  $AE7C,$01 Return.

g $AE7D Table: Room Descriptions
@ $AE7D label=Table_RoomDescriptions
E $AE7D View the equivalent code in;
. #LIST
. { #JEWELS$D3EC }
. { #WARLORD$C8B0 }
. LIST#
W $AE7D,$02 Unused (denotes when an item is "inactive").
W $AE7F,$02 Unused (denotes when an item is in the players inventory).
W $AE81,$02 Room #N((#PC-$AE7D)/$02):
. #IF(#EVAL(#PEEK(#PC)+#PEEK(#PC+$01)*$100)>$0000)(#R(#OFFSET(#PEEK(#PC)+#PEEK(#PC+$01)*$100)),N/A).
L $AE81,$02,$58

g $AF31 Table: Object Noun Phrases
@ $AF31 label=Table_ObjectNounPhrases
E $AF31 View the equivalent code in;
. #LIST
. { #JEWELS$D4C6 }
. { #WARLORD$C83E }
. LIST#
W $AF31,$02 Object #R(#OFFSET(#PEEK(#PC+$01)*$100+#PEEK(#PC)))(#N((#PC-$AF31)/$02)): #OBJECT((#PC-$AF31)/$02).
L $AF31,$02,$56

g $AFDD Table: Item Descriptions
@ $AFDD label=Table_ItemDescriptions
E $AFDD View the equivalent code in;
. #LIST
. { #JEWELS$D34E }
. { #WARLORD$C732 }
. LIST#
W $AFDD,$02 Item #N((#PC-$AFDD)/$02):
. #IF(#EVAL(#PEEK(#PC)+#PEEK(#PC+$01)*$100)>$0000)(#R(#OFFSET(#PEEK(#PC)+#PEEK(#PC+$01)*$100)) #ITEM((#PC-$AFDD)/$02),N/A).
L $AFDD,$02,$88

t $B0ED Table: Vocabulary
@ $B0ED label=Table_Vocabulary
  $B0ED,$09 Command #N((#PC-$B0ED)/$09).
L $B0ED,$09,$0A
  $B147,$04 Command #N((#PC-$B11F)/$04).
L $B147,$04,$02
  $B14F,$09 Command #N$0C.
  $B158,$04 Command #N((#PC-$B124)/$04).
L $B158,$04,$02
  $B160,$09 Command #N$0F.
  $B169,$04 Command #N((#PC-$B129)/$04).
L $B169,$04,$03
  $B175,$09 Command #N$13.
  $B17E,$13 Command #N$14.
  $B191,$09 Command #N$15.
  $B19A,$04 Command #N((#PC-$B142)/$04).
L $B19A,$04,$04
  $B1AA,$09 Command #N$1A.
  $B1B3,$04 Command #N$1B.
  $B1B7,$09 Command #N$1C.
  $B1C0,$04 Command #N$1D.
  $B1C4,$09 Command #N$1E.
  $B1CD,$04 Command #N((#PC-$B151)/$04).
L $B1CD,$04,$02
  $B1D5,$09 Command #N$21.
  $B1DE,$04 Command #N((#PC-$B156)/$04).
L $B1DE,$04,$0A
  $B206,$09 Command #N$2C.
  $B20F,$04 Command #N$2D.
  $B213,$09 Command #N$2E.
  $B21C,$04 Command #N((#PC-$B160)/$04).
L $B21C,$04,$02
  $B224,$09 Command #N$31.
  $B22D,$04 Command #N$32.
  $B231,$09 Command #N$33.
  $B23A,$04 Command #N((#PC-$B16A)/$04).
L $B23A,$04,$02
  $B242,$09 Command #N((#PC-$B05C)/$09).
L $B242,$09,$02
  $B254,$04 Command #N((#PC-$B174)/$04).
L $B254,$04,$04
  $B264,$0E Command #N$3C.
  $B272,$04 Command #N((#PC-$B17E)/$04).
L $B272,$04,$02
  $B27A,$09 Command #N$3F.
  $B283,$04 Command #N((#PC-$B183)/$04).
L $B283,$04,$04
  $B293,$09 Command #N$44.
  $B29C,$04 Command #N((#PC-$B188)/$04).
L $B29C,$04,$11
  $B2E0,$09 Command #N$56.
  $B2E9,$04 Command #N((#PC-$B18D)/$04).
L $B2E9,$04,$1C
  $B359,$09 Command #N$73.
  $B362,$04 Command #N((#PC-$B192)/$04).
L $B362,$04,$07
  $B37E,$09 Command #N$7B.
  $B387,$04 Command #N((#PC-$B197)/$04).
L $B387,$04,$04
  $B397,$09 Command #N$80.
  $B3A0,$04 Command #N((#PC-$B19C)/$04).
L $B3A0,$04,$04
  $B3B0,$09 Command #N$85.
  $B3B9,$04 Command #N$86.
  $B3BD,$13 Command #N$87.
  $B3D0,$04 Command #N((#PC-$B1B0)/$04).
L $B3D0,$04,$05
  $B3E4,$09 Command #N$8D.
  $B3ED,$04 Command #N((#PC-$B1B5)/$04).
L $B3ED,$04,$02
  $B3F5,$09 Command #N$90.
  $B3FE,$04 Command #N((#PC-$B1BA)/$04).
L $B3FE,$04,$02
  $B406,$09 Command #N$93.
  $B40F,$04 Command #N((#PC-$B1BF)/$04).
L $B40F,$04,$04
B $B41F,$01 Terminator.

g $B420 Table: Verb Tokens
@ $B420 label=Table_VerbTokens
D $B420 The token searched for by #R$ACFC. There are #R$BBCB entries.
B $B420,$01 Verb index #N(#PC-$B420) matches token #N(#PEEK(#PC)).
L $B420,$01,$2A

g $B44A Jump Table: Verb Scripts
@ $B44A label=JumpTable_VerbScripts
D $B44A The script #R$ACFC runs for the matching entry in #R$B420.
W $B44A,$02 Script for verb index #N((#PC-$B44A)/$02).
L $B44A,$02,$2A
g $B49E Table: Token Item List
@ $B49E label=Table_TokenItemList
D $B49E A list of all tokens which relate to items.
E $B49E View the equivalent code in;
. #LIST
. { #JEWELS$E83E }
. { #WARLORD$E308 }
. LIST#
B $B49E,$01 Token #N(#PEEK(#PC)): #TOKEN(#PEEK(#PC)).
L $B49E,$01,$56

g $B4F4 Data: Item Groups
D $B4F4 See #R$B60E for usage.
@ $B4F4 label=Data_ItemGroup_Roman
B $B4F4,$01 #IF(#PEEK(#PC)==$FF)(Terminator,Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC))).
L $B4F4,$01,$11A

g $B60E Table: Item Grouping
@ $B60E label=Table_ItemGrouping
D $B60E Items may have several item IDs which relate to a single item, this
. table groups the items together to assist the parser with knowing that
. tokens refer to the same thing.
.
. Some examples are:
. #TABLE(default,centre,centre,centre)
. { =h Item ID | =h Item Name | =h Relates To: }
. { R$E353(#N$13) | #ITEM$13 | =r2 The Hare }
. { R$E354(#N$26) | #ITEM$26 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { R$E36B(#N$1F) | #ITEM$1F | =r2 The Bronze Helmet }
. { R$E36C(#N$20) | #ITEM$20 }
. { =h Item ID | =h Item Name | =h Relates To: }
. { R$E3AD(#N$4F) | #ITEM$4F | =r2 The Pig }
. { R$E3AE(#N$50) | #ITEM$50 }
. TABLE#
W $B60E,$02 Item Group: #N((#PC-$B60E)/$02): #OBJECT((#PC-$B60E)/$02).
L $B60E,$02,$56

g $B6BA Table: Scenic Event Locations 2
@ $B6BA label=Table_ScenicEventLocations2
D $B6BA A table where the index is the event ID, and the value is the room it
. resides in (#N$00 for "currently inactive"). See #R$BBCF for the count.
B $B6BA,$01 Event #N(#PC-$B6BA) in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $B6BA,$01,$05

g $B6F1 Table: Plural Items
@ $B6F1 label=Table_PluralItems
D $B6F1 Item IDs that use the plural carrying messages. #R$AE2C and #R$AE5E
. search these #N$03 bytes.
B $B6F1,$01 Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC)).
L $B6F1,$01,$03

g $B6F4 Data: Phrase Tokens
@ $B6F4 label=Data_PhraseTokens
D $B6F4 Phrase patterns read by #R$A5DB. #R$B83D holds an address for each
. pattern.

g $B83D Table: Phrase Pointers
@ $B83D label=Table_PhrasePointers
D $B83D Addresses of the phrases in #R$B6F4. #R$A8F9 and #R$A90D index it.
W $B83D,$02 Phrase #N((#PC-$B83D)/$02) at #N(#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $B83D,$02,$50

g $B8DD Table: Room Map
@ $B8DD label=Table_RoomMap
N $B8DD Room #N((#PC-$B8DD)/$06): #ROOM((#PC-$B8DD)/$06).
B $B8DD,$01 #IF(#PEEK(#PC)>$00)(North to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8DE,$01 #IF(#PEEK(#PC)>$00)(South to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8DF,$01 #IF(#PEEK(#PC)>$00)(East to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8E0,$01 #IF(#PEEK(#PC)>$00)(West to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8E1,$01 #IF(#PEEK(#PC)>$00)(Up to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $B8E2,$01 #IF(#PEEK(#PC)>$00)(Down to room: R($B8DD+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
L $B8DD,$06,$2F

g $BA00 Data: Saved Room Byte
@ $BA00 label=Data_SavedRoomByte
D $BA00 State byte #N$03 in #R$BAF9. Saving copies this byte through #R$A0D4,
. and #R$AB73 can replace it. The remaining bytes are a room-ID list
. terminated by #N$00.

g $BA04 Data: Saved Room List
@ $BA04 label=Data_SavedRoomList
D $BA04 State byte #N$04 in #R$BAF9, followed by room IDs in groups terminated
. by #N$00. Only the first byte is copied by the save routine.

g $BA4D Data: Saved Room List 2
@ $BA4D label=Data_SavedRoomList2
D $BA4D State byte #N$05 in #R$BAF9, followed by room IDs in groups terminated
. by #N$00. Only the first byte is copied by the save routine.

g $BAF9 Table: Saved State Addresses
@ $BAF9 label=Table_SavedStateAddresses
D $BAF9 Addresses of the six bytes packed into #R$A0D4:
. #FOR($00,$05)||n|#N(#PEEK($BAF9+n*$02)+#PEEK($BAF9+n*$02+$01)*$100)|, | and ||.
. Three of them are direction bytes in #R$B8DD, so a changed exit survives a
. save.
W $BAF9,$02 State byte #N((#PC-$BAF9)/$02) at #N(#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $BAF9,$02,$06,$02

g $BB05 Initial Saved State Bytes
@ $BB05 label=InitialSavedStateBytes
D $BB05 Values copied to the addresses in #R$BAF9 when a new game starts.
B $BB05,$01 Initial value of state byte #N(#PC-$BB05).
L $BB05,$01,$06

g $BB0B Table: Initial Item Locations
@ $BB0B label=Table_InitialItemLocations
D $BB0B Copied over #R$9F88 when a new game starts. The length is #R$BBC7.
B $BB0B,$01 Item #N(#PC-$BB0B) #ITEM(#PC-$BB0B) starts in room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $BB0B,$01,$88

g $BB93 Table: Rooms With Images
@ $BB93 label=Table_RoomsWithImages
D $BB93 See #R$A33A.
B $BB93,$01 Location Slot: #N(#PC-$BB93) - room #N(#PEEK(#PC)): #ROOM(#PEEK(#PC)).
L $BB93,$01,$13

g $BBA6 Table: Room Image Numbers
@ $BBA6 label=Table_RoomImageNumbers
D $BBA6 The picture passed to #R$9F67 for each entry in #R$BB93.
B $BBA6,$01 Slot #N(#PC-$BBA6) uses image #N(#PEEK(#PC)).
L $BBA6,$01,$13

g $BBB9 Jump Table: Turn-Based Events
@ $BBB9 label=JumpTable_TurnEvents
D $BBB9 Scripts run by #R$A280 when the matching turn counter reaches zero:
. #FOR($00,$01)||n|#N(#PEEK($BBB9+n*$02)+#PEEK($BBB9+n*$02+$01)*$100)| and ||.
W $BBB9,$02 Event bit #N((#PC-$BBB9)/$02).
L $BBB9,$02,$02

g $BBBD Jump Table: Scenic Events
@ $BBBD label=JumpTable_ScenicEvents
D $BBBD Scripts run for the scenic events in #R$B6BA:
. #FOR($00,$04)||n|#R(#PEEK($BBBD+n*$02)+#PEEK($BBBD+n*$02+$01)*$100)|, | and ||.
W $BBBD,$02 Event #N((#PC-$BBBD)/$02).
L $BBBD,$02,$05

g $BBC7 Number Of Object
@ $BBC7 label=Count_Objects_1
D $BBC7 The total number of objects in the game.
W $BBC7,$02

g $BBC9 Number Of Objects
@ $BBC9 label=Count_Objects_2
D $BBC9 The total number of objects in the game.
W $BBC9,$02

g $BBCB Number Of Verb Tokens
@ $BBCB label=Count_VerbTokens
D $BBCB The number of entries in #R$B420 and #R$B44A.
W $BBCB,$02

g $BBCD Number Of Rooms With Images
@ $BBCD label=Count_RoomsWithImages
D $BBCD The total number of rooms which have related images in the game.
W $BBCD,$02

g $BBCF Number Of Scenic Events
@ $BBCF label=Count_ScenicEvents
E $BBCF The total number of scenic events in the game, see Table_ScenicEventLocations.
W $BBCF,$02

g $BBD1 Number Of Saved State Bytes
@ $BBD1 label=Count_SavedStateBytes
D $BBD1 How many addresses #R$BAF9 holds, and how many bytes #R$A0D4 packs.
W $BBD1,$02

g $BBD3 Starting Room
@ $BBD3 label=StartingRoom
B $BBD3,$01

u $BBD4 Unused

g $BBD5 Pointer: Room Image Offsets
@ $BBD5 label=Pointer_RoomImageOffsets
D $BBD5 Points at #R$61A8, the offsets #R$9F67 adds after indexing them.
W $BBD5,$02 #R$61A8.

g $BBD7 Initial Carrying Limit
@ $BBD7 label=InitialCarryingLimit
D $BBD7 Copied to #R$A0D3 at the start of a game.
B $BBD7,$01 #N(#PEEK(#PC)).

g $BBD8 Data: Arrival Script
@ $BBD8 label=Data_ArrivalScript
D $BBD8 Script run by #R$AD79 before the player enters the new room.

g $BC4C Data: Room Setup Script
@ $BC4C label=Data_RoomSetupScript
D $BC4C Script run by #R$AD79 after the new room is current.

g $BCE4 Data: Scenic Event Script
@ $BCE4 label=Data_ScenicEventScript1
D $BCE4 Script for scenic event #N$00. #R$BBBD jumps here.

g $BD00 Data: Scenic Event Script 2
@ $BD00 label=Data_ScenicEventScript2
D $BD00 Script for scenic event #N$01.

g $BD1C Data: Scenic Event Script 3
@ $BD1C label=Data_ScenicEventScript3
D $BD1C Script for scenic event #N$02.

g $BD25 Data: Scenic Event Script 4
@ $BD25 label=Data_ScenicEventScript4
D $BD25 Script for scenic event #N$03.

g $BD2E Data: Action Scripts
@ $BD2E label=Data_ActionScripts
D $BD2E Scenic event #N$04 starts here. The verb scripts addressed from
. #R$B44A, and the later action scripts, continue through the rest of this
. block.

g $CA2B Table: Messaging Offsets
@ $CA2B label=Table_MessagingOffsets
W $CA2B,$02 Message ID #N(#PC-$CA2B): #R($C8E9+#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $CA2B,$02,$170

g $C8E9 Data: Strings
@ $C8E9 label=Data_Strings
B $C8E9,$01 "#DECODE(#PEEK(#PC))".
L $C8E9,$01,$90

t $CD0B Messaging: "Give Me A Command!"
@ $CD0B label=Messaging_GiveMeACommand
N $CD0B Print "#DECODESTR(#PC)".
B $CD0B,$01 "#DECODE(#PEEK(#PC))".
L $CD0B,$01,$0A,$02
B $CD15,$01 Terminator.

t $CD16 Messaging: "Try Another Command"
@ $CD16 label=Messaging_TryAnotherCommand
N $CD16 Print "#DECODESTR(#PC)".
B $CD16,$01 "#DECODE(#PEEK(#PC))".
L $CD16,$01,$0B,$02
B $CD21,$01 Terminator.

t $CD22 Messaging: "Nothing"
@ $CD22 label=Messaging_Nothing
N $CD22 Print "#DECODESTR(#PC)".
B $CD22,$01 "#DECODE(#PEEK(#PC))".
L $CD22,$01,$03,$02
B $CD25,$01 Terminator.

t $CD26 Messaging: "You Can See:-"
@ $CD26 label=Messaging_YouCanSee
N $CD26 Print "#DECODESTR(#PC)".
B $CD26,$01 "#DECODE(#PEEK(#PC))".
L $CD26,$01,$08,$02
B $CD2E,$01 Terminator.

t $CD2F Messaging: "&"
@ $CD2F label=Messaging_Ampersand
N $CD2F Print "#DECODESTR(#PC)".
B $CD2F,$01 "#DECODE(#PEEK(#PC))".
L $CD2F,$01,$03,$02
B $CD32,$01 Terminator.

t $CD33 Messaging: "There Are Exits:-"
@ $CD33 label=Messaging_ThereAreExits
N $CD33 Print "#DECODESTR(#PC)".
B $CD33,$01 "#DECODE(#PEEK(#PC))".
L $CD33,$01,$0A,$02
B $CD3D,$01 Terminator.

t $CD3E Messaging: "There Is An Exit"
@ $CD3E label=Messaging_ThereIsAnExit
N $CD3E Print "#DECODESTR(#PC)".
B $CD3E,$01 "#DECODE(#PEEK(#PC))".
L $CD3E,$01,$09,$02
B $CD47,$01 Terminator.

t $CD48 Exits Messaging: "North"
@ $CD48 label=MessagingExits_North
N $CD48 Print "#DECODESTR(#PC)".
B $CD48,$01 "#DECODE(#PEEK(#PC))".
L $CD48,$01,$03,$02
B $CD4B,$01 Terminator.

t $CD4C Exits Messaging: "South"
@ $CD4C label=MessagingExits_South
N $CD4C Print "#DECODESTR(#PC)".
B $CD4C,$01 "#DECODE(#PEEK(#PC))".
L $CD4C,$01,$03,$02
B $CD4F,$01 Terminator.

t $CD50 Exits Messaging: "East"
@ $CD50 label=MessagingExits_East
N $CD50 Print "#DECODESTR(#PC)".
B $CD50,$01 "#DECODE(#PEEK(#PC))".
L $CD50,$01,$02,$02
B $CD52,$01 Terminator.

t $CD53 Exits Messaging: "West"
@ $CD53 label=MessagingExits_West
N $CD53 Print "#DECODESTR(#PC)".
B $CD53,$01 "#DECODE(#PEEK(#PC))".
L $CD53,$01,$02,$02
B $CD55,$01 Terminator.

t $CD56 Exits Messaging: "Up"
@ $CD56 label=MessagingExits_Up
N $CD56 Print "#DECODESTR(#PC)".
B $CD56,$01 "#DECODE(#PEEK(#PC))".
L $CD56,$01,$02,$02
B $CD58,$01 Terminator.

t $CD59 Exits Messaging: "Down"
@ $CD59 label=MessagingExits_Down
N $CD59 Print "#DECODESTR(#PC)".
B $CD59,$01 "#DECODE(#PEEK(#PC))".
L $CD59,$01,$03,$02
B $CD5C,$01 Terminator.

t $CD5D Messaging: "I Can't See"
@ $CD5D label=Messaging_ICantSee
N $CD5D Print "#DECODESTR(#PC)".
B $CD5D,$01 "#DECODE(#PEEK(#PC))".
L $CD5D,$01,$08,$02
B $CD65,$01 Terminator.

t $CD66 Messaging: "Here"
@ $CD66 label=Messaging_Here
N $CD66 Print "#DECODESTR(#PC)".
B $CD66,$01 "#DECODE(#PEEK(#PC))".
L $CD66,$01,$04,$02
B $CD6A,$01 Terminator.

t $CD6B Messaging: "You Are Dead"
@ $CD6B label=Messaging_YouAreDead
N $CD6B Print "#DECODESTR(#PC)".
B $CD6B,$01 "#DECODE(#PEEK(#PC))".
L $CD6B,$01,$06,$02
B $CD71,$01 Terminator.

t $CD72 Messaging: "Want Another Game? Y/N"
@ $CD72 label=Messaging_WantAnotherGame
N $CD72 Print "#DECODESTR(#PC)".
B $CD72,$01 "#DECODE(#PEEK(#PC))".
L $CD72,$01,$0F,$02
B $CD81,$01 Terminator.

t $CD82 Messaging: "Loading Status File"
@ $CD82 label=Messaging_LoadingStatusFile
N $CD82 Print "#DECODESTR(#PC)".
B $CD82,$01 "#DECODE(#PEEK(#PC))".
L $CD82,$01,$0C,$02
B $CD8E,$01 Terminator.

t $CD8F Messaging: "Status File Not Found"
@ $CD8F label=Messaging_StatusFileNotFound
N $CD8F Print "#DECODESTR(#PC)".
B $CD8F,$01 "#DECODE(#PEEK(#PC))".
L $CD8F,$01,$0D,$02
B $CD9C,$01 Terminator.

t $CD9D Messaging: "Saving Status"
@ $CD9D label=Messaging_SavingStatus
N $CD9D Print "#DECODESTR(#PC)".
B $CD9D,$01 "#DECODE(#PEEK(#PC))".
L $CD9D,$01,$08,$02
B $CDA5,$01 Terminator.

t $CDA6 Messaging: "Saving Complete"
@ $CDA6 label=Messaging_SavingComplete
N $CDA6 Print "#DECODESTR(#PC)".
B $CDA6,$01 "#DECODE(#PEEK(#PC))".
L $CDA6,$01,$09,$02
B $CDAF,$01 Terminator.

t $CDB0 Messaging: "Want To Save The Game? Y/N"
@ $CDB0 label=Messaging_WantToSaveTheGame
N $CDB0 Print "#DECODESTR(#PC)".
B $CDB0,$01 "#DECODE(#PEEK(#PC))".
L $CDB0,$01,$10,$02
B $CDC0,$01 Terminator.

t $CDC1 Messaging: "Please Be More Specific"
@ $CDC1 label=Messaging_PleaseBeMoreSpecific
N $CDC1 Print "#DECODESTR(#PC)".
B $CDC1,$01 "#DECODE(#PEEK(#PC))".
L $CDC1,$01,$0F,$02
B $CDD0,$01 Terminator.

t $CDD1 Messaging: "Please Rephrase That"
@ $CDD1 label=Messaging_PleaseRephraseThat
N $CDD1 Print "#DECODESTR(#PC)".
B $CDD1,$01 "#DECODE(#PEEK(#PC))".
L $CDD1,$01,$0C,$02
B $CDDD,$01 Terminator.

t $CDDE Messaging: "You Can't"
@ $CDDE label=Messaging_YouCant
N $CDDE Print "#DECODESTR(#PC)".
B $CDDE,$01 "#DECODE(#PEEK(#PC))".
L $CDDE,$01,$06,$02
B $CDE4,$01 Terminator.

t $CDE5 Messaging: "O.K"
@ $CDE5 label=Messaging_OK
N $CDE5 Print "#DECODESTR(#PC)".
B $CDE5,$01 "#DECODE(#PEEK(#PC))".
L $CDE5,$01,$04,$02
B $CDE9,$01 Terminator.

t $CDEA Messaging: "You're Already Carrying It"
@ $CDEA label=Messaging_YoureAlreadyCarryingIt
N $CDEA Print "#DECODESTR(#PC)".
B $CDEA,$01 "#DECODE(#PEEK(#PC))".
L $CDEA,$01,$0D,$02
B $CDF7,$01 Terminator.

t $CDF8 Messaging: "You're Already Carrying Them"
@ $CDF8 label=Messaging_YoureAlreadyCarryingThem
N $CDF8 Print "#DECODESTR(#PC)".
B $CDF8,$01 "#DECODE(#PEEK(#PC))".
L $CDF8,$01,$0E,$02
B $CE06,$01 Terminator.

t $CE07 Messaging: "You're Not Carrying It"
@ $CE07 label=Messaging_YoureNotCarryingIt
N $CE07 Print "#DECODESTR(#PC)".
B $CE07,$01 "#DECODE(#PEEK(#PC))".
L $CE07,$01,$0B,$02
B $CE12,$01 Terminator.

t $CE13 Messaging: "You're Not Carrying Them"
@ $CE13 label=Messaging_YoureNotCarryingThem
N $CE13 Print "#DECODESTR(#PC)".
B $CE13,$01 "#DECODE(#PEEK(#PC))".
L $CE13,$01,$0C,$02
B $CE1F,$01 Terminator.

t $CE20 Messaging: "You Can't Carry Any More"
@ $CE20 label=Messaging_YouCantCarryAnyMore
N $CE20 Print "#DECODESTR(#PC)".
B $CE20,$01 "#DECODE(#PEEK(#PC))".
L $CE20,$01,$0C,$02
B $CE2C,$01 Terminator.

t $CE2D Messaging: "You're Not Carrying Anything"
@ $CE2D label=Messaging_YoureNotCarryingAnything
N $CE2D Print "#DECODESTR(#PC)".
B $CE2D,$01 "#DECODE(#PEEK(#PC))".
L $CE2D,$01,$0D,$02
B $CE3A,$01 Terminator.

t $CE3B Messaging: "You Are Carrying:-"
@ $CE3B label=Messaging_YouAreCarrying
N $CE3B Print "#DECODESTR(#PC)".
B $CE3B,$01 "#DECODE(#PEEK(#PC))".
L $CE3B,$01,$08,$02
B $CE43,$01 Terminator.

t $CE44 Messaging: "You Can't Go In That Direction"
@ $CE44 label=Messaging_YouCantGoInThatDirection
N $CE44 Print "#DECODESTR(#PC)".
B $CE44,$01 "#DECODE(#PEEK(#PC))".
L $CE44,$01,$11,$02
B $CE55,$01 Terminator.

t $CE56 Messaging: "I Don't See The Point"
@ $CE56 label=Messaging_IDontSeeThePoint
N $CE56 Print "#DECODESTR(#PC)".
B $CE56,$01 "#DECODE(#PEEK(#PC))".
L $CE56,$01,$0E,$02
B $CE64,$01 Terminator.

t $CE65 Messaging: "You Have Scored"
@ $CE65 label=Messaging_YouHaveScored
N $CE65 Print "#DECODESTR(#PC)".
B $CE65,$01 "#DECODE(#PEEK(#PC))".
L $CE65,$01,$08,$02
B $CE6D,$01 Terminator.

t $CE6E Messaging: "%"
@ $CE6E label=Messaging_Percentage
N $CE6E Print "#DECODESTR(#PC)".
B $CE6E,$01 "#DECODE(#PEEK(#PC))".
L $CE6E,$01,$02,$02
B $CE70,$01 Terminator.

t $CE71 Messaging: ""
N $CE71 Print "#DECODESTR(#PC)".
B $CE71,$01 "#DECODE(#PEEK(#PC))".
L $CE71,$01,$01,$02
B $CE72,$01 Terminator.
N $CE73 Print "#DECODESTR(#PC)".
B $CE73,$01 "#DECODE(#PEEK(#PC))".
L $CE73,$01,$01,$02
B $CE74,$01 Terminator.

t $CE75 Messaging: "North Street"
@ $CE75 label=Messaging_NorthStreet
N $CE75 Print "#DECODESTR(#PC)".
B $CE75,$01 "#DECODE(#PEEK(#PC))".
L $CE75,$01,$93,$02
B $CF08,$01 Terminator.

t $CF09 Messaging: "Columbus Avenue"
@ $CF09 label=Messaging_ColumbusAvenue
N $CF09 Print "#DECODESTR(#PC)".
B $CF09,$01 "#DECODE(#PEEK(#PC))".
L $CF09,$01,$45,$02
B $CF4E,$01 Terminator.

t $CF4F Messaging: "Darwin Street"
@ $CF4F label=Messaging_DarwinStreet
N $CF4F Print "#DECODESTR(#PC)".
B $CF4F,$01 "#DECODE(#PEEK(#PC))".
L $CF4F,$01,$AE,$02
B $CFFD,$01 Terminator.

t $CFFE Messaging: "The Lion Enclosure"
@ $CFFE label=Messaging_LionEnclosure
N $CFFE Print "#DECODESTR(#PC)".
B $CFFE,$01 "#DECODE(#PEEK(#PC))".
L $CFFE,$01,$72,$02
B $D070,$01 Terminator.

t $D071 Messaging: "The Monkey Cage"
@ $D071 label=Messaging_MonkeyCage
N $D071 Print "#DECODESTR(#PC)".
B $D071,$01 "#DECODE(#PEEK(#PC))".
L $D071,$01,$4B,$02
B $D0BC,$01 Terminator.

t $D0BD Messaging: "The Elephant House"
@ $D0BD label=Messaging_ElephantHouse
N $D0BD Print "#DECODESTR(#PC)".
B $D0BD,$01 "#DECODE(#PEEK(#PC))".
L $D0BD,$01,$73,$02
B $D130,$01 Terminator.

t $D131 Messaging: "Livingstone Square"
@ $D131 label=Messaging_LivingstoneSquare
N $D131 Print "#DECODESTR(#PC)".
B $D131,$01 "#DECODE(#PEEK(#PC))".
L $D131,$01,$7D,$02
B $D1AE,$01 Terminator.

t $D1AF Messaging: "Legion Parade"
@ $D1AF label=Messaging_LegionParade
N $D1AF Print "#DECODESTR(#PC)".
B $D1AF,$01 "#DECODE(#PEEK(#PC))".
L $D1AF,$01,$6E,$02
B $D21D,$01 Terminator.

t $D21E Messaging: "Parkview Road"
@ $D21E label=Messaging_ParkviewRoad
N $D21E Print "#DECODESTR(#PC)".
B $D21E,$01 "#DECODE(#PEEK(#PC))".
L $D21E,$01,$78,$02
B $D296,$01 Terminator.

t $D297 Messaging: "The Zoo Entrance"
@ $D297 label=Messaging_ZooEntrance
N $D297 Print "#DECODESTR(#PC)".
B $D297,$01 "#DECODE(#PEEK(#PC))".
L $D297,$01,$5B,$02
B $D2F2,$01 Terminator.

t $D2F3 Messaging: "The Park Area"
@ $D2F3 label=Messaging_ParkArea
N $D2F3 Print "#DECODESTR(#PC)".
B $D2F3,$01 "#DECODE(#PEEK(#PC))".
L $D2F3,$01,$A5,$02
B $D398,$01 Terminator.

t $D399 Messaging: "The Insect House"
@ $D399 label=Messaging_InsectHouse
N $D399 Print "#DECODESTR(#PC)".
B $D399,$01 "#DECODE(#PEEK(#PC))".
L $D399,$01,$56,$02
B $D3EF,$01 Terminator.

t $D3F0 Messaging: "Jessop Street"
@ $D3F0 label=Messaging_JessopStreet
N $D3F0 Print "#DECODESTR(#PC)".
B $D3F0,$01 "#DECODE(#PEEK(#PC))".
L $D3F0,$01,$74,$02
B $D464,$01 Terminator.

t $D465 Messaging: "Clarence Square"
@ $D465 label=Messaging_ClarenceSquare
N $D465 Print "#DECODESTR(#PC)".
B $D465,$01 "#DECODE(#PEEK(#PC))".
L $D465,$01,$84,$02
B $D4E9,$01 Terminator.

t $D4EA Messaging: "The Reptile House"
@ $D4EA label=Messaging_ReptileHouse
N $D4EA Print "#DECODESTR(#PC)".
B $D4EA,$01 "#DECODE(#PEEK(#PC))".
L $D4EA,$01,$7F,$02
B $D569,$01 Terminator.

t $D56A Messaging: "The Circus Tent"
@ $D56A label=Messaging_CircusTent
N $D56A Print "#DECODESTR(#PC)".
B $D56A,$01 "#DECODE(#PEEK(#PC))".
L $D56A,$01,$81,$02
B $D5EB,$01 Terminator.

t $D5EC Messaging: "The Bear Cage"
@ $D5EC label=Messaging_BearCage
N $D5EC Print "#DECODESTR(#PC)".
B $D5EC,$01 "#DECODE(#PEEK(#PC))".
L $D5EC,$01,$54,$02
B $D640,$01 Terminator.

t $D641 Messaging: "The Roof Of An Apartment Block"
@ $D641 label=Messaging_ApartmentBlockRoof
N $D641 Print "#DECODESTR(#PC)".
B $D641,$01 "#DECODE(#PEEK(#PC))".
L $D641,$01,$57,$02
B $D698,$01 Terminator.

t $D699 Messaging: "The Parapet"
@ $D699 label=Messaging_Parapet
N $D699 Print "#DECODESTR(#PC)".
B $D699,$01 "#DECODE(#PEEK(#PC))".
L $D699,$01,$61,$02
B $D6FA,$01 Terminator.

t $D6FB Messaging: "The Roof Of The Old Building"
@ $D6FB label=Messaging_OldBuildingRoof
N $D6FB Print "#DECODESTR(#PC)".
B $D6FB,$01 "#DECODE(#PEEK(#PC))".
L $D6FB,$01,$8F,$02
B $D78A,$01 Terminator.

t $D78B Messaging: "Cook Street"
@ $D78B label=Messaging_CookStreet
N $D78B Print "#DECODESTR(#PC)".
B $D78B,$01 "#DECODE(#PEEK(#PC))".
L $D78B,$01,$C1,$02
B $D84C,$01 Terminator.

t $D84D Messaging: "Cook Street Underground Station"
@ $D84D label=Messaging_CookStreetUndergroundStation
N $D84D Print "#DECODESTR(#PC)".
B $D84D,$01 "#DECODE(#PEEK(#PC))".
L $D84D,$01,$92,$02
B $D8DF,$01 Terminator.

t $D8E0 Messaging: "Byron Square Underground Station"
@ $D8E0 label=Messaging_ByronSquareUndergroundStation
N $D8E0 Print "#DECODESTR(#PC)".
B $D8E0,$01 "#DECODE(#PEEK(#PC))".
L $D8E0,$01,$71,$02
B $D951,$01 Terminator.

t $D952 Messaging: "Byron Square"
@ $D952 label=Messaging_ByronSquare
N $D952 Print "#DECODESTR(#PC)".
B $D952,$01 "#DECODE(#PEEK(#PC))".
L $D952,$01,$6B,$02
B $D9BD,$01 Terminator.

t $D9BE Messaging: "Virgil Close"
@ $D9BE label=Messaging_VirgilClose
N $D9BE Print "#DECODESTR(#PC)".
B $D9BE,$01 "#DECODE(#PEEK(#PC))".
L $D9BE,$01,$30,$02
B $D9EE,$01 Terminator.

t $D9EF Messaging: "A Corridor"
@ $D9EF label=Messaging_Corridor
N $D9EF Print "#DECODESTR(#PC)".
B $D9EF,$01 "#DECODE(#PEEK(#PC))".
L $D9EF,$01,$41,$02
B $DA30,$01 Terminator.

t $DA31 Messaging: "The Kitchen"
@ $DA31 label=Messaging_Kitchen
N $DA31 Print "#DECODESTR(#PC)".
B $DA31,$01 "#DECODE(#PEEK(#PC))".
L $DA31,$01,$76,$02
B $DAA7,$01 Terminator.

t $DAA8 Messaging: "Scott Street"
@ $DAA8 label=Messaging_ScottStreet
N $DAA8 Print "#DECODESTR(#PC)".
B $DAA8,$01 "#DECODE(#PEEK(#PC))".
L $DAA8,$01,$9F,$02
B $DB47,$01 Terminator.

t $DB48 Messaging: "The Storm Drain"
@ $DB48 label=Messaging_StormDrain
N $DB48 Print "#DECODESTR(#PC)".
B $DB48,$01 "#DECODE(#PEEK(#PC))".
L $DB48,$01,$89,$02
B $DBD1,$01 Terminator.

t $DBD2 Messaging: "Shakespeare Avenue"
@ $DBD2 label=Messaging_ShakespeareAvenue
N $DBD2 Print "#DECODESTR(#PC)".
B $DBD2,$01 "#DECODE(#PEEK(#PC))".
L $DBD2,$01,$5F,$02
B $DC31,$01 Terminator.

t $DC32 Messaging: "Burns Road"
@ $DC32 label=Messaging_BurnsRoad
N $DC32 Print "#DECODESTR(#PC)".
B $DC32,$01 "#DECODE(#PEEK(#PC))".
L $DC32,$01,$D4,$02
B $DD06,$01 Terminator.

t $DD07 Messaging: "An Apartment Block"
@ $DD07 label=Messaging_ApartmentBlock
N $DD07 Print "#DECODESTR(#PC)".
B $DD07,$01 "#DECODE(#PEEK(#PC))".
L $DD07,$01,$39,$02
B $DD40,$01 Terminator.

t $DD41 Messaging: "The West Wing"
@ $DD41 label=Messaging_WestWing
N $DD41 Print "#DECODESTR(#PC)".
B $DD41,$01 "#DECODE(#PEEK(#PC))".
L $DD41,$01,$20,$02
B $DD61,$01 Terminator.

t $DD62 Messaging: "The Western End Of The Dining Room"
@ $DD62 label=Messaging_DiningRoomWesternEnd
N $DD62 Print "#DECODESTR(#PC)".
B $DD62,$01 "#DECODE(#PEEK(#PC))".
L $DD62,$01,$21,$02
B $DD83,$01 Terminator.

t $DD84 Messaging: "The Eastern End Of The Dining Room"
@ $DD84 label=Messaging_DiningRoomEasternEnd
N $DD84 Print "#DECODESTR(#PC)".
B $DD84,$01 "#DECODE(#PEEK(#PC))".
L $DD84,$01,$5A,$02
B $DDDE,$01 Terminator.

t $DDDF Messaging: "The East Wing"
@ $DDDF label=Messaging_EastWing
N $DDDF Print "#DECODESTR(#PC)".
B $DDDF,$01 "#DECODE(#PEEK(#PC))".
L $DDDF,$01,$48,$02
B $DE27,$01 Terminator.

t $DE28 Messaging: "Royal Street"
@ $DE28 label=Messaging_RoyalStreet
N $DE28 Print "#DECODESTR(#PC)".
B $DE28,$01 "#DECODE(#PEEK(#PC))".
L $DE28,$01,$A6,$02
B $DECE,$01 Terminator.

t $DECF Messaging: "Manor Drive"
@ $DECF label=Messaging_ManorDrive
N $DECF Print "#DECODESTR(#PC)".
B $DECF,$01 "#DECODE(#PEEK(#PC))".
L $DECF,$01,$63,$02
B $DF32,$01 Terminator.

t $DF33 Messaging: "Waste Ground"
@ $DF33 label=Messaging_WasteGround
N $DF33 Print "#DECODESTR(#PC)".
B $DF33,$01 "#DECODE(#PEEK(#PC))".
L $DF33,$01,$46,$02
B $DF79,$01 Terminator.

t $DF7A Messaging: "The Filling Station"
@ $DF7A label=Messaging_FillingStation
N $DF7A Print "#DECODESTR(#PC)".
B $DF7A,$01 "#DECODE(#PEEK(#PC))".
L $DF7A,$01,$83,$02
B $DFFD,$01 Terminator.

t $DFFE Messaging: "East Street"
@ $DFFE label=Messaging_EastStreet
N $DFFE Print "#DECODESTR(#PC)".
B $DFFE,$01 "#DECODE(#PEEK(#PC))".
L $DFFE,$01,$6F,$02
B $E06D,$01 Terminator.

t $E06E Messaging: "Castle Road"
@ $E06E label=Messaging_CastleRoad
N $E06E Print "#DECODESTR(#PC)".
B $E06E,$01 "#DECODE(#PEEK(#PC))".
L $E06E,$01,$4B,$02
B $E0B9,$01 Terminator.

t $E0BA Messaging: "The Desert Road"
@ $E0BA label=Messaging_DesertRoad
N $E0BA Print "#DECODESTR(#PC)".
B $E0BA,$01 "#DECODE(#PEEK(#PC))".
L $E0BA,$01,$95,$02
B $E14F,$01 Terminator.

t $E150 Messaging: "The Gatehouse"
@ $E150 label=Messaging_TheGatehouse
N $E150 Print "#DECODESTR(#PC)".
B $E150,$01 "#DECODE(#PEEK(#PC))".
L $E150,$01,$2E,$02
B $E17E,$01 Terminator.

t $E17F Messaging: "The Hallway Of A Derelict House"
@ $E17F label=Messaging_DerelictHouseHallway
N $E17F Print "#DECODESTR(#PC)".
B $E17F,$01 "#DECODE(#PEEK(#PC))".
L $E17F,$01,$45,$02
B $E1C4,$01 Terminator.

t $E1C5 Messaging: "An Overgrown Garden"
@ $E1C5 label=Messaging_OvergrownGarden
N $E1C5 Print "#DECODESTR(#PC)".
B $E1C5,$01 "#DECODE(#PEEK(#PC))".
L $E1C5,$01,$7A,$02
B $E23F,$01 Terminator.

t $E240 Messaging: "Kings Close"
@ $E240 label=Messaging_KingsClose
N $E240 Print "#DECODESTR(#PC)".
B $E240,$01 "#DECODE(#PEEK(#PC))".
L $E240,$01,$B4,$02
B $E2F4,$01 Terminator.

t $E2F5 Messaging: "South Way"
@ $E2F5 label=Messaging_SouthWay
N $E2F5 Print "#DECODESTR(#PC)".
B $E2F5,$01 "#DECODE(#PEEK(#PC))".
L $E2F5,$01,$D1,$02
B $E3C6,$01 Terminator.

t $E3C7 Messaging: "The Western Office"
@ $E3C7 label=Messaging_WesternOffice
N $E3C7 Print "#DECODESTR(#PC)".
B $E3C7,$01 "#DECODE(#PEEK(#PC))".
L $E3C7,$01,$37,$02
B $E3FE,$01 Terminator.

t $E3FF Messaging: "A Corridor"
@ $E3FF label=Messaging__Corridor
N $E3FF Print "#DECODESTR(#PC)".
B $E3FF,$01 "#DECODE(#PEEK(#PC))".
L $E3FF,$01,$13,$02
B $E412,$01 Terminator.

t $E413 Messaging: "The Reception Area"
@ $E413 label=Messaging_ReceptionArea
N $E413 Print "#DECODESTR(#PC)".
B $E413,$01 "#DECODE(#PEEK(#PC))".
L $E413,$01,$5F,$02
B $E472,$01 Terminator.

t $E473 Messaging: "A Corridor"
@ $E473 label=Messaging_CorridorOfficesAtEasternEnd
N $E473 Print "#DECODESTR(#PC)".
B $E473,$01 "#DECODE(#PEEK(#PC))".
L $E473,$01,$1C,$02
B $E48F,$01 Terminator.

t $E490 Messaging: "The Eastern Office"
@ $E490 label=Messaging_EasternOffice
N $E490 Print "#DECODESTR(#PC)".
B $E490,$01 "#DECODE(#PEEK(#PC))".
L $E490,$01,$4C,$02
B $E4DC,$01 Terminator.

t $E4DD Messaging: "South Way"
@ $E4DD label=Messaging__SouthWay
N $E4DD Print "#DECODESTR(#PC)".
B $E4DD,$01 "#DECODE(#PEEK(#PC))".
L $E4DD,$01,$7D,$02
B $E55A,$01 Terminator.

t $E55B Messaging: "The Control Room"
@ $E55B label=Messaging_ControlRoom
N $E55B Print "#DECODESTR(#PC)".
B $E55B,$01 "#DECODE(#PEEK(#PC))".
L $E55B,$01,$E9,$02
B $E644,$01 Terminator.

t $E645 Messaging: "The Maintenance Area"
@ $E645 label=Messaging_MaintenanceArea
N $E645 Print "#DECODESTR(#PC)".
B $E645,$01 "#DECODE(#PEEK(#PC))".
L $E645,$01,$88,$02
B $E6CD,$01 Terminator.

t $E6CE Messaging: "Cactus Drive"
@ $E6CE label=Messaging_CactusDrive
N $E6CE Print "#DECODESTR(#PC)".
B $E6CE,$01 "#DECODE(#PEEK(#PC))".
L $E6CE,$01,$2E,$02
B $E6FC,$01 Terminator.

t $E6FD Messaging: "The Reactor Service Corridor"
@ $E6FD label=Messaging_ReactorServiceCorridor
N $E6FD Print "#DECODESTR(#PC)".
B $E6FD,$01 "#DECODE(#PEEK(#PC))".
L $E6FD,$01,$65,$02
B $E762,$01 Terminator.

t $E763 Messaging: "The Reactor Room"
@ $E763 label=Messaging_ReactorRoom
N $E763 Print "#DECODESTR(#PC)".
B $E763,$01 "#DECODE(#PEEK(#PC))".
L $E763,$01,$B4,$02
B $E817,$01 Terminator.

t $E818 Messaging: "A Corridor"
@ $E818 label=Messaging_CorridorMaintenanceAccess
N $E818 Print "#DECODESTR(#PC)".
B $E818,$01 "#DECODE(#PEEK(#PC))".
L $E818,$01,$2F,$02
B $E847,$01 Terminator.

t $E848 Messaging: "The Storage Yard"
@ $E848 label=Messaging_StorageYard
N $E848 Print "#DECODESTR(#PC)".
B $E848,$01 "#DECODE(#PEEK(#PC))".
L $E848,$01,$38,$02
B $E880,$01 Terminator.

t $E881 Messaging: "Congratulations!!!"
@ $E881 label=Messaging_Congratulations
N $E881 Print "#DECODESTR(#PC)".
B $E881,$01 "#DECODE(#PEEK(#PC))".
L $E881,$01,$BC,$02
B $E93D,$01 Terminator.

t $E93E Messaging: "The Office Roof"
@ $E93E label=Messaging_OfficeRoof
N $E93E Print "#DECODESTR(#PC)".
B $E93E,$01 "#DECODE(#PEEK(#PC))".
L $E93E,$01,$7B,$02
B $E9B9,$01 Terminator.

t $E9BA Messaging: "The Top Of The Lift Shaft"
@ $E9BA label=Messaging_LiftShaftTop
N $E9BA Print "#DECODESTR(#PC)".
B $E9BA,$01 "#DECODE(#PEEK(#PC))".
L $E9BA,$01,$33,$02
B $E9ED,$01 Terminator.

t $E9EE Messaging: "The Stairs"
@ $E9EE label=Messaging_Stairs
N $E9EE Print "#DECODESTR(#PC)".
B $E9EE,$01 "#DECODE(#PEEK(#PC))".
L $E9EE,$01,$2F,$02
B $EA1D,$01 Terminator.

t $EA1E Messaging: "The Stairwell"
@ $EA1E label=Messaging_Stairwell
N $EA1E Print "#DECODESTR(#PC)".
B $EA1E,$01 "#DECODE(#PEEK(#PC))".
L $EA1E,$01,$4F,$02
B $EA6D,$01 Terminator.

t $EA6E Messaging: "On Top Of A Lift"
@ $EA6E label=Messaging_TopOfLift
N $EA6E Print "#DECODESTR(#PC)".
B $EA6E,$01 "#DECODE(#PEEK(#PC))".
L $EA6E,$01,$66,$02
B $EAD4,$01 Terminator.

t $EAD5 Messaging: "Your Office"
@ $EAD5 label=Messaging_YourOffice
N $EAD5 Print "#DECODESTR(#PC)".
B $EAD5,$01 "#DECODE(#PEEK(#PC))".
L $EAD5,$01,$E4,$02
B $EBB9,$01 Terminator.

t $EBBA Messaging: "The Main Office"
@ $EBBA label=Messaging_MainOffice
N $EBBA Print "#DECODESTR(#PC)".
B $EBBA,$01 "#DECODE(#PEEK(#PC))".
L $EBBA,$01,$5E,$02
B $EC18,$01 Terminator.

t $EC19 Messaging: "The Lift"
@ $EC19 label=Messaging_TheLift
N $EC19 Print "#DECODESTR(#PC)".
B $EC19,$01 "#DECODE(#PEEK(#PC))".
L $EC19,$01,$87,$02
B $ECA0,$01 Terminator.

t $ECA1 Messaging: "The Bottom Of The Lift Shaft"
@ $ECA1 label=Messaging_LiftShaftBottom
N $ECA1 Print "#DECODESTR(#PC)".
B $ECA1,$01 "#DECODE(#PEEK(#PC))".
L $ECA1,$01,$3F,$02
B $ECE0,$01 Terminator.

t $ECE1 Messaging: "An Alley"
@ $ECE1 label=Messaging_Alley
N $ECE1 Print "#DECODESTR(#PC)".
B $ECE1,$01 "#DECODE(#PEEK(#PC))".
L $ECE1,$01,$32,$02
B $ED13,$01 Terminator.

t $ED14 Messaging: "The Washroom"
@ $ED14 label=Messaging_Washroom
N $ED14 Print "#DECODESTR(#PC)".
B $ED14,$01 "#DECODE(#PEEK(#PC))".
L $ED14,$01,$55,$02
B $ED69,$01 Terminator.

t $ED6A Messaging: "The Utility Room"
@ $ED6A label=Messaging_UtilityRoom
N $ED6A Print "#DECODESTR(#PC)".
B $ED6A,$01 "#DECODE(#PEEK(#PC))".
L $ED6A,$01,$55,$02
B $EDBF,$01 Terminator.

t $EDC0 Messaging: "The Basement"
@ $EDC0 label=Messaging_Basement
N $EDC0 Print "#DECODESTR(#PC)".
B $EDC0,$01 "#DECODE(#PEEK(#PC))".
L $EDC0,$01,$25,$02
B $EDE5,$01 Terminator.

t $EDE6 Messaging: "The Service Tunnel"
@ $EDE6 label=Messaging_ServiceTunnel
N $EDE6 Print "#DECODESTR(#PC)".
B $EDE6,$01 "#DECODE(#PEEK(#PC))".
L $EDE6,$01,$56,$02
B $EE3C,$01 Terminator.

t $EE3D Messaging: "The Service Tunnel"
@ $EE3D label=Messaging_ServiceTunnelEasternEnd
N $EE3D Print "#DECODESTR(#PC)".
B $EE3D,$01 "#DECODE(#PEEK(#PC))".
L $EE3D,$01,$2E,$02
B $EE6B,$01 Terminator.

t $EE6C Messaging: "The Sewer"
@ $EE6C label=Messaging_Sewer
N $EE6C Print "#DECODESTR(#PC)".
B $EE6C,$01 "#DECODE(#PEEK(#PC))".
L $EE6C,$01,$37,$02
B $EEA3,$01 Terminator.

t $EEA4 Messaging: "Inside The Kiosk"
@ $EEA4 label=Messaging_InsideKiosk
N $EEA4 Print "#DECODESTR(#PC)".
B $EEA4,$01 "#DECODE(#PEEK(#PC))".
L $EEA4,$01,$55,$02
B $EEF9,$01 Terminator.

t $EEFA Messaging: ""
N $EEFA Print "#DECODESTR(#PC)".
B $EEFA,$01 "#DECODE(#PEEK(#PC))".
L $EEFA,$01,$01,$02
B $EEFB,$01 Terminator.

t $EEFC Messaging: ""
N $EEFC Print "#DECODESTR(#PC)".
B $EEFC,$01 "#DECODE(#PEEK(#PC))".
L $EEFC,$01,$01,$02
B $EEFD,$01 Terminator.

t $EEFE Messaging: ""
N $EEFE Print "#DECODESTR(#PC)".
B $EEFE,$01 "#DECODE(#PEEK(#PC))".
L $EEFE,$01,$01,$02
B $EEFF,$01 Terminator.

t $EF00 Messaging: ""
N $EF00 Print "#DECODESTR(#PC)".
B $EF00,$01 "#DECODE(#PEEK(#PC))".
L $EF00,$01,$01,$02
B $EF01,$01 Terminator.

t $EF02 Messaging: ""
N $EF02 Print "#DECODESTR(#PC)".
B $EF02,$01 "#DECODE(#PEEK(#PC))".
L $EF02,$01,$01,$02
B $EF03,$01 Terminator.

t $EF04 Messaging: ""
N $EF04 Print "#DECODESTR(#PC)".
B $EF04,$01 "#DECODE(#PEEK(#PC))".
L $EF04,$01,$01,$02
B $EF05,$01 Terminator.

t $EF06 Messaging: "A Plate"
@ $EF06 label=Messaging_Plate
N $EF06 Print "#DECODESTR(#PC)".
B $EF06,$01 "#DECODE(#PEEK(#PC))".
L $EF06,$01,$05,$02
B $EF0B,$01 Terminator.

t $EF0C Messaging: "A Diamond"
@ $EF0C label=Messaging_Diamond
N $EF0C Print "#DECODESTR(#PC)".
B $EF0C,$01 "#DECODE(#PEEK(#PC))".
L $EF0C,$01,$06,$02
B $EF12,$01 Terminator.

t $EF13 Messaging: "Any Bodies"
@ $EF13 label=Messaging_AnyBodies
N $EF13 Print "#DECODESTR(#PC)".
B $EF13,$01 "#DECODE(#PEEK(#PC))".
L $EF13,$01,$05,$02
B $EF18,$01 Terminator.

t $EF19 Messaging: "A Tanker"
@ $EF19 label=Messaging_Tanker
N $EF19 Print "#DECODESTR(#PC)".
B $EF19,$01 "#DECODE(#PEEK(#PC))".
L $EF19,$01,$05,$02
B $EF1E,$01 Terminator.

t $EF1F Messaging: "Any Oil"
@ $EF1F label=Messaging_AnyOil
N $EF1F Print "#DECODESTR(#PC)".
B $EF1F,$01 "#DECODE(#PEEK(#PC))".
L $EF1F,$01,$03,$02
B $EF22,$01 Terminator.

t $EF23 Messaging: "Any Lions"
@ $EF23 label=Messaging_AnyLions
N $EF23 Print "#DECODESTR(#PC)".
B $EF23,$01 "#DECODE(#PEEK(#PC))".
L $EF23,$01,$04,$02
B $EF27,$01 Terminator.

t $EF28 Messaging: "A Cage"
@ $EF28 label=Messaging_Cage
N $EF28 Print "#DECODESTR(#PC)".
B $EF28,$01 "#DECODE(#PEEK(#PC))".
L $EF28,$01,$04,$02
B $EF2C,$01 Terminator.

t $EF2D Messaging: "A Monkey"
@ $EF2D label=Messaging_Monkey
N $EF2D Print "#DECODESTR(#PC)".
B $EF2D,$01 "#DECODE(#PEEK(#PC))".
L $EF2D,$01,$05,$02
B $EF32,$01 Terminator.

t $EF33 Messaging: "Any Fruit"
@ $EF33 label=Messaging_AnyFruit
N $EF33 Print "#DECODESTR(#PC)".
B $EF33,$01 "#DECODE(#PEEK(#PC))".
L $EF33,$01,$04,$02
B $EF37,$01 Terminator.

t $EF38 Messaging: "Any Meat"
@ $EF38 label=Messaging_AnyMeat
N $EF38 Print "#DECODESTR(#PC)".
B $EF38,$01 "#DECODE(#PEEK(#PC))".
L $EF38,$01,$04,$02
B $EF3C,$01 Terminator.

t $EF3D Messaging: "A Shop"
@ $EF3D label=Messaging_Shop
N $EF3D Print "#DECODESTR(#PC)".
B $EF3D,$01 "#DECODE(#PEEK(#PC))".
L $EF3D,$01,$03,$02
B $EF40,$01 Terminator.

t $EF41 Messaging: "A Television"
@ $EF41 label=Messaging_Television
N $EF41 Print "#DECODESTR(#PC)".
B $EF41,$01 "#DECODE(#PEEK(#PC))".
L $EF41,$01,$06,$02
B $EF47,$01 Terminator.

t $EF48 Messaging: "A Gate"
@ $EF48 label=Messaging_Gate
N $EF48 Print "#DECODESTR(#PC)".
B $EF48,$01 "#DECODE(#PEEK(#PC))".
L $EF48,$01,$04,$02
B $EF4C,$01 Terminator.

t $EF4D Messaging: "A Bin"
@ $EF4D label=Messaging_Bin
N $EF4D Print "#DECODESTR(#PC)".
B $EF4D,$01 "#DECODE(#PEEK(#PC))".
L $EF4D,$01,$03,$02
B $EF50,$01 Terminator.

t $EF51 Messaging: "A Bottle"
@ $EF51 label=Messaging_Bottle
N $EF51 Print "#DECODESTR(#PC)".
B $EF51,$01 "#DECODE(#PEEK(#PC))".
L $EF51,$01,$05,$02
B $EF56,$01 Terminator.

t $EF57 Messaging: "Any Insects"
@ $EF57 label=Messaging_AnyInsects
N $EF57 Print "#DECODESTR(#PC)".
B $EF57,$01 "#DECODE(#PEEK(#PC))".
L $EF57,$01,$05,$02
B $EF5C,$01 Terminator.

t $EF5D Messaging: "A Car"
@ $EF5D label=Messaging_Car
N $EF5D Print "#DECODESTR(#PC)".
B $EF5D,$01 "#DECODE(#PEEK(#PC))".
L $EF5D,$01,$02,$02
B $EF5F,$01 Terminator.

t $EF60 Messaging: "A Stick"
@ $EF60 label=Messaging_Stick
N $EF60 Print "#DECODESTR(#PC)".
B $EF60,$01 "#DECODE(#PEEK(#PC))".
L $EF60,$01,$04,$02
B $EF64,$01 Terminator.

t $EF65 Messaging: "A Statue"
@ $EF65 label=Messaging_Statue
N $EF65 Print "#DECODESTR(#PC)".
B $EF65,$01 "#DECODE(#PEEK(#PC))".
L $EF65,$01,$05,$02
B $EF6A,$01 Terminator.

t $EF6B Messaging: "An Alligator"
@ $EF6B label=Messaging_Alligator
N $EF6B Print "#DECODESTR(#PC)".
B $EF6B,$01 "#DECODE(#PEEK(#PC))".
L $EF6B,$01,$06,$02
B $EF71,$01 Terminator.

t $EF72 Messaging: "A Tent"
@ $EF72 label=Messaging_Tent
N $EF72 Print "#DECODESTR(#PC)".
B $EF72,$01 "#DECODE(#PEEK(#PC))".
L $EF72,$01,$03,$02
B $EF75,$01 Terminator.

t $EF76 Messaging: "A Bear"
@ $EF76 label=Messaging_Bear
N $EF76 Print "#DECODESTR(#PC)".
B $EF76,$01 "#DECODE(#PEEK(#PC))".
L $EF76,$01,$03,$02
B $EF79,$01 Terminator.

t $EF7A Messaging: "An Elephant"
@ $EF7A label=Messaging_Elephant
N $EF7A Print "#DECODESTR(#PC)".
B $EF7A,$01 "#DECODE(#PEEK(#PC))".
L $EF7A,$01,$07,$02
B $EF81,$01 Terminator.

t $EF82 Messaging: "A Ramp"
@ $EF82 label=Messaging_Ramp
N $EF82 Print "#DECODESTR(#PC)".
B $EF82,$01 "#DECODE(#PEEK(#PC))".
L $EF82,$01,$04,$02
B $EF86,$01 Terminator.

t $EF87 Messaging: "A Parapet"
@ $EF87 label=Messaging__Parapet
N $EF87 Print "#DECODESTR(#PC)".
B $EF87,$01 "#DECODE(#PEEK(#PC))".
L $EF87,$01,$04,$02
B $EF8B,$01 Terminator.

t $EF8C Messaging: "A Roof"
@ $EF8C label=Messaging_Roof
N $EF8C Print "#DECODESTR(#PC)".
B $EF8C,$01 "#DECODE(#PEEK(#PC))".
L $EF8C,$01,$03,$02
B $EF8F,$01 Terminator.

t $EF90 Messaging: "Any Stairs"
@ $EF90 label=Messaging_AnyStairs
N $EF90 Print "#DECODESTR(#PC)".
B $EF90,$01 "#DECODE(#PEEK(#PC))".
L $EF90,$01,$05,$02
B $EF95,$01 Terminator.

t $EF96 Messaging: "A Nail"
@ $EF96 label=Messaging_Nail
N $EF96 Print "#DECODESTR(#PC)".
B $EF96,$01 "#DECODE(#PEEK(#PC))".
L $EF96,$01,$04,$02
B $EF9A,$01 Terminator.

t $EF9B Messaging: "A Cap"
@ $EF9B label=Messaging_Cap
N $EF9B Print "#DECODESTR(#PC)".
B $EF9B,$01 "#DECODE(#PEEK(#PC))".
L $EF9B,$01,$03,$02
B $EF9E,$01 Terminator.

t $EF9F Messaging: "A Trumpet"
@ $EF9F label=Messaging_Trumpet
N $EF9F Print "#DECODESTR(#PC)".
B $EF9F,$01 "#DECODE(#PEEK(#PC))".
L $EF9F,$01,$05,$02
B $EFA4,$01 Terminator.

t $EFA5 Messaging: "Any Adverts"
@ $EFA5 label=Messaging_Adverts
N $EFA5 Print "#DECODESTR(#PC)".
B $EFA5,$01 "#DECODE(#PEEK(#PC))".
L $EFA5,$01,$05,$02
B $EFAA,$01 Terminator.

t $EFAB Messaging: "A Tunnel"
@ $EFAB label=Messaging_Tunnel
N $EFAB Print "#DECODESTR(#PC)".
B $EFAB,$01 "#DECODE(#PEEK(#PC))".
L $EFAB,$01,$05,$02
B $EFB0,$01 Terminator.

t $EFB1 Messaging: "Any Water"
@ $EFB1 label=Messaging_Water
N $EFB1 Print "#DECODESTR(#PC)".
B $EFB1,$01 "#DECODE(#PEEK(#PC))".
L $EFB1,$01,$04,$02
B $EFB5,$01 Terminator.

t $EFB6 Messaging: "Any Graffiti"
@ $EFB6 label=Messaging_Graffiti
N $EFB6 Print "#DECODESTR(#PC)".
B $EFB6,$01 "#DECODE(#PEEK(#PC))".
L $EFB6,$01,$07,$02
B $EFBD,$01 Terminator.

t $EFBE Messaging: "A Ticket"
@ $EFBE label=Messaging_Ticket
N $EFBE Print "#DECODESTR(#PC)".
B $EFBE,$01 "#DECODE(#PEEK(#PC))".
L $EFBE,$01,$05,$02
B $EFC3,$01 Terminator.

t $EFC4 Messaging: "A Ladder"
@ $EFC4 label=Messaging_Ladder
N $EFC4 Print "#DECODESTR(#PC)".
B $EFC4,$01 "#DECODE(#PEEK(#PC))".
L $EFC4,$01,$05,$02
B $EFC9,$01 Terminator.

t $EFCA Messaging: "A Doll"
@ $EFCA label=Messaging_Doll
N $EFCA Print "#DECODESTR(#PC)".
B $EFCA,$01 "#DECODE(#PEEK(#PC))".
L $EFCA,$01,$04,$02
B $EFCE,$01 Terminator.

t $EFCF Messaging: "A Garden"
@ $EFCF label=Messaging_Garden
N $EFCF Print "#DECODESTR(#PC)".
B $EFCF,$01 "#DECODE(#PEEK(#PC))".
L $EFCF,$01,$04,$02
B $EFD3,$01 Terminator.

t $EFD4 Messaging: "Any Soldiers"
@ $EFD4 label=Messaging_Soldiers
N $EFD4 Print "#DECODESTR(#PC)".
B $EFD4,$01 "#DECODE(#PEEK(#PC))".
L $EFD4,$01,$07,$02
B $EFDB,$01 Terminator.

t $EFDC Messaging: "Any Looters"
@ $EFDC label=Messaging_Looters
N $EFDC Print "#DECODESTR(#PC)".
B $EFDC,$01 "#DECODE(#PEEK(#PC))".
L $EFDC,$01,$05,$02
B $EFE1,$01 Terminator.

t $EFE2 Messaging: "Any Rubble"
@ $EFE2 label=Messaging_Rubble
N $EFE2 Print "#DECODESTR(#PC)".
B $EFE2,$01 "#DECODE(#PEEK(#PC))".
L $EFE2,$01,$05,$02
B $EFE7,$01 Terminator.

t $EFE8 Messaging: "A Kiosk"
@ $EFE8 label=Messaging_Kiosk
N $EFE8 Print "#DECODESTR(#PC)".
B $EFE8,$01 "#DECODE(#PEEK(#PC))".
L $EFE8,$01,$06,$02
B $EFEE,$01 Terminator.

t $EFEF Messaging: "Any Petrol"
@ $EFEF label=Messaging_Petrol
N $EFEF Print "#DECODESTR(#PC)".
B $EFEF,$01 "#DECODE(#PEEK(#PC))".
L $EFEF,$01,$05,$02
B $EFF4,$01 Terminator.

t $EFF5 Messaging: "The Desert"
@ $EFF5 label=Messaging_Desert
N $EFF5 Print "#DECODESTR(#PC)".
B $EFF5,$01 "#DECODE(#PEEK(#PC))".
L $EFF5,$01,$05,$02
B $EFFA,$01 Terminator.

t $EFFB Messaging: "Any Tumbleweed"
@ $EFFB label=Messaging_Tumbleweed
N $EFFB Print "#DECODESTR(#PC)".
B $EFFB,$01 "#DECODE(#PEEK(#PC))".
L $EFFB,$01,$09,$02
B $F004,$01 Terminator.

t $F005 Messaging: "A Horse"
@ $F005 label=Messaging_Horse
N $F005 Print "#DECODESTR(#PC)".
B $F005,$01 "#DECODE(#PEEK(#PC))".
L $F005,$01,$04,$02
B $F009,$01 Terminator.

t $F00A Messaging: "A Swing"
@ $F00A label=Messaging_Swing
N $F00A Print "#DECODESTR(#PC)".
B $F00A,$01 "#DECODE(#PEEK(#PC))".
L $F00A,$01,$04,$02
B $F00E,$01 Terminator.

t $F00F Messaging: "A Beam"
@ $F00F label=Messaging_Beam
N $F00F Print "#DECODESTR(#PC)".
B $F00F,$01 "#DECODE(#PEEK(#PC))".
L $F00F,$01,$03,$02
B $F012,$01 Terminator.

t $F013 Messaging: "A Door"
@ $F013 label=Messaging_Door
N $F013 Print "#DECODESTR(#PC)".
B $F013,$01 "#DECODE(#PEEK(#PC))".
L $F013,$01,$04,$02
B $F017,$01 Terminator.

t $F018 Messaging: "Any Trees"
@ $F018 label=Messaging_Trees
N $F018 Print "#DECODESTR(#PC)".
B $F018,$01 "#DECODE(#PEEK(#PC))".
L $F018,$01,$04,$02
B $F01C,$01 Terminator.

t $F01D Messaging: "Any Weeds"
@ $F01D label=Messaging_Weeds
N $F01D Print "#DECODESTR(#PC)".
B $F01D,$01 "#DECODE(#PEEK(#PC))".
L $F01D,$01,$05,$02
B $F022,$01 Terminator.

t $F023 Messaging: "A Wall"
@ $F023 label=Messaging_Wall
N $F023 Print "#DECODESTR(#PC)".
B $F023,$01 "#DECODE(#PEEK(#PC))".
L $F023,$01,$03,$02
B $F026,$01 Terminator.

t $F027 Messaging: "A Chasm"
@ $F027 label=Messaging_Chasm
N $F027 Print "#DECODESTR(#PC)".
B $F027,$01 "#DECODE(#PEEK(#PC))".
L $F027,$01,$04,$02
B $F02B,$01 Terminator.

t $F02C Messaging: "A Key"
@ $F02C label=Messaging_Key
N $F02C Print "#DECODESTR(#PC)".
B $F02C,$01 "#DECODE(#PEEK(#PC))".
L $F02C,$01,$03,$02
B $F02F,$01 Terminator.

t $F030 Messaging: "A Desk"
@ $F030 label=Messaging_Desk
N $F030 Print "#DECODESTR(#PC)".
B $F030,$01 "#DECODE(#PEEK(#PC))".
L $F030,$01,$04,$02
B $F034,$01 Terminator.

t $F035 Messaging: "A Chair"
@ $F035 label=Messaging_Chair
N $F035 Print "#DECODESTR(#PC)".
B $F035,$01 "#DECODE(#PEEK(#PC))".
L $F035,$01,$04,$02
B $F039,$01 Terminator.

t $F03A Messaging: "A Display"
@ $F03A label=Messaging_Display
N $F03A Print "#DECODESTR(#PC)".
B $F03A,$01 "#DECODE(#PEEK(#PC))".
L $F03A,$01,$06,$02
B $F040,$01 Terminator.

t $F041 Messaging: "A Siren"
@ $F041 label=Messaging_Siren
N $F041 Print "#DECODESTR(#PC)".
B $F041,$01 "#DECODE(#PEEK(#PC))".
L $F041,$01,$04,$02
B $F045,$01 Terminator.

t $F046 Messaging: "A Button"
@ $F046 label=Messaging_Button
N $F046 Print "#DECODESTR(#PC)".
B $F046,$01 "#DECODE(#PEEK(#PC))".
L $F046,$01,$05,$02
B $F04B,$01 Terminator.

t $F04C Messaging: "A Valve"
@ $F04C label=Messaging_Valve
N $F04C Print "#DECODESTR(#PC)".
B $F04C,$01 "#DECODE(#PEEK(#PC))".
L $F04C,$01,$04,$02
B $F050,$01 Terminator.

t $F051 Messaging: "Any Wires"
@ $F051 label=Messaging_Wires
N $F051 Print "#DECODESTR(#PC)".
B $F051,$01 "#DECODE(#PEEK(#PC))".
L $F051,$01,$04,$02
B $F055,$01 Terminator.

t $F056 Messaging: "A Pipe"
@ $F056 label=Messaging_Pipe
N $F056 Print "#DECODESTR(#PC)".
B $F056,$01 "#DECODE(#PEEK(#PC))".
L $F056,$01,$05,$02
B $F05B,$01 Terminator.

t $F05C Messaging: "A Screwdriver"
@ $F05C label=Messaging_Screwdriver
N $F05C Print "#DECODESTR(#PC)".
B $F05C,$01 "#DECODE(#PEEK(#PC))".
L $F05C,$01,$08,$02
B $F064,$01 Terminator.

t $F065 Messaging: "A Fire"
@ $F065 label=Messaging_Fire
N $F065 Print "#DECODESTR(#PC)".
B $F065,$01 "#DECODE(#PEEK(#PC))".
L $F065,$01,$03,$02
B $F068,$01 Terminator.

t $F069 Messaging: "A Lift"
@ $F069 label=Messaging_Lift
N $F069 Print "#DECODESTR(#PC)".
B $F069,$01 "#DECODE(#PEEK(#PC))".
L $F069,$01,$03,$02
B $F06C,$01 Terminator.

t $F06D Messaging: "A Pen"
@ $F06D label=Messaging_Pen
N $F06D Print "#DECODESTR(#PC)".
B $F06D,$01 "#DECODE(#PEEK(#PC))".
L $F06D,$01,$03,$02
B $F070,$01 Terminator.

t $F071 Messaging: "A Radio"
@ $F071 label=Messaging_Radio
N $F071 Print "#DECODESTR(#PC)".
B $F071,$01 "#DECODE(#PEEK(#PC))".
L $F071,$01,$05,$02
B $F076,$01 Terminator.

t $F077 Messaging: "A Panel"
@ $F077 label=Messaging_Panel
N $F077 Print "#DECODESTR(#PC)".
B $F077,$01 "#DECODE(#PEEK(#PC))".
L $F077,$01,$04,$02
B $F07B,$01 Terminator.

t $F07C Messaging: "The Ceiling"
@ $F07C label=Messaging_Ceiling
N $F07C Print "#DECODESTR(#PC)".
B $F07C,$01 "#DECODE(#PEEK(#PC))".
L $F07C,$01,$05,$02
B $F081,$01 Terminator.

t $F082 Messaging: "A Basin"
@ $F082 label=Messaging_Basin
N $F082 Print "#DECODESTR(#PC)".
B $F082,$01 "#DECODE(#PEEK(#PC))".
L $F082,$01,$04,$02
B $F086,$01 Terminator.

t $F087 Messaging: "A Mirror"
@ $F087 label=Messaging_Mirror
N $F087 Print "#DECODESTR(#PC)".
B $F087,$01 "#DECODE(#PEEK(#PC))".
L $F087,$01,$05,$02
B $F08C,$01 Terminator.

t $F08D Messaging: "A Workbench"
@ $F08D label=Messaging_Workbench
N $F08D Print "#DECODESTR(#PC)".
B $F08D,$01 "#DECODE(#PEEK(#PC))".
L $F08D,$01,$07,$02
B $F094,$01 Terminator.

t $F095 Messaging: "A Pickaxe"
@ $F095 label=Messaging_Pickaxe
N $F095 Print "#DECODESTR(#PC)".
B $F095,$01 "#DECODE(#PEEK(#PC))".
L $F095,$01,$07,$02
B $F09C,$01 Terminator.

t $F09D Messaging: "A Torch"
@ $F09D label=Messaging_Torch
N $F09D Print "#DECODESTR(#PC)".
B $F09D,$01 "#DECODE(#PEEK(#PC))".
L $F09D,$01,$04,$02
B $F0A1,$01 Terminator.

t $F0A2 Messaging: "Any Tissues"
@ $F0A2 label=Messaging_AnyTissues
N $F0A2 Print "#DECODESTR(#PC)".
B $F0A2,$01 "#DECODE(#PEEK(#PC))".
L $F0A2,$01,$05,$02
B $F0A7,$01 Terminator.

t $F0A8 Messaging: "An Isolator"
@ $F0A8 label=Messaging_Isolator
N $F0A8 Print "#DECODESTR(#PC)".
B $F0A8,$01 "#DECODE(#PEEK(#PC))".
L $F0A8,$01,$05,$02
B $F0AD,$01 Terminator.

t $F0AE Messaging: "Any Cables"
@ $F0AE label=Messaging_AnyCables
N $F0AE Print "#DECODESTR(#PC)".
B $F0AE,$01 "#DECODE(#PEEK(#PC))".
L $F0AE,$01,$05,$02
B $F0B3,$01 Terminator.

t $F0B4 Messaging: "A Handle"
@ $F0B4 label=Messaging_Handle
N $F0B4 Print "#DECODESTR(#PC)".
B $F0B4,$01 "#DECODE(#PEEK(#PC))".
L $F0B4,$01,$04,$02
B $F0B8,$01 Terminator.

t $F0B9 Messaging: "A Shaft"
@ $F0B9 label=Messaging_Shaft
N $F0B9 Print "#DECODESTR(#PC)".
B $F0B9,$01 "#DECODE(#PEEK(#PC))".
L $F0B9,$01,$04,$02
B $F0BD,$01 Terminator.

t $F0BE Messaging: "A Sluice"
@ $F0BE label=Messaging_Sluice
N $F0BE Print "#DECODESTR(#PC)".
B $F0BE,$01 "#DECODE(#PEEK(#PC))".
L $F0BE,$01,$05,$02
B $F0C3,$01 Terminator.

t $F0C4 Messaging: "Any Sweets"
@ $F0C4 label=Messaging_AnySweets
N $F0C4 Print "#DECODESTR(#PC)".
B $F0C4,$01 "#DECODE(#PEEK(#PC))".
L $F0C4,$01,$06,$02
B $F0CA,$01 Terminator.

t $F0CB Messaging: "An Ambulance"
@ $F0CB label=Messaging_Ambulance
N $F0CB Print "#DECODESTR(#PC)".
B $F0CB,$01 "#DECODE(#PEEK(#PC))".
L $F0CB,$01,$06,$02
B $F0D1,$01 Terminator.

t $F0D2 Messaging: "A Truck"
@ $F0D2 label=Messaging_Truck
N $F0D2 Print "#DECODESTR(#PC)".
B $F0D2,$01 "#DECODE(#PEEK(#PC))".
L $F0D2,$01,$04,$02
B $F0D6,$01 Terminator.

t $F0D7 Messaging: "Any Geese"
@ $F0D7 label=Messaging_AnyGeese
N $F0D7 Print "#DECODESTR(#PC)".
B $F0D7,$01 "#DECODE(#PEEK(#PC))".
L $F0D7,$01,$05,$02
B $F0DC,$01 Terminator.

t $F0DD Messaging: "Any Buns"
@ $F0DD label=Messaging_AnyBuns
N $F0DD Print "#DECODESTR(#PC)".
B $F0DD,$01 "#DECODE(#PEEK(#PC))".
L $F0DD,$01,$04,$02
B $F0E1,$01 Terminator.

t $F0E2 Messaging: "A Woman"
@ $F0E2 label=Messaging_Woman
N $F0E2 Print "#DECODESTR(#PC)".
B $F0E2,$01 "#DECODE(#PEEK(#PC))".
L $F0E2,$01,$04,$02
B $F0E6,$01 Terminator.

t $F0E7 Messaging: ""
N $F0E7 Print "#DECODESTR(#PC)".
B $F0E7,$01 "#DECODE(#PEEK(#PC))".
L $F0E7,$01,$01,$02
B $F0E8,$01 Terminator.

t $F0E9 Messaging: ""
N $F0E9 Print "#DECODESTR(#PC)".
B $F0E9,$01 "#DECODE(#PEEK(#PC))".
L $F0E9,$01,$01,$02
B $F0EA,$01 Terminator.

t $F0EB Messaging: ""
N $F0EB Print "#DECODESTR(#PC)".
B $F0EB,$01 "#DECODE(#PEEK(#PC))".
L $F0EB,$01,$01,$02
B $F0EC,$01 Terminator.

t $F0ED Messaging: ""
N $F0ED Print "#DECODESTR(#PC)".
B $F0ED,$01 "#DECODE(#PEEK(#PC))".
L $F0ED,$01,$01,$02
B $F0EE,$01 Terminator.

t $F0EF Messaging: ""
N $F0EF Print "#DECODESTR(#PC)".
B $F0EF,$01 "#DECODE(#PEEK(#PC))".
L $F0EF,$01,$01,$02
B $F0F0,$01 Terminator.

t $F0F1 Messaging: ""
N $F0F1 Print "#DECODESTR(#PC)".
B $F0F1,$01 "#DECODE(#PEEK(#PC))".
L $F0F1,$01,$01,$02
B $F0F2,$01 Terminator.

t $F0F3 Messaging: ""
N $F0F3 Print "#DECODESTR(#PC)".
B $F0F3,$01 "#DECODE(#PEEK(#PC))".
L $F0F3,$01,$01,$02
B $F0F4,$01 Terminator.

t $F0F5 Messaging: ""
N $F0F5 Print "#DECODESTR(#PC)".
B $F0F5,$01 "#DECODE(#PEEK(#PC))".
L $F0F5,$01,$01,$02
B $F0F6,$01 Terminator.

t $F0F7 Messaging: ""
N $F0F7 Print "#DECODESTR(#PC)".
B $F0F7,$01 "#DECODE(#PEEK(#PC))".
L $F0F7,$01,$01,$02
B $F0F8,$01 Terminator.

t $F0F9 Messaging: "A Diamond"
@ $F0F9 label=Messaging__Diamond
N $F0F9 Print "#DECODESTR(#PC)".
B $F0F9,$01 "#DECODE(#PEEK(#PC))".
L $F0F9,$01,$07,$02
B $F100,$01 Terminator.

t $F101 Messaging: "Some Fruit"
@ $F101 label=Messaging_Fruit
N $F101 Print "#DECODESTR(#PC)".
B $F101,$01 "#DECODE(#PEEK(#PC))".
L $F101,$01,$06,$02
B $F107,$01 Terminator.

t $F108 Messaging: "Some Meat"
@ $F108 label=Messaging_Meat
N $F108 Print "#DECODESTR(#PC)".
B $F108,$01 "#DECODE(#PEEK(#PC))".
L $F108,$01,$06,$02
B $F10E,$01 Terminator.

t $F10F Messaging: "A Television"
@ $F10F label=Messaging__Television
N $F10F Print "#DECODESTR(#PC)".
B $F10F,$01 "#DECODE(#PEEK(#PC))".
L $F10F,$01,$07,$02
B $F116,$01 Terminator.

t $F117 Messaging: "A Bottle"
@ $F117 label=Messaging__Bottle
N $F117 Print "#DECODESTR(#PC)".
B $F117,$01 "#DECODE(#PEEK(#PC))".
L $F117,$01,$06,$02
B $F11D,$01 Terminator.

t $F11E Messaging: "A Bottle Of Oil"
@ $F11E label=Messaging_BottleOfOil
N $F11E Print "#DECODESTR(#PC)".
B $F11E,$01 "#DECODE(#PEEK(#PC))".
L $F11E,$01,$0A,$02
B $F128,$01 Terminator.

t $F129 Messaging: "A Bottle Of Water"
@ $F129 label=Messaging_BottleOfWater
N $F129 Print "#DECODESTR(#PC)".
B $F129,$01 "#DECODE(#PEEK(#PC))".
L $F129,$01,$0B,$02
B $F134,$01 Terminator.

t $F135 Messaging: "A Wooden Stick"
@ $F135 label=Messaging_WoodenStick
N $F135 Print "#DECODESTR(#PC)".
B $F135,$01 "#DECODE(#PEEK(#PC))".
L $F135,$01,$09,$02
B $F13E,$01 Terminator.

t $F13F Messaging: "An Elephant Standing On A Wooden Ramp"
@ $F13F label=Messaging_ElephantOnRamp
N $F13F Print "#DECODESTR(#PC)".
B $F13F,$01 "#DECODE(#PEEK(#PC))".
L $F13F,$01,$16,$02
B $F155,$01 Terminator.

t $F156 Messaging: "A Wooden Ramp"
@ $F156 label=Messaging_WoodenRamp
N $F156 Print "#DECODESTR(#PC)".
B $F156,$01 "#DECODE(#PEEK(#PC))".
L $F156,$01,$09,$02
B $F15F,$01 Terminator.

t $F160 Messaging: "A Rusty Nail"
@ $F160 label=Messaging_RustyNail
N $F160 Print "#DECODESTR(#PC)".
B $F160,$01 "#DECODE(#PEEK(#PC))".
L $F160,$01,$08,$02
B $F168,$01 Terminator.

t $F169 Messaging: "A Cap"
@ $F169 label=Messaging__Cap
N $F169 Print "#DECODESTR(#PC)".
B $F169,$01 "#DECODE(#PEEK(#PC))".
L $F169,$01,$04,$02
B $F16D,$01 Terminator.

t $F16E Messaging: "A Cap Which You Are Wearing"
@ $F16E label=Messaging_CapWorn
N $F16E Print "#DECODESTR(#PC)".
B $F16E,$01 "#DECODE(#PEEK(#PC))".
L $F16E,$01,$0E,$02
B $F17C,$01 Terminator.

t $F17D Messaging: "The Tunnel Is Flooded"
@ $F17D label=Messaging_FloodedTunnel
N $F17D Print "#DECODESTR(#PC)".
B $F17D,$01 "#DECODE(#PEEK(#PC))".
L $F17D,$01,$0C,$02
B $F189,$01 Terminator.

t $F18A Messaging: "The Tunnel Is Dry"
@ $F18A label=Messaging_DryTunnel
N $F18A Print "#DECODESTR(#PC)".
B $F18A,$01 "#DECODE(#PEEK(#PC))".
L $F18A,$01,$0A,$02
B $F194,$01 Terminator.

t $F195 Messaging: "A Ticket"
@ $F195 label=Messaging__Ticket
N $F195 Print "#DECODESTR(#PC)".
B $F195,$01 "#DECODE(#PEEK(#PC))".
L $F195,$01,$06,$02
B $F19B,$01 Terminator.

t $F19C Messaging: "A Trumpet"
@ $F19C label=Messaging__Trumpet
N $F19C Print "#DECODESTR(#PC)".
B $F19C,$01 "#DECODE(#PEEK(#PC))".
L $F19C,$01,$06,$02
B $F1A2,$01 Terminator.

t $F1A3 Messaging: "The Gates Are Open"
@ $F1A3 label=Messaging_OpenGates
N $F1A3 Print "#DECODESTR(#PC)".
B $F1A3,$01 "#DECODE(#PEEK(#PC))".
L $F1A3,$01,$08,$02
B $F1AB,$01 Terminator.

t $F1AC Messaging: "The Gates Are Closed"
@ $F1AC label=Messaging_ClosedGates
N $F1AC Print "#DECODESTR(#PC)".
B $F1AC,$01 "#DECODE(#PEEK(#PC))".
L $F1AC,$01,$0A,$02
B $F1B6,$01 Terminator.

t $F1B7 Messaging: "A Stout Wooden Beam"
@ $F1B7 label=Messaging_StoutWoodenBeam
N $F1B7 Print "#DECODESTR(#PC)".
B $F1B7,$01 "#DECODE(#PEEK(#PC))".
L $F1B7,$01,$0B,$02
B $F1C2,$01 Terminator.

t $F1C3 Messaging: "The Stairs Are Supported By A Stout Wooden Beam"
@ $F1C3 label=Messaging_StairsSupportedByBeam
N $F1C3 Print "#DECODESTR(#PC)".
B $F1C3,$01 "#DECODE(#PEEK(#PC))".
L $F1C3,$01,$1A,$02
B $F1DD,$01 Terminator.

t $F1DE Messaging: "A Closed Door"
@ $F1DE label=Messaging_ClosedDoor
N $F1DE Print "#DECODESTR(#PC)".
B $F1DE,$01 "#DECODE(#PEEK(#PC))".
L $F1DE,$01,$09,$02
B $F1E7,$01 Terminator.

t $F1E8 Messaging: "An Open Door"
@ $F1E8 label=Messaging_OpenDoor
N $F1E8 Print "#DECODESTR(#PC)".
B $F1E8,$01 "#DECODE(#PEEK(#PC))".
L $F1E8,$01,$08,$02
B $F1F0,$01 Terminator.

t $F1F1 Messaging: "A Key"
@ $F1F1 label=Messaging__Key
N $F1F1 Print "#DECODESTR(#PC)".
B $F1F1,$01 "#DECODE(#PEEK(#PC))".
L $F1F1,$01,$03,$02
B $F1F4,$01 Terminator.

t $F1F5 Messaging: "One Limp Body Lays Slumped Over The Steering Wheel Of A Nearby Car"
@ $F1F5 label=Messaging_LimpBody
N $F1F5 Print "#DECODESTR(#PC)".
B $F1F5,$01 "#DECODE(#PEEK(#PC))".
L $F1F5,$01,$27,$02
B $F21C,$01 Terminator.

t $F21D Messaging: "A Body Laying Near To The Chasm"
@ $F21D label=Messaging_Body
N $F21D Print "#DECODESTR(#PC)".
B $F21D,$01 "#DECODE(#PEEK(#PC))".
L $F21D,$01,$12,$02
B $F22F,$01 Terminator.

t $F230 Messaging: "A Wooden Ramp At The Edge Of The Chasm"
@ $F230 label=Messaging_WoodenRampAtEdgeOfChasm
N $F230 Print "#DECODESTR(#PC)".
B $F230,$01 "#DECODE(#PEEK(#PC))".
L $F230,$01,$15,$02
B $F245,$01 Terminator.

t $F246 Messaging: "An Empty Car"
@ $F246 label=Messaging_EmptyCar
N $F246 Print "#DECODESTR(#PC)".
B $F246,$01 "#DECODE(#PEEK(#PC))".
L $F246,$01,$08,$02
B $F24E,$01 Terminator.

t $F24F Messaging: "A Car Lays Wedged Into The Chasm, Forming A Bridge"
@ $F24F label=Messaging_CarWedgedIntoChasm
N $F24F Print "#DECODESTR(#PC)".
B $F24F,$01 "#DECODE(#PEEK(#PC))".
L $F24F,$01,$1E,$02
B $F26D,$01 Terminator.

t $F26E Messaging: "You Are Sitting In The Car; The Engine Is Running"
@ $F26E label=Messaging_SittingInCarEngineRunning
N $F26E Print "#DECODESTR(#PC)".
B $F26E,$01 "#DECODE(#PEEK(#PC))".
L $F26E,$01,$15,$02
B $F283,$01 Terminator.

t $F284 Messaging: "A Flashing Display"
@ $F284 label=Messaging_FlashingDisplay
N $F284 Print "#DECODESTR(#PC)".
B $F284,$01 "#DECODE(#PEEK(#PC))".
L $F284,$01,$31,$02
B $F2B5,$01 Terminator.

t $F2B6 Messaging: "A Valve"
@ $F2B6 label=Messaging__Valve
N $F2B6 Print "#DECODESTR(#PC)".
B $F2B6,$01 "#DECODE(#PEEK(#PC))".
L $F2B6,$01,$05,$02
B $F2BB,$01 Terminator.

t $F2BC Messaging: "There Is A Valve Missing From A Section Of The Blue Coolant Pipe"
@ $F2BC label=Messaging_MissingValve
N $F2BC Print "#DECODESTR(#PC)".
B $F2BC,$01 "#DECODE(#PEEK(#PC))".
L $F2BC,$01,$36,$02
B $F2F2,$01 Terminator.

t $F2F3 Messaging: "A Pair Of Wires Dangling Near To A Valve Fitted To The Blue Coolant Pipe"
@ $F2F3 label=Messaging_PairOfWiresDangling
N $F2F3 Print "#DECODESTR(#PC)".
B $F2F3,$01 "#DECODE(#PEEK(#PC))".
L $F2F3,$01,$2D,$02
B $F320,$01 Terminator.

t $F321 Messaging: "A Pair Of Wires Connected To A Valve In The Blue Coolant Pipe"
@ $F321 label=Messaging_PairOfWiresConnectedValve
N $F321 Print "#DECODESTR(#PC)".
B $F321,$01 "#DECODE(#PEEK(#PC))".
L $F321,$01,$25,$02
B $F346,$01 Terminator.

t $F347 Messaging: "A Screwdriver"
@ $F347 label=Messaging__Screwdriver
N $F347 Print "#DECODESTR(#PC)".
B $F347,$01 "#DECODE(#PEEK(#PC))".
L $F347,$01,$09,$02
B $F350,$01 Terminator.

t $F351 Messaging: "A Chair"
@ $F351 label=Messaging__Chair
N $F351 Print "#DECODESTR(#PC)".
B $F351,$01 "#DECODE(#PEEK(#PC))".
L $F351,$01,$05,$02
B $F356,$01 Terminator.

t $F357 Messaging: "A Desk"
@ $F357 label=Messaging__Desk
N $F357 Print "#DECODESTR(#PC)".
B $F357,$01 "#DECODE(#PEEK(#PC))".
L $F357,$01,$05,$02
B $F35C,$01 Terminator.

t $F35D Messaging: "You Are Standing On A Chair"
@ $F35D label=Messaging_StandingOnChair
N $F35D Print "#DECODESTR(#PC)".
B $F35D,$01 "#DECODE(#PEEK(#PC))".
L $F35D,$01,$0B,$02
B $F368,$01 Terminator.

t $F369 Messaging: "A Pen"
@ $F369 label=Messaging__Pen
N $F369 Print "#DECODESTR(#PC)".
B $F369,$01 "#DECODE(#PEEK(#PC))".
L $F369,$01,$04,$02
B $F36D,$01 Terminator.

t $F36E Messaging: "A Radio"
@ $F36E label=Messaging__Radio
N $F36E Print "#DECODESTR(#PC)".
B $F36E,$01 "#DECODE(#PEEK(#PC))".
L $F36E,$01,$06,$02
B $F374,$01 Terminator.

t $F375 Messaging: "You Are Sitting In The Car"
@ $F375 label=Messaging_SittingInCar
N $F375 Print "#DECODESTR(#PC)".
B $F375,$01 "#DECODE(#PEEK(#PC))".
L $F375,$01,$0A,$02
B $F37F,$01 Terminator.

t $F380 Messaging: "A Panel Set Into The Ceiling"
@ $F380 label=Messaging_PanelInCeiling
N $F380 Print "#DECODESTR(#PC)".
B $F380,$01 "#DECODE(#PEEK(#PC))".
L $F380,$01,$0D,$02
B $F38D,$01 Terminator.

t $F38E Messaging: "A Panel"
@ $F38E label=Messaging__Panel
N $F38E Print "#DECODESTR(#PC)".
B $F38E,$01 "#DECODE(#PEEK(#PC))".
L $F38E,$01,$05,$02
B $F393,$01 Terminator.

t $F394 Messaging: "The Isolator Is Switched On"
@ $F394 label=Messaging_IsolatorOn
N $F394 Print "#DECODESTR(#PC)".
B $F394,$01 "#DECODE(#PEEK(#PC))".
L $F394,$01,$0F,$02
B $F3A3,$01 Terminator.

t $F3A4 Messaging: "The Isolator Is Switched Off"
@ $F3A4 label=Messaging_IsolatorOff
N $F3A4 Print "#DECODESTR(#PC)".
B $F3A4,$01 "#DECODE(#PEEK(#PC))".
L $F3A4,$01,$10,$02
B $F3B4,$01 Terminator.

t $F3B5 Messaging: "A Torch"
@ $F3B5 label=Messaging__Torch
N $F3B5 Print "#DECODESTR(#PC)".
B $F3B5,$01 "#DECODE(#PEEK(#PC))".
L $F3B5,$01,$05,$02
B $F3BA,$01 Terminator.

t $F3BB Messaging: "A Torch Which Is Switched On"
@ $F3BB label=Messaging_TorchOn
N $F3BB Print "#DECODESTR(#PC)".
B $F3BB,$01 "#DECODE(#PEEK(#PC))".
L $F3BB,$01,$12,$02
B $F3CD,$01 Terminator.

t $F3CE Messaging: "Some Tissues"
@ $F3CE label=Messaging_Tissues
N $F3CE Print "#DECODESTR(#PC)".
B $F3CE,$01 "#DECODE(#PEEK(#PC))".
L $F3CE,$01,$07,$02
B $F3D5,$01 Terminator.

t $F3D6 Messaging: "A Pickaxe"
@ $F3D6 label=Messaging__Pickaxe
N $F3D6 Print "#DECODESTR(#PC)".
B $F3D6,$01 "#DECODE(#PEEK(#PC))".
L $F3D6,$01,$07,$02
B $F3DD,$01 Terminator.

t $F3DE Messaging: "The Cables Spark Ominously"
@ $F3DE label=Messaging_Cables
N $F3DE Print "#DECODESTR(#PC)".
B $F3DE,$01 "#DECODE(#PEEK(#PC))".
L $F3DE,$01,$0E,$02
B $F3EC,$01 Terminator.

t $F3ED Messaging: "A Handle"
@ $F3ED label=Messaging__Handle
N $F3ED Print "#DECODESTR(#PC)".
B $F3ED,$01 "#DECODE(#PEEK(#PC))".
L $F3ED,$01,$05,$02
B $F3F2,$01 Terminator.

t $F3F3 Messaging: "A Closed Sluicegate"
@ $F3F3 label=Messaging_ClosedSluicegate
N $F3F3 Print "#DECODESTR(#PC)".
B $F3F3,$01 "#DECODE(#PEEK(#PC))".
L $F3F3,$01,$0C,$02
B $F3FF,$01 Terminator.

t $F400 Messaging: "A Closed Sluicegate With A Handle Fitted To The Operating Shaft"
@ $F400 label=Messaging_ClosedSluicegateWithHandle
N $F400 Print "#DECODESTR(#PC)".
B $F400,$01 "#DECODE(#PEEK(#PC))".
L $F400,$01,$25,$02
B $F425,$01 Terminator.

t $F426 Messaging: "An Open Sluicegate With A Handle Fitted To The Operating Shaft"
@ $F426 label=Messaging_OpenSluicegateWithHandle
N $F426 Print "#DECODESTR(#PC)".
B $F426,$01 "#DECODE(#PEEK(#PC))".
L $F426,$01,$20,$02
B $F446,$01 Terminator.

t $F447 Messaging: "Some Sweets"
@ $F447 label=Messaging_Sweets
N $F447 Print "#DECODESTR(#PC)".
B $F447,$01 "#DECODE(#PEEK(#PC))".
L $F447,$01,$07,$02
B $F44E,$01 Terminator.

t $F44F Messaging: "A Ceiling Panel Has Been Removed"
@ $F44F label=Messaging_CeilingPanel
N $F44F Print "#DECODESTR(#PC)".
B $F44F,$01 "#DECODE(#PEEK(#PC))".
L $F44F,$01,$16,$02
B $F465,$01 Terminator.

t $F466 Messaging: "Some Buns"
@ $F466 label=Messaging_Buns
N $F466 Print "#DECODESTR(#PC)".
B $F466,$01 "#DECODE(#PEEK(#PC))".
L $F466,$01,$05,$02
B $F46B,$01 Terminator.

t $F46C Messaging: ""
N $F46C Print "#DECODESTR(#PC)".
B $F46C,$01 "#DECODE(#PEEK(#PC))".
L $F46C,$01,$01,$02
B $F46D,$01 Terminator.

t $F46E Messaging: ""
N $F46E Print "#DECODESTR(#PC)".
B $F46E,$01 "#DECODE(#PEEK(#PC))".
L $F46E,$01,$01,$02
B $F46F,$01 Terminator.

t $F470 Messaging: ""
N $F470 Print "#DECODESTR(#PC)".
B $F470,$01 "#DECODE(#PEEK(#PC))".
L $F470,$01,$01,$02
B $F471,$01 Terminator.

t $F472 Messaging: ""
N $F472 Print "#DECODESTR(#PC)".
B $F472,$01 "#DECODE(#PEEK(#PC))".
L $F472,$01,$01,$02
B $F473,$01 Terminator.

t $F474 Messaging: ""
N $F474 Print "#DECODESTR(#PC)".
B $F474,$01 "#DECODE(#PEEK(#PC))".
L $F474,$01,$01,$02
B $F475,$01 Terminator.

t $F476 Messaging: ""
N $F476 Print "#DECODESTR(#PC)".
B $F476,$01 "#DECODE(#PEEK(#PC))".
L $F476,$01,$01,$02
B $F477,$01 Terminator.

t $F478 Messaging: ""
N $F478 Print "#DECODESTR(#PC)".
B $F478,$01 "#DECODE(#PEEK(#PC))".
L $F478,$01,$01,$02
B $F479,$01 Terminator.

t $F47A Messaging: "It's Very Dark In Here"
@ $F47A label=Messaging_VeryDarkInHere
N $F47A Print "#DECODESTR(#PC)".
B $F47A,$01 "#DECODE(#PEEK(#PC))".
L $F47A,$01,$3C,$02
B $F4B6,$01 Terminator.

t $F4B7 Messaging: "The Floor Collapses"
@ $F4B7 label=Messaging_FloorCollapses
N $F4B7 Print "#DECODESTR(#PC)".
B $F4B7,$01 "#DECODE(#PEEK(#PC))".
L $F4B7,$01,$22,$02
B $F4D9,$01 Terminator.

t $F4DA Messaging: "The Weakened Stairs Collapse"
@ $F4DA label=Messaging_WeakenedStairsCollapse
N $F4DA Print "#DECODESTR(#PC)".
B $F4DA,$01 "#DECODE(#PEEK(#PC))".
L $F4DA,$01,$1D,$02
B $F4F7,$01 Terminator.

t $F4F8 Messaging: "The Snaking, Sparking Cable Touches You"
@ $F4F8 label=Messaging_SnakingSparkingCableTouchesYou
N $F4F8 Print "#DECODESTR(#PC)".
B $F4F8,$01 "#DECODE(#PEEK(#PC))".
L $F4F8,$01,$19,$02
B $F511,$01 Terminator.

t $F512 Messaging: "With A Vicious Snapping Of Its Jaws, An Alligator Is Upon You..."
@ $F512 label=Messaging_ViciousSnappingAlligator
N $F512 Print "#DECODESTR(#PC)".
B $F512,$01 "#DECODE(#PEEK(#PC))".
L $F512,$01,$29,$02
B $F53B,$01 Terminator.

t $F53C Messaging: "You Neither Hear The Explosion"
@ $F53C label=Messaging_DontHearExplosion
N $F53C Print "#DECODESTR(#PC)".
B $F53C,$01 "#DECODE(#PEEK(#PC))".
L $F53C,$01,$63,$02
B $F59F,$01 Terminator.

t $F5A0 Messaging: "As You Enter The Street"
@ $F5A0 label=Messaging_EnterTheStreet
N $F5A0 Print "#DECODESTR(#PC)".
B $F5A0,$01 "#DECODE(#PEEK(#PC))".
L $F5A0,$01,$69,$02
B $F609,$01 Terminator.

t $F60A Messaging: "He Shouts:-"
@ $F60A label=Messaging_HeShouts
N $F60A Print "#DECODESTR(#PC)".
B $F60A,$01 "#DECODE(#PEEK(#PC))".
L $F60A,$01,$33,$02
B $F63D,$01 Terminator.

t $F63E Messaging: "He Shouts:- At Ease Men"
@ $F63E label=Messaging_HeShoutsAtEaseMen
N $F63E Print "#DECODESTR(#PC)".
B $F63E,$01 "#DECODE(#PEEK(#PC))".
L $F63E,$01,$27,$02
B $F665,$01 Terminator.

t $F666 Messaging: "As You Enter The Street"
@ $F666 label=Messaging_EnterTheStreetLooters
N $F666 Print "#DECODESTR(#PC)".
B $F666,$01 "#DECODE(#PEEK(#PC))".
L $F666,$01,$88,$02
B $F6EE,$01 Terminator.

t $F6EF Messaging: "He Says:-"
@ $F6EF label=Messaging_HeSays
N $F6EF Print "#DECODESTR(#PC)".
B $F6EF,$01 "#DECODE(#PEEK(#PC))".
L $F6EF,$01,$3F,$02
B $F72E,$01 Terminator.

t $F72F Messaging: "He Says "hey Boys, Look What We've Found!""
@ $F72F label=Messaging_HeSayLookWhatWeFound
N $F72F Print "#DECODESTR(#PC)".
B $F72F,$01 "#DECODE(#PEEK(#PC))".
L $F72F,$01,$4A,$02
B $F779,$01 Terminator.

t $F77A Messaging: "A Speeding Ambulance Rushes Past; The Siren Blaring"
@ $F77A label=Messaging_SpeedingAmbulance
N $F77A Print "#DECODESTR(#PC)".
B $F77A,$01 "#DECODE(#PEEK(#PC))".
L $F77A,$01,$1E,$02
B $F798,$01 Terminator.

t $F799 Messaging: "You Look Up"
@ $F799 label=Messaging_YouLookUp
N $F799 Print "#DECODESTR(#PC)".
B $F799,$01 "#DECODE(#PEEK(#PC))".
L $F799,$01,$3A,$02
B $F7D3,$01 Terminator.

t $F7D4 Messaging: "A Rescue Truck Tears Past You"
@ $F7D4 label=Messaging_RescueTruckTearsPast
N $F7D4 Print "#DECODESTR(#PC)".
B $F7D4,$01 "#DECODE(#PEEK(#PC))".
L $F7D4,$01,$3B,$02
B $F80F,$01 Terminator.

t $F810 Messaging: "Nasty Leak That!"
@ $F810 label=Messaging_NastyLeakThat
N $F810 Print "#DECODESTR(#PC)".
B $F810,$01 "#DECODE(#PEEK(#PC))".
L $F810,$01,$08,$02
B $F818,$01 Terminator.

t $F819 Messaging: "Try Examining Things"
@ $F819 label=Messaging_TryExaminingThings
N $F819 Print "#DECODESTR(#PC)".
B $F819,$01 "#DECODE(#PEEK(#PC))".
L $F819,$01,$0B,$02
B $F824,$01 Terminator.

t $F825 Messaging: "You Don't Really Need It"
@ $F825 label=Messaging_YouDontReallyNeedIt
N $F825 Print "#DECODESTR(#PC)".
B $F825,$01 "#DECODE(#PEEK(#PC))".
L $F825,$01,$0D,$02
B $F832,$01 Terminator.

t $F833 Messaging: "You See That This Is The Body Of A Young Woman. In Her Jacket Pocket, You Find A Key"
@ $F833 label=Messaging_SeeThisIsBodyYoungWoman
N $F833 Print "#DECODESTR(#PC)".
B $F833,$01 "#DECODE(#PEEK(#PC))".
L $F833,$01,$2E,$02
B $F861,$01 Terminator.

t $F862 Messaging: "You Turn The Body Over, A New Valve Drops From A Limp Hand"
@ $F862 label=Messaging_TurnTheBodyOver
N $F862 Print "#DECODESTR(#PC)".
B $F862,$01 "#DECODE(#PEEK(#PC))".
L $F862,$01,$22,$02
B $F884,$01 Terminator.

t $F885 Messaging: "The Bottle Is Empty"
@ $F885 label=Messaging_BottleIsEmpty
N $F885 Print "#DECODESTR(#PC)".
B $F885,$01 "#DECODE(#PEEK(#PC))".
L $F885,$01,$0B,$02
B $F890,$01 Terminator.

t $F891 Messaging: "It's Full Of Water"
@ $F891 label=Messaging_FullOfWater
N $F891 Print "#DECODESTR(#PC)".
B $F891,$01 "#DECODE(#PEEK(#PC))".
L $F891,$01,$0E,$02
B $F89F,$01 Terminator.

t $F8A0 Messaging: "It's Full Of Oil"
@ $F8A0 label=Messaging_FullOfOil
N $F8A0 Print "#DECODESTR(#PC)".
B $F8A0,$01 "#DECODE(#PEEK(#PC))".
L $F8A0,$01,$0D,$02
B $F8AD,$01 Terminator.

t $F8AE Messaging: "You Have Found A Bottle"
@ $F8AE label=Messaging_FoundABottle
N $F8AE Print "#DECODESTR(#PC)".
B $F8AE,$01 "#DECODE(#PEEK(#PC))".
L $F8AE,$01,$0C,$02
B $F8BA,$01 Terminator.

t $F8BB Messaging: "They Look Very Unsafe"
@ $F8BB label=Messaging_LookVeryUnsafe
N $F8BB Print "#DECODESTR(#PC)".
B $F8BB,$01 "#DECODE(#PEEK(#PC))".
L $F8BB,$01,$2F,$02
B $F8EA,$01 Terminator.

t $F8EB Messaging: "It's Not Worth It At The Best Of Times"
@ $F8EB label=Messaging_NotWorthIt
N $F8EB Print "#DECODESTR(#PC)".
B $F8EB,$01 "#DECODE(#PEEK(#PC))".
L $F8EB,$01,$17,$02
B $F902,$01 Terminator.

t $F903 Messaging: "It Would Appear That Someone Called "kilroy" Has Passed This Way"
@ $F903 label=Messaging_WouldAppearKilroy
N $F903 Print "#DECODESTR(#PC)".
B $F903,$01 "#DECODE(#PEEK(#PC))".
L $F903,$01,$29,$02
B $F92C,$01 Terminator.

t $F92D Messaging: "You Have Found A Key"
@ $F92D label=Messaging_FoundKey
N $F92D Print "#DECODESTR(#PC)".
B $F92D,$01 "#DECODE(#PEEK(#PC))".
L $F92D,$01,$09,$02
B $F936,$01 Terminator.

t $F937 Messaging: "It Is Meant To Have Wires Connected To It"
@ $F937 label=Messaging_MeantWiresConnected
N $F937 Print "#DECODESTR(#PC)".
B $F937,$01 "#DECODE(#PEEK(#PC))".
L $F937,$01,$1B,$02
B $F952,$01 Terminator.

t $F953 Messaging: "You Have Found A Panel In The Ceiling"
@ $F953 label=Messaging_FoundPanelInCeiling
N $F953 Print "#DECODESTR(#PC)".
B $F953,$01 "#DECODE(#PEEK(#PC))".
L $F953,$01,$12,$02
B $F965,$01 Terminator.

t $F966 Messaging: "You Have Found A Torch"
@ $F966 label=Messaging_FoundTorch
N $F966 Print "#DECODESTR(#PC)".
B $F966,$01 "#DECODE(#PEEK(#PC))".
L $F966,$01,$0B,$02
B $F971,$01 Terminator.

t $F972 Messaging: "You Find Nothing Of Interest"
@ $F972 label=Messaging_FindNothingOfInterest
N $F972 Print "#DECODESTR(#PC)".
B $F972,$01 "#DECODE(#PEEK(#PC))".
L $F972,$01,$0D,$02
B $F97F,$01 Terminator.

t $F980 Messaging: "You Have Nothing To Carry It In"
@ $F980 label=Messaging_YouHaveNothingToCarryItIn
N $F980 Print "#DECODESTR(#PC)".
B $F980,$01 "#DECODE(#PEEK(#PC))".
L $F980,$01,$10,$02
B $F990,$01 Terminator.

t $F991 Messaging: "You're Already Wearing It"
@ $F991 label=Messaging_YoureAlreadyWearingIt
N $F991 Print "#DECODESTR(#PC)".
B $F991,$01 "#DECODE(#PEEK(#PC))".
L $F991,$01,$0C,$02
B $F99D,$01 Terminator.

t $F99E Messaging: "You Can't, You're Standing On It"
@ $F99E label=Messaging_YouCantYoureStandingOnIt
N $F99E Print "#DECODESTR(#PC)".
B $F99E,$01 "#DECODE(#PEEK(#PC))".
L $F99E,$01,$10,$02
B $F9AE,$01 Terminator.

t $F9AF Messaging: "You Need Both Hands To Carry It, So Drop Everything Else"
@ $F9AF label=Messaging_YouNeedBothHands
N $F9AF Print "#DECODESTR(#PC)".
B $F9AF,$01 "#DECODE(#PEEK(#PC))".
L $F9AF,$01,$21,$02
B $F9D0,$01 Terminator.

t $F9D1 Messaging: "You Can't. You're Sitting In The Car"
@ $F9D1 label=Messaging_YouCantSittingInTheCar
N $F9D1 Print "#DECODESTR(#PC)".
B $F9D1,$01 "#DECODE(#PEEK(#PC))".
L $F9D1,$01,$12,$02
B $F9E3,$01 Terminator.

t $F9E4 Messaging: "I Don't See The Point Of Dropping Things In The Car"
@ $F9E4 label=Messaging_IDontSeeThePointInCar
N $F9E4 Print "#DECODESTR(#PC)".
B $F9E4,$01 "#DECODE(#PEEK(#PC))".
L $F9E4,$01,$1E,$02
B $FA02,$01 Terminator.

t $FA03 Messaging: "The Lions Devour The Meat Greedily"
@ $FA03 label=Messaging_LionsDevourMeat
N $FA03 Print "#DECODESTR(#PC)".
B $FA03,$01 "#DECODE(#PEEK(#PC))".
L $FA03,$01,$17,$02
B $FA1A,$01 Terminator.

t $FA1B Messaging: "The Chimps Squabble Over The Fruit, Noisily"
@ $FA1B label=Messaging_ChimpsSquabbleOverFruit
N $FA1B Print "#DECODESTR(#PC)".
B $FA1B,$01 "#DECODE(#PEEK(#PC))".
L $FA1B,$01,$18,$02
B $FA33,$01 Terminator.

t $FA34 Messaging: "The Elephant Takes The Buns"
@ $FA34 label=Messaging_ElephantTakesBuns
N $FA34 Print "#DECODESTR(#PC)".
B $FA34,$01 "#DECODE(#PEEK(#PC))".
L $FA34,$01,$57,$02
B $FA8B,$01 Terminator.

t $FA8C Messaging: "You Have Some Already"
@ $FA8C label=Messaging_YouHaveSomeAlready
N $FA8C Print "#DECODESTR(#PC)".
B $FA8C,$01 "#DECODE(#PEEK(#PC))".
L $FA8C,$01,$09,$02
B $FA95,$01 Terminator.

t $FA96 Messaging: "No. It May Be Contaminated"
@ $FA96 label=Messaging_ItMayBeContaminated
N $FA96 Print "#DECODESTR(#PC)".
B $FA96,$01 "#DECODE(#PEEK(#PC))".
L $FA96,$01,$12,$02
B $FAA8,$01 Terminator.

t $FAA9 Messaging: "It Isn't Full Of Anything"
@ $FAA9 label=Messaging_ItIsntFullOfAnything
N $FAA9 Print "#DECODESTR(#PC)".
B $FAA9,$01 "#DECODE(#PEEK(#PC))".
L $FAA9,$01,$10,$02
B $FAB9,$01 Terminator.

t $FABA Messaging: "You Don't Know How To Do That"
@ $FABA label=Messaging_YouDontKnowHowToDoThat
N $FABA Print "#DECODESTR(#PC)".
B $FABA,$01 "#DECODE(#PEEK(#PC))".
L $FABA,$01,$12,$02
B $FACC,$01 Terminator.

t $FACD Messaging: "The Elephant Totally Ignores You"
@ $FACD label=Messaging_ElephantTotallyIgnoresYou
N $FACD Print "#DECODESTR(#PC)".
B $FACD,$01 "#DECODE(#PEEK(#PC))".
L $FACD,$01,$16,$02
B $FAE3,$01 Terminator.

t $FAE4 Messaging: "As The Steel Head Strikes The Rubble, Bright Sparks Fly"
@ $FAE4 label=Messaging_SteelHeadStrikesRubbleBrightSparksFly
N $FAE4 Print "#DECODESTR(#PC)".
B $FAE4,$01 "#DECODE(#PEEK(#PC))".
L $FAE4,$01,$47,$02
B $FB2B,$01 Terminator.

t $FB2C Messaging: "The Elephant Trumpets Angrily"
@ $FB2C label=Messaging_ElephantTrumpets
N $FB2C Print "#DECODESTR(#PC)".
B $FB2C,$01 "#DECODE(#PEEK(#PC))".
L $FB2C,$01,$67,$02
B $FB93,$01 Terminator.

t $FB94 Messaging: "It Has No Noticeable Effect"
@ $FB94 label=Messaging_HasNoNoticeableEffect
N $FB94 Print "#DECODESTR(#PC)".
B $FB94,$01 "#DECODE(#PEEK(#PC))".
L $FB94,$01,$13,$02
B $FBA7,$01 Terminator.

t $FBA8 Messaging: "You're Already There"
@ $FBA8 label=Messaging_YoureAlreadyThere
N $FBA8 Print "#DECODESTR(#PC)".
B $FBA8,$01 "#DECODE(#PEEK(#PC))".
L $FBA8,$01,$0A,$02
B $FBB2,$01 Terminator.

t $FBB3 Messaging: "You Make A Valiant Attempt, But It Is Too Wide..."
@ $FBB3 label=Messaging_YouMakeAttempt
N $FBB3 Print "#DECODESTR(#PC)".
B $FBB3,$01 "#DECODE(#PEEK(#PC))".
L $FBB3,$01,$1D,$02
B $FBD0,$01 Terminator.

t $FBD1 Messaging: "Don't Be Ridiculous"
@ $FBD1 label=Messaging_DontBeRidiculous
N $FBD1 Print "#DECODESTR(#PC)".
B $FBD1,$01 "#DECODE(#PEEK(#PC))".
L $FBD1,$01,$0D,$02
B $FBDE,$01 Terminator.

t $FBDF Messaging: "You Must Be Joking!"
@ $FBDF label=Messaging_YouMustBeJoking
N $FBDF Print "#DECODESTR(#PC)".
B $FBDF,$01 "#DECODE(#PEEK(#PC))".
L $FBDF,$01,$0C,$02
B $FBEB,$01 Terminator.

t $FBEC Messaging: "You're Not In It"
@ $FBEC label=Messaging_YoureNotInIt
N $FBEC Print "#DECODESTR(#PC)".
B $FBEC,$01 "#DECODE(#PEEK(#PC))".
L $FBEC,$01,$09,$02
B $FBF5,$01 Terminator.

t $FBF6 Messaging: "You Can't Reach It"
@ $FBF6 label=Messaging_YouCantReachIt
N $FBF6 Print "#DECODESTR(#PC)".
B $FBF6,$01 "#DECODE(#PEEK(#PC))".
L $FBF6,$01,$0B,$02
B $FC01,$01 Terminator.

t $FC02 Messaging: "You've Done That Already"
@ $FC02 label=Messaging_YouveDoneThatAlready
N $FC02 Print "#DECODESTR(#PC)".
B $FC02,$01 "#DECODE(#PEEK(#PC))".
L $FC02,$01,$0C,$02
B $FC0E,$01 Terminator.

t $FC0F Messaging: "It's Already Open"
@ $FC0F label=Messaging_AlreadyOpen
N $FC0F Print "#DECODESTR(#PC)".
B $FC0F,$01 "#DECODE(#PEEK(#PC))".
L $FC0F,$01,$0B,$02
B $FC1A,$01 Terminator.

t $FC1B Messaging: "It's Already Closed"
@ $FC1B label=Messaging_AlreadyClosed
N $FC1B Print "#DECODESTR(#PC)".
B $FC1B,$01 "#DECODE(#PEEK(#PC))".
L $FC1B,$01,$0D,$02
B $FC28,$01 Terminator.

t $FC29 Messaging: "You Can't It's Locked"
@ $FC29 label=Messaging_ItsLocked
N $FC29 Print "#DECODESTR(#PC)".
B $FC29,$01 "#DECODE(#PEEK(#PC))".
L $FC29,$01,$0C,$02
B $FC35,$01 Terminator.

t $FC36 Messaging: "You See A Square Ended Shaft Protruding From The Operating Mechanism"
@ $FC36 label=Messaging_SeeSquareEndedShaft
N $FC36 Print "#DECODESTR(#PC)".
B $FC36,$01 "#DECODE(#PEEK(#PC))".
L $FC36,$01,$25,$02
B $FC5B,$01 Terminator.

t $FC5C Messaging: "You See A Square Hole Through The Boss At One End"
@ $FC5C label=Messaging_SeeSquareHole
N $FC5C Print "#DECODESTR(#PC)".
B $FC5C,$01 "#DECODE(#PEEK(#PC))".
L $FC5C,$01,$1D,$02
B $FC79,$01 Terminator.

t $FC7A Messaging: "The Mechanism Appears To Be Seized With Rust"
@ $FC7A label=Messaging_MechanismSeizedWithRust
N $FC7A Print "#DECODESTR(#PC)".
B $FC7A,$01 "#DECODE(#PEEK(#PC))".
L $FC7A,$01,$1B,$02
B $FC95,$01 Terminator.

t $FC96 Messaging: "The Sluicegate Opens, Releasing A Torrent Of Water Into The Sewer. This Continues For Several Minutes Before Finally Subsiding"
@ $FC96 label=Messaging_SluicegateOpens
N $FC96 Print "#DECODESTR(#PC)".
B $FC96,$01 "#DECODE(#PEEK(#PC))".
L $FC96,$01,$49,$02
B $FCDF,$01 Terminator.

t $FCE0 Messaging: "The Engine Is Already Running"
@ $FCE0 label=Messaging_EngineAlreadyRunning
N $FCE0 Print "#DECODESTR(#PC)".
B $FCE0,$01 "#DECODE(#PEEK(#PC))".
L $FCE0,$01,$0E,$02
B $FCEE,$01 Terminator.

t $FCEF Messaging: "You Don't Have A Key"
@ $FCEF label=Messaging_YouDontHaveAKey
N $FCEF Print "#DECODESTR(#PC)".
B $FCEF,$01 "#DECODE(#PEEK(#PC))".
L $FCEF,$01,$0A,$02
B $FCF9,$01 Terminator.

t $FCFA Messaging: "The Engine Bursts Into Life"
@ $FCFA label=Messaging_EngineBurstsIntoLife
N $FCFA Print "#DECODESTR(#PC)".
B $FCFA,$01 "#DECODE(#PEEK(#PC))".
L $FCFA,$01,$0E,$02
B $FD08,$01 Terminator.

t $FD09 Messaging: "The Circuit Is Energised"
@ $FD09 label=Messaging_CircuitIsEnergised
N $FD09 Print "#DECODESTR(#PC)".
B $FD09,$01 "#DECODE(#PEEK(#PC))".
L $FD09,$01,$48,$02
B $FD51,$01 Terminator.

t $FD52 Messaging: "The Circuit Is De-energised And The Display Disappears"
@ $FD52 label=Messaging_CircuitIsDeenergised
N $FD52 Print "#DECODESTR(#PC)".
B $FD52,$01 "#DECODE(#PEEK(#PC))".
L $FD52,$01,$1F,$02
B $FD71,$01 Terminator.

t $FD72 Messaging: "As You Touch The Wires"
@ $FD72 label=Messaging_TouchTheWires
N $FD72 Print "#DECODESTR(#PC)".
B $FD72,$01 "#DECODE(#PEEK(#PC))".
L $FD72,$01,$3F,$02
B $FDB1,$01 Terminator.

t $FDB2 Messaging: "You Won't Get In There, Carrying That"
@ $FDB2 label=Messaging_YouWontGetInThereCarryingThat
N $FDB2 Print "#DECODESTR(#PC)".
B $FDB2,$01 "#DECODE(#PEEK(#PC))".
L $FDB2,$01,$13,$02
B $FDC5,$01 Terminator.

t $FDC6 Messaging: "The Car Hurtles At The Ramp"
@ $FDC6 label=Messaging_CarHurtlesAtRamp
N $FDC6 Print "#DECODESTR(#PC)".
B $FDC6,$01 "#DECODE(#PEEK(#PC))".
L $FDC6,$01,$8C,$02
B $FE52,$01 Terminator.

t $FE53 Messaging: "You Drag The Body Out Of The Car And Lay It Down"
@ $FE53 label=Messaging_DragBodyOutOfTheCar
N $FE53 Print "#DECODESTR(#PC)".
B $FE53,$01 "#DECODE(#PEEK(#PC))".
L $FE53,$01,$23,$02
B $FE76,$01 Terminator.

t $FE77 Messaging: "It Isn't Switched On"
@ $FE77 label=Messaging_ItIsntSwitchedOn
N $FE77 Print "#DECODESTR(#PC)".
B $FE77,$01 "#DECODE(#PEEK(#PC))".
L $FE77,$01,$0E,$02
B $FE85,$01 Terminator.

t $FE86 Messaging: "You Can't, It's Uncooked"
@ $FE86 label=Messaging_YouCantItsUncooked
N $FE86 Print "#DECODESTR(#PC)".
B $FE86,$01 "#DECODE(#PEEK(#PC))".
L $FE86,$01,$10,$02
B $FE96,$01 Terminator.

t $FE97 Messaging: "That Was Delicious"
@ $FE97 label=Messaging_ThatWasDelicious
N $FE97 Print "#DECODESTR(#PC)".
B $FE97,$01 "#DECODE(#PEEK(#PC))".
L $FE97,$01,$0B,$02
B $FEA2,$01 Terminator.

t $FEA3 Messaging: "You've Eaten Them All"
@ $FEA3 label=Messaging_YouveEatenThemAll
N $FEA3 Print "#DECODESTR(#PC)".
B $FEA3,$01 "#DECODE(#PEEK(#PC))".
L $FEA3,$01,$17,$02
B $FEBA,$01 Terminator.

t $FEBB Messaging: "You Eat The Sweets"
@ $FEBB label=Messaging_YouEatTheSweets
N $FEBB Print "#DECODESTR(#PC)".
B $FEBB,$01 "#DECODE(#PEEK(#PC))".
L $FEBB,$01,$09,$02
B $FEC4,$01 Terminator.

t $FEC5 Messaging: "You Are A Sick Person"
@ $FEC5 label=Messaging_YouAreASickPerson
N $FEC5 Print "#DECODESTR(#PC)".
B $FEC5,$01 "#DECODE(#PEEK(#PC))".
L $FEC5,$01,$0B,$02
B $FED0,$01 Terminator.

t $FED1 Messaging: "That Is Not Advisable"
@ $FED1 label=Messaging_ThatIsNotAdvisable
N $FED1 Print "#DECODESTR(#PC)".
B $FED1,$01 "#DECODE(#PEEK(#PC))".
L $FED1,$01,$0C,$02
B $FEDD,$01 Terminator.

t $FEDE Messaging: "It Isn't Locked"
@ $FEDE label=Messaging_ItIsntLocked
N $FEDE Print "#DECODESTR(#PC)".
B $FEDE,$01 "#DECODE(#PEEK(#PC))".
L $FEDE,$01,$0A,$02
B $FEE8,$01 Terminator.

t $FEE9 Messaging: "You Haven't Got Any Oil"
@ $FEE9 label=Messaging_YouHaventGotAnyOil
N $FEE9 Print "#DECODESTR(#PC)".
B $FEE9,$01 "#DECODE(#PEEK(#PC))".
L $FEE9,$01,$0D,$02
B $FEF6,$01 Terminator.

t $FEF7 Messaging: "You Don't Have A Screwdriver"
@ $FEF7 label=Messaging_YouDontHaveAScrewdriver
N $FEF7 Print "#DECODESTR(#PC)".
B $FEF7,$01 "#DECODE(#PEEK(#PC))".
L $FEF7,$01,$10,$02
B $FF07,$01 Terminator.

t $FF08 Messaging: "You Have Your Hands Full At The Moment"
@ $FF08 label=Messaging_YouHaveYourHandsFullAtTheMoment
N $FF08 Print "#DECODESTR(#PC)".
B $FF08,$01 "#DECODE(#PEEK(#PC))".
L $FF08,$01,$15,$02
B $FF1D,$01 Terminator.

u $FF1E

u $FF40 Unused
