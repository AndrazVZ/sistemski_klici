all: build run

build:

	nasm -f elf32 main.asm -o main.o
	ld -m elf_i386 main.o -o sys_calls 


run:
	./sys_calls

clean:
	rm -f *.o sys_calls 28886_Dir/28886_file.dat
	rmdir 28886_Dir

