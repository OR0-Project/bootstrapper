ENTRY(_loader_main)

SECTIONS {
	/* load loader at 1MiB */
    . = 1M;

	.boot : {
        *(.multiboot)
	}

    .text : {
        *(.text)
    }

  	.rodata : {
  		*(.rodata)
  	}

    .data : {
    	*(.data)
    }

    .bss : {
		*(.bss)
		*(COMMON)
    }

    /DISCARD/ : {
    	*(.eh_frame)
        *(.comment)
    }
}