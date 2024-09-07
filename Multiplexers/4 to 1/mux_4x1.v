`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 08:45:43 PM
// Design Name: 
// Module Name: mux_4x1
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

// Will create a 4x1 mux by instantiating the 2x1 mux's we created
//Applying concepts of hierarchy, Video 9
module mux_4x1(
    input x0, x1, x2, x3,
    input s0, s1,
    output f 
        );
    // We will instantiate the 2x1 mux
    wire g0, g1; // not necessarily needed because it's one wire and not a bus, but we'll use it anyway (node)
    
    mux_2x1_gate M0 (x0, x1, s0, g0);    //instantiation using ordered port connection
   
    mux_2x1_dataflow M1 (  // named port connection is safer  .OriginalModuleName(InstantiationName); 
        .x1(x2), 
        .x2(x3), 
        .s(s0), 
        .f(g1)
     );  
    mux_2x1_beh M2 (  //Third mux that connects to the past two ones
        .x1(g0), 
        .x2(g1), 
        .s(s1), 
        .f(f)
    );  
    //These can be instantiated in any order, not within an always statement and it's comb. logic
endmodule
