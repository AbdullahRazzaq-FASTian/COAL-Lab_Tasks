INCLUDE Irvine32.inc
.data
    msg1 BYTE "Enter 5 numbers:", 0
    msg2 BYTE "Largest number: ", 0
    msg3 BYTE "Smallest number: ", 0
    arr  SDWORD 5 DUP(?)
    smallest SDWORD ?
    largest SDWORD ?

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    mov ecx, 5
    mov esi, OFFSET arr
    L1:
        call ReadInt
        mov [esi], eax
        add esi, TYPE SDWORD
        loop L1

        mov ecx, 4
        mov esi, OFFSET arr
        mov eax, [esi]
        mov ebx, [esi]
        add esi, TYPE SDWORD
    L2:
        ; Set Largest
        cmp eax, [esi]
        JGE cont1
        mov eax, [esi]
        cont1:
        ; Set Smallest
        cmp ebx, [esi]
        JLE cont2
        mov ebx, [esi]
        cont2:

        add esi, TYPE SDWORD
        loop L2

    mov edx, offset msg2
    mov largest, eax
    call WriteString
    call WriteInt
    call Crlf

    mov edx, offset msg3
    mov smallest, ebx
    mov eax, smallest
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP
END main
