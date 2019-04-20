`timescale 1ns / 1ps

module forward(
    input [7:0] nxt_instr,
    input [7:0] prev_instr,
    input [7:0] reg_src_dat,
    input [7:0] reg_dst_dat,
    input [7:0] up_dat,
    output reg [7:0] in0,
    output reg [7:0] in1
);

    always @(*) begin
        in0 = reg_src_dat;
        in1 = reg_dst_dat;
        if (prev_instr[7:6] != 2'b11) begin
            if (nxt_instr[7:6] == 2'b00 & prev_instr[5:3] == nxt_instr[2:0])
                in0 = up_dat;
            if (nxt_instr[7:6] != 2'b11 & prev_instr[5:3] == nxt_instr[5:3])
                in1 = up_dat;
        end
    end

endmodule
