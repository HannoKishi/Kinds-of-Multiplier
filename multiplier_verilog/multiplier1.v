//无符号乘法器 位移模式(运算周期根据乘数与被乘数大小决定) 所用时钟周期小于8个时钟周期
module multiplier1(clk,rst,start,a,b,out,flag);
 parameter SIZE=8;
 input clk;
 input rst;
 input[SIZE-1:0] a;
 input[SIZE-1:0] b;
 input start;                      //输入有效运算开始标志
 output[2*SIZE-1:0] out;
 output flag;
 
 reg[2*SIZE-1:0] a_tmp;           //被乘数寄存器
 reg[SIZE-1:0] b_tmp;             //乘数
 reg[2*SIZE-1:0] out;             //输出
 reg[2*SIZE-1:0] out_tmp;
 reg[1:0] state;              
 reg flag;                        //运算完成标志
 
 parameter s0=2'b00,s1=2'b01,s2=2'b10;
 
 always@(posedge clk or negedge rst)
  begin
  if(!rst)
   begin
    a_tmp<={(2*SIZE){1'b0}};
	b_tmp<={SIZE{1'b0}};
	out_tmp<={SIZE{1'b0}};
	state<=s0;
	flag<=1'b0;
   end
  else 
   begin 
   case(state)
   s0:                               //状态s0赋值
    begin
	if(start) 
	 begin
	 if(b>a)
	  begin 
	   a_tmp<={{SIZE{1'b0}},b};
	   b_tmp<=a;
	   out_tmp<={(2*SIZE){1'b0}};
	   flag<=1'b0; 
	  end
	 else
	  begin
	   a_tmp<={{SIZE{1'b0}},a};
	   b_tmp<=b;
	   out_tmp<={(2*SIZE){1'b0}};
	   flag<=1'b0;   
	  end
	 state<=s1; 
	 end 
	else
	 begin
	  flag<=1'b0;
      state<=s0;
     end	  
	end  
	
   s1:
    begin
	 if(b_tmp=={SIZE{1'b0}})
	  state<=s2;
	 else if(b_tmp[0]==1'b1)
	  begin
	   out_tmp<=out_tmp+a_tmp;
	   state<=s1;
	  end
	 else
	  begin
	   out_tmp<=out_tmp;
	   state<=s1;
	  end 
	 a_tmp<=(a_tmp<<1);
	 b_tmp<=(b_tmp>>1);
	end
	
   s2:
    begin 
	 out<=out_tmp;
	 state<=s0;
	 flag<=1'b1;
	 a_tmp<=0;
	 b_tmp<=0;
	 out_tmp<=0;
	end
	
   default:
     state<=s0;
   endcase
   
  end 
  end
  endmodule
   
	  
   
    
   
 
	