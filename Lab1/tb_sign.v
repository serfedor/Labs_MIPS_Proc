`timescale 1ns/10ps
module tb_sign;
reg   [15:0]  tb_i_data;
wire  [31:0]  tb_o_data;
reg tb_signCntrl;

signExtend mySE (.i_data(tb_i_data), .o_data(tb_o_data), .signCntrl(tb_signCntrl));

initial
begin
tb_signCntrl <= #0 1'b0;

tb_signCntrl <= #20 1'b1;
end

initial 
begin
	tb_i_data = 16'hFABC;
end



endmodule
