module control_unit(

input [2:0] opcode,

output reg reg_write

);

always @(*)
begin

case(opcode)

3'b000: reg_write = 1;
3'b001: reg_write = 1;
3'b010: reg_write = 1;
3'b011: reg_write = 1;
3'b100: reg_write = 1;
3'b101: reg_write = 1;

default:
reg_write = 0;

endcase

end

endmodule