all: compile run

compile:
	nasm -f elf32 -o bin/kasm.o kernel.asm
	gcc -m32 -c -o bin/kc.o kernel.c
	ld -m elf_i386 -T link.ld -o bin/kernel bin/kasm.o bin/kc.o

run:
	qemu-system-i386 -kernel bin/kernel
