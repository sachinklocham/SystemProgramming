$(info Including other_makefile.mk)

# pass value of CC from Command Line $make CC=MyName 
CC ?= gcc 

# += will append to existing value of CC or other  variables

# or assign default value to CC as => CC ?= DefaultName  (?= means assign only if not assigned already)

$(info CC from other_makefile.mk: $(CC))

# $ make CC=gcc
# Including other_makefile.mk
# CC from other_makefile.mk: gcc
# ================= DEBUG BUILD =================
# SRC: src/main.c src/msg/msg.c
# OBJ: OBJS/main.o OBJS/msg/msg.o
# INCLUDE_DIRS: -I./include/magic
# BUILD: debug
# ===============================================
# gcc -Wall -MMD -MP -I./include/magic -O0 -g -c src/main.c -o OBJS/main.o
# gcc -Wall -MMD -MP -I./include/magic -O0 -g -c src/msg/msg.c -o OBJS/msg/msg.o
# gcc OBJS/main.o OBJS/msg/msg.o -o main

# dry run to see all commands executing without actually executing them
# $ make -n CC=arm-none-eabi-gcc 
# Including other_makefile.mk
# CC from other_makefile.mk: arm-none-eabi-gcc
# ================= DEBUG BUILD =================
# SRC: src/main.c src/msg/msg.c
# OBJ: OBJS/main.o OBJS/msg/msg.o
# INCLUDE_DIRS: -I./include/magic
# BUILD: debug
# ===============================================
# arm-none-eabi-gcc OBJS/main.o OBJS/msg/msg.o -o main