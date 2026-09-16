.data

.text

main:

# Anotar enuncioado depois
	li t0, 15
	li t1, 30
	
	add t3, t1, t0	#t3 = t1 + t0	
	
	li a7, 1	# ecall 1 ( Print_Int )
	mv a0, t3	# a0 = t3
	ecall
	
	# Saida
	li a7, 10
	ecall