`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 06:35:38 AM
// Design Name: 
// Module Name: decoder_2x4_en
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


module decoder_2x4_en( //enable pin. if not asserted, no output is asserted ---> 0000
    input [1:0] a,
    input en,
    output reg [3:0] y
    );
    
    always @(a, en)
    begin
         y = 4'bx;// default     
        if (en)
        begin
        y[a] = 1'b1;  //enter any routing network here (case, if-else etc..)
        end
        else
        y = 4'b0;// no hot output     
    end   
endmodule
