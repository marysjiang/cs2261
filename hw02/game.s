	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	updatePaddle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePaddle, %function
updatePaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L20
	ldr	r2, .L20+4
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, .L20+8
	str	lr, [sp, #-4]!
	ldr	r0, [r1]
	ldr	lr, .L20+12
	ldr	ip, .L20+16
	add	r2, r3, r2
	cmp	r2, #239
	str	r3, [lr]
	str	r0, [ip]
	bgt	.L3
	ldr	r2, .L20+20
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L4
	ldr	r2, .L20+24
	ldrh	r2, [r2]
	tst	r2, #128
	addeq	r0, r0, #1
	streq	r0, [r1]
.L4:
	ldr	r2, .L20+28
	ldrh	r2, [r2, #48]
	tst	r2, #128
	beq	.L10
.L3:
	cmp	r3, #0
	ble	.L1
	ldr	r3, .L20+20
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L7
	ldr	r3, .L20+24
	ldrh	r3, [r3]
	tst	r3, #64
	ldreq	r3, [r1]
	subeq	r3, r3, #1
	streq	r3, [r1]
.L7:
	ldr	r3, .L20+28
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldreq	r3, [r1]
	subeq	r3, r3, #1
	streq	r3, [r1]
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L10:
	ldr	r2, [r1]
	add	r2, r2, #1
	str	r2, [r1]
	b	.L3
.L21:
	.align	2
.L20:
	.word	bCol
	.word	bWidth
	.word	bRow
	.word	bOldCol
	.word	bOldRow
	.word	oldButtons
	.word	buttons
	.word	67109120
	.size	updatePaddle, .-updatePaddle
	.align	2
	.global	updateOranges
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateOranges, %function
updateOranges:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L44
	ldr	r1, .L44+4
	ldr	r2, [r6]
	ldr	r7, .L44+8
	ldr	r5, .L44+12
	str	r2, [r1]
	ldr	r3, [r7]
	ldr	ip, [r5]
	ldr	r0, .L44+16
	ldr	r1, .L44+20
	ldr	r4, .L44+24
	str	ip, [r1]
	str	r3, [r0]
	ldr	r1, .L44+28
	ldr	r0, [r4]
	ldr	r8, .L44+32
	cmp	r2, #149
	str	r0, [r1]
	ldrhi	r1, [r8]
	ldr	r9, .L44+36
	rsbhi	r1, r1, #0
	strhi	r1, [r8]
	cmp	r3, #0
	ldrlt	r1, [r9]
	rsblt	r1, r1, #0
	strlt	r1, [r9]
	mov	r1, #10
	sub	sp, sp, #20
	str	r2, [sp, #4]
	str	r3, [sp]
	str	r1, [sp, #12]
	str	r1, [sp, #8]
	ldr	r3, .L44+40
	ldr	r2, .L44+44
	ldr	r1, .L44+48
	ldr	r0, .L44+52
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	ldr	ip, .L44+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L25
	ldr	r2, [r8]
	ldr	r3, [r9]
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	str	r2, [r8]
	str	r3, [r9]
.L25:
	mov	ip, #10
	ldr	r2, [r4]
	ldr	r10, .L44+60
	cmp	r2, #149
	ldrhi	r3, [r10]
	rsbhi	r3, r3, #0
	strhi	r3, [r10]
	ldr	r3, [r5]
	ldr	fp, .L44+64
	cmp	r3, #0
	ldrlt	r1, [fp]
	rsblt	r1, r1, #0
	str	r2, [sp, #4]
	str	r3, [sp]
	strlt	r1, [fp]
	ldr	r3, .L44+40
	ldr	r2, .L44+44
	ldr	r1, .L44+48
	ldr	r0, .L44+52
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, .L44+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldrne	r2, [r10]
	ldrne	r3, [fp]
	rsbne	r0, r2, #0
	ldr	r2, [r7]
	rsbne	lr, r3, #0
	ldreq	r0, [r10]
	ldreq	lr, [fp]
	strne	r0, [r10]
	strne	lr, [fp]
	cmp	r2, #229
	ldr	r3, [r5]
	bgt	.L30
	cmp	r3, #229
	ble	.L31
.L30:
	mov	ip, #1
	ldr	r1, .L44+68
	str	ip, [r1]
.L31:
	ldr	ip, [r9]
	ldr	r1, [r6]
	add	ip, ip, r2
	ldr	r8, [r8]
	ldr	r2, [r4]
	add	r3, r3, lr
	add	r1, r1, r8
	add	r2, r2, r0
	str	ip, [r7]
	str	r3, [r5]
	str	r1, [r6]
	str	r2, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	oRow1
	.word	oOldRow1
	.word	oCol1
	.word	oCol2
	.word	oOldCol1
	.word	oOldCol2
	.word	oRow2
	.word	oOldRow2
	.word	oRDel1
	.word	oCDel1
	.word	bHeight
	.word	bWidth
	.word	bRow
	.word	bCol
	.word	collision
	.word	oRDel2
	.word	oCDel2
	.word	gameOver
	.size	updateOranges, .-updateOranges
	.comm	bHeight,4,4
	.comm	bWidth,4,4
	.comm	bRDel,4,4
	.comm	bCDel,4,4
	.comm	bOldRow,4,4
	.comm	bOldCol,4,4
	.comm	bRow,4,4
	.comm	bCol,4,4
	.comm	oRDel2,4,4
	.comm	oRDel1,4,4
	.comm	oCDel2,4,4
	.comm	oCDel1,4,4
	.comm	oOldRow2,4,4
	.comm	oOldRow1,4,4
	.comm	oOldCol2,4,4
	.comm	oOldCol1,4,4
	.comm	oRow2,4,4
	.comm	oRow1,4,4
	.comm	oCol2,4,4
	.comm	oCol1,4,4
	.comm	gameOver,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
