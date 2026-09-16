.data
pula:	.string "\n"
.text

main:

	li t0, 0	# i
	li t1, 10	# j
	li t2, 0	# k
	
	# função while
	ini_while:
		bge t0, t1, fim_while	# verifica se i >= j
		addi t0, t0, 1			# i++
		addi, t2, t2, 10		# k += 10
		
		j ini_while
	fim_while:
	
	mv a2, t0
	jal imprime	# print i

	mv a2, t2
	jal imprime	# print k

	j exit

imprime:
	mv a0, a2
	li a7, 1
	ecall
	
	# pula linha (\n)
	la a0, pula
	li a7, 4
	ecall
	
	ret


exit:
	li a7, 10
	ecall