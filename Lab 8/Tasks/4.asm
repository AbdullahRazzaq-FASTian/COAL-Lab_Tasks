INCLUDE Irvine32.inc
.data
    msg1 BYTE "Enter a Word: ", 0
    msg2 BYTE "Vowels: ", 0
    msg3 BYTE "Consonants: ", 0
    buffer BYTE 50 DUP(?)
    vowelCnt DWORD 0
    consCnt DWORD 0

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString

    mov ecx, eax
    mov esi, OFFSET buffer
    L1:
        mov al, [esi]
        cmp al, 0
        je done
        cmp al, 'A'
        je vowel
        cmp al, 'E'
        je vowel
        cmp al, 'I'
        je vowel
        cmp al, 'O'
        je vowel
        cmp al, 'U'
        je vowel
        cmp al, 'a'
        je vowel
        cmp al, 'e'
        je vowel
        cmp al, 'i'
        je vowel
        cmp al, 'o'
        je vowel
        cmp al, 'u'
        je vowel
        inc consCnt
        jmp next
        vowel:
            inc vowelCnt
        next:
            inc esi
            loop L1
    done:
        mov edx, OFFSET msg2
        call WriteString
        mov eax, vowelCnt
        call WriteDec
        call Crlf

        mov edx, OFFSET msg3
        call WriteString
        mov eax, consCnt
        call WriteDec
        call Crlf

    exit
main ENDP
END main
