//multiplier2 testbench
`timescale 1ns/1ns
module multiplier2_tb;
 reg clk;
 reg rst;
 reg[7:0] a;
 reg[7:0] b;
 wire[15:0] out;
 multiplier2 U1(clk,rst,a,b,out);
 always
  #5 clk=~clk;
 initial 
  begin
   clk=1;
   rst=1;
   #5 rst=0;
   #5 rst=1;
      a=8'd10;
	  b=8'd5;
   #10 a=8'd100;
       b=8'd7;
   #10 a=8'd200;
       b=8'd200;
   #10 a=8'd99;
       b=8'd10;
   #10 a=8'd88;
       b=8'd99;
  end
endmodule