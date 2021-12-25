# HalfAdder
```
CHIP HalfAdder {
    IN a, b;    // 1-bit inputs
    OUT sum,    // Right bit of a + b 
        carry;  // Left bit of a + b

    PARTS:
    // Put you code here:
    And(a=a,b=b,out=carry);
    Xor(a=a,b=b,out=sum);
}

```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/halfadd.jpg)


# FullAdder
```
CHIP FullAdder {
    IN a, b, c;  // 1-bit inputs
    OUT sum,     // Right bit of a + b + c
        carry;   // Left bit of a + b + c

    PARTS:
    // Put you code here:
    Xor(a=a, b=b, out=t1);
    Xor(a=t1, b=c, out=sum);
    And(a=a, b=b, out=a1);
    And(a=a, b=c, out=b1);
    And(a=b, b=c, out=c1);
    Or(a=a1, b=b1, out=d1);
    Or(a=d1, b=c1, out=carry);

}
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/fulladd.jpg)


# Adder16
```
CHIP Add16 {
    IN a[16], b[16];
    OUT out[16];

    PARTS:
   // Put you code here:
   FullAdder(a=a[0] ,b=b[0], c=false, carry=a0, sum=out[0]);
   FullAdder(a=a[1] ,b=b[1], c=a0, carry=a1, sum=out[1]);
   FullAdder(a=a[2] ,b=b[2], c=a1, carry=a2, sum=out[2]);
   FullAdder(a=a[3] ,b=b[3], c=a2, carry=a3, sum=out[3]);
   FullAdder(a=a[4] ,b=b[4], c=a3, carry=a4, sum=out[4]);
   FullAdder(a=a[5] ,b=b[5], c=a4, carry=a5, sum=out[5]);
   FullAdder(a=a[6] ,b=b[6], c=a5, carry=a6, sum=out[6]);
   FullAdder(a=a[7] ,b=b[7], c=a6, carry=a7, sum=out[7]);
   FullAdder(a=a[8] ,b=b[8], c=a7, carry=a8, sum=out[8]);
   FullAdder(a=a[9] ,b=b[9], c=a8, carry=a9, sum=out[9]);
   FullAdder(a=a[10] ,b=b[10], c=a9, carry=a10, sum=out[10]);
   FullAdder(a=a[11] ,b=b[11], c=a10, carry=a11, sum=out[11]);
   FullAdder(a=a[12] ,b=b[12], c=a11, carry=a12, sum=out[12]);
   FullAdder(a=a[13] ,b=b[13], c=a12, carry=a13, sum=out[13]);
   FullAdder(a=a[14] ,b=b[14], c=a13, carry=a14, sum=out[14]);
   FullAdder(a=a[15] ,b=b[15], c=a14, carry=a15, sum=out[15]);

}
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/add16.jpg)


# Inc16
```
CHIP Inc16 {
    IN in[16];
    OUT out[16];

    PARTS:
   // Put you code here:
   
   HalfAdder(a=in[0], b=true,sum=out[0],carry=h1);
   HalfAdder(a=in[1], b=h1, sum=out[1], carry=h2);
   HalfAdder(a=in[2], b=h2, sum=out[2], carry=h3);
   HalfAdder(a=in[3], b=h3, sum=out[3], carry=h4);
   HalfAdder(a=in[4], b=h4, sum=out[4], carry=h5);
   HalfAdder(a=in[5], b=h5, sum=out[5], carry=h6);
   HalfAdder(a=in[6], b=h6, sum=out[6], carry=h7);
   HalfAdder(a=in[7], b=h7, sum=out[7], carry=h8);
   HalfAdder(a=in[8], b=h8, sum=out[8], carry=h9);
   HalfAdder(a=in[9], b=h9, sum=out[9], carry=h10);
   HalfAdder(a=in[10],b=h10,sum=out[10],carry=h11);
   HalfAdder(a=in[11],b=h11,sum=out[11],carry=h12);
   HalfAdder(a=in[12],b=h12,sum=out[12],carry=h13);
   HalfAdder(a=in[13],b=h13,sum=out[13],carry=h14);
   HalfAdder(a=in[14],b=h14,sum=out[14],carry=h15);
   HalfAdder(a=in[15],b=h15,sum=out[15]);
    
   
}
```

![](https://github.com/Kenttsai1/co110a/blob/master/Picture/inc16.jpg)

