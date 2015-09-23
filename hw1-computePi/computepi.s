	.file	"computepi.c"
	.text
	.globl	compute_pi_baseline
	.type	compute_pi_baseline, @function
compute_pi_baseline:
.LFB710:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	$0, %eax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	js	.L2
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	jmp	.L3
.L2:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L3:
	vmovsd	.LC1(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L4
.L9:
	movq	-24(%rbp), %rax
	testq	%rax, %rax
	js	.L5
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	jmp	.L6
.L5:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L6:
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	js	.L7
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	jmp	.L8
.L7:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
.L8:
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -8(%rbp)
	vmovsd	-8(%rbp), %xmm0
	vmulsd	-8(%rbp), %xmm0, %xmm0
	vmovsd	.LC1(%rip), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-16(%rbp), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	-32(%rbp), %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	addq	$1, -24(%rbp)
.L4:
	movq	-24(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L9
	vmovsd	-32(%rbp), %xmm1
	vmovsd	.LC2(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -48(%rbp)
	vmovsd	-48(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE710:
	.size	compute_pi_baseline, .-compute_pi_baseline
	.globl	computePi_pi_openmp
	.type	computePi_pi_openmp, @function
computePi_pi_openmp:
.LFB711:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	$0, %eax
	movq	%rax, -48(%rbp)
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	js	.L12
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	jmp	.L13
.L12:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L13:
	vmovsd	.LC1(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	call	omp_get_max_threads
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$computePi_pi_openmp._omp_fn.0, %edi
	call	GOMP_parallel_start
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	computePi_pi_openmp._omp_fn.0
	call	GOMP_parallel_end
	movq	-32(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	vmovsd	-48(%rbp), %xmm1
	vmovsd	.LC2(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -64(%rbp)
	vmovsd	-64(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE711:
	.size	computePi_pi_openmp, .-computePi_pi_openmp
	.globl	computePi_pi_avx
	.type	computePi_pi_avx, @function
computePi_pi_avx:
.LFB712:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$376, %rsp
	movq	%rdi, -112(%rsp)
	movl	$0, %eax
	movq	%rax, -88(%rsp)
	movq	-112(%rsp), %rax
	testq	%rax, %rax
	js	.L16
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	jmp	.L17
.L16:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L17:
	vmovsd	.LC1(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -80(%rsp)
	movabsq	$4607182418800017408, %rax
	movq	%rax, -72(%rsp)
	vbroadcastsd	-72(%rsp), %ymm0
	vmovapd	%ymm0, %ymm8
	movq	-80(%rsp), %rax
	movq	%rax, -64(%rsp)
	vbroadcastsd	-64(%rsp), %ymm0
	vmovapd	%ymm0, %ymm9
	vmovsd	-80(%rsp), %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	-80(%rsp), %xmm2
	vmovsd	.LC3(%rip), %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -56(%rsp)
	vmovsd	%xmm0, -48(%rsp)
	movq	-80(%rsp), %rax
	movq	%rax, -40(%rsp)
	movl	$0, %eax
	movq	%rax, -32(%rsp)
	vmovsd	-56(%rsp), %xmm0
	vmovsd	-48(%rsp), %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm1
	vmovsd	-40(%rsp), %xmm0
	vmovsd	-32(%rsp), %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmovapd	%ymm0, %ymm10
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, %ymm2
	movl	$0, -92(%rsp)
	jmp	.L22
.L29:
	vcvtsi2sd	-92(%rsp), %xmm0, %xmm0
	vmulsd	-80(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rsp)
	vbroadcastsd	-24(%rsp), %ymm0
	vmovapd	%ymm0, %ymm4
	vmovapd	%ymm4, 24(%rsp)
	vmovapd	%ymm10, %ymm5
	vmovapd	%ymm5, 56(%rsp)
	vmovapd	56(%rsp), %ymm0
	vmovapd	24(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm3
	vmovapd	%ymm3, 88(%rsp)
	vmovapd	%ymm3, 120(%rsp)
	vmovapd	120(%rsp), %ymm0
	vmovapd	88(%rsp), %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm7
	vmovapd	%ymm8, %ymm6
	vmovapd	%ymm6, 152(%rsp)
	vmovapd	%ymm7, 184(%rsp)
	vmovapd	184(%rsp), %ymm0
	vmovapd	152(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm6
	vmovapd	%ymm9, %ymm5
	vmovapd	%ymm5, 216(%rsp)
	vmovapd	%ymm6, 248(%rsp)
	vmovapd	216(%rsp), %ymm0
	vdivpd	248(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, %ymm4
	vmovapd	%ymm2, 280(%rsp)
	vmovapd	%ymm4, 312(%rsp)
	vmovapd	312(%rsp), %ymm0
	vmovapd	280(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm2
	addl	$4, -92(%rsp)
.L22:
	movl	-92(%rsp), %eax
	cltq
	movq	-112(%rsp), %rdx
	subq	$4, %rdx
	cmpq	%rdx, %rax
	jbe	.L29
	leaq	-8(%rsp), %rax
	movq	%rax, -16(%rsp)
	vmovapd	%ymm2, %ymm5
	vmovapd	%ymm5, 344(%rsp)
	movq	-16(%rsp), %rax
	vmovapd	344(%rsp), %ymm0
	vmovapd	%ymm0, (%rax)
	vmovsd	-8(%rsp), %xmm1
	vmovsd	(%rsp), %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	8(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-88(%rsp), %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -88(%rsp)
	vmovsd	-88(%rsp), %xmm1
	vmovsd	.LC2(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -120(%rsp)
	movq	-120(%rsp), %rax
	movq	%rax, -120(%rsp)
	vmovsd	-120(%rsp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE712:
	.size	computePi_pi_avx, .-computePi_pi_avx
	.globl	computePi_pi_avx_unroll
	.type	computePi_pi_avx_unroll, @function
computePi_pi_avx_unroll:
.LFB713:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$1800, %rsp
	movq	%rdi, 48(%rsp)
	movl	$0, %eax
	movq	%rax, 64(%rsp)
	movq	48(%rsp), %rax
	testq	%rax, %rax
	js	.L32
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	jmp	.L33
.L32:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L33:
	vmovsd	.LC1(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 72(%rsp)
	movabsq	$4607182418800017408, %rax
	movq	%rax, 80(%rsp)
	vbroadcastsd	80(%rsp), %ymm0
	vmovapd	%ymm0, %ymm15
	movq	72(%rsp), %rax
	movq	%rax, 88(%rsp)
	vbroadcastsd	88(%rsp), %ymm0
	vmovapd	%ymm0, 8(%rsp)
	vmovsd	72(%rsp), %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	72(%rsp), %xmm2
	vmovsd	.LC3(%rip), %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 96(%rsp)
	vmovsd	%xmm0, 104(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 112(%rsp)
	movl	$0, %eax
	movq	%rax, 120(%rsp)
	vmovsd	96(%rsp), %xmm0
	vmovsd	104(%rsp), %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm1
	vmovsd	112(%rsp), %xmm0
	vmovsd	120(%rsp), %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmovapd	%ymm0, -24(%rsp)
	vmovsd	72(%rsp), %xmm1
	vmovsd	.LC2(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	72(%rsp), %xmm2
	vmovsd	.LC4(%rip), %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vmovsd	72(%rsp), %xmm3
	vmovsd	.LC5(%rip), %xmm2
	vmulsd	%xmm2, %xmm3, %xmm2
	vmovsd	72(%rsp), %xmm4
	vmovsd	.LC6(%rip), %xmm3
	vmulsd	%xmm3, %xmm4, %xmm3
	vmovsd	%xmm3, 128(%rsp)
	vmovsd	%xmm2, 136(%rsp)
	vmovsd	%xmm1, 144(%rsp)
	vmovsd	%xmm0, 152(%rsp)
	vmovsd	128(%rsp), %xmm0
	vmovsd	136(%rsp), %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm1
	vmovsd	144(%rsp), %xmm0
	vmovsd	152(%rsp), %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmovapd	%ymm0, -56(%rsp)
	vmovsd	72(%rsp), %xmm1
	vmovsd	.LC7(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	72(%rsp), %xmm2
	vmovsd	.LC8(%rip), %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vmovsd	72(%rsp), %xmm3
	vmovsd	.LC9(%rip), %xmm2
	vmulsd	%xmm2, %xmm3, %xmm2
	vmovsd	72(%rsp), %xmm4
	vmovsd	.LC10(%rip), %xmm3
	vmulsd	%xmm3, %xmm4, %xmm3
	vmovsd	%xmm3, 160(%rsp)
	vmovsd	%xmm2, 168(%rsp)
	vmovsd	%xmm1, 176(%rsp)
	vmovsd	%xmm0, 184(%rsp)
	vmovsd	160(%rsp), %xmm0
	vmovsd	168(%rsp), %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm1
	vmovsd	176(%rsp), %xmm0
	vmovsd	184(%rsp), %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmovapd	%ymm0, -88(%rsp)
	vmovsd	72(%rsp), %xmm1
	vmovsd	.LC11(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	72(%rsp), %xmm2
	vmovsd	.LC12(%rip), %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vmovsd	72(%rsp), %xmm3
	vmovsd	.LC13(%rip), %xmm2
	vmulsd	%xmm2, %xmm3, %xmm2
	vmovsd	72(%rsp), %xmm4
	vmovsd	.LC14(%rip), %xmm3
	vmulsd	%xmm3, %xmm4, %xmm3
	vmovsd	%xmm3, 192(%rsp)
	vmovsd	%xmm2, 200(%rsp)
	vmovsd	%xmm1, 208(%rsp)
	vmovsd	%xmm0, 216(%rsp)
	vmovsd	192(%rsp), %xmm0
	vmovsd	200(%rsp), %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm1
	vmovsd	208(%rsp), %xmm0
	vmovsd	216(%rsp), %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmovapd	%ymm0, -120(%rsp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, %ymm11
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, %ymm12
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, %ymm13
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, %ymm14
	movl	$0, 60(%rsp)
	jmp	.L44
.L66:
	vcvtsi2sd	60(%rsp), %xmm0, %xmm0
	vmulsd	72(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, 224(%rsp)
	vbroadcastsd	224(%rsp), %ymm0
	vmovapd	%ymm0, %ymm5
	vmovapd	%ymm5, 392(%rsp)
	vmovapd	-24(%rsp), %ymm6
	vmovapd	%ymm6, 424(%rsp)
	vmovapd	424(%rsp), %ymm0
	vmovapd	392(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm4
	vmovapd	%ymm5, 456(%rsp)
	vmovapd	-56(%rsp), %ymm6
	vmovapd	%ymm6, 488(%rsp)
	vmovapd	488(%rsp), %ymm0
	vmovapd	456(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm6
	vmovapd	%ymm5, 520(%rsp)
	vmovapd	-88(%rsp), %ymm7
	vmovapd	%ymm7, 552(%rsp)
	vmovapd	552(%rsp), %ymm0
	vmovapd	520(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm7
	vmovapd	%ymm5, 584(%rsp)
	vmovapd	-120(%rsp), %ymm5
	vmovapd	%ymm5, 616(%rsp)
	vmovapd	616(%rsp), %ymm0
	vmovapd	584(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm3
	vmovapd	%ymm4, 648(%rsp)
	vmovapd	%ymm4, 680(%rsp)
	vmovapd	680(%rsp), %ymm0
	vmovapd	648(%rsp), %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm5
	vmovapd	%ymm6, %ymm4
	vmovapd	%ymm4, 712(%rsp)
	vmovapd	%ymm6, %ymm4
	vmovapd	%ymm4, 744(%rsp)
	vmovapd	744(%rsp), %ymm0
	vmovapd	712(%rsp), %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm4
	vmovapd	%ymm7, 776(%rsp)
	vmovapd	%ymm7, 808(%rsp)
	vmovapd	808(%rsp), %ymm0
	vmovapd	776(%rsp), %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm2
	vmovapd	%ymm3, 840(%rsp)
	vmovapd	%ymm3, 872(%rsp)
	vmovapd	872(%rsp), %ymm0
	vmovapd	840(%rsp), %ymm1
	vmulpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm3
	vmovapd	%ymm15, %ymm6
	vmovapd	%ymm6, 904(%rsp)
	vmovapd	%ymm5, 936(%rsp)
	vmovapd	936(%rsp), %ymm0
	vmovapd	904(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm8
	vmovapd	%ymm6, 968(%rsp)
	vmovapd	%ymm4, 1000(%rsp)
	vmovapd	1000(%rsp), %ymm0
	vmovapd	968(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm4
	vmovapd	%ymm6, 1032(%rsp)
	vmovapd	%ymm2, %ymm5
	vmovapd	%ymm5, 1064(%rsp)
	vmovapd	1064(%rsp), %ymm0
	vmovapd	1032(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm5
	vmovapd	%ymm6, 1096(%rsp)
	vmovapd	%ymm3, %ymm6
	vmovapd	%ymm6, 1128(%rsp)
	vmovapd	1128(%rsp), %ymm0
	vmovapd	1096(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm3
	vmovapd	8(%rsp), %ymm7
	vmovapd	%ymm7, 1160(%rsp)
	vmovapd	%ymm8, %ymm6
	vmovapd	%ymm6, 1192(%rsp)
	vmovapd	1160(%rsp), %ymm0
	vdivpd	1192(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, %ymm2
	vmovapd	%ymm7, 1224(%rsp)
	vmovapd	%ymm4, 1256(%rsp)
	vmovapd	1224(%rsp), %ymm0
	vdivpd	1256(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, %ymm9
	vmovapd	%ymm7, 1288(%rsp)
	vmovapd	%ymm5, 1320(%rsp)
	vmovapd	1288(%rsp), %ymm0
	vdivpd	1320(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, %ymm5
	vmovapd	%ymm7, 1352(%rsp)
	vmovapd	%ymm3, %ymm6
	vmovapd	%ymm6, 1384(%rsp)
	vmovapd	1352(%rsp), %ymm0
	vdivpd	1384(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, %ymm10
	vmovapd	%ymm11, %ymm7
	vmovapd	%ymm7, 1416(%rsp)
	vmovapd	%ymm2, %ymm6
	vmovapd	%ymm6, 1448(%rsp)
	vmovapd	1448(%rsp), %ymm0
	vmovapd	1416(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm11
	vmovapd	%ymm12, %ymm4
	vmovapd	%ymm4, 1480(%rsp)
	vmovapd	%ymm9, %ymm7
	vmovapd	%ymm7, 1512(%rsp)
	vmovapd	1512(%rsp), %ymm0
	vmovapd	1480(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm12
	vmovapd	%ymm13, %ymm3
	vmovapd	%ymm3, 1544(%rsp)
	vmovapd	%ymm5, 1576(%rsp)
	vmovapd	1576(%rsp), %ymm0
	vmovapd	1544(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm13
	vmovapd	%ymm14, %ymm6
	vmovapd	%ymm6, 1608(%rsp)
	vmovapd	%ymm10, %ymm2
	vmovapd	%ymm2, 1640(%rsp)
	vmovapd	1640(%rsp), %ymm0
	vmovapd	1608(%rsp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovapd	%ymm0, %ymm14
	addl	$16, 60(%rsp)
.L44:
	movl	60(%rsp), %eax
	cltq
	movq	48(%rsp), %rdx
	subq	$16, %rdx
	cmpq	%rdx, %rax
	jbe	.L66
	leaq	264(%rsp), %rax
	movq	%rax, 232(%rsp)
	vmovapd	%ymm11, %ymm4
	vmovapd	%ymm4, 1672(%rsp)
	movq	232(%rsp), %rax
	vmovapd	1672(%rsp), %ymm0
	vmovapd	%ymm0, (%rax)
	leaq	296(%rsp), %rax
	movq	%rax, 240(%rsp)
	vmovapd	%ymm12, %ymm7
	vmovapd	%ymm7, 1704(%rsp)
	movq	240(%rsp), %rax
	vmovapd	1704(%rsp), %ymm0
	vmovapd	%ymm0, (%rax)
	leaq	328(%rsp), %rax
	movq	%rax, 248(%rsp)
	vmovapd	%ymm13, %ymm3
	vmovapd	%ymm3, 1736(%rsp)
	movq	248(%rsp), %rax
	vmovapd	1736(%rsp), %ymm0
	vmovapd	%ymm0, (%rax)
	leaq	360(%rsp), %rax
	movq	%rax, 256(%rsp)
	vmovapd	%ymm14, %ymm6
	vmovapd	%ymm6, 1768(%rsp)
	movq	256(%rsp), %rax
	vmovapd	1768(%rsp), %ymm0
	vmovapd	%ymm0, (%rax)
	vmovsd	264(%rsp), %xmm1
	vmovsd	272(%rsp), %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	280(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	288(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	296(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	304(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	312(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	320(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	328(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	336(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	344(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	352(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	360(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	368(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	376(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	384(%rsp), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	64(%rsp), %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 64(%rsp)
	vmovsd	64(%rsp), %xmm1
	vmovsd	.LC2(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 8(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, 8(%rsp)
	vmovsd	8(%rsp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE713:
	.size	computePi_pi_avx_unroll, .-computePi_pi_avx_unroll
	.type	computePi_pi_openmp._omp_fn.0, @function
computePi_pi_openmp._omp_fn.0:
.LFB714:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -56(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, %eax
	movq	%rax, -48(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L69
.L72:
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	(%rcx), %rdx
.L70:
	movq	%rdx, -64(%rbp)
	vmovsd	-64(%rbp), %xmm0
	vaddsd	-48(%rbp), %xmm0, %xmm2
	vmovsd	%xmm2, -64(%rbp)
	movq	-64(%rbp), %rsi
	movq	%rdx, %rax
	lock cmpxchgq	%rsi, (%rcx)
	movq	%rdx, %rsi
	movq	%rax, %rdx
	cmpq	%rsi, %rax
	jne	.L70
	jmp	.L79
.L69:
	call	omp_get_num_threads
	movslq	%eax, %r12
	call	omp_get_thread_num
	movslq	%eax, %rsi
	movq	%rbx, %rax
	movl	$0, %edx
	divq	%r12
	movq	%rax, %rcx
	movq	%rbx, %rax
	movl	$0, %edx
	divq	%r12
	movq	%rdx, %rax
	cmpq	%rax, %rsi
	jb	.L71
.L78:
	imulq	%rcx, %rsi
	movq	%rsi, %rdx
	addq	%rdx, %rax
	addq	%rax, %rcx
	cmpq	%rcx, %rax
	jnb	.L72
	movq	%rax, -40(%rbp)
.L77:
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	js	.L73
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	jmp	.L74
.L73:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L74:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	js	.L75
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	jmp	.L76
.L75:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
.L76:
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmovsd	-24(%rbp), %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	.LC1(%rip), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	-56(%rbp), %rax
	vmovsd	16(%rax), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	-48(%rbp), %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	addq	$1, -40(%rbp)
	cmpq	%rcx, -40(%rbp)
	jb	.L77
	jmp	.L72
.L71:
	movl	$0, %eax
	addq	$1, %rcx
	jmp	.L78
.L79:
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE714:
	.size	computePi_pi_openmp._omp_fn.0, .-computePi_pi_openmp._omp_fn.0
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.align 8
.LC3:
	.long	0
	.long	1074266112
	.align 8
.LC4:
	.long	0
	.long	1075052544
	.align 8
.LC5:
	.long	0
	.long	1075314688
	.align 8
.LC6:
	.long	0
	.long	1075576832
	.align 8
.LC7:
	.long	0
	.long	1075838976
	.align 8
.LC8:
	.long	0
	.long	1075970048
	.align 8
.LC9:
	.long	0
	.long	1076101120
	.align 8
.LC10:
	.long	0
	.long	1076232192
	.align 8
.LC11:
	.long	0
	.long	1076363264
	.align 8
.LC12:
	.long	0
	.long	1076494336
	.align 8
.LC13:
	.long	0
	.long	1076625408
	.align 8
.LC14:
	.long	0
	.long	1076756480
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
