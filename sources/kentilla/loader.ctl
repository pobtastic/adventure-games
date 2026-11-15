; Copyright Micromega 1984, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction.

> $5CCB @start
> $5CCB @remote=main:$4000
> $5CCB @remote=main:$E9B6
> $5CCB @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({anchor},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
b $5CCB BASIC Bootstrap
@ $5CCB label=BasicBootstrap
D $5CCB #HTML(The short BASIC program "KENTILLA" that starts the Micromega
. tape. It autostarts at line 1. The REM on line 1 holds the bootstrap at
. #R$5CD0, the loader at #R$5CFC, a header workspace at #R$5D96 and the
. loader messages. Line 2 is <code>POKE 0,0</code> (an intentional ROM
. no-op). Line 3 sets black INK/PAPER/BORDER, CLS, CLEARs just below the
. loader (#R$E9B6) and enters it with <code>RANDOMIZE USR</code> #R$5CD0.
. Line 4 is the ordinary ROM <code>LOAD "" CODE</code> that later
. replaces the stage-2 loader with the final support block at
. #R$E9B6@main(SupportCode).)
  $5CCB,$05 Line 1 header and REM token.

c $5CD0 Load Stage Two
@ $5CD0 label=Load_Stage_Two
D $5CD0 Stage-1 loader kept inside the line-1 REM. It reads a 17-byte
. custom header into #R$5D96, pulls the stage-2 length and address from that
. header, loads #N($0258,$04,$04) bytes to #R$E9B6, then jumps there.
N $5CD0 Load the 17-byte stage-2 header.
  $5CD0,$04 Point #REGix at #R$5D96.
  $5CD4,$03 Set the block length in #REGde to #N($0011,$04,$04).
  $5CD7,$02 Clear #REGa and set the carry flag (load a header block).
  $5CD9,$03 Call #R$5CFC.
  $5CDC,$03 Jump to #R$5D89 if the carry flag is reset.
N $5CDF Refuse to continue unless *#SKOOLKID$5C47(SUBPPC) is #N$06.
  $5CDF,$08 Jump to #SKOOLKID$0000(START) if *#SKOOLKID$5C47(SUBPPC) is
. not #N$06.
N $5CE7 Load the stage-2 Micromega block named by that header.
  $5CE7,$04 Fetch the stage-2 length from *#R$5D96 into #REGde.
  $5CEB,$04 Fetch the stage-2 destination from *#R$5D98 into #REGix.
  $5CEF,$03 Set #REGa to #N$FF and set the carry flag (load a data block).
  $5CF2,$03 Call #R$5CFC.
  $5CF5,$03 Jump to #R$5D89 if the carry flag is reset.
  $5CF8,$01 Enable interrupts.
  $5CF9,$03 Jump to #R$E9B6.

c $5CFC Load Tape Block
@ $5CFC label=Load_Tape_Block
D $5CFC Custom edge sampler used by the bootstrap. It still calls the ROM
. edge routines #SKOOLKID$05E3(LD-EDGE-1) / #SKOOLKID$05E7(LD-EDGE-2), but
. with Micromega timing thresholds rather than the standard ROM pilot. On
. success it returns through #R$5DAC; tape errors from #R$5CD0 jump to
. #R$5D89, which prints "TAPE LOADING ERROR" via #R$5DC9.
R $5CFC IX Destination address for the block
R $5CFC DE Block length
R $5CFC A Expected flag byte; carry set to load, reset to verify
R $5CFC O:F Carry is set on success; #REGa' holds the preserved flag byte
N $5CFC Preserve the flag byte and install the post-load return at #R$5DAC.
  $5CFC,$03 Preserve the flag byte in #REGaf'.
  $5CFF,$01 Disable interrupts.
  $5D00,$04 Set the border to white via port #N$FE.
  $5D04,$04 Point #REGhl at #R$5DAC and stash it as the return address.
N $5D08 Seed the EAR/border state in #REGc from the current EAR bit.
  $5D08,$02 Read the EAR port.
  $5D0A,$01 Rotate the EAR bit into bit 0 of #REGa.
  $5D0B,$02,b$01 Keep only the EAR bit.
  $5D0D,$02,b$01 Set the blue border bit.
  $5D0F,$02 Copy the EAR/border state into #REGc and set the zero flag.
N $5D11 Wait for the pilot tone.
@ $5D11 label=Load_Tape_Block_WaitPilot
  $5D11,$01 Return if the zero flag is reset (BREAK was pressed).
N $5D12 Listen for a pair of edges that look like the pilot.
@ $5D12 label=Load_Tape_Block_PilotPair
  $5D12,$05 Jump back to #R$5D11 if #SKOOLKID$05E7(LD-EDGE-2) resets the
. carry flag.
  $5D17,$03 Set the leader timing budget in #REGhl to #N($0415,$04,$04).
N $5D1A Exhaust the leader timing budget while edges continue to arrive.
@ $5D1A label=Load_Tape_Block_LeaderDelay
  $5D1A,$02 Decrease #REGb and loop until it is zero.
  $5D1C,$01 Decrease #REGhl.
  $5D1D,$04 Jump back to #R$5D1A if #REGhl is non-zero.
  $5D21,$05 Jump back to #R$5D11 if #SKOOLKID$05E3(LD-EDGE-1) resets the
. carry flag.
N $5D26 Confirm a long enough run of short pilot pulses.
@ $5D26 label=Load_Tape_Block_PilotPulse
  $5D26,$02 Set the pulse timing constant in #REGb to #N$9C.
  $5D28,$05 Jump back to #R$5D11 if #SKOOLKID$05E3(LD-EDGE-1) resets the
. carry flag.
  $5D2D,$05 Jump back to #R$5D12 if #REGb is at least #N$A6.
  $5D32,$03 Increase #REGh by one and jump back to #R$5D26 until it wraps.
N $5D35 Wait for the sync pulse that ends the pilot.
@ $5D35 label=Load_Tape_Block_Sync
  $5D35,$02 Set the sync timing constant in #REGb to #N$C9.
  $5D37,$05 Jump back to #R$5D11 if #SKOOLKID$05E7(LD-EDGE-2) resets the
. carry flag.
  $5D3C,$05 Jump back to #R$5D35 if #REGb is at least #N$D4.
  $5D41,$04 Call #SKOOLKID$05E7(LD-EDGE-2) and return if the carry flag is
. reset.
N $5D45 Flip the border colour and start the byte-load loop.
  $5D45,$01 Fetch the EAR/border state from #REGc.
  $5D46,$02,b$01 Toggle the border colour bits.
  $5D48,$01 Store the updated EAR/border state in #REGc.
  $5D49,$02 Clear the parity byte in #REGh.
  $5D4B,$02 Set #REGb to #N$B0.
  $5D4D,$02 Jump to #R$5D6E.
N $5D4F Handle each loaded byte under the preserved flag in #REGaf'.
@ $5D4F label=Load_Tape_Block_NextByte
  $5D4F,$01 Switch to #REGaf'.
  $5D50,$02 Jump to #R$5D59 if the flag byte is not zero.
  $5D52,$02 Jump to #R$5D63 if the carry flag is reset (verify mode).
  $5D54,$03 Store the assembled byte in *#REGix+#N$00.
  $5D57,$02 Jump to #R$5D68.
N $5D59 Compare the assembled byte against the expected flag byte.
@ $5D59 label=Load_Tape_Block_FlagByte
  $5D59,$02 Rotate the stored flag bits in #REGc.
  $5D5B,$02 Return if the assembled byte does not match.
  $5D5D,$03 Restore #REGc from the rotated value.
  $5D60,$01 Advance #REGde past the flag byte.
  $5D61,$02 Jump to #R$5D6A.
N $5D63 Verify the assembled byte against *#REGix.
@ $5D63 label=Load_Tape_Block_VerifyByte
  $5D63,$05 Return if *#REGix+#N$00 does not match the assembled byte.
N $5D68 Advance the destination and continue for the remaining length.
@ $5D68 label=Load_Tape_Block_Advance
  $5D68,$02 Advance #REGix.
N $5D6A Prepare the timing constant for the next byte.
@ $5D6A label=Load_Tape_Block_Continue
  $5D6A,$01 Decrease the remaining length.
  $5D6B,$01 Switch back to #REGaf'.
  $5D6C,$02 Set #REGb to #N$B2.
N $5D6E Sample eight edges to assemble the next byte into #REGl.
@ $5D6E label=Load_Tape_Block_SampleByte
  $5D6E,$02 Seed the assembled byte in #REGl with #N$01.
N $5D70 Sample one bit into #REGl.
@ $5D70 label=Load_Tape_Block_SampleBit
  $5D70,$04 Call #SKOOLKID$05E3(LD-EDGE-1) and return if the carry flag is
. reset.
  $5D74,$03 Compare #REGb with the bit-threshold #N$CB.
  $5D77,$02 Rotate that comparison result into #REGl.
  $5D79,$02 Set #REGb to #N$B0.
  $5D7B,$03 Jump back to #R$5D70 until eight bits are in.
  $5D7E,$03 Mix the assembled byte into the running parity in #REGh.
  $5D81,$04 Jump back to #R$5D4F until the remaining length in #REGde is
. zero.
  $5D85,$03 Compare the parity byte with #N$01.
  $5D88,$01 Return.
N $5D89 Print "TAPE LOADING ERROR" after a failed load from #R$5CD0.
@ $5D89 label=Load_Tape_Block_PrintError
  $5D89,$05 Open stream #N$01 via #SKOOLKID$1601(CHAN_OPEN).
  $5D8E,$05 Point #REGde at #R$5DEA with length #N$19.
  $5D93,$03 Jump to #R$5DC9.

b $5D96 Stage-2 Header
@ $5D96 label=Stage2Header
D $5D96 Seventeen bytes read from the tape's special header for the stage-2
. loader. After a successful header read this holds the length
. #N($0258,$04,$04) and destination #R$E9B6.
  $5D96,$02 Stage-2 length.
N $5D98 Fetched into #REGix by #R$5CD0 after the header load.
@ $5D98 label=Stage_Two_Destination
  $5D98,$02 Stage-2 destination.
  $5D9A,$0C Name and copy of the length/destination fields.
  $5DA6,$01 End marker.

u $5DA7
  $5DA7,$05

c $5DAC Restore Border
@ $5DAC label=Restore_Border
D $5DAC Success return from #R$5CFC. Restores the border from
. #SKOOLKID$5C48(BORDCR), then either returns with the load flags intact or
. prints "ATTEMPTED BREAK!" and hangs. #R$5D89 also enters the print loop at
. #R$5DC9 for "TAPE LOADING ERROR".
N $5DAC Preserve the load flags and restore the border colour.
  $5DAC,$01 Stash #REGaf on the stack.
  $5DAD,$03 Fetch *#SKOOLKID$5C48(BORDCR) into #REGa.
  $5DB0,$02,b$01 Keep only the PAPER bits that hold the border colour.
  $5DB2,$03 Move the border colour into bits 0-2.
  $5DB5,$02 Set the border from #REGa.
N $5DB7 Test whether SPACE is still held (BREAK during the load).
  $5DB7,$04 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$7F | SPACE | SYMBOL SHIFT | M | N | B }
. TABLE#
  $5DBB,$01 Rotate the SPACE bit into the carry flag.
  $5DBC,$01 Enable interrupts.
  $5DBD,$02 Jump to #R$5DD1 if SPACE is not pressed.
N $5DBF Print "ATTEMPTED BREAK!" and hang.
  $5DBF,$05 Open stream #N$01 via #SKOOLKID$1601(CHAN_OPEN).
  $5DC4,$05 Point #REGde at #R$5DD3 with length #N$17.
N $5DC9 Print #REGb characters from #REGde.
@ $5DC9 label=Restore_Border_PrintLoop
  $5DC9,$02 Print the character at *#REGde with
. #SKOOLKID$0010(PRINT_A_1).
  $5DCB,$01 Advance #REGde.
  $5DCC,$02 Jump back to #R$5DC9 until #REGb is zero.
N $5DCE Hang after a loader message.
@ $5DCE label=Restore_Border_Hang
  $5DCE,$03 Jump to #R$5DCE.
N $5DD1 Return to the caller with the preserved load flags.
@ $5DD1 label=Restore_Border_Return
  $5DD1,$01 Restore #REGaf from the stack.
  $5DD2,$01 Return.

t $5DD3 Messaging: Attempted Break
@ $5DD3 label=Messaging_AttemptedBreak
D $5DD3 Control codes and text for the BREAK message printed by #R$5DBF.
B $5DD3,$06 AT #N($01), #N$07 / INK #N$01 / leading space.
  $5DD9,$11 "#STR$5DD9,$00,$11"

t $5DEA Messaging: Tape Loading Error
@ $5DEA label=Messaging_TapeLoadingError
D $5DEA Control codes and text for the tape-error message printed by
. #R$5D89.
B $5DEA,$06 AT #N($01), #N$06 / INK #N$01 / leading space.
  $5DF0,$13 "#STR$5DF0,$00,$13"

b $5E03 Line 1 Terminator
@ $5E03 label=Line1Terminator
D $5E03 Spare bytes and the trailing #HTML(<code>ENTER</code>) that end the
. line-1 REM.
  $5E03,$06

b $5E09 BASIC Lines 2 To 4
@ $5E09 label=BasicLines2To4
D $5E09 Tokenised BASIC lines that finish the bootstrap program.
  $5E09,$15 Line 2: POKE 0,0.
  $5E1E,$40 Line 3: INK 0: PAPER 0: BORDER 0: CLS: CLEAR just below the
. loader (#R$E9B6): RANDOMIZE USR #R$5CD0.
  $5E5E,$09 Line 4: LOAD ""CODE.

i $5E67

c $E9B6 Micromega Loader
@ $E9B6 label=MicromegaLoader
D $E9B6 Stage-2 Micromega 1.1 loader. It first checksums itself, then reads
. a 16-byte custom header that names destination #N$4000 (screen buffer),
. total length #N($A81D,$04,$04) and #N$0C overlapping chunks. Each of the
. twelve main chunks carries #N($0DB6,$04,$04) tape bytes but only advances
. the destination by #N($0DAC,$04,$04), so the last ten bytes of one chunk
. overlap the next. A short final chunk finishes the #N($A81D,$04,$04)-byte
. main image at #R$4000@main(Loading), which overwrites the REM bootstrap.
. Control then returns to BASIC so line 4 can ROM-load the final support
. block on top of this loader. While the chunks load, #R$E9F4 alternates
. two timing-parameter sets and #R$EA15 patches them into the sampler at
. #R$EAAE.
N $E9B6 Clear the running total and point the scan at the first timed byte.
  $E9B6,$06 Write #N($0000,$04,$04) to *#R$E9E5.
  $E9BC,$06 Point *#R$E9E3 at #R$E9E9.
N $E9C2 Add each byte from #R$E9E9 through #R$EBE6 into the running total.
@ $E9C2 label=MicromegaLoader_ChecksumLoop
  $E9C2,$04 Fetch the next byte into #REGde.
  $E9C6,$07 Add it into *#R$E9E5.
  $E9CD,$03 Fetch the scan pointer from *#R$E9E3.
  $E9D0,$0A Jump to #R$EA2E if the scan pointer has reached #R$EBE6.
  $E9DA,$07 Advance *#R$E9E3.
  $E9E1,$02 Jump back to #R$E9C2.

b $E9E3 Loader Checksum Data
@ $E9E3 label=LoaderChecksumData
D $E9E3 Stored checksum word, running-total workspace, timing-switch flag,
. and the two five-byte timing-parameter tables used by #R$E9F4.
W $E9E3,$02 Checksum scan pointer.
N $E9E5 Additive total compared with *#R$E9E7 before each tape sample.
@ $E9E5 label=Running_Checksum_Total
W $E9E5,$02 Running checksum total.
N $E9E7 Compared with *#R$E9E5 before each tape sample.
@ $E9E7 label=Expected_Checksum
W $E9E7,$02 Expected checksum.
N $E9E9 Toggled by #R$E9F4 to choose which timing table to copy next.
@ $E9E9 label=Timing_Switch_Flag
  $E9E9,$01 Timing switch flag.
N $E9EA Copied into #R$EAAE when *#R$E9E9 is zero.
@ $E9EA label=Timing_Parameters_First
  $E9EA,$05 Timing parameter set #N$00.
N $E9EF Copied into #R$EAAE when *#R$E9E9 is non-zero.
@ $E9EF label=Timing_Parameters_Second
  $E9EF,$05 Timing parameter set #N$01.

c $E9F4 Switch Timing
@ $E9F4 label=Switch_Timing
D $E9F4 Chooses which of the two timing-parameter sets to copy next, then
. hands it to #R$EA15.
  $E9F4,$08 Jump to #R$EA07 if *#R$E9E9 is zero.
  $E9FC,$04 Write #N$00 to *#R$E9E9.
  $EA00,$03 Point #REGhl at #R$E9EF.
  $EA03,$03 Call #R$EA15.
  $EA06,$01 Return.
N $EA07 Copy #R$E9EA into the sampler and advance the switch flag.
@ $EA07 label=Switch_Timing_FirstSet
  $EA07,$03 Point #REGhl at #R$E9EA.
  $EA0A,$03 Call #R$EA15.
  $EA0D,$07 Increment *#R$E9E9.
  $EA14,$01 Return.

c $EA15 Patch Timing
@ $EA15 label=Patch_Timing
D $EA15 Copies the selected five timing parameters into the sampler at
. #R$EAAE.
R $EA15 HL Address of the five-byte timing parameter set
  $EA15,$04 Write the first parameter to *#R$EB50(#N$EB51).
  $EA19,$01 Advance #REGhl.
  $EA1A,$04 Write the second parameter to *#R$EB0E(#N$EB0F).
  $EA1E,$01 Advance #REGhl.
  $EA1F,$04 Write the third parameter to *#R$EB2F(#N$EB30).
  $EA23,$01 Advance #REGhl.
  $EA24,$04 Write the fourth parameter to *#R$EB37(#N$EB38).
  $EA28,$01 Advance #REGhl.
  $EA29,$04 Write the fifth parameter to *#R$EB3C(#N$EB3D).
  $EA2D,$01 Return.

c $EA2E Control Loading
@ $EA2E label=Control_Loading
D $EA2E Reads the 16-byte main-image header into #R$EB70, then loads the
. twelve overlapping chunks and the final short block.
N $EA2E Load the main-image header.
  $EA2E,$03 Call #R$EA07.
  $EA31,$04 Point #REGix at #R$EB70.
  $EA35,$03 Set the block length in #REGde to #N($0010,$04,$04).
  $EA38,$02 Clear #REGa and set the carry flag (load a header block).
  $EA3A,$03 Call #R$EAAE.
  $EA3D,$03 Jump to #SKOOLKID$0000(START) if the carry flag is reset.
N $EA40 Prime the timing switch and read the destination and chunk count.
  $EA40,$05 Write #N$01 to *#R$E9E9.
  $EA45,$03 Call #R$E9F4.
  $EA48,$08 Copy the destination from *#R$EB7D into #REGix and *#R$EB84.
  $EA50,$04 Write #N$00 to *#R$EB86.
  $EA54,$04 Fetch the chunk count from *#R$EB7F into #REGb.
N $EA58 Load each overlapping chunk.
@ $EA58 label=Control_Loading_ChunkLoop
  $EA58,$01 Stash the remaining chunk count on the stack.
  $EA59,$03 Call #R$EB96.
  $EA5C,$03 Set the tape length in #REGde to #N($0DB6,$04,$04).
  $EA5F,$04 Point #REGix at *#R$EB84.
  $EA63,$03 Set #REGa to #N$FF and set the carry flag (load a data block).
  $EA66,$03 Call #R$EAAE.
  $EA69,$03 Jump to #SKOOLKID$0000(START) if the carry flag is reset.
  $EA6C,$03 Call #R$E9F4.
  $EA6F,$01 Enable interrupts.
  $EA70,$0A Advance *#R$EB84 by #N($0DAC,$04,$04).
  $EA7A,$01 Restore the remaining chunk count from the stack.
  $EA7B,$02 Jump back to #R$EA58 until the chunk count is zero.
N $EA7D Reload the header, then load the final short chunk.
  $EA7D,$07 Decrease *#R$EB86 by one.
  $EA84,$03 Call #R$EB96.
  $EA87,$04 Point #REGix at #R$EB70.
  $EA8B,$03 Set the block length in #REGde to #N($0010,$04,$04).
  $EA8E,$02 Clear #REGa and set the carry flag (load a header block).
  $EA90,$03 Call #R$EAAE.
  $EA93,$03 Jump to #SKOOLKID$0000(START) if the carry flag is reset.
  $EA96,$03 Call #R$E9F4.
  $EA99,$03 Call #R$EB96.
  $EA9C,$04 Point #REGix at *#R$EB84.
  $EAA0,$04 Fetch the final length from *#R$EB7B into #REGde.
  $EAA4,$03 Set #REGa to #N$FF and set the carry flag (load a data block).
  $EAA7,$03 Call #R$EAAE.
  $EAAA,$03 Jump to #SKOOLKID$0000(START) if the carry flag is reset.
  $EAAD,$01 Return.

c $EAAE Sample Tape
@ $EAAE label=Sample_Tape
D $EAAE Custom turbo sampler. Before sampling it compares the loader's
. additive checksum in *#R$E9E5 against the expected value in *#R$E9E7.
R $EAAE IX Destination address for the block
R $EAAE DE Block length
R $EAAE A Expected flag byte; carry set to load, reset to verify
R $EAAE O:F Carry is set on success
N $EAAE Refuse to load if the self-check total is wrong.
  $EAAE,$02 Stash #REGde and #REGaf on the stack.
  $EAB0,$0E Jump to #SKOOLKID$0000(START) if *#R$E9E7 does not equal
. *#R$E9E5.
  $EABE,$02 Restore #REGaf and #REGde from the stack.
N $EAC0 Preserve the flag byte and blank the border.
  $EAC0,$03 Preserve the flag byte in #REGaf'.
  $EAC3,$01 Disable interrupts.
  $EAC4,$04 Set the border to black via port #N$FE.
  $EAC8,$03 Set the initial timing budget in #REGhl to #N($053F,$04,$04).
N $EACB Seed the EAR/border state in #REGc from the current EAR bit.
  $EACB,$02 Read the EAR port.
  $EACD,$01 Rotate the EAR bit into bit 0 of #REGa.
  $EACE,$02,b$01 Keep only the EAR bit.
  $EAD0,$02,b$01 Set the blue border bit.
  $EAD2,$02 Copy the EAR/border state into #REGc and set the zero flag.
N $EAD4 Wait for the pilot tone.
@ $EAD4 label=Sample_Tape_WaitPilot
  $EAD4,$01 Return if the zero flag is reset (BREAK was pressed).
N $EAD5 Listen for a pair of edges that look like the pilot.
@ $EAD5 label=Sample_Tape_PilotPair
  $EAD5,$05 Jump back to #R$EAD4 if #R$EB50 resets the carry flag.
  $EADA,$03 Set the leader timing budget in #REGhl to #N($0415,$04,$04).
N $EADD Exhaust the leader timing budget while edges continue to arrive.
@ $EADD label=Sample_Tape_LeaderDelay
  $EADD,$02 Decrease #REGb and loop until it is zero.
  $EADF,$01 Decrease #REGhl.
  $EAE0,$04 Jump back to #R$EADD if #REGhl is non-zero.
  $EAE4,$05 Jump back to #R$EAD4 if #R$EB4C resets the carry flag.
N $EAE9 Confirm a long enough run of short pilot pulses.
@ $EAE9 label=Sample_Tape_PilotPulse
  $EAE9,$02 Set the pulse timing constant in #REGb to #N$9C.
  $EAEB,$05 Jump back to #R$EAD4 if #R$EB4C resets the carry flag.
  $EAF0,$05 Jump back to #R$EAD5 if #REGb is at least #N$A6.
  $EAF5,$03 Increase #REGh by one and jump back to #R$EAE9 until it wraps.
N $EAF8 Wait for the sync pulse that ends the pilot.
@ $EAF8 label=Sample_Tape_Sync
  $EAF8,$02 Set the sync timing constant in #REGb to #N$C9.
  $EAFA,$05 Jump back to #R$EAD4 if #R$EB50 resets the carry flag.
  $EAFF,$05 Jump back to #R$EAF8 if #REGb is at least #N$D4.
  $EB04,$04 Call #R$EB50 and return if the carry flag is reset.
N $EB08 Flip the border colour and start the byte-load loop.
  $EB08,$01 Fetch the EAR/border state from #REGc.
  $EB09,$02,b$01 Toggle the border colour bits.
  $EB0B,$01 Store the updated EAR/border state in #REGc.
  $EB0C,$02 Clear the parity byte in #REGh.
N $EB0E First-byte #REGb timing, patched by #R$EA15.
@ $EB0E label=Sample_Tape_First_Byte_Timing
  $EB0E,$02 Set #REGb to the patched first-byte timing constant.
  $EB10,$02 Jump to #R$EB31.
N $EB12 Handle each loaded byte under the preserved flag in #REGaf'.
@ $EB12 label=Sample_Tape_NextByte
  $EB12,$01 Switch to #REGaf'.
  $EB13,$02 Jump to #R$EB1C if the flag byte is not zero.
  $EB15,$02 Jump to #R$EB26 if the carry flag is reset (verify mode).
  $EB17,$03 Store the assembled byte in *#REGix+#N$00.
  $EB1A,$02 Jump to #R$EB2B.
N $EB1C Compare the assembled byte against the expected flag byte.
@ $EB1C label=Sample_Tape_FlagByte
  $EB1C,$02 Rotate the stored flag bits in #REGc.
  $EB1E,$02 Return if the assembled byte does not match.
  $EB20,$03 Restore #REGc from the rotated value.
  $EB23,$01 Advance #REGde past the flag byte.
  $EB24,$02 Jump to #R$EB2D.
N $EB26 Verify the assembled byte against *#REGix.
@ $EB26 label=Sample_Tape_VerifyByte
  $EB26,$05 Return if *#REGix+#N$00 does not match the assembled byte.
N $EB2B Advance the destination and continue for the remaining length.
@ $EB2B label=Sample_Tape_Advance
  $EB2B,$02 Advance #REGix.
N $EB2D Prepare the timing constant for the next byte.
@ $EB2D label=Sample_Tape_Continue
  $EB2D,$01 Decrease the remaining length.
  $EB2E,$01 Switch back to #REGaf'.
N $EB2F Next-byte #REGb timing, patched by #R$EA15.
@ $EB2F label=Sample_Tape_Next_Byte_Timing
  $EB2F,$02 Set #REGb to the patched next-byte timing constant.
N $EB31 Sample eight edges to assemble the next byte into #REGl.
@ $EB31 label=Sample_Tape_SampleByte
  $EB31,$02 Seed the assembled byte in #REGl with #N$01.
N $EB33 Sample one bit into #REGl.
@ $EB33 label=Sample_Tape_SampleBit
  $EB33,$04 Call #R$EB4C and return if the carry flag is reset.
N $EB37 Bit-threshold comparison, patched by #R$EA15.
@ $EB37 label=Sample_Tape_Bit_Threshold
  $EB37,$03 Compare #REGb with the patched bit-threshold.
  $EB3A,$02 Rotate that comparison result into #REGl.
N $EB3C Bit-loop #REGb timing, patched by #R$EA15.
@ $EB3C label=Sample_Tape_Bit_Loop
  $EB3C,$02 Set #REGb to the patched bit-loop timing constant.
  $EB3E,$03 Jump back to #R$EB33 until eight bits are in.
  $EB41,$03 Mix the assembled byte into the running parity in #REGh.
  $EB44,$04 Jump back to #R$EB12 until the remaining length in #REGde is
. zero.
  $EB48,$03 Compare the parity byte with #N$01.
  $EB4B,$01 Return.

c $EB4C Sample Edge
@ $EB4C label=Sample_Edge
D $EB4C Local edge-sampling helpers used by #R$EAAE. #R$EB4C waits for two
. edges, and #R$EB50 waits for one. #R$EA15 patches the delay operand at
. #R$EB50(#N$EB51).
N $EB4C Wait for a second edge after the first succeeds.
  $EB4C,$04 Call #R$EB50 and return if the carry flag is reset.
N $EB50 Wait for one EAR transition. #R$EA15 patches the delay operand at
. #R$EB50(#N$EB51).
@ $EB50 label=Sample_Edge_Wait
  $EB50,$02 Set the delay counter in #REGa.
N $EB52 Burn the patched delay before sampling.
@ $EB52 label=Sample_Edge_Delay
  $EB52,$03 Decrease #REGa and jump back to #R$EB52 until it is zero.
  $EB55,$01 Clear the carry flag.
N $EB56 Poll the EAR bit until it changes.
@ $EB56 label=Sample_Edge_Scan
  $EB56,$02 Increase #REGb and return if it wraps to zero.
  $EB58,$04 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FF | SPACE | SYMBOL SHIFT | M | N | B }
. TABLE#
  $EB5C,$02 Return if BREAK is pressed.
  $EB5E,$01 Match the new EAR state against #REGc.
  $EB5F,$02,b$01 Keep only the EAR bit.
  $EB61,$02 Jump back to #R$EB56 if the EAR bit is unchanged.
  $EB63,$03 Invert the stored EAR/border state in #REGc.
  $EB66,$02 Clear #REGa ready for the border update.
  $EB68,$02,b$01 Keep only the border colour bits.
  $EB6A,$02,b$01 Force the MIC bit off so the border shows.
  $EB6C,$02 Update the border from #REGa.
  $EB6E,$01 Set the carry flag.
  $EB6F,$01 Return.

b $EB70 Main Image Header
@ $EB70 label=MainImageHeader
D $EB70 Sixteen-byte custom header for the main image, plus the progress
. workspace and "Loading:-" banner used by #R$EB96.
  $EB70,$01 First header byte, skipped by #R$EB96.
N $EB71 Printed by #R$EB96 after the "Loading:-" banner.
@ $EB71 label=Main_Image_Header_Text
  $EB71,$0A Header bytes before the final-length word.
N $EB7B Length of the final short tape block loaded by #R$EA2E.
@ $EB7B label=Final_Chunk_Length
W $EB7B,$02 Final chunk length.
N $EB7D Start address of the main image, copied into #R$EB84.
@ $EB7D label=Main_Image_Destination
W $EB7D,$02 Destination address.
N $EB7F Number of overlapping chunks loaded by #R$EA2E.
@ $EB7F label=Main_Image_Chunk_Count
  $EB7F,$01 Chunk count.
  $EB80,$04 Spare bytes before the progress workspace.
N $EB84 Advances by #N($0DAC,$04,$04) after each overlapping chunk.
@ $EB84 label=Current_Load_Destination
W $EB84,$02 Current load destination.
N $EB86 Printed as two hexadecimal digits by #R$EB96.
@ $EB86 label=Load_Progress_Counter
  $EB86,$01 Load progress counter.
N $EB87 Banner printed by #R$EB96 while the chunks load.
@ $EB87 label=Messaging_Loading
T $EB87,$0F "#STR$EB87,$00,$0F"

c $EB96 Print Progress
@ $EB96 label=Print_Progress
D $EB96 Prints the "Loading:-" banner and the current progress counter while
. the overlapping chunks arrive.
N $EB96 Open the upper screen and print the banner plus header bytes.
  $EB96,$05 Open stream #N$01 via #SKOOLKID$1601(CHAN_OPEN).
  $EB9B,$06 Point #REGde at #R$EB87 with length #N($000F,$04,$04).
  $EBA1,$03 Call #SKOOLKID$203C,$203D(PR_STRING).
  $EBA4,$06 Point #REGde at #R$EB71 with length #N($000A,$04,$04).
  $EBAA,$03 Call #SKOOLKID$203C,$203D(PR_STRING).
  $EBAD,$06 Print two spaces with #SKOOLKID$0010(PRINT_A_1).
N $EBB3 Print the progress counter as two hexadecimal digits.
  $EBB3,$03 Fetch *#R$EB86 into #REGa.
  $EBB6,$01 Stash the counter on the stack.
  $EBB7,$03 Call #R$EBC6.
  $EBBA,$01 Restore the counter from the stack.
  $EBBB,$03 Call #R$EBD8.
  $EBBE,$07 Increment *#R$EB86.
  $EBC5,$01 Return.
N $EBC6 Print the high nibble of #REGa as a hexadecimal digit.
@ $EBC6 label=Print_Progress_HighDigit
  $EBC6,$08 Shift #REGa down by four bits.
N $EBCE Convert a nibble in #REGa to ASCII and print it.
@ $EBCE label=Print_Progress_HexDigit
  $EBCE,$04 Jump to #R$EBD4 if the nibble is less than #N$0A.
  $EBD2,$02 Add #N$07 to step from #N$0A up to "A".
N $EBD4 Make the digit printable and send it to the screen.
@ $EBD4 label=Print_Progress_PrintDigit
  $EBD4,$02 Add #N$30 to form an ASCII digit or letter.
  $EBD6,$01 Print it with #SKOOLKID$0010(PRINT_A_1).
  $EBD7,$01 Return.
N $EBD8 Print the low nibble of #REGa as a hexadecimal digit.
@ $EBD8 label=Print_Progress_LowDigit
  $EBD8,$02,b$01 Keep only the low nibble.
  $EBDA,$02 Jump to #R$EBCE.

b $EBDC Loader Padding
@ $EBDC label=LoaderPadding
D $EBDC Remaining padding through the end of the #N($0258,$04,$04)-byte
. stage-2 block. #R$EBE6 is the exclusive end address of the checksum scan
. in #R$E9B6.
  $EBDC,$0A Padding before the checksum end address.
N $EBE6 Exclusive end of the #R$E9B6 checksum scan.
@ $EBE6 label=LoaderChecksumEnd
  $EBE6,$28 Padding through the end of the stage-2 block.

i $EC0E
