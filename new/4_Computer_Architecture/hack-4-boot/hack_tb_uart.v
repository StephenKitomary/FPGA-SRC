module hack_tb();

//-- Contenido inicial de la memoria ram
//parameter ROMFILE = "assembler/echo/echo.hack";

//-- Baudios con los que realizar la simulacion
localparam BAUD = `B115200;

//-- Tics de reloj para envio de datos a esa velocidad
//-- Se multiplica por 2 porque el periodo del reloj es de 2 unidades
localparam BITRATE = (BAUD << 1);

//-- Tics necesarios para enviar una trama serie completa, mas un bit adicional
localparam FRAME = (BITRATE * 11);

//-- Tiempo entre dos bits enviados
localparam FRAME_WAIT = (BITRATE * 4);

//----------------------------------------
//-- Tarea para enviar caracteres serie  
//----------------------------------------
  task send_car;
    input [7:0] car;
  begin
    rx <= 0;                 //-- Bit start 
    #BITRATE rx <= car[0];   //-- Bit 0
    #BITRATE rx <= car[1];   //-- Bit 1
    #BITRATE rx <= car[2];   //-- Bit 2
    #BITRATE rx <= car[3];   //-- Bit 3
    #BITRATE rx <= car[4];   //-- Bit 4
    #BITRATE rx <= car[5];   //-- Bit 5
    #BITRATE rx <= car[6];   //-- Bit 6
    #BITRATE rx <= car[7];   //-- Bit 7
    #BITRATE rx <= 1;        //-- Bit stop
    #BITRATE rx <= 1;        //-- Esperar a que se envie bit de stop
  end
  endtask


//-- Registro para generar la señal de reloj
reg clk = 0;
wire tx;
reg rx;
reg rstn = 0;

//-- Datos de salida del componente
wire led;
wire debug;

//-- Instanciar el componente
hack
  dut(
    .clk(clk),
    .tx(tx),
    .rx(rx)
  );


//-- Generador de reloj. Periodo 2 unidades
always #1 clk = ~clk;


//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("hack_tb.vcd");
  $dumpvars(0, hack_tb);

   # 20  rstn <= 1;
   #(FRAME_WAIT * 20) send_car("1");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car("0");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 2) send_car(4);
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car("0");
   #(FRAME_WAIT * 2) send_car("0");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car(4);

   #(FRAME_WAIT * 40) $display("FIN de la simulacion");
  $finish;
end

endmodule
