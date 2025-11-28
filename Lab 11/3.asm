INCLUDE Irvine32.inc

.data
    text byte "Assembly",0
    og byte "Original: ", 0
    rev byte "Reversed: ", 0

.code
main proc
    mov esi, offset text    
    call strlength          
    mov ebx, ecx
    
    mov ebx, eax            
    mov ecx, eax            
    shr ecx, 1              ; number of swaps are length/2
    
    mov edx, offset og
    call writestring
    mov edx, offset text
    call writestring
    call crlf

    cmp ecx, 0
    je display_reversed     ; can cause error if length is 0 (infinite loop)

    mov esi, offset text    
    mov edi, offset text    
    dec ebx                 
    add edi, ebx            
    
    cld                     
    
reverse_string:
    mov al, [esi]       ; temp = str[i]
    
    mov bl, [edi]       ; str[i] = str[len - i - 1]
    mov [esi], bl
    
    mov [edi], al       ; str[len - i - 1] = temp
    
    inc esi                 
    dec edi                 

    loop reverse_string

display_reversed:
    mov edx, offset rev
    call writestring
    mov edx, offset text
    call writestring
    call crlf

    exit
main endp
end main