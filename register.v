module regfile(we, dst, src0, src1, data, outa, outb, clk, rst_n);
		input [3:0] dst, src0, src1;
		input [23:0] data;
		input clk, rst_n;
		input we;

		output [23:0] outa, outb;

		reg [23:0] regis [15:0];
		wire[23:0] reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15;
always @(posedge clk) begin
	if (!rst_n) begin
		regis[0] <= 24'b1001_0000_0001_0001_0000_0000;//blue
		regis[1] <= 24'b0100_0000_1100_0000_0010_0000;//orange
		regis[2] <= 24'b0010_1000_0000_1000_1000_0000;//yellow
		regis[3] <= 0;  //dont never use this regis
		regis[4] <= 0;
		regis[5] <= 0;
		regis[6] <= 24'b000_000_000_000_000_000_000_000; //procedure1
		regis[7] <= 24'b000_111_110_101_100_011_010_001; //procedure2
		regis[8] <= 0; //for reference
		regis[9] <= 24'b0010_0000_0000_0000_0000_0000; //jyoui add(1)
		regis[10] <= 0; 
		regis[11] <= 0;
		regis[12] <= 24'b0000_0000_0000_0000_0000_0001; //kai add(1)
		regis[13] <= 0; // for memory of blue
		regis[14] <= 1; // for memory of orange
		regis[15] <= 2; // for memory of yellow
	end else begin
		if (we) begin
			regis[dst] <= data;
		end else begin
			regis[dst] <= regis[dst];
		end
	end
end

assign outa =regis[src0];
assign outb =regis[src1];
assign reg0 = regis[0];
assign reg1 = regis[1];
assign reg2 = regis[2];
assign reg3 = regis[3];
assign reg4 = regis[4];
assign reg5 = regis[5];
assign reg6 = regis[6];
assign reg7 = regis[7];
assign reg8 = regis[8];
assign reg9 = regis[9];
assign reg10 = regis[10];
assign reg11 = regis[11];
assign reg12 = regis[12];
assign reg13 = regis[13];
assign reg14 = regis[14];
assign reg15 = regis[15];

endmodule
