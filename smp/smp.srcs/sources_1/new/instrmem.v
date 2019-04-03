`timescale 1ns / 1ps

module instrmem(
    input [31:0] pc,
    input rst,
    output [31:0] instr
    );
    
    reg [31:0] instmem [40:0];
    
    assign instr = {instmem[pc], instmem[pc+1], instmem[pc+2], instmem[pc+3]};
    
    always @(posedge rst) begin
        if (rst == 1) begin
            {instmem[0], instmem[1], instmem[2], instmem[3]}     = 32'b11111100001000000000000000000100;
            {instmem[4], instmem[5], instmem[6], instmem[7]}     = 32'b11111100010000000000000000000011;
            {instmem[8], instmem[9], instmem[10], instmem[11]}   = 32'b00000000000000010001000000100000;
            {instmem[12], instmem[13], instmem[14], instmem[15]} = 32'b00000000000000010001000000100010;
            {instmem[16], instmem[17], instmem[18], instmem[19]} = 32'b00000000000000010001000000100100;
            {instmem[20], instmem[13], instmem[22], instmem[23]} = 32'b00000000000000010001000000100101;
            {instmem[24], instmem[25], instmem[26], instmem[27]} = 32'b00000000000000000000000010000000;
            {instmem[28], instmem[29], instmem[30], instmem[31]} = 32'b00000000000000000000000001000001;
            {instmem[32], instmem[33], instmem[34], instmem[35]} = 32'b11111100000000000000000000000101;
        end
    end

endmodule
