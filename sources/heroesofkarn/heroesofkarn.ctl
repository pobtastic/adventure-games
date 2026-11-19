; Copyright Interceptor Software UK 1984, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g.
; Print_HighScore_Loop.

> $4000 @start
> $4000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
@ $4000 org=$4000
> $4000 @rom
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @expand=#DEF(#MESSAGE(addr) #STR$addr,$08($b==$FF))
> $4000 @expand=#DEF(#INK(id) #LET(bright=$id&$40)#HTML(&#10;)#LET(flash=$id&$80)#HTML(&#10;)#LET(ink=$id&$07)#IF({ink}>=$00)(#HTML(&#10;)#MAP({ink})(#HTML(&#10;)UNKNOWN,0:BLACK,1:BLUE,2:RED,3:MAGENTA,4:GREEN,5:CYAN,6:YELLOW,7:WHITE))#IF({bright}>$00)( (BRIGHT))#IF({flash}>$00)( (FLASH: ON)))
> $4000 @expand=#IF({asm})(#DEF(#ANDROMEDA(addr)(link=Message From Andromeda)$link))
> $4000 @expand=#IF({asm})(#DEF(#FOREST(addr)(link=Forest At Worlds End)$link))
> $4000 @expand=#IF({asm})(#DEF(#JEWELS(addr)(link=The Jewels Of Babylon)$link))
> $4000 @expand=#IF({asm})(#DEF(#SHOCK(addr)(link=After Shock)$link))
> $4000 @expand=#IF({asm})(#DEF(#WARLORD(addr)(link=Warlord)$link))
> $4000 @set-handle-unsupported-macros=1

> $4000 @expand=#DEF(#ROOM(id) #IF($01<$id<=$41)(#HTML(&#10;)#SIM(start=$B3F1,stop=$B3FF,ix=$CE66,de=$id)#HTML(&#10;)#R({sim[HL]})(#MAP({sim[HL]})(#HTML(&#10;)UNKNOWN,49016:Inside the Ruined Cottage,49043:In the Field,49089:The Open Moorland,49138:High on the Moors,49218:The Dead Marshes,49322:The Narrow Path,49363:The Valley,49461:The Gates of Karn,49560:The Deserted Village,49608:The Plain of Stones,49662:The Gypsy Camp,49720:Pilgrims' Hill,49822:The Monastery,49931:The Wizard's Chamber,49953:The Sand Room,49968:The Hall of Gold,50023:Within the Long Barrow,50090:At the Edge of the Sea,50135:The Hall of the Mountain King,50166:The King's Anteroom,50187:The Hall of Wisdom,50207:The Star Chamber,50276:The Bird Chamber,50330:The Vast Hall,50377:The Sword Room,50393:The Gatehouse,50432:The King's Chamber,50498:The Falcon Chamber,50518:The King's Stairway,50584:The Crystal Room,50602:The Debris Room,50619:The Stair Room,50702:The Hall of Music,50721:The Hall of Infinity,50799:The Lair of the Hydra,50822:The Star Cavern,50889:The Hall of Smoke,50966:The Oil Room,50980:The Acid Room,50995:The Treasury,51009:The Crypt,51077:The Hall of the Black Knight,51159:The Hall of Jade,51242:The Ice Cavern,51258:The Cascade Cavern,51278:The Volcano Cavern,51298:The Hall of the Four Winds,51376:The Dragon's Lair,51395:The Toolroom,51409:The Torture Chamber,51483:The Pirate's Lair,51502:The Sand Cavern,51519:The Hall of Fire,51581:The Hall of the Phoenix,51606:The Steam Cavern,51689:The Limestone Cavern,51711:The Dungeon,51749:The Cellar,51761:The Sandy Beach,51778:The Sea Cavern,51794:The Plant Room,51850:The Hall of Black Magic,51875:The Bat Cavern,51891:The Hall of Stairs)),#HTML(&#10;)N/A))

> $4000 @expand=#DEF(#ITEM(id) #MAP($id)(#HTML(&#10;)N/A,000:"Beren#RAW(,)the King.",001:"Istar#RAW(,)the wizard.",002:"Haldir#RAW(,)the minstrel.",003:"Khadim#RAW(,)the dwarf.",004:"A tinderbox.",005:"A frog.",006:"A swamp lizard.",007:"A bear.",008:"A sleeping bear.",009:"Copper gates#RAW(,)to the South.",010:"The gates are open.",011:"The gates are closed.",012:"Copper gates#RAW(,)to the North.",013:"The gates are open.",014:"The gates are closed.",015:"Jewelled gates#RAW(,)to the East.",016:"The gates are open.",017:"The gates are closed.",018:"Jewelled gates#RAW(,)to the West.",019:"The gates are open.",020:"The gates are closed.",021:"Golden gates#RAW(,)to the South.",022:"The gates are open.",023:"The gates are closed.",024:"Golden gates#RAW(,)to the North.",025:"The gates are open.",026:"The gates are closed.",027:"Golden gates#RAW(,)to the South.",028:"The gates are open.",029:"The gates are closed.",030:"Golden gates#RAW(,)to the North.",031:"The gates are open.",032:"The gates are closed.",033:"Some money.",034:"A barrowight.",035:"A bible.",036:"A wand.",037:"A scroll.",038:"A silver flute.",039:"A carpet.",040:"A jewelled key.",041:"A spirit.",042:"A songbird.",043:"A songbird in a wicker cage.",044:"A balrog.",045:"A crystal bridge over the chasm.",046:"A crystal bridge over the chasm.",047:"A sword.",048:"A spear.",049:"A dagger.",050:"A velvet pillow.",054:"A falcon.",055:"A bottle.",056:"A bottle of water.",057:"A bottle of acid.",058:"A bottle of oil.",059:"A broken bottle.",060:"A serpent.",061:"A dead serpent.",062:"Istar#RAW(,)held behind crystal bars.",069:"A golden lyre.",070:"A mandolin.",071:"A gold key.",072:"A hydra.",073:"A dead hydra.",074:"A ruby.",075:"A pool of oil.",076:"A pool of acid.",077:"A diamond.",078:"A venomous spider.",079:"A sleeping spider.",080:"A rusty#RAW(,)iron chest.",081:"A chest with oiled hinges.",082:"An open chest.",083:"A coffin.",084:"An open coffin.",085:"A vampire.",086:"The Black Knight.",087:"The body of the Black Knight.",088:"A jade flower.",089:"Some jade fragments.",090:"A waterfall.",091:"A wooden box.",092:"A sapphire.",093:"A dragon.",094:"A dead dragon.",095:"A crowbar.",096:"A shovel.",097:"A map.",098:"A pirate.",099:"A dead pirate.",100:"A wicker cage.",101:"A silver coin.",102:"Firegates lay North#RAW(,)East & West.",103:"A firegate to the South.",104:"A firegate to the East.",105:"A firegate to the West.",106:"A black potion.",107:"A white potion.",108:"A copper key.",109:"The guard#RAW(,)looking at you through the bars.",110:"The door is closed.",111:"The door is open.",112:"Some honey.",113:"Some meat.",114:"An emerald.",115:"A giant clam#RAW(,)tightly closed.",116:"An open clam.",117:"A pearl.",118:"A tiny plant.",119:"A plant#RAW(,)6 feet in height.",120:"A massive beanstalk.",121:"A witch.",122:"A dead witch.",123:"A silver cross.",124:"A giant bat.",125:"A dead bat.",126:"A magic mirror.",127:"Anton#RAW(,)the Gypsy King. He says #HTML(&#34;)Find me a magic mirror and I will tell your fortune.#HTML(&#34;)",128:"Anton#RAW(,)the Gypsy King. He says #HTML(&#34;)Cross my palm with silver.#HTML(&#34;)",129:"Some hot ashes.",130:"A phoenix.",131:"A jade flower#RAW(,)resting on a velvet pillow.",133:"The top of a giant beanstalk."))
> $4000 @expand=#DEF(#OBJECT(id) #MAP($id)(#HTML(&#10;)N/A,00:"a ruby",01:"a diamond",02:"a flower",03:"a sapphire",04:"an emerald",05:"a pearl",06:"a tinderbox",07:"a frog",08:"any money",09:"a bible",10:"a wand",11:"a scroll",12:"a flute",13:"a carpet",14:"a key",15:"a songbird",16:"a sword",17:"a spear",18:"a dagger",19:"a pillow",20:"a falcon",21:"a bottle",22:"any water",23:"any acid",24:"any oil",25:"a lyre",26:"a mandolin",27:"any fragments",28:"a box",29:"a crowbar",30:"a shovel",31:"a map",32:"a cage",33:"a coin",34:"any honey",35:"any meat",36:"a cross",37:"a mirror",38:"a lizard",39:"a bear",40:"any gates",41:"a barrowight",42:"a spirit",43:"a balrog",44:"a star",45:"a serpent",46:"any stairs",47:"any bars",48:"a hydra",49:"a spider",50:"a chest",51:"a coffin",52:"a vampire",53:"the Knight",54:"a dragon",55:"a pirate",56:"any fire",57:"a potion",58:"a guard",59:"a door",60:"a clam",61:"a plant",62:"a witch",63:"a bat",64:"Anton",65:"Beren",66:"Istar",67:"Haldir",68:"Khadim",69:"a phoenix",70:"any ashes",71:"any gas"))
> $4000 @expand=#DEF(#TOKEN(id) #MAP($id)(#HTML(&#10;)UNKNOWN,000:"H#RAW(,)HELP",001:"I#RAW(,)INVE",002:"L#RAW(,)LOOK",003:"SCOR",004:"EXAM",005:"LOAD",006:"SAVE",007:"QUIT",008:"N#RAW(,)NORT",009:"S#RAW(,)SOUT",010:"E#RAW(,)EAST",011:"W#RAW(,)WEST",012:"U#RAW(,)UP",013:"D#RAW(,)DOWN",014:"TAKE#RAW(,)GET",015:"DROP#RAW(,)THRO",016:"GIVE",017:"KISS",018:"OPEN",019:"CLOS",020:"READ",021:"WAVE",022:"PLAY",023:"KILL#RAW(,)ATTA",024:"OIL",025:"WATE",026:"DRIN",027:"DIG",028:"FUCK#RAW(,)SCRE#RAW(,)RAPE",029:"BERE",030:"ISTA",031:"HALD",032:"KHAD",033:"LIGH",034:"ORIO",035:"EMPT",036:"xxxx",037:"xxxx",038:"xxxx",039:"RUBY",040:"DIAM",041:"FLOW",042:"SAPP",043:"EMER",044:"PEAR",045:"TIND",046:"FROG",047:"MONE",048:"BIBL",049:"WAND",050:"SCRO",051:"FLUT",052:"CARP",053:"KEY",054:"SONG#RAW(,)BIRD",055:"SWOR",056:"SPEA",057:"DAGG",058:"PILL",059:"FALC",060:"BOTT",061:"ACID",062:"LYRE",063:"MAND",064:"FRAG",065:"BOX",066:"CROW",067:"SHOV",068:"MAP",069:"CAGE",070:"COIN",071:"HONE",072:"MEAT",073:"CROS",074:"MIRR",075:"LIZA",076:"BEAR",077:"GATE",078:"BARR",079:"SPIR",080:"BALR",081:"STAR",082:"SERP",083:"STAI",084:"BARS",085:"HYDR",086:"SPID",087:"CHES#RAW(,)HING",088:"COFF",089:"VAMP",090:"KNIG",091:"DRAG",092:"PIRA",093:"FIRE",094:"POTI",095:"GUAR",096:"DOOR",097:"CLAM",098:"PLAN#RAW(,)BEAN",099:"WITC",100:"BAT",101:"ANTO",102:"PHOE",103:"ASHE",104:"GAS",105:"xxxx",106:"xxxx",107:"xxxx",108:"xxxx",109:"TO#RAW(,)AT",110:"WITH#RAW(,)USIN",111:"GIAN",112:"SWAM",113:"WOOD",114:"JADE",115:"SILV",116:"GOLD",117:"JEWE",118:"WHIT",119:"BLAC",120:"MAGI",121:"RUST",122:"IRON",123:"COPP",124:"VELV",125:"WICK",126:"MARS",253:Separator,254:Terminator))

b $4000 Loading Screen
@ $4000 label=Loading
D $4000 #UDGTABLE
. { =h Heroes of Karn Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B00 Tape Loader
@ $5B00 label=TapeLoader
E $5B00 View the equivalent code in;
. #LIST
. { #FOREST$5B00 }
. { #JEWELS$5B00 }
. { #ANDROMEDA$5CD0 }
. { #WARLORD$5B00 }
. LIST#
D $5B00 Load the screen, the room pictures and the game. The last block falls
. straight into the tape loading routine.
N $5B00 Load the first block: the loading screen.
  $5B00,$0C Load #N$1B00 bytes of the loading screen to #N$4000 with
. flag byte #N$D7.
N $5B0C Load the second block: the room pictures.
  $5B0C,$0C Load #N$4A2C bytes of picture data to #R$61A8 with flag
. byte #N$0A.
N $5B18 Load the third block: the game. Execution falls into #R$5B21.
  $5B18,$09 Load #N$5235 bytes of the game to #R$ABD4 with flag byte
. #N$2B.
N $5B21 Tape loading routine.
@ $5B21 label=TapeLoading
  $5B21,$01 Set the carry flag to indicate "loading".
  $5B22,$01 This resets the Z flag (#REGd cannot hold +#N$FF.)
  $5B23,$01 The #REGa register holds +#N$00 for a header and +#N$FF for a
. block of data. The carry flag is reset for verifying and set for
. loading.
  $5B24,$01 Put back #REGd to its original value.
  $5B25,$01 Disable interrupts while the tape loads, as the start of
. #SKOOLKID$0556(LD_BYTES) would.
  $5B26,$04 Set the border to #INK$0F.
  $5B2A,$03 Call #SKOOLKID$0556,$0562(LD_BYTES) at #N$0562.
  $5B2D,$01 Remember whether the block loaded.
  $5B2E,$03 #REGa=*#SKOOLKID$5C48(BORDCR).
  $5B31,$02,b$01 Keep the border colour (bits 3-5 of
. *#SKOOLKID$5C48(BORDCR)).
  $5B33,$06 Move the border colour into the low three bits.
  $5B39,$02 Set border to the colour held by #REGa.
  $5B3B,$05 See whether SPACE is pressed.
  $5B40,$01 Re-enable interrupts, as the ROM does when its own load ends.
  $5B41,$03 Jump to #SKOOLKID$0000(START) if the carry flag is not set.
  $5B44,$01 Restore the load result from the stack (the carry flag is
. set when the block loaded).
  $5B45,$01 Return if the carry flag is set.
  $5B46,$06 Write *#SKOOLKID$5C53(PROG) to *#SKOOLKID$5C4B(VARS).
  $5B4C,$02 Write #N$80 to *#SKOOLKID$5C53(PROG).
  $5B4E,$01 Call #SKOOLKID$0008(ERROR_1).

u $5B4F
S $5B4F,$B1

i $5C00
S $5C00,$5A8

b $61A8 Graphics: The Field
@ $61A8 label=Image_TheField
D $61A8 #PUSHS
. #UDGTABLE
. { =h The Field }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-field) }
. UDGTABLE#
. #POPS
  $61A8,$098F

b $6B37 Graphics: The Monastery
@ $6B37 label=Image_TheMonastery
D $6B37 #PUSHS
. #UDGTABLE
. { =h The Monastery }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-monastery) }
. UDGTABLE#
. #POPS
  $6B37,$07DC

b $7313 Graphics: The King's Chamber
@ $7313 label=Image_TheKingsChamber
D $7313 #PUSHS
. #UDGTABLE
. { =h The King's Chamber }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-kings-chamber) }
. UDGTABLE#
. #POPS
  $7313,$06E1

b $79F4 Graphics: The Oil Room
@ $79F4 label=Image_TheOilRoom
D $79F4 #PUSHS
. #UDGTABLE
. { =h The Oil Room }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-oil-room) }
. UDGTABLE#
. #POPS
. The Acid Room shares this picture.
  $79F4,$0850

b $8244 Graphics: The Sea Cavern
@ $8244 label=Image_TheSeaCavern
D $8244 #PUSHS
. #UDGTABLE
. { =h The Sea Cavern }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-sea-cavern) }
. UDGTABLE#
. #POPS
  $8244,$06FD

b $8941 Graphics: The Long Barrow
@ $8941 label=Image_TheLongBarrow
D $8941 #PUSHS
. #UDGTABLE
. { =h The Long Barrow }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-long-barrow) }
. UDGTABLE#
. #POPS
  $8941,$0810

b $9151 Graphics: The Hall Of The Black Knight
@ $9151 label=Image_TheHallOfTheBlackKnight
D $9151 #PUSHS
. #UDGTABLE
. { =h The Hall Of The Black Knight }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-hall-of-the-black-knight) }
. UDGTABLE#
. #POPS
  $9151,$0A45

b $9B96 Graphics: The Treasury
@ $9B96 label=Image_TheTreasury
D $9B96 #PUSHS
. #UDGTABLE
. { =h The Treasury }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-treasury) }
. UDGTABLE#
. #POPS
  $9B96,$07BB

b $A351 Graphics: The Edge Of The Sea
@ $A351 label=Image_TheEdgeOfTheSea
D $A351 #PUSHS
. #UDGTABLE
. { =h The Edge Of The Sea }
. { #SIM(start=$AD60,stop=$AD66,ix=#PC)#SCR$02{$00,$00,$200,$100}(the-edge-of-the-sea) }
. UDGTABLE#
. #POPS
  $A351,$0883

c $ABD4 Game Entry Point
@ $ABD4 label=GameEntryPoint
E $ABD4 View the equivalent code in;
. #LIST
. { #SHOCK$9DD7 }
. { #FOREST$B9C5 }
. { #JEWELS$BA50 }
. { #ANDROMEDA$61A8 }
. { #WARLORD$A531 }
. LIST#
D $ABD4 Turn caps lock on, set the screen line, and enter the cold start.
  $ABD4,$03 Point #REGhl at *#SKOOLKID$5C6A(FLAGS2).
  $ABD7,$02 Turn caps lock on.
  $ABD9,$05 Set the screen line to #N$18.
  $ABDE,$03 Continue at #R$B800.

c $ABE1 Get User Input
@ $ABE1 label=GetUserInput
E $ABE1 View the equivalent code in;
. #LIST
. { #SHOCK$9DFB }
. { #FOREST$BDDA }
. { #JEWELS$BA5D }
. { #ANDROMEDA$6495 }
. { #WARLORD$A53E }
. LIST#
D $ABE1 Wait until the player presses a key, then return that key.
R $ABE1 O:A The keypress value
  $ABE1,$03 #REGa=*#SKOOLKID$5C3B(FLAGS).
  $ABE4,$04 Jump back to #R$ABE1 until a new key is pressed.
  $ABE8,$02 Reset the "new key has been pressed" flag in #REGa.
  $ABEA,$03 Write it back to *#SKOOLKID$5C3B(FLAGS).
N $ABED Fetch the keypress.
  $ABED,$03 #REGa=*#SKOOLKID$5C08(LAST_K).
  $ABF0,$01 Return.

c $ABF1 Clear Screen
@ $ABF1 label=ClearScreen
E $ABF1 View the equivalent code in;
. #LIST
. { #FOREST$BDEA }
. { #JEWELS$BA6D }
. { #ANDROMEDA$64A5 }
. { #WARLORD$A54E }
. LIST#
D $ABF1 Clear the display before a new room or a full-screen message.
  $ABF1,$03 Call #R$AC1A to switch to the normal screen output.
  $ABF4,$03 Clear the display with #SKOOLKID$0D6B(CLS).
  $ABF7,$01 Return.

u $ABF8 Clear Lines
@ $ABF8 label=ClearLines
E $ABF8 View the equivalent code in;
. #LIST
. { #SHOCK$9E0B }
. { #FOREST$BDF1 }
. { #JEWELS$BA74 }
. { #ANDROMEDA$64AC }
. { #WARLORD$A555 }
. LIST#
D $ABF8 Clear the lines given by *#R$AF38 from the bottom of the screen.
. Nothing calls this routine.
C $ABF8,$03 Call #R$AC1A to switch to the normal screen output.
C $ABFB,$07 Clear the number of lines held by *#R$AF38 from the bottom of the
. screen using #SKOOLKID$0E44(CL_LINE).
C $AC02,$01 Return.

c $AC03 Set Default Screen Position
@ $AC03 label=SetDefaultScreenPosition
E $AC03 View the equivalent code in;
. #LIST
. { #SHOCK$9E19 }
. { #FOREST$BDFC }
. { #JEWELS$BA7F }
. { #ANDROMEDA$64B7 }
. { #WARLORD$A560 }
. LIST#
D $AC03 Open the normal screen channel and park the cursor at the default line.
  $AC03,$03 Call #R$AC1A to switch to the normal screen output.
  $AC06,$06 Call #SKOOLKID$0DD9(CL_SET).
  $AC0C,$01 Return.

c $AC0D Set Screen Position
@ $AC0D label=SetScreenPosition
E $AC0D View the equivalent code in;
. #LIST
. { #FOREST$BE06 }
. { #JEWELS$BA89 }
. { #ANDROMEDA$64C1 }
. { #WARLORD$A56A }
. LIST#
D $AC0D Open the normal screen channel and park the cursor on the current screen
. line.
  $AC0D,$03 Call #R$AC1A to switch to the normal screen output.
  $AC10,$03 Read the screen line into #REGa.
  $AC13,$01 Use the screen line as the cursor row.
  $AC14,$05 Call #SKOOLKID$0DD9(CL_SET).
  $AC19,$01 Return.

c $AC1A Switch To Normal Screen Output
@ $AC1A label=SwitchNormalScreenOutput
E $AC1A View the equivalent code in;
. #LIST
. { #FOREST$BE13 }
. { #JEWELS$BA96 }
. { #ANDROMEDA$64CE }
. { #WARLORD$A577 }
. LIST#
D $AC1A Select the normal screen channel without losing the registers.
  $AC1A,$04 Hold the caller's values while the screen channel opens.
  $AC1E,$05 Call #SKOOLKID$1601(CHAN_OPEN).
  $AC23,$04 Restore the caller's values from the stack.
  $AC27,$01 Return.

c $AC28 Print String
@ $AC28 label=PrintString
E $AC28 View the equivalent code in;
. #LIST
. { #SHOCK$A267 }
. { #FOREST$BE21 }
. { #JEWELS$BAA4 }
. { #ANDROMEDA$64DC }
. { #WARLORD$A585 }
. LIST#
D $AC28 Print an #N$FF-terminated string.
R $AC28 HL Pointer to string to be printed
  $AC28,$03 Call #R$AC1A to switch to the normal screen output.
N $AC2B Just keep looping and printing the fetched character until the
. termination byte is reached (#N$FF).
@ $AC2B label=PrintString_Loop
  $AC2B,$01 Load a character from the string pointer into #REGa.
  $AC2C,$01 Move the string pointer to the next character.
  $AC2D,$03 Return if the string termination character (#N$FF) has been
. reached.
  $AC30,$03 Call #R$AC47 to print the character.
  $AC33,$02 Print the next character.

c $AC35 Print String And A Newline
@ $AC35 label=PrintStringAndNewline
E $AC35 View the equivalent code in;
. #LIST
. { #SHOCK$A275 }
. { #FOREST$BE2E }
. { #JEWELS$BAB1 }
. { #ANDROMEDA$64E9 }
. { #WARLORD$A592 }
. LIST#
D $AC35 Print an #N$FF-terminated string and move to the next line.
  $AC35,$03 Call #R$AC28 to print the string.
N $AC38 Force a newline to be "printed".
  $AC38,$02 Load a "newline" character into #REGa (#N$0D).
  $AC3A,$03 Call #R$AC47 to print the character.
  $AC3D,$01 Return.

c $AC3E Scroll Screen
@ $AC3E label=ScrollScreen
E $AC3E View the equivalent code in;
. #LIST
. { #FOREST$BE55 }
. { #JEWELS$BABA }
. { #ANDROMEDA$6510 }
. { #WARLORD$A59B }
. LIST#
D $AC3E Scroll the screen and put the cursor back on the default line.
  $AC3E,$01 Keep the caller's #REGbc, #REGde and #REGhl safe in the shadow
. registers while the screen scrolls.
N $AC3F Scroll the screen up.
  $AC3F,$03 Call #SKOOLKID$0DFE(CL_SC_ALL).
N $AC42 Reset the print position.
  $AC42,$03 Call #R$AC03.
  $AC45,$01 Bring back the caller's #REGbc, #REGde and #REGhl.
  $AC46,$01 Return.

c $AC47 Print Character
@ $AC47 label=PrintCharacter
E $AC47 View the equivalent code in;
. #LIST
. { #SHOCK$9E26 }
. { #FOREST$BE37 }
. { #JEWELS$BAC3 }
. { #ANDROMEDA$64F2 }
. { #WARLORD$A5A4 }
. LIST#
D $AC47 Print one character on the screen channel.
R $AC47 A The character to print
  $AC47,$01 Keep the character to print on the stack.
  $AC48,$07 Jump to #R$AC62 if the line byte of #SKOOLKID$5C88(S_POSN) (#N$5C89)
. is not equal to #N$03.
  $AC4F,$02 Restore the character to print from the stack, keeping a copy there.
  $AC51,$04 Jump to #R$AC5A if this isn't a newline character (#N$0D).
N $AC55 This is a newline, so scroll the screen up to action it.
  $AC55,$03 Call #R$AC3E.
  $AC58,$01 Clear the character off the stack (as there's nothing to print for
. a newline, just the screen scroll).
  $AC59,$01 Return.
N $AC5A Check the column position.
@ $AC5A label=CheckColumnPosition
  $AC5A,$08 Call #R$AC3E if *#SKOOLKID$5C88(S_POSN) is equal to #N$01.
N $AC62 Actions printing #REGa to the screen.
@ $AC62 label=PrintCharacterDirect
  $AC62,$01 Restore the character to print from the stack.
  $AC63,$01 Print to the screen using #SKOOLKID$0010(PRINT_A_1).
  $AC64,$01 Return.

c $AC65 Pause Loop
@ $AC65 label=PauseLoop
E $AC65 View the equivalent code in;
. #LIST
. { #SHOCK$9E2F }
. { #FOREST$BF41 }
. { #JEWELS$BB51 }
. { #ANDROMEDA$65D2 }
. { #WARLORD$A5C2 }
. LIST#
D $AC65 Wait for the number of frames held in #REGb.
  $AC65,$01 Wait for the next frame.
  $AC66,$02 Count down #REGb and repeat from #R$AC65 until the count is
. exhausted.
  $AC68,$01 Return.

c $AC69 Fetch Frames
@ $AC69 label=FetchFrames
E $AC69 View the equivalent code in;
. #LIST
. { #JEWELS$BB55 }
. { #WARLORD$A5C6 }
. LIST#
D $AC69 Read the ROM frame counter, used as a seed for chance.
  $AC69,$03 Read *#SKOOLKID$5C78(FRAMES) into #REGa.
  $AC6C,$01 Return.

c $AC6D Save Game
@ $AC6D label=SaveGame
E $AC6D View the equivalent code in;
. #LIST
. { #SHOCK$9E80 }
. { #FOREST$C345 }
. { #JEWELS$BB59 }
. { #ANDROMEDA$69A1 }
. { #WARLORD$A5CA }
. LIST#
D $AC6D Copy the configurable exits into the save buffer and write them to tape.
  $AC6D,$03 Read the configurable-exit count into #REGa.
  $AC70,$03 Jump to #R$AC8C if there are no configurable exits to pack.
N $AC73 #REGb counts the exits, #REGix walks their addresses and #REGde the save
. buffer.
  $AC73,$08 Take the exit count and point at the exit table and the save buffer.
  $AC7B,$02 Start with the first configurable exit.
N $AC7D Move on to the next configurable-exit address.
@ $AC7D label=SaveGame_CopyExit
  $AC7D,$05 Move #REGix on to the next exit address and #REGde on to the next
. packed exit byte.
@ $AC82 label=SaveGame_StoreFlag
  $AC82,$0A Fetch the exit address from *#REGix into #REGhl, copy the exit byte
. into the packed save buffer, and repeat until every exit byte is packed.
@ $AC8C label=SaveGame_StartTape
  $AC8C,$06 Print "#MESSAGE$B05A" and start a new line.
  $AC92,$03 Call #R$ABE1 to read the player's key.
  $AC95,$04 Load the starting address into #REGix at the item-location table.
  $AC99,$03 Set the block length in #REGde to #N$0186 bytes.
  $AC9C,$02 Set #REGa to #N$FF which indicates this is a data block.
  $AC9E,$03 Call #SKOOLKID$04C2(SA_BYTES).
  $ACA1,$06 Print "#MESSAGE$B07C" and start a new line.
  $ACA7,$01 Return.

c $ACA8 Load From Tape
@ $ACA8 label=LoadTape
E $ACA8 View the equivalent code in;
. #LIST
. { #SHOCK$9EDB }
. { #FOREST$C380 }
. { #JEWELS$BB94 }
. { #ANDROMEDA$69DC }
. { #WARLORD$A605 }
. LIST#
D $ACA8 Read a save block back from tape into the configurable exits.
  $ACA8,$06 Print "#MESSAGE$B01F" and start a new line.
  $ACAE,$04 Load the starting address into #REGix at the item-location table.
  $ACB2,$03 Set the block length in #REGde to #N$0186 bytes.
  $ACB5,$02 Set #REGa to #N$FF which indicates this is a data block.
  $ACB7,$01 Set the carry flag to indicate this is loading.
  $ACB8,$03 Call #SKOOLKID$0556(LD_BYTES).
  $ACBB,$02 Branch to #R$ACC5 if the block loaded without error (carry flag
. set).
  $ACBD,$06 Print "#MESSAGE$B034" and start a new line.
  $ACC3,$01 Set the carry flag to report that the load failed, so #R$F7AC
. restarts the game.
  $ACC4,$01 Return.
N $ACC5 There is nothing to unpack when no configurable exits were saved.
@ $ACC5 label=LoadTape_Success
  $ACC5,$03 Read the configurable-exit count into #REGa.
  $ACC8,$02 Return if there are no configurable exits to unpack.
N $ACCA #REGb counts the exits, #REGix walks their addresses and #REGde the save
. buffer.
  $ACCA,$08 Take the exit count and point at the exit table and the save buffer.
  $ACD2,$02 Restore the first configurable exit.
N $ACD4 The next saved exit address.
@ $ACD4 label=LoadTape_Restore
  $ACD4,$05 Move #REGix on to the next exit address and #REGde on to the next
. packed exit byte.
@ $ACD9 label=LoadTape_Write
  $ACD9,$0A Fetch the exit address from *#REGix into #REGhl, write that packed
. exit byte back into the game, and repeat until every exit byte is restored.
  $ACE3,$05 Show the room picture only when it has not already been seen.
  $ACE8,$01 Clear the carry flag to report that the load worked, so #R$F7AC goes
. back to the game.
  $ACE9,$01 Return.

c $ACEA Print Input Prompt
@ $ACEA label=PrintInputPrompt
E $ACEA View the equivalent code in;
. #LIST
. { #FOREST$C3C0 }
. { #JEWELS$BBD4 }
. { #ANDROMEDA$6A1C }
. { #WARLORD$A647 }
. LIST#
D $ACEA Print the input prompt.
  $ACEA,$03 Point at the prompt graphic in the display file.
  $ACED,$03 Set the increment in #REGde for the next screen line.
  $ACF0,$03 Scan the eight pixel rows of the prompt cell.
@ $ACF3 label=PrintInputPrompt_Loop
  $ACF3,$01 Collect the pixels of this row of the prompt cell.
  $ACF4,$01 Move down one line.
  $ACF5,$02 Repeat for all eight pixel rows, so #REGa is non-zero if anything is
. already drawn in the cell.
  $ACF7,$03 Jump to #R$ACFF if #REGa is zero.
N $ACFA Force a newline to be "printed".
  $ACFA,$02 Use the ENTER key code.
  $ACFC,$03 Call #R$AC47 to print the character.
@ $ACFF label=PrintPrompt
  $ACFF,$06 Print "#MESSAGE$AF4D".
  $AD05,$01 Return.

c $AD06 Print Room Graphic
@ $AD06 label=PrintRoomGraphic
E $AD06 View the equivalent code in;
. #LIST
. { #FOREST$BE5E }
. { #JEWELS$BAE1 }
. { #ANDROMEDA$6519 }
. LIST#
D $AD06 Expand one compressed room picture into the display.
R $AD06 IX Pointer to room image data
  $AD06,$03 Call #R$AC1A to switch to the normal screen output.
  $AD09,$03 Park the cursor where the room picture is printed.
  $AD0C,$03 Call #SKOOLKID$0DD9(CL_SET).
N $AD0F Reset graphic display area.
  $AD0F,$03 Point #REGhl at #SKOOLKID$5C8F(ATTR_T) which holds the current
. attribute value.
  $AD12,$01 Fetch the attribute byte.
  $AD13,$02,b$01 Keep only the PAPER bits 3-5.
  $AD15,$03 Move the PAPER bits into the INK bits.
  $AD18,$01 Store the result in #REGb.
  $AD19,$01 Fetch the attribute byte again.
  $AD1A,$02,b$01 Keep everything except the INK bits.
  $AD1C,$01 Combine the two values.
  $AD1D,$01 Write the result back to *#SKOOLKID$5C8F(ATTR_T).
  $AD1E,$03 Set a byte counter in #REGbc of #N$0200.
@ $AD21 label=Print_RoomGraphic_Loop
  $AD21,$01 Keep the byte counter on the stack.
  $AD22,$03 Point #REGhl at #R$AF3D.
  $AD25,$02 Take the eight pixel rows of this character cell.
  $AD27,$03 Take this cell's mask byte.
  $AD2A,$02 Move past the mask byte.
  $AD2C,$02 Expand the first row of this cell.
@ $AD2E label=Print_RoomGraphic_NextByte
  $AD2E,$01 Step to the next row of the cell.
@ $AD2F label=Print_RoomGraphic_ShiftBit
  $AD2F,$02 Test the next mask bit.
  $AD31,$02 Skip the stored row when this mask bit is clear.
  $AD33,$03 Take the pixel row stored for this mask bit.
  $AD36,$02 Move past that pixel row.
  $AD38,$02 Store the pixel row for this mask bit.
@ $AD3A label=Print_RoomGraphic_BlankByte
  $AD3A,$01 Use a blank pixel row when this mask bit is clear.
@ $AD3B label=Print_RoomGraphic_StoreByte
  $AD3B,$01 Store the row in this cell.
  $AD3C,$02 Repeat for all eight pixel rows of this character cell.
  $AD3E,$03 Point #REGde at #R$AF3D.
  $AD41,$03 Call #SKOOLKID$0B03(PO_FETCH).
  $AD44,$03 Call #SKOOLKID$0B24,$0B7F(PR_ALL).
  $AD47,$03 Call #SKOOLKID$0ADC(PO_STORE).
  $AD4A,$01 Restore the byte counter from the stack.
  $AD4B,$01 Decrease the byte counter by one.
  $AD4C,$04 Jump back to #R$AD21 until the byte counter is zero.
  $AD50,$03 Call #SKOOLKID$0D4D(TEMPS).
  $AD53,$01 Return.

c $AD54 Colour Room Image
@ $AD54 label=ColourRoomImage
E $AD54 View the equivalent code in;
. #LIST
. { #FOREST$BEAC }
. { #JEWELS$BB2F }
. { #ANDROMEDA$6535 }
. LIST#
D $AD54 Copy the picture's attribute bytes onto the screen.
R $AD54 IX Pointer to the room attribute data
  $AD54,$03 Point #REGde at the attribute file.
  $AD57,$03 Copy the attribute pointer from #REGix into #REGhl.
  $AD5A,$03 Use #N$0200 as the count in #REGbc.
  $AD5D,$02 Copy the counted bytes from #REGhl to #REGde.
  $AD5F,$01 Return.

c $AD60 Print Room Image
@ $AD60 label=Print_RoomImage
E $AD60 View the equivalent code in;
. #LIST
. { #SHOCK$9F28 }
. { #FOREST$BEB8 }
. { #JEWELS$BB3B }
. { #ANDROMEDA$6541 }
. { #WARLORD$B10B }
. LIST#
D $AD60 Draw the room picture and then colour it.
  $AD60,$03 Call #R$AD06 to draw the room picture.
  $AD63,$03 Call #R$AD54 to colour the room picture.
  $AD66,$01 Return.

u $AD67 Clear Room Image
@ $AD67 label=ClearRoomImage
E $AD67 View the equivalent code in;
. #LIST
. { #FOREST$BEBF }
. { #JEWELS$BB42 }
. { #ANDROMEDA$6548 }
. LIST#
D $AD67 Copy one attribute byte across the #N$0200 cells of the picture.
. Nothing calls this routine.
R $AD67 A Attribute byte value
C $AD67,$03 Set a counter in #REGbc of #N$0200 bytes.
C $AD6A,$03 Point #REGhl at the attribute buffer (#N$5800).
C $AD6D,$01 Copy the attribute byte into #REGe.
@ $AD6E label=ClearRoomImage_Loop
C $AD6E,$01 Write the byte to the attribute buffer.
C $AD6F,$01 Advance #REGhl to the next cell.
C $AD70,$01 Step the picture-cell count down.
C $AD71,$02 See whether any picture cells remain.
C $AD73,$02 Branch to #R$AD6E while cells remain.
C $AD75,$01 Return.

g $AD76 Table: Item Locations
@ $AD76 label=Table_ItemLocations
E $AD76 View the equivalent code in;
. #LIST
. { #SHOCK$9F88 }
. { #FOREST$B9C8 }
. { #JEWELS$BBF0 }
. { #ANDROMEDA$61AB }
. { #WARLORD$A66C }
. LIST#
D $AD76 One byte per item. The value is the room the item is in, #N$00 when
. the item is inactive, and the inventory room when the player is carrying it.
B $AD76,$01 Room #N(#PEEK(#PC)).
L $AD76,$01,$87

u $ADFD
S $ADFD,$79

g $AE76 Flags: Room Change
@ $AE76 label=Flags_RoomChange
D $AE76 One byte of once-only and room-change flags. Bits #N$00 and #N$01
. are tested when entering or leaving #ROOM$37, but the shipped game never
. sets them. Bit #N$03 is tested after taking the copper key, but is never
. set.
. #TABLE(default,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Enter #ROOM$37 without dying }
. { #N$01 | Skip the phoenix transformation }
. { #N$02 | #R$EC04(Revealing the jewelled key under the carpet) }
. { #N$03 | Awarding points for the copper key }
. { #N$04 | #R$EC6C(Awarding points for the gold key) }
. { #N$05 | #R$ECC0(Awarding points for the jewelled key) }
. { #N$06 | Unused }
. { #N$07 | Unused }
. TABLE#
B $AE76,$01

g $AE77 Flag: Beach Dug
@ $AE77 label=Flag_BeachDug
D $AE77 Bit 0 is set once the player has dug on the beach in room #N$3C.
B $AE77,$01

g $AE78 Flag: Turn Scratch
@ $AE78 label=Flag_TurnScratch
D $AE78 Cleared at the start of every pass round the game loop.
B $AE78,$01

g $AE79 Room: Pour Return
@ $AE79 label=Room_PourReturn
D $AE79 Holds the room ID to restore after pouring.
B $AE79,$01

u $AE7A
S $AE7A,$04

g $AE7E Table: Already Seen Room Images
@ $AE7E label=Table_RoomImagesAlreadySeen
E $AE7E View the equivalent code in;
. #LIST
. { #SHOCK$A0A8 }
. { #FOREST$BA30 }
. { #JEWELS$BC5C }
. { #ANDROMEDA$6213 }
. { #WARLORD$A774 }
. LIST#
D $AE7E Corresponds to whether the player has already seen the image for
. the following rooms:
.
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$FDFF,$FE06,,1(n,{ #N(n-$FDFF) | #N(#PEEKn) | #ROOM(#PEEKn) })
. TABLE#
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$FE07,$FE08,,1(n,{ #N(n-$FE07) | #N(#PEEKn) | #ROOM(#PEEKn) })
. #FOR$02,$07,,1(n,{ #Nn | N/A | N/A })
. TABLE#
D $AE7E #R$B41F tests and sets the bit for the current room. The bit
. number is the room's place in #R$FDFF.
B $AE7E,b,$01
B $AE7F,b,$01

u $AE80
S $AE80,$08

g $AE88 Flags: Turn-Based Event States
@ $AE88 label=Flag_TurnBasedEventState
E $AE88 View the equivalent code in;
. #LIST
. { #SHOCK$A0C8 }
. { #FOREST$BA36 }
. { #JEWELS$BC66 }
. { #ANDROMEDA$6219 }
. { #WARLORD$A77E }
. LIST#
D $AE88 Holds a single byte, where each bit relates to a turn-based event as
. follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Unused }
. { #N$01 | Unused }
. { #N$02 | Unused }
. { #N$03 | Unused }
. { #N$04 | Unused }
. { #N$05 | Unused }
. { #N$06 | Unused }
. { #N$07 | Unused }
. TABLE#
. When the bit is set, this starts a turn counter (see #R$AE89).
. #R$B373 decrements the matching counter in #R$AE89 and, when a counter
. reaches zero, would call through #R$AED2. The shipped image leaves
. #R$AED2 as #N$00 and never sets these bits.
B $AE88,$01

g $AE89 Turn-Based Event Counters
E $AE89 View the equivalent code in;
. #LIST
. { #SHOCK$A0C9 }
. { #FOREST$BA37 }
. { #JEWELS$BC67 }
. { #ANDROMEDA$621A }
. { #WARLORD$A77F }
. LIST#
D $AE89 One countdown per bit of *#R$AE88. #R$B373 decrements a set
. counter each turn. The shipped image never arms any of them.
N $AE89 Unused.
@ $AE89 label=Counter_Unused_0
N $AE8A Unused.
@ $AE8A label=Counter_Unused_1
N $AE8B Unused.
@ $AE8B label=Counter_Unused_2
N $AE8C Unused.
@ $AE8C label=Counter_Unused_3
N $AE8D Unused.
@ $AE8D label=Counter_Unused_4
N $AE8E Unused.
@ $AE8E label=Counter_Unused_5
N $AE8F Unused.
@ $AE8F label=Counter_Unused_6
N $AE90 Unused.
@ $AE90 label=Counter_Unused_7
B $AE89,$08,$01

g $AE91 Flag: Following Heroes
@ $AE91 label=Flag_FollowingHeroes
D $AE91 Each set bit makes the matching item in #R$AE92 follow the player
. when the room changes (#R$B714). Bits 0-3 default to #ITEM$00 (Beren),
. #ITEM$01 (Istar), #ITEM$02 (Haldir) and #ITEM$03 (Khadim). Bits 4-7 are
. never set. #R$E9E1 also reads this byte when checking the ruined cottage.
B $AE91,$01

g $AE92 Table: Following Items
@ $AE92 label=Table_FollowingItems
D $AE92 Each bit of *#R$AE91 makes the item at the same position here follow
. the player when the room changes.
B $AE92,$01 Bit 0: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $AE93,$01 Bit 1: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $AE94,$01 Bit 2: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $AE95,$01 Bit 3: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $AE96,$04 Bits 4-7: not used by this game.

g $AE9A Number Of Items In The Players Inventory
@ $AE9A label=Count_InventoryItems
D $AE9A The number of items the player is currently holding.
B $AE9A,$01

g $AE9B Load/ Save Buffer
@ $AE9B label=LoadSaveBuffer
D $AE9B Save Game copies the configurable-exit bytes here before writing
. the tape block. The buffer is #N$32 bytes, ending at the current room.
B $AE9B,$32

g $AECD Current Room ID
@ $AECD label=CurrentRoom
D $AECD The room the player starts the game in is room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
B $AECD,$01 Current room ID.

g $AECE Score
@ $AECE label=Score
D $AECE BCD score. Add To Score accumulates into this word.
W $AECE,$02

g $AED0 Pointer: Vocabulary Table
@ $AED0 label=Pointer_Vocabulary
D $AED0 Pointer to the table containing the game vocabulary.
W $AED0,$02

g $AED2 Pointer: Turn-Based Events Jump Table
@ $AED2 label=Pointer_TurnBasedEvents_Jump
D $AED2 Pointer to the jump table containing turn-based events. The initial
. image stores #N$00.
W $AED2,$02

g $AED4 Pointer: Room Map Table
@ $AED4 label=Pointer_RoomMap
D $AED4 Pointer to the table containing the relationships between rooms.
W $AED4,$02

g $AED6 Pointer: Item Description Table
@ $AED6 label=Pointer_ItemDescriptions
D $AED6 Pointer to the table containing item descriptions.
W $AED6,$02

g $AED8 Pointer: Rooms With Images Table
@ $AED8 label=Pointer_RoomsWithImages
D $AED8 Pointer to the table containing all the rooms which have an image
. to display.
W $AED8,$02

g $AEDA Pointer: Room Image Jump Table
@ $AEDA label=Pointer_RoomImage
D $AEDA Pointer to the jump table for displaying an image relating to a
. room.
W $AEDA,$02

g $AEDC Pointer: Room Description Table
@ $AEDC label=Pointer_RoomDescriptions
D $AEDC Pointer to the table containing room descriptions.
W $AEDC,$02

g $AEDE Pointer: Item Grouping Table
@ $AEDE label=Pointer_ItemGroupingTable
D $AEDE Pointer to the table containing item groupings.
W $AEDE,$02

g $AEE0 Pointer: Object Noun Phrases
@ $AEE0 label=Pointer_ObjectNounPhrases
D $AEE0 Pointer to the object noun-phrase table.
W $AEE0,$02

g $AEE2 Pointer: Object List Table
@ $AEE2 label=Pointer_ObjectList
D $AEE2 Pointer to the object-word table.
W $AEE2,$02

g $AEE4 Pointer: Verbs Jump Table
@ $AEE4 label=Pointer_JumpTable_Verbs
D $AEE4 Pointer to the jump table of verb handlers.
W $AEE4,$02

g $AEE6 Pointer: Configurable Exits Table
@ $AEE6 label=Pointer_ConfigurableExits
D $AEE6 Pointer to the configurable-exit address table.
W $AEE6,$02

g $AEE8 Pointer: Scenic Events Jump Table
@ $AEE8 label=Pointer_JumpTable_ScenicEvents
D $AEE8 Pointer to the jump table of scenic-event handlers. The initial image
. stores #N$00; this game ships with no scenic-event handlers.
W $AEE8,$02

g $AEEA Pointer: Verb Word Tokens Table
@ $AEEA label=Pointer_VerbWordTokens
D $AEEA Pointer to the verb word-token table.
W $AEEA,$02

g $AEEC Pointer: Spare
@ $AEEC label=Pointer_Spare
D $AEEC Unused pointer. The initial image stores #N$00.
W $AEEC,$02

g $AEEE Pointer: Spare 2
@ $AEEE label=Pointer_Spare2
D $AEEE Unused pointer. The initial image stores #N$00.
W $AEEE,$02

g $AEF0 Number Of Items
@ $AEF0 label=Count_Items
D $AEF0 The total number of items in the game.
W $AEF0,$02

g $AEF2 Number Of Objects
@ $AEF2 label=Count_Objects
D $AEF2 The total number of objects in the game.
W $AEF2,$02

g $AEF4 Number Of Verb Tokens
@ $AEF4 label=Count_VerbTokens
D $AEF4 The total number of verb word tokens the game has.
W $AEF4,$02

g $AEF6 Number Of Rooms With Images
@ $AEF6 label=Count_RoomsWithImages
D $AEF6 The total number of rooms which have related images in the game.
. #N$0A room slots have a picture; the oil room and the acid room share
. one.
W $AEF6,$02

g $AEF8 Number Of Scenic Events
@ $AEF8 label=Count_ScenicEvents
D $AEF8 The total number of scenic events in the game. The initial image
. stores #N$00.
W $AEF8,$02

g $AEFA Number Of "Configurable Exits"
@ $AEFA label=Count_ConfigurableExits
D $AEFA The total number of configurable exits in the game.
W $AEFA,$02

g $AEFC Command Buffer
@ $AEFC label=CommandBuffer
D $AEFC The line the player is typing. The input handler clears all #N$32 bytes.
B $AEFC,$32

g $AF2E User Input: Word Tokens
@ $AF2E label=UserInput_FirstToken
@ $AF2F label=UserInput_SecondToken
B $AF2E,$01 The first word, which should be the verb.
B $AF2F,$09,$09 The words after the verb.

g $AF38 Line Number
@ $AF38 label=LineNumber
E $AF38 View the equivalent code in;
. #LIST
. { #FOREST$BB40 }
. { #JEWELS$BD70 }
. { #ANDROMEDA$629B }
. { #WARLORD$A82E }
. LIST#
D $AF38 The entry point writes #N$18 here.
B $AF38,$01

g $AF39 Four Letter Buffer
@ $AF39 label=FourLetterBuffer
D $AF39 The four-character word #R$B24E is matching. The routine fills it with
. ASCII spaces (#N$20) and then copies up to #N$04 characters of the next
. command word into it.
B $AF39,$04

g $AF3D Graphics: Room Image Row
@ $AF3D label=RoomImageRow
D $AF3D Eight bytes assembled by #R$AD06 for one character row of a room image,
. then passed to the ROM print routine.
B $AF3D,$08

g $AF45 Temporary Storage Table Pointer
@ $AF45 label=TempStore_TablePointer
W $AF45,$02

g $AF47 Temporary Storage Table Index
@ $AF47 label=TempStore_TableIndex
W $AF47,$02

g $AF49 Temporary Storage Word Count
@ $AF49 label=TempStore_WordCount
W $AF49,$02

u $AF4B
S $AF4B,$02

t $AF4D Messaging: ">"
@ $AF4D label=Messaging_Prompt
  $AF4D,$02 "#MESSAGE$AF4D".
B $AF4F,$01 Terminator.

t $AF50 Messaging: "Control"
@ $AF50 label=Messaging_BackspaceSpaceBackspace
  $AF50,$03 "#MESSAGE$AF50".
B $AF53,$01 Terminator.

t $AF54 Messaging: "THE"
@ $AF54 label=Messaging_The
  $AF54,$04 "#MESSAGE$AF54".
B $AF58,$01 Terminator.

t $AF59 Messaging: "I don't understand."
@ $AF59 label=Messaging_IDontUnderstand
  $AF59,$13 "#MESSAGE$AF59".
B $AF6C,$01 Terminator.

t $AF6D Messaging: "I don't know the word:-"
@ $AF6D label=Messaging_IDontKnowTheWord
  $AF6D,$17 "#MESSAGE$AF6D".
B $AF84,$01 Terminator.

t $AF85 Messaging: "nothing."
@ $AF85 label=Messaging_Nothing
  $AF85,$08 "#MESSAGE$AF85".
B $AF8D,$01 Terminator.

t $AF8E Messaging: "You can see:-"
@ $AF8E label=Messaging_YouCanSee
  $AF8E,$0E "#MESSAGE$AF8E".
B $AF9C,$01 Terminator.

t $AF9D Messaging: "&"
@ $AF9D label=Messaging_Ampersand
  $AF9D,$03 "#MESSAGE$AF9D".
B $AFA0,$01 Terminator.

t $AFA1 Messaging: "There are exits:-"
@ $AFA1 label=Messaging_ThereAreExits
  $AFA1,$12 "#MESSAGE$AFA1".
B $AFB3,$01 Terminator.

t $AFB4 Messaging: "There is an exit"
@ $AFB4 label=Messaging_ThereIsAnExit
  $AFB4,$12 "#MESSAGE$AFB4".
B $AFC6,$01 Terminator.

t $AFC7 Messaging: "North"
@ $AFC7 label=Messaging_North
  $AFC7,$05 "#MESSAGE$AFC7".
B $AFCC,$01 Terminator.

t $AFCD Messaging: "South"
@ $AFCD label=Messaging_South
  $AFCD,$05 "#MESSAGE$AFCD".
B $AFD2,$01 Terminator.

t $AFD3 Messaging: "East"
@ $AFD3 label=Messaging_East
  $AFD3,$04 "#MESSAGE$AFD3".
B $AFD7,$01 Terminator.

t $AFD8 Messaging: "West"
@ $AFD8 label=Messaging_West
  $AFD8,$04 "#MESSAGE$AFD8".
B $AFDC,$01 Terminator.

t $AFDD Messaging: "Up"
@ $AFDD label=Messaging_Up
  $AFDD,$02 "#MESSAGE$AFDD".
B $AFDF,$01 Terminator.

t $AFE0 Messaging: "Down"
@ $AFE0 label=Messaging_Down
  $AFE0,$04 "#MESSAGE$AFE0".
B $AFE4,$01 Terminator.

t $AFE5 Messaging: "I can't see"
@ $AFE5 label=Messaging_ICantSee
  $AFE5,$0C "#MESSAGE$AFE5".
B $AFF1,$01 Terminator.

t $AFF2 Messaging: "here."
@ $AFF2 label=Messaging_Here
  $AFF2,$06 "#MESSAGE$AFF2".
B $AFF8,$01 Terminator.

t $AFF9 Messaging: "You are dead."
@ $AFF9 label=Messaging_YouAreDead
  $AFF9,$0D "#MESSAGE$AFF9".
B $B006,$01 Terminator.

t $B007 Messaging: "Want another game? Y/N."
@ $B007 label=Messaging_WantAnotherGameYN
  $B007,$17 "#MESSAGE$B007".
B $B01E,$01 Terminator.

t $B01F Messaging: "LOADING. Start tape."
@ $B01F label=Messaging_LoadingStartTape
  $B01F,$14 "#MESSAGE$B01F".
B $B033,$01 Terminator.

t $B034 Messaging: "Tape error. Press any key to restart."
@ $B034 label=Messaging_TapeError
  $B034,$25 "#MESSAGE$B034".
B $B059,$01 Terminator.

t $B05A Messaging: "SAVING. Start tape,press any key."
@ $B05A label=Messaging_SavingStartTapePressAnyKey
  $B05A,$21 "#MESSAGE$B05A".
B $B07B,$01 Terminator.

t $B07C Messaging: "Stop tape.Saving complete."
@ $B07C label=Messaging_StopTape
  $B07C,$1A "#MESSAGE$B07C".
B $B096,$01 Terminator.

t $B097 Messaging: "Want to save the game? Y/N."
@ $B097 label=Messaging_WantToSaveTheGameYN
  $B097,$1B "#MESSAGE$B097".
B $B0B2,$01 Terminator.

t $B0B3 Messaging: "Please be more specific."
@ $B0B3 label=Messaging_PleaseBeMoreSpecific
  $B0B3,$18 "#MESSAGE$B0B3".
B $B0CB,$01 Terminator.

t $B0CC Messaging: "Please rephrase that."
@ $B0CC label=Messaging_PleaseRephraseThat
  $B0CC,$15 "#MESSAGE$B0CC".
B $B0E1,$01 Terminator.

t $B0E2 Messaging: "You can't."
@ $B0E2 label=Messaging_YouCant
  $B0E2,$0A "#MESSAGE$B0E2".
B $B0EC,$01 Terminator.

t $B0ED Messaging: "O.K."
@ $B0ED label=Messaging_OK
  $B0ED,$04 "#MESSAGE$B0ED".
B $B0F1,$01 Terminator.

t $B0F2 Messaging: "You're already carrying"
@ $B0F2 label=Messaging_YoureAlreadyCarrying
  $B0F2,$18 "#MESSAGE$B0F2".
B $B10A,$01 Terminator.

t $B10B Messaging: "."
@ $B10B label=Messaging_FullStop
  $B10B,$01 "#MESSAGE$B10B".
B $B10C,$01 Terminator.

t $B10D Messaging: "it."
@ $B10D label=Messaging_It
  $B10D,$03 "#MESSAGE$B10D".
B $B110,$01 Terminator.

t $B111 Messaging: "them."
@ $B111 label=Messaging_Them
  $B111,$05 "#MESSAGE$B111".
B $B116,$01 Terminator.

t $B117 Messaging: "You can't carry any more."
@ $B117 label=Messaging_YouCantCarryAnyMore
  $B117,$19 "#MESSAGE$B117".
B $B130,$01 Terminator.

t $B131 Messaging: "You are carrying:-"
@ $B131 label=Messaging_YouAreCarrying
  $B131,$12 "#MESSAGE$B131".
B $B143,$01 Terminator.

t $B144 Messaging: "You can't go in that direction."
@ $B144 label=Messaging_YouCantGoInThatDirection
  $B144,$1F "#MESSAGE$B144".
B $B163,$01 Terminator.

t $B164 Messaging: "One at a time,please!"
@ $B164 label=Messaging_OneAtATimePlease
  $B164,$15 "#MESSAGE$B164".
B $B179,$01 Terminator.

t $B17A Messaging: "I don't see the point."
@ $B17A label=Messaging_IDontSeeThePoint
  $B17A,$16 "#MESSAGE$B17A".
B $B190,$01 Terminator.

t $B191 Messaging: "You're not carrying"
@ $B191 label=Messaging_YoureNotCarrying
  $B191,$14 "#MESSAGE$B191".
B $B1A5,$01 Terminator.

t $B1A6 Messaging: "You're not carrying anything."
@ $B1A6 label=Messaging_YoureNotCarryingAnything
  $B1A6,$1D "#MESSAGE$B1A6".
B $B1C3,$01 Terminator.

t $B1C4 Messaging: "You have scored"
@ $B1C4 label=Messaging_YouHaveScored
  $B1C4,$10 "#MESSAGE$B1C4".
B $B1D4,$01 Terminator.

t $B1D5 Messaging: "%."
@ $B1D5 label=Messaging_Percentage
  $B1D5,$02 "#MESSAGE$B1D5".
B $B1D7,$01 Terminator.

w $B1D8 Table: Direction Names
@ $B1D8 label=Table_DirectionNames
D $B1D8 One word per direction, in the order north, south, east, west, up, down.
W $B1D8,$02 #MESSAGE(#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $B1D8,$02,$06

c $B1E4 Messaging: "Please Rephrase That."
@ $B1E4 label=Messaging_PleaseRephraseThat_Newline
E $B1E4 View the equivalent code in;
. #LIST
. { #FOREST$BDBE }
. { #JEWELS$BFEE }
. { #ANDROMEDA$6479 }
. { #WARLORD$AAEE }
. LIST#
D $B1E4 Print "Please Rephrase That."
N $B1E4 Print it and start a new line: #MESSAGE$B0CC.
  $B1E4,$06 Point at the message and print it and start a new line.
  $B1EA,$01 Return.

c $B1EB Messaging: "Please Be More Specific."
@ $B1EB label=Messaging_PleaseBeMoreSpecific_Newline
E $B1EB View the equivalent code in;
. #LIST
. { #FOREST$BDC5 }
. { #JEWELS$BFF5 }
. { #ANDROMEDA$6480 }
. { #WARLORD$AAF5 }
. LIST#
D $B1EB Print "Please Be More Specific."
N $B1EB Print it and start a new line: #MESSAGE$B0B3.
  $B1EB,$06 Point at the message and print it and start a new line.
  $B1F1,$01 Return.

u $B1F2 Messaging: "You Can't"
@ $B1F2 label=Messaging_YouCant_Newline
E $B1F2 View the equivalent code in;
. #LIST
. { #FOREST$BDCC }
. { #JEWELS$BFFC }
. { #ANDROMEDA$6487 }
. { #WARLORD$AAFC }
. LIST#
D $B1F2 Print "You Can't". Nothing calls this copy; play uses #R$EAE2.
N $B1F2 Print it and start a new line: #MESSAGE$B0E2.
C $B1F2,$06 Point at the message and print it and start a new line.
C $B1F8,$01 Return.

u $B1F9 Response: "O.K."
@ $B1F9 label=Response_OK
E $B1F9 View the equivalent code in;
. #LIST
. { #FOREST$BDD3 }
. { #JEWELS$C003 }
. { #ANDROMEDA$648E }
. { #WARLORD$AB03 }
. LIST#
D $B1F9 Print "O.K." Nothing calls this copy; play uses #R$EAE8.
N $B1F9 Print "#MESSAGE$B0ED".
C $B1F9,$03 #REGhl=#R$B0ED.
C $B1FC,$03 Call #R$AC35.
C $B1FF,$01 Return.

c $B200 Handler: User Input
@ $B200 label=Handler_UserInput
E $B200 View the equivalent code in;
. #LIST
. { #SHOCK$A4B0 }
. { #FOREST$BF73 }
. { #JEWELS$C00A }
. { #ANDROMEDA$6604 }
. { #WARLORD$AD32 }
. LIST#
D $B200 Read a command, tokenise it, and reject words the game does not know.
  $B200,$03 Call #R$AC03 to park the cursor on the default line.
  $B203,$03 Point #REGhl at #R$AEFC.
  $B206,$04 Fill the command buffer with spaces.
@ $B20A label=Handler_UserInput_Loop
  $B20A,$01 Store #REGa at the buffer pointer.
  $B20B,$01 Advance #REGhl to the next byte.
  $B20C,$02 Count down #REGb and repeat from #R$B20A until the count is
. exhausted.
  $B20E,$03 Call #R$ACEA to print the input prompt.
  $B211,$03 Point #REGhl at #R$AEFC.
@ $B214 label=UserInput_Loop
  $B214,$03 Call #R$ABE1 to read the player's key.
  $B217,$04 Branch to #R$B237 when the player pressed DELETE.
  $B21B,$04 Branch to #R$B24E when the player pressed ENTER.
  $B21F,$04 Branch to #R$B214 unless the player pressed SPACE.
  $B223,$01 Move the buffer position into #REGde so it can be checked against
. the end of the command buffer.
  $B224,$09 Ignore a space once the command fills the buffer.
  $B22D,$01 Store #REGa at the buffer pointer.
  $B22E,$03 Call #R$AC1A to switch to the normal screen output.
  $B231,$03 Call #R$AC47 to print the character.
  $B234,$01 Advance #REGhl to the next byte.
  $B235,$02 Read the next key at #R$B214.

c $B237 Handler: User Pressed "DELETE"
@ $B237 label=UserInput_Delete
E $B237 View the equivalent code in;
. #LIST
. { #FOREST$BFAA }
. { #JEWELS$C041 }
. LIST#
D $B237 Rub out the last character of the command when the player presses
. DELETE.
R $B237 HL Current position in the command buffer
  $B237,$08 See whether the cursor is still on the first character.
  $B23F,$02 Ignore DELETE at the start of the command.
N $B241 Else delete the current character.
  $B241,$01 Keep the pointer to the command buffer on the stack.
  $B242,$06 Rub out the last character.
  $B248,$01 Restore the pointer to the command buffer from the stack.
N $B249 Now adjust the command buffer pointer to match the new position.
  $B249,$01 Decrease the pointer to the command buffer by one.
  $B24A,$02 Write an ASCII space (#N$20) into the command buffer at the current
. position.
  $B24C,$02 Read the next key.

c $B24E Handler: User Pressed "ENTER"
@ $B24E label=UserInput_Enter
E $B24E View the equivalent code in;
. #LIST
. { #FOREST$BFC1 }
. { #JEWELS$C058 }
. { #ANDROMEDA$6669 }
. LIST#
D $B24E Turn the finished command into word tokens.
R $B24E HL Current position in the command buffer
R $B24E A Which contains #N$0D ("ENTER") at this point
  $B24E,$01 Write #N$0D to the command buffer at the current position for use as
. a termination character.
N $B24F Force a newline to be "printed" to the screen.
  $B24F,$03 Call #R$AC1A.
  $B252,$03 Call #R$AC47 to print the character.
N $B255 Initialise the word token buffer. This buffer will store up to #N$0A
. vocabulary tokens (one per word in the command). Each token is the index of
. the word in the vocabulary table.
  $B255,$03 Point #REGhl at #R$AF2E.
  $B258,$02 Use the the terminator key code.
  $B25A,$02 Set a counter in #REGb for the size of the word token buffer (#N$0A
. bytes).
N $B25C Fill the word token buffer with #N$FF (the terminator value) to mark all
. slots as empty.
@ $B25C label=EmptyWordTokenBuffer_Loop
  $B25C,$04 Mark every word slot empty.
  $B260,$03 Point #REGhl at #R$AEFC.
  $B263,$02 Allow ten words in the command.
@ $B265 label=Parser_MatchInputWord
N $B265 Clear the four-letter buffer to spaces so a short word cannot match
. the previous one's tail.
  $B265,$03 #REGde=#R$AF39.
  $B268,$02 Set a counter in #REGb for the #N$04 letters.
  $B26A,$02 #REGa=#N$20.
@ $B26C label=ClearWordBuffer_Loop
  $B26C,$01 Write a space character (#N$20) to the buffer.
  $B26D,$01 Move to the next letter.
  $B26E,$02 Decrease the counter by one and loop back to #R$B26C until the
. counter is zero.
  $B270,$05 Finish when every word slot is full.
  $B275,$01 Read the next character of the command.
  $B276,$05 Finish the command at ENTER.
  $B27B,$05 Copy the next word into the four-byte scratch.
  $B280,$01 Read the next character of this word.
  $B281,$04 End the word at ENTER.
  $B285,$04 End the word at a space.
  $B289,$04 End the word at a comma.
  $B28D,$01 Store that character in the word scratch.
  $B28E,$02 Advance through the command and the word scratch.
  $B290,$02 Copy up to four letters of this word into the word scratch.
  $B292,$01 Read the character past a word that did not fit.
  $B293,$04 Stop skipping once ENTER is reached.
  $B297,$04 Stop skipping at a space.
  $B29B,$04 Stop skipping at a comma.
  $B29F,$01 Skip the rest of a word that does not fit the scratch.
  $B2A0,$02 Keep skipping to the end of a long word.
  $B2A2,$01 Step past the space or comma between words.
  $B2A3,$01 Read the character after that space or comma.
  $B2A4,$04 Skip spaces between words.
  $B2A8,$04 Skip commas between words.
N $B2AC Preserve the command pointer, word buffer and token counter while
. comparing.
  $B2AC,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $B2AF,$08 Compare the scratch word with "#MESSAGE$AF54".
@ $B2B7 label=CompareWord_Loop
  $B2B7,$04 Jump to #R$B2BF if the characters don't match (the word is not
. "The").
  $B2BB,$02 Compare the next letter of "THE".
  $B2BD,$02 Decrease the letter counter by one and loop back to #R$B2B7 until
. the counter is zero.
N $B2BF Restore the registers saved before the "THE" comparison.
  $B2BF,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $B2C2,$02 Jump to #R$B265 if the words matched (this was "The", so skip it and
. process the next word).
  $B2C4,$01 Use up one of the ten word slots for this word.
  $B2C5,$03 Write #REGhl to the word scratch.
  $B2C8,$04 Write #REGde to the word pointer.
  $B2CC,$04 Write #REGbc to *#R$AF49.
N $B2D0 Look up the word in the vocabulary table. The vocabulary contains all
. recognised verbs, nouns, and other words the game understands. Each entry can
. have synonyms separated by commas.
  $B2D0,$03 #REGhl=*#R$AED0.
  $B2D3,$02 Set the token number in #REGc to #N$00.
@ $B2D5 label=VocabularyLookup_Loop
  $B2D5,$05 Jump to #R$B312 if the word is the #N$FF terminator.
@ $B2DA label=CompareVocabularyWord
  $B2DA,$03 #REGde=#R$AF39.
  $B2DD,$02 Set a counter in #REGb for the #N$04 letters.
@ $B2DF label=CompareVocabularyWord_Loop
  $B2DF,$04 Jump to #R$B303 if this letter does not match.
  $B2E3,$01 Move to the next letter of the four-letter buffer.
  $B2E4,$01 Move to the next vocabulary letter.
  $B2E5,$02 Decrease the letter counter by one and loop back to #R$B2DF until
. the counter is zero.
N $B2E7 The word matched. Calculate which token-buffer slot to use and store
. the vocabulary index as the token.
  $B2E7,$08 Work out which token slot this word fills.
  $B2EF,$01 Copy the slot index into #REGe.
  $B2F0,$04 Calculate the address of the token buffer slot:
. #REGhl=#R$AF2E+#REGde.
  $B2F4,$01 Store the vocabulary index (#REGc) in the token buffer slot.
  $B2F5,$03 Put back the command buffer position from the word scratch.
  $B2F8,$04 Put back the word buffer position from the word pointer.
  $B2FC,$04 Put back the word counter from *#R$AF49.
  $B300,$03 Jump to #R$B265.
@ $B303 label=VocabularyWordNoMatch
N $B303 This vocabulary word did not match. Step past the remaining letters.
. A comma keeps the same token for a synonym; anything else advances the token
. number for the next entry.
  $B303,$03 Turn the remaining letter count into a 16-bit offset in #REGde.
  $B306,$01 Move #REGhl past the unmatched letters.
  $B307,$01 Fetch the next vocabulary byte into #REGa.
  $B308,$04 Jump to #R$B30F if this byte is not a comma (#N$2C).
  $B30C,$01 Move past the comma.
  $B30D,$02 Jump to #R$B2DA to try matching the synonym.
@ $B30F label=VocabularyNextEntry
  $B30F,$01 Advance the token number for the next vocabulary entry.
  $B310,$02 Jump to #R$B2D5.
@ $B312 label=ProcessUnrecognisedWords
N $B312 All recognised words have been tokenised. Now check if there are any
. unrecognised words remaining in the input. If so, display an error message to
. the player showing which word(s) weren't understood.
  $B312,$03 Load the pointer for the word scratch into #REGhl.
  $B315,$04 Restore the word pointer.
  $B319,$04 Restore the word count.
  $B31D,$04 Count the words still to check.
  $B321,$03 Point #REGhl at #R$AEFC.
@ $B324 label=ProcessUnrecognisedWords_Loop
  $B324,$01 Count off one recognised word; the unrecognised word is reached when
. the count runs out.
  $B325,$02 Jump to #R$B33F if #REGc is equal to #N$0A (no unrecognised words
. found).
@ $B327 label=FindUnrecognisedWord_Loop
  $B327,$01 Read the character from *#REGhl and store it in #REGa.
  $B328,$04 Jump to #R$B333 if the character is an ASCII "SPACE" (#N$20).
  $B32C,$04 Jump to #R$B333 if the character is an ASCII comma (#N$2C).
  $B330,$01 Move to the next character in the command buffer.
  $B331,$02 Keep reading this unrecognised word.
@ $B333 label=SkipDelimiters_Loop2
  $B333,$01 Move to the next character in the command buffer.
  $B334,$01 Read the character from *#REGhl and store it in #REGa.
  $B335,$04 Jump to #R$B333 if the character is an ASCII "SPACE" (#N$20).
  $B339,$04 Jump to #R$B333 if the character is an ASCII comma (#N$2C).
  $B33D,$02 Look for the next unrecognised word.
@ $B33F label=PrintUnrecognisedWord
N $B33F Print the unrecognised word(s) in quotes.
  $B33F,$01 Remember where the unrecognised word starts.
  $B340,$06 Print "#MESSAGE$AF6D" and start a new line.
  $B346,$01 Restore the start of the unrecognised word from the stack.
  $B347,$02 Open a quote around the unrecognised word.
  $B349,$03 Call #R$AC47 to print the character.
@ $B34C label=PrintUnrecognisedWord_Loop
  $B34C,$01 Read the character from *#REGhl and store it in #REGa.
  $B34D,$04 Jump to #R$B357 if this character is less than #N$21 (a control
. character, indicating end of word).
  $B351,$01 Move to the next character in the command buffer.
  $B352,$03 Call #R$AC47 to print the character.
  $B355,$02 Print the next character of the unrecognised word.
@ $B357 label=PrintUnrecognisedWord_End
  $B357,$02 Close the quote around the unrecognised word.
  $B359,$03 Call #R$AC47 to print the character.
  $B35C,$06 Print "#MESSAGE$B10B" and start a new line.
  $B362,$02 Read another command.

c $B364 Handler: Unknown Word
@ $B364 label=HandlerUnknownWord
E $B364 View the equivalent code in;
. #LIST
. { #FOREST$C0B4 }
. { #ANDROMEDA$6745 }
. LIST#
D $B364 Answer a command the game cannot parse.
  $B364,$03 Read the first word token into #REGa.
  $B367,$03 Return when the command contains a word.
  $B36A,$06 Print "#MESSAGE$AF59" and start a new line.
  $B370,$03 Continue at #R$B200.

c $B373 Process Game Events
@ $B373 label=GameEventsProcessor
E $B373 View the equivalent code in;
. #LIST
. { #SHOCK$A280 }
. { #FOREST$BECE }
. { #JEWELS$C17D }
. { #WARLORD$AB0A }
. LIST#
D $B373 Advance turn-based events, then any scenic events, before the player
. types again.
N $B373 First process the turn-based events (if any are active).
  $B373,$03 Load the turn-based event flags into #REGa.
  $B376,$03 Jump to #R$B3A5 if no turn-based events are currently active.
N $B379 Eight turn-based events share the flag byte.
  $B379,$01 Copy the turn-based event flags into #REGc.
  $B37A,$02 Set a counter in #REGb for the number of possible turn-based events
. (#N$08).
N $B37C Keep shifting the event flags one-by-one to find which bits are set.
@ $B37C label=GameEventChecker_Loop
  $B37C,$02 Test the next turn-based event flag.
  $B37E,$02 Jump to #R$B3A3 if this event bit is not set.
N $B380 Count down this event's timer.
  $B380,$03 Initialise #REGde to #N$0000.
  $B383,$03 #REGhl=#R$AE89.
  $B386,$04 Calculate the event index (#N$08-#REGb) and store it in #REGe.
  $B38A,$01 Point #REGhl at this event's countdown timer.
  $B38B,$01 Decrease this event's countdown timer by one.
  $B38C,$02 Jump to #R$B3A3 if this event's countdown timer is still running.
N $B38E The timer has expired, so run this event's handler.
  $B38E,$04 #REGix=*#R$AED2.
  $B392,$02 Double the event index, as each entry in the table is two bytes.
  $B394,$02 Point #REGix at this event's entry in the table.
  $B396,$06 Read that handler's address into #REGhl.
  $B39C,$01 Stash #REGbc on the stack.
  $B39D,$04 Stash #R$B3A2 on the stack so the next return resumes event
. processing.
  $B3A1,$01 Jump to the routine pointed to by *#REGhl to action the current
. event.
N $B3A2 Once the event handler has run, this is where the routine will resume.
@ $B3A2 label=GameEventChecker_Return
  $B3A2,$01 Restore #REGbc from the stack.
@ $B3A3 label=GameEventChecker_Next
N $B3A3 Test the next turn-based event.
  $B3A3,$02 Decrease the event bit counter by one and loop back to #R$B37C
. until all eight events have been considered.
N $B3A5 Now handle the scenic events.
@ $B3A5 label=GameScenicEventsProcessor
  $B3A5,$01 #HTML(A spare <code>NOP</code>, probably where an instruction was
. patched out, before the scenic events are processed.)
  $B3A6,$03 #REGhl=*#R$AEEC.
  $B3A9,$04 Fetch the number of active scenic events from #R$AEF8.
  $B3AD,$02 Jump to #R$B3F0 if there are no active scenic events.
  $B3AF,$01 Set a counter in #REGb for the number of scenic events.
  $B3B0,$02 Jump to #R$B3B3 to process the first scenic event without
. advancing the table pointer.
@ $B3B2 label=GameScenicEventChecker_Loop
N $B3B2 Room #N$00 means this scenic item is inactive.
  $B3B2,$01 Move on to the next scenic item.
@ $B3B3 label=GameScenicEventChecker
  $B3B3,$01 Fetch this scenic event's item ID.
  $B3B4,$01 Stash the scenic event table pointer on the stack.
  $B3B5,$03 Call #R$B5C6 to read which room holds the item.
  $B3B8,$01 Restore the scenic event table pointer from the stack.
  $B3B9,$03 Jump to #R$B3EE if the item is inactive.
N $B3BC An event that is already in the player's room stays there.
  $B3BC,$01 Hold this event's room in #REGc.
  $B3BD,$03 #REGa=*#R$AECD.
  $B3C0,$03 Jump to #R$B3EE if this event's room is the current room.
N $B3C3 Pick a room for this scenic event.
  $B3C3,$02 Stash #REGbc and #REGhl on the stack.
  $B3C5,$05 Calculate which event's group this is.
N $B3CA Point at this event's room list.
  $B3CA,$04 #REGix=*#R$AEEE.
  $B3CE,$03 Call #R$B3F1 to look up the table entry.
N $B3D1 The frame counter picks how far to walk into the room group.
. #N$FF ends the group and the walk wraps.
  $B3D1,$04 Call #R$AC69 to pick a random step count and store it in #REGb.
  $B3D5,$02 #REGa=the room group terminator (#N$FF).
@ $B3D7 label=GameScenicEvent_FetchRoomGroup
  $B3D7,$06 Point #REGhl at the start of this room group.
  $B3DD,$02 Jump to #R$B3E0.
@ $B3DF label=GameScenicEvent_CountRooms_Loop
N $B3DF Walk the room group. #N$FF restarts it, and the frame count chooses
. where to stop. Then move the scenic item there.
  $B3DF,$01 Move to the next room in the group.
@ $B3E0 label=GameScenicEvent_CountRoomsInGroup
  $B3E0,$03 Jump back to #R$B3D7 when the terminator matches.
  $B3E3,$02 Decrease the step counter by one and loop back to #R$B3DF until
. the counter is zero.
  $B3E5,$01 Fetch the destination room into #REGc.
  $B3E6,$01 Restore the scenic event table pointer from the stack.
  $B3E7,$01 Fetch this scenic event's item ID into #REGb.
  $B3E8,$01 Stash the scenic event table pointer on the stack.
  $B3E9,$03 Call #R$B5FD to store the item's room.
  $B3EC,$02 Restore #REGhl and #REGbc from the stack.
@ $B3EE label=GameScenicEventChecker_Next
N $B3EE Move on to the next scenic event.
  $B3EE,$02 Decrease the scenic event counter by one and loop back to
. #R$B3B2 until every scenic event has been considered.
N $B3F0 All done, now return.
@ $B3F0 label=GameEventsProcessor_Return
  $B3F0,$01 Return.

c $B3F1 Get Table Entry
@ $B3F1 label=GetTableEntry
E $B3F1 View the equivalent code in;
. #LIST
. { #SHOCK$A305 }
. { #FOREST$C0C3 }
. { #JEWELS$C1F0 }
. { #ANDROMEDA$6754 }
. { #WARLORD$AB88 }
. LIST#
D $B3F1 Look up one entry in a word table.
R $B3F1 E Index of item
R $B3F1 IX Base table address
R $B3F1 O:HL Address from the relevant table entry
R $B3F1 O:IX Address of the table entry
  $B3F1,$06 Double the entry index so it addresses a word in the table.
  $B3F7,$02 Step to the chosen entry in the word table.
  $B3F9,$06 Read the address stored in that entry.
  $B3FF,$01 Return.

c $B400 Print Objects
@ $B400 label=PrintObjects
E $B400 View the equivalent code in;
. #LIST
. { #SHOCK$A314 }
. { #FOREST$C0D2 }
. { #JEWELS$C1FF }
. { #ANDROMEDA$6763 }
. { #WARLORD$AB97 }
. LIST#
D $B400 List the objects the player can see in this room.
R $B400 A #N$01 for inventory items, or room number for room objects
  $B400,$03 Point #REGhl at #R$AD76.
  $B403,$04 Load the number of items into #REGbc.
N $B407 Search #R$AD76 for the next object in this place.
@ $B407 label=PrintObjects_Loop
  $B407,$02 Search #R$AD76 for the next item in this room.
  $B409,$01 Return if no matching items remain.
  $B40A,$01 Stash the current place in #R$AD76 on the stack.
  $B40B,$03 Call #R$B64B to see whether this item has a description.
  $B40E,$02 Skip an item that has no description.
  $B410,$02 Remember the room ID and the remaining count while the name is
. printed.
  $B412,$03 Call #R$AC35 to print the string and start a new line.
  $B415,$02 Restore the remaining count and the room ID from the stack.
N $B417 Move on to the next object in the table.
@ $B417 label=PrintObjects_Next
  $B417,$01 Hold the room ID in #REGe.
  $B418,$01 Restore the current place in #R$AD76 from the stack.
  $B419,$02 See whether any items remain.
  $B41B,$01 Restore the room ID to #REGa.
  $B41C,$02 Jump back to #R$B407 until all objects in the table have been
. checked.
N $B41E All matching objects have been printed.
  $B41E,$01 Return.

c $B41F Handler: Display Room Image
@ $B41F label=HandlerDisplayRoomImage
E $B41F View the equivalent code in;
. #LIST
. { #JEWELS$C21E }
. { #WARLORD$ABB6 }
. LIST#
D $B41F Show the picture for the current room when that room has one.
R $B41F E #N$01 If the image should be displayed, #N$00 if it should be skipped
N $B41F The game can also load without any graphics at all, so bail if there's
. nothing needed to do here.
  $B41F,$06 Jump to #R$B46B if the picture-room count is set to zero.
N $B425 The version of the game being played DOES have graphics, so continue.
  $B425,$03 Fetch the current room and load it into #REGa.
  $B428,$03 Fetch the address of the table from the rooms-with-images pointer.
  $B42B,$04 Fetch the count of the number of rooms in the table from the
. picture-room count.
  $B42F,$02 Search to see if the current room ID is in the table.
  $B431,$02 Jump to #R$B46B if the current room ID does not appear in the
. table.
N $B433 The current room does have an image associated with it.
  $B433,$03 Read the picture-room count into #REGa.
  $B436,$03 Turn the picture search into this room's image index.
N $B439 The #REGe register is used as a flag to indicate that the room image
. should not be displayed, e.g. after the player has requested to view their
. inventory and have seen the room image already when they entered the location.
  $B439,$04 Jump to #R$B459 if #REGe was set to #N$01 (Display the image).
N $B43D The game also maintains a table of "already seen room images" so the
. player doesn't have to view an image for a room they've already been in.
N $B43D The player can view it manually by typing "LOOK" (or just "L").
  $B43D,$03 Point #REGhl at #R$AE7E.
  $B440,$01 Copy the room image index into #REGa.
@ $B441 label=FindAlreadySeenByte_Loop
N $B441 Only two bytes hold the data for all #N$0A rooms with images so
. first - find the correct byte which references this room.
  $B441,$04 Jump to #R$B44A if the room index is less than #N$08.
  $B445,$02 Move this room into the next flag byte.
  $B447,$01 Increment the "image already seen" table pointer by one.
  $B448,$02 Jump back to #R$B441 until the flag byte for this room is found.
@ $B44A label=FoundAlreadySeenByte
N $B44A Now the correct byte has been found, check the appropriate bit.
N $B44A Create a mask with a single bit set corresponding to this rooms position
. (0-7) in the byte.
  $B44A,$01 Copy the "image already seen" byte into #REGb.
  $B44B,$01 Include a shift for bit 0.
  $B44C,$02 Start with all bits clear in #REGd.
@ $B44E label=AlreadySeenBitShift_Loop
  $B44E,$04 Slide this room's bit into place.
N $B452 Test the bit held in #REGd against the room flag.
  $B452,$01 Fetch the current room flag.
  $B453,$03 If the room image has already been seen ... jump to #R$B46B.
N $B456 The room image hasn't already been seen, so update the bit to indicate
. that the player will have viewed it for the next time this routine runs.
  $B456,$03 Merge the set room bit with the room flags and write the result
. back to the room flag byte.
@ $B459 label=DisplayRoomImage
N $B459 Finally! Display the room image.
  $B459,$05 Call #R$ABF1 to clear the screen, keeping the location image index
. in #REGc.
  $B45E,$04 Fetch the address of the table from the room-image jump pointer.
  $B462,$01 Load the location image index into #REGe.
  $B463,$03 Call #R$B3F1 to look up the table entry.
  $B466,$04 Push #R$B46B onto the stack so that the next return will go on to
. show the room exits.
  $B46A,$01 Jump to the routine pointed to by *#REGhl to display the room
. image.

c $B46B Handler: Display Room Exits
@ $B46B label=HandlerDisplayRoomExits
E $B46B View the equivalent code in;
. #LIST
. { #SHOCK$A33A }
. { #FOREST$C0F9 }
. { #JEWELS$C26A }
. { #ANDROMEDA$678A }
. { #WARLORD$AC02 }
. LIST#
D $B46B Print the exits that leave the current room.
  $B46B,$03 Call #R$ABF1 to clear the screen.
  $B46E,$05 Set up the printing position.
  $B473,$03 Call #R$B503 which loads #REGhl with the room data pointer.
  $B476,$02 Store this in #REGde for later.
N $B478 Count the number of exits in the room data.
  $B478,$02 Set an "exits" counter in #REGb of #N$06.
  $B47A,$02 Initialise #REGc to #N$00 to count the number of valid exits.
  $B47C,$01 Set #REGa to #N$00 which is used just for the comparison.
@ $B47D label=RoomExitsCount_Loop
  $B47D,$01 Does this room have an exit?
  $B47E,$02 Jump to #R$B481 if this room doesn't have an exit for this
. position.
  $B480,$01 Increment the valid exits count by one.
@ $B481 label=RoomExitsCount_Skip
  $B481,$01 Move to the next byte of room data.
  $B482,$02 Decrease the exits counter by one and loop back to #R$B47D until
. all the exits have been checked.
N $B484 Process the exits count result.
  $B484,$03 Jump to #R$B4EF if no exits were found.
  $B487,$05 Jump to #R$B4AE if more than #N$01 exit was found.
N $B48C Only one exit was found:
  $B48C,$06 Print "#MESSAGE$AFB4".
  $B492,$02 Retrieve the room data pointer and load it into #REGhl.
  $B494,$04 Set a pointer in #REGix to #R$B1D8.
  $B498,$01 Set #REGa to #N$00 which is used just for the comparison.
  $B499,$02 Start at the north exit.
N $B49B Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $B49B label=RoomCheckForExit_Loop
  $B49B,$01 Move to the next byte of room data.
  $B49C,$04 Increment the direction name table pointer by two.
@ $B4A0 label=RoomCheckForExit
  $B4A0,$03 Jump to #R$B49B if the current exit isn't a valid exit.
  $B4A3,$06 Get the direction name from the direction name table.
  $B4A9,$03 Call #R$AC28 to print the direction name.
  $B4AC,$02 Finish the exit sentence.
N $B4AE More than one exit was found:
@ $B4AE label=RoomMultipleExits
  $B4AE,$06 Print "#MESSAGE$AFA1" and start a new line.
  $B4B4,$02 Retrieve the room data pointer and load it into #REGhl.
  $B4B6,$04 Set a pointer in #REGix to #R$B1D8.
  $B4BA,$01 Set #REGa to #N$00 which is used just for the comparison.
  $B4BB,$02 Start at the north exit.
N $B4BD So as not to corrupt the pointer to the room data (as #REGhl is also
. used when printing), it's temporarily held in #REGde.
@ $B4BD label=RoomExits_Initialise
  $B4BD,$01 Bring the room data pointer back into #REGhl.
N $B4BE Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $B4BE label=RoomCheckForExits_Loop
  $B4BE,$01 Move to the next byte of room data.
  $B4BF,$04 Increment the direction name table pointer by two.
@ $B4C3 label=RoomCheckForExits
  $B4C3,$03 Jump to #R$B4BE if the current exit isn't a valid exit.
  $B4C6,$01 Temporarily store the room data pointer in #REGde.
  $B4C7,$06 Get the direction name from the direction name table.
  $B4CD,$03 Call #R$AC28 to print the direction name.
  $B4D0,$01 Decrease the valid exits count by one.
  $B4D1,$05 Jump to #R$B4E9 if there are no more exits to process.
  $B4D6,$02 Jump to #R$B4E0 if there is only one exit left to process.
N $B4D8 #HTML(Print a comma character: "<code>#CHR$2C</code>".)
  $B4D8,$02 Print a comma between the exit names.
  $B4DA,$03 Call #R$AC47 to print the character.
  $B4DD,$01 Reset #REGa back to #N$00 for the comparison.
  $B4DE,$02 Jump back to #R$B4BD to continue processing.
@ $B4E0 label=RoomExits_PrintAmpersand
  $B4E0,$06 Print "#MESSAGE$AF9D".
  $B4E6,$01 Reset #REGa back to #N$00 for the comparison.
  $B4E7,$02 Jump to #R$B4BD to continue processing.
@ $B4E9 label=RoomExits_PrintFullStop
  $B4E9,$06 Print "#MESSAGE$B10B" and start a new line.
N $B4EF Are there any objects here?
@ $B4EF label=RoomExits_YouCanSee
  $B4EF,$03 Read the current room into #REGa.
  $B4F2,$03 Call #R$B62E to see which objects are in the room.
  $B4F5,$01 Return if no objects were found at this location.
  $B4F6,$06 Print "#MESSAGE$AF8E" and start a new line.
N $B4FC Print the objects at this location.
  $B4FC,$03 Read the current room into #REGa.
  $B4FF,$03 Call #R$B400 to list the objects here.
N $B502 The exits and objects for this room are done.
  $B502,$01 Return.

c $B503 Get Room Pointer
@ $B503 label=GetRoomPointer
E $B503 View the equivalent code in;
. #LIST
. { #SHOCK$A41C }
. { #FOREST$C201 }
. { #JEWELS$C302 }
. { #ANDROMEDA$6892 }
. { #WARLORD$AC9A }
. LIST#
D $B503 Point at the current room's six exit bytes.
R $B503 O:HL Pointer to the room data
  $B503,$03 Read the current room into #REGa.
  $B506,$0A Turn the room number into an offset of six bytes in the room map.
  $B510,$04 Load the register pair from the room-map pointer.
  $B514,$01 Point at this room's exits.
  $B515,$01 Return.

c $B516 Print Room Description
@ $B516 label=PrintRoomDescription
E $B516 View the equivalent code in;
. #LIST
. { #SHOCK$A42F }
. { #JEWELS$C315 }
. { #WARLORD$ACAD }
. LIST#
D $B516 Print the description of the current room.
R $B516 A Line number to begin printing
  $B516,$03 Store #REGa in the screen line.
  $B519,$03 Call #R$AC0D to park the cursor on the current screen line.
  $B51C,$03 Read the current room into #REGa.
  $B51F,$04 Load #REGix from the room-description pointer.
  $B523,$01 Use the room number to find its description.
  $B524,$03 Call #R$B3F1 to look up the table entry.
  $B527,$03 Call #R$AC35 to print the string and start a new line.
  $B52A,$01 Return.

c $B52B Parser: Check Object Is Here
@ $B52B label=Parser_CheckObjectIsHere
E $B52B View the equivalent code in;
. #LIST
. { #SHOCK$A591 }
. { #FOREST$C213 }
. { #JEWELS$C32A }
. { #ANDROMEDA$68A4 }
. { #WARLORD$AE36 }
. LIST#
D $B52B Carry out the "Examine Item" command.
R $B52B BC Count left by the object-list search
R $B52B O:F Carry flag set when the object isn't here
  $B52B,$06 Turn the search position into this object's index.
  $B531,$01 Remember the object index.
  $B532,$04 Point #REGix at the item groups.
  $B536,$03 Call #R$B3F1 to look up the table entry.
  $B539,$01 Restore the object index from the stack.
  $B53A,$02 Check the first item in this group.
@ $B53C label=ExamineItem_Loop
  $B53C,$01 Step to the next item in this group.
@ $B53D label=ExamineItem
  $B53D,$05 Jump to #R$B548 if *#REGhl is equal to #N$FF.
  $B542,$03 Call #R$B560 to find where the object is.
  $B545,$02 Jump to #R$B53C if the item wasn't found.
  $B547,$01 Return.
N $B548 The item being examined isn't in the room or in the players inventory.
@ $B548 label=Response_ItemNotHere
  $B548,$06 Print "#MESSAGE$AFE5".
N $B54E Print the object name.
  $B54E,$04 Point #REGix at the noun for this item.
  $B552,$03 Call #R$B3F1 to look up the table entry.
  $B555,$03 Call #R$AC28 to print the string.
  $B558,$06 Print "#MESSAGE$AFF2" and start a new line.
  $B55E,$01 Set the carry flag to report that the item isn't here, so the
. command goes no further.
  $B55F,$01 Return.

c $B560 Validate If Item Is Present
@ $B560 label=ValidateItemPresent
E $B560 View the equivalent code in;
. #LIST
. { #SHOCK$A5C6 }
. { #FOREST$C24F }
. { #JEWELS$C35F }
. { #ANDROMEDA$68E0 }
. { #WARLORD$AE6B }
. LIST#
D $B560 Get Object Location.
R $B560 A Object ID
R $B560 O:F Z flag set if the object is available
  $B560,$02 Stash #REGhl and #REGde on the stack.
  $B562,$07 #REGhl=#R$AD76 + the object ID.
  $B569,$03 #REGa=*#R$AECD.
N $B56C Jump to #R$B572 if the object/ event table states that it's located
. in *#R$AECD(the current room). Note also sets/ unsets the Z flag
. accordingly.
  $B56C,$03 Jump to #R$B572 if the object is in the current room.
N $B56F Check the players inventory, as an object can still be used if it's
. being held.
  $B56F,$03 Lastly, set the Z flag if the item is in the players inventory.
@ $B572 label=Handler_Objects_Return
N $B572 Housekeeping; restore #REGde and #REGhl to their previous values.
  $B572,$02 Restore #REGde and #REGhl from the stack.
  $B574,$01 Return.

c $B575 Match Phrase Tokens
@ $B575 label=MatchPhraseTokens
E $B575 View the equivalent code in;
. #LIST
. { #SHOCK$A5DB }
. { #FOREST$C26F }
. { #JEWELS$C37F }
. { #ANDROMEDA$6900 }
. { #WARLORD$AE80 }
. LIST#
D $B575 Match Phrase Tokens.
R $B575 HL A pointer to phrase token data
R $B575 O:F The Z flag is set if the input matches any pattern
  $B575,$01 Move the phrase token pointer into #REGde.
  $B576,$02 Start the match at the first pattern byte, #R$B579.
@ $B578 label=Match_PhraseTokens_Loop
  $B578,$01 Advance #REGde to the next byte.
@ $B579 label=MatchPhraseTokens_Next
  $B579,$03 Point #REGhl at the second word token.
  $B57C,$02 Compare the command from its first word at #R$B580.
@ $B57E label=MatchPhraseTokens_Loop
  $B57E,$01 Advance #REGhl to the next byte.
  $B57F,$01 Advance #REGde to the next byte.
@ $B580 label=Match_PhraseTokens_Compare
  $B580,$01 Read the next vocabulary byte into #REGa.
  $B581,$03 Branch to #R$B57E when the byte at #REGhl means the values match.
  $B584,$04 Branch to #R$B58C when #N$FE means the values differ.
  $B588,$04 Accept the phrase when the command has ended.
@ $B58C label=Match_PhraseTokens_Alternative
  $B58C,$04 Branch to #R$B596 when #N$FD means the values differ.
  $B590,$06 Match this alternative when the command has ended, and try the next
. one when the player typed another word.
@ $B596 label=Match_PhraseTokens_Skip
  $B596,$01 Advance #REGde to the next byte.
  $B597,$01 Read the next vocabulary byte into #REGa.
  $B598,$04 Branch to #R$B5A2 when #N$FE means the values match.
  $B59C,$04 Branch to #R$B596 when #N$FD means the values differ.
  $B5A0,$02 Try the next phrase alternative at #R$B578.
@ $B5A2 label=Match_PhraseTokens_Done
  $B5A2,$01 Test #REGa so the following branch can see whether it is zero.
  $B5A3,$01 Return.

c $B5A4 Parser: Count Item References
@ $B5A4 label=ParserCountItemReferences
E $B5A4 View the equivalent code in;
. #LIST
. { #SHOCK$A60A }
. { #FOREST$C29E }
. { #JEWELS$C3AE }
. { #ANDROMEDA$692F }
. { #WARLORD$AEAF }
. LIST#
D $B5A4 Parser: Count Item References.
R $B5A4 O:A The number of references to items in the user input tokens
R $B5A4 O:E As #REGa
R $B5A4 O:F The Z flag is set when there are no items present in the input
  $B5A4,$03 Set a pointer to the first word token in #REGhl.
  $B5A7,$02 Set a token count in #REGb of #N$0A which is the total length of
. the user input tokens.
  $B5A9,$02 Initialise the item counter held in #REGe to #N$00.
@ $B5AB label=Parser_CountItems_Loop
  $B5AB,$01 Fetch a user input token.
  $B5AC,$04 Jump to #R$B5C3 if the terminator character (#N$FF) has been
. reached.
  $B5B0,$02 Remember the token and the count while the object list is searched.
  $B5B2,$03 Load the object list table pointer into #REGhl.
  $B5B5,$04 Fetch the count of the number of items in the table from the object
. count.
  $B5B9,$02 Search to see if the item room ID is in the table.
  $B5BB,$02 Restore #REGbc, #REGhl from the stack.
  $B5BD,$02 Jump to #R$B5C0 if this token doesn't refer to a game item.
N $B5BF This token does point to a game item, so increase the item counter.
  $B5BF,$01 Increment item counter by one.
@ $B5C0 label=Parser_CountItems_Skip
  $B5C0,$01 Move to the next token.
  $B5C1,$02 Decrease the token counter by one and loop back to #R$B5AB until
. all the tokens have been evaluated.
@ $B5C3 label=Parser_CountItems_Process
  $B5C3,$02 Leave the number of items named in the command in #REGa. The zero
. flag is set when none were named.
  $B5C5,$01 Return.

c $B5C6 Get Item Room
@ $B5C6 label=GetItemRoom
E $B5C6 View the equivalent code in;
. #LIST
. { #SHOCK$A62C }
. { #FOREST$C2BE }
. { #JEWELS$C3D0 }
. { #ANDROMEDA$694F }
. { #WARLORD$AED1 }
. LIST#
D $B5C6 Get Item Room.
  $B5C6,$07 Look this item up in the item-location table.
  $B5CD,$01 Read the room that holds this item.
  $B5CE,$01 Return.

c $B5CF Is Object In Inventory?
@ $B5CF label=IsObjectInInventory
E $B5CF View the equivalent code in;
. #LIST
. { #SHOCK$A635 }
. { #JEWELS$C3E4 }
. { #WARLORD$AEDA }
. LIST#
D $B5CF Is Object In Inventory?.
R $B5CF A Object ID
R $B5CF O:F Z flag set if object is in the players inventory
N $B5CF The #R$B5C6 routine returns with #REGa containing the room ID of the
. requested object.
  $B5CF,$03 Call #R$B5C6.
  $B5D2,$02 See whether that room is the inventory.
  $B5D4,$01 Return.

c $B5D5 Handler: Destroy Item/ Event
@ $B5D5 label=HandlerDestroyItemEvent
E $B5D5 View the equivalent code in;
. #LIST
. { #SHOCK$A63B }
. { #FOREST$C2D8 }
. { #JEWELS$C3EA }
. { #WARLORD$AEE0 }
. LIST#
D $B5D5 Destroy Item/ Event.
R $B5D5 A Item/ event ID
  $B5D5,$01 Hold the item while its room is cleared.
  $B5D6,$05 Call #R$B5FD to store the item's room.
  $B5DB,$01 Return.

c $B5DC Handler: Update Item/ Event For The Current Room
@ $B5DC label=HandlerUpdateItemEventForTheCurrentRoom
E $B5DC View the equivalent code in;
. #LIST
. { #SHOCK$A642 }
. { #FOREST$C2DF }
. { #JEWELS$C3F1 }
. { #WARLORD$AEE7 }
. LIST#
D $B5DC Update Item/ Event For The Current Room.
R $B5DC A Item/ event ID
  $B5DC,$01 Hold the item while the current room is read.
  $B5DD,$03 Read the current room into #REGa.
  $B5E0,$01 Give the item the player's current room.
  $B5E1,$03 Call #R$B5FD to store the item's room.
  $B5E4,$01 Return.

c $B5E5 Handler: Set Scenic Event As Triggered
@ $B5E5 label=ScenicEventTriggered
E $B5E5 View the equivalent code in;
. #LIST
. { #SHOCK$A64B }
. { #JEWELS$C3FA }
. { #WARLORD$AEF0 }
. LIST#
D $B5E5 Mark the scenic event in #REGa as already fired. The scenic-event
. count is zero, so nothing calls this routine.
R $B5E5 A Scenic event id
  $B5E5,$01 Copy the scenic event id into #REGb.
  $B5E6,$02 Use #N$FF for #REGc so the event is not repeated.
  $B5E8,$03 Call #R$B5FD to store the item's room.
  $B5EB,$01 Return.

c $B5EC Check Active Scenic Events
@ $B5EC label=CheckActiveScenicEvents
E $B5EC View the equivalent code in;
. #LIST
. { #SHOCK$A652 }
. { #JEWELS$C401 }
. LIST#
D $B5EC Check Active Scenic Events.
R $B5EC HL Pointer to scenic data
R $B5EC O:A The listed item that is here, or #N$FF if there is none
R $B5EC O:F The zero flag is set when an item on the list is here or carried
  $B5EC,$02 Check the first scenic item at #R$B5EF.
@ $B5EE label=CheckActiveScenicEvents_Loop
  $B5EE,$01 Advance #REGhl to the next byte.
@ $B5EF label=CheckActiveScenicEvents_Next
  $B5EF,$01 Read the next scenic item.
  $B5F0,$04 Stop at the end of the scenic list.
  $B5F4,$03 Call #R$B560 to find where the object is.
  $B5F7,$02 Try the next entry when this one is not here or carried.
  $B5F9,$02 Return the scenic item that is here.
@ $B5FB label=Check_ActiveScenicEvents_Done
  $B5FB,$01 Clear the zero flag (#REGa holds the #N$FF end marker) to report
. that nothing on the list is here.
  $B5FC,$01 Return.

c $B5FD Set Item Room
@ $B5FD label=SetItemRoom
E $B5FD View the equivalent code in;
. #LIST
. { #SHOCK$A663 }
. { #WARLORD$AF08 }
. LIST#
D $B5FD Set Item Room.
  $B5FD,$03 Point #REGhl at the item-location table.
  $B600,$05 Write the room into the item's slot in the item-location table.
  $B605,$01 Return.

c $B606 Find Active Scenic Event
@ $B606 label=FindActiveScenicEvent
D $B606 Walk the scenic-event list at #REGhl and return the index of the
. first one that matches.
  $B606,$02 Start the index at #N$00.
  $B608,$02 Check the first scenic event at #R$B60C.
@ $B60A label=FindActiveScenicEvent_Loop
  $B60A,$01 Advance the index in #REGb.
  $B60B,$01 Advance #REGhl to the next event.
@ $B60C label=FindActiveScenicEvent_Next
  $B60C,$03 Call #R$B5EC to check the scenic events.
  $B60F,$02 Branch to #R$B60A to count each listed item that is here, until the
. end of the list.
  $B611,$01 Copy the index into #REGa.
  $B612,$01 Return.

c $B613 Transform Item
@ $B613 label=TransformItem
E $B613 View the equivalent code in;
. #LIST
. { #SHOCK$A679 }
. { #FOREST$C48F }
. { #JEWELS$C426 }
. { #WARLORD$AF1E }
. LIST#
R $B613 B From item ID (the item to be destroyed)
R $B613 C To item ID (the item to be created)
D $B613 Transforms one item into another by destroying the "from" item and
. creating the "to" item in the same location. Rather than use item
. properties, the game just has separate objects that don't exist until an
. action is performed.
N $B613 Get the location of the "from" item so the "to" item can be created in
. the same place.
  $B613,$01 Copy the "from" item ID into #REGa.
  $B614,$03 Call #R$B5C6 to get the room ID where the "from" item is located
. (returns in #REGa).
  $B617,$02 Remember the items and the room while the first is removed.
N $B619 Destroy the "from" item by setting its location to #N$00 (inactive).
  $B619,$02 Set the room ID to #N$00 to deactivate the "from" item.
  $B61B,$03 Call #R$B5FD to update the "from" item's location to #N$00.
  $B61E,$02 Restore #REGaf, #REGbc from the stack.
N $B620 Create the "to" item at the same location where the "from" item was.
  $B620,$01 Copy the "to" item ID into #REGb.
  $B621,$01 Copy the location (from #REGa) into #REGc.
  $B622,$03 Call #R$B5FD to create the "to" item at the stored location.
  $B625,$01 Return.

c $B626 Is Item In Current Room
@ $B626 label=IsItemInCurrentRoom
E $B626 View the equivalent code in;
. #LIST
. { #SHOCK$A68C }
. { #WARLORD$AF31 }
. LIST#
D $B626 Compare the item's room with the room the player is in.
R $B626 A Item id
R $B626 O:F The zero flag is set when the item is in the current room
  $B626,$03 Call #R$B5C6 to read which room holds the item.
  $B629,$03 Point #REGhl at #R$AECD.
  $B62C,$01 See whether the item is in this room.
  $B62D,$01 Return.

c $B62E Check Room Objects
@ $B62E label=CheckRoomObjects
E $B62E View the equivalent code in;
. #LIST
. { #SHOCK$A694 }
. { #JEWELS$C439 }
. { #WARLORD$AF39 }
. LIST#
D $B62E Check Room Objects.
R $B62E A Room number
R $B62E O:A #N$00 or #N$01 if objects are found or not
  $B62E,$03 Point #REGhl at the item-location table.
  $B631,$04 Take the length of the item-location table.
@ $B635 label=CheckRoomObjects_Loop
  $B635,$02 Search for the room number in the table.
  $B637,$01 Return if no objects are found.
  $B638,$01 Keep the object location table pointer on the stack.
  $B639,$03 Call #R$B64B to check that the object is here.
  $B63C,$01 Restore the object location table pointer from the stack.
  $B63D,$02 Jump to #R$B649 if there are no objects found here.
  $B63F,$01 Temporarily store #REGa in #REGe.
  $B640,$02 Are there more objects to check?
  $B642,$01 Put back the #REGa register.
  $B643,$02 Jump to #R$B635 if there are more objects to check.
N $B645 Set the "successful" output.
  $B645,$02 Set #REGa to #N$01 to indicate that objects were found.
  $B647,$01 Clear the zero flag to report that objects were found.
  $B648,$01 Return.
N $B649 Set the "failure" output.
@ $B649 label=NoRoomObjectsFound
  $B649,$01 Set #REGa to #N$00 to indicate that no objects were found.
  $B64A,$01 Return.

c $B64B Validate Object
@ $B64B label=ValidateObject
E $B64B View the equivalent code in;
. #LIST
. { #SHOCK$A6B1 }
. { #JEWELS$C456 }
. { #WARLORD$AF56 }
. LIST#
D $B64B Validate Object.
  $B64B,$02 Remember the room and the search position.
  $B64D,$01 Advance #REGbc to the next byte.
  $B64E,$03 Read the item count into #REGa.
  $B651,$02 Turn the search position into this item's index.
  $B653,$07 Call #R$B3F1 to look up the table entry.
  $B65A,$01 Restore the search position from the stack.
  $B65B,$01 See whether this item has a description.
  $B65C,$01 Combine #REGl into the working value.
  $B65D,$02 Reject an item that has no description.
  $B65F,$01 Restore the room ID from the stack.
  $B660,$01 Test #REGa so the following branch can see whether it is zero.
  $B661,$01 Return.
@ $B662 label=ValidateObject_Next
  $B662,$01 Restore the room ID from the stack.
  $B663,$01 Report that this item has no description.
  $B664,$01 Return.

c $B665 Parser: Validate No Direct Object
@ $B665 label=ParserValidateNoDirectObject
E $B665 View the equivalent code in;
. #LIST
. { #SHOCK$ABF4 }
. { #FOREST$C2FE }
. { #JEWELS$C470 }
. { #ANDROMEDA$6972 }
. { #WARLORD$AF70 }
. LIST#
D $B665 Parser: Validate No Direct Object.
R $B665 O:F The Z flag is set when there's no direct object present
R $B665 O:F The carry flag is set when there's a second token set
  $B665,$06 Return if the second token (*#N$AF2F) is the terminator
. character (#N$FF).
  $B66B,$03 Call #R$B1E4 to ask the player to rephrase.
  $B66E,$01 Set the carry flag to indicate the command is malformed.
  $B66F,$01 Return.

c $B670 Parser: Validate Direct Object
@ $B670 label=ParserValidateDirectObject
E $B670 View the equivalent code in;
. #LIST
. { #SHOCK$AC02 }
. { #FOREST$C309 }
. { #JEWELS$C47B }
. { #ANDROMEDA$697D }
. { #WARLORD$AF7B }
. LIST#
D $B670 Parser: Validate Direct Object.
R $B670 O:F The carry flag is set when the command is malformed
N $B670 The first token is the verb, so target the second token for the direct
. object.
  $B670,$03 Fetch the #N$AF2F(second token from the user input) and store it in
. #REGa.
  $B673,$04 Jump forward to #R$B67C if the token is anything other than the
. terminator character (#N$FF).
N $B677 The token was the terminator character (#N$FF), so the sentence is
. malformed.
N $B677 E.g. They tried "TAKE" but didn't write anything after it.
  $B677,$03 Call #R$B1EB.
  $B67A,$01 Set the carry flag to indicate this call was a failure.
  $B67B,$01 Return.
N $B67C Process the direct object.
@ $B67C label=DirectObject_Process
  $B67C,$03 Call #R$B5A4.
  $B67F,$01 Return if #REGa is not equal to #N$FF.
  $B680,$03 Call #R$B1E4 to ask the player to rephrase.
  $B683,$01 Set the carry flag to indicate the command is malformed.
  $B684,$01 Return.

u $B685 Parser: Validate Input Tokens
@ $B685 label=Parser_ValidateInputTokens
E $B685 View the equivalent code in;
. #LIST
. { #SHOCK$AC1D }
. { #FOREST$C31E }
. { #JEWELS$C490 }
. { #ANDROMEDA$6992 }
. { #WARLORD$AF90 }
. LIST#
D $B685 Check the words after the verb, and ask for a rephrase when none of
. them is a known item. Nothing calls this routine.
R $B685 O:F The carry flag is set when the command is malformed
N $B685 The first token is the verb, so read the second token.
C $B685,$03 Read the second word token into #REGa.
C $B688,$02 Compare the token with the terminator.
C $B68A,$01 Return if there is no second token.
N $B68B There is a second token, so count the known items.
C $B68B,$03 Call #R$B5A4 to count how the command refers to the item.
C $B68E,$01 Return if a known item was named.
N $B68F The words are not known items.
C $B68F,$03 Call #R$B1E4 to ask the player to rephrase.
C $B692,$01 Mark the command as malformed.
C $B693,$01 Return.

c $B694 Parser: Validate Two Direct Objects
@ $B694 label=ParserValidateTwoDirectObjects
E $B694 View the equivalent code in;
. #LIST
. { #SHOCK$AC2F }
. { #FOREST$C32D }
. { #JEWELS$C49F }
. { #WARLORD$AF9F }
. LIST#
D $B694 Parser: Validate Two Direct Objects.
R $B694 O:F The carry flag is set when the command is malformed
  $B694,$03 Call #R$B670 to check that the command names an object.
  $B697,$01 Return if there is no direct object in the user input (so the
. command is malformed).
N $B698 #REGa now contains the count of the number of valid direct objects.
  $B698,$04 Jump to #R$B6A1 if the number of valid direct objects in the user
. input is not #N$01.
N $B69C There is only one valid direct object in the user input and the command
. needs two...
  $B69C,$03 Call #R$B1EB to ask for a more specific command.
  $B69F,$01 Set the carry flag to report that the command is malformed.
  $B6A0,$01 Return.
N $B6A1 There are two or more valid direct objects in the user input.
@ $B6A1 label=ValidateTwoDirectObjects
  $B6A1,$04 Jump to #R$B6A7 if the number of valid direct objects in the user
. input is greater than or equal to #N$03.
  $B6A5,$01 Clear the carry flag: exactly two objects were named, so the command
. is valid.
  $B6A6,$01 Return.
N $B6A7 There are more than two valid direct objects in the user input.
@ $B6A7 label=ValidateTwoDirectObjects_TooMany
  $B6A7,$03 Call #R$B1E4 to ask the player to rephrase.
  $B6AA,$01 Set the carry flag to report that the command is malformed.
  $B6AB,$01 Return.

c $B6AC Parser: Validate Any Direct Object
@ $B6AC label=ParserValidateAnyDirectObject
E $B6AC View the equivalent code in;
. #LIST
. { #SHOCK$AC4D }
. { #JEWELS$C4B7 }
. { #WARLORD$AFB7 }
. LIST#
D $B6AC Parser: Validate Any Direct Object.
R $B6AC O:A The number of valid direct objects in the user input tokens
R $B6AC O:F The carry flag is set when the command is malformed
R $B6AC O:F The zero flag is set when there are no valid direct objects present in the input tokens
N $B6AC The first token is the verb, so target the second token for the direct
. object.
  $B6AC,$03 Fetch the #N$AF2F(second token from the user input) and store it in
. #REGa.
  $B6AF,$04 Jump forward to #R$B6B8 if the token is anything other than the
. terminator character (#N$FF).
N $B6B3 The token was the terminator character (#N$FF), so the sentence is
. malformed.
N $B6B3 E.g. They tried "TAKE" but didn't write anything after it.
  $B6B3,$03 Call #R$B1EB to ask for a more specific command.
  $B6B6,$01 Set the carry flag to indicate this call was a failure.
  $B6B7,$01 Return.
N $B6B8 The user input tokens have a direct object, return how many are in the
. command buffer.
@ $B6B8 label=ValidateAnyDirectObject
  $B6B8,$03 Call #R$B5A4.
  $B6BB,$01 Return.

c $B6BC Parser: Process Item
@ $B6BC label=ParserProcessItem
E $B6BC View the equivalent code in;
. #LIST
. { #SHOCK$AC60 }
. { #FOREST$C3DC }
. { #JEWELS$C4C7 }
. { #WARLORD$AFC7 }
. LIST#
D $B6BC Parser: Process Item.
N $B6BC Set up to loop through all word tokens in the token buffer.
  $B6BC,$03 Set a pointer to the word token buffer (the first word token) in
. #REGhl.
  $B6BF,$02 Set a counter in #REGb for #N$0A tokens (the maximum number of
. words).
N $B6C1 Check if there are any tokens to process. Return immediately if the
. first token is the terminator (#N$FF), meaning the input was empty.
@ $B6C1 label=ProcessItem_Loop
  $B6C1,$04 Return if the current token is #N$FF (no more tokens to process).
  $B6C5,$02 Remember the token and the count while the object list is searched.
  $B6C7,$03 Load the object list table pointer into #REGhl.
  $B6CA,$04 #HTML(Load the number of objects into #REGbc (for the
. <code>CPIR</code> search).)
  $B6CE,$02 Search the object list table to see if the token matches any object
. ID.
  $B6D0,$02 Jump to #R$B6DA if the token doesn't match any object ID (not an
. item token).
N $B6D2 The token matches an object ID. Now verify that the item is actually
. present (in the current room or player's inventory).
  $B6D2,$03 Call #R$B52B to check if the item is present and accessible.
  $B6D5,$02 Jump to #R$B6DA to check the next token if the item is here (carry
. flag clear).
  $B6D7,$02 Restore #REGbc, #REGhl from the stack.
  $B6D9,$01 Return with the carry flag set, as a named item isn't here.
  $B6DA,$02 Restore #REGbc, #REGhl from the stack.
  $B6DC,$01 Move to the next token in the buffer.
  $B6DD,$02 Decrease the counter by one and loop back to #R$B6C1 until all #N$0A
. tokens have been checked.
  $B6DF,$01 Return (no valid item tokens were found in the input).

c $B6E0 Handler: Scenic Events
@ $B6E0 label=Handler_ScenicEvents
E $B6E0 View the equivalent code in;
. #LIST
. { #SHOCK$AC88 }
. { #FOREST$C3FA }
. { #JEWELS$C4EB }
. { #ANDROMEDA$658A }
. { #WARLORD$AFEB }
. LIST#
D $B6E0 Handles checking if a scenic event should occur ... and also, handles
. jumping to the correct related scenic event routine to action it.
  $B6E0,$03 #REGa=*#R$AEF8.
  $B6E3,$02 Return if *#R$AEF8 is zero.
  $B6E5,$01 #REGb=#REGa.
  $B6E6,$03 #REGhl=*#R$AEEC.
  $B6E9,$02 Jump to #R$B6EC.
@ $B6EB label=Handler_ScenicEvents_Loop
  $B6EB,$01 Increment #REGhl by one.
@ $B6EC label=ScenicEvents_Process
  $B6EC,$01 Load the scenic event item ID into #REGa.
  $B6ED,$03 Call #R$B560.
  $B6F0,$02 Jump to #R$B711 if the scenic event item is neither here nor
. carried.
N $B6F2 An event was found to be processed!
N $B6F2 First though, stash away the current pointer and index in the search,
. so this can be resumed later.
  $B6F2,$03 Write #REGhl to *#R$AF45.
  $B6F5,$04 Write #REGbc to *#R$AF47.
N $B6F9 Calculate the event index and get the event handler.
  $B6F9,$05 #REGe=*#R$AEF8-#REGb.
  $B6FE,$04 Load #REGix with *#R$AEE8 which contains a pointer to the scenic
. event rountines jump table.
  $B702,$03 Call #R$B3F1.
  $B705,$04 Push #R$B70A onto the stack (as the return address).
  $B709,$01 Jump to the event handler held by #REGhl.
N $B70A This is the return point after the handler has finished executing.
@ $B70A label=ScenicEvents_PostProcessing
  $B70A,$03 Restore *#R$AF45 to #REGhl.
  $B70D,$04 Restore *#R$AF47 to #REGbc.
@ $B711 label=ScenicEvents_Next
  $B711,$02 Decrease the event counter by one and loop back to #R$B6EB until
. all events have been processed.
  $B713,$01 Return.

c $B714 Move Player To Room
@ $B714 label=MovePlayerToRoom
E $B714 View the equivalent code in;
. #LIST
. { #SHOCK$ACBD }
. { #FOREST$C42F }
. { #JEWELS$C520 }
. { #WARLORD$B01F }
. LIST#
R $B714 A Destination room ID
D $B714 Moves the player to a new room. Before updating the current room, it
. brings every scenic-event item that is here or carried along to the
. destination. It then moves each item whose bit is set in #R$AE91 into the
. new room (see #R$AE92).
N $B714 Store the destination room ID and prepare to update scenic events.
  $B714,$01 Copy the destination room ID into #REGc.
  $B715,$03 Load *#R$AEF8 into #REGa.
  $B718,$03 Jump to #R$B732 if no scenic events are defined.
  $B71B,$01 Load *#R$AEF8 into #REGb for the loop counter.
  $B71C,$03 Set a pointer to *#R$AEEC in #REGhl.
  $B71F,$02 Jump to #R$B722.
N $B721 Loop through all scenic event items and move any that are here or
. carried to the destination room (so they follow the player).
@ $B721 label=ScenicItem_Advance
  $B721,$01 Move to the next scenic event item ID.
@ $B722 label=ScenicItem_Next
  $B722,$01 Load this scenic event item ID into #REGa.
  $B723,$03 Call #R$B560 to test whether it is here or carried.
  $B726,$02 Jump to #R$B730 if it is neither here nor carried.
N $B728 This scenic event item is here or carried, so move it with the player.
  $B728,$02 Stash the table pointer and counter on the stack.
  $B72A,$01 Load the scenic event item ID into #REGb.
  $B72B,$03 Call #R$B5FD to update the item's location to the destination room.
  $B72E,$02 Restore the table pointer and counter from the stack.
@ $B730 label=ScenicItem_Count
  $B730,$02 Decrease the scenic event counter by one and loop back to #R$B721
. until all scenic events have been checked.
N $B732 Update the current room ID to the destination room.
@ $B732 label=MovePlayerToRoom_SetRoom
  $B732,$01 Copy the destination room ID into #REGa.
  $B733,$03 Write the destination room ID to #R$AECD.
  $B736,$03 Load *#R$AE91 into #REGa.
  $B739,$02 Return if no following item is active.
N $B73B For each set bit, move the item at that position in #R$AE92 into the
. current room.
  $B73B,$02 Set a counter in #REGb for #N$08 bits.
  $B73D,$03 Set a pointer to #R$AE92 in #REGhl.
  $B740,$01 Copy the following flags into #REGc for bit testing.
  $B741,$02 Jump to #R$B744.
@ $B743 label=EventFlag_Advance
  $B743,$01 Move to the next item ID.
@ $B744 label=EventFlag_Next
  $B744,$02 Shift the following flags right to check the next bit.
  $B746,$02 Jump to #R$B750 if this bit is not set.
N $B748 This item is following, so move it to the current room.
  $B748,$01 Get the item ID from the table.
  $B749,$02 Stash the table pointer and counter on the stack.
  $B74B,$03 Call #R$B5DC to update the item's location to the current room.
  $B74E,$02 Restore the table pointer and counter from the stack.
@ $B750 label=EventFlag_Count
  $B750,$02 Decrease the bit counter by one and loop back to #R$B743 until
. all #N$08 bits have been tested.
@ $B752 label=MovePlayerToRoom_Return
  $B752,$01 Return.

c $B753 Handler: Dispatch Verb
@ $B753 label=Handler_DispatchVerb
E $B753 View the equivalent code in;
. #LIST
. { #SHOCK$ACFC }
. { #FOREST$C463 }
. { #JEWELS$C556 }
. { #ANDROMEDA$8D85 }
. { #WARLORD$B05E }
. LIST#
D $B753 Matches the first word token from the user's command against the verb
. word tokens table. If a match is found, it calculates the verb index and
. jumps to the corresponding verb handler routine. If no match is found, it
. displays "I Don't Understand" and returns.
N $B753 Set up to search the verb word tokens table for the first word token.
  $B753,$03 Set a pointer to *#R$AEEA in #REGhl.
  $B756,$04 Load *#R$AEF4 tokens into #REGbc for the search.
  $B75A,$03 Get the *#R$AF2E from the user input.
  $B75D,$02 Search the verb word tokens table for a matching token.
  $B75F,$02 Jump to #R$B768 if a match was found (Z flag is set).
N $B761 The token doesn't match any verb. Display an error message:
. "#STR$AF59,$08($b==$FF)".
  $B761,$03 #REGhl=#R$AF59.
  $B764,$03 Call #R$AC35.
  $B767,$01 Return.
@ $B768 label=VerbMatched
N $B768 A verb was matched! Calculate its index in the table and jump to its
. handler routine.
  $B768,$04 Calculate the verb index: #REGa=*#R$AEF4-#REGc (total tokens minus
. remaining tokens after match).
  $B76C,$01 Adjust the index (decrease by one, as indices are zero-based).
  $B76D,$01 Store the verb index in #REGe for the table lookup.
  $B76E,$04 Set a pointer to *#R$AEE4 in #REGix.
  $B772,$03 Call #R$B3F1 to get the address of the verb handler routine for this
. index.
  $B775,$01 Jump to the verb handler routine to execute the command.

c $B776 Pause, Print String And Scroll
@ $B776 label=PausePrintStringAndScroll
E $B776 View the equivalent code in;
. #LIST
. { #FOREST$C486 }
. { #JEWELS$C579 }
. { #WARLORD$B081 }
. LIST#
D $B776 Pause, Print String And Scroll.
  $B776,$05 Call #R$AC65 to pause for the frame count in #REGb.
  $B77B,$03 Call #R$AC35 to print the string and start a new line.
  $B77E,$01 Return.

c $B77F Generate Random Number
@ $B77F label=GenerateRandomNumber
E $B77F View the equivalent code in;
. #LIST
. { #SHOCK$AD25 }
. { #FOREST$BF45 }
. { #JEWELS$C582 }
. { #ANDROMEDA$65D6 }
. { #WARLORD$B08A }
. LIST#
D $B77F Returns a number from #N$00 up to, but not including, #REGa.
D $B77F The frame counter chooses how far to walk around that range.
R $B77F A Exclusive upper bound
R $B77F O:A The generated number
N $B77F Mix the frame counter into a number below the limit in #REGa.
  $B77F,$01 Stash #REGbc on the stack.
  $B780,$01 Store the exclusive upper bound in #REGc.
  $B781,$03 Call #R$AC69 to read *#SKOOLKID$5C78(FRAMES).
  $B784,$01 Use the frame counter as the loop count in #REGb.
  $B785,$01 Restore the exclusive upper bound into #REGa.
@ $B786 label=GenerateRandomNumber_Loop
  $B786,$01 Decrease the walking value by one.
  $B787,$02 Jump to #R$B78A if it has not wrapped past zero.
  $B789,$01 Wrap back to the exclusive upper bound.
@ $B78A label=GenerateRandomNumber_Next
  $B78A,$02 Decrease the frame-count loop by one and loop back to #R$B786
. until the count is zero.
  $B78C,$01 Decrease the result by one so the range starts at #N$00.
  $B78D,$01 Restore #REGbc from the stack.
  $B78E,$01 Return.

c $B78F Add To Score
@ $B78F label=AddToScore
E $B78F View the equivalent code in;
. #LIST
. { #SHOCK$AD34 }
. { #WARLORD$B09A }
. LIST#
D $B78F Adds the points in #REGa to the two-byte BCD score at #R$AECE. The low
. byte is adjusted with DAA; when that addition carries, the high byte
. increases by one.
R $B78F A Points to add
N $B78F Preserve #REGhl and load the current score from #R$AECE.
  $B78F,$01 Stash #REGhl on the stack.
  $B790,$03 Fetch the BCD score from *#R$AECE into #REGhl.
N $B793 Add the points into the low score byte and adjust for BCD.
  $B793,$01 Add the points in #REGa to the low score byte in #REGl.
  $B794,$01 Decimal-adjust #REGa for a BCD score digit.
  $B795,$01 Store the adjusted low byte back in #REGl.
  $B796,$02 Jump to #R$B799 if the addition did not carry.
N $B798 The low byte carried, so raise the high score byte.
  $B798,$01 Increase the high score byte in #REGh by one.
@ $B799 label=AddToScore_Store
N $B799 Write the updated score back to #R$AECE.
  $B799,$03 Store #REGhl at #R$AECE.
  $B79C,$01 Restore #REGhl from the stack.
  $B79D,$01 Return.

c $B79E Messaging: "You Have Scored"
@ $B79E label=Messaging_YouHaveScored_Print
E $B79E View the equivalent code in;
. #LIST
. { #SHOCK$AD43 }
. { #WARLORD$B0A9 }
. LIST#
D $B79E Print "You Have Scored"
N $B79E Print it: #MESSAGE$B1C4.
  $B79E,$06 Point at the message and print it.
  $B7A4,$03 Load the word at the score into #REGhl.
  $B7A7,$01 Take the hundreds digit.
  $B7A8,$04 Skip a leading zero in the hundreds digit.
  $B7AC,$02 Add #N$30.
  $B7AE,$03 Call #R$AC47 to print the character.
@ $B7B1 label=PrintScore_Tens
  $B7B1,$01 Take the tens and units.
  $B7B2,$04 Print the tens digit when it is not zero.
  $B7B6,$04 Skip a leading zero in the tens digit.
  $B7BA,$01 The tens digit is zero but there is a hundreds digit, so print a
. "0".
@ $B7BB label=PrintScore_TensDigit
  $B7BB,$04 Move the tens digit into the low four bits.
  $B7BF,$02 Add #N$30.
  $B7C1,$03 Call #R$AC47 to print the character.
@ $B7C4 label=PrintScore_Units
  $B7C4,$01 Take the units digit.
  $B7C5,$02 Mask with #N$0F.
  $B7C7,$02 Add #N$30.
  $B7C9,$03 Call #R$AC47 to print the character.
N $B7CC Print it and start a new line: #MESSAGE$B1D5.
  $B7CC,$06 Point at the message and print it and start a new line.
  $B7D2,$01 Return.

c $B7D3 Handler: Dispatch Matching Phrase
@ $B7D3 label=Handler_DispatchPhrase
D $B7D3 Find the phrase pattern that matches the command and jump to its
. handler.
  $B7D3,$03 Copy the phrase table from #REGhl into #REGix.
@ $B7D6 label=Handler_DispatchPhrase_Loop
  $B7D6,$0D Call #R$B575 to match the phrase tokens.
  $B7E3,$04 Restore the phrase count and the handler and phrase table pointers
. from the stack.
  $B7E7,$02 Try the next phrase when this one does not match.
  $B7E9,$03 Copy the handler address from #REGde into #REGix.
  $B7EC,$06 Read the handler for this phrase.
  $B7F2,$01 Drop the return address into the action routine, so the phrase
. handler returns straight to its caller.
  $B7F3,$01 Jump to the handler address now in #REGhl.
@ $B7F4 label=Handler_DispatchPhrase_Next
  $B7F4,$04 Step to the next phrase entry.
  $B7F8,$01 Advance #REGde to the next byte.
  $B7F9,$01 Advance #REGde to the next byte.
  $B7FA,$01 Move #REGbc back one byte.
  $B7FB,$02 See whether another phrase remains.
  $B7FD,$02 Match the next phrase.
  $B7FF,$01 Return.

c $B800 Game Cold Start
@ $B800 label=GameColdStart
D $B800 Game Cold Start.
  $B800,$03 Continue at #R$E99E.

t $B803 Messaging: "Beren,the King."
@ $B803 label=Messaging_BerenTheKing
  $B803,$0F "#MESSAGE$B803".
B $B812,$01 Terminator.

t $B813 Messaging: "Istar,the wizard."
@ $B813 label=Messaging_IstarTheWizard
  $B813,$11 "#MESSAGE$B813".
B $B824,$01 Terminator.

t $B825 Messaging: "Haldir,the minstrel."
@ $B825 label=Messaging_HaldirTheMinstrel
  $B825,$14 "#MESSAGE$B825".
B $B839,$01 Terminator.

t $B83A Messaging: "Khadim,the dwarf."
@ $B83A label=Messaging_KhadimTheDwarf
  $B83A,$11 "#MESSAGE$B83A".
B $B84B,$01 Terminator.

t $B84C Messaging: "A tinderbox."
@ $B84C label=Messaging_ATinderbox
  $B84C,$0C "#MESSAGE$B84C".
B $B858,$01 Terminator.

t $B859 Messaging: "A frog."
@ $B859 label=Messaging_AFrog
  $B859,$07 "#MESSAGE$B859".
B $B860,$01 Terminator.

t $B861 Messaging: "A swamp lizard."
@ $B861 label=Messaging_ASwampLizard
  $B861,$0F "#MESSAGE$B861".
B $B870,$01 Terminator.

t $B871 Messaging: "A bear."
@ $B871 label=Messaging_ABear
  $B871,$07 "#MESSAGE$B871".
B $B878,$01 Terminator.

t $B879 Messaging: "A sleeping bear."
@ $B879 label=Messaging_ASleepingBear
  $B879,$10 "#MESSAGE$B879".
B $B889,$01 Terminator.

t $B88A Messaging: "Copper gates,to the South."
@ $B88A label=Messaging_CopperGatesToTheSouth
  $B88A,$1A "#MESSAGE$B88A".
B $B8A4,$01 Terminator.

t $B8A5 Messaging: "The gates are open."
@ $B8A5 label=Messaging_TheGatesAreOpen
  $B8A5,$13 "#MESSAGE$B8A5".
B $B8B8,$01 Terminator.

t $B8B9 Messaging: "The gates are closed."
@ $B8B9 label=Messaging_TheGatesAreClosed
  $B8B9,$15 "#MESSAGE$B8B9".
B $B8CE,$01 Terminator.

t $B8CF Messaging: "Copper gates,to the North."
@ $B8CF label=Messaging_CopperGatesToTheNorth
  $B8CF,$1A "#MESSAGE$B8CF".
B $B8E9,$01 Terminator.

t $B8EA Messaging: "Jewelled gates,to the East."
@ $B8EA label=Messaging_JewelledGatesToTheEast
  $B8EA,$1B "#MESSAGE$B8EA".
B $B905,$01 Terminator.

t $B906 Messaging: "Jewelled gates,to the West."
@ $B906 label=Messaging_JewelledGatesToTheWest
  $B906,$1B "#MESSAGE$B906".
B $B921,$01 Terminator.

t $B922 Messaging: "Golden gates,to the South."
@ $B922 label=Messaging_GoldenGatesToTheSouth
  $B922,$1A "#MESSAGE$B922".
B $B93C,$01 Terminator.

t $B93D Messaging: "Golden gates,to the North."
@ $B93D label=Messaging_GoldenGatesToTheNorth
  $B93D,$1A "#MESSAGE$B93D".
B $B957,$01 Terminator.

t $B958 Messaging: "Some money."
@ $B958 label=Messaging_SomeMoney
  $B958,$0B "#MESSAGE$B958".
B $B963,$01 Terminator.

t $B964 Messaging: "A barrowight."
@ $B964 label=Messaging_ABarrowight
  $B964,$0D "#MESSAGE$B964".
B $B971,$01 Terminator.

t $B972 Messaging: "A bible."
@ $B972 label=Messaging_ABible
  $B972,$08 "#MESSAGE$B972".
B $B97A,$01 Terminator.

t $B97B Messaging: "A wand."
@ $B97B label=Messaging_AWand
  $B97B,$07 "#MESSAGE$B97B".
B $B982,$01 Terminator.

t $B983 Messaging: "A scroll."
@ $B983 label=Messaging_AScroll
  $B983,$09 "#MESSAGE$B983".
B $B98C,$01 Terminator.

t $B98D Messaging: "A silver flute."
@ $B98D label=Messaging_ASilverFlute
  $B98D,$0F "#MESSAGE$B98D".
B $B99C,$01 Terminator.

t $B99D Messaging: "A carpet."
@ $B99D label=Messaging_ACarpet
  $B99D,$09 "#MESSAGE$B99D".
B $B9A6,$01 Terminator.

t $B9A7 Messaging: "A jewelled key."
@ $B9A7 label=Messaging_AJewelledKey
  $B9A7,$0F "#MESSAGE$B9A7".
B $B9B6,$01 Terminator.

t $B9B7 Messaging: "A spirit."
@ $B9B7 label=Messaging_ASpirit
  $B9B7,$09 "#MESSAGE$B9B7".
B $B9C0,$01 Terminator.

t $B9C1 Messaging: "A songbird."
@ $B9C1 label=Messaging_ASongbird
  $B9C1,$0B "#MESSAGE$B9C1".
B $B9CC,$01 Terminator.

t $B9CD Messaging: "A songbird in a wicker cage."
@ $B9CD label=Messaging_ASongbirdInAWickerCage
  $B9CD,$1C "#MESSAGE$B9CD".
B $B9E9,$01 Terminator.

t $B9EA Messaging: "A balrog."
@ $B9EA label=Messaging_ABalrog
  $B9EA,$09 "#MESSAGE$B9EA".
B $B9F3,$01 Terminator.

t $B9F4 Messaging: "A crystal bridge over the chasm."
@ $B9F4 label=Messaging_ACrystalBridgeOverTheChasm
  $B9F4,$20 "#MESSAGE$B9F4".
B $BA14,$01 Terminator.

t $BA15 Messaging: "A sword."
@ $BA15 label=Messaging_ASword
  $BA15,$08 "#MESSAGE$BA15".
B $BA1D,$01 Terminator.

t $BA1E Messaging: "A spear."
@ $BA1E label=Messaging_ASpear
  $BA1E,$08 "#MESSAGE$BA1E".
B $BA26,$01 Terminator.

t $BA27 Messaging: "A dagger."
@ $BA27 label=Messaging_ADagger
  $BA27,$09 "#MESSAGE$BA27".
B $BA30,$01 Terminator.

t $BA31 Messaging: "A velvet pillow."
@ $BA31 label=Messaging_AVelvetPillow
  $BA31,$10 "#MESSAGE$BA31".
B $BA41,$01 Terminator.

t $BA42 Messaging: "A falcon."
@ $BA42 label=Messaging_AFalcon
  $BA42,$09 "#MESSAGE$BA42".
B $BA4B,$01 Terminator.

t $BA4C Messaging: "A bottle."
@ $BA4C label=Messaging_ABottle
  $BA4C,$09 "#MESSAGE$BA4C".
B $BA55,$01 Terminator.

t $BA56 Messaging: "A bottle of water."
@ $BA56 label=Messaging_ABottleOfWater
  $BA56,$12 "#MESSAGE$BA56".
B $BA68,$01 Terminator.

t $BA69 Messaging: "A bottle of acid."
@ $BA69 label=Messaging_ABottleOfAcid
  $BA69,$11 "#MESSAGE$BA69".
B $BA7A,$01 Terminator.

t $BA7B Messaging: "A bottle of oil."
@ $BA7B label=Messaging_ABottleOfOil
  $BA7B,$10 "#MESSAGE$BA7B".
B $BA8B,$01 Terminator.

t $BA8C Messaging: "A broken bottle."
@ $BA8C label=Messaging_ABrokenBottle
  $BA8C,$10 "#MESSAGE$BA8C".
B $BA9C,$01 Terminator.

t $BA9D Messaging: "A serpent."
@ $BA9D label=Messaging_ASerpent
  $BA9D,$0A "#MESSAGE$BA9D".
B $BAA7,$01 Terminator.

t $BAA8 Messaging: "A dead serpent."
@ $BAA8 label=Messaging_ADeadSerpent
  $BAA8,$0F "#MESSAGE$BAA8".
B $BAB7,$01 Terminator.

t $BAB8 Messaging: "Istar,held behind crystal bars."
@ $BAB8 label=Messaging_IstarHeldBehindCrystalBars
  $BAB8,$1F "#MESSAGE$BAB8".
B $BAD7,$01 Terminator.

t $BAD8 Messaging: "A golden lyre."
@ $BAD8 label=Messaging_AGoldenLyre
  $BAD8,$0E "#MESSAGE$BAD8".
B $BAE6,$01 Terminator.

t $BAE7 Messaging: "A mandolin."
@ $BAE7 label=Messaging_AMandolin
  $BAE7,$0B "#MESSAGE$BAE7".
B $BAF2,$01 Terminator.

t $BAF3 Messaging: "A gold key."
@ $BAF3 label=Messaging_AGoldKey
  $BAF3,$0B "#MESSAGE$BAF3".
B $BAFE,$01 Terminator.

t $BAFF Messaging: "A hydra."
@ $BAFF label=Messaging_AHydra
  $BAFF,$08 "#MESSAGE$BAFF".
B $BB07,$01 Terminator.

t $BB08 Messaging: "A dead hydra."
@ $BB08 label=Messaging_ADeadHydra
  $BB08,$0D "#MESSAGE$BB08".
B $BB15,$01 Terminator.

t $BB16 Messaging: "A ruby."
@ $BB16 label=Messaging_ARuby
  $BB16,$07 "#MESSAGE$BB16".
B $BB1D,$01 Terminator.

t $BB1E Messaging: "A pool of oil."
@ $BB1E label=Messaging_APoolOfOil
  $BB1E,$0E "#MESSAGE$BB1E".
B $BB2C,$01 Terminator.

t $BB2D Messaging: "A pool of acid."
@ $BB2D label=Messaging_APoolOfAcid
  $BB2D,$0F "#MESSAGE$BB2D".
B $BB3C,$01 Terminator.

t $BB3D Messaging: "A diamond."
@ $BB3D label=Messaging_ADiamond
  $BB3D,$0A "#MESSAGE$BB3D".
B $BB47,$01 Terminator.

t $BB48 Messaging: "A venomous spider."
@ $BB48 label=Messaging_AVenomousSpider
  $BB48,$12 "#MESSAGE$BB48".
B $BB5A,$01 Terminator.

t $BB5B Messaging: "A sleeping spider."
@ $BB5B label=Messaging_ASleepingSpider
  $BB5B,$12 "#MESSAGE$BB5B".
B $BB6D,$01 Terminator.

t $BB6E Messaging: "A rusty,iron chest."
@ $BB6E label=Messaging_ARustyIronChest
  $BB6E,$13 "#MESSAGE$BB6E".
B $BB81,$01 Terminator.

t $BB82 Messaging: "A chest with oiled hinges."
@ $BB82 label=Messaging_AChestWithOiledHinges
  $BB82,$1A "#MESSAGE$BB82".
B $BB9C,$01 Terminator.

t $BB9D Messaging: "An open chest."
@ $BB9D label=Messaging_AnOpenChest
  $BB9D,$0E "#MESSAGE$BB9D".
B $BBAB,$01 Terminator.

t $BBAC Messaging: "A coffin."
@ $BBAC label=Messaging_ACoffin
  $BBAC,$09 "#MESSAGE$BBAC".
B $BBB5,$01 Terminator.

t $BBB6 Messaging: "An open coffin."
@ $BBB6 label=Messaging_AnOpenCoffin
  $BBB6,$0F "#MESSAGE$BBB6".
B $BBC5,$01 Terminator.

t $BBC6 Messaging: "A vampire."
@ $BBC6 label=Messaging_AVampire
  $BBC6,$0A "#MESSAGE$BBC6".
B $BBD0,$01 Terminator.

t $BBD1 Messaging: "The Black Knight."
@ $BBD1 label=Messaging_TheBlackKnight
  $BBD1,$11 "#MESSAGE$BBD1".
B $BBE2,$01 Terminator.

t $BBE3 Messaging: "The body of the Black Knight."
@ $BBE3 label=Messaging_TheBodyOfTheBlackKnight
  $BBE3,$1D "#MESSAGE$BBE3".
B $BC00,$01 Terminator.

t $BC01 Messaging: "A jade flower."
@ $BC01 label=Messaging_AJadeFlower
  $BC01,$0E "#MESSAGE$BC01".
B $BC0F,$01 Terminator.

t $BC10 Messaging: "Some jade fragments."
@ $BC10 label=Messaging_SomeJadeFragments
  $BC10,$14 "#MESSAGE$BC10".
B $BC24,$01 Terminator.

t $BC25 Messaging: "A waterfall."
@ $BC25 label=Messaging_AWaterfall
  $BC25,$0C "#MESSAGE$BC25".
B $BC31,$01 Terminator.

t $BC32 Messaging: "A wooden box."
@ $BC32 label=Messaging_AWoodenBox
  $BC32,$0D "#MESSAGE$BC32".
B $BC3F,$01 Terminator.

t $BC40 Messaging: "A sapphire."
@ $BC40 label=Messaging_ASapphire
  $BC40,$0B "#MESSAGE$BC40".
B $BC4B,$01 Terminator.

t $BC4C Messaging: "A dragon."
@ $BC4C label=Messaging_ADragon
  $BC4C,$09 "#MESSAGE$BC4C".
B $BC55,$01 Terminator.

t $BC56 Messaging: "A dead dragon."
@ $BC56 label=Messaging_ADeadDragon
  $BC56,$0E "#MESSAGE$BC56".
B $BC64,$01 Terminator.

t $BC65 Messaging: "A crowbar."
@ $BC65 label=Messaging_ACrowbar
  $BC65,$0A "#MESSAGE$BC65".
B $BC6F,$01 Terminator.

t $BC70 Messaging: "A shovel."
@ $BC70 label=Messaging_AShovel
  $BC70,$09 "#MESSAGE$BC70".
B $BC79,$01 Terminator.

t $BC7A Messaging: "A map."
@ $BC7A label=Messaging_AMap
  $BC7A,$06 "#MESSAGE$BC7A".
B $BC80,$01 Terminator.

t $BC81 Messaging: "A pirate."
@ $BC81 label=Messaging_APirate
  $BC81,$09 "#MESSAGE$BC81".
B $BC8A,$01 Terminator.

t $BC8B Messaging: "A dead pirate."
@ $BC8B label=Messaging_ADeadPirate
  $BC8B,$0E "#MESSAGE$BC8B".
B $BC99,$01 Terminator.

t $BC9A Messaging: "A wicker cage."
@ $BC9A label=Messaging_AWickerCage
  $BC9A,$0E "#MESSAGE$BC9A".
B $BCA8,$01 Terminator.

t $BCA9 Messaging: "A silver coin."
@ $BCA9 label=Messaging_ASilverCoin
  $BCA9,$0E "#MESSAGE$BCA9".
B $BCB7,$01 Terminator.

t $BCB8 Messaging: "Firegates lay North,East & West."
@ $BCB8 label=Messaging_FiregatesLayNorthEastWest
  $BCB8,$20 "#MESSAGE$BCB8".
B $BCD8,$01 Terminator.

t $BCD9 Messaging: "A firegate to the South."
@ $BCD9 label=Messaging_AFiregateToTheSouth
  $BCD9,$18 "#MESSAGE$BCD9".
B $BCF1,$01 Terminator.

t $BCF2 Messaging: "A firegate to the East."
@ $BCF2 label=Messaging_AFiregateToTheEast
  $BCF2,$17 "#MESSAGE$BCF2".
B $BD09,$01 Terminator.

t $BD0A Messaging: "A firegate to the West."
@ $BD0A label=Messaging_AFiregateToTheWest
  $BD0A,$17 "#MESSAGE$BD0A".
B $BD21,$01 Terminator.

t $BD22 Messaging: "A black potion."
@ $BD22 label=Messaging_ABlackPotion
  $BD22,$0F "#MESSAGE$BD22".
B $BD31,$01 Terminator.

t $BD32 Messaging: "A white potion."
@ $BD32 label=Messaging_AWhitePotion
  $BD32,$0F "#MESSAGE$BD32".
B $BD41,$01 Terminator.

t $BD42 Messaging: "A copper key."
@ $BD42 label=Messaging_ACopperKey
  $BD42,$0D "#MESSAGE$BD42".
B $BD4F,$01 Terminator.

t $BD50 Messaging: "The guard,looking at you through the bars."
@ $BD50 label=Messaging_TheGuardLookingAtYouThroughTheBars
  $BD50,$2A "#MESSAGE$BD50".
B $BD7A,$01 Terminator.

t $BD7B Messaging: "The door is open."
@ $BD7B label=Messaging_TheDoorIsOpen
  $BD7B,$11 "#MESSAGE$BD7B".
B $BD8C,$01 Terminator.

t $BD8D Messaging: "The door is closed."
@ $BD8D label=Messaging_TheDoorIsClosed
  $BD8D,$13 "#MESSAGE$BD8D".
B $BDA0,$01 Terminator.

t $BDA1 Messaging: "Some honey."
@ $BDA1 label=Messaging_SomeHoney
  $BDA1,$0B "#MESSAGE$BDA1".
B $BDAC,$01 Terminator.

t $BDAD Messaging: "Some meat."
@ $BDAD label=Messaging_SomeMeat
  $BDAD,$0A "#MESSAGE$BDAD".
B $BDB7,$01 Terminator.

t $BDB8 Messaging: "An emerald."
@ $BDB8 label=Messaging_AnEmerald
  $BDB8,$0B "#MESSAGE$BDB8".
B $BDC3,$01 Terminator.

t $BDC4 Messaging: "A giant clam,tightly closed."
@ $BDC4 label=Messaging_AGiantClamTightlyClosed
  $BDC4,$1C "#MESSAGE$BDC4".
B $BDE0,$01 Terminator.

t $BDE1 Messaging: "An open clam."
@ $BDE1 label=Messaging_AnOpenClam
  $BDE1,$0D "#MESSAGE$BDE1".
B $BDEE,$01 Terminator.

t $BDEF Messaging: "A pearl."
@ $BDEF label=Messaging_APearl
  $BDEF,$08 "#MESSAGE$BDEF".
B $BDF7,$01 Terminator.

t $BDF8 Messaging: "A tiny plant."
@ $BDF8 label=Messaging_ATinyPlant
  $BDF8,$0D "#MESSAGE$BDF8".
B $BE05,$01 Terminator.

t $BE06 Messaging: "A plant,6 feet in height."
@ $BE06 label=Messaging_APlant6FeetInHeight
  $BE06,$19 "#MESSAGE$BE06".
B $BE1F,$01 Terminator.

t $BE20 Messaging: "A massive beanstalk."
@ $BE20 label=Messaging_AMassiveBeanstalk
  $BE20,$14 "#MESSAGE$BE20".
B $BE34,$01 Terminator.

t $BE35 Messaging: "A witch."
@ $BE35 label=Messaging_AWitch
  $BE35,$08 "#MESSAGE$BE35".
B $BE3D,$01 Terminator.

t $BE3E Messaging: "A dead witch."
@ $BE3E label=Messaging_ADeadWitch
  $BE3E,$0D "#MESSAGE$BE3E".
B $BE4B,$01 Terminator.

t $BE4C Messaging: "A silver cross."
@ $BE4C label=Messaging_ASilverCross
  $BE4C,$0F "#MESSAGE$BE4C".
B $BE5B,$01 Terminator.

t $BE5C Messaging: "A giant bat."
@ $BE5C label=Messaging_AGiantBat
  $BE5C,$0C "#MESSAGE$BE5C".
B $BE68,$01 Terminator.

t $BE69 Messaging: "A dead bat."
@ $BE69 label=Messaging_ADeadBat
  $BE69,$0B "#MESSAGE$BE69".
B $BE74,$01 Terminator.

t $BE75 Messaging: "A magic mirror."
@ $BE75 label=Messaging_AMagicMirror
  $BE75,$0F "#MESSAGE$BE75".
B $BE84,$01 Terminator.

t $BE85 Messaging: "Anton,the Gypsy King. He says 'Find me a magic..."
@ $BE85 label=Messaging_AntonTheGypsyKingFind
  $BE85,$54 "#MESSAGE$BE85".
B $BED9,$01 Terminator.

t $BEDA Messaging: "Anton,the Gypsy King. He says 'Cross my palm w..."
@ $BEDA label=Messaging_AntonTheGypsyKingCross
  $BEDA,$3A "#MESSAGE$BEDA".
B $BF14,$01 Terminator.

t $BF15 Messaging: "Some hot ashes."
@ $BF15 label=Messaging_SomeHotAshes
  $BF15,$0F "#MESSAGE$BF15".
B $BF24,$01 Terminator.

t $BF25 Messaging: "A phoenix."
@ $BF25 label=Messaging_APhoenix
  $BF25,$0A "#MESSAGE$BF25".
B $BF2F,$01 Terminator.

t $BF30 Messaging: "A jade flower,resting on a velvet pillow."
@ $BF30 label=Messaging_AJadeFlowerRestingOnAVelvetPillow
  $BF30,$29 "#MESSAGE$BF30".
B $BF59,$01 Terminator.

t $BF5A Messaging: "The top of a giant beanstalk."
@ $BF5A label=Messaging_TheTopOfAGiantBeanstalk
  $BF5A,$1D "#MESSAGE$BF5A".
B $BF77,$01 Terminator.

t $BF78 Messaging: "Inside the Ruined Cottage."
@ $BF78 label=Messaging_InsideTheRuinedCottage
  $BF78,$1A "#MESSAGE$BF78".
B $BF92,$01 Terminator.

t $BF93 Messaging: "In the Field,to the East of a ruined cottage."
@ $BF93 label=Messaging_InTheFieldToTheEastOfARuinedCottage
  $BF93,$2D "#MESSAGE$BF93".
B $BFC0,$01 Terminator.

t $BFC1 Messaging: "The Open Moorland. The ground rises to the East."
@ $BFC1 label=Messaging_TheOpenMoorland
  $BFC1,$30 "#MESSAGE$BFC1".
B $BFF1,$01 Terminator.

t $BFF2 Messaging: "High on the Moors. It is bleak and desolate he..."
@ $BFF2 label=Messaging_HighOnTheMoors
  $BFF2,$4F "#MESSAGE$BFF2".
B $C041,$01 Terminator.

t $C042 Messaging: "The Dead Marshes. Rotting,reed-strewn undergro..."
@ $C042 label=Messaging_TheDeadMarshes
  $C042,$67 "#MESSAGE$C042".
B $C0A9,$01 Terminator.

t $C0AA Messaging: "The Narrow Path. Marshlands lay to West."
@ $C0AA label=Messaging_TheNarrowPath
  $C0AA,$28 "#MESSAGE$C0AA".
B $C0D2,$01 Terminator.

t $C0D3 Messaging: "The Valley. Wedged between the mountains, lush..."
@ $C0D3 label=Messaging_TheValley
  $C0D3,$61 "#MESSAGE$C0D3".
B $C134,$01 Terminator.

t $C135 Messaging: "The Gates of Karn. Fashioned from copper,the m..."
@ $C135 label=Messaging_TheGatesOfKarn
  $C135,$62 "#MESSAGE$C135".
B $C197,$01 Terminator.

t $C198 Messaging: "The Deserted Village. North of the Long Barrow."
@ $C198 label=Messaging_TheDesertedVillage
  $C198,$2F "#MESSAGE$C198".
B $C1C7,$01 Terminator.

t $C1C8 Messaging: "The Plain of Stones. There are buildings to th..."
@ $C1C8 label=Messaging_ThePlainOfStones
  $C1C8,$35 "#MESSAGE$C1C8".
B $C1FD,$01 Terminator.

t $C1FE Messaging: "The Gypsy Camp. Brightly decorated caravans su..."
@ $C1FE label=Messaging_TheGypsyCamp
  $C1FE,$39 "#MESSAGE$C1FE".
B $C237,$01 Terminator.

t $C238 Messaging: "Pilgrims' Hill. The path is worn deep by the p..."
@ $C238 label=Messaging_PilgrimsHill
  $C238,$65 "#MESSAGE$C238".
B $C29D,$01 Terminator.

t $C29E Messaging: "The Monastery. A sanctuary used by many during..."
@ $C29E label=Messaging_TheMonastery
  $C29E,$6C "#MESSAGE$C29E".
B $C30A,$01 Terminator.

t $C30B Messaging: "The Wizard's Chamber."
@ $C30B label=Messaging_TheWizardsChamber
  $C30B,$15 "#MESSAGE$C30B".
B $C320,$01 Terminator.

t $C321 Messaging: "The Sand Room."
@ $C321 label=Messaging_TheSandRoom
  $C321,$0E "#MESSAGE$C321".
B $C32F,$01 Terminator.

t $C330 Messaging: "The Hall of Gold. Ornate gilt columns tower ab..."
@ $C330 label=Messaging_TheHallOfGold
  $C330,$36 "#MESSAGE$C330".
B $C366,$01 Terminator.

t $C367 Messaging: "Within the Long Barrow. Stone arches support t..."
@ $C367 label=Messaging_WithinTheLongBarrow
  $C367,$42 "#MESSAGE$C367".
B $C3A9,$01 Terminator.

t $C3AA Messaging: "At the Edge of the Sea. North of the Castle."
@ $C3AA label=Messaging_AtTheEdgeOfTheSea
  $C3AA,$2C "#MESSAGE$C3AA".
B $C3D6,$01 Terminator.

t $C3D7 Messaging: "The Hall of the Mountain King."
@ $C3D7 label=Messaging_TheHallOfTheMountainKing
  $C3D7,$1E "#MESSAGE$C3D7".
B $C3F5,$01 Terminator.

t $C3F6 Messaging: "The King's Anteroom."
@ $C3F6 label=Messaging_TheKingsAnteroom
  $C3F6,$14 "#MESSAGE$C3F6".
B $C40A,$01 Terminator.

t $C40B Messaging: "The Hall of Wisdom."
@ $C40B label=Messaging_TheHallOfWisdom
  $C40B,$13 "#MESSAGE$C40B".
B $C41E,$01 Terminator.

t $C41F Messaging: "The Star Chamber. A curious golden star design..."
@ $C41F label=Messaging_TheStarChamber
  $C41F,$44 "#MESSAGE$C41F".
B $C463,$01 Terminator.

t $C464 Messaging: "The Bird Chamber. A profusion of branches grow..."
@ $C464 label=Messaging_TheBirdChamber
  $C464,$35 "#MESSAGE$C464".
B $C499,$01 Terminator.

t $C49A Messaging: "The Vast Hall. A wide chasm lays to the South."
@ $C49A label=Messaging_TheVastHall
  $C49A,$2E "#MESSAGE$C49A".
B $C4C8,$01 Terminator.

t $C4C9 Messaging: "The Sword Room."
@ $C4C9 label=Messaging_TheSwordRoom
  $C4C9,$0F "#MESSAGE$C4C9".
B $C4D8,$01 Terminator.

t $C4D9 Messaging: "The Gatehouse. Stone stairs lead down."
@ $C4D9 label=Messaging_TheGatehouse
  $C4D9,$26 "#MESSAGE$C4D9".
B $C4FF,$01 Terminator.

t $C500 Messaging: "The King's Chamber. Inlaid into the floor is a..."
@ $C500 label=Messaging_TheKingsChamber
  $C500,$41 "#MESSAGE$C500".
B $C541,$01 Terminator.

t $C542 Messaging: "The Falcon Chamber."
@ $C542 label=Messaging_TheFalconChamber
  $C542,$13 "#MESSAGE$C542".
B $C555,$01 Terminator.

t $C556 Messaging: "The King's Stairway. The broken,spiral stairca..."
@ $C556 label=Messaging_TheKingsStairway
  $C556,$41 "#MESSAGE$C556".
B $C597,$01 Terminator.

t $C598 Messaging: "The Crystal Room."
@ $C598 label=Messaging_TheCrystalRoom
  $C598,$11 "#MESSAGE$C598".
B $C5A9,$01 Terminator.

t $C5AA Messaging: "The Debris Room."
@ $C5AA label=Messaging_TheDebrisRoom
  $C5AA,$10 "#MESSAGE$C5AA".
B $C5BA,$01 Terminator.

t $C5BB Messaging: "The Stair Room. A silver staircase leads down...."
@ $C5BB label=Messaging_TheStairRoom
  $C5BB,$52 "#MESSAGE$C5BB".
B $C60D,$01 Terminator.

t $C60E Messaging: "The Hall of Music."
@ $C60E label=Messaging_TheHallOfMusic
  $C60E,$12 "#MESSAGE$C60E".
B $C620,$01 Terminator.

t $C621 Messaging: "The Hall of Infinity. The tall columns have a..."
@ $C621 label=Messaging_TheHallOfInfinity
  $C621,$4D "#MESSAGE$C621".
B $C66E,$01 Terminator.

t $C66F Messaging: "The Lair of the Hydra."
@ $C66F label=Messaging_TheLairOfTheHydra
  $C66F,$16 "#MESSAGE$C66F".
B $C685,$01 Terminator.

t $C686 Messaging: "The Star Cavern. A golden star has been set in..."
@ $C686 label=Messaging_TheStarCavern
  $C686,$42 "#MESSAGE$C686".
B $C6C8,$01 Terminator.

t $C6C9 Messaging: "The Hall of Smoke. Smoke forms a swirling,shif..."
@ $C6C9 label=Messaging_TheHallOfSmoke
  $C6C9,$4C "#MESSAGE$C6C9".
B $C715,$01 Terminator.

t $C716 Messaging: "The Oil Room."
@ $C716 label=Messaging_TheOilRoom
  $C716,$0D "#MESSAGE$C716".
B $C723,$01 Terminator.

t $C724 Messaging: "The Acid Room."
@ $C724 label=Messaging_TheAcidRoom
  $C724,$0E "#MESSAGE$C724".
B $C732,$01 Terminator.

t $C733 Messaging: "The Treasury."
@ $C733 label=Messaging_TheTreasury
  $C733,$0D "#MESSAGE$C733".
B $C740,$01 Terminator.

t $C741 Messaging: "The Crypt. The air is cold and clammy in this..."
@ $C741 label=Messaging_TheCrypt
  $C741,$43 "#MESSAGE$C741".
B $C784,$01 Terminator.

t $C785 Messaging: "The Hall of the Black Knight. Sombre rows of h..."
@ $C785 label=Messaging_TheHallOfTheBlackKnight
  $C785,$51 "#MESSAGE$C785".
B $C7D6,$01 Terminator.

t $C7D7 Messaging: "The Hall of Jade. Delicate silver branches are..."
@ $C7D7 label=Messaging_TheHallOfJade
  $C7D7,$52 "#MESSAGE$C7D7".
B $C829,$01 Terminator.

t $C82A Messaging: "The Ice Cavern."
@ $C82A label=Messaging_TheIceCavern
  $C82A,$0F "#MESSAGE$C82A".
B $C839,$01 Terminator.

t $C83A Messaging: "The Cascade Cavern."
@ $C83A label=Messaging_TheCascadeCavern
  $C83A,$13 "#MESSAGE$C83A".
B $C84D,$01 Terminator.

t $C84E Messaging: "The Volcano Cavern."
@ $C84E label=Messaging_TheVolcanoCavern
  $C84E,$13 "#MESSAGE$C84E".
B $C861,$01 Terminator.

t $C862 Messaging: "The Hall of the Four Winds. A raging maelstrom..."
@ $C862 label=Messaging_TheHallOfTheFourWinds
  $C862,$4D "#MESSAGE$C862".
B $C8AF,$01 Terminator.

t $C8B0 Messaging: "The Dragon's Lair."
@ $C8B0 label=Messaging_TheDragonsLair
  $C8B0,$12 "#MESSAGE$C8B0".
B $C8C2,$01 Terminator.

t $C8C3 Messaging: "The Toolroom."
@ $C8C3 label=Messaging_TheToolroom
  $C8C3,$0D "#MESSAGE$C8C3".
B $C8D0,$01 Terminator.

t $C8D1 Messaging: "The Torture Chamber. The room is filled with f..."
@ $C8D1 label=Messaging_TheTortureChamber
  $C8D1,$49 "#MESSAGE$C8D1".
B $C91A,$01 Terminator.

t $C91B Messaging: "The Pirate's Lair."
@ $C91B label=Messaging_ThePiratesLair
  $C91B,$12 "#MESSAGE$C91B".
B $C92D,$01 Terminator.

t $C92E Messaging: "The Sand Cavern."
@ $C92E label=Messaging_TheSandCavern
  $C92E,$10 "#MESSAGE$C92E".
B $C93E,$01 Terminator.

t $C93F Messaging: "The Hall of Fire. Light comes from a thousand..."
@ $C93F label=Messaging_TheHallOfFire
  $C93F,$3D "#MESSAGE$C93F".
B $C97C,$01 Terminator.

t $C97D Messaging: "The Hall of the Phoenix."
@ $C97D label=Messaging_TheHallOfThePhoenix
  $C97D,$18 "#MESSAGE$C97D".
B $C995,$01 Terminator.

t $C996 Messaging: "The Steam Cavern. Hissing jets of scalding vap..."
@ $C996 label=Messaging_TheSteamCavern
  $C996,$52 "#MESSAGE$C996".
B $C9E8,$01 Terminator.

t $C9E9 Messaging: "The Limestone Cavern."
@ $C9E9 label=Messaging_TheLimestoneCavern
  $C9E9,$15 "#MESSAGE$C9E9".
B $C9FE,$01 Terminator.

t $C9FF Messaging: "The Dungeon. The door is to the East."
@ $C9FF label=Messaging_TheDungeon
  $C9FF,$25 "#MESSAGE$C9FF".
B $CA24,$01 Terminator.

t $CA25 Messaging: "The Cellar."
@ $CA25 label=Messaging_TheCellar
  $CA25,$0B "#MESSAGE$CA25".
B $CA30,$01 Terminator.

t $CA31 Messaging: "The Sandy Beach."
@ $CA31 label=Messaging_TheSandyBeach
  $CA31,$10 "#MESSAGE$CA31".
B $CA41,$01 Terminator.

t $CA42 Messaging: "The Sea Cavern."
@ $CA42 label=Messaging_TheSeaCavern
  $CA42,$0F "#MESSAGE$CA42".
B $CA51,$01 Terminator.

t $CA52 Messaging: "The Plant Room. A broken spiral staircase lead..."
@ $CA52 label=Messaging_ThePlantRoom
  $CA52,$37 "#MESSAGE$CA52".
B $CA89,$01 Terminator.

t $CA8A Messaging: "The Hall of Black Magic."
@ $CA8A label=Messaging_TheHallOfBlackMagic
  $CA8A,$18 "#MESSAGE$CA8A".
B $CAA2,$01 Terminator.

t $CAA3 Messaging: "The Bat Cavern."
@ $CAA3 label=Messaging_TheBatCavern
  $CAA3,$0F "#MESSAGE$CAA3".
B $CAB2,$01 Terminator.

t $CAB3 Messaging: "The Hall of Stairs. A silver staircase leads u..."
@ $CAB3 label=Messaging_TheHallOfStairs
  $CAB3,$34 "#MESSAGE$CAB3".
B $CAE7,$01 Terminator.

t $CAE8 Messaging: "a ruby"
@ $CAE8 label=Messaging_ARubyNoun
  $CAE8,$06 "#MESSAGE$CAE8".
B $CAEE,$01 Terminator.

t $CAEF Messaging: "a diamond"
@ $CAEF label=Messaging_ADiamondNoun
  $CAEF,$09 "#MESSAGE$CAEF".
B $CAF8,$01 Terminator.

t $CAF9 Messaging: "a flower"
@ $CAF9 label=Messaging_AFlower
  $CAF9,$08 "#MESSAGE$CAF9".
B $CB01,$01 Terminator.

t $CB02 Messaging: "a sapphire"
@ $CB02 label=Messaging_ASapphireNoun
  $CB02,$0A "#MESSAGE$CB02".
B $CB0C,$01 Terminator.

t $CB0D Messaging: "an emerald"
@ $CB0D label=Messaging_AnEmeraldNoun
  $CB0D,$0A "#MESSAGE$CB0D".
B $CB17,$01 Terminator.

t $CB18 Messaging: "a pearl"
@ $CB18 label=Messaging_APearlNoun
  $CB18,$07 "#MESSAGE$CB18".
B $CB1F,$01 Terminator.

t $CB20 Messaging: "a tinderbox"
@ $CB20 label=Messaging_ATinderboxNoun
  $CB20,$0B "#MESSAGE$CB20".
B $CB2B,$01 Terminator.

t $CB2C Messaging: "a frog"
@ $CB2C label=Messaging_AFrogNoun
  $CB2C,$06 "#MESSAGE$CB2C".
B $CB32,$01 Terminator.

t $CB33 Messaging: "any money"
@ $CB33 label=Messaging_AnyMoney
  $CB33,$09 "#MESSAGE$CB33".
B $CB3C,$01 Terminator.

t $CB3D Messaging: "a bible"
@ $CB3D label=Messaging_ABibleNoun
  $CB3D,$07 "#MESSAGE$CB3D".
B $CB44,$01 Terminator.

t $CB45 Messaging: "a wand"
@ $CB45 label=Messaging_AWandNoun
  $CB45,$06 "#MESSAGE$CB45".
B $CB4B,$01 Terminator.

t $CB4C Messaging: "a scroll"
@ $CB4C label=Messaging_AScrollNoun
  $CB4C,$08 "#MESSAGE$CB4C".
B $CB54,$01 Terminator.

t $CB55 Messaging: "a flute"
@ $CB55 label=Messaging_AFlute
  $CB55,$07 "#MESSAGE$CB55".
B $CB5C,$01 Terminator.

t $CB5D Messaging: "a carpet"
@ $CB5D label=Messaging_ACarpetNoun
  $CB5D,$08 "#MESSAGE$CB5D".
B $CB65,$01 Terminator.

t $CB66 Messaging: "a key"
@ $CB66 label=Messaging_AKey
  $CB66,$05 "#MESSAGE$CB66".
B $CB6B,$01 Terminator.

t $CB6C Messaging: "a songbird"
@ $CB6C label=Messaging_ASongbirdNoun
  $CB6C,$0A "#MESSAGE$CB6C".
B $CB76,$01 Terminator.

t $CB77 Messaging: "a sword"
@ $CB77 label=Messaging_ASwordNoun
  $CB77,$07 "#MESSAGE$CB77".
B $CB7E,$01 Terminator.

t $CB7F Messaging: "a spear"
@ $CB7F label=Messaging_ASpearNoun
  $CB7F,$07 "#MESSAGE$CB7F".
B $CB86,$01 Terminator.

t $CB87 Messaging: "a dagger"
@ $CB87 label=Messaging_ADaggerNoun
  $CB87,$08 "#MESSAGE$CB87".
B $CB8F,$01 Terminator.

t $CB90 Messaging: "a pillow"
@ $CB90 label=Messaging_APillow
  $CB90,$08 "#MESSAGE$CB90".
B $CB98,$01 Terminator.

t $CB99 Messaging: "a falcon"
@ $CB99 label=Messaging_AFalconNoun
  $CB99,$08 "#MESSAGE$CB99".
B $CBA1,$01 Terminator.

t $CBA2 Messaging: "a bottle"
@ $CBA2 label=Messaging_ABottleNoun
  $CBA2,$08 "#MESSAGE$CBA2".
B $CBAA,$01 Terminator.

t $CBAB Messaging: "any water"
@ $CBAB label=Messaging_AnyWater
  $CBAB,$09 "#MESSAGE$CBAB".
B $CBB4,$01 Terminator.

t $CBB5 Messaging: "any acid"
@ $CBB5 label=Messaging_AnyAcid
  $CBB5,$08 "#MESSAGE$CBB5".
B $CBBD,$01 Terminator.

t $CBBE Messaging: "any oil"
@ $CBBE label=Messaging_AnyOil
  $CBBE,$07 "#MESSAGE$CBBE".
B $CBC5,$01 Terminator.

t $CBC6 Messaging: "a lyre"
@ $CBC6 label=Messaging_ALyre
  $CBC6,$06 "#MESSAGE$CBC6".
B $CBCC,$01 Terminator.

t $CBCD Messaging: "a mandolin"
@ $CBCD label=Messaging_AMandolinNoun
  $CBCD,$0A "#MESSAGE$CBCD".
B $CBD7,$01 Terminator.

t $CBD8 Messaging: "any fragments"
@ $CBD8 label=Messaging_AnyFragments
  $CBD8,$0D "#MESSAGE$CBD8".
B $CBE5,$01 Terminator.

t $CBE6 Messaging: "a box"
@ $CBE6 label=Messaging_ABox
  $CBE6,$05 "#MESSAGE$CBE6".
B $CBEB,$01 Terminator.

t $CBEC Messaging: "a crowbar"
@ $CBEC label=Messaging_ACrowbarNoun
  $CBEC,$09 "#MESSAGE$CBEC".
B $CBF5,$01 Terminator.

t $CBF6 Messaging: "a shovel"
@ $CBF6 label=Messaging_AShovelNoun
  $CBF6,$08 "#MESSAGE$CBF6".
B $CBFE,$01 Terminator.

t $CBFF Messaging: "a map"
@ $CBFF label=Messaging_AMapNoun
  $CBFF,$05 "#MESSAGE$CBFF".
B $CC04,$01 Terminator.

t $CC05 Messaging: "a cage"
@ $CC05 label=Messaging_ACage
  $CC05,$06 "#MESSAGE$CC05".
B $CC0B,$01 Terminator.

t $CC0C Messaging: "a coin"
@ $CC0C label=Messaging_ACoin
  $CC0C,$06 "#MESSAGE$CC0C".
B $CC12,$01 Terminator.

t $CC13 Messaging: "any honey"
@ $CC13 label=Messaging_AnyHoney
  $CC13,$09 "#MESSAGE$CC13".
B $CC1C,$01 Terminator.

t $CC1D Messaging: "any meat"
@ $CC1D label=Messaging_AnyMeat
  $CC1D,$08 "#MESSAGE$CC1D".
B $CC25,$01 Terminator.

t $CC26 Messaging: "a cross"
@ $CC26 label=Messaging_ACross
  $CC26,$07 "#MESSAGE$CC26".
B $CC2D,$01 Terminator.

t $CC2E Messaging: "a mirror"
@ $CC2E label=Messaging_AMirror
  $CC2E,$08 "#MESSAGE$CC2E".
B $CC36,$01 Terminator.

t $CC37 Messaging: "a lizard"
@ $CC37 label=Messaging_ALizard
  $CC37,$08 "#MESSAGE$CC37".
B $CC3F,$01 Terminator.

t $CC40 Messaging: "a bear"
@ $CC40 label=Messaging_ABearNoun
  $CC40,$06 "#MESSAGE$CC40".
B $CC46,$01 Terminator.

t $CC47 Messaging: "any gates"
@ $CC47 label=Messaging_AnyGates
  $CC47,$09 "#MESSAGE$CC47".
B $CC50,$01 Terminator.

t $CC51 Messaging: "a barrowight"
@ $CC51 label=Messaging_ABarrowightNoun
  $CC51,$0C "#MESSAGE$CC51".
B $CC5D,$01 Terminator.

t $CC5E Messaging: "a spirit"
@ $CC5E label=Messaging_ASpiritNoun
  $CC5E,$08 "#MESSAGE$CC5E".
B $CC66,$01 Terminator.

t $CC67 Messaging: "a balrog"
@ $CC67 label=Messaging_ABalrogNoun
  $CC67,$08 "#MESSAGE$CC67".
B $CC6F,$01 Terminator.

t $CC70 Messaging: "a star"
@ $CC70 label=Messaging_AStar
  $CC70,$06 "#MESSAGE$CC70".
B $CC76,$01 Terminator.

t $CC77 Messaging: "a serpent"
@ $CC77 label=Messaging_ASerpentNoun
  $CC77,$09 "#MESSAGE$CC77".
B $CC80,$01 Terminator.

t $CC81 Messaging: "any stairs"
@ $CC81 label=Messaging_AnyStairs
  $CC81,$0A "#MESSAGE$CC81".
B $CC8B,$01 Terminator.

t $CC8C Messaging: "any bars"
@ $CC8C label=Messaging_AnyBars
  $CC8C,$08 "#MESSAGE$CC8C".
B $CC94,$01 Terminator.

t $CC95 Messaging: "a hydra"
@ $CC95 label=Messaging_AHydraNoun
  $CC95,$07 "#MESSAGE$CC95".
B $CC9C,$01 Terminator.

t $CC9D Messaging: "a spider"
@ $CC9D label=Messaging_ASpider
  $CC9D,$08 "#MESSAGE$CC9D".
B $CCA5,$01 Terminator.

t $CCA6 Messaging: "a chest"
@ $CCA6 label=Messaging_AChest
  $CCA6,$07 "#MESSAGE$CCA6".
B $CCAD,$01 Terminator.

t $CCAE Messaging: "a coffin"
@ $CCAE label=Messaging_ACoffinNoun
  $CCAE,$08 "#MESSAGE$CCAE".
B $CCB6,$01 Terminator.

t $CCB7 Messaging: "a vampire"
@ $CCB7 label=Messaging_AVampireNoun
  $CCB7,$09 "#MESSAGE$CCB7".
B $CCC0,$01 Terminator.

t $CCC1 Messaging: "the Knight"
@ $CCC1 label=Messaging_TheKnight
  $CCC1,$0A "#MESSAGE$CCC1".
B $CCCB,$01 Terminator.

t $CCCC Messaging: "a dragon"
@ $CCCC label=Messaging_ADragonNoun
  $CCCC,$08 "#MESSAGE$CCCC".
B $CCD4,$01 Terminator.

t $CCD5 Messaging: "a pirate"
@ $CCD5 label=Messaging_APirateNoun
  $CCD5,$08 "#MESSAGE$CCD5".
B $CCDD,$01 Terminator.

t $CCDE Messaging: "any fire"
@ $CCDE label=Messaging_AnyFire
  $CCDE,$08 "#MESSAGE$CCDE".
B $CCE6,$01 Terminator.

t $CCE7 Messaging: "a potion"
@ $CCE7 label=Messaging_APotion
  $CCE7,$08 "#MESSAGE$CCE7".
B $CCEF,$01 Terminator.

t $CCF0 Messaging: "a guard"
@ $CCF0 label=Messaging_AGuard
  $CCF0,$07 "#MESSAGE$CCF0".
B $CCF7,$01 Terminator.

t $CCF8 Messaging: "a door"
@ $CCF8 label=Messaging_ADoor
  $CCF8,$06 "#MESSAGE$CCF8".
B $CCFE,$01 Terminator.

t $CCFF Messaging: "a clam"
@ $CCFF label=Messaging_AClam
  $CCFF,$06 "#MESSAGE$CCFF".
B $CD05,$01 Terminator.

t $CD06 Messaging: "a plant"
@ $CD06 label=Messaging_APlant
  $CD06,$07 "#MESSAGE$CD06".
B $CD0D,$01 Terminator.

t $CD0E Messaging: "a witch"
@ $CD0E label=Messaging_AWitchNoun
  $CD0E,$07 "#MESSAGE$CD0E".
B $CD15,$01 Terminator.

t $CD16 Messaging: "a bat"
@ $CD16 label=Messaging_ABat
  $CD16,$05 "#MESSAGE$CD16".
B $CD1B,$01 Terminator.

t $CD1C Messaging: "Anton"
@ $CD1C label=Messaging_Anton
  $CD1C,$05 "#MESSAGE$CD1C".
B $CD21,$01 Terminator.

t $CD22 Messaging: "Beren"
@ $CD22 label=Messaging_Beren
  $CD22,$05 "#MESSAGE$CD22".
B $CD27,$01 Terminator.

t $CD28 Messaging: "Istar"
@ $CD28 label=Messaging_Istar
  $CD28,$05 "#MESSAGE$CD28".
B $CD2D,$01 Terminator.

t $CD2E Messaging: "Haldir"
@ $CD2E label=Messaging_Haldir
  $CD2E,$06 "#MESSAGE$CD2E".
B $CD34,$01 Terminator.

t $CD35 Messaging: "Khadim"
@ $CD35 label=Messaging_Khadim
  $CD35,$06 "#MESSAGE$CD35".
B $CD3B,$01 Terminator.

t $CD3C Messaging: "a phoenix"
@ $CD3C label=Messaging_APhoenixNoun
  $CD3C,$09 "#MESSAGE$CD3C".
B $CD45,$01 Terminator.

t $CD46 Messaging: "any ashes"
@ $CD46 label=Messaging_AnyAshes
  $CD46,$09 "#MESSAGE$CD46".
B $CD4F,$01 Terminator.

t $CD50 Messaging: "any gas"
@ $CD50 label=Messaging_AnyGas
  $CD50,$07 "#MESSAGE$CD50".
B $CD57,$01 Terminator.

g $CD58 Table: Item Descriptions
@ $CD58 label=Table_ItemDescriptions
E $CD58 View the equivalent code in;
. #LIST
. { #SHOCK$AFDD }
. { #FOREST$D3B8 }
. { #JEWELS$D34E }
. { #ANDROMEDA$84E6 }
. { #WARLORD$C732 }
. LIST#
D $CD58 One word per item. Each entry points at an #N$FF-terminated name.
W $CD58,$02 Item #N((#PC-$CD58)/$02):
. #IF(#EVAL(#PEEK(#PC)+#PEEK(#PC+$01)*$100)>$0000)(#R(#PEEK(#PC)+#PEEK(#PC+$01)*$100) #ITEM((#PC-$CD58)/$02),N/A).
L $CD58,$02,$87

g $CE66 Table: Room Descriptions
@ $CE66 label=Table_RoomDescriptions
E $CE66 View the equivalent code in;
. #LIST
. { #SHOCK$AE7D }
. { #FOREST$D44C }
. { #JEWELS$D3EC }
. { #ANDROMEDA$8568 }
. { #WARLORD$C8B0 }
. LIST#
D $CE66 One word per room. Rooms #N$00 and #N$01 are unused. The rest point at
. the room text.
W $CE66,$02
L $CE66,$02,$42

g $CEEA Table: Object Noun Phrases
@ $CEEA label=Table_ObjectNounPhrases
E $CEEA View the equivalent code in;
. #LIST
. { #SHOCK$AF31 }
. { #FOREST$D4E6 }
. { #JEWELS$D4C6 }
. { #ANDROMEDA$85E8 }
. { #WARLORD$C83E }
. LIST#
D $CEEA One word per object. Each entry points at the noun text.
W $CEEA,$02
L $CEEA,$02,$48

t $CF7A Messaging: "Congratulations !!! The heroes are rescued and..."
@ $CF7A label=Messaging_CongratulationsTheHeroesAreRescued
  $CF7A,$D1 "#MESSAGE$CF7A".
B $D04B,$01 Terminator.

t $D04C Messaging: "The scorching flames of the firegate have inci..."
@ $D04C label=Messaging_TheScorchingFlamesOfTheFiregateHave
  $D04C,$3A "#MESSAGE$D04C".
B $D086,$01 Terminator.

t $D087 Messaging: "Suddenly,the ashes burst into flames...."
@ $D087 label=Messaging_SuddenlyTheAshesBurstIntoFlames
  $D087,$28 "#MESSAGE$D087".
B $D0AF,$01 Terminator.

t $D0B0 Messaging: "A phoenix emerges from the fire and blocks you..."
@ $D0B0 label=Messaging_APhoenixEmergesFromTheFireAndBlocks
  $D0B0,$35 "#MESSAGE$D0B0".
B $D0E5,$01 Terminator.

t $D0E6 Messaging: "Read the information carefully."
@ $D0E6 label=Messaging_ReadTheInformationCarefully
  $D0E6,$1F "#MESSAGE$D0E6".
B $D105,$01 Terminator.

t $D106 Messaging: "It looks hungry."
@ $D106 label=Messaging_ItLooksHungry
  $D106,$10 "#MESSAGE$D106".
B $D116,$01 Terminator.

t $D117 Messaging: "Try a little music."
@ $D117 label=Messaging_TryALittleMusic
  $D117,$13 "#MESSAGE$D117".
B $D12A,$01 Terminator.

t $D12B Messaging: "Try corrosion."
@ $D12B label=Messaging_TryCorrosion
  $D12B,$0E "#MESSAGE$D12B".
B $D139,$01 Terminator.

t $D13A Messaging: "You don't really need it."
@ $D13A label=Messaging_YouDontReallyNeedIt
  $D13A,$19 "#MESSAGE$D13A".
B $D153,$01 Terminator.

t $D154 Messaging: "A guard appears...."
@ $D154 label=Messaging_AGuardAppears
  $D154,$13 "#MESSAGE$D154".
B $D167,$01 Terminator.

t $D168 Messaging: "You are taken away."
@ $D168 label=Messaging_YouAreTakenAway
  $D168,$13 "#MESSAGE$D168".
B $D17B,$01 Terminator.

t $D17C Messaging: "It appears to be bewitched."
@ $D17C label=Messaging_ItAppearsToBeBewitched
  $D17C,$1B "#MESSAGE$D17C".
B $D197,$01 Terminator.

t $D198 Messaging: "I see nothing special."
@ $D198 label=Messaging_ISeeNothingSpecial
  $D198,$16 "#MESSAGE$D198".
B $D1AE,$01 Terminator.

t $D1AF Messaging: "Like Pandora's maybe."
@ $D1AF label=Messaging_LikePandorasMaybe
  $D1AF,$15 "#MESSAGE$D1AF".
B $D1C4,$01 Terminator.

t $D1C5 Messaging: "It is very fragile."
@ $D1C5 label=Messaging_ItIsVeryFragile
  $D1C5,$13 "#MESSAGE$D1C5".
B $D1D8,$01 Terminator.

t $D1D9 Messaging: "The symbols are incomprehensible to you."
@ $D1D9 label=Messaging_TheSymbolsAreIncomprehensibleToYou
  $D1D9,$28 "#MESSAGE$D1D9".
B $D201,$01 Terminator.

t $D202 Messaging: "You're already carrying it."
@ $D202 label=Messaging_YoureAlreadyCarryingIt
  $D202,$1B "#MESSAGE$D202".
B $D21D,$01 Terminator.

t $D21E Messaging: "The swamp lizard prevents you."
@ $D21E label=Messaging_TheSwampLizardPreventsYou
  $D21E,$1E "#MESSAGE$D21E".
B $D23C,$01 Terminator.

t $D23D Messaging: "It is too high to reach."
@ $D23D label=Messaging_ItIsTooHighToReach
  $D23D,$18 "#MESSAGE$D23D".
B $D255,$01 Terminator.

t $D256 Messaging: "The spider prevents you."
@ $D256 label=Messaging_TheSpiderPreventsYou
  $D256,$18 "#MESSAGE$D256".
B $D26E,$01 Terminator.

t $D26F Messaging: "The barrowight prevents you."
@ $D26F label=Messaging_TheBarrowightPreventsYou
  $D26F,$1C "#MESSAGE$D26F".
B $D28B,$01 Terminator.

t $D28C Messaging: "A strange force stops you."
@ $D28C label=Messaging_AStrangeForceStopsYou
  $D28C,$1A "#MESSAGE$D28C".
B $D2A6,$01 Terminator.

t $D2A7 Messaging: "A jewelled key is revealed."
@ $D2A7 label=Messaging_AJewelledKeyIsRevealed
  $D2A7,$1B "#MESSAGE$D2A7".
B $D2C2,$01 Terminator.

t $D2C3 Messaging: "It is frightened of you and it flutters away."
@ $D2C3 label=Messaging_ItIsFrightenedOfYouAndItFluttersAway
  $D2C3,$2D "#MESSAGE$D2C3".
B $D2F0,$01 Terminator.

t $D2F1 Messaging: "It won't come to you."
@ $D2F1 label=Messaging_ItWontComeToYou
  $D2F1,$15 "#MESSAGE$D2F1".
B $D306,$01 Terminator.

t $D307 Messaging: "You now have a bottle of water."
@ $D307 label=Messaging_YouNowHaveABottleOfWater
  $D307,$1F "#MESSAGE$D307".
B $D326,$01 Terminator.

t $D327 Messaging: "You have nothing to carry it in."
@ $D327 label=Messaging_YouHaveNothingToCarryItIn
  $D327,$20 "#MESSAGE$D327".
B $D347,$01 Terminator.

t $D348 Messaging: "You now have a bottle of acid."
@ $D348 label=Messaging_YouNowHaveABottleOfAcid
  $D348,$1E "#MESSAGE$D348".
B $D366,$01 Terminator.

t $D367 Messaging: "You now have a bottle of oil."
@ $D367 label=Messaging_YouNowHaveABottleOfOil
  $D367,$1D "#MESSAGE$D367".
B $D384,$01 Terminator.

t $D385 Messaging: "As you take the pillow,the flower slips off on..."
@ $D385 label=Messaging_AsYouTakeThePillowTheFlowerSlips
  $D385,$48 "#MESSAGE$D385".
B $D3CD,$01 Terminator.

t $D3CE Messaging: "The flower now rests on the velvet pillow."
@ $D3CE label=Messaging_TheFlowerNowRestsOnTheVelvetPillow
  $D3CE,$2B "#MESSAGE$D3CE".
B $D3F9,$01 Terminator.

t $D3FA Messaging: "The flower drops and breaks into many fragments."
@ $D3FA label=Messaging_TheFlowerDropsAndBreaksIntoManyFragments
  $D3FA,$30 "#MESSAGE$D3FA".
B $D42A,$01 Terminator.

t $D42B Messaging: "The bat prevents you."
@ $D42B label=Messaging_TheBatPreventsYou
  $D42B,$15 "#MESSAGE$D42B".
B $D440,$01 Terminator.

t $D441 Messaging: "The dragon prevents you."
@ $D441 label=Messaging_TheDragonPreventsYou
  $D441,$18 "#MESSAGE$D441".
B $D459,$01 Terminator.

t $D45A Messaging: "I don't see the point."
@ $D45A label=Messaging_IDontSeeThePoint_Duplicate
  $D45A,$16 "#MESSAGE$D45A".
B $D470,$01 Terminator.

t $D471 Messaging: "You can't. It's sleeping."
@ $D471 label=Messaging_YouCantIts
  $D471,$19 "#MESSAGE$D471".
B $D48A,$01 Terminator.

t $D48B Messaging: "Anton takes the mirror and he examines it brie..."
@ $D48B label=Messaging_AntonTakesTheMirrorAndHeExaminesItBriefly
  $D48B,$77 "#MESSAGE$D48B".
B $D502,$01 Terminator.

t $D503 Messaging: "Anton takes the coin and says:- 'I see you pla..."
@ $D503 label=Messaging_AntonTakesTheCoinAndSaysISeeYouPlaying
  $D503,$72 "#MESSAGE$D503".
B $D575,$01 Terminator.

t $D576 Messaging: "The bear eats the honey,yawns and promptly goe..."
@ $D576 label=Messaging_TheBearEatsTheHoneyYawnsAndPromptlyGoes
  $D576,$39 "#MESSAGE$D576".
B $D5AF,$01 Terminator.

t $D5B0 Messaging: "The falcon eats the meat and becomes more doci..."
@ $D5B0 label=Messaging_TheFalconEatsTheMeatAndBecomesMoreDocile
  $D5B0,$31 "#MESSAGE$D5B0".
B $D5E1,$01 Terminator.

t $D5E2 Messaging: "It is greedily devoured."
@ $D5E2 label=Messaging_ItIsGreedilyDevoured
  $D5E2,$18 "#MESSAGE$D5E2".
B $D5FA,$01 Terminator.

t $D5FB Messaging: "Anton says:- 'No! Get me a' magic mirror.'"
@ $D5FB label=Messaging_AntonSaysNoGetMeAMagicMirror
  $D5FB,$2A "#MESSAGE$D5FB".
B $D625,$01 Terminator.

t $D626 Messaging: "You must be joking!"
@ $D626 label=Messaging_YouMustBeJoking
  $D626,$13 "#MESSAGE$D626".
B $D639,$01 Terminator.

t $D63A Messaging: "You kiss the frog... The air starts to shimmer..."
@ $D63A label=Messaging_YouKissTheFrog
  $D63A,$31 "#MESSAGE$D63A".
B $D66B,$01 Terminator.

t $D66C Messaging: "The frog vanishes,and Beren stands in its place."
@ $D66C label=Messaging_TheFrogVanishesAndBerenStandsInItsPlace
  $D66C,$30 "#MESSAGE$D66C".
B $D69C,$01 Terminator.

t $D69D Messaging: "You open the box and from it there issues a ho..."
@ $D69D label=Messaging_YouOpenTheBoxAndFromItThereIssuesAHowling
  $D69D,$52 "#MESSAGE$D69D".
B $D6EF,$01 Terminator.

t $D6F0 Messaging: "The smoke is blown away for a brief while."
@ $D6F0 label=Messaging_TheSmokeIsBlownAwayForABriefWhile
  $D6F0,$2A "#MESSAGE$D6F0".
B $D71A,$01 Terminator.

t $D71B Messaging: "You can see a ruby."
@ $D71B label=Messaging_YouCanSeeARuby
  $D71B,$13 "#MESSAGE$D71B".
B $D72E,$01 Terminator.

t $D72F Messaging: "It is already open."
@ $D72F label=Messaging_ItIsAlreadyOpen
  $D72F,$13 "#MESSAGE$D72F".
B $D742,$01 Terminator.

t $D743 Messaging: "It is already closed."
@ $D743 label=Messaging_ItIsAlreadyClosed
  $D743,$15 "#MESSAGE$D743".
B $D758,$01 Terminator.

t $D759 Messaging: "They are already open."
@ $D759 label=Messaging_TheyAreAlreadyOpen
  $D759,$16 "#MESSAGE$D759".
B $D76F,$01 Terminator.

t $D770 Messaging: "They are already closed."
@ $D770 label=Messaging_TheyAreAlreadyClosed
  $D770,$18 "#MESSAGE$D770".
B $D788,$01 Terminator.

t $D789 Messaging: "You need the proper key."
@ $D789 label=Messaging_YouNeedTheProperKey
  $D789,$18 "#MESSAGE$D789".
B $D7A1,$01 Terminator.

t $D7A2 Messaging: "The hinges are too rusty."
@ $D7A2 label=Messaging_TheHingesAreTooRusty
  $D7A2,$19 "#MESSAGE$D7A2".
B $D7BB,$01 Terminator.

t $D7BC Messaging: "With hinges protesting noisily, you open the c..."
@ $D7BC label=Messaging_WithHingesProtestingNoisilyYouOpenTheChest
  $D7BC,$46 "#MESSAGE$D7BC".
B $D802,$01 Terminator.

t $D803 Messaging: "They're not here!"
@ $D803 label=Messaging_TheyreNotHere
  $D803,$11 "#MESSAGE$D803".
B $D814,$01 Terminator.

t $D815 Messaging: "You open the coffin and a vampire jumps out."
@ $D815 label=Messaging_YouOpenTheCoffinAndAVampireJumpsOut
  $D815,$2C "#MESSAGE$D815".
B $D841,$01 Terminator.

t $D842 Messaging: "You make several attempts,but it is closed tig..."
@ $D842 label=Messaging_YouMakeSeveralAttemptsButItIsClosedTightly
  $D842,$33 "#MESSAGE$D842".
B $D875,$01 Terminator.

t $D876 Messaging: "The clam reluctantly opens, revealing a pearl."
@ $D876 label=Messaging_TheClamReluctantlyOpensRevealingAPearl
  $D876,$2E "#MESSAGE$D876".
B $D8A4,$01 Terminator.

t $D8A5 Messaging: "The guard takes the money then opens the door...."
@ $D8A5 label=Messaging_TheGuardTakesTheMoneyThenOpensTheDoor
  $D8A5,$49 "#MESSAGE$D8A5".
B $D8EE,$01 Terminator.

t $D8EF Messaging: "You find no salvation there."
@ $D8EF label=Messaging_YouFindNoSalvationThere
  $D8EF,$1C "#MESSAGE$D8EF".
B $D90B,$01 Terminator.

t $D90C Messaging: "Don't be ridiculous."
@ $D90C label=Messaging_DontBeRidiculous
  $D90C,$14 "#MESSAGE$D90C".
B $D920,$01 Terminator.

t $D921 Messaging: "You play a nice tune."
@ $D921 label=Messaging_YouPlayANiceTune
  $D921,$15 "#MESSAGE$D921".
B $D936,$01 Terminator.

t $D937 Messaging: "The bottle shatters."
@ $D937 label=Messaging_TheBottleShatters
  $D937,$14 "#MESSAGE$D937".
B $D94B,$01 Terminator.

t $D94C Messaging: "The flower drops onto the hard floor and shatt..."
@ $D94C label=Messaging_TheFlowerDropsOntoTheHardFloorAndShatters
  $D94C,$32 "#MESSAGE$D94C".
B $D97E,$01 Terminator.

t $D97F Messaging: "The flower drops and gently comes to rest on t..."
@ $D97F label=Messaging_TheFlowerDropsAndGentlyComesToRest
  $D97F,$38 "#MESSAGE$D97F".
B $D9B7,$01 Terminator.

t $D9B8 Messaging: "The bridge shudders and then crumbles away."
@ $D9B8 label=Messaging_TheBridgeShuddersAndThenCrumblesAway
  $D9B8,$2B "#MESSAGE$D9B8".
B $D9E3,$01 Terminator.

t $D9E4 Messaging: "The balrog tumbles to its death."
@ $D9E4 label=Messaging_TheBalrogTumblesToItsDeath
  $D9E4,$20 "#MESSAGE$D9E4".
B $DA04,$01 Terminator.

t $DA05 Messaging: "Your vision clears and you can now see the exit."
@ $DA05 label=Messaging_YourVisionClearsAndYouCanNowSeeTheExit
  $DA05,$30 "#MESSAGE$DA05".
B $DA35,$01 Terminator.

t $DA36 Messaging: "The bars tremble and break. Istar is free."
@ $DA36 label=Messaging_TheBarsTrembleAndBreak
  $DA36,$2A "#MESSAGE$DA36".
B $DA60,$01 Terminator.

t $DA61 Messaging: "With a great wailing the barrowight is destroy..."
@ $DA61 label=Messaging_WithAGreatWailingTheBarrowightIsDestroyed
  $DA61,$31 "#MESSAGE$DA61".
B $DA92,$01 Terminator.

t $DA93 Messaging: "In a flurry of flying feathers, the bird kills..."
@ $DA93 label=Messaging_InAFlurryOfFlyingFeathersTheBirdKills
  $DA93,$3B "#MESSAGE$DA93".
B $DACE,$01 Terminator.

t $DACF Messaging: "It is a fruitless exercise. As you strike off..."
@ $DACF label=Messaging_ItIsAFruitlessExercise
  $DACF,$53 "#MESSAGE$DACF".
B $DB22,$01 Terminator.

t $DB23 Messaging: "You pierce the monster's heart. Purple blood r..."
@ $DB23 label=Messaging_YouPierceTheMonstersHeart
  $DB23,$53 "#MESSAGE$DB23".
B $DB76,$01 Terminator.

t $DB77 Messaging: "It's already dead."
@ $DB77 label=Messaging_ItsAlreadyDead
  $DB77,$12 "#MESSAGE$DB77".
B $DB89,$01 Terminator.

t $DB8A Messaging: "He's already dead."
@ $DB8A label=Messaging_HesAlreadyDead
  $DB8A,$12 "#MESSAGE$DB8A".
B $DB9C,$01 Terminator.

t $DB9D Messaging: "The vampire screams,there is a blinding flash..."
@ $DB9D label=Messaging_TheVampireScreamsThereIsABlindingFlash
  $DB9D,$3E "#MESSAGE$DB9D".
B $DBDB,$01 Terminator.

t $DBDC Messaging: "As the light fades,you see Haldir standing the..."
@ $DBDC label=Messaging_AsTheLightFadesYouSeeHaldirStandingThere
  $DBDC,$31 "#MESSAGE$DBDC".
B $DC0D,$01 Terminator.

t $DC0E Messaging: "The Knight writhes in agony as the vitriolic l..."
@ $DC0E label=Messaging_TheKnightWrithesInAgonyAsTheVitriolic
  $DC0E,$56 "#MESSAGE$DC0E".
B $DC64,$01 Terminator.

t $DC65 Messaging: "Your blow strikes true. With a last faint roar..."
@ $DC65 label=Messaging_YourBlowStrikesTrue
  $DC65,$37 "#MESSAGE$DC65".
B $DC9C,$01 Terminator.

t $DC9D Messaging: "As you attack,the pirate hides in a tunnel,too..."
@ $DC9D label=Messaging_AsYouAttackThePirateHidesInATunnelTooSmall
  $DC9D,$46 "#MESSAGE$DC9D".
B $DCE3,$01 Terminator.

t $DCE4 Messaging: "The witch dies screaming."
@ $DCE4 label=Messaging_TheWitchDiesScreaming
  $DCE4,$19 "#MESSAGE$DCE4".
B $DCFD,$01 Terminator.

t $DCFE Messaging: "She is already dead."
@ $DCFE label=Messaging_SheIsAlreadyDead
  $DCFE,$14 "#MESSAGE$DCFE".
B $DD12,$01 Terminator.

t $DD13 Messaging: "It won't obey you."
@ $DD13 label=Messaging_ItWontObeyYou
  $DD13,$12 "#MESSAGE$DD13".
B $DD25,$01 Terminator.

t $DD26 Messaging: "You have no oil."
@ $DD26 label=Messaging_YouHaveNoOil
  $DD26,$10 "#MESSAGE$DD26".
B $DD36,$01 Terminator.

t $DD37 Messaging: "You have no water."
@ $DD37 label=Messaging_YouHaveNoWater
  $DD37,$12 "#MESSAGE$DD37".
B $DD49,$01 Terminator.

t $DD4A Messaging: "The plant grows swiftly then suddenly stops,at..."
@ $DD4A label=Messaging_ThePlantGrowsSwiftlyThenSuddenlyStopsAt
  $DD4A,$44 "#MESSAGE$DD4A".
B $DD8E,$01 Terminator.

t $DD8F Messaging: "The plant grows and forms a giant beanstalk re..."
@ $DD8F label=Messaging_ThePlantGrowsAndFormsAGiantBeanstalk
  $DD8F,$3C "#MESSAGE$DD8F".
B $DDCB,$01 Terminator.

t $DDCC Messaging: "The ashes sizzle fiercely for a moment,then th..."
@ $DDCC label=Messaging_TheAshesSizzleFiercelyForAMoment
  $DDCC,$41 "#MESSAGE$DDCC".
B $DE0D,$01 Terminator.

t $DE0E Messaging: "You take a refreshing drink."
@ $DE0E label=Messaging_YouTakeARefreshingDrink
  $DE0E,$1C "#MESSAGE$DE0E".
B $DE2A,$01 Terminator.

t $DE2B Messaging: "You drink the black potion. It is poisonous."
@ $DE2B label=Messaging_YouDrinkTheBlackPotion
  $DE2B,$2C "#MESSAGE$DE2B".
B $DE57,$01 Terminator.

t $DE58 Messaging: "You have nothing to dig with."
@ $DE58 label=Messaging_YouHaveNothingToDigWith
  $DE58,$1D "#MESSAGE$DE58".
B $DE75,$01 Terminator.

t $DE76 Messaging: "You find nothing."
@ $DE76 label=Messaging_YouFindNothing
  $DE76,$11 "#MESSAGE$DE76".
B $DE87,$01 Terminator.

t $DE88 Messaging: "You uncover an emerald!"
@ $DE88 label=Messaging_YouUncoverAnEmerald
  $DE88,$17 "#MESSAGE$DE88".
B $DE9F,$01 Terminator.

t $DEA0 Messaging: "That is biologically impossible."
@ $DEA0 label=Messaging_ThatIsBiologicallyImpossible
  $DEA0,$20 "#MESSAGE$DEA0".
B $DEC0,$01 Terminator.

t $DEC1 Messaging: "He's not keen on the idea."
@ $DEC1 label=Messaging_HesNotKeenOnTheIdea
  $DEC1,$1A "#MESSAGE$DEC1".
B $DEDB,$01 Terminator.

t $DEDC Messaging: "You have nothing to light it with."
@ $DEDC label=Messaging_YouHaveNothingToLightItWith
  $DEDC,$22 "#MESSAGE$DEDC".
B $DEFE,$01 Terminator.

t $DEFF Messaging: "The pungent vapour ignites and the lizard is i..."
@ $DEFF label=Messaging_ThePungentVapourIgnitesAndTheLizardIs
  $DEFF,$39 "#MESSAGE$DEFF".
B $DF38,$01 Terminator.

t $DF39 Messaging: "It isn't here."
@ $DF39 label=Messaging_ItIsntHere
  $DF39,$0E "#MESSAGE$DF39".
B $DF47,$01 Terminator.

t $DF48 Messaging: "Even Beren is unable to calm it."
@ $DF48 label=Messaging_EvenBerenIsUnableToCalmIt
  $DF48,$20 "#MESSAGE$DF48".
B $DF68,$01 Terminator.

t $DF69 Messaging: "The songbird ignores you."
@ $DF69 label=Messaging_TheSongbirdIgnoresYou
  $DF69,$19 "#MESSAGE$DF69".
B $DF82,$01 Terminator.

t $DF83 Messaging: "The falcon launches itself upward.It circles,b..."
@ $DF83 label=Messaging_TheFalconLaunchesItselfUpward
  $DF83,$6F "#MESSAGE$DF83".
B $DFF2,$01 Terminator.

t $DFF3 Messaging: "Nothing happens."
@ $DFF3 label=Messaging_NothingHappens
  $DFF3,$10 "#MESSAGE$DFF3".
B $E003,$01 Terminator.

t $E004 Messaging: "The wand emits a shaft of shimmering blue ligh..."
@ $E004 label=Messaging_TheWandEmitsAShaftOfShimmeringBlueLight
  $E004,$6A "#MESSAGE$E004".
B $E06E,$01 Terminator.

t $E06F Messaging: "In a dazzle of glory,a crystal bridge appears..."
@ $E06F label=Messaging_InADazzleOfGloryACrystalBridgeAppears
  $E06F,$40 "#MESSAGE$E06F".
B $E0AF,$01 Terminator.

t $E0B0 Messaging: "There is a balrog on the bridge, preventing yo..."
@ $E0B0 label=Messaging_ThereIsABalrogOnTheBridgePreventing
  $E0B0,$39 "#MESSAGE$E0B0".
B $E0E9,$01 Terminator.

t $E0EA Messaging: "The pirate prevents you."
@ $E0EA label=Messaging_ThePiratePreventsYou
  $E0EA,$18 "#MESSAGE$E0EA".
B $E102,$01 Terminator.

t $E103 Messaging: "It says:- 'Seek a treasure between the castle..."
@ $E103 label=Messaging_ItSaysSeekATreasureBetweenTheCastle
  $E103,$3B "#MESSAGE$E103".
B $E13E,$01 Terminator.

t $E13F Messaging: "It reads:- 'Say 'ORION' among the stars.'"
@ $E13F label=Messaging_ItReadsSayOrionAmongTheStars
  $E13F,$29 "#MESSAGE$E13F".
B $E168,$01 Terminator.

t $E169 Messaging: "Haldir's nimble fingers pluck the golden strin..."
@ $E169 label=Messaging_HaldirsNimbleFingersPluckTheGoldenStrings
  $E169,$5B "#MESSAGE$E169".
B $E1C4,$01 Terminator.

t $E1C5 Messaging: "The pirate hides in the tunnel but Khadim foll..."
@ $E1C5 label=Messaging_ThePirateHidesInTheTunnelButKhadimFollows
  $E1C5,$40 "#MESSAGE$E1C5".
B $E205,$01 Terminator.

t $E206 Messaging: "He says 'No'."
@ $E206 label=Messaging_HeSaysNo
  $E206,$0D "#MESSAGE$E206".
B $E213,$01 Terminator.

t $E214 Messaging: "It is empty already."
@ $E214 label=Messaging_ItIsEmptyAlready
  $E214,$14 "#MESSAGE$E214".
B $E228,$01 Terminator.

t $E229 Messaging: "You pour the liquid away. The bottle is now em..."
@ $E229 label=Messaging_YouPourTheLiquidAway
  $E229,$32 "#MESSAGE$E229".
B $E25B,$01 Terminator.

t $E25C Table: Vocabulary
@ $E25C label=Table_Vocabulary
E $E25C View the equivalent code in;
. #LIST
. { #SHOCK$B0ED }
. { #FOREST$E4AF }
. { #JEWELS$E61D }
. { #ANDROMEDA$8632 }
. { #WARLORD$E0B1 }
. LIST#
D $E25C Four-character words. A comma binds synonyms to the same command.
  $E25C,$09 Command #N$00.
  $E265,$09 Command #N$01.
  $E26E,$09 Command #N$02.
  $E277,$04 Command #N((#PC-$E26B)/$04).
L $E277,$04,$05
  $E28B,$09 Command #N$08.
  $E294,$09 Command #N$09.
  $E29D,$09 Command #N$0A.
  $E2A6,$09 Command #N$0B.
  $E2AF,$09 Command #N$0C.
  $E2B8,$09 Command #N$0D.
  $E2C1,$09 Command #N$0E.
  $E2CA,$09 Command #N$0F.
  $E2D3,$04 Command #N((#PC-$E293)/$04).
L $E2D3,$04,$07
  $E2EF,$09 Command #N$17.
  $E2F8,$04 Command #N$18: #OBJECT$18.
  $E2FC,$04 Command #N$19: #OBJECT$16.
  $E300,$04 Command #N((#PC-$E298)/$04).
L $E300,$04,$02
  $E308,$0E Command #N$1C.
  $E316,$04 Command #N((#PC-$E2A2)/$04): #OBJECT((#PC-$E212)/$04).
L $E316,$04,$04
  $E326,$04 Command #N((#PC-$E2A2)/$04).
L $E326,$04,$06
  $E33E,$04 Command #N((#PC-$E2A2)/$04): #OBJECT((#PC-$E33E)/$04).
L $E33E,$04,$0F
  $E37A,$09 Command #N$36: #OBJECT$0F.
  $E383,$04 Command #N((#PC-$E2A7)/$04): #OBJECT((#PC-$E343)/$04).
L $E383,$04,$06
  $E39B,$04 Command #N$3D: #OBJECT$17.
  $E39F,$04 Command #N((#PC-$E2A7)/$04): #OBJECT((#PC-$E33B)/$04).
L $E39F,$04,$19
  $E403,$09 Command #N$57: #OBJECT$32.
  $E40C,$04 Command #N((#PC-$E2AC)/$04): #OBJECT((#PC-$E340)/$04).
L $E40C,$04,$0A
  $E434,$09 Command #N$62: #OBJECT$3D.
  $E43D,$04 Command #N((#PC-$E2B1)/$04): #OBJECT((#PC-$E345)/$04).
L $E43D,$04,$03
  $E449,$04 Command #N((#PC-$E2B1)/$04): #OBJECT((#PC-$E335)/$04).
L $E449,$04,$03
  $E455,$04 Command #N((#PC-$E2B1)/$04).
L $E455,$04,$04
  $E465,$09 Command #N$6D.
  $E46E,$09 Command #N$6E.
  $E477,$04 Command #N((#PC-$E2BB)/$04).
L $E477,$04,$10
B $E4B7,$01 Terminator.

g $E4B8 Table: Object Words
@ $E4B8 label=Table_TokenItemList
E $E4B8 View the equivalent code in;
. #LIST
. { #SHOCK$B49E }
. { #FOREST$E6BC }
. { #JEWELS$E83E }
. { #ANDROMEDA$8868 }
. { #WARLORD$E308 }
. LIST#
D $E4B8 The vocabulary number (#R$E25C) of each of the #N$48 objects the player
. can name (the count is at #R$AEF2). The position of a word in this list is
. its object number, which also indexes #R$E5F7 for the items it may mean.
.
. Reached through #R$AEE2: #R$B5A4 counts the object words in a command, and
. #R$B6BC looks each named object up here.
B $E4B8,$01 Object #OBJECT$00: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4B9,$01 Object #OBJECT$01: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4BA,$01 Object #OBJECT$02: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4BB,$01 Object #OBJECT$03: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4BC,$01 Object #OBJECT$04: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4BD,$01 Object #OBJECT$05: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4BE,$01 Object #OBJECT$06: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4BF,$01 Object #OBJECT$07: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C0,$01 Object #OBJECT$08: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C1,$01 Object #OBJECT$09: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C2,$01 Object #OBJECT$0A: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C3,$01 Object #OBJECT$0B: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C4,$01 Object #OBJECT$0C: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C5,$01 Object #OBJECT$0D: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C6,$01 Object #OBJECT$0E: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C7,$01 Object #OBJECT$0F: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C8,$01 Object #OBJECT$10: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4C9,$01 Object #OBJECT$11: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4CA,$01 Object #OBJECT$12: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4CB,$01 Object #OBJECT$13: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4CC,$01 Object #OBJECT$14: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4CD,$01 Object #OBJECT$15: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4CE,$01 Object #OBJECT$16: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4CF,$01 Object #OBJECT$17: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D0,$01 Object #OBJECT$18: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D1,$01 Object #OBJECT$19: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D2,$01 Object #OBJECT$1A: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D3,$01 Object #OBJECT$1B: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D4,$01 Object #OBJECT$1C: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D5,$01 Object #OBJECT$1D: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D6,$01 Object #OBJECT$1E: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D7,$01 Object #OBJECT$1F: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D8,$01 Object #OBJECT$20: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4D9,$01 Object #OBJECT$21: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4DA,$01 Object #OBJECT$22: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4DB,$01 Object #OBJECT$23: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4DC,$01 Object #OBJECT$24: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4DD,$01 Object #OBJECT$25: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4DE,$01 Object #OBJECT$26: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4DF,$01 Object #OBJECT$27: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E0,$01 Object #OBJECT$28: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E1,$01 Object #OBJECT$29: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E2,$01 Object #OBJECT$2A: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E3,$01 Object #OBJECT$2B: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E4,$01 Object #OBJECT$2C: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E5,$01 Object #OBJECT$2D: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E6,$01 Object #OBJECT$2E: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E7,$01 Object #OBJECT$2F: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E8,$01 Object #OBJECT$30: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4E9,$01 Object #OBJECT$31: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4EA,$01 Object #OBJECT$32: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4EB,$01 Object #OBJECT$33: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4EC,$01 Object #OBJECT$34: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4ED,$01 Object #OBJECT$35: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4EE,$01 Object #OBJECT$36: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4EF,$01 Object #OBJECT$37: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F0,$01 Object #OBJECT$38: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F1,$01 Object #OBJECT$39: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F2,$01 Object #OBJECT$3A: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F3,$01 Object #OBJECT$3B: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F4,$01 Object #OBJECT$3C: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F5,$01 Object #OBJECT$3D: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F6,$01 Object #OBJECT$3E: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F7,$01 Object #OBJECT$3F: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F8,$01 Object #OBJECT$40: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4F9,$01 Object #OBJECT$41: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4FA,$01 Object #OBJECT$42: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4FB,$01 Object #OBJECT$43: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4FC,$01 Object #OBJECT$44: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4FD,$01 Object #OBJECT$45: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4FE,$01 Object #OBJECT$46: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).
B $E4FF,$01 Object #OBJECT$47: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)).

g $E500 Table: Item Groups
@ $E500 label=Table_ItemGroups
E $E500 View the equivalent code in;
. #LIST
. { #SHOCK$B4F4 }
. { #FOREST$E6E6 }
. { #JEWELS$E86E }
. { #ANDROMEDA$888D }
. { #WARLORD$E341 }
. LIST#
D $E500 For each object in #R$CEEA, in the same order: the items it may refer
. to, ending with #N$FF. The pointers at #R$E5F7 say where each group starts.
B $E500,$02 Object #N$00 (a ruby): #ITEM$4A.
@ $E502 label=Data_ItemGroup_Diamond
B $E502,$02 Object #N$01 (a diamond): #ITEM$4D.
@ $E504 label=Data_ItemGroup_Flower
B $E504,$03 Object #N$02 (a flower): #ITEM$58 or #ITEM$83.
@ $E507 label=Data_ItemGroup_Sapphire
B $E507,$02 Object #N$03 (a sapphire): #ITEM$5C.
@ $E509 label=Data_ItemGroup_Emerald
B $E509,$02 Object #N$04 (an emerald): #ITEM$72.
@ $E50B label=Data_ItemGroup_Pearl
B $E50B,$02 Object #N$05 (a pearl): #ITEM$75.
@ $E50D label=Data_ItemGroup_Tinderbox
B $E50D,$02 Object #N$06 (a tinderbox): #ITEM$04.
@ $E50F label=Data_ItemGroup_Frog
B $E50F,$02 Object #N$07 (a frog): #ITEM$05.
@ $E511 label=Data_ItemGroup_Money
B $E511,$02 Object #N$08 (any money): #ITEM$21.
@ $E513 label=Data_ItemGroup_Bible
B $E513,$02 Object #N$09 (a bible): #ITEM$23.
@ $E515 label=Data_ItemGroup_Wand
B $E515,$02 Object #N$0A (a wand): #ITEM$24.
@ $E517 label=Data_ItemGroup_Scroll
B $E517,$02 Object #N$0B (a scroll): #ITEM$25.
@ $E519 label=Data_ItemGroup_Flute
B $E519,$02 Object #N$0C (a flute): #ITEM$26.
@ $E51B label=Data_ItemGroup_Carpet
B $E51B,$02 Object #N$0D (a carpet): #ITEM$27.
@ $E51D label=Data_ItemGroup_Key
B $E51D,$04 Object #N$0E (a key): #ITEM$28, #ITEM$47 or #ITEM$6C.
@ $E521 label=Data_ItemGroup_Songbird
B $E521,$03 Object #N$0F (a songbird): #ITEM$2A or #ITEM$2B.
@ $E524 label=Data_ItemGroup_Sword
B $E524,$02 Object #N$10 (a sword): #ITEM$2F.
@ $E526 label=Data_ItemGroup_Spear
B $E526,$02 Object #N$11 (a spear): #ITEM$30.
@ $E528 label=Data_ItemGroup_Dagger
B $E528,$02 Object #N$12 (a dagger): #ITEM$31.
@ $E52A label=Data_ItemGroup_Pillow
B $E52A,$03 Object #N$13 (a pillow): #ITEM$32 or #ITEM$83.
@ $E52D label=Data_ItemGroup_Falcon
B $E52D,$02 Object #N$14 (a falcon): #ITEM$36.
@ $E52F label=Data_ItemGroup_Bottle
B $E52F,$06 Object #N$15 (a bottle): #ITEM$37, #ITEM$38, #ITEM$39,
. #ITEM$3A or #ITEM$3B.
@ $E535 label=Data_ItemGroup_Water
B $E535,$03 Object #N$16 (any water): #ITEM$38 or #ITEM$5A.
@ $E538 label=Data_ItemGroup_Acid
B $E538,$03 Object #N$17 (any acid): #ITEM$39 or #ITEM$4C.
@ $E53B label=Data_ItemGroup_Oil
B $E53B,$03 Object #N$18 (any oil): #ITEM$3A or #ITEM$4B.
@ $E53E label=Data_ItemGroup_Lyre
B $E53E,$02 Object #N$19 (a lyre): #ITEM$45.
@ $E540 label=Data_ItemGroup_Mandolin
B $E540,$02 Object #N$1A (a mandolin): #ITEM$46.
@ $E542 label=Data_ItemGroup_Fragments
B $E542,$02 Object #N$1B (any fragments): #ITEM$59.
@ $E544 label=Data_ItemGroup_Box
B $E544,$02 Object #N$1C (a box): #ITEM$5B.
@ $E546 label=Data_ItemGroup_Crowbar
B $E546,$02 Object #N$1D (a crowbar): #ITEM$5F.
@ $E548 label=Data_ItemGroup_Shovel
B $E548,$02 Object #N$1E (a shovel): #ITEM$60.
@ $E54A label=Data_ItemGroup_Map
B $E54A,$02 Object #N$1F (a map): #ITEM$61.
@ $E54C label=Data_ItemGroup_Cage
B $E54C,$03 Object #N$20 (a cage): #ITEM$64 or #ITEM$2B.
@ $E54F label=Data_ItemGroup_Coin
B $E54F,$02 Object #N$21 (a coin): #ITEM$65.
@ $E551 label=Data_ItemGroup_Honey
B $E551,$02 Object #N$22 (any honey): #ITEM$70.
@ $E553 label=Data_ItemGroup_Meat
B $E553,$02 Object #N$23 (any meat): #ITEM$71.
@ $E555 label=Data_ItemGroup_Cross
B $E555,$02 Object #N$24 (a cross): #ITEM$7B.
@ $E557 label=Data_ItemGroup_Mirror
B $E557,$02 Object #N$25 (a mirror): #ITEM$7E.
@ $E559 label=Data_ItemGroup_Lizard
B $E559,$02 Object #N$26 (a lizard): #ITEM$06.
@ $E55B label=Data_ItemGroup_Bear
B $E55B,$03 Object #N$27 (a bear): #ITEM$07 or #ITEM$08.
@ $E55E label=Data_ItemGroup_Gates
B $E55E,$19 Object #N$28 (any gates): #ITEM$09 through #ITEM$20.
@ $E577 label=Data_ItemGroup_Barrowight
B $E577,$02 Object #N$29 (a barrowight): #ITEM$22.
@ $E579 label=Data_ItemGroup_Spirit
B $E579,$02 Object #N$2A (a spirit): #ITEM$29.
@ $E57B label=Data_ItemGroup_Balrog
B $E57B,$02 Object #N$2B (a balrog): #ITEM$2C.
@ $E57D label=Data_ItemGroup_Star
B $E57D,$04 Object #N$2C (a star): #ITEM$33, #ITEM$34 or #ITEM$35.
@ $E581 label=Data_ItemGroup_Serpent
B $E581,$03 Object #N$2D (a serpent): #ITEM$3C or #ITEM$3D.
@ $E584 label=Data_ItemGroup_Stairs
B $E584,$07 Object #N$2E (any stairs): #ITEM$3F through #ITEM$44.
@ $E58B label=Data_ItemGroup_Bars
B $E58B,$02 Object #N$2F (any bars): #ITEM$3E.
@ $E58D label=Data_ItemGroup_Hydra
B $E58D,$03 Object #N$30 (a hydra): #ITEM$48 or #ITEM$49.
@ $E590 label=Data_ItemGroup_Spider
B $E590,$03 Object #N$31 (a spider): #ITEM$4E or #ITEM$4F.
@ $E593 label=Data_ItemGroup_Chest
B $E593,$04 Object #N$32 (a chest): #ITEM$50, #ITEM$51 or #ITEM$52.
@ $E597 label=Data_ItemGroup_Coffin
B $E597,$03 Object #N$33 (a coffin): #ITEM$53 or #ITEM$54.
@ $E59A label=Data_ItemGroup_Vampire
B $E59A,$02 Object #N$34 (a vampire): #ITEM$55.
@ $E59C label=Data_ItemGroup_Knight
B $E59C,$03 Object #N$35 (the Knight): #ITEM$56 or #ITEM$57.
@ $E59F label=Data_ItemGroup_Dragon
B $E59F,$03 Object #N$36 (a dragon): #ITEM$5D or #ITEM$5E.
@ $E5A2 label=Data_ItemGroup_Pirate
B $E5A2,$03 Object #N$37 (a pirate): #ITEM$62 or #ITEM$63.
@ $E5A5 label=Data_ItemGroup_Fire
B $E5A5,$05 Object #N$38 (any fire): #ITEM$66, #ITEM$67, #ITEM$68 or
. #ITEM$69.
@ $E5AA label=Data_ItemGroup_Potion
B $E5AA,$03 Object #N$39 (a potion): #ITEM$6A or #ITEM$6B.
@ $E5AD label=Data_ItemGroup_Guard
B $E5AD,$03 Object #N$3A (a guard): #ITEM$6D or item #N$84 (the guard arrest).
@ $E5B0 label=Data_ItemGroup_Door
B $E5B0,$03 Object #N$3B (a door): #ITEM$6E or #ITEM$6F.
@ $E5B3 label=Data_ItemGroup_Clam
B $E5B3,$03 Object #N$3C (a clam): #ITEM$73 or #ITEM$74.
@ $E5B6 label=Data_ItemGroup_Plant
B $E5B6,$05 Object #N$3D (a plant): #ITEM$76, #ITEM$77, #ITEM$78 or
. #ITEM$85.
@ $E5BB label=Data_ItemGroup_Witch
B $E5BB,$03 Object #N$3E (a witch): #ITEM$79 or #ITEM$7A.
@ $E5BE label=Data_ItemGroup_Bat
B $E5BE,$03 Object #N$3F (a bat): #ITEM$7C or #ITEM$7D.
@ $E5C1 label=Data_ItemGroup_Anton
B $E5C1,$03 Object #N$40 (Anton): #ITEM$7F or #ITEM$80.
@ $E5C4 label=Data_ItemGroup_Beren
B $E5C4,$02 Object #N$41 (Beren): #ITEM$00.
@ $E5C6 label=Data_ItemGroup_Istar
B $E5C6,$03 Object #N$42 (Istar): #ITEM$01 or #ITEM$3E.
@ $E5C9 label=Data_ItemGroup_Haldir
B $E5C9,$02 Object #N$43 (Haldir): #ITEM$02.
@ $E5CB label=Data_ItemGroup_Khadim
B $E5CB,$02 Object #N$44 (Khadim): #ITEM$03.
@ $E5CD label=Data_ItemGroup_Phoenix
B $E5CD,$02 Object #N$45 (a phoenix): #ITEM$82.
@ $E5CF label=Data_ItemGroup_Ashes
B $E5CF,$02 Object #N$46 (any ashes): #ITEM$81.
@ $E5D1 label=Data_ItemGroup_Gas
B $E5D1,$02 Object #N$47 (any gas): #ITEM$86.

g $E5D3 Table: Verb Word Tokens
@ $E5D3 label=Table_VerbWordTokens
E $E5D3 View the equivalent code in;
. #LIST
. { #SHOCK$B420 }
. { #FOREST$E7AE }
. { #JEWELS$E90D }
. { #ANDROMEDA$891C }
. { #WARLORD$E489 }
. LIST#
D $E5D3 The vocabulary number (#R$E25C) of each of the #N$24 verbs (the count
. is at #R$AEF4). #R$B753 looks the first word of a command up here (through
. #R$AEEA) and jumps to the action at the same position in #R$FD63.
B $E5D3,$01 Verb #N$00: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F715.
B $E5D4,$01 Verb #N$01: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F756.
B $E5D5,$01 Verb #N$02: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F773.
B $E5D6,$01 Verb #N$03: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F77D.
B $E5D7,$01 Verb #N$04: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F785.
B $E5D8,$01 Verb #N$05: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7AC.
B $E5D9,$01 Verb #N$06: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7BC.
B $E5DA,$01 Verb #N$07: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7C4.
B $E5DB,$01 Verb #N$08: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7E4.
B $E5DC,$01 Verb #N$09: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7E8.
B $E5DD,$01 Verb #N$0A: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7EC.
B $E5DE,$01 Verb #N$0B: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7F0.
B $E5DF,$01 Verb #N$0C: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7F4.
B $E5E0,$01 Verb #N$0D: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F7F8.
B $E5E1,$01 Verb #N$0E: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F80D.
B $E5E2,$01 Verb #N$0F: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F8D0.
B $E5E3,$01 Verb #N$10: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F93B.
B $E5E4,$01 Verb #N$11: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F972.
B $E5E5,$01 Verb #N$12: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F989.
B $E5E6,$01 Verb #N$13: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F9DC.
B $E5E7,$01 Verb #N$14: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$F9E3.
B $E5E8,$01 Verb #N$15: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FA02.
B $E5E9,$01 Verb #N$16: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FA19.
B $E5EA,$01 Verb #N$17: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FA38.
B $E5EB,$01 Verb #N$18: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FA73.
B $E5EC,$01 Verb #N$19: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FA8A.
B $E5ED,$01 Verb #N$1A: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FAA5.
B $E5EE,$01 Verb #N$1B: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FAC8.
B $E5EF,$01 Verb #N$1C: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FAF9.
B $E5F0,$01 Verb #N$1D: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FB13.
B $E5F1,$01 Verb #N$1E: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FB20.
B $E5F2,$01 Verb #N$1F: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FB2D.
B $E5F3,$01 Verb #N$20: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FB3A.
B $E5F4,$01 Verb #N$21: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FB50.
B $E5F5,$01 Verb #N$22: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FB67.
B $E5F6,$01 Verb #N$23: word #N(#PEEK(#PC)), #TOKEN(#PEEK(#PC)), #R$FB92.

w $E5F7 Table: Item Grouping
@ $E5F7 label=Table_ItemGrouping
D $E5F7 One word per object in #R$CEEA. Each entry points at that object's
. group in #R$E500.
W $E5F7,$02
L $E5F7,$02,$48

g $E687 Table: Phrase Tokens
@ $E687 label=PhraseTokens_Frog
E $E687 View the equivalent code in;
. #LIST
. { #SHOCK$B6F4 }
. { #JEWELS$E9CA }
. { #ANDROMEDA$8940 }
. { #WARLORD$E519 }
. LIST#
D $E687 The words an action expects after its verb, as vocabulary numbers
. (#R$E25C). #N$FD separates alternative wordings and #N$FE ends a phrase.
. An action points #REGhl at a phrase and calls #R$B575. That compares it
. with the words after the verb and sets the zero flag when one of the
. wordings matches the whole of the rest of the command.
N $E687 Matches e.g. "frog".
B $E687,$02 Checked by #R$F785, #R$F80D, #R$F8D0 and #R$F972.
N $E689 Matches e.g. "box", "wooden box".
@ $E689 label=PhraseTokens_Box
B $E689,$05 Checked by #R$F785, #R$F80D, #R$F8D0 and #R$F989.
N $E68E Matches e.g. "flower", "jade flower".
@ $E68E label=PhraseTokens_Flower
B $E68E,$05 Checked by #R$F785, #R$F80D and #R$F8D0.
N $E693 Matches e.g. "map".
@ $E693 label=PhraseTokens_Map
B $E693,$02 Checked by #R$F785, #R$F80D, #R$F8D0 and #R$F9E3.
N $E695 Matches e.g. "scroll".
@ $E695 label=PhraseTokens_Scroll
B $E695,$02 Checked by #R$F785, #R$F80D, #R$F8D0 and #R$F9E3.
N $E697 Matches e.g. "ruby".
@ $E697 label=PhraseTokens_Ruby
B $E697,$02 Checked by #R$F80D and #R$F8D0.
N $E699 Matches e.g. "diamond".
@ $E699 label=PhraseTokens_Diamond
B $E699,$02 Checked by #R$F80D and #R$F8D0.
N $E69B Matches e.g. "sapphire".
@ $E69B label=PhraseTokens_Sapphire
B $E69B,$02 Checked by #R$F80D and #R$F8D0.
N $E69D Matches e.g. "emerald".
@ $E69D label=PhraseTokens_Emerald
B $E69D,$02 Checked by #R$F80D and #R$F8D0.
N $E69F Matches e.g. "pearl".
@ $E69F label=PhraseTokens_Pearl
B $E69F,$02 Checked by #R$F80D and #R$F8D0.
N $E6A1 Matches e.g. "tinderbox".
@ $E6A1 label=PhraseTokens_Tinderbox
B $E6A1,$02 Checked by #R$F80D, #R$F8D0 and #R$F989.
N $E6A3 Matches e.g. "money".
@ $E6A3 label=PhraseTokens_Money
B $E6A3,$02 Checked by #R$F80D and #R$F8D0.
N $E6A5 Matches e.g. "bible".
@ $E6A5 label=PhraseTokens_Bible
B $E6A5,$02 Checked by #R$F80D, #R$F8D0 and #R$F9E3.
N $E6A7 Matches e.g. "wand".
@ $E6A7 label=PhraseTokens_Wand
B $E6A7,$02 Checked by #R$F80D, #R$F8D0 and #R$FA02.
N $E6A9 Matches e.g. "flute", "silver".
@ $E6A9 label=PhraseTokens_Flute
B $E6A9,$04 Checked by #R$F80D, #R$F8D0 and #R$FA19.
N $E6AD Matches e.g. "carpet".
@ $E6AD label=PhraseTokens_Carpet
B $E6AD,$02 Checked by #R$F80D and #R$F8D0.
N $E6AF Matches e.g. "key".
@ $E6AF label=PhraseTokens_Key
B $E6AF,$02 Checked by #R$F80D and #R$F8D0.
N $E6B1 Matches e.g. "copper key".
@ $E6B1 label=PhraseTokens_CopperKey
B $E6B1,$03 Checked by #R$F80D and #R$F8D0.
N $E6B4 Matches e.g. "gold key".
@ $E6B4 label=PhraseTokens_GoldKey
B $E6B4,$03 Checked by #R$F80D and #R$F8D0.
N $E6B7 Matches e.g. "jewelled key".
@ $E6B7 label=PhraseTokens_JewelledKey
B $E6B7,$03 Checked by #R$F80D and #R$F8D0.
N $E6BA Matches e.g. "songbird", "bird".
@ $E6BA label=PhraseTokens_Songbird
B $E6BA,$02 Checked by #R$F80D and #R$F8D0.
N $E6BC Matches e.g. "sword".
@ $E6BC label=PhraseTokens_Sword
B $E6BC,$02 Checked by #R$F80D and #R$F8D0.
N $E6BE Matches e.g. "spear".
@ $E6BE label=PhraseTokens_Spear
B $E6BE,$02 Checked by #R$F80D and #R$F8D0.
N $E6C0 Matches e.g. "dagger".
@ $E6C0 label=PhraseTokens_Dagger
B $E6C0,$02 Checked by #R$F80D and #R$F8D0.
N $E6C2 Matches e.g. "pillow", "velvet pillow".
@ $E6C2 label=PhraseTokens_Pillow
B $E6C2,$05 Checked by #R$F80D and #R$F8D0.
N $E6C7 Matches e.g. "falcon".
@ $E6C7 label=PhraseTokens_Falcon
B $E6C7,$02 Checked by #R$F80D and #R$F8D0.
N $E6C9 Matches e.g. "bottle".
@ $E6C9 label=PhraseTokens_Bottle
B $E6C9,$02 Checked by #R$F80D, #R$F8D0 and #R$FB92.
N $E6CB Matches e.g. "water".
@ $E6CB label=PhraseTokens_Water
B $E6CB,$02 Checked by #R$F80D, #R$F8D0 and #R$FAA5.
N $E6CD Matches e.g. "acid".
@ $E6CD label=PhraseTokens_Acid
B $E6CD,$02 Checked by #R$F80D and #R$F8D0.
N $E6CF Matches e.g. "oil".
@ $E6CF label=PhraseTokens_Oil
B $E6CF,$02 Checked by #R$F80D and #R$F8D0.
N $E6D1 Matches e.g. "lyre", "gold lyre".
@ $E6D1 label=PhraseTokens_Lyre
B $E6D1,$05 Checked by #R$F80D, #R$F8D0 and #R$FA19.
N $E6D6 Matches e.g. "mandolin".
@ $E6D6 label=PhraseTokens_Mandolin
B $E6D6,$02 Checked by #R$F80D, #R$F8D0 and #R$FA19.
N $E6D8 Matches e.g. "fragments", "jade fragments".
@ $E6D8 label=PhraseTokens_Fragments
B $E6D8,$05 Checked by #R$F80D and #R$F8D0.
N $E6DD Matches e.g. "crowbar".
@ $E6DD label=PhraseTokens_Crowbar
B $E6DD,$02 Checked by #R$F80D and #R$F8D0.
N $E6DF Matches e.g. "shovel".
@ $E6DF label=PhraseTokens_Shovel
B $E6DF,$02 Checked by #R$F80D and #R$F8D0.
N $E6E1 Matches e.g. "cage", "wicker cage".
@ $E6E1 label=PhraseTokens_Cage
B $E6E1,$05 Checked by #R$F80D and #R$F8D0.
N $E6E6 Matches e.g. "coin", "silver coin".
@ $E6E6 label=PhraseTokens_Coin
B $E6E6,$05 Checked by #R$F80D and #R$F8D0.
N $E6EB Matches e.g. "honey".
@ $E6EB label=PhraseTokens_Honey
B $E6EB,$02 Checked by #R$F80D and #R$F8D0.
N $E6ED Matches e.g. "meat".
@ $E6ED label=PhraseTokens_Meat
B $E6ED,$02 Checked by #R$F80D and #R$F8D0.
N $E6EF Matches e.g. "cross", "silver cross".
@ $E6EF label=PhraseTokens_Cross
B $E6EF,$05 Checked by #R$F80D and #R$F8D0.
N $E6F4 Matches e.g. "mirror", "magic mirror".
@ $E6F4 label=PhraseTokens_Mirror
B $E6F4,$05 Checked by #R$F80D and #R$F8D0.
N $E6F9 Matches e.g. "potion".
@ $E6F9 label=PhraseTokens_Potion
B $E6F9,$02 Checked by #R$F80D, #R$F8D0 and #R$FAA5.
N $E6FB Matches e.g. "white potion".
@ $E6FB label=PhraseTokens_WhitePotion
B $E6FB,$03 Checked by #R$F80D, #R$F8D0 and #R$FAA5.
N $E6FE Matches e.g. "black potion".
@ $E6FE label=PhraseTokens_BlackPotion
B $E6FE,$03 Checked by #R$F80D, #R$F8D0 and #R$FAA5.
N $E701 Matches e.g. "mirror to anton", "mirror at anton",
. "magic mirror to anton", "magic mirror at anton".
@ $E701 label=PhraseTokens_MirrorToAnton
B $E701,$09 Checked by #R$F93B.
N $E70A Matches e.g. "coin to anton", "coin at anton", "silver coin to anton",
. "silver coin at anton".
@ $E70A label=PhraseTokens_CoinToAnton
B $E70A,$09 Checked by #R$F93B.
N $E713 Matches e.g. "honey to bear", "honey at bear".
@ $E713 label=PhraseTokens_HoneyToBear
B $E713,$04 Checked by #R$F93B.
N $E717 Matches e.g. "meat to falcon", "meat at falcon".
@ $E717 label=PhraseTokens_MeatToFalcon
B $E717,$04 Checked by #R$F93B.
N $E71B Matches e.g. "honey to lizard", "honey at lizard",
. "honey to swamp lizard", "honey at swamp lizard".
@ $E71B label=PhraseTokens_HoneyToLizard
B $E71B,$09 Checked by #R$F93B.
N $E724 Matches e.g. "meat to lizard", "meat at lizard", "meat to swamp lizard",
. "meat at swamp lizard".
@ $E724 label=PhraseTokens_MeatToLizard
B $E724,$09 Checked by #R$F93B.
N $E72D Matches e.g. "meat to bear", "meat at bear".
@ $E72D label=PhraseTokens_MeatToBear
B $E72D,$04 Checked by #R$F93B.
N $E731 Matches e.g. "meat to balrog", "meat at balrog".
@ $E731 label=PhraseTokens_MeatToBalrog
B $E731,$04 Checked by #R$F93B.
N $E735 Matches e.g. "chest", "hinges", "iron chest", "iron hinges",
. "rusty chest", "rusty hinges", "rusty iron chest", "rusty iron hinges".
@ $E735 label=PhraseTokens_Chest
B $E735,$0C Checked by #R$F989 and #R$FA72.
N $E741 Matches e.g. "door".
@ $E741 label=PhraseTokens_Door
B $E741,$02 Checked by #R$F989.
N $E743 Matches e.g. "gate".
@ $E743 label=PhraseTokens_Gate
B $E743,$02 Checked by #R$F989.
N $E745 Matches e.g. "copper gate".
@ $E745 label=PhraseTokens_CopperGate
B $E745,$03 Checked by #R$F989.
N $E748 Matches e.g. "gold gate".
@ $E748 label=PhraseTokens_GoldGate
B $E748,$03 Checked by #R$F989.
N $E74B Matches e.g. "jewelled gate".
@ $E74B label=PhraseTokens_JewelledGate
B $E74B,$03 Checked by #R$F989.
N $E74E Matches e.g. "coffin".
@ $E74E label=PhraseTokens_Coffin
B $E74E,$02 Checked by #R$F989.
N $E750 Matches e.g. "clam", "giant clam".
@ $E750 label=PhraseTokens_Clam
B $E750,$05 Checked by #R$F989.
N $E755 Matches e.g. "clam with crowbar", "clam using crowbar",
. "giant clam with crowbar", "giant clam using crowbar".
@ $E755 label=PhraseTokens_ClamWithCrowbar
B $E755,$09 Checked by #R$F989.
N $E75E Matches e.g. "money to guard", "money at guard".
@ $E75E label=PhraseTokens_MoneyToGuard
B $E75E,$04 Checked by #R$F93B.
N $E762 Matches e.g. "barrowight with bible", "barrowight using bible".
@ $E762 label=PhraseTokens_BarrowightWithBible
B $E762,$04 Checked by #R$FA38.
N $E766 Matches e.g. "serpent with songbird", "serpent with bird",
. "serpent using songbird", "serpent using bird".
@ $E766 label=PhraseTokens_SerpentWithSongbird
B $E766,$04 Checked by #R$FA38.
N $E76A Matches e.g. "hydra with sword", "hydra using sword".
@ $E76A label=PhraseTokens_HydraWithSword
B $E76A,$04 Checked by #R$FA38.
N $E76E Matches e.g. "hydra with spear", "hydra using spear".
@ $E76E label=PhraseTokens_HydraWithSpear
B $E76E,$04 Checked by #R$FA38.
N $E772 Matches e.g. "vampire with cross", "vampire using cross",
. "vampire with silver cross", "vampire using silver cross".
@ $E772 label=PhraseTokens_VampireWithCross
B $E772,$09 Checked by #R$FA38.
N $E77B Matches e.g. "knight with acid", "knight using acid",
. "black knight with acid", "black knight using acid".
@ $E77B label=PhraseTokens_KnightWithAcid
B $E77B,$09 Checked by #R$FA38.
N $E784 Matches e.g. "dragon with sword", "dragon using sword".
@ $E784 label=PhraseTokens_DragonWithSword
B $E784,$04 Checked by #R$FA38.
N $E788 Matches e.g. "pirate with dagger", "pirate using dagger".
@ $E788 label=PhraseTokens_PirateWithDagger
B $E788,$04 Checked by #R$FA38.
N $E78C Matches e.g. "witch with water", "witch using water".
@ $E78C label=PhraseTokens_WitchWithWater
B $E78C,$04 Checked by #R$FA38.
N $E790 Matches e.g. "bat with falcon", "bat using falcon",
. "giant bat with falcon", "giant bat using falcon".
@ $E790 label=PhraseTokens_BatWithFalcon
B $E790,$09 Checked by #R$FA38.
N $E799 Matches e.g. "plant", "beanstalk".
@ $E799 label=PhraseTokens_Plant
B $E799,$02 Checked by #R$FA8A.
N $E79B Matches e.g. "ashes".
@ $E79B label=PhraseTokens_Ashes
B $E79B,$02 Checked by #R$FA8A.
N $E79D Matches e.g. "anton", "beren", "istar", "haldir", "khadim".
@ $E79D label=PhraseTokens_Anton
B $E79D,$0A Checked by #R$FAF9.
N $E7A7 Matches e.g. "gas", "marsh gas", "gas with tinderbox",
. "gas using tinderbox", "marsh gas with tinderbox",
. "marsh gas using tinderbox".
@ $E7A7 label=PhraseTokens_Gas
B $E7A7,$0E Checked by #R$FB50.
N $E7B5 Matches e.g. "take sword", "get sword", "take songbird", "take bird",
. "get songbird", "get bird", "take falcon", "get falcon",
. "kill serpent with songbird", "kill serpent with bird",
. "kill serpent using songbird", "kill serpent using bird",
. "attack serpent with songbird", "attack serpent with bird",
. "attack serpent using songbird", "attack serpent using bird",
. "kill bat with falcon", "kill bat using falcon", "attack bat with falcon",
. "attack bat using falcon", "kill giant bat with falcon",
. "kill giant bat using falcon", "attack giant bat with falcon",
. "attack giant bat using falcon".
@ $E7B5 label=PhraseTokens_TakeSword
B $E7B5,$19 Checked by #R$FB13.
N $E7CE Matches e.g. "take wand", "get wand", "wave wand", "read map",
. "read scroll".
@ $E7CE label=PhraseTokens_TakeWand
B $E7CE,$0C Checked by #R$FB20.
N $E7DA Matches e.g. "play lyre", "play gold lyre".
@ $E7DA label=PhraseTokens_PlayLyre
B $E7DA,$07 Checked by #R$FB2D.
N $E7E1 Matches e.g. "kill pirate with dagger", "kill pirate using dagger",
. "attack pirate with dagger", "attack pirate using dagger".
@ $E7E1 label=PhraseTokens_KillPirateWithDagger
B $E7E1,$05 Checked by #R$FB3A.

g $E7E6 Table: Room Map
@ $E7E6 label=Table_RoomMap
E $E7E6 View the equivalent code in;
. #LIST
. { #SHOCK$B8DD }
. { #FOREST$E934 }
. { #JEWELS$EB10 }
. { #ANDROMEDA$8B5A }
. { #WARLORD$E714 }
. LIST#
D $E7E6 Six bytes per room, in the order north, south, east, west, up, down. A
. zero means there is no exit.
N $E7E6 Room #N((#PC-$E7E6)/$06): #ROOM((#PC-$E7E6)/$06).
B $E7E6,$01 #IF(#PEEK(#PC)>$00)(North to room:
. #R($E7E6+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E7E7,$01 #IF(#PEEK(#PC)>$00)(South to room:
. #R($E7E6+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E7E8,$01 #IF(#PEEK(#PC)>$00)(East to room:
. #R($E7E6+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E7E9,$01 #IF(#PEEK(#PC)>$00)(West to room:
. #R($E7E6+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E7EA,$01 #IF(#PEEK(#PC)>$00)(Up to room:
. #R($E7E6+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $E7EB,$01 #IF(#PEEK(#PC)>$00)(Down to room:
. #R($E7E6+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
L $E7E6,$06,$42

w $E972 Table: Configurable Exits
@ $E972 label=Table_ConfigurableExits
E $E972 View the equivalent code in;
. #LIST
. { #FOREST$EB02 }
. { #JEWELS$ED9E }
. { #ANDROMEDA$8D16 }
. { #WARLORD$E978 }
. LIST#
D $E972 One word per configurable exit. Each entry points at the exit record
. Game Start clears.
W $E972,$02
L $E972,$02,$16

c $E99E Jump to Game Start
@ $E99E label=Jump_GameStart
D $E99E Game Cold Start lands here and jumps on to Game Start.
  $E99E,$03 Continue at #R$FBA9.

c $E9A1 Game Loop
@ $E9A1 label=GameLoop
E $E9A1 View the equivalent code in;
. #LIST
. { #FOREST$EB10 }
. { #JEWELS$EDC4 }
. { #ANDROMEDA$8D2A }
. { #WARLORD$E99F }
. LIST#
D $E9A1 One turn: run events, read a command, and dispatch its verb.
  $E9A1,$03 Call #R$B373 to advance the turn-based events.
  $E9A4,$04 Clear the turn scratch flag (#N$08 marks an attack).
  $E9A8,$03 Call #R$B200 to read the next command.
  $E9AB,$03 Call #R$B6BC to apply the command to the item.
  $E9AE,$02 Start the next turn without running the verb if a named item isn't
. here (carry set by #R$B6BC).
  $E9B0,$03 Call #R$B753 to run the verb.
  $E9B3,$02 Take another turn at #R$E9A1.

c $E9B5 Game Over
@ $E9B5 label=GameOver
E $E9B5 View the equivalent code in;
. #LIST
. { #SHOCK$AE0D }
. { #FOREST$EB23 }
. { #JEWELS$EDD7 }
. { #ANDROMEDA$8DB3 }
. { #WARLORD$E9B2 }
. LIST#
D $E9B5 Print "You are dead." and fall into the play-again question.
N $E9B5 Print it and start a new line: #MESSAGE$AFF9.
  $E9B5,$06 Point at the message and print it and start a new line.

c $E9BB Want Another Game Input
@ $E9BB label=WantAnotherGameInput
E $E9BB View the equivalent code in;
. #LIST
. { #ANDROMEDA$8DB9 }
. LIST#
D $E9BB Ask To Play Again.
  $E9BB,$03 Call #R$B79E to tell the player the score.
N $E9BE Print it and start a new line: #MESSAGE$B007.
  $E9BE,$06 Point at the message and print it and start a new line.
@ $E9C4 label=WantAnotherGameInput_Loop
  $E9C4,$03 Call #R$ABE1 to read the player's key.
  $E9C7,$05 Branch to #SKOOLKID$0000(START) when the player pressed "N".
  $E9CC,$05 Branch to #R$ABD4 when the player pressed "Y".
  $E9D1,$02 Ask again at #R$E9C4 when the key is neither Y nor N.

c $E9D3 Game Complete
@ $E9D3 label=GameComplete
E $E9D3 View the equivalent code in;
. #LIST
. { #FOREST$EB3E }
. { #JEWELS$EDF2 }
. { #ANDROMEDA$8DCE }
. LIST#
D $E9D3 Announce that the quest is over and offer another game.
  $E9D3,$03 Call #R$ABF1 to clear the screen.
  $E9D6,$03 Call #R$AC0D to park the cursor on the current screen line.
  $E9D9,$06 Call #R$AC35 to print the string and start a new line.
  $E9DF,$02 Offer another game at #R$E9BB.

c $E9E1 Change Room
@ $E9E1 label=ChangeRoom
E $E9E1 View the equivalent code in;
. #LIST
. { #SHOCK$AD79 }
. { #FOREST$ECB6 }
. { #JEWELS$EF54 }
. { #ANDROMEDA$8E18 }
. { #WARLORD$EB10 }
. LIST#
D $E9E1 Commits a move into the destination room held in #REGa. It handles
. the Hall of the Phoenix and the ruined cottage, calls #R$B714 to update
. the current room, then jumps to #R$EA75 to describe the new room.
R $E9E1 A Destination room ID
N $E9E1 Entering the Hall of the Phoenix is fatal. Bit 0 of *#R$AE76, when
. set, means the firegate does not incinerate the player.
  $E9E1,$04 Jump to #R$E9F8 if the destination is not room #N$37:
. "#ROOM$37".
  $E9E5,$07 Jump to #R$E9F8 if bit 0 of *#R$AE76 is set.
N $E9EC The player is dead, so do not resume the movement handler.
  $E9EC,$01 Discard the calling address of #R$E9E1.
  $E9ED,$04 Switch #R$E9B5 onto the stack so the next return actions a "game
. over".
N $E9F1 Print "#MESSAGE$D04C".
  $E9F1,$06 Point #REGhl at #R$D04C and print it and start a new line.
  $E9F7,$01 Return.
N $E9F8 Leaving the Hall of the Phoenix.
@ $E9F8 label=ChangeRoom_LeavePhoenix
  $E9F8,$01 Copy the destination room ID into #REGc.
  $E9F9,$03 Fetch *#R$AECD into #REGa.
  $E9FC,$04 Jump to #R$EA36 if the current room is not #N$37: "#ROOM$37".
  $EA00,$07 Jump to #R$EA36 if bit 1 of *#R$AE76 is set.
N $EA07 South into the Hall of Black Magic turns the ashes into a phoenix.
  $EA07,$05 Jump to #R$EA23 if the destination is not room #N$3F:
. "#ROOM$3F".
  $EA0C,$06 Call #R$B613 to transform #ITEM$81 into #ITEM$82.
N $EA12 This action changes the map:
  $EA12,$04 Write #N$00 to close southbound access to #ROOM$3F from #ROOM$37.
N $EA16 Print "#MESSAGE$D087".
@ $EA16 label=ChangeRoom_AshesBurst
  $EA16,$06 Point #REGhl at #R$D087 and print it and start a new line.
N $EA1C Print "#MESSAGE$D0B0".
@ $EA1C label=ChangeRoom_PhoenixAppears
  $EA1C,$06 Point #REGhl at #R$D0B0 and pause, print it and scroll.
  $EA22,$01 Return.
N $EA23 Any other exit from the Hall of the Phoenix turns the phoenix back
. into ashes and opens the south.
@ $EA23 label=ChangeRoom_PhoenixToAshes
  $EA23,$01 Copy the destination room ID into #REGa.
  $EA24,$01 Stash the destination room ID on the stack.
  $EA25,$05 Call #R$B5D5 with item #N$82: #ITEM$82.
  $EA2A,$05 Call #R$B5DC with item #N$81: #ITEM$81.
N $EA2F This action changes the map:
  $EA2F,$05 Write #N$3F to open southbound access to #ROOM$3F from #ROOM$37.
  $EA34,$01 Restore the destination room ID from the stack.
  $EA35,$01 Copy it into #REGc.
N $EA36 Move into the destination room.
@ $EA36 label=ChangeRoom_EnterRoom
  $EA36,$01 Copy the destination room ID into #REGa.
  $EA37,$03 Call #R$B714 to move the player into the room.
N $EA3A Winning in the ruined cottage.
  $EA3A,$03 Fetch *#R$AECD into #REGa.
  $EA3D,$04 Jump to #R$EA75 if it is not room #N$02: "#ROOM$02".
  $EA41,$03 Fetch *#R$AE91 into #REGa.
  $EA44,$04 Jump to #R$EA75 if it is not #N$0F (all four heroes following).
  $EA48,$07 Count how many of the five gems at #R$EA70 are here.
N $EA4F Count each gem that is here.
@ $EA4F label=Cottage_CountGem
  $EA4F,$01 Fetch the next gem item ID.
  $EA50,$03 Call #R$B560 to test whether it is here.
  $EA53,$02 Jump to #R$EA56 if it is not here.
  $EA55,$01 Count a gem that is here.
N $EA56 Continue the gem count.
@ $EA56 label=Cottage_CountGem_Next
  $EA56,$01 Advance to the next gem.
  $EA57,$02 Decrease the gem counter by one and loop back to #R$EA4F until
. it is zero.
  $EA59,$05 Jump to #R$EA75 if fewer than five gems are here.
  $EA5E,$06 Call #R$B5EC with the jade-flower group at #R$E504.
  $EA64,$02 Jump to #R$EA75 if the jade flower is neither here nor carried.
N $EA66 The game is won, so do not resume the movement handler or the
. command loop.
  $EA66,$02 Discard the return address of #R$E9E1 and of its caller.
  $EA68,$05 Call #R$B78F to score four points.
  $EA6D,$03 Jump to #R$E9D3.

b $EA70 Table: Gems
@ $EA70 label=Table_Gems
D $EA70 The ruby, diamond, sapphire, emerald and pearl counted in the cottage.
B $EA70,$01 Item #N(#PEEK(#PC)).
L $EA70,$01,$05

c $EA75 Handler: Show The New Room
@ $EA75 label=Handler_ShowNewRoom
D $EA75 Draw the new room after a move.
  $EA75,$05 Call #R$B41F to show the room picture.
  $EA7A,$05 Call #R$B560 with item #N$84 (unnamed; the guard arrest).
  $EA7F,$02 Skip the arrest when that item is not here.
  $EA81,$05 Call #R$B5D5 with item #N$84 (unnamed; the guard arrest).
N $EA86 Print "#MESSAGE$D154".
  $EA86,$06 Point #REGhl at #R$D154 and pause, print it and scroll.
N $EA8C Print "#MESSAGE$D168".
  $EA8C,$06 Point #REGhl at #R$D168 and pause, print it and scroll.
  $EA92,$05 Call #R$AC65 to pause for the frame count in #REGb.
  $EA97,$02 Take the player to room #N$3A: "#ROOM$3A".
  $EA99,$03 Jump to #R$E9E1.
N $EA9C The guard is not in this room.
@ $EA9C label=Handler_ShowNewRoom_Next
  $EA9C,$01 Return.

g $EA9D Table: Items Which Are Plural
@ $EA9D label=Table_ItemsWhichArePlural
E $EA9D View the equivalent code in;
. #LIST
. { #SHOCK$B6F1 }
. { #FOREST$EEEB }
. { #JEWELS$F29B }
. { #ANDROMEDA$9010 }
. { #WARLORD$ED6C }
. LIST#
D $EA9D All the items in the game which are plural; used by #R$EB00.
B $EA9D,$01 Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC)).

c $EA9E Print Response
@ $EA9E label=PrintResponse
E $EA9E View the equivalent code in;
. #LIST
. { #FOREST$ED66 }
. { #JEWELS$F03A }
. { #WARLORD$ED6D }
. LIST#
D $EA9E Print the message at #REGhl and return to the command.
  $EA9E,$03 Call #R$AC35.
  $EAA1,$01 Return.

c $EAA2 Pause, Print String And Scroll
@ $EAA2 label=PausePrintAndScroll
E $EAA2 View the equivalent code in;
. #LIST
. { #FOREST$ED6A }
. { #JEWELS$F03E }
. LIST#
D $EAA2 Pause, print the string at #REGhl, and scroll. The phrase handlers
. call this entry.
  $EAA2,$03 Call #R$B776.
  $EAA5,$01 Return.

c $EAA6 Response: "Read The Information Carefully"
@ $EAA6 label=Response_ReadTheInformationCarefully
D $EAA6 Tell the player "Read The Information Carefully"
N $EAA6 Print "#MESSAGE$D0E6".
  $EAA6,$03 #REGhl=#R$D0E6.
  $EAA9,$03 Jump to #R$EA9E.

c $EAAC Response: "Try A Little Music"
@ $EAAC label=Response_TryALittleMusic
D $EAAC Tell the player "Try A Little Music"
N $EAAC Print "#MESSAGE$D117".
  $EAAC,$03 #REGhl=#R$D117.
  $EAAF,$03 Jump to #R$EA9E.

c $EAB2 Response: "You Don't Really Need It"
@ $EAB2 label=Response_YouDontReallyNeedIt
E $EAB2 View the equivalent code in;
. #LIST
. { #JEWELS$F047 }
. LIST#
D $EAB2 Tell the player "You Don't Really Need It"
N $EAB2 Print "#MESSAGE$D13A".
  $EAB2,$03 #REGhl=#R$D13A.
  $EAB5,$03 Jump to #R$EA9E.

c $EAB8 Response: "You're Not Carrying Anything"
@ $EAB8 label=Response_YoureNotCarryingAnything
E $EAB8 View the equivalent code in;
. #LIST
. { #SHOCK$A6CF }
. { #FOREST$EDAF }
. { #JEWELS$F04C }
. { #WARLORD$EE17 }
. LIST#
D $EAB8 Tell the player "You're Not Carrying Anything"
N $EAB8 Print "#MESSAGE$B1A6".
  $EAB8,$03 #REGhl=#R$B1A6.
  $EABB,$03 Jump to #R$EA9E.

c $EABE Response: "I See Nothing Special"
@ $EABE label=Response_ISeeNothingSpecial
D $EABE Tell the player "I See Nothing Special"
N $EABE Print "#MESSAGE$D198".
  $EABE,$03 #REGhl=#R$D198.
  $EAC1,$03 Jump to #R$EA9E.

c $EAC4 Response: "It Appears To Be Bewitched"
@ $EAC4 label=Response_ItAppearsToBeBewitched
D $EAC4 Tell the player "It Appears To Be Bewitched"
N $EAC4 Print "#MESSAGE$D17C".
  $EAC4,$03 #REGhl=#R$D17C.
  $EAC7,$03 Jump to #R$EA9E.

c $EACA Response: "Like Pandora's Maybe"
@ $EACA label=Response_LikePandorasMaybe
D $EACA Tell the player "Like Pandora's Maybe"
N $EACA Print "#MESSAGE$D1AF".
  $EACA,$03 #REGhl=#R$D1AF.
  $EACD,$03 Jump to #R$EA9E.

c $EAD0 Response: "It Is Very Fragile"
@ $EAD0 label=Response_ItIsVeryFragile
D $EAD0 Tell the player "It Is Very Fragile"
N $EAD0 Print "#MESSAGE$D1C5".
  $EAD0,$03 #REGhl=#R$D1C5.
  $EAD3,$03 Jump to #R$EA9E.

c $EAD6 Response: "The Symbols Are Incomprehensible To You"
@ $EAD6 label=Response_TheSymbolsAreIncomprehensibleToYou
D $EAD6 Tell the player "The Symbols Are Incomprehensible To You"
N $EAD6 Print "#MESSAGE$D1D9".
  $EAD6,$03 #REGhl=#R$D1D9.
  $EAD9,$03 Jump to #R$EA9E.

c $EADC Response: "You Can't Go In That Direction"
@ $EADC label=Response_YouCantGoInThatDirection
E $EADC View the equivalent code in;
. #LIST
. { #SHOCK$A6F6 }
. { #JEWELS$F05B }
. { #WARLORD$EE1D }
. LIST#
D $EADC Tell the player "You Can't Go In That Direction"
N $EADC Print "#MESSAGE$B144".
  $EADC,$03 #REGhl=#R$B144.
  $EADF,$03 Jump to #R$EA9E.

c $EAE2 Response: "You Can't"
@ $EAE2 label=Response_YouCant
E $EAE2 View the equivalent code in;
. #LIST
. { #FOREST$ED6E }
. { #JEWELS$F06F }
. LIST#
D $EAE2 Tell the player "You Can't"
N $EAE2 Print "#MESSAGE$B0E2".
  $EAE2,$03 #REGhl=#R$B0E2.
  $EAE5,$03 Jump to #R$EA9E.

c $EAE8 Response: "O.K."
@ $EAE8 label=Response_OK_GameLoop
E $EAE8 View the equivalent code in;
. #LIST
. { #FOREST$ED96 }
. { #JEWELS$F06A }
. LIST#
D $EAE8 Tell the player "O.k"
N $EAE8 Print "#MESSAGE$B0ED".
  $EAE8,$03 #REGhl=#R$B0ED.
  $EAEB,$03 Jump to #R$EA9E.

c $EAEE Response: "You're Already Carrying It"
@ $EAEE label=Response_YoureAlreadyCarryingIt
D $EAEE Tell the player "You're Already Carrying It"
N $EAEE Print "#MESSAGE$D202".
  $EAEE,$03 #REGhl=#R$D202.
  $EAF1,$03 Jump to #R$EA9E.

c $EAF4 Take: Is Player Holding Item
@ $EAF4 label=Take_IsPlayerHoldingItem
E $EAF4 View the equivalent code in;
. #LIST
. { #FOREST$EEBA }
. { #JEWELS$F26A }
. { #ANDROMEDA$8FE2 }
. { #WARLORD$ED75 }
. LIST#
D $EAF4 Refuse the take when the object is already carried or the inventory is
. full; otherwise return so the caller can take it.
R $EAF4 A Object ID
R $EAF4 O:B The object ID (when returning so the take may proceed)
  $EAF4,$03 Call #R$B5CF.
N $EAF7 Refuse when that object is already being carried.
  $EAF7,$02 Jump to #R$EB17 if the item is not being held.
  $EAF9,$01 Restore #REGhl from the stack.
N $EAFA Finish the sentence "You're already carrying" with "it" or "them".
N $EAFA Print "#MESSAGE$B0F2".
  $EAFA,$03 #REGhl=#R$B0F2.
N $EAFD Print the string at #REGhl, then finish with "it." or "them.".
@ $EAFD label=PrintStringAndItThemHandler
  $EAFD,$03 Call #R$AC28.
N $EB00 Search #R$EA9D among the plural items.
@ $EB00 label=Take_AlreadyCarrying_CheckPlural
  $EB00,$03 #REGhl=#R$EA9D.
  $EB03,$01 Copy the object ID back into #REGa.
  $EB04,$03 #REGbc=#N($0001,$04,$04).
  $EB07,$02 Search #R$EA9D for the item ID among the plural items.
  $EB09,$02 Jump to #R$EB11 if the item is plural.
N $EB0B Print "#MESSAGE$B10D".
  $EB0B,$03 #REGhl=#R$B10D.
  $EB0E,$03 Jump to #R$EA9E.
N $EB11 Print "#MESSAGE$B111".
@ $EB11 label=Take_AlreadyCarrying_Them
  $EB11,$03 #REGhl=#R$B111.
  $EB14,$03 Jump to #R$EA9E.
N $EB17 Refuse the object when the player is already holding #N$08 things.
@ $EB17 label=Take_InventoryFull
  $EB17,$05 Compare *#R$AE9A with #N$08.
  $EB1C,$01 #REGb=#REGe.
  $EB1D,$01 Return if *#R$AE9A is not equal to #N$08.
  $EB1E,$01 Restore #REGhl from the stack.
N $EB1F Print "#MESSAGE$B117".
  $EB1F,$03 #REGhl=#R$B117.
  $EB22,$03 Jump to #R$EA9E.

c $EB25 Take Item
@ $EB25 label=TakeItem
E $EB25 View the equivalent code in;
. #LIST
. { #SHOCK$AA6E }
. { #FOREST$EEED }
. { #JEWELS$F29C }
. { #ANDROMEDA$9014 }
. { #WARLORD$EDA6 }
. LIST#
D $EB25 Places the item in the player's inventory and acknowledges success.
R $EB25 B Item ID
  $EB25,$02 Load #REGc with #N$01 which indicates the item will be in the
. players inventory.
  $EB27,$03 Call #R$B5FD.
  $EB2A,$04 Increment *#R$AE9A by one.
  $EB2E,$03 Jump to #R$EAE8.

c $EB31 Drop: Is Player Holding Item
@ $EB31 label=Drop_IsPlayerHoldingItem
E $EB31 View the equivalent code in;
. #LIST
. { #SHOCK$AA8A }
. { #FOREST$F045 }
. { #JEWELS$F4DA }
. { #WARLORD$EDB8 }
. LIST#
D $EB31 Refuse the drop when the object is not carried; otherwise drop it.
R $EB31 A Object ID
  $EB31,$03 Call #R$B5CF.
N $EB34 Print "#MESSAGE$B191".
  $EB34,$03 #REGhl=#R$B191.
  $EB37,$03 Jump to #R$EAFD if the item is not being held.
N $EB3A The player has the item in their inventory so drop it.
@ $EB3A label=DropItem
  $EB3A,$01 Copy the item ID into #REGb.
  $EB3B,$04 #REGc=*#R$AECD.
N $EB3F Alter the items location from the players inventory to the current room
. ID.
  $EB3F,$03 Call #R$B5FD.
  $EB42,$04 Decrease *#R$AE9A by one.
  $EB46,$03 Jump to #R$EAE8.

c $EB49 Is Player Carrying Item
@ $EB49 label=IsPlayerCarryingItem
E $EB49 View the equivalent code in;
. #LIST
. { #WARLORD$EDD0 }
. LIST#
D $EB49 Return if the item is held; otherwise tell the player they are not
. carrying it.
R $EB49 A Item ID
R $EB49 O:F Z flag set if the item is in the players inventory
  $EB49,$03 Call #R$B5CF.
  $EB4C,$01 Return if the item is in the players inventory.
  $EB4D,$01 Restore #REGhl from the stack.
N $EB4E Print "#MESSAGE$B191".
  $EB4E,$03 #REGhl=#R$B191.
  $EB51,$03 Jump to #R$EAFD.

c $EB54 Check Inventory And Pick Up
@ $EB54 label=Handler_CheckPlayerInventory_PickUpItem
E $EB54 View the equivalent code in;
. #LIST
. { #WARLORD$EDB2 }
. LIST#
D $EB54 Check that the item can be taken, then pick it up.
R $EB54 A Item ID
  $EB54,$03 Call #R$EAF4.
  $EB57,$03 Jump to #R$EB25.

c $EB5A Take: Frog
@ $EB5A label=Take_Frog
D $EB5A Take the frog unless the swamp lizard is present.
  $EB5A,$05 Call #R$EAF4 with item #N$05: #ITEM$05.
  $EB5F,$05 Call #R$B560 with item #N$06: #ITEM$06.
  $EB64,$03 Jump to #R$EB25 if #ITEM$06 is not present.
N $EB67 Print "#MESSAGE$D21E".
  $EB67,$03 #REGhl=#R$D21E.
  $EB6A,$03 Jump to #R$EA9E.

c $EB6D Take: Box
@ $EB6D label=Take_Box
D $EB6D Take the wooden box.
  $EB6D,$05 Jump to #R$EB54 with item #N$5B: #ITEM$5B.

c $EB72 Take: Flower
@ $EB72 label=Take_Flower
D $EB72 Take the jade flower from its pillow, or refuse if it is out of
. reach.
  $EB72,$05 Call #R$EAF4 with item #N$58: #ITEM$58.
  $EB77,$05 Call #R$B560 with item #N$83: #ITEM$83.
  $EB7C,$02 Jump to #R$EB89 if #ITEM$83 is not present.
  $EB7E,$06 Call #R$B613 to transform #ITEM$83 into #ITEM$32.
  $EB84,$05 Jump to #R$EB25 with item #N$58: #ITEM$58.
N $EB89 Print "#MESSAGE$D23D".
@ $EB89 label=Take_Flower_TooHigh
  $EB89,$03 #REGhl=#R$D23D.
  $EB8C,$03 Jump to #R$EA9E.

c $EB8F Response: "He Says "no""
@ $EB8F label=Response_HeSaysNo
D $EB8F Tell the player "He Says "no""
N $EB8F Print "#MESSAGE$E206".
  $EB8F,$03 #REGhl=#R$E206.
  $EB92,$03 Jump to #R$EA9E.

c $EB95 Take: Scroll
@ $EB95 label=Take_Scroll
D $EB95 Take the scroll.
  $EB95,$05 Jump to #R$EB54 with item #N$25: #ITEM$25.

c $EB9A Take: Ruby
@ $EB9A label=Take_Ruby
D $EB9A Take the ruby.
  $EB9A,$05 Jump to #R$EB54 with item #N$4A: #ITEM$4A.

c $EB9F Take: Diamond
@ $EB9F label=Take_Diamond
D $EB9F Take the diamond unless the spider is present.
  $EB9F,$05 Call #R$EAF4 with item #N$4D: #ITEM$4D.
  $EBA4,$05 Call #R$B560 with item #N$4E: #ITEM$4E.
  $EBA9,$03 Jump to #R$EB25 if #ITEM$4E is not present.
N $EBAC Print "#MESSAGE$D256".
  $EBAC,$03 #REGhl=#R$D256.
  $EBAF,$03 Jump to #R$EA9E.

c $EBB2 Take: Sapphire
@ $EBB2 label=Take_Sapphire
D $EBB2 Take the sapphire unless the dragon is present.
  $EBB2,$05 Call #R$EAF4 with item #N$5C: #ITEM$5C.
  $EBB7,$05 Call #R$B560 with item #N$5D: #ITEM$5D.
  $EBBC,$03 Jump to #R$EB25 if #ITEM$5D is not present.
N $EBBF Print "#MESSAGE$D441".
  $EBBF,$03 #REGhl=#R$D441.
  $EBC2,$03 Jump to #R$EA9E.

c $EBC5 Take: Emerald
@ $EBC5 label=Take_Emerald
D $EBC5 Take the emerald.
  $EBC5,$05 Jump to #R$EB54 with item #N$72: #ITEM$72.

c $EBCA Take: Pearl
@ $EBCA label=Take_Pearl
D $EBCA Take the pearl.
  $EBCA,$05 Jump to #R$EB54 with item #N$75: #ITEM$75.

c $EBCF Take: Tinderbox
@ $EBCF label=Take_Tinderbox
D $EBCF Take the tinderbox.
  $EBCF,$05 Jump to #R$EB54 with item #N$04: #ITEM$04.

c $EBD4 Take: Money
@ $EBD4 label=Take_Money
D $EBD4 Take the money unless the barrowight is present.
  $EBD4,$05 Call #R$EAF4 with item #N$21: #ITEM$21.
  $EBD9,$05 Call #R$B560 with item #N$22: #ITEM$22.
  $EBDE,$03 Jump to #R$EB25 if #ITEM$22 is not present.
N $EBE1 Print "#MESSAGE$D26F".
  $EBE1,$03 #REGhl=#R$D26F.
  $EBE4,$03 Jump to #R$EA9E.

c $EBE7 Take: Bible
@ $EBE7 label=Take_Bible
D $EBE7 Take the bible.
  $EBE7,$05 Jump to #R$EB54 with item #N$23: #ITEM$23.

c $EBEC Take: Wand
@ $EBEC label=Take_Wand
D $EBEC Take the wand unless a strange force stops the player.
  $EBEC,$05 Call #R$EAF4 with item #N$24: #ITEM$24.
  $EBF1,$08 Jump to #R$EB25 if bit 1 of *#R$AE78 is set.
N $EBF9 Print "#MESSAGE$D28C".
  $EBF9,$03 #REGhl=#R$D28C.
  $EBFC,$03 Jump to #R$EA9E.

c $EBFF Take: Flute
@ $EBFF label=Take_Flute
D $EBFF Take the flute.
  $EBFF,$05 Jump to #R$EB54 with item #N$26: #ITEM$26.

c $EC04 Take: Carpet
@ $EC04 label=Take_Carpet
D $EC04 Take the carpet and reveal the jewelled key the first time.
  $EC04,$05 Call #R$EAF4 with item #N$27: #ITEM$27.
  $EC09,$03 Call #R$EB25.
  $EC0C,$06 Return if bit 2 of *#R$AE76 is set, which relates to revealing
. the jewelled key.
  $EC12,$02 Set bit 2 of *#R$AE76 to signify that the jewelled key has been
. revealed.
  $EC14,$05 Call #R$B5DC with item #N$28: #ITEM$28.
N $EC19 Print "#MESSAGE$D2A7".
  $EC19,$03 #REGhl=#R$D2A7.
  $EC1C,$03 Jump to #R$EA9E.

c $EC1F Take: Key
@ $EC1F label=Take_Key
E $EC1F Continue on to #R$EC3A.
D $EC1F Take the key that is here, or ask the player to be more specific.
  $EC1F,$03 #REGhl=#R$E51D.
  $EC22,$03 Call #R$B606.
  $EC25,$05 Jump to #R$ECF4 if more than one key is present.
  $EC2A,$03 #REGhl=#R$E51D.
  $EC2D,$03 Call #R$B5EC.
  $EC30,$05 Jump to #R$ECC0 if the key is #ITEM$28.
  $EC35,$05 Jump to #R$EC6C if the key is #ITEM$47.

c $EC3A Take: Copper Key
@ $EC3A label=Take_CopperKey
D $EC3A Take the copper key and open the copper gates.
  $EC3A,$05 Call #R$B560 with item #N$6C: #ITEM$6C.
  $EC3F,$03 Jump to #R$F589 if #ITEM$6C is not present.
  $EC42,$05 Call #R$EAF4 with item #N$6C: #ITEM$6C.
  $EC47,$03 Call #R$EB25.
N $EC4A This action changes the map:
  $EC4A,$05 Write #N$11 to open southbound access to #ROOM$11 from
. #ROOM$09.
  $EC4F,$05 Write #N$09 to open northbound access to #ROOM$09 from
. #ROOM$11.
  $EC54,$06 Call #R$B613 to transform #ITEM$0B into #ITEM$0A.
  $EC5A,$06 Call #R$B613 to transform #ITEM$0E into #ITEM$0D.
  $EC60,$06 Return if bit 3 of *#R$AE76 is set, which relates to taking the
. copper key.
  $EC66,$05 Call #R$B78F with #N$02.
  $EC6B,$01 Return.

c $EC6C Take: Gold Key
@ $EC6C label=Take_GoldKey
D $EC6C Take the gold key and open the golden gates.
  $EC6C,$05 Call #R$B560 with item #N$47: #ITEM$47.
  $EC71,$03 Jump to #R$F589 if #ITEM$47 is not present.
  $EC74,$05 Call #R$EAF4 with item #N$47: #ITEM$47.
  $EC79,$03 Call #R$EB25.
N $EC7C This action changes the map:
  $EC7C,$05 Write #N$16 to open northbound access to #ROOM$16 from
. #ROOM$1E.
  $EC81,$05 Write #N$1E to open southbound access to #ROOM$1E from
. #ROOM$16.
  $EC86,$05 Write #N$2D to open northbound access to #ROOM$2D from
. #ROOM$35.
  $EC8B,$05 Write #N$35 to open southbound access to #ROOM$35 from
. #ROOM$2D.
  $EC90,$06 Call #R$B613 to transform #ITEM$17 into #ITEM$16.
  $EC96,$06 Call #R$B613 to transform #ITEM$1A into #ITEM$19.
  $EC9C,$06 Call #R$B613 to transform #ITEM$1D into #ITEM$1C.
  $ECA2,$06 Call #R$B613 to transform #ITEM$20 into #ITEM$1F.
  $ECA8,$06 Return if bit 4 of *#R$AE76 is set, which relates to taking the
. gold key.
  $ECAE,$02 Set bit 4 of *#R$AE76 to signify that the gold key has been taken.
  $ECB0,$05 Call #R$B78F with #N$02.
  $ECB5,$06 Return if *#R$AECD is not room #N$23: "#ROOM$23".
  $ECBB,$04 Write #N$00 to close the eastbound exit from #ROOM$23.
  $ECBF,$01 Return.

c $ECC0 Take: Jewelled Key
@ $ECC0 label=Take_JewelledKey
D $ECC0 Take the jewelled key and open the jewelled gates.
  $ECC0,$05 Call #R$B560 with item #N$28: #ITEM$28.
  $ECC5,$03 Jump to #R$F589 if #ITEM$28 is not present.
  $ECC8,$05 Call #R$EAF4 with item #N$28: #ITEM$28.
  $ECCD,$03 Call #R$EB25.
N $ECD0 This action changes the map:
  $ECD0,$05 Write #N$14 to open westbound access to #ROOM$14 from
. #ROOM$15.
  $ECD5,$05 Write #N$15 to open eastbound access to #ROOM$15 from
. #ROOM$14.
  $ECDA,$06 Call #R$B613 to transform #ITEM$11 into #ITEM$10.
  $ECE0,$06 Call #R$B613 to transform #ITEM$14 into #ITEM$13.
  $ECE6,$06 Return if bit 5 of *#R$AE76 is set, which relates to taking the
. jewelled key.
  $ECEC,$02 Set bit 5 of *#R$AE76 to signify that the jewelled key has been
. taken.
  $ECEE,$05 Call #R$B78F with #N$02.
  $ECF3,$01 Return.

c $ECF4 Response: "Please Be More Specific"
@ $ECF4 label=Response_PleaseBeMoreSpecific
E $ECF4 View the equivalent code in;
. #LIST
. { #FOREST$BDC5 }
. { #JEWELS$BFF5 }
. { #ANDROMEDA$6480 }
. { #WARLORD$AAF5 }
. LIST#
D $ECF4 Tell the player "Please Be More Specific"
N $ECF4 Print "#MESSAGE$B0B3".
  $ECF4,$03 #REGhl=#R$B0B3.
  $ECF7,$03 Jump to #R$EA9E.

c $ECFA Response: "The Songbird Ignores You"
@ $ECFA label=Response_TheSongbirdIgnoresYou
D $ECFA Tell the player "The Songbird Ignores You"
N $ECFA Print "#MESSAGE$DF69".
  $ECFA,$03 #REGhl=#R$DF69.
  $ECFD,$03 Jump to #R$EA9E.

c $ED00 Take: Sword
@ $ED00 label=Take_Sword
D $ED00 Take the sword unless a strange force stops the player.
  $ED00,$05 Call #R$EAF4 with item #N$2F: #ITEM$2F.
  $ED05,$03 #REGa=*#R$AECD.
  $ED08,$05 Jump to #R$EB25 if *#R$AECD is not room #N$1A:
. "#ROOM$1A".
  $ED0D,$08 Jump to #R$EB25 if bit 0 of *#R$AE78 is set.
N $ED15 Print "#MESSAGE$D28C".
  $ED15,$03 #REGhl=#R$D28C.
  $ED18,$03 Jump to #R$EA9E.

c $ED1B Take: Spear
@ $ED1B label=Take_Spear
D $ED1B Take the spear.
  $ED1B,$05 Jump to #R$EB54 with item #N$30: #ITEM$30.

c $ED20 Take: Dagger
@ $ED20 label=Take_Dagger
D $ED20 Take the dagger.
  $ED20,$05 Jump to #R$EB54 with item #N$31: #ITEM$31.

c $ED25 Response: "Even Beren Is Unable To Calm It"
@ $ED25 label=Response_EvenBerenIsUnableToCalmIt
D $ED25 Tell the player "Even Beren Is Unable To Calm It"
N $ED25 Print "#MESSAGE$DF48".
  $ED25,$03 #REGhl=#R$DF48.
  $ED28,$03 Jump to #R$EA9E.

c $ED2B Response: "Nothing Happens"
@ $ED2B label=Response_NothingHappens
D $ED2B Tell the player "Nothing Happens"
N $ED2B Print "#MESSAGE$DFF3".
  $ED2B,$03 #REGhl=#R$DFF3.
  $ED2E,$03 Jump to #R$EA9E.

c $ED31 Take: Bottle
@ $ED31 label=Take_Bottle
D $ED31 Take the bottle that is here.
  $ED31,$03 #REGhl=#R$E52F.
  $ED34,$03 Call #R$B5EC.
  $ED37,$03 Jump to #R$EB54.

c $ED3A Take: Water
@ $ED3A label=Take_Water
D $ED3A Take the bottle of water, or fill an empty bottle.
  $ED3A,$05 Call #R$B5CF with item #N$38: #ITEM$38.
  $ED3F,$05 Call #R$EAF4 if #ITEM$38 is in the inventory.
  $ED44,$08 Jump to #R$EB54 if #ITEM$38 is present.
  $ED4C,$05 Call #R$B5CF with item #N$37: #ITEM$37.
  $ED51,$02 Jump to #R$ED5F if #ITEM$37 is not in the inventory.
  $ED53,$06 Call #R$B613 to transform #ITEM$37 into #ITEM$38.
N $ED59 Print "#MESSAGE$D307".
  $ED59,$03 #REGhl=#R$D307.
  $ED5C,$03 Jump to #R$EA9E.

c $ED5F Response: "You Have Nothing To Carry It In"
@ $ED5F label=Response_YouHaveNothingToCarryItIn
D $ED5F Tell the player "You Have Nothing To Carry It In"
N $ED5F Print "#MESSAGE$D327".
  $ED5F,$03 #REGhl=#R$D327.
  $ED62,$03 Jump to #R$EA9E.

c $ED65 Take: Acid
@ $ED65 label=Take_Acid
D $ED65 Take the bottle of acid, or fill an empty bottle.
  $ED65,$05 Call #R$B5CF with item #N$39: #ITEM$39.
  $ED6A,$05 Call #R$EAF4 if #ITEM$39 is in the inventory.
  $ED6F,$08 Jump to #R$EB54 if #ITEM$39 is present.
  $ED77,$05 Call #R$B5CF with item #N$37: #ITEM$37.
  $ED7C,$03 Jump to #R$ED5F if #ITEM$37 is not in the inventory.
  $ED7F,$06 Call #R$B613 to transform #ITEM$37 into #ITEM$39.
N $ED85 Print "#MESSAGE$D348".
  $ED85,$03 #REGhl=#R$D348.
  $ED88,$03 Jump to #R$EA9E.

c $ED8B Take: Oil
@ $ED8B label=Take_Oil
D $ED8B Take the bottle of oil, or fill an empty bottle.
  $ED8B,$05 Call #R$B5CF with item #N$3A: #ITEM$3A.
  $ED90,$05 Call #R$EAF4 if #ITEM$3A is in the inventory.
  $ED95,$08 Jump to #R$EB54 if #ITEM$3A is present.
  $ED9D,$05 Call #R$B5CF with item #N$37: #ITEM$37.
  $EDA2,$03 Jump to #R$ED5F if #ITEM$37 is not in the inventory.
  $EDA5,$06 Call #R$B613 to transform #ITEM$37 into #ITEM$3A.
N $EDAB Print "#MESSAGE$D367".
  $EDAB,$03 #REGhl=#R$D367.
  $EDAE,$03 Jump to #R$EA9E.

c $EDB1 Take: Lyre
@ $EDB1 label=Take_Lyre
D $EDB1 Take the golden lyre.
  $EDB1,$05 Jump to #R$EB54 with item #N$45: #ITEM$45.

c $EDB6 Take: Mandolin
@ $EDB6 label=Take_Mandolin
D $EDB6 Take the mandolin.
  $EDB6,$05 Jump to #R$EB54 with item #N$46: #ITEM$46.

c $EDBB Take: Fragments
@ $EDBB label=Take_Fragments
D $EDBB Take the jade fragments.
  $EDBB,$05 Jump to #R$EB54 with item #N$59: #ITEM$59.

c $EDC0 Take: Crowbar
@ $EDC0 label=Take_Crowbar
D $EDC0 Take the crowbar.
  $EDC0,$05 Jump to #R$EB54 with item #N$5F: #ITEM$5F.

c $EDC5 Take: Shovel
@ $EDC5 label=Take_Shovel
D $EDC5 Take the shovel unless the pirate is present.
  $EDC5,$05 Jump to #R$F692 with item #N$60: #ITEM$60.

c $EDCA Take: Cage
@ $EDCA label=Take_Cage
D $EDCA Take the cage that is here.
  $EDCA,$03 #REGhl=#R$E54C.
  $EDCD,$03 Call #R$B5EC.
  $EDD0,$03 Jump to #R$EB54.

c $EDD3 Take: Coin
@ $EDD3 label=Take_Coin
D $EDD3 Take the silver coin.
  $EDD3,$05 Jump to #R$EB54 with item #N$65: #ITEM$65.

c $EDD8 Take: Honey
@ $EDD8 label=Take_Honey
D $EDD8 Take the honey.
  $EDD8,$05 Jump to #R$EB54 with item #N$70: #ITEM$70.

c $EDDD Take: Meat
@ $EDDD label=Take_Meat
D $EDDD Take the meat.
  $EDDD,$05 Jump to #R$EB54 with item #N$71: #ITEM$71.

c $EDE2 Take: Cross
@ $EDE2 label=Take_Cross
D $EDE2 Take the silver cross unless the bat is present.
  $EDE2,$05 Call #R$EAF4 with item #N$7B: #ITEM$7B.
  $EDE7,$05 Call #R$B560 with item #N$7C: #ITEM$7C.
  $EDEC,$03 Jump to #R$EB25 if #ITEM$7C is not present.
N $EDEF Print "#MESSAGE$D42B".
  $EDEF,$03 #REGhl=#R$D42B.
  $EDF2,$03 Jump to #R$EA9E.

c $EDF5 Take: Mirror
@ $EDF5 label=Take_Mirror
D $EDF5 Take the magic mirror.
  $EDF5,$05 Jump to #R$EB54 with item #N$7E: #ITEM$7E.

c $EDFA Take: Potion
@ $EDFA label=Take_Potion
E $EDFA Continue on to #R$EE0F.
D $EDFA Take the potion that is here, or ask the player to be more
. specific.
  $EDFA,$03 #REGhl=#R$E5AA.
  $EDFD,$03 Call #R$B606.
  $EE00,$05 Jump to #R$ECF4 if more than one potion is present.
  $EE05,$03 #REGhl=#R$E5AA.
  $EE08,$03 Call #R$B5EC.
  $EE0B,$04 Jump to #R$EE1C if the potion is #ITEM$6A.

c $EE0F Take: White Potion
@ $EE0F label=Take_WhitePotion
D $EE0F Take the white potion.
  $EE0F,$05 Call #R$B560 with item #N$6B: #ITEM$6B.
  $EE14,$03 Jump to #R$F589 if #ITEM$6B is not present.
  $EE17,$05 Jump to #R$EB54 with item #N$6B: #ITEM$6B.

c $EE1C Take: Black Potion
@ $EE1C label=Take_BlackPotion
D $EE1C Take the black potion.
  $EE1C,$05 Call #R$B560 with item #N$6A: #ITEM$6A.
  $EE21,$03 Jump to #R$F589 if #ITEM$6A is not present.
  $EE24,$05 Jump to #R$EB54 with item #N$6A: #ITEM$6A.

c $EE29 Take: Pillow
@ $EE29 label=Take_Pillow
D $EE29 Take the velvet pillow; the jade flower breaks if it is still on
. it.
  $EE29,$05 Call #R$EAF4 with item #N$32: #ITEM$32.
  $EE2E,$03 Call #R$EB25.
  $EE31,$05 Call #R$B560 with item #N$83: #ITEM$83.
  $EE36,$01 Return if #ITEM$83 is not present.
  $EE37,$06 Call #R$B613 to transform #ITEM$83 into #ITEM$59.
N $EE3D Print "#MESSAGE$D385".
  $EE3D,$03 #REGhl=#R$D385.
  $EE40,$03 Jump to #R$EA9E.

c $EE43 Drop: Frog
@ $EE43 label=Drop_Frog
D $EE43 Drop the frog.
  $EE43,$05 Jump to #R$EB31 with item #N$05: #ITEM$05.

c $EE48 Drop: Box
@ $EE48 label=Drop_Box
D $EE48 Drop the wooden box.
  $EE48,$05 Jump to #R$EB31 with item #N$5B: #ITEM$5B.

c $EE4D Drop: Flower
@ $EE4D label=Drop_Flower
E $EE4D Continue on to #R$EE63.
D $EE4D Drop the jade flower onto the pillow, or smash it if the pillow is not
. here.
  $EE4D,$05 Call #R$B5CF with item #N$58: #ITEM$58.
  $EE52,$05 Jump to #R$EB31 with item #N$58: #ITEM$58 if the Z flag is not set.
  $EE57,$03 Call #R$EB31.
  $EE5A,$05 Call #R$B626 with item #N$32: #ITEM$32.
  $EE5F,$02 Jump to #R$EE72 if the Z flag is not set.
  $EE61,$02 #REGa=#N$32.

c $EE63 Handler: Report The Kill
@ $EE63 label=Handler_ReportTheKill
D $EE63 Destroy the item in #REGa, then put the jade flower on the velvet
. pillow.
  $EE63,$03 Call #R$B5D5 to destroy the item.
  $EE66,$06 Call #R$B613 to transform #ITEM$58 into #ITEM$83.
N $EE6C Print "#MESSAGE$D3CE".
  $EE6C,$03 #REGhl=#R$D3CE.
  $EE6F,$03 Jump to #R$EA9E.

c $EE72 Response: "The Flower Drops And Breaks Into Many Fragments"
@ $EE72 label=Response_TheFlowerDropsAndBreaksIntoManyFragments
D $EE72 Tell the player "The Flower Drops And Breaks Into Many Fragments"
N $EE72 Print "#MESSAGE$D3FA".
  $EE72,$03 #REGhl=#R$D3FA.
  $EE75,$03 Jump to #R$EA9E.

c $EE78 Drop: Map
@ $EE78 label=Drop_Map
D $EE78 Drop the map.
  $EE78,$05 Jump to #R$EB31 with item #N$61: #ITEM$61.

c $EE7D Drop: Scroll
@ $EE7D label=Drop_Scroll
D $EE7D Drop the scroll.
  $EE7D,$05 Jump to #R$EB31 with item #N$25: #ITEM$25.

c $EE82 Drop: Ruby
@ $EE82 label=Drop_Ruby
D $EE82 Drop the ruby.
  $EE82,$05 Jump to #R$EB31 with item #N$4A: #ITEM$4A.

c $EE87 Drop: Diamond
@ $EE87 label=Drop_Diamond
D $EE87 Drop the diamond.
  $EE87,$05 Jump to #R$EB31 with item #N$4D: #ITEM$4D.

c $EE8C Drop: Sapphire
@ $EE8C label=Drop_Sapphire
D $EE8C Drop the sapphire.
  $EE8C,$05 Jump to #R$EB31 with item #N$5C: #ITEM$5C.

c $EE91 Drop: Emerald
@ $EE91 label=Drop_Emerald
D $EE91 Drop the emerald.
  $EE91,$05 Jump to #R$EB31 with item #N$72: #ITEM$72.

c $EE96 Drop: Pearl
@ $EE96 label=Drop_Pearl
D $EE96 Drop the pearl.
  $EE96,$05 Jump to #R$EB31 with item #N$75: #ITEM$75.

c $EE9B Drop: Tinderbox
@ $EE9B label=Drop_Tinderbox
D $EE9B Drop the tinderbox.
  $EE9B,$05 Jump to #R$EB31 with item #N$04: #ITEM$04.

c $EEA0 Drop: Money
@ $EEA0 label=Drop_Money
D $EEA0 Drop the money.
  $EEA0,$05 Jump to #R$EB31 with item #N$21: #ITEM$21.

c $EEA5 Drop: Bible
@ $EEA5 label=Drop_Bible
D $EEA5 Drop the bible.
  $EEA5,$05 Jump to #R$EB31 with item #N$23: #ITEM$23.

c $EEAA Drop: Wand
@ $EEAA label=Drop_Wand
D $EEAA Drop the wand.
  $EEAA,$05 Jump to #R$EB31 with item #N$24: #ITEM$24.

c $EEAF Drop: Flute
@ $EEAF label=Drop_Flute
D $EEAF Drop the silver flute.
  $EEAF,$05 Jump to #R$EB31 with item #N$26: #ITEM$26.

c $EEB4 Drop: Carpet
@ $EEB4 label=Drop_Carpet
D $EEB4 Drop the carpet.
  $EEB4,$05 Jump to #R$EB31 with item #N$27: #ITEM$27.

c $EEB9 Drop: Key
@ $EEB9 label=Drop_Key
E $EEB9 Continue on to #R$EED2.
D $EEB9 Drop the key that is held, or ask the player to be more specific.
  $EEB9,$03 #REGhl=#R$E51D.
  $EEBC,$03 Call #R$B606.
  $EEBF,$05 Jump to #R$ECF4 if more than one is present.
  $EEC4,$03 #REGhl=#R$E51D.
  $EEC7,$03 Call #R$B5EC.
  $EECA,$04 Jump to #R$EEF3 if #REGa is #N$47.
  $EECE,$04 Jump to #R$EF31 if #REGa is #N$28.

c $EED2 Drop: Copper Key
@ $EED2 label=Drop_CopperKey
D $EED2 Drop the copper key and close the copper gates.
  $EED2,$05 Call #R$B5CF with item #N$6C: #ITEM$6C.
  $EED7,$05 Jump to #R$EB31 with item #N$6C: #ITEM$6C if the Z flag is not set.
  $EEDC,$03 Call #R$EB31.
  $EEDF,$07 Write #N$00 to close the matching map exits.
  $EEE6,$06 Call #R$B613 to transform #ITEM$0A into #ITEM$0B.
  $EEEC,$06 Call #R$B613 to transform #ITEM$0D into #ITEM$0E.
  $EEF2,$01 Return.

c $EEF3 Drop: Gold Key
@ $EEF3 label=Drop_GoldKey
D $EEF3 Drop the gold key and close the golden gates.
  $EEF3,$05 Call #R$B5CF with item #N$47: #ITEM$47.
  $EEF8,$05 Jump to #R$EB31 with item #N$47: #ITEM$47 if the Z flag is not set.
  $EEFD,$03 Call #R$EB31.
  $EF00,$0D Write #N$00 to close the matching map exits.
  $EF0D,$06 Call #R$B613 to transform #ITEM$16 into #ITEM$17.
  $EF13,$06 Call #R$B613 to transform #ITEM$19 into #ITEM$1A.
  $EF19,$06 Call #R$B613 to transform #ITEM$1C into #ITEM$1D.
  $EF1F,$06 Call #R$B613 to transform #ITEM$1F into #ITEM$20.
  $EF25,$03 #REGa=*#R$AECD.
  $EF28,$03 Return if #REGa is not #N$23.
  $EF2B,$05 Write #N$24 to open eastbound access to #ROOM$24 from #ROOM$23.
  $EF30,$01 Return.

c $EF31 Drop: Jewelled Key
@ $EF31 label=Drop_JewelledKey
D $EF31 Drop the jewelled key and close the jewelled gates.
  $EF31,$05 Call #R$B5CF with item #N$28: #ITEM$28.
  $EF36,$05 Jump to #R$EB31 with item #N$28: #ITEM$28 if the Z flag is not set.
  $EF3B,$03 Call #R$EB31.
  $EF3E,$07 Write #N$00 to close the matching map exits.
  $EF45,$06 Call #R$B613 to transform #ITEM$10 into #ITEM$11.
  $EF4B,$06 Call #R$B613 to transform #ITEM$13 into #ITEM$14.
  $EF51,$01 Return.

c $EF52 Drop: Songbird
@ $EF52 label=Drop_Songbird
D $EF52 Drop the songbird in a wicker cage.
  $EF52,$05 Jump to #R$EB31 with item #N$2B: #ITEM$2B.

c $EF57 Drop: Sword
@ $EF57 label=Drop_Sword
D $EF57 Drop the sword.
  $EF57,$05 Jump to #R$EB31 with item #N$2F: #ITEM$2F.

c $EF5C Drop: Spear
@ $EF5C label=Drop_Spear
D $EF5C Drop the spear.
  $EF5C,$05 Jump to #R$EB31 with item #N$30: #ITEM$30.

c $EF61 Drop: Dagger
@ $EF61 label=Drop_Dagger
D $EF61 Drop the dagger.
  $EF61,$05 Jump to #R$EB31 with item #N$31: #ITEM$31.

c $EF66 Drop: Pillow
@ $EF66 label=Drop_Pillow
D $EF66 Drop the velvet pillow.
  $EF66,$05 Jump to #R$EB31 with item #N$32: #ITEM$32.

c $EF6B Drop: Falcon
@ $EF6B label=Drop_Falcon
D $EF6B Drop the falcon.
  $EF6B,$05 Jump to #R$EB31 with item #N$36: #ITEM$36.

c $EF70 Drop: Bottle
@ $EF70 label=Drop_Bottle
D $EF70 Drop the bottle that is held.
  $EF70,$03 #REGhl=#R$E52F.
  $EF73,$03 Call #R$B5EC.
  $EF76,$03 Jump to #R$EB31.

c $EF79 Drop: Water
@ $EF79 label=Drop_Water
D $EF79 Drop the bottle of water.
  $EF79,$05 Jump to #R$EB31 with item #N$38: #ITEM$38.

c $EF7E Drop: Acid
@ $EF7E label=Drop_Acid
D $EF7E Drop the bottle of acid.
  $EF7E,$05 Jump to #R$EB31 with item #N$39: #ITEM$39.

c $EF83 Drop: Oil
@ $EF83 label=Drop_Oil
D $EF83 Drop the bottle of oil.
  $EF83,$05 Jump to #R$EB31 with item #N$3A: #ITEM$3A.

c $EF88 Drop: Lyre
@ $EF88 label=Drop_Lyre
D $EF88 Drop the golden lyre.
  $EF88,$05 Jump to #R$EB31 with item #N$45: #ITEM$45.

c $EF8D Drop: Mandolin
@ $EF8D label=Drop_Mandolin
D $EF8D Drop the mandolin.
  $EF8D,$05 Jump to #R$EB31 with item #N$46: #ITEM$46.

c $EF92 Drop: Fragments
@ $EF92 label=Drop_Fragments
D $EF92 Drop the jade fragments.
  $EF92,$05 Jump to #R$EB31 with item #N$59: #ITEM$59.

c $EF97 Drop: Crowbar
@ $EF97 label=Drop_Crowbar
D $EF97 Drop the crowbar.
  $EF97,$05 Jump to #R$EB31 with item #N$5F: #ITEM$5F.

c $EF9C Drop: Shovel
@ $EF9C label=Drop_Shovel
D $EF9C Drop the shovel.
  $EF9C,$05 Jump to #R$EB31 with item #N$60: #ITEM$60.

c $EFA1 Drop: Cage
@ $EFA1 label=Drop_Cage
D $EFA1 Drop the cage that is held.
  $EFA1,$03 #REGhl=#R$E54C.
  $EFA4,$03 Call #R$B5EC.
  $EFA7,$03 Jump to #R$EB31.

c $EFAA Drop: Coin
@ $EFAA label=Drop_Coin
D $EFAA Drop the silver coin.
  $EFAA,$05 Jump to #R$EB31 with item #N$65: #ITEM$65.

c $EFAF Drop: Honey
@ $EFAF label=Drop_Honey
D $EFAF Drop the honey.
  $EFAF,$05 Jump to #R$EB31 with item #N$70: #ITEM$70.

c $EFB4 Drop: Meat
@ $EFB4 label=Drop_Meat
D $EFB4 Drop the meat.
  $EFB4,$05 Jump to #R$EB31 with item #N$71: #ITEM$71.

c $EFB9 Drop: Cross
@ $EFB9 label=Drop_Cross
D $EFB9 Drop the silver cross.
  $EFB9,$05 Jump to #R$EB31 with item #N$7B: #ITEM$7B.

c $EFBE Drop: Mirror
@ $EFBE label=Drop_Mirror
D $EFBE Drop the magic mirror.
  $EFBE,$05 Jump to #R$EB31 with item #N$7E: #ITEM$7E.

c $EFC3 Drop: Potion
@ $EFC3 label=Drop_Potion
E $EFC3 Continue on to #R$EFD8.
D $EFC3 Drop the potion that is held, or ask the player to be more specific.
  $EFC3,$03 #REGhl=#R$E5AA.
  $EFC6,$03 Call #R$B606.
  $EFC9,$05 Jump to #R$ECF4 if more than one is present.
  $EFCE,$03 #REGhl=#R$E5AA.
  $EFD1,$03 Call #R$B5EC.
  $EFD4,$04 Jump to #R$EFDD if #REGa is #N$6A.

c $EFD8 Drop: White Potion
@ $EFD8 label=Drop_WhitePotion
D $EFD8 Drop the white potion.
  $EFD8,$05 Jump to #R$EB31 with item #N$6B: #ITEM$6B.

c $EFDD Drop: Black Potion
@ $EFDD label=Drop_BlackPotion
D $EFDD Drop the black potion.
  $EFDD,$05 Jump to #R$EB31 with item #N$6A: #ITEM$6A.

c $EFE2 Response: "I Don't See The Point"
@ $EFE2 label=Response_IDontSeeThePoint
E $EFE2 View the equivalent code in;
. #LIST
. { #FOREST$ED78 }
. { #JEWELS$F065 }
. { #WARLORD$EDF9 }
. LIST#
D $EFE2 Tell the player "I Don't See The Point"
N $EFE2 Print "#MESSAGE$D45A".
  $EFE2,$03 #REGhl=#R$D45A.
  $EFE5,$03 Jump to #R$EA9E.

c $EFE8 Throw: Mirror To Anton
@ $EFE8 label=Throw_MirrorToAnton
D $EFE8 Throw the magic mirror to Anton.
  $EFE8,$05 Call #R$EB49 with item #N$7E: #ITEM$7E.
  $EFED,$01 Copy #REGe into #REGa.
  $EFEE,$03 Call #R$B5D5.
  $EFF1,$04 Decrease *#R$AE9A by one.
  $EFF5,$06 Call #R$B613 to transform #ITEM$7F into #ITEM$80.
N $EFFB Print "#MESSAGE$D48B".
  $EFFB,$03 #REGhl=#R$D48B.
  $EFFE,$03 Jump to #R$EA9E.

c $F001 Throw: Coin To Anton
@ $F001 label=Throw_CoinToAnton
D $F001 Throw the silver coin to Anton.
  $F001,$05 Call #R$EB49 with item #N$65: #ITEM$65.
  $F006,$05 Call #R$B560 with item #N$7F: #ITEM$7F.
  $F00B,$02 Jump to #R$F013 if the Z flag is not set.
N $F00D Print "#MESSAGE$D5FB".
  $F00D,$03 #REGhl=#R$D5FB.
  $F010,$03 Jump to #R$EA9E.
  $F013,$05 Call #R$B5D5 with item #N$65: #ITEM$65.
  $F018,$04 Decrease *#R$AE9A by one.
  $F01C,$05 Call #R$B5D5 with item #N$80: #ITEM$80.
N $F021 Print "#MESSAGE$D503".
  $F021,$03 #REGhl=#R$D503.
  $F024,$03 Jump to #R$EA9E.

c $F027 Throw: Honey To Bear
@ $F027 label=Throw_HoneyToBear
D $F027 Throw the honey to the bear.
  $F027,$05 Call #R$EB49 with item #N$70: #ITEM$70.
  $F02C,$05 Call #R$B560 with item #N$07: #ITEM$07.
  $F031,$02 Jump to #R$F039 if the Z flag is set.
N $F033 Print "#MESSAGE$D471".
  $F033,$03 #REGhl=#R$D471.
  $F036,$03 Jump to #R$EA9E.
  $F039,$05 Call #R$B5D5 with item #N$70: #ITEM$70.
  $F03E,$04 Decrease *#R$AE9A by one.
  $F042,$06 Call #R$B613 to transform #ITEM$07 into #ITEM$08.
  $F048,$05 Call #R$B78F with #N$02.
  $F04D,$05 Write #N$08 to open eastbound access to #ROOM$08 from #ROOM$07.
N $F052 Print "#MESSAGE$D576".
  $F052,$03 #REGhl=#R$D576.
  $F055,$03 Jump to #R$EA9E.

c $F058 Throw: Meat To Falcon
@ $F058 label=Throw_MeatToFalcon
D $F058 Throw the meat to the falcon.
  $F058,$05 Call #R$EB49 with item #N$71: #ITEM$71.
  $F05D,$01 Copy #REGe into #REGa.
  $F05E,$03 Call #R$B5D5.
  $F061,$04 Decrease *#R$AE9A by one.
  $F065,$05 Call #R$B78F with #N$03.
  $F06A,$05 Set bit 5 of *#R$AE76.
N $F06F Print "#MESSAGE$D5B0".
  $F06F,$03 #REGhl=#R$D5B0.
  $F072,$03 Jump to #R$EA9E.

c $F075 Throw: Honey To Lizard
@ $F075 label=Throw_HoneyToLizard
D $F075 Throw the honey to the swamp lizard.
  $F075,$05 Call #R$EB49 with item #N$70: #ITEM$70.
  $F07A,$01 Copy #REGe into #REGa.
  $F07B,$03 Call #R$B5D5.
  $F07E,$04 Decrease *#R$AE9A by one.
N $F082 Print "#MESSAGE$D5E2".
  $F082,$03 #REGhl=#R$D5E2.
  $F085,$03 Jump to #R$EA9E.

c $F088 Throw: Meat To Lizard
@ $F088 label=Throw_MeatToLizard
D $F088 Throw the meat to the swamp lizard.
  $F088,$02 #REGa=#N$71.
  $F08A,$02 Jump to #R$F077.

c $F08C Throw: Meat To Bear
@ $F08C label=Throw_MeatToBear
D $F08C Throw the meat to the bear.
  $F08C,$05 Call #R$EB49 with item #N$71: #ITEM$71.
  $F091,$05 Call #R$B560 with item #N$07: #ITEM$07.
  $F096,$02 Jump to #R$F088 if the Z flag is set.
N $F098 Print "#MESSAGE$D471".
  $F098,$03 #REGhl=#R$D471.
  $F09B,$03 Jump to #R$EA9E.

c $F09E Response: "You Must Be Joking!"
@ $F09E label=Response_YouMustBeJoking
E $F09E View the equivalent code in;
. #LIST
. { #JEWELS$F083 }
. { #WARLORD$EE47 }
. LIST#
D $F09E Tell the player "You Must Be Joking!"
N $F09E Print "#MESSAGE$D626".
  $F09E,$03 #REGhl=#R$D626.
  $F0A1,$03 Jump to #R$EA9E.

c $F0A4 Give: Frog
@ $F0A4 label=Give_Frog
D $F0A4 Give the frog to Istar.
  $F0A4,$05 Call #R$EB49 with item #N$05: #ITEM$05.
  $F0A9,$05 Call #R$B78F with #N$04.
  $F0AE,$05 Call #R$B5D5 with item #N$05: #ITEM$05.
  $F0B3,$04 Decrease *#R$AE9A by one.
  $F0B7,$01 #REGa=#N$00.
  $F0B8,$03 Call #R$B5DC.
N $F0BB Print "#MESSAGE$D63A".
  $F0BB,$03 #REGhl=#R$D63A.
  $F0BE,$03 Call #R$AC35.
  $F0C1,$05 Set bit 0 of *#R$AE91.
N $F0C6 Print "#MESSAGE$D66C".
  $F0C6,$03 #REGhl=#R$D66C.
  $F0C9,$03 Jump to #R$EAA2.

c $F0CC Kiss: Box
@ $F0CC label=Kiss_Box
D $F0CC Kiss the wooden box.
N $F0CC Print "#MESSAGE$D69D".
  $F0CC,$03 #REGhl=#R$D69D.
  $F0CF,$03 Call #R$AC35.
  $F0D2,$03 #REGa=*#R$AECD.
  $F0D5,$03 Return if #REGa is not #N$26.
N $F0D8 Print "#MESSAGE$D6F0".
  $F0D8,$03 #REGhl=#R$D6F0.
  $F0DB,$03 Call #R$B776.
  $F0DE,$06 Return if bit 6 of *#R$AE76 is set.
  $F0E4,$02 Set bit 6 of *#REGhl.
  $F0E6,$05 Call #R$B5DC with item #N$4A: #ITEM$4A.
  $F0EB,$05 Call #R$B78F with #N$03.
N $F0F0 Print "#MESSAGE$D71B".
  $F0F0,$03 #REGhl=#R$D71B.
  $F0F3,$03 Jump to #R$EAA2.
N $F0F6 Print "#MESSAGE$D72F".
  $F0F6,$03 #REGhl=#R$D72F.
  $F0F9,$03 Jump to #R$EA9E.
N $F0FC Print "#MESSAGE$D743".
  $F0FC,$03 #REGhl=#R$D743.
  $F0FF,$03 Jump to #R$EA9E.
N $F102 Print "#MESSAGE$D759".
  $F102,$03 #REGhl=#R$D759.
  $F105,$03 Jump to #R$EA9E.
N $F108 Print "#MESSAGE$D770".
  $F108,$03 #REGhl=#R$D770.
  $F10B,$03 Jump to #R$EA9E.
N $F10E Print "#MESSAGE$D789".
  $F10E,$03 #REGhl=#R$D789.
  $F111,$03 Jump to #R$EA9E.

c $F114 Kiss: Chest
@ $F114 label=Kiss_Chest
D $F114 Kiss the chest.
  $F114,$05 Call #R$B560 with item #N$4E: #ITEM$4E.
  $F119,$03 Jump to #R$EBAC if the Z flag is set.
  $F11C,$03 #REGhl=#R$E593.
  $F11F,$03 Call #R$B5EC.
  $F122,$04 Jump to #R$F0F6 if #REGa is #N$52.
  $F126,$04 Jump to #R$F130 if #REGa is #N$51.
N $F12A Print "#MESSAGE$D7A2".
  $F12A,$03 #REGhl=#R$D7A2.
  $F12D,$03 Jump to #R$EA9E.
  $F130,$06 Call #R$B613 to transform #ITEM$51 into #ITEM$52.
  $F136,$05 Call #R$B5DC with item #N$03: #ITEM$03.
  $F13B,$05 Set bit 3 of *#R$AE91.
  $F140,$05 Call #R$B78F with #N$04.
N $F145 Print "#MESSAGE$D7BC".
  $F145,$03 #REGhl=#R$D7BC.
  $F148,$03 Jump to #R$EA9E.
N $F14B Print "#MESSAGE$D803".
  $F14B,$03 #REGhl=#R$D803.
  $F14E,$03 Jump to #R$EA9E.

c $F151 Kiss: Gate
@ $F151 label=Kiss_Gate
D $F151 Kiss the gates that are here.
  $F151,$03 #REGhl=#R$E55E.
  $F154,$03 Call #R$B5EC.
  $F157,$04 Jump to #R$F174 if #REGa is less than #N$0F.
  $F15B,$04 Jump to #R$F179 if #REGa is less than #N$15.

c $F15F Kiss: Jewelled Gate
@ $F15F label=Kiss_JewelledGate
D $F15F Kiss the jewelled gates.
  $F15F,$03 #REGhl=#R$F9CB.
  $F162,$03 Call #R$B5EC.
  $F165,$03 Jump to #R$F14B if the Z flag is not set.
  $F168,$03 #REGhl=#R$F9D3.
  $F16B,$03 Call #R$B5EC.
  $F16E,$03 Jump to #R$F102 if the Z flag is set.
  $F171,$03 Jump to #R$F10E.

c $F174 Kiss: Copper Gate
@ $F174 label=Kiss_CopperGate
D $F174 Kiss the copper gates.
  $F174,$03 #REGhl=#R$F9C8.
  $F177,$02 Jump to #R$F162.

c $F179 Kiss: Gold Gate
@ $F179 label=Kiss_GoldGate
D $F179 Kiss the golden gates.
  $F179,$03 #REGhl=#R$F9D0.
  $F17C,$02 Jump to #R$F162.

c $F17E Kiss: Coffin
@ $F17E label=Kiss_Coffin
D $F17E Kiss the coffin.
  $F17E,$05 Call #R$B560 with item #N$54: #ITEM$54.
  $F183,$03 Jump to #R$F0F6 if the Z flag is set.
  $F186,$06 Call #R$B613 to transform #ITEM$53 into #ITEM$54.
  $F18C,$05 Call #R$B5DC with item #N$55: #ITEM$55.
N $F191 Print "#MESSAGE$D815".
  $F191,$03 #REGhl=#R$D815.
  $F194,$03 Jump to #R$EA9E.

c $F197 Kiss: Clam
@ $F197 label=Kiss_Clam
D $F197 Kiss the giant clam.
  $F197,$05 Call #R$B560 with item #N$74: #ITEM$74.
  $F19C,$03 Jump to #R$F0F6 if the Z flag is set.
N $F19F Print "#MESSAGE$D842".
  $F19F,$03 #REGhl=#R$D842.
  $F1A2,$03 Jump to #R$EA9E.

c $F1A5 Kiss: Clam With Crowbar
@ $F1A5 label=Kiss_ClamWithCrowbar
D $F1A5 Open the giant clam with the crowbar.
  $F1A5,$05 Call #R$B560 with item #N$74: #ITEM$74.
  $F1AA,$03 Jump to #R$F0F6 if the Z flag is set.
  $F1AD,$06 Call #R$B613 to transform #ITEM$73 into #ITEM$74.
  $F1B3,$05 Call #R$B5DC with item #N$75: #ITEM$75.
  $F1B8,$05 Call #R$B78F with #N$03.
N $F1BD Print "#MESSAGE$D876".
  $F1BD,$03 #REGhl=#R$D876.
  $F1C0,$03 Jump to #R$EA9E.

c $F1C3 Kiss: Door
@ $F1C3 label=Kiss_Door
D $F1C3 Kiss the door.
  $F1C3,$05 Call #R$B560 with item #N$6F: #ITEM$6F.
  $F1C8,$03 Jump to #R$F0F6 if the Z flag is set.
  $F1CB,$03 Jump to #R$EAE2.

c $F1CE Throw: Money To Guard
@ $F1CE label=Throw_MoneyToGuard
D $F1CE Throw the money to the guard.
  $F1CE,$05 Call #R$EB49 with item #N$21: #ITEM$21.
  $F1D3,$04 Decrease *#R$AE9A by one.
  $F1D7,$05 Call #R$B5D5 with item #N$21: #ITEM$21.
  $F1DC,$06 Call #R$B613 to transform #ITEM$6D into #ITEM$6C.
  $F1E2,$06 Call #R$B613 to transform #ITEM$6E into #ITEM$6F.
  $F1E8,$05 Write #N$3B to open eastbound access to #ROOM$3B from #ROOM$3A.
  $F1ED,$05 Call #R$B78F with #N$02.
N $F1F2 Print "#MESSAGE$D8A5".
  $F1F2,$03 #REGhl=#R$D8A5.
  $F1F5,$03 Jump to #R$EA9E.
  $F1F8,$02 No operation.

c $F1FA Close: Bible
@ $F1FA label=Close_Bible
D $F1FA Close the bible.
  $F1FA,$05 Call #R$EB49 with item #N$23: #ITEM$23.
N $F1FF Print "#MESSAGE$D8EF".
  $F1FF,$03 #REGhl=#R$D8EF.
  $F202,$03 Jump to #R$EA9E.

c $F205 Response: "Don't Be Ridiculous"
@ $F205 label=Response_DontBeRidiculous
E $F205 View the equivalent code in;
. #LIST
. { #FOREST$ED91 }
. { #JEWELS$F092 }
. { #WARLORD$EE05 }
. LIST#
D $F205 Tell the player "Don't Be Ridiculous"
N $F205 Print "#MESSAGE$D90C".
  $F205,$03 #REGhl=#R$D90C.
  $F208,$03 Jump to #R$EA9E.

c $F20B Response: "It Is Empty Already"
@ $F20B label=Response_ItIsEmptyAlready
D $F20B Tell the player "It Is Empty Already"
N $F20B Print "#MESSAGE$E214".
  $F20B,$03 #REGhl=#R$E214.
  $F20E,$03 Jump to #R$EA9E.

c $F211 Use: Bottle
@ $F211 label=Use_Bottle
D $F211 Empty the bottle that is held.
  $F211,$03 #REGhl=#R$E52F.
  $F214,$03 Call #R$B5EC.
  $F217,$03 Call #R$EB49.
  $F21A,$01 Copy #REGe into #REGa.
  $F21B,$05 Jump to #R$F20B if #REGa is #N$37.
  $F220,$05 Jump to #R$F205 if #REGa is #N$3B.
  $F225,$01 Copy #REGa into #REGb.
  $F226,$02 #REGc=#N$37.
  $F228,$03 Call #R$B613.
N $F22B Print "#MESSAGE$E229".
  $F22B,$03 #REGhl=#R$E229.
  $F22E,$03 Jump to #R$EA9E.

c $F231 Wave: Flute
@ $F231 label=Wave_Flute
D $F231 Wave the silver flute.
  $F231,$05 Call #R$EB49 with item #N$26: #ITEM$26.
  $F236,$03 Call #R$EAE8.
  $F239,$03 #REGhl=#R$E52F.
  $F23C,$03 Call #R$B5EC.
  $F23F,$02 Jump to #R$F251 if the Z flag is not set.
  $F241,$04 Jump to #R$F251 if #REGa is #N$3B.
  $F245,$01 Copy #REGa into #REGb.
  $F246,$02 #REGc=#N$3B.
  $F248,$03 Call #R$B613.
N $F24B Print "#MESSAGE$D937".
  $F24B,$03 #REGhl=#R$D937.
  $F24E,$03 Call #R$AC35.
  $F251,$05 Call #R$B560 with item #N$2D: #ITEM$2D.
  $F256,$02 Jump to #R$F296 if the Z flag is set.
  $F258,$05 Call #R$B560 with item #N$2E: #ITEM$2E.
  $F25D,$02 Jump to #R$F296 if the Z flag is set.
  $F25F,$05 Call #R$B560 with item #N$3E: #ITEM$3E.
  $F264,$03 Jump to #R$F2EF if the Z flag is set.
  $F267,$05 Call #R$B626 with item #N$58: #ITEM$58.
  $F26C,$01 Return if the Z flag is not set.
  $F26D,$05 Call #R$B626 with item #N$32: #ITEM$32.
  $F272,$02 Jump to #R$F280 if the Z flag is set.
  $F274,$06 Call #R$B613 to transform #ITEM$58 into #ITEM$59.
N $F27A Print "#MESSAGE$D94C".
  $F27A,$03 #REGhl=#R$D94C.
  $F27D,$03 Jump to #R$EA9E.
  $F280,$05 Call #R$B5D5 with item #N$58: #ITEM$58.
  $F285,$06 Call #R$B613 to transform #ITEM$32 into #ITEM$83.
  $F28B,$05 Call #R$B78F with #N$03.
N $F290 Print "#MESSAGE$D97F".
  $F290,$03 #REGhl=#R$D97F.
  $F293,$03 Jump to #R$EA9E.
  $F296,$05 Call #R$B5D5 with item #N$2D: #ITEM$2D.
  $F29B,$05 Call #R$B5D5 with item #N$2E: #ITEM$2E.
  $F2A0,$07 Write #N$00 to close the matching map exits.
N $F2A7 Print "#MESSAGE$D9B8".
  $F2A7,$03 #REGhl=#R$D9B8.
  $F2AA,$03 Call #R$AC35.
  $F2AD,$05 Call #R$B560 with item #N$2C: #ITEM$2C.
  $F2B2,$01 Return if the Z flag is not set.
  $F2B3,$05 Call #R$B5D5 with item #N$2C: #ITEM$2C.
  $F2B8,$05 Call #R$B78F with #N$03.
  $F2BD,$05 Set bit 2 of *#R$AE77.
N $F2C2 Print "#MESSAGE$D9E4".
  $F2C2,$03 #REGhl=#R$D9E4.
  $F2C5,$03 Jump to #R$EAA2.
  $F2C8,$01 No operation.

c $F2C9 Wave: Mandolin
@ $F2C9 label=Wave_Mandolin
D $F2C9 Wave the mandolin.
  $F2C9,$05 Call #R$EB49 with item #N$46: #ITEM$46.
  $F2CE,$03 Call #R$EAE8.
  $F2D1,$03 #REGa=*#R$AECD.
  $F2D4,$03 Return if #REGa is not #N$23.
  $F2D7,$05 Write #N$24 to open eastbound access to #ROOM$24 from #ROOM$23.
  $F2DC,$06 Return if bit 7 of *#R$AE76 is set.
  $F2E2,$02 Set bit 7 of *#REGhl.
  $F2E4,$05 Call #R$B78F with #N$02.
N $F2E9 Print "#MESSAGE$DA05".
  $F2E9,$03 #REGhl=#R$DA05.
  $F2EC,$03 Jump to #R$EAA2.
  $F2EF,$06 Call #R$B613 to transform #ITEM$3E into #ITEM$01.
  $F2F5,$05 Set bit 1 of *#R$AE91.
  $F2FA,$05 Call #R$B78F with #N$04.
N $F2FF Print "#MESSAGE$DA36".
  $F2FF,$03 #REGhl=#R$DA36.
  $F302,$03 Jump to #R$EA9E.

c $F305 Play: Barrowight With Bible
@ $F305 label=Play_BarrowightWithBible
D $F305 Play the bible against the barrowight.
  $F305,$05 Call #R$EB49 with item #N$23: #ITEM$23.
  $F30A,$05 Call #R$B5D5 with item #N$22: #ITEM$22.
  $F30F,$05 Call #R$B78F with #N$03.
N $F314 Print "#MESSAGE$DA61".
  $F314,$03 #REGhl=#R$DA61.
  $F317,$03 Jump to #R$EA9E.
N $F31A Print "#MESSAGE$DB77".
  $F31A,$03 #REGhl=#R$DB77.
  $F31D,$03 Jump to #R$EA9E.
N $F320 Print "#MESSAGE$DB8A".
  $F320,$03 #REGhl=#R$DB8A.
  $F323,$03 Jump to #R$EA9E.

c $F326 Play: Serpent With Songbird
@ $F326 label=Play_SerpentWithSongbird
D $F326 Play the songbird against the serpent.
  $F326,$05 Call #R$B560 with item #N$3D: #ITEM$3D.
  $F32B,$03 Jump to #R$F31A if the Z flag is set.
  $F32E,$05 Call #R$EB49 with item #N$2B: #ITEM$2B.
  $F333,$08 Jump to #R$ECFA if bit 0 of *#R$AE78 is not set.
  $F33B,$06 Call #R$B613 to transform #ITEM$3C into #ITEM$3D.
  $F341,$05 Write #N$1F to open westbound access to #ROOM$1F from #ROOM$20.
  $F346,$05 Call #R$B78F with #N$03.
N $F34B Print "#MESSAGE$DA93".
  $F34B,$03 #REGhl=#R$DA93.
  $F34E,$03 Jump to #R$EA9E.

c $F351 Play: Hydra With Sword
@ $F351 label=Play_HydraWithSword
D $F351 Play the sword against the hydra.
  $F351,$05 Call #R$B560 with item #N$49: #ITEM$49.
  $F356,$03 Jump to #R$F31A if the Z flag is set.
  $F359,$05 Call #R$EB49 with item #N$2F: #ITEM$2F.
N $F35E Print "#MESSAGE$DACF".
  $F35E,$03 #REGhl=#R$DACF.
  $F361,$03 Jump to #R$EA9E.

c $F364 Play: Hydra With Spear
@ $F364 label=Play_HydraWithSpear
D $F364 Play the spear against the hydra.
  $F364,$05 Call #R$B560 with item #N$49: #ITEM$49.
  $F369,$03 Jump to #R$F31A if the Z flag is set.
  $F36C,$05 Call #R$EB49 with item #N$30: #ITEM$30.
  $F371,$06 Call #R$B613 to transform #ITEM$48 into #ITEM$49.
  $F377,$05 Write #N$23 to open westbound access to #ROOM$23 from #ROOM$24.
  $F37C,$05 Call #R$B78F with #N$03.
N $F381 Print "#MESSAGE$DB23".
  $F381,$03 #REGhl=#R$DB23.
  $F384,$03 Jump to #R$EA9E.

c $F387 Play: Vampire With Cross
@ $F387 label=Play_VampireWithCross
D $F387 Play the silver cross against the vampire.
  $F387,$05 Call #R$EB49 with item #N$7B: #ITEM$7B.
  $F38C,$06 Call #R$B613 to transform #ITEM$55 into #ITEM$02.
  $F392,$05 Set bit 2 of *#R$AE91.
  $F397,$05 Call #R$B78F with #N$04.
N $F39C Print "#MESSAGE$DB9D".
  $F39C,$03 #REGhl=#R$DB9D.
  $F39F,$03 Call #R$AC35.
N $F3A2 Print "#MESSAGE$DBDC".
  $F3A2,$03 #REGhl=#R$DBDC.
  $F3A5,$03 Jump to #R$EAA2.

c $F3A8 Play: Knight With Acid
@ $F3A8 label=Play_KnightWithAcid
D $F3A8 Play the bottle of acid against the Black Knight.
  $F3A8,$05 Call #R$B560 with item #N$57: #ITEM$57.
  $F3AD,$03 Jump to #R$F320 if the Z flag is set.
  $F3B0,$05 Call #R$EB49 with item #N$39: #ITEM$39.
  $F3B5,$06 Call #R$B613 to transform #ITEM$39 into #ITEM$37.
  $F3BB,$06 Call #R$B613 to transform #ITEM$56 into #ITEM$57.
  $F3C1,$05 Write #N$2A to open westbound access to #ROOM$2A from #ROOM$2B.
  $F3C6,$05 Call #R$B78F with #N$03.
N $F3CB Print "#MESSAGE$DC0E".
  $F3CB,$03 #REGhl=#R$DC0E.
  $F3CE,$03 Jump to #R$EA9E.

c $F3D1 Play: Dragon With Sword
@ $F3D1 label=Play_DragonWithSword
D $F3D1 Play the sword against the dragon.
  $F3D1,$05 Call #R$B560 with item #N$5E: #ITEM$5E.
  $F3D6,$03 Jump to #R$F31A if the Z flag is set.
  $F3D9,$05 Call #R$EB49 with item #N$2F: #ITEM$2F.
  $F3DE,$06 Call #R$B613 to transform #ITEM$5D into #ITEM$5E.
  $F3E4,$05 Write #N$29 to open northbound access to #ROOM$29 from #ROOM$31.
  $F3E9,$05 Call #R$B78F with #N$03.
N $F3EE Print "#MESSAGE$DC65".
  $F3EE,$03 #REGhl=#R$DC65.
  $F3F1,$03 Jump to #R$EA9E.
  $F3F4,$01 No operation.
N $F3F5 Print "#MESSAGE$DC9D".
  $F3F5,$03 #REGhl=#R$DC9D.
  $F3F8,$03 Jump to #R$EA9E.

c $F3FB Play: Witch With Water
@ $F3FB label=Play_WitchWithWater
D $F3FB Play the bottle of water against the witch.
  $F3FB,$05 Call #R$B560 with item #N$7A: #ITEM$7A.
  $F400,$02 Jump to #R$F408 if the Z flag is not set.
N $F402 Print "#MESSAGE$DCFE".
  $F402,$03 #REGhl=#R$DCFE.
  $F405,$03 Jump to #R$EA9E.
  $F408,$05 Call #R$EB49 with item #N$38: #ITEM$38.
  $F40D,$06 Call #R$B613 to transform #ITEM$38 into #ITEM$37.
  $F413,$06 Call #R$B613 to transform #ITEM$79 into #ITEM$7A.
  $F419,$05 Write #N$3E to open westbound access to #ROOM$3E from #ROOM$3F.
  $F41E,$05 Call #R$B78F with #N$03.
N $F423 Print "#MESSAGE$DCE4".
  $F423,$03 #REGhl=#R$DCE4.
  $F426,$03 Jump to #R$EA9E.
  $F429,$01 No operation.

c $F42A Kill: Chest
@ $F42A label=Kill_Chest
D $F42A Oil the rusty chest with the bottle of oil.
  $F42A,$05 Call #R$B5CF with item #N$3A: #ITEM$3A.
  $F42F,$02 Jump to #R$F437 if the Z flag is set.
N $F431 Print "#MESSAGE$DD26".
  $F431,$03 #REGhl=#R$DD26.
  $F434,$03 Jump to #R$EA9E.
  $F437,$05 Call #R$B560 with item #N$4E: #ITEM$4E.
  $F43C,$02 Jump to #R$F444 if the Z flag is not set.
N $F43E Print "#MESSAGE$D256".
  $F43E,$03 #REGhl=#R$D256.
  $F441,$03 Jump to #R$EA9E.
  $F444,$06 Call #R$B613 to transform #ITEM$3A into #ITEM$37.
  $F44A,$05 Call #R$B560 with item #N$50: #ITEM$50.
  $F44F,$03 Jump to #R$EAE8 if the Z flag is not set.
  $F452,$06 Call #R$B613 to transform #ITEM$50 into #ITEM$51.
  $F458,$05 Call #R$B78F with #N$02.
  $F45D,$03 Jump to #R$EAE8.

c $F460 Oil: Plant
@ $F460 label=Oil_Plant
D $F460 Water the plant from the bottle of water.
  $F460,$05 Call #R$B5CF with item #N$38: #ITEM$38.
  $F465,$02 Jump to #R$F46D if the Z flag is set.
N $F467 Print "#MESSAGE$DD37".
  $F467,$03 #REGhl=#R$DD37.
  $F46A,$03 Jump to #R$EA9E.
  $F46D,$06 Call #R$B613 to transform #ITEM$38 into #ITEM$37.
  $F473,$03 #REGhl=#R$E5B6.
  $F476,$03 Call #R$B5EC.
  $F479,$05 Jump to #R$EAE8 if #REGa is #N$78.
  $F47E,$05 Jump to #R$EAE8 if #REGa is #N$85.
  $F483,$04 Jump to #R$F49B if #REGa is #N$77.
  $F487,$06 Call #R$B613 to transform #ITEM$76 into #ITEM$77.
  $F48D,$05 Call #R$B78F with #N$03.
  $F492,$03 Call #R$EAE8.
N $F495 Print "#MESSAGE$DD4A".
  $F495,$03 #REGhl=#R$DD4A.
  $F498,$03 Jump to #R$EA9E.
  $F49B,$06 Call #R$B613 to transform #ITEM$77 into #ITEM$78.
  $F4A1,$05 Write #N$1E to open up access to #ROOM$1E from #ROOM$3E.
  $F4A6,$06 Call #R$B5FD with item #N$85 in room #N$1E.
  $F4AC,$05 Call #R$B78F with #N$02.
  $F4B1,$03 Call #R$EAE8.
N $F4B4 Print "#MESSAGE$DD8F".
  $F4B4,$03 #REGhl=#R$DD8F.
  $F4B7,$03 Jump to #R$EA9E.

c $F4BA Oil: Ashes
@ $F4BA label=Oil_Ashes
D $F4BA Pour the bottle of water on the ashes.
  $F4BA,$05 Call #R$B5CF with item #N$38: #ITEM$38.
  $F4BF,$02 Jump to #R$F4C7 if the Z flag is set.
N $F4C1 Print "#MESSAGE$DD37".
  $F4C1,$03 #REGhl=#R$DD37.
  $F4C4,$03 Jump to #R$EA9E.
  $F4C7,$05 Call #R$B5D5 with item #N$81: #ITEM$81.
  $F4CC,$05 Set bit 1 of *#R$AE76.
  $F4D1,$06 Call #R$B613 to transform #ITEM$38 into #ITEM$37.
  $F4D7,$05 Call #R$B78F with #N$03.
  $F4DC,$03 Call #R$EAE8.
N $F4DF Print "#MESSAGE$DDCC".
  $F4DF,$03 #REGhl=#R$DDCC.
  $F4E2,$03 Jump to #R$EA9E.

c $F4E5 Drink: Water
@ $F4E5 label=Drink_Water
D $F4E5 Drink the bottle of water.
  $F4E5,$05 Call #R$B560 with item #N$38: #ITEM$38.
  $F4EA,$02 Jump to #R$F4F2 if the Z flag is not set.
  $F4EC,$06 Call #R$B613 to transform #ITEM$38 into #ITEM$37.
N $F4F2 Print "#MESSAGE$DE0E".
  $F4F2,$03 #REGhl=#R$DE0E.
  $F4F5,$03 Jump to #R$EA9E.

c $F4F8 Drink: Potion
@ $F4F8 label=Drink_Potion
E $F4F8 Continue on to #R$F50D.
D $F4F8 Drink the potion that is held, or ask the player to be more specific.
  $F4F8,$03 #REGhl=#R$E5AA.
  $F4FB,$03 Call #R$B606.
  $F4FE,$05 Jump to #R$ECF4 if more than one is present.
  $F503,$03 #REGhl=#R$E5AA.
  $F506,$03 Call #R$B5EC.
  $F509,$04 Jump to #R$F528 if #REGa is #N$6A.

c $F50D Drink: White Potion
@ $F50D label=Drink_WhitePotion
D $F50D Drink the white potion.
  $F50D,$05 Call #R$EB49 with item #N$6B: #ITEM$6B.
  $F512,$05 Call #R$B5D5 with item #N$6B: #ITEM$6B.
  $F517,$05 Set bit 0 of *#R$AE76.
  $F51C,$05 Call #R$B78F with #N$02.
  $F521,$04 Decrease *#R$AE9A by one.
  $F525,$03 Jump to #R$EAE8.

c $F528 Drink: Black Potion
@ $F528 label=Drink_BlackPotion
D $F528 Drink the black potion.
  $F528,$05 Call #R$EB49 with item #N$6A: #ITEM$6A.
  $F52D,$03 #REGhl=#R$E9B5.
  $F530,$01 Swap #REGhl with the return address on the stack.
N $F531 Print "#MESSAGE$DE2B".
  $F531,$03 #REGhl=#R$DE2B.
  $F534,$03 Jump to #R$EA9E.

c $F537 Response: "You Have Nothing To Dig With"
@ $F537 label=Response_YouHaveNothingToDigWith
D $F537 Tell the player "You Have Nothing To Dig With"
N $F537 Print "#MESSAGE$DE58".
  $F537,$03 #REGhl=#R$DE58.
  $F53A,$03 Jump to #R$EA9E.

c $F53D Response: "You Find Nothing"
@ $F53D label=Response_YouFindNothing
D $F53D Tell the player "You Find Nothing"
  $F53D,$03 Call #R$EAE8.
N $F540 Print "#MESSAGE$DE76".
  $F540,$03 #REGhl=#R$DE76.
  $F543,$03 Jump to #R$EA9E.

c $F546 Response: "He's not keen on the idea"
@ $F546 label=Response_NotKeen
D $F546 Tell the player "He's not keen on the idea"
N $F546 Print "#MESSAGE$DEC1".
  $F546,$03 #REGhl=#R$DEC1.
  $F549,$03 Jump to #R$EA9E.

c $F54C Handler: Shift Input Tokens
@ $F54C label=Handler_ShiftInputTokens
D $F54C Slide the word tokens down one place so the verb is dropped.
  $F54C,$03 Point #REGhl at the second word token.
  $F54F,$0D Slide the word tokens down one place and mark the last slot empty.
  $F55C,$01 Return.

c $F55D Fill: Gas
@ $F55D label=Fill_Gas
D $F55D Light the marsh gas with the tinderbox.
  $F55D,$05 Call #R$B5CF with item #N$04: #ITEM$04.
  $F562,$02 Jump to #R$F56A if the Z flag is set.
N $F564 Print "#MESSAGE$DEDC".
  $F564,$03 #REGhl=#R$DEDC.
  $F567,$03 Jump to #R$EA9E.
  $F56A,$08 Jump to #R$EFE2 if bit 1 of *#R$AE77 is set.
  $F572,$02 Set bit 1 of *#R$AE77.
  $F574,$05 Call #R$B5D5 with item #N$06: #ITEM$06.
  $F579,$05 Write #N$07 to open eastbound access to #ROOM$07 from #ROOM$06.
  $F57E,$05 Call #R$B78F with #N$03.
N $F583 Print "#MESSAGE$DEFF".
  $F583,$03 #REGhl=#R$DEFF.
  $F586,$03 Jump to #R$EA9E.

c $F589 Response: "It Isn't Here"
@ $F589 label=Response_ItIsntHere
D $F589 Tell the player "It Isn't Here"
N $F589 Print "#MESSAGE$DF39".
  $F589,$03 #REGhl=#R$DF39.
  $F58C,$03 Jump to #R$EA9E.

c $F58F Take: Falcon
@ $F58F label=Take_Falcon
D $F58F Take the falcon unless a strange force stops the player.
  $F58F,$05 Call #R$EAF4 with item #N$36: #ITEM$36.
  $F594,$07 Jump to #R$F5A1 if bit 0 of *#R$AE78 is set.
N $F59B Print "#MESSAGE$D2F1".
  $F59B,$03 #REGhl=#R$D2F1.
  $F59E,$03 Jump to #R$EA9E.
  $F5A1,$08 Jump to #R$ED25 if bit 5 of *#R$AE76 is not set.
  $F5A9,$05 Call #R$B78F with #N$01.
  $F5AE,$05 Jump to #R$EB25 with item #N$36: #ITEM$36.

c $F5B3 Take: Songbird
@ $F5B3 label=Take_Songbird
D $F5B3 Take the songbird, or cage it if the empty cage is held.
  $F5B3,$03 #REGhl=#R$E521.
  $F5B6,$03 Call #R$B5EC.
  $F5B9,$05 Jump to #R$EB54 if #REGa is not #N$2A.
  $F5BE,$07 Jump to #R$F5CB if bit 0 of *#R$AE78 is set.
N $F5C5 Print "#MESSAGE$D2C3".
  $F5C5,$03 #REGhl=#R$D2C3.
  $F5C8,$03 Jump to #R$EA9E.
  $F5CB,$05 Call #R$B5CF with item #N$64: #ITEM$64.
  $F5D0,$03 Jump to #R$ED5F if the Z flag is not set.
  $F5D3,$06 Call #R$B613 to transform #ITEM$64 into #ITEM$2B.
  $F5D9,$05 Call #R$B5D5 with item #N$2A: #ITEM$2A.
  $F5DE,$05 Call #R$B78F with #N$02.
  $F5E3,$03 Jump to #R$EAE8.

c $F5E6 Play: Bat With Falcon
@ $F5E6 label=Play_BatWithFalcon
D $F5E6 Play the falcon against the giant bat.
  $F5E6,$05 Call #R$B560 with item #N$7D: #ITEM$7D.
  $F5EB,$03 Jump to #N$00A2 if the Z flag is set.
  $F5EE,$05 Call #R$EB49 with item #N$36: #ITEM$36.
  $F5F3,$07 Jump to #R$F600 if bit 0 of *#R$AE78 is set.
N $F5FA Print "#MESSAGE$DD13".
  $F5FA,$03 #REGhl=#R$DD13.
  $F5FD,$03 Jump to #R$EA9E.
  $F600,$06 Call #R$B613 to transform #ITEM$7C into #ITEM$7D.
  $F606,$05 Call #R$B78F with #N$03.
N $F60B Print "#MESSAGE$DF83".
  $F60B,$03 #REGhl=#R$DF83.
  $F60E,$03 Jump to #R$EA9E.

c $F611 Read: Wand
@ $F611 label=Read_Wand
D $F611 Read the wand.
  $F611,$05 Call #R$EB49 with item #N$24: #ITEM$24.
  $F616,$07 Jump to #R$F623 if bit 1 of *#R$AE78 is set.
N $F61D Print "#MESSAGE$D28C".
  $F61D,$03 #REGhl=#R$D28C.
  $F620,$03 Jump to #R$EA9E.
  $F623,$03 #REGa=*#R$AECD.
  $F626,$04 Jump to #R$F647 if #REGa is not #N$16.
  $F62A,$05 Call #R$B560 with item #N$29: #ITEM$29.
  $F62F,$03 Jump to #R$ED2B if the Z flag is not set.
  $F632,$05 Call #R$B5D5 with item #N$29: #ITEM$29.
  $F637,$05 Write #N$15 to open westbound access to #ROOM$15 from #ROOM$16.
  $F63C,$05 Call #R$B78F with #N$03.
N $F641 Print "#MESSAGE$E004".
  $F641,$03 #REGhl=#R$E004.
  $F644,$03 Jump to #R$EA9E.
  $F647,$04 Jump to #R$F689 if #REGa is not #N$19.
  $F64B,$05 Call #R$B560 with item #N$2D: #ITEM$2D.
  $F650,$03 Jump to #R$ED2B if the Z flag is set.
  $F653,$06 Call #R$B5FD with item #N$2D in room #N$19.
  $F659,$06 Call #R$B5FD with item #N$2E in room #N$21.
  $F65F,$05 Write #N$21 to open southbound access to #ROOM$21 from #ROOM$19.
  $F664,$05 Write #N$19 to open northbound access to #ROOM$19 from #ROOM$21.
N $F669 Print "#MESSAGE$E06F".
  $F669,$03 #REGhl=#R$E06F.
  $F66C,$03 Call #R$AC35.
  $F66F,$06 Return if bit 2 of *#R$AE77 is set.
  $F675,$05 Call #R$B5DC with item #N$2C: #ITEM$2C.
  $F67A,$04 Write #N$00 to close the southbound exit from #ROOM$19.
  $F67E,$05 Call #R$B78F with #N$02.
N $F683 Print "#MESSAGE$E0B0".
  $F683,$03 #REGhl=#R$E0B0.
  $F686,$03 Jump to #R$EA9E.
  $F689,$04 Jump to #R$F653 if #REGa is #N$21.
  $F68D,$03 Jump to #R$F205.

c $F690 Take: Map
@ $F690 label=Take_Map
D $F690 Take the map unless the pirate is present.
  $F690,$02 #REGa=#N$61.
N $F692 Take the item in #REGa unless the pirate is present.
@ $F692 label=Take_Map_UnlessPiratePresent
  $F692,$03 Call #R$EAF4.
  $F695,$05 Call #R$B560 with item #N$62: #ITEM$62.
  $F69A,$03 Jump to #R$EB25 if the Z flag is not set.
N $F69D Print "#MESSAGE$E0EA".
  $F69D,$03 #REGhl=#R$E0EA.
  $F6A0,$03 Jump to #R$EA9E.

c $F6A3 Close: Map
@ $F6A3 label=Close_Map
D $F6A3 Close the map.
  $F6A3,$05 Call #R$EB49 with item #N$61: #ITEM$61.
  $F6A8,$08 Jump to #R$EAD6 if bit 1 of *#R$AE78 is not set.
N $F6B0 Print "#MESSAGE$E103".
  $F6B0,$03 #REGhl=#R$E103.
  $F6B3,$03 Jump to #R$EA9E.

c $F6B6 Close: Scroll
@ $F6B6 label=Close_Scroll
D $F6B6 Close the scroll.
  $F6B6,$05 Call #R$EB49 with item #N$25: #ITEM$25.
  $F6BB,$08 Jump to #R$EAD6 if bit 1 of *#R$AE78 is not set.
N $F6C3 Print "#MESSAGE$E13F".
  $F6C3,$03 #REGhl=#R$E13F.
  $F6C6,$03 Jump to #R$EA9E.

c $F6C9 Wave: Lyre
@ $F6C9 label=Wave_Lyre
D $F6C9 Wave the golden lyre.
  $F6C9,$05 Call #R$EB49 with item #N$45: #ITEM$45.
  $F6CE,$08 Jump to #R$EAE8 if bit 2 of *#R$AE78 is not set.
  $F6D6,$05 Call #R$B560 with item #N$4E: #ITEM$4E.
  $F6DB,$03 Jump to #R$EAE8 if the Z flag is not set.
  $F6DE,$06 Call #R$B613 to transform #ITEM$4E into #ITEM$4F.
  $F6E4,$05 Call #R$B78F with #N$03.
N $F6E9 Print "#MESSAGE$E169".
  $F6E9,$03 #REGhl=#R$E169.
  $F6EC,$03 Jump to #R$EA9E.

c $F6EF Play: Pirate With Dagger
@ $F6EF label=Play_PirateWithDagger
D $F6EF Play the dagger against the pirate.
  $F6EF,$05 Call #R$B560 with item #N$63: #ITEM$63.
  $F6F4,$03 Jump to #R$F320 if the Z flag is set.
  $F6F7,$05 Call #R$EB49 with item #N$31: #ITEM$31.
  $F6FC,$08 Jump to #R$F3F5 if bit 3 of *#R$AE78 is not set.
  $F704,$06 Call #R$B613 to transform #ITEM$62 into #ITEM$63.
  $F70A,$05 Call #R$B78F with #N$03.
N $F70F Print "#MESSAGE$E1C5".
  $F70F,$03 #REGhl=#R$E1C5.
  $F712,$03 Jump to #R$EA9E.

c $F715 Action: Help
@ $F715 label=Action_Help
E $F715 View the equivalent code in;
. #LIST
. { #FOREST$EDC3 }
. { #JEWELS$F09C }
. { #ANDROMEDA$8E8D }
. LIST#
D $F715 Carry out the "Help" command.
  $F715,$03 Call #R$B665.
  $F718,$01 Return if the direct object is malformed.
N $F719 Is #ITEM$06 in the current room?
  $F719,$08 Jump to #R$EAA6 if #R$B560 reports that #ITEM$06 is present.
N $F721 Is #ITEM$2C in the current room?
  $F721,$08 Jump to #R$EAA6 if #R$B560 reports that #ITEM$2C is present.
N $F729 Is #ITEM$07 in the current room?
  $F729,$07 Jump to #R$F736 if #R$B560 reports that #ITEM$07 is not
. present.
N $F730 Print "#MESSAGE$D106".
  $F730,$03 #REGhl=#R$D106.
  $F733,$03 Jump to #R$EA9E.
@ $F736 label=Action_Help_Next
N $F736 Is #ITEM$4E in the current room?
  $F736,$08 Jump to #R$EAAC if #R$B560 reports that #ITEM$4E is present.
  $F73E,$03 #REGa=*#R$AECD.
N $F741 Is the player in room #N$23: "#ROOM$23"?
  $F741,$05 Jump to #R$EAAC if *#R$AECD is room #N$23: "#ROOM$23".
N $F746 Is #ITEM$56 in the current room?
  $F746,$07 Jump to #R$EAB2 if #R$B560 reports that #ITEM$56 is not
. present.
N $F74D Print "#MESSAGE$D12B".
  $F74D,$03 #REGhl=#R$D12B.
  $F750,$03 Jump to #R$EA9E.
@ $F753 label=Action_Help_Next2
  $F753,$03 Jump to #R$EAB2.

c $F756 Action: Inventory
@ $F756 label=Action_Inventory
E $F756 View the equivalent code in;
. #LIST
. { #SHOCK$A6CF }
. { #FOREST$EDE8 }
. { #JEWELS$F12E }
. { #ANDROMEDA$8EC4 }
. { #WARLORD$F824 }
. LIST#
D $F756 Carry out the "Inventory" command.
  $F756,$03 Call #R$B665.
N $F759 The "INVENTORY" command can only be called on its own.
  $F759,$01 Return if the direct object is malformed.
  $F75A,$07 Jump to #R$EAB8 if *#R$AE9A is zero (the player isn't holding any
. items).
N $F761 Clear the screen and display the players inventory.
  $F761,$03 Call #R$ABF1.
  $F764,$03 Call #R$AC0D.
N $F767 Print "#MESSAGE$B131".
  $F767,$06 Print "#MESSAGE$B131" and start a new line.
  $F76D,$05 Call #R$B400 with a room ID of #N$01 which is the players
. inventory.
  $F772,$01 Return.

c $F773 Action: Look
@ $F773 label=Action_Look
E $F773 View the equivalent code in;
. #LIST
. { #FOREST$EE05 }
. { #JEWELS$F14B }
. { #ANDROMEDA$8EDA }
. { #WARLORD$F841 }
. LIST#
D $F773 Carry out the "Look" command.
  $F773,$03 Call #R$B665.
N $F776 The "LOOK" command can only be called on its own.
  $F776,$01 Return if the direct object is malformed.
  $F777,$05 Call #R$B41F with #REGe set to #N$01 (which will force any room
. images to be re-displayed).
  $F77C,$01 Return.

c $F77D Action: Score
@ $F77D label=Action_Score
E $F77D View the equivalent code in;
. #LIST
. { #WARLORD$F84B }
. LIST#
D $F77D Carry out the "Score" command.
  $F77D,$03 Call #R$B665.
N $F780 The "SCORE" command can only be called on its own.
  $F780,$01 Return if the direct object is malformed.
  $F781,$03 Call #R$B79E.
  $F784,$01 Return.

c $F785 Action: Examine
@ $F785 label=Action_Examine
E $F785 View the equivalent code in;
. #LIST
. { #FOREST$EE3D }
. { #JEWELS$F19D }
. { #ANDROMEDA$8F13 }
. { #WARLORD$F853 }
. LIST#
D $F785 Carry out the "Examine" command.
  $F785,$03 Call #R$B670.
  $F788,$01 Return if the direct object is malformed.
  $F789,$0C Call #R$B7D3 with #R$F798 / #R$F7A2 for
. #N($0005,$04,$04) entries.
  $F795,$03 Jump to #R$EABE.

w $F798 Table: Examine Phrases
@ $F798 label=Table_ExaminePhrases
D $F798 Phrase pointers and handler pointers for Examine.
W $F798,$02
L $F798,$02,$0A

c $F7AC Action: Load
@ $F7AC label=Action_Load
E $F7AC View the equivalent code in;
. #LIST
. { #FOREST$EE81 }
. { #JEWELS$F236 }
. { #ANDROMEDA$8FA1 }
. { #WARLORD$F892 }
. LIST#
D $F7AC Carry out the "Load" command.
  $F7AC,$03 Call #R$B665.
N $F7AF The "LOAD" command can only be called on its own.
  $F7AF,$01 Return if the direct object is malformed.
  $F7B0,$03 Call #R$ACA8.
  $F7B3,$01 Return if the load failed.
  $F7B4,$03 Call #R$ABE1.
N $F7B7 Restart at the game entry point.
  $F7B7,$04 Restart at #R$ABD4.
  $F7BB,$01 Return.

c $F7BC Action: Save
@ $F7BC label=Action_Save
E $F7BC View the equivalent code in;
. #LIST
. { #FOREST$EE89 }
. { #JEWELS$F23E }
. { #ANDROMEDA$8FA9 }
. { #WARLORD$F8A1 }
. LIST#
D $F7BC Carry out the "Save" command.
  $F7BC,$03 Call #R$B665.
N $F7BF The "SAVE" command can only be called on its own.
  $F7BF,$01 Return if the direct object is malformed.
  $F7C0,$03 Call #R$AC6D.
  $F7C3,$01 Return.

c $F7C4 Action: Quit
@ $F7C4 label=Action_Quit
E $F7C4 View the equivalent code in;
. #LIST
. { #FOREST$EE91 }
. { #JEWELS$F246 }
. { #ANDROMEDA$8FB1 }
. { #WARLORD$F8A9 }
. LIST#
D $F7C4 Carry out the "Quit" command.
  $F7C4,$03 Call #R$B665.
N $F7C7 The "QUIT" command can only be called on its own.
  $F7C7,$01 Return if the direct object is malformed.
  $F7C8,$03 Call #R$B79E.
N $F7CB Print "#MESSAGE$B097".
  $F7CB,$03 #REGhl=#R$B097.
  $F7CE,$03 Call #R$AC35.
@ $F7D1 label=WantToSave_Loop
  $F7D1,$03 Call #R$ABE1.
  $F7D4,$04 Jump to #R$F7DF if the player pressed "N".
  $F7D8,$04 Jump to #R$F7D1 unless the player pressed "Y".
  $F7DC,$03 Call #R$AC6D.
@ $F7DF label=QuitGame
  $F7DF,$04 Return to the play-again question.
  $F7E3,$01 Return.

c $F7E4 Action: North
@ $F7E4 label=Action_North
E $F7E4 View the equivalent code in;
. #LIST
. { #FOREST$EE0F }
. { #JEWELS$F155 }
. { #ANDROMEDA$8EE4 }
. { #WARLORD$F8C9 }
. LIST#
D $F7E4 Carry out the "North" command.
  $F7E4,$02 Set #REGc to "NORTH" (#N$00).
  $F7E6,$02 Jump to #R$F7FA.

c $F7E8 Action: South
@ $F7E8 label=Action_South
E $F7E8 View the equivalent code in;
. #LIST
. { #FOREST$EE13 }
. { #JEWELS$F159 }
. { #ANDROMEDA$8EE8 }
. { #WARLORD$F8CD }
. LIST#
D $F7E8 Carry out the "South" command.
  $F7E8,$02 Set #REGc to "SOUTH" (#N$01).
  $F7EA,$02 Jump to #R$F7FA.

c $F7EC Action: East
@ $F7EC label=Action_East
E $F7EC View the equivalent code in;
. #LIST
. { #FOREST$EE17 }
. { #JEWELS$F15D }
. { #ANDROMEDA$8EEC }
. { #WARLORD$F8D1 }
. LIST#
D $F7EC Carry out the "East" command.
  $F7EC,$02 Set #REGc to "EAST" (#N$02).
  $F7EE,$02 Jump to #R$F7FA.

c $F7F0 Action: West
@ $F7F0 label=Action_West
E $F7F0 View the equivalent code in;
. #LIST
. { #FOREST$EE1B }
. { #JEWELS$F161 }
. { #ANDROMEDA$8EF0 }
. { #WARLORD$F8D5 }
. LIST#
D $F7F0 Carry out the "West" command.
  $F7F0,$02 Set #REGc to "WEST" (#N$03).
  $F7F2,$02 Jump to #R$F7FA.

c $F7F4 Action: Up
@ $F7F4 label=Action_Up
E $F7F4 View the equivalent code in;
. #LIST
. { #FOREST$EE1F }
. { #JEWELS$F165 }
. { #ANDROMEDA$8EF4 }
. { #WARLORD$F8D9 }
. LIST#
D $F7F4 Carry out the "Up" command.
  $F7F4,$02 Set #REGc to "UP" (#N$04).
  $F7F6,$02 Jump to #R$F7FA.

c $F7F8 Action: Down
@ $F7F8 label=Action_Down
E $F7F8 View the equivalent code in;
. #LIST
. { #FOREST$EE23 }
. { #JEWELS$F169 }
. { #ANDROMEDA$8EF8 }
. { #WARLORD$F8DD }
. LIST#
D $F7F8 Carry out the "Down" command.
  $F7F8,$02 Set #REGc to "DOWN" (#N$05).

c $F7FA Move Player
@ $F7FA label=MovePlayer
E $F7FA View the equivalent code in;
. #LIST
. { #SHOCK$A6E8 }
. { #FOREST$EE25 }
. { #JEWELS$F16B }
. { #WARLORD$F8DF }
. LIST#
R $F7FA C Requested direction where: #TABLE { #N$00 | NORTH } { #N$01 | SOUTH } { #N$02 | EAST } { #N$03 | WEST } { #N$04 | UP } { #N$05 | DOWN } TABLE#
  $F7FA,$03 Call #R$B665.
  $F7FD,$01 Return if the direct object is malformed.
  $F7FE,$05 Call #R$B503.
  $F803,$01 #REGhl+=#REGbc.
  $F804,$01 #REGa=*#REGhl.
  $F805,$04 Jump to #R$EADC if the exit is closed.
  $F809,$03 Call #R$E9E1.
  $F80C,$01 Return.

c $F80D Action: Take
@ $F80D label=Action_Take
E $F80D View the equivalent code in;
. #LIST
. { #FOREST$EEAE }
. { #JEWELS$F263 }
. { #ANDROMEDA$8FCD }
. { #WARLORD$F956 }
. LIST#
D $F80D Carry out the "Take" command.
  $F80D,$03 Call #R$B670.
  $F810,$01 Return if the direct object is malformed.
  $F811,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($002C,$04,$04) entries.
  $F81D,$03 Jump to #R$EAE2.

w $F820 Table: Take Phrases
@ $F820 label=Table_TakePhrases
D $F820 Phrase pointers and handler pointers for Take. Drop uses the phrase
. half.
W $F820,$02
L $F820,$02,$58

c $F8D0 Action: Drop
@ $F8D0 label=Action_Drop
E $F8D0 View the equivalent code in;
. #LIST
. { #FOREST$F03A }
. { #ANDROMEDA$9198 }
. { #WARLORD$F975 }
. LIST#
D $F8D0 Carry out the "Drop" command.
  $F8D0,$03 Call #R$B670.
  $F8D3,$01 Return if the direct object is malformed.
  $F8D4,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($002C,$04,$04) entries.
  $F8E0,$03 Jump to #R$EAE2.

w $F8E3 Table: Drop Handlers
@ $F8E3 label=Table_DropHandlers
D $F8E3 One word per Drop phrase, the handler to run when that phrase matches.
  $F8E3,$58

W $F8E3,$02
L $F8E3,$02,$2C

c $F93B Action: Throw
@ $F93B label=Action_Throw
E $F93B View the equivalent code in;
. #LIST
. { #WARLORD$FA29 }
. LIST#
D $F93B Carry out the "Throw" command.
  $F93B,$03 Call #R$B694.
  $F93E,$01 Return if the direct object is malformed.
  $F93F,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0009,$04,$04) entries.
  $F94B,$03 Jump to #R$EFE2.

w $F94E Table: Throw Phrases
@ $F94E label=Table_ThrowPhrases
D $F94E Phrase pointers and handler pointers for Throw.
W $F94E,$02
L $F94E,$02,$12

c $F972 Action: Give
@ $F972 label=Action_Give
E $F972 View the equivalent code in;
. #LIST
. { #FOREST$F216 }
. { #JEWELS$F7AB }
. { #ANDROMEDA$941B }
. { #WARLORD$F9B3 }
. LIST#
D $F972 Carry out the "Give" command.
  $F972,$03 Call #R$B670.
  $F975,$01 Return if the direct object is malformed.
  $F976,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0001,$04,$04) entry.
  $F982,$03 Jump to #R$F09E.

w $F985 Table: Give Phrases
@ $F985 label=Table_GivePhrases
D $F985 The Give phrase pointer and its handler.
  $F985,$04

W $F985,$02
L $F985,$02,$02

c $F989 Action: Kiss
@ $F989 label=Action_Kiss
E $F989 View the equivalent code in;
. #LIST
. { #FOREST$F5B6 }
. LIST#
D $F989 Carry out the "Kiss" command.
  $F989,$03 Call #R$B670.
  $F98C,$01 Return if the direct object is malformed.
  $F98D,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($000B,$04,$04) entries.
  $F999,$03 Jump to #R$EAE2.

w $F99C Table: Kiss Phrases
@ $F99C label=Table_KissPhrases
D $F99C Phrase pointers and handler pointers for Kiss.
W $F99C,$02
L $F99C,$02,$16

b $F9C8 Table: Gate Items
@ $F9C8 label=Table_GateItems
D $F9C8 Lists of gate item IDs, each terminated with #N$FF. The kiss handlers
. at #R$F151 walk these lists to see which gates are here.
B $F9C8,$03 Copper gates: #ITEM$09 and #ITEM$0C.
B $F9CB,$05 Golden gates: #ITEM$15, #ITEM$18, #ITEM$1B or #ITEM$1E.
B $F9D0,$03 Jewelled gates: #ITEM$0F and #ITEM$12.
B $F9D3,$09 Open gates: #ITEM$0A, #ITEM$0D, #ITEM$10, #ITEM$13, #ITEM$16,
. #ITEM$19, #ITEM$1C or #ITEM$1F.

c $F9DC Action: Open
@ $F9DC label=Action_Open
E $F9DC View the equivalent code in;
. #LIST
. { #FOREST$F5F1 }
. { #JEWELS$FA3C }
. { #ANDROMEDA$96E7 }
. LIST#
D $F9DC Carry out the "Open" command.
  $F9DC,$03 Call #R$B670.
  $F9DF,$01 Return if the direct object is malformed.
  $F9E0,$03 Jump to #R$EAE2.

c $F9E3 Action: Close
@ $F9E3 label=Action_Close
E $F9E3 View the equivalent code in;
. #LIST
. { #FOREST$F68C }
. { #JEWELS$FAA8 }
. { #ANDROMEDA$975A }
. LIST#
D $F9E3 Carry out the "Close" command.
  $F9E3,$03 Call #R$B670.
  $F9E6,$01 Return if the direct object is malformed.
  $F9E7,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0003,$04,$04) entries.
  $F9F3,$03 Jump to #R$EAE2.

w $F9F6 Table: Close Phrases
@ $F9F6 label=Table_ClosePhrases
D $F9F6 Phrase pointers and handler pointers for Close.
  $F9F6,$0C

W $F9F6,$02
L $F9F6,$02,$06

c $FA02 Action: Read
@ $FA02 label=Action_Read
E $FA02 View the equivalent code in;
. #LIST
. { #ANDROMEDA$9670 }
. LIST#
D $FA02 Carry out the "Read" command.
  $FA02,$03 Call #R$B670.
  $FA05,$01 Return if the direct object is malformed.
  $FA06,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0001,$04,$04) entry.
  $FA12,$03 Jump to #R$F205.

w $FA15 Table: Read Phrases
@ $FA15 label=Table_ReadPhrases
D $FA15 The Read phrase pointer and its handler.
  $FA15,$04

W $FA15,$02
L $FA15,$02,$02

c $FA19 Action: Wave
@ $FA19 label=Action_Wave
D $FA19 Carry out the "Wave" command.
  $FA19,$03 Call #R$B670.
  $FA1C,$01 Return if the direct object is malformed.
  $FA1D,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0003,$04,$04) entries.
  $FA29,$03 Jump to #R$EAE2.

w $FA2C Table: Wave Phrases
@ $FA2C label=Table_WavePhrases
D $FA2C Phrase pointers and handler pointers for Wave.
  $FA2C,$0C

W $FA2C,$02
L $FA2C,$02,$06

c $FA38 Action: Play
@ $FA38 label=Action_Play
D $FA38 Carry out the "Play" command.
  $FA38,$03 Call #R$B694.
  $FA3B,$01 Return if the direct object is malformed.
  $FA3C,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($000A,$04,$04) entries.
  $FA48,$03 Jump to #R$EAE2.

b $FA4B Table: Play Phrases
@ $FA4B label=Table_PlayPhrases
D $FA4B Phrase pointers and handler pointers for Play.
  $FA4B,$27

c $FA72 Action: Kill
@ $FA72 label=Action_Kill
E $FA72 View the equivalent code in;
. #LIST
. { #FOREST$F2A7 }
. { #JEWELS$F851 }
. { #ANDROMEDA$952B }
. { #WARLORD$FC4B }
. LIST#
D $FA72 Carry out the "Kill" command.
  $FA72,$01 Stash #REGaf on the stack.
  $FA73,$03 Call #R$B670.
  $FA76,$01 Return if the direct object is malformed.
  $FA77,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0001,$04,$04) entry.
  $FA83,$03 Jump to #R$EFE2.

w $FA86 Table: Kill Phrases
@ $FA86 label=Table_KillPhrases
D $FA86 The Kill phrase pointer and its handler.
  $FA86,$04

W $FA86,$02
L $FA86,$02,$02

c $FA8A Action: Oil
@ $FA8A label=Action_Oil
D $FA8A Carry out the "Oil" command.
  $FA8A,$03 Call #R$B670.
  $FA8D,$01 Return if the direct object is malformed.
  $FA8E,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0002,$04,$04) entries.
  $FA9A,$03 Jump to #R$F205.

w $FA9D Table: Oil Phrases
@ $FA9D label=Table_OilPhrases
D $FA9D Phrase pointers and handler pointers for Oil.
  $FA9D,$08

W $FA9D,$02
L $FA9D,$02,$04

c $FAA5 Action: Drink
@ $FAA5 label=Action_Drink
E $FAA5 View the equivalent code in;
. #LIST
. { #FOREST$F292 }
. { #JEWELS$F9E4 }
. { #ANDROMEDA$98AB }
. { #WARLORD$FA91 }
. LIST#
D $FAA5 Carry out the "Drink" command.
  $FAA5,$03 Call #R$B670.
  $FAA8,$01 Return if the direct object is malformed.
  $FAA9,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0004,$04,$04) entries.
  $FAB5,$03 Jump to #R$F205.

w $FAB8 Table: Drink Phrases
@ $FAB8 label=Table_DrinkPhrases
D $FAB8 Phrase pointers and handler pointers for Drink.
W $FAB8,$02
L $FAB8,$02,$08

c $FAC8 Action: Dig
@ $FAC8 label=Action_Dig
D $FAC8 Carry out the "Dig" command.
  $FAC8,$03 Call #R$B665.
  $FACB,$01 Return if the direct object is malformed.
N $FACC Does the player have the shovel (#ITEM$60)?
  $FACC,$08 Jump to #R$F537 if #R$B5CF reports that #ITEM$60 is not held.
  $FAD4,$03 #REGa=*#R$AECD.
N $FAD7 Is the player in room #N$3C: "#ROOM$3C"?
  $FAD7,$05 Jump to #R$F53D if *#R$AECD is not room #N$3C: "#ROOM$3C".
N $FADC Has this spot on the beach already been dug?
  $FADC,$08 Jump to #R$F53D if bit 0 of *#R$AE77 is set.
  $FAE4,$02 Set bit 0 of *#R$AE77.
  $FAE6,$05 Call #R$B5DC with item #N$72: #ITEM$72.
  $FAEB,$05 Call #R$B78F with #N$03.
  $FAF0,$03 Call #R$EAE8.
N $FAF3 Print "#MESSAGE$DE88".
  $FAF3,$03 #REGhl=#R$DE88.
  $FAF6,$03 Jump to #R$EA9E.

c $FAF9 Action: Empty
@ $FAF9 label=Action_Empty
D $FAF9 Carry out the "Empty" command.
  $FAF9,$03 Call #R$B670.
  $FAFC,$01 Return if the direct object is malformed.
  $FAFD,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0001,$04,$04) entry.
N $FB09 Print "#MESSAGE$DEA0".
  $FB09,$03 #REGhl=#R$DEA0.
  $FB0C,$03 Jump to #R$EA9E.

w $FB0F Table: Empty Phrases
@ $FB0F label=Table_EmptyPhrases
D $FB0F The Empty phrase pointer and its handler.
  $FB0F,$04

W $FB0F,$02
L $FB0F,$02,$02

c $FB13 Action: Light
@ $FB13 label=Action_Light
E $FB13 View the equivalent code in;
. #LIST
. { #JEWELS$FC24 }
. LIST#
D $FB13 Carry out the "Light" command.
N $FB13 Match the phrase tokens.
  $FB13,$03 #REGhl=#R$E7B5.
  $FB16,$03 Call #R$B575.
  $FB19,$03 Jump to #R$EB8F if the tokens do not match.
  $FB1C,$04 #REGa=#N$01; jump to #R$FB45.

c $FB20 Action: Rub
@ $FB20 label=Action_Rub
D $FB20 Carry out the "Rub" command.
N $FB20 Match the phrase tokens.
  $FB20,$03 #REGhl=#R$E7CE.
  $FB23,$03 Call #R$B575.
  $FB26,$03 Jump to #R$EB8F if the tokens do not match.
  $FB29,$04 #REGa=#N$02; jump to #R$FB45.

c $FB2D Action: Say
@ $FB2D label=Action_Say
D $FB2D Carry out the "Say" command.
N $FB2D Match the phrase tokens.
  $FB2D,$03 #REGhl=#R$E7DA.
  $FB30,$03 Call #R$B575.
  $FB33,$03 Jump to #R$EB8F if the tokens do not match.
  $FB36,$04 #REGa=#N$04; jump to #R$FB45.

c $FB3A Action: Attack
@ $FB3A label=Action_Attack
D $FB3A Carry out the "Attack" command.
N $FB3A Match the phrase tokens.
  $FB3A,$03 #REGhl=#R$E7E1.
  $FB3D,$03 Call #R$B575.
  $FB40,$03 Jump to #R$EB8F if the tokens do not match.
  $FB43,$02 #REGa=#N$08.
@ $FB45 label=Action_FlagTurnEvent
  $FB45,$03 Write #REGa to *#R$AE78.
  $FB48,$03 Call #R$F54C.
  $FB4B,$04 Jump to the verb dispatcher.
  $FB4F,$01 Return.

c $FB50 Action: Fill
@ $FB50 label=Action_Fill
D $FB50 Carry out the "Fill" command.
  $FB50,$03 Call #R$B670.
  $FB53,$01 Return if the direct object is malformed.
  $FB54,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0001,$04,$04) entry.
  $FB60,$03 Jump to #R$EAE2.

w $FB63 Table: Fill Phrases
@ $FB63 label=Table_FillPhrases
D $FB63 The Fill phrase pointer and its handler.
  $FB63,$04

W $FB63,$02
L $FB63,$02,$02

c $FB67 Action: Pour
@ $FB67 label=Action_Pour
D $FB67 Carry out the "Pour" command.
  $FB67,$03 Call #R$B665.
  $FB6A,$01 Return if the direct object is malformed.
  $FB6B,$03 #REGa=*#R$AECD.
N $FB6E Is the current room one Pour carries into the cottage?
  $FB6E,$08 Search #R$FB8F for *#R$AECD.
  $FB76,$02 Jump to #R$FB7F if the room is not in that list.
  $FB78,$03 Write #REGa to *#R$AE79.
  $FB7B,$04 #REGa=#N$02; jump to #R$FB8B.
@ $FB7F label=Action_Pour_Return
N $FB7F Returning from inside the cottage?
  $FB7F,$05 Jump to #R$ED2B if *#R$AECD is not room #N$02:
. "#ROOM$02".
  $FB84,$03 #REGa=*#R$AE79.
  $FB87,$04 Jump to #R$ED2B if *#R$AE79 is zero.
@ $FB8B label=Action_Pour_ChangeRoom
  $FB8B,$03 Call #R$E9E1.
  $FB8E,$01 Return.

b $FB8F Table: Pour Tokens
@ $FB8F label=Table_PourTokens
D $FB8F The rooms in which Pour carries the player to the ruined cottage.
B $FB8F,$01 Room #N(#PEEK(#PC)).
L $FB8F,$01,$03

c $FB92 Action: Use
@ $FB92 label=Action_Use
E $FB92 View the equivalent code in;
. #LIST
. { #ANDROMEDA$9A41 }
. LIST#
D $FB92 Carry out the "Use" command.
  $FB92,$03 Call #R$B670.
  $FB95,$01 Return if the direct object is malformed.
  $FB96,$0C Call #R$B7D3 to dispatch the matching phrase, for
. #N($0001,$04,$04) entry.
  $FBA2,$03 Jump to #R$F205.

w $FBA5 Table: Use Phrases
@ $FBA5 label=Table_UsePhrases
D $FBA5 The Use phrase pointer and its handler.
  $FBA5,$04

W $FBA5,$02
L $FBA5,$02,$02

c $FBA9 Game Start
@ $FBA9 label=GameStart
E $FBA9 View the equivalent code in;
. #LIST
. { #SHOCK$ADA1 }
. { #FOREST$F964 }
. { #JEWELS$FD82 }
. { #ANDROMEDA$F8AF }
. { #WARLORD$FCCE }
. LIST#
D $FBA9 Copy the default state into working memory, open the starting exits, and
. enter the game loop.
  $FBA9,$0B Copy #N$0186 bytes from #R$FBDC to #R$AD76.
N $FBB4 Remove a bunch of room exits (as actions in the game will open them
. back up).
  $FBB4,$04 Point #REGix at #R$E972.
  $FBB8,$04 Count the configurable exits to close.
  $FBBC,$01 Set #REGa to #N$00 which "removes" the exit.
@ $FBBD label=GameStart_Loop
  $FBBD,$0D Close this configurable exit.
  $FBCA,$05 Open the east exit from the Hall of Infinity into the Lair of the
. Hydra.
  $FBCF,$05 Open the south exit from the Hall of the Phoenix into the Hall of
. Black Magic.
  $FBD4,$05 Begin in the Field.
  $FBD9,$03 Continue at #R$E9A1.

g $FBDC Table: Item Locations
@ $FBDC label=DefaultGameState
@ $FBDC label=Default_Table_ItemLocations
D $FBDC Starting places for the items. #R$FBA9 copies this table to #R$AD76
. at the start of every game.
B $FBDC,$01 Item #N(#PC-$FBDC) #ITEM(#PC-$FBDC): room #N(#PEEK(#PC)).
L $FBDC,$01,$87

u $FC63
S $FC63,$79

g $FCDC Flags: Room Change
@ $FCDC label=Default_Flags_RoomChange
D $FCDC Copied to #R$AE76.
B $FCDC,$01

g $FCDD Flag: Beach Dug
@ $FCDD label=Default_Flag_BeachDug
D $FCDD Copied to #R$AE77. Bit 0 is clear until the beach in room #N$3C is dug.
B $FCDD,$01

g $FCDE Flag: Turn Scratch
@ $FCDE label=Default_Flag_TurnScratch
D $FCDE Copied to #R$AE78. Cleared at the start of every pass round the game
. loop.
B $FCDE,$01

g $FCDF Room: Pour Return
@ $FCDF label=Default_Room_PourReturn
D $FCDF Copied to #R$AE79. Holds the room ID to restore after pouring.
B $FCDF,$01

u $FCE0
S $FCE0,$04

g $FCE4 Table: Already Seen Room Images
@ $FCE4 label=Default_Table_RoomImagesAlreadySeen
D $FCE4 Copied to #R$AE7E. No room picture has been shown yet.
B $FCE4,b,$01
B $FCE5,b,$01

u $FCE6
S $FCE6,$08

g $FCEE Flags: Turn-Based Event States
@ $FCEE label=Default_Flag_TurnBasedEventState
D $FCEE Copied to #R$AE88. No turn-based event has started.
B $FCEE,$01

g $FCEF Turn-Based Event Counters
@ $FCEF label=Default_Counter_Unused_0
@ $FCF0 label=Default_Counter_Unused_1
@ $FCF1 label=Default_Counter_Unused_2
@ $FCF2 label=Default_Counter_Unused_3
@ $FCF3 label=Default_Counter_Unused_4
@ $FCF4 label=Default_Counter_Unused_5
@ $FCF5 label=Default_Counter_Unused_6
@ $FCF6 label=Default_Counter_Unused_7
D $FCEF Copied to #R$AE89. One countdown per bit of *#R$AE88.
B $FCEF,$08,$01

g $FCF7 Flag: Following Heroes
@ $FCF7 label=Default_Flag_FollowingHeroes
D $FCF7 Copied to #R$AE91. No following bits are set at the start of a game.
B $FCF7,$01

g $FCF8 Table: Following Items
@ $FCF8 label=Default_Table_FollowingItems
D $FCF8 Copied to #R$AE92. Default item IDs for bits 0-3: #ITEM$00, #ITEM$01,
. #ITEM$02 and #ITEM$03.
B $FCF8,$01 Bit 0: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $FCF9,$01 Bit 1: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $FCFA,$01 Bit 2: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $FCFB,$01 Bit 3: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $FCFC,$04 Bits 4-7: not used by this game.

g $FD00 Number Of Items In The Players Inventory
@ $FD00 label=Default_Count_InventoryItems
D $FD00 Copied to #R$AE9A. The player starts holding #N(#PEEK(#PC)) item(s).
B $FD00,$01

g $FD01 Load/ Save Buffer
@ $FD01 label=Default_LoadSaveBuffer
D $FD01 Copied to #R$AE9B. Initial bytes for the configurable-exit save area.
B $FD01,$32

g $FD33 Current Room ID
@ $FD33 label=Default_CurrentRoom
D $FD33 Copied to #R$AECD. The player starts in room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
B $FD33,$01

g $FD34 Score
@ $FD34 label=Default_Score
D $FD34 Copied to #R$AECE. BCD score starts at #N(#PEEK(#PC)).
W $FD34,$02

g $FD36 Pointer: Vocabulary Table
@ $FD36 label=Default_Pointer_Vocabulary
D $FD36 Copied to #R$AED0. Points at the vocabulary table.
W $FD36,$02

g $FD38 Pointer: Turn-Based Events Jump Table
@ $FD38 label=Default_Pointer_TurnBasedEvents_Jump
D $FD38 Copied to #R$AED2. Initial image stores #N$00.
W $FD38,$02

g $FD3A Pointer: Room Map Table
@ $FD3A label=Default_Pointer_RoomMap
D $FD3A Copied to #R$AED4.
W $FD3A,$02

g $FD3C Pointer: Item Description Table
@ $FD3C label=Default_Pointer_ItemDescriptions
D $FD3C Copied to #R$AED6.
W $FD3C,$02

g $FD3E Pointer: Rooms With Images Table
@ $FD3E label=Default_Pointer_RoomsWithImages
D $FD3E Copied to #R$AED8.
W $FD3E,$02

g $FD40 Pointer: Room Image Jump Table
@ $FD40 label=Default_Pointer_RoomImage
D $FD40 Copied to #R$AEDA.
W $FD40,$02

g $FD42 Pointer: Room Description Table
@ $FD42 label=Default_Pointer_RoomDescriptions
D $FD42 Copied to #R$AEDC.
W $FD42,$02

g $FD44 Pointer: Item Grouping Table
@ $FD44 label=Default_Pointer_ItemGroupingTable
D $FD44 Copied to #R$AEDE.
W $FD44,$02

g $FD46 Pointer: Object Noun Phrases
@ $FD46 label=Default_Pointer_ObjectNounPhrases
D $FD46 Copied to #R$AEE0.
W $FD46,$02

g $FD48 Pointer: Object List Table
@ $FD48 label=Default_Pointer_ObjectList
D $FD48 Copied to #R$AEE2.
W $FD48,$02

g $FD4A Pointer: Verbs Jump Table
@ $FD4A label=Default_Pointer_JumpTable_Verbs
D $FD4A Copied to #R$AEE4.
W $FD4A,$02

g $FD4C Pointer: Configurable Exits Table
@ $FD4C label=Default_Pointer_ConfigurableExits
D $FD4C Copied to #R$AEE6.
W $FD4C,$02

g $FD4E Pointer: Scenic Events Jump Table
@ $FD4E label=Default_Pointer_JumpTable_ScenicEvents
D $FD4E Copied to #R$AEE8. Initial image stores #N$00.
W $FD4E,$02

g $FD50 Pointer: Verb Word Tokens Table
@ $FD50 label=Default_Pointer_VerbWordTokens
D $FD50 Copied to #R$AEEA.
W $FD50,$02

g $FD52 Pointer: Spare
@ $FD52 label=Default_Pointer_Spare
D $FD52 Copied to #R$AEEC. Unused; initial image stores #N$00.
W $FD52,$02

g $FD54 Pointer: Spare 2
@ $FD54 label=Default_Pointer_Spare2
D $FD54 Copied to #R$AEEE. Unused; initial image stores #N$00.
W $FD54,$02

g $FD56 Number Of Items
@ $FD56 label=Default_Count_Items
D $FD56 Copied to #R$AEF0.
W $FD56,$02

g $FD58 Number Of Objects
@ $FD58 label=Default_Count_Objects
D $FD58 Copied to #R$AEF2.
W $FD58,$02

g $FD5A Number Of Verb Tokens
@ $FD5A label=Default_Count_VerbTokens
D $FD5A Copied to #R$AEF4.
W $FD5A,$02

g $FD5C Number Of Rooms With Images
@ $FD5C label=Default_Count_RoomsWithImages
D $FD5C Copied to #R$AEF6.
W $FD5C,$02

g $FD5E Number Of Scenic Events
@ $FD5E label=Default_Count_ScenicEvents
D $FD5E Copied to #R$AEF8. Initial image stores #N$00.
W $FD5E,$02

g $FD60 Number Of "Configurable Exits"
@ $FD60 label=Default_Count_ConfigurableExits
D $FD60 Copied to #R$AEFA.
W $FD60,$02

u $FD62
S $FD62,$01

w $FD63 Jump Table: Verbs
@ $FD63 label=JumpTable_Verbs
E $FD63 View the equivalent code in;
. #LIST
. { #FOREST$FB0D }
. { #JEWELS$FF3A }
. { #ANDROMEDA$FA20 }
. { #WARLORD$FE89 }
. LIST#
D $FD63 One word per verb token, in token order.
W $FD63,$02
L $FD63,$02,$24

c $FDAB Handler: Room Images
@ $FDAB label=DisplayImage_Field
E $FDAB View the equivalent code in;
. #LIST
. { #FOREST$FACF }
. { #JEWELS$FEFA }
. { #ANDROMEDA$F813 }
. { #WARLORD$FF12 }
. LIST#
D $FDAB Show the picture for the Field.
N $FDAB Displays the image for the field.
N $FDAB #PUSHS #UDGTABLE #POKES$AECD,$03
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-field) }
. UDGTABLE# #POPS
  $FDAB,$04 #REGix=#R$61A8.
  $FDAF,$02 Jump to #R$FDDF.
@ $FDB1 label=DisplayImage_Monastery
N $FDB1 Displays the image for the monastery.
N $FDB1 #PUSHS #UDGTABLE #POKES$AECD,$0E
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-monastery) }
. UDGTABLE# #POPS
  $FDB1,$04 #REGix=#R$6B37.
  $FDB5,$02 Jump to #R$FDDF.
@ $FDB7 label=DisplayImage_KingsChamber
N $FDB7 Displays the image for the king's chamber.
N $FDB7 #PUSHS #UDGTABLE #POKES$AECD,$1C
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-kings-chamber) }
. UDGTABLE# #POPS
  $FDB7,$04 #REGix=#R$7313.
  $FDBB,$02 Jump to #R$FDDF.
@ $FDBD label=DisplayImage_OilRoom
N $FDBD Displays the image for the oil room and the acid room.
N $FDBD #PUSHS #UDGTABLE #POKES$AECD,$27
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-oil-room) }
. UDGTABLE# #POPS
  $FDBD,$04 #REGix=#R$79F4.
  $FDC1,$02 Jump to #R$FDDF.
@ $FDC3 label=DisplayImage_SeaCavern
N $FDC3 Displays the image for the sea cavern.
N $FDC3 #PUSHS #UDGTABLE #POKES$AECD,$3D
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-sea-cavern) }
. UDGTABLE# #POPS
  $FDC3,$04 #REGix=#R$8244.
  $FDC7,$02 Jump to #R$FDDF.
@ $FDC9 label=DisplayImage_LongBarrow
N $FDC9 Displays the image for the long barrow.
N $FDC9 #PUSHS #UDGTABLE #POKES$AECD,$12
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-long-barrow) }
. UDGTABLE# #POPS
  $FDC9,$04 #REGix=#R$8941.
  $FDCD,$02 Jump to #R$FDDF.
@ $FDCF label=DisplayImage_HallOfTheBlackKnight
N $FDCF Displays the image for the hall of the black knight.
N $FDCF #PUSHS #UDGTABLE #POKES$AECD,$2B
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-hall-of-the-black-knight) }
. UDGTABLE# #POPS
  $FDCF,$04 #REGix=#R$9151.
  $FDD3,$02 Jump to #R$FDDF.
@ $FDD5 label=DisplayImage_Treasury
N $FDD5 Displays the image for the treasury.
N $FDD5 #PUSHS #UDGTABLE #POKES$AECD,$29
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-treasury) }
. UDGTABLE# #POPS
  $FDD5,$04 #REGix=#R$9B96.
  $FDD9,$02 Jump to #R$FDDF.
@ $FDDB label=DisplayImage_EdgeOfTheSea
N $FDDB Displays the image for the edge of the sea.
N $FDDB #PUSHS #UDGTABLE #POKES$AECD,$13
. { #SIM(start=#PC,stop=$FDE2)#SCR$01(game-the-edge-of-the-sea) }
. UDGTABLE# #POPS
  $FDDB,$04 #REGix=#R$A351.
N $FDDF All the image routines use this same routine.
@ $FDDF label=Handler_Images
  $FDDF,$03 Call #R$AD60.
  $FDE2,$05 Call #R$B516 and use line number #N$08 to start printing.
  $FDE7,$03 Call #R$ABE1.
  $FDEA,$01 Return.

g $FDEB Jump Table: Room Images
@ $FDEB label=JumpTable_RoomImages
E $FDEB View the equivalent code in;
. #LIST
. { #FOREST$FB75 }
. { #JEWELS$FFA8 }
. { #ANDROMEDA$FA68 }
. { #WARLORD$FEFC }
. LIST#
D $FDEB See #R$FDFF.
W $FDEB,$02 Location Slot: #N((#PC-$FDEB)/$02).
L $FDEB,$02,$0A

g $FDFF Table: Rooms With Images
@ $FDFF label=Table_RoomsWithImages
E $FDFF View the equivalent code in;
. #LIST
. { #SHOCK$BB93 }
. { #FOREST$E806 }
. { #JEWELS$E95D }
. { #ANDROMEDA$8CFC }
. { #WARLORD$FEF1 }
. LIST#
D $FDFF The #N$0A rooms that have a picture (the count is at #R$AEF6).
. #R$B41F looks the current room up here (through #R$AED8); where it is found
. picks the drawing routine in #R$FDEB and the "already seen" bit in #R$AE7E.
. A picture is shown the first time the player enters the room, and again
. whenever they type LOOK. An #N$00 end marker follows the list.
B $FDFF,$01 Image #N$00: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDAB; seen flag: bit 0 of #R$AE7E.
B $FE00,$01 Image #N$01: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDB1; seen flag: bit 1 of #R$AE7E.
B $FE01,$01 Image #N$02: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDB7; seen flag: bit 2 of #R$AE7E.
B $FE02,$01 Image #N$03: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDBD; seen flag: bit 3 of #R$AE7E.
B $FE03,$01 Image #N$04: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDBD; seen flag: bit 4 of #R$AE7E.
B $FE04,$01 Image #N$05: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDC3; seen flag: bit 5 of #R$AE7E.
B $FE05,$01 Image #N$06: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDC9; seen flag: bit 6 of #R$AE7E.
B $FE06,$01 Image #N$07: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDCF; seen flag: bit 7 of #R$AE7E.
B $FE07,$01 Image #N$08: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDD5; seen flag: bit 0 of #R$AE7E(#N$AE7F).
B $FE08,$01 Image #N$09: room #N(#PEEK(#PC)), #ROOM(#PEEK(#PC)), drawn by
. #R$FDDB; seen flag: bit 1 of #R$AE7E(#N$AE7F).
B $FE09,$01 Terminator.

u $FE0A
S $FE0A,$01F6
