// extern int a;
// extern int bar(void);

// int foo(){
//     int b = a + bar();
// }

//initialised global and global  & local initialised static in .data section .
// uninitialised global and static in .bss section.
int initialised_global = 2;
int uninitialised_global[4];

static int static_uninitialised_global;
static int static_initialised_global= 5;

void fun(){ //<< =====  .text
    int local_variable = 4;
    static int static_uninitialised_local_variable;
    static int static_initialised_local_variable = 5;


    return;
}