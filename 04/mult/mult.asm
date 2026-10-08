// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2 //R2表地址2
M=0 //Ram[2] =0

@R1 
D=M //D=Ram[1] 
@count
M=D //Ram[counter]=D

(LOOP) //標籤
 @count
 D=M //將count 的值讀到D
 @END
 D;JEQ

 // R2 = R2 + R0
 @R0
 D=M
 @R2
 M=D+M

 // count = count - 1
 @count 
 M=M-1

 // 回到 LOOP
 @LOOP //將 A 設成 LOOP 對應的指令位址
 0;JMP //無條件跳到 A 指定的位置，也就是 LOOP。

(END)
    // 計算完成，停留在結尾迴圈
    @END
    0;JMP 