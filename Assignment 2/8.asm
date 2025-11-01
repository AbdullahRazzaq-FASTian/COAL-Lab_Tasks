INCLUDE Irvine32.inc

.data
    num1 SWORD 1234   
    num2 SWORD -25    
    result SDWORD ?     

.code
main PROC
    xor eax, eax
    xor edx, edx
    mov ax, num1
    imul num2
    mov result, eax 
    shl edx, 16
    mov eax, edx
    add eax, result
    call WriteInt
    call Crlf

    exit
main ENDP
END main
