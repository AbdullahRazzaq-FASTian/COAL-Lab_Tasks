INCLUDE Irvine32.inc
.data
.code
main PROC
    xor eax,eax
    mov al, 32 ;DL=00100000b =32
    call Crlf
    call WriteBin
    call Crlf
    SHR al, 1 ;DL=00010000b, CF=0 =16
    call WriteBin
    call Crlf
    call Crlf

main ENDP
END main