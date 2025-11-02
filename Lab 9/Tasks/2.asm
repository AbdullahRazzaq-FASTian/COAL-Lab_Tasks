INCLUDE Irvine32.inc

.data
    marks SDWORD 45,78,90,32,60,49,85
    count DD LENGTHOF marks
    passed DD ?
    failed DD ?
    msg1 BYTE "Passed students = ",0
    msg2 BYTE "Failed students = ",0

.code
countProc PROC
    mov eax,0
    mov ebx,0
    mov esi,0
    mov ecx,count
start_loop:
    cmp esi,ecx
    jge end_loop
    mov edx,marks[esi*TYPE marks]
    cmp edx,50
    jl fail
    inc eax
    jmp next
fail:
    inc ebx
next:
    inc esi
    jmp start_loop
end_loop:
    mov passed,eax
    mov failed,ebx
    ret
countProc ENDP

main PROC
    call countProc
    mov edx,OFFSET msg1
    call WriteString
    mov eax,passed
    call WriteInt
    call Crlf
    mov edx,OFFSET msg2
    call WriteString
    mov eax,failed
    call WriteInt
    call Crlf
    exit
main ENDP
END main
