.data

.text

main:
	li t0, 10
	li t1, 20
	li t2, 6
	
	addi t3, t0, 4
	sub t4, t1, t2
	sub t5, t4, t3
	
	li a7, 1
	mv a0, t5
	ecall
	
	# Saida
	li a7, 10
	ecall	 