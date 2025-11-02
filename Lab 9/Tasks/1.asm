INCLUDE Irvine32.inc

.data
    array1 SDWORD 2,4,6,8,10
    array2 SDWORD 1,4,6,9,10
    count  DD LENGTHOF array1
    matches DD ?
    msg BYTE "Matching elements = ",0

.code
main PROC
    mov eax,0
    mov esi,0
    mov ecx,count

start_while:
    cmp esi,ecx
    jge end_while

    mov ebx,array1[esi*TYPE array1]
    mov edx,array2[esi*TYPE array2]
    cmp ebx,edx
    jne not_equal
    inc eax

not_equal:
    inc esi
    jmp start_while

end_while:
    mov matches,eax
    mov edx,OFFSET msg
    mov eax,matches
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP
END main