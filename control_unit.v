// Control Unit - decodes opcode into control signals

module control_unit (
    input [3:0] opcode,
    output reg [3:0] alu_op,
    output reg reg_write,
    output reg imm_sel
);

    always @(*) begin
        case (opcode)
            4'b0001: begin alu_op = 4'b0001; reg_write = 1; imm_sel = 0; end // ADD
            4'b0010: begin alu_op = 4'b0010; reg_write = 1; imm_sel = 0; end // SUB
            4'b0011: begin alu_op = 4'b0011; reg_write = 1; imm_sel = 0; end // AND
            4'b0100: begin alu_op = 4'b0100; reg_write = 1; imm_sel = 0; end // OR
            4'b0101: begin alu_op = 4'b0101; reg_write = 1; imm_sel = 0; end // MOV
            4'b0110: begin alu_op = 4'b0110; reg_write = 1; imm_sel = 1; end // LOADI
            default: begin alu_op = 4'b0000; reg_write = 0; imm_sel = 0; end // NOP
        endcase
    end

endmodule
