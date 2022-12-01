[BITS 16]
    JMP SHORT Start_OS
    NOP

; Start OS
Start_OS:
    MOV ax, 07C0h
    ADD ax, 544
    CLI

    MOV ss, ax
    MOV sp, 4096

    STI
    MOV ax, 07C0h
    MOV ds, ax


    ; Print text 1
    MOV dl, 1
    MOV dh, 1

    CALL MoveCursor

    MOV si, Text1
    CALL Write

    ; Print text 2
    MOV dl, 1
    MOV dh, 2

    CALL MoveCursor

    MOV si, Text2
    CALL Write

    ; Print text 3
    MOV dl, 1
    MOV dh, 4

    CALL MoveCursor

    MOV si, Text3
    CALL Write

    ; Print text 4
    MOV dl, 1
    MOV dh, 5

    CALL MoveCursor

    MOV si, Text4
    CALL Write



    JMP $

; Cursor
MoveCursor:
    PUSHA

    MOV bh, 0
    MOV ah, 2

    INT 0x10

    POPA
    RET

; Write
Write:
    PUSHA

    MOV ah, 0x0E
    MOV bh, 0

    .nextChar:
        LODSB

        CMP al, 0
        JE .End

        INT 0x10

        JMP .nextChar
    
    .End:
        POPA
        RET

; Texts
Text1       db      'Welcome to Redapple OS - Morteza Hosseini', 0
Text2       db      'I am ready for your commands sir', 0
Text3       db      'V1', 0
Text4       db      '-RAos-', 0

; Times
TIMES 510 - ($ - $$)    db      0
dw 0xAA55