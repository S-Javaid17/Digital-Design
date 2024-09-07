`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 01:18:23 AM
// Design Name: 
// Module Name: mux_4x1_nbit
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


module mux_4x1_nbit
#(parameter N = 3)    
    (
        input [N - 1: 0] w0, w1, w2, w3,  // 4 inputs, of each length n
        input [1:0] s,  //technically 1 input, but a bus with 2 bits of data to act as 2 select inputs
        output reg [N - 1: 0] f  //an output in an always block, so use reg
    );
    
    always @(w0, w1, w2, w3, s)
    begin
//            f = s[1] ? (s[0] ? w3 : w2) : (s[0] ? w1 : w0);// Nested condition operator, but hard to read

        //if-else
//        if (s == 2'b00)
//            f = w0;
//        else if (s == 2'b01)
//            f = w1;
//        else if (s == 2'b10)
//            f = w2;
//        else if (s == 2'b11)
//            f = w3;
//        else
//            f = 'bx;  // Don't know the value, good for debugging

        //Case Statement
        f = 'bx;//default
        case(s)
            2'b00 : f = w0;  //Don't need beginning end for each, since only 1 statement
            2'b01 : f = w1;
            2'b10 : f = w2;
            2'b11 : f = w3;
            default : f = 'bx;
        endcase    
    end
endmodule
