all: compile run

compile:
	nasm -f elf32 -o kasm.o kernel.asm
	gcc -m32 -c -o kc.o kernel.c
	ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o

run:
	qemu-system-i386 -kernel kernel
