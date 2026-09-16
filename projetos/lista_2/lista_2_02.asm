.data
vet:		.word 8,2,35,4,8,6,31,5
virgula:	.string ", "
ponto:		.string "."
.text

main:
	li t0, 0
	li a1, 7
	la s0, vet

	for:
		bgt t0, a1, fim
		slli t2, t0, 2
		add a2, s0, t2
		mv a6, t0
		jal imprime	
		addi t0, t0, 1
		j for
	fim:
	j exit

imprime:

	li a7, 1
	lw a0, 0(a2)
	ecall
	
	beq a6, a1, else	
		li a7, 4
		la a0, virgula
		ecall
	
	j fim_imprime
	
	else:
		li a7, 4
		la a0, ponto
		ecall
fim_imprime: ret

exit:
	li a7, 10
	ecall