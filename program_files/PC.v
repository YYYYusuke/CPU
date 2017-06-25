module programcounter(PC_in, clk, PC_out,rst_n,we);
		input wire [7:0] PC_in;
		input wire we,clk,rst_n;
		output  [7:0] PC_out;

		reg [7:0] PC_out;


		always @(posedge clk) begin
			if (!rst_n) begin
				PC_out <= 0;
			end else begin
				if(we )begin
					PC_out <= PC_in;
				end else begin
					PC_out <= PC_out + 1;
				end
			end
end
endmodule

