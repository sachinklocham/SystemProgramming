GCC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
READELF = arm-none-eabi-readelf

TARGET = main1

LD_SCRIPT = $(TARGET).ld
LD_MAP = $(TARGET).map
READELF_OUT = $(TARGET).txt

OBJ = main1.o

all: $(READELF_OUT)
	@

$(READELF_OUT): $(TARGET).elf
	$(READELF) -a $^ > $@
	 
main1.elf: $(OBJ) $(LD_SCRIPT)
# 	$(LD) -s -Bsymbolic -gc-sections -T$(LD_SCRIPT) -static -Map=$(LD_MAP) -o $@ $(OBJ)
	$(LD) -T$(LD_SCRIPT) -Map=$(LD_MAP) -o $@ $(OBJ)
	
#%.o: %.c
main1.o: main1.c
	$(GCC) -Wall -nostdlib -fno-builtin -ffreestanding -c $<

clean:
	rm -f *.o *.elf *.map *.txt *.log