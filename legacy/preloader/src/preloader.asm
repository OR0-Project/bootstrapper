global _mboot_main
extern mboot_main

section .multiboot

multiboot_header_start:
    dd 0xe85250d6										; magic number
    dd 0												; i386 protected mode code
    dd multiboot_header_end - multiboot_header_start	; header length
    dd 0x100000000 - (0xe85250d6 + 0 + (multiboot_header_end - multiboot_header_start))		; 0x100000000 - (magic + mode + header_size)

    dw 0    ; type
    dw 0    ; flags
    dd 8    ; size
multiboot_header_end:

; ///////////////////////////////////////////////////////////////////////////
; entry point ///////////////////////////////////////////////////////////////
section .text
bits 32
_mboot_main:
	mov esp, stack_top
    
	call mboot_main
	hlt

; ///////////////////////////////////////////////////////////////////////////
; stack memory //////////////////////////////////////////////////////////////
section .bss
align 4096

stack_bottom:
	resb 4096 * 4 ; 16 KiB
stack_top: