INCLUDE Irvine32.inc
.data
.code
main PROC
    xor eax,eax
    clc ;CF=0
    call Crlf
    mov al, 88h ; CF=0 , AL=10001000b
    call WriteBin
    call Crlf
    rcl al, 1 ; CF=1 , AL= 00010000b
    call WriteBin
    call Crlf
    rcr al, 1 ; AL = 00001000, CF = 0
    call WriteBin
    call Crlf
    call Crlf

main ENDP
END main