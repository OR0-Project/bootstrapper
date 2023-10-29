ASM = nasm
ASM_FLAGS = -f bin

default: build

clean:
	rm -f loader.efi

build:
	$(ASM) main.asm -o loader.efi $(ASM_FLAGS)