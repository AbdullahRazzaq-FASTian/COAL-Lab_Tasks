INCLUDE Irvine32.inc
;24K-0691 Abdullah Razzaq
.data
    mult DWORD 2
    msg BYTE "Hello Sir! The product of the three integers is: ", 0

.code
main PROC
    mov eax, 1
    mov ecx, 3
PushLoop:
    push mult
    add mult, 2
    loop PushLoop
    mov ecx, 3
MultiplyLoop:
    pop ebx
    mult ebx
    loop MultiplyLoop
    mov edx, OFFSET msg
    call WriteString
    call WriteDec
    call Crlf

    exit
main ENDP
END main