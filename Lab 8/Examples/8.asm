INCLUDE Irvine32.inc
;24K-0691 Abdullah Razzaq
SIZE = 3

.data
    str1 BYTE "Enter a signed integer: ", 0
    str2 BYTE "The sum of the integers is: ", 0
    array DWORD SIZE DUP(?)

.code
main PROC
    call Clrscr
    mov esi, OFFSET array
    mov ecx, SIZE
    call PromptForIntegers
    call ArraySum
    call DisplaySum
    exit
main ENDP

PromptForIntegers PROC USES esi ecx
    mov edx, OFFSET str1
L1:
    call WriteString
    call ReadInt
    call Crlf
    mov [esi], eax
    add esi, TYPE DWORD
    loop L1
    ret
PromptForIntegers ENDP

ArraySum PROC USES esi ecx
    mov eax, 0
L1:
    add eax, [esi]
    add esi, TYPE DWORD
    loop L1
    ret
ArraySum ENDP

DisplaySum PROC
    mov edx, OFFSET str2
    call WriteString
    call WriteInt
    call Crlf
    ret
DisplaySum ENDP

END main