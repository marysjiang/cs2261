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
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L3
	strh	r2, [r3]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.global	frame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L7
	ldr	r5, .L7+4
	mov	r2, r4
	mov	r1, #70
	mov	r0, #50
	mov	lr, pc
	bx	r5
	mov	r2, r4
	mov	r1, #70
	mov	r0, #130
	mov	lr, pc
	bx	r5
	mov	r2, r4
	mov	r1, #100
	mov	r0, #75
	ldr	r3, .L7+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	31775
	.word	drawTriangle
	.word	drawRect
	.size	frame1, .-frame1
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L11
	ldr	r5, .L11+4
	mov	r2, r4
	mov	r1, #80
	mov	r0, #100
	mov	lr, pc
	bx	r5
	mov	r2, r4
	mov	r1, #80
	mov	r0, #180
	mov	lr, pc
	bx	r5
	mov	r2, r4
	mov	r1, #110
	mov	r0, #125
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	32767
	.word	drawTriangle
	.word	drawRect
	.size	frame2, .-frame2
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L15
	ldr	r5, .L15+4
	mov	r2, r4
	mov	r1, #30
	mov	r0, #80
	mov	lr, pc
	bx	r5
	mov	r2, r4
	mov	r1, #30
	mov	r0, #160
	mov	lr, pc
	bx	r5
	mov	r2, r4
	mov	r1, #60
	mov	r0, #105
	ldr	r3, .L15+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	32736
	.word	drawTriangle
	.word	drawRect
	.size	frame3, .-frame3
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
	mov	r3, #67108864
	ldr	r2, .L20
	push	{r4, r7, fp, lr}
	ldr	r6, .L20+4
	strh	r2, [r3]	@ movhi
	ldr	r5, .L20+8
	ldr	fp, .L20+12
	ldr	r4, .L20+16
	ldr	r10, .L20+20
	ldr	r9, .L20+24
	ldr	r8, .L20+28
	ldr	r7, .L20+32
.L18:
	mov	r0, r8
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	fp
	mov	r0, #300
	mov	lr, pc
	bx	r4
	mov	r0, #31
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r10
	mov	r0, #300
	mov	lr, pc
	bx	r4
	mov	r0, r7
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r9
	mov	r0, #300
	mov	lr, pc
	bx	r4
	b	.L18
.L21:
	.align	2
.L20:
	.word	1027
	.word	fillScreen
	.word	waitForVBlank
	.word	frame1
	.word	delay
	.word	frame2
	.word	frame3
	.word	32736
	.word	1023
	.size	main, .-main
	.ident	"GCC: (devkitARM release 53) 9.1.0"
