`timescale 1ns / 1ps

module alu(
    input [31:0] i1,
    input [31:0] i2,
    input [2:0] aluop,
    input clk,
    output reg [31:0] o
    );
    
    always @(clk) begin
        case(aluop)
            3'b100 : o = i1 + i2;
            3'b101 : o = i1 - i2;
            3'b110 : o = i1 & i2;
            3'b111 : o = i1 | i2;
            3'b000 : o = i1 << i2;
            3'b001 : o = i1 >> i2;
        endcase
    end

endmodule
