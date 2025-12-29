PROJ = main
CPU ?= cortex-m3
BOARD ?= stm32vldiscovery
TOOLCHAIN_PREFIX = arm-none-eabi

FREERTOS_PATH = ../FreeRTOS-Kernel

OBJ = boot.o \
	  start.o \
	  $(FREERTOS_PATH)/tasks.o \
	  $(FREERTOS_PATH)/portable/MemMang/heap_4.o \
	  portFunction.o \
	  $(FREERTOS_PATH)/portable/GCC/ARM_CM3/port.o \
	  $(FREERTOS_PATH)/list.o \

##pick either of heap file


INC = -I$(FREERTOS_PATH)/include/ \
	  -I$(FREERTOS_PATH)/portable/GCC/ARM_CM3 \
	  -I./


.PHONY: all
all: $(PROJ).elf

# output_file: from_file
%.o: %.S #.o from .S files
	$(TOOLCHAIN_PREFIX)-as -mthumb -mcpu=$(CPU) -g -c $^ -o $@

%.o: %.c
	$(TOOLCHAIN_PREFIX)-gcc $(INC) -mthumb -mcpu=$(CPU) -g -c $^ -o $@

$(PROJ).elf: $(OBJ)
	$(TOOLCHAIN_PREFIX)-ld -Tmap.ld $^ -o $@
	$(TOOLCHAIN_PREFIX)-objdump -D -S $@ > $@.lst
	$(TOOLCHAIN_PREFIX)-readelf -a $@ > $@.debug

qemu:
	qemu-system-arm -S -M $(BOARD) -cpu $(CPU) -nographic  -kernel $(PROJ).elf -gdb tcp::1234
gdb:
#curl -Lf https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit -o ~/.gdbinit

	gdb-multiarch -q $(PROJ).elf -ex "source ~/.gdbinit" -ex "target remote localhost:1234"

clean:
	rm -rf *.out *.elf .gdb_history *.lst *.debug $(OBJ)