; Copyright Interceptor Software UK 1986, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
> $4000 @expand=#DEF(#POKE #LINK:Pokes)
> $4000 @expand=#DEF(#FACT #LINK:Facts)
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h After Shock Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $9DCC Game Entry Point Alias
  $9DCC,$02 Jump to #R$9DD7.

c $9DD7 Game Entry Point
@ $9DD7 label=GameEntryPoint
E $9DD7 View the equivalent code in;
. #LIST
. { #JEWELS$BA50 }
. { #WARLORD$A531 }
. LIST#
  $9DD7,$05 #HTML(Set CAPS LOCK on, using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6A.html">FLAGS2</a>).
  $9DDC,$05 #HTML(Set keyboard mode "L", using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
  $9DE1,$04 #HTML(Write #N$00 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C41.html">MODE</a>.)
  $9DE5,$05 #HTML(Set current output channel to <em>normal</em> screen output using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/1601.html">CHAN_OPEN</a> with stream #N$02.)
  $9DEA,$05 #HTML(Reset printing to the lower screen, using bit 0 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3C.html">TV_FLAG</a>.)
  $9DEF,$04 #HTML(Write #N$00 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6B.html">DF_SZ</a>.)
  $9DF3,$05 #HTML(Write #N$FF to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8C.html">SCR_CT</a>.)
  $9DF8,$03 Jump to #R$ADA1.

c $9DFB

c $9E0B Clear Lines
@ $9E0B label=ClearLines
E $9E0B View the equivalent code in #JEWELS$BA74.
  $9E0B,$04
  $9E0F,$05 #HTML(Clear #N$18 lines from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $9E14,$04
  $9E18,$01 Return.

c $9E19

c $9E26

c $9E2F

w $9E33

c $9E80

c $9F27

b $9F88

c $A0D3

c $A16D

c $A1C8

c $A25C

c $A280

c $A4B0

c $AC60

c $AC88

c $ACFC

c $AD43

c $AD79

c $ADA1
  $ADA1,$03 #REGhl=#R$9F88.
  $ADA4,$03 #REGbc=#N($0181,$04,$04).
  $ADA7,$02 Write #N$00 to *#REGhl.
  $ADA9,$01 Increment #REGhl by one.
  $ADAA,$01 Decrease #REGbc by one.
  $ADAB,$04 Jump to #R$ADA7 until #REGbc is zero.
  $ADAF,$03 #REGhl=#R$BB0B.
  $ADB2,$03 #REGde=#R$9F88.
  $ADB5,$04 #REGbc=*#R$BBC7.
  $ADB9,$02 LDIR.
  $ADBB,$03 #REGa=*#R$BBD7.
  $ADBE,$03 Write #REGa to *#R$A0D3.
  $ADC1,$04 #REGix=#R$BAF9.
  $ADC5,$03 #REGde=#R$BB05.
  $ADC8,$04 #REGb=*#R$BBD1.
  $ADCC,$03 #REGl=*#REGix+#N$00.
  $ADCF,$03 #REGh=*#REGix+#N$01.
  $ADD2,$01 #REGa=*#REGde.
  $ADD3,$01 Write #REGa to *#REGhl.
  $ADD4,$04 Increment #REGix by two.
  $ADD8,$01 Increment #REGde by one.
  $ADD9,$02 Decrease counter by one and loop back to #R$ADCC until counter is zero.
  $ADDB,$03 Call #R$9F27.
  $ADDE,$03 #REGa=*#R$BBD3.
  $ADE1,$03 Write #REGa to *#R$A106.
  $ADE4,$03 Call #R$AD79.
  $ADE7,$03 Call #R$A280.
  $ADEA,$03 Call #R$AC88.
  $ADED,$02 #REGa=#N$00.
  $ADEF,$03 Call #R$A1C8.
  $ADF2,$02 Jump to #R$AE0D if #REGde is not equal to #REGc.
  $ADF4,$02 #REGa=#N$01.
  $ADF6,$03 Call #R$A1C8.
  $ADF9,$02 Jump to #R$AE13 if #REGde is not equal to #REGc.
  $ADFB,$02 #REGa=#N$02.
  $ADFD,$03 Call #R$A1C8.
  $AE00,$02 Jump to #R$AE16 if #REGde is not equal to #REGc.
  $AE02,$03 Call #R$A4B0.
  $AE05,$03 Call #R$AC60.
  $AE08,$03 Call #R$ACFC if #REGc is greater than #N$02.
  $AE0B,$02 Jump to #R$ADE7.

  $AE0D,$03 #REGhl=#N($0010,$04,$04).
  $AE10,$03 Call #R$A25C.
  $AE13,$03 Call #R$AD43.
  $AE16,$03 #REGhl=#N($0011,$04,$04).
  $AE19,$03 Call #R$A25C.
  $AE1C,$03 Call #R$9DFB.
  $AE1F,$05 Jump to #N$0000 if #REGa is equal to #N$4E.
  $AE24,$05 Jump to #R$9DD7 if #REGa is equal to #N$59.
  $AE29,$03 Jump to #R$AE1C.

c $AE2C

g $B969
g $B9EC
g $B9FA
g $BA00
g $BA04
g $BA4D

g $BAF9
W $BAF9,$02
L $BAF9,$02,$06,$02

g $BB05

g $BB0B
B $BB0B

g $BBC7
W $BBC7,$02

g $BBD1
B $BBD1,$01

g $BBD3
B $BBD3,$01

g $BBD7
B $BBD7,$01
