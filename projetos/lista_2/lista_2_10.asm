.data
res:	.space 24 # 6 espaços
fim_res:
vet1:	.word 10, 20, 30, 40, 50, 60
vet2:	.word 0, 10, -15, 16, 20, 30
pula:	.string "\n"

.text

main:
	la s1, vet1
	la s2, vet2
	la s0, res
	la s11, fim_res

	
	for_soma:
		beq s0, s11, fim_soma
		lw t1, 0(s1)
		lw t2, 0(s2)
		
		add t0, t1, t2
		
		sw t0, 0(s0)
		
		addi s0, s0, 4
		addi s1, s1, 4
		addi s2, s2, 4
		
		j for_soma
		
	fim_soma: jal imprime
	
	j exit
	
imprime:
	addi sp, sp, -4
	sw ra, 0(sp)

	la s0, res
	la s11, fim_res
	
	for_imprime:
		
		
		beq s0, s11, fim_imprime
		
		lw a0, 0(s0)
		li a7, 1
		ecall
		
		jal pula_linha
		
		addi s0, s0, 4
		
		j for_imprime
		
	fim_imprime:	

	lw ra, 0(sp)
	addi sp, sp, 4
	ret

pula_linha:
	la a0, pula
	li a7, 4
	ecall
	
	ret


exit:
	li a7, 10
	ecall