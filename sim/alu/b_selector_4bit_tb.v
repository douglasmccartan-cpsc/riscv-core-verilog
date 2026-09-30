module b_selector_4bit_tb;
	reg [3:0] b;
	reg sel;
	wire [3:0] out;

	b_selector_4bit uut (.b(b), .sel(sel), .out(out));

	initial begin
		$dumpfile("waveform.vcd");
		$dumpvars(0, b_selector_4bit_tb);

		b = 4'b0101; sel = 0; #10;
		b = 4'b0101; sel = 1; #10;

		$finish;
	end
endmodule
	
