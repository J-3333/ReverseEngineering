SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

;Declare initialised variables
section .data	    
	prompt db 'Enter text: (Max 23 characters):',0
	prompt_len equ $-prompt
	
	result_msg db 'After Case Swapping:',0
	result_len equ $-result_msg
	
;Declare unintialised variables
section .bss	    
	input resb 24  	    ; Reserve 24 bytes for user input

section .text
	global _start		


_start:					
	;Print prompt
	mov eax,4
    mov ebx,1
    mov ecx,prompt
    mov edx,prompt_len
    int 0x80
	
	;Read user input
	mov eax, 3	        ; EAX return value - number of bytes read (actual bytes of input)
    mov ebx, 0
    mov ecx, input
    mov edx, 24       
    int 0x80           
	
	;Store length of input to edi
	
	
	 ; Initialize ESI to point to start of input
    mov esi, input
    push eax
    mov edi,eax     ;Store length in edi

	

;Check if it is the end of loop - IF END OF LOOP, jump to print_result
count_loop:             
    cmp edi,0   
    je print_result   
    
    mov al,[esi]        ;Move current character to AL
    
    cmp al,32
    jl skip             ;IF lesser than 32, jump to skip
	cmp al,126
	jg skip      ;IF greater than 126, jump to skip
   
    call rot47

    
skip:
    inc esi             ; move to next character
    dec edi             ; Decrease loop counter
    jmp count_loop      ; Repeat loop
    
;Perform swapcases
rot47:  
    ;Check if uppercase
    cmp al, 'A'          
    jl check_lowercase
    cmp al,'Z'
    jg check_lowercase
    
    add al,32
    jmp store_result
    
check_lowercase:
    cmp al, 'a'
    jl store_result
    cmp al,'z'
    jg store_result
    sub al, 32 
    
store_result:
    mov [esi], al
    ret
    
print_result:
    ; Print result message
	mov eax,4
    mov ebx,1
    mov ecx, result_msg
    mov edx, result_len
    int 0x80

    ; Print swapped text
    mov eax, 4
    mov ebx, 1
    mov ecx, input  ; Print modified input 
    pop edx         ; Restore original length for printing
    int 0x80



; Exit program
exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
	

