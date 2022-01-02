# Bit

```
CHIP Bit {
    IN in, load;
    OUT out;

    PARTS:
    // Put your code here:
    Mux(b=in, a=d1, sel=load, out=m1);

    DFF(in=m1, out=d1, out=out);
}


```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/bit.jpg)

# Register

```
CHIP Register {
    IN in[16], load;
    OUT out[16];

    PARTS:
    // Put your code here:
    Bit(in=in[0], load=load, out=out[0]);
    Bit(in=in[1], load=load, out=out[1]);
    Bit(in=in[2], load=load, out=out[2]);
    Bit(in=in[3], load=load, out=out[3]);
    Bit(in=in[4], load=load, out=out[4]);
    Bit(in=in[5], load=load, out=out[5]);
    Bit(in=in[6], load=load, out=out[6]);
    Bit(in=in[7], load=load, out=out[7]);
    Bit(in=in[8], load=load, out=out[8]);
    Bit(in=in[9], load=load, out=out[9]);
    Bit(in=in[10], load=load, out=out[10]);
    Bit(in=in[11], load=load, out=out[11]);
    Bit(in=in[12], load=load, out=out[12]);
    Bit(in=in[13], load=load, out=out[13]);
    Bit(in=in[14], load=load, out=out[14]);
    Bit(in=in[15], load=load, out=out[15]);


}


```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/register.jpg)

# RAM8

```
CHIP RAM8 {
    IN in[16], load, address[3];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in=load,sel=address, a=d1,b=d2,c=d3,d=d4,e=d5,f=d6,g=d7,h=d8);
    Register(in=in, load=d1, out=r1);
    Register(in=in, load=d2, out=r2);
    Register(in=in, load=d3, out=r3);
    Register(in=in, load=d4, out=r4);
    Register(in=in, load=d5, out=r5);
    Register(in=in, load=d6, out=r6);
    Register(in=in, load=d7, out=r7);
    Register(in=in, load=d8, out=r8);
    Mux8Way16(a=r1,b=r2,c=r3,d=r4,e=r5,f=r6,g=r7,h=r8,sel=address,out=out);
}

```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/ram8.jpg)
