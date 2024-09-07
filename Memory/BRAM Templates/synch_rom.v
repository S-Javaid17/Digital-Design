`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 09:34:47 AM
// Design Name: 
// Module Name: synch_rom
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

//a synch. rom, only synch because we want to use a synch. BRAM
//uses BRAM, strictly follow this template
module synch_rom
#(parameter ADDR_WIDTH = 3, DATA_WIDTH = 2)    
    (
    input clk,
    input [ADDR_WIDTH - 1: 0] addr,
    output reg [DATA_WIDTH - 1: 0] data
    );
    
    (*rom_style = "block"*) reg [DATA_WIDTH - 1: 0] rom [0: 2 ** ADDR_WIDTH - 1];//rom memory
     //have to use a "Synthesizer Directive", -->(*rom_style = "block"*), goes before reg, and lets vivado know to use BRAM

    
    initial
   //system function
    $readmemb("truth_table.mem", rom);  
        //read the memory file --> truth_table.mem, and store it in the memory array called 'rom'
    //can parameterize the file
    
    //read only, synch
     always@(posedge clk)
         data <= rom[addr];//read port
endmodule