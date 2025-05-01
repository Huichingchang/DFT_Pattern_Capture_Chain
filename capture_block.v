module capture_block(
	input wire clk,
	input wire rst,
	input wire [3:0] scan_q, //來自scan_chain的輸出
	output reg [3:0] captured //儲存的結果
);

	always @(posedge clk or posedge rst) begin
	   if(rst) 
	     captured <= 4'b0000;
	   else
	     captured <= scan_q; //每個時脈把scan_q 鎖進captured
	end
endmodule
