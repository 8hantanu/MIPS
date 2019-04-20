`timescale 1ns / 1ps

module proc(
    input clk,
    input rst
);
    wire [7:0] instr, if_id_instr, id_ex_instr, ex_wb_instr, in0, in1,
               wrt_data, reg_src_dat, reg_dst_dat, alu_in0, alu_in1;
    wire [5:0] jmp_addr;
    wire [2:0] reg_src, reg_dst, reg_wrt_dst, shft_amnt;
    wire [1:0] op_code;
    wire if_id_pc_src, for_dat,
         if_id_alu, id_ex_alu,
         if_id_reg_wrt, id_ex_reg_wrt, ex_wb_reg_wrt;

// ---------------------------------------------------- IF ----------------------------------------------------

    assign jmp_addr  = if_id_pc_src ? if_id_instr[5:0] : jmp_addr;
    instr_fetch instruction_fetch(clk, rst, if_id_pc_src, jmp_addr, instr);
    control control_unit(
        clk, instr,
        if_id_instr, id_ex_instr, ex_wb_instr,
        if_id_pc_src,
        if_id_alu, id_ex_alu,
        if_id_reg_wrt, id_ex_reg_wrt, ex_wb_reg_wrt
    );
    assign reg_src = if_id_instr[2:0];
    assign reg_dst = if_id_instr[5:3];

// ---------------------------------------------------- ID ----------------------------------------------------

    assign shft_amnt    = id_ex_instr[2:0];
    reg_file register(clk, rst, reg_src, reg_dst, reg_wrt_dst, ex_wb_reg_wrt, wrt_data, reg_src_dat, reg_dst_dat);

// ---------------------------------------------------- EX ----------------------------------------------------

    mux alu_src_sel(reg_src_dat, {5'b00000, shft_amnt}, id_ex_alu, alu_in1);
    forward forward_unit(id_ex_instr, ex_wb_instr, alu_in1, reg_dst_dat, wrt_data, in1, in0);
    alu alu_unit(clk, in0, in1, id_ex_alu, wrt_data);

// ---------------------------------------------------- WB ----------------------------------------------------

    assign reg_wrt_dst  = ex_wb_instr[5:3];

endmodule