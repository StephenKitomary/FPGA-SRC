NAME = led

all: sim sint

sim: $(NAME)_tb.vcd

sint: $(NAME).bin

$(NAME)_tb.vcd: $(NAME).v $(DEPS) $(NAME)_tb.v
	iverilog $^ -o $(NAME)_tb.out
	./$(NAME)_tb.out
	gtkwave $@ $(NAME)_tb.gtkw &

$(NAME).bin: $(NAME).pcf $(NAME).v $(DEPS)
	yosys -p "synth_ice40 -json $(NAME).json" $(NAME).v
	nextpnr-ice40 --hx8k --package ct256 --pcf $(NAME).pcf --json $(NAME).json --asc $(NAME).asc
	icepack $(NAME).asc $(NAME).bin

prog: $(NAME).bin
	iceprogduino $(NAME).bin

clean:
	rm -f *.json *.asc *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
