extern int a;
extern int bar(void);

int foo(){
    int b = a + bar();
}