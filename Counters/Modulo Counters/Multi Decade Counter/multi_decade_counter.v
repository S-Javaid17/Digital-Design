`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 02:06:06 AM
// Design Name: 
// Module Name: multi_decade_counter
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

// vid 35, diagram
//cascaded BCDs, can go from 000 ---> 999
module multi_decade_counter
    (
    input clk, reset_n, enable,
    output done,//to cascade it more, if necessary later
    output [3:0] ones, tens, hundreds// each is from 0-9, thus 4 bits each
    );
    
    wire done0, done1, done2;// done signals of respective BCDs, internal nodes
    wire a0, a1, a2;// AND gates
    
    BCD_counter D0(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .done(done0),
        .Q(ones)
    );
    
    assign a0 = done0 & enable;
    BCD_counter D1(
        .clk(clk),
        .reset_n(reset_n),
        .enable(a0),
        .done(done1),
        .Q(tens)
    );
    
    assign a1 = done1 & a0;
    BCD_counter D2(
        .clk(clk),
        .reset_n(reset_n),
        .enable(a1),
        .done(done2),
        .Q(hundreds)
    );
    
    assign a2 = done2 & a1;
    
    assign done = a2;
endmodule
