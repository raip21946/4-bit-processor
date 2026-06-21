module data_memory(

input clk,
input we,

input [3:0] address,
input [3:0] data_in,

output reg [3:0] data_out

);

reg [3:0] memory [15:0];

always @(posedge clk)
begin

if(we)
memory[address] <= data_in;

data_out <= memory[address];

end

endmodule