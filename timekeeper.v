module timekeeper (
	input clk,    // Clock
	output[15:0] cur_time	
);
reg[15:0] mytime=0;

always@(posedge clk)begin
	if(mytime == 65535) mytime = 0;
	else mytime = mytime + 1;
end

assign cur_time = mytime;

endmodule
