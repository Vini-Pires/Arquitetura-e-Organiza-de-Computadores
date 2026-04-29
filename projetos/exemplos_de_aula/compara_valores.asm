.data
	msg_requisito:	.asciz "Escreva um numero "
	msg_confirma: 	.asciz "Numero igual "
	msg_erro:	.asciz "Numeros diferentes "
	pula_linha: 	.asciz "\n"
.text

main:
	li t1, 10
	
	li a7, 4
	la a0, msg_requisito
	ecall

	li a7, 5
	ecall
	mv t0, a0
	
	beq t0, t1, igual
	bne t0, t1, diff
	
	beq zero, zero, exit
	
igual:
	li a7, 4
	
	la a0, msg_confirma
	ecall
	
	la a0, pula_linha
	ecall
	
	beq zero, zero, exit
	
diff:
	li a7, 4
	
	la a0, msg_erro
	ecall
	la a0, pula_linha
	ecall
	
	beq zero, zero, exit	


exit:
	li a7, 10
	ecall
