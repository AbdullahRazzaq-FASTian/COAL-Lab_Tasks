INCLUDE Irvine32.inc 
.data
    msg1 BYTE "Enter number: ",0
    msg2 BYTE "Positive Counts: ",0
    msg3 BYTE "Negative Counts: ",0
    msg4 BYTE "Zero Counts: ",0
    spc BYTE " ",0
    posCnt DD 0
    negCnt DD 0
    zeroCnt DD 0

.code
main PROC
    mov ecx, 5
    mov edx, offset msg1
    L:  
        call WriteString
        push eax
        push edx
        mov eax, 5
        sub eax, ecx
        inc eax
        mov edx, offset spc
        call WriteDec
        call WriteString
        pop edx
        pop eax
        call ReadInt
        cmp eax, 0
        jne Positive
        Zero:
            inc zeroCnt
            jmp continue
        Positive:
            cmp eax, 0
            jl Negative
            inc posCnt
            jmp continue
        Negative:
            inc negCnt
        continue:
        loop L

    mov edx, offset msg2
    mov eax, posCnt
    call WriteString
    call WriteDec
    call Crlf

    mov edx, offset msg3
    mov eax, negCnt
    call WriteString
    call WriteDec
    call Crlf

    mov edx, offset msg4
    mov eax, zeroCnt
    call WriteString
    call WriteDec
    call Crlf

    exit    
main ENDP
END main