.data
vet: 		.space 40	# vetor de 10 espaços com 4 bytes cada espaço
pula_linha:	.string "\n"
.text

main:
	li t0, 0		# index
	li t1, 10		# length
	la s0, vet
	
	loop:		# for
		bge t0, t1, fim
		slli t4, t0, 2 	# t4 = t0 * 4
		add s2, s0, t4 	# salva o endereço de memo de s0 + offset
		li t5, 15
		sw t5, 0(s2)	# salva 15 no endereço passado
		
		
		addi t0, t0, 1
		j loop			# for
	
	fim:
	
	mv a1, s0
	mv a2, zero
	mv a3, t1
	jal imprime
	
	
	j exit
	
	
imprime: # imprime o vetor
	bge a2, a3, back
	slli t2, a2, 2
	add s2, a1, t2
	lw a0, 0(s2)
	li a7, 1
	ecall
	
	li a7, 4
	la a0, pula_linha
	ecall
	
	addi a2, a2, 1
	j imprime
	
back: ret

exit:
	li a7, 10
	ecall