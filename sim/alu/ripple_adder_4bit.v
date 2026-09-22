module ripple_adder_4bit(
        input [3:0] a,
        input [3:0] b,
        input cin,
        output [3:0] sum,
        output cout
);

wire carry_1, carry_2, carry_3;

full_adder adder_bit0 (.a(a[0]), .b(b[0]), .cin(cin),
 .cout(carry_1), .sum(sum[0]));

full_adder adder_bit1 (.a(a[1]), .b(b[1]), .cin(carry_1),
 .cout(carry_2), .sum(sum[1]));

full_adder adder_bit2 (.a(a[2]), .b(b[2]), .cin(carry_2),
 .cout(carry_3), .sum(sum[2]));

full_adder adder_bit3 (.a(a[3]), .b(b[3]), .cin(carry_3),
 .cout(cout), .sum(sum[3]));
 
endmodule
