> $C000 @org=$C000

c $C000 Read Command
@ $C000 label=ReadCommand
D $C000 Pages in over the picture data while a command is being read. It
. prints the prompt, edits a line in the command buffer, and turns the words
. into a verb and a noun. A comma saves the rest of the line for the next
. turn. IT and THEM reuse the previous noun.
N $C000 Forget the previous noun, the scroll count and the three counters.
  $C000,$06 Clear the noun.
  $C006,$03 Clear the scroll count.
  $C009,$09 Clear counters 1 to 3 and the word count.
  $C012,$04 The first word uses slot 1.
N $C016 A comma on the previous line left more words to read.
  $C016,$06 No continuation means a fresh prompt.
  $C01C,$05 Message #N$1B is a space, printed before the leftover words.
@ $C021 label=ReadCommand_Wait
  $C021,$07 Wait until the key is not a space.
  $C028,$06 Resume at the saved pointer.
@ $C02E label=ReadCommand_Prompt
N $C02E Ask for a new line.
  $C02E,$05 Print ENTER.
  $C033,$05 Print '>'.
  $C038,$05 Print a space.
  $C03D,$08 The buffer is empty, and the new-key flag is clear.
@ $C048 label=ReadCommand_Key
N $C048 Read one key. DELETE rubs out, ENTER finishes the line, and letters
. are stored in capitals.
  $C048,$03 Call #R$662D for one key.
  $C04B,$08 DELETE is #N$0C and ENTER is #N$0D.
  $C053,$02 Any other key is stored.
@ $C055 label=ReadCommand_Delete
  $C055,$07 An empty buffer ignores DELETE.
  $C05C,$04 Rub the character out.
  $C060,$08 Shorten the line.
  $C068,$02 Read another key.
@ $C06A label=ReadCommand_Ignore
  $C06A,$03 Drop the ignored DELETE and read another key.
@ $C06D label=ReadCommand_Store
  $C06D,$08 A full buffer (#N$5E characters) rejects the key.
  $C075,$05 A control or a graphic is rejected.
  $C07A,$06 Lower case is folded to capitals.
@ $C080 label=ReadCommand_Fold
  $C080,$04 A character above 'Z' is rejected.
  $C084,$04 Store the capital and echo it.
  $C088,$06 Advance the pointer and count the character.
  $C08E,$01 Restore the buffer pointer from the stack.
  $C08F,$02 Read another key.
@ $C091 label=ReadCommand_Enter
N $C091 ENTER ends the line. A line with no words reprints the prompt.
  $C091,$04 Store ENTER and echo it.
  $C095,$04 An empty line clears the verb.
  $C099,$06 The first character of the buffer decides.
  $C09F,$03 ENTER reprints the prompt.
  $C0A2,$02 A line with words is parsed.
@ $C0A4 label=ReadCommand_Skip
N $C0A4 Move to the next word. A comma, or a noise word after a real word,
. saves the rest of the line.
  $C0A4,$03 Call #R$C1A6 to skip to a space, a comma or ENTER.
  $C0A7,$07 ENTER finishes the command.
@ $C0AE label=ReadCommand_NotEnter
  $C0AE,$04 A comma keeps the rest of the line.
@ $C0B2 label=ReadCommand_Copy
N $C0B2 Copy up to four characters, padding with spaces, then look the word
. up.
  $C0B2,$05 Four spaces will pad a short word.
@ $C0B7 label=ReadCommand_Pad
  $C0B7,$06 Write one pad space.
  $C0BD,$05 The copy starts at the first character of #R$5B7B.
@ $C0C2 label=ReadCommand_Word
  $C0C2,$05 A comma ends the copy.
  $C0C7,$04 Characters already copied are looked up.
  $C0CB,$06 No words yet means keep scanning.
@ $C0D1 label=ReadCommand_Comma
  $C0D1,$08 A comma after a word saves the rest of the line.
  $C0D9,$01 Return.
@ $C0DA label=ReadCommand_Break
  $C0DA,$08 A space or ENTER ends the word.
  $C0E2,$05 A fifth character is not stored.
  $C0E7,$02 Store one character of the word.
  $C0E9,$05 Advance to the next character.
@ $C0EE label=ReadCommand_Lookup
  $C0EE,$03 Call #R$C181 to look the four characters up.
  $C0F1,$04 An unknown word (#N$FF) is skipped.
  $C0F5,$03 A real word is kept.
  $C0F8,$06 A noise word (id 0) before any real word is skipped.
  $C0FE,$05 After a real word, a noise word keeps the rest of the line.
  $C103,$01 Return.
@ $C104 label=ReadCommand_Keep
N $C104 The first word below id #N$55 is the verb. IT and THEM substitute the
. previous noun. POLISH, SKIN and BRIDGE are rewritten to internal verbs
. #N($2C), #N$2B and #N$31. Later words are the noun, then extra words.
  $C104,$08 Count this word.
  $C10C,$04 A third word is stored as an extra, not as the noun.
  $C110,$04 A word count of #N$20 is stored as an extra too.
  $C114,$05 An id below #N$55 is the verb.
@ $C119 label=ReadCommand_Verb
  $C119,$03 Store it as the verb.
  $C11C,$03 Take the next word.
@ $C11F label=ReadCommand_It
  $C11F,$07 IT and THEM (#N$80) reuse the previous noun.
@ $C126 label=ReadCommand_Held
  $C126,$04 Keep the id while the verb is tested.
  $C12A,$04 A verb already chosen means this word is the noun.
@ $C12E label=ReadCommand_Rewrite
  $C12E,$06 POLISH (#N$AF) becomes verb #N$2C.
  $C134,$07 SKIN (#N$F9) becomes verb #N$2B.
  $C13B,$07 BRIDGE (#N$86) becomes verb #N$31.
  $C142,$01 Restore the id when none of those matched.
@ $C143 label=ReadCommand_Noun
  $C143,$06 Store the noun and remember it for IT and THEM.
  $C149,$03 Take the next word.
@ $C14C label=ReadCommand_Extra
  $C14C,$08 The next spare slot is one higher.
  $C154,$04 A fifth word is ignored.
  $C158,$04 Drop the id and take the next word.
@ $C15C label=ReadCommand_Slot
  $C15C,$08 The slot is an offset from the verb byte.
  $C164,$04 Write the id into that slot.
  $C168,$03 Take the next word.
@ $C16B label=ReadCommand_Overflow
  $C16B,$04 Bring the word count back under #N$20.
  $C16F,$04 Use the previous count as the slot.
@ $C173 label=ReadCommand_Done
  $C173,$09 No recognised word clears the verb.
@ $C17C label=ReadCommand_Clear
  $C17C,$04 Clear the continuation.
  $C180,$01 Return.
@ $C181 label=MatchWord
N $C181 Compare the four characters with every vocabulary entry.
  $C181,$03 Remember where the line had reached.
  $C184,$03 The vocabulary starts at #R$A720, one byte after the lead-in.
@ $C187 label=MatchWord_Next
  $C187,$07 The next entry's four characters are compared with #R$5B7B.
@ $C18E label=MatchWord_Character
  $C18E,$05 Count a matching character.
@ $C193 label=MatchWord_Miss
  $C193,$02 The next character of the entry.
  $C195,$02 Four characters have been compared.
  $C197,$05 #N$FF ends the table.
  $C19C,$05 Four matches return that entry's token.
  $C1A1,$01 The token byte is the id.
@ $C1A2 label=MatchWord_Done
  $C1A2,$03 Restore the line pointer.
  $C1A5,$01 Return.
@ $C1A6 label=SkipToBreak
  $C1A6,$05 A space ends the skip.
  $C1AB,$03 A comma ends the skip.
  $C1AE,$02 ENTER is tested next.
  $C1B0,$02 Any other character is passed.
  $C1B2,$01 Return.

t $C1B3 Location Text Under Parser
@ $C1B3 label=LocationTextUnderParser
D $C1B3 The rest of this bank is the same location text as bank 6. The parser
. occupies the first #N$01B3 bytes, so this fragment begins in the middle of
. the first description. Messages end at #N$7E.
  $C1B3,$3E4D
