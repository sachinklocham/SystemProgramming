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

$ arm-none-eabi-ld --verbose
