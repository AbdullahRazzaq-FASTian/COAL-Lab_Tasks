INCLUDE Irvine32.inc
;24K-0691 Abdullah Razzaq
.data
    var1 DWORD 5
    var2 DWORD 6
    msg1 BYTE "The sum calculated in AddTwo is: ", 0
    msg2 BYTE "Values printed inside AddTwo1:", 0
.code
main PROC
    call AddTwo
    call Crlf
    exit
main ENDP

AddTwo PROC
    mov eax, var1
    mov ebx, var2
    add eax, var2

    mov edx, OFFSET msg1
    call WriteString
    call WriteInt
    call CrlNext

    call AddTwo1
    ret
AddTwo ENDP

AddTwo1 PROC
    mov ecx, var1
    mov edx, var2

    mov ebx, OFFSET msg2
    call WriteString
    call Crlf

    mov eax, ecx
    call WriteInt
    call Crlf

    mov eax, edx
    call WriteInt
    call Crlf
    ret
AddTwo1 ENDP
END main