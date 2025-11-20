INCLUDE Irvine32.inc

.data
t1 BYTE "Enter a number: ",0
t2 BYTE "Square = ",0

.code

LocalSquare PROC
    enter 4,0
    mov edx, offset t1
    call WriteString
    call ReadInt
    mul eax
    mov edx, offset t2
    call WriteString
    call WriteInt
    leave
    ret
LocalSquare ENDP

main PROC
    call LocalSquare
    exit
main ENDP

END main