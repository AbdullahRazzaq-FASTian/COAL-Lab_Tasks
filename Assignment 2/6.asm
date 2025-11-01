INCLUDE Irvine32.inc
.data
    op1 SDWORD 5
    op2 SDWORD 10
    x SDWORD 0
    y SDWORD 9
    z SDWORD 0

.code
main PROC
    ; while (op1 <= op2)
    ; {
    ;     if (op1 >= x && op1 =< y)
    ;         z += 10;    
    ;     else
    ;         z -= 10;    
    ;     op1--;
    ; }
    mov eax, op1

start_while:
    cmp eax, op2
    jg end_while

    cmp eax, x
    jl else_
    cmp eax, y
    jg else_
    add z, 10
    jmp end_if

else_:
    sub z, 10

end_if:
    dec eax
    jmp start_while
    
end_while:
    mov eax, z
    call WriteInt

    exit
main ENDP
END main