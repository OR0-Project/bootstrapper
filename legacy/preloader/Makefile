# Preloader

CC = gcc
ASM = nasm
LINK = ld

C_FLAGS = -Wall -fno-pie -m32 -ffreestanding -nostdlib -Iinc -c -lgcc
ASM_FLAGS = -f elf
LINK_FLAGS = -m elf_i386 -n

# targets
default: build/preloader

prep:
	python3 ./prep.py

clean:
	rm -rf ./build
	rm -rf ../../cdrom/sys/preloader*
	rm -rf ./obj

build/preloader: prep preloader.o main.o 
	$(LINK) $(LINK_FLAGS) -o build/preloader obj/preloader.o obj/main.o -T src/preloader.ld
	cp build/preloader ../../../cdrom/sys/preloader.bin


# objects
main.o:
	$(CC) src/main.c -o obj/main.o $(C_FLAGS)

# Assembler stuff
preloader.o:
	$(CC) src/preloader.S -o obj/preloader.o $(C_FLAGS)