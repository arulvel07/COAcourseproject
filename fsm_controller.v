// FSM Controller - cycles through FETCH → DECODE → EXECUTE → WRITEBACK

module fsm_controller (
    input clk,
    input reset,
    input ctrl_reg_write,  //does this instruction need to write a result
    output reg pc_inc, //should the program counter increment
    output reg reg_write_en, //should the register file write
    output reg [1:0] state //current state of the fsm
);

    // State names
    parameter FETCH     = 2'b00;
    parameter DECODE    = 2'b01;
    parameter EXECUTE   = 2'b10;
    parameter WRITEBACK = 2'b11;

    // Simple 2-bit counter: 00 → 01 → 10 → 11 → 00 ...
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= FETCH;
        else
            state <= state + 1;
    end

    // Control signals for each state
    always @(*) begin
        pc_inc       = 0;
        reg_write_en = 0;

        if (state == WRITEBACK) begin
            reg_write_en = ctrl_reg_write;
            pc_inc = 1;
        end
    end

endmodule
