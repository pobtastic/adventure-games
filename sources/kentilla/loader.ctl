; Copyright Micromega 1984, 2026 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction.

> $5CCB @start
> $5CCB @remote=main:$4000
> $5CCB @remote=main:$E9B6
> $5CCB @expand=#DEF1(#SKOOLKID(addr,anchor=0)(name)#HTML(<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/#IF({{mode[base]}}==16)(hex/)asm/#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({addr})).html#IF({anchor})(#CHR(35)#IF({{mode[base]}}==16)(#EVAL({addr},16,4),#EVAL({anchor})))">){name}#HTML(</a>))
b $5CCB BASIC Bootstrap
@ $5CCB label=BasicBootstrap
D $5CCB #HTML(The short BASIC program "KENTILLA" that starts the Micromega
. tape. It autostarts at line 1. The REM on line 1 holds the stage-1 machine
. code; line 3 CLEARs just below the loader (#R$E9B6) and enters it with
. <code>RANDOMIZE USR</code> #R$5CD0; line 4 is the ordinary ROM
. <code>LOAD "" CODE</code> that later replaces the stage-2 loader with the
. final support block at #R$E9B6@main(SupportCode).)
D $5CCB #LIST
. { Line 1: REM containing the bootstrap at #R$5CD0, its custom load routine
. at #R$5CFC, a header workspace at #R$5D96, and the loader messages. }
. { Line 2: <code>POKE 0,0</code> — an intentional no-op in ROM. }
. { Line 3: black INK/PAPER/BORDER, CLS, CLEAR just below the loader
. (#R$E9B6), then <code>RANDOMIZE USR</code> #R$5CD0. }
. { Line 4: <code>LOAD "" CODE</code> for the final #N($164A,$04,$04)-byte
. support block. }
. LIST#
B $5CCB,$0005 Line 1 header and REM token.

c $5CD0 Bootstrap Entry Point
@ $5CD0 label=BootstrapEntry
D $5CD0 #HTML(Stage-1 loader kept inside the line-1 REM. It reads a 17-byte
. custom header into #R$5D96, pulls the stage-2 length and address from that
. header, loads #N($0258,$04,$04) bytes to #N($E9B6,$04,$04), then jumps
. there.)

c $5CFC Custom Load Routine
@ $5CFC label=CustomLoad
D $5CFC #HTML(Custom edge sampler used by the bootstrap. It still calls the
. ROM edge routines at #N($05E3,$04,$04) / #N($05E7,$04,$04), but with
. Micromega timing thresholds rather than the standard ROM pilot. On error it
. restores the border from #SKOOLKID$5C48(BORDCR) and prints "ATTEMPTED
. BREAK!" or "TAPE LOADING ERROR".)

b $5D96 Stage-2 Header Workspace
@ $5D96 label=Stage2Header
D $5D96 #HTML(Seventeen bytes read from the tape's special header for the
. stage-2 loader. After a successful header read this holds the length
. #N($0258,$04,$04) and destination #N($E9B6,$04,$04).)
B $5D96,$11

b $5DA7 Bootstrap Tail And Messages
@ $5DA7 label=BootstrapTailAndMessages
D $5DA7 #HTML(Border restore, the "ATTEMPTED BREAK!" / "TAPE LOADING ERROR"
. messages, and the remainder of the line-1 REM through its trailing
. <code>ENTER</code>.)
B $5DA7,$0062

b $5E09 BASIC Lines 2 To 4
@ $5E09 label=BasicLines2To4
B $5E09,$0015 Line 2: POKE 0,0
B $5E1E,$0040 Line 3: INK 0: PAPER 0: BORDER 0: CLS: CLEAR just
. below the loader (#R$E9B6): RANDOMIZE USR #R$5CD0
B $5E5E,$0009 Line 4: LOAD ""CODE

i $5E67

c $E9B6 Micromega Loader
@ $E9B6 label=MicromegaLoader
D $E9B6 #HTML(Stage-2 Micromega 1.1 loader. It first checksums itself, then
. reads a 16-byte custom header that names destination #N($4000,$04,$04),
. total length #N($A81D,$04,$04) and #N($0C) overlapping chunks. Each of the
. twelve main chunks carries #N($0DB6,$04,$04) tape bytes but only advances
. the destination by #N($0DAC,$04,$04), so the last ten bytes of one chunk
. overlap the next. A short final chunk finishes the #N($A81D,$04,$04)-byte
. main image at #R$4000@main(Loading)..#N($E81C,$04,$04), which overwrites
. the REM bootstrap. Control then returns to BASIC so line 4 can ROM-load the
. final support block on top of this loader.)
D $E9B6 #HTML(While the chunks load, #R$E9F4 alternates two timing-parameter
. sets and #R$EA15 patches them into the sampler at #R$EAAE.)

b $E9E3 Loader Checksum And Timing Data
@ $E9E3 label=LoaderChecksumAndTiming
D $E9E3 #HTML(Stored checksum word, running-total workspace, and the two
. timing-parameter tables used by #R$E9F4.)

c $E9F4 Timing Switch
@ $E9F4 label=TimingSwitch
D $E9F4 #HTML(Chooses which of the two timing-parameter sets to copy next.)

c $EA15 Timing Patch Copier
@ $EA15 label=TimingPatchCopier
D $EA15 #HTML(Copies the selected timing parameters into the sampler.)

c $EA2E Loading Controller
@ $EA2E label=LoadingController
D $EA2E #HTML(Reads the 16-byte main-image header into #R$EB70, then loads the
. twelve overlapping chunks and the final short block.)

c $EAAE Tape Sampler
@ $EAAE label=TapeSampler
D $EAAE #HTML(Custom turbo sampler. It also compares the loader's additive
. checksum against the stored value near #R$E9E3.)

c $EB4C Edge Routines
@ $EB4C label=EdgeRoutines
D $EB4C #HTML(Local edge-sampling helpers used by #R$EAAE.)

b $EB70 Main Image Header Workspace
@ $EB70 label=MainImageHeader
D $EB70 #HTML(Sixteen-byte custom header for the main image: destination,
. length, chunk count and progress fields.)
B $EB70,$10

b $EB96 Progress Output
@ $EB96 label=ProgressOutput
D $EB96 #HTML(Prints load progress while the overlapping chunks arrive.)

b $EBDC Loader Data And Padding
@ $EBDC label=LoaderDataAndPadding
D $EBDC #HTML(Remaining data and padding through the end of the 600-byte
. stage-2 block.)

i $EC0E
