`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 08:50:27 AM
// Design Name: 
// Module Name: bram_synch_dual_port
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

//strictly follow these guidelines, --> synchronous dual port bram
//both ports are read and write
module bram_synch_dual_port
#(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)
    (
        input clk,//synch
        input we_a,we_b,//write enables for respective ports
        input [ADDR_WIDTH - 1: 0] addr_a,addr_b,//address of port a and b
        input [DATA_WIDTH - 1: 0] din_a, din_b,//data write
        output reg [DATA_WIDTH - 1: 0] dout_a, dout_b//data read, synch
   );
   
   reg [DATA_WIDTH - 1: 0] memory [0: 2**ADDR_WIDTH - 1];//memory
    
                                                    //port a
    always @(posedge clk)//synch read and write
    begin
        if(we_a)
            memory[addr_a] <= din_a;
        dout_a <= memory[addr_a];
    end
                                                    //port b
    always @(posedge clk)
    begin
        if(we_b)
            memory[addr_b] <= din_b;
        dout_b <= memory[addr_b];
    end                                            
endmodule
