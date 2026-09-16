.data
txt_parar:	.string "0 - Parar operação"
txt_soma:	.string "1 - Soma"
txt_sub:	.string "2 - Subtração"
txt_div:	.string "3 - Divisão"
txt_mult:	.string "4 - Multiplicação"
error:		.string "Operação invalida, tente novamente"
pula:		.string "\n"

req1:		.string "1 numero: "
req2:		.string "2 numero: "

vet:		.space 8
req:		.word req1, req2, 0
menu:		.word txt_parar, txt_soma, txt_sub, txt_div, txt_mult, 0

.text

main:
	# lançar menu
	# direcionar pra parte do codigo que calcula
	# imprimir resultado
	# lançar menu ate que deseje para 

	la s0, menu
	la s1, vet
	
		
	for_menu:
		lw t2, 0(s0)
		mv a2, t2
		
		beq t2, zero, fim_menu
		addi s0, s0, 4
		
		jal imprime
		j for_menu
		
	fim_menu:

	jal coleta_num
	mv s0, a0
	
		
	switch:
		case0:	# parar
			li t1, 0
			bne s0, t1, case1
			j exit
		case1:	# soma
			li t1, 1
			bne s0, t1, case2
			jal coleta_termos
			
			lw t1, 0(s1)
			lw t2, 4(s1)
			
			add a2, t1, t2
						
			j fim_switch
		case2:	# subtração
			li t1, 2
			bne s0, t1, case3
			jal coleta_termos
					
			lw t1, 0(s1)
			lw t2, 4(s1)
			
			sub a2, t1, t2
			
			j fim_switch
		case3: # divisão
			li t1, 3
			bne s0, t1, case4
			jal coleta_termos
			
			lw t1, 0(s1)
			lw t2, 4(s1)
			
			div a2, t1, t2
			
			j fim_switch
		case4:	# multiplicação
			li t1, 4
			bne s0, t1, default
			jal coleta_termos
			
			lw t1, 0(s1)
			lw t2, 4(s1)
			
			mul a2, t1, t2
			
			j fim_switch
		default:
			la a2, error
			jal imprime
			
			j main
	
	fim_switch: jal imprime_int

		
	j main

coleta_termos: 
	addi sp, sp, -4	# libera 4bytes no inicio da stack point
	sw ra, 0(sp)	# salva o return address no inicio da stack point
	
	la s11, req
	la s10, vet
	
	init_for:
		lw t1, 0(s11)
		beq t1, zero, fim_for
		
		mv a2, t1
		jal imprime
		
		jal coleta_num
		mv t1, a0
		
		sw t1, 0(s10)
		
		addi s11, s11, 4
		addi s10, s10, 4
		j init_for
	
	fim_for:
	
	mv s11, zero
	mv s10, zero
	
	lw ra, 0(sp)	# recupera o return address da stack point
	addi sp, sp, 4	# fecha o espaço aberto
	ret


coleta_num:
	li a7, 5
	ecall
	
	ret


imprime:
	mv a0, a2
	li a7, 4
	ecall
	
	la a0, pula
	li a7, 4
	ecall
	
	ret

imprime_int:
	la a0, pula
	li a7, 4
	ecall
	
	mv a0, a2
	li a7, 1
	ecall
	
	la a0, pula
	li a7, 4
	ecall
	
	ret
	

exit:
	li a7, 10
	ecall
