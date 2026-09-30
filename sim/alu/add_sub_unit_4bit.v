module add_sub_unit_4bit(
	input [3:0] a,
	input [3:0] b,
	input sub,
	output [3:0] sum,
	output cout
);

wire [3:0] b_select;

b_selector_4bit selector (.b(b), .sel(sub), .out(b_select));

ripple_adder_4bit adder (.a(a), .b(b_select), .cin(sub),
 .sum(sum), .cout(cout));

endmodule 
