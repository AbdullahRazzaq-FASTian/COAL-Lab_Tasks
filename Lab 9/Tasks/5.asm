INCLUDE Irvine32.inc
.data
    readings SDWORD 12,25,30,40,18,22,27,35,20,15
    count = LENGTHOF readings
    sum SDWORD ?
    avg SDWORD ?
    above SDWORD ?
    below SDWORD ?
    scaled SDWORD ?
    encrypted BYTE ?
    msgSum     BYTE "Sum of readings = ",0
    msgAvg     BYTE "Average reading = ",0
    msgAbove   BYTE "Readings above average = ",0
    msgBelow   BYTE "Readings below average = ",0
    msgScaled  BYTE "Scaled average (SHL) = ",0
    msgEncrypt BYTE "Encrypted result (ROR) = ",0

.code
calc PROC
    mov ecx, count
    mov esi, OFFSET readings
    xor eax, eax
L1:
    add eax, [esi]
    add esi, TYPE readings
    loop L1
    mov sum, eax
    mov ebx, count
    cdq
    idiv ebx
    mov avg, eax
    ret
calc ENDP

main PROC
    call Crlf

    call calc
    mov eax, avg
    mov ebx, 0
    mov ecx, 0
    mov esi, OFFSET readings
    mov edx, count
L2:
    mov edi, [esi]
    cmp edi, eax
    jg above_label
    jl below_label
    jmp next_label
above_label:
    inc ebx
    jmp next_label
below_label:
    inc ecx
next_label:
    add esi, TYPE readings
    dec edx
    jnz L2
    mov above, ebx
    mov below, ecx
    mov eax, avg
    shl eax, 1
    mov scaled, eax
    mov al, BYTE PTR scaled
    ror al, 1
    mov encrypted, al

    mov edx, OFFSET msgSum
    call WriteString
    mov eax, sum
    call WriteInt
    call Crlf

    mov edx, OFFSET msgAvg
    call WriteString
    mov eax, avg
    call WriteInt
    call Crlf

    mov edx, OFFSET msgAbove
    call WriteString
    mov eax, above
    call WriteInt
    call Crlf

    mov edx, OFFSET msgBelow
    call WriteString
    mov eax, below
    call WriteInt
    call Crlf

    mov edx, OFFSET msgScaled
    call WriteString
    mov eax, scaled
    call WriteInt
    call Crlf

    mov edx, OFFSET msgEncrypt
    call WriteString
    mov al, encrypted
    call WriteBin
    call Crlf

    call Crlf
    exit
main ENDP
END main
