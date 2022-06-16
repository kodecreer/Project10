global _start

EXTERN getchar

section .text
%include "getchar.s"
_start:
    
    call getchar ;case when we enter y
    cmp al, 'y';we will enter y
    jnz fail_c1

    call getchar
    cmp ecx, 'ye';we will enter ye
    jz fail_c2
    cmp al, 'y'
    jnz fail_c2

    call getchar
    cmp al, 'n';we will enter in y
    jz fail_c3

    mov eax, 1
    mov ebx, 0;everything worked
    int 80h
fail_c1:
    ;this is the test case for when we try to compare the correct character
    mov eax, 1
    mov ebx, 1;input did not run correctly
    ;it will output 127 for the error code if you enter too many charcters
    int 80h
fail_c2:
    ;This isthe test case for when we try to enter more than one charcter
    mov eax, 1
    mov ebx, 2 ;input took in more than 1 characters
    int 80h
fail_c3:
    ;This is the test case for when we compare for something not being equal
    mov eax, 1
    mov ebx, 3
    int 80h