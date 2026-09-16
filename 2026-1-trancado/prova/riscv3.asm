.data
vet: 	.word 1, 2, 3, 4, 5, 6, 7
fim_vet:
virg:	.string ", "
ponto:	.string "."

.text

main:
	
	la s0, vet
	la s11, fim_vet				# atalho para descobrir o final do vetor
	la s1, virg
	la s2, ponto
	
	ini_for:
		lw t0, 0(s0)
		bge s0, s11, fim_for	# verifica se o endereço de memoria de s0 é maior ou igual ao final do vetor
		
		mv a2, t0
		jal print_int
		
		# dobra o valor no vetor e armazena
		slli t0, t0, 1
		sw t0, 0(s0)		
		
		case:
			mv t1, s11
			addi t1, t1, -4
			bne s0, t1, virgula
				mv a2, s2
		virgula:
			beq s0, t1, fim_case
				mv a2, s1
		fim_case:
			jal print_str
			
		
		addi s0, s0, 4			# avança 4 bytes na memoria
		j ini_for
	fim_for:

	

	j exit

print_str:
	mv a0, a2
	li a7, 4
	ecall
	
	ret

print_int:
	mv a0, a2
	li a7, 1
	ecall
	
	ret


exit:
	li a7, 10
	ecall