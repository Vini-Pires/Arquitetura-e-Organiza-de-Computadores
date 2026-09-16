.data
string:	.asciz "Informe um numero n: "
sdiv:	.asciz "128 / 2 elevado a "
smul: 	.asciz "128 * 2 elevado a "
sigual:	.asciz " = "
spula:	.asciz "\n"
.text

main:

	li t0, 128
	
	li a7, 4
	la a0, string
	ecall
	
	li a7, 5
	ecall		
	mv t2, a0
	
	# divisão
	sra s0, t0, t2
	
	li a7, 4
	la a0, sdiv
	ecall
	
	jal imprime
	
	
	# multiplicação
	sll s0, t0, t2
	
	li a7, 4
	la a0, smul
	ecall
	
	jal imprime
	
	j exit
	
imprime:

	li a7, 1
	mv a0, t2
	ecall
	
	li a7, 4
	la a0, sigual
	ecall
	
	li a7, 1
	mv a0, s0
	ecall
	
	li a7, 4
	la a0, spula
	ecall
	
	ret

exit:
	# saida
	li a7, 10
	ecall