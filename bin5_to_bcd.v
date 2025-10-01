`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 06:11:05 PM
// Design Name: 
// Module Name: bin5_to_bcd
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

module bin5_to_bcd(
    input  wire [4:0] bin,   // 0..31
    output wire [3:0] tens,  // 0..3
    output wire [3:0] ones   // 0..9
);
    assign tens = (bin >= 5'd30) ? 4'd3 :
                  (bin >= 5'd20) ? 4'd2 :
                  (bin >= 5'd10) ? 4'd1 : 4'd0;

    assign ones = bin - (tens * 4'd10);
endmodule


