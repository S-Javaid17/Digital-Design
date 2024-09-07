`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 08:09:04 AM
// Design Name: 
// Module Name: sseg_test
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


module sseg_test(
    input [3:0] hex, //hex values
    input [7:0] SW,  //8 switches
    input decimal_point,  //decimal point
    output DP,
    output [7:0] AN, //Anodes / digit select
    output [6:0] sseg //segments
    );
            assign AN = SW;// Switches activate digit
            assign DP = decimal_point;// activates decimal
    
    hex2sseg MyTest (
        .hex(hex),
        .sseg(sseg)
    );
endmodule

       