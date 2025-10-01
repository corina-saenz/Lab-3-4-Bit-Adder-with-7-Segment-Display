`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 07:14:24 PM
// Design Name: 
// Module Name: tb_adder7seg_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_adder7seg_top;
    // Inputs
    reg        clk;
    reg  [15:0] sw;
    
    // Outputs
    wire [6:0] seg;
    wire       dp;
    wire [3:0] an;

    // DUT = Device Under Test
    adder7seg_top dut(
        .clk(clk),
        .sw(sw),
        .seg(seg),
        .dp(dp),
        .an(an)
    );

    // Generate clock 
    always #5 clk = ~clk;

    // Apply test vectors
    initial begin
        clk = 0;
        sw   = 16'h0000;

        // Case 1: 3 + 4 = 7
        sw[3:0] = 4'd3;    // A
        sw[7:4] = 4'd4;    // B
        #100000;           // wait some time

        // Case 2: 9 + 9 = 18
        sw[3:0] = 4'd9;
        sw[7:4] = 4'd9;
        #100000;

        // Case 3: 15 + 15 + 1 = 31
        sw[3:0] = 4'd15;
        sw[7:4] = 4'd15;
        #100000;

        // Case 4: 8 + 7 = 16
        sw[3:0] = 4'd8;
        sw[7:4] = 4'd7;
        #100000;

        $stop; // end simulation
    end
endmodule

