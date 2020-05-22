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
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #31744
	mov	r4, #0
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L4+16
	strh	r2, [r3, #246]	@ movhi
	ldr	r2, .L4+20
	strh	r4, [r3, #244]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+32
	ldr	r3, .L4+36
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	bgPal
	.word	DMANow
	.word	bgBitmap
	.word	drawFullscreenImage4
	.word	83886336
	.word	15855
	.word	waitForVBlank
	.word	flipPage
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
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
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
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r2, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L16+20
	ldr	r3, .L16+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
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
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"PAUSE\000"
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
	mov	r0, #255
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	ldr	r2, .L23+8
	mov	r1, #77
	mov	r0, #105
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L23+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L35
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r2, .L35+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L26
	mov	r2, #1
	ldr	r3, .L35+12
	str	r2, [r3]
.L25:
	pop	{r4, lr}
	bx	lr
.L26:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L25
	pop	{r4, lr}
	b	goToStart
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"WIN\000"
	.text
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
	mov	r2, #83886080
	ldr	r1, .L39
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L39+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L39+8
	ldr	r3, .L39+12
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L39+16
	strh	r2, [r3, #244]	@ movhi
	ldr	r2, .L39+20
	strh	lr, [r3, #246]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	mov	r0, #111
	mov	r1, #135
	strh	r2, [r3, #254]	@ movhi
	ldr	r4, .L39+24
	ldr	r2, .L39+28
	mov	r3, #252
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+36
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L39+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	winPal
	.word	DMANow
	.word	winBitmap
	.word	drawFullscreenImage4
	.word	83886336
	.word	15855
	.word	drawString4
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L48
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToStart
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"LOSE\000"
	.text
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
	mov	r0, #253
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	ldr	r4, .L52+4
	ldr	r2, .L52+8
	mov	r1, #73
	mov	r0, #108
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+16
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L52+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	fillScreen4
	.word	drawString4
	.word	.LC3
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Asteroids Remaining: %d\000"
	.align	2
.LC5:
	.ascii	"You're safe! Go now!\000"
	.text
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L68
	ldr	r4, .L68+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L55
	ldr	r1, .L68+12
	ldr	r3, .L68+16
	ldr	r0, .L68+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L68+24
	ldr	r2, .L68+20
	mov	r3, #254
	mov	r1, #145
	mov	r0, #8
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
.L55:
	cmp	r2, #0
	beq	.L64
.L56:
	ldr	r3, .L68+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
	ldr	r3, .L68+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L57:
	ldr	r4, .L68+44
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L66
.L58:
	cmn	r3, #1
	beq	.L67
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	mov	r2, #21
	ldr	r1, .L68+48
	ldr	r3, .L68+52
	ldr	r0, .L68+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L68+24
	mov	r3, #254
	mov	r1, #145
	mov	r0, #8
	ldr	r2, .L68+20
	mov	lr, pc
	bx	r4
	b	.L56
.L67:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L66:
	bl	goToWin
	ldr	r3, [r4]
	b	.L58
.L65:
	bl	goToPause
	b	.L57
.L69:
	.align	2
.L68:
	.word	updateGame
	.word	asteroidsRemaining
	.word	drawGame
	.word	.LC4
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	gameState
	.word	.LC5
	.word	memcpy
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
	mov	r2, #67108864
	ldr	r1, .L81
	push	{r4, r7, fp, lr}
	ldr	r3, .L81+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L81+8
	ldr	fp, .L81+12
	ldr	r5, .L81+16
	ldr	r10, .L81+20
	ldr	r9, .L81+24
	ldr	r8, .L81+28
	ldr	r7, .L81+32
	ldr	r4, .L81+36
.L71:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L72:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L72
.L74:
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L73
	.word	.L73
.L73:
	mov	lr, pc
	bx	r7
	b	.L71
.L75:
	mov	lr, pc
	bx	r8
	b	.L71
.L76:
	mov	lr, pc
	bx	r9
	b	.L71
.L77:
	mov	lr, pc
	bx	r10
	b	.L71
.L82:
	.align	2
.L81:
	.word	1044
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
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
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
