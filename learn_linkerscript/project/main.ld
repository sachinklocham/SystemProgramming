
MEMORY {
    SOME_NAME : ORIGIN = 0xA000 , LENGTH = 0x1000
}

SECTIONS {
     /* .text : {
        main.o (.text)
        main.o (.data)
        main.o (.bss)
    } > SOME_NAME */
    .text : {
        * (.text)
    } > SOME_NAME
    .data : {
        * (.data)
    } > SOME_NAME
    .rodata : {
        * (.rodata)
    } > SOME_NAME
    .bss : {
        * (.bss)

    } > SOME_NAME


    /DISCARD/ : {
            * (*)
    }
}