module counter(clk,dout);

parameter N=4;

input wire clk;
output reg [N-1:0] dout;
reg ini=0;

always @(posedge clk)
	begin
		ini<=1;
		if (ini==0) dout <=0;
		else dout <= dout + 1;
	end

endmodule
