//BOOTH 算法有符号乘法器 10个周期
module multiplier5(clk,rst,a,b,out);
 parameter SIZE=8;
 input clk;
 input rst;
 input[SIZE-1:0] a;
 input[SIZE-1:0] b;
 output[2*SIZE-1:0] out;
 reg[SIZE-1:0] a_tmp;             //被乘数寄存器
 reg[SIZE-1:0] a_tmp_c;           //被乘数补码
 //reg[SIZE-1:0] b_tmp;             //乘数
 reg[2*SIZE-1:0] out;             //输出
 reg[2*SIZE:0] out_tmp;           //P空间
 reg[1:0] state;  
 integer i;
 parameter s0=2'b00,s1=2'b01,s2=2'b10; 
 
 always@(posedge clk or negedge rst)
  if(!rst)
   begin
    a_tmp<={SIZE{1'b0}};
	a_tmp_c<={SIZE{1'b0}};
	//b_tmp<={SIZE{1'b0}};
	out_tmp<={(2*SIZE+1){1'b0}};
	i<=0;
	state<=s0;
   end
  else
   begin
    case(state)
	s0:
	 begin
	  a_tmp<=a;
	  a_tmp_c<=(~a+1'b1);
	  out_tmp<={{(SIZE){1'b0}},b,1'b0};
	  state<=s1;
	 end
	s1:
	 begin
	  if(i<SIZE)
	   begin
	    if(out_tmp[1:0]==2'b01)
	     out_tmp={(out_tmp[2*SIZE:SIZE+1]+a_tmp),out_tmp[SIZE:0]};
	    else if(out_tmp[1:0]==2'b10)
	     out_tmp={(out_tmp[2*SIZE:SIZE+1]+a_tmp_c),out_tmp[SIZE:0]};
	    else
	     out_tmp<=out_tmp;
		i<=i+1;
		out_tmp<={out_tmp[2*SIZE],out_tmp[2*SIZE:1]};
	   end
	  else
	   state<=s2;
	 end
	s2:
	 begin
	  out<=out_tmp[2*SIZE:1];
	  i<=0;
	  state<=s0;
	 end
	default:
      state<=s0;	
	endcase
   end
endmodule
	 
	
	