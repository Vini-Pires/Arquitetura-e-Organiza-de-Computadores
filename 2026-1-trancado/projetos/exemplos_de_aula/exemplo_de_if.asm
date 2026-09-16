.data

.text

main:
	li s0, 4
	li s1, 1
	
	slli s1, s1, 2		 	# s1 * 2^2
	
	beq s0, s1, target		# se os registradores forem iguais então siga para o target
	
	addi s1, s1, 1
	sub s1, s1, s0
	
	beq zero, zero, exit 	# if (zero == zero); then exit(); done
	
target:
	add s1, s1, s0
	
	beq zero, zero, exit
	
exit:
	li a7, 10
	ecall