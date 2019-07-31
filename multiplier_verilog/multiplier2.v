//8位无符号流水线乘法器/3个周期
module multiplier2(clk,rst,a,b,out);
 parameter SIZE=8;
 input clk;
 input rst;
 input[SIZE-1:0] a;
 input[SIZE-1:0] b;
 output[2*SIZE-1:0] out;
 
 reg[2*SIZE-1:0] out;
 reg[2*SIZE-1:0] buff0;
 reg[2*SIZE-1:0] buff1;
 reg[2*SIZE-1:0] buff2;
 reg[2*SIZE-1:0] buff3;
 reg[2*SIZE-1:0] buff4;
 reg[2*SIZE-1:0] buff5;
 reg[2*SIZE-1:0] buff6;
 reg[2*SIZE-1:0] buff7;
 reg[2*SIZE-1:0] add0;
 reg[2*SIZE-1:0] add1;
 reg[2*SIZE-1:0] add2;
 reg[2*SIZE-1:0] add3;
 reg[2*SIZE-1:0] add01;
 reg[2*SIZE-1:0] add23;
 always@(posedge clk or negedge rst)
  begin
   if(!rst)
    begin
	 buff0<=16'd0;
	 buff1<=16'd0;
	 buff2<=16'd0;
	 buff3<=16'd0;
	 buff4<=16'd0;
	 buff5<=16'd0;
	 buff6<=16'd0;
	 buff7<=16'd0;
	end
   else
    begin
     buff0<=b[0]?{8'd0,a}:16'd0;
	 buff1<=b[1]?{7'd0,a,1'b0}:16'd0;
	 buff2<=b[2]?{6'd0,a,2'd0}:16'd0;
	 buff3<=b[3]?{5'd0,a,3'd0}:16'd0;
	 buff4<=b[4]?{4'd0,a,4'd0}:16'd0;
	 buff5<=b[5]?{3'd0,a,5'd0}:16'd0;
	 buff6<=b[6]?{2'd0,a,6'd0}:16'd0;
	 buff7<=b[7]?{1'b0,a,7'd0}:16'd0;
	 add0<=buff0+buff1;
     add1<=buff2+buff3;
     add2<=buff4+buff5;
     add3<=buff6+buff7;
     add01<=add0+add1;
     add23<=add2+add3;
	 out<=add01+add23;
	end
  end
endmodule
	 
     	 
 