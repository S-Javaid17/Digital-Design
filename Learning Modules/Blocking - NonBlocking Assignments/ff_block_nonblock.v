`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 11:09:52 PM
// Design Name: 
// Module Name: ff_block_nonblock
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


module ff_block_nonblock(//2 bit shift reg, aka 2 FFs with a common clk, and connected in cascade
        input D, clk,
        output reg Q1, Q2
    );
    
    always @(posedge clk)//don't use Blocking assignments in seq. circuits
    begin
               Q1 <= D;//order doesn't really matter
               Q2 <= Q1;
    end
    
endmodule
