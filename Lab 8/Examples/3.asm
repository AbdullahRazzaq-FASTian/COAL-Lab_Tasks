INCLUDE Irvine32.inc
;24K-0691 Abdullah Razzaq
.data
    versionHistory WORD 101, 102, 103, 104, 105
    rollbackHistory WORD 5 DUP(?)
    msg1 BYTE "Version History (Latest Last):", 0
    msg2 BYTE "Rollback Order (After Using PUSH & POP):", 0
    space BYTE " ", 0

.code
main PROC
    call Crlf
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    ; Display original version history
    mov ecx, LENGTHOF versionHistory
    mov esi, OFFSET versionHistory
displayOriginal:
    movzx eax, WORD PTR [esi]
    call WriteDec
    mov edx, OFFSET space
    call WriteString
    add esi, TYPE versionHistory
    loop displayOriginal

    ; Push all version numbers to stack
    mov ecx, LENGTHOF versionHistory
    mov esi, OFFSET versionHistory
pushVersions:
    mov ax, [esi]
    push ax
    add esi, TYPE versionHistory
    loop pushVersions

    ; Pop all version numbers in reverse order
    mov ecx, LENGTHOF rollbackHistory
    mov edi, OFFSET rollbackHistory
popVersions:
    pop ax
    mov [edi], ax
    add edi, TYPE rollbackHistory
    loop popVersions

    call Crlf
    mov edx, OFFSET msg2
    call WriteString
    call Crlf

    ; Display rollback array (reversed)
    mov ecx, LENGTHOF rollbackHistory
    mov esi, OFFSET rollbackHistory
displayRollback:
    movzx eax, WORD PTR [esi]
    call WriteDec
    mov edx, OFFSET space
    call WriteString
    add esi, TYPE versionHistory
    loop displayRollback

    call Crlf
    exit
main ENDP
END main