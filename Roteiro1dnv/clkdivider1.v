module clkdivider1 (
    input clk,
    input rst,
    output reg clk_div_1
);

 localparam constNumber = 2;

 reg [31:0] count;
  
 always @ (posedge(clk), posedge(rst)) begin
  if (rst == 1'b1)
   count <= 32'b0;
  else if (count == constNumber - 1)
   count <= 32'b0;
  else
   count <= count + 1;
 end


 always @ (posedge(clk), posedge(rst)) begin
	
  if (rst == 1'b1)
  
   clk_div_1 <= 1'b0;
   
  else if (count == constNumber - 1)
  
   clk_div_1 <= ~clk_div_1;
   
  else
  
   clk_div_1 <= clk_div_1;
   
 end

endmodule