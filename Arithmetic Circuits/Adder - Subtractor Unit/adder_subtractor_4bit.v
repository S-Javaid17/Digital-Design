`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 07:21:06 AM
// Design Name: 
// Module Name: adder_subtractor_4bit
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

// 4 bit for simplicity, will be based on rca_4bit
module adder_subtractor_4bit(
    input [3 : 0] x, y,
    input add_n, //cctrl signal asserts add at low
    output [3:0] s,
    output c_out  //for adder part
    );
    
    wire [3:0] xored_y;  //internal node
    assign xored_y[0] = y[0] ^ add_n;
    assign xored_y[1] = y[1] ^ add_n;
    assign xored_y[2] = y[2] ^ add_n;
    assign xored_y[3] = y[3] ^ add_n;

      rca_nbit A0 ( //def. 4 bit
          .x(x),
          .y(xored_y),
          .c_in(add_n),
          .s(s),
          .c_out(c_out)
      );
endmodule
