`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 06:11:38 AM
// Design Name: 
// Module Name: decoder_2x4
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


module decoder_2x4( // behav. modelling
    input [1:0] a,
    output reg [3:0] y
    );
    
    always @(a)
    begin
         y = 4'b0;// default 
                    //priority routing network  - if statements
//            if (a == 2'b11)
//                y[3] = 1'b1; 
//            else if (a == 2'b10)
//                y[2] = 1'b1;
//            else if (a == 2'b01)
//                y[1] = 1'b1;
//            else if (a == 2'b00)
//                y[0] = 1'b1;
//            else
//                y = 4'bx;

                    // Parallel Cases, will implement 1 big mux
//              case(a)
//                2'b11 : y[3] = 1'b1; 
//                2'b10 : y[2] = 1'b1; 
//                2'b01 : y[1] = 1'b1; 
//                2'b00 : y[0] = 1'b1; 
//                default : y[0] = 1'b1;
//              endcase

                // EASIER way to implement one
                y[a] = 1'b1;  //Straightforward...if a==2, then y[2] is hot --> 0100
                
    end  
endmodule
