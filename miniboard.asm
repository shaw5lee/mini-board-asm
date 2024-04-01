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
    ret




; This function writes `str_len` bytes of the string pointed to by `my_string`. Note that
; `my_string` is a pointer to a char pointer, not a char pointer.
; It returns, as an integer, the number of bytes that were written, or -1 on error. 

; You should use the `write` syscall in your function. 
; You may reference 
; https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86_64-64_bit
; and https://man7.org/linux/man-pages/man2/write.2.html
; The File Descriptor (fd) for standard output is 1.

;; size_t print(char **my_string, int str_len);
print:
    ret




; This function is very similar to the previous function. However, instead of printing
; the entire string, it skips `num_skip` characters from the beginning of the string.
; In addition, if `num_skip` is greater than `str_len` or is a negative number, the function 
; should return `-1`.
; You can assume that the value passed in as `str_len` will be valid.

; You may copy and paste the code you wrote for the previous `print` function and modify it
; to fit the needs of this new function.

; Examples:

; print_less("Hello World", 3, 12)
; "lo World"
; -> 9

; print_less("assembly!", 0, 10)
; "assmebly!"
; -> 10

; print_less("beep boop", -5, 10);
; -> -1

; print_less("l33t_h@ck3rz", 20, 13);
; -> -1

; print_less("hi...", 6, 6);
; ""
; -> 0

;; size_t print_less(char **my_string, int num_skip, int str_len);
print_less:
    ret     
