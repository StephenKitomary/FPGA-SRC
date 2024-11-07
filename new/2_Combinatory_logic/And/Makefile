NAME = And

DEPS = ../Nand/Nand.v ../Not/Not.v

all: sim sint

sim: $(NAME)_tb.vcd

sint: $(NAME).bin

$(NAME)_tb.vcd: $(NAME).v $(DEPS) $(NAME)_tb.v
	iverilog $^ -o $(NAME)_tb.out
	./$(NAME)_tb.out
	diff $(NAME).out $(NAME).cmp	
	gtkwave $@ $(NAME)_tb.gtkw &

$(NAME).bin: $(NAME).pcf $(NAME).v
	yosys -p "synth_ice40 -json $(NAME).json" $(NAME).v $(DEPS)
	nextpnr-ice40 --hx8k --pcf $(NAME).pcf --json $(NAME).json --asc $(NAME).asc
	icepack $(NAME).asc $(NAME).bin

prog: $(NAME).bin
	iceprogduino $(NAME).bin

clean:
	rm -f *.bin *.txt *.blif *.json *.asc *.out *.vcd *~

.PHONY: all clean

