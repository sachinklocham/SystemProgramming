    .section .vectors
vector_table:
    //.word 0xabcd //in sp register value is abcc as d is odd and down to c so ... , in reality it's invalid address so if we jumps to cfunction to another c function it will give hardfault so changing start address 
    .word __stack
    .word reset_handler
    .zero 400

    .section .text
    .align 1
    .type reset_handler, %function
reset_handler:
    //mov r1, #1
    //mov r2, #2
    //add r3, r1, r2
    b start
    b .
