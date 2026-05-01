.data
req1:	.string "Informe a: "
req2:	.string "Informe b: "
enter:	.string "\n"
.text

main:

	la a1, req1
	jal imprime
	mv t0, a0
	
	la a1, req2
	jal imprime
	mv t1, a0

	li s11, 0
	
	blt t0, zero, fim_if
	li a0, 50
	bgt t1, a0, fim_if
	
	addi s11, zero, 1
	
	fim_if:
	
	jal pula
	
	mv a0, s11
	li a7, 1
	ecall
	
	jal pula

	j exit

pula:
	la a0, enter
	li a7, 4
	ecall
	
	ret


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