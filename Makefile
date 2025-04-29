all: build run

build:
	nasm -f elf32 main.s -o main.o
	ld -m elf_i386 -o sys_calls main.o

run:
	./sys_calls

clean:
	rm -f *.o sys_calls 28886_Dir/28886_file.dat