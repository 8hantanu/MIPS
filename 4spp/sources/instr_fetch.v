`timescale 1ns / 1ps

module instr_fetch(
    input clk,
    input rst,
    input pc_src,
    input [5:0] jmp_rel_addr,
    output [7:0] instr
);

    reg [7:0] pc;
    initial pc = 0;

    instr_mem im0(pc, rst, instr);

    always @(posedge clk) begin
        if (rst == 1)
            pc = 0;
        else if (rst == 0 & pc_src == 1)
            pc = pc + 1 + jmp_rel_addr;
        else
            pc = pc + 1;
    end

endmodule