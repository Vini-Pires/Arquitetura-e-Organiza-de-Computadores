.data
req1:	.string "Primeiro Numero: "
req2:	.string "Segundo Numero: "

.text

main:
	la a1, req1
	jal coleta_numero
	mv t0, a0
	
	la a1, req2
	jal coleta_numero
	mv t1, a0
	
	beq t0, t1, igual
	
		bgt t0, t1, maior
			mv a1, t1
			j fim
		maior:
			mv a1, t0
			j fim
	igual:
		li a1, -111
		j fim
		
	fim: jal imprime
		
	j exit
	
	
imprime:
	li a7, 1
	mv a0, a1
	ecall
	
	ret
	
coleta_numero:
	mv a0, a1
	li a7, 4
	ecall
	
	li a7, 5
	ecall
	
	ret
	
exit:
	li a7, 10
	ecall