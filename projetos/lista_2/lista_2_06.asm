.data # programa de multiplicação sem o pseudonimo mul
req1:	.string "Informe o 1 numero: "
req2:	.string "Informe o 2 numero: "
pula:	.string "\n"

req:	.word req1, req2, 0
vet:	.space 8
.text

main:

	jal coleta_num
	
	la s0, vet
	lw t1, 0(s0)
	lw t2, 4(s0)
	li t0, 0
	
	ini_for:
		beq t2, zero, fim_for
		add t0, t0, t1
		addi t2, t2, -1
		j ini_for 
	fim_for: mv a2, t0
	
	la a0, pula
	li a7, 4
	ecall
	
	mv a0, a2
	li a7, 1
	ecall
	

	j exit

coleta_num:
	addi sp, sp, -4
	sw ra, 0(sp)
	
	la s1, vet
	la s2, req
	
	for_coleta:
		lw a2, 0(s2)
		beq a2, zero, fim_coleta
		
		jal imprime_str
		
		li a7, 5
		ecall
		
		sw a0, 0(s1)
		
		addi s2, s2, 4
		addi s1, s1, 4
		j for_coleta
		
	fim_coleta: jal swap
		
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

swap:
	la s1, vet
	lw t0, 0(s1)
	lw t1, 4(s1)
	
	beq t0, t1, fim_swap
		bgt t0, t1, fim_swap
			sw t0, 4(s1)
			sw t1, 0(s1)
		
	fim_swap:
		ret


imprime_str:
	mv a0, a2
	li a7, 4
	ecall
	
	ret
	
exit:
	li a7, 10
	ecall
