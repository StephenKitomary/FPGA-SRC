(LOOP)		
@8194		//led1 on ready
M=1

@8198		//set SRAM Address to 0
M=0

@8195		//led2 off last newline false
M=0

(NEXT)
@8199		//clear data
M=0

(WAIT_RX)	//Wait for char
@8193
D=M
@WAIT_RX
D;JLT

@8193		//clear rx-buffer
M=-1

@20			//char==\n ?
D=D-A
@CHAR_NL
D;JLE

@8195		//led2 off last new line false
M=0

@28			//char==0 ?
D=D-A
@CHAR_0
D;JEQ

D=D-1		//char==1 ?
@CHAR_1
D;JEQ

@8194		//led1 off error
M=0
@8195		//led2 on
M=1

(HALT)
@HALT		//next char
0;JMP

(CHAR_0)	//char 0
@8199
D=M
@8199
M=D+M
@WAIT_RX
0;JMP

(CHAR_1)	//char 1
@8199
D=M
M=D+M
M=M+1
@WAIT_RX
0;JMP

(CHAR_NL)	//char \n
@8198
M=M+1
@8195		//last char \n?
D=M
@CHAR_EOT
D;JNE
@8195		//last char is \n
M=1
@NEXT
0;JMP

(CHAR_EOT)
@8194		//LED 0 run
M=0
@8195		//LED 0
M=0
@8200		//jump to SRAM
AMD=0
0;JMP

