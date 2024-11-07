@256
D=A
@SP
M=D
@0
D=A
@R14
M=D
@Sys.init
D=A
@R13
M=D
@return0
D=A
@CALL
0;JMP
(return0)
(HALT)
@HALT
0;JMP
(RETURN)
@LCL
D=M
@R13
M=D
@R13
D=M
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
(CALL)
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@R14
A=M
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@R13
A=M
0;JMP

(Keyboard.init)
@0
D=A
(Keyboard.init_LOOP)
@Keyboard.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Keyboard.init_LOOP
0;JMP
(Keyboard.init_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Keyboard.readChar)
@1
D=A
(Keyboard.readChar_LOOP)
@Keyboard.readChar_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Keyboard.readChar_LOOP
0;JMP
(Keyboard.readChar_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.printChar
D=A
@R13
M=D
@return1
D=A
@CALL
0;JMP
(return1)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@UART.rx
D=A
@R13
M=D
@return2
D=A
@CALL
0;JMP
(return2)
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0
D=A
@R14
M=D
@Output.backSpace
D=A
@R13
M=D
@return3
D=A
@CALL
0;JMP
(return3)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.printChar
D=A
@R13
M=D
@return4
D=A
@CALL
0;JMP
(return4)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Keyboard.readLine)
@5
D=A
(Keyboard.readLine_LOOP)
@Keyboard.readLine_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Keyboard.readLine_LOOP
0;JMP
(Keyboard.readLine_END)

@80  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return5
D=A
@CALL
0;JMP
(return5)
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return6
D=A
@CALL
0;JMP
(return6)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Keyboard.readLine$while4)
@LCL //push local
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Keyboard.readLine$whileend4
D;JNE
@0
D=A
@R14
M=D
@Keyboard.readChar
D=A
@R13
M=D
@return7
D=A
@CALL
0;JMP
(return7)
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@13  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq0
D;JEQ
@SP
A=M-1
M=0
(eq0)
@LCL //pop local
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Keyboard.readLine$if5
D;JNE
@Keyboard.readLine$ifelse5
0;JMP
(Keyboard.readLine$if5)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@127  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq1
D;JEQ
@SP
A=M-1
M=0
(eq1)
@SP
AM=M-1
D=M
@Keyboard.readLine$if6
D;JNE
@Keyboard.readLine$ifelse6
0;JMP
(Keyboard.readLine$if6)
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.eraseLastChar
D=A
@R13
M=D
@return8
D=A
@CALL
0;JMP
(return8)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Keyboard.readLine$ifend6
0;JMP
(Keyboard.readLine$ifelse6)
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return9
D=A
@CALL
0;JMP
(return9)
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Keyboard.readLine$ifend6)
(Keyboard.readLine$ifelse5)
@Keyboard.readLine$while4
0;JMP
(Keyboard.readLine$whileend4)
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Keyboard.readInt)
@2
D=A
(Keyboard.readInt_LOOP)
@Keyboard.readInt_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Keyboard.readInt_LOOP
0;JMP
(Keyboard.readInt_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Keyboard.readLine
D=A
@R13
M=D
@return10
D=A
@CALL
0;JMP
(return10)
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.intValue
D=A
@R13
M=D
@return11
D=A
@CALL
0;JMP
(return11)
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.dispose
D=A
@R13
M=D
@return12
D=A
@CALL
0;JMP
(return12)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.init)
@0
D=A
(Screen.init_LOOP)
@Screen.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.init_LOOP
0;JMP
(Screen.init_END)

@8200  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Screen.0
M=D
@239  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return13
D=A
@CALL
0;JMP
(return13)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return14
D=A
@CALL
0;JMP
(return14)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@128  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return15
D=A
@CALL
0;JMP
(return15)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return16
D=A
@CALL
0;JMP
(return16)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@207  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return17
D=A
@CALL
0;JMP
(return17)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return18
D=A
@CALL
0;JMP
(return18)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@193  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return19
D=A
@CALL
0;JMP
(return19)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return20
D=A
@CALL
0;JMP
(return20)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@237  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return21
D=A
@CALL
0;JMP
(return21)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return22
D=A
@CALL
0;JMP
(return22)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return23
D=A
@CALL
0;JMP
(return23)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return24
D=A
@CALL
0;JMP
(return24)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@129  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return25
D=A
@CALL
0;JMP
(return25)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@232  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return26
D=A
@CALL
0;JMP
(return26)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@133  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return27
D=A
@CALL
0;JMP
(return27)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return28
D=A
@CALL
0;JMP
(return28)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@120  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return29
D=A
@CALL
0;JMP
(return29)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@203  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return30
D=A
@CALL
0;JMP
(return30)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@57  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return31
D=A
@CALL
0;JMP
(return31)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@44  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return32
D=A
@CALL
0;JMP
(return32)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return33
D=A
@CALL
0;JMP
(return33)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@52  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return34
D=A
@CALL
0;JMP
(return34)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return35
D=A
@CALL
0;JMP
(return35)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@247  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return36
D=A
@CALL
0;JMP
(return36)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return37
D=A
@CALL
0;JMP
(return37)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@234  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return38
D=A
@CALL
0;JMP
(return38)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return39
D=A
@CALL
0;JMP
(return39)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return40
D=A
@CALL
0;JMP
(return40)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@192  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return41
D=A
@CALL
0;JMP
(return41)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return42
D=A
@CALL
0;JMP
(return42)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@193  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return43
D=A
@CALL
0;JMP
(return43)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return44
D=A
@CALL
0;JMP
(return44)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@197  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return45
D=A
@CALL
0;JMP
(return45)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@62  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return46
D=A
@CALL
0;JMP
(return46)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@40  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return47
D=A
@CALL
0;JMP
(return47)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@199  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return48
D=A
@CALL
0;JMP
(return48)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@134  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return49
D=A
@CALL
0;JMP
(return49)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return50
D=A
@CALL
0;JMP
(return50)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@72  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return51
D=A
@CALL
0;JMP
(return51)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@55  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return52
D=A
@CALL
0;JMP
(return52)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return53
D=A
@CALL
0;JMP
(return53)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@58  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return54
D=A
@CALL
0;JMP
(return54)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@85  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return55
D=A
@CALL
0;JMP
(return55)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@177  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return56
D=A
@CALL
0;JMP
(return56)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return57
D=A
@CALL
0;JMP
(return57)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return58
D=A
@CALL
0;JMP
(return58)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@182  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return59
D=A
@CALL
0;JMP
(return59)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return60
D=A
@CALL
0;JMP
(return60)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@130  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return61
D=A
@CALL
0;JMP
(return61)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return62
D=A
@CALL
0;JMP
(return62)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@242  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return63
D=A
@CALL
0;JMP
(return63)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return64
D=A
@CALL
0;JMP
(return64)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@38  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return65
D=A
@CALL
0;JMP
(return65)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return66
D=A
@CALL
0;JMP
(return66)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@224  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return67
D=A
@CALL
0;JMP
(return67)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return68
D=A
@CALL
0;JMP
(return68)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@49  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return69
D=A
@CALL
0;JMP
(return69)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return70
D=A
@CALL
0;JMP
(return70)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return71
D=A
@CALL
0;JMP
(return71)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return72
D=A
@CALL
0;JMP
(return72)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return73
D=A
@CALL
0;JMP
(return73)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@78  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return74
D=A
@CALL
0;JMP
(return74)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@241  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return75
D=A
@CALL
0;JMP
(return75)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@55  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return76
D=A
@CALL
0;JMP
(return76)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return77
D=A
@CALL
0;JMP
(return77)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return78
D=A
@CALL
0;JMP
(return78)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return79
D=A
@CALL
0;JMP
(return79)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return80
D=A
@CALL
0;JMP
(return80)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@9  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return81
D=A
@CALL
0;JMP
(return81)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return82
D=A
@CALL
0;JMP
(return82)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@225  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return83
D=A
@CALL
0;JMP
(return83)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return84
D=A
@CALL
0;JMP
(return84)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return85
D=A
@CALL
0;JMP
(return85)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@20  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return86
D=A
@CALL
0;JMP
(return86)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return87
D=A
@CALL
0;JMP
(return87)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@17  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return88
D=A
@CALL
0;JMP
(return88)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return89
D=A
@CALL
0;JMP
(return89)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@49  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return90
D=A
@CALL
0;JMP
(return90)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@193  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return91
D=A
@CALL
0;JMP
(return91)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@72  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return92
D=A
@CALL
0;JMP
(return92)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return93
D=A
@CALL
0;JMP
(return93)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return94
D=A
@CALL
0;JMP
(return94)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return95
D=A
@CALL
0;JMP
(return95)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@49  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return96
D=A
@CALL
0;JMP
(return96)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return97
D=A
@CALL
0;JMP
(return97)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return98
D=A
@CALL
0;JMP
(return98)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@17  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return99
D=A
@CALL
0;JMP
(return99)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@128  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return100
D=A
@CALL
0;JMP
(return100)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@41  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return101
D=A
@CALL
0;JMP
(return101)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@128  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData
D=A
@R13
M=D
@return102
D=A
@CALL
0;JMP
(return102)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Screen.clearScreen
D=A
@R13
M=D
@return103
D=A
@CALL
0;JMP
(return103)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.clearScreen)
@0
D=A
(Screen.clearScreen_LOOP)
@Screen.clearScreen_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.clearScreen_LOOP
0;JMP
(Screen.clearScreen_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@240  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@320  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@5
D=A
@R14
M=D
@Screen.drawRectangle
D=A
@R13
M=D
@return104
D=A
@CALL
0;JMP
(return104)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.drawPixel)
@0
D=A
(Screen.drawPixel_LOOP)
@Screen.drawPixel_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.drawPixel_LOOP
0;JMP
(Screen.drawPixel_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt2
D;JLT
@SP
A=M-1
M=0
(lt2)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@239  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt3
D;JGT
@SP
A=M-1
M=0
(gt3)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt4
D;JLT
@SP
A=M-1
M=0
(lt4)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@319  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt5
D;JGT
@SP
A=M-1
M=0
(gt5)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@SP
AM=M-1
D=M
@Screen.drawPixel$if1
D;JNE
@Screen.drawPixel$ifelse1
0;JMP
(Screen.drawPixel$if1)
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return105
D=A
@CALL
0;JMP
(return105)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Screen.drawPixel$ifelse1)
@42  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return106
D=A
@CALL
0;JMP
(return106)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return107
D=A
@CALL
0;JMP
(return107)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return108
D=A
@CALL
0;JMP
(return108)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return109
D=A
@CALL
0;JMP
(return109)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return110
D=A
@CALL
0;JMP
(return110)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return111
D=A
@CALL
0;JMP
(return111)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@44  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return112
D=A
@CALL
0;JMP
(return112)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return113
D=A
@CALL
0;JMP
(return113)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.drawLine)
@4
D=A
(Screen.drawLine_LOOP)
@Screen.drawLine_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.drawLine_LOOP
0;JMP
(Screen.drawLine_END)

@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt6
D;JLT
@SP
A=M-1
M=0
(lt6)
@SP
AM=M-1
D=M
@Screen.drawLine$if1
D;JNE
@Screen.drawLine$ifelse1
0;JMP
(Screen.drawLine$if1)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawLine$ifend1
0;JMP
(Screen.drawLine$ifelse1)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Screen.drawLine$ifend1)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt7
D;JLT
@SP
A=M-1
M=0
(lt7)
@SP
AM=M-1
D=M
@Screen.drawLine$if6
D;JNE
@Screen.drawLine$ifelse6
0;JMP
(Screen.drawLine$if6)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawLine$ifend6
0;JMP
(Screen.drawLine$ifelse6)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Screen.drawLine$ifend6)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq8
D;JEQ
@SP
A=M-1
M=0
(eq8)
@SP
AM=M-1
D=M
@Screen.drawLine$if11
D;JNE
@Screen.drawLine$ifelse11
0;JMP
(Screen.drawLine$if11)
(Screen.drawLine$while13)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq9
D;JEQ
@SP
A=M-1
M=0
(eq9)
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.drawLine$whileend13
D;JNE
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3
D=A
@R14
M=D
@Screen.drawPixel
D=A
@R13
M=D
@return114
D=A
@CALL
0;JMP
(return114)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //pop argument
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawLine$while13
0;JMP
(Screen.drawLine$whileend13)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3
D=A
@R14
M=D
@Screen.drawPixel
D=A
@R13
M=D
@return115
D=A
@CALL
0;JMP
(return115)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.drawLine$ifelse11)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq10
D;JEQ
@SP
A=M-1
M=0
(eq10)
@SP
AM=M-1
D=M
@Screen.drawLine$if22
D;JNE
@Screen.drawLine$ifelse22
0;JMP
(Screen.drawLine$if22)
(Screen.drawLine$while24)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq11
D;JEQ
@SP
A=M-1
M=0
(eq11)
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.drawLine$whileend24
D;JNE
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3
D=A
@R14
M=D
@Screen.drawPixel
D=A
@R13
M=D
@return116
D=A
@CALL
0;JMP
(return116)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //pop argument
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawLine$while24
0;JMP
(Screen.drawLine$whileend24)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3
D=A
@R14
M=D
@Screen.drawPixel
D=A
@R13
M=D
@return117
D=A
@CALL
0;JMP
(return117)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.drawLine$ifelse22)
(Screen.drawLine$while34)
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq12
D;JEQ
@SP
A=M-1
M=0
(eq12)
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq13
D;JEQ
@SP
A=M-1
M=0
(eq13)
@SP  //and
AM=M-1
D=M
A=A-1
M=D&M
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.drawLine$whileend34
D;JNE
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3
D=A
@R14
M=D
@Screen.drawPixel
D=A
@R13
M=D
@return118
D=A
@CALL
0;JMP
(return118)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return119
D=A
@CALL
0;JMP
(return119)
@1
D=A
@R14
M=D
@Math.abs
D=A
@R13
M=D
@return120
D=A
@CALL
0;JMP
(return120)
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return121
D=A
@CALL
0;JMP
(return121)
@1
D=A
@R14
M=D
@Math.abs
D=A
@R13
M=D
@return122
D=A
@CALL
0;JMP
(return122)
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt14
D;JGT
@SP
A=M-1
M=0
(gt14)
@SP
AM=M-1
D=M
@Screen.drawLine$if37
D;JNE
@Screen.drawLine$ifelse37
0;JMP
(Screen.drawLine$if37)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //pop argument
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawLine$ifend37
0;JMP
(Screen.drawLine$ifelse37)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //pop argument
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Screen.drawLine$ifend37)
@Screen.drawLine$while34
0;JMP
(Screen.drawLine$whileend34)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3
D=A
@R14
M=D
@Screen.drawPixel
D=A
@R13
M=D
@return123
D=A
@CALL
0;JMP
(return123)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.drawRectangle)
@2
D=A
(Screen.drawRectangle_LOOP)
@Screen.drawRectangle_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.drawRectangle_LOOP
0;JMP
(Screen.drawRectangle_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@4
D=A
@R14
M=D
@Screen.setAddrWindow
D=A
@R13
M=D
@return124
D=A
@CALL
0;JMP
(return124)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Screen.drawRectangle$while4)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt15
D;JLT
@SP
A=M-1
M=0
(lt15)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.drawRectangle$whileend4
D;JNE
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Screen.drawRectangle$while6)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt16
D;JLT
@SP
A=M-1
M=0
(lt16)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.drawRectangle$whileend6
D;JNE
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return125
D=A
@CALL
0;JMP
(return125)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawRectangle$while6
0;JMP
(Screen.drawRectangle$whileend6)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawRectangle$while4
0;JMP
(Screen.drawRectangle$whileend4)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.drawCircle)
@4
D=A
(Screen.drawCircle_LOOP)
@Screen.drawCircle_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.drawCircle_LOOP
0;JMP
(Screen.drawCircle_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Screen.drawCircle$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq17
D;JEQ
@SP
A=M-1
M=0
(eq17)
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.drawCircle$whileend2
D;JNE
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return126
D=A
@CALL
0;JMP
(return126)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return127
D=A
@CALL
0;JMP
(return127)
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@1
D=A
@R14
M=D
@Math.sqrt
D=A
@R13
M=D
@return128
D=A
@CALL
0;JMP
(return128)
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@5
D=A
@R14
M=D
@Screen.drawLine
D=A
@R13
M=D
@return129
D=A
@CALL
0;JMP
(return129)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@5
D=A
@R14
M=D
@Screen.drawLine
D=A
@R13
M=D
@return130
D=A
@CALL
0;JMP
(return130)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.drawCircle$while2
0;JMP
(Screen.drawCircle$whileend2)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.setAddrWindow)
@0
D=A
(Screen.setAddrWindow_LOOP)
@Screen.setAddrWindow_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.setAddrWindow_LOOP
0;JMP
(Screen.setAddrWindow_END)

@42  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return131
D=A
@CALL
0;JMP
(return131)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return132
D=A
@CALL
0;JMP
(return132)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return133
D=A
@CALL
0;JMP
(return133)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return134
D=A
@CALL
0;JMP
(return134)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return135
D=A
@CALL
0;JMP
(return135)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return136
D=A
@CALL
0;JMP
(return136)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@44  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeCommand
D=A
@R13
M=D
@return137
D=A
@CALL
0;JMP
(return137)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.writeData)
@1
D=A
(Screen.writeData_LOOP)
@Screen.writeData_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.writeData_LOOP
0;JMP
(Screen.writeData_END)

(Screen.writeData$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq18
D;JEQ
@SP
A=M-1
M=0
(eq18)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.writeData$whileend2
D;JNE
@Screen.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.writeData$while2
0;JMP
(Screen.writeData$whileend2)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Screen.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.writeData16)
@1
D=A
(Screen.writeData16_LOOP)
@Screen.writeData16_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.writeData16_LOOP
0;JMP
(Screen.writeData16_END)

(Screen.writeData16$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq19
D;JEQ
@SP
A=M-1
M=0
(eq19)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.writeData16$whileend2
D;JNE
@Screen.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.writeData16$while2
0;JMP
(Screen.writeData16$whileend2)
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Screen.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.writeCommand)
@1
D=A
(Screen.writeCommand_LOOP)
@Screen.writeCommand_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.writeCommand_LOOP
0;JMP
(Screen.writeCommand_END)

(Screen.writeCommand$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq20
D;JEQ
@SP
A=M-1
M=0
(eq20)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Screen.writeCommand$whileend2
D;JNE
@Screen.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Screen.writeCommand$while2
0;JMP
(Screen.writeCommand$whileend2)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Screen.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.BLACK)
@0
D=A
(Screen.BLACK_LOOP)
@Screen.BLACK_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.BLACK_LOOP
0;JMP
(Screen.BLACK_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.NAVY)
@0
D=A
(Screen.NAVY_LOOP)
@Screen.NAVY_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.NAVY_LOOP
0;JMP
(Screen.NAVY_END)

@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.DARKGREEN)
@0
D=A
(Screen.DARKGREEN_LOOP)
@Screen.DARKGREEN_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.DARKGREEN_LOOP
0;JMP
(Screen.DARKGREEN_END)

@992  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.DARKCYAN)
@0
D=A
(Screen.DARKCYAN_LOOP)
@Screen.DARKCYAN_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.DARKCYAN_LOOP
0;JMP
(Screen.DARKCYAN_END)

@1007  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.MAROON)
@0
D=A
(Screen.MAROON_LOOP)
@Screen.MAROON_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.MAROON_LOOP
0;JMP
(Screen.MAROON_END)

@30720  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.PURPLE)
@0
D=A
(Screen.PURPLE_LOOP)
@Screen.PURPLE_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.PURPLE_LOOP
0;JMP
(Screen.PURPLE_END)

@30735  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.OLIVE)
@0
D=A
(Screen.OLIVE_LOOP)
@Screen.OLIVE_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.OLIVE_LOOP
0;JMP
(Screen.OLIVE_END)

@31712  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.LIGHTGREY)
@0
D=A
(Screen.LIGHTGREY_LOOP)
@Screen.LIGHTGREY_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.LIGHTGREY_LOOP
0;JMP
(Screen.LIGHTGREY_END)

@14824  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Screen.DARKGREY)
@0
D=A
(Screen.DARKGREY_LOOP)
@Screen.DARKGREY_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.DARKGREY_LOOP
0;JMP
(Screen.DARKGREY_END)

@31727  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.BLUE)
@0
D=A
(Screen.BLUE_LOOP)
@Screen.BLUE_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.BLUE_LOOP
0;JMP
(Screen.BLUE_END)

@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.GREEN)
@0
D=A
(Screen.GREEN_LOOP)
@Screen.GREEN_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.GREEN_LOOP
0;JMP
(Screen.GREEN_END)

@2016  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.CYAN)
@0
D=A
(Screen.CYAN_LOOP)
@Screen.CYAN_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.CYAN_LOOP
0;JMP
(Screen.CYAN_END)

@2047  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Screen.RED)
@0
D=A
(Screen.RED_LOOP)
@Screen.RED_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.RED_LOOP
0;JMP
(Screen.RED_END)

@2048  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Screen.MAGENTA)
@0
D=A
(Screen.MAGENTA_LOOP)
@Screen.MAGENTA_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.MAGENTA_LOOP
0;JMP
(Screen.MAGENTA_END)

@2017  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Screen.YELLOW)
@0
D=A
(Screen.YELLOW_LOOP)
@Screen.YELLOW_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.YELLOW_LOOP
0;JMP
(Screen.YELLOW_END)

@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Screen.WHITE)
@0
D=A
(Screen.WHITE_LOOP)
@Screen.WHITE_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.WHITE_LOOP
0;JMP
(Screen.WHITE_END)

@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Screen.ORANGE)
@0
D=A
(Screen.ORANGE_LOOP)
@Screen.ORANGE_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.ORANGE_LOOP
0;JMP
(Screen.ORANGE_END)

@736  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Screen.GREENYELLOW)
@0
D=A
(Screen.GREENYELLOW_LOOP)
@Screen.GREENYELLOW_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.GREENYELLOW_LOOP
0;JMP
(Screen.GREENYELLOW_END)

@20507  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Screen.PINK)
@0
D=A
(Screen.PINK_LOOP)
@Screen.PINK_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Screen.PINK_LOOP
0;JMP
(Screen.PINK_END)

@1000  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Output.init)
@0
D=A
(Output.init_LOOP)
@Output.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.init_LOOP
0;JMP
(Output.init_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Output.5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Output.1
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Output.0
M=D
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return138
D=A
@CALL
0;JMP
(return138)
@SP  //pop static
AM=M-1
D=M
@Output.2
M=D
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.new
D=A
@R13
M=D
@return139
D=A
@CALL
0;JMP
(return139)
@SP  //pop static
AM=M-1
D=M
@Output.4
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@4  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@4  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@5  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@64  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0
D=A
@R14
M=D
@Output.initMap
D=A
@R13
M=D
@return140
D=A
@CALL
0;JMP
(return140)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.initMap)
@0
D=A
(Output.initMap_LOOP)
@Output.initMap_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.initMap_LOOP
0;JMP
(Output.initMap_END)

@127  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.new
D=A
@R13
M=D
@return141
D=A
@CALL
0;JMP
(return141)
@SP  //pop static
AM=M-1
D=M
@Output.3
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return142
D=A
@CALL
0;JMP
(return142)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return143
D=A
@CALL
0;JMP
(return143)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@33  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return144
D=A
@CALL
0;JMP
(return144)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@34  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@20  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return145
D=A
@CALL
0;JMP
(return145)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return146
D=A
@CALL
0;JMP
(return146)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@36  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return147
D=A
@CALL
0;JMP
(return147)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@37  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@49  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return148
D=A
@CALL
0;JMP
(return148)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@38  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return149
D=A
@CALL
0;JMP
(return149)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return150
D=A
@CALL
0;JMP
(return150)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@40  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return151
D=A
@CALL
0;JMP
(return151)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@41  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return152
D=A
@CALL
0;JMP
(return152)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@42  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return153
D=A
@CALL
0;JMP
(return153)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return154
D=A
@CALL
0;JMP
(return154)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@44  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return155
D=A
@CALL
0;JMP
(return155)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@45  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return156
D=A
@CALL
0;JMP
(return156)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@46  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return157
D=A
@CALL
0;JMP
(return157)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@47  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return158
D=A
@CALL
0;JMP
(return158)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return159
D=A
@CALL
0;JMP
(return159)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@49  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return160
D=A
@CALL
0;JMP
(return160)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@50  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return161
D=A
@CALL
0;JMP
(return161)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return162
D=A
@CALL
0;JMP
(return162)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@52  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@26  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@25  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@60  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return163
D=A
@CALL
0;JMP
(return163)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@53  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return164
D=A
@CALL
0;JMP
(return164)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return165
D=A
@CALL
0;JMP
(return165)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@55  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@49  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return166
D=A
@CALL
0;JMP
(return166)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@56  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return167
D=A
@CALL
0;JMP
(return167)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@57  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@62  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return168
D=A
@CALL
0;JMP
(return168)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@58  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return169
D=A
@CALL
0;JMP
(return169)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return170
D=A
@CALL
0;JMP
(return170)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@60  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return171
D=A
@CALL
0;JMP
(return171)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@61  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return172
D=A
@CALL
0;JMP
(return172)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@62  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return173
D=A
@CALL
0;JMP
(return173)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@64  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return174
D=A
@CALL
0;JMP
(return174)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return175
D=A
@CALL
0;JMP
(return175)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@65  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return176
D=A
@CALL
0;JMP
(return176)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@66  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return177
D=A
@CALL
0;JMP
(return177)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@67  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return178
D=A
@CALL
0;JMP
(return178)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@68  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return179
D=A
@CALL
0;JMP
(return179)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@69  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return180
D=A
@CALL
0;JMP
(return180)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@70  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return181
D=A
@CALL
0;JMP
(return181)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@71  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@44  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return182
D=A
@CALL
0;JMP
(return182)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@72  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return183
D=A
@CALL
0;JMP
(return183)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@73  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return184
D=A
@CALL
0;JMP
(return184)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@74  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@60  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return185
D=A
@CALL
0;JMP
(return185)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@75  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return186
D=A
@CALL
0;JMP
(return186)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@76  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return187
D=A
@CALL
0;JMP
(return187)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@77  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@33  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return188
D=A
@CALL
0;JMP
(return188)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@78  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@55  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@55  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return189
D=A
@CALL
0;JMP
(return189)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@79  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return190
D=A
@CALL
0;JMP
(return190)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@80  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return191
D=A
@CALL
0;JMP
(return191)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@81  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@59  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return192
D=A
@CALL
0;JMP
(return192)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@82  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return193
D=A
@CALL
0;JMP
(return193)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@83  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return194
D=A
@CALL
0;JMP
(return194)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@84  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@45  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return195
D=A
@CALL
0;JMP
(return195)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@85  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return196
D=A
@CALL
0;JMP
(return196)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@86  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return197
D=A
@CALL
0;JMP
(return197)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@87  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return198
D=A
@CALL
0;JMP
(return198)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@88  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return199
D=A
@CALL
0;JMP
(return199)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@89  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return200
D=A
@CALL
0;JMP
(return200)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@90  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@49  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@35  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return201
D=A
@CALL
0;JMP
(return201)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@91  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return202
D=A
@CALL
0;JMP
(return202)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@92  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return203
D=A
@CALL
0;JMP
(return203)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@93  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return204
D=A
@CALL
0;JMP
(return204)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@94  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return205
D=A
@CALL
0;JMP
(return205)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@95  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return206
D=A
@CALL
0;JMP
(return206)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@96  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return207
D=A
@CALL
0;JMP
(return207)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return208
D=A
@CALL
0;JMP
(return208)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@98  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return209
D=A
@CALL
0;JMP
(return209)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@99  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return210
D=A
@CALL
0;JMP
(return210)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@60  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return211
D=A
@CALL
0;JMP
(return211)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return212
D=A
@CALL
0;JMP
(return212)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@102  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@38  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return213
D=A
@CALL
0;JMP
(return213)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@103  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@62  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return214
D=A
@CALL
0;JMP
(return214)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@104  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@55  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return215
D=A
@CALL
0;JMP
(return215)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@105  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return216
D=A
@CALL
0;JMP
(return216)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@106  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@56  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return217
D=A
@CALL
0;JMP
(return217)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@107  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return218
D=A
@CALL
0;JMP
(return218)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@108  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return219
D=A
@CALL
0;JMP
(return219)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@109  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@29  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@43  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return220
D=A
@CALL
0;JMP
(return220)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@110  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@29  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return221
D=A
@CALL
0;JMP
(return221)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@111  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return222
D=A
@CALL
0;JMP
(return222)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@112  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@31  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return223
D=A
@CALL
0;JMP
(return223)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@113  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@62  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return224
D=A
@CALL
0;JMP
(return224)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@29  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@55  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return225
D=A
@CALL
0;JMP
(return225)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return226
D=A
@CALL
0;JMP
(return226)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@4  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return227
D=A
@CALL
0;JMP
(return227)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@117  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@54  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return228
D=A
@CALL
0;JMP
(return228)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@118  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return229
D=A
@CALL
0;JMP
(return229)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@119  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return230
D=A
@CALL
0;JMP
(return230)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@120  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return231
D=A
@CALL
0;JMP
(return231)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@121  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@62  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@24  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return232
D=A
@CALL
0;JMP
(return232)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@122  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@27  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@63  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return233
D=A
@CALL
0;JMP
(return233)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@123  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@56  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@56  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return234
D=A
@CALL
0;JMP
(return234)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@124  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return235
D=A
@CALL
0;JMP
(return235)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@125  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@56  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return236
D=A
@CALL
0;JMP
(return236)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@126  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@38  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@45  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@25  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@12
D=A
@R14
M=D
@Output.create
D=A
@R13
M=D
@return237
D=A
@CALL
0;JMP
(return237)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.create)
@1
D=A
(Output.create_LOOP)
@Output.create_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.create_LOOP
0;JMP
(Output.create_END)

@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.new
D=A
@R13
M=D
@return238
D=A
@CALL
0;JMP
(return238)
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Output.3   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@4  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@5  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@9  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@10  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@11
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.drawChar)
@3
D=A
(Output.drawChar_LOOP)
@Output.drawChar_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.drawChar_LOOP
0;JMP
(Output.drawChar_END)

@Output.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return239
D=A
@CALL
0;JMP
(return239)
@Output.1   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return240
D=A
@CALL
0;JMP
(return240)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@4
D=A
@R14
M=D
@Screen.setAddrWindow
D=A
@R13
M=D
@return241
D=A
@CALL
0;JMP
(return241)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Output.3   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Output.drawChar$while4)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@11  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt21
D;JLT
@SP
A=M-1
M=0
(lt21)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Output.drawChar$whileend4
D;JNE
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Output.drawChar$while6)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@8  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt22
D;JLT
@SP
A=M-1
M=0
(lt22)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Output.drawChar$whileend6
D;JNE
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Output.4   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //and
AM=M-1
D=M
A=A-1
M=D&M
@SP
AM=M-1
D=M
@Output.drawChar$if7
D;JNE
@Output.drawChar$ifelse7
0;JMP
(Output.drawChar$if7)
@Output.5   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return242
D=A
@CALL
0;JMP
(return242)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Output.drawChar$ifend7
0;JMP
(Output.drawChar$ifelse7)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@1
D=A
@R14
M=D
@Screen.writeData16
D=A
@R13
M=D
@return243
D=A
@CALL
0;JMP
(return243)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Output.drawChar$ifend7)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Output.drawChar$while6
0;JMP
(Output.drawChar$whileend6)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Output.drawChar$while4
0;JMP
(Output.drawChar$whileend4)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.moveCursor)
@0
D=A
(Output.moveCursor_LOOP)
@Output.moveCursor_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.moveCursor_LOOP
0;JMP
(Output.moveCursor_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt23
D;JLT
@SP
A=M-1
M=0
(lt23)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@28  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt24
D;JGT
@SP
A=M-1
M=0
(gt24)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt25
D;JLT
@SP
A=M-1
M=0
(lt25)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@29  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt26
D;JGT
@SP
A=M-1
M=0
(gt26)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@SP
AM=M-1
D=M
@Output.moveCursor$if1
D;JNE
@Output.moveCursor$ifelse1
0;JMP
(Output.moveCursor$if1)
@20  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return244
D=A
@CALL
0;JMP
(return244)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Output.moveCursor$ifelse1)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Output.0
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Output.1
M=D
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.drawChar
D=A
@R13
M=D
@return245
D=A
@CALL
0;JMP
(return245)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.printChar)
@0
D=A
(Output.printChar_LOOP)
@Output.printChar_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.printChar_LOOP
0;JMP
(Output.printChar_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@13  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq27
D;JEQ
@SP
A=M-1
M=0
(eq27)
@SP
AM=M-1
D=M
@Output.printChar$if1
D;JNE
@Output.printChar$ifelse1
0;JMP
(Output.printChar$if1)
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return246
D=A
@CALL
0;JMP
(return246)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Output.printChar$ifend1
0;JMP
(Output.printChar$ifelse1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@127  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq28
D;JEQ
@SP
A=M-1
M=0
(eq28)
@SP
AM=M-1
D=M
@Output.printChar$if6
D;JNE
@Output.printChar$ifelse6
0;JMP
(Output.printChar$if6)
@0
D=A
@R14
M=D
@Output.backSpace
D=A
@R13
M=D
@return247
D=A
@CALL
0;JMP
(return247)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Output.printChar$ifend6
0;JMP
(Output.printChar$ifelse6)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.drawChar
D=A
@R13
M=D
@return248
D=A
@CALL
0;JMP
(return248)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Output.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop static
AM=M-1
D=M
@Output.0
M=D
@Output.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@30  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq29
D;JEQ
@SP
A=M-1
M=0
(eq29)
@SP
AM=M-1
D=M
@Output.printChar$if13
D;JNE
@Output.printChar$ifelse13
0;JMP
(Output.printChar$if13)
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return249
D=A
@CALL
0;JMP
(return249)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Output.printChar$ifelse13)
(Output.printChar$ifend6)
(Output.printChar$ifend1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.printString)
@2
D=A
(Output.printString_LOOP)
@Output.printString_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.printString_LOOP
0;JMP
(Output.printString_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.length
D=A
@R13
M=D
@return250
D=A
@CALL
0;JMP
(return250)
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Output.printString$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt30
D;JLT
@SP
A=M-1
M=0
(lt30)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Output.printString$whileend2
D;JNE
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.charAt
D=A
@R13
M=D
@return251
D=A
@CALL
0;JMP
(return251)
@1
D=A
@R14
M=D
@Output.printChar
D=A
@R13
M=D
@return252
D=A
@CALL
0;JMP
(return252)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Output.printString$while2
0;JMP
(Output.printString$whileend2)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.printInt)
@0
D=A
(Output.printInt_LOOP)
@Output.printInt_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.printInt_LOOP
0;JMP
(Output.printInt_END)

@Output.2   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.setInt
D=A
@R13
M=D
@return253
D=A
@CALL
0;JMP
(return253)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Output.2   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return254
D=A
@CALL
0;JMP
(return254)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.println)
@0
D=A
(Output.println_LOOP)
@Output.println_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.println_LOOP
0;JMP
(Output.println_END)

@Output.1   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop static
AM=M-1
D=M
@Output.1
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Output.0
M=D
@Output.1   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@29  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq31
D;JEQ
@SP
A=M-1
M=0
(eq31)
@SP
AM=M-1
D=M
@Output.println$if1
D;JNE
@Output.println$ifelse1
0;JMP
(Output.println$if1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Output.1
M=D
(Output.println$ifelse1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Output.backSpace)
@0
D=A
(Output.backSpace_LOOP)
@Output.backSpace_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Output.backSpace_LOOP
0;JMP
(Output.backSpace_END)

@Output.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt32
D;JGT
@SP
A=M-1
M=0
(gt32)
@SP
AM=M-1
D=M
@Output.backSpace$if1
D;JNE
@Output.backSpace$ifelse1
0;JMP
(Output.backSpace$if1)
@Output.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@SP  //pop static
AM=M-1
D=M
@Output.0
M=D
(Output.backSpace$ifelse1)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.drawChar
D=A
@R13
M=D
@return255
D=A
@CALL
0;JMP
(return255)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Memory.init)
@0
D=A
(Memory.init_LOOP)
@Memory.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Memory.init_LOOP
0;JMP
(Memory.init_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@Memory.0
M=D
@2048  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Memory.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@6142  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@2049  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@Memory.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@2050  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Memory.peek)
@0
D=A
(Memory.peek_LOOP)
@Memory.peek_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Memory.peek_LOOP
0;JMP
(Memory.peek_END)

@Memory.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Memory.poke)
@0
D=A
(Memory.poke_LOOP)
@Memory.poke_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Memory.poke_LOOP
0;JMP
(Memory.poke_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Memory.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Memory.alloc)
@1
D=A
(Memory.alloc_LOOP)
@Memory.alloc_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Memory.alloc_LOOP
0;JMP
(Memory.alloc_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt33
D;JLT
@SP
A=M-1
M=0
(lt33)
@SP
AM=M-1
D=M
@Memory.alloc$if1
D;JNE
@Memory.alloc$ifelse1
0;JMP
(Memory.alloc$if1)
@5  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return256
D=A
@CALL
0;JMP
(return256)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Memory.alloc$ifelse1)
@2048  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Memory.alloc$while7)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt34
D;JLT
@SP
A=M-1
M=0
(lt34)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Memory.alloc$whileend7
D;JNE
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Memory.alloc$while7
0;JMP
(Memory.alloc$whileend7)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@8187  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt35
D;JGT
@SP
A=M-1
M=0
(gt35)
@SP
AM=M-1
D=M
@Memory.alloc$if10
D;JNE
@Memory.alloc$ifelse10
0;JMP
(Memory.alloc$if10)
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return257
D=A
@CALL
0;JMP
(return257)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Memory.alloc$ifelse10)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt36
D;JGT
@SP
A=M-1
M=0
(gt36)
@SP
AM=M-1
D=M
@Memory.alloc$if15
D;JNE
@Memory.alloc$ifelse15
0;JMP
(Memory.alloc$if15)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq37
D;JEQ
@SP
A=M-1
M=0
(eq37)
@SP
AM=M-1
D=M
@Memory.alloc$if16
D;JNE
@Memory.alloc$ifelse16
0;JMP
(Memory.alloc$if16)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@4  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Memory.alloc$ifend16
0;JMP
(Memory.alloc$ifelse16)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Memory.alloc$ifend16)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Memory.alloc$ifelse15)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@RETURN
0;JMP

(Memory.deAlloc)
@2
D=A
(Memory.deAlloc_LOOP)
@Memory.deAlloc_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Memory.deAlloc_LOOP
0;JMP
(Memory.deAlloc_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq38
D;JEQ
@SP
A=M-1
M=0
(eq38)
@SP
AM=M-1
D=M
@Memory.deAlloc$if1
D;JNE
@Memory.deAlloc$ifelse1
0;JMP
(Memory.deAlloc$if1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Memory.deAlloc$ifend1
0;JMP
(Memory.deAlloc$ifelse1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq39
D;JEQ
@SP
A=M-1
M=0
(eq39)
@SP
AM=M-1
D=M
@Memory.deAlloc$if4
D;JNE
@Memory.deAlloc$ifelse4
0;JMP
(Memory.deAlloc$if4)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Memory.deAlloc$ifend4
0;JMP
(Memory.deAlloc$ifelse4)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Memory.deAlloc$ifend4)
(Memory.deAlloc$ifend1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Sys.init)
@0
D=A
(Sys.init_LOOP)
@Sys.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Sys.init_LOOP
0;JMP
(Sys.init_END)

@0
D=A
@R14
M=D
@GPIO.init
D=A
@R13
M=D
@return258
D=A
@CALL
0;JMP
(return258)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@UART.init
D=A
@R13
M=D
@return259
D=A
@CALL
0;JMP
(return259)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Memory.init
D=A
@R13
M=D
@return260
D=A
@CALL
0;JMP
(return260)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Array.init
D=A
@R13
M=D
@return261
D=A
@CALL
0;JMP
(return261)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Math.init
D=A
@R13
M=D
@return262
D=A
@CALL
0;JMP
(return262)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Screen.init
D=A
@R13
M=D
@return263
D=A
@CALL
0;JMP
(return263)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Output.init
D=A
@R13
M=D
@return264
D=A
@CALL
0;JMP
(return264)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Keyboard.init
D=A
@R13
M=D
@return265
D=A
@CALL
0;JMP
(return265)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Main.main
D=A
@R13
M=D
@return266
D=A
@CALL
0;JMP
(return266)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Sys.halt
D=A
@R13
M=D
@return267
D=A
@CALL
0;JMP
(return267)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Sys.halt)
@0
D=A
(Sys.halt_LOOP)
@Sys.halt_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Sys.halt_LOOP
0;JMP
(Sys.halt_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@GPIO.setLed
D=A
@R13
M=D
@return268
D=A
@CALL
0;JMP
(return268)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@2
D=A
@R14
M=D
@GPIO.setLed
D=A
@R13
M=D
@return269
D=A
@CALL
0;JMP
(return269)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Sys.halt$while6)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Sys.halt$whileend6
D;JNE
@Sys.halt$while6
0;JMP
(Sys.halt$whileend6)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Sys.wait)
@1
D=A
(Sys.wait_LOOP)
@Sys.wait_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Sys.wait_LOOP
0;JMP
(Sys.wait_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt40
D;JLT
@SP
A=M-1
M=0
(lt40)
@SP
AM=M-1
D=M
@Sys.wait$if1
D;JNE
@Sys.wait$ifelse1
0;JMP
(Sys.wait$if1)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return270
D=A
@CALL
0;JMP
(return270)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Sys.wait$ifelse1)
(Sys.wait$while7)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt41
D;JGT
@SP
A=M-1
M=0
(gt41)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Sys.wait$whileend7
D;JNE
@500  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Sys.wait$while9)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt42
D;JGT
@SP
A=M-1
M=0
(gt42)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Sys.wait$whileend9
D;JNE
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Sys.wait$while9
0;JMP
(Sys.wait$whileend9)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@ARG //pop argument
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Sys.wait$while7
0;JMP
(Sys.wait$whileend7)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Sys.error)
@0
D=A
(Sys.error_LOOP)
@Sys.error_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Sys.error_LOOP
0;JMP
(Sys.error_END)

@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return271
D=A
@CALL
0;JMP
(return271)
@69  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return272
D=A
@CALL
0;JMP
(return272)
@82  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return273
D=A
@CALL
0;JMP
(return273)
@82  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return274
D=A
@CALL
0;JMP
(return274)
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return275
D=A
@CALL
0;JMP
(return275)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.printInt
D=A
@R13
M=D
@return276
D=A
@CALL
0;JMP
(return276)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Sys.halt
D=A
@R13
M=D
@return277
D=A
@CALL
0;JMP
(return277)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Array.init)
@0
D=A
(Array.init_LOOP)
@Array.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Array.init_LOOP
0;JMP
(Array.init_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Array.new)
@0
D=A
(Array.new_LOOP)
@Array.new_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Array.new_LOOP
0;JMP
(Array.new_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt43
D;JGT
@SP
A=M-1
M=0
(gt43)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Array.new$if1
D;JNE
@Array.new$ifelse1
0;JMP
(Array.new$if1)
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return278
D=A
@CALL
0;JMP
(return278)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Array.new$ifelse1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Memory.alloc
D=A
@R13
M=D
@return279
D=A
@CALL
0;JMP
(return279)
@RETURN
0;JMP

(Array.dispose)
@0
D=A
(Array.dispose_LOOP)
@Array.dispose_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Array.dispose_LOOP
0;JMP
(Array.dispose_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@R3 //push pointer
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Memory.deAlloc
D=A
@R13
M=D
@return280
D=A
@CALL
0;JMP
(return280)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.init)
@0
D=A
(String.init_LOOP)
@String.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.init_LOOP
0;JMP
(String.init_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.new)
@0
D=A
(String.new_LOOP)
@String.new_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.new_LOOP
0;JMP
(String.new_END)

@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Memory.alloc
D=A
@R13
M=D
@return281
D=A
@CALL
0;JMP
(return281)
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt44
D;JLT
@SP
A=M-1
M=0
(lt44)
@SP
AM=M-1
D=M
@String.new$if1
D;JNE
@String.new$ifelse1
0;JMP
(String.new$if1)
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return282
D=A
@CALL
0;JMP
(return282)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.new$ifelse1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt45
D;JGT
@SP
A=M-1
M=0
(gt45)
@SP
AM=M-1
D=M
@String.new$if6
D;JNE
@String.new$ifelse6
0;JMP
(String.new$if6)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.new
D=A
@R13
M=D
@return283
D=A
@CALL
0;JMP
(return283)
@THIS    //pop this
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.new$ifelse6)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //pop this
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS    //pop this
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@R3 //push pointer
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.dispose)
@0
D=A
(String.dispose_LOOP)
@String.dispose_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.dispose_LOOP
0;JMP
(String.dispose_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@THIS    //push this
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt46
D;JGT
@SP
A=M-1
M=0
(gt46)
@SP
AM=M-1
D=M
@String.dispose$if1
D;JNE
@String.dispose$ifelse1
0;JMP
(String.dispose$if1)
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.dispose
D=A
@R13
M=D
@return284
D=A
@CALL
0;JMP
(return284)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.dispose$ifelse1)
@R3 //push pointer
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Memory.deAlloc
D=A
@R13
M=D
@return285
D=A
@CALL
0;JMP
(return285)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.length)
@0
D=A
(String.length_LOOP)
@String.length_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.length_LOOP
0;JMP
(String.length_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.charAt)
@0
D=A
(String.charAt_LOOP)
@String.charAt_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.charAt_LOOP
0;JMP
(String.charAt_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt47
D;JLT
@SP
A=M-1
M=0
(lt47)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt48
D;JGT
@SP
A=M-1
M=0
(gt48)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq49
D;JEQ
@SP
A=M-1
M=0
(eq49)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@SP
AM=M-1
D=M
@String.charAt$if1
D;JNE
@String.charAt$ifelse1
0;JMP
(String.charAt$if1)
@15  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return286
D=A
@CALL
0;JMP
(return286)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.charAt$ifelse1)
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.setCharAt)
@0
D=A
(String.setCharAt_LOOP)
@String.setCharAt_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.setCharAt_LOOP
0;JMP
(String.setCharAt_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt50
D;JLT
@SP
A=M-1
M=0
(lt50)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt51
D;JGT
@SP
A=M-1
M=0
(gt51)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq52
D;JEQ
@SP
A=M-1
M=0
(eq52)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@SP
AM=M-1
D=M
@String.setCharAt$if1
D;JNE
@String.setCharAt$ifelse1
0;JMP
(String.setCharAt$if1)
@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return287
D=A
@CALL
0;JMP
(return287)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.setCharAt$ifelse1)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.appendChar)
@0
D=A
(String.appendChar_LOOP)
@String.appendChar_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.appendChar_LOOP
0;JMP
(String.appendChar_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq53
D;JEQ
@SP
A=M-1
M=0
(eq53)
@SP
AM=M-1
D=M
@String.appendChar$if1
D;JNE
@String.appendChar$ifelse1
0;JMP
(String.appendChar$if1)
@17  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return288
D=A
@CALL
0;JMP
(return288)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.appendChar$ifelse1)
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@THIS    //pop this
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@R3 //push pointer
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.eraseLastChar)
@0
D=A
(String.eraseLastChar_LOOP)
@String.eraseLastChar_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.eraseLastChar_LOOP
0;JMP
(String.eraseLastChar_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq54
D;JEQ
@SP
A=M-1
M=0
(eq54)
@SP
AM=M-1
D=M
@String.eraseLastChar$if1
D;JNE
@String.eraseLastChar$ifelse1
0;JMP
(String.eraseLastChar$if1)
@18  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return289
D=A
@CALL
0;JMP
(return289)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.eraseLastChar$ifelse1)
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@THIS    //pop this
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.intValue)
@5
D=A
(String.intValue_LOOP)
@String.intValue_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.intValue_LOOP
0;JMP
(String.intValue_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq55
D;JEQ
@SP
A=M-1
M=0
(eq55)
@SP
AM=M-1
D=M
@String.intValue$if1
D;JNE
@String.intValue$ifelse1
0;JMP
(String.intValue$if1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.intValue$ifelse1)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@45  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq56
D;JEQ
@SP
A=M-1
M=0
(eq56)
@SP
AM=M-1
D=M
@String.intValue$if4
D;JNE
@String.intValue$ifelse4
0;JMP
(String.intValue$if4)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.intValue$ifelse4)
(String.intValue$while8)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt57
D;JLT
@SP
A=M-1
M=0
(lt57)
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //and
AM=M-1
D=M
A=A-1
M=D&M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@String.intValue$whileend8
D;JNE
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt58
D;JLT
@SP
A=M-1
M=0
(lt58)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@9  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt59
D;JGT
@SP
A=M-1
M=0
(gt59)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@SP  //not
A=M-1
M=!M
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
@String.intValue$if9
D;JNE
@String.intValue$ifelse9
0;JMP
(String.intValue$if9)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@10  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return290
D=A
@CALL
0;JMP
(return290)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.intValue$ifelse9)
@String.intValue$while8
0;JMP
(String.intValue$whileend8)
@LCL //push local
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
@String.intValue$if14
D;JNE
@String.intValue$ifelse14
0;JMP
(String.intValue$if14)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.intValue$ifelse14)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.setInt)
@4
D=A
(String.setInt_LOOP)
@String.setInt_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.setInt_LOOP
0;JMP
(String.setInt_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop pointer
AM=M-1
D=M
@THIS
M=D
@THIS    //push this
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq60
D;JEQ
@SP
A=M-1
M=0
(eq60)
@SP
AM=M-1
D=M
@String.setInt$if1
D;JNE
@String.setInt$ifelse1
0;JMP
(String.setInt$if1)
@19  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return291
D=A
@CALL
0;JMP
(return291)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.setInt$ifelse1)
@6  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.new
D=A
@R13
M=D
@return292
D=A
@CALL
0;JMP
(return292)
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt61
D;JLT
@SP
A=M-1
M=0
(lt61)
@SP
AM=M-1
D=M
@String.setInt$if6
D;JNE
@String.setInt$ifelse6
0;JMP
(String.setInt$if6)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@ARG //pop argument
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.setInt$ifelse6)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.setInt$while10)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt62
D;JGT
@SP
A=M-1
M=0
(gt62)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@String.setInt$whileend10
D;JNE
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@10  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.divide
D=A
@R13
M=D
@return293
D=A
@CALL
0;JMP
(return293)
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@10  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return294
D=A
@CALL
0;JMP
(return294)
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //pop argument
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@String.setInt$while10
0;JMP
(String.setInt$whileend10)
@LCL //push local
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
@String.setInt$if13
D;JNE
@String.setInt$ifelse13
0;JMP
(String.setInt$if13)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@45  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.setInt$ifelse13)
@THIS    //push this
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt63
D;JLT
@SP
A=M-1
M=0
(lt63)
@SP
AM=M-1
D=M
@String.setInt$if16
D;JNE
@String.setInt$ifelse16
0;JMP
(String.setInt$if16)
@19  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Sys.error
D=A
@R13
M=D
@return295
D=A
@CALL
0;JMP
(return295)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(String.setInt$ifelse16)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq64
D;JEQ
@SP
A=M-1
M=0
(eq64)
@SP
AM=M-1
D=M
@String.setInt$if21
D;JNE
@String.setInt$ifelse21
0;JMP
(String.setInt$if21)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@48  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS    //pop this
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@String.setInt$ifend21
0;JMP
(String.setInt$ifelse21)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS    //pop this
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(String.setInt$while25)
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt65
D;JLT
@SP
A=M-1
M=0
(lt65)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@String.setInt$whileend25
D;JNE
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@THIS    //push this
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@THIS    //pop this
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@String.setInt$while25
0;JMP
(String.setInt$whileend25)
(String.setInt$ifend21)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.dispose
D=A
@R13
M=D
@return296
D=A
@CALL
0;JMP
(return296)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.newLine)
@0
D=A
(String.newLine_LOOP)
@String.newLine_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.newLine_LOOP
0;JMP
(String.newLine_END)

@128  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.backSpace)
@0
D=A
(String.backSpace_LOOP)
@String.backSpace_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.backSpace_LOOP
0;JMP
(String.backSpace_END)

@129  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(String.doubleQuote)
@0
D=A
(String.doubleQuote_LOOP)
@String.doubleQuote_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@String.doubleQuote_LOOP
0;JMP
(String.doubleQuote_END)

@34  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Main.main)
@4
D=A
(Main.main_LOOP)
@Main.main_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Main.main_LOOP
0;JMP
(Main.main_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@20  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return297
D=A
@CALL
0;JMP
(return297)
@75  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return298
D=A
@CALL
0;JMP
(return298)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return299
D=A
@CALL
0;JMP
(return299)
@121  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return300
D=A
@CALL
0;JMP
(return300)
@98  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return301
D=A
@CALL
0;JMP
(return301)
@111  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return302
D=A
@CALL
0;JMP
(return302)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return303
D=A
@CALL
0;JMP
(return303)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return304
D=A
@CALL
0;JMP
(return304)
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return305
D=A
@CALL
0;JMP
(return305)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return306
D=A
@CALL
0;JMP
(return306)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return307
D=A
@CALL
0;JMP
(return307)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return308
D=A
@CALL
0;JMP
(return308)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return309
D=A
@CALL
0;JMP
(return309)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return310
D=A
@CALL
0;JMP
(return310)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return311
D=A
@CALL
0;JMP
(return311)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return312
D=A
@CALL
0;JMP
(return312)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return313
D=A
@CALL
0;JMP
(return313)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return314
D=A
@CALL
0;JMP
(return314)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return315
D=A
@CALL
0;JMP
(return315)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return316
D=A
@CALL
0;JMP
(return316)
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return317
D=A
@CALL
0;JMP
(return317)
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return318
D=A
@CALL
0;JMP
(return318)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return319
D=A
@CALL
0;JMP
(return319)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return320
D=A
@CALL
0;JMP
(return320)
@80  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return321
D=A
@CALL
0;JMP
(return321)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return322
D=A
@CALL
0;JMP
(return322)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return323
D=A
@CALL
0;JMP
(return323)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return324
D=A
@CALL
0;JMP
(return324)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return325
D=A
@CALL
0;JMP
(return325)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return326
D=A
@CALL
0;JMP
(return326)
@75  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return327
D=A
@CALL
0;JMP
(return327)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return328
D=A
@CALL
0;JMP
(return328)
@121  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return329
D=A
@CALL
0;JMP
(return329)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return330
D=A
@CALL
0;JMP
(return330)
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return331
D=A
@CALL
0;JMP
(return331)
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return332
D=A
@CALL
0;JMP
(return332)
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return333
D=A
@CALL
0;JMP
(return333)
@58  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return334
D=A
@CALL
0;JMP
(return334)
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return335
D=A
@CALL
0;JMP
(return335)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Main.main$while8)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@51  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq66
D;JEQ
@SP
A=M-1
M=0
(eq66)
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Main.main$whileend8
D;JNE
@0
D=A
@R14
M=D
@Keyboard.readChar
D=A
@R13
M=D
@return336
D=A
@CALL
0;JMP
(return336)
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return337
D=A
@CALL
0;JMP
(return337)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return338
D=A
@CALL
0;JMP
(return338)
@80  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return339
D=A
@CALL
0;JMP
(return339)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return340
D=A
@CALL
0;JMP
(return340)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return341
D=A
@CALL
0;JMP
(return341)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return342
D=A
@CALL
0;JMP
(return342)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return343
D=A
@CALL
0;JMP
(return343)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return344
D=A
@CALL
0;JMP
(return344)
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return345
D=A
@CALL
0;JMP
(return345)
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return346
D=A
@CALL
0;JMP
(return346)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Output.printInt
D=A
@R13
M=D
@return347
D=A
@CALL
0;JMP
(return347)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return348
D=A
@CALL
0;JMP
(return348)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@Main.main$while8
0;JMP
(Main.main$whileend8)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@14  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return349
D=A
@CALL
0;JMP
(return349)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return350
D=A
@CALL
0;JMP
(return350)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return351
D=A
@CALL
0;JMP
(return351)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return352
D=A
@CALL
0;JMP
(return352)
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return353
D=A
@CALL
0;JMP
(return353)
@76  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return354
D=A
@CALL
0;JMP
(return354)
@105  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return355
D=A
@CALL
0;JMP
(return355)
@110  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return356
D=A
@CALL
0;JMP
(return356)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return357
D=A
@CALL
0;JMP
(return357)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return358
D=A
@CALL
0;JMP
(return358)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return359
D=A
@CALL
0;JMP
(return359)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return360
D=A
@CALL
0;JMP
(return360)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return361
D=A
@CALL
0;JMP
(return361)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return362
D=A
@CALL
0;JMP
(return362)
@58  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return363
D=A
@CALL
0;JMP
(return363)
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return364
D=A
@CALL
0;JMP
(return364)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return365
D=A
@CALL
0;JMP
(return365)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@38  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return366
D=A
@CALL
0;JMP
(return366)
@40  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return367
D=A
@CALL
0;JMP
(return367)
@86  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return368
D=A
@CALL
0;JMP
(return368)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return369
D=A
@CALL
0;JMP
(return369)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return370
D=A
@CALL
0;JMP
(return370)
@105  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return371
D=A
@CALL
0;JMP
(return371)
@102  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return372
D=A
@CALL
0;JMP
(return372)
@121  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return373
D=A
@CALL
0;JMP
(return373)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return374
D=A
@CALL
0;JMP
(return374)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return375
D=A
@CALL
0;JMP
(return375)
@99  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return376
D=A
@CALL
0;JMP
(return376)
@104  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return377
D=A
@CALL
0;JMP
(return377)
@111  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return378
D=A
@CALL
0;JMP
(return378)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return379
D=A
@CALL
0;JMP
(return379)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return380
D=A
@CALL
0;JMP
(return380)
@110  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return381
D=A
@CALL
0;JMP
(return381)
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return382
D=A
@CALL
0;JMP
(return382)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return383
D=A
@CALL
0;JMP
(return383)
@117  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return384
D=A
@CALL
0;JMP
(return384)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return385
D=A
@CALL
0;JMP
(return385)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return386
D=A
@CALL
0;JMP
(return386)
@103  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return387
D=A
@CALL
0;JMP
(return387)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return388
D=A
@CALL
0;JMP
(return388)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return389
D=A
@CALL
0;JMP
(return389)
@111  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return390
D=A
@CALL
0;JMP
(return390)
@102  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return391
D=A
@CALL
0;JMP
(return391)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return392
D=A
@CALL
0;JMP
(return392)
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return393
D=A
@CALL
0;JMP
(return393)
@98  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return394
D=A
@CALL
0;JMP
(return394)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return395
D=A
@CALL
0;JMP
(return395)
@99  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return396
D=A
@CALL
0;JMP
(return396)
@107  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return397
D=A
@CALL
0;JMP
(return397)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return398
D=A
@CALL
0;JMP
(return398)
@112  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return399
D=A
@CALL
0;JMP
(return399)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return400
D=A
@CALL
0;JMP
(return400)
@99  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return401
D=A
@CALL
0;JMP
(return401)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return402
D=A
@CALL
0;JMP
(return402)
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return403
D=A
@CALL
0;JMP
(return403)
@41  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return404
D=A
@CALL
0;JMP
(return404)
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return405
D=A
@CALL
0;JMP
(return405)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return406
D=A
@CALL
0;JMP
(return406)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
(Main.main$while28)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Main.main$whileend28
D;JNE
@36  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return407
D=A
@CALL
0;JMP
(return407)
@80  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return408
D=A
@CALL
0;JMP
(return408)
@108  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return409
D=A
@CALL
0;JMP
(return409)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return410
D=A
@CALL
0;JMP
(return410)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return411
D=A
@CALL
0;JMP
(return411)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return412
D=A
@CALL
0;JMP
(return412)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return413
D=A
@CALL
0;JMP
(return413)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return414
D=A
@CALL
0;JMP
(return414)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return415
D=A
@CALL
0;JMP
(return415)
@121  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return416
D=A
@CALL
0;JMP
(return416)
@112  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return417
D=A
@CALL
0;JMP
(return417)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return418
D=A
@CALL
0;JMP
(return418)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return419
D=A
@CALL
0;JMP
(return419)
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return420
D=A
@CALL
0;JMP
(return420)
@74  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return421
D=A
@CALL
0;JMP
(return421)
@65  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return422
D=A
@CALL
0;JMP
(return422)
@67  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return423
D=A
@CALL
0;JMP
(return423)
@75  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return424
D=A
@CALL
0;JMP
(return424)
@39  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return425
D=A
@CALL
0;JMP
(return425)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return426
D=A
@CALL
0;JMP
(return426)
@97  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return427
D=A
@CALL
0;JMP
(return427)
@110  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return428
D=A
@CALL
0;JMP
(return428)
@100  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return429
D=A
@CALL
0;JMP
(return429)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return430
D=A
@CALL
0;JMP
(return430)
@112  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return431
D=A
@CALL
0;JMP
(return431)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return432
D=A
@CALL
0;JMP
(return432)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return433
D=A
@CALL
0;JMP
(return433)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return434
D=A
@CALL
0;JMP
(return434)
@115  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return435
D=A
@CALL
0;JMP
(return435)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return436
D=A
@CALL
0;JMP
(return436)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return437
D=A
@CALL
0;JMP
(return437)
@110  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return438
D=A
@CALL
0;JMP
(return438)
@116  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return439
D=A
@CALL
0;JMP
(return439)
@101  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return440
D=A
@CALL
0;JMP
(return440)
@114  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return441
D=A
@CALL
0;JMP
(return441)
@58  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return442
D=A
@CALL
0;JMP
(return442)
@32  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return443
D=A
@CALL
0;JMP
(return443)
@1
D=A
@R14
M=D
@Keyboard.readLine
D=A
@R13
M=D
@return444
D=A
@CALL
0;JMP
(return444)
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.length
D=A
@R13
M=D
@return445
D=A
@CALL
0;JMP
(return445)
@4  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq67
D;JEQ
@SP
A=M-1
M=0
(eq67)
@SP
AM=M-1
D=M
@Main.main$if29
D;JNE
@Main.main$ifelse29
0;JMP
(Main.main$if29)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.charAt
D=A
@R13
M=D
@return446
D=A
@CALL
0;JMP
(return446)
@74  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq68
D;JEQ
@SP
A=M-1
M=0
(eq68)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.charAt
D=A
@R13
M=D
@return447
D=A
@CALL
0;JMP
(return447)
@65  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq69
D;JEQ
@SP
A=M-1
M=0
(eq69)
@SP  //and
AM=M-1
D=M
A=A-1
M=D&M
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.charAt
D=A
@R13
M=D
@return448
D=A
@CALL
0;JMP
(return448)
@67  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq70
D;JEQ
@SP
A=M-1
M=0
(eq70)
@SP  //and
AM=M-1
D=M
A=A-1
M=D&M
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@3  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.charAt
D=A
@R13
M=D
@return449
D=A
@CALL
0;JMP
(return449)
@75  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq71
D;JEQ
@SP
A=M-1
M=0
(eq71)
@SP  //and
AM=M-1
D=M
A=A-1
M=D&M
@SP
AM=M-1
D=M
@Main.main$if30
D;JNE
@Main.main$ifelse30
0;JMP
(Main.main$if30)
@2  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return450
D=A
@CALL
0;JMP
(return450)
@111  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return451
D=A
@CALL
0;JMP
(return451)
@107  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return452
D=A
@CALL
0;JMP
(return452)
@1
D=A
@R14
M=D
@Output.printString
D=A
@R13
M=D
@return453
D=A
@CALL
0;JMP
(return453)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@Output.println
D=A
@R13
M=D
@return454
D=A
@CALL
0;JMP
(return454)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Main.main$ifelse30)
(Main.main$ifelse29)
@Main.main$while28
0;JMP
(Main.main$whileend28)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(UART.init)
@0
D=A
(UART.init_LOOP)
@UART.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@UART.init_LOOP
0;JMP
(UART.init_END)

@8194  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@UART.0
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(UART.rx)
@1
D=A
(UART.rx_LOOP)
@UART.rx_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@UART.rx_LOOP
0;JMP
(UART.rx_END)

@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(UART.rx$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq72
D;JEQ
@SP
A=M-1
M=0
(eq72)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@UART.rx$whileend2
D;JNE
@UART.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@UART.rx$while2
0;JMP
(UART.rx$whileend2)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@UART.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(UART.tx)
@1
D=A
(UART.tx_LOOP)
@UART.tx_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@UART.tx_LOOP
0;JMP
(UART.tx_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(UART.tx$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@UART.tx$whileend2
D;JNE
@UART.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@UART.tx$while2
0;JMP
(UART.tx$whileend2)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@UART.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(UART.print)
@1
D=A
(UART.print_LOOP)
@UART.print_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@UART.print_LOOP
0;JMP
(UART.print_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(UART.print$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.length
D=A
@R13
M=D
@return455
D=A
@CALL
0;JMP
(return455)
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt73
D;JLT
@SP
A=M-1
M=0
(lt73)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@UART.print$whileend2
D;JNE
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.charAt
D=A
@R13
M=D
@return456
D=A
@CALL
0;JMP
(return456)
@1
D=A
@R14
M=D
@UART.tx
D=A
@R13
M=D
@return457
D=A
@CALL
0;JMP
(return457)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@UART.print$while2
0;JMP
(UART.print$whileend2)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(UART.println)
@0
D=A
(UART.println_LOOP)
@UART.println_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@UART.println_LOOP
0;JMP
(UART.println_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@UART.print
D=A
@R13
M=D
@return458
D=A
@CALL
0;JMP
(return458)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@13  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@UART.tx
D=A
@R13
M=D
@return459
D=A
@CALL
0;JMP
(return459)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@10  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@UART.tx
D=A
@R13
M=D
@return460
D=A
@CALL
0;JMP
(return460)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(UART.input)
@2
D=A
(UART.input_LOOP)
@UART.input_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@UART.input_LOOP
0;JMP
(UART.input_END)

@80  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@String.new
D=A
@R13
M=D
@return461
D=A
@CALL
0;JMP
(return461)
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0
D=A
@R14
M=D
@UART.rx
D=A
@R13
M=D
@return462
D=A
@CALL
0;JMP
(return462)
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(UART.input$while2)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@13  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq74
D;JEQ
@SP
A=M-1
M=0
(eq74)
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@UART.input$whileend2
D;JNE
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@String.appendChar
D=A
@R13
M=D
@return463
D=A
@CALL
0;JMP
(return463)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@UART.tx
D=A
@R13
M=D
@return464
D=A
@CALL
0;JMP
(return464)
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@0
D=A
@R14
M=D
@UART.rx
D=A
@R13
M=D
@return465
D=A
@CALL
0;JMP
(return465)
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@UART.input$while2
0;JMP
(UART.input$whileend2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(GPIO.init)
@0
D=A
(GPIO.init_LOOP)
@GPIO.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@GPIO.init_LOOP
0;JMP
(GPIO.init_END)

@8192  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop static
AM=M-1
D=M
@GPIO.0
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(GPIO.getBut)
@0
D=A
(GPIO.getBut_LOOP)
@GPIO.getBut_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@GPIO.getBut_LOOP
0;JMP
(GPIO.getBut_END)

@GPIO.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(GPIO.getLed)
@0
D=A
(GPIO.getLed_LOOP)
@GPIO.getLed_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@GPIO.getLed_LOOP
0;JMP
(GPIO.getLed_END)

@GPIO.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(GPIO.setLed)
@0
D=A
(GPIO.setLed_LOOP)
@GPIO.setLed_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@GPIO.setLed_LOOP
0;JMP
(GPIO.setLed_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@GPIO.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.init)
@2
D=A
(Math.init_LOOP)
@Math.init_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Math.init_LOOP
0;JMP
(Math.init_END)

@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Array.new
D=A
@R13
M=D
@return466
D=A
@CALL
0;JMP
(return466)
@SP  //pop static
AM=M-1
D=M
@Math.0
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Math.init$while2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt75
D;JLT
@SP
A=M-1
M=0
(lt75)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Math.init$whileend2
D;JNE
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //pop temp
AM=M-1
D=M
@R5
M=D
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@R5 //push temp
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT    //pop that
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Math.init$while2
0;JMP
(Math.init$whileend2)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.abs)
@0
D=A
(Math.abs_LOOP)
@Math.abs_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Math.abs_LOOP
0;JMP
(Math.abs_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt76
D;JLT
@SP
A=M-1
M=0
(lt76)
@SP
AM=M-1
D=M
@Math.abs$if1
D;JNE
@Math.abs$ifelse1
0;JMP
(Math.abs$if1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Math.abs$ifelse1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.multiply)
@2
D=A
(Math.multiply_LOOP)
@Math.multiply_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Math.multiply_LOOP
0;JMP
(Math.multiply_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Math.multiply$while2)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@16  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt77
D;JLT
@SP
A=M-1
M=0
(lt77)
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Math.multiply$whileend2
D;JNE
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //and
AM=M-1
D=M
A=A-1
M=D&M
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=D-M
M=-1
@eq78
D;JEQ
@SP
A=M-1
M=0
(eq78)
@SP
AM=M-1
D=M
@Math.multiply$if3
D;JNE
@Math.multiply$ifelse3
0;JMP
(Math.multiply$if3)
@Math.multiply$ifend3
0;JMP
(Math.multiply$ifelse3)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Math.multiply$ifend3)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //pop argument
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Math.multiply$while2
0;JMP
(Math.multiply$whileend2)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.divide)
@2
D=A
(Math.divide_LOOP)
@Math.divide_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Math.divide_LOOP
0;JMP
(Math.divide_END)

@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt79
D;JLT
@SP
A=M-1
M=0
(lt79)
@SP
AM=M-1
D=M
@Math.divide$if1
D;JNE
@Math.divide$ifelse1
0;JMP
(Math.divide$if1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Math.abs
D=A
@R13
M=D
@return467
D=A
@CALL
0;JMP
(return467)
@ARG //pop argument
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //not
A=M-1
M=!M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Math.divide$ifelse1)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt80
D;JLT
@SP
A=M-1
M=0
(lt80)
@SP
AM=M-1
D=M
@Math.divide$if4
D;JNE
@Math.divide$ifelse4
0;JMP
(Math.divide$if4)
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@R14
M=D
@Math.abs
D=A
@R13
M=D
@return468
D=A
@CALL
0;JMP
(return468)
@ARG //pop argument
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //not
A=M-1
M=!M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Math.divide$ifelse4)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt81
D;JLT
@SP
A=M-1
M=0
(lt81)
@SP
AM=M-1
D=M
@Math.divide$if7
D;JNE
@Math.divide$ifelse7
0;JMP
(Math.divide$if7)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.divide$ifelse7)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt82
D;JLT
@SP
A=M-1
M=0
(lt82)
@SP
AM=M-1
D=M
@Math.divide$if10
D;JNE
@Math.divide$ifelse10
0;JMP
(Math.divide$if10)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
@Math.divide$if11
D;JNE
@Math.divide$ifelse11
0;JMP
(Math.divide$if11)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Math.divide$ifelse11)
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.divide$ifelse10)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@2
D=A
@R14
M=D
@Math.divide
D=A
@R13
M=D
@return469
D=A
@CALL
0;JMP
(return469)
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return470
D=A
@CALL
0;JMP
(return470)
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@ARG //push argument
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@R14
M=D
@Math.divide
D=A
@R13
M=D
@return471
D=A
@CALL
0;JMP
(return471)
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
@Math.divide$if16
D;JNE
@Math.divide$ifelse16
0;JMP
(Math.divide$if16)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //neg
A=M-1
M=-M
@RETURN
0;JMP

(Math.divide$ifelse16)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.sqrt)
@3
D=A
(Math.sqrt_LOOP)
@Math.sqrt_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Math.sqrt_LOOP
0;JMP
(Math.sqrt_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt83
D;JLT
@SP
A=M-1
M=0
(lt83)
@SP
AM=M-1
D=M
@Math.sqrt$if1
D;JNE
@Math.sqrt$ifelse1
0;JMP
(Math.sqrt$if1)
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.sqrt$ifelse1)
@7  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Math.sqrt$while5)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt84
D;JLT
@SP
A=M-1
M=0
(lt84)
@SP  //not
A=M-1
M=!M
@SP  //not
A=M-1
M=!M
@SP
AM=M-1
D=M
@Math.sqrt$whileend5
D;JNE
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@2
D=A
@R14
M=D
@Math.multiply
D=A
@R13
M=D
@return472
D=A
@CALL
0;JMP
(return472)
@LCL //pop local
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@0  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt85
D;JLT
@SP
A=M-1
M=0
(lt85)
@LCL //push local
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt86
D;JGT
@SP
A=M-1
M=0
(gt86)
@SP  //or
AM=M-1
D=M
A=A-1
M=D|M
@SP
AM=M-1
D=M
@Math.sqrt$if6
D;JNE
@Math.sqrt$ifelse6
0;JMP
(Math.sqrt$if6)
@Math.sqrt$ifend6
0;JMP
(Math.sqrt$ifelse6)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@SP  //pop pointer
AM=M-1
D=M
@THAT
M=D
@THAT    //push that
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP  //add
AM=M-1
D=M
A=A-1
M=D+M
@LCL //pop local
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(Math.sqrt$ifend6)
@LCL //push local
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1  //push constant
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP  //sub
AM=M-1
D=M
A=A-1
M=M-D
@LCL //pop local
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@Math.sqrt$while5
0;JMP
(Math.sqrt$whileend5)
@LCL //push local
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.max)
@0
D=A
(Math.max_LOOP)
@Math.max_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Math.max_LOOP
0;JMP
(Math.max_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@gt87
D;JGT
@SP
A=M-1
M=0
(gt87)
@SP
AM=M-1
D=M
@Math.max$if1
D;JNE
@Math.max$ifelse1
0;JMP
(Math.max$if1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.max$ifelse1)
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.min)
@0
D=A
(Math.min_LOOP)
@Math.min_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@Math.min_LOOP
0;JMP
(Math.min_END)

@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@lt88
D;JLT
@SP
A=M-1
M=0
(lt88)
@SP
AM=M-1
D=M
@Math.min$if1
D;JNE
@Math.min$ifelse1
0;JMP
(Math.min$if1)
@ARG //push argument
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP

(Math.min$ifelse1)
@Math.0   //push static
D=M
@SP
A=M
M=D
@SP
M=M+1
@RETURN
0;JMP
