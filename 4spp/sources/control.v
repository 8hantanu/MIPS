`timescale 1ns / 1ps

module control(
    input clk,
    input [7:0] instr,
    output reg [7:0] if_id_instr,
    output reg [7:0] id_ex_instr,
    output reg [7:0] ex_wb_instr,
    output reg if_id_pc_src,
    output reg if_id_alu,
    output reg id_ex_alu,
    output reg if_id_reg_wrt,
    output reg id_ex_reg_wrt,
    output reg ex_wb_reg_wrt
);

    always @(instr) begin

        if_id_pc_src    <= instr[7];
        if_id_reg_wrt   <= ~instr[7];
        if_id_alu       <= instr[6];
        if_id_instr     <= instr;

        id_ex_reg_wrt   <= if_id_reg_wrt;
        id_ex_alu       <= if_id_alu;
        id_ex_instr     <= if_id_instr;

        ex_wb_reg_wrt   <= id_ex_reg_wrt;
        ex_wb_instr     <= id_ex_instr;

    end

endmodule