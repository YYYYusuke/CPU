`timescale 1ps/1ps

module test;
	reg clk, rst_n;
	wire [23:0] mem0,mem1,mem2,mem3;
	wire [23:0] reg0,reg1,reg2,reg6;
parameter STEP = 10;

always #(STEP/2) clk =~ clk;



top t0(clk, rst_n,mem0,mem1,mem2,mem3,reg0,reg1,reg2,reg6);

initial begin

//	$dumpfile("test.vcd");
//	$dumpvars(0,t0);
//	$dumplimit(10000000);
	clk = 0;
	rst_n = 0;

//	if( reg6 == 24'b1110_0000_0000_0000_0000_0000) begin
		$monitor($stime,": mem0:%b,mem1:%b,mem2:%b,mem3:%b",mem0,mem1,mem2,mem3);
//	end

#STEP
	rst_n = 1;
#STEP
	rst_n = 0;
#STEP
	rst_n = 1;
#(STEP * 100000000000);

$finish;

end

endmodule
