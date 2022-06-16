

section .data
    
section .data
    data dd 0    
section .bss
    cin:
        resb 1024

section .text
;ecx: String to print, 
;edx: Length of string
getline:
    mov ecx, eax
    mov eax, 3
    mov ebx, 0
    mov edx, 1024
    ret 
getn:
    call getline
    ;convert from ascii to decimal
    mov [data], eax
loopn:
    mov eax, [ecx+data]
    dec data
    jnz loopn
getchar:
    mov ecx, eax
    mov eax, 3
    mov ebx, 0
    mov edx, 1
    ;moving ecx to al to make char comparisons
    mov al, ecx
    ret 
print:
    mov ecx, eax
    mov edx, ebx
    mov eax, 4
    mov ebx, 1
    ret 