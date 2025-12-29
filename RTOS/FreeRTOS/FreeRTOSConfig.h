#ifndef _CONFIG_H_
#define _CONFIG_H_
// 24bit timer size but we are taking 32 bit 
#define configTICK_TYPE_WIDTH_IN_BITS       TICK_TYPE_WIDTH_32_BITS
#define configMAX_SYSCALL_INTERRUPT_PRIORITY 1  // refer document w.r.t priority 
#define configMINIMAL_STACK_SIZE            0x100 // decide based on use
#define configMAX_PRIORITIES                5
#define configUSE_PREEMPTION                1
#define configUSE_IDLE_HOOK                 0 // user defined functions call inside timer callback  use or don't use 0 means don't allow/use
#define configUSE_TICK_HOOK                 0


#define configTOTAL_HEAP_SIZE               0x1000

//for systick related configuration controller specific thing present in M3 not present in M5 (port.c)
#define configCPU_CLOCK_HZ                  8000000       // systick with cpu 24 bit down counter cpu mhz clock speed per seconds 8 million times
#define configTICK_RATE_HZ                  10              //  per seconds 10 times

#endif