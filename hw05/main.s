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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #1344
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	ldr	r1, .L4+24
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+32
	ldr	r2, .L4+36
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	bgStartPal
	.word	bgStartTiles
	.word	100720640
	.word	bgStartMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #7168
	str	lr, [sp, #-4]!
	mov	lr, #4352
	mov	r1, #0
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L8
	ldr	r0, .L8+4
	ldrh	ip, [r2, #48]
	ldr	r2, .L8+8
	strh	lr, [r3]	@ movhi
	ldr	lr, [sp], #4
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
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
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #3776
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L12+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	bgGamePal
	.word	bgGameTiles
	.word	100720640
	.word	bgGameMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
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
	mov	r3, #256
	ldr	r4, .L25
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+4
	mov	lr, pc
	bx	r4
	mov	r3, #2192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L25+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L25+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	bgPausePal
	.word	bgPauseTiles
	.word	100720640
	.word	bgPauseMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L39
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L27:
	pop	{r4, lr}
	bx	lr
.L38:
	pop	{r4, lr}
	b	goToStart
.L37:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L28
.L40:
	.align	2
.L39:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
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
	mov	r3, #256
	ldr	r4, .L43
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L43+4
	mov	lr, pc
	bx	r4
	mov	r3, #1856
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L43+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L43+12
	ldr	r1, .L43+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L43+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L43+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	DMANow
	.word	bgWinPal
	.word	bgWinTiles
	.word	100720640
	.word	bgWinMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
.L45:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToStart
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	mov	r3, #256
	ldr	r4, .L56
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L56+4
	mov	lr, pc
	bx	r4
	mov	r3, #1904
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L56+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L56+12
	ldr	r1, .L56+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L56+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L56+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
	.word	DMANow
	.word	bgLosePal
	.word	bgLoseTiles
	.word	100720640
	.word	bgLoseMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L69+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r3, .L69+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
.L59:
	ldr	r4, .L69+28
	ldr	r3, [r4]
	cmp	r3, #25
	beq	.L67
.L60:
	cmp	r3, #0
	beq	.L68
	pop	{r4, lr}
	bx	lr
.L68:
	pop	{r4, lr}
	b	goToLose
.L67:
	bl	goToWin
	ldr	r3, [r4]
	b	.L60
.L66:
	bl	goToPause
	b	.L59
.L70:
	.align	2
.L69:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	snakeLength
	.size	game, .-game
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
	mov	r1, #7168
	mov	r0, #4352
	mov	r2, #0
	push	{r4, r7, fp, lr}
	strh	r1, [r3, #8]	@ movhi
	ldr	r4, .L82
	ldr	fp, .L82+4
	ldrh	r1, [r4, #48]
	ldr	r5, .L82+8
	strh	r0, [r3]	@ movhi
	ldr	r3, .L82+12
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L82+16
	ldr	r10, .L82+20
	ldr	r9, .L82+24
	ldr	r8, .L82+28
	ldr	r7, .L82+32
.L72:
	ldr	r2, [r6]
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
	b	.L72
.L76:
	mov	lr, pc
	bx	r8
	b	.L72
.L77:
	mov	lr, pc
	bx	r9
	b	.L72
.L78:
	mov	lr, pc
	bx	r10
	b	.L72
.L83:
	.align	2
.L82:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	snakeLength,4,4
	.comm	shadowOAM,1024,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
