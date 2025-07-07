/*
*
*	clock_div.v - clock divider
*	© s0ssh 2025
*
*/

module clock_div #(
	parameter	COUNT_MAX	= 25_000_000 - 1
) (
	input		clk_in,
	input		rst_in,

	output	reg	clk_out
);

reg							div;
reg	[$clog2(COUNT_MAX)-1:0]	count;

always @ (posedge clk_in or posedge rst_in) begin
	if (rst_in == 1'b1) begin
		count <= 0;
		clk_out <= 0;
	end else if (count == COUNT_MAX) begin
		count <= 0;
		clk_out <= ~clk_out;
	end else begin
		count <= count + 1;
	end
end

endmodule
