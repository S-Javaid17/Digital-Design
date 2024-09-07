`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 07:40:28 AM
// Design Name: 
// Module Name: T_FF
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


module T_FF(
    input clk,
    input T,
    input reset_n,
    output Q
    );
    
    reg Q_reg; 
    wire Q_next;// not in an always block
//register logic
    always@(posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                Q_reg <= 1'b0;
            else
                Q_reg <= Q_next;
    end
    
//next state logic
    assign Q_next = T ? ~Q_reg : Q_reg; // if T = 0, flip the current bits, otherwise remember old value
// Output logic    
    assign Q = Q_reg;
endmodule
