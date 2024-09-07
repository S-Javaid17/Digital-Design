`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 05:40:26 AM
// Design Name: 
// Module Name: shift_register_load
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


module shift_register_load // only shifts when needed, and has the ability to shift in SERIAL or load in parallel
#(parameter N = 4)  
    (
        input clk,
        input load, 
        input SI,
        input reset_n,// asynch
        input [N - 1: 0] I,// parallel load
        output [N - 1: 0] Q,// if contents matter
        output SO
    );
    
 reg [N - 1: 0] Q_reg, Q_next;
    
    always@(posedge clk, negedge reset_n)
    begin
        if (!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    //next state logic
    always@(Q_reg, SI, load)
    begin
        if (load)
            Q_next = I;// parallel load, loads next value
        else
            Q_next = {SI, Q_reg[N - 1: 1]};//does a right shift
    end
    
        assign SO = Q_reg[0];
        assign Q = Q_reg; 
endmodule
