//查找表有符号8位乘法器 ab=((a+b)^2-(a-b)^2)/4
module multiplier6(clk,rst,a,b,out);
 parameter SIZE=8;
 input clk;
 input rst;
 input[SIZE-1:0] a;
 input[SIZE-1:0] b;
 output[2*SIZE-1:0] out;
 
 reg[2*SIZE-1:0] out;
 wire[2*SIZE-1:0] out1;                           //存a+b^2/4
 wire[2*SIZE-1:0] out2;                           //存a-b^2/4
 wire[2*SIZE-1:0] out_tmp;                   //存结果补码
 wire[2*SIZE-1:0] out_tmp2;                  //存结果
 wire [SIZE-1:0] L1;                         //存a无符号
 wire [SIZE-1:0] L2;                         //存b无符号
 wire [SIZE-1:0] L3;                         //a-b绝对值
 wire [2*SIZE-1:0] L4;                       //-out2补码
 wire [SIZE-1:0] I1;                         //存a+b源码去符号
 wire [SIZE-1:0] I2;                         //存a-b源码去符号
 
 assign L1={1'b0,a[SIZE-2:0]};
 assign L2={1'b0,b[SIZE-2:0]};
 assign L3=(L1>L2)?(L1-L2):(L2-L1);
 assign I1=(a[SIZE-1]==b[SIZE-1])?(L1+L2):L3;
 assign I2=(a[SIZE-1]==b[SIZE-1])?L3:(L1+L2);
 assign L4=~out2+1'b1;
 assign out_tmp=out1+L4;
 assign out_tmp2=(out_tmp[2*SIZE-1])?{1'b1,~out_tmp[2*SIZE-2:0]+1'b1}:out_tmp;
 
 
 lut_256 U1(clk,rst,I1,out1);
 lut_256 U2(clk,rst,I2,out2);
 
 always@(posedge clk or negedge rst)
  if(!rst)
   out<={(2*SIZE-1){1'b0}};
  else
   out<=out_tmp2;
   
endmodule