	.file	"main.c"
	.text
.Ltext0:
	.file 0 "/workspaces/CSAPP-LAB/hust/solution/lab2/1" "main.c"
	.globl	calculate_total
	.type	calculate_total, @function
calculate_total:
.LFB6:
	.file 1 "main.c"
	.loc 1 17 56
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 1 18 9
	movl	$0, -8(%rbp)
	.loc 1 19 9
	movl	$0, -4(%rbp)
	.loc 1 21 8
	cmpl	$0, -28(%rbp)
	jg	.L2
	.loc 1 22 16
	movl	$0, %eax
	jmp	.L3
.L2:
	.loc 1 25 12
	movl	$0, -4(%rbp)
	.loc 1 25 5
	jmp	.L4
.L5:
	.loc 1 26 22
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	cwtl
	.loc 1 26 13
	addl	%eax, -8(%rbp)
	.loc 1 25 28 discriminator 3
	addl	$1, -4(%rbp)
.L4:
	.loc 1 25 19 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L5
	.loc 1 29 12
	movl	-8(%rbp), %eax
.L3:
	.loc 1 30 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	calculate_total, .-calculate_total
	.globl	compare_student_desc
	.type	compare_student_desc, @function
compare_student_desc:
.LFB7:
	.loc 1 32 56
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 33 27
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 34 27
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 36 14
	movq	-8(%rbp), %rax
	movzwl	36(%rax), %eax
	movswl	%ax, %edx
	.loc 1 36 26
	movq	-16(%rbp), %rax
	movzwl	36(%rax), %eax
	cwtl
	.loc 1 36 22
	subl	%eax, %edx
	.loc 1 36 22 is_stmt 0 discriminator 1
	movl	%edx, %eax
	.loc 1 37 1 is_stmt 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	compare_student_desc, .-compare_student_desc
	.globl	sort_students_desc
	.type	sort_students_desc, @function
sort_students_desc:
.LFB8:
	.loc 1 39 59
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
	.loc 1 39 59
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 40 9
	movl	$0, -72(%rbp)
	.loc 1 42 12
	movl	$1, -72(%rbp)
	.loc 1 42 5
	jmp	.L9
.L13:
.LBB2:
	.loc 1 43 38
	movl	-72(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 43 24
	movq	(%rax), %rcx
	movq	8(%rax), %rbx
	movq	%rcx, -64(%rbp)
	movq	%rbx, -56(%rbp)
	movq	16(%rax), %rcx
	movq	24(%rax), %rbx
	movq	%rcx, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movq	30(%rax), %rax
	movq	%rax, -34(%rbp)
	.loc 1 44 13
	movl	-72(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -68(%rbp)
	.loc 1 46 15
	jmp	.L10
.L12:
	.loc 1 47 39
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 47 21
	movl	-68(%rbp), %eax
	cltq
	leaq	1(%rax), %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	movq	%rax, %rcx
	movq	-88(%rbp), %rax
	addq	%rcx, %rax
	.loc 1 47 29
	movq	(%rdx), %rcx
	movq	8(%rdx), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	30(%rdx), %rdx
	movq	%rdx, 30(%rax)
	.loc 1 48 13
	subl	$1, -68(%rbp)
.L10:
	.loc 1 46 23
	cmpl	$0, -68(%rbp)
	js	.L11
	.loc 1 46 34 discriminator 1
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 46 37 discriminator 1
	movzwl	36(%rax), %edx
	.loc 1 46 49 discriminator 1
	movzwl	-28(%rbp), %eax
	.loc 1 46 23 discriminator 1
	cmpw	%ax, %dx
	jl	.L12
.L11:
	.loc 1 50 17
	movl	-68(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 50 25
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	-34(%rbp), %rdx
	movq	%rdx, 30(%rax)
.LBE2:
	.loc 1 42 24 discriminator 2
	addl	$1, -72(%rbp)
.L9:
	.loc 1 42 19 discriminator 1
	movl	-72(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L13
	.loc 1 52 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	sort_students_desc, .-sort_students_desc
	.section	.rodata
	.align 8
.LC0:
	.string	"\n===== \346\200\273\346\210\220\347\273\251\346\216\222\345\220\215\357\274\210\351\253\230\345\210\260\344\275\216\357\274\211====="
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
	.globl	print_result
	.type	print_result, @function
print_result:
.LFB9:
	.loc 1 54 59
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 1 55 9
	movl	$0, -4(%rbp)
	.loc 1 57 5
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 58 5
	leaq	.LC1(%rip), %r8
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 59 12
	movl	$0, -4(%rbp)
	.loc 1 59 5
	jmp	.L16
.L17:
	.loc 1 60 94
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 60 97
	movzwl	36(%rax), %eax
	.loc 1 60 9
	movswl	%ax, %esi
	.loc 1 60 77
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 60 80
	leaq	8(%rax), %rcx
	.loc 1 60 59
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 60 62
	movq	%rax, %rdx
	.loc 1 60 9
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 59 24 discriminator 3
	addl	$1, -4(%rbp)
.L16:
	.loc 1 59 19 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L17
	.loc 1 62 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	print_result, .-print_result
	.section	.rodata
	.align 8
.LC8:
	.string	"\n\346\200\273\345\210\206\350\256\241\347\256\227\350\200\227\346\227\266(%d\346\254\241): %.6f ms (%.3f us)\n"
	.align 8
.LC9:
	.string	"\346\216\222\345\272\217\350\200\227\346\227\266(%d\346\254\241): %.6f ms (%.3f us)\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.loc 1 64 12
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$544, %rsp
	.loc 1 64 12
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 65 20
	movabsq	$115905839330649, %rax
	movq	%rax, -480(%rbp)
	movabsq	$4049916065162998357, %rax
	movq	%rax, -472(%rbp)
	movl	$3290680, -465(%rbp)
	movw	$80, -460(%rbp)
	movw	$70, -458(%rbp)
	movw	$90, -456(%rbp)
	movw	$100, -454(%rbp)
	movw	$60, -452(%rbp)
	movw	$75, -450(%rbp)
	movw	$85, -448(%rbp)
	movw	$95, -446(%rbp)
	movw	$0, -444(%rbp)
	movq	$7957825, -442(%rbp)
	movabsq	$3472328296278143026, %rax
	movq	%rax, -434(%rbp)
	movl	$3289136, -427(%rbp)
	movw	$90, -422(%rbp)
	movw	$88, -420(%rbp)
	movw	$92, -418(%rbp)
	movw	$86, -416(%rbp)
	movw	$91, -414(%rbp)
	movw	$89, -412(%rbp)
	movw	$87, -410(%rbp)
	movw	$90, -408(%rbp)
	movw	$0, -406(%rbp)
	movq	$6451010, -404(%rbp)
	movq	%rax, -396(%rbp)
	movl	$3354672, -389(%rbp)
	movw	$60, -384(%rbp)
	movw	$65, -382(%rbp)
	movw	$70, -380(%rbp)
	movw	$75, -378(%rbp)
	movw	$80, -376(%rbp)
	movw	$85, -374(%rbp)
	movw	$90, -372(%rbp)
	movw	$95, -370(%rbp)
	movw	$0, -368(%rbp)
	movq	$1852139587, -366(%rbp)
	movq	%rax, -358(%rbp)
	movl	$3420208, -351(%rbp)
	movw	$85, -346(%rbp)
	movw	$82, -344(%rbp)
	movw	$88, -342(%rbp)
	movw	$90, -340(%rbp)
	movw	$87, -338(%rbp)
	movw	$86, -336(%rbp)
	movw	$89, -334(%rbp)
	movw	$84, -332(%rbp)
	movw	$0, -330(%rbp)
	movabsq	$418463705412, %rcx
	movq	%rcx, -328(%rbp)
	movq	%rax, -320(%rbp)
	movl	$3485744, -313(%rbp)
	movw	$92, -308(%rbp)
	movw	$90, -306(%rbp)
	movw	$95, -304(%rbp)
	movw	$91, -302(%rbp)
	movw	$93, -300(%rbp)
	movw	$94, -298(%rbp)
	movw	$92, -296(%rbp)
	movw	$91, -294(%rbp)
	movw	$0, -292(%rbp)
	movq	$1851881029, -290(%rbp)
	movq	%rax, -282(%rbp)
	movl	$3551280, -275(%rbp)
	movw	$78, -270(%rbp)
	movw	$75, -268(%rbp)
	movw	$80, -266(%rbp)
	movw	$82, -264(%rbp)
	movw	$79, -262(%rbp)
	movw	$81, -260(%rbp)
	movw	$77, -258(%rbp)
	movw	$83, -256(%rbp)
	movw	$0, -254(%rbp)
	.loc 1 74 9
	movl	$0, -536(%rbp)
	.loc 1 75 9
	movl	$0, -532(%rbp)
	.loc 1 83 17
	call	clock@PLT
	movq	%rax, -528(%rbp)
	.loc 1 84 12
	movl	$0, -532(%rbp)
	.loc 1 84 5
	jmp	.L19
.L22:
	.loc 1 85 16
	movl	$0, -536(%rbp)
	.loc 1 85 9
	jmp	.L20
.L21:
	.loc 1 86 60
	leaq	-480(%rbp), %rcx
	movl	-536(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	$16, %rax
	addq	%rcx, %rax
	addq	$4, %rax
	.loc 1 86 33
	movl	$8, %esi
	movq	%rax, %rdi
	call	calculate_total
	movl	%eax, %ecx
	.loc 1 86 31 discriminator 1
	movl	-536(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rbp, %rax
	subq	$444, %rax
	movw	%cx, (%rax)
	.loc 1 85 40 discriminator 3
	addl	$1, -536(%rbp)
.L20:
	.loc 1 85 23 discriminator 1
	cmpl	$5, -536(%rbp)
	jle	.L21
	.loc 1 84 35 discriminator 2
	addl	$1, -532(%rbp)
.L19:
	.loc 1 84 19 discriminator 1
	cmpl	$99999, -532(%rbp)
	jle	.L22
	.loc 1 89 15
	call	clock@PLT
	movq	%rax, -520(%rbp)
	.loc 1 90 39
	movq	-520(%rbp), %rax
	subq	-528(%rbp), %rax
	.loc 1 90 20
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, -512(%rbp)
	.loc 1 92 5
	leaq	-480(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	print_result
	.loc 1 94 18
	call	clock@PLT
	movq	%rax, -504(%rbp)
	.loc 1 95 12
	movl	$0, -532(%rbp)
	.loc 1 95 5
	jmp	.L23
.L24:
	.loc 1 96 9
	movq	-480(%rbp), %rax
	movq	-472(%rbp), %rdx
	movq	%rax, -240(%rbp)
	movq	%rdx, -232(%rbp)
	movq	-464(%rbp), %rax
	movq	-456(%rbp), %rdx
	movq	%rax, -224(%rbp)
	movq	%rdx, -216(%rbp)
	movq	-448(%rbp), %rax
	movq	-440(%rbp), %rdx
	movq	%rax, -208(%rbp)
	movq	%rdx, -200(%rbp)
	movq	-432(%rbp), %rax
	movq	-424(%rbp), %rdx
	movq	%rax, -192(%rbp)
	movq	%rdx, -184(%rbp)
	movq	-416(%rbp), %rax
	movq	-408(%rbp), %rdx
	movq	%rax, -176(%rbp)
	movq	%rdx, -168(%rbp)
	movq	-400(%rbp), %rax
	movq	-392(%rbp), %rdx
	movq	%rax, -160(%rbp)
	movq	%rdx, -152(%rbp)
	movq	-384(%rbp), %rax
	movq	-376(%rbp), %rdx
	movq	%rax, -144(%rbp)
	movq	%rdx, -136(%rbp)
	movq	-368(%rbp), %rax
	movq	-360(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	movq	-352(%rbp), %rax
	movq	-344(%rbp), %rdx
	movq	%rax, -112(%rbp)
	movq	%rdx, -104(%rbp)
	movq	-336(%rbp), %rax
	movq	-328(%rbp), %rdx
	movq	%rax, -96(%rbp)
	movq	%rdx, -88(%rbp)
	movq	-320(%rbp), %rax
	movq	-312(%rbp), %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-304(%rbp), %rax
	movq	-296(%rbp), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-288(%rbp), %rax
	movq	-280(%rbp), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-272(%rbp), %rax
	movq	-264(%rbp), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movl	-256(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 97 9
	leaq	-240(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	sort_students_desc
	.loc 1 95 35 discriminator 3
	addl	$1, -532(%rbp)
.L23:
	.loc 1 95 19 discriminator 1
	cmpl	$99999, -532(%rbp)
	jle	.L24
	.loc 1 99 16
	call	clock@PLT
	movq	%rax, -496(%rbp)
	.loc 1 100 41
	movq	-496(%rbp), %rax
	subq	-504(%rbp), %rax
	.loc 1 100 21
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, -488(%rbp)
	.loc 1 102 5
	leaq	-480(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	sort_students_desc
	.loc 1 104 5
	leaq	-480(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	print_result
	.loc 1 105 5
	movsd	-512(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	-512(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	movl	$100000, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 106 5
	movsd	-488(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	-488(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	movl	$100000, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 108 12
	movl	$0, %eax
	.loc 1 109 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC7:
	.long	0
	.long	1083129856
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.file 4 "/usr/include/time.h"
	.file 5 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x37b
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0xe
	.long	.LASF32
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x9
	.long	0x51
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0xb
	.long	.LASF11
	.byte	0x2
	.byte	0x9c
	.byte	0x1b
	.long	0x64
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x9
	.long	0x77
	.uleb128 0x4
	.long	0x7e
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0xb
	.long	.LASF12
	.byte	0x3
	.byte	0x7
	.byte	0x13
	.long	0x6b
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.long	0x77
	.long	0xb2
	.uleb128 0x6
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.long	0xb7
	.uleb128 0x10
	.uleb128 0x11
	.long	.LASF33
	.byte	0x26
	.byte	0x1
	.byte	0xa
	.byte	0x8
	.long	0xf7
	.uleb128 0xa
	.long	.LASF14
	.byte	0xb
	.byte	0xa
	.long	0xa2
	.byte	0
	.uleb128 0x12
	.string	"sid"
	.byte	0x1
	.byte	0xc
	.byte	0xa
	.long	0xfc
	.byte	0x8
	.uleb128 0xa
	.long	.LASF15
	.byte	0xd
	.byte	0xb
	.long	0x10c
	.byte	0x14
	.uleb128 0xa
	.long	.LASF16
	.byte	0xe
	.byte	0xb
	.long	0x51
	.byte	0x24
	.byte	0
	.uleb128 0x9
	.long	0xb8
	.uleb128 0x5
	.long	0x77
	.long	0x10c
	.uleb128 0x6
	.long	0x2e
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.long	0x51
	.long	0x11c
	.uleb128 0x6
	.long	0x2e
	.byte	0x7
	.byte	0
	.uleb128 0x13
	.long	.LASF34
	.byte	0x4
	.byte	0x48
	.byte	0x10
	.long	0x8f
	.uleb128 0x14
	.long	.LASF35
	.byte	0x5
	.value	0x16b
	.byte	0xc
	.long	0x5d
	.long	0x140
	.uleb128 0x15
	.long	0x83
	.uleb128 0x16
	.byte	0
	.uleb128 0x17
	.long	.LASF26
	.byte	0x1
	.byte	0x40
	.byte	0x5
	.long	0x5d
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f5
	.uleb128 0x3
	.long	.LASF17
	.byte	0x41
	.byte	0x14
	.long	0x1f5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0x3
	.long	.LASF18
	.byte	0x49
	.byte	0x14
	.long	0x1f5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x2
	.string	"i"
	.byte	0x4a
	.byte	0x9
	.long	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0x2
	.string	"r"
	.byte	0x4b
	.byte	0x9
	.long	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -548
	.uleb128 0x3
	.long	.LASF19
	.byte	0x4c
	.byte	0xd
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -544
	.uleb128 0x3
	.long	.LASF20
	.byte	0x4d
	.byte	0xd
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -536
	.uleb128 0x3
	.long	.LASF21
	.byte	0x4e
	.byte	0xd
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -520
	.uleb128 0x3
	.long	.LASF22
	.byte	0x4f
	.byte	0xd
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -512
	.uleb128 0x3
	.long	.LASF23
	.byte	0x50
	.byte	0xc
	.long	0x205
	.uleb128 0x3
	.byte	0x91
	.sleb128 -528
	.uleb128 0x3
	.long	.LASF24
	.byte	0x51
	.byte	0xc
	.long	0x205
	.uleb128 0x3
	.byte	0x91
	.sleb128 -504
	.byte	0
	.uleb128 0x5
	.long	0xb8
	.long	0x205
	.uleb128 0x6
	.long	0x2e
	.byte	0x5
	.byte	0
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF25
	.uleb128 0xc
	.long	.LASF27
	.byte	0x36
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x24f
	.uleb128 0x7
	.long	.LASF17
	.byte	0x36
	.byte	0x28
	.long	0x24f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.string	"n"
	.byte	0x36
	.byte	0x38
	.long	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.string	"i"
	.byte	0x37
	.byte	0x9
	.long	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.long	0xf7
	.uleb128 0xc
	.long	.LASF28
	.byte	0x27
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c8
	.uleb128 0x7
	.long	.LASF17
	.byte	0x27
	.byte	0x28
	.long	0x2c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x8
	.string	"n"
	.byte	0x27
	.byte	0x38
	.long	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x2
	.string	"i"
	.byte	0x28
	.byte	0x9
	.long	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x18
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x2
	.string	"key"
	.byte	0x2b
	.byte	0x18
	.long	0xb8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.string	"j"
	.byte	0x2c
	.byte	0xd
	.long	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0xb8
	.uleb128 0xd
	.long	.LASF29
	.byte	0x20
	.byte	0x5
	.long	0x5d
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x321
	.uleb128 0x8
	.string	"a"
	.byte	0x20
	.byte	0x26
	.long	0xb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.string	"b"
	.byte	0x20
	.byte	0x35
	.long	0xb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"sa"
	.byte	0x21
	.byte	0x1b
	.long	0x24f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"sb"
	.byte	0x22
	.byte	0x1b
	.long	0x24f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xd
	.long	.LASF30
	.byte	0x11
	.byte	0x7
	.long	0x51
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x379
	.uleb128 0x7
	.long	.LASF15
	.byte	0x11
	.byte	0x23
	.long	0x379
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.long	.LASF31
	.byte	0x11
	.byte	0x31
	.long	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.string	"sum"
	.byte	0x12
	.byte	0x9
	.long	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"i"
	.byte	0x13
	.byte	0x9
	.long	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.long	0x58
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"char"
.LASF31:
	.string	"count"
.LASF20:
	.string	"avg_end"
.LASF23:
	.string	"avg_elapsed_ms"
.LASF12:
	.string	"clock_t"
.LASF4:
	.string	"unsigned char"
.LASF17:
	.string	"students"
.LASF2:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF25:
	.string	"double"
.LASF7:
	.string	"short int"
.LASF34:
	.string	"clock"
.LASF19:
	.string	"avg_start"
.LASF26:
	.string	"main"
.LASF21:
	.string	"sort_start"
.LASF32:
	.string	"GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"long long unsigned int"
.LASF33:
	.string	"student"
.LASF30:
	.string	"calculate_total"
.LASF18:
	.string	"students_copy"
.LASF11:
	.string	"__clock_t"
.LASF10:
	.string	"long long int"
.LASF29:
	.string	"compare_student_desc"
.LASF14:
	.string	"name"
.LASF27:
	.string	"print_result"
.LASF35:
	.string	"printf"
.LASF24:
	.string	"sort_elapsed_ms"
.LASF28:
	.string	"sort_students_desc"
.LASF16:
	.string	"total"
.LASF8:
	.string	"long int"
.LASF22:
	.string	"sort_end"
.LASF15:
	.string	"scores"
.LASF6:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/workspaces/CSAPP-LAB/hust/solution/lab2/1"
.LASF0:
	.string	"main.c"
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
