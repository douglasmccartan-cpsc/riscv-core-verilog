module mux2to1(
	input a,
	input b,
	input sel,
	output out
);
	assign out = sel ? b : a;
endmodule
