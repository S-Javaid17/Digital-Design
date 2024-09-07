`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 07:58:22 AM
// Design Name: 
// Module Name: hex2sseg
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


module hex2sseg(
    input [3:0] hex,
    output reg [6:0] sseg
    );
    
    always @ (hex)
    begin
            case(hex)
                0: sseg = 7'b1000000;// if the value of the 4 bit hex is 0, then set sseg to the 7 bit code for the digit 0
                1: sseg = 7'b1111001;//1
                2: sseg = 7'b0100100;
                3: sseg = 7'b0110000;
                4: sseg = 7'b0011001;// .
                5: sseg = 7'b0010010;// . 
                6: sseg = 7'b0000010;// .
                7: sseg = 7'b1111000;
                8: sseg = 7'b0000000;
                9: sseg = 7'b0010000;//9
               10: sseg = 7'b0001000;//a
               11: sseg = 7'b0000011;//b
               12: sseg = 7'b1000110;//c
               13: sseg = 7'b0100001;//d
               14: sseg = 7'b0000110;//f
               15: sseg = 7'b0001110;//g
                
            endcase
    end
    
endmodule
