INCLUDE Irvine32.inc
.data
    value BYTE 10110110b
    og BYTE "Original Value: ",0
    enc BYTE "Encrypted Value: ",0

.code
main PROC
    mov edx, offset og
    
    call Crlf
    call WriteString
    call WriteBin

    mov al, value
    rol al, 2
    shr al, 1

    mov edx, offset enc

    call Crlf
    call WriteString
    call WriteBin
    call Crlf
    call Crlf
    
    exit
main ENDP
END main