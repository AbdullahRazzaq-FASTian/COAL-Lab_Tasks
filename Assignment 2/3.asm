INCLUDE Irvine32.inc
.data
    array SDWORD -1,2,-3,4,-5,6,-7,8,-9,10
    count DD SIZEOF array
    sum SDWORD ?

.code
main PROC
    ; sum = 0; i = 0;
    ; while (i < count)
    ; {
    ;     if (array[i] > 0)
    ;         sum = sum + array[i]
    ;     else
    ;         sum = sum - 1
    ;     i = i + 1
    ; }
    mov eax, 0
    mov ecx, count
    mov esi, 0

start_while:
    cmp esi, ecx
    jge end_while

    mov ebx, array[esi]
    cmp ebx, 0
    jle else_
    add eax, ebx
    jmp end_if

else_:
    dec eax
end_if:
    add esi, TYPE array
    jmp start_while
    
end_while:
    mov sum, eax
    call WriteInt

    exit
main ENDP
END main