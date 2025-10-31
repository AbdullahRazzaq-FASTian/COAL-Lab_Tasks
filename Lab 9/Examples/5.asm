INCLUDE Irvine32.inc
.data
.code
main PROC
    xor eax,eax
    mov al, 26h
    call Crlf
    call WriteBin
    call Crlf
    rol al, 4 ; AL = 62h
    call WriteBin
    call Crlf
    call Crlf

main ENDP
END main