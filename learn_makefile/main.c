#include <stdio.h>

extern const char msg[];

int main() {
    printf("Hello, Makefile msg[%s]!\n",msg);
    return 0;
}