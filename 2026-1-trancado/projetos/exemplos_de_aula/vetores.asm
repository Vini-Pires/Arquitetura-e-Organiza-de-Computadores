.data
v:		.word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text

main:

	la s0, v
	lw t3, 8(s0)		# t3 = 30
	lw t5, 16(s0)		# t5 = 50
	
	add t2, t3, t5
	
	sw t2, 4(s0)
	
	lw a0, 4(s0) 		# a0 = 80
	li a7, 1
	ecall
	
	j exit
	
exit:
	li a7, 10
	ecall
