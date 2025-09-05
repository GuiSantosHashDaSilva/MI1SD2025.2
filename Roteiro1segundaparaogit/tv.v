module tv (
	input [9:0] CH, //chaves
	input clock, //clock50
	input reset, //botao reset
	output wire hsync,
	output wire vsync,
	output [7:0] red,
	output [7:0] green,
	output [7:0] blue,
	output sync,
	output clk,
	output blank
);
	wire [7:0] color;
	assign color[0] = CH[0];
	assign color[1] = CH[1];
	assign color[2] = CH[2];
	assign color[3] = CH[3];
	assign color[4] = CH[4];
	assign color[5] = CH[5];
	assign color[6] = CH[6];
	assign color[7] = CH[7];
	
	reg clk_div_reg = 0;
	always @(posedge clock) clk_div_reg <= ~clk_div_reg;
	assign clk25 = clk_div_reg;
	
	vga_module (
		.clock(clk25), //input25
		.reset(!reset), //botao
		.color_in(color), //chaves
		.next_x(),
		.next_y(),
		.hsync(hsync),
		.vsync(vsync),
		.red(red),
		.green(green),
		.blue(blue),
		.sync(sync),
		.clk(clk25),
		.blank(blank)
	);
endmodule