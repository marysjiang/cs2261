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
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
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
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L19
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L12:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L12
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	ip, [sp, #64]	@ zero_extendqisi2
	ldrb	lr, [sp, #64]	@ zero_extendqisi2
	subs	r4, r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #22]	@ movhi
	ble	.L21
	sub	r10, r2, #2
	sub	r8, r2, #1
	add	r5, r2, r2, lsr #31
	add	r4, r4, r1
	rsb	r3, r1, r1, lsl #4
	ldr	lr, .L45
	add	r6, r0, r2
	asr	r10, r10, #1
	asr	r9, r8, #1
	asr	r5, r5, #1
	asr	r1, r2, #1
	and	r7, r2, #1
	orr	r9, r9, #-2130706432
	orr	r5, r5, #-2130706432
	rsb	r4, r4, r4, lsl #4
	cmp	r2, #0
	sub	r6, r6, #1
	orr	r10, r10, #-2130706432
	orr	r1, r1, #-2130706432
	mov	fp, r7
	str	r9, [sp, #8]
	str	r5, [sp]
	ldm	lr, {ip, lr}
	str	r10, [sp, #4]
	str	r1, [sp, #12]
	add	r4, r0, r4, lsl #4
	add	r3, r0, r3, lsl #4
	and	r6, r6, #1
	and	r5, r0, #1
	rsblt	fp, r7, #0
	add	r9, sp, #22
	b	.L37
.L43:
	cmp	r7, #0
	bne	.L24
	add	r1, r3, r3, lsr #31
	bic	r1, r1, #1
	add	r1, ip, r1
	str	r7, [lr, #44]
	str	r9, [lr, #36]
	str	r1, [lr, #40]
	ldr	r1, [sp]
	str	r1, [lr, #44]
.L25:
	add	r3, r3, #240
	cmp	r4, r3
	beq	.L21
.L37:
	cmp	r5, #0
	beq	.L43
	add	r1, r3, r3, lsr #31
	bic	r1, r1, #1
	ldrh	r0, [ip, r1]
	cmp	fp, #1
	ldrb	r10, [sp, #64]	@ zero_extendqisi2
	and	r0, r0, #255
	beq	.L44
	orr	r0, r0, r10, lsl #8
	cmp	r2, #2
	strh	r0, [ip, r1]	@ movhi
	ble	.L34
	mov	r0, #0
	add	r1, r3, #1
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	add	r1, ip, r1
	str	r0, [lr, #44]
	str	r9, [lr, #36]
	str	r1, [lr, #40]
	ldr	r1, [sp, #4]
	str	r1, [lr, #44]
.L34:
	add	r1, r3, r8
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r10, [ip, r1]
	ldrb	r0, [sp, #64]	@ zero_extendqisi2
	cmp	r6, #0
	andne	r10, r10, #255
	andeq	r10, r10, #65280
	and	r0, r0, #255
	add	r3, r3, #240
	orrne	r10, r10, r0, lsl #8
	orreq	r10, r10, r0
	cmp	r4, r3
	strh	r10, [ip, r1]	@ movhi
	bne	.L37
.L21:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L24:
	cmp	r2, #1
	ble	.L34
	add	r1, r3, r3, lsr #31
	bic	r1, r1, #1
	add	r1, ip, r1
	str	r5, [lr, #44]
	str	r9, [lr, #36]
	str	r1, [lr, #40]
	ldr	r1, [sp, #8]
	str	r1, [lr, #44]
	b	.L34
.L44:
	orr	r0, r0, r10, lsl #8
	cmp	r2, #1
	strh	r0, [ip, r1]	@ movhi
	ble	.L25
	mov	r0, #0
	add	r1, r3, #1
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	add	r1, ip, r1
	str	r0, [lr, #44]
	str	r9, [lr, #36]
	str	r1, [lr, #40]
	ldr	r1, [sp, #12]
	str	r1, [lr, #44]
	b	.L25
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strh	r0, [sp, #6]	@ movhi
	ldr	r2, .L49
	ldrh	lr, [sp, #6]
	ldm	r2, {r1, r3}
	ldr	r2, .L49+4
	add	r0, sp, #14
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L53
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L53+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L55
	mov	r4, #0
	ldr	r6, .L61
	add	lr, r1, lr
	ldr	r3, [r6]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L57:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L57
.L55:
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r3, #0
	ldr	r6, [sp, #24]
	ble	.L63
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L68
	add	r4, r1, r3
	add	r5, r2, r2, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r1, r1, r1, lsl #4
	asr	r5, r5, #1
	ldm	lr, {r7, lr}
	add	r4, r0, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r0, r0, r1, lsl #4
.L65:
	add	r1, ip, ip, lsr #31
	add	r3, r0, r0, lsr #31
	bic	r1, r1, #1
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r1, r6, r1
	add	r3, r7, r3
	cmp	r4, r0
	str	r8, [lr, #44]
	add	ip, ip, r2
	str	r1, [lr, #36]
	str	r3, [lr, #40]
	str	r5, [lr, #44]
	bne	.L65
.L63:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L71
	ldr	r1, .L71+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L72:
	.align	2
.L71:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L74
	ldr	r1, .L74+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L75:
	.align	2
.L74:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
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
.L77:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L77
	mov	r2, #67108864
.L78:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L78
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L85
	moveq	r2, #100663296
	ldr	r0, .L85+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L86:
	.align	2
.L85:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L89
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
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
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L95
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L97
.L95:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L97:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L95
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
