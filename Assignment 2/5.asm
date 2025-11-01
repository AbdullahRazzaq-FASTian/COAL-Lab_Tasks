INCLUDE Irvine32.inc
.code
printBin MACRO
    call WriteBin
    call Crlf
ENDM

main PROC
    xor eax, eax
    
    MOV AL,0D4H     ; Al = 1101 0100
    SHL AL,3        ; Al = 1010 0000
    printBin

    MOV AL,0D4H     ; Al = 1101 0100
    SAL AL,3        ; Al = 1010 0000
    printBin
    
    STC             ; C = 1
    MOV AL,0D4H     ; Al = 1101 0100
    ROL AL,1        ; Al = 1010 1001
    printBin
    
    STC             ; C = 1
    MOV AL,0D4H     ; Al = 1101 0100
    RCR AL,3        ; Al = 0011 1010    C = 1
    printBin

    exit
main ENDP
END main
