# include other makefiles if needed
include other_makefile.mk	


# ==============================
# Compiler from other makefile.mk
# ==============================
#CC := gcc

# ==============================
# Build type (debug / release)
# Default: debug
# Usage:
#   make
#   make BUILD=release
# ==============================
BUILD ?= debug

# ==============================
# Directory layout
# ==============================
SRC_DIR := src
OBJ_DIR := OBJS

#===============================
#macros for repeated use 
#===============================
define some_macro
	@echo "generating " $@ " from " $<
endef


# ==============================
# Find all source files recursively
# ==============================
SRC := $(shell find $(SRC_DIR) -iname "*.c")

# ==============================
# Map:
#   src/foo/bar.c  --> OBJS/foo/bar.o
# ==============================
OBJ := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

# ==============================
# Auto-detect include directories
# Finds all folders containing .h files
# Converts:
#   ./include  --> -I./include
# ==============================
INCLUDE_DIRS := $(shell find -iname "*.h" -exec dirname {} \; \
                 | sort -u | sed 's/^./-I./g' | xargs)

# ==============================
# Compiler flags
# -Wall  : enable warnings
# -MMD   : generate dependency (.d) files
# -MP    : add phony targets for headers
# ==============================
CFLAGS := -Wall -MMD -MP $(INCLUDE_DIRS)

# ==============================
# Build-type-specific flags
# ==============================
ifeq ($(BUILD),debug)
	CFLAGS += -O0 -g
else
	CFLAGS += -O2 -DNDEBUG
endif

# ==============================
# Print useful debug info
# ==============================
ifeq ($(BUILD),debug)
$(info ================= DEBUG BUILD =================)
$(info SRC: $(SRC))
$(info OBJ: $(OBJ))
$(info INCLUDE_DIRS: $(INCLUDE_DIRS))
$(info BUILD: $(BUILD))
$(info ===============================================)
endif

# ==============================
# Default target
# ==============================
all: main

# ==============================
# Run the application
# ==============================
run: all
	@./main

# ==============================
# Link step
# ==============================
main: $(OBJ)
	$(CC) $^ -o $@
	$(some_macro)

# ==============================
# Compile rule
# Creates required subdirectories automatically
# ==============================
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@
	$(some_macro)

# ==============================
# Include auto-generated dependency files
# Safe even if .d files do not exist
# ==============================
-include $(OBJ:.o=.d)

# ==============================
# Cleanup
# ==============================
clean:
	@rm -rf $(OBJ_DIR) main

# ==============================
# Help target
# ==============================
help:
	@echo ""
	@echo "Usage:"
	@echo "  make                  Build the project (debug mode)"
	@echo "  make BUILD=release    Build optimized release version"
	@echo "  make run              Build and run the executable"
	@echo "  make clean            Remove all build artifacts"
	@echo "  make help             Show this help message"
	@echo ""

# ==============================
# Phony targets
# ==============================
.PHONY: all clean run help
