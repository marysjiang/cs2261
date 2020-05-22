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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall.part.0, %function
updateBall.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	lr, [r0]
	ldr	r1, [r0, #16]
	cmp	lr, #0
	ldr	ip, [r0, #4]
	rsble	r1, r1, #0
	strle	r1, [r0, #16]
	cmp	ip, #0
	mov	r5, r0
	ldr	r2, [r0, #28]
	sub	sp, sp, #20
	ldr	r0, [r0, #20]
	ble	.L3
	add	r3, ip, r2
	cmp	r3, #239
	bgt	.L3
.L4:
	ldr	r3, [r5, #24]
	add	r1, lr, r1
	add	lr, r1, r3
	add	r0, ip, r0
	cmp	lr, #159
	str	r1, [r5]
	str	r0, [r5, #4]
	ble	.L5
	mov	r4, #0
	ldr	lr, .L23
	ldr	ip, [lr]
	sub	ip, ip, #1
	str	ip, [lr]
	str	r4, [r5, #36]
.L5:
	mov	r7, #3
	ldr	r4, .L23+4
	ldr	r8, .L23+8
.L8:
	ldr	r9, [r4, #20]
	ldr	r6, [r4, #24]
	ldr	lr, [r4]
	ldr	ip, [r4, #4]
	str	r9, [sp, #12]
	stm	sp, {ip, lr}
	str	r6, [sp, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r5, #16]
	rsbne	r3, r3, #0
	strne	r3, [r5, #16]
	subs	r7, r7, #1
	beq	.L7
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #24]
	b	.L8
.L3:
	rsb	r0, r0, #0
	str	r0, [r5, #20]
	b	.L4
.L7:
	ldr	r4, .L23+12
	ldr	r9, .L23+16
	add	r6, r4, #768
	b	.L12
.L10:
	add	r4, r4, #32
	cmp	r6, r4
	beq	.L22
.L12:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L10
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L10
	str	r7, [r4, #28]
	ldr	r3, [r9]
	ldr	r2, [r5, #16]
	add	r4, r4, #32
	sub	r3, r3, #1
	rsb	r2, r2, #0
	cmp	r6, r4
	str	r2, [r5, #16]
	str	r3, [r9]
	bne	.L12
.L22:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	ballsRemaining
	.word	player
	.word	collision
	.word	bricks
	.word	bricksRemaining
	.size	updateBall.part.0, .-updateBall.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #110
	mov	r4, #2
	mov	lr, #25
	mov	r2, #135
	mov	ip, #6
	mvn	r0, #64512
	ldr	r3, .L27
	str	r4, [r3, #16]
	str	lr, [r3, #24]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	ip, [r3, #20]
	strh	r0, [r3, #28]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L44
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #24]
	ldr	r0, [r3]
	add	ip, r2, r1
	cmp	ip, #238
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	bgt	.L30
	ldr	r0, .L44+4
	ldrh	r0, [r0]
	tst	r0, #16
	bne	.L43
.L31:
	ldr	r1, .L44+8
	ldrh	r1, [r1, #48]
	tst	r1, #16
	ldreq	r1, [r3, #16]
	addeq	r2, r2, r1
	ldrne	r2, [r3, #4]
	streq	r2, [r3, #4]
.L30:
	cmp	r2, #1
	bxle	lr
	ldr	r1, .L44+4
	ldrh	r1, [r1]
	tst	r1, #32
	beq	.L35
	ldr	r1, .L44+12
	ldrh	r1, [r1]
	tst	r1, #32
	bne	.L35
	ldr	r1, [r3, #16]
	sub	r2, r2, r1
	cmp	r2, #1
	str	r2, [r3, #4]
	bxle	lr
.L35:
	ldr	r1, .L44+8
	ldrh	r1, [r1, #48]
	tst	r1, #32
	ldreq	r1, [r3, #16]
	subeq	r2, r2, r1
	streq	r2, [r3, #4]
	bx	lr
.L43:
	ldr	r0, .L44+12
	ldrh	r0, [r0]
	tst	r0, #16
	bne	.L31
	ldr	r0, [r3, #16]
	add	r2, r2, r0
	add	r1, r1, r2
	cmp	r1, #238
	str	r2, [r3, #4]
	ble	.L31
	b	.L30
.L45:
	.align	2
.L44:
	.word	player
	.word	oldButtons
	.word	67109120
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L57
	bl	updatePlayer
	ldr	r3, [r4, #36]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBall.part.0
.L47:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	ldrne	r0, .L57+4
	blne	updateBall.part.0
.L48:
	ldr	r3, [r4, #116]
	cmp	r3, #0
	ldrne	r0, .L57+8
	popne	{r4, lr}
	bne	updateBall.part.0
.L46:
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	balls
	.word	balls+40
	.word	balls+80
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r4, .L61
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r5, .L61+4
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBricks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBricks, %function
initBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #10
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #0
	mov	r7, ip
	mov	r0, #5
	mov	r6, #23
	mov	r5, #1
	ldr	r2, .L68
	ldr	r4, .L68+4
	ldr	lr, .L68+8
.L65:
	umull	r8, r3, r4, r1
	lsr	r3, r3, #2
	add	r3, r3, r3, lsl #1
	subs	r3, r1, r3, lsl #1
	moveq	ip, #20
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	add	r1, r1, #1
	addeq	r0, r0, #15
	add	r3, r3, ip
	cmp	r1, #24
	str	r3, [r2, #4]
	str	r3, [r2, #12]
	str	r0, [r2]
	str	r0, [r2, #8]
	str	r7, [r2, #16]
	str	r6, [r2, #20]
	strh	lr, [r2, #24]	@ movhi
	str	r5, [r2, #28]
	add	r2, r2, #32
	bne	.L65
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	bricks
	.word	-1431655765
	.word	32736
	.size	initBricks, .-initBricks
	.align	2
	.global	drawBrick
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBrick, %function
drawBrick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, [r0, #28]
	cmp	r5, #0
	ldr	r0, [r0, #12]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	sub	sp, sp, #8
	beq	.L71
	mov	ip, #0
	ldr	r5, .L74
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #24]
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
.L72:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	str	r5, [sp]
	ldr	r6, .L74
	mov	lr, pc
	bx	r6
	str	r5, [r4, #28]
	b	.L72
.L75:
	.align	2
.L74:
	.word	drawRect
	.size	drawBrick, .-drawBrick
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #1
	mov	r9, #10
	ldr	r4, .L80
	ldr	r7, .L80+4
	ldr	r10, .L80+8
	ldr	r6, .L80+12
	add	r5, r4, #120
.L77:
	mov	lr, pc
	bx	r7
	mov	r2, #31
	smull	r3, r1, r6, r0
	asr	r3, r0, r2
	add	r1, r1, r0
	rsb	r3, r3, r1, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	ldr	r1, [r10]
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #50
	sub	r3, r1, #60
	str	r8, [r4, #16]
	str	r8, [r4, #20]
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	str	r8, [r4, #36]
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r3, [r4]
	str	r3, [r4, #8]
	strh	r2, [r4, #32]	@ movhi
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L77
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	balls
	.word	rand
	.word	player
	.word	-368140053
	.size	initBalls, .-initBalls
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #110
	mov	r2, #135
	mov	lr, #25
	mvn	r0, #64512
	mov	ip, #6
	mov	r4, #2
	ldr	r3, .L84
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3, #24]
	strh	r0, [r3, #28]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #8]
	str	ip, [r3, #20]
	bl	initBricks
	bl	initBalls
	mov	r0, #24
	mov	r2, #3
	ldr	r1, .L84+4
	ldr	r3, .L84+8
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	player
	.word	bricksRemaining
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.0
	.size	updateBall, .-updateBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, [r0, #36]
	cmp	r5, #0
	ldr	r0, [r0, #12]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	sub	sp, sp, #8
	beq	.L89
	mov	ip, #0
	ldr	r5, .L92
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldr	r2, .L92+4
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
.L90:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	str	r5, [sp]
	ldr	r6, .L92
	mov	lr, pc
	bx	r6
	str	r5, [r4, #36]
	b	.L90
.L93:
	.align	2
.L92:
	.word	drawRect
	.word	31775
	.size	drawBall, .-drawBall
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r4, .L98
	add	r5, r4, #768
.L95:
	mov	r0, r4
	add	r4, r4, #32
	bl	drawBrick
	cmp	r5, r4
	bne	.L95
	ldr	r0, .L98+4
	bl	drawBall
	ldr	r0, .L98+8
	bl	drawBall
	ldr	r0, .L98+12
	pop	{r4, r5, r6, lr}
	b	drawBall
.L99:
	.align	2
.L98:
	.word	bricks
	.word	balls
	.word	balls+40
	.word	balls+80
	.size	drawGame, .-drawGame
	.comm	ballsRemaining,4,4
	.comm	bricksRemaining,4,4
	.comm	balls,120,4
	.comm	bricks,768,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
