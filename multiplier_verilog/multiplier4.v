//单周期无符号移位法乘法器 所需寄存器减少 利用了for循环
module multiplier4(clk,rst,a,b,out);
 parameter SIZE=8;
 input clk;
 input rst;
 input[SIZE-1:0] a;
 input[SIZE-1:0] b;
 output[2*SIZE-1:0] out;
 integer i;
 reg[2*SIZE-1:0] a_tmp;
 reg[2*SIZE-1:0] out_tmp;
 reg[2*SIZE-1:0] out;
 
 always@(posedge clk or negedge rst)
  begin
   if(!rst)
    out=0;
   else
    begin
	 a_tmp={{(SIZE){1'b0}},a};
	 out_tmp=0;
	 for( i=0;i<SIZE;i=i+1)
	  out_tmp=out_tmp+(b[i]?(a_tmp<<i):0);
	 out=out_tmp;
	end
  end
endmodule