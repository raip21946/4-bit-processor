`timescale 1ns / 1ps

module testbench;

reg clk;
reg reset;

// Instantiate CPU
cpu_top uut(
    .clk(clk),
    .reset(reset)
);

// Clock generation
always #5 clk = ~clk;

// Main stimulus
initial
begin
    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    // Run simulation
    #100;

    $display("\nSimulation Completed Successfully");
    $finish;
end

// Header
initial
begin
    $display("--------------------------------------------------------------------");
    $display("Time\tPC\tInstruction\tOpcode\tA\tB\tALU\tMemOut");
    $display("--------------------------------------------------------------------");
end

// Monitor signals
initial
begin
    $monitor("%0t\t%d\t%b\t%b\t%d\t%d\t%d\t%d",
             $time,
             uut.pc,
             uut.instruction,
             uut.opcode,
             uut.reg_data1,
             uut.reg_data2,
             uut.alu_result,
             uut.mem_data_out);
end

// Decode and print instruction execution
always @(posedge clk)
begin
    case(uut.opcode)

        3'b000:
        begin
            $display("ADD : %d + %d = %d",
                     uut.reg_data1,
                     uut.reg_data2,
                     uut.alu_result);
        end

        3'b001:
        begin
            $display("SUB : %d - %d = %d",
                     uut.reg_data1,
                     uut.reg_data2,
                     uut.alu_result);
        end

        3'b010:
        begin
            $display("AND : %b & %b = %b",
                     uut.reg_data1,
                     uut.reg_data2,
                     uut.alu_result);
        end

        3'b011:
        begin
            $display("OR  : %b | %b = %b",
                     uut.reg_data1,
                     uut.reg_data2,
                     uut.alu_result);
        end

        3'b100:
        begin
            $display("XOR : %b ^ %b = %b",
                     uut.reg_data1,
                     uut.reg_data2,
                     uut.alu_result);
        end

        3'b101:
        begin
            $display("NOT : ~%b = %b",
                     uut.reg_data1,
                     uut.alu_result);
        end

        3'b110:
        begin
            $display("LOAD instruction executed");
        end

        3'b111:
        begin
            $display("STORE instruction executed");
        end

    endcase
    
end
initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0,testbench);
end
endmodule