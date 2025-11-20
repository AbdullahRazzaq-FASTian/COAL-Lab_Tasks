INCLUDE Irvine32.inc

.data
a DWORD ?
b DWORD ?
g DWORD ?

t1 BYTE "First: ",0
t2 BYTE "Second: ",0
tE BYTE "ESP = ",0
tG BYTE "GCD = ",0

.code

ShowESP PROC
    push eax
    mov edx, offset tE
    call WriteString
    pop eax
    mov eax, esp
    call WriteHex
    call CrLf
    ret
ShowESP ENDP


Display PROC
    push ebp
    mov ebp, esp
    call ShowESP
    mov eax, [ebp+8]
    mov edx, offset tG
    call WriteString
    call WriteDec
    call CrLf
    pop ebp
    ret 4
Display ENDP


TakeInput PROC
    mov edx, offset t1
    call WriteString
    call ReadDec
    push eax

    mov edx, offset t2
    call WriteString
    call ReadDec
    push eax

    call CalcGCD
    ret
TakeInput ENDP


CalcGCD PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    mov ebx, [ebp+12]

L1:
    cmp ebx, 0
    jz L2
    xor edx, edx
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp L1

L2:
    push eax
    call Display
    ret
CalcGCD ENDP


main PROC
    call TakeInput
    exit
main ENDP

END main
