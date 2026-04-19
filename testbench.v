`timescale 1ns / 1ps

module testbench;

    reg clk, reset;
    wire [7:0] pc_out;
    wire [15:0] alu_out;

    top_module cpu (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out),
        .alu_out(alu_out),
        .state_out()
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        reset = 1;
        #20;
        reset = 0;

        // Wait for program to finish
        #400;

        // Print final results
        $display("====== RESULTS ======");
        $display("R1 = %0d", cpu.u_regfile.registers[1]);
        $display("R2 = %0d", cpu.u_regfile.registers[2]);
        $display("PC = %0d", pc_out);
        $display("=====================");
        // Expected: R1=8, R2=3

        $finish;
    end

endmodule
