INCLUDE Irvine32.inc
;24K-0691 Abdullah Razzaq
.data
    msg BYTE "Hello! The largest number is:", 0
.code
main PROC
    push 5
    push 7
    push 3
    push 2
    mov eax, 0
    mov ecx, 4
L1:
    pop edx
    cmp edx, eax
    jle Next
    mov eax, edx
Next:
    loop L1
    mov edx, OFFSET msg
    call WriteString
    call WriteDec
    call Crlf
    exit
main ENDP
END main