.data
.text

main:
	li s1, 0	# valor 1
	li s2, 0	# valor 2
	li s0, 0	# retorno
	
	li a7, 5
	ecall
	mv s1, a0
	
	li a7, 5
	ecall
	mv s2, a0
	
	jal soma
	mv s0, a0
	
	li a7, 1
	mv a0, s0
	ecall


	j exit


soma:
	mv t1, s1
	mv t2, s2
	
	add a0, s1, s2
	
	ret

exit:
	li a7, 10
	ecall
