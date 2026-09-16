.data
req1:	.string "Informe a: "
req2:	.string "Informe b: "
.text

main:
	
	la a1, req1
	jal imprime
	mv s0, a0
	
	la a1, req2
	jal imprime
	mv s1, a0
	
	li t0, 10
	mv t0, s0
	
	bgt s1, t0, result
		mv t0, s1
	
	result:
		mv a0, t0
		li a7, 1
		ecall
	
	j exit

imprime:
	mv a0, a1
	li a7, 4
	ecall
	
	li a7, 5
	ecall
	
	ret


exit:
	li a7, 10
	ecall