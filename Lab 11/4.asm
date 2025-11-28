INCLUDE Irvine32.inc

.data
    mat dword 1, 2, 3, 4, 5, 6, 7, 8, 9 
    msg_output byte "Sum of all elements: ", 0
    row_size = 3 * 4            
    
.code
main proc
    mov eax, 0                  
    mov ebx, 0                  
    mov ecx, 3                  

outer_loop:
    push ecx                    
    mov ecx, 3                  
    mov esi, 0                  

    inner_loop:
        add eax, mat[ebx + esi*4]   
        
        inc esi                     
        loop inner_loop

    pop ecx                     
    add ebx, row_size           
    loop outer_loop

    call crlf
    mov edx, offset msg_output
    call writestring
    
    call writeint               
    call crlf
    call crlf

    exit
main endp
end main