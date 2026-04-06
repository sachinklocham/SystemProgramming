source file -> preprocessing (.i)-> assambly(.s) ->  (.o) machine code by assambler-> by linker genrate executable (.elf) . 

-> Linker task : resolve symbols references , and merge sections from all obj files , memory addresses placement of sections in RAM (Memory)
linker script help linker to achieve all tasks.


.o file content ::
->  .text -> all of the instructions , all of the code
    .bss -> uninitialised global cariables
    .data -> initialised global variables, and static variables

linker will merrge different .o files sections 

to merge sections and for placement of sections linker need linker script.

.elf to code section mapping based on address, and SRAM mapping to store global variables  starting from some address.

(base) sachin@sachin:~/courses/github/SystemProgramming/learn_linkerscript$ arm-none-eabi-gcc -c main.c
(base) sachin@sachin:~/courses/github/SystemProgramming/learn_linkerscript$ arm-none-eabi-gcc -c bar.c
(base) sachin@sachin:~/courses/github/SystemProgramming/learn_linkerscript$ 
(base) sachin@sachin:~/courses/github/SystemProgramming/learn_linkerscript$ arm-none-eabi-objdump -D main.o > main.s

bl 0 <bar>   => branch and link bar function 

(base) sachin@sachin:~/courses/github/SystemProgramming/learn_linkerscript$ arm-none-eabi-ld main.o bar.o -o main.elf    => will use default linker script
arm-none-eabi-ld: warning: cannot find entry symbol _start; defaulting to 00008000
without linker script this warning output

 arm-none-eabi-objdump -D main.elf > main.elf.s

now analyse function and variable calling ...

$ arm-none-eabi-ld --verbose

add different type of initialised and uninitialised variable and repeat process

$ arm-none-eabi-gcc -c main.c
$ arm-none-eabi-ld  main.o -o main.elf
arm-none-eabi-ld: warning: cannot find entry symbol _start; defaulting to 00008000

/////    .elf to    .bin   which sections are removed ???? 

////////////  diagnostic tools /////////////////////////

Analyse output of linker ......

==>>> :: 

arm-none-eabi-addr2line   arm-none-eabi-elfedit     arm-none-eabi-gcc-ranlib  arm-none-eabi-ld.bfd      arm-none-eabi-readelf
arm-none-eabi-ar          arm-none-eabi-g++         arm-none-eabi-gcov        arm-none-eabi-lto-dump    arm-none-eabi-size
arm-none-eabi-as          arm-none-eabi-gcc         arm-none-eabi-gcov-dump   arm-none-eabi-nm          arm-none-eabi-strings
arm-none-eabi-c++         arm-none-eabi-gcc-13.2.1  arm-none-eabi-gcov-tool   arm-none-eabi-objcopy     arm-none-eabi-strip
arm-none-eabi-c++filt     arm-none-eabi-gcc-ar      arm-none-eabi-gprof       arm-none-eabi-objdump     
arm-none-eabi-cpp         arm-none-eabi-gcc-nm      arm-none-eabi-ld          arm-none-eabi-ranlib 

$ arm-none-eabi-nm main.elf
00009048 B __bss_end__
00009048 B _bss_end__
00009030 B __bss_start
00009030 B __bss_start__
00009024 D __data_start
00009030 D _edata
00009048 B __end__
00009048 B _end
00008000 T fun
00009024 D initialised_global
00080000 B _stack
         U _start
00009028 d static_initialised_global
0000902c d static_initialised_local_variable.1
00009040 b static_uninitialised_global
00009044 b static_uninitialised_local_variable.0
00009030 B uninitialised_global
(base) sachin@sachin:~/courses/github/SystemProgramming/learn_linkerscript$ 



arm-none-eabi-objdump --help

-D
-f
-a

//////////////////////////////////////
main1.c  main1.ld Makefile
    check initially .map and .txt file with this 
 	$(LD) -s -Bsymbolic -gc-sections -T$(LD_SCRIPT) -static -Map=$(LD_MAP) -o $@ $(OBJ)
    then with this
	$(LD) -T$(LD_SCRIPT) -Map=$(LD_MAP) -o $@ $(OBJ)


in project folder main.c global.c
want to discard global.o sections as they are merged by default even we didn't mention that in .ld

SECTIONS {
    .text : {
        main.o (.text)
        main.o (.data)
        main.o (.bss)
    } > SOME_NAME
}

so we will use /DISCARD/ section for this purpose : 

it will discaed all the things sections which have not been included in above sections of different .o files check project/ main.ld


SECTIONS {
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

//// Wildcards  instead file name mention * 

SECTIONS {
    .text : {
        * (.text)
    } > SOME_NAME
    .data : {
        * (.data)
    } > SOME_NAME
    .bss : {
        * (.bss)

    } > SOME_NAME


    /DISCARD/ : {
            * (*)
    }
}


if we define const in code global variable then that will go to .rodata section , so we need to define .rodata section in our linker script.
otherwise by default that will be discarded.

Discarded input sections

 .comment       0x00000000       0x27 main.o
 .ARM.attributes
                0x00000000       0x2a main.o
 .rodata        0x00000000        0x4 global.o
 .comment       0x00000000       0x27 global.o
 .ARM.attributes
                0x00000000       0x2a global.o


in .map file

2 memory  solution ... distribute SECTIONS
ROM
.text
.rodata

RAM
.data
.bss

2 memory bank

RAM will be cleared when we swich off mcu all values of global vars will be gone , who will restore them ..... ?????
like int init_global = 10; from main.c

solution:- .data section value need to be retained
means can we backup .data section in ROM and loads back to RAM after power cycle or normal boot ???
because code will access data from RAM address 

VMA(virtual memory address) & LMA(Load memory address) concepts :----------- 

solution: LMA should be of ROM and VMA should be of RAM for .data section

    .data : {
        * (.data)
    } > RAM AT > ROM   =>  specifies VMA-RAM AT LMA-ROM (Without AT both type of address in RAM/ROM)

now ---

Linker script and memory map
                VMA(column)                 LMA(column)

.text           0x0000a000       0x60
 *(.text)
 .text          0x0000a000       0x44 main.o
                0x0000a000                foo
 .text          0x0000a044       0x1c global.o
                0x0000a044                bar

.rodata         0x0000a060        0x4
 *(.rodata)
 .rodata        0x0000a060        0x4 global.o
                0x0000a060                c

.data           0x0000c000        0x8 load address 0x0000a064    <<<<======= 
 *(.data)
 .data          0x0000c000        0x4 main.o
                0x0000c000                init_global
 .data          0x0000c004        0x4 global.o
                0x0000c004                b

.bss            0x0000c008        0x8 load address 0x0000a06c
 *(.bss)
 .bss           0x0000c008        0x4 main.o
                0x0000c008                uninit_global
 .bss           0x0000c00c        0x4 global.o
                0x0000c00c                a


we want only .data section like this not .bss section
so change in .ld file  =>>> RAM AT > RAM



////''''''''''''''''''''''''''''''''''''''''''''

copying .data section from ROM to RAM 

using assambly or c code:
from where to copy and where to paste how much to copy.
src location , dest location , size.

 current location counter(.) dot is current location =>  VMA







































































