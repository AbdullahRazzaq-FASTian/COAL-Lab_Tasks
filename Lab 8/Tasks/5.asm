INCLUDE Irvine32.inc
.data
    msg1 BYTE "Enter a number: ", 0
    msg2 BYTE "Factorial: ", 0
    num DWORD ?
    fact DWORD 1

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov num, eax
    mov ecx, eax
    mov eax, 1
L1:
    mul ecx
    loop L1
    mov fact, eax

    mov edx, OFFSET msg2
    call WriteString
    mov eax, fact
    call WriteDec
    call Crlf

    exit
main ENDP
END main
