.data
req1:	.string "Informe um numero: "
res1:	.string "10 é maior que "
res2:	.string "10 é menor que "

.text

main:
	la a1, req1
	jal coleta_num
	mv t0, a0
	
	li t1, 10
	
	beq t0, t1, igual
		bgt t0, t1, maior
			la a2, res1
			mv a1, t0
			j fim
		maior:
			la a2, res2
			mv a1, t0
			j fim
	igual:
		mv a2, zero
		mv a1, zero
		j fim
	fim: jal imprime
	
	j exit
	
coleta_num:
	mv a0, a1
	li a7, 4
	ecall
	
	li a7, 5
	ecall
	
	ret

imprime:
	beq a2, zero, pula_texto
		mv a0, a2
		li a7, 4
		ecall
	
	pula_texto:
		mv a0, a1
		li a7, 1
		ecall
	
	ret
	
exit:
	li a7, 10
	ecall