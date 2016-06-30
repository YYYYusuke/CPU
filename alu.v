module alu(ina, inb, op, zf, out);
	input wire [23:0] ina, inb;
	input wire [3:0] op;
	output reg zf;
	output reg [23:0] out;


parameter [3:0] /*AND = 4'h0, OR = 4'h1,*/ ADD = 4'h2, /*SUB = 4'h3, INC = 4'h4,/* DEC= 4'h5, COMP = 4'h6,*/ CHECK =4'h7,/* LOAD = 4'h8,*/ STORE = 4'h9, LI = 4'ha,RTX90 = 4'hb,RTX180 = 4'hc,RTX270 = 4'hd,RTY90 = 4'he,RTY180 = 4'hf,RTY270 = 4'h5,RTZ90 = 4'h4,RTZ180 = 4'h3,REFERENCE = 4'h8;//RTZ270 = 4'h2; //jump jnz znj mo aru
 
always @(*) begin
	case (op)
/*	AND : begin
		out <= ina & inb;
		zf <= 0;
	end

	OR :begin
		out <= ina | inb;
		zf <= 0;
	end

	ADD :begin
		out <= ina + inb;
		zf <= 0;
	end
	
	SUB :begin
		out <= ina - inb;
		zf <= 0;
	end

	INC :begin
		out <= ina + 1;
		zf <= 0;
	end

	DEC :begin
		out <= ina - 1;
		zf <= 0;
	end

*/
	
	ADD :begin
		out <= ina + inb;
		zf <= 0;
	end
/*	COMP :begin
		zf <= (ina == inb)?1:0;
	end
*/

	CHECK :begin
		zf <= (ina == inb)?1:0;
	end

/*
	LOAD :begin
		out <= ina ;
		zf <= 0;
	end
*/
	STORE :begin
		out <= ina ;
		zf <= 0;
	end

	LI :begin
		out <= ina ;
		zf <= 0;
	end



	RTX90 :begin
		out <= {ina[23:18],ina[7],ina[17],ina[0],ina[15],ina[12],ina[9],ina[11],ina[14],ina[6],ina[8],ina[3],ina[13],ina[5:4],ina[16],ina[2:1],ina[10]};
		zf <= 0;
	end
	
	RTX180 :begin
		out <= {ina[23:18],ina[3],ina[7],ina[10],ina[0],ina[9],ina[6],ina[11],ina[15],ina[13],ina[8],ina[16],ina[12],ina[5],ina[4],ina[17],ina[2],ina[1],ina[14]} ;
		zf <=0  ;
	end
	
	RTX270 :begin
		out <= {ina[23:18],ina[16],ina[3],ina[14],ina[10],ina[6],ina[13],ina[11],ina[0],ina[12],ina[8],ina[17],ina[9],ina[5],ina[4],ina[7],ina[2],ina[1],ina[15]} ;
		zf <=0  ;
	end
	
	RTY90 :begin
		out <= {ina[23:12],ina[10],ina[9],ina[8],ina[11],ina[4],ina[7],ina[6],ina[5],ina[0],ina[3],ina[2],ina[1]};
		zf <=0  ;
	end
	
	RTY180 :begin
		out <= {ina[23:12],ina[9],ina[8],ina[11],ina[10],ina[5],ina[4],ina[7],ina[6],ina[1],ina[0],ina[3],ina[2]};
		zf <=0  ;
	end
	
	RTY270 :begin
		out <= {ina[23:12],ina[8],ina[11],ina[10],ina[9],ina[6],ina[5],ina[4],ina[7],ina[2],ina[1],ina[0],ina[3]};
		zf <=0;
	end
	RTZ90 :begin
		out <= {ina[23:21],ina[14],ina[13],ina[16],ina[17],ina[10],ina[15],ina[6],ina[3],ina[12],ina[19],ina[5],ina[9:7],ina[2],ina[18],ina[4],ina[11],ina[20],ina[1:0]} ;
		zf <=0  ;
	end
	
	RTZ180 :begin
		out <= {ina[23:21],ina[6],ina[3],ina[10],ina[17],ina[5],ina[15],ina[2],ina[11],ina[12],ina[13],ina[18],ina[9:7],ina[20],ina[16],ina[4],ina[19],ina[14],ina[1:0]} ;
		zf <= 0 ;
	end
	
/*	RTZ270 :begin
		out <= {ina[23:21],ina[2],ina[11],ina[5],ina[17],ina[18],ina[15],ina[20],ina[19],ina[12],ina[3],ina[16],ina[9:7],ina[14],ina[10],ina[4],ina[13],ina[6],ina[1:0]} ;
		zf <= 0 ;
	end
	*/
	REFERENCE :begin
		if (ina[23:21] == 3'b000) begin
			out <= {ina[2:0],21'b000_000_000_000_000_000_000};
			zf <= 0 ;
		end else if(ina[23:21] == 3'b001)begin
			out <= {ina[5:3],21'b000_000_000_000_000_000_000};
			zf <= 0;
		end else if(ina[23:21] == 3'b010)begin
			out <= {ina[8:6],21'b000_000_000_000_000_000_000};
			zf <= 0;
		end else if(ina[23:21] == 3'b011)begin
			out <= {ina[11:9],21'b000_000_000_000_000_000_000};
			zf <= 0 ;
		end else if(ina[23:21] == 3'b100)begin
			out <= {ina[14:12],21'b000_000_000_000_000_000_000};
			zf <= 0;
		end else if(ina[23:21] == 3'b101 )begin
			out <= {ina[17:15],21'b000_000_000_000_000_000_000};
			zf <= 0;
		end else if(ina[23:21] == 3'b110)begin
			out <= {ina[20:18],21'b000_000_000_000_000_000_000};
			zf <= 0;
		end else if(ina[23:21] == 3'b111)begin
		out <= {ina[23:21],21'b111_111_111_111_111_111};
			zf <= 0;
		end

/*
	default :begin
		out <= out;
	end*/
end
endcase


end


endmodule
