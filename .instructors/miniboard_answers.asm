section .text

GLOBAL gen_random
GLOBAL print
GLOBAL print_less

; Using the Intel Manual, generate a random number with the `RDRAND` instruction.

; According to the description of the `RDRAND` instruction, it is not a guarantee
; that this instruction will create a random number when executed. Therefore, you
; must implement a loop that continues to execute the `RDRAND` instruction until it
; is successful.

; You are not permitted to use the `cmp` or `test` instructions. 
; However, you are allowed to use any of the `Jcc` instructions.

;; int gen_random();
gen_random:
    .loop:
    RDRAND eax          ; generate random integer and store in return register
    jnc .loop           ; if it was not sucessful, try again

    ret

;; size_t print(char **my_string, int str_len);
print:
    mov rdx, rsi        ; move str_len to its position for syscall
    mov rsi, [rdi]      ; derefence my_string and move it to its position for syscall
    mov rdi, 1          ; fd for stdout
    mov rax, 1          ; number for sys_write
    syscall

    ret                 

;; size_t print_less(char **my_string, int num_skip, int str_len);
print_less:
    test rsi, rsi          ; compare rsi with zero
    jge .continue          ; if rsi is greater than or equal to zero, continue on

.early_exit:
    mov rax, -1            ; otherwise return -1
    ret

.continue:
    sub rdx, rsi           ; shorten str_len by num_skip
    jl .early_exit         ; sub sets the Sign and Overflow flags. jl means that the SF is set (or is opposite OF in case of overflow).
                           ; so essentially, we do not continue if num_skip > str_len
    add [rdi], rsi         ; skip num_skip chars
    mov rsi, [rdi]         ; put new str pointer into position for syscall
    mov rdi, 1             ; fd for stdout
    mov rax, 1             ; number for sys_write
    syscall

    ret                 





; ;; size_t print_less(char **my_string, int num_skip, int str_len);
; print_less:
;     sub rdx, rsi           ; shorten str_len by num_skip
;     mov rcx, rsi
;     mov rsi, [rdi]         ; skip num_skip and put it into position for syscall
;     add rsi, rcx
;     mov rdi, 1             ; fd for stdout
;     mov rax, 1             ; number for sys_write
;     syscall

;     ret                 

; ;; size_t print_less(char *my_string, int num_skip, int str_len);
; print_less:
;     sub rdx, rsi           ; shorten str_len by num_skip
;     add rdi, rsi
;     mov rsi, rdi
;     mov rdi, 1             ; fd for stdout
;     mov rax, 1             ; number for sys_write
;     syscall

;     ret               