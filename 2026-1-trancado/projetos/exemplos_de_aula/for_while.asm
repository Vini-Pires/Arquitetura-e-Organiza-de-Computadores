.data

.text
main:

# ---------------------------------------------------

	li	s0, 1
	li	s1, 0
	li	t0, 128
	
while: beq 	s0, t0, fim_while
	
	slli	s0, s0, 1	# pow = pow * 2
	addi	s1, s1, 1	# i = i + 1; i++
	j 		while
fim_while:

# ---------------------------------------------------

	li	s0, 1
	li	s1, 0
	li	t0, 128
	
do_while:	
	slli 	s0, s0, 1	# pow = pow * 2
	addi	s1, s1, 1	# i++
	bne		s0, t0, do_while
fim_do_while:
		
# --------------------------------------------------	

	li	s0, 0
	li	s1, 0
	li	t0, 10
	
for: 
	bge s0, t0, fim_for
	addi	s0, s0, 1
	add 	s1, s1, s0	# sum = sum + i
	j		for
fim_for: