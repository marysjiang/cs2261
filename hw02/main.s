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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	lr, #225
	mov	ip, #70
	mov	r5, #10
	mov	r0, #30
	mov	r4, #20
	mov	r2, #1
	mov	r1, #130
	ldr	r7, .L4+12
	ldr	r6, .L4+16
	ldrh	r7, [r7, #48]
	strh	r7, [r6]	@ movhi
	ldr	r6, .L4+20
	strh	r3, [r6]	@ movhi
	ldr	r6, .L4+24
	str	r3, [r6]
	ldr	r6, .L4+28
	str	r3, [r6]
	ldr	r6, .L4+32
	str	r3, [r6]
	ldr	r6, .L4+36
	str	r3, [r6]
	ldr	r6, .L4+40
	str	r3, [r6]
	ldr	r3, .L4+44
	str	lr, [r3]
	ldr	r3, .L4+48
	str	lr, [r3]
	ldr	r3, .L4+52
	str	ip, [r3]
	ldr	r3, .L4+56
	str	ip, [r3]
	ldr	r3, .L4+60
	ldr	ip, .L4+64
	str	r5, [r3]
	ldr	r3, .L4+68
	str	r4, [ip]
	str	r0, [r3]
	ldr	ip, .L4+72
	ldr	r3, .L4+76
	str	r0, [ip]
	ldr	r4, .L4+80
	ldr	lr, .L4+84
	str	r2, [r3]
	ldr	ip, .L4+88
	ldr	r0, .L4+92
	ldr	r3, .L4+96
	str	r2, [r4]
	str	r2, [lr]
	str	r2, [ip]
	str	r1, [r0]
	str	r1, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	1023
	.word	fillScreen
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	gameOver
	.word	oCol1
	.word	oOldCol1
	.word	oCol2
	.word	oOldCol2
	.word	bCol
	.word	bOldCol
	.word	bRow
	.word	bOldRow
	.word	bWidth
	.word	bHeight
	.word	oRow1
	.word	oOldRow1
	.word	oRDel1
	.word	oCDel1
	.word	oCDel2
	.word	oRDel2
	.word	oRow2
	.word	oOldRow2
	.size	initialize, .-initialize
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	ip, .L8
	ldr	r6, .L8+4
	ldr	r5, .L8+8
	ldr	r1, .L8+12
	ldr	r0, .L8+16
	sub	sp, sp, #8
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	ldr	r4, .L8+20
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	ip, .L8+24
	ldr	r1, .L8+28
	ldr	r0, .L8+32
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+36
	ldr	r3, .L8+40
	ldr	r1, [r2]
	ldr	r0, [r3]
	ldr	r4, .L8+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+48
	ldr	r3, .L8+52
	ldr	r1, [r2]
	ldr	r0, [r3]
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+56
	ldr	r3, .L8+60
	ldr	r1, [r2]
	ldr	r4, .L8+64
	ldr	r0, [r3]
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+68
	ldr	r3, .L8+72
	ldr	r1, [r2]
	ldr	r0, [r3]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	1023
	.word	bHeight
	.word	bWidth
	.word	bOldRow
	.word	bOldCol
	.word	drawRect
	.word	31597
	.word	bRow
	.word	bCol
	.word	oOldRow1
	.word	oOldCol1
	.word	eraseOrange
	.word	oOldRow2
	.word	oOldCol2
	.word	oRow1
	.word	oCol1
	.word	drawOrange
	.word	oRow2
	.word	oCol2
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L15
	ldr	fp, .L15+4
	ldr	r3, .L15+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L15+12
	ldrh	r3, [fp]
	ldr	r1, [r6]
	ldr	r10, .L15+16
	ldr	r9, .L15+20
	ldr	r7, .L15+24
	ldr	r8, .L15+28
	ldr	r4, .L15+32
.L11:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	cmp	r1, #0
	strh	r3, [fp]	@ movhi
	bne	.L12
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r8
	ldrh	r3, [fp]
	ldr	r1, [r6]
	b	.L11
.L12:
	cmp	r1, #1
	bne	.L11
	mov	lr, pc
	bx	r7
	ldr	r3, .L15+36
	mov	r0, #31
	mov	lr, pc
	bx	r3
	ldrh	r3, [fp]
	ldr	r1, [r6]
	b	.L11
.L16:
	.align	2
.L15:
	.word	gameOver
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	updatePaddle
	.word	updateOranges
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.word	fillScreen
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
