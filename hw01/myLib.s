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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldr	r2, .L9+4
	ldr	r1, [r3]
	sub	r3, r1, #2
	add	r2, r1, r2
.L6:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L6
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	76798
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L15
	str	lr, [sp, #-4]!
	rsb	lr, r1, r1, lsl #4
	add	r3, r0, lr, lsl #4
	ldr	r1, [ip]
	add	lr, r0, lr, lsl #4
	add	r3, r3, #7168
	add	ip, r1, #58
	add	r3, r3, #32
	sub	r0, lr, #-2147483647
	add	r3, r1, r3, lsl #1
	add	r0, r1, r0, lsl #1
	add	ip, ip, lr, lsl #1
	add	r1, r1, lr, lsl #1
.L12:
	strh	r2, [r0, #2]!	@ movhi
	strh	r2, [r1]	@ movhi
	cmp	r0, ip
	strh	r2, [r3]	@ movhi
	sub	r3, r3, #476
	sub	r3, r3, #2
	add	r1, r1, #480
	bne	.L12
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	ldr	r3, .L23
	push	{r4, r5, lr}
	ldr	r3, [r3]
	rsb	lr, r1, r1, lsl #4
	add	lr, r0, lr, lsl #4
	add	lr, r3, lr, lsl #1
	add	r4, lr, #480
	lsl	r5, r1, #4
	add	lr, lr, #80
.L18:
	strh	r2, [r4, ip]	@ movhi
	strh	r2, [lr, ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, #9600
	bne	.L18
	sub	ip, r5, r1
	add	r1, r0, ip, lsl #4
	add	r1, r1, #-2147483648
	add	ip, r0, ip, lsl #4
	add	r1, r1, #4800
	add	r0, r3, #78
	sub	lr, ip, #-2147483647
	add	r1, r3, r1, lsl #1
	add	r0, r0, ip, lsl #1
	add	r3, r3, lr, lsl #1
.L19:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r0, r3
	strh	r2, [r1, #2]!	@ movhi
	bne	.L19
	pop	{r4, r5, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L26:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L26
	mov	r2, #67108864
.L27:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L27
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	lsl	r0, r0, #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L31
.L33:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L33
.L31:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
