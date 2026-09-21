module mux2to1_tb;
	reg a, b, sel;
	wire out;

	mux2to1 uut (.a(a), .b(b), .sel(sel), .out(out));

	initial begin
		$dumpfile("waveform.vcd");
		$dumpvars(0, mux2to1_tb);


		a = 0; b = 0; sel = 0; #10;
		a = 1; b = 0; sel = 0; #10;
		a = 0; b = 1; sel = 0; #10;
		a = 1; b = 1; sel = 0; #10;

		a = 0; b = 0; sel = 1; #10;
                a = 1; b = 0; sel = 1; #10;
                a = 0; b = 1; sel = 1; #10;
                a = 1; b = 1; sel = 1; #10;

		$finish;
	end
endmodule
