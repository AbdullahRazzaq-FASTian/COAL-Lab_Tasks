INCLUDE Irvine32.inc
.code
main PROC
    mov eax, 2
    ; 26 = 16 + 8 + 2 = 0001 1010
    mov ebx, eax
    mov ecx, eax
    shl eax, 4
    shl ebx, 3
    shl ecx, 1
    add eax, ebx
    add eax, ecx

    call WriteDec
    call Crlf
    
    exit
main ENDP
END main