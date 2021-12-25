# ALU

```
CHIP ALU {
    IN  
        x[16], y[16],  // 16-bit inputs        
        zx, // zero the x input?
        nx, // negate the x input?
        zy, // zero the y input?
        ny, // negate the y input?
        f,  // compute out = x + y (if 1) or x & y (if 0)
        no; // negate the out output?

    OUT 
        out[16], // 16-bit output
        zr, // 1 if (out == 0), 0 otherwise
        ng; // 1 if (out < 0),  0 otherwise

    PARTS:
   // Put you code here:
   Mux16(a=x, b=false, sel=zx, out=t1);
   Not16(in=t1, out=t2);
   Mux16(a=t1, b=t2, sel=nx, out=t3);

   Mux16(a=y, b=false, sel=zy, out=t4);
   Not16(in=t4, out=t5);
   Mux16(a=t4, b=t5, sel=ny, out=t6);

   And16(a=t3, b=t6, out=t7);
   Add16(a=t3, b=t6, out=t8);
   Mux16(a=t7, b=t8, sel=f, out=t9);
   Not16(in=t9, out=t10);
   Mux16(a=t9, b=t10, sel=no, out=out,out[0..7]=t11, out[8..15]=t12, out[15]=ng);

   Or8Way(in=t11,out=t13);
   Or8Way(in=t12,out=t14);
   Or(a=t13, b=t14, out=t15);
   Not(in=t15, out=zr);

}
```

![](https://github.com/Kenttsai1/co110a/blob/master/Picture/alu.jpg)

