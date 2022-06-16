global _start

EXTERN getchar

section .text
%include "getchar.s"
_start:
    
    call getchar ;case when we enter y
    cmp al, 'y'
    jnz fail_c1

    call getchar
    cmp ecx, 'ye';case when we enter ye
    jz fail_c2

    mov eax, 1
    mov ebx, 0;everything worked
    int 80h
fail_c1:
    mov eax, 1
    mov ebx, 1;input did not run correctly
    ;it will output 127 for the error code if you enter too many charcters
    int 80h
fail_c2:
    mov eax, 1
    mov ebx, 2 ;input took in more than 1 characters
    int 80h