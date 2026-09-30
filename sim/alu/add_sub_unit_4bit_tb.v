module add_sub_unit_4bit_tb;
	reg [3:0] a, b;
	reg sub;
	wire [3:0] sum;
	wire cout;

	add_sub_unit_4bit uut (.a(a), .b(b), .sub(sub), 
	.sum(sum), .cout(cout));

	initial begin
		$dumpfile("waveform.vcd");
		$dumpvars(0, add_sub_unit_4bit_tb);

		a = 4'b0000; b = 4'b0000; sub = 0; #10;
                a = 4'b1111; b = 4'b0001; sub = 0; #10;
                a = 4'b0000; b = 4'b0101; sub = 0; #10;
                a = 4'b1000; b = 4'b0111; sub = 0; #10;
                a = 4'b1111; b = 4'b1111; sub = 0; #10;

                a = 4'b0000; b = 4'b0000; sub = 1; #10;
                a = 4'b1111; b = 4'b0001; sub = 1; #10;
                a = 4'b0000; b = 4'b0101; sub = 1; #10;
                a = 4'b1000; b = 4'b0111; sub = 1; #10;
                a = 4'b1111; b = 4'b1111; sub = 1; #10;

		$finish;
	end
endmodule
