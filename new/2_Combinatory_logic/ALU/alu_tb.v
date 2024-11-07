module alu_tb();
    reg zx, zy, nx, ny, f, no;
    reg [15:0]  x;
    reg [15:0]  y;

    wire [15:0] out;
    wire        zr, ng;

	integer file;
    
	alu ALU(.x(x), .y(y), .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no), .out(out), .zr(zr), .ng(ng));
	
	task display;
    	#1 $fwrite(file, "| %16b | %16b | %1b | %1b | %1b | %1b | %1b | %1b | %16b | %1b | %1b |\n", x,y,zx,nx,zy,ny,f,no, out,zr,ng);
  	endtask
  	
  	initial begin
		$dumpfile("alu_tb.vcd");
		$dumpvars(0,alu_tb);
    	file = $fopen("alu.out", "w");
    	$fwrite(file, "|         x        |         y        |zx |zy |ny | f |no |        out        |zr |ng |\n");
            
			x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 0;
            zy = 1;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 1;
            zy = 1;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 1;
            zy = 1;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 0;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 0;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 0;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 0;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 1;
            zy = 1;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 0;
            zy = 0;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 0;
            zy = 0;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 0;
            zy = 0;
            ny = 0;
            f = 0;
            no = 0;
			display();

            x = 16'b0000000000000000;
            y = 16'b1111111111111111;
            zx = 0;
            nx = 1;
            zy = 0;
            ny = 1;
            f = 0;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 0;
            zy = 1;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 1;
            zy = 1;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 1;
            zy = 1;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 0;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 0;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 0;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 0;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 1;
            zy = 1;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 0;
            zy = 1;
            ny = 1;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 1;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 0;
            zy = 0;
            ny = 0;
            f = 1;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 1;
            zy = 0;
            ny = 0;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 0;
            zy = 0;
            ny = 1;
            f = 1;
            no = 1;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 0;
            zy = 0;
            ny = 0;
            f = 0;
            no = 0;
			display();

            x = 16'b0000000000010001;
            y = 16'b0000000000000011;
            zx = 0;
            nx = 1;
            zy = 0;
            ny = 1;
            f = 0;
            no = 1;
			display();
    	
			$fclose(file);
  	end
endmodule
