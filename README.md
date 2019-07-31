# Kinds-of-Multiplier
including 7 basic multiplier

*********************************************************
1.multiplier0.v is a 8bit unsigned shift multiplier (8 period)
2.multiplier1.v is a unsigned shift multiplier (operating period according to the minimum number/less than 8 period)
3.multiplier2.v is a pipeline 8bit unsigned multiplier 
4.multiplier3.v is a logical 8bit unsigned multiplier (1 period)
5.multiplier4.v is a unsigned shift multiplier (1 period/use for cycle)
6.multiplier5.v is a 8bit signed multiplier (using booth algorithm) 
7.multiplier6.v is a 8bit signed multiplier (using lut)
//
lut256.v is a lookup table for multiplier6.v
// 012345 is unsigned multiplier.// 67 is signed multiplier.//

*********************************************************
1.multiplier0.v 是8位无符号位移乘法器（8个运算周期）
2.multiplier1.v 是无符号位移乘法器（运算周期根据乘数与被乘数中最小的数决定/小于8个周期）
3.multiplier2.v 是8位无符号流水线乘法器
4.multiplier3.v 是8位无符号逻辑乘法器（1运算周期）
5.multiplier4.v 是用for循环的位移乘法器（1运算周期）
6.multiplier5.v 是8位有符号乘法器（利用booth算法）
7.multiplier6.v 是8位有符号乘法器（利用查找表法）
//
lut256.v 是multiplier6.v 的查找表
//012345 是无符号乘法器。 //67 是有符号乘法器。//
