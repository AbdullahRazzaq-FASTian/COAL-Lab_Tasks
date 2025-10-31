INCLUDE Irvine32.inc
.code
main PROC
    xor eax, eax
    mov al, 5 ;DL=00000101b =5
    call Crlf
    call WriteBin
    call Crlf
    SHL al, 1 ;CF=0, DL=00001010b =10   
    call WriteBin
    call Crlf
    call Crlf
    exit
main ENDP
END main