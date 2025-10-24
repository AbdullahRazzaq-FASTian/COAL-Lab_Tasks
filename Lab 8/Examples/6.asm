INCLUDE Irvine32.inc
;24K-0691 Abdullah Razzaq
.data
    originalFlagsMsg BYTE "Original Flags saved on stack.", 0
    restoredFlagsMsg BYTE "Flags restored from stack.", 0
.code
main PROC
    mov eax, 5
    sub eax, 5
    pushfd
    mov edx, OFFSET originalFlagsMsg
    call WriteString
    call Crlf

    mov eax, 10
    add eax, 1
    popfd
    mov edx, OFFSET restoredFlagsMsg
    call WriteString
    call Crlf
    call DumpRegs
    exit
main ENDP
END main