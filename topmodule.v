module top(clk, rst_n);
	input wire clk, rst_n;

	wire [3:0] dr1, dr3, dr4, da ;
	wire [7:0] dp1, pi ;
	wire [23:0] ds, rs, sa, rm, am, sr, ms ;
	wire [31:0] id;
	wire zd, az, dw, ds1, ds2, dp2, dr2 ;

sel s0(.a(ds), .b(rs), .sel(ds1), .c(sa));

sel2 s2(.a(am), .b(ms), .sel(ds2), .c(sr));

regfile r0(.src0(dr3), .src1(dr4), .dst(dr1), .we(dr2), .data(sr), .clk(clk), .rst_n(rst_n), .outa(rs), .outb(rm));

alu a0(.ina(sa), .inb(rm), .op(da), .zf(az), .out(am));

imem i0(.pc(pi), .op(id) );

zf z0(.clk(clk), .rst_n(rst_n), .zf_in(az), .zf_out(zd));

programcounter p0(.PC_in(dp1), .we(dp2), .PC_out(pi), .clk(clk), .rst_n(rst_n));

memory m0(.we(dw), .dout(ms), .addr(rm), .din(am), .clk(clk), .rst_n(rst_n));

decoder d0(.dst(dr1), .reg_we(dr2), .src0(dr3), .src1(dr4), .data(ds), .alu_op(da), .mem_we(dw), .sel1(ds1), .sel2(ds2), .op(id), .pc_we(dp2), .pc_in(dp1), .zf(zd));









endmodule
