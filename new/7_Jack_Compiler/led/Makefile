all: jack vm asm prog

jack:
	../../7_Jack_Compiler/JackCompiler.py ./
vm:
	../../6_Virtual_Machine/VMTranslator.py ./
asm:
	../../5_Assembler/assembler.py out.asm
prog:
	cat out.hack > /dev/ttyACM0
clean:
	rm -f *.vm *.asm *.hack *~

.PHONY: all clean
