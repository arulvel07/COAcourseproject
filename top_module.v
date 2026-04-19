// Top Module - connects all CPU parts together

module top_module (
    input clk,
    input reset,
    output [7:0] pc_out,
    output [15:0] alu_out,
    output [1:0] state_out
);

    // Wires between modules
    wire pc_inc, reg_write_en;
    wire [7:0] pc_addr;
    wire [15:0] instruction;
    wire [15:0] read_data1, read_data2, alu_result;
    wire [3:0] alu_op;
    wire ctrl_reg_write, imm_sel;
    wire [1:0] fsm_state;

    // Decode instruction fields directly (no IR needed)
    wire [3:0] opcode = instruction[15:12];
    wire [2:0] rd     = instruction[11:9];
    wire [2:0] rs     = instruction[8:6];
    wire [5:0] imm    = instruction[5:0];

    // Pick operand B: immediate or register value
    wire [15:0] operand_b = imm_sel ? {10'b0, imm} : read_data2;

    // Outputs
    assign pc_out    = pc_addr;
    assign alu_out   = alu_result;
    assign state_out = fsm_state;

    // --- Module connections ---

    pc u_pc (
        .clk(clk), .reset(reset),
        .pc_inc(pc_inc), .pc_out(pc_addr)
    );

    instruction_memory u_imem (
        .addr(pc_addr), .instruction(instruction)
    );

    register_file u_regfile (
        .clk(clk), .reset(reset),
        .reg_write(reg_write_en),
        .read_reg1(rd), .read_reg2(rs), .write_reg(rd),
        .write_data(alu_result),
        .read_data1(read_data1), .read_data2(read_data2)
    );

    alu u_alu (
        .operand_a(read_data1), .operand_b(operand_b),
        .alu_op(alu_op), .alu_result(alu_result)
    );

    control_unit u_ctrl (
        .opcode(opcode), .alu_op(alu_op),
        .reg_write(ctrl_reg_write), .imm_sel(imm_sel)
    );

    fsm_controller u_fsm (
        .clk(clk), .reset(reset),
        .ctrl_reg_write(ctrl_reg_write),
        .pc_inc(pc_inc), .reg_write_en(reg_write_en),
        .state(fsm_state)
    );

endmodule
