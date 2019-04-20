`timescale 1ns / 1ps

module mux(
    input [7:0] i0,
    input [7:0] i1,
    input s,
    output [7:0] o
);

    assign o = (s) ? i1 : i0;

endmodule