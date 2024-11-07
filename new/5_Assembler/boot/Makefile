NAME = boot

all: asm prog

asm:
	../assembler.py $(NAME).asm
prog:
	cat $(NAME).hack > /dev/ttyACM0
clean:
	rm -f *.hack *~

.PHONY: all clean
