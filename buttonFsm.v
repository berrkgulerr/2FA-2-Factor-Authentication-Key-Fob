module buttonFsm (
	input clk,
	input button,    
	output stateful_button
);

reg[1:0] state=0;
reg[1:0] nextstate=0;
reg out=0;
parameter S0=0, S1=1, S2=2, S3=3;

always@(posedge clk)begin
	state <= nextstate;
end

always@(state or button)begin
	case(state)
		S0: if(button)begin
				out = 1; nextstate = S3; 
			 end
			 else begin
				out = 0; nextstate = S0;
			 end
		S1: if(button)begin
				out = 0; nextstate = S2; 
			 end
			 else begin
				out = 1; nextstate = S1;
			 end
		S2: if(button)begin
				out = 0; nextstate = S2; 
			 end
			 else begin
				out = 0; nextstate = S0;
			 end
		S3: if(button)begin
				out = 1; nextstate = S3; 
			 end
			 else begin
				out = 1; nextstate = S1;
			 end
	endcase

end

assign stateful_button = out;

endmodule
