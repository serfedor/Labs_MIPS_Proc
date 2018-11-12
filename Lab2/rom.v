module rom
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(ADDR_WIDTH-1):0] i_addr,
	output reg[(DATA_WIDTH-1):0] o_data
);

	initial
	$readmemh("rom_init.dat", mem);
		
	reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0];
	
	always @(i_addr)
		o_data <= mem[i_addr];
		


endmodule
