`timescale 1ps/1ps

module test;
	reg clk, rst_n;

parameter STEP = 10;

always #(STEP/2) clk =~ clk;



top t0(clk, rst_n);

initial begin

	$dumpfile("test.vcd");
	$dumpvars(0,t0);
	$dumplimit(1000000000000);
	clk = 0;
	rst_n = 0;
#STEP
	rst_n = 1;
#STEP
	rst_n = 1;
#(STEP * 100000);

$finish;

end

endmodule
