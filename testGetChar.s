global _start

EXTERN getchar

section .text
%include "getchar.s"
_start:
    call getchar
    cmp al, 'y'
    mov eax, 1
    jnz failed
    mov ebx, 0;everything worked
    int 80h
failed:
    mov ebx, 1;input did not run correctly
    ;it will output 127 for the error code if you enter too many charcters
    int 80h
