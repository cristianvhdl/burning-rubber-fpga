`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:57 10/13/2016
// Design Name:   Core
// Module Name:   /home/overby/BurnRubber/CORE_Test.v
// Project Name:  BurnRubber
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CORE_Test;

	// Inputs
	reg [15:0] instra;

	// Outputs
	wire [15:0] memOut;
	reg clk;
	// Instantiate the Unit Under Test (UUT)
	Core uut (
		.instra(instra),
		.clk(clk),		
		.memOut(memOut)
	);

	initial begin
		// Initialize Inputs
		instra = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 1'b1;
      instra = 16'd1;
		#100;
		clk = 1'b0;
	end
      
endmodule

