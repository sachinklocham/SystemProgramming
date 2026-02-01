#include <stdio.h>
#include <magic.h>

extern const char msg[];

int main(){
    printf("%s\n", msg);
    printf("The magic number is %d\n", MAGIC_NUMBER);
    return 0;   
}