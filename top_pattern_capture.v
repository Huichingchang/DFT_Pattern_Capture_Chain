module top_pattern_capture(
	input wire clk,
	input wire rst,
	input wire scan_enable,
	output wire [3:0] scan_out,
	output wire [3:0] captured_data
);

// 4-bit pattern generator
wire [3:0] pattern;
	
pattern_gen u_pattern_gen(
		.clk(clk),
		.rst(rst),
		.pattern(pattern)
	);

// scan chain	
wire [3:0] scan_q;
	
scan_chain u_scan_chain(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_enable),
		.scan_in(pattern[0]), //使用pattern的最低為當作scan_in
		.d(pattern),
		.q(scan_q)
);

//capture block (bo be implemented)	
capture_block u_capture_block(
		.clk(clk),
		.rst(rst),
		.scan_q(scan_q),
		.captured(captured_data)
);
	
assign scan_out = scan_q;
endmodule
