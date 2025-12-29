
MEMORY
{/* comments */
    FLASH : ORIGIN = 0x0, LENGTH = 128K
    /*above sufficient for assambly to c function jump*/

    /*addresses can be seen from STM32F4XXXX data sheet SRAM1 (112KB + 16KB) 0x2000 0000 to 0x2001 FFFF  */
    RAM : ORIGIN = 0x20000000, LENGTH = 8K
}

SECTIONS
{
    .text : {
        _stext = .;
        *(.vectors*)
        *(.text*)
        *(.rodata)
        *(.rodata.*)
        _etext = .;
    } > FLASH
    /*above two sections sufficient for assambley to c function jump start(), now below lines for c function jump as start() to sachin()*/

    .data : ALIGN(4) {
        _sdata = .;
        _sidata = LOADADDR(.data);
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > FLASH AT > RAM

    .bss : ALIGN(4) {
        _sbss = .;
        *(.bss*)
        . = ALIGN(4);
        _ebss = .;
    } > RAM

    __StackTop = ORIGIN(RAM) + LENGTH(RAM);
    PROVIDE(__stack = __StackTop - 4);/*and replace this __stack to .word address in boot.S .word 0xabcd , this is sp : stack pointer*/
}




