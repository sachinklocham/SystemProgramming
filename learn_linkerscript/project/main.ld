
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
        main.o (.text)
        global.o (.text)
    } > SOME_NAME
    .data : {
        main.o (.data)
        global.o (.data)
    } > SOME_NAME
    .bss : {
        main.o (.bss)
        global.o (.bss)
    } > SOME_NAME


    /DISCARD/ : {
            global.o (*)
    }
}