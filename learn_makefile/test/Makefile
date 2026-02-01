
#SRC_FILES = main.c msg.c
SRC_FILES = $(shell find -iname "*.c") # find all .c files in current directory
#OBJ_FILES = main.o msg.o
#or
#OBJ_FILES = $(SRC_FILES:%.c=%.o) # replace .c with .o pattern substitution working with or without %
#or
OBJ_FILES = $(patsubst %.c,%.o, $(SRC_FILES)) # replace .c with .o patsubst - pattern substitution
#printing detail on  console
$(info $(SRC_FILES) $(OBJ_FILES))
#or seprately
# $(info SRC_FILES: $(SRC_FILES))
# $(info OBJ_FILES: $(OBJ_FILES))	

main: $(OBJ_FILES)
#	gcc $(OBJ_FILES) -o main
	gcc $^ -o $@
# $^ : all dependencies [OBJ_FILES], $@ - target [main]

# all .o from .c files
%.o: %.c
	gcc -c $^

run: main
	./main
clean:
	rm -f main $(OBJ_FILES)