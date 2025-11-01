INCLUDE Irvine32.inc
.code
main PROC
    mov eax, 3
    mov ebx, 7
    push eax    ;stack = 3
    push ebx    ;stack = 7,3
    pop eax     ;stack = 3      eax = 7
    push 10     ;stack = 10,3
    pop ebx     ;stack = 3      ebx = 10
    pop eax     ;eax = 3
    exit
main ENDP
END main