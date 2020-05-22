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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L7+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #20]
	mov	r0, #1
	mov	r3, #910163968
	ldr	r2, .L7+12
	ldr	r4, .L7+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L7+20
	ldr	r3, .L7+24
	strh	r7, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	ldr	r3, .L7+28
	str	r6, [r4]
	str	r8, [r4, #16]
	mov	lr, pc
	bx	r3
	ldr	r5, .L7+32
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L7+36
	ldr	r3, .L7+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L7+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L28
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L23
	ldr	r3, .L28+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	push	{r4, lr}
	beq	.L12
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L26
	ldr	r0, .L28+8
	ldr	r1, .L28+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L12:
	ldr	r3, .L28+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L16
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L16
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L27
	ldr	r0, .L28+8
	ldr	r1, .L28+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L16:
	mov	r2, #1
	ldr	r3, .L28
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L28
	pop	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L23:
	mov	r2, #1
	ldr	r3, .L28
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L26:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L12
.L27:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L16
.L29:
	.align	2
.L28:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L32+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #32]
	mov	r0, #2
	mov	r3, #910163968
	ldr	r2, .L32+12
	ldr	r4, .L32+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L32+20
	ldr	r3, .L32+24
	strh	r7, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	ldr	r3, .L32+28
	str	r6, [r4]
	str	r8, [r4, #16]
	mov	lr, pc
	bx	r3
	ldr	r5, .L32+32
	adr	r3, .L32
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L32+36
	ldr	r3, .L32+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L32+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L33:
	.align	3
.L32:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L36
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L36+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L36+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L37:
	.align	2
.L36:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pauseSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSoundA, %function
pauseSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L39
	ldr	r2, .L39+4
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	bx	lr
.L40:
	.align	2
.L39:
	.word	soundA
	.word	67109120
	.size	pauseSoundA, .-pauseSoundA
	.align	2
	.global	pauseSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSoundB, %function
pauseSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L42
	ldr	r2, .L42+4
	str	r3, [r1, #12]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L43:
	.align	2
.L42:
	.word	soundB
	.word	67109120
	.size	pauseSoundB, .-pauseSoundB
	.align	2
	.global	unpauseSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSoundA, %function
unpauseSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r2, #128
	ldr	r1, .L45
	ldr	r3, .L45+4
	str	r0, [r1, #12]
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	soundA
	.word	67109120
	.size	unpauseSoundA, .-unpauseSoundA
	.align	2
	.global	unpauseSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSoundB, %function
unpauseSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r2, #128
	ldr	r1, .L48
	ldr	r3, .L48+4
	str	r0, [r1, #12]
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L49:
	.align	2
.L48:
	.word	soundB
	.word	67109120
	.size	unpauseSoundB, .-unpauseSoundB
	.align	2
	.global	stopSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSoundA, %function
stopSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L51
	ldr	r1, .L51+4
	ldr	r0, [r2]
	ldr	r2, .L51+8
	str	r3, [r0, #20]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	dma
	.word	soundA
	.word	67109120
	.size	stopSoundA, .-stopSoundA
	.align	2
	.global	stopSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSoundB, %function
stopSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L54
	ldr	r1, .L54+4
	ldr	r0, [r2]
	ldr	r2, .L54+8
	str	r3, [r0, #32]
	str	r3, [r1, #12]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L55:
	.align	2
.L54:
	.word	dma
	.word	soundB
	.word	67109120
	.size	stopSoundB, .-stopSoundB
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
