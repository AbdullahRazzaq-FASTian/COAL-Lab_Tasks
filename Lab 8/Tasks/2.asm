INCLUDE Irvine32.inc
.data
    msg1 BYTE "Enter 5 numbers:", 0
    msg2 BYTE "Reversed order:", 0
    spc  BYTE " ", 0
    arr  SDWORD 5 DUP(?)

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

    mov edx, OFFSET msg2
    call WriteString
    call Crlf

    mov ecx, 5
    mov esi, OFFSET arr
    add esi, (5 - 1) * TYPE SDWORD
L2:
    mov eax, [esi]
    call WriteDec
    mov edx, OFFSET spc
    call WriteString
    sub esi, TYPE SDWORD
    loop L2

    call Crlf
    exit
main ENDP
END main
