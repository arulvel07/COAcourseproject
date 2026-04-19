// Instruction Memory - stores the program (ROM)

module instruction_memory (
    input [7:0] addr,
    output [15:0] instruction
);

    reg [15:0] memory [0:255];

    // Test program
    // Format: [opcode(4) | rd(3) | rs(3) | imm(6)]
    initial begin
        memory[0] = 16'b0110_001_000_000101; // LOADI R1, 5
        memory[1] = 16'b0110_010_000_000011; // LOADI R2, 3
        memory[2] = 16'b0001_001_010_000000; // ADD R1, R2  → R1 = 8
        memory[3] = 16'b0000_000_000_000000; // NOP
    end

    assign instruction = memory[addr];

endmodule
