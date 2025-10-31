INCLUDE Irvine32.inc
.data
.code
main PROC
    xor eax,eax
    mov al, 01h ; AL = 00000001b
    call Crlf
    call WriteBin
    call Crlf
    ror al, 1 ; AL = 10000000b, CF = 1
    call WriteBin
    call Crlf
    ror al, 1 ; AL = 01000000b, CF = 0
    call WriteBin
    call Crlf
    call Crlf

main ENDP
END main