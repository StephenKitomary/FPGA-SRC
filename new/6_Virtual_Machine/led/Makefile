all: vm asm prog

vm:
	../../6_Virtual_Machine/VMTranslator.py ./
asm:
	../../5_Assembler/assembler.py out.asm
prog:
	cat out.hack > /dev/ttyACM0
clean:
	rm -f *.asm *.hack *~

.PHONY: all clean
