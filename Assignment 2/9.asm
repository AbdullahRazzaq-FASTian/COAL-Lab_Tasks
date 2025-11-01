INCLUDE Irvine32.inc

.data
    array   SDWORD 10,60,20,33,72,89,45,65,72,18
    sample  SDWORD 50
    count   DD LENGTHOF array 
    sum     SDWORD ?
    
.code
main PROC
    mov eax, 0              
    mov esi, 0              
    mov ecx, count          

start_while:
    cmp esi, ecx            
    jge end_while

    mov ebx, array[esi*TYPE array]   
    cmp ebx, sample         
    jg end_if             
    add eax, ebx            

end_if:
    inc esi                 
    jmp start_while         

end_while:
    mov sum, eax            
    call WriteInt           
    call Crlf

    exit
main ENDP
END main
