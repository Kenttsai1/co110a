// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//  3*2=6

0.	@3  第一個值
1.	D=A  放入暫存
2.	@0  用M0存D
3.	M=D 
4.	@2  第二個值
5.	D=A 
6.	@1  M1存D
7.	M=D 
8.	@10 用此處用於判斷
9.	M=D 
10.	@0  
11.	D=M 
12.	@2  M2存放最後解答
13.	M=D+M 相加
14.	@10 紀錄點
15.	M=M-1   加完-1
16.	M;JNE   跳回
17.	@17     ＬＯＯＰ
18.	0;JMP   