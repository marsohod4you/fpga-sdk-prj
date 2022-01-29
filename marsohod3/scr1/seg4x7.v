module seg4x7(
	input		wire	clk,			// 20MHZ
	input		wire	[31:0] in,
	output	reg	[3:0] digit_sel,
	output	reg	[7:0] out
);

reg     [19:0] cnt;
always @ (posedge clk)
	cnt <= cnt +1'b1;

wire [1:0]digit_idx; assign digit_idx = cnt[17:16];
reg [31:0]in_fixed;
always @ (posedge clk)
begin
	digit_sel <= 4'b0001 << digit_idx;
	in_fixed <= in;
	out <= in_fixed >> (digit_idx*8);
end

endmodule
