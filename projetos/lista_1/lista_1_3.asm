.data
string_request1: 	.asciz "\nInforme o primeiro numero: "
string_requent2: 	.asciz "\nInforme o segundo numero: "
string_sum:		.asciz "\nSoma: "
string_sub:		.asciz "\nSubtração: "
string_mult:		.asciz "\nMultiplicação: "
string_div:		.asciz "\nDivisão: "

.text

main:
	
	# pede primeiro numero
	li a7, 4
	la a0, string_request1
	ecall
	
	li a7, 5
	ecall
	mv t0, a0
	
	
	# pede segundo numero
	li a7, 4
	la a0, string_requent2
	ecall
	
	li a7, 5
	ecall
	mv t1, a0
	
	# soma
	add s0, t0, t1
	
	li a7, 4
	la a0, string_sum
	ecall
	
	li a7, 1
	mv a0, s0
	ecall 
	
	# subtração
	
	sub s0, t0, t1
	
	li a7, 4
	la a0, string_sub
	ecall
	
	li a7, 1
	mv a0, s0
	ecall
	
	
	# multiplicação
	
	mul s0, t0, t1
	
	li a7, 4
	la a0, string_mult
	ecall
	
	li a7, 1
	mv a0, s0
	ecall
	
	# divisão
	
	div s0, t0, t1
	
	li a7, 4
	la a0, string_div
	ecall
	
	li a7, 1
	mv a0, s0
	ecall	
	
	# saida
	li a7, 10
	ecall