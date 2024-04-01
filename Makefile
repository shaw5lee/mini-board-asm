all: gen_random print print_less clean

print_less: miniboard.o .instructors/print_less.c
	gcc -g -Wall -Wextra $^ -o $@

print: miniboard.o .instructors/print.c
	gcc -g -Wall -Wextra $^ -o $@

gen_random: miniboard.o .instructors/gen_random.c
	gcc -g -Wall -Wextra $^ -o $@

miniboard.o: miniboard.asm
	nasm -f elf64 -g -F dwarf $^ -o $@

clean:
	rm -f *.o

reset:
	rm -f gen_random print print_less

.PHONY: print_less print gen_random clean reset
