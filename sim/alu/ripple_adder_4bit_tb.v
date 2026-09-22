module ripple_adder_4bit_tb;
	reg [3:0] a, b;
	reg cin;
	wire [3:0] sum;
	wire cout;

	ripple_adder_4bit uut (.a(a), .b(b), .cin(cin),
	 .sum(sum), .cout(cout));

	initial begin
		$dumpfile("waveform.vcd");
		$dumpvars(0, ripple_adder_4bit_tb);

		a = 4'b0000; b = 4'b0000; cin = 0; #10;
                a = 4'b1111; b = 4'b1111; cin = 1; #10;

                a = 4'b0001; b = 4'b0001; cin = 0; #10;
                a = 4'b0010; b = 4'b0010; cin = 0; #10;
                a = 4'b0100; b = 4'b0100; cin = 0; #10;
                a = 4'b1000; b = 4'b1000; cin = 0; #10;

                a = 4'b0000; b = 4'b0000; cin = 1; #10;
                a = 4'b1111; b = 4'b0001; cin = 0; #10;

		$finish;
	end
endmodule
