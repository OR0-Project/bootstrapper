# loader make file

CC = gcc
ASM = nasm
LINK = ld
EMU = qemu-system-x86_64

C_FLAGS = -Wall -fno-pie -m64 -ffreestanding -nostdlib -Iinc -c -lgcc
ASM_FLAGS = -f elf64
LINK_FLAGS = -m elf_x86_64 -n
EMU_FLAGS = -monitor tcp:localhost:5555,server,nowait

# targets
default: all

prep:
	python3 ./prep.py

clean:
	rm -rf ./build
	rm -rf ./obj

all: build/loader


run: clean all
	$(EMU) -m 256 -cdrom build/loader.iso -cpu Westmere $(EMU_FLAGS)

debug: clean all
	gdb -q --args $(EMU) \
        -enable-kvm -smp 2 -m 256 -cdrom build/loader.iso -cpu Westmere $(EMU_FLAGS)

build/loader: prep loader.o main.o 
	$(LINK) $(LINK_FLAGS) -o build/loader obj/loader.o obj/main.o -T src/loader.ld


# objects
main.o:
	$(CC) src/main.c -o obj/main.o $(C_FLAGS)

# Assembler stuff
loader.o:
	$(ASM) src/loader.asm -o obj/loader.o $(ASM_FLAGS)