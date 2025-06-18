; Copyright Adventuresoft UK Ltd 1986, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @org=$4000
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Blizzard Pass Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

g $5B7F

g $5B80

g $5B85

g $5B87

g $5B89

g $5B8A

g $5B95

g $5B97

g $5D87

g $5D88

g $5D8E

g $5DCA

c $5ECB
  $5ECB,$06 #HTML(Write #R$6B41 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3D.html">ERR_SP</a>.)
  $5ED1,$03 #REGsp=#N$5D84.
  $5ED4,$03 Call #R$600F.
  $5ED7,$04 Write #N$00 to *#R$6185.
  $5EDB,$03 Call #R$6187.
  $5EDE,$04 Write #N$00 to *#R$5D8E.
  $5EE2,$03 Call #R$6058.
  $5EE5,$06 Jump to #R$5EEE if *#R$5B95 is zero.
  $5EEB,$03 Call #R$6187.
  $5EEE,$03 Call #R$6B15.
  $5EF1,$04 Write #N$00 to *#R$5B95.
  $5EF5,$06 Jump to #R$5F46 if *#R$5D8E is not zero.
  $5EFB,$03 Call #R$66C7.
  $5EFE,$06 Jump to #R$5F21 if *#R$5B7F is not zero.
  $5F04,$06 Jump to #R$5F21 if *#R$5B80 is not zero.
  $5F0A,$02 #REGa=#N$0B.
  $5F0C,$03 Call #R$63D4.
  $5F0F,$04 Write #N$00 to *#R$5B85.
  $5F13,$02 Jump to #R$5EDE.
B $5F15,$01

c $5F16

c $5F21

B $5F8F,$1B

c $5FCE

c $5FF1

c $600F
  $600F,$05 Write #N$17 to *#R$5B97.
  $6014,$05 Write #N$16 to *#R$5B89.
  $6019,$03 Call #R$654B.
  $601C,$04 Write #N$00 to *#R$5B8A.
  $6020,$03 Call #R$6618.
  $6023,$03 #REGhl=#R$5B7F.
  $6026,$02 #REGb=#N$05.
  $6028,$02 Write #N$00 to *#REGhl.
  $602A,$01 Increment #REGhl by one.
  $602B,$02 Decrease counter by one and loop back to #R$6028 until counter is zero.
  $602D,$04 Write #N$00 to *#R$5B85.
  $6031,$03 #REGhl=#R$5D87.
  $6034,$02 #REGb=#N$41.
  $6036,$02 Write #N$00 to *#REGhl.
  $6038,$01 Increment #REGhl by one.
  $6039,$02 Decrease counter by one and loop back to #R$6036 until counter is zero.
  $603B,$0B Copy #N$0100  bytes of data from *#R$B6A8 to *#R$5DCA.
  $6046,$0B Copy #N($0006,$04,$04) bytes of data from *#R$6052 to *#R$5D88.
  $6051,$01 Return.

g $6052
B $6052,$01
L $6052,$01,$06

c $6058

c $6187

c $63D4

c $6483
  $6483,$04 #REGde=*#R$5B87.
  $6487,$03 #HTML(#REGbc=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $648A,$02 #REGh=#N$00.
  $648C,$01 #REGl=#REGa.
  $648D,$01 #REGhl+=#REGhl.
  $648E,$01 #REGhl+=#REGhl.
  $648F,$01 #REGhl+=#REGhl.
  $6490,$01 #REGhl+=#REGbc.
  $6491,$02 Stash #REGde and #REGhl on the stack.
  $6493,$03 #REGde=#R$6B23.
  $6496,$03 #REGbc=#N($0800,$04,$04).
  $6499,$01 #REGa=*#REGhl.
  $649A,$01 Write #REGa to *#REGde.
  $649B,$01 Increment #REGhl by one.
  $649C,$01 Increment #REGde by one.
  $649D,$02 Test bit 1 of #REGa.
  $649F,$02 Jump to #R$64A3 if #REGde is equal to #N$00.
  $64A1,$02 #REGc=#N$FF.
  $64A3,$02 Decrease counter by one and loop back to #R$6499 until counter is zero.
  $64A5,$03 #REGde=#R$6B23.
  $64A8,$02 #REGb=#N$08.
  $64AA,$01 #REGa=*#REGde.
  $64AB,$01 RLA.
  $64AC,$02 Jump to #R$64B0 if #REGde is greater than or equal to #N$08.
  $64AE,$02,b$01 Set bits 7.
  $64B0,$02 Test bit 0 of #REGc.
  $64B2,$02 Jump to #R$64BE if #REGde is equal to #N$08.
  $64B4,$01 #REGh=#REGa.
  $64B5,$02,b$01 Keep only bits 0-3.
  $64B7,$01 #REGl=#REGa.
  $64B8,$01 #REGa=#REGh.
  $64B9,$02,b$01 Keep only bits 4-7.
  $64BB,$02 Rotate #REGl left.
  $64BD,$01 Set the bits from #REGl.
  $64BE,$02,b$01 Keep only bits 2-7.
  $64C0,$01 Write #REGa to *#REGde.
  $64C1,$01 Increment #REGde by one.
  $64C2,$02 Decrease counter by one and loop back to #R$64AA until counter is zero.
  $64C4,$02 Restore #REGhl and #REGde from the stack.
  $64C6,$03 #REGhl=#R$6B23.
  $64C9,$01 Exchange the #REGde and #REGhl registers.
  $64CA,$01 Stash #REGhl on the stack.
  $64CB,$03 #REGa=*#R$5B8A.
  $64CE,$02,b$01 Keep only bits 0-1.
  $64D0,$01 Decrease #REGa by one.
  $64D1,$02 Jump to #R$64E8 if #REGa is equal to #REGl.
  $64D3,$01 Decrease #REGa by one.
  $64D4,$02 Jump to #R$6500 if #REGa is equal to #REGl.
  $64D6,$01 Decrease #REGa by one.
  $64D7,$02 Jump to #R$6525 if #REGa is equal to #REGl.
  $64D9,$02 #REGb=#N$08.
  $64DB,$01 #REGa=*#REGde.
  $64DC,$01 Write #REGa to *#REGhl.
  $64DD,$01 Increment #REGde by one.
  $64DE,$01 Increment #REGh by one.
  $64DF,$02 Decrease counter by one and loop back to #R$64DB until counter is zero.
  $64E1,$01 Restore #REGhl from the stack.
  $64E2,$01 Increment #REGhl by one.
  $64E3,$03 Write #REGhl to *#R$5B87.
  $64E6,$02 Jump to #R$6538.
  $64E8,$02 #REGb=#N$08.
  $64EA,$01 #REGa=*#REGde.
  $64EB,$01 Decrease #REGhl by one.
  $64EC,$02 Shift *#REGhl right.
  $64EE,$02 Shift *#REGhl right.
  $64F0,$02 Shift #REGa left (with carry).
  $64F2,$02 Rotate *#REGhl left.
  $64F4,$02 Shift #REGa left (with carry).
  $64F6,$02 Rotate *#REGhl left.
  $64F8,$01 Increment #REGhl by one.
  $64F9,$01 Write #REGa to *#REGhl.
  $64FA,$01 Increment #REGh by one.
  $64FB,$01 Increment #REGde by one.
  $64FC,$02 Decrease counter by one and loop back to #R$64EA until counter is zero.
  $64FE,$02 Jump to #R$64E1.
  $6500,$02 #REGb=#N$08.
  $6502,$01 #REGa=*#REGde.
  $6503,$01 Decrease #REGhl by one.
  $6504,$02 Shift *#REGhl right.
  $6506,$02 Shift *#REGhl right.
  $6508,$02 Shift *#REGhl right.
  $650A,$02 Shift *#REGhl right.
  $650C,$02 Shift #REGa left (with carry).
  $650E,$02 Rotate *#REGhl left.
  $6510,$02 Shift #REGa left (with carry).
  $6512,$02 Rotate *#REGhl left.
  $6514,$02 Shift #REGa left (with carry).
  $6516,$02 Rotate *#REGhl left.
  $6518,$02 Shift #REGa left (with carry).
  $651A,$02 Rotate *#REGhl left.
  $651C,$01 Increment #REGhl by one.
  $651D,$01 Write #REGa to *#REGhl.
  $651E,$01 Increment #REGh by one.
  $651F,$01 Increment #REGde by one.
  $6520,$02 Decrease counter by one and loop back to #R$6502 until counter is zero.
  $6522,$01 Restore #REGhl from the stack.
  $6523,$02 Jump to #R$6538.
  $6525,$02 #REGb=#N$08.
  $6527,$02 #REGa=#N$C0.
  $6529,$01 Merge the bits from *#REGhl.
  $652A,$01 Write #REGa to *#REGhl.
  $652B,$01 #REGa=*#REGde.
  $652C,$02 Shift #REGa right.
  $652E,$02 Shift #REGa right.
  $6530,$01 Set the bits from *#REGhl.
  $6531,$01 Write #REGa to *#REGhl.
  $6532,$01 Increment #REGh by one.
  $6533,$01 Increment #REGde by one.
  $6534,$02 Decrease counter by one and loop back to #R$6527 until counter is zero.
  $6536,$02 Jump to #R$64E1.
  $6538,$01 Restore #REGaf from the stack.
  $6539,$01 Stash #REGaf on the stack.
  $653A,$03 #REGa=*#R$5B8A.
  $653D,$02 Compare #REGa with #N$29.
  $653F,$03 Jump to #R$6440 if #REGa is equal to #N$29.
  $6542,$01 Increment #REGa by one.
  $6543,$03 Write #REGa to *#R$5B8A.
  $6546,$04 Restore #REGaf, #REGde, #REGbc and #REGhl from the stack.
  $654A,$01 Return.

c $654B

g $655A
W $655A,$02
W $655C,$02

c $655E

c $6618
  $6618,$03 #REGhl=#N($4000,$04,$04).
  $661B,$03 #REGde=#N$4001 (screen buffer location).
  $661E,$03 #REGbc=#N($1800,$04,$04).
  $6621,$02 Write #N$00 to *#REGhl.
  $6623,$02 LDIR.
  $6625,$02 Write #COLOUR$38 to *#REGhl.
  $6627,$03 #REGbc=#N$02FF.
  $662A,$02 LDIR.
  $662C,$01 Return.

c $662D

c $66C7

c $6B15

B $6B23,$01
L $6B23,$01,$08

c $6B2B

c $6B41 Error?

t $A710

t $A720
  $A720,$04 #STR#(#PEEK(#PC)),$04,$04
B $A724,$01 ID #PEEK(#PC).
L $A720,$05,$A8

t $AA68

t $B1BC

b $B6A8
  $B6A8,$100

c $FFE9 Game Entry Point
@ $FFE9 label=GameEntryPoint
