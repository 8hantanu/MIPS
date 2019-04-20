`timescale 1ns / 1ps

module proc_tb();

    reg clk;
    reg rst;
    
    proc uut(.clk(clk), .rst(rst));
    
    initial begin
        clk = 1;
        repeat(22)
            #10 clk = ~clk;
        $finish;
    end

    initial begin
        rst = 0;
        #20 rst = 1;
        #20 rst = 0;
    end

endmodule
