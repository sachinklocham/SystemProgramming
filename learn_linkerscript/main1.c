
int init_global = 10;
int uninit_global;

int foo(int local){
    return local + init_global + uninit_global;
}











