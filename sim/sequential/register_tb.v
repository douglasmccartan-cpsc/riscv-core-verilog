module register_tb;

	parameter WIDTH = 8;
	
	reg clk;
	reg en;
	reg rst;
	reg [WIDTH-1:0] d;
	wire [WIDTH-1:0] q;

	register #(.WIDTH(WIDTH)) uut (.clk(clk), .en(en), .rst(rst), .d(d), .q(q));
	
	always #10 clk = ~clk;

	initial begin
		clk = 0;
		en = 0;
		rst = 1;
		d = 0;
	
		$dumpfile("waveform.vcd");
		$dumpvars(0, register_tb);


		d = 8'b11001010;
		
		@(posedge clk); 
		#1; if (q == 0) begin $display("expected result"); end
		
		@(negedge clk);
		en = 1;
		rst = 0;

		@(posedge clk);
		#1; if (q == 8'b11001010) begin $display("expected result"); end 
		
		$finish;
	end
endmodule
