
# CPU
```
PARTS:
    // Put your code here:
    /*
        if(instruction[15] == 0) A-instruction --> loadinst = 0
        else C-instruction loadinst = 1
    */
    And(a=true, b=instruction[15], out=loadinst); //A-instruction or C-instruction
    Mux16(a=instruction, b=aluoutput, sel=loadinst, out=outmux1); //A-inst instruction is an address
    /*
    C-inst: if(instruction[5] == 1) load A register;
    A-inst: always access A register 
    */
    Mux(a=true, b=instruction[5], sel=loadinst, out=loadareg); 
    ARegister(in=outmux1, load=loadareg, out[0..14]=addressM, out=outareg);

    Mux(a=false, b=instruction[4], sel=loadinst, out=loaddreg);
    DRegister(in=aluoutput, load=loaddreg, out=outdreg);

    Mux16(a=outareg, b=inM, sel=instruction[12], out=outmux2);
    ALU(x=outdreg, y=outmux2, zx=instruction[11], nx=instruction[10],
        zy=instruction[9], ny=instruction[8], f=instruction[7], no=instruction[6],
        out=aluoutput, out=outM, zr=aluzr, ng=alung);

    Mux(a=false, b=instruction[3], sel=loadinst, out=writeM);

    /*
        ng  zr  po
        1   0   0
        0   1   0
        0   0   1
        1   1   not exit    
    */
    Or(a=alung, b=aluzr, out=ngorzr);
    Not(in=ngorzr, out=alupo);
    And(a=alung, b=instruction[2], out=cmp2); 
    And(a=aluzr, b=instruction[1], out=cmp1);
    And(a=alupo, b=instruction[0], out=cmp0);
    Or(a=cmp0, b=cmp1, out=cmp01);
    Or(a=cmp01, b=cmp2, out=cmp012);

    /*
    C-inst: ALU sign bits & the c-inst jjj bits not equals 0
    A-inst: never jump
    */
    
    And(a=loadinst, b=cmp012, out=jmp);

    PC(in=outareg, load=jmp, inc=true, reset=reset, out[0..14]=pc);
}
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/cpu.jpg)

# CPU設計要點
```
指令的每一位的含義需要參考04檔案夾，下圖用來判斷正位、負位、零位
```
![](https://github.com/Kenttsai1/co110a/blob/master/Picture/cpu2.jpg)