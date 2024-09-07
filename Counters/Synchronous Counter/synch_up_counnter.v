`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 07:51:18 AM
// Design Name: 
// Module Name: synch_up_counter
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

// vid 32, diagram in notes
module synch_up_counter(
        input clk,
        input reset_n,
        output [3:0] Q
    );
    
    wire Q0_next, Q1_next, Q2_next, Q3_next;
    
    assign Q0_next = 1'b1;// or you can make this an enable pin instead
    T_FF TFF0
    (
        .clk(clk),
        .T(Q0_next),
        .reset_n(reset_n),
        .Q(Q[0])
    );

   and AND0 (Q1_next, Q0_next, Q[0]);
    T_FF TFF1
    (
        .clk(clk),
        .T(Q1_next),
        .reset_n(reset_n),
        .Q(Q[1])
    );

   and AND1 (Q2_next, Q1_next, Q[1]);
    T_FF TFF2
    (
        .clk(clk),
        .T(Q2_next),
        .reset_n(reset_n),
        .Q(Q[2])
    );

   and AND2 (Q3_next, Q2_next, Q[2]);
    T_FF TFF3
    (
        .clk(clk),
        .T(Q3_next),
        .reset_n(reset_n),
        .Q(Q[3])
    );
endmodule
