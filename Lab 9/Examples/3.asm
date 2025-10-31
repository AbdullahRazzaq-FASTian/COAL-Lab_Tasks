INCLUDE Irvine32.inc
.data
.code
main PROC
    xor eax,eax
    mov al, -128 ; DL = 10000000b
    call Crlf
    call WriteBin
    call Crlf
    sar al, 3 ; DL = 11110000b
    call WriteBin
    call Crlf
    call Crlf

main ENDP
END main