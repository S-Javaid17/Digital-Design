`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 10:45:45 PM
// Design Name: 
// Module Name: comb_block_nonblock
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

//blocking and non blocking assignments, using comb. circuits
module comb_block_nonblock(
        input a, b, c,
        output reg x
    );
    
    always @(a, b, c) // comment out one block to run code
    begin  
           x = a; // this is a blocking assignment, also called an immediate assignment,
           //it will block the assignment of x^b to the new x, unless the first statement (x=a) is executed before
           x = x ^ b; //Thus, this is the same as x = a^b, since the prev. value updates first, the next assignment to x is BLOCKED unless this one executes first
           x = x | c; //  same as x = (a^b) |c
           
           //Non Blocking
           
           x <= a; // a NB assignment, also called deferred assignment
           //a will only be assigned to x at the very END of the always block
           x <= x ^ b; //BUT, we can see that this statement overrides the previous one,----
           //---- since it will be executed at the end now (imagining this is the end of the always block)
           x <= x | c; //In reality, only this statement will be executed, the x on the RHS will hold the value of x BEFORE the always block, since it wasn't assigned an immed. value in here
           // as such, it will be a feedback loop of an OR gate, where the x output connects back to the x input
           //we can't have cyclic blocks in comb. circuits, and hence shouldn't use NB assignments for them
    end
    
endmodule
