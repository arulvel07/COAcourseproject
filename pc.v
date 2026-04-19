// Program Counter - tracks current instruction address

module pc (
    input clk,
    input reset,
    input pc_inc,
    output reg [7:0] pc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 0;
        else if (pc_inc)
            pc_out <= pc_out + 1; //pc advances once per 4 cycle instruction
    end

endmodule
