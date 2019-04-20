`timescale 1ns / 1ps

module instrfetch(
    input clk,
    input rst,
    output [31:0] instr
    );
    
    reg [31:0] pc;
    initial pc = 0;
    
    instrmem im0(pc, rst, instr);
    
    always @(posedge clk, posedge rst) begin
        if(rst == 1)
            pc = 0;
        else
            pc = pc + 4;
    end
    
endmodule
