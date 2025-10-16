.section .text
.global _start

_start:
    # t0 = 0xF
    
    lui t5, 0x40000
    li t6, 0xAA

    sw t6, 0(t5)
    j done

done: nop
