module instruction_memory(

input [3:0] address,
output reg [7:0] instruction

);

always @(*)
begin

case(address)

0: instruction = 8'b00000010; // ADD
1: instruction = 8'b00100010; // SUB
2: instruction = 8'b01000010; // AND
3: instruction = 8'b01100010; // OR
4: instruction = 8'b10000010; // XOR
5: instruction = 8'b10100010; // NOT

default:
instruction = 8'b00000000;

endcase

end

endmodule