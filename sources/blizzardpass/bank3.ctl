; Copyright Adventuresoft UK Ltd 1986, 2026 ArcadeGeek LTD.
> $C000 @org=$C000
> $C000 @expand=#DEF1(#MESSAGE(addr)#STR{addr},$08($b==$5E||$b==$7E))
> $C000 @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
> $C000 @remote=main:$5B00
> $C000 @remote=main:$5B7B
> $C000 @remote=main:$5B7F
> $C000 @remote=main:$5B80
> $C000 @remote=main:$5B81
> $C000 @remote=main:$5B83
> $C000 @remote=main:$5B85
> $C000 @remote=main:$5B86
> $C000 @remote=main:$5B8B
> $C000 @remote=main:$5B8C
> $C000 @remote=main:$5B8E
> $C000 @remote=main:$5B9D
> $C000 @remote=main:$6394
> $C000 @remote=main:$63D4
> $C000 @remote=main:$655A,$655C
> $C000 @remote=main:$662D
> $C000 @remote=main:$A71F
> $C000 @remote=main:$A720

c $C000 Read Command
@ $C000 label=ReadCommand
D $C000 Clears the parser workspace. A comma on the previous line reprints a
. space and jumps to #R$C0B2; otherwise it continues into #R$C02E.
N $C000 Forget the previous noun, the scroll count and the three counters.
  $C000,$06 Clear *#R$5B80@main(Noun) and #REGhl.
  $C006,$03 Clear *#R$655C@main(RowsScrolled).
  $C009,$09 Clear *#R$5B81@main(Counter1), *#R$5B83@main(Counter3)
. and *#R$5B8B@main(WordCount).
  $C012,$04 Write #N$01 to *#R$5B86@main(WordSlot).
N $C016 A comma on the previous line left more words to read.
  $C016,$06 Jump to #R$C02E when there is no leftover command.
  $C01C,$05 Call #R$63D4@main(PrintSystemMessage) to print message
. #N$1B (a space).
@ $C021 label=ReadCommand_Wait
  $C021,$07 Wait until the key is not a space.
  $C028,$03 Fetch the leftover pointer from *#R$5B8C@main(InputPointer).
  $C02B,$03 Jump to #R$C0B2.

c $C02E Print Prompt
@ $C02E label=PrintPrompt
D $C02E Prints ENTER, ">" and a space, then starts a new line in
. #R$5B00@main(CommandBuffer).
  $C02E,$05 Call #R$6394@main(PrintCharacter) to print ENTER.
  $C033,$05 Call #R$6394@main(PrintCharacter) to print ">".
  $C038,$05 Call #R$6394@main(PrintCharacter) to print a space.
  $C03D,$04 Write #N$00 to *#R$5B8E@main(InputLength).
  $C041,$04 Clear the new-key bit of #SKOOLKID$5C3B(FLAGS).
  $C045,$03 Point #REGhl at #R$5B00@main(CommandBuffer).

c $C048 Read Key
@ $C048 label=ReadKey
D $C048 Reads keys until ENTER. DELETE rubs out, and letters are stored in
. capitals.
R $C048 HL Command buffer pointer
R $C048 O:HL Pointer after the last stored character
  $C048,$03 Call #R$662D@main(WaitForKey) to read one key.
  $C04B,$04 Jump to #R$C055 if the key is DELETE.
  $C04F,$04 Jump to #R$C091 if the key is ENTER.
  $C053,$02 Jump to #R$C06D to store the key.
@ $C055 label=ReadKey_Delete
N $C055 Rub the last character out, unless the buffer is already empty.
  $C055,$01 Stash the key on the stack.
  $C056,$06 Jump to #R$C06A if *#R$5B8E@main(InputLength) is empty.
  $C05C,$01 Restore the key from the stack.
  $C05D,$03 Call #R$6394@main(PrintCharacter) to rub the character out.
  $C060,$08 Decrement the buffer pointer and *#R$5B8E@main(InputLength).
  $C068,$02 Jump to #R$C048.
@ $C06A label=ReadKey_Ignore
N $C06A Throw the key away and read another.
  $C06A,$01 Drop the rejected key from the stack.
  $C06B,$02 Jump to #R$C048.
@ $C06D label=ReadKey_Store
N $C06D Store a capital letter if the buffer still has room.
  $C06D,$01 Stash the key on the stack.
  $C06E,$07 Jump to #R$C06A if *#R$5B8E@main(InputLength) already holds
. #N$5E characters.
  $C075,$01 Restore the key from the stack.
  $C076,$04 Jump to #R$C048 if a control or a graphic is rejected.
  $C07A,$06 Fold a lowercase letter to capitals.
@ $C080 label=ReadKey_Fold
  $C080,$04 Jump to #R$C048 if the character is above "Z".
  $C084,$04 Store the capital and call #R$6394@main(PrintCharacter) to echo it.
  $C088,$06 Advance the pointer and increment *#R$5B8E@main(InputLength).
  $C08E,$01 Restore the buffer pointer from the stack.
  $C08F,$02 Jump to #R$C048.

c $C091 Parse Line
@ $C091 label=ParseLine
D $C091 Stores ENTER. An empty line reprints the prompt; otherwise the line is
. parsed from the first character.
  $C091,$04 Store ENTER and call #R$6394@main(PrintCharacter) to echo it.
  $C095,$04 Clear *#R$5B7F@main(Verb).
  $C099,$04 Point #REGhl at #R$5B00@main(CommandBuffer) and fetch the
. first character.
  $C09D,$05 Jump to #R$C02E if the line is empty.
  $C0A2,$02 Jump to #R$C0B2.

c $C0A4 Parse Word
@ $C0A4 label=ParseWord
D $C0A4 Skips to the next word and copies up to four letters. A comma after a
. word saves the rest of the line.
R $C0A4 HL Line pointer
N $C0A4 Move to the next word. A comma after a word saves the rest of the
. line.
  $C0A4,$03 Call #R$C1A6 to skip to a space, a comma or ENTER.
  $C0A7,$07 Jump to #R$C173 to finish the command.
@ $C0AE label=ParseWord_NotEnter
  $C0AE,$04 Jump to #R$C0D1 to keep the rest of the line.
@ $C0B2 label=ParseWord_Copy
N $C0B2 Copy up to four characters, padding with spaces, then look the word
. up.
  $C0B2,$0B Fill #R$5B7B@main(WordToken) with four spaces.
@ $C0B7 label=ParseWord_Pad
  $C0BD,$05 The copy starts at the first character of #R$5B7B@main(WordToken).
@ $C0C2 label=ParseWord_Letter
  $C0C2,$05 Jump to #R$C0DA to test for a space or ENTER.
  $C0C7,$04 Jump to #R$C0EE to look the word up.
  $C0CB,$06 Jump to #R$C0A4 to keep scanning.
@ $C0D1 label=ParseWord_Comma
N $C0D1 Save the rest of the line for the next turn.
  $C0D1,$08 Write #N$01 to *#R$5B85@main(Continuation) and store the pointer in
. *#R$5B8C@main(InputPointer).
  $C0D9,$01 Return.
@ $C0DA label=ParseWord_Break
N $C0DA A space or ENTER ends the word; anything else is another letter.
  $C0DA,$08 Jump to #R$C0EE when a space or ENTER ends the word.
  $C0E2,$05 Jump to #R$C0EE if a fifth character is not stored.
  $C0E7,$02 Store one character in #R$5B7B@main(WordToken).
  $C0E9,$05 Advance both pointers and jump to #R$C0C2.

c $C0EE Look Up Word
@ $C0EE label=LookupWord
D $C0EE Looks the four letters up. An unknown or leading noise word is
. skipped; a noise word after a real word keeps the rest of the line.
R $C0EE HL Line pointer
R $C0EE O:A Token id, or #N$FF if the word is unknown
R $C0EE O:HL Restored line pointer
  $C0EE,$03 Call #R$C181 to look the four characters up.
  $C0F1,$04 Jump to #R$C0A4 if the word is unknown (#N$FF).
  $C0F5,$03 Jump to #R$C104 to keep a real word.
  $C0F8,$06 Jump to #R$C0A4 if a noise word arrives before any real word.
  $C0FE,$05 Write #N$01 to *#R$5B85@main(Continuation) to keep the rest
. of the line.
  $C103,$01 Return.

c $C104 Keep Token
@ $C104 label=KeepToken
D $C104 The first word below id #N$55 is the verb. IT and THEM substitute the
. previous noun. POLISH, SKIN and BRIDGE are rewritten to internal verbs
. #N($2C), #N$2B and #N$31. Later words are the noun, then extra words.
R $C104 A Token id
R $C104 HL Line pointer
N $C104 Count this word. A third word is stored as an extra, not as the noun.
  $C104,$01 Stash the id on the stack.
  $C105,$07 Increment *#R$5B8B@main(WordCount).
  $C10C,$04 Jump to #R$C14C if this is a third word.
  $C110,$04 Jump to #R$C16B if *#R$5B8B@main(WordCount) is #N$20.
  $C114,$01 Restore the id from the stack.
  $C115,$04 An id below #N$55 is the verb.
@ $C119 label=KeepToken_Verb
  $C119,$03 Write the id to *#R$5B7F@main(Verb).
  $C11C,$03 Jump to #R$C0A4 to take the next word.
@ $C11F label=KeepToken_It
N $C11F IT and THEM reuse the previous noun; other ids become the noun
. unless they rewrite to a verb.
  $C11F,$07 IT and THEM (#N$80) reuse *#R$5B9D@main(PreviousNoun).
@ $C126 label=KeepToken_Held
  $C126,$08 Jump to #R$C143 if a verb is already stored.
@ $C12E label=KeepToken_Rewrite
  $C12E,$06 Jump to #R$C119 with #N$2C if the token is POLISH (#N$AF).
  $C134,$07 Jump to #R$C119 with #N$2B if the token is SKIN (#N$F9).
  $C13B,$07 Jump to #R$C119 with #N$31 if the token is BRIDGE (#N$86).
  $C142,$01 Restore the id when none of those matched.
@ $C143 label=KeepToken_Noun
  $C143,$06 Write the id to *#R$5B80@main(Noun) and *#R$5B9D@main(PreviousNoun).
  $C149,$03 Jump to #R$C0A4 to take the next word.

c $C14C Store Extra
@ $C14C label=StoreExtra
D $C14C A third word, and a word count of #N$20, go in the spare slots after
. the noun. A fifth word is ignored.
  $C14C,$08 Increment *#R$5B86@main(WordSlot).
  $C154,$04 Jump to #R$C15C if there is still a spare slot.
  $C158,$01 Drop the id from the stack.
  $C159,$03 Jump to #R$C0A4.
@ $C15C label=StoreExtra_Slot
N $C15C Write the extra word into the next spare slot after the verb.
  $C15C,$08 The slot is an offset from *#R$5B7F@main(Verb).
  $C164,$04 Write the id into that slot.
  $C168,$03 Jump to #R$C0A4 to take the next word.
@ $C16B label=StoreExtra_Overflow
  $C16B,$01 Stash the id on the stack.
  $C16C,$07 Use one less than *#R$5B8B@main(WordCount) as the slot
. and jump to #R$C15C.

c $C173 Finish Parse
@ $C173 label=FinishParse
D $C173 An empty command clears the verb. The continuation flag is always
. cleared.
  $C173,$09 Clear *#R$5B7F@main(Verb) if no word was recognised.
@ $C17C label=FinishParse_Clear
  $C17C,$04 Clear *#R$5B85@main(Continuation).
  $C180,$01 Return.

c $C181 Match Word
@ $C181 label=MatchWord
D $C181 Compares the four characters with every vocabulary entry.
R $C181 HL Line pointer
R $C181 O:A Token id, or #N$FF if the word is unknown
R $C181 O:HL Restored line pointer
  $C181,$03 Remember the line pointer in *#R$5B8C@main(InputPointer).
  $C184,$03 The vocabulary starts at #R$A720@main(Vocabulary), one byte
. after #R$A71F@main(VocabularyLead).
@ $C187 label=MatchWord_Next
  $C187,$07 Compare the next entry with #R$5B7B@main(WordToken).
@ $C18E label=MatchWord_Character
  $C18E,$09 Compare four letters and count the matches.
@ $C193 label=MatchWord_Miss
  $C197,$05 Jump to #R$C1A2 if the table has ended (#N$FF).
  $C19C,$05 Jump back to #R$C187 unless all four letters matched.
  $C1A1,$01 The token byte is the id.
@ $C1A2 label=MatchWord_Done
  $C1A2,$03 Restore the line pointer from *#R$5B8C@main(InputPointer).
  $C1A5,$01 Return.

c $C1A6 Skip To Break
@ $C1A6 label=SkipToBreak
D $C1A6 Advances #REGhl to the next space, comma or ENTER.
R $C1A6 HL Line pointer
R $C1A6 O:A The break character
R $C1A6 O:HL Stepped past that character
  $C1A6,$05 A space ends the skip.
  $C1AB,$03 A comma ends the skip.
  $C1AE,$04 Jump back to #R$C1A6 unless the character is ENTER.
  $C1B2,$01 Return.

t $C1B3 Location Text Under Parser
@ $C1B3 label=LocationTextUnderParser
D $C1B3 The rest of this bank is the same location text as bank 6. The parser
. occupies the first #N$01B3 bytes, so this fragment begins in the middle of
. a description. Each description terminates with #N$7E.
  $C1B3,$9A "#MESSAGE(#PC)".
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
