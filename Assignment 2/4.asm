INCLUDE Irvine32.inc
.data
    
.code
main PROC
    XOR eax, eax
    MOV AX, 0H
    MOV ECX, 0AH
DOLOOP:
    DEC AX
    LOOP DOLOOP

    ; 0000FFFF
    ; 0000FFFE
    ; 0000FFFD
    ; 0000FFFC
    ; 0000FFFB
    ; 0000FFFA
    ; 0000FFF9
    ; 0000FFF8
    ; 0000FFF7
    ; 0000FFF6

    exit
main ENDP
END main