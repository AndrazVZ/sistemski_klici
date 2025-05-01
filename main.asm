; Primer izracuna za dolzino sporocila to mislim da delas v sekciji .data: 
; length: equ $-message ($ predstavlja trenutni naslov ) 
; echo $((8#640)) -> Tak si pretvarjaj pravice in pol tisto stevilo napisi not

global _start ;standardna vhodna tocka

section .data
test: db "test",0
ime_direktorija: db "28886_Dir",0 ;db - define byte.. Pisi 0 ker tak on ve da je konec niza
dovoljenja_mkdir:equ 493 ; 3 skupine (user,group, others), nicla naj bo spredi spet.. r:4,w:2,x:1

ime_datoteke: db "28886_file.dat",0
dovoljenja_dat:equ 416



section .text
_start: mov     eax, 0x27 ;mkdir
        mov     ebx, ime_direktorija 
        mov     ecx, dovoljenja_mkdir 
        int 0x80 ;VEDNO ko izvajas sistemski klic

        ;Sprememba delovne poti
        mov     eax, 0x0c ;chdir
        mov     ebx, ime_direktorija
        int 0x80
        
        ;naredi datoteko
        mov     eax, 0x05
        mov     ebx, ime_datoteke
        mov     edx, dovoljenja_dat
        int 0x80


        ; izhod iz programa
        mov eax, 0x01 ;stevilka za exit
        xor ebx,ebx ;kao priporocen nacin ciscenja registrov
        int 0x80
