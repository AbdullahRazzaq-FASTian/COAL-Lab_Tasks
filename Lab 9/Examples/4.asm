INCLUDE Irvine32.inc
.data
.code
main PROC
    xor eax,eax
    mov ax, -128 ; EAX = ????FF80h
    call Crlf
    call WriteBin
    call Crlf
    shl eax, 16 ; EAX = FF800000h
    call WriteBin
    call Crlf
    sar eax, 16 ; EAX = FFFFFF80h
    call WriteBin
    call Crlf
    call Crlf

main ENDP
END main