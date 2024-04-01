# Assembly Mini Board -- INSTRUCTORS

This mini board aims to asses your understanding of Assembly before moving on to the Networking section.
It should not take longer than an hour to complete.

Please discuss your thought process out loud with those evaluating this assessment -- we are interested in seeing how you think and problem solve, and are excited to watch you find the solutions.

You are allowed to ask questions while completing this, however we may request that you continue problem solving on your own before giving more guidance.

You are welcome to draw things out on the whiteboard, a piece of paper, or type in this document in order to organize your thoughts while completing this assessment.

## Problem 1: Fix our code
Referencing the Intel Manual is encouarged.

``` text
Goals of this problem:
- A warm-up for the rest of the mini board:
    - They are forced to use the Intel Manual
        - unless they somehow already know MOVBE like the back of their hand, but if they do, the rest of this will be easy for them anyways
    - Some light debugging
        - they just have to be able to read, and know the difference between a register and memory
    - Testing code by hand
- Changing the function name forces them to actually read about what MOVBE does if they skimmed over it for debugging, or already knew about the memory/memory restriction.
    - It is also just a good practice
- Tests understanding of endianness, bytes, and hexadecimal before going into Networking
- Memory deferencing
```

### Code
We've written some code using the `MOVBE` instruction:
``` assembly
;; void function_1(int *var, int *dest);
function_1:
    movbe [esi], [edi]
    ret
```

### Fix it
However, there is an error in this code.

Identify the error and fix it below:
``` assembly
;; void function_1_fixed(int *var, int *dest);
function_1_fixed:
    mov ecx, [edi]
    movbe [esi], ecx
    ret
```

### Describe it
Based on what the `MOVBE` instruction does, change `function_1_fixed` above to something more descriptive.

### Use it
Show what the result will be (in hexadecimal) if this function is run with the given input:

``` C
unsigned int *int1 = 0x12345678;
unsigned int result = *function_1_fixed(int1);
```
`result = `

``` C
unsigned int *int1 = 0x44442222;
unsigned int result = *function_1_fixed(int1);
```
`result = `

## Problem 2: Write your own code

### Running your code

**NOTE:** We ask that you refrain from running your code until you have completed the function. 
In order to "complete" the function, you must run through your code by hand with an example that you create, and explain what is happening at each step.

**Please ask us before running your code**.


Run `make` from your command line to compile each of the functions in `miniboard.asm`. 
If you would like to only compile the tests for one of the functions, you can run `make <function name>`.

To run the compiled test code for a function, run `./<function name>` from the command line.

## Functions in miniboard.asm

### gen_random
**Function prototype:** `int gen_random()`

```text
Goals of this problem:
- Navigating and understanding the Intel Manual
- Return values and how they relate to register names
- Basic loop logic
- Local labels
- Paying attention to flags
```

Using the Intel Manual, generate and return a random number with the `RDRAND` instruction.

According to the description of the `RDRAND` instruction, it is not a guarantee that this instruction will create a random number when executed. 
Therefore, you must implement a loop that continues to execute the `RDRAND` instruction until it is successful.

You are not permitted to use the `cmp` or `test` instructions. 
However, you are allowed to use any of the `J`*`cc`* instructions.

### print
**Function prototype:** `size_t print(char **my_string, int str_len)`

```text
Goals of this problem:
- Using syscalls
- Reading documentation (the write function takes care of what needs to be returned)
- Understanding of pointers
- Calling conventions
- Swapping values in registers efficiently
    - There is a more efficient and a less efficient way to do it.
    - We can ask them to optimize it if they are using a lot of temporary registers
- Memory dereferncing in Assembly
```

This function writes `str_len` bytes of the string pointed to by `my_string`. Note that `my_string` is a pointer to a char pointer, not a char pointer.
It returns, as an integer, the number of bytes that were written, or -1 on error. 

You should use the `write` syscall in your function. 
You may reference 
https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86_64-64_bit and 
https://man7.org/linux/man-pages/man2/write.2.html

The File Descriptor (fd) for standard output is 1.

### print_less
**Function prototype:** `size_t print_less(char **my_string, int num_skip, int str_len)`

```text
This one could be changed to modify individual characters if we wanted to do just base+offset

However, with the way this is, they will likely need to understand base+offset enough to know that it won't work here.
It tests their deeper understanding of what base+offset actually does and what its order of operations is.
If they are struggling, asking them to draw out what is happening can be helpful.

Goals of this problem:
- Understanding base+offset and general memory dereferencing
- Conditional logic and early-exit
- Iterating off of other code
```

This function is very similar to the previous function. However, instead of printing the entire string, it skips `num_skip` characters from the beginning of the string.
In addition, if `num_skip` is a negative number, the function should return `-1`.

You may copy and paste the code you wrote for the previous `print` function and modify it to fit the needs of this new function.

#### Examples:
```
print_less("Hello World", 3, 12)
"lo World"
-> 9
```
```
print_less("assembly!", 0, 10)
"assmebly!"
-> 10
```
```
print_less("beep boop", -5, 10);
-> -1
```
```
print_less("l33t_h@ck3rz", 20, 13);
-> -1
```
```
print_less("hi...", 6, 6);
""
-> 0
```
