
main.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <fun>:
    8000:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    8004:	e28db000 	add	fp, sp, #0
    8008:	e24dd00c 	sub	sp, sp, #12
    800c:	e3a03004 	mov	r3, #4
    8010:	e50b3008 	str	r3, [fp, #-8]
    8014:	e1a00000 	nop			@ (mov r0, r0)
    8018:	e28bd000 	add	sp, fp, #0
    801c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    8020:	e12fff1e 	bx	lr

Disassembly of section .data:

00009024 <initialised_global>:
    9024:	00000002 	andeq	r0, r0, r2

00009028 <static_initialised_global>:
    9028:	00000005 	andeq	r0, r0, r5

0000902c <static_initialised_local_variable.1>:
    902c:	00000005 	andeq	r0, r0, r5

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <_stack+0x1050d24>
   4:	35312820 	ldrcc	r2, [r1, #-2080]!	@ 0xfffff7e0
   8:	2e33313a 	mrccs	1, 1, r3, cr3, cr10, {1}
   c:	65722e32 	ldrbvs	r2, [r2, #-3634]!	@ 0xfffff1ce
  10:	322d316c 	eorcc	r3, sp, #108, 2
  14:	33312029 	teqcc	r1, #41	@ 0x29
  18:	312e322e 			@ <UNDEFINED> instruction: 0x312e322e
  1c:	32303220 	eorscc	r3, r0, #32, 4
  20:	30303133 	eorscc	r3, r0, r3, lsr r1
  24:	Address 0x24 is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002941 	andeq	r2, r0, r1, asr #18
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	0000001f 	andeq	r0, r0, pc, lsl r0
  10:	00543405 	subseq	r3, r4, r5, lsl #8
  14:	01080206 	tsteq	r8, r6, lsl #4
  18:	04120109 	ldreq	r0, [r2], #-265	@ 0xfffffef7
  1c:	01150114 	tsteq	r5, r4, lsl r1
  20:	01180317 	tsteq	r8, r7, lsl r3
  24:	011a0119 	tsteq	sl, r9, lsl r1
  28:	Address 0x28 is out of bounds.

