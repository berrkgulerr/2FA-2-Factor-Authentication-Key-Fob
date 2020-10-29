module rtcClkDivider (
	input sys_clk,    // 1 MHz
	output clk_500Hz, // 500 Hz
	output clk_5s  // 0.2 Hz
);

parameter KEYCHANGE_PERIOD = 5;  // DO NOT CHANGE THE NAME OF THIS PARAMETER 
// AND MAKE SURE TO USE THIS PARAMETER INSTEAD OF HARDCODING OTHER VALUES

reg[10:0] counter1 = 0;
reg[127:0] counter2 = 0;
reg clk1 = 0;
reg clk2 = 0;

parameter max1 = 1000;
parameter max2 = 1000000 * KEYCHANGE_PERIOD / 2;
always@(posedge sys_clk)begin
	if(counter1 == max1-1)begin
		counter1 <= 0;
		clk1 <= ~clk1;
	end
	else counter1 <= counter1 + 1;
	
	if(counter2 == max2-1)begin
		counter2 <= 0;
		clk2 <= ~clk2;
	end
	else	counter2 <= counter2 + 1;
end	

assign clk_500Hz = clk1;
assign clk_5s = clk2;

endmodule
