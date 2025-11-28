INCLUDE Irvine32.inc
.data
    text BYTE "ASSEMBLY",0
    char BYTE 'E'
    isFound BYTE "Character found",0DH,0AH,0
    notFound BYTE "Character not found",0DH,0AH,0

.code
main PROC
    mov edi, offset text
    mov al, char
    mov ecx, lengthof text
    
    cld
    repne scasb

    jne not_found
found_:
    call Crlf
    mov edx, offset isFound  
    call WriteString  
    call Crlf
    jmp continue

not_found:
    call Crlf
    mov edx, offset notFound
    call WriteString
    call Crlf

continue:

    exit
main ENDP
END main