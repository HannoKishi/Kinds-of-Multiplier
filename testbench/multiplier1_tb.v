//testbench for multiplier1
`timescale 1ns/1ns
module multiplier1_tb;
 reg clk;
 reg rst;
 reg[7:0] a;
 reg[7:0] b;
 reg start;
 wire[15:0] out;
 wire flag;
 multiplier1 U1(.clk(clk),.start(start),.rst(rst),.a(a),.b(b),.out(out),.flag(flag));
 initial 
  begin
   a=0;
   b=0;
   clk=0;
   rst=1;
  end
 always
  #5 clk=~clk;
 initial
  begin
   #10 rst=0;
   #5  rst=1;
       start=1;
       a=8'd5;
	   b=8'd10;
   #5  start=0;	   
   #55 a=8'd7;
       b=8'd4;  
       start=1;
   #5  start=0;	   
  end
 endmodule