[BITS 16]
    JMP SHORT Start_OS
    NOP

Start_OS:
    MOV ax, 07C0h
    ADD ax, 544
    CLI

    MOV ss, ax
    MOV sp, 4096

    STI
    MOV ax, 07C0h
    MOV ds, ax