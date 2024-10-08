`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 03:52:15 PM
// Design Name: 
// Module Name: uart_rx
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


module uart_rx
#(parameter DBIT = 8,    //number of data bits
            SB_TICK = 16 //one stop bit = 16 counts 
)   
    (
     input clk, reset_n,
     input s_tick, rx,
     output reg rx_done_tick,
     output [DBIT - 1: 0] rx_dout
    );
    
    //states
    localparam idle = 0, start = 1, 
               data = 2, stop = 3;
               
   reg [1:0] state_reg, state_next; //state registers
   reg [3: 0] s_reg, s_next;// stores the number of baud rate "s_tick"s that've occured, 16 total
   reg [$clog2(DBIT) - 1: 0] n_reg, n_next;// stores the number, of bits that've been shifted in
   reg [DBIT - 1: 0] b_reg, b_next;//stores the actual data bits, that've been shifted in
   
                                                //register logic   
 always @(posedge clk, negedge reset_n)
 begin
    if (~reset_n)
        begin
        state_reg <= idle;//want it to be in idle state as default
        s_reg <= 0;
        n_reg <= 0;
        b_reg <= 0;
        end
   else
        begin   
        state_reg <= state_next;
        s_reg <= s_next;
        n_reg <= n_next;
        b_reg <= b_next;
        end
 end  
 
                                                //next state logic   
                                                
 always @(*)
 begin
    state_next = state_reg;//default
    s_next = s_reg;
    n_next = n_reg;
    b_next = b_reg;
    rx_done_tick = 1'b0;//don't send a done signal as default
    case(state_reg)
        idle: if(~rx)//no else statement because default value covers that, same with other cases
              begin  
                s_next = 0;
                state_next = start;
              end  
        start: if (s_tick)
                    if(s_reg == 7)
                        begin
                            s_next = 0;
                            n_next = 0;
                            state_next = data;
                        end
                    else
                            s_next = s_reg + 1;
        data: if (s_tick)
                    if(s_reg == 15)
                        begin
                            s_next = 0;
                            b_next = {rx, b_reg[DBIT - 1: 1]};// shift right
                                if (n_reg == (DBIT - 1))
                                    state_next = stop;
                                else
                                    n_next = n_reg + 1;
                        end
                    else
                            s_next = s_reg + 1;
        stop: if (s_tick)
                    if(s_reg == (SB_TICK - 1)) 
                        begin
                           rx_done_tick = 1'b1;
                           state_next = idle; 
                        end
                    else 
                            s_next = s_reg + 1;
        default: 
            state_next = idle;
    endcase
 end
                                                //output logic
  assign rx_dout = b_reg;                                           
endmodule

