`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:37 09/13/2016 
// Design Name: 
// Module Name:    VGA_Counters 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

/* VGA Timing Parameters -- see tinyvga.com for more information
 * 
 * WIDTH: bits in register hcount & vcount
 * H_VISIBLE: horizontal size of visible area 
 * H_FRONT: horizontal front porch of pulse
 * H_BACK: horizontal back porch of pulse
 * LINE: horizontal max size of value
 * V_VISIBLE: vertical size of visible area 
 * V_FRONT: vertical front porch of pulse
 * V_BACK: vertical back porch of pulse
 * FRAME: vertical max size of value
 * H_PULSE: horizontal synchronous pulse (0 - inactive, 1 - active) 
 * V_PULSE: vertical synchronous pulse (0 - inactive, 1 - active)
 */
module VGA_Counters
#(
  parameter 
  WIDTH = 12, 
  H_VISIBLE = 0, 
  H_FRONT = 0, 
  H_BACK = 0, 
  LINE = 0, 
  V_VISIBLE = 0, 
  V_FRONT = 0, 
  V_BACK = 0, 
  FRAME = 0, 
  H_PULSE  = 1'b0, 
  V_PULSE = 1'b0
)(
	input clock,
  input pixelClock,
	output wire hsync,
	output wire vsync,
	output reg [WIDTH - 1:0] hcount,
	output reg [WIDTH - 1:0] vcount,
	output wire state
);

initial 
begin
	hcount <= 0;
	vcount <= 0;
end

always @ (posedge clock)
begin
  if (pixelClock)
  begin
    hcount <= (hcount == (LINE -1)) ? 1'b0 : hcount + 1'b1;
    if (hcount == (LINE - 1)) 	
	    vcount <= (vcount == (FRAME - 1)) ? 1'b0 : vcount + 1'b1;
  end
  
end

// hsync & vsync & state
assign hsync = ((hcount >= H_FRONT + H_VISIBLE) && (hcount < LINE  - H_BACK)) ? H_PULSE : !H_PULSE;
assign vsync = ((vcount >= V_FRONT + V_VISIBLE) && (vcount < FRAME - V_BACK)) ? V_PULSE : !V_PULSE;
assign state = ((hcount < H_VISIBLE) & (vcount < V_VISIBLE));

endmodule
