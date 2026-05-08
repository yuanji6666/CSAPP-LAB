	.file	"main.c"
	.text
	.p2align 4
	.globl	calculate_total
	.type	calculate_total, @function
calculate_total:
.LFB53:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	testl	%esi, %esi
	jle	.L1
	movslq	%esi, %rsi
	xorl	%eax, %eax
	leaq	(%rdi,%rsi,2), %rcx
	.p2align 4,,10
	.p2align 3
.L3:
	movswl	(%rdi), %edx
	addq	$2, %rdi
	addl	%edx, %eax
	cmpq	%rcx, %rdi
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE53:
	.size	calculate_total, .-calculate_total
	.p2align 4
	.globl	compare_student_desc
	.type	compare_student_desc, @function
compare_student_desc:
.LFB54:
	.cfi_startproc
	endbr64
	movswl	36(%rsi), %eax
	movswl	36(%rdi), %edx
	subl	%edx, %eax
	ret
	.cfi_endproc
.LFE54:
	.size	compare_student_desc, .-compare_student_desc
	.p2align 4
	.globl	sort_students_desc
	.type	sort_students_desc, @function
sort_students_desc:
.LFB55:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %esi
	jle	.L8
	movq	%rdi, %r9
	leal	-1(%rsi), %r10d
	leaq	38(%rdi), %rdi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L13:
	movq	30(%rdi), %rax
	movdqu	(%rdi), %xmm2
	movl	%r8d, %edx
	movdqu	16(%rdi), %xmm3
	movzwl	36(%rdi), %esi
	movaps	%xmm2, (%rsp)
	movaps	%xmm3, 16(%rsp)
	movq	%rax, 30(%rsp)
	movq	%rdi, %rax
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L12:
	movdqu	-38(%rax), %xmm0
	movq	-8(%rax), %rcx
	subl	$1, %edx
	subq	$38, %rax
	movdqu	16(%rax), %xmm1
	movups	%xmm0, 38(%rax)
	movups	%xmm1, 54(%rax)
	movq	%rcx, 68(%rax)
	cmpl	$-1, %edx
	je	.L16
.L10:
	cmpw	%si, -2(%rax)
	jl	.L12
	addl	$1, %edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rdx,%rax,2), %rax
	leaq	(%r9,%rax,2), %rax
.L11:
	movdqa	(%rsp), %xmm4
	movdqa	16(%rsp), %xmm5
	addq	$1, %r8
	addq	$38, %rdi
	movq	30(%rsp), %rdx
	movups	%xmm5, 16(%rax)
	movups	%xmm4, (%rax)
	movq	%rdx, 30(%rax)
	cmpq	%r8, %r10
	jne	.L13
.L8:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movq	%r9, %rax
	jmp	.L11
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE55:
	.size	sort_students_desc, .-sort_students_desc
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\n===== \346\200\273\346\210\220\347\273\251\346\216\222\345\220\215\357\274\210\351\253\230\345\210\260\344\275\216\357\274\211====="
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\346\200\273\345\210\206"
.LC2:
	.string	"\345\255\246\345\217\267"
.LC3:
	.string	"\345\247\223\345\220\215"
.LC4:
	.string	"\346\216\222\345\220\215"
.LC5:
	.string	"%-4s %-10s %-12s %-8s\n"
.LC6:
	.string	"%-4d %-10s %-12s %-8hd\n"
	.text
	.p2align 4
	.globl	print_result
	.type	print_result, @function
print_result:
.LFB56:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r12d
	leaq	.LC0(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	movl	$2, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	.LC1(%rip), %r9
	leaq	.LC2(%rip), %r8
	leaq	.LC3(%rip), %rcx
	leaq	.LC4(%rip), %rdx
	movl	$2, %edi
	leaq	.LC5(%rip), %rsi
	call	__printf_chk@PLT
	testl	%r12d, %r12d
	jle	.L20
	xorl	%ebp, %ebp
	leaq	.LC6(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L22:
	movswl	36(%rbx), %r9d
	addl	$1, %ebp
	leaq	8(%rbx), %r8
	movq	%rbx, %rcx
	movl	%ebp, %edx
	movq	%r13, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$38, %rbx
	cmpl	%r12d, %ebp
	jne	.L22
.L20:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	print_result, .-print_result
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"\n\346\200\273\345\210\206\350\256\241\347\256\227\350\200\227\346\227\266(%d\346\254\241): %.6f ms (%.3f us)\n"
	.align 8
.LC15:
	.string	"\346\216\222\345\272\217\350\200\227\346\227\266(%d\346\254\241): %.6f ms (%.3f us)\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%edi, %edi
	xorl	%r8d, %r8d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$504, %rsp
	.cfi_def_cfa_offset 544
	movdqa	.LC16(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 488(%rsp)
	xorl	%eax, %eax
	xorl	%eax, %eax
	movw	%dx, 90(%rsp)
	leaq	16(%rsp), %rbp
	movaps	%xmm0, 16(%rsp)
	movdqa	.LC7(%rip), %xmm0
	movw	%cx, 128(%rsp)
	movups	%xmm0, 36(%rsp)
	movdqa	.LC17(%rip), %xmm0
	movw	%ax, 52(%rsp)
	movups	%xmm0, 54(%rsp)
	movdqa	.LC8(%rip), %xmm0
	movl	$3290680, 31(%rsp)
	movups	%xmm0, 74(%rsp)
	movdqa	.LC18(%rip), %xmm0
	movl	$3289136, 69(%rsp)
	movups	%xmm0, 92(%rsp)
	movdqa	.LC9(%rip), %xmm0
	movl	$3354672, 107(%rsp)
	movaps	%xmm0, 112(%rsp)
	movdqa	.LC19(%rip), %xmm0
	movups	%xmm0, 130(%rsp)
	movl	$3420208, 145(%rsp)
	movdqa	.LC10(%rip), %xmm0
	movw	%si, 166(%rsp)
	movups	%xmm0, 150(%rsp)
	movdqa	.LC20(%rip), %xmm0
	movw	%di, 204(%rsp)
	movups	%xmm0, 168(%rsp)
	movdqa	.LC11(%rip), %xmm0
	movl	$3485744, 183(%rsp)
	movups	%xmm0, 188(%rsp)
	movdqa	.LC21(%rip), %xmm0
	movw	%r8w, 242(%rsp)
	movups	%xmm0, 206(%rsp)
	movdqa	.LC12(%rip), %xmm0
	movl	$3551280, 221(%rsp)
	movups	%xmm0, 226(%rsp)
	call	clock@PLT
	movl	$100000, %esi
	pxor	%xmm3, %xmm3
	leaq	244(%rsp), %rcx
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L27:
	movdqu	20(%rdx), %xmm0
	movdqa	%xmm3, %xmm1
	addq	$38, %rdx
	pcmpgtw	%xmm0, %xmm1
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm2
	punpckhwd	%xmm1, %xmm0
	paddd	%xmm2, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	movw	%ax, -2(%rdx)
	cmpq	%rcx, %rdx
	jne	.L27
	subl	$1, %esi
	jne	.L26
	call	clock@PLT
	pxor	%xmm7, %xmm7
	movq	%rbp, %rdi
	movl	$6, %esi
	subq	%rbx, %rax
	leaq	256(%rsp), %r12
	movl	$100000, %ebx
	cvtsi2sdq	%rax, %xmm7
	movsd	%xmm7, (%rsp)
	call	print_result
	call	clock@PLT
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L29:
	movdqa	16(%rsp), %xmm4
	movdqa	32(%rsp), %xmm5
	movq	%r12, %rdi
	movl	$6, %esi
	movdqa	48(%rsp), %xmm6
	movdqa	64(%rsp), %xmm7
	movaps	%xmm4, 256(%rsp)
	movdqa	80(%rsp), %xmm4
	movl	240(%rsp), %eax
	movaps	%xmm5, 272(%rsp)
	movdqa	96(%rsp), %xmm5
	movaps	%xmm6, 288(%rsp)
	movdqa	112(%rsp), %xmm6
	movaps	%xmm7, 304(%rsp)
	movdqa	128(%rsp), %xmm7
	movaps	%xmm4, 320(%rsp)
	movdqa	144(%rsp), %xmm4
	movaps	%xmm5, 336(%rsp)
	movdqa	160(%rsp), %xmm5
	movaps	%xmm6, 352(%rsp)
	movdqa	176(%rsp), %xmm6
	movaps	%xmm7, 368(%rsp)
	movdqa	192(%rsp), %xmm7
	movaps	%xmm4, 384(%rsp)
	movdqa	208(%rsp), %xmm4
	movaps	%xmm5, 400(%rsp)
	movdqa	224(%rsp), %xmm5
	movl	%eax, 480(%rsp)
	movaps	%xmm6, 416(%rsp)
	movaps	%xmm7, 432(%rsp)
	movaps	%xmm4, 448(%rsp)
	movaps	%xmm5, 464(%rsp)
	call	sort_students_desc
	subl	$1, %ebx
	jne	.L29
	call	clock@PLT
	pxor	%xmm2, %xmm2
	movl	$6, %esi
	movq	%rbp, %rdi
	subq	%r13, %rax
	cvtsi2sdq	%rax, %xmm2
	movsd	%xmm2, 8(%rsp)
	call	sort_students_desc
	movl	$6, %esi
	movq	%rbp, %rdi
	call	print_result
	movsd	(%rsp), %xmm6
	movsd	.LC13(%rip), %xmm1
	movl	$100000, %edx
	leaq	.LC14(%rip), %rsi
	movl	$2, %edi
	movl	$2, %eax
	mulsd	%xmm6, %xmm1
	movapd	%xmm6, %xmm0
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm2
	movsd	.LC13(%rip), %xmm1
	movl	$100000, %edx
	leaq	.LC15(%rip), %rsi
	movl	$2, %edi
	movl	$2, %eax
	mulsd	%xmm2, %xmm1
	movapd	%xmm2, %xmm0
	call	__printf_chk@PLT
	movq	488(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L34
	addq	$504, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L34:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE57:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.value	80
	.value	70
	.value	90
	.value	100
	.value	60
	.value	75
	.value	85
	.value	95
	.align 16
.LC8:
	.value	90
	.value	88
	.value	92
	.value	86
	.value	91
	.value	89
	.value	87
	.value	90
	.align 16
.LC9:
	.value	60
	.value	65
	.value	70
	.value	75
	.value	80
	.value	85
	.value	90
	.value	95
	.align 16
.LC10:
	.value	85
	.value	82
	.value	88
	.value	90
	.value	87
	.value	86
	.value	89
	.value	84
	.align 16
.LC11:
	.value	92
	.value	90
	.value	95
	.value	91
	.value	93
	.value	94
	.value	92
	.value	91
	.align 16
.LC12:
	.value	78
	.value	75
	.value	80
	.value	82
	.value	79
	.value	81
	.value	77
	.value	83
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC13:
	.long	0
	.long	1083129856
	.section	.rodata.cst16
	.align 16
.LC16:
	.quad	115905839330649
	.quad	4049916065162998357
	.align 16
.LC17:
	.quad	7957825
	.quad	3472328296278143026
	.align 16
.LC18:
	.quad	6451010
	.quad	3472328296278143026
	.align 16
.LC19:
	.quad	1852139587
	.quad	3472328296278143026
	.align 16
.LC20:
	.quad	418463705412
	.quad	3472328296278143026
	.align 16
.LC21:
	.quad	1851881029
	.quad	3472328296278143026
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
