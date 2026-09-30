module b_selector_4bit(
	input[3:0] b,
	input sel,
	output [3:0] out
);

	assign out = sel ? ~b : b;
endmodule

