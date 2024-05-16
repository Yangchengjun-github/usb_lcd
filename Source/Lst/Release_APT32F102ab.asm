
.//Obj/Release_APT32F102ab.elf:     file format elf32-csky-little


Disassembly of section .text:

00000000 <vector_table>:
       0:	0000010c 	.long	0x0000010c
       4:	00003b3e 	.long	0x00003b3e
       8:	00003b2e 	.long	0x00003b2e
       c:	00000184 	.long	0x00000184
      10:	00003b36 	.long	0x00003b36
      14:	00003af4 	.long	0x00003af4
      18:	00000184 	.long	0x00000184
      1c:	00003b26 	.long	0x00003b26
      20:	00003b1e 	.long	0x00003b1e
      24:	00000184 	.long	0x00000184
      28:	00000184 	.long	0x00000184
      2c:	00000184 	.long	0x00000184
      30:	00000184 	.long	0x00000184
      34:	00000184 	.long	0x00000184
      38:	00000184 	.long	0x00000184
      3c:	00000184 	.long	0x00000184
      40:	00003b16 	.long	0x00003b16
      44:	00003b0e 	.long	0x00003b0e
      48:	00003b06 	.long	0x00003b06
      4c:	00003afe 	.long	0x00003afe
      50:	00000184 	.long	0x00000184
      54:	00000184 	.long	0x00000184
      58:	00000184 	.long	0x00000184
      5c:	00000184 	.long	0x00000184
      60:	00000184 	.long	0x00000184
      64:	00000184 	.long	0x00000184
      68:	00000184 	.long	0x00000184
      6c:	00000184 	.long	0x00000184
      70:	00000184 	.long	0x00000184
      74:	00000184 	.long	0x00000184
      78:	00000184 	.long	0x00000184
      7c:	00003af6 	.long	0x00003af6
      80:	00005ca8 	.long	0x00005ca8
      84:	00003210 	.long	0x00003210
      88:	00003308 	.long	0x00003308
      8c:	00003370 	.long	0x00003370
      90:	000033d8 	.long	0x000033d8
      94:	00000184 	.long	0x00000184
      98:	00003580 	.long	0x00003580
      9c:	000038c4 	.long	0x000038c4
      a0:	000038f4 	.long	0x000038f4
      a4:	000035b4 	.long	0x000035b4
      a8:	00000184 	.long	0x00000184
      ac:	00000184 	.long	0x00000184
      b0:	00003634 	.long	0x00003634
      b4:	000036a4 	.long	0x000036a4
      b8:	000036e0 	.long	0x000036e0
      bc:	0000371c 	.long	0x0000371c
      c0:	00000184 	.long	0x00000184
      c4:	00003b4e 	.long	0x00003b4e
      c8:	00000184 	.long	0x00000184
      cc:	00003758 	.long	0x00003758
      d0:	00003840 	.long	0x00003840
      d4:	00003924 	.long	0x00003924
      d8:	0000396c 	.long	0x0000396c
      dc:	000039c8 	.long	0x000039c8
      e0:	00003b46 	.long	0x00003b46
      e4:	00004f50 	.long	0x00004f50
      e8:	00003a28 	.long	0x00003a28
      ec:	00000184 	.long	0x00000184
      f0:	00003a5c 	.long	0x00003a5c
      f4:	00003aac 	.long	0x00003aac
      f8:	00000184 	.long	0x00000184
      fc:	00000184 	.long	0x00000184
     100:	55aa0005 	.long	0x55aa0005
	...

0000010c <__start>:
//  .long __start
__start:

	
  //initialize all registers
  movi r0, 0
     10c:	3000      	movi      	r0, 0
  movi r1, 0
     10e:	3100      	movi      	r1, 0
  movi r2, 0
     110:	3200      	movi      	r2, 0
  movi r3, 0
     112:	3300      	movi      	r3, 0
  movi r4, 0
     114:	3400      	movi      	r4, 0
  movi r5, 0
     116:	3500      	movi      	r5, 0
  movi r6, 0
     118:	3600      	movi      	r6, 0
  movi r7, 0
     11a:	3700      	movi      	r7, 0
  //movi r13, 0
  //movi r14, 0
  //movi r15, 0

//set VBR
  lrw r2, vector_table
     11c:	105b      	lrw      	r2, 0x0	// 188 <DummyHandler+0x4>
  mtcr r2, cr<1,0>
     11e:	c0026421 	mtcr      	r2, cr<1, 0>

//enable EE bit of psr
  mfcr r2, cr<0,0>
     122:	c0006022 	mfcr      	r2, cr<0, 0>
  bseti r2, r2, 8
     126:	3aa8      	bseti      	r2, 8
  mtcr r2, cr<0,0>
     128:	c0026420 	mtcr      	r2, cr<0, 0>
//  st.w    r2, (r1,0x4)
//  movi    r2, 0x1
//  st.w    r2, (r1,0x0)

//disable power peak 
  lrw     r1, 0xe000ef90
     12c:	1038      	lrw      	r1, 0xe000ef90	// 18c <DummyHandler+0x8>
  movi    r2, 0x0
     12e:	3200      	movi      	r2, 0
  st.w    r2, (r1, 0x0)
     130:	b140      	st.w      	r2, (r1, 0x0)



//initialize kernel stack
  lrw  r7, __kernel_stack
     132:	10f8      	lrw      	r7, 0x20000ff8	// 190 <DummyHandler+0xc>
  mov r14,r7
     134:	6f9f      	mov      	r14, r7
  subi r6,r7,0x4
     136:	5fcf      	subi      	r6, r7, 4

  //lrw  r3, 0x40
  lrw  r3, 0x04
     138:	3304      	movi      	r3, 4
	
  subu r4, r7, r3
     13a:	5f8d      	subu      	r4, r7, r3
  lrw  r5, 0x0
     13c:	3500      	movi      	r5, 0

0000013e <INIT_KERLE_STACK>:
INIT_KERLE_STACK:
  addi r4, 0x4
     13e:	2403      	addi      	r4, 4
  st.w r5, (r4)
     140:	b4a0      	st.w      	r5, (r4, 0x0)
  //cmphs r7, r4
  cmphs r6, r4
     142:	6518      	cmphs      	r6, r4
  bt  INIT_KERLE_STACK
     144:	0bfd      	bt      	0x13e	// 13e <INIT_KERLE_STACK>

00000146 <__to_main>:
        
__to_main:
  lrw r0,__main
     146:	1014      	lrw      	r0, 0x204c	// 194 <DummyHandler+0x10>
  jsr r0
     148:	7bc1      	jsr      	r0
  mov r0, r0
     14a:	6c03      	mov      	r0, r0
  mov r0, r0
     14c:	6c03      	mov      	r0, r0


  
  lrw r15, __exit
     14e:	ea8f0013 	lrw      	r15, 0x160	// 198 <DummyHandler+0x14>
  lrw r0,main
     152:	1013      	lrw      	r0, 0x2f58	// 19c <DummyHandler+0x18>
  jmp r0
     154:	7800      	jmp      	r0
  mov r0, r0
     156:	6c03      	mov      	r0, r0
  mov r0, r0
     158:	6c03      	mov      	r0, r0
  mov r0, r0
     15a:	6c03      	mov      	r0, r0
  mov r0, r0
     15c:	6c03      	mov      	r0, r0
  mov r0, r0
     15e:	6c03      	mov      	r0, r0

00000160 <__exit>:

.export __exit
__exit:

  lrw r4, 0x20003000
     160:	1090      	lrw      	r4, 0x20003000	// 1a0 <DummyHandler+0x1c>
  //lrw r5, 0x0
  mov r5, r0
     162:	6d43      	mov      	r5, r0
  st.w r5, (r4)
     164:	b4a0      	st.w      	r5, (r4, 0x0)

  mfcr r1, cr<0,0>
     166:	c0006021 	mfcr      	r1, cr<0, 0>
  lrw  r1, 0xFFFF
     16a:	102f      	lrw      	r1, 0xffff	// 1a4 <DummyHandler+0x20>
  mtcr r1, cr<11,0>
     16c:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xFFF
     170:	102e      	lrw      	r1, 0xfff	// 1a8 <DummyHandler+0x24>
  movi    r0, 0x0
     172:	3000      	movi      	r0, 0
  st      r1, (r0)
     174:	b020      	st.w      	r1, (r0, 0x0)

00000176 <__fail>:

.export __fail
__fail:
  lrw  r1, 0xEEEE
     176:	102e      	lrw      	r1, 0xeeee	// 1ac <DummyHandler+0x28>
  mtcr r1, cr<11,0>
     178:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xEEE
     17c:	102d      	lrw      	r1, 0xeee	// 1b0 <DummyHandler+0x2c>
  movi    r0, 0x0
     17e:	3000      	movi      	r0, 0
  st      r1, (r0)
     180:	b020      	st.w      	r1, (r0, 0x0)

00000182 <__dummy>:

__dummy:
  br      __fail
     182:	07fa      	br      	0x176	// 176 <__fail>

00000184 <DummyHandler>:

.export DummyHandler
DummyHandler:
  br      __fail
     184:	07f9      	br      	0x176	// 176 <__fail>
     186:	0000      	.short	0x0000
     188:	00000000 	.long	0x00000000
     18c:	e000ef90 	.long	0xe000ef90
     190:	20000ff8 	.long	0x20000ff8
     194:	0000204c 	.long	0x0000204c
     198:	00000160 	.long	0x00000160
     19c:	00002f58 	.long	0x00002f58
     1a0:	20003000 	.long	0x20003000
     1a4:	0000ffff 	.long	0x0000ffff
     1a8:	00000fff 	.long	0x00000fff
     1ac:	0000eeee 	.long	0x0000eeee
     1b0:	00000eee 	.long	0x00000eee

000001b4 <__GI_pow>:
     1b4:	14d4      	push      	r4-r7, r15
     1b6:	142d      	subi      	r14, r14, 52
     1b8:	b860      	st.w      	r3, (r14, 0x0)
     1ba:	4361      	lsli      	r3, r3, 1
     1bc:	4b81      	lsri      	r4, r3, 1
     1be:	b842      	st.w      	r2, (r14, 0x8)
     1c0:	6c90      	or      	r2, r4
     1c2:	3a40      	cmpnei      	r2, 0
     1c4:	6dc3      	mov      	r7, r0
     1c6:	6d87      	mov      	r6, r1
     1c8:	0803      	bt      	0x1ce	// 1ce <__GI_pow+0x1a>
     1ca:	e8000462 	br      	0xa8e	// a8e <__GI_pow+0x8da>
     1ce:	41a1      	lsli      	r5, r1, 1
     1d0:	4da1      	lsri      	r5, r5, 1
     1d2:	0055      	lrw      	r2, 0x7ff00000	// 578 <__GI_pow+0x3c4>
     1d4:	6549      	cmplt      	r2, r5
     1d6:	080c      	bt      	0x1ee	// 1ee <__GI_pow+0x3a>
     1d8:	6496      	cmpne      	r5, r2
     1da:	0803      	bt      	0x1e0	// 1e0 <__GI_pow+0x2c>
     1dc:	3840      	cmpnei      	r0, 0
     1de:	0808      	bt      	0x1ee	// 1ee <__GI_pow+0x3a>
     1e0:	6509      	cmplt      	r2, r4
     1e2:	0806      	bt      	0x1ee	// 1ee <__GI_pow+0x3a>
     1e4:	6492      	cmpne      	r4, r2
     1e6:	080e      	bt      	0x202	// 202 <__GI_pow+0x4e>
     1e8:	9802      	ld.w      	r0, (r14, 0x8)
     1ea:	3840      	cmpnei      	r0, 0
     1ec:	0c0b      	bf      	0x202	// 202 <__GI_pow+0x4e>
     1ee:	9842      	ld.w      	r2, (r14, 0x8)
     1f0:	9860      	ld.w      	r3, (r14, 0x0)
     1f2:	6c1f      	mov      	r0, r7
     1f4:	6c5b      	mov      	r1, r6
     1f6:	e0000913 	bsr      	0x141c	// 141c <__adddf3>
     1fa:	6d03      	mov      	r4, r0
     1fc:	6c13      	mov      	r0, r4
     1fe:	140d      	addi      	r14, r14, 52
     200:	1494      	pop      	r4-r7, r15
     202:	3edf      	btsti      	r6, 31
     204:	0c51      	bf      	0x2a6	// 2a6 <__GI_pow+0xf2>
     206:	0121      	lrw      	r1, 0x43400000	// 57c <__GI_pow+0x3c8>
     208:	2900      	subi      	r1, 1
     20a:	6505      	cmplt      	r1, r4
     20c:	084b      	bt      	0x2a2	// 2a2 <__GI_pow+0xee>
     20e:	0162      	lrw      	r3, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     210:	2b00      	subi      	r3, 1
     212:	650d      	cmplt      	r3, r4
     214:	0c49      	bf      	0x2a6	// 2a6 <__GI_pow+0xf2>
     216:	5454      	asri      	r2, r4, 20
     218:	0104      	lrw      	r0, 0xfffffc01	// 584 <__GI_pow+0x3d0>
     21a:	6080      	addu      	r2, r0
     21c:	3a34      	cmplti      	r2, 21
     21e:	0821      	bt      	0x260	// 260 <__GI_pow+0xac>
     220:	3334      	movi      	r3, 52
     222:	60ca      	subu      	r3, r2
     224:	9842      	ld.w      	r2, (r14, 0x8)
     226:	708d      	lsr      	r2, r3
     228:	6c4b      	mov      	r1, r2
     22a:	704c      	lsl      	r1, r3
     22c:	9802      	ld.w      	r0, (r14, 0x8)
     22e:	6442      	cmpne      	r0, r1
     230:	083b      	bt      	0x2a6	// 2a6 <__GI_pow+0xf2>
     232:	3101      	movi      	r1, 1
     234:	6884      	and      	r2, r1
     236:	3302      	movi      	r3, 2
     238:	5b49      	subu      	r2, r3, r2
     23a:	9802      	ld.w      	r0, (r14, 0x8)
     23c:	3840      	cmpnei      	r0, 0
     23e:	b841      	st.w      	r2, (r14, 0x4)
     240:	0862      	bt      	0x304	// 304 <__GI_pow+0x150>
     242:	0151      	lrw      	r2, 0x7ff00000	// 578 <__GI_pow+0x3c4>
     244:	6492      	cmpne      	r4, r2
     246:	081f      	bt      	0x284	// 284 <__GI_pow+0xd0>
     248:	012f      	lrw      	r1, 0xc0100000	// 588 <__GI_pow+0x3d4>
     24a:	6054      	addu      	r1, r5
     24c:	6dc4      	or      	r7, r1
     24e:	3f40      	cmpnei      	r7, 0
     250:	082d      	bt      	0x2aa	// 2aa <__GI_pow+0xf6>
     252:	9860      	ld.w      	r3, (r14, 0x0)
     254:	3200      	movi      	r2, 0
     256:	6c4f      	mov      	r1, r3
     258:	3000      	movi      	r0, 0
     25a:	e00008f9 	bsr      	0x144c	// 144c <__subdf3>
     25e:	07ce      	br      	0x1fa	// 1fa <__GI_pow+0x46>
     260:	9822      	ld.w      	r1, (r14, 0x8)
     262:	3940      	cmpnei      	r1, 0
     264:	084e      	bt      	0x300	// 300 <__GI_pow+0x14c>
     266:	3114      	movi      	r1, 20
     268:	604a      	subu      	r1, r2
     26a:	6c93      	mov      	r2, r4
     26c:	7086      	asr      	r2, r1
     26e:	6c0b      	mov      	r0, r2
     270:	7004      	lsl      	r0, r1
     272:	6412      	cmpne      	r4, r0
     274:	0c03      	bf      	0x27a	// 27a <__GI_pow+0xc6>
     276:	e8000471 	br      	0xb58	// b58 <__GI_pow+0x9a4>
     27a:	3101      	movi      	r1, 1
     27c:	6884      	and      	r2, r1
     27e:	3002      	movi      	r0, 2
     280:	5869      	subu      	r3, r0, r2
     282:	b861      	st.w      	r3, (r14, 0x4)
     284:	0220      	lrw      	r1, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     286:	6452      	cmpne      	r4, r1
     288:	0825      	bt      	0x2d2	// 2d2 <__GI_pow+0x11e>
     28a:	9880      	ld.w      	r4, (r14, 0x0)
     28c:	3cdf      	btsti      	r4, 31
     28e:	0803      	bt      	0x294	// 294 <__GI_pow+0xe0>
     290:	e8000407 	br      	0xa9e	// a9e <__GI_pow+0x8ea>
     294:	6c9f      	mov      	r2, r7
     296:	6cdb      	mov      	r3, r6
     298:	3000      	movi      	r0, 0
     29a:	0225      	lrw      	r1, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     29c:	e0000a0e 	bsr      	0x16b8	// 16b8 <__divdf3>
     2a0:	07ad      	br      	0x1fa	// 1fa <__GI_pow+0x46>
     2a2:	3202      	movi      	r2, 2
     2a4:	07cb      	br      	0x23a	// 23a <__GI_pow+0x86>
     2a6:	3200      	movi      	r2, 0
     2a8:	07c9      	br      	0x23a	// 23a <__GI_pow+0x86>
     2aa:	0269      	lrw      	r3, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     2ac:	2b00      	subi      	r3, 1
     2ae:	654d      	cmplt      	r3, r5
     2b0:	9800      	ld.w      	r0, (r14, 0x0)
     2b2:	0c08      	bf      	0x2c2	// 2c2 <__GI_pow+0x10e>
     2b4:	38df      	btsti      	r0, 31
     2b6:	0803      	bt      	0x2bc	// 2bc <__GI_pow+0x108>
     2b8:	e80003ef 	br      	0xa96	// a96 <__GI_pow+0x8e2>
     2bc:	3400      	movi      	r4, 0
     2be:	3100      	movi      	r1, 0
     2c0:	079e      	br      	0x1fc	// 1fc <__GI_pow+0x48>
     2c2:	38df      	btsti      	r0, 31
     2c4:	0ffc      	bf      	0x2bc	// 2bc <__GI_pow+0x108>
     2c6:	3400      	movi      	r4, 0
     2c8:	6c43      	mov      	r1, r0
     2ca:	3280      	movi      	r2, 128
     2cc:	4278      	lsli      	r3, r2, 24
     2ce:	604c      	addu      	r1, r3
     2d0:	0796      	br      	0x1fc	// 1fc <__GI_pow+0x48>
     2d2:	3380      	movi      	r3, 128
     2d4:	4317      	lsli      	r0, r3, 23
     2d6:	9840      	ld.w      	r2, (r14, 0x0)
     2d8:	640a      	cmpne      	r2, r0
     2da:	0808      	bt      	0x2ea	// 2ea <__GI_pow+0x136>
     2dc:	6c9f      	mov      	r2, r7
     2de:	6cdb      	mov      	r3, r6
     2e0:	6c1f      	mov      	r0, r7
     2e2:	6c5b      	mov      	r1, r6
     2e4:	e00008d0 	bsr      	0x1484	// 1484 <__muldf3>
     2e8:	0789      	br      	0x1fa	// 1fa <__GI_pow+0x46>
     2ea:	0276      	lrw      	r3, 0x3fe00000	// 58c <__GI_pow+0x3d8>
     2ec:	9820      	ld.w      	r1, (r14, 0x0)
     2ee:	64c6      	cmpne      	r1, r3
     2f0:	080a      	bt      	0x304	// 304 <__GI_pow+0x150>
     2f2:	3edf      	btsti      	r6, 31
     2f4:	0808      	bt      	0x304	// 304 <__GI_pow+0x150>
     2f6:	6c1f      	mov      	r0, r7
     2f8:	6c5b      	mov      	r1, r6
     2fa:	e0000445 	bsr      	0xb84	// b84 <__GI_sqrt>
     2fe:	077e      	br      	0x1fa	// 1fa <__GI_pow+0x46>
     300:	3300      	movi      	r3, 0
     302:	b861      	st.w      	r3, (r14, 0x4)
     304:	6c1f      	mov      	r0, r7
     306:	6c5b      	mov      	r1, r6
     308:	b883      	st.w      	r4, (r14, 0xc)
     30a:	e000042a 	bsr      	0xb5e	// b5e <__GI_fabs>
     30e:	3f40      	cmpnei      	r7, 0
     310:	6d03      	mov      	r4, r0
     312:	9863      	ld.w      	r3, (r14, 0xc)
     314:	0826      	bt      	0x360	// 360 <__GI_pow+0x1ac>
     316:	3d40      	cmpnei      	r5, 0
     318:	0c05      	bf      	0x322	// 322 <__GI_pow+0x16e>
     31a:	4642      	lsli      	r2, r6, 2
     31c:	0302      	lrw      	r0, 0xffc00000	// 590 <__GI_pow+0x3dc>
     31e:	640a      	cmpne      	r2, r0
     320:	0820      	bt      	0x360	// 360 <__GI_pow+0x1ac>
     322:	9840      	ld.w      	r2, (r14, 0x0)
     324:	3adf      	btsti      	r2, 31
     326:	0c08      	bf      	0x336	// 336 <__GI_pow+0x182>
     328:	6c93      	mov      	r2, r4
     32a:	6cc7      	mov      	r3, r1
     32c:	3000      	movi      	r0, 0
     32e:	032a      	lrw      	r1, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     330:	e00009c4 	bsr      	0x16b8	// 16b8 <__divdf3>
     334:	6d03      	mov      	r4, r0
     336:	3edf      	btsti      	r6, 31
     338:	0f62      	bf      	0x1fc	// 1fc <__GI_pow+0x48>
     33a:	036b      	lrw      	r3, 0xc0100000	// 588 <__GI_pow+0x3d4>
     33c:	614c      	addu      	r5, r3
     33e:	9801      	ld.w      	r0, (r14, 0x4)
     340:	6d40      	or      	r5, r0
     342:	3d40      	cmpnei      	r5, 0
     344:	080a      	bt      	0x358	// 358 <__GI_pow+0x1a4>
     346:	6c93      	mov      	r2, r4
     348:	6cc7      	mov      	r3, r1
     34a:	6c0b      	mov      	r0, r2
     34c:	6c4f      	mov      	r1, r3
     34e:	e000087f 	bsr      	0x144c	// 144c <__subdf3>
     352:	6c83      	mov      	r2, r0
     354:	6cc7      	mov      	r3, r1
     356:	07a3      	br      	0x29c	// 29c <__GI_pow+0xe8>
     358:	9841      	ld.w      	r2, (r14, 0x4)
     35a:	3a41      	cmpnei      	r2, 1
     35c:	0b50      	bt      	0x1fc	// 1fc <__GI_pow+0x48>
     35e:	07b6      	br      	0x2ca	// 2ca <__GI_pow+0x116>
     360:	4e5f      	lsri      	r2, r6, 31
     362:	2a00      	subi      	r2, 1
     364:	b847      	st.w      	r2, (r14, 0x1c)
     366:	9807      	ld.w      	r0, (r14, 0x1c)
     368:	9841      	ld.w      	r2, (r14, 0x4)
     36a:	6c80      	or      	r2, r0
     36c:	3a40      	cmpnei      	r2, 0
     36e:	0804      	bt      	0x376	// 376 <__GI_pow+0x1c2>
     370:	6c9f      	mov      	r2, r7
     372:	6cdb      	mov      	r3, r6
     374:	07eb      	br      	0x34a	// 34a <__GI_pow+0x196>
     376:	0357      	lrw      	r2, 0x41e00000	// 594 <__GI_pow+0x3e0>
     378:	64c9      	cmplt      	r2, r3
     37a:	0cbf      	bf      	0x4f8	// 4f8 <__GI_pow+0x344>
     37c:	0358      	lrw      	r2, 0x43f00000	// 598 <__GI_pow+0x3e4>
     37e:	64c9      	cmplt      	r2, r3
     380:	037f      	lrw      	r3, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     382:	0c0c      	bf      	0x39a	// 39a <__GI_pow+0x1e6>
     384:	2b00      	subi      	r3, 1
     386:	654d      	cmplt      	r3, r5
     388:	080f      	bt      	0x3a6	// 3a6 <__GI_pow+0x1f2>
     38a:	9820      	ld.w      	r1, (r14, 0x0)
     38c:	39df      	btsti      	r1, 31
     38e:	0f97      	bf      	0x2bc	// 2bc <__GI_pow+0x108>
     390:	035c      	lrw      	r2, 0x8800759c	// 59c <__GI_pow+0x3e8>
     392:	037b      	lrw      	r3, 0x7e37e43c	// 5a0 <__GI_pow+0x3ec>
     394:	6c0b      	mov      	r0, r2
     396:	6c4f      	mov      	r1, r3
     398:	07a6      	br      	0x2e4	// 2e4 <__GI_pow+0x130>
     39a:	2b01      	subi      	r3, 2
     39c:	654d      	cmplt      	r3, r5
     39e:	0ff6      	bf      	0x38a	// 38a <__GI_pow+0x1d6>
     3a0:	1318      	lrw      	r0, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     3a2:	6541      	cmplt      	r0, r5
     3a4:	0c05      	bf      	0x3ae	// 3ae <__GI_pow+0x1fa>
     3a6:	9800      	ld.w      	r0, (r14, 0x0)
     3a8:	3820      	cmplti      	r0, 1
     3aa:	0ff3      	bf      	0x390	// 390 <__GI_pow+0x1dc>
     3ac:	0788      	br      	0x2bc	// 2bc <__GI_pow+0x108>
     3ae:	3200      	movi      	r2, 0
     3b0:	1374      	lrw      	r3, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     3b2:	6c1f      	mov      	r0, r7
     3b4:	6c5b      	mov      	r1, r6
     3b6:	36c0      	movi      	r6, 192
     3b8:	e000084a 	bsr      	0x144c	// 144c <__subdf3>
     3bc:	4657      	lsli      	r2, r6, 23
     3be:	137a      	lrw      	r3, 0x3ff71547	// 5a4 <__GI_pow+0x3f0>
     3c0:	6d43      	mov      	r5, r0
     3c2:	6d07      	mov      	r4, r1
     3c4:	e0000860 	bsr      	0x1484	// 1484 <__muldf3>
     3c8:	6dc3      	mov      	r7, r0
     3ca:	6d87      	mov      	r6, r1
     3cc:	1357      	lrw      	r2, 0xf85ddf44	// 5a8 <__GI_pow+0x3f4>
     3ce:	1378      	lrw      	r3, 0x3e54ae0b	// 5ac <__GI_pow+0x3f8>
     3d0:	6c17      	mov      	r0, r5
     3d2:	6c53      	mov      	r1, r4
     3d4:	e0000858 	bsr      	0x1484	// 1484 <__muldf3>
     3d8:	b803      	st.w      	r0, (r14, 0xc)
     3da:	b824      	st.w      	r1, (r14, 0x10)
     3dc:	3200      	movi      	r2, 0
     3de:	1375      	lrw      	r3, 0x3fd00000	// 5b0 <__GI_pow+0x3fc>
     3e0:	6c17      	mov      	r0, r5
     3e2:	6c53      	mov      	r1, r4
     3e4:	e0000850 	bsr      	0x1484	// 1484 <__muldf3>
     3e8:	6c83      	mov      	r2, r0
     3ea:	6cc7      	mov      	r3, r1
     3ec:	1312      	lrw      	r0, 0x55555555	// 5b4 <__GI_pow+0x400>
     3ee:	1333      	lrw      	r1, 0x3fd55555	// 5b8 <__GI_pow+0x404>
     3f0:	e000082e 	bsr      	0x144c	// 144c <__subdf3>
     3f4:	6c97      	mov      	r2, r5
     3f6:	6cd3      	mov      	r3, r4
     3f8:	e0000846 	bsr      	0x1484	// 1484 <__muldf3>
     3fc:	6c83      	mov      	r2, r0
     3fe:	6cc7      	mov      	r3, r1
     400:	3000      	movi      	r0, 0
     402:	1323      	lrw      	r1, 0x3fe00000	// 58c <__GI_pow+0x3d8>
     404:	e0000824 	bsr      	0x144c	// 144c <__subdf3>
     408:	b805      	st.w      	r0, (r14, 0x14)
     40a:	6c97      	mov      	r2, r5
     40c:	6cd3      	mov      	r3, r4
     40e:	b826      	st.w      	r1, (r14, 0x18)
     410:	6c17      	mov      	r0, r5
     412:	6c53      	mov      	r1, r4
     414:	e0000838 	bsr      	0x1484	// 1484 <__muldf3>
     418:	6c83      	mov      	r2, r0
     41a:	6cc7      	mov      	r3, r1
     41c:	9805      	ld.w      	r0, (r14, 0x14)
     41e:	9826      	ld.w      	r1, (r14, 0x18)
     420:	e0000832 	bsr      	0x1484	// 1484 <__muldf3>
     424:	1346      	lrw      	r2, 0x652b82fe	// 5bc <__GI_pow+0x408>
     426:	1360      	lrw      	r3, 0x3ff71547	// 5a4 <__GI_pow+0x3f0>
     428:	e000082e 	bsr      	0x1484	// 1484 <__muldf3>
     42c:	6c83      	mov      	r2, r0
     42e:	6cc7      	mov      	r3, r1
     430:	9803      	ld.w      	r0, (r14, 0xc)
     432:	9824      	ld.w      	r1, (r14, 0x10)
     434:	e000080c 	bsr      	0x144c	// 144c <__subdf3>
     438:	6c83      	mov      	r2, r0
     43a:	6cc7      	mov      	r3, r1
     43c:	6d43      	mov      	r5, r0
     43e:	6d07      	mov      	r4, r1
     440:	6c1f      	mov      	r0, r7
     442:	6c5b      	mov      	r1, r6
     444:	e00007ec 	bsr      	0x141c	// 141c <__adddf3>
     448:	6c9f      	mov      	r2, r7
     44a:	6cdb      	mov      	r3, r6
     44c:	3000      	movi      	r0, 0
     44e:	b823      	st.w      	r1, (r14, 0xc)
     450:	e00007fe 	bsr      	0x144c	// 144c <__subdf3>
     454:	6c83      	mov      	r2, r0
     456:	6cc7      	mov      	r3, r1
     458:	6c17      	mov      	r0, r5
     45a:	6c53      	mov      	r1, r4
     45c:	e00007f8 	bsr      	0x144c	// 144c <__subdf3>
     460:	6d07      	mov      	r4, r1
     462:	9821      	ld.w      	r1, (r14, 0x4)
     464:	2900      	subi      	r1, 1
     466:	9847      	ld.w      	r2, (r14, 0x1c)
     468:	6c48      	or      	r1, r2
     46a:	3940      	cmpnei      	r1, 0
     46c:	6d43      	mov      	r5, r0
     46e:	0c02      	bf      	0x472	// 472 <__GI_pow+0x2be>
     470:	05f0      	br      	0x850	// 850 <__GI_pow+0x69c>
     472:	1274      	lrw      	r3, 0xbff00000	// 5c0 <__GI_pow+0x40c>
     474:	b861      	st.w      	r3, (r14, 0x4)
     476:	9860      	ld.w      	r3, (r14, 0x0)
     478:	3200      	movi      	r2, 0
     47a:	9802      	ld.w      	r0, (r14, 0x8)
     47c:	6c4f      	mov      	r1, r3
     47e:	e00007e7 	bsr      	0x144c	// 144c <__subdf3>
     482:	9863      	ld.w      	r3, (r14, 0xc)
     484:	3200      	movi      	r2, 0
     486:	e00007ff 	bsr      	0x1484	// 1484 <__muldf3>
     48a:	6dc3      	mov      	r7, r0
     48c:	6d87      	mov      	r6, r1
     48e:	9842      	ld.w      	r2, (r14, 0x8)
     490:	9860      	ld.w      	r3, (r14, 0x0)
     492:	6c17      	mov      	r0, r5
     494:	6c53      	mov      	r1, r4
     496:	e00007f7 	bsr      	0x1484	// 1484 <__muldf3>
     49a:	6c83      	mov      	r2, r0
     49c:	6cc7      	mov      	r3, r1
     49e:	6c1f      	mov      	r0, r7
     4a0:	6c5b      	mov      	r1, r6
     4a2:	e00007bd 	bsr      	0x141c	// 141c <__adddf3>
     4a6:	6dc3      	mov      	r7, r0
     4a8:	9860      	ld.w      	r3, (r14, 0x0)
     4aa:	6d87      	mov      	r6, r1
     4ac:	3200      	movi      	r2, 0
     4ae:	9823      	ld.w      	r1, (r14, 0xc)
     4b0:	3000      	movi      	r0, 0
     4b2:	e00007e9 	bsr      	0x1484	// 1484 <__muldf3>
     4b6:	b802      	st.w      	r0, (r14, 0x8)
     4b8:	b803      	st.w      	r0, (r14, 0xc)
     4ba:	b824      	st.w      	r1, (r14, 0x10)
     4bc:	6c83      	mov      	r2, r0
     4be:	6cc7      	mov      	r3, r1
     4c0:	6d47      	mov      	r5, r1
     4c2:	6c1f      	mov      	r0, r7
     4c4:	6c5b      	mov      	r1, r6
     4c6:	e00007ab 	bsr      	0x141c	// 141c <__adddf3>
     4ca:	6d07      	mov      	r4, r1
     4cc:	113e      	lrw      	r1, 0x40900000	// 5c4 <__GI_pow+0x410>
     4ce:	2900      	subi      	r1, 1
     4d0:	6505      	cmplt      	r1, r4
     4d2:	b800      	st.w      	r0, (r14, 0x0)
     4d4:	0803      	bt      	0x4da	// 4da <__GI_pow+0x326>
     4d6:	e80002b3 	br      	0xa3c	// a3c <__GI_pow+0x888>
     4da:	117c      	lrw      	r3, 0xbf700000	// 5c8 <__GI_pow+0x414>
     4dc:	60d0      	addu      	r3, r4
     4de:	6cc0      	or      	r3, r0
     4e0:	3b40      	cmpnei      	r3, 0
     4e2:	0802      	bt      	0x4e6	// 4e6 <__GI_pow+0x332>
     4e4:	05b8      	br      	0x854	// 854 <__GI_pow+0x6a0>
     4e6:	114e      	lrw      	r2, 0x8800759c	// 59c <__GI_pow+0x3e8>
     4e8:	116e      	lrw      	r3, 0x7e37e43c	// 5a0 <__GI_pow+0x3ec>
     4ea:	3000      	movi      	r0, 0
     4ec:	9821      	ld.w      	r1, (r14, 0x4)
     4ee:	e00007cb 	bsr      	0x1484	// 1484 <__muldf3>
     4f2:	114b      	lrw      	r2, 0x8800759c	// 59c <__GI_pow+0x3e8>
     4f4:	116b      	lrw      	r3, 0x7e37e43c	// 5a0 <__GI_pow+0x3ec>
     4f6:	06f7      	br      	0x2e4	// 2e4 <__GI_pow+0x130>
     4f8:	11d5      	lrw      	r6, 0xfffff	// 5cc <__GI_pow+0x418>
     4fa:	6559      	cmplt      	r6, r5
     4fc:	09a6      	bt      	0x848	// 848 <__GI_pow+0x694>
     4fe:	6c13      	mov      	r0, r4
     500:	3200      	movi      	r2, 0
     502:	107f      	lrw      	r3, 0x43400000	// 57c <__GI_pow+0x3c8>
     504:	e00007c0 	bsr      	0x1484	// 1484 <__muldf3>
     508:	3700      	movi      	r7, 0
     50a:	6d03      	mov      	r4, r0
     50c:	6d47      	mov      	r5, r1
     50e:	2f34      	subi      	r7, 53
     510:	5514      	asri      	r0, r5, 20
     512:	103d      	lrw      	r1, 0xfffffc01	// 584 <__GI_pow+0x3d0>
     514:	45ac      	lsli      	r5, r5, 12
     516:	4d4c      	lsri      	r2, r5, 12
     518:	6004      	addu      	r0, r1
     51a:	116e      	lrw      	r3, 0x3988e	// 5d0 <__GI_pow+0x41c>
     51c:	601c      	addu      	r0, r7
     51e:	648d      	cmplt      	r3, r2
     520:	10f8      	lrw      	r7, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     522:	b804      	st.w      	r0, (r14, 0x10)
     524:	6dc8      	or      	r7, r2
     526:	0c09      	bf      	0x538	// 538 <__GI_pow+0x384>
     528:	11cb      	lrw      	r6, 0xbb679	// 5d4 <__GI_pow+0x420>
     52a:	6499      	cmplt      	r6, r2
     52c:	0d90      	bf      	0x84c	// 84c <__GI_pow+0x698>
     52e:	6c83      	mov      	r2, r0
     530:	2200      	addi      	r2, 1
     532:	110a      	lrw      	r0, 0xfff00000	// 5d8 <__GI_pow+0x424>
     534:	b844      	st.w      	r2, (r14, 0x10)
     536:	61c0      	addu      	r7, r0
     538:	3500      	movi      	r5, 0
     53a:	45c3      	lsli      	r6, r5, 3
     53c:	1168      	lrw      	r3, 0x95dc	// 5dc <__GI_pow+0x428>
     53e:	4523      	lsli      	r1, r5, 3
     540:	60d8      	addu      	r3, r6
     542:	9340      	ld.w      	r2, (r3, 0x0)
     544:	b828      	st.w      	r1, (r14, 0x20)
     546:	9361      	ld.w      	r3, (r3, 0x4)
     548:	6c13      	mov      	r0, r4
     54a:	6c5f      	mov      	r1, r7
     54c:	b845      	st.w      	r2, (r14, 0x14)
     54e:	b866      	st.w      	r3, (r14, 0x18)
     550:	e000077e 	bsr      	0x144c	// 144c <__subdf3>
     554:	b809      	st.w      	r0, (r14, 0x24)
     556:	9845      	ld.w      	r2, (r14, 0x14)
     558:	9866      	ld.w      	r3, (r14, 0x18)
     55a:	b82a      	st.w      	r1, (r14, 0x28)
     55c:	6c13      	mov      	r0, r4
     55e:	6c5f      	mov      	r1, r7
     560:	e000075e 	bsr      	0x141c	// 141c <__adddf3>
     564:	6c83      	mov      	r2, r0
     566:	6cc7      	mov      	r3, r1
     568:	3000      	movi      	r0, 0
     56a:	1026      	lrw      	r1, 0x3ff00000	// 580 <__GI_pow+0x3cc>
     56c:	e00008a6 	bsr      	0x16b8	// 16b8 <__divdf3>
     570:	6c83      	mov      	r2, r0
     572:	6cc7      	mov      	r3, r1
     574:	0436      	br      	0x5e0	// 5e0 <__GI_pow+0x42c>
     576:	0000      	bkpt
     578:	7ff00000 	.long	0x7ff00000
     57c:	43400000 	.long	0x43400000
     580:	3ff00000 	.long	0x3ff00000
     584:	fffffc01 	.long	0xfffffc01
     588:	c0100000 	.long	0xc0100000
     58c:	3fe00000 	.long	0x3fe00000
     590:	ffc00000 	.long	0xffc00000
     594:	41e00000 	.long	0x41e00000
     598:	43f00000 	.long	0x43f00000
     59c:	8800759c 	.long	0x8800759c
     5a0:	7e37e43c 	.long	0x7e37e43c
     5a4:	3ff71547 	.long	0x3ff71547
     5a8:	f85ddf44 	.long	0xf85ddf44
     5ac:	3e54ae0b 	.long	0x3e54ae0b
     5b0:	3fd00000 	.long	0x3fd00000
     5b4:	55555555 	.long	0x55555555
     5b8:	3fd55555 	.long	0x3fd55555
     5bc:	652b82fe 	.long	0x652b82fe
     5c0:	bff00000 	.long	0xbff00000
     5c4:	40900000 	.long	0x40900000
     5c8:	bf700000 	.long	0xbf700000
     5cc:	000fffff 	.long	0x000fffff
     5d0:	0003988e 	.long	0x0003988e
     5d4:	000bb679 	.long	0x000bb679
     5d8:	fff00000 	.long	0xfff00000
     5dc:	000095dc 	.long	0x000095dc
     5e0:	b80b      	st.w      	r0, (r14, 0x2c)
     5e2:	b82c      	st.w      	r1, (r14, 0x30)
     5e4:	9809      	ld.w      	r0, (r14, 0x24)
     5e6:	982a      	ld.w      	r1, (r14, 0x28)
     5e8:	e000074e 	bsr      	0x1484	// 1484 <__muldf3>
     5ec:	b803      	st.w      	r0, (r14, 0xc)
     5ee:	3280      	movi      	r2, 128
     5f0:	5701      	asri      	r0, r7, 1
     5f2:	6d87      	mov      	r6, r1
     5f4:	38bd      	bseti      	r0, 29
     5f6:	422c      	lsli      	r1, r2, 12
     5f8:	6004      	addu      	r0, r1
     5fa:	45b2      	lsli      	r5, r5, 18
     5fc:	6140      	addu      	r5, r0
     5fe:	6cd7      	mov      	r3, r5
     600:	3200      	movi      	r2, 0
     602:	6c5b      	mov      	r1, r6
     604:	3000      	movi      	r0, 0
     606:	e000073f 	bsr      	0x1484	// 1484 <__muldf3>
     60a:	6c83      	mov      	r2, r0
     60c:	6cc7      	mov      	r3, r1
     60e:	9809      	ld.w      	r0, (r14, 0x24)
     610:	982a      	ld.w      	r1, (r14, 0x28)
     612:	e000071d 	bsr      	0x144c	// 144c <__subdf3>
     616:	b809      	st.w      	r0, (r14, 0x24)
     618:	9845      	ld.w      	r2, (r14, 0x14)
     61a:	9866      	ld.w      	r3, (r14, 0x18)
     61c:	b82a      	st.w      	r1, (r14, 0x28)
     61e:	3000      	movi      	r0, 0
     620:	6c57      	mov      	r1, r5
     622:	e0000715 	bsr      	0x144c	// 144c <__subdf3>
     626:	6c83      	mov      	r2, r0
     628:	6cc7      	mov      	r3, r1
     62a:	6c13      	mov      	r0, r4
     62c:	6c5f      	mov      	r1, r7
     62e:	e000070f 	bsr      	0x144c	// 144c <__subdf3>
     632:	6cdb      	mov      	r3, r6
     634:	3200      	movi      	r2, 0
     636:	e0000727 	bsr      	0x1484	// 1484 <__muldf3>
     63a:	6c83      	mov      	r2, r0
     63c:	6cc7      	mov      	r3, r1
     63e:	9809      	ld.w      	r0, (r14, 0x24)
     640:	982a      	ld.w      	r1, (r14, 0x28)
     642:	e0000705 	bsr      	0x144c	// 144c <__subdf3>
     646:	984b      	ld.w      	r2, (r14, 0x2c)
     648:	986c      	ld.w      	r3, (r14, 0x30)
     64a:	e000071d 	bsr      	0x1484	// 1484 <__muldf3>
     64e:	9843      	ld.w      	r2, (r14, 0xc)
     650:	6cdb      	mov      	r3, r6
     652:	b805      	st.w      	r0, (r14, 0x14)
     654:	b826      	st.w      	r1, (r14, 0x18)
     656:	6c0b      	mov      	r0, r2
     658:	6c5b      	mov      	r1, r6
     65a:	e0000715 	bsr      	0x1484	// 1484 <__muldf3>
     65e:	ea820113 	lrw      	r2, 0x4a454eef	// aa8 <__GI_pow+0x8f4>
     662:	ea830113 	lrw      	r3, 0x3fca7e28	// aac <__GI_pow+0x8f8>
     666:	6d43      	mov      	r5, r0
     668:	6d07      	mov      	r4, r1
     66a:	e000070d 	bsr      	0x1484	// 1484 <__muldf3>
     66e:	ea820111 	lrw      	r2, 0x93c9db65	// ab0 <__GI_pow+0x8fc>
     672:	ea830111 	lrw      	r3, 0x3fcd864a	// ab4 <__GI_pow+0x900>
     676:	e00006d3 	bsr      	0x141c	// 141c <__adddf3>
     67a:	6c97      	mov      	r2, r5
     67c:	6cd3      	mov      	r3, r4
     67e:	e0000703 	bsr      	0x1484	// 1484 <__muldf3>
     682:	ea82010e 	lrw      	r2, 0xa91d4101	// ab8 <__GI_pow+0x904>
     686:	ea83010e 	lrw      	r3, 0x3fd17460	// abc <__GI_pow+0x908>
     68a:	e00006c9 	bsr      	0x141c	// 141c <__adddf3>
     68e:	6c97      	mov      	r2, r5
     690:	6cd3      	mov      	r3, r4
     692:	e00006f9 	bsr      	0x1484	// 1484 <__muldf3>
     696:	ea82010b 	lrw      	r2, 0x518f264d	// ac0 <__GI_pow+0x90c>
     69a:	ea83010b 	lrw      	r3, 0x3fd55555	// ac4 <__GI_pow+0x910>
     69e:	e00006bf 	bsr      	0x141c	// 141c <__adddf3>
     6a2:	6c97      	mov      	r2, r5
     6a4:	6cd3      	mov      	r3, r4
     6a6:	e00006ef 	bsr      	0x1484	// 1484 <__muldf3>
     6aa:	ea820108 	lrw      	r2, 0xdb6fabff	// ac8 <__GI_pow+0x914>
     6ae:	ea830108 	lrw      	r3, 0x3fdb6db6	// acc <__GI_pow+0x918>
     6b2:	e00006b5 	bsr      	0x141c	// 141c <__adddf3>
     6b6:	6c97      	mov      	r2, r5
     6b8:	6cd3      	mov      	r3, r4
     6ba:	e00006e5 	bsr      	0x1484	// 1484 <__muldf3>
     6be:	ea820105 	lrw      	r2, 0x33333303	// ad0 <__GI_pow+0x91c>
     6c2:	ea830105 	lrw      	r3, 0x3fe33333	// ad4 <__GI_pow+0x920>
     6c6:	e00006ab 	bsr      	0x141c	// 141c <__adddf3>
     6ca:	6dc3      	mov      	r7, r0
     6cc:	6c97      	mov      	r2, r5
     6ce:	6cd3      	mov      	r3, r4
     6d0:	b829      	st.w      	r1, (r14, 0x24)
     6d2:	6c17      	mov      	r0, r5
     6d4:	6c53      	mov      	r1, r4
     6d6:	e00006d7 	bsr      	0x1484	// 1484 <__muldf3>
     6da:	6c83      	mov      	r2, r0
     6dc:	6cc7      	mov      	r3, r1
     6de:	6c1f      	mov      	r0, r7
     6e0:	9829      	ld.w      	r1, (r14, 0x24)
     6e2:	e00006d1 	bsr      	0x1484	// 1484 <__muldf3>
     6e6:	6d43      	mov      	r5, r0
     6e8:	6d07      	mov      	r4, r1
     6ea:	6cdb      	mov      	r3, r6
     6ec:	3200      	movi      	r2, 0
     6ee:	9803      	ld.w      	r0, (r14, 0xc)
     6f0:	6c5b      	mov      	r1, r6
     6f2:	e0000695 	bsr      	0x141c	// 141c <__adddf3>
     6f6:	9845      	ld.w      	r2, (r14, 0x14)
     6f8:	9866      	ld.w      	r3, (r14, 0x18)
     6fa:	e00006c5 	bsr      	0x1484	// 1484 <__muldf3>
     6fe:	6c97      	mov      	r2, r5
     700:	6cd3      	mov      	r3, r4
     702:	e000068d 	bsr      	0x141c	// 141c <__adddf3>
     706:	6d43      	mov      	r5, r0
     708:	6cdb      	mov      	r3, r6
     70a:	b829      	st.w      	r1, (r14, 0x24)
     70c:	3200      	movi      	r2, 0
     70e:	6c5b      	mov      	r1, r6
     710:	3000      	movi      	r0, 0
     712:	e00006b9 	bsr      	0x1484	// 1484 <__muldf3>
     716:	3200      	movi      	r2, 0
     718:	006f      	lrw      	r3, 0x40080000	// ad8 <__GI_pow+0x924>
     71a:	6dc3      	mov      	r7, r0
     71c:	b82a      	st.w      	r1, (r14, 0x28)
     71e:	e000067f 	bsr      	0x141c	// 141c <__adddf3>
     722:	6c97      	mov      	r2, r5
     724:	9869      	ld.w      	r3, (r14, 0x24)
     726:	e000067b 	bsr      	0x141c	// 141c <__adddf3>
     72a:	6d07      	mov      	r4, r1
     72c:	6cc7      	mov      	r3, r1
     72e:	3200      	movi      	r2, 0
     730:	6c5b      	mov      	r1, r6
     732:	3000      	movi      	r0, 0
     734:	e00006a8 	bsr      	0x1484	// 1484 <__muldf3>
     738:	b80b      	st.w      	r0, (r14, 0x2c)
     73a:	b82c      	st.w      	r1, (r14, 0x30)
     73c:	3200      	movi      	r2, 0
     73e:	0078      	lrw      	r3, 0x40080000	// ad8 <__GI_pow+0x924>
     740:	6c53      	mov      	r1, r4
     742:	3000      	movi      	r0, 0
     744:	e0000684 	bsr      	0x144c	// 144c <__subdf3>
     748:	6c9f      	mov      	r2, r7
     74a:	986a      	ld.w      	r3, (r14, 0x28)
     74c:	e0000680 	bsr      	0x144c	// 144c <__subdf3>
     750:	6c83      	mov      	r2, r0
     752:	6cc7      	mov      	r3, r1
     754:	6c17      	mov      	r0, r5
     756:	9829      	ld.w      	r1, (r14, 0x24)
     758:	e000067a 	bsr      	0x144c	// 144c <__subdf3>
     75c:	9843      	ld.w      	r2, (r14, 0xc)
     75e:	6cdb      	mov      	r3, r6
     760:	e0000692 	bsr      	0x1484	// 1484 <__muldf3>
     764:	6d83      	mov      	r6, r0
     766:	6d47      	mov      	r5, r1
     768:	6cd3      	mov      	r3, r4
     76a:	3200      	movi      	r2, 0
     76c:	9805      	ld.w      	r0, (r14, 0x14)
     76e:	9826      	ld.w      	r1, (r14, 0x18)
     770:	e000068a 	bsr      	0x1484	// 1484 <__muldf3>
     774:	6c83      	mov      	r2, r0
     776:	6cc7      	mov      	r3, r1
     778:	6c1b      	mov      	r0, r6
     77a:	6c57      	mov      	r1, r5
     77c:	e0000650 	bsr      	0x141c	// 141c <__adddf3>
     780:	6dc3      	mov      	r7, r0
     782:	6d87      	mov      	r6, r1
     784:	6c83      	mov      	r2, r0
     786:	6cc7      	mov      	r3, r1
     788:	980b      	ld.w      	r0, (r14, 0x2c)
     78a:	982c      	ld.w      	r1, (r14, 0x30)
     78c:	e0000648 	bsr      	0x141c	// 141c <__adddf3>
     790:	33e0      	movi      	r3, 224
     792:	4358      	lsli      	r2, r3, 24
     794:	3000      	movi      	r0, 0
     796:	016d      	lrw      	r3, 0x3feec709	// adc <__GI_pow+0x928>
     798:	6d07      	mov      	r4, r1
     79a:	e0000675 	bsr      	0x1484	// 1484 <__muldf3>
     79e:	b805      	st.w      	r0, (r14, 0x14)
     7a0:	b826      	st.w      	r1, (r14, 0x18)
     7a2:	984b      	ld.w      	r2, (r14, 0x2c)
     7a4:	986c      	ld.w      	r3, (r14, 0x30)
     7a6:	6c53      	mov      	r1, r4
     7a8:	3000      	movi      	r0, 0
     7aa:	e0000651 	bsr      	0x144c	// 144c <__subdf3>
     7ae:	6c83      	mov      	r2, r0
     7b0:	6cc7      	mov      	r3, r1
     7b2:	6c1f      	mov      	r0, r7
     7b4:	6c5b      	mov      	r1, r6
     7b6:	e000064b 	bsr      	0x144c	// 144c <__subdf3>
     7ba:	0155      	lrw      	r2, 0xdc3a03fd	// ae0 <__GI_pow+0x92c>
     7bc:	0177      	lrw      	r3, 0x3feec709	// adc <__GI_pow+0x928>
     7be:	e0000663 	bsr      	0x1484	// 1484 <__muldf3>
     7c2:	6dc3      	mov      	r7, r0
     7c4:	6d47      	mov      	r5, r1
     7c6:	0157      	lrw      	r2, 0x145b01f5	// ae4 <__GI_pow+0x930>
     7c8:	0177      	lrw      	r3, 0xbe3e2fe0	// ae8 <__GI_pow+0x934>
     7ca:	6c53      	mov      	r1, r4
     7cc:	3000      	movi      	r0, 0
     7ce:	e000065b 	bsr      	0x1484	// 1484 <__muldf3>
     7d2:	6c83      	mov      	r2, r0
     7d4:	6cc7      	mov      	r3, r1
     7d6:	6c1f      	mov      	r0, r7
     7d8:	6c57      	mov      	r1, r5
     7da:	e0000621 	bsr      	0x141c	// 141c <__adddf3>
     7de:	01db      	lrw      	r6, 0x95dc	// aec <__GI_pow+0x938>
     7e0:	9848      	ld.w      	r2, (r14, 0x20)
     7e2:	6188      	addu      	r6, r2
     7e4:	9644      	ld.w      	r2, (r6, 0x10)
     7e6:	9665      	ld.w      	r3, (r6, 0x14)
     7e8:	e000061a 	bsr      	0x141c	// 141c <__adddf3>
     7ec:	b809      	st.w      	r0, (r14, 0x24)
     7ee:	9804      	ld.w      	r0, (r14, 0x10)
     7f0:	b82a      	st.w      	r1, (r14, 0x28)
     7f2:	e0000867 	bsr      	0x18c0	// 18c0 <__floatsidf>
     7f6:	6d83      	mov      	r6, r0
     7f8:	0202      	lrw      	r0, 0x95dc	// aec <__GI_pow+0x938>
     7fa:	6d47      	mov      	r5, r1
     7fc:	201f      	addi      	r0, 32
     7fe:	9828      	ld.w      	r1, (r14, 0x20)
     800:	6004      	addu      	r0, r1
     802:	9080      	ld.w      	r4, (r0, 0x0)
     804:	90e1      	ld.w      	r7, (r0, 0x4)
     806:	9849      	ld.w      	r2, (r14, 0x24)
     808:	986a      	ld.w      	r3, (r14, 0x28)
     80a:	9805      	ld.w      	r0, (r14, 0x14)
     80c:	9826      	ld.w      	r1, (r14, 0x18)
     80e:	e0000607 	bsr      	0x141c	// 141c <__adddf3>
     812:	6c93      	mov      	r2, r4
     814:	6cdf      	mov      	r3, r7
     816:	e0000603 	bsr      	0x141c	// 141c <__adddf3>
     81a:	6c9b      	mov      	r2, r6
     81c:	6cd7      	mov      	r3, r5
     81e:	e00005ff 	bsr      	0x141c	// 141c <__adddf3>
     822:	6c9b      	mov      	r2, r6
     824:	6cd7      	mov      	r3, r5
     826:	3000      	movi      	r0, 0
     828:	b823      	st.w      	r1, (r14, 0xc)
     82a:	e0000611 	bsr      	0x144c	// 144c <__subdf3>
     82e:	6c93      	mov      	r2, r4
     830:	6cdf      	mov      	r3, r7
     832:	e000060d 	bsr      	0x144c	// 144c <__subdf3>
     836:	9845      	ld.w      	r2, (r14, 0x14)
     838:	9866      	ld.w      	r3, (r14, 0x18)
     83a:	e0000609 	bsr      	0x144c	// 144c <__subdf3>
     83e:	6c83      	mov      	r2, r0
     840:	6cc7      	mov      	r3, r1
     842:	9809      	ld.w      	r0, (r14, 0x24)
     844:	982a      	ld.w      	r1, (r14, 0x28)
     846:	060b      	br      	0x45c	// 45c <__GI_pow+0x2a8>
     848:	3700      	movi      	r7, 0
     84a:	0663      	br      	0x510	// 510 <__GI_pow+0x35c>
     84c:	3501      	movi      	r5, 1
     84e:	0676      	br      	0x53a	// 53a <__GI_pow+0x386>
     850:	0277      	lrw      	r3, 0x3ff00000	// af0 <__GI_pow+0x93c>
     852:	0611      	br      	0x474	// 474 <__GI_pow+0x2c0>
     854:	0257      	lrw      	r2, 0x652b82fe	// af4 <__GI_pow+0x940>
     856:	0276      	lrw      	r3, 0x3c971547	// af8 <__GI_pow+0x944>
     858:	6c1f      	mov      	r0, r7
     85a:	6c5b      	mov      	r1, r6
     85c:	e00005e0 	bsr      	0x141c	// 141c <__adddf3>
     860:	b805      	st.w      	r0, (r14, 0x14)
     862:	b826      	st.w      	r1, (r14, 0x18)
     864:	9842      	ld.w      	r2, (r14, 0x8)
     866:	6cd7      	mov      	r3, r5
     868:	9800      	ld.w      	r0, (r14, 0x0)
     86a:	6c53      	mov      	r1, r4
     86c:	e00005f0 	bsr      	0x144c	// 144c <__subdf3>
     870:	6c83      	mov      	r2, r0
     872:	6cc7      	mov      	r3, r1
     874:	9805      	ld.w      	r0, (r14, 0x14)
     876:	9826      	ld.w      	r1, (r14, 0x18)
     878:	e00007ca 	bsr      	0x180c	// 180c <__gtdf2>
     87c:	3820      	cmplti      	r0, 1
     87e:	0802      	bt      	0x882	// 882 <__GI_pow+0x6ce>
     880:	0633      	br      	0x4e6	// 4e6 <__GI_pow+0x332>
     882:	4421      	lsli      	r1, r4, 1
     884:	4901      	lsri      	r0, r1, 1
     886:	0361      	lrw      	r3, 0x3fe00000	// afc <__GI_pow+0x948>
     888:	640d      	cmplt      	r3, r0
     88a:	0cfd      	bf      	0xa84	// a84 <__GI_pow+0x8d0>
     88c:	5034      	asri      	r1, r0, 20
     88e:	0342      	lrw      	r2, 0xfffffc02	// b00 <__GI_pow+0x94c>
     890:	3080      	movi      	r0, 128
     892:	6048      	addu      	r1, r2
     894:	404d      	lsli      	r2, r0, 13
     896:	7086      	asr      	r2, r1
     898:	6090      	addu      	r2, r4
     89a:	4261      	lsli      	r3, r2, 1
     89c:	4b35      	lsri      	r1, r3, 21
     89e:	0305      	lrw      	r0, 0xfffffc01	// b04 <__GI_pow+0x950>
     8a0:	6040      	addu      	r1, r0
     8a2:	0365      	lrw      	r3, 0xfffff	// b08 <__GI_pow+0x954>
     8a4:	70c6      	asr      	r3, r1
     8a6:	6c0b      	mov      	r0, r2
     8a8:	680d      	andn      	r0, r3
     8aa:	424c      	lsli      	r2, r2, 12
     8ac:	6cc3      	mov      	r3, r0
     8ae:	4a4c      	lsri      	r2, r2, 12
     8b0:	3014      	movi      	r0, 20
     8b2:	3ab4      	bseti      	r2, 20
     8b4:	5825      	subu      	r1, r0, r1
     8b6:	7086      	asr      	r2, r1
     8b8:	3cdf      	btsti      	r4, 31
     8ba:	b840      	st.w      	r2, (r14, 0x0)
     8bc:	0c05      	bf      	0x8c6	// 8c6 <__GI_pow+0x712>
     8be:	9840      	ld.w      	r2, (r14, 0x0)
     8c0:	3400      	movi      	r4, 0
     8c2:	610a      	subu      	r4, r2
     8c4:	b880      	st.w      	r4, (r14, 0x0)
     8c6:	3200      	movi      	r2, 0
     8c8:	9802      	ld.w      	r0, (r14, 0x8)
     8ca:	6c57      	mov      	r1, r5
     8cc:	e00005c0 	bsr      	0x144c	// 144c <__subdf3>
     8d0:	b803      	st.w      	r0, (r14, 0xc)
     8d2:	b824      	st.w      	r1, (r14, 0x10)
     8d4:	9803      	ld.w      	r0, (r14, 0xc)
     8d6:	6c9f      	mov      	r2, r7
     8d8:	6cdb      	mov      	r3, r6
     8da:	9824      	ld.w      	r1, (r14, 0x10)
     8dc:	e00005a0 	bsr      	0x141c	// 141c <__adddf3>
     8e0:	3200      	movi      	r2, 0
     8e2:	0374      	lrw      	r3, 0x3fe62e43	// b0c <__GI_pow+0x958>
     8e4:	3000      	movi      	r0, 0
     8e6:	6d07      	mov      	r4, r1
     8e8:	e00005ce 	bsr      	0x1484	// 1484 <__muldf3>
     8ec:	6d47      	mov      	r5, r1
     8ee:	9843      	ld.w      	r2, (r14, 0xc)
     8f0:	9864      	ld.w      	r3, (r14, 0x10)
     8f2:	b802      	st.w      	r0, (r14, 0x8)
     8f4:	6c53      	mov      	r1, r4
     8f6:	3000      	movi      	r0, 0
     8f8:	e00005aa 	bsr      	0x144c	// 144c <__subdf3>
     8fc:	6c83      	mov      	r2, r0
     8fe:	6cc7      	mov      	r3, r1
     900:	6c1f      	mov      	r0, r7
     902:	6c5b      	mov      	r1, r6
     904:	e00005a4 	bsr      	0x144c	// 144c <__subdf3>
     908:	035d      	lrw      	r2, 0xfefa39ef	// b10 <__GI_pow+0x95c>
     90a:	037c      	lrw      	r3, 0x3fe62e42	// b14 <__GI_pow+0x960>
     90c:	e00005bc 	bsr      	0x1484	// 1484 <__muldf3>
     910:	6dc3      	mov      	r7, r0
     912:	6d87      	mov      	r6, r1
     914:	035e      	lrw      	r2, 0xca86c39	// b18 <__GI_pow+0x964>
     916:	037d      	lrw      	r3, 0xbe205c61	// b1c <__GI_pow+0x968>
     918:	6c53      	mov      	r1, r4
     91a:	3000      	movi      	r0, 0
     91c:	e00005b4 	bsr      	0x1484	// 1484 <__muldf3>
     920:	6c83      	mov      	r2, r0
     922:	6cc7      	mov      	r3, r1
     924:	6c1f      	mov      	r0, r7
     926:	6c5b      	mov      	r1, r6
     928:	e000057a 	bsr      	0x141c	// 141c <__adddf3>
     92c:	6d07      	mov      	r4, r1
     92e:	6c83      	mov      	r2, r0
     930:	6cc7      	mov      	r3, r1
     932:	b803      	st.w      	r0, (r14, 0xc)
     934:	6c57      	mov      	r1, r5
     936:	9802      	ld.w      	r0, (r14, 0x8)
     938:	e0000572 	bsr      	0x141c	// 141c <__adddf3>
     93c:	9842      	ld.w      	r2, (r14, 0x8)
     93e:	6cd7      	mov      	r3, r5
     940:	6dc3      	mov      	r7, r0
     942:	6d87      	mov      	r6, r1
     944:	e0000584 	bsr      	0x144c	// 144c <__subdf3>
     948:	6c83      	mov      	r2, r0
     94a:	6cc7      	mov      	r3, r1
     94c:	9803      	ld.w      	r0, (r14, 0xc)
     94e:	6c53      	mov      	r1, r4
     950:	e000057e 	bsr      	0x144c	// 144c <__subdf3>
     954:	b802      	st.w      	r0, (r14, 0x8)
     956:	b823      	st.w      	r1, (r14, 0xc)
     958:	6c9f      	mov      	r2, r7
     95a:	6cdb      	mov      	r3, r6
     95c:	6c1f      	mov      	r0, r7
     95e:	6c5b      	mov      	r1, r6
     960:	e0000592 	bsr      	0x1484	// 1484 <__muldf3>
     964:	134f      	lrw      	r2, 0x72bea4d0	// b20 <__GI_pow+0x96c>
     966:	1370      	lrw      	r3, 0x3e663769	// b24 <__GI_pow+0x970>
     968:	6d43      	mov      	r5, r0
     96a:	6d07      	mov      	r4, r1
     96c:	e000058c 	bsr      	0x1484	// 1484 <__muldf3>
     970:	134e      	lrw      	r2, 0xc5d26bf1	// b28 <__GI_pow+0x974>
     972:	136f      	lrw      	r3, 0x3ebbbd41	// b2c <__GI_pow+0x978>
     974:	e000056c 	bsr      	0x144c	// 144c <__subdf3>
     978:	6c97      	mov      	r2, r5
     97a:	6cd3      	mov      	r3, r4
     97c:	e0000584 	bsr      	0x1484	// 1484 <__muldf3>
     980:	134c      	lrw      	r2, 0xaf25de2c	// b30 <__GI_pow+0x97c>
     982:	136d      	lrw      	r3, 0x3f11566a	// b34 <__GI_pow+0x980>
     984:	e000054c 	bsr      	0x141c	// 141c <__adddf3>
     988:	6c97      	mov      	r2, r5
     98a:	6cd3      	mov      	r3, r4
     98c:	e000057c 	bsr      	0x1484	// 1484 <__muldf3>
     990:	134a      	lrw      	r2, 0x16bebd93	// b38 <__GI_pow+0x984>
     992:	136b      	lrw      	r3, 0x3f66c16c	// b3c <__GI_pow+0x988>
     994:	e000055c 	bsr      	0x144c	// 144c <__subdf3>
     998:	6c97      	mov      	r2, r5
     99a:	6cd3      	mov      	r3, r4
     99c:	e0000574 	bsr      	0x1484	// 1484 <__muldf3>
     9a0:	1348      	lrw      	r2, 0x5555553e	// b40 <__GI_pow+0x98c>
     9a2:	1369      	lrw      	r3, 0x3fc55555	// b44 <__GI_pow+0x990>
     9a4:	e000053c 	bsr      	0x141c	// 141c <__adddf3>
     9a8:	6c97      	mov      	r2, r5
     9aa:	6cd3      	mov      	r3, r4
     9ac:	e000056c 	bsr      	0x1484	// 1484 <__muldf3>
     9b0:	6c83      	mov      	r2, r0
     9b2:	6cc7      	mov      	r3, r1
     9b4:	6c1f      	mov      	r0, r7
     9b6:	6c5b      	mov      	r1, r6
     9b8:	e000054a 	bsr      	0x144c	// 144c <__subdf3>
     9bc:	6d43      	mov      	r5, r0
     9be:	6d07      	mov      	r4, r1
     9c0:	6c83      	mov      	r2, r0
     9c2:	6cc7      	mov      	r3, r1
     9c4:	6c1f      	mov      	r0, r7
     9c6:	6c5b      	mov      	r1, r6
     9c8:	e000055e 	bsr      	0x1484	// 1484 <__muldf3>
     9cc:	3380      	movi      	r3, 128
     9ce:	b804      	st.w      	r0, (r14, 0x10)
     9d0:	b825      	st.w      	r1, (r14, 0x14)
     9d2:	3200      	movi      	r2, 0
     9d4:	4377      	lsli      	r3, r3, 23
     9d6:	6c17      	mov      	r0, r5
     9d8:	6c53      	mov      	r1, r4
     9da:	e0000539 	bsr      	0x144c	// 144c <__subdf3>
     9de:	6c83      	mov      	r2, r0
     9e0:	6cc7      	mov      	r3, r1
     9e2:	9804      	ld.w      	r0, (r14, 0x10)
     9e4:	9825      	ld.w      	r1, (r14, 0x14)
     9e6:	e0000669 	bsr      	0x16b8	// 16b8 <__divdf3>
     9ea:	6d07      	mov      	r4, r1
     9ec:	6d43      	mov      	r5, r0
     9ee:	9842      	ld.w      	r2, (r14, 0x8)
     9f0:	9863      	ld.w      	r3, (r14, 0xc)
     9f2:	6c1f      	mov      	r0, r7
     9f4:	6c5b      	mov      	r1, r6
     9f6:	e0000547 	bsr      	0x1484	// 1484 <__muldf3>
     9fa:	9842      	ld.w      	r2, (r14, 0x8)
     9fc:	9863      	ld.w      	r3, (r14, 0xc)
     9fe:	e000050f 	bsr      	0x141c	// 141c <__adddf3>
     a02:	6c83      	mov      	r2, r0
     a04:	6cc7      	mov      	r3, r1
     a06:	6c17      	mov      	r0, r5
     a08:	6c53      	mov      	r1, r4
     a0a:	e0000521 	bsr      	0x144c	// 144c <__subdf3>
     a0e:	6c9f      	mov      	r2, r7
     a10:	6cdb      	mov      	r3, r6
     a12:	e000051d 	bsr      	0x144c	// 144c <__subdf3>
     a16:	6c83      	mov      	r2, r0
     a18:	6cc7      	mov      	r3, r1
     a1a:	3000      	movi      	r0, 0
     a1c:	1135      	lrw      	r1, 0x3ff00000	// af0 <__GI_pow+0x93c>
     a1e:	e0000517 	bsr      	0x144c	// 144c <__subdf3>
     a22:	9840      	ld.w      	r2, (r14, 0x0)
     a24:	4274      	lsli      	r3, r2, 20
     a26:	60c4      	addu      	r3, r1
     a28:	5394      	asri      	r4, r3, 20
     a2a:	3c20      	cmplti      	r4, 1
     a2c:	0c2f      	bf      	0xa8a	// a8a <__GI_pow+0x8d6>
     a2e:	9840      	ld.w      	r2, (r14, 0x0)
     a30:	e000009a 	bsr      	0xb64	// b64 <__GI_scalbn>
     a34:	3200      	movi      	r2, 0
     a36:	9861      	ld.w      	r3, (r14, 0x4)
     a38:	e800fc56 	br      	0x2e4	// 2e4 <__GI_pow+0x130>
     a3c:	4401      	lsli      	r0, r4, 1
     a3e:	4861      	lsri      	r3, r0, 1
     a40:	1242      	lrw      	r2, 0x4090cbff	// b48 <__GI_pow+0x994>
     a42:	64c9      	cmplt      	r2, r3
     a44:	0f1f      	bf      	0x882	// 882 <__GI_pow+0x6ce>
     a46:	1222      	lrw      	r1, 0x3f6f3400	// b4c <__GI_pow+0x998>
     a48:	6050      	addu      	r1, r4
     a4a:	9800      	ld.w      	r0, (r14, 0x0)
     a4c:	6c40      	or      	r1, r0
     a4e:	3940      	cmpnei      	r1, 0
     a50:	0c0b      	bf      	0xa66	// a66 <__GI_pow+0x8b2>
     a52:	1240      	lrw      	r2, 0xc2f8f359	// b50 <__GI_pow+0x99c>
     a54:	1260      	lrw      	r3, 0x1a56e1f	// b54 <__GI_pow+0x9a0>
     a56:	3000      	movi      	r0, 0
     a58:	9821      	ld.w      	r1, (r14, 0x4)
     a5a:	e0000515 	bsr      	0x1484	// 1484 <__muldf3>
     a5e:	115d      	lrw      	r2, 0xc2f8f359	// b50 <__GI_pow+0x99c>
     a60:	117d      	lrw      	r3, 0x1a56e1f	// b54 <__GI_pow+0x9a0>
     a62:	e800fc41 	br      	0x2e4	// 2e4 <__GI_pow+0x130>
     a66:	9842      	ld.w      	r2, (r14, 0x8)
     a68:	6cd7      	mov      	r3, r5
     a6a:	9800      	ld.w      	r0, (r14, 0x0)
     a6c:	6c53      	mov      	r1, r4
     a6e:	e00004ef 	bsr      	0x144c	// 144c <__subdf3>
     a72:	6c83      	mov      	r2, r0
     a74:	6cc7      	mov      	r3, r1
     a76:	6c1f      	mov      	r0, r7
     a78:	6c5b      	mov      	r1, r6
     a7a:	e0000705 	bsr      	0x1884	// 1884 <__ledf2>
     a7e:	3820      	cmplti      	r0, 1
     a80:	0f01      	bf      	0x882	// 882 <__GI_pow+0x6ce>
     a82:	07e8      	br      	0xa52	// a52 <__GI_pow+0x89e>
     a84:	3500      	movi      	r5, 0
     a86:	b8a0      	st.w      	r5, (r14, 0x0)
     a88:	0726      	br      	0x8d4	// 8d4 <__GI_pow+0x720>
     a8a:	6c4f      	mov      	r1, r3
     a8c:	07d4      	br      	0xa34	// a34 <__GI_pow+0x880>
     a8e:	3400      	movi      	r4, 0
     a90:	1038      	lrw      	r1, 0x3ff00000	// af0 <__GI_pow+0x93c>
     a92:	e800fbb5 	br      	0x1fc	// 1fc <__GI_pow+0x48>
     a96:	3400      	movi      	r4, 0
     a98:	9820      	ld.w      	r1, (r14, 0x0)
     a9a:	e800fbb1 	br      	0x1fc	// 1fc <__GI_pow+0x48>
     a9e:	6d1f      	mov      	r4, r7
     aa0:	6c5b      	mov      	r1, r6
     aa2:	e800fbad 	br      	0x1fc	// 1fc <__GI_pow+0x48>
     aa6:	0000      	bkpt
     aa8:	4a454eef 	.long	0x4a454eef
     aac:	3fca7e28 	.long	0x3fca7e28
     ab0:	93c9db65 	.long	0x93c9db65
     ab4:	3fcd864a 	.long	0x3fcd864a
     ab8:	a91d4101 	.long	0xa91d4101
     abc:	3fd17460 	.long	0x3fd17460
     ac0:	518f264d 	.long	0x518f264d
     ac4:	3fd55555 	.long	0x3fd55555
     ac8:	db6fabff 	.long	0xdb6fabff
     acc:	3fdb6db6 	.long	0x3fdb6db6
     ad0:	33333303 	.long	0x33333303
     ad4:	3fe33333 	.long	0x3fe33333
     ad8:	40080000 	.long	0x40080000
     adc:	3feec709 	.long	0x3feec709
     ae0:	dc3a03fd 	.long	0xdc3a03fd
     ae4:	145b01f5 	.long	0x145b01f5
     ae8:	be3e2fe0 	.long	0xbe3e2fe0
     aec:	000095dc 	.long	0x000095dc
     af0:	3ff00000 	.long	0x3ff00000
     af4:	652b82fe 	.long	0x652b82fe
     af8:	3c971547 	.long	0x3c971547
     afc:	3fe00000 	.long	0x3fe00000
     b00:	fffffc02 	.long	0xfffffc02
     b04:	fffffc01 	.long	0xfffffc01
     b08:	000fffff 	.long	0x000fffff
     b0c:	3fe62e43 	.long	0x3fe62e43
     b10:	fefa39ef 	.long	0xfefa39ef
     b14:	3fe62e42 	.long	0x3fe62e42
     b18:	0ca86c39 	.long	0x0ca86c39
     b1c:	be205c61 	.long	0xbe205c61
     b20:	72bea4d0 	.long	0x72bea4d0
     b24:	3e663769 	.long	0x3e663769
     b28:	c5d26bf1 	.long	0xc5d26bf1
     b2c:	3ebbbd41 	.long	0x3ebbbd41
     b30:	af25de2c 	.long	0xaf25de2c
     b34:	3f11566a 	.long	0x3f11566a
     b38:	16bebd93 	.long	0x16bebd93
     b3c:	3f66c16c 	.long	0x3f66c16c
     b40:	5555553e 	.long	0x5555553e
     b44:	3fc55555 	.long	0x3fc55555
     b48:	4090cbff 	.long	0x4090cbff
     b4c:	3f6f3400 	.long	0x3f6f3400
     b50:	c2f8f359 	.long	0xc2f8f359
     b54:	01a56e1f 	.long	0x01a56e1f
     b58:	3300      	movi      	r3, 0
     b5a:	e800fb94 	br      	0x282	// 282 <__GI_pow+0xce>

00000b5e <__GI_fabs>:
     b5e:	4121      	lsli      	r1, r1, 1
     b60:	4921      	lsri      	r1, r1, 1
     b62:	783c      	jmp      	r15

00000b64 <__GI_scalbn>:
     b64:	14c1      	push      	r4
     b66:	6cc7      	mov      	r3, r1
     b68:	6cc0      	or      	r3, r0
     b6a:	3b40      	cmpnei      	r3, 0
     b6c:	0c08      	bf      	0xb7c	// b7c <__GI_scalbn+0x18>
     b6e:	1065      	lrw      	r3, 0x7ff00000	// b80 <__GI_scalbn+0x1c>
     b70:	6d07      	mov      	r4, r1
     b72:	690c      	and      	r4, r3
     b74:	4254      	lsli      	r2, r2, 20
     b76:	6090      	addu      	r2, r4
     b78:	684d      	andn      	r1, r3
     b7a:	6c48      	or      	r1, r2
     b7c:	1481      	pop      	r4
     b7e:	0000      	bkpt
     b80:	7ff00000 	.long	0x7ff00000

00000b84 <__GI_sqrt>:
     b84:	14d4      	push      	r4-r7, r15
     b86:	1423      	subi      	r14, r14, 12
     b88:	127a      	lrw      	r3, 0x7ff00000	// cf0 <__GI_sqrt+0x16c>
     b8a:	6d43      	mov      	r5, r0
     b8c:	6d07      	mov      	r4, r1
     b8e:	6c07      	mov      	r0, r1
     b90:	684c      	and      	r1, r3
     b92:	64c6      	cmpne      	r1, r3
     b94:	6c97      	mov      	r2, r5
     b96:	0812      	bt      	0xbba	// bba <__GI_sqrt+0x36>
     b98:	6cd3      	mov      	r3, r4
     b9a:	6c17      	mov      	r0, r5
     b9c:	6c53      	mov      	r1, r4
     b9e:	e0000473 	bsr      	0x1484	// 1484 <__muldf3>
     ba2:	6c83      	mov      	r2, r0
     ba4:	6cc7      	mov      	r3, r1
     ba6:	6c17      	mov      	r0, r5
     ba8:	6c53      	mov      	r1, r4
     baa:	e0000439 	bsr      	0x141c	// 141c <__adddf3>
     bae:	6d43      	mov      	r5, r0
     bb0:	6d07      	mov      	r4, r1
     bb2:	6c17      	mov      	r0, r5
     bb4:	6c53      	mov      	r1, r4
     bb6:	1403      	addi      	r14, r14, 12
     bb8:	1494      	pop      	r4-r7, r15
     bba:	3c20      	cmplti      	r4, 1
     bbc:	0c13      	bf      	0xbe2	// be2 <__GI_sqrt+0x5e>
     bbe:	4461      	lsli      	r3, r4, 1
     bc0:	4b21      	lsri      	r1, r3, 1
     bc2:	6c54      	or      	r1, r5
     bc4:	3940      	cmpnei      	r1, 0
     bc6:	0ff6      	bf      	0xbb2	// bb2 <__GI_sqrt+0x2e>
     bc8:	3c40      	cmpnei      	r4, 0
     bca:	0c0c      	bf      	0xbe2	// be2 <__GI_sqrt+0x5e>
     bcc:	6c97      	mov      	r2, r5
     bce:	6cd3      	mov      	r3, r4
     bd0:	6c17      	mov      	r0, r5
     bd2:	6c53      	mov      	r1, r4
     bd4:	e000043c 	bsr      	0x144c	// 144c <__subdf3>
     bd8:	6c83      	mov      	r2, r0
     bda:	6cc7      	mov      	r3, r1
     bdc:	e000056e 	bsr      	0x16b8	// 16b8 <__divdf3>
     be0:	07e7      	br      	0xbae	// bae <__GI_sqrt+0x2a>
     be2:	5494      	asri      	r4, r4, 20
     be4:	3c40      	cmpnei      	r4, 0
     be6:	0812      	bt      	0xc0a	// c0a <__GI_sqrt+0x86>
     be8:	3840      	cmpnei      	r0, 0
     bea:	0c76      	bf      	0xcd6	// cd6 <__GI_sqrt+0x152>
     bec:	3580      	movi      	r5, 128
     bee:	3300      	movi      	r3, 0
     bf0:	452d      	lsli      	r1, r5, 13
     bf2:	6d83      	mov      	r6, r0
     bf4:	6984      	and      	r6, r1
     bf6:	3e40      	cmpnei      	r6, 0
     bf8:	0c73      	bf      	0xcde	// cde <__GI_sqrt+0x15a>
     bfa:	5b23      	subi      	r1, r3, 1
     bfc:	3620      	movi      	r6, 32
     bfe:	6106      	subu      	r4, r1
     c00:	618e      	subu      	r6, r3
     c02:	6c4b      	mov      	r1, r2
     c04:	7059      	lsr      	r1, r6
     c06:	6c04      	or      	r0, r1
     c08:	708c      	lsl      	r2, r3
     c0a:	117b      	lrw      	r3, 0xfffffc01	// cf4 <__GI_sqrt+0x170>
     c0c:	610c      	addu      	r4, r3
     c0e:	3601      	movi      	r6, 1
     c10:	400c      	lsli      	r0, r0, 12
     c12:	6990      	and      	r6, r4
     c14:	480c      	lsri      	r0, r0, 12
     c16:	3e40      	cmpnei      	r6, 0
     c18:	38b4      	bseti      	r0, 20
     c1a:	0c05      	bf      	0xc24	// c24 <__GI_sqrt+0xa0>
     c1c:	4a3f      	lsri      	r1, r2, 31
     c1e:	40a1      	lsli      	r5, r0, 1
     c20:	5914      	addu      	r0, r1, r5
     c22:	4241      	lsli      	r2, r2, 1
     c24:	4a7f      	lsri      	r3, r2, 31
     c26:	60c0      	addu      	r3, r0
     c28:	5481      	asri      	r4, r4, 1
     c2a:	3680      	movi      	r6, 128
     c2c:	3100      	movi      	r1, 0
     c2e:	60c0      	addu      	r3, r0
     c30:	b882      	st.w      	r4, (r14, 0x8)
     c32:	4241      	lsli      	r2, r2, 1
     c34:	3516      	movi      	r5, 22
     c36:	460e      	lsli      	r0, r6, 14
     c38:	b820      	st.w      	r1, (r14, 0x0)
     c3a:	5980      	addu      	r4, r1, r0
     c3c:	650d      	cmplt      	r3, r4
     c3e:	0806      	bt      	0xc4a	// c4a <__GI_sqrt+0xc6>
     c40:	98c0      	ld.w      	r6, (r14, 0x0)
     c42:	6180      	addu      	r6, r0
     c44:	5c20      	addu      	r1, r4, r0
     c46:	60d2      	subu      	r3, r4
     c48:	b8c0      	st.w      	r6, (r14, 0x0)
     c4a:	2d00      	subi      	r5, 1
     c4c:	4a9f      	lsri      	r4, r2, 31
     c4e:	4361      	lsli      	r3, r3, 1
     c50:	3d40      	cmpnei      	r5, 0
     c52:	60d0      	addu      	r3, r4
     c54:	4241      	lsli      	r2, r2, 1
     c56:	4801      	lsri      	r0, r0, 1
     c58:	0bf1      	bt      	0xc3a	// c3a <__GI_sqrt+0xb6>
     c5a:	3620      	movi      	r6, 32
     c5c:	3480      	movi      	r4, 128
     c5e:	3000      	movi      	r0, 0
     c60:	b8c1      	st.w      	r6, (r14, 0x4)
     c62:	4498      	lsli      	r4, r4, 24
     c64:	64c5      	cmplt      	r1, r3
     c66:	5cd4      	addu      	r6, r4, r5
     c68:	0805      	bt      	0xc72	// c72 <__GI_sqrt+0xee>
     c6a:	644e      	cmpne      	r3, r1
     c6c:	0810      	bt      	0xc8c	// c8c <__GI_sqrt+0x108>
     c6e:	6588      	cmphs      	r2, r6
     c70:	0c0e      	bf      	0xc8c	// c8c <__GI_sqrt+0x108>
     c72:	3edf      	btsti      	r6, 31
     c74:	5eb0      	addu      	r5, r6, r4
     c76:	0c37      	bf      	0xce4	// ce4 <__GI_sqrt+0x160>
     c78:	3ddf      	btsti      	r5, 31
     c7a:	0835      	bt      	0xce4	// ce4 <__GI_sqrt+0x160>
     c7c:	59e2      	addi      	r7, r1, 1
     c7e:	6588      	cmphs      	r2, r6
     c80:	60c6      	subu      	r3, r1
     c82:	0802      	bt      	0xc86	// c86 <__GI_sqrt+0x102>
     c84:	2b00      	subi      	r3, 1
     c86:	609a      	subu      	r2, r6
     c88:	6010      	addu      	r0, r4
     c8a:	6c5f      	mov      	r1, r7
     c8c:	4adf      	lsri      	r6, r2, 31
     c8e:	618c      	addu      	r6, r3
     c90:	60d8      	addu      	r3, r6
     c92:	98c1      	ld.w      	r6, (r14, 0x4)
     c94:	2e00      	subi      	r6, 1
     c96:	3e40      	cmpnei      	r6, 0
     c98:	4241      	lsli      	r2, r2, 1
     c9a:	4c81      	lsri      	r4, r4, 1
     c9c:	b8c1      	st.w      	r6, (r14, 0x4)
     c9e:	0be3      	bt      	0xc64	// c64 <__GI_sqrt+0xe0>
     ca0:	6cc8      	or      	r3, r2
     ca2:	3b40      	cmpnei      	r3, 0
     ca4:	0c09      	bf      	0xcb6	// cb6 <__GI_sqrt+0x132>
     ca6:	3300      	movi      	r3, 0
     ca8:	2b00      	subi      	r3, 1
     caa:	64c2      	cmpne      	r0, r3
     cac:	081e      	bt      	0xce8	// ce8 <__GI_sqrt+0x164>
     cae:	9800      	ld.w      	r0, (r14, 0x0)
     cb0:	2000      	addi      	r0, 1
     cb2:	b800      	st.w      	r0, (r14, 0x0)
     cb4:	3000      	movi      	r0, 0
     cb6:	3401      	movi      	r4, 1
     cb8:	9860      	ld.w      	r3, (r14, 0x0)
     cba:	98a0      	ld.w      	r5, (r14, 0x0)
     cbc:	690c      	and      	r4, r3
     cbe:	5541      	asri      	r2, r5, 1
     cc0:	102e      	lrw      	r1, 0x3fe00000	// cf8 <__GI_sqrt+0x174>
     cc2:	3c40      	cmpnei      	r4, 0
     cc4:	6048      	addu      	r1, r2
     cc6:	4801      	lsri      	r0, r0, 1
     cc8:	0c02      	bf      	0xccc	// ccc <__GI_sqrt+0x148>
     cca:	38bf      	bseti      	r0, 31
     ccc:	98a2      	ld.w      	r5, (r14, 0x8)
     cce:	4594      	lsli      	r4, r5, 20
     cd0:	6104      	addu      	r4, r1
     cd2:	6d43      	mov      	r5, r0
     cd4:	076f      	br      	0xbb2	// bb2 <__GI_sqrt+0x2e>
     cd6:	4a0b      	lsri      	r0, r2, 11
     cd8:	2c14      	subi      	r4, 21
     cda:	4255      	lsli      	r2, r2, 21
     cdc:	0786      	br      	0xbe8	// be8 <__GI_sqrt+0x64>
     cde:	4001      	lsli      	r0, r0, 1
     ce0:	2300      	addi      	r3, 1
     ce2:	0788      	br      	0xbf2	// bf2 <__GI_sqrt+0x6e>
     ce4:	6dc7      	mov      	r7, r1
     ce6:	07cc      	br      	0xc7e	// c7e <__GI_sqrt+0xfa>
     ce8:	2000      	addi      	r0, 1
     cea:	3880      	bclri      	r0, 0
     cec:	07e5      	br      	0xcb6	// cb6 <__GI_sqrt+0x132>
     cee:	0000      	bkpt
     cf0:	7ff00000 	.long	0x7ff00000
     cf4:	fffffc01 	.long	0xfffffc01
     cf8:	3fe00000 	.long	0x3fe00000

00000cfc <___gnu_csky_case_uqi>:
     cfc:	1421      	subi      	r14, r14, 4
     cfe:	b820      	st.w      	r1, (r14, 0x0)
     d00:	6c7f      	mov      	r1, r15
     d02:	6040      	addu      	r1, r0
     d04:	8120      	ld.b      	r1, (r1, 0x0)
     d06:	4121      	lsli      	r1, r1, 1
     d08:	63c4      	addu      	r15, r1
     d0a:	9820      	ld.w      	r1, (r14, 0x0)
     d0c:	1401      	addi      	r14, r14, 4
     d0e:	783c      	jmp      	r15

00000d10 <___gnu_csky_case_uhi>:
     d10:	1422      	subi      	r14, r14, 8
     d12:	b801      	st.w      	r0, (r14, 0x4)
     d14:	b820      	st.w      	r1, (r14, 0x0)
     d16:	6c7f      	mov      	r1, r15
     d18:	4001      	lsli      	r0, r0, 1
     d1a:	6040      	addu      	r1, r0
     d1c:	8920      	ld.h      	r1, (r1, 0x0)
     d1e:	4121      	lsli      	r1, r1, 1
     d20:	63c4      	addu      	r15, r1
     d22:	9801      	ld.w      	r0, (r14, 0x4)
     d24:	9820      	ld.w      	r1, (r14, 0x0)
     d26:	1402      	addi      	r14, r14, 8
     d28:	783c      	jmp      	r15
	...

00000d2c <__fixunssfsi>:
     d2c:	14d1      	push      	r4, r15
     d2e:	319e      	movi      	r1, 158
     d30:	4137      	lsli      	r1, r1, 23
     d32:	6d03      	mov      	r4, r0
     d34:	e0000192 	bsr      	0x1058	// 1058 <__gesf2>
     d38:	38df      	btsti      	r0, 31
     d3a:	0c05      	bf      	0xd44	// d44 <__fixunssfsi+0x18>
     d3c:	6c13      	mov      	r0, r4
     d3e:	e00001db 	bsr      	0x10f4	// 10f4 <__fixsfsi>
     d42:	1491      	pop      	r4, r15
     d44:	319e      	movi      	r1, 158
     d46:	4137      	lsli      	r1, r1, 23
     d48:	6c13      	mov      	r0, r4
     d4a:	e00000e1 	bsr      	0xf0c	// f0c <__subsf3>
     d4e:	e00001d3 	bsr      	0x10f4	// 10f4 <__fixsfsi>
     d52:	3380      	movi      	r3, 128
     d54:	4378      	lsli      	r3, r3, 24
     d56:	600c      	addu      	r0, r3
     d58:	1491      	pop      	r4, r15
	...

00000d5c <__fixunsdfsi>:
     d5c:	14d2      	push      	r4-r5, r15
     d5e:	3200      	movi      	r2, 0
     d60:	106c      	lrw      	r3, 0x41e00000	// d90 <__fixunsdfsi+0x34>
     d62:	6d43      	mov      	r5, r0
     d64:	6d07      	mov      	r4, r1
     d66:	e0000571 	bsr      	0x1848	// 1848 <__gedf2>
     d6a:	38df      	btsti      	r0, 31
     d6c:	0c06      	bf      	0xd78	// d78 <__fixunsdfsi+0x1c>
     d6e:	6c17      	mov      	r0, r5
     d70:	6c53      	mov      	r1, r4
     d72:	e00005df 	bsr      	0x1930	// 1930 <__fixdfsi>
     d76:	1492      	pop      	r4-r5, r15
     d78:	3200      	movi      	r2, 0
     d7a:	1066      	lrw      	r3, 0x41e00000	// d90 <__fixunsdfsi+0x34>
     d7c:	6c17      	mov      	r0, r5
     d7e:	6c53      	mov      	r1, r4
     d80:	e0000366 	bsr      	0x144c	// 144c <__subdf3>
     d84:	e00005d6 	bsr      	0x1930	// 1930 <__fixdfsi>
     d88:	3380      	movi      	r3, 128
     d8a:	4378      	lsli      	r3, r3, 24
     d8c:	600c      	addu      	r0, r3
     d8e:	1492      	pop      	r4-r5, r15
     d90:	41e00000 	.long	0x41e00000

00000d94 <_fpadd_parts>:
     d94:	14c4      	push      	r4-r7
     d96:	1421      	subi      	r14, r14, 4
     d98:	9060      	ld.w      	r3, (r0, 0x0)
     d9a:	3b01      	cmphsi      	r3, 2
     d9c:	0c3b      	bf      	0xe12	// e12 <_fpadd_parts+0x7e>
     d9e:	9180      	ld.w      	r4, (r1, 0x0)
     da0:	3c01      	cmphsi      	r4, 2
     da2:	0c3a      	bf      	0xe16	// e16 <_fpadd_parts+0x82>
     da4:	3b44      	cmpnei      	r3, 4
     da6:	0c76      	bf      	0xe92	// e92 <_fpadd_parts+0xfe>
     da8:	3c44      	cmpnei      	r4, 4
     daa:	0c36      	bf      	0xe16	// e16 <_fpadd_parts+0x82>
     dac:	3c42      	cmpnei      	r4, 2
     dae:	0c5c      	bf      	0xe66	// e66 <_fpadd_parts+0xd2>
     db0:	3b42      	cmpnei      	r3, 2
     db2:	0c32      	bf      	0xe16	// e16 <_fpadd_parts+0x82>
     db4:	90a2      	ld.w      	r5, (r0, 0x8)
     db6:	91e2      	ld.w      	r7, (r1, 0x8)
     db8:	5d9d      	subu      	r4, r5, r7
     dba:	9063      	ld.w      	r3, (r0, 0xc)
     dbc:	3cdf      	btsti      	r4, 31
     dbe:	b860      	st.w      	r3, (r14, 0x0)
     dc0:	6d93      	mov      	r6, r4
     dc2:	9163      	ld.w      	r3, (r1, 0xc)
     dc4:	086f      	bt      	0xea2	// ea2 <_fpadd_parts+0x10e>
     dc6:	3e3f      	cmplti      	r6, 32
     dc8:	082a      	bt      	0xe1c	// e1c <_fpadd_parts+0x88>
     dca:	655d      	cmplt      	r7, r5
     dcc:	0c5f      	bf      	0xe8a	// e8a <_fpadd_parts+0xf6>
     dce:	3300      	movi      	r3, 0
     dd0:	9001      	ld.w      	r0, (r0, 0x4)
     dd2:	9121      	ld.w      	r1, (r1, 0x4)
     dd4:	6442      	cmpne      	r0, r1
     dd6:	0c33      	bf      	0xe3c	// e3c <_fpadd_parts+0xa8>
     dd8:	3840      	cmpnei      	r0, 0
     dda:	9820      	ld.w      	r1, (r14, 0x0)
     ddc:	0c54      	bf      	0xe84	// e84 <_fpadd_parts+0xf0>
     dde:	60c6      	subu      	r3, r1
     de0:	3bdf      	btsti      	r3, 31
     de2:	0863      	bt      	0xea8	// ea8 <_fpadd_parts+0x114>
     de4:	3100      	movi      	r1, 0
     de6:	b221      	st.w      	r1, (r2, 0x4)
     de8:	b2a2      	st.w      	r5, (r2, 0x8)
     dea:	b263      	st.w      	r3, (r2, 0xc)
     dec:	5b23      	subi      	r1, r3, 1
     dee:	119b      	lrw      	r4, 0x3fffffff	// ed8 <_fpadd_parts+0x144>
     df0:	6504      	cmphs      	r1, r4
     df2:	080b      	bt      	0xe08	// e08 <_fpadd_parts+0x74>
     df4:	9222      	ld.w      	r1, (r2, 0x8)
     df6:	2900      	subi      	r1, 1
     df8:	4361      	lsli      	r3, r3, 1
     dfa:	5b03      	subi      	r0, r3, 1
     dfc:	6410      	cmphs      	r4, r0
     dfe:	6d47      	mov      	r5, r1
     e00:	2900      	subi      	r1, 1
     e02:	0bfb      	bt      	0xdf8	// df8 <_fpadd_parts+0x64>
     e04:	b263      	st.w      	r3, (r2, 0xc)
     e06:	b2a2      	st.w      	r5, (r2, 0x8)
     e08:	3103      	movi      	r1, 3
     e0a:	3bdf      	btsti      	r3, 31
     e0c:	b220      	st.w      	r1, (r2, 0x0)
     e0e:	0821      	bt      	0xe50	// e50 <_fpadd_parts+0xbc>
     e10:	6c0b      	mov      	r0, r2
     e12:	1401      	addi      	r14, r14, 4
     e14:	1484      	pop      	r4-r7
     e16:	6c07      	mov      	r0, r1
     e18:	1401      	addi      	r14, r14, 4
     e1a:	1484      	pop      	r4-r7
     e1c:	3c20      	cmplti      	r4, 1
     e1e:	084c      	bt      	0xeb6	// eb6 <_fpadd_parts+0x122>
     e20:	3401      	movi      	r4, 1
     e22:	7118      	lsl      	r4, r6
     e24:	2c00      	subi      	r4, 1
     e26:	6dcf      	mov      	r7, r3
     e28:	68d0      	and      	r3, r4
     e2a:	3b40      	cmpnei      	r3, 0
     e2c:	9001      	ld.w      	r0, (r0, 0x4)
     e2e:	3300      	movi      	r3, 0
     e30:	9121      	ld.w      	r1, (r1, 0x4)
     e32:	60cd      	addc      	r3, r3
     e34:	71d9      	lsr      	r7, r6
     e36:	6442      	cmpne      	r0, r1
     e38:	6cdc      	or      	r3, r7
     e3a:	0bcf      	bt      	0xdd8	// dd8 <_fpadd_parts+0x44>
     e3c:	9820      	ld.w      	r1, (r14, 0x0)
     e3e:	604c      	addu      	r1, r3
     e40:	6cc7      	mov      	r3, r1
     e42:	b223      	st.w      	r1, (r2, 0xc)
     e44:	3bdf      	btsti      	r3, 31
     e46:	3103      	movi      	r1, 3
     e48:	b201      	st.w      	r0, (r2, 0x4)
     e4a:	b2a2      	st.w      	r5, (r2, 0x8)
     e4c:	b220      	st.w      	r1, (r2, 0x0)
     e4e:	0fe1      	bf      	0xe10	// e10 <_fpadd_parts+0x7c>
     e50:	3001      	movi      	r0, 1
     e52:	4b21      	lsri      	r1, r3, 1
     e54:	68c0      	and      	r3, r0
     e56:	6cc4      	or      	r3, r1
     e58:	b263      	st.w      	r3, (r2, 0xc)
     e5a:	9262      	ld.w      	r3, (r2, 0x8)
     e5c:	2300      	addi      	r3, 1
     e5e:	6c0b      	mov      	r0, r2
     e60:	b262      	st.w      	r3, (r2, 0x8)
     e62:	1401      	addi      	r14, r14, 4
     e64:	1484      	pop      	r4-r7
     e66:	3b42      	cmpnei      	r3, 2
     e68:	0bd5      	bt      	0xe12	// e12 <_fpadd_parts+0x7e>
     e6a:	b260      	st.w      	r3, (r2, 0x0)
     e6c:	9061      	ld.w      	r3, (r0, 0x4)
     e6e:	b261      	st.w      	r3, (r2, 0x4)
     e70:	9062      	ld.w      	r3, (r0, 0x8)
     e72:	b262      	st.w      	r3, (r2, 0x8)
     e74:	9063      	ld.w      	r3, (r0, 0xc)
     e76:	9121      	ld.w      	r1, (r1, 0x4)
     e78:	b263      	st.w      	r3, (r2, 0xc)
     e7a:	9061      	ld.w      	r3, (r0, 0x4)
     e7c:	68c4      	and      	r3, r1
     e7e:	b261      	st.w      	r3, (r2, 0x4)
     e80:	6c0b      	mov      	r0, r2
     e82:	07c8      	br      	0xe12	// e12 <_fpadd_parts+0x7e>
     e84:	604e      	subu      	r1, r3
     e86:	6cc7      	mov      	r3, r1
     e88:	07ac      	br      	0xde0	// de0 <_fpadd_parts+0x4c>
     e8a:	3400      	movi      	r4, 0
     e8c:	6d5f      	mov      	r5, r7
     e8e:	b880      	st.w      	r4, (r14, 0x0)
     e90:	07a0      	br      	0xdd0	// dd0 <_fpadd_parts+0x3c>
     e92:	3c44      	cmpnei      	r4, 4
     e94:	0bbf      	bt      	0xe12	// e12 <_fpadd_parts+0x7e>
     e96:	9041      	ld.w      	r2, (r0, 0x4)
     e98:	9161      	ld.w      	r3, (r1, 0x4)
     e9a:	64ca      	cmpne      	r2, r3
     e9c:	0fbb      	bf      	0xe12	// e12 <_fpadd_parts+0x7e>
     e9e:	1010      	lrw      	r0, 0x960c	// edc <_fpadd_parts+0x148>
     ea0:	07b9      	br      	0xe12	// e12 <_fpadd_parts+0x7e>
     ea2:	3600      	movi      	r6, 0
     ea4:	6192      	subu      	r6, r4
     ea6:	0790      	br      	0xdc6	// dc6 <_fpadd_parts+0x32>
     ea8:	3101      	movi      	r1, 1
     eaa:	b221      	st.w      	r1, (r2, 0x4)
     eac:	3100      	movi      	r1, 0
     eae:	596d      	subu      	r3, r1, r3
     eb0:	b2a2      	st.w      	r5, (r2, 0x8)
     eb2:	b263      	st.w      	r3, (r2, 0xc)
     eb4:	079c      	br      	0xdec	// dec <_fpadd_parts+0x58>
     eb6:	3c40      	cmpnei      	r4, 0
     eb8:	0f8c      	bf      	0xdd0	// dd0 <_fpadd_parts+0x3c>
     eba:	3401      	movi      	r4, 1
     ebc:	98e0      	ld.w      	r7, (r14, 0x0)
     ebe:	7118      	lsl      	r4, r6
     ec0:	71d9      	lsr      	r7, r6
     ec2:	6158      	addu      	r5, r6
     ec4:	2c00      	subi      	r4, 1
     ec6:	98c0      	ld.w      	r6, (r14, 0x0)
     ec8:	6918      	and      	r4, r6
     eca:	3c40      	cmpnei      	r4, 0
     ecc:	3400      	movi      	r4, 0
     ece:	6111      	addc      	r4, r4
     ed0:	6dd0      	or      	r7, r4
     ed2:	b8e0      	st.w      	r7, (r14, 0x0)
     ed4:	077e      	br      	0xdd0	// dd0 <_fpadd_parts+0x3c>
     ed6:	0000      	bkpt
     ed8:	3fffffff 	.long	0x3fffffff
     edc:	0000960c 	.long	0x0000960c

00000ee0 <__addsf3>:
     ee0:	14d0      	push      	r15
     ee2:	142e      	subi      	r14, r14, 56
     ee4:	b800      	st.w      	r0, (r14, 0x0)
     ee6:	b821      	st.w      	r1, (r14, 0x4)
     ee8:	6c3b      	mov      	r0, r14
     eea:	1902      	addi      	r1, r14, 8
     eec:	e000063a 	bsr      	0x1b60	// 1b60 <__unpack_f>
     ef0:	1906      	addi      	r1, r14, 24
     ef2:	1801      	addi      	r0, r14, 4
     ef4:	e0000636 	bsr      	0x1b60	// 1b60 <__unpack_f>
     ef8:	1a0a      	addi      	r2, r14, 40
     efa:	1906      	addi      	r1, r14, 24
     efc:	1802      	addi      	r0, r14, 8
     efe:	e3ffff4b 	bsr      	0xd94	// d94 <_fpadd_parts>
     f02:	e00005d3 	bsr      	0x1aa8	// 1aa8 <__pack_f>
     f06:	140e      	addi      	r14, r14, 56
     f08:	1490      	pop      	r15
	...

00000f0c <__subsf3>:
     f0c:	14d0      	push      	r15
     f0e:	142e      	subi      	r14, r14, 56
     f10:	b800      	st.w      	r0, (r14, 0x0)
     f12:	b821      	st.w      	r1, (r14, 0x4)
     f14:	6c3b      	mov      	r0, r14
     f16:	1902      	addi      	r1, r14, 8
     f18:	e0000624 	bsr      	0x1b60	// 1b60 <__unpack_f>
     f1c:	1906      	addi      	r1, r14, 24
     f1e:	1801      	addi      	r0, r14, 4
     f20:	e0000620 	bsr      	0x1b60	// 1b60 <__unpack_f>
     f24:	9867      	ld.w      	r3, (r14, 0x1c)
     f26:	3201      	movi      	r2, 1
     f28:	6cc9      	xor      	r3, r2
     f2a:	1906      	addi      	r1, r14, 24
     f2c:	1a0a      	addi      	r2, r14, 40
     f2e:	1802      	addi      	r0, r14, 8
     f30:	b867      	st.w      	r3, (r14, 0x1c)
     f32:	e3ffff31 	bsr      	0xd94	// d94 <_fpadd_parts>
     f36:	e00005b9 	bsr      	0x1aa8	// 1aa8 <__pack_f>
     f3a:	140e      	addi      	r14, r14, 56
     f3c:	1490      	pop      	r15
	...

00000f40 <__mulsf3>:
     f40:	14d4      	push      	r4-r7, r15
     f42:	1430      	subi      	r14, r14, 64
     f44:	b802      	st.w      	r0, (r14, 0x8)
     f46:	b823      	st.w      	r1, (r14, 0xc)
     f48:	1802      	addi      	r0, r14, 8
     f4a:	1904      	addi      	r1, r14, 16
     f4c:	e000060a 	bsr      	0x1b60	// 1b60 <__unpack_f>
     f50:	1908      	addi      	r1, r14, 32
     f52:	1803      	addi      	r0, r14, 12
     f54:	e0000606 	bsr      	0x1b60	// 1b60 <__unpack_f>
     f58:	9864      	ld.w      	r3, (r14, 0x10)
     f5a:	3b01      	cmphsi      	r3, 2
     f5c:	0c4d      	bf      	0xff6	// ff6 <__mulsf3+0xb6>
     f5e:	9848      	ld.w      	r2, (r14, 0x20)
     f60:	3a01      	cmphsi      	r2, 2
     f62:	0c3d      	bf      	0xfdc	// fdc <__mulsf3+0x9c>
     f64:	3b44      	cmpnei      	r3, 4
     f66:	0c46      	bf      	0xff2	// ff2 <__mulsf3+0xb2>
     f68:	3a44      	cmpnei      	r2, 4
     f6a:	0c37      	bf      	0xfd8	// fd8 <__mulsf3+0x98>
     f6c:	3b42      	cmpnei      	r3, 2
     f6e:	0c44      	bf      	0xff6	// ff6 <__mulsf3+0xb6>
     f70:	3a42      	cmpnei      	r2, 2
     f72:	0c35      	bf      	0xfdc	// fdc <__mulsf3+0x9c>
     f74:	9867      	ld.w      	r3, (r14, 0x1c)
     f76:	b860      	st.w      	r3, (r14, 0x0)
     f78:	986b      	ld.w      	r3, (r14, 0x2c)
     f7a:	6c8f      	mov      	r2, r3
     f7c:	b861      	st.w      	r3, (r14, 0x4)
     f7e:	9800      	ld.w      	r0, (r14, 0x0)
     f80:	3300      	movi      	r3, 0
     f82:	3100      	movi      	r1, 0
     f84:	e0000550 	bsr      	0x1a24	// 1a24 <__muldi3>
     f88:	98c6      	ld.w      	r6, (r14, 0x18)
     f8a:	984a      	ld.w      	r2, (r14, 0x28)
     f8c:	6098      	addu      	r2, r6
     f8e:	5ac6      	addi      	r6, r2, 2
     f90:	b8ce      	st.w      	r6, (r14, 0x38)
     f92:	98e5      	ld.w      	r7, (r14, 0x14)
     f94:	98c9      	ld.w      	r6, (r14, 0x24)
     f96:	659e      	cmpne      	r7, r6
     f98:	3400      	movi      	r4, 0
     f9a:	6111      	addc      	r4, r4
     f9c:	39df      	btsti      	r1, 31
     f9e:	6cc7      	mov      	r3, r1
     fa0:	6d43      	mov      	r5, r0
     fa2:	b88d      	st.w      	r4, (r14, 0x34)
     fa4:	0c3f      	bf      	0x1022	// 1022 <__mulsf3+0xe2>
     fa6:	3301      	movi      	r3, 1
     fa8:	68c4      	and      	r3, r1
     faa:	3b40      	cmpnei      	r3, 0
     fac:	2202      	addi      	r2, 3
     fae:	0811      	bt      	0xfd0	// fd0 <__mulsf3+0x90>
     fb0:	4961      	lsri      	r3, r1, 1
     fb2:	b84e      	st.w      	r2, (r14, 0x38)
     fb4:	317f      	movi      	r1, 127
     fb6:	6c8f      	mov      	r2, r3
     fb8:	6884      	and      	r2, r1
     fba:	3040      	movi      	r0, 64
     fbc:	640a      	cmpne      	r2, r0
     fbe:	0c27      	bf      	0x100c	// 100c <__mulsf3+0xcc>
     fc0:	b86f      	st.w      	r3, (r14, 0x3c)
     fc2:	3303      	movi      	r3, 3
     fc4:	b86c      	st.w      	r3, (r14, 0x30)
     fc6:	180c      	addi      	r0, r14, 48
     fc8:	e0000570 	bsr      	0x1aa8	// 1aa8 <__pack_f>
     fcc:	1410      	addi      	r14, r14, 64
     fce:	1494      	pop      	r4-r7, r15
     fd0:	4801      	lsri      	r0, r0, 1
     fd2:	38bf      	bseti      	r0, 31
     fd4:	6d43      	mov      	r5, r0
     fd6:	07ed      	br      	0xfb0	// fb0 <__mulsf3+0x70>
     fd8:	3b42      	cmpnei      	r3, 2
     fda:	0c22      	bf      	0x101e	// 101e <__mulsf3+0xde>
     fdc:	9869      	ld.w      	r3, (r14, 0x24)
     fde:	9845      	ld.w      	r2, (r14, 0x14)
     fe0:	64ca      	cmpne      	r2, r3
     fe2:	3300      	movi      	r3, 0
     fe4:	60cd      	addc      	r3, r3
     fe6:	1808      	addi      	r0, r14, 32
     fe8:	b869      	st.w      	r3, (r14, 0x24)
     fea:	e000055f 	bsr      	0x1aa8	// 1aa8 <__pack_f>
     fee:	1410      	addi      	r14, r14, 64
     ff0:	1494      	pop      	r4-r7, r15
     ff2:	3a42      	cmpnei      	r2, 2
     ff4:	0c15      	bf      	0x101e	// 101e <__mulsf3+0xde>
     ff6:	9845      	ld.w      	r2, (r14, 0x14)
     ff8:	9869      	ld.w      	r3, (r14, 0x24)
     ffa:	64ca      	cmpne      	r2, r3
     ffc:	3300      	movi      	r3, 0
     ffe:	60cd      	addc      	r3, r3
    1000:	1804      	addi      	r0, r14, 16
    1002:	b865      	st.w      	r3, (r14, 0x14)
    1004:	e0000552 	bsr      	0x1aa8	// 1aa8 <__pack_f>
    1008:	1410      	addi      	r14, r14, 64
    100a:	1494      	pop      	r4-r7, r15
    100c:	3080      	movi      	r0, 128
    100e:	680c      	and      	r0, r3
    1010:	3840      	cmpnei      	r0, 0
    1012:	0bd7      	bt      	0xfc0	// fc0 <__mulsf3+0x80>
    1014:	3d40      	cmpnei      	r5, 0
    1016:	0fd5      	bf      	0xfc0	// fc0 <__mulsf3+0x80>
    1018:	60c8      	addu      	r3, r2
    101a:	68c5      	andn      	r3, r1
    101c:	07d2      	br      	0xfc0	// fc0 <__mulsf3+0x80>
    101e:	100d      	lrw      	r0, 0x960c	// 1050 <__mulsf3+0x110>
    1020:	07d4      	br      	0xfc8	// fc8 <__mulsf3+0x88>
    1022:	108d      	lrw      	r4, 0x3fffffff	// 1054 <__mulsf3+0x114>
    1024:	6450      	cmphs      	r4, r1
    1026:	0fc7      	bf      	0xfb4	// fb4 <__mulsf3+0x74>
    1028:	2200      	addi      	r2, 1
    102a:	3001      	movi      	r0, 1
    102c:	6c53      	mov      	r1, r4
    102e:	0405      	br      	0x1038	// 1038 <__mulsf3+0xf8>
    1030:	64c4      	cmphs      	r1, r3
    1032:	45a1      	lsli      	r5, r5, 1
    1034:	2a00      	subi      	r2, 1
    1036:	0c0a      	bf      	0x104a	// 104a <__mulsf3+0x10a>
    1038:	3ddf      	btsti      	r5, 31
    103a:	6d0b      	mov      	r4, r2
    103c:	4361      	lsli      	r3, r3, 1
    103e:	0ff9      	bf      	0x1030	// 1030 <__mulsf3+0xf0>
    1040:	6cc0      	or      	r3, r0
    1042:	64c4      	cmphs      	r1, r3
    1044:	45a1      	lsli      	r5, r5, 1
    1046:	2a00      	subi      	r2, 1
    1048:	0bf8      	bt      	0x1038	// 1038 <__mulsf3+0xf8>
    104a:	b88e      	st.w      	r4, (r14, 0x38)
    104c:	07b4      	br      	0xfb4	// fb4 <__mulsf3+0x74>
    104e:	0000      	bkpt
    1050:	0000960c 	.long	0x0000960c
    1054:	3fffffff 	.long	0x3fffffff

00001058 <__gesf2>:
    1058:	14d0      	push      	r15
    105a:	142a      	subi      	r14, r14, 40
    105c:	b800      	st.w      	r0, (r14, 0x0)
    105e:	b821      	st.w      	r1, (r14, 0x4)
    1060:	6c3b      	mov      	r0, r14
    1062:	1902      	addi      	r1, r14, 8
    1064:	e000057e 	bsr      	0x1b60	// 1b60 <__unpack_f>
    1068:	1906      	addi      	r1, r14, 24
    106a:	1801      	addi      	r0, r14, 4
    106c:	e000057a 	bsr      	0x1b60	// 1b60 <__unpack_f>
    1070:	9862      	ld.w      	r3, (r14, 0x8)
    1072:	3b01      	cmphsi      	r3, 2
    1074:	0c0a      	bf      	0x1088	// 1088 <__gesf2+0x30>
    1076:	9866      	ld.w      	r3, (r14, 0x18)
    1078:	3b01      	cmphsi      	r3, 2
    107a:	0c07      	bf      	0x1088	// 1088 <__gesf2+0x30>
    107c:	1906      	addi      	r1, r14, 24
    107e:	1802      	addi      	r0, r14, 8
    1080:	e00005b2 	bsr      	0x1be4	// 1be4 <__fpcmp_parts_f>
    1084:	140a      	addi      	r14, r14, 40
    1086:	1490      	pop      	r15
    1088:	3000      	movi      	r0, 0
    108a:	2800      	subi      	r0, 1
    108c:	140a      	addi      	r14, r14, 40
    108e:	1490      	pop      	r15

00001090 <__floatsisf>:
    1090:	14d1      	push      	r4, r15
    1092:	1424      	subi      	r14, r14, 16
    1094:	3303      	movi      	r3, 3
    1096:	b860      	st.w      	r3, (r14, 0x0)
    1098:	3840      	cmpnei      	r0, 0
    109a:	487f      	lsri      	r3, r0, 31
    109c:	b861      	st.w      	r3, (r14, 0x4)
    109e:	0808      	bt      	0x10ae	// 10ae <__floatsisf+0x1e>
    10a0:	3302      	movi      	r3, 2
    10a2:	b860      	st.w      	r3, (r14, 0x0)
    10a4:	6c3b      	mov      	r0, r14
    10a6:	e0000501 	bsr      	0x1aa8	// 1aa8 <__pack_f>
    10aa:	1404      	addi      	r14, r14, 16
    10ac:	1491      	pop      	r4, r15
    10ae:	331e      	movi      	r3, 30
    10b0:	38df      	btsti      	r0, 31
    10b2:	b862      	st.w      	r3, (r14, 0x8)
    10b4:	080f      	bt      	0x10d2	// 10d2 <__floatsisf+0x42>
    10b6:	6d03      	mov      	r4, r0
    10b8:	6c13      	mov      	r0, r4
    10ba:	e00004d7 	bsr      	0x1a68	// 1a68 <__clzsi2>
    10be:	5863      	subi      	r3, r0, 1
    10c0:	3b40      	cmpnei      	r3, 0
    10c2:	0c14      	bf      	0x10ea	// 10ea <__floatsisf+0x5a>
    10c4:	6c13      	mov      	r0, r4
    10c6:	321e      	movi      	r2, 30
    10c8:	700c      	lsl      	r0, r3
    10ca:	5a6d      	subu      	r3, r2, r3
    10cc:	b803      	st.w      	r0, (r14, 0xc)
    10ce:	b862      	st.w      	r3, (r14, 0x8)
    10d0:	07ea      	br      	0x10a4	// 10a4 <__floatsisf+0x14>
    10d2:	3380      	movi      	r3, 128
    10d4:	4378      	lsli      	r3, r3, 24
    10d6:	64c2      	cmpne      	r0, r3
    10d8:	0c0b      	bf      	0x10ee	// 10ee <__floatsisf+0x5e>
    10da:	3400      	movi      	r4, 0
    10dc:	6102      	subu      	r4, r0
    10de:	6c13      	mov      	r0, r4
    10e0:	e00004c4 	bsr      	0x1a68	// 1a68 <__clzsi2>
    10e4:	5863      	subi      	r3, r0, 1
    10e6:	3b40      	cmpnei      	r3, 0
    10e8:	0bee      	bt      	0x10c4	// 10c4 <__floatsisf+0x34>
    10ea:	b883      	st.w      	r4, (r14, 0xc)
    10ec:	07dc      	br      	0x10a4	// 10a4 <__floatsisf+0x14>
    10ee:	30cf      	movi      	r0, 207
    10f0:	4018      	lsli      	r0, r0, 24
    10f2:	07dc      	br      	0x10aa	// 10aa <__floatsisf+0x1a>

000010f4 <__fixsfsi>:
    10f4:	14d0      	push      	r15
    10f6:	1425      	subi      	r14, r14, 20
    10f8:	b800      	st.w      	r0, (r14, 0x0)
    10fa:	1901      	addi      	r1, r14, 4
    10fc:	6c3b      	mov      	r0, r14
    10fe:	e0000531 	bsr      	0x1b60	// 1b60 <__unpack_f>
    1102:	9861      	ld.w      	r3, (r14, 0x4)
    1104:	3b02      	cmphsi      	r3, 3
    1106:	0c1b      	bf      	0x113c	// 113c <__fixsfsi+0x48>
    1108:	3b44      	cmpnei      	r3, 4
    110a:	0c06      	bf      	0x1116	// 1116 <__fixsfsi+0x22>
    110c:	9863      	ld.w      	r3, (r14, 0xc)
    110e:	3bdf      	btsti      	r3, 31
    1110:	0816      	bt      	0x113c	// 113c <__fixsfsi+0x48>
    1112:	3b3e      	cmplti      	r3, 31
    1114:	0809      	bt      	0x1126	// 1126 <__fixsfsi+0x32>
    1116:	9862      	ld.w      	r3, (r14, 0x8)
    1118:	3b40      	cmpnei      	r3, 0
    111a:	3000      	movi      	r0, 0
    111c:	6001      	addc      	r0, r0
    111e:	106a      	lrw      	r3, 0x7fffffff	// 1144 <__fixsfsi+0x50>
    1120:	600c      	addu      	r0, r3
    1122:	1405      	addi      	r14, r14, 20
    1124:	1490      	pop      	r15
    1126:	321e      	movi      	r2, 30
    1128:	5a6d      	subu      	r3, r2, r3
    112a:	9804      	ld.w      	r0, (r14, 0x10)
    112c:	700d      	lsr      	r0, r3
    112e:	9862      	ld.w      	r3, (r14, 0x8)
    1130:	3b40      	cmpnei      	r3, 0
    1132:	0ff8      	bf      	0x1122	// 1122 <__fixsfsi+0x2e>
    1134:	3300      	movi      	r3, 0
    1136:	5b01      	subu      	r0, r3, r0
    1138:	1405      	addi      	r14, r14, 20
    113a:	1490      	pop      	r15
    113c:	3000      	movi      	r0, 0
    113e:	1405      	addi      	r14, r14, 20
    1140:	1490      	pop      	r15
    1142:	0000      	bkpt
    1144:	7fffffff 	.long	0x7fffffff

00001148 <_fpadd_parts>:
    1148:	14c4      	push      	r4-r7
    114a:	142a      	subi      	r14, r14, 40
    114c:	9060      	ld.w      	r3, (r0, 0x0)
    114e:	3b01      	cmphsi      	r3, 2
    1150:	6dcb      	mov      	r7, r2
    1152:	0c67      	bf      	0x1220	// 1220 <_fpadd_parts+0xd8>
    1154:	9140      	ld.w      	r2, (r1, 0x0)
    1156:	3a01      	cmphsi      	r2, 2
    1158:	0c66      	bf      	0x1224	// 1224 <_fpadd_parts+0xdc>
    115a:	3b44      	cmpnei      	r3, 4
    115c:	0cde      	bf      	0x1318	// 1318 <_fpadd_parts+0x1d0>
    115e:	3a44      	cmpnei      	r2, 4
    1160:	0c62      	bf      	0x1224	// 1224 <_fpadd_parts+0xdc>
    1162:	3a42      	cmpnei      	r2, 2
    1164:	0cb7      	bf      	0x12d2	// 12d2 <_fpadd_parts+0x18a>
    1166:	3b42      	cmpnei      	r3, 2
    1168:	0c5e      	bf      	0x1224	// 1224 <_fpadd_parts+0xdc>
    116a:	9043      	ld.w      	r2, (r0, 0xc)
    116c:	9064      	ld.w      	r3, (r0, 0x10)
    116e:	9082      	ld.w      	r4, (r0, 0x8)
    1170:	91a2      	ld.w      	r5, (r1, 0x8)
    1172:	b842      	st.w      	r2, (r14, 0x8)
    1174:	b863      	st.w      	r3, (r14, 0xc)
    1176:	9143      	ld.w      	r2, (r1, 0xc)
    1178:	9164      	ld.w      	r3, (r1, 0x10)
    117a:	b840      	st.w      	r2, (r14, 0x0)
    117c:	b861      	st.w      	r3, (r14, 0x4)
    117e:	5c75      	subu      	r3, r4, r5
    1180:	3bdf      	btsti      	r3, 31
    1182:	6c8f      	mov      	r2, r3
    1184:	08d2      	bt      	0x1328	// 1328 <_fpadd_parts+0x1e0>
    1186:	363f      	movi      	r6, 63
    1188:	6499      	cmplt      	r6, r2
    118a:	0c50      	bf      	0x122a	// 122a <_fpadd_parts+0xe2>
    118c:	6515      	cmplt      	r5, r4
    118e:	0cbf      	bf      	0x130c	// 130c <_fpadd_parts+0x1c4>
    1190:	3200      	movi      	r2, 0
    1192:	3300      	movi      	r3, 0
    1194:	b840      	st.w      	r2, (r14, 0x0)
    1196:	b861      	st.w      	r3, (r14, 0x4)
    1198:	9061      	ld.w      	r3, (r0, 0x4)
    119a:	9141      	ld.w      	r2, (r1, 0x4)
    119c:	648e      	cmpne      	r3, r2
    119e:	0c78      	bf      	0x128e	// 128e <_fpadd_parts+0x146>
    11a0:	3b40      	cmpnei      	r3, 0
    11a2:	0cad      	bf      	0x12fc	// 12fc <_fpadd_parts+0x1b4>
    11a4:	9800      	ld.w      	r0, (r14, 0x0)
    11a6:	9821      	ld.w      	r1, (r14, 0x4)
    11a8:	9842      	ld.w      	r2, (r14, 0x8)
    11aa:	9863      	ld.w      	r3, (r14, 0xc)
    11ac:	6400      	cmphs      	r0, r0
    11ae:	600b      	subc      	r0, r2
    11b0:	604f      	subc      	r1, r3
    11b2:	39df      	btsti      	r1, 31
    11b4:	08bd      	bt      	0x132e	// 132e <_fpadd_parts+0x1e6>
    11b6:	3300      	movi      	r3, 0
    11b8:	b761      	st.w      	r3, (r7, 0x4)
    11ba:	b782      	st.w      	r4, (r7, 0x8)
    11bc:	6c83      	mov      	r2, r0
    11be:	6cc7      	mov      	r3, r1
    11c0:	b703      	st.w      	r0, (r7, 0xc)
    11c2:	b724      	st.w      	r1, (r7, 0x10)
    11c4:	3000      	movi      	r0, 0
    11c6:	3100      	movi      	r1, 0
    11c8:	2800      	subi      	r0, 1
    11ca:	2900      	subi      	r1, 1
    11cc:	6401      	cmplt      	r0, r0
    11ce:	6009      	addc      	r0, r2
    11d0:	604d      	addc      	r1, r3
    11d2:	038f      	lrw      	r4, 0xfffffff	// 1410 <_fpadd_parts+0x2c8>
    11d4:	6450      	cmphs      	r4, r1
    11d6:	0c67      	bf      	0x12a4	// 12a4 <_fpadd_parts+0x15c>
    11d8:	6506      	cmpne      	r1, r4
    11da:	0cfd      	bf      	0x13d4	// 13d4 <_fpadd_parts+0x28c>
    11dc:	3000      	movi      	r0, 0
    11de:	9722      	ld.w      	r1, (r7, 0x8)
    11e0:	2801      	subi      	r0, 2
    11e2:	2900      	subi      	r1, 1
    11e4:	03d4      	lrw      	r6, 0xfffffff	// 1410 <_fpadd_parts+0x2c8>
    11e6:	b802      	st.w      	r0, (r14, 0x8)
    11e8:	b8e0      	st.w      	r7, (r14, 0x0)
    11ea:	0403      	br      	0x11f0	// 11f0 <_fpadd_parts+0xa8>
    11ec:	6596      	cmpne      	r5, r6
    11ee:	0c83      	bf      	0x12f4	// 12f4 <_fpadd_parts+0x1ac>
    11f0:	4301      	lsli      	r0, r3, 1
    11f2:	4a9f      	lsri      	r4, r2, 31
    11f4:	6d00      	or      	r4, r0
    11f6:	42a1      	lsli      	r5, r2, 1
    11f8:	6c97      	mov      	r2, r5
    11fa:	6cd3      	mov      	r3, r4
    11fc:	3500      	movi      	r5, 0
    11fe:	3400      	movi      	r4, 0
    1200:	2c00      	subi      	r4, 1
    1202:	2d00      	subi      	r5, 1
    1204:	6511      	cmplt      	r4, r4
    1206:	6109      	addc      	r4, r2
    1208:	614d      	addc      	r5, r3
    120a:	6558      	cmphs      	r6, r5
    120c:	6c07      	mov      	r0, r1
    120e:	2900      	subi      	r1, 1
    1210:	0bee      	bt      	0x11ec	// 11ec <_fpadd_parts+0xa4>
    1212:	98e0      	ld.w      	r7, (r14, 0x0)
    1214:	b743      	st.w      	r2, (r7, 0xc)
    1216:	b764      	st.w      	r3, (r7, 0x10)
    1218:	3303      	movi      	r3, 3
    121a:	b702      	st.w      	r0, (r7, 0x8)
    121c:	b760      	st.w      	r3, (r7, 0x0)
    121e:	6c1f      	mov      	r0, r7
    1220:	140a      	addi      	r14, r14, 40
    1222:	1484      	pop      	r4-r7
    1224:	6c07      	mov      	r0, r1
    1226:	140a      	addi      	r14, r14, 40
    1228:	1484      	pop      	r4-r7
    122a:	3b20      	cmplti      	r3, 1
    122c:	088c      	bt      	0x1344	// 1344 <_fpadd_parts+0x1fc>
    122e:	3300      	movi      	r3, 0
    1230:	2b1f      	subi      	r3, 32
    1232:	60c8      	addu      	r3, r2
    1234:	3bdf      	btsti      	r3, 31
    1236:	b866      	st.w      	r3, (r14, 0x18)
    1238:	08bb      	bt      	0x13ae	// 13ae <_fpadd_parts+0x266>
    123a:	98a1      	ld.w      	r5, (r14, 0x4)
    123c:	714d      	lsr      	r5, r3
    123e:	b8a4      	st.w      	r5, (r14, 0x10)
    1240:	3500      	movi      	r5, 0
    1242:	b8a5      	st.w      	r5, (r14, 0x14)
    1244:	9866      	ld.w      	r3, (r14, 0x18)
    1246:	3bdf      	btsti      	r3, 31
    1248:	3500      	movi      	r5, 0
    124a:	3600      	movi      	r6, 0
    124c:	08ad      	bt      	0x13a6	// 13a6 <_fpadd_parts+0x25e>
    124e:	3201      	movi      	r2, 1
    1250:	708c      	lsl      	r2, r3
    1252:	6d8b      	mov      	r6, r2
    1254:	3200      	movi      	r2, 0
    1256:	3300      	movi      	r3, 0
    1258:	2a00      	subi      	r2, 1
    125a:	2b00      	subi      	r3, 1
    125c:	6489      	cmplt      	r2, r2
    125e:	6095      	addc      	r2, r5
    1260:	60d9      	addc      	r3, r6
    1262:	98a0      	ld.w      	r5, (r14, 0x0)
    1264:	98c1      	ld.w      	r6, (r14, 0x4)
    1266:	6948      	and      	r5, r2
    1268:	698c      	and      	r6, r3
    126a:	6c97      	mov      	r2, r5
    126c:	6cdb      	mov      	r3, r6
    126e:	6c8c      	or      	r2, r3
    1270:	3a40      	cmpnei      	r2, 0
    1272:	3500      	movi      	r5, 0
    1274:	6155      	addc      	r5, r5
    1276:	6c97      	mov      	r2, r5
    1278:	3300      	movi      	r3, 0
    127a:	98a4      	ld.w      	r5, (r14, 0x10)
    127c:	98c5      	ld.w      	r6, (r14, 0x14)
    127e:	6d48      	or      	r5, r2
    1280:	6d8c      	or      	r6, r3
    1282:	9061      	ld.w      	r3, (r0, 0x4)
    1284:	9141      	ld.w      	r2, (r1, 0x4)
    1286:	648e      	cmpne      	r3, r2
    1288:	b8a0      	st.w      	r5, (r14, 0x0)
    128a:	b8c1      	st.w      	r6, (r14, 0x4)
    128c:	0b8a      	bt      	0x11a0	// 11a0 <_fpadd_parts+0x58>
    128e:	b761      	st.w      	r3, (r7, 0x4)
    1290:	9800      	ld.w      	r0, (r14, 0x0)
    1292:	9821      	ld.w      	r1, (r14, 0x4)
    1294:	9842      	ld.w      	r2, (r14, 0x8)
    1296:	9863      	ld.w      	r3, (r14, 0xc)
    1298:	6489      	cmplt      	r2, r2
    129a:	6081      	addc      	r2, r0
    129c:	60c5      	addc      	r3, r1
    129e:	b782      	st.w      	r4, (r7, 0x8)
    12a0:	b743      	st.w      	r2, (r7, 0xc)
    12a2:	b764      	st.w      	r3, (r7, 0x10)
    12a4:	3103      	movi      	r1, 3
    12a6:	b720      	st.w      	r1, (r7, 0x0)
    12a8:	123b      	lrw      	r1, 0x1fffffff	// 1414 <_fpadd_parts+0x2cc>
    12aa:	64c4      	cmphs      	r1, r3
    12ac:	0810      	bt      	0x12cc	// 12cc <_fpadd_parts+0x184>
    12ae:	439f      	lsli      	r4, r3, 31
    12b0:	4a01      	lsri      	r0, r2, 1
    12b2:	6c10      	or      	r0, r4
    12b4:	3500      	movi      	r5, 0
    12b6:	3401      	movi      	r4, 1
    12b8:	4b21      	lsri      	r1, r3, 1
    12ba:	6890      	and      	r2, r4
    12bc:	68d4      	and      	r3, r5
    12be:	6c80      	or      	r2, r0
    12c0:	6cc4      	or      	r3, r1
    12c2:	b743      	st.w      	r2, (r7, 0xc)
    12c4:	b764      	st.w      	r3, (r7, 0x10)
    12c6:	9762      	ld.w      	r3, (r7, 0x8)
    12c8:	2300      	addi      	r3, 1
    12ca:	b762      	st.w      	r3, (r7, 0x8)
    12cc:	6c1f      	mov      	r0, r7
    12ce:	140a      	addi      	r14, r14, 40
    12d0:	1484      	pop      	r4-r7
    12d2:	3b42      	cmpnei      	r3, 2
    12d4:	0ba6      	bt      	0x1220	// 1220 <_fpadd_parts+0xd8>
    12d6:	b760      	st.w      	r3, (r7, 0x0)
    12d8:	9061      	ld.w      	r3, (r0, 0x4)
    12da:	b761      	st.w      	r3, (r7, 0x4)
    12dc:	9062      	ld.w      	r3, (r0, 0x8)
    12de:	b762      	st.w      	r3, (r7, 0x8)
    12e0:	9063      	ld.w      	r3, (r0, 0xc)
    12e2:	b763      	st.w      	r3, (r7, 0xc)
    12e4:	9064      	ld.w      	r3, (r0, 0x10)
    12e6:	9141      	ld.w      	r2, (r1, 0x4)
    12e8:	b764      	st.w      	r3, (r7, 0x10)
    12ea:	9061      	ld.w      	r3, (r0, 0x4)
    12ec:	68c8      	and      	r3, r2
    12ee:	b761      	st.w      	r3, (r7, 0x4)
    12f0:	6c1f      	mov      	r0, r7
    12f2:	0797      	br      	0x1220	// 1220 <_fpadd_parts+0xd8>
    12f4:	98e2      	ld.w      	r7, (r14, 0x8)
    12f6:	651c      	cmphs      	r7, r4
    12f8:	0b7c      	bt      	0x11f0	// 11f0 <_fpadd_parts+0xa8>
    12fa:	078c      	br      	0x1212	// 1212 <_fpadd_parts+0xca>
    12fc:	9802      	ld.w      	r0, (r14, 0x8)
    12fe:	9823      	ld.w      	r1, (r14, 0xc)
    1300:	9840      	ld.w      	r2, (r14, 0x0)
    1302:	9861      	ld.w      	r3, (r14, 0x4)
    1304:	6400      	cmphs      	r0, r0
    1306:	600b      	subc      	r0, r2
    1308:	604f      	subc      	r1, r3
    130a:	0754      	br      	0x11b2	// 11b2 <_fpadd_parts+0x6a>
    130c:	3200      	movi      	r2, 0
    130e:	3300      	movi      	r3, 0
    1310:	6d17      	mov      	r4, r5
    1312:	b842      	st.w      	r2, (r14, 0x8)
    1314:	b863      	st.w      	r3, (r14, 0xc)
    1316:	0741      	br      	0x1198	// 1198 <_fpadd_parts+0x50>
    1318:	3a44      	cmpnei      	r2, 4
    131a:	0b83      	bt      	0x1220	// 1220 <_fpadd_parts+0xd8>
    131c:	9041      	ld.w      	r2, (r0, 0x4)
    131e:	9161      	ld.w      	r3, (r1, 0x4)
    1320:	64ca      	cmpne      	r2, r3
    1322:	0f7f      	bf      	0x1220	// 1220 <_fpadd_parts+0xd8>
    1324:	111d      	lrw      	r0, 0x961c	// 1418 <_fpadd_parts+0x2d0>
    1326:	077d      	br      	0x1220	// 1220 <_fpadd_parts+0xd8>
    1328:	3200      	movi      	r2, 0
    132a:	608e      	subu      	r2, r3
    132c:	072d      	br      	0x1186	// 1186 <_fpadd_parts+0x3e>
    132e:	3301      	movi      	r3, 1
    1330:	b761      	st.w      	r3, (r7, 0x4)
    1332:	3200      	movi      	r2, 0
    1334:	3300      	movi      	r3, 0
    1336:	6488      	cmphs      	r2, r2
    1338:	6083      	subc      	r2, r0
    133a:	60c7      	subc      	r3, r1
    133c:	b782      	st.w      	r4, (r7, 0x8)
    133e:	b743      	st.w      	r2, (r7, 0xc)
    1340:	b764      	st.w      	r3, (r7, 0x10)
    1342:	0741      	br      	0x11c4	// 11c4 <_fpadd_parts+0x7c>
    1344:	3b40      	cmpnei      	r3, 0
    1346:	0f29      	bf      	0x1198	// 1198 <_fpadd_parts+0x50>
    1348:	3300      	movi      	r3, 0
    134a:	2b1f      	subi      	r3, 32
    134c:	60c8      	addu      	r3, r2
    134e:	3bdf      	btsti      	r3, 31
    1350:	6108      	addu      	r4, r2
    1352:	b866      	st.w      	r3, (r14, 0x18)
    1354:	0849      	bt      	0x13e6	// 13e6 <_fpadd_parts+0x29e>
    1356:	9863      	ld.w      	r3, (r14, 0xc)
    1358:	98a6      	ld.w      	r5, (r14, 0x18)
    135a:	70d5      	lsr      	r3, r5
    135c:	b864      	st.w      	r3, (r14, 0x10)
    135e:	3300      	movi      	r3, 0
    1360:	b865      	st.w      	r3, (r14, 0x14)
    1362:	9866      	ld.w      	r3, (r14, 0x18)
    1364:	3bdf      	btsti      	r3, 31
    1366:	3500      	movi      	r5, 0
    1368:	3600      	movi      	r6, 0
    136a:	083a      	bt      	0x13de	// 13de <_fpadd_parts+0x296>
    136c:	3201      	movi      	r2, 1
    136e:	708c      	lsl      	r2, r3
    1370:	6d8b      	mov      	r6, r2
    1372:	3200      	movi      	r2, 0
    1374:	3300      	movi      	r3, 0
    1376:	2a00      	subi      	r2, 1
    1378:	2b00      	subi      	r3, 1
    137a:	6489      	cmplt      	r2, r2
    137c:	6095      	addc      	r2, r5
    137e:	60d9      	addc      	r3, r6
    1380:	98a2      	ld.w      	r5, (r14, 0x8)
    1382:	98c3      	ld.w      	r6, (r14, 0xc)
    1384:	6948      	and      	r5, r2
    1386:	698c      	and      	r6, r3
    1388:	6c97      	mov      	r2, r5
    138a:	6cdb      	mov      	r3, r6
    138c:	6c8c      	or      	r2, r3
    138e:	3a40      	cmpnei      	r2, 0
    1390:	3500      	movi      	r5, 0
    1392:	6155      	addc      	r5, r5
    1394:	6c97      	mov      	r2, r5
    1396:	3300      	movi      	r3, 0
    1398:	98a4      	ld.w      	r5, (r14, 0x10)
    139a:	98c5      	ld.w      	r6, (r14, 0x14)
    139c:	6d48      	or      	r5, r2
    139e:	6d8c      	or      	r6, r3
    13a0:	b8a2      	st.w      	r5, (r14, 0x8)
    13a2:	b8c3      	st.w      	r6, (r14, 0xc)
    13a4:	06fa      	br      	0x1198	// 1198 <_fpadd_parts+0x50>
    13a6:	3301      	movi      	r3, 1
    13a8:	70c8      	lsl      	r3, r2
    13aa:	6d4f      	mov      	r5, r3
    13ac:	0754      	br      	0x1254	// 1254 <_fpadd_parts+0x10c>
    13ae:	9861      	ld.w      	r3, (r14, 0x4)
    13b0:	361f      	movi      	r6, 31
    13b2:	43a1      	lsli      	r5, r3, 1
    13b4:	618a      	subu      	r6, r2
    13b6:	7158      	lsl      	r5, r6
    13b8:	b8a9      	st.w      	r5, (r14, 0x24)
    13ba:	98a0      	ld.w      	r5, (r14, 0x0)
    13bc:	98c1      	ld.w      	r6, (r14, 0x4)
    13be:	b8a7      	st.w      	r5, (r14, 0x1c)
    13c0:	b8c8      	st.w      	r6, (r14, 0x20)
    13c2:	9867      	ld.w      	r3, (r14, 0x1c)
    13c4:	70c9      	lsr      	r3, r2
    13c6:	98a9      	ld.w      	r5, (r14, 0x24)
    13c8:	6cd4      	or      	r3, r5
    13ca:	b864      	st.w      	r3, (r14, 0x10)
    13cc:	9868      	ld.w      	r3, (r14, 0x20)
    13ce:	70c9      	lsr      	r3, r2
    13d0:	b865      	st.w      	r3, (r14, 0x14)
    13d2:	0739      	br      	0x1244	// 1244 <_fpadd_parts+0xfc>
    13d4:	3100      	movi      	r1, 0
    13d6:	2901      	subi      	r1, 2
    13d8:	6404      	cmphs      	r1, r0
    13da:	0b01      	bt      	0x11dc	// 11dc <_fpadd_parts+0x94>
    13dc:	0764      	br      	0x12a4	// 12a4 <_fpadd_parts+0x15c>
    13de:	3301      	movi      	r3, 1
    13e0:	70c8      	lsl      	r3, r2
    13e2:	6d4f      	mov      	r5, r3
    13e4:	07c7      	br      	0x1372	// 1372 <_fpadd_parts+0x22a>
    13e6:	9863      	ld.w      	r3, (r14, 0xc)
    13e8:	43c1      	lsli      	r6, r3, 1
    13ea:	351f      	movi      	r5, 31
    13ec:	5d69      	subu      	r3, r5, r2
    13ee:	6d5b      	mov      	r5, r6
    13f0:	714c      	lsl      	r5, r3
    13f2:	b8a9      	st.w      	r5, (r14, 0x24)
    13f4:	98a2      	ld.w      	r5, (r14, 0x8)
    13f6:	98c3      	ld.w      	r6, (r14, 0xc)
    13f8:	b8a7      	st.w      	r5, (r14, 0x1c)
    13fa:	b8c8      	st.w      	r6, (r14, 0x20)
    13fc:	9867      	ld.w      	r3, (r14, 0x1c)
    13fe:	70c9      	lsr      	r3, r2
    1400:	98a9      	ld.w      	r5, (r14, 0x24)
    1402:	6cd4      	or      	r3, r5
    1404:	b864      	st.w      	r3, (r14, 0x10)
    1406:	9868      	ld.w      	r3, (r14, 0x20)
    1408:	70c9      	lsr      	r3, r2
    140a:	b865      	st.w      	r3, (r14, 0x14)
    140c:	07ab      	br      	0x1362	// 1362 <_fpadd_parts+0x21a>
    140e:	0000      	bkpt
    1410:	0fffffff 	.long	0x0fffffff
    1414:	1fffffff 	.long	0x1fffffff
    1418:	0000961c 	.long	0x0000961c

0000141c <__adddf3>:
    141c:	14d0      	push      	r15
    141e:	1433      	subi      	r14, r14, 76
    1420:	b800      	st.w      	r0, (r14, 0x0)
    1422:	b821      	st.w      	r1, (r14, 0x4)
    1424:	6c3b      	mov      	r0, r14
    1426:	1904      	addi      	r1, r14, 16
    1428:	b863      	st.w      	r3, (r14, 0xc)
    142a:	b842      	st.w      	r2, (r14, 0x8)
    142c:	e00004f2 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1430:	1909      	addi      	r1, r14, 36
    1432:	1802      	addi      	r0, r14, 8
    1434:	e00004ee 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1438:	1a0e      	addi      	r2, r14, 56
    143a:	1909      	addi      	r1, r14, 36
    143c:	1804      	addi      	r0, r14, 16
    143e:	e3fffe85 	bsr      	0x1148	// 1148 <_fpadd_parts>
    1442:	e0000419 	bsr      	0x1c74	// 1c74 <__pack_d>
    1446:	1413      	addi      	r14, r14, 76
    1448:	1490      	pop      	r15
	...

0000144c <__subdf3>:
    144c:	14d0      	push      	r15
    144e:	1433      	subi      	r14, r14, 76
    1450:	b800      	st.w      	r0, (r14, 0x0)
    1452:	b821      	st.w      	r1, (r14, 0x4)
    1454:	6c3b      	mov      	r0, r14
    1456:	1904      	addi      	r1, r14, 16
    1458:	b842      	st.w      	r2, (r14, 0x8)
    145a:	b863      	st.w      	r3, (r14, 0xc)
    145c:	e00004da 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1460:	1909      	addi      	r1, r14, 36
    1462:	1802      	addi      	r0, r14, 8
    1464:	e00004d6 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1468:	986a      	ld.w      	r3, (r14, 0x28)
    146a:	3201      	movi      	r2, 1
    146c:	6cc9      	xor      	r3, r2
    146e:	1909      	addi      	r1, r14, 36
    1470:	1a0e      	addi      	r2, r14, 56
    1472:	1804      	addi      	r0, r14, 16
    1474:	b86a      	st.w      	r3, (r14, 0x28)
    1476:	e3fffe69 	bsr      	0x1148	// 1148 <_fpadd_parts>
    147a:	e00003fd 	bsr      	0x1c74	// 1c74 <__pack_d>
    147e:	1413      	addi      	r14, r14, 76
    1480:	1490      	pop      	r15
	...

00001484 <__muldf3>:
    1484:	14d4      	push      	r4-r7, r15
    1486:	143b      	subi      	r14, r14, 108
    1488:	b808      	st.w      	r0, (r14, 0x20)
    148a:	b829      	st.w      	r1, (r14, 0x24)
    148c:	1808      	addi      	r0, r14, 32
    148e:	190c      	addi      	r1, r14, 48
    1490:	b86b      	st.w      	r3, (r14, 0x2c)
    1492:	b84a      	st.w      	r2, (r14, 0x28)
    1494:	e00004be 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1498:	1911      	addi      	r1, r14, 68
    149a:	180a      	addi      	r0, r14, 40
    149c:	e00004ba 	bsr      	0x1e10	// 1e10 <__unpack_d>
    14a0:	986c      	ld.w      	r3, (r14, 0x30)
    14a2:	3b01      	cmphsi      	r3, 2
    14a4:	0cac      	bf      	0x15fc	// 15fc <__muldf3+0x178>
    14a6:	9851      	ld.w      	r2, (r14, 0x44)
    14a8:	3a01      	cmphsi      	r2, 2
    14aa:	0c9c      	bf      	0x15e2	// 15e2 <__muldf3+0x15e>
    14ac:	3b44      	cmpnei      	r3, 4
    14ae:	0ca5      	bf      	0x15f8	// 15f8 <__muldf3+0x174>
    14b0:	3a44      	cmpnei      	r2, 4
    14b2:	0c96      	bf      	0x15de	// 15de <__muldf3+0x15a>
    14b4:	3b42      	cmpnei      	r3, 2
    14b6:	0ca3      	bf      	0x15fc	// 15fc <__muldf3+0x178>
    14b8:	3a42      	cmpnei      	r2, 2
    14ba:	0c94      	bf      	0x15e2	// 15e2 <__muldf3+0x15e>
    14bc:	98ef      	ld.w      	r7, (r14, 0x3c)
    14be:	98b4      	ld.w      	r5, (r14, 0x50)
    14c0:	9875      	ld.w      	r3, (r14, 0x54)
    14c2:	6d8f      	mov      	r6, r3
    14c4:	6c9f      	mov      	r2, r7
    14c6:	3300      	movi      	r3, 0
    14c8:	6c17      	mov      	r0, r5
    14ca:	3100      	movi      	r1, 0
    14cc:	e00002ac 	bsr      	0x1a24	// 1a24 <__muldi3>
    14d0:	b804      	st.w      	r0, (r14, 0x10)
    14d2:	b825      	st.w      	r1, (r14, 0x14)
    14d4:	6c9f      	mov      	r2, r7
    14d6:	3300      	movi      	r3, 0
    14d8:	6c1b      	mov      	r0, r6
    14da:	3100      	movi      	r1, 0
    14dc:	9890      	ld.w      	r4, (r14, 0x40)
    14de:	b8c2      	st.w      	r6, (r14, 0x8)
    14e0:	e00002a2 	bsr      	0x1a24	// 1a24 <__muldi3>
    14e4:	6d83      	mov      	r6, r0
    14e6:	6dc7      	mov      	r7, r1
    14e8:	9842      	ld.w      	r2, (r14, 0x8)
    14ea:	3300      	movi      	r3, 0
    14ec:	6c13      	mov      	r0, r4
    14ee:	3100      	movi      	r1, 0
    14f0:	e000029a 	bsr      	0x1a24	// 1a24 <__muldi3>
    14f4:	b806      	st.w      	r0, (r14, 0x18)
    14f6:	b827      	st.w      	r1, (r14, 0x1c)
    14f8:	6c97      	mov      	r2, r5
    14fa:	3300      	movi      	r3, 0
    14fc:	6c13      	mov      	r0, r4
    14fe:	3100      	movi      	r1, 0
    1500:	e0000292 	bsr      	0x1a24	// 1a24 <__muldi3>
    1504:	6401      	cmplt      	r0, r0
    1506:	6019      	addc      	r0, r6
    1508:	605d      	addc      	r1, r7
    150a:	65c4      	cmphs      	r1, r7
    150c:	0c91      	bf      	0x162e	// 162e <__muldf3+0x1aa>
    150e:	645e      	cmpne      	r7, r1
    1510:	0c8d      	bf      	0x162a	// 162a <__muldf3+0x1a6>
    1512:	3300      	movi      	r3, 0
    1514:	3400      	movi      	r4, 0
    1516:	b862      	st.w      	r3, (r14, 0x8)
    1518:	b883      	st.w      	r4, (r14, 0xc)
    151a:	9884      	ld.w      	r4, (r14, 0x10)
    151c:	98a5      	ld.w      	r5, (r14, 0x14)
    151e:	3600      	movi      	r6, 0
    1520:	6dc3      	mov      	r7, r0
    1522:	6c93      	mov      	r2, r4
    1524:	6cd7      	mov      	r3, r5
    1526:	6489      	cmplt      	r2, r2
    1528:	6099      	addc      	r2, r6
    152a:	60dd      	addc      	r3, r7
    152c:	6d8b      	mov      	r6, r2
    152e:	6dcf      	mov      	r7, r3
    1530:	6c93      	mov      	r2, r4
    1532:	6cd7      	mov      	r3, r5
    1534:	64dc      	cmphs      	r7, r3
    1536:	0c70      	bf      	0x1616	// 1616 <__muldf3+0x192>
    1538:	65ce      	cmpne      	r3, r7
    153a:	0c6c      	bf      	0x1612	// 1612 <__muldf3+0x18e>
    153c:	6c87      	mov      	r2, r1
    153e:	3300      	movi      	r3, 0
    1540:	9806      	ld.w      	r0, (r14, 0x18)
    1542:	9827      	ld.w      	r1, (r14, 0x1c)
    1544:	6401      	cmplt      	r0, r0
    1546:	6009      	addc      	r0, r2
    1548:	604d      	addc      	r1, r3
    154a:	6c83      	mov      	r2, r0
    154c:	6cc7      	mov      	r3, r1
    154e:	9802      	ld.w      	r0, (r14, 0x8)
    1550:	9823      	ld.w      	r1, (r14, 0xc)
    1552:	6401      	cmplt      	r0, r0
    1554:	6009      	addc      	r0, r2
    1556:	604d      	addc      	r1, r3
    1558:	6c83      	mov      	r2, r0
    155a:	6cc7      	mov      	r3, r1
    155c:	988e      	ld.w      	r4, (r14, 0x38)
    155e:	9833      	ld.w      	r1, (r14, 0x4c)
    1560:	6104      	addu      	r4, r1
    1562:	5c2e      	addi      	r1, r4, 4
    1564:	b838      	st.w      	r1, (r14, 0x60)
    1566:	980d      	ld.w      	r0, (r14, 0x34)
    1568:	9832      	ld.w      	r1, (r14, 0x48)
    156a:	6442      	cmpne      	r0, r1
    156c:	12b0      	lrw      	r5, 0x1fffffff	// 16ac <__muldf3+0x228>
    156e:	3100      	movi      	r1, 0
    1570:	6045      	addc      	r1, r1
    1572:	64d4      	cmphs      	r5, r3
    1574:	b837      	st.w      	r1, (r14, 0x5c)
    1576:	0879      	bt      	0x1668	// 1668 <__muldf3+0x1e4>
    1578:	2404      	addi      	r4, 5
    157a:	b8a4      	st.w      	r5, (r14, 0x10)
    157c:	3001      	movi      	r0, 1
    157e:	3100      	movi      	r1, 0
    1580:	6808      	and      	r0, r2
    1582:	684c      	and      	r1, r3
    1584:	6c04      	or      	r0, r1
    1586:	3840      	cmpnei      	r0, 0
    1588:	b882      	st.w      	r4, (r14, 0x8)
    158a:	0c0e      	bf      	0x15a6	// 15a6 <__muldf3+0x122>
    158c:	473f      	lsli      	r1, r7, 31
    158e:	4e01      	lsri      	r0, r6, 1
    1590:	6c04      	or      	r0, r1
    1592:	4f21      	lsri      	r1, r7, 1
    1594:	b800      	st.w      	r0, (r14, 0x0)
    1596:	b821      	st.w      	r1, (r14, 0x4)
    1598:	3180      	movi      	r1, 128
    159a:	98c0      	ld.w      	r6, (r14, 0x0)
    159c:	98e1      	ld.w      	r7, (r14, 0x4)
    159e:	3000      	movi      	r0, 0
    15a0:	4138      	lsli      	r1, r1, 24
    15a2:	6d80      	or      	r6, r0
    15a4:	6dc4      	or      	r7, r1
    15a6:	4b21      	lsri      	r1, r3, 1
    15a8:	43bf      	lsli      	r5, r3, 31
    15aa:	4a01      	lsri      	r0, r2, 1
    15ac:	6cc7      	mov      	r3, r1
    15ae:	9824      	ld.w      	r1, (r14, 0x10)
    15b0:	6d40      	or      	r5, r0
    15b2:	64c4      	cmphs      	r1, r3
    15b4:	6c97      	mov      	r2, r5
    15b6:	2400      	addi      	r4, 1
    15b8:	0fe2      	bf      	0x157c	// 157c <__muldf3+0xf8>
    15ba:	9822      	ld.w      	r1, (r14, 0x8)
    15bc:	b838      	st.w      	r1, (r14, 0x60)
    15be:	30ff      	movi      	r0, 255
    15c0:	3100      	movi      	r1, 0
    15c2:	6808      	and      	r0, r2
    15c4:	684c      	and      	r1, r3
    15c6:	3480      	movi      	r4, 128
    15c8:	6502      	cmpne      	r0, r4
    15ca:	0c37      	bf      	0x1638	// 1638 <__muldf3+0x1b4>
    15cc:	b859      	st.w      	r2, (r14, 0x64)
    15ce:	b87a      	st.w      	r3, (r14, 0x68)
    15d0:	3303      	movi      	r3, 3
    15d2:	b876      	st.w      	r3, (r14, 0x58)
    15d4:	1816      	addi      	r0, r14, 88
    15d6:	e000034f 	bsr      	0x1c74	// 1c74 <__pack_d>
    15da:	141b      	addi      	r14, r14, 108
    15dc:	1494      	pop      	r4-r7, r15
    15de:	3b42      	cmpnei      	r3, 2
    15e0:	0c42      	bf      	0x1664	// 1664 <__muldf3+0x1e0>
    15e2:	9872      	ld.w      	r3, (r14, 0x48)
    15e4:	984d      	ld.w      	r2, (r14, 0x34)
    15e6:	64ca      	cmpne      	r2, r3
    15e8:	3300      	movi      	r3, 0
    15ea:	60cd      	addc      	r3, r3
    15ec:	1811      	addi      	r0, r14, 68
    15ee:	b872      	st.w      	r3, (r14, 0x48)
    15f0:	e0000342 	bsr      	0x1c74	// 1c74 <__pack_d>
    15f4:	141b      	addi      	r14, r14, 108
    15f6:	1494      	pop      	r4-r7, r15
    15f8:	3a42      	cmpnei      	r2, 2
    15fa:	0c35      	bf      	0x1664	// 1664 <__muldf3+0x1e0>
    15fc:	984d      	ld.w      	r2, (r14, 0x34)
    15fe:	9872      	ld.w      	r3, (r14, 0x48)
    1600:	64ca      	cmpne      	r2, r3
    1602:	3300      	movi      	r3, 0
    1604:	60cd      	addc      	r3, r3
    1606:	180c      	addi      	r0, r14, 48
    1608:	b86d      	st.w      	r3, (r14, 0x34)
    160a:	e0000335 	bsr      	0x1c74	// 1c74 <__pack_d>
    160e:	141b      	addi      	r14, r14, 108
    1610:	1494      	pop      	r4-r7, r15
    1612:	6498      	cmphs      	r6, r2
    1614:	0b94      	bt      	0x153c	// 153c <__muldf3+0xb8>
    1616:	9882      	ld.w      	r4, (r14, 0x8)
    1618:	98a3      	ld.w      	r5, (r14, 0xc)
    161a:	3201      	movi      	r2, 1
    161c:	3300      	movi      	r3, 0
    161e:	6511      	cmplt      	r4, r4
    1620:	6109      	addc      	r4, r2
    1622:	614d      	addc      	r5, r3
    1624:	b882      	st.w      	r4, (r14, 0x8)
    1626:	b8a3      	st.w      	r5, (r14, 0xc)
    1628:	078a      	br      	0x153c	// 153c <__muldf3+0xb8>
    162a:	6580      	cmphs      	r0, r6
    162c:	0b73      	bt      	0x1512	// 1512 <__muldf3+0x8e>
    162e:	3300      	movi      	r3, 0
    1630:	3401      	movi      	r4, 1
    1632:	b862      	st.w      	r3, (r14, 0x8)
    1634:	b883      	st.w      	r4, (r14, 0xc)
    1636:	0772      	br      	0x151a	// 151a <__muldf3+0x96>
    1638:	3940      	cmpnei      	r1, 0
    163a:	0bc9      	bt      	0x15cc	// 15cc <__muldf3+0x148>
    163c:	3180      	movi      	r1, 128
    163e:	4121      	lsli      	r1, r1, 1
    1640:	6848      	and      	r1, r2
    1642:	3940      	cmpnei      	r1, 0
    1644:	0bc4      	bt      	0x15cc	// 15cc <__muldf3+0x148>
    1646:	6c5b      	mov      	r1, r6
    1648:	6c5c      	or      	r1, r7
    164a:	3940      	cmpnei      	r1, 0
    164c:	0fc0      	bf      	0x15cc	// 15cc <__muldf3+0x148>
    164e:	3080      	movi      	r0, 128
    1650:	3100      	movi      	r1, 0
    1652:	6401      	cmplt      	r0, r0
    1654:	6009      	addc      	r0, r2
    1656:	604d      	addc      	r1, r3
    1658:	34ff      	movi      	r4, 255
    165a:	6d43      	mov      	r5, r0
    165c:	6951      	andn      	r5, r4
    165e:	6c97      	mov      	r2, r5
    1660:	6cc7      	mov      	r3, r1
    1662:	07b5      	br      	0x15cc	// 15cc <__muldf3+0x148>
    1664:	1013      	lrw      	r0, 0x961c	// 16b0 <__muldf3+0x22c>
    1666:	07b8      	br      	0x15d6	// 15d6 <__muldf3+0x152>
    1668:	1033      	lrw      	r1, 0xfffffff	// 16b4 <__muldf3+0x230>
    166a:	64c4      	cmphs      	r1, r3
    166c:	0fa9      	bf      	0x15be	// 15be <__muldf3+0x13a>
    166e:	2402      	addi      	r4, 3
    1670:	b822      	st.w      	r1, (r14, 0x8)
    1672:	4a1f      	lsri      	r0, r2, 31
    1674:	4321      	lsli      	r1, r3, 1
    1676:	42a1      	lsli      	r5, r2, 1
    1678:	6c04      	or      	r0, r1
    167a:	3fdf      	btsti      	r7, 31
    167c:	b880      	st.w      	r4, (r14, 0x0)
    167e:	6c97      	mov      	r2, r5
    1680:	6cc3      	mov      	r3, r0
    1682:	0c07      	bf      	0x1690	// 1690 <__muldf3+0x20c>
    1684:	3001      	movi      	r0, 1
    1686:	3100      	movi      	r1, 0
    1688:	6c08      	or      	r0, r2
    168a:	6c4c      	or      	r1, r3
    168c:	6c83      	mov      	r2, r0
    168e:	6cc7      	mov      	r3, r1
    1690:	4721      	lsli      	r1, r7, 1
    1692:	4e1f      	lsri      	r0, r6, 31
    1694:	6c04      	or      	r0, r1
    1696:	9822      	ld.w      	r1, (r14, 0x8)
    1698:	46a1      	lsli      	r5, r6, 1
    169a:	64c4      	cmphs      	r1, r3
    169c:	6d97      	mov      	r6, r5
    169e:	6dc3      	mov      	r7, r0
    16a0:	2c00      	subi      	r4, 1
    16a2:	0be8      	bt      	0x1672	// 1672 <__muldf3+0x1ee>
    16a4:	9820      	ld.w      	r1, (r14, 0x0)
    16a6:	b838      	st.w      	r1, (r14, 0x60)
    16a8:	078b      	br      	0x15be	// 15be <__muldf3+0x13a>
    16aa:	0000      	bkpt
    16ac:	1fffffff 	.long	0x1fffffff
    16b0:	0000961c 	.long	0x0000961c
    16b4:	0fffffff 	.long	0x0fffffff

000016b8 <__divdf3>:
    16b8:	14d4      	push      	r4-r7, r15
    16ba:	1432      	subi      	r14, r14, 72
    16bc:	b804      	st.w      	r0, (r14, 0x10)
    16be:	b825      	st.w      	r1, (r14, 0x14)
    16c0:	1804      	addi      	r0, r14, 16
    16c2:	1908      	addi      	r1, r14, 32
    16c4:	b867      	st.w      	r3, (r14, 0x1c)
    16c6:	b846      	st.w      	r2, (r14, 0x18)
    16c8:	e00003a4 	bsr      	0x1e10	// 1e10 <__unpack_d>
    16cc:	190d      	addi      	r1, r14, 52
    16ce:	1806      	addi      	r0, r14, 24
    16d0:	e00003a0 	bsr      	0x1e10	// 1e10 <__unpack_d>
    16d4:	9868      	ld.w      	r3, (r14, 0x20)
    16d6:	3b01      	cmphsi      	r3, 2
    16d8:	0c66      	bf      	0x17a4	// 17a4 <__divdf3+0xec>
    16da:	982d      	ld.w      	r1, (r14, 0x34)
    16dc:	3901      	cmphsi      	r1, 2
    16de:	0c92      	bf      	0x1802	// 1802 <__divdf3+0x14a>
    16e0:	9849      	ld.w      	r2, (r14, 0x24)
    16e2:	980e      	ld.w      	r0, (r14, 0x38)
    16e4:	6c81      	xor      	r2, r0
    16e6:	3b44      	cmpnei      	r3, 4
    16e8:	b849      	st.w      	r2, (r14, 0x24)
    16ea:	0c62      	bf      	0x17ae	// 17ae <__divdf3+0xf6>
    16ec:	3b42      	cmpnei      	r3, 2
    16ee:	0c60      	bf      	0x17ae	// 17ae <__divdf3+0xf6>
    16f0:	3944      	cmpnei      	r1, 4
    16f2:	0c62      	bf      	0x17b6	// 17b6 <__divdf3+0xfe>
    16f4:	3942      	cmpnei      	r1, 2
    16f6:	0c82      	bf      	0x17fa	// 17fa <__divdf3+0x142>
    16f8:	982a      	ld.w      	r1, (r14, 0x28)
    16fa:	986f      	ld.w      	r3, (r14, 0x3c)
    16fc:	604e      	subu      	r1, r3
    16fe:	9890      	ld.w      	r4, (r14, 0x40)
    1700:	98b1      	ld.w      	r5, (r14, 0x44)
    1702:	984b      	ld.w      	r2, (r14, 0x2c)
    1704:	986c      	ld.w      	r3, (r14, 0x30)
    1706:	654c      	cmphs      	r3, r5
    1708:	b82a      	st.w      	r1, (r14, 0x28)
    170a:	6d93      	mov      	r6, r4
    170c:	6dd7      	mov      	r7, r5
    170e:	0c05      	bf      	0x1718	// 1718 <__divdf3+0x60>
    1710:	64d6      	cmpne      	r5, r3
    1712:	080b      	bt      	0x1728	// 1728 <__divdf3+0x70>
    1714:	6508      	cmphs      	r2, r4
    1716:	0809      	bt      	0x1728	// 1728 <__divdf3+0x70>
    1718:	4a9f      	lsri      	r4, r2, 31
    171a:	4301      	lsli      	r0, r3, 1
    171c:	42a1      	lsli      	r5, r2, 1
    171e:	6d00      	or      	r4, r0
    1720:	2900      	subi      	r1, 1
    1722:	6c97      	mov      	r2, r5
    1724:	6cd3      	mov      	r3, r4
    1726:	b82a      	st.w      	r1, (r14, 0x28)
    1728:	3000      	movi      	r0, 0
    172a:	3100      	movi      	r1, 0
    172c:	b802      	st.w      	r0, (r14, 0x8)
    172e:	b823      	st.w      	r1, (r14, 0xc)
    1730:	3180      	movi      	r1, 128
    1732:	343d      	movi      	r4, 61
    1734:	3000      	movi      	r0, 0
    1736:	4135      	lsli      	r1, r1, 21
    1738:	b8c0      	st.w      	r6, (r14, 0x0)
    173a:	b8e1      	st.w      	r7, (r14, 0x4)
    173c:	98a0      	ld.w      	r5, (r14, 0x0)
    173e:	98c1      	ld.w      	r6, (r14, 0x4)
    1740:	658c      	cmphs      	r3, r6
    1742:	0c10      	bf      	0x1762	// 1762 <__divdf3+0xaa>
    1744:	64da      	cmpne      	r6, r3
    1746:	0803      	bt      	0x174c	// 174c <__divdf3+0x94>
    1748:	6548      	cmphs      	r2, r5
    174a:	0c0c      	bf      	0x1762	// 1762 <__divdf3+0xaa>
    174c:	98a2      	ld.w      	r5, (r14, 0x8)
    174e:	98c3      	ld.w      	r6, (r14, 0xc)
    1750:	6d40      	or      	r5, r0
    1752:	6d84      	or      	r6, r1
    1754:	b8a2      	st.w      	r5, (r14, 0x8)
    1756:	b8c3      	st.w      	r6, (r14, 0xc)
    1758:	98a0      	ld.w      	r5, (r14, 0x0)
    175a:	98c1      	ld.w      	r6, (r14, 0x4)
    175c:	6488      	cmphs      	r2, r2
    175e:	6097      	subc      	r2, r5
    1760:	60db      	subc      	r3, r6
    1762:	41bf      	lsli      	r5, r1, 31
    1764:	48e1      	lsri      	r7, r0, 1
    1766:	6d97      	mov      	r6, r5
    1768:	49a1      	lsri      	r5, r1, 1
    176a:	6d9c      	or      	r6, r7
    176c:	6c57      	mov      	r1, r5
    176e:	4abf      	lsri      	r5, r2, 31
    1770:	6c1b      	mov      	r0, r6
    1772:	2c00      	subi      	r4, 1
    1774:	6d97      	mov      	r6, r5
    1776:	43a1      	lsli      	r5, r3, 1
    1778:	6d94      	or      	r6, r5
    177a:	4261      	lsli      	r3, r2, 1
    177c:	3c40      	cmpnei      	r4, 0
    177e:	6dcf      	mov      	r7, r3
    1780:	6c8f      	mov      	r2, r3
    1782:	6cdb      	mov      	r3, r6
    1784:	0bdc      	bt      	0x173c	// 173c <__divdf3+0x84>
    1786:	30ff      	movi      	r0, 255
    1788:	3100      	movi      	r1, 0
    178a:	9882      	ld.w      	r4, (r14, 0x8)
    178c:	98a3      	ld.w      	r5, (r14, 0xc)
    178e:	6900      	and      	r4, r0
    1790:	6944      	and      	r5, r1
    1792:	6c13      	mov      	r0, r4
    1794:	6c57      	mov      	r1, r5
    1796:	3480      	movi      	r4, 128
    1798:	6502      	cmpne      	r0, r4
    179a:	0c15      	bf      	0x17c4	// 17c4 <__divdf3+0x10c>
    179c:	9862      	ld.w      	r3, (r14, 0x8)
    179e:	9883      	ld.w      	r4, (r14, 0xc)
    17a0:	b86b      	st.w      	r3, (r14, 0x2c)
    17a2:	b88c      	st.w      	r4, (r14, 0x30)
    17a4:	1808      	addi      	r0, r14, 32
    17a6:	e0000267 	bsr      	0x1c74	// 1c74 <__pack_d>
    17aa:	1412      	addi      	r14, r14, 72
    17ac:	1494      	pop      	r4-r7, r15
    17ae:	644e      	cmpne      	r3, r1
    17b0:	0bfa      	bt      	0x17a4	// 17a4 <__divdf3+0xec>
    17b2:	1016      	lrw      	r0, 0x961c	// 1808 <__divdf3+0x150>
    17b4:	07f9      	br      	0x17a6	// 17a6 <__divdf3+0xee>
    17b6:	3300      	movi      	r3, 0
    17b8:	3400      	movi      	r4, 0
    17ba:	b86b      	st.w      	r3, (r14, 0x2c)
    17bc:	b88c      	st.w      	r4, (r14, 0x30)
    17be:	b86a      	st.w      	r3, (r14, 0x28)
    17c0:	1808      	addi      	r0, r14, 32
    17c2:	07f2      	br      	0x17a6	// 17a6 <__divdf3+0xee>
    17c4:	3940      	cmpnei      	r1, 0
    17c6:	0beb      	bt      	0x179c	// 179c <__divdf3+0xe4>
    17c8:	3180      	movi      	r1, 128
    17ca:	4121      	lsli      	r1, r1, 1
    17cc:	9882      	ld.w      	r4, (r14, 0x8)
    17ce:	98a3      	ld.w      	r5, (r14, 0xc)
    17d0:	6850      	and      	r1, r4
    17d2:	3940      	cmpnei      	r1, 0
    17d4:	0be4      	bt      	0x179c	// 179c <__divdf3+0xe4>
    17d6:	6c98      	or      	r2, r6
    17d8:	3a40      	cmpnei      	r2, 0
    17da:	0fe1      	bf      	0x179c	// 179c <__divdf3+0xe4>
    17dc:	3280      	movi      	r2, 128
    17de:	3300      	movi      	r3, 0
    17e0:	6c13      	mov      	r0, r4
    17e2:	6c57      	mov      	r1, r5
    17e4:	6401      	cmplt      	r0, r0
    17e6:	6009      	addc      	r0, r2
    17e8:	604d      	addc      	r1, r3
    17ea:	6c83      	mov      	r2, r0
    17ec:	6cc7      	mov      	r3, r1
    17ee:	6c0b      	mov      	r0, r2
    17f0:	31ff      	movi      	r1, 255
    17f2:	6805      	andn      	r0, r1
    17f4:	b802      	st.w      	r0, (r14, 0x8)
    17f6:	b863      	st.w      	r3, (r14, 0xc)
    17f8:	07d2      	br      	0x179c	// 179c <__divdf3+0xe4>
    17fa:	3304      	movi      	r3, 4
    17fc:	b868      	st.w      	r3, (r14, 0x20)
    17fe:	1808      	addi      	r0, r14, 32
    1800:	07d3      	br      	0x17a6	// 17a6 <__divdf3+0xee>
    1802:	180d      	addi      	r0, r14, 52
    1804:	07d1      	br      	0x17a6	// 17a6 <__divdf3+0xee>
    1806:	0000      	bkpt
    1808:	0000961c 	.long	0x0000961c

0000180c <__gtdf2>:
    180c:	14d0      	push      	r15
    180e:	142e      	subi      	r14, r14, 56
    1810:	b800      	st.w      	r0, (r14, 0x0)
    1812:	b821      	st.w      	r1, (r14, 0x4)
    1814:	6c3b      	mov      	r0, r14
    1816:	1904      	addi      	r1, r14, 16
    1818:	b863      	st.w      	r3, (r14, 0xc)
    181a:	b842      	st.w      	r2, (r14, 0x8)
    181c:	e00002fa 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1820:	1909      	addi      	r1, r14, 36
    1822:	1802      	addi      	r0, r14, 8
    1824:	e00002f6 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1828:	9864      	ld.w      	r3, (r14, 0x10)
    182a:	3b01      	cmphsi      	r3, 2
    182c:	0c0a      	bf      	0x1840	// 1840 <__gtdf2+0x34>
    182e:	9869      	ld.w      	r3, (r14, 0x24)
    1830:	3b01      	cmphsi      	r3, 2
    1832:	0c07      	bf      	0x1840	// 1840 <__gtdf2+0x34>
    1834:	1909      	addi      	r1, r14, 36
    1836:	1804      	addi      	r0, r14, 16
    1838:	e000034e 	bsr      	0x1ed4	// 1ed4 <__fpcmp_parts_d>
    183c:	140e      	addi      	r14, r14, 56
    183e:	1490      	pop      	r15
    1840:	3000      	movi      	r0, 0
    1842:	2800      	subi      	r0, 1
    1844:	140e      	addi      	r14, r14, 56
    1846:	1490      	pop      	r15

00001848 <__gedf2>:
    1848:	14d0      	push      	r15
    184a:	142e      	subi      	r14, r14, 56
    184c:	b800      	st.w      	r0, (r14, 0x0)
    184e:	b821      	st.w      	r1, (r14, 0x4)
    1850:	6c3b      	mov      	r0, r14
    1852:	1904      	addi      	r1, r14, 16
    1854:	b863      	st.w      	r3, (r14, 0xc)
    1856:	b842      	st.w      	r2, (r14, 0x8)
    1858:	e00002dc 	bsr      	0x1e10	// 1e10 <__unpack_d>
    185c:	1909      	addi      	r1, r14, 36
    185e:	1802      	addi      	r0, r14, 8
    1860:	e00002d8 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1864:	9864      	ld.w      	r3, (r14, 0x10)
    1866:	3b01      	cmphsi      	r3, 2
    1868:	0c0a      	bf      	0x187c	// 187c <__gedf2+0x34>
    186a:	9869      	ld.w      	r3, (r14, 0x24)
    186c:	3b01      	cmphsi      	r3, 2
    186e:	0c07      	bf      	0x187c	// 187c <__gedf2+0x34>
    1870:	1909      	addi      	r1, r14, 36
    1872:	1804      	addi      	r0, r14, 16
    1874:	e0000330 	bsr      	0x1ed4	// 1ed4 <__fpcmp_parts_d>
    1878:	140e      	addi      	r14, r14, 56
    187a:	1490      	pop      	r15
    187c:	3000      	movi      	r0, 0
    187e:	2800      	subi      	r0, 1
    1880:	140e      	addi      	r14, r14, 56
    1882:	1490      	pop      	r15

00001884 <__ledf2>:
    1884:	14d0      	push      	r15
    1886:	142e      	subi      	r14, r14, 56
    1888:	b800      	st.w      	r0, (r14, 0x0)
    188a:	b821      	st.w      	r1, (r14, 0x4)
    188c:	6c3b      	mov      	r0, r14
    188e:	1904      	addi      	r1, r14, 16
    1890:	b863      	st.w      	r3, (r14, 0xc)
    1892:	b842      	st.w      	r2, (r14, 0x8)
    1894:	e00002be 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1898:	1909      	addi      	r1, r14, 36
    189a:	1802      	addi      	r0, r14, 8
    189c:	e00002ba 	bsr      	0x1e10	// 1e10 <__unpack_d>
    18a0:	9864      	ld.w      	r3, (r14, 0x10)
    18a2:	3b01      	cmphsi      	r3, 2
    18a4:	0c0a      	bf      	0x18b8	// 18b8 <__ledf2+0x34>
    18a6:	9869      	ld.w      	r3, (r14, 0x24)
    18a8:	3b01      	cmphsi      	r3, 2
    18aa:	0c07      	bf      	0x18b8	// 18b8 <__ledf2+0x34>
    18ac:	1909      	addi      	r1, r14, 36
    18ae:	1804      	addi      	r0, r14, 16
    18b0:	e0000312 	bsr      	0x1ed4	// 1ed4 <__fpcmp_parts_d>
    18b4:	140e      	addi      	r14, r14, 56
    18b6:	1490      	pop      	r15
    18b8:	3001      	movi      	r0, 1
    18ba:	140e      	addi      	r14, r14, 56
    18bc:	1490      	pop      	r15
	...

000018c0 <__floatsidf>:
    18c0:	14d1      	push      	r4, r15
    18c2:	1425      	subi      	r14, r14, 20
    18c4:	3303      	movi      	r3, 3
    18c6:	b860      	st.w      	r3, (r14, 0x0)
    18c8:	3840      	cmpnei      	r0, 0
    18ca:	487f      	lsri      	r3, r0, 31
    18cc:	b861      	st.w      	r3, (r14, 0x4)
    18ce:	0808      	bt      	0x18de	// 18de <__floatsidf+0x1e>
    18d0:	3302      	movi      	r3, 2
    18d2:	b860      	st.w      	r3, (r14, 0x0)
    18d4:	6c3b      	mov      	r0, r14
    18d6:	e00001cf 	bsr      	0x1c74	// 1c74 <__pack_d>
    18da:	1405      	addi      	r14, r14, 20
    18dc:	1491      	pop      	r4, r15
    18de:	38df      	btsti      	r0, 31
    18e0:	0812      	bt      	0x1904	// 1904 <__floatsidf+0x44>
    18e2:	6d03      	mov      	r4, r0
    18e4:	6c13      	mov      	r0, r4
    18e6:	e00000c1 	bsr      	0x1a68	// 1a68 <__clzsi2>
    18ea:	321d      	movi      	r2, 29
    18ec:	6080      	addu      	r2, r0
    18ee:	2802      	subi      	r0, 3
    18f0:	38df      	btsti      	r0, 31
    18f2:	0810      	bt      	0x1912	// 1912 <__floatsidf+0x52>
    18f4:	7100      	lsl      	r4, r0
    18f6:	3300      	movi      	r3, 0
    18f8:	b884      	st.w      	r4, (r14, 0x10)
    18fa:	b863      	st.w      	r3, (r14, 0xc)
    18fc:	333c      	movi      	r3, 60
    18fe:	60ca      	subu      	r3, r2
    1900:	b862      	st.w      	r3, (r14, 0x8)
    1902:	07e9      	br      	0x18d4	// 18d4 <__floatsidf+0x14>
    1904:	3380      	movi      	r3, 128
    1906:	4378      	lsli      	r3, r3, 24
    1908:	64c2      	cmpne      	r0, r3
    190a:	0c0d      	bf      	0x1924	// 1924 <__floatsidf+0x64>
    190c:	3400      	movi      	r4, 0
    190e:	6102      	subu      	r4, r0
    1910:	07ea      	br      	0x18e4	// 18e4 <__floatsidf+0x24>
    1912:	311f      	movi      	r1, 31
    1914:	4c61      	lsri      	r3, r4, 1
    1916:	604a      	subu      	r1, r2
    1918:	6c13      	mov      	r0, r4
    191a:	70c5      	lsr      	r3, r1
    191c:	7008      	lsl      	r0, r2
    191e:	b864      	st.w      	r3, (r14, 0x10)
    1920:	b803      	st.w      	r0, (r14, 0xc)
    1922:	07ed      	br      	0x18fc	// 18fc <__floatsidf+0x3c>
    1924:	3000      	movi      	r0, 0
    1926:	1022      	lrw      	r1, 0xc1e00000	// 192c <__floatsidf+0x6c>
    1928:	07d9      	br      	0x18da	// 18da <__floatsidf+0x1a>
    192a:	0000      	bkpt
    192c:	c1e00000 	.long	0xc1e00000

00001930 <__fixdfsi>:
    1930:	14d0      	push      	r15
    1932:	1427      	subi      	r14, r14, 28
    1934:	b800      	st.w      	r0, (r14, 0x0)
    1936:	b821      	st.w      	r1, (r14, 0x4)
    1938:	6c3b      	mov      	r0, r14
    193a:	1902      	addi      	r1, r14, 8
    193c:	e000026a 	bsr      	0x1e10	// 1e10 <__unpack_d>
    1940:	9862      	ld.w      	r3, (r14, 0x8)
    1942:	3b02      	cmphsi      	r3, 3
    1944:	0c20      	bf      	0x1984	// 1984 <__fixdfsi+0x54>
    1946:	3b44      	cmpnei      	r3, 4
    1948:	0c16      	bf      	0x1974	// 1974 <__fixdfsi+0x44>
    194a:	9864      	ld.w      	r3, (r14, 0x10)
    194c:	3bdf      	btsti      	r3, 31
    194e:	081b      	bt      	0x1984	// 1984 <__fixdfsi+0x54>
    1950:	3b3e      	cmplti      	r3, 31
    1952:	0c11      	bf      	0x1974	// 1974 <__fixdfsi+0x44>
    1954:	323c      	movi      	r2, 60
    1956:	5a6d      	subu      	r3, r2, r3
    1958:	3200      	movi      	r2, 0
    195a:	2a1f      	subi      	r2, 32
    195c:	608c      	addu      	r2, r3
    195e:	3adf      	btsti      	r2, 31
    1960:	0815      	bt      	0x198a	// 198a <__fixdfsi+0x5a>
    1962:	9806      	ld.w      	r0, (r14, 0x18)
    1964:	7009      	lsr      	r0, r2
    1966:	9863      	ld.w      	r3, (r14, 0xc)
    1968:	3b40      	cmpnei      	r3, 0
    196a:	0c0b      	bf      	0x1980	// 1980 <__fixdfsi+0x50>
    196c:	3300      	movi      	r3, 0
    196e:	5b01      	subu      	r0, r3, r0
    1970:	1407      	addi      	r14, r14, 28
    1972:	1490      	pop      	r15
    1974:	9863      	ld.w      	r3, (r14, 0xc)
    1976:	3b40      	cmpnei      	r3, 0
    1978:	3000      	movi      	r0, 0
    197a:	6001      	addc      	r0, r0
    197c:	1068      	lrw      	r3, 0x7fffffff	// 199c <__fixdfsi+0x6c>
    197e:	600c      	addu      	r0, r3
    1980:	1407      	addi      	r14, r14, 28
    1982:	1490      	pop      	r15
    1984:	3000      	movi      	r0, 0
    1986:	1407      	addi      	r14, r14, 28
    1988:	1490      	pop      	r15
    198a:	9846      	ld.w      	r2, (r14, 0x18)
    198c:	311f      	movi      	r1, 31
    198e:	4241      	lsli      	r2, r2, 1
    1990:	604e      	subu      	r1, r3
    1992:	9805      	ld.w      	r0, (r14, 0x14)
    1994:	7084      	lsl      	r2, r1
    1996:	700d      	lsr      	r0, r3
    1998:	6c08      	or      	r0, r2
    199a:	07e6      	br      	0x1966	// 1966 <__fixdfsi+0x36>
    199c:	7fffffff 	.long	0x7fffffff

000019a0 <__truncdfsf2>:
    19a0:	14d0      	push      	r15
    19a2:	1427      	subi      	r14, r14, 28
    19a4:	b800      	st.w      	r0, (r14, 0x0)
    19a6:	b821      	st.w      	r1, (r14, 0x4)
    19a8:	6c3b      	mov      	r0, r14
    19aa:	1902      	addi      	r1, r14, 8
    19ac:	e0000232 	bsr      	0x1e10	// 1e10 <__unpack_d>
    19b0:	9845      	ld.w      	r2, (r14, 0x14)
    19b2:	4a3e      	lsri      	r1, r2, 30
    19b4:	9866      	ld.w      	r3, (r14, 0x18)
    19b6:	4242      	lsli      	r2, r2, 2
    19b8:	4362      	lsli      	r3, r3, 2
    19ba:	3a40      	cmpnei      	r2, 0
    19bc:	6cc4      	or      	r3, r1
    19be:	0c02      	bf      	0x19c2	// 19c2 <__truncdfsf2+0x22>
    19c0:	3ba0      	bseti      	r3, 0
    19c2:	9844      	ld.w      	r2, (r14, 0x10)
    19c4:	9823      	ld.w      	r1, (r14, 0xc)
    19c6:	9802      	ld.w      	r0, (r14, 0x8)
    19c8:	e000014a 	bsr      	0x1c5c	// 1c5c <__make_fp>
    19cc:	1407      	addi      	r14, r14, 28
    19ce:	1490      	pop      	r15

000019d0 <__floatunsidf>:
    19d0:	14d2      	push      	r4-r5, r15
    19d2:	1425      	subi      	r14, r14, 20
    19d4:	3840      	cmpnei      	r0, 0
    19d6:	3500      	movi      	r5, 0
    19d8:	6d03      	mov      	r4, r0
    19da:	b8a1      	st.w      	r5, (r14, 0x4)
    19dc:	0c15      	bf      	0x1a06	// 1a06 <__floatunsidf+0x36>
    19de:	3303      	movi      	r3, 3
    19e0:	b860      	st.w      	r3, (r14, 0x0)
    19e2:	e0000043 	bsr      	0x1a68	// 1a68 <__clzsi2>
    19e6:	321d      	movi      	r2, 29
    19e8:	6080      	addu      	r2, r0
    19ea:	2802      	subi      	r0, 3
    19ec:	38df      	btsti      	r0, 31
    19ee:	0813      	bt      	0x1a14	// 1a14 <__floatunsidf+0x44>
    19f0:	7100      	lsl      	r4, r0
    19f2:	b884      	st.w      	r4, (r14, 0x10)
    19f4:	b8a3      	st.w      	r5, (r14, 0xc)
    19f6:	333c      	movi      	r3, 60
    19f8:	60ca      	subu      	r3, r2
    19fa:	6c3b      	mov      	r0, r14
    19fc:	b862      	st.w      	r3, (r14, 0x8)
    19fe:	e000013b 	bsr      	0x1c74	// 1c74 <__pack_d>
    1a02:	1405      	addi      	r14, r14, 20
    1a04:	1492      	pop      	r4-r5, r15
    1a06:	3302      	movi      	r3, 2
    1a08:	6c3b      	mov      	r0, r14
    1a0a:	b860      	st.w      	r3, (r14, 0x0)
    1a0c:	e0000134 	bsr      	0x1c74	// 1c74 <__pack_d>
    1a10:	1405      	addi      	r14, r14, 20
    1a12:	1492      	pop      	r4-r5, r15
    1a14:	311f      	movi      	r1, 31
    1a16:	4c61      	lsri      	r3, r4, 1
    1a18:	604a      	subu      	r1, r2
    1a1a:	70c5      	lsr      	r3, r1
    1a1c:	7108      	lsl      	r4, r2
    1a1e:	b864      	st.w      	r3, (r14, 0x10)
    1a20:	b883      	st.w      	r4, (r14, 0xc)
    1a22:	07ea      	br      	0x19f6	// 19f6 <__floatunsidf+0x26>

00001a24 <__muldi3>:
    1a24:	14c4      	push      	r4-r7
    1a26:	1421      	subi      	r14, r14, 4
    1a28:	7501      	zexth      	r4, r0
    1a2a:	48b0      	lsri      	r5, r0, 16
    1a2c:	75c9      	zexth      	r7, r2
    1a2e:	6d83      	mov      	r6, r0
    1a30:	b820      	st.w      	r1, (r14, 0x0)
    1a32:	6c13      	mov      	r0, r4
    1a34:	4a30      	lsri      	r1, r2, 16
    1a36:	7c1c      	mult      	r0, r7
    1a38:	7d04      	mult      	r4, r1
    1a3a:	7dd4      	mult      	r7, r5
    1a3c:	611c      	addu      	r4, r7
    1a3e:	7d44      	mult      	r5, r1
    1a40:	4830      	lsri      	r1, r0, 16
    1a42:	6104      	addu      	r4, r1
    1a44:	65d0      	cmphs      	r4, r7
    1a46:	0804      	bt      	0x1a4e	// 1a4e <__muldi3+0x2a>
    1a48:	3180      	movi      	r1, 128
    1a4a:	4129      	lsli      	r1, r1, 9
    1a4c:	6144      	addu      	r5, r1
    1a4e:	4c30      	lsri      	r1, r4, 16
    1a50:	7cd8      	mult      	r3, r6
    1a52:	6144      	addu      	r5, r1
    1a54:	6c4f      	mov      	r1, r3
    1a56:	9860      	ld.w      	r3, (r14, 0x0)
    1a58:	7cc8      	mult      	r3, r2
    1a5a:	4490      	lsli      	r4, r4, 16
    1a5c:	604c      	addu      	r1, r3
    1a5e:	7401      	zexth      	r0, r0
    1a60:	6010      	addu      	r0, r4
    1a62:	6054      	addu      	r1, r5
    1a64:	1401      	addi      	r14, r14, 4
    1a66:	1484      	pop      	r4-r7

00001a68 <__clzsi2>:
    1a68:	106d      	lrw      	r3, 0xffff	// 1a9c <__clzsi2+0x34>
    1a6a:	640c      	cmphs      	r3, r0
    1a6c:	0c07      	bf      	0x1a7a	// 1a7a <__clzsi2+0x12>
    1a6e:	33ff      	movi      	r3, 255
    1a70:	640c      	cmphs      	r3, r0
    1a72:	0c0f      	bf      	0x1a90	// 1a90 <__clzsi2+0x28>
    1a74:	3320      	movi      	r3, 32
    1a76:	3200      	movi      	r2, 0
    1a78:	0406      	br      	0x1a84	// 1a84 <__clzsi2+0x1c>
    1a7a:	106a      	lrw      	r3, 0xffffff	// 1aa0 <__clzsi2+0x38>
    1a7c:	640c      	cmphs      	r3, r0
    1a7e:	080c      	bt      	0x1a96	// 1a96 <__clzsi2+0x2e>
    1a80:	3308      	movi      	r3, 8
    1a82:	3218      	movi      	r2, 24
    1a84:	7009      	lsr      	r0, r2
    1a86:	1048      	lrw      	r2, 0x9630	// 1aa4 <__clzsi2+0x3c>
    1a88:	6008      	addu      	r0, r2
    1a8a:	8040      	ld.b      	r2, (r0, 0x0)
    1a8c:	5b09      	subu      	r0, r3, r2
    1a8e:	783c      	jmp      	r15
    1a90:	3318      	movi      	r3, 24
    1a92:	3208      	movi      	r2, 8
    1a94:	07f8      	br      	0x1a84	// 1a84 <__clzsi2+0x1c>
    1a96:	3310      	movi      	r3, 16
    1a98:	3210      	movi      	r2, 16
    1a9a:	07f5      	br      	0x1a84	// 1a84 <__clzsi2+0x1c>
    1a9c:	0000ffff 	.long	0x0000ffff
    1aa0:	00ffffff 	.long	0x00ffffff
    1aa4:	00009630 	.long	0x00009630

00001aa8 <__pack_f>:
    1aa8:	14c2      	push      	r4-r5
    1aaa:	9040      	ld.w      	r2, (r0, 0x0)
    1aac:	3a01      	cmphsi      	r2, 2
    1aae:	9063      	ld.w      	r3, (r0, 0xc)
    1ab0:	9021      	ld.w      	r1, (r0, 0x4)
    1ab2:	0c27      	bf      	0x1b00	// 1b00 <__pack_f+0x58>
    1ab4:	3a44      	cmpnei      	r2, 4
    1ab6:	0c22      	bf      	0x1afa	// 1afa <__pack_f+0x52>
    1ab8:	3a42      	cmpnei      	r2, 2
    1aba:	0c1d      	bf      	0x1af4	// 1af4 <__pack_f+0x4c>
    1abc:	3b40      	cmpnei      	r3, 0
    1abe:	0c1b      	bf      	0x1af4	// 1af4 <__pack_f+0x4c>
    1ac0:	3400      	movi      	r4, 0
    1ac2:	9042      	ld.w      	r2, (r0, 0x8)
    1ac4:	2c7d      	subi      	r4, 126
    1ac6:	6509      	cmplt      	r2, r4
    1ac8:	082a      	bt      	0x1b1c	// 1b1c <__pack_f+0x74>
    1aca:	347f      	movi      	r4, 127
    1acc:	6491      	cmplt      	r4, r2
    1ace:	0816      	bt      	0x1afa	// 1afa <__pack_f+0x52>
    1ad0:	690c      	and      	r4, r3
    1ad2:	3540      	movi      	r5, 64
    1ad4:	6552      	cmpne      	r4, r5
    1ad6:	0c1a      	bf      	0x1b0a	// 1b0a <__pack_f+0x62>
    1ad8:	233e      	addi      	r3, 63
    1ada:	3bdf      	btsti      	r3, 31
    1adc:	081d      	bt      	0x1b16	// 1b16 <__pack_f+0x6e>
    1ade:	227e      	addi      	r2, 127
    1ae0:	4302      	lsli      	r0, r3, 2
    1ae2:	4809      	lsri      	r0, r0, 9
    1ae4:	74c8      	zextb      	r3, r2
    1ae6:	4009      	lsli      	r0, r0, 9
    1ae8:	4377      	lsli      	r3, r3, 23
    1aea:	4809      	lsri      	r0, r0, 9
    1aec:	413f      	lsli      	r1, r1, 31
    1aee:	6c0c      	or      	r0, r3
    1af0:	6c04      	or      	r0, r1
    1af2:	1482      	pop      	r4-r5
    1af4:	3300      	movi      	r3, 0
    1af6:	3000      	movi      	r0, 0
    1af8:	07f7      	br      	0x1ae6	// 1ae6 <__pack_f+0x3e>
    1afa:	33ff      	movi      	r3, 255
    1afc:	3000      	movi      	r0, 0
    1afe:	07f4      	br      	0x1ae6	// 1ae6 <__pack_f+0x3e>
    1b00:	4303      	lsli      	r0, r3, 3
    1b02:	480a      	lsri      	r0, r0, 10
    1b04:	38b6      	bseti      	r0, 22
    1b06:	33ff      	movi      	r3, 255
    1b08:	07ef      	br      	0x1ae6	// 1ae6 <__pack_f+0x3e>
    1b0a:	3080      	movi      	r0, 128
    1b0c:	680c      	and      	r0, r3
    1b0e:	3840      	cmpnei      	r0, 0
    1b10:	0fe5      	bf      	0x1ada	// 1ada <__pack_f+0x32>
    1b12:	60d0      	addu      	r3, r4
    1b14:	07e3      	br      	0x1ada	// 1ada <__pack_f+0x32>
    1b16:	4b61      	lsri      	r3, r3, 1
    1b18:	227f      	addi      	r2, 128
    1b1a:	07e3      	br      	0x1ae0	// 1ae0 <__pack_f+0x38>
    1b1c:	610a      	subu      	r4, r2
    1b1e:	3c39      	cmplti      	r4, 26
    1b20:	0fea      	bf      	0x1af4	// 1af4 <__pack_f+0x4c>
    1b22:	3201      	movi      	r2, 1
    1b24:	7090      	lsl      	r2, r4
    1b26:	2a00      	subi      	r2, 1
    1b28:	6c0f      	mov      	r0, r3
    1b2a:	68c8      	and      	r3, r2
    1b2c:	3b40      	cmpnei      	r3, 0
    1b2e:	3300      	movi      	r3, 0
    1b30:	7011      	lsr      	r0, r4
    1b32:	60cd      	addc      	r3, r3
    1b34:	6cc0      	or      	r3, r0
    1b36:	307f      	movi      	r0, 127
    1b38:	680c      	and      	r0, r3
    1b3a:	3240      	movi      	r2, 64
    1b3c:	6482      	cmpne      	r0, r2
    1b3e:	080d      	bt      	0x1b58	// 1b58 <__pack_f+0xb0>
    1b40:	3280      	movi      	r2, 128
    1b42:	688c      	and      	r2, r3
    1b44:	3a40      	cmpnei      	r2, 0
    1b46:	0c02      	bf      	0x1b4a	// 1b4a <__pack_f+0xa2>
    1b48:	60c0      	addu      	r3, r0
    1b4a:	1045      	lrw      	r2, 0x3fffffff	// 1b5c <__pack_f+0xb4>
    1b4c:	64c8      	cmphs      	r2, r3
    1b4e:	4302      	lsli      	r0, r3, 2
    1b50:	64c3      	mvcv      	r3
    1b52:	4809      	lsri      	r0, r0, 9
    1b54:	74cc      	zextb      	r3, r3
    1b56:	07c8      	br      	0x1ae6	// 1ae6 <__pack_f+0x3e>
    1b58:	233e      	addi      	r3, 63
    1b5a:	07f8      	br      	0x1b4a	// 1b4a <__pack_f+0xa2>
    1b5c:	3fffffff 	.long	0x3fffffff

00001b60 <__unpack_f>:
    1b60:	14c1      	push      	r4
    1b62:	8861      	ld.h      	r3, (r0, 0x2)
    1b64:	4371      	lsli      	r3, r3, 17
    1b66:	9040      	ld.w      	r2, (r0, 0x0)
    1b68:	4b78      	lsri      	r3, r3, 24
    1b6a:	8003      	ld.b      	r0, (r0, 0x3)
    1b6c:	4249      	lsli      	r2, r2, 9
    1b6e:	4807      	lsri      	r0, r0, 7
    1b70:	3b40      	cmpnei      	r3, 0
    1b72:	4a49      	lsri      	r2, r2, 9
    1b74:	b101      	st.w      	r0, (r1, 0x4)
    1b76:	0811      	bt      	0x1b98	// 1b98 <__unpack_f+0x38>
    1b78:	3a40      	cmpnei      	r2, 0
    1b7a:	0c1a      	bf      	0x1bae	// 1bae <__unpack_f+0x4e>
    1b7c:	3303      	movi      	r3, 3
    1b7e:	b160      	st.w      	r3, (r1, 0x0)
    1b80:	3300      	movi      	r3, 0
    1b82:	4247      	lsli      	r2, r2, 7
    1b84:	2b7e      	subi      	r3, 127
    1b86:	1096      	lrw      	r4, 0x3fffffff	// 1bdc <__unpack_f+0x7c>
    1b88:	4241      	lsli      	r2, r2, 1
    1b8a:	6490      	cmphs      	r4, r2
    1b8c:	6c0f      	mov      	r0, r3
    1b8e:	2b00      	subi      	r3, 1
    1b90:	0bfc      	bt      	0x1b88	// 1b88 <__unpack_f+0x28>
    1b92:	b102      	st.w      	r0, (r1, 0x8)
    1b94:	b143      	st.w      	r2, (r1, 0xc)
    1b96:	1481      	pop      	r4
    1b98:	30ff      	movi      	r0, 255
    1b9a:	640e      	cmpne      	r3, r0
    1b9c:	0c0c      	bf      	0x1bb4	// 1bb4 <__unpack_f+0x54>
    1b9e:	2b7e      	subi      	r3, 127
    1ba0:	4247      	lsli      	r2, r2, 7
    1ba2:	b162      	st.w      	r3, (r1, 0x8)
    1ba4:	3abe      	bseti      	r2, 30
    1ba6:	3303      	movi      	r3, 3
    1ba8:	b160      	st.w      	r3, (r1, 0x0)
    1baa:	b143      	st.w      	r2, (r1, 0xc)
    1bac:	1481      	pop      	r4
    1bae:	3302      	movi      	r3, 2
    1bb0:	b160      	st.w      	r3, (r1, 0x0)
    1bb2:	1481      	pop      	r4
    1bb4:	3a40      	cmpnei      	r2, 0
    1bb6:	0c0d      	bf      	0x1bd0	// 1bd0 <__unpack_f+0x70>
    1bb8:	3380      	movi      	r3, 128
    1bba:	436f      	lsli      	r3, r3, 15
    1bbc:	68c8      	and      	r3, r2
    1bbe:	3b40      	cmpnei      	r3, 0
    1bc0:	0c0b      	bf      	0x1bd6	// 1bd6 <__unpack_f+0x76>
    1bc2:	3301      	movi      	r3, 1
    1bc4:	b160      	st.w      	r3, (r1, 0x0)
    1bc6:	1067      	lrw      	r3, 0x2000007f	// 1be0 <__unpack_f+0x80>
    1bc8:	4247      	lsli      	r2, r2, 7
    1bca:	688d      	andn      	r2, r3
    1bcc:	b143      	st.w      	r2, (r1, 0xc)
    1bce:	1481      	pop      	r4
    1bd0:	3304      	movi      	r3, 4
    1bd2:	b160      	st.w      	r3, (r1, 0x0)
    1bd4:	1481      	pop      	r4
    1bd6:	b160      	st.w      	r3, (r1, 0x0)
    1bd8:	07f7      	br      	0x1bc6	// 1bc6 <__unpack_f+0x66>
    1bda:	0000      	bkpt
    1bdc:	3fffffff 	.long	0x3fffffff
    1be0:	2000007f 	.long	0x2000007f

00001be4 <__fpcmp_parts_f>:
    1be4:	14c1      	push      	r4
    1be6:	9060      	ld.w      	r3, (r0, 0x0)
    1be8:	3b01      	cmphsi      	r3, 2
    1bea:	0c12      	bf      	0x1c0e	// 1c0e <__fpcmp_parts_f+0x2a>
    1bec:	9140      	ld.w      	r2, (r1, 0x0)
    1bee:	3a01      	cmphsi      	r2, 2
    1bf0:	0c0f      	bf      	0x1c0e	// 1c0e <__fpcmp_parts_f+0x2a>
    1bf2:	3b44      	cmpnei      	r3, 4
    1bf4:	0c17      	bf      	0x1c22	// 1c22 <__fpcmp_parts_f+0x3e>
    1bf6:	3a44      	cmpnei      	r2, 4
    1bf8:	0c0f      	bf      	0x1c16	// 1c16 <__fpcmp_parts_f+0x32>
    1bfa:	3b42      	cmpnei      	r3, 2
    1bfc:	0c0b      	bf      	0x1c12	// 1c12 <__fpcmp_parts_f+0x2e>
    1bfe:	3a42      	cmpnei      	r2, 2
    1c00:	0c13      	bf      	0x1c26	// 1c26 <__fpcmp_parts_f+0x42>
    1c02:	9061      	ld.w      	r3, (r0, 0x4)
    1c04:	9141      	ld.w      	r2, (r1, 0x4)
    1c06:	648e      	cmpne      	r3, r2
    1c08:	0c14      	bf      	0x1c30	// 1c30 <__fpcmp_parts_f+0x4c>
    1c0a:	3b40      	cmpnei      	r3, 0
    1c0c:	0808      	bt      	0x1c1c	// 1c1c <__fpcmp_parts_f+0x38>
    1c0e:	3001      	movi      	r0, 1
    1c10:	1481      	pop      	r4
    1c12:	3a42      	cmpnei      	r2, 2
    1c14:	0c1e      	bf      	0x1c50	// 1c50 <__fpcmp_parts_f+0x6c>
    1c16:	9161      	ld.w      	r3, (r1, 0x4)
    1c18:	3b40      	cmpnei      	r3, 0
    1c1a:	0bfa      	bt      	0x1c0e	// 1c0e <__fpcmp_parts_f+0x2a>
    1c1c:	3000      	movi      	r0, 0
    1c1e:	2800      	subi      	r0, 1
    1c20:	1481      	pop      	r4
    1c22:	3a44      	cmpnei      	r2, 4
    1c24:	0c18      	bf      	0x1c54	// 1c54 <__fpcmp_parts_f+0x70>
    1c26:	9061      	ld.w      	r3, (r0, 0x4)
    1c28:	3b40      	cmpnei      	r3, 0
    1c2a:	0bf9      	bt      	0x1c1c	// 1c1c <__fpcmp_parts_f+0x38>
    1c2c:	3001      	movi      	r0, 1
    1c2e:	07f1      	br      	0x1c10	// 1c10 <__fpcmp_parts_f+0x2c>
    1c30:	9082      	ld.w      	r4, (r0, 0x8)
    1c32:	9142      	ld.w      	r2, (r1, 0x8)
    1c34:	6509      	cmplt      	r2, r4
    1c36:	0bea      	bt      	0x1c0a	// 1c0a <__fpcmp_parts_f+0x26>
    1c38:	6491      	cmplt      	r4, r2
    1c3a:	0807      	bt      	0x1c48	// 1c48 <__fpcmp_parts_f+0x64>
    1c3c:	9003      	ld.w      	r0, (r0, 0xc)
    1c3e:	9143      	ld.w      	r2, (r1, 0xc)
    1c40:	6408      	cmphs      	r2, r0
    1c42:	0fe4      	bf      	0x1c0a	// 1c0a <__fpcmp_parts_f+0x26>
    1c44:	6480      	cmphs      	r0, r2
    1c46:	0805      	bt      	0x1c50	// 1c50 <__fpcmp_parts_f+0x6c>
    1c48:	3b40      	cmpnei      	r3, 0
    1c4a:	0fe9      	bf      	0x1c1c	// 1c1c <__fpcmp_parts_f+0x38>
    1c4c:	3001      	movi      	r0, 1
    1c4e:	07e1      	br      	0x1c10	// 1c10 <__fpcmp_parts_f+0x2c>
    1c50:	3000      	movi      	r0, 0
    1c52:	1481      	pop      	r4
    1c54:	9161      	ld.w      	r3, (r1, 0x4)
    1c56:	9041      	ld.w      	r2, (r0, 0x4)
    1c58:	5b09      	subu      	r0, r3, r2
    1c5a:	1481      	pop      	r4

00001c5c <__make_fp>:
    1c5c:	14d0      	push      	r15
    1c5e:	1424      	subi      	r14, r14, 16
    1c60:	b800      	st.w      	r0, (r14, 0x0)
    1c62:	6c3b      	mov      	r0, r14
    1c64:	b821      	st.w      	r1, (r14, 0x4)
    1c66:	b842      	st.w      	r2, (r14, 0x8)
    1c68:	b863      	st.w      	r3, (r14, 0xc)
    1c6a:	e3ffff1f 	bsr      	0x1aa8	// 1aa8 <__pack_f>
    1c6e:	1404      	addi      	r14, r14, 16
    1c70:	1490      	pop      	r15
	...

00001c74 <__pack_d>:
    1c74:	14c4      	push      	r4-r7
    1c76:	1422      	subi      	r14, r14, 8
    1c78:	9060      	ld.w      	r3, (r0, 0x0)
    1c7a:	3b01      	cmphsi      	r3, 2
    1c7c:	90c3      	ld.w      	r6, (r0, 0xc)
    1c7e:	90e4      	ld.w      	r7, (r0, 0x10)
    1c80:	9021      	ld.w      	r1, (r0, 0x4)
    1c82:	0c46      	bf      	0x1d0e	// 1d0e <__pack_d+0x9a>
    1c84:	3b44      	cmpnei      	r3, 4
    1c86:	0c40      	bf      	0x1d06	// 1d06 <__pack_d+0x92>
    1c88:	3b42      	cmpnei      	r3, 2
    1c8a:	0c27      	bf      	0x1cd8	// 1cd8 <__pack_d+0x64>
    1c8c:	6cdb      	mov      	r3, r6
    1c8e:	6cdc      	or      	r3, r7
    1c90:	3b40      	cmpnei      	r3, 0
    1c92:	0c23      	bf      	0x1cd8	// 1cd8 <__pack_d+0x64>
    1c94:	9062      	ld.w      	r3, (r0, 0x8)
    1c96:	125a      	lrw      	r2, 0xfffffc02	// 1dfc <__pack_d+0x188>
    1c98:	648d      	cmplt      	r3, r2
    1c9a:	0855      	bt      	0x1d44	// 1d44 <__pack_d+0xd0>
    1c9c:	1259      	lrw      	r2, 0x3ff	// 1e00 <__pack_d+0x18c>
    1c9e:	64c9      	cmplt      	r2, r3
    1ca0:	0833      	bt      	0x1d06	// 1d06 <__pack_d+0x92>
    1ca2:	34ff      	movi      	r4, 255
    1ca4:	3500      	movi      	r5, 0
    1ca6:	6918      	and      	r4, r6
    1ca8:	695c      	and      	r5, r7
    1caa:	3280      	movi      	r2, 128
    1cac:	6492      	cmpne      	r4, r2
    1cae:	0c3f      	bf      	0x1d2c	// 1d2c <__pack_d+0xb8>
    1cb0:	347f      	movi      	r4, 127
    1cb2:	3500      	movi      	r5, 0
    1cb4:	6599      	cmplt      	r6, r6
    1cb6:	6191      	addc      	r6, r4
    1cb8:	61d5      	addc      	r7, r5
    1cba:	1253      	lrw      	r2, 0x1fffffff	// 1e04 <__pack_d+0x190>
    1cbc:	65c8      	cmphs      	r2, r7
    1cbe:	0c1a      	bf      	0x1cf2	// 1cf2 <__pack_d+0x7e>
    1cc0:	1290      	lrw      	r4, 0x3ff	// 1e00 <__pack_d+0x18c>
    1cc2:	610c      	addu      	r4, r3
    1cc4:	4718      	lsli      	r0, r7, 24
    1cc6:	4f68      	lsri      	r3, r7, 8
    1cc8:	4e48      	lsri      	r2, r6, 8
    1cca:	6c80      	or      	r2, r0
    1ccc:	430c      	lsli      	r0, r3, 12
    1cce:	486c      	lsri      	r3, r0, 12
    1cd0:	120e      	lrw      	r0, 0x7ff	// 1e08 <__pack_d+0x194>
    1cd2:	6d4b      	mov      	r5, r2
    1cd4:	6900      	and      	r4, r0
    1cd6:	0404      	br      	0x1cde	// 1cde <__pack_d+0x6a>
    1cd8:	3400      	movi      	r4, 0
    1cda:	3200      	movi      	r2, 0
    1cdc:	3300      	movi      	r3, 0
    1cde:	430c      	lsli      	r0, r3, 12
    1ce0:	480c      	lsri      	r0, r0, 12
    1ce2:	4474      	lsli      	r3, r4, 20
    1ce4:	419f      	lsli      	r4, r1, 31
    1ce6:	6c43      	mov      	r1, r0
    1ce8:	6c4c      	or      	r1, r3
    1cea:	6c50      	or      	r1, r4
    1cec:	6c0b      	mov      	r0, r2
    1cee:	1402      	addi      	r14, r14, 8
    1cf0:	1484      	pop      	r4-r7
    1cf2:	479f      	lsli      	r4, r7, 31
    1cf4:	4e01      	lsri      	r0, r6, 1
    1cf6:	6d00      	or      	r4, r0
    1cf8:	6d93      	mov      	r6, r4
    1cfa:	3480      	movi      	r4, 128
    1cfc:	4f41      	lsri      	r2, r7, 1
    1cfe:	4483      	lsli      	r4, r4, 3
    1d00:	6dcb      	mov      	r7, r2
    1d02:	610c      	addu      	r4, r3
    1d04:	07e0      	br      	0x1cc4	// 1cc4 <__pack_d+0x50>
    1d06:	1281      	lrw      	r4, 0x7ff	// 1e08 <__pack_d+0x194>
    1d08:	3200      	movi      	r2, 0
    1d0a:	3300      	movi      	r3, 0
    1d0c:	07e9      	br      	0x1cde	// 1cde <__pack_d+0x6a>
    1d0e:	4e08      	lsri      	r0, r6, 8
    1d10:	4798      	lsli      	r4, r7, 24
    1d12:	6d00      	or      	r4, r0
    1d14:	3580      	movi      	r5, 128
    1d16:	4705      	lsli      	r0, r7, 5
    1d18:	6c93      	mov      	r2, r4
    1d1a:	486d      	lsri      	r3, r0, 13
    1d1c:	3400      	movi      	r4, 0
    1d1e:	45ac      	lsli      	r5, r5, 12
    1d20:	6c90      	or      	r2, r4
    1d22:	6cd4      	or      	r3, r5
    1d24:	430c      	lsli      	r0, r3, 12
    1d26:	486c      	lsri      	r3, r0, 12
    1d28:	1198      	lrw      	r4, 0x7ff	// 1e08 <__pack_d+0x194>
    1d2a:	07da      	br      	0x1cde	// 1cde <__pack_d+0x6a>
    1d2c:	3d40      	cmpnei      	r5, 0
    1d2e:	0bc1      	bt      	0x1cb0	// 1cb0 <__pack_d+0x3c>
    1d30:	4241      	lsli      	r2, r2, 1
    1d32:	6898      	and      	r2, r6
    1d34:	3a40      	cmpnei      	r2, 0
    1d36:	0fc2      	bf      	0x1cba	// 1cba <__pack_d+0x46>
    1d38:	3480      	movi      	r4, 128
    1d3a:	3500      	movi      	r5, 0
    1d3c:	6599      	cmplt      	r6, r6
    1d3e:	6191      	addc      	r6, r4
    1d40:	61d5      	addc      	r7, r5
    1d42:	07bc      	br      	0x1cba	// 1cba <__pack_d+0x46>
    1d44:	5a6d      	subu      	r3, r2, r3
    1d46:	3238      	movi      	r2, 56
    1d48:	64c9      	cmplt      	r2, r3
    1d4a:	0bc7      	bt      	0x1cd8	// 1cd8 <__pack_d+0x64>
    1d4c:	3200      	movi      	r2, 0
    1d4e:	2a1f      	subi      	r2, 32
    1d50:	608c      	addu      	r2, r3
    1d52:	3adf      	btsti      	r2, 31
    1d54:	0848      	bt      	0x1de4	// 1de4 <__pack_d+0x170>
    1d56:	6c1f      	mov      	r0, r7
    1d58:	7009      	lsr      	r0, r2
    1d5a:	b800      	st.w      	r0, (r14, 0x0)
    1d5c:	3000      	movi      	r0, 0
    1d5e:	b801      	st.w      	r0, (r14, 0x4)
    1d60:	3adf      	btsti      	r2, 31
    1d62:	083c      	bt      	0x1dda	// 1dda <__pack_d+0x166>
    1d64:	3301      	movi      	r3, 1
    1d66:	70c8      	lsl      	r3, r2
    1d68:	6d4f      	mov      	r5, r3
    1d6a:	3300      	movi      	r3, 0
    1d6c:	6d0f      	mov      	r4, r3
    1d6e:	3200      	movi      	r2, 0
    1d70:	3300      	movi      	r3, 0
    1d72:	2a00      	subi      	r2, 1
    1d74:	2b00      	subi      	r3, 1
    1d76:	6511      	cmplt      	r4, r4
    1d78:	6109      	addc      	r4, r2
    1d7a:	614d      	addc      	r5, r3
    1d7c:	6990      	and      	r6, r4
    1d7e:	69d4      	and      	r7, r5
    1d80:	6d9c      	or      	r6, r7
    1d82:	3e40      	cmpnei      	r6, 0
    1d84:	3000      	movi      	r0, 0
    1d86:	6001      	addc      	r0, r0
    1d88:	6c83      	mov      	r2, r0
    1d8a:	3300      	movi      	r3, 0
    1d8c:	9880      	ld.w      	r4, (r14, 0x0)
    1d8e:	98a1      	ld.w      	r5, (r14, 0x4)
    1d90:	6d08      	or      	r4, r2
    1d92:	6d4c      	or      	r5, r3
    1d94:	32ff      	movi      	r2, 255
    1d96:	3300      	movi      	r3, 0
    1d98:	6890      	and      	r2, r4
    1d9a:	68d4      	and      	r3, r5
    1d9c:	3080      	movi      	r0, 128
    1d9e:	640a      	cmpne      	r2, r0
    1da0:	081b      	bt      	0x1dd6	// 1dd6 <__pack_d+0x162>
    1da2:	3b40      	cmpnei      	r3, 0
    1da4:	0819      	bt      	0x1dd6	// 1dd6 <__pack_d+0x162>
    1da6:	3380      	movi      	r3, 128
    1da8:	4361      	lsli      	r3, r3, 1
    1daa:	68d0      	and      	r3, r4
    1dac:	3b40      	cmpnei      	r3, 0
    1dae:	0c06      	bf      	0x1dba	// 1dba <__pack_d+0x146>
    1db0:	3280      	movi      	r2, 128
    1db2:	3300      	movi      	r3, 0
    1db4:	6511      	cmplt      	r4, r4
    1db6:	6109      	addc      	r4, r2
    1db8:	614d      	addc      	r5, r3
    1dba:	4518      	lsli      	r0, r5, 24
    1dbc:	4c48      	lsri      	r2, r4, 8
    1dbe:	4d68      	lsri      	r3, r5, 8
    1dc0:	1093      	lrw      	r4, 0xfffffff	// 1e0c <__pack_d+0x198>
    1dc2:	6c80      	or      	r2, r0
    1dc4:	6550      	cmphs      	r4, r5
    1dc6:	430c      	lsli      	r0, r3, 12
    1dc8:	486c      	lsri      	r3, r0, 12
    1dca:	3001      	movi      	r0, 1
    1dcc:	0c02      	bf      	0x1dd0	// 1dd0 <__pack_d+0x15c>
    1dce:	3000      	movi      	r0, 0
    1dd0:	108e      	lrw      	r4, 0x7ff	// 1e08 <__pack_d+0x194>
    1dd2:	6900      	and      	r4, r0
    1dd4:	0785      	br      	0x1cde	// 1cde <__pack_d+0x6a>
    1dd6:	327f      	movi      	r2, 127
    1dd8:	07ed      	br      	0x1db2	// 1db2 <__pack_d+0x13e>
    1dda:	3201      	movi      	r2, 1
    1ddc:	708c      	lsl      	r2, r3
    1dde:	3500      	movi      	r5, 0
    1de0:	6d0b      	mov      	r4, r2
    1de2:	07c6      	br      	0x1d6e	// 1d6e <__pack_d+0xfa>
    1de4:	341f      	movi      	r4, 31
    1de6:	610e      	subu      	r4, r3
    1de8:	4701      	lsli      	r0, r7, 1
    1dea:	7010      	lsl      	r0, r4
    1dec:	6d1b      	mov      	r4, r6
    1dee:	710d      	lsr      	r4, r3
    1df0:	6d00      	or      	r4, r0
    1df2:	6c1f      	mov      	r0, r7
    1df4:	700d      	lsr      	r0, r3
    1df6:	b880      	st.w      	r4, (r14, 0x0)
    1df8:	b801      	st.w      	r0, (r14, 0x4)
    1dfa:	07b3      	br      	0x1d60	// 1d60 <__pack_d+0xec>
    1dfc:	fffffc02 	.long	0xfffffc02
    1e00:	000003ff 	.long	0x000003ff
    1e04:	1fffffff 	.long	0x1fffffff
    1e08:	000007ff 	.long	0x000007ff
    1e0c:	0fffffff 	.long	0x0fffffff

00001e10 <__unpack_d>:
    1e10:	1423      	subi      	r14, r14, 12
    1e12:	b880      	st.w      	r4, (r14, 0x0)
    1e14:	b8c1      	st.w      	r6, (r14, 0x4)
    1e16:	b8e2      	st.w      	r7, (r14, 0x8)
    1e18:	8843      	ld.h      	r2, (r0, 0x6)
    1e1a:	4251      	lsli      	r2, r2, 17
    1e1c:	9061      	ld.w      	r3, (r0, 0x4)
    1e1e:	9080      	ld.w      	r4, (r0, 0x0)
    1e20:	4a55      	lsri      	r2, r2, 21
    1e22:	8007      	ld.b      	r0, (r0, 0x7)
    1e24:	436c      	lsli      	r3, r3, 12
    1e26:	4807      	lsri      	r0, r0, 7
    1e28:	3a40      	cmpnei      	r2, 0
    1e2a:	4b6c      	lsri      	r3, r3, 12
    1e2c:	b101      	st.w      	r0, (r1, 0x4)
    1e2e:	0819      	bt      	0x1e60	// 1e60 <__unpack_d+0x50>
    1e30:	6c93      	mov      	r2, r4
    1e32:	6c8c      	or      	r2, r3
    1e34:	3a40      	cmpnei      	r2, 0
    1e36:	0c2d      	bf      	0x1e90	// 1e90 <__unpack_d+0x80>
    1e38:	4c58      	lsri      	r2, r4, 24
    1e3a:	4368      	lsli      	r3, r3, 8
    1e3c:	6cc8      	or      	r3, r2
    1e3e:	3203      	movi      	r2, 3
    1e40:	4408      	lsli      	r0, r4, 8
    1e42:	b140      	st.w      	r2, (r1, 0x0)
    1e44:	1181      	lrw      	r4, 0xfffffc01	// 1ec8 <__unpack_d+0xb8>
    1e46:	11c2      	lrw      	r6, 0xfffffff	// 1ecc <__unpack_d+0xbc>
    1e48:	485f      	lsri      	r2, r0, 31
    1e4a:	4361      	lsli      	r3, r3, 1
    1e4c:	6cc8      	or      	r3, r2
    1e4e:	64d8      	cmphs      	r6, r3
    1e50:	6c93      	mov      	r2, r4
    1e52:	4001      	lsli      	r0, r0, 1
    1e54:	2c00      	subi      	r4, 1
    1e56:	0bf9      	bt      	0x1e48	// 1e48 <__unpack_d+0x38>
    1e58:	b142      	st.w      	r2, (r1, 0x8)
    1e5a:	b103      	st.w      	r0, (r1, 0xc)
    1e5c:	b164      	st.w      	r3, (r1, 0x10)
    1e5e:	0414      	br      	0x1e86	// 1e86 <__unpack_d+0x76>
    1e60:	101c      	lrw      	r0, 0x7ff	// 1ed0 <__unpack_d+0xc0>
    1e62:	640a      	cmpne      	r2, r0
    1e64:	0c19      	bf      	0x1e96	// 1e96 <__unpack_d+0x86>
    1e66:	1019      	lrw      	r0, 0xfffffc01	// 1ec8 <__unpack_d+0xb8>
    1e68:	6080      	addu      	r2, r0
    1e6a:	b142      	st.w      	r2, (r1, 0x8)
    1e6c:	3203      	movi      	r2, 3
    1e6e:	43e8      	lsli      	r7, r3, 8
    1e70:	b140      	st.w      	r2, (r1, 0x0)
    1e72:	3380      	movi      	r3, 128
    1e74:	4c58      	lsri      	r2, r4, 24
    1e76:	6dc8      	or      	r7, r2
    1e78:	44c8      	lsli      	r6, r4, 8
    1e7a:	3200      	movi      	r2, 0
    1e7c:	4375      	lsli      	r3, r3, 21
    1e7e:	6d88      	or      	r6, r2
    1e80:	6dcc      	or      	r7, r3
    1e82:	b1c3      	st.w      	r6, (r1, 0xc)
    1e84:	b1e4      	st.w      	r7, (r1, 0x10)
    1e86:	98e2      	ld.w      	r7, (r14, 0x8)
    1e88:	98c1      	ld.w      	r6, (r14, 0x4)
    1e8a:	9880      	ld.w      	r4, (r14, 0x0)
    1e8c:	1403      	addi      	r14, r14, 12
    1e8e:	783c      	jmp      	r15
    1e90:	3302      	movi      	r3, 2
    1e92:	b160      	st.w      	r3, (r1, 0x0)
    1e94:	07f9      	br      	0x1e86	// 1e86 <__unpack_d+0x76>
    1e96:	6c93      	mov      	r2, r4
    1e98:	6c8c      	or      	r2, r3
    1e9a:	3a40      	cmpnei      	r2, 0
    1e9c:	0c10      	bf      	0x1ebc	// 1ebc <__unpack_d+0xac>
    1e9e:	3280      	movi      	r2, 128
    1ea0:	424c      	lsli      	r2, r2, 12
    1ea2:	688c      	and      	r2, r3
    1ea4:	3a40      	cmpnei      	r2, 0
    1ea6:	0c0e      	bf      	0x1ec2	// 1ec2 <__unpack_d+0xb2>
    1ea8:	3201      	movi      	r2, 1
    1eaa:	b140      	st.w      	r2, (r1, 0x0)
    1eac:	4c58      	lsri      	r2, r4, 24
    1eae:	4368      	lsli      	r3, r3, 8
    1eb0:	6cc8      	or      	r3, r2
    1eb2:	4408      	lsli      	r0, r4, 8
    1eb4:	3b9b      	bclri      	r3, 27
    1eb6:	b103      	st.w      	r0, (r1, 0xc)
    1eb8:	b164      	st.w      	r3, (r1, 0x10)
    1eba:	07e6      	br      	0x1e86	// 1e86 <__unpack_d+0x76>
    1ebc:	3304      	movi      	r3, 4
    1ebe:	b160      	st.w      	r3, (r1, 0x0)
    1ec0:	07e3      	br      	0x1e86	// 1e86 <__unpack_d+0x76>
    1ec2:	b140      	st.w      	r2, (r1, 0x0)
    1ec4:	07f4      	br      	0x1eac	// 1eac <__unpack_d+0x9c>
    1ec6:	0000      	bkpt
    1ec8:	fffffc01 	.long	0xfffffc01
    1ecc:	0fffffff 	.long	0x0fffffff
    1ed0:	000007ff 	.long	0x000007ff

00001ed4 <__fpcmp_parts_d>:
    1ed4:	14c1      	push      	r4
    1ed6:	9060      	ld.w      	r3, (r0, 0x0)
    1ed8:	3b01      	cmphsi      	r3, 2
    1eda:	0c12      	bf      	0x1efe	// 1efe <__fpcmp_parts_d+0x2a>
    1edc:	9140      	ld.w      	r2, (r1, 0x0)
    1ede:	3a01      	cmphsi      	r2, 2
    1ee0:	0c0f      	bf      	0x1efe	// 1efe <__fpcmp_parts_d+0x2a>
    1ee2:	3b44      	cmpnei      	r3, 4
    1ee4:	0c17      	bf      	0x1f12	// 1f12 <__fpcmp_parts_d+0x3e>
    1ee6:	3a44      	cmpnei      	r2, 4
    1ee8:	0c0f      	bf      	0x1f06	// 1f06 <__fpcmp_parts_d+0x32>
    1eea:	3b42      	cmpnei      	r3, 2
    1eec:	0c0b      	bf      	0x1f02	// 1f02 <__fpcmp_parts_d+0x2e>
    1eee:	3a42      	cmpnei      	r2, 2
    1ef0:	0c13      	bf      	0x1f16	// 1f16 <__fpcmp_parts_d+0x42>
    1ef2:	9061      	ld.w      	r3, (r0, 0x4)
    1ef4:	9141      	ld.w      	r2, (r1, 0x4)
    1ef6:	648e      	cmpne      	r3, r2
    1ef8:	0c14      	bf      	0x1f20	// 1f20 <__fpcmp_parts_d+0x4c>
    1efa:	3b40      	cmpnei      	r3, 0
    1efc:	0808      	bt      	0x1f0c	// 1f0c <__fpcmp_parts_d+0x38>
    1efe:	3001      	movi      	r0, 1
    1f00:	1481      	pop      	r4
    1f02:	3a42      	cmpnei      	r2, 2
    1f04:	0c28      	bf      	0x1f54	// 1f54 <__fpcmp_parts_d+0x80>
    1f06:	9161      	ld.w      	r3, (r1, 0x4)
    1f08:	3b40      	cmpnei      	r3, 0
    1f0a:	0bfa      	bt      	0x1efe	// 1efe <__fpcmp_parts_d+0x2a>
    1f0c:	3000      	movi      	r0, 0
    1f0e:	2800      	subi      	r0, 1
    1f10:	1481      	pop      	r4
    1f12:	3a44      	cmpnei      	r2, 4
    1f14:	0c22      	bf      	0x1f58	// 1f58 <__fpcmp_parts_d+0x84>
    1f16:	9061      	ld.w      	r3, (r0, 0x4)
    1f18:	3b40      	cmpnei      	r3, 0
    1f1a:	0bf9      	bt      	0x1f0c	// 1f0c <__fpcmp_parts_d+0x38>
    1f1c:	3001      	movi      	r0, 1
    1f1e:	07f1      	br      	0x1f00	// 1f00 <__fpcmp_parts_d+0x2c>
    1f20:	9082      	ld.w      	r4, (r0, 0x8)
    1f22:	9142      	ld.w      	r2, (r1, 0x8)
    1f24:	6509      	cmplt      	r2, r4
    1f26:	0bea      	bt      	0x1efa	// 1efa <__fpcmp_parts_d+0x26>
    1f28:	6491      	cmplt      	r4, r2
    1f2a:	080d      	bt      	0x1f44	// 1f44 <__fpcmp_parts_d+0x70>
    1f2c:	9044      	ld.w      	r2, (r0, 0x10)
    1f2e:	9083      	ld.w      	r4, (r0, 0xc)
    1f30:	9103      	ld.w      	r0, (r1, 0xc)
    1f32:	9124      	ld.w      	r1, (r1, 0x10)
    1f34:	6484      	cmphs      	r1, r2
    1f36:	0fe2      	bf      	0x1efa	// 1efa <__fpcmp_parts_d+0x26>
    1f38:	644a      	cmpne      	r2, r1
    1f3a:	0803      	bt      	0x1f40	// 1f40 <__fpcmp_parts_d+0x6c>
    1f3c:	6500      	cmphs      	r0, r4
    1f3e:	0fde      	bf      	0x1efa	// 1efa <__fpcmp_parts_d+0x26>
    1f40:	6448      	cmphs      	r2, r1
    1f42:	0805      	bt      	0x1f4c	// 1f4c <__fpcmp_parts_d+0x78>
    1f44:	3b40      	cmpnei      	r3, 0
    1f46:	0fe3      	bf      	0x1f0c	// 1f0c <__fpcmp_parts_d+0x38>
    1f48:	3001      	movi      	r0, 1
    1f4a:	07db      	br      	0x1f00	// 1f00 <__fpcmp_parts_d+0x2c>
    1f4c:	6486      	cmpne      	r1, r2
    1f4e:	0803      	bt      	0x1f54	// 1f54 <__fpcmp_parts_d+0x80>
    1f50:	6410      	cmphs      	r4, r0
    1f52:	0ff9      	bf      	0x1f44	// 1f44 <__fpcmp_parts_d+0x70>
    1f54:	3000      	movi      	r0, 0
    1f56:	1481      	pop      	r4
    1f58:	9161      	ld.w      	r3, (r1, 0x4)
    1f5a:	9041      	ld.w      	r2, (r0, 0x4)
    1f5c:	5b09      	subu      	r0, r3, r2
    1f5e:	1481      	pop      	r4

00001f60 <__memset_fast>:
    1f60:	14c3      	push      	r4-r6
    1f62:	7444      	zextb      	r1, r1
    1f64:	3a40      	cmpnei      	r2, 0
    1f66:	0c1f      	bf      	0x1fa4	// 1fa4 <__memset_fast+0x44>
    1f68:	6d43      	mov      	r5, r0
    1f6a:	6d03      	mov      	r4, r0
    1f6c:	3603      	movi      	r6, 3
    1f6e:	6918      	and      	r4, r6
    1f70:	3c40      	cmpnei      	r4, 0
    1f72:	0c1a      	bf      	0x1fa6	// 1fa6 <__memset_fast+0x46>
    1f74:	a520      	st.b      	r1, (r5, 0x0)
    1f76:	2a00      	subi      	r2, 1
    1f78:	3a40      	cmpnei      	r2, 0
    1f7a:	0c15      	bf      	0x1fa4	// 1fa4 <__memset_fast+0x44>
    1f7c:	2500      	addi      	r5, 1
    1f7e:	6d17      	mov      	r4, r5
    1f80:	3603      	movi      	r6, 3
    1f82:	6918      	and      	r4, r6
    1f84:	3c40      	cmpnei      	r4, 0
    1f86:	0c10      	bf      	0x1fa6	// 1fa6 <__memset_fast+0x46>
    1f88:	a520      	st.b      	r1, (r5, 0x0)
    1f8a:	2a00      	subi      	r2, 1
    1f8c:	3a40      	cmpnei      	r2, 0
    1f8e:	0c0b      	bf      	0x1fa4	// 1fa4 <__memset_fast+0x44>
    1f90:	2500      	addi      	r5, 1
    1f92:	6d17      	mov      	r4, r5
    1f94:	3603      	movi      	r6, 3
    1f96:	6918      	and      	r4, r6
    1f98:	3c40      	cmpnei      	r4, 0
    1f9a:	0c06      	bf      	0x1fa6	// 1fa6 <__memset_fast+0x46>
    1f9c:	a520      	st.b      	r1, (r5, 0x0)
    1f9e:	2a00      	subi      	r2, 1
    1fa0:	2500      	addi      	r5, 1
    1fa2:	0402      	br      	0x1fa6	// 1fa6 <__memset_fast+0x46>
    1fa4:	1483      	pop      	r4-r6
    1fa6:	4168      	lsli      	r3, r1, 8
    1fa8:	6c4c      	or      	r1, r3
    1faa:	4170      	lsli      	r3, r1, 16
    1fac:	6c4c      	or      	r1, r3
    1fae:	3a2f      	cmplti      	r2, 16
    1fb0:	0809      	bt      	0x1fc2	// 1fc2 <__memset_fast+0x62>
    1fb2:	b520      	st.w      	r1, (r5, 0x0)
    1fb4:	b521      	st.w      	r1, (r5, 0x4)
    1fb6:	b522      	st.w      	r1, (r5, 0x8)
    1fb8:	b523      	st.w      	r1, (r5, 0xc)
    1fba:	2a0f      	subi      	r2, 16
    1fbc:	250f      	addi      	r5, 16
    1fbe:	3a2f      	cmplti      	r2, 16
    1fc0:	0ff9      	bf      	0x1fb2	// 1fb2 <__memset_fast+0x52>
    1fc2:	3a23      	cmplti      	r2, 4
    1fc4:	0806      	bt      	0x1fd0	// 1fd0 <__memset_fast+0x70>
    1fc6:	2a03      	subi      	r2, 4
    1fc8:	b520      	st.w      	r1, (r5, 0x0)
    1fca:	2503      	addi      	r5, 4
    1fcc:	3a23      	cmplti      	r2, 4
    1fce:	0ffc      	bf      	0x1fc6	// 1fc6 <__memset_fast+0x66>
    1fd0:	3a40      	cmpnei      	r2, 0
    1fd2:	0fe9      	bf      	0x1fa4	// 1fa4 <__memset_fast+0x44>
    1fd4:	2a00      	subi      	r2, 1
    1fd6:	a520      	st.b      	r1, (r5, 0x0)
    1fd8:	3a40      	cmpnei      	r2, 0
    1fda:	0fe5      	bf      	0x1fa4	// 1fa4 <__memset_fast+0x44>
    1fdc:	2a00      	subi      	r2, 1
    1fde:	a521      	st.b      	r1, (r5, 0x1)
    1fe0:	3a40      	cmpnei      	r2, 0
    1fe2:	0fe1      	bf      	0x1fa4	// 1fa4 <__memset_fast+0x44>
    1fe4:	a522      	st.b      	r1, (r5, 0x2)
    1fe6:	1483      	pop      	r4-r6

00001fe8 <__memcpy_fast>:
    1fe8:	14c3      	push      	r4-r6
    1fea:	6d83      	mov      	r6, r0
    1fec:	6d07      	mov      	r4, r1
    1fee:	6d18      	or      	r4, r6
    1ff0:	3303      	movi      	r3, 3
    1ff2:	690c      	and      	r4, r3
    1ff4:	3c40      	cmpnei      	r4, 0
    1ff6:	0c0b      	bf      	0x200c	// 200c <__memcpy_fast+0x24>
    1ff8:	3a40      	cmpnei      	r2, 0
    1ffa:	0c08      	bf      	0x200a	// 200a <__memcpy_fast+0x22>
    1ffc:	8160      	ld.b      	r3, (r1, 0x0)
    1ffe:	2100      	addi      	r1, 1
    2000:	2a00      	subi      	r2, 1
    2002:	a660      	st.b      	r3, (r6, 0x0)
    2004:	2600      	addi      	r6, 1
    2006:	3a40      	cmpnei      	r2, 0
    2008:	0bfa      	bt      	0x1ffc	// 1ffc <__memcpy_fast+0x14>
    200a:	1483      	pop      	r4-r6
    200c:	3a2f      	cmplti      	r2, 16
    200e:	080e      	bt      	0x202a	// 202a <__memcpy_fast+0x42>
    2010:	91a0      	ld.w      	r5, (r1, 0x0)
    2012:	9161      	ld.w      	r3, (r1, 0x4)
    2014:	9182      	ld.w      	r4, (r1, 0x8)
    2016:	b6a0      	st.w      	r5, (r6, 0x0)
    2018:	91a3      	ld.w      	r5, (r1, 0xc)
    201a:	b661      	st.w      	r3, (r6, 0x4)
    201c:	b682      	st.w      	r4, (r6, 0x8)
    201e:	b6a3      	st.w      	r5, (r6, 0xc)
    2020:	2a0f      	subi      	r2, 16
    2022:	210f      	addi      	r1, 16
    2024:	260f      	addi      	r6, 16
    2026:	3a2f      	cmplti      	r2, 16
    2028:	0ff4      	bf      	0x2010	// 2010 <__memcpy_fast+0x28>
    202a:	3a23      	cmplti      	r2, 4
    202c:	0808      	bt      	0x203c	// 203c <__memcpy_fast+0x54>
    202e:	9160      	ld.w      	r3, (r1, 0x0)
    2030:	2a03      	subi      	r2, 4
    2032:	2103      	addi      	r1, 4
    2034:	b660      	st.w      	r3, (r6, 0x0)
    2036:	2603      	addi      	r6, 4
    2038:	3a23      	cmplti      	r2, 4
    203a:	0ffa      	bf      	0x202e	// 202e <__memcpy_fast+0x46>
    203c:	3a40      	cmpnei      	r2, 0
    203e:	0fe6      	bf      	0x200a	// 200a <__memcpy_fast+0x22>
    2040:	8160      	ld.b      	r3, (r1, 0x0)
    2042:	2100      	addi      	r1, 1
    2044:	2a00      	subi      	r2, 1
    2046:	a660      	st.b      	r3, (r6, 0x0)
    2048:	2600      	addi      	r6, 1
    204a:	07f9      	br      	0x203c	// 203c <__memcpy_fast+0x54>

Disassembly of section .text.__main:

0000204c <__main>:
extern char _bss_start[];
extern char _ebss[];


void __main( void ) 
{
    204c:	14d0      	push      	r15

  /* if the start of data (dst)
     is not equal to end of text (src) then
     copy it, else it's already in the right place
     */
  if( _start_data != _end_rodata ) {
    204e:	1009      	lrw      	r0, 0x20000000	// 2070 <__main+0x24>
    2050:	1029      	lrw      	r1, 0x979c	// 2074 <__main+0x28>
    2052:	6442      	cmpne      	r0, r1
    2054:	0c05      	bf      	0x205e	// 205e <__main+0x12>
//    __memcpy_fast( dst, src, (_end_data - _start_data));
    memcpy( dst, src, (_end_data - _start_data));
    2056:	1049      	lrw      	r2, 0x200000f8	// 2078 <__main+0x2c>
    2058:	6082      	subu      	r2, r0
    205a:	e3ffffc7 	bsr      	0x1fe8	// 1fe8 <__memcpy_fast>
  }

  /* zero the bss 
   */
  if( _ebss - _bss_start ) {
    205e:	1048      	lrw      	r2, 0x2000050c	// 207c <__main+0x30>
    2060:	1008      	lrw      	r0, 0x200000f8	// 2080 <__main+0x34>
    2062:	640a      	cmpne      	r2, r0
    2064:	0c05      	bf      	0x206e	// 206e <__main+0x22>
//    __memset_fast( _bss_start, 0x00, ( _ebss - _bss_start ));
    memset( _bss_start, 0x00, ( _ebss - _bss_start ));
    2066:	6082      	subu      	r2, r0
    2068:	3100      	movi      	r1, 0
    206a:	e3ffff7b 	bsr      	0x1f60	// 1f60 <__memset_fast>
  }

	
}
    206e:	1490      	pop      	r15
    2070:	20000000 	.long	0x20000000
    2074:	0000979c 	.long	0x0000979c
    2078:	200000f8 	.long	0x200000f8
    207c:	2000050c 	.long	0x2000050c
    2080:	200000f8 	.long	0x200000f8

Disassembly of section .text.__putchar__:

00002084 <__putchar__>:
#define _debug_uart_io
/******************************************************************************
 * Main code
 ******************************************************************************/
void __putchar__(char ch)
{
    2084:	14d0      	push      	r15
#ifdef _debug_uart_io
    // UARTTxByte(UART0,s);			//uart 0
    UARTTxByte(UART1, ch); // uart 1
    2086:	1064      	lrw      	r3, 0x2000003c	// 2094 <__putchar__+0x10>
{
    2088:	6c43      	mov      	r1, r0
    UARTTxByte(UART1, ch); // uart 1
    208a:	9300      	ld.w      	r0, (r3, 0x0)
    208c:	e0000731 	bsr      	0x2eee	// 2eee <UARTTxByte>
    volatile unsigned int *pdata = (unsigned int *)LDCC_DATA_P;
    while (*pdata & LDCC_BIT_STATUS)
        ; // Waiting for data read.
    *pdata = ch;
#endif
}
    2090:	1490      	pop      	r15
    2092:	0000      	bkpt
    2094:	2000003c 	.long	0x2000003c

Disassembly of section .text.myitoa:

00002098 <myitoa>:

char *myitoa(int value, int *string, int radix)
{
    2098:	14d4      	push      	r4-r7, r15
    209a:	1524      	subi      	r14, r14, 144
    209c:	6d47      	mov      	r5, r1
    int i;
    unsigned v;
    int sign;
    int *sp;

    if (radix > 36 || radix <= 1)
    209e:	3322      	movi      	r3, 34
    20a0:	5a27      	subi      	r1, r2, 2
    20a2:	644c      	cmphs      	r3, r1
    20a4:	0c3b      	bf      	0x211a	// 211a <myitoa+0x82>
    {
        return 0;
    }

    sign = (radix == 10 && value < 0);
    20a6:	3a4a      	cmpnei      	r2, 10
    20a8:	083b      	bt      	0x211e	// 211e <myitoa+0x86>
    20aa:	38df      	btsti      	r0, 31
    20ac:	0c39      	bf      	0x211e	// 211e <myitoa+0x86>
    if (sign)
        v = -value;
    20ae:	3400      	movi      	r4, 0
    20b0:	6102      	subu      	r4, r0
    sign = (radix == 10 && value < 0);
    20b2:	3301      	movi      	r3, 1
    20b4:	1f03      	addi      	r7, r14, 12
    else
        v = (unsigned)value;
    20b6:	b860      	st.w      	r3, (r14, 0x0)
    20b8:	6cdf      	mov      	r3, r7
    20ba:	0415      	br      	0x20e4	// 20e4 <myitoa+0x4c>
    while (v || tp == tmp)
    {
        i = v % radix;
    20bc:	6c4b      	mov      	r1, r2
    20be:	6c13      	mov      	r0, r4
    20c0:	b862      	st.w      	r3, (r14, 0x8)
    20c2:	b841      	st.w      	r2, (r14, 0x4)
    20c4:	e0000d6e 	bsr      	0x3ba0	// 3ba0 <__umodsi3>
        v = v / radix;
    20c8:	9841      	ld.w      	r2, (r14, 0x4)
        i = v % radix;
    20ca:	6d83      	mov      	r6, r0
        v = v / radix;
    20cc:	6c4b      	mov      	r1, r2
    20ce:	6c13      	mov      	r0, r4
    20d0:	e0000d56 	bsr      	0x3b7c	// 3b7c <__udivsi3>
        if (i < 10)
    20d4:	3e09      	cmphsi      	r6, 10
        v = v / radix;
    20d6:	6d03      	mov      	r4, r0
        if (i < 10)
    20d8:	9841      	ld.w      	r2, (r14, 0x4)
    20da:	9862      	ld.w      	r3, (r14, 0x8)
    20dc:	0816      	bt      	0x2108	// 2108 <myitoa+0x70>
        {
            *tp++ = i + '0';
    20de:	262f      	addi      	r6, 48
        }
        else
        {
            *tp++ = i + 'a' - 10;
    20e0:	b7c0      	st.w      	r6, (r7, 0x0)
    20e2:	2703      	addi      	r7, 4
    while (v || tp == tmp)
    20e4:	3c40      	cmpnei      	r4, 0
    20e6:	6c5f      	mov      	r1, r7
    20e8:	0bea      	bt      	0x20bc	// 20bc <myitoa+0x24>
    20ea:	65ce      	cmpne      	r3, r7
    20ec:	0fe8      	bf      	0x20bc	// 20bc <myitoa+0x24>
        }
    }

    sp = string;

    if (sign)
    20ee:	9840      	ld.w      	r2, (r14, 0x0)
    20f0:	3a40      	cmpnei      	r2, 0
    20f2:	0c0d      	bf      	0x210c	// 210c <myitoa+0x74>
        *sp++ = '-';
    20f4:	302d      	movi      	r0, 45
    20f6:	5d4e      	addi      	r2, r5, 4
    20f8:	b500      	st.w      	r0, (r5, 0x0)
    while (tp > tmp)
    20fa:	644c      	cmphs      	r3, r1
    20fc:	0c0a      	bf      	0x2110	// 2110 <myitoa+0x78>
        *sp++ = *--tp;
    *sp = 0;
    20fe:	3300      	movi      	r3, 0
    2100:	b260      	st.w      	r3, (r2, 0x0)
    return string;
    2102:	6c17      	mov      	r0, r5
}
    2104:	1504      	addi      	r14, r14, 144
    2106:	1494      	pop      	r4-r7, r15
            *tp++ = i + 'a' - 10;
    2108:	2656      	addi      	r6, 87
    210a:	07eb      	br      	0x20e0	// 20e0 <myitoa+0x48>
    210c:	6c97      	mov      	r2, r5
    210e:	07f6      	br      	0x20fa	// 20fa <myitoa+0x62>
        *sp++ = *--tp;
    2110:	2903      	subi      	r1, 4
    2112:	9100      	ld.w      	r0, (r1, 0x0)
    2114:	b200      	st.w      	r0, (r2, 0x0)
    2116:	2203      	addi      	r2, 4
    2118:	07f1      	br      	0x20fa	// 20fa <myitoa+0x62>
        return 0;
    211a:	3000      	movi      	r0, 0
    211c:	07f4      	br      	0x2104	// 2104 <myitoa+0x6c>
        v = (unsigned)value;
    211e:	6d03      	mov      	r4, r0
    2120:	3300      	movi      	r3, 0
    2122:	07c9      	br      	0x20b4	// 20b4 <myitoa+0x1c>

Disassembly of section .text.my_printf:

00002124 <my_printf>:

void my_printf(const char *fmt, ...)
{
    2124:	1424      	subi      	r14, r14, 16
    2126:	b863      	st.w      	r3, (r14, 0xc)
    2128:	b842      	st.w      	r2, (r14, 0x8)
    212a:	b821      	st.w      	r1, (r14, 0x4)
    212c:	b800      	st.w      	r0, (r14, 0x0)
    212e:	14d3      	push      	r4-r6, r15
    2130:	1430      	subi      	r14, r14, 64
    2132:	98b4      	ld.w      	r5, (r14, 0x50)
    int d;
    // char ch, *pbuf, buf[16];
    char ch, *pbuf;
    int buf[16];
    va_list ap;
    va_start(ap, fmt);
    2134:	1c15      	addi      	r4, r14, 84
    while (*fmt)
    2136:	8500      	ld.b      	r0, (r5, 0x0)
    2138:	3840      	cmpnei      	r0, 0
    213a:	0809      	bt      	0x214c	// 214c <my_printf+0x28>
            break;
        }
        fmt++;
    }
    va_end(ap);
}
    213c:	1410      	addi      	r14, r14, 64
    213e:	d9ee2003 	ld.w      	r15, (r14, 0xc)
    2142:	98c2      	ld.w      	r6, (r14, 0x8)
    2144:	98a1      	ld.w      	r5, (r14, 0x4)
    2146:	9880      	ld.w      	r4, (r14, 0x0)
    2148:	1408      	addi      	r14, r14, 32
    214a:	783c      	jmp      	r15
        if (*fmt != '%')
    214c:	3325      	movi      	r3, 37
    214e:	64c2      	cmpne      	r0, r3
    2150:	0c05      	bf      	0x215a	// 215a <my_printf+0x36>
            __putchar__(*fmt++);
    2152:	2500      	addi      	r5, 1
    2154:	e3ffff98 	bsr      	0x2084	// 2084 <__putchar__>
            continue;
    2158:	07ef      	br      	0x2136	// 2136 <my_printf+0x12>
        switch (*++fmt)
    215a:	8501      	ld.b      	r0, (r5, 0x1)
    215c:	3363      	movi      	r3, 99
    215e:	64c2      	cmpne      	r0, r3
    2160:	0c40      	bf      	0x21e0	// 21e0 <my_printf+0xbc>
    2162:	640c      	cmphs      	r3, r0
    2164:	0c0a      	bf      	0x2178	// 2178 <my_printf+0x54>
    2166:	3343      	movi      	r3, 67
    2168:	64c2      	cmpne      	r0, r3
    216a:	0c3b      	bf      	0x21e0	// 21e0 <my_printf+0xbc>
    216c:	3358      	movi      	r3, 88
    216e:	64c2      	cmpne      	r0, r3
    2170:	0c29      	bf      	0x21c2	// 21c2 <my_printf+0x9e>
            __putchar__(*fmt);
    2172:	e3ffff89 	bsr      	0x2084	// 2084 <__putchar__>
            break;
    2176:	041f      	br      	0x21b4	// 21b4 <my_printf+0x90>
        switch (*++fmt)
    2178:	3373      	movi      	r3, 115
    217a:	64c2      	cmpne      	r0, r3
    217c:	0c16      	bf      	0x21a8	// 21a8 <my_printf+0x84>
    217e:	3378      	movi      	r3, 120
    2180:	64c2      	cmpne      	r0, r3
    2182:	0c20      	bf      	0x21c2	// 21c2 <my_printf+0x9e>
    2184:	3364      	movi      	r3, 100
    2186:	64c2      	cmpne      	r0, r3
    2188:	0bf5      	bt      	0x2172	// 2172 <my_printf+0x4e>
            myitoa(d, buf, 10);
    218a:	9400      	ld.w      	r0, (r4, 0x0)
    218c:	320a      	movi      	r2, 10
    218e:	6c7b      	mov      	r1, r14
            d = va_arg(ap, int);
    2190:	5cce      	addi      	r6, r4, 4
            myitoa(d, buf, 10);
    2192:	e3ffff83 	bsr      	0x2098	// 2098 <myitoa>
            for (s = buf; *s; s++)
    2196:	6d3b      	mov      	r4, r14
    2198:	9400      	ld.w      	r0, (r4, 0x0)
    219a:	3840      	cmpnei      	r0, 0
    219c:	0c0b      	bf      	0x21b2	// 21b2 <my_printf+0x8e>
                __putchar__(*s);
    219e:	7400      	zextb      	r0, r0
    21a0:	e3ffff72 	bsr      	0x2084	// 2084 <__putchar__>
            for (s = buf; *s; s++)
    21a4:	2403      	addi      	r4, 4
    21a6:	07f9      	br      	0x2198	// 2198 <my_printf+0x74>
            s = va_arg(ap, const char *);
    21a8:	5cce      	addi      	r6, r4, 4
    21aa:	9480      	ld.w      	r4, (r4, 0x0)
            for (; *s; s++)
    21ac:	9400      	ld.w      	r0, (r4, 0x0)
    21ae:	3840      	cmpnei      	r0, 0
    21b0:	0804      	bt      	0x21b8	// 21b8 <my_printf+0x94>
            ch = (unsigned char)va_arg(ap, int);
    21b2:	6d1b      	mov      	r4, r6
        fmt++;
    21b4:	2501      	addi      	r5, 2
    21b6:	07c0      	br      	0x2136	// 2136 <my_printf+0x12>
                __putchar__(*s);
    21b8:	7400      	zextb      	r0, r0
    21ba:	e3ffff65 	bsr      	0x2084	// 2084 <__putchar__>
            for (; *s; s++)
    21be:	2403      	addi      	r4, 4
    21c0:	07f6      	br      	0x21ac	// 21ac <my_printf+0x88>
            myitoa(d, buf, 16);
    21c2:	9400      	ld.w      	r0, (r4, 0x0)
    21c4:	3210      	movi      	r2, 16
    21c6:	6c7b      	mov      	r1, r14
            d = va_arg(ap, int);
    21c8:	5cce      	addi      	r6, r4, 4
            myitoa(d, buf, 16);
    21ca:	e3ffff67 	bsr      	0x2098	// 2098 <myitoa>
            for (s = buf; *s; s++)
    21ce:	6d3b      	mov      	r4, r14
    21d0:	9400      	ld.w      	r0, (r4, 0x0)
    21d2:	3840      	cmpnei      	r0, 0
    21d4:	0fef      	bf      	0x21b2	// 21b2 <my_printf+0x8e>
                __putchar__(*s);
    21d6:	7400      	zextb      	r0, r0
    21d8:	e3ffff56 	bsr      	0x2084	// 2084 <__putchar__>
            for (s = buf; *s; s++)
    21dc:	2403      	addi      	r4, 4
    21de:	07f9      	br      	0x21d0	// 21d0 <my_printf+0xac>
            __putchar__(*pbuf);
    21e0:	8400      	ld.b      	r0, (r4, 0x0)
            ch = (unsigned char)va_arg(ap, int);
    21e2:	5cce      	addi      	r6, r4, 4
            __putchar__(*pbuf);
    21e4:	e3ffff50 	bsr      	0x2084	// 2084 <__putchar__>
    21e8:	07e5      	br      	0x21b2	// 21b2 <my_printf+0x8e>

Disassembly of section .text.ADC12_Control:

000021ec <ADC12_Control>:
//ReturnValue:NONE
/*************************************************************/  
  //control:ADC enable/disable ,start/stop,swrst
void ADC12_Control(ADC12_Control_TypeDef ADC12_Control_x )
{
	ADC0->CR |= ADC12_Control_x;							// 
    21ec:	1063      	lrw      	r3, 0x20000050	// 21f8 <ADC12_Control+0xc>
    21ee:	9340      	ld.w      	r2, (r3, 0x0)
    21f0:	9264      	ld.w      	r3, (r2, 0x10)
    21f2:	6c0c      	or      	r0, r3
    21f4:	b204      	st.w      	r0, (r2, 0x10)
}
    21f6:	783c      	jmp      	r15
    21f8:	20000050 	.long	0x20000050

Disassembly of section .text.ADC12_CMD.part.0:

000021fc <ADC12_CMD.part.0>:
//ADC12 ENABLE
//EntryParameter:NewState
//NewState:ENABLE , DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_CMD(FunctionalStatus NewState)
    21fc:	14d0      	push      	r15
{
	if (NewState != DISABLE)
	{
		ADC12_Control(ADC12_ADCEN);						//ADC12 ENABLE
    21fe:	3002      	movi      	r0, 2
    2200:	e3fffff6 	bsr      	0x21ec	// 21ec <ADC12_Control>
		while(!(ADC0->SR &ADC12_ADCENS));
    2204:	1065      	lrw      	r3, 0x20000050	// 2218 <ADC12_CMD.part.0+0x1c>
    2206:	3280      	movi      	r2, 128
    2208:	9320      	ld.w      	r1, (r3, 0x0)
    220a:	4241      	lsli      	r2, r2, 1
    220c:	9168      	ld.w      	r3, (r1, 0x20)
    220e:	68c8      	and      	r3, r2
    2210:	3b40      	cmpnei      	r3, 0
    2212:	0ffd      	bf      	0x220c	// 220c <ADC12_CMD.part.0+0x10>
	else
	{
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
		while(ADC0->SR&ADC12_ADCENS);
	}
}
    2214:	1490      	pop      	r15
    2216:	0000      	bkpt
    2218:	20000050 	.long	0x20000050

Disassembly of section .text.ADC12_CLK_CMD:

0000221c <ADC12_CLK_CMD>:
	if (NewState != DISABLE)
    221c:	3940      	cmpnei      	r1, 0
    221e:	106a      	lrw      	r3, 0x20000050	// 2244 <ADC12_CLK_CMD+0x28>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    2220:	9340      	ld.w      	r2, (r3, 0x0)
	if (NewState != DISABLE)
    2222:	0c09      	bf      	0x2234	// 2234 <ADC12_CLK_CMD+0x18>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    2224:	9260      	ld.w      	r3, (r2, 0x0)
    2226:	6cc0      	or      	r3, r0
    2228:	b260      	st.w      	r3, (r2, 0x0)
		while(!(ADC0->PMSR&ADC_CLK_CMD));
    222a:	9262      	ld.w      	r3, (r2, 0x8)
    222c:	68c0      	and      	r3, r0
    222e:	3b40      	cmpnei      	r3, 0
    2230:	0ffd      	bf      	0x222a	// 222a <ADC12_CLK_CMD+0xe>
}
    2232:	783c      	jmp      	r15
		ADC0->DCR  |= ADC_CLK_CMD;						//DISABLE
    2234:	9261      	ld.w      	r3, (r2, 0x4)
    2236:	6cc0      	or      	r3, r0
    2238:	b261      	st.w      	r3, (r2, 0x4)
		while(ADC0->PMSR&ADC_CLK_CMD);
    223a:	9262      	ld.w      	r3, (r2, 0x8)
    223c:	68c0      	and      	r3, r0
    223e:	3b40      	cmpnei      	r3, 0
    2240:	0bfd      	bt      	0x223a	// 223a <ADC12_CLK_CMD+0x1e>
    2242:	07f8      	br      	0x2232	// 2232 <ADC12_CLK_CMD+0x16>
    2244:	20000050 	.long	0x20000050

Disassembly of section .text.ADC12_Software_Reset:

00002248 <ADC12_Software_Reset>:
{
    2248:	14d0      	push      	r15
	ADC12_Control(ADC12_SWRST);
    224a:	3001      	movi      	r0, 1
    224c:	e3ffffd0 	bsr      	0x21ec	// 21ec <ADC12_Control>
}
    2250:	1490      	pop      	r15

Disassembly of section .text.ADC12_CMD:

00002254 <ADC12_CMD>:
{
    2254:	14d0      	push      	r15
	if (NewState != DISABLE)
    2256:	3840      	cmpnei      	r0, 0
    2258:	0c04      	bf      	0x2260	// 2260 <ADC12_CMD+0xc>
    225a:	e3ffffd1 	bsr      	0x21fc	// 21fc <ADC12_CMD.part.0>
}
    225e:	1490      	pop      	r15
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
    2260:	3004      	movi      	r0, 4
    2262:	e3ffffc5 	bsr      	0x21ec	// 21ec <ADC12_Control>
		while(ADC0->SR&ADC12_ADCENS);
    2266:	1065      	lrw      	r3, 0x20000050	// 2278 <ADC12_CMD+0x24>
    2268:	3280      	movi      	r2, 128
    226a:	9320      	ld.w      	r1, (r3, 0x0)
    226c:	4241      	lsli      	r2, r2, 1
    226e:	9168      	ld.w      	r3, (r1, 0x20)
    2270:	68c8      	and      	r3, r2
    2272:	3b40      	cmpnei      	r3, 0
    2274:	0bfd      	bt      	0x226e	// 226e <ADC12_CMD+0x1a>
    2276:	07f4      	br      	0x225e	// 225e <ADC12_CMD+0xa>
    2278:	20000050 	.long	0x20000050

Disassembly of section .text.ADC12_ready_wait:

0000227c <ADC12_ready_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 READ FLAG
/*************************************************************/ 
void ADC12_ready_wait(void)  
{
	while(!(ADC0->SR&ADC12_READY));   					// Waiting for ADC0 Ready
    227c:	1064      	lrw      	r3, 0x20000050	// 228c <ADC12_ready_wait+0x10>
    227e:	3202      	movi      	r2, 2
    2280:	9320      	ld.w      	r1, (r3, 0x0)
    2282:	9168      	ld.w      	r3, (r1, 0x20)
    2284:	68c8      	and      	r3, r2
    2286:	3b40      	cmpnei      	r3, 0
    2288:	0ffd      	bf      	0x2282	// 2282 <ADC12_ready_wait+0x6>
}
    228a:	783c      	jmp      	r15
    228c:	20000050 	.long	0x20000050

Disassembly of section .text.ADC12_SEQEND_wait:

00002290 <ADC12_SEQEND_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 EOC
/*************************************************************/ 
void ADC12_SEQEND_wait(U8_T val)
{
	while(!(ADC0->SR & (0x01ul << (16+val))));			// EOC wait
    2290:	200f      	addi      	r0, 16
    2292:	1065      	lrw      	r3, 0x20000050	// 22a4 <ADC12_SEQEND_wait+0x14>
    2294:	3201      	movi      	r2, 1
    2296:	9320      	ld.w      	r1, (r3, 0x0)
    2298:	7080      	lsl      	r2, r0
    229a:	9168      	ld.w      	r3, (r1, 0x20)
    229c:	68c8      	and      	r3, r2
    229e:	3b40      	cmpnei      	r3, 0
    22a0:	0ffd      	bf      	0x229a	// 229a <ADC12_SEQEND_wait+0xa>
}  
    22a2:	783c      	jmp      	r15
    22a4:	20000050 	.long	0x20000050

Disassembly of section .text.ADC12_Configure_Mode:

000022a8 <ADC12_Configure_Mode>:
  //10BIT or 12BIT adc ;
  //ADC12_BIT_SELECTED:ADC12_12BIT/ADC12_10BIT;
  //ADC12_ConverMode:One_shot_mode/Continuous_mode;
  //adc date output=last number of Conversions;
void  ADC12_Configure_Mode(ADC12_10bitor12bit_TypeDef ADC12_BIT_SELECTED  , ADC12_ConverMode_TypeDef  ADC12_ConverMode  , U8_T ADC12_PRI, U8_T adc12_SHR , U8_T ADC12_DIV , U8_T NumConver ) 
{
    22a8:	14d4      	push      	r4-r7, r15
    22aa:	1422      	subi      	r14, r14, 8
    22ac:	1c08      	addi      	r4, r14, 32
    22ae:	84a0      	ld.b      	r5, (r4, 0x0)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    22b0:	2d00      	subi      	r5, 1
{
    22b2:	6dc3      	mov      	r7, r0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    22b4:	10db      	lrw      	r6, 0x20000050	// 2320 <ADC12_Configure_Mode+0x78>
{
    22b6:	d80e001c 	ld.b      	r0, (r14, 0x1c)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    22ba:	45aa      	lsli      	r5, r5, 10
    22bc:	9680      	ld.w      	r4, (r6, 0x0)
    22be:	6d40      	or      	r5, r0
	if(ADC12_ConverMode==One_shot_mode)
    22c0:	3940      	cmpnei      	r1, 0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    22c2:	b4a5      	st.w      	r5, (r4, 0x14)
	if(ADC12_ConverMode==One_shot_mode)
    22c4:	081c      	bt      	0x22fc	// 22fc <ADC12_Configure_Mode+0x54>
	{
		ADC0->MR&=~CONTCV;								//one short mode
    22c6:	9425      	ld.w      	r1, (r4, 0x14)
    22c8:	4121      	lsli      	r1, r1, 1
    22ca:	4921      	lsri      	r1, r1, 1
		while(ADC0->SR&ADC12_CTCVS);							
    22cc:	3080      	movi      	r0, 128
		ADC0->MR&=~CONTCV;								//one short mode
    22ce:	b425      	st.w      	r1, (r4, 0x14)
		while(ADC0->SR&ADC12_CTCVS);							
    22d0:	4002      	lsli      	r0, r0, 2
    22d2:	9428      	ld.w      	r1, (r4, 0x20)
    22d4:	6840      	and      	r1, r0
    22d6:	3940      	cmpnei      	r1, 0
    22d8:	0bfd      	bt      	0x22d2	// 22d2 <ADC12_Configure_Mode+0x2a>
    22da:	b861      	st.w      	r3, (r14, 0x4)
    22dc:	b840      	st.w      	r2, (r14, 0x0)
    22de:	e3ffff8f 	bsr      	0x21fc	// 21fc <ADC12_CMD.part.0>
	{
		ADC0->MR|=CONTCV;								//Continuous mode
		while(!(ADC0->SR&ADC12_CTCVS));							
	}
	ADC12_CMD(ENABLE);									//ADC0 enable
	if(ADC12_BIT_SELECTED)
    22e2:	3f40      	cmpnei      	r7, 0
    22e4:	9840      	ld.w      	r2, (r14, 0x0)
    22e6:	9861      	ld.w      	r3, (r14, 0x4)
    22e8:	0c16      	bf      	0x2314	// 2314 <ADC12_Configure_Mode+0x6c>
	{
		ADC0->CR|=ADC12_10BITor12BIT;
    22ea:	9600      	ld.w      	r0, (r6, 0x0)
    22ec:	9024      	ld.w      	r1, (r0, 0x10)
    22ee:	39bf      	bseti      	r1, 31
	}
	else
	{
		ADC0->CR&=~ADC12_10BITor12BIT;
    22f0:	b024      	st.w      	r1, (r0, 0x10)
	}
	//ADC0->CR|=ADC12_VREF_VDD | ADC12_FVR_DIS;
	ADC0->PRI=ADC12_PRI;
    22f2:	9620      	ld.w      	r1, (r6, 0x0)
    22f4:	b15c      	st.w      	r2, (r1, 0x70)
	ADC0->SHR=adc12_SHR;								//adc Sampling & Holding cycles
    22f6:	b166      	st.w      	r3, (r1, 0x18)
} 
    22f8:	1402      	addi      	r14, r14, 8
    22fa:	1494      	pop      	r4-r7, r15
	else if(ADC12_ConverMode==Continuous_mode)
    22fc:	3941      	cmpnei      	r1, 1
    22fe:	0bee      	bt      	0x22da	// 22da <ADC12_Configure_Mode+0x32>
		ADC0->MR|=CONTCV;								//Continuous mode
    2300:	9425      	ld.w      	r1, (r4, 0x14)
    2302:	39bf      	bseti      	r1, 31
		while(!(ADC0->SR&ADC12_CTCVS));							
    2304:	3080      	movi      	r0, 128
		ADC0->MR|=CONTCV;								//Continuous mode
    2306:	b425      	st.w      	r1, (r4, 0x14)
		while(!(ADC0->SR&ADC12_CTCVS));							
    2308:	4002      	lsli      	r0, r0, 2
    230a:	9428      	ld.w      	r1, (r4, 0x20)
    230c:	6840      	and      	r1, r0
    230e:	3940      	cmpnei      	r1, 0
    2310:	0ffd      	bf      	0x230a	// 230a <ADC12_Configure_Mode+0x62>
    2312:	07e4      	br      	0x22da	// 22da <ADC12_Configure_Mode+0x32>
		ADC0->CR&=~ADC12_10BITor12BIT;
    2314:	9600      	ld.w      	r0, (r6, 0x0)
    2316:	9024      	ld.w      	r1, (r0, 0x10)
    2318:	4121      	lsli      	r1, r1, 1
    231a:	4921      	lsri      	r1, r1, 1
    231c:	07ea      	br      	0x22f0	// 22f0 <ADC12_Configure_Mode+0x48>
    231e:	0000      	bkpt
    2320:	20000050 	.long	0x20000050

Disassembly of section .text.ADC12_Configure_VREF_Selecte:

00002324 <ADC12_Configure_VREF_Selecte>:
//EntryParameter:NONE
//ReturnValue:None
/*************************************************************/ 
void ADC12_Configure_VREF_Selecte(ADC12_VREFP_VREFN_Selected_TypeDef ADC12_VREFP_X_VREFN_X )
{
	if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_VSS)
    2324:	3840      	cmpnei      	r0, 0
    2326:	0808      	bt      	0x2336	// 2336 <ADC12_Configure_VREF_Selecte+0x12>
	{
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x00<<6);
    2328:	127c      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    232a:	123d      	lrw      	r1, 0x103c0	// 249c <ADC12_Configure_VREF_Selecte+0x178>
    232c:	9340      	ld.w      	r2, (r3, 0x0)
    232e:	9264      	ld.w      	r3, (r2, 0x10)
    2330:	68c5      	andn      	r3, r1
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
	}
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
	{
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x0000B000;					
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    2332:	b264      	st.w      	r3, (r2, 0x10)
	}
}
    2334:	783c      	jmp      	r15
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_VSS)
    2336:	3841      	cmpnei      	r0, 1
    2338:	0810      	bt      	0x2358	// 2358 <ADC12_Configure_VREF_Selecte+0x34>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    233a:	127a      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    233c:	32f0      	movi      	r2, 240
    233e:	9320      	ld.w      	r1, (r3, 0x0)
    2340:	9160      	ld.w      	r3, (r1, 0x0)
    2342:	4244      	lsli      	r2, r2, 4
    2344:	68c9      	andn      	r3, r2
    2346:	3bab      	bseti      	r3, 11
    2348:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x01<<6);
    234a:	1235      	lrw      	r1, 0x103c0	// 249c <ADC12_Configure_VREF_Selecte+0x178>
    234c:	1273      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    234e:	9340      	ld.w      	r2, (r3, 0x0)
    2350:	9264      	ld.w      	r3, (r2, 0x10)
    2352:	68c5      	andn      	r3, r1
    2354:	3ba6      	bseti      	r3, 6
    2356:	07ee      	br      	0x2332	// 2332 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_VSS)
    2358:	3842      	cmpnei      	r0, 2
    235a:	0811      	bt      	0x237c	// 237c <ADC12_Configure_VREF_Selecte+0x58>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    235c:	1271      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    235e:	32f0      	movi      	r2, 240
    2360:	9320      	ld.w      	r1, (r3, 0x0)
    2362:	9160      	ld.w      	r3, (r1, 0x0)
    2364:	4244      	lsli      	r2, r2, 4
    2366:	68c9      	andn      	r3, r2
    2368:	3bab      	bseti      	r3, 11
    236a:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x02<<6)|(0X01<<24)|(0X00<<25);
    236c:	122e      	lrw      	r1, 0x30103c0	// 24a4 <ADC12_Configure_VREF_Selecte+0x180>
    236e:	126b      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    2370:	9340      	ld.w      	r2, (r3, 0x0)
    2372:	9264      	ld.w      	r3, (r2, 0x10)
    2374:	68c5      	andn      	r3, r1
    2376:	3ba7      	bseti      	r3, 7
    2378:	3bb8      	bseti      	r3, 24
    237a:	07dc      	br      	0x2332	// 2332 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_VSS)
    237c:	3843      	cmpnei      	r0, 3
    237e:	0811      	bt      	0x23a0	// 23a0 <ADC12_Configure_VREF_Selecte+0x7c>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    2380:	1268      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    2382:	32f0      	movi      	r2, 240
    2384:	9320      	ld.w      	r1, (r3, 0x0)
    2386:	9160      	ld.w      	r3, (r1, 0x0)
    2388:	4244      	lsli      	r2, r2, 4
    238a:	68c9      	andn      	r3, r2
    238c:	3bab      	bseti      	r3, 11
    238e:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x03<<6)|(0X01<<24)|(0X01<<25);
    2390:	1225      	lrw      	r1, 0x30103c0	// 24a4 <ADC12_Configure_VREF_Selecte+0x180>
    2392:	1262      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    2394:	9340      	ld.w      	r2, (r3, 0x0)
    2396:	9264      	ld.w      	r3, (r2, 0x10)
    2398:	68c5      	andn      	r3, r1
    239a:	1224      	lrw      	r1, 0x30000c0	// 24a8 <ADC12_Configure_VREF_Selecte+0x184>
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    239c:	6cc4      	or      	r3, r1
    239e:	07ca      	br      	0x2332	// 2332 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_VSS)
    23a0:	3845      	cmpnei      	r0, 5
    23a2:	0809      	bt      	0x23b4	// 23b4 <ADC12_Configure_VREF_Selecte+0x90>
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x04<<6)|(0X00<<16)|(0X02<<17);
    23a4:	117d      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    23a6:	1222      	lrw      	r1, 0x503c0	// 24ac <ADC12_Configure_VREF_Selecte+0x188>
    23a8:	9340      	ld.w      	r2, (r3, 0x0)
    23aa:	9264      	ld.w      	r3, (r2, 0x10)
    23ac:	68c5      	andn      	r3, r1
    23ae:	3ba8      	bseti      	r3, 8
    23b0:	3bb2      	bseti      	r3, 18
    23b2:	07c0      	br      	0x2332	// 2332 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_EXIT)
    23b4:	3846      	cmpnei      	r0, 6
    23b6:	0812      	bt      	0x23da	// 23da <ADC12_Configure_VREF_Selecte+0xb6>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x0000B000;	
    23b8:	117a      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    23ba:	32f0      	movi      	r2, 240
    23bc:	9320      	ld.w      	r1, (r3, 0x0)
    23be:	9160      	ld.w      	r3, (r1, 0x0)
    23c0:	4248      	lsli      	r2, r2, 8
    23c2:	68c9      	andn      	r3, r2
    23c4:	32b0      	movi      	r2, 176
    23c6:	4248      	lsli      	r2, r2, 8
    23c8:	6cc8      	or      	r3, r2
    23ca:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x08<<6);
    23cc:	1134      	lrw      	r1, 0x103c0	// 249c <ADC12_Configure_VREF_Selecte+0x178>
    23ce:	1173      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    23d0:	9340      	ld.w      	r2, (r3, 0x0)
    23d2:	9264      	ld.w      	r3, (r2, 0x10)
    23d4:	68c5      	andn      	r3, r1
    23d6:	3ba9      	bseti      	r3, 9
    23d8:	07ad      	br      	0x2332	// 2332 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_EXIT)
    23da:	3847      	cmpnei      	r0, 7
    23dc:	0819      	bt      	0x240e	// 240e <ADC12_Configure_VREF_Selecte+0xea>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x0000B000;
    23de:	1171      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    23e0:	31f0      	movi      	r1, 240
    23e2:	9340      	ld.w      	r2, (r3, 0x0)
    23e4:	9260      	ld.w      	r3, (r2, 0x0)
    23e6:	4128      	lsli      	r1, r1, 8
    23e8:	68c5      	andn      	r3, r1
    23ea:	31b0      	movi      	r1, 176
    23ec:	4128      	lsli      	r1, r1, 8
    23ee:	6cc4      	or      	r3, r1
    23f0:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;			
    23f2:	31f0      	movi      	r1, 240
    23f4:	9260      	ld.w      	r3, (r2, 0x0)
    23f6:	4124      	lsli      	r1, r1, 4
    23f8:	68c5      	andn      	r3, r1
    23fa:	3bab      	bseti      	r3, 11
    23fc:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x09<<6);
    23fe:	1128      	lrw      	r1, 0x103c0	// 249c <ADC12_Configure_VREF_Selecte+0x178>
    2400:	1166      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    2402:	9340      	ld.w      	r2, (r3, 0x0)
    2404:	9264      	ld.w      	r3, (r2, 0x10)
    2406:	68c5      	andn      	r3, r1
    2408:	3ba6      	bseti      	r3, 6
    240a:	3ba9      	bseti      	r3, 9
    240c:	0793      	br      	0x2332	// 2332 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_EXIT)
    240e:	3848      	cmpnei      	r0, 8
    2410:	0818      	bt      	0x2440	// 2440 <ADC12_Configure_VREF_Selecte+0x11c>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x0000B000;	
    2412:	1164      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    2414:	31f0      	movi      	r1, 240
    2416:	9340      	ld.w      	r2, (r3, 0x0)
    2418:	9260      	ld.w      	r3, (r2, 0x0)
    241a:	4128      	lsli      	r1, r1, 8
    241c:	68c5      	andn      	r3, r1
    241e:	31b0      	movi      	r1, 176
    2420:	4128      	lsli      	r1, r1, 8
    2422:	6cc4      	or      	r3, r1
    2424:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;
    2426:	31f0      	movi      	r1, 240
    2428:	9260      	ld.w      	r3, (r2, 0x0)
    242a:	4124      	lsli      	r1, r1, 4
    242c:	68c5      	andn      	r3, r1
    242e:	3bab      	bseti      	r3, 11
    2430:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0A<<6)|(0X01<<24)|(0X00<<25);			
    2432:	103d      	lrw      	r1, 0x30103c0	// 24a4 <ADC12_Configure_VREF_Selecte+0x180>
    2434:	1079      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    2436:	9340      	ld.w      	r2, (r3, 0x0)
    2438:	9264      	ld.w      	r3, (r2, 0x10)
    243a:	68c5      	andn      	r3, r1
    243c:	103d      	lrw      	r1, 0x1000280	// 24b0 <ADC12_Configure_VREF_Selecte+0x18c>
    243e:	07af      	br      	0x239c	// 239c <ADC12_Configure_VREF_Selecte+0x78>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_EXIT)
    2440:	3849      	cmpnei      	r0, 9
    2442:	0818      	bt      	0x2472	// 2472 <ADC12_Configure_VREF_Selecte+0x14e>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x0000B000;	
    2444:	1077      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    2446:	31f0      	movi      	r1, 240
    2448:	9340      	ld.w      	r2, (r3, 0x0)
    244a:	9260      	ld.w      	r3, (r2, 0x0)
    244c:	4128      	lsli      	r1, r1, 8
    244e:	68c5      	andn      	r3, r1
    2450:	31b0      	movi      	r1, 176
    2452:	4128      	lsli      	r1, r1, 8
    2454:	6cc4      	or      	r3, r1
    2456:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;
    2458:	31f0      	movi      	r1, 240
    245a:	9260      	ld.w      	r3, (r2, 0x0)
    245c:	4124      	lsli      	r1, r1, 4
    245e:	68c5      	andn      	r3, r1
    2460:	3bab      	bseti      	r3, 11
    2462:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
    2464:	1030      	lrw      	r1, 0x30103c0	// 24a4 <ADC12_Configure_VREF_Selecte+0x180>
    2466:	106d      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    2468:	9340      	ld.w      	r2, (r3, 0x0)
    246a:	9264      	ld.w      	r3, (r2, 0x10)
    246c:	68c5      	andn      	r3, r1
    246e:	1032      	lrw      	r1, 0x30002c0	// 24b4 <ADC12_Configure_VREF_Selecte+0x190>
    2470:	0796      	br      	0x239c	// 239c <ADC12_Configure_VREF_Selecte+0x78>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
    2472:	384b      	cmpnei      	r0, 11
    2474:	0b60      	bt      	0x2334	// 2334 <ADC12_Configure_VREF_Selecte+0x10>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x0000B000;					
    2476:	106b      	lrw      	r3, 0x2000004c	// 24a0 <ADC12_Configure_VREF_Selecte+0x17c>
    2478:	32f0      	movi      	r2, 240
    247a:	9320      	ld.w      	r1, (r3, 0x0)
    247c:	9160      	ld.w      	r3, (r1, 0x0)
    247e:	4248      	lsli      	r2, r2, 8
    2480:	68c9      	andn      	r3, r2
    2482:	32b0      	movi      	r2, 176
    2484:	4248      	lsli      	r2, r2, 8
    2486:	6cc8      	or      	r3, r2
    2488:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    248a:	1029      	lrw      	r1, 0x503c0	// 24ac <ADC12_Configure_VREF_Selecte+0x188>
    248c:	1063      	lrw      	r3, 0x20000050	// 2498 <ADC12_Configure_VREF_Selecte+0x174>
    248e:	9340      	ld.w      	r2, (r3, 0x0)
    2490:	9264      	ld.w      	r3, (r2, 0x10)
    2492:	68c5      	andn      	r3, r1
    2494:	1029      	lrw      	r1, 0x40300	// 24b8 <ADC12_Configure_VREF_Selecte+0x194>
    2496:	0783      	br      	0x239c	// 239c <ADC12_Configure_VREF_Selecte+0x78>
    2498:	20000050 	.long	0x20000050
    249c:	000103c0 	.long	0x000103c0
    24a0:	2000004c 	.long	0x2000004c
    24a4:	030103c0 	.long	0x030103c0
    24a8:	030000c0 	.long	0x030000c0
    24ac:	000503c0 	.long	0x000503c0
    24b0:	01000280 	.long	0x01000280
    24b4:	030002c0 	.long	0x030002c0
    24b8:	00040300 	.long	0x00040300

Disassembly of section .text.ADC12_ConversionChannel_Config:

000024bc <ADC12_ConversionChannel_Config>:
//ADC12_ADCINX:ADC12_ADCIN0~ADC12_ADCIN17,ADC12_INTVREF,ADC12_DIV4_VDD,ADC12_VSS
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_ConversionChannel_Config(ADC12_InputSet_TypeDef ADC12_ADCINX ,
						ADC12_CV_RepeatNum_TypeDef CV_RepeatTime, ADC12_Control_TypeDef AVG_Set, U8_T SEQx)
{
    24bc:	14d4      	push      	r4-r7, r15
    24be:	1421      	subi      	r14, r14, 4
    24c0:	b840      	st.w      	r2, (r14, 0x0)
    24c2:	6d43      	mov      	r5, r0
	U8_T i;
	for(i=0;i<15;i++)
	{
		ADC0->SEQ[i] &=~(0x01<<7);
    24c4:	125b      	lrw      	r2, 0x20000050	// 2630 <ADC12_ConversionChannel_Config+0x174>
    24c6:	92c0      	ld.w      	r6, (r2, 0x0)
    24c8:	3200      	movi      	r2, 0
    24ca:	4202      	lsli      	r0, r2, 2
    24cc:	6018      	addu      	r0, r6
    24ce:	908c      	ld.w      	r4, (r0, 0x30)
    24d0:	2200      	addi      	r2, 1
    24d2:	3c87      	bclri      	r4, 7
	for(i=0;i<15;i++)
    24d4:	3a4f      	cmpnei      	r2, 15
		ADC0->SEQ[i] &=~(0x01<<7);
    24d6:	b08c      	st.w      	r4, (r0, 0x30)
	for(i=0;i<15;i++)
    24d8:	0bf9      	bt      	0x24ca	// 24ca <ADC12_ConversionChannel_Config+0xe>
	}
	switch(ADC12_ADCINX)
    24da:	3d0f      	cmphsi      	r5, 16
    24dc:	0825      	bt      	0x2526	// 2526 <ADC12_ConversionChannel_Config+0x6a>
    24de:	6c17      	mov      	r0, r5
    24e0:	1255      	lrw      	r2, 0x2000004c	// 2634 <ADC12_ConversionChannel_Config+0x178>
    24e2:	1296      	lrw      	r4, 0x20000048	// 2638 <ADC12_ConversionChannel_Config+0x17c>
    24e4:	e3fff40c 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    24e8:	322c1408 	.long	0x322c1408
    24ec:	4d474039 	.long	0x4d474039
    24f0:	756d6559 	.long	0x756d6559
    24f4:	9990877e 	.long	0x9990877e
	{
		case 0:	
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC0 PB0.1
    24f8:	9240      	ld.w      	r2, (r2, 0x0)
    24fa:	9200      	ld.w      	r0, (r2, 0x0)
    24fc:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    24fe:	9201      	ld.w      	r0, (r2, 0x4)
    2500:	b201      	st.w      	r0, (r2, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFF0F)  | 0x00000010;			
    2502:	9400      	ld.w      	r0, (r4, 0x0)
    2504:	9040      	ld.w      	r2, (r0, 0x0)
    2506:	34f0      	movi      	r4, 240
    2508:	6891      	andn      	r2, r4
    250a:	3aa4      	bseti      	r2, 4
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFFF)  | 0x00000000;		
			break;
		case 15:
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC15 PB0.0
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000001;		
    250c:	b040      	st.w      	r2, (r0, 0x0)
			break;
    250e:	040c      	br      	0x2526	// 2526 <ADC12_ConversionChannel_Config+0x6a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)  | 0x00000001;							//ADC1 PA0.0
    2510:	9200      	ld.w      	r0, (r2, 0x0)
    2512:	9040      	ld.w      	r2, (r0, 0x0)
    2514:	370f      	movi      	r7, 15
    2516:	689d      	andn      	r2, r7
    2518:	3aa0      	bseti      	r2, 0
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC6 PA0.7
    251a:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    251c:	9041      	ld.w      	r2, (r0, 0x4)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00100000;	
    251e:	b041      	st.w      	r2, (r0, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFFF)  | 0x00000000;		
    2520:	9440      	ld.w      	r2, (r4, 0x0)
    2522:	9200      	ld.w      	r0, (r2, 0x0)
    2524:	b200      	st.w      	r0, (r2, 0x0)
    2526:	4362      	lsli      	r3, r3, 2
    2528:	618c      	addu      	r6, r3
		//case 27: break;
		case 0x1Cul: break;
		case 0x1Dul: break;
		case 0x1Eul: break;
	}
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] & 0;
    252a:	966c      	ld.w      	r3, (r6, 0x30)
    252c:	3300      	movi      	r3, 0
    252e:	b66c      	st.w      	r3, (r6, 0x30)
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] | ADC12_ADCINX  | CV_RepeatTime | AVG_Set;
    2530:	9860      	ld.w      	r3, (r14, 0x0)
    2532:	6c4c      	or      	r1, r3
    2534:	964c      	ld.w      	r2, (r6, 0x30)
    2536:	6d44      	or      	r5, r1
    2538:	6d48      	or      	r5, r2
    253a:	b6ac      	st.w      	r5, (r6, 0x30)
}
    253c:	1401      	addi      	r14, r14, 4
    253e:	1494      	pop      	r4-r7, r15
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)  | 0x00000010;							//ADC2 PA0.1
    2540:	9200      	ld.w      	r0, (r2, 0x0)
    2542:	9040      	ld.w      	r2, (r0, 0x0)
    2544:	37f0      	movi      	r7, 240
    2546:	689d      	andn      	r2, r7
    2548:	3aa4      	bseti      	r2, 4
    254a:	07e8      	br      	0x251a	// 251a <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00001000;							//ADC3 PA0.3
    254c:	9200      	ld.w      	r0, (r2, 0x0)
    254e:	37f0      	movi      	r7, 240
    2550:	9040      	ld.w      	r2, (r0, 0x0)
    2552:	47e8      	lsli      	r7, r7, 8
    2554:	689d      	andn      	r2, r7
    2556:	3aac      	bseti      	r2, 12
    2558:	07e1      	br      	0x251a	// 251a <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00100000;							//ADC4 PA0.5
    255a:	9200      	ld.w      	r0, (r2, 0x0)
    255c:	37f0      	movi      	r7, 240
    255e:	9040      	ld.w      	r2, (r0, 0x0)
    2560:	47f0      	lsli      	r7, r7, 16
    2562:	689d      	andn      	r2, r7
    2564:	3ab4      	bseti      	r2, 20
    2566:	07da      	br      	0x251a	// 251a <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x01000000;							//ADC5 PA0.6
    2568:	9200      	ld.w      	r0, (r2, 0x0)
    256a:	37f0      	movi      	r7, 240
    256c:	9040      	ld.w      	r2, (r0, 0x0)
    256e:	47f4      	lsli      	r7, r7, 20
    2570:	689d      	andn      	r2, r7
    2572:	3ab8      	bseti      	r2, 24
    2574:	07d3      	br      	0x251a	// 251a <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC6 PA0.7
    2576:	9200      	ld.w      	r0, (r2, 0x0)
    2578:	9040      	ld.w      	r2, (r0, 0x0)
    257a:	4244      	lsli      	r2, r2, 4
    257c:	4a44      	lsri      	r2, r2, 4
    257e:	3abc      	bseti      	r2, 28
    2580:	07cd      	br      	0x251a	// 251a <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC7 PB0.2
    2582:	9240      	ld.w      	r2, (r2, 0x0)
    2584:	9200      	ld.w      	r0, (r2, 0x0)
    2586:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    2588:	9201      	ld.w      	r0, (r2, 0x4)
    258a:	b201      	st.w      	r0, (r2, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000100;
    258c:	9400      	ld.w      	r0, (r4, 0x0)
    258e:	34f0      	movi      	r4, 240
    2590:	9040      	ld.w      	r2, (r0, 0x0)
    2592:	4484      	lsli      	r4, r4, 4
    2594:	6891      	andn      	r2, r4
    2596:	3aa8      	bseti      	r2, 8
    2598:	07ba      	br      	0x250c	// 250c <ADC12_ConversionChannel_Config+0x50>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC8 PB0.3
    259a:	9240      	ld.w      	r2, (r2, 0x0)
    259c:	9200      	ld.w      	r0, (r2, 0x0)
    259e:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    25a0:	9201      	ld.w      	r0, (r2, 0x4)
    25a2:	b201      	st.w      	r0, (r2, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)  | 0x00001000;
    25a4:	9400      	ld.w      	r0, (r4, 0x0)
    25a6:	34f0      	movi      	r4, 240
    25a8:	9040      	ld.w      	r2, (r0, 0x0)
    25aa:	4488      	lsli      	r4, r4, 8
    25ac:	6891      	andn      	r2, r4
    25ae:	3aac      	bseti      	r2, 12
    25b0:	07ae      	br      	0x250c	// 250c <ADC12_ConversionChannel_Config+0x50>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC9 PA0.8
    25b2:	9200      	ld.w      	r0, (r2, 0x0)
    25b4:	9040      	ld.w      	r2, (r0, 0x0)
    25b6:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)  | 0x00000001;	
    25b8:	9041      	ld.w      	r2, (r0, 0x4)
    25ba:	370f      	movi      	r7, 15
    25bc:	689d      	andn      	r2, r7
    25be:	3aa0      	bseti      	r2, 0
    25c0:	07af      	br      	0x251e	// 251e <ADC12_ConversionChannel_Config+0x62>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC10 PA0.9
    25c2:	9200      	ld.w      	r0, (r2, 0x0)
    25c4:	9040      	ld.w      	r2, (r0, 0x0)
    25c6:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F)  | 0x00000010;	
    25c8:	9041      	ld.w      	r2, (r0, 0x4)
    25ca:	37f0      	movi      	r7, 240
    25cc:	689d      	andn      	r2, r7
    25ce:	3aa4      	bseti      	r2, 4
    25d0:	07a7      	br      	0x251e	// 251e <ADC12_ConversionChannel_Config+0x62>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC11 PA0.10
    25d2:	9200      	ld.w      	r0, (r2, 0x0)
    25d4:	9040      	ld.w      	r2, (r0, 0x0)
    25d6:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000100;	
    25d8:	37f0      	movi      	r7, 240
    25da:	9041      	ld.w      	r2, (r0, 0x4)
    25dc:	47e4      	lsli      	r7, r7, 4
    25de:	689d      	andn      	r2, r7
    25e0:	3aa8      	bseti      	r2, 8
    25e2:	079e      	br      	0x251e	// 251e <ADC12_ConversionChannel_Config+0x62>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC12 PA0.11
    25e4:	9200      	ld.w      	r0, (r2, 0x0)
    25e6:	9040      	ld.w      	r2, (r0, 0x0)
    25e8:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00001000;	
    25ea:	37f0      	movi      	r7, 240
    25ec:	9041      	ld.w      	r2, (r0, 0x4)
    25ee:	47e8      	lsli      	r7, r7, 8
    25f0:	689d      	andn      	r2, r7
    25f2:	3aac      	bseti      	r2, 12
    25f4:	0795      	br      	0x251e	// 251e <ADC12_ConversionChannel_Config+0x62>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC13 PA0.12
    25f6:	9200      	ld.w      	r0, (r2, 0x0)
    25f8:	9040      	ld.w      	r2, (r0, 0x0)
    25fa:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00010000;	
    25fc:	37f0      	movi      	r7, 240
    25fe:	9041      	ld.w      	r2, (r0, 0x4)
    2600:	47ec      	lsli      	r7, r7, 12
    2602:	689d      	andn      	r2, r7
    2604:	3ab0      	bseti      	r2, 16
    2606:	078c      	br      	0x251e	// 251e <ADC12_ConversionChannel_Config+0x62>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC14 PA0.13	
    2608:	9200      	ld.w      	r0, (r2, 0x0)
    260a:	9040      	ld.w      	r2, (r0, 0x0)
    260c:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00100000;	
    260e:	37f0      	movi      	r7, 240
    2610:	9041      	ld.w      	r2, (r0, 0x4)
    2612:	47f0      	lsli      	r7, r7, 16
    2614:	689d      	andn      	r2, r7
    2616:	3ab4      	bseti      	r2, 20
    2618:	0783      	br      	0x251e	// 251e <ADC12_ConversionChannel_Config+0x62>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC15 PB0.0
    261a:	9240      	ld.w      	r2, (r2, 0x0)
    261c:	9200      	ld.w      	r0, (r2, 0x0)
    261e:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    2620:	9201      	ld.w      	r0, (r2, 0x4)
    2622:	b201      	st.w      	r0, (r2, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000001;		
    2624:	9400      	ld.w      	r0, (r4, 0x0)
    2626:	9040      	ld.w      	r2, (r0, 0x0)
    2628:	340f      	movi      	r4, 15
    262a:	6891      	andn      	r2, r4
    262c:	3aa0      	bseti      	r2, 0
    262e:	076f      	br      	0x250c	// 250c <ADC12_ConversionChannel_Config+0x50>
    2630:	20000050 	.long	0x20000050
    2634:	2000004c 	.long	0x2000004c
    2638:	20000048 	.long	0x20000048

Disassembly of section .text.BT_DeInit:

0000263c <BT_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void BT_DeInit(CSP_BT_T *BTx)
{
	BTx->RSSR=BT_RESET_VALUE;
    263c:	3300      	movi      	r3, 0
    263e:	b060      	st.w      	r3, (r0, 0x0)
	BTx->CR=BT_RESET_VALUE;
    2640:	b061      	st.w      	r3, (r0, 0x4)
	BTx->PSCR=BT_RESET_VALUE;
    2642:	b062      	st.w      	r3, (r0, 0x8)
	BTx->PRDR=BT_RESET_VALUE;
    2644:	b063      	st.w      	r3, (r0, 0xc)
	BTx->CMP=BT_RESET_VALUE;
    2646:	b064      	st.w      	r3, (r0, 0x10)
	BTx->CNT=BT_RESET_VALUE;
    2648:	b065      	st.w      	r3, (r0, 0x14)
	BTx->EVTRG=BT_RESET_VALUE;
    264a:	b066      	st.w      	r3, (r0, 0x18)
	BTx->EVSWF=BT_RESET_VALUE;
    264c:	b069      	st.w      	r3, (r0, 0x24)
	BTx->RISR=BT_RESET_VALUE;
    264e:	b06a      	st.w      	r3, (r0, 0x28)
	BTx->IMCR=BT_RESET_VALUE;
    2650:	b06b      	st.w      	r3, (r0, 0x2c)
	BTx->MISR=BT_RESET_VALUE;
    2652:	b06c      	st.w      	r3, (r0, 0x30)
	BTx->ICR=BT_RESET_VALUE;
    2654:	b06d      	st.w      	r3, (r0, 0x34)
}
    2656:	783c      	jmp      	r15

Disassembly of section .text.BT_Start:

00002658 <BT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Start(CSP_BT_T *BTx)
{
	BTx->RSSR |=0X01;
    2658:	9060      	ld.w      	r3, (r0, 0x0)
    265a:	3ba0      	bseti      	r3, 0
    265c:	b060      	st.w      	r3, (r0, 0x0)
}
    265e:	783c      	jmp      	r15

Disassembly of section .text.BT_Soft_Reset:

00002660 <BT_Soft_Reset>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Soft_Reset(CSP_BT_T *BTx)
{
	BTx->RSSR |= (0X5<<12);
    2660:	9060      	ld.w      	r3, (r0, 0x0)
    2662:	3bac      	bseti      	r3, 12
    2664:	3bae      	bseti      	r3, 14
    2666:	b060      	st.w      	r3, (r0, 0x0)
}
    2668:	783c      	jmp      	r15

Disassembly of section .text.BT_Configure:

0000266a <BT_Configure>:
//BT Configure
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Configure(CSP_BT_T *BTx,BT_CLK_TypeDef BTCLK,U16_T PSCR_DATA,BT_SHDWSTP_TypeDef BTSHDWSTP,BT_OPM_TypeDef BTOPM,BT_EXTCKM_TypeDef BTEXTCKM)
{
    266a:	14c3      	push      	r4-r6
    266c:	98a4      	ld.w      	r5, (r14, 0x10)
    266e:	6d97      	mov      	r6, r5
    2670:	9883      	ld.w      	r4, (r14, 0xc)
	BTx->CR |=BTCLK| BTSHDWSTP| BTOPM| BTEXTCKM;
    2672:	6d18      	or      	r4, r6
    2674:	6cd0      	or      	r3, r4
    2676:	90a1      	ld.w      	r5, (r0, 0x4)
    2678:	6c4c      	or      	r1, r3
    267a:	6c54      	or      	r1, r5
    267c:	b021      	st.w      	r1, (r0, 0x4)
	BTx->PSCR = PSCR_DATA;
    267e:	b042      	st.w      	r2, (r0, 0x8)
}
    2680:	1483      	pop      	r4-r6

Disassembly of section .text.BT_ControlSet_Configure:

00002682 <BT_ControlSet_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_ControlSet_Configure(CSP_BT_T *BTx,BT_STARTST_TypeDef BTSTART,BT_IDLEST_TypeDef BTIDLE,BT_SYNCEN_TypeDef BTSYNC,BT_SYNCMD_TypeDef BTSYNCMD,
							BT_OSTMDX_TypeDef BTOSTMD,BT_AREARM_TypeDef BTAREARM,BT_CNTRLD_TypeDef BTCNTRLD)
{
    2682:	14c4      	push      	r4-r7
    2684:	1421      	subi      	r14, r14, 4
    2686:	9885      	ld.w      	r4, (r14, 0x14)
    2688:	6dd3      	mov      	r7, r4
    268a:	9886      	ld.w      	r4, (r14, 0x18)
    268c:	b880      	st.w      	r4, (r14, 0x0)
    268e:	9887      	ld.w      	r4, (r14, 0x1c)
    2690:	6d93      	mov      	r6, r4
    2692:	98a8      	ld.w      	r5, (r14, 0x20)
	BTx->CR |=BTSTART| BTIDLE| BTSYNC| BTSYNCMD| BTOSTMD| BTAREARM| BTCNTRLD;
    2694:	6d58      	or      	r5, r6
    2696:	98c0      	ld.w      	r6, (r14, 0x0)
    2698:	6d58      	or      	r5, r6
    269a:	6d5c      	or      	r5, r7
    269c:	6cd4      	or      	r3, r5
    269e:	6c8c      	or      	r2, r3
    26a0:	9081      	ld.w      	r4, (r0, 0x4)
    26a2:	6c48      	or      	r1, r2
    26a4:	6d04      	or      	r4, r1
    26a6:	6d9f      	mov      	r6, r7
    26a8:	b081      	st.w      	r4, (r0, 0x4)
}
    26aa:	1401      	addi      	r14, r14, 4
    26ac:	1484      	pop      	r4-r7

Disassembly of section .text.BT_Period_CMP_Write:

000026ae <BT_Period_CMP_Write>:
//ReturnValue:NONE
/*************************************************************/
void BT_Period_CMP_Write(CSP_BT_T *BTx,U16_T BTPRDR_DATA,U16_T BTCMP_DATA)
{
	//BTx->CR|=0X01<<2;
	BTx->PRDR =BTPRDR_DATA;
    26ae:	b023      	st.w      	r1, (r0, 0xc)
	BTx->CMP =BTCMP_DATA;
    26b0:	b044      	st.w      	r2, (r0, 0x10)
}
    26b2:	783c      	jmp      	r15

Disassembly of section .text.BT_ConfigInterrupt_CMD:

000026b4 <BT_ConfigInterrupt_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void BT_ConfigInterrupt_CMD(CSP_BT_T *BTx,FunctionalStatus NewState,BT_IMSCR_TypeDef BT_IMSCR_X)
{
	if (NewState != DISABLE)
    26b4:	3940      	cmpnei      	r1, 0
	{
		BTx->IMCR  |= BT_IMSCR_X;						
    26b6:	906b      	ld.w      	r3, (r0, 0x2c)
	if (NewState != DISABLE)
    26b8:	0c04      	bf      	0x26c0	// 26c0 <BT_ConfigInterrupt_CMD+0xc>
		BTx->IMCR  |= BT_IMSCR_X;						
    26ba:	6c8c      	or      	r2, r3
    26bc:	b04b      	st.w      	r2, (r0, 0x2c)
	}
	else
	{
		BTx->IMCR  &= ~BT_IMSCR_X;					
	}
}
    26be:	783c      	jmp      	r15
		BTx->IMCR  &= ~BT_IMSCR_X;					
    26c0:	68c9      	andn      	r3, r2
    26c2:	b06b      	st.w      	r3, (r0, 0x2c)
}
    26c4:	07fd      	br      	0x26be	// 26be <BT_ConfigInterrupt_CMD+0xa>

Disassembly of section .text.BT0_INT_ENABLE:

000026c8 <BT0_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT0_INT);
    26c8:	3380      	movi      	r3, 128
    26ca:	4375      	lsli      	r3, r3, 21
    26cc:	1042      	lrw      	r2, 0xe000e100	// 26d4 <BT0_INT_ENABLE+0xc>
    26ce:	b260      	st.w      	r3, (r2, 0x0)
}
    26d0:	783c      	jmp      	r15
    26d2:	0000      	bkpt
    26d4:	e000e100 	.long	0xe000e100

Disassembly of section .text.CORET_DeInit:

000026d8 <CORET_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void CORET_DeInit(void)
{
	CK801->CORET_CSR=CORET_CSR_RST;
    26d8:	1065      	lrw      	r3, 0x20000064	// 26ec <CORET_DeInit+0x14>
    26da:	3204      	movi      	r2, 4
    26dc:	9360      	ld.w      	r3, (r3, 0x0)
    26de:	b344      	st.w      	r2, (r3, 0x10)
	CK801->CORET_RVR=CORET_RVR_RST;
    26e0:	3200      	movi      	r2, 0
    26e2:	b345      	st.w      	r2, (r3, 0x14)
	CK801->CORET_CVR=CORET_CVR_RST;
    26e4:	b346      	st.w      	r2, (r3, 0x18)
	CK801->CORET_CALIB=CORET_CALIB_RST;
    26e6:	b347      	st.w      	r2, (r3, 0x1c)
}
    26e8:	783c      	jmp      	r15
    26ea:	0000      	bkpt
    26ec:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_Int_Enable:

000026f0 <CORET_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_Int_Enable(void)
{
    CK801->CORET_CVR = 0x0;							// Clear counter and flag
    26f0:	1064      	lrw      	r3, 0x20000064	// 2700 <CORET_Int_Enable+0x10>
    26f2:	3200      	movi      	r2, 0
    26f4:	9360      	ld.w      	r3, (r3, 0x0)
    26f6:	b346      	st.w      	r2, (r3, 0x18)
	INTC_ISER_WRITE(CORET_INT);    
    26f8:	3201      	movi      	r2, 1
    26fa:	1063      	lrw      	r3, 0xe000e100	// 2704 <CORET_Int_Enable+0x14>
    26fc:	b340      	st.w      	r2, (r3, 0x0)
}
    26fe:	783c      	jmp      	r15
    2700:	20000064 	.long	0x20000064
    2704:	e000e100 	.long	0xe000e100

Disassembly of section .text.CORET_start:

00002708 <CORET_start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_start(void)
{
	CK801->CORET_CSR|=0x01;
    2708:	1063      	lrw      	r3, 0x20000064	// 2714 <CORET_start+0xc>
    270a:	9340      	ld.w      	r2, (r3, 0x0)
    270c:	9264      	ld.w      	r3, (r2, 0x10)
    270e:	3ba0      	bseti      	r3, 0
    2710:	b264      	st.w      	r3, (r2, 0x10)
}
    2712:	783c      	jmp      	r15
    2714:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_CLKSOURCE_EX:

00002718 <CORET_CLKSOURCE_EX>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_CLKSOURCE_EX(void)
{
	CK801->CORET_CSR&=0Xfffffffb;
    2718:	1063      	lrw      	r3, 0x20000064	// 2724 <CORET_CLKSOURCE_EX+0xc>
    271a:	9340      	ld.w      	r2, (r3, 0x0)
    271c:	9264      	ld.w      	r3, (r2, 0x10)
    271e:	3b82      	bclri      	r3, 2
    2720:	b264      	st.w      	r3, (r2, 0x10)
}
    2722:	783c      	jmp      	r15
    2724:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_TICKINT_Enable:

00002728 <CORET_TICKINT_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_TICKINT_Enable(void)
{
    CK801->CORET_CSR|=0x02;
    2728:	1063      	lrw      	r3, 0x20000064	// 2734 <CORET_TICKINT_Enable+0xc>
    272a:	9340      	ld.w      	r2, (r3, 0x0)
    272c:	9264      	ld.w      	r3, (r2, 0x10)
    272e:	3ba1      	bseti      	r3, 1
    2730:	b264      	st.w      	r3, (r2, 0x10)
}
    2732:	783c      	jmp      	r15
    2734:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_reload:

00002738 <CORET_reload>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_reload(void)
{
	CK801->CORET_CVR = 0x0;							// Clear counter and flag
    2738:	1063      	lrw      	r3, 0x20000064	// 2744 <CORET_reload+0xc>
    273a:	3200      	movi      	r2, 0
    273c:	9360      	ld.w      	r3, (r3, 0x0)
    273e:	b346      	st.w      	r2, (r3, 0x18)
}
    2740:	783c      	jmp      	r15
    2742:	0000      	bkpt
    2744:	20000064 	.long	0x20000064

Disassembly of section .text.GPIO_Init:

00002748 <GPIO_Init>:
//byte:Lowbyte(PIN_0~7),Highbyte(PIN_8~15)
//Dir:0:output 1:input
//ReturnValue:NONE
/*************************************************************/  
void GPIO_Init(CSP_GPIO_T *GPIOx,uint8_t PinNum,GPIO_Dir_TypeDef Dir)
{
    2748:	14d1      	push      	r4, r15
    uint32_t data_temp;
    uint8_t GPIO_Pin;
    if(PinNum<8)
    274a:	3907      	cmphsi      	r1, 8
{
    274c:	6d03      	mov      	r4, r0
    if(PinNum<8)
    274e:	0830      	bt      	0x27ae	// 27ae <GPIO_Init+0x66>
    {
    switch (PinNum)
    2750:	5903      	subi      	r0, r1, 1
    2752:	3806      	cmphsi      	r0, 7
    2754:	0827      	bt      	0x27a2	// 27a2 <GPIO_Init+0x5a>
    2756:	e3fff2d3 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    275a:	1004      	.short	0x1004
    275c:	1d1a1613 	.long	0x1d1a1613
    2760:	0021      	.short	0x0021
    {
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
        case 1:data_temp=0xffffff0f;GPIO_Pin=4;break;
    2762:	3300      	movi      	r3, 0
    2764:	3104      	movi      	r1, 4
    2766:	2bf0      	subi      	r3, 241
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    }
        if (Dir)
    2768:	3a40      	cmpnei      	r2, 0
        {
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
    276a:	9440      	ld.w      	r2, (r4, 0x0)
    276c:	68c8      	and      	r3, r2
        if (Dir)
    276e:	0c1e      	bf      	0x27aa	// 27aa <GPIO_Init+0x62>
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
    2770:	3201      	movi      	r2, 1
        }
        else
        {
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
    2772:	7084      	lsl      	r2, r1
    2774:	6cc8      	or      	r3, r2
    2776:	b460      	st.w      	r3, (r4, 0x0)
        else
        {
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
        }
    }
}
    2778:	1491      	pop      	r4, r15
        case 2:data_temp=0xfffff0ff;GPIO_Pin=8;break;
    277a:	3108      	movi      	r1, 8
    277c:	1166      	lrw      	r3, 0xfffff0ff	// 2814 <GPIO_Init+0xcc>
    277e:	07f5      	br      	0x2768	// 2768 <GPIO_Init+0x20>
        case 3:data_temp=0xffff0fff;GPIO_Pin=12;break;
    2780:	310c      	movi      	r1, 12
    2782:	1166      	lrw      	r3, 0xffff0fff	// 2818 <GPIO_Init+0xd0>
    2784:	07f2      	br      	0x2768	// 2768 <GPIO_Init+0x20>
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
    2786:	3110      	movi      	r1, 16
    2788:	1165      	lrw      	r3, 0xfff10000	// 281c <GPIO_Init+0xd4>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    278a:	2b00      	subi      	r3, 1
    278c:	07ee      	br      	0x2768	// 2768 <GPIO_Init+0x20>
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
    278e:	3114      	movi      	r1, 20
    2790:	1164      	lrw      	r3, 0xff100000	// 2820 <GPIO_Init+0xd8>
    2792:	07fc      	br      	0x278a	// 278a <GPIO_Init+0x42>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    2794:	33f1      	movi      	r3, 241
    2796:	3118      	movi      	r1, 24
    2798:	4378      	lsli      	r3, r3, 24
    279a:	07f8      	br      	0x278a	// 278a <GPIO_Init+0x42>
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    279c:	311c      	movi      	r1, 28
    279e:	1162      	lrw      	r3, 0xfffffff	// 2824 <GPIO_Init+0xdc>
    27a0:	07e4      	br      	0x2768	// 2768 <GPIO_Init+0x20>
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
    27a2:	3300      	movi      	r3, 0
    27a4:	3100      	movi      	r1, 0
    27a6:	2b0f      	subi      	r3, 16
    27a8:	07e0      	br      	0x2768	// 2768 <GPIO_Init+0x20>
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
    27aa:	3202      	movi      	r2, 2
    27ac:	07e3      	br      	0x2772	// 2772 <GPIO_Init+0x2a>
    else if (PinNum<16)
    27ae:	390f      	cmphsi      	r1, 16
    27b0:	0be4      	bt      	0x2778	// 2778 <GPIO_Init+0x30>
        switch (PinNum)
    27b2:	2908      	subi      	r1, 9
    27b4:	3906      	cmphsi      	r1, 7
    27b6:	6c07      	mov      	r0, r1
    27b8:	0827      	bt      	0x2806	// 2806 <GPIO_Init+0xbe>
    27ba:	e3fff2a1 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    27be:	1004      	.short	0x1004
    27c0:	1d1a1613 	.long	0x1d1a1613
    27c4:	0021      	.short	0x0021
        case 9:data_temp=0xffffff0f;GPIO_Pin=4;break;
    27c6:	3300      	movi      	r3, 0
    27c8:	3104      	movi      	r1, 4
    27ca:	2bf0      	subi      	r3, 241
      if (Dir)
    27cc:	3a40      	cmpnei      	r2, 0
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
    27ce:	9441      	ld.w      	r2, (r4, 0x4)
    27d0:	68c8      	and      	r3, r2
      if (Dir)
    27d2:	0c1e      	bf      	0x280e	// 280e <GPIO_Init+0xc6>
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
    27d4:	3201      	movi      	r2, 1
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
    27d6:	7084      	lsl      	r2, r1
    27d8:	6cc8      	or      	r3, r2
    27da:	b461      	st.w      	r3, (r4, 0x4)
}
    27dc:	07ce      	br      	0x2778	// 2778 <GPIO_Init+0x30>
        case 10:data_temp=0xfffff0ff;GPIO_Pin=8;break;
    27de:	3108      	movi      	r1, 8
    27e0:	106d      	lrw      	r3, 0xfffff0ff	// 2814 <GPIO_Init+0xcc>
    27e2:	07f5      	br      	0x27cc	// 27cc <GPIO_Init+0x84>
        case 11:data_temp=0xffff0fff;GPIO_Pin=12;break;
    27e4:	310c      	movi      	r1, 12
    27e6:	106d      	lrw      	r3, 0xffff0fff	// 2818 <GPIO_Init+0xd0>
    27e8:	07f2      	br      	0x27cc	// 27cc <GPIO_Init+0x84>
        case 12:data_temp=0xfff0ffff;GPIO_Pin=16;break;
    27ea:	3110      	movi      	r1, 16
    27ec:	106c      	lrw      	r3, 0xfff10000	// 281c <GPIO_Init+0xd4>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    27ee:	2b00      	subi      	r3, 1
    27f0:	07ee      	br      	0x27cc	// 27cc <GPIO_Init+0x84>
        case 13:data_temp=0xff0fffff;GPIO_Pin=20;break;
    27f2:	3114      	movi      	r1, 20
    27f4:	106b      	lrw      	r3, 0xff100000	// 2820 <GPIO_Init+0xd8>
    27f6:	07fc      	br      	0x27ee	// 27ee <GPIO_Init+0xa6>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    27f8:	33f1      	movi      	r3, 241
    27fa:	3118      	movi      	r1, 24
    27fc:	4378      	lsli      	r3, r3, 24
    27fe:	07f8      	br      	0x27ee	// 27ee <GPIO_Init+0xa6>
        case 15:data_temp=0x0fffffff;GPIO_Pin=28;break;
    2800:	311c      	movi      	r1, 28
    2802:	1069      	lrw      	r3, 0xfffffff	// 2824 <GPIO_Init+0xdc>
    2804:	07e4      	br      	0x27cc	// 27cc <GPIO_Init+0x84>
        case 8:data_temp=0xfffffff0;GPIO_Pin=0;break;
    2806:	3300      	movi      	r3, 0
    2808:	3100      	movi      	r1, 0
    280a:	2b0f      	subi      	r3, 16
    280c:	07e0      	br      	0x27cc	// 27cc <GPIO_Init+0x84>
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
    280e:	3202      	movi      	r2, 2
    2810:	07e3      	br      	0x27d6	// 27d6 <GPIO_Init+0x8e>
    2812:	0000      	bkpt
    2814:	fffff0ff 	.long	0xfffff0ff
    2818:	ffff0fff 	.long	0xffff0fff
    281c:	fff10000 	.long	0xfff10000
    2820:	ff100000 	.long	0xff100000
    2824:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.GPIO_Write_High:

00002828 <GPIO_Write_High>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Write_High(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->SODR = (1ul<<bit);
    2828:	3301      	movi      	r3, 1
    282a:	70c4      	lsl      	r3, r1
    282c:	b063      	st.w      	r3, (r0, 0xc)
}
    282e:	783c      	jmp      	r15

Disassembly of section .text.GPIO_Write_Low:

00002830 <GPIO_Write_Low>:
void GPIO_Write_Low(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->CODR = (1ul<<bit);
    2830:	3301      	movi      	r3, 1
    2832:	70c4      	lsl      	r3, r1
    2834:	b064      	st.w      	r3, (r0, 0x10)
}
    2836:	783c      	jmp      	r15

Disassembly of section .text.Page_ProgramData:

00002838 <Page_ProgramData>:
		IFC->CR=0X01;					//Start Program
	}
}
//Normal mode, when the call is completed once, it will delay 4.2ms in the program
void Page_ProgramData(unsigned int FlashAdd,unsigned int DataSize,volatile unsigned char *BufArry)
{
    2838:	14c4      	push      	r4-r7
    283a:	1422      	subi      	r14, r14, 8
	int i,DataBuffer;

	//Page cache wipe 1
	SetUserKey;
    283c:	1165      	lrw      	r3, 0x20000060	// 28d0 <Page_ProgramData+0x98>
    283e:	1186      	lrw      	r4, 0x5a5a5a5a	// 28d4 <Page_ProgramData+0x9c>
    2840:	9360      	ld.w      	r3, (r3, 0x0)
    2842:	b388      	st.w      	r4, (r3, 0x20)
	IFC->CMR=0x07;					
    2844:	3407      	movi      	r4, 7
    2846:	b383      	st.w      	r4, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;
	IFC->CR=0X01;					//Start Program
    2848:	3401      	movi      	r4, 1
	IFC->FM_ADDR=FlashAdd;
    284a:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
    284c:	b384      	st.w      	r4, (r3, 0x10)
	while(IFC->CR!=0x0);			//Wait for the operation to complete
    284e:	9384      	ld.w      	r4, (r3, 0x10)
    2850:	3c40      	cmpnei      	r4, 0
    2852:	0bfe      	bt      	0x284e	// 284e <Page_ProgramData+0x16>
	//Write data to the cache 2
	for(i=0;i<((DataSize+3)/4);i++)   //sizeof structure
    2854:	2102      	addi      	r1, 3
    2856:	4922      	lsri      	r1, r1, 2
    2858:	4122      	lsli      	r1, r1, 2
    285a:	6048      	addu      	r1, r2
    285c:	b820      	st.w      	r1, (r14, 0x0)
    285e:	5829      	subu      	r1, r0, r2
    2860:	b821      	st.w      	r1, (r14, 0x4)
    2862:	9820      	ld.w      	r1, (r14, 0x0)
    2864:	644a      	cmpne      	r2, r1
    2866:	0826      	bt      	0x28b2	// 28b2 <Page_ProgramData+0x7a>
		*(volatile unsigned int *)(FlashAdd+4*i)=DataBuffer;
		BufArry  +=4;
	}
	//Pre-programmed operation settings 3
	SetUserKey;
	IFC->CMR=0x06;					
    2868:	3106      	movi      	r1, 6
	SetUserKey;
    286a:	105b      	lrw      	r2, 0x5a5a5a5a	// 28d4 <Page_ProgramData+0x9c>
    286c:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x06;					
    286e:	b323      	st.w      	r1, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;
	IFC->CR=0X01;					//Start Program
    2870:	3101      	movi      	r1, 1
	IFC->FM_ADDR=FlashAdd;
    2872:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
    2874:	b324      	st.w      	r1, (r3, 0x10)
	while(IFC->CR!=0x0);			//Wait for the operation to complete
    2876:	9324      	ld.w      	r1, (r3, 0x10)
    2878:	3940      	cmpnei      	r1, 0
    287a:	0bfe      	bt      	0x2876	// 2876 <Page_ProgramData+0x3e>
	//Perform pre-programming 4
	SetUserKey;
    287c:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x01;					
    287e:	3201      	movi      	r2, 1
    2880:	b343      	st.w      	r2, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;			//
    2882:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
    2884:	b344      	st.w      	r2, (r3, 0x10)
	while(IFC->RISR!=PEP_END_INT);			//Wait for the operation to complete
    2886:	934a      	ld.w      	r2, (r3, 0x28)
    2888:	3a44      	cmpnei      	r2, 4
    288a:	0bfe      	bt      	0x2886	// 2886 <Page_ProgramData+0x4e>
	//Page erase 5
	SetUserKey;
	IFC->CMR=0x02;					
    288c:	3102      	movi      	r1, 2
	SetUserKey;
    288e:	1052      	lrw      	r2, 0x5a5a5a5a	// 28d4 <Page_ProgramData+0x9c>
    2890:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x02;					
    2892:	b323      	st.w      	r1, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;			//
	IFC->CR=0X01;					//Start Program
    2894:	3101      	movi      	r1, 1
	IFC->FM_ADDR=FlashAdd;			//
    2896:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
    2898:	b324      	st.w      	r1, (r3, 0x10)
	while(IFC->RISR!=ERS_END_INT);			//Wait for the operation to complete
    289a:	932a      	ld.w      	r1, (r3, 0x28)
    289c:	3941      	cmpnei      	r1, 1
    289e:	0bfe      	bt      	0x289a	// 289a <Page_ProgramData+0x62>
	//Write page cache data to flash memory 6
	SetUserKey;
    28a0:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x01;					
    28a2:	b323      	st.w      	r1, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;		//
    28a4:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
    28a6:	b324      	st.w      	r1, (r3, 0x10)
	while(IFC->RISR!=RGM_END_INT);			//Wait for the operation to complete
    28a8:	934a      	ld.w      	r2, (r3, 0x28)
    28aa:	3a42      	cmpnei      	r2, 2
    28ac:	0bfe      	bt      	0x28a8	// 28a8 <Page_ProgramData+0x70>
}
    28ae:	1402      	addi      	r14, r14, 8
    28b0:	1484      	pop      	r4-r7
		DataBuffer=*BufArry+(*(BufArry+1)<<8)+(*(BufArry+2)<<16)+(*(BufArry+3)<<24);
    28b2:	82e0      	ld.b      	r7, (r2, 0x0)
    28b4:	8281      	ld.b      	r4, (r2, 0x1)
    28b6:	4488      	lsli      	r4, r4, 8
    28b8:	8222      	ld.b      	r1, (r2, 0x2)
    28ba:	611c      	addu      	r4, r7
    28bc:	82a3      	ld.b      	r5, (r2, 0x3)
    28be:	4130      	lsli      	r1, r1, 16
    28c0:	98c1      	ld.w      	r6, (r14, 0x4)
    28c2:	6050      	addu      	r1, r4
    28c4:	45b8      	lsli      	r5, r5, 24
    28c6:	6188      	addu      	r6, r2
    28c8:	6054      	addu      	r1, r5
		*(volatile unsigned int *)(FlashAdd+4*i)=DataBuffer;
    28ca:	b620      	st.w      	r1, (r6, 0x0)
		BufArry  +=4;
    28cc:	2203      	addi      	r2, 4
    28ce:	07ca      	br      	0x2862	// 2862 <Page_ProgramData+0x2a>
    28d0:	20000060 	.long	0x20000060
    28d4:	5a5a5a5a 	.long	0x5a5a5a5a

Disassembly of section .text.ReadDataArry:

000028d8 <ReadDataArry>:
// DataLength must be a multiple of 4, DataLength % 4 ==0.
//EntryParameter:RdStartAdd、DataLength、*DataArryPoint
//ReturnValue:NONE
*************************************************************/
void ReadDataArry(unsigned int RdStartAdd,unsigned int DataLength,volatile unsigned char *DataArryPoint)
{
    28d8:	14c1      	push      	r4
	unsigned int i,Buffer;
	//delay_nms(1);
	for(i=0;i<((DataLength+3)/4);i++)
    28da:	2102      	addi      	r1, 3
    28dc:	4922      	lsri      	r1, r1, 2
    28de:	4122      	lsli      	r1, r1, 2
    28e0:	6048      	addu      	r1, r2
    28e2:	600a      	subu      	r0, r2
    28e4:	644a      	cmpne      	r2, r1
    28e6:	0802      	bt      	0x28ea	// 28ea <ReadDataArry+0x12>
		*(DataArryPoint+2)=Buffer>>16;
		*(DataArryPoint+3)=Buffer>>24;
		RdStartAdd +=4;
		DataArryPoint +=4;
	}
}
    28e8:	1481      	pop      	r4
    28ea:	5a60      	addu      	r3, r2, r0
		Buffer=*(volatile unsigned int *)RdStartAdd;
    28ec:	9360      	ld.w      	r3, (r3, 0x0)
		*DataArryPoint=Buffer;
    28ee:	750c      	zextb      	r4, r3
    28f0:	a280      	st.b      	r4, (r2, 0x0)
		*(DataArryPoint+1)=Buffer>>8;
    28f2:	4b88      	lsri      	r4, r3, 8
    28f4:	7510      	zextb      	r4, r4
    28f6:	a281      	st.b      	r4, (r2, 0x1)
		*(DataArryPoint+2)=Buffer>>16;
    28f8:	4b90      	lsri      	r4, r3, 16
    28fa:	7510      	zextb      	r4, r4
		*(DataArryPoint+3)=Buffer>>24;
    28fc:	4b78      	lsri      	r3, r3, 24
		*(DataArryPoint+2)=Buffer>>16;
    28fe:	a282      	st.b      	r4, (r2, 0x2)
		*(DataArryPoint+3)=Buffer>>24;
    2900:	a263      	st.b      	r3, (r2, 0x3)
		DataArryPoint +=4;
    2902:	2203      	addi      	r2, 4
    2904:	07f0      	br      	0x28e4	// 28e4 <ReadDataArry+0xc>

Disassembly of section .text.LPT_Soft_Reset:

00002908 <LPT_Soft_Reset>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void LPT_Soft_Reset(void)
{
	LPT->RSSR |= (0X5<<12);
    2908:	1064      	lrw      	r3, 0x20000014	// 2918 <LPT_Soft_Reset+0x10>
    290a:	9340      	ld.w      	r2, (r3, 0x0)
    290c:	9261      	ld.w      	r3, (r2, 0x4)
    290e:	3bac      	bseti      	r3, 12
    2910:	3bae      	bseti      	r3, 14
    2912:	b261      	st.w      	r3, (r2, 0x4)
}
    2914:	783c      	jmp      	r15
    2916:	0000      	bkpt
    2918:	20000014 	.long	0x20000014

Disassembly of section .text.SPI_DeInit:

0000291c <SPI_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SPI_DeInit(void)
{
    SPI0->CR0   	= SPI_CR0_RST;
    291c:	1067      	lrw      	r3, 0x20000034	// 2938 <SPI_DeInit+0x1c>
    291e:	3200      	movi      	r2, 0
    2920:	9360      	ld.w      	r3, (r3, 0x0)
    SPI0->CR1   	= SPI_CR1_RST;
    //SPI0->DR   	 	= SPI_DR_RST;
    SPI0->SR   	 	= SPI_SR_RST;
    2922:	3103      	movi      	r1, 3
    SPI0->CR0   	= SPI_CR0_RST;
    2924:	b340      	st.w      	r2, (r3, 0x0)
    SPI0->CR1   	= SPI_CR1_RST;
    2926:	b341      	st.w      	r2, (r3, 0x4)
    SPI0->SR   	 	= SPI_SR_RST;
    2928:	b323      	st.w      	r1, (r3, 0xc)
    SPI0->CPSR   	= SPI_CPSR_RST;
    SPI0->IMSCR   	= SPI_IMSCR_RST;
    SPI0->RISR   	= SPI_RISR_RST;
    292a:	3108      	movi      	r1, 8
    SPI0->CPSR   	= SPI_CPSR_RST;
    292c:	b344      	st.w      	r2, (r3, 0x10)
    SPI0->IMSCR   	= SPI_IMSCR_RST;
    292e:	b345      	st.w      	r2, (r3, 0x14)
    SPI0->RISR   	= SPI_RISR_RST;
    2930:	b326      	st.w      	r1, (r3, 0x18)
    SPI0->MISR   	= SPI_MISR_RST;
    2932:	b347      	st.w      	r2, (r3, 0x1c)
    SPI0->ICR	 	= SPI_ICR_RST;
    2934:	b348      	st.w      	r2, (r3, 0x20)
}
    2936:	783c      	jmp      	r15
    2938:	20000034 	.long	0x20000034

Disassembly of section .text.SPI_NSS_IO_Init:

0000293c <SPI_NSS_IO_Init>:
//SPI NSS IO Initial
//ReturnValue:NONE
/*************************************************************/
void SPI_NSS_IO_Init(U8_T SPI_NSS_IO_GROUP)
{
	if(SPI_NSS_IO_GROUP==0)
    293c:	3840      	cmpnei      	r0, 0
    293e:	080b      	bt      	0x2954	// 2954 <SPI_NSS_IO_Init+0x18>
	{
		GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x05000000;				//PA0.6
    2940:	106a      	lrw      	r3, 0x2000004c	// 2968 <SPI_NSS_IO_Init+0x2c>
    2942:	32f0      	movi      	r2, 240
    2944:	9320      	ld.w      	r1, (r3, 0x0)
    2946:	9160      	ld.w      	r3, (r1, 0x0)
    2948:	4254      	lsli      	r2, r2, 20
    294a:	68c9      	andn      	r3, r2
    294c:	3bb8      	bseti      	r3, 24
    294e:	3bba      	bseti      	r3, 26
	}
	else if(SPI_NSS_IO_GROUP==1)
	{
		GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF)  | 0x00800000;				//PB0.5
    2950:	b160      	st.w      	r3, (r1, 0x0)
	}
}
    2952:	783c      	jmp      	r15
	else if(SPI_NSS_IO_GROUP==1)
    2954:	3841      	cmpnei      	r0, 1
    2956:	0bfe      	bt      	0x2952	// 2952 <SPI_NSS_IO_Init+0x16>
		GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF)  | 0x00800000;				//PB0.5
    2958:	1065      	lrw      	r3, 0x20000048	// 296c <SPI_NSS_IO_Init+0x30>
    295a:	32f0      	movi      	r2, 240
    295c:	9320      	ld.w      	r1, (r3, 0x0)
    295e:	9160      	ld.w      	r3, (r1, 0x0)
    2960:	4250      	lsli      	r2, r2, 16
    2962:	68c9      	andn      	r3, r2
    2964:	3bb7      	bseti      	r3, 23
    2966:	07f5      	br      	0x2950	// 2950 <SPI_NSS_IO_Init+0x14>
    2968:	2000004c 	.long	0x2000004c
    296c:	20000048 	.long	0x20000048

Disassembly of section .text.SPI_Master_Init:

00002970 <SPI_Master_Init>:
//ReturnValue:NONE
/*************************************************************/
//SPI Baud rate:FSSPCLK = FPCLK / (CPSDVR × (1 + SCR))
//FPCLK (max) → 2 × FSSPCLKOUT (max) master	Fastest speed
void SPI_Master_Init(SPI_IO_TypeDef SPI_IO , SPI_DATA_SIZE_TypeDef SPI_DATA_SIZE_x , SPI_SPO_TypeDef SPI_SPO_X , SPI_SPH_TypeDef SPI_SPH_X , SPI_LBM_TypeDef SPI_LBM_X , SPI_RXIFLSEL_TypeDef SPI_RXIFLSEL_X , U8_T SPI_SCR , U8_T SPI_CPSDVSR )
{
    2970:	14c4      	push      	r4-r7
    2972:	1422      	subi      	r14, r14, 8
    2974:	9886      	ld.w      	r4, (r14, 0x18)
    2976:	b880      	st.w      	r4, (r14, 0x0)
    2978:	9887      	ld.w      	r4, (r14, 0x1c)
    297a:	b881      	st.w      	r4, (r14, 0x4)
    297c:	1d09      	addi      	r5, r14, 36
    297e:	1c08      	addi      	r4, r14, 32
	if (SPI_IO==SPI_G0)
    2980:	3840      	cmpnei      	r0, 0
{
    2982:	8480      	ld.b      	r4, (r4, 0x0)
    2984:	85a0      	ld.b      	r5, (r5, 0x0)
	if (SPI_IO==SPI_G0)
    2986:	0827      	bt      	0x29d4	// 29d4 <SPI_Master_Init+0x64>
    {
		GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF00FF)  | 0x00008800;
    2988:	1101      	lrw      	r0, 0x20000048	// 2a0c <SPI_Master_Init+0x9c>
    298a:	36ff      	movi      	r6, 255
    298c:	90e0      	ld.w      	r7, (r0, 0x0)
    298e:	9700      	ld.w      	r0, (r7, 0x0)
    2990:	46c8      	lsli      	r6, r6, 8
    2992:	6819      	andn      	r0, r6
    2994:	38ab      	bseti      	r0, 11
    2996:	38af      	bseti      	r0, 15
    2998:	b700      	st.w      	r0, (r7, 0x0)
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)  | 0x00000008;            //PB0.2->SPI_SCK,PB0.3->SPI_MOSI,PA0.8->SPI_MIS0
    299a:	370f      	movi      	r7, 15
    299c:	101d      	lrw      	r0, 0x2000004c	// 2a10 <SPI_Master_Init+0xa0>
    299e:	90c0      	ld.w      	r6, (r0, 0x0)
    29a0:	9601      	ld.w      	r0, (r6, 0x4)
    29a2:	681d      	andn      	r0, r7
    29a4:	38a3      	bseti      	r0, 3
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF000F)  | 0x00004440;            //PA0.9->SPI_SCK,PA0.10->SPI_MOSI,PA0.11->SPI_MIS0
    }
	else if(SPI_IO==SPI_G2)
	{
		GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)  | 0x00080000;			//SPI_SCK->PB0.4
		GPIOA0->CONHR = (GPIOA0->CONHR&0X00FFFFFF)  | 0x88000000;			//SPI_MOSI->PA0.14,SPI_MISO->PA0.15
    29a6:	b601      	st.w      	r0, (r6, 0x4)
	}
	SPI0->CPSR=SPI_CPSDVSR;
    29a8:	101b      	lrw      	r0, 0x20000034	// 2a14 <SPI_Master_Init+0xa4>
	
	SPI0->CR0|=SPI_DATA_SIZE_x|(SPI_SPO_X<<6)|(SPI_SPH_X<<7)|(SPI_SCR<<8);
    29aa:	4367      	lsli      	r3, r3, 7
	SPI0->CPSR=SPI_CPSDVSR;
    29ac:	9000      	ld.w      	r0, (r0, 0x0)
    29ae:	b0a4      	st.w      	r5, (r0, 0x10)
	SPI0->CR0|=SPI_DATA_SIZE_x|(SPI_SPO_X<<6)|(SPI_SPH_X<<7)|(SPI_SCR<<8);
    29b0:	90a0      	ld.w      	r5, (r0, 0x0)
    29b2:	6c4c      	or      	r1, r3
    29b4:	6c54      	or      	r1, r5
    29b6:	4488      	lsli      	r4, r4, 8
    29b8:	6d04      	or      	r4, r1
    29ba:	4246      	lsli      	r2, r2, 6
    29bc:	6c90      	or      	r2, r4
    29be:	b040      	st.w      	r2, (r0, 0x0)
	SPI0->CR1|=0X02|SPI_LBM_X|(SPI_RXIFLSEL_X<<4);
    29c0:	9061      	ld.w      	r3, (r0, 0x4)
    29c2:	9840      	ld.w      	r2, (r14, 0x0)
    29c4:	3ba1      	bseti      	r3, 1
    29c6:	6cc8      	or      	r3, r2
    29c8:	9841      	ld.w      	r2, (r14, 0x4)
    29ca:	4244      	lsli      	r2, r2, 4
    29cc:	6cc8      	or      	r3, r2
    29ce:	b061      	st.w      	r3, (r0, 0x4)
}
    29d0:	1402      	addi      	r14, r14, 8
    29d2:	1484      	pop      	r4-r7
    else if(SPI_IO==SPI_G1)
    29d4:	3841      	cmpnei      	r0, 1
    29d6:	0809      	bt      	0x29e8	// 29e8 <SPI_Master_Init+0x78>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF000F)  | 0x00004440;            //PA0.9->SPI_SCK,PA0.10->SPI_MOSI,PA0.11->SPI_MIS0
    29d8:	100e      	lrw      	r0, 0x2000004c	// 2a10 <SPI_Master_Init+0xa0>
    29da:	10f0      	lrw      	r7, 0xfff0	// 2a18 <SPI_Master_Init+0xa8>
    29dc:	90c0      	ld.w      	r6, (r0, 0x0)
    29de:	9601      	ld.w      	r0, (r6, 0x4)
    29e0:	681d      	andn      	r0, r7
    29e2:	10ef      	lrw      	r7, 0x4440	// 2a1c <SPI_Master_Init+0xac>
    29e4:	6c1c      	or      	r0, r7
    29e6:	07e0      	br      	0x29a6	// 29a6 <SPI_Master_Init+0x36>
	else if(SPI_IO==SPI_G2)
    29e8:	3842      	cmpnei      	r0, 2
    29ea:	0bdf      	bt      	0x29a8	// 29a8 <SPI_Master_Init+0x38>
		GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)  | 0x00080000;			//SPI_SCK->PB0.4
    29ec:	1008      	lrw      	r0, 0x20000048	// 2a0c <SPI_Master_Init+0x9c>
    29ee:	36f0      	movi      	r6, 240
    29f0:	90e0      	ld.w      	r7, (r0, 0x0)
    29f2:	9700      	ld.w      	r0, (r7, 0x0)
    29f4:	46cc      	lsli      	r6, r6, 12
    29f6:	6819      	andn      	r0, r6
    29f8:	38b3      	bseti      	r0, 19
    29fa:	b700      	st.w      	r0, (r7, 0x0)
		GPIOA0->CONHR = (GPIOA0->CONHR&0X00FFFFFF)  | 0x88000000;			//SPI_MOSI->PA0.14,SPI_MISO->PA0.15
    29fc:	1005      	lrw      	r0, 0x2000004c	// 2a10 <SPI_Master_Init+0xa0>
    29fe:	90c0      	ld.w      	r6, (r0, 0x0)
    2a00:	9601      	ld.w      	r0, (r6, 0x4)
    2a02:	4008      	lsli      	r0, r0, 8
    2a04:	4808      	lsri      	r0, r0, 8
    2a06:	38bb      	bseti      	r0, 27
    2a08:	38bf      	bseti      	r0, 31
    2a0a:	07ce      	br      	0x29a6	// 29a6 <SPI_Master_Init+0x36>
    2a0c:	20000048 	.long	0x20000048
    2a10:	2000004c 	.long	0x2000004c
    2a14:	20000034 	.long	0x20000034
    2a18:	0000fff0 	.long	0x0000fff0
    2a1c:	00004440 	.long	0x00004440

Disassembly of section .text.SPI_ConfigInterrupt_CMD:

00002a20 <SPI_ConfigInterrupt_CMD>:
//SPI_IMSCR_X:SPI_PORIM,SPI_RTIM,SPI_RXIM,SPI_TXIM
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void SPI_ConfigInterrupt_CMD(FunctionalStatus NewState,SPI_IMSCR_TypeDef SPI_IMSCR_X)
{
    2a20:	1066      	lrw      	r3, 0x20000034	// 2a38 <SPI_ConfigInterrupt_CMD+0x18>
	if (NewState != DISABLE)
    2a22:	3840      	cmpnei      	r0, 0
	{
		SPI0->IMSCR  |= SPI_IMSCR_X;						//SET
    2a24:	9340      	ld.w      	r2, (r3, 0x0)
    2a26:	9265      	ld.w      	r3, (r2, 0x14)
	if (NewState != DISABLE)
    2a28:	0c04      	bf      	0x2a30	// 2a30 <SPI_ConfigInterrupt_CMD+0x10>
		SPI0->IMSCR  |= SPI_IMSCR_X;						//SET
    2a2a:	6c4c      	or      	r1, r3
    2a2c:	b225      	st.w      	r1, (r2, 0x14)
	}
	else
	{
		SPI0->IMSCR  &= ~SPI_IMSCR_X;					//CLR
	}
}   
    2a2e:	783c      	jmp      	r15
		SPI0->IMSCR  &= ~SPI_IMSCR_X;					//CLR
    2a30:	68c5      	andn      	r3, r1
    2a32:	b265      	st.w      	r3, (r2, 0x14)
}   
    2a34:	07fd      	br      	0x2a2e	// 2a2e <SPI_ConfigInterrupt_CMD+0xe>
    2a36:	0000      	bkpt
    2a38:	20000034 	.long	0x20000034

Disassembly of section .text.SPI_Int_Enable:

00002a3c <SPI_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SPI_Int_Enable(void)
{
    INTC_ISER_WRITE(SPI_INT);    
    2a3c:	3380      	movi      	r3, 128
    2a3e:	436c      	lsli      	r3, r3, 12
    2a40:	1042      	lrw      	r2, 0xe000e100	// 2a48 <SPI_Int_Enable+0xc>
    2a42:	b260      	st.w      	r3, (r2, 0x0)
}
    2a44:	783c      	jmp      	r15
    2a46:	0000      	bkpt
    2a48:	e000e100 	.long	0xe000e100

Disassembly of section .text.SYSCON_General_CMD.part.0:

00002a4c <SYSCON_General_CMD.part.0>:
/*************************************************************/  
void SYSCON_General_CMD(FunctionalStatus NewState, SYSCON_General_CMD_TypeDef ENDIS_X )
{
	if (NewState != DISABLE)
	{
		if(ENDIS_X==ENDIS_EMOSC) 
    2a4c:	3848      	cmpnei      	r0, 8
    2a4e:	080a      	bt      	0x2a62	// 2a62 <SYSCON_General_CMD.part.0+0x16>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF00FFF)|0x00044000;					//enable EMOSC PIN
    2a50:	107a      	lrw      	r3, 0x2000004c	// 2ab8 <SYSCON_General_CMD.part.0+0x6c>
    2a52:	32ff      	movi      	r2, 255
    2a54:	9320      	ld.w      	r1, (r3, 0x0)
    2a56:	9160      	ld.w      	r3, (r1, 0x0)
    2a58:	424c      	lsli      	r2, r2, 12
    2a5a:	68c9      	andn      	r3, r2
    2a5c:	3bae      	bseti      	r3, 14
    2a5e:	3bb2      	bseti      	r3, 18
    2a60:	b160      	st.w      	r3, (r1, 0x0)
		SYSCON->GCER|=ENDIS_X;													//enable SYSCON General Control
    2a62:	1077      	lrw      	r3, 0x2000005c	// 2abc <SYSCON_General_CMD.part.0+0x70>
    2a64:	9360      	ld.w      	r3, (r3, 0x0)
    2a66:	9341      	ld.w      	r2, (r3, 0x4)
    2a68:	6c80      	or      	r2, r0
    2a6a:	b341      	st.w      	r2, (r3, 0x4)
		while(!(SYSCON->GCSR&ENDIS_X));											//check  Enable?	
    2a6c:	9343      	ld.w      	r2, (r3, 0xc)
    2a6e:	6880      	and      	r2, r0
    2a70:	3a40      	cmpnei      	r2, 0
    2a72:	0ffd      	bf      	0x2a6c	// 2a6c <SYSCON_General_CMD.part.0+0x20>
		switch(ENDIS_X)
    2a74:	3842      	cmpnei      	r0, 2
    2a76:	0807      	bt      	0x2a84	// 2a84 <SYSCON_General_CMD.part.0+0x38>
		{
			case ENDIS_IMOSC:
				while (!(SYSCON->CKST & ENDIS_IMOSC)); 	
    2a78:	3102      	movi      	r1, 2
    2a7a:	9344      	ld.w      	r2, (r3, 0x10)
    2a7c:	6884      	and      	r2, r1
    2a7e:	3a40      	cmpnei      	r2, 0
    2a80:	0ffd      	bf      	0x2a7a	// 2a7a <SYSCON_General_CMD.part.0+0x2e>
	{
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
		while(SYSCON->GCSR&ENDIS_X);											//check Disable?
		SYSCON->ICR|=ENDIS_X;													//Clear ENDIS_X stable bit
	}
}
    2a82:	783c      	jmp      	r15
		switch(ENDIS_X)
    2a84:	3802      	cmphsi      	r0, 3
    2a86:	0809      	bt      	0x2a98	// 2a98 <SYSCON_General_CMD.part.0+0x4c>
    2a88:	3841      	cmpnei      	r0, 1
    2a8a:	0bfc      	bt      	0x2a82	// 2a82 <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_ISOSC)); 
    2a8c:	3101      	movi      	r1, 1
    2a8e:	9344      	ld.w      	r2, (r3, 0x10)
    2a90:	6884      	and      	r2, r1
    2a92:	3a40      	cmpnei      	r2, 0
    2a94:	0ffd      	bf      	0x2a8e	// 2a8e <SYSCON_General_CMD.part.0+0x42>
    2a96:	07f6      	br      	0x2a82	// 2a82 <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
    2a98:	3848      	cmpnei      	r0, 8
    2a9a:	0807      	bt      	0x2aa8	// 2aa8 <SYSCON_General_CMD.part.0+0x5c>
				while (!(SYSCON->CKST & ENDIS_EMOSC)); 
    2a9c:	3108      	movi      	r1, 8
    2a9e:	9344      	ld.w      	r2, (r3, 0x10)
    2aa0:	6884      	and      	r2, r1
    2aa2:	3a40      	cmpnei      	r2, 0
    2aa4:	0ffd      	bf      	0x2a9e	// 2a9e <SYSCON_General_CMD.part.0+0x52>
    2aa6:	07ee      	br      	0x2a82	// 2a82 <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
    2aa8:	3850      	cmpnei      	r0, 16
    2aaa:	0bec      	bt      	0x2a82	// 2a82 <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_HFOSC)); 
    2aac:	3110      	movi      	r1, 16
    2aae:	9344      	ld.w      	r2, (r3, 0x10)
    2ab0:	6884      	and      	r2, r1
    2ab2:	3a40      	cmpnei      	r2, 0
    2ab4:	0ffd      	bf      	0x2aae	// 2aae <SYSCON_General_CMD.part.0+0x62>
    2ab6:	07e6      	br      	0x2a82	// 2a82 <SYSCON_General_CMD.part.0+0x36>
    2ab8:	2000004c 	.long	0x2000004c
    2abc:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_RST_VALUE:

00002ac0 <SYSCON_RST_VALUE>:
	SYSCON->RAMCHK=SYSCON_RAMCHK_RST;
    2ac0:	106f      	lrw      	r3, 0x2000005c	// 2afc <SYSCON_RST_VALUE+0x3c>
    2ac2:	1050      	lrw      	r2, 0xffff	// 2b00 <SYSCON_RST_VALUE+0x40>
    2ac4:	9360      	ld.w      	r3, (r3, 0x0)
    2ac6:	b345      	st.w      	r2, (r3, 0x14)
	SYSCON->EFLCHK=SYSCON_EFLCHK_RST;
    2ac8:	104f      	lrw      	r2, 0xffffff	// 2b04 <SYSCON_RST_VALUE+0x44>
    2aca:	b346      	st.w      	r2, (r3, 0x18)
	SYSCON->SCLKCR=SYSCON_SCLKCR_RST;
    2acc:	104f      	lrw      	r2, 0xd22d0000	// 2b08 <SYSCON_RST_VALUE+0x48>
    2ace:	b347      	st.w      	r2, (r3, 0x1c)
	SYSCON->OSTR=SYSCON_OSTR_RST;
    2ad0:	104f      	lrw      	r2, 0x70ff3bff	// 2b0c <SYSCON_RST_VALUE+0x4c>
    2ad2:	b350      	st.w      	r2, (r3, 0x40)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    2ad4:	3180      	movi      	r1, 128
	SYSCON->LVDCR=SYSCON_LVDCR_RST;
    2ad6:	320a      	movi      	r2, 10
    2ad8:	b353      	st.w      	r2, (r3, 0x4c)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    2ada:	604c      	addu      	r1, r3
    2adc:	3200      	movi      	r2, 0
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
    2ade:	100d      	lrw      	r0, 0x70c	// 2b10 <SYSCON_RST_VALUE+0x50>
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    2ae0:	b145      	st.w      	r2, (r1, 0x14)
	SYSCON->UREG0=SYSCON_UREG0_RST;
    2ae2:	23ff      	addi      	r3, 256
	SYSCON->EXIFT=SYSCON_EXIFT_RST;
    2ae4:	b146      	st.w      	r2, (r1, 0x18)
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
    2ae6:	b10d      	st.w      	r0, (r1, 0x34)
	SYSCON->IWDCNT=SYSCON_IWDCNT_RST;
    2ae8:	100b      	lrw      	r0, 0x3fe	// 2b14 <SYSCON_RST_VALUE+0x54>
    2aea:	b10e      	st.w      	r0, (r1, 0x38)
	SYSCON->EVTRG=SYSCON_EVTRG_RST;
    2aec:	b15d      	st.w      	r2, (r1, 0x74)
	SYSCON->EVPS=SYSCON_EVPS_RST;
    2aee:	b15e      	st.w      	r2, (r1, 0x78)
	SYSCON->EVSWF=SYSCON_EVSWF_RST;
    2af0:	b15f      	st.w      	r2, (r1, 0x7c)
	SYSCON->UREG0=SYSCON_UREG0_RST;
    2af2:	b340      	st.w      	r2, (r3, 0x0)
	SYSCON->UREG1=SYSCON_UREG1_RST;
    2af4:	b341      	st.w      	r2, (r3, 0x4)
	SYSCON->UREG2=SYSCON_UREG2_RST;
    2af6:	b342      	st.w      	r2, (r3, 0x8)
	SYSCON->UREG3=SYSCON_UREG3_RST;
    2af8:	b343      	st.w      	r2, (r3, 0xc)
}
    2afa:	783c      	jmp      	r15
    2afc:	2000005c 	.long	0x2000005c
    2b00:	0000ffff 	.long	0x0000ffff
    2b04:	00ffffff 	.long	0x00ffffff
    2b08:	d22d0000 	.long	0xd22d0000
    2b0c:	70ff3bff 	.long	0x70ff3bff
    2b10:	0000070c 	.long	0x0000070c
    2b14:	000003fe 	.long	0x000003fe

Disassembly of section .text.SYSCON_General_CMD:

00002b18 <SYSCON_General_CMD>:
{
    2b18:	14d0      	push      	r15
	if (NewState != DISABLE)
    2b1a:	3840      	cmpnei      	r0, 0
    2b1c:	0c05      	bf      	0x2b26	// 2b26 <SYSCON_General_CMD+0xe>
    2b1e:	6c07      	mov      	r0, r1
    2b20:	e3ffff96 	bsr      	0x2a4c	// 2a4c <SYSCON_General_CMD.part.0>
}
    2b24:	1490      	pop      	r15
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
    2b26:	1068      	lrw      	r3, 0x2000005c	// 2b44 <SYSCON_General_CMD+0x2c>
    2b28:	9360      	ld.w      	r3, (r3, 0x0)
    2b2a:	9342      	ld.w      	r2, (r3, 0x8)
    2b2c:	6c84      	or      	r2, r1
    2b2e:	b342      	st.w      	r2, (r3, 0x8)
		while(SYSCON->GCSR&ENDIS_X);											//check Disable?
    2b30:	9343      	ld.w      	r2, (r3, 0xc)
    2b32:	6884      	and      	r2, r1
    2b34:	3a40      	cmpnei      	r2, 0
    2b36:	0bfd      	bt      	0x2b30	// 2b30 <SYSCON_General_CMD+0x18>
		SYSCON->ICR|=ENDIS_X;													//Clear ENDIS_X stable bit
    2b38:	237f      	addi      	r3, 128
    2b3a:	9301      	ld.w      	r0, (r3, 0x4)
    2b3c:	6c40      	or      	r1, r0
    2b3e:	b321      	st.w      	r1, (r3, 0x4)
}
    2b40:	07f2      	br      	0x2b24	// 2b24 <SYSCON_General_CMD+0xc>
    2b42:	0000      	bkpt
    2b44:	2000005c 	.long	0x2000005c

Disassembly of section .text.SystemCLK_HCLKDIV_PCLKDIV_Config:

00002b48 <SystemCLK_HCLKDIV_PCLKDIV_Config>:
//SystemClk_data_x:EMOSC_24M,EMOSC_16M,EMOSC_12M,EMOSC_8M,EMOSC_4M,EMOSC_36K,
//ISOSC,IMOSC,HFOSC_48M,HFOSC_24M,HFOSC_12M,HFOSC_6M
//ReturnValue:NONE
/*************************************************************/ 
void SystemCLK_HCLKDIV_PCLKDIV_Config(SystemCLK_TypeDef SYSCLK_X , SystemCLK_Div_TypeDef HCLK_DIV_X , PCLK_Div_TypeDef PCLK_DIV_X , SystemClk_data_TypeDef SystemClk_data_x )
{
    2b48:	14c2      	push      	r4-r5
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==HFOSC_24M))
    2b4a:	3b40      	cmpnei      	r3, 0
    2b4c:	0c03      	bf      	0x2b52	// 2b52 <SystemCLK_HCLKDIV_PCLKDIV_Config+0xa>
    2b4e:	3b49      	cmpnei      	r3, 9
    2b50:	0807      	bt      	0x2b5e	// 2b5e <SystemCLK_HCLKDIV_PCLKDIV_Config+0x16>
	{
		IFC->CEDR=0X01;						//CLKEN
    2b52:	1098      	lrw      	r4, 0x20000060	// 2bb0 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
    2b54:	3501      	movi      	r5, 1
    2b56:	9480      	ld.w      	r4, (r4, 0x0)
    2b58:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X02|(0X00<<16);			//Medium speed mode
    2b5a:	3502      	movi      	r5, 2
    2b5c:	b4a5      	st.w      	r5, (r4, 0x14)
	}
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==EMOSC_16M))
    2b5e:	3b4a      	cmpnei      	r3, 10
    2b60:	0c04      	bf      	0x2b68	// 2b68 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x20>
    2b62:	5b83      	subi      	r4, r3, 1
    2b64:	3c01      	cmphsi      	r4, 2
    2b66:	0806      	bt      	0x2b72	// 2b72 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x2a>
	{
		IFC->CEDR=0X01;						//CLKEN
    2b68:	1092      	lrw      	r4, 0x20000060	// 2bb0 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
    2b6a:	3501      	movi      	r5, 1
    2b6c:	9480      	ld.w      	r4, (r4, 0x0)
    2b6e:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X01|(0X00<<16);			//Low speed mode
    2b70:	b4a5      	st.w      	r5, (r4, 0x14)
	}
	if((SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_6M))
    2b72:	5b8b      	subi      	r4, r3, 3
	if((SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
    2b74:	3c04      	cmphsi      	r4, 5
    2b76:	0c03      	bf      	0x2b7c	// 2b7c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x34>
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_6M))
    2b78:	3b4b      	cmpnei      	r3, 11
    2b7a:	0807      	bt      	0x2b88	// 2b88 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x40>
	{
		IFC->CEDR=0X01;						//CLKEN
    2b7c:	106d      	lrw      	r3, 0x20000060	// 2bb0 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
    2b7e:	3401      	movi      	r4, 1
    2b80:	9360      	ld.w      	r3, (r3, 0x0)
    2b82:	b381      	st.w      	r4, (r3, 0x4)
		IFC->MR=0X00|(0X00<<16);			//Low speed mode
    2b84:	3400      	movi      	r4, 0
    2b86:	b385      	st.w      	r4, (r3, 0x14)
	}
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
    2b88:	108b      	lrw      	r4, 0xd22d0000	// 2bb4 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x6c>
    2b8a:	6c10      	or      	r0, r4
    2b8c:	106b      	lrw      	r3, 0x2000005c	// 2bb8 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x70>
    2b8e:	6c40      	or      	r1, r0
    2b90:	9360      	ld.w      	r3, (r3, 0x0)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
    2b92:	3080      	movi      	r0, 128
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
    2b94:	b327      	st.w      	r1, (r3, 0x1c)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
    2b96:	4001      	lsli      	r0, r0, 1
    2b98:	9324      	ld.w      	r1, (r3, 0x10)
    2b9a:	6840      	and      	r1, r0
    2b9c:	3940      	cmpnei      	r1, 0
    2b9e:	0ffd      	bf      	0x2b98	// 2b98 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x50>
	SYSCON->PCLKCR=PCLK_KEY|PCLK_DIV_X;											//PCLK DIV 1 2 4 6 8 16		
    2ba0:	1027      	lrw      	r1, 0xc33c0000	// 2bbc <SystemCLK_HCLKDIV_PCLKDIV_Config+0x74>
    2ba2:	6c48      	or      	r1, r2
    2ba4:	b328      	st.w      	r1, (r3, 0x20)
	while(SYSCON->PCLKCR!=PCLK_DIV_X);											//Wait PCLK DIV
    2ba6:	9328      	ld.w      	r1, (r3, 0x20)
    2ba8:	644a      	cmpne      	r2, r1
    2baa:	0bfe      	bt      	0x2ba6	// 2ba6 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x5e>
}
    2bac:	1482      	pop      	r4-r5
    2bae:	0000      	bkpt
    2bb0:	20000060 	.long	0x20000060
    2bb4:	d22d0000 	.long	0xd22d0000
    2bb8:	2000005c 	.long	0x2000005c
    2bbc:	c33c0000 	.long	0xc33c0000

Disassembly of section .text.SYSCON_HFOSC_SELECTE:

00002bc0 <SYSCON_HFOSC_SELECTE>:
//EntryParameter:HFOSC_SELECTE_X
//HFOSC_SELECTE_X:HFOSC_SELECTE_48M,HFOSC_SELECTE_24M;HFOSC_SELECTE_12M;HFOSC_SELECTE_6M
//ReturnValue:NONE
/*************************************************************/  
void SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_TypeDef HFOSC_SELECTE_X)
{		
    2bc0:	14d1      	push      	r4, r15
    2bc2:	6d03      	mov      	r4, r0
	SYSCON_General_CMD(DISABLE,ENDIS_HFOSC);					//disable HFOSC
    2bc4:	3110      	movi      	r1, 16
    2bc6:	3000      	movi      	r0, 0
    2bc8:	e3ffffa8 	bsr      	0x2b18	// 2b18 <SYSCON_General_CMD>
	SYSCON->OPT1 = (SYSCON->OPT1 & 0XFFFFFFCF)|HFOSC_SELECTE_X;
    2bcc:	1066      	lrw      	r3, 0x2000005c	// 2be4 <SYSCON_HFOSC_SELECTE+0x24>
    2bce:	9360      	ld.w      	r3, (r3, 0x0)
    2bd0:	9319      	ld.w      	r0, (r3, 0x64)
    2bd2:	3884      	bclri      	r0, 4
    2bd4:	3885      	bclri      	r0, 5
    2bd6:	6c10      	or      	r0, r4
    2bd8:	b319      	st.w      	r0, (r3, 0x64)
    2bda:	3010      	movi      	r0, 16
    2bdc:	e3ffff38 	bsr      	0x2a4c	// 2a4c <SYSCON_General_CMD.part.0>
	SYSCON_General_CMD(ENABLE,ENDIS_HFOSC);						//enable HFOSC
}
    2be0:	1491      	pop      	r4, r15
    2be2:	0000      	bkpt
    2be4:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_WDT_CMD:

00002be8 <SYSCON_WDT_CMD>:
//EntryParameter:,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WDT_CMD(FunctionalStatus NewState)
{
    2be8:	106c      	lrw      	r3, 0x2000005c	// 2c18 <SYSCON_WDT_CMD+0x30>
	if(NewState != DISABLE)
    2bea:	3840      	cmpnei      	r0, 0
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    2bec:	9360      	ld.w      	r3, (r3, 0x0)
    2bee:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
    2bf0:	0c0a      	bf      	0x2c04	// 2c04 <SYSCON_WDT_CMD+0x1c>
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    2bf2:	104b      	lrw      	r2, 0x78870000	// 2c1c <SYSCON_WDT_CMD+0x34>
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
    2bf4:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    2bf6:	b34f      	st.w      	r2, (r3, 0x3c)
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
    2bf8:	4125      	lsli      	r1, r1, 5
    2bfa:	934d      	ld.w      	r2, (r3, 0x34)
    2bfc:	6884      	and      	r2, r1
    2bfe:	3a40      	cmpnei      	r2, 0
    2c00:	0ffd      	bf      	0x2bfa	// 2bfa <SYSCON_WDT_CMD+0x12>
	else
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
	}
}
    2c02:	783c      	jmp      	r15
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
    2c04:	1047      	lrw      	r2, 0x788755aa	// 2c20 <SYSCON_WDT_CMD+0x38>
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
    2c06:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
    2c08:	b34f      	st.w      	r2, (r3, 0x3c)
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
    2c0a:	4125      	lsli      	r1, r1, 5
    2c0c:	934d      	ld.w      	r2, (r3, 0x34)
    2c0e:	6884      	and      	r2, r1
    2c10:	3a40      	cmpnei      	r2, 0
    2c12:	0bfd      	bt      	0x2c0c	// 2c0c <SYSCON_WDT_CMD+0x24>
    2c14:	07f7      	br      	0x2c02	// 2c02 <SYSCON_WDT_CMD+0x1a>
    2c16:	0000      	bkpt
    2c18:	2000005c 	.long	0x2000005c
    2c1c:	78870000 	.long	0x78870000
    2c20:	788755aa 	.long	0x788755aa

Disassembly of section .text.SYSCON_IWDCNT_Reload:

00002c24 <SYSCON_IWDCNT_Reload>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Reload(void)
{
	SYSCON->IWDCNT=CLR_IWDT;
    2c24:	1064      	lrw      	r3, 0x2000005c	// 2c34 <SYSCON_IWDCNT_Reload+0x10>
    2c26:	32b4      	movi      	r2, 180
    2c28:	9360      	ld.w      	r3, (r3, 0x0)
    2c2a:	237f      	addi      	r3, 128
    2c2c:	4257      	lsli      	r2, r2, 23
    2c2e:	b34e      	st.w      	r2, (r3, 0x38)
}
    2c30:	783c      	jmp      	r15
    2c32:	0000      	bkpt
    2c34:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_IWDCNT_Config:

00002c38 <SYSCON_IWDCNT_Config>:
//IWDT_INTW_DIV_X:IWDT_INTW_DIV_1/2/3/4/4/5/6
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Config(IWDT_TIME_TypeDef IWDT_TIME_X , IWDT_TIMEDIV_TypeDef IWDT_INTW_DIV_X )
{
	SYSCON->IWDCR=IWDT_KEY|IWDT_TIME_X|IWDT_INTW_DIV_X;
    2c38:	1044      	lrw      	r2, 0x87780000	// 2c48 <SYSCON_IWDCNT_Config+0x10>
    2c3a:	1065      	lrw      	r3, 0x2000005c	// 2c4c <SYSCON_IWDCNT_Config+0x14>
    2c3c:	6c48      	or      	r1, r2
    2c3e:	9360      	ld.w      	r3, (r3, 0x0)
    2c40:	6c04      	or      	r0, r1
    2c42:	237f      	addi      	r3, 128
    2c44:	b30d      	st.w      	r0, (r3, 0x34)
}
    2c46:	783c      	jmp      	r15
    2c48:	87780000 	.long	0x87780000
    2c4c:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_LVD_Config:

00002c50 <SYSCON_LVD_Config>:
//X_LVD_INT:ENABLE_LVD_INT,DISABLE_LVD_INT
//INTDET_POL_X:INTDET_POL_fall,INTDET_POL_X_rise,INTDET_POL_X_riseORfall
//ReturnValue: NONE
/*************************************************************/
void SYSCON_LVD_Config(X_LVDEN_TypeDef X_LVDEN , INTDET_LVL_X_TypeDef INTDET_LVL_X , RSTDET_LVL_X_TypeDef RSTDET_LVL_X , X_LVD_INT_TypeDef X_LVD_INT , INTDET_POL_X_TypeDef INTDET_POL_X)
{
    2c50:	14c3      	push      	r4-r6
    2c52:	9883      	ld.w      	r4, (r14, 0xc)
	//SYSCON->LVDCR=LVD_KEY;
	SYSCON->LVDCR=LVD_KEY|X_LVDEN|INTDET_LVL_X|RSTDET_LVL_X|X_LVD_INT|INTDET_POL_X;
    2c54:	10c5      	lrw      	r6, 0xb44b0000	// 2c68 <SYSCON_LVD_Config+0x18>
    2c56:	6d18      	or      	r4, r6
    2c58:	6cd0      	or      	r3, r4
    2c5a:	6c8c      	or      	r2, r3
    2c5c:	6c48      	or      	r1, r2
    2c5e:	10a4      	lrw      	r5, 0x2000005c	// 2c6c <SYSCON_LVD_Config+0x1c>
    2c60:	6c04      	or      	r0, r1
    2c62:	95a0      	ld.w      	r5, (r5, 0x0)
    2c64:	b513      	st.w      	r0, (r5, 0x4c)
}
    2c66:	1483      	pop      	r4-r6
    2c68:	b44b0000 	.long	0xb44b0000
    2c6c:	2000005c 	.long	0x2000005c

Disassembly of section .text.LVD_Int_Enable:

00002c70 <LVD_Int_Enable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void LVD_Int_Enable(void)
{
	SYSCON->ICR = LVD_INT_ST;				//clear LVD INT status
    2c70:	1066      	lrw      	r3, 0x2000005c	// 2c88 <LVD_Int_Enable+0x18>
    2c72:	3180      	movi      	r1, 128
    2c74:	9360      	ld.w      	r3, (r3, 0x0)
    2c76:	3280      	movi      	r2, 128
    2c78:	604c      	addu      	r1, r3
    2c7a:	4244      	lsli      	r2, r2, 4
    2c7c:	b141      	st.w      	r2, (r1, 0x4)
	SYSCON->IMER  |= LVD_INT_ST;
    2c7e:	935d      	ld.w      	r2, (r3, 0x74)
    2c80:	3aab      	bseti      	r2, 11
    2c82:	b35d      	st.w      	r2, (r3, 0x74)
}
    2c84:	783c      	jmp      	r15
    2c86:	0000      	bkpt
    2c88:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXTI_trigger_CMD:

00002c8c <EXTI_trigger_CMD>:
//EXI_tringer_mode:_EXIRT,_EXIFT
//ReturnValue: LVD detection flag
/*************************************************************/
void EXTI_trigger_CMD(FunctionalStatus NewState , SYSCON_EXIPIN_TypeDef  EXIPIN , EXI_tringer_mode_TypeDef EXI_tringer_mode)
{
	switch(EXI_tringer_mode)
    2c8c:	3a40      	cmpnei      	r2, 0
    2c8e:	0c04      	bf      	0x2c96	// 2c96 <EXTI_trigger_CMD+0xa>
    2c90:	3a41      	cmpnei      	r2, 1
    2c92:	0c0e      	bf      	0x2cae	// 2cae <EXTI_trigger_CMD+0x22>
		{
			SYSCON->EXIFT &=~EXIPIN;	
		}
		break;
	}	
}
    2c94:	783c      	jmp      	r15
    2c96:	106d      	lrw      	r3, 0x2000005c	// 2cc8 <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
    2c98:	3840      	cmpnei      	r0, 0
			SYSCON->EXIRT |=EXIPIN;
    2c9a:	9360      	ld.w      	r3, (r3, 0x0)
    2c9c:	237f      	addi      	r3, 128
    2c9e:	9345      	ld.w      	r2, (r3, 0x14)
		if(NewState != DISABLE)
    2ca0:	0c04      	bf      	0x2ca8	// 2ca8 <EXTI_trigger_CMD+0x1c>
			SYSCON->EXIRT |=EXIPIN;
    2ca2:	6c48      	or      	r1, r2
    2ca4:	b325      	st.w      	r1, (r3, 0x14)
    2ca6:	07f7      	br      	0x2c94	// 2c94 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIRT &=~EXIPIN;	
    2ca8:	6885      	andn      	r2, r1
    2caa:	b345      	st.w      	r2, (r3, 0x14)
    2cac:	07f4      	br      	0x2c94	// 2c94 <EXTI_trigger_CMD+0x8>
    2cae:	1067      	lrw      	r3, 0x2000005c	// 2cc8 <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
    2cb0:	3840      	cmpnei      	r0, 0
			SYSCON->EXIFT |=EXIPIN;
    2cb2:	9360      	ld.w      	r3, (r3, 0x0)
    2cb4:	237f      	addi      	r3, 128
    2cb6:	9346      	ld.w      	r2, (r3, 0x18)
		if(NewState != DISABLE)
    2cb8:	0c04      	bf      	0x2cc0	// 2cc0 <EXTI_trigger_CMD+0x34>
			SYSCON->EXIFT |=EXIPIN;
    2cba:	6c48      	or      	r1, r2
    2cbc:	b326      	st.w      	r1, (r3, 0x18)
    2cbe:	07eb      	br      	0x2c94	// 2c94 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIFT &=~EXIPIN;	
    2cc0:	6885      	andn      	r2, r1
    2cc2:	b346      	st.w      	r2, (r3, 0x18)
}
    2cc4:	07e8      	br      	0x2c94	// 2c94 <EXTI_trigger_CMD+0x8>
    2cc6:	0000      	bkpt
    2cc8:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_Int_Enable:

00002ccc <SYSCON_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_Int_Enable(void)
{
    INTC_ISER_WRITE(SYSCON_INT);    
    2ccc:	3202      	movi      	r2, 2
    2cce:	1062      	lrw      	r3, 0xe000e100	// 2cd4 <SYSCON_Int_Enable+0x8>
    2cd0:	b340      	st.w      	r2, (r3, 0x0)
}
    2cd2:	783c      	jmp      	r15
    2cd4:	e000e100 	.long	0xe000e100

Disassembly of section .text.tk_parameter_init:

00002cd8 <tk_parameter_init>:
void tk_parameter_init(void)
{
/****************************************************
//TK parameter define
*****************************************************/
	TK_IO_ENABLE=TCH_EN(6)|TCH_EN(7)|TCH_EN(8);				
    2cd8:	33e0      	movi      	r3, 224
    2cda:	4361      	lsli      	r3, r3, 1
    2cdc:	1153      	lrw      	r2, 0x20000190	// 2da8 <tk_parameter_init+0xd0>
    2cde:	b260      	st.w      	r3, (r2, 0x0)
													//TK IO ENABLE Bit16-->Bit0;0=DISABLE 1=ENABLE
	TK_senprd[0]=30;								//TCH0 scan period = TCH0 sens
    2ce0:	321e      	movi      	r2, 30
    2ce2:	1173      	lrw      	r3, 0x20000196	// 2dac <tk_parameter_init+0xd4>
    2ce4:	ab40      	st.h      	r2, (r3, 0x0)
	TK_senprd[1]=50;								//TCH1 scan period = TCH1 sens
    2ce6:	3232      	movi      	r2, 50
    2ce8:	ab41      	st.h      	r2, (r3, 0x2)
	TK_senprd[2]=50;								//TCH2 scan period = TCH2 sens
    2cea:	ab42      	st.h      	r2, (r3, 0x4)
	TK_senprd[3]=50;								//TCH3 scan period = TCH3 sens
    2cec:	ab43      	st.h      	r2, (r3, 0x6)
	TK_senprd[4]=50;								//TCH4 scan period = TCH4 sens
    2cee:	ab44      	st.h      	r2, (r3, 0x8)
	TK_senprd[5]=50;								//TCH5 scan period = TCH5 sens
    2cf0:	ab45      	st.h      	r2, (r3, 0xa)
	TK_senprd[6]=50;								//TCH6 scan period = TCH6 sens
    2cf2:	ab46      	st.h      	r2, (r3, 0xc)
	TK_senprd[7]=50;								//TCH7 scan period = TCH7 sens
    2cf4:	ab47      	st.h      	r2, (r3, 0xe)
	TK_senprd[8]=50;								//TCH8 scan period = TCH8 sens
    2cf6:	ab48      	st.h      	r2, (r3, 0x10)
	TK_senprd[9]=50;								//TCH9 scan period = TCH9 sens
    2cf8:	ab49      	st.h      	r2, (r3, 0x12)
	TK_senprd[10]=50;								//TCH10 scan period = TCH10 sens
    2cfa:	ab4a      	st.h      	r2, (r3, 0x14)
	TK_senprd[11]=50;								//TCH11 scan period = TCH11 sens
    2cfc:	ab4b      	st.h      	r2, (r3, 0x16)
	TK_senprd[12]=50;								//TCH12 scan period = TCH12 sens
    2cfe:	ab4c      	st.h      	r2, (r3, 0x18)
	TK_senprd[13]=50;								//TCH13 scan period = TCH13 sens
    2d00:	ab4d      	st.h      	r2, (r3, 0x1a)
	TK_senprd[14]=50;								//TCH14 scan period = TCH14 sens
    2d02:	ab4e      	st.h      	r2, (r3, 0x1c)
	TK_senprd[15]=50;								//TCH15 scan period = TCH15 sens
    2d04:	ab4f      	st.h      	r2, (r3, 0x1e)
	TK_senprd[16]=50;								//TCH16 scan period = TCH16 sens
    2d06:	ab50      	st.h      	r2, (r3, 0x20)
	TK_Triggerlevel[0]=60;							//TCH0 TK_Trigger level
    2d08:	323c      	movi      	r2, 60
    2d0a:	116a      	lrw      	r3, 0x200001ba	// 2db0 <tk_parameter_init+0xd8>
	TK_Triggerlevel[8]=60;							//TCH8 TK_Trigger level
	TK_Triggerlevel[9]=60;							//TCH9 TK_Trigger level
	TK_Triggerlevel[10]=60;							//TCH10 TK_Trigger level
	TK_Triggerlevel[11]=60;							//TCH11 TK_Trigger level
	TK_Triggerlevel[12]=60;							//TCH12 TK_Trigger level
	TK_Triggerlevel[13]=60;							//TCH13 TK_Trigger level
    2d0c:	ab4d      	st.h      	r2, (r3, 0x1a)
	TK_Triggerlevel[0]=60;							//TCH0 TK_Trigger level
    2d0e:	ab40      	st.h      	r2, (r3, 0x0)
	TK_Triggerlevel[1]=60;							//TCH1 TK_Trigger level
    2d10:	ab41      	st.h      	r2, (r3, 0x2)
	TK_Triggerlevel[2]=60;							//TCH2 TK_Trigger level
    2d12:	ab42      	st.h      	r2, (r3, 0x4)
	TK_Triggerlevel[3]=60;							//TCH3 TK_Trigger level
    2d14:	ab43      	st.h      	r2, (r3, 0x6)
	TK_Triggerlevel[4]=60;							//TCH4 TK_Trigger level
    2d16:	ab44      	st.h      	r2, (r3, 0x8)
	TK_Triggerlevel[5]=60;							//TCH5 TK_Trigger level
    2d18:	ab45      	st.h      	r2, (r3, 0xa)
	TK_Triggerlevel[6]=60;							//TCH6 TK_Trigger level
    2d1a:	ab46      	st.h      	r2, (r3, 0xc)
	TK_Triggerlevel[7]=60;							//TCH7 TK_Trigger level
    2d1c:	ab47      	st.h      	r2, (r3, 0xe)
	TK_Triggerlevel[8]=60;							//TCH8 TK_Trigger level
    2d1e:	ab48      	st.h      	r2, (r3, 0x10)
	TK_Triggerlevel[9]=60;							//TCH9 TK_Trigger level
    2d20:	ab49      	st.h      	r2, (r3, 0x12)
	TK_Triggerlevel[10]=60;							//TCH10 TK_Trigger level
    2d22:	ab4a      	st.h      	r2, (r3, 0x14)
	TK_Triggerlevel[11]=60;							//TCH11 TK_Trigger level
    2d24:	ab4b      	st.h      	r2, (r3, 0x16)
	TK_Triggerlevel[12]=60;							//TCH12 TK_Trigger level
    2d26:	ab4c      	st.h      	r2, (r3, 0x18)
	TK_Triggerlevel[14]=60;							//TCH14 TK_Trigger level
    2d28:	ab4e      	st.h      	r2, (r3, 0x1c)
	TK_Triggerlevel[15]=60;							//TCH15 TK_Trigger level
    2d2a:	ab4f      	st.h      	r2, (r3, 0x1e)
	TK_Triggerlevel[16]=60;							//TCH16 TK_Trigger level
    2d2c:	ab50      	st.h      	r2, (r3, 0x20)
	Press_debounce_data=5;							//Press debounce 1~10
    2d2e:	3205      	movi      	r2, 5
    2d30:	1161      	lrw      	r3, 0x20000160	// 2db4 <tk_parameter_init+0xdc>
    2d32:	a340      	st.b      	r2, (r3, 0x0)
	Release_debounce_data=5;						//Release debounce 1~10
    2d34:	1161      	lrw      	r3, 0x20000168	// 2db8 <tk_parameter_init+0xe0>
    2d36:	a340      	st.b      	r2, (r3, 0x0)
	Key_mode=1;										//Key mode 0=single key 1=multi key
    2d38:	3201      	movi      	r2, 1
    2d3a:	1161      	lrw      	r3, 0x20000169	// 2dbc <tk_parameter_init+0xe4>
    2d3c:	a340      	st.b      	r2, (r3, 0x0)
	MultiTimes_Filter=0;							//MultiTimes Filter,>4 ENABLE <4 DISABLE
    2d3e:	3200      	movi      	r2, 0
    2d40:	1160      	lrw      	r3, 0x2000018c	// 2dc0 <tk_parameter_init+0xe8>
    2d42:	a340      	st.b      	r2, (r3, 0x0)
	Valid_Key_Num=2;								//Valid Key number when touched
    2d44:	3202      	movi      	r2, 2
    2d46:	1160      	lrw      	r3, 0x20000194	// 2dc4 <tk_parameter_init+0xec>
    2d48:	a340      	st.b      	r2, (r3, 0x0)
	Base_Speed=10;									//baseline update speed
    2d4a:	320a      	movi      	r2, 10
    2d4c:	107f      	lrw      	r3, 0x2000018d	// 2dc8 <tk_parameter_init+0xf0>
    2d4e:	a340      	st.b      	r2, (r3, 0x0)
	TK_longpress_time=16;							//longpress rebuild time = _TK_longpress_time1*1s  0=disable
    2d50:	3210      	movi      	r2, 16
    2d52:	107f      	lrw      	r3, 0x20000164	// 2dcc <tk_parameter_init+0xf4>
    2d54:	b340      	st.w      	r2, (r3, 0x0)
	TK_BaseCnt=29999;								//10ms  TK_BaseCnt=10ms*24M/8-1,this register need to modify when mcu's Freq changed
    2d56:	105f      	lrw      	r2, 0x752f	// 2dd0 <tk_parameter_init+0xf8>
    2d58:	107f      	lrw      	r3, 0x200001e0	// 2dd4 <tk_parameter_init+0xfc>
    2d5a:	b340      	st.w      	r2, (r3, 0x0)
/****************************************************
//TK low power function define
*****************************************************/
	TK_Lowpower_mode=ENABLE;						//touch key can goto sleep when TK lowpower mode enable
    2d5c:	3201      	movi      	r2, 1
    2d5e:	107f      	lrw      	r3, 0x20000161	// 2dd8 <tk_parameter_init+0x100>
    2d60:	a340      	st.b      	r2, (r3, 0x0)
	TK_Lowpower_level=2;							//0=20ms 1=50ms 2=100ms 3=150ms 4=200ms,Scan interval when sleep
    2d62:	3202      	movi      	r2, 2
    2d64:	107e      	lrw      	r3, 0x20000162	// 2ddc <tk_parameter_init+0x104>
    2d66:	a340      	st.b      	r2, (r3, 0x0)
	TK_Wakeup_level=50;								//touch key Trigger level in sleep
    2d68:	3232      	movi      	r2, 50
    2d6a:	107e      	lrw      	r3, 0x200001b8	// 2de0 <tk_parameter_init+0x108>
    2d6c:	a340      	st.b      	r2, (r3, 0x0)
/****************************************************
//TK special parameter define
*****************************************************/
	TK_PSEL_MODE=TK_PSEL_AVDD;						//tk power sel:TK_PSEL_FVR/TK_PSEL_AVDD   when select TK_PSEL_FVR PA0.2(TCH3) need a 104 cap
    2d6e:	3201      	movi      	r2, 1
    2d70:	107d      	lrw      	r3, 0x200001e4	// 2de4 <tk_parameter_init+0x10c>
    2d72:	ab40      	st.h      	r2, (r3, 0x0)
	TK_FVR_LEVEL=TK_FVR_2048V;						//FVR level:TK_FVR_2048V/TK_FVR_4096V
    2d74:	3200      	movi      	r2, 0
    2d76:	107d      	lrw      	r3, 0x200001de	// 2de8 <tk_parameter_init+0x110>
    2d78:	ab40      	st.h      	r2, (r3, 0x0)
	TK_EC_LEVEL=TK_EC_1V;							//C0 voltage sel:TK_EC_1V/TK_EC_2V/TK_EC_3V/TK_EC_3_6V
    2d7a:	107d      	lrw      	r3, 0x200001dc	// 2dec <tk_parameter_init+0x114>
    2d7c:	ab40      	st.h      	r2, (r3, 0x0)
	TK_icon[0]=5;									//TCH0 TK Scan icon range 0~7
    2d7e:	3205      	movi      	r2, 5
    2d80:	107c      	lrw      	r3, 0x2000016a	// 2df0 <tk_parameter_init+0x118>
    2d82:	ab40      	st.h      	r2, (r3, 0x0)
	TK_icon[1]=4;									//TCH1 TK Scan icon range 0~7
    2d84:	3204      	movi      	r2, 4
    2d86:	ab41      	st.h      	r2, (r3, 0x2)
	TK_icon[2]=4;									//TCH2 TK Scan icon range 0~7
    2d88:	ab42      	st.h      	r2, (r3, 0x4)
	TK_icon[3]=4;									//TCH3 TK Scan icon range 0~7
    2d8a:	ab43      	st.h      	r2, (r3, 0x6)
	TK_icon[4]=4;									//TCH4 TK Scan icon range 0~7
    2d8c:	ab44      	st.h      	r2, (r3, 0x8)
	TK_icon[5]=4;									//TCH5 TK Scan icon range 0~7
    2d8e:	ab45      	st.h      	r2, (r3, 0xa)
	TK_icon[6]=4;									//TCH6 TK Scan icon range 0~7
    2d90:	ab46      	st.h      	r2, (r3, 0xc)
	TK_icon[7]=4;									//TCH7 TK Scan icon range 0~7
    2d92:	ab47      	st.h      	r2, (r3, 0xe)
	TK_icon[8]=4;									//TCH8 TK Scan icon range 0~7
    2d94:	ab48      	st.h      	r2, (r3, 0x10)
	TK_icon[9]=4;									//TCH9 TK Scan icon range 0~7
    2d96:	ab49      	st.h      	r2, (r3, 0x12)
	TK_icon[10]=4;									//TCH10 TK Scan icon range 0~7
    2d98:	ab4a      	st.h      	r2, (r3, 0x14)
	TK_icon[11]=4;									//TCH11 TK Scan icon range 0~7
    2d9a:	ab4b      	st.h      	r2, (r3, 0x16)
	TK_icon[12]=4;									//TCH12 TK Scan icon range 0~7
    2d9c:	ab4c      	st.h      	r2, (r3, 0x18)
	TK_icon[13]=4;									//TCH13 TK Scan icon range 0~7
    2d9e:	ab4d      	st.h      	r2, (r3, 0x1a)
	TK_icon[14]=4;									//TCH14 TK Scan icon range 0~7
    2da0:	ab4e      	st.h      	r2, (r3, 0x1c)
	TK_icon[15]=4;									//TCH15 TK Scan icon range 0~7
    2da2:	ab4f      	st.h      	r2, (r3, 0x1e)
	TK_icon[16]=4;									//TCH16 TK Scan icon range 0~7
    2da4:	ab50      	st.h      	r2, (r3, 0x20)
    2da6:	783c      	jmp      	r15
    2da8:	20000190 	.long	0x20000190
    2dac:	20000196 	.long	0x20000196
    2db0:	200001ba 	.long	0x200001ba
    2db4:	20000160 	.long	0x20000160
    2db8:	20000168 	.long	0x20000168
    2dbc:	20000169 	.long	0x20000169
    2dc0:	2000018c 	.long	0x2000018c
    2dc4:	20000194 	.long	0x20000194
    2dc8:	2000018d 	.long	0x2000018d
    2dcc:	20000164 	.long	0x20000164
    2dd0:	0000752f 	.long	0x0000752f
    2dd4:	200001e0 	.long	0x200001e0
    2dd8:	20000161 	.long	0x20000161
    2ddc:	20000162 	.long	0x20000162
    2de0:	200001b8 	.long	0x200001b8
    2de4:	200001e4 	.long	0x200001e4
    2de8:	200001de 	.long	0x200001de
    2dec:	200001dc 	.long	0x200001dc
    2df0:	2000016a 	.long	0x2000016a

Disassembly of section .text.UART1_DeInit:

00002df4 <UART1_DeInit>:
    UART0->ISR  = UART_RESET_VALUE;
    UART0->BRDIV =UART_RESET_VALUE;
}
void UART1_DeInit(void)
{
    UART1->DATA = UART_RESET_VALUE;
    2df4:	1065      	lrw      	r3, 0x2000003c	// 2e08 <UART1_DeInit+0x14>
    2df6:	3200      	movi      	r2, 0
    2df8:	9360      	ld.w      	r3, (r3, 0x0)
    2dfa:	b340      	st.w      	r2, (r3, 0x0)
    UART1->SR   = UART_RESET_VALUE;
    2dfc:	b341      	st.w      	r2, (r3, 0x4)
    UART1->CTRL = UART_RESET_VALUE;
    2dfe:	b342      	st.w      	r2, (r3, 0x8)
    UART1->ISR  = UART_RESET_VALUE;
    2e00:	b343      	st.w      	r2, (r3, 0xc)
    UART1->BRDIV =UART_RESET_VALUE;
    2e02:	b344      	st.w      	r2, (r3, 0x10)
}
    2e04:	783c      	jmp      	r15
    2e06:	0000      	bkpt
    2e08:	2000003c 	.long	0x2000003c

Disassembly of section .text.UART_IO_Init:

00002e0c <UART_IO_Init>:
//UART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void UART_IO_Init(UART_NUM_TypeDef IO_UART_NUM , U8_T UART_IO_G)
{
    if (IO_UART_NUM==IO_UART0)
    2e0c:	3840      	cmpnei      	r0, 0
    2e0e:	0821      	bt      	0x2e50	// 2e50 <UART_IO_Init+0x44>
    {
		if(UART_IO_G==0)
    2e10:	3940      	cmpnei      	r1, 0
    2e12:	080a      	bt      	0x2e26	// 2e26 <UART_IO_Init+0x1a>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000044;       //PA0.1->RXD0, PA0.0->TXD0
    2e14:	1172      	lrw      	r3, 0x2000004c	// 2edc <UART_IO_Init+0xd0>
    2e16:	31ff      	movi      	r1, 255
    2e18:	9340      	ld.w      	r2, (r3, 0x0)
    2e1a:	9260      	ld.w      	r3, (r2, 0x0)
    2e1c:	68c5      	andn      	r3, r1
    2e1e:	3ba2      	bseti      	r3, 2
    2e20:	3ba6      	bseti      	r3, 6
    }
     if (IO_UART_NUM==IO_UART1)
    {
        if(UART_IO_G==0)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
    2e22:	b260      	st.w      	r3, (r2, 0x0)
    2e24:	0415      	br      	0x2e4e	// 2e4e <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
    2e26:	3941      	cmpnei      	r1, 1
    2e28:	0813      	bt      	0x2e4e	// 2e4e <UART_IO_Init+0x42>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00700000;      //PA0.5->RXD0, PA0.12->TXD0
    2e2a:	116d      	lrw      	r3, 0x2000004c	// 2edc <UART_IO_Init+0xd0>
    2e2c:	31f0      	movi      	r1, 240
    2e2e:	9340      	ld.w      	r2, (r3, 0x0)
    2e30:	9260      	ld.w      	r3, (r2, 0x0)
    2e32:	4130      	lsli      	r1, r1, 16
    2e34:	68c5      	andn      	r3, r1
    2e36:	31e0      	movi      	r1, 224
    2e38:	412f      	lsli      	r1, r1, 15
    2e3a:	6cc4      	or      	r3, r1
    2e3c:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00070000;      
    2e3e:	31f0      	movi      	r1, 240
    2e40:	9261      	ld.w      	r3, (r2, 0x4)
    2e42:	412c      	lsli      	r1, r1, 12
    2e44:	68c5      	andn      	r3, r1
    2e46:	31e0      	movi      	r1, 224
    2e48:	412b      	lsli      	r1, r1, 11
    2e4a:	6cc4      	or      	r3, r1
    2e4c:	b261      	st.w      	r3, (r2, 0x4)
		else if(UART_IO_G==2)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
		}
    }
}
    2e4e:	783c      	jmp      	r15
     if (IO_UART_NUM==IO_UART1)
    2e50:	3841      	cmpnei      	r0, 1
    2e52:	0824      	bt      	0x2e9a	// 2e9a <UART_IO_Init+0x8e>
        if(UART_IO_G==0)
    2e54:	3940      	cmpnei      	r1, 0
    2e56:	0809      	bt      	0x2e68	// 2e68 <UART_IO_Init+0x5c>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
    2e58:	1162      	lrw      	r3, 0x20000048	// 2ee0 <UART_IO_Init+0xd4>
    2e5a:	310f      	movi      	r1, 15
    2e5c:	9340      	ld.w      	r2, (r3, 0x0)
    2e5e:	9260      	ld.w      	r3, (r2, 0x0)
    2e60:	68c5      	andn      	r3, r1
    2e62:	3107      	movi      	r1, 7
    2e64:	6cc4      	or      	r3, r1
    2e66:	07de      	br      	0x2e22	// 2e22 <UART_IO_Init+0x16>
		else if(UART_IO_G==1)
    2e68:	3941      	cmpnei      	r1, 1
    2e6a:	080c      	bt      	0x2e82	// 2e82 <UART_IO_Init+0x76>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF) | 0X00077000;        //PA0.4->RXD1, PA0.3->TXD1
    2e6c:	107c      	lrw      	r3, 0x2000004c	// 2edc <UART_IO_Init+0xd0>
    2e6e:	32ff      	movi      	r2, 255
    2e70:	9320      	ld.w      	r1, (r3, 0x0)
    2e72:	424c      	lsli      	r2, r2, 12
    2e74:	9160      	ld.w      	r3, (r1, 0x0)
    2e76:	68c9      	andn      	r3, r2
    2e78:	32ee      	movi      	r2, 238
    2e7a:	424b      	lsli      	r2, r2, 11
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
    2e7c:	6cc8      	or      	r3, r2
    2e7e:	b160      	st.w      	r3, (r1, 0x0)
}
    2e80:	07e7      	br      	0x2e4e	// 2e4e <UART_IO_Init+0x42>
		else if(UART_IO_G==2)
    2e82:	3942      	cmpnei      	r1, 2
    2e84:	0be5      	bt      	0x2e4e	// 2e4e <UART_IO_Init+0x42>
			GPIOA0->CONHR = (GPIOA0->CONHR&0X00FFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
    2e86:	1076      	lrw      	r3, 0x2000004c	// 2edc <UART_IO_Init+0xd0>
    2e88:	32ee      	movi      	r2, 238
    2e8a:	9320      	ld.w      	r1, (r3, 0x0)
    2e8c:	9161      	ld.w      	r3, (r1, 0x4)
    2e8e:	4368      	lsli      	r3, r3, 8
    2e90:	4b68      	lsri      	r3, r3, 8
    2e92:	4257      	lsli      	r2, r2, 23
    2e94:	6cc8      	or      	r3, r2
    2e96:	b161      	st.w      	r3, (r1, 0x4)
    2e98:	07db      	br      	0x2e4e	// 2e4e <UART_IO_Init+0x42>
	 if (IO_UART_NUM==IO_UART2)
    2e9a:	3842      	cmpnei      	r0, 2
    2e9c:	0bd9      	bt      	0x2e4e	// 2e4e <UART_IO_Init+0x42>
        if(UART_IO_G==0)
    2e9e:	3940      	cmpnei      	r1, 0
    2ea0:	0808      	bt      	0x2eb0	// 2eb0 <UART_IO_Init+0xa4>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
    2ea2:	106f      	lrw      	r3, 0x2000004c	// 2edc <UART_IO_Init+0xd0>
    2ea4:	31ff      	movi      	r1, 255
    2ea6:	9340      	ld.w      	r2, (r3, 0x0)
    2ea8:	9260      	ld.w      	r3, (r2, 0x0)
    2eaa:	68c5      	andn      	r3, r1
    2eac:	3177      	movi      	r1, 119
    2eae:	07db      	br      	0x2e64	// 2e64 <UART_IO_Init+0x58>
		else if(UART_IO_G==1)
    2eb0:	3941      	cmpnei      	r1, 1
    2eb2:	0809      	bt      	0x2ec4	// 2ec4 <UART_IO_Init+0xb8>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X00FFFFFF) | 0X77000000;        //PA0.7->RXD2, PA0.6->TXD2
    2eb4:	106a      	lrw      	r3, 0x2000004c	// 2edc <UART_IO_Init+0xd0>
    2eb6:	32ee      	movi      	r2, 238
    2eb8:	9320      	ld.w      	r1, (r3, 0x0)
    2eba:	9160      	ld.w      	r3, (r1, 0x0)
    2ebc:	4368      	lsli      	r3, r3, 8
    2ebe:	4b68      	lsri      	r3, r3, 8
    2ec0:	4257      	lsli      	r2, r2, 23
    2ec2:	07dd      	br      	0x2e7c	// 2e7c <UART_IO_Init+0x70>
		else if(UART_IO_G==2)
    2ec4:	3942      	cmpnei      	r1, 2
    2ec6:	0bc4      	bt      	0x2e4e	// 2e4e <UART_IO_Init+0x42>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
    2ec8:	1066      	lrw      	r3, 0x20000048	// 2ee0 <UART_IO_Init+0xd4>
    2eca:	32ff      	movi      	r2, 255
    2ecc:	9320      	ld.w      	r1, (r3, 0x0)
    2ece:	4250      	lsli      	r2, r2, 16
    2ed0:	9160      	ld.w      	r3, (r1, 0x0)
    2ed2:	68c9      	andn      	r3, r2
    2ed4:	32cc      	movi      	r2, 204
    2ed6:	424f      	lsli      	r2, r2, 15
    2ed8:	07d2      	br      	0x2e7c	// 2e7c <UART_IO_Init+0x70>
    2eda:	0000      	bkpt
    2edc:	2000004c 	.long	0x2000004c
    2ee0:	20000048 	.long	0x20000048

Disassembly of section .text.UARTInit:

00002ee4 <UARTInit>:
//ReturnValue:NONE
/*************************************************************/
void UARTInit(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX |PAR_DAT);
    2ee4:	3aa0      	bseti      	r2, 0
    2ee6:	3aa1      	bseti      	r2, 1
    2ee8:	b042      	st.w      	r2, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
    2eea:	b024      	st.w      	r1, (r0, 0x10)
}
    2eec:	783c      	jmp      	r15

Disassembly of section .text.UARTTxByte:

00002eee <UARTTxByte>:
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
    2eee:	b020      	st.w      	r1, (r0, 0x0)
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
    2ef0:	3201      	movi      	r2, 1
		DataI = CSP_UART_GET_SR(uart);
    2ef2:	9061      	ld.w      	r3, (r0, 0x4)
		DataI = DataI & UART_TX_FULL;
    2ef4:	68c8      	and      	r3, r2
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
    2ef6:	3b40      	cmpnei      	r3, 0
    2ef8:	0bfd      	bt      	0x2ef2	// 2ef2 <UARTTxByte+0x4>
}
    2efa:	783c      	jmp      	r15

Disassembly of section .text.WWDT_CONFIG:

00002efc <WWDT_CONFIG>:
//WWDT CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CONFIG(WWDT_PSCDIV_TypeDef PSCDIVX,U8_T WND_DATA,WWDT_DBGEN_TypeDef DBGENX)
{
    2efc:	14c1      	push      	r4
	WWDT->CFGR =WND_DATA;
    2efe:	1065      	lrw      	r3, 0x20000010	// 2f10 <WWDT_CONFIG+0x14>
    2f00:	9380      	ld.w      	r4, (r3, 0x0)
    2f02:	b421      	st.w      	r1, (r4, 0x4)
	WWDT->CFGR |= PSCDIVX |DBGENX;
    2f04:	9461      	ld.w      	r3, (r4, 0x4)
    2f06:	6c8c      	or      	r2, r3
    2f08:	6c08      	or      	r0, r2
    2f0a:	b401      	st.w      	r0, (r4, 0x4)
}
    2f0c:	1481      	pop      	r4
    2f0e:	0000      	bkpt
    2f10:	20000010 	.long	0x20000010

Disassembly of section .text.WWDT_CNT_Load:

00002f14 <WWDT_CNT_Load>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CNT_Load(U8_T cnt_data)
{
	WWDT->CR  |= cnt_data;						//SET
    2f14:	1063      	lrw      	r3, 0x20000010	// 2f20 <WWDT_CNT_Load+0xc>
    2f16:	9360      	ld.w      	r3, (r3, 0x0)
    2f18:	9340      	ld.w      	r2, (r3, 0x0)
    2f1a:	6c08      	or      	r0, r2
    2f1c:	b300      	st.w      	r0, (r3, 0x0)
}
    2f1e:	783c      	jmp      	r15
    2f20:	20000010 	.long	0x20000010

Disassembly of section .text.WWDT_Int_Config:

00002f24 <WWDT_Int_Config>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void WWDT_Int_Config(FunctionalStatus NewState)
{
	if (NewState != DISABLE)
    2f24:	3840      	cmpnei      	r0, 0
    2f26:	106a      	lrw      	r3, 0x20000010	// 2f4c <WWDT_Int_Config+0x28>
    2f28:	0c0b      	bf      	0x2f3e	// 2f3e <WWDT_Int_Config+0x1a>
	{
		WWDT->ICR = WWDT_EVI;				
    2f2a:	9360      	ld.w      	r3, (r3, 0x0)
    2f2c:	3101      	movi      	r1, 1
    2f2e:	b325      	st.w      	r1, (r3, 0x14)
		WWDT->IMCR  |= WWDT_EVI;
    2f30:	9344      	ld.w      	r2, (r3, 0x10)
    2f32:	6c84      	or      	r2, r1
    2f34:	b344      	st.w      	r2, (r3, 0x10)
		INTC_ISER_WRITE(WWDT_INT);  
    2f36:	3240      	movi      	r2, 64
    2f38:	1066      	lrw      	r3, 0xe000e100	// 2f50 <WWDT_Int_Config+0x2c>
	}
	else
	{
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
		INTC_ICER_WRITE(WWDT_INT);  
    2f3a:	b340      	st.w      	r2, (r3, 0x0)
	}
    2f3c:	783c      	jmp      	r15
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
    2f3e:	9340      	ld.w      	r2, (r3, 0x0)
    2f40:	9264      	ld.w      	r3, (r2, 0x10)
    2f42:	3b80      	bclri      	r3, 0
    2f44:	b264      	st.w      	r3, (r2, 0x10)
		INTC_ICER_WRITE(WWDT_INT);  
    2f46:	3240      	movi      	r2, 64
    2f48:	1063      	lrw      	r3, 0xe000e180	// 2f54 <WWDT_Int_Config+0x30>
    2f4a:	07f8      	br      	0x2f3a	// 2f3a <WWDT_Int_Config+0x16>
    2f4c:	20000010 	.long	0x20000010
    2f50:	e000e100 	.long	0xe000e100
    2f54:	e000e180 	.long	0xe000e180

Disassembly of section .text.startup.main:

00002f58 <main>:
U8_T flash2 = 0;
/***************************************************/
// main
/**************************************************/
int main(void)
{
    2f58:	14d0      	push      	r15
    2f5a:	1421      	subi      	r14, r14, 4
  // delay_nms(1000);
  // SYSCON_WDT_CMD(DISABLE);
  // PCLK_goto_deepsleep_mode();
  APT32F102_init();
    2f5c:	e000013c 	bsr      	0x31d4	// 31d4 <APT32F102_init>

  LCD_Init();
    2f60:	e0000d58 	bsr      	0x4a10	// 4a10 <LCD_Init>
  LCD_Fill(0, 0, 160, 80, LGRAY);
    2f64:	107b      	lrw      	r3, 0xc618	// 2fd0 <main+0x78>
    2f66:	b860      	st.w      	r3, (r14, 0x0)
    2f68:	32a0      	movi      	r2, 160
    2f6a:	3350      	movi      	r3, 80
    2f6c:	3100      	movi      	r1, 0
    2f6e:	3000      	movi      	r0, 0
    2f70:	e0000bc0 	bsr      	0x46f0	// 46f0 <LCD_Fill>
  ReadDataArry(DROM_PageAdd0,4,cal0_a.arr);
    2f74:	3080      	movi      	r0, 128
    2f76:	1058      	lrw      	r2, 0x20000230	// 2fd4 <main+0x7c>
    2f78:	3104      	movi      	r1, 4
    2f7a:	4015      	lsli      	r0, r0, 21
    2f7c:	e3fffcae 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  ReadDataArry(DROM_PageAdd1, 4, cal0_b.arr);
    2f80:	1056      	lrw      	r2, 0x2000023c	// 2fd8 <main+0x80>
    2f82:	3104      	movi      	r1, 4
    2f84:	1016      	lrw      	r0, 0x10000040	// 2fdc <main+0x84>
    2f86:	e3fffca9 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  ReadDataArry(DROM_PageAdd2, 4, cal1_a.arr);
    2f8a:	1056      	lrw      	r2, 0x20000238	// 2fe0 <main+0x88>
    2f8c:	3104      	movi      	r1, 4
    2f8e:	1016      	lrw      	r0, 0x10000080	// 2fe4 <main+0x8c>
    2f90:	e3fffca4 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  ReadDataArry(DROM_PageAdd3, 4, cal1_b.arr);
    2f94:	1055      	lrw      	r2, 0x2000022c	// 2fe8 <main+0x90>
    2f96:	3104      	movi      	r1, 4
    2f98:	1015      	lrw      	r0, 0x100000c0	// 2fec <main+0x94>
    2f9a:	e3fffc9f 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  ReadDataArry(DROM_PageAdd4, 4, cal2_a.arr);
    2f9e:	1055      	lrw      	r2, 0x20000240	// 2ff0 <main+0x98>
    2fa0:	3104      	movi      	r1, 4
    2fa2:	1015      	lrw      	r0, 0x10000100	// 2ff4 <main+0x9c>
    2fa4:	e3fffc9a 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  ReadDataArry(DROM_PageAdd5, 4, cal2_b.arr);
    2fa8:	1054      	lrw      	r2, 0x20000228	// 2ff8 <main+0xa0>
    2faa:	3104      	movi      	r1, 4
    2fac:	1014      	lrw      	r0, 0x10000140	// 2ffc <main+0xa4>
    2fae:	e3fffc95 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  ReadDataArry(DROM_PageAdd6, 4, cal3_a.arr);
    2fb2:	1054      	lrw      	r2, 0x20000224	// 3000 <main+0xa8>
    2fb4:	3104      	movi      	r1, 4
    2fb6:	1014      	lrw      	r0, 0x10000180	// 3004 <main+0xac>
    2fb8:	e3fffc90 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  ReadDataArry(DROM_PageAdd7, 4, cal3_b.arr);
    2fbc:	1053      	lrw      	r2, 0x20000234	// 3008 <main+0xb0>
    2fbe:	3104      	movi      	r1, 4
    2fc0:	1013      	lrw      	r0, 0x100001c0	// 300c <main+0xb4>
    2fc2:	e3fffc8b 	bsr      	0x28d8	// 28d8 <ReadDataArry>
  // LCD_ShowPicture(100, 20, 40, 40, gImage_1);
  while (1)
  {

    SYSCON_IWDCNT_Reload();
    2fc6:	e3fffe2f 	bsr      	0x2c24	// 2c24 <SYSCON_IWDCNT_Reload>
    Task_Pro_Handler_Callback();
    2fca:	e00008ab 	bsr      	0x4120	// 4120 <Task_Pro_Handler_Callback>
    2fce:	07fc      	br      	0x2fc6	// 2fc6 <main+0x6e>
    2fd0:	0000c618 	.long	0x0000c618
    2fd4:	20000230 	.long	0x20000230
    2fd8:	2000023c 	.long	0x2000023c
    2fdc:	10000040 	.long	0x10000040
    2fe0:	20000238 	.long	0x20000238
    2fe4:	10000080 	.long	0x10000080
    2fe8:	2000022c 	.long	0x2000022c
    2fec:	100000c0 	.long	0x100000c0
    2ff0:	20000240 	.long	0x20000240
    2ff4:	10000100 	.long	0x10000100
    2ff8:	20000228 	.long	0x20000228
    2ffc:	10000140 	.long	0x10000140
    3000:	20000224 	.long	0x20000224
    3004:	10000180 	.long	0x10000180
    3008:	20000234 	.long	0x20000234
    300c:	100001c0 	.long	0x100001c0

Disassembly of section .text.delay_nms:

00003010 <delay_nms>:
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_nms(unsigned int t)
{
    3010:	14d0      	push      	r15
    3012:	1423      	subi      	r14, r14, 12
    volatile unsigned int i,j ,k=0;
    j = 50* t;
    3014:	3232      	movi      	r2, 50
    volatile unsigned int i,j ,k=0;
    3016:	3300      	movi      	r3, 0
    j = 50* t;
    3018:	7c08      	mult      	r0, r2
    volatile unsigned int i,j ,k=0;
    301a:	b862      	st.w      	r3, (r14, 0x8)
    j = 50* t;
    301c:	b801      	st.w      	r0, (r14, 0x4)
    for ( i = 0; i < j; i++ )
    301e:	b860      	st.w      	r3, (r14, 0x0)
    3020:	9840      	ld.w      	r2, (r14, 0x0)
    3022:	9861      	ld.w      	r3, (r14, 0x4)
    3024:	64c8      	cmphs      	r2, r3
    3026:	0c03      	bf      	0x302c	// 302c <delay_nms+0x1c>
    {
        k++;
		SYSCON_IWDCNT_Reload(); 
    }
}
    3028:	1403      	addi      	r14, r14, 12
    302a:	1490      	pop      	r15
        k++;
    302c:	9862      	ld.w      	r3, (r14, 0x8)
    302e:	2300      	addi      	r3, 1
    3030:	b862      	st.w      	r3, (r14, 0x8)
		SYSCON_IWDCNT_Reload(); 
    3032:	e3fffdf9 	bsr      	0x2c24	// 2c24 <SYSCON_IWDCNT_Reload>
    for ( i = 0; i < j; i++ )
    3036:	9860      	ld.w      	r3, (r14, 0x0)
    3038:	2300      	addi      	r3, 1
    303a:	07f2      	br      	0x301e	// 301e <delay_nms+0xe>

Disassembly of section .text.GPIO_CONFIG:

0000303c <GPIO_CONFIG>:
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
    303c:	14d1      	push      	r4, r15
	/*数字输入*/
	
	
	/*数字输出*/
	GPIO_Init(GPIOA0, 4, 0);//led1
    303e:	1099      	lrw      	r4, 0x2000004c	// 30a0 <GPIO_CONFIG+0x64>
    3040:	3200      	movi      	r2, 0
    3042:	9400      	ld.w      	r0, (r4, 0x0)
    3044:	3104      	movi      	r1, 4
    3046:	e3fffb81 	bsr      	0x2748	// 2748 <GPIO_Init>
	GPIO_Init(GPIOA0, 3, 0); //led2
    304a:	9400      	ld.w      	r0, (r4, 0x0)
    304c:	3200      	movi      	r2, 0
    304e:	3103      	movi      	r1, 3
    3050:	e3fffb7c 	bsr      	0x2748	// 2748 <GPIO_Init>
	GPIO_Init(GPIOA0, 1, 0); //led3
    3054:	9400      	ld.w      	r0, (r4, 0x0)
    3056:	3200      	movi      	r2, 0
    3058:	3101      	movi      	r1, 1
    305a:	e3fffb77 	bsr      	0x2748	// 2748 <GPIO_Init>
	GPIO_Init(GPIOA0, 0, 0); //led3
    305e:	9400      	ld.w      	r0, (r4, 0x0)
    3060:	3200      	movi      	r2, 0
    3062:	3100      	movi      	r1, 0
    3064:	e3fffb72 	bsr      	0x2748	// 2748 <GPIO_Init>
	GPIO_Init(GPIOA0, 2, 0); //RST
    3068:	9400      	ld.w      	r0, (r4, 0x0)
    306a:	3200      	movi      	r2, 0
    306c:	3102      	movi      	r1, 2
    306e:	e3fffb6d 	bsr      	0x2748	// 2748 <GPIO_Init>
	GPIO_Init(GPIOB0, 1, 0);  //DC
    3072:	106d      	lrw      	r3, 0x20000048	// 30a4 <GPIO_CONFIG+0x68>
    3074:	3200      	movi      	r2, 0
    3076:	9300      	ld.w      	r0, (r3, 0x0)
    3078:	3101      	movi      	r1, 1
    307a:	e3fffb67 	bsr      	0x2748	// 2748 <GPIO_Init>
	/*初始化电平*/
	GPIO_Write_High(GPIOA0,4);
    307e:	9400      	ld.w      	r0, (r4, 0x0)
    3080:	3104      	movi      	r1, 4
    3082:	e3fffbd3 	bsr      	0x2828	// 2828 <GPIO_Write_High>
	GPIO_Write_High(GPIOA0,3);
    3086:	9400      	ld.w      	r0, (r4, 0x0)
    3088:	3103      	movi      	r1, 3
    308a:	e3fffbcf 	bsr      	0x2828	// 2828 <GPIO_Write_High>
	GPIO_Write_High(GPIOA0,1);
    308e:	9400      	ld.w      	r0, (r4, 0x0)
    3090:	3101      	movi      	r1, 1
    3092:	e3fffbcb 	bsr      	0x2828	// 2828 <GPIO_Write_High>
	GPIO_Write_High(GPIOA0,0);
    3096:	9400      	ld.w      	r0, (r4, 0x0)
    3098:	3100      	movi      	r1, 0
    309a:	e3fffbc7 	bsr      	0x2828	// 2828 <GPIO_Write_High>
	//EXI1_WakeUp_Enable();										//EXI1 interrupt wake up enable
	//EXI2_WakeUp_Enable();										//EXI2~EXI3 interrupt wake up enable
	//EXI3_WakeUp_Enable();										//EXI4~EXI9 interrupt wake up enable
	//EXI4_WakeUp_Enable();										//EXI10~EXI15 interrupt wake up enable
#endif
}
    309e:	1491      	pop      	r4, r15
    30a0:	2000004c 	.long	0x2000004c
    30a4:	20000048 	.long	0x20000048

Disassembly of section .text.BT_CONFIG:

000030a8 <BT_CONFIG>:
//BT Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void BT_CONFIG(void)
{
    30a8:	14d2      	push      	r4-r5, r15
    30aa:	1424      	subi      	r14, r14, 16
	BT_DeInit(BT0);
    30ac:	1096      	lrw      	r4, 0x2000000c	// 3104 <BT_CONFIG+0x5c>
	//BT_IO_Init(BT0_PA15);
	BT_Configure(BT0,BTCLK_EN,23,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
    30ae:	3500      	movi      	r5, 0
	BT_DeInit(BT0);
    30b0:	9400      	ld.w      	r0, (r4, 0x0)
    30b2:	e3fffac5 	bsr      	0x263c	// 263c <BT_DeInit>
	BT_Configure(BT0,BTCLK_EN,23,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
    30b6:	9400      	ld.w      	r0, (r4, 0x0)
    30b8:	b8a1      	st.w      	r5, (r14, 0x4)
    30ba:	b8a0      	st.w      	r5, (r14, 0x0)
    30bc:	3308      	movi      	r3, 8
    30be:	3217      	movi      	r2, 23
    30c0:	3101      	movi      	r1, 1
    30c2:	e3fffad4 	bsr      	0x266a	// 266a <BT_Configure>
	BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
    30c6:	3380      	movi      	r3, 128
    30c8:	4363      	lsli      	r3, r3, 3
    30ca:	b861      	st.w      	r3, (r14, 0x4)
    30cc:	9400      	ld.w      	r0, (r4, 0x0)
    30ce:	3300      	movi      	r3, 0
    30d0:	b8a3      	st.w      	r5, (r14, 0xc)
    30d2:	b8a2      	st.w      	r5, (r14, 0x8)
    30d4:	b8a0      	st.w      	r5, (r14, 0x0)
    30d6:	3200      	movi      	r2, 0
    30d8:	3180      	movi      	r1, 128
    30da:	e3fffad4 	bsr      	0x2682	// 2682 <BT_ControlSet_Configure>
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_EN,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_Trigger_Configure(BT0,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT0,1000,0);//1ms
    30de:	31fa      	movi      	r1, 250
    30e0:	3200      	movi      	r2, 0
    30e2:	4122      	lsli      	r1, r1, 2
    30e4:	9400      	ld.w      	r0, (r4, 0x0)
    30e6:	e3fffae4 	bsr      	0x26ae	// 26ae <BT_Period_CMP_Write>
	BT_Start(BT0);
    30ea:	9400      	ld.w      	r0, (r4, 0x0)
    30ec:	e3fffab6 	bsr      	0x2658	// 2658 <BT_Start>
	BT_ConfigInterrupt_CMD(BT0,ENABLE,BT_PEND);
    30f0:	9400      	ld.w      	r0, (r4, 0x0)
    30f2:	3201      	movi      	r2, 1
    30f4:	3101      	movi      	r1, 1
    30f6:	e3fffadf 	bsr      	0x26b4	// 26b4 <BT_ConfigInterrupt_CMD>
	BT0_INT_ENABLE();
    30fa:	e3fffae7 	bsr      	0x26c8	// 26c8 <BT0_INT_ENABLE>
	BT_Period_CMP_Write(BT1,100,0);
	BT_Start(BT1);
	BT_ConfigInterrupt_CMD(BT1,ENABLE,BT_PEND);
	BT1_INT_ENABLE();
#endif
}
    30fe:	1404      	addi      	r14, r14, 16
    3100:	1492      	pop      	r4-r5, r15
    3102:	0000      	bkpt
    3104:	2000000c 	.long	0x2000000c

Disassembly of section .text.SPI_MASTER_CONFIG:

00003108 <SPI_MASTER_CONFIG>:
//SPI MASTER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void SPI_MASTER_CONFIG(void)
{
    3108:	14d0      	push      	r15
    310a:	1424      	subi      	r14, r14, 16
	SPI_DeInit();
    310c:	e3fffc08 	bsr      	0x291c	// 291c <SPI_DeInit>
	SPI_NSS_IO_Init(1);										//spi NSS io selection
    3110:	3001      	movi      	r0, 1
    3112:	e3fffc15 	bsr      	0x293c	// 293c <SPI_NSS_IO_Init>
	SPI_Master_Init(SPI_G2,SPI_DATA_SIZE_8BIT,SPI_SPO_0,SPI_SPH_0,SPI_LBM_0,SPI_RXIFLSEL_1_8,0,2);
    3116:	3302      	movi      	r3, 2
    3118:	b863      	st.w      	r3, (r14, 0xc)
    311a:	3201      	movi      	r2, 1
    311c:	3300      	movi      	r3, 0
    311e:	b862      	st.w      	r3, (r14, 0x8)
    3120:	b860      	st.w      	r3, (r14, 0x0)
    3122:	b841      	st.w      	r2, (r14, 0x4)
    3124:	3107      	movi      	r1, 7
    3126:	3200      	movi      	r2, 0
    3128:	3002      	movi      	r0, 2
    312a:	e3fffc23 	bsr      	0x2970	// 2970 <SPI_Master_Init>
	//SPI IO group1; 8bis; ; clk low when no data transmission;  first clock edge transition; Normal serial port; Receive Interrupt FIFO Level Selection 1/8; FSSPCLKOUT=20M/10=1M
	SPI_ConfigInterrupt_CMD(ENABLE,SPI_RXIM);				//enable FIFO receive interrupt
    312e:	3104      	movi      	r1, 4
    3130:	3001      	movi      	r0, 1
    3132:	e3fffc77 	bsr      	0x2a20	// 2a20 <SPI_ConfigInterrupt_CMD>
	SPI_Int_Enable();										//enable spi interrupt
    3136:	e3fffc83 	bsr      	0x2a3c	// 2a3c <SPI_Int_Enable>
	nop;
    313a:	6c03      	mov      	r0, r0
}
    313c:	1404      	addi      	r14, r14, 16
    313e:	1490      	pop      	r15

Disassembly of section .text.UART1_CONFIG:

00003140 <UART1_CONFIG>:
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(void)
{
    3140:	14d0      	push      	r15
	UART1_DeInit();                                                 //clear all UART Register
    3142:	e3fffe59 	bsr      	0x2df4	// 2df4 <UART1_DeInit>
    UART_IO_Init(IO_UART1,0);                                    	//use PA0.13->RXD1, PB0.0->TXD1
    3146:	3100      	movi      	r1, 0
    3148:	3001      	movi      	r0, 1
    314a:	e3fffe61 	bsr      	0x2e0c	// 2e0c <UART_IO_Init>
	// RX配置已被屏蔽
	UARTInit(UART1,208,UART_PAR_NONE);							  //baudrate=sysclock 24m/208=115200
    314e:	1064      	lrw      	r3, 0x2000003c	// 315c <UART1_CONFIG+0x1c>
    3150:	3200      	movi      	r2, 0
    3152:	9300      	ld.w      	r0, (r3, 0x0)
    3154:	31d0      	movi      	r1, 208
    3156:	e3fffec7 	bsr      	0x2ee4	// 2ee4 <UARTInit>
	//UARTInitRxTxIntEn(UART1,208,UART_PAR_NONE);					 //baudrate=sysclock 24m/208=115200,tx rx int enabled
	//UART1_Int_Enable();
}	
    315a:	1490      	pop      	r15
    315c:	2000003c 	.long	0x2000003c

Disassembly of section .text.SYSCON_CONFIG:

00003160 <SYSCON_CONFIG>:
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
    3160:	14d0      	push      	r15
    3162:	1421      	subi      	r14, r14, 4
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
    3164:	e3fffcae 	bsr      	0x2ac0	// 2ac0 <SYSCON_RST_VALUE>
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);										//SYSCON enable/disable clock source
    3168:	3101      	movi      	r1, 1
    316a:	3001      	movi      	r0, 1
    316c:	e3fffcd6 	bsr      	0x2b18	// 2b18 <SYSCON_General_CMD>
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);		//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_24M);									//HFOSC selected 24MHz
    3170:	3010      	movi      	r0, 16
    3172:	e3fffd27 	bsr      	0x2bc0	// 2bc0 <SYSCON_HFOSC_SELECTE>
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_24M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
    3176:	3180      	movi      	r1, 128
    3178:	3309      	movi      	r3, 9
    317a:	3200      	movi      	r2, 0
    317c:	4121      	lsli      	r1, r1, 1
    317e:	3002      	movi      	r0, 2
    3180:	e3fffce4 	bsr      	0x2b48	// 2b48 <SystemCLK_HCLKDIV_PCLKDIV_Config>
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_4S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    3184:	30c0      	movi      	r0, 192
    3186:	3118      	movi      	r1, 24
    3188:	4003      	lsli      	r0, r0, 3
    318a:	e3fffd57 	bsr      	0x2c38	// 2c38 <SYSCON_IWDCNT_Config>
    SYSCON_WDT_CMD(ENABLE);                                                  	//enable/disable WDT		
    318e:	3001      	movi      	r0, 1
    3190:	e3fffd2c 	bsr      	0x2be8	// 2be8 <SYSCON_WDT_CMD>
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
    3194:	e3fffd48 	bsr      	0x2c24	// 2c24 <SYSCON_IWDCNT_Reload>
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
    3198:	30ff      	movi      	r0, 255
    319a:	e3fffebd 	bsr      	0x2f14	// 2f14 <WWDT_CNT_Load>
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
    319e:	3200      	movi      	r2, 0
    31a0:	31ff      	movi      	r1, 255
    31a2:	3000      	movi      	r0, 0
    31a4:	e3fffeac 	bsr      	0x2efc	// 2efc <WWDT_CONFIG>
	WWDT_Int_Config(ENABLE);													
    31a8:	3001      	movi      	r0, 1
    31aa:	e3fffebd 	bsr      	0x2f24	// 2f24 <WWDT_Int_Config>
	//WWDT_CMD(ENABLE);															//enable wwdt
//------------  CLO Output --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA08);												//CLO output setting
	//SYSCON_CLO_SRC_SET(CLO_HFCLK,CLO_DIV16);									//CLO output clock and div
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(ENABLE_LVDEN,INTDET_LVL_3_9V,RSTDET_LVL_1_9V,ENABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    31ae:	3340      	movi      	r3, 64
    31b0:	b860      	st.w      	r3, (r14, 0x0)
    31b2:	31c0      	movi      	r1, 192
    31b4:	3380      	movi      	r3, 128
    31b6:	4364      	lsli      	r3, r3, 4
    31b8:	3200      	movi      	r2, 0
    31ba:	4123      	lsli      	r1, r1, 3
    31bc:	3000      	movi      	r0, 0
    31be:	e3fffd49 	bsr      	0x2c50	// 2c50 <SYSCON_LVD_Config>
    LVD_Int_Enable();	
    31c2:	e3fffd57 	bsr      	0x2c70	// 2c70 <LVD_Int_Enable>
//------------  SYSCON Vector  --------------------------------/ 	
	SYSCON_Int_Enable();    														//SYSCON VECTOR
    31c6:	e3fffd83 	bsr      	0x2ccc	// 2ccc <SYSCON_Int_Enable>
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
//------------------------------------------------------------/
//OSC CLOCK Calibration
//------------------------------------------------------------/	
	std_clk_calib(CLK_HFOSC_24M);												//Select the same clock source as the system
    31ca:	3001      	movi      	r0, 1
    31cc:	e00016cc 	bsr      	0x5f64	// 5f64 <std_clk_calib>
}
    31d0:	1401      	addi      	r14, r14, 4
    31d2:	1490      	pop      	r15

Disassembly of section .text.APT32F102_init:

000031d4 <APT32F102_init>:
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32F102_init(void) 
{
    31d4:	14d0      	push      	r15
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable
    31d6:	106d      	lrw      	r3, 0x2000005c	// 3208 <APT32F102_init+0x34>
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
    31d8:	3101      	movi      	r1, 1
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable
    31da:	9340      	ld.w      	r2, (r3, 0x0)
    31dc:	106c      	lrw      	r3, 0xfffffff	// 320c <APT32F102_init+0x38>
    31de:	b26a      	st.w      	r3, (r2, 0x28)
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    31e0:	b26d      	st.w      	r3, (r2, 0x34)
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
    31e2:	926c      	ld.w      	r3, (r2, 0x30)
    31e4:	68c4      	and      	r3, r1
    31e6:	3b40      	cmpnei      	r3, 0
    31e8:	0ffd      	bf      	0x31e2	// 31e2 <APT32F102_init+0xe>
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
    31ea:	e3ffffbb 	bsr      	0x3160	// 3160 <SYSCON_CONFIG>
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
    31ee:	e00004eb 	bsr      	0x3bc4	// 3bc4 <CK_CPU_EnAllNormalIrq>
	//SYSCON_INT_Priority();										 //initial all Priority=0xC0
	//Set_INT_Priority(TKEY_IRQ,0);									 //0:set int priority 1st
//------------------------------------------------------------/
//Other IP config
//------------------------------------------------------------/
	GPIO_CONFIG();                                                //GPIO initial     
    31f2:	e3ffff25 	bsr      	0x303c	// 303c <GPIO_CONFIG>
	//EPT0_CONFIG();                                                //EPT0 initial 
	//GPT0_CONFIG();												//GPT0 initial	
	BT_CONFIG();													//BT initial
    31f6:	e3ffff59 	bsr      	0x30a8	// 30a8 <BT_CONFIG>
	//COUNTA_CONFIG();                                              //CountA initial	
	//RTC_CONFIG();													//RCT initial		              
	//ET_CONFIG();													//ETCB initial
    //I2C_MASTER_CONFIG();                                          //I2C harware master initial 
	//I2C_SLAVE_CONFIG();                                           //I2C harware slave initial 
	SPI_MASTER_CONFIG();											//SPI Master initial 	
    31fa:	e3ffff87 	bsr      	0x3108	// 3108 <SPI_MASTER_CONFIG>
	//SIO_CONFIG();													//SIO initial
    //UART0_CONFIG();                                               //UART0 initial 
	//UART1_CONFIG();                                               //UART1 initial 
	//UART2_CONFIG();                                               //UART2 initial
	#if Serial_Debug
	UART1_CONFIG();
    31fe:	e3ffffa1 	bsr      	0x3140	// 3140 <UART1_CONFIG>
	tk_init();																//tk initial
    3202:	e00015d3 	bsr      	0x5da8	// 5da8 <tk_init>
	#endif
	//ADC12_CONFIG();                                               //ADC initial 
	TK_CONFIG();													//Touch Key initial
}
    3206:	1490      	pop      	r15
    3208:	2000005c 	.long	0x2000005c
    320c:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.SYSCONIntHandler:

00003210 <SYSCONIntHandler>:
//SYSCON Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCONIntHandler(void) 
{
    3210:	1460      	nie
    3212:	1462      	ipush
    // ISR content ...
	nop;
    3214:	6c03      	mov      	r0, r0
	if((SYSCON->MISR&ISOSC_ST)==ISOSC_ST)				//ISOSC stable interrupt
    3216:	117c      	lrw      	r3, 0x2000005c	// 3304 <SYSCONIntHandler+0xf4>
    3218:	3280      	movi      	r2, 128
    321a:	9360      	ld.w      	r3, (r3, 0x0)
    321c:	60c8      	addu      	r3, r2
    321e:	9323      	ld.w      	r1, (r3, 0xc)
    3220:	3001      	movi      	r0, 1
    3222:	6840      	and      	r1, r0
    3224:	3940      	cmpnei      	r1, 0
    3226:	0c04      	bf      	0x322e	// 322e <SYSCONIntHandler+0x1e>
	{
		SYSCON->ICR = EMOSC_ST;
	} 
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)			//HFOSC stable interrupt
	{
		SYSCON->ICR = HFOSC_ST;
    3228:	b301      	st.w      	r0, (r3, 0x4)
	}
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)		//Command error interrupt
	{
		SYSCON->ICR = CMD_ERR_ST;
	}
}
    322a:	1463      	ipop
    322c:	1461      	nir
	else if((SYSCON->MISR&IMOSC_ST)==IMOSC_ST)			//IMOSC stable interrupt
    322e:	9323      	ld.w      	r1, (r3, 0xc)
    3230:	3002      	movi      	r0, 2
    3232:	6840      	and      	r1, r0
    3234:	3940      	cmpnei      	r1, 0
    3236:	0bf9      	bt      	0x3228	// 3228 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&EMOSC_ST)==EMOSC_ST)			//EMOSC stable interrupt
    3238:	9323      	ld.w      	r1, (r3, 0xc)
    323a:	3008      	movi      	r0, 8
    323c:	6840      	and      	r1, r0
    323e:	3940      	cmpnei      	r1, 0
    3240:	0bf4      	bt      	0x3228	// 3228 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)			//HFOSC stable interrupt
    3242:	9323      	ld.w      	r1, (r3, 0xc)
    3244:	3010      	movi      	r0, 16
    3246:	6840      	and      	r1, r0
    3248:	3940      	cmpnei      	r1, 0
    324a:	0bef      	bt      	0x3228	// 3228 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&SYSCLK_ST)==SYSCLK_ST)		//SYSCLK change end & stable interrupt
    324c:	9323      	ld.w      	r1, (r3, 0xc)
    324e:	6848      	and      	r1, r2
    3250:	3940      	cmpnei      	r1, 0
    3252:	0c03      	bf      	0x3258	// 3258 <SYSCONIntHandler+0x48>
		SYSCON->ICR = CMD_ERR_ST;
    3254:	b341      	st.w      	r2, (r3, 0x4)
}
    3256:	07ea      	br      	0x322a	// 322a <SYSCONIntHandler+0x1a>
	else if((SYSCON->MISR&IWDT_INT_ST)==IWDT_INT_ST)	//IWDT alarm window interrupt
    3258:	3280      	movi      	r2, 128
    325a:	9323      	ld.w      	r1, (r3, 0xc)
    325c:	4241      	lsli      	r2, r2, 1
    325e:	6848      	and      	r1, r2
    3260:	3940      	cmpnei      	r1, 0
    3262:	0c06      	bf      	0x326e	// 326e <SYSCONIntHandler+0x5e>
		SYSCON->ICR = IWDT_INT_ST;
    3264:	b341      	st.w      	r2, (r3, 0x4)
		SYSCON->IWDCNT=0x5aul<<24;
    3266:	32b4      	movi      	r2, 180
    3268:	4257      	lsli      	r2, r2, 23
    326a:	b34e      	st.w      	r2, (r3, 0x38)
    326c:	07df      	br      	0x322a	// 322a <SYSCONIntHandler+0x1a>
	else if((SYSCON->MISR&WKI_INT_ST)==WKI_INT_ST)
    326e:	3280      	movi      	r2, 128
    3270:	9323      	ld.w      	r1, (r3, 0xc)
    3272:	4242      	lsli      	r2, r2, 2
    3274:	6848      	and      	r1, r2
    3276:	3940      	cmpnei      	r1, 0
    3278:	0bee      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&RAMERRINT_ST)==RAMERRINT_ST)	//SRAM check fail interrupt
    327a:	3280      	movi      	r2, 128
    327c:	9323      	ld.w      	r1, (r3, 0xc)
    327e:	4243      	lsli      	r2, r2, 3
    3280:	6848      	and      	r1, r2
    3282:	3940      	cmpnei      	r1, 0
    3284:	0be8      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&LVD_INT_ST)==LVD_INT_ST)		//LVD threshold interrupt
    3286:	3280      	movi      	r2, 128
    3288:	9323      	ld.w      	r1, (r3, 0xc)
    328a:	4244      	lsli      	r2, r2, 4
    328c:	6848      	and      	r1, r2
    328e:	3940      	cmpnei      	r1, 0
    3290:	0c03      	bf      	0x3296	// 3296 <SYSCONIntHandler+0x86>
		nop;
    3292:	6c03      	mov      	r0, r0
    3294:	07e0      	br      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&HWD_ERR_ST)==HWD_ERR_ST)		//Hardware Divider divisor = 0 interrupt
    3296:	3280      	movi      	r2, 128
    3298:	9323      	ld.w      	r1, (r3, 0xc)
    329a:	4245      	lsli      	r2, r2, 5
    329c:	6848      	and      	r1, r2
    329e:	3940      	cmpnei      	r1, 0
    32a0:	0bda      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EFL_ERR_ST)==EFL_ERR_ST)		//Flash check fail interrupt
    32a2:	3280      	movi      	r2, 128
    32a4:	9323      	ld.w      	r1, (r3, 0xc)
    32a6:	4246      	lsli      	r2, r2, 6
    32a8:	6848      	and      	r1, r2
    32aa:	3940      	cmpnei      	r1, 0
    32ac:	0bd4      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&OPTERR_INT)==OPTERR_INT)		//Option load fail interrupt
    32ae:	3280      	movi      	r2, 128
    32b0:	9323      	ld.w      	r1, (r3, 0xc)
    32b2:	4247      	lsli      	r2, r2, 7
    32b4:	6848      	and      	r1, r2
    32b6:	3940      	cmpnei      	r1, 0
    32b8:	0bce      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_CMLST_ST)==EM_CMLST_ST)	//EMOSC clock monitor fail interrupt
    32ba:	3280      	movi      	r2, 128
    32bc:	9323      	ld.w      	r1, (r3, 0xc)
    32be:	424b      	lsli      	r2, r2, 11
    32c0:	6848      	and      	r1, r2
    32c2:	3940      	cmpnei      	r1, 0
    32c4:	0bc8      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG0_ST)==EM_EVTRG0_ST)	//Event Trigger Channel 0 Interrupt
    32c6:	3280      	movi      	r2, 128
    32c8:	9323      	ld.w      	r1, (r3, 0xc)
    32ca:	424c      	lsli      	r2, r2, 12
    32cc:	6848      	and      	r1, r2
    32ce:	3940      	cmpnei      	r1, 0
    32d0:	0bc2      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG1_ST)==EM_EVTRG1_ST)	//Event Trigger Channel 1 Interrupt
    32d2:	3280      	movi      	r2, 128
    32d4:	9323      	ld.w      	r1, (r3, 0xc)
    32d6:	424d      	lsli      	r2, r2, 13
    32d8:	6848      	and      	r1, r2
    32da:	3940      	cmpnei      	r1, 0
    32dc:	0bbc      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG2_ST)==EM_EVTRG2_ST)	//Event Trigger Channel 2 Interrupt
    32de:	3280      	movi      	r2, 128
    32e0:	9323      	ld.w      	r1, (r3, 0xc)
    32e2:	424e      	lsli      	r2, r2, 14
    32e4:	6848      	and      	r1, r2
    32e6:	3940      	cmpnei      	r1, 0
    32e8:	0bb6      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG3_ST)==EM_EVTRG3_ST)	//Event Trigger Channel 3 Interrupt
    32ea:	3280      	movi      	r2, 128
    32ec:	9323      	ld.w      	r1, (r3, 0xc)
    32ee:	424f      	lsli      	r2, r2, 15
    32f0:	6848      	and      	r1, r2
    32f2:	3940      	cmpnei      	r1, 0
    32f4:	0bb0      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)		//Command error interrupt
    32f6:	3280      	movi      	r2, 128
    32f8:	9323      	ld.w      	r1, (r3, 0xc)
    32fa:	4256      	lsli      	r2, r2, 22
    32fc:	6848      	and      	r1, r2
    32fe:	3940      	cmpnei      	r1, 0
    3300:	0baa      	bt      	0x3254	// 3254 <SYSCONIntHandler+0x44>
    3302:	0794      	br      	0x322a	// 322a <SYSCONIntHandler+0x1a>
    3304:	2000005c 	.long	0x2000005c

Disassembly of section .text.IFCIntHandler:

00003308 <IFCIntHandler>:
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
    3308:	1460      	nie
    330a:	1462      	ipush
    // ISR content ...
	if(IFC->MISR&ERS_END_INT)			
    330c:	1078      	lrw      	r3, 0x20000060	// 336c <IFCIntHandler+0x64>
    330e:	3101      	movi      	r1, 1
    3310:	9360      	ld.w      	r3, (r3, 0x0)
    3312:	934b      	ld.w      	r2, (r3, 0x2c)
    3314:	6884      	and      	r2, r1
    3316:	3a40      	cmpnei      	r2, 0
    3318:	0c04      	bf      	0x3320	// 3320 <IFCIntHandler+0x18>
	{
		IFC->ICR=RGM_END_INT;
	}
	else if(IFC->MISR&PEP_END_INT)		
	{
		IFC->ICR=PEP_END_INT;
    331a:	b32c      	st.w      	r1, (r3, 0x30)
	}
	else if(IFC->MISR&OVW_ERR_INT)		
	{
		IFC->ICR=OVW_ERR_INT;
	}
}
    331c:	1463      	ipop
    331e:	1461      	nir
	else if(IFC->MISR&RGM_END_INT)		
    3320:	934b      	ld.w      	r2, (r3, 0x2c)
    3322:	3102      	movi      	r1, 2
    3324:	6884      	and      	r2, r1
    3326:	3a40      	cmpnei      	r2, 0
    3328:	0bf9      	bt      	0x331a	// 331a <IFCIntHandler+0x12>
	else if(IFC->MISR&PEP_END_INT)		
    332a:	934b      	ld.w      	r2, (r3, 0x2c)
    332c:	3104      	movi      	r1, 4
    332e:	6884      	and      	r2, r1
    3330:	3a40      	cmpnei      	r2, 0
    3332:	0bf4      	bt      	0x331a	// 331a <IFCIntHandler+0x12>
	else if(IFC->MISR&PROT_ERR_INT)		
    3334:	3280      	movi      	r2, 128
    3336:	932b      	ld.w      	r1, (r3, 0x2c)
    3338:	4245      	lsli      	r2, r2, 5
    333a:	6848      	and      	r1, r2
    333c:	3940      	cmpnei      	r1, 0
    333e:	0c03      	bf      	0x3344	// 3344 <IFCIntHandler+0x3c>
		IFC->ICR=OVW_ERR_INT;
    3340:	b34c      	st.w      	r2, (r3, 0x30)
}
    3342:	07ed      	br      	0x331c	// 331c <IFCIntHandler+0x14>
	else if(IFC->MISR&UDEF_ERR_INT)		
    3344:	3280      	movi      	r2, 128
    3346:	932b      	ld.w      	r1, (r3, 0x2c)
    3348:	4246      	lsli      	r2, r2, 6
    334a:	6848      	and      	r1, r2
    334c:	3940      	cmpnei      	r1, 0
    334e:	0bf9      	bt      	0x3340	// 3340 <IFCIntHandler+0x38>
	else if(IFC->MISR&ADDR_ERR_INT)		
    3350:	3280      	movi      	r2, 128
    3352:	932b      	ld.w      	r1, (r3, 0x2c)
    3354:	4247      	lsli      	r2, r2, 7
    3356:	6848      	and      	r1, r2
    3358:	3940      	cmpnei      	r1, 0
    335a:	0bf3      	bt      	0x3340	// 3340 <IFCIntHandler+0x38>
	else if(IFC->MISR&OVW_ERR_INT)		
    335c:	3280      	movi      	r2, 128
    335e:	932b      	ld.w      	r1, (r3, 0x2c)
    3360:	4248      	lsli      	r2, r2, 8
    3362:	6848      	and      	r1, r2
    3364:	3940      	cmpnei      	r1, 0
    3366:	0bed      	bt      	0x3340	// 3340 <IFCIntHandler+0x38>
    3368:	07da      	br      	0x331c	// 331c <IFCIntHandler+0x14>
    336a:	0000      	bkpt
    336c:	20000060 	.long	0x20000060

Disassembly of section .text.ADCIntHandler:

00003370 <ADCIntHandler>:
//ADC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void ADCIntHandler(void) 
{
    3370:	1460      	nie
    3372:	1462      	ipush
    // ISR content ...
	if((ADC0->SR&ADC12_EOC)==ADC12_EOC)				//ADC EOC interrupt
    3374:	1078      	lrw      	r3, 0x20000050	// 33d4 <ADCIntHandler+0x64>
    3376:	3101      	movi      	r1, 1
    3378:	9360      	ld.w      	r3, (r3, 0x0)
    337a:	9348      	ld.w      	r2, (r3, 0x20)
    337c:	6884      	and      	r2, r1
    337e:	3a40      	cmpnei      	r2, 0
    3380:	0c04      	bf      	0x3388	// 3388 <ADCIntHandler+0x18>
	{
		ADC0->CSR = ADC12_CMP1H;
	}
	else if((ADC0->SR&ADC12_CMP1L)==ADC12_CMP1L)	//ADC CMP1L interrupt.
	{
		ADC0->CSR = ADC12_CMP1L;
    3382:	b327      	st.w      	r1, (r3, 0x1c)
	}
	else if((ADC0->SR&ADC12_SEQ_END0)==ADC12_SEQ_END0) //ADC SEQ0 interrupt,SEQ1~SEQ15 replace the parameter with ADC12_SEQ_END1~ADC12_SEQ_END15
	{
		ADC0->CSR = ADC12_SEQ_END0;
	}
}
    3384:	1463      	ipop
    3386:	1461      	nir
	else if((ADC0->SR&ADC12_READY)==ADC12_READY)	//ADC READY interrupt
    3388:	9348      	ld.w      	r2, (r3, 0x20)
    338a:	3102      	movi      	r1, 2
    338c:	6884      	and      	r2, r1
    338e:	3a40      	cmpnei      	r2, 0
    3390:	0bf9      	bt      	0x3382	// 3382 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_OVR)==ADC12_OVR)		//ADC OVR interrupt
    3392:	9348      	ld.w      	r2, (r3, 0x20)
    3394:	3104      	movi      	r1, 4
    3396:	6884      	and      	r2, r1
    3398:	3a40      	cmpnei      	r2, 0
    339a:	0bf4      	bt      	0x3382	// 3382 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP0H)==ADC12_CMP0H)	//ADC CMP0H interrupt
    339c:	9348      	ld.w      	r2, (r3, 0x20)
    339e:	3110      	movi      	r1, 16
    33a0:	6884      	and      	r2, r1
    33a2:	3a40      	cmpnei      	r2, 0
    33a4:	0bef      	bt      	0x3382	// 3382 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP0L)==ADC12_CMP0L)	//ADC CMP0L interrupt.
    33a6:	9348      	ld.w      	r2, (r3, 0x20)
    33a8:	3120      	movi      	r1, 32
    33aa:	6884      	and      	r2, r1
    33ac:	3a40      	cmpnei      	r2, 0
    33ae:	0bea      	bt      	0x3382	// 3382 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP1H)==ADC12_CMP1H)	//ADC CMP1H interrupt.
    33b0:	9348      	ld.w      	r2, (r3, 0x20)
    33b2:	3140      	movi      	r1, 64
    33b4:	6884      	and      	r2, r1
    33b6:	3a40      	cmpnei      	r2, 0
    33b8:	0be5      	bt      	0x3382	// 3382 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP1L)==ADC12_CMP1L)	//ADC CMP1L interrupt.
    33ba:	9348      	ld.w      	r2, (r3, 0x20)
    33bc:	3180      	movi      	r1, 128
    33be:	6884      	and      	r2, r1
    33c0:	3a40      	cmpnei      	r2, 0
    33c2:	0be0      	bt      	0x3382	// 3382 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_SEQ_END0)==ADC12_SEQ_END0) //ADC SEQ0 interrupt,SEQ1~SEQ15 replace the parameter with ADC12_SEQ_END1~ADC12_SEQ_END15
    33c4:	3280      	movi      	r2, 128
    33c6:	9328      	ld.w      	r1, (r3, 0x20)
    33c8:	4249      	lsli      	r2, r2, 9
    33ca:	6848      	and      	r1, r2
    33cc:	3940      	cmpnei      	r1, 0
    33ce:	0fdb      	bf      	0x3384	// 3384 <ADCIntHandler+0x14>
		ADC0->CSR = ADC12_SEQ_END0;
    33d0:	b347      	st.w      	r2, (r3, 0x1c)
}
    33d2:	07d9      	br      	0x3384	// 3384 <ADCIntHandler+0x14>
    33d4:	20000050 	.long	0x20000050

Disassembly of section .text.EPT0IntHandler:

000033d8 <EPT0IntHandler>:
//EPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT0IntHandler(void) 
{
    33d8:	1460      	nie
    33da:	1462      	ipush
    33dc:	14d1      	push      	r4, r15
    // ISR content ...
	if((EPT0->MISR&EPT_TRGEV0_INT)==EPT_TRGEV0_INT)			//TRGEV0 interrupt
    33de:	1386      	lrw      	r4, 0x20000020	// 3574 <EPT0IntHandler+0x19c>
    33e0:	3280      	movi      	r2, 128
    33e2:	9460      	ld.w      	r3, (r4, 0x0)
    33e4:	60c8      	addu      	r3, r2
    33e6:	9335      	ld.w      	r1, (r3, 0x54)
    33e8:	3001      	movi      	r0, 1
    33ea:	6840      	and      	r1, r0
    33ec:	3940      	cmpnei      	r1, 0
    33ee:	0c03      	bf      	0x33f4	// 33f4 <EPT0IntHandler+0x1c>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
	}
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)			//Capture Load to CMPC interrupt
	{
		EPT0->ICR=EPT_CAP_LD2;
    33f0:	b317      	st.w      	r0, (r3, 0x5c)
    33f2:	0424      	br      	0x343a	// 343a <EPT0IntHandler+0x62>
	else if((EPT0->MISR&EPT_TRGEV1_INT)==EPT_TRGEV1_INT)	//TRGEV1 interrupt
    33f4:	9335      	ld.w      	r1, (r3, 0x54)
    33f6:	3002      	movi      	r0, 2
    33f8:	6840      	and      	r1, r0
    33fa:	3940      	cmpnei      	r1, 0
    33fc:	0bfa      	bt      	0x33f0	// 33f0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV2_INT)==EPT_TRGEV2_INT)	//TRGEV2 interrupt
    33fe:	9335      	ld.w      	r1, (r3, 0x54)
    3400:	3004      	movi      	r0, 4
    3402:	6840      	and      	r1, r0
    3404:	3940      	cmpnei      	r1, 0
    3406:	0bf5      	bt      	0x33f0	// 33f0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV3_INT)==EPT_TRGEV3_INT)	//TRGEV3 interrupt
    3408:	9335      	ld.w      	r1, (r3, 0x54)
    340a:	3008      	movi      	r0, 8
    340c:	6840      	and      	r1, r0
    340e:	3940      	cmpnei      	r1, 0
    3410:	0bf0      	bt      	0x33f0	// 33f0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD0)==EPT_CAP_LD0)			//Capture Load to CMPA interrupt
    3412:	9335      	ld.w      	r1, (r3, 0x54)
    3414:	3010      	movi      	r0, 16
    3416:	6840      	and      	r1, r0
    3418:	3940      	cmpnei      	r1, 0
    341a:	0c1f      	bf      	0x3458	// 3458 <EPT0IntHandler+0x80>
		EPT0->ICR=EPT_CAP_LD0;
    341c:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIRT);
    341e:	3200      	movi      	r2, 0
    3420:	3101      	movi      	r1, 1
    3422:	3000      	movi      	r0, 0
    3424:	e3fffc34 	bsr      	0x2c8c	// 2c8c <EXTI_trigger_CMD>
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIFT);
    3428:	3201      	movi      	r2, 1
    342a:	3101      	movi      	r1, 1
    342c:	3001      	movi      	r0, 1
    342e:	e3fffc2f 	bsr      	0x2c8c	// 2c8c <EXTI_trigger_CMD>
		R_CMPA_BUF=EPT0->CMPA;			//Low voltage counter
    3432:	9460      	ld.w      	r3, (r4, 0x0)
    3434:	934b      	ld.w      	r2, (r3, 0x2c)
    3436:	1271      	lrw      	r3, 0x200001f0	// 3578 <EPT0IntHandler+0x1a0>
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
    3438:	b340      	st.w      	r2, (r3, 0x0)
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)				//End of cycle interrupt
	{
		EPT0->ICR=EPT_PEND;
	}
	//Emergency interruption
	if((EPT0->EMMISR&EPT_EP0_EMINT)==EPT_EP0_EMINT)			//interrupt flag of EP0 event
    343a:	9460      	ld.w      	r3, (r4, 0x0)
    343c:	3280      	movi      	r2, 128
    343e:	60c8      	addu      	r3, r2
    3440:	932b      	ld.w      	r1, (r3, 0x2c)
    3442:	3001      	movi      	r0, 1
    3444:	6840      	and      	r1, r0
    3446:	3940      	cmpnei      	r1, 0
    3448:	0c5e      	bf      	0x3504	// 3504 <EPT0IntHandler+0x12c>
	{
		EPT0->EMICR=EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)	//interrupt flag of EP6 event
	{
		EPT0->EMICR=EPT_EP6_EMINT;
    344a:	b30d      	st.w      	r0, (r3, 0x34)
	}
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)	//interrupt flag of EOM_FAULT event
	{
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
	}
}
    344c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    3450:	9880      	ld.w      	r4, (r14, 0x0)
    3452:	1402      	addi      	r14, r14, 8
    3454:	1463      	ipop
    3456:	1461      	nir
	else if((EPT0->MISR&EPT_CAP_LD1)==EPT_CAP_LD1)			//Capture Load to CMPB interrupt
    3458:	9335      	ld.w      	r1, (r3, 0x54)
    345a:	3020      	movi      	r0, 32
    345c:	6840      	and      	r1, r0
    345e:	3940      	cmpnei      	r1, 0
    3460:	0c10      	bf      	0x3480	// 3480 <EPT0IntHandler+0xa8>
		EPT0->ICR=EPT_CAP_LD1;
    3462:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);
    3464:	3200      	movi      	r2, 0
    3466:	3101      	movi      	r1, 1
    3468:	3001      	movi      	r0, 1
    346a:	e3fffc11 	bsr      	0x2c8c	// 2c8c <EXTI_trigger_CMD>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
    346e:	3201      	movi      	r2, 1
    3470:	3101      	movi      	r1, 1
    3472:	3000      	movi      	r0, 0
    3474:	e3fffc0c 	bsr      	0x2c8c	// 2c8c <EXTI_trigger_CMD>
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
    3478:	9460      	ld.w      	r3, (r4, 0x0)
    347a:	934c      	ld.w      	r2, (r3, 0x30)
    347c:	1260      	lrw      	r3, 0x200001e8	// 357c <EPT0IntHandler+0x1a4>
    347e:	07dd      	br      	0x3438	// 3438 <EPT0IntHandler+0x60>
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)			//Capture Load to CMPC interrupt
    3480:	9335      	ld.w      	r1, (r3, 0x54)
    3482:	3040      	movi      	r0, 64
    3484:	6840      	and      	r1, r0
    3486:	3940      	cmpnei      	r1, 0
    3488:	0bb4      	bt      	0x33f0	// 33f0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD3)==EPT_CAP_LD3)			//Capture Load to CMPD interrupt
    348a:	9335      	ld.w      	r1, (r3, 0x54)
    348c:	6848      	and      	r1, r2
    348e:	3940      	cmpnei      	r1, 0
    3490:	0c03      	bf      	0x3496	// 3496 <EPT0IntHandler+0xbe>
		EPT0->ICR=EPT_PEND;
    3492:	b357      	st.w      	r2, (r3, 0x5c)
    3494:	07d3      	br      	0x343a	// 343a <EPT0IntHandler+0x62>
	else if((EPT0->MISR&EPT_CAU)==EPT_CAU)					//Up-Counting phase CNT = CMPA interrupt
    3496:	3280      	movi      	r2, 128
    3498:	9335      	ld.w      	r1, (r3, 0x54)
    349a:	4241      	lsli      	r2, r2, 1
    349c:	6848      	and      	r1, r2
    349e:	3940      	cmpnei      	r1, 0
    34a0:	0bf9      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CAD)==EPT_CAD)					//Down-Counting phase CNT = CMPA interrupt
    34a2:	3280      	movi      	r2, 128
    34a4:	9335      	ld.w      	r1, (r3, 0x54)
    34a6:	4242      	lsli      	r2, r2, 2
    34a8:	6848      	and      	r1, r2
    34aa:	3940      	cmpnei      	r1, 0
    34ac:	0bf3      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CBU)==EPT_CBU)					//Up-Counting phase CNT = CMPB interrupt 
    34ae:	3280      	movi      	r2, 128
    34b0:	9335      	ld.w      	r1, (r3, 0x54)
    34b2:	4243      	lsli      	r2, r2, 3
    34b4:	6848      	and      	r1, r2
    34b6:	3940      	cmpnei      	r1, 0
    34b8:	0bed      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CBD)==EPT_CBD)					//Down-Counting phase CNT = CMPB interrupt
    34ba:	3280      	movi      	r2, 128
    34bc:	9335      	ld.w      	r1, (r3, 0x54)
    34be:	4244      	lsli      	r2, r2, 4
    34c0:	6848      	and      	r1, r2
    34c2:	3940      	cmpnei      	r1, 0
    34c4:	0be7      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CCU)==EPT_CCU)					//Up-Counting phase CNT = CMPC interrupt 
    34c6:	3280      	movi      	r2, 128
    34c8:	9335      	ld.w      	r1, (r3, 0x54)
    34ca:	4245      	lsli      	r2, r2, 5
    34cc:	6848      	and      	r1, r2
    34ce:	3940      	cmpnei      	r1, 0
    34d0:	0be1      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CCD)==EPT_CCD)					//Down-Counting phase CNT = CMPC interrupt
    34d2:	3280      	movi      	r2, 128
    34d4:	9335      	ld.w      	r1, (r3, 0x54)
    34d6:	4246      	lsli      	r2, r2, 6
    34d8:	6848      	and      	r1, r2
    34da:	3940      	cmpnei      	r1, 0
    34dc:	0bdb      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CDU)==EPT_CDU)					//Up-Counting phase CNT = CMPD interrupt
    34de:	3280      	movi      	r2, 128
    34e0:	9335      	ld.w      	r1, (r3, 0x54)
    34e2:	4247      	lsli      	r2, r2, 7
    34e4:	6848      	and      	r1, r2
    34e6:	3940      	cmpnei      	r1, 0
    34e8:	0bd5      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CDD)==EPT_CDD)					//Down-Counting phase CNT = CMPD interrupt
    34ea:	3280      	movi      	r2, 128
    34ec:	9335      	ld.w      	r1, (r3, 0x54)
    34ee:	4248      	lsli      	r2, r2, 8
    34f0:	6848      	and      	r1, r2
    34f2:	3940      	cmpnei      	r1, 0
    34f4:	0bcf      	bt      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)				//End of cycle interrupt
    34f6:	3280      	movi      	r2, 128
    34f8:	9335      	ld.w      	r1, (r3, 0x54)
    34fa:	4249      	lsli      	r2, r2, 9
    34fc:	6848      	and      	r1, r2
    34fe:	3940      	cmpnei      	r1, 0
    3500:	0f9d      	bf      	0x343a	// 343a <EPT0IntHandler+0x62>
    3502:	07c8      	br      	0x3492	// 3492 <EPT0IntHandler+0xba>
	else if((EPT0->EMMISR&EPT_EP1_EMINT)==EPT_EP1_EMINT)	//interrupt flag of EP1 event
    3504:	932b      	ld.w      	r1, (r3, 0x2c)
    3506:	3002      	movi      	r0, 2
    3508:	6840      	and      	r1, r0
    350a:	3940      	cmpnei      	r1, 0
    350c:	0b9f      	bt      	0x344a	// 344a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP2_EMINT)==EPT_EP2_EMINT)	//interrupt flag of EP2 event
    350e:	932b      	ld.w      	r1, (r3, 0x2c)
    3510:	3004      	movi      	r0, 4
    3512:	6840      	and      	r1, r0
    3514:	3940      	cmpnei      	r1, 0
    3516:	0b9a      	bt      	0x344a	// 344a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP3_EMINT)==EPT_EP3_EMINT)	//interrupt flag of EP3 event
    3518:	932b      	ld.w      	r1, (r3, 0x2c)
    351a:	3008      	movi      	r0, 8
    351c:	6840      	and      	r1, r0
    351e:	3940      	cmpnei      	r1, 0
    3520:	0b95      	bt      	0x344a	// 344a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP4_EMINT)==EPT_EP4_EMINT)	//interrupt flag of EP4 event
    3522:	932b      	ld.w      	r1, (r3, 0x2c)
    3524:	3010      	movi      	r0, 16
    3526:	6840      	and      	r1, r0
    3528:	3940      	cmpnei      	r1, 0
    352a:	0b90      	bt      	0x344a	// 344a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP5_EMINT)==EPT_EP5_EMINT)	//interrupt flag of EP5 event
    352c:	932b      	ld.w      	r1, (r3, 0x2c)
    352e:	3020      	movi      	r0, 32
    3530:	6840      	and      	r1, r0
    3532:	3940      	cmpnei      	r1, 0
    3534:	0b8b      	bt      	0x344a	// 344a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)	//interrupt flag of EP6 event
    3536:	932b      	ld.w      	r1, (r3, 0x2c)
    3538:	3040      	movi      	r0, 64
    353a:	6840      	and      	r1, r0
    353c:	3940      	cmpnei      	r1, 0
    353e:	0b86      	bt      	0x344a	// 344a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP7_EMINT)==EPT_EP7_EMINT)	//interrupt flag of EP7 event
    3540:	932b      	ld.w      	r1, (r3, 0x2c)
    3542:	6848      	and      	r1, r2
    3544:	3940      	cmpnei      	r1, 0
    3546:	0c03      	bf      	0x354c	// 354c <EPT0IntHandler+0x174>
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
    3548:	b34d      	st.w      	r2, (r3, 0x34)
}
    354a:	0781      	br      	0x344c	// 344c <EPT0IntHandler+0x74>
	else if((EPT0->EMMISR&EPT_CPU_FAULT_EMINT)==EPT_CPU_FAULT_EMINT)	//interrupt flag of CPU_FAULT event
    354c:	3280      	movi      	r2, 128
    354e:	932b      	ld.w      	r1, (r3, 0x2c)
    3550:	4241      	lsli      	r2, r2, 1
    3552:	6848      	and      	r1, r2
    3554:	3940      	cmpnei      	r1, 0
    3556:	0bf9      	bt      	0x3548	// 3548 <EPT0IntHandler+0x170>
	else if((EPT0->EMMISR&EPT_MEM_FAULT_EMINT)==EPT_MEM_FAULT_EMINT)	//interrupt flag of MEM_FAULT event
    3558:	3280      	movi      	r2, 128
    355a:	932b      	ld.w      	r1, (r3, 0x2c)
    355c:	4242      	lsli      	r2, r2, 2
    355e:	6848      	and      	r1, r2
    3560:	3940      	cmpnei      	r1, 0
    3562:	0bf3      	bt      	0x3548	// 3548 <EPT0IntHandler+0x170>
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)	//interrupt flag of EOM_FAULT event
    3564:	3280      	movi      	r2, 128
    3566:	932b      	ld.w      	r1, (r3, 0x2c)
    3568:	4243      	lsli      	r2, r2, 3
    356a:	6848      	and      	r1, r2
    356c:	3940      	cmpnei      	r1, 0
    356e:	0bed      	bt      	0x3548	// 3548 <EPT0IntHandler+0x170>
    3570:	076e      	br      	0x344c	// 344c <EPT0IntHandler+0x74>
    3572:	0000      	bkpt
    3574:	20000020 	.long	0x20000020
    3578:	200001f0 	.long	0x200001f0
    357c:	200001e8 	.long	0x200001e8

Disassembly of section .text.WWDTHandler:

00003580 <WWDTHandler>:
//WWDT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void WWDTHandler(void)
{
    3580:	1460      	nie
    3582:	1462      	ipush
    3584:	14d2      	push      	r4-r5, r15
	WWDT->ICR=0X01;
    3586:	10ab      	lrw      	r5, 0x20000010	// 35b0 <WWDTHandler+0x30>
    3588:	3401      	movi      	r4, 1
    358a:	9560      	ld.w      	r3, (r5, 0x0)
    358c:	b385      	st.w      	r4, (r3, 0x14)
	WWDT_CNT_Load(0xFF);
    358e:	30ff      	movi      	r0, 255
    3590:	e3fffcc2 	bsr      	0x2f14	// 2f14 <WWDT_CNT_Load>
	if((WWDT->MISR&WWDT_EVI)==WWDT_EVI)					//WWDT EVI interrupt
    3594:	9540      	ld.w      	r2, (r5, 0x0)
    3596:	9263      	ld.w      	r3, (r2, 0xc)
    3598:	68d0      	and      	r3, r4
    359a:	3b40      	cmpnei      	r3, 0
    359c:	0c02      	bf      	0x35a0	// 35a0 <WWDTHandler+0x20>
	{
		WWDT->ICR = WWDT_EVI;
    359e:	b285      	st.w      	r4, (r2, 0x14)
	} 
}
    35a0:	d9ee2002 	ld.w      	r15, (r14, 0x8)
    35a4:	98a1      	ld.w      	r5, (r14, 0x4)
    35a6:	9880      	ld.w      	r4, (r14, 0x0)
    35a8:	1403      	addi      	r14, r14, 12
    35aa:	1463      	ipop
    35ac:	1461      	nir
    35ae:	0000      	bkpt
    35b0:	20000010 	.long	0x20000010

Disassembly of section .text.GPT0IntHandler:

000035b4 <GPT0IntHandler>:
//GPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT0IntHandler(void) 
{
    35b4:	1460      	nie
    35b6:	1462      	ipush
    // ISR content ...
	if((GPT0->MISR&GPT_INT_TRGEV0)==GPT_INT_TRGEV0)			//TRGEV0 interrupt
    35b8:	107e      	lrw      	r3, 0x20000024	// 3630 <GPT0IntHandler+0x7c>
    35ba:	3101      	movi      	r1, 1
    35bc:	9360      	ld.w      	r3, (r3, 0x0)
    35be:	237f      	addi      	r3, 128
    35c0:	9355      	ld.w      	r2, (r3, 0x54)
    35c2:	6884      	and      	r2, r1
    35c4:	3a40      	cmpnei      	r2, 0
    35c6:	0c04      	bf      	0x35ce	// 35ce <GPT0IntHandler+0x1a>
	{
		GPT0->ICR = GPT_INT_CAPLD0;
	}
	else if((GPT0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)		//Capture Load to CMPB interrupt
	{
		GPT0->ICR = GPT_INT_CAPLD1;
    35c8:	b337      	st.w      	r1, (r3, 0x5c)
	}
	else if((GPT0->MISR&GPT_INT_PEND)==GPT_INT_PEND)		//End of cycle interrupt 
	{
		GPT0->ICR = GPT_INT_PEND;
	}
}
    35ca:	1463      	ipop
    35cc:	1461      	nir
	else if((GPT0->MISR&GPT_INT_TRGEV1)==GPT_INT_TRGEV1)	//TRGEV1 interrupt
    35ce:	9355      	ld.w      	r2, (r3, 0x54)
    35d0:	3102      	movi      	r1, 2
    35d2:	6884      	and      	r2, r1
    35d4:	3a40      	cmpnei      	r2, 0
    35d6:	0bf9      	bt      	0x35c8	// 35c8 <GPT0IntHandler+0x14>
	else if((GPT0->MISR&GPT_INT_CAPLD0)==GPT_INT_CAPLD0)		//Capture Load to CMPA interrupt
    35d8:	9355      	ld.w      	r2, (r3, 0x54)
    35da:	3110      	movi      	r1, 16
    35dc:	6884      	and      	r2, r1
    35de:	3a40      	cmpnei      	r2, 0
    35e0:	0bf4      	bt      	0x35c8	// 35c8 <GPT0IntHandler+0x14>
	else if((GPT0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)		//Capture Load to CMPB interrupt
    35e2:	9355      	ld.w      	r2, (r3, 0x54)
    35e4:	3120      	movi      	r1, 32
    35e6:	6884      	and      	r2, r1
    35e8:	3a40      	cmpnei      	r2, 0
    35ea:	0bef      	bt      	0x35c8	// 35c8 <GPT0IntHandler+0x14>
	else if((GPT0->MISR&GPT_INT_CAU)==GPT_INT_CAU)			//Up-Counting phase CNT = CMPA Interrupt
    35ec:	3280      	movi      	r2, 128
    35ee:	9335      	ld.w      	r1, (r3, 0x54)
    35f0:	4241      	lsli      	r2, r2, 1
    35f2:	6848      	and      	r1, r2
    35f4:	3940      	cmpnei      	r1, 0
    35f6:	0c03      	bf      	0x35fc	// 35fc <GPT0IntHandler+0x48>
		GPT0->ICR = GPT_INT_PEND;
    35f8:	b357      	st.w      	r2, (r3, 0x5c)
}
    35fa:	07e8      	br      	0x35ca	// 35ca <GPT0IntHandler+0x16>
	else if((GPT0->MISR&GPT_INT_CAD)==GPT_INT_CAD)			//Down-Counting phase CNT = CMPA Interrupt
    35fc:	3280      	movi      	r2, 128
    35fe:	9335      	ld.w      	r1, (r3, 0x54)
    3600:	4242      	lsli      	r2, r2, 2
    3602:	6848      	and      	r1, r2
    3604:	3940      	cmpnei      	r1, 0
    3606:	0bf9      	bt      	0x35f8	// 35f8 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_CBU)==GPT_INT_CBU)			//Up-Counting phase CNT = CMPB Interrupt
    3608:	3280      	movi      	r2, 128
    360a:	9335      	ld.w      	r1, (r3, 0x54)
    360c:	4243      	lsli      	r2, r2, 3
    360e:	6848      	and      	r1, r2
    3610:	3940      	cmpnei      	r1, 0
    3612:	0bf3      	bt      	0x35f8	// 35f8 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_CBD)==GPT_INT_CBD)			//Down-Counting phase CNT = CMPB Interrupt
    3614:	3280      	movi      	r2, 128
    3616:	9335      	ld.w      	r1, (r3, 0x54)
    3618:	4244      	lsli      	r2, r2, 4
    361a:	6848      	and      	r1, r2
    361c:	3940      	cmpnei      	r1, 0
    361e:	0bed      	bt      	0x35f8	// 35f8 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_PEND)==GPT_INT_PEND)		//End of cycle interrupt 
    3620:	3280      	movi      	r2, 128
    3622:	9335      	ld.w      	r1, (r3, 0x54)
    3624:	4249      	lsli      	r2, r2, 9
    3626:	6848      	and      	r1, r2
    3628:	3940      	cmpnei      	r1, 0
    362a:	0be7      	bt      	0x35f8	// 35f8 <GPT0IntHandler+0x44>
    362c:	07cf      	br      	0x35ca	// 35ca <GPT0IntHandler+0x16>
    362e:	0000      	bkpt
    3630:	20000024 	.long	0x20000024

Disassembly of section .text.RTCIntHandler:

00003634 <RTCIntHandler>:
//RTC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void RTCIntHandler(void) 
{
    3634:	1460      	nie
    3636:	1462      	ipush
    // ISR content ...
	if((RTC->MISR&ALRA_INT)==ALRA_INT)			//Interrupt of alarm A
    3638:	1079      	lrw      	r3, 0x20000018	// 369c <RTCIntHandler+0x68>
    363a:	3101      	movi      	r1, 1
    363c:	9360      	ld.w      	r3, (r3, 0x0)
    363e:	934a      	ld.w      	r2, (r3, 0x28)
    3640:	6884      	and      	r2, r1
    3642:	3a40      	cmpnei      	r2, 0
    3644:	0c14      	bf      	0x366c	// 366c <RTCIntHandler+0x38>
	{
		RTC->ICR=ALRA_INT;
		RTC->KEY=0XCA53;
    3646:	1057      	lrw      	r2, 0xca53	// 36a0 <RTCIntHandler+0x6c>
		RTC->ICR=ALRA_INT;
    3648:	b32b      	st.w      	r1, (r3, 0x2c)
		RTC->KEY=0XCA53;
    364a:	b34c      	st.w      	r2, (r3, 0x30)
		RTC->CR=RTC->CR|0x01;
    364c:	9342      	ld.w      	r2, (r3, 0x8)
    364e:	6c84      	or      	r2, r1
    3650:	b342      	st.w      	r2, (r3, 0x8)
		RTC->TIMR=(0x10<<16)|(0x00<<8)|(0x00);			//Hour bit6->0:am 1:pm	
    3652:	3280      	movi      	r2, 128
    3654:	424d      	lsli      	r2, r2, 13
    3656:	b340      	st.w      	r2, (r3, 0x0)
		while(RTC->CR&0x02);							//busy TIMR DATR ALRAR ALRBR Update done
    3658:	3102      	movi      	r1, 2
    365a:	9342      	ld.w      	r2, (r3, 0x8)
    365c:	6884      	and      	r2, r1
    365e:	3a40      	cmpnei      	r2, 0
    3660:	0bfd      	bt      	0x365a	// 365a <RTCIntHandler+0x26>
		RTC->CR &= ~0x1;
    3662:	9342      	ld.w      	r2, (r3, 0x8)
    3664:	3a80      	bclri      	r2, 0
    3666:	b342      	st.w      	r2, (r3, 0x8)
	}
	else if((RTC->MISR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)		//Interrupt of trigger event 1
	{
		RTC->ICR=RTC_TRGEV1_INT;
	}
}
    3668:	1463      	ipop
    366a:	1461      	nir
	else if((RTC->MISR&ALRB_INT)==ALRB_INT)			//Interrupt of alarm B				
    366c:	934a      	ld.w      	r2, (r3, 0x28)
    366e:	3102      	movi      	r1, 2
    3670:	6884      	and      	r2, r1
    3672:	3a40      	cmpnei      	r2, 0
    3674:	0c03      	bf      	0x367a	// 367a <RTCIntHandler+0x46>
		RTC->ICR=RTC_TRGEV1_INT;
    3676:	b32b      	st.w      	r1, (r3, 0x2c)
}
    3678:	07f8      	br      	0x3668	// 3668 <RTCIntHandler+0x34>
	else if((RTC->MISR&CPRD_INT)==CPRD_INT)			//Interrupt of alarm CPRD
    367a:	934a      	ld.w      	r2, (r3, 0x28)
    367c:	3104      	movi      	r1, 4
    367e:	6884      	and      	r2, r1
    3680:	3a40      	cmpnei      	r2, 0
    3682:	0bfa      	bt      	0x3676	// 3676 <RTCIntHandler+0x42>
	else if((RTC->MISR&RTC_TRGEV0_INT)==RTC_TRGEV0_INT)		//Interrupt of trigger event 0
    3684:	934a      	ld.w      	r2, (r3, 0x28)
    3686:	3108      	movi      	r1, 8
    3688:	6884      	and      	r2, r1
    368a:	3a40      	cmpnei      	r2, 0
    368c:	0bf5      	bt      	0x3676	// 3676 <RTCIntHandler+0x42>
	else if((RTC->MISR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)		//Interrupt of trigger event 1
    368e:	934a      	ld.w      	r2, (r3, 0x28)
    3690:	3110      	movi      	r1, 16
    3692:	6884      	and      	r2, r1
    3694:	3a40      	cmpnei      	r2, 0
    3696:	0bf0      	bt      	0x3676	// 3676 <RTCIntHandler+0x42>
    3698:	07e8      	br      	0x3668	// 3668 <RTCIntHandler+0x34>
    369a:	0000      	bkpt
    369c:	20000018 	.long	0x20000018
    36a0:	0000ca53 	.long	0x0000ca53

Disassembly of section .text.UART0IntHandler:

000036a4 <UART0IntHandler>:
//UART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0IntHandler(void) 
{
    36a4:	1460      	nie
    36a6:	1462      	ipush
    // ISR content ...
	if ((UART0->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
    36a8:	106d      	lrw      	r3, 0x20000040	// 36dc <UART0IntHandler+0x38>
    36aa:	3102      	movi      	r1, 2
    36ac:	9360      	ld.w      	r3, (r3, 0x0)
    36ae:	9343      	ld.w      	r2, (r3, 0xc)
    36b0:	6884      	and      	r2, r1
    36b2:	3a40      	cmpnei      	r2, 0
    36b4:	0c03      	bf      	0x36ba	// 36ba <UART0IntHandler+0x16>
	{
		UART0->ISR=UART_RX_IOV_S;
	}
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART0->ISR=UART_TX_IOV_S;
    36b6:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    36b8:	0410      	br      	0x36d8	// 36d8 <UART0IntHandler+0x34>
	else if( (UART0->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    36ba:	9343      	ld.w      	r2, (r3, 0xc)
    36bc:	3101      	movi      	r1, 1
    36be:	6884      	and      	r2, r1
    36c0:	3a40      	cmpnei      	r2, 0
    36c2:	0bfa      	bt      	0x36b6	// 36b6 <UART0IntHandler+0x12>
	else if ((UART0->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
    36c4:	9343      	ld.w      	r2, (r3, 0xc)
    36c6:	3108      	movi      	r1, 8
    36c8:	6884      	and      	r2, r1
    36ca:	3a40      	cmpnei      	r2, 0
    36cc:	0bf5      	bt      	0x36b6	// 36b6 <UART0IntHandler+0x12>
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
    36ce:	9343      	ld.w      	r2, (r3, 0xc)
    36d0:	3104      	movi      	r1, 4
    36d2:	6884      	and      	r2, r1
    36d4:	3a40      	cmpnei      	r2, 0
    36d6:	0bf0      	bt      	0x36b6	// 36b6 <UART0IntHandler+0x12>
}
    36d8:	1463      	ipop
    36da:	1461      	nir
    36dc:	20000040 	.long	0x20000040

Disassembly of section .text.UART1IntHandler:

000036e0 <UART1IntHandler>:
//UART1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1IntHandler(void) 
{
    36e0:	1460      	nie
    36e2:	1462      	ipush
    // ISR content ...
	if ((UART1->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
    36e4:	106d      	lrw      	r3, 0x2000003c	// 3718 <UART1IntHandler+0x38>
    36e6:	3102      	movi      	r1, 2
    36e8:	9360      	ld.w      	r3, (r3, 0x0)
    36ea:	9343      	ld.w      	r2, (r3, 0xc)
    36ec:	6884      	and      	r2, r1
    36ee:	3a40      	cmpnei      	r2, 0
    36f0:	0c03      	bf      	0x36f6	// 36f6 <UART1IntHandler+0x16>
	{
		UART1->ISR=UART_RX_IOV_S;
	}
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART1->ISR=UART_TX_IOV_S;
    36f2:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    36f4:	0410      	br      	0x3714	// 3714 <UART1IntHandler+0x34>
	else if( (UART1->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    36f6:	9343      	ld.w      	r2, (r3, 0xc)
    36f8:	3101      	movi      	r1, 1
    36fa:	6884      	and      	r2, r1
    36fc:	3a40      	cmpnei      	r2, 0
    36fe:	0bfa      	bt      	0x36f2	// 36f2 <UART1IntHandler+0x12>
	else if ((UART1->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
    3700:	9343      	ld.w      	r2, (r3, 0xc)
    3702:	3108      	movi      	r1, 8
    3704:	6884      	and      	r2, r1
    3706:	3a40      	cmpnei      	r2, 0
    3708:	0bf5      	bt      	0x36f2	// 36f2 <UART1IntHandler+0x12>
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
    370a:	9343      	ld.w      	r2, (r3, 0xc)
    370c:	3104      	movi      	r1, 4
    370e:	6884      	and      	r2, r1
    3710:	3a40      	cmpnei      	r2, 0
    3712:	0bf0      	bt      	0x36f2	// 36f2 <UART1IntHandler+0x12>
}
    3714:	1463      	ipop
    3716:	1461      	nir
    3718:	2000003c 	.long	0x2000003c

Disassembly of section .text.UART2IntHandler:

0000371c <UART2IntHandler>:
//UART2 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART2IntHandler(void) 
{
    371c:	1460      	nie
    371e:	1462      	ipush
    // ISR content ...
	if ((UART2->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
    3720:	106d      	lrw      	r3, 0x20000038	// 3754 <UART2IntHandler+0x38>
    3722:	3102      	movi      	r1, 2
    3724:	9360      	ld.w      	r3, (r3, 0x0)
    3726:	9343      	ld.w      	r2, (r3, 0xc)
    3728:	6884      	and      	r2, r1
    372a:	3a40      	cmpnei      	r2, 0
    372c:	0c03      	bf      	0x3732	// 3732 <UART2IntHandler+0x16>
	{
		UART2->ISR=UART_RX_IOV_S;
	}
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART2->ISR=UART_TX_IOV_S;
    372e:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    3730:	0410      	br      	0x3750	// 3750 <UART2IntHandler+0x34>
	else if( (UART2->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    3732:	9343      	ld.w      	r2, (r3, 0xc)
    3734:	3101      	movi      	r1, 1
    3736:	6884      	and      	r2, r1
    3738:	3a40      	cmpnei      	r2, 0
    373a:	0bfa      	bt      	0x372e	// 372e <UART2IntHandler+0x12>
	else if ((UART2->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
    373c:	9343      	ld.w      	r2, (r3, 0xc)
    373e:	3108      	movi      	r1, 8
    3740:	6884      	and      	r2, r1
    3742:	3a40      	cmpnei      	r2, 0
    3744:	0bf5      	bt      	0x372e	// 372e <UART2IntHandler+0x12>
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
    3746:	9343      	ld.w      	r2, (r3, 0xc)
    3748:	3104      	movi      	r1, 4
    374a:	6884      	and      	r2, r1
    374c:	3a40      	cmpnei      	r2, 0
    374e:	0bf0      	bt      	0x372e	// 372e <UART2IntHandler+0x12>
}
    3750:	1463      	ipop
    3752:	1461      	nir
    3754:	20000038 	.long	0x20000038

Disassembly of section .text.SPI0IntHandler:

00003758 <SPI0IntHandler>:
//SPI Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SPI0IntHandler(void) 
{
    3758:	1460      	nie
    375a:	1462      	ipush
    // ISR content ...
	if((SPI0->MISR&SPI_PORIM)==SPI_PORIM)					//Receive Overrun Interrupt
    375c:	1178      	lrw      	r3, 0x20000034	// 383c <SPI0IntHandler+0xe4>
    375e:	3101      	movi      	r1, 1
    3760:	9360      	ld.w      	r3, (r3, 0x0)
    3762:	9347      	ld.w      	r2, (r3, 0x1c)
    3764:	6884      	and      	r2, r1
    3766:	3a40      	cmpnei      	r2, 0
    3768:	0c03      	bf      	0x376e	// 376e <SPI0IntHandler+0x16>
			}
		}
	}
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
	{
		SPI0->ICR = SPI_TXIM;
    376a:	b328      	st.w      	r1, (r3, 0x20)
	}

}
    376c:	0407      	br      	0x377a	// 377a <SPI0IntHandler+0x22>
	else if((SPI0->MISR&SPI_RTIM)==SPI_RTIM)				//Receive Timeout Interrupt
    376e:	9347      	ld.w      	r2, (r3, 0x1c)
    3770:	3002      	movi      	r0, 2
    3772:	6880      	and      	r2, r0
    3774:	3a40      	cmpnei      	r2, 0
    3776:	0c04      	bf      	0x377e	// 377e <SPI0IntHandler+0x26>
		SPI0->ICR = SPI_RTIM;
    3778:	b308      	st.w      	r0, (r3, 0x20)
}
    377a:	1463      	ipop
    377c:	1461      	nir
	else if((SPI0->MISR&SPI_RXIM)==SPI_RXIM)				//Receive FIFO Interrupt,FIFO can be set 1/8,1/4,1/2 FIFO Interrupt
    377e:	9347      	ld.w      	r2, (r3, 0x1c)
    3780:	3004      	movi      	r0, 4
    3782:	6880      	and      	r2, r0
    3784:	3a40      	cmpnei      	r2, 0
    3786:	0c55      	bf      	0x3830	// 3830 <SPI0IntHandler+0xd8>
		SPI0->ICR = SPI_RXIM;
    3788:	b308      	st.w      	r0, (r3, 0x20)
		if(SPI0->DR==0xaa)
    378a:	9302      	ld.w      	r0, (r3, 0x8)
    378c:	32aa      	movi      	r2, 170
    378e:	6482      	cmpne      	r0, r2
    3790:	083e      	bt      	0x380c	// 380c <SPI0IntHandler+0xb4>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    3792:	3102      	movi      	r1, 2
    3794:	9343      	ld.w      	r2, (r3, 0xc)
    3796:	6884      	and      	r2, r1
    3798:	3a40      	cmpnei      	r2, 0
    379a:	0ffd      	bf      	0x3794	// 3794 <SPI0IntHandler+0x3c>
			SPI0->DR = 0x11;
    379c:	3211      	movi      	r2, 17
    379e:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    37a0:	3110      	movi      	r1, 16
    37a2:	9343      	ld.w      	r2, (r3, 0xc)
    37a4:	6884      	and      	r2, r1
    37a6:	3a40      	cmpnei      	r2, 0
    37a8:	0bfd      	bt      	0x37a2	// 37a2 <SPI0IntHandler+0x4a>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    37aa:	3102      	movi      	r1, 2
    37ac:	9343      	ld.w      	r2, (r3, 0xc)
    37ae:	6884      	and      	r2, r1
    37b0:	3a40      	cmpnei      	r2, 0
    37b2:	0ffd      	bf      	0x37ac	// 37ac <SPI0IntHandler+0x54>
			SPI0->DR = 0x12;
    37b4:	3212      	movi      	r2, 18
    37b6:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    37b8:	3110      	movi      	r1, 16
    37ba:	9343      	ld.w      	r2, (r3, 0xc)
    37bc:	6884      	and      	r2, r1
    37be:	3a40      	cmpnei      	r2, 0
    37c0:	0bfd      	bt      	0x37ba	// 37ba <SPI0IntHandler+0x62>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    37c2:	3102      	movi      	r1, 2
    37c4:	9343      	ld.w      	r2, (r3, 0xc)
    37c6:	6884      	and      	r2, r1
    37c8:	3a40      	cmpnei      	r2, 0
    37ca:	0ffd      	bf      	0x37c4	// 37c4 <SPI0IntHandler+0x6c>
			SPI0->DR = 0x13;
    37cc:	3213      	movi      	r2, 19
    37ce:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    37d0:	3110      	movi      	r1, 16
    37d2:	9343      	ld.w      	r2, (r3, 0xc)
    37d4:	6884      	and      	r2, r1
    37d6:	3a40      	cmpnei      	r2, 0
    37d8:	0bfd      	bt      	0x37d2	// 37d2 <SPI0IntHandler+0x7a>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    37da:	3102      	movi      	r1, 2
    37dc:	9343      	ld.w      	r2, (r3, 0xc)
    37de:	6884      	and      	r2, r1
    37e0:	3a40      	cmpnei      	r2, 0
    37e2:	0ffd      	bf      	0x37dc	// 37dc <SPI0IntHandler+0x84>
			SPI0->DR = 0x14;
    37e4:	3214      	movi      	r2, 20
    37e6:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    37e8:	3110      	movi      	r1, 16
    37ea:	9343      	ld.w      	r2, (r3, 0xc)
    37ec:	6884      	and      	r2, r1
    37ee:	3a40      	cmpnei      	r2, 0
    37f0:	0bfd      	bt      	0x37ea	// 37ea <SPI0IntHandler+0x92>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    37f2:	3102      	movi      	r1, 2
    37f4:	9343      	ld.w      	r2, (r3, 0xc)
    37f6:	6884      	and      	r2, r1
    37f8:	3a40      	cmpnei      	r2, 0
    37fa:	0ffd      	bf      	0x37f4	// 37f4 <SPI0IntHandler+0x9c>
			SPI0->DR = 0x15;
    37fc:	3215      	movi      	r2, 21
    37fe:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    3800:	3110      	movi      	r1, 16
    3802:	9343      	ld.w      	r2, (r3, 0xc)
    3804:	6884      	and      	r2, r1
    3806:	3a40      	cmpnei      	r2, 0
    3808:	0bfd      	bt      	0x3802	// 3802 <SPI0IntHandler+0xaa>
    380a:	07b8      	br      	0x377a	// 377a <SPI0IntHandler+0x22>
			if(((SPI0->SR) & SSP_TFE)!=SSP_TFE)
    380c:	9343      	ld.w      	r2, (r3, 0xc)
    380e:	6884      	and      	r2, r1
    3810:	3a40      	cmpnei      	r2, 0
    3812:	0bb4      	bt      	0x377a	// 377a <SPI0IntHandler+0x22>
				SPI0->DR=0x0;								//FIFO=0
    3814:	b342      	st.w      	r2, (r3, 0x8)
				while(((SPI0->SR) & SSP_BSY) == SSP_BSY);		//Send or receive over？
    3816:	3110      	movi      	r1, 16
				SPI0->DR=0x0;								//FIFO=0
    3818:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    381a:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    381c:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    381e:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    3820:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    3822:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    3824:	b342      	st.w      	r2, (r3, 0x8)
				while(((SPI0->SR) & SSP_BSY) == SSP_BSY);		//Send or receive over？
    3826:	9343      	ld.w      	r2, (r3, 0xc)
    3828:	6884      	and      	r2, r1
    382a:	3a40      	cmpnei      	r2, 0
    382c:	0bfd      	bt      	0x3826	// 3826 <SPI0IntHandler+0xce>
    382e:	07a6      	br      	0x377a	// 377a <SPI0IntHandler+0x22>
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
    3830:	9347      	ld.w      	r2, (r3, 0x1c)
    3832:	3108      	movi      	r1, 8
    3834:	6884      	and      	r2, r1
    3836:	3a40      	cmpnei      	r2, 0
    3838:	0b99      	bt      	0x376a	// 376a <SPI0IntHandler+0x12>
    383a:	07a0      	br      	0x377a	// 377a <SPI0IntHandler+0x22>
    383c:	20000034 	.long	0x20000034

Disassembly of section .text.SIO0IntHandler:

00003840 <SIO0IntHandler>:
//SIO Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SIO0IntHandler(void) 
{
    3840:	1460      	nie
    3842:	1462      	ipush
		delay_nms(10);
		SIO0->TXBUF=(0x03<<30)|(0x02<<28)|(0x03<<26)|(0x02<<24)|(0x03<<22)|(0x02<<20)|(0x03<<18)|(0x02<<16)|
				(0x01<<14)|(0x00<<12)|(0x01<<10)|(0x00<<8)|(0x01<<6)|(0x00<<4)|(0x01<<2)|(0x0<<0);		//0:D0,1:D1,2:DL,3:DH;	
	}*/
	
	if(SIO0->MISR&0X02)					//RXDNE
    3844:	107d      	lrw      	r3, 0x2000002c	// 38b8 <SIO0IntHandler+0x78>
    3846:	3102      	movi      	r1, 2
    3848:	9360      	ld.w      	r3, (r3, 0x0)
    384a:	9349      	ld.w      	r2, (r3, 0x24)
    384c:	6884      	and      	r2, r1
    384e:	3a40      	cmpnei      	r2, 0
    3850:	0c13      	bf      	0x3876	// 3876 <SIO0IntHandler+0x36>
	{
		SIO0->ICR=0X02;
    3852:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count>=1)
    3854:	101a      	lrw      	r0, 0x200001f4	// 38bc <SIO0IntHandler+0x7c>
    3856:	9040      	ld.w      	r2, (r0, 0x0)
    3858:	3a20      	cmplti      	r2, 1
    385a:	080c      	bt      	0x3872	// 3872 <SIO0IntHandler+0x32>
		{
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF&0xff000000;			//8bit
    385c:	9040      	ld.w      	r2, (r0, 0x0)
    385e:	9327      	ld.w      	r1, (r3, 0x1c)
    3860:	4938      	lsri      	r1, r1, 24
    3862:	4262      	lsli      	r3, r2, 2
    3864:	1057      	lrw      	r2, 0x200001f8	// 38c0 <SIO0IntHandler+0x80>
    3866:	4138      	lsli      	r1, r1, 24
    3868:	60c8      	addu      	r3, r2
    386a:	b320      	st.w      	r1, (r3, 0x0)
			nop;
    386c:	6c03      	mov      	r0, r0
			R_SIORX_count=0;
    386e:	3300      	movi      	r3, 0
    3870:	b060      	st.w      	r3, (r0, 0x0)
	}
	else if(SIO0->MISR&0X020)				//TIMEOUT
	{
		SIO0->ICR=0X20;
	}
}
    3872:	1463      	ipop
    3874:	1461      	nir
	else if(SIO0->MISR&0X08)					//RXBUFFULL	
    3876:	9349      	ld.w      	r2, (r3, 0x24)
    3878:	3108      	movi      	r1, 8
    387a:	6884      	and      	r2, r1
    387c:	3a40      	cmpnei      	r2, 0
    387e:	0c10      	bf      	0x389e	// 389e <SIO0IntHandler+0x5e>
		SIO0->ICR=0X08;
    3880:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count<1)
    3882:	102f      	lrw      	r1, 0x200001f4	// 38bc <SIO0IntHandler+0x7c>
    3884:	9140      	ld.w      	r2, (r1, 0x0)
    3886:	3a20      	cmplti      	r2, 1
    3888:	0ff5      	bf      	0x3872	// 3872 <SIO0IntHandler+0x32>
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF;				//32bit
    388a:	9140      	ld.w      	r2, (r1, 0x0)
    388c:	9307      	ld.w      	r0, (r3, 0x1c)
    388e:	4262      	lsli      	r3, r2, 2
    3890:	104c      	lrw      	r2, 0x200001f8	// 38c0 <SIO0IntHandler+0x80>
    3892:	60c8      	addu      	r3, r2
    3894:	b300      	st.w      	r0, (r3, 0x0)
			R_SIORX_count++;
    3896:	9160      	ld.w      	r3, (r1, 0x0)
    3898:	2300      	addi      	r3, 1
    389a:	b160      	st.w      	r3, (r1, 0x0)
    389c:	07eb      	br      	0x3872	// 3872 <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X010)				//BREAK
    389e:	9349      	ld.w      	r2, (r3, 0x24)
    38a0:	3110      	movi      	r1, 16
    38a2:	6884      	and      	r2, r1
    38a4:	3a40      	cmpnei      	r2, 0
    38a6:	0c03      	bf      	0x38ac	// 38ac <SIO0IntHandler+0x6c>
		SIO0->ICR=0X20;
    38a8:	b32b      	st.w      	r1, (r3, 0x2c)
}
    38aa:	07e4      	br      	0x3872	// 3872 <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X020)				//TIMEOUT
    38ac:	9349      	ld.w      	r2, (r3, 0x24)
    38ae:	3120      	movi      	r1, 32
    38b0:	6884      	and      	r2, r1
    38b2:	3a40      	cmpnei      	r2, 0
    38b4:	0bfa      	bt      	0x38a8	// 38a8 <SIO0IntHandler+0x68>
    38b6:	07de      	br      	0x3872	// 3872 <SIO0IntHandler+0x32>
    38b8:	2000002c 	.long	0x2000002c
    38bc:	200001f4 	.long	0x200001f4
    38c0:	200001f8 	.long	0x200001f8

Disassembly of section .text.EXI0IntHandler:

000038c4 <EXI0IntHandler>:
//EXT0/16 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0IntHandler(void) 
{
    38c4:	1460      	nie
    38c6:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 			//EXT0 Interrupt
    38c8:	106a      	lrw      	r3, 0x2000005c	// 38f0 <EXI0IntHandler+0x2c>
    38ca:	3101      	movi      	r1, 1
    38cc:	9360      	ld.w      	r3, (r3, 0x0)
    38ce:	237f      	addi      	r3, 128
    38d0:	934c      	ld.w      	r2, (r3, 0x30)
    38d2:	6884      	and      	r2, r1
    38d4:	3a40      	cmpnei      	r2, 0
    38d6:	0c04      	bf      	0x38de	// 38de <EXI0IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN0;
    38d8:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else if ((SYSCON->EXIRS&EXI_PIN16)==EXI_PIN16) 		//EXT16 Interrupt
	{
		SYSCON->EXICR = EXI_PIN16;
	}
}
    38da:	1463      	ipop
    38dc:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN16)==EXI_PIN16) 		//EXT16 Interrupt
    38de:	3280      	movi      	r2, 128
    38e0:	932c      	ld.w      	r1, (r3, 0x30)
    38e2:	4249      	lsli      	r2, r2, 9
    38e4:	6848      	and      	r1, r2
    38e6:	3940      	cmpnei      	r1, 0
    38e8:	0ff9      	bf      	0x38da	// 38da <EXI0IntHandler+0x16>
		SYSCON->EXICR = EXI_PIN16;
    38ea:	b34b      	st.w      	r2, (r3, 0x2c)
}
    38ec:	07f7      	br      	0x38da	// 38da <EXI0IntHandler+0x16>
    38ee:	0000      	bkpt
    38f0:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI1IntHandler:

000038f4 <EXI1IntHandler>:
//EXT1/17 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1IntHandler(void) 
{
    38f4:	1460      	nie
    38f6:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN1)==EXI_PIN1) 			//EXT1 Interrupt
    38f8:	106a      	lrw      	r3, 0x2000005c	// 3920 <EXI1IntHandler+0x2c>
    38fa:	3102      	movi      	r1, 2
    38fc:	9360      	ld.w      	r3, (r3, 0x0)
    38fe:	237f      	addi      	r3, 128
    3900:	934c      	ld.w      	r2, (r3, 0x30)
    3902:	6884      	and      	r2, r1
    3904:	3a40      	cmpnei      	r2, 0
    3906:	0c04      	bf      	0x390e	// 390e <EXI1IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN1;
    3908:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else if ((SYSCON->EXIRS&EXI_PIN17)==EXI_PIN17) 		//EXT17 Interrupt
	{
		SYSCON->EXICR = EXI_PIN17;
	}
}
    390a:	1463      	ipop
    390c:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN17)==EXI_PIN17) 		//EXT17 Interrupt
    390e:	3280      	movi      	r2, 128
    3910:	932c      	ld.w      	r1, (r3, 0x30)
    3912:	424a      	lsli      	r2, r2, 10
    3914:	6848      	and      	r1, r2
    3916:	3940      	cmpnei      	r1, 0
    3918:	0ff9      	bf      	0x390a	// 390a <EXI1IntHandler+0x16>
		SYSCON->EXICR = EXI_PIN17;
    391a:	b34b      	st.w      	r2, (r3, 0x2c)
}
    391c:	07f7      	br      	0x390a	// 390a <EXI1IntHandler+0x16>
    391e:	0000      	bkpt
    3920:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI2to3IntHandler:

00003924 <EXI2to3IntHandler>:
//EXI2~3 18~19Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2to3IntHandler(void) 
{
    3924:	1460      	nie
    3926:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 			//EXT2 Interrupt
    3928:	1070      	lrw      	r3, 0x2000005c	// 3968 <EXI2to3IntHandler+0x44>
    392a:	3104      	movi      	r1, 4
    392c:	9360      	ld.w      	r3, (r3, 0x0)
    392e:	237f      	addi      	r3, 128
    3930:	934c      	ld.w      	r2, (r3, 0x30)
    3932:	6884      	and      	r2, r1
    3934:	3a40      	cmpnei      	r2, 0
    3936:	0c04      	bf      	0x393e	// 393e <EXI2to3IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN2;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 		//EXT3 Interrupt
	{
		SYSCON->EXICR = EXI_PIN3;
    3938:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else if ((SYSCON->EXIRS&EXI_PIN19)==EXI_PIN19) 		//EXT19 Interrupt
	{
		SYSCON->EXICR = EXI_PIN19;
	}
}
    393a:	1463      	ipop
    393c:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 		//EXT3 Interrupt
    393e:	934c      	ld.w      	r2, (r3, 0x30)
    3940:	3108      	movi      	r1, 8
    3942:	6884      	and      	r2, r1
    3944:	3a40      	cmpnei      	r2, 0
    3946:	0bf9      	bt      	0x3938	// 3938 <EXI2to3IntHandler+0x14>
	else if ((SYSCON->EXIRS&EXI_PIN18)==EXI_PIN18) 		//EXT18 Interrupt
    3948:	3280      	movi      	r2, 128
    394a:	932c      	ld.w      	r1, (r3, 0x30)
    394c:	424b      	lsli      	r2, r2, 11
    394e:	6848      	and      	r1, r2
    3950:	3940      	cmpnei      	r1, 0
    3952:	0c03      	bf      	0x3958	// 3958 <EXI2to3IntHandler+0x34>
		SYSCON->EXICR = EXI_PIN19;
    3954:	b34b      	st.w      	r2, (r3, 0x2c)
}
    3956:	07f2      	br      	0x393a	// 393a <EXI2to3IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN19)==EXI_PIN19) 		//EXT19 Interrupt
    3958:	3280      	movi      	r2, 128
    395a:	932c      	ld.w      	r1, (r3, 0x30)
    395c:	424c      	lsli      	r2, r2, 12
    395e:	6848      	and      	r1, r2
    3960:	3940      	cmpnei      	r1, 0
    3962:	0bf9      	bt      	0x3954	// 3954 <EXI2to3IntHandler+0x30>
    3964:	07eb      	br      	0x393a	// 393a <EXI2to3IntHandler+0x16>
    3966:	0000      	bkpt
    3968:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI4to9IntHandler:

0000396c <EXI4to9IntHandler>:
//EXI4~9 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4to9IntHandler(void) 
{
    396c:	1460      	nie
    396e:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 			//EXT4 Interrupt
    3970:	1075      	lrw      	r3, 0x2000005c	// 39c4 <EXI4to9IntHandler+0x58>
    3972:	3280      	movi      	r2, 128
    3974:	9360      	ld.w      	r3, (r3, 0x0)
    3976:	60c8      	addu      	r3, r2
    3978:	932c      	ld.w      	r1, (r3, 0x30)
    397a:	3010      	movi      	r0, 16
    397c:	6840      	and      	r1, r0
    397e:	3940      	cmpnei      	r1, 0
    3980:	0c04      	bf      	0x3988	// 3988 <EXI4to9IntHandler+0x1c>
	{
		SYSCON->EXICR = EXI_PIN5;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 		//EXT6 Interrupt
	{
		SYSCON->EXICR = EXI_PIN6;
    3982:	b30b      	st.w      	r0, (r3, 0x2c)
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 		//EXT9 Interrupt
	{
		SYSCON->EXICR = EXI_PIN9;
	} 

}
    3984:	1463      	ipop
    3986:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 		//EXT5 Interrupt
    3988:	932c      	ld.w      	r1, (r3, 0x30)
    398a:	3020      	movi      	r0, 32
    398c:	6840      	and      	r1, r0
    398e:	3940      	cmpnei      	r1, 0
    3990:	0bf9      	bt      	0x3982	// 3982 <EXI4to9IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 		//EXT6 Interrupt
    3992:	932c      	ld.w      	r1, (r3, 0x30)
    3994:	3040      	movi      	r0, 64
    3996:	6840      	and      	r1, r0
    3998:	3940      	cmpnei      	r1, 0
    399a:	0bf4      	bt      	0x3982	// 3982 <EXI4to9IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 		//EXT7 Interrupt
    399c:	932c      	ld.w      	r1, (r3, 0x30)
    399e:	6848      	and      	r1, r2
    39a0:	3940      	cmpnei      	r1, 0
    39a2:	0c03      	bf      	0x39a8	// 39a8 <EXI4to9IntHandler+0x3c>
		SYSCON->EXICR = EXI_PIN9;
    39a4:	b34b      	st.w      	r2, (r3, 0x2c)
}
    39a6:	07ef      	br      	0x3984	// 3984 <EXI4to9IntHandler+0x18>
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 		//EXT8 Interrupt
    39a8:	3280      	movi      	r2, 128
    39aa:	932c      	ld.w      	r1, (r3, 0x30)
    39ac:	4241      	lsli      	r2, r2, 1
    39ae:	6848      	and      	r1, r2
    39b0:	3940      	cmpnei      	r1, 0
    39b2:	0bf9      	bt      	0x39a4	// 39a4 <EXI4to9IntHandler+0x38>
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 		//EXT9 Interrupt
    39b4:	3280      	movi      	r2, 128
    39b6:	932c      	ld.w      	r1, (r3, 0x30)
    39b8:	4242      	lsli      	r2, r2, 2
    39ba:	6848      	and      	r1, r2
    39bc:	3940      	cmpnei      	r1, 0
    39be:	0bf3      	bt      	0x39a4	// 39a4 <EXI4to9IntHandler+0x38>
    39c0:	07e2      	br      	0x3984	// 3984 <EXI4to9IntHandler+0x18>
    39c2:	0000      	bkpt
    39c4:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI10to15IntHandler:

000039c8 <EXI10to15IntHandler>:
//EXI4 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI10to15IntHandler(void) 
{
    39c8:	1460      	nie
    39ca:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN10)==EXI_PIN10) 			//EXT10 Interrupt
    39cc:	1076      	lrw      	r3, 0x2000005c	// 3a24 <EXI10to15IntHandler+0x5c>
    39ce:	3280      	movi      	r2, 128
    39d0:	9360      	ld.w      	r3, (r3, 0x0)
    39d2:	237f      	addi      	r3, 128
    39d4:	932c      	ld.w      	r1, (r3, 0x30)
    39d6:	4243      	lsli      	r2, r2, 3
    39d8:	6848      	and      	r1, r2
    39da:	3940      	cmpnei      	r1, 0
    39dc:	0c03      	bf      	0x39e2	// 39e2 <EXI10to15IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN14;
	}
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 		//EXT15 Interrupt
	{
		SYSCON->EXICR = EXI_PIN15;
    39de:	b34b      	st.w      	r2, (r3, 0x2c)
	}
}
    39e0:	041f      	br      	0x3a1e	// 3a1e <EXI10to15IntHandler+0x56>
	else if ((SYSCON->EXIRS&EXI_PIN11)==EXI_PIN11) 		//EXT11 Interrupt
    39e2:	3280      	movi      	r2, 128
    39e4:	932c      	ld.w      	r1, (r3, 0x30)
    39e6:	4244      	lsli      	r2, r2, 4
    39e8:	6848      	and      	r1, r2
    39ea:	3940      	cmpnei      	r1, 0
    39ec:	0bf9      	bt      	0x39de	// 39de <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN12)==EXI_PIN12) 		//EXT12 Interrupt
    39ee:	3280      	movi      	r2, 128
    39f0:	932c      	ld.w      	r1, (r3, 0x30)
    39f2:	4245      	lsli      	r2, r2, 5
    39f4:	6848      	and      	r1, r2
    39f6:	3940      	cmpnei      	r1, 0
    39f8:	0bf3      	bt      	0x39de	// 39de <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 		//EXT13 Interrupt
    39fa:	3280      	movi      	r2, 128
    39fc:	932c      	ld.w      	r1, (r3, 0x30)
    39fe:	4246      	lsli      	r2, r2, 6
    3a00:	6848      	and      	r1, r2
    3a02:	3940      	cmpnei      	r1, 0
    3a04:	0bed      	bt      	0x39de	// 39de <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN14)==EXI_PIN14) 		//EXT14 Interrupt
    3a06:	3280      	movi      	r2, 128
    3a08:	932c      	ld.w      	r1, (r3, 0x30)
    3a0a:	4247      	lsli      	r2, r2, 7
    3a0c:	6848      	and      	r1, r2
    3a0e:	3940      	cmpnei      	r1, 0
    3a10:	0be7      	bt      	0x39de	// 39de <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 		//EXT15 Interrupt
    3a12:	3280      	movi      	r2, 128
    3a14:	932c      	ld.w      	r1, (r3, 0x30)
    3a16:	4248      	lsli      	r2, r2, 8
    3a18:	6848      	and      	r1, r2
    3a1a:	3940      	cmpnei      	r1, 0
    3a1c:	0be1      	bt      	0x39de	// 39de <EXI10to15IntHandler+0x16>
}
    3a1e:	1463      	ipop
    3a20:	1461      	nir
    3a22:	0000      	bkpt
    3a24:	2000005c 	.long	0x2000005c

Disassembly of section .text.LPTIntHandler:

00003a28 <LPTIntHandler>:
//LPT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void LPTIntHandler(void) 
{
    3a28:	1460      	nie
    3a2a:	1462      	ipush
    // ISR content ...
	if((LPT->MISR&LPT_TRGEV0)==LPT_TRGEV0)			//TRGEV0 interrupt
    3a2c:	106b      	lrw      	r3, 0x20000014	// 3a58 <LPTIntHandler+0x30>
    3a2e:	3101      	movi      	r1, 1
    3a30:	9360      	ld.w      	r3, (r3, 0x0)
    3a32:	934e      	ld.w      	r2, (r3, 0x38)
    3a34:	6884      	and      	r2, r1
    3a36:	3a40      	cmpnei      	r2, 0
    3a38:	0c03      	bf      	0x3a3e	// 3a3e <LPTIntHandler+0x16>
	{
		LPT->ICR = LPT_MATCH;
	}
	else if((LPT->MISR&LPT_PEND)==LPT_PEND)			//PEND interrupt
	{
		LPT->ICR = LPT_PEND;
    3a3a:	b330      	st.w      	r1, (r3, 0x40)
	}
}
    3a3c:	040b      	br      	0x3a52	// 3a52 <LPTIntHandler+0x2a>
	else if((LPT->MISR&LPT_MATCH)==LPT_MATCH)		//MATCH interrupt
    3a3e:	934e      	ld.w      	r2, (r3, 0x38)
    3a40:	3102      	movi      	r1, 2
    3a42:	6884      	and      	r2, r1
    3a44:	3a40      	cmpnei      	r2, 0
    3a46:	0bfa      	bt      	0x3a3a	// 3a3a <LPTIntHandler+0x12>
	else if((LPT->MISR&LPT_PEND)==LPT_PEND)			//PEND interrupt
    3a48:	934e      	ld.w      	r2, (r3, 0x38)
    3a4a:	3104      	movi      	r1, 4
    3a4c:	6884      	and      	r2, r1
    3a4e:	3a40      	cmpnei      	r2, 0
    3a50:	0bf5      	bt      	0x3a3a	// 3a3a <LPTIntHandler+0x12>
}
    3a52:	1463      	ipop
    3a54:	1461      	nir
    3a56:	0000      	bkpt
    3a58:	20000014 	.long	0x20000014

Disassembly of section .text.BT0IntHandler:

00003a5c <BT0IntHandler>:
//BT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0IntHandler(void) 
{
    3a5c:	1460      	nie
    3a5e:	1462      	ipush
    3a60:	14d0      	push      	r15
    // ISR content ...
	if((BT0->MISR&BT_PEND)==BT_PEND)				//BT0 PEND interrupt
    3a62:	1072      	lrw      	r3, 0x2000000c	// 3aa8 <BT0IntHandler+0x4c>
    3a64:	3101      	movi      	r1, 1
    3a66:	9360      	ld.w      	r3, (r3, 0x0)
    3a68:	934c      	ld.w      	r2, (r3, 0x30)
    3a6a:	6884      	and      	r2, r1
    3a6c:	3a40      	cmpnei      	r2, 0
    3a6e:	0c0b      	bf      	0x3a84	// 3a84 <BT0IntHandler+0x28>
	{
		BT0->ICR = BT_PEND;
    3a70:	b32d      	st.w      	r1, (r3, 0x34)
		//led_display();
		Task_Marks_Handler_Callback();
    3a72:	e000033b 	bsr      	0x40e8	// 40e8 <Task_Marks_Handler_Callback>
		task_key();
    3a76:	e0000221 	bsr      	0x3eb8	// 3eb8 <task_key>
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT0 Event trigger interrupt
	{
		BT0->ICR = BT_EVTRG;
	} 
}
    3a7a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    3a7e:	1401      	addi      	r14, r14, 4
    3a80:	1463      	ipop
    3a82:	1461      	nir
	else if((BT0->MISR&BT_CMP)==BT_CMP)				//BT0 CMP Match interrupt 
    3a84:	934c      	ld.w      	r2, (r3, 0x30)
    3a86:	3102      	movi      	r1, 2
    3a88:	6884      	and      	r2, r1
    3a8a:	3a40      	cmpnei      	r2, 0
    3a8c:	0c03      	bf      	0x3a92	// 3a92 <BT0IntHandler+0x36>
		BT0->ICR = BT_EVTRG;
    3a8e:	b32d      	st.w      	r1, (r3, 0x34)
}
    3a90:	07f5      	br      	0x3a7a	// 3a7a <BT0IntHandler+0x1e>
	else if((BT0->MISR&BT_OVF)==BT_OVF)				//BT0 OVF interrupt
    3a92:	934c      	ld.w      	r2, (r3, 0x30)
    3a94:	3104      	movi      	r1, 4
    3a96:	6884      	and      	r2, r1
    3a98:	3a40      	cmpnei      	r2, 0
    3a9a:	0bfa      	bt      	0x3a8e	// 3a8e <BT0IntHandler+0x32>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT0 Event trigger interrupt
    3a9c:	934c      	ld.w      	r2, (r3, 0x30)
    3a9e:	3108      	movi      	r1, 8
    3aa0:	6884      	and      	r2, r1
    3aa2:	3a40      	cmpnei      	r2, 0
    3aa4:	0bf5      	bt      	0x3a8e	// 3a8e <BT0IntHandler+0x32>
    3aa6:	07ea      	br      	0x3a7a	// 3a7a <BT0IntHandler+0x1e>
    3aa8:	2000000c 	.long	0x2000000c

Disassembly of section .text.BT1IntHandler:

00003aac <BT1IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1IntHandler(void) 
{
    3aac:	1460      	nie
    3aae:	1462      	ipush
    // ISR content ...
	if((BT1->MISR&BT_PEND)==BT_PEND)				//BT1 PEND interrupt
    3ab0:	106f      	lrw      	r3, 0x20000008	// 3aec <BT1IntHandler+0x40>
    3ab2:	3101      	movi      	r1, 1
    3ab4:	9360      	ld.w      	r3, (r3, 0x0)
    3ab6:	934c      	ld.w      	r2, (r3, 0x30)
    3ab8:	6884      	and      	r2, r1
    3aba:	3a40      	cmpnei      	r2, 0
    3abc:	0c03      	bf      	0x3ac2	// 3ac2 <BT1IntHandler+0x16>
	{
		BT1->ICR = BT_OVF;
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT1 Event trigger interrupt
	{
		BT1->ICR = BT_EVTRG;
    3abe:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    3ac0:	0409      	br      	0x3ad2	// 3ad2 <BT1IntHandler+0x26>
	else if((BT0->MISR&BT_CMP)==BT_CMP)				//BT1 CMP Match interrupt 
    3ac2:	104c      	lrw      	r2, 0x2000000c	// 3af0 <BT1IntHandler+0x44>
    3ac4:	3002      	movi      	r0, 2
    3ac6:	9240      	ld.w      	r2, (r2, 0x0)
    3ac8:	922c      	ld.w      	r1, (r2, 0x30)
    3aca:	6840      	and      	r1, r0
    3acc:	3940      	cmpnei      	r1, 0
    3ace:	0c04      	bf      	0x3ad6	// 3ad6 <BT1IntHandler+0x2a>
		BT1->ICR = BT_OVF;
    3ad0:	b30d      	st.w      	r0, (r3, 0x34)
}
    3ad2:	1463      	ipop
    3ad4:	1461      	nir
	else if((BT0->MISR&BT_OVF)==BT_OVF)				//BT1 OVF interrupt
    3ad6:	922c      	ld.w      	r1, (r2, 0x30)
    3ad8:	3004      	movi      	r0, 4
    3ada:	6840      	and      	r1, r0
    3adc:	3940      	cmpnei      	r1, 0
    3ade:	0bf9      	bt      	0x3ad0	// 3ad0 <BT1IntHandler+0x24>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT1 Event trigger interrupt
    3ae0:	924c      	ld.w      	r2, (r2, 0x30)
    3ae2:	3108      	movi      	r1, 8
    3ae4:	6884      	and      	r2, r1
    3ae6:	3a40      	cmpnei      	r2, 0
    3ae8:	0beb      	bt      	0x3abe	// 3abe <BT1IntHandler+0x12>
    3aea:	07f4      	br      	0x3ad2	// 3ad2 <BT1IntHandler+0x26>
    3aec:	20000008 	.long	0x20000008
    3af0:	2000000c 	.long	0x2000000c

Disassembly of section .text.PriviledgeVioHandler:

00003af4 <PriviledgeVioHandler>:
    3af4:	783c      	jmp      	r15

Disassembly of section .text.PendTrapHandler:

00003af6 <PendTrapHandler>:
    // ISR content ...

}

void PendTrapHandler(void) 
{
    3af6:	1460      	nie
    3af8:	1462      	ipush
    // ISR content ...

}
    3afa:	1463      	ipop
    3afc:	1461      	nir

Disassembly of section .text.Trap3Handler:

00003afe <Trap3Handler>:
    3afe:	1460      	nie
    3b00:	1462      	ipush
    3b02:	1463      	ipop
    3b04:	1461      	nir

Disassembly of section .text.Trap2Handler:

00003b06 <Trap2Handler>:
    3b06:	1460      	nie
    3b08:	1462      	ipush
    3b0a:	1463      	ipop
    3b0c:	1461      	nir

Disassembly of section .text.Trap1Handler:

00003b0e <Trap1Handler>:
    3b0e:	1460      	nie
    3b10:	1462      	ipush
    3b12:	1463      	ipop
    3b14:	1461      	nir

Disassembly of section .text.Trap0Handler:

00003b16 <Trap0Handler>:
    3b16:	1460      	nie
    3b18:	1462      	ipush
    3b1a:	1463      	ipop
    3b1c:	1461      	nir

Disassembly of section .text.UnrecExecpHandler:

00003b1e <UnrecExecpHandler>:
    3b1e:	1460      	nie
    3b20:	1462      	ipush
    3b22:	1463      	ipop
    3b24:	1461      	nir

Disassembly of section .text.BreakPointHandler:

00003b26 <BreakPointHandler>:
    3b26:	1460      	nie
    3b28:	1462      	ipush
    3b2a:	1463      	ipop
    3b2c:	1461      	nir

Disassembly of section .text.AccessErrHandler:

00003b2e <AccessErrHandler>:
    3b2e:	1460      	nie
    3b30:	1462      	ipush
    3b32:	1463      	ipop
    3b34:	1461      	nir

Disassembly of section .text.IllegalInstrHandler:

00003b36 <IllegalInstrHandler>:
    3b36:	1460      	nie
    3b38:	1462      	ipush
    3b3a:	1463      	ipop
    3b3c:	1461      	nir

Disassembly of section .text.MisalignedHandler:

00003b3e <MisalignedHandler>:
    3b3e:	1460      	nie
    3b40:	1462      	ipush
    3b42:	1463      	ipop
    3b44:	1461      	nir

Disassembly of section .text.CNTAIntHandler:

00003b46 <CNTAIntHandler>:
    3b46:	1460      	nie
    3b48:	1462      	ipush
    3b4a:	1463      	ipop
    3b4c:	1461      	nir

Disassembly of section .text.I2CIntHandler:

00003b4e <I2CIntHandler>:
    3b4e:	1460      	nie
    3b50:	1462      	ipush
    3b52:	1463      	ipop
    3b54:	1461      	nir

Disassembly of section .text.__divsi3:

00003b58 <__divsi3>:
CSP_BT_T    	*BT1      = (CSP_BT_T   *)APB_BT1Base ;
CSP_CRC_T   	*CRC      = (CSP_CRC_T  *)AHB_CRCBase ;
CSP_HWD_T   	*HWD      = (CSP_HWD_T  *)APB_HWDBase ;

int __divsi3 (  int a,   int b)
{   
    3b58:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    3b5a:	c0006023 	mfcr      	r3, cr<0, 0>
    3b5e:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );

	HWD->CR = 0;
    3b62:	1046      	lrw      	r2, 0x20000000	// 3b78 <__divsi3+0x20>
    3b64:	3400      	movi      	r4, 0
    3b66:	9240      	ld.w      	r2, (r2, 0x0)
    3b68:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    3b6a:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    3b6c:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    3b6e:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    3b70:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);
					
	return HWD->QUOTIENT;
    3b74:	9202      	ld.w      	r0, (r2, 0x8)
}
    3b76:	1481      	pop      	r4
    3b78:	20000000 	.long	0x20000000

Disassembly of section .text.__udivsi3:

00003b7c <__udivsi3>:
 unsigned int __udivsi3 ( unsigned int a,  unsigned int b)
{   
    3b7c:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    3b7e:	c0006023 	mfcr      	r3, cr<0, 0>
    3b82:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    3b86:	1046      	lrw      	r2, 0x20000000	// 3b9c <__udivsi3+0x20>
    3b88:	3401      	movi      	r4, 1
    3b8a:	9240      	ld.w      	r2, (r2, 0x0)
    3b8c:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    3b8e:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    3b90:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    3b92:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    3b94:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);

	return HWD->QUOTIENT;
    3b98:	9202      	ld.w      	r0, (r2, 0x8)
}
    3b9a:	1481      	pop      	r4
    3b9c:	20000000 	.long	0x20000000

Disassembly of section .text.__umodsi3:

00003ba0 <__umodsi3>:
					);	
	return HWD->REMAIN;
}

unsigned int __umodsi3 ( unsigned int a,  unsigned int b)
{   
    3ba0:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    3ba2:	c0006023 	mfcr      	r3, cr<0, 0>
    3ba6:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    3baa:	1046      	lrw      	r2, 0x20000000	// 3bc0 <__umodsi3+0x20>
    3bac:	3401      	movi      	r4, 1
    3bae:	9240      	ld.w      	r2, (r2, 0x0)
    3bb0:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    3bb2:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    3bb4:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    3bb6:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    3bb8:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);	
	return HWD->REMAIN;
    3bbc:	9203      	ld.w      	r0, (r2, 0xc)
}
    3bbe:	1481      	pop      	r4
    3bc0:	20000000 	.long	0x20000000

Disassembly of section .text.CK_CPU_EnAllNormalIrq:

00003bc4 <CK_CPU_EnAllNormalIrq>:
}


void CK_CPU_EnAllNormalIrq(void)
{
  asm  ("psrset ee,ie");
    3bc4:	c1807420 	psrset      	ee, ie
}
    3bc8:	783c      	jmp      	r15

Disassembly of section .text.adc_conver:

00003bcc <adc_conver>:
 * @param [in] ch 通道
 * 
 * @details 
 */
void adc_conver(U8_T ch) // adc检测函数  参数为adc通道
{
    3bcc:	14d2      	push      	r4-r5, r15
    3bce:	1422      	subi      	r14, r14, 8
    3bd0:	6d43      	mov      	r5, r0
	ADC12_Software_Reset();
    3bd2:	e3fff33b 	bsr      	0x2248	// 2248 <ADC12_Software_Reset>
	ADC12_CLK_CMD(ADC_CLK_CR, ENABLE);							  // enable ADC CLK
    3bd6:	3101      	movi      	r1, 1
    3bd8:	3002      	movi      	r0, 2
    3bda:	e3fff321 	bsr      	0x221c	// 221c <ADC12_CLK_CMD>
	ADC12_Configure_Mode(ADC12_12BIT, One_shot_mode, 0, 6, 2, 1); // 12BIT ADC; Continuous mode; Conversion priority selection 0; Holding cycles=6 ;ADC_CLK=PCLK/2*2=0.2us; Number of Conversions=1
    3bde:	3301      	movi      	r3, 1
    3be0:	b861      	st.w      	r3, (r14, 0x4)
    3be2:	3302      	movi      	r3, 2
    3be4:	b860      	st.w      	r3, (r14, 0x0)
    3be6:	3200      	movi      	r2, 0
    3be8:	3306      	movi      	r3, 6
    3bea:	3100      	movi      	r1, 0
    3bec:	3001      	movi      	r0, 1
    3bee:	e3fff35d 	bsr      	0x22a8	// 22a8 <ADC12_Configure_Mode>
	switch (ch)
    3bf2:	3d03      	cmphsi      	r5, 4
    3bf4:	080f      	bt      	0x3c12	// 3c12 <adc_conver+0x46>
    3bf6:	6c17      	mov      	r0, r5
    3bf8:	e3ffe882 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    3bfc:	362e2602 	.long	0x362e2602
	{
	case CH_USB1:
	{
		ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS);						 // ADC VREF Positive FVR4.096V,negative VSS
    3c00:	3000      	movi      	r0, 0
    3c02:	e3fff391 	bsr      	0x2324	// 2324 <ADC12_Configure_VREF_Selecte>
		ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum1, ADC12_AVGDIS, 0); // SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
    3c06:	3300      	movi      	r3, 0
    3c08:	3200      	movi      	r2, 0
    3c0a:	3100      	movi      	r1, 0
    3c0c:	300a      	movi      	r0, 10
		break;
	}
	case CH_USB4:
	{
		ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS);							 // ADC VREF Positive FVR4.096V,negative VSS
		ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum1, ADC12_AVGDIS, 0); // SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
    3c0e:	e3fff457 	bsr      	0x24bc	// 24bc <ADC12_ConversionChannel_Config>
		break;
	}
	}

	ADC12_CMD(ENABLE);	// enable ADC
    3c12:	3001      	movi      	r0, 1
    3c14:	e3fff320 	bsr      	0x2254	// 2254 <ADC12_CMD>
	ADC12_ready_wait(); // wait ADC get ready
    3c18:	e3fff332 	bsr      	0x227c	// 227c <ADC12_ready_wait>
	
	/*单次结果*/
	else
	#endif
	{
		ADC12_Control(ADC12_START); // ADC convert start
    3c1c:	3008      	movi      	r0, 8
    3c1e:	e3fff2e7 	bsr      	0x21ec	// 21ec <ADC12_Control>
		ADC12_SEQEND_wait(0);
    3c22:	3000      	movi      	r0, 0
    3c24:	e3fff336 	bsr      	0x2290	// 2290 <ADC12_SEQEND_wait>
		adc_result_direct[ch] = ADC0->DR[0];
    3c28:	1267      	lrw      	r3, 0x20000050	// 3d44 <adc_conver+0x178>
    3c2a:	1288      	lrw      	r4, 0x200000f8	// 3d48 <adc_conver+0x17c>
    3c2c:	4541      	lsli      	r2, r5, 1
    3c2e:	9360      	ld.w      	r3, (r3, 0x0)
    3c30:	23ff      	addi      	r3, 256
    3c32:	9360      	ld.w      	r3, (r3, 0x0)
    3c34:	6090      	addu      	r2, r4
	}
	/*ADC结果换算为有意义的物理量*/
	switch (ch)
    3c36:	3d03      	cmphsi      	r5, 4
		adc_result_direct[ch] = ADC0->DR[0];
    3c38:	aa60      	st.h      	r3, (r2, 0x0)
	switch (ch)
    3c3a:	0835      	bt      	0x3ca4	// 3ca4 <adc_conver+0xd8>
    3c3c:	6c17      	mov      	r0, r5
    3c3e:	4370      	lsli      	r3, r3, 16
    3c40:	e3ffe85e 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    3c44:	664d341a 	.long	0x664d341a
		ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS);							// ADC VREF Positive FVR4.096V,negative VSS
    3c48:	3000      	movi      	r0, 0
    3c4a:	e3fff36d 	bsr      	0x2324	// 2324 <ADC12_Configure_VREF_Selecte>
		ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum1, ADC12_AVGDIS, 0); // SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
    3c4e:	3300      	movi      	r3, 0
    3c50:	3200      	movi      	r2, 0
    3c52:	3100      	movi      	r1, 0
    3c54:	300b      	movi      	r0, 11
    3c56:	07dc      	br      	0x3c0e	// 3c0e <adc_conver+0x42>
		ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS);							// ADC VREF Positive FVR4.096V,negative VSS
    3c58:	3000      	movi      	r0, 0
    3c5a:	e3fff365 	bsr      	0x2324	// 2324 <ADC12_Configure_VREF_Selecte>
		ADC12_ConversionChannel_Config(ADC12_ADCIN12, ADC12_CV_RepeatNum1, ADC12_AVGDIS, 0); // SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
    3c5e:	3300      	movi      	r3, 0
    3c60:	3200      	movi      	r2, 0
    3c62:	3100      	movi      	r1, 0
    3c64:	300c      	movi      	r0, 12
    3c66:	07d4      	br      	0x3c0e	// 3c0e <adc_conver+0x42>
		ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS);							 // ADC VREF Positive FVR4.096V,negative VSS
    3c68:	3000      	movi      	r0, 0
    3c6a:	e3fff35d 	bsr      	0x2324	// 2324 <ADC12_Configure_VREF_Selecte>
		ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum1, ADC12_AVGDIS, 0); // SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
    3c6e:	3300      	movi      	r3, 0
    3c70:	3200      	movi      	r2, 0
    3c72:	3100      	movi      	r1, 0
    3c74:	300d      	movi      	r0, 13
    3c76:	07cc      	br      	0x3c0e	// 3c0e <adc_conver+0x42>
	{
	case CH_USB1:
		adc_result_conver[ch] = adc_result_direct[ch] * cal3_a.flo + cal3_b.flo >= 0 ? (adc_result_direct[ch] * cal3_a.flo + cal3_b.flo) : 0;
    3c78:	4b10      	lsri      	r0, r3, 16
    3c7a:	e3ffea0b 	bsr      	0x1090	// 1090 <__floatsisf>
    3c7e:	1174      	lrw      	r3, 0x20000224	// 3d4c <adc_conver+0x180>
    3c80:	9320      	ld.w      	r1, (r3, 0x0)
    3c82:	e3ffe95f 	bsr      	0xf40	// f40 <__mulsf3>
    3c86:	1173      	lrw      	r3, 0x20000234	// 3d50 <adc_conver+0x184>
    3c88:	9320      	ld.w      	r1, (r3, 0x0)
    3c8a:	e3ffe92b 	bsr      	0xee0	// ee0 <__addsf3>
    3c8e:	3100      	movi      	r1, 0
    3c90:	6d43      	mov      	r5, r0
    3c92:	e3ffe9e3 	bsr      	0x1058	// 1058 <__gesf2>
    3c96:	38df      	btsti      	r0, 31
    3c98:	0808      	bt      	0x3ca8	// 3ca8 <adc_conver+0xdc>
    3c9a:	6c17      	mov      	r0, r5
    3c9c:	e3ffe848 	bsr      	0xd2c	// d2c <__fixunssfsi>
    3ca0:	7401      	zexth      	r0, r0
    3ca2:	ac04      	st.h      	r0, (r4, 0x8)
		break;
	case CH_USB4:
		adc_result_conver[ch] = adc_result_direct[ch] * cal0_a.flo + cal0_b.flo >= 0 ? (adc_result_direct[ch] * cal0_a.flo + cal0_b.flo) : 0;
		break;
	}
}
    3ca4:	1402      	addi      	r14, r14, 8
    3ca6:	1492      	pop      	r4-r5, r15
		adc_result_conver[ch] = adc_result_direct[ch] * cal3_a.flo + cal3_b.flo >= 0 ? (adc_result_direct[ch] * cal3_a.flo + cal3_b.flo) : 0;
    3ca8:	3000      	movi      	r0, 0
    3caa:	07fc      	br      	0x3ca2	// 3ca2 <adc_conver+0xd6>
		adc_result_conver[ch] = adc_result_direct[ch] * cal2_a.flo + cal2_b.flo >= 50 ? (adc_result_direct[ch] * cal2_a.flo + cal2_b.flo) : 0;
    3cac:	4b10      	lsri      	r0, r3, 16
    3cae:	e3ffe9f1 	bsr      	0x1090	// 1090 <__floatsisf>
    3cb2:	1169      	lrw      	r3, 0x20000240	// 3d54 <adc_conver+0x188>
    3cb4:	9320      	ld.w      	r1, (r3, 0x0)
    3cb6:	e3ffe945 	bsr      	0xf40	// f40 <__mulsf3>
    3cba:	1168      	lrw      	r3, 0x20000228	// 3d58 <adc_conver+0x18c>
    3cbc:	9320      	ld.w      	r1, (r3, 0x0)
    3cbe:	e3ffe911 	bsr      	0xee0	// ee0 <__addsf3>
    3cc2:	1127      	lrw      	r1, 0x42480000	// 3d5c <adc_conver+0x190>
    3cc4:	6d43      	mov      	r5, r0
    3cc6:	e3ffe9c9 	bsr      	0x1058	// 1058 <__gesf2>
    3cca:	38df      	btsti      	r0, 31
    3ccc:	0807      	bt      	0x3cda	// 3cda <adc_conver+0x10e>
    3cce:	6c17      	mov      	r0, r5
    3cd0:	e3ffe82e 	bsr      	0xd2c	// d2c <__fixunssfsi>
    3cd4:	7401      	zexth      	r0, r0
    3cd6:	ac05      	st.h      	r0, (r4, 0xa)
		break;
    3cd8:	07e6      	br      	0x3ca4	// 3ca4 <adc_conver+0xd8>
		adc_result_conver[ch] = adc_result_direct[ch] * cal2_a.flo + cal2_b.flo >= 50 ? (adc_result_direct[ch] * cal2_a.flo + cal2_b.flo) : 0;
    3cda:	3000      	movi      	r0, 0
    3cdc:	07fd      	br      	0x3cd6	// 3cd6 <adc_conver+0x10a>
		adc_result_conver[ch] = adc_result_direct[ch] * cal1_a.flo + cal1_b.flo >= 0 ? (adc_result_direct[ch] * cal1_a.flo + cal1_b.flo) : 0;
    3cde:	4b10      	lsri      	r0, r3, 16
    3ce0:	e3ffe9d8 	bsr      	0x1090	// 1090 <__floatsisf>
    3ce4:	107f      	lrw      	r3, 0x20000238	// 3d60 <adc_conver+0x194>
    3ce6:	9320      	ld.w      	r1, (r3, 0x0)
    3ce8:	e3ffe92c 	bsr      	0xf40	// f40 <__mulsf3>
    3cec:	107e      	lrw      	r3, 0x2000022c	// 3d64 <adc_conver+0x198>
    3cee:	9320      	ld.w      	r1, (r3, 0x0)
    3cf0:	e3ffe8f8 	bsr      	0xee0	// ee0 <__addsf3>
    3cf4:	3100      	movi      	r1, 0
    3cf6:	6d43      	mov      	r5, r0
    3cf8:	e3ffe9b0 	bsr      	0x1058	// 1058 <__gesf2>
    3cfc:	38df      	btsti      	r0, 31
    3cfe:	0807      	bt      	0x3d0c	// 3d0c <adc_conver+0x140>
    3d00:	6c17      	mov      	r0, r5
    3d02:	e3ffe815 	bsr      	0xd2c	// d2c <__fixunssfsi>
    3d06:	7401      	zexth      	r0, r0
    3d08:	ac06      	st.h      	r0, (r4, 0xc)
		break;
    3d0a:	07cd      	br      	0x3ca4	// 3ca4 <adc_conver+0xd8>
		adc_result_conver[ch] = adc_result_direct[ch] * cal1_a.flo + cal1_b.flo >= 0 ? (adc_result_direct[ch] * cal1_a.flo + cal1_b.flo) : 0;
    3d0c:	3000      	movi      	r0, 0
    3d0e:	07fd      	br      	0x3d08	// 3d08 <adc_conver+0x13c>
		adc_result_conver[ch] = adc_result_direct[ch] * cal0_a.flo + cal0_b.flo >= 0 ? (adc_result_direct[ch] * cal0_a.flo + cal0_b.flo) : 0;
    3d10:	4b10      	lsri      	r0, r3, 16
    3d12:	e3ffe9bf 	bsr      	0x1090	// 1090 <__floatsisf>
    3d16:	1075      	lrw      	r3, 0x20000230	// 3d68 <adc_conver+0x19c>
    3d18:	9320      	ld.w      	r1, (r3, 0x0)
    3d1a:	e3ffe913 	bsr      	0xf40	// f40 <__mulsf3>
    3d1e:	1074      	lrw      	r3, 0x2000023c	// 3d6c <adc_conver+0x1a0>
    3d20:	9320      	ld.w      	r1, (r3, 0x0)
    3d22:	e3ffe8df 	bsr      	0xee0	// ee0 <__addsf3>
    3d26:	3100      	movi      	r1, 0
    3d28:	6d43      	mov      	r5, r0
    3d2a:	e3ffe997 	bsr      	0x1058	// 1058 <__gesf2>
    3d2e:	38df      	btsti      	r0, 31
    3d30:	0807      	bt      	0x3d3e	// 3d3e <adc_conver+0x172>
    3d32:	6c17      	mov      	r0, r5
    3d34:	e3ffe7fc 	bsr      	0xd2c	// d2c <__fixunssfsi>
    3d38:	7401      	zexth      	r0, r0
    3d3a:	ac07      	st.h      	r0, (r4, 0xe)
}
    3d3c:	07b4      	br      	0x3ca4	// 3ca4 <adc_conver+0xd8>
		adc_result_conver[ch] = adc_result_direct[ch] * cal0_a.flo + cal0_b.flo >= 0 ? (adc_result_direct[ch] * cal0_a.flo + cal0_b.flo) : 0;
    3d3e:	3000      	movi      	r0, 0
    3d40:	07fd      	br      	0x3d3a	// 3d3a <adc_conver+0x16e>
    3d42:	0000      	bkpt
    3d44:	20000050 	.long	0x20000050
    3d48:	200000f8 	.long	0x200000f8
    3d4c:	20000224 	.long	0x20000224
    3d50:	20000234 	.long	0x20000234
    3d54:	20000240 	.long	0x20000240
    3d58:	20000228 	.long	0x20000228
    3d5c:	42480000 	.long	0x42480000
    3d60:	20000238 	.long	0x20000238
    3d64:	2000022c 	.long	0x2000022c
    3d68:	20000230 	.long	0x20000230
    3d6c:	2000023c 	.long	0x2000023c

Disassembly of section .text.adc_task:

00003d70 <adc_task>:
/*adc_task*/
void adc_task(void)
{
    3d70:	14d0      	push      	r15
	U8_T i;
	for (i = 0; i < MAXNUM_CH; i++)
	{
		adc_conver(i);
    3d72:	3000      	movi      	r0, 0
    3d74:	e3ffff2c 	bsr      	0x3bcc	// 3bcc <adc_conver>
    3d78:	3001      	movi      	r0, 1
    3d7a:	e3ffff29 	bsr      	0x3bcc	// 3bcc <adc_conver>
    3d7e:	3002      	movi      	r0, 2
    3d80:	e3ffff26 	bsr      	0x3bcc	// 3bcc <adc_conver>
    3d84:	3003      	movi      	r0, 3
    3d86:	e3ffff23 	bsr      	0x3bcc	// 3bcc <adc_conver>
	}
}
    3d8a:	1490      	pop      	r15

Disassembly of section .text.key_scan1:

00003d8c <key_scan1>:
	static unsigned char key_lock = 0;
	static unsigned int press_cnt = 0;
	static unsigned char short_press = 0;
//	U8_T key_val = GPIO_Read_Status(KEY_T1_PROT, KEY_T1_PIN);
	
	U8_T key_val = Key_Map & (0x01 << 6) ? 0 : 1;
    3d8c:	1076      	lrw      	r3, 0x20000378	// 3de4 <key_scan1+0x58>
    3d8e:	9340      	ld.w      	r2, (r3, 0x0)
    3d90:	3340      	movi      	r3, 64
    3d92:	688c      	and      	r2, r3
	if (key_val)
    3d94:	3a40      	cmpnei      	r2, 0
    3d96:	1075      	lrw      	r3, 0x20000108	// 3de8 <key_scan1+0x5c>
    3d98:	080e      	bt      	0x3db4	// 3db4 <key_scan1+0x28>
	{
		key_lock = 0;
		press_cnt = 0;
    3d9a:	b341      	st.w      	r2, (r3, 0x4)
		if (short_press)
    3d9c:	8348      	ld.b      	r2, (r3, 0x8)
		key_lock = 0;
    3d9e:	3100      	movi      	r1, 0
		if (short_press)
    3da0:	3a40      	cmpnei      	r2, 0
		key_lock = 0;
    3da2:	a320      	st.b      	r1, (r3, 0x0)
		if (short_press)
    3da4:	0c07      	bf      	0x3db2	// 3db2 <key_scan1+0x26>
		{
			short_press = 0;
    3da6:	3200      	movi      	r2, 0
    3da8:	a348      	st.b      	r2, (r3, 0x8)
			stKEY.key_t1_short_press = 1;
    3daa:	1051      	lrw      	r2, 0x20000220	// 3dec <key_scan1+0x60>
    3dac:	8260      	ld.b      	r3, (r2, 0x0)
    3dae:	3ba0      	bseti      	r3, 0
    3db0:	a260      	st.b      	r3, (r2, 0x0)
			short_press = 0;
			stKEY.key_t1_long_press = 1;
			key_lock = 1;
		}
	}
}
    3db2:	783c      	jmp      	r15
	else if (!key_lock)
    3db4:	8340      	ld.b      	r2, (r3, 0x0)
    3db6:	3a40      	cmpnei      	r2, 0
    3db8:	0bfd      	bt      	0x3db2	// 3db2 <key_scan1+0x26>
		press_cnt++;
    3dba:	9341      	ld.w      	r2, (r3, 0x4)
    3dbc:	2200      	addi      	r2, 1
		if (press_cnt >= 3)
    3dbe:	3a02      	cmphsi      	r2, 3
		press_cnt++;
    3dc0:	b341      	st.w      	r2, (r3, 0x4)
		if (press_cnt >= 3)
    3dc2:	0ff8      	bf      	0x3db2	// 3db2 <key_scan1+0x26>
		if (press_cnt >= 100)
    3dc4:	3163      	movi      	r1, 99
    3dc6:	6484      	cmphs      	r1, r2
    3dc8:	0c04      	bf      	0x3dd0	// 3dd0 <key_scan1+0x44>
			short_press = 1;
    3dca:	3201      	movi      	r2, 1
    3dcc:	a348      	st.b      	r2, (r3, 0x8)
    3dce:	07f2      	br      	0x3db2	// 3db2 <key_scan1+0x26>
			short_press = 0;
    3dd0:	3200      	movi      	r2, 0
			stKEY.key_t1_long_press = 1;
    3dd2:	1027      	lrw      	r1, 0x20000220	// 3dec <key_scan1+0x60>
			short_press = 0;
    3dd4:	a348      	st.b      	r2, (r3, 0x8)
			stKEY.key_t1_long_press = 1;
    3dd6:	8140      	ld.b      	r2, (r1, 0x0)
    3dd8:	3aa1      	bseti      	r2, 1
    3dda:	a140      	st.b      	r2, (r1, 0x0)
			key_lock = 1;
    3ddc:	3201      	movi      	r2, 1
    3dde:	a340      	st.b      	r2, (r3, 0x0)
}
    3de0:	07e9      	br      	0x3db2	// 3db2 <key_scan1+0x26>
    3de2:	0000      	bkpt
    3de4:	20000378 	.long	0x20000378
    3de8:	20000108 	.long	0x20000108
    3dec:	20000220 	.long	0x20000220

Disassembly of section .text.key_scan2:

00003df0 <key_scan2>:
	static unsigned char key_lock = 0;
	static unsigned int press_cnt = 0;
	static unsigned char short_press = 0;
	//	U8_T key_val = GPIO_Read_Status(KEY_T1_PROT, KEY_T1_PIN);

	U8_T key_val = Key_Map & (0x01 << 8) ? 0 : 1;
    3df0:	1076      	lrw      	r3, 0x20000378	// 3e48 <key_scan2+0x58>
    3df2:	9340      	ld.w      	r2, (r3, 0x0)
    3df4:	3380      	movi      	r3, 128
    3df6:	4361      	lsli      	r3, r3, 1
    3df8:	688c      	and      	r2, r3
	if (key_val )
    3dfa:	3a40      	cmpnei      	r2, 0
    3dfc:	1074      	lrw      	r3, 0x20000108	// 3e4c <key_scan2+0x5c>
    3dfe:	080e      	bt      	0x3e1a	// 3e1a <key_scan2+0x2a>
	{
		key_lock = 0;
		press_cnt = 0;
    3e00:	b343      	st.w      	r2, (r3, 0xc)
		if (short_press)
    3e02:	8350      	ld.b      	r2, (r3, 0x10)
		key_lock = 0;
    3e04:	3100      	movi      	r1, 0
		if (short_press)
    3e06:	3a40      	cmpnei      	r2, 0
		key_lock = 0;
    3e08:	a329      	st.b      	r1, (r3, 0x9)
		if (short_press)
    3e0a:	0c07      	bf      	0x3e18	// 3e18 <key_scan2+0x28>
		{
			short_press = 0;
    3e0c:	3200      	movi      	r2, 0
    3e0e:	a350      	st.b      	r2, (r3, 0x10)
			stKEY.key_t2_short_press = 1;
    3e10:	1050      	lrw      	r2, 0x20000220	// 3e50 <key_scan2+0x60>
    3e12:	8260      	ld.b      	r3, (r2, 0x0)
    3e14:	3ba2      	bseti      	r3, 2
    3e16:	a260      	st.b      	r3, (r2, 0x0)
			short_press = 0;
			stKEY.key_t2_long_press = 1;
			key_lock = 1;
		}
	}
}
    3e18:	783c      	jmp      	r15
	else if (!key_lock)
    3e1a:	8349      	ld.b      	r2, (r3, 0x9)
    3e1c:	3a40      	cmpnei      	r2, 0
    3e1e:	0bfd      	bt      	0x3e18	// 3e18 <key_scan2+0x28>
		press_cnt++;
    3e20:	9343      	ld.w      	r2, (r3, 0xc)
    3e22:	2200      	addi      	r2, 1
		if (press_cnt >= 3)
    3e24:	3a02      	cmphsi      	r2, 3
		press_cnt++;
    3e26:	b343      	st.w      	r2, (r3, 0xc)
		if (press_cnt >= 3)
    3e28:	0ff8      	bf      	0x3e18	// 3e18 <key_scan2+0x28>
		if (press_cnt >= 100)
    3e2a:	3163      	movi      	r1, 99
    3e2c:	6484      	cmphs      	r1, r2
    3e2e:	0c04      	bf      	0x3e36	// 3e36 <key_scan2+0x46>
			short_press = 1;
    3e30:	3201      	movi      	r2, 1
    3e32:	a350      	st.b      	r2, (r3, 0x10)
    3e34:	07f2      	br      	0x3e18	// 3e18 <key_scan2+0x28>
			short_press = 0;
    3e36:	3200      	movi      	r2, 0
			stKEY.key_t2_long_press = 1;
    3e38:	1026      	lrw      	r1, 0x20000220	// 3e50 <key_scan2+0x60>
			short_press = 0;
    3e3a:	a350      	st.b      	r2, (r3, 0x10)
			stKEY.key_t2_long_press = 1;
    3e3c:	8140      	ld.b      	r2, (r1, 0x0)
    3e3e:	3aa3      	bseti      	r2, 3
    3e40:	a140      	st.b      	r2, (r1, 0x0)
			key_lock = 1;
    3e42:	3201      	movi      	r2, 1
    3e44:	a349      	st.b      	r2, (r3, 0x9)
}
    3e46:	07e9      	br      	0x3e18	// 3e18 <key_scan2+0x28>
    3e48:	20000378 	.long	0x20000378
    3e4c:	20000108 	.long	0x20000108
    3e50:	20000220 	.long	0x20000220

Disassembly of section .text.key_scan3:

00003e54 <key_scan3>:
	static unsigned char key_lock = 0;
	static unsigned int press_cnt = 0;
	static unsigned char short_press = 0;
	//	U8_T key_val = GPIO_Read_Status(KEY_T1_PROT, KEY_T1_PIN);

	U8_T key_val = Key_Map & (0x01 << 7) ? 0 : 1;
    3e54:	1076      	lrw      	r3, 0x20000378	// 3eac <key_scan3+0x58>
    3e56:	9340      	ld.w      	r2, (r3, 0x0)
    3e58:	3380      	movi      	r3, 128
    3e5a:	688c      	and      	r2, r3
	if (key_val)
    3e5c:	3a40      	cmpnei      	r2, 0
    3e5e:	1075      	lrw      	r3, 0x20000108	// 3eb0 <key_scan3+0x5c>
    3e60:	080e      	bt      	0x3e7c	// 3e7c <key_scan3+0x28>
	{
		key_lock = 0;
		press_cnt = 0;
    3e62:	b345      	st.w      	r2, (r3, 0x14)
		if (short_press)
    3e64:	8358      	ld.b      	r2, (r3, 0x18)
		key_lock = 0;
    3e66:	3100      	movi      	r1, 0
		if (short_press)
    3e68:	3a40      	cmpnei      	r2, 0
		key_lock = 0;
    3e6a:	a331      	st.b      	r1, (r3, 0x11)
		if (short_press)
    3e6c:	0c07      	bf      	0x3e7a	// 3e7a <key_scan3+0x26>
		{
			short_press = 0;
    3e6e:	3200      	movi      	r2, 0
    3e70:	a358      	st.b      	r2, (r3, 0x18)
			stKEY.key_t3_short_press = 1;
    3e72:	1051      	lrw      	r2, 0x20000220	// 3eb4 <key_scan3+0x60>
    3e74:	8260      	ld.b      	r3, (r2, 0x0)
    3e76:	3ba4      	bseti      	r3, 4
    3e78:	a260      	st.b      	r3, (r2, 0x0)
			short_press = 0;
			stKEY.key_t3_long_press = 1;
			key_lock = 1;
		}
	}
}
    3e7a:	783c      	jmp      	r15
	else if (!key_lock)
    3e7c:	8351      	ld.b      	r2, (r3, 0x11)
    3e7e:	3a40      	cmpnei      	r2, 0
    3e80:	0bfd      	bt      	0x3e7a	// 3e7a <key_scan3+0x26>
		press_cnt++;
    3e82:	9345      	ld.w      	r2, (r3, 0x14)
    3e84:	2200      	addi      	r2, 1
		if (press_cnt >= 3)
    3e86:	3a02      	cmphsi      	r2, 3
		press_cnt++;
    3e88:	b345      	st.w      	r2, (r3, 0x14)
		if (press_cnt >= 3)
    3e8a:	0ff8      	bf      	0x3e7a	// 3e7a <key_scan3+0x26>
		if (press_cnt >= 100)
    3e8c:	3163      	movi      	r1, 99
    3e8e:	6484      	cmphs      	r1, r2
    3e90:	0c04      	bf      	0x3e98	// 3e98 <key_scan3+0x44>
			short_press = 1;
    3e92:	3201      	movi      	r2, 1
    3e94:	a358      	st.b      	r2, (r3, 0x18)
    3e96:	07f2      	br      	0x3e7a	// 3e7a <key_scan3+0x26>
			short_press = 0;
    3e98:	3200      	movi      	r2, 0
			stKEY.key_t3_long_press = 1;
    3e9a:	1027      	lrw      	r1, 0x20000220	// 3eb4 <key_scan3+0x60>
			short_press = 0;
    3e9c:	a358      	st.b      	r2, (r3, 0x18)
			stKEY.key_t3_long_press = 1;
    3e9e:	8140      	ld.b      	r2, (r1, 0x0)
    3ea0:	3aa5      	bseti      	r2, 5
    3ea2:	a140      	st.b      	r2, (r1, 0x0)
			key_lock = 1;
    3ea4:	3201      	movi      	r2, 1
    3ea6:	a351      	st.b      	r2, (r3, 0x11)
}
    3ea8:	07e9      	br      	0x3e7a	// 3e7a <key_scan3+0x26>
    3eaa:	0000      	bkpt
    3eac:	20000378 	.long	0x20000378
    3eb0:	20000108 	.long	0x20000108
    3eb4:	20000220 	.long	0x20000220

Disassembly of section .text.task_key:

00003eb8 <task_key>:

void task_key(void)
{
    3eb8:	14d1      	push      	r4, r15
	static uint8_t t =0;
	if(t++>=10)
    3eba:	1088      	lrw      	r4, 0x20000108	// 3ed8 <task_key+0x20>
    3ebc:	8479      	ld.b      	r3, (r4, 0x19)
    3ebe:	5b42      	addi      	r2, r3, 1
    3ec0:	3b09      	cmphsi      	r3, 10
    3ec2:	a459      	st.b      	r2, (r4, 0x19)
    3ec4:	0c09      	bf      	0x3ed6	// 3ed6 <task_key+0x1e>
	{
		key_scan1();
    3ec6:	e3ffff63 	bsr      	0x3d8c	// 3d8c <key_scan1>
		key_scan2();
    3eca:	e3ffff93 	bsr      	0x3df0	// 3df0 <key_scan2>
		key_scan3();
    3ece:	e3ffffc3 	bsr      	0x3e54	// 3e54 <key_scan3>
		t = 0;
    3ed2:	3300      	movi      	r3, 0
    3ed4:	a479      	st.b      	r3, (r4, 0x19)
	}
	
    3ed6:	1491      	pop      	r4, r15
    3ed8:	20000108 	.long	0x20000108

Disassembly of section .text.task_sys:

00003edc <task_sys>:
cal_union cal3_b;

// 10ms
void
task_sys(void)
{
    3edc:	14d1      	push      	r4, r15
	if(uart_tx_cnt++ > 50)
    3ede:	109c      	lrw      	r4, 0x20000124	// 3f4c <task_sys+0x70>
    3ee0:	8c60      	ld.h      	r3, (r4, 0x0)
    3ee2:	3232      	movi      	r2, 50
    3ee4:	64c8      	cmphs      	r2, r3
    3ee6:	0c0f      	bf      	0x3f04	// 3f04 <task_sys+0x28>
    3ee8:	2300      	addi      	r3, 1
    3eea:	ac60      	st.h      	r3, (r4, 0x0)
	{
		uart_tx_cnt = 0;
		my_printf("k1:%d,k2:%d,k3:%d\n", Key_Map & (1 << 6) ? 1 : 0, Key_Map & (1 << 8) ? 1 : 0, Key_Map & (1 << 7) ? 1 : 0);
		my_printf("cal_ad0:%d, cal_ad2:%d",cal_0_AD0,cal_0_AD2);
	}
	if(led_blink_cnt++ < 30)
    3eec:	8c63      	ld.h      	r3, (r4, 0x6)
    3eee:	5b42      	addi      	r2, r3, 1
    3ef0:	7489      	zexth      	r2, r2
    3ef2:	3b1d      	cmphsi      	r3, 30
    3ef4:	ac43      	st.h      	r2, (r4, 0x6)
    3ef6:	081d      	bt      	0x3f30	// 3f30 <task_sys+0x54>
	{
		GPIO_Write_High(GPIOA0, 4);
    3ef8:	1076      	lrw      	r3, 0x2000004c	// 3f50 <task_sys+0x74>
    3efa:	3104      	movi      	r1, 4
    3efc:	9300      	ld.w      	r0, (r3, 0x0)
    3efe:	e3fff495 	bsr      	0x2828	// 2828 <GPIO_Write_High>
	else 
	{
		led_blink_cnt = 0;
	}
	
}
    3f02:	1491      	pop      	r4, r15
		uart_tx_cnt = 0;
    3f04:	3300      	movi      	r3, 0
    3f06:	ac60      	st.h      	r3, (r4, 0x0)
		my_printf("k1:%d,k2:%d,k3:%d\n", Key_Map & (1 << 6) ? 1 : 0, Key_Map & (1 << 8) ? 1 : 0, Key_Map & (1 << 7) ? 1 : 0);
    3f08:	3001      	movi      	r0, 1
    3f0a:	1073      	lrw      	r3, 0x20000378	// 3f54 <task_sys+0x78>
    3f0c:	9320      	ld.w      	r1, (r3, 0x0)
    3f0e:	9340      	ld.w      	r2, (r3, 0x0)
    3f10:	9360      	ld.w      	r3, (r3, 0x0)
    3f12:	4b67      	lsri      	r3, r3, 7
    3f14:	4a48      	lsri      	r2, r2, 8
    3f16:	4926      	lsri      	r1, r1, 6
    3f18:	68c0      	and      	r3, r0
    3f1a:	6880      	and      	r2, r0
    3f1c:	6840      	and      	r1, r0
    3f1e:	100f      	lrw      	r0, 0x9730	// 3f58 <task_sys+0x7c>
    3f20:	e3fff102 	bsr      	0x2124	// 2124 <my_printf>
		my_printf("cal_ad0:%d, cal_ad2:%d",cal_0_AD0,cal_0_AD2);
    3f24:	8c41      	ld.h      	r2, (r4, 0x2)
    3f26:	8c22      	ld.h      	r1, (r4, 0x4)
    3f28:	100d      	lrw      	r0, 0x9743	// 3f5c <task_sys+0x80>
    3f2a:	e3fff0fd 	bsr      	0x2124	// 2124 <my_printf>
    3f2e:	07df      	br      	0x3eec	// 3eec <task_sys+0x10>
	else if(led_blink_cnt++ < 60)
    3f30:	2301      	addi      	r3, 2
    3f32:	ac63      	st.h      	r3, (r4, 0x6)
    3f34:	333b      	movi      	r3, 59
    3f36:	648c      	cmphs      	r3, r2
    3f38:	0c07      	bf      	0x3f46	// 3f46 <task_sys+0x6a>
		GPIO_Write_Low(GPIOA0,4);
    3f3a:	1066      	lrw      	r3, 0x2000004c	// 3f50 <task_sys+0x74>
    3f3c:	3104      	movi      	r1, 4
    3f3e:	9300      	ld.w      	r0, (r3, 0x0)
    3f40:	e3fff478 	bsr      	0x2830	// 2830 <GPIO_Write_Low>
    3f44:	07df      	br      	0x3f02	// 3f02 <task_sys+0x26>
		led_blink_cnt = 0;
    3f46:	3300      	movi      	r3, 0
    3f48:	ac63      	st.h      	r3, (r4, 0x6)
}
    3f4a:	07dc      	br      	0x3f02	// 3f02 <task_sys+0x26>
    3f4c:	20000124 	.long	0x20000124
    3f50:	2000004c 	.long	0x2000004c
    3f54:	20000378 	.long	0x20000378
    3f58:	00009730 	.long	0x00009730
    3f5c:	00009743 	.long	0x00009743

Disassembly of section .text.cal_comput:

00003f60 <cal_comput>:
void cal_comput(U8_T ch)
{
    3f60:	14d4      	push      	r4-r7, r15
	switch(ch)
    3f62:	3803      	cmphsi      	r0, 4
    3f64:	082d      	bt      	0x3fbe	// 3fbe <cal_comput+0x5e>
    3f66:	126f      	lrw      	r3, 0x20000124	// 40a0 <cal_comput+0x140>
    3f68:	e3ffe6ca 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    3f6c:	744f2a02 	.long	0x744f2a02
	{
	case 0:
		cal0_a.flo = 2000.0 / (cal_0_AD2 - cal_0_AD0);
    3f70:	8bc1      	ld.h      	r6, (r3, 0x2)
    3f72:	8b62      	ld.h      	r3, (r3, 0x4)
    3f74:	5e0d      	subu      	r0, r6, r3
    3f76:	e3ffeca5 	bsr      	0x18c0	// 18c0 <__floatsidf>
    3f7a:	6c83      	mov      	r2, r0
    3f7c:	6cc7      	mov      	r3, r1
    3f7e:	3000      	movi      	r0, 0
    3f80:	1229      	lrw      	r1, 0x409f4000	// 40a4 <cal_comput+0x144>
    3f82:	e3ffeb9b 	bsr      	0x16b8	// 16b8 <__divdf3>
    3f86:	e3ffed0d 	bsr      	0x19a0	// 19a0 <__truncdfsf2>
    3f8a:	12a8      	lrw      	r5, 0x20000230	// 40a8 <cal_comput+0x148>
    3f8c:	6dc3      	mov      	r7, r0
    3f8e:	b500      	st.w      	r0, (r5, 0x0)
		cal0_b.flo = 2000.0 - cal_0_AD2 * cal0_a.flo;
    3f90:	6c1b      	mov      	r0, r6
    3f92:	e3ffe87f 	bsr      	0x1090	// 1090 <__floatsisf>
    3f96:	6c5f      	mov      	r1, r7
    3f98:	e3ffe7d4 	bsr      	0xf40	// f40 <__mulsf3>
    3f9c:	6c43      	mov      	r1, r0
    3f9e:	1204      	lrw      	r0, 0x44fa0000	// 40ac <cal_comput+0x14c>
    3fa0:	e3ffe7b6 	bsr      	0xf0c	// f0c <__subsf3>
    3fa4:	1283      	lrw      	r4, 0x2000023c	// 40b0 <cal_comput+0x150>
		Page_ProgramData(DROM_PageAdd0, 4, cal0_a.arr);
    3fa6:	6c97      	mov      	r2, r5
		cal0_b.flo = 2000.0 - cal_0_AD2 * cal0_a.flo;
    3fa8:	b400      	st.w      	r0, (r4, 0x0)
		Page_ProgramData(DROM_PageAdd0, 4, cal0_a.arr);
    3faa:	3080      	movi      	r0, 128
    3fac:	3104      	movi      	r1, 4
    3fae:	4015      	lsli      	r0, r0, 21
    3fb0:	e3fff444 	bsr      	0x2838	// 2838 <Page_ProgramData>
		Page_ProgramData(DROM_PageAdd1, 4, cal0_b.arr);
    3fb4:	6c93      	mov      	r2, r4
    3fb6:	3104      	movi      	r1, 4
    3fb8:	111f      	lrw      	r0, 0x10000040	// 40b4 <cal_comput+0x154>
		break;
	case 3:
		cal3_a.flo = 2000.0 / (cal_3_AD2 - cal_3_AD0);
		cal3_b.flo = 2000.0 - cal_3_AD2 * cal3_a.flo;
		Page_ProgramData(DROM_PageAdd6, 4, cal3_a.arr);
		Page_ProgramData(DROM_PageAdd7, 4, cal3_b.arr);
    3fba:	e3fff43f 	bsr      	0x2838	// 2838 <Page_ProgramData>

	
	
	
	
    3fbe:	1494      	pop      	r4-r7, r15
		cal1_a.flo = 2000.0 / (cal_1_AD2 - cal_1_AD0);
    3fc0:	8bc4      	ld.h      	r6, (r3, 0x8)
    3fc2:	8b65      	ld.h      	r3, (r3, 0xa)
    3fc4:	5e0d      	subu      	r0, r6, r3
    3fc6:	e3ffec7d 	bsr      	0x18c0	// 18c0 <__floatsidf>
    3fca:	6c83      	mov      	r2, r0
    3fcc:	6cc7      	mov      	r3, r1
    3fce:	3000      	movi      	r0, 0
    3fd0:	1135      	lrw      	r1, 0x409f4000	// 40a4 <cal_comput+0x144>
    3fd2:	e3ffeb73 	bsr      	0x16b8	// 16b8 <__divdf3>
    3fd6:	e3ffece5 	bsr      	0x19a0	// 19a0 <__truncdfsf2>
    3fda:	11b8      	lrw      	r5, 0x20000238	// 40b8 <cal_comput+0x158>
    3fdc:	6dc3      	mov      	r7, r0
    3fde:	b500      	st.w      	r0, (r5, 0x0)
		cal1_b.flo = 2000.0 - cal_1_AD2 * cal1_a.flo;
    3fe0:	6c1b      	mov      	r0, r6
    3fe2:	e3ffe857 	bsr      	0x1090	// 1090 <__floatsisf>
    3fe6:	6c5f      	mov      	r1, r7
    3fe8:	e3ffe7ac 	bsr      	0xf40	// f40 <__mulsf3>
    3fec:	6c43      	mov      	r1, r0
    3fee:	1110      	lrw      	r0, 0x44fa0000	// 40ac <cal_comput+0x14c>
    3ff0:	e3ffe78e 	bsr      	0xf0c	// f0c <__subsf3>
    3ff4:	1192      	lrw      	r4, 0x2000022c	// 40bc <cal_comput+0x15c>
		Page_ProgramData(DROM_PageAdd2, 4, cal1_a.arr);
    3ff6:	6c97      	mov      	r2, r5
		cal1_b.flo = 2000.0 - cal_1_AD2 * cal1_a.flo;
    3ff8:	b400      	st.w      	r0, (r4, 0x0)
		Page_ProgramData(DROM_PageAdd2, 4, cal1_a.arr);
    3ffa:	3104      	movi      	r1, 4
    3ffc:	1111      	lrw      	r0, 0x10000080	// 40c0 <cal_comput+0x160>
    3ffe:	e3fff41d 	bsr      	0x2838	// 2838 <Page_ProgramData>
		Page_ProgramData(DROM_PageAdd3, 4, cal1_b.arr);
    4002:	6c93      	mov      	r2, r4
    4004:	3104      	movi      	r1, 4
    4006:	1110      	lrw      	r0, 0x100000c0	// 40c4 <cal_comput+0x164>
    4008:	07d9      	br      	0x3fba	// 3fba <cal_comput+0x5a>
		cal2_a.flo = 2000.0 / (cal_2_AD2 - cal_2_AD0);
    400a:	8bc6      	ld.h      	r6, (r3, 0xc)
    400c:	8b67      	ld.h      	r3, (r3, 0xe)
    400e:	5e0d      	subu      	r0, r6, r3
    4010:	e3ffec58 	bsr      	0x18c0	// 18c0 <__floatsidf>
    4014:	6c83      	mov      	r2, r0
    4016:	6cc7      	mov      	r3, r1
    4018:	3000      	movi      	r0, 0
    401a:	1123      	lrw      	r1, 0x409f4000	// 40a4 <cal_comput+0x144>
    401c:	e3ffeb4e 	bsr      	0x16b8	// 16b8 <__divdf3>
    4020:	e3ffecc0 	bsr      	0x19a0	// 19a0 <__truncdfsf2>
    4024:	11a9      	lrw      	r5, 0x20000240	// 40c8 <cal_comput+0x168>
    4026:	6dc3      	mov      	r7, r0
    4028:	b500      	st.w      	r0, (r5, 0x0)
		cal2_b.flo = 2000.0 - cal_2_AD2 * cal2_a.flo;
    402a:	6c1b      	mov      	r0, r6
    402c:	e3ffe832 	bsr      	0x1090	// 1090 <__floatsisf>
    4030:	6c5f      	mov      	r1, r7
    4032:	e3ffe787 	bsr      	0xf40	// f40 <__mulsf3>
    4036:	6c43      	mov      	r1, r0
    4038:	101d      	lrw      	r0, 0x44fa0000	// 40ac <cal_comput+0x14c>
    403a:	e3ffe769 	bsr      	0xf0c	// f0c <__subsf3>
    403e:	1184      	lrw      	r4, 0x20000228	// 40cc <cal_comput+0x16c>
		Page_ProgramData(DROM_PageAdd4, 4, cal2_a.arr);
    4040:	6c97      	mov      	r2, r5
		cal2_b.flo = 2000.0 - cal_2_AD2 * cal2_a.flo;
    4042:	b400      	st.w      	r0, (r4, 0x0)
		Page_ProgramData(DROM_PageAdd4, 4, cal2_a.arr);
    4044:	3104      	movi      	r1, 4
    4046:	1103      	lrw      	r0, 0x10000100	// 40d0 <cal_comput+0x170>
    4048:	e3fff3f8 	bsr      	0x2838	// 2838 <Page_ProgramData>
		Page_ProgramData(DROM_PageAdd5, 4, cal2_b.arr);
    404c:	6c93      	mov      	r2, r4
    404e:	3104      	movi      	r1, 4
    4050:	1101      	lrw      	r0, 0x10000140	// 40d4 <cal_comput+0x174>
    4052:	07b4      	br      	0x3fba	// 3fba <cal_comput+0x5a>
		cal3_a.flo = 2000.0 / (cal_3_AD2 - cal_3_AD0);
    4054:	8bc8      	ld.h      	r6, (r3, 0x10)
    4056:	8b69      	ld.h      	r3, (r3, 0x12)
    4058:	5e0d      	subu      	r0, r6, r3
    405a:	e3ffec33 	bsr      	0x18c0	// 18c0 <__floatsidf>
    405e:	6c83      	mov      	r2, r0
    4060:	6cc7      	mov      	r3, r1
    4062:	3000      	movi      	r0, 0
    4064:	1030      	lrw      	r1, 0x409f4000	// 40a4 <cal_comput+0x144>
    4066:	e3ffeb29 	bsr      	0x16b8	// 16b8 <__divdf3>
    406a:	e3ffec9b 	bsr      	0x19a0	// 19a0 <__truncdfsf2>
    406e:	10bb      	lrw      	r5, 0x20000224	// 40d8 <cal_comput+0x178>
    4070:	6dc3      	mov      	r7, r0
    4072:	b500      	st.w      	r0, (r5, 0x0)
		cal3_b.flo = 2000.0 - cal_3_AD2 * cal3_a.flo;
    4074:	6c1b      	mov      	r0, r6
    4076:	e3ffe80d 	bsr      	0x1090	// 1090 <__floatsisf>
    407a:	6c5f      	mov      	r1, r7
    407c:	e3ffe762 	bsr      	0xf40	// f40 <__mulsf3>
    4080:	6c43      	mov      	r1, r0
    4082:	100b      	lrw      	r0, 0x44fa0000	// 40ac <cal_comput+0x14c>
    4084:	e3ffe744 	bsr      	0xf0c	// f0c <__subsf3>
    4088:	1095      	lrw      	r4, 0x20000234	// 40dc <cal_comput+0x17c>
		Page_ProgramData(DROM_PageAdd6, 4, cal3_a.arr);
    408a:	6c97      	mov      	r2, r5
		cal3_b.flo = 2000.0 - cal_3_AD2 * cal3_a.flo;
    408c:	b400      	st.w      	r0, (r4, 0x0)
		Page_ProgramData(DROM_PageAdd6, 4, cal3_a.arr);
    408e:	3104      	movi      	r1, 4
    4090:	1014      	lrw      	r0, 0x10000180	// 40e0 <cal_comput+0x180>
    4092:	e3fff3d3 	bsr      	0x2838	// 2838 <Page_ProgramData>
		Page_ProgramData(DROM_PageAdd7, 4, cal3_b.arr);
    4096:	6c93      	mov      	r2, r4
    4098:	3104      	movi      	r1, 4
    409a:	1013      	lrw      	r0, 0x100001c0	// 40e4 <cal_comput+0x184>
    409c:	078f      	br      	0x3fba	// 3fba <cal_comput+0x5a>
    409e:	0000      	bkpt
    40a0:	20000124 	.long	0x20000124
    40a4:	409f4000 	.long	0x409f4000
    40a8:	20000230 	.long	0x20000230
    40ac:	44fa0000 	.long	0x44fa0000
    40b0:	2000023c 	.long	0x2000023c
    40b4:	10000040 	.long	0x10000040
    40b8:	20000238 	.long	0x20000238
    40bc:	2000022c 	.long	0x2000022c
    40c0:	10000080 	.long	0x10000080
    40c4:	100000c0 	.long	0x100000c0
    40c8:	20000240 	.long	0x20000240
    40cc:	20000228 	.long	0x20000228
    40d0:	10000100 	.long	0x10000100
    40d4:	10000140 	.long	0x10000140
    40d8:	20000224 	.long	0x20000224
    40dc:	20000234 	.long	0x20000234
    40e0:	10000180 	.long	0x10000180
    40e4:	100001c0 	.long	0x100001c0

Disassembly of section .text.Task_Marks_Handler_Callback:

000040e8 <Task_Marks_Handler_Callback>:
// 参数: None.
// 返回: None.
// 版本: V1.0, 2012-10-22
//========================================================================
void Task_Marks_Handler_Callback(void)
{
    40e8:	14c1      	push      	r4
	U8_T i;
	for (i = 0; i < Tasks_Max; i++)
    40ea:	106d      	lrw      	r3, 0x20000068	// 411c <Task_Marks_Handler_Callback+0x34>
    40ec:	8300      	ld.b      	r0, (r3, 0x0)
    40ee:	3100      	movi      	r1, 0
    40f0:	2303      	addi      	r3, 4
    40f2:	340c      	movi      	r4, 12
    40f4:	6406      	cmpne      	r1, r0
    40f6:	0802      	bt      	0x40fa	// 40fa <Task_Marks_Handler_Callback+0x12>
				Task_Comps[i].TIMCount = Task_Comps[i].TRITime;
				Task_Comps[i].Run = 1; /* The task can be run */
			}
		}
	}
}
    40f8:	1481      	pop      	r4
		if (Task_Comps[i].TIMCount) /* If the time is not 0 */
    40fa:	8b41      	ld.h      	r2, (r3, 0x2)
    40fc:	3a40      	cmpnei      	r2, 0
    40fe:	0c0a      	bf      	0x4112	// 4112 <Task_Marks_Handler_Callback+0x2a>
			Task_Comps[i].TIMCount--;		 /* Time counter decrement */
    4100:	2a00      	subi      	r2, 1
    4102:	7489      	zexth      	r2, r2
			if (Task_Comps[i].TIMCount == 0) /* If time arrives */
    4104:	3a40      	cmpnei      	r2, 0
			Task_Comps[i].TIMCount--;		 /* Time counter decrement */
    4106:	ab41      	st.h      	r2, (r3, 0x2)
			if (Task_Comps[i].TIMCount == 0) /* If time arrives */
    4108:	0805      	bt      	0x4112	// 4112 <Task_Marks_Handler_Callback+0x2a>
				Task_Comps[i].TIMCount = Task_Comps[i].TRITime;
    410a:	8b42      	ld.h      	r2, (r3, 0x4)
    410c:	ab41      	st.h      	r2, (r3, 0x2)
				Task_Comps[i].Run = 1; /* The task can be run */
    410e:	3201      	movi      	r2, 1
    4110:	a340      	st.b      	r2, (r3, 0x0)
	for (i = 0; i < Tasks_Max; i++)
    4112:	2100      	addi      	r1, 1
    4114:	7444      	zextb      	r1, r1
    4116:	60d0      	addu      	r3, r4
    4118:	07ee      	br      	0x40f4	// 40f4 <Task_Marks_Handler_Callback+0xc>
    411a:	0000      	bkpt
    411c:	20000068 	.long	0x20000068

Disassembly of section .text.Task_Pro_Handler_Callback:

00004120 <Task_Pro_Handler_Callback>:
// 返回: None.
// 版本: V1.0, 2012-10-22
//========================================================================

void Task_Pro_Handler_Callback(void)
{
    4120:	14d3      	push      	r4-r6, r15
	U8_T i;
	for (i = 0; i < Tasks_Max; i++)
    4122:	10ab      	lrw      	r5, 0x20000068	// 414c <Task_Pro_Handler_Callback+0x2c>
    4124:	3400      	movi      	r4, 0
	{
		if (Task_Comps[i].Run) /* If task can be run */
    4126:	5dce      	addi      	r6, r5, 4
	for (i = 0; i < Tasks_Max; i++)
    4128:	8560      	ld.b      	r3, (r5, 0x0)
    412a:	64d0      	cmphs      	r4, r3
    412c:	0c02      	bf      	0x4130	// 4130 <Task_Pro_Handler_Callback+0x10>
		{
			Task_Comps[i].Run = 0;	  /* Flag clear 0 */
			Task_Comps[i].TaskHook(); /* Run task */
		}
	}
    412e:	1493      	pop      	r4-r6, r15
		if (Task_Comps[i].Run) /* If task can be run */
    4130:	330c      	movi      	r3, 12
    4132:	7cd0      	mult      	r3, r4
    4134:	60d8      	addu      	r3, r6
    4136:	8340      	ld.b      	r2, (r3, 0x0)
    4138:	3a40      	cmpnei      	r2, 0
    413a:	0c05      	bf      	0x4144	// 4144 <Task_Pro_Handler_Callback+0x24>
			Task_Comps[i].Run = 0;	  /* Flag clear 0 */
    413c:	3200      	movi      	r2, 0
    413e:	a340      	st.b      	r2, (r3, 0x0)
			Task_Comps[i].TaskHook(); /* Run task */
    4140:	9362      	ld.w      	r3, (r3, 0x8)
    4142:	7bcd      	jsr      	r3
	for (i = 0; i < Tasks_Max; i++)
    4144:	2400      	addi      	r4, 1
    4146:	7510      	zextb      	r4, r4
    4148:	07f0      	br      	0x4128	// 4128 <Task_Pro_Handler_Callback+0x8>
    414a:	0000      	bkpt
    414c:	20000068 	.long	0x20000068

Disassembly of section .text.gui_home:

00004150 <gui_home>:
        LCD_Fill(0, 0, 160, 80, LGRAY);
    }
    (*key_table[index].operation)();
}
void gui_home(void)
{
    4150:	14d4      	push      	r4-r7, r15
    4152:	1423      	subi      	r14, r14, 12

    KEY_SET_SHORT = 0;
    4154:	1156      	lrw      	r2, 0x20000220	// 422c <gui_home+0xdc>
    4156:	8260      	ld.b      	r3, (r2, 0x0)
    KEY_SET_LONG = 0;
    KEY_UP_LONG = 0;
    KEY_UP_SHORT = 0;
    KEY_DOWN_LONG = 0;
    KEY_DOWN_SHORT = 0;
    4158:	31c0      	movi      	r1, 192
    415a:	68c4      	and      	r3, r1
    415c:	a260      	st.b      	r3, (r2, 0x0)

    LCD_ShowIntNum(10, 0, adc_result_conver[CH_USB4], 4, RED, WHITE, 16);
    415e:	36f8      	movi      	r6, 248
    4160:	1174      	lrw      	r3, 0x20000100	// 4230 <gui_home+0xe0>
    4162:	3410      	movi      	r4, 16
    4164:	8b43      	ld.h      	r2, (r3, 0x6)
    4166:	46c8      	lsli      	r6, r6, 8
    4168:	1173      	lrw      	r3, 0xffff	// 4234 <gui_home+0xe4>
    LCD_ShowString(45, 0, "mA", BLACK, GREEN, 16, 0);
    416a:	35fc      	movi      	r5, 252
    416c:	3700      	movi      	r7, 0
    416e:	45a3      	lsli      	r5, r5, 3
    LCD_ShowIntNum(10, 0, adc_result_conver[CH_USB4], 4, RED, WHITE, 16);
    4170:	b861      	st.w      	r3, (r14, 0x4)
    4172:	b882      	st.w      	r4, (r14, 0x8)
    4174:	b8c0      	st.w      	r6, (r14, 0x0)
    4176:	3304      	movi      	r3, 4
    4178:	3100      	movi      	r1, 0
    417a:	300a      	movi      	r0, 10
    417c:	e0000396 	bsr      	0x48a8	// 48a8 <LCD_ShowIntNum>
    LCD_ShowString(45, 0, "mA", BLACK, GREEN, 16, 0);
    4180:	b8e2      	st.w      	r7, (r14, 0x8)
    4182:	b881      	st.w      	r4, (r14, 0x4)
    4184:	b8a0      	st.w      	r5, (r14, 0x0)
    4186:	3300      	movi      	r3, 0
    4188:	114c      	lrw      	r2, 0x975a	// 4238 <gui_home+0xe8>
    418a:	3100      	movi      	r1, 0
    418c:	302d      	movi      	r0, 45
    418e:	e000036d 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowIntNum(10, 20, adc_result_conver[CH_USB3], 4, RED, WHITE, 16);
    4192:	1168      	lrw      	r3, 0x20000100	// 4230 <gui_home+0xe0>
    4194:	8b42      	ld.h      	r2, (r3, 0x4)
    4196:	1168      	lrw      	r3, 0xffff	// 4234 <gui_home+0xe4>
    4198:	b861      	st.w      	r3, (r14, 0x4)
    419a:	b882      	st.w      	r4, (r14, 0x8)
    419c:	b8c0      	st.w      	r6, (r14, 0x0)
    419e:	3304      	movi      	r3, 4
    41a0:	3114      	movi      	r1, 20
    41a2:	300a      	movi      	r0, 10
    41a4:	e0000382 	bsr      	0x48a8	// 48a8 <LCD_ShowIntNum>
    LCD_ShowString(45, 20, "mA", BLACK, GREEN, 16, 0);
    41a8:	b8e2      	st.w      	r7, (r14, 0x8)
    41aa:	b881      	st.w      	r4, (r14, 0x4)
    41ac:	b8a0      	st.w      	r5, (r14, 0x0)
    41ae:	3300      	movi      	r3, 0
    41b0:	1142      	lrw      	r2, 0x975a	// 4238 <gui_home+0xe8>
    41b2:	3114      	movi      	r1, 20
    41b4:	302d      	movi      	r0, 45
    41b6:	e0000359 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowIntNum(10, 40, adc_result_conver[CH_USB2], 4, RED, WHITE, 16);
    41ba:	107e      	lrw      	r3, 0x20000100	// 4230 <gui_home+0xe0>
    41bc:	8b41      	ld.h      	r2, (r3, 0x2)
    41be:	107e      	lrw      	r3, 0xffff	// 4234 <gui_home+0xe4>
    41c0:	b861      	st.w      	r3, (r14, 0x4)
    41c2:	b882      	st.w      	r4, (r14, 0x8)
    41c4:	b8c0      	st.w      	r6, (r14, 0x0)
    41c6:	3304      	movi      	r3, 4
    41c8:	3128      	movi      	r1, 40
    41ca:	300a      	movi      	r0, 10
    41cc:	e000036e 	bsr      	0x48a8	// 48a8 <LCD_ShowIntNum>
    LCD_ShowString(45, 40, "mA(<50)", BLACK, GREEN, 16, 0);
    41d0:	b8e2      	st.w      	r7, (r14, 0x8)
    41d2:	b881      	st.w      	r4, (r14, 0x4)
    41d4:	b8a0      	st.w      	r5, (r14, 0x0)
    41d6:	3300      	movi      	r3, 0
    41d8:	1059      	lrw      	r2, 0x975d	// 423c <gui_home+0xec>
    41da:	3128      	movi      	r1, 40
    41dc:	302d      	movi      	r0, 45
    41de:	e0000345 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowIntNum(10, 60, adc_result_conver[CH_USB1], 4, RED, WHITE, 16);
    41e2:	1074      	lrw      	r3, 0x20000100	// 4230 <gui_home+0xe0>
    41e4:	8b40      	ld.h      	r2, (r3, 0x0)
    41e6:	1074      	lrw      	r3, 0xffff	// 4234 <gui_home+0xe4>
    41e8:	b861      	st.w      	r3, (r14, 0x4)
    41ea:	b882      	st.w      	r4, (r14, 0x8)
    41ec:	b8c0      	st.w      	r6, (r14, 0x0)
    41ee:	3304      	movi      	r3, 4
    41f0:	313c      	movi      	r1, 60
    41f2:	300a      	movi      	r0, 10
    41f4:	e000035a 	bsr      	0x48a8	// 48a8 <LCD_ShowIntNum>
    LCD_ShowString(45, 60, "mA", BLACK, GREEN, 16, 0);
    41f8:	b8e2      	st.w      	r7, (r14, 0x8)
    41fa:	b881      	st.w      	r4, (r14, 0x4)
    41fc:	b8a0      	st.w      	r5, (r14, 0x0)
    41fe:	3300      	movi      	r3, 0
    4200:	104e      	lrw      	r2, 0x975a	// 4238 <gui_home+0xe8>
    4202:	313c      	movi      	r1, 60
    4204:	302d      	movi      	r0, 45
    4206:	e0000331 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_Fill(0,0,160,80,BLUE);
    420a:	331f      	movi      	r3, 31
    420c:	b860      	st.w      	r3, (r14, 0x0)
    420e:	32a0      	movi      	r2, 160
    4210:	3350      	movi      	r3, 80
    4212:	3100      	movi      	r1, 0
    4214:	3000      	movi      	r0, 0
    4216:	e000026d 	bsr      	0x46f0	// 46f0 <LCD_Fill>
    LCD_Fill(0, 0, 160, 80, BLACK);
    421a:	b8e0      	st.w      	r7, (r14, 0x0)
    421c:	3350      	movi      	r3, 80
    421e:	32a0      	movi      	r2, 160
    4220:	3100      	movi      	r1, 0
    4222:	3000      	movi      	r0, 0
    4224:	e0000266 	bsr      	0x46f0	// 46f0 <LCD_Fill>
}
    4228:	1403      	addi      	r14, r14, 12
    422a:	1494      	pop      	r4-r7, r15
    422c:	20000220 	.long	0x20000220
    4230:	20000100 	.long	0x20000100
    4234:	0000ffff 	.long	0x0000ffff
    4238:	0000975a 	.long	0x0000975a
    423c:	0000975d 	.long	0x0000975d

Disassembly of section .text.gui_set:

00004240 <gui_set>:
void gui_set(void)
{
    4240:	14d1      	push      	r4, r15
    4242:	1423      	subi      	r14, r14, 12
    KEY_SET_SHORT = 0;
    4244:	1144      	lrw      	r2, 0x20000220	// 42d4 <gui_set+0x94>
    4246:	8260      	ld.b      	r3, (r2, 0x0)
    KEY_SET_LONG = 0;
    KEY_UP_LONG = 0;
    KEY_DOWN_LONG = 0;
    4248:	31d4      	movi      	r1, 212
    424a:	68c4      	and      	r3, r1
   

    if(KEY_UP_SHORT)
    424c:	3104      	movi      	r1, 4
    424e:	684c      	and      	r1, r3
    4250:	3940      	cmpnei      	r1, 0
    KEY_DOWN_LONG = 0;
    4252:	a260      	st.b      	r3, (r2, 0x0)
    4254:	1181      	lrw      	r4, 0x20000158	// 42d8 <gui_set+0x98>
    if(KEY_UP_SHORT)
    4256:	0c07      	bf      	0x4264	// 4264 <gui_set+0x24>
    {
        KEY_UP_SHORT = 0;
    4258:	3b82      	bclri      	r3, 2
    425a:	a260      	st.b      	r3, (r2, 0x0)
        if(gui_arguments.set_select < 1)
    425c:	8460      	ld.b      	r3, (r4, 0x0)
            gui_arguments.set_select++;
    425e:	3b40      	cmpnei      	r3, 0
    4260:	64c3      	mvcv      	r3
    4262:	a460      	st.b      	r3, (r4, 0x0)
        else
            gui_arguments.set_select = 0;

    }

    if(KEY_DOWN_SHORT)
    4264:	8260      	ld.b      	r3, (r2, 0x0)
    4266:	3110      	movi      	r1, 16
    4268:	684c      	and      	r1, r3
    426a:	3940      	cmpnei      	r1, 0
    426c:	0c08      	bf      	0x427c	// 427c <gui_set+0x3c>
    {
        KEY_DOWN_SHORT = 0;
    426e:	3b84      	bclri      	r3, 4
    4270:	a260      	st.b      	r3, (r2, 0x0)
        if(gui_arguments.set_select )
    4272:	8460      	ld.b      	r3, (r4, 0x0)
    4274:	3b40      	cmpnei      	r3, 0
    4276:	0c26      	bf      	0x42c2	// 42c2 <gui_set+0x82>
        {
            gui_arguments.set_select--;
    4278:	2b00      	subi      	r3, 1
        }
        else
            gui_arguments.set_select = 1;
    427a:	a460      	st.b      	r3, (r4, 0x0)
    }
    key_table[1].set = gui_arguments.set_select + 2;
    427c:	8460      	ld.b      	r3, (r4, 0x0)
    427e:	5b26      	addi      	r1, r3, 2
    4280:	1057      	lrw      	r2, 0x20000090	// 42dc <gui_set+0x9c>
    LCD_ShowString(0, 0, "calibration", BLACK, gui_arguments.set_select == 0 ? GREEN : WHITE, 16, 0);
    4282:	3b40      	cmpnei      	r3, 0
    key_table[1].set = gui_arguments.set_select + 2;
    4284:	a22d      	st.b      	r1, (r2, 0xd)
    LCD_ShowString(0, 0, "calibration", BLACK, gui_arguments.set_select == 0 ? GREEN : WHITE, 16, 0);
    4286:	0c20      	bf      	0x42c6	// 42c6 <gui_set+0x86>
    4288:	1076      	lrw      	r3, 0xffff	// 42e0 <gui_set+0xa0>
    428a:	3200      	movi      	r2, 0
    428c:	b842      	st.w      	r2, (r14, 0x8)
    428e:	3210      	movi      	r2, 16
    4290:	b841      	st.w      	r2, (r14, 0x4)
    4292:	b860      	st.w      	r3, (r14, 0x0)
    4294:	3100      	movi      	r1, 0
    4296:	3300      	movi      	r3, 0
    4298:	1053      	lrw      	r2, 0x9765	// 42e4 <gui_set+0xa4>
    429a:	3000      	movi      	r0, 0
    429c:	e00002e6 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(0, 20, "option2", BLACK, gui_arguments.set_select == 1 ? GREEN : WHITE, 16, 0);
    42a0:	8460      	ld.b      	r3, (r4, 0x0)
    42a2:	3b41      	cmpnei      	r3, 1
    42a4:	0c14      	bf      	0x42cc	// 42cc <gui_set+0x8c>
    42a6:	106f      	lrw      	r3, 0xffff	// 42e0 <gui_set+0xa0>
    42a8:	3200      	movi      	r2, 0
    42aa:	b842      	st.w      	r2, (r14, 0x8)
    42ac:	3210      	movi      	r2, 16
    42ae:	b841      	st.w      	r2, (r14, 0x4)
    42b0:	b860      	st.w      	r3, (r14, 0x0)
    42b2:	3114      	movi      	r1, 20
    42b4:	3300      	movi      	r3, 0
    42b6:	104d      	lrw      	r2, 0x9771	// 42e8 <gui_set+0xa8>
    42b8:	3000      	movi      	r0, 0
    42ba:	e00002d7 	bsr      	0x4868	// 4868 <LCD_ShowString>
    
}
    42be:	1403      	addi      	r14, r14, 12
    42c0:	1491      	pop      	r4, r15
            gui_arguments.set_select = 1;
    42c2:	3301      	movi      	r3, 1
    42c4:	07db      	br      	0x427a	// 427a <gui_set+0x3a>
    LCD_ShowString(0, 0, "calibration", BLACK, gui_arguments.set_select == 0 ? GREEN : WHITE, 16, 0);
    42c6:	33fc      	movi      	r3, 252
    42c8:	4363      	lsli      	r3, r3, 3
    42ca:	07e0      	br      	0x428a	// 428a <gui_set+0x4a>
    LCD_ShowString(0, 20, "option2", BLACK, gui_arguments.set_select == 1 ? GREEN : WHITE, 16, 0);
    42cc:	33fc      	movi      	r3, 252
    42ce:	4363      	lsli      	r3, r3, 3
    42d0:	07ec      	br      	0x42a8	// 42a8 <gui_set+0x68>
    42d2:	0000      	bkpt
    42d4:	20000220 	.long	0x20000220
    42d8:	20000158 	.long	0x20000158
    42dc:	20000090 	.long	0x20000090
    42e0:	0000ffff 	.long	0x0000ffff
    42e4:	00009765 	.long	0x00009765
    42e8:	00009771 	.long	0x00009771

Disassembly of section .text.gui_option2:

000042ec <gui_option2>:
    LCD_ShowString(110, 20, "cal_2A", BLACK, cal_ok.cal_12 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(110, 40, "cal_2A", BLACK, cal_ok.cal_22 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(110, 60, "cal_2A", BLACK, cal_ok.cal_32 ? GREEN : WHITE, 16, 0);
}
void gui_option2(void)
{
    42ec:	14d0      	push      	r15
    42ee:	1423      	subi      	r14, r14, 12
    KEY_SET_SHORT = 0;
    42f0:	104a      	lrw      	r2, 0x20000220	// 4318 <gui_option2+0x2c>
    42f2:	8260      	ld.b      	r3, (r2, 0x0)
    KEY_SET_LONG = 0;
    KEY_UP_LONG = 0;
    KEY_UP_SHORT = 0;
    KEY_DOWN_LONG = 0;
    KEY_DOWN_SHORT = 0;
    42f4:	31c0      	movi      	r1, 192
    42f6:	68c4      	and      	r3, r1
    42f8:	a260      	st.b      	r3, (r2, 0x0)
    LCD_ShowString(0, 0, "option2", BLACK, RED, 16, 0);
    42fa:	3300      	movi      	r3, 0
    42fc:	b862      	st.w      	r3, (r14, 0x8)
    42fe:	3310      	movi      	r3, 16
    4300:	b861      	st.w      	r3, (r14, 0x4)
    4302:	33f8      	movi      	r3, 248
    4304:	4368      	lsli      	r3, r3, 8
    4306:	b860      	st.w      	r3, (r14, 0x0)
    4308:	3100      	movi      	r1, 0
    430a:	3300      	movi      	r3, 0
    430c:	1044      	lrw      	r2, 0x9771	// 431c <gui_option2+0x30>
    430e:	3000      	movi      	r0, 0
    4310:	e00002ac 	bsr      	0x4868	// 4868 <LCD_ShowString>

}
    4314:	1403      	addi      	r14, r14, 12
    4316:	1490      	pop      	r15
    4318:	20000220 	.long	0x20000220
    431c:	00009771 	.long	0x00009771

Disassembly of section .text.gui_calibration:

00004320 <gui_calibration>:
{
    4320:	14d1      	push      	r4, r15
    4322:	1423      	subi      	r14, r14, 12
    KEY_SET_SHORT = 0;
    4324:	0268      	lrw      	r3, 0x20000220	// 4600 <gui_calibration+0x2e0>
    4326:	8340      	ld.b      	r2, (r3, 0x0)
    KEY_SET_LONG = 0;
    4328:	31fc      	movi      	r1, 252
    432a:	6884      	and      	r2, r1
    if (KEY_UP_SHORT)
    432c:	3104      	movi      	r1, 4
    432e:	6848      	and      	r1, r2
    4330:	3940      	cmpnei      	r1, 0
    KEY_SET_LONG = 0;
    4332:	a340      	st.b      	r2, (r3, 0x0)
    4334:	028b      	lrw      	r4, 0x20000158	// 4604 <gui_calibration+0x2e4>
    if (KEY_UP_SHORT)
    4336:	0c08      	bf      	0x4346	// 4346 <gui_calibration+0x26>
        KEY_UP_SHORT = 0;
    4338:	3a82      	bclri      	r2, 2
    433a:	a340      	st.b      	r2, (r3, 0x0)
        if (gui_arguments.calibration_select < 3)
    433c:	8441      	ld.b      	r2, (r4, 0x1)
    433e:	3a02      	cmphsi      	r2, 3
    4340:	081f      	bt      	0x437e	// 437e <gui_calibration+0x5e>
            gui_arguments.calibration_select++;
    4342:	2200      	addi      	r2, 1
            gui_arguments.calibration_select = 0;
    4344:	a441      	st.b      	r2, (r4, 0x1)
    if (KEY_DOWN_SHORT)
    4346:	8340      	ld.b      	r2, (r3, 0x0)
    4348:	3110      	movi      	r1, 16
    434a:	6848      	and      	r1, r2
    434c:	3940      	cmpnei      	r1, 0
    434e:	0c08      	bf      	0x435e	// 435e <gui_calibration+0x3e>
        KEY_DOWN_SHORT = 0;
    4350:	3a84      	bclri      	r2, 4
    4352:	a340      	st.b      	r2, (r3, 0x0)
        if (gui_arguments.calibration_select)
    4354:	8441      	ld.b      	r2, (r4, 0x1)
    4356:	3a40      	cmpnei      	r2, 0
    4358:	0c15      	bf      	0x4382	// 4382 <gui_calibration+0x62>
            gui_arguments.calibration_select--;
    435a:	2a00      	subi      	r2, 1
            gui_arguments.calibration_select = 3;
    435c:	a441      	st.b      	r2, (r4, 0x1)
    if (KEY_UP_LONG)
    435e:	8340      	ld.b      	r2, (r3, 0x0)
    4360:	3108      	movi      	r1, 8
    4362:	6848      	and      	r1, r2
    4364:	3940      	cmpnei      	r1, 0
    4366:	0c17      	bf      	0x4394	// 4394 <gui_calibration+0x74>
        switch (gui_arguments.calibration_select)
    4368:	8401      	ld.b      	r0, (r4, 0x1)
        KEY_UP_LONG =0;
    436a:	3a83      	bclri      	r2, 3
        switch (gui_arguments.calibration_select)
    436c:	3803      	cmphsi      	r0, 4
        KEY_UP_LONG =0;
    436e:	a340      	st.b      	r2, (r3, 0x0)
        switch (gui_arguments.calibration_select)
    4370:	0810      	bt      	0x4390	// 4390 <gui_calibration+0x70>
    4372:	0259      	lrw      	r2, 0x200000f8	// 4608 <gui_calibration+0x2e8>
            cal_ok.cal_30 = 1;
    4374:	8422      	ld.b      	r1, (r4, 0x2)
        switch (gui_arguments.calibration_select)
    4376:	e3ffe4c3 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    437a:	2006      	.short	0x2006
    437c:	2a25      	.short	0x2a25
            gui_arguments.calibration_select = 0;
    437e:	3200      	movi      	r2, 0
    4380:	07e2      	br      	0x4344	// 4344 <gui_calibration+0x24>
            gui_arguments.calibration_select = 3;
    4382:	3203      	movi      	r2, 3
    4384:	07ec      	br      	0x435c	// 435c <gui_calibration+0x3c>
            cal_ok.cal_00 = 1;
    4386:	39a0      	bseti      	r1, 0
    4388:	a422      	st.b      	r1, (r4, 0x2)
            cal_0_AD0 = adc_result_direct[CH_USB4];
    438a:	8a43      	ld.h      	r2, (r2, 0x6)
    438c:	023f      	lrw      	r1, 0x20000128	// 460c <gui_calibration+0x2ec>
            cal_3_AD0 = adc_result_direct[CH_USB1];
    438e:	a940      	st.h      	r2, (r1, 0x0)
        t = 5;
    4390:	3205      	movi      	r2, 5
    4392:	a443      	st.b      	r2, (r4, 0x3)
    if (KEY_DOWN_LONG)
    4394:	8340      	ld.b      	r2, (r3, 0x0)
    4396:	3120      	movi      	r1, 32
    4398:	6848      	and      	r1, r2
    439a:	3940      	cmpnei      	r1, 0
    439c:	0c2e      	bf      	0x43f8	// 43f8 <gui_calibration+0xd8>
        KEY_DOWN_LONG = 0;
    439e:	3a85      	bclri      	r2, 5
    43a0:	a340      	st.b      	r2, (r3, 0x0)
        switch (gui_arguments.calibration_select)
    43a2:	8441      	ld.b      	r2, (r4, 0x1)
    43a4:	3a03      	cmphsi      	r2, 4
    43a6:	081e      	bt      	0x43e2	// 43e2 <gui_calibration+0xc2>
    43a8:	6c0b      	mov      	r0, r2
    43aa:	0367      	lrw      	r3, 0x200000f8	// 4608 <gui_calibration+0x2e8>
            cal_ok.cal_32 = 1;
    43ac:	8422      	ld.b      	r1, (r4, 0x2)
        switch (gui_arguments.calibration_select)
    43ae:	e3ffe4b1 	bsr      	0xd10	// d10 <___gnu_csky_case_uhi>
    43b2:	0013      	.short	0x0013
    43b4:	00f600f1 	.long	0x00f600f1
    43b8:	00fb      	.short	0x00fb
            cal_ok.cal_10 = 1;
    43ba:	39a1      	bseti      	r1, 1
    43bc:	a422      	st.b      	r1, (r4, 0x2)
            cal_1_AD0 = adc_result_direct[CH_USB3];
    43be:	8a42      	ld.h      	r2, (r2, 0x4)
    43c0:	032b      	lrw      	r1, 0x2000012e	// 4610 <gui_calibration+0x2f0>
    43c2:	07e6      	br      	0x438e	// 438e <gui_calibration+0x6e>
            cal_ok.cal_20 = 1;
    43c4:	39a2      	bseti      	r1, 2
    43c6:	a422      	st.b      	r1, (r4, 0x2)
            cal_2_AD0 = adc_result_direct[CH_USB2];
    43c8:	8a41      	ld.h      	r2, (r2, 0x2)
    43ca:	032c      	lrw      	r1, 0x20000132	// 4614 <gui_calibration+0x2f4>
    43cc:	07e1      	br      	0x438e	// 438e <gui_calibration+0x6e>
            cal_ok.cal_30 = 1;
    43ce:	39a3      	bseti      	r1, 3
    43d0:	a422      	st.b      	r1, (r4, 0x2)
            cal_3_AD0 = adc_result_direct[CH_USB1];
    43d2:	8a40      	ld.h      	r2, (r2, 0x0)
    43d4:	032e      	lrw      	r1, 0x20000136	// 4618 <gui_calibration+0x2f8>
    43d6:	07dc      	br      	0x438e	// 438e <gui_calibration+0x6e>
            cal_ok.cal_02 = 1;
    43d8:	39a4      	bseti      	r1, 4
    43da:	a422      	st.b      	r1, (r4, 0x2)
            cal_0_AD2 = adc_result_direct[CH_USB4];
    43dc:	8b63      	ld.h      	r3, (r3, 0x6)
    43de:	032f      	lrw      	r1, 0x20000126	// 461c <gui_calibration+0x2fc>
            cal_3_AD2 = adc_result_direct[CH_USB1];
    43e0:	a960      	st.h      	r3, (r1, 0x0)
        cal_comput(gui_arguments.calibration_select);
    43e2:	6c0b      	mov      	r0, r2
    43e4:	e3fffdbe 	bsr      	0x3f60	// 3f60 <cal_comput>
        Page_ProgramData(DROM_PageAdd0,4,cal0_a.arr);
    43e8:	3080      	movi      	r0, 128
    43ea:	0351      	lrw      	r2, 0x20000230	// 4620 <gui_calibration+0x300>
    43ec:	3104      	movi      	r1, 4
    43ee:	4015      	lsli      	r0, r0, 21
    43f0:	e3fff224 	bsr      	0x2838	// 2838 <Page_ProgramData>
        t = 5;
    43f4:	3305      	movi      	r3, 5
    43f6:	a463      	st.b      	r3, (r4, 0x3)
    if (t)
    43f8:	8463      	ld.b      	r3, (r4, 0x3)
    43fa:	3b40      	cmpnei      	r3, 0
    43fc:	0c03      	bf      	0x4402	// 4402 <gui_calibration+0xe2>
        t--;
    43fe:	2b00      	subi      	r3, 1
    4400:	a463      	st.b      	r3, (r4, 0x3)
    if(!t)
    4402:	8463      	ld.b      	r3, (r4, 0x3)
    4404:	3b40      	cmpnei      	r3, 0
    4406:	0802      	bt      	0x440a	// 440a <gui_calibration+0xea>
        cal_ok.cal_32 = 0;
    4408:	a462      	st.b      	r3, (r4, 0x2)
    LCD_ShowString(0, 0,   "cal1", BLACK, gui_arguments.calibration_select == 0 ? GREEN : WHITE, 16, 0);
    440a:	8461      	ld.b      	r3, (r4, 0x1)
    440c:	3b40      	cmpnei      	r3, 0
    440e:	0cd4      	bf      	0x45b6	// 45b6 <gui_calibration+0x296>
    4410:	037a      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    4412:	3200      	movi      	r2, 0
    4414:	b842      	st.w      	r2, (r14, 0x8)
    4416:	3210      	movi      	r2, 16
    4418:	b841      	st.w      	r2, (r14, 0x4)
    441a:	b860      	st.w      	r3, (r14, 0x0)
    441c:	3100      	movi      	r1, 0
    441e:	3300      	movi      	r3, 0
    4420:	035d      	lrw      	r2, 0x9779	// 4628 <gui_calibration+0x308>
    4422:	3000      	movi      	r0, 0
    4424:	e0000222 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(0, 20, "cal2", BLACK, gui_arguments.calibration_select == 1 ? GREEN : WHITE, 16, 0);
    4428:	8461      	ld.b      	r3, (r4, 0x1)
    442a:	3b41      	cmpnei      	r3, 1
    442c:	0cc8      	bf      	0x45bc	// 45bc <gui_calibration+0x29c>
    442e:	137e      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    4430:	3200      	movi      	r2, 0
    4432:	b842      	st.w      	r2, (r14, 0x8)
    4434:	3210      	movi      	r2, 16
    4436:	b841      	st.w      	r2, (r14, 0x4)
    4438:	b860      	st.w      	r3, (r14, 0x0)
    443a:	3114      	movi      	r1, 20
    443c:	3300      	movi      	r3, 0
    443e:	135c      	lrw      	r2, 0x977e	// 462c <gui_calibration+0x30c>
    4440:	3000      	movi      	r0, 0
    4442:	e0000213 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(0, 40, "cal3", BLACK, gui_arguments.calibration_select == 2 ? GREEN : WHITE, 16, 0);
    4446:	8461      	ld.b      	r3, (r4, 0x1)
    4448:	3b42      	cmpnei      	r3, 2
    444a:	0cbc      	bf      	0x45c2	// 45c2 <gui_calibration+0x2a2>
    444c:	1376      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    444e:	3200      	movi      	r2, 0
    4450:	b842      	st.w      	r2, (r14, 0x8)
    4452:	3210      	movi      	r2, 16
    4454:	b841      	st.w      	r2, (r14, 0x4)
    4456:	b860      	st.w      	r3, (r14, 0x0)
    4458:	3128      	movi      	r1, 40
    445a:	3300      	movi      	r3, 0
    445c:	1355      	lrw      	r2, 0x9783	// 4630 <gui_calibration+0x310>
    445e:	3000      	movi      	r0, 0
    4460:	e0000204 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(0, 60, "cal4", BLACK, gui_arguments.calibration_select == 3 ? GREEN : WHITE, 16, 0);
    4464:	8461      	ld.b      	r3, (r4, 0x1)
    4466:	3b43      	cmpnei      	r3, 3
    4468:	0cb0      	bf      	0x45c8	// 45c8 <gui_calibration+0x2a8>
    446a:	136f      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    446c:	3200      	movi      	r2, 0
    446e:	b842      	st.w      	r2, (r14, 0x8)
    4470:	3210      	movi      	r2, 16
    4472:	b841      	st.w      	r2, (r14, 0x4)
    4474:	b860      	st.w      	r3, (r14, 0x0)
    4476:	313c      	movi      	r1, 60
    4478:	3300      	movi      	r3, 0
    447a:	134f      	lrw      	r2, 0x9788	// 4634 <gui_calibration+0x314>
    447c:	3000      	movi      	r0, 0
    447e:	e00001f5 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(50, 0,  "cal_0A", BLACK, cal_ok.cal_00 ? GREEN : WHITE, 16, 0);
    4482:	8462      	ld.b      	r3, (r4, 0x2)
    4484:	3201      	movi      	r2, 1
    4486:	68c8      	and      	r3, r2
    4488:	3b40      	cmpnei      	r3, 0
    448a:	08a2      	bt      	0x45ce	// 45ce <gui_calibration+0x2ae>
    448c:	1366      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    448e:	3200      	movi      	r2, 0
    4490:	b842      	st.w      	r2, (r14, 0x8)
    4492:	3210      	movi      	r2, 16
    4494:	b841      	st.w      	r2, (r14, 0x4)
    4496:	b860      	st.w      	r3, (r14, 0x0)
    4498:	3100      	movi      	r1, 0
    449a:	3300      	movi      	r3, 0
    449c:	1347      	lrw      	r2, 0x978d	// 4638 <gui_calibration+0x318>
    449e:	3032      	movi      	r0, 50
    44a0:	e00001e4 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(50, 20, "cal_0A", BLACK, cal_ok.cal_10 ? GREEN : WHITE, 16, 0);
    44a4:	8462      	ld.b      	r3, (r4, 0x2)
    44a6:	3202      	movi      	r2, 2
    44a8:	68c8      	and      	r3, r2
    44aa:	3b40      	cmpnei      	r3, 0
    44ac:	0894      	bt      	0x45d4	// 45d4 <gui_calibration+0x2b4>
    44ae:	127e      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    44b0:	3200      	movi      	r2, 0
    44b2:	b842      	st.w      	r2, (r14, 0x8)
    44b4:	3210      	movi      	r2, 16
    44b6:	b841      	st.w      	r2, (r14, 0x4)
    44b8:	b860      	st.w      	r3, (r14, 0x0)
    44ba:	3114      	movi      	r1, 20
    44bc:	3300      	movi      	r3, 0
    44be:	125f      	lrw      	r2, 0x978d	// 4638 <gui_calibration+0x318>
    44c0:	3032      	movi      	r0, 50
    44c2:	e00001d3 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(50, 40, "cal_0A", BLACK, cal_ok.cal_20 ? GREEN : WHITE, 16, 0);
    44c6:	8462      	ld.b      	r3, (r4, 0x2)
    44c8:	3204      	movi      	r2, 4
    44ca:	68c8      	and      	r3, r2
    44cc:	3b40      	cmpnei      	r3, 0
    44ce:	0886      	bt      	0x45da	// 45da <gui_calibration+0x2ba>
    44d0:	1275      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    44d2:	3200      	movi      	r2, 0
    44d4:	b842      	st.w      	r2, (r14, 0x8)
    44d6:	3210      	movi      	r2, 16
    44d8:	b841      	st.w      	r2, (r14, 0x4)
    44da:	b860      	st.w      	r3, (r14, 0x0)
    44dc:	3128      	movi      	r1, 40
    44de:	3300      	movi      	r3, 0
    44e0:	1256      	lrw      	r2, 0x978d	// 4638 <gui_calibration+0x318>
    44e2:	3032      	movi      	r0, 50
    44e4:	e00001c2 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(50, 60, "cal_0A", BLACK, cal_ok.cal_30 ? GREEN : WHITE, 16, 0);
    44e8:	8462      	ld.b      	r3, (r4, 0x2)
    44ea:	3208      	movi      	r2, 8
    44ec:	68c8      	and      	r3, r2
    44ee:	3b40      	cmpnei      	r3, 0
    44f0:	0878      	bt      	0x45e0	// 45e0 <gui_calibration+0x2c0>
    44f2:	126d      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    44f4:	3200      	movi      	r2, 0
    44f6:	b842      	st.w      	r2, (r14, 0x8)
    44f8:	3210      	movi      	r2, 16
    44fa:	b841      	st.w      	r2, (r14, 0x4)
    44fc:	b860      	st.w      	r3, (r14, 0x0)
    44fe:	313c      	movi      	r1, 60
    4500:	3300      	movi      	r3, 0
    4502:	124e      	lrw      	r2, 0x978d	// 4638 <gui_calibration+0x318>
    4504:	3032      	movi      	r0, 50
    4506:	e00001b1 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(110, 0,  "cal_2A", BLACK, cal_ok.cal_02 ? GREEN : WHITE, 16, 0);
    450a:	8462      	ld.b      	r3, (r4, 0x2)
    450c:	3210      	movi      	r2, 16
    450e:	68c8      	and      	r3, r2
    4510:	3b40      	cmpnei      	r3, 0
    4512:	086a      	bt      	0x45e6	// 45e6 <gui_calibration+0x2c6>
    4514:	1264      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    4516:	3200      	movi      	r2, 0
    4518:	b842      	st.w      	r2, (r14, 0x8)
    451a:	3210      	movi      	r2, 16
    451c:	b841      	st.w      	r2, (r14, 0x4)
    451e:	b860      	st.w      	r3, (r14, 0x0)
    4520:	3100      	movi      	r1, 0
    4522:	3300      	movi      	r3, 0
    4524:	1246      	lrw      	r2, 0x9794	// 463c <gui_calibration+0x31c>
    4526:	306e      	movi      	r0, 110
    4528:	e00001a0 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(110, 20, "cal_2A", BLACK, cal_ok.cal_12 ? GREEN : WHITE, 16, 0);
    452c:	8462      	ld.b      	r3, (r4, 0x2)
    452e:	3220      	movi      	r2, 32
    4530:	68c8      	and      	r3, r2
    4532:	3b40      	cmpnei      	r3, 0
    4534:	085c      	bt      	0x45ec	// 45ec <gui_calibration+0x2cc>
    4536:	117c      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    4538:	3200      	movi      	r2, 0
    453a:	b842      	st.w      	r2, (r14, 0x8)
    453c:	3210      	movi      	r2, 16
    453e:	b841      	st.w      	r2, (r14, 0x4)
    4540:	b860      	st.w      	r3, (r14, 0x0)
    4542:	3114      	movi      	r1, 20
    4544:	3300      	movi      	r3, 0
    4546:	115e      	lrw      	r2, 0x9794	// 463c <gui_calibration+0x31c>
    4548:	306e      	movi      	r0, 110
    454a:	e000018f 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(110, 40, "cal_2A", BLACK, cal_ok.cal_22 ? GREEN : WHITE, 16, 0);
    454e:	8462      	ld.b      	r3, (r4, 0x2)
    4550:	3240      	movi      	r2, 64
    4552:	68c8      	and      	r3, r2
    4554:	3b40      	cmpnei      	r3, 0
    4556:	084e      	bt      	0x45f2	// 45f2 <gui_calibration+0x2d2>
    4558:	1173      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    455a:	3200      	movi      	r2, 0
    455c:	b842      	st.w      	r2, (r14, 0x8)
    455e:	3210      	movi      	r2, 16
    4560:	b841      	st.w      	r2, (r14, 0x4)
    4562:	b860      	st.w      	r3, (r14, 0x0)
    4564:	3128      	movi      	r1, 40
    4566:	3300      	movi      	r3, 0
    4568:	1155      	lrw      	r2, 0x9794	// 463c <gui_calibration+0x31c>
    456a:	306e      	movi      	r0, 110
    456c:	e000017e 	bsr      	0x4868	// 4868 <LCD_ShowString>
    LCD_ShowString(110, 60, "cal_2A", BLACK, cal_ok.cal_32 ? GREEN : WHITE, 16, 0);
    4570:	8462      	ld.b      	r3, (r4, 0x2)
    4572:	74ce      	sextb      	r3, r3
    4574:	3bdf      	btsti      	r3, 31
    4576:	0841      	bt      	0x45f8	// 45f8 <gui_calibration+0x2d8>
    4578:	116b      	lrw      	r3, 0xffff	// 4624 <gui_calibration+0x304>
    457a:	3200      	movi      	r2, 0
    457c:	b842      	st.w      	r2, (r14, 0x8)
    457e:	3210      	movi      	r2, 16
    4580:	b841      	st.w      	r2, (r14, 0x4)
    4582:	b860      	st.w      	r3, (r14, 0x0)
    4584:	313c      	movi      	r1, 60
    4586:	3300      	movi      	r3, 0
    4588:	114d      	lrw      	r2, 0x9794	// 463c <gui_calibration+0x31c>
    458a:	306e      	movi      	r0, 110
    458c:	e000016e 	bsr      	0x4868	// 4868 <LCD_ShowString>
}
    4590:	1403      	addi      	r14, r14, 12
    4592:	1491      	pop      	r4, r15
            cal_ok.cal_12 = 1;
    4594:	39a5      	bseti      	r1, 5
    4596:	a422      	st.b      	r1, (r4, 0x2)
            cal_1_AD2 = adc_result_direct[CH_USB3];
    4598:	8b62      	ld.h      	r3, (r3, 0x4)
    459a:	112a      	lrw      	r1, 0x2000012c	// 4640 <gui_calibration+0x320>
    459c:	0722      	br      	0x43e0	// 43e0 <gui_calibration+0xc0>
            cal_ok.cal_22 = 1;
    459e:	39a6      	bseti      	r1, 6
    45a0:	a422      	st.b      	r1, (r4, 0x2)
            cal_2_AD2 = adc_result_direct[CH_USB2];
    45a2:	8b61      	ld.h      	r3, (r3, 0x2)
    45a4:	1128      	lrw      	r1, 0x20000130	// 4644 <gui_calibration+0x324>
    45a6:	071d      	br      	0x43e0	// 43e0 <gui_calibration+0xc0>
            cal_ok.cal_32 = 1;
    45a8:	3000      	movi      	r0, 0
    45aa:	287f      	subi      	r0, 128
    45ac:	6c40      	or      	r1, r0
    45ae:	a422      	st.b      	r1, (r4, 0x2)
            cal_3_AD2 = adc_result_direct[CH_USB1];
    45b0:	8b60      	ld.h      	r3, (r3, 0x0)
    45b2:	1126      	lrw      	r1, 0x20000134	// 4648 <gui_calibration+0x328>
    45b4:	0716      	br      	0x43e0	// 43e0 <gui_calibration+0xc0>
    LCD_ShowString(0, 0,   "cal1", BLACK, gui_arguments.calibration_select == 0 ? GREEN : WHITE, 16, 0);
    45b6:	33fc      	movi      	r3, 252
    45b8:	4363      	lsli      	r3, r3, 3
    45ba:	072c      	br      	0x4412	// 4412 <gui_calibration+0xf2>
    LCD_ShowString(0, 20, "cal2", BLACK, gui_arguments.calibration_select == 1 ? GREEN : WHITE, 16, 0);
    45bc:	33fc      	movi      	r3, 252
    45be:	4363      	lsli      	r3, r3, 3
    45c0:	0738      	br      	0x4430	// 4430 <gui_calibration+0x110>
    LCD_ShowString(0, 40, "cal3", BLACK, gui_arguments.calibration_select == 2 ? GREEN : WHITE, 16, 0);
    45c2:	33fc      	movi      	r3, 252
    45c4:	4363      	lsli      	r3, r3, 3
    45c6:	0744      	br      	0x444e	// 444e <gui_calibration+0x12e>
    LCD_ShowString(0, 60, "cal4", BLACK, gui_arguments.calibration_select == 3 ? GREEN : WHITE, 16, 0);
    45c8:	33fc      	movi      	r3, 252
    45ca:	4363      	lsli      	r3, r3, 3
    45cc:	0750      	br      	0x446c	// 446c <gui_calibration+0x14c>
    LCD_ShowString(50, 0,  "cal_0A", BLACK, cal_ok.cal_00 ? GREEN : WHITE, 16, 0);
    45ce:	33fc      	movi      	r3, 252
    45d0:	4363      	lsli      	r3, r3, 3
    45d2:	075e      	br      	0x448e	// 448e <gui_calibration+0x16e>
    LCD_ShowString(50, 20, "cal_0A", BLACK, cal_ok.cal_10 ? GREEN : WHITE, 16, 0);
    45d4:	33fc      	movi      	r3, 252
    45d6:	4363      	lsli      	r3, r3, 3
    45d8:	076c      	br      	0x44b0	// 44b0 <gui_calibration+0x190>
    LCD_ShowString(50, 40, "cal_0A", BLACK, cal_ok.cal_20 ? GREEN : WHITE, 16, 0);
    45da:	33fc      	movi      	r3, 252
    45dc:	4363      	lsli      	r3, r3, 3
    45de:	077a      	br      	0x44d2	// 44d2 <gui_calibration+0x1b2>
    LCD_ShowString(50, 60, "cal_0A", BLACK, cal_ok.cal_30 ? GREEN : WHITE, 16, 0);
    45e0:	33fc      	movi      	r3, 252
    45e2:	4363      	lsli      	r3, r3, 3
    45e4:	0788      	br      	0x44f4	// 44f4 <gui_calibration+0x1d4>
    LCD_ShowString(110, 0,  "cal_2A", BLACK, cal_ok.cal_02 ? GREEN : WHITE, 16, 0);
    45e6:	33fc      	movi      	r3, 252
    45e8:	4363      	lsli      	r3, r3, 3
    45ea:	0796      	br      	0x4516	// 4516 <gui_calibration+0x1f6>
    LCD_ShowString(110, 20, "cal_2A", BLACK, cal_ok.cal_12 ? GREEN : WHITE, 16, 0);
    45ec:	33fc      	movi      	r3, 252
    45ee:	4363      	lsli      	r3, r3, 3
    45f0:	07a4      	br      	0x4538	// 4538 <gui_calibration+0x218>
    LCD_ShowString(110, 40, "cal_2A", BLACK, cal_ok.cal_22 ? GREEN : WHITE, 16, 0);
    45f2:	33fc      	movi      	r3, 252
    45f4:	4363      	lsli      	r3, r3, 3
    45f6:	07b2      	br      	0x455a	// 455a <gui_calibration+0x23a>
    LCD_ShowString(110, 60, "cal_2A", BLACK, cal_ok.cal_32 ? GREEN : WHITE, 16, 0);
    45f8:	33fc      	movi      	r3, 252
    45fa:	4363      	lsli      	r3, r3, 3
    45fc:	07bf      	br      	0x457a	// 457a <gui_calibration+0x25a>
    45fe:	0000      	bkpt
    4600:	20000220 	.long	0x20000220
    4604:	20000158 	.long	0x20000158
    4608:	200000f8 	.long	0x200000f8
    460c:	20000128 	.long	0x20000128
    4610:	2000012e 	.long	0x2000012e
    4614:	20000132 	.long	0x20000132
    4618:	20000136 	.long	0x20000136
    461c:	20000126 	.long	0x20000126
    4620:	20000230 	.long	0x20000230
    4624:	0000ffff 	.long	0x0000ffff
    4628:	00009779 	.long	0x00009779
    462c:	0000977e 	.long	0x0000977e
    4630:	00009783 	.long	0x00009783
    4634:	00009788 	.long	0x00009788
    4638:	0000978d 	.long	0x0000978d
    463c:	00009794 	.long	0x00009794
    4640:	2000012c 	.long	0x2000012c
    4644:	20000130 	.long	0x20000130
    4648:	20000134 	.long	0x20000134

Disassembly of section .text.task_gui:

0000464c <task_gui>:
{
    464c:	14d2      	push      	r4-r5, r15
    464e:	1421      	subi      	r14, r14, 4
    if(KEY_SET_SHORT)
    4650:	1164      	lrw      	r3, 0x20000220	// 46e0 <task_gui+0x94>
    4652:	8360      	ld.b      	r3, (r3, 0x0)
    4654:	3201      	movi      	r2, 1
    4656:	688c      	and      	r2, r3
    4658:	3a40      	cmpnei      	r2, 0
    465a:	1183      	lrw      	r4, 0x20000158	// 46e4 <task_gui+0x98>
    465c:	11a3      	lrw      	r5, 0x20000090	// 46e8 <task_gui+0x9c>
    465e:	0c07      	bf      	0x466c	// 466c <task_gui+0x20>
        index = key_table[index].set;
    4660:	8444      	ld.b      	r2, (r4, 0x4)
    4662:	310c      	movi      	r1, 12
    4664:	7c84      	mult      	r2, r1
    4666:	6094      	addu      	r2, r5
    4668:	8241      	ld.b      	r2, (r2, 0x1)
    466a:	a444      	st.b      	r2, (r4, 0x4)
    if (KEY_SET_LONG)
    466c:	3202      	movi      	r2, 2
    466e:	688c      	and      	r2, r3
    4670:	3a40      	cmpnei      	r2, 0
    4672:	0c07      	bf      	0x4680	// 4680 <task_gui+0x34>
        index = key_table[index].set_l;
    4674:	8444      	ld.b      	r2, (r4, 0x4)
    4676:	310c      	movi      	r1, 12
    4678:	7c84      	mult      	r2, r1
    467a:	6094      	addu      	r2, r5
    467c:	8242      	ld.b      	r2, (r2, 0x2)
    467e:	a444      	st.b      	r2, (r4, 0x4)
    if (KEY_UP_SHORT)
    4680:	3204      	movi      	r2, 4
    4682:	688c      	and      	r2, r3
    4684:	3a40      	cmpnei      	r2, 0
    4686:	0c0a      	bf      	0x469a	// 469a <task_gui+0x4e>
        index = key_table[index].up;
    4688:	8424      	ld.b      	r1, (r4, 0x4)
    468a:	300c      	movi      	r0, 12
    468c:	7c40      	mult      	r1, r0
    468e:	6054      	addu      	r1, r5
        index = key_table[index].up_l;
    4690:	8143      	ld.b      	r2, (r1, 0x3)
    4692:	7c80      	mult      	r2, r0
    4694:	6094      	addu      	r2, r5
    4696:	8244      	ld.b      	r2, (r2, 0x4)
    4698:	a444      	st.b      	r2, (r4, 0x4)
    if (KEY_DOWN_SHORT)
    469a:	3210      	movi      	r2, 16
    469c:	68c8      	and      	r3, r2
    469e:	3b40      	cmpnei      	r3, 0
    46a0:	0c0a      	bf      	0x46b4	// 46b4 <task_gui+0x68>
        index = key_table[index].down;
    46a2:	8444      	ld.b      	r2, (r4, 0x4)
    46a4:	310c      	movi      	r1, 12
    46a6:	7c84      	mult      	r2, r1
    46a8:	6094      	addu      	r2, r5
        index = key_table[index].down_l;
    46aa:	8265      	ld.b      	r3, (r2, 0x5)
    46ac:	7cc4      	mult      	r3, r1
    46ae:	60d4      	addu      	r3, r5
    46b0:	8366      	ld.b      	r3, (r3, 0x6)
    46b2:	a464      	st.b      	r3, (r4, 0x4)
    if(index != index_last)
    46b4:	8464      	ld.b      	r3, (r4, 0x4)
    46b6:	8445      	ld.b      	r2, (r4, 0x5)
    46b8:	64ca      	cmpne      	r2, r3
    46ba:	0c0a      	bf      	0x46ce	// 46ce <task_gui+0x82>
        index_last = index;
    46bc:	a465      	st.b      	r3, (r4, 0x5)
        LCD_Fill(0, 0, 160, 80, LGRAY);
    46be:	106c      	lrw      	r3, 0xc618	// 46ec <task_gui+0xa0>
    46c0:	b860      	st.w      	r3, (r14, 0x0)
    46c2:	32a0      	movi      	r2, 160
    46c4:	3350      	movi      	r3, 80
    46c6:	3100      	movi      	r1, 0
    46c8:	3000      	movi      	r0, 0
    46ca:	e0000013 	bsr      	0x46f0	// 46f0 <LCD_Fill>
    (*key_table[index].operation)();
    46ce:	8464      	ld.b      	r3, (r4, 0x4)
    46d0:	320c      	movi      	r2, 12
    46d2:	7cc8      	mult      	r3, r2
    46d4:	614c      	addu      	r5, r3
    46d6:	9562      	ld.w      	r3, (r5, 0x8)
    46d8:	7bcd      	jsr      	r3
}
    46da:	1401      	addi      	r14, r14, 4
    46dc:	1492      	pop      	r4-r5, r15
    46de:	0000      	bkpt
    46e0:	20000220 	.long	0x20000220
    46e4:	20000158 	.long	0x20000158
    46e8:	20000090 	.long	0x20000090
    46ec:	0000c618 	.long	0x0000c618

Disassembly of section .text.LCD_Fill:

000046f0 <LCD_Fill>:
                xend,yend   终止坐标
								color       要填充的颜色
      返回值：  无
******************************************************************************/
void LCD_Fill(u16 xsta,u16 ysta,u16 xend,u16 yend,u16 color)
{          
    46f0:	14d4      	push      	r4-r7, r15
    46f2:	1422      	subi      	r14, r14, 8
    46f4:	6dcf      	mov      	r7, r3
    46f6:	9867      	ld.w      	r3, (r14, 0x1c)
    46f8:	6d8b      	mov      	r6, r2
    46fa:	b860      	st.w      	r3, (r14, 0x0)
	u16 i,j; 
	LCD_Address_Set(xsta,ysta,xend-1,yend-1);//设置显示范围
    46fc:	2a00      	subi      	r2, 1
    46fe:	5f63      	subi      	r3, r7, 1
{          
    4700:	6d43      	mov      	r5, r0
    4702:	6d07      	mov      	r4, r1
	LCD_Address_Set(xsta,ysta,xend-1,yend-1);//设置显示范围
    4704:	e000016a 	bsr      	0x49d8	// 49d8 <LCD_Address_Set>
	for(i=ysta;i<yend;i++)
    4708:	65d0      	cmphs      	r4, r7
    470a:	080d      	bt      	0x4724	// 4724 <LCD_Fill+0x34>
    470c:	6cd7      	mov      	r3, r5
    470e:	0407      	br      	0x471c	// 471c <LCD_Fill+0x2c>
	{													   	 	
		for(j=xsta;j<xend;j++)
		{
			LCD_WR_DATA(color);
    4710:	9800      	ld.w      	r0, (r14, 0x0)
    4712:	b861      	st.w      	r3, (r14, 0x4)
    4714:	e0000128 	bsr      	0x4964	// 4964 <LCD_WR_DATA>
		for(j=xsta;j<xend;j++)
    4718:	9861      	ld.w      	r3, (r14, 0x4)
    471a:	2300      	addi      	r3, 1
    471c:	658c      	cmphs      	r3, r6
    471e:	0ff9      	bf      	0x4710	// 4710 <LCD_Fill+0x20>
	for(i=ysta;i<yend;i++)
    4720:	2400      	addi      	r4, 1
    4722:	07f3      	br      	0x4708	// 4708 <LCD_Fill+0x18>
		}
	} 					  	    
}
    4724:	1402      	addi      	r14, r14, 8
    4726:	1494      	pop      	r4-r7, r15

Disassembly of section .text.LCD_DrawPoint:

00004728 <LCD_DrawPoint>:
      入口数据：x,y 画点坐标
                color 点的颜色
      返回值：  无
******************************************************************************/
void LCD_DrawPoint(u16 x,u16 y,u16 color)
{
    4728:	14d1      	push      	r4, r15
    472a:	6cc7      	mov      	r3, r1
    472c:	6d0b      	mov      	r4, r2
	LCD_Address_Set(x,y,x,y);//设置光标位置 
    472e:	6c83      	mov      	r2, r0
    4730:	e0000154 	bsr      	0x49d8	// 49d8 <LCD_Address_Set>
	LCD_WR_DATA(color);
    4734:	6c13      	mov      	r0, r4
    4736:	e0000117 	bsr      	0x4964	// 4964 <LCD_WR_DATA>
} 
    473a:	1491      	pop      	r4, r15

Disassembly of section .text.LCD_ShowChar:

0000473c <LCD_ShowChar>:
                sizey 字号
                mode:  0非叠加模式  1叠加模式
      返回值：  无
******************************************************************************/
void LCD_ShowChar(u16 x,u16 y,u8 num,u16 fc,u16 bc,u8 sizey,u8 mode)
{
    473c:	14d4      	push      	r4-r7, r15
    473e:	142f      	subi      	r14, r14, 60
    4740:	b865      	st.w      	r3, (r14, 0x14)
    4742:	9874      	ld.w      	r3, (r14, 0x50)
    4744:	b86a      	st.w      	r3, (r14, 0x28)
    4746:	1b15      	addi      	r3, r14, 84
    4748:	8380      	ld.b      	r4, (r3, 0x0)
    474a:	1b16      	addi      	r3, r14, 88
    474c:	8360      	ld.b      	r3, (r3, 0x0)
    474e:	b86b      	st.w      	r3, (r14, 0x2c)
	u8 temp,sizex,t,m=0;
	u16 i,TypefaceNum;//一个字符所占字节大小
	u16 x0=x;
	sizex=sizey/2;
    4750:	4c61      	lsri      	r3, r4, 1
{
    4752:	6d8b      	mov      	r6, r2
	sizex=sizey/2;
    4754:	b864      	st.w      	r3, (r14, 0x10)
	TypefaceNum=(sizex/8+((sizex%8)?1:0))*sizey;
    4756:	4c41      	lsri      	r2, r4, 1
    4758:	3307      	movi      	r3, 7
    475a:	68c8      	and      	r3, r2
    475c:	3b40      	cmpnei      	r3, 0
    475e:	3300      	movi      	r3, 0
    4760:	60cd      	addc      	r3, r3
    4762:	4c44      	lsri      	r2, r4, 4
    4764:	60c8      	addu      	r3, r2
    4766:	7cd0      	mult      	r3, r4
	num=num-' ';    //得到偏移后的值
	LCD_Address_Set(x,y,x+sizex-1,y+sizey-1);  //设置光标位置 
    4768:	6c83      	mov      	r2, r0
{
    476a:	6d47      	mov      	r5, r1
	TypefaceNum=(sizex/8+((sizex%8)?1:0))*sizey;
    476c:	b866      	st.w      	r3, (r14, 0x18)
	LCD_Address_Set(x,y,x+sizex-1,y+sizey-1);  //设置光标位置 
    476e:	2a00      	subi      	r2, 1
    4770:	5963      	subi      	r3, r1, 1
	num=num-' ';    //得到偏移后的值
    4772:	2e1f      	subi      	r6, 32
	LCD_Address_Set(x,y,x+sizex-1,y+sizey-1);  //设置光标位置 
    4774:	4c21      	lsri      	r1, r4, 1
    4776:	7598      	zextb      	r6, r6
    4778:	60d0      	addu      	r3, r4
    477a:	6084      	addu      	r2, r1
    477c:	6c57      	mov      	r1, r5
{
    477e:	b800      	st.w      	r0, (r14, 0x0)
	LCD_Address_Set(x,y,x+sizex-1,y+sizey-1);  //设置光标位置 
    4780:	e000012c 	bsr      	0x49d8	// 49d8 <LCD_Address_Set>
    4784:	4666      	lsli      	r3, r6, 6
    4786:	b869      	st.w      	r3, (r14, 0x24)
    4788:	4661      	lsli      	r3, r6, 1
    478a:	60d8      	addu      	r3, r6
    478c:	4364      	lsli      	r3, r3, 4
    478e:	b86c      	st.w      	r3, (r14, 0x30)
    4790:	4664      	lsli      	r3, r6, 4
    4792:	b868      	st.w      	r3, (r14, 0x20)
    4794:	330c      	movi      	r3, 12
    4796:	7d8c      	mult      	r6, r3
	u8 temp,sizex,t,m=0;
    4798:	3300      	movi      	r3, 0
    479a:	b862      	st.w      	r3, (r14, 0x8)
	for(i=0;i<TypefaceNum;i++)
	{ 
		if(sizey==12)temp=ascii_1206[num][i];		       //调用6x12字体
		else if(sizey==16)temp=ascii_1608[num][i];		 //调用8x16字体
		else if(sizey==24)temp=ascii_2412[num][i];		 //调用12x24字体
		else if(sizey==32)temp=ascii_3216[num][i];		 //调用16x32字体
    479c:	116f      	lrw      	r3, 0x7e1c	// 4858 <LCD_ShowChar+0x11c>
    479e:	b86d      	st.w      	r3, (r14, 0x34)
		else if(sizey==24)temp=ascii_2412[num][i];		 //调用12x24字体
    47a0:	116f      	lrw      	r3, 0x6c4c	// 485c <LCD_ShowChar+0x120>
    47a2:	b8c7      	st.w      	r6, (r14, 0x1c)
	for(i=0;i<TypefaceNum;i++)
    47a4:	98e0      	ld.w      	r7, (r14, 0x0)
    47a6:	3600      	movi      	r6, 0
		else if(sizey==24)temp=ascii_2412[num][i];		 //调用12x24字体
    47a8:	b86e      	st.w      	r3, (r14, 0x38)
	for(i=0;i<TypefaceNum;i++)
    47aa:	9866      	ld.w      	r3, (r14, 0x18)
    47ac:	64da      	cmpne      	r6, r3
    47ae:	0803      	bt      	0x47b4	// 47b4 <LCD_ShowChar+0x78>
					break;
				}
			}
		}
	}   	 	  
}
    47b0:	140f      	addi      	r14, r14, 60
    47b2:	1494      	pop      	r4-r7, r15
		if(sizey==12)temp=ascii_1206[num][i];		       //调用6x12字体
    47b4:	3c4c      	cmpnei      	r4, 12
    47b6:	0824      	bt      	0x47fe	// 47fe <LCD_ShowChar+0xc2>
    47b8:	9847      	ld.w      	r2, (r14, 0x1c)
    47ba:	6098      	addu      	r2, r6
    47bc:	1169      	lrw      	r3, 0x61e8	// 4860 <LCD_ShowChar+0x124>
		else if(sizey==32)temp=ascii_3216[num][i];		 //调用16x32字体
    47be:	608c      	addu      	r2, r3
    47c0:	8260      	ld.b      	r3, (r2, 0x0)
    47c2:	b861      	st.w      	r3, (r14, 0x4)
{
    47c4:	3300      	movi      	r3, 0
    47c6:	b863      	st.w      	r3, (r14, 0xc)
			if(!mode)//非叠加模式
    47c8:	986b      	ld.w      	r3, (r14, 0x2c)
    47ca:	3b40      	cmpnei      	r3, 0
    47cc:	9841      	ld.w      	r2, (r14, 0x4)
    47ce:	9863      	ld.w      	r3, (r14, 0xc)
    47d0:	708e      	asr      	r2, r3
				if(temp&(0x01<<t))LCD_WR_DATA(fc);
    47d2:	3101      	movi      	r1, 1
    47d4:	6884      	and      	r2, r1
			if(!mode)//非叠加模式
    47d6:	0829      	bt      	0x4828	// 4828 <LCD_ShowChar+0xec>
				if(temp&(0x01<<t))LCD_WR_DATA(fc);
    47d8:	3a40      	cmpnei      	r2, 0
    47da:	0c25      	bf      	0x4824	// 4824 <LCD_ShowChar+0xe8>
    47dc:	9805      	ld.w      	r0, (r14, 0x14)
				else LCD_WR_DATA(bc);
    47de:	e00000c3 	bsr      	0x4964	// 4964 <LCD_WR_DATA>
				m++;
    47e2:	9842      	ld.w      	r2, (r14, 0x8)
    47e4:	2200      	addi      	r2, 1
    47e6:	74c8      	zextb      	r3, r2
				if(m%sizex==0)
    47e8:	9824      	ld.w      	r1, (r14, 0x10)
    47ea:	6c0f      	mov      	r0, r3
				m++;
    47ec:	b862      	st.w      	r3, (r14, 0x8)
				if(m%sizex==0)
    47ee:	e3fff9d9 	bsr      	0x3ba0	// 3ba0 <__umodsi3>
    47f2:	7400      	zextb      	r0, r0
    47f4:	3840      	cmpnei      	r0, 0
    47f6:	082a      	bt      	0x484a	// 484a <LCD_ShowChar+0x10e>
					m=0;
    47f8:	3300      	movi      	r3, 0
    47fa:	b862      	st.w      	r3, (r14, 0x8)
    47fc:	0425      	br      	0x4846	// 4846 <LCD_ShowChar+0x10a>
		else if(sizey==16)temp=ascii_1608[num][i];		 //调用8x16字体
    47fe:	3c50      	cmpnei      	r4, 16
    4800:	0805      	bt      	0x480a	// 480a <LCD_ShowChar+0xce>
    4802:	9848      	ld.w      	r2, (r14, 0x20)
    4804:	6098      	addu      	r2, r6
    4806:	1078      	lrw      	r3, 0x665c	// 4864 <LCD_ShowChar+0x128>
    4808:	07db      	br      	0x47be	// 47be <LCD_ShowChar+0x82>
		else if(sizey==24)temp=ascii_2412[num][i];		 //调用12x24字体
    480a:	3c58      	cmpnei      	r4, 24
    480c:	0805      	bt      	0x4816	// 4816 <LCD_ShowChar+0xda>
    480e:	984c      	ld.w      	r2, (r14, 0x30)
    4810:	6098      	addu      	r2, r6
    4812:	986e      	ld.w      	r3, (r14, 0x38)
    4814:	07d5      	br      	0x47be	// 47be <LCD_ShowChar+0x82>
		else if(sizey==32)temp=ascii_3216[num][i];		 //调用16x32字体
    4816:	3220      	movi      	r2, 32
    4818:	6492      	cmpne      	r4, r2
    481a:	0bcb      	bt      	0x47b0	// 47b0 <LCD_ShowChar+0x74>
    481c:	9849      	ld.w      	r2, (r14, 0x24)
    481e:	6098      	addu      	r2, r6
    4820:	986d      	ld.w      	r3, (r14, 0x34)
    4822:	07ce      	br      	0x47be	// 47be <LCD_ShowChar+0x82>
				else LCD_WR_DATA(bc);
    4824:	980a      	ld.w      	r0, (r14, 0x28)
    4826:	07dc      	br      	0x47de	// 47de <LCD_ShowChar+0xa2>
				if(temp&(0x01<<t))LCD_DrawPoint(x,y,fc);//画一个点
    4828:	3a40      	cmpnei      	r2, 0
    482a:	0c06      	bf      	0x4836	// 4836 <LCD_ShowChar+0xfa>
    482c:	9845      	ld.w      	r2, (r14, 0x14)
    482e:	6c57      	mov      	r1, r5
    4830:	6c1f      	mov      	r0, r7
    4832:	e3ffff7b 	bsr      	0x4728	// 4728 <LCD_DrawPoint>
				if((x-x0)==sizex)
    4836:	9860      	ld.w      	r3, (r14, 0x0)
				x++;
    4838:	2700      	addi      	r7, 1
				if((x-x0)==sizex)
    483a:	5f4d      	subu      	r2, r7, r3
    483c:	9864      	ld.w      	r3, (r14, 0x10)
    483e:	648e      	cmpne      	r3, r2
    4840:	0805      	bt      	0x484a	// 484a <LCD_ShowChar+0x10e>
					y++;
    4842:	2500      	addi      	r5, 1
					x=x0;
    4844:	98e0      	ld.w      	r7, (r14, 0x0)
	for(i=0;i<TypefaceNum;i++)
    4846:	2600      	addi      	r6, 1
    4848:	07b1      	br      	0x47aa	// 47aa <LCD_ShowChar+0x6e>
    484a:	9863      	ld.w      	r3, (r14, 0xc)
    484c:	2300      	addi      	r3, 1
		for(t=0;t<8;t++)
    484e:	3b48      	cmpnei      	r3, 8
    4850:	b863      	st.w      	r3, (r14, 0xc)
    4852:	0bbb      	bt      	0x47c8	// 47c8 <LCD_ShowChar+0x8c>
    4854:	07f9      	br      	0x4846	// 4846 <LCD_ShowChar+0x10a>
    4856:	0000      	bkpt
    4858:	00007e1c 	.long	0x00007e1c
    485c:	00006c4c 	.long	0x00006c4c
    4860:	000061e8 	.long	0x000061e8
    4864:	0000665c 	.long	0x0000665c

Disassembly of section .text.LCD_ShowString:

00004868 <LCD_ShowString>:
                sizey 字号
                mode:  0非叠加模式  1叠加模式
      返回值：  无
******************************************************************************/
void LCD_ShowString(u16 x,u16 y,const u8 *p,u16 fc,u16 bc,u8 sizey,u8 mode)
{         
    4868:	14d4      	push      	r4-r7, r15
    486a:	1427      	subi      	r14, r14, 28
    486c:	b865      	st.w      	r3, (r14, 0x14)
    486e:	986c      	ld.w      	r3, (r14, 0x30)
    4870:	b866      	st.w      	r3, (r14, 0x18)
    4872:	1b0d      	addi      	r3, r14, 52
    4874:	83c0      	ld.b      	r6, (r3, 0x0)
    4876:	1b0e      	addi      	r3, r14, 56
    4878:	83e0      	ld.b      	r7, (r3, 0x0)
	while(*p!='\0')
	{       
		LCD_ShowChar(x,y,*p,fc,bc,sizey,mode);
		x+=sizey/2;
    487a:	4e61      	lsri      	r3, r6, 1
{         
    487c:	6d43      	mov      	r5, r0
    487e:	b824      	st.w      	r1, (r14, 0x10)
    4880:	6d0b      	mov      	r4, r2
		x+=sizey/2;
    4882:	b863      	st.w      	r3, (r14, 0xc)
	while(*p!='\0')
    4884:	8440      	ld.b      	r2, (r4, 0x0)
    4886:	3a40      	cmpnei      	r2, 0
    4888:	0803      	bt      	0x488e	// 488e <LCD_ShowString+0x26>
		p++;
	}  
}
    488a:	1407      	addi      	r14, r14, 28
    488c:	1494      	pop      	r4-r7, r15
		LCD_ShowChar(x,y,*p,fc,bc,sizey,mode);
    488e:	9866      	ld.w      	r3, (r14, 0x18)
    4890:	b860      	st.w      	r3, (r14, 0x0)
    4892:	6c17      	mov      	r0, r5
    4894:	9865      	ld.w      	r3, (r14, 0x14)
    4896:	b8e2      	st.w      	r7, (r14, 0x8)
    4898:	b8c1      	st.w      	r6, (r14, 0x4)
    489a:	9824      	ld.w      	r1, (r14, 0x10)
    489c:	e3ffff50 	bsr      	0x473c	// 473c <LCD_ShowChar>
		x+=sizey/2;
    48a0:	9863      	ld.w      	r3, (r14, 0xc)
    48a2:	614c      	addu      	r5, r3
		p++;
    48a4:	2400      	addi      	r4, 1
    48a6:	07ef      	br      	0x4884	// 4884 <LCD_ShowString+0x1c>

Disassembly of section .text.LCD_ShowIntNum:

000048a8 <LCD_ShowIntNum>:
                bc 字的背景色
                sizey 字号
      返回值：  无
******************************************************************************/
void LCD_ShowIntNum(u16 x,u16 y,u16 num,u8 len,u16 fc,u16 bc,u8 sizey)
{         	
    48a8:	14d4      	push      	r4-r7, r15
    48aa:	142a      	subi      	r14, r14, 40
    48ac:	b849      	st.w      	r2, (r14, 0x24)
    48ae:	984f      	ld.w      	r2, (r14, 0x3c)
    48b0:	b845      	st.w      	r2, (r14, 0x14)
    48b2:	9850      	ld.w      	r2, (r14, 0x40)
    48b4:	2b00      	subi      	r3, 1
    48b6:	b846      	st.w      	r2, (r14, 0x18)
    48b8:	1a11      	addi      	r2, r14, 68
    48ba:	8240      	ld.b      	r2, (r2, 0x0)
    48bc:	b867      	st.w      	r3, (r14, 0x1c)
    48be:	b843      	st.w      	r2, (r14, 0xc)
    48c0:	d86e001c 	ld.b      	r3, (r14, 0x1c)
    48c4:	4a41      	lsri      	r2, r2, 1
    48c6:	6d43      	mov      	r5, r0
    48c8:	b824      	st.w      	r1, (r14, 0x10)
    48ca:	b848      	st.w      	r2, (r14, 0x20)
    48cc:	750c      	zextb      	r4, r3
	u8 t,temp;
	u8 enshow=0;
	u8 sizex=sizey/2;
	for(t=0;t<len;t++)
    48ce:	3700      	movi      	r7, 0
	u8 enshow=0;
    48d0:	3600      	movi      	r6, 0
	for(t=0;t<len;t++)
    48d2:	33ff      	movi      	r3, 255
    48d4:	64d2      	cmpne      	r4, r3
    48d6:	0827      	bt      	0x4924	// 4924 <LCD_ShowIntNum+0x7c>
			}else enshow=1; 
		 	 
		}
	 	LCD_ShowChar(x+t*sizex,y,temp+48,fc,bc,sizey,0);
	}
} 
    48d8:	140a      	addi      	r14, r14, 40
    48da:	1494      	pop      	r4-r7, r15
	while(n--)result*=m;
    48dc:	7c40      	mult      	r1, r0
    48de:	2b00      	subi      	r3, 1
    48e0:	74cc      	zextb      	r3, r3
    48e2:	648e      	cmpne      	r3, r2
    48e4:	0bfc      	bt      	0x48dc	// 48dc <LCD_ShowIntNum+0x34>
		temp=(num/mypow(10,len-t-1))%10;
    48e6:	9809      	ld.w      	r0, (r14, 0x24)
    48e8:	e3fff94a 	bsr      	0x3b7c	// 3b7c <__udivsi3>
    48ec:	310a      	movi      	r1, 10
    48ee:	e3fff959 	bsr      	0x3ba0	// 3ba0 <__umodsi3>
		if(enshow==0&&t<(len-1))
    48f2:	3e40      	cmpnei      	r6, 0
		temp=(num/mypow(10,len-t-1))%10;
    48f4:	7480      	zextb      	r2, r0
		if(enshow==0&&t<(len-1))
    48f6:	081d      	bt      	0x4930	// 4930 <LCD_ShowIntNum+0x88>
    48f8:	9867      	ld.w      	r3, (r14, 0x1c)
    48fa:	64dd      	cmplt      	r7, r3
    48fc:	0c1a      	bf      	0x4930	// 4930 <LCD_ShowIntNum+0x88>
			if(temp==0)
    48fe:	3840      	cmpnei      	r0, 0
    4900:	0817      	bt      	0x492e	// 492e <LCD_ShowIntNum+0x86>
				LCD_ShowChar(x+t*sizex,y,' ',fc,bc,sizey,0);
    4902:	9863      	ld.w      	r3, (r14, 0xc)
    4904:	b861      	st.w      	r3, (r14, 0x4)
    4906:	9866      	ld.w      	r3, (r14, 0x18)
    4908:	b860      	st.w      	r3, (r14, 0x0)
    490a:	b8c2      	st.w      	r6, (r14, 0x8)
    490c:	9865      	ld.w      	r3, (r14, 0x14)
    490e:	3220      	movi      	r2, 32
	 	LCD_ShowChar(x+t*sizex,y,temp+48,fc,bc,sizey,0);
    4910:	6c17      	mov      	r0, r5
    4912:	9824      	ld.w      	r1, (r14, 0x10)
    4914:	e3ffff14 	bsr      	0x473c	// 473c <LCD_ShowChar>
    4918:	2c00      	subi      	r4, 1
    491a:	9868      	ld.w      	r3, (r14, 0x20)
    491c:	2700      	addi      	r7, 1
    491e:	614c      	addu      	r5, r3
    4920:	7510      	zextb      	r4, r4
    4922:	07d8      	br      	0x48d2	// 48d2 <LCD_ShowIntNum+0x2a>
    4924:	6cd3      	mov      	r3, r4
	u32 result=1;	 
    4926:	3101      	movi      	r1, 1
	while(n--)result*=m;
    4928:	32ff      	movi      	r2, 255
    492a:	300a      	movi      	r0, 10
    492c:	07d9      	br      	0x48de	// 48de <LCD_ShowIntNum+0x36>
    492e:	3601      	movi      	r6, 1
	 	LCD_ShowChar(x+t*sizex,y,temp+48,fc,bc,sizey,0);
    4930:	3300      	movi      	r3, 0
    4932:	b862      	st.w      	r3, (r14, 0x8)
    4934:	9863      	ld.w      	r3, (r14, 0xc)
    4936:	222f      	addi      	r2, 48
    4938:	b861      	st.w      	r3, (r14, 0x4)
    493a:	9866      	ld.w      	r3, (r14, 0x18)
    493c:	b860      	st.w      	r3, (r14, 0x0)
    493e:	7488      	zextb      	r2, r2
    4940:	9865      	ld.w      	r3, (r14, 0x14)
    4942:	07e7      	br      	0x4910	// 4910 <LCD_ShowIntNum+0x68>

Disassembly of section .text.LCD_WR_DATA8:

00004944 <LCD_WR_DATA8>:
      入口数据：dat 写入的数据
      返回值：  无
******************************************************************************/
void LCD_WR_DATA8(u8 dat)
{
  while (((SPI0->SR) & SSP_TNF) != SSP_TNF)
    4944:	1067      	lrw      	r3, 0x20000034	// 4960 <LCD_WR_DATA8+0x1c>
    4946:	3102      	movi      	r1, 2
    4948:	9340      	ld.w      	r2, (r3, 0x0)
    494a:	9263      	ld.w      	r3, (r2, 0xc)
    494c:	68c4      	and      	r3, r1
    494e:	3b40      	cmpnei      	r3, 0
    4950:	0ffd      	bf      	0x494a	// 494a <LCD_WR_DATA8+0x6>
		;
  SPI0->DR = dat;
    4952:	b202      	st.w      	r0, (r2, 0x8)
  while (((SPI0->SR) & SSP_BSY) == SSP_BSY)
    4954:	3110      	movi      	r1, 16
    4956:	9263      	ld.w      	r3, (r2, 0xc)
    4958:	68c4      	and      	r3, r1
    495a:	3b40      	cmpnei      	r3, 0
    495c:	0bfd      	bt      	0x4956	// 4956 <LCD_WR_DATA8+0x12>
		;
  //SPI_WRITE_BYTE(dat);
  // LCD_Writ_Bus(dat);
}
    495e:	783c      	jmp      	r15
    4960:	20000034 	.long	0x20000034

Disassembly of section .text.LCD_WR_DATA:

00004964 <LCD_WR_DATA>:
      入口数据：dat 写入的数据
      返回值：  无
******************************************************************************/
void LCD_WR_DATA(u16 dat)
{
  while (((SPI0->SR) & SSP_TNF) != SSP_TNF)
    4964:	106d      	lrw      	r3, 0x20000034	// 4998 <LCD_WR_DATA+0x34>
    4966:	3102      	movi      	r1, 2
    4968:	9360      	ld.w      	r3, (r3, 0x0)
    496a:	9343      	ld.w      	r2, (r3, 0xc)
    496c:	6884      	and      	r2, r1
    496e:	3a40      	cmpnei      	r2, 0
    4970:	0ffd      	bf      	0x496a	// 496a <LCD_WR_DATA+0x6>
		;
  SPI0->DR = dat>>8;
    4972:	4848      	lsri      	r2, r0, 8
    4974:	b342      	st.w      	r2, (r3, 0x8)
  while (((SPI0->SR) & SSP_BSY) == SSP_BSY)
    4976:	3110      	movi      	r1, 16
    4978:	9343      	ld.w      	r2, (r3, 0xc)
    497a:	6884      	and      	r2, r1
    497c:	3a40      	cmpnei      	r2, 0
    497e:	0bfd      	bt      	0x4978	// 4978 <LCD_WR_DATA+0x14>
		;
  while (((SPI0->SR) & SSP_TNF) != SSP_TNF)
    4980:	3102      	movi      	r1, 2
    4982:	9343      	ld.w      	r2, (r3, 0xc)
    4984:	6884      	and      	r2, r1
    4986:	3a40      	cmpnei      	r2, 0
    4988:	0ffd      	bf      	0x4982	// 4982 <LCD_WR_DATA+0x1e>
		;
  SPI0->DR = dat;
    498a:	b302      	st.w      	r0, (r3, 0x8)
  while (((SPI0->SR) & SSP_BSY) == SSP_BSY)
    498c:	3110      	movi      	r1, 16
    498e:	9343      	ld.w      	r2, (r3, 0xc)
    4990:	6884      	and      	r2, r1
    4992:	3a40      	cmpnei      	r2, 0
    4994:	0bfd      	bt      	0x498e	// 498e <LCD_WR_DATA+0x2a>
		;
  // SPI_WRITE_BYTE(dat>>8);
  // SPI_WRITE_BYTE(dat);
  // LCD_Writ_Bus(dat>>8);
  // LCD_Writ_Bus(dat);
}
    4996:	783c      	jmp      	r15
    4998:	20000034 	.long	0x20000034

Disassembly of section .text.LCD_WR_REG:

0000499c <LCD_WR_REG>:
      函数说明：LCD写入命令
      入口数据：dat 写入的命令
      返回值：  无
******************************************************************************/
void LCD_WR_REG(u8 dat)
{
    499c:	14d2      	push      	r4-r5, r15
	LCD_DC_Clr();//写命令
    499e:	108d      	lrw      	r4, 0x20000048	// 49d0 <LCD_WR_REG+0x34>
    49a0:	3101      	movi      	r1, 1
{
    49a2:	6d43      	mov      	r5, r0
	LCD_DC_Clr();//写命令
    49a4:	9400      	ld.w      	r0, (r4, 0x0)
    49a6:	e3ffef45 	bsr      	0x2830	// 2830 <GPIO_Write_Low>
	while (((SPI0->SR) & SSP_TNF) != SSP_TNF)
    49aa:	106b      	lrw      	r3, 0x20000034	// 49d4 <LCD_WR_REG+0x38>
    49ac:	3102      	movi      	r1, 2
    49ae:	9340      	ld.w      	r2, (r3, 0x0)
    49b0:	9263      	ld.w      	r3, (r2, 0xc)
    49b2:	68c4      	and      	r3, r1
    49b4:	3b40      	cmpnei      	r3, 0
    49b6:	0ffd      	bf      	0x49b0	// 49b0 <LCD_WR_REG+0x14>
		;
	SPI0->DR = dat;
    49b8:	b2a2      	st.w      	r5, (r2, 0x8)
	while (((SPI0->SR) & SSP_BSY) == SSP_BSY)
    49ba:	3110      	movi      	r1, 16
    49bc:	9263      	ld.w      	r3, (r2, 0xc)
    49be:	68c4      	and      	r3, r1
    49c0:	3b40      	cmpnei      	r3, 0
    49c2:	0bfd      	bt      	0x49bc	// 49bc <LCD_WR_REG+0x20>
		;
	//SPI_WRITE_BYTE(dat);
	//LCD_Writ_Bus(dat);
	LCD_DC_Set();//写数据
    49c4:	9400      	ld.w      	r0, (r4, 0x0)
    49c6:	3101      	movi      	r1, 1
    49c8:	e3ffef30 	bsr      	0x2828	// 2828 <GPIO_Write_High>
}
    49cc:	1492      	pop      	r4-r5, r15
    49ce:	0000      	bkpt
    49d0:	20000048 	.long	0x20000048
    49d4:	20000034 	.long	0x20000034

Disassembly of section .text.LCD_Address_Set:

000049d8 <LCD_Address_Set>:
      入口数据：x1,x2 设置列的起始和结束地址
                y1,y2 设置行的起始和结束地址
      返回值：  无
******************************************************************************/
void LCD_Address_Set(u16 x1,u16 y1,u16 x2,u16 y2)
{
    49d8:	14d4      	push      	r4-r7, r15
    49da:	6dc3      	mov      	r7, r0
		LCD_WR_DATA(y2+26);
		LCD_WR_REG(0x2c);//储存器写
	}
	else
	{
		LCD_WR_REG(0x2a);//列地址设置
    49dc:	302a      	movi      	r0, 42
{
    49de:	6d8b      	mov      	r6, r2
    49e0:	6d47      	mov      	r5, r1
    49e2:	6d0f      	mov      	r4, r3
		LCD_WR_REG(0x2a);//列地址设置
    49e4:	e3ffffdc 	bsr      	0x499c	// 499c <LCD_WR_REG>
		LCD_WR_DATA(x1+1);
    49e8:	5f02      	addi      	r0, r7, 1
    49ea:	e3ffffbd 	bsr      	0x4964	// 4964 <LCD_WR_DATA>
		LCD_WR_DATA(x2+1);
    49ee:	5e02      	addi      	r0, r6, 1
    49f0:	e3ffffba 	bsr      	0x4964	// 4964 <LCD_WR_DATA>
		LCD_WR_REG(0x2b);//行地址设置
		LCD_WR_DATA(y1+26);
    49f4:	361a      	movi      	r6, 26
		LCD_WR_REG(0x2b);//行地址设置
    49f6:	302b      	movi      	r0, 43
    49f8:	e3ffffd2 	bsr      	0x499c	// 499c <LCD_WR_REG>
		LCD_WR_DATA(y1+26);
    49fc:	5d18      	addu      	r0, r5, r6
    49fe:	e3ffffb3 	bsr      	0x4964	// 4964 <LCD_WR_DATA>
		LCD_WR_DATA(y2+26);
    4a02:	5c18      	addu      	r0, r4, r6
    4a04:	e3ffffb0 	bsr      	0x4964	// 4964 <LCD_WR_DATA>
		LCD_WR_REG(0x2c);//储存器写
    4a08:	302c      	movi      	r0, 44
    4a0a:	e3ffffc9 	bsr      	0x499c	// 499c <LCD_WR_REG>
	}
}
    4a0e:	1494      	pop      	r4-r7, r15

Disassembly of section .text.LCD_Init:

00004a10 <LCD_Init>:

void LCD_Init(void)
{
    4a10:	14d1      	push      	r4, r15
	LCD_RES_Clr();//复位
    4a12:	038d      	lrw      	r4, 0x2000004c	// 4c58 <LCD_Init+0x248>
    4a14:	3102      	movi      	r1, 2
    4a16:	9400      	ld.w      	r0, (r4, 0x0)
    4a18:	e3ffef0c 	bsr      	0x2830	// 2830 <GPIO_Write_Low>
	delay_nms(1000);
    4a1c:	30fa      	movi      	r0, 250
    4a1e:	4002      	lsli      	r0, r0, 2
    4a20:	e3fff2f8 	bsr      	0x3010	// 3010 <delay_nms>
	LCD_RES_Set();
    4a24:	3102      	movi      	r1, 2
    4a26:	9400      	ld.w      	r0, (r4, 0x0)
    4a28:	e3ffef00 	bsr      	0x2828	// 2828 <GPIO_Write_High>
	delay_nms(1000);
    4a2c:	30fa      	movi      	r0, 250
    4a2e:	4002      	lsli      	r0, r0, 2
    4a30:	e3fff2f0 	bsr      	0x3010	// 3010 <delay_nms>
	
	//LCD_BLK_Set();//打开背光
	delay_nms(1000);
    4a34:	30fa      	movi      	r0, 250
    4a36:	4002      	lsli      	r0, r0, 2
    4a38:	e3fff2ec 	bsr      	0x3010	// 3010 <delay_nms>

	LCD_WR_REG(0x11);     //Sleep out
    4a3c:	3011      	movi      	r0, 17
    4a3e:	e3ffffaf 	bsr      	0x499c	// 499c <LCD_WR_REG>
	delay_nms(1000);	  // Delay 120ms
    4a42:	30fa      	movi      	r0, 250
    4a44:	4002      	lsli      	r0, r0, 2
    4a46:	e3fff2e5 	bsr      	0x3010	// 3010 <delay_nms>
	LCD_WR_REG(0xB1);     //Normal mode
    4a4a:	30b1      	movi      	r0, 177
    4a4c:	e3ffffa8 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x05);   
    4a50:	3005      	movi      	r0, 5
    4a52:	e3ffff79 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a56:	303c      	movi      	r0, 60
    4a58:	e3ffff76 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a5c:	303c      	movi      	r0, 60
    4a5e:	e3ffff73 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xB2);     //Idle mode
    4a62:	30b2      	movi      	r0, 178
    4a64:	e3ffff9c 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x05);   
    4a68:	3005      	movi      	r0, 5
    4a6a:	e3ffff6d 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a6e:	303c      	movi      	r0, 60
    4a70:	e3ffff6a 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a74:	303c      	movi      	r0, 60
    4a76:	e3ffff67 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xB3);     //Partial mode
    4a7a:	30b3      	movi      	r0, 179
    4a7c:	e3ffff90 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x05);   
    4a80:	3005      	movi      	r0, 5
    4a82:	e3ffff61 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a86:	303c      	movi      	r0, 60
    4a88:	e3ffff5e 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a8c:	303c      	movi      	r0, 60
    4a8e:	e3ffff5b 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x05);   
    4a92:	3005      	movi      	r0, 5
    4a94:	e3ffff58 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a98:	303c      	movi      	r0, 60
    4a9a:	e3ffff55 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x3C);   
    4a9e:	303c      	movi      	r0, 60
    4aa0:	e3ffff52 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xB4);     //Dot inversion
    4aa4:	30b4      	movi      	r0, 180
    4aa6:	e3ffff7b 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x03);   
    4aaa:	3003      	movi      	r0, 3
    4aac:	e3ffff4c 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xC0);     //AVDD GVDD
    4ab0:	30c0      	movi      	r0, 192
    4ab2:	e3ffff75 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0xAB);   
    4ab6:	30ab      	movi      	r0, 171
    4ab8:	e3ffff46 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x0B);   
    4abc:	300b      	movi      	r0, 11
    4abe:	e3ffff43 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x04);   
    4ac2:	3004      	movi      	r0, 4
    4ac4:	e3ffff40 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xC1);     //VGH VGL
    4ac8:	30c1      	movi      	r0, 193
    4aca:	e3ffff69 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0xC5);   //C0
    4ace:	30c5      	movi      	r0, 197
    4ad0:	e3ffff3a 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xC2);     //Normal Mode
    4ad4:	30c2      	movi      	r0, 194
    4ad6:	e3ffff63 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x0D);   
    4ada:	300d      	movi      	r0, 13
    4adc:	e3ffff34 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x00);   
    4ae0:	3000      	movi      	r0, 0
    4ae2:	e3ffff31 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xC3);     //Idle
    4ae6:	30c3      	movi      	r0, 195
    4ae8:	e3ffff5a 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x8D);   
    4aec:	308d      	movi      	r0, 141
    4aee:	e3ffff2b 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x6A);   
    4af2:	306a      	movi      	r0, 106
    4af4:	e3ffff28 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xC4);     //Partial+Full
    4af8:	30c4      	movi      	r0, 196
    4afa:	e3ffff51 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x8D);   
    4afe:	308d      	movi      	r0, 141
    4b00:	e3ffff22 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0xEE);   
    4b04:	30ee      	movi      	r0, 238
    4b06:	e3ffff1f 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xC5);     //VCOM
    4b0a:	30c5      	movi      	r0, 197
    4b0c:	e3ffff48 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x0F);   
    4b10:	300f      	movi      	r0, 15
    4b12:	e3ffff19 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xE0);     //positive gamma
    4b16:	30e0      	movi      	r0, 224
    4b18:	e3ffff42 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x07);   
    4b1c:	3007      	movi      	r0, 7
    4b1e:	e3ffff13 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x0E);   
    4b22:	300e      	movi      	r0, 14
    4b24:	e3ffff10 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x08);   
    4b28:	3008      	movi      	r0, 8
    4b2a:	e3ffff0d 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x07);   
    4b2e:	3007      	movi      	r0, 7
    4b30:	e3ffff0a 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x10);   
    4b34:	3010      	movi      	r0, 16
    4b36:	e3ffff07 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x07);   
    4b3a:	3007      	movi      	r0, 7
    4b3c:	e3ffff04 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x02);   
    4b40:	3002      	movi      	r0, 2
    4b42:	e3ffff01 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x07);   
    4b46:	3007      	movi      	r0, 7
    4b48:	e3fffefe 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x09);   
    4b4c:	3009      	movi      	r0, 9
    4b4e:	e3fffefb 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x0F);   
    4b52:	300f      	movi      	r0, 15
    4b54:	e3fffef8 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x25);   
    4b58:	3025      	movi      	r0, 37
    4b5a:	e3fffef5 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x36);   
    4b5e:	3036      	movi      	r0, 54
    4b60:	e3fffef2 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x00);   
    4b64:	3000      	movi      	r0, 0
    4b66:	e3fffeef 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x08);   
    4b6a:	3008      	movi      	r0, 8
    4b6c:	e3fffeec 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x04);   
    4b70:	3004      	movi      	r0, 4
    4b72:	e3fffee9 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x10);   
    4b76:	3010      	movi      	r0, 16
    4b78:	e3fffee6 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0xE1);     //negative gamma
    4b7c:	30e1      	movi      	r0, 225
    4b7e:	e3ffff0f 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x0A);   
    4b82:	300a      	movi      	r0, 10
    4b84:	e3fffee0 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x0D);   
    4b88:	300d      	movi      	r0, 13
    4b8a:	e3fffedd 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x08);   
    4b8e:	3008      	movi      	r0, 8
    4b90:	e3fffeda 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x07);   
    4b94:	3007      	movi      	r0, 7
    4b96:	e3fffed7 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x0F);   
    4b9a:	300f      	movi      	r0, 15
    4b9c:	e3fffed4 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x07);   
    4ba0:	3007      	movi      	r0, 7
    4ba2:	e3fffed1 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x02);   
    4ba6:	3002      	movi      	r0, 2
    4ba8:	e3fffece 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x07);   
    4bac:	3007      	movi      	r0, 7
    4bae:	e3fffecb 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x09);   
    4bb2:	3009      	movi      	r0, 9
    4bb4:	e3fffec8 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x0F);   
    4bb8:	300f      	movi      	r0, 15
    4bba:	e3fffec5 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x25);   
    4bbe:	3025      	movi      	r0, 37
    4bc0:	e3fffec2 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x35);   
    4bc4:	3035      	movi      	r0, 53
    4bc6:	e3fffebf 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x00);   
    4bca:	3000      	movi      	r0, 0
    4bcc:	e3fffebc 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x09);   
    4bd0:	3009      	movi      	r0, 9
    4bd2:	e3fffeb9 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x04);   
    4bd6:	3004      	movi      	r0, 4
    4bd8:	e3fffeb6 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x10);
    4bdc:	3010      	movi      	r0, 16
    4bde:	e3fffeb3 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
		 
	LCD_WR_REG(0xFC);    
    4be2:	30fc      	movi      	r0, 252
    4be4:	e3fffedc 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x80);  
    4be8:	3080      	movi      	r0, 128
    4bea:	e3fffead 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
		
	LCD_WR_REG(0x3A);     
    4bee:	303a      	movi      	r0, 58
    4bf0:	e3fffed6 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x05);   
    4bf4:	3005      	movi      	r0, 5
    4bf6:	e3fffea7 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0x36);
    4bfa:	3036      	movi      	r0, 54
    4bfc:	e3fffed0 	bsr      	0x499c	// 499c <LCD_WR_REG>
	if(USE_HORIZONTAL==0)LCD_WR_DATA8(0x08);
	else if(USE_HORIZONTAL==1)LCD_WR_DATA8(0xC8);
	else if(USE_HORIZONTAL==2)LCD_WR_DATA8(0x78);
	else LCD_WR_DATA8(0xA8);   
    4c00:	30a8      	movi      	r0, 168
    4c02:	e3fffea1 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0x21);     //Display inversion
    4c06:	3021      	movi      	r0, 33
    4c08:	e3fffeca 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_REG(0x29);     //Display on
    4c0c:	3029      	movi      	r0, 41
    4c0e:	e3fffec7 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_REG(0x2A);     //Set Column Address
    4c12:	302a      	movi      	r0, 42
    4c14:	e3fffec4 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x00);   
    4c18:	3000      	movi      	r0, 0
    4c1a:	e3fffe95 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x1A);  //26  
    4c1e:	301a      	movi      	r0, 26
    4c20:	e3fffe92 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x00);   
    4c24:	3000      	movi      	r0, 0
    4c26:	e3fffe8f 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x69);   //105 
    4c2a:	3069      	movi      	r0, 105
    4c2c:	e3fffe8c 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0x2B);     //Set Page Address
    4c30:	302b      	movi      	r0, 43
    4c32:	e3fffeb5 	bsr      	0x499c	// 499c <LCD_WR_REG>
	LCD_WR_DATA8(0x00);   
    4c36:	3000      	movi      	r0, 0
    4c38:	e3fffe86 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x01);    //1
    4c3c:	3001      	movi      	r0, 1
    4c3e:	e3fffe83 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0x00);   
    4c42:	3000      	movi      	r0, 0
    4c44:	e3fffe80 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_DATA8(0xA0);    //160
    4c48:	30a0      	movi      	r0, 160
    4c4a:	e3fffe7d 	bsr      	0x4944	// 4944 <LCD_WR_DATA8>
	LCD_WR_REG(0x2C); 
    4c4e:	302c      	movi      	r0, 44
    4c50:	e3fffea6 	bsr      	0x499c	// 499c <LCD_WR_REG>
}
    4c54:	1491      	pop      	r4, r15
    4c56:	0000      	bkpt
    4c58:	2000004c 	.long	0x2000004c

Disassembly of section .text.TK_ConfigInterrupt_CMD.part.0:

00004c5c <TK_ConfigInterrupt_CMD.part.0>:
    4c5c:	1063      	lrw      	r3, 0x20000058	// 4c68 <TK_ConfigInterrupt_CMD.part.0+0xc>
    4c5e:	9340      	ld.w      	r2, (r3, 0x0)
    4c60:	926b      	ld.w      	r3, (r2, 0x2c)
    4c62:	6c0c      	or      	r0, r3
    4c64:	b20b      	st.w      	r0, (r2, 0x2c)
    4c66:	783c      	jmp      	r15
    4c68:	20000058 	.long	0x20000058

Disassembly of section .text.tk_clk_config:

00004c6c <tk_clk_config>:
    4c6c:	14c1      	push      	r4
    4c6e:	1069      	lrw      	r3, 0x20000058	// 4c90 <tk_clk_config+0x24>
    4c70:	3840      	cmpnei      	r0, 0
    4c72:	9380      	ld.w      	r4, (r3, 0x0)
    4c74:	9400      	ld.w      	r0, (r4, 0x0)
    4c76:	0c0b      	bf      	0x4c8c	// 4c8c <tk_clk_config+0x20>
    4c78:	38a0      	bseti      	r0, 0
    4c7a:	b400      	st.w      	r0, (r4, 0x0)
    4c7c:	9360      	ld.w      	r3, (r3, 0x0)
    4c7e:	4248      	lsli      	r2, r2, 8
    4c80:	4122      	lsli      	r1, r1, 2
    4c82:	9300      	ld.w      	r0, (r3, 0x0)
    4c84:	6c48      	or      	r1, r2
    4c86:	6c40      	or      	r1, r0
    4c88:	b320      	st.w      	r1, (r3, 0x0)
    4c8a:	1481      	pop      	r4
    4c8c:	3880      	bclri      	r0, 0
    4c8e:	07f6      	br      	0x4c7a	// 4c7a <tk_clk_config+0xe>
    4c90:	20000058 	.long	0x20000058

Disassembly of section .text.TK_con0_config:

00004c94 <TK_con0_config>:
    4c94:	14c4      	push      	r4-r7
    4c96:	1429      	subi      	r14, r14, 36
    4c98:	b840      	st.w      	r2, (r14, 0x0)
    4c9a:	984d      	ld.w      	r2, (r14, 0x34)
    4c9c:	b841      	st.w      	r2, (r14, 0x4)
    4c9e:	984e      	ld.w      	r2, (r14, 0x38)
    4ca0:	b842      	st.w      	r2, (r14, 0x8)
    4ca2:	984f      	ld.w      	r2, (r14, 0x3c)
    4ca4:	b843      	st.w      	r2, (r14, 0xc)
    4ca6:	9850      	ld.w      	r2, (r14, 0x40)
    4ca8:	9895      	ld.w      	r4, (r14, 0x54)
    4caa:	b844      	st.w      	r2, (r14, 0x10)
    4cac:	9853      	ld.w      	r2, (r14, 0x4c)
    4cae:	b845      	st.w      	r2, (r14, 0x14)
    4cb0:	b887      	st.w      	r4, (r14, 0x1c)
    4cb2:	9854      	ld.w      	r2, (r14, 0x50)
    4cb4:	1c11      	addi      	r4, r14, 68
    4cb6:	b846      	st.w      	r2, (r14, 0x18)
    4cb8:	8c80      	ld.h      	r4, (r4, 0x0)
    4cba:	1a15      	addi      	r2, r14, 84
    4cbc:	1d12      	addi      	r5, r14, 72
    4cbe:	8244      	ld.b      	r2, (r2, 0x4)
    4cc0:	3c40      	cmpnei      	r4, 0
    4cc2:	8dc0      	ld.h      	r6, (r5, 0x0)
    4cc4:	b848      	st.w      	r2, (r14, 0x20)
    4cc6:	0813      	bt      	0x4cec	// 4cec <TK_con0_config+0x58>
    4cc8:	105f      	lrw      	r2, 0x2000004c	// 4d44 <TK_con0_config+0xb0>
    4cca:	35f0      	movi      	r5, 240
    4ccc:	92e0      	ld.w      	r7, (r2, 0x0)
    4cce:	9740      	ld.w      	r2, (r7, 0x0)
    4cd0:	45a4      	lsli      	r5, r5, 4
    4cd2:	6895      	andn      	r2, r5
    4cd4:	3aab      	bseti      	r2, 11
    4cd6:	b740      	st.w      	r2, (r7, 0x0)
    4cd8:	3502      	movi      	r5, 2
    4cda:	105c      	lrw      	r2, 0x20000050	// 4d48 <TK_con0_config+0xb4>
    4cdc:	3e41      	cmpnei      	r6, 1
    4cde:	9240      	ld.w      	r2, (r2, 0x0)
    4ce0:	b2a0      	st.w      	r5, (r2, 0x0)
    4ce2:	0828      	bt      	0x4d32	// 4d32 <TK_con0_config+0x9e>
    4ce4:	92a4      	ld.w      	r5, (r2, 0x10)
    4ce6:	3db8      	bseti      	r5, 24
    4ce8:	3db9      	bseti      	r5, 25
    4cea:	b2a4      	st.w      	r5, (r2, 0x10)
    4cec:	1058      	lrw      	r2, 0x20000058	// 4d4c <TK_con0_config+0xb8>
    4cee:	448d      	lsli      	r4, r4, 13
    4cf0:	92a0      	ld.w      	r5, (r2, 0x0)
    4cf2:	9541      	ld.w      	r2, (r5, 0x4)
    4cf4:	3200      	movi      	r2, 0
    4cf6:	b541      	st.w      	r2, (r5, 0x4)
    4cf8:	9541      	ld.w      	r2, (r5, 0x4)
    4cfa:	98c7      	ld.w      	r6, (r14, 0x1c)
    4cfc:	6c98      	or      	r2, r6
    4cfe:	98c6      	ld.w      	r6, (r14, 0x18)
    4d00:	6c98      	or      	r2, r6
    4d02:	98c5      	ld.w      	r6, (r14, 0x14)
    4d04:	6c98      	or      	r2, r6
    4d06:	98c8      	ld.w      	r6, (r14, 0x20)
    4d08:	46d8      	lsli      	r6, r6, 24
    4d0a:	6c98      	or      	r2, r6
    4d0c:	98c4      	ld.w      	r6, (r14, 0x10)
    4d0e:	6c98      	or      	r2, r6
    4d10:	98c3      	ld.w      	r6, (r14, 0xc)
    4d12:	6c98      	or      	r2, r6
    4d14:	98c2      	ld.w      	r6, (r14, 0x8)
    4d16:	6c98      	or      	r2, r6
    4d18:	98c1      	ld.w      	r6, (r14, 0x4)
    4d1a:	6c98      	or      	r2, r6
    4d1c:	6c48      	or      	r1, r2
    4d1e:	9840      	ld.w      	r2, (r14, 0x0)
    4d20:	6c04      	or      	r0, r1
    4d22:	4242      	lsli      	r2, r2, 2
    4d24:	6c08      	or      	r0, r2
    4d26:	6d00      	or      	r4, r0
    4d28:	4367      	lsli      	r3, r3, 7
    4d2a:	6cd0      	or      	r3, r4
    4d2c:	b561      	st.w      	r3, (r5, 0x4)
    4d2e:	1409      	addi      	r14, r14, 36
    4d30:	1484      	pop      	r4-r7
    4d32:	3e40      	cmpnei      	r6, 0
    4d34:	0bdc      	bt      	0x4cec	// 4cec <TK_con0_config+0x58>
    4d36:	9264      	ld.w      	r3, (r2, 0x10)
    4d38:	3b98      	bclri      	r3, 24
    4d3a:	3b99      	bclri      	r3, 25
    4d3c:	3bb8      	bseti      	r3, 24
    4d3e:	b264      	st.w      	r3, (r2, 0x10)
    4d40:	3300      	movi      	r3, 0
    4d42:	07d5      	br      	0x4cec	// 4cec <TK_con0_config+0x58>
    4d44:	2000004c 	.long	0x2000004c
    4d48:	20000050 	.long	0x20000050
    4d4c:	20000058 	.long	0x20000058

Disassembly of section .text.TK_IO_Enable:

00004d50 <TK_IO_Enable>:
    4d50:	14d4      	push      	r4-r7, r15
    4d52:	1422      	subi      	r14, r14, 8
    4d54:	1269      	lrw      	r3, 0x2000004c	// 4e78 <TK_IO_Enable+0x128>
    4d56:	31f0      	movi      	r1, 240
    4d58:	9360      	ld.w      	r3, (r3, 0x0)
    4d5a:	9340      	ld.w      	r2, (r3, 0x0)
    4d5c:	4130      	lsli      	r1, r1, 16
    4d5e:	6885      	andn      	r2, r1
    4d60:	3ab4      	bseti      	r2, 20
    4d62:	3ab7      	bseti      	r2, 23
    4d64:	b340      	st.w      	r2, (r3, 0x0)
    4d66:	35f0      	movi      	r5, 240
    4d68:	1245      	lrw      	r2, 0x20000190	// 4e7c <TK_IO_Enable+0x12c>
    4d6a:	36f0      	movi      	r6, 240
    4d6c:	9240      	ld.w      	r2, (r2, 0x0)
    4d6e:	b841      	st.w      	r2, (r14, 0x4)
    4d70:	3400      	movi      	r4, 0
    4d72:	1244      	lrw      	r2, 0x20000048	// 4e80 <TK_IO_Enable+0x130>
    4d74:	45ac      	lsli      	r5, r5, 12
    4d76:	9240      	ld.w      	r2, (r2, 0x0)
    4d78:	b820      	st.w      	r1, (r14, 0x0)
    4d7a:	46c8      	lsli      	r6, r6, 8
    4d7c:	3701      	movi      	r7, 1
    4d7e:	71d0      	lsl      	r7, r4
    4d80:	9821      	ld.w      	r1, (r14, 0x4)
    4d82:	69c4      	and      	r7, r1
    4d84:	3f40      	cmpnei      	r7, 0
    4d86:	7410      	zextb      	r0, r4
    4d88:	0c1b      	bf      	0x4dbe	// 4dbe <TK_IO_Enable+0x6e>
    4d8a:	2800      	subi      	r0, 1
    4d8c:	380f      	cmphsi      	r0, 16
    4d8e:	080b      	bt      	0x4da4	// 4da4 <TK_IO_Enable+0x54>
    4d90:	e3ffdfb6 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    4d94:	27201a0f 	.long	0x27201a0f
    4d98:	3d38312c 	.long	0x3d38312c
    4d9c:	56514a44 	.long	0x56514a44
    4da0:	6c67615b 	.long	0x6c67615b
    4da4:	9200      	ld.w      	r0, (r2, 0x0)
    4da6:	37f0      	movi      	r7, 240
    4da8:	681d      	andn      	r0, r7
    4daa:	38a4      	bseti      	r0, 4
    4dac:	38a7      	bseti      	r0, 7
    4dae:	b200      	st.w      	r0, (r2, 0x0)
    4db0:	0407      	br      	0x4dbe	// 4dbe <TK_IO_Enable+0x6e>
    4db2:	9300      	ld.w      	r0, (r3, 0x0)
    4db4:	370f      	movi      	r7, 15
    4db6:	681d      	andn      	r0, r7
    4db8:	38a0      	bseti      	r0, 0
    4dba:	38a3      	bseti      	r0, 3
    4dbc:	b300      	st.w      	r0, (r3, 0x0)
    4dbe:	2400      	addi      	r4, 1
    4dc0:	3c51      	cmpnei      	r4, 17
    4dc2:	0bdd      	bt      	0x4d7c	// 4d7c <TK_IO_Enable+0x2c>
    4dc4:	1402      	addi      	r14, r14, 8
    4dc6:	1494      	pop      	r4-r7, r15
    4dc8:	9300      	ld.w      	r0, (r3, 0x0)
    4dca:	37f0      	movi      	r7, 240
    4dcc:	681d      	andn      	r0, r7
    4dce:	38a4      	bseti      	r0, 4
    4dd0:	38a7      	bseti      	r0, 7
    4dd2:	07f5      	br      	0x4dbc	// 4dbc <TK_IO_Enable+0x6c>
    4dd4:	37f0      	movi      	r7, 240
    4dd6:	9300      	ld.w      	r0, (r3, 0x0)
    4dd8:	47e4      	lsli      	r7, r7, 4
    4dda:	681d      	andn      	r0, r7
    4ddc:	38a8      	bseti      	r0, 8
    4dde:	38ab      	bseti      	r0, 11
    4de0:	07ee      	br      	0x4dbc	// 4dbc <TK_IO_Enable+0x6c>
    4de2:	9300      	ld.w      	r0, (r3, 0x0)
    4de4:	6819      	andn      	r0, r6
    4de6:	38ac      	bseti      	r0, 12
    4de8:	38af      	bseti      	r0, 15
    4dea:	07e9      	br      	0x4dbc	// 4dbc <TK_IO_Enable+0x6c>
    4dec:	9300      	ld.w      	r0, (r3, 0x0)
    4dee:	6815      	andn      	r0, r5
    4df0:	38b0      	bseti      	r0, 16
    4df2:	38b3      	bseti      	r0, 19
    4df4:	07e4      	br      	0x4dbc	// 4dbc <TK_IO_Enable+0x6c>
    4df6:	37f0      	movi      	r7, 240
    4df8:	9200      	ld.w      	r0, (r2, 0x0)
    4dfa:	47e4      	lsli      	r7, r7, 4
    4dfc:	681d      	andn      	r0, r7
    4dfe:	38a8      	bseti      	r0, 8
    4e00:	38ab      	bseti      	r0, 11
    4e02:	07d6      	br      	0x4dae	// 4dae <TK_IO_Enable+0x5e>
    4e04:	9200      	ld.w      	r0, (r2, 0x0)
    4e06:	6819      	andn      	r0, r6
    4e08:	38ac      	bseti      	r0, 12
    4e0a:	38af      	bseti      	r0, 15
    4e0c:	07d1      	br      	0x4dae	// 4dae <TK_IO_Enable+0x5e>
    4e0e:	9301      	ld.w      	r0, (r3, 0x4)
    4e10:	370f      	movi      	r7, 15
    4e12:	681d      	andn      	r0, r7
    4e14:	38a0      	bseti      	r0, 0
    4e16:	38a3      	bseti      	r0, 3
    4e18:	b301      	st.w      	r0, (r3, 0x4)
    4e1a:	07d2      	br      	0x4dbe	// 4dbe <TK_IO_Enable+0x6e>
    4e1c:	9301      	ld.w      	r0, (r3, 0x4)
    4e1e:	37f0      	movi      	r7, 240
    4e20:	681d      	andn      	r0, r7
    4e22:	38a4      	bseti      	r0, 4
    4e24:	38a7      	bseti      	r0, 7
    4e26:	07f9      	br      	0x4e18	// 4e18 <TK_IO_Enable+0xc8>
    4e28:	37f0      	movi      	r7, 240
    4e2a:	9301      	ld.w      	r0, (r3, 0x4)
    4e2c:	47e4      	lsli      	r7, r7, 4
    4e2e:	681d      	andn      	r0, r7
    4e30:	38a8      	bseti      	r0, 8
    4e32:	38ab      	bseti      	r0, 11
    4e34:	07f2      	br      	0x4e18	// 4e18 <TK_IO_Enable+0xc8>
    4e36:	9301      	ld.w      	r0, (r3, 0x4)
    4e38:	6819      	andn      	r0, r6
    4e3a:	38ac      	bseti      	r0, 12
    4e3c:	38af      	bseti      	r0, 15
    4e3e:	07ed      	br      	0x4e18	// 4e18 <TK_IO_Enable+0xc8>
    4e40:	9301      	ld.w      	r0, (r3, 0x4)
    4e42:	6815      	andn      	r0, r5
    4e44:	38b0      	bseti      	r0, 16
    4e46:	38b3      	bseti      	r0, 19
    4e48:	07e8      	br      	0x4e18	// 4e18 <TK_IO_Enable+0xc8>
    4e4a:	9301      	ld.w      	r0, (r3, 0x4)
    4e4c:	9820      	ld.w      	r1, (r14, 0x0)
    4e4e:	6805      	andn      	r0, r1
    4e50:	38b4      	bseti      	r0, 20
    4e52:	38b7      	bseti      	r0, 23
    4e54:	07e2      	br      	0x4e18	// 4e18 <TK_IO_Enable+0xc8>
    4e56:	9200      	ld.w      	r0, (r2, 0x0)
    4e58:	370f      	movi      	r7, 15
    4e5a:	681d      	andn      	r0, r7
    4e5c:	38a0      	bseti      	r0, 0
    4e5e:	38a3      	bseti      	r0, 3
    4e60:	07a7      	br      	0x4dae	// 4dae <TK_IO_Enable+0x5e>
    4e62:	9200      	ld.w      	r0, (r2, 0x0)
    4e64:	6815      	andn      	r0, r5
    4e66:	38b0      	bseti      	r0, 16
    4e68:	38b3      	bseti      	r0, 19
    4e6a:	07a2      	br      	0x4dae	// 4dae <TK_IO_Enable+0x5e>
    4e6c:	9200      	ld.w      	r0, (r2, 0x0)
    4e6e:	9820      	ld.w      	r1, (r14, 0x0)
    4e70:	6805      	andn      	r0, r1
    4e72:	38b4      	bseti      	r0, 20
    4e74:	38b7      	bseti      	r0, 23
    4e76:	079c      	br      	0x4dae	// 4dae <TK_IO_Enable+0x5e>
    4e78:	2000004c 	.long	0x2000004c
    4e7c:	20000190 	.long	0x20000190
    4e80:	20000048 	.long	0x20000048

Disassembly of section .text.TK_Sampling_prog:

00004e84 <TK_Sampling_prog>:
    4e84:	14c4      	push      	r4-r7
    4e86:	1423      	subi      	r14, r14, 12
    4e88:	1169      	lrw      	r3, 0x20000054	// 4f2c <TK_Sampling_prog+0xa8>
    4e8a:	114a      	lrw      	r2, 0x20000461	// 4f30 <TK_Sampling_prog+0xac>
    4e8c:	6d0b      	mov      	r4, r2
    4e8e:	9320      	ld.w      	r1, (r3, 0x0)
    4e90:	b840      	st.w      	r2, (r14, 0x0)
    4e92:	3300      	movi      	r3, 0
    4e94:	11a8      	lrw      	r5, 0x200004ea	// 4f34 <TK_Sampling_prog+0xb0>
    4e96:	9840      	ld.w      	r2, (r14, 0x0)
    4e98:	8240      	ld.b      	r2, (r2, 0x0)
    4e9a:	3a41      	cmpnei      	r2, 1
    4e9c:	0808      	bt      	0x4eac	// 4eac <TK_Sampling_prog+0x28>
    4e9e:	4342      	lsli      	r2, r3, 2
    4ea0:	6084      	addu      	r2, r1
    4ea2:	9200      	ld.w      	r0, (r2, 0x0)
    4ea4:	4341      	lsli      	r2, r3, 1
    4ea6:	7401      	zexth      	r0, r0
    4ea8:	6094      	addu      	r2, r5
    4eaa:	aa00      	st.h      	r0, (r2, 0x0)
    4eac:	8440      	ld.b      	r2, (r4, 0x0)
    4eae:	3a42      	cmpnei      	r2, 2
    4eb0:	0809      	bt      	0x4ec2	// 4ec2 <TK_Sampling_prog+0x3e>
    4eb2:	4342      	lsli      	r2, r3, 2
    4eb4:	6084      	addu      	r2, r1
    4eb6:	9200      	ld.w      	r0, (r2, 0x0)
    4eb8:	4341      	lsli      	r2, r3, 1
    4eba:	11c0      	lrw      	r6, 0x20000310	// 4f38 <TK_Sampling_prog+0xb4>
    4ebc:	7401      	zexth      	r0, r0
    4ebe:	6098      	addu      	r2, r6
    4ec0:	aa00      	st.h      	r0, (r2, 0x0)
    4ec2:	8440      	ld.b      	r2, (r4, 0x0)
    4ec4:	3a40      	cmpnei      	r2, 0
    4ec6:	0809      	bt      	0x4ed8	// 4ed8 <TK_Sampling_prog+0x54>
    4ec8:	4342      	lsli      	r2, r3, 2
    4eca:	6084      	addu      	r2, r1
    4ecc:	9200      	ld.w      	r0, (r2, 0x0)
    4ece:	4341      	lsli      	r2, r3, 1
    4ed0:	10db      	lrw      	r6, 0x200003b0	// 4f3c <TK_Sampling_prog+0xb8>
    4ed2:	7401      	zexth      	r0, r0
    4ed4:	6098      	addu      	r2, r6
    4ed6:	aa00      	st.h      	r0, (r2, 0x0)
    4ed8:	10da      	lrw      	r6, 0x2000035b	// 4f40 <TK_Sampling_prog+0xbc>
    4eda:	8640      	ld.b      	r2, (r6, 0x0)
    4edc:	3a41      	cmpnei      	r2, 1
    4ede:	0821      	bt      	0x4f20	// 4f20 <TK_Sampling_prog+0x9c>
    4ee0:	1079      	lrw      	r3, 0x20000244	// 4f44 <TK_Sampling_prog+0xc0>
    4ee2:	3200      	movi      	r2, 0
    4ee4:	b861      	st.w      	r3, (r14, 0x4)
    4ee6:	1075      	lrw      	r3, 0x20000310	// 4f38 <TK_Sampling_prog+0xb4>
    4ee8:	b862      	st.w      	r3, (r14, 0x8)
    4eea:	4261      	lsli      	r3, r2, 1
    4eec:	5d0c      	addu      	r0, r5, r3
    4eee:	8800      	ld.h      	r0, (r0, 0x0)
    4ef0:	98e1      	ld.w      	r7, (r14, 0x4)
    4ef2:	61cc      	addu      	r7, r3
    4ef4:	7401      	zexth      	r0, r0
    4ef6:	af00      	st.h      	r0, (r7, 0x0)
    4ef8:	9802      	ld.w      	r0, (r14, 0x8)
    4efa:	600c      	addu      	r0, r3
    4efc:	8800      	ld.h      	r0, (r0, 0x0)
    4efe:	10f3      	lrw      	r7, 0x2000037c	// 4f48 <TK_Sampling_prog+0xc4>
    4f00:	61cc      	addu      	r7, r3
    4f02:	7401      	zexth      	r0, r0
    4f04:	af00      	st.h      	r0, (r7, 0x0)
    4f06:	2200      	addi      	r2, 1
    4f08:	100d      	lrw      	r0, 0x200003b0	// 4f3c <TK_Sampling_prog+0xb8>
    4f0a:	600c      	addu      	r0, r3
    4f0c:	8800      	ld.h      	r0, (r0, 0x0)
    4f0e:	10f0      	lrw      	r7, 0x20000462	// 4f4c <TK_Sampling_prog+0xc8>
    4f10:	7401      	zexth      	r0, r0
    4f12:	60dc      	addu      	r3, r7
    4f14:	3a51      	cmpnei      	r2, 17
    4f16:	ab00      	st.h      	r0, (r3, 0x0)
    4f18:	0be9      	bt      	0x4eea	// 4eea <TK_Sampling_prog+0x66>
    4f1a:	3300      	movi      	r3, 0
    4f1c:	a660      	st.b      	r3, (r6, 0x0)
    4f1e:	3311      	movi      	r3, 17
    4f20:	2300      	addi      	r3, 1
    4f22:	74cc      	zextb      	r3, r3
    4f24:	3b10      	cmphsi      	r3, 17
    4f26:	0fb8      	bf      	0x4e96	// 4e96 <TK_Sampling_prog+0x12>
    4f28:	1403      	addi      	r14, r14, 12
    4f2a:	1484      	pop      	r4-r7
    4f2c:	20000054 	.long	0x20000054
    4f30:	20000461 	.long	0x20000461
    4f34:	200004ea 	.long	0x200004ea
    4f38:	20000310 	.long	0x20000310
    4f3c:	200003b0 	.long	0x200003b0
    4f40:	2000035b 	.long	0x2000035b
    4f44:	20000244 	.long	0x20000244
    4f48:	2000037c 	.long	0x2000037c
    4f4c:	20000462 	.long	0x20000462

Disassembly of section .text.TKEYIntHandler:

00004f50 <TKEYIntHandler>:
    4f50:	1460      	nie
    4f52:	1462      	ipush
    4f54:	14d1      	push      	r4, r15
    4f56:	1183      	lrw      	r4, 0x200000c0	// 4fe0 <TKEYIntHandler+0x90>
    4f58:	9460      	ld.w      	r3, (r4, 0x0)
    4f5a:	3b40      	cmpnei      	r3, 0
    4f5c:	0815      	bt      	0x4f86	// 4f86 <TKEYIntHandler+0x36>
    4f5e:	3301      	movi      	r3, 1
    4f60:	b460      	st.w      	r3, (r4, 0x0)
    4f62:	1161      	lrw      	r3, 0x200002d8	// 4fe4 <TKEYIntHandler+0x94>
    4f64:	8360      	ld.b      	r3, (r3, 0x0)
    4f66:	3b41      	cmpnei      	r3, 1
    4f68:	080f      	bt      	0x4f86	// 4f86 <TKEYIntHandler+0x36>
    4f6a:	1140      	lrw      	r2, 0x20000461	// 4fe8 <TKEYIntHandler+0x98>
    4f6c:	8260      	ld.b      	r3, (r2, 0x0)
    4f6e:	2300      	addi      	r3, 1
    4f70:	74cc      	zextb      	r3, r3
    4f72:	a260      	st.b      	r3, (r2, 0x0)
    4f74:	8260      	ld.b      	r3, (r2, 0x0)
    4f76:	3b43      	cmpnei      	r3, 3
    4f78:	0803      	bt      	0x4f7e	// 4f7e <TKEYIntHandler+0x2e>
    4f7a:	3300      	movi      	r3, 0
    4f7c:	a260      	st.b      	r3, (r2, 0x0)
    4f7e:	e3ffff83 	bsr      	0x4e84	// 4e84 <TK_Sampling_prog>
    4f82:	3301      	movi      	r3, 1
    4f84:	a464      	st.b      	r3, (r4, 0x4)
    4f86:	107a      	lrw      	r3, 0x20000058	// 4fec <TKEYIntHandler+0x9c>
    4f88:	3101      	movi      	r1, 1
    4f8a:	9360      	ld.w      	r3, (r3, 0x0)
    4f8c:	934a      	ld.w      	r2, (r3, 0x28)
    4f8e:	6884      	and      	r2, r1
    4f90:	3a40      	cmpnei      	r2, 0
    4f92:	0c02      	bf      	0x4f96	// 4f96 <TKEYIntHandler+0x46>
    4f94:	b32c      	st.w      	r1, (r3, 0x30)
    4f96:	934a      	ld.w      	r2, (r3, 0x28)
    4f98:	3102      	movi      	r1, 2
    4f9a:	6884      	and      	r2, r1
    4f9c:	3a40      	cmpnei      	r2, 0
    4f9e:	0c02      	bf      	0x4fa2	// 4fa2 <TKEYIntHandler+0x52>
    4fa0:	b32c      	st.w      	r1, (r3, 0x30)
    4fa2:	934a      	ld.w      	r2, (r3, 0x28)
    4fa4:	3104      	movi      	r1, 4
    4fa6:	6884      	and      	r2, r1
    4fa8:	3a40      	cmpnei      	r2, 0
    4faa:	0c02      	bf      	0x4fae	// 4fae <TKEYIntHandler+0x5e>
    4fac:	b32c      	st.w      	r1, (r3, 0x30)
    4fae:	934a      	ld.w      	r2, (r3, 0x28)
    4fb0:	3108      	movi      	r1, 8
    4fb2:	6884      	and      	r2, r1
    4fb4:	3a40      	cmpnei      	r2, 0
    4fb6:	0c02      	bf      	0x4fba	// 4fba <TKEYIntHandler+0x6a>
    4fb8:	b32c      	st.w      	r1, (r3, 0x30)
    4fba:	934a      	ld.w      	r2, (r3, 0x28)
    4fbc:	3110      	movi      	r1, 16
    4fbe:	6884      	and      	r2, r1
    4fc0:	3a40      	cmpnei      	r2, 0
    4fc2:	0c02      	bf      	0x4fc6	// 4fc6 <TKEYIntHandler+0x76>
    4fc4:	b32c      	st.w      	r1, (r3, 0x30)
    4fc6:	934a      	ld.w      	r2, (r3, 0x28)
    4fc8:	3120      	movi      	r1, 32
    4fca:	6884      	and      	r2, r1
    4fcc:	3a40      	cmpnei      	r2, 0
    4fce:	0c02      	bf      	0x4fd2	// 4fd2 <TKEYIntHandler+0x82>
    4fd0:	b32c      	st.w      	r1, (r3, 0x30)
    4fd2:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    4fd6:	9880      	ld.w      	r4, (r14, 0x0)
    4fd8:	1402      	addi      	r14, r14, 8
    4fda:	1463      	ipop
    4fdc:	1461      	nir
    4fde:	0000      	bkpt
    4fe0:	200000c0 	.long	0x200000c0
    4fe4:	200002d8 	.long	0x200002d8
    4fe8:	20000461 	.long	0x20000461
    4fec:	20000058 	.long	0x20000058

Disassembly of section .text.get_key_number:

00004ff0 <get_key_number>:
    4ff0:	14c2      	push      	r4-r5
    4ff2:	3200      	movi      	r2, 0
    4ff4:	3000      	movi      	r0, 0
    4ff6:	1088      	lrw      	r4, 0x20000378	// 5014 <get_key_number+0x24>
    4ff8:	3501      	movi      	r5, 1
    4ffa:	3120      	movi      	r1, 32
    4ffc:	9460      	ld.w      	r3, (r4, 0x0)
    4ffe:	70c9      	lsr      	r3, r2
    5000:	68d4      	and      	r3, r5
    5002:	3b40      	cmpnei      	r3, 0
    5004:	0c02      	bf      	0x5008	// 5008 <get_key_number+0x18>
    5006:	2000      	addi      	r0, 1
    5008:	2200      	addi      	r2, 1
    500a:	644a      	cmpne      	r2, r1
    500c:	0bf8      	bt      	0x4ffc	// 4ffc <get_key_number+0xc>
    500e:	7400      	zextb      	r0, r0
    5010:	1482      	pop      	r4-r5
    5012:	0000      	bkpt
    5014:	20000378 	.long	0x20000378

Disassembly of section .text.TK_Baseline_prog:

00005018 <TK_Baseline_prog>:
    5018:	14c4      	push      	r4-r7
    501a:	142a      	subi      	r14, r14, 40
    501c:	1262      	lrw      	r3, 0x200000c0	// 5124 <TK_Baseline_prog+0x10c>
    501e:	b862      	st.w      	r3, (r14, 0x8)
    5020:	9342      	ld.w      	r2, (r3, 0x8)
    5022:	b845      	st.w      	r2, (r14, 0x14)
    5024:	9343      	ld.w      	r2, (r3, 0xc)
    5026:	b844      	st.w      	r2, (r14, 0x10)
    5028:	9344      	ld.w      	r2, (r3, 0x10)
    502a:	b843      	st.w      	r2, (r14, 0xc)
    502c:	117f      	lrw      	r3, 0x20000244	// 5128 <TK_Baseline_prog+0x110>
    502e:	1240      	lrw      	r2, 0x20000058	// 512c <TK_Baseline_prog+0x114>
    5030:	b867      	st.w      	r3, (r14, 0x1c)
    5032:	9240      	ld.w      	r2, (r2, 0x0)
    5034:	b846      	st.w      	r2, (r14, 0x18)
    5036:	115f      	lrw      	r2, 0x20000054	// 5130 <TK_Baseline_prog+0x118>
    5038:	9240      	ld.w      	r2, (r2, 0x0)
    503a:	b840      	st.w      	r2, (r14, 0x0)
    503c:	3206      	movi      	r2, 6
    503e:	b841      	st.w      	r2, (r14, 0x4)
    5040:	115d      	lrw      	r2, 0x20000461	// 5134 <TK_Baseline_prog+0x11c>
    5042:	6c0b      	mov      	r0, r2
    5044:	3103      	movi      	r1, 3
    5046:	8260      	ld.b      	r3, (r2, 0x0)
    5048:	74cc      	zextb      	r3, r3
    504a:	3b41      	cmpnei      	r3, 1
    504c:	0c64      	bf      	0x5114	// 5114 <TK_Baseline_prog+0xfc>
    504e:	3b40      	cmpnei      	r3, 0
    5050:	0c5a      	bf      	0x5104	// 5104 <TK_Baseline_prog+0xec>
    5052:	3b42      	cmpnei      	r3, 2
    5054:	0c63      	bf      	0x511a	// 511a <TK_Baseline_prog+0x102>
    5056:	3301      	movi      	r3, 1
    5058:	9886      	ld.w      	r4, (r14, 0x18)
    505a:	b462      	st.w      	r3, (r4, 0x8)
    505c:	3300      	movi      	r3, 0
    505e:	9882      	ld.w      	r4, (r14, 0x8)
    5060:	b460      	st.w      	r3, (r4, 0x0)
    5062:	9862      	ld.w      	r3, (r14, 0x8)
    5064:	9360      	ld.w      	r3, (r3, 0x0)
    5066:	3b40      	cmpnei      	r3, 0
    5068:	0ffd      	bf      	0x5062	// 5062 <TK_Baseline_prog+0x4a>
    506a:	6c03      	mov      	r0, r0
    506c:	1193      	lrw      	r4, 0x200004ea	// 5138 <TK_Baseline_prog+0x120>
    506e:	3300      	movi      	r3, 0
    5070:	b888      	st.w      	r4, (r14, 0x20)
    5072:	1193      	lrw      	r4, 0x2000037c	// 513c <TK_Baseline_prog+0x124>
    5074:	b889      	st.w      	r4, (r14, 0x24)
    5076:	8080      	ld.b      	r4, (r0, 0x0)
    5078:	3c41      	cmpnei      	r4, 1
    507a:	080f      	bt      	0x5098	// 5098 <TK_Baseline_prog+0x80>
    507c:	9880      	ld.w      	r4, (r14, 0x0)
    507e:	43a2      	lsli      	r5, r3, 2
    5080:	6150      	addu      	r5, r4
    5082:	95c0      	ld.w      	r6, (r5, 0x0)
    5084:	4381      	lsli      	r4, r3, 1
    5086:	98e7      	ld.w      	r7, (r14, 0x1c)
    5088:	7599      	zexth      	r6, r6
    508a:	61d0      	addu      	r7, r4
    508c:	afc0      	st.h      	r6, (r7, 0x0)
    508e:	95a0      	ld.w      	r5, (r5, 0x0)
    5090:	98c8      	ld.w      	r6, (r14, 0x20)
    5092:	7555      	zexth      	r5, r5
    5094:	6118      	addu      	r4, r6
    5096:	aca0      	st.h      	r5, (r4, 0x0)
    5098:	8080      	ld.b      	r4, (r0, 0x0)
    509a:	3c42      	cmpnei      	r4, 2
    509c:	080f      	bt      	0x50ba	// 50ba <TK_Baseline_prog+0xa2>
    509e:	9880      	ld.w      	r4, (r14, 0x0)
    50a0:	43a2      	lsli      	r5, r3, 2
    50a2:	6150      	addu      	r5, r4
    50a4:	95c0      	ld.w      	r6, (r5, 0x0)
    50a6:	4381      	lsli      	r4, r3, 1
    50a8:	98e9      	ld.w      	r7, (r14, 0x24)
    50aa:	7599      	zexth      	r6, r6
    50ac:	61d0      	addu      	r7, r4
    50ae:	afc0      	st.h      	r6, (r7, 0x0)
    50b0:	95a0      	ld.w      	r5, (r5, 0x0)
    50b2:	7555      	zexth      	r5, r5
    50b4:	11c3      	lrw      	r6, 0x20000310	// 5140 <TK_Baseline_prog+0x128>
    50b6:	6118      	addu      	r4, r6
    50b8:	aca0      	st.h      	r5, (r4, 0x0)
    50ba:	8080      	ld.b      	r4, (r0, 0x0)
    50bc:	3c40      	cmpnei      	r4, 0
    50be:	080f      	bt      	0x50dc	// 50dc <TK_Baseline_prog+0xc4>
    50c0:	9880      	ld.w      	r4, (r14, 0x0)
    50c2:	43a2      	lsli      	r5, r3, 2
    50c4:	6150      	addu      	r5, r4
    50c6:	95c0      	ld.w      	r6, (r5, 0x0)
    50c8:	4381      	lsli      	r4, r3, 1
    50ca:	10ff      	lrw      	r7, 0x20000462	// 5144 <TK_Baseline_prog+0x12c>
    50cc:	7599      	zexth      	r6, r6
    50ce:	61d0      	addu      	r7, r4
    50d0:	afc0      	st.h      	r6, (r7, 0x0)
    50d2:	95a0      	ld.w      	r5, (r5, 0x0)
    50d4:	7555      	zexth      	r5, r5
    50d6:	10dd      	lrw      	r6, 0x200003b0	// 5148 <TK_Baseline_prog+0x130>
    50d8:	6118      	addu      	r4, r6
    50da:	aca0      	st.h      	r5, (r4, 0x0)
    50dc:	2300      	addi      	r3, 1
    50de:	3b51      	cmpnei      	r3, 17
    50e0:	0bcb      	bt      	0x5076	// 5076 <TK_Baseline_prog+0x5e>
    50e2:	2900      	subi      	r1, 1
    50e4:	7444      	zextb      	r1, r1
    50e6:	3940      	cmpnei      	r1, 0
    50e8:	0baf      	bt      	0x5046	// 5046 <TK_Baseline_prog+0x2e>
    50ea:	9861      	ld.w      	r3, (r14, 0x4)
    50ec:	2b00      	subi      	r3, 1
    50ee:	74cc      	zextb      	r3, r3
    50f0:	3b40      	cmpnei      	r3, 0
    50f2:	b861      	st.w      	r3, (r14, 0x4)
    50f4:	0ba8      	bt      	0x5044	// 5044 <TK_Baseline_prog+0x2c>
    50f6:	1076      	lrw      	r3, 0x200002d8	// 514c <TK_Baseline_prog+0x134>
    50f8:	3201      	movi      	r2, 1
    50fa:	a340      	st.b      	r2, (r3, 0x0)
    50fc:	3300      	movi      	r3, 0
    50fe:	a060      	st.b      	r3, (r0, 0x0)
    5100:	140a      	addi      	r14, r14, 40
    5102:	1484      	pop      	r4-r7
    5104:	1073      	lrw      	r3, 0x40011200	// 5150 <TK_Baseline_prog+0x138>
    5106:	9883      	ld.w      	r4, (r14, 0xc)
    5108:	b390      	st.w      	r4, (r3, 0x40)
    510a:	8260      	ld.b      	r3, (r2, 0x0)
    510c:	2300      	addi      	r3, 1
    510e:	74cc      	zextb      	r3, r3
    5110:	a260      	st.b      	r3, (r2, 0x0)
    5112:	07a2      	br      	0x5056	// 5056 <TK_Baseline_prog+0x3e>
    5114:	106f      	lrw      	r3, 0x40011200	// 5150 <TK_Baseline_prog+0x138>
    5116:	9884      	ld.w      	r4, (r14, 0x10)
    5118:	07f8      	br      	0x5108	// 5108 <TK_Baseline_prog+0xf0>
    511a:	106e      	lrw      	r3, 0x40011200	// 5150 <TK_Baseline_prog+0x138>
    511c:	9885      	ld.w      	r4, (r14, 0x14)
    511e:	b390      	st.w      	r4, (r3, 0x40)
    5120:	3300      	movi      	r3, 0
    5122:	07f7      	br      	0x5110	// 5110 <TK_Baseline_prog+0xf8>
    5124:	200000c0 	.long	0x200000c0
    5128:	20000244 	.long	0x20000244
    512c:	20000058 	.long	0x20000058
    5130:	20000054 	.long	0x20000054
    5134:	20000461 	.long	0x20000461
    5138:	200004ea 	.long	0x200004ea
    513c:	2000037c 	.long	0x2000037c
    5140:	20000310 	.long	0x20000310
    5144:	20000462 	.long	0x20000462
    5148:	200003b0 	.long	0x200003b0
    514c:	200002d8 	.long	0x200002d8
    5150:	40011200 	.long	0x40011200

Disassembly of section .text.TK_Scan_Start:

00005154 <TK_Scan_Start>:
    5154:	1072      	lrw      	r3, 0x200000c0	// 519c <TK_Scan_Start+0x48>
    5156:	1053      	lrw      	r2, 0x20000461	// 51a0 <TK_Scan_Start+0x4c>
    5158:	8314      	ld.b      	r0, (r3, 0x14)
    515a:	8220      	ld.b      	r1, (r2, 0x0)
    515c:	6442      	cmpne      	r0, r1
    515e:	0c16      	bf      	0x518a	// 518a <TK_Scan_Start+0x36>
    5160:	8220      	ld.b      	r1, (r2, 0x0)
    5162:	7444      	zextb      	r1, r1
    5164:	3941      	cmpnei      	r1, 1
    5166:	0c17      	bf      	0x5194	// 5194 <TK_Scan_Start+0x40>
    5168:	3940      	cmpnei      	r1, 0
    516a:	0c11      	bf      	0x518c	// 518c <TK_Scan_Start+0x38>
    516c:	3942      	cmpnei      	r1, 2
    516e:	0c15      	bf      	0x5198	// 5198 <TK_Scan_Start+0x44>
    5170:	8240      	ld.b      	r2, (r2, 0x0)
    5172:	7488      	zextb      	r2, r2
    5174:	a354      	st.b      	r2, (r3, 0x14)
    5176:	8344      	ld.b      	r2, (r3, 0x4)
    5178:	7488      	zextb      	r2, r2
    517a:	3a41      	cmpnei      	r2, 1
    517c:	0807      	bt      	0x518a	// 518a <TK_Scan_Start+0x36>
    517e:	102a      	lrw      	r1, 0x20000058	// 51a4 <TK_Scan_Start+0x50>
    5180:	9120      	ld.w      	r1, (r1, 0x0)
    5182:	b142      	st.w      	r2, (r1, 0x8)
    5184:	3200      	movi      	r2, 0
    5186:	b340      	st.w      	r2, (r3, 0x0)
    5188:	a344      	st.b      	r2, (r3, 0x4)
    518a:	783c      	jmp      	r15
    518c:	9304      	ld.w      	r0, (r3, 0x10)
    518e:	1027      	lrw      	r1, 0x40011200	// 51a8 <TK_Scan_Start+0x54>
    5190:	b110      	st.w      	r0, (r1, 0x40)
    5192:	07ef      	br      	0x5170	// 5170 <TK_Scan_Start+0x1c>
    5194:	9303      	ld.w      	r0, (r3, 0xc)
    5196:	07fc      	br      	0x518e	// 518e <TK_Scan_Start+0x3a>
    5198:	9302      	ld.w      	r0, (r3, 0x8)
    519a:	07fa      	br      	0x518e	// 518e <TK_Scan_Start+0x3a>
    519c:	200000c0 	.long	0x200000c0
    51a0:	20000461 	.long	0x20000461
    51a4:	20000058 	.long	0x20000058
    51a8:	40011200 	.long	0x40011200

Disassembly of section .text.TK_Keymap_prog:

000051ac <TK_Keymap_prog>:
    51ac:	14d4      	push      	r4-r7, r15
    51ae:	1429      	subi      	r14, r14, 36
    51b0:	0170      	lrw      	r3, 0x2000018c	// 54ec <TK_Keymap_prog+0x340>
    51b2:	8360      	ld.b      	r3, (r3, 0x0)
    51b4:	b860      	st.w      	r3, (r14, 0x0)
    51b6:	3400      	movi      	r4, 0
    51b8:	0171      	lrw      	r3, 0x20000160	// 54f0 <TK_Keymap_prog+0x344>
    51ba:	8360      	ld.b      	r3, (r3, 0x0)
    51bc:	b861      	st.w      	r3, (r14, 0x4)
    51be:	0171      	lrw      	r3, 0x20000169	// 54f4 <TK_Keymap_prog+0x348>
    51c0:	83a0      	ld.b      	r5, (r3, 0x0)
    51c2:	0171      	lrw      	r3, 0x20000168	// 54f8 <TK_Keymap_prog+0x34c>
    51c4:	8360      	ld.b      	r3, (r3, 0x0)
    51c6:	b865      	st.w      	r3, (r14, 0x14)
    51c8:	0172      	lrw      	r3, 0x200004ea	// 54fc <TK_Keymap_prog+0x350>
    51ca:	b866      	st.w      	r3, (r14, 0x18)
    51cc:	0172      	lrw      	r3, 0x200002ee	// 5500 <TK_Keymap_prog+0x354>
    51ce:	b863      	st.w      	r3, (r14, 0xc)
    51d0:	b867      	st.w      	r3, (r14, 0x1c)
    51d2:	4461      	lsli      	r3, r4, 1
    51d4:	9846      	ld.w      	r2, (r14, 0x18)
    51d6:	608c      	addu      	r2, r3
    51d8:	0134      	lrw      	r1, 0x20000244	// 5504 <TK_Keymap_prog+0x358>
    51da:	604c      	addu      	r1, r3
    51dc:	8a40      	ld.h      	r2, (r2, 0x0)
    51de:	8920      	ld.h      	r1, (r1, 0x0)
    51e0:	6086      	subu      	r2, r1
    51e2:	9827      	ld.w      	r1, (r14, 0x1c)
    51e4:	604c      	addu      	r1, r3
    51e6:	748b      	sexth      	r2, r2
    51e8:	a940      	st.h      	r2, (r1, 0x0)
    51ea:	0117      	lrw      	r0, 0x2000037c	// 5508 <TK_Keymap_prog+0x35c>
    51ec:	0157      	lrw      	r2, 0x20000310	// 550c <TK_Keymap_prog+0x360>
    51ee:	608c      	addu      	r2, r3
    51f0:	600c      	addu      	r0, r3
    51f2:	8a40      	ld.h      	r2, (r2, 0x0)
    51f4:	8800      	ld.h      	r0, (r0, 0x0)
    51f6:	6082      	subu      	r2, r0
    51f8:	01f9      	lrw      	r7, 0x200003d2	// 5510 <TK_Keymap_prog+0x364>
    51fa:	5f0c      	addu      	r0, r7, r3
    51fc:	748b      	sexth      	r2, r2
    51fe:	a840      	st.h      	r2, (r0, 0x0)
    5200:	011a      	lrw      	r0, 0x20000462	// 5514 <TK_Keymap_prog+0x368>
    5202:	0159      	lrw      	r2, 0x200003b0	// 5518 <TK_Keymap_prog+0x36c>
    5204:	608c      	addu      	r2, r3
    5206:	600c      	addu      	r0, r3
    5208:	8a40      	ld.h      	r2, (r2, 0x0)
    520a:	8800      	ld.h      	r0, (r0, 0x0)
    520c:	6082      	subu      	r2, r0
    520e:	011b      	lrw      	r0, 0x200004c8	// 551c <TK_Keymap_prog+0x370>
    5210:	748b      	sexth      	r2, r2
    5212:	58cc      	addu      	r6, r0, r3
    5214:	ae40      	st.h      	r2, (r6, 0x0)
    5216:	8940      	ld.h      	r2, (r1, 0x0)
    5218:	748b      	sexth      	r2, r2
    521a:	3adf      	btsti      	r2, 31
    521c:	015e      	lrw      	r2, 0x200004a6	// 5520 <TK_Keymap_prog+0x374>
    521e:	60c8      	addu      	r3, r2
    5220:	b802      	st.w      	r0, (r14, 0x8)
    5222:	0c4d      	bf      	0x52bc	// 52bc <TK_Keymap_prog+0x110>
    5224:	3200      	movi      	r2, 0
    5226:	ab40      	st.h      	r2, (r3, 0x0)
    5228:	4461      	lsli      	r3, r4, 1
    522a:	5f2c      	addu      	r1, r7, r3
    522c:	8940      	ld.h      	r2, (r1, 0x0)
    522e:	748b      	sexth      	r2, r2
    5230:	3adf      	btsti      	r2, 31
    5232:	0242      	lrw      	r2, 0x200002a0	// 5524 <TK_Keymap_prog+0x378>
    5234:	60c8      	addu      	r3, r2
    5236:	0c46      	bf      	0x52c2	// 52c2 <TK_Keymap_prog+0x116>
    5238:	3200      	movi      	r2, 0
    523a:	ab40      	st.h      	r2, (r3, 0x0)
    523c:	9822      	ld.w      	r1, (r14, 0x8)
    523e:	4461      	lsli      	r3, r4, 1
    5240:	604c      	addu      	r1, r3
    5242:	8940      	ld.h      	r2, (r1, 0x0)
    5244:	748b      	sexth      	r2, r2
    5246:	3adf      	btsti      	r2, 31
    5248:	0247      	lrw      	r2, 0x2000027c	// 5528 <TK_Keymap_prog+0x37c>
    524a:	60c8      	addu      	r3, r2
    524c:	0c3e      	bf      	0x52c8	// 52c8 <TK_Keymap_prog+0x11c>
    524e:	3200      	movi      	r2, 0
    5250:	ab40      	st.h      	r2, (r3, 0x0)
    5252:	9860      	ld.w      	r3, (r14, 0x0)
    5254:	3b03      	cmphsi      	r3, 4
    5256:	4461      	lsli      	r3, r4, 1
    5258:	0ca2      	bf      	0x539c	// 539c <TK_Keymap_prog+0x1f0>
    525a:	9823      	ld.w      	r1, (r14, 0xc)
    525c:	604c      	addu      	r1, r3
    525e:	020b      	lrw      	r0, 0x200001ba	// 552c <TK_Keymap_prog+0x380>
    5260:	8940      	ld.h      	r2, (r1, 0x0)
    5262:	60c0      	addu      	r3, r0
    5264:	748b      	sexth      	r2, r2
    5266:	8b60      	ld.h      	r3, (r3, 0x0)
    5268:	648d      	cmplt      	r3, r2
    526a:	9840      	ld.w      	r2, (r14, 0x0)
    526c:	7cc8      	mult      	r3, r2
    526e:	0c30      	bf      	0x52ce	// 52ce <TK_Keymap_prog+0x122>
    5270:	8940      	ld.h      	r2, (r1, 0x0)
    5272:	748b      	sexth      	r2, r2
    5274:	64c9      	cmplt      	r2, r3
    5276:	0c2c      	bf      	0x52ce	// 52ce <TK_Keymap_prog+0x122>
    5278:	0251      	lrw      	r2, 0x200002dc	// 5530 <TK_Keymap_prog+0x384>
    527a:	6090      	addu      	r2, r4
    527c:	8260      	ld.b      	r3, (r2, 0x0)
    527e:	2300      	addi      	r3, 1
    5280:	74cc      	zextb      	r3, r3
    5282:	a260      	st.b      	r3, (r2, 0x0)
    5284:	3100      	movi      	r1, 0
    5286:	0273      	lrw      	r3, 0x200002c2	// 5534 <TK_Keymap_prog+0x388>
    5288:	60d0      	addu      	r3, r4
    528a:	a320      	st.b      	r1, (r3, 0x0)
    528c:	0274      	lrw      	r3, 0x2000039e	// 5538 <TK_Keymap_prog+0x38c>
    528e:	60d0      	addu      	r3, r4
    5290:	a320      	st.b      	r1, (r3, 0x0)
    5292:	0274      	lrw      	r3, 0x20000418	// 553c <TK_Keymap_prog+0x390>
    5294:	60d0      	addu      	r3, r4
    5296:	a320      	st.b      	r1, (r3, 0x0)
    5298:	8260      	ld.b      	r3, (r2, 0x0)
    529a:	9821      	ld.w      	r1, (r14, 0x4)
    529c:	64c4      	cmphs      	r1, r3
    529e:	0826      	bt      	0x52ea	// 52ea <TK_Keymap_prog+0x13e>
    52a0:	3d40      	cmpnei      	r5, 0
    52a2:	0887      	bt      	0x53b0	// 53b0 <TK_Keymap_prog+0x204>
    52a4:	0238      	lrw      	r1, 0x200002d4	// 5540 <TK_Keymap_prog+0x394>
    52a6:	9160      	ld.w      	r3, (r1, 0x0)
    52a8:	3b40      	cmpnei      	r3, 0
    52aa:	0806      	bt      	0x52b6	// 52b6 <TK_Keymap_prog+0x10a>
    52ac:	9100      	ld.w      	r0, (r1, 0x0)
    52ae:	3301      	movi      	r3, 1
    52b0:	70d0      	lsl      	r3, r4
    52b2:	6cc0      	or      	r3, r0
    52b4:	b160      	st.w      	r3, (r1, 0x0)
    52b6:	3300      	movi      	r3, 0
    52b8:	a260      	st.b      	r3, (r2, 0x0)
    52ba:	0418      	br      	0x52ea	// 52ea <TK_Keymap_prog+0x13e>
    52bc:	8940      	ld.h      	r2, (r1, 0x0)
    52be:	7489      	zexth      	r2, r2
    52c0:	07b3      	br      	0x5226	// 5226 <TK_Keymap_prog+0x7a>
    52c2:	8940      	ld.h      	r2, (r1, 0x0)
    52c4:	7489      	zexth      	r2, r2
    52c6:	07ba      	br      	0x523a	// 523a <TK_Keymap_prog+0x8e>
    52c8:	8940      	ld.h      	r2, (r1, 0x0)
    52ca:	7489      	zexth      	r2, r2
    52cc:	07c2      	br      	0x5250	// 5250 <TK_Keymap_prog+0xa4>
    52ce:	4441      	lsli      	r2, r4, 1
    52d0:	9823      	ld.w      	r1, (r14, 0xc)
    52d2:	6084      	addu      	r2, r1
    52d4:	8a40      	ld.h      	r2, (r2, 0x0)
    52d6:	748b      	sexth      	r2, r2
    52d8:	648d      	cmplt      	r3, r2
    52da:	0c08      	bf      	0x52ea	// 52ea <TK_Keymap_prog+0x13e>
    52dc:	3300      	movi      	r3, 0
    52de:	0346      	lrw      	r2, 0x200002d4	// 5540 <TK_Keymap_prog+0x394>
    52e0:	2b01      	subi      	r3, 2
    52e2:	9220      	ld.w      	r1, (r2, 0x0)
    52e4:	70d3      	rotl      	r3, r4
    52e6:	68c4      	and      	r3, r1
    52e8:	b260      	st.w      	r3, (r2, 0x0)
    52ea:	4441      	lsli      	r2, r4, 1
    52ec:	9863      	ld.w      	r3, (r14, 0xc)
    52ee:	60c8      	addu      	r3, r2
    52f0:	8b60      	ld.h      	r3, (r3, 0x0)
    52f2:	74cf      	sexth      	r3, r3
    52f4:	b868      	st.w      	r3, (r14, 0x20)
    52f6:	3105      	movi      	r1, 5
    52f8:	0372      	lrw      	r3, 0x200001ba	// 552c <TK_Keymap_prog+0x380>
    52fa:	608c      	addu      	r2, r3
    52fc:	8ac0      	ld.h      	r6, (r2, 0x0)
    52fe:	4602      	lsli      	r0, r6, 2
    5300:	e3fff42c 	bsr      	0x3b58	// 3b58 <__divsi3>
    5304:	9868      	ld.w      	r3, (r14, 0x20)
    5306:	640d      	cmplt      	r3, r0
    5308:	b804      	st.w      	r0, (r14, 0x10)
    530a:	0c18      	bf      	0x533a	// 533a <TK_Keymap_prog+0x18e>
    530c:	0355      	lrw      	r2, 0x200002c2	// 5534 <TK_Keymap_prog+0x388>
    530e:	6090      	addu      	r2, r4
    5310:	8260      	ld.b      	r3, (r2, 0x0)
    5312:	2300      	addi      	r3, 1
    5314:	74cc      	zextb      	r3, r3
    5316:	a260      	st.b      	r3, (r2, 0x0)
    5318:	3100      	movi      	r1, 0
    531a:	0379      	lrw      	r3, 0x200002dc	// 5530 <TK_Keymap_prog+0x384>
    531c:	60d0      	addu      	r3, r4
    531e:	a320      	st.b      	r1, (r3, 0x0)
    5320:	8260      	ld.b      	r3, (r2, 0x0)
    5322:	9825      	ld.w      	r1, (r14, 0x14)
    5324:	64c4      	cmphs      	r1, r3
    5326:	080a      	bt      	0x533a	// 533a <TK_Keymap_prog+0x18e>
    5328:	3300      	movi      	r3, 0
    532a:	0339      	lrw      	r1, 0x200002d4	// 5540 <TK_Keymap_prog+0x394>
    532c:	2b01      	subi      	r3, 2
    532e:	9100      	ld.w      	r0, (r1, 0x0)
    5330:	70d3      	rotl      	r3, r4
    5332:	68c0      	and      	r3, r0
    5334:	b160      	st.w      	r3, (r1, 0x0)
    5336:	3300      	movi      	r3, 0
    5338:	a260      	st.b      	r3, (r2, 0x0)
    533a:	9860      	ld.w      	r3, (r14, 0x0)
    533c:	3b03      	cmphsi      	r3, 4
    533e:	4461      	lsli      	r3, r4, 1
    5340:	60dc      	addu      	r3, r7
    5342:	0c9c      	bf      	0x547a	// 547a <TK_Keymap_prog+0x2ce>
    5344:	8b40      	ld.h      	r2, (r3, 0x0)
    5346:	748b      	sexth      	r2, r2
    5348:	6499      	cmplt      	r6, r2
    534a:	0c39      	bf      	0x53bc	// 53bc <TK_Keymap_prog+0x210>
    534c:	8b60      	ld.h      	r3, (r3, 0x0)
    534e:	9840      	ld.w      	r2, (r14, 0x0)
    5350:	74cf      	sexth      	r3, r3
    5352:	7c98      	mult      	r2, r6
    5354:	648d      	cmplt      	r3, r2
    5356:	0c33      	bf      	0x53bc	// 53bc <TK_Keymap_prog+0x210>
    5358:	135b      	lrw      	r2, 0x20000429	// 5544 <TK_Keymap_prog+0x398>
    535a:	6090      	addu      	r2, r4
    535c:	8260      	ld.b      	r3, (r2, 0x0)
    535e:	2300      	addi      	r3, 1
    5360:	74cc      	zextb      	r3, r3
    5362:	a260      	st.b      	r3, (r2, 0x0)
    5364:	3100      	movi      	r1, 0
    5366:	1379      	lrw      	r3, 0x20000338	// 5548 <TK_Keymap_prog+0x39c>
    5368:	60d0      	addu      	r3, r4
    536a:	a320      	st.b      	r1, (r3, 0x0)
    536c:	1378      	lrw      	r3, 0x2000035c	// 554c <TK_Keymap_prog+0x3a0>
    536e:	60d0      	addu      	r3, r4
    5370:	a320      	st.b      	r1, (r3, 0x0)
    5372:	1378      	lrw      	r3, 0x20000406	// 5550 <TK_Keymap_prog+0x3a4>
    5374:	60d0      	addu      	r3, r4
    5376:	a320      	st.b      	r1, (r3, 0x0)
    5378:	8260      	ld.b      	r3, (r2, 0x0)
    537a:	9821      	ld.w      	r1, (r14, 0x4)
    537c:	64c4      	cmphs      	r1, r3
    537e:	082e      	bt      	0x53da	// 53da <TK_Keymap_prog+0x22e>
    5380:	3d40      	cmpnei      	r5, 0
    5382:	0881      	bt      	0x5484	// 5484 <TK_Keymap_prog+0x2d8>
    5384:	1334      	lrw      	r1, 0x20000278	// 5554 <TK_Keymap_prog+0x3a8>
    5386:	9160      	ld.w      	r3, (r1, 0x0)
    5388:	3b40      	cmpnei      	r3, 0
    538a:	0806      	bt      	0x5396	// 5396 <TK_Keymap_prog+0x1ea>
    538c:	9100      	ld.w      	r0, (r1, 0x0)
    538e:	3301      	movi      	r3, 1
    5390:	70d0      	lsl      	r3, r4
    5392:	6cc0      	or      	r3, r0
    5394:	b160      	st.w      	r3, (r1, 0x0)
    5396:	3300      	movi      	r3, 0
    5398:	a260      	st.b      	r3, (r2, 0x0)
    539a:	0420      	br      	0x53da	// 53da <TK_Keymap_prog+0x22e>
    539c:	9843      	ld.w      	r2, (r14, 0xc)
    539e:	608c      	addu      	r2, r3
    53a0:	1323      	lrw      	r1, 0x200001ba	// 552c <TK_Keymap_prog+0x380>
    53a2:	8a40      	ld.h      	r2, (r2, 0x0)
    53a4:	60c4      	addu      	r3, r1
    53a6:	748b      	sexth      	r2, r2
    53a8:	8b60      	ld.h      	r3, (r3, 0x0)
    53aa:	648d      	cmplt      	r3, r2
    53ac:	0f9f      	bf      	0x52ea	// 52ea <TK_Keymap_prog+0x13e>
    53ae:	0765      	br      	0x5278	// 5278 <TK_Keymap_prog+0xcc>
    53b0:	3d41      	cmpnei      	r5, 1
    53b2:	0b82      	bt      	0x52b6	// 52b6 <TK_Keymap_prog+0x10a>
    53b4:	1323      	lrw      	r1, 0x200002d4	// 5540 <TK_Keymap_prog+0x394>
    53b6:	6cd7      	mov      	r3, r5
    53b8:	9100      	ld.w      	r0, (r1, 0x0)
    53ba:	077b      	br      	0x52b0	// 52b0 <TK_Keymap_prog+0x104>
    53bc:	4461      	lsli      	r3, r4, 1
    53be:	60dc      	addu      	r3, r7
    53c0:	8b60      	ld.h      	r3, (r3, 0x0)
    53c2:	9840      	ld.w      	r2, (r14, 0x0)
    53c4:	74cf      	sexth      	r3, r3
    53c6:	7c98      	mult      	r2, r6
    53c8:	64c9      	cmplt      	r2, r3
    53ca:	0c08      	bf      	0x53da	// 53da <TK_Keymap_prog+0x22e>
    53cc:	3300      	movi      	r3, 0
    53ce:	1342      	lrw      	r2, 0x20000278	// 5554 <TK_Keymap_prog+0x3a8>
    53d0:	2b01      	subi      	r3, 2
    53d2:	9220      	ld.w      	r1, (r2, 0x0)
    53d4:	70d3      	rotl      	r3, r4
    53d6:	68c4      	and      	r3, r1
    53d8:	b260      	st.w      	r3, (r2, 0x0)
    53da:	4461      	lsli      	r3, r4, 1
    53dc:	61cc      	addu      	r7, r3
    53de:	8f60      	ld.h      	r3, (r7, 0x0)
    53e0:	74cf      	sexth      	r3, r3
    53e2:	9844      	ld.w      	r2, (r14, 0x10)
    53e4:	648d      	cmplt      	r3, r2
    53e6:	0c18      	bf      	0x5416	// 5416 <TK_Keymap_prog+0x26a>
    53e8:	1258      	lrw      	r2, 0x20000338	// 5548 <TK_Keymap_prog+0x39c>
    53ea:	6090      	addu      	r2, r4
    53ec:	8260      	ld.b      	r3, (r2, 0x0)
    53ee:	2300      	addi      	r3, 1
    53f0:	74cc      	zextb      	r3, r3
    53f2:	a260      	st.b      	r3, (r2, 0x0)
    53f4:	3100      	movi      	r1, 0
    53f6:	1274      	lrw      	r3, 0x20000429	// 5544 <TK_Keymap_prog+0x398>
    53f8:	60d0      	addu      	r3, r4
    53fa:	a320      	st.b      	r1, (r3, 0x0)
    53fc:	8260      	ld.b      	r3, (r2, 0x0)
    53fe:	9825      	ld.w      	r1, (r14, 0x14)
    5400:	64c4      	cmphs      	r1, r3
    5402:	080a      	bt      	0x5416	// 5416 <TK_Keymap_prog+0x26a>
    5404:	3300      	movi      	r3, 0
    5406:	1234      	lrw      	r1, 0x20000278	// 5554 <TK_Keymap_prog+0x3a8>
    5408:	2b01      	subi      	r3, 2
    540a:	9100      	ld.w      	r0, (r1, 0x0)
    540c:	70d3      	rotl      	r3, r4
    540e:	68c0      	and      	r3, r0
    5410:	b160      	st.w      	r3, (r1, 0x0)
    5412:	3300      	movi      	r3, 0
    5414:	a260      	st.b      	r3, (r2, 0x0)
    5416:	9860      	ld.w      	r3, (r14, 0x0)
    5418:	3b03      	cmphsi      	r3, 4
    541a:	9842      	ld.w      	r2, (r14, 0x8)
    541c:	4461      	lsli      	r3, r4, 1
    541e:	60c8      	addu      	r3, r2
    5420:	0cac      	bf      	0x5578	// 5578 <TK_Keymap_prog+0x3cc>
    5422:	8b40      	ld.h      	r2, (r3, 0x0)
    5424:	748b      	sexth      	r2, r2
    5426:	6499      	cmplt      	r6, r2
    5428:	9840      	ld.w      	r2, (r14, 0x0)
    542a:	7d88      	mult      	r6, r2
    542c:	0c32      	bf      	0x5490	// 5490 <TK_Keymap_prog+0x2e4>
    542e:	8b60      	ld.h      	r3, (r3, 0x0)
    5430:	74cf      	sexth      	r3, r3
    5432:	658d      	cmplt      	r3, r6
    5434:	0c2e      	bf      	0x5490	// 5490 <TK_Keymap_prog+0x2e4>
    5436:	1249      	lrw      	r2, 0x200003f5	// 5558 <TK_Keymap_prog+0x3ac>
    5438:	6090      	addu      	r2, r4
    543a:	8260      	ld.b      	r3, (r2, 0x0)
    543c:	2300      	addi      	r3, 1
    543e:	74cc      	zextb      	r3, r3
    5440:	a260      	st.b      	r3, (r2, 0x0)
    5442:	3100      	movi      	r1, 0
    5444:	1266      	lrw      	r3, 0x2000043a	// 555c <TK_Keymap_prog+0x3b0>
    5446:	60d0      	addu      	r3, r4
    5448:	a320      	st.b      	r1, (r3, 0x0)
    544a:	1266      	lrw      	r3, 0x20000266	// 5560 <TK_Keymap_prog+0x3b4>
    544c:	60d0      	addu      	r3, r4
    544e:	a320      	st.b      	r1, (r3, 0x0)
    5450:	1265      	lrw      	r3, 0x2000034a	// 5564 <TK_Keymap_prog+0x3b8>
    5452:	60d0      	addu      	r3, r4
    5454:	a320      	st.b      	r1, (r3, 0x0)
    5456:	8260      	ld.b      	r3, (r2, 0x0)
    5458:	9821      	ld.w      	r1, (r14, 0x4)
    545a:	64c4      	cmphs      	r1, r3
    545c:	0828      	bt      	0x54ac	// 54ac <TK_Keymap_prog+0x300>
    545e:	3d40      	cmpnei      	r5, 0
    5460:	0891      	bt      	0x5582	// 5582 <TK_Keymap_prog+0x3d6>
    5462:	1222      	lrw      	r1, 0x20000334	// 5568 <TK_Keymap_prog+0x3bc>
    5464:	9160      	ld.w      	r3, (r1, 0x0)
    5466:	3b40      	cmpnei      	r3, 0
    5468:	0806      	bt      	0x5474	// 5474 <TK_Keymap_prog+0x2c8>
    546a:	9100      	ld.w      	r0, (r1, 0x0)
    546c:	3301      	movi      	r3, 1
    546e:	70d0      	lsl      	r3, r4
    5470:	6cc0      	or      	r3, r0
    5472:	b160      	st.w      	r3, (r1, 0x0)
    5474:	3300      	movi      	r3, 0
    5476:	a260      	st.b      	r3, (r2, 0x0)
    5478:	041a      	br      	0x54ac	// 54ac <TK_Keymap_prog+0x300>
    547a:	8b60      	ld.h      	r3, (r3, 0x0)
    547c:	74cf      	sexth      	r3, r3
    547e:	64d9      	cmplt      	r6, r3
    5480:	0fad      	bf      	0x53da	// 53da <TK_Keymap_prog+0x22e>
    5482:	076b      	br      	0x5358	// 5358 <TK_Keymap_prog+0x1ac>
    5484:	3d41      	cmpnei      	r5, 1
    5486:	0b88      	bt      	0x5396	// 5396 <TK_Keymap_prog+0x1ea>
    5488:	1133      	lrw      	r1, 0x20000278	// 5554 <TK_Keymap_prog+0x3a8>
    548a:	6cd7      	mov      	r3, r5
    548c:	9100      	ld.w      	r0, (r1, 0x0)
    548e:	0781      	br      	0x5390	// 5390 <TK_Keymap_prog+0x1e4>
    5490:	4461      	lsli      	r3, r4, 1
    5492:	9842      	ld.w      	r2, (r14, 0x8)
    5494:	60c8      	addu      	r3, r2
    5496:	8b60      	ld.h      	r3, (r3, 0x0)
    5498:	74cf      	sexth      	r3, r3
    549a:	64d9      	cmplt      	r6, r3
    549c:	0c08      	bf      	0x54ac	// 54ac <TK_Keymap_prog+0x300>
    549e:	3300      	movi      	r3, 0
    54a0:	1152      	lrw      	r2, 0x20000334	// 5568 <TK_Keymap_prog+0x3bc>
    54a2:	2b01      	subi      	r3, 2
    54a4:	9220      	ld.w      	r1, (r2, 0x0)
    54a6:	70d3      	rotl      	r3, r4
    54a8:	68c4      	and      	r3, r1
    54aa:	b260      	st.w      	r3, (r2, 0x0)
    54ac:	4401      	lsli      	r0, r4, 1
    54ae:	9862      	ld.w      	r3, (r14, 0x8)
    54b0:	60c0      	addu      	r3, r0
    54b2:	8b60      	ld.h      	r3, (r3, 0x0)
    54b4:	74cf      	sexth      	r3, r3
    54b6:	9844      	ld.w      	r2, (r14, 0x10)
    54b8:	648d      	cmplt      	r3, r2
    54ba:	0c59      	bf      	0x556c	// 556c <TK_Keymap_prog+0x3c0>
    54bc:	1148      	lrw      	r2, 0x2000043a	// 555c <TK_Keymap_prog+0x3b0>
    54be:	6090      	addu      	r2, r4
    54c0:	8260      	ld.b      	r3, (r2, 0x0)
    54c2:	2300      	addi      	r3, 1
    54c4:	74cc      	zextb      	r3, r3
    54c6:	a260      	st.b      	r3, (r2, 0x0)
    54c8:	3100      	movi      	r1, 0
    54ca:	1164      	lrw      	r3, 0x200003f5	// 5558 <TK_Keymap_prog+0x3ac>
    54cc:	60d0      	addu      	r3, r4
    54ce:	a320      	st.b      	r1, (r3, 0x0)
    54d0:	8260      	ld.b      	r3, (r2, 0x0)
    54d2:	9825      	ld.w      	r1, (r14, 0x14)
    54d4:	64c4      	cmphs      	r1, r3
    54d6:	084b      	bt      	0x556c	// 556c <TK_Keymap_prog+0x3c0>
    54d8:	3300      	movi      	r3, 0
    54da:	1124      	lrw      	r1, 0x20000334	// 5568 <TK_Keymap_prog+0x3bc>
    54dc:	2b01      	subi      	r3, 2
    54de:	9100      	ld.w      	r0, (r1, 0x0)
    54e0:	70d3      	rotl      	r3, r4
    54e2:	68c0      	and      	r3, r0
    54e4:	b160      	st.w      	r3, (r1, 0x0)
    54e6:	3300      	movi      	r3, 0
    54e8:	a260      	st.b      	r3, (r2, 0x0)
    54ea:	0441      	br      	0x556c	// 556c <TK_Keymap_prog+0x3c0>
    54ec:	2000018c 	.long	0x2000018c
    54f0:	20000160 	.long	0x20000160
    54f4:	20000169 	.long	0x20000169
    54f8:	20000168 	.long	0x20000168
    54fc:	200004ea 	.long	0x200004ea
    5500:	200002ee 	.long	0x200002ee
    5504:	20000244 	.long	0x20000244
    5508:	2000037c 	.long	0x2000037c
    550c:	20000310 	.long	0x20000310
    5510:	200003d2 	.long	0x200003d2
    5514:	20000462 	.long	0x20000462
    5518:	200003b0 	.long	0x200003b0
    551c:	200004c8 	.long	0x200004c8
    5520:	200004a6 	.long	0x200004a6
    5524:	200002a0 	.long	0x200002a0
    5528:	2000027c 	.long	0x2000027c
    552c:	200001ba 	.long	0x200001ba
    5530:	200002dc 	.long	0x200002dc
    5534:	200002c2 	.long	0x200002c2
    5538:	2000039e 	.long	0x2000039e
    553c:	20000418 	.long	0x20000418
    5540:	200002d4 	.long	0x200002d4
    5544:	20000429 	.long	0x20000429
    5548:	20000338 	.long	0x20000338
    554c:	2000035c 	.long	0x2000035c
    5550:	20000406 	.long	0x20000406
    5554:	20000278 	.long	0x20000278
    5558:	200003f5 	.long	0x200003f5
    555c:	2000043a 	.long	0x2000043a
    5560:	20000266 	.long	0x20000266
    5564:	2000034a 	.long	0x2000034a
    5568:	20000334 	.long	0x20000334
    556c:	2400      	addi      	r4, 1
    556e:	3c51      	cmpnei      	r4, 17
    5570:	0c02      	bf      	0x5574	// 5574 <TK_Keymap_prog+0x3c8>
    5572:	0630      	br      	0x51d2	// 51d2 <TK_Keymap_prog+0x26>
    5574:	1409      	addi      	r14, r14, 36
    5576:	1494      	pop      	r4-r7, r15
    5578:	8b60      	ld.h      	r3, (r3, 0x0)
    557a:	74cf      	sexth      	r3, r3
    557c:	64d9      	cmplt      	r6, r3
    557e:	0f97      	bf      	0x54ac	// 54ac <TK_Keymap_prog+0x300>
    5580:	075b      	br      	0x5436	// 5436 <TK_Keymap_prog+0x28a>
    5582:	3d41      	cmpnei      	r5, 1
    5584:	0b78      	bt      	0x5474	// 5474 <TK_Keymap_prog+0x2c8>
    5586:	1023      	lrw      	r1, 0x20000334	// 5590 <TK_Keymap_prog+0x3e4>
    5588:	6cd7      	mov      	r3, r5
    558a:	9100      	ld.w      	r0, (r1, 0x0)
    558c:	0771      	br      	0x546e	// 546e <TK_Keymap_prog+0x2c2>
    558e:	0000      	bkpt
    5590:	20000334 	.long	0x20000334

Disassembly of section .text.TK_overflow_predict:

00005594 <TK_overflow_predict>:
    5594:	14d4      	push      	r4-r7, r15
    5596:	1421      	subi      	r14, r14, 4
    5598:	1157      	lrw      	r2, 0x200003f4	// 5674 <TK_overflow_predict+0xe0>
    559a:	8260      	ld.b      	r3, (r2, 0x0)
    559c:	2300      	addi      	r3, 1
    559e:	74cc      	zextb      	r3, r3
    55a0:	a260      	st.b      	r3, (r2, 0x0)
    55a2:	8260      	ld.b      	r3, (r2, 0x0)
    55a4:	1135      	lrw      	r1, 0x2000018d	// 5678 <TK_overflow_predict+0xe4>
    55a6:	8120      	ld.b      	r1, (r1, 0x0)
    55a8:	64c4      	cmphs      	r1, r3
    55aa:	0855      	bt      	0x5654	// 5654 <TK_overflow_predict+0xc0>
    55ac:	3300      	movi      	r3, 0
    55ae:	a260      	st.b      	r3, (r2, 0x0)
    55b0:	3500      	movi      	r5, 0
    55b2:	11d3      	lrw      	r6, 0x20000190	// 567c <TK_overflow_predict+0xe8>
    55b4:	11f3      	lrw      	r7, 0x200000d6	// 5680 <TK_overflow_predict+0xec>
    55b6:	9660      	ld.w      	r3, (r6, 0x0)
    55b8:	70d5      	lsr      	r3, r5
    55ba:	3201      	movi      	r2, 1
    55bc:	68c8      	and      	r3, r2
    55be:	3b40      	cmpnei      	r3, 0
    55c0:	0c34      	bf      	0x5628	// 5628 <TK_overflow_predict+0x94>
    55c2:	4581      	lsli      	r4, r5, 1
    55c4:	5f70      	addu      	r3, r7, r4
    55c6:	8b00      	ld.h      	r0, (r3, 0x0)
    55c8:	e3ffe204 	bsr      	0x19d0	// 19d0 <__floatunsidf>
    55cc:	6cc7      	mov      	r3, r1
    55ce:	3180      	movi      	r1, 128
    55d0:	6c83      	mov      	r2, r0
    55d2:	4137      	lsli      	r1, r1, 23
    55d4:	3000      	movi      	r0, 0
    55d6:	e3ffd5ef 	bsr      	0x1b4	// 1b4 <__GI_pow>
    55da:	116b      	lrw      	r3, 0x20000196	// 5684 <TK_overflow_predict+0xf0>
    55dc:	60d0      	addu      	r3, r4
    55de:	8b60      	ld.h      	r3, (r3, 0x0)
    55e0:	4364      	lsli      	r3, r3, 4
    55e2:	230e      	addi      	r3, 15
    55e4:	b860      	st.w      	r3, (r14, 0x0)
    55e6:	e3ffdbbb 	bsr      	0xd5c	// d5c <__fixunsdfsi>
    55ea:	9860      	ld.w      	r3, (r14, 0x0)
    55ec:	7cc0      	mult      	r3, r0
    55ee:	1147      	lrw      	r2, 0x20000484	// 5688 <TK_overflow_predict+0xf4>
    55f0:	740d      	zexth      	r0, r3
    55f2:	6090      	addu      	r2, r4
    55f4:	1166      	lrw      	r3, 0x200004ea	// 568c <TK_overflow_predict+0xf8>
    55f6:	60d0      	addu      	r3, r4
    55f8:	aa00      	st.h      	r0, (r2, 0x0)
    55fa:	8b60      	ld.h      	r3, (r3, 0x0)
    55fc:	8a00      	ld.h      	r0, (r2, 0x0)
    55fe:	7401      	zexth      	r0, r0
    5600:	325f      	movi      	r2, 95
    5602:	74cd      	zexth      	r3, r3
    5604:	7c08      	mult      	r0, r2
    5606:	3164      	movi      	r1, 100
    5608:	b860      	st.w      	r3, (r14, 0x0)
    560a:	e3fff2a7 	bsr      	0x3b58	// 3b58 <__divsi3>
    560e:	9860      	ld.w      	r3, (r14, 0x0)
    5610:	64c1      	cmplt      	r0, r3
    5612:	0c0b      	bf      	0x5628	// 5628 <TK_overflow_predict+0x94>
    5614:	107f      	lrw      	r3, 0x2000016a	// 5690 <TK_overflow_predict+0xfc>
    5616:	610c      	addu      	r4, r3
    5618:	8c60      	ld.h      	r3, (r4, 0x0)
    561a:	3b06      	cmphsi      	r3, 7
    561c:	0806      	bt      	0x5628	// 5628 <TK_overflow_predict+0x94>
    561e:	2300      	addi      	r3, 1
    5620:	ac60      	st.h      	r3, (r4, 0x0)
    5622:	3201      	movi      	r2, 1
    5624:	107c      	lrw      	r3, 0x20000349	// 5694 <TK_overflow_predict+0x100>
    5626:	a340      	st.b      	r2, (r3, 0x0)
    5628:	2500      	addi      	r5, 1
    562a:	3d51      	cmpnei      	r5, 17
    562c:	0bc5      	bt      	0x55b6	// 55b6 <TK_overflow_predict+0x22>
    562e:	107a      	lrw      	r3, 0x20000349	// 5694 <TK_overflow_predict+0x100>
    5630:	8340      	ld.b      	r2, (r3, 0x0)
    5632:	3a41      	cmpnei      	r2, 1
    5634:	0810      	bt      	0x5654	// 5654 <TK_overflow_predict+0xc0>
    5636:	3200      	movi      	r2, 0
    5638:	a340      	st.b      	r2, (r3, 0x0)
    563a:	3200      	movi      	r2, 0
    563c:	1077      	lrw      	r3, 0x20000058	// 5698 <TK_overflow_predict+0x104>
    563e:	1018      	lrw      	r0, 0x20000417	// 569c <TK_overflow_predict+0x108>
    5640:	10b8      	lrw      	r5, 0x20000450	// 56a0 <TK_overflow_predict+0x10c>
    5642:	10d4      	lrw      	r6, 0x2000016a	// 5690 <TK_overflow_predict+0xfc>
    5644:	9360      	ld.w      	r3, (r3, 0x0)
    5646:	b342      	st.w      	r2, (r3, 0x8)
    5648:	1077      	lrw      	r3, 0x20000054	// 56a4 <TK_overflow_predict+0x110>
    564a:	9380      	ld.w      	r4, (r3, 0x0)
    564c:	3300      	movi      	r3, 0
    564e:	8040      	ld.b      	r2, (r0, 0x0)
    5650:	648c      	cmphs      	r3, r2
    5652:	0c03      	bf      	0x5658	// 5658 <TK_overflow_predict+0xc4>
    5654:	1401      	addi      	r14, r14, 4
    5656:	1494      	pop      	r4-r7, r15
    5658:	5d4c      	addu      	r2, r5, r3
    565a:	8240      	ld.b      	r2, (r2, 0x0)
    565c:	4241      	lsli      	r2, r2, 1
    565e:	4322      	lsli      	r1, r3, 2
    5660:	6098      	addu      	r2, r6
    5662:	6050      	addu      	r1, r4
    5664:	8a40      	ld.h      	r2, (r2, 0x0)
    5666:	91f2      	ld.w      	r7, (r1, 0x48)
    5668:	4254      	lsli      	r2, r2, 20
    566a:	6c9c      	or      	r2, r7
    566c:	2300      	addi      	r3, 1
    566e:	b152      	st.w      	r2, (r1, 0x48)
    5670:	74cc      	zextb      	r3, r3
    5672:	07ee      	br      	0x564e	// 564e <TK_overflow_predict+0xba>
    5674:	200003f4 	.long	0x200003f4
    5678:	2000018d 	.long	0x2000018d
    567c:	20000190 	.long	0x20000190
    5680:	200000d6 	.long	0x200000d6
    5684:	20000196 	.long	0x20000196
    5688:	20000484 	.long	0x20000484
    568c:	200004ea 	.long	0x200004ea
    5690:	2000016a 	.long	0x2000016a
    5694:	20000349 	.long	0x20000349
    5698:	20000058 	.long	0x20000058
    569c:	20000417 	.long	0x20000417
    56a0:	20000450 	.long	0x20000450
    56a4:	20000054 	.long	0x20000054

Disassembly of section .text.TK_Baseline_tracking:

000056a8 <TK_Baseline_tracking>:
    56a8:	14c4      	push      	r4-r7
    56aa:	1422      	subi      	r14, r14, 8
    56ac:	0149      	lrw      	r2, 0x20000376	// 5a04 <TK_Baseline_tracking+0x35c>
    56ae:	8260      	ld.b      	r3, (r2, 0x0)
    56b0:	2300      	addi      	r3, 1
    56b2:	74cc      	zextb      	r3, r3
    56b4:	a260      	st.b      	r3, (r2, 0x0)
    56b6:	8260      	ld.b      	r3, (r2, 0x0)
    56b8:	012b      	lrw      	r1, 0x2000018d	// 5a08 <TK_Baseline_tracking+0x360>
    56ba:	8120      	ld.b      	r1, (r1, 0x0)
    56bc:	644c      	cmphs      	r3, r1
    56be:	0c0f      	bf      	0x56dc	// 56dc <TK_Baseline_tracking+0x34>
    56c0:	3300      	movi      	r3, 0
    56c2:	a260      	st.b      	r3, (r2, 0x0)
    56c4:	016d      	lrw      	r3, 0x200002d4	// 5a0c <TK_Baseline_tracking+0x364>
    56c6:	9360      	ld.w      	r3, (r3, 0x0)
    56c8:	3b40      	cmpnei      	r3, 0
    56ca:	0c0b      	bf      	0x56e0	// 56e0 <TK_Baseline_tracking+0x38>
    56cc:	016e      	lrw      	r3, 0x20000278	// 5a10 <TK_Baseline_tracking+0x368>
    56ce:	9360      	ld.w      	r3, (r3, 0x0)
    56d0:	3b40      	cmpnei      	r3, 0
    56d2:	0cc3      	bf      	0x5858	// 5858 <TK_Baseline_tracking+0x1b0>
    56d4:	016f      	lrw      	r3, 0x20000334	// 5a14 <TK_Baseline_tracking+0x36c>
    56d6:	9360      	ld.w      	r3, (r3, 0x0)
    56d8:	3b40      	cmpnei      	r3, 0
    56da:	0d7b      	bf      	0x59d0	// 59d0 <TK_Baseline_tracking+0x328>
    56dc:	1402      	addi      	r14, r14, 8
    56de:	1484      	pop      	r4-r7
    56e0:	0131      	lrw      	r1, 0x200002ee	// 5a18 <TK_Baseline_tracking+0x370>
    56e2:	6dc7      	mov      	r7, r1
    56e4:	b820      	st.w      	r1, (r14, 0x0)
    56e6:	3200      	movi      	r2, 0
    56e8:	0172      	lrw      	r3, 0x200001ba	// 5a1c <TK_Baseline_tracking+0x374>
    56ea:	0131      	lrw      	r1, 0x20000244	// 5a20 <TK_Baseline_tracking+0x378>
    56ec:	4201      	lsli      	r0, r2, 1
    56ee:	9880      	ld.w      	r4, (r14, 0x0)
    56f0:	6100      	addu      	r4, r0
    56f2:	8c80      	ld.h      	r4, (r4, 0x0)
    56f4:	7513      	sexth      	r4, r4
    56f6:	3cdf      	btsti      	r4, 31
    56f8:	0c26      	bf      	0x5744	// 5744 <TK_Baseline_tracking+0x9c>
    56fa:	01b4      	lrw      	r5, 0x200004ea	// 5a24 <TK_Baseline_tracking+0x37c>
    56fc:	5980      	addu      	r4, r1, r0
    56fe:	6014      	addu      	r0, r5
    5700:	b881      	st.w      	r4, (r14, 0x4)
    5702:	8c80      	ld.h      	r4, (r4, 0x0)
    5704:	88c0      	ld.h      	r6, (r0, 0x0)
    5706:	7511      	zexth      	r4, r4
    5708:	7599      	zexth      	r6, r6
    570a:	8ba0      	ld.h      	r5, (r3, 0x0)
    570c:	611a      	subu      	r4, r6
    570e:	6551      	cmplt      	r4, r5
    5710:	081a      	bt      	0x5744	// 5744 <TK_Baseline_tracking+0x9c>
    5712:	9881      	ld.w      	r4, (r14, 0x4)
    5714:	8c80      	ld.h      	r4, (r4, 0x0)
    5716:	8800      	ld.h      	r0, (r0, 0x0)
    5718:	7511      	zexth      	r4, r4
    571a:	7401      	zexth      	r0, r0
    571c:	5c01      	subu      	r0, r4, r0
    571e:	4581      	lsli      	r4, r5, 1
    5720:	6150      	addu      	r5, r4
    5722:	6541      	cmplt      	r0, r5
    5724:	0c10      	bf      	0x5744	// 5744 <TK_Baseline_tracking+0x9c>
    5726:	019e      	lrw      	r4, 0x20000418	// 5a28 <TK_Baseline_tracking+0x380>
    5728:	6108      	addu      	r4, r2
    572a:	8400      	ld.b      	r0, (r4, 0x0)
    572c:	2000      	addi      	r0, 1
    572e:	7400      	zextb      	r0, r0
    5730:	a400      	st.b      	r0, (r4, 0x0)
    5732:	8400      	ld.b      	r0, (r4, 0x0)
    5734:	7400      	zextb      	r0, r0
    5736:	3803      	cmphsi      	r0, 4
    5738:	0c06      	bf      	0x5744	// 5744 <TK_Baseline_tracking+0x9c>
    573a:	0202      	lrw      	r0, 0x2000035b	// 5a2c <TK_Baseline_tracking+0x384>
    573c:	3501      	movi      	r5, 1
    573e:	a0a0      	st.b      	r5, (r0, 0x0)
    5740:	3000      	movi      	r0, 0
    5742:	a400      	st.b      	r0, (r4, 0x0)
    5744:	4201      	lsli      	r0, r2, 1
    5746:	5f80      	addu      	r4, r7, r0
    5748:	8c80      	ld.h      	r4, (r4, 0x0)
    574a:	7513      	sexth      	r4, r4
    574c:	3c20      	cmplti      	r4, 1
    574e:	086e      	bt      	0x582a	// 582a <TK_Baseline_tracking+0x182>
    5750:	028a      	lrw      	r4, 0x200004ea	// 5a24 <TK_Baseline_tracking+0x37c>
    5752:	6100      	addu      	r4, r0
    5754:	59a0      	addu      	r5, r1, r0
    5756:	8c80      	ld.h      	r4, (r4, 0x0)
    5758:	8da0      	ld.h      	r5, (r5, 0x0)
    575a:	7555      	zexth      	r5, r5
    575c:	7511      	zexth      	r4, r4
    575e:	6116      	subu      	r4, r5
    5760:	8ba0      	ld.h      	r5, (r3, 0x0)
    5762:	45a2      	lsli      	r5, r5, 2
    5764:	6551      	cmplt      	r4, r5
    5766:	0862      	bt      	0x582a	// 582a <TK_Baseline_tracking+0x182>
    5768:	02ad      	lrw      	r5, 0x2000039e	// 5a30 <TK_Baseline_tracking+0x388>
    576a:	6148      	addu      	r5, r2
    576c:	8580      	ld.b      	r4, (r5, 0x0)
    576e:	2400      	addi      	r4, 1
    5770:	7510      	zextb      	r4, r4
    5772:	a580      	st.b      	r4, (r5, 0x0)
    5774:	8580      	ld.b      	r4, (r5, 0x0)
    5776:	7510      	zextb      	r4, r4
    5778:	3c03      	cmphsi      	r4, 4
    577a:	0c06      	bf      	0x5786	// 5786 <TK_Baseline_tracking+0xde>
    577c:	0293      	lrw      	r4, 0x2000035b	// 5a2c <TK_Baseline_tracking+0x384>
    577e:	3601      	movi      	r6, 1
    5780:	a4c0      	st.b      	r6, (r4, 0x0)
    5782:	3400      	movi      	r4, 0
    5784:	a580      	st.b      	r4, (r5, 0x0)
    5786:	5f80      	addu      	r4, r7, r0
    5788:	8c80      	ld.h      	r4, (r4, 0x0)
    578a:	7513      	sexth      	r4, r4
    578c:	3cdf      	btsti      	r4, 31
    578e:	0c10      	bf      	0x57ae	// 57ae <TK_Baseline_tracking+0x106>
    5790:	02da      	lrw      	r6, 0x200004ea	// 5a24 <TK_Baseline_tracking+0x37c>
    5792:	59a0      	addu      	r5, r1, r0
    5794:	6180      	addu      	r6, r0
    5796:	8d80      	ld.h      	r4, (r5, 0x0)
    5798:	8ec0      	ld.h      	r6, (r6, 0x0)
    579a:	7599      	zexth      	r6, r6
    579c:	7511      	zexth      	r4, r4
    579e:	611a      	subu      	r4, r6
    57a0:	8bc0      	ld.h      	r6, (r3, 0x0)
    57a2:	6591      	cmplt      	r4, r6
    57a4:	0c05      	bf      	0x57ae	// 57ae <TK_Baseline_tracking+0x106>
    57a6:	8d80      	ld.h      	r4, (r5, 0x0)
    57a8:	2c00      	subi      	r4, 1
    57aa:	7511      	zexth      	r4, r4
    57ac:	ad80      	st.h      	r4, (r5, 0x0)
    57ae:	5f80      	addu      	r4, r7, r0
    57b0:	8c80      	ld.h      	r4, (r4, 0x0)
    57b2:	7513      	sexth      	r4, r4
    57b4:	3cdf      	btsti      	r4, 31
    57b6:	0c11      	bf      	0x57d8	// 57d8 <TK_Baseline_tracking+0x130>
    57b8:	03c4      	lrw      	r6, 0x200004ea	// 5a24 <TK_Baseline_tracking+0x37c>
    57ba:	59a0      	addu      	r5, r1, r0
    57bc:	6180      	addu      	r6, r0
    57be:	8d80      	ld.h      	r4, (r5, 0x0)
    57c0:	8ec0      	ld.h      	r6, (r6, 0x0)
    57c2:	7599      	zexth      	r6, r6
    57c4:	7511      	zexth      	r4, r4
    57c6:	611a      	subu      	r4, r6
    57c8:	8bc0      	ld.h      	r6, (r3, 0x0)
    57ca:	4ec1      	lsri      	r6, r6, 1
    57cc:	6591      	cmplt      	r4, r6
    57ce:	0805      	bt      	0x57d8	// 57d8 <TK_Baseline_tracking+0x130>
    57d0:	8d80      	ld.h      	r4, (r5, 0x0)
    57d2:	2c01      	subi      	r4, 2
    57d4:	7511      	zexth      	r4, r4
    57d6:	ad80      	st.h      	r4, (r5, 0x0)
    57d8:	5fa0      	addu      	r5, r7, r0
    57da:	8d80      	ld.h      	r4, (r5, 0x0)
    57dc:	7513      	sexth      	r4, r4
    57de:	3c20      	cmplti      	r4, 1
    57e0:	080c      	bt      	0x57f8	// 57f8 <TK_Baseline_tracking+0x150>
    57e2:	8da0      	ld.h      	r5, (r5, 0x0)
    57e4:	8b80      	ld.h      	r4, (r3, 0x0)
    57e6:	7557      	sexth      	r5, r5
    57e8:	4c81      	lsri      	r4, r4, 1
    57ea:	6515      	cmplt      	r5, r4
    57ec:	0c06      	bf      	0x57f8	// 57f8 <TK_Baseline_tracking+0x150>
    57ee:	59a0      	addu      	r5, r1, r0
    57f0:	8d80      	ld.h      	r4, (r5, 0x0)
    57f2:	2400      	addi      	r4, 1
    57f4:	7511      	zexth      	r4, r4
    57f6:	ad80      	st.h      	r4, (r5, 0x0)
    57f8:	5fa0      	addu      	r5, r7, r0
    57fa:	8d80      	ld.h      	r4, (r5, 0x0)
    57fc:	7513      	sexth      	r4, r4
    57fe:	3c20      	cmplti      	r4, 1
    5800:	0810      	bt      	0x5820	// 5820 <TK_Baseline_tracking+0x178>
    5802:	8dc0      	ld.h      	r6, (r5, 0x0)
    5804:	759b      	sexth      	r6, r6
    5806:	8b80      	ld.h      	r4, (r3, 0x0)
    5808:	6519      	cmplt      	r6, r4
    580a:	0c0b      	bf      	0x5820	// 5820 <TK_Baseline_tracking+0x178>
    580c:	8da0      	ld.h      	r5, (r5, 0x0)
    580e:	7557      	sexth      	r5, r5
    5810:	4c81      	lsri      	r4, r4, 1
    5812:	6515      	cmplt      	r5, r4
    5814:	0806      	bt      	0x5820	// 5820 <TK_Baseline_tracking+0x178>
    5816:	6004      	addu      	r0, r1
    5818:	8880      	ld.h      	r4, (r0, 0x0)
    581a:	2401      	addi      	r4, 2
    581c:	7511      	zexth      	r4, r4
    581e:	a880      	st.h      	r4, (r0, 0x0)
    5820:	2200      	addi      	r2, 1
    5822:	3a51      	cmpnei      	r2, 17
    5824:	2301      	addi      	r3, 2
    5826:	0b63      	bt      	0x56ec	// 56ec <TK_Baseline_tracking+0x44>
    5828:	0752      	br      	0x56cc	// 56cc <TK_Baseline_tracking+0x24>
    582a:	5f80      	addu      	r4, r7, r0
    582c:	8c80      	ld.h      	r4, (r4, 0x0)
    582e:	7513      	sexth      	r4, r4
    5830:	3cdf      	btsti      	r4, 31
    5832:	0faa      	bf      	0x5786	// 5786 <TK_Baseline_tracking+0xde>
    5834:	13bc      	lrw      	r5, 0x200004ea	// 5a24 <TK_Baseline_tracking+0x37c>
    5836:	5980      	addu      	r4, r1, r0
    5838:	6140      	addu      	r5, r0
    583a:	8c80      	ld.h      	r4, (r4, 0x0)
    583c:	8da0      	ld.h      	r5, (r5, 0x0)
    583e:	7555      	zexth      	r5, r5
    5840:	8bc0      	ld.h      	r6, (r3, 0x0)
    5842:	7511      	zexth      	r4, r4
    5844:	6116      	subu      	r4, r5
    5846:	46a1      	lsli      	r5, r6, 1
    5848:	6158      	addu      	r5, r6
    584a:	6551      	cmplt      	r4, r5
    584c:	0b9d      	bt      	0x5786	// 5786 <TK_Baseline_tracking+0xde>
    584e:	1398      	lrw      	r4, 0x2000035b	// 5a2c <TK_Baseline_tracking+0x384>
    5850:	3501      	movi      	r5, 1
    5852:	a4a0      	st.b      	r5, (r4, 0x0)
    5854:	6c03      	mov      	r0, r0
    5856:	0798      	br      	0x5786	// 5786 <TK_Baseline_tracking+0xde>
    5858:	1337      	lrw      	r1, 0x200003d2	// 5a34 <TK_Baseline_tracking+0x38c>
    585a:	6dc7      	mov      	r7, r1
    585c:	b820      	st.w      	r1, (r14, 0x0)
    585e:	3200      	movi      	r2, 0
    5860:	136f      	lrw      	r3, 0x200001ba	// 5a1c <TK_Baseline_tracking+0x374>
    5862:	1336      	lrw      	r1, 0x2000037c	// 5a38 <TK_Baseline_tracking+0x390>
    5864:	4201      	lsli      	r0, r2, 1
    5866:	9880      	ld.w      	r4, (r14, 0x0)
    5868:	6100      	addu      	r4, r0
    586a:	8c80      	ld.h      	r4, (r4, 0x0)
    586c:	7513      	sexth      	r4, r4
    586e:	3cdf      	btsti      	r4, 31
    5870:	0c26      	bf      	0x58bc	// 58bc <TK_Baseline_tracking+0x214>
    5872:	13b3      	lrw      	r5, 0x20000310	// 5a3c <TK_Baseline_tracking+0x394>
    5874:	5980      	addu      	r4, r1, r0
    5876:	6014      	addu      	r0, r5
    5878:	b881      	st.w      	r4, (r14, 0x4)
    587a:	8c80      	ld.h      	r4, (r4, 0x0)
    587c:	88c0      	ld.h      	r6, (r0, 0x0)
    587e:	7511      	zexth      	r4, r4
    5880:	7599      	zexth      	r6, r6
    5882:	8ba0      	ld.h      	r5, (r3, 0x0)
    5884:	611a      	subu      	r4, r6
    5886:	6551      	cmplt      	r4, r5
    5888:	081a      	bt      	0x58bc	// 58bc <TK_Baseline_tracking+0x214>
    588a:	9881      	ld.w      	r4, (r14, 0x4)
    588c:	8c80      	ld.h      	r4, (r4, 0x0)
    588e:	8800      	ld.h      	r0, (r0, 0x0)
    5890:	7511      	zexth      	r4, r4
    5892:	7401      	zexth      	r0, r0
    5894:	5c01      	subu      	r0, r4, r0
    5896:	4581      	lsli      	r4, r5, 1
    5898:	6150      	addu      	r5, r4
    589a:	6541      	cmplt      	r0, r5
    589c:	0c10      	bf      	0x58bc	// 58bc <TK_Baseline_tracking+0x214>
    589e:	1389      	lrw      	r4, 0x20000406	// 5a40 <TK_Baseline_tracking+0x398>
    58a0:	6108      	addu      	r4, r2
    58a2:	8400      	ld.b      	r0, (r4, 0x0)
    58a4:	2000      	addi      	r0, 1
    58a6:	7400      	zextb      	r0, r0
    58a8:	a400      	st.b      	r0, (r4, 0x0)
    58aa:	8400      	ld.b      	r0, (r4, 0x0)
    58ac:	7400      	zextb      	r0, r0
    58ae:	3803      	cmphsi      	r0, 4
    58b0:	0c06      	bf      	0x58bc	// 58bc <TK_Baseline_tracking+0x214>
    58b2:	121f      	lrw      	r0, 0x2000035b	// 5a2c <TK_Baseline_tracking+0x384>
    58b4:	3501      	movi      	r5, 1
    58b6:	a0a0      	st.b      	r5, (r0, 0x0)
    58b8:	3000      	movi      	r0, 0
    58ba:	a400      	st.b      	r0, (r4, 0x0)
    58bc:	4201      	lsli      	r0, r2, 1
    58be:	5f80      	addu      	r4, r7, r0
    58c0:	8c80      	ld.h      	r4, (r4, 0x0)
    58c2:	7513      	sexth      	r4, r4
    58c4:	3c20      	cmplti      	r4, 1
    58c6:	086e      	bt      	0x59a2	// 59a2 <TK_Baseline_tracking+0x2fa>
    58c8:	129d      	lrw      	r4, 0x20000310	// 5a3c <TK_Baseline_tracking+0x394>
    58ca:	6100      	addu      	r4, r0
    58cc:	59a0      	addu      	r5, r1, r0
    58ce:	8c80      	ld.h      	r4, (r4, 0x0)
    58d0:	8da0      	ld.h      	r5, (r5, 0x0)
    58d2:	7555      	zexth      	r5, r5
    58d4:	7511      	zexth      	r4, r4
    58d6:	6116      	subu      	r4, r5
    58d8:	8ba0      	ld.h      	r5, (r3, 0x0)
    58da:	45a2      	lsli      	r5, r5, 2
    58dc:	6551      	cmplt      	r4, r5
    58de:	0862      	bt      	0x59a2	// 59a2 <TK_Baseline_tracking+0x2fa>
    58e0:	12b9      	lrw      	r5, 0x2000035c	// 5a44 <TK_Baseline_tracking+0x39c>
    58e2:	6148      	addu      	r5, r2
    58e4:	8580      	ld.b      	r4, (r5, 0x0)
    58e6:	2400      	addi      	r4, 1
    58e8:	7510      	zextb      	r4, r4
    58ea:	a580      	st.b      	r4, (r5, 0x0)
    58ec:	8580      	ld.b      	r4, (r5, 0x0)
    58ee:	7510      	zextb      	r4, r4
    58f0:	3c03      	cmphsi      	r4, 4
    58f2:	0c06      	bf      	0x58fe	// 58fe <TK_Baseline_tracking+0x256>
    58f4:	128e      	lrw      	r4, 0x2000035b	// 5a2c <TK_Baseline_tracking+0x384>
    58f6:	3601      	movi      	r6, 1
    58f8:	a4c0      	st.b      	r6, (r4, 0x0)
    58fa:	3400      	movi      	r4, 0
    58fc:	a580      	st.b      	r4, (r5, 0x0)
    58fe:	5f80      	addu      	r4, r7, r0
    5900:	8c80      	ld.h      	r4, (r4, 0x0)
    5902:	7513      	sexth      	r4, r4
    5904:	3cdf      	btsti      	r4, 31
    5906:	0c10      	bf      	0x5926	// 5926 <TK_Baseline_tracking+0x27e>
    5908:	12cd      	lrw      	r6, 0x20000310	// 5a3c <TK_Baseline_tracking+0x394>
    590a:	59a0      	addu      	r5, r1, r0
    590c:	6180      	addu      	r6, r0
    590e:	8d80      	ld.h      	r4, (r5, 0x0)
    5910:	8ec0      	ld.h      	r6, (r6, 0x0)
    5912:	7599      	zexth      	r6, r6
    5914:	7511      	zexth      	r4, r4
    5916:	611a      	subu      	r4, r6
    5918:	8bc0      	ld.h      	r6, (r3, 0x0)
    591a:	6591      	cmplt      	r4, r6
    591c:	0c05      	bf      	0x5926	// 5926 <TK_Baseline_tracking+0x27e>
    591e:	8d80      	ld.h      	r4, (r5, 0x0)
    5920:	2c00      	subi      	r4, 1
    5922:	7511      	zexth      	r4, r4
    5924:	ad80      	st.h      	r4, (r5, 0x0)
    5926:	5f80      	addu      	r4, r7, r0
    5928:	8c80      	ld.h      	r4, (r4, 0x0)
    592a:	7513      	sexth      	r4, r4
    592c:	3cdf      	btsti      	r4, 31
    592e:	0c11      	bf      	0x5950	// 5950 <TK_Baseline_tracking+0x2a8>
    5930:	12c3      	lrw      	r6, 0x20000310	// 5a3c <TK_Baseline_tracking+0x394>
    5932:	59a0      	addu      	r5, r1, r0
    5934:	6180      	addu      	r6, r0
    5936:	8d80      	ld.h      	r4, (r5, 0x0)
    5938:	8ec0      	ld.h      	r6, (r6, 0x0)
    593a:	7599      	zexth      	r6, r6
    593c:	7511      	zexth      	r4, r4
    593e:	611a      	subu      	r4, r6
    5940:	8bc0      	ld.h      	r6, (r3, 0x0)
    5942:	4ec1      	lsri      	r6, r6, 1
    5944:	6591      	cmplt      	r4, r6
    5946:	0805      	bt      	0x5950	// 5950 <TK_Baseline_tracking+0x2a8>
    5948:	8d80      	ld.h      	r4, (r5, 0x0)
    594a:	2c01      	subi      	r4, 2
    594c:	7511      	zexth      	r4, r4
    594e:	ad80      	st.h      	r4, (r5, 0x0)
    5950:	5fa0      	addu      	r5, r7, r0
    5952:	8d80      	ld.h      	r4, (r5, 0x0)
    5954:	7513      	sexth      	r4, r4
    5956:	3c20      	cmplti      	r4, 1
    5958:	080c      	bt      	0x5970	// 5970 <TK_Baseline_tracking+0x2c8>
    595a:	8da0      	ld.h      	r5, (r5, 0x0)
    595c:	8b80      	ld.h      	r4, (r3, 0x0)
    595e:	7557      	sexth      	r5, r5
    5960:	4c81      	lsri      	r4, r4, 1
    5962:	6515      	cmplt      	r5, r4
    5964:	0c06      	bf      	0x5970	// 5970 <TK_Baseline_tracking+0x2c8>
    5966:	59a0      	addu      	r5, r1, r0
    5968:	8d80      	ld.h      	r4, (r5, 0x0)
    596a:	2400      	addi      	r4, 1
    596c:	7511      	zexth      	r4, r4
    596e:	ad80      	st.h      	r4, (r5, 0x0)
    5970:	5fa0      	addu      	r5, r7, r0
    5972:	8d80      	ld.h      	r4, (r5, 0x0)
    5974:	7513      	sexth      	r4, r4
    5976:	3c20      	cmplti      	r4, 1
    5978:	0810      	bt      	0x5998	// 5998 <TK_Baseline_tracking+0x2f0>
    597a:	8dc0      	ld.h      	r6, (r5, 0x0)
    597c:	759b      	sexth      	r6, r6
    597e:	8b80      	ld.h      	r4, (r3, 0x0)
    5980:	6519      	cmplt      	r6, r4
    5982:	0c0b      	bf      	0x5998	// 5998 <TK_Baseline_tracking+0x2f0>
    5984:	8da0      	ld.h      	r5, (r5, 0x0)
    5986:	7557      	sexth      	r5, r5
    5988:	4c81      	lsri      	r4, r4, 1
    598a:	6515      	cmplt      	r5, r4
    598c:	0806      	bt      	0x5998	// 5998 <TK_Baseline_tracking+0x2f0>
    598e:	6004      	addu      	r0, r1
    5990:	8880      	ld.h      	r4, (r0, 0x0)
    5992:	2401      	addi      	r4, 2
    5994:	7511      	zexth      	r4, r4
    5996:	a880      	st.h      	r4, (r0, 0x0)
    5998:	2200      	addi      	r2, 1
    599a:	3a51      	cmpnei      	r2, 17
    599c:	2301      	addi      	r3, 2
    599e:	0b63      	bt      	0x5864	// 5864 <TK_Baseline_tracking+0x1bc>
    59a0:	069a      	br      	0x56d4	// 56d4 <TK_Baseline_tracking+0x2c>
    59a2:	5f80      	addu      	r4, r7, r0
    59a4:	8c80      	ld.h      	r4, (r4, 0x0)
    59a6:	7513      	sexth      	r4, r4
    59a8:	3cdf      	btsti      	r4, 31
    59aa:	0faa      	bf      	0x58fe	// 58fe <TK_Baseline_tracking+0x256>
    59ac:	11a4      	lrw      	r5, 0x20000310	// 5a3c <TK_Baseline_tracking+0x394>
    59ae:	5980      	addu      	r4, r1, r0
    59b0:	6140      	addu      	r5, r0
    59b2:	8c80      	ld.h      	r4, (r4, 0x0)
    59b4:	8da0      	ld.h      	r5, (r5, 0x0)
    59b6:	7555      	zexth      	r5, r5
    59b8:	8bc0      	ld.h      	r6, (r3, 0x0)
    59ba:	7511      	zexth      	r4, r4
    59bc:	6116      	subu      	r4, r5
    59be:	46a1      	lsli      	r5, r6, 1
    59c0:	6158      	addu      	r5, r6
    59c2:	6551      	cmplt      	r4, r5
    59c4:	0b9d      	bt      	0x58fe	// 58fe <TK_Baseline_tracking+0x256>
    59c6:	109a      	lrw      	r4, 0x2000035b	// 5a2c <TK_Baseline_tracking+0x384>
    59c8:	3501      	movi      	r5, 1
    59ca:	a4a0      	st.b      	r5, (r4, 0x0)
    59cc:	6c03      	mov      	r0, r0
    59ce:	0798      	br      	0x58fe	// 58fe <TK_Baseline_tracking+0x256>
    59d0:	103e      	lrw      	r1, 0x200004c8	// 5a48 <TK_Baseline_tracking+0x3a0>
    59d2:	6dc7      	mov      	r7, r1
    59d4:	b820      	st.w      	r1, (r14, 0x0)
    59d6:	3200      	movi      	r2, 0
    59d8:	1071      	lrw      	r3, 0x200001ba	// 5a1c <TK_Baseline_tracking+0x374>
    59da:	103d      	lrw      	r1, 0x20000462	// 5a4c <TK_Baseline_tracking+0x3a4>
    59dc:	4201      	lsli      	r0, r2, 1
    59de:	9880      	ld.w      	r4, (r14, 0x0)
    59e0:	6100      	addu      	r4, r0
    59e2:	8c80      	ld.h      	r4, (r4, 0x0)
    59e4:	7513      	sexth      	r4, r4
    59e6:	3cdf      	btsti      	r4, 31
    59e8:	0c4f      	bf      	0x5a86	// 5a86 <TK_Baseline_tracking+0x3de>
    59ea:	10ba      	lrw      	r5, 0x200003b0	// 5a50 <TK_Baseline_tracking+0x3a8>
    59ec:	5980      	addu      	r4, r1, r0
    59ee:	6014      	addu      	r0, r5
    59f0:	b881      	st.w      	r4, (r14, 0x4)
    59f2:	8c80      	ld.h      	r4, (r4, 0x0)
    59f4:	88c0      	ld.h      	r6, (r0, 0x0)
    59f6:	7511      	zexth      	r4, r4
    59f8:	7599      	zexth      	r6, r6
    59fa:	8ba0      	ld.h      	r5, (r3, 0x0)
    59fc:	611a      	subu      	r4, r6
    59fe:	6551      	cmplt      	r4, r5
    5a00:	0843      	bt      	0x5a86	// 5a86 <TK_Baseline_tracking+0x3de>
    5a02:	0429      	br      	0x5a54	// 5a54 <TK_Baseline_tracking+0x3ac>
    5a04:	20000376 	.long	0x20000376
    5a08:	2000018d 	.long	0x2000018d
    5a0c:	200002d4 	.long	0x200002d4
    5a10:	20000278 	.long	0x20000278
    5a14:	20000334 	.long	0x20000334
    5a18:	200002ee 	.long	0x200002ee
    5a1c:	200001ba 	.long	0x200001ba
    5a20:	20000244 	.long	0x20000244
    5a24:	200004ea 	.long	0x200004ea
    5a28:	20000418 	.long	0x20000418
    5a2c:	2000035b 	.long	0x2000035b
    5a30:	2000039e 	.long	0x2000039e
    5a34:	200003d2 	.long	0x200003d2
    5a38:	2000037c 	.long	0x2000037c
    5a3c:	20000310 	.long	0x20000310
    5a40:	20000406 	.long	0x20000406
    5a44:	2000035c 	.long	0x2000035c
    5a48:	200004c8 	.long	0x200004c8
    5a4c:	20000462 	.long	0x20000462
    5a50:	200003b0 	.long	0x200003b0
    5a54:	9881      	ld.w      	r4, (r14, 0x4)
    5a56:	8c80      	ld.h      	r4, (r4, 0x0)
    5a58:	8800      	ld.h      	r0, (r0, 0x0)
    5a5a:	7511      	zexth      	r4, r4
    5a5c:	7401      	zexth      	r0, r0
    5a5e:	5c01      	subu      	r0, r4, r0
    5a60:	4581      	lsli      	r4, r5, 1
    5a62:	6150      	addu      	r5, r4
    5a64:	6541      	cmplt      	r0, r5
    5a66:	0c10      	bf      	0x5a86	// 5a86 <TK_Baseline_tracking+0x3de>
    5a68:	128d      	lrw      	r4, 0x2000034a	// 5b9c <TK_Baseline_tracking+0x4f4>
    5a6a:	6108      	addu      	r4, r2
    5a6c:	8400      	ld.b      	r0, (r4, 0x0)
    5a6e:	2000      	addi      	r0, 1
    5a70:	7400      	zextb      	r0, r0
    5a72:	a400      	st.b      	r0, (r4, 0x0)
    5a74:	8400      	ld.b      	r0, (r4, 0x0)
    5a76:	7400      	zextb      	r0, r0
    5a78:	3803      	cmphsi      	r0, 4
    5a7a:	0c06      	bf      	0x5a86	// 5a86 <TK_Baseline_tracking+0x3de>
    5a7c:	1209      	lrw      	r0, 0x2000035b	// 5ba0 <TK_Baseline_tracking+0x4f8>
    5a7e:	3501      	movi      	r5, 1
    5a80:	a0a0      	st.b      	r5, (r0, 0x0)
    5a82:	3000      	movi      	r0, 0
    5a84:	a400      	st.b      	r0, (r4, 0x0)
    5a86:	4201      	lsli      	r0, r2, 1
    5a88:	5f80      	addu      	r4, r7, r0
    5a8a:	8c80      	ld.h      	r4, (r4, 0x0)
    5a8c:	7513      	sexth      	r4, r4
    5a8e:	3c20      	cmplti      	r4, 1
    5a90:	086f      	bt      	0x5b6e	// 5b6e <TK_Baseline_tracking+0x4c6>
    5a92:	1285      	lrw      	r4, 0x200003b0	// 5ba4 <TK_Baseline_tracking+0x4fc>
    5a94:	6100      	addu      	r4, r0
    5a96:	59a0      	addu      	r5, r1, r0
    5a98:	8c80      	ld.h      	r4, (r4, 0x0)
    5a9a:	8da0      	ld.h      	r5, (r5, 0x0)
    5a9c:	7555      	zexth      	r5, r5
    5a9e:	7511      	zexth      	r4, r4
    5aa0:	6116      	subu      	r4, r5
    5aa2:	8ba0      	ld.h      	r5, (r3, 0x0)
    5aa4:	45a2      	lsli      	r5, r5, 2
    5aa6:	6551      	cmplt      	r4, r5
    5aa8:	0863      	bt      	0x5b6e	// 5b6e <TK_Baseline_tracking+0x4c6>
    5aaa:	12a0      	lrw      	r5, 0x20000266	// 5ba8 <TK_Baseline_tracking+0x500>
    5aac:	6148      	addu      	r5, r2
    5aae:	8580      	ld.b      	r4, (r5, 0x0)
    5ab0:	2400      	addi      	r4, 1
    5ab2:	7510      	zextb      	r4, r4
    5ab4:	a580      	st.b      	r4, (r5, 0x0)
    5ab6:	8580      	ld.b      	r4, (r5, 0x0)
    5ab8:	7510      	zextb      	r4, r4
    5aba:	3c03      	cmphsi      	r4, 4
    5abc:	0c06      	bf      	0x5ac8	// 5ac8 <TK_Baseline_tracking+0x420>
    5abe:	1199      	lrw      	r4, 0x2000035b	// 5ba0 <TK_Baseline_tracking+0x4f8>
    5ac0:	3601      	movi      	r6, 1
    5ac2:	a4c0      	st.b      	r6, (r4, 0x0)
    5ac4:	3400      	movi      	r4, 0
    5ac6:	a580      	st.b      	r4, (r5, 0x0)
    5ac8:	5f80      	addu      	r4, r7, r0
    5aca:	8c80      	ld.h      	r4, (r4, 0x0)
    5acc:	7513      	sexth      	r4, r4
    5ace:	3cdf      	btsti      	r4, 31
    5ad0:	0c10      	bf      	0x5af0	// 5af0 <TK_Baseline_tracking+0x448>
    5ad2:	11d5      	lrw      	r6, 0x200003b0	// 5ba4 <TK_Baseline_tracking+0x4fc>
    5ad4:	59a0      	addu      	r5, r1, r0
    5ad6:	6180      	addu      	r6, r0
    5ad8:	8d80      	ld.h      	r4, (r5, 0x0)
    5ada:	8ec0      	ld.h      	r6, (r6, 0x0)
    5adc:	7599      	zexth      	r6, r6
    5ade:	7511      	zexth      	r4, r4
    5ae0:	611a      	subu      	r4, r6
    5ae2:	8bc0      	ld.h      	r6, (r3, 0x0)
    5ae4:	6591      	cmplt      	r4, r6
    5ae6:	0c05      	bf      	0x5af0	// 5af0 <TK_Baseline_tracking+0x448>
    5ae8:	8d80      	ld.h      	r4, (r5, 0x0)
    5aea:	2c00      	subi      	r4, 1
    5aec:	7511      	zexth      	r4, r4
    5aee:	ad80      	st.h      	r4, (r5, 0x0)
    5af0:	5f80      	addu      	r4, r7, r0
    5af2:	8c80      	ld.h      	r4, (r4, 0x0)
    5af4:	7513      	sexth      	r4, r4
    5af6:	3cdf      	btsti      	r4, 31
    5af8:	0c11      	bf      	0x5b1a	// 5b1a <TK_Baseline_tracking+0x472>
    5afa:	11cb      	lrw      	r6, 0x200003b0	// 5ba4 <TK_Baseline_tracking+0x4fc>
    5afc:	59a0      	addu      	r5, r1, r0
    5afe:	6180      	addu      	r6, r0
    5b00:	8d80      	ld.h      	r4, (r5, 0x0)
    5b02:	8ec0      	ld.h      	r6, (r6, 0x0)
    5b04:	7599      	zexth      	r6, r6
    5b06:	7511      	zexth      	r4, r4
    5b08:	611a      	subu      	r4, r6
    5b0a:	8bc0      	ld.h      	r6, (r3, 0x0)
    5b0c:	4ec1      	lsri      	r6, r6, 1
    5b0e:	6591      	cmplt      	r4, r6
    5b10:	0805      	bt      	0x5b1a	// 5b1a <TK_Baseline_tracking+0x472>
    5b12:	8d80      	ld.h      	r4, (r5, 0x0)
    5b14:	2c01      	subi      	r4, 2
    5b16:	7511      	zexth      	r4, r4
    5b18:	ad80      	st.h      	r4, (r5, 0x0)
    5b1a:	5fa0      	addu      	r5, r7, r0
    5b1c:	8d80      	ld.h      	r4, (r5, 0x0)
    5b1e:	7513      	sexth      	r4, r4
    5b20:	3c20      	cmplti      	r4, 1
    5b22:	080c      	bt      	0x5b3a	// 5b3a <TK_Baseline_tracking+0x492>
    5b24:	8da0      	ld.h      	r5, (r5, 0x0)
    5b26:	8b80      	ld.h      	r4, (r3, 0x0)
    5b28:	7557      	sexth      	r5, r5
    5b2a:	4c81      	lsri      	r4, r4, 1
    5b2c:	6515      	cmplt      	r5, r4
    5b2e:	0c06      	bf      	0x5b3a	// 5b3a <TK_Baseline_tracking+0x492>
    5b30:	59a0      	addu      	r5, r1, r0
    5b32:	8d80      	ld.h      	r4, (r5, 0x0)
    5b34:	2400      	addi      	r4, 1
    5b36:	7511      	zexth      	r4, r4
    5b38:	ad80      	st.h      	r4, (r5, 0x0)
    5b3a:	5fa0      	addu      	r5, r7, r0
    5b3c:	8d80      	ld.h      	r4, (r5, 0x0)
    5b3e:	7513      	sexth      	r4, r4
    5b40:	3c20      	cmplti      	r4, 1
    5b42:	0810      	bt      	0x5b62	// 5b62 <TK_Baseline_tracking+0x4ba>
    5b44:	8dc0      	ld.h      	r6, (r5, 0x0)
    5b46:	759b      	sexth      	r6, r6
    5b48:	8b80      	ld.h      	r4, (r3, 0x0)
    5b4a:	6519      	cmplt      	r6, r4
    5b4c:	0c0b      	bf      	0x5b62	// 5b62 <TK_Baseline_tracking+0x4ba>
    5b4e:	8da0      	ld.h      	r5, (r5, 0x0)
    5b50:	7557      	sexth      	r5, r5
    5b52:	4c81      	lsri      	r4, r4, 1
    5b54:	6515      	cmplt      	r5, r4
    5b56:	0806      	bt      	0x5b62	// 5b62 <TK_Baseline_tracking+0x4ba>
    5b58:	6004      	addu      	r0, r1
    5b5a:	8880      	ld.h      	r4, (r0, 0x0)
    5b5c:	2401      	addi      	r4, 2
    5b5e:	7511      	zexth      	r4, r4
    5b60:	a880      	st.h      	r4, (r0, 0x0)
    5b62:	2200      	addi      	r2, 1
    5b64:	3a51      	cmpnei      	r2, 17
    5b66:	2301      	addi      	r3, 2
    5b68:	0b3a      	bt      	0x59dc	// 59dc <TK_Baseline_tracking+0x334>
    5b6a:	e800fdb9 	br      	0x56dc	// 56dc <TK_Baseline_tracking+0x34>
    5b6e:	5f80      	addu      	r4, r7, r0
    5b70:	8c80      	ld.h      	r4, (r4, 0x0)
    5b72:	7513      	sexth      	r4, r4
    5b74:	3cdf      	btsti      	r4, 31
    5b76:	0fa9      	bf      	0x5ac8	// 5ac8 <TK_Baseline_tracking+0x420>
    5b78:	10ab      	lrw      	r5, 0x200003b0	// 5ba4 <TK_Baseline_tracking+0x4fc>
    5b7a:	5980      	addu      	r4, r1, r0
    5b7c:	6140      	addu      	r5, r0
    5b7e:	8c80      	ld.h      	r4, (r4, 0x0)
    5b80:	8da0      	ld.h      	r5, (r5, 0x0)
    5b82:	7555      	zexth      	r5, r5
    5b84:	8bc0      	ld.h      	r6, (r3, 0x0)
    5b86:	7511      	zexth      	r4, r4
    5b88:	6116      	subu      	r4, r5
    5b8a:	46a1      	lsli      	r5, r6, 1
    5b8c:	6158      	addu      	r5, r6
    5b8e:	6551      	cmplt      	r4, r5
    5b90:	0b9c      	bt      	0x5ac8	// 5ac8 <TK_Baseline_tracking+0x420>
    5b92:	1084      	lrw      	r4, 0x2000035b	// 5ba0 <TK_Baseline_tracking+0x4f8>
    5b94:	3501      	movi      	r5, 1
    5b96:	a4a0      	st.b      	r5, (r4, 0x0)
    5b98:	6c03      	mov      	r0, r0
    5b9a:	0797      	br      	0x5ac8	// 5ac8 <TK_Baseline_tracking+0x420>
    5b9c:	2000034a 	.long	0x2000034a
    5ba0:	2000035b 	.long	0x2000035b
    5ba4:	200003b0 	.long	0x200003b0
    5ba8:	20000266 	.long	0x20000266

Disassembly of section .text.TK_result_prog:

00005bac <TK_result_prog>:
    5bac:	14d4      	push      	r4-r7, r15
    5bae:	1421      	subi      	r14, r14, 4
    5bb0:	1117      	lrw      	r0, 0x200002d4	// 5c8c <TK_result_prog+0xe0>
    5bb2:	11b8      	lrw      	r5, 0x20000278	// 5c90 <TK_result_prog+0xe4>
    5bb4:	1178      	lrw      	r3, 0x20000334	// 5c94 <TK_result_prog+0xe8>
    5bb6:	1138      	lrw      	r1, 0x20000334	// 5c94 <TK_result_prog+0xe8>
    5bb8:	1198      	lrw      	r4, 0x20000378	// 5c98 <TK_result_prog+0xec>
    5bba:	90c0      	ld.w      	r6, (r0, 0x0)
    5bbc:	9540      	ld.w      	r2, (r5, 0x0)
    5bbe:	6d88      	or      	r6, r2
    5bc0:	b860      	st.w      	r3, (r14, 0x0)
    5bc2:	9360      	ld.w      	r3, (r3, 0x0)
    5bc4:	6d8c      	or      	r6, r3
    5bc6:	3e40      	cmpnei      	r6, 0
    5bc8:	6cc3      	mov      	r3, r0
    5bca:	6c97      	mov      	r2, r5
    5bcc:	0c5a      	bf      	0x5c80	// 5c80 <TK_result_prog+0xd4>
    5bce:	90c0      	ld.w      	r6, (r0, 0x0)
    5bd0:	6ddb      	mov      	r7, r6
    5bd2:	95c0      	ld.w      	r6, (r5, 0x0)
    5bd4:	659e      	cmpne      	r7, r6
    5bd6:	081c      	bt      	0x5c0e	// 5c0e <TK_result_prog+0x62>
    5bd8:	95c0      	ld.w      	r6, (r5, 0x0)
    5bda:	91a0      	ld.w      	r5, (r1, 0x0)
    5bdc:	655a      	cmpne      	r6, r5
    5bde:	0818      	bt      	0x5c0e	// 5c0e <TK_result_prog+0x62>
    5be0:	9060      	ld.w      	r3, (r0, 0x0)
    5be2:	b460      	st.w      	r3, (r4, 0x0)
    5be4:	9460      	ld.w      	r3, (r4, 0x0)
    5be6:	3b40      	cmpnei      	r3, 0
    5be8:	11ad      	lrw      	r5, 0x2000044c	// 5c9c <TK_result_prog+0xf0>
    5bea:	0c4d      	bf      	0x5c84	// 5c84 <TK_result_prog+0xd8>
    5bec:	9440      	ld.w      	r2, (r4, 0x0)
    5bee:	9560      	ld.w      	r3, (r5, 0x0)
    5bf0:	64ca      	cmpne      	r2, r3
    5bf2:	0c03      	bf      	0x5bf8	// 5bf8 <TK_result_prog+0x4c>
    5bf4:	9460      	ld.w      	r3, (r4, 0x0)
    5bf6:	b560      	st.w      	r3, (r5, 0x0)
    5bf8:	e3fff9fc 	bsr      	0x4ff0	// 4ff0 <get_key_number>
    5bfc:	1169      	lrw      	r3, 0x20000194	// 5ca0 <TK_result_prog+0xf4>
    5bfe:	8360      	ld.b      	r3, (r3, 0x0)
    5c00:	640c      	cmphs      	r3, r0
    5c02:	0804      	bt      	0x5c0a	// 5c0a <TK_result_prog+0x5e>
    5c04:	3300      	movi      	r3, 0
    5c06:	b460      	st.w      	r3, (r4, 0x0)
    5c08:	b560      	st.w      	r3, (r5, 0x0)
    5c0a:	1401      	addi      	r14, r14, 4
    5c0c:	1494      	pop      	r4-r7, r15
    5c0e:	9200      	ld.w      	r0, (r2, 0x0)
    5c10:	3840      	cmpnei      	r0, 0
    5c12:	0c11      	bf      	0x5c34	// 5c34 <TK_result_prog+0x88>
    5c14:	9100      	ld.w      	r0, (r1, 0x0)
    5c16:	3840      	cmpnei      	r0, 0
    5c18:	0c0e      	bf      	0x5c34	// 5c34 <TK_result_prog+0x88>
    5c1a:	92a0      	ld.w      	r5, (r2, 0x0)
    5c1c:	9100      	ld.w      	r0, (r1, 0x0)
    5c1e:	6416      	cmpne      	r5, r0
    5c20:	080a      	bt      	0x5c34	// 5c34 <TK_result_prog+0x88>
    5c22:	9240      	ld.w      	r2, (r2, 0x0)
    5c24:	b440      	st.w      	r2, (r4, 0x0)
    5c26:	9320      	ld.w      	r1, (r3, 0x0)
    5c28:	9440      	ld.w      	r2, (r4, 0x0)
    5c2a:	6486      	cmpne      	r1, r2
    5c2c:	0fdc      	bf      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c2e:	3200      	movi      	r2, 0
    5c30:	b340      	st.w      	r2, (r3, 0x0)
    5c32:	07d9      	br      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c34:	9300      	ld.w      	r0, (r3, 0x0)
    5c36:	3840      	cmpnei      	r0, 0
    5c38:	0c11      	bf      	0x5c5a	// 5c5a <TK_result_prog+0xae>
    5c3a:	9200      	ld.w      	r0, (r2, 0x0)
    5c3c:	3840      	cmpnei      	r0, 0
    5c3e:	0c0e      	bf      	0x5c5a	// 5c5a <TK_result_prog+0xae>
    5c40:	93a0      	ld.w      	r5, (r3, 0x0)
    5c42:	9200      	ld.w      	r0, (r2, 0x0)
    5c44:	6416      	cmpne      	r5, r0
    5c46:	080a      	bt      	0x5c5a	// 5c5a <TK_result_prog+0xae>
    5c48:	9360      	ld.w      	r3, (r3, 0x0)
    5c4a:	b460      	st.w      	r3, (r4, 0x0)
    5c4c:	9140      	ld.w      	r2, (r1, 0x0)
    5c4e:	9460      	ld.w      	r3, (r4, 0x0)
    5c50:	64ca      	cmpne      	r2, r3
    5c52:	0fc9      	bf      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c54:	3300      	movi      	r3, 0
    5c56:	b160      	st.w      	r3, (r1, 0x0)
    5c58:	07c6      	br      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c5a:	9300      	ld.w      	r0, (r3, 0x0)
    5c5c:	3840      	cmpnei      	r0, 0
    5c5e:	0fc3      	bf      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c60:	9100      	ld.w      	r0, (r1, 0x0)
    5c62:	3840      	cmpnei      	r0, 0
    5c64:	0fc0      	bf      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c66:	9300      	ld.w      	r0, (r3, 0x0)
    5c68:	9120      	ld.w      	r1, (r1, 0x0)
    5c6a:	6442      	cmpne      	r0, r1
    5c6c:	0bbc      	bt      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c6e:	9360      	ld.w      	r3, (r3, 0x0)
    5c70:	b460      	st.w      	r3, (r4, 0x0)
    5c72:	9220      	ld.w      	r1, (r2, 0x0)
    5c74:	9460      	ld.w      	r3, (r4, 0x0)
    5c76:	64c6      	cmpne      	r1, r3
    5c78:	0fb6      	bf      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c7a:	3300      	movi      	r3, 0
    5c7c:	b260      	st.w      	r3, (r2, 0x0)
    5c7e:	07b3      	br      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c80:	b4c0      	st.w      	r6, (r4, 0x0)
    5c82:	07b1      	br      	0x5be4	// 5be4 <TK_result_prog+0x38>
    5c84:	1048      	lrw      	r2, 0x20000370	// 5ca4 <TK_result_prog+0xf8>
    5c86:	b560      	st.w      	r3, (r5, 0x0)
    5c88:	b260      	st.w      	r3, (r2, 0x0)
    5c8a:	07c0      	br      	0x5c0a	// 5c0a <TK_result_prog+0x5e>
    5c8c:	200002d4 	.long	0x200002d4
    5c90:	20000278 	.long	0x20000278
    5c94:	20000334 	.long	0x20000334
    5c98:	20000378 	.long	0x20000378
    5c9c:	2000044c 	.long	0x2000044c
    5ca0:	20000194 	.long	0x20000194
    5ca4:	20000370 	.long	0x20000370

Disassembly of section .text.CORETHandler:

00005ca8 <CORETHandler>:
    5ca8:	1460      	nie
    5caa:	1462      	ipush
    5cac:	14d1      	push      	r4, r15
    5cae:	1077      	lrw      	r3, 0x20000064	// 5d08 <CORETHandler+0x60>
    5cb0:	3400      	movi      	r4, 0
    5cb2:	9360      	ld.w      	r3, (r3, 0x0)
    5cb4:	b386      	st.w      	r4, (r3, 0x18)
    5cb6:	1076      	lrw      	r3, 0x200002d8	// 5d0c <CORETHandler+0x64>
    5cb8:	8360      	ld.b      	r3, (r3, 0x0)
    5cba:	3b41      	cmpnei      	r3, 1
    5cbc:	0820      	bt      	0x5cfc	// 5cfc <CORETHandler+0x54>
    5cbe:	e3fffa4b 	bsr      	0x5154	// 5154 <TK_Scan_Start>
    5cc2:	e3fffa75 	bsr      	0x51ac	// 51ac <TK_Keymap_prog>
    5cc6:	e3fffc67 	bsr      	0x5594	// 5594 <TK_overflow_predict>
    5cca:	e3fffcef 	bsr      	0x56a8	// 56a8 <TK_Baseline_tracking>
    5cce:	e3ffff6f 	bsr      	0x5bac	// 5bac <TK_result_prog>
    5cd2:	1070      	lrw      	r3, 0x20000378	// 5d10 <CORETHandler+0x68>
    5cd4:	9360      	ld.w      	r3, (r3, 0x0)
    5cd6:	3b40      	cmpnei      	r3, 0
    5cd8:	0c12      	bf      	0x5cfc	// 5cfc <CORETHandler+0x54>
    5cda:	106f      	lrw      	r3, 0x20000164	// 5d14 <CORETHandler+0x6c>
    5cdc:	9340      	ld.w      	r2, (r3, 0x0)
    5cde:	3a40      	cmpnei      	r2, 0
    5ce0:	0c0e      	bf      	0x5cfc	// 5cfc <CORETHandler+0x54>
    5ce2:	106e      	lrw      	r3, 0x20000370	// 5d18 <CORETHandler+0x70>
    5ce4:	3064      	movi      	r0, 100
    5ce6:	9320      	ld.w      	r1, (r3, 0x0)
    5ce8:	2100      	addi      	r1, 1
    5cea:	b320      	st.w      	r1, (r3, 0x0)
    5cec:	9320      	ld.w      	r1, (r3, 0x0)
    5cee:	7c80      	mult      	r2, r0
    5cf0:	6448      	cmphs      	r2, r1
    5cf2:	0805      	bt      	0x5cfc	// 5cfc <CORETHandler+0x54>
    5cf4:	104a      	lrw      	r2, 0x2000035b	// 5d1c <CORETHandler+0x74>
    5cf6:	3101      	movi      	r1, 1
    5cf8:	a220      	st.b      	r1, (r2, 0x0)
    5cfa:	b380      	st.w      	r4, (r3, 0x0)
    5cfc:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    5d00:	9880      	ld.w      	r4, (r14, 0x0)
    5d02:	1402      	addi      	r14, r14, 8
    5d04:	1463      	ipop
    5d06:	1461      	nir
    5d08:	20000064 	.long	0x20000064
    5d0c:	200002d8 	.long	0x200002d8
    5d10:	20000378 	.long	0x20000378
    5d14:	20000164 	.long	0x20000164
    5d18:	20000370 	.long	0x20000370
    5d1c:	2000035b 	.long	0x2000035b

Disassembly of section .text.get_key_seq:

00005d20 <get_key_seq>:
    5d20:	14c3      	push      	r4-r6
    5d22:	106b      	lrw      	r3, 0x20000190	// 5d4c <get_key_seq+0x2c>
    5d24:	3000      	movi      	r0, 0
    5d26:	9320      	ld.w      	r1, (r3, 0x0)
    5d28:	3401      	movi      	r4, 1
    5d2a:	3300      	movi      	r3, 0
    5d2c:	10a9      	lrw      	r5, 0x20000450	// 5d50 <get_key_seq+0x30>
    5d2e:	6c87      	mov      	r2, r1
    5d30:	708d      	lsr      	r2, r3
    5d32:	6890      	and      	r2, r4
    5d34:	3a40      	cmpnei      	r2, 0
    5d36:	0c05      	bf      	0x5d40	// 5d40 <get_key_seq+0x20>
    5d38:	5dc0      	addu      	r6, r5, r0
    5d3a:	748c      	zextb      	r2, r3
    5d3c:	a640      	st.b      	r2, (r6, 0x0)
    5d3e:	2000      	addi      	r0, 1
    5d40:	2300      	addi      	r3, 1
    5d42:	3b51      	cmpnei      	r3, 17
    5d44:	0bf5      	bt      	0x5d2e	// 5d2e <get_key_seq+0xe>
    5d46:	7400      	zextb      	r0, r0
    5d48:	1483      	pop      	r4-r6
    5d4a:	0000      	bkpt
    5d4c:	20000190 	.long	0x20000190
    5d50:	20000450 	.long	0x20000450

Disassembly of section .text.CORET_CONFIG:

00005d54 <CORET_CONFIG>:
    5d54:	14d0      	push      	r15
    5d56:	e3ffe4c1 	bsr      	0x26d8	// 26d8 <CORET_DeInit>
    5d5a:	3180      	movi      	r1, 128
    5d5c:	4124      	lsli      	r1, r1, 4
    5d5e:	3001      	movi      	r0, 1
    5d60:	e3ffe6dc 	bsr      	0x2b18	// 2b18 <SYSCON_General_CMD>
    5d64:	1068      	lrw      	r3, 0x20000064	// 5d84 <CORET_CONFIG+0x30>
    5d66:	1049      	lrw      	r2, 0x200001e0	// 5d88 <CORET_CONFIG+0x34>
    5d68:	9360      	ld.w      	r3, (r3, 0x0)
    5d6a:	9240      	ld.w      	r2, (r2, 0x0)
    5d6c:	b345      	st.w      	r2, (r3, 0x14)
    5d6e:	e3ffe4e5 	bsr      	0x2738	// 2738 <CORET_reload>
    5d72:	e3ffe4d3 	bsr      	0x2718	// 2718 <CORET_CLKSOURCE_EX>
    5d76:	e3ffe4d9 	bsr      	0x2728	// 2728 <CORET_TICKINT_Enable>
    5d7a:	e3ffe4c7 	bsr      	0x2708	// 2708 <CORET_start>
    5d7e:	e3ffe4b9 	bsr      	0x26f0	// 26f0 <CORET_Int_Enable>
    5d82:	1490      	pop      	r15
    5d84:	20000064 	.long	0x20000064
    5d88:	200001e0 	.long	0x200001e0

Disassembly of section .text.tk_chxval_seqxcon_clr:

00005d8c <tk_chxval_seqxcon_clr>:
    5d8c:	1066      	lrw      	r3, 0x20000054	// 5da4 <tk_chxval_seqxcon_clr+0x18>
    5d8e:	3100      	movi      	r1, 0
    5d90:	9300      	ld.w      	r0, (r3, 0x0)
    5d92:	3300      	movi      	r3, 0
    5d94:	4342      	lsli      	r2, r3, 2
    5d96:	2300      	addi      	r3, 1
    5d98:	6080      	addu      	r2, r0
    5d9a:	3b52      	cmpnei      	r3, 18
    5d9c:	b220      	st.w      	r1, (r2, 0x0)
    5d9e:	b232      	st.w      	r1, (r2, 0x48)
    5da0:	0bfa      	bt      	0x5d94	// 5d94 <tk_chxval_seqxcon_clr+0x8>
    5da2:	783c      	jmp      	r15
    5da4:	20000054 	.long	0x20000054

Disassembly of section .text.tk_init:

00005da8 <tk_init>:
    5da8:	14d4      	push      	r4-r7, r15
    5daa:	142c      	subi      	r14, r14, 48
    5dac:	1273      	lrw      	r3, 0x2000005c	// 5ef8 <tk_init+0x150>
    5dae:	1254      	lrw      	r2, 0xa67a6cc7	// 5efc <tk_init+0x154>
    5db0:	9360      	ld.w      	r3, (r3, 0x0)
    5db2:	b356      	st.w      	r2, (r3, 0x58)
    5db4:	1253      	lrw      	r2, 0x21f1f04	// 5f00 <tk_init+0x158>
    5db6:	b355      	st.w      	r2, (r3, 0x54)
    5db8:	1273      	lrw      	r3, 0x40011180	// 5f04 <tk_init+0x15c>
    5dba:	1254      	lrw      	r2, 0x69966996	// 5f08 <tk_init+0x160>
    5dbc:	b35f      	st.w      	r2, (r3, 0x7c)
    5dbe:	e3ffe78d 	bsr      	0x2cd8	// 2cd8 <tk_parameter_init>
    5dc2:	1273      	lrw      	r3, 0x20000161	// 5f0c <tk_init+0x164>
    5dc4:	8360      	ld.b      	r3, (r3, 0x0)
    5dc6:	3b40      	cmpnei      	r3, 0
    5dc8:	0853      	bt      	0x5e6e	// 5e6e <tk_init+0xc6>
    5dca:	1272      	lrw      	r3, 0x200000c0	// 5f10 <tk_init+0x168>
    5dcc:	1252      	lrw      	r2, 0x80007	// 5f14 <tk_init+0x16c>
    5dce:	b344      	st.w      	r2, (r3, 0x10)
    5dd0:	2202      	addi      	r2, 3
    5dd2:	b343      	st.w      	r2, (r3, 0xc)
    5dd4:	2202      	addi      	r2, 3
    5dd6:	b342      	st.w      	r2, (r3, 0x8)
    5dd8:	e3fff7bc 	bsr      	0x4d50	// 4d50 <TK_IO_Enable>
    5ddc:	3200      	movi      	r2, 0
    5dde:	3100      	movi      	r1, 0
    5de0:	3001      	movi      	r0, 1
    5de2:	e3fff745 	bsr      	0x4c6c	// 4c6c <tk_clk_config>
    5de6:	e3ffffd3 	bsr      	0x5d8c	// 5d8c <tk_chxval_seqxcon_clr>
    5dea:	e3ffff9b 	bsr      	0x5d20	// 5d20 <get_key_seq>
    5dee:	128b      	lrw      	r4, 0x20000417	// 5f18 <tk_init+0x170>
    5df0:	3101      	movi      	r1, 1
    5df2:	a400      	st.b      	r0, (r4, 0x0)
    5df4:	8440      	ld.b      	r2, (r4, 0x0)
    5df6:	126a      	lrw      	r3, 0x200001dc	// 5f1c <tk_init+0x174>
    5df8:	8b60      	ld.h      	r3, (r3, 0x0)
    5dfa:	b829      	st.w      	r1, (r14, 0x24)
    5dfc:	3180      	movi      	r1, 128
    5dfe:	412d      	lsli      	r1, r1, 13
    5e00:	b828      	st.w      	r1, (r14, 0x20)
    5e02:	3180      	movi      	r1, 128
    5e04:	4129      	lsli      	r1, r1, 9
    5e06:	b827      	st.w      	r1, (r14, 0x1c)
    5e08:	3100      	movi      	r1, 0
    5e0a:	b826      	st.w      	r1, (r14, 0x18)
    5e0c:	2a00      	subi      	r2, 1
    5e0e:	1205      	lrw      	r0, 0x200001de	// 5f20 <tk_init+0x178>
    5e10:	8800      	ld.h      	r0, (r0, 0x0)
    5e12:	b805      	st.w      	r0, (r14, 0x14)
    5e14:	7488      	zextb      	r2, r2
    5e16:	1204      	lrw      	r0, 0x200001e4	// 5f24 <tk_init+0x17c>
    5e18:	8800      	ld.h      	r0, (r0, 0x0)
    5e1a:	b804      	st.w      	r0, (r14, 0x10)
    5e1c:	3080      	movi      	r0, 128
    5e1e:	4005      	lsli      	r0, r0, 5
    5e20:	b803      	st.w      	r0, (r14, 0xc)
    5e22:	3080      	movi      	r0, 128
    5e24:	4004      	lsli      	r0, r0, 4
    5e26:	b802      	st.w      	r0, (r14, 0x8)
    5e28:	b821      	st.w      	r1, (r14, 0x4)
    5e2a:	b820      	st.w      	r1, (r14, 0x0)
    5e2c:	3001      	movi      	r0, 1
    5e2e:	3102      	movi      	r1, 2
    5e30:	e3fff732 	bsr      	0x4c94	// 4c94 <TK_con0_config>
    5e34:	3002      	movi      	r0, 2
    5e36:	e3fff713 	bsr      	0x4c5c	// 4c5c <TK_ConfigInterrupt_CMD.part.0>
    5e3a:	3020      	movi      	r0, 32
    5e3c:	e3fff710 	bsr      	0x4c5c	// 4c5c <TK_ConfigInterrupt_CMD.part.0>
    5e40:	3380      	movi      	r3, 128
    5e42:	4372      	lsli      	r3, r3, 18
    5e44:	1159      	lrw      	r2, 0xe000e100	// 5f28 <tk_init+0x180>
    5e46:	b260      	st.w      	r3, (r2, 0x0)
    5e48:	b270      	st.w      	r3, (r2, 0x40)
    5e4a:	11f9      	lrw      	r7, 0x200000d6	// 5f2c <tk_init+0x184>
    5e4c:	1179      	lrw      	r3, 0x20000054	// 5f30 <tk_init+0x188>
    5e4e:	11ba      	lrw      	r5, 0x20000450	// 5f34 <tk_init+0x18c>
    5e50:	11da      	lrw      	r6, 0x20000196	// 5f38 <tk_init+0x190>
    5e52:	9360      	ld.w      	r3, (r3, 0x0)
    5e54:	b86a      	st.w      	r3, (r14, 0x28)
    5e56:	b88b      	st.w      	r4, (r14, 0x2c)
    5e58:	3300      	movi      	r3, 0
    5e5a:	984b      	ld.w      	r2, (r14, 0x2c)
    5e5c:	8240      	ld.b      	r2, (r2, 0x0)
    5e5e:	648c      	cmphs      	r3, r2
    5e60:	0c2d      	bf      	0x5eba	// 5eba <tk_init+0x112>
    5e62:	e3ffff79 	bsr      	0x5d54	// 5d54 <CORET_CONFIG>
    5e66:	e3fff8d9 	bsr      	0x5018	// 5018 <TK_Baseline_prog>
    5e6a:	140c      	addi      	r14, r14, 48
    5e6c:	1494      	pop      	r4-r7, r15
    5e6e:	3b41      	cmpnei      	r3, 1
    5e70:	0bb4      	bt      	0x5dd8	// 5dd8 <tk_init+0x30>
    5e72:	1168      	lrw      	r3, 0x200000c0	// 5f10 <tk_init+0x168>
    5e74:	1152      	lrw      	r2, 0x8000a	// 5f3c <tk_init+0x194>
    5e76:	b344      	st.w      	r2, (r3, 0x10)
    5e78:	b343      	st.w      	r2, (r3, 0xc)
    5e7a:	b342      	st.w      	r2, (r3, 0x8)
    5e7c:	3105      	movi      	r1, 5
    5e7e:	1171      	lrw      	r3, 0x20000058	// 5f40 <tk_init+0x198>
    5e80:	9380      	ld.w      	r4, (r3, 0x0)
    5e82:	1171      	lrw      	r3, 0x200001b8	// 5f44 <tk_init+0x19c>
    5e84:	8300      	ld.b      	r0, (r3, 0x0)
    5e86:	e3ffee7b 	bsr      	0x3b7c	// 3b7c <__udivsi3>
    5e8a:	7400      	zextb      	r0, r0
    5e8c:	116f      	lrw      	r3, 0x20000162	// 5f48 <tk_init+0x1a0>
    5e8e:	b408      	st.w      	r0, (r4, 0x20)
    5e90:	8300      	ld.b      	r0, (r3, 0x0)
    5e92:	3804      	cmphsi      	r0, 5
    5e94:	116e      	lrw      	r3, 0x20000374	// 5f4c <tk_init+0x1a4>
    5e96:	0810      	bt      	0x5eb6	// 5eb6 <tk_init+0x10e>
    5e98:	e3ffd732 	bsr      	0xcfc	// cfc <___gnu_csky_case_uqi>
    5e9c:	090d0703 	.long	0x090d0703
    5ea0:	000b      	.short	0x000b
    5ea2:	3296      	movi      	r2, 150
    5ea4:	4242      	lsli      	r2, r2, 2
    5ea6:	ab40      	st.h      	r2, (r3, 0x0)
    5ea8:	0798      	br      	0x5dd8	// 5dd8 <tk_init+0x30>
    5eaa:	114b      	lrw      	r2, 0x5dc	// 5f54 <tk_init+0x1ac>
    5eac:	07fd      	br      	0x5ea6	// 5ea6 <tk_init+0xfe>
    5eae:	114b      	lrw      	r2, 0x1194	// 5f58 <tk_init+0x1b0>
    5eb0:	07fb      	br      	0x5ea6	// 5ea6 <tk_init+0xfe>
    5eb2:	114b      	lrw      	r2, 0x1770	// 5f5c <tk_init+0x1b4>
    5eb4:	07f9      	br      	0x5ea6	// 5ea6 <tk_init+0xfe>
    5eb6:	114b      	lrw      	r2, 0xbb8	// 5f60 <tk_init+0x1b8>
    5eb8:	07f7      	br      	0x5ea6	// 5ea6 <tk_init+0xfe>
    5eba:	5d0c      	addu      	r0, r5, r3
    5ebc:	8020      	ld.b      	r1, (r0, 0x0)
    5ebe:	8040      	ld.b      	r2, (r0, 0x0)
    5ec0:	8080      	ld.b      	r4, (r0, 0x0)
    5ec2:	8000      	ld.b      	r0, (r0, 0x0)
    5ec4:	4001      	lsli      	r0, r0, 1
    5ec6:	6018      	addu      	r0, r6
    5ec8:	4121      	lsli      	r1, r1, 1
    5eca:	8800      	ld.h      	r0, (r0, 0x0)
    5ecc:	605c      	addu      	r1, r7
    5ece:	448f      	lsli      	r4, r4, 15
    5ed0:	6d00      	or      	r4, r0
    5ed2:	4241      	lsli      	r2, r2, 1
    5ed4:	8900      	ld.h      	r0, (r1, 0x0)
    5ed6:	103f      	lrw      	r1, 0x2000016a	// 5f50 <tk_init+0x1a8>
    5ed8:	6084      	addu      	r2, r1
    5eda:	4018      	lsli      	r0, r0, 24
    5edc:	6c10      	or      	r0, r4
    5ede:	8a80      	ld.h      	r4, (r2, 0x0)
    5ee0:	3212      	movi      	r2, 18
    5ee2:	608c      	addu      	r2, r3
    5ee4:	4494      	lsli      	r4, r4, 20
    5ee6:	4242      	lsli      	r2, r2, 2
    5ee8:	982a      	ld.w      	r1, (r14, 0x28)
    5eea:	6c10      	or      	r0, r4
    5eec:	6084      	addu      	r2, r1
    5eee:	2300      	addi      	r3, 1
    5ef0:	b200      	st.w      	r0, (r2, 0x0)
    5ef2:	74cc      	zextb      	r3, r3
    5ef4:	07b3      	br      	0x5e5a	// 5e5a <tk_init+0xb2>
    5ef6:	0000      	bkpt
    5ef8:	2000005c 	.long	0x2000005c
    5efc:	a67a6cc7 	.long	0xa67a6cc7
    5f00:	021f1f04 	.long	0x021f1f04
    5f04:	40011180 	.long	0x40011180
    5f08:	69966996 	.long	0x69966996
    5f0c:	20000161 	.long	0x20000161
    5f10:	200000c0 	.long	0x200000c0
    5f14:	00080007 	.long	0x00080007
    5f18:	20000417 	.long	0x20000417
    5f1c:	200001dc 	.long	0x200001dc
    5f20:	200001de 	.long	0x200001de
    5f24:	200001e4 	.long	0x200001e4
    5f28:	e000e100 	.long	0xe000e100
    5f2c:	200000d6 	.long	0x200000d6
    5f30:	20000054 	.long	0x20000054
    5f34:	20000450 	.long	0x20000450
    5f38:	20000196 	.long	0x20000196
    5f3c:	0008000a 	.long	0x0008000a
    5f40:	20000058 	.long	0x20000058
    5f44:	200001b8 	.long	0x200001b8
    5f48:	20000162 	.long	0x20000162
    5f4c:	20000374 	.long	0x20000374
    5f50:	2000016a 	.long	0x2000016a
    5f54:	000005dc 	.long	0x000005dc
    5f58:	00001194 	.long	0x00001194
    5f5c:	00001770 	.long	0x00001770
    5f60:	00000bb8 	.long	0x00000bb8

Disassembly of section .text.std_clk_calib:

00005f64 <std_clk_calib>:
    5f64:	14d4      	push      	r4-r7, r15
    5f66:	142d      	subi      	r14, r14, 52
    5f68:	3201      	movi      	r2, 1
    5f6a:	03ce      	lrw      	r6, 0x2000005c	// 61ac <std_clk_calib+0x248>
    5f6c:	6cc3      	mov      	r3, r0
    5f6e:	dc4e000a 	st.b      	r2, (r14, 0xa)
    5f72:	9640      	ld.w      	r2, (r6, 0x0)
    5f74:	9247      	ld.w      	r2, (r2, 0x1c)
    5f76:	7488      	zextb      	r2, r2
    5f78:	dc4e0009 	st.b      	r2, (r14, 0x9)
    5f7c:	d84e0009 	ld.b      	r2, (r14, 0x9)
    5f80:	3a40      	cmpnei      	r2, 0
    5f82:	0c08      	bf      	0x5f92	// 5f92 <std_clk_calib+0x2e>
    5f84:	d84e0009 	ld.b      	r2, (r14, 0x9)
    5f88:	3a42      	cmpnei      	r2, 2
    5f8a:	0c04      	bf      	0x5f92	// 5f92 <std_clk_calib+0x2e>
    5f8c:	3000      	movi      	r0, 0
    5f8e:	140d      	addi      	r14, r14, 52
    5f90:	1494      	pop      	r4-r7, r15
    5f92:	0397      	lrw      	r4, 0x2000000c	// 61b0 <std_clk_calib+0x24c>
    5f94:	3209      	movi      	r2, 9
    5f96:	9400      	ld.w      	r0, (r4, 0x0)
    5f98:	3b40      	cmpnei      	r3, 0
    5f9a:	b041      	st.w      	r2, (r0, 0x4)
    5f9c:	0857      	bt      	0x604a	// 604a <std_clk_calib+0xe6>
    5f9e:	3307      	movi      	r3, 7
    5fa0:	dc6e000b 	st.b      	r3, (r14, 0xb)
    5fa4:	037b      	lrw      	r3, 0x2dc6c00	// 61b4 <std_clk_calib+0x250>
    5fa6:	b863      	st.w      	r3, (r14, 0xc)
    5fa8:	3380      	movi      	r3, 128
    5faa:	4362      	lsli      	r3, r3, 2
    5fac:	b867      	st.w      	r3, (r14, 0x1c)
    5fae:	d86e000b 	ld.b      	r3, (r14, 0xb)
    5fb2:	74cc      	zextb      	r3, r3
    5fb4:	b062      	st.w      	r3, (r0, 0x8)
    5fb6:	037e      	lrw      	r3, 0xffff	// 61b8 <std_clk_calib+0x254>
    5fb8:	b063      	st.w      	r3, (r0, 0xc)
    5fba:	3201      	movi      	r2, 1
    5fbc:	3101      	movi      	r1, 1
    5fbe:	03bf      	lrw      	r5, 0x20000014	// 61bc <std_clk_calib+0x258>
    5fc0:	e3ffe37a 	bsr      	0x26b4	// 26b4 <BT_ConfigInterrupt_CMD>
    5fc4:	95e0      	ld.w      	r7, (r5, 0x0)
    5fc6:	137f      	lrw      	r3, 0xbe9c0005	// 61c0 <std_clk_calib+0x25c>
    5fc8:	b760      	st.w      	r3, (r7, 0x0)
    5fca:	135f      	lrw      	r2, 0x30010	// 61c4 <std_clk_calib+0x260>
    5fcc:	3300      	movi      	r3, 0
    5fce:	b762      	st.w      	r3, (r7, 0x8)
    5fd0:	b743      	st.w      	r2, (r7, 0xc)
    5fd2:	32d8      	movi      	r2, 216
    5fd4:	b745      	st.w      	r2, (r7, 0x14)
    5fd6:	974f      	ld.w      	r2, (r7, 0x3c)
    5fd8:	3aa2      	bseti      	r2, 2
    5fda:	b74f      	st.w      	r2, (r7, 0x3c)
    5fdc:	9803      	ld.w      	r0, (r14, 0xc)
    5fde:	d82e000b 	ld.b      	r1, (r14, 0xb)
    5fe2:	327d      	movi      	r2, 125
    5fe4:	2100      	addi      	r1, 1
    5fe6:	7c48      	mult      	r1, r2
    5fe8:	b861      	st.w      	r3, (r14, 0x4)
    5fea:	e3ffedc9 	bsr      	0x3b7c	// 3b7c <__udivsi3>
    5fee:	b804      	st.w      	r0, (r14, 0x10)
    5ff0:	32fa      	movi      	r2, 250
    5ff2:	9824      	ld.w      	r1, (r14, 0x10)
    5ff4:	4242      	lsli      	r2, r2, 2
    5ff6:	6448      	cmphs      	r2, r1
    5ff8:	0bca      	bt      	0x5f8c	// 5f8c <std_clk_calib+0x28>
    5ffa:	9844      	ld.w      	r2, (r14, 0x10)
    5ffc:	3178      	movi      	r1, 120
    5ffe:	9804      	ld.w      	r0, (r14, 0x10)
    6000:	b840      	st.w      	r2, (r14, 0x0)
    6002:	e3ffedbd 	bsr      	0x3b7c	// 3b7c <__udivsi3>
    6006:	9840      	ld.w      	r2, (r14, 0x0)
    6008:	6082      	subu      	r2, r0
    600a:	b845      	st.w      	r2, (r14, 0x14)
    600c:	9804      	ld.w      	r0, (r14, 0x10)
    600e:	3178      	movi      	r1, 120
    6010:	9844      	ld.w      	r2, (r14, 0x10)
    6012:	b840      	st.w      	r2, (r14, 0x0)
    6014:	e3ffedb4 	bsr      	0x3b7c	// 3b7c <__udivsi3>
    6018:	9840      	ld.w      	r2, (r14, 0x0)
    601a:	6008      	addu      	r0, r2
    601c:	b806      	st.w      	r0, (r14, 0x18)
    601e:	c0807020 	psrclr      	ie
    6022:	9640      	ld.w      	r2, (r6, 0x0)
    6024:	9254      	ld.w      	r2, (r2, 0x50)
    6026:	b848      	st.w      	r2, (r14, 0x20)
    6028:	9861      	ld.w      	r3, (r14, 0x4)
    602a:	9440      	ld.w      	r2, (r4, 0x0)
    602c:	b260      	st.w      	r3, (r2, 0x0)
    602e:	b761      	st.w      	r3, (r7, 0x4)
    6030:	d86e000a 	ld.b      	r3, (r14, 0xa)
    6034:	3b40      	cmpnei      	r3, 0
    6036:	083e      	bt      	0x60b2	// 60b2 <std_clk_calib+0x14e>
    6038:	e3ffe468 	bsr      	0x2908	// 2908 <LPT_Soft_Reset>
    603c:	9400      	ld.w      	r0, (r4, 0x0)
    603e:	e3ffe311 	bsr      	0x2660	// 2660 <BT_Soft_Reset>
    6042:	c1807420 	psrset      	ee, ie
    6046:	3001      	movi      	r0, 1
    6048:	07a3      	br      	0x5f8e	// 5f8e <std_clk_calib+0x2a>
    604a:	3b41      	cmpnei      	r3, 1
    604c:	0806      	bt      	0x6058	// 6058 <std_clk_calib+0xf4>
    604e:	3303      	movi      	r3, 3
    6050:	dc6e000b 	st.b      	r3, (r14, 0xb)
    6054:	127d      	lrw      	r3, 0x16e3600	// 61c8 <std_clk_calib+0x264>
    6056:	07a8      	br      	0x5fa6	// 5fa6 <std_clk_calib+0x42>
    6058:	3b42      	cmpnei      	r3, 2
    605a:	0806      	bt      	0x6066	// 6066 <std_clk_calib+0x102>
    605c:	3301      	movi      	r3, 1
    605e:	dc6e000b 	st.b      	r3, (r14, 0xb)
    6062:	127b      	lrw      	r3, 0xb71b00	// 61cc <std_clk_calib+0x268>
    6064:	07a1      	br      	0x5fa6	// 5fa6 <std_clk_calib+0x42>
    6066:	3b43      	cmpnei      	r3, 3
    6068:	0806      	bt      	0x6074	// 6074 <std_clk_calib+0x110>
    606a:	3300      	movi      	r3, 0
    606c:	dc6e000b 	st.b      	r3, (r14, 0xb)
    6070:	1278      	lrw      	r3, 0x5b8d80	// 61d0 <std_clk_calib+0x26c>
    6072:	079a      	br      	0x5fa6	// 5fa6 <std_clk_calib+0x42>
    6074:	3b44      	cmpnei      	r3, 4
    6076:	0809      	bt      	0x6088	// 6088 <std_clk_calib+0x124>
    6078:	3300      	movi      	r3, 0
    607a:	dc6e000b 	st.b      	r3, (r14, 0xb)
    607e:	1276      	lrw      	r3, 0x54c720	// 61d4 <std_clk_calib+0x270>
    6080:	b863      	st.w      	r3, (r14, 0xc)
    6082:	3380      	movi      	r3, 128
    6084:	4369      	lsli      	r3, r3, 9
    6086:	0793      	br      	0x5fac	// 5fac <std_clk_calib+0x48>
    6088:	3b45      	cmpnei      	r3, 5
    608a:	0806      	bt      	0x6096	// 6096 <std_clk_calib+0x132>
    608c:	3300      	movi      	r3, 0
    608e:	dc6e000b 	st.b      	r3, (r14, 0xb)
    6092:	1272      	lrw      	r3, 0x3ffed0	// 61d8 <std_clk_calib+0x274>
    6094:	07f6      	br      	0x6080	// 6080 <std_clk_calib+0x11c>
    6096:	3b46      	cmpnei      	r3, 6
    6098:	0806      	bt      	0x60a4	// 60a4 <std_clk_calib+0x140>
    609a:	3300      	movi      	r3, 0
    609c:	dc6e000b 	st.b      	r3, (r14, 0xb)
    60a0:	126f      	lrw      	r3, 0x1fff68	// 61dc <std_clk_calib+0x278>
    60a2:	07ef      	br      	0x6080	// 6080 <std_clk_calib+0x11c>
    60a4:	3b47      	cmpnei      	r3, 7
    60a6:	0b84      	bt      	0x5fae	// 5fae <std_clk_calib+0x4a>
    60a8:	3300      	movi      	r3, 0
    60aa:	dc6e000b 	st.b      	r3, (r14, 0xb)
    60ae:	126d      	lrw      	r3, 0x1ffb8	// 61e0 <std_clk_calib+0x27c>
    60b0:	07e8      	br      	0x6080	// 6080 <std_clk_calib+0x11c>
    60b2:	9560      	ld.w      	r3, (r5, 0x0)
    60b4:	3101      	movi      	r1, 1
    60b6:	9440      	ld.w      	r2, (r4, 0x0)
    60b8:	b321      	st.w      	r1, (r3, 0x4)
    60ba:	b220      	st.w      	r1, (r2, 0x0)
    60bc:	3100      	movi      	r1, 0
    60be:	b327      	st.w      	r1, (r3, 0x1c)
    60c0:	3004      	movi      	r0, 4
    60c2:	b225      	st.w      	r1, (r2, 0x14)
    60c4:	932e      	ld.w      	r1, (r3, 0x38)
    60c6:	6840      	and      	r1, r0
    60c8:	3940      	cmpnei      	r1, 0
    60ca:	0ffd      	bf      	0x60c4	// 60c4 <std_clk_calib+0x160>
    60cc:	9225      	ld.w      	r1, (r2, 0x14)
    60ce:	b82a      	st.w      	r1, (r14, 0x28)
    60d0:	3100      	movi      	r1, 0
    60d2:	b310      	st.w      	r0, (r3, 0x40)
    60d4:	b327      	st.w      	r1, (r3, 0x1c)
    60d6:	3004      	movi      	r0, 4
    60d8:	b225      	st.w      	r1, (r2, 0x14)
    60da:	932e      	ld.w      	r1, (r3, 0x38)
    60dc:	6840      	and      	r1, r0
    60de:	3940      	cmpnei      	r1, 0
    60e0:	0ffd      	bf      	0x60da	// 60da <std_clk_calib+0x176>
    60e2:	9225      	ld.w      	r1, (r2, 0x14)
    60e4:	b82b      	st.w      	r1, (r14, 0x2c)
    60e6:	3100      	movi      	r1, 0
    60e8:	b310      	st.w      	r0, (r3, 0x40)
    60ea:	b327      	st.w      	r1, (r3, 0x1c)
    60ec:	3004      	movi      	r0, 4
    60ee:	b225      	st.w      	r1, (r2, 0x14)
    60f0:	932e      	ld.w      	r1, (r3, 0x38)
    60f2:	6840      	and      	r1, r0
    60f4:	3940      	cmpnei      	r1, 0
    60f6:	0ffd      	bf      	0x60f0	// 60f0 <std_clk_calib+0x18c>
    60f8:	9225      	ld.w      	r1, (r2, 0x14)
    60fa:	b82c      	st.w      	r1, (r14, 0x30)
    60fc:	b310      	st.w      	r0, (r3, 0x40)
    60fe:	982b      	ld.w      	r1, (r14, 0x2c)
    6100:	980c      	ld.w      	r0, (r14, 0x30)
    6102:	6040      	addu      	r1, r0
    6104:	b829      	st.w      	r1, (r14, 0x24)
    6106:	9829      	ld.w      	r1, (r14, 0x24)
    6108:	4921      	lsri      	r1, r1, 1
    610a:	b829      	st.w      	r1, (r14, 0x24)
    610c:	3100      	movi      	r1, 0
    610e:	b321      	st.w      	r1, (r3, 0x4)
    6110:	b220      	st.w      	r1, (r2, 0x0)
    6112:	b327      	st.w      	r1, (r3, 0x1c)
    6114:	b225      	st.w      	r1, (r2, 0x14)
    6116:	d86e0009 	ld.b      	r3, (r14, 0x9)
    611a:	3b42      	cmpnei      	r3, 2
    611c:	9849      	ld.w      	r2, (r14, 0x24)
    611e:	082c      	bt      	0x6176	// 6176 <std_clk_calib+0x212>
    6120:	1171      	lrw      	r3, 0x7ff	// 61e4 <std_clk_calib+0x280>
    6122:	648c      	cmphs      	r3, r2
    6124:	0c03      	bf      	0x612a	// 612a <std_clk_calib+0x1c6>
    6126:	3300      	movi      	r3, 0
    6128:	040f      	br      	0x6146	// 6146 <std_clk_calib+0x1e2>
    612a:	9849      	ld.w      	r2, (r14, 0x24)
    612c:	9866      	ld.w      	r3, (r14, 0x18)
    612e:	648c      	cmphs      	r3, r2
    6130:	080e      	bt      	0x614c	// 614c <std_clk_calib+0x1e8>
    6132:	9868      	ld.w      	r3, (r14, 0x20)
    6134:	9847      	ld.w      	r2, (r14, 0x1c)
    6136:	60ca      	subu      	r3, r2
    6138:	b868      	st.w      	r3, (r14, 0x20)
    613a:	32fe      	movi      	r2, 254
    613c:	9868      	ld.w      	r3, (r14, 0x20)
    613e:	4248      	lsli      	r2, r2, 8
    6140:	68c8      	and      	r3, r2
    6142:	3b40      	cmpnei      	r3, 0
    6144:	0812      	bt      	0x6168	// 6168 <std_clk_calib+0x204>
    6146:	dc6e000a 	st.b      	r3, (r14, 0xa)
    614a:	0721      	br      	0x5f8c	// 5f8c <std_clk_calib+0x28>
    614c:	9849      	ld.w      	r2, (r14, 0x24)
    614e:	9865      	ld.w      	r3, (r14, 0x14)
    6150:	64c8      	cmphs      	r2, r3
    6152:	0829      	bt      	0x61a4	// 61a4 <std_clk_calib+0x240>
    6154:	9868      	ld.w      	r3, (r14, 0x20)
    6156:	9847      	ld.w      	r2, (r14, 0x1c)
    6158:	60c8      	addu      	r3, r2
    615a:	b868      	st.w      	r3, (r14, 0x20)
    615c:	33fe      	movi      	r3, 254
    615e:	9848      	ld.w      	r2, (r14, 0x20)
    6160:	4368      	lsli      	r3, r3, 8
    6162:	688c      	and      	r2, r3
    6164:	64ca      	cmpne      	r2, r3
    6166:	0fe0      	bf      	0x6126	// 6126 <std_clk_calib+0x1c2>
    6168:	9660      	ld.w      	r3, (r6, 0x0)
    616a:	9848      	ld.w      	r2, (r14, 0x20)
    616c:	b354      	st.w      	r2, (r3, 0x50)
    616e:	3001      	movi      	r0, 1
    6170:	e3ffe750 	bsr      	0x3010	// 3010 <delay_nms>
    6174:	075e      	br      	0x6030	// 6030 <std_clk_calib+0xcc>
    6176:	9866      	ld.w      	r3, (r14, 0x18)
    6178:	648c      	cmphs      	r3, r2
    617a:	0809      	bt      	0x618c	// 618c <std_clk_calib+0x228>
    617c:	9868      	ld.w      	r3, (r14, 0x20)
    617e:	9847      	ld.w      	r2, (r14, 0x1c)
    6180:	60ca      	subu      	r3, r2
    6182:	b868      	st.w      	r3, (r14, 0x20)
    6184:	32ff      	movi      	r2, 255
    6186:	9868      	ld.w      	r3, (r14, 0x20)
    6188:	4250      	lsli      	r2, r2, 16
    618a:	07db      	br      	0x6140	// 6140 <std_clk_calib+0x1dc>
    618c:	9849      	ld.w      	r2, (r14, 0x24)
    618e:	9865      	ld.w      	r3, (r14, 0x14)
    6190:	64c8      	cmphs      	r2, r3
    6192:	0809      	bt      	0x61a4	// 61a4 <std_clk_calib+0x240>
    6194:	9868      	ld.w      	r3, (r14, 0x20)
    6196:	9847      	ld.w      	r2, (r14, 0x1c)
    6198:	60c8      	addu      	r3, r2
    619a:	b868      	st.w      	r3, (r14, 0x20)
    619c:	33ff      	movi      	r3, 255
    619e:	9848      	ld.w      	r2, (r14, 0x20)
    61a0:	4370      	lsli      	r3, r3, 16
    61a2:	07e0      	br      	0x6162	// 6162 <std_clk_calib+0x1fe>
    61a4:	3300      	movi      	r3, 0
    61a6:	dc6e000a 	st.b      	r3, (r14, 0xa)
    61aa:	07e2      	br      	0x616e	// 616e <std_clk_calib+0x20a>
    61ac:	2000005c 	.long	0x2000005c
    61b0:	2000000c 	.long	0x2000000c
    61b4:	02dc6c00 	.long	0x02dc6c00
    61b8:	0000ffff 	.long	0x0000ffff
    61bc:	20000014 	.long	0x20000014
    61c0:	be9c0005 	.long	0xbe9c0005
    61c4:	00030010 	.long	0x00030010
    61c8:	016e3600 	.long	0x016e3600
    61cc:	00b71b00 	.long	0x00b71b00
    61d0:	005b8d80 	.long	0x005b8d80
    61d4:	0054c720 	.long	0x0054c720
    61d8:	003ffed0 	.long	0x003ffed0
    61dc:	001fff68 	.long	0x001fff68
    61e0:	0001ffb8 	.long	0x0001ffb8
    61e4:	000007ff 	.long	0x000007ff
