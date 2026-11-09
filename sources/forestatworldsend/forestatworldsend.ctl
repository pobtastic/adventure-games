; Copyright Interceptor Software UK 1984, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction
; e.g. Print_HighScore_Loop.

> $4000 @start
> $4000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
@ $4000 org=$4000
> $4000 @rom
> $4000 @expand=#DEF(#POKE()(anchor,text) #LINK(Pokes#$anchor)($text))
> $4000 @expand=#DEF(#FACT()(anchor,text) #LINK(Facts#$anchor)($text))
> $4000 @expand=#DEF(#MESSAGE(addr) #STR$addr,$08($b==$FF))
> $4000 @expand=#DEF(#ROOM(id) #IF($id>$01)(#HTML(&#10;)#SIM(start=$C0C3,stop=$C0D1,ix=$D44C,de=$id)#HTML(&#10;)#R({sim[HL]})(#MAP({sim[HL]})(#HTML(&#10;)UNKNOWN,51924:Inside the Farmhouse,51946:At a large Farmhouse,51995:On a long Farm Track,52061:The Great Valley,52107:The Vale of Shadows,52211:In the Forest,52244:The Leafy Glade,52308:The Woodman's Clearing,52332:At the Woodman's Hut,52354:Inside the Woodman's Hut,52419:A Burned out Farm,52438:An overgrown Fruit Grove,52510:On a Forest Path,52528:The Western Edge of a Chasm,52557:The Eastern Edge of a Chasm,52586:The Brink of a Precipice,52635:The Old Well,52677:The Wooded Vale,52694:The Western Bank,52729:The Eastern Bank,52764:The Swamp,52813:In the Boat,52826:The Pit of Oozing Slime,52851:On an Open Plain,52893:On a High Plateau,52939:On Marshy Ground,52957:The Enchanted Wood,53001:On a Rocky Outcrop,53021:The Forest of Sighs,53061:In a tangle of,53099:At the Bottom of the Precipice,53804:Marl's Gateway,53131:In Wildmoor Woods,53150:In the Forest of Night,53217:At the Witch's Hovel,53260:Inside the Witch's Hovel,53286:A Rock Wall,53299:The Plain of Marl,53344:At the Blacksmith's Forge,53371:Inside the Forge,53389:At the Base of a Volcano,53444:On a Narrow Ledge on the,53490:The Cavern of Silence,53513:The Top of the Volcano,53567:Inside the Volcano,53645:In a Rock Passage,53691:In the Great Hall of Zarn,53718:In a High Tower,53758:The Dungeon)),#HTML(&#10;)N/A))
> $4000 @expand=#DEF(#ITEM(id) #MAP($id)(#HTML(&#10;)N/A,0:"Some food",1:"The well is completely dry",2:"A silver coin",3:"A bow",4:"Some arrows",5:"It looks too steep to climb",6:"A pair of oars",7:"A ring",8:"A rope",9:"A horn",10:"A sword",11:"A chest",12:"A closed chest",13:"An open chest containing the Crystals of Vulcan",14:"An empty chest",15:"The Crystals of Vulcan",16:"A key",17:"It seems too wide to jump across",18:"It seems too wide to jump across",19:"The body of a dead elf",20:"The body of a dead elf",21:"The body of a dead elf",22:"A dragon. It is watching you",23:"A dead dragon",24:"A dead flying lizard",25:"A dead flying lizard",26:"A dead flying lizard",27:"Some dead wolves",28:"The body of a wood nymph",29:"A rowing boat",30:"A monster from the slime",31:"SPARE",32:"The current is very strong",33:"The current is very strong",34:"A projection of rock hangs over the lip of the volcano",35:"A projection of rock with a rope tied to it. The rope dangles down into the volc",36:"The once beautiful buildings#RAW(,) are now in ruins",37:"The blacksmith. He says:- 'I have been instructed to make a mighty sword for you",38:"The blacksmith",39:"The body of the blacksmith",40:"The flames from the furnace inside",41:"Some demons are attacking you. They scream and jab at you with vicious tridents",42:"The Wizard#RAW(,)Zarn. He prepares to cast a spell over you",43:"The body of the Wizard",44:"The Princess#RAW(,)Mara",45:"The body of the Princess",46:"The Witch",47:"The Old Man. He lays down a bow and some arrows. He says:- 'These are tipped wit",48:"SPARE",49:"SPARE",50:"SPARE",51:"A glowing rock",52:"A dead warrior",53:"An open door",54:"A closed door",55:"An open door",56:"A closed door",57:"An open door",58:"A closed door",59:"An open door",60:"A closed door",61:"An open door",62:"A closed door",63:"An open door",64:"A closed door",65:"A giant spider. It advances toward you",66:"The body of a giant spider",67:"A ring#RAW(,)which you are wearing",68:"A log",69:"A log#RAW(,)bridging the chasm",70:"A log#RAW(,)bridging the chasm",71:"SPARE",72:"You are seriously injured",73:"You are sweating profusely. Gripping the rope is difficult"))
> $4000 @expand=#IF({asm})(#DEF(#ANDROMEDA(addr)(link=Message From Andromeda)$link))
> $4000 @expand=#IF({asm})(#DEF(#HEROES(addr)(link=Heroes Of Karn)$link))
> $4000 @expand=#IF({asm})(#DEF(#JEWELS(addr)(link=The Jewels Of Babylon)$link))
> $4000 @expand=#IF({asm})(#DEF(#SHOCK(addr)(link=After Shock)$link))
> $4000 @expand=#IF({asm})(#DEF(#WARLORD(addr)(link=Warlord)$link))
> $4000 @set-handle-unsupported-macros=1

b $4000 Loading Screen
@ $4000 label=Loading
D $4000 #UDGTABLE
. { =h Forest At World's End Loading Screen. }
. { #SCR$02(loading) }
. UDGTABLE#
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B00 Tape Loader
@ $5B00 label=TapeLoader
E $5B00 View the equivalent code in;
. #LIST
. { #HEROES$5B00 }
. { #JEWELS$5B00 }
. { #ANDROMEDA$5CD0 }
. { #WARLORD$5B00 }
. LIST#
D $5B00 Load the picture, the room graphics and the game from tape, then start.
N $5B00 Load the picture.
  $5B00,$07 Load #N$1B00 bytes of the picture to #N$4000.
  $5B07,$03 Call #R$5B1B to load the picture.
N $5B0A Load the room graphics.
  $5B0A,$07 Load #N$581D bytes of the room graphics to #R$61A8.
  $5B11,$03 Call #R$5B1B to load the room graphics.
N $5B14 Load the game.
  $5B14,$07 Load #N$41C8 bytes of the game to #R$B9C5.
N $5B1B The picture and room graphics loads call here; the game load
. falls into it, so its return ends the loader.
@ $5B1B label=TapeLoading
  $5B1B,$02 This is a data block (#N$45).
  $5B1D,$01 Set the carry flag to indicate "loading".
  $5B1E,$03 Call #SKOOLKID$0802(LD_BLOCK).
  $5B21,$01 Return.

u $5B22
S $5B22,$DE

i $5C00
B $5C00,$5A8

b $61A8 Graphics: The Great Valley
@ $61A8 label=Image_TheGreatValley
D $61A8 #PUSHS
. #UDGTABLE
. { =h The Great Valley }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$00)#SCR$02{$00,$00,$200,$100}(great-valley) }
. UDGTABLE#
. #POPS
  $61A8,$0843

b $69EB Graphics: The Woodman's Hut
@ $69EB label=Image_TheWoodmansHut
D $69EB #PUSHS
. #UDGTABLE
. { =h The Woodman's Hut }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$01)#SCR$02{$00,$00,$200,$100}(woodmans-hut) }
. UDGTABLE#
. #POPS
  $69EB,$0A97

b $7482 Graphics: The Old Well
@ $7482 label=Image_TheOldWell
D $7482 #PUSHS
. #UDGTABLE
. { =h The Old Well }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$02)#SCR$02{$00,$00,$200,$100}(old-well) }
. UDGTABLE#
. #POPS
  $7482,$06EF

b $7B71 Graphics: The Volcano
@ $7B71 label=Image_TheVolcano
D $7B71 #PUSHS
. #UDGTABLE
. { =h The Volcano }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$03)#SCR$02{$00,$00,$200,$100}(volcano) }
. UDGTABLE#
. #POPS
  $7B71,$07ED

b $835E Graphics: The Witch's Hovel
@ $835E label=Image_TheWitchsHovel
D $835E #PUSHS
. #UDGTABLE
. { =h The Witch's Hovel }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$04)#SCR$02{$00,$00,$200,$100}(witchs-hovel) }
. UDGTABLE#
. #POPS
  $835E,$087C

b $8BDA Graphics: The Burned Out Farm
@ $8BDA label=Image_TheBurnedOutFarm
D $8BDA #PUSHS
. #UDGTABLE
. { =h The Burned Out Farm }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$05)#SCR$02{$00,$00,$200,$100}(burned-out-farm) }
. UDGTABLE#
. #POPS
  $8BDA,$0801

b $93DB Graphics: The Enchanted Wood
@ $93DB label=Image_TheEnchantedWood
D $93DB #PUSHS
. #UDGTABLE
. { =h The Enchanted Wood }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$06)#SCR$02{$00,$00,$200,$100}(enchanted-wood) }
. UDGTABLE#
. #POPS
  $93DB,$0AA4

b $9E7F Graphics: The Dungeon
@ $9E7F label=Image_TheDungeon
D $9E7F #PUSHS
. #UDGTABLE
. { =h The Dungeon }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$09)#SCR$02{$00,$00,$200,$100}(dungeon) }
. UDGTABLE#
. #POPS
  $9E7F,$084A

b $A6C9 Graphics: Marl's Gateway
@ $A6C9 label=Image_MarlsGateway
D $A6C9 #PUSHS
. #UDGTABLE
. { =h Marl's Gateway }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$0A)#SCR$02{$00,$00,$200,$100}(marls-gateway) }
. UDGTABLE#
. #POPS
  $A6C9,$07B1

b $AE7A Graphics: The Cavern of Silence
@ $AE7A label=Image_TheCavernOfSilence
D $AE7A #PUSHS
. #UDGTABLE
. { =h The Cavern of Silence }
. { #SIM(start=$C146,stop=$C14F,ix=$FB75,bc=$0B)#SCR$02{$00,$00,$200,$100}(cavern-of-silence) }
. UDGTABLE#
. #POPS
  $AE7A,$0B4B

c $B9C5 Game Entry Point
@ $B9C5 label=GameEntryPoint
E $B9C5 View the equivalent code in;
. #LIST
. { #SHOCK$9DD7 }
. { #HEROES$ABD4 }
. { #JEWELS$BA50 }
. { #ANDROMEDA$61A8 }
. { #WARLORD$A531 }
. LIST#
D $B9C5 Enter the game by jumping to the initialisation routine.
  $B9C5,$03 Jump to #R$F964 to start a new game.

g $B9C8 Table: Item Locations
@ $B9C8 label=Table_ItemLocations
E $B9C8 View the equivalent code in;
. #LIST
. { #SHOCK$9F88 }
. { #HEROES$AD76 }
. { #JEWELS$BBF0 }
. { #ANDROMEDA$61AB }
. { #WARLORD$A66C }
. LIST#
D $B9C8 Workspace filled from #R$F992 by the routine at #R$F964.
. Object locations occupy the #N$4A bytes at #R$B9C8. The current room
. is *#R$BA9B. Pointers to the message, exit and handler tables follow.
B $B9C8,$01 Item #N(#PC-$B9C8) #ITEM(#PC-$B9C8) in room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
L $B9C8,$01,$4A

u $BA12
S $BA12,$1A

g $BA2C Flags: Display State
@ $BA2C label=Flag_DisplayState
D $BA2C Bit 0 is set when the long room description was just shown, so
. #R$C0F9 waits for a key before listing exits and objects.
B $BA2C,$01

u $BA2D
S $BA2D,$03

g $BA30 Table: Already Seen Room Images
@ $BA30 label=Table_RoomImagesAlreadySeen
D $BA30 Corresponds to whether the player has already seen the image for
. the following rooms:
.
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$E806,$E80D,,1(n,{ #N(n-$E806) | #N(#PEEKn) | #ROOM(#PEEKn) })
. TABLE#
. #TABLE(default,centre,centre)
. { =h Bit | =h Room ID | =h Room Name }
. #FOR$E80E,$E811,,1(n,{ #N(n-$E80E) | #N(#PEEKn) | #ROOM(#PEEKn) })
. #FOR$04,$07,,1(n,{ #Nn | N/A | N/A })
. TABLE#
D $BA30 #R$C0F9 tests and sets the bit for the current room. The bit
. number is the room's place in #R$E806.
B $BA30,b,$01
B $BA31,b,$01

u $BA32
S $BA32,$04

g $BA36 Flags: Turn-Based Event States
@ $BA36 label=Flag_TurnBasedEventState
D $BA36 Holds a single byte, where each bit relates to a turn-based event as
. follows:
. #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Wood nymph }
. { #N$01 | Spider }
. { #N$02 | Slime monster }
. { #N$03 | Demons }
. { #N$04 | Wizard }
. TABLE#
. When the bit is set, this starts a turn counter (see #R$BA37).
B $BA36,$01

g $BA37 Turn-Based Event Counters
D $BA37 One countdown per bit of *#R$BA36. #R$BECE decrements a set
. counter each turn and runs the handler from #R$BADE when it hits zero.
N $BA37 Arm the wood nymph for the next turn (#R$EC3D writes #N$01).
@ $BA37 label=Counter_WoodNymph
N $BA38 Arm the giant spider for six turns (#R$ECD5).
@ $BA38 label=Counter_Spider
N $BA39 Arm the slime monster for six turns (#R$ECE6).
@ $BA39 label=Counter_SlimeMonster
N $BA3A Arm the demons for six turns (#R$ECF7).
@ $BA3A label=Counter_Demons
N $BA3B Arm Zarn for six turns (#R$ED08).
@ $BA3B label=Counter_Wizard
N $BA3C Unused.
@ $BA3C label=Counter_Unused_0
N $BA3D Unused.
@ $BA3D label=Counter_Unused_1
N $BA3E Unused.
@ $BA3E label=Counter_Unused_2
B $BA37,$08,$01

g $BA3F Flag: Princess Following
@ $BA3F label=Flag_PrincessFollowing
D $BA3F Only bit 0 is used. When it is set, Princess Mara (#ITEM$2C, the
. first byte of #R$BA40) follows the player from room to room. #R$C42F
. moves the item for each set bit into the room the player just entered.
. Bits 1-7 are never set.
B $BA3F,$01

g $BA40 Table: Following Items
@ $BA40 label=Table_FollowingItems
D $BA40 Each bit of *#R$BA3F makes the item at the same position here
. follow the player when the room changes. Default bit 0 holds #ITEM$2C
. (Princess Mara).
B $BA40,$01 Bit 0: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $BA41,$07 Bits 1-7: not used by this game.

g $BA48 Table: Scenic Event Locations
@ $BA48 label=Table_ScenicEventLocations
D $BA48 Where each of the #N$0D scenic events is (the count is at #R$BB00).
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Not in play }
. { Other | The room the event is in }
. TABLE#
. Populated by #R$F964. See #R$BECE, #R$C3FA and #R$C42F for usage.
B $BA48,$01 Event #N(#PC-$BA48).
L $BA48,$01,$0D

u $BA55
S $BA55,$13

g $BA68 Number Of Items In The Players Inventory
@ $BA68 label=Count_InventoryItems
D $BA68 The number of items the player is currently holding.
B $BA68,$01

g $BA69 Load/ Save Buffer
@ $BA69 label=LoadSaveBuffer
D $BA69 When #R$C380(loading) or #R$C345(saving), this buffer is used for
. storing #R$EB02 - which are then copied to/ from the table itself.
B $BA69,$32,$08

g $BA9B Current Room ID
@ $BA9B label=CurrentRoom
D $BA9B The room the player starts the game in is room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
B $BA9B,$01 Current room ID.

g $BA9C Table: Scenic Event Rooms
@ $BA9C label=Table_ScenicEventRooms
D $BA9C Pointer to the table containing groups of room IDs that an event
. could occur in.
W $BA9C,$02 Event #N((#PC-$BA9C)/$02).
L $BA9C,$02,$0D

u $BAB6
S $BAB6,$26

g $BADC Pointer: Vocabulary Table
@ $BADC label=Pointer_Vocabulary
D $BADC Pointer to the table containing the game vocabulary.
W $BADC,$02

g $BADE Pointer: Turn-Based Events Jump Table
@ $BADE label=Pointer_TurnBasedEvents_Jump
D $BADE Pointer to the jump table containing turn-based events.
W $BADE,$02

g $BAE0 Pointer: Room Map Table
@ $BAE0 label=Pointer_RoomMap
D $BAE0 Pointer to the table containing the relationships between rooms.
W $BAE0,$02

g $BAE2 Pointer: Item Description Table
@ $BAE2 label=Pointer_ItemDescriptions
D $BAE2 Pointer to the table containing item descriptions.
W $BAE2,$02

g $BAE4 Pointer: Rooms With Images Table
@ $BAE4 label=Pointer_RoomsWithImages
D $BAE4 Pointer to the table containing all the rooms which have an image
. to display.
W $BAE4,$02

g $BAE6 Pointer: Room Image Jump Table
@ $BAE6 label=Pointer_RoomImage
D $BAE6 Pointer to the jump table for displaying an image relating to a
. room.
W $BAE6,$02

g $BAE8 Pointer: Room Description Table
@ $BAE8 label=Pointer_RoomDescriptions
D $BAE8 Pointer to the table containing room descriptions.
W $BAE8,$02

g $BAEA Pointer: Item Grouping Table
@ $BAEA label=Pointer_ItemGroupingTable
W $BAEA,$02

g $BAEC Pointer: Object Noun Phrases
@ $BAEC label=Pointer_ObjectNounPhrases
W $BAEC,$02

g $BAEE Pointer: Object List Table
@ $BAEE label=Pointer_ObjectList
W $BAEE,$02

g $BAF0 Pointer: Verbs Jump Table
@ $BAF0 label=Pointer_JumpTable_Verbs
W $BAF0,$02

g $BAF2 Pointer: Configurable Exits Table
@ $BAF2 label=Pointer_ConfigurableExits
W $BAF2,$02

g $BAF4 Pointer: Scenic Events Jump Table
@ $BAF4 label=Pointer_JumpTable_ScenicEvents
W $BAF4,$02

g $BAF6 Pointer: Verb Word Tokens Table
@ $BAF6 label=Pointer_VerbWordTokens
W $BAF6,$02

g $BAF8 Number Of Items
@ $BAF8 label=Count_Items
E $BAF8 View the equivalent code in;
. #LIST
. { #SHOCK$BBC7 }
. { #JEWELS$BD28 }
. { #WARLORD$A7E8 }
. LIST#
D $BAF8 The total number of items in the game.
W $BAF8,$02

g $BAFA Number Of Objects
@ $BAFA label=Count_Objects
E $BAFA View the equivalent code in;
. #LIST
. { #SHOCK$BBC9 }
. { #JEWELS$BD2A }
. { #ANDROMEDA$62C4 }
. LIST#
D $BAFA The total number of objects in the game.
W $BAFA,$02

g $BAFC Number Of Verb Tokens
@ $BAFC label=Count_VerbTokens
D $BAFC The total number of verb word tokens the game has.
W $BAFC,$02

g $BAFE Number Of Rooms With Images
@ $BAFE label=Count_RoomsWithImages
D $BAFE The total number of rooms which have related images in the game.
W $BAFE,$02

g $BB00 Number Of Scenic Events
@ $BB00 label=Count_ScenicEvents
E $BB00 View the equivalent code in;
. #LIST
. { #SHOCK$BBCF }
. { #JEWELS$BD30 }
. { #WARLORD$A7EE }
. LIST#
D $BB00 The total number of scenic events in the game, see #R$BA48.
W $BB00,$02

g $BB02 Number Of "Configurable Exits"
@ $BB02 label=Count_ConfigurableExits
W $BB02,$02

g $BB04 Command Buffer
@ $BB04 label=CommandBuffer
D $BB04 The line being typed and the parsed tokens.
B $BB04,$32

g $BB36 User Input: Word Tokens
@ $BB36 label=UserInput_Token_1
@ $BB37 label=UserInput_Token_2
B $BB36,$01 The first word, which should be the verb.
B $BB37,$09,$09 The words after the verb.

g $BB40 Line Number
@ $BB40 label=LineNumber
E $BB40 View the equivalent code in;
. #LIST
. { #HEROES$AF38 }
. { #JEWELS$BD70 }
. { #ANDROMEDA$629B }
. { #WARLORD$A82E }
. LIST#
B $BB40,$01

g $BB41 Four Letter Buffer
@ $BB41 label=FourLetterBuffer
B $BB41,$04

g $BB45 Graphics: Room Image Row
@ $BB45 label=RoomImageRow
B $BB45,$08

g $BB4D Temporary Storage Table Pointer
@ $BB4D label=TempStore_TablePointer
W $BB4D,$02

g $BB4F Temporary Storage Table Index
@ $BB4F label=TempStore_TableIndex
W $BB4F,$02

g $BB51 Temporary Storage Word Count
@ $BB51 label=TempStore_WordCount
W $BB51,$02

u $BB53
S $BB53,$02

t $BB55 Messaging: "> "
@ $BB55 label=Messaging_Prompt
  $BB55,$02 "#MESSAGE$BB55".
B $BB57,$01 Terminator.

t $BB58 Messaging: "<BS> <BS>"
@ $BB58 label=Messaging_BackspaceSpaceBackspace
D $BB58 Rubs out the input prompt.
  $BB58,$03 "#MESSAGE$BB58".
B $BB5B,$01 Terminator.

t $BB5C Messaging: "THE"
@ $BB5C label=Messaging_The
  $BB5C,$04 "#MESSAGE$BB5C".
B $BB60,$01 Terminator.

t $BB61 Messaging: "I Don't Understand"
@ $BB61 label=Messaging_IDontUnderstand
  $BB61,$13 "#MESSAGE$BB61".
B $BB74,$01 Terminator.

t $BB75 Messaging: "I Don't Know The Word"
@ $BB75 label=Messaging_IDontKnowTheWord
  $BB75,$17 "#MESSAGE$BB75".
B $BB8C,$01 Terminator.

t $BB8D Messaging: "Nothing"
@ $BB8D label=Messaging_Nothing
  $BB8D,$08 "#MESSAGE$BB8D".
B $BB95,$01 Terminator.

t $BB96 Messaging: "You Can See"
@ $BB96 label=Messaging_YouCanSee
  $BB96,$0E "#MESSAGE$BB96".
B $BBA4,$01 Terminator.

t $BBA5 Messaging: "Ampersand "
@ $BBA5 label=Messaging_Ampersand
  $BBA5,$03 "#MESSAGE$BBA5".
B $BBA8,$01 Terminator.

t $BBA9 Messaging: "There Are Exits"
@ $BBA9 label=Messaging_ThereAreExits
  $BBA9,$12 "#MESSAGE$BBA9".
B $BBBB,$01 Terminator.

t $BBBC Messaging: "There Is An Exit"
@ $BBBC label=Messaging_ThereIsAnExit
  $BBBC,$12 "#MESSAGE$BBBC".
B $BBCE,$01 Terminator.

t $BBCF Exits Messaging: "North"
@ $BBCF label=MessagingExits_North
  $BBCF,$05 "#MESSAGE$BBCF".
B $BBD4,$01 Terminator.

t $BBD5 Exits Messaging: "South"
@ $BBD5 label=MessagingExits_South
  $BBD5,$05 "#MESSAGE$BBD5".
B $BBDA,$01 Terminator.

t $BBDB Exits Messaging: "East"
@ $BBDB label=MessagingExits_East
  $BBDB,$04 "#MESSAGE$BBDB".
B $BBDF,$01 Terminator.

t $BBE0 Exits Messaging: "West"
@ $BBE0 label=MessagingExits_West
  $BBE0,$04 "#MESSAGE$BBE0".
B $BBE4,$01 Terminator.

t $BBE5 Exits Messaging: "Up"
@ $BBE5 label=MessagingExits_Up
  $BBE5,$02 "#MESSAGE$BBE5".
B $BBE7,$01 Terminator.

t $BBE8 Exits Messaging: "Down"
@ $BBE8 label=MessagingExits_Down
  $BBE8,$04 "#MESSAGE$BBE8".
B $BBEC,$01 Terminator.

t $BBED Messaging: "I Can't See"
@ $BBED label=Messaging_ICantSee
  $BBED,$0C "#MESSAGE$BBED".
B $BBF9,$01 Terminator.

t $BBFA Messaging: "Here"
@ $BBFA label=Messaging_Here
  $BBFA,$06 "#MESSAGE$BBFA".
B $BC00,$01 Terminator.

t $BC01 Messaging: "You Are Dead"
@ $BC01 label=Messaging_YouAreDead
  $BC01,$0D "#MESSAGE$BC01".
B $BC0E,$01 Terminator.

t $BC0F Messaging: "Want Another Game? Y/N"
@ $BC0F label=Messaging_WantAnotherGameYN
  $BC0F,$17 "#MESSAGE$BC0F".
B $BC26,$01 Terminator.

t $BC27 Messaging: "LOADING. Start Tape"
@ $BC27 label=Messaging_LOADINGStartTape
  $BC27,$14 "#MESSAGE$BC27".
B $BC3B,$01 Terminator.

t $BC3C Messaging: "Tape Error"
@ $BC3C label=Messaging_TapeError
  $BC3C,$0B "#MESSAGE$BC3C".
B $BC47,$01 Terminator.

t $BC48 Messaging: "SAVING"
@ $BC48 label=Messaging_SAVING
  $BC48,$21 "#MESSAGE$BC48".
B $BC69,$01 Terminator.

t $BC6A Messaging: "Stop Tape.Saving Complete"
@ $BC6A label=Messaging_StopTapeSavingComplete
  $BC6A,$1A "#MESSAGE$BC6A".
B $BC84,$01 Terminator.

t $BC85 Messaging: "Want To Save The Game? Y/N"
@ $BC85 label=Messaging_WantToSaveTheGameYN
  $BC85,$1B "#MESSAGE$BC85".
B $BCA0,$01 Terminator.

t $BCA1 Messaging: "Please Be More Specific"
@ $BCA1 label=Messaging_PleaseBeMoreSpecific
  $BCA1,$18 "#MESSAGE$BCA1".
B $BCB9,$01 Terminator.

t $BCBA Messaging: "Please Rephrase That"
@ $BCBA label=Messaging_PleaseRephraseThat
  $BCBA,$15 "#MESSAGE$BCBA".
B $BCCF,$01 Terminator.

t $BCD0 Messaging: "You Can't"
@ $BCD0 label=Messaging_YouCant
  $BCD0,$0A "#MESSAGE$BCD0".
B $BCDA,$01 Terminator.

t $BCDB Messaging: "O.K"
@ $BCDB label=Messaging_OK
  $BCDB,$04 "#MESSAGE$BCDB".
B $BCDF,$01 Terminator.

t $BCE0 Messaging: "You're Already Carrying"
@ $BCE0 label=Messaging_YoureAlreadyCarrying
  $BCE0,$18 "#MESSAGE$BCE0".
B $BCF8,$01 Terminator.

t $BCF9 Messaging: "Full Stop"
@ $BCF9 label=Messaging_FullStop
  $BCF9,$01 "#MESSAGE$BCF9".
B $BCFA,$01 Terminator.

t $BCFB Messaging: "It"
@ $BCFB label=Messaging_It
  $BCFB,$03 "#MESSAGE$BCFB".
B $BCFE,$01 Terminator.

t $BCFF Messaging: "Them"
@ $BCFF label=Messaging_Them
  $BCFF,$05 "#MESSAGE$BCFF".
B $BD04,$01 Terminator.

t $BD05 Messaging: "You Can't Carry Any More"
@ $BD05 label=Messaging_YouCantCarryAnyMore
  $BD05,$19 "#MESSAGE$BD05".
B $BD1E,$01 Terminator.

t $BD1F Messaging: "You Are Carrying"
@ $BD1F label=Messaging_YouAreCarrying
  $BD1F,$12 "#MESSAGE$BD1F".
B $BD31,$01 Terminator.

t $BD32 Messaging: "You Can't Go In That Direction"
@ $BD32 label=Messaging_YouCantGoInThatDirection
  $BD32,$1F "#MESSAGE$BD32".
B $BD51,$01 Terminator.

t $BD52 Messaging: "One At A Time,Please"
@ $BD52 label=Messaging_OneAtATimePlease
  $BD52,$15 "#MESSAGE$BD52".
B $BD67,$01 Terminator.

t $BD68 Messaging: "I Don't See The Point"
@ $BD68 label=Messaging_IDontSeeThePoint
  $BD68,$16 "#MESSAGE$BD68".
B $BD7E,$01 Terminator.

t $BD7F Messaging: "You're Not Carrying"
@ $BD7F label=Messaging_YoureNotCarrying
  $BD7F,$14 "#MESSAGE$BD7F".
B $BD93,$01 Terminator.

t $BD94 Messaging: "You're Not Carrying Anything"
@ $BD94 label=Messaging_YoureNotCarryingAnything
  $BD94,$1D "#MESSAGE$BD94".
B $BDB1,$01 Terminator.

g $BDB2 Table: Directions
@ $BDB2 label=Table_Directions
D $BDB2 Pointers to the direction names, in the order north, south,
. east, west, up and down.
W $BDB2,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $BDB2,$02,$06

c $BDBE Response: "Please Rephrase That"
@ $BDBE label=Response_PleaseRephraseThat
E $BDBE View the equivalent code in;
. #LIST
. { #HEROES$B1E4 }
. { #JEWELS$BFEE }
. { #ANDROMEDA$6479 }
. { #WARLORD$AAEE }
. LIST#
D $BDBE Tell the player to rephrase the command.
  $BDBE,$06 Print "#MESSAGE$BCBA".
  $BDC4,$01 Return.

c $BDC5 Response: "Please Be More Specific"
@ $BDC5 label=Response_PleaseBeMoreSpecific
E $BDC5 View the equivalent code in;
. #LIST
. { #HEROES$B1EB }
. { #JEWELS$BFF5 }
. { #ANDROMEDA$6480 }
. { #WARLORD$AAF5 }
. LIST#
D $BDC5 Ask the player to be more specific.
  $BDC5,$06 Print "#MESSAGE$BCA1".
  $BDCB,$01 Return.

c $BDCC Response: "You Can't"
@ $BDCC label=Response_YouCant
E $BDCC View the equivalent code in;
. #LIST
. { #HEROES$B1F2 }
. { #JEWELS$BFFC }
. { #ANDROMEDA$6487 }
. { #WARLORD$AAFC }
. LIST#
D $BDCC Tell the player the command is impossible.
  $BDCC,$06 Print "#MESSAGE$BCD0".
  $BDD2,$01 Return.

c $BDD3 Response: "O.K."
@ $BDD3 label=Response_OK
E $BDD3 View the equivalent code in;
. #LIST
. { #HEROES$B1F9 }
. { #JEWELS$C003 }
. { #ANDROMEDA$648E }
. { #WARLORD$AB03 }
. LIST#
D $BDD3 Acknowledge the command.
  $BDD3,$06 Print "#MESSAGE$BCDB".
  $BDD9,$01 Return.

c $BDDA Get User Input
@ $BDDA label=GetUserInput
E $BDDA View the equivalent code in;
. #LIST
. { #SHOCK$9DFB }
. { #HEROES$ABE1 }
. { #JEWELS$BA5D }
. { #ANDROMEDA$6495 }
. { #WARLORD$A53E }
. LIST#
D $BDDA Wait for a new keypress.
R $BDDA O:A The keypress value
  $BDDA,$07 Read *#SKOOLKID$5C3B(FLAGS) and jump back to #R$BDDA until a new key
. is pressed.
  $BDE1,$02 Reset the "new key has been pressed" flag.
  $BDE3,$03 Write it back to *#SKOOLKID$5C3B(FLAGS).
N $BDE6 Fetch the keypress.
  $BDE6,$03 Copy the key from *#SKOOLKID$5C08(LAST_K).
  $BDE9,$01 Return.

c $BDEA Clear Screen
@ $BDEA label=ClearScreen
E $BDEA View the equivalent code in;
. #LIST
. { #HEROES$ABF1 }
. { #JEWELS$BA6D }
. { #ANDROMEDA$64A5 }
. { #WARLORD$A54E }
. LIST#
D $BDEA Clear the screen and select the text channel.
  $BDEA,$03 Call #R$BE13 to select the screen channel.
  $BDED,$03 Call #SKOOLKID$0D6B(CLS).
  $BDF0,$01 Return.

c $BDF1 Clear Lines
@ $BDF1 label=ClearLines
E $BDF1 View the equivalent code in;
. #LIST
. { #SHOCK$9E0B }
. { #HEROES$ABF8 }
. { #JEWELS$BA74 }
. { #ANDROMEDA$64AC }
. { #WARLORD$A555 }
. LIST#
D $BDF1 Clear the picture lines, using the line count stored at #R$BB40.
R $BDF1 B Line count from *#R$BB40
  $BDF1,$03 Call #R$BE13 to select the screen channel.
  $BDF4,$07 Clear the number of lines held by *#R$BB40 from the bottom of the
. screen using #SKOOLKID$0E44(CL_LINE).
  $BDFB,$01 Return.

c $BDFC Set Default Screen Position
@ $BDFC label=SetDefaultScreenPosition
E $BDFC View the equivalent code in;
. #LIST
. { #SHOCK$9E19 }
. { #HEROES$AC03 }
. { #JEWELS$BA7F }
. { #ANDROMEDA$64B7 }
. { #WARLORD$A560 }
. LIST#
D $BDFC Park the cursor at the top-left of the text window.
  $BDFC,$03 Call #R$BE13 to select the screen channel.
  $BDFF,$03 Park the cursor at column #N$21 of row #N$03.
  $BE02,$03 Call #SKOOLKID$0DD9(CL_SET).
  $BE05,$01 Return.

c $BE06 Set Screen Position
@ $BE06 label=SetScreenPosition
E $BE06 View the equivalent code in;
. #LIST
. { #HEROES$AC0D }
. { #JEWELS$BA89 }
. { #ANDROMEDA$64C1 }
. { #WARLORD$A56A }
. LIST#
D $BE06 Park the cursor on the text row stored at #R$BB40.
R $BE06 A Line number to start printing at
  $BE06,$03 Call #R$BE13 to select the screen channel.
  $BE09,$04 Take the text row from *#R$BB40.
  $BE0D,$05 Call #SKOOLKID$0DD9(CL_SET) with column #N$21.
  $BE12,$01 Return.

c $BE13 Switch To Normal Screen Output
@ $BE13 label=SwitchNormalScreenOutput
E $BE13 View the equivalent code in;
. #LIST
. { #HEROES$AC1A }
. { #JEWELS$BA96 }
. { #ANDROMEDA$64CE }
. { #WARLORD$A577 }
. LIST#
D $BE13 Open the upper screen channel without disturbing the registers.
  $BE13,$04 Stash #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $BE17,$05 Set the current output channel to the main screen (stream #N$02)
. using #SKOOLKID$1601(CHAN_OPEN).
  $BE1C,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $BE20,$01 Return.

c $BE21 Print String
@ $BE21 label=PrintString
E $BE21 View the equivalent code in;
. #LIST
. { #SHOCK$A267 }
. { #HEROES$AC28 }
. { #JEWELS$BAA4 }
. { #ANDROMEDA$64DC }
. { #WARLORD$A585 }
. LIST#
D $BE21 Print a message terminated by #N$FF.
R $BE21 HL Pointer to a message terminated by #N$FF
  $BE21,$03 Call #R$BE13 to select the screen channel.
N $BE24 Keep printing until the #N$FF terminator.
@ $BE24 label=PrintString_Loop
  $BE24,$02 Read the next character and advance the pointer.
  $BE26,$03 Return if this character is the #N$FF terminator.
N $BE29 Print this character.
  $BE29,$03 Call #R$BE37.
  $BE2C,$02 Jump back to #R$BE24 for the next character.

c $BE2E Print String And A Newline
@ $BE2E label=PrintStringAndNewline
E $BE2E View the equivalent code in;
. #LIST
. { #SHOCK$A275 }
. { #HEROES$AC35 }
. { #JEWELS$BAB1 }
. { #ANDROMEDA$64E9 }
. { #WARLORD$A592 }
. LIST#
D $BE2E Print a message terminated by #N($FF), then move to the next line.
R $BE2E HL Pointer to a message terminated by #N$FF
N $BE2E Print the message.
  $BE2E,$03 Call #R$BE21.
N $BE31 Force a newline.
  $BE31,$02 Start a new line (#N$0D).
  $BE33,$03 Call #R$BE37 to print the newline.
  $BE36,$01 Return.

c $BE37 Print Character
@ $BE37 label=PrintCharacter
E $BE37 View the equivalent code in;
. #LIST
. { #SHOCK$9E26 }
. { #HEROES$AC47 }
. { #JEWELS$BAC3 }
. { #ANDROMEDA$64F2 }
. { #WARLORD$A5A4 }
. LIST#
D $BE37 Print one character, scrolling the text window when the cursor reaches
. its edge.
R $BE37 A Character to print
  $BE37,$01 Keep the character safe on the stack.
  $BE38,$07 Jump to #R$BE52 if the line byte of #SKOOLKID$5C88(S_POSN) (#N$5C89)
. is not row #N$03.
  $BE3F,$02 Restore the character from the stack, leaving a copy.
  $BE41,$04 Jump to #R$BE4A if this is not a newline (#N$0D).
N $BE45 A newline scrolls the text window and prints nothing.
  $BE45,$03 Call #R$BE55.
  $BE48,$01 Discard the character from the stack.
  $BE49,$01 Return.
N $BE4A Check the column.
@ $BE4A label=CheckColumnPosition
  $BE4A,$08 Call #R$BE55 if *#SKOOLKID$5C88(S_POSN) is column #N$01.
N $BE52 Print the character.
@ $BE52 label=PrintCharacterDirect
  $BE52,$01 Restore the character from the stack.
  $BE53,$01 Print it with #SKOOLKID$0010(PRINT_A_1).
  $BE54,$01 Return.

c $BE55 Scroll Screen
@ $BE55 label=ScrollScreen
E $BE55 View the equivalent code in;
. #LIST
. { #HEROES$AC3E }
. { #JEWELS$BABA }
. { #ANDROMEDA$6510 }
. { #WARLORD$A59B }
. LIST#
D $BE55 Scroll the text up and put the cursor back on the top line.
  $BE55,$01 Switch to the shadow registers.
N $BE56 Scroll the text up.
  $BE56,$03 Call #SKOOLKID$0DFE(CL_SC_ALL).
N $BE59 Put the cursor back at the top of the text window.
  $BE59,$03 Call #R$BDFC to put the cursor back at the top.
  $BE5C,$01 Switch back to the main registers.
  $BE5D,$01 Return.

c $BE5E Print Room Graphic
@ $BE5E label=Print_RoomGraphic
E $BE5E View the equivalent code in;
. #LIST
. { #HEROES$AD06 }
. { #JEWELS$BAE1 }
. { #ANDROMEDA$6519 }
. LIST#
D $BE5E Unpack a room picture into the display, drawing it in the paper colour.
R $BE5E IX Pointer to room image data
  $BE5E,$03 Call #R$BE13 to select the screen channel.
  $BE61,$03 Set the cursor to row #N($18), column #N$21.
  $BE64,$03 Call #SKOOLKID$0DD9(CL_SET).
N $BE67 Draw the picture in the paper colour.
  $BE67,$03 Take the current attribute from *#SKOOLKID$5C8F(ATTR_T).
  $BE6A,$01 Fetch the attribute byte.
  $BE6B,$02 Keep only the PAPER bits.
  $BE6D,$03 Move the PAPER bits into the INK bits.
  $BE70,$01 Keep that ink colour.
  $BE71,$01 Fetch the attribute byte again.
  $BE72,$02 Keep everything except the old INK bits.
  $BE74,$01 Combine the two values.
  $BE75,$01 Write the result back to *#SKOOLKID$5C8F(ATTR_T).
  $BE76,$03 Count #N$0200 picture bytes.
@ $BE79 label=Print_RoomGraphic_Loop
  $BE79,$01 Keep the byte counter safe.
  $BE7A,$03 Use the scanline buffer (#R$BB45).
  $BE7D,$02 Count #N$08 bits.
  $BE7F,$05 Read the next control byte and advance through the picture.
  $BE84,$02 Jump to #R$BE87 to test the first control bit.
@ $BE86 label=Print_RoomGraphic_NextByte
  $BE86,$01 Advance to the next byte of the scanline.
@ $BE87 label=Print_RoomGraphic_ShiftBit
  $BE87,$02 Take the next control bit; a set bit means this scanline byte comes
. from the picture data.
  $BE89,$02 Jump to #R$BE92 when that bit is reset, so the byte is blank.
  $BE8B,$05 Read the next picture byte and advance through the picture.
  $BE90,$02 Jump to #R$BE93 to store the picture byte.
@ $BE92 label=Print_RoomGraphic_BlankByte
  $BE92,$01 Use a blank byte.
@ $BE93 label=Print_RoomGraphic_StoreByte
  $BE93,$01 Store the byte in the scanline buffer.
  $BE94,$02 Repeat from #R$BE86 until the eight bits of this control byte are
. used.
  $BE96,$03 Take the finished scanline (#R$BB45).
  $BE99,$03 Call #SKOOLKID$0B03(PO_FETCH).
  $BE9C,$03 Call #SKOOLKID$0B24,$0B7F(PR_ALL).
  $BE9F,$03 Call #SKOOLKID$0ADC(PO_STORE).
  $BEA2,$01 Restore the byte counter from the stack.
  $BEA3,$01 Step the byte counter down.
  $BEA4,$04 Jump back to #R$BE79 until every picture byte has been drawn.
  $BEA8,$03 Call #SKOOLKID$0D4D(TEMPS).
  $BEAB,$01 Return.

c $BEAC Colour Room Image
@ $BEAC label=Colour_RoomImage
E $BEAC View the equivalent code in;
. #LIST
. { #HEROES$AD54 }
. { #JEWELS$BB2F }
. { #ANDROMEDA$6535 }
. LIST#
D $BEAC Copy the #N$0200 attribute bytes that follow a picture into the screen.
R $BEAC IX Pointer to the room attribute data
  $BEAC,$03 Point #REGde at the attribute file (#N$5800).
  $BEAF,$03 Copy the attribute pointer from #REGix into #REGhl.
  $BEB2,$05 Copy #N$0200 attribute bytes onto the screen.
  $BEB7,$01 Return.

c $BEB8 Print Room Image
@ $BEB8 label=Print_RoomImage
E $BEB8 View the equivalent code in;
. #LIST
. { #SHOCK$9F28 }
. { #HEROES$AD60 }
. { #JEWELS$BB3B }
. { #ANDROMEDA$6541 }
. { #WARLORD$B10B }
. LIST#
D $BEB8 Draw a room picture and then its colours.
R $BEB8 IX Pointer to room image data
N $BEB8 Draw the picture, then its colours.
  $BEB8,$03 Call #R$BE5E.
  $BEBB,$03 Call #R$BEAC.
  $BEBE,$01 Return.

c $BEBF Clear Room Image
@ $BEBF label=ClearRoomImage
E $BEBF View the equivalent code in;
. #LIST
. { #HEROES$AD67 }
. { #JEWELS$BB42 }
. { #ANDROMEDA$6548 }
. LIST#
D $BEBF Flood the picture's attribute area with the given colour.
R $BEBF A Attribute byte value
  $BEBF,$06 Start at the attribute file and count #N$0200 bytes.
  $BEC5,$01 Keep that attribute colour.
@ $BEC6 label=ClearRoomImage_Loop
  $BEC6,$05 Write that colour through the picture attributes.
  $BECB,$02 Jump back to #R$BEC6 until the picture area is filled.
  $BECD,$01 Return.

c $BECE Handler: Turn-Based Events
@ $BECE label=Handler_TurnBasedEvents
E $BECE View the equivalent code in;
. #LIST
. { #HEROES$B373 }
. { #JEWELS$C17D }
. { #WARLORD$AB0A }
. LIST#
D $BECE Count down the timed threats and, when one expires, run its handler.
N $BECE First process the turn-based events (if any are active).
  $BECE,$06 Jump to #R$BF00 when the event mask is zero.
  $BED4,$07 Count the eight event bits, and skip a threat whose bit is clear.
@ $BED7 label=Handler_TurnBasedEvents_Loop
  $BEDB,$03 Clear the offset used while counting this threat down.
  $BEDE,$0B Count this threat's timer down. Leave it alone while time
. remains.
  $BEE9,$0E Take this threat's handler.
  $BEF7,$01 Keep the bit scan safe on the stack.
  $BEF8,$04 Push #R$BEFD so the next return resumes here.
  $BEFC,$01 Jump to that handler.
  $BEFD,$01 Restore the bit scan from the stack.
@ $BEFE label=Handler_TurnBasedEvents_Next
N $BEFE Test the next turn-based event.
  $BEFE,$02 Decrease the event bit counter by one and loop back to #R$BED7
. until all eight events have been considered.
N $BF00 Process scenic events.
@ $BF00 label=Handler_TurnBasedEvents_Scenic
  $BF00,$0A Jump to #R$BF40 when the scenic count is zero.
  $BF0A,$03 Start at the first scenic entry.
@ $BF0D label=Handler_TurnBasedEvents_ScenicAdvance
  $BF0D,$01 Advance to the next scenic entry.
@ $BF0E label=Handler_TurnBasedEvents_ScenicSlot
  $BF0E,$04 Jump to #R$BF3E when this scenic slot is empty.
  $BF12,$06 Jump to #R$BF3E when this event is already in the current room.
  $BF18,$0E Call #R$C0C3 to fetch this event's room list.
  $BF26,$06 Use the frame counter as a step count and set the group
. terminator in #REGa.
N $BF2C Walk the room group. #N$FF restarts it, and the frame count chooses
. where to stop.
@ $BF2C label=Handler_TurnBasedEvents_RoomWalk
  $BF2C,$06 Point #REGhl at the start of this room group.
  $BF32,$02 Jump to #R$BF35.
@ $BF34 label=Handler_TurnBasedEvents_RoomStep
  $BF34,$01 Step to the next room in the list.
@ $BF35 label=Handler_TurnBasedEvents_RoomCheck
  $BF35,$03 Jump back to #R$BF2C when the end marker matches.
  $BF38,$02 Decrease the step counter by one and loop back to #R$BF34 until
. the counter is zero.
  $BF3A,$01 Take the room the walk landed on.
  $BF3B,$02 Restore the scenic counter and scenic entry pointer from the stack.
  $BF3D,$01 Store that room back in this scenic slot.
@ $BF3E label=Handler_TurnBasedEvents_ScenicNext
N $BF3E Move on to the next scenic event.
  $BF3E,$02 Decrease the scenic event counter by one and loop back to
. #R$BF0D until every scenic event has been considered.
N $BF40 All done, now return.
@ $BF40 label=Handler_TurnBasedEvents_Return
  $BF40,$01 Return.

c $BF41 Pause Loop
@ $BF41 label=Pause_Loop
E $BF41 View the equivalent code in;
. #LIST
. { #SHOCK$9E2F }
. { #HEROES$AC65 }
. { #JEWELS$BB51 }
. { #ANDROMEDA$65D2 }
. { #WARLORD$A5C2 }
. LIST#
D $BF41 Wait for the given number of frames.
R $BF41 B Number of frames to wait
  $BF41,$01 Halt for one frame.
  $BF42,$02 Repeat until those frames have passed.
  $BF44,$01 Return.

c $BF45 Generate Random Number
@ $BF45 label=GenerateRandomNumber
E $BF45 View the equivalent code in;
. #LIST
. { #SHOCK$AD25 }
. { #HEROES$B77F }
. { #JEWELS$C582 }
. { #ANDROMEDA$65D6 }
. { #WARLORD$B08A }
. LIST#
D $BF45 Return a number between #N$00 and the limit passed in.
R $BF45 O:A A random number derived from *#SKOOLKID$5C78(FRAMES)
  $BF45,$07 Save the limit and take the low byte of *#SKOOLKID$5C78(FRAMES) as
. the scramble.
@ $BF4C label=GenerateRandomNumber_Loop
  $BF4C,$04 Step the result down, wrapping to the limit when it passes zero.
@ $BF50 label=GenerateRandomNumber_Next
  $BF50,$02 Repeat that step once for each frame count.
  $BF52,$01 Step the result down once more, so the range starts at zero.
  $BF53,$01 Restore the saved limit from the stack.
  $BF54,$01 Return.

c $BF55 Handler: Update Object Location
@ $BF55 label=UpdateObjectLocation
E $BF55 View the equivalent code in;
. #LIST
. { #JEWELS$C412 }
. { #ANDROMEDA$65E6 }
. LIST#
D $BF55 Write a new location for an object, or for a scenic-event room.
N $BF55 Bit 7 selects the scenic-room list instead of the object table.
  $BF55,$04 Jump to #R$BF60 for an ordinary object.
  $BF59,$05 Clear that bit and use the scenic list (#R$BA48).
  $BF5E,$02 Jump to #R$BF63 to write the location.
@ $BF60 label=UpdateObjectLocation_Objects
  $BF60,$03 Look up the object locations (#R$B9C8).
@ $BF63 label=UpdateObjectLocation_Write
  $BF63,$05 Write the new location.
  $BF68,$01 Return.

c $BF69 Is Object Present?
@ $BF69 label=IsObjectPresent
E $BF69 View the equivalent code in;
. #LIST
. { #ANDROMEDA$65FA }
. LIST#
D $BF69 Report whether this object occurs anywhere in the location table.
  $BF69,$09 Search the object locations at #R$B9C8 for this object.
  $BF72,$01 Return.

c $BF73 Handler: User Input
@ $BF73 label=Handler_UserInput
E $BF73 View the equivalent code in;
. #LIST
. { #SHOCK$A4B0 }
. { #HEROES$B200 }
. { #JEWELS$C00A }
. { #ANDROMEDA$6604 }
. { #WARLORD$AD32 }
. LIST#
D $BF73 Read a line of text, then turn it into vocabulary tokens.
N $BF73 Reset the cursor to the top of the text window.
  $BF73,$03 Call #R$BDFC to park the cursor at the top of the text.
N $BF76 Clear the command buffer.
  $BF76,$03 Start at the command buffer (#R$BB04).
  $BF79,$04 Prepare a space (#N$20) and a counter of #N$32 bytes.
@ $BF7D label=EmptyCommandBuffer_Loop
  $BF7D,$04 Write spaces through the whole command buffer.
N $BF81 Print the "&gt;" prompt.
  $BF81,$03 Call #R$C3C0.
N $BF84 Collect keypresses.
  $BF84,$03 Start again at the beginning of the command.
N $BF87 Wait for the next key.
@ $BF87 label=UserInput_Loop
  $BF87,$03 Call #R$BDDA.
N $BF8A DELETE rubs out a character. ENTER finishes the line. Any other control
. key
. is ignored.
  $BF8A,$04 Jump to #R$BFAA if DELETE was pressed.
  $BF8E,$04 Jump to #R$BFC1 if ENTER was pressed.
  $BF92,$04 Jump back to #R$BF87 when the key is below SPACE.
N $BF96 Is the command buffer full?
  $BF96,$0A Jump back to #R$BF87 once the pointer has reached the sentinel at
. #R$BB04(#N$BB35).
N $BFA0 The key is valid, so store it and print it.
  $BFA0,$01 Write the key into the command buffer.
  $BFA1,$03 Call #R$BE13 to select the screen channel.
  $BFA4,$03 Call #R$BE37 to echo the key.
  $BFA7,$01 Advance to the next space in the buffer.
  $BFA8,$02 Jump back to #R$BF87 for the next key.

c $BFAA Handler: User Pressed "DELETE"
@ $BFAA label=UserInput_Delete
E $BFAA View the equivalent code in;
. #LIST
. { #HEROES$B237 }
. { #JEWELS$C041 }
. LIST#
D $BFAA The player pressed DELETE.
  $BFAA,$0A Jump back to #R$BF87 when the buffer is still empty.
N $BFB4 Rub the previous character off the screen.
  $BFB4,$01 Keep the buffer pointer safe.
  $BFB5,$06 Print "#MESSAGE$BB58".
  $BFBB,$01 Restore the buffer pointer from the stack.
  $BFBC,$03 Step back one character and blank it.
  $BFBF,$02 Jump back to #R$BF87 for the next key.

c $BFC1 Handler: User Pressed "ENTER"
@ $BFC1 label=UserInput_Enter
E $BFC1 View the equivalent code in;
. #LIST
. { #HEROES$B24E }
. { #JEWELS$C058 }
. { #ANDROMEDA$6669 }
. LIST#
D $BFC1 The player pressed ENTER, so close the command and clear the tokens.
  $BFC1,$01 Store ENTER as the end of the command.
  $BFC2,$03 Call #R$BE13 to select the screen channel.
  $BFC5,$03 Call #R$BE37 to echo ENTER.
  $BFC8,$07 Start at the token buffer (#R$BB36) and prepare the empty marker
. #N$FF.
@ $BFCF label=EmptyWordTokenBuffer_Loop
  $BFCF,$04 Write #N$FF into each of the #N$0A token slots.
  $BFD3,$05 Start at the command and allow #N$0A words, then fall into the
. parser.
@ $BFD8 label=Parser_MatchInputWord
N $BFD8 Split the command into words and look each one up in the vocabulary.
N $BFD8 Blank the four-character word buffer.
  $BFD8,$03 Start at the word buffer (#R$BB41).
  $BFDB,$04 Prepare a space and a counter of #N$04 characters.
@ $BFDF label=MatchInputWord_Clear
  $BFDF,$04 Write spaces through the word buffer.
  $BFE3,$0B Jump to #R$C0B4 when no token slots remain, or the command has
. ended.
N $BFEE Copy the next word, up to #N$04 characters, stopping at a space, a comma
. or
. ENTER.
  $BFEE,$05 Copy up to #N$04 characters into the word buffer.
@ $BFF3 label=MatchInputWord_Copy
  $BFF3,$05 Jump to #R$C01F when the character is ENTER.
  $BFF8,$08 Jump to #R$C015 when the character is a space or a comma.
  $C000,$03 Copy the character into the word buffer and advance both pointers.
  $C003,$02 Repeat from #R$BFF3 until four characters have been copied.
N $C005 A longer word is skipped up to the next delimiter.
@ $C005 label=MatchInputWord_Skip
  $C005,$0D Jump to #R$C01F on ENTER, or to #R$C015 on a space or a comma.
  $C012,$03 Skip this character and keep looking for a delimiter.
@ $C015 label=MatchInputWord_Delimiter
  $C015,$0A Skip consecutive spaces and commas.
N $C01F Ignore the word "THE ".
@ $C01F label=MatchInputWord_IgnoreThe
  $C01F,$09 Switch in the spare registers and point them at "THE " and the word.
@ $C028 label=MatchInputWord_The
  $C028,$08 Compare the four characters.
@ $C030 label=MatchInputWord_AfterThe
  $C030,$01 Switch back to the main registers to act on the comparison.
  $C031,$02 Jump back to #R$BFD8 when the word was THE, so it is not tokenised.
  $C033,$02 Use up one token slot.
N $C035 Look the word up in the vocabulary. A comma separates synonyms.
  $C035,$05 Start at the vocabulary, with the token index at zero.
@ $C03A label=MatchInputWord_Vocabulary
  $C03A,$05 Jump to #R$C06C when the vocabulary is exhausted.
@ $C03F label=MatchInputWord_CompareWord
  $C03F,$05 Compare the next vocabulary word with the word buffer.
@ $C044 label=MatchInputWord_CompareChar
  $C044,$02 Compare the next character.
  $C046,$06 Jump to #R$C05D when it does not match.
  $C04C,$08 Turn the vocabulary index into a token-slot offset.
  $C054,$09 Store that token in its slot at #R$BB36 and parse the next word.
@ $C05D label=MatchInputWord_NextWord
  $C05D,$04 Step to the end of this vocabulary word.
  $C061,$08 Jump back to #R$C03F to try the synonym after a comma.
@ $C069 label=MatchInputWord_NextEntry
  $C069,$03 Try the next vocabulary word.
N $C06C The word is not in the vocabulary, so quote it and ask again.
@ $C06C label=MatchInputWord_Unknown
  $C06C,$08 Find the unknown word in the command buffer.
@ $C074 label=MatchInputWord_SeekWord
  $C074,$03 Step back through the copied word count.
@ $C077 label=MatchInputWord_FindWord
  $C077,$0C Skip characters until a space or a comma.
@ $C083 label=MatchInputWord_FindDelimiter
  $C083,$0C Skip spaces and commas, then look for the next word.
@ $C08F label=MatchInputWord_PrintUnknown
  $C08F,$07 Print "#MESSAGE$BB75".
  $C096,$01 Restore the command pointer from the stack.
  $C097,$05 Print a quote.
@ $C09C label=MatchInputWord_Quote
  $C09C,$0B Print the unknown word up to the next space.
@ $C0A7 label=MatchInputWord_CloseQuote
  $C0A7,$05 Print a closing quote.
  $C0AC,$08 Print "#MESSAGE$BCF9" and read another command.

c $C0B4 Handler: Unknown Word
@ $C0B4 label=Handler_UnknownWord
E $C0B4 View the equivalent code in;
. #LIST
. { #HEROES$B364 }
. { #ANDROMEDA$6745 }
. LIST#
D $C0B4 Say "I don't understand" when the first token was never filled in.
  $C0B4,$06 Return when the first token was recognised.
  $C0BA,$06 Print "#MESSAGE$BB61".
@ $C0C0 label=Handler_UnknownWord_Retry
  $C0C0,$03 Jump to #R$BF73 to read another command.

c $C0C3 Get Table Entry
@ $C0C3 label=GetTableEntry
E $C0C3 View the equivalent code in;
. #LIST
. { #SHOCK$A305 }
. { #HEROES$B3F1 }
. { #JEWELS$C1F0 }
. { #ANDROMEDA$6754 }
. { #WARLORD$AB88 }
. LIST#
D $C0C3 Fetch one address from a table of addresses.
R $C0C3 E Index of the entry
R $C0C3 IX Base table address
R $C0C3 O:HL Address from the table entry
R $C0C3 O:IX Address of the table entry
  $C0C3,$08 Double the index and add it to the table.
  $C0CB,$06 Copy that address out of the table.
  $C0D1,$01 Return.

c $C0D2 Print Objects
@ $C0D2 label=PrintObjects
E $C0D2 View the equivalent code in;
. #LIST
. { #SHOCK$A314 }
. { #HEROES$B400 }
. { #JEWELS$C1FF }
. { #ANDROMEDA$6763 }
. { #WARLORD$AB97 }
. LIST#
D $C0D2 Print every object in the given place.
  $C0D2,$07 Look up the object locations.
N $C0D9 Search for the next object in this place.
@ $C0D9 label=FindObject_Loop
  $C0D9,$03 Return if the search did not find a match.
  $C0DC,$09 Keep the search and turn the match into an object index.
  $C0E5,$07 Call #R$C0C3 to fetch this object's description.
  $C0EC,$03 Call #R$BE2E to print the description and start a new line.
  $C0EF,$03 Restore the search from the stack.
  $C0F2,$06 Jump back to #R$C0D9 until all objects in the table have been
. checked.
N $C0F8 All matching objects have been printed.
  $C0F8,$01 Return.

c $C0F9 Handler: Display Room
@ $C0F9 label=Handler_DisplayRoom
E $C0F9 View the equivalent code in;
. #LIST
. { #SHOCK$A33A }
. { #HEROES$B46B }
. { #JEWELS$C26A }
. { #ANDROMEDA$678A }
. { #WARLORD$AC02 }
. LIST#
D $C0F9 On the first visit, show the picture and the long description, then list
. what is here and which ways lead out.
N $C0F9 Clear the screen, then show the room picture on a first visit.
  $C0F9,$01 Keep #REGde safe on the stack.
  $C0FA,$03 Call #R$BDEA to clear the screen.
  $C0FD,$01 Restore #REGde from the stack.
  $C0FE,$06 Jump to #R$C14F when room descriptions are switched off.
  $C104,$0E Search the picture list for this room. Jump to #R$C14F when it has
. no picture.
  $C112,$0A Jump to #R$C138 when this visit should show the picture.
  $C11C,$08 Find this room's visited flag.
@ $C120 label=Handler_DisplayRoom_Loop
  $C124,$05 This room's flag is in the next flag byte.
@ $C129 label=Handler_DisplayRoom_Next
  $C129,$08 Turn that bit number into a flag mask.
@ $C12D label=Handler_DisplayRoom_FlagBit
  $C131,$04 Jump to #R$C14F when this room has already been visited.
  $C135,$03 Mark this room as visited.
@ $C138 label=Handler_DisplayRoom_FirstVisit
  $C138,$0A Remember that the long description was shown, and set the text row
. to #N$08.
  $C142,$08 Call #R$C0C3 to fetch this room's picture handler.
  $C14A,$05 Return to #R$C14F afterwards and jump to that handler.
N $C14F Print the room description and work out the exits.
@ $C14F label=Handler_DisplayRoom_PrintDescription
  $C14F,$03 Call #R$BE06 to move the cursor to the text line stored at #R$BB40.
  $C152,$05 Set the text row to #N($18), under the picture.
  $C157,$0B Call #R$C0C3 to fetch this room's long description.
  $C162,$03 Call #R$BE2E to print the room description and start a new line.
  $C165,$07 Skip the key-wait unless the long description was just shown.
  $C16C,$05 Clear that flag and wait for a key.
N $C171 Count the number of exits in the room data.
@ $C171 label=Handler_DisplayRoom_ListExits
  $C171,$03 Call #R$C201 to fetch this room's six exits.
  $C174,$0E Count how many of the six exits leave this room.
@ $C17B label=Handler_DisplayRoom_CountExits
@ $C17F label=Handler_DisplayRoom_CountNext
  $C182,$03 Jump to #R$C1ED when there are no exits.
  $C185,$05 Jump to #R$C1AC when more than one exit is open.
  $C18A,$06 Print "#MESSAGE$BBBC".
  $C190,$09 Point back at the exits and the direction names for the one way out.
@ $C199 label=Handler_DisplayRoom_SkipClosed
  $C199,$08 Skip a closed exit and move on to the next way out.
@ $C19E label=Handler_DisplayRoom_OneExit
  $C1A1,$09 Call #R$BE21 to print the direction name.
  $C1AA,$02 Jump to #R$C1E7 to finish the exit sentence.
@ $C1AC label=Handler_DisplayRoom_ManyExits
  $C1AC,$06 Print "#MESSAGE$BBA9".
  $C1B2,$09 Point back at the exits and the direction names.
@ $C1BB label=Handler_DisplayRoom_NextExit
  $C1BB,$09 Exchange the exit list back into #REGhl and step to the next open
. way out.
@ $C1BC label=Handler_DisplayRoom_StepExit
@ $C1C1 label=Handler_DisplayRoom_ExitOpen
  $C1C4,$0A Call #R$BE21 to print the direction name.
  $C1CE,$06 Jump to #R$C1E7 when no exits remain.
  $C1D4,$02 Jump to #R$C1DE to join the last exit with "and".
  $C1D6,$05 Print a comma between the exits.
  $C1DB,$03 Jump back to #R$C1BB for the next exit.
@ $C1DE label=Handler_DisplayRoom_And
  $C1DE,$06 Print "#MESSAGE$BBA5".
  $C1E4,$03 Jump back to #R$C1BB for the next exit.
@ $C1E7 label=Handler_DisplayRoom_FullStop
  $C1E7,$06 Print "#MESSAGE$BCF9".
N $C1ED Are there any objects here?
@ $C1ED label=Handler_DisplayRoom_ListObjects
  $C1ED,$07 Call #R$BF69 to see whether this room holds anything. Return when it
. does not.
  $C1F4,$06 Print "#MESSAGE$BB96".
  $C1FA,$06 Call #R$C0D2 to list what is in this room.
N $C200 The exits and objects for this room are done.
  $C200,$01 Return.

c $C201 Get Room Pointer
@ $C201 label=GetRoomPointer
E $C201 View the equivalent code in;
. #LIST
. { #SHOCK$A41C }
. { #HEROES$B503 }
. { #JEWELS$C302 }
. { #ANDROMEDA$6892 }
. { #WARLORD$AC9A }
. LIST#
D $C201 Fetch the six exit bytes for the current room.
  $C201,$06 Fetch the current room into #REGde.
  $C207,$03 #REGhl=#N($0006,$04,$04).
  $C20A,$03 Call #SKOOLKID$30A9(HL_HLxDE).
  $C20D,$05 Add the table base to the offset.
  $C212,$01 Return.

c $C213 Parser: Resolve Phrase
@ $C213 label=Parser_ResolvePhrase
E $C213 View the equivalent code in;
. #LIST
. { #SHOCK$A591 }
. { #HEROES$B52B }
. { #JEWELS$C32A }
. { #ANDROMEDA$68A4 }
. { #WARLORD$AE36 }
. LIST#
D $C213 Turn a matched word into an object name, or say it cannot be seen.
  $C213,$0F Scan the phrase list for the end marker.
@ $C222 label=Parser_ResolvePhrase_Loop
  $C222,$01 Step to the next byte of the phrase.
@ $C223 label=Parser_ResolvePhrase_SkipMarker
  $C223,$04 Keep skipping while this byte is the marker being sought.
@ $C227 label=Parser_ResolvePhrase_Next
  $C227,$02 Repeat from #R$C223 until the phrase list is finished.
  $C229,$02 Jump to #R$C22C to test the first object.
@ $C22B label=Parser_ResolvePhrase_NextObject
  $C22B,$01 Step to the next object in the phrase.
@ $C22C label=Parser_ResolvePhrase_TestObject
  $C22C,$05 Return when this object is in this room.
  $C231,$06 Jump back to #R$C22B when the end of a phrase matches.
  $C237,$06 Print "#MESSAGE$BBED".
  $C23D,$07 Call #R$C0C3 to look up the object's name.
  $C244,$03 Call #R$BE21 to print the name.
  $C247,$06 Print "#MESSAGE$BBFA".
  $C24D,$01 Set the carry flag to reject the command.
  $C24E,$01 Return.

c $C24F Validate If Item Is Present
@ $C24F label=ValidateItemPresent
E $C24F View the equivalent code in;
. #LIST
. { #SHOCK$A5C6 }
. { #HEROES$B560 }
. { #JEWELS$C35F }
. { #ANDROMEDA$68E0 }
. { #WARLORD$AE6B }
. LIST#
D $C24F Set the zero flag when this object is in this room or in the scenic
. list.
R $C24F A Object ID
R $C24F O:F Z flag set if the object is available
  $C24F,$02 Stash #REGhl and #REGde on the stack.
  $C251,$03 Store the object ID in #REGde.
  $C254,$04 Jump to #R$C25D if this is a scenic object.
N $C258 Else check the regular objects.
  $C258,$03 #REGhl=#R$B9C8.
  $C25B,$02 Jump to #R$C262.
N $C25D Prepare object ID for use.
@ $C25D label=Objects_UseScenicTable
  $C25D,$02 Clear the scenic flag.
  $C25F,$03 #REGhl=#R$BA48.
N $C262 Both object types continue from here.
@ $C262 label=Objects_CheckLocation
  $C262,$01 Add the object ID to the object/ event locations table.
  $C263,$06 Jump to #R$C26C if the object/ event table states that it's located
. in *#R$BA9B(the current room). Note also sets/ unsets the Z flag accordingly.
N $C269 Check the players inventory, as an object can still be used if it's
. being held.
  $C269,$03 Lastly, set the Z flag if the item is in the players inventory.
@ $C26C label=Handler_Objects_Return
N $C26C Housekeeping; restore #REGde and #REGhl to their previous values.
  $C26C,$02 Restore #REGde and #REGhl from the stack.
  $C26E,$01 Return.

c $C26F Parser: Advance To Separator
@ $C26F label=Parser_AdvanceToSeparator
E $C26F View the equivalent code in;
. #LIST
. { #SHOCK$A5DB }
. { #HEROES$B575 }
. { #JEWELS$C37F }
. { #ANDROMEDA$6900 }
. { #WARLORD$AE80 }
. LIST#
D $C26F Walk a phrase from the word list. The zero flag is set when the typed
. words match it.
  $C26F,$03 Hand the typed tokens to the phrase walk.
@ $C272 label=Parser_AdvanceToSeparator_Loop
  $C272,$01 Advance to the next byte.
@ $C273 label=Parser_AdvanceToSeparator_Next
  $C273,$05 Compare against the typed tokens.
@ $C278 label=Parser_AdvanceToSeparator_Match
  $C278,$06 Advance through both phrases while the characters still match.
@ $C27A label=Parser_AdvanceToSeparator_Compare
  $C27E,$04 Jump to #R$C286 unless the end of a phrase matches.
  $C282,$03 Fetch the next phrase byte and test for the end marker.
  $C285,$01 Return.
@ $C286 label=Parser_AdvanceToSeparator_Alt
  $C286,$04 Jump to #R$C290 unless the alternative in a phrase matches.
  $C28A,$05 Jump back to #R$C272 if the end-of-list marker was not pressed.
  $C28F,$01 Return.
@ $C290 label=Parser_AdvanceToSeparator_SkipAlt
  $C290,$06 Jump to #R$C29C when the end of a phrase matches.
  $C296,$04 Jump back to #R$C290 unless the alternative in a phrase matches.
  $C29A,$02 Jump back to #R$C272 to try the phrase's other wording.
@ $C29C label=Parser_AdvanceToSeparator_Done
  $C29C,$01 Clear the carry flag; the phrase matched.
  $C29D,$01 Return.

c $C29E Parser: Find Phrase
@ $C29E label=Parser_FindPhrase
E $C29E View the equivalent code in;
. #LIST
. { #SHOCK$A60A }
. { #HEROES$B5A4 }
. { #JEWELS$C3AE }
. { #ANDROMEDA$692F }
. { #WARLORD$AEAF }
. LIST#
D $C29E Count how many of the typed tokens are real nouns.
  $C29E,$07 Start at the token buffer.
@ $C2A5 label=Parser_FindPhrase_Loop
  $C2A5,$05 Jump to #R$C2BB if the end-of-list marker was pressed.
  $C2AA,$0D Jump to #R$C2B8 if the search did not find a match.
  $C2B7,$01 Count one more match.
@ $C2B8 label=Parser_FindPhrase_Next
  $C2B8,$03 Repeat from #R$C2A5 for the remaining tokens.
@ $C2BB label=Parser_FindPhrase_Done
  $C2BB,$02 Test whether #REGe is zero.
  $C2BD,$01 Return.

c $C2BE Get Object Location
@ $C2BE label=GetObjectLocation
E $C2BE View the equivalent code in;
. #LIST
. { #SHOCK$A62C }
. { #HEROES$B5C6 }
. { #JEWELS$C3D0 }
. { #ANDROMEDA$694F }
. { #WARLORD$AED1 }
. LIST#
D $C2BE Return where this object is. #N$01 means it is being carried.
R $C2BE A Object number
R $C2BE O:A Location of the object
  $C2BE,$07 Jump to #R$C2CA when this is a scenic entry rather than an object.
  $C2C5,$05 Use the object locations and join the lookup.
@ $C2CA label=GetObjectLocation_Next
  $C2CA,$05 Clear the scenic marker and use the scenic list.
@ $C2CF label=GetObjectLocation_Index
  $C2CF,$02 Add the index to the base address.
  $C2D1,$01 Return.

c $C2D2 Is Object Carried?
@ $C2D2 label=IsObjectCarried
E $C2D2 View the equivalent code in;
. #LIST
. { #ANDROMEDA$6958 }
. LIST#
D $C2D2 Set the zero flag when this object is being carried.
  $C2D2,$03 Call #R$C2BE to fetch where the object is.
  $C2D5,$02 Compare the location with #N$01 (carried).
  $C2D7,$01 Return.

c $C2D8 Handler: Destroy Item
@ $C2D8 label=Handler_DestroyItem
E $C2D8 View the equivalent code in;
. #LIST
. { #SHOCK$A63B }
. { #HEROES$B5D5 }
. { #JEWELS$C3EA }
. { #WARLORD$AEE0 }
. LIST#
D $C2D8 Destroy an object by giving it location #N$00.
  $C2D8,$06 Call #R$BF55 to destroy the object.
  $C2DE,$01 Return.

c $C2DF Handler: Update Item For The Current Room
@ $C2DF label=Handler_UpdateItemForTheCurrentRoom
E $C2DF View the equivalent code in;
. #LIST
. { #SHOCK$A642 }
. { #HEROES$B5DC }
. { #JEWELS$C3F1 }
. { #WARLORD$AEE7 }
. LIST#
D $C2DF Put an object down in the room the player is standing in.
  $C2DF,$08 Call #R$BF55 to move the object to this room.
  $C2E7,$01 Return.

c $C2E8 Handler: Remove Item From Play
@ $C2E8 label=Handler_RemoveItemFromPlay
D $C2E8 Take an object out of the game by giving it location #N$FF.
  $C2E8,$06 Call #R$BF55 to take the object out of the game.
  $C2EE,$01 Return.

c $C2EF Parser: Skip Token
@ $C2EF label=Parser_SkipToken
D $C2EF Step through a phrase until the object it names is reached.
  $C2EF,$02 Start at the first byte of the phrase.
@ $C2F1 label=Parser_SkipToken_Loop
  $C2F1,$01 Step to the next byte of the phrase.
@ $C2F2 label=Parser_SkipToken_Next
  $C2F2,$05 Jump back to #R$C2F1 when the end of a phrase matches.
  $C2F7,$05 Jump back to #R$C2F1 unless the end of a phrase matches.
  $C2FC,$01 Fetch the next phrase byte into #REGa.
  $C2FD,$01 Return.

c $C2FE Parser: Validate No Direct Object
@ $C2FE label=Parser_ValidateNoDirectObject
E $C2FE View the equivalent code in;
. #LIST
. { #SHOCK$ABF4 }
. { #HEROES$B665 }
. { #JEWELS$C470 }
. { #ANDROMEDA$6972 }
. { #WARLORD$AF70 }
. LIST#
D $C2FE Set the carry flag, after asking for a rephrase, when a direct object
. was typed.
  $C2FE,$06 Return if the end-of-list marker was pressed.
N $C304 The command must not name an object.
  $C304,$03 Call #R$BDBE.
  $C307,$01 Set the carry flag to reject the command.
  $C308,$01 Return.

c $C309 Parser: Validate Direct Object
@ $C309 label=Parser_ValidateDirectObject
E $C309 View the equivalent code in;
. #LIST
. { #SHOCK$AC02 }
. { #HEROES$B670 }
. { #JEWELS$C47B }
. { #ANDROMEDA$697D }
. { #WARLORD$AF7B }
. LIST#
D $C309 Set the carry flag unless the command names exactly one object.
  $C309,$07 Jump to #R$C315 if the end-of-list marker was not pressed.
N $C310 The command names no object.
  $C310,$03 Call #R$BDC5.
  $C313,$01 Set the carry flag to reject the command.
  $C314,$01 Return.
@ $C315 label=DirectObject_Process
  $C315,$04 Call #R$C29E to count the nouns, and return when one was named.
N $C319 The named object is not valid for this command.
  $C319,$03 Call #R$BDBE.
  $C31C,$01 Set the carry flag to reject the command.
  $C31D,$01 Return.

c $C31E Parser: Match Or Rephrase
@ $C31E label=Parser_MatchOrRephrase
E $C31E View the equivalent code in;
. #LIST
. { #SHOCK$AC1D }
. { #HEROES$B685 }
. { #JEWELS$C490 }
. { #ANDROMEDA$6992 }
. { #WARLORD$AF90 }
. LIST#
D $C31E Allow a command with no object. Otherwise require the phrase to match.
  $C31E,$06 Return if the end-of-list marker was pressed.
  $C324,$04 Call #R$C29E to count the nouns, and return when one was named.
N $C328 The phrase does not match.
  $C328,$03 Call #R$BDBE.
  $C32B,$01 Set the carry flag to reject the command.
  $C32C,$01 Return.

c $C32D Parser: Validate Two Direct Objects
@ $C32D label=Parser_ValidateTwoDirectObjects
E $C32D View the equivalent code in;
. #LIST
. { #SHOCK$AC2F }
. { #HEROES$B694 }
. { #JEWELS$C49F }
. { #WARLORD$AF9F }
. LIST#
D $C32D Accept a command that names one or two objects, and reject the rest.
R $C32D O:F The carry flag is set when the command is malformed
  $C32D,$04 Return if the words after the verb are not valid for this command.
  $C331,$04 Jump to #R$C33A unless exactly one object was named.
N $C335 Only one object was named.
  $C335,$03 Call #R$BDC5.
  $C338,$01 Set the carry flag to reject the command.
  $C339,$01 Return.
N $C33A There are two or more valid direct objects in the user input.
@ $C33A label=ValidateTwoDirectObjects
  $C33A,$04 Jump to #R$C340 when three or more objects were named.
  $C33E,$01 Clear the carry flag; exactly two objects were named.
  $C33F,$01 Return.
N $C340 Too many objects were named.
@ $C340 label=ValidateTwoDirectObjects_TooMany
  $C340,$03 Call #R$BDBE.
  $C343,$01 Set the carry flag to reject the command.
  $C344,$01 Return.

c $C345 Save Game
@ $C345 label=SaveGame
E $C345 View the equivalent code in;
. #LIST
. { #SHOCK$9E80 }
. { #HEROES$AC6D }
. { #JEWELS$BB59 }
. { #ANDROMEDA$69A1 }
. { #WARLORD$A5CA }
. LIST#
D $C345 Ask for a tape and write the game state out.
  $C345,$06 Jump to #R$C364 when *#R$BB02 is zero, so there are no configurable
. exits to pack.
  $C34B,$0A Take the exit addresses and the save area.
N $C355 Move on to the next configurable-exit address.
@ $C355 label=SaveGame_Copy
  $C355,$05 Move #REGix on to the next exit address and #REGde on to the next
. packed exit byte.
@ $C35A label=SaveGame_StoreFlag
  $C35A,$0A Fetch the exit address from *#REGix into #REGhl, copy the exit byte
. into the packed save buffer, and repeat until every exit byte is packed.
N $C364 Print "#MESSAGE$BC48".
@ $C364 label=SaveGame_PrintSaving
  $C364,$09 Print "#MESSAGE$BC48" and wait for a key.
  $C36D,$04 Load the starting address into #REGix at #R$B9C8.
  $C371,$03 Set the block length in #REGde to #N$013C bytes.
  $C374,$02 Set #REGa to #N$FF which indicates this is a data block.
  $C376,$03 Call #SKOOLKID$04C2(SA_BYTES).
N $C379 Print "#MESSAGE$BC6A".
  $C379,$06 Print "#MESSAGE$BC6A".
  $C37F,$01 Return.

c $C380 Load From Tape
@ $C380 label=LoadTape
E $C380 View the equivalent code in;
. #LIST
. { #SHOCK$9EDB }
. { #HEROES$ACA8 }
. { #JEWELS$BB94 }
. { #ANDROMEDA$69DC }
. { #WARLORD$A605 }
. LIST#
D $C380 Ask for a tape and read a previously saved game state back in.
N $C380 Print "#MESSAGE$BC27".
  $C380,$06 Print "#MESSAGE$BC27".
  $C386,$04 Load the starting address into #REGix at #R$B9C8.
  $C38A,$03 Set the block length in #REGde to #N$013C bytes.
  $C38D,$02 Set #REGa to #N$FF which indicates this is a data block.
  $C38F,$01 Set the carry flag to indicate this is loading.
  $C390,$03 Call #SKOOLKID$0556(LD_BYTES).
  $C393,$02 Jump to #R$C39C when the load succeeded.
N $C395 Print "#MESSAGE$BC3C".
  $C395,$06 Print "#MESSAGE$BC3C".
  $C39B,$01 Return.
N $C39C There is nothing to unpack when no configurable exits were saved.
@ $C39C label=LoadTape_Success
  $C39C,$05 Return when *#R$BB02 is zero, so there are no configurable exits to
. unpack.
  $C3A1,$0A Take the exit addresses and the packed exit bytes.
N $C3AB The next saved exit address.
@ $C3AB label=LoadTape_Restore
  $C3AB,$05 Move #REGix on to the next exit address and #REGde on to the next
. packed exit byte.
@ $C3B0 label=LoadTape_StoreFlag
  $C3B0,$0A Fetch the exit address from *#REGix into #REGhl, write that packed
. exit byte back into the game, and repeat until every exit byte is restored.
  $C3BA,$05 Call #R$C0F9 to show the restored room.
  $C3BF,$01 Return.

c $C3C0 Print Input Prompt
@ $C3C0 label=PrintInputPrompt
E $C3C0 View the equivalent code in;
. #LIST
. { #HEROES$ACEA }
. { #JEWELS$BBD4 }
. { #ANDROMEDA$6A1C }
. { #WARLORD$A647 }
. LIST#
D $C3C0 Start a new line when the text window is not empty, then print the
. prompt.
  $C3C0,$08 Scan eight rows from the top of the screen.
  $C3C8,$01 Start with no text found.
@ $C3C9 label=PrintInputPrompt_Loop
  $C3C9,$04 Collect whether any of those rows already holds text.
  $C3CD,$03 Jump to #R$C3D5 when the text window is still empty.
  $C3D0,$05 Print a newline so the prompt starts on a fresh line.
@ $C3D5 label=PrintPrompt
  $C3D5,$06 Print "#MESSAGE$BB55".
  $C3DB,$01 Return.

c $C3DC Parser: Match Vocabulary
@ $C3DC label=Parser_MatchVocabulary
E $C3DC View the equivalent code in;
. #LIST
. { #HEROES$B6BC }
. { #JEWELS$C4C7 }
. { #WARLORD$AFC7 }
. LIST#
D $C3DC Check each typed token against the noun list and resolve its phrase.
  $C3DC,$05 Start at the token buffer.
@ $C3E1 label=Parser_MatchVocabulary_Loop
  $C3E1,$04 Return if the end-of-list marker was pressed.
  $C3E5,$0C Jump to #R$C3F5 if the search did not find a match.
  $C3F1,$04 Call #R$C213 to resolve the phrase and complain if it is not
. understood,
. and return if the comparison failed.
@ $C3F5 label=Parser_MatchVocabulary_Next
  $C3F5,$04 Repeat from #R$C3E1 for the remaining tokens.
  $C3F9,$01 Return.

c $C3FA Handler: Scenic Events
@ $C3FA label=Handler_ScenicEvents
E $C3FA View the equivalent code in;
. #LIST
. { #SHOCK$AC88 }
. { #HEROES$B6E0 }
. { #JEWELS$C4EB }
. { #ANDROMEDA$658A }
. { #WARLORD$AFEB }
. LIST#
D $C3FA If this room has a scenic event, run it.
  $C3FA,$07 Start at the scenic list.
@ $C401 label=Handler_ScenicEvents_Loop
  $C401,$07 Read the current room. Jump to #R$C42E if the search did not find a
. match.
  $C408,$0F Save the scenic search and turn the match into a handler index.
  $C417,$07 Call #R$C0C3 to fetch this room's scenic handler.
  $C41E,$05 Return to #R$C423 afterwards and jump to that handler.
  $C423,$0B Restore the scenic search and repeat while entries remain.
@ $C42E label=ScenicEvents_Return
  $C42E,$01 Return.

c $C42F Move Player To Room
@ $C42F label=MovePlayerToRoom
E $C42F View the equivalent code in;
. #LIST
. { #SHOCK$ACBD }
. { #JEWELS$C520 }
. { #ANDROMEDA$8E18 }
. { #WARLORD$B01F }
. LIST#
D $C42F Move the player to the given room and retarget any scenic events that
. watched the old room.
  $C42F,$0D Read the current room and the scenic list. Jump to #R$C43D to
. continue.
@ $C43C label=FindScenicEvents_Loop
  $C43C,$01 Step to the next scenic entry.
@ $C43D label=FindScenicEvents
  $C43D,$03 Jump to #R$C441 unless this scenic entry watched the old room.
  $C440,$01 Retarget this scenic entry to the new room.
@ $C441 label=FindScenicEvents_Next
  $C441,$02 Repeat from #R$C43C for the remaining scenic entries.
  $C443,$0A Remember the new room. Return when no event bits are set.
  $C44D,$08 Take the eight event bits and the objects they summon.
@ $C455 label=FollowingItems_Loop
  $C455,$01 Step to the next event object.
@ $C456 label=FollowingItems_CheckBit
  $C456,$04 Skip this object when its event bit is clear.
  $C45A,$05 Call #R$C2DF to move that event's object into this room.
  $C45F,$01 Switch back to the event scan.
@ $C460 label=FollowingItems_Next
  $C460,$02 Repeat from #R$C455 for the remaining event bits.
@ $C462 label=MovePlayerToRoom_Return
  $C462,$01 Return.

c $C463 Handler: Match Verb
@ $C463 label=Handler_MatchVerb
E $C463 View the equivalent code in;
. #LIST
. { #HEROES$B753 }
. { #JEWELS$C556 }
. { #ANDROMEDA$8D85 }
. { #WARLORD$B05E }
. LIST#
D $C463 Jump to the handler for the first vocabulary token, or admit the verb is
. unknown.
  $C463,$0E Jump to #R$C478 if the search found a match.
  $C471,$06 Print "#MESSAGE$BB61".
  $C477,$01 Return.
@ $C478 label=VerbMatched
  $C478,$0D Call #R$C0C3 to look up the verb's handler.
  $C485,$01 Jump to that handler.

c $C486 Pause, Print String And Scroll
@ $C486 label=PausePrintStringAndScroll
E $C486 View the equivalent code in;
. #LIST
. { #HEROES$B776 }
. { #JEWELS$C579 }
. { #WARLORD$B081 }
. LIST#
D $C486 Pause for a moment, then print the given message.
  $C486,$05 Call #R$BF41 to pause for a moment.
  $C48B,$03 Call #R$BE2E to print the message and start a new line.
  $C48E,$01 Return.

c $C48F Transform Item
@ $C48F label=TransformItem
E $C48F View the equivalent code in;
. #LIST
. { #SHOCK$A679 }
. { #HEROES$B613 }
. { #JEWELS$C426 }
. { #WARLORD$AF1E }
. LIST#
D $C48F Put the new object where the old one was, and clear the old one.
  $C48F,$04 Call #R$C2BE to fetch where the original object is.
  $C493,$07 Call #R$BF55 to clear the original object.
  $C49A,$02 Restore the new object and its destination from the stack.
  $C49C,$05 Call #R$BF55 to put the new object in its place.
  $C4A1,$01 Return.

t $C4A2 Messaging: "Some Food"
@ $C4A2 label=Messaging_SomeFood
  $C4A2,$0A "#MESSAGE$C4A2".
B $C4AC,$01 Terminator.

t $C4AD Messaging: "The Well Is Completely Dry"
@ $C4AD label=Messaging_TheWellIsCompletelyDry
  $C4AD,$1B "#MESSAGE$C4AD".
B $C4C8,$01 Terminator.

t $C4C9 Messaging: "A Silver Coin"
@ $C4C9 label=Messaging_ASilverCoin
  $C4C9,$0E "#MESSAGE$C4C9".
B $C4D7,$01 Terminator.

t $C4D8 Messaging: "A Bow"
@ $C4D8 label=Messaging_ABow
  $C4D8,$06 "#MESSAGE$C4D8".
B $C4DE,$01 Terminator.

t $C4DF Messaging: "Some Arrows"
@ $C4DF label=Messaging_SomeArrows
  $C4DF,$0C "#MESSAGE$C4DF".
B $C4EB,$01 Terminator.

t $C4EC Messaging: "It Looks Too Steep To Climb"
@ $C4EC label=Messaging_ItLooksTooSteepToClimb
  $C4EC,$1C "#MESSAGE$C4EC".
B $C508,$01 Terminator.

t $C509 Messaging: "A Pair Of Oars"
@ $C509 label=Messaging_APairOfOars
  $C509,$0F "#MESSAGE$C509".
B $C518,$01 Terminator.

t $C519 Messaging: "A Ring"
@ $C519 label=Messaging_ARing
  $C519,$07 "#MESSAGE$C519".
B $C520,$01 Terminator.

t $C521 Messaging: "A Rope"
@ $C521 label=Messaging_ARope
  $C521,$07 "#MESSAGE$C521".
B $C528,$01 Terminator.

t $C529 Messaging: "A Horn"
@ $C529 label=Messaging_AHorn
  $C529,$07 "#MESSAGE$C529".
B $C530,$01 Terminator.

t $C531 Messaging: "A Sword"
@ $C531 label=Messaging_ASword
  $C531,$08 "#MESSAGE$C531".
B $C539,$01 Terminator.

t $C53A Messaging: "A Chest"
@ $C53A label=Messaging_AChest
  $C53A,$08 "#MESSAGE$C53A".
B $C542,$01 Terminator.

t $C543 Messaging: "A Closed Chest"
@ $C543 label=Messaging_AClosedChest
  $C543,$0F "#MESSAGE$C543".
B $C552,$01 Terminator.

t $C553 Messaging: "An Open Chest Containing"
@ $C553 label=Messaging_AnOpenChestContaining
  $C553,$30 "#MESSAGE$C553".
B $C583,$01 Terminator.

t $C584 Messaging: "An Empty Chest"
@ $C584 label=Messaging_AnEmptyChest
  $C584,$0F "#MESSAGE$C584".
B $C593,$01 Terminator.

t $C594 Messaging: "The Crystals Of Vulcan"
@ $C594 label=Messaging_TheCrystalsOfVulcan
  $C594,$17 "#MESSAGE$C594".
B $C5AB,$01 Terminator.

t $C5AC Messaging: "A Key"
@ $C5AC label=Messaging_AKey
  $C5AC,$06 "#MESSAGE$C5AC".
B $C5B2,$01 Terminator.

t $C5B3 Messaging: "It Seems Too Wide"
@ $C5B3 label=Messaging_ItSeemsTooWide
  $C5B3,$21 "#MESSAGE$C5B3".
B $C5D4,$01 Terminator.

t $C5D5 Messaging: "The Body Of A Dead Elf"
@ $C5D5 label=Messaging_TheBodyOfADeadElf
  $C5D5,$17 "#MESSAGE$C5D5".
B $C5EC,$01 Terminator.

t $C5ED Messaging: "A Dragon"
@ $C5ED label=Messaging_ADragon
  $C5ED,$1D "#MESSAGE$C5ED".
B $C60A,$01 Terminator.

t $C60B Messaging: "A Dead Dragon"
@ $C60B label=Messaging_ADeadDragon
  $C60B,$0E "#MESSAGE$C60B".
B $C619,$01 Terminator.

t $C61A Messaging: "A Dead Flying Lizard"
@ $C61A label=Messaging_ADeadFlyingLizard
  $C61A,$15 "#MESSAGE$C61A".
B $C62F,$01 Terminator.

t $C630 Messaging: "Some Dead Wolves"
@ $C630 label=Messaging_SomeDeadWolves
  $C630,$11 "#MESSAGE$C630".
B $C641,$01 Terminator.

t $C642 Messaging: "The Body Of A Wood Nymph"
@ $C642 label=Messaging_TheBodyOfAWoodNymph
  $C642,$19 "#MESSAGE$C642".
B $C65B,$01 Terminator.

t $C65C Messaging: "A Rowing Boat"
@ $C65C label=Messaging_ARowingBoat
  $C65C,$0E "#MESSAGE$C65C".
B $C66A,$01 Terminator.

t $C66B Messaging: "A Monster From The Slime"
@ $C66B label=Messaging_AMonsterFromTheSlime
  $C66B,$19 "#MESSAGE$C66B".
B $C684,$01 Terminator.

t $C685 Messaging: "SPARE"
@ $C685 label=Messaging_SPARE
  $C685,$05 "#MESSAGE$C685".
B $C68A,$01 Terminator.

t $C68B Messaging: "The Current Is Very Strong"
@ $C68B label=Messaging_TheCurrentIsVeryStrong
  $C68B,$1B "#MESSAGE$C68B".
B $C6A6,$01 Terminator.

t $C6A7 Messaging: "A Projection Of Rock"
@ $C6A7 label=Messaging_AProjectionOfRock
  $C6A7,$37 "#MESSAGE$C6A7".
B $C6DE,$01 Terminator.

t $C6DF Messaging: "A Projection Of Rock With A Rope"
@ $C6DF label=Messaging_AProjectionOfRockWithARope
  $C6DF,$54 "#MESSAGE$C6DF".
B $C733,$01 Terminator.

t $C734 Messaging: "The Once Beautiful Buildings,"
@ $C734 label=Messaging_TheOnceBeautifulBuildings
  $C734,$2F "#MESSAGE$C734".
B $C763,$01 Terminator.

t $C764 Messaging: "The Blacksmith"
@ $C764 label=Messaging_TheBlacksmith
  $C764,$99 "#MESSAGE$C764".
B $C7FD,$01 Terminator.

t $C7FE Messaging: "The Blacksmith After Forging The Sword"
@ $C7FE label=Messaging_TheBlacksmithAfterForgingTheSword
  $C7FE,$0F "#MESSAGE$C7FE".
B $C80D,$01 Terminator.

t $C80E Messaging: "The Body Of The Blacksmith"
@ $C80E label=Messaging_TheBodyOfTheBlacksmith
  $C80E,$1B "#MESSAGE$C80E".
B $C829,$01 Terminator.

t $C82A Messaging: "The Flames From The"
@ $C82A label=Messaging_TheFlamesFromThe
  $C82A,$23 "#MESSAGE$C82A".
B $C84D,$01 Terminator.

t $C84E Messaging: "Some Demons Are Attacking You"
@ $C84E label=Messaging_SomeDemonsAreAttackingYou
  $C84E,$50 "#MESSAGE$C84E".
B $C89E,$01 Terminator.

t $C89F Messaging: "The Wizard,Zarn"
@ $C89F label=Messaging_TheWizardZarn
  $C89F,$36 "#MESSAGE$C89F".
B $C8D5,$01 Terminator.

t $C8D6 Messaging: "The Body Of The Wizard"
@ $C8D6 label=Messaging_TheBodyOfTheWizard
  $C8D6,$17 "#MESSAGE$C8D6".
B $C8ED,$01 Terminator.

t $C8EE Messaging: "The Princess,Mara"
@ $C8EE label=Messaging_ThePrincessMara
  $C8EE,$12 "#MESSAGE$C8EE".
B $C900,$01 Terminator.

t $C901 Messaging: "The Body Of The Princess"
@ $C901 label=Messaging_TheBodyOfThePrincess
  $C901,$19 "#MESSAGE$C901".
B $C91A,$01 Terminator.

t $C91B Messaging: "The Witch"
@ $C91B label=Messaging_TheWitch
  $C91B,$0A "#MESSAGE$C91B".
B $C925,$01 Terminator.

t $C926 Messaging: "The Old Man"
@ $C926 label=Messaging_TheOldMan
  $C926,$8A "#MESSAGE$C926".
B $C9B0,$01 Terminator.

t $C9B1 Messaging: "Spare Object Slots After The Old Man"
@ $C9B1 label=Messaging_SpareObjectSlotsAfterTheOldMan
  $C9B1,$05 "#MESSAGE$C9B1".
B $C9B6,$01 Terminator.

t $C9B7 Messaging: "A Glowing Rock"
@ $C9B7 label=Messaging_AGlowingRock
  $C9B7,$0F "#MESSAGE$C9B7".
B $C9C6,$01 Terminator.

t $C9C7 Messaging: "A Dead Warrior"
@ $C9C7 label=Messaging_ADeadWarrior
  $C9C7,$0F "#MESSAGE$C9C7".
B $C9D6,$01 Terminator.

t $C9D7 Messaging: "An Open Door"
@ $C9D7 label=Messaging_AnOpenDoor
  $C9D7,$0D "#MESSAGE$C9D7".
B $C9E4,$01 Terminator.

t $C9E5 Messaging: "A Closed Door"
@ $C9E5 label=Messaging_AClosedDoor
  $C9E5,$0E "#MESSAGE$C9E5".
B $C9F3,$01 Terminator.

t $C9F4 Messaging: "A Giant Spider"
@ $C9F4 label=Messaging_AGiantSpider
  $C9F4,$27 "#MESSAGE$C9F4".
B $CA1B,$01 Terminator.

t $CA1C Messaging: "The Body Of A Giant Spider"
@ $CA1C label=Messaging_TheBodyOfAGiantSpider
  $CA1C,$1B "#MESSAGE$CA1C".
B $CA37,$01 Terminator.

t $CA38 Messaging: "A Ring,Which You Are Wearing"
@ $CA38 label=Messaging_ARingWhichYouAreWearing
  $CA38,$1D "#MESSAGE$CA38".
B $CA55,$01 Terminator.

t $CA56 Messaging: "A Log"
@ $CA56 label=Messaging_ALog
  $CA56,$06 "#MESSAGE$CA56".
B $CA5C,$01 Terminator.

t $CA5D Messaging: "A Log,Bridging The Chasm"
@ $CA5D label=Messaging_ALogBridgingTheChasm
  $CA5D,$19 "#MESSAGE$CA5D".
B $CA76,$01 Terminator.

t $CA77 Messaging: "Spare Object Slot After The Log Bridge"
@ $CA77 label=Messaging_SpareObjectSlotAfterTheLogBridge
  $CA77,$05 "#MESSAGE$CA77".
B $CA7C,$01 Terminator.

t $CA7D Messaging: "You Are Seriously Injured"
@ $CA7D label=Messaging_YouAreSeriouslyInjured
  $CA7D,$1A "#MESSAGE$CA7D".
B $CA97,$01 Terminator.

t $CA98 Messaging: "You Are Sweating Profusely"
@ $CA98 label=Messaging_YouAreSweatingProfusely
  $CA98,$3B "#MESSAGE$CA98".
B $CAD3,$01 Terminator.

t $CAD4 Messaging: "Inside The Farmhouse"
@ $CAD4 label=Messaging_InsideTheFarmhouse
  $CAD4,$15 "#MESSAGE$CAD4".
B $CAE9,$01 Terminator.

t $CAEA Messaging: "At A Large Farmhouse"
@ $CAEA label=Messaging_AtALargeFarmhouse
  $CAEA,$30 "#MESSAGE$CAEA".
B $CB1A,$01 Terminator.

t $CB1B Messaging: "On A Long Farm Track"
@ $CB1B label=Messaging_OnALongFarmTrack
  $CB1B,$41 "#MESSAGE$CB1B".
B $CB5C,$01 Terminator.

t $CB5D Messaging: "The Great Valley"
@ $CB5D label=Messaging_TheGreatValley
  $CB5D,$2D "#MESSAGE$CB5D".
B $CB8A,$01 Terminator.

t $CB8B Messaging: "The Vale Of Shadows"
@ $CB8B label=Messaging_TheValeOfShadows
  $CB8B,$67 "#MESSAGE$CB8B".
B $CBF2,$01 Terminator.

t $CBF3 Messaging: "In The Forest"
@ $CBF3 label=Messaging_InTheForest
  $CBF3,$20 "#MESSAGE$CBF3".
B $CC13,$01 Terminator.

t $CC14 Messaging: "The Leafy Glade"
@ $CC14 label=Messaging_TheLeafyGlade
  $CC14,$3F "#MESSAGE$CC14".
B $CC53,$01 Terminator.

t $CC54 Messaging: "The Woodman's Clearing"
@ $CC54 label=Messaging_TheWoodmansClearing
  $CC54,$17 "#MESSAGE$CC54".
B $CC6B,$01 Terminator.

t $CC6C Messaging: "At The Woodman's Hut"
@ $CC6C label=Messaging_AtTheWoodmansHut
  $CC6C,$15 "#MESSAGE$CC6C".
B $CC81,$01 Terminator.

t $CC82 Messaging: "Inside The Woodman's Hut"
@ $CC82 label=Messaging_InsideTheWoodmansHut
  $CC82,$40 "#MESSAGE$CC82".
B $CCC2,$01 Terminator.

t $CCC3 Messaging: "A Burned Out Farm"
@ $CCC3 label=Messaging_ABurnedOutFarm
  $CCC3,$12 "#MESSAGE$CCC3".
B $CCD5,$01 Terminator.

t $CCD6 Messaging: "An Overgrown Fruit Grove"
@ $CCD6 label=Messaging_AnOvergrownFruitGrove
  $CCD6,$47 "#MESSAGE$CCD6".
B $CD1D,$01 Terminator.

t $CD1E Messaging: "On A Forest Path"
@ $CD1E label=Messaging_OnAForestPath
  $CD1E,$11 "#MESSAGE$CD1E".
B $CD2F,$01 Terminator.

t $CD30 Messaging: "The Western Edge Of A Chasm"
@ $CD30 label=Messaging_TheWesternEdgeOfAChasm
  $CD30,$1C "#MESSAGE$CD30".
B $CD4C,$01 Terminator.

t $CD4D Messaging: "The Eastern Edge Of A Chasm"
@ $CD4D label=Messaging_TheEasternEdgeOfAChasm
  $CD4D,$1C "#MESSAGE$CD4D".
B $CD69,$01 Terminator.

t $CD6A Messaging: "The Brink Of A Precipice"
@ $CD6A label=Messaging_TheBrinkOfAPrecipice
  $CD6A,$30 "#MESSAGE$CD6A".
B $CD9A,$01 Terminator.

t $CD9B Messaging: "The Old Well"
@ $CD9B label=Messaging_TheOldWell
  $CD9B,$29 "#MESSAGE$CD9B".
B $CDC4,$01 Terminator.

t $CDC5 Messaging: "The Wooded Vale"
@ $CDC5 label=Messaging_TheWoodedVale
  $CDC5,$10 "#MESSAGE$CDC5".
B $CDD5,$01 Terminator.

t $CDD6 Messaging: "The Western Bank"
@ $CDD6 label=Messaging_TheWesternBank
  $CDD6,$22 "#MESSAGE$CDD6".
B $CDF8,$01 Terminator.

t $CDF9 Messaging: "The Eastern Bank"
@ $CDF9 label=Messaging_TheEasternBank
  $CDF9,$22 "#MESSAGE$CDF9".
B $CE1B,$01 Terminator.

t $CE1C Messaging: "The Swamp"
@ $CE1C label=Messaging_TheSwamp
  $CE1C,$30 "#MESSAGE$CE1C".
B $CE4C,$01 Terminator.

t $CE4D Messaging: "In The Boat"
@ $CE4D label=Messaging_InTheBoat
  $CE4D,$0C "#MESSAGE$CE4D".
B $CE59,$01 Terminator.

t $CE5A Messaging: "The Pit Of Oozing Slime"
@ $CE5A label=Messaging_ThePitOfOozingSlime
  $CE5A,$18 "#MESSAGE$CE5A".
B $CE72,$01 Terminator.

t $CE73 Messaging: "On An Open Plain"
@ $CE73 label=Messaging_OnAnOpenPlain
  $CE73,$29 "#MESSAGE$CE73".
B $CE9C,$01 Terminator.

t $CE9D Messaging: "On A High Plateau"
@ $CE9D label=Messaging_OnAHighPlateau
  $CE9D,$2D "#MESSAGE$CE9D".
B $CECA,$01 Terminator.

t $CECB Messaging: "On Marshy Ground"
@ $CECB label=Messaging_OnMarshyGround
  $CECB,$11 "#MESSAGE$CECB".
B $CEDC,$01 Terminator.

t $CEDD Messaging: "The Enchanted Wood"
@ $CEDD label=Messaging_TheEnchantedWood
  $CEDD,$2B "#MESSAGE$CEDD".
B $CF08,$01 Terminator.

t $CF09 Messaging: "On A Rocky Outcrop"
@ $CF09 label=Messaging_OnARockyOutcrop
  $CF09,$13 "#MESSAGE$CF09".
B $CF1C,$01 Terminator.

t $CF1D Messaging: "The Forest Of Sighs"
@ $CF1D label=Messaging_TheForestOfSighs
  $CF1D,$27 "#MESSAGE$CF1D".
B $CF44,$01 Terminator.

t $CF45 Messaging: "In A Tangle Of"
@ $CF45 label=Messaging_InATangleOf
  $CF45,$25 "#MESSAGE$CF45".
B $CF6A,$01 Terminator.

t $CF6B Messaging: "At The Bottom Of The Precipice"
@ $CF6B label=Messaging_AtTheBottomOfThePrecipice
  $CF6B,$1F "#MESSAGE$CF6B".
B $CF8A,$01 Terminator.

t $CF8B Messaging: "In Wildmoor Woods"
@ $CF8B label=Messaging_InWildmoorWoods
  $CF8B,$12 "#MESSAGE$CF8B".
B $CF9D,$01 Terminator.

t $CF9E Messaging: "In The Forest Of Night"
@ $CF9E label=Messaging_InTheForestOfNight
  $CF9E,$42 "#MESSAGE$CF9E".
B $CFE0,$01 Terminator.

t $CFE1 Messaging: "At The Witch's Hovel"
@ $CFE1 label=Messaging_AtTheWitchsHovel
  $CFE1,$2A "#MESSAGE$CFE1".
B $D00B,$01 Terminator.

t $D00C Messaging: "Inside The Witch's Hovel"
@ $D00C label=Messaging_InsideTheWitchsHovel
  $D00C,$19 "#MESSAGE$D00C".
B $D025,$01 Terminator.

t $D026 Messaging: "A Rock Wall"
@ $D026 label=Messaging_ARockWall
  $D026,$0C "#MESSAGE$D026".
B $D032,$01 Terminator.

t $D033 Messaging: "The Plain Of Marl"
@ $D033 label=Messaging_ThePlainOfMarl
  $D033,$2C "#MESSAGE$D033".
B $D05F,$01 Terminator.

t $D060 Messaging: "At The Blacksmith's Forge"
@ $D060 label=Messaging_AtTheBlacksmithsForge
  $D060,$1A "#MESSAGE$D060".
B $D07A,$01 Terminator.

t $D07B Messaging: "Inside The Forge"
@ $D07B label=Messaging_InsideTheForge
  $D07B,$11 "#MESSAGE$D07B".
B $D08C,$01 Terminator.

t $D08D Messaging: "At The Base Of A Volcano"
@ $D08D label=Messaging_AtTheBaseOfAVolcano
  $D08D,$36 "#MESSAGE$D08D".
B $D0C3,$01 Terminator.

t $D0C4 Messaging: "On A Narrow Ledge On The"
@ $D0C4 label=Messaging_OnANarrowLedgeOnThe
  $D0C4,$2D "#MESSAGE$D0C4".
B $D0F1,$01 Terminator.

t $D0F2 Messaging: "The Cavern Of Silence"
@ $D0F2 label=Messaging_TheCavernOfSilence
  $D0F2,$16 "#MESSAGE$D0F2".
B $D108,$01 Terminator.

t $D109 Messaging: "The Top Of The Volcano"
@ $D109 label=Messaging_TheTopOfTheVolcano
  $D109,$35 "#MESSAGE$D109".
B $D13E,$01 Terminator.

t $D13F Messaging: "Inside The Volcano"
@ $D13F label=Messaging_InsideTheVolcano
  $D13F,$4D "#MESSAGE$D13F".
B $D18C,$01 Terminator.

t $D18D Messaging: "In A Rock Passage"
@ $D18D label=Messaging_InARockPassage
  $D18D,$2D "#MESSAGE$D18D".
B $D1BA,$01 Terminator.

t $D1BB Messaging: "In The Great Hall Of Zarn"
@ $D1BB label=Messaging_InTheGreatHallOfZarn
  $D1BB,$1A "#MESSAGE$D1BB".
B $D1D5,$01 Terminator.

t $D1D6 Messaging: "In A High Tower"
@ $D1D6 label=Messaging_InAHighTower
  $D1D6,$27 "#MESSAGE$D1D6".
B $D1FD,$01 Terminator.

t $D1FE Messaging: "The Dungeon"
@ $D1FE label=Messaging_TheDungeon
  $D1FE,$2D "#MESSAGE$D1FE".
B $D22B,$01 Terminator.

t $D22C Messaging: "Marl's Gateway"
@ $D22C label=Messaging_MarlsGateway
  $D22C,$0F "#MESSAGE$D22C".
B $D23B,$01 Terminator.

t $D23C Messaging: "Any Food"
@ $D23C label=Messaging_AnyFood
  $D23C,$08 "#MESSAGE$D23C".
B $D244,$01 Terminator.

t $D245 Messaging: "Any Water"
@ $D245 label=Messaging_AnyWater
  $D245,$09 "#MESSAGE$D245".
B $D24E,$01 Terminator.

t $D24F Messaging: "A Coin"
@ $D24F label=Messaging_ACoin
  $D24F,$06 "#MESSAGE$D24F".
B $D255,$01 Terminator.

t $D256 Messaging: "A Bow Noun Match"
@ $D256 label=Messaging_ABow_NounMatch
  $D256,$05 "#MESSAGE$D256".
B $D25B,$01 Terminator.

t $D25C Messaging: "Any Arrows"
@ $D25C label=Messaging_AnyArrows
  $D25C,$0A "#MESSAGE$D25C".
B $D266,$01 Terminator.

t $D267 Messaging: "A Ring Noun Match"
@ $D267 label=Messaging_ARing_NounMatch
  $D267,$06 "#MESSAGE$D267".
B $D26D,$01 Terminator.

t $D26E Messaging: "A Rope Noun Match"
@ $D26E label=Messaging_ARope_NounMatch
  $D26E,$06 "#MESSAGE$D26E".
B $D274,$01 Terminator.

t $D275 Messaging: "A Log Noun Match"
@ $D275 label=Messaging_ALog_NounMatch
  $D275,$05 "#MESSAGE$D275".
B $D27A,$01 Terminator.

t $D27B Messaging: "A Well"
@ $D27B label=Messaging_AWell
  $D27B,$06 "#MESSAGE$D27B".
B $D281,$01 Terminator.

t $D282 Messaging: "A Horn Noun Match"
@ $D282 label=Messaging_AHorn_NounMatch
  $D282,$06 "#MESSAGE$D282".
B $D288,$01 Terminator.

t $D289 Messaging: "A Sword Noun Match"
@ $D289 label=Messaging_ASword_NounMatch
  $D289,$07 "#MESSAGE$D289".
B $D290,$01 Terminator.

t $D291 Messaging: "A Chest Noun Match"
@ $D291 label=Messaging_AChest_NounMatch
  $D291,$07 "#MESSAGE$D291".
B $D298,$01 Terminator.

t $D299 Messaging: "Any Crystals"
@ $D299 label=Messaging_AnyCrystals
  $D299,$0C "#MESSAGE$D299".
B $D2A5,$01 Terminator.

t $D2A6 Messaging: "A Key Noun Match"
@ $D2A6 label=Messaging_AKey_NounMatch
  $D2A6,$05 "#MESSAGE$D2A6".
B $D2AB,$01 Terminator.

t $D2AC Messaging: "A Chasm"
@ $D2AC label=Messaging_AChasm
  $D2AC,$07 "#MESSAGE$D2AC".
B $D2B3,$01 Terminator.

t $D2B4 Messaging: "An Elf"
@ $D2B4 label=Messaging_AnElf
  $D2B4,$06 "#MESSAGE$D2B4".
B $D2BA,$01 Terminator.

t $D2BB Messaging: "A Dragon Noun Match"
@ $D2BB label=Messaging_ADragon_NounMatch
  $D2BB,$08 "#MESSAGE$D2BB".
B $D2C3,$01 Terminator.

t $D2C4 Messaging: "A Lizard"
@ $D2C4 label=Messaging_ALizard
  $D2C4,$08 "#MESSAGE$D2C4".
B $D2CC,$01 Terminator.

t $D2CD Messaging: "Any Wolves"
@ $D2CD label=Messaging_AnyWolves
  $D2CD,$0A "#MESSAGE$D2CD".
B $D2D7,$01 Terminator.

t $D2D8 Messaging: "A Nymph"
@ $D2D8 label=Messaging_ANymph
  $D2D8,$07 "#MESSAGE$D2D8".
B $D2DF,$01 Terminator.

t $D2E0 Messaging: "A Centaur"
@ $D2E0 label=Messaging_ACentaur
  $D2E0,$09 "#MESSAGE$D2E0".
B $D2E9,$01 Terminator.

t $D2EA Messaging: "A Boat"
@ $D2EA label=Messaging_ABoat
  $D2EA,$06 "#MESSAGE$D2EA".
B $D2F0,$01 Terminator.

t $D2F1 Messaging: "A Monster"
@ $D2F1 label=Messaging_AMonster
  $D2F1,$09 "#MESSAGE$D2F1".
B $D2FA,$01 Terminator.

t $D2FB Messaging: "A Hut"
@ $D2FB label=Messaging_AHut
  $D2FB,$05 "#MESSAGE$D2FB".
B $D300,$01 Terminator.

t $D301 Messaging: "A Hovel"
@ $D301 label=Messaging_AHovel
  $D301,$07 "#MESSAGE$D301".
B $D308,$01 Terminator.

t $D309 Messaging: "A Spider"
@ $D309 label=Messaging_ASpider
  $D309,$08 "#MESSAGE$D309".
B $D311,$01 Terminator.

t $D312 Messaging: "A River"
@ $D312 label=Messaging_ARiver
  $D312,$07 "#MESSAGE$D312".
B $D319,$01 Terminator.

t $D31A Messaging: "A Precipice"
@ $D31A label=Messaging_APrecipice
  $D31A,$0B "#MESSAGE$D31A".
B $D325,$01 Terminator.

t $D326 Messaging: "A Projection"
@ $D326 label=Messaging_AProjection
  $D326,$0C "#MESSAGE$D326".
B $D332,$01 Terminator.

t $D333 Messaging: "A Body"
@ $D333 label=Messaging_ABody
  $D333,$06 "#MESSAGE$D333".
B $D339,$01 Terminator.

t $D33A Messaging: "A Farmhouse"
@ $D33A label=Messaging_AFarmhouse
  $D33A,$0B "#MESSAGE$D33A".
B $D345,$01 Terminator.

t $D346 Messaging: "Any Oars"
@ $D346 label=Messaging_AnyOars
  $D346,$08 "#MESSAGE$D346".
B $D34E,$01 Terminator.

t $D34F Messaging: "A Blacksmith"
@ $D34F label=Messaging_ABlacksmith
  $D34F,$0C "#MESSAGE$D34F".
B $D35B,$01 Terminator.

t $D35C Messaging: "A Forge"
@ $D35C label=Messaging_AForge
  $D35C,$07 "#MESSAGE$D35C".
B $D363,$01 Terminator.

t $D364 Messaging: "Any Demons"
@ $D364 label=Messaging_AnyDemons
  $D364,$0A "#MESSAGE$D364".
B $D36E,$01 Terminator.

t $D36F Messaging: "The Wizard"
@ $D36F label=Messaging_TheWizard
  $D36F,$0A "#MESSAGE$D36F".
B $D379,$01 Terminator.

t $D37A Messaging: "The Princess"
@ $D37A label=Messaging_ThePrincess
  $D37A,$0C "#MESSAGE$D37A".
B $D386,$01 Terminator.

t $D387 Messaging: "A Witch"
@ $D387 label=Messaging_AWitch
  $D387,$07 "#MESSAGE$D387".
B $D38E,$01 Terminator.

t $D38F Messaging: "The Old Man Noun Match"
@ $D38F label=Messaging_TheOldMan_NounMatch
  $D38F,$0B "#MESSAGE$D38F".
B $D39A,$01 Terminator.

t $D39B Messaging: "A Rock"
@ $D39B label=Messaging_ARock
  $D39B,$06 "#MESSAGE$D39B".
B $D3A1,$01 Terminator.

t $D3A2 Messaging: "A Korl Warrior"
@ $D3A2 label=Messaging_AKorlWarrior
  $D3A2,$0E "#MESSAGE$D3A2".
B $D3B0,$01 Terminator.

t $D3B1 Messaging: "A Door"
@ $D3B1 label=Messaging_ADoor
  $D3B1,$06 "#MESSAGE$D3B1".
B $D3B7,$01 Terminator.

g $D3B8 Table: Object Descriptions
@ $D3B8 label=Table_ObjectDescriptions
E $D3B8 View the equivalent code in;
. #LIST
. { #SHOCK$AFDD }
. { #HEROES$CD58 }
. { #JEWELS$D34E }
. { #ANDROMEDA$84E6 }
. { #WARLORD$C732 }
. LIST#
D $D3B8 #N$4A pointers to the object messages. Indexed with the count
. stored at *#R$BAF8.
W $D3B8,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D3B8,$02,$4A

g $D44C Table: Room Descriptions
@ $D44C label=Table_RoomDescriptions
E $D44C View the equivalent code in;
. #LIST
. { #SHOCK$AE7D }
. { #HEROES$CE66 }
. { #JEWELS$D3EC }
. { #ANDROMEDA$8568 }
. { #WARLORD$C8B0 }
. LIST#
D $D44C One pointer per room. Room #N$00 and room #N$01 are unused.
. The starting room is #N($05), The Great Valley.
W $D44C,$02 #IF(#PEEK(#PC)+#PEEK(#PC+$01)==$00)(Unused.,#R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).)
L $D44C,$02,$4D

g $D4E6 Table: Nouns
@ $D4E6 label=Table_Nouns
D $D4E6 #N$2A pointers to the noun phrases the parser matches.
W $D4E6,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D4E6,$02,$2A

t $D53A Messaging: "Congratulations"
@ $D53A label=Messaging_Congratulations
  $D53A,$CD "#MESSAGE$D53A".
B $D607,$01 Terminator.

t $D608 Messaging: "You Open The Chest,Revealing"
@ $D608 label=Messaging_YouOpenTheChestRevealing
  $D608,$3B "#MESSAGE$D608".
B $D643,$01 Terminator.

t $D644 Messaging: "The Wood Nymph Leaves You"
@ $D644 label=Messaging_TheWoodNymphLeavesYou
  $D644,$41 "#MESSAGE$D644".
B $D685,$01 Terminator.

t $D686 Messaging: "The Spider Spins A Web"
@ $D686 label=Messaging_TheSpiderSpinsAWeb
  $D686,$2F "#MESSAGE$D686".
B $D6B5,$01 Terminator.

t $D6B6 Messaging: "The Monster Engulfs And"
@ $D6B6 label=Messaging_TheMonsterEngulfsAnd
  $D6B6,$29 "#MESSAGE$D6B6".
B $D6DF,$01 Terminator.

t $D6E0 Messaging: "The Demons Make A Determined"
@ $D6E0 label=Messaging_TheDemonsMakeADetermined
  $D6E0,$35 "#MESSAGE$D6E0".
B $D715,$01 Terminator.

t $D716 Messaging: "The Wizard Completes His Spell"
@ $D716 label=Messaging_TheWizardCompletesHisSpell
  $D716,$3C "#MESSAGE$D716".
B $D752,$01 Terminator.

t $D753 Messaging: "An Elf Attacks You"
@ $D753 label=Messaging_AnElfAttacksYou
  $D753,$14 "#MESSAGE$D753".
B $D767,$01 Terminator.

t $D768 Messaging: "But You Are Too Fast And"
@ $D768 label=Messaging_ButYouAreTooFastAnd
  $D768,$2C "#MESSAGE$D768".
B $D794,$01 Terminator.

t $D795 Messaging: "You Were Caught By Surprise"
@ $D795 label=Messaging_YouWereCaughtBySurprise
  $D795,$3B "#MESSAGE$D795".
B $D7D0,$01 Terminator.

t $D7D1 Messaging: "A Flying Lizard Attacks You"
@ $D7D1 label=Messaging_AFlyingLizardAttacksYou
  $D7D1,$1D "#MESSAGE$D7D1".
B $D7EE,$01 Terminator.

t $D7EF Messaging: "But You Deftly Avoid The"
@ $D7EF label=Messaging_ButYouDeftlyAvoidThe
  $D7EF,$33 "#MESSAGE$D7EF".
B $D822,$01 Terminator.

t $D823 Messaging: "You Move Too Slowly"
@ $D823 label=Messaging_YouMoveTooSlowly
  $D823,$29 "#MESSAGE$D823".
B $D84C,$01 Terminator.

t $D84D Messaging: "A Centaur Appears"
@ $D84D label=Messaging_ACentaurAppears
  $D84D,$13 "#MESSAGE$D84D".
B $D860,$01 Terminator.

t $D861 Messaging: "It Sees You,Then Gallops Off"
@ $D861 label=Messaging_ItSeesYouThenGallopsOff
  $D861,$1D "#MESSAGE$D861".
B $D87E,$01 Terminator.

t $D87F Messaging: "The Old Man Appears"
@ $D87F label=Messaging_TheOldManAppears
  $D87F,$15 "#MESSAGE$D87F".
B $D894,$01 Terminator.

t $D895 Messaging: "He Says"
@ $D895 label=Messaging_HeSays
  $D895,$33 "#MESSAGE$D895".
B $D8C8,$01 Terminator.

t $D8C9 Messaging: "He Says Seek The Smith To Fashion The Hellblade"
@ $D8C9 label=Messaging_HeSaysSeekTheSmithToFashionTheHellblade
  $D8C9,$73 "#MESSAGE$D8C9".
B $D93C,$01 Terminator.

t $D93D Messaging: "He Suddenly Vanishes"
@ $D93D label=Messaging_HeSuddenlyVanishes
  $D93D,$15 "#MESSAGE$D93D".
B $D952,$01 Terminator.

t $D953 Messaging: "You Catch A Fleeting Glimpse Of A Wood Nymph"
@ $D953 label=Messaging_YouCatchAFleetingGlimpseOfAWoodNymph
  $D953,$4D "#MESSAGE$D953".
B $D9A0,$01 Terminator.

t $D9A1 Messaging: "She Darts Out Of Sight As"
@ $D9A1 label=Messaging_SheDartsOutOfSightAs
  $D9A1,$2E "#MESSAGE$D9A1".
B $D9CF,$01 Terminator.

t $D9D0 Messaging: "A Wood Nymph Appears"
@ $D9D0 label=Messaging_AWoodNymphAppears
  $D9D0,$16 "#MESSAGE$D9D0".
B $D9E6,$01 Terminator.

t $D9E7 Messaging: "She Kneels Beside You And"
@ $D9E7 label=Messaging_SheKneelsBesideYouAnd
  $D9E7,$41 "#MESSAGE$D9E7".
B $DA28,$01 Terminator.

t $DA29 Messaging: "Within A Few Minutes,No"
@ $DA29 label=Messaging_WithinAFewMinutesNo
  $DA29,$37 "#MESSAGE$DA29".
B $DA60,$01 Terminator.

t $DA61 Messaging: "A Pack Of Wolves Appears"
@ $DA61 label=Messaging_APackOfWolvesAppears
  $DA61,$1A "#MESSAGE$DA61".
B $DA7B,$01 Terminator.

t $DA7C Messaging: "You Have Nothing To Fight With"
@ $DA7C label=Messaging_YouHaveNothingToFightWith
  $DA7C,$35 "#MESSAGE$DA7C".
B $DAB1,$01 Terminator.

t $DAB2 Messaging: "You Successfully Fight Them Off"
@ $DAB2 label=Messaging_YouSuccessfullyFightThemOff
  $DAB2,$50 "#MESSAGE$DAB2".
B $DB02,$01 Terminator.

t $DB03 Messaging: "A Korl Warrior Appears"
@ $DB03 label=Messaging_AKorlWarriorAppears
  $DB03,$34 "#MESSAGE$DB03".
B $DB37,$01 Terminator.

t $DB38 Messaging: "You Can't Move"
@ $DB38 label=Messaging_YouCantMove
  $DB38,$2A "#MESSAGE$DB38".
B $DB62,$01 Terminator.

t $DB63 Messaging: "The Witch Sees You,Chuckles"
@ $DB63 label=Messaging_TheWitchSeesYouChuckles
  $DB63,$7A "#MESSAGE$DB63".
B $DBDD,$01 Terminator.

t $DBDE Messaging: "The Witch Sees The Ring On"
@ $DBDE label=Messaging_TheWitchSeesTheRingOn
  $DBDE,$56 "#MESSAGE$DBDE".
B $DC34,$01 Terminator.

t $DC35 Messaging: "Work It Out For Yourself"
@ $DC35 label=Messaging_WorkItOutForYourself
  $DC35,$19 "#MESSAGE$DC35".
B $DC4E,$01 Terminator.

t $DC4F Messaging: "Help Is On The Way"
@ $DC4F label=Messaging_HelpIsOnTheWay
  $DC4F,$13 "#MESSAGE$DC4F".
B $DC62,$01 Terminator.

t $DC63 Messaging: "They Are Not Removable"
@ $DC63 label=Messaging_TheyAreNotRemovable
  $DC63,$17 "#MESSAGE$DC63".
B $DC7A,$01 Terminator.

t $DC7B Messaging: "It Is Unlocked"
@ $DC7B label=Messaging_ItIsUnlocked
  $DC7B,$0F "#MESSAGE$DC7B".
B $DC8A,$01 Terminator.

t $DC8B Messaging: "It Already Is"
@ $DC8B label=Messaging_ItAlreadyIs
  $DC8B,$0E "#MESSAGE$DC8B".
B $DC99,$01 Terminator.

t $DC9A Messaging: "You Are In The Boat Already"
@ $DC9A label=Messaging_YouAreInTheBoatAlready
  $DC9A,$1C "#MESSAGE$DC9A".
B $DCB6,$01 Terminator.

t $DCB7 Messaging: "There Are Curious Runic Symbols"
@ $DCB7 label=Messaging_ThereAreCuriousRunicSymbols
  $DCB7,$38 "#MESSAGE$DCB7".
B $DCEF,$01 Terminator.

t $DCF0 Messaging: "It Is Locked"
@ $DCF0 label=Messaging_ItIsLocked
  $DCF0,$0D "#MESSAGE$DCF0".
B $DCFD,$01 Terminator.

t $DCFE Messaging: "The Log Now Spans The Chasm,"
@ $DCFE label=Messaging_TheLogNowSpansTheChasm
  $DCFE,$39 "#MESSAGE$DCFE".
B $DD37,$01 Terminator.

t $DD38 Messaging: "You Can't.He's Dead"
@ $DD38 label=Messaging_YouCantHesDead
  $DD38,$14 "#MESSAGE$DD38".
B $DD4C,$01 Terminator.

t $DD4D Messaging: "You Give Him The Crystals"
@ $DD4D label=Messaging_YouGiveHimTheCrystals
  $DD4D,$36 "#MESSAGE$DD4D".
B $DD83,$01 Terminator.

t $DD84 Messaging: "After Some Time,"
@ $DD84 label=Messaging_AfterSomeTime
  $DD84,$61 "#MESSAGE$DD84".
B $DDE5,$01 Terminator.

t $DDE6 Messaging: "You Start To Climb"
@ $DDE6 label=Messaging_YouStartToClimb
  $DDE6,$4C "#MESSAGE$DDE6".
B $DE32,$01 Terminator.

t $DE33 Messaging: "You're Not In The Boat"
@ $DE33 label=Messaging_YoureNotInTheBoat
  $DE33,$17 "#MESSAGE$DE33".
B $DE4A,$01 Terminator.

t $DE4B Messaging: "You Eat The Food"
@ $DE4B label=Messaging_YouEatTheFood
  $DE4B,$25 "#MESSAGE$DE4B".
B $DE70,$01 Terminator.

t $DE71 Messaging: "You Take A Refreshing"
@ $DE71 label=Messaging_YouTakeARefreshing
  $DE71,$25 "#MESSAGE$DE71".
B $DE96,$01 Terminator.

t $DE97 Messaging: "He's Already Dead"
@ $DE97 label=Messaging_HesAlreadyDead
  $DE97,$12 "#MESSAGE$DE97".
B $DEA9,$01 Terminator.

t $DEAA Messaging: "She's Already Dead"
@ $DEAA label=Messaging_ShesAlreadyDead
  $DEAA,$13 "#MESSAGE$DEAA".
B $DEBD,$01 Terminator.

t $DEBE Messaging: "It's Already Dead"
@ $DEBE label=Messaging_ItsAlreadyDead
  $DEBE,$12 "#MESSAGE$DEBE".
B $DED0,$01 Terminator.

t $DED1 Messaging: "You Have No Arrows"
@ $DED1 label=Messaging_YouHaveNoArrows
  $DED1,$13 "#MESSAGE$DED1".
B $DEE4,$01 Terminator.

t $DEE5 Messaging: "You Fire An Arrow"
@ $DEE5 label=Messaging_YouFireAnArrow
  $DEE5,$13 "#MESSAGE$DEE5".
B $DEF8,$01 Terminator.

t $DEF9 Messaging: "Bad Luck.You Missed"
@ $DEF9 label=Messaging_BadLuckYouMissed
  $DEF9,$14 "#MESSAGE$DEF9".
B $DF0D,$01 Terminator.

t $DF0E Messaging: "Well Done! A Perfect Shot"
@ $DF0E label=Messaging_WellDoneAPerfectShot
  $DF0E,$1A "#MESSAGE$DF0E".
B $DF28,$01 Terminator.

t $DF29 Messaging: "You're Not Carrying A Bow"
@ $DF29 label=Messaging_YoureNotCarryingABow
  $DF29,$1A "#MESSAGE$DF29".
B $DF43,$01 Terminator.

t $DF44 Messaging: "Your Blow Strikes True"
@ $DF44 label=Messaging_YourBlowStrikesTrue
  $DF44,$17 "#MESSAGE$DF44".
B $DF5B,$01 Terminator.

t $DF5C Messaging: "You Swing The Sword"
@ $DF5C label=Messaging_YouSwingTheSword
  $DF5C,$15 "#MESSAGE$DF5C".
B $DF71,$01 Terminator.

t $DF72 Messaging: "You're Not Carrying The Sword"
@ $DF72 label=Messaging_YoureNotCarryingTheSword
  $DF72,$1E "#MESSAGE$DF72".
B $DF90,$01 Terminator.

t $DF91 Messaging: "First Unused Response Message"
@ $DF91 label=Messaging_FirstUnusedResponseMessage
  $DF91,$05 "#MESSAGE$DF91".
B $DF96,$01 Terminator.

t $DF97 Messaging: "Second Unused Response Message"
@ $DF97 label=Messaging_SecondUnusedResponseMessage
  $DF97,$05 "#MESSAGE$DF97".
B $DF9C,$01 Terminator.

t $DF9D Messaging: "Third Unused Response Message"
@ $DF9D label=Messaging_ThirdUnusedResponseMessage
  $DF9D,$05 "#MESSAGE$DF9D".
B $DFA2,$01 Terminator.

t $DFA3 Messaging: "The Elf Is Dead"
@ $DFA3 label=Messaging_TheElfIsDead
  $DFA3,$10 "#MESSAGE$DFA3".
B $DFB3,$01 Terminator.

t $DFB4 Messaging: "The Lizard Falls To The Ground"
@ $DFB4 label=Messaging_TheLizardFallsToTheGround
  $DFB4,$2B "#MESSAGE$DFB4".
B $DFDF,$01 Terminator.

t $DFE0 Messaging: "You Have Killed It"
@ $DFE0 label=Messaging_YouHaveKilledIt
  $DFE0,$13 "#MESSAGE$DFE0".
B $DFF3,$01 Terminator.

t $DFF4 Messaging: "You Have Killed Her"
@ $DFF4 label=Messaging_YouHaveKilledHer
  $DFF4,$14 "#MESSAGE$DFF4".
B $E008,$01 Terminator.

t $E009 Messaging: "The Stricken Monster Slides"
@ $E009 label=Messaging_TheStrickenMonsterSlides
  $E009,$37 "#MESSAGE$E009".
B $E040,$01 Terminator.

t $E041 Messaging: "The Demons Scream With Panic,"
@ $E041 label=Messaging_TheDemonsScreamWithPanic
  $E041,$2D "#MESSAGE$E041".
B $E06E,$01 Terminator.

t $E06F Messaging: "Arrows Have No Effect"
@ $E06F label=Messaging_ArrowsHaveNoEffect
  $E06F,$16 "#MESSAGE$E06F".
B $E085,$01 Terminator.

t $E086 Messaging: "You Have Killed Him"
@ $E086 label=Messaging_YouHaveKilledHim
  $E086,$14 "#MESSAGE$E086".
B $E09A,$01 Terminator.

t $E09B Messaging: "The Wizard Falls To The Floor"
@ $E09B label=Messaging_TheWizardFallsToTheFloor
  $E09B,$77 "#MESSAGE$E09B".
B $E112,$01 Terminator.

t $E113 Messaging: "You Kiss Her"
@ $E113 label=Messaging_YouKissHer
  $E113,$25 "#MESSAGE$E113".
B $E138,$01 Terminator.

t $E139 Messaging: "Don't Be Ridiculous"
@ $E139 label=Messaging_DontBeRidiculous
  $E139,$14 "#MESSAGE$E139".
B $E14D,$01 Terminator.

t $E14E Messaging: "It's Too Late For That,"
@ $E14E label=Messaging_ItsTooLateForThat
  $E14E,$23 "#MESSAGE$E14E".
B $E171,$01 Terminator.

t $E172 Messaging: "It's Already Open"
@ $E172 label=Messaging_ItsAlreadyOpen
  $E172,$12 "#MESSAGE$E172".
B $E184,$01 Terminator.

t $E185 Messaging: "It's Already Closed"
@ $E185 label=Messaging_ItsAlreadyClosed
  $E185,$14 "#MESSAGE$E185".
B $E199,$01 Terminator.

t $E19A Messaging: "You're Inside Already"
@ $E19A label=Messaging_YoureInsideAlready
  $E19A,$16 "#MESSAGE$E19A".
B $E1B0,$01 Terminator.

t $E1B1 Messaging: "You're Wearing It Already"
@ $E1B1 label=Messaging_YoureWearingItAlready
  $E1B1,$1A "#MESSAGE$E1B1".
B $E1CB,$01 Terminator.

t $E1CC Messaging: "It Has No Apparent Effect"
@ $E1CC label=Messaging_ItHasNoApparentEffect
  $E1CC,$1A "#MESSAGE$E1CC".
B $E1E6,$01 Terminator.

t $E1E7 Messaging: "As You Touch The Rock,"
@ $E1E7 label=Messaging_AsYouTouchTheRock
  $E1E7,$34 "#MESSAGE$E1E7".
B $E21B,$01 Terminator.

t $E21C Messaging: "You Plunge Into The Water"
@ $E21C label=Messaging_YouPlungeIntoTheWater
  $E21C,$5D "#MESSAGE$E21C".
B $E279,$01 Terminator.

t $E27A Messaging: "You Make A Tremondous Leap,"
@ $E27A label=Messaging_YouMakeATremondousLeap
  $E27A,$47 "#MESSAGE$E27A".
B $E2C1,$01 Terminator.

t $E2C2 Messaging: "O.K. The Rope Dangles Down, Into The Volcano"
@ $E2C2 label=Messaging_OKTheRopeDanglesDownIntoTheVolcano
  $E2C2,$2D "#MESSAGE$E2C2".
B $E2EF,$01 Terminator.

t $E2F0 Messaging: "The Rope Is Already Tied"
@ $E2F0 label=Messaging_TheRopeIsAlreadyTied
  $E2F0,$19 "#MESSAGE$E2F0".
B $E309,$01 Terminator.

t $E30A Messaging: "Don't Be Disgusting"
@ $E30A label=Messaging_DontBeDisgusting
  $E30A,$14 "#MESSAGE$E30A".
B $E31E,$01 Terminator.

t $E31F Messaging: "She Evades Your Grasp"
@ $E31F label=Messaging_SheEvadesYourGrasp
  $E31F,$2A "#MESSAGE$E31F".
B $E349,$01 Terminator.

t $E34A Messaging: "You Row Across To"
@ $E34A label=Messaging_YouRowAcrossTo
  $E34A,$24 "#MESSAGE$E34A".
B $E36E,$01 Terminator.

t $E36F Messaging: "It Is Already Unlocked"
@ $E36F label=Messaging_ItIsAlreadyUnlocked
  $E36F,$17 "#MESSAGE$E36F".
B $E386,$01 Terminator.

t $E387 Messaging: "You're Not Carrying A Key"
@ $E387 label=Messaging_YoureNotCarryingAKey
  $E387,$1A "#MESSAGE$E387".
B $E3A1,$01 Terminator.

t $E3A2 Messaging: "You're No Carrying A Horn"
@ $E3A2 label=Messaging_YoureNoCarryingAHorn
  $E3A2,$1A "#MESSAGE$E3A2".
B $E3BC,$01 Terminator.

t $E3BD Messaging: "The Dragon Leaps Into The Air,"
@ $E3BD label=Messaging_TheDragonLeapsIntoTheAir
  $E3BD,$86 "#MESSAGE$E3BD".
B $E443,$01 Terminator.

t $E444 Messaging: "The Dragon Swoops Down"
@ $E444 label=Messaging_TheDragonSwoopsDown
  $E444,$52 "#MESSAGE$E444".
B $E496,$01 Terminator.

t $E497 Messaging: "You Can't. It's Locked"
@ $E497 label=Messaging_YouCantItsLocked
  $E497,$17 "#MESSAGE$E497".
B $E4AE,$01 Terminator.

t $E4AF Table: Vocabulary
@ $E4AF label=Table_Vocabulary
D $E4AF Four-character words. A comma binds synonyms to the same command.
  $E4AF,$09 Command #N$00.
  $E4B8,$09 Command #N$01.
  $E4C1,$09 Command #N$02.
  $E4CA,$09 Command #N$03.
  $E4D3,$09 Command #N$04.
  $E4DC,$09 Command #N$05.
  $E4E5,$09 Command #N$06.
  $E4EE,$09 Command #N$07.
  $E4F7,$09 Command #N$08.
  $E500,$04 Command #N$09.
  $E504,$04 Command #N$0A.
  $E508,$04 Command #N$0B.
  $E50C,$04 Command #N$0C.
  $E510,$0E Command #N$0D.
  $E51E,$18 Command #N$0E.
  $E536,$04 Command #N$0F.
  $E53A,$04 Command #N$10.
  $E53E,$04 Command #N$11.
  $E542,$04 Command #N$12.
  $E546,$0E Command #N$13.
  $E554,$04 Command #N$14.
  $E558,$04 Command #N$15.
  $E55C,$09 Command #N$16.
  $E565,$04 Command #N$17.
  $E569,$04 Command #N$18.
  $E56D,$09 Command #N$19.
  $E576,$04 Command #N$1A.
  $E57A,$04 Command #N$1B.
  $E57E,$04 Command #N$1C.
  $E582,$04 Command #N$1D.
  $E586,$0E Command #N$1E.
  $E594,$04 Command #N$1F.
  $E598,$04 Command #N$20.
  $E59C,$04 Command #N$21.
  $E5A0,$04 Command #N$22.
  $E5A4,$04 Command #N$23.
  $E5A8,$04 Command #N$24.
  $E5AC,$04 Command #N$25.
  $E5B0,$04 Command #N$26.
  $E5B4,$04 Command #N$27.
  $E5B8,$04 Command #N$28.
  $E5BC,$04 Command #N$29.
  $E5C0,$04 Command #N$2A.
  $E5C4,$04 Command #N$2B.
  $E5C8,$04 Command #N$2C.
  $E5CC,$04 Command #N$2D.
  $E5D0,$04 Command #N$2E.
  $E5D4,$04 Command #N$2F.
  $E5D8,$04 Command #N$30.
  $E5DC,$04 Command #N$31.
  $E5E0,$04 Command #N$32.
  $E5E4,$04 Command #N$33.
  $E5E8,$04 Command #N$34.
  $E5EC,$09 Command #N$35.
  $E5F5,$04 Command #N$36.
  $E5F9,$04 Command #N$37.
  $E5FD,$04 Command #N$38.
  $E601,$04 Command #N$39.
  $E605,$04 Command #N$3A.
  $E609,$04 Command #N$3B.
  $E60D,$04 Command #N$3C.
  $E611,$04 Command #N$3D.
  $E615,$04 Command #N$3E.
  $E619,$04 Command #N$3F.
  $E61D,$04 Command #N$40.
  $E621,$04 Command #N$41.
  $E625,$04 Command #N$42.
  $E629,$04 Command #N$43.
  $E62D,$04 Command #N$44.
  $E631,$04 Command #N$45.
  $E635,$09 Command #N$46.
  $E63E,$09 Command #N$47.
  $E647,$04 Command #N$48.
  $E64B,$04 Command #N$49.
  $E64F,$04 Command #N$4A.
  $E653,$04 Command #N$4B.
  $E657,$04 Command #N$4C.
  $E65B,$04 Command #N$4D.
  $E65F,$04 Command #N$4E.
  $E663,$04 Command #N$4F.
  $E667,$04 Command #N$50.
  $E66B,$09 Command #N$51.
  $E674,$04 Command #N$52.
  $E678,$09 Command #N$53.
  $E681,$04 Command #N$54.
  $E685,$04 Command #N$55.
  $E689,$04 Command #N$56.
  $E68D,$04 Command #N$57.
  $E691,$04 Command #N$58.
  $E695,$04 Command #N$59.
  $E699,$04 Command #N$5A.
  $E69D,$04 Command #N$5B.
  $E6A1,$09 Command #N$5C.
  $E6AA,$09 Command #N$5D.
  $E6B3,$04 Command #N$5E.
  $E6B7,$04 Command #N$5F.
B $E6BB,$01 Terminator.

b $E6BC Table: Match Characters
@ $E6BC label=Table_MatchCharacters
D $E6BC Characters used while comparing a typed word with the vocabulary.
B $E6BC,$01 Character #N(#PEEK(#PC)): #CHR(#PEEK(#PC)).
L $E6BC,$01,$2A

b $E6E6 Table: Phrase Tokens
@ $E6E6 label=Table_PhraseTokens
D $E6E6 Token lists terminated by #N$FE. Each list names the objects a
. verb phrase may refer to.
B $E6E6,$01 #IF(#PEEK(#PC)==$FE)(End of phrase.,Object #N(#PEEK(#PC)).)
L $E6E6,$01,$C8

b $E7AE Table: Verb Tokens
@ $E7AE label=Table_VerbTokens
D $E7AE The vocabulary command number for each entry in #R$FB0D.
B $E7AE,$01 Command #N(#PEEK(#PC)).
L $E7AE,$01,$22

b $E7D0 Table: Message Groups
@ $E7D0 label=Table_MessageGroups
D $E7D0 Lists of message numbers, each list terminated by #N$FF.
B $E7D0,$01 #IF(#PEEK(#PC)==$FF)(End of group.,Message #N(#PEEK(#PC)).)
L $E7D0,$01,$164

g $E934 Table: Room Exits
@ $E934 label=Table_RoomExits
@ $E941 label=Exit_FarmhouseSouth
@ $E996 label=Exit_WoodmansHutEast
@ $E9B4 label=Exit_WesternChasmEast
@ $E9BB label=Exit_EasternChasmWest
@ $EAA4 label=Exit_WitchsHovelEast
@ $EAAA label=Exit_RockWallEast
@ $EADA label=Exit_CavernEast
D $E934 Six direction bytes for each room, in the order used by #R$C201:
. north, south, east, west, up, down. #N$00 means no exit. Some of
. these bytes are rewritten when a door opens or an event moves the
. player.
B $E934,$01 Direction #N((#PC-$E934)%$06) of room #N((#PC-$E934)/$06):
. #N(#PEEK(#PC)).
L $E934,$01,$1CE

g $EB02 Table: Flags To Clear
@ $EB02 label=Table_FlagsToClear
D $EB02 Addresses zeroed by the routine at #R$F964 before the game starts.
W $EB02,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $EB02,$02,$07

c $EB10 Game Loop
@ $EB10 label=GameLoop
E $EB10 View the equivalent code in;
. #LIST
. { #HEROES$E9A1 }
. { #JEWELS$EDC4 }
. { #ANDROMEDA$8D2A }
. { #WARLORD$E99F }
. LIST#
D $EB10 One turn: threats, local events, a command, then the matching verb.
N $EB10 Run any timed threat, then the room's scenic event.
  $EB10,$03 Call #R$BECE.
N $EB13 Run the room's scenic event.
  $EB13,$03 Call #R$C3FA.
N $EB16 Read a command and match it against the vocabulary.
  $EB16,$03 Call #R$BF73 to read a command.
N $EB19 Match the command against the vocabulary.
  $EB19,$03 Call #R$C3DC.
  $EB1C,$02 Jump back to #R$EB10 when the command was not understood.
  $EB1E,$03 Call #R$C463 to carry out the verb.
  $EB21,$02 Jump back to #R$EB10 for the next turn.

c $EB23 Game Over
@ $EB23 label=GameOver
E $EB23 View the equivalent code in;
. #LIST
. { #SHOCK$AE0D }
. { #HEROES$E9B5 }
. { #JEWELS$EDD7 }
. { #ANDROMEDA$8DB3 }
. { #WARLORD$E9B2 }
. LIST#
D $EB23 Tell the player they are dead and ask whether to play again.
N $EB23 Tell the player they are dead.
  $EB23,$06 Print "#MESSAGE$BC01".
N $EB29 Ask whether to play again.
@ $EB29 label=WantAnotherGameInput
  $EB29,$06 Print "#MESSAGE$BC0F".
@ $EB2F label=WantAnotherGameInput_Loop
  $EB2F,$03 Call #R$BDDA to wait for the player's answer.
  $EB32,$05 Jump to #SKOOLKID$0000(START) if the player pressed "N".
  $EB37,$05 Jump to #R$B9C5 to play again if the player pressed "Y".
  $EB3C,$02 Jump back to #R$EB2F until the answer is Y or N.

c $EB3E Game Complete
@ $EB3E label=GameComplete
E $EB3E View the equivalent code in;
. #LIST
. { #HEROES$E9D3 }
. { #JEWELS$EDF2 }
. { #ANDROMEDA$8DCE }
. LIST#
D $EB3E Show the winning text, then ask whether to play again.
N $EB3E Clear the screen for the winning text.
  $EB3E,$03 Call #R$BDEA.
  $EB41,$03 Call #R$BE06 to place the cursor for the win text.
N $EB44 Print "#MESSAGE$D53A".
  $EB44,$06 Print "#MESSAGE$D53A".
  $EB4A,$02 Jump to #R$EB29 to ask whether to play again.

c $EB4C Events: Wood Nymph
@ $EB4C label=Events_WoodNymph
D $EB4C The wood nymph appears, heals the player and then leaves.
N $EB4C Make the wood nymph inactive.
  $EB4C,$03 #REGhl=#R$BA36.
  $EB4F,$02 Reset bit 0 of *#REGhl.
  $EB51,$05 Call #R$C24F with #N$8A.
  $EB56,$01 Return if #N$8A is not in the current room.
  $EB57,$05 Call #R$C2D8 with #N$8A.
  $EB5C,$05 Call #R$C2DF with item #N$07: #ITEM$07.
N $EB61 Print "#MESSAGE$D644".
  $EB61,$03 #REGhl=#R$D644.
  $EB64,$03 Call #R$BE2E.
  $EB67,$01 Return.

c $EB68 Fatal Events: Spider
@ $EB68 label=Events_Spider
D $EB68 The spider kills the player when they are still in her room.
N $EB68 Make the spider inactive.
  $EB68,$03 #REGhl=#R$BA36.
  $EB6B,$02 Reset bit 1 of *#REGhl.
  $EB6D,$05 Call #R$C24F with item #N$41: #ITEM$41.
  $EB72,$01 Return if #ITEM$41 is not in the current room.
N $EB73 Print "#MESSAGE$D686".
  $EB73,$03 #REGhl=#R$D686.
  $EB76,$02 Jump to #R$EBA6.

c $EB78 Fatal Events: Slime Monster
@ $EB78 label=Events_SlimeMonster
D $EB78 The slime monster kills the player when they are still in the pit.
N $EB78 Make the slime monster inactive.
  $EB78,$03 #REGhl=#R$BA36.
  $EB7B,$02 Reset bit 2 of *#REGhl.
  $EB7D,$05 Call #R$C24F with item #N$1E: #ITEM$1E.
  $EB82,$01 Return if #ITEM$1E is not in the current room.
N $EB83 Print "#MESSAGE$D6B6".
  $EB83,$03 #REGhl=#R$D6B6.
  $EB86,$02 Jump to #R$EBA6.

c $EB88 Fatal Events: Demons
@ $EB88 label=Events_Demons
D $EB88 The demons kill the player if the fight is still going on.
N $EB88 Make the demons inactive.
  $EB88,$03 #REGhl=#R$BA36.
  $EB8B,$02 Reset bit 3 of *#REGhl.
  $EB8D,$05 Call #R$C24F with item #N$29: #ITEM$29.
  $EB92,$01 Return if #ITEM$29 is not in the current room.
N $EB93 Print "#MESSAGE$D6E0".
  $EB93,$03 #REGhl=#R$D6E0.
  $EB96,$02 Jump to #R$EBA6.

c $EB98 Fatal Events: Wizard
@ $EB98 label=Events_Wizard
D $EB98 Zarn kills the player, and the game ends at once.
N $EB98 Make Zarn inactive.
  $EB98,$03 #REGhl=#R$BA36.
  $EB9B,$02 Reset bit 4 of *#REGhl.
  $EB9D,$05 Call #R$C24F with item #N$2A: #ITEM$2A.
  $EBA2,$01 Return if #ITEM$2A is not in the current room.
N $EBA3 Print "#MESSAGE$D716".
  $EBA3,$03 #REGhl=#R$D716.
@ $EBA6 label=Events_AnnounceDeath
  $EBA6,$03 Call #R$BE2E.
  $EBA9,$01 Restore #REGhl from the stack.
  $EBAA,$01 Restore #REGhl from the stack.
  $EBAB,$01 Restore #REGhl from the stack.
  $EBAC,$03 Jump to #R$EB23.

c $EBAF Events: Elf
@ $EBAF label=Events_Elf
D $EBAF An elf attacks. Sometimes the blow is fatal.
N $EBAF Print "#MESSAGE$D753".
  $EBAF,$03 #REGhl=#R$D753.
  $EBB2,$03 Call #R$BE2E.
  $EBB5,$02 #REGa=#N$0F.
  $EBB7,$03 Call #R$BF45.
  $EBBA,$02 Jump to #R$EBC5 if the blow is not fatal.
  $EBBC,$04 Switch #R$EB23 onto the stack so the next return actions a "game
. over".
N $EBC0 Print "#MESSAGE$D795".
  $EBC0,$03 #REGhl=#R$D795.
  $EBC3,$02 Jump to #R$EBC8.
N $EBC5 Print "#MESSAGE$D768".
@ $EBC5 label=Events_Elf_Next
  $EBC5,$03 #REGhl=#R$D768.
@ $EBC8 label=Events_Elf_Print
  $EBC8,$03 Call #R$C486.
  $EBCB,$01 Return.

c $EBCC Events: Flying Lizard
@ $EBCC label=Events_FlyingLizard
D $EBCC A flying lizard attacks. Sometimes the blow is fatal.
N $EBCC Print "#MESSAGE$D7D1".
  $EBCC,$03 #REGhl=#R$D7D1.
  $EBCF,$03 Call #R$BE2E.
  $EBD2,$02 #REGa=#N$0F.
  $EBD4,$03 Call #R$BF45.
  $EBD7,$02 Jump to #R$EBE2 if the blow is not fatal.
  $EBD9,$04 Switch #R$EB23 onto the stack so the next return actions a "game
. over".
N $EBDD Print "#MESSAGE$D823".
  $EBDD,$03 #REGhl=#R$D823.
  $EBE0,$02 Jump to #R$EBE5.
N $EBE2 Print "#MESSAGE$D7EF".
@ $EBE2 label=Events_FlyingLizard_Next
  $EBE2,$03 #REGhl=#R$D7EF.
@ $EBE5 label=Events_FlyingLizard_Print
  $EBE5,$03 Call #R$C486.
  $EBE8,$01 Return.

c $EBE9 Events: Centaur
@ $EBE9 label=Events_Centaur
D $EBE9 A centaur appears and is placed in the current room.
N $EBE9 Print "#MESSAGE$D84D".
  $EBE9,$03 #REGhl=#R$D84D.
  $EBEC,$03 Call #R$BE2E.
  $EBEF,$05 Call #R$C2D8 with #N$86.
N $EBF4 Print "#MESSAGE$D861".
  $EBF4,$03 #REGhl=#R$D861.
  $EBF7,$03 Call #R$C486.
  $EBFA,$01 Return.

c $EBFB Events: Old Man
@ $EBFB label=Events_OldMan
D $EBFB The old man appears, speaks, and is placed in the current room.
N $EBFB Print "#MESSAGE$D87F".
  $EBFB,$03 #REGhl=#R$D87F.
  $EBFE,$03 Call #R$BE2E.
N $EC01 Print "#MESSAGE$D895".
  $EC01,$03 #REGhl=#R$D895.
  $EC04,$03 Call #R$C486.
N $EC07 Print "#MESSAGE$D93D".
  $EC07,$03 #REGhl=#R$D93D.
  $EC0A,$03 Call #R$BE2E.
  $EC0D,$05 Call #R$C2D8 with #N$87.
  $EC12,$01 Return.

c $EC13 Events: Old Man's Quest
@ $EC13 label=Events_OldMansQuest
D $EC13 The old man returns with his quest and is placed in the current room.
N $EC13 Print "#MESSAGE$D87F".
  $EC13,$03 #REGhl=#R$D87F.
  $EC16,$03 Call #R$BE2E.
N $EC19 Print "#MESSAGE$D8C9".
  $EC19,$03 #REGhl=#R$D8C9.
  $EC1C,$03 Call #R$C486.
N $EC1F Print "#MESSAGE$D93D".
  $EC1F,$03 #REGhl=#R$D93D.
  $EC22,$03 Call #R$BE2E.
  $EC25,$05 Call #R$C2D8 with #N$88.
  $EC2A,$01 Return.

c $EC2B Events: Wood Nymph's Glimpse
@ $EC2B label=Events_WoodNymphsGlimpse
D $EC2B The player glimpses the wood nymph, who is then placed nearby.
N $EC2B Print "#MESSAGE$D953".
  $EC2B,$03 #REGhl=#R$D953.
  $EC2E,$03 Call #R$BE2E.
N $EC31 Print "#MESSAGE$D9A1".
  $EC31,$03 #REGhl=#R$D9A1.
  $EC34,$03 Call #R$C486.
  $EC37,$05 Call #R$C2D8 with #N$89.
  $EC3C,$01 Return.

c $EC3D Events: Wood Nymph Heals
@ $EC3D label=Events_WoodNymphHeals
D $EC3D The wood nymph appears, heals the injury and arms the nymph event again.
N $EC3D Print "#MESSAGE$D9D0".
  $EC3D,$03 #REGhl=#R$D9D0.
  $EC40,$03 Call #R$BE2E.
N $EC43 Print "#MESSAGE$D9E7".
  $EC43,$03 #REGhl=#R$D9E7.
  $EC46,$03 Call #R$C486.
N $EC49 Print "#MESSAGE$DA29".
  $EC49,$03 #REGhl=#R$DA29.
  $EC4C,$03 Call #R$C486.
  $EC4F,$05 Call #R$C2D8 with item #N$48: #ITEM$48.
N $EC54 Arm the wood nymph for the next turn.
  $EC54,$02 #REGa=#N$01.
  $EC56,$03 Write #REGa to *#R$BA37.
  $EC59,$03 #REGhl=#R$BA36.
  $EC5C,$02 Set bit 0 of *#REGhl.
  $EC5E,$01 Return.

c $EC5F Events: Wolves
@ $EC5F label=Events_Wolves
D $EC5F Wolves attack. The bow drives them off; otherwise the player dies.
N $EC5F Print "#MESSAGE$DA61".
  $EC5F,$03 #REGhl=#R$DA61.
  $EC62,$03 Call #R$BE2E.
  $EC65,$05 Call #R$C2D2 with item #N$03: #ITEM$03.
  $EC6A,$02 Jump to #R$EC73 if #ITEM$03 isn't held.
  $EC6C,$05 Call #R$C2D2 with item #N$04: #ITEM$04.
  $EC71,$02 Jump to #R$EC7E if #ITEM$04 is held.
N $EC73 Print "#MESSAGE$DA7C".
@ $EC73 label=Events_Wolves_Next
  $EC73,$03 #REGhl=#R$DA7C.
  $EC76,$03 Call #R$C486.
  $EC79,$04 Switch #R$EB23 onto the stack so the next return actions a "game
. over".
  $EC7D,$01 Return.
N $EC7E Print "#MESSAGE$DAB2".
@ $EC7E label=Events_Wolves_FightOff
  $EC7E,$03 #REGhl=#R$DAB2.
  $EC81,$03 Call #R$C486.
  $EC84,$05 Call #R$C2DF with item #N$48: #ITEM$48.
  $EC89,$05 Call #R$C2D8 with #N$8B.
  $EC8E,$05 Call #R$C2DF with item #N$1B: #ITEM$1B.
  $EC93,$05 Call #R$C2E8 with #N$8A.
  $EC98,$01 Return.

c $EC99 Events: Korl Warrior
@ $EC99 label=Events_KorlWarrior
D $EC99 A Korl warrior attacks. Sometimes the blow is fatal.
N $EC99 Print "#MESSAGE$DB03".
  $EC99,$03 #REGhl=#R$DB03.
  $EC9C,$03 Call #R$BE2E.
  $EC9F,$02 #REGa=#N$14.
  $ECA1,$03 Call #R$BF45.
  $ECA4,$02 Jump to #R$ECAF if the blow is not fatal.
  $ECA6,$04 Switch #R$EB23 onto the stack so the next return actions a "game
. over".
N $ECAA Print "#MESSAGE$D795".
  $ECAA,$03 #REGhl=#R$D795.
  $ECAD,$02 Jump to #R$ECB2.
N $ECAF Print "#MESSAGE$D768".
@ $ECAF label=Events_KorlWarrior_Next
  $ECAF,$03 #REGhl=#R$D768.
@ $ECB2 label=Events_KorlWarrior_Print
  $ECB2,$03 Call #R$C486.
  $ECB5,$01 Return.

c $ECB6 Handler: Injury Check
@ $ECB6 label=Handler_InjuryCheck
D $ECB6 Refuse the move while the player is badly hurt. Otherwise change rooms
. and arm the local dangers.
  $ECB6,$01 #REGc=#REGa.
  $ECB7,$05 Call #R$C24F with item #N$48: #ITEM$48.
  $ECBC,$02 Jump to #R$ECC5 if #ITEM$48 is not in the current room.
N $ECBE Print "#MESSAGE$DB38".
  $ECBE,$03 #REGhl=#R$DB38.
  $ECC1,$03 Call #R$BE2E.
  $ECC4,$01 Return.
N $ECC5 Move into the requested room and arm local dangers.
@ $ECC5 label=Handler_InjuryCheck_Next
  $ECC5,$01 #REGa=#REGc.
  $ECC6,$03 Call #R$C42F.
  $ECC9,$02 #REGe=#N$00.
  $ECCB,$03 Call #R$C0F9.
  $ECCE,$07 Jump to #R$ECDF if #R$C24F reports that #ITEM$41 isn't in the
. current room.
N $ECD5 Arm the giant spider for six turns.
  $ECD5,$03 #REGhl=#R$BA36.
  $ECD8,$02 Set bit 1 of *#REGhl.
  $ECDA,$02 #REGa=#N$06.
  $ECDC,$03 Write #REGa to *#R$BA38.
N $ECDF Is the slime monster here?
@ $ECDF label=Handler_InjuryCheck_SlimeMonster
  $ECDF,$07 Jump to #R$ECF0 if #R$C24F reports that #ITEM$1E isn't in the
. current room.
N $ECE6 Arm the slime monster for six turns.
  $ECE6,$03 #REGhl=#R$BA36.
  $ECE9,$02 Set bit 2 of *#REGhl.
  $ECEB,$02 #REGa=#N$06.
  $ECED,$03 Write #REGa to *#R$BA39.
N $ECF0 Are the demons here?
@ $ECF0 label=Handler_InjuryCheck_Demons
  $ECF0,$07 Jump to #R$ED01 if #R$C24F reports that #ITEM$29 isn't in the
. current room.
N $ECF7 Arm the demons for six turns.
  $ECF7,$03 #REGhl=#R$BA36.
  $ECFA,$02 Set bit 3 of *#REGhl.
  $ECFC,$02 #REGa=#N$06.
  $ECFE,$03 Write #REGa to *#R$BA3A.
N $ED01 Is Zarn here?
@ $ED01 label=Handler_InjuryCheck_Zarn
  $ED01,$07 Jump to #R$ED12 if #R$C24F reports that #ITEM$2A isn't in the
. current room.
N $ED08 Arm Zarn for six turns.
  $ED08,$03 #REGhl=#R$BA36.
  $ED0B,$02 Set bit 4 of *#REGhl.
  $ED0D,$02 #REGa=#N$06.
  $ED0F,$03 Write #REGa to *#R$BA3B.
N $ED12 Is the witch here?
@ $ED12 label=Handler_InjuryCheck_Witch
  $ED12,$07 Jump to #R$ED37 if #R$C24F reports that #ITEM$2E isn't in the
. current room.
  $ED19,$07 Jump to #R$ED2C if #ITEM$43 is held.
N $ED20 Print "#MESSAGE$DB63".
  $ED20,$03 #REGhl=#R$DB63.
  $ED23,$03 Call #R$BE2E.
  $ED26,$01 Restore #REGhl from the stack.
  $ED27,$04 Switch #R$EB23 onto the stack so the next return actions a "game
. over".
  $ED2B,$01 Return.
N $ED2C Print "#MESSAGE$DBDE".
@ $ED2C label=Handler_InjuryCheck_WitchSeesRing
  $ED2C,$03 #REGhl=#R$DBDE.
  $ED2F,$03 Call #R$BE2E.
  $ED32,$05 Call #R$C2D8 with item #N$2E: #ITEM$2E.
N $ED37 Is the old man here?
@ $ED37 label=Handler_InjuryCheck_OldMan
  $ED37,$07 Jump to #R$ED53 if #R$C24F reports that #ITEM$2F isn't in the
. current room.
  $ED3E,$05 Call #R$C2D8 with item #N$2F: #ITEM$2F.
  $ED43,$05 Call #R$C2DF with item #N$03: #ITEM$03.
  $ED48,$05 Call #R$C2DF with item #N$04: #ITEM$04.
N $ED4D Print "#MESSAGE$D93D".
  $ED4D,$03 #REGhl=#R$D93D.
  $ED50,$03 Call #R$C486.
N $ED53 Has the player brought Mara to the Great Valley?
@ $ED53 label=Handler_InjuryCheck_GreatValley
  $ED53,$07 Jump to #R$ED65 if *#R$BA9B isn't room #N$05: "#ROOM$05".
  $ED5A,$07 Jump to #R$ED65 if #R$C24F reports that #ITEM$2C isn't in the
. current room.
  $ED61,$01 Restore #REGhl from the stack.
  $ED62,$03 Jump to #R$EB3E.
@ $ED65 label=Handler_InjuryCheck_Return
  $ED65,$01 Return.

c $ED66 Print Response
@ $ED66 label=PrintResponse
E $ED66 View the equivalent code in;
. #LIST
. { #HEROES$EA9E }
. { #JEWELS$F03A }
. { #WARLORD$ED6D }
. LIST#
D $ED66 Print the given message and go back to the game loop.
  $ED66,$03 Call #R$BE2E to print the message and start a new line.
  $ED69,$01 Return.

c $ED6A Pause And Print Response
@ $ED6A label=PauseAndPrintResponse
E $ED6A View the equivalent code in;
. #LIST
. { #HEROES$EAA2 }
. { #JEWELS$F03E }
. LIST#
D $ED6A Pause, print the given message and go back to the game loop.
  $ED6A,$03 Call #R$C486.
  $ED6D,$01 Return.

c $ED6E Response: "You Can't"
@ $ED6E label=Response_YouCant_GameLoop
E $ED6E View the equivalent code in;
. #LIST
. { #HEROES$EAE2 }
. { #JEWELS$F06F }
. LIST#
N $ED6E Print "#MESSAGE$BCD0".
  $ED6E,$03 #REGhl=#R$BCD0.
  $ED71,$02 Jump to #R$ED66.

c $ED73 Response: "One At A Time, Please"
@ $ED73 label=Response_OneAtATimePlease
E $ED73 View the equivalent code in;
. #LIST
. { #JEWELS$F060 }
. LIST#
N $ED73 Print "#MESSAGE$BD52".
  $ED73,$03 #REGhl=#R$BD52.
  $ED76,$02 Jump to #R$ED66.

c $ED78 Response: "I Don't See The Point"
@ $ED78 label=Response_IDontSeeThePoint
E $ED78 View the equivalent code in;
. #LIST
. { #HEROES$EFE2 }
. { #JEWELS$F065 }
. { #WARLORD$EDF9 }
. LIST#
N $ED78 Print "#MESSAGE$BD68".
  $ED78,$03 #REGhl=#R$BD68.
  $ED7B,$02 Jump to #R$ED66.

c $ED7D Response: "Please Rephrase That"
@ $ED7D label=Response_PleaseRephraseThat_GameLoop
E $ED7D View the equivalent code in;
. #LIST
. { #JEWELS$F074 }
. LIST#
N $ED7D Print "#MESSAGE$BCBA".
  $ED7D,$03 #REGhl=#R$BCBA.
  $ED80,$02 Jump to #R$ED66.

c $ED82 Response: "He's Already Dead"
@ $ED82 label=Response_HesAlreadyDead
N $ED82 Print "#MESSAGE$DE97".
  $ED82,$03 #REGhl=#R$DE97.
  $ED85,$02 Jump to #R$ED66.

c $ED87 Response: "She's Already Dead"
@ $ED87 label=Response_ShesAlreadyDead
N $ED87 Print "#MESSAGE$DEAA".
  $ED87,$03 #REGhl=#R$DEAA.
  $ED8A,$02 Jump to #R$ED66.

c $ED8C Response: "It's Already Dead"
@ $ED8C label=Response_ItsAlreadyDead
N $ED8C Print "#MESSAGE$DEBE".
  $ED8C,$03 #REGhl=#R$DEBE.
  $ED8F,$02 Jump to #R$ED66.

c $ED91 Response: "Don't Be Ridiculous"
@ $ED91 label=Response_DontBeRidiculous
E $ED91 View the equivalent code in;
. #LIST
. { #HEROES$F205 }
. { #JEWELS$F092 }
. { #WARLORD$EE05 }
. LIST#
N $ED91 Print "#MESSAGE$E139".
  $ED91,$03 #REGhl=#R$E139.
  $ED94,$02 Jump to #R$ED66.

c $ED96 Response: "O.K."
@ $ED96 label=Response_OK_GameLoop
E $ED96 View the equivalent code in;
. #LIST
. { #HEROES$EAE8 }
. { #JEWELS$F06A }
. LIST#
N $ED96 Print "#MESSAGE$BCDB".
  $ED96,$03 #REGhl=#R$BCDB.
  $ED99,$02 Jump to #R$ED66.

c $ED9B Response: "You're Inside Already"
@ $ED9B label=Response_YoureInsideAlready
N $ED9B Print "#MESSAGE$E19A".
  $ED9B,$03 #REGhl=#R$E19A.
  $ED9E,$02 Jump to #R$ED66.

c $EDA0 Response: "Please Rephrase That"
@ $EDA0 label=Response_PleaseRephraseThat_EnterTheBoat
N $EDA0 Print "#MESSAGE$BCBA".
  $EDA0,$03 #REGhl=#R$BCBA.
  $EDA3,$02 Jump to #R$ED66.

c $EDA5 Response: "It Has No Apparent Effect"
@ $EDA5 label=Response_ItHasNoApparentEffect
E $EDA5 View the equivalent code in;
. #LIST
. { #JEWELS$F097 }
. LIST#
N $EDA5 Print "#MESSAGE$E1CC".
  $EDA5,$03 #REGhl=#R$E1CC.
  $EDA8,$02 Jump to #R$ED66.

c $EDAA Response: "Don't Be Disgusting"
@ $EDAA label=Response_DontBeDisgusting
N $EDAA Print "#MESSAGE$E30A".
  $EDAA,$03 #REGhl=#R$E30A.
  $EDAD,$02 Jump to #R$ED66.

c $EDAF Response: "You're Not Carrying Anything"
@ $EDAF label=Response_YoureNotCarryingAnything
E $EDAF View the equivalent code in;
. #LIST
. { #SHOCK$A6CF }
. { #HEROES$EAB8 }
. { #JEWELS$F04C }
. { #WARLORD$EE17 }
. LIST#
N $EDAF Print "#MESSAGE$BD94".
  $EDAF,$03 #REGhl=#R$BD94.
  $EDB2,$02 Jump to #R$ED66.

c $EDB4 Response: "You Can't. It's Locked"
@ $EDB4 label=Response_YouCantItsLocked
N $EDB4 Print "#MESSAGE$E497".
  $EDB4,$03 #REGhl=#R$E497.
  $EDB7,$02 Jump to #R$ED66.

c $EDB9 Response: "It's Already Open"
@ $EDB9 label=Response_ItsAlreadyOpen
E $EDB9 View the equivalent code in;
. #LIST
. { #JEWELS$F088 }
. LIST#
N $EDB9 Print "#MESSAGE$E172".
  $EDB9,$03 #REGhl=#R$E172.
  $EDBC,$02 Jump to #R$ED66.

c $EDBE Response: "It's Already Closed"
@ $EDBE label=Response_ItsAlreadyClosed
E $EDBE View the equivalent code in;
. #LIST
. { #JEWELS$F08D }
. LIST#
N $EDBE Print "#MESSAGE$E185".
  $EDBE,$03 #REGhl=#R$E185.
  $EDC1,$02 Jump to #R$ED66.

c $EDC3 Action: Help
@ $EDC3 label=Action_Help
E $EDC3 View the equivalent code in;
. #LIST
. { #HEROES$F715 }
. { #JEWELS$F09C }
. { #ANDROMEDA$8E8D }
. LIST#
D $EDC3 Explain how badly hurt the player is, if at all.
  $EDC3,$03 Call #R$C2FE.
N $EDC6 The "HELP" command can only be called on its own.
  $EDC6,$01 Return if there's any token set in #R$BB37.
N $EDC7 Does the player want help with their injury?
  $EDC7,$07 Jump to #R$EDE2 if #R$C24F reports the player isn't in the room
. where you're #ITEM$48.
N $EDCE Is the wood nymph already here?
  $EDCE,$07 Jump to #R$EDE2 if #R$C24F reports that #N$8A is in the same
. room as the player.
N $EDD5 Is the wood nymph still in play?
  $EDD5,$05 Call #R$C2BE with #N$8A.
  $EDDA,$03 Jump to #R$EDE2 if the wood nymph is not in play.
N $EDDD Help is on the way.
N $EDDD Print "#MESSAGE$DC4F".
  $EDDD,$03 #REGhl=#R$DC4F.
  $EDE0,$02 Jump to #R$EDE5.
N $EDE2 There's no more help available...
@ $EDE2 label=Action_Help_GiveUp
N $EDE2 Print "#MESSAGE$DC35".
  $EDE2,$03 #REGhl=#R$DC35.
@ $EDE5 label=Action_Help_Reply
  $EDE5,$03 Jump to #R$ED66.

c $EDE8 Action: Inventory
@ $EDE8 label=Action_Inventory
E $EDE8 View the equivalent code in;
. #LIST
. { #SHOCK$A6CF }
. { #HEROES$F756 }
. { #JEWELS$F12E }
. { #ANDROMEDA$8EC4 }
. { #WARLORD$F824 }
. LIST#
D $EDE8 List everything the player is carrying.
  $EDE8,$03 Call #R$C2FE.
N $EDEB The "INVENTORY" command can only be called on its own.
  $EDEB,$01 Return if there's any token set in #R$BB37.
  $EDEC,$07 Jump to #R$EDAF if *#R$BA68 is zero (the player isn't holding any
. items).
N $EDF3 Clear the screen and display the players inventory.
  $EDF3,$03 Call #R$BDEA.
  $EDF6,$03 Call #R$BE06.
N $EDF9 Print "#MESSAGE$BD1F".
  $EDF9,$03 #REGhl=#R$BD1F.
  $EDFC,$03 Call #R$BE2E.
  $EDFF,$05 Call #R$C0D2 with a room ID of #N$01 which is the players
. inventory.
  $EE04,$01 Return.

c $EE05 Action: Look
@ $EE05 label=Action_Look
E $EE05 View the equivalent code in;
. #LIST
. { #HEROES$F773 }
. { #JEWELS$F14B }
. { #ANDROMEDA$8EDA }
. { #WARLORD$F841 }
. LIST#
D $EE05 Describe the room again, including the long text.
  $EE05,$03 Call #R$C2FE.
N $EE08 The "LOOK" command can only be called on its own.
  $EE08,$01 Return if there's any token set in #R$BB37.
  $EE09,$05 Call #R$C0F9 with #REGe set to #N$01 (which will force any room
. images to be re-displayed).
  $EE0E,$01 Return.

c $EE0F Action: North
@ $EE0F label=Action_North
E $EE0F View the equivalent code in;
. #LIST
. { #HEROES$F7E4 }
. { #JEWELS$F155 }
. { #ANDROMEDA$8EE4 }
. { #WARLORD$F8C9 }
. LIST#
D $EE0F Try to leave to the north.
  $EE0F,$02 Set #REGc to "NORTH" (#N$00).
  $EE11,$02 Jump to #R$EE25.

c $EE13 Action: South
@ $EE13 label=Action_South
E $EE13 View the equivalent code in;
. #LIST
. { #HEROES$F7E8 }
. { #JEWELS$F159 }
. { #ANDROMEDA$8EE8 }
. { #WARLORD$F8CD }
. LIST#
D $EE13 Try to leave to the south.
  $EE13,$02 Set #REGc to "SOUTH" (#N$01).
  $EE15,$02 Jump to #R$EE25.

c $EE17 Action: East
@ $EE17 label=Action_East
E $EE17 View the equivalent code in;
. #LIST
. { #HEROES$F7EC }
. { #JEWELS$F15D }
. { #ANDROMEDA$8EEC }
. { #WARLORD$F8D1 }
. LIST#
D $EE17 Try to leave to the east.
  $EE17,$02 Set #REGc to "EAST" (#N$02).
  $EE19,$02 Jump to #R$EE25.

c $EE1B Action: West
@ $EE1B label=Action_West
E $EE1B View the equivalent code in;
. #LIST
. { #HEROES$F7F0 }
. { #JEWELS$F161 }
. { #ANDROMEDA$8EF0 }
. { #WARLORD$F8D5 }
. LIST#
D $EE1B Try to leave to the west.
  $EE1B,$02 Set #REGc to "WEST" (#N$03).
  $EE1D,$02 Jump to #R$EE25.

c $EE1F Action: Up
@ $EE1F label=Action_Up
E $EE1F View the equivalent code in;
. #LIST
. { #HEROES$F7F4 }
. { #JEWELS$F165 }
. { #ANDROMEDA$8EF4 }
. { #WARLORD$F8D9 }
. LIST#
D $EE1F Try to leave upwards.
  $EE1F,$02 Set #REGc to "UP" (#N$04).
  $EE21,$02 Jump to #R$EE25.

c $EE23 Action: Down
@ $EE23 label=Action_Down
E $EE23 Continue on to #R$EE25.
D $EE23 Try to leave downwards.
E $EE23 View the equivalent code in;
. #LIST
. { #HEROES$F7F8 }
. { #JEWELS$F169 }
. { #ANDROMEDA$8EF8 }
. { #WARLORD$F8DD }
. LIST#
  $EE23,$02 Set #REGc to "DOWN" (#N$05).

c $EE25 Move Player
@ $EE25 label=MovePlayer
E $EE25 View the equivalent code in;
. #LIST
. { #SHOCK$A6E8 }
. { #HEROES$F7FA }
. { #JEWELS$F16B }
. { #WARLORD$F8DF }
. LIST#
R $EE25 C Requested direction where: #TABLE { #N$00 | NORTH } { #N$01 | SOUTH } { #N$02 | EAST } { #N$03 | WEST } { #N$04 | UP } { #N$05 | DOWN } TABLE#
  $EE25,$03 Call #R$C2FE.
N $EE28 All "MOVE" commands can only be called on their own; you can't type
. "NORTH TO BEACH" or "UP LADDER".
  $EE28,$01 Return if there's any token set in #R$BB37.
  $EE29,$02 Set #REGb to #N($00), so that #REGbc now holds the direction
. number.
  $EE2B,$03 Call #R$C201.
  $EE2E,$01 #REGhl+=#REGbc.
  $EE2F,$01 #REGa=*#REGhl.
  $EE30,$03 Jump to #R$EE37 if #REGa is zero.
  $EE33,$03 Call #R$ECB6.
  $EE36,$01 Return.
N $EE37 Nothing else is valid.
N $EE37 Print "#MESSAGE$BD32".
@ $EE37 label=MovePlayer_Invalid
  $EE37,$03 #REGhl=#R$BD32.
  $EE3A,$03 Jump to #R$ED66.

c $EE3D Action: Examine
@ $EE3D label=Action_Examine
E $EE3D View the equivalent code in;
. #LIST
. { #HEROES$F785 }
. { #JEWELS$F19D }
. { #ANDROMEDA$8F13 }
. { #WARLORD$F853 }
. LIST#
D $EE3D Describe the single object the player named.
  $EE3D,$03 Call #R$C309.
  $EE40,$01 Return if the direct object is malformed.
  $EE41,$05 Jump to #R$ED73 if #REGa is not equal to #N$01.
N $EE46 Was the player trying to examine ... Mara's body?
  $EE46,$06 Call #R$C26F with #R$E812.
  $EE4C,$02 Jump to #R$EE54 if the token isn't for Mara's body.
N $EE4E Print "#MESSAGE$DCB7".
  $EE4E,$03 #REGhl=#R$DCB7.
  $EE51,$03 Jump to #R$ED66.
N $EE54 Was the player trying to examine ... the witch?
@ $EE54 label=Examine_CheckWitch
  $EE54,$06 Call #R$C26F with #R$E814.
  $EE5A,$02 Jump to #R$EE69 if the token isn't for the witch.
  $EE5C,$07 Jump to #R$EE69 if #R$C24F reports that #ITEM$0B isn't in the
. current room.
N $EE63 Print "#MESSAGE$DCF0".
  $EE63,$03 #REGhl=#R$DCF0.
  $EE66,$03 Jump to #R$ED66.
N $EE69 Was the player trying to examine ... the witch (closed chest)?
@ $EE69 label=Examine_CheckWitchClosedChest
  $EE69,$06 Call #R$C26F with #R$E814.
  $EE6F,$02 Jump to #R$EE7E if the token isn't for the witch.
  $EE71,$07 Jump to #R$EE7E if #R$C24F reports that #ITEM$0C isn't in the
. current room.
N $EE78 Print "#MESSAGE$DC7B".
  $EE78,$03 #REGhl=#R$DC7B.
  $EE7B,$03 Jump to #R$ED66.
N $EE7E Nothing else is valid.
@ $EE7E label=Examine_Invalid
  $EE7E,$03 Jump to #R$ED78.

c $EE81 Action: Load
@ $EE81 label=Action_Load
E $EE81 View the equivalent code in;
. #LIST
. { #HEROES$F7AC }
. { #JEWELS$F236 }
. { #ANDROMEDA$8FA1 }
. { #WARLORD$F892 }
. LIST#
D $EE81 Load a saved position from tape.
  $EE81,$03 Call #R$C2FE.
N $EE84 The "LOAD" command can only be called on its own.
  $EE84,$01 Return if there's any token set in #R$BB37.
  $EE85,$03 Call #R$C380.
  $EE88,$01 Return.

c $EE89 Action: Save
@ $EE89 label=Action_Save
E $EE89 View the equivalent code in;
. #LIST
. { #HEROES$F7BC }
. { #JEWELS$F23E }
. { #ANDROMEDA$8FA9 }
. { #WARLORD$F8A1 }
. LIST#
D $EE89 Save the position to tape.
  $EE89,$03 Call #R$C2FE.
N $EE8C The "SAVE" command can only be called on its own.
  $EE8C,$01 Return if there's any token set in #R$BB37.
  $EE8D,$03 Call #R$C345.
  $EE90,$01 Return.

c $EE91 Action: Quit
@ $EE91 label=Action_Quit
E $EE91 View the equivalent code in;
. #LIST
. { #HEROES$F7C4 }
. { #JEWELS$F246 }
. { #ANDROMEDA$8FB1 }
. { #WARLORD$F8A9 }
. LIST#
D $EE91 Ask whether to abandon the game and, if so, offer to save it.
  $EE91,$03 Call #R$C2FE.
N $EE94 The "QUIT" command can only be called on its own.
  $EE94,$01 Return if there's any token set in #R$BB37.
N $EE95 Print "#MESSAGE$BC85".
  $EE95,$03 #REGhl=#R$BC85.
  $EE98,$03 Call #R$BE2E.
@ $EE9B label=WantToSave_Loop
  $EE9B,$03 Call #R$BDDA.
N $EE9E The player just wants to quit.
  $EE9E,$04 #HTML(Jump to #R$EEA9 if the keypress is "<code>#CHR$4E</code>".)
  $EEA2,$04 #HTML(Jump back to #R$EE9B if the keypress is anything other than
. "<code>#CHR$59</code>".)
N $EEA6 The player does want to save before quitting...
  $EEA6,$03 Call #R$C345.
N $EEA9 Jump to asking if the player "wants another game?"
@ $EEA9 label=QuitGame
  $EEA9,$04 Switch #R$EB29 onto the stack so the next return action is asking
. if the player would "Want another game? Y/N.".
  $EEAD,$01 Return.

c $EEAE Action: Take
@ $EEAE label=Action_Take
E $EEAE View the equivalent code in;
. #LIST
. { #HEROES$F80D }
. { #JEWELS$F263 }
. { #ANDROMEDA$8FCD }
. { #WARLORD$F956 }
. LIST#
D $EEAE Pick up the single object the player named.
  $EEAE,$03 Call #R$C309.
  $EEB1,$01 Return if the direct object is malformed.
  $EEB2,$05 Jump to #R$ED7D if #REGa is not equal to #N$01.
N $EEB7 Start by calling the chain of items to check...
  $EEB7,$03 Jump to #R$EEFC.

c $EEBA Take: Is Player Holding Item
@ $EEBA label=Take_IsPlayerHoldingItem
E $EEBA View the equivalent code in;
. #LIST
. { #JEWELS$F26A }
. { #ANDROMEDA$8FE2 }
. LIST#
D $EEBA Refuse the take when the object is already carried or the inventory is
. full; otherwise return so the caller can take it.
R $EEBA A Object ID
R $EEBA O:B The object ID (when returning so the take may proceed)
  $EEBA,$03 Call #R$C2D2.
N $EEBD Refuse when that object is already being carried.
  $EEBD,$02 Jump to #R$EEDD if the item is not being held.
  $EEBF,$01 Restore #REGhl from the stack.
N $EEC0 Finish the sentence "You're already carrying" with "it" or "them".
N $EEC0 Print "#MESSAGE$BCE0".
  $EEC0,$03 #REGhl=#R$BCE0.
  $EEC3,$03 Call #R$BE21.
  $EEC6,$03 #REGhl=#R$EEEB.
  $EEC9,$01 Copy the object ID back into #REGa.
  $EECA,$03 #REGbc=#N($0002,$04,$04).
  $EECD,$02 Search for the item ID among the plural items.
  $EECF,$02 Jump to #R$EED7 if the item is plural.
N $EED1 Print "#MESSAGE$BCFB".
  $EED1,$03 #REGhl=#R$BCFB.
  $EED4,$03 Jump to #R$ED66.
N $EED7 Print "#MESSAGE$BCFF".
@ $EED7 label=Take_AlreadyCarrying_Them
  $EED7,$03 #REGhl=#R$BCFF.
  $EEDA,$03 Jump to #R$ED66.
N $EEDD Refuse the object when the player is already holding #N$06 things.
@ $EEDD label=Take_InventoryFull
  $EEDD,$05 Compare *#R$BA68 with #N$06.
  $EEE2,$01 #REGb=#REGe.
  $EEE3,$01 Return if *#R$BA68 is not equal to #N$06.
  $EEE4,$01 Restore #REGhl from the stack.
N $EEE5 Print "#MESSAGE$BD05".
  $EEE5,$03 #REGhl=#R$BD05.
  $EEE8,$03 Jump to #R$ED66.

b $EEEB Table: Items Which Are Plural
@ $EEEB label=Table_ItemsWhichArePlural
E $EEEB View the equivalent code in;
. #LIST
. { #JEWELS$F29B }
. { #ANDROMEDA$9010 }
. LIST#
D $EEEB All the items in the game which are plural; used by #R$EEC6 and
. #R$F050.
B $EEEB,$01 Item #N(#PEEK(#PC)): #ITEM(#PEEK(#PC)).
L $EEEB,$01,$02,$02

c $EEED Take Item
@ $EEED label=TakeItem
E $EEED View the equivalent code in;
. #LIST
. { #JEWELS$F29C }
. { #ANDROMEDA$9014 }
. LIST#
D $EEED Places the item in the player's inventory and acknowledges success.
  $EEED,$02 Load #REGc with #N$01 which indicates the item will be in the
. players inventory.
  $EEEF,$03 Call #R$BF55.
  $EEF2,$04 Increment *#R$BA68 by one.
N $EEF6 Print "#MESSAGE$BCDB".
  $EEF6,$03 #REGhl=#R$BCDB.
  $EEF9,$03 Jump to #R$ED66.
c $EEFC Take: Mara's Body
@ $EEFC label=Validate_Take_MarasBody
D $EEFC Was the player trying to take Mara's body (the sword)?
  $EEFC,$06 Call #R$C26F with #R$E812.
  $EF02,$02 Jump to #R$EF14 if the token isn't for Mara's body.
  $EF04,$05 Call #R$EEBA with item #N$0A: #ITEM$0A.
  $EF09,$06 Call #R$BF55 to place #ITEM$33 in room #N$3E: "#ROOM$3E".
  $EF0F,$05 #REGb=#N$0A; jump to #R$EEED.

c $EF14 Take: Witch
@ $EF14 label=Validate_Take_Witch
D $EF14 Was the player trying to take ... the witch?
  $EF14,$06 Call #R$C26F with #R$E814.
  $EF1A,$02 Jump to #R$EF28 if the token isn't for the witch.
  $EF1C,$06 Call #R$C2EF with #R$E6FF.
  $EF22,$03 Call #R$EEBA.
  $EF25,$03 Jump to #R$EEED.

c $EF28 Take: Food
@ $EF28 label=Validate_Take_Food
D $EF28 Was the player trying to take ... the food?
  $EF28,$06 Call #R$C26F with #R$E816.
  $EF2E,$02 Jump to #R$EF38 if the token isn't for the food.
  $EF30,$05 Call #R$EEBA with item #N$00: #ITEM$00.
  $EF35,$03 Jump to #R$EEED.

c $EF38 Take: Silver Coin
@ $EF38 label=Validate_Take_SilverCoin
D $EF38 Was the player trying to take ... the silver coin?
  $EF38,$06 Call #R$C26F with #R$E818.
  $EF3E,$02 Jump to #R$EF48 if the token isn't for the silver coin.
  $EF40,$05 Call #R$EEBA with item #N$02: #ITEM$02.
  $EF45,$03 Jump to #R$EEED.

c $EF48 Take: Bow
@ $EF48 label=Validate_Take_Bow
D $EF48 Was the player trying to take ... the bow?
  $EF48,$06 Call #R$C26F with #R$E81D.
  $EF4E,$02 Jump to #R$EF58 if the token isn't for the bow.
  $EF50,$05 Call #R$EEBA with item #N$03: #ITEM$03.
  $EF55,$03 Jump to #R$EEED.

c $EF58 Take: Arrows
@ $EF58 label=Validate_Take_Arrows
D $EF58 Was the player trying to take ... the arrows?
  $EF58,$06 Call #R$C26F with #R$E81F.
  $EF5E,$02 Jump to #R$EF68 if the token isn't for the arrows.
  $EF60,$05 Call #R$EEBA with item #N$04: #ITEM$04.
  $EF65,$03 Jump to #R$EEED.

c $EF68 Take: Furnace
@ $EF68 label=Validate_Take_Furnace
D $EF68 Was the player trying to take ... the furnace?
  $EF68,$06 Call #R$C26F with #R$E821.
  $EF6E,$02 Jump to #R$EF7C if the token isn't for the furnace.
  $EF70,$06 Call #R$C2EF with #R$E6EF.
  $EF76,$03 Call #R$EEBA.
  $EF79,$03 Jump to #R$EEED.
N $EF7C Continue the take validation chain.
@ $EF7C label=Validate_Take_Continue
  $EF7C,$02 Jump to #R$EF7E.

c $EF7E Take: Log
@ $EF7E label=Validate_Take_Log
D $EF7E Was the player trying to take ... the log?
  $EF7E,$06 Call #R$C26F with #R$E825.
  $EF84,$02 Jump to #R$EFAD if the token isn't for the log.
  $EF86,$05 Call #R$EEBA with item #N$44: #ITEM$44.
  $EF8B,$05 Call #R$C2D8 with item #N$45: #ITEM$45.
  $EF90,$05 Call #R$C2D8 with item #N$46: #ITEM$46.
  $EF95,$06 Call #R$BF55 to place #ITEM$11 in room #N$15: "#ROOM$15".
  $EF9B,$06 Call #R$BF55 to place #ITEM$12 in room #N$16: "#ROOM$16".
N $EFA1 This action changes the map:
  $EFA1,$04 Write #N$00 to *#R$E9B4 to remove access to #ROOM$16 from #ROOM$15.
  $EFA5,$03 Write #N$00 to *#R$E9BB to remove access to #ROOM$15 from #ROOM$16.
  $EFA8,$02 Load #REGb with #ITEM$44.
  $EFAA,$03 Jump to #R$EEED.

c $EFAD Take: Horn
@ $EFAD label=Validate_Take_Horn
D $EFAD Was the player trying to take ... the horn?
  $EFAD,$06 Call #R$C26F with #R$E827.
  $EFB3,$02 Jump to #R$EFBD if the token isn't for the horn.
  $EFB5,$05 Call #R$EEBA with item #N$09: #ITEM$09.
  $EFBA,$03 Jump to #R$EEED.

c $EFBD Take: Open Chest
@ $EFBD label=Validate_Take_OpenChest
D $EFBD Was the player trying to take ... the open chest?
  $EFBD,$06 Call #R$C26F with #R$E829.
  $EFC3,$02 Jump to #R$EFE8 if the token isn't for the open chest.
  $EFC5,$06 Call #R$C2EF with #R$E706.
  $EFCB,$05 Call #R$C2D2; jump to #R$EFD5 if not held.
  $EFD0,$05 #REGe=#N$0F; jump to #R$EEC0.
N $EFD5 The player is not holding the open chest, so open it before picking
. it up.
@ $EFD5 label=Validate_Take_OpenChest_NotHeld
  $EFD5,$03 Call #R$EEDD.
  $EFD8,$05 Jump to #R$EFE3 if #REGe is #N$0F.
  $EFDD,$06 Call #R$C48F to transform #ITEM$0D into #ITEM$0E.
N $EFE3 Pick up the open chest.
@ $EFE3 label=Validate_Take_OpenChest_PickUp
  $EFE3,$05 #REGb=#N$0F; jump to #R$EEED.

c $EFE8 Take: Key
@ $EFE8 label=Validate_Take_Key
E $EFE8 View the equivalent code in;
. #LIST
. { #JEWELS$F423 }
. { #ANDROMEDA$910A }
. LIST#
D $EFE8 Was the player trying to take ... the key?
  $EFE8,$06 Call #R$C26F with #R$E82F.
  $EFEE,$02 Jump to #R$EFF8 if the token isn't for the key.
  $EFF0,$05 Call #R$EEBA with item #N$10: #ITEM$10.
  $EFF5,$03 Jump to #R$EEED.

c $EFF8 Take: Dead Spider
@ $EFF8 label=Validate_Take_DeadSpider
D $EFF8 Was the player trying to take ... the dead spider?
  $EFF8,$06 Call #R$C26F with #R$E831.
  $EFFE,$02 Jump to #R$F006 if the token isn't for the dead spider.
N $F000 Print "#MESSAGE$DC63".
  $F000,$03 #REGhl=#R$DC63.
  $F003,$03 Jump to #R$ED66.

c $F006 Take: Ring Off
@ $F006 label=Validate_Take_RingOff
D $F006 Was the player trying to take the ring off?
  $F006,$06 Call #R$C26F with #R$E833.
  $F00C,$02 Jump to #R$F011 if the token isn't for taking the ring off.
  $F00E,$03 Jump to #R$ED7D.

c $F011 Take: Rope
@ $F011 label=Validate_Take_Rope
D $F011 Was the player trying to take ... the rope?
  $F011,$06 Call #R$C26F with #R$E823.
  $F017,$02 Jump to #R$F037 if the token isn't for the rope.
  $F019,$07 Jump to #R$F037 if *#R$BA9B is room #N$48: "#ROOM$48".
  $F020,$05 Call #R$EEBA with item #N$08: #ITEM$08.
  $F025,$07 Jump to #R$F032 if #R$C24F reports that #ITEM$23 isn't in the
. current room.
  $F02C,$06 Call #R$C48F to transform #ITEM$23 into #ITEM$22.
N $F032 Pick up the rope.
@ $F032 label=Validate_Take_Rope_PickUp
  $F032,$05 #REGb=#N$08; jump to #R$EEED.
N $F037 Nothing else is valid.
@ $F037 label=Take_YouCant
  $F037,$03 Jump to #R$ED6E.


c $F03A Action: Drop
@ $F03A label=Action_Drop
E $F03A View the equivalent code in;
. #LIST
. { #HEROES$F8D0 }
. { #ANDROMEDA$9198 }
. { #WARLORD$F975 }
. LIST#
D $F03A Drop one of the objects the player named.
  $F03A,$03 Call #R$C309.
  $F03D,$01 Return if the direct object is malformed.
N $F03E Start by calling the chain of items to check...
  $F03E,$04 Jump to #R$F079 if #REGa is less than #N$03.
  $F042,$03 Jump to #R$ED7D.
N $F045 Check if the player is holding the requested item?
@ $F045 label=Drop_IsPlayerHoldingItem
  $F045,$03 Call #R$C2D2.
  $F048,$02 Jump to #R$F067 if the player is holding the requested item.
N $F04A Print "#MESSAGE$BD7F".
  $F04A,$03 #REGhl=#R$BD7F.
  $F04D,$03 Call #R$BE21.
  $F050,$01 Copy the object ID back into #REGa.
  $F051,$03 #REGhl=#R$EEEB.
  $F054,$03 #REGbc=#N($0002,$04,$04).
  $F057,$02 Search for the item ID among the plural items.
  $F059,$02 Jump to #R$F061 if the item is plural.
N $F05B Print "#MESSAGE$BCFB".
  $F05B,$03 #REGhl=#R$BCFB.
  $F05E,$03 Jump to #R$ED66.
N $F061 Print "#MESSAGE$BCFF".
@ $F061 label=Drop_NotCarrying_Them
  $F061,$03 #REGhl=#R$BCFF.
  $F064,$03 Jump to #R$ED66.
N $F067 The player has the item in their inventory so drop it.
@ $F067 label=DropItem
  $F067,$01 Copy the item ID into #REGb.
  $F068,$04 #REGc=*#R$BA9B.
N $F06C Alter the items location from the players inventory to the current room
. ID.
  $F06C,$03 Call #R$BF55.
  $F06F,$04 Decrease *#R$BA68 by one.
N $F073 Print "#MESSAGE$BCDB".
  $F073,$03 #REGhl=#R$BCDB.
  $F076,$03 Jump to #R$ED66.
N $F079 Was the player trying to drop Mara's body (the sword)?
@ $F079 label=Validate_Drop_MarasBody
  $F079,$06 Call #R$C26F with #R$E812.
  $F07F,$02 Jump to #R$F08B if the token isn't for Mara's body.
  $F081,$05 Call #R$C2D8 with item #N$33: #ITEM$33.
  $F086,$05 #REGa=#N$0A; jump to #R$F045.
N $F08B Was the player trying to drop ... the witch?
@ $F08B label=Validate_Drop_Witch
  $F08B,$06 Call #R$C26F with #R$E814.
  $F091,$02 Jump to #R$F09C if the token isn't for the witch.
  $F093,$06 Call #R$C2EF with #R$E6FF.
  $F099,$03 Jump to #R$F045.
N $F09C Was the player trying to drop ... the food?
@ $F09C label=Validate_Drop_Food
  $F09C,$06 Call #R$C26F with #R$E816.
  $F0A2,$02 Jump to #R$F0A9 if the token isn't for the food.
  $F0A4,$05 #REGa=#N$00; jump to #R$F045.
N $F0A9 Was the player trying to drop ... the silver coin?
@ $F0A9 label=Validate_Drop_SilverCoin
  $F0A9,$06 Call #R$C26F with #R$E818.
  $F0AF,$02 Jump to #R$F0B6 if the token isn't for the silver coin.
  $F0B1,$05 #REGa=#N$02; jump to #R$F045.
N $F0B6 Was the player trying to drop ... the bow?
@ $F0B6 label=Validate_Drop_Bow
  $F0B6,$06 Call #R$C26F with #R$E81D.
  $F0BC,$02 Jump to #R$F0C3 if the token isn't for the bow.
  $F0BE,$05 #REGa=#N$03; jump to #R$F045.
N $F0C3 Was the player trying to drop ... the arrows?
@ $F0C3 label=Validate_Drop_Arrows
  $F0C3,$06 Call #R$C26F with #R$E81F.
  $F0C9,$02 Jump to #R$F0D0 if the token isn't for the arrows.
  $F0CB,$05 #REGa=#N$04; jump to #R$F045.
N $F0D0 Was the player trying to drop ... the furnace (worn ring)?
@ $F0D0 label=Validate_Drop_Furnace
  $F0D0,$06 Call #R$C26F with #R$E821.
  $F0D6,$02 Jump to #R$F0EA if the token isn't for the furnace.
  $F0D8,$05 Call #R$C2D2 with item #N$43: #ITEM$43.
  $F0DD,$02 Jump to #R$F0E5 if #ITEM$43 isn't held.
  $F0DF,$06 Call #R$C48F to transform #ITEM$43 into #ITEM$07.
@ $F0E5 label=Validate_Drop_Furnace_Ring
  $F0E5,$05 #REGa=#N$07; jump to #R$F045.
N $F0EA Was the player trying to drop ... the rope?
@ $F0EA label=Validate_Drop_Rope
  $F0EA,$06 Call #R$C26F with #R$E823.
  $F0F0,$02 Jump to #R$F0F7 if the token isn't for the rope.
  $F0F2,$05 #REGa=#N$08; jump to #R$F045.
N $F0F7 Was the player trying to drop ... the log?
@ $F0F7 label=Validate_Drop_LogToken
  $F0F7,$06 Call #R$C26F with #R$E825.
  $F0FD,$02 Jump to #R$F104 if the token isn't for the log.
  $F0FF,$05 #REGa=#N$44; jump to #R$F045.
N $F104 Was the player trying to drop the log to bridge the chasm?
@ $F104 label=Validate_Drop_LogBridge
  $F104,$06 Call #R$C26F with #R$E839.
  $F10A,$02 Jump to #R$F14F if the token isn't for bridging the chasm.
  $F10C,$07 Jump to #R$F119 if #R$C24F reports that #ITEM$44 is in the current
. room.
N $F113 Print "#MESSAGE$DC8B".
  $F113,$03 #REGhl=#R$DC8B.
  $F116,$03 Jump to #R$ED66.
@ $F119 label=Validate_Drop_LogBridge_Held
  $F119,$05 Call #R$C2D2 with item #N$44: #ITEM$44.
  $F11E,$02 Jump to #R$F124 if #ITEM$44 isn't held.
  $F120,$04 Decrease *#R$BA68 by one.
@ $F124 label=Validate_Drop_LogBridge_Place
  $F124,$05 Call #R$C2D8 with item #N$44: #ITEM$44.
  $F129,$06 Call #R$BF55 to place #ITEM$45 in room #N$15: "#ROOM$15".
  $F12F,$06 Call #R$BF55 to place #ITEM$46 in room #N$16: "#ROOM$16".
  $F135,$05 Call #R$C2D8 with item #N$11: #ITEM$11.
  $F13A,$05 Call #R$C2D8 with item #N$12: #ITEM$12.
N $F13F This action changes the map:
  $F13F,$05 Write #N$16 to *#R$E9B4 to open up eastbound access to #ROOM$16
. from #ROOM$15.
  $F144,$05 Write #N$15 to *#R$E9BB to open up westbound access to #ROOM$15
. from #ROOM$16.
N $F149 Print "#MESSAGE$DCFE".
  $F149,$03 #REGhl=#R$DCFE.
  $F14C,$03 Jump to #R$ED66.
N $F14F Was the player trying to drop ... the horn?
@ $F14F label=Validate_Drop_Horn
  $F14F,$06 Call #R$C26F with #R$E827.
  $F155,$02 Jump to #R$F15C if the token isn't for the horn.
  $F157,$05 #REGa=#N$09; jump to #R$F045.
N $F15C Was the player trying to drop ... the open chest?
@ $F15C label=Validate_Drop_OpenChest
  $F15C,$06 Call #R$C26F with #R$E829.
  $F162,$02 Jump to #R$F180 if the token isn't for the open chest.
  $F164,$05 Call #R$C2D2 with item #N$0D: #ITEM$0D.
  $F169,$02 Jump to #R$F17B if #ITEM$0D isn't held.
  $F16B,$06 Call #R$BF55 to place #ITEM$0F in the inventory (#N$01).
  $F171,$06 Call #R$C48F to transform #ITEM$0D into #ITEM$0E.
  $F177,$04 Increment *#R$BA68 by one.
@ $F17B label=Validate_Drop_OpenChest_Drop
  $F17B,$05 #REGa=#N$0F; jump to #R$F045.
N $F180 Was the player trying to drop ... the key?
@ $F180 label=Validate_Drop_Key
  $F180,$06 Call #R$C26F with #R$E82F.
  $F186,$02 Jump to #R$F18D if the token isn't for the key.
  $F188,$05 #REGa=#N$10; jump to #R$F045.
N $F18D Nothing else is valid.
@ $F18D label=Drop_YouCant
  $F18D,$03 Jump to #R$ED6E.

c $F190 Action: Climb
@ $F190 label=Action_Climb
E $F190 View the equivalent code in;
. #LIST
. { #JEWELS$F946 }
. { #WARLORD$FADD }
. LIST#
D $F190 Climb the rope, the volcano or down into the boat.
  $F190,$03 Call #R$C309.
  $F193,$01 Return if the direct object is malformed.
N $F194 Was the player trying to climb ... the rope?
  $F194,$06 Call #R$C26F with #R$E83D.
  $F19A,$02 Jump to #R$F1B2 if the token isn't for the rope.
N $F19C The player is attempting to climb the rope into the volcano.
  $F19C,$08 Jump to #R$ED6E if *#R$BA9B isn't room #N$47: "#ROOM$47".
  $F1A4,$08 Jump to #R$ED6E if #ITEM$23 isn't in the current room.
  $F1AC,$05 Call #R$ECB6 with room #N$48: "#ROOM$48".
  $F1B1,$01 Return.
N $F1B2 Was the player trying to climb ... out of the volcano?
@ $F1B2 label=Climb_CheckOutOfVolcano
  $F1B2,$06 Call #R$C26F with #R$E840.
  $F1B8,$02 Jump to #R$F1C8 if the token isn't for climbing out.
N $F1BA The player is attempting to climb out of the volcano.
  $F1BA,$08 Jump to #R$ED6E if *#R$BA9B isn't room #N$48: "#ROOM$48".
  $F1C2,$05 Call #R$ECB6 with room #N$47: "#ROOM$47".
  $F1C7,$01 Return.
N $F1C8 Was the player trying to climb ... the volcano wall?
@ $F1C8 label=Climb_CheckVolcanoWall
  $F1C8,$06 Call #R$C26F with #R$E855.
  $F1CE,$02 Jump to #R$F1DA if the token isn't for the volcano wall.
N $F1D0 The climb fails and ends the game.
  $F1D0,$04 Switch #R$EB23 onto the stack.
N $F1D4 Print "#MESSAGE$DDE6".
  $F1D4,$03 #REGhl=#R$DDE6.
  $F1D7,$03 Jump to #R$ED66.
N $F1DA Was the player trying to climb ... into the boat?
@ $F1DA label=Climb_CheckIntoBoat
  $F1DA,$06 Call #R$C26F with #R$E85B.
  $F1E0,$02 Jump to #R$F1F5 if the token isn't for getting into the boat.
  $F1E2,$07 Jump to #R$F1EF if #R$C24F reports that #ITEM$1D is in the current
. room.
N $F1E9 Print "#MESSAGE$DC9A".
  $F1E9,$03 #REGhl=#R$DC9A.
  $F1EC,$03 Jump to #R$ED66.
@ $F1EF label=Climb_EnterBoat
  $F1EF,$05 Call #R$ECB6 with room #N$1D: "#ROOM$1D".
  $F1F4,$01 Return.
N $F1F5 Was the player trying to climb ... out of the boat?
@ $F1F5 label=Climb_CheckOutOfBoat
  $F1F5,$06 Call #R$C26F with #R$E86B.
  $F1FB,$02 Jump to #R$F213 if the token isn't for getting out of the boat.
  $F1FD,$07 Jump to #R$F20A if *#R$BA9B is room #N$1D: "#ROOM$1D".
N $F204 Print "#MESSAGE$DE33".
  $F204,$03 #REGhl=#R$DE33.
  $F207,$03 Jump to #R$ED66.
@ $F20A label=Climb_LeaveBoat
  $F20A,$05 #REGa=#N$1D; call #R$C2BE.
  $F20F,$03 Call #R$ECB6.
  $F212,$01 Return.
N $F213 Nothing else is valid.
@ $F213 label=Climb_YouCant
  $F213,$03 Jump to #R$ED6E.

c $F216 Action: Give
@ $F216 label=Action_Give
E $F216 View the equivalent code in;
. #LIST
. { #HEROES$F972 }
. { #JEWELS$F7AB }
. { #ANDROMEDA$941B }
. { #WARLORD$F9B3 }
. LIST#
D $F216 Give the chest or the crystals to the blacksmith.
  $F216,$03 Call #R$C32D.
  $F219,$01 Return if the direct object is malformed.
N $F21A Was the player trying to give ... to the old man / blacksmith?
  $F21A,$06 Call #R$C26F with #R$E843.
  $F220,$02 Jump to #R$F26A if the token isn't for the old man.
  $F222,$07 Jump to #R$F22F if #R$C24F reports that #ITEM$25 is in the current
. room.
N $F229 Print "#MESSAGE$DD38".
  $F229,$03 #REGhl=#R$DD38.
  $F22C,$03 Jump to #R$ED66.
@ $F22F label=Give_CheckOpenChest
  $F22F,$07 Jump to #R$F23E if #R$C24F reports that #ITEM$0D isn't in the
. current room.
  $F236,$06 Call #R$C48F to transform #ITEM$0D into #ITEM$0E.
  $F23C,$02 Jump to #R$F249.
@ $F23E label=Give_CheckCrystals
  $F23E,$05 Call #R$C2D2 with item #N$0F: #ITEM$0F.
  $F243,$02 Jump to #R$F249 if #ITEM$0F isn't held.
  $F245,$04 Decrease *#R$BA68 by one.
@ $F249 label=Give_HandOver
  $F249,$05 Call #R$C2D8 with item #N$0F: #ITEM$0F.
  $F24E,$06 Call #R$C48F to transform #ITEM$25 into #ITEM$26.
  $F254,$05 Call #R$C2D8 with #N$88.
  $F259,$05 Call #R$C2DF with item #N$0A: #ITEM$0A.
N $F25E Print "#MESSAGE$DD4D".
  $F25E,$03 #REGhl=#R$DD4D.
  $F261,$03 Call #R$BE2E.
N $F264 Print "#MESSAGE$DD84".
  $F264,$03 #REGhl=#R$DD84.
  $F267,$03 Jump to #R$ED6A.
N $F26A Nothing else is valid.
@ $F26A label=Give_YouCant
  $F26A,$03 Jump to #R$ED6E.

c $F26D Action: Eat
@ $F26D label=Action_Eat
E $F26D View the equivalent code in;
. #LIST
. { #JEWELS$F999 }
. { #ANDROMEDA$9469 }
. { #WARLORD$FBC3 }
. LIST#
D $F26D Eat the food, if it is being carried.
  $F26D,$03 Call #R$C309.
  $F270,$01 Return if the direct object is malformed.
N $F271 Was the player trying to eat ... the food?
  $F271,$06 Call #R$C26F with #R$E816.
  $F277,$02 Jump to #R$F284 if the token isn't for the food.
  $F279,$05 Call #R$C2D2 with item #N$00: #ITEM$00.
  $F27E,$02 Jump to #R$F284 if #ITEM$00 isn't held.
  $F280,$04 Decrease *#R$BA68 by one.
@ $F284 label=Eat_Consume
  $F284,$05 Call #R$C2D8 with item #N$00: #ITEM$00.
N $F289 Print "#MESSAGE$DE4B".
  $F289,$03 #REGhl=#R$DE4B.
  $F28C,$03 Jump to #R$ED66.

c $F28F Response: "You Can't"
@ $F28F label=Response_YouCantJump
  $F28F,$03 Jump to #R$ED6E.

c $F292 Action: Drink
@ $F292 label=Action_Drink
E $F292 View the equivalent code in;
. #LIST
. { #HEROES$FAA5 }
. { #JEWELS$F9E4 }
. { #ANDROMEDA$98AB }
. { #WARLORD$FA91 }
. LIST#
D $F292 Drinking does nothing useful here.
  $F292,$03 Call #R$C309.
  $F295,$01 Return if the direct object is malformed.
N $F296 Was the player trying to drink ...?
  $F296,$06 Call #R$C26F with #R$E87B.
  $F29C,$02 Jump to #R$F2A4 if the token isn't for drinking.
N $F29E Print "#MESSAGE$DE71".
  $F29E,$03 #REGhl=#R$DE71.
  $F2A1,$03 Jump to #R$ED66.
N $F2A4 Nothing else is valid.
@ $F2A4 label=Drink_YouCant
  $F2A4,$03 Jump to #R$ED6E.

c $F2A7 Action: Kill
@ $F2A7 label=Action_Kill
E $F2A7 View the equivalent code in;
. #LIST
. { #HEROES$FA72 }
. { #JEWELS$F851 }
. { #ANDROMEDA$952B }
. { #WARLORD$FC4B }
. LIST#
D $F2A7 Fight the opponent the player named.
  $F2A7,$03 Call #R$C32D.
  $F2AA,$01 Return if the direct object is malformed.
  $F2AB,$03 Jump to #R$F30B.
N $F2AE Does the player hold the bow and some arrows?
@ $F2AE label=Kill_CheckBowAndArrows
  $F2AE,$05 Call #R$C2D2 with item #N$03: #ITEM$03.
  $F2B3,$02 Jump to #R$F2C0 if #ITEM$03 isn't held.
  $F2B5,$05 Call #R$C2D2 with item #N$04: #ITEM$04.
  $F2BA,$01 Return if #ITEM$04 is held.
N $F2BB Print "#MESSAGE$DED1".
  $F2BB,$03 #REGhl=#R$DED1.
  $F2BE,$02 Jump to #R$F2C3.
N $F2C0 Print "#MESSAGE$DF29".
@ $F2C0 label=Kill_NoBow
  $F2C0,$03 #REGhl=#R$DF29.
@ $F2C3 label=Kill_WeaponReply
  $F2C3,$01 Restore #REGde from the stack.
  $F2C4,$03 Jump to #R$ED66.
N $F2C7 Does the player hold the sword?
@ $F2C7 label=Kill_CheckSword
  $F2C7,$05 Call #R$C2D2 with item #N$0A: #ITEM$0A.
  $F2CC,$01 Return if #ITEM$0A is held.
N $F2CD Print "#MESSAGE$DF72".
  $F2CD,$03 #REGhl=#R$DF72.
  $F2D0,$01 Restore #REGde from the stack.
  $F2D1,$03 Jump to #R$ED66.
N $F2D4 Print "#MESSAGE$DEE5".
@ $F2D4 label=Kill_AnnounceArrow
  $F2D4,$01 Stash #REGaf on the stack.
  $F2D5,$03 #REGhl=#R$DEE5.
  $F2D8,$02 Jump to #R$F2DE.
N $F2DA Print "#MESSAGE$DF5C".
@ $F2DA label=Kill_ResolveAttack
  $F2DA,$01 Stash #REGaf on the stack.
  $F2DB,$03 #REGhl=#R$DF5C.
@ $F2DE label=Kill_ResolveAttack_Print
  $F2DE,$03 Call #R$BE2E.
  $F2E1,$01 Restore #REGaf from the stack.
  $F2E2,$02 Return if this attack cannot miss.
  $F2E4,$03 Call #R$BF45.
  $F2E7,$01 Return if the blow lands.
N $F2E8 Print "#MESSAGE$DEF9".
  $F2E8,$03 #REGhl=#R$DEF9.
  $F2EB,$01 Restore #REGde from the stack.
  $F2EC,$03 Jump to #R$ED6A.
N $F2EF Turn the defeated scenic event into its corpse.
@ $F2EF label=Kill_ApplyCombatResult
  $F2EF,$0D Call #R$C48F to turn the defeated scenic event into its corpse.
  $F2FC,$01 Return.
N $F2FD Turn the second defeated scenic event into its corpse.
@ $F2FD label=Kill_ApplySecondCombatResult
  $F2FD,$0D Call #R$C48F to turn the second defeated scenic event into its
. corpse.
  $F30A,$01 Return.
N $F30B Was the player trying to kill ... the elf with the sword?
@ $F30B label=Validate_Kill_ElfSword
  $F30B,$08 Jump to #R$F344 unless the player named the elf with the sword.
  $F313,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F319,$05 Jump back to #R$ED82 when the named opponent is already dead.
  $F31E,$06 Call #R$F2C7.
  $F324,$05 Call #R$F2DA.
  $F329,$03 Call #R$F2EF.
  $F32C,$07 Jump to #R$F338 unless the value #N$82 matches.
  $F333,$05 Remove object #N$86 (the centaur) from the game.
@ $F338 label=Kill_ElfSword_Done
  $F338,$06 Print "#MESSAGE$DF44".
N $F33E Print "#MESSAGE$DFA3".
  $F33E,$03 #REGhl=#R$DFA3.
  $F341,$03 Jump to #R$ED66.
N $F344 Was the player trying to kill ... the elf with the bow?
@ $F344 label=Validate_Kill_ElfBow
  $F344,$08 Jump to #R$F37D unless the player named the elf with the bow.
  $F34C,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F352,$05 Jump back to #R$ED82 when the named opponent is already dead.
  $F357,$06 Call #R$F2AE.
  $F35D,$05 Call #R$F2D4.
  $F362,$03 Call #R$F2EF.
  $F365,$07 Jump to #R$F371 unless the value #N$82 matches.
  $F36C,$05 Remove object #N$86 (the centaur) from the game.
@ $F371 label=Kill_ElfBow_Done
  $F371,$06 Print "#MESSAGE$DF0E".
N $F377 Print "#MESSAGE$DFA3".
  $F377,$03 #REGhl=#R$DFA3.
  $F37A,$03 Jump to #R$ED66.
N $F37D Was the player trying to kill ... the warrior with the sword?
@ $F37D label=Validate_Kill_WarriorSword
  $F37D,$08 Jump to #R$F3AA unless the player named the dead warrior.
  $F385,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F38B,$05 Jump back to #R$ED8C when the named opponent is already dead.
  $F390,$06 Call #R$F2C7.
  $F396,$05 Call #R$F2DA.
  $F39B,$03 Call #R$F2FD.
  $F39E,$06 Print "#MESSAGE$DF44".
N $F3A4 Print "#MESSAGE$DFB4".
  $F3A4,$03 #REGhl=#R$DFB4.
  $F3A7,$03 Jump to #R$ED66.
N $F3AA Was the player trying to kill ... the warrior with the bow?
@ $F3AA label=Validate_Kill_WarriorBow
  $F3AA,$08 Jump to #R$F3D7 unless the player named the dead warrior.
  $F3B2,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F3B8,$05 Jump back to #R$ED8C when the named opponent is already dead.
  $F3BD,$06 Call #R$F2AE.
  $F3C3,$05 Call #R$F2D4.
  $F3C8,$03 Call #R$F2FD.
  $F3CB,$06 Print "#MESSAGE$DF0E".
N $F3D1 Print "#MESSAGE$DFB4".
  $F3D1,$03 #REGhl=#R$DFB4.
  $F3D4,$03 Jump to #R$ED66.
N $F3D7 Was the player trying to kill ... the slime monster with the bow?
@ $F3D7 label=Validate_Kill_MonsterBow
  $F3D7,$08 Jump to #R$F3F8 unless the player named the monster with the bow.
  $F3DF,$03 Call #R$F2AE.
  $F3E2,$05 Call #R$F2D4.
  $F3E7,$05 Destroy #ITEM$1E.
  $F3EC,$06 Print "#MESSAGE$DF0E".
N $F3F2 Print "#MESSAGE$E009".
  $F3F2,$03 #REGhl=#R$E009.
  $F3F5,$03 Jump to #R$ED66.
N $F3F8 Was the player trying to kill ... the dragon?
@ $F3F8 label=Validate_Kill_Dragon
  $F3F8,$08 Jump to #R$F41B unless the player named the glowing rock.
  $F400,$08 Jump to #R$ED8C if #ITEM$16 is not here.
  $F408,$03 Call #R$F2AE.
  $F40B,$04 Call #R$F2D4.
  $F40F,$06 Call #R$C48F to transform #ITEM$16 into #ITEM$17.
N $F415 Print "#MESSAGE$DFE0".
  $F415,$03 #REGhl=#R$DFE0.
  $F418,$03 Jump to #R$ED6A.
N $F41B Was the player trying to kill ... the wood nymph?
@ $F41B label=Validate_Kill_WoodNymph
  $F41B,$08 Jump to #R$F443 unless the player named a closed door.
  $F423,$08 Jump to #R$ED87 if object #N$8A (the wood nymph) is not here.
  $F42B,$03 Call #R$F2AE.
  $F42E,$04 Call #R$F2D4.
  $F432,$06 Call #R$C48F to transform #N$8A into #ITEM$1C.
  $F438,$05 Destroy object #N$89 (the nymph's glimpse).
N $F43D Print "#MESSAGE$DFF4".
  $F43D,$03 #REGhl=#R$DFF4.
  $F440,$03 Jump to #R$ED6A.
N $F443 Was the player trying to kill ... the demons with the sword?
@ $F443 label=Validate_Kill_DemonsSword
  $F443,$08 Jump to #R$F463 unless the player named the log bridge.
  $F44B,$03 Call #R$F2C7.
  $F44E,$05 Call #R$F2DA.
  $F453,$05 Destroy #ITEM$29.
N $F458 This action changes the map:
  $F458,$05 Write #N$49 to *#R$EADA to open up eastbound access to #ROOM$49
. from #ROOM$46.
N $F45D Print "#MESSAGE$E041".
  $F45D,$03 #REGhl=#R$E041.
  $F460,$03 Jump to #R$ED6A.
N $F463 Was the player trying to kill ... the demons with the bow?
@ $F463 label=Validate_Kill_DemonsBow
  $F463,$08 Jump to #R$F474 unless the player named the log bridge.
  $F46B,$03 Call #R$F2AE.
N $F46E Print "#MESSAGE$E06F".
  $F46E,$03 #REGhl=#R$E06F.
  $F471,$03 Jump to #R$ED66.
N $F474 Was the player trying to kill ... the blacksmith with the sword?
@ $F474 label=Validate_Kill_BlacksmithSword
  $F474,$08 Jump to #R$F49D unless the player named the ring being worn.
  $F47C,$08 Jump to #R$ED82 when #ITEM$27 is here.
  $F484,$03 Call #R$F2C7.
  $F487,$04 Call #R$F2DA.
@ $F48B label=Kill_BlacksmithBody
N $F48B Fight the Korl warrior.
  $F48B,$06 Call #R$C2EF to skip to the object named by this phrase.
  $F491,$06 Call #R$C48F to turn the warrior into the dead blacksmith.
N $F497 Print "#MESSAGE$E086".
  $F497,$03 #REGhl=#R$E086.
  $F49A,$03 Jump to #R$ED6A.
N $F49D Was the player trying to kill ... the blacksmith with the bow?
@ $F49D label=Validate_Kill_BlacksmithBow
  $F49D,$08 Jump to #R$F4B7 unless the player named the ring being worn.
  $F4A5,$08 Jump to #R$ED82 when #ITEM$27 is here.
  $F4AD,$03 Call #R$F2AE.
  $F4B0,$04 Call #R$F2D4.
  $F4B4,$03 Jump back to #R$F48B to finish off the warrior.
N $F4B7 Was the player trying to kill ... Zarn with the sword?
@ $F4B7 label=Validate_Kill_ZarnSword
  $F4B7,$08 Jump to #R$F4E6 unless the player named the log bridge.
  $F4BF,$08 Jump to #R$ED82 if #ITEM$2A is not here.
  $F4C7,$03 Call #R$F2C7.
  $F4CA,$05 Call #R$F2DA.
  $F4CF,$06 Call #R$C48F to transform #ITEM$2A into #ITEM$2B.
  $F4D5,$0B Arm Princess Mara's arrival, then pause and print "#MESSAGE$DF44"
. and start a new line.
N $F4E0 Print "#MESSAGE$E09B".
  $F4E0,$03 #REGhl=#R$E09B.
  $F4E3,$03 Jump to #R$ED66.
N $F4E6 Was the player trying to kill ... Zarn with the bow?
@ $F4E6 label=Validate_Kill_ZarnBow
  $F4E6,$08 Jump to #R$F4FF unless the player named the log bridge.
  $F4EE,$08 Jump to #R$ED82 if #ITEM$2A is not here.
  $F4F6,$03 Call #R$F2AE.
N $F4F9 Print "#MESSAGE$E06F".
  $F4F9,$03 #REGhl=#R$E06F.
  $F4FC,$03 Jump to #R$ED66.
N $F4FF Was the player trying to kill ... Princess Mara with the sword?
@ $F4FF label=Validate_Kill_PrincessSword
  $F4FF,$08 Jump to #R$F527 unless the player named the princess with the sword.
  $F507,$08 Jump to #R$ED87 if #ITEM$2C is not here.
  $F50F,$03 Call #R$F2C7.
  $F512,$04 Call #R$F2DA.
@ $F516 label=Kill_PrincessBody
N $F516 Fight the witch.
  $F516,$06 Call #R$C48F to transform #ITEM$2C into #ITEM$2D.
  $F51C,$0B Stop Princess Mara appearing, then pause and print "#MESSAGE$DFF4"
. and return to the game loop.
N $F527 Was the player trying to kill ... Princess Mara with the bow?
@ $F527 label=Validate_Kill_PrincessBow
  $F527,$08 Jump to #R$F541 unless the player named the princess with the bow.
  $F52F,$08 Jump to #R$ED87 if #ITEM$2C is not here.
  $F537,$03 Call #R$F2AE.
  $F53A,$04 Call #R$F2D4.
  $F53E,$03 Jump back to #R$F516 to finish off the witch.
N $F541 Was the player trying to kill ... the warrior with the sword?
@ $F541 label=Validate_Kill_WarriorSword2
  $F541,$08 Jump to #R$F56B unless the player named the warrior with the sword.
  $F549,$08 Jump to #R$ED82 if object #N$8C is not here.
  $F551,$03 Call #R$F2C7.
  $F554,$05 Call #R$F2DA.
  $F559,$03 The sword lands, with "#MESSAGE$DF44".
@ $F55C label=Kill_WarriorBody
N $F55C Fight the blacksmith.
  $F55C,$03 Call #R$C486 to pause, then print that message and start a new line.
  $F55F,$06 Call #R$C48F to transform #N$8C into #ITEM$34.
N $F565 Print "#MESSAGE$E086".
  $F565,$03 #REGhl=#R$E086.
  $F568,$03 Jump to #R$ED66.
N $F56B Was the player trying to kill ... the warrior with the bow?
@ $F56B label=Validate_Kill_WarriorBow2
  $F56B,$08 Jump to #R$F589 unless the player named the warrior with the bow.
  $F573,$08 Jump to #R$ED82 if object #N$8C is not here.
  $F57B,$03 Call #R$F2AE.
  $F57E,$05 Call #R$F2D4.
  $F583,$06 Print "#MESSAGE$DF0E" and strike the blacksmith.
N $F589 Was the player trying to kill ... the giant spider with the bow?
@ $F589 label=Validate_Kill_SpiderBow
  $F589,$08 Jump to #R$F5B3 unless the player named the spider with the bow.
  $F591,$08 Jump to #R$ED8C if #ITEM$41 is not here.
  $F599,$03 Call #R$F2AE.
  $F59C,$05 Call #R$F2D4.
  $F5A1,$06 Call #R$C48F to transform #ITEM$41 into #ITEM$42.
  $F5A7,$06 Print "#MESSAGE$DF0E".
N $F5AD Print "#MESSAGE$DFE0".
  $F5AD,$03 #REGhl=#R$DFE0.
  $F5B0,$03 Jump to #R$ED66.
N $F5B3 Nothing else is valid.
@ $F5B3 label=Kill_YouCant
  $F5B3,$03 Jump to #R$ED6E.
c $F5B6 Action: Kiss
@ $F5B6 label=Action_Kiss
E $F5B6 View the equivalent code in;
. #LIST
. { #HEROES$F989 }
. LIST#
D $F5B6 Kiss Princess Mara, if she is here and still alive.
  $F5B6,$03 Call #R$C309.
  $F5B9,$01 Return if the direct object is malformed.
  $F5BA,$02 Jump to #R$F5C8.
N $F5BC Print "#MESSAGE$E14E".
@ $F5BC label=Kiss_TooLate
  $F5BC,$03 #REGhl=#R$E14E.
  $F5BF,$03 Jump to #R$ED66.
N $F5C2 Print "#MESSAGE$E113".
@ $F5C2 label=Kiss_Success
  $F5C2,$03 #REGhl=#R$E113.
  $F5C5,$03 Jump to #R$ED66.
N $F5C8 Was the player trying to kiss ... the princess?
@ $F5C8 label=Validate_Kiss_Princess
  $F5C8,$06 Call #R$C26F with #R$E8E3.
  $F5CE,$02 Jump to #R$F5DB if the token isn't for the princess.
  $F5D0,$08 Jump to #R$F5BC if #R$C24F reports that #ITEM$2C isn't in the
. current room.
  $F5D8,$03 Jump to #R$F5C2.
N $F5DB Was the player trying to kiss ... a closed door?
@ $F5DB label=Validate_Kiss_ClosedDoor
  $F5DB,$06 Call #R$C26F with #R$E8E5.
  $F5E1,$02 Jump to #R$F5EE if the token isn't for a closed door.
  $F5E3,$08 Jump to #R$F5BC if #R$C24F reports that #ITEM$1C is in the
. current room.
  $F5EB,$03 Jump to #R$F5C2.
N $F5EE Nothing else is valid.
@ $F5EE label=Kiss_YouCant
  $F5EE,$03 Jump to #R$ED91.

c $F5F1 Action: Open
@ $F5F1 label=Action_Open
E $F5F1 View the equivalent code in;
. #LIST
. { #HEROES$F9DC }
. { #JEWELS$FA3C }
. { #ANDROMEDA$96E7 }
. LIST#
D $F5F1 Open the named door, gate or chest.
  $F5F1,$03 Call #R$C309.
  $F5F4,$01 Return if the direct object is malformed.
N $F5F5 Was the player trying to open ... the door?
  $F5F5,$06 Call #R$C26F with #R$E8EA.
  $F5FB,$03 Jump to #R$F665 if the token isn't for the door.
  $F5FE,$06 Call #R$C2EF with #R$E797.
  $F604,$04 Jump to #R$F60E if the named door is closed.
N $F608 Print "#MESSAGE$E172".
  $F608,$03 #REGhl=#R$E172.
  $F60B,$03 Jump to #R$ED66.
N $F60E Which door is the player opening?
@ $F60E label=Open_CheckRoom
  $F60E,$07 Jump to #R$F619 if *#R$BA9B is room #N$02: "#ROOM$02".
  $F615,$04 Jump to #R$F62D if *#R$BA9B isn't room #N$03: "#ROOM$03".
N $F619 Change the farmhouse door states!
@ $F619 label=Open_Farmhouse
  $F619,$06 Call #R$C48F to transform #ITEM$36 into #ITEM$35.
  $F61F,$06 Call #R$C48F to transform #ITEM$38 into #ITEM$37.
N $F625 This action changes the map:
  $F625,$05 Write #N$03 to *#R$E941 to open up southbound access to #ROOM$03
. from #ROOM$02.
  $F62A,$03 Jump to #R$ED96.
N $F62D Is the player at the Woodman's Hut?
@ $F62D label=Open_CheckWoodmansHut
  $F62D,$04 Jump to #R$F635 if *#R$BA9B is room #N$0F: "#ROOM$0F".
  $F631,$04 Jump to #R$F649 if *#R$BA9B isn't room #N$10: "#ROOM$10".
N $F635 Change the Woodman's Hut door states!
@ $F635 label=Open_WoodmansHut
  $F635,$06 Call #R$C48F to transform #ITEM$3A into #ITEM$39.
  $F63B,$06 Call #R$C48F to transform #ITEM$3C into #ITEM$3B.
N $F641 This action changes the map:
  $F641,$05 Write #N$0F to *#R$E996 to open up eastbound access to #ROOM$0F
. from #ROOM$10.
  $F646,$03 Jump to #R$ED96.
N $F649 Is the player at the Witch's Hovel?
@ $F649 label=Open_CheckWitchsHovel
  $F649,$04 Jump to #R$F651 if *#R$BA9B is room #N$3C: "#ROOM$3C".
  $F64D,$04 Jump to #R$F665 if *#R$BA9B isn't room #N$3D: "#ROOM$3D".
N $F651 Change the Witch's Hovel door states!
@ $F651 label=Open_WitchsHovel
  $F651,$06 Call #R$C48F to transform #ITEM$3E into #ITEM$3D.
  $F657,$06 Call #R$C48F to transform #ITEM$40 into #ITEM$3F.
N $F65D This action changes the map:
  $F65D,$05 Write #N$3C to *#R$EAA4 to open up eastbound access to #ROOM$3C
. from #ROOM$3D.
  $F662,$03 Jump to #R$ED96.
N $F665 Was the player trying to open ... the chest?
@ $F665 label=Validate_Open_Chest
  $F665,$06 Call #R$C26F with #R$E814.
  $F66B,$02 Jump to #R$F689 if the token isn't for the chest.
  $F66D,$08 Jump to #R$EDB4 if #R$C24F reports that #ITEM$0B is in the
. current room.
  $F675,$08 Jump to #R$EDB9 if #R$C24F reports that #ITEM$0C isn't in the
. current room.
  $F67D,$06 Call #R$C48F to transform #ITEM$0C into #ITEM$0D.
N $F683 Print "#MESSAGE$D608".
  $F683,$03 #REGhl=#R$D608.
  $F686,$03 Jump to #R$ED66.
N $F689 Nothing else is valid.
@ $F689 label=Open_YouCant
  $F689,$03 Jump to #R$ED6E.

c $F68C Action: Close
@ $F68C label=Action_Close
E $F68C View the equivalent code in;
. #LIST
. { #HEROES$F9E3 }
. { #JEWELS$FAA8 }
. { #ANDROMEDA$975A }
. LIST#
D $F68C Close the named door, gate or chest.
  $F68C,$03 Call #R$C309.
  $F68F,$01 Return if the direct object is malformed.
N $F690 Was the player trying to close ... the door?
  $F690,$06 Call #R$C26F with #R$E8EA.
  $F696,$03 Jump to #R$F6FD if the token isn't for the door.
  $F699,$06 Call #R$C2EF with #R$E797.
  $F69F,$04 Jump to #R$F6A9 if the named door is open.
N $F6A3 Print "#MESSAGE$E185".
  $F6A3,$03 #REGhl=#R$E185.
  $F6A6,$03 Jump to #R$ED66.
N $F6A9 Which door is the player closing?
@ $F6A9 label=Close_CheckRoom
  $F6A9,$07 Jump to #R$F6B4 if *#R$BA9B is room #N$02: "#ROOM$02".
  $F6B0,$04 Jump to #R$F6C7 if *#R$BA9B isn't room #N$03: "#ROOM$03".
N $F6B4 Change the farmhouse door states!
@ $F6B4 label=Close_Farmhouse
  $F6B4,$06 Call #R$C48F to transform #ITEM$35 into #ITEM$36.
  $F6BA,$06 Call #R$C48F to transform #ITEM$37 into #ITEM$38.
N $F6C0 This action changes the map:
  $F6C0,$04 Write #N$00 to *#R$E941 to close off southbound access to #ROOM$03
. from #ROOM$02.
  $F6C4,$03 Jump to #R$ED96.
N $F6C7 Is the player at the Woodman's Hut?
@ $F6C7 label=Close_CheckWoodmansHut
  $F6C7,$04 Jump to #R$F6CF if *#R$BA9B is room #N$0F: "#ROOM$0F".
  $F6CB,$04 Jump to #R$F6E2 if *#R$BA9B isn't room #N$10: "#ROOM$10".
N $F6CF Change the Woodman's Hut door states!
@ $F6CF label=Close_WoodmansHut
  $F6CF,$06 Call #R$C48F to transform #ITEM$39 into #ITEM$3A.
  $F6D5,$06 Call #R$C48F to transform #ITEM$3B into #ITEM$3C.
N $F6DB This action changes the map:
  $F6DB,$04 Write #N$00 to *#R$E996 to close off eastbound access to #ROOM$0F
. from #ROOM$10.
  $F6DF,$03 Jump to #R$ED96.
N $F6E2 Is the player at the Witch's Hovel?
@ $F6E2 label=Close_CheckWitchsHovel
  $F6E2,$04 Jump to #R$F6EA if *#R$BA9B is room #N$3C: "#ROOM$3C".
  $F6E6,$04 Jump to #R$F6FD if *#R$BA9B isn't room #N$3D: "#ROOM$3D".
N $F6EA Change the Witch's Hovel door states!
@ $F6EA label=Close_WitchsHovel
  $F6EA,$06 Call #R$C48F to transform #ITEM$3D into #ITEM$3E.
  $F6F0,$06 Call #R$C48F to transform #ITEM$3F into #ITEM$40.
N $F6F6 This action changes the map:
  $F6F6,$04 Write #N$00 to *#R$EAA4 to close off eastbound access to #ROOM$3C
. from #ROOM$3D.
  $F6FA,$03 Jump to #R$ED96.
N $F6FD Was the player trying to close ... the chest?
@ $F6FD label=Validate_Close_Chest
  $F6FD,$06 Call #R$C26F with #R$E814.
  $F703,$02 Jump to #R$F718 if the token isn't for the chest.
  $F705,$08 Jump to #R$EDBE if #R$C24F reports that #ITEM$0B is in the
. current room.
  $F70D,$08 Jump to #R$EDBE if #R$C24F reports that #ITEM$0C is in the
. current room.
  $F715,$03 Jump to #R$ED78.
N $F718 Nothing else is valid.
@ $F718 label=Close_YouCant
  $F718,$03 Jump to #R$ED6E.

c $F71B Action: Enter
@ $F71B label=Action_Enter
E $F71B View the equivalent code in;
. #LIST
. { #JEWELS$FC61 }
. { #ANDROMEDA$93A1 }
. { #WARLORD$FB21 }
. LIST#
D $F71B Go into the farmhouse, the hut, the forge, the hovel or the boat.
  $F71B,$03 Call #R$C309.
  $F71E,$01 Return if the direct object is malformed.
N $F71F Was the player trying to enter ... the farmhouse?
  $F71F,$06 Call #R$C26F with #R$E8EC.
  $F725,$02 Jump to #R$F73D if the token isn't for the farmhouse.
N $F727 The player is attempting to enter the farmhouse.
  $F727,$08 Jump to #R$ED9B if *#R$BA9B isn't room #N$03: "#ROOM$03".
  $F72F,$08 Jump to #R$ED6E if #ITEM$35 isn't in the current room.
  $F737,$05 Call #R$ECB6 with room #N$02: "#ROOM$02".
  $F73C,$01 Return.
N $F73D Was the player trying to enter ... the hut?
@ $F73D label=Enter_CheckHut
  $F73D,$06 Call #R$C26F with #R$E8EE.
  $F743,$02 Jump to #R$F75B if the token isn't for the hut.
N $F745 The player is attempting to enter the hut.
  $F745,$08 Jump to #R$ED9B if *#R$BA9B isn't room #N$0F: "#ROOM$0F".
  $F74D,$08 Jump to #R$ED6E if #ITEM$39 isn't in the current room.
  $F755,$05 Call #R$ECB6 with room #N$10: "#ROOM$10".
  $F75A,$01 Return.
N $F75B Was the player trying to enter ... the hovel?
@ $F75B label=Enter_CheckHovel
  $F75B,$06 Call #R$C26F with #R$E8F0.
  $F761,$02 Jump to #R$F779 if the token isn't for the hovel.
N $F763 The player is attempting to enter the hovel.
  $F763,$08 Jump to #R$ED9B if *#R$BA9B isn't room #N$3C: "#ROOM$3C".
  $F76B,$08 Jump to #R$ED6E if #ITEM$3D isn't in the current room.
  $F773,$05 Call #R$ECB6 with room #N$3D: "#ROOM$3D".
  $F778,$01 Return.
N $F779 Was the player trying to enter ... the forge?
@ $F779 label=Enter_CheckForge
  $F779,$06 Call #R$C26F with #R$E8F2.
  $F77F,$02 Jump to #R$F78F if the token isn't for the forge.
N $F781 The player is attempting to enter the forge.
  $F781,$08 Jump to #R$ED9B if *#R$BA9B isn't room #N$42: "#ROOM$42".
  $F789,$05 Call #R$ECB6 with room #N$43: "#ROOM$43".
  $F78E,$01 Return.
N $F78F Was the player trying to enter ... the boat?
@ $F78F label=Enter_CheckBoat
  $F78F,$06 Call #R$C26F with #R$E8F4.
  $F795,$02 Jump to #R$F79A if the token isn't for the boat.
N $F797 Either way, it's a bad outcome.
  $F797,$03 Jump to #R$EDA0 if the token is for the boat.
N $F79A Nothing else is able to be entered, so provide a generic response.
@ $F79A label=Enter_YouCant
  $F79A,$03 Jump to #R$ED6E.

c $F79D Action: Wear
@ $F79D label=Action_Wear
E $F79D View the equivalent code in;
. #LIST
. { #JEWELS$FBD5 }
. { #ANDROMEDA$9861 }
. { #WARLORD$FB5D }
. LIST#
D $F79D Wear the ring.
  $F79D,$03 Call #R$C309.
  $F7A0,$01 Return if the direct object is malformed.
N $F7A1 Was the player trying to wear ... the ring?
  $F7A1,$06 Call #R$C26F with #R$E821.
  $F7A7,$02 Jump to #R$F7BF if the token isn't for the ring.
  $F7A9,$07 Jump to #R$F7B6 if #ITEM$43 isn't held.
N $F7B0 Print "#MESSAGE$E1B1".
  $F7B0,$03 #REGhl=#R$E1B1.
  $F7B3,$03 Jump to #R$ED66.
N $F7B6 Change the ring state!
@ $F7B6 label=Wear_Ring
  $F7B6,$06 Call #R$C48F to transform #ITEM$07 into #ITEM$43.
  $F7BC,$03 Jump to #R$ED96.
N $F7BF Nothing else is valid.
@ $F7BF label=Wear_YouCant
  $F7BF,$03 Jump to #R$ED6E.

c $F7C2 Action: Touch
@ $F7C2 label=Action_Touch
E $F7C2 View the equivalent code in;
. #LIST
. { #ANDROMEDA$99DD }
. LIST#
D $F7C2 Touch the glowing rock and open the way east.
  $F7C2,$03 Call #R$C309.
  $F7C5,$01 Return if the direct object is malformed.
N $F7C6 Was the player trying to touch ... the glowing rock?
  $F7C6,$06 Call #R$C26F with #R$E8F9.
  $F7CC,$02 Jump to #R$F7E8 if the token isn't for the glowing rock.
  $F7CE,$08 Jump to #R$EDA5 if #R$C24F reports that #ITEM$33 isn't in the
. current room.
  $F7D6,$07 Jump to #R$EDA5 if *#R$EAAA is not equal to #N$00.
N $F7DD This action changes the map:
N $F7DD Open the way east.
  $F7DD,$05 Write #N$46 to *#R$EAAA to open up eastbound access to #ROOM$46
. from #ROOM$3E.
N $F7E2 Print "#MESSAGE$E1E7".
  $F7E2,$03 #REGhl=#R$E1E7.
  $F7E5,$03 Jump to #R$ED66.
N $F7E8 Nothing else is valid.
@ $F7E8 label=Touch_YouCant
  $F7E8,$03 Jump to #R$EDA5.

c $F7EB Action: Swim
@ $F7EB label=Action_Swim
E $F7EB View the equivalent code in;
. #LIST
. { #JEWELS$FD7C }
. { #ANDROMEDA$947C }
. { #WARLORD$FC8D }
. LIST#
D $F7EB Swimming is fatal.
  $F7EB,$03 Call #R$C309.
  $F7EE,$01 Return if the direct object is malformed.
N $F7EF Was the player trying to swim ... the river?
  $F7EF,$06 Call #R$C26F with #R$E8FE.
  $F7F5,$02 Jump to #R$F801 if the token isn't for the river.
  $F7F7,$04 Switch #R$EB23 onto the stack so the next return actions a "game
. over".
N $F7FB Print "#MESSAGE$E21C".
  $F7FB,$03 #REGhl=#R$E21C.
  $F7FE,$03 Jump to #R$ED66.
N $F801 Nothing else is valid.
@ $F801 label=Swim_YouCant
  $F801,$03 Jump to #R$ED91.

c $F804 Action: Jump
@ $F804 label=Action_Jump
E $F804 View the equivalent code in;
. #LIST
. { #WARLORD$FAAD }
. LIST#
D $F804 Jump the chasm, which cannot be done.
  $F804,$03 Call #R$C309.
  $F807,$01 Return if the direct object is malformed.
N $F808 Was the player trying to jump ... the chasm?
  $F808,$06 Call #R$C26F with #R$E906.
  $F80E,$02 Jump to #R$F81A if the token isn't for the chasm.
  $F810,$04 Switch #R$EB23 onto the stack so the next return actions a "game
. over".
N $F814 Print "#MESSAGE$E27A".
  $F814,$03 #REGhl=#R$E27A.
  $F817,$03 Jump to #R$ED66.
N $F81A Nothing else is valid.
@ $F81A label=Jump_YouCant
  $F81A,$03 Jump to #R$ED78.

c $F81D Action: Kick
@ $F81D label=Action_Kick
E $F81D View the equivalent code in;
. #LIST
. { #JEWELS$FD6D }
. LIST#
D $F81D Kicking has no effect.
  $F81D,$03 Call #R$C309.
  $F820,$01 Return if the direct object is malformed.
  $F821,$03 Jump to #R$EDA5.

c $F824 Action: Tie
@ $F824 label=Action_Tie
D $F824 Tie the rope to the rock above the volcano.
  $F824,$03 Call #R$C32D.
  $F827,$01 Return if the direct object is malformed.
N $F828 Was the player trying to tie ... the rope to the overhang?
  $F828,$06 Call #R$C26F with #R$E90B.
  $F82E,$02 Jump to #R$F866 if the token isn't for the overhang.
  $F830,$07 Jump to #R$F83D if #R$C24F reports that #ITEM$23 isn't in the
. current room.
N $F837 Print "#MESSAGE$E2F0".
  $F837,$03 #REGhl=#R$E2F0.
  $F83A,$03 Jump to #R$ED66.
N $F83D Is the player at the top of the volcano?
@ $F83D label=Tie_CheckRoom
  $F83D,$08 Jump to #R$ED78 if *#R$BA9B isn't room #N$47: "#ROOM$47".
  $F845,$07 Jump to #R$F855 if #ITEM$08 isn't held.
  $F84C,$04 Decrease *#R$BA68 by one.
  $F850,$05 Call #R$C2DF with item #N$08: #ITEM$08.
N $F855 Destroy the carried rope and attach it to the overhang.
@ $F855 label=Tie_AttachRope
  $F855,$05 Call #R$C2D8 with item #N$08: #ITEM$08.
  $F85A,$06 Call #R$C48F to transform #ITEM$22 into #ITEM$23.
N $F860 Print "#MESSAGE$E2C2".
  $F860,$03 #REGhl=#R$E2C2.
  $F863,$03 Jump to #R$ED66.
N $F866 Nothing else is valid.
@ $F866 label=Tie_YouCant
  $F866,$03 Jump to #R$ED6E.

c $F869 Action: Swearing
@ $F869 label=Action_Swearing
E $F869 View the equivalent code in;
. #LIST
. { #JEWELS$FB83 }
. { #WARLORD$FBB9 }
. LIST#
D $F869 Swearing has no effect.
  $F869,$03 Call #R$C309.
  $F86C,$01 Return if the direct object is malformed.
N $F86D Was the player swearing at ... the princess?
  $F86D,$06 Call #R$C26F with #R$E8E3.
  $F873,$02 Jump to #R$F88D if the token isn't for the princess.
  $F875,$08 Jump to #R$EDAA if #R$C24F reports that #ITEM$2C isn't in the
. current room.
  $F87D,$03 #REGhl=#R$BA3F.
  $F880,$02 Reset bit 0 of *#REGhl.
  $F882,$05 Call #R$C2D8 with item #N$2C: #ITEM$2C.
N $F887 Print "#MESSAGE$E31F".
  $F887,$03 #REGhl=#R$E31F.
  $F88A,$03 Jump to #R$ED66.
N $F88D Was the player swearing at ... a closed door?
@ $F88D label=Validate_Swearing_ClosedDoor
  $F88D,$06 Call #R$C26F with #R$E8E5.
  $F893,$02 Jump to #R$F8A8 if the token isn't for a closed door.
  $F895,$08 Jump to #R$EDAA if #R$C24F reports that #ITEM$1C is in the
. current room.
  $F89D,$05 Call #R$C2D8 with #N$8A.
N $F8A2 Print "#MESSAGE$E31F".
  $F8A2,$03 #REGhl=#R$E31F.
  $F8A5,$03 Jump to #R$ED66.
N $F8A8 Nothing else is valid.
@ $F8A8 label=Swearing_YouCant
  $F8A8,$03 Jump to #R$EDAA.

c $F8AB Action: Row
@ $F8AB label=Action_Row
E $F8AB View the equivalent code in;
. #LIST
. { #JEWELS$FD02 }
. LIST#
D $F8AB Row the boat, if the player is in it and has the oars.
  $F8AB,$03 Call #R$C309.
  $F8AE,$01 Return if the direct object is malformed.
N $F8AF Was the player trying to row ... across the river?
  $F8AF,$06 Call #R$C26F with #R$E925.
  $F8B5,$02 Jump to #R$F8E1 if the token isn't for crossing the river.
  $F8B7,$07 Jump to #R$F8C4 if *#R$BA9B is room #N$1D: "#ROOM$1D".
N $F8BE Print "#MESSAGE$DE33".
  $F8BE,$03 #REGhl=#R$DE33.
  $F8C1,$03 Jump to #R$ED66.
N $F8C4 Where is the boat?
@ $F8C4 label=Row_CheckBoat
  $F8C4,$05 Call #R$C2BE with item #N$1D: #ITEM$1D.
  $F8C9,$04 Jump to #R$F8D5 if the boat isn't in room #N$1A: "#ROOM$1A".
  $F8CD,$06 Call #R$BF55 to move #ITEM$1D to room #N$1B: "#ROOM$1B".
  $F8D3,$02 Jump to #R$F8DB.
N $F8D5 Move the boat to the western bank.
@ $F8D5 label=Row_WesternBank
  $F8D5,$06 Call #R$BF55 to move #ITEM$1D to room #N$1A: "#ROOM$1A".
N $F8DB Print "#MESSAGE$E34A".
@ $F8DB label=Row_Across
  $F8DB,$03 #REGhl=#R$E34A.
  $F8DE,$03 Jump to #R$ED66.
N $F8E1 Nothing else is valid.
@ $F8E1 label=Row_YouCant
  $F8E1,$03 Jump to #R$ED6E.

c $F8E4 Action: Unlock
@ $F8E4 label=Action_Unlock
E $F8E4 View the equivalent code in;
. #LIST
. { #JEWELS$FCCD }
. LIST#
D $F8E4 Unlock a door with the key.
  $F8E4,$03 Call #R$C309.
  $F8E7,$01 Return if the direct object is malformed.
N $F8E8 Was the player trying to unlock ... the chest?
  $F8E8,$06 Call #R$C26F with #R$E92E.
  $F8EE,$02 Jump to #R$F913 if the token isn't for the chest.
  $F8F0,$07 Jump to #R$F8FD if #R$C24F reports that #ITEM$0B is in the
. current room.
N $F8F7 Print "#MESSAGE$E36F".
  $F8F7,$03 #REGhl=#R$E36F.
  $F8FA,$03 Jump to #R$ED66.
N $F8FD Does the player hold the key?
@ $F8FD label=Unlock_CheckKey
  $F8FD,$07 Jump to #R$F90A if #ITEM$10 is held.
N $F904 Print "#MESSAGE$E387".
  $F904,$03 #REGhl=#R$E387.
  $F907,$03 Jump to #R$ED66.
N $F90A Change the chest state!
@ $F90A label=Unlock_Chest
  $F90A,$06 Call #R$C48F to transform #ITEM$0B into #ITEM$0C.
  $F910,$03 Jump to #R$ED96.
N $F913 Nothing else is valid.
@ $F913 label=Unlock_YouCant
  $F913,$03 Jump to #R$ED6E.

c $F916 Action: Blow
@ $F916 label=Action_Blow
D $F916 Blow the horn.
  $F916,$03 Call #R$C309.
  $F919,$01 Return if the direct object is malformed.
N $F91A Was the player trying to blow ... the horn?
  $F91A,$06 Call #R$C26F with #R$E827.
  $F920,$02 Jump to #R$F961 if the token isn't for the horn.
  $F922,$07 Jump to #R$F92F if #ITEM$09 is held.
N $F929 Print "#MESSAGE$E3A2".
  $F929,$03 #REGhl=#R$E3A2.
  $F92C,$03 Jump to #R$ED66.
N $F92F Where is the player blowing the horn?
@ $F92F label=Blow_CheckRoom
  $F92F,$07 Jump to #R$F93B if *#R$BA9B is room #N$17: "#ROOM$17".
  $F936,$05 Jump to #R$EDA5 if *#R$BA9B isn't room #N$34: "#ROOM$34".
N $F93B Is the dragon in play?
@ $F93B label=Blow_FetchDragon
  $F93B,$05 Call #R$C2BE with item #N$16: #ITEM$16.
  $F940,$04 Jump to #R$EDA5 if the dragon is not in play.
  $F944,$07 Jump to #R$F956 if *#R$BA9B isn't room #N$17: "#ROOM$17".
  $F94B,$05 Call #R$C42F with room #N$34: "#ROOM$34".
N $F950 Print "#MESSAGE$E3BD".
  $F950,$03 #REGhl=#R$E3BD.
  $F953,$03 Jump to #R$ED66.
N $F956 Move the player to the brink of the precipice.
@ $F956 label=Blow_ToPrecipice
  $F956,$05 Call #R$C42F with room #N$17: "#ROOM$17".
N $F95B Print "#MESSAGE$E444".
  $F95B,$03 #REGhl=#R$E444.
  $F95E,$03 Jump to #R$ED66.
N $F961 Nothing else is valid.
@ $F961 label=Blow_YouCant
  $F961,$03 Jump to #R$EDA5.

c $F964 Game Start
@ $F964 label=GameStart
E $F964 View the equivalent code in;
. #LIST
. { #SHOCK$ADA1 }
. { #HEROES$FBA9 }
. { #JEWELS$FD82 }
. { #ANDROMEDA$F8AF }
. { #WARLORD$FCCE }
. LIST#
D $F964 Turn caps lock on, clear the flags, copy in a fresh game and enter the
. Great Valley.
  $F964,$05 Turn CAPS LOCK on, using bit 3 of *#SKOOLKID$5C6A(FLAGS2).
N $F969 Seal the passages that the player has to open.
  $F969,$0D Seal the farmhouse, the woodman's hut and both sides of the chasm.
  $F976,$09 Seal the witch's hovel, the rock wall and the cavern.
N $F97F Install a fresh game.
  $F97F,$0B Copy #N$013C bytes from #R$F992 over the game state at #R$B9C8.
  $F98A,$02 Enter room #N($05), the Great Valley.
  $F98C,$03 Call #R$ECB6 to enter the Great Valley.
  $F98F,$03 Jump to #R$EB10 to take the first turn.

g $F992 Table: Item Locations
@ $F992 label=DefaultGameState
@ $F992 label=Default_Table_ItemLocations
D $F992 The starting values for the game status buffer. #R$F964 copies all
. #N$013C bytes over #R$B9C8 at the start of every game, so the layout is the
. same as the entries from #R$B9C8 to #R$BB02.
D $F992 Starting places for the items. #R$F964 copies this table to #R$B9C8
. at the start of every game.
B $F992,$01 Item #N(#PC-$F992) #ITEM(#PC-$F992) in room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
L $F992,$01,$4A

u $F9DC
S $F9DC,$1A

g $F9F6 Flags: Display State
@ $F9F6 label=Default_Flag_DisplayState
D $F9F6 Copied to #R$BA2C. Bit 0 is clear at the start of every game.
B $F9F6,$01

u $F9F7
S $F9F7,$03

g $F9FA Table: Already Seen Room Images
@ $F9FA label=Default_Table_RoomImagesAlreadySeen
D $F9FA Copied to #R$BA30. No room picture has been shown yet.
B $F9FA,b,$01
B $F9FB,b,$01

u $F9FC
S $F9FC,$04

g $FA00 Flags: Turn-Based Event States
@ $FA00 label=Default_Flag_TurnBasedEventState
D $FA00 Copied to #R$BA36. No turn-based event has started.
B $FA00,$01

g $FA01 Turn-Based Event Counters
@ $FA01 label=Default_Counter_WoodNymph
@ $FA02 label=Default_Counter_Spider
@ $FA03 label=Default_Counter_SlimeMonster
@ $FA04 label=Default_Counter_Demons
@ $FA05 label=Default_Counter_Wizard
@ $FA06 label=Default_Counter_Unused_0
@ $FA07 label=Default_Counter_Unused_1
@ $FA08 label=Default_Counter_Unused_2
D $FA01 Copied to #R$BA37. One countdown per bit of *#R$BA36.
B $FA01,$08,$01

g $FA09 Flag: Princess Following
@ $FA09 label=Default_Flag_PrincessFollowing
D $FA09 Copied to #R$BA3F. Princess Mara is not following at the start.
B $FA09,$01

g $FA0A Table: Following Items
@ $FA0A label=Default_Table_FollowingItems
D $FA0A Copied to #R$BA40. Default bit 0 holds #ITEM$2C (Princess Mara).
B $FA0A,$01 Bit 0: item #N(#PEEK(#PC)), #ITEM(#PEEK(#PC)).
B $FA0B,$07 Bits 1-7: not used by this game.

g $FA12 Table: Scenic Event Locations
@ $FA12 label=Default_Table_ScenicEventLocations
D $FA12 Copied to #R$BA48. Where each of the #N$0D scenic events starts.
B $FA12,$01 Event #N(#PC-$FA12) room #N(#PEEK(#PC)).
L $FA12,$01,$0D

u $FA1F
S $FA1F,$13

g $FA32 Number Of Items In The Players Inventory
@ $FA32 label=Default_Count_InventoryItems
D $FA32 Copied to #R$BA68. The player starts holding #N(#PEEK(#PC)) item(s).
B $FA32,$01

g $FA33 Load/ Save Buffer
@ $FA33 label=Default_LoadSaveBuffer
D $FA33 Copied to #R$BA69. Initial bytes for the saved-location pointers.
B $FA33,$32,$08

g $FA65 Current Room ID
@ $FA65 label=Default_CurrentRoom
D $FA65 Copied to #R$BA9B. The player starts in room #N(#PEEK(#PC)):
. #ROOM(#PEEK(#PC)).
B $FA65,$01

g $FA66 Table: Scenic Event Rooms
@ $FA66 label=Default_Table_ScenicEventRooms
D $FA66 Copied to #R$BA9C. Pointers to the room lists for each scenic event.
W $FA66,$02 Event #N((#PC-$FA66)/$02).
L $FA66,$02,$0D

u $FA80
S $FA80,$26

g $FAA6 Pointer: Vocabulary Table
@ $FAA6 label=Default_Pointer_Vocabulary
D $FAA6 Copied to #R$BADC. Points at the vocabulary table.
W $FAA6,$02

g $FAA8 Pointer: Turn-Based Events Jump Table
@ $FAA8 label=Default_Pointer_TurnBasedEvents_Jump
D $FAA8 Copied to #R$BADE. Points at the turn-based events jump table.
W $FAA8,$02

g $FAAA Pointer: Room Map Table
@ $FAAA label=Default_Pointer_RoomMap
D $FAAA Copied to #R$BAE0.
W $FAAA,$02

g $FAAC Pointer: Item Description Table
@ $FAAC label=Default_Pointer_ItemDescriptions
D $FAAC Copied to #R$BAE2.
W $FAAC,$02

g $FAAE Pointer: Rooms With Images Table
@ $FAAE label=Default_Pointer_RoomsWithImages
D $FAAE Copied to #R$BAE4.
W $FAAE,$02

g $FAB0 Pointer: Room Image Jump Table
@ $FAB0 label=Default_Pointer_RoomImage
D $FAB0 Copied to #R$BAE6.
W $FAB0,$02

g $FAB2 Pointer: Room Description Table
@ $FAB2 label=Default_Pointer_RoomDescriptions
D $FAB2 Copied to #R$BAE8.
W $FAB2,$02

g $FAB4 Pointer: Item Grouping Table
@ $FAB4 label=Default_Pointer_ItemGroupingTable
D $FAB4 Copied to #R$BAEA.
W $FAB4,$02

g $FAB6 Pointer: Object Noun Phrases
@ $FAB6 label=Default_Pointer_ObjectNounPhrases
D $FAB6 Copied to #R$BAEC.
W $FAB6,$02

g $FAB8 Pointer: Object List Table
@ $FAB8 label=Default_Pointer_ObjectList
D $FAB8 Copied to #R$BAEE.
W $FAB8,$02

g $FABA Pointer: Verbs Jump Table
@ $FABA label=Default_Pointer_JumpTable_Verbs
D $FABA Copied to #R$BAF0.
W $FABA,$02

g $FABC Pointer: Configurable Exits Table
@ $FABC label=Default_Pointer_ConfigurableExits
D $FABC Copied to #R$BAF2.
W $FABC,$02

g $FABE Pointer: Scenic Events Jump Table
@ $FABE label=Default_Pointer_JumpTable_ScenicEvents
D $FABE Copied to #R$BAF4.
W $FABE,$02

g $FAC0 Pointer: Verb Word Tokens Table
@ $FAC0 label=Default_Pointer_VerbWordTokens
D $FAC0 Copied to #R$BAF6.
W $FAC0,$02

g $FAC2 Number Of Items
@ $FAC2 label=Default_Count_Items
D $FAC2 Copied to #R$BAF8.
W $FAC2,$02

g $FAC4 Number Of Objects
@ $FAC4 label=Default_Count_Objects
D $FAC4 Copied to #R$BAFA.
W $FAC4,$02

g $FAC6 Number Of Verb Tokens
@ $FAC6 label=Default_Count_VerbTokens
D $FAC6 Copied to #R$BAFC.
W $FAC6,$02

g $FAC8 Number Of Rooms With Images
@ $FAC8 label=Default_Count_RoomsWithImages
D $FAC8 Copied to #R$BAFE.
W $FAC8,$02

g $FACA Number Of Scenic Events
@ $FACA label=Default_Count_ScenicEvents
D $FACA Copied to #R$BB00.
W $FACA,$02

g $FACC Number Of "Configurable Exits"
@ $FACC label=Default_Count_ConfigurableExits
D $FACC Copied to #R$BB02.
W $FACC,$02

u $FACE
S $FACE,$01

c $FACF Handler: Room Images
@ $FACF label=DisplayImage_GreatValley
E $FACF View the equivalent code in;
. #LIST
. { #HEROES$FDAB }
. { #JEWELS$FEFA }
. { #ANDROMEDA$F813 }
. { #WARLORD$FF12 }
. LIST#
D $FACF Draw The Great Valley.
N $FACF Displays the image for the great valley.
N $FACF #PUSHS #UDGTABLE #POKES$BA9B,$05
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-great-valley) }
. UDGTABLE# #POPS
  $FACF,$04 #REGix=#R$61A8.
  $FAD3,$02 Jump to #R$FB09.
@ $FAD5 label=DisplayImage_WoodmansHut
N $FAD5 Displays the image for the woodman's hut.
N $FAD5 #PUSHS #UDGTABLE #POKES$BA9B,$0F
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-woodmans-hut) }
. UDGTABLE# #POPS
  $FAD5,$04 #REGix=#R$69EB.
  $FAD9,$02 Jump to #R$FB09.
@ $FADB label=DisplayImage_OldWell
N $FADB Displays the image for the old well.
N $FADB #PUSHS #UDGTABLE #POKES$BA9B,$18
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-old-well) }
. UDGTABLE# #POPS
  $FADB,$04 #REGix=#R$7482.
  $FADF,$02 Jump to #R$FB09.
@ $FAE1 label=DisplayImage_Volcano
N $FAE1 Displays the image for the volcano.
N $FAE1 #PUSHS #UDGTABLE #POKES$BA9B,$44
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-volcano) }
. UDGTABLE# #POPS
  $FAE1,$04 #REGix=#R$7B71.
  $FAE5,$02 Jump to #R$FB09.
@ $FAE7 label=DisplayImage_WitchsHovel
N $FAE7 Displays the image for the witch's hovel.
N $FAE7 #PUSHS #UDGTABLE #POKES$BA9B,$3C
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-witchs-hovel) }
. UDGTABLE# #POPS
  $FAE7,$04 #REGix=#R$835E.
  $FAEB,$02 Jump to #R$FB09.
@ $FAED label=DisplayImage_BurnedOutFarm
N $FAED Displays the image for the burned out farm.
N $FAED #PUSHS #UDGTABLE #POKES$BA9B,$11
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-burned-out-farm) }
. UDGTABLE# #POPS
  $FAED,$04 #REGix=#R$8BDA.
  $FAF1,$02 Jump to #R$FB09.
@ $FAF3 label=DisplayImage_EnchantedWood
N $FAF3 Displays the image for the enchanted wood.
N $FAF3 #PUSHS #UDGTABLE #POKES$BA9B,$23
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-enchanted-wood) }
. UDGTABLE# #POPS
  $FAF3,$04 #REGix=#R$93DB.
  $FAF7,$02 Jump to #R$FB09.
@ $FAF9 label=DisplayImage_Dungeon
N $FAF9 Displays the image for the dungeon.
N $FAF9 #PUSHS #UDGTABLE #POKES$BA9B,$4C
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-dungeon) }
. UDGTABLE# #POPS
  $FAF9,$04 #REGix=#R$9E7F.
  $FAFD,$02 Jump to #R$FB09.
@ $FAFF label=DisplayImage_MarlsGateway
N $FAFF Displays the image for Marl's gateway.
N $FAFF #PUSHS #UDGTABLE #POKES$BA9B,$35
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-marls-gateway) }
. UDGTABLE# #POPS
  $FAFF,$04 #REGix=#R$A6C9.
  $FB03,$02 Jump to #R$FB09.
@ $FB05 label=DisplayImage_CavernOfSilence
N $FB05 Displays the image for the cavern of silence.
N $FB05 #PUSHS #UDGTABLE #POKES$BA9B,$46
. { #SIM(start=#PC,stop=$FB0C)#SCR$01(game-cavern-of-silence) }
. UDGTABLE# #POPS
  $FB05,$04 #REGix=#R$AE7A.
N $FB09 All the image routines use this same routine.
@ $FB09 label=Handler_Images
  $FB09,$03 Call #R$BEB8.
  $FB0C,$01 Return.

g $FB0D Jump Table: Verbs
@ $FB0D label=JumpTable_Verbs
E $FB0D View the equivalent code in;
. #LIST
. { #HEROES$FD63 }
. { #JEWELS$FF3A }
. { #ANDROMEDA$FA20 }
. { #WARLORD$FE89 }
. LIST#
D $FB0D Verb routines in the same order as #R$E7AE. Used by #R$C463.
W $FB0D,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB0D,$02,$22

g $FB51 Jump Table: Turn-Based Events
@ $FB51 label=JumpTable_TurnBasedEvents
D $FB51 The first five timed events. The remaining three entries are the
. first three scenic handlers at #R$FB5B, which the routine at #R$BECE
. also reads.
W $FB51,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB51,$02,$05

g $FB5B Jump Table: Scenic Events
@ $FB5B label=JumpTable_ScenicEvents
D $FB5B Handlers run when the current room matches an entry in the room
. list at #R$BA48. Used by #R$C3FA.
W $FB5B,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB5B,$02,$0D

g $FB75 Jump Table: Room Images
@ $FB75 label=JumpTable_RoomImages
E $FB75 View the equivalent code in;
. #LIST
. { #HEROES$FDEB }
. { #JEWELS$FFA8 }
. { #ANDROMEDA$FA68 }
. { #WARLORD$FEFC }
. LIST#
D $FB75 Handlers that draw the ten location pictures. Three entries share
. The Enchanted Wood.
W $FB75,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $FB75,$02,$0C

u $FB8D
S $FB8D,$0473
