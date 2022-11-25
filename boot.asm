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

Text1       db      'Welcome to Redapple OS', 0
Text2       db      'I am ready for your commands sir', 0
Text3       db      'V1', 0
Text4       db      '-RAos-', 0