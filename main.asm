; Primer izracuna za dolzino sporocila to mislim da delas v sekciji .data: 
; length: equ $-message ($ predstavlja trenutni naslov ) 
; echo $((8#640)) -> Tak si pretvarjaj pravice in pol tisto stevilo napisi not

global _start ;standardna vhodna tocka

section .data
datoteka: db "28886_Dir",0 ;db - define byte.. Pisi 0 ker tak on ve da je konec niza
dovoljenja_mkdir:equ 416 ; 3 skupine (user,group, others), nicla naj bo spredi spet.. r:4,w:2,x:1
section .text
_start: mov     eax, 0x27 ;mkdir
        mov     ebx, datoteka 
        mov     ecx, dovoljenja_mkdir 
        int 0x80 ;VEDNO ko izvajas sistemski klic

        ; izhod iz programa
        mov eax, 0x01 ;stevilka za exit
        xor ebx,ebx ;kao priporocen nacin ciscenja registrov
        int 0x80