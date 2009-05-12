////////////////////////////////////////////////////////////////////////////
////									////
//// t2600 IP Core	 						////
////									////
//// This file is part of the t2600 project				////
//// http://www.opencores.org/cores/t2600/				////
////									////
//// Description							////
//// VGA controller					 		////
////									////
//// TODO:								////
//// - Feed the controller with data					////
////									////
//// Author(s):								////
//// - Gabriel Oshiro Zardo, gabrieloshiro@gmail.com			////
//// - Samuel Nascimento Pagliarini (creep), snpagliarini@gmail.com	////
////									////
////////////////////////////////////////////////////////////////////////////
////									////
//// Copyright (C) 2001 Authors and OPENCORES.ORG			////
////									////
//// This source file may be used and distributed without		////
//// restriction provided that this copyright statement is not		////
//// removed from the file and that any derivative work contains	////
//// the original copyright notice and the associated disclaimer.	////
////									////
//// This source file is free software; you can redistribute it		////
//// and/or modify it under the terms of the GNU Lesser General		////
//// Public License as published by the Free Software Foundation;	////
//// either version 2.1 of the License, or (at your option) any		////
//// later version.							////
////									////
//// This source is distributed in the hope that it will be		////
//// useful, but WITHOUT ANY WARRANTY; without even the implied		////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR		////
//// PURPOSE. See the GNU Lesser General Public License for more	////
//// details.								////
////									////
//// You should have received a copy of the GNU Lesser General		////
//// Public License along with this source; if not, download it		////
//// from http://www.opencores.org/lgpl.shtml				////
////									////
////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module test_top(reset, clk_50, SW, VGA_R, VGA_G, VGA_B, LEDR, VGA_VS, VGA_HS);

input reset;
input clk_50;
input [8:0] SW;
output [3:0] VGA_R;
output [3:0] VGA_G;
output [3:0] VGA_B;
output [9:0] LEDR;
output VGA_VS;
output VGA_HS;

wire [479:0] line; 
wire [4:0] vert_counter;

	vga_controller vga_controller (
		.reset(reset),
		.clk_50(clk_50),
		.line(line),
		.SW(SW),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.LEDR(LEDR),
		.VGA_VS(VGA_VS),
		.VGA_HS(VGA_HS)
	);

	controller_test controller_test (
		.line(line),
		.vert_counter(vert_counter)
	);

endmodule
