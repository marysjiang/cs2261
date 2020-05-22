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
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	lr, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L5
	ldr	r3, .L13
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	ldr	r1, [r3]
	add	r3, r0, r2
	mov	r0, #0
	rsb	r4, r2, r2, lsl #31
	add	r1, r1, r3, lsl #1
	lsl	r4, r4, #1
.L7:
	cmp	r2, #0
	addgt	r3, r1, r4
	ble	.L10
.L8:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	lr, r0
	add	r1, r1, #480
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
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
	ldr	ip, .L19
	str	lr, [sp, #-4]!
	rsb	lr, r1, r1, lsl #4
	add	r3, r0, lr, lsl #4
	ldr	r1, [ip]
	add	lr, r0, lr, lsl #4
	add	r3, r3, #8384
	add	ip, r1, #68
	add	r3, r3, #16
	sub	r0, lr, #-2147483647
	add	r3, r1, r3, lsl #1
	add	r0, r1, r0, lsl #1
	add	ip, ip, lr, lsl #1
	add	r1, r1, lr, lsl #1
.L16:
	strh	r2, [r0, #2]!	@ movhi
	strh	r2, [r1]	@ movhi
	cmp	r0, ip
	strh	r2, [r3]	@ movhi
	sub	r3, r3, #476
	sub	r3, r3, #2
	add	r1, r1, #480
	bne	.L16
	ldr	lr, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
	.align	2
	.global	drawOrange
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawOrange, %function
drawOrange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r1, r1, r1, lsl #4
	push	{r4, r5, lr}
	lsl	r4, r1, #4
	mov	lr, r4
	ldr	r3, .L29
	ldr	ip, [r3]
	ldr	r1, .L29+4
	add	r3, r0, r4
	add	r2, ip, #20
	add	r2, r2, r3, lsl #1
	add	r5, r4, #2400
.L22:
	sub	r3, r2, #20
.L23:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L23
	add	lr, lr, #240
	cmp	lr, r5
	add	r2, r3, #480
	bne	.L22
	mov	r2, #0
	add	r3, r0, r4
	sub	r3, r3, #716
	ldr	r1, .L29+8
	add	r3, ip, r3, lsl #1
.L25:
	add	r2, r2, #1
	cmp	r2, #3
	strh	r1, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	add	r3, r3, #480
	bne	.L25
	pop	{r4, r5, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.word	351
	.word	11212
	.size	drawOrange, .-drawOrange
	.align	2
	.global	eraseOrange
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseOrange, %function
eraseOrange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r1, r1, r1, lsl #4
	push	{r4, r5, lr}
	lsl	r4, r1, #4
	mov	lr, r4
	mvn	r1, #64512
	ldr	r3, .L39
	ldr	ip, [r3]
	add	r3, r0, r4
	add	r2, ip, #20
	add	r2, r2, r3, lsl #1
	add	r5, r4, #2400
.L32:
	sub	r3, r2, #20
.L33:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L33
	add	lr, lr, #240
	cmp	lr, r5
	add	r2, r3, #480
	bne	.L32
	mov	r2, #0
	mvn	r1, #64512
	add	r3, r0, r4
	sub	r3, r3, #716
	add	r3, ip, r3, lsl #1
.L35:
	add	r2, r2, #1
	cmp	r2, #3
	strh	r1, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	add	r3, r3, #480
	bne	.L35
	pop	{r4, r5, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	eraseOrange, .-eraseOrange
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
	ldr	r3, .L45
	ldr	r2, .L45+4
	ldr	r1, [r3]
	sub	r3, r1, #2
	add	r2, r1, r2
.L42:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L42
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	76798
	.size	fillScreen, .-fillScreen
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
.L48:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L48
	mov	r2, #67108864
.L49:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L49
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	cmp	r3, ip
	blt	.L57
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	blt	.L57
	ldr	r3, [sp]
	add	r2, r0, r2
	cmp	r2, r3
	blt	.L57
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
	bx	lr
.L57:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
