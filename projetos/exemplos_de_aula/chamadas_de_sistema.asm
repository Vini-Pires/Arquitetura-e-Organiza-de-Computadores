.data
string1: .asciz "Informe o numero: \n"
string2: .asciz "O numero é "

.text

main:
	# Requisita do user um numero
	li a7, 4	# ecall 4 ( Print_String )
	la a0, string1	# la = load address, nesse caso salva o endereço do primeiro elem do vetor
	ecall
	
	# Le o valor inserido pelo user
	li a7, 5	# ecall 5 ( Read_Int )
	ecall
	mv t0, a0	# move o registror a0 para o t0
	
	# Imprime a segunda string para formatar o campo antes de escrever o numero
	li a7, 4
	la a0, string2
	ecall
	
	# Imprime o numero informado
	li a7, 1	# ecall 1 ( Print_Int )
	mv a0, t0
	ecall
	
	
	# Saida
	li a7, 10
	ecall