module top (
    input sysclk,    // 1 MHz
    input button_in,
    input [15:0] student_id,
    output[3:0] D5_out,
    output[3:0] D4_out,
    output[3:0] D3_out,
    output[3:0] D2_out,
    output[3:0] D1_out
);

wire clk_5s=0;
wire clk_500Hz=0;
wire [15:0]cur_time;
wire [15:0]cur_hash;
wire button_out;

rtcClkDivider newclk(sysclk, clk_500Hz, clk_5s);

timekeeper newtime(clk_5s, cur_time);

hasher newhash(clk_5s, cur_time, student_id, cur_hash);

buttonFsm newbutton(clk_500Hz, button_in, button_out);

b16toBCD newBCD(cur_hash, button_out, D5_out, D4_out, D3_out, D2_out, D1_out);

endmodule
