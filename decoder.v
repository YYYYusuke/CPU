module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);

input wire [31:0] op;
input wire zf;

output reg [7:0] pc_in;
output reg pc_we, reg_we;
output reg [3:0] src0, src1, dst;
output reg sel1,sel2;
output reg [23:0] data;
output reg [3:0] alu_op;
output reg mem_we;

`include "def.h"

always @(*) begin
//synopsys parallel_case full_case
	case (op[31:28]) 
/*	AND : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[23:20];
		src0 <= op[19:16];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end
*/
	STORE : begin
		alu_op <= op[31:28];
		dst <= 0;
		src1 <= op[27:24];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 1;
	end
/*
	OR : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[23:20];
		src0 <= op[19:16];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
	end

	ADD : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[23:20];
		src0 <= op[19:16];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	SUB : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[23:20];
		src0 <= op[19:16];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end
*/

	ADD : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[23:20];
		src0 <= op[19:16];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end

	CHECK : begin
		alu_op <= op[31:28];
		dst <= 0;
		src1 <= op[27:24];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 0;
		sel1 <= 1;
		sel2 <= 0;
		data <= op[23:0];
		mem_we <= 0;
	end

	JMP : begin
		alu_op <= op[31:28];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pc_in <= op[27:20];
		pc_we <= 1;
		reg_we <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	JNZ : begin
		alu_op <= op[31:28];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pc_in <= op[27:20];
		pc_we <= zf;
		reg_we <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end


	ZNJ : begin
		alu_op <= op[31:28];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pc_in <= op[27:20];
		pc_we <= ~zf;
		reg_we <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end


	LI : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= 0;
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 1;
		sel2 <= 1;
		data <= op[23:0];
		mem_we <= 0;
	end

	
	RTX90 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end

	RTX180 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end

	RTX270 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end
	RTY90 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end
	RTY180 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end
	RTY270 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end
	RTZ90 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end
	RTZ180 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end
/*	RTZ270 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[19:16];
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end*/
	REFERENCE : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= 0;
		src0 <= op[23:20];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end

	default : begin
		pc_we <= 0;
	end

	endcase

end
endmodule
