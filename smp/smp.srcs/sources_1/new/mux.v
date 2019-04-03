`timescale 1ns / 1ps

module mux(
    input [31:0] i0,
    input [31:0] i1,
    input s,
    output [31:0] o
    );

    assign o = (s) ? i1 : i0;

endmodule
