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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #0
	mov	r5, #100
	mov	r4, #2
	mov	lr, #3
	mov	ip, #32
	ldr	r2, .L4
	ldr	r0, [r2]
	ldr	r2, .L4+4
	ldr	r3, .L4+8
	ldr	r2, [r2]
	add	r0, r0, r2
	ldr	r2, [r3, #24]
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	lsl	r0, r0, #8
	rsb	r2, r2, #120
	str	r5, [r3]
	str	r4, [r3, #20]
	str	lr, [r3, #44]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r1, [r3, #40]
	str	r1, [r3, #36]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	ground
	.word	vOff
	.word	player
	.size	initPlayer, .-initPlayer
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #16384
	ldr	r4, .L12
	mov	r0, #3
	ldr	r2, .L12+4
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r4, #0
	mov	r2, #3
	ldr	ip, .L12+20
	ldr	r0, .L12+24
	ldr	r1, .L12+28
	ldr	r3, .L12+32
	str	r4, [ip]
	str	r4, [r0]
	ldr	ip, .L12+36
	str	r4, [r1]
	str	r4, [r3]
	ldr	r1, .L12+40
	ldr	r3, .L12+44
	ldr	r0, .L12+48
	ldr	r5, .L12+52
	str	r2, [r3]
	str	r4, [ip]
	str	r4, [r1]
	str	r4, [r0]
	mov	lr, pc
	bx	r5
	ldr	r3, .L12+56
	smull	r2, r3, r0, r3
	add	r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L12+60
	sub	r0, r0, r3, lsl #1
	ldr	r3, .L12+64
	add	r0, r0, #10
	str	r4, [r2]
	str	r0, [r3]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	ip, #100
	ldr	r3, .L12+68
	smull	r2, r3, r0, r3
	add	r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #8
	add	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl r1
	ldr	r2, .L12+72
	ldr	r3, .L12+76
	add	r0, r0, #20
	str	r0, [r3]
	ldr	lr, .L12+80
	str	r4, [r2]
	ldr	r3, .L12+84
	ldr	r2, .L12+88
	str	r1, [r3]
	str	ip, [r2]
	str	r4, [lr]
	bl	initPlayer
	mov	ip, #16
	mov	r2, #32
	mov	r8, #95
	mov	r7, #25
	mov	r6, #2
	mov	r5, #117
	mov	r1, r4
	mov	r0, ip
	mov	lr, #116
	ldr	r3, .L12+92
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r4, [r3, #32]
	ldr	r2, .L12+96
	str	r4, [r3, #40]
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r6, [r3, #44]
	ldr	r3, .L12+100
	str	r4, [r2, #4]
	str	r4, [r2, #12]
	str	r4, [r2, #48]
	str	r4, [r2, #52]
	str	r4, [r2, #60]
	str	r4, [r2, #68]
	str	r4, [r2, #104]
	str	r4, [r2, #108]
	str	r5, [r2]
	str	r5, [r2, #56]
	str	ip, [r2, #24]
	str	ip, [r2, #28]
	str	ip, [r2, #80]
	str	ip, [r2, #84]
	add	r2, r3, #168
.L7:
	str	r1, [r3, #4]
	str	lr, [r3]
	str	r1, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #48]
	str	r1, [r3, #52]
	add	r3, r3, #56
	cmp	r3, r2
	bne	.L7
	mov	r2, #165
	mov	r4, #10
	mov	r0, #16
	mov	r1, #0
	mov	lr, #4
	mov	ip, #1
	ldr	r3, .L12+104
.L8:
	str	r2, [r3, #4]
	add	r2, r2, #20
	cmp	r2, #225
	str	r4, [r3]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	lr, [r3, #44]
	str	ip, [r3, #48]
	add	r3, r3, #56
	bne	.L8
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	direction
	.word	bugsCaught
	.word	usingNet
	.word	netTimer
	.word	cheat
	.word	rockTimer
	.word	livesRemaining
	.word	cheatTimer
	.word	rand
	.word	-1240768329
	.word	bugTimer
	.word	rockTimerEnd
	.word	-222702007
	.word	hOff
	.word	bugTimerEnd
	.word	vOff
	.word	jumping
	.word	ground
	.word	bees
	.word	rocks
	.word	bugs
	.word	hearts
	.size	initGame, .-initGame
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	ldr	r3, [r3]
	push	{r4, r5, r6, lr}
	ldr	r5, .L27+4
	cmp	r3, #0
	ldr	r4, [r5, #32]
	beq	.L15
	add	r3, r4, r4, lsl #4
	ldr	r2, .L27+8
	add	r3, r3, r3, lsl #8
	ldr	r1, .L27+12
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r2, r1
	bcc	.L26
.L16:
	ldr	r3, .L27+16
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L17
	ldr	r2, .L27+20
	ldrh	r2, [r2]
	ands	r2, r2, #16
	streq	r2, [r5, #36]
.L17:
	tst	r3, #32
	beq	.L18
	ldr	r3, .L27+20
	ldrh	r3, [r3]
	tst	r3, #32
	moveq	r3, #1
	streq	r3, [r5, #36]
.L18:
	add	r4, r4, #1
	str	r4, [r5, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r3, .L27+24
	smull	r2, r3, r4, r3
	sub	r3, r3, r4, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r4, r3, lsl #1
	bne	.L16
.L26:
	ldr	r0, [r5, #40]
	ldr	r3, .L27+28
	ldr	r1, [r5, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #40]
	b	.L16
.L28:
	.align	2
.L27:
	.word	usingNet
	.word	player
	.word	143165576
	.word	286331153
	.word	oldButtons
	.word	buttons
	.word	715827883
	.word	__aeabi_idivmod
	.size	animatePlayer, .-animatePlayer
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
	ldr	r3, .L64
	ldr	r0, .L64+4
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #16]
	ldr	ip, [r0]
	add	r0, r1, r2
	cmp	ip, r0, asr #8
	movle	r0, #0
	ldrle	ip, .L64+8
	push	{r4, r5, lr}
	strle	r0, [ip]
	asrle	ip, r1, #8
	ldr	r1, .L64+12
	ldrh	r1, [r1]
	movle	r2, r0
	strgt	r0, [r3, #8]
	asrgt	ip, r0, #8
	tst	r1, #64
	beq	.L32
	ldr	r0, .L64+16
	ldrh	r0, [r0]
	tst	r0, #64
	beq	.L62
.L32:
	ldr	r0, .L64+20
	ldr	r0, [r0]
	cmp	r0, #3
	moveq	r0, #1
	add	r2, r2, #100
	str	r2, [r3, #16]
	ldreq	r2, .L64+24
	streq	r0, [r2]
	tst	r1, #32
	ldr	r2, [r3, #12]
	beq	.L34
	ldr	r0, .L64+16
	ldrh	r0, [r0]
	tst	r0, #32
	bne	.L34
	ldr	r0, [r3, #4]
	cmp	r0, #0
	ble	.L35
	mov	r4, #1
	ldr	lr, .L64+28
	ldr	r0, [r3, #20]
	ldrh	r5, [lr, #48]
	ldr	lr, .L64+32
	sub	r2, r2, r0
	tst	r5, #32
	str	r2, [r3, #12]
	str	r4, [lr]
	beq	.L36
.L37:
	tst	r1, #16
	beq	.L38
.L63:
	ldr	r0, .L64+16
	ldrh	r0, [r0]
	ands	r0, r0, #16
	bne	.L38
	ldr	lr, [r3, #4]
	cmp	lr, #210
	bgt	.L39
	ldr	lr, .L64+28
	ldr	r4, [r3, #20]
	ldrh	r5, [lr, #48]
	ldr	lr, .L64+32
	add	r2, r2, r4
	tst	r5, #16
	str	r2, [r3, #12]
	str	r0, [lr]
	beq	.L40
.L41:
	tst	r1, #2
	beq	.L42
	ldr	r1, .L64+16
	ldrh	r1, [r1]
	tst	r1, #2
	bne	.L42
	ldr	lr, .L64+36
	ldr	r0, .L64+24
	ldr	r1, [lr]
	ldr	r0, [r0]
	orrs	r1, r1, r0
	moveq	r0, #1
	streq	r1, [r3, #40]
	streq	r0, [lr]
.L42:
	ldr	r1, .L64+40
	ldr	r1, [r1]
	pop	{r4, r5, lr}
	sub	r1, ip, r1
	stm	r3, {r1, r2}
	b	animatePlayer
.L34:
	ldr	r0, .L64+28
	ldrh	r0, [r0, #48]
	tst	r0, #32
	bne	.L37
	ldr	r0, [r3, #4]
	cmp	r0, #0
	ble	.L37
	ldr	r0, [r3, #20]
	ldr	lr, .L64+32
.L36:
	mov	r4, #1
	sub	r2, r2, r0
	tst	r1, #16
	str	r2, [r3, #12]
	str	r4, [lr]
	bne	.L63
.L38:
	ldr	r0, .L64+28
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L41
	ldr	r0, [r3, #4]
	cmp	r0, #210
	bgt	.L41
	ldr	r4, [r3, #20]
	ldr	lr, .L64+32
.L40:
	mov	r0, #0
	add	r2, r2, r4
	str	r2, [r3, #12]
	str	r0, [lr]
	b	.L41
.L62:
	ldr	r0, .L64+8
	ldr	lr, [r0]
	cmp	lr, #0
	moveq	lr, #1
	subeq	r2, r2, #1488
	streq	lr, [r0]
	subeq	r2, r2, #12
	b	.L32
.L39:
	ldr	r0, .L64+28
	ldrh	r0, [r0, #48]
	b	.L41
.L35:
	ldr	r0, .L64+28
	ldrh	r0, [r0, #48]
	b	.L37
.L65:
	.align	2
.L64:
	.word	player
	.word	ground
	.word	jumping
	.word	oldButtons
	.word	buttons
	.word	bugsCaught
	.word	cheat
	.word	67109120
	.word	direction
	.word	usingNet
	.word	vOff
	.size	updatePlayer, .-updatePlayer
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
	@ link register save eliminated.
	ldr	r3, .L71
	ldr	r1, .L71+4
	ldr	r3, [r3]
	add	r2, r1, #36
	cmp	r3, #0
	ldm	r2, {r2, ip}
	ldm	r1, {r0, r3}
	bne	.L67
	ldr	r1, .L71+8
	ldr	r1, [r1]
	cmp	r1, #0
	lsl	r3, r3, #23
	lsl	ip, ip, #5
	addne	r2, r2, #4
	ldr	r1, .L71+12
	lsr	r3, r3, #23
	add	r2, r2, ip
	orr	r3, r3, #32768
	and	r0, r0, #255
	lsl	r2, r2, #2
	strh	r2, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	bx	lr
.L67:
	sub	r3, r3, #16
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	add	ip, ip, #3
	ldr	r1, .L71+12
	add	r2, r2, ip, lsl #4
	lsl	r2, r2, #3
	orr	r0, r0, #16384
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	bx	lr
.L72:
	.align	2
.L71:
	.word	usingNet
	.word	player
	.word	cheat
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBees
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBees, %function
initBees:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #32
	mov	lr, #95
	mov	r2, #0
	mov	ip, #25
	mov	r0, #2
	ldr	r3, .L75
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #44]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #40]
	ldr	lr, [sp], #4
	bx	lr
.L76:
	.align	2
.L75:
	.word	bees
	.size	initBees, .-initBees
	.align	2
	.global	updateBees
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBees, %function
updateBees:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L85
	ldr	r0, [r3, #28]
	ldr	r1, [r3, #24]
	ldm	r3, {r2, r3}
	sub	sp, sp, #20
	ldr	r4, .L85+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r5, .L85+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L78
	ldr	r3, .L85+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L84
.L78:
	ldr	r5, [r4, #32]
	tst	r5, #7
	bne	.L79
	ldr	r0, [r4, #40]
	ldr	r3, .L85+16
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L79:
	add	r5, r5, #1
	str	r5, [r4, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L84:
	ldr	r3, .L85+20
	mov	r2, r5
	ldr	r1, .L85+24
	ldr	r0, .L85+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+32
	str	r5, [r3]
	b	.L78
.L86:
	.align	2
.L85:
	.word	player
	.word	bees
	.word	collision
	.word	cheat
	.word	__aeabi_idivmod
	.word	playSoundB
	.word	16239
	.word	bugBite
	.word	livesRemaining
	.size	updateBees, .-updateBees
	.align	2
	.global	animateBees
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBees, %function
animateBees:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L90
	ldr	r4, [r5, #32]
	tst	r4, #7
	bne	.L88
	ldr	r0, [r5, #40]
	ldr	r3, .L90+4
	ldr	r1, [r5, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #40]
.L88:
	add	r4, r4, #1
	str	r4, [r5, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	bees
	.word	__aeabi_idivmod
	.size	animateBees, .-animateBees
	.align	2
	.global	drawBees
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBees, %function
drawBees:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L93
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r1, #40]
	ldr	r3, [r1, #36]
	add	r3, r3, r0, lsl #5
	ldr	r1, [r1]
	ldr	r0, .L93+4
	add	r3, r3, #10
	lsl	r3, r3, #2
	strh	r3, [r0, #12]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	strh	r2, [r0, #10]	@ movhi
	bx	lr
.L94:
	.align	2
.L93:
	.word	bees
	.word	shadowOAM
	.size	drawBees, .-drawBees
	.align	2
	.global	initRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRocks, %function
initRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #16
	mov	r0, #117
	ldr	r3, .L96
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	str	r2, [r3, #68]
	str	r2, [r3, #104]
	str	r2, [r3, #108]
	str	r0, [r3]
	str	r0, [r3, #56]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r1, [r3, #80]
	str	r1, [r3, #84]
	bx	lr
.L97:
	.align	2
.L96:
	.word	rocks
	.size	initRocks, .-initRocks
	.align	2
	.global	updateRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRocks, %function
updateRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #48]
	cmp	r3, #0
	sub	sp, sp, #16
	beq	.L99
	ldr	r2, [r0, #24]
	mov	r4, r0
	ldr	r0, [r0, #4]
	rsb	r3, r2, #0
	cmp	r0, r3
	movle	r3, #0
	ldr	r5, .L118
	add	ip, r5, #24
	strle	r3, [r4, #48]
	ldm	ip, {ip, lr}
	ldm	r5, {r1, r3}
	stmib	sp, {r1, ip, lr}
	str	r3, [sp]
	ldr	r6, .L118+4
	ldr	r3, [r4, #28]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L116
.L101:
	ldr	r2, .L118+8
	ldr	r3, [r4, #12]
	ldr	r2, [r2]
	sub	r3, r3, r2
	str	r3, [r4, #4]
.L99:
	ldr	r3, .L118+12
	ldr	r4, .L118+16
	ldr	r1, [r3]
	ldr	r2, [r4]
	cmp	r1, r2
	beq	.L117
.L98:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L116:
	ldr	r2, .L118+20
	ldr	r3, [r4, #52]
	ldr	r2, [r2]
	orrs	r6, r3, r2
	bne	.L101
	mov	r2, r6
	ldr	r1, .L118+24
	ldr	r3, .L118+28
	ldr	r0, .L118+32
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r0, .L118+36
	ldr	r3, [r0]
	ldr	r1, [r5, #12]
	sub	r3, r3, #1
	ldr	r2, .L118+40
	str	r3, [r0]
	rsb	r3, r3, r3, lsl #3
	sub	r1, r1, #35
	add	r3, r2, r3, lsl #3
	str	ip, [r4, #52]
	str	r1, [r5, #12]
	str	r6, [r3, #48]
	b	.L101
.L117:
	mov	r1, #0
	ldr	r2, .L118+44
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	ldr	r2, .L118+48
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	ldr	r2, .L118+52
	add	r3, r3, r3, lsl #1
	ldr	r1, [r2, #48]
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #10
	cmp	r1, #0
	str	r0, [r4]
	beq	.L104
	ldr	r3, [r2, #104]
	cmp	r3, #0
	bne	.L98
	mov	r1, #1
.L104:
	mov	ip, #1
	mov	r0, #0
	ldr	r3, .L118+8
	ldr	r3, [r3]
	rsb	r1, r1, r1, lsl #3
	add	r2, r2, r1, lsl #3
	add	r3, r3, #240
	str	ip, [r2, #48]
	str	r0, [r2, #52]
	str	r3, [r2, #12]
	str	r3, [r2, #4]
	b	.L98
.L119:
	.align	2
.L118:
	.word	player
	.word	collision
	.word	hOff
	.word	rockTimer
	.word	rockTimerEnd
	.word	cheat
	.word	3729
	.word	playSoundB
	.word	rockHit
	.word	livesRemaining
	.word	hearts
	.word	rand
	.word	-1240768329
	.word	rocks
	.size	updateRocks, .-updateRocks
	.align	2
	.global	generateRock
	.syntax unified
	.arm
	.fpu softvfp
	.type	generateRock, %function
generateRock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L126
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L121
	ldr	r2, [r3, #104]
	cmp	r2, #0
	bxne	lr
	mov	r2, #1
.L121:
	mov	ip, #1
	mov	r0, #0
	ldr	r1, .L126+4
	ldr	r1, [r1]
	rsb	r2, r2, r2, lsl #3
	add	r3, r3, r2, lsl #3
	add	r2, r1, #240
	str	ip, [r3, #48]
	str	r0, [r3, #52]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	bx	lr
.L127:
	.align	2
.L126:
	.word	rocks
	.word	hOff
	.size	generateRock, .-generateRock
	.align	2
	.global	drawRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRocks, %function
drawRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L134
	ldr	r2, [r3, #48]
	cmp	r2, #0
	bne	.L129
	mov	r1, #512
	ldr	r2, .L134+4
	strh	r1, [r2, #16]	@ movhi
	ldr	r1, [r3, #104]
	cmp	r1, #0
	bne	.L131
.L133:
	mov	r3, #512
	strh	r3, [r2, #24]	@ movhi
	bx	lr
.L129:
	mov	r0, #78
	ldr	r1, [r3, #4]
	lsl	r1, r1, #23
	ldr	r2, .L134+4
	lsr	r1, r1, #23
	orr	r1, r1, #16384
	strh	r1, [r2, #18]	@ movhi
	ldr	r1, [r3, #104]
	ldrb	ip, [r3]	@ zero_extendqisi2
	cmp	r1, #0
	strh	ip, [r2, #16]	@ movhi
	strh	r0, [r2, #20]	@ movhi
	beq	.L133
.L131:
	mov	r0, #78
	ldr	r1, [r3, #60]
	lsl	r1, r1, #23
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	lsr	r1, r1, #23
	orr	r1, r1, #16384
	strh	r1, [r2, #26]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	strh	r0, [r2, #28]	@ movhi
	bx	lr
.L135:
	.align	2
.L134:
	.word	rocks
	.word	shadowOAM
	.size	drawRocks, .-drawRocks
	.align	2
	.global	initBugs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBugs, %function
initBugs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #116
	mov	r1, #16
	ldr	r3, .L140
	add	r0, r3, #168
.L137:
	str	r2, [r3, #4]
	str	ip, [r3]
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L137
	bx	lr
.L141:
	.align	2
.L140:
	.word	bugs
	.size	initBugs, .-initBugs
	.align	2
	.global	updateBugs
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBugs, %function
updateBugs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r0, #48]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L143
	ldr	r2, [r0, #24]
	mov	r4, r0
	ldr	r0, [r0, #4]
	rsb	r3, r2, #0
	cmp	r0, r3
	movle	r3, #0
	ldr	r5, .L168
	add	ip, r5, #24
	strle	r3, [r4, #48]
	ldm	ip, {ip, lr}
	ldm	r5, {r1, r3}
	stmib	sp, {r1, ip, lr}
	str	r3, [sp]
	ldr	r7, .L168+4
	ldr	r3, [r4, #28]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L145
	ldr	r2, .L168+8
	ldr	r3, .L168+12
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	r6, [r4, #52]
	orr	r2, r2, r3
	orrs	r6, r2, r6
	beq	.L165
.L145:
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L146
	ldr	r3, .L168+8
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L166
.L146:
	ldr	r2, .L168+16
	ldr	r3, [r4, #12]
	ldr	r2, [r2]
	sub	r3, r3, r2
	str	r3, [r4, #4]
.L143:
	ldr	r3, .L168+20
	ldr	r4, .L168+24
	ldr	r1, [r3]
	ldr	r2, [r4]
	cmp	r1, r2
	beq	.L167
.L142:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L167:
	mov	r1, #0
	ldr	r2, .L168+28
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	ldr	r2, .L168+32
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #8
	ldr	r2, .L168+36
	add	r3, r3, r3, lsl #3
	ldr	r1, [r2, #48]
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #20
	cmp	r1, #0
	str	r0, [r4]
	beq	.L149
	ldr	r3, [r2, #104]
	cmp	r3, #0
	beq	.L151
	ldr	r3, [r2, #160]
	cmp	r3, #0
	moveq	r1, #2
	bne	.L142
.L149:
	mov	ip, #1
	mov	r0, #0
	ldr	r3, .L168+16
	ldr	r3, [r3]
	rsb	r1, r1, r1, lsl #3
	add	r2, r2, r1, lsl #3
	add	r3, r3, #240
	str	ip, [r2, #48]
	str	r0, [r2, #52]
	str	r3, [r2, #12]
	str	r3, [r2, #4]
	b	.L142
.L166:
	ldr	r1, .L168+12
	ldr	r2, [r4, #52]
	ldr	r1, [r1]
	orrs	r2, r2, r1
	bne	.L146
	ldr	r0, .L168+40
	ldr	r1, [r0]
	add	r1, r1, #1
	str	r2, [r4, #48]
	str	r3, [r4, #52]
	str	r1, [r0]
	b	.L146
.L165:
	mov	r2, r6
	ldr	r1, .L168+44
	ldr	r3, .L168+48
	ldr	r0, .L168+52
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r0, .L168+56
	ldr	r3, [r0]
	ldr	r1, [r5, #12]
	sub	r3, r3, #1
	ldr	r2, .L168+60
	str	r3, [r0]
	rsb	r3, r3, r3, lsl #3
	sub	r1, r1, #30
	add	r3, r2, r3, lsl #3
	str	ip, [r4, #52]
	str	r1, [r5, #12]
	str	r6, [r3, #48]
	b	.L146
.L151:
	mov	r1, #1
	b	.L149
.L169:
	.align	2
.L168:
	.word	player
	.word	collision
	.word	usingNet
	.word	cheat
	.word	hOff
	.word	bugTimer
	.word	bugTimerEnd
	.word	rand
	.word	-222702007
	.word	bugs
	.word	bugsCaught
	.word	3729
	.word	playSoundB
	.word	rockHit
	.word	livesRemaining
	.word	hearts
	.size	updateBugs, .-updateBugs
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, .L188
	ldr	r1, .L188+4
	ldr	ip, [lr]
	ldr	r0, .L188+8
	ldr	r3, [r1]
	ldr	r2, [r0]
	cmp	ip, #0
	ldr	ip, .L188+12
	ldr	r7, .L188+16
	add	r3, r3, #1
	str	r3, [r1]
	add	r2, r2, #1
	ldr	r3, [ip]
	ldr	r1, .L188+20
	str	r2, [r0]
	ldr	r2, [r7]
	addne	r3, r3, #1
	strne	r3, [ip]
	cmp	r2, #1
	ldr	r2, [r1]
	addeq	r2, r2, #1
	streq	r2, [r1]
	cmp	r3, #33
	moveq	r3, #0
	streq	r3, [lr]
	streq	r3, [ip]
	cmp	r2, #600
	moveq	r3, #0
	ldreq	r2, .L188+24
	streq	r3, [r7]
	streq	r3, [r1]
	streq	r3, [r2]
	bl	updatePlayer
	bl	updateBees
	ldr	r0, .L188+28
	bl	updateRocks
	ldr	r0, .L188+32
	bl	updateRocks
	ldr	r0, .L188+36
	bl	updateBugs
	ldr	r0, .L188+40
	bl	updateBugs
	ldr	r0, .L188+44
	bl	updateBugs
	ldr	r4, .L188+48
	ldr	r9, .L188+52
	ldr	r8, .L188+56
	ldr	r10, .L188+60
	add	r6, r4, #168
.L177:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L175
	ldr	r5, [r4, #32]
	add	r3, r5, r5, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r9, r3
	cmp	r3, r8
	bcs	.L176
	add	r0, r4, #40
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r10
	str	r1, [r4, #40]
.L176:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L175:
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L177
	ldr	r3, [r7]
	ldr	r2, .L188+64
	cmp	r3, #0
	ldr	r3, [r2]
	addeq	r3, r3, #2
	addne	r3, r3, #6
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L189:
	.align	2
.L188:
	.word	usingNet
	.word	bugTimer
	.word	rockTimer
	.word	netTimer
	.word	cheat
	.word	cheatTimer
	.word	bugsCaught
	.word	rocks
	.word	rocks+56
	.word	bugs
	.word	bugs+56
	.word	bugs+112
	.word	hearts
	.word	143165576
	.word	286331153
	.word	__aeabi_idivmod
	.word	hOff
	.size	updateGame, .-updateGame
	.align	2
	.global	generateBug
	.syntax unified
	.arm
	.fpu softvfp
	.type	generateBug, %function
generateBug:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L198
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L191
	ldr	r2, [r3, #104]
	cmp	r2, #0
	beq	.L193
	ldr	r2, [r3, #160]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L191:
	mov	ip, #1
	mov	r0, #0
	ldr	r1, .L198+4
	ldr	r1, [r1]
	rsb	r2, r2, r2, lsl #3
	add	r3, r3, r2, lsl #3
	add	r2, r1, #240
	str	ip, [r3, #48]
	str	r0, [r3, #52]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	bx	lr
.L193:
	mov	r2, #1
	b	.L191
.L199:
	.align	2
.L198:
	.word	bugs
	.word	hOff
	.size	generateBug, .-generateBug
	.align	2
	.global	drawBugs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBugs, %function
drawBugs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	mov	r4, #14
	ldr	r3, .L206
	ldr	r2, .L206+4
	ldr	lr, .L206+8
	add	r0, r3, #24
.L203:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	ldrne	r1, [r2, #4]
	ldrbne	ip, [r2]	@ zero_extendqisi2
	andne	r1, r1, lr
	orrne	r1, r1, #16384
	strhne	r4, [r3, #60]	@ movhi
	strhne	r1, [r3, #58]	@ movhi
	strhne	ip, [r3, #56]	@ movhi
	strheq	r5, [r3, #56]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #56
	bne	.L203
	pop	{r4, r5, lr}
	bx	lr
.L207:
	.align	2
.L206:
	.word	shadowOAM
	.word	bugs
	.word	511
	.size	drawBugs, .-drawBugs
	.align	2
	.global	initHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHearts, %function
initHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #165
	mov	r4, #10
	mov	r0, #16
	mov	r1, #0
	mov	lr, #4
	mov	ip, #1
	ldr	r3, .L212
.L209:
	str	r2, [r3, #4]
	add	r2, r2, #20
	cmp	r2, #225
	str	r4, [r3]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	lr, [r3, #44]
	str	ip, [r3, #48]
	add	r3, r3, #56
	bne	.L209
	pop	{r4, lr}
	bx	lr
.L213:
	.align	2
.L212:
	.word	hearts
	.size	initHearts, .-initHearts
	.align	2
	.global	updateHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHearts, %function
updateHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	ldr	r5, [r0, #32]
	add	r3, r5, r5, lsl #4
	ldr	r2, .L224
	add	r3, r3, r3, lsl #8
	ldr	r1, .L224+4
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r2, r1
	mov	r4, r0
	bcs	.L216
	ldr	r0, [r0, #40]
	ldr	r3, .L224+8
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L216:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L225:
	.align	2
.L224:
	.word	143165576
	.word	286331153
	.word	__aeabi_idivmod
	.size	updateHearts, .-updateHearts
	.align	2
	.global	drawHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHearts, %function
drawHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #512
	ldr	r3, .L232
	ldr	r2, .L232+4
	add	ip, r3, #168
.L229:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r4, [r2, #32]	@ movhi
	beq	.L228
	add	r1, r3, #36
	ldm	r1, {r1, lr}
	ldr	r0, [r3, #4]
	add	r1, r1, #6
	add	r1, r1, lr, lsl #5
	ldr	lr, [r3]
	lsl	r1, r1, #1
	orr	r0, r0, #16384
	strh	r1, [r2, #36]	@ movhi
	strh	r0, [r2, #34]	@ movhi
	strh	lr, [r2, #32]	@ movhi
.L228:
	add	r3, r3, #56
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L229
	pop	{r4, lr}
	bx	lr
.L233:
	.align	2
.L232:
	.word	hearts
	.word	shadowOAM
	.size	drawHearts, .-drawHearts
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
	push	{r4, lr}
	bl	drawPlayer
	ldr	r1, .L236
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r1, #40]
	ldr	r3, [r1, #36]
	add	r3, r3, r0, lsl #5
	ldr	r1, [r1]
	ldr	r0, .L236+4
	add	r3, r3, #10
	lsl	r3, r3, #2
	strh	r3, [r0, #12]	@ movhi
	strh	r2, [r0, #10]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	bl	drawRocks
	bl	drawBugs
	bl	drawHearts
	mov	r3, #67108864
	ldr	r2, .L236+8
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L237:
	.align	2
.L236:
	.word	bees
	.word	shadowOAM
	.word	hOff
	.size	drawGame, .-drawGame
	.comm	direction,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	shadowOAM,1024,4
	.comm	hearts,168,4
	.comm	bugTimerEnd,4,4
	.comm	bugTimer,4,4
	.comm	bugs,168,4
	.comm	rockTimerEnd,4,4
	.comm	rockTimer,4,4
	.comm	rocks,112,4
	.comm	bees,56,4
	.comm	jumping,4,4
	.comm	ground,4,4
	.comm	cheatTimer,4,4
	.comm	cheat,4,4
	.comm	bugsCaught,4,4
	.comm	netTimer,4,4
	.comm	usingNet,4,4
	.comm	livesRemaining,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
