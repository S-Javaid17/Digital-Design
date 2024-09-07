`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 07:00:10 AM
// Design Name: 
// Module Name: encoder_4x2
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


module encoder_4x2(
        input [3:0] w,
        output reg [1:0] y
    );
    
    always@(w)
    begin
            y = 2'bx;//  Default
            //Priority encoder
//            if (w[3])
//                y = 2'b11;
//            else if (w[2])
//                y = 2'b10;
//            else if (w[1])
//                y = 2'b01;
//            else if (w[0])
//                y = 2'b00;
//            else
//            y = 2'bx;//  Default    

            case (w)
                4'b0001 : y = 2'b00;
                4'b0010 : y = 2'b01;
                4'b0100 : y = 2'b10;
                4'b1000 : y = 2'b11;
                default : y = 2'bx;
            endcase
    end
    
endmodule
