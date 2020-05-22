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
	.global	__aeabi_idivmod
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateOranges.part.0, %function
updateOranges.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	push	{r4, r5, r6, lr}
	add	r3, r3, r3, lsl #4
	ldr	r2, .L18
	add	r3, r3, r3, lsl #8
	ldr	r1, .L18+4
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r2, r1
	mov	r4, r0
	sub	sp, sp, #16
	bcs	.L2
	ldr	r0, [r0, #40]
	ldr	r3, .L18+8
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L2:
	ldr	r5, .L18+12
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	ldr	r2, [r5]
	ldr	r3, [r5, #8]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #8]
	ldr	r6, .L18+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L8
	mov	r1, #0
	mov	r0, #1
	mov	r3, r1
	mov	r2, r5
	str	r1, [r4, #48]
	str	r0, [r4, #52]
	b	.L6
.L4:
	add	r3, r3, #1
	cmp	r3, #26
	add	r2, r2, #56
	beq	.L5
.L6:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L4
	mov	r0, #1
	ldr	r1, .L18+20
	ldr	r2, [r1]
	rsb	r3, r3, r3, lsl #3
	add	r3, r5, r3, lsl #3
	add	r2, r2, r0
	str	r0, [r3, #48]
	str	r2, [r1]
.L5:
	ldr	r0, .L18+24
	mov	r2, #0
	mov	r3, r0
.L9:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L7
	ldr	r1, [r3, #52]
	cmp	r1, #0
	beq	.L17
.L7:
	add	r2, r2, #1
	cmp	r2, #24
	add	r3, r3, #56
	bne	.L9
.L8:
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	str	r3, [r4, #32]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	mov	r3, #1
	rsb	r2, r2, r2, lsl #3
	add	r2, r0, r2, lsl #3
	str	r3, [r2, #48]
	b	.L8
.L19:
	.align	2
.L18:
	.word	143165576
	.word	286331153
	.word	__aeabi_idivmod
	.word	snake
	.word	collision
	.word	snakeLength
	.word	oranges
	.size	updateOranges.part.0, .-updateOranges.part.0
	.align	2
	.global	initSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSnake, %function
initSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L24
	mov	lr, #2
	mov	r3, r5
	mov	r0, #72
	mov	ip, #112
	mov	r1, #16
	mov	r2, #0
	ldr	r6, .L24+4
	mov	r4, lr
	str	lr, [r6]
	add	lr, r5, #1456
.L21:
	str	r0, [r3]
	stmib	r3, {r0, ip}
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #40]
	str	r4, [r3, #44]
	str	r2, [r3, #36]
	str	r2, [r3, #48]
	add	r3, r3, #56
	cmp	r3, lr
	add	r0, r0, #32
	bne	.L21
	mov	r3, #1
	str	r3, [r5, #48]
	str	r3, [r5, #104]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	snake
	.word	snakeLength
	.size	initSnake, .-initSnake
	.align	2
	.global	growSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	growSnake, %function
growSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L31
	mov	r3, #0
	mov	r2, r0
	b	.L29
.L27:
	add	r3, r3, #1
	cmp	r3, #26
	add	r2, r2, #56
	bxeq	lr
.L29:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L27
	mov	ip, #1
	ldr	r1, .L31+4
	ldr	r2, [r1]
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #3
	add	r2, r2, ip
	str	ip, [r3, #48]
	str	r2, [r1]
	bx	lr
.L32:
	.align	2
.L31:
	.word	snake
	.word	snakeLength
	.size	growSnake, .-growSnake
	.align	2
	.global	animateSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateSnake, %function
animateSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L65
	ldr	r2, .L65+4
	ldr	r3, .L65+8
	ldr	r7, [r6, #32]
	mla	r3, r7, r3, r2
	ldr	r2, .L65+12
	cmp	r3, r2
	bhi	.L34
	ldr	r0, [r6, #40]
	ldr	r3, .L65+16
	ldr	r1, [r6, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r6, #40]
.L34:
	mov	r3, #0
	ldr	r0, .L65+20
	ldr	ip, .L65+24
	ldrh	r0, [r0]
	ldrh	ip, [ip]
	ldr	r1, .L65+28
	and	r5, r0, #64
	ldr	r8, [r1]
	and	r4, r0, #128
	and	lr, r0, #16
	and	fp, ip, #64
	and	r10, ip, #128
	and	r9, ip, #16
	mov	r2, r3
	ldr	r1, [r6, #36]
	and	r0, r0, #32
	and	ip, ip, #32
	b	.L41
.L35:
	cmp	r3, #25
	beq	.L40
.L43:
	add	r3, r3, #1
.L41:
	cmp	r3, #0
	bne	.L35
	cmp	r5, #0
	beq	.L36
	cmp	fp, #0
	bne	.L36
	cmp	r8, #1
	movne	r2, #1
	movne	r1, #0
.L36:
	cmp	r4, #0
	beq	.L37
	cmp	r10, #0
	bne	.L37
	cmp	r8, #0
	movne	r2, #1
	movne	r1, r2
.L37:
	cmp	lr, #0
	beq	.L38
	cmp	r9, #0
	bne	.L38
	cmp	r8, #3
	movne	r2, #1
	movne	r1, #2
.L38:
	cmp	r0, #0
	beq	.L43
	cmp	ip, #0
	bne	.L43
	cmp	r8, #2
	movne	r2, #1
	movne	r1, #3
	b	.L43
.L40:
	add	r7, r7, #1
	cmp	r2, #0
	strne	r1, [r6, #36]
	str	r7, [r6, #32]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	snake
	.word	85899345
	.word	-1030792151
	.word	171798690
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	buttons
	.word	direction
	.size	animateSnake, .-animateSnake
	.align	2
	.global	updateSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSnake, %function
updateSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L128
	ldrh	r3, [r3]
	tst	r3, #64
	sub	sp, sp, #20
	beq	.L68
	ldr	r2, .L128+4
	ldrh	r2, [r2]
	ands	r2, r2, #64
	beq	.L122
.L68:
	tst	r3, #128
	beq	.L69
	ldr	r2, .L128+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L123
.L69:
	tst	r3, #16
	beq	.L70
	ldr	r2, .L128+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L124
.L70:
	tst	r3, #32
	beq	.L71
	ldr	r3, .L128+4
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L125
.L71:
	ldr	r6, .L128+8
	ldr	r3, [r6]
	cmp	r3, #10
	beq	.L126
.L72:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	animateSnake
.L125:
	ldr	r3, .L128+12
	ldr	r2, [r3]
	cmp	r2, #2
	movne	r2, #3
	ldr	r6, .L128+8
	strne	r2, [r3]
	ldr	r3, [r6]
	cmp	r3, #10
	bne	.L72
.L126:
	ldr	r1, .L128+16
	ldr	r0, .L128+12
	mov	r4, r1
	mov	r2, #1
	mov	r5, r1
	mov	r3, r1
	ldr	r7, [r1, #20]
	ldr	lr, [r1, #16]
	ldr	ip, [r0]
	b	.L82
.L73:
	ldr	r0, [r3, #-52]
	ldr	r1, [r3, #-44]
	cmp	r2, #26
	str	r0, [r3]
	str	r1, [r3, #8]
	beq	.L81
.L88:
	add	r3, r3, #56
	add	r2, r2, #1
.L82:
	ldr	r0, [r3]
	ldr	r1, [r3, #8]
	cmp	r2, #1
	str	r0, [r3, #4]
	str	r1, [r3, #12]
	bne	.L73
	cmp	ip, #3
	ldrls	pc, [pc, ip, asl #2]
	b	.L88
.L76:
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L75
.L124:
	ldr	r2, .L128+12
	ldr	r1, [r2]
	cmp	r1, #3
	movne	r1, #2
	strne	r1, [r2]
	b	.L70
.L123:
	ldr	r2, .L128+12
	ldr	r1, [r2]
	cmp	r1, #0
	movne	r1, #1
	strne	r1, [r2]
	b	.L69
.L122:
	ldr	r1, .L128+12
	ldr	r0, [r1]
	cmp	r0, #1
	strne	r2, [r1]
	b	.L68
.L75:
	sub	r1, r1, r7
	str	r1, [r5, #8]
	b	.L88
.L77:
	add	r1, r1, r7
	str	r1, [r5, #8]
	b	.L88
.L78:
	add	r0, r0, lr
	str	r0, [r5]
	b	.L88
.L79:
	sub	r0, r0, lr
	str	r0, [r5]
	b	.L88
.L81:
	ldr	r1, [r5]
	cmp	r1, #0
	ble	.L121
	ldr	r3, [r5, #28]
	add	r3, r1, r3
	cmp	r3, #161
	ble	.L118
.L121:
	ldr	r8, .L128+20
.L83:
	mov	r3, #0
	str	r3, [r8]
.L85:
	mov	r3, #0
	str	r3, [r6]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	animateSnake
.L118:
	ldr	r0, [r5, #8]
	cmn	r0, #2
	blt	.L121
	ldr	r3, [r5, #24]
	add	r3, r0, r3
	cmp	r3, #241
	ldr	r8, .L128+20
	bgt	.L83
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L85
	mov	r7, #1
	ldr	r9, .L128+24
	b	.L87
.L127:
	ldr	r3, [r8]
	cmp	r3, r7
	add	r4, r4, #56
	blt	.L85
	ldr	r0, [r5, #8]
	ldr	r1, [r5]
.L87:
	add	ip, r4, #80
	ldr	r2, [r4, #56]
	ldm	ip, {ip, lr}
	ldr	r3, [r4, #64]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	add	r7, r7, #1
	bne	.L83
	b	.L127
.L129:
	.align	2
.L128:
	.word	oldButtons
	.word	buttons
	.word	timer
	.word	direction
	.word	snake
	.word	snakeLength
	.word	collision
	.size	updateSnake, .-updateSnake
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
	bl	updateSnake
	ldr	r4, .L138
	add	r5, r4, #1344
.L132:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	movne	r0, r4
	blne	updateOranges.part.0
.L131:
	add	r4, r4, #56
	cmp	r4, r5
	bne	.L132
	ldr	r2, .L138+4
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L139:
	.align	2
.L138:
	.word	oranges
	.word	timer
	.size	updateGame, .-updateGame
	.align	2
	.global	drawSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSnake, %function
drawSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L148
	push	{r4, r5, r6, r7, r8, lr}
	add	r5, r1, #36
	ldm	r5, {r5, ip}
	ldr	lr, .L148+4
	ldrh	r7, [r1, #8]
	add	r5, r5, ip, lsl #5
	lsl	r5, r5, #17
	mov	r3, r1
	mov	r2, lr
	mov	r0, #0
	mov	r4, #512
	mov	r6, #384
	ldrh	r8, [r1]
	lsr	r5, r5, #16
	orr	r7, r7, #16384
	b	.L146
.L143:
	mov	r0, r1
	add	r3, r3, #56
	add	r2, r2, #8
.L146:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r4, [r2]	@ movhi
	add	r1, r0, #1
	beq	.L144
	cmp	r0, #0
	strheq	r8, [lr]	@ movhi
	strheq	r7, [lr, #2]	@ movhi
	strheq	r5, [lr, #4]	@ movhi
	beq	.L143
	ldr	r0, [r3, #8]
	ldr	ip, [r3]
	orr	r0, r0, #16384
	strh	r6, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
.L144:
	cmp	r1, #26
	bne	.L143
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L149:
	.align	2
.L148:
	.word	snake
	.word	shadowOAM
	.size	drawSnake, .-drawSnake
	.align	2
	.global	initOranges
	.syntax unified
	.arm
	.fpu softvfp
	.type	initOranges, %function
initOranges:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r9, .L154
	mov	r10, #16
	mov	r4, r9
	ldr	r5, .L154+4
	ldr	r8, .L154+8
	ldr	r7, .L154+12
	add	r6, r9, #1344
.L151:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	rsb	r3, r3, r3, lsl #5
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #16
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #4
	mov	r2, #0
	smull	r3, ip, r7, r0
	asr	r3, r0, #31
	add	ip, ip, r0
	rsb	r3, r3, ip, asr #7
	add	r3, r3, r3, lsl #1
	add	r3, r3, r3, lsl r1
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #16
	str	r10, [r4, #24]
	str	r10, [r4, #28]
	str	r3, [r4, #8]
	str	r2, [r4, #32]
	str	r2, [r4, #36]
	str	r2, [r4, #40]
	str	r2, [r4, #48]
	str	r2, [r4, #52]
	str	r1, [r4, #44]
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L151
	mov	r3, #1
	str	r3, [r9, #48]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	oranges
	.word	rand
	.word	-2078209981
	.word	-1600085855
	.size	initOranges, .-initOranges
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
	mov	r3, #16384
	ldr	r4, .L158
	mov	r0, #3
	ldr	r2, .L158+4
	ldr	r1, .L158+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L158+12
	ldr	r1, .L158+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L158+20
	ldr	r2, .L158+24
	str	r3, [r1]
	str	r3, [r2]
	bl	initSnake
	pop	{r4, lr}
	b	initOranges
.L159:
	.align	2
.L158:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	direction
	.word	timer
	.size	initGame, .-initGame
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
	@ link register save eliminated.
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bxeq	lr
	b	updateOranges.part.0
	.size	updateOranges, .-updateOranges
	.align	2
	.global	generateOrange
	.syntax unified
	.arm
	.fpu softvfp
	.type	generateOrange, %function
generateOrange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L167
	mov	r2, #0
	mov	r3, r0
	b	.L165
.L163:
	add	r2, r2, #1
	cmp	r2, #24
	add	r3, r3, #56
	bxeq	lr
.L165:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L163
	ldr	r1, [r3, #52]
	cmp	r1, #0
	bne	.L163
	mov	r3, #1
	rsb	r2, r2, r2, lsl #3
	add	r2, r0, r2, lsl #3
	str	r3, [r2, #48]
	bx	lr
.L168:
	.align	2
.L167:
	.word	oranges
	.size	generateOrange, .-generateOrange
	.align	2
	.global	drawOranges
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawOranges, %function
drawOranges:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #512
	ldr	r3, .L175
	ldr	r2, .L175+4
	add	lr, r3, #1344
.L172:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	strheq	r4, [r2, #208]	@ movhi
	beq	.L171
	add	r1, r3, #36
	ldm	r1, {r1, ip}
	ldr	r0, [r3, #8]
	add	ip, ip, #2
	add	r1, r1, ip, lsl #5
	ldr	ip, [r3]
	lsl	r1, r1, #1
	orr	r0, r0, #16384
	strh	r1, [r2, #212]	@ movhi
	strh	r0, [r2, #210]	@ movhi
	strh	ip, [r2, #208]	@ movhi
.L171:
	add	r3, r3, #56
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L172
	pop	{r4, lr}
	bx	lr
.L176:
	.align	2
.L175:
	.word	oranges
	.word	shadowOAM
	.size	drawOranges, .-drawOranges
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
	bl	drawSnake
	pop	{r4, lr}
	b	drawOranges
	.size	drawGame, .-drawGame
	.comm	timer,4,4
	.comm	direction,4,4
	.comm	shadowOAM,1024,4
	.comm	oranges,1344,4
	.comm	snake,1456,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
