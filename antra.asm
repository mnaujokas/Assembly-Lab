.model small
.stack 100h
.data
Handle DW ? 
kiek DW ?  
puse DW ?
pagalba DB "Programa atspausdina failo simbolius spirale$"
OpenError DB "An error has occured(opening)!$"
ReadError DB "An error has occured(reading)!$"
filebuff db 255 dup (?) 
Buffer DB 9999 dup (?) 	; buffer to store data        
rez DB 576 dup ('X') 	; buffer to store data  
par DB 255 dup (?) 
new_line db 10,13, "$"   
parametrai db 255, ?, 255 dup (0)
kvad DW ?

.code 

mov ax,@data 		; base address of data segment
mov ds,ax 		; put this in ds


xor cx, cx
mov cl, es:[80h]

cmp cx, 2
jl nerpar 
mov bx, 0081h

ieskok:
	cmp es:[bx], '?/' 
	
	jne nera
	
	mov ah, 9
	mov dx, offset pagalba
	int 21h
	
	mov ax,4C00h 		;uzdarom
	int 21h 
	
	
nera:
	inc bx
	loop ieskok

	mov ch, 0
	mov cl, es:[80h]
	
	mov si, 0081h
	
	xor bx, bx
	xor di,di
	

    
tarpas:	
	mov bl, es:[si]
	cmp bl, 20h
	je atimti
	mov al, es:si
	mov [filebuff+di], al
	inc di
	inc si
	dec cx
	cmp cx,0
	jne tarpas
	jmp toli2
atimti:
    dec cx 
    xor bx,bx
    inc si
    jmp tarpas


	
	
nerpar:
	xor bx,bx	
	xor ax,ax 
	xor cx,cx
	mov ah, 0Ah ;nuskaitymas
	mov dx, offset parametrai
	int 21h   
	 
	xor si,si
	inc si
	mov cl, [parametrai+si]  
     
     inc si
     

ieskok2:

	cmp [parametrai+si], '/' 
	jne nera2
	inc si 
	cmp [parametrai+si], '?'
	jne nera2 
	 
	
	mov ah, 9
	mov dx, offset pagalba
	int 21h
	
	mov ax,4C00h 		;uzdarom
	int 21h 
nera2:
	inc si
	loop ieskok2
	mov si, 0001h
	xor cx,cx
	mov cl, [parametrai+si]   
	
	xor bx, bx
	xor di,di
	
	inc si

    
tarpas2:	
	
	cmp [parametrai+si], 20h
	je atimti2
	
	mov al, [parametrai+si]
	mov [filebuff+di], al
	inc di
	inc si
	dec cx
	cmp cx,0
	jne tarpas2
	jmp toli2
atimti2:
    dec cx 
    inc si
    jmp tarpas2

toli2:	
mov [filebuff+di], 0h
	
		
    
	


mov dx,OFFSET filebuff 	; put address of filename in dx 
mov al,00 		; access mode - read and write
mov ah,3Dh 		; function 3Dh -open a file
int 21h 		; call DOS service

mov Handle,ax 		; save file handle for later

mov dx,offset Buffer 	; address of buffer in dx
mov bx,Handle 		; handle in bx
mov cx,600 		; amount of bytes to be read
mov ah,3Fh 		; function 3Fh - read from file
int 21h 		; call dos service
mov kiek, ax


mov bx,Handle 		; put file handle in bx 
mov ah,3Eh 		; function 3Eh - close a file
int 21h 		; call DOS service
xor si,si

kvadratas:     ;gaunam eilutes ilgi
    inc si
    mov ax,si
    mul ax
    cmp ax, kiek
jl kvadratas
mov kvad, si

shr si,1
mov puse,si
jc odd
mov ax,kvad
mul si
sub ax,puse
dec ax
mov di,ax
jmp po


odd:
xor di,di
mov di, ax
shr di, 1

po:
xor si,si
xor bx,bx
xor cx,cx
mov cx, kvad 

mov ah, [buffer+si]
mov [rez+di], ah
inc si 
inc bx 

perkelt:
mov dx, bx

	pridet1:
		mov ah, [buffer+si] 
		inc di
		mov [rez+di], ah
		dec dx
		inc si
		cmp si, kiek
		je toliau
		cmp dx, 0000h 
		jnz pridet1
mov dx,bx 
 
	pridetEil:
		mov ah, [buffer+si] 
		add di,kvad
		mov [rez+di], ah
		dec dx
		inc si
		cmp si, kiek
		je toliau
		cmp dx, 0000h 
		jnz pridetEil
inc bx
mov dx,bx 

	atimti1:
		mov ah, [buffer+si] 
		dec di
		mov [rez+di], ah
		dec dx
		inc si
		cmp si, kiek
		je toliau
		cmp dx, 0000h 
		jnz atimti1
mov dx, bx

	atimtiEil:    
		mov ah, [buffer+si] 
		sub di, kvad
		mov [rez+di], ah
		dec dx
		inc si
		cmp si, kiek
		je toliau
		cmp dx, 0000h 
		jnz atimtiEil
inc bx

jmp perkelt

toliau:
    mov bl,  es:[80h]
    cmp bl, 2
    jl spausdinteil
cia:     
	

xor si,si
  
mov cx,kvad
xor si,si

spausdinti:
	push cx
	mov cx,kvad		
	mov dx, offset rez
	add dx,si
	mov bx, 0001h 		
	mov ah,40h 		
	int 21h

	mov cx,2
	MOV DX, offset new_line
	MOV AH, 40h
	int 21h

	add si, kvad
	pop cx
loop spausdinti


mov ax,4C00h 		;uzdarom
int 21h 

spausdinteil:
mov bx, 0001h
    mov cx,2
	MOV DX, offset new_line
	MOV AH, 40h
	int 21h
	jmp cia
END