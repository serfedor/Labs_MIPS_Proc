module signExtend(i_data, o_data, signCntrl);
input   [15:0]  i_data;
output  [31:0]  o_data;
input signCntrl;
	
	assign o_data =  !signCntrl ? {{16{0}}, i_data} : {{16{i_data[15]}}, i_data};
endmodule