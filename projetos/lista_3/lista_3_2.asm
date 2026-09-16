.data
.text

main:
	li s0, 5	# a
	li s1, 10	# b
	li s2, 30	# c
	li s3, 20	# d
	
	jal soma
	
	li a7, 1
	ecall
	
	j exit
	
soma:
	addi sp, sp, -4
	sw ra, 0(sp)
	
	jal subt
	mv t0, a0
	
	add t1, s0, s1
	add a0, t1, t0
	
	lw ra, 0(sp)
	addi sp, sp, 4
	ret


subt:
	sub a0, s2, s3
	
	ret

exit:
	li a7, 10
	ecall