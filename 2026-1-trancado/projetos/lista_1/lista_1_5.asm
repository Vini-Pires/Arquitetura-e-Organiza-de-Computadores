.data
str_req:	.asciz "Informe um numero para ser multiplicado e dividido por 8: "
str_div:	.asciz "A divisão deu: "
str_mult:	.asciz "A multiplicação deu: "
pula_linha:	.asciz "\n"

.text

main:
	
	la a3, pula_linha
	
	li a7, 4
	la a0, str_req
	ecall
	
	li a7, 5
	ecall
	mv t0, a0
	
	slli a1, t0, 3
	la a2, str_mult
	jal imprime
	
	srli a1, t0, 3
	la a2, str_div
	jal imprime
	
	j exit
	
	
imprime:
	
	li a7, 4
	mv a0, a2
	ecall
	
	li a7, 1
	mv a0, a1
	ecall
	
	li a7, 4
	mv a0, a3
	ecall
	
	
	ret
	
			
exit:
	li a7, 10
	ecall