# Basil Lin
# Section 002
# Lab 3
# Purpose - translate C programs to assembly, learn to use conditionals
#			in assembly language

/* begin assembly solution */
.globl classify
.type classify,@function
classify:
	/* prolog */
	pushl %ebp
	pushl %ebx
	movl %esp, %ebp

	/* put code here */
	movl i, %eax #finds whether i == 0
	cmpl $0, %eax
	je zero #sets tri_type to zero and returns
	movl j, %eax #same process for j and k
	cmpl $0, %eax
	je zero
	movl k, %eax
	cmpl $0, %eax
	je zero
	movl i, %eax
	cmpl j, %eax
	jne match2 #moves to second conditional when i != j
	movl $0, match #sets match variable to 0
	addl $1, match #adds 1 to match variable when i == j
	jmp match2
	zero:
		movl $0, %eax
		movl $0, tri_type #sets tri_type to 0, not a triangle
		jmp return
	match2:
		cmpl k, %eax
		jne match3
		addl $2, match #adds 2 to match when i == k
		jmp match3
	match3:
		movl j, %eax
		cmpl k, %eax
		jne if #moves program to first if statement when j != k
		addl $3, match #adds 3 to match when j == k
		jmp if
	if:
		movl match, %eax
		cmpl $0, %eax
		je if2 #when match == 0, moves to check if it is a triangle
		cmpl $1, %eax
		jne else #when match != 1, moves to check other match numbers
		movl i, %ebx
		addl j, %ebx
		cmpl k, %ebx
		jg endif #moves to the end of the conditional when i > (j+k)
		movl $0, tri_type #sets tri_type to 0 when condition not satisfied
		jmp return #jumps to return
	else:
		movl match, %eax
		cmpl $2, %eax
		je elsenot2 #moves to else condition for (match != 2) when match == 2
		cmpl $6, %eax
		jne else2 #moves to else of (match == 1) condition when match != 6
		movl $1, tri_type #sets triangle type to isosceles when match == 6
		jmp return
	else2:
		movl j, %eax
		addl k, %eax
		cmpl i, %eax
		jg endif #jumps to end of if conditional when i > (j+k)
		movl $0, tri_type #sets tri_type to not a triangle
		jmp return
	elsenot2:
		movl i, %eax
		addl k, %eax
		cmpl j, %eax
		jg endif #jumps to end of if conditional when j > (i+k)
		movl $0, tri_type #sets tri_type to not a triangle
		jmp return
	endif:
		movl $2, %edx
		movl %edx, tri_type #sets tri_type to isosceles triangle at the end of the conditional
		jmp return
	if2:
		movl i, %eax
		addl j, %eax
		cmpl k, %eax
		jle zero #checks last when (i+j) <= k, sends to zero if met
		movl j, %ebx
		addl k, %ebx
		cmpl i, %ebx
		jle zero #checks last when (j+k) <= i, sends to zero if met
		movl i, %eax
		addl k, %eax
		cmpl j, %eax
		jle zero #checks last when (i+k) <= j, sends to zero if met
		movl $3, tri_type
		jmp return

return:
	/* epilog */
	movl %ebp, %esp
	popl %ebx
	popl %ebp
	ret

/* variable declarations */
.comm match, 4

/* end assembly solution */

