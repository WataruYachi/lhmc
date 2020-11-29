global _start

section .text 
_start:
    mov rdi, 1   ; 引数
    mov rax, 60  ; exitの番号は60
    syscall