module echo_tb();

localparam BAUD = 1;//`B115200;
localparam BITRATE = (BAUD << 1);
localparam FRAME = (BITRATE * 11);
localparam FRAME_WAIT = (BITRATE * 4);

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


wire tx;
reg rx;

echo
  dut(
    .tx(tx),
    .rx(rx)
  );


initial begin

  $dumpfile("echo_tb.vcd");
  $dumpvars(0, echo_tb);

   # 20;
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car("0");
   #(FRAME_WAIT * 2) send_car("1");
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 2) send_car(13);
   #(FRAME_WAIT * 40) $display("FIN de la simulacion");
  $finish;
end

endmodule
