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


		// test q (output) what happens through a cycle when en=1, rst=0 and d input

		d = 8'b11001010;
		
		@(posedge clk); 
		#1; if (q == 0) begin $display("expected result"); end
		else begin $display("fail"); end
		
		@(negedge clk);
		en = 1;
		rst = 0;

		@(posedge clk);
		#1; if (q == 8'b11001010) begin $display("expected result"); end
		else begin $display("fail"); end 

		// test register still holds q while en=0, rst=0

		@(posedge clk);
		#1; if (q == 8'b11001010) begin $display("expected result"); end
		else begin $display("fail"); end

		@(negedge clk);
		d = 8'b10101010;
		en = 0;
		rst = 0;

		@(posedge clk);
		#1; if (q == 8'b11001010) begin $display("expected result"); end
		else begin $display("fail"); end
		
		// synchronous reset check

		@(negedge clk);
		rst = 1;
		#1; if (q == 8'b11001010) begin $display("expected result"); end
		else begin $display("fail"); end
		
		@(posedge clk);
		#1; if (q == 0) begin $display("expected result"); end
		else begin $display("fail"); end
		
		@(negedge clk);
		rst = 0;
		
		@(posedge clk);
		#1; if (q == 0) begin $display("expected result"); end
		else begin $display("fail"); end

		// test q (output) what happens through a cycle when en=1, rst=1 and d input

                @(negedge clk);
		d = 8'b11001111;
                en = 1;
                rst = 1;

                @(posedge clk);
                #1; if (q == 8'b00000000) begin $display("expected result"); end
		else begin $display("fail"); end

		
		$finish;
	end
endmodule
