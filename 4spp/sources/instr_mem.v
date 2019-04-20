`timescale 1ns / 1ps

module instr_mem(
    input [7:0] pc,
    input rst,
    output [7:0] instr
);

    reg [7:0] instmem [31:0];
    
    assign instr = instmem[pc];

    always @(rst) begin
        if (rst == 1) begin
            instmem[0]  = 8'b00110010; // add R6, R2
            instmem[1]  = 8'b01110001; // sll R6, 1
            instmem[2]  = 8'b00010110; // add R2, R6
            instmem[3]  = 8'b11000001; // j L1
            instmem[4]  = 8'b01010011; // sll R2, 3
            instmem[5]  = 8'b00100010; // L1: add R4, R2
        end
    end

endmodule
