`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 07:12:20 AM
// Design Name: 
// Module Name: priority_encoder_4x2
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


module priority_encoder_4x2(
        input [3:0] w,
        output z,
        output reg [1:0] y
    );
    
    assign z = |w; //ORs all bits of w. if z is high, there is an assertion
    
    always@(w)
    begin
    //            Priority encoder
            y = 2'bx;//  Default
//            if (w[3])
//                y = 2'b11;
//            else if (w[2])
//                y = 2'b10;
//            else if (w[1])
//                y = 2'b01;
//            else if (w[0])
//                y = 2'b00;
//            else
//            y = 2'bxx;//  Default    

            casex (w)//casex because we don't care about the rest of the bits, if the known bits match, then case matches 
                4'b1xxx : y = 2'b11;
                4'b01xx : y = 2'b10;
                4'b001x : y = 2'b01;
                4'b0001 : y = 2'b00;
                default : y = 2'bx;
            endcase
    end
    
endmodule