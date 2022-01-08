# Mult

```
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

```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/mult.jpg)

# Fill
```
input 24576
screen 16384~24576 8192
JEQ if out = 0 jump
```
```
0	@8192
1	M=A

2	@24576
3	D=M

4	@16
5	D;JEQ

6	@8192  //black
7	D=M
8	M=M-1
9	@0
10	D;JEQ
11	@16384
12	A=D+A
13	M=-1
14	@6
15	0;JMP

16	@8192   //white
17	D=M
18	M=M-1
19	@0
20	D;JEQ
21	@16384
22	A=D+A
23	M=0
24	@16
25	0;JMP
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/fill.jpg)