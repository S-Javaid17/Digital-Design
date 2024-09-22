`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 06:11:04 PM
// Design Name: 
// Module Name: uart
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

//REFER TO ASMD IN NOTES
module uart
#(parameter DBIT = 8, SB_TICK = 16)    
    (
        input clk, reset_n,
        
        //receiver
         input rd_uart, 
         input rx,
         output rx_empty,
         output [DBIT - 1: 0] r_data,
         
        //transmitter
         input wr_uart, 
         output tx,
         output tx_full,
         input [DBIT - 1: 0] w_data,
            
        //baud rate generator
        input [10: 0] TIMER_FINAL_VALUE
    );
    
                                                //Timer for baud rate generation
                                                
   wire tick;                                             
   timer_input #(.BITS(11)) baud_rate_generator 
   (
        .clk(clk),
        .reset_n(reset_n),
        .enable(1'b1),
        .FINAL_VALUE(TIMER_FINAL_VALUE),
        .done(tick)
   );    
   
                                                     //Receiver  
   
   wire [DBIT - 1: 0] rx_dout;
   wire rx_done_tick;                                               
   uart_rx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) receiver 
   (
        .clk(clk), 
        .reset_n(reset_n),
        .s_tick(tick), 
        .rx(rx),
        .rx_done_tick(rx_done_tick),
        .rx_dout(rx_dout) 
   );
                                                    //FIFO for Rx   
                                                
   fifo #(
    .ADDR_WIDTH(1),    // Specify address width
    .DATA_WIDTH(8)     // Specify data width
) fifo_inst (
    .clk(clk),         // Clock signal
    .reset(~reset_n),     // Reset signal
    .w_data(rx_dout),   // Write data input
    .r_data(r_data),   // Read data output
    .wr(rx_done_tick),           // Write enable
    .rd(rd_uart),           // Read enable
    .full(),       // FIFO full output
    .empty(rx_empty)      // FIFO empty output
);    
   
                                                    //Transmitter   
   
   wire [DBIT - 1: 0] tx_din;
   wire tx_done_tick;
   wire tx_fifo_empty;                                              
   uart_tx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) transmitter 
   (
        .clk(clk), 
        .reset_n(reset_n),
        .s_tick(tick),
        .tx_start(~tx_fifo_empty), 
        .tx(tx),
        .tx_done_tick(tx_done_tick),
        .tx_din(tx_din)
   );  
   
                                                    //FIFO for Tx   
                                                
   fifo #(
    .ADDR_WIDTH(1),    // Specify address width
    .DATA_WIDTH(8)     // Specify data width
) fifo_inst (
    .clk(clk),         // Clock signal
    .reset(~reset_n),     // Reset signal
    .w_data(w_data),   // Write data input
    .r_data(tx_din),   // Read data output
    .wr(wr_uart),           // Write enable
    .rd(tx_done_tick),           // Read enable
    .full(tx_full),       // FIFO full output
    .empty(tx_fifo_empty)      // FIFO empty output
);
                                                                                 
endmodule
