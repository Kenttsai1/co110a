# RAM64
```
CHIP RAM64 {
    IN in[16], load, address[6];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in=load, sel=address[3..5], a=a, b=b, c=c, d=d, e=e, f=f, g=g, h=h);
    
    RAM8(in=in, load=a, address=address[0..2], out=r8a);
    RAM8(in=in, load=b, address=address[0..2], out=r8b);
    RAM8(in=in, load=c, address=address[0..2], out=r8c);
    RAM8(in=in, load=d, address=address[0..2], out=r8d);
    RAM8(in=in, load=e, address=address[0..2], out=r8e);
    RAM8(in=in, load=f, address=address[0..2], out=r8f);
    RAM8(in=in, load=g, address=address[0..2], out=r8g);
    RAM8(in=in, load=h, address=address[0..2], out=r8h);

    Mux8Way16(a=r8a, b=r8b, c=r8c, d=r8d, e=r8e, f=r8f, g=r8g, h=r8h, sel=address[3..5], out=out);

}
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/alu.jpg)

# RAM512
```
CHIP RAM512 {
    IN in[16], load, address[9];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in=load, sel=address[6..8], a=a, b=b, c=c, d=d, e=e, f=f, g=g, h=h);

    RAM64(in=in, load=a, address=address[0..5], out=r64a);
    RAM64(in=in, load=b, address=address[0..5], out=r64b);
    RAM64(in=in, load=c, address=address[0..5], out=r64c);
    RAM64(in=in, load=d, address=address[0..5], out=r64d);
    RAM64(in=in, load=e, address=address[0..5], out=r64e);
    RAM64(in=in, load=f, address=address[0..5], out=r64f);
    RAM64(in=in, load=g, address=address[0..5], out=r64g);
    RAM64(in=in, load=h, address=address[0..5], out=r64h);

    Mux8Way16(a=r64a, b=r64b, c=r64c, d=r64d, e=r64e, f=r64f, g=r64g, h=r64h, sel=address[6..8], out=out);
}
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/alu.jpg)

# RAM4K
```
CHIP RAM4K {
    IN in[16], load, address[12];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in=load, sel=address[9..11], a=a, b=b, c=c, d=d, e=e, f=f, g=g, h=h);

    RAM512(in=in, load=a, address=address[0..8], out=r512a);
    RAM512(in=in, load=b, address=address[0..8], out=r512b);
    RAM512(in=in, load=c, address=address[0..8], out=r512c);
    RAM512(in=in, load=d, address=address[0..8], out=r512d);
    RAM512(in=in, load=e, address=address[0..8], out=r512e);
    RAM512(in=in, load=f, address=address[0..8], out=r512f);
    RAM512(in=in, load=g, address=address[0..8], out=r512g);
    RAM512(in=in, load=h, address=address[0..8], out=r512h);

    Mux8Way16(a=r512a, b=r512b, c=r512c, d=r512d, e=r512e, f=r512f, g=r512g, h=r512h, sel=address[9..11], out=out);
}

```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/alu.jpg)

# RAM16K
```
CHIP RAM16K {
    IN in[16], load, address[14];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux4Way(in=load, sel=address[12..13], a=a, b=b, c=c, d=d);

    RAM4K(in=in, load=a, address=address[0..11], out=r4ka);
    RAM4K(in=in, load=b, address=address[0..11], out=r4kb);
    RAM4K(in=in, load=c, address=address[0..11], out=r4kc);
    RAM4K(in=in, load=d, address=address[0..11], out=r4kd);

    Mux4Way16(a=r4ka, b=r4kb, c=r4kc, d=r4kd, sel=address[12..13], out=out);
}
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/alu.jpg)

# PC
```
CHIP PC {
    IN in[16],load,inc,reset;
    OUT out[16];

    PARTS:
    // Put your code here:
    Register(in=resetOut,load=true,out=out,out=out2);
    Inc16(in=out2,out=incOut);
    Mux16(a=out2,b=incOut,sel=inc,out=incMuxOut);
    Mux16(a=incMuxOut,b=in,sel=load,out=loadOut);
    Mux16(a=loadOut,b=false,sel=reset,out=resetOut);
}

```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/alu.jpg)
