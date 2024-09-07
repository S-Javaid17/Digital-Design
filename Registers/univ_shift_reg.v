`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 05:53:53 AM
// Design Name: 
// Module Name: univ_shift_reg
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

//if s = 00 --> no change
//if s = 01 --> shift right
//if s = 10 --> shift left
//if s = 11 --> parallel load
module univ_shift_reg
#(parameter N = 4)  
    (
        input clk,
        input reset_n,//asynch
        input MSB_in, LSB_in,
        input [N - 1: 0] I,// parallel load
        input [1:0] s,//select input
        output [N - 1: 0] Q// if contents matter
    );
    
 reg [N - 1: 0] Q_reg, Q_next;
    
    //register logic
    always@(posedge clk, negedge reset_n)
    begin
        if (!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    //next state logic
    always@(s, Q_reg, I, LSB_in, MSB_in)
    begin
    Q_next = Q_reg; //default                
            case(s)            
                2'b00: begin
                    Q_next = Q_reg;//no change/ hold value
                end
                2'b01: begin
                    Q_next = {MSB_in, Q_reg[N - 1: 1]};//shif right
                end
                2'b10: begin
                    Q_next = {Q_reg[N - 2: 0], LSB_in};//shift left
                end
                2'b11: begin
                    Q_next = I; //parallel load
                end
                default: Q_next = 'bx;
            endcase
    end

    //output logic    
    assign Q = Q_reg; //parallel output values
endmodule

