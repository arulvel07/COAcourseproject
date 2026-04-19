// ALU - does math/logic operations

module alu (
    input [15:0] operand_a,
    input [15:0] operand_b,
    input [3:0] alu_op,
    output reg [15:0] alu_result
);

    always @(*) begin
        case (alu_op)
            4'b0001: alu_result = operand_a + operand_b; // ADD
            4'b0010: alu_result = operand_a - operand_b; // SUB
            4'b0011: alu_result = operand_a & operand_b; // AND
            4'b0100: alu_result = operand_a | operand_b; // OR
            4'b0101: alu_result = operand_b;             // MOV
            4'b0110: alu_result = operand_b;             // LOADI
            default: alu_result = 0;                     // NOP
        endcase
    end

endmodule
