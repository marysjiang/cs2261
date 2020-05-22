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
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L4
	ldr	r0, .L4+4
	ldrh	ip, [r2, #48]
	ldr	r1, .L4+8
	ldr	r2, .L4+12
	strh	r0, [r3]	@ movhi
	ldr	r3, .L4+16
	ldr	r0, .L4+20
	strh	r4, [r2]	@ movhi
	strh	ip, [r1]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	fillScreen
	.word	32736
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L13
	ldr	r4, .L13+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L6
	ldr	r3, .L13+8
	ldrh	r0, [r3]
	ands	r0, r0, #8
	beq	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L13+16
	ldr	r0, [r4]
	ldr	r3, .L13+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	fillScreen
	.word	state
	.word	srand
	.word	initGame
	.size	startState, .-startState
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L17
	ldr	r0, .L17+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L17+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	fillScreen
	.word	32736
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L27
.L20:
	ldr	r3, .L30+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L28
.L21:
	ldr	r3, .L30+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
	ldr	r3, .L30+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
.L19:
	pop	{r4, lr}
	bx	lr
.L28:
	ldr	r3, .L30+28
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L30+32
	str	r2, [r3]
	b	.L21
.L27:
	ldr	r3, .L30+28
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L30+32
	str	r2, [r3]
	b	.L20
.L29:
	ldr	r3, .L30+28
	ldr	r0, .L30+36
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L30+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	ballsRemaining
	.word	bricksRemaining
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.word	351
	.size	gameState, .-gameState
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L34
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L34+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L45
	pop	{r4, lr}
	bx	lr
.L45:
	ldr	r3, .L46+8
	ldr	r0, .L46+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.size	winState, .-winState
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L50
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L50+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	fillScreen
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L55
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L55+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	fillScreen
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L69
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L58
	ldr	r2, .L69+4
	ldrh	r0, [r2]
	ands	r0, r0, #8
	beq	.L67
.L58:
	tst	r3, #4
	beq	.L57
	ldr	r3, .L69+4
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L68
.L57:
	pop	{r4, lr}
	bx	lr
.L68:
	ldr	r3, .L69+8
	ldr	r0, .L69+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L67:
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L69+16
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L58
.L70:
	.align	2
.L69:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.size	pauseState, .-pauseState
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
	push	{r4, r7, fp, lr}
	mov	r7, #0
	ldr	r4, .L82
	ldr	r1, .L82+4
	ldrh	r2, [r4, #48]
	ldr	fp, .L82+8
	ldr	r5, .L82+12
	ldr	r6, .L82+16
	strh	r1, [r3]	@ movhi
	ldr	r0, .L82+20
	ldr	r3, .L82+24
	strh	r2, [fp]	@ movhi
	strh	r7, [r5]	@ movhi
	ldr	r10, .L82+28
	mov	lr, pc
	bx	r3
	ldr	r9, .L82+32
	mov	r2, r7
	str	r7, [r6]
	ldr	r8, .L82+36
	ldr	r7, .L82+40
.L72:
	ldrh	r3, [fp]
.L73:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L73
.L75:
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L74
	.word	.L74
.L74:
	mov	lr, pc
	bx	r7
.L79:
	ldr	r2, [r6]
	b	.L72
.L76:
	mov	lr, pc
	bx	r8
	b	.L79
.L77:
	mov	lr, pc
	bx	r9
	b	.L79
.L78:
	mov	lr, pc
	bx	r10
	b	.L79
.L83:
	.align	2
.L82:
	.word	67109120
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	state
	.word	32736
	.word	fillScreen
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState
	.size	main, .-main
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L86
	ldr	r0, .L86+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L86+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L87:
	.align	2
.L86:
	.word	fillScreen
	.word	351
	.word	state
	.size	goToPause, .-goToPause
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
