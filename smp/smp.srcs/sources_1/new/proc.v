`timescale 1ns / 1ps

module proc(
    input clk,
    input rst
    );
    
    wire [31:0] instr, result, wrtdata, regdat1, regdat2, aluin, imdata, shftamnt;
    wire [4:0] regsrc1, regsrc2, regdst;
    wire wrtsrc, alusrc;
    wire [2:0] aluop;

    assign shftamnt = instr[10:6];
    assign imdata = instr[20:0];
    assign regsrc1 = instr[20:16];
    assign regsrc2 = instr[15:11];
    assign regdst = instr[25:21];
    
    instrfetch if0(clk, rst, instr);
    control c0(instr, wrtsrc, alusrc, aluop);
    mux m0(imdata, result, wrtsrc, wrtdata);
    datapath d0(regsrc1, regsrc2, regdst, wrtdata, clk, rst, regdat1, regdat2);
    mux m1(regdat2, shftamnt, alusrc, aluin);
    alu a0(regdat1, aluin, aluop, clk, result);

endmodule
