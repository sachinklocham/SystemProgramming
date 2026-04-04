
MEMORY {
    SOME_NAME : ORIGIN = 0xA000 , LENGTH = 0x1000
}

SECTIONS {
    .text : {
        main1.o (.text)
        main1.o (.data)
        main1.o (.bss)
    } > SOME_NAME
}