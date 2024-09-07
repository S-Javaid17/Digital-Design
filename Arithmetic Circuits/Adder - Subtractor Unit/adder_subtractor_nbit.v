`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 08:12:15 AM
// Design Name: 
// Module Name: adder_subtractor_nbit
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

//Generalized n bit adder subtractor
module adder_subtractor_nbit
    #(parameter n = 4)
    (
        input [n - 1 : 0] x, y,
        input add_n, //ctrl signal asserts add at low
        output [n - 1 : 0] s,
        output c_out  //for adder part
    );
    
    wire [n - 1 : 0] xored_y;  //xor of each y input
        generate// to generate an xor circuit for each input y
            genvar k;
            for (k = 0; k < n; k = k + 1)
                begin: node
                assign xored_y[k] = add_n ^ y[k];
                end
        endgenerate
        
      rca_nbit #(.n(n)) A0 ( //Will pass OUR n as the parameter
          .x(x),
          .y(xored_y),
          .c_in(add_n),
          .s(s),
          .c_out(c_out)
      );
endmodule
