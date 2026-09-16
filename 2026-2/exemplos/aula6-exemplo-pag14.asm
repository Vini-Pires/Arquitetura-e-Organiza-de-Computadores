# Programa que recebe inteiro. Compara se igual 10.
# Se igual
# Informa acerto e sai
# Diff
# Informa erro e sai


.data
str1:	.string "Escreva um numero \n"
acerto:	.string "Numero igual a 10 \n"
erro:	.string "Numero diferente de 10 \n"

.text
main:
	li t1, 10
	li a7, 4
	la a0, str1
	ecall
	
	li a7, 5
	ecall
	mv t0, a0
	
	beq  t0, t1, igual
	
	li a7, 4
	la a0, erro
	ecall
	j fim
	
	igual:
		li a7, 4
		la a0, acerto
		ecall
		j fim
fim:
li a7, 10
ecall