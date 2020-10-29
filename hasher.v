module hasher (
	input clk,    // Clock
	input [15:0] cur_time,
	input [15:0] student_id,
	output [15:0] cur_hash	
);

reg[15:0] prev_hash;
reg[15:0] hash;

initial begin
	prev_hash = 0;
	hash = 0;
end

always@(posedge clk) begin
	hash = ((((cur_time ^ student_id) - prev_hash) * ((cur_time ^ student_id) - prev_hash)) >> 8) & 65535;
	prev_hash = hash;
end

assign cur_hash = hash;
endmodule
