//基本的无符号位移乘法器
module multiplier0(clk,rst,a,b,out);
 parameter SIZE=8;
 parameter s0=2'b00,s1=2'b01,s2=2'b10;
 input clk;
 input rst;
 input[SIZE-1:0] a;
 input[SIZE-1:0] b;
 output[2*SIZE-1:0] out;
 reg[2*SIZE-1:0] a_tmp;           //被乘数寄存器
 reg[SIZE-1:0] b_tmp;             //乘数
 reg[2*SIZE-1:0] out;             //输出
 reg[2*SIZE-1:0] out_tmp;
 reg[1:0] state;  
 integer i;
  
 
 always@(posedge clk or negedge rst)
  begin
   if(!rst)
    begin
	 a_tmp<={(2*SIZE){1'b0}};
	 b_tmp<={SIZE{1'b0}};
	 out_tmp<={SIZE{1'b0}};
	 i<=0;
	 state<=s0;
	end
   else
    begin
	 case(state)
	 s0:
	  begin
	   a_tmp<={{SIZE{1'b0}},a};
	   b_tmp<=b;
	   out_tmp<={(2*SIZE){1'b0}};
	   state<=s1;
	   i<=0;
	  end
	 s1:
	  begin
	   if(i<(SIZE-1))
	    state<=s2;
	   else
	    begin
	     out_tmp<=b_tmp[0]?(out_tmp+a_tmp):out_tmp;
		 a_tmp<=(a_tmp<<1);
		 b_tmp<=(b_tmp>>1);
		 i<=i+1;
		end
	  end
	 s2:
      begin
       out<=out_tmp;
       a_tmp<={(2*SIZE){1'b0}};
	   b_tmp<={SIZE{1'b0}};	
       i<=0;
       state<=s0;
      end
     endcase
    end
   end
endmodule	
 