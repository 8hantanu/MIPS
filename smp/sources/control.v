`timescale 1ns / 1ps

module control(
    input [31:0] instr,
    output wrtsrc,
    output alusrc,
    output [2:0] aluop
    );

    assign wrtsrc = ~instr[31];
    assign alusrc = ~instr[5];
    assign aluop = {instr[5], instr[2], instr[1] | instr[0]};

endmodule
