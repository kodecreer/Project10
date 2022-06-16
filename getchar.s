
section .bss
cin:
    resb 1
section .text
%include "io.h"
getchar:
    mov ecx, cin
    mov eax, READ
    mov ebx, STDIN
    mov edx, 2
    int 80h
    ;moving ecx to al to make char comparisons
    mov al, byte [cin]
    
    ret