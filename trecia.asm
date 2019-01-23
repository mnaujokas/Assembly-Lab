adresas:
 cmp rm,000b
 je rm0a
 cmp rm, 001b
 je rm1a
 cmp rm, 010b
 je rm2a
  cmp rm, 011b
 je rm3a
  cmp rm, 100b
 je rm4a
 cmp rm, 101b
 je rm5a
 cmp rm, 110b
 je rm6a
 cmp rm,111b
 je rm7a



 rm0a:
 call rm0
 cmp d,0b
 je rm0g
 ret
 rm0g:
 	call addreg
	call kableli
	ret
 
	
 rm1a:
 call rm1
 ret
 
 rm2a:
 call rm2
 ret
 
 rm3a:
 call rm3
 ret
 
 rm4a:
 call rm4
 ret

 rm5a:
 call rm5
 ret
 
 rm6a:
 call rm6
 ret
 
  rm7a:
 call rm7
 ret
	rm0:
	  	mov di, operacija
		call addToLine
		cmp d,0b
		je rm00
		call addreg
		call kableli
		
		rm00:
		cmp modas, 00b
		je rm0mod0
		cmp modas, 01b
		je rm0mod1
		cmp modas, 10b
		je rm0mod2
		cmp modas, 11b
		je rm0mod3
		
		rm0mod0:
		mov di, offset bxsias
		call addToLine
	 
		ret
		
		
		rm0mod1:
				mov di, offset bxsias
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm0mod2:
		mov di, offset bxsias
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm0mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		ret
		


	rm1:
	  	mov di, operacija
		call addToLine
		call addreg
		call kableli
		

		cmp modas, 00b
		je rm1mod0
		cmp modas, 01b
		je rm1mod1
		cmp modas, 10b
		je rm1mod2
		cmp modas, 11b
		je rm1mod3
		
		rm1mod0:
		mov di, offset bxdias
		call addToLine
	 
		ret
		
		rm1mod1:
				mov di, offset bxdias
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm1mod2:
		mov di, offset bxdias
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm1mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		
		ret 
	
	rm2:
	  	mov di, operacija
		call addToLine
		call addreg
		call kableli
		

		cmp modas, 00b
		je rm2mod0
		cmp modas, 01b
		je rm2mod1
		cmp modas, 10b
		je rm2mod2
		cmp modas, 11b
		je rm2mod3
		
		rm2mod0:
		mov di, offset bpsias
		call addToLine
	 
		ret
		
		rm2mod1:
				mov di, offset bpsias
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm2mod2:
		mov di, offset bpsias
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm2mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		
		ret 
		
	rm3:
	  	mov di, operacija
		call addToLine
		call addreg
		call kableli
		

		cmp modas, 00b
		je rm3mod0
		cmp modas, 01b
		je rm3mod1
		cmp modas, 10b
		je rm3mod2
		cmp modas, 11b
		je rm3mod3
		
		rm3mod0:
		mov di, offset bpdias
		call addToLine
	 
		ret
		
		rm3mod1:
				mov di, offset bpdias
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm3mod2:
		mov di, offset bpdias
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm3mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		
		ret 

rm4:
	  	mov di, operacija
		call addToLine
		call addreg
		call kableli
		
		

		cmp modas, 00b
		je rm4mod0
		cmp modas, 01b
		je rm4mod1
		cmp modas, 10b
		je rm4mod2
		cmp modas, 11b
		je rm4mod3
		
		rm4mod0:
		call atidaryti
		mov di, offset sis
		call addToLine
	 
		ret
		
		rm4mod1:
				mov di, offset sis
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm4mod2:
		mov di, offset sis
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm4mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		
		ret 
rm5:
	  	mov di, operacija
		call addToLine
		call addreg
		call kableli
		
		

		cmp modas, 00b
		je rm5mod0
		cmp modas, 01b
		je rm5mod1
		cmp modas, 10b
		je rm5mod2
		cmp modas, 11b
		je rm5mod3
		
		rm5mod0:
		call atidaryti
		mov di, offset dis
		call addToLine
	 
		ret
		
		rm5mod1:
				mov di, offset dis
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm5mod2:
		mov di, offset dis
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm5mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		
		ret 

rm6:
	  	mov di, operacija
		call addToLine
		call addreg
		call kableli
		
		

		cmp modas, 00b
		je rm6mod0
		cmp modas, 01b
		je rm6mod1
		cmp modas, 10b
		je rm6mod2
		cmp modas, 11b
		je rm6mod3
		
		rm6mod0:
		call atidaryti
		call zodzioPoslinkis
	 
		ret
		
		rm6mod1:
				mov di, offset bpss
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm6mod2:
		mov di, offset bpss
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm6mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		
		ret 
		
rm7:
	  	mov di, operacija
		call addToLine
		call addreg
		call kableli
		

		cmp modas, 00b
		je rm7mod0
		cmp modas, 01b
		je rm7mod1
		cmp modas, 10b
		je rm7mod2
		cmp modas, 11b
		je rm7mod3
		
		rm7mod0:
		
		mov di, offset bxss
		call addToLine
	 
		ret
		
		rm7mod1:
				mov di, offset bxss
		call addToLine
	 
		call pliusa
		mov [kodas+4], 2
		mov di, offset kodas
		add di,4
		call addToLine
		ret
		
		rm7mod2:
		mov di, offset bxss
		call addToLine
		
		call pliusa
		call zodzioPoslinkis
		ret
		
		rm7mod3:
		
		mov bl,rm
		mov reg,bl
		call addreg
		
		ret 
