.data
req:	.string "\nInforme o diametro da circunferencia: "
.text

main:
	# informe o diametro da circunferencia
	
	la a0, req
	li a7, 4
	ecall
	
	li a7, 5
	ecall
	mv a2, a0
	
	jal divdois
	mv a2, a0	# guarda o valor do raio em a2
	jal area
	mv s0, a0	# guarda o valor da area em s0
	
	li a7, 1
	mv a0, s0
	ecall
	
	j exit

divdois:
	srai a0, a2, 1	# divide por 2 e retorna a0
	ret

area:
	addi sp, sp, -4		# abre espaço na sp
	sw ra, 0(sp)		# armazena o ra na sp
	
	# pega o a2 (raio) e eleva ao quadrado
	jal quadrado
	mv t2, a0			# move o valor de retorno para t2
	
	li t1, 3			# pi = 3
	mul a0, t2, t1		# guarda a area em a0 e retorna
	
	lw ra, 0(sp)		# carrega o ra guardado na sp
	addi sp, sp, 4		# fecha o espaço aberto
	ret
	
quadrado:
	mv t0, a2	# pega o valor do raio
	mul a0, t0, t0
		
	ret
	
exit:
	li a7, 10
	ecall
	