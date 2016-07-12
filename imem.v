module imem(pc, op);
	input wire [7:0] pc;
	output reg [31:0] op;

`include "def.h"

always @(pc) begin
	case (pc)

// register6
	0 : begin
		op[31:28] <= REFERENCE;
		op[27:24] <= 8;
		op[23:20] <= 6;
	end
	3 : begin
		op[31:28] <= JMP;
		op[27:20] <= 13; // to reference module
	end
	4 : begin
		op[31:28] <= JMP;
		op[27:20] <= 61; //to checker
	end

	1 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b111_11111_1111_1111_1111_1111 ; //(カット情報がnext procedure7に移動したら)
	end
	2 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 7;// to Reproceed (to register7)
	end
	5 : begin
		op[31:28] <= ADD;
		op[27:24] <= 6;
		op[23:20] <= 6;
		op[19:16] <= 9; //what you want to add
	end

	6 : begin
		op[31:28] <= JMP;
		op[27:20] <= 0;//to register6top
	end

//Reproceed
	7 : begin
		op[31:28] <= LI;
		op[27:24] <= 0;
		op[23:0] <= 24'b1000_0000_0000_0011_0010_0000; //blue initialized
	end

	8 : begin
		op[31:28] <= LI;
		op[27:24] <= 1;
		op[23:0] <= 24'b0100_0011_0000_0000_0000_0010; // orange initialized
	end

	9 : begin
		op[31:28] <= LI;
		op[27:24] <= 2;
		op[23:0] <= 24'b0010_0100_0001_0000_0000_0100; // yellow initialized
	end
/*
	10 : begin
		op[31:28] <= LI;
		op[27:24] <= 6;
		op[23:0] <= 24'b000_001_001_010_010_001_000_000;
	end*/
// dont have to initialize cut-information bit => check
	10 : begin
		op[31:28] <= JMP;
		op[27:20] <= 11; // to calculate(add 001)
	end



//calculate(add 001)

	11 : begin
		op[31:28] <= ADD;
		op[27:24] <= 6;
		op[23:20] <= 6;
		op[19:16] <= 12;
	end

	12 : begin
		op[31:28] <= JMP;
		op[27:20] <= 5; // to topmodule
	end


// reference module
	13 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b000_000_000_000_000_000_000_000 ;
	end
	14 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 29; //to RTX90
	end

	15 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b001_000_000_000_000_000_000_000 ;
	end
	16 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 33; // to RTX180
	end

	17 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b010_000_000_000_000_000_000_000 ;
	end
	18 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 37; //to RTX270
	end
	19 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b011_000_000_000_000_000_000_000 ;
	end
	20 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 41; //to RTY90
	end
	21 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b100_000_000_000_000_000_000_000 ;
	end
	22 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 45; //to RTY180
	end
	23 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b101_000_000_000_000_000_000_000 ;
	end
	24 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 49; // to RTY270
	end
	25 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b110_000_000_000_000_000_000_000 ;
	end
	26 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 53; // to RTZ90
	end
	
	27 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b111_000_000_000_000_000_000_000 ;
	end
	28 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 57; // to RTZ180
	end

/*
	2 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b1010_0000_0000_0000_0000_0000 ;
	3 : begin
		op[31:28] <= JNZ;
		op[27:20] <= ; // to RTZ270
	end
*/


// Rotation

	29 : begin
		op[31:28] <= RTX90; //comand
		op[27:24] <= 0;     //blue destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	30 : begin
		op[31:28] <= RTX90; //comand
		op[27:24] <= 1;     //orange destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	31 : begin
		op[31:28] <= RTX90; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	32 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


	33 : begin
		op[31:28] <= RTX180; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	34 : begin
		op[31:28] <= RTX180; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	35 : begin
		op[31:28] <= RTX180; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	36 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


	37 : begin
		op[31:28] <= RTX270; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	38 : begin
		op[31:28] <= RTX270; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	39 : begin
		op[31:28] <= RTX270; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	40 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


	41 : begin
		op[31:28] <= RTY90; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	42 : begin
		op[31:28] <= RTY90; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	43 : begin
		op[31:28] <= RTY90; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	44 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


	45 : begin
		op[31:28] <= RTY180; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	46 : begin
		op[31:28] <= RTY180; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	47 : begin
		op[31:28] <= RTY180; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	48 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


	49 : begin
		op[31:28] <= RTY270; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	50 : begin
		op[31:28] <= RTY270; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	51 : begin
		op[31:28] <= RTY270; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	52 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


	53 : begin
		op[31:28] <= RTZ90; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	54 : begin
		op[31:28] <= RTZ90; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	55 : begin
		op[31:28] <= RTZ90; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;  
		end
	56 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


	57 : begin
		op[31:28] <= RTZ180; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	58 : begin
		op[31:28] <= RTZ180; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;
	end
	59 : begin
		op[31:28] <= RTZ180; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 3;      //src1
		op[15:0] <= 0;  
		end
	60 : begin
		op[31:28] <= JMP;
		op[27:20] <= 4;
	end


/*
	18 : begin
		op[31:28] <= RTZ270; //comand
		op[27:24] <= 0;     //red destnination
		op[23:20] <= 0;    //src0
		op[19:16] <= 15;      //src1
		op[15:0] <= 0;
	end
	19 : begin
		op[31:28] <= RTZ270; //comand
		op[27:24] <= 1;     //blue destnination
		op[23:20] <= 1;    //src0
		op[19:16] <= 15;      //src1
		op[15:0] <= 0;
	end
	20 : begin
		op[31:28] <= RTZ270; //comand
		op[27:24] <= 2;     //yellow destnination
		op[23:20] <= 2;    //src0
		op[19:16] <= 15;      //src1
		op[15:0] <= 0;  
		end
	6 : begin
		op[31:28] <= JMP;
		op[27:20] <=;
	end
*/



//checker
	61 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 0;
		op[23:0] <= 24'b1000_0000_0001_0000_0001_0001; // blue check register0
	end

	62 : begin
		op[31:28] <= ZNJ;
		op[27:20] <= 5; // to top
	end

	63 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 1;
		op[23:0] <= 24'b0100_0100_1010_0000_0000_0000; // orange checkresgister1
	end

	64 : begin
		op[31:28] <= ZNJ;
		op[27:20] <= 5; // to top
	end

	65 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 2;
		op[23:0] <= 24'b0010_1000_0000_0000_0010_0010; // yellow checkregister2
	end

	66 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 68; // to STORE
	end

	67 : begin
		op[31:28] <= JMP ;
		op[27:20] <= 5; //to TOP
	end 


//STORE
	68 : begin
		op[31:28] <= STORE;
		op[27:24] <= 13; //src1
		op[23:20] <= 0; //src0
	end  //blue STORE
	69 : begin
		op[31:28] <= STORE;
		op[27:24] <= 14; //src1
		op[23:20] <= 1; //src0
	end //orange STORE
	70 : begin
		op[31:28] <= STORE;
		op[27:24] <= 15; //src1
		op[23:20] <= 2; //src0
	end //yellow STORE
	71 : begin
		op[31:28] <= STORE;
		op[27:24] <= 11; //src1
		op[23:20] <= 6; //src0
	end //register6 STORE


//for ENDLOOP
	72 : begin
		op[31:28] <= JMP;
		op[27:20] <= 72;
	end

	73 : begin
		op[31:28] <= JMP;
		op[27:20] <= 71;
	end

/*
// register7
	73 : begin
		op[31:28] <= REFERENCE;
		op[27:24] <= 8;
		op[23:20] <= 7;
	end
	74 : begin
		op[31:28] <= JMP;
		op[27:20] <= 13; //to reference module
	end
	75 : begin
		op[31:28] <= JMP;
		op[27:20] <= 61; //to checker
	end
	76 : begin
		op[31:28] <= CHECK;
		op[27:24] <= 8;
		op[23:0] <= 24'b1111_1111_1111_1111_1111_1111 ; //to Reproceed
	end
	77 : begin
		op[31:28] <= JNZ;
		op[27:20] <= 7; // to reproceed
	end
	78 : begin
		op[31:28] <= ADD;
		op[27:24] <= 7;
		op[23:20] <= 7;
		op[19:16] <= 9; //what you want to add
	end

	79 : begin
		op[31:28] <= JMP;
		op[27:20] <= 73; //to register7 top
	end
	
*/
endcase

end

endmodule
