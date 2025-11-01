INCLUDE Irvine32.inc
.data
    num1 DD 4
    num2 DD 2
    num3 DD 3
    num4 DD 1
    result DD ?

.code
main PROC
    ; if (num1 > num2 && num3 != num4)
    ;   result = num1 + num3;
    ; else if (num2 == num4)
    ;   result = num2 - num1;
    ; else
    ;   result = 0;
    mov eax, num1
    mov ebx, num2
    mov ecx, num3
    mov edx, num4

    cmp eax, ebx
    jbe else_if
    cmp ecx, edx
    je else_if
    add eax, num3
    mov result, eax
    jmp end_if

else_if:
    cmp ebx, edx
    jne else_
    sub ebx, eax
    mov result, ebx
    jmp end_if
    
else_:
    mov result, 0
    
end_if:
    mov eax, result
    call WriteDec

    exit
main ENDP
END main