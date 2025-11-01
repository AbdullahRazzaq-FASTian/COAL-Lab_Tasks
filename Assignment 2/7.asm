INCLUDE Irvine32.inc

.data
    isPos  BYTE "The number is POSITIVE", 0
    isNeg  BYTE "The number is NEGATIVE", 0
    isZero BYTE "The number is ZERO", 0

.code
main PROC
    mov al, -4       

    cmp al, 0
    jg is_positive      
    jl is_negative      
    
    mov edx, OFFSET isZero
    call WriteString
    jmp done

is_positive:
    mov edx, OFFSET isPos
    call WriteString
    jmp done

is_negative:
    mov edx, OFFSET isNeg
    call WriteString

done:
    call Crlf
    exit
main ENDP
END main
