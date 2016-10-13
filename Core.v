`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Trevor Overby
// 
// Create Date:    14:28:26 10/13/2016 
// Design Name: 	 Burn Rubber CPU CORE
// Module Name:    Core 
// Project Name:	 Burn Rubber
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: partial Immplementation 
//
//////////////////////////////////////////////////////////////////////////////////
module Core(
input clk,
input [15:0] instra,
output reg[15:0] memOut
);

//instruction OpCodes
parameter [3:0]
store = 4'd1,
load = 4'd2,
add = 4'd3,
addi = 4'd4,
sub = 4'd5;

always@(posedge clk)begin

//switch case
case (instra[3:0])
	store:
		memOut <= 16'd3; //test
	load:;
	add:;
	addi:;
	sub:;
	default:
		memOut <= 16'd4; //test
endcase
end
endmodule
