module HA(a,b,out);
    input wire a;
	input wire b;
    output wire [1:0] out;

	Xor XOR(.a(a),.b(b),.out(out[0]));
	And AND(.a(a),.b(b),.out(out[1]));
endmodule
