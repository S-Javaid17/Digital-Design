`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 04:41:38 AM
// Design Name: 
// Module Name: shift_register
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


module shift_register// does a shift to right, but is always shifting
#(parameter N = 4)
    (
        input clk,
        input SI,// serial input
        // Output [N-1:0] Q, //if we care about the content , bit pushed in
        output SO //Serial output, we only care about the bit being pushed out
    );
    
    reg [N - 1: 0] Q_reg, Q_next;
    
    always@(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    //next state logic
    always@(Q_reg, SI)
    begin// right shift
        Q_next = {SI, Q_reg[N - 1: 1]};//keeps the leftmost 3 bits, and concatenates/adds a single bit SI to its left (shift); thus, discarding the rightmost bit, by necessity 
        
//        //left shift
//        Q_next = {Q_reg[N - 2: 0], SI}; // keeps rightmost 3 bits, and concatenates SI to its right, pushing out the leftmost bit
    end
    
        assign SO = Q_reg[0];//for right shift
//      assign SO = Q_reg[N - 1];//for left shift
//      assign Q = Q_reg; // if we care about the contents of the regs   
endmodule
