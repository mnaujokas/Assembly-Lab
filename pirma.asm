.model small


.data
	pranesimas1	DB "Iveskite teksta", 13, 10, "$"
	pranesimas2	DB 10, 13,"Jusu tekstas", 13, 10, "$"
	bufferis db 255, ?, 255 dup (0)
.code
	MOV AX, @data
	MOV DS, AX

	MOV DX, offset pranesimas1
	MOV AH, 09h
	INT 21h


	mov ah, 0Ah ;nuskaitymas
	mov dx, offset bufferis
	int 21h



    MOV DX, offset pranesimas2
	MOV AH, 09h
	INT 21h

	xor ax, ax ;nusinuliname ax registra
	mov si, 1
	mov ch, [bufferis+si];i ch perkeliam simboliu skaiciu
    inc si

ciklas:
	mov bl, [bufferis+si]

	cmp bl, 65d  ;65 simbolis A
	jge daugiauA

	jmp spausdinti


daugiauA:
    cmp bl,90d
    jle didziosios ;90tas simbolis Z, sokam i keitima didziuju

    cmp bl, 97d
    jge mazosios
    jmp spausdinti

didziosios:
    mov cl, 155d ;is 155d atemus desimtaini didziosios raides ascii koda gausim atvirkstine
    sub cl, bl
    mov bl, cl  ;perkeliam i bl, nes spausdinam is bl
	jmp spausdinti

mazosios:
    cmp bl, 122d
    jg spausdinti ;jeigu simbolis didesnis uz "z"

    mov cl, 219d
    sub cl, bl
    mov bl, cl  ;perkeliam i bl, nes spausdinam is bl
    jmp spausdinti


spausdinti:
	mov [bufferis+si], bl

	inc si;pridedam kad skaitytu kita baita
	dec ch; atimam is ciklo skaitliuko

	cmp ch,0h
	jnz ciklas

	xor cx, cx
	mov cl, [bufferis+1]
	mov bx, 0001h

	xor ax,ax

	mov ah, 40h
	mov dx, offset [bufferis+2]
	int 21h

	MOV ah, 4Ch
	INT 21h
end
