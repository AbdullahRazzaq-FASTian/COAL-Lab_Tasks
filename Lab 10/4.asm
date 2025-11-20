INCLUDE Irvine32.inc

.data
p1 BYTE "Enter a number: ",0
p2 BYTE "Factorial = ",0

.code

Fact PROC
    enter 4,0
    mov eax, [ebp+8]
    cmp eax, 1
    jle L0
    mov [ebp-4], eax
    dec eax
    push eax
    call Fact
    mov ecx, [ebp-4]
    mul ecx
    jmp L1
L0:
    mov eax, 1
L1:
    leave
    ret 4
Fact ENDP

main PROC
    mov edx, offset p1
    call WriteString
    call ReadInt
    push eax
    call Fact
    mov edx, offset p2
    call WriteString
    call WriteInt
    exit
main ENDP

END main