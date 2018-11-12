module control(i_instrCode, 
               o_regDst,
               o_jump, 
               o_branch,
               o_memToReg,
               o_aluOp,
               o_memWrite,
               o_aluSrc,
               o_regWrite
               );
  
input     [5:0]  i_instrCode;
output  reg          o_regDst;
output  reg          o_regWrite;
output  reg          o_aluSrc;
output  reg         o_branch;
output  reg          o_jump; 
output  reg         o_memWrite;
output  reg         o_memToReg;
output  reg  [1:0]   o_aluOp;


  always @(i_instrCode)
  begin
  //defaults values
		o_regDst = 1'b0;
		o_regWrite = 1'b1;
		o_aluSrc = 1'b1;
		o_branch = 1'b0;
		o_jump = 1'b0;
		o_memWrite = 1'b0;
		o_memToReg = 1'b0;
		o_aluOp[1:0] = 2'b10;
		
	case(i_instrCode)
		6'h00: begin//r-type
			o_aluSrc = 1'b0;
			o_regDst = 1'b1;
		end
		
		6'h02: begin//jump
			o_jump = 1'b1;
			o_regWrite = 1'b0;
		end	
		
		6'h04: begin //beq
			o_aluOp = 2'b01;
			o_regWrite = 1'b0;
			o_aluSrc = 1'b0;
			o_branch = 1'b1;
		end	
		
		6'h08: begin //addi
			o_aluOp[1] = 1'b0;
		end
		
		6'h09: begin//addiu
			o_aluOp[1] = 1'b0;
		end
		
		6'h23: begin//lw
			o_aluOp[1] = 1'b0;
			o_memToReg = 1'b1;
		end
		
		6'h2b: begin//sw
			o_aluOp[1] = 1'b0;
			o_memWrite = 1'b1;
			o_regWrite = 1'b0;
		end
		
		endcase
	end
endmodule