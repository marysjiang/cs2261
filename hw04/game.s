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
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #4]
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #0
	ble	.L2
	ldr	r3, [r0]
	cmp	r3, #0
	ble	.L2
	ldr	r1, [r0, #8]
	add	r1, r3, r1
	cmp	r1, #240
	bgt	.L2
	add	r1, r0, #16
	ldm	r1, {r1, ip}
	add	r2, ip, r2
	add	r3, r1, r3
	str	r2, [r0, #4]
	str	r3, [r0]
	bx	lr
.L2:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAsteroid.part.0, %function
updateAsteroid.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	lr, [r0]
	cmp	lr, #1
	mov	r5, r0
	ldr	r2, [r0, #8]
	sub	sp, sp, #20
	ldr	r0, [r0, #16]
	ble	.L6
	add	r3, lr, r2
	cmp	r3, #241
	bgt	.L6
.L7:
	ldr	ip, [r5, #4]
	cmp	ip, #1
	ldr	r3, [r5, #12]
	ldr	r1, [r5, #20]
	ble	.L8
	add	r4, ip, r3
	cmp	r4, #161
	bgt	.L8
.L9:
	mov	r9, #0
	add	r0, lr, r0
	add	r1, ip, r1
	ldr	r4, .L24
	stm	r5, {r0, r1}
	ldr	r7, .L24+4
	ldr	r8, .L24+8
	add	r6, r4, #160
.L12:
	ldr	ip, [r4, #24]
	cmp	ip, #0
	bne	.L23
.L10:
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L12
	ldr	ip, .L24+12
	add	r4, ip, #8
	ldm	r4, {r4, lr}
	str	lr, [sp, #12]
	ldm	ip, {ip, lr}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	mvnne	r2, #0
	ldrne	r3, .L24+16
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L8:
	rsb	r1, r1, #0
	str	r1, [r5, #20]
	b	.L9
.L6:
	rsb	r0, r0, #0
	str	r0, [r5, #16]
	b	.L7
.L23:
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r8]
	strne	r9, [r5, #24]
	strne	r9, [r4, #24]
	subne	r3, r3, #1
	strne	r3, [r8]
	ldm	r5, {r0, r1, r2, r3}
	b	.L10
.L25:
	.align	2
.L24:
	.word	bullets
	.word	collision
	.word	asteroidsRemaining
	.word	player
	.word	gameState
	.size	updateAsteroid.part.0, .-updateAsteroid.part.0
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
	str	lr, [sp, #-4]!
	mov	r1, #12
	mov	lr, #100
	mov	r2, #1
	mov	ip, #130
	mov	r0, #15
	ldr	r3, .L28
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	player
	.size	initPlayer, .-initPlayer
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
	push	{r4, lr}
	ldr	ip, .L32
	ldr	r0, .L32+4
	sub	sp, sp, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L32+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	shipBitmap
	.word	player
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, r5, r6, r7, lr}
	mov	r0, #250
	ldr	r3, .L50
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	mov	r7, #254
	bl	drawPlayer
	ldr	r4, .L50+4
	ldr	r6, .L50+8
	add	r5, r4, #160
.L36:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L48
.L35:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L36
	ldr	r4, .L50+12
	mov	r7, #254
	ldr	r6, .L50+8
	add	r5, r4, #280
	b	.L38
.L37:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L49
.L38:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L37
	str	r7, [sp]
	ldm	r4, {r0, r1, r2, r3}
	add	r4, r4, #28
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L38
.L49:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L48:
	str	r7, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	b	.L35
.L51:
	.align	2
.L50:
	.word	fillScreen4
	.word	bullets
	.word	drawRect4
	.word	asteroids
	.size	drawGame, .-drawGame
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #1
	mov	r5, #3
	mvn	r4, #1
	mov	lr, #254
	ldr	r1, .L56
	ldr	r3, .L56+4
	ldr	ip, [r1]
	ldr	r0, [r1, #4]
	add	r1, r3, #160
.L53:
	str	ip, [r3]
	str	r5, [r3, #12]
	str	r2, [r3, #16]
	str	r4, [r3, #20]
	str	r2, [r3, #24]
	strh	lr, [r3, #28]	@ movhi
	stmib	r3, {r0, r6}
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L53
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r1, .L69
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	beq	.L68
.L59:
	add	r3, r3, #1
	cmp	r3, #5
	bxeq	lr
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	bne	.L59
.L68:
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	ip, .L69+4
	ldr	r1, [ip, #8]
	ldr	lr, .L69+8
	add	r0, r1, r1, lsr #31
	ldm	ip, {r1, r5}
	add	r2, lr, r2
	add	r1, r1, r0, asr r4
	ldr	r0, [r2, #8]
	add	r0, r0, r0, lsr #31
	sub	r1, r1, r0, asr r4
	str	r5, [r2, #4]
	str	r4, [r2, #24]
	str	r1, [lr, r3, lsl #5]
	pop	{r4, r5, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	bullets+24
	.word	player
	.word	bullets
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L108
	ldrh	r3, [r3]
	tst	r3, #16
	push	{r4, lr}
	bne	.L100
	ldr	r4, .L108+4
.L72:
	ldr	r2, .L108+8
	ldrh	r2, [r2, #48]
	tst	r2, #16
	beq	.L105
.L74:
	tst	r3, #32
	beq	.L75
	ldr	r2, .L108+12
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L75
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L76
	ldr	r1, [r4, #16]
	sub	r2, r2, r1
	str	r2, [r4]
.L75:
	ldr	r2, .L108+8
	ldrh	r2, [r2, #48]
	tst	r2, #32
	beq	.L106
.L77:
	tst	r3, #64
	beq	.L78
	ldr	r2, .L108+12
	ldrh	r2, [r2]
	tst	r2, #64
	ldreq	r2, [r4, #4]
	ldreq	r1, [r4, #20]
	subeq	r2, r2, r1
	streq	r2, [r4, #4]
.L78:
	ldr	r2, .L108+8
	ldrh	r2, [r2, #48]
	tst	r2, #64
	ldreq	r2, [r4, #4]
	ldreq	r1, [r4, #20]
	subeq	r2, r2, r1
	streq	r2, [r4, #4]
	tst	r3, #128
	beq	.L80
	ldr	r2, .L108+12
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L80
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	add	r2, r1, r2
	cmp	r2, #160
	bgt	.L81
	ldr	r2, [r4, #20]
	add	r1, r2, r1
	str	r1, [r4, #4]
.L80:
	ldr	r2, .L108+8
	ldrh	r2, [r2, #48]
	tst	r2, #128
	beq	.L107
.L82:
	tst	r3, #1
	ldr	r3, [r4, #24]
	beq	.L104
	ldr	r2, .L108+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L85
.L104:
	add	r3, r3, #1
.L84:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L87
	ldr	r2, .L108+16
	ldr	r2, [r2]
	cmp	r2, #0
	moveq	r1, #1
	ldreq	r2, .L108+20
	streq	r1, [r2]
.L87:
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L106:
	ldr	r2, [r4]
	cmp	r2, #0
	ldrgt	r1, [r4, #16]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L77
.L107:
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	add	r2, r1, r2
	cmp	r2, #160
	ldrle	r2, [r4, #20]
	addle	r1, r2, r1
	strle	r1, [r4, #4]
	b	.L82
.L105:
	ldr	r1, [r4]
	ldr	r2, [r4, #8]
	add	r2, r1, r2
	cmp	r2, #240
	ldrle	r2, [r4, #16]
	addle	r1, r2, r1
	strle	r1, [r4]
	b	.L74
.L85:
	cmp	r3, #14
	ble	.L104
	bl	fireBullet
	mov	r3, #1
	b	.L84
.L100:
	ldr	r2, .L108+12
	ldrh	r2, [r2]
	tst	r2, #16
	ldr	r4, .L108+4
	bne	.L72
	ldr	r1, [r4]
	ldr	r2, [r4, #8]
	add	r2, r1, r2
	cmp	r2, #240
	ldrle	r2, [r4, #16]
	addle	r1, r2, r1
	strle	r1, [r4]
	ble	.L72
.L73:
	ldr	r2, .L108+8
	ldrh	r2, [r2, #48]
	b	.L74
.L81:
	ldr	r2, .L108+8
	ldrh	r2, [r2, #48]
	b	.L82
.L76:
	ldr	r2, .L108+8
	ldrh	r2, [r2, #48]
	b	.L77
.L109:
	.align	2
.L108:
	.word	oldButtons
	.word	player
	.word	67109120
	.word	buttons
	.word	asteroidsRemaining
	.word	gameState
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r0, .L124
	add	r4, r0, #160
.L112:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	blne	updateBullet.part.0
.L111:
	add	r0, r0, #32
	cmp	r0, r4
	bne	.L112
	ldr	r4, .L124+4
	add	r5, r4, #280
.L114:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateAsteroid.part.0
.L113:
	add	r4, r4, #28
	cmp	r5, r4
	bne	.L114
	pop	{r4, r5, r6, lr}
	bx	lr
.L125:
	.align	2
.L124:
	.word	bullets
	.word	asteroids
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	mov	r2, #254
	push	{r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	str	r2, [sp]
	ldr	r4, .L137
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	drawRect4
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initAsteroids
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAsteroids, %function
initAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #12
	mov	r8, #1
	ldr	r4, .L143
	ldr	r6, .L143+4
	ldr	r5, .L143+8
	add	r7, r4, #280
.L140:
	mov	lr, pc
	bx	r6
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #2
	str	r0, [r4]
	mov	lr, pc
	bx	r6
	mov	r2, #2
	smull	r3, r1, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr r2
	rsb	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #4
	str	r9, [r4, #8]
	str	r9, [r4, #12]
	str	r8, [r4, #16]
	str	r8, [r4, #24]
	str	r0, [r4, #4]
	str	r2, [r4, #20]
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L140
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	asteroids
	.word	rand
	.word	156180629
	.size	initAsteroids, .-initAsteroids
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #1
	mov	r9, #100
	mov	r8, #130
	mov	r3, #12
	mov	r10, #15
	mov	r6, r9
	mov	r5, r8
	mov	lr, r7
	mov	ip, #3
	mov	r4, #0
	mvn	r0, #1
	mov	r1, #254
	ldr	r2, .L149
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	ldr	r3, .L149+4
	str	r9, [r2]
	str	r10, [r2, #24]
	str	r8, [r2, #4]
	str	r7, [r2, #16]
	str	r7, [r2, #20]
	add	r2, r3, #160
.L146:
	str	r6, [r3]
	str	ip, [r3, #12]
	str	r4, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r3, #24]
	strh	r1, [r3, #28]	@ movhi
	stmib	r3, {r5, lr}
	add	r3, r3, #32
	cmp	r3, r2
	bne	.L146
	bl	initAsteroids
	mov	lr, #10
	ldr	r0, .L149+8
	ldr	ip, .L149+12
	str	lr, [r0]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L149+16
	ldr	r5, .L149+20
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L149+24
	ldr	r2, .L149+28
	strh	lr, [r3, #246]	@ movhi
	strh	r4, [r3, #244]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	player
	.word	bullets
	.word	asteroidsRemaining
	.word	gameState
	.word	shipPal
	.word	DMANow
	.word	83886336
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	updateAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAsteroid, %function
updateAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateAsteroid.part.0
	.size	updateAsteroid, .-updateAsteroid
	.align	2
	.global	drawAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAsteroid, %function
drawAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	mov	r2, #254
	push	{r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	str	r2, [sp]
	ldr	r4, .L162
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L163:
	.align	2
.L162:
	.word	drawRect4
	.size	drawAsteroid, .-drawAsteroid
	.comm	gameState,4,4
	.comm	asteroidsRemaining,4,4
	.comm	asteroids,280,4
	.comm	bullets,160,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
