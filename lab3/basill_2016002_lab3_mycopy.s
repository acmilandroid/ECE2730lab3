# begin assembly stub

.globl classify
.type classify,@function
classify:
	# prolog
	pushl %ebp
	pushl %ebx
	movl %esp, %ebp

	# put code here

	movl $0, match #sets match to zero
	movl i, %eax
	cmpl j, %eax
	jne match2
	addl $1, match
	match2:
		cmpl k, %eax
		jne match3
		addl $2, match
	match3:
		movl j, %eax
		cmpl k, %eax
		jne next
		addl $3, match
	next:
		movl match, %eax
		cmpl $0, %eax
		je endif
		cmpl $1, %eax
		je ifmatch1
		jmp if2
	ifmatch1:
		movl i, %eax
		addl j, %eax
		cmpl k, %eax
		jg else
		jmp equal
	else:
		movl match, %eax
		cmpl $2, %eax
		je else3
		cmpl $6, %eax
		jne else2
		movl $1, %eax
		movl %eax, tri_type
		jmp return
	else2:
		movl j, %eax
		addl k, %eax
		cmpl i, %eax
		jg else3
		jmp equal
	else3:
		movl i, %eax
		addl k, %eax
		cmpl j, %eax
		jg endif
		jmp equal
	endif:
		movl $2, %eax
		movl %eax, tri_type
		jmp return
	if2:
		movl i, %eax
		addl j, %eax
		cmpl k, %eax
		jg equal
		movl j, %eax
		addl k, %eax
		cmpl i, %eax
		jg equal
		movl i, %eax
		addl k, %eax
		cmpl j, %eax
		jg equal
		movl $3, %eax
		movl %eax, tri_type
		jmp return
return:
	# epilog
	movl %ebp, %esp
	popl %ebx
	popl %ebp
	ret

# variable declarations
.comm match, 4
# end assembly stub

