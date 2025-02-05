# Compiler and linker
AS = as
LD = ld

# Flags
ASFLAGS = --64
LDFLAGS = -nostdlib

TARGET = calling_functions

$(TARGET): calling_functions.o
	$(LD) $(LDFLAGS) -o $(TARGET) calling_functions.o

calling_functions.o: calling_functions.s
	$(AS) $(ASFLAGS) calling_functions.s -o calling_functions.o

clean:
	rm -f $(TARGET) calling_functions.o
