#----------------------------------------
#-- Name des Projekts
#----------------------------------------
NAME = hack

#-------------------------------------------------------
#-- Simulieren und Synthetisieren
#-------------------------------------------------------
all: sim sint

#----------------------------------------------
#-- make sim
#----------------------------------------------
#-- Simulation mit testbench starten
#----------------------------------------------
sim: $(NAME)_tb.vcd

#-----------------------------------------------
#-- make sint
#-----------------------------------------------
#-- FPGA bin-file erszeugen (yosyn)
#-----------------------------------------------
sint: $(NAME).bin

#-------------------------------
#-- Compilieren und simulieren
#-------------------------------
$(NAME)_tb.vcd: $(NAME).v $(DEPS) $(NAME)_tb.v

	#-- Compilar
	iverilog $^ -o $(NAME)_tb.out

	#-- Simular
	./$(NAME)_tb.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave $@ $(NAME)_tb.gtkw &

#------------------------------
#-- Synthetisierung vollständig
#------------------------------
$(NAME).bin: $(NAME).pcf $(NAME).v $(DEPS)

	#-- Sintesis
	yosys -p "synth_ice40 -json $(NAME).json" $(NAME).v

	#-- Place & route
	nextpnr-ice40 --hx8k --pcf $(NAME).pcf --json $(NAME).json --asc $(NAME).asc

	#-- Generar binario final, listo para descargar en fgpa
	icepack $(NAME).asc $(NAME).bin

#------------------------------
#-- Binary auf FPGA iCE40 hochladen
#------------------------------
prog: $(NAME).bin

	#-- Updload mit Olimexino 32u4
	iceprogduino $(NAME).bin


#-- Limpiar todo
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
