//selector2
module sel2(a, b, sel, c);
		input [23:0] a,b;
		input sel;
		output [23:0] c;

		assign c = (sel)? a:b;
	
endmodule
