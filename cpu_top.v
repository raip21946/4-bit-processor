module cpu_top(

input clk,
input reset

);

wire [3:0] pc;
wire [7:0] instruction;

wire [2:0] opcode;

wire [3:0] reg_data1;
wire [3:0] reg_data2;

wire [3:0] alu_result;

wire reg_write;

assign opcode = instruction[7:5];

program_counter PC(
.clk(clk),
.reset(reset),
.pc(pc)
);

instruction_memory IM(
.address(pc),
.instruction(instruction)
);

control_unit CU(
.opcode(opcode),
.reg_write(reg_write)
);

register_file RF(
.clk(clk),
.we(reg_write),

.read_addr1(instruction[4:3]),
.read_addr2(instruction[2:1]),

.write_addr(2'b00),

.data_in(alu_result),

.data_out1(reg_data1),
.data_out2(reg_data2)
);

alu ALU(
.A(reg_data1),
.B(reg_data2),
.opcode(opcode),
.result(alu_result)
);
data_memory DM(

.clk(clk),
.we(mem_write),

.address(reg_data1),

.data_in(reg_data2),

.data_out(mem_data_out)

);

endmodule