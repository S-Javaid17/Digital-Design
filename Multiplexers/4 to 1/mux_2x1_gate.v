`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 07:23:23 PM
// Design Name: 
// Module Name: mux_2x1_gate
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

//STRUCTURAL modelling pt.1  - We're describing the structure of the circuit, not the behaviour
module mux_2x1_gate(  //Gate level modelling of a 2-1 mux
input x1, x2, s,
output f
    );
  //  not (sn, s);  Don't really need this line.. use ~
    and A0(g0, x1, ~s);
    and A1 (g1,  s, x2);  //where g0 and g1 are the two AND gates
    or Output(f, g0, g1);
endmodule
