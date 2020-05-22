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
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #0
	mov	r6, #512
	ldr	r4, .L4
	strh	r6, [r3]	@ movhi
	strh	r5, [r3, #20]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r3, r6
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L4+36
	ldr	r1, .L4+40
	ldr	r0, .L4+44
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+48
	ldr	r3, .L4+52
	str	r5, [r2]
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	bgStart1Pal
	.word	4304
	.word	bgStart1Tiles
	.word	100720640
	.word	bgStart1Map
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	playSoundA
	.word	1504224
	.word	bubblegumKK
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
	mov	r2, #67108864
	mov	r0, #7168
	mov	r1, #4608
	mov	r3, #0
	ldr	ip, .L8
	push	{r4, lr}
	strh	r0, [r2, #10]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	ldr	r0, .L8+4
	ldr	lr, .L8+8
	ldrh	r4, [r0, #48]
	ldr	ip, .L8+12
	strh	r1, [r2]	@ movhi
	ldr	r0, .L8+16
	ldr	r1, .L8+20
	ldr	r2, .L8+24
	strh	r4, [lr]	@ movhi
	strh	r3, [ip]	@ movhi
	str	r3, [r1]
	str	r3, [r0]
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	24068
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	bgTimer
	.word	bgState
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #512
	mov	r2, #0
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	ldr	r1, .L12+4
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+16
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	bgInstructionsPal
	.word	6032
	.word	bgInstructionsTiles
	.word	100720640
	.word	bgInstructionsMap
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L26
	ldr	r3, [r5]
	ldr	r4, .L26+4
	add	r3, r3, #1
	ldr	r2, .L26+8
	str	r3, [r5]
	mov	lr, pc
	bx	r2
	ldr	r3, [r4]
	cmp	r3, #50
	beq	.L23
.L15:
	ldr	r3, .L26+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L18
	ldr	r3, .L26+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L24
.L18:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L23:
	ldr	r6, .L26+20
	ldr	r3, [r6]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	beq	.L25
	ldr	r7, .L26+24
	mov	r0, #3
	ldr	r1, .L26+28
	mov	lr, pc
	bx	r7
	mov	r3, #4160
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L26+32
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L26+36
	ldr	r1, .L26+40
	mov	lr, pc
	bx	r7
	mov	r3, #0
	str	r3, [r6]
.L17:
	mov	r3, #0
	str	r3, [r4]
	b	.L15
.L25:
	ldr	r7, .L26+24
	mov	r0, #3
	ldr	r1, .L26+44
	mov	lr, pc
	bx	r7
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L26+48
	ldr	r1, .L26+52
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L26+36
	ldr	r1, .L26+56
	mov	lr, pc
	bx	r7
	mov	r3, #1
	str	r3, [r6]
	b	.L17
.L24:
	ldr	r0, [r5]
	ldr	r3, .L26+60
	mov	lr, pc
	bx	r3
	bl	goToInstructions
	b	.L18
.L27:
	.align	2
.L26:
	.word	seed
	.word	bgTimer
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	bgState
	.word	DMANow
	.word	bgStart2Pal
	.word	bgStart2Tiles
	.word	100720640
	.word	bgStart2Map
	.word	bgStart1Pal
	.word	4304
	.word	bgStart1Tiles
	.word	bgStart1Map
	.word	srand
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
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L30
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L30+4
	mov	lr, pc
	bx	r4
	mov	r3, #2416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L30+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L30+12
	ldr	r1, .L30+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L30+20
	ldr	r2, .L30+24
	ldr	r1, .L30+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L30+32
	ldr	r1, .L30+36
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+40
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L30+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+48
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L30+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	DMANow
	.word	bgGameBackPal
	.word	bgGameBackTiles
	.word	100720640
	.word	bgGameBackMap
	.word	7280
	.word	100679680
	.word	bgGameFrontTiles
	.word	100724736
	.word	bgGameFrontMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L39
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L32
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
.L32:
	pop	{r4, lr}
	bx	lr
.L38:
	ldr	r3, .L39+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L39+16
	ldr	r3, .L39+20
	ldr	r0, .L39+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L39+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSoundA
	.word	1770842
	.word	playSoundA
	.word	goKKRider
	.word	initGame
	.size	instructions, .-instructions
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
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #512
	mov	r2, #0
	ldr	r4, .L43
	strh	r2, [r3, #20]	@ movhi
	strh	r5, [r3]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L43+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L43+8
	ldr	r1, .L43+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L43+16
	ldr	r1, .L43+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L43+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+32
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L43+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	DMANow
	.word	bgPausePal
	.word	5088
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
	ldr	r4, .L57
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L46
	ldr	r2, .L57+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L55
.L46:
	tst	r3, #4
	beq	.L45
	ldr	r3, .L57+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L56
.L45:
	pop	{r4, lr}
	bx	lr
.L56:
	ldr	r3, .L57+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L57+16
	ldr	r0, .L57+20
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L55:
	ldr	r3, .L57+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+28
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L46
.L58:
	.align	2
.L57:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	stopSoundB
	.word	1504224
	.word	bubblegumKK
	.word	playSoundA
	.word	unpauseSoundA
	.size	pause, .-pause
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
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #512
	mov	r2, #0
	ldr	r4, .L61
	strh	r2, [r3, #20]	@ movhi
	strh	r5, [r3]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L61+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L61+8
	ldr	r1, .L61+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L61+16
	ldr	r1, .L61+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L61+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+32
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L61+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L62:
	.align	2
.L61:
	.word	DMANow
	.word	bgLosePal
	.word	5776
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
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldr	r3, .L72+4
	ldrh	r1, [r3]
	lsl	r3, r1, #17
	lsr	r3, r3, #16
	strh	r3, [r2, #20]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	ldr	r3, .L72+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L72+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L72+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L72+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r3, .L72+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L64:
	ldr	r3, .L72+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L71
	pop	{r4, lr}
	bx	lr
.L71:
	ldr	r3, .L72+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+40
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L72+44
	ldr	r0, .L72+48
	ldr	r3, .L72+52
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToLose
.L70:
	ldr	r3, .L72+56
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L72+60
	ldr	r3, .L72+64
	ldr	r0, .L72+68
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L64
.L73:
	.align	2
.L72:
	.word	updateGame
	.word	hOff
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	livesRemaining
	.word	stopSoundA
	.word	stopSoundB
	.word	1413216
	.word	rainy
	.word	playSoundA
	.word	pauseSoundA
	.word	860882
	.word	playSoundB
	.word	bossaKK
	.size	game, .-game
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
	ldr	r3, .L81
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
	ldr	r3, .L81+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
.L74:
	pop	{r4, lr}
	bx	lr
.L80:
	ldr	r3, .L81+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L81+16
	ldr	r0, .L81+20
	ldr	r3, .L81+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L82:
	.align	2
.L81:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSoundA
	.word	1504224
	.word	bubblegumKK
	.word	playSoundA
	.size	lose, .-lose
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L95
	mov	lr, pc
	bx	r3
	ldr	r6, .L95+4
	ldr	r7, .L95+8
	ldr	r5, .L95+12
	ldr	fp, .L95+16
	ldr	r10, .L95+20
	ldr	r9, .L95+24
	ldr	r8, .L95+28
	ldr	r4, .L95+32
.L84:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L85:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L85
.L87:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L86
.L86:
	ldr	r3, .L95+36
	mov	lr, pc
	bx	r3
	b	.L84
.L88:
	mov	lr, pc
	bx	r8
	b	.L84
.L89:
	mov	lr, pc
	bx	r9
	b	.L84
.L90:
	mov	lr, pc
	bx	r10
	b	.L84
.L91:
	mov	lr, pc
	bx	fp
	b	.L84
.L96:
	.align	2
.L95:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	livesRemaining,4,4
	.comm	seed,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	bgTimer,4,4
	.comm	bgState,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
