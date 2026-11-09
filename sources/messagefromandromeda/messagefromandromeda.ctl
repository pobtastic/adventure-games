; Copyright Interceptor Software UK 1984, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction
; e.g. Print_HighScore_Loop.

> $4000 @start
@ $4000 org=$4000
> $4000 @rom
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @expand=#DEF(#MESSAGE(addr) #STR$addr,$08($b==$FF))
> $4000 @expand=#IF({asm})(#DEF(#PICTURE()(title,fname,attr=0)))
> $4000 @expand=#DEF(#ROOM(id) #IF($01<$id<=$3F)(#HTML(&#10;)#SIM(start=$6754,stop=$6762,ix=$8568,de=$id)#HTML(&#10;)#R({sim[HL]})(#MAP({sim[HL]})(#HTML(&#10;)UNKNOWN,29024:In Deep Space,29049:In orbit around an unknown planet,29084:In the Galaxy at rest,29124:The Landing Pad,29141:The Square,29181:The Corridor,29195:The Yellow Room,29212:The Armoury,29225:The Long Corridor,29244:The Green Room,29260:The Workshop,29274:The Guard Room,29290:The Storage Room,29308:The Reception Room,29328:The Conference Room,29349:The Antechamber,29366:The Assembly Room,29385:The Blue Room,29400:The Red Room,29414:The Control Room,29432:The White Room,29448:The Mirrored Room,29467:The Bottom of a Stairwell,29494:The eastern end of a Long Cavern,29528:The Hall of the Ancients,29554:The Old Cave,29568:The Crystal Chamber,29589:The Botanical Grotto,29611:The Dusty Corridor,29631:The Limestone Maze,29651:The Damp Cave,29666:The Lower Corridor,29686:The Lower Store Room,29708:The Rock Slide,29724:The Tall Canyon,29741:The Torture Chamber,29762:The Underground Stream,29786:The Sloping Corridor,29808:The Cavern of Mists,29829:The Crystal Grotto,29849:The Crystal Bridge,29869:The Creature's Lair,29890:The Alien Commander's Chamber,29921:The Reactor Room,29939:The West Bank of the Lake,29966:The Subterranean Lake,29989:The East Bank of the Lake,30016:The South Bank of the Lake,30044:The Plateau,30109:The Repair Bay,30125:The Burial Chamber,30145:Inside a Teleport,30164:The western end of a Long Cavern)),#HTML(&#10;)N/A))
> $4000 @expand=#DEF(#ITEM(id) #MAP($id)(#HTML(&#10;)N/A,00:"A knife.",01:"A laser pistol.",02:"A coin.",03:"A crystal rod.",04:"A detonator.",05:"A metal bar.",06:"A glowing sphere.",07:"Some poison fungus.",08:"Some round stones.",09:"A key.",10:"A space axe.",11:"Some explosives.",12:"A pair of gloves.",13:"The Galaxy.",14:"The airlock is closed.",15:"The airlock is closed.",16:"The airlock is open.",17:"The airlock is open.",18:"An android guard. He has shot at you and missed.",19:"A dead android guard.",20:"A glowing sphere sitting on a sunken dish#RAW(,) on a glass pedestal.",21:"A glass pedestal with a raised dish on top.",22:"A glass pedestal with a raised dish on top.",23:"A panel with a square plate to one side.",24:"The southern exit has a square plate to the side of it.",25:"A pile of rocks at the eastern end.",26:"Some shattered rocks to one side of the eastern exit.",27:"The landing co-ordinates are set.",28:"A closed door.",29:"An open door.",30:"A creeping vine has trapped you by coiling itself around you.",31:"A withered vine.",32:"A skeleton in space patrol uniform#RAW(,)tied to rings in the wall#RAW(,)by ropes.",33:"A skeleton on the floor.",34:"An alcove containing some round stones.",35:"An empty alcove.",36:"A huge#RAW(,)blind slug is blocking the western exit. It is advancing toward you.",37:"A pool of slime on the floor.",38:"A fierce#RAW(,)scaled creature is on the bridge#RAW(,)preventing your crossing.",39:"The alien commander#RAW(,) in space armour.",40:"The dead body of the alien commander.",41:"A computer.",42:"A keyhole in the control panel.",43:"A light is flashing and you can hear a warning siren.",44:"A dead alien soldier.",45:"A dead alien soldier.",46:"A dead alien soldier.",47:"A dead alien soldier.",48:"A tractor beam is holding the ship. Takeoff is impossible.",49:"A strange alien device in one corner.",50:"Some writing on the wall.",51:"A message on the ship's computer screen.",52:"A button.",53:"The water looks inviting.",54:"The water looks inviting.",55:"The water looks inviting.",56:"A pile of rocks.",57:"A pair of gloves#RAW(,)which you are wearing.",58:"A key in the control panel. The key is set to 'OFF'.",59:"A key in the control panel. The key is set to 'ON'.",60:"A glowing sphere sitting on a raised dish on a glass pedestal.",61:"The water looks inviting.",62:"A message on the computer screen reads:- TYPE PASSWORD.",63:"A wall of rock now blocks the northern exit.",64:"The ship is ready to take off."))
> $4000 @expand=#DEF(#OBJECT(id) #MAP($id)(#HTML(&#10;)N/A,00:Glov,01:Ship,02:Mess,03:Airl,04:Keyh,05:Gun,06:Guar,07:Sphe,08:Pede,09:Dish,10:Rod,11:Plat,12:Door,13:Vine,14:Butt,15:Deto,16:Rock,17:Coin,18:Sold,19:Axe,20:Knif,21:Skel,22:Rope,23:Ston,24:Slug,25:Fung,26:Crea,27:Bar,28:Comm,29:Pane,30:Key,31:Comp,32:Devi,33:Lake,34:Writ,35:Body,36:Expl))
> $4000 @expand=#DEF(#TOKEN(id) #MAP($id)(#HTML(&#10;)UNKNOWN,000:"H#RAW(,)HELP",001:"I#RAW(,)INVE",002:"L#RAW(,)LOOK",003:"N#RAW(,)NORT",004:"S#RAW(,)SOUT",005:"E#RAW(,)EAST",006:"W#RAW(,)WEST",007:"U#RAW(,)UP",008:"D#RAW(,)DOWN",009:"EXAM",010:"LOAD",011:"SAVE",012:"QUIT",013:"TAKE#RAW(,)GET#RAW(,)PICK",014:"DROP#RAW(,)PLAC#RAW(,)PUT#RAW(,)THRO#RAW(,)REMO#RAW(,)MOVE",015:"BLIN",016:"ENTE",017:"EXIT#RAW(,)LEAV",018:"GLOV",019:"SHIP#RAW(,)GALA",020:"YES",021:"NO",022:"POIS",023:"SQUA",024:"SCAL",025:"ANDR",026:"READ",027:"MESS",028:"LAND",029:"AIRL",030:"OPEN",031:"CLOS#RAW(,)SHUT",032:"LASE",033:"GUN#RAW(,)PIST",034:"SHOO#RAW(,)BLAS",035:"TOUC",036:"AT#RAW(,)TO",037:"EAT",038:"GUAR",039:"SPHE",040:"PEDE",041:"TURN#RAW(,)ROTA",042:"DISH",043:"ON",044:"GLOW",045:"ROD",046:"POIN",047:"PLAT",048:"DOOR",049:"SLID",050:"BODY",051:"EXPL",052:"BUTT",053:"PRES#RAW(,)PUSH",054:"DETO",055:"ROCK",056:"OFF",057:"STRA",058:"ROUN",059:"CREE",060:"VINE#RAW(,)PLAN",061:"SPAC",062:"COIN",063:"xxxx",064:"SOLD",065:"CUT#RAW(,)SLIC#RAW(,)STAB",066:"AXE",067:"KNIF",068:"SKEL",069:"ROPE",070:"STON",071:"SLUG",072:"FUNG",073:"CREA",074:"PANE",075:"COMM",076:"WITH#RAW(,)USIN",077:"META",078:"KEY",079:"FUCK#RAW(,)SCRE",080:"CRYS",081:"DEVI#RAW(,)TELE",082:"ALIE",083:"ATTA#RAW(,)KILL",084:"ROUN",085:"COMP",086:"INSE",087:"KEYH",088:"OLD#RAW(,)"OLD",089:"TYPE",090:"IN",091:"DEAD",092:"BAR",093:"WEAR",094:"SWIM",095:"LAKE#RAW(,)WATE",096:"RUN",097:"WRIT",098:"RAIS",099:"GLAS",253:Separator,254:Terminator))
> $4000 @expand=#IF({asm})(#DEF(#FOREST(addr)(link=Forest At Worlds End)$link))
> $4000 @expand=#IF({asm})(#DEF(#HEROES(addr)(link=Heroes Of Karn)$link))
> $4000 @expand=#IF({asm})(#DEF(#JEWELS(addr)(link=The Jewels Of Babylon)$link))
> $4000 @expand=#IF({asm})(#DEF(#SHOCK(addr)(link=After Shock)$link))
> $4000 @expand=#IF({asm})(#DEF(#WARLORD(addr)(link=Warlord)$link))
> $4000 @set-handle-unsupported-macros=1
> $4000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))

b $4000 Loading Screen
@ $4000 label=Loading
D $4000 #UDGTABLE
. { =h Message From Andromeda Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

u $5B00
S $5B00,$100

i $5C00

c $5CD0 Tape Loader
@ $5CD0 label=TapeLoader
E $5CD0 View the equivalent code in;
. #LIST
. { #FOREST$5B00 }
. { #HEROES$5B00 }
. { #JEWELS$5B00 }
. { #WARLORD$5B00 }
. LIST#
D $5CD0 Load the screen, then the game image. The length check keeps
. the graphics and the code as two blocks.
N $5CD0 Load the first block: the loading screen.
  $5CD0,$0A Load the screen from tape into the display file.
N $5CDA Choose one graphics block or two.
  $5CDA,$0B Jump to #R$5CFA when the pictures fit in one tape block.
@ $5CE5 label=TapeLoader_Step1
  $5CE5,$0A Load the engine, the text and the first pictures at #R$61A8.
  $5CEF,$0A Load the remaining pictures at #N$D6D8.
  $5CF9,$01 Return.
@ $5CFA label=TapeLoader_Step2
  $5CFA,$07 Load the pictures and the code as one block at #R$61A8.
N $5D01 The screen and split-graphics loads call here; the single-block
. load falls into it, so its return ends the loader.
@ $5D01 label=TapeLoading
  $5D01,$02 Load the data-block marker #N$45.
  $5D03,$01 Set the carry flag so the ROM loads this block.
  $5D04,$03 Call #SKOOLKID$0802(LD_BLOCK).
  $5D07,$01 Return.

b $5D08 BASIC Loader
@ $5D08 label=BasicLoader
D $5D08 The BASIC program and its variables, left above the system
. variables after the tape has loaded. The machine-code game does
. not execute it again.
B $5D08,$01
L $5D08,$01,$4A0

c $61A8 Game Entry Point
@ $61A8 label=GameEntryPoint
E $61A8 View the equivalent code in;
. #LIST
. { #SHOCK$9DD7 }
. { #FOREST$B9C5 }
. { #HEROES$ABD4 }
. { #JEWELS$BA50 }
. { #WARLORD$A531 }
. LIST#
D $61A8 The third load block is entered here. Jump straight into the
. initialisation routine.
  $61A8,$03 Jump to #R$F8AF to initialise the game.

g $61AB Table: Item Locations
@ $61AB label=Table_ItemLocations
E $61AB View the equivalent code in;
. #LIST
. { #SHOCK$9F88 }
. { #FOREST$B9C8 }
. { #HEROES$AD76 }
. { #JEWELS$BBF0 }
. { #WARLORD$A66C }
. LIST#
D $61AB Workspace filled from #R$F8EA by the routine at #R$F8AF.
. Object locations occupy the #N$41 bytes at #R$61AB. The current
. room is *#R$6223. Pointers to the message, exit and handler tables
. follow the command buffer.
B $61AB,$01 Item #N(#PC-$61AB) #ITEM(#PC-$61AB) in room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
L $61AB,$01,$41

u $61EC
S $61EC,$23

g $620F Flags: Display State
@ $620F label=Flag_DisplayState
D $620F Bit 0 is set when a room picture is waiting for a keypress.
B $620F,$01

u $6210
S $6210,$03

g $6213 Table: Already Seen Room Images
@ $6213 label=Table_RoomImagesAlreadySeen
D $6213 One bit per entry in #R$8CFC. #R$678A tests and sets the bit for
. the current room's picture slot.
B $6213,b,$01
B $6214,b,$01
B $6215,b,$01
B $6216,b,$01

u $6217
S $6217,$02

g $6219 Flags: Turn-Based Event States
@ $6219 label=Flag_TurnBasedEventState
D $6219 Holds a single byte, where each bit relates to a turn-based event.
. When the bit is set, #R$6557 runs the matching handler from #R$62A2.
B $6219,$01

g $621A Turn-Based Event Counters
D $621A One countdown per bit of *#R$6219.
N $621A Unused.
@ $621A label=Counter_Unused_0
N $621B Unused.
@ $621B label=Counter_Unused_1
N $621C Unused.
@ $621C label=Counter_Unused_2
N $621D Unused.
@ $621D label=Counter_Unused_3
N $621E Unused.
@ $621E label=Counter_Unused_4
N $621F Unused.
@ $621F label=Counter_Unused_5
N $6220 Unused.
@ $6220 label=Counter_Unused_6
N $6221 Unused.
@ $6221 label=Counter_Unused_7
B $621A,$08,$01

g $6222 Flags: Scenic Event States
@ $6222 label=Flag_ScenicEventState
D $6222 Holds a single byte, where each set bit arms a scenic event. #R$658A
. walks these bits and plants a message when the player is not already in
. that event's room from #R$6224.
B $6222,$01

g $6223 Current Room ID
@ $6223 label=CurrentRoom
D $6223 The room the player starts the game in is room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
B $6223,$01 Current room ID.

g $6224 Table: Scenic Event Locations
@ $6224 label=Table_ScenicEventLocations
D $6224 Where each of the #N$08 scenic events is. #R$658A compares these
. rooms with *#R$6223.
B $6224,$01 Event #N(#PC-$6224).
L $6224,$01,$08

g $622C Number Of Items In The Players Inventory
@ $622C label=Count_InventoryItems
D $622C The number of items the player is currently holding.
B $622C,$01

g $622D Load/ Save Buffer
@ $622D label=LoadSaveBuffer
D $622D When #R$69DC(loading) or #R$69A1(saving), this buffer holds the
. bytes for the saved-location pointers at #R$8D16.
B $622D,$32,$08

g $625F Command Buffer
@ $625F label=CommandBuffer
D $625F The line being typed. Parsed word tokens follow at #R$6291.
B $625F,$32

g $6291 User Input: Word Tokens
@ $6291 label=UserInput_Token_1
@ $6292 label=UserInput_Token_2
D $6291 The vocabulary number of each word of the last command, in the
. order they were typed, with #N$FF in every slot that isn't used.
B $6291,$01 The first word, which should be the verb.
B $6292,$09,$09 The words after the verb.

g $629B Line Number
@ $629B label=LineNumber
E $629B View the equivalent code in;
. #LIST
. { #FOREST$BB40 }
. { #HEROES$AF38 }
. { #JEWELS$BD70 }
. { #WARLORD$A82E }
. LIST#
D $629B The text and picture row used when clearing lines and parking the
. cursor.
B $629B,$01

g $629C Pointer: Vocabulary Table
@ $629C label=Pointer_Vocabulary
D $629C Pointer to the table containing the game vocabulary.
W $629C,$02

g $629E Four Letter Buffer
@ $629E label=FourLetterBuffer
D $629E The four-character word the parser is matching.
B $629E,$04

g $62A2 Table: Turn-Based Event Handlers
@ $62A2 label=Table_TurnBasedEventHandlers
D $62A2 Handler addresses for each bit of *#R$6219. Used by #R$6557.
W $62A2,$02 Event #N((#PC-$62A2)/$02).
L $62A2,$02,$08

g $62B2 Table: Scenic Event Message Lists
@ $62B2 label=Table_ScenicEventMessageLists
D $62B2 Pointers to the message lists #R$658A walks for each scenic event.
W $62B2,$02 Event #N((#PC-$62B2)/$02).
L $62B2,$02,$08

g $62C2 Pointer: Room Map Table
@ $62C2 label=Pointer_RoomMap
D $62C2 Pointer to the table containing the relationships between rooms.
W $62C2,$02

g $62C4 Number Of Objects
@ $62C4 label=Count_Objects
E $62C4 View the equivalent code in;
. #LIST
. { #SHOCK$BBC9 }
. { #FOREST$BAFA }
. { #JEWELS$BD2A }
. LIST#
D $62C4 The total number of objects in the game.
W $62C4,$02

g $62C6 Pointer: Item Description Table
@ $62C6 label=Pointer_ItemDescriptions
D $62C6 Pointer to the table containing item descriptions.
W $62C6,$02

g $62C8 Number Of Nouns
@ $62C8 label=Count_Nouns
D $62C8 The total number of noun word tokens the game has.
W $62C8,$02

g $62CA Number Of Rooms With Images
@ $62CA label=Count_RoomsWithImages
D $62CA The total number of rooms which have related images in the game.
W $62CA,$02

g $62CC Pointer: Rooms With Images Table
@ $62CC label=Pointer_RoomsWithImages
D $62CC Pointer to the table containing all the rooms which have an image
. to display.
W $62CC,$02

g $62CE Pointer: Room Image Jump Table
@ $62CE label=Pointer_RoomImage
D $62CE Pointer to the jump table for displaying an image relating to a
. room.
W $62CE,$02

g $62D0 Pointer: Room Description Table
@ $62D0 label=Pointer_RoomDescriptions
D $62D0 Pointer to the table containing room descriptions.
W $62D0,$02

g $62D2 Pointer: Object Noun Phrases
@ $62D2 label=Pointer_ObjectNounPhrases
W $62D2,$02

g $62D4 Pointer: Object List Table
@ $62D4 label=Pointer_ObjectList
W $62D4,$02

g $62D6 Pointer: Noun Tokens Table
@ $62D6 label=Pointer_NounTokens
W $62D6,$02

g $62D8 Pointer: Verbs Jump Table
@ $62D8 label=Pointer_JumpTable_Verbs
W $62D8,$02

g $62DA Number Of Verb Tokens
@ $62DA label=Count_VerbTokens
D $62DA The total number of verb word tokens the game has.
W $62DA,$02

g $62DC Number Of Saved Locations
@ $62DC label=Count_SavedLocations
W $62DC,$02

g $62DE Pointer: Saved Location Table
@ $62DE label=Pointer_SavedLocations
W $62DE,$02

t $62E0 Messaging: ">"
@ $62E0 label=Messaging_Block
  $62E0,$02 "#MESSAGE$62E0".
B $62E2,$01 Terminator.

t $62E3 Messaging: "? ?"
@ $62E3 label=Messaging_Block2
  $62E3,$03 "#MESSAGE$62E3".
B $62E6,$01 Terminator.

t $62E7 Messaging: "THE"
@ $62E7 label=Messaging_THE
  $62E7,$04 "#MESSAGE$62E7".
B $62EB,$01 Terminator.

t $62EC Messaging: "I Don't Understand"
@ $62EC label=Messaging_IDonTUnderstand
  $62EC,$13 "#MESSAGE$62EC".
B $62FF,$01 Terminator.

t $6300 Messaging: "I Don't Know The Word"
@ $6300 label=Messaging_IDonTKnowTheWord
  $6300,$17 "#MESSAGE$6300".
B $6317,$01 Terminator.

t $6318 Messaging: "Nothing"
@ $6318 label=Messaging_Nothing
  $6318,$08 "#MESSAGE$6318".
B $6320,$01 Terminator.

t $6321 Messaging: "You Can See"
@ $6321 label=Messaging_YouCanSee
  $6321,$0E "#MESSAGE$6321".
B $632F,$01 Terminator.

t $6330 Messaging: "&"
@ $6330 label=Messaging_Block3
  $6330,$03 "#MESSAGE$6330".
B $6333,$01 Terminator.

t $6334 Messaging: "There Are Exits"
@ $6334 label=Messaging_ThereAreExits
  $6334,$12 "#MESSAGE$6334".
B $6346,$01 Terminator.

t $6347 Messaging: "There Is An Exit"
@ $6347 label=Messaging_ThereIsAnExit
  $6347,$12 "#MESSAGE$6347".
B $6359,$01 Terminator.

t $635A Exits Messaging: "North"
@ $635A label=ExitsMessaging_North
  $635A,$05 "#MESSAGE$635A".
B $635F,$01 Terminator.

t $6360 Exits Messaging: "South"
@ $6360 label=ExitsMessaging_South
  $6360,$05 "#MESSAGE$6360".
B $6365,$01 Terminator.

t $6366 Exits Messaging: "East"
@ $6366 label=ExitsMessaging_East
  $6366,$04 "#MESSAGE$6366".
B $636A,$01 Terminator.

t $636B Exits Messaging: "West"
@ $636B label=ExitsMessaging_West
  $636B,$04 "#MESSAGE$636B".
B $636F,$01 Terminator.

t $6370 Exits Messaging: "Up"
@ $6370 label=ExitsMessaging_Up
  $6370,$02 "#MESSAGE$6370".
B $6372,$01 Terminator.

t $6373 Exits Messaging: "Down"
@ $6373 label=ExitsMessaging_Down
  $6373,$04 "#MESSAGE$6373".
B $6377,$01 Terminator.

t $6378 Messaging: "I Can't See"
@ $6378 label=Messaging_ICanTSee
  $6378,$0C "#MESSAGE$6378".
B $6384,$01 Terminator.

t $6385 Messaging: "Here"
@ $6385 label=Messaging_Here
  $6385,$06 "#MESSAGE$6385".
B $638B,$01 Terminator.

t $638C Messaging: "You Are Dead"
@ $638C label=Messaging_YouAreDead
  $638C,$0D "#MESSAGE$638C".
B $6399,$01 Terminator.

t $639A Messaging: "Want Another Game? Y N"
@ $639A label=Messaging_WantAnotherGameYN
  $639A,$17 "#MESSAGE$639A".
B $63B1,$01 Terminator.

t $63B2 Messaging: "LOADING. Start Tape"
@ $63B2 label=Messaging_LOADINGStartTape
  $63B2,$14 "#MESSAGE$63B2".
B $63C6,$01 Terminator.

t $63C7 Messaging: "Tape Error"
@ $63C7 label=Messaging_TapeError
  $63C7,$0B "#MESSAGE$63C7".
B $63D2,$01 Terminator.

t $63D3 Messaging: "SAVING. Start Tape,press Any Key"
@ $63D3 label=Messaging_SAVINGStartTapePressAnyKey
  $63D3,$21 "#MESSAGE$63D3".
B $63F4,$01 Terminator.

t $63F5 Messaging: "Stop Tape.Saving Complete"
@ $63F5 label=Messaging_StopTapeSavingComplete
  $63F5,$1A "#MESSAGE$63F5".
B $640F,$01 Terminator.

t $6410 Messaging: "Want To Save The Game? Y N"
@ $6410 label=Messaging_WantToSaveTheGameYN
  $6410,$1B "#MESSAGE$6410".
B $642B,$01 Terminator.

t $642C Messaging: "Please Be More Specific"
@ $642C label=Messaging_PleaseBeMoreSpecific
  $642C,$18 "#MESSAGE$642C".
B $6444,$01 Terminator.

t $6445 Messaging: "Please Rephrase That"
@ $6445 label=Messaging_PleaseRephraseThat
  $6445,$15 "#MESSAGE$6445".
B $645A,$01 Terminator.

t $645B Messaging: "You Can't"
@ $645B label=Messaging_YouCanT
  $645B,$0A "#MESSAGE$645B".
B $6465,$01 Terminator.

t $6466 Messaging: "O.K"
@ $6466 label=Messaging_OK
  $6466,$04 "#MESSAGE$6466".
B $646A,$01 Terminator.

t $646B Messaging: "Message"
@ $646B label=Messaging_Message
  $646B,$01 "#MESSAGE$646B".
B $646C,$01 Terminator.

g $646D Table: Direction Messages
@ $646D label=Table_DirectionMessages
D $646D Pointers to the direction names, in the order north, south,
. east, west, up and down.
W $646D,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $646D,$02,$06

c $6479 Response: "Please Rephrase That"
@ $6479 label=ResponsePleaseRephraseThat
E $6479 View the equivalent code in;
. #LIST
. { #FOREST$BDBE }
. { #HEROES$B1E4 }
. { #JEWELS$BFEE }
. { #WARLORD$AAEE }
. LIST#
D $6479 Point at "Please rephrase that.".
  $6479,$06 Print #MESSAGE$6445.
  $647F,$01 Return.

c $6480 Response: "Please Be More Specific"
@ $6480 label=ResponsePleaseBeMoreSpecific
E $6480 View the equivalent code in;
. #LIST
. { #FOREST$BDC5 }
. { #HEROES$B1EB }
. { #JEWELS$BFF5 }
. { #WARLORD$AAF5 }
. LIST#
D $6480 Point at "Please be more specific.".
  $6480,$06 Print #MESSAGE$642C.
  $6486,$01 Return.

c $6487 Response: "You Can't"
@ $6487 label=ResponseYouCanT
E $6487 View the equivalent code in;
. #LIST
. { #FOREST$BDCC }
. { #HEROES$B1F2 }
. { #JEWELS$BFFC }
. { #WARLORD$AAFC }
. LIST#
D $6487 Point at "You can't.".
  $6487,$06 Print #MESSAGE$645B.
  $648D,$01 Return.

c $648E Response: "O.K."
@ $648E label=ResponseOK
E $648E View the equivalent code in;
. #LIST
. { #FOREST$BDD3 }
. { #HEROES$B1F9 }
. { #JEWELS$C003 }
. { #WARLORD$AB03 }
. LIST#
D $648E Point at "O.K.".
  $648E,$06 Print #MESSAGE$6466.
  $6494,$01 Return.

c $6495 Get User Input
@ $6495 label=GetUserInput
E $6495 View the equivalent code in;
. #LIST
. { #SHOCK$9DFB }
. { #FOREST$BDDA }
. { #HEROES$ABE1 }
. { #JEWELS$BA5D }
. { #WARLORD$A53E }
. LIST#
D $6495 Wait until a new key is pressed, then return that key.
R $6495 O:A The keypress value
N $6495 Wait until a new key is pressed.
  $6495,$03 Read the key-state flags from #SKOOLKID$5C3B(FLAGS).
  $6498,$04 Jump back to #R$6495 until a new key is pressed.
  $649C,$02 Reset the new-key flag.
  $649E,$03 Write the flags back to #SKOOLKID$5C3B(FLAGS).
N $64A1 Fetch the keypress.
  $64A1,$03 Read the key from #SKOOLKID$5C08(LAST_K).
  $64A4,$01 Return.

c $64A5 Clear Screen
@ $64A5 label=ClearScreen
E $64A5 View the equivalent code in;
. #LIST
. { #FOREST$BDEA }
. { #HEROES$ABF1 }
. { #JEWELS$BA6D }
. { #WARLORD$A54E }
. LIST#
D $64A5 Clear the screen before a new location is shown.
  $64A5,$03 Call #R$64CE to switch to the normal screen output.
  $64A8,$03 Call #SKOOLKID$0D6B(CLS).
  $64AB,$01 Return.

c $64AC Clear Lines
@ $64AC label=ClearLines
E $64AC View the equivalent code in;
. #LIST
. { #SHOCK$9E0B }
. { #FOREST$BDF1 }
. { #HEROES$ABF8 }
. { #JEWELS$BA74 }
. { #WARLORD$A555 }
. LIST#
D $64AC Clear the lines given by *#R$629B from the bottom of the screen.
R $64AC B Line count from *#R$629B
  $64AC,$03 Call #R$64CE to switch to the normal screen output.
  $64AF,$07 Clear the number of lines held by *#R$629B from the bottom of the
. screen using #SKOOLKID$0E44(CL_LINE).
  $64B6,$01 Return.

c $64B7 Set Default Screen Position
@ $64B7 label=SetDefaultScreenPosition
E $64B7 View the equivalent code in;
. #LIST
. { #SHOCK$9E19 }
. { #FOREST$BDFC }
. { #HEROES$AC03 }
. { #JEWELS$BA7F }
. { #WARLORD$A560 }
. LIST#
D $64B7 Park the cursor at the top-left of the text area.
  $64B7,$03 Call #R$64CE to switch to the normal screen output.
  $64BA,$06 Place the cursor at row #N($03), column #N$21.
  $64C0,$01 Return.

c $64C1 Set Screen Position
@ $64C1 label=SetScreenPosition
E $64C1 View the equivalent code in;
. #LIST
. { #FOREST$BE06 }
. { #HEROES$AC0D }
. { #JEWELS$BA89 }
. { #WARLORD$A56A }
. LIST#
D $64C1 Move the cursor to the row stored for the next line of text.
R $64C1 A Line number to start printing at
  $64C1,$03 Call #R$64CE to switch to the normal screen output.
  $64C4,$03 Fetch the row the cursor should use.
  $64C7,$06 Place the cursor on that row, column #N$21.
  $64CD,$01 Return.

c $64CE Switch To Normal Screen Output
@ $64CE label=SwitchToNormalScreenOutput
E $64CE View the equivalent code in;
. #LIST
. { #FOREST$BE13 }
. { #HEROES$AC1A }
. { #JEWELS$BA96 }
. { #WARLORD$A577 }
. LIST#
D $64CE Send subsequent printing to the main screen.
  $64CE,$04 Keep the caller's registers while the screen channel is selected.
  $64D2,$05 Open channel #N($02), the main screen.
  $64D7,$04 Restore the registers the channel change used from the stack.
  $64DB,$01 Return.

c $64DC Print String
@ $64DC label=PrintString
E $64DC View the equivalent code in;
. #LIST
. { #SHOCK$A267 }
. { #FOREST$BE21 }
. { #HEROES$AC28 }
. { #JEWELS$BAA4 }
. { #WARLORD$A585 }
. LIST#
D $64DC Print a message terminated by #N$FF.
R $64DC HL Pointer to a message terminated by #N$FF
  $64DC,$03 Call #R$64CE to switch to the normal screen output.
@ $64DF label=PrintString_Loop
  $64DF,$0A Print each character of the message until the #N$FF terminator.

c $64E9 Print String And A Newline
@ $64E9 label=PrintStringAndANewline
E $64E9 View the equivalent code in;
. #LIST
. { #SHOCK$A275 }
. { #FOREST$BE2E }
. { #HEROES$AC35 }
. { #JEWELS$BAB1 }
. { #WARLORD$A592 }
. LIST#
D $64E9 Print a message terminated by #N($FF), then print a newline.
R $64E9 HL Pointer to a message terminated by #N$FF
  $64E9,$03 Call #R$64DC to print the message.
  $64EC,$02 Print a newline after the message.
  $64EE,$03 Call #R$64F2 to print the character.
  $64F1,$01 Return.

c $64F2 Print Character
@ $64F2 label=PrintCharacter
E $64F2 View the equivalent code in;
. #LIST
. { #SHOCK$9E26 }
. { #FOREST$BE37 }
. { #HEROES$AC47 }
. { #JEWELS$BAC3 }
. { #WARLORD$A5A4 }
. LIST#
D $64F2 Print a character, scrolling when the cursor reaches the bottom
. of the text area.
R $64F2 A Character to print
  $64F2,$01 Preserve the character to print.
  $64F3,$07 Jump to #R$650D when the cursor row in #SKOOLKID$5C88(S_POSN)
. (#N$5C89) is not #N$03.
  $64FA,$02 Restore the character from the stack, keeping a copy there.
  $64FC,$04 Jump to #R$6505 when this is not a newline (#N$0D).
N $6500 A newline scrolls the text area.
  $6500,$03 Call #R$6510 to scroll the screen.
  $6503,$01 Discard the character. A newline only scrolls.
  $6504,$01 Return.
@ $6505 label=PrintCharacter_Step1
N $6505 Check the column position.
  $6505,$08 Call #R$6510 to scroll when the column in #SKOOLKID$5C88(S_POSN) is
. #N$01.
@ $650D label=PrintCharacter_Step2
  $650D,$01 Restore the character to print from the stack.
N $650E Print the character.
  $650E,$01 Print the character with #SKOOLKID$0010(PRINT_A_1).
  $650F,$01 Return.

c $6510 Scroll Screen
@ $6510 label=ScrollScreen
E $6510 View the equivalent code in;
. #LIST
. { #FOREST$BE55 }
. { #HEROES$AC3E }
. { #JEWELS$BABA }
. { #WARLORD$A59B }
. LIST#
D $6510 Scroll the text area up one row and home the cursor.
  $6510,$08 Scroll the text area and home the cursor, preserving the game
. registers.
  $6518,$01 Return.

c $6519 Print Room Graphic
@ $6519 label=PrintRoomGraphic
E $6519 View the equivalent code in;
. #LIST
. { #FOREST$BE5E }
. { #HEROES$AD06 }
. { #JEWELS$BAE1 }
. LIST#
D $6519 Expand a room picture into the display file.
R $6519 I:IX Pointer to room image data
  $6519,$04 Count #N$10 display-file blocks (passes) and point #REGh at #N($40),
. the first block of the top third of the display file.
@ $651D label=PrintRoomGraphic_Loop1
N $651D Each pass fills one 256-byte block of the display file: pixel line n of
. all eight character rows in the top or middle third. #REGh is the high byte of
. the screen address, so the #N$10 values #N$40-#N$4F are pixel lines
. #N$00-#N$07
. of the top two thirds (128 pixels high, matching #N$10 attribute rows).
  $651D,$02 Start a new pass.
@ $651F label=PrintRoomGraphic_Loop2
  $651F,$0A Read the next (offset,byte) pair into #REGde.
  $6529,$04 A #N($00),#N$00 pair ends this pass.
  $652D,$04 Set #REGl to the offset and write the pixel byte there, then read
. the next pair.
@ $6531 label=PrintRoomGraphic_Step1
  $6531,$03 Move to the next display-file block until all #N$10 passes are done.
  $6534,$01 Return.

c $6535 Colour Room Image
@ $6535 label=Colour_RoomImage
E $6535 View the equivalent code in;
. #LIST
. { #FOREST$BEAC }
. { #HEROES$AD54 }
. { #JEWELS$BB2F }
. LIST#
D $6535 Copy the #N$0200 attribute bytes that follow the picture.
R $6535 IX Pointer to the room attribute data
  $6535,$0B Copy the #N$0200 attribute bytes onto the screen.
  $6540,$01 Return.

c $6541 Print Room Image
@ $6541 label=Print_RoomImage
E $6541 View the equivalent code in;
. #LIST
. { #SHOCK$9F28 }
. { #FOREST$BEB8 }
. { #HEROES$AD60 }
. { #JEWELS$BB3B }
. { #WARLORD$B10B }
. LIST#
D $6541 Draw a room picture and its attributes.
R $6541 IX Pointer to room image data
  $6541,$03 Call #R$6519 to expand the room picture.
  $6544,$03 Call #R$6535 to colour the room picture.
  $6547,$01 Return.

c $6548 Paint Room Image
@ $6548 label=PaintRoomImage
E $6548 View the equivalent code in;
. #LIST
. { #FOREST$BEBF }
. { #HEROES$AD67 }
. { #JEWELS$BB42 }
. LIST#
D $6548 Copy one attribute through the #N$0200 bytes of the room picture.
R $6548 I:A Attribute byte
  $6548,$07 Point #REGhl at the attribute file and count #N$0200
. bytes, keeping the attribute in #REGe.
@ $654F label=PaintRoomImage_Loop
  $654F,$07 Write that attribute through the rest of the picture.
  $6556,$01 Return.

c $6557 Handler: Turn-Based Events
@ $6557 label=HandlerTurnBasedEvents
D $6557 Count down the active turn-based events and run each one that expires.
E $6557 Continue on to #R$658A.
  $6557,$03 Fetch the turn-based event flags.
  $655A,$03 No turn-based event is running.
  $655D,$03 Keep the event flags and test all eight bits.
@ $6560 label=HandlerTurnBasedEvents_Loop1
N $6560 Each set bit is a countdown that is still running.
  $6560,$02 Take the next turn-based event bit.
  $6562,$02 This event is not running.
  $6564,$0C Count down the turn-based event whose bit was just set.
  $6570,$02 Leave this event when its countdown has not expired.
  $6572,$04 Find the handler for this turn-based event.
  $6576,$04 Index the handler for this event.
  $657A,$06 Read that handler's address.
  $6580,$01 Remember which events are still to be checked.
@ $6581 label=HandlerTurnBasedEvents_Step1
  $6581,$05 Run the handler, then return here for the remaining events.
  $6586,$01 Restore the event flags still to be checked.
@ $6587 label=HandlerTurnBasedEvents_Step2
  $6587,$02 Repeat for the remaining event bits.
@ $6589 label=HandlerTurnBasedEvents_Step3
  $6589,$01 Leave this event for the next turn.

c $658A Handler: Scenic Events
@ $658A label=HandlerScenicEvents
E $658A View the equivalent code in;
. #LIST
. { #SHOCK$AC88 }
. { #FOREST$C3FA }
. { #HEROES$B6E0 }
. { #JEWELS$C4EB }
. { #WARLORD$AFEB }
. LIST#
D $658A Walk the scenic-event bits and fire a handler when the player is in its
. room.
  $658A,$03 Fetch the scenic-event flags.
  $658D,$03 No scenic event is running.
  $6590,$03 Keep the scenic flags and test all eight bits.
@ $6593 label=HandlerScenicEvents_Loop1
N $6593 Each set bit is a scenic event that can plant a message.
  $6593,$02 Take the next scenic-event bit.
  $6595,$02 This scenic event is not running.
  $6597,$09 Index this scenic event's message list.
  $65A0,$01 Remember which scenic bits are still to be checked.
  $65A1,$04 Let the frame counter choose how far to walk the message list.
  $65A5,$04 Find the messages for this scenic event.
  $65A9,$04 Point at this event's messages and prepare the end marker.
@ $65AD label=HandlerScenicEvents_Loop2
  $65AD,$06 Read the address of this event's message list.
@ $65B3 label=HandlerScenicEvents_Loop3
  $65B3,$06 Walk the list for as many frames as have passed.
  $65B9,$01 Step back to the message those frames selected.
  $65BA,$02 Recover the event number from the list index.
  $65BC,$04 Find the room this scenic event belongs to.
  $65C0,$02 Point at this event's room.
  $65C2,$01 Restore the scenic flags still to be checked.
  $65C3,$03 Fetch the current room.
  $65C6,$05 Leave the event alone when the player is already in its room.
  $65CB,$04 Plant the chosen message in this event's room.
@ $65CF label=HandlerScenicEvents_Step1
  $65CF,$02 Repeat for the remaining scenic events.
@ $65D1 label=HandlerScenicEvents_Step2
  $65D1,$01 Return.

c $65D2 Pause Loop
@ $65D2 label=Pause_Loop
E $65D2 View the equivalent code in;
. #LIST
. { #SHOCK$9E2F }
. { #FOREST$BF41 }
. { #HEROES$AC65 }
. { #JEWELS$BB51 }
. { #WARLORD$A5C2 }
. LIST#
D $65D2 Pause for the number of frames passed by the caller.
R $65D2 B Number of frames to wait
  $65D2,$01 Wait for the next frame.
  $65D3,$02 Wait out the remaining frames.
  $65D5,$01 Return.

c $65D6 Generate Random Number
@ $65D6 label=GenerateRandomNumber
E $65D6 View the equivalent code in;
. #LIST
. { #SHOCK$AD25 }
. { #FOREST$BF45 }
. { #HEROES$B77F }
. { #JEWELS$C582 }
. { #WARLORD$B08A }
. LIST#
D $65D6 Return a number derived from the frame counter, used when an event may
. or
. may not happen.
R $65D6 O:A A random number derived from *#SKOOLKID$5C78(FRAMES)
  $65D6,$07 Take the frame counter as a countdown, limited by the value passed
. in.
@ $65DD label=GenerateRandomNumber_Loop1
  $65DD,$04 Wrap back to that limit when the countdown passes zero.
@ $65E1 label=GenerateRandomNumber_Step1
  $65E1,$02 Repeat for every frame that has passed.
  $65E3,$01 Step the result back one more.
  $65E4,$01 Restore the registers the caller needs from the stack.
  $65E5,$01 Return.

c $65E6 Handler: Update Object Location
@ $65E6 label=UpdateObjectLocation
E $65E6 View the equivalent code in;
. #LIST
. { #FOREST$BF55 }
. { #JEWELS$C412 }
. LIST#
D $65E6 Write a new location for an object. The caller passes the object and the
. room, or #N$01 when the object is carried.
  $65E6,$04 An ordinary object is stored in the location table.
  $65EA,$02 The scenic marker is not part of the object number.
  $65EC,$05 Continue at #R$65F4 to store this scenic
. object's room.
@ $65F1 label=UpdateObjectLocation_Step1
  $65F1,$03 The ordinary objects are kept in the location table.
@ $65F4 label=UpdateObjectLocation_Step2
  $65F4,$05 Store the new location for this object.
  $65F9,$01 Return.

c $65FA Is Object Present?
@ $65FA label=IsObjectPresent
E $65FA View the equivalent code in;
. #LIST
. { #FOREST$BF69 }
. LIST#
D $65FA Report whether any object is in the room passed by the caller.
  $65FA,$04 Fetch the number of objects.
  $65FE,$03 The ordinary objects are kept in the location table.
  $6601,$02 Search the object locations for anything in this room.
  $6603,$01 Return.

c $6604 Handler: User Input
@ $6604 label=Handler_UserInput
E $6604 Continue on to #R$6669.
E $6604 View the equivalent code in;
. #LIST
. { #SHOCK$A4B0 }
. { #FOREST$BF73 }
. { #HEROES$B200 }
. { #JEWELS$C00A }
. { #WARLORD$AD32 }
. LIST#
D $6604 Read a line of text, then turn it into vocabulary tokens.
N $6604 Reset the cursor to the default text position.
  $6604,$03 Call #R$64B7.
N $6607 Clear the command buffer.
  $6607,$07 Blank #R$625F with #N$32 spaces.
@ $660E label=Handler_UserInput_Loop1
  $660E,$04 Write spaces through the command buffer.
N $6612 Print the ">" prompt.
  $6612,$03 Call #R$6A1C.
N $6615 Collect keypresses into the command buffer.
  $6615,$03 Start at the beginning of #R$625F.
@ $6618 label=Handler_UserInput_Loop2
N $6618 Wait for the next key.
  $6618,$03 Call #R$6495.
N $661B DELETE rubs out a character. ENTER finishes the line. Any other
. control key is ignored.
  $661B,$04 Jump to #R$663B if DELETE was pressed.
  $661F,$04 Jump to #R$6652 if ENTER was pressed.
  $6623,$04 Jump back to #R$6618 when the key is below SPACE.
N $6627 Is the command buffer full?
  $6627,$0A Jump back to #R$6618 once the pointer has reached the end of
. #R$625F.
N $6631 The key is valid, so store it and print it.
  $6631,$0A Write the key into the buffer and echo it.
@ $663B label=Handler_UserInput_Step1
N $663B The player pressed DELETE.
  $663B,$0A Jump back to #R$6618 when the buffer is still empty.
N $6645 Rub the previous character off the screen.
N $6645 Print "#MESSAGE$62E3".
  $6645,$0D Print "#MESSAGE$62E3" and blank the previous character.
@ $6652 label=Handler_UserInput_Step2
N $6652 The player pressed ENTER, so close the command and clear the tokens.
  $6652,$07 Store ENTER as the terminator and echo the newline.
N $6659 Initialise the word token buffer. Up to #N$0A vocabulary tokens are
. stored at #R$6291; #N$FF marks an empty slot.
  $6659,$07 Point at #R$6291 and prepare the empty marker (#N$FF).
@ $6660 label=Handler_UserInput_Loop3
  $6660,$04 Write #N$FF into each of the #N$0A token slots.
  $6664,$05 Start at the command and allow #N$0A words, then fall into
. #R$6669.

c $6669 Parser: Match Input Word
@ $6669 label=Parser_MatchInputWord
E $6669 View the equivalent code in;
. #LIST
. { #FOREST$BFC1 }
. { #HEROES$B24E }
. { #JEWELS$C058 }
. LIST#
D $6669 Split the command into words and look each one up in the vocabulary.
N $6669 Blank the four-character word buffer.
  $6669,$03 Start at the word buffer (#R$629E).
  $666C,$02 A word is at most four letters.
  $666E,$02 Pad the typed word with spaces.
@ $6670 label=Parser_MatchInputWord_Loop1
  $6670,$04 Write spaces through the word buffer.
  $6674,$02 Jump to #R$6745 when no token slots remain.
  $6676,$03 Jump to #R$6745 when the command has ended.
  $6679,$01 Read the next character of the command.
  $667A,$05 Jump to #R$6745 when ENTER ends the command.
N $667F Copy the next word, up to #N$04 characters, stopping at a space, a
. comma or ENTER.
  $667F,$02 Keep at most four letters of this word.
  $6681,$03 Point at the word buffer again.
@ $6684 label=Parser_MatchInputWord_Loop2
  $6684,$05 Jump to #R$66B0 when the character is ENTER.
  $6689,$08 Jump to #R$66A6 when the character is a space or a comma.
  $6691,$05 Copy the character into the word buffer and advance both
. pointers.
@ $6696 label=Parser_MatchInputWord_Loop3
N $6696 A longer word is skipped up to the next delimiter.
  $6696,$05 Jump to #R$66B0 on ENTER.
  $669B,$08 Jump to #R$66A6 on a space or a comma.
  $66A3,$03 Skip this character and keep looking for a delimiter.
@ $66A6 label=Parser_MatchInputWord_Loop4
  $66A6,$06 Skip consecutive spaces.
  $66AC,$04 Jump back to #R$66A6 when that character is a comma (#N$2C).
@ $66B0 label=Parser_MatchInputWord_Step1
N $66B0 Ignore the word "THE ".
  $66B0,$09 Compare the word with "#MESSAGE$62E7" without losing the
. command pointer.
@ $66B9 label=Parser_MatchInputWord_Loop5
  $66B9,$08 Match the four letters of "THE ".
@ $66C1 label=Parser_MatchInputWord_Step2
  $66C1,$04 Jump back to #R$6669 when the word was THE, so it is not
. tokenised.
  $66C5,$06 Search the vocabulary addressed by *#R$629C.
@ $66CB label=Parser_MatchInputWord_Loop6
N $66CB Look the word up in the vocabulary. A comma separates synonyms.
  $66CB,$01 Read the next vocabulary letter.
  $66CC,$04 Jump to #R$66FD when the vocabulary list ends (#N$FF).
@ $66D0 label=Parser_MatchInputWord_Loop7
  $66D0,$03 Point at the word buffer.
  $66D3,$02 Compare four letters of this vocabulary word.
@ $66D5 label=Parser_MatchInputWord_Loop8
  $66D5,$08 Match the typed word against this vocabulary entry.
N $66DD Word matched. Store its vocabulary index in the token buffer and
. parse the next word.
  $66DD,$0E Store this vocabulary number as the current word's token.
  $66EB,$03 Jump to #R$6669 to read the next word.
@ $66EE label=Parser_MatchInputWord_Step3
N $66EE This vocabulary entry did not match. Try a synonym after a comma,
. else the next entry.
  $66EE,$04 Skip the letters left in a word that did not match.
  $66F2,$01 Read the byte that follows this vocabulary word.
  $66F3,$04 A comma marks another synonym of the same word.
  $66F7,$01 Step past that comma.
  $66F8,$02 Jump to #R$66D0 to match this synonym.
@ $66FA label=Parser_MatchInputWord_Step4
  $66FA,$01 Try the next vocabulary word.
  $66FB,$02 Jump to #R$66CB.
@ $66FD label=Parser_MatchInputWord_Step5
N $66FD The word is not in the vocabulary, so quote it and ask again.
  $66FD,$08 Find the unknown word in the command buffer.
@ $6705 label=Parser_MatchInputWord_Loop9
  $6705,$01 Step back to the previous word of the command.
  $6706,$02 This is the word the game could not recognise.
@ $6708 label=Parser_MatchInputWord_Loop10
  $6708,$0C Find the end of the previous word.
@ $6714 label=Parser_MatchInputWord_Loop11
  $6714,$06 Skip the gap after that word.
  $671A,$04 Jump back to #R$6714 when that character is a comma (#N$2C).
  $671E,$02 Jump back to #R$6705 to count back another word.
@ $6720 label=Parser_MatchInputWord_Step6
  $6720,$01 Remember where the unknown word starts.
N $6721 Print "#MESSAGE$6300".
  $6721,$06 Print "#MESSAGE$6300".
  $6727,$01 Restore the start of the unknown word.
  $6728,$05 Print a quotation mark before the unknown word.
@ $672D label=Parser_MatchInputWord_Loop12
  $672D,$0B Print the characters of the unknown word.
@ $6738 label=Parser_MatchInputWord_Step7
  $6738,$05 Close the quotation.
N $673D Print "#MESSAGE$646B".
  $673D,$06 Print "#MESSAGE$646B".
  $6743,$02 Jump to #R$6751 to ask for another command.

c $6745 Handler: Unknown Word
@ $6745 label=Handler_UnknownWord
E $6745 View the equivalent code in;
. #LIST
. { #FOREST$C0B4 }
. { #HEROES$B364 }
. LIST#
D $6745 Print "I don't understand." when the command did not match a verb, then
. ask
. again.
  $6745,$03 Fetch the first word of the command.
  $6748,$03 Return if the first word of the command is not the end marker
. (#N$FF).
  $674B,$06 Print #MESSAGE$62EC.
@ $6751 label=Handler_UnknownWord_Step1
  $6751,$03 Jump to #R$6604 to read another command.

c $6754 Get Table Entry
@ $6754 label=GetTableEntry
E $6754 View the equivalent code in;
. #LIST
. { #SHOCK$A305 }
. { #FOREST$C0C3 }
. { #HEROES$B3F1 }
. { #JEWELS$C1F0 }
. { #WARLORD$AB88 }
. LIST#
D $6754 Retrieve an address from a table using a given index.
R $6754 E Index of the entry
R $6754 IX Base table address
R $6754 O:HL Address from the table entry
R $6754 O:IX Address of the table entry
  $6754,$0E Look up the address stored at this index.
  $6762,$01 Return.

c $6763 Print Objects
@ $6763 label=PrintObjects
E $6763 View the equivalent code in;
. #LIST
. { #SHOCK$A314 }
. { #FOREST$C0D2 }
. { #HEROES$B400 }
. { #JEWELS$C1FF }
. { #WARLORD$AB97 }
. LIST#
D $6763 List the objects in the room passed by the caller.
  $6763,$03 Point at the object locations.
  $6766,$04 Fetch the number of objects.
N $676A Search for the next object in this place.
@ $676A label=PrintObjects_Loop1
  $676A,$02 Find the next object that is in this room.
  $676C,$01 Return when no further object is in this room.
  $676D,$03 Keep the search state while this object's name is printed.
  $6770,$03 Fetch the number of objects.
  $6773,$03 The bytes still to search give this object's number.
  $6776,$04 Fetch the object-description table.
  $677A,$03 Call #R$6754 to look up the table entry.
  $677D,$03 Print the object's name and start a new line.
  $6780,$03 Restore the search and keep listing objects.
  $6783,$04 Keep the room number and continue while objects remain.
  $6787,$02 Jump back to #R$676A until all objects in the table have been
. checked.
N $6789 All matching objects have been printed.
  $6789,$01 Return.

c $678A Handler: Display Room
@ $678A label=Handler_DisplayRoom
E $678A View the equivalent code in;
. #LIST
. { #SHOCK$A33A }
. { #FOREST$C0F9 }
. { #HEROES$B46B }
. { #JEWELS$C26A }
. { #WARLORD$AC02 }
. LIST#
D $678A Draw the current location, its exits and the objects that are here.
  $678A,$01 Remember whether the caller asked for the picture.
  $678B,$03 Call #R$64A5 to clear the screen.
  $678E,$01 Restore that request.
  $678F,$03 Fetch how many rooms have a picture.
  $6792,$03 No room has a picture.
  $6795,$03 Fetch the current room.
  $6798,$03 Fetch the list of rooms that have a picture.
  $679B,$04 Fetch how many rooms have a picture.
  $679F,$02 Find this room in the list of pictures.
  $67A1,$02 This room has no picture.
  $67A3,$03 Fetch how many rooms have a picture.
  $67A6,$03 Recover this room's slot in the picture list.
  $67A9,$02 A nonzero request draws the picture even when it has been seen.
  $67AB,$02 Skip the seen-flag test when the picture was requested again.
  $67AD,$03 Check whether this room's picture has been shown.
  $67B0,$01 The picture slot selects its seen flag.
@ $67B1 label=Handler_DisplayRoom_Loop1
  $67B1,$04 Jump to #R$67BA when the picture slot is below #N($08), in this flag
. byte.
  $67B5,$03 Move to the next flag byte while the slot is past this one.
  $67B8,$02 Continue at #R$67B1 to test the next picture-seen flag.
@ $67BA label=Handler_DisplayRoom_Step1
  $67BA,$04 Build the bit that belongs to this picture.
@ $67BE label=Handler_DisplayRoom_Loop2
  $67BE,$02 Shift that bit into place.
  $67C0,$02 Repeat until the bit lines up with this picture.
  $67C2,$01 Read the seen flags for these pictures.
  $67C3,$01 See whether this picture has already been shown.
  $67C4,$02 Skip the picture when it has already been shown.
  $67C6,$03 Remember that this picture has now been shown.
@ $67C9 label=Handler_DisplayRoom_Step2
  $67C9,$05 Start the picture on text row #N$08.
  $67CE,$03 The display flags record the room picture.
  $67D1,$02 Remember to wait for a key once the picture is drawn.
  $67D3,$04 Fetch the room-picture handlers.
  $67D7,$01 The picture slot selects its drawing routine.
  $67D8,$03 Call #R$6754 to look up the table entry.
@ $67DB label=Handler_DisplayRoom_Step3
  $67DB,$05 Draw the picture, then continue with the room text.
@ $67E0 label=Handler_DisplayRoom_Step4
  $67E0,$03 Call #R$64C1 to move the cursor to the stored row.
  $67E3,$05 Continue the description on text row #N$18.
  $67E8,$03 Fetch the current room.
  $67EB,$04 Fetch the room-description table.
  $67EF,$01 The current room selects its description.
  $67F0,$03 Call #R$6754 to look up the table entry.
  $67F3,$03 Print the room description and start a new line.
  $67F6,$03 The display flags record a picture waiting for a key.
  $67F9,$04 No picture is waiting for a key.
  $67FD,$02 The picture no longer waits for a key.
  $67FF,$03 Call #R$6495 to wait for a keypress.
@ $6802 label=Handler_DisplayRoom_Step5
  $6802,$03 Call #R$6892 to find the exit record.
  $6805,$06 There are six exits to count.
  $680B,$01 A zero byte means that direction is closed.
@ $680C label=Handler_DisplayRoom_Loop3
N $680C Count the open exits so they can be listed.
  $680C,$04 Count this exit when it is open.
@ $6810 label=Handler_DisplayRoom_Step6
  $6810,$03 Move on to the next direction.
  $6813,$01 See whether any exit is open.
  $6814,$02 Skip the exit list when the room has none.
  $6816,$01 One open exit uses the singular wording.
  $6817,$04 More than one open exit uses the plural line.
  $681B,$06 Print #MESSAGE$6347 on the same line.
  $6821,$09 Return to the exit record and the direction names.
@ $682A label=Handler_DisplayRoom_Loop4
  $682A,$05 Skip a closed exit and its direction name.
@ $682F label=Handler_DisplayRoom_Step7
  $682F,$03 Keep skipping while this exit is closed.
  $6832,$06 Read the name of this open exit.
  $6838,$03 Call #R$64DC to print the message.
  $683B,$02 Continue at #R$6878 to end the list of exits.
@ $683D label=Handler_DisplayRoom_Step8
  $683D,$06 Print #MESSAGE$6334.
  $6843,$09 Return to the exit record and the direction names.
@ $684C label=Handler_DisplayRoom_Loop5
  $684C,$01 Hold the exit record while the next name is printed.
@ $684D label=Handler_DisplayRoom_Loop6
  $684D,$05 Skip a closed exit and its direction name.
@ $6852 label=Handler_DisplayRoom_Step9
  $6852,$03 Keep skipping while this exit is closed.
  $6855,$01 Bring the exit record back after printing a name.
  $6856,$06 Read the name of this open exit.
  $685C,$03 Call #R$64DC to print the message.
  $685F,$02 One fewer exit name remains.
  $6861,$04 Finish the list when no exit name remains.
  $6865,$02 The last remaining exit is joined with "and".
  $6867,$02 Separate these exit names with a comma.
  $6869,$03 Call #R$64F2 to print the character.
  $686C,$01 Prepare to test the next exit.
  $686D,$02 Continue at #R$684C to name another open exit.
@ $686F label=Handler_DisplayRoom_Step10
  $686F,$06 Print #MESSAGE$6330 on the same line.
  $6875,$01 Prepare to test the next exit.
  $6876,$02 Continue at #R$684C to name the last open exit.
@ $6878 label=Handler_DisplayRoom_Step11
  $6878,$06 Print #MESSAGE$646B.
@ $687E label=Handler_DisplayRoom_Step12
  $687E,$03 Fetch the current room.
  $6881,$03 Call #R$65FA to see whether anything is in the room.
  $6884,$01 Return when the room is empty.
  $6885,$06 Print #MESSAGE$6321.
  $688B,$03 Fetch the current room.
  $688E,$03 Call #R$6763 to list the objects here.
N $6891 The exits and objects for this room are done.
  $6891,$01 Return.

c $6892 Get Room Pointer
@ $6892 label=GetRoomPointer
E $6892 View the equivalent code in;
. #LIST
. { #SHOCK$A41C }
. { #FOREST$C201 }
. { #HEROES$B503 }
. { #JEWELS$C302 }
. { #WARLORD$AC9A }
. LIST#
D $6892 Find the six-byte exit record for the current room.
  $6892,$03 Fetch the current room.
  $6895,$0E Point at the six-byte exit record for this room.
  $68A3,$01 Return.

c $68A4 Parser: Resolve Phrase
@ $68A4 label=Parser_ResolvePhrase
E $68A4 View the equivalent code in;
. #LIST
. { #SHOCK$A591 }
. { #FOREST$C213 }
. { #HEROES$B52B }
. { #JEWELS$C32A }
. { #WARLORD$AE36 }
. LIST#
D $68A4 Walk this noun's object list from #R$62D2 and call #R$68E0 for each
. object. Return if one is in the current room or the inventory. Otherwise
. print "#MESSAGE$6378", the noun name from #R$62D4 and "#MESSAGE$6385",
. then set the carry flag.
R $68A4 BC Count left by the caller's object-list search
R $68A4 O:F Carry flag set when the object is not here
  $68A4,$01 Adjust the search count for the index sum.
  $68A5,$03 Fetch how many nouns the game knows.
  $68A8,$05 Turn that count into this noun's index and end marker (#N$FE).
  $68AD,$03 Point at the noun-phrase table (*#R$62D2).
  $68B0,$01 Count the phrase terminator as one more step.
  $68B1,$02 Jump to #R$68B8 to skip phrases before this noun.
@ $68B3 label=Parser_ResolvePhrase_Loop1
  $68B3,$01 Skip a byte inside the phrase just passed.
@ $68B4 label=Parser_ResolvePhrase_Loop2
  $68B4,$04 Keep skipping while this byte is the marker being sought.
@ $68B8 label=Parser_ResolvePhrase_Step1
  $68B8,$02 Repeat for each phrase before this noun.
  $68BA,$02 Jump to #R$68BD to test the first object.
@ $68BC label=Parser_ResolvePhrase_Loop3
  $68BC,$01 Step to the next object in the phrase.
@ $68BD label=Parser_ResolvePhrase_Step2
  $68BD,$01 Read the object this phrase refers to.
  $68BE,$03 Call #R$68E0.
  $68C1,$01 Return when that object is here or being carried.
  $68C2,$01 Step to the next byte of the phrase.
  $68C3,$01 Read the marker that follows the object.
  $68C4,$04 Jump back to #R$68BC when another object follows (#N$FE).
N $68C8 None of this noun's objects is in the room or the inventory.
N $68C8 Print "#MESSAGE$6378".
  $68C8,$06 Print "#MESSAGE$6378".
N $68CE Print the noun name.
  $68CE,$04 Point #REGix at the noun table (*#R$62D4).
  $68D2,$03 Call #R$6754.
  $68D5,$03 Call #R$64DC to print the name.
N $68D8 Print "#MESSAGE$6385".
  $68D8,$06 Print "#MESSAGE$6385".
  $68DE,$01 Set the carry flag to reject the command.
  $68DF,$01 Return.

c $68E0 Is Object In The Current Room?
@ $68E0 label=IsObjectInCurrentRoom
E $68E0 View the equivalent code in;
. #LIST
. { #SHOCK$A5C6 }
. { #FOREST$C24F }
. { #HEROES$B560 }
. { #JEWELS$C35F }
. { #WARLORD$AE6B }
. LIST#
D $68E0 Report whether the given object is in the current room or is
. being carried.
R $68E0 A Object number
R $68E0 O:F Zero flag set when the object is in the current room
  $68E0,$02 Keep the caller's registers while the location is tested.
  $68E2,$03 Index the location tables by this object.
  $68E5,$04 Bit 7 selects a scenic slot rather than an ordinary object.
  $68E9,$05 Continue at #R$68F3 to compare an ordinary
. object's location.
@ $68EE label=IsObjectInCurrentRoom_Step1
  $68EE,$02 The scenic marker is not part of the object number.
  $68F0,$03 A scenic object is kept with the scenic rooms.
@ $68F3 label=IsObjectInCurrentRoom_Step2
  $68F3,$01 Index this object's byte in the location table.
  $68F4,$03 Fetch the current room.
  $68F7,$03 The object is here when its location is the current room.
  $68FA,$03 A carried object counts as present too.
@ $68FD label=IsObjectInCurrentRoom_Step3
  $68FD,$02 Restore the registers the caller needs from the stack.
  $68FF,$01 Return.

c $6900 Parser: Advance To Separator
@ $6900 label=Parser_AdvanceToSeparator
E $6900 View the equivalent code in;
. #LIST
. { #SHOCK$A5DB }
. { #FOREST$C26F }
. { #HEROES$B575 }
. { #JEWELS$C37F }
. { #WARLORD$AE80 }
. LIST#
D $6900 Match phrase patterns with multiple wordings against the typed
. tokens after the verb.
R $6900 HL Pointer to phrase token data
R $6900 O:F Z flag set when the input matches any wording
  $6900,$01 Switch the phrase token pointer to #REGde.
  $6901,$02 Jump to #R$6904.
@ $6903 label=Parser_AdvanceToSeparator_Loop1
N $6903 Skip the separator.
  $6903,$01 Advance to the next byte of the phrase.
@ $6904 label=Parser_AdvanceToSeparator_Step1
N $6904 Fetch the second user input token (not the verb).
N $6904 For example; "TAKE" (verb) "KEY" (direct object).
  $6904,$03 #REGhl=#R$6292.
  $6907,$02 Jump to #R$690B.
@ $6909 label=Parser_AdvanceToSeparator_Loop2
N $6909 The tokens matched, so advance both pointers.
  $6909,$01 Advance the input token pointer.
  $690A,$01 Advance the phrase token pointer.
@ $690B label=Parser_AdvanceToSeparator_Step2
N $690B Keep looping while the tokens match.
  $690B,$01 Read the next byte of the phrase.
  $690C,$03 Jump to #R$6909 while this token agrees with the phrase.
N $690F The tokens differ. Is this the end of the wording (#N$FE)?
  $690F,$04 Jump to #R$6917 unless this is the terminator (#N$FE).
N $6913 The input matched this wording.
  $6913,$01 Fetch the next input token.
  $6914,$02 Return with the Z flag set when the command has also ended
. (#N$FF).
  $6916,$01 Return.
@ $6917 label=Parser_AdvanceToSeparator_Step3
N $6917 Is this an alternative separator (#N$FD)?
  $6917,$04 Jump to #R$6921 unless this is the separator (#N$FD).
  $691B,$01 Fetch the next input token.
  $691C,$04 Jump back to #R$6903 when more input remains.
  $6920,$01 Return.
@ $6921 label=Parser_AdvanceToSeparator_Loop3
N $6921 This wording failed; skip to the next alternative.
  $6921,$0A Skip ahead to the next separator or terminator.
  $692B,$02 Jump back to #R$6903 to try the next wording.
@ $692D label=Parser_AdvanceToSeparator_Step4
N $692D No wording matched.
  $692D,$01 Clear the Z flag.
  $692E,$01 Return.

c $692F Parser: Find Phrase
@ $692F label=Parser_FindPhrase
E $692F View the equivalent code in;
. #LIST
. { #SHOCK$A60A }
. { #FOREST$C29E }
. { #HEROES$B5A4 }
. { #JEWELS$C3AE }
. { #WARLORD$AEAF }
. LIST#
D $692F Count how many tokens in the user input refer to known nouns.
R $692F O:A The number of noun references in the user input tokens
R $692F O:E As #REGa
R $692F O:F The Z flag is set when no nouns are present in the input
  $692F,$03 Set a pointer to #R$6291 in #REGhl.
  $6932,$02 Set a token count in #REGb of #N$0A.
  $6934,$02 Initialise the noun counter in #REGe to #N$00.
@ $6936 label=Parser_FindPhrase_Loop1
  $6936,$01 Fetch a user input token.
  $6937,$04 Jump to #R$694C if the terminator (#N$FF) has been reached.
  $693B,$0B Search *#R$62D6 for this token among *#R$62C8 nouns.
  $6946,$02 Jump to #R$6949 if this token is not a noun.
N $6948 This token names a noun, so increase the counter.
  $6948,$01 Increment the noun counter by one.
@ $6949 label=Parser_FindPhrase_Step1
  $6949,$01 Move to the next token.
  $694A,$02 Decrease the token counter and loop back to #R$6936 until done.
@ $694C label=Parser_FindPhrase_Step2
  $694C,$02 Transfer the noun count into #REGa and set flags.
  $694E,$01 Return.

c $694F Get Object Location
@ $694F label=GetObjectLocation
E $694F View the equivalent code in;
. #LIST
. { #SHOCK$A62C }
. { #FOREST$C2BE }
. { #HEROES$B5C6 }
. { #JEWELS$C3D0 }
. { #WARLORD$AED1 }
. LIST#
D $694F Return the location of the given object.
R $694F I:A Object number
R $694F O:A Location of the object
  $694F,$08 Read where this object is.
  $6957,$01 Return.

c $6958 Is Object Carried?
@ $6958 label=IsObjectCarried
E $6958 View the equivalent code in;
. #LIST
. { #FOREST$C2D2 }
. LIST#
D $6958 Report whether the given object is being carried.
  $6958,$03 Call #R$694F to read the object's location.
  $695B,$02 Compare with #N$01.
  $695D,$01 Return.

c $695E Handler: Toggle Scenic Flag
@ $695E label=HandlerToggleScenicFlag
D $695E Flip the scenic-event bit selected by the caller.
R $695E I:A Bit number
  $695E,$01 Remember the caller's registers.
  $695F,$03 Start with the bit for scenic event zero.
  $6962,$03 Event zero uses that bit as it stands.
@ $6965 label=HandlerToggleScenicFlag_Loop1
  $6965,$02 Line the bit up with this scenic event.
  $6967,$02 Repeat until the bit matches that event.
@ $6969 label=HandlerToggleScenicFlag_Step1
  $6969,$03 Fetch the scenic-event flags.
  $696C,$01 Flip this scenic event's bit.
  $696D,$03 Store the scenic-event flags.
  $6970,$01 Restore the registers the caller needs from the stack.
  $6971,$01 Return.

c $6972 Parser: Validate No Direct Object
@ $6972 label=Parser_ValidateNoDirectObject
E $6972 View the equivalent code in;
. #LIST
. { #SHOCK$ABF4 }
. { #FOREST$C2FE }
. { #HEROES$B665 }
. { #JEWELS$C470 }
. { #WARLORD$AF70 }
. LIST#
D $6972 The opposite of #R$697D; checks that there is no direct object.
R $6972 O:F The Z flag is set when there is no direct object present
R $6972 O:F The carry flag is set when there is a second token set
  $6972,$06 Return if the second token (*#R$6292) is the terminator
. (#N$FF).
N $6978 The command must not name an object.
  $6978,$03 Call #R$6479.
  $697B,$01 Set the carry flag to indicate the command is malformed.
  $697C,$01 Return.

c $697D Parser: Validate Direct Object
@ $697D label=Parser_ValidateDirectObject
E $697D View the equivalent code in;
. #LIST
. { #SHOCK$AC02 }
. { #FOREST$C309 }
. { #HEROES$B670 }
. { #JEWELS$C47B }
. { #WARLORD$AF7B }
. LIST#
D $697D In most adventure games, the structure for a command is "verb +
. direct object". The verb describes the action, and the direct object is
. what the action is performed on. For example; "TAKE KEY" uses the verb
. "TAKE" on the direct object "KEY".
R $697D O:F The carry flag is set when the command is malformed
N $697D The first token is the verb, so target the second token for the
. direct object.
  $697D,$03 Fetch the #R$6292(second token from the user input) into
. #REGa.
  $6980,$04 Jump forward to #R$6989 if the token is anything other than
. the terminator (#N$FF).
N $6984 The token was the terminator (#N$FF), so the sentence is
. malformed.
N $6984 E.g. They tried "TAKE" but didn't write anything after it.
  $6984,$03 Call #R$6480.
  $6987,$01 Set the carry flag to indicate this call was a failure.
  $6988,$01 Return.
N $6989 Process the direct object.
@ $6989 label=Parser_ValidateDirectObject_Step1
  $6989,$03 Call #R$692F.
  $698C,$01 Return if at least one noun was named.
  $698D,$03 Call #R$6479.
  $6990,$01 Set the carry flag to indicate the command is malformed.
  $6991,$01 Return.

c $6992 Parser: Match Or Rephrase
@ $6992 label=Parser_MatchOrRephrase
E $6992 View the equivalent code in;
. #LIST
. { #SHOCK$AC1D }
. { #FOREST$C31E }
. { #HEROES$B685 }
. { #JEWELS$C490 }
. { #WARLORD$AF90 }
. LIST#
D $6992 Allow a command with no object. Otherwise require a named noun.
R $6992 O:F The zero flag is set when there is only a verb present
R $6992 O:F The zero flag is unset when there is at least one valid noun
R $6992 O:F The carry flag is set when the command is malformed
N $6992 The first token is the verb, so target the second token for the
. direct object.
  $6992,$03 Fetch the #R$6292(second token from the user input) into
. #REGa.
  $6995,$03 Return if there is no second token.
N $6998 There is a second token; validate that it names a noun.
  $6998,$03 Call #R$692F.
  $699B,$01 Return if there is at least one valid noun.
N $699C Any references are invalid.
  $699C,$03 Call #R$6479.
  $699F,$01 Set the carry flag.
  $69A0,$01 Return.

c $69A1 Save Game
@ $69A1 label=SaveGame
E $69A1 View the equivalent code in;
. #LIST
. { #SHOCK$9E80 }
. { #FOREST$C345 }
. { #HEROES$AC6D }
. { #JEWELS$BB59 }
. { #WARLORD$A5CA }
. LIST#
D $69A1 Save the game position to tape.
  $69A1,$03 Fetch how many locations the save file stores.
  $69A4,$03 Jump to #R$69C0 if there are no saved locations to pack.
  $69A7,$0A Copy the saved-location count into #REGb and point at the location
. table and the tape workspace.
N $69B1 Move on to the next saved-location address.
@ $69B1 label=SaveGame_Copy
  $69B1,$05 Move #REGix on to the next saved-location address and #REGde on to
. the next packed location byte.
@ $69B6 label=SaveGame_StoreFlag
  $69B6,$06 Fetch the location address from *#REGix into #REGhl.
  $69BC,$02 Copy the location byte into the packed save buffer.
  $69BE,$02 Decrease the pack counter and loop back to #R$69B1 until every
. location byte is packed.
N $69C0 Print "#MESSAGE$63D3".
@ $69C0 label=SaveGame_PrintSaving
  $69C0,$06 Print "#MESSAGE$63D3".
  $69C6,$03 Call #R$6495 to wait for a keypress.
  $69C9,$04 Load the starting address into #REGix at the object locations.
  $69CD,$03 Set the block length in #REGde to #N($00B4,$04,$04) bytes.
  $69D0,$02 Set #REGa to #N$FF which indicates this is a data block.
  $69D2,$03 Call #SKOOLKID$04C2(SA_BYTES).
N $69D5 Print "#MESSAGE$63F5".
  $69D5,$06 Print "#MESSAGE$63F5".
  $69DB,$01 Return.

c $69DC Load From Tape
@ $69DC label=LoadTape
E $69DC View the equivalent code in;
. #LIST
. { #SHOCK$9EDB }
. { #FOREST$C380 }
. { #HEROES$ACA8 }
. { #JEWELS$BB94 }
. { #WARLORD$A605 }
. LIST#
D $69DC Load a game position from tape and redraw the room.
N $69DC Print "#MESSAGE$63B2".
  $69DC,$06 Print "#MESSAGE$63B2".
  $69E2,$04 Load the starting address into #REGix at the object locations.
  $69E6,$03 Set the block length in #REGde to #N($00B4,$04,$04) bytes.
  $69E9,$02 Set #REGa to #N$FF which indicates this is a data block.
  $69EB,$01 Set the carry flag to indicate this is loading.
  $69EC,$03 Call #SKOOLKID$0556(LD_BYTES).
  $69EF,$02 Jump to #R$69F8 if the data block loaded.
N $69F1 Print "#MESSAGE$63C7".
  $69F1,$06 Print "#MESSAGE$63C7".
  $69F7,$01 Return.
N $69F8 There is nothing to unpack when no saved locations were stored.
@ $69F8 label=LoadTape_Success
  $69F8,$03 Fetch how many locations the save file stores.
  $69FB,$02 Return if there are no saved locations to unpack.
  $69FD,$0A Copy the saved-location count into #REGb and point at the location
. table and the tape workspace.
N $6A07 The next saved location address.
@ $6A07 label=LoadTape_WriteLoop
  $6A07,$05 Move #REGix on to the next saved-location address and #REGde on to
. the next packed location byte.
@ $6A0C label=LoadTape_Write
  $6A0C,$06 Fetch the location address from *#REGix into #REGhl.
  $6A12,$02 Write that packed location byte back into the game.
  $6A14,$02 Decrease the unpack counter and loop back to #R$6A07 until every
. location byte is restored.
  $6A16,$02 Show the room picture even if it has been seen before.
  $6A18,$03 Call #R$678A to display the room.
  $6A1B,$01 Return.

c $6A1C Print Input Prompt
@ $6A1C label=PrintInputPrompt
E $6A1C View the equivalent code in;
. #LIST
. { #FOREST$C3C0 }
. { #HEROES$ACEA }
. { #JEWELS$BBD4 }
. { #WARLORD$A647 }
. LIST#
D $6A1C Print the ">" prompt.
  $6A1C,$03 The prompt is drawn in the prompt cell.
  $6A1F,$06 Look at the eight rows of the prompt cell.
@ $6A25 label=PrintInputPrompt_Loop
  $6A25,$04 Combine those rows to see whether the prompt is already visible.
  $6A29,$03 The prompt cell is empty, so the prompt must be printed.
  $6A2C,$02 Start the prompt on a new line.
  $6A2E,$03 Call #R$64F2 to print the character.
@ $6A31 label=PrintInputPrompt_Step1
  $6A31,$06 Print #MESSAGE$62E0 on the same line.
  $6A37,$01 Return.

t $6A38 Messaging: "A Knife"
@ $6A38 label=Messaging_AKnife
  $6A38,$08 "#MESSAGE$6A38".
B $6A40,$01 Terminator.

t $6A41 Messaging: "A Laser Pistol"
@ $6A41 label=Messaging_ALaserPistol
  $6A41,$0F "#MESSAGE$6A41".
B $6A50,$01 Terminator.

t $6A51 Messaging: "A Coin"
@ $6A51 label=Messaging_ACoin
  $6A51,$07 "#MESSAGE$6A51".
B $6A58,$01 Terminator.

t $6A59 Messaging: "A Crystal Rod"
@ $6A59 label=Messaging_ACrystalRod
  $6A59,$0E "#MESSAGE$6A59".
B $6A67,$01 Terminator.

t $6A68 Messaging: "A Detonator"
@ $6A68 label=Messaging_ADetonator
  $6A68,$0C "#MESSAGE$6A68".
B $6A74,$01 Terminator.

t $6A75 Messaging: "A Metal Bar"
@ $6A75 label=Messaging_AMetalBar
  $6A75,$0C "#MESSAGE$6A75".
B $6A81,$01 Terminator.

t $6A82 Messaging: "A Glowing Sphere"
@ $6A82 label=Messaging_AGlowingSphere
  $6A82,$11 "#MESSAGE$6A82".
B $6A93,$01 Terminator.

t $6A94 Messaging: "Some Poison Fungus"
@ $6A94 label=Messaging_SomePoisonFungus
  $6A94,$13 "#MESSAGE$6A94".
B $6AA7,$01 Terminator.

t $6AA8 Messaging: "Some Round Stones"
@ $6AA8 label=Messaging_SomeRoundStones
  $6AA8,$12 "#MESSAGE$6AA8".
B $6ABA,$01 Terminator.

t $6ABB Messaging: "A Key"
@ $6ABB label=Messaging_AKey
  $6ABB,$06 "#MESSAGE$6ABB".
B $6AC1,$01 Terminator.

t $6AC2 Messaging: "A Space Axe"
@ $6AC2 label=Messaging_ASpaceAxe
  $6AC2,$0C "#MESSAGE$6AC2".
B $6ACE,$01 Terminator.

t $6ACF Messaging: "Some Explosives"
@ $6ACF label=Messaging_SomeExplosives
  $6ACF,$10 "#MESSAGE$6ACF".
B $6ADF,$01 Terminator.

t $6AE0 Messaging: "A Pair Of Gloves"
@ $6AE0 label=Messaging_APairOfGloves
  $6AE0,$11 "#MESSAGE$6AE0".
B $6AF1,$01 Terminator.

t $6AF2 Messaging: "The Galaxy"
@ $6AF2 label=Messaging_TheGalaxy
  $6AF2,$0B "#MESSAGE$6AF2".
B $6AFD,$01 Terminator.

t $6AFE Messaging: "The Airlock Is Closed"
@ $6AFE label=Messaging_TheAirlockIsClosed
  $6AFE,$16 "#MESSAGE$6AFE".
B $6B14,$01 Terminator.

t $6B15 Messaging: "The Airlock Is Open"
@ $6B15 label=Messaging_TheAirlockIsOpen
  $6B15,$14 "#MESSAGE$6B15".
B $6B29,$01 Terminator.

t $6B2A Messaging: "An Android Guard. He Has Shot At You And Missed"
@ $6B2A label=Messaging_AnAndroidGuardHeHasShotAtYouAndMissed
  $6B2A,$30 "#MESSAGE$6B2A".
B $6B5A,$01 Terminator.

t $6B5B Messaging: "A Dead Android Guard"
@ $6B5B label=Messaging_ADeadAndroidGuard
  $6B5B,$15 "#MESSAGE$6B5B".
B $6B70,$01 Terminator.

t $6B71 Messaging: "A Glowing Sphere Sitting On A Sunken Dish, On A "
@ $6B71 label=Messaging_AGlowingSphereSittingOnASunkenDishOnA
  $6B71,$3F "#MESSAGE$6B71".
B $6BB0,$01 Terminator.

t $6BB1 Messaging: "A Glass Pedestal With A Raised Dish On Top"
@ $6BB1 label=Messaging_AGlassPedestalWithARaisedDishOnTop
  $6BB1,$2B "#MESSAGE$6BB1".
B $6BDC,$01 Terminator.

t $6BDD Messaging: "A Panel With A Square Plate To One Side"
@ $6BDD label=Messaging_APanelWithASquarePlateToOneSide
  $6BDD,$28 "#MESSAGE$6BDD".
B $6C05,$01 Terminator.

t $6C06 Messaging: "The Southern Exit Has A Square Plate To The Side"
@ $6C06 label=Messaging_TheSouthernExitHasASquarePlateToTheSide
  $6C06,$37 "#MESSAGE$6C06".
B $6C3D,$01 Terminator.

t $6C3E Messaging: "A Pile Of Rocks At The Eastern End"
@ $6C3E label=Messaging_APileOfRocksAtTheEasternEnd
  $6C3E,$23 "#MESSAGE$6C3E".
B $6C61,$01 Terminator.

t $6C62 Messaging: "Some Shattered Rocks To One Side Of The Eastern "
@ $6C62 label=Messaging_SomeShatteredRocksToOneSideOfTheEastern
  $6C62,$35 "#MESSAGE$6C62".
B $6C97,$01 Terminator.

t $6C98 Messaging: "The Landing Co-ordinates Are Set"
@ $6C98 label=Messaging_TheLandingCoOrdinatesAreSet
  $6C98,$21 "#MESSAGE$6C98".
B $6CB9,$01 Terminator.

t $6CBA Messaging: "A Closed Door"
@ $6CBA label=Messaging_AClosedDoor
  $6CBA,$0E "#MESSAGE$6CBA".
B $6CC8,$01 Terminator.

t $6CC9 Messaging: "An Open Door"
@ $6CC9 label=Messaging_AnOpenDoor
  $6CC9,$0D "#MESSAGE$6CC9".
B $6CD6,$01 Terminator.

t $6CD7 Messaging: "A Creeping Vine Has Trapped You By Coiling Itsel"
@ $6CD7 label=Messaging_ACreepingVineHasTrappedYouByCoilingItsel
  $6CD7,$3D "#MESSAGE$6CD7".
B $6D14,$01 Terminator.

t $6D15 Messaging: "A Withered Vine"
@ $6D15 label=Messaging_AWitheredVine
  $6D15,$10 "#MESSAGE$6D15".
B $6D25,$01 Terminator.

t $6D26 Messaging: "A Skeleton In Space Patrol Uniform,tied To Rings"
@ $6D26 label=Messaging_ASkeletonInSpacePatrolUniformTiedToRings
  $6D26,$46 "#MESSAGE$6D26".
B $6D6C,$01 Terminator.

t $6D6D Messaging: "A Skeleton On The Floor"
@ $6D6D label=Messaging_ASkeletonOnTheFloor
  $6D6D,$18 "#MESSAGE$6D6D".
B $6D85,$01 Terminator.

t $6D86 Messaging: "An Alcove Containing Some Round Stones"
@ $6D86 label=Messaging_AnAlcoveContainingSomeRoundStones
  $6D86,$27 "#MESSAGE$6D86".
B $6DAD,$01 Terminator.

t $6DAE Messaging: "An Empty Alcove"
@ $6DAE label=Messaging_AnEmptyAlcove
  $6DAE,$10 "#MESSAGE$6DAE".
B $6DBE,$01 Terminator.

t $6DBF Messaging: "A Huge,blind Slug Is Blocking The Western Exit. "
@ $6DBF label=Messaging_AHugeBlindSlugIsBlockingTheWesternExit
  $6DBF,$4B "#MESSAGE$6DBF".
B $6E0A,$01 Terminator.

t $6E0B Messaging: "A Pool Of Slime On The Floor"
@ $6E0B label=Messaging_APoolOfSlimeOnTheFloor
  $6E0B,$1D "#MESSAGE$6E0B".
B $6E28,$01 Terminator.

t $6E29 Messaging: "A Fierce,scaled Creature Is On The Bridge,preven"
@ $6E29 label=Messaging_AFierceScaledCreatureIsOnTheBridgePreven
  $6E29,$43 "#MESSAGE$6E29".
B $6E6C,$01 Terminator.

t $6E6D Messaging: "The Alien Commander, In Space Armour"
@ $6E6D label=Messaging_TheAlienCommanderInSpaceArmour
  $6E6D,$25 "#MESSAGE$6E6D".
B $6E92,$01 Terminator.

t $6E93 Messaging: "The Dead Body Of The Alien Commander"
@ $6E93 label=Messaging_TheDeadBodyOfTheAlienCommander
  $6E93,$25 "#MESSAGE$6E93".
B $6EB8,$01 Terminator.

t $6EB9 Messaging: "A Computer"
@ $6EB9 label=Messaging_AComputer
  $6EB9,$0B "#MESSAGE$6EB9".
B $6EC4,$01 Terminator.

t $6EC5 Messaging: "A Keyhole In The Control Panel"
@ $6EC5 label=Messaging_AKeyholeInTheControlPanel
  $6EC5,$1F "#MESSAGE$6EC5".
B $6EE4,$01 Terminator.

t $6EE5 Messaging: "A Light Is Flashing And You Can Hear A Warning S"
@ $6EE5 label=Messaging_ALightIsFlashingAndYouCanHearAWarningS
  $6EE5,$35 "#MESSAGE$6EE5".
B $6F1A,$01 Terminator.

t $6F1B Messaging: "A Dead Alien Soldier"
@ $6F1B label=Messaging_ADeadAlienSoldier
  $6F1B,$15 "#MESSAGE$6F1B".
B $6F30,$01 Terminator.

t $6F31 Messaging: "A Tractor Beam Is Holding The Ship. Takeoff Is I"
@ $6F31 label=Messaging_ATractorBeamIsHoldingTheShipTakeoffIsI
  $6F31,$3A "#MESSAGE$6F31".
B $6F6B,$01 Terminator.

t $6F6C Messaging: "A Strange Alien Device In One Corner"
@ $6F6C label=Messaging_AStrangeAlienDeviceInOneCorner
  $6F6C,$25 "#MESSAGE$6F6C".
B $6F91,$01 Terminator.

t $6F92 Messaging: "Some Writing On The Wall"
@ $6F92 label=Messaging_SomeWritingOnTheWall
  $6F92,$19 "#MESSAGE$6F92".
B $6FAB,$01 Terminator.

t $6FAC Messaging: "A Message On The Ship's Computer Screen"
@ $6FAC label=Messaging_AMessageOnTheShipSComputerScreen
  $6FAC,$28 "#MESSAGE$6FAC".
B $6FD4,$01 Terminator.

t $6FD5 Messaging: "A Button"
@ $6FD5 label=Messaging_AButton
  $6FD5,$09 "#MESSAGE$6FD5".
B $6FDE,$01 Terminator.

t $6FDF Messaging: "The Water Looks Inviting"
@ $6FDF label=Messaging_TheWaterLooksInviting
  $6FDF,$19 "#MESSAGE$6FDF".
B $6FF8,$01 Terminator.

t $6FF9 Messaging: "A Pile Of Rocks"
@ $6FF9 label=Messaging_APileOfRocks
  $6FF9,$10 "#MESSAGE$6FF9".
B $7009,$01 Terminator.

t $700A Messaging: "A Pair Of Gloves,which You Are Wearing"
@ $700A label=Messaging_APairOfGlovesWhichYouAreWearing
  $700A,$27 "#MESSAGE$700A".
B $7031,$01 Terminator.

t $7032 Messaging: "A Key In The Control Panel. The Key Is Set To 'O"
@ $7032 label=Messaging_AKeyInTheControlPanelTheKeyIsSetToO
  $7032,$34 "#MESSAGE$7032".
B $7066,$01 Terminator.

t $7067 Messaging: "A Key In The Control Panel. The Key Is Set To 'O"
@ $7067 label=Messaging_AKeyInTheControlPanelTheKeyIsSetToO2
  $7067,$33 "#MESSAGE$7067".
B $709A,$01 Terminator.

t $709B Messaging: "A Glowing Sphere Sitting On A Raised Dish On A G"
@ $709B label=Messaging_AGlowingSphereSittingOnARaisedDishOnAG
  $709B,$3E "#MESSAGE$709B".
B $70D9,$01 Terminator.

t $70DA Messaging: "A Message On The Computer Screen Reads - TYPE PA"
@ $70DA label=Messaging_AMessageOnTheComputerScreenReadsTYPEPA
  $70DA,$39 "#MESSAGE$70DA".
B $7113,$01 Terminator.

t $7114 Messaging: "A Wall Of Rock Now Blocks The Northern Exit"
@ $7114 label=Messaging_AWallOfRockNowBlocksTheNorthernExit
  $7114,$2C "#MESSAGE$7114".
B $7140,$01 Terminator.

t $7141 Messaging: "The Ship Is Ready To Take Off"
@ $7141 label=Messaging_TheShipIsReadyToTakeOff
  $7141,$1E "#MESSAGE$7141".
B $715F,$01 Terminator.

t $7160 Messaging: "In Deep Space,on Patrol"
@ $7160 label=Messaging_InDeepSpaceOnPatrol
  $7160,$18 "#MESSAGE$7160".
B $7178,$01 Terminator.

t $7179 Messaging: "In Orbit Around An Unknown Planet"
@ $7179 label=Messaging_InOrbitAroundAnUnknownPlanet
  $7179,$22 "#MESSAGE$7179".
B $719B,$01 Terminator.

t $719C Messaging: "In The Galaxy At Rest,on A Landing Pad"
@ $719C label=Messaging_InTheGalaxyAtRestOnALandingPad
  $719C,$27 "#MESSAGE$719C".
B $71C3,$01 Terminator.

t $71C4 Messaging: "The Landing Pad"
@ $71C4 label=Messaging_TheLandingPad
  $71C4,$10 "#MESSAGE$71C4".
B $71D4,$01 Terminator.

t $71D5 Messaging: "The Square. There Buildings All Around"
@ $71D5 label=Messaging_TheSquareThereBuildingsAllAround
  $71D5,$27 "#MESSAGE$71D5".
B $71FC,$01 Terminator.

t $71FD Messaging: "The Corridor"
@ $71FD label=Messaging_TheCorridor
  $71FD,$0D "#MESSAGE$71FD".
B $720A,$01 Terminator.

t $720B Messaging: "The Yellow Room"
@ $720B label=Messaging_TheYellowRoom
  $720B,$10 "#MESSAGE$720B".
B $721B,$01 Terminator.

t $721C Messaging: "The Armoury"
@ $721C label=Messaging_TheArmoury
  $721C,$0C "#MESSAGE$721C".
B $7228,$01 Terminator.

t $7229 Messaging: "The Long Corridor"
@ $7229 label=Messaging_TheLongCorridor
  $7229,$12 "#MESSAGE$7229".
B $723B,$01 Terminator.

t $723C Messaging: "The Green Room"
@ $723C label=Messaging_TheGreenRoom
  $723C,$0F "#MESSAGE$723C".
B $724B,$01 Terminator.

t $724C Messaging: "The Workshop"
@ $724C label=Messaging_TheWorkshop
  $724C,$0D "#MESSAGE$724C".
B $7259,$01 Terminator.

t $725A Messaging: "The Guard Room"
@ $725A label=Messaging_TheGuardRoom
  $725A,$0F "#MESSAGE$725A".
B $7269,$01 Terminator.

t $726A Messaging: "The Storage Room"
@ $726A label=Messaging_TheStorageRoom
  $726A,$11 "#MESSAGE$726A".
B $727B,$01 Terminator.

t $727C Messaging: "The Reception Room"
@ $727C label=Messaging_TheReceptionRoom
  $727C,$13 "#MESSAGE$727C".
B $728F,$01 Terminator.

t $7290 Messaging: "The Conference Room"
@ $7290 label=Messaging_TheConferenceRoom
  $7290,$14 "#MESSAGE$7290".
B $72A4,$01 Terminator.

t $72A5 Messaging: "The Antechamber"
@ $72A5 label=Messaging_TheAntechamber
  $72A5,$10 "#MESSAGE$72A5".
B $72B5,$01 Terminator.

t $72B6 Messaging: "The Assembly Room"
@ $72B6 label=Messaging_TheAssemblyRoom
  $72B6,$12 "#MESSAGE$72B6".
B $72C8,$01 Terminator.

t $72C9 Messaging: "The Blue Room"
@ $72C9 label=Messaging_TheBlueRoom
  $72C9,$0E "#MESSAGE$72C9".
B $72D7,$01 Terminator.

t $72D8 Messaging: "The Red Room"
@ $72D8 label=Messaging_TheRedRoom
  $72D8,$0D "#MESSAGE$72D8".
B $72E5,$01 Terminator.

t $72E6 Messaging: "The Control Room"
@ $72E6 label=Messaging_TheControlRoom
  $72E6,$11 "#MESSAGE$72E6".
B $72F7,$01 Terminator.

t $72F8 Messaging: "The White Room"
@ $72F8 label=Messaging_TheWhiteRoom
  $72F8,$0F "#MESSAGE$72F8".
B $7307,$01 Terminator.

t $7308 Messaging: "The Mirrored Room"
@ $7308 label=Messaging_TheMirroredRoom
  $7308,$12 "#MESSAGE$7308".
B $731A,$01 Terminator.

t $731B Messaging: "The Bottom Of A Stairwell"
@ $731B label=Messaging_TheBottomOfAStairwell
  $731B,$1A "#MESSAGE$731B".
B $7335,$01 Terminator.

t $7336 Messaging: "The Eastern End Of A Long Cavern"
@ $7336 label=Messaging_TheEasternEndOfALongCavern
  $7336,$21 "#MESSAGE$7336".
B $7357,$01 Terminator.

t $7358 Messaging: "The Hall Of The Ancients"
@ $7358 label=Messaging_TheHallOfTheAncients
  $7358,$19 "#MESSAGE$7358".
B $7371,$01 Terminator.

t $7372 Messaging: "The Old Cave"
@ $7372 label=Messaging_TheOldCave
  $7372,$0D "#MESSAGE$7372".
B $737F,$01 Terminator.

t $7380 Messaging: "The Crystal Chamber"
@ $7380 label=Messaging_TheCrystalChamber
  $7380,$14 "#MESSAGE$7380".
B $7394,$01 Terminator.

t $7395 Messaging: "The Botanical Grotto"
@ $7395 label=Messaging_TheBotanicalGrotto
  $7395,$15 "#MESSAGE$7395".
B $73AA,$01 Terminator.

t $73AB Messaging: "The Dusty Corridor"
@ $73AB label=Messaging_TheDustyCorridor
  $73AB,$13 "#MESSAGE$73AB".
B $73BE,$01 Terminator.

t $73BF Messaging: "The Limestone Maze"
@ $73BF label=Messaging_TheLimestoneMaze
  $73BF,$13 "#MESSAGE$73BF".
B $73D2,$01 Terminator.

t $73D3 Messaging: "The Damp Cave"
@ $73D3 label=Messaging_TheDampCave
  $73D3,$0E "#MESSAGE$73D3".
B $73E1,$01 Terminator.

t $73E2 Messaging: "The Lower Corridor"
@ $73E2 label=Messaging_TheLowerCorridor
  $73E2,$13 "#MESSAGE$73E2".
B $73F5,$01 Terminator.

t $73F6 Messaging: "The Lower Store Room"
@ $73F6 label=Messaging_TheLowerStoreRoom
  $73F6,$15 "#MESSAGE$73F6".
B $740B,$01 Terminator.

t $740C Messaging: "The Rock Slide"
@ $740C label=Messaging_TheRockSlide
  $740C,$0F "#MESSAGE$740C".
B $741B,$01 Terminator.

t $741C Messaging: "The Tall Canyon"
@ $741C label=Messaging_TheTallCanyon
  $741C,$10 "#MESSAGE$741C".
B $742C,$01 Terminator.

t $742D Messaging: "The Torture Chamber"
@ $742D label=Messaging_TheTortureChamber
  $742D,$14 "#MESSAGE$742D".
B $7441,$01 Terminator.

t $7442 Messaging: "The Underground Stream"
@ $7442 label=Messaging_TheUndergroundStream
  $7442,$17 "#MESSAGE$7442".
B $7459,$01 Terminator.

t $745A Messaging: "The Sloping Corridor"
@ $745A label=Messaging_TheSlopingCorridor
  $745A,$15 "#MESSAGE$745A".
B $746F,$01 Terminator.

t $7470 Messaging: "The Cavern Of Mists"
@ $7470 label=Messaging_TheCavernOfMists
  $7470,$14 "#MESSAGE$7470".
B $7484,$01 Terminator.

t $7485 Messaging: "The Crystal Grotto"
@ $7485 label=Messaging_TheCrystalGrotto
  $7485,$13 "#MESSAGE$7485".
B $7498,$01 Terminator.

t $7499 Messaging: "The Crystal Bridge"
@ $7499 label=Messaging_TheCrystalBridge
  $7499,$13 "#MESSAGE$7499".
B $74AC,$01 Terminator.

t $74AD Messaging: "The Creature's Lair"
@ $74AD label=Messaging_TheCreatureSLair
  $74AD,$14 "#MESSAGE$74AD".
B $74C1,$01 Terminator.

t $74C2 Messaging: "The Alien Commander's Chamber"
@ $74C2 label=Messaging_TheAlienCommanderSChamber
  $74C2,$1E "#MESSAGE$74C2".
B $74E0,$01 Terminator.

t $74E1 Messaging: "The Reactor Room"
@ $74E1 label=Messaging_TheReactorRoom
  $74E1,$11 "#MESSAGE$74E1".
B $74F2,$01 Terminator.

t $74F3 Messaging: "The West Bank Of The Lake"
@ $74F3 label=Messaging_TheWestBankOfTheLake
  $74F3,$1A "#MESSAGE$74F3".
B $750D,$01 Terminator.

t $750E Messaging: "The Subterranean Lake"
@ $750E label=Messaging_TheSubterraneanLake
  $750E,$16 "#MESSAGE$750E".
B $7524,$01 Terminator.

t $7525 Messaging: "The East Bank Of The Lake"
@ $7525 label=Messaging_TheEastBankOfTheLake
  $7525,$1A "#MESSAGE$7525".
B $753F,$01 Terminator.

t $7540 Messaging: "The South Bank Of The Lake"
@ $7540 label=Messaging_TheSouthBankOfTheLake
  $7540,$1B "#MESSAGE$7540".
B $755B,$01 Terminator.

t $755C Messaging: "The Plateau. You Are Surrounded By Huge, Toadsto"
@ $755C label=Messaging_ThePlateauYouAreSurroundedByHugeToadsto
  $755C,$40 "#MESSAGE$755C".
B $759C,$01 Terminator.

t $759D Messaging: "The Repair Bay"
@ $759D label=Messaging_TheRepairBay
  $759D,$0F "#MESSAGE$759D".
B $75AC,$01 Terminator.

t $75AD Messaging: "The Burial Chamber"
@ $75AD label=Messaging_TheBurialChamber
  $75AD,$13 "#MESSAGE$75AD".
B $75C0,$01 Terminator.

t $75C1 Messaging: "Inside A Teleport"
@ $75C1 label=Messaging_InsideATeleport
  $75C1,$12 "#MESSAGE$75C1".
B $75D3,$01 Terminator.

t $75D4 Messaging: "The Western End Of A Long Cavern"
@ $75D4 label=Messaging_TheWesternEndOfALongCavern
  $75D4,$21 "#MESSAGE$75D4".
B $75F5,$01 Terminator.

t $75F6 Messaging: "Any Gloves"
@ $75F6 label=Messaging_AnyGloves
  $75F6,$0A "#MESSAGE$75F6".
B $7600,$01 Terminator.

t $7601 Messaging: "The Galaxy"
@ $7601 label=Messaging_TheGalaxy2
  $7601,$0A "#MESSAGE$7601".
B $760B,$01 Terminator.

t $760C Messaging: "A Message"
@ $760C label=Messaging_AMessage
  $760C,$09 "#MESSAGE$760C".
B $7615,$01 Terminator.

t $7616 Messaging: "An Airlock"
@ $7616 label=Messaging_AnAirlock
  $7616,$0A "#MESSAGE$7616".
B $7620,$01 Terminator.

t $7621 Messaging: "A Keyhole"
@ $7621 label=Messaging_AKeyhole
  $7621,$09 "#MESSAGE$7621".
B $762A,$01 Terminator.

t $762B Messaging: "A Gun"
@ $762B label=Messaging_AGun
  $762B,$05 "#MESSAGE$762B".
B $7630,$01 Terminator.

t $7631 Messaging: "A Guard"
@ $7631 label=Messaging_AGuard
  $7631,$07 "#MESSAGE$7631".
B $7638,$01 Terminator.

t $7639 Messaging: "A Sphere"
@ $7639 label=Messaging_ASphere
  $7639,$08 "#MESSAGE$7639".
B $7641,$01 Terminator.

t $7642 Messaging: "A Pedestal"
@ $7642 label=Messaging_APedestal
  $7642,$0A "#MESSAGE$7642".
B $764C,$01 Terminator.

t $764D Messaging: "A Dish"
@ $764D label=Messaging_ADish
  $764D,$06 "#MESSAGE$764D".
B $7653,$01 Terminator.

t $7654 Messaging: "A Rod"
@ $7654 label=Messaging_ARod
  $7654,$05 "#MESSAGE$7654".
B $7659,$01 Terminator.

t $765A Messaging: "A Plate"
@ $765A label=Messaging_APlate
  $765A,$07 "#MESSAGE$765A".
B $7661,$01 Terminator.

t $7662 Messaging: "A Door"
@ $7662 label=Messaging_ADoor
  $7662,$06 "#MESSAGE$7662".
B $7668,$01 Terminator.

t $7669 Messaging: "A Vine"
@ $7669 label=Messaging_AVine
  $7669,$06 "#MESSAGE$7669".
B $766F,$01 Terminator.

t $7670 Messaging: "A Button"
@ $7670 label=Messaging_AButton2
  $7670,$08 "#MESSAGE$7670".
B $7678,$01 Terminator.

t $7679 Messaging: "A Detonator"
@ $7679 label=Messaging_ADetonator2
  $7679,$0B "#MESSAGE$7679".
B $7684,$01 Terminator.

t $7685 Messaging: "Any Rocks"
@ $7685 label=Messaging_AnyRocks
  $7685,$09 "#MESSAGE$7685".
B $768E,$01 Terminator.

t $768F Messaging: "A Coin"
@ $768F label=Messaging_ACoin2
  $768F,$06 "#MESSAGE$768F".
B $7695,$01 Terminator.

t $7696 Messaging: "A Soldier"
@ $7696 label=Messaging_ASoldier
  $7696,$09 "#MESSAGE$7696".
B $769F,$01 Terminator.

t $76A0 Messaging: "An Axe"
@ $76A0 label=Messaging_AnAxe
  $76A0,$06 "#MESSAGE$76A0".
B $76A6,$01 Terminator.

t $76A7 Messaging: "A Knife"
@ $76A7 label=Messaging_AKnife2
  $76A7,$07 "#MESSAGE$76A7".
B $76AE,$01 Terminator.

t $76AF Messaging: "A Skeleton"
@ $76AF label=Messaging_ASkeleton
  $76AF,$0A "#MESSAGE$76AF".
B $76B9,$01 Terminator.

t $76BA Messaging: "Any Ropes"
@ $76BA label=Messaging_AnyRopes
  $76BA,$09 "#MESSAGE$76BA".
B $76C3,$01 Terminator.

t $76C4 Messaging: "Any Stones"
@ $76C4 label=Messaging_AnyStones
  $76C4,$0A "#MESSAGE$76C4".
B $76CE,$01 Terminator.

t $76CF Messaging: "A Slug"
@ $76CF label=Messaging_ASlug
  $76CF,$06 "#MESSAGE$76CF".
B $76D5,$01 Terminator.

t $76D6 Messaging: "Any Fungus"
@ $76D6 label=Messaging_AnyFungus
  $76D6,$0A "#MESSAGE$76D6".
B $76E0,$01 Terminator.

t $76E1 Messaging: "A Creature"
@ $76E1 label=Messaging_ACreature
  $76E1,$0A "#MESSAGE$76E1".
B $76EB,$01 Terminator.

t $76EC Messaging: "A Bar"
@ $76EC label=Messaging_ABar
  $76EC,$05 "#MESSAGE$76EC".
B $76F1,$01 Terminator.

t $76F2 Messaging: "The Commander"
@ $76F2 label=Messaging_TheCommander
  $76F2,$0D "#MESSAGE$76F2".
B $76FF,$01 Terminator.

t $7700 Messaging: "A Panel"
@ $7700 label=Messaging_APanel
  $7700,$07 "#MESSAGE$7700".
B $7707,$01 Terminator.

t $7708 Messaging: "A Key"
@ $7708 label=Messaging_AKey2
  $7708,$05 "#MESSAGE$7708".
B $770D,$01 Terminator.

t $770E Messaging: "A Computer"
@ $770E label=Messaging_AComputer2
  $770E,$0A "#MESSAGE$770E".
B $7718,$01 Terminator.

t $7719 Messaging: "A Device"
@ $7719 label=Messaging_ADevice
  $7719,$08 "#MESSAGE$7719".
B $7721,$01 Terminator.

t $7722 Messaging: "A Lake"
@ $7722 label=Messaging_ALake
  $7722,$06 "#MESSAGE$7722".
B $7728,$01 Terminator.

t $7729 Messaging: "Any Writing"
@ $7729 label=Messaging_AnyWriting
  $7729,$0B "#MESSAGE$7729".
B $7734,$01 Terminator.

t $7735 Messaging: "A Body"
@ $7735 label=Messaging_ABody
  $7735,$06 "#MESSAGE$7735".
B $773B,$01 Terminator.

t $773C Messaging: "Any Explosives"
@ $773C label=Messaging_AnyExplosives
  $773C,$0E "#MESSAGE$773C".
B $774A,$01 Terminator.

t $774B Messaging: "The Ship Is Not In Orbit"
@ $774B label=Messaging_TheShipIsNotInOrbit
  $774B,$19 "#MESSAGE$774B".
B $7764,$01 Terminator.

t $7765 Messaging: "I Wouldn't Stand There When This Lot Goes Off"
@ $7765 label=Messaging_IWouldnTStandThereWhenThisLotGoesOff
  $7765,$2E "#MESSAGE$7765".
B $7793,$01 Terminator.

t $7794 Messaging: "Try Rephrasing Commands And Examining Things"
@ $7794 label=Messaging_TryRephrasingCommandsAndExaminingThings
  $7794,$2D "#MESSAGE$7794".
B $77C1,$01 Terminator.

t $77C2 Messaging: "You Don't Really Need It"
@ $77C2 label=Messaging_YouDonTReallyNeedIt
  $77C2,$19 "#MESSAGE$77C2".
B $77DB,$01 Terminator.

t $77DC Messaging: "It's Already Open"
@ $77DC label=Messaging_ItSAlreadyOpen
  $77DC,$12 "#MESSAGE$77DC".
B $77EE,$01 Terminator.

t $77EF Messaging: "You Are Carrying"
@ $77EF label=Messaging_YouAreCarrying
  $77EF,$12 "#MESSAGE$77EF".
B $7801,$01 Terminator.

t $7802 Messaging: "You Can't Carry Any More"
@ $7802 label=Messaging_YouCanTCarryAnyMore
  $7802,$19 "#MESSAGE$7802".
B $781B,$01 Terminator.

t $781C Messaging: "It's Already Closed"
@ $781C label=Messaging_ItSAlreadyClosed
  $781C,$14 "#MESSAGE$781C".
B $7830,$01 Terminator.

t $7831 Messaging: "You Can't Go In That Direction"
@ $7831 label=Messaging_YouCanTGoInThatDirection
  $7831,$1F "#MESSAGE$7831".
B $7850,$01 Terminator.

t $7851 Messaging: "An Alien Soldier Has Appeared. He Fires A Plasma"
@ $7851 label=Messaging_AnAlienSoldierHasAppearedHeFiresAPlasma
  $7851,$3D "#MESSAGE$7851".
B $788E,$01 Terminator.

t $788F Messaging: "But He Missed"
@ $788F label=Messaging_ButHeMissed
  $788F,$0E "#MESSAGE$788F".
B $789D,$01 Terminator.

t $789E Messaging: "The Plasma Shell Has Hit You"
@ $789E label=Messaging_ThePlasmaShellHasHitYou
  $789E,$1D "#MESSAGE$789E".
B $78BB,$01 Terminator.

t $78BC Messaging: "Don't Bother"
@ $78BC label=Messaging_DonTBother
  $78BC,$0D "#MESSAGE$78BC".
B $78C9,$01 Terminator.

t $78CA Messaging: "You Can Only Examine One Object At A Time"
@ $78CA label=Messaging_YouCanOnlyExamineOneObjectAtATime
  $78CA,$2A "#MESSAGE$78CA".
B $78F4,$01 Terminator.

t $78F5 Messaging: "There Is A Button On The Unit. It Is Capable Of "
@ $78F5 label=Messaging_ThereIsAButtonOnTheUnitItIsCapableOf
  $78F5,$52 "#MESSAGE$78F5".
B $7947,$01 Terminator.

t $7948 Messaging: "This Is Highly Poisonous, Even To The Touch"
@ $7948 label=Messaging_ThisIsHighlyPoisonousEvenToTheTouch
  $7948,$2C "#MESSAGE$7948".
B $7974,$01 Terminator.

t $7975 Messaging: "The Charge Has An Electronic Receiver Fitted"
@ $7975 label=Messaging_TheChargeHasAnElectronicReceiverFitted
  $7975,$2D "#MESSAGE$7975".
B $79A2,$01 Terminator.

t $79A3 Messaging: "There Appears To Be An Exit Behind The Rocks"
@ $79A3 label=Messaging_ThereAppearsToBeAnExitBehindTheRocks
  $79A3,$2D "#MESSAGE$79A3".
B $79D0,$01 Terminator.

t $79D1 Messaging: "This Appears To Be A Teleport"
@ $79D1 label=Messaging_ThisAppearsToBeATeleport
  $79D1,$1E "#MESSAGE$79D1".
B $79EF,$01 Terminator.

t $79F0 Messaging: "The Word 'OLD' Has Been Scratched On The Wall"
@ $79F0 label=Messaging_TheWordOLDHasBeenScratchedOnTheWall
  $79F0,$2E "#MESSAGE$79F0".
B $7A1E,$01 Terminator.

t $7A1F Messaging: "You're Already Carrying"
@ $7A1F label=Messaging_YouReAlreadyCarrying
  $7A1F,$18 "#MESSAGE$7A1F".
B $7A37,$01 Terminator.

t $7A38 Messaging: "It"
@ $7A38 label=Messaging_It
  $7A38,$03 "#MESSAGE$7A38".
B $7A3B,$01 Terminator.

t $7A3C Messaging: "Them"
@ $7A3C label=Messaging_Them
  $7A3C,$05 "#MESSAGE$7A3C".
B $7A41,$01 Terminator.

t $7A42 Messaging: "They Are Too Far Away"
@ $7A42 label=Messaging_TheyAreTooFarAway
  $7A42,$16 "#MESSAGE$7A42".
B $7A58,$01 Terminator.

t $7A59 Messaging: "You're Not Carrying"
@ $7A59 label=Messaging_YouReNotCarrying
  $7A59,$14 "#MESSAGE$7A59".
B $7A6D,$01 Terminator.

t $7A6E Messaging: "The Beam Is Reflected By The Mirrored Walls And "
@ $7A6E label=Messaging_TheBeamIsReflectedByTheMirroredWallsAnd
  $7A6E,$39 "#MESSAGE$7A6E".
B $7AA7,$01 Terminator.

t $7AA8 Messaging: "As Soon As You Touch The Fungus, A Terrible Pain"
@ $7AA8 label=Messaging_AsSoonAsYouTouchTheFungusATerriblePain
  $7AA8,$5C "#MESSAGE$7AA8".
B $7B04,$01 Terminator.

t $7B05 Messaging: "That Is Biologically Impossible"
@ $7B05 label=Messaging_ThatIsBiologicallyImpossible
  $7B05,$20 "#MESSAGE$7B05".
B $7B25,$01 Terminator.

t $7B26 Messaging: "But There's No Water Here"
@ $7B26 label=Messaging_ButThereSNoWaterHere
  $7B26,$1A "#MESSAGE$7B26".
B $7B40,$01 Terminator.

t $7B41 Messaging: "You Plunge Into The Lake And Have A Pleasant,ref"
@ $7B41 label=Messaging_YouPlungeIntoTheLakeAndHaveAPleasantRef
  $7B41,$57 "#MESSAGE$7B41".
B $7B98,$01 Terminator.

t $7B99 Messaging: "The Water Is Too Shallow"
@ $7B99 label=Messaging_TheWaterIsTooShallow
  $7B99,$19 "#MESSAGE$7B99".
B $7BB2,$01 Terminator.

t $7BB3 Messaging: "You Have Nothing To Cut With"
@ $7BB3 label=Messaging_YouHaveNothingToCutWith
  $7BB3,$1D "#MESSAGE$7BB3".
B $7BD0,$01 Terminator.

t $7BD1 Messaging: "The Vine Withers And Dies. You Have A Chance To "
@ $7BD1 label=Messaging_TheVineWithersAndDiesYouHaveAChanceTo
  $7BD1,$3C "#MESSAGE$7BD1".
B $7C0D,$01 Terminator.

t $7C0E Messaging: "The Ropes Are Already Cut"
@ $7C0E label=Messaging_TheRopesAreAlreadyCut
  $7C0E,$1A "#MESSAGE$7C0E".
B $7C28,$01 Terminator.

t $7C29 Messaging: "The Skeleton Falls To The Floor Revealing An Alc"
@ $7C29 label=Messaging_TheSkeletonFallsToTheFloorRevealingAnAlc
  $7C29,$51 "#MESSAGE$7C29".
B $7C7A,$01 Terminator.

t $7C7B Messaging: "What With?"
@ $7C7B label=Messaging_WhatWith
  $7C7B,$0A "#MESSAGE$7C7B".
B $7C85,$01 Terminator.

t $7C86 Messaging: "Space Armour Is Impervious To Laser Weopons"
@ $7C86 label=Messaging_SpaceArmourIsImperviousToLaserWeopons
  $7C86,$2C "#MESSAGE$7C86".
B $7CB2,$01 Terminator.

t $7CB3 Messaging: "He's Already Dead"
@ $7CB3 label=Messaging_HeSAlreadyDead
  $7CB3,$12 "#MESSAGE$7CB3".
B $7CC5,$01 Terminator.

t $7CC6 Messaging: "The Axe Pierces The Space Armour The Commander F"
@ $7CC6 label=Messaging_TheAxePiercesTheSpaceArmourTheCommanderF
  $7CC6,$66 "#MESSAGE$7CC6".
B $7D2C,$01 Terminator.

t $7D2D Messaging: "Good Shot! He Is Dead"
@ $7D2D label=Messaging_GoodShotHeIsDead
  $7D2D,$16 "#MESSAGE$7D2D".
B $7D43,$01 Terminator.

t $7D44 Messaging: "You Missed!"
@ $7D44 label=Messaging_YouMissed
  $7D44,$0B "#MESSAGE$7D44".
B $7D4F,$01 Terminator.

t $7D50 Messaging: "It Has No Apparent Effect"
@ $7D50 label=Messaging_ItHasNoApparentEffect
  $7D50,$1A "#MESSAGE$7D50".
B $7D6A,$01 Terminator.

t $7D6B Messaging: "The Commander Blocks Your Way"
@ $7D6B label=Messaging_TheCommanderBlocksYourWay
  $7D6B,$1E "#MESSAGE$7D6B".
B $7D89,$01 Terminator.

t $7D8A Messaging: "The Slug Greedily Devours The Poison Fungus. It "
@ $7D8A label=Messaging_TheSlugGreedilyDevoursThePoisonFungusIt
  $7D8A,$68 "#MESSAGE$7D8A".
B $7DF2,$01 Terminator.

t $7DF3 Messaging: "The Creature Stumbles And Loses Its Footing And "
@ $7DF3 label=Messaging_TheCreatureStumblesAndLosesItsFootingAnd
  $7DF3,$52 "#MESSAGE$7DF3".
B $7E45,$01 Terminator.

t $7E46 Messaging: "The Message Reads - A Signal Has Been Received O"
@ $7E46 label=Messaging_TheMessageReadsASignalHasBeenReceivedO
  $7E46,$6F "#MESSAGE$7E46".
B $7EB5,$01 Terminator.

t $7EB6 Messaging: "The Door Opens,revealing A Passage Leading Down"
@ $7EB6 label=Messaging_TheDoorOpensRevealingAPassageLeadingDown
  $7EB6,$30 "#MESSAGE$7EB6".
B $7EE6,$01 Terminator.

t $7EE7 Messaging: "The Pedestal Has Disintegrated"
@ $7EE7 label=Messaging_ThePedestalHasDisintegrated
  $7EE7,$1F "#MESSAGE$7EE7".
B $7F06,$01 Terminator.

t $7F07 Messaging: "Your Gun Is Just Out Of Reach"
@ $7F07 label=Messaging_YourGunIsJustOutOfReach
  $7F07,$1E "#MESSAGE$7F07".
B $7F25,$01 Terminator.

t $7F26 Messaging: "You're Already Wearing Them"
@ $7F26 label=Messaging_YouReAlreadyWearingThem
  $7F26,$1C "#MESSAGE$7F26".
B $7F42,$01 Terminator.

t $7F43 Messaging: "You Have A Delicate Stomach"
@ $7F43 label=Messaging_YouHaveADelicateStomach
  $7F43,$1C "#MESSAGE$7F43".
B $7F5F,$01 Terminator.

t $7F60 Messaging: "I Don't See The Point"
@ $7F60 label=Messaging_IDonTSeeThePoint
  $7F60,$16 "#MESSAGE$7F60".
B $7F76,$01 Terminator.

t $7F77 Messaging: "You Turn The Sphere. The Dish,on Which It Rests,"
@ $7F77 label=Messaging_YouTurnTheSphereTheDishOnWhichItRests
  $7F77,$3A "#MESSAGE$7F77".
B $7FB1,$01 Terminator.

t $7FB2 Messaging: "You Turn The Sphere The Dish,on Which It Rests, "
@ $7FB2 label=Messaging_YouTurnTheSphereTheDishOnWhichItRests2
  $7FB2,$3B "#MESSAGE$7FB2".
B $7FED,$01 Terminator.

t $7FEE Messaging: "An Unnoticed Force Field Snaps Off,revealing Som"
@ $7FEE label=Messaging_AnUnnoticedForceFieldSnapsOffRevealingSom
  $7FEE,$46 "#MESSAGE$7FEE".
B $8034,$01 Terminator.

t $8035 Messaging: "The Key Is In The'OFF' Position"
@ $8035 label=Messaging_TheKeyIsInTheOFFPosition
  $8035,$20 "#MESSAGE$8035".
B $8055,$01 Terminator.

t $8056 Messaging: "A Message Appears On The Screen, Asking You To T"
@ $8056 label=Messaging_AMessageAppearsOnTheScreenAskingYouToT
  $8056,$4B "#MESSAGE$8056".
B $80A1,$01 Terminator.

t $80A2 Messaging: "The Key Is In The 'ON' Position"
@ $80A2 label=Messaging_TheKeyIsInTheONPosition
  $80A2,$20 "#MESSAGE$80A2".
B $80C2,$01 Terminator.

t $80C3 Messaging: "The Message - INCORRECT PASSWORD Appears"
@ $80C3 label=Messaging_TheMessageINCORRECTPASSWORDAppears
  $80C3,$2B "#MESSAGE$80C3".
B $80EE,$01 Terminator.

t $80EF Messaging: "The Password Is Accepted. A Red Light Starts Fla"
@ $80EF label=Messaging_ThePasswordIsAcceptedARedLightStartsFla
  $80EF,$CC "#MESSAGE$80EF".
B $81BB,$01 Terminator.

t $81BC Messaging: "The Computer Is Not On Line"
@ $81BC label=Messaging_TheComputerIsNotOnLine
  $81BC,$1C "#MESSAGE$81BC".
B $81D8,$01 Terminator.

t $81D9 Messaging: "The Computer Will Not Allow Any Further Input"
@ $81D9 label=Messaging_TheComputerWillNotAllowAnyFurtherInput
  $81D9,$2E "#MESSAGE$81D9".
B $8207,$01 Terminator.

t $8208 Messaging: "The Panel Slides Back Revealing An Exit South"
@ $8208 label=Messaging_ThePanelSlidesBackRevealingAnExitSouth
  $8208,$2E "#MESSAGE$8208".
B $8236,$01 Terminator.

t $8237 Messaging: "You Were Standing Too Close And Were Caught In T"
@ $8237 label=Messaging_YouWereStandingTooCloseAndWereCaughtInT
  $8237,$3D "#MESSAGE$8237".
B $8274,$01 Terminator.

t $8275 Messaging: "There Is An Explosion. The Rocks Are Shattered, "
@ $8275 label=Messaging_ThereIsAnExplosionTheRocksAreShattered
  $8275,$47 "#MESSAGE$8275".
B $82BC,$01 Terminator.

t $82BD Messaging: "There Is A Momentary Sense Of Disorientation. Th"
@ $82BD label=Messaging_ThereIsAMomentarySenseOfDisorientationTh
  $82BD,$52 "#MESSAGE$82BD".
B $830F,$01 Terminator.

t $8310 Messaging: "You're Not Carrying The Detonator"
@ $8310 label=Messaging_YouReNotCarryingTheDetonator
  $8310,$22 "#MESSAGE$8310".
B $8332,$01 Terminator.

t $8333 Messaging: "Congratulations! You Have Succeeded,captain. You"
@ $8333 label=Messaging_CongratulationsYouHaveSucceededCaptainYou
  $8333,$8E "#MESSAGE$8333".
B $83C1,$01 Terminator.

t $83C2 Messaging: "There Is A Tremendous Roar Underground,to The So"
@ $83C2 label=Messaging_ThereIsATremendousRoarUndergroundToTheSo
  $83C2,$54 "#MESSAGE$83C2".
B $8416,$01 Terminator.

t $8417 Messaging: "He Fires A Laser Gun. The Beam Hits You"
@ $8417 label=Messaging_HeFiresALaserGunTheBeamHitsYou
  $8417,$28 "#MESSAGE$8417".
B $843F,$01 Terminator.

t $8440 Messaging: "The Slug Devours You"
@ $8440 label=Messaging_TheSlugDevoursYou
  $8440,$15 "#MESSAGE$8440".
B $8455,$01 Terminator.

t $8456 Messaging: "The Complex Explodes. You Are Caught In The Expl"
@ $8456 label=Messaging_TheComplexExplodesYouAreCaughtInTheExpl
  $8456,$36 "#MESSAGE$8456".
B $848C,$01 Terminator.

t $848D Messaging: "It Appears To Be An Ultrasonic Key"
@ $848D label=Messaging_ItAppearsToBeAnUltrasonicKey
  $848D,$23 "#MESSAGE$848D".
B $84B0,$01 Terminator.

t $84B1 Messaging: "No. Drop The Fungus First"
@ $84B1 label=Messaging_NoDropTheFungusFirst
  $84B1,$1A "#MESSAGE$84B1".
B $84CB,$01 Terminator.

t $84CC Messaging: "Not With An Open Airlock!"
@ $84CC label=Messaging_NotWithAnOpenAirlock
  $84CC,$19 "#MESSAGE$84CC".
B $84E5,$01 Terminator.

g $84E6 Table: Object Descriptions
@ $84E6 label=Table_ObjectDescriptions
E $84E6 View the equivalent code in;
. #LIST
. { #SHOCK$AFDD }
. { #FOREST$D3B8 }
. { #HEROES$CD58 }
. { #JEWELS$D34E }
. { #WARLORD$C732 }
. LIST#
D $84E6 #N$41 pointers to the object messages. Indexed with the
. count stored at *#R$62C4.
W $84E6,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $84E6,$02,$41

g $8568 Table: Room Descriptions
@ $8568 label=Table_RoomDescriptions
E $8568 View the equivalent code in;
. #LIST
. { #SHOCK$AE7D }
. { #FOREST$D44C }
. { #HEROES$CE66 }
. { #JEWELS$D3EC }
. { #WARLORD$C8B0 }
. LIST#
D $8568 One pointer per room. Room #N$00 and room #N$01 are unused.
. The starting room is #N($02), In Deep Space, On Patrol.
W $8568,$02 Unused.
L $8568,$02,$02
W $856C,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $856C,$02,$3E

g $85E8 Table: Nouns
@ $85E8 label=Table_Nouns
D $85E8 #N$25 pointers to the noun phrases the parser matches.
W $85E8,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $85E8,$02,$25

t $8632 Messaging: Vocabulary
@ $8632 label=Messaging_Vocabulary
D $8632 Four-letter words. A comma ends a synonym group. The parser
. stores the word number in the token buffer at #R$6291.
  $8632,$235 "#MESSAGE$8632".
B $8867,$01 Terminator.

b $8868 Table: Noun Tokens
@ $8868 label=Table_NounTokens
D $8868 Noun word numbers. The game loop at #R$8D2A searches this list
. with the noun count at #R$62C8, and #R$692F reaches it through the
. pointer at #R$62D6. #N$25 entries.
B $8868,$01 Word #N(#PEEK(#PC)).
L $8868,$01,$25

b $888D Table: Noun Phrases
@ $888D label=Table_NounPhrases
D $888D Phrase tables consulted by the routine at #R$68A4. Each
. entry is a word number followed by #N$FE when the phrase ends.
B $888D,$01
L $888D,$01,$8F

b $891C Table: Verb Search List
@ $891C label=Table_VerbSearchList
D $891C Verb word numbers in the same order as the handlers at
. #R$FA20. #R$8D85 searches this list.
B $891C,$01 Verb #N(#PEEK(#PC)).
L $891C,$01,$24

b $8940 Table: Phrase Lists
@ $8940 label=Table_PhraseLists
D $8940 Further phrase and object lists used while a command is
. matched. #N$FE ends a phrase and #N$FF ends a list.
B $8940,$01
L $8940,$01,$21A

g $8B5A Table: Room Exits
@ $8B5A label=Table_RoomExits
D $8B5A Six direction bytes for every room, in the order north,
. south, east, west, up and down. #N$00 means no exit.
B $8B5A,$01
L $8B5A,$01,$06
L $8B5A,$06,$40

b $8CDA Table: Message Numbers
@ $8CDA label=Table_MessageNumbers
D $8CDA Lists of message and object numbers used by the scenic
. handlers. The entries are addressed from #R$62B2.
B $8CDA,$01
L $8CDA,$01,$22

b $8CFC Table: Rooms With Images
@ $8CFC label=Table_RoomsWithImages
D $8CFC Room ids that have a picture, in the same order as #R$FA68.
D $8CFC Used by the routine at #R$678A through the pointer at #R$62CC,
. set from #R$F8EA.
B $8CFC,$01 Room #N(#PEEK(#PC)).
L $8CFC,$01,$1A

g $8D16 Table: Saved Locations
@ $8D16 label=Table_SavedLocations
D $8D16 Pointers copied and restored with the save file. The count
. is stored at *#R$62DC.
W $8D16,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $8D16,$02,$0A

c $8D2A Game Loop
@ $8D2A label=GameLoop
E $8D2A View the equivalent code in;
. #LIST
. { #FOREST$EB10 }
. { #HEROES$E9A1 }
. { #JEWELS$EDC4 }
. { #WARLORD$E99F }
. LIST#
D $8D2A One turn: turn-based threats, scenic checks, a command, then the
. matching verb.
N $8D2A Run any turn-based threats.
  $8D2A,$03 Call #R$6557.
N $8D2D Walk the scenic-event rooms for the plasma-shell warning.
  $8D2D,$03 #REGhl=#R$6224.
  $8D30,$03 #REGbc=#N($0008,$04,$04).
@ $8D33 label=GameLoop_Loop1
N $8D33 Test whether the player is standing in this scenic room.
  $8D33,$03 Fetch the current room.
  $8D36,$02 Search the scenic-event rooms for it.
  $8D38,$02 Jump to #R$8D55 if the player is not in a scenic room.
  $8D3A,$02 Keep the scenic search while the warning is printed.
N $8D3C Print "#MESSAGE$7851".
  $8D3C,$03 #REGhl=#R$7851.
  $8D3F,$03 Call #R$64E9.
N $8D42 Give the plasma shell one chance in #N$14 of hitting.
  $8D42,$02 #REGa=#N$14.
  $8D44,$03 Call #R$65D6.
  $8D47,$02 Jump to #R$8DAD if the shell hits.
N $8D49 Print "#MESSAGE$788F".
  $8D49,$03 #REGhl=#R$788F.
  $8D4C,$03 Call #R$64E9.
  $8D4F,$02 Restore the scenic-room search.
  $8D51,$02 See whether another scenic room is still to be checked.
  $8D53,$02 Jump to #R$8D33 to check the next scenic room.
N $8D55 Read a command and turn it into vocabulary tokens.
@ $8D55 label=GameLoop_Step1
  $8D55,$03 Call #R$6604.
N $8D58 Continue with Action: Type when the first word is "Y".
  $8D58,$03 Fetch the first word of the command.
  $8D5B,$04 Jump to #R$8D65 when Y (#N$59) was not pressed.
@ $8D5F label=GameLoop_Step2
  $8D5F,$06 Continue at #R$8DA8 to run Action: Type.
N $8D65 Ensure every named object is present here.
@ $8D65 label=GameLoop_Step3
  $8D65,$01 Start the synonym scan with a clear result.
  $8D66,$03 Point at the command's word tokens.
  $8D69,$02 A command has at most #N$0A word tokens.
@ $8D6B label=GameLoop_Loop2
  $8D6B,$01 Read the next word token.
  $8D6C,$04 Jump to #R$8D85 when the command has no more words (#N$FF).
  $8D70,$0A Look that token up in the noun list without losing the token
. pointer.
  $8D7A,$02 Jump to #R$8D81 if this token is not a noun.
  $8D7C,$03 Call #R$68A4.
  $8D7F,$02 Jump back to #R$8D2A when the carry flag is set.
@ $8D81 label=GameLoop_Step4
  $8D81,$01 Bring the token pointer back.
  $8D82,$01 Move on to the next word token.
  $8D83,$02 Jump to #R$8D6B for the remaining words of the command.

c $8D85 Handler: Match Verb
@ $8D85 label=HandlerMatchVerb
E $8D85 View the equivalent code in;
. #LIST
. { #FOREST$C463 }
. { #HEROES$B753 }
. { #JEWELS$C556 }
. { #WARLORD$B05E }
. LIST#
D $8D85 Match the first word token against the verb table. If a match is
. found, jump to its handler. If not, print "I Don't Understand" and return
. to the game loop.
N $8D85 Set up to search the verb word tokens for the first word token.
  $8D85,$03 Point at the list of verb word numbers.
  $8D88,$04 Load *#R$62DA into #REGbc for the search.
  $8D8C,$03 Fetch *#R$6291 from the user input.
  $8D8F,$02 Search the verb word tokens for a matching token.
  $8D91,$02 Jump to #R$8D9B if a match was found.
N $8D93 The token doesn't match any verb.
N $8D93 Print "#MESSAGE$62EC".
  $8D93,$03 #REGhl=#R$62EC.
  $8D96,$03 Call #R$64E9.
  $8D99,$02 Jump to #R$8D2A to read the next command.
@ $8D9B label=HandlerMatchVerb_Step1
N $8D9B A verb was matched. Calculate its index and jump to its handler.
  $8D9B,$03 Fetch how many verbs the game knows.
  $8D9E,$03 The matching verb selects its handler index.
  $8DA1,$04 Point #REGix at *#R$62D8.
  $8DA5,$03 Call #R$6754.
@ $8DA8 label=HandlerMatchVerb_Step2
  $8DA8,$05 Run the verb, then return to the game loop.

c $8DAD Handler: Plasma Shell
@ $8DAD label=HandlerPlasmaShell
D $8DAD Tell the player the plasma shell has hit, then end the game.
E $8DAD Continue on to #R$8DB3.
  $8DAD,$06 Print #MESSAGE$789E.

c $8DB3 Game Over
@ $8DB3 label=GameOver
E $8DB3 Continue on to #R$8DB9.
E $8DB3 View the equivalent code in;
. #LIST
. { #SHOCK$AE0D }
. { #FOREST$EB23 }
. { #HEROES$E9B5 }
. { #JEWELS$EDD7 }
. { #WARLORD$E9B2 }
. LIST#
D $8DB3 Tell the player they are dead and ask whether to play again.
N $8DB3 Print "#MESSAGE$638C".
  $8DB3,$03 #REGhl=#R$638C.
  $8DB6,$03 Call #R$64E9.

c $8DB9 Handler: Ask To Play Again
@ $8DB9 label=HandlerAskToPlayAgain
E $8DB9 View the equivalent code in;
. #LIST
. { #HEROES$E9BB }
. LIST#
D $8DB9 Ask whether to play again; reset the machine or start another game.
N $8DB9 Print "#MESSAGE$639A".
  $8DB9,$03 #REGhl=#R$639A.
  $8DBC,$03 Call #R$64E9.
@ $8DBF label=HandlerAskToPlayAgain_Loop1
  $8DBF,$03 Call #R$6495.
N $8DC2 The player is done with the game, so reset back to BASIC.
  $8DC2,$05 Jump to #SKOOLKID$0000(START) if the player pressed "N".
N $8DC7 The player wants another go...
  $8DC7,$05 Jump back to #R$61A8 if the player pressed "Y".
N $8DCC Just loop round for any other input.
  $8DCC,$02 Jump to #R$8DBF.

c $8DCE Game Complete
@ $8DCE label=GameComplete
E $8DCE View the equivalent code in;
. #LIST
. { #FOREST$EB3E }
. { #HEROES$E9D3 }
. { #JEWELS$EDF2 }
. LIST#
D $8DCE Show the winning text, then ask whether to play again.
N $8DCE Clear the screen for the winning text.
  $8DCE,$03 Call #R$64A5.
  $8DD1,$03 Call #R$64C1.
N $8DD4 Print "#MESSAGE$8333".
  $8DD4,$03 #REGhl=#R$8333.
  $8DD7,$03 Call #R$64E9.
  $8DDA,$02 Jump to #R$8DB9.

c $8DDC Handler: Android Attack
@ $8DDC label=HandlerAndroidAttack
D $8DDC Fire the android guard when his event bit is set.
  $8DDC,$05 The android's attack is over for this turn.
  $8DE1,$06 Return when #MESSAGE$6B2A (#N$12) is not here or being carried.
N $8DE7 Print "#MESSAGE$8417".
  $8DE7,$03 #REGhl=#R$8417.
  $8DEA,$02 Jump to #R$8E0F.

c $8DEC Handler: Slug Attack
@ $8DEC label=HandlerSlugAttack
D $8DEC Let the slug attack when the player is still in its room.
  $8DEC,$05 The slug's attack is over for this turn.
  $8DF1,$06 Return when #MESSAGE$6DBF (#N$24) is not here or being carried.
N $8DF7 Print "#MESSAGE$8440".
  $8DF7,$03 #REGhl=#R$8440.
  $8DFA,$02 Jump to #R$8E0F.

c $8DFC Handler: Second Android
@ $8DFC label=HandlerSecondAndroid
D $8DFC Fire the second android guard.
  $8DFC,$05 The second android's attack is over for this turn.
  $8E01,$06 Return when #MESSAGE$6E6D (#N$27) is not here or being carried.
N $8E07 Print "#MESSAGE$8417".
  $8E07,$03 #REGhl=#R$8417.
  $8E0A,$02 Jump to #R$8E0F.

c $8E0C Handler: Complex Explodes
@ $8E0C label=HandlerComplexExplodes
D $8E0C Destroy the player when the alien complex explodes.
E $8E0C Continue on to #R$8E0F.
  $8E0C,$03 Point #REGhl at "#MESSAGE$8456" and continue at #R$8E0F
. to print it and end the game.

c $8E0F Handler: Player Killed
@ $8E0F label=Handler_PlayerKilled
E $8E0F View the equivalent code in;
. #LIST
. { #JEWELS$EE9B }
. LIST#
D $8E0F Print the message in #REGhl, discard the return addresses and
. continue at #R$8DB3. An attack jumps here, and the complex explosion
. falls through from #R$8E0C.
  $8E0F,$03 Call #R$64E9 to print the message and start a new line.
  $8E12,$03 Discard the stacked return addresses; the player is dead.
  $8E15,$03 Jump to #R$8DB3 to game over.

c $8E18 Move Player To Room
@ $8E18 label=MovePlayerToRoom
E $8E18 View the equivalent code in;
. #LIST
. { #SHOCK$ACBD }
. { #FOREST$C42F }
. { #HEROES$B714 }
. { #JEWELS$C520 }
. { #WARLORD$B01F }
. LIST#
D $8E18 Store the given room as the current room and update the exit record.
  $8E18,$01 Remember the room being entered.
  $8E19,$03 Fetch the current room.
  $8E1C,$03 The scenic events remember the room the player just left.
  $8E1F,$02 Up to eight scenic rooms may name the room just left.
  $8E21,$02 Continue at #R$8E24 to see if this scenic slot names the old room.
@ $8E23 label=MovePlayerToRoom_Loop1
  $8E23,$01 Move on to the next scenic room.
@ $8E24 label=MovePlayerToRoom_Step1
  $8E24,$03 Leave this scenic slot when it does not name the old room.
  $8E27,$01 This scenic slot now names the room being entered.
@ $8E28 label=MovePlayerToRoom_Step2
  $8E28,$02 Repeat for the remaining scenic rooms.
  $8E2A,$04 Make the new room current.
  $8E2E,$02 Draw the room, including its picture.
  $8E30,$03 Call #R$678A to display the room.
  $8E33,$07 Jump to #R$8E44 when #MESSAGE$6B2A (#N$12) is not here or being
. carried.
  $8E3A,$03 Check the turn-based event flags.
  $8E3D,$07 The android will attack in #N$02 turns.
@ $8E44 label=MovePlayerToRoom_Step3
  $8E44,$07 Jump to #R$8E55 when #MESSAGE$6DBF (#N$24) is not here or being
. carried.
  $8E4B,$03 Check the turn-based event flags.
  $8E4E,$07 The slug will attack in #N$06 turns.
@ $8E55 label=MovePlayerToRoom_Step4
  $8E55,$07 Jump to #R$8E66 when #MESSAGE$6E6D (#N$27) is not here or being
. carried.
  $8E5C,$03 Check the turn-based event flags.
  $8E5F,$07 The second android will attack in #N$06 turns.
@ $8E66 label=MovePlayerToRoom_Step5
  $8E66,$03 Fetch the current room.
  $8E69,$04 The tractor beam is only dealt with on #ROOM$05.
  $8E6D,$03 Check the turn-based event flags.
  $8E70,$04 The explosion countdown is not armed.
  $8E74,$02 Leave the explosion countdown unarmed.
  $8E76,$06 Move #MESSAGE$6F31 (#N$30) to nowhere (#N$00).
N $8E7C This action changes the map:
  $8E7C,$04 Close the south exit of #ROOM$05.
  $8E80,$06 Move #MESSAGE$7141 (#N$40) to room #N$04: "#ROOM$04".
  $8E86,$06 Print #MESSAGE$83C2.
@ $8E8C label=MovePlayerToRoom_Step6
  $8E8C,$01 Return.

c $8E8D Action: Help
@ $8E8D label=ActionHelp
E $8E8D View the equivalent code in;
. #LIST
. { #FOREST$EDC3 }
. { #HEROES$F715 }
. { #JEWELS$F09C }
. LIST#
D $8E8D Offer a hint for this room, or a general hint.
  $8E8D,$04 Return if the command names an object: the player is told to
. rephrase it.
  $8E91,$03 Fetch the current room.
@ $8E94 label=ActionHelp_Step1
  $8E94,$03 Point at the rooms that have a hint of their own.
  $8E97,$03 #N($0008,$04,$04) rooms have a hint of their own.
  $8E9A,$02 Find this room among the rooms that have a hint.
@ $8E9C label=ActionHelp_Loop1
  $8E9C,$02 This room has no hint of its own.
N $8E9E Print "#MESSAGE$7794".
  $8E9E,$03 #REGhl=#R$7794.
  $8EA1,$02 Jump to #R$8EA6.
@ $8EA3 label=ActionHelp_Loop2
N $8EA3 Print "#MESSAGE$77C2".
  $8EA3,$03 #REGhl=#R$77C2.
  $8EA6,$03 Call #R$64E9.
@ $8EA6 label=ActionHelp_Loop3
  $8EA9,$01 Return.
@ $8EAA label=ActionHelp_Step2
  $8EAA,$04 The special hint applies only in #ROOM$19.
  $8EAE,$07 Jump back to #R$8E9C when #MESSAGE$6ACF (#N$0B) is not here or
. being carried.
N $8EB5 Print "#MESSAGE$7765".
  $8EB5,$03 #REGhl=#R$7765.
  $8EB8,$02 Jump to #R$8EA6.
@ $8EBA label=ActionHelp_Step3
  $8EBA,$02 Continue at #R$8EA3 to print the general hint.

b $8EBC Table: Help Rooms
@ $8EBC label=Table_HelpRooms
D $8EBC Room ids that have their own help text. #R$8E8D searches
. this list before printing the general hint.
B $8EBC,$01 Room #N(#PEEK(#PC)).
L $8EBC,$01,$08

c $8EC4 Action: Inventory
@ $8EC4 label=ActionInventory
E $8EC4 View the equivalent code in;
. #LIST
. { #SHOCK$A6CF }
. { #FOREST$EDE8 }
. { #HEROES$F756 }
. { #JEWELS$F12E }
. { #WARLORD$F824 }
. LIST#
D $8EC4 List everything the player is carrying.
  $8EC4,$04 Call #R$6972; return if the command names an object.
N $8EC8 Clear the screen and display the player's inventory.
  $8EC8,$03 Call #R$64A5.
  $8ECB,$03 Call #R$64C1.
N $8ECE Print "#MESSAGE$77EF".
  $8ECE,$03 #REGhl=#R$77EF.
  $8ED1,$03 Call #R$64E9.
  $8ED4,$02 #REGa=#N$01 (the player's inventory).
  $8ED6,$03 Call #R$6763.
  $8ED9,$01 Return.

c $8EDA Action: Look
@ $8EDA label=Action_Look
E $8EDA View the equivalent code in;
. #LIST
. { #FOREST$EE05 }
. { #HEROES$F773 }
. { #JEWELS$F14B }
. { #WARLORD$F841 }
. LIST#
D $8EDA Describe the room again, including any room image.
  $8EDA,$04 Call #R$6972; return if the command names an object.
N $8EDE Force any room images to be re-displayed.
  $8EDE,$02 #REGe=#N$01.
  $8EE0,$03 Call #R$678A.
  $8EE3,$01 Return.

c $8EE4 Action: North
@ $8EE4 label=Action_North
E $8EE4 View the equivalent code in;
. #LIST
. { #FOREST$EE0F }
. { #HEROES$F7E4 }
. { #JEWELS$F155 }
. { #WARLORD$F8C9 }
. LIST#
D $8EE4 Try to leave to the north.
  $8EE4,$02 Set #REGc to "NORTH" (#N$00).
  $8EE6,$02 Jump to #R$8EFA.

c $8EE8 Action: South
@ $8EE8 label=Action_South
E $8EE8 View the equivalent code in;
. #LIST
. { #FOREST$EE13 }
. { #HEROES$F7E8 }
. { #JEWELS$F159 }
. { #WARLORD$F8CD }
. LIST#
D $8EE8 Try to leave to the south.
  $8EE8,$02 Set #REGc to "SOUTH" (#N$01).
  $8EEA,$02 Jump to #R$8EFA.

c $8EEC Action: East
@ $8EEC label=Action_East
E $8EEC View the equivalent code in;
. #LIST
. { #FOREST$EE17 }
. { #HEROES$F7EC }
. { #JEWELS$F15D }
. { #WARLORD$F8D1 }
. LIST#
D $8EEC Try to leave to the east.
  $8EEC,$02 Set #REGc to "EAST" (#N$02).
  $8EEE,$02 Jump to #R$8EFA.

c $8EF0 Action: West
@ $8EF0 label=Action_West
E $8EF0 View the equivalent code in;
. #LIST
. { #FOREST$EE1B }
. { #HEROES$F7F0 }
. { #JEWELS$F161 }
. { #WARLORD$F8D5 }
. LIST#
D $8EF0 Try to leave to the west.
  $8EF0,$02 Set #REGc to "WEST" (#N$03).
  $8EF2,$02 Jump to #R$8EFA.

c $8EF4 Action: Up
@ $8EF4 label=Action_Up
E $8EF4 View the equivalent code in;
. #LIST
. { #FOREST$EE1F }
. { #HEROES$F7F4 }
. { #JEWELS$F165 }
. { #WARLORD$F8D9 }
. LIST#
D $8EF4 Try to leave upwards.
  $8EF4,$02 Set #REGc to "UP" (#N$04).
  $8EF6,$02 Jump to #R$8EFA.

c $8EF8 Action: Down
@ $8EF8 label=ActionDown
E $8EF8 Continue on to #R$8EFA.
E $8EF8 View the equivalent code in;
. #LIST
. { #FOREST$EE23 }
. { #HEROES$F7F8 }
. { #JEWELS$F169 }
. { #WARLORD$F8DD }
. LIST#
D $8EF8 Try to leave downwards.
  $8EF8,$02 Set #REGc to "DOWN" (#N$05).
N $8EFA The movement commands share this common exit handler.
@ $8EFA label=ActionDown_Step1
  $8EFA,$04 Call #R$6972; return if the command names an object.
  $8EFE,$07 Read the exit byte for the chosen direction.
  $8F05,$03 Jump to #R$8F0C if that direction is closed.
  $8F08,$03 Call #R$8E18.
  $8F0B,$01 Return.
N $8F0C Print "#MESSAGE$7831".
@ $8F0C label=ActionDown_Step2
  $8F0C,$03 #REGhl=#R$7831.
  $8F0F,$03 Call #R$64E9.
  $8F12,$01 Return.

c $8F13 Action: Examine
@ $8F13 label=ActionExamine
E $8F13 View the equivalent code in;
. #LIST
. { #FOREST$EE3D }
. { #HEROES$F785 }
. { #JEWELS$F19D }
. { #WARLORD$F853 }
. LIST#
D $8F13 Describe the single object the player named.
  $8F13,$08 Return if the command does not name an object. Jump to #R$8F27
. when exactly one noun was named.
N $8F1B Print "#MESSAGE$78CA".
  $8F1B,$03 #REGhl=#R$78CA.
  $8F1E,$02 Jump to #R$8F23.
@ $8F20 label=ActionExamine_Loop1
N $8F20 Nothing else is worth a closer look.
N $8F20 Print "#MESSAGE$78BC".
  $8F20,$03 #REGhl=#R$78BC.
  $8F23,$03 Call #R$64E9.
@ $8F23 label=ActionExamine_Loop2
  $8F26,$01 Return.
N $8F27 Was the player trying to examine the detonator?
@ $8F27 label=ActionExamine_Step1
  $8F27,$08 Jump to #R$8F34 unless the command matches the phrase at #R$8940.
N $8F2F Print "#MESSAGE$78F5".
  $8F2F,$03 #REGhl=#R$78F5.
  $8F32,$02 Jump to #R$8F23.
N $8F34 Was the player trying to examine the poison fungus?
@ $8F34 label=ActionExamine_Step2
  $8F34,$08 Jump to #R$8F41 unless the command matches the phrase at #R$8942.
N $8F3C Print "#MESSAGE$7948".
  $8F3C,$03 #REGhl=#R$7948.
  $8F3F,$02 Jump to #R$8F23.
N $8F41 Was the player trying to examine the explosives?
@ $8F41 label=ActionExamine_Step3
  $8F41,$08 Jump to #R$8F4E unless the command matches the phrase at #R$8947.
N $8F49 Print "#MESSAGE$7975".
  $8F49,$03 #REGhl=#R$7975.
  $8F4C,$02 Jump to #R$8F23.
N $8F4E Was the player trying to examine the shattered rocks?
@ $8F4E label=ActionExamine_Step4
  $8F4E,$0F Jump to #R$8F62 unless the command matches the phrase at #R$8949
. (#ITEM$38).
N $8F5D Print "#MESSAGE$79A3".
  $8F5D,$03 #REGhl=#R$79A3.
  $8F60,$02 Jump to #R$8F23.
N $8F62 Was the player trying to examine the pile of rocks?
@ $8F62 label=ActionExamine_Step5
  $8F62,$0F Jump to #R$8F76 unless the command matches the phrase at #R$8949
. (#ITEM$19).
N $8F71 Print "#MESSAGE$7A42".
  $8F71,$03 #REGhl=#R$7A42.
  $8F74,$02 Jump to #R$8F23.
N $8F76 Was the player trying to examine the alien commander?
@ $8F76 label=ActionExamine_Step6
  $8F76,$08 Jump to #R$8F83 unless the command matches the phrase at #R$894B.
N $8F7E Print "#MESSAGE$79D1".
  $8F7E,$03 #REGhl=#R$79D1.
  $8F81,$02 Jump to #R$8F23.
N $8F83 Was the player trying to examine the writing?
@ $8F83 label=ActionExamine_Step7
  $8F83,$08 Jump to #R$8F90 unless the command matches the phrase at #R$8957.
N $8F8B Print "#MESSAGE$79F0".
  $8F8B,$03 #REGhl=#R$79F0.
  $8F8E,$02 Jump to #R$8F23.
N $8F90 Was the player trying to examine the crystal rod?
@ $8F90 label=ActionExamine_Step8
  $8F90,$08 Jump to #R$8F9E unless the command matches the phrase at #R$896E.
N $8F98 Print "#MESSAGE$848D".
  $8F98,$03 #REGhl=#R$848D.
  $8F9B,$03 Jump to #R$8F23.
N $8F9E Nothing else is valid.
@ $8F9E label=ActionExamine_Step9
  $8F9E,$03 Continue at #R$8F20 to say there is nothing worth a closer look.

c $8FA1 Action: Load
@ $8FA1 label=Action_Load
E $8FA1 View the equivalent code in;
. #LIST
. { #FOREST$EE81 }
. { #HEROES$F7AC }
. { #JEWELS$F236 }
. { #WARLORD$F892 }
. LIST#
D $8FA1 Load a saved position from tape.
  $8FA1,$04 Return if the command names an object: the player is told to
. rephrase it.
  $8FA5,$03 Call #R$69DC to load the game.
  $8FA8,$01 Return.

c $8FA9 Action: Save
@ $8FA9 label=Action_Save
E $8FA9 View the equivalent code in;
. #LIST
. { #FOREST$EE89 }
. { #HEROES$F7BC }
. { #JEWELS$F23E }
. { #WARLORD$F8A1 }
. LIST#
D $8FA9 Save the current position to tape.
  $8FA9,$04 Return if the command names an object: the player is told to
. rephrase it.
  $8FAD,$03 Call #R$69A1 to save the game.
  $8FB0,$01 Return.

c $8FB1 Action: Quit
@ $8FB1 label=ActionQuit
E $8FB1 View the equivalent code in;
. #LIST
. { #FOREST$EE91 }
. { #HEROES$F7C4 }
. { #JEWELS$F246 }
. { #WARLORD$F8A9 }
. LIST#
D $8FB1 Ask whether to save, then offer another game.
  $8FB1,$04 Return if the command names an object: the player is told to
. rephrase it.
  $8FB5,$06 Print #MESSAGE$6410.
@ $8FBB label=ActionQuit_Loop1
  $8FBB,$03 Call #R$6495 to wait for a keypress.
  $8FBE,$04 Jump to #R$8FC9 when N (#N$4E) was pressed.
  $8FC2,$04 Jump back to #R$8FBB when Y (#N$59) was not pressed.
  $8FC6,$03 Call #R$8FA9 to save.
@ $8FC9 label=ActionQuit_Step1
  $8FC9,$01 The player is leaving this game.
  $8FCA,$03 Jump to #R$8DB9 to ask to play again.

c $8FCD Action: Take
@ $8FCD label=ActionTake
E $8FCD View the equivalent code in;
. #LIST
. { #FOREST$EEAE }
. { #HEROES$F80D }
. { #JEWELS$F263 }
. { #WARLORD$F956 }
. LIST#
D $8FCD Pick up the single object the player named.
  $8FCD,$08 Jump to #R$9029 when the command matches the phrase at #R$8B58.
  $8FD5,$08 Return if the command does not name an object. Jump to #R$9029 when
. exactly one noun was named.
N $8FDD Print "#MESSAGE$6445".
  $8FDD,$03 #REGhl=#R$6445.
  $8FE0,$02 Jump to #R$9025.

c $8FE2 Take: Is Player Holding Item
@ $8FE2 label=Take_IsPlayerHoldingItem
E $8FE2 View the equivalent code in;
. #LIST
. { #FOREST$EEBA }
. { #JEWELS$F26A }
. LIST#
D $8FE2 Refuse the take when the object is already carried or the inventory is
. full; otherwise return so the caller can take it.
R $8FE2 A Object ID
R $8FE2 O:B The object ID (when returning so the take may proceed)
  $8FE2,$03 Call #R$6958.
N $8FE5 Refuse when that object is already being carried.
  $8FE5,$02 Jump to #R$9003 if the item is not being held.
  $8FE7,$01 Restore #REGhl from the stack.
N $8FE8 Finish the sentence "You're already carrying" with "it" or "them".
N $8FE8 Print "#MESSAGE$7A1F".
  $8FE8,$03 #REGhl=#R$7A1F.
  $8FEB,$03 Call #R$64DC.
@ $8FEE label=Take_AlreadyCarrying_CheckPlural
  $8FEE,$03 #REGhl=#R$9010.
  $8FF1,$01 Copy the object ID back into #REGa.
  $8FF2,$03 #REGbc=#N($0004,$04,$04).
  $8FF5,$02 Search #R$9010 for the item ID among the plural items.
  $8FF7,$02 Jump to #R$8FFE if the item is plural.
N $8FF9 Print "#MESSAGE$7A38".
  $8FF9,$03 #REGhl=#R$7A38.
  $8FFC,$02 Jump to #R$9025.
N $8FFE Print "#MESSAGE$7A3C".
@ $8FFE label=Take_AlreadyCarrying_Them
  $8FFE,$03 #REGhl=#R$7A3C.
  $9001,$02 Jump to #R$9025.
N $9003 Refuse the object when the player is already holding #N$05 things.
@ $9003 label=Take_InventoryFull
  $9003,$05 Compare *#R$622C with #N$05.
  $9008,$01 #REGb=#REGe.
  $9009,$01 Return if *#R$622C is not equal to #N$05.
  $900A,$01 Restore #REGhl from the stack.
N $900B Print "#MESSAGE$7802".
  $900B,$03 #REGhl=#R$7802.
  $900E,$02 Jump to #R$9025.

b $9010 Table: Items Which Are Plural
@ $9010 label=Table_ItemsWhichArePlural
E $9010 View the equivalent code in;
. #LIST
. { #FOREST$EEEB }
. { #JEWELS$F29B }
. LIST#
D $9010 All the items in the game which are plural; used by #R$8FEE.
B $9010,$01 Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC)).
L $9010,$01,$04,$02

c $9014 Take Item
@ $9014 label=TakeItem
E $9014 View the equivalent code in;
. #LIST
. { #FOREST$EEED }
. { #JEWELS$F29C }
. LIST#
D $9014 Places the item in the player's inventory and acknowledges success.
  $9014,$05 Call #R$65E6 to mark the object as carried.
  $9019,$04 Increment *#R$622C by one.
N $901D Print "#MESSAGE$6466".
  $901D,$03 #REGhl=#R$6466.
  $9020,$02 Jump to #R$9025.
N $9022 Print "#MESSAGE$645B".
@ $9022 label=Take_YouCant
  $9022,$03 #REGhl=#R$645B.
@ $9025 label=TakeItem_PrintAndReturn
  $9025,$03 Call #R$64E9.
  $9028,$01 Return.

c $9029 Take: Knife
@ $9029 label=Validate_Take_Knife
D $9029 Was the player trying to take the knife?
  $9029,$06 Call #R$6900 with #R$8959.
  $902F,$02 Jump to #R$9039 if the token isn't for the knife.
  $9031,$05 Call #R$8FE2 with item #N$00: #ITEM$00.
  $9036,$03 Jump to #R$9014.

c $9039 Take: Laser Pistol
@ $9039 label=Validate_Take_LaserPistol
D $9039 Was the player trying to take the laser pistol?
  $9039,$06 Call #R$6900 with #R$8969.
  $903F,$02 Jump to #R$9049 if the token isn't for the laser pistol.
  $9041,$05 Call #R$8FE2 with item #N$01: #ITEM$01.
  $9046,$03 Jump to #R$9014.

c $9049 Take: Coin
@ $9049 label=Validate_Take_Coin
D $9049 Was the player trying to take the coin?
  $9049,$06 Call #R$6900 with #R$8960.
  $904F,$02 Jump to #R$9059 if the token isn't for the coin.
  $9051,$05 Call #R$8FE2 with item #N$02: #ITEM$02.
  $9056,$03 Jump to #R$9014.

c $9059 Take: Crystal Rod
@ $9059 label=Validate_Take_CrystalRod
D $9059 Was the player trying to take the crystal rod?
  $9059,$06 Call #R$6900 with #R$896E.
  $905F,$02 Jump to #R$9069 if the token isn't for the crystal rod.
  $9061,$05 Call #R$8FE2 with item #N$03: #ITEM$03.
  $9066,$03 Jump to #R$9014.

c $9069 Take: Detonator
@ $9069 label=Validate_Take_Detonator
D $9069 Was the player trying to take the detonator?
  $9069,$06 Call #R$6900 with #R$8940.
  $906F,$02 Jump to #R$9079 if the token isn't for the detonator.
  $9071,$05 Call #R$8FE2 with item #N$04: #ITEM$04.
  $9076,$03 Jump to #R$9014.

c $9079 Take: Metal Bar
@ $9079 label=Validate_Take_MetalBar
D $9079 Was the player trying to take the metal bar?
  $9079,$06 Call #R$6900 with #R$8964.
  $907F,$02 Jump to #R$9089 if the token isn't for the metal bar.
  $9081,$05 Call #R$8FE2 with item #N$05: #ITEM$05.
  $9086,$03 Jump to #R$9014.

c $9089 Take: Glowing Sphere
@ $9089 label=Validate_Take_GlowingSphere
D $9089 Was the player trying to take the glowing sphere?
  $9089,$0D Jump to #R$90C6 unless the command matches the phrase at #R$8973
. (#ITEM$06).
  $9096,$07 Jump to #R$90C3 when #ITEM$06 is here or being carried.
  $909D,$08 Jump back to #R$9022 when #ITEM$3C is not here or being carried.
  $90A5,$01 Keep the command pointer safe while the sphere is moved.
  $90A6,$06 Move #ITEM$3C to nowhere (#N$00).
  $90AC,$03 Fetch the current room.
  $90AF,$04 The sphere was not picked up in room #N$1C: "#ROOM$1C".
  $90B3,$06 Move #ITEM$15 to room #N$1C: "#ROOM$1C".
  $90B9,$01 Bring the command pointer back.
  $90BA,$02 Continue at #R$90C3 to pick the object up.
N $90BC The sphere was taken outside the pedestal room.
@ $90BC label=Validate_Take_GlowingSphere_Elsewhere
  $90BC,$06 Move #ITEM$16 to room #N$13: "#ROOM$13".
  $90C2,$01 Bring the command pointer back.
N $90C3 Pick up the glowing sphere.
@ $90C3 label=Validate_Take_GlowingSphere_PickUp
  $90C3,$03 Jump to #R$9014.

c $90C6 Take: Poison Fungus
@ $90C6 label=Validate_Take_PoisonFungus
D $90C6 Was the player trying to take the poison fungus?
  $90C6,$0D Jump to #R$90E5 unless the command matches the phrase at #R$8942
. (#ITEM$07).
  $90D3,$08 Jump back to #R$9014 when #ITEM$39 is here or being carried.
N $90DB Bad luck!
@ $90DB label=Validate_Take_PoisonFungus_Fatal
  $90DB,$04 Switch #R$8DB3 onto the stack so the next return actions a "game
. over".
N $90DF Print "#MESSAGE$7AA8".
  $90DF,$03 #REGhl=#R$7AA8.
  $90E2,$03 Jump to #R$9025.

c $90E5 Take: Round Stones
@ $90E5 label=Validate_Take_RoundStones
D $90E5 Was the player trying to take the round stones?
  $90E5,$0D Jump to #R$910A unless the command matches the phrase at #R$8978
. (#ITEM$08).
  $90F2,$07 Jump to #R$9107 when #ITEM$22 is not here or being carried.
  $90F9,$01 Keep the command pointer safe while the stones are moved.
  $90FA,$06 Move #ITEM$22 to nowhere (#N$00).
  $9100,$06 Move #ITEM$23 to room #N$2E: "#ROOM$2E".
  $9106,$01 Bring the command pointer back.
N $9107 Pick up the round stones.
@ $9107 label=Validate_Take_RoundStones_PickUp
  $9107,$03 Jump to #R$9014.

c $910A Take: Key
@ $910A label=Validate_Take_Key
E $910A View the equivalent code in;
. #LIST
. { #FOREST$EFE8 }
. { #JEWELS$F423 }
. LIST#
D $910A Was the player trying to take the key?
  $910A,$0D Jump to #R$9137 unless the command matches the phrase at #R$8962
. (#ITEM$09).
  $9117,$08 Jump back to #R$9022 when #ITEM$3B is here or being carried.
  $911F,$07 Jump to #R$9134 when #ITEM$3A is not here or being carried.
  $9126,$01 Keep the command pointer safe while the key is moved.
  $9127,$06 Move #ITEM$3A to nowhere (#N$00).
  $912D,$06 Move #ITEM$2A to room #N$36: "#ROOM$36".
  $9133,$01 Bring the command pointer back.
N $9134 Pick up the key.
@ $9134 label=Validate_Take_Key_PickUp
  $9134,$03 Jump to #R$9014.

c $9137 Take: Space Axe
@ $9137 label=Validate_Take_SpaceAxe
D $9137 Was the player trying to take the space axe?
  $9137,$06 Call #R$6900 with #R$895B.
  $913D,$02 Jump to #R$9147 if the token isn't for the space axe.
  $913F,$05 Call #R$8FE2 with item #N$0A: #ITEM$0A.
  $9144,$03 Jump to #R$9014.

c $9147 Take: Explosives
@ $9147 label=Validate_Take_Explosives
D $9147 Was the player trying to take the explosives?
  $9147,$06 Call #R$6900 with #R$8947.
  $914D,$02 Jump to #R$9157 if the token isn't for the explosives.
  $914F,$05 Call #R$8FE2 with item #N$0B: #ITEM$0B.
  $9154,$03 Jump to #R$9014.

c $9157 Take: Pair Of Gloves
@ $9157 label=Validate_Take_PairOfGloves
D $9157 Was the player trying to take the pair of gloves?
  $9157,$06 Call #R$6900 with #R$897D.
  $915D,$02 Jump to #R$916C if the token isn't for the gloves.
  $915F,$05 Call #R$8FE2 with item #N$39: #ITEM$39.
  $9164,$05 Call #R$8FE2 with item #N$0C: #ITEM$0C.
  $9169,$03 Jump to #R$9014.

c $916C Take: Ship
@ $916C label=Validate_Take_Ship
D $916C Was the player trying to take the ship?
  $916C,$08 Jump to #R$9195 unless the command matches the phrase at #R$8B58.
  $9174,$03 Fetch the current room.
  $9177,$05 The ship can be claimed only from room #N$04: "#ROOM$04".
  $917C,$08 Jump back to #R$9022 when #ITEM$40 is not here or being carried.
  $9184,$07 Jump to #R$9191 when #ITEM$0E is here or being carried.
N $918B Print "#MESSAGE$84CC".
  $918B,$03 #REGhl=#R$84CC.
  $918E,$03 Jump to #R$9025.
N $9191 The ship is ready, so the game can end.
@ $9191 label=Validate_Take_Ship_Complete
  $9191,$01 Restore #REGhl from the stack.
  $9192,$03 Jump to #R$8DCE.
N $9195 Nothing else is valid.
@ $9195 label=Take_Invalid
  $9195,$03 Jump to #R$9022.
c $9198 Action: Drop
@ $9198 label=ActionDrop
E $9198 View the equivalent code in;
. #LIST
. { #FOREST$F03A }
. { #HEROES$F8D0 }
. { #WARLORD$F975 }
. LIST#
D $9198 Drop one of the objects the player named.
  $9198,$04 Return if the command does not name a single object.
  $919C,$04 Jump to #R$91D8 when the command names fewer than #N$03 nouns.
N $91A0 Print "#MESSAGE$6445".
  $91A0,$03 #REGhl=#R$6445.
  $91A3,$02 Jump to #R$91D4.
N $91A5 Check if the player is holding the requested item?
@ $91A5 label=ActionDrop_Loop1
  $91A5,$03 Call #R$6958 to test whether the object is carried.
  $91A8,$02 Jump to #R$91C5 if the named object is being carried.
N $91AA The player is not holding that object.
@ $91AA label=ActionDrop_Loop2
  $91AA,$06 Print #MESSAGE$7A59 on the same line.
  $91B0,$01 Copy the object ID back into #REGa.
N $91B1 Finish "You're not carrying" with "it" or "them".
@ $91B1 label=ActionDrop_Step1
  $91B1,$03 #REGhl=#R$9010.
  $91B4,$03 #REGbc=#N($0004,$04,$04).
  $91B7,$02 Search #R$9010 for the item ID among the plural items.
  $91B9,$02 Jump to #R$91C0 if the item is plural.
N $91BB Print "#MESSAGE$7A38".
  $91BB,$03 #REGhl=#R$7A38.
  $91BE,$02 Jump to #R$91D4.
N $91C0 Print "#MESSAGE$7A3C".
@ $91C0 label=ActionDrop_Step2
  $91C0,$03 #REGhl=#R$7A3C.
  $91C3,$02 Jump to #R$91D4.
N $91C5 The player has the item, so drop it in the current room.
@ $91C5 label=ActionDrop_Step3
  $91C5,$05 Put the object down in the current room.
  $91CA,$03 Call #R$65E6 to move the object.
@ $91CD label=ActionDrop_Loop3
  $91CD,$04 The player is carrying one fewer object.
N $91D1 Print "#MESSAGE$6466".
  $91D1,$03 #REGhl=#R$6466.
  $91D4,$03 Call #R$64E9.
@ $91D4 label=ActionDrop_Loop4
  $91D7,$01 Return.
N $91D8 Was the player trying to drop the knife?
@ $91D8 label=ActionDrop_Step4
  $91D8,$06 Call #R$6900 with #R$8959.
  $91DE,$02 Jump to #R$91E5 if the token isn't for the knife.
  $91E0,$05 #REGa=#ITEM$00; jump to #R$91A5.
N $91E5 Was the player trying to drop the laser pistol?
@ $91E5 label=ActionDrop_Step5
  $91E5,$06 Call #R$6900 with #R$8969.
  $91EB,$02 Jump to #R$91F2 if the token isn't for the laser pistol.
  $91ED,$05 #REGa=#ITEM$01; jump to #R$91A5.
N $91F2 Was the player trying to drop the coin?
@ $91F2 label=ActionDrop_Step6
  $91F2,$06 Call #R$6900 with #R$8960.
  $91F8,$02 Jump to #R$91FF if the token isn't for the coin.
  $91FA,$05 #REGa=#ITEM$02; jump to #R$91A5.
N $91FF Was the player trying to drop the crystal rod?
@ $91FF label=ActionDrop_Step7
  $91FF,$06 Call #R$6900 with #R$896E.
  $9205,$02 Jump to #R$920C if the token isn't for the crystal rod.
  $9207,$05 #REGa=#ITEM$03; jump to #R$91A5.
N $920C Was the player trying to drop the detonator?
@ $920C label=ActionDrop_Step8
  $920C,$06 Call #R$6900 with #R$8940.
  $9212,$02 Jump to #R$9219 if the token isn't for the detonator.
  $9214,$05 #REGa=#ITEM$04; jump to #R$91A5.
N $9219 Was the player trying to drop the metal bar?
@ $9219 label=ActionDrop_Step9
  $9219,$06 Call #R$6900 with #R$8964.
  $921F,$02 Jump to #R$9226 if the token isn't for the metal bar.
  $9221,$05 #REGa=#ITEM$05; jump to #R$91A5.
N $9226 Was the player trying to drop the glowing sphere?
@ $9226 label=ActionDrop_Step10
  $9226,$06 Call #R$6900 with #R$8973.
  $922C,$02 Jump to #R$9233 if the token isn't for the glowing sphere.
  $922E,$05 #REGa=#ITEM$06; jump to #R$91A5.
N $9233 Was the player trying to drop the poison fungus?
@ $9233 label=ActionDrop_Step11
  $9233,$06 Call #R$6900 with #R$8942.
  $9239,$02 Jump to #R$9240 if the token isn't for the poison fungus.
  $923B,$05 #REGa=#ITEM$07; jump to #R$91A5.
N $9240 Was the player trying to drop the round stones?
@ $9240 label=ActionDrop_Step12
  $9240,$06 Call #R$6900 with #R$8978.
  $9246,$02 Jump to #R$924D if the token isn't for the round stones.
  $9248,$05 #REGa=#ITEM$08; jump to #R$91A5.
N $924D Was the player trying to drop the key?
@ $924D label=ActionDrop_Step13
  $924D,$06 Call #R$6900 with #R$8962.
  $9253,$02 Jump to #R$925A if the token isn't for the key.
  $9255,$05 #REGa=#ITEM$09; jump to #R$91A5.
N $925A Was the player trying to drop the space axe?
@ $925A label=ActionDrop_Step14
  $925A,$06 Call #R$6900 with #R$895B.
  $9260,$02 Jump to #R$9267 if the token isn't for the space axe.
  $9262,$05 #REGa=#ITEM$0A; jump to #R$91A5.
N $9267 Was the player trying to drop the explosives?
@ $9267 label=ActionDrop_Step15
  $9267,$06 Call #R$6900 with #R$8947.
  $926D,$02 Jump to #R$9274 if the token isn't for the explosives.
  $926F,$05 #REGa=#ITEM$0B; jump to #R$91A5.
@ $9274 label=ActionDrop_Step16
  $9274,$02 Continue at #R$9276 to try the special drops.
N $9276 Was the player trying to drop the sphere onto the pedestal?
@ $9276 label=ActionDrop_Step17
  $9276,$06 Call #R$6900 with #R$897F.
  $927C,$02 Jump to #R$92AA if the token isn't for that phrase.
  $927E,$08 Jump to #R$91AA when the player is not carrying #ITEM$06.
  $9286,$03 Fetch the current room.
  $9289,$04 The sphere was not dropped in #ROOM$1C.
  $928D,$03 Clear the glass pedestal in #ROOM$1C.
  $9290,$02 Continue at #R$9295 to move what was dropped.
@ $9292 label=ActionDrop_Step18
  $9292,$03 Clear the glass pedestal in #ROOM$13.
@ $9295 label=ActionDrop_Step19
  $9295,$03 Call #R$65E6 to move the object.
  $9298,$06 Move #MESSAGE$6A82 (#N$06) to nowhere (#N$00).
  $929E,$03 Fetch the current room.
  $92A1,$03 Leave #MESSAGE$709B in the room where it was dropped.
  $92A4,$03 Call #R$65E6 to move the object.
  $92A7,$03 Continue at #R$91CD to count one fewer object and confirm the drop.
N $92AA Was the player trying to drop the axe on the second android?
@ $92AA label=ActionDrop_Step20
  $92AA,$0F Jump to #R$92EC unless the command matches the phrase at #R$8A87
. (#MESSAGE$6E6D (#N$27)).
N $92B9 Print "#MESSAGE$7CB3".
  $92B9,$03 #REGhl=#R$7CB3.
  $92BC,$03 Jump to #R$91D4.
@ $92BF label=ActionDrop_Step21
  $92BF,$08 Jump back to #R$91AA when the player is not carrying #MESSAGE$6AC2
. (#N$0A).
  $92C7,$06 Move #MESSAGE$6E6D (#N$27) to nowhere (#N$00).
  $92CD,$06 Move #MESSAGE$6E93 (#N$28) to room #N$35: "#ROOM$35".
  $92D3,$03 Fetch the current room.
  $92D6,$03 Leave #MESSAGE$6AC2 in the current room.
  $92D9,$03 Call #R$65E6 to move the object.
  $92DC,$04 The player is carrying one fewer object.
  $92E0,$06 Move #MESSAGE$6ABB (#N$09) to room #N$35: "#ROOM$35".
N $92E6 Print "#MESSAGE$7CC6".
  $92E6,$03 #REGhl=#R$7CC6.
  $92E9,$03 Jump to #R$91D4.
N $92EC Was the player trying to drop the fungus on the slug?
@ $92EC label=ActionDrop_Step22
  $92EC,$06 Point at the phrase at #R$8A9B and call #R$6900 to match it against
. the command.
  $92F2,$02 Jump to #R$931D if it doesn't match.
  $92F4,$08 Jump to #R$91AA when the player is not carrying #MESSAGE$6A94
. (#N$07).
  $92FC,$06 Move #MESSAGE$6DBF (#N$24) to nowhere (#N$00).
  $9302,$06 Move #MESSAGE$6E0B (#N$25) to room #N$30: "#ROOM$30".
  $9308,$06 Move #MESSAGE$6A94 (#N$07) to nowhere (#N$00).
  $930E,$04 The player is carrying one fewer object.
N $9312 This action changes the map:
  $9312,$05 Open the west exit of #ROOM$30 onto #ROOM$2F.
N $9317 Print "#MESSAGE$7D8A".
  $9317,$03 #REGhl=#R$7D8A.
  $931A,$03 Jump to #R$91D4.
N $931D Was the player trying to drop the stones on the scaled creature?
@ $931D label=ActionDrop_Step23
  $931D,$06 Point at the phrase at #R$8AAF and call #R$6900 to match it against
. the command.
  $9323,$02 Jump to #R$9348 if it doesn't match.
  $9325,$08 Jump to #R$91AA when the player is not carrying #MESSAGE$6AA8
. (#N$08).
  $932D,$06 Move #MESSAGE$6E29 (#N$26) to nowhere (#N$00).
  $9333,$06 Move #MESSAGE$6AA8 (#N$08) to room #N$33: "#ROOM$33".
  $9339,$04 The player is carrying one fewer object.
N $933D This action changes the map:
  $933D,$05 Open the east exit of #ROOM$33 onto #ROOM$34.
N $9342 Print "#MESSAGE$7DF3".
  $9342,$03 #REGhl=#R$7DF3.
  $9345,$03 Jump to #R$91D4.
N $9348 Was the player trying to drop the worn gloves?
@ $9348 label=ActionDrop_Step24
  $9348,$0F Jump to #R$9375 unless the command matches the phrase at #R$897D
. (#MESSAGE$700A (#N$39)).
  $9357,$07 Jump to #R$9364 when the player is not carrying #MESSAGE$6A94
. (#N$07).
N $935E Print "#MESSAGE$84B1".
  $935E,$03 #REGhl=#R$84B1.
  $9361,$03 Jump to #R$91D4.
@ $9364 label=ActionDrop_Step25
  $9364,$06 Move #MESSAGE$700A (#N$39) to nowhere (#N$00).
  $936A,$06 Move #MESSAGE$6AE0 (#N$0C) to the inventory (#N$01).
@ $9370 label=ActionDrop_Step26
  $9370,$02 #MESSAGE$6AE0 is what the player is now holding.
  $9372,$03 Continue at #R$91A5 to see what the player is now holding.
N $9375 Nothing else is valid.
@ $9375 label=ActionDrop_Step27
N $9375 Print "#MESSAGE$645B".
  $9375,$03 #REGhl=#R$645B.
  $9378,$03 Jump to #R$91D4.

c $937B Handler: Resolve Synonym
@ $937B label=HandlerResolveSynonym
D $937B Replace a synonym with the verb it stands for and run that verb.
  $937B,$08 Jump to #R$9392 unless the command matches the phrase at #R$89A7.
  $9383,$03 Fetch the second word of the command.
  $9386,$03 The second word takes the place of the verb.
  $9389,$05 The second word becomes the verb, and nothing follows it.
  $938E,$01 The synonym has replaced the typed verb.
  $938F,$03 Jump to #R$8D85 to match verb.
@ $9392 label=HandlerResolveSynonym_Step1
  $9392,$03 Fetch the second word of the command.
  $9395,$04 Jump to #R$939D when the command has no second word (#N$FF).
  $9399,$03 Call #R$6479 to ask the player to rephrase the command.
  $939C,$01 Return.
@ $939D label=HandlerResolveSynonym_Step2
  $939D,$03 Call #R$6480 to say there is nothing there.
  $93A0,$01 Return.

c $93A1 Action: Enter
@ $93A1 label=ActionEnter
E $93A1 View the equivalent code in;
. #LIST
. { #FOREST$F71B }
. { #JEWELS$FC61 }
. { #WARLORD$FB21 }
. LIST#
D $93A1 Go into the open airlock or the alien commander's chamber.
  $93A1,$04 Return if the command does not name a single object.
  $93A5,$02 Continue at #R$93B2 to match the place the player named.
@ $93A7 label=ActionEnter_Loop1
N $93A7 Print "#MESSAGE$645B".
  $93A7,$03 #REGhl=#R$645B.
  $93AA,$03 Call #R$64E9.
@ $93AA label=ActionEnter_Loop2
  $93AD,$01 Return.
@ $93AE label=ActionEnter_Loop3
  $93AE,$03 Call #R$8E18 to move the player.
  $93B1,$01 Return.
N $93B2 Was the player trying to enter the airlock?
@ $93B2 label=ActionEnter_Step1
  $93B2,$06 Point at the phrase at #R$89B3 and call #R$6900 to match it against
. the command.
  $93B8,$02 Jump to #R$93C7 if it doesn't match.
  $93BA,$08 Jump to #R$93A7 when #MESSAGE$6B15 (#N$11) is not here or being
. carried.
  $93C2,$02 The open airlock leads into #ROOM$04.
  $93C4,$03 Continue at #R$93AE to go through the airlock.
N $93C7 Was the player trying to enter the alien commander's chamber?
@ $93C7 label=ActionEnter_Step2
  $93C7,$0F Jump to #R$93E1 unless the command matches the phrase at #R$894B
. (#MESSAGE$6E6D (#N$27)).
N $93D6 Print "#MESSAGE$7D6B".
  $93D6,$03 #REGhl=#R$7D6B.
  $93D9,$03 Jump to #R$93AA.
@ $93DC label=ActionEnter_Step3
  $93DC,$02 The commander is reached through #ROOM$3E.
  $93DE,$03 Continue at #R$93AE to go to the alien commander.
@ $93E1 label=ActionEnter_Step4
  $93E1,$03 Continue at #R$93A7 to say the player can't.

c $93E4 Action: Leave
@ $93E4 label=ActionLeave
D $93E4 Leave the ship or the alien commander's chamber.
  $93E4,$03 Call #R$6992 to match or rephrase.
  $93E7,$01 Return if the command was rejected.
  $93E8,$02 The command names a place the player can leave.
  $93EA,$08 Jump to #R$9402 when the command matches the phrase at #R$894B.
  $93F2,$08 Jump to #R$9402 when the command matches the phrase at #R$89B3.
@ $93FA label=ActionLeave_Loop1
  $93FA,$03 Call #R$6487 to say that is not understood.
  $93FD,$01 Return.
@ $93FE label=ActionLeave_Loop2
  $93FE,$03 Call #R$8E18 to move the player.
  $9401,$01 Return.
@ $9402 label=ActionLeave_Step1
  $9402,$07 Jump to #R$940D when #MESSAGE$6B15 (#N$10) is not here or being
. carried.
  $9409,$02 Step back out onto #ROOM$05.
  $940B,$02 Continue at #R$93FE to step back onto the landing pad.
@ $940D label=ActionLeave_Step2
  $940D,$03 Fetch the current room.
  $9410,$04 The player can leave only from #ROOM$3E.
  $9414,$02 Go to wherever #MESSAGE$6F6C currently is.
  $9416,$03 Call #R$694F to read the object's location.
  $9419,$02 Continue at #R$93FE to go where the alien device is.

c $941B Action: Give
@ $941B label=ActionGive
E $941B View the equivalent code in;
. #LIST
. { #FOREST$F216 }
. { #HEROES$F972 }
. { #JEWELS$F7AB }
. { #WARLORD$F9B3 }
. LIST#
D $941B Hand the key to the alien commander.
  $941B,$04 Return if the command does not name a single object.
  $941F,$04 Jump to #R$9434 when the command names at least #N$02 nouns.
N $9423 Print "#MESSAGE$642C".
  $9423,$03 #REGhl=#R$642C.
  $9426,$02 Jump to #R$9430.
@ $9428 label=ActionGive_Loop1
N $9428 Print "#MESSAGE$645B".
  $9428,$03 #REGhl=#R$645B.
  $942B,$02 Jump to #R$9430.
@ $942D label=ActionGive_Loop2
N $942D Print "#MESSAGE$6466".
  $942D,$03 #REGhl=#R$6466.
  $9430,$03 Call #R$64E9.
@ $9430 label=ActionGive_Loop3
  $9433,$01 Return.
@ $9434 label=ActionGive_Step1
  $9434,$0F Jump to #R$9466 unless the command matches the phrase at #R$89B5
. (#MESSAGE$6ABB (#N$09)).
  $9443,$06 Print #MESSAGE$7A59 on the same line.
N $9449 Print "#MESSAGE$7708".
  $9449,$03 #REGhl=#R$7708.
  $944C,$02 Jump to #R$9430.
@ $944E label=ActionGive_Step2
  $944E,$06 Move #MESSAGE$6EC5 (#N$2A) to nowhere (#N$00).
  $9454,$06 Move #MESSAGE$6ABB (#N$09) to nowhere (#N$00).
  $945A,$06 Move #MESSAGE$7032 (#N$3A) to room #N$36: "#ROOM$36".
  $9460,$04 The player is carrying one fewer object.
  $9464,$02 Continue at #R$942D to confirm the gift.
@ $9466 label=ActionGive_Step3
  $9466,$03 Continue at #R$9428 to say the player can't.

c $9469 Action: Eat
@ $9469 label=ActionEat
E $9469 View the equivalent code in;
. #LIST
. { #FOREST$F26D }
. { #JEWELS$F999 }
. { #WARLORD$FBC3 }
. LIST#
D $9469 Eating has no useful effect here.
  $9469,$03 Call #R$692F to look for a noun.
  $946C,$04 Jump to #R$9475 when the command names at least #N$01 noun.
N $9470 Print "#MESSAGE$645B".
  $9470,$03 #REGhl=#R$645B.
  $9473,$02 Jump to #R$9478.
@ $9475 label=ActionEat_Step1
N $9475 Print "#MESSAGE$7B05".
  $9475,$03 #REGhl=#R$7B05.
  $9478,$03 Call #R$64E9.
@ $9478 label=ActionEat_Step2
  $947B,$01 Return.

c $947C Action: Swim
@ $947C label=ActionSwim
E $947C View the equivalent code in;
. #LIST
. { #FOREST$F7EB }
. { #JEWELS$FD7C }
. { #WARLORD$FC8D }
. LIST#
D $947C Swim when the current room contains water.
  $947C,$08 Jump to #R$9489 when the command matches the phrase at #R$89B9.
N $9484 Print "#MESSAGE$645B".
  $9484,$03 #REGhl=#R$645B.
  $9487,$02 Jump to #R$94AD.
@ $9489 label=ActionSwim_Step1
  $9489,$03 Fetch the current room.
  $948C,$04 The player is in the water at room #N$38: "#ROOM$38".
  $9490,$04 The player is in the water at room #N$37: "#ROOM$37".
  $9494,$04 The player is in the water at room #N$39: "#ROOM$39".
  $9498,$04 The player is in the water at room #N$3A: "#ROOM$3A".
  $949C,$04 The player is at the stream in #ROOM$2F.
N $94A0 Print "#MESSAGE$7B26".
  $94A0,$03 #REGhl=#R$7B26.
  $94A3,$02 Jump to #R$94AD.
@ $94A5 label=ActionSwim_Step2
N $94A5 Print "#MESSAGE$7B99".
  $94A5,$03 #REGhl=#R$7B99.
  $94A8,$02 Jump to #R$94AD.
@ $94AA label=ActionSwim_Step3
N $94AA Print "#MESSAGE$7B41".
  $94AA,$03 #REGhl=#R$7B41.
  $94AD,$03 Call #R$64E9.
@ $94AD label=ActionSwim_Step4
  $94B0,$01 Return.

c $94B1 Action: Cut
@ $94B1 label=ActionCut
D $94B1 Cut the named object when the player has a blade.
  $94B1,$04 Return if the command does not name a single object.
  $94B5,$02 Continue at #R$94BC to see whether the player has a blade.
@ $94B7 label=ActionCut_Loop1
N $94B7 Print "#MESSAGE$645B".
  $94B7,$03 #REGhl=#R$645B.
  $94BA,$02 Jump to #R$94CD.
@ $94BC label=ActionCut_Step1
  $94BC,$07 Jump to #R$94D1 when the player is carrying #MESSAGE$6A38 (#N$00).
  $94C3,$07 Jump to #R$94D1 when the player is carrying #MESSAGE$6AC2 (#N$0A).
N $94CA Print "#MESSAGE$7BB3".
  $94CA,$03 #REGhl=#R$7BB3.
  $94CD,$03 Call #R$64E9.
@ $94CD label=ActionCut_Loop2
  $94D0,$01 Return.
N $94D1 Was the player trying to cut the vine?
@ $94D1 label=ActionCut_Step2
  $94D1,$0F Jump to #R$94FB unless the command matches the phrase at #R$89C0
. (#MESSAGE$6CD7 (#N$1E)).
  $94E0,$06 Move #MESSAGE$6CD7 (#N$1E) to nowhere (#N$00).
  $94E6,$06 Move #MESSAGE$6D15 (#N$1F) to room #N$1D: "#ROOM$1D".
N $94EC This action changes the map:
  $94EC,$05 Open the east exit of #ROOM$1D onto #ROOM$1E.
  $94F1,$05 Open the way up from #ROOM$1D to #ROOM$3F.
N $94F6 Print "#MESSAGE$7BD1".
  $94F6,$03 #REGhl=#R$7BD1.
  $94F9,$02 Jump to #R$94CD.
N $94FB Was the player trying to cut the ropes?
@ $94FB label=ActionCut_Step3
  $94FB,$0F Jump to #R$9528 unless the command matches the phrase at #R$89E2
. (#MESSAGE$6D26 (#N$20)).
N $950A Print "#MESSAGE$7C0E".
  $950A,$03 #REGhl=#R$7C0E.
  $950D,$03 Jump to #R$94CD.
@ $9510 label=ActionCut_Step4
  $9510,$06 Move #MESSAGE$6D26 (#N$20) to nowhere (#N$00).
  $9516,$06 Move #MESSAGE$6D6D (#N$21) to room #N$2E: "#ROOM$2E".
  $951C,$06 Move #MESSAGE$6D86 (#N$22) to room #N$2E: "#ROOM$2E".
N $9522 Print "#MESSAGE$7C29".
  $9522,$03 #REGhl=#R$7C29.
  $9525,$03 Jump to #R$94CD.
@ $9528 label=ActionCut_Step5
  $9528,$03 Continue at #R$94B7 to say the player can't.

c $952B Action: Kill
@ $952B label=ActionKill
E $952B View the equivalent code in;
. #LIST
. { #FOREST$F2A7 }
. { #HEROES$FA72 }
. { #JEWELS$F851 }
. { #WARLORD$FC4B }
. LIST#
D $952B Attack the named creature with a weapon.
  $952B,$04 Return if the command does not name a single object.
  $952F,$02 Continue at #R$953D to match the creature the player named.
@ $9531 label=ActionKill_Loop1
N $9531 Print "#MESSAGE$642C".
  $9531,$03 #REGhl=#R$642C.
  $9534,$02 Jump to #R$9539.
@ $9536 label=ActionKill_Loop2
N $9536 Print "#MESSAGE$645B".
  $9536,$03 #REGhl=#R$645B.
  $9539,$03 Call #R$64E9.
@ $9539 label=ActionKill_Loop3
  $953C,$01 Return.
@ $953D label=ActionKill_Step1
  $953D,$08 Jump to #R$954D unless the command matches the phrase at #R$89F1.
  $9545,$06 Print #MESSAGE$7C7B.
  $954B,$02 Continue at #R$9531 to ask the player to be more specific.
@ $954D label=ActionKill_Step2
  $954D,$08 Jump to #R$957B unless the command matches the phrase at #R$8A0F.
@ $9555 label=ActionKill_Step3
  $9555,$07 Jump to #R$9562 when #MESSAGE$6E6D (#N$27) is here or being
. carried.
N $955C Print "#MESSAGE$7CB3".
  $955C,$03 #REGhl=#R$7CB3.
  $955F,$03 Jump to #R$9539.
@ $9562 label=ActionKill_Step4
  $9562,$07 Jump to #R$9575 when the player is carrying #MESSAGE$6A41 (#N$01).
  $9569,$06 Print #MESSAGE$7A59 on the same line.
N $956F Print "#MESSAGE$762B".
  $956F,$03 #REGhl=#R$762B.
  $9572,$03 Jump to #R$9539.
@ $9575 label=ActionKill_Step5
N $9575 Print "#MESSAGE$7C86".
  $9575,$03 #REGhl=#R$7C86.
  $9578,$03 Jump to #R$9539.
@ $957B label=ActionKill_Step6
  $957B,$0F Jump to #R$95BB unless the command matches the phrase at #R$8A23
. (#MESSAGE$6E6D (#N$27)).
N $958A Print "#MESSAGE$7CB3".
  $958A,$03 #REGhl=#R$7CB3.
  $958D,$03 Jump to #R$9539.
@ $9590 label=ActionKill_Step7
  $9590,$07 Jump to #R$95A3 when the player is carrying #MESSAGE$6AC2 (#N$0A).
  $9597,$06 Print #MESSAGE$7A59 on the same line.
N $959D Print "#MESSAGE$76A0".
  $959D,$03 #REGhl=#R$76A0.
  $95A0,$03 Jump to #R$9539.
@ $95A3 label=ActionKill_Step8
  $95A3,$06 Move #MESSAGE$6E6D (#N$27) to nowhere (#N$00).
  $95A9,$06 Move #MESSAGE$6E93 (#N$28) to room #N$35: "#ROOM$35".
  $95AF,$06 Move #MESSAGE$6ABB (#N$09) to room #N$35: "#ROOM$35".
N $95B5 Print "#MESSAGE$7CC6".
  $95B5,$03 #REGhl=#R$7CC6.
  $95B8,$03 Jump to #R$9539.
@ $95BB label=ActionKill_Step9
  $95BB,$08 Jump to #R$95F5 unless the command matches the phrase at #R$8A37.
@ $95C3 label=ActionKill_Step10
  $95C3,$07 Jump to #R$95D0 when #MESSAGE$6B2A (#N$12) is here or being
. carried.
N $95CA Print "#MESSAGE$7CB3".
  $95CA,$03 #REGhl=#R$7CB3.
  $95CD,$03 Jump to #R$9539.
@ $95D0 label=ActionKill_Step11
  $95D0,$07 Jump to #R$95E3 when the player is carrying #MESSAGE$6A41 (#N$01).
  $95D7,$06 Print #MESSAGE$7A59 on the same line.
N $95DD Print "#MESSAGE$762B".
  $95DD,$03 #REGhl=#R$762B.
  $95E0,$03 Jump to #R$9539.
@ $95E3 label=ActionKill_Step12
  $95E3,$06 Move #MESSAGE$6B2A (#N$12) to nowhere (#N$00).
  $95E9,$06 Move #MESSAGE$6B5B (#N$13) to room #N$0D: "#ROOM$0D".
N $95EF Print "#MESSAGE$7D2D".
  $95EF,$03 #REGhl=#R$7D2D.
  $95F2,$03 Jump to #R$9539.
@ $95F5 label=ActionKill_Step13
  $95F5,$08 Jump to #R$964C unless the command matches the phrase at #R$8A4B.
@ $95FD label=ActionKill_Step14
  $95FD,$04 The creatures that can be shot here start at scenic slot #N$00.
@ $9601 label=ActionKill_Loop4
  $9601,$01 Test this scenic slot.
  $9602,$03 Call #R$68E0 to test whether the object is here.
  $9605,$02 This creature is here.
  $9607,$02 Try the next scenic slot.
  $9609,$02 Repeat for the other creatures in the group.
N $960B Print "#MESSAGE$7CB3".
  $960B,$03 #REGhl=#R$7CB3.
  $960E,$03 Jump to #R$9539.
@ $9611 label=ActionKill_Step15
  $9611,$07 Jump to #R$9624 when the player is carrying #MESSAGE$6A41 (#N$01).
  $9618,$06 Print #MESSAGE$7A59 on the same line.
N $961E Print "#MESSAGE$762B".
  $961E,$03 #REGhl=#R$762B.
  $9621,$03 Jump to #R$9539.
@ $9624 label=ActionKill_Step16
  $9624,$02 One chance in #N$05 that the shot misses.
  $9626,$03 Call #R$65D6 to generate random number.
  $9629,$02 The shot misses.
N $962B Print "#MESSAGE$7D44".
  $962B,$03 #REGhl=#R$7D44.
  $962E,$03 Jump to #R$9539.
@ $9631 label=ActionKill_Step17
  $9631,$03 Remove the creature that was hit.
  $9634,$03 Call #R$65E6 to move the object.
  $9637,$04 Clear the scenic event that belonged to that creature.
  $963B,$08 Leave the corpse in the current room.
  $9643,$03 Call #R$65E6 to move the object.
N $9646 Print "#MESSAGE$7D2D".
  $9646,$03 #REGhl=#R$7D2D.
  $9649,$03 Jump to #R$9539.
@ $964C label=ActionKill_Step18
  $964C,$08 Jump to #R$966D unless the command matches the phrase at #R$8A5F.
@ $9654 label=ActionKill_Step19
  $9654,$07 Jump to #R$9667 when the player is carrying #MESSAGE$6A41 (#N$01).
  $965B,$06 Print #MESSAGE$7A59 on the same line.
N $9661 Print "#MESSAGE$762B".
  $9661,$03 #REGhl=#R$762B.
  $9664,$03 Jump to #R$9539.
@ $9667 label=ActionKill_Step20
N $9667 Print "#MESSAGE$7D50".
  $9667,$03 #REGhl=#R$7D50.
  $966A,$03 Jump to #R$9539.
@ $966D label=ActionKill_Step21
  $966D,$03 Continue at #R$9536 to say the player can't.

c $9670 Action: Read
@ $9670 label=ActionRead
E $9670 View the equivalent code in;
. #LIST
. { #HEROES$FA02 }
. LIST#
D $9670 Read the writing or the ship's computer screen.
  $9670,$04 Return if the command does not name a single object.
  $9674,$02 Continue at #R$967D to match what the player wants to read.
@ $9676 label=ActionRead_Loop1
N $9676 Print "#MESSAGE$645B".
  $9676,$03 #REGhl=#R$645B.
  $9679,$03 Call #R$64E9.
@ $9679 label=ActionRead_Loop2
  $967C,$01 Return.
@ $967D label=ActionRead_Step1
  $967D,$08 Jump to #R$968A unless the command matches the phrase at #R$8957.
N $9685 Print "#MESSAGE$79F0".
  $9685,$03 #REGhl=#R$79F0.
  $9688,$02 Jump to #R$9679.
@ $968A label=ActionRead_Step2
  $968A,$08 Jump to #R$96BB unless the command matches the phrase at #R$8AC3.
N $9692 Print "#MESSAGE$7E46".
  $9692,$03 #REGhl=#R$7E46.
  $9695,$03 Call #R$64E9.
@ $9698 label=ActionRead_Loop3
  $9698,$03 Call #R$6604 to read another command.
  $969B,$03 Call #R$6972 to reject a command that names an object.
  $969E,$02 Jump back to #R$9698 when the carry flag is set.
  $96A0,$03 Fetch the first word of the command.
  $96A3,$04 The typed word is not token #N$14.
  $96A7,$05 Move the player to room #N$03: "#ROOM$03".
  $96AC,$01 Return.
@ $96AD label=ActionRead_Step3
  $96AD,$04 Jump to #R$96B5 when the typed word is token #N$15.
  $96B1,$03 Call #R$6487 to say that is not understood.
  $96B4,$01 Return.
@ $96B5 label=ActionRead_Step4
N $96B5 Print "#MESSAGE$6466".
  $96B5,$03 #REGhl=#R$6466.
  $96B8,$03 Jump to #R$9679.
@ $96BB label=ActionRead_Step5
  $96BB,$03 Continue at #R$9676 to say the player can't.

c $96BE Action: Land
@ $96BE label=ActionLand
D $96BE Land the ship when the coordinates are set.
  $96BE,$03 Call #R$6992 to match or rephrase.
  $96C1,$01 Return if the command was rejected.
  $96C2,$02 Continue at #R$96CB to check where the ship can land.
@ $96C4 label=ActionLand_Loop1
N $96C4 Print "#MESSAGE$645B".
  $96C4,$03 #REGhl=#R$645B.
  $96C7,$03 Call #R$64E9.
@ $96C7 label=ActionLand_Loop2
  $96CA,$01 Return.
@ $96CB label=ActionLand_Step1
  $96CB,$08 Jump to #R$96E5 unless the command matches the phrase at #R$8AC5.
  $96D3,$03 Fetch the current room.
  $96D6,$04 The ship is already in #ROOM$04, ready to land.
N $96DA Print "#MESSAGE$774B".
  $96DA,$03 #REGhl=#R$774B.
  $96DD,$02 Jump to #R$96C7.
@ $96DF label=ActionLand_Step2
  $96DF,$05 Move the player to room #N$04: "#ROOM$04".
  $96E4,$01 Return.
@ $96E5 label=ActionLand_Step3
  $96E5,$02 Continue at #R$96C4 to say the player can't.

c $96E7 Action: Open
@ $96E7 label=ActionOpen
E $96E7 View the equivalent code in;
. #LIST
. { #FOREST$F5F1 }
. { #HEROES$F9DC }
. { #JEWELS$FA3C }
. LIST#
D $96E7 Open the named door, airlock or container.
  $96E7,$04 Return if the command does not name a single object.
  $96EB,$02 Continue at #R$96F4 to match what the player wants to open.
@ $96ED label=ActionOpen_Loop1
N $96ED Print "#MESSAGE$645B".
  $96ED,$03 #REGhl=#R$645B.
  $96F0,$03 Call #R$64E9.
@ $96F0 label=ActionOpen_Loop2
  $96F3,$01 Return.
N $96F4 Was the player trying to open the airlock?
@ $96F4 label=ActionOpen_Step1
  $96F4,$0F Jump to #R$972B unless the command matches the phrase at #R$8AC9
. (#MESSAGE$6AFE (#N$0E)).
  $9703,$07 Jump to #R$970F when #MESSAGE$6AFE (#N$0F) is here or being
. carried.
N $970A Print "#MESSAGE$77DC".
  $970A,$03 #REGhl=#R$77DC.
  $970D,$02 Jump to #R$96F0.
@ $970F label=ActionOpen_Step2
  $970F,$06 Move #MESSAGE$6AFE (#N$0E) to nowhere (#N$00).
  $9715,$06 Move #MESSAGE$6AFE (#N$0F) to nowhere (#N$00).
  $971B,$06 Move #MESSAGE$6B15 (#N$10) to room #N$04: "#ROOM$04".
  $9721,$06 Move #MESSAGE$6B15 (#N$11) to room #N$05: "#ROOM$05".
  $9727,$03 Call #R$648E to say the player is not carrying it.
  $972A,$01 Return.
N $972B Was the player trying to open the door?
@ $972B label=ActionOpen_Step3
  $972B,$0F Jump to #R$9757 unless the command matches the phrase at #R$8ACB
. (#MESSAGE$6CC9 (#N$1D)).
N $973A Print "#MESSAGE$77DC".
  $973A,$03 #REGhl=#R$77DC.
  $973D,$03 Jump to #R$96F0.
@ $9740 label=ActionOpen_Step4
  $9740,$06 Move #MESSAGE$6CBA (#N$1C) to nowhere (#N$00).
  $9746,$06 Move #MESSAGE$6CC9 (#N$1D) to room #N$2B: "#ROOM$2B".
N $974C This action changes the map:
  $974C,$05 Open the way down from #ROOM$2B.
N $9751 Print "#MESSAGE$7EB6".
  $9751,$03 #REGhl=#R$7EB6.
  $9754,$03 Jump to #R$96F0.
@ $9757 label=ActionOpen_Step5
  $9757,$03 Continue at #R$96ED to say the player can't.

c $975A Action: Close
@ $975A label=ActionClose
E $975A View the equivalent code in;
. #LIST
. { #FOREST$F68C }
. { #HEROES$F9E3 }
. { #JEWELS$FAA8 }
. LIST#
D $975A Close the named door or airlock.
  $975A,$04 Return if the command does not name a single object.
  $975E,$02 Continue at #R$9767 to match what the player wants to close.
@ $9760 label=ActionClose_Loop1
N $9760 Print "#MESSAGE$645B".
  $9760,$03 #REGhl=#R$645B.
  $9763,$03 Call #R$64E9.
@ $9763 label=ActionClose_Loop2
  $9766,$01 Return.
N $9767 Was the player trying to close the airlock?
@ $9767 label=ActionClose_Step1
  $9767,$0F Jump to #R$979E unless the command matches the phrase at #R$8AC9
. (#MESSAGE$6B15 (#N$10)).
  $9776,$07 Jump to #R$9782 when #MESSAGE$6B15 (#N$11) is here or being
. carried.
N $977D Print "#MESSAGE$781C".
  $977D,$03 #REGhl=#R$781C.
  $9780,$02 Jump to #R$9763.
@ $9782 label=ActionClose_Step2
  $9782,$06 Move #MESSAGE$6B15 (#N$10) to nowhere (#N$00).
  $9788,$06 Move #MESSAGE$6B15 (#N$11) to nowhere (#N$00).
  $978E,$06 Move #MESSAGE$6AFE (#N$0E) to room #N$04: "#ROOM$04".
  $9794,$06 Move #MESSAGE$6AFE (#N$0F) to room #N$05: "#ROOM$05".
  $979A,$03 Call #R$648E to say the player is not carrying it.
  $979D,$01 Return.
N $979E Was the player trying to close the door?
@ $979E label=ActionClose_Step3
  $979E,$0F Jump to #R$97C7 unless the command matches the phrase at #R$8ACB
. (#MESSAGE$6CBA (#N$1C)).
N $97AD Print "#MESSAGE$781C".
  $97AD,$03 #REGhl=#R$781C.
  $97B0,$03 Jump to #R$9763.
@ $97B3 label=ActionClose_Step4
  $97B3,$06 Move #MESSAGE$6CC9 (#N$1D) to nowhere (#N$00).
  $97B9,$06 Move #MESSAGE$6CBA (#N$1C) to room #N$2B: "#ROOM$2B".
N $97BF This action changes the map:
  $97BF,$04 Seal the way down from #ROOM$2B.
  $97C3,$03 Call #R$648E to say the player is not carrying it.
  $97C6,$01 Return.
@ $97C7 label=ActionClose_Step5
  $97C7,$03 Continue at #R$9760 to say the player can't.

c $97CA Action: Shoot
@ $97CA label=ActionShoot
D $97CA Fire the laser pistol at the named target.
  $97CA,$04 Return if the command does not name a single object.
  $97CE,$07 Jump to #R$97E2 when the player is carrying #MESSAGE$6A41 (#N$01).
  $97D5,$06 Print #MESSAGE$7A59 on the same line.
N $97DB Print "#MESSAGE$762B".
  $97DB,$03 #REGhl=#R$762B.
  $97DE,$03 Call #R$64E9.
@ $97DE label=ActionShoot_Loop1
  $97E1,$01 Return.
@ $97E2 label=ActionShoot_Step1
  $97E2,$09 Jump to #R$9555 when the command matches the phrase at #R$8A0F.
  $97EB,$09 Jump to #R$95C3 when the command matches the phrase at #R$8AD2.
  $97F4,$09 Jump to #R$95C3 when the command matches the phrase at #R$8A37.
  $97FD,$09 Jump to #R$95FD when the command matches the phrase at #R$8AD7.
  $9806,$09 Jump to #R$95FD when the command matches the phrase at #R$8A4B.
  $980F,$09 Jump to #R$9555 when the command matches the phrase at #R$8ACD.
  $9818,$08 Jump to #R$9826 unless the command matches the phrase at #R$8B19.
N $9820 Print "#MESSAGE$7F07".
  $9820,$03 #REGhl=#R$7F07.
  $9823,$03 Jump to #R$97DE.
@ $9826 label=ActionShoot_Step2
  $9826,$08 Jump to #R$9848 unless the command matches the phrase at #R$8ADC.
@ $982E label=ActionShoot_Step3
  $982E,$03 These are the targets that can be shot in this room.
  $9831,$02 Four targets can be shot in this room.
@ $9833 label=ActionShoot_Loop2
  $9833,$01 Read the next target.
  $9834,$03 Call #R$68E0 to test whether the object is here.
  $9837,$02 This target is here.
  $9839,$01 Try the next target.
  $983A,$02 Repeat for the other targets.
@ $983C label=ActionShoot_Step4
  $983C,$03 Remove the target that was hit.
  $983F,$03 Call #R$65E6 to move the object.
N $9842 Print "#MESSAGE$7EE7".
  $9842,$03 #REGhl=#R$7EE7.
  $9845,$03 Jump to #R$97DE.
@ $9848 label=ActionShoot_Step5
  $9848,$08 Jump to #R$985A unless the command matches the phrase at #R$8AF5.
  $9850,$06 Print #MESSAGE$7A6E.
  $9856,$01 The shot ends the game.
  $9857,$03 Jump to #R$8DB3 to game over.
@ $985A label=ActionShoot_Step6
  $985A,$03 Continue at #R$9654 to see whether the pistol can hit that target.
  $985D,$04 Targets that can be shot here: #N($3C), #N($15), #N$16 and #N$14.

c $9861 Action: Wear
@ $9861 label=ActionWear
E $9861 View the equivalent code in;
. #LIST
. { #FOREST$F79D }
. { #JEWELS$FBD5 }
. { #WARLORD$FB5D }
. LIST#
D $9861 Wear the pair of gloves.
  $9861,$04 Return if the command does not name a single object.
  $9865,$02 Continue at #R$986E to match what the player wants to wear.
@ $9867 label=ActionWear_Loop1
N $9867 Print "#MESSAGE$645B".
  $9867,$03 #REGhl=#R$645B.
  $986A,$03 Call #R$64E9.
@ $986A label=ActionWear_Loop2
  $986D,$01 Return.
N $986E Was the player trying to wear the gloves?
@ $986E label=ActionWear_Step1
  $986E,$0F Jump to #R$98A8 unless the command matches the phrase at #R$897D
. (#MESSAGE$700A (#N$39)).
N $987D Print "#MESSAGE$7F26".
  $987D,$03 #REGhl=#R$7F26.
  $9880,$03 Jump to #R$986A.
@ $9883 label=ActionWear_Step2
  $9883,$07 Jump to #R$9896 when the player is carrying #MESSAGE$6AE0 (#N$0C).
  $988A,$06 Print #MESSAGE$7A59 on the same line.
N $9890 Print "#MESSAGE$75F6".
  $9890,$03 #REGhl=#R$75F6.
  $9893,$03 Jump to #R$986A.
@ $9896 label=ActionWear_Step3
  $9896,$06 Move #MESSAGE$6AE0 (#N$0C) to nowhere (#N$00).
  $989C,$06 Move #MESSAGE$700A (#N$39) to the inventory (#N$01).
N $98A2 Print "#MESSAGE$6466".
  $98A2,$03 #REGhl=#R$6466.
  $98A5,$03 Jump to #R$986A.
@ $98A8 label=ActionWear_Step4
  $98A8,$03 Continue at #R$9867 to say the player can't.

c $98AB Action: Drink
@ $98AB label=ActionDrink
E $98AB View the equivalent code in;
. #LIST
. { #FOREST$F292 }
. { #HEROES$FAA5 }
. { #JEWELS$F9E4 }
. { #WARLORD$FA91 }
. LIST#
D $98AB Drinking does nothing useful here.
  $98AB,$04 Return if the command does not name a single object.
  $98AF,$03 Call #R$6487 to say that is not understood.
  $98B2,$06 Print #MESSAGE$7F43.
  $98B8,$01 Return.

c $98B9 Action: Turn
@ $98B9 label=ActionTurn
D $98B9 Turn the named key, dial or switch.
  $98B9,$04 Return if the command does not name a single object.
  $98BD,$04 Jump to #R$98CD when the command names fewer than #N$02 nouns.
N $98C1 Print "#MESSAGE$6445".
  $98C1,$03 #REGhl=#R$6445.
  $98C4,$02 Jump to #R$98C9.
@ $98C6 label=ActionTurn_Loop1
N $98C6 Print "#MESSAGE$645B".
  $98C6,$03 #REGhl=#R$645B.
  $98C9,$03 Call #R$64E9.
@ $98C9 label=ActionTurn_Loop2
  $98CC,$01 Return.
N $98CD Was the player trying to turn the dish / sphere?
@ $98CD label=ActionTurn_Step1
  $98CD,$0F Jump to #R$9924 unless the command matches the phrase at #R$8973
. (#MESSAGE$709B (#N$3C)).
  $98DC,$07 Jump to #R$98E9 when #MESSAGE$6B71 (#N$14) is here or being
. carried.
N $98E3 Print "#MESSAGE$7F60".
  $98E3,$03 #REGhl=#R$7F60.
  $98E6,$03 Jump to #R$98C9.
@ $98E9 label=ActionTurn_Step2
  $98E9,$06 Move #MESSAGE$6B71 (#N$14) to nowhere (#N$00).
  $98EF,$03 Fetch the current room.
  $98F2,$03 Leave #MESSAGE$709B in the room where the dish was turned.
  $98F5,$03 Call #R$65E6 to move the object.
N $98F8 Print "#MESSAGE$7F77".
  $98F8,$03 #REGhl=#R$7F77.
  $98FB,$03 Jump to #R$98C9.
@ $98FE label=ActionTurn_Step3
  $98FE,$06 Move #MESSAGE$709B (#N$3C) to nowhere (#N$00).
  $9904,$03 Fetch the current room.
  $9907,$03 Leave #MESSAGE$6B71 in that same room.
  $990A,$03 Call #R$65E6 to move the object.
  $990D,$06 Print #MESSAGE$7FB2.
  $9913,$03 Fetch the current room.
  $9916,$03 Return if the player is not in room #N$13: "#ROOM$13".
N $9919 This action changes the map:
  $9919,$05 Open the way down from #ROOM$13 to #ROOM$18.
N $991E Print "#MESSAGE$7FEE".
  $991E,$03 #REGhl=#R$7FEE.
  $9921,$03 Jump to #R$98C9.
N $9924 Was the player trying to turn the key in the panel?
@ $9924 label=ActionTurn_Step4
  $9924,$0F Jump to #R$997C unless the command matches the phrase at #R$8962
. (#MESSAGE$7032 (#N$3A)).
  $9933,$07 Jump to #R$9940 when #MESSAGE$7067 (#N$3B) is here or being
. carried.
N $993A Print "#MESSAGE$7F60".
  $993A,$03 #REGhl=#R$7F60.
  $993D,$03 Jump to #R$98C9.
@ $9940 label=ActionTurn_Step5
  $9940,$06 Move #MESSAGE$7067 (#N$3B) to nowhere (#N$00).
  $9946,$06 Move #MESSAGE$7032 (#N$3A) to room #N$36: "#ROOM$36".
  $994C,$06 Move #MESSAGE$70DA (#N$3E) to nowhere (#N$00).
N $9952 Print "#MESSAGE$8035".
  $9952,$03 #REGhl=#R$8035.
  $9955,$03 Jump to #R$98C9.
@ $9958 label=ActionTurn_Step6
  $9958,$06 Move #MESSAGE$7032 (#N$3A) to nowhere (#N$00).
  $995E,$06 Move #MESSAGE$7067 (#N$3B) to room #N$36: "#ROOM$36".
  $9964,$06 Print #MESSAGE$80A2.
  $996A,$06 Return when #MESSAGE$6EE5 (#N$2B) is here or being carried.
  $9970,$06 Move #MESSAGE$70DA (#N$3E) to room #N$36: "#ROOM$36".
N $9976 Print "#MESSAGE$8056".
  $9976,$03 #REGhl=#R$8056.
  $9979,$03 Jump to #R$98C9.
@ $997C label=ActionTurn_Step7
  $997C,$03 Continue at #R$98C6 to say the player can't.

c $997F Action: Type
@ $997F label=ActionType
D $997F Type the password named in the command.
  $997F,$03 Fetch the current room.
  $9982,$04 Jump to #R$9992 when the player is in room #N$36: "#ROOM$36".
N $9986 Print "#MESSAGE$6445".
  $9986,$03 #REGhl=#R$6445.
  $9989,$02 Jump to #R$998E.
@ $998B label=ActionType_Loop1
N $998B Print "#MESSAGE$80C3".
  $998B,$03 #REGhl=#R$80C3.
  $998E,$03 Call #R$64E9.
@ $998E label=ActionType_Loop2
  $9991,$01 Return.
@ $9992 label=ActionType_Step1
  $9992,$07 Jump to #R$999F when #MESSAGE$7067 (#N$3B) is here or being
. carried.
N $9999 Print "#MESSAGE$81BC".
  $9999,$03 #REGhl=#R$81BC.
  $999C,$03 Jump to #R$998E.
@ $999F label=ActionType_Step2
  $999F,$07 Jump to #R$99AC when #MESSAGE$6EE5 (#N$2B) is not here or being
. carried.
N $99A6 Print "#MESSAGE$81D9".
  $99A6,$03 #REGhl=#R$81D9.
  $99A9,$03 Jump to #R$998E.
@ $99AC label=ActionType_Step3
  $99AC,$08 Jump to #R$99DA unless the command matches the phrase at #R$8B32.
  $99B4,$06 Move #MESSAGE$70DA (#N$3E) to nowhere (#N$00).
  $99BA,$06 Move #MESSAGE$7114 (#N$3F) to room #N$35: "#ROOM$35".
  $99C0,$06 Move #MESSAGE$6EE5 (#N$2B) to room #N$36: "#ROOM$36".
N $99C6 This action changes the map:
  $99C6,$04 Seal the north exit of #ROOM$35.
  $99CA,$03 Check the turn-based event flags.
  $99CD,$02 Arm the explosion countdown.
  $99CF,$05 The complex explodes in #N$15 turns.
N $99D4 Print "#MESSAGE$80EF".
  $99D4,$03 #REGhl=#R$80EF.
  $99D7,$03 Jump to #R$998E.
@ $99DA label=ActionType_Step4
  $99DA,$03 Continue at #R$998B to say the password is wrong.

c $99DD Action: Touch
@ $99DD label=ActionTouch
E $99DD View the equivalent code in;
. #LIST
. { #FOREST$F7C2 }
. LIST#
D $99DD Touch the crystal rod to the plate and open the way south.
  $99DD,$04 Return if the command does not name a single object.
  $99E1,$04 Jump to #R$99F1 when the command names at least #N$02 nouns.
N $99E5 Print "#MESSAGE$642C".
  $99E5,$03 #REGhl=#R$642C.
  $99E8,$02 Jump to #R$99ED.
@ $99EA label=ActionTouch_Loop1
N $99EA Print "#MESSAGE$7D50".
  $99EA,$03 #REGhl=#R$7D50.
  $99ED,$03 Call #R$64E9.
@ $99ED label=ActionTouch_Loop2
  $99F0,$01 Return.
N $99F1 Was the player trying to touch the plate with the crystal rod?
@ $99F1 label=ActionTouch_Step1
  $99F1,$0F Jump to #R$9A2B unless the command matches the phrase at #R$8B34
. (#MESSAGE$6A59 (#N$03)).
  $9A00,$06 Print #MESSAGE$7A59 on the same line.
N $9A06 Print "#MESSAGE$7654".
  $9A06,$03 #REGhl=#R$7654.
  $9A09,$03 Jump to #R$99ED.
@ $9A0C label=ActionTouch_Step2
  $9A0C,$08 Jump back to #R$99EA when #MESSAGE$6BDD (#N$17) is not here or
. being carried.
  $9A14,$06 Move #MESSAGE$6BDD (#N$17) to nowhere (#N$00).
  $9A1A,$06 Move #MESSAGE$6C06 (#N$18) to room #N$17: "#ROOM$17".
N $9A20 This action changes the map:
  $9A20,$05 Open the south exit of #ROOM$17 onto #ROOM$1C.
N $9A25 Print "#MESSAGE$8208".
  $9A25,$03 #REGhl=#R$8208.
  $9A28,$03 Jump to #R$99ED.
@ $9A2B label=ActionTouch_Step3
  $9A2B,$03 Continue at #R$99EA to say it has no effect.

c $9A2E Response: "You Can't"
@ $9A2E label=ResponseYouCanT2
D $9A2E Print "You can't.".
  $9A2E,$04 Return if the command does not name a single object.
  $9A32,$03 Call #R$6487 to say that is not understood.
  $9A35,$01 Return.

c $9A36 Response: "It Has No Apparent Effect"
@ $9A36 label=ResponseItHasNoApparentEffect
D $9A36 Print "It has no apparent effect.".
  $9A36,$04 Return if the command does not name a single object.
  $9A3A,$06 Print #MESSAGE$7D50.
  $9A40,$01 Return.

c $9A41 Action: Use
@ $9A41 label=ActionUse
E $9A41 View the equivalent code in;
. #LIST
. { #HEROES$FB92 }
. LIST#
D $9A41 Use the detonator on the explosives.
  $9A41,$04 Return if the command does not name a single object.
  $9A45,$02 Continue at #R$9A4E to match what the player wants to use.
@ $9A47 label=ActionUse_Loop1
N $9A47 Print "#MESSAGE$7D50".
  $9A47,$03 #REGhl=#R$7D50.
  $9A4A,$03 Call #R$64E9.
@ $9A4A label=ActionUse_Loop2
  $9A4D,$01 Return.
N $9A4E Was the player trying to use the detonator?
@ $9A4E label=ActionUse_Step1
  $9A4E,$08 Jump to #R$9ACA unless the command matches the phrase at #R$8B48.
  $9A56,$03 Fetch the current room.
  $9A59,$04 The detonator is being used from #ROOM$3E.
  $9A5D,$07 Jump to #R$9A6A when the player is carrying #MESSAGE$6A68 (#N$04).
N $9A64 Print "#MESSAGE$8310".
  $9A64,$03 #REGhl=#R$8310.
  $9A67,$03 Jump to #R$9A4A.
@ $9A6A label=ActionUse_Step2
  $9A6A,$07 Jump to #R$9A7B when #MESSAGE$6ACF (#N$0B) is not here or being
. carried.
@ $9A71 label=ActionUse_Step3
  $9A71,$04 Return to Game Over (#R$8DB3) after the message.
N $9A75 Print "#MESSAGE$8237".
  $9A75,$03 #REGhl=#R$8237.
  $9A78,$03 Jump to #R$9A4A.
@ $9A7B label=ActionUse_Step4
  $9A7B,$02 See where #MESSAGE$6ACF has been left.
  $9A7D,$03 Call #R$694F to read the object's location.
  $9A80,$05 The explosives are not lying in #ROOM$19.
  $9A85,$03 Fetch the current room.
  $9A88,$05 The player is not in #ROOM$3F.
  $9A8D,$06 Move #MESSAGE$6ACF (#N$0B) to nowhere (#N$00).
  $9A93,$06 Move #MESSAGE$6C3E (#N$19) to nowhere (#N$00).
  $9A99,$06 Move #MESSAGE$6FF9 (#N$38) to nowhere (#N$00).
  $9A9F,$06 Move #MESSAGE$6C62 (#N$1A) to room #N$19: "#ROOM$19".
N $9AA5 This action changes the map:
  $9AA5,$05 Open the east exit of #ROOM$19 onto #ROOM$1A.
N $9AAA Print "#MESSAGE$8275".
  $9AAA,$03 #REGhl=#R$8275.
  $9AAD,$03 Jump to #R$9A4A.
@ $9AB0 label=ActionUse_Step5
  $9AB0,$02 See where #MESSAGE$6F6C has been left.
  $9AB2,$03 Call #R$694F to read the object's location.
  $9AB5,$04 #MESSAGE$6F6C is in #ROOM$35.
  $9AB9,$03 Send #MESSAGE$6F6C to #ROOM$35.
  $9ABC,$02 Continue at #R$9AC1 to move the alien device.
@ $9ABE label=ActionUse_Step6
  $9ABE,$03 Send #MESSAGE$6F6C to #ROOM$15.
@ $9AC1 label=ActionUse_Step7
  $9AC1,$03 Call #R$65E6 to move the object.
N $9AC4 Print "#MESSAGE$82BD".
  $9AC4,$03 #REGhl=#R$82BD.
  $9AC7,$03 Jump to #R$9A4A.
@ $9ACA label=ActionUse_Step8
  $9ACA,$03 Continue at #R$9A47 to say it has no effect.

b $9ACD Graphics: In Deep Space
@ $9ACD label=Image_InDeepSpace
D $9ACD #PICTURE(In Deep Space,in-deep-space)
D $9ACD Drawn by #R$F813 for In Deep Space.
  $9ACD,$0236,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $9D03 Graphics: In Deep Space Attributes
@ $9D03 label=Image_InDeepSpace_Attributes
D $9D03 Attribute data for #R$9ACD, copied to the attribute file by #R$6535.
  $9D03,$0200,$20

b $9F03 Graphics: In Orbit Around an Unknown Planet
@ $9F03 label=Image_InOrbitAroundAnUnknownPlanet
D $9F03 #PICTURE(In Orbit Around an Unknown
. Planet,in-orbit-around-an-unknown-planet)
D $9F03 Drawn by #R$F81B for In Orbit Around an Unknown Planet.
  $9F03,$0582,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $A485 Graphics: In Orbit Around an Unknown Planet Attributes
@ $A485 label=Image_InOrbitAroundAnUnknownPlanet_Attributes
D $A485 Attribute data for #R$9F03, copied to the attribute file by #R$6535.
  $A485,$0200,$20

b $A685 Graphics: The Limestone Maze
@ $A685 label=Image_TheLimestoneMaze
D $A685 #PICTURE(The Limestone Maze,the-limestone-maze)
D $A685 Drawn by #R$F87F for The Limestone Maze.
  $A685,$09B8,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $B03D Graphics: The Limestone Maze Attributes
@ $B03D label=Image_TheLimestoneMaze_Attributes
D $B03D Attribute data for #R$A685, copied to the attribute file by #R$6535.
  $B03D,$0200,$20

b $B23D Graphics: The Plateau
@ $B23D label=Image_ThePlateau
D $B23D #PICTURE(The Plateau,the-plateau)
D $B23D Drawn by #R$F89F for The Plateau.
  $B23D,$0BBE,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $BDFB Graphics: The Plateau Attributes
@ $BDFB label=Image_ThePlateau_Attributes
D $BDFB Attribute data for #R$B23D, copied to the attribute file by #R$6535.
  $BDFB,$0200,$20

b $BFFB Graphics: The Tall Canyon
@ $BFFB label=Image_TheTallCanyon
D $BFFB #PICTURE(The Tall Canyon,the-tall-canyon)
D $BFFB Drawn by #R$F887 for The Tall Canyon.
  $BFFB,$06EA,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $C6E5 Graphics: The Tall Canyon Attributes
@ $C6E5 label=Image_TheTallCanyon_Attributes
D $C6E5 Attribute data for #R$BFFB, copied to the attribute file by #R$6535.
  $C6E5,$0200,$20

b $C8E5 Graphics: The West Bank of the Lake
@ $C8E5 label=Image_TheWestBankOfTheLake
D $C8E5 #PICTURE(The West Bank of the Lake,the-west-bank-of-the-lake)
D $C8E5 Drawn by #R$F897 for The West Bank of the Lake.
  $C8E5,$073E,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $D023 Graphics: The West Bank of the Lake Attributes
@ $D023 label=Image_TheWestBankOfTheLake_Attributes
D $D023 Attribute data for #R$C8E5, copied to the attribute file by #R$6535.
  $D023,$0200,$20

b $D223 Graphics: The Reactor Room
@ $D223 label=Image_TheReactorRoom
D $D223 #PICTURE(The Reactor Room,the-reactor-room)
D $D223 Drawn by #R$F88F for The Reactor Room.
  $D223,$0624,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $D847 Graphics: The Reactor Room Attributes
@ $D847 label=Image_TheReactorRoom_Attributes
D $D847 Attribute data for #R$D223, copied to the attribute file by #R$6535.
  $D847,$0200,$20

b $DA47 Graphics: The Landing Pad
@ $DA47 label=Image_TheLandingPad
D $DA47 #PICTURE(The Landing Pad,the-landing-pad)
D $DA47 Drawn by #R$F823 for The Landing Pad.
  $DA47,$04F0,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $DF37 Graphics: The Landing Pad Attributes
@ $DF37 label=Image_TheLandingPad_Attributes
D $DF37 Attribute data for #R$DA47, copied to the attribute file by #R$6535.
  $DF37,$0200,$20

b $E137 Graphics: The Repair Bay
@ $E137 label=Image_TheRepairBay
D $E137 #PICTURE(The Repair Bay,the-repair-bay)
D $E137 Drawn by #R$F8A7 for The Repair Bay.
  $E137,$05DA,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $E711 Graphics: The Repair Bay Attributes
@ $E711 label=Image_TheRepairBay_Attributes
D $E711 Attribute data for #R$E137, copied to the attribute file by #R$6535.
  $E711,$0200,$20

b $E911 Graphics: The White Room
@ $E911 label=Image_TheWhiteRoom
D $E911 #PICTURE(The White Room,the-white-room)
D $E911 Drawn by #R$F877 for The White Room. #R$678A finds the current room
. in #R$8CFC and runs its handler from #R$FA68, and the handlers at #R$F82B,
. #R$F838, #R$F845 and #R$F852 reuse this picture for The Yellow, Green, Blue
. and Red Rooms. Each one expands it with #R$6519, then calls #R$F85F with
. its own attribute byte, which paints the whole picture in that colour and
. blanks the cells listed at #R$F785. The Blue Room's #N$28 is cyan paper.
D $E911 #PICTURE(The Yellow Room,the-yellow-room,$30)
D $E911 #PICTURE(The Green Room,the-green-room,$20)
D $E911 #PICTURE(The Blue Room,the-blue-room,$28)
D $E911 #PICTURE(The Red Room,the-red-room,$50)
  $E911,$0C74,$02 Pixel data: (offset,byte) pairs read by #R$6519: each pair
. writes a pixel
. byte at offset #REGl in the current display-file block; #N($00),#N$00 ends
. that pass.

b $F585 Graphics: The White Room Attributes
@ $F585 label=Image_TheWhiteRoom_Attributes
D $F585 Attribute data for #R$E911, copied to the attribute file by #R$6535.
. Only The White Room shows these attributes; The Yellow, Green, Blue and Red
. Rooms repaint over them with #R$F85F.
  $F585,$0200,$20

g $F785 Table: Attribute Addresses
@ $F785 label=Table_AttributeAddresses
D $F785 Used by the routine at #R$F85F.
D $F785 Attribute-file addresses that #R$F85F blanks after it paints a
. recoloured copy of #R$E911. #N$47 words.
W $F785,$02 Attribute address #N(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $F785,$02,$47

c $F813 Handler: Room Images
@ $F813 label=DisplayImage_InDeepSpace
E $F813 View the equivalent code in;
. #LIST
. { #FOREST$FACF }
. { #HEROES$FDAB }
. { #JEWELS$FEFA }
. { #WARLORD$FF12 }
. LIST#
D $F813 Draw the location pictures. Each entry loads a graphic pointer and
. either draws it directly or expands and tints the shared room picture.
N $F813 Displays the image for in deep space.
N $F813 #PUSHS #UDGTABLE #POKES$6223,$02
. { #SIM(start=#PC,stop=$F81A)#SCR$01(game-in-deep-space) }
. UDGTABLE# #POPS
  $F813,$04 #REGix=#R$9ACD.
  $F817,$03 Call #R$6541 to draw the room picture.
  $F81A,$01 Return.
@ $F81B label=DisplayImage_InOrbit
N $F81B Displays the image for in orbit around an unknown planet.
N $F81B #PUSHS #UDGTABLE #POKES$6223,$03
. { #SIM(start=#PC,stop=$F822)#SCR$01(game-in-orbit) }
. UDGTABLE# #POPS
  $F81B,$04 #REGix=#R$9F03.
  $F81F,$03 Call #R$6541 to draw the room picture.
  $F822,$01 Return.
@ $F823 label=DisplayImage_LandingPad
N $F823 Displays the image for the landing pad.
N $F823 #PUSHS #UDGTABLE #POKES$6223,$05
. { #SIM(start=#PC,stop=$F82A)#SCR$01(game-landing-pad) }
. UDGTABLE# #POPS
  $F823,$04 #REGix=#R$DA47.
  $F827,$03 Call #R$6541 to draw the room picture.
  $F82A,$01 Return.
@ $F82B label=DisplayImage_YellowRoom
N $F82B Displays the image for the yellow room.
N $F82B #PUSHS #UDGTABLE #POKES$6223,$08
. { #SIM(start=#PC,stop=$F837)#SCR$01(game-yellow-room) }
. UDGTABLE# #POPS
  $F82B,$04 #REGix=#R$E911.
  $F82F,$03 Call #R$6519 to expand the room picture.
  $F832,$02 Tint that picture yellow (#N$30).
  $F834,$03 Call #R$F85F to recolour the picture.
  $F837,$01 Return.
@ $F838 label=DisplayImage_GreenRoom
N $F838 Displays the image for the green room.
N $F838 #PUSHS #UDGTABLE #POKES$6223,$0B
. { #SIM(start=#PC,stop=$F844)#SCR$01(game-green-room) }
. UDGTABLE# #POPS
  $F838,$04 #REGix=#R$E911.
  $F83C,$03 Call #R$6519 to expand the room picture.
  $F83F,$02 Tint that picture green (#N$20).
  $F841,$03 Call #R$F85F to recolour the picture.
  $F844,$01 Return.
@ $F845 label=DisplayImage_BlueRoom
N $F845 Displays the image for the blue room.
N $F845 #PUSHS #UDGTABLE #POKES$6223,$13
. { #SIM(start=#PC,stop=$F851)#SCR$01(game-blue-room) }
. UDGTABLE# #POPS
  $F845,$04 #REGix=#R$E911.
  $F849,$03 Call #R$6519 to expand the room picture.
  $F84C,$02 Tint that picture cyan (#N$28), the colour the game calls blue.
  $F84E,$03 Call #R$F85F to recolour the picture.
  $F851,$01 Return.
@ $F852 label=DisplayImage_RedRoom
N $F852 Displays the image for the red room.
N $F852 #PUSHS #UDGTABLE #POKES$6223,$14
. { #SIM(start=#PC,stop=$F85E)#SCR$01(game-red-room) }
. UDGTABLE# #POPS
  $F852,$04 #REGix=#R$E911.
  $F856,$03 Call #R$6519 to expand the room picture.
  $F859,$02 Tint that picture red (#N$50).
  $F85B,$03 Call #R$F85F to recolour the picture.
  $F85E,$01 Return.
N $F85F Paint the whole picture with the attribute in #REGa first
. (#R$6548), then blank the #N$47 attribute cells listed at #R$F785.
@ $F85F label=RecolourRoomImage
R $F85F I:A Attribute byte
  $F85F,$03 Call #R$6548 to paint every picture attribute with #REGa.
  $F862,$07 Point at #R$F785 and prepare to blank its
. #N$47 attribute cells (black ink on black paper).
@ $F869 label=RecolourRoomImage_Loop
  $F869,$0D Blank every attribute address in that list.
  $F876,$01 Return.
@ $F877 label=DisplayImage_WhiteRoom
N $F877 Displays the image for the white room.
N $F877 #PUSHS #UDGTABLE #POKES$6223,$16
. { #SIM(start=#PC,stop=$F87E)#SCR$01(game-white-room) }
. UDGTABLE# #POPS
  $F877,$04 #REGix=#R$E911.
  $F87B,$03 Call #R$6541 to draw the room picture.
  $F87E,$01 Return.
@ $F87F label=DisplayImage_LimestoneMaze
N $F87F Displays the image for the limestone maze.
N $F87F #PUSHS #UDGTABLE #POKES$6223,$1F
. { #SIM(start=#PC,stop=$F886)#SCR$01(game-limestone-maze) }
. UDGTABLE# #POPS
  $F87F,$04 #REGix=#R$A685.
  $F883,$03 Call #R$6541 to draw the room picture.
  $F886,$01 Return.
@ $F887 label=DisplayImage_TallCanyon
N $F887 Displays the image for the tall canyon.
N $F887 #PUSHS #UDGTABLE #POKES$6223,$2D
. { #SIM(start=#PC,stop=$F88E)#SCR$01(game-tall-canyon) }
. UDGTABLE# #POPS
  $F887,$04 #REGix=#R$BFFB.
  $F88B,$03 Call #R$6541 to draw the room picture.
  $F88E,$01 Return.
@ $F88F label=DisplayImage_ReactorRoom
N $F88F Displays the image for the reactor room.
N $F88F #PUSHS #UDGTABLE #POKES$6223,$36
. { #SIM(start=#PC,stop=$F896)#SCR$01(game-reactor-room) }
. UDGTABLE# #POPS
  $F88F,$04 #REGix=#R$D223.
  $F893,$03 Call #R$6541 to draw the room picture.
  $F896,$01 Return.
@ $F897 label=DisplayImage_WestBankOfTheLake
N $F897 Displays the image for the west bank of the lake.
N $F897 #PUSHS #UDGTABLE #POKES$6223,$37
. { #SIM(start=#PC,stop=$F89E)#SCR$01(game-west-bank-of-the-lake) }
. UDGTABLE# #POPS
  $F897,$04 #REGix=#R$C8E5.
  $F89B,$03 Call #R$6541 to draw the room picture.
  $F89E,$01 Return.
@ $F89F label=DisplayImage_Plateau
N $F89F Displays the image for the plateau.
N $F89F #PUSHS #UDGTABLE #POKES$6223,$3B
. { #SIM(start=#PC,stop=$F8A6)#SCR$01(game-plateau) }
. UDGTABLE# #POPS
  $F89F,$04 #REGix=#R$B23D.
  $F8A3,$03 Call #R$6541 to draw the room picture.
  $F8A6,$01 Return.
@ $F8A7 label=DisplayImage_RepairBay
N $F8A7 Displays the image for the repair bay.
N $F8A7 #PUSHS #UDGTABLE #POKES$6223,$3C
. { #SIM(start=#PC,stop=$F8AE)#SCR$01(game-repair-bay) }
. UDGTABLE# #POPS
  $F8A7,$04 #REGix=#R$E137.
  $F8AB,$03 Call #R$6541 to draw the room picture.
  $F8AE,$01 Return.

c $F8AF Game Start
@ $F8AF label=GameStart
E $F8AF View the equivalent code in;
. #LIST
. { #SHOCK$ADA1 }
. { #FOREST$F964 }
. { #HEROES$FBA9 }
. { #JEWELS$FD82 }
. { #WARLORD$FCCE }
. LIST#
D $F8AF Initialise the game state and enter the game loop at room #N$02:
. "#ROOM$02".
  $F8AF,$03 The keyboard flags are #SKOOLKID$5C6A(FLAGS2).
  $F8B2,$02 Turn CAPS LOCK on.
N $F8B4 These exit bytes start closed and are opened by the plot.
  $F8B4,$0A Seal the down exit of #ROOM$13, south from #ROOM$17 and
. east from #ROOM$19.
  $F8BE,$06 Seal the east and up exits of #ROOM$1D.
  $F8C4,$09 Seal the down exit of #ROOM$2B, west from #ROOM$30 and
. east from #ROOM$33.
  $F8CD,$05 Restore the north exit of #ROOM$35 to #ROOM$34.
  $F8D2,$05 Restore the south exit of #ROOM$05 to room #N$06: "#ROOM$06".
  $F8D7,$03 The default game state is stored at #R$F8EA.
  $F8DA,$03 The workspace begins with the object locations.
  $F8DD,$03 The initial game state is #N$0135 bytes.
  $F8E0,$02 Copy the default state into the workspace.
  $F8E2,$05 Move the player to room #N$02: "#ROOM$02".
  $F8E7,$03 Jump to #R$8D2A to read the next command.

g $F8EA Default Game State
@ $F8EA label=DefaultGameState
D $F8EA The starting values for the game status buffer. #R$F8AF copies all
. #N$0135 bytes over #R$61AB at the start of every game, so the layout is the
. same as the entries from #R$61AB to #R$62DE.
N $F8EA Starting places for the items (#R$61AB).
@ $F8EA label=Default_Table_ItemLocations
B $F8EA,$01 Item #N(#PC-$F8EA) #ITEM(#PC-$F8EA): room #N(#PEEK(#PC)),
. #ROOM(#PEEK(#PC)).
L $F8EA,$01,$41

u $F92B
S $F92B,$23

g $F94E Flags: Display State
@ $F94E label=Default_Flag_DisplayState
D $F94E Copied to #R$620F. Bit 0 is clear at the start of every game.
B $F94E,$01

u $F94F
S $F94F,$03

g $F952 Table: Already Seen Room Images
@ $F952 label=Default_Table_RoomImagesAlreadySeen
D $F952 Copied to #R$6213. No room picture has been shown yet.
B $F952,b,$01
B $F953,b,$01
B $F954,b,$01
B $F955,b,$01

u $F956
S $F956,$02

g $F958 Flags: Turn-Based Event States
@ $F958 label=Default_Flag_TurnBasedEventState
D $F958 Copied to #R$6219. No turn-based event has started.
B $F958,$01

g $F959 Turn-Based Event Counters
@ $F959 label=Default_Counter_Unused_0
@ $F95A label=Default_Counter_Unused_1
@ $F95B label=Default_Counter_Unused_2
@ $F95C label=Default_Counter_Unused_3
@ $F95D label=Default_Counter_Unused_4
@ $F95E label=Default_Counter_Unused_5
@ $F95F label=Default_Counter_Unused_6
@ $F960 label=Default_Counter_Unused_7
D $F959 Copied to #R$621A. One countdown per bit of *#R$6219.
B $F959,$08,$01

g $F961 Flags: Scenic Event States
@ $F961 label=Default_Flag_ScenicEventState
D $F961 Copied to #R$6222. No scenic event is armed yet.
B $F961,$01

g $F962 Current Room ID
@ $F962 label=Default_CurrentRoom
D $F962 Copied to #R$6223. The player starts in room #N(#PEEK(#PC)).
B $F962,$01

g $F963 Table: Scenic Event Locations
@ $F963 label=Default_Table_ScenicEventLocations
D $F963 Copied to #R$6224. Where each of the #N$08 scenic events starts.
B $F963,$01 Event #N(#PC-$F963) room #N(#PEEK(#PC)).
L $F963,$01,$08

g $F96B Number Of Items In The Players Inventory
@ $F96B label=Default_Count_InventoryItems
D $F96B Copied to #R$622C. The player starts holding #N(#PEEK(#PC)) item(s).
B $F96B,$01

g $F96C Load/ Save Buffer
@ $F96C label=Default_LoadSaveBuffer
D $F96C Copied to #R$622D. Initial bytes for the saved-location pointers.
B $F96C,$32,$08

g $F99E Command Buffer
@ $F99E label=Default_CommandBuffer
D $F99E Copied to #R$625F. Cleared again when a command is typed.
B $F99E,$32

g $F9D0 User Input: Word Tokens
@ $F9D0 label=Default_UserInput_Token_1
@ $F9D1 label=Default_UserInput_Token_2
D $F9D0 Copied to #R$6291. Filled with #N$FF until a command is parsed.
B $F9D0,$01
B $F9D1,$09,$09

g $F9DA Line Number
@ $F9DA label=Default_LineNumber
D $F9DA Copied to #R$629B. Initial text/picture row #N(#PEEK(#PC)).
B $F9DA,$01

g $F9DB Pointer: Vocabulary Table
@ $F9DB label=Default_Pointer_Vocabulary
D $F9DB Copied to #R$629C. Points at the vocabulary table.
W $F9DB,$02

g $F9DD Four Letter Buffer
@ $F9DD label=Default_FourLetterBuffer
D $F9DD Copied to #R$629E. Cleared again when a word is matched.
B $F9DD,$04

g $F9E1 Table: Turn-Based Event Handlers
@ $F9E1 label=Default_Table_TurnBasedEventHandlers
D $F9E1 Copied to #R$62A2. Handler addresses for each turn-based event bit.
W $F9E1,$02 Event #N((#PC-$F9E1)/$02).
L $F9E1,$02,$08

g $F9F1 Table: Scenic Event Message Lists
@ $F9F1 label=Default_Table_ScenicEventMessageLists
D $F9F1 Copied to #R$62B2. Message-list pointers for each scenic event.
W $F9F1,$02 Event #N((#PC-$F9F1)/$02).
L $F9F1,$02,$08

g $FA01 Pointer: Room Map Table
@ $FA01 label=Default_Pointer_RoomMap
D $FA01 Copied to #R$62C2.
W $FA01,$02

g $FA03 Number Of Objects
@ $FA03 label=Default_Count_Objects
D $FA03 Copied to #R$62C4.
W $FA03,$02

g $FA05 Pointer: Item Description Table
@ $FA05 label=Default_Pointer_ItemDescriptions
D $FA05 Copied to #R$62C6.
W $FA05,$02

g $FA07 Number Of Nouns
@ $FA07 label=Default_Count_Nouns
D $FA07 Copied to #R$62C8.
W $FA07,$02

g $FA09 Number Of Rooms With Images
@ $FA09 label=Default_Count_RoomsWithImages
D $FA09 Copied to #R$62CA.
W $FA09,$02

g $FA0B Pointer: Rooms With Images Table
@ $FA0B label=Default_Pointer_RoomsWithImages
D $FA0B Copied to #R$62CC.
W $FA0B,$02

g $FA0D Pointer: Room Image Jump Table
@ $FA0D label=Default_Pointer_RoomImage
D $FA0D Copied to #R$62CE.
W $FA0D,$02

g $FA0F Pointer: Room Description Table
@ $FA0F label=Default_Pointer_RoomDescriptions
D $FA0F Copied to #R$62D0.
W $FA0F,$02

g $FA11 Pointer: Object Noun Phrases
@ $FA11 label=Default_Pointer_ObjectNounPhrases
D $FA11 Copied to #R$62D2.
W $FA11,$02

g $FA13 Pointer: Object List Table
@ $FA13 label=Default_Pointer_ObjectList
D $FA13 Copied to #R$62D4.
W $FA13,$02

g $FA15 Pointer: Noun Tokens Table
@ $FA15 label=Default_Pointer_NounTokens
D $FA15 Copied to #R$62D6.
W $FA15,$02

g $FA17 Pointer: Verbs Jump Table
@ $FA17 label=Default_Pointer_JumpTable_Verbs
D $FA17 Copied to #R$62D8.
W $FA17,$02

g $FA19 Number Of Verb Tokens
@ $FA19 label=Default_Count_VerbTokens
D $FA19 Copied to #R$62DA.
W $FA19,$02

g $FA1B Number Of Saved Locations
@ $FA1B label=Default_Count_SavedLocations
D $FA1B Copied to #R$62DC.
W $FA1B,$02

g $FA1D Pointer: Saved Location Table
@ $FA1D label=Default_Pointer_SavedLocations
D $FA1D Copied to #R$62DE.
W $FA1D,$02

u $FA1F
S $FA1F,$01

g $FA20 Jump Table: Verbs
@ $FA20 label=JumpTable_Verbs
E $FA20 View the equivalent code in;
. #LIST
. { #FOREST$FB0D }
. { #HEROES$FD63 }
. { #JEWELS$FF3A }
. { #WARLORD$FE89 }
. LIST#
D $FA20 Verb routines in the same order as the search list at #R$891C.
. Used by #R$8D85.
W $FA20,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FA20,$02,$24

g $FA68 Jump Table: Room Images
@ $FA68 label=JumpTable_RoomImages
E $FA68 View the equivalent code in;
. #LIST
. { #FOREST$FB75 }
. { #HEROES$FDEB }
. { #JEWELS$FFA8 }
. { #WARLORD$FEFC }
. LIST#
D $FA68 Handlers that draw the location pictures, in the same order
. as the room list at #R$8CFC.
D $FA68 Used by the routine at #R$678A through the pointer at #R$62CE,
. set from #R$F8EA.
W $FA68,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FA68,$02,$1A

u $FA9C
S $FA9C,$4BC

b $FF58 Font Fragment
@ $FF58 label=FontFragment
D $FF58 The tail of a character set left in high memory by the loader.
B $FF58,$01
L $FF58,$01,$08
L $FF58,$08,$15
