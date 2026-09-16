.data

.text
main:
	li t1, 5	# carrega o valor cinco de forma imediata no reg t1
	li t2, 10 
	add t0, t1, t2	# t0 = t1 + t2
	li a7, 10	# salva a função de saida
	ecall		# realiza a saida do programa caso tenha sido bem sucedida
	
# principais funções e seus respectivos codigos

# Imprimir inteiro:	1
# Imprimir string:	4
# Ler inteiro:		5
# Saída: 		10


# As funções de interação com user iram salvar ou ler os valores dentro de a0