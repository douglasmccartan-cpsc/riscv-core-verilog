module register #(parameter WIDTH = 8) (

	input clk,
	input rst,
	input en,
	input [WIDTH-1:0] d,
	output reg [WIDTH-1:0] q
);

always @(posedge clk) begin
	if (en && !rst) begin
		q <= d;
	end else if (rst) begin
		q <= 0;
	end
end

endmodule


