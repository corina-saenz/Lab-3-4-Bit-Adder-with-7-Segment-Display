`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 06:04:21 PM
// Design Name: 
// Module Name: adder4_cla
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


module adder4_cla(
    input  [3:0] A,
    input  [3:0] B,
    input        CI,        
    output [3:0] SUM,
    output       CO         
);
    wire [3:0] P = A ^ B;   
    wire [3:0] G = A & B;   

    wire c1 = G[0] | (P[0] & CI);
    wire c2 = G[1] | (P[1] & G[0]) | (P[1] & P[0] & CI);
    wire c3 = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & CI);
    wire c4 = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) |
              (P[3] & P[2] & P[1] & G[0]) |
              (P[3] & P[2] & P[1] & P[0] & CI);

    assign SUM[0] = P[0] ^ CI;  
    assign SUM[1] = P[1] ^ c1;  
    assign SUM[2] = P[2] ^ c2;  
    assign SUM[3] = P[3] ^ c3;  

    assign CO = c4;             
endmodule