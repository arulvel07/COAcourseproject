// Instruction Memory - stores the program (ROM)

module instruction_memory (
    input [7:0] addr,
    output [15:0] instruction
);

    reg [15:0] memory [0:255];

    // Test program
    // Format: [opcode(4) | rd(3) | rs(3) | imm(6)]
    initial begin
    memory[0] = 16'b0110_001_000_001010; // LOADI R1, 10  → a = 10
    memory[1] = 16'b0110_010_000_000111; // LOADI R2, 7   → b = 7
    memory[2] = 16'b0101_011_001_000000; // MOV R3, R1    → temp = a
    memory[3] = 16'b0101_001_010_000000; // MOV R1, R2    → a = b
    memory[4] = 16'b0101_010_011_000000; // MOV R2, R3    → b = temp
    memory[5] = 16'b0000_000_000_000000; // NOP
end

    assign instruction = memory[addr];

endmodule
