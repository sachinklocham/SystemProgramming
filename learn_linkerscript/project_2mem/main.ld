
MEMORY {
    ROM : ORIGIN = 0xA000 , LENGTH = 0x1000
    RAM : ORIGIN = 0xC000 , LENGTH = 0x1000
}

SECTIONS {
    .text : {
        * (.text)
    } > ROM
    .rodata : {
        * (.rodata)
    } > ROM
    .data : {
        * (.data)
    } > RAM AT > ROM
    .bss : {
        * (.bss)

    } > RAM AT > RAM

    /DISCARD/ : {
            * (*)
    }
}