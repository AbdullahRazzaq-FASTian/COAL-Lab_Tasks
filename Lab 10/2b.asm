INCLUDE Irvine32.inc

.data
msgMin BYTE "Min element: ",0
msgMax BYTE "Max element: ",0
A DWORD 23, 34, 12, 56, 5

.code

MinMaxArray PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]
    mov ecx, [ebp+12]
    mov ebx, [esi]
    add esi, 4
    dec ecx

M1:
    cmp [esi], ebx
    jle M2
    mov ebx, [esi]
M2:
    add esi, 4
    loop M1

    mov eax, ebx
    mov edx, offset msgMax
    call WriteString
    call WriteInt
    call CrLf

    mov esi, [ebp+8]
    mov ecx, [ebp+12]
    mov ebx, [esi]
    add esi, 4
    dec ecx

N1:
    cmp [esi], ebx
    jg N2
    mov ebx, [esi]
N2:
    add esi, 4
    loop N1

    mov eax, ebx
    mov edx, offset msgMin
    call WriteString
    call WriteInt

    pop ebp
    ret
MinMaxArray ENDP


main PROC
    push LENGTHOF A
    lea eax, A
    push eax
    call MinMaxArray
    exit
main ENDP

END main