`default_nettype none
module DFF(
    input clk,
    input in,
    output reg out  // Declares 'out' as a reg directly in the port list
);

    always @(posedge clk) begin
        if (in) 
            out <= 1'b1;
        else 
            out <= 1'b0;
    end

endmodule