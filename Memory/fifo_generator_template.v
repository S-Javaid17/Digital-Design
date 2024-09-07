`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 11:15:07 AM
// Design Name: 
// Module Name: fifo_generator_template
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


module fifo_generator_template(

    );
    
  fifo_generator_0 your_instance_name (
      .clk(clk),      // input wire clk
      .srst(srst),    // input wire srst
      .din(din),      // input wire [7 : 0] din
      .wr_en(wr_en),  // input wire wr_en
      .rd_en(rd_en),  // input wire rd_en
      .dout(dout),    // output wire [7 : 0] dout
      .full(full),    // output wire full
      .empty(empty)  // output wire empty
);
endmodule
