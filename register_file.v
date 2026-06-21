module register_file(

input clk,
input we,

input [1:0] read_addr1,
input [1:0] read_addr2,

input [1:0] write_addr,
input [3:0] data_in,

output [3:0] data_out1,
output [3:0] data_out2
);

reg [3:0] reg_mem[3:0];

initial begin
reg_mem[0]=4'd5;
reg_mem[1]=4'd3;
reg_mem[2]=4'd2;
reg_mem[3]=4'd1;
end

always @(posedge clk)
begin
if(we)
reg_mem[write_addr] <= data_in;
end

assign data_out1 = reg_mem[read_addr1];
assign data_out2 = reg_mem[read_addr2];

endmodule