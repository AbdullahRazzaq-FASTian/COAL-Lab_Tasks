INCLUDE Irvine32.inc
.data
    num1 DD 6
    num2 DD 5
    result DD ?
    msg BYTE "The result of num1 x num2 is: ",0

.code
main PROC
    mov cl, 0      ;Check all 32 bits
    mov edx, 0      ;Stores result
    mov ebx, num2
    
start_loop:
    cmp cl, 32
    je end_loop

    test ebx, 1
    jz do_nothing
    mov eax, num1
    shl eax, cl
    add edx, eax

do_nothing:
    shr ebx, 1
    inc cl
    jmp start_loop

end_loop:

    mov result, edx
    mov eax, result
    mov edx, offset msg
    call Crlf
    call WriteString
    call WriteDec
    call Crlf
    call Crlf

    exit
main ENDP
END main