// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// 持續讀取鍵盤，將整個螢幕填成黑色或白色

(LOOP)
    // 讀取鍵盤狀態
    @KBD
    D=M

    // 沒有按鍵時，選擇白色
    @WHITE
    D;JEQ

    // 有按鍵：color = -1，代表黑色
    @color
    M=-1

    @START
    0;JMP

(WHITE)
    // 沒有按鍵：color = 0，代表白色
    @color
    M=0

(START)
    // addr = SCREEN
    @SCREEN
    D=A
    @addr
    M=D

(PAINT)
    // D = color
    @color
    D=M

    // RAM[addr] = color
    @addr
    A=M
    M=D

    // addr = addr + 1
    @addr
    M=M+1

    // 判斷 addr 是否仍小於 KBD
    D=M
    @KBD
    D=D-A

    @PAINT
    D;JLT

    // 整個畫面更新完成，重新讀取鍵盤
    @LOOP
    0;JMP