.data
pula:	.string "\n"
.text

main:
	li t0, 0
	li t1, 10
	li t2, 0
	
	while:
		bge t0, t1, fim
		addi t0, t0, 1
		addi t2, t2, 10
		j while
	fim:
	
	mv a1, t0
	jal imprime
	mv a1, t2
	jal imprime
	
	j exit
	

exit:
	li a7, 10
	ecall

pula_linha:
	la a0, pula
	li a7, 4
	ecall
	
	ret

imprime:
	addi sp, sp, -4
	sw ra, 0(sp)
	
	mv a0, a1
	li a7, 1
	ecall
	
	jal pula_linha
	
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
	