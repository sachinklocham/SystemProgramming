# main.o: main.c
# 	gcc -c main.c
# main: main.o
# 	gcc main.o -o main

# run: main
# 	./main

# clean:
# 	rm -f main main.o

#------------------------------------
# C_Files = main.c msg.c # variable for src files

# main: $(C_Files)
# 	gcc $(C_Files) -o main

# run: main
# 	./main

# clean:
# 	rm -f main
#----------------------------------------
# pattern rule : xxx.o --> gcc -c xxx.c

OBJ_FILES = main.o msg.o

#main :%(OBJ_FILES)
#	gcc $< -o main # first dependency one dependency will be resolved check with make -n command
#	gcc $^ -o main # all dependencies will be resolved check with make -n command
main: $(OBJ_FILES)
	gcc $(OBJ_FILES) -o main

# all .o from .c files
%.o: %.c
	gcc -c $^
# $^ : all dependencies
# $< : first dependency
# $@ : target
run: main
	./main
clean:
	rm -f main $(OBJ_FILES)