
int init_global = 10;
int __attribute__((section(".abc"))) uninit_global;

int foo(int local){
    return local + init_global + uninit_global;
}

// ROM to RAM copy .data section ....
extern char _src_start_data_, _dst_start_data_, _dst_end_data_;
//.bss
extern char _start_bss_, _end_bss_;
void __attribute__(( section(".sachin"))) copy_data(){// call somewhere close to start of .data section

    char *src = &_src_start_data_;
    char *dst = &_dst_start_data_;
    
    char *bss = &_start_bss_;
    while(bss < &_end_bss_){
        *bss++ = 0;
    }   

    while(dst < &_dst_end_data_){
        *dst++ = *src++;
    }
}









