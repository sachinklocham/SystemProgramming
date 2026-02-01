SRC = $(shell find src -iname "*.c")
OBJ = $(patsubst %.c, %.o, $(SRC))

#INCLUDE_DIRS = -Iinclude/magic

# can we find all header files automatically like src files?
# linux command to find path of all include directories and convert them like standard include path
#find -iname "*.h" -exec dirname {} \; | sed 's/^./-I./g' | xargs
INCLUDE_DIRS = $(shell find -iname "*.h" -exec dirname {} \; | sort -u | sed 's/^./-I./g' | xargs)

#CFLAGS = -g -Wall $(INCLUDE_DIRS)



$(info SRC: $(SRC))
$(info OBJ: $(OBJ))
$(info INCLUDE_DIRS: $(INCLUDE_DIRS))

all: main #make all will make main binary won't run it

run: all
	#./main  # uncomment and run then ./main also printed on console , to avoid it use @
	@./main

main: $(OBJ)
	gcc $^ -o $@ 

%.o: %.c
	#gcc -c $^ # doesn't specify that object files from which location 
	gcc $(INCLUDE_DIRS) -c $^ -o $@ # specify output object file location at same target location

clean:
	#rm -f main $(OBJ)	
	@rm -f main $(OBJ)	
