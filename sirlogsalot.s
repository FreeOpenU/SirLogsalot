	.file	"sirlogsalot.c"
	.text
	.section	.rodata
.LC0:
	.string	"Connection closed"
	.text
	.globl	read_line
	.type	read_line, @function
read_line:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
.L6:
	leaq	-21(%rbp), %rsi
	movl	-36(%rbp), %eax
	movl	$0, %ecx
	movl	$1, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jle	.L2
	movzbl	-21(%rbp), %eax
	cmpb	$-1, %al
	jne	.L3
.L2:
	leaq	.LC0(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-21(%rbp), %eax
	movb	%al, (%rdx)
	addq	$1, -16(%rbp)
	cmpq	$1, -16(%rbp)
	jbe	.L6
	movq	-16(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	jne	.L6
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L6
	movq	-16(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	read_line, .-read_line
	.section	.rodata
.LC1:
	.string	"%Y-%m-%d %H:%M:%S"
.LC2:
	.string	"[%s] %s\n"
	.text
	.globl	log_with_date
	.type	log_with_date, @function
log_with_date:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	gmtime@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$50, %esi
	movq	%rax, %rdi
	call	strftime@PLT
	movq	-88(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	log_with_date, .-log_with_date
	.globl	log_to_file
	.type	log_to_file, @function
log_to_file:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	gmtime@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$50, %esi
	movq	%rax, %rdi
	call	strftime@PLT
	movq	-88(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	movq	-96(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	log_to_file, .-log_to_file
	.section	.rodata
.LC3:
	.string	"r"
.LC4:
	.string	"config.txt"
.LC5:
	.string	" %1023[^= ] = %s "
	.text
	.globl	get_config
	.type	get_config, @function
get_config:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2112, %rsp
	movq	%rdi, -2104(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, -2080(%rbp)
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -2072(%rbp)
	movq	-2080(%rbp), %rax
	movb	$0, (%rax)
	cmpq	$0, -2072(%rbp)
	je	.L14
.L18:
	leaq	-1040(%rbp), %rcx
	leaq	-2064(%rbp), %rdx
	movq	-2072(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	%eax, -2084(%rbp)
	cmpl	$-1, -2084(%rbp)
	je	.L21
	movq	-2104(%rbp), %rdx
	leaq	-2064(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	leaq	-1040(%rbp), %rcx
	movq	-2080(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L16
.L21:
	nop
.L16:
	movq	-2072(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L14:
	movq	-2080(%rbp), %rax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	get_config, .-get_config
	.section	.rodata
.LC6:
	.string	" "
	.text
	.globl	get_prefix
	.type	get_prefix, @function
get_prefix:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$560, %rsp
	movq	%rdi, -552(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$512, %edi
	call	malloc@PLT
	movq	%rax, -544(%rbp)
	movq	-552(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-552(%rbp), %rcx
	leaq	-528(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-552(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L23
	leaq	-528(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -536(%rbp)
	cmpq	$0, -536(%rbp)
	je	.L24
	movq	-536(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-536(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	-544(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L25
.L24:
	movq	-544(%rbp), %rax
	movb	$0, (%rax)
	jmp	.L25
.L23:
	movq	-544(%rbp), %rax
	movb	$0, (%rax)
.L25:
	movq	-544(%rbp), %rax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	get_prefix, .-get_prefix
	.section	.rodata
.LC7:
	.string	"!"
	.text
	.globl	get_username
	.type	get_username, @function
get_username:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$560, %rsp
	movq	%rdi, -552(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$512, %edi
	call	malloc@PLT
	movq	%rax, -544(%rbp)
	movq	-552(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-552(%rbp), %rcx
	leaq	-528(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	leaq	-528(%rbp), %rax
	movl	$33, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L29
	leaq	-528(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -536(%rbp)
	cmpq	$0, -536(%rbp)
	je	.L30
	movq	-536(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-536(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	-544(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L31
.L30:
	movq	-544(%rbp), %rax
	movb	$0, (%rax)
	jmp	.L31
.L29:
	movq	-544(%rbp), %rax
	movb	$0, (%rax)
.L31:
	movq	-544(%rbp), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L33
	call	__stack_chk_fail@PLT
.L33:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	get_username, .-get_username
	.globl	get_command
	.type	get_command, @function
get_command:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$560, %rsp
	movq	%rdi, -552(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$512, %edi
	call	malloc@PLT
	movq	%rax, -536(%rbp)
	movq	-552(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-552(%rbp), %rcx
	leaq	-528(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	leaq	-528(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -544(%rbp)
	cmpq	$0, -544(%rbp)
	je	.L35
	movq	-544(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L36
	leaq	.LC6(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -544(%rbp)
.L36:
	cmpq	$0, -544(%rbp)
	je	.L37
	movq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-544(%rbp), %rcx
	movq	-536(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L38
.L37:
	movq	-536(%rbp), %rax
	movb	$0, (%rax)
	jmp	.L38
.L35:
	movq	-536(%rbp), %rax
	movb	$0, (%rax)
.L38:
	movq	-536(%rbp), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L40
	call	__stack_chk_fail@PLT
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	get_command, .-get_command
	.section	.rodata
.LC8:
	.string	" :"
	.text
	.globl	get_last_argument
	.type	get_last_argument, @function
get_last_argument:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$560, %rsp
	movq	%rdi, -552(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$512, %edi
	call	malloc@PLT
	movq	%rax, -544(%rbp)
	movq	-552(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-552(%rbp), %rcx
	leaq	-528(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	leaq	-528(%rbp), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -536(%rbp)
	cmpq	$0, -536(%rbp)
	je	.L42
	movq	-536(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-536(%rbp), %rax
	leaq	2(%rax), %rcx
	movq	-544(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L43
.L42:
	movq	-544(%rbp), %rax
	movb	$0, (%rax)
.L43:
	movq	-544(%rbp), %rax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	get_last_argument, .-get_last_argument
	.globl	get_argument
	.type	get_argument, @function
get_argument:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$576, %rsp
	movq	%rdi, -568(%rbp)
	movl	%esi, -572(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$512, %edi
	call	malloc@PLT
	movq	%rax, -536(%rbp)
	movq	-568(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-568(%rbp), %rcx
	leaq	-528(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movl	$0, -548(%rbp)
	leaq	-528(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -544(%rbp)
	jmp	.L47
.L51:
	movq	-544(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	je	.L48
	addl	$1, -548(%rbp)
.L48:
	movl	-572(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -548(%rbp)
	jne	.L49
	movq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movq	-544(%rbp), %rcx
	movq	-536(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-536(%rbp), %rax
	jmp	.L53
.L49:
	leaq	.LC6(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -544(%rbp)
.L47:
	cmpq	$0, -544(%rbp)
	jne	.L51
	movl	-548(%rbp), %eax
	cmpl	-572(%rbp), %eax
	je	.L52
	movq	-536(%rbp), %rax
	movb	$0, (%rax)
.L52:
	movq	-536(%rbp), %rax
.L53:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L54
	call	__stack_chk_fail@PLT
.L54:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	get_argument, .-get_argument
	.section	.rodata
.LC9:
	.string	"NICK %s\r\n"
	.text
	.globl	set_nick
	.type	set_nick, @function
set_nick:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$544, %rsp
	movl	%edi, -532(%rbp)
	movq	%rsi, -544(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-544(%rbp), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-528(%rbp), %rsi
	movl	-532(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L56
	call	__stack_chk_fail@PLT
.L56:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	set_nick, .-set_nick
	.section	.rodata
.LC10:
	.string	"USER %s 0 * :%s\r\n"
	.text
	.globl	send_user_packet
	.type	send_user_packet, @function
send_user_packet:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$544, %rsp
	movl	%edi, -532(%rbp)
	movq	%rsi, -544(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-544(%rbp), %rcx
	movq	-544(%rbp), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-528(%rbp), %rsi
	movl	-532(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L58
	call	__stack_chk_fail@PLT
.L58:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	send_user_packet, .-send_user_packet
	.section	.rodata
.LC11:
	.string	"JOIN %s\r\n"
	.text
	.globl	join_channel
	.type	join_channel, @function
join_channel:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$544, %rsp
	movl	%edi, -532(%rbp)
	movq	%rsi, -544(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-544(%rbp), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-528(%rbp), %rsi
	movl	-532(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L60
	call	__stack_chk_fail@PLT
.L60:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	join_channel, .-join_channel
	.section	.rodata
.LC12:
	.string	"PONG :%s\r\n"
	.text
	.globl	send_pong
	.type	send_pong, @function
send_pong:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$544, %rsp
	movl	%edi, -532(%rbp)
	movq	%rsi, -544(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-544(%rbp), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-528(%rbp), %rsi
	movl	-532(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L62
	call	__stack_chk_fail@PLT
.L62:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	send_pong, .-send_pong
	.section	.rodata
.LC13:
	.string	"PRIVMSG %s :%s\r\n"
	.text
	.globl	send_message
	.type	send_message, @function
send_message:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$560, %rsp
	movl	%edi, -532(%rbp)
	movq	%rsi, -544(%rbp)
	movq	%rdx, -552(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-552(%rbp), %rcx
	movq	-544(%rbp), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-528(%rbp), %rsi
	movl	-532(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	send_message, .-send_message
	.section	.rodata
.LC14:
	.string	"Could not create socket"
.LC15:
	.string	"server"
.LC16:
	.string	"port"
.LC17:
	.string	"Could not connect"
.LC18:
	.string	"nick"
.LC19:
	.string	"channels"
.LC20:
	.string	"a+"
.LC21:
	.string	"bot.log.txt"
.LC22:
	.string	"PING"
.LC23:
	.string	"PRIVMSG"
.LC24:
	.string	"%s/%s: %s"
.LC25:
	.string	"%s.log.txt"
.LC26:
	.string	"JOIN"
.LC27:
	.string	"%s joined %s."
.LC28:
	.string	"PART"
.LC29:
	.string	"%s left %s."
	.text
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1680, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -1668(%rbp)
	cmpl	$-1, -1668(%rbp)
	jne	.L66
	leaq	.LC14(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L66:
	leaq	.LC15(%rip), %rdi
	call	get_config
	movq	%rax, -1664(%rbp)
	leaq	.LC16(%rip), %rdi
	call	get_config
	movq	%rax, -1656(%rbp)
	movq	-1664(%rbp), %rax
	movq	%rax, %rdi
	call	inet_addr@PLT
	movl	%eax, -1564(%rbp)
	movw	$2, -1568(%rbp)
	movq	-1656(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons@PLT
	movw	%ax, -1566(%rbp)
	movq	-1664(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-1656(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	leaq	-1568(%rbp), %rcx
	movl	-1668(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L67
	leaq	.LC17(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L67:
	leaq	.LC18(%rip), %rdi
	call	get_config
	movq	%rax, -1648(%rbp)
	leaq	.LC19(%rip), %rdi
	call	get_config
	movq	%rax, -1640(%rbp)
	movq	-1648(%rbp), %rdx
	movl	-1668(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	set_nick
	movq	-1648(%rbp), %rdx
	movl	-1668(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	send_user_packet
	movq	-1640(%rbp), %rdx
	movl	-1668(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	join_channel
	movq	-1648(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-1640(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	leaq	.LC20(%rip), %rsi
	leaq	.LC21(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -1632(%rbp)
.L72:
	leaq	-1040(%rbp), %rdx
	movl	-1668(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	read_line
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	get_prefix
	movq	%rax, -1624(%rbp)
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	get_username
	movq	%rax, -1616(%rbp)
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	get_command
	movq	%rax, -1608(%rbp)
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	get_last_argument
	movq	%rax, -1600(%rbp)
	movq	-1608(%rbp), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L68
	movq	-1600(%rbp), %rdx
	movl	-1668(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	send_pong
	jmp	.L69
.L68:
	movq	-1608(%rbp), %rax
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L70
	leaq	-1040(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_argument
	movq	%rax, -1576(%rbp)
	movq	-1600(%rbp), %rsi
	movq	-1616(%rbp), %rcx
	movq	-1576(%rbp), %rdx
	leaq	-528(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	log_with_date
	movq	-1576(%rbp), %rdx
	leaq	-1552(%rbp), %rax
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	-1632(%rbp), %rdx
	leaq	-1552(%rbp), %rax
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	call	freopen@PLT
	movq	-1632(%rbp), %rdx
	leaq	-528(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	log_to_file
	movq	-1576(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L69
.L70:
	movq	-1608(%rbp), %rax
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L71
	leaq	-1040(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_argument
	movq	%rax, -1584(%rbp)
	movq	-1584(%rbp), %rcx
	movq	-1616(%rbp), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC27(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	log_with_date
	movq	-1584(%rbp), %rdx
	leaq	-1552(%rbp), %rax
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	-1632(%rbp), %rdx
	leaq	-1552(%rbp), %rax
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	call	freopen@PLT
	movq	-1632(%rbp), %rdx
	leaq	-528(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	log_to_file
	movq	-1584(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L69
.L71:
	movq	-1608(%rbp), %rax
	leaq	.LC28(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L69
	leaq	-1040(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	get_argument
	movq	%rax, -1592(%rbp)
	movq	-1592(%rbp), %rcx
	movq	-1616(%rbp), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	log_with_date
	movq	-1592(%rbp), %rdx
	leaq	-1552(%rbp), %rax
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	-1632(%rbp), %rdx
	leaq	-1552(%rbp), %rax
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	call	freopen@PLT
	movq	-1632(%rbp), %rdx
	leaq	-528(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	log_to_file
	movq	-1592(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L69:
	movq	-1624(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-1616(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-1608(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-1600(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L72
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
