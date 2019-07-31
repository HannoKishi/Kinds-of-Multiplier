//逻辑8位无符号乘法器1周期,多寄存器方式
module multiplier3(clk,rst,a,b,out);
 parameter SIZE=8;
 input clk;
 input rst;
 input[SIZE-1:0] a;
 input[SIZE-1:0] b;
 output[2*SIZE-1:0] out;
 reg[2*SIZE-1:0] out;
 wire[2*SIZE-1:0] buff0;
 wire[2*SIZE-1:0] buff1;
 wire[2*SIZE-1:0] buff2;
 wire[2*SIZE-1:0] buff3;
 wire[2*SIZE-1:0] buff4;
 wire[2*SIZE-1:0] buff5;
 wire[2*SIZE-1:0] buff6;
 wire[2*SIZE-1:0] buff7;
 wire[2*SIZE-1:0] add0;
 wire[2*SIZE-1:0] add1;
 wire[2*SIZE-1:0] add2;
 wire[2*SIZE-1:0] add3;
 wire[2*SIZE-1:0] add01;
 wire[2*SIZE-1:0] add23;
 wire[2*SIZE-1:0] add0123;
 
 assign buff0=b[0]?{8'd0,a}:16'd0;
 assign	buff1=b[1]?{7'd0,a,1'b0}:16'd0;
 assign	buff2=b[2]?{6'd0,a,2'd0}:16'd0;
 assign buff3=b[3]?{5'd0,a,3'd0}:16'd0;
 assign	buff4=b[4]?{4'd0,a,4'd0}:16'd0;
 assign	buff5=b[5]?{3'd0,a,5'd0}:16'd0;
 assign	buff6=b[6]?{2'd0,a,6'd0}:16'd0; 
 assign	buff7=b[7]?{1'b0,a,7'd0}:16'd0; 
 assign    add0=buff0+buff1;
 assign    add1=buff2+buff3;
 assign    add2=buff4+buff5;
 assign    add3=buff6+buff7;
 assign    add01=add0+add1;
 assign    add23=add2+add3;
 assign    add0123=add01+add23;
 always @(posedge clk or negedge rst)
  begin
   if(!rst)
	out<=16'd0;
   else
    out<=add0123;   
  end
endmodule  
	