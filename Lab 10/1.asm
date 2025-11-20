INCLUDE Irvine32.inc

.data
x DWORD 9
y DWORD 3
z DWORD 2

.code

ThreeProd PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    imul eax, [ebp+12]
    imul eax, [ebp+16]
    call WriteInt
    pop ebp
    ret
ThreeProd ENDP

main PROC
    push z
    push x
    push y
    call ThreeProd
    exit
main ENDP

END main