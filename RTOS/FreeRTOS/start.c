// void sachin(){// descending architecture in ARM M
//     return;
// }

//portmacro.h => m3 cpu , code to boot then run freertos - kernel schedular semaphores - how freertos will understand how to do contex switching 
// so for that there are certain dependency which developer need to provide macros typedef functions.......
//for this we have two options .... Do raw port or leanon preexisting port function ....


#include "FreeRTOS.h"
#include "task.h"

//define 2 tasks as calling vTaskStartScheduler(); is not enough
static void vTask1(void *pvParameters){
    volatile int a = 0;
    while(1){
        a++;
    }
}
static void vTask2(void *pvParameters){
    volatile int b = 0;
    while(1){
        b++;
    }    
}

extern uint32_t _sdata; // start of .data in RAM  <<< ========= from .ld
extern uint32_t _edata; // end of .data in RAM
extern uint32_t _sidata; // start of .data in flash
extern uint32_t _sbss; // start of .bss
extern uint32_t _ebss; // end of .bss

void start(){//<<=== 1. jumping here from boot.S reset_handler: is fine but jumping to function sachin() gives HardFault crash.
    //sachin();
    BaseType_t xReturn;
    // initialize .data section copy from flash to ram
    uint32_t *src = &_sidata; // source(flash)
    uint32_t *dst = &_sdata; // Destination RAM
    while(dst < &_edata){
        *dst++ = *src++; // copy word and increment pointer
    }

    //initialize .bss section (zero out)
    dst = &_sbss;
    while(dst < &_ebss){
        *dst++ = 0; // zero word and increment pointer
    }


    xReturn = xTaskCreate(vTask1, "T1",configMINIMAL_STACK_SIZE,NULL,1,NULL);//
    xReturn = xTaskCreate(vTask2, "T2",configMINIMAL_STACK_SIZE,NULL,1,NULL);//getting xReturn as -1 debug and foumd memory allocation was failing , few global variables were not holding changed values from heap_4.c files ..... => because .data section is nod defined in .ld script, only .text section is there.

    vTaskStartScheduler();// if only this call then cpu lockup nothing to execute so does hardfault.
    return;
}
//initially sp is  0x20001ffc
//then for function sachin changes to : 0x20001ff4 can check in gdb : ni - next instruction, break <fn_name> like break sachin, si- step inside function.

