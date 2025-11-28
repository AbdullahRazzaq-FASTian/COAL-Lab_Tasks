INCLUDE Irvine32.inc
.data
    text BYTE "PROGRAMMING",0
    char BYTE 'G'
    msg BYTE "Total Occurances: ",0
    count DWORD 0

.code
main PROC
    mov edi, offset text
    mov al, char
    mov ecx, lengthof text
    
    cld
find_occurances:
    scasb
    jne continue
    inc count
continue:
    loop find_occurances
    
    call crlf
    mov edx, offset msg
    call WriteString
    mov eax, count
    call WriteDec
    call Crlf
    call crlf

    exit
main ENDP
END main