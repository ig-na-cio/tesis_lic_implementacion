
build/de0nano/software/bios/bios.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_ftext>:
       0:	0b00006f          	j	b0 <crt_init>
       4:	00000013          	nop
       8:	00000013          	nop
       c:	00000013          	nop
      10:	00000013          	nop
      14:	00000013          	nop
      18:	00000013          	nop
      1c:	00000013          	nop

00000020 <trap_entry>:
      20:	fe112e23          	sw	ra,-4(sp)
      24:	fe512c23          	sw	t0,-8(sp)
      28:	fe612a23          	sw	t1,-12(sp)
      2c:	fe712823          	sw	t2,-16(sp)
      30:	fea12623          	sw	a0,-20(sp)
      34:	feb12423          	sw	a1,-24(sp)
      38:	fec12223          	sw	a2,-28(sp)
      3c:	fed12023          	sw	a3,-32(sp)
      40:	fce12e23          	sw	a4,-36(sp)
      44:	fcf12c23          	sw	a5,-40(sp)
      48:	fd012a23          	sw	a6,-44(sp)
      4c:	fd112823          	sw	a7,-48(sp)
      50:	fdc12623          	sw	t3,-52(sp)
      54:	fdd12423          	sw	t4,-56(sp)
      58:	fde12223          	sw	t5,-60(sp)
      5c:	fdf12023          	sw	t6,-64(sp)
      60:	fc010113          	addi	sp,sp,-64
      64:	241030ef          	jal	ra,3aa4 <isr>
      68:	03c12083          	lw	ra,60(sp)
      6c:	03812283          	lw	t0,56(sp)
      70:	03412303          	lw	t1,52(sp)
      74:	03012383          	lw	t2,48(sp)
      78:	02c12503          	lw	a0,44(sp)
      7c:	02812583          	lw	a1,40(sp)
      80:	02412603          	lw	a2,36(sp)
      84:	02012683          	lw	a3,32(sp)
      88:	01c12703          	lw	a4,28(sp)
      8c:	01812783          	lw	a5,24(sp)
      90:	01412803          	lw	a6,20(sp)
      94:	01012883          	lw	a7,16(sp)
      98:	00c12e03          	lw	t3,12(sp)
      9c:	00812e83          	lw	t4,8(sp)
      a0:	00412f03          	lw	t5,4(sp)
      a4:	00012f83          	lw	t6,0(sp)
      a8:	04010113          	addi	sp,sp,64
      ac:	30200073          	mret

000000b0 <crt_init>:
      b0:	10001117          	auipc	sp,0x10001
      b4:	f5010113          	addi	sp,sp,-176 # 10001000 <_fstack>
      b8:	00000517          	auipc	a0,0x0
      bc:	f6850513          	addi	a0,a0,-152 # 20 <trap_entry>
      c0:	30551073          	csrw	mtvec,a0
      c4:	10000597          	auipc	a1,0x10000
      c8:	0a05a423          	sw	zero,168(a1) # 1000016c <smp_lottery_lock>

000000cc <smp_tyranny>:
      cc:	f1402573          	csrr	a0,mhartid
      d0:	02050e63          	beqz	a0,10c <data_init>

000000d4 <smp_slave>:
      d4:	10000517          	auipc	a0,0x10000
      d8:	09852503          	lw	a0,152(a0) # 1000016c <smp_lottery_lock>
      dc:	fe050ce3          	beqz	a0,d4 <smp_slave>
      e0:	0220000f          	fence	r,r
      e4:	0000100f          	fence.i
      e8:	10000517          	auipc	a0,0x10000
      ec:	07852503          	lw	a0,120(a0) # 10000160 <smp_lottery_args>
      f0:	10000597          	auipc	a1,0x10000
      f4:	0745a583          	lw	a1,116(a1) # 10000164 <smp_lottery_args+0x4>
      f8:	10000617          	auipc	a2,0x10000
      fc:	07062603          	lw	a2,112(a2) # 10000168 <smp_lottery_args+0x8>
     100:	10000697          	auipc	a3,0x10000
     104:	05c6a683          	lw	a3,92(a3) # 1000015c <smp_lottery_target>
     108:	00068067          	jr	a3

0000010c <data_init>:
     10c:	10000517          	auipc	a0,0x10000
     110:	ef450513          	addi	a0,a0,-268 # 10000000 <s_leds>
     114:	10000597          	auipc	a1,0x10000
     118:	02c58593          	addi	a1,a1,44 # 10000140 <skip.1899>
     11c:	00005617          	auipc	a2,0x5
     120:	65460613          	addi	a2,a2,1620 # 5770 <_fdata_rom>

00000124 <data_loop>:
     124:	00b50c63          	beq	a0,a1,13c <bss_init>
     128:	00062683          	lw	a3,0(a2)
     12c:	00d52023          	sw	a3,0(a0)
     130:	00450513          	addi	a0,a0,4
     134:	00460613          	addi	a2,a2,4
     138:	fedff06f          	j	124 <data_loop>

0000013c <bss_init>:
     13c:	10000517          	auipc	a0,0x10000
     140:	00450513          	addi	a0,a0,4 # 10000140 <skip.1899>
     144:	10000597          	auipc	a1,0x10000
     148:	13c58593          	addi	a1,a1,316 # 10000280 <_ebss>

0000014c <bss_loop>:
     14c:	00b50863          	beq	a0,a1,15c <bss_done>
     150:	00052023          	sw	zero,0(a0)
     154:	00450513          	addi	a0,a0,4
     158:	ff5ff06f          	j	14c <bss_loop>

0000015c <bss_done>:
     15c:	109030ef          	jal	ra,3a64 <plic_init>
     160:	000012b7          	lui	t0,0x1
     164:	80028293          	addi	t0,t0,-2048 # 800 <serialboot+0xd8>
     168:	30429073          	csrw	mie,t0
     16c:	6fc010ef          	jal	ra,1868 <main>

00000170 <infinit_loop>:
     170:	0000006f          	j	170 <infinit_loop>

00000174 <boot_helper>:
     174:	10000717          	auipc	a4,0x10000
     178:	fea72623          	sw	a0,-20(a4) # 10000160 <smp_lottery_args>
     17c:	10000717          	auipc	a4,0x10000
     180:	feb72423          	sw	a1,-24(a4) # 10000164 <smp_lottery_args+0x4>
     184:	10000717          	auipc	a4,0x10000
     188:	fec72223          	sw	a2,-28(a4) # 10000168 <smp_lottery_args+0x8>
     18c:	10000717          	auipc	a4,0x10000
     190:	fcd72823          	sw	a3,-48(a4) # 1000015c <smp_lottery_target>
     194:	0110000f          	fence	w,w
     198:	00100793          	li	a5,1
     19c:	10000717          	auipc	a4,0x10000
     1a0:	fcf72823          	sw	a5,-48(a4) # 1000016c <smp_lottery_lock>
     1a4:	00068067          	jr	a3

000001a8 <jsmn_parse>:
     1a8:	00050793          	mv	a5,a0
     1ac:	00452503          	lw	a0,4(a0)
     1b0:	fd010113          	addi	sp,sp,-48
     1b4:	04001f37          	lui	t5,0x4001
     1b8:	01440fb7          	lui	t6,0x1440
     1bc:	008002b7          	lui	t0,0x800
     1c0:	02812623          	sw	s0,44(sp)
     1c4:	02912423          	sw	s1,40(sp)
     1c8:	03212223          	sw	s2,36(sp)
     1cc:	03312023          	sw	s3,32(sp)
     1d0:	01412e23          	sw	s4,28(sp)
     1d4:	01512c23          	sw	s5,24(sp)
     1d8:	01612a23          	sw	s6,20(sp)
     1dc:	01712823          	sw	s7,16(sp)
     1e0:	01812623          	sw	s8,12(sp)
     1e4:	01912423          	sw	s9,8(sp)
     1e8:	01a12223          	sw	s10,4(sp)
     1ec:	01b12023          	sw	s11,0(sp)
     1f0:	03a00e93          	li	t4,58
     1f4:	05d00393          	li	t2,93
     1f8:	01f00413          	li	s0,31
     1fc:	00100e13          	li	t3,1
     200:	001f0f13          	addi	t5,t5,1 # 4001001 <_edata_rom+0x3ffb751>
     204:	05e00493          	li	s1,94
     208:	441f8f93          	addi	t6,t6,1089 # 1440441 <_edata_rom+0x143ab91>
     20c:	00900913          	li	s2,9
     210:	00500993          	li	s3,5
     214:	01328293          	addi	t0,t0,19 # 800013 <_edata_rom+0x7fa763>
     218:	0007a883          	lw	a7,0(a5)
     21c:	00c8f863          	bgeu	a7,a2,22c <jsmn_parse+0x84>
     220:	01158833          	add	a6,a1,a7
     224:	00084803          	lbu	a6,0(a6)
     228:	04081c63          	bnez	a6,280 <jsmn_parse+0xd8>
     22c:	00068e63          	beqz	a3,248 <jsmn_parse+0xa0>
     230:	0047a783          	lw	a5,4(a5)
     234:	fff78713          	addi	a4,a5,-1
     238:	00479793          	slli	a5,a5,0x4
     23c:	00f686b3          	add	a3,a3,a5
     240:	fff00793          	li	a5,-1
     244:	42075863          	bgez	a4,674 <jsmn_parse+0x4cc>
     248:	02c12403          	lw	s0,44(sp)
     24c:	02812483          	lw	s1,40(sp)
     250:	02412903          	lw	s2,36(sp)
     254:	02012983          	lw	s3,32(sp)
     258:	01c12a03          	lw	s4,28(sp)
     25c:	01812a83          	lw	s5,24(sp)
     260:	01412b03          	lw	s6,20(sp)
     264:	01012b83          	lw	s7,16(sp)
     268:	00c12c03          	lw	s8,12(sp)
     26c:	00812c83          	lw	s9,8(sp)
     270:	00412d03          	lw	s10,4(sp)
     274:	00012d83          	lw	s11,0(sp)
     278:	03010113          	addi	sp,sp,48
     27c:	00008067          	ret
     280:	2fd80063          	beq	a6,t4,560 <jsmn_parse+0x3b8>
     284:	050eea63          	bltu	t4,a6,2d8 <jsmn_parse+0x130>
     288:	02200313          	li	t1,34
     28c:	16680c63          	beq	a6,t1,404 <jsmn_parse+0x25c>
     290:	03036863          	bltu	t1,a6,2c0 <jsmn_parse+0x118>
     294:	ff780813          	addi	a6,a6,-9
     298:	0ff87813          	andi	a6,a6,255
     29c:	01700313          	li	t1,23
     2a0:	03036463          	bltu	t1,a6,2c8 <jsmn_parse+0x120>
     2a4:	010e1833          	sll	a6,t3,a6
     2a8:	00587833          	and	a6,a6,t0
     2ac:	00080e63          	beqz	a6,2c8 <jsmn_parse+0x120>
     2b0:	0007a803          	lw	a6,0(a5)
     2b4:	00180813          	addi	a6,a6,1
     2b8:	0107a023          	sw	a6,0(a5)
     2bc:	f5dff06f          	j	218 <jsmn_parse+0x70>
     2c0:	02c00313          	li	t1,44
     2c4:	2a680463          	beq	a6,t1,56c <jsmn_parse+0x3c4>
     2c8:	00a00a93          	li	s5,10
     2cc:	00d00b13          	li	s6,13
     2d0:	00800b93          	li	s7,8
     2d4:	3280006f          	j	5fc <jsmn_parse+0x454>
     2d8:	07b00313          	li	t1,123
     2dc:	04680c63          	beq	a6,t1,334 <jsmn_parse+0x18c>
     2e0:	01036e63          	bltu	t1,a6,2fc <jsmn_parse+0x154>
     2e4:	05b00313          	li	t1,91
     2e8:	04680663          	beq	a6,t1,334 <jsmn_parse+0x18c>
     2ec:	fc781ee3          	bne	a6,t2,2c8 <jsmn_parse+0x120>
     2f0:	00200b13          	li	s6,2
     2f4:	fa068ee3          	beqz	a3,2b0 <jsmn_parse+0x108>
     2f8:	0140006f          	j	30c <jsmn_parse+0x164>
     2fc:	07d00313          	li	t1,125
     300:	fc6814e3          	bne	a6,t1,2c8 <jsmn_parse+0x120>
     304:	00100b13          	li	s6,1
     308:	fa0684e3          	beqz	a3,2b0 <jsmn_parse+0x108>
     30c:	0047a303          	lw	t1,4(a5)
     310:	fff00a13          	li	s4,-1
     314:	fff30813          	addi	a6,t1,-1
     318:	00431313          	slli	t1,t1,0x4
     31c:	00668333          	add	t1,a3,t1
     320:	06085e63          	bgez	a6,39c <jsmn_parse+0x1f4>
     324:	fff00893          	li	a7,-1
     328:	f91814e3          	bne	a6,a7,2b0 <jsmn_parse+0x108>
     32c:	ffe00513          	li	a0,-2
     330:	f19ff06f          	j	248 <jsmn_parse+0xa0>
     334:	00150513          	addi	a0,a0,1
     338:	f6068ce3          	beqz	a3,2b0 <jsmn_parse+0x108>
     33c:	0047aa83          	lw	s5,4(a5)
     340:	10eafa63          	bgeu	s5,a4,454 <jsmn_parse+0x2ac>
     344:	001a8313          	addi	t1,s5,1
     348:	0067a223          	sw	t1,4(a5)
     34c:	004a9a13          	slli	s4,s5,0x4
     350:	0087a303          	lw	t1,8(a5)
     354:	01468a33          	add	s4,a3,s4
     358:	fff00b13          	li	s6,-1
     35c:	016a2423          	sw	s6,8(s4)
     360:	000a2623          	sw	zero,12(s4)
     364:	01630c63          	beq	t1,s6,37c <jsmn_parse+0x1d4>
     368:	00431313          	slli	t1,t1,0x4
     36c:	00668333          	add	t1,a3,t1
     370:	00c32b03          	lw	s6,12(t1)
     374:	001b0b13          	addi	s6,s6,1
     378:	01632623          	sw	s6,12(t1)
     37c:	07b00b13          	li	s6,123
     380:	00100313          	li	t1,1
     384:	01680463          	beq	a6,s6,38c <jsmn_parse+0x1e4>
     388:	00200313          	li	t1,2
     38c:	006a2023          	sw	t1,0(s4)
     390:	011a2223          	sw	a7,4(s4)
     394:	0157a423          	sw	s5,8(a5)
     398:	f19ff06f          	j	2b0 <jsmn_parse+0x108>
     39c:	ff432b83          	lw	s7,-12(t1)
     3a0:	ff030a93          	addi	s5,t1,-16
     3a4:	054b8263          	beq	s7,s4,3e8 <jsmn_parse+0x240>
     3a8:	ff832303          	lw	t1,-8(t1)
     3ac:	03431e63          	bne	t1,s4,3e8 <jsmn_parse+0x240>
     3b0:	000aa303          	lw	t1,0(s5)
     3b4:	f7631ce3          	bne	t1,s6,32c <jsmn_parse+0x184>
     3b8:	00188893          	addi	a7,a7,1
     3bc:	0147a423          	sw	s4,8(a5)
     3c0:	011aa423          	sw	a7,8(s5)
     3c4:	00481893          	slli	a7,a6,0x4
     3c8:	011688b3          	add	a7,a3,a7
     3cc:	fff00313          	li	t1,-1
     3d0:	0048aa03          	lw	s4,4(a7)
     3d4:	026a0063          	beq	s4,t1,3f4 <jsmn_parse+0x24c>
     3d8:	0088aa03          	lw	s4,8(a7)
     3dc:	006a1c63          	bne	s4,t1,3f4 <jsmn_parse+0x24c>
     3e0:	0107a423          	sw	a6,8(a5)
     3e4:	ecdff06f          	j	2b0 <jsmn_parse+0x108>
     3e8:	fff80813          	addi	a6,a6,-1
     3ec:	000a8313          	mv	t1,s5
     3f0:	f31ff06f          	j	320 <jsmn_parse+0x178>
     3f4:	fff80813          	addi	a6,a6,-1
     3f8:	ff088893          	addi	a7,a7,-16
     3fc:	fc681ae3          	bne	a6,t1,3d0 <jsmn_parse+0x228>
     400:	eb1ff06f          	j	2b0 <jsmn_parse+0x108>
     404:	00188a13          	addi	s4,a7,1
     408:	0147a023          	sw	s4,0(a5)
     40c:	02200a93          	li	s5,34
     410:	05c00b13          	li	s6,92
     414:	07500b93          	li	s7,117
     418:	05b00c13          	li	s8,91
     41c:	02f00c93          	li	s9,47
     420:	0007a303          	lw	t1,0(a5)
     424:	00c37863          	bgeu	t1,a2,434 <jsmn_parse+0x28c>
     428:	00658833          	add	a6,a1,t1
     42c:	00084803          	lbu	a6,0(a6)
     430:	00081863          	bnez	a6,440 <jsmn_parse+0x298>
     434:	0117a023          	sw	a7,0(a5)
     438:	ffd00513          	li	a0,-3
     43c:	e0dff06f          	j	248 <jsmn_parse+0xa0>
     440:	07581663          	bne	a6,s5,4ac <jsmn_parse+0x304>
     444:	02068e63          	beqz	a3,480 <jsmn_parse+0x2d8>
     448:	0047a803          	lw	a6,4(a5)
     44c:	00e86863          	bltu	a6,a4,45c <jsmn_parse+0x2b4>
     450:	0117a023          	sw	a7,0(a5)
     454:	fff00513          	li	a0,-1
     458:	df1ff06f          	j	248 <jsmn_parse+0xa0>
     45c:	00180893          	addi	a7,a6,1
     460:	00481813          	slli	a6,a6,0x4
     464:	0117a223          	sw	a7,4(a5)
     468:	01068833          	add	a6,a3,a6
     46c:	00300893          	li	a7,3
     470:	01182023          	sw	a7,0(a6)
     474:	01482223          	sw	s4,4(a6)
     478:	00682423          	sw	t1,8(a6)
     47c:	00082623          	sw	zero,12(a6)
     480:	0087a803          	lw	a6,8(a5)
     484:	fff00893          	li	a7,-1
     488:	00150513          	addi	a0,a0,1
     48c:	e31802e3          	beq	a6,a7,2b0 <jsmn_parse+0x108>
     490:	e20680e3          	beqz	a3,2b0 <jsmn_parse+0x108>
     494:	00481813          	slli	a6,a6,0x4
     498:	01068833          	add	a6,a3,a6
     49c:	00c82883          	lw	a7,12(a6)
     4a0:	00188893          	addi	a7,a7,1
     4a4:	01182623          	sw	a7,12(a6)
     4a8:	e09ff06f          	j	2b0 <jsmn_parse+0x108>
     4ac:	03681463          	bne	a6,s6,4d4 <jsmn_parse+0x32c>
     4b0:	00130813          	addi	a6,t1,1
     4b4:	02c87063          	bgeu	a6,a2,4d4 <jsmn_parse+0x32c>
     4b8:	0107a023          	sw	a6,0(a5)
     4bc:	01058833          	add	a6,a1,a6
     4c0:	00084803          	lbu	a6,0(a6)
     4c4:	070bea63          	bltu	s7,a6,538 <jsmn_parse+0x390>
     4c8:	010c6e63          	bltu	s8,a6,4e4 <jsmn_parse+0x33c>
     4cc:	01580463          	beq	a6,s5,4d4 <jsmn_parse+0x32c>
     4d0:	07981463          	bne	a6,s9,538 <jsmn_parse+0x390>
     4d4:	0007a803          	lw	a6,0(a5)
     4d8:	00180813          	addi	a6,a6,1
     4dc:	0107a023          	sw	a6,0(a5)
     4e0:	f41ff06f          	j	420 <jsmn_parse+0x278>
     4e4:	fa480813          	addi	a6,a6,-92
     4e8:	010e1833          	sll	a6,t3,a6
     4ec:	01f87d33          	and	s10,a6,t6
     4f0:	fe0d12e3          	bnez	s10,4d4 <jsmn_parse+0x32c>
     4f4:	00681d13          	slli	s10,a6,0x6
     4f8:	040d5063          	bgez	s10,538 <jsmn_parse+0x390>
     4fc:	00230313          	addi	t1,t1,2
     500:	0067a023          	sw	t1,0(a5)
     504:	00400d13          	li	s10,4
     508:	0007a303          	lw	t1,0(a5)
     50c:	04c37263          	bgeu	t1,a2,550 <jsmn_parse+0x3a8>
     510:	00658833          	add	a6,a1,t1
     514:	00084803          	lbu	a6,0(a6)
     518:	02080c63          	beqz	a6,550 <jsmn_parse+0x3a8>
     51c:	fd080d93          	addi	s11,a6,-48
     520:	0ffdfd93          	andi	s11,s11,255
     524:	01b97e63          	bgeu	s2,s11,540 <jsmn_parse+0x398>
     528:	fdf87813          	andi	a6,a6,-33
     52c:	fbf80813          	addi	a6,a6,-65
     530:	0ff87813          	andi	a6,a6,255
     534:	0109f663          	bgeu	s3,a6,540 <jsmn_parse+0x398>
     538:	0117a023          	sw	a7,0(a5)
     53c:	df1ff06f          	j	32c <jsmn_parse+0x184>
     540:	00130313          	addi	t1,t1,1
     544:	0067a023          	sw	t1,0(a5)
     548:	fffd0d13          	addi	s10,s10,-1
     54c:	fa0d1ee3          	bnez	s10,508 <jsmn_parse+0x360>
     550:	0007a803          	lw	a6,0(a5)
     554:	fff80813          	addi	a6,a6,-1
     558:	0107a023          	sw	a6,0(a5)
     55c:	f79ff06f          	j	4d4 <jsmn_parse+0x32c>
     560:	0047a803          	lw	a6,4(a5)
     564:	fff80813          	addi	a6,a6,-1
     568:	e79ff06f          	j	3e0 <jsmn_parse+0x238>
     56c:	d40682e3          	beqz	a3,2b0 <jsmn_parse+0x108>
     570:	0087a803          	lw	a6,8(a5)
     574:	fff00893          	li	a7,-1
     578:	d3180ce3          	beq	a6,a7,2b0 <jsmn_parse+0x108>
     57c:	00481813          	slli	a6,a6,0x4
     580:	01068833          	add	a6,a3,a6
     584:	00082803          	lw	a6,0(a6)
     588:	fff80813          	addi	a6,a6,-1
     58c:	d30e72e3          	bgeu	t3,a6,2b0 <jsmn_parse+0x108>
     590:	0047a803          	lw	a6,4(a5)
     594:	fff00a13          	li	s4,-1
     598:	fff80893          	addi	a7,a6,-1
     59c:	00481813          	slli	a6,a6,0x4
     5a0:	01068833          	add	a6,a3,a6
     5a4:	d008c6e3          	bltz	a7,2b0 <jsmn_parse+0x108>
     5a8:	ff082303          	lw	t1,-16(a6)
     5ac:	fff30313          	addi	t1,t1,-1
     5b0:	006e6e63          	bltu	t3,t1,5cc <jsmn_parse+0x424>
     5b4:	ff482303          	lw	t1,-12(a6)
     5b8:	01430a63          	beq	t1,s4,5cc <jsmn_parse+0x424>
     5bc:	ff882303          	lw	t1,-8(a6)
     5c0:	01431663          	bne	t1,s4,5cc <jsmn_parse+0x424>
     5c4:	0117a423          	sw	a7,8(a5)
     5c8:	ce9ff06f          	j	2b0 <jsmn_parse+0x108>
     5cc:	fff88893          	addi	a7,a7,-1
     5d0:	ff080813          	addi	a6,a6,-16
     5d4:	fd1ff06f          	j	5a4 <jsmn_parse+0x3fc>
     5d8:	fe080a13          	addi	s4,a6,-32
     5dc:	014e1a33          	sll	s4,t3,s4
     5e0:	01ea7a33          	and	s4,s4,t5
     5e4:	020a1e63          	bnez	s4,620 <jsmn_parse+0x478>
     5e8:	fe080813          	addi	a6,a6,-32
     5ec:	0ff87813          	andi	a6,a6,255
     5f0:	f504e4e3          	bltu	s1,a6,538 <jsmn_parse+0x390>
     5f4:	00130313          	addi	t1,t1,1
     5f8:	0067a023          	sw	t1,0(a5)
     5fc:	0007a303          	lw	t1,0(a5)
     600:	02c37063          	bgeu	t1,a2,620 <jsmn_parse+0x478>
     604:	00658833          	add	a6,a1,t1
     608:	00084803          	lbu	a6,0(a6)
     60c:	00080a63          	beqz	a6,620 <jsmn_parse+0x478>
     610:	030ee463          	bltu	t4,a6,638 <jsmn_parse+0x490>
     614:	fd0462e3          	bltu	s0,a6,5d8 <jsmn_parse+0x430>
     618:	010aec63          	bltu	s5,a6,630 <jsmn_parse+0x488>
     61c:	fd0bf6e3          	bgeu	s7,a6,5e8 <jsmn_parse+0x440>
     620:	02069263          	bnez	a3,644 <jsmn_parse+0x49c>
     624:	fff30313          	addi	t1,t1,-1
     628:	0067a023          	sw	t1,0(a5)
     62c:	e55ff06f          	j	480 <jsmn_parse+0x2d8>
     630:	fb681ce3          	bne	a6,s6,5e8 <jsmn_parse+0x440>
     634:	fedff06f          	j	620 <jsmn_parse+0x478>
     638:	0df87a13          	andi	s4,a6,223
     63c:	fa7a16e3          	bne	s4,t2,5e8 <jsmn_parse+0x440>
     640:	fe1ff06f          	j	620 <jsmn_parse+0x478>
     644:	0047a803          	lw	a6,4(a5)
     648:	e0e874e3          	bgeu	a6,a4,450 <jsmn_parse+0x2a8>
     64c:	00180a13          	addi	s4,a6,1
     650:	00481813          	slli	a6,a6,0x4
     654:	0147a223          	sw	s4,4(a5)
     658:	01068833          	add	a6,a3,a6
     65c:	00400a13          	li	s4,4
     660:	01482023          	sw	s4,0(a6)
     664:	01182223          	sw	a7,4(a6)
     668:	00682423          	sw	t1,8(a6)
     66c:	00082623          	sw	zero,12(a6)
     670:	fb5ff06f          	j	624 <jsmn_parse+0x47c>
     674:	ff46a603          	lw	a2,-12(a3)
     678:	00f60663          	beq	a2,a5,684 <jsmn_parse+0x4dc>
     67c:	ff86a603          	lw	a2,-8(a3)
     680:	daf60ce3          	beq	a2,a5,438 <jsmn_parse+0x290>
     684:	fff70713          	addi	a4,a4,-1
     688:	ff068693          	addi	a3,a3,-16
     68c:	bb9ff06f          	j	244 <jsmn_parse+0x9c>

00000690 <jsmn_init>:
     690:	fff00793          	li	a5,-1
     694:	00052023          	sw	zero,0(a0)
     698:	00052223          	sw	zero,4(a0)
     69c:	00f52423          	sw	a5,8(a0)
     6a0:	00008067          	ret

000006a4 <boot>:
     6a4:	fe010113          	addi	sp,sp,-32
     6a8:	00812c23          	sw	s0,24(sp)
     6ac:	00050413          	mv	s0,a0
     6b0:	00004537          	lui	a0,0x4
     6b4:	00912a23          	sw	s1,20(sp)
     6b8:	f9850513          	addi	a0,a0,-104 # 3f98 <_etext>
     6bc:	00058493          	mv	s1,a1
     6c0:	00068593          	mv	a1,a3
     6c4:	00112e23          	sw	ra,28(sp)
     6c8:	00c12623          	sw	a2,12(sp)
     6cc:	00d12423          	sw	a3,8(sp)
     6d0:	744010ef          	jal	ra,1e14 <printf>
     6d4:	00004537          	lui	a0,0x4
     6d8:	fc050513          	addi	a0,a0,-64 # 3fc0 <_etext+0x28>
     6dc:	738010ef          	jal	ra,1e14 <printf>
     6e0:	300030ef          	jal	ra,39e0 <uart_sync>
     6e4:	f0c027b7          	lui	a5,0xf0c02
     6e8:	0007a023          	sw	zero,0(a5) # f0c02000 <_fstack+0xe0c01000>
     6ec:	30047073          	csrci	mstatus,8
     6f0:	0000100f          	fence.i
     6f4:	00000013          	nop
     6f8:	00000013          	nop
     6fc:	00000013          	nop
     700:	00000013          	nop
     704:	00000013          	nop
     708:	0000500f          	0x500f
     70c:	730020ef          	jal	ra,2e3c <flush_l2_cache>
     710:	00812683          	lw	a3,8(sp)
     714:	00c12603          	lw	a2,12(sp)
     718:	00048593          	mv	a1,s1
     71c:	00040513          	mv	a0,s0
     720:	a55ff0ef          	jal	ra,174 <boot_helper>
     724:	0000006f          	j	724 <boot+0x80>

00000728 <serialboot>:
     728:	00004537          	lui	a0,0x4
     72c:	ec010113          	addi	sp,sp,-320
     730:	ff450513          	addi	a0,a0,-12 # 3ff4 <_etext+0x5c>
     734:	12112e23          	sw	ra,316(sp)
     738:	12812c23          	sw	s0,312(sp)
     73c:	13212823          	sw	s2,304(sp)
     740:	12912a23          	sw	s1,308(sp)
     744:	13312623          	sw	s3,300(sp)
     748:	13412423          	sw	s4,296(sp)
     74c:	13512223          	sw	s5,292(sp)
     750:	13612023          	sw	s6,288(sp)
     754:	11712e23          	sw	s7,284(sp)
     758:	6bc010ef          	jal	ra,1e14 <printf>
     75c:	00004537          	lui	a0,0x4
     760:	00c50513          	addi	a0,a0,12 # 400c <_etext+0x74>
     764:	6b0010ef          	jal	ra,1e14 <printf>
     768:	000047b7          	lui	a5,0x4
     76c:	07878413          	addi	s0,a5,120 # 4078 <str.2752>
     770:	07878913          	addi	s2,a5,120
     774:	00044503          	lbu	a0,0(s0)
     778:	04051a63          	bnez	a0,7cc <serialboot+0xa4>
     77c:	f00027b7          	lui	a5,0xf0002
     780:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
     784:	00bec737          	lui	a4,0xbec
     788:	8007a223          	sw	zero,-2044(a5)
     78c:	c2070713          	addi	a4,a4,-992 # bebc20 <_edata_rom+0xbe6370>
     790:	80e7a023          	sw	a4,-2048(a5)
     794:	00100713          	li	a4,1
     798:	80e7a423          	sw	a4,-2040(a5)
     79c:	80e7a623          	sw	a4,-2036(a5)
     7a0:	00000413          	li	s0,0
     7a4:	f00024b7          	lui	s1,0xf0002
     7a8:	05100993          	li	s3,81
     7ac:	01b00a13          	li	s4,27
     7b0:	00e00a93          	li	s5,14
     7b4:	00100b13          	li	s6,1
     7b8:	8104a783          	lw	a5,-2032(s1) # f0001810 <_fstack+0xe0000810>
     7bc:	00079e63          	bnez	a5,7d8 <serialboot+0xb0>
     7c0:	00004537          	lui	a0,0x4
     7c4:	06050513          	addi	a0,a0,96 # 4060 <_etext+0xc8>
     7c8:	1480006f          	j	910 <serialboot+0x1e8>
     7cc:	104030ef          	jal	ra,38d0 <uart_write>
     7d0:	00140413          	addi	s0,s0,1
     7d4:	fa1ff06f          	j	774 <serialboot+0x4c>
     7d8:	0dc030ef          	jal	ra,38b4 <uart_read_nonblock>
     7dc:	08050c63          	beqz	a0,874 <serialboot+0x14c>
     7e0:	080030ef          	jal	ra,3860 <uart_read>
     7e4:	23350063          	beq	a0,s3,a04 <serialboot+0x2dc>
     7e8:	21450e63          	beq	a0,s4,a04 <serialboot+0x2dc>
     7ec:	008907b3          	add	a5,s2,s0
     7f0:	0107c783          	lbu	a5,16(a5)
     7f4:	06a79c63          	bne	a5,a0,86c <serialboot+0x144>
     7f8:	00140413          	addi	s0,s0,1
     7fc:	07541c63          	bne	s0,s5,874 <serialboot+0x14c>
     800:	00beca37          	lui	s4,0xbec
     804:	00000493          	li	s1,0
     808:	00100993          	li	s3,1
     80c:	f0002937          	lui	s2,0xf0002
     810:	c20a0a13          	addi	s4,s4,-992 # bebc20 <_edata_rom+0xbe6370>
     814:	00100a93          	li	s5,1
     818:	00000413          	li	s0,0
     81c:	00200b13          	li	s6,2
     820:	00300b93          	li	s7,3
     824:	090030ef          	jal	ra,38b4 <uart_read_nonblock>
     828:	02050463          	beqz	a0,850 <serialboot+0x128>
     82c:	04041863          	bnez	s0,87c <serialboot+0x154>
     830:	80092423          	sw	zero,-2040(s2) # f0001808 <_fstack+0xe0000808>
     834:	80092223          	sw	zero,-2044(s2)
     838:	81492023          	sw	s4,-2048(s2)
     83c:	81392423          	sw	s3,-2040(s2)
     840:	81392623          	sw	s3,-2036(s2)
     844:	01c030ef          	jal	ra,3860 <uart_read>
     848:	00a10623          	sb	a0,12(sp)
     84c:	00140413          	addi	s0,s0,1
     850:	81392623          	sw	s3,-2036(s2)
     854:	fc0408e3          	beqz	s0,824 <serialboot+0xfc>
     858:	81092783          	lw	a5,-2032(s2)
     85c:	fc0794e3          	bnez	a5,824 <serialboot+0xfc>
     860:	04500513          	li	a0,69
     864:	06c030ef          	jal	ra,38d0 <uart_write>
     868:	fb1ff06f          	j	818 <serialboot+0xf0>
     86c:	f8650513          	addi	a0,a0,-122
     870:	00153413          	seqz	s0,a0
     874:	8164a623          	sw	s6,-2036(s1)
     878:	f41ff06f          	j	7b8 <serialboot+0x90>
     87c:	01340a63          	beq	s0,s3,890 <serialboot+0x168>
     880:	01641e63          	bne	s0,s6,89c <serialboot+0x174>
     884:	7dd020ef          	jal	ra,3860 <uart_read>
     888:	00a10723          	sb	a0,14(sp)
     88c:	fc1ff06f          	j	84c <serialboot+0x124>
     890:	7d1020ef          	jal	ra,3860 <uart_read>
     894:	00a106a3          	sb	a0,13(sp)
     898:	fb5ff06f          	j	84c <serialboot+0x124>
     89c:	07740e63          	beq	s0,s7,918 <serialboot+0x1f0>
     8a0:	fa8bd6e3          	bge	s7,s0,84c <serialboot+0x124>
     8a4:	7bd020ef          	jal	ra,3860 <uart_read>
     8a8:	00c14583          	lbu	a1,12(sp)
     8ac:	11010793          	addi	a5,sp,272
     8b0:	008787b3          	add	a5,a5,s0
     8b4:	eea78e23          	sb	a0,-260(a5)
     8b8:	00358793          	addi	a5,a1,3
     8bc:	f88798e3          	bne	a5,s0,84c <serialboot+0x124>
     8c0:	00e14783          	lbu	a5,14(sp)
     8c4:	00d14703          	lbu	a4,13(sp)
     8c8:	00158593          	addi	a1,a1,1
     8cc:	00879793          	slli	a5,a5,0x8
     8d0:	00e7e7b3          	or	a5,a5,a4
     8d4:	00879413          	slli	s0,a5,0x8
     8d8:	0087d793          	srli	a5,a5,0x8
     8dc:	00f467b3          	or	a5,s0,a5
     8e0:	01079413          	slli	s0,a5,0x10
     8e4:	00f10513          	addi	a0,sp,15
     8e8:	01045413          	srli	s0,s0,0x10
     8ec:	380020ef          	jal	ra,2c6c <crc16>
     8f0:	02850a63          	beq	a0,s0,924 <serialboot+0x1fc>
     8f4:	04300513          	li	a0,67
     8f8:	7d9020ef          	jal	ra,38d0 <uart_write>
     8fc:	00148493          	addi	s1,s1,1
     900:	10000793          	li	a5,256
     904:	f0f49ae3          	bne	s1,a5,818 <serialboot+0xf0>
     908:	00004537          	lui	a0,0x4
     90c:	03850513          	addi	a0,a0,56 # 4038 <_etext+0xa0>
     910:	504010ef          	jal	ra,1e14 <printf>
     914:	0280006f          	j	93c <serialboot+0x214>
     918:	749020ef          	jal	ra,3860 <uart_read>
     91c:	00a107a3          	sb	a0,15(sp)
     920:	f2dff06f          	j	84c <serialboot+0x124>
     924:	00f14783          	lbu	a5,15(sp)
     928:	05578263          	beq	a5,s5,96c <serialboot+0x244>
     92c:	09678463          	beq	a5,s6,9b4 <serialboot+0x28c>
     930:	0c079263          	bnez	a5,9f4 <serialboot+0x2cc>
     934:	04b00513          	li	a0,75
     938:	799020ef          	jal	ra,38d0 <uart_write>
     93c:	00100513          	li	a0,1
     940:	13c12083          	lw	ra,316(sp)
     944:	13812403          	lw	s0,312(sp)
     948:	13412483          	lw	s1,308(sp)
     94c:	13012903          	lw	s2,304(sp)
     950:	12c12983          	lw	s3,300(sp)
     954:	12812a03          	lw	s4,296(sp)
     958:	12412a83          	lw	s5,292(sp)
     95c:	12012b03          	lw	s6,288(sp)
     960:	11c12b83          	lw	s7,284(sp)
     964:	14010113          	addi	sp,sp,320
     968:	00008067          	ret
     96c:	01014783          	lbu	a5,16(sp)
     970:	01114503          	lbu	a0,17(sp)
     974:	00c14603          	lbu	a2,12(sp)
     978:	01879793          	slli	a5,a5,0x18
     97c:	01051513          	slli	a0,a0,0x10
     980:	00a7e7b3          	or	a5,a5,a0
     984:	01314503          	lbu	a0,19(sp)
     988:	ffc60613          	addi	a2,a2,-4
     98c:	01410593          	addi	a1,sp,20
     990:	00a7e7b3          	or	a5,a5,a0
     994:	01214503          	lbu	a0,18(sp)
     998:	00000493          	li	s1,0
     99c:	00851513          	slli	a0,a0,0x8
     9a0:	00a7e533          	or	a0,a5,a0
     9a4:	31c010ef          	jal	ra,1cc0 <memcpy>
     9a8:	04b00513          	li	a0,75
     9ac:	725020ef          	jal	ra,38d0 <uart_write>
     9b0:	e69ff06f          	j	818 <serialboot+0xf0>
     9b4:	04b00513          	li	a0,75
     9b8:	719020ef          	jal	ra,38d0 <uart_write>
     9bc:	01014783          	lbu	a5,16(sp)
     9c0:	01114683          	lbu	a3,17(sp)
     9c4:	00000613          	li	a2,0
     9c8:	01879793          	slli	a5,a5,0x18
     9cc:	01069693          	slli	a3,a3,0x10
     9d0:	00d7e7b3          	or	a5,a5,a3
     9d4:	01314683          	lbu	a3,19(sp)
     9d8:	00000593          	li	a1,0
     9dc:	00000513          	li	a0,0
     9e0:	00d7e7b3          	or	a5,a5,a3
     9e4:	01214683          	lbu	a3,18(sp)
     9e8:	00869693          	slli	a3,a3,0x8
     9ec:	00d7e6b3          	or	a3,a5,a3
     9f0:	cb5ff0ef          	jal	ra,6a4 <boot>
     9f4:	05500513          	li	a0,85
     9f8:	00148493          	addi	s1,s1,1
     9fc:	6d5020ef          	jal	ra,38d0 <uart_write>
     a00:	f01ff06f          	j	900 <serialboot+0x1d8>
     a04:	00004537          	lui	a0,0x4
     a08:	06c50513          	addi	a0,a0,108 # 406c <_etext+0xd4>
     a0c:	408010ef          	jal	ra,1e14 <printf>
     a10:	00000513          	li	a0,0
     a14:	f2dff06f          	j	940 <serialboot+0x218>

00000a18 <dump_bytes>:
     a18:	fc010113          	addi	sp,sp,-64
     a1c:	000057b7          	lui	a5,0x5
     a20:	02912a23          	sw	s1,52(sp)
     a24:	00058493          	mv	s1,a1
     a28:	7207a583          	lw	a1,1824(a5) # 5720 <stdout>
     a2c:	03212823          	sw	s2,48(sp)
     a30:	00050913          	mv	s2,a0
     a34:	00004537          	lui	a0,0x4
     a38:	09850513          	addi	a0,a0,152 # 4098 <str.2739+0x10>
     a3c:	03312623          	sw	s3,44(sp)
     a40:	03412423          	sw	s4,40(sp)
     a44:	03512223          	sw	s5,36(sp)
     a48:	03612023          	sw	s6,32(sp)
     a4c:	01712e23          	sw	s7,28(sp)
     a50:	02112e23          	sw	ra,60(sp)
     a54:	02812c23          	sw	s0,56(sp)
     a58:	01812c23          	sw	s8,24(sp)
     a5c:	01912a23          	sw	s9,20(sp)
     a60:	00060993          	mv	s3,a2
     a64:	00004ab7          	lui	s5,0x4
     a68:	33c010ef          	jal	ra,1da4 <fputs>
     a6c:	00005a37          	lui	s4,0x5
     a70:	00004b37          	lui	s6,0x4
     a74:	00004bb7          	lui	s7,0x4
     a78:	04904063          	bgtz	s1,ab8 <dump_bytes+0xa0>
     a7c:	03812403          	lw	s0,56(sp)
     a80:	03c12083          	lw	ra,60(sp)
     a84:	03412483          	lw	s1,52(sp)
     a88:	03012903          	lw	s2,48(sp)
     a8c:	02c12983          	lw	s3,44(sp)
     a90:	02812a03          	lw	s4,40(sp)
     a94:	02412a83          	lw	s5,36(sp)
     a98:	02012b03          	lw	s6,32(sp)
     a9c:	01c12b83          	lw	s7,28(sp)
     aa0:	01812c03          	lw	s8,24(sp)
     aa4:	01412c83          	lw	s9,20(sp)
     aa8:	00005537          	lui	a0,0x5
     aac:	65450513          	addi	a0,a0,1620 # 5654 <crc_table+0x63c>
     ab0:	04010113          	addi	sp,sp,64
     ab4:	3600106f          	j	1e14 <printf>
     ab8:	01000793          	li	a5,16
     abc:	00048413          	mv	s0,s1
     ac0:	0097d463          	bge	a5,s1,ac8 <dump_bytes+0xb0>
     ac4:	01000413          	li	s0,16
     ac8:	00000793          	li	a5,0
     acc:	00f906b3          	add	a3,s2,a5
     ad0:	0006a683          	lw	a3,0(a3)
     ad4:	00f10733          	add	a4,sp,a5
     ad8:	00478793          	addi	a5,a5,4
     adc:	00d72023          	sw	a3,0(a4)
     ae0:	fe87c6e3          	blt	a5,s0,acc <dump_bytes+0xb4>
     ae4:	fff40793          	addi	a5,s0,-1
     ae8:	ffc7f793          	andi	a5,a5,-4
     aec:	00004537          	lui	a0,0x4
     af0:	00478793          	addi	a5,a5,4
     af4:	00098593          	mv	a1,s3
     af8:	0a850513          	addi	a0,a0,168 # 40a8 <str.2739+0x20>
     afc:	00f90933          	add	s2,s2,a5
     b00:	00000c13          	li	s8,0
     b04:	310010ef          	jal	ra,1e14 <printf>
     b08:	00004cb7          	lui	s9,0x4
     b0c:	018107b3          	add	a5,sp,s8
     b10:	0007c583          	lbu	a1,0(a5)
     b14:	0b4c8513          	addi	a0,s9,180 # 40b4 <str.2739+0x2c>
     b18:	001c0c13          	addi	s8,s8,1
     b1c:	2f8010ef          	jal	ra,1e14 <printf>
     b20:	ff8416e3          	bne	s0,s8,b0c <dump_bytes+0xf4>
     b24:	00040c13          	mv	s8,s0
     b28:	01000c93          	li	s9,16
     b2c:	059c1863          	bne	s8,s9,b7c <dump_bytes+0x164>
     b30:	a94a0513          	addi	a0,s4,-1388 # 4a94 <str.2739+0xa0c>
     b34:	2e0010ef          	jal	ra,1e14 <printf>
     b38:	00000c13          	li	s8,0
     b3c:	05e00c93          	li	s9,94
     b40:	018107b3          	add	a5,sp,s8
     b44:	0007c583          	lbu	a1,0(a5)
     b48:	fe058793          	addi	a5,a1,-32
     b4c:	0ff7f793          	andi	a5,a5,255
     b50:	02fcfe63          	bgeu	s9,a5,b8c <dump_bytes+0x174>
     b54:	0c0b8513          	addi	a0,s7,192 # 40c0 <str.2739+0x38>
     b58:	2bc010ef          	jal	ra,1e14 <printf>
     b5c:	001c0c13          	addi	s8,s8,1
     b60:	ff8410e3          	bne	s0,s8,b40 <dump_bytes+0x128>
     b64:	00040c13          	mv	s8,s0
     b68:	01000c93          	li	s9,16
     b6c:	039c1663          	bne	s8,s9,b98 <dump_bytes+0x180>
     b70:	408484b3          	sub	s1,s1,s0
     b74:	008989b3          	add	s3,s3,s0
     b78:	f01ff06f          	j	a78 <dump_bytes+0x60>
     b7c:	0bca8513          	addi	a0,s5,188 # 40bc <str.2739+0x34>
     b80:	294010ef          	jal	ra,1e14 <printf>
     b84:	001c0c13          	addi	s8,s8,1
     b88:	fa5ff06f          	j	b2c <dump_bytes+0x114>
     b8c:	0c4b0513          	addi	a0,s6,196 # 40c4 <str.2739+0x3c>
     b90:	284010ef          	jal	ra,1e14 <printf>
     b94:	fc9ff06f          	j	b5c <dump_bytes+0x144>
     b98:	a94a0513          	addi	a0,s4,-1388
     b9c:	278010ef          	jal	ra,1e14 <printf>
     ba0:	001c0c13          	addi	s8,s8,1
     ba4:	fc9ff06f          	j	b6c <dump_bytes+0x154>

00000ba8 <crcbios>:
     ba8:	ff010113          	addi	sp,sp,-16
     bac:	000065b7          	lui	a1,0x6
     bb0:	00812423          	sw	s0,8(sp)
     bb4:	00000793          	li	a5,0
     bb8:	8b05a403          	lw	s0,-1872(a1) # 58b0 <_edata_rom>
     bbc:	8b058593          	addi	a1,a1,-1872
     bc0:	40f585b3          	sub	a1,a1,a5
     bc4:	00000513          	li	a0,0
     bc8:	00112623          	sw	ra,12(sp)
     bcc:	0f0020ef          	jal	ra,2cbc <crc32>
     bd0:	02a41063          	bne	s0,a0,bf0 <crcbios+0x48>
     bd4:	00040593          	mv	a1,s0
     bd8:	00812403          	lw	s0,8(sp)
     bdc:	00c12083          	lw	ra,12(sp)
     be0:	00004537          	lui	a0,0x4
     be4:	0c850513          	addi	a0,a0,200 # 40c8 <str.2739+0x40>
     be8:	01010113          	addi	sp,sp,16
     bec:	2280106f          	j	1e14 <printf>
     bf0:	00050613          	mv	a2,a0
     bf4:	00004537          	lui	a0,0x4
     bf8:	00040593          	mv	a1,s0
     bfc:	0e450513          	addi	a0,a0,228 # 40e4 <str.2739+0x5c>
     c00:	214010ef          	jal	ra,1e14 <printf>
     c04:	00812403          	lw	s0,8(sp)
     c08:	00c12083          	lw	ra,12(sp)
     c0c:	00004537          	lui	a0,0x4
     c10:	11050513          	addi	a0,a0,272 # 4110 <str.2739+0x88>
     c14:	01010113          	addi	sp,sp,16
     c18:	1fc0106f          	j	1e14 <printf>

00000c1c <get_param>:
     c1c:	00060793          	mv	a5,a2
     c20:	02060713          	addi	a4,a2,32
     c24:	0007a023          	sw	zero,0(a5)
     c28:	00478793          	addi	a5,a5,4
     c2c:	fee79ce3          	bne	a5,a4,c24 <get_param+0x8>
     c30:	00a5a023          	sw	a0,0(a1)
     c34:	02000713          	li	a4,32
     c38:	00054783          	lbu	a5,0(a0)
     c3c:	04e78e63          	beq	a5,a4,c98 <get_param+0x7c>
     c40:	00079663          	bnez	a5,c4c <get_param+0x30>
     c44:	00000513          	li	a0,0
     c48:	00008067          	ret
     c4c:	00150513          	addi	a0,a0,1
     c50:	fe9ff06f          	j	c38 <get_param+0x1c>
     c54:	00178793          	addi	a5,a5,1
     c58:	02c0006f          	j	c84 <get_param+0x68>
     c5c:	00078023          	sb	zero,0(a5)
     c60:	00068513          	mv	a0,a3
     c64:	00178793          	addi	a5,a5,1
     c68:	0007c683          	lbu	a3,0(a5)
     c6c:	fee68ce3          	beq	a3,a4,c64 <get_param+0x48>
     c70:	02068e63          	beqz	a3,cac <get_param+0x90>
     c74:	00150693          	addi	a3,a0,1
     c78:	00251513          	slli	a0,a0,0x2
     c7c:	00a60533          	add	a0,a2,a0
     c80:	00f52023          	sw	a5,0(a0)
     c84:	0007c583          	lbu	a1,0(a5)
     c88:	fce58ae3          	beq	a1,a4,c5c <get_param+0x40>
     c8c:	fc0594e3          	bnez	a1,c54 <get_param+0x38>
     c90:	00068513          	mv	a0,a3
     c94:	00008067          	ret
     c98:	00150793          	addi	a5,a0,1
     c9c:	00050023          	sb	zero,0(a0)
     ca0:	02000713          	li	a4,32
     ca4:	00000513          	li	a0,0
     ca8:	fc1ff06f          	j	c68 <get_param+0x4c>
     cac:	00008067          	ret

00000cb0 <command_dispatcher>:
     cb0:	fe010113          	addi	sp,sp,-32
     cb4:	00812c23          	sw	s0,24(sp)
     cb8:	00912a23          	sw	s1,20(sp)
     cbc:	00005437          	lui	s0,0x5
     cc0:	000054b7          	lui	s1,0x5
     cc4:	01212823          	sw	s2,16(sp)
     cc8:	01312623          	sw	s3,12(sp)
     ccc:	01412423          	sw	s4,8(sp)
     cd0:	00112e23          	sw	ra,28(sp)
     cd4:	00050913          	mv	s2,a0
     cd8:	00058993          	mv	s3,a1
     cdc:	00060a13          	mv	s4,a2
     ce0:	72440413          	addi	s0,s0,1828 # 5724 <__bios_cmd_leds>
     ce4:	77048493          	addi	s1,s1,1904 # 5770 <_fdata_rom>
     ce8:	00941663          	bne	s0,s1,cf4 <command_dispatcher+0x44>
     cec:	00000513          	li	a0,0
     cf0:	0300006f          	j	d20 <command_dispatcher+0x70>
     cf4:	00042783          	lw	a5,0(s0)
     cf8:	00090513          	mv	a0,s2
     cfc:	0047a583          	lw	a1,4(a5)
     d00:	7e5000ef          	jal	ra,1ce4 <strcmp>
     d04:	02051e63          	bnez	a0,d40 <command_dispatcher+0x90>
     d08:	00042783          	lw	a5,0(s0)
     d0c:	00098513          	mv	a0,s3
     d10:	000a0593          	mv	a1,s4
     d14:	0007a783          	lw	a5,0(a5)
     d18:	000780e7          	jalr	a5
     d1c:	00042503          	lw	a0,0(s0)
     d20:	01c12083          	lw	ra,28(sp)
     d24:	01812403          	lw	s0,24(sp)
     d28:	01412483          	lw	s1,20(sp)
     d2c:	01012903          	lw	s2,16(sp)
     d30:	00c12983          	lw	s3,12(sp)
     d34:	00812a03          	lw	s4,8(sp)
     d38:	02010113          	addi	sp,sp,32
     d3c:	00008067          	ret
     d40:	00440413          	addi	s0,s0,4
     d44:	fa5ff06f          	j	ce8 <command_dispatcher+0x38>

00000d48 <init_dispatcher>:
     d48:	ff010113          	addi	sp,sp,-16
     d4c:	00812423          	sw	s0,8(sp)
     d50:	00912223          	sw	s1,4(sp)
     d54:	00005437          	lui	s0,0x5
     d58:	000054b7          	lui	s1,0x5
     d5c:	00112623          	sw	ra,12(sp)
     d60:	77040413          	addi	s0,s0,1904 # 5770 <_fdata_rom>
     d64:	77048493          	addi	s1,s1,1904 # 5770 <_fdata_rom>
     d68:	00941c63          	bne	s0,s1,d80 <init_dispatcher+0x38>
     d6c:	00c12083          	lw	ra,12(sp)
     d70:	00812403          	lw	s0,8(sp)
     d74:	00412483          	lw	s1,4(sp)
     d78:	01010113          	addi	sp,sp,16
     d7c:	00008067          	ret
     d80:	00042783          	lw	a5,0(s0)
     d84:	00440413          	addi	s0,s0,4
     d88:	000780e7          	jalr	a5
     d8c:	fddff06f          	j	d68 <init_dispatcher+0x20>

00000d90 <flush_cpu_dcache>:
     d90:	0000500f          	0x500f
     d94:	00008067          	ret

00000d98 <help_handler>:
     d98:	fe010113          	addi	sp,sp,-32
     d9c:	00004537          	lui	a0,0x4
     da0:	01212823          	sw	s2,16(sp)
     da4:	01312623          	sw	s3,12(sp)
     da8:	14850513          	addi	a0,a0,328 # 4148 <str.2739+0xc0>
     dac:	00005937          	lui	s2,0x5
     db0:	000049b7          	lui	s3,0x4
     db4:	00912a23          	sw	s1,20(sp)
     db8:	01412423          	sw	s4,8(sp)
     dbc:	01512223          	sw	s5,4(sp)
     dc0:	01612023          	sw	s6,0(sp)
     dc4:	00112e23          	sw	ra,28(sp)
     dc8:	00812c23          	sw	s0,24(sp)
     dcc:	00000493          	li	s1,0
     dd0:	08c010ef          	jal	ra,1e5c <puts>
     dd4:	00005a37          	lui	s4,0x5
     dd8:	77090913          	addi	s2,s2,1904 # 5770 <_fdata_rom>
     ddc:	00004ab7          	lui	s5,0x4
     de0:	14498993          	addi	s3,s3,324 # 4144 <str.2739+0xbc>
     de4:	00005b37          	lui	s6,0x5
     de8:	00000713          	li	a4,0
     dec:	724a0413          	addi	s0,s4,1828 # 5724 <__bios_cmd_leds>
     df0:	0300006f          	j	e20 <help_handler+0x88>
     df4:	00042783          	lw	a5,0(s0)
     df8:	00c7a683          	lw	a3,12(a5)
     dfc:	02969063          	bne	a3,s1,e1c <help_handler+0x84>
     e00:	0087a603          	lw	a2,8(a5)
     e04:	0047a583          	lw	a1,4(a5)
     e08:	00061463          	bnez	a2,e10 <help_handler+0x78>
     e0c:	00098613          	mv	a2,s3
     e10:	16ca8513          	addi	a0,s5,364 # 416c <str.2739+0xe4>
     e14:	000010ef          	jal	ra,1e14 <printf>
     e18:	00100713          	li	a4,1
     e1c:	00440413          	addi	s0,s0,4
     e20:	fd241ae3          	bne	s0,s2,df4 <help_handler+0x5c>
     e24:	00070663          	beqz	a4,e30 <help_handler+0x98>
     e28:	654b0513          	addi	a0,s6,1620 # 5654 <crc_table+0x63c>
     e2c:	7e9000ef          	jal	ra,1e14 <printf>
     e30:	00148493          	addi	s1,s1,1
     e34:	00900793          	li	a5,9
     e38:	faf498e3          	bne	s1,a5,de8 <help_handler+0x50>
     e3c:	01c12083          	lw	ra,28(sp)
     e40:	01812403          	lw	s0,24(sp)
     e44:	01412483          	lw	s1,20(sp)
     e48:	01012903          	lw	s2,16(sp)
     e4c:	00c12983          	lw	s3,12(sp)
     e50:	00812a03          	lw	s4,8(sp)
     e54:	00412a83          	lw	s5,4(sp)
     e58:	00012b03          	lw	s6,0(sp)
     e5c:	02010113          	addi	sp,sp,32
     e60:	00008067          	ret

00000e64 <ident_handler>:
     e64:	ef010113          	addi	sp,sp,-272
     e68:	f00017b7          	lui	a5,0xf0001
     e6c:	00010693          	mv	a3,sp
     e70:	80078713          	addi	a4,a5,-2048 # f0000800 <_fstack+0xdffff800>
     e74:	10112623          	sw	ra,268(sp)
     e78:	00068593          	mv	a1,a3
     e7c:	c0078793          	addi	a5,a5,-1024
     e80:	00072603          	lw	a2,0(a4)
     e84:	00470713          	addi	a4,a4,4
     e88:	00168693          	addi	a3,a3,1
     e8c:	fec68fa3          	sb	a2,-1(a3)
     e90:	fef718e3          	bne	a4,a5,e80 <ident_handler+0x1c>
     e94:	00014783          	lbu	a5,0(sp)
     e98:	00079663          	bnez	a5,ea4 <ident_handler+0x40>
     e9c:	000045b7          	lui	a1,0x4
     ea0:	14458593          	addi	a1,a1,324 # 4144 <str.2739+0xbc>
     ea4:	00004537          	lui	a0,0x4
     ea8:	17850513          	addi	a0,a0,376 # 4178 <str.2739+0xf0>
     eac:	769000ef          	jal	ra,1e14 <printf>
     eb0:	10c12083          	lw	ra,268(sp)
     eb4:	11010113          	addi	sp,sp,272
     eb8:	00008067          	ret

00000ebc <leds_handler>:
     ebc:	fe010113          	addi	sp,sp,-32
     ec0:	00112e23          	sw	ra,28(sp)
     ec4:	00812c23          	sw	s0,24(sp)
     ec8:	02a04063          	bgtz	a0,ee8 <leds_handler+0x2c>
     ecc:	00004537          	lui	a0,0x4
     ed0:	18450513          	addi	a0,a0,388 # 4184 <str.2739+0xfc>
     ed4:	741000ef          	jal	ra,1e14 <printf>
     ed8:	01c12083          	lw	ra,28(sp)
     edc:	01812403          	lw	s0,24(sp)
     ee0:	02010113          	addi	sp,sp,32
     ee4:	00008067          	ret
     ee8:	00058793          	mv	a5,a1
     eec:	0007a503          	lw	a0,0(a5)
     ef0:	00000613          	li	a2,0
     ef4:	00c10593          	addi	a1,sp,12
     ef8:	7e1000ef          	jal	ra,1ed8 <strtoul>
     efc:	00c12783          	lw	a5,12(sp)
     f00:	00050413          	mv	s0,a0
     f04:	0007c783          	lbu	a5,0(a5)
     f08:	00078863          	beqz	a5,f18 <leds_handler+0x5c>
     f0c:	00004537          	lui	a0,0x4
     f10:	19450513          	addi	a0,a0,404 # 4194 <str.2739+0x10c>
     f14:	fc1ff06f          	j	ed4 <leds_handler+0x18>
     f18:	00050593          	mv	a1,a0
     f1c:	00004537          	lui	a0,0x4
     f20:	1a450513          	addi	a0,a0,420 # 41a4 <str.2739+0x11c>
     f24:	6f1000ef          	jal	ra,1e14 <printf>
     f28:	f00027b7          	lui	a5,0xf0002
     f2c:	0087a023          	sw	s0,0(a5) # f0002000 <_fstack+0xe0001000>
     f30:	fa9ff06f          	j	ed8 <leds_handler+0x1c>

00000f34 <crc_handler>:
     f34:	fd010113          	addi	sp,sp,-48
     f38:	02112623          	sw	ra,44(sp)
     f3c:	02812423          	sw	s0,40(sp)
     f40:	02912223          	sw	s1,36(sp)
     f44:	00100793          	li	a5,1
     f48:	02a7c263          	blt	a5,a0,f6c <crc_handler+0x38>
     f4c:	00004537          	lui	a0,0x4
     f50:	1bc50513          	addi	a0,a0,444 # 41bc <str.2739+0x134>
     f54:	6c1000ef          	jal	ra,1e14 <printf>
     f58:	02c12083          	lw	ra,44(sp)
     f5c:	02812403          	lw	s0,40(sp)
     f60:	02412483          	lw	s1,36(sp)
     f64:	03010113          	addi	sp,sp,48
     f68:	00008067          	ret
     f6c:	00058413          	mv	s0,a1
     f70:	00042503          	lw	a0,0(s0)
     f74:	00000613          	li	a2,0
     f78:	01c10593          	addi	a1,sp,28
     f7c:	75d000ef          	jal	ra,1ed8 <strtoul>
     f80:	01c12783          	lw	a5,28(sp)
     f84:	00050493          	mv	s1,a0
     f88:	0007c783          	lbu	a5,0(a5)
     f8c:	00078863          	beqz	a5,f9c <crc_handler+0x68>
     f90:	00004537          	lui	a0,0x4
     f94:	1d450513          	addi	a0,a0,468 # 41d4 <str.2739+0x14c>
     f98:	fbdff06f          	j	f54 <crc_handler+0x20>
     f9c:	00442503          	lw	a0,4(s0)
     fa0:	00000613          	li	a2,0
     fa4:	01c10593          	addi	a1,sp,28
     fa8:	731000ef          	jal	ra,1ed8 <strtoul>
     fac:	01c12783          	lw	a5,28(sp)
     fb0:	0007c783          	lbu	a5,0(a5)
     fb4:	00078863          	beqz	a5,fc4 <crc_handler+0x90>
     fb8:	00004537          	lui	a0,0x4
     fbc:	1e850513          	addi	a0,a0,488 # 41e8 <str.2739+0x160>
     fc0:	f95ff06f          	j	f54 <crc_handler+0x20>
     fc4:	00a12623          	sw	a0,12(sp)
     fc8:	dc9ff0ef          	jal	ra,d90 <flush_cpu_dcache>
     fcc:	671010ef          	jal	ra,2e3c <flush_l2_cache>
     fd0:	00c12583          	lw	a1,12(sp)
     fd4:	00048513          	mv	a0,s1
     fd8:	4e5010ef          	jal	ra,2cbc <crc32>
     fdc:	00050593          	mv	a1,a0
     fe0:	00004537          	lui	a0,0x4
     fe4:	1fc50513          	addi	a0,a0,508 # 41fc <str.2739+0x174>
     fe8:	62d000ef          	jal	ra,1e14 <printf>
     fec:	f6dff06f          	j	f58 <crc_handler+0x24>

00000ff0 <mem_list_handler>:
     ff0:	00004537          	lui	a0,0x4
     ff4:	ff010113          	addi	sp,sp,-16
     ff8:	2dc50513          	addi	a0,a0,732 # 42dc <str.2739+0x254>
     ffc:	00112623          	sw	ra,12(sp)
    1000:	615000ef          	jal	ra,1e14 <printf>
    1004:	00c12083          	lw	ra,12(sp)
    1008:	00004537          	lui	a0,0x4
    100c:	2f850513          	addi	a0,a0,760 # 42f8 <str.2739+0x270>
    1010:	01010113          	addi	sp,sp,16
    1014:	6490006f          	j	1e5c <puts>

00001018 <mem_write_handler>:
    1018:	fd010113          	addi	sp,sp,-48
    101c:	02112623          	sw	ra,44(sp)
    1020:	02812423          	sw	s0,40(sp)
    1024:	02912223          	sw	s1,36(sp)
    1028:	03212023          	sw	s2,32(sp)
    102c:	01312e23          	sw	s3,28(sp)
    1030:	01412c23          	sw	s4,24(sp)
    1034:	00100793          	li	a5,1
    1038:	02a7c863          	blt	a5,a0,1068 <mem_write_handler+0x50>
    103c:	00004537          	lui	a0,0x4
    1040:	3cc50513          	addi	a0,a0,972 # 43cc <str.2739+0x344>
    1044:	5d1000ef          	jal	ra,1e14 <printf>
    1048:	02c12083          	lw	ra,44(sp)
    104c:	02812403          	lw	s0,40(sp)
    1050:	02412483          	lw	s1,36(sp)
    1054:	02012903          	lw	s2,32(sp)
    1058:	01c12983          	lw	s3,28(sp)
    105c:	01812a03          	lw	s4,24(sp)
    1060:	03010113          	addi	sp,sp,48
    1064:	00008067          	ret
    1068:	00058493          	mv	s1,a1
    106c:	00050993          	mv	s3,a0
    1070:	0004a503          	lw	a0,0(s1)
    1074:	00000613          	li	a2,0
    1078:	00c10593          	addi	a1,sp,12
    107c:	65d000ef          	jal	ra,1ed8 <strtoul>
    1080:	00c12783          	lw	a5,12(sp)
    1084:	00050413          	mv	s0,a0
    1088:	0007c783          	lbu	a5,0(a5)
    108c:	00078863          	beqz	a5,109c <mem_write_handler+0x84>
    1090:	00004537          	lui	a0,0x4
    1094:	1d450513          	addi	a0,a0,468 # 41d4 <str.2739+0x14c>
    1098:	fadff06f          	j	1044 <mem_write_handler+0x2c>
    109c:	0044a503          	lw	a0,4(s1)
    10a0:	00000613          	li	a2,0
    10a4:	00c10593          	addi	a1,sp,12
    10a8:	631000ef          	jal	ra,1ed8 <strtoul>
    10ac:	00c12783          	lw	a5,12(sp)
    10b0:	00050913          	mv	s2,a0
    10b4:	0007c783          	lbu	a5,0(a5)
    10b8:	00078863          	beqz	a5,10c8 <mem_write_handler+0xb0>
    10bc:	00004537          	lui	a0,0x4
    10c0:	19450513          	addi	a0,a0,404 # 4194 <str.2739+0x10c>
    10c4:	f81ff06f          	j	1044 <mem_write_handler+0x2c>
    10c8:	00200793          	li	a5,2
    10cc:	08f98063          	beq	s3,a5,114c <mem_write_handler+0x134>
    10d0:	0084a503          	lw	a0,8(s1)
    10d4:	00000613          	li	a2,0
    10d8:	00c10593          	addi	a1,sp,12
    10dc:	5fd000ef          	jal	ra,1ed8 <strtoul>
    10e0:	00c12783          	lw	a5,12(sp)
    10e4:	00050a13          	mv	s4,a0
    10e8:	0007c783          	lbu	a5,0(a5)
    10ec:	00078863          	beqz	a5,10fc <mem_write_handler+0xe4>
    10f0:	00004537          	lui	a0,0x4
    10f4:	3f850513          	addi	a0,a0,1016 # 43f8 <str.2739+0x370>
    10f8:	f4dff06f          	j	1044 <mem_write_handler+0x2c>
    10fc:	00400713          	li	a4,4
    1100:	00e99c63          	bne	s3,a4,1118 <mem_write_handler+0x100>
    1104:	00c4a503          	lw	a0,12(s1)
    1108:	00000613          	li	a2,0
    110c:	00c10593          	addi	a1,sp,12
    1110:	5c9000ef          	jal	ra,1ed8 <strtoul>
    1114:	00050713          	mv	a4,a0
    1118:	00040793          	mv	a5,s0
    111c:	00000693          	li	a3,0
    1120:	00200613          	li	a2,2
    1124:	00400593          	li	a1,4
    1128:	00100513          	li	a0,1
    112c:	f1468ee3          	beq	a3,s4,1048 <mem_write_handler+0x30>
    1130:	02c70463          	beq	a4,a2,1158 <mem_write_handler+0x140>
    1134:	02b70863          	beq	a4,a1,1164 <mem_write_handler+0x14c>
    1138:	02a71c63          	bne	a4,a0,1170 <mem_write_handler+0x158>
    113c:	01278023          	sb	s2,0(a5)
    1140:	00178793          	addi	a5,a5,1
    1144:	00168693          	addi	a3,a3,1
    1148:	fe5ff06f          	j	112c <mem_write_handler+0x114>
    114c:	00100a13          	li	s4,1
    1150:	00400713          	li	a4,4
    1154:	fc5ff06f          	j	1118 <mem_write_handler+0x100>
    1158:	01279023          	sh	s2,0(a5)
    115c:	00278793          	addi	a5,a5,2
    1160:	fe5ff06f          	j	1144 <mem_write_handler+0x12c>
    1164:	0127a023          	sw	s2,0(a5)
    1168:	00478793          	addi	a5,a5,4
    116c:	fd9ff06f          	j	1144 <mem_write_handler+0x12c>
    1170:	00004537          	lui	a0,0x4
    1174:	40850513          	addi	a0,a0,1032 # 4408 <str.2739+0x380>
    1178:	ecdff06f          	j	1044 <mem_write_handler+0x2c>

0000117c <mem_copy_handler>:
    117c:	fd010113          	addi	sp,sp,-48
    1180:	02112623          	sw	ra,44(sp)
    1184:	02812423          	sw	s0,40(sp)
    1188:	02912223          	sw	s1,36(sp)
    118c:	03212023          	sw	s2,32(sp)
    1190:	01312e23          	sw	s3,28(sp)
    1194:	00100793          	li	a5,1
    1198:	02a7c663          	blt	a5,a0,11c4 <mem_copy_handler+0x48>
    119c:	00004537          	lui	a0,0x4
    11a0:	41850513          	addi	a0,a0,1048 # 4418 <str.2739+0x390>
    11a4:	471000ef          	jal	ra,1e14 <printf>
    11a8:	02c12083          	lw	ra,44(sp)
    11ac:	02812403          	lw	s0,40(sp)
    11b0:	02412483          	lw	s1,36(sp)
    11b4:	02012903          	lw	s2,32(sp)
    11b8:	01c12983          	lw	s3,28(sp)
    11bc:	03010113          	addi	sp,sp,48
    11c0:	00008067          	ret
    11c4:	00058413          	mv	s0,a1
    11c8:	00050493          	mv	s1,a0
    11cc:	00042503          	lw	a0,0(s0)
    11d0:	00000613          	li	a2,0
    11d4:	00c10593          	addi	a1,sp,12
    11d8:	501000ef          	jal	ra,1ed8 <strtoul>
    11dc:	00c12783          	lw	a5,12(sp)
    11e0:	00050993          	mv	s3,a0
    11e4:	0007c783          	lbu	a5,0(a5)
    11e8:	00078863          	beqz	a5,11f8 <mem_copy_handler+0x7c>
    11ec:	00004537          	lui	a0,0x4
    11f0:	43850513          	addi	a0,a0,1080 # 4438 <str.2739+0x3b0>
    11f4:	fb1ff06f          	j	11a4 <mem_copy_handler+0x28>
    11f8:	00442503          	lw	a0,4(s0)
    11fc:	00000613          	li	a2,0
    1200:	00c10593          	addi	a1,sp,12
    1204:	4d5000ef          	jal	ra,1ed8 <strtoul>
    1208:	00c12783          	lw	a5,12(sp)
    120c:	00050913          	mv	s2,a0
    1210:	0007c783          	lbu	a5,0(a5)
    1214:	00078863          	beqz	a5,1224 <mem_copy_handler+0xa8>
    1218:	00004537          	lui	a0,0x4
    121c:	45850513          	addi	a0,a0,1112 # 4458 <str.2739+0x3d0>
    1220:	f85ff06f          	j	11a4 <mem_copy_handler+0x28>
    1224:	00200793          	li	a5,2
    1228:	00100713          	li	a4,1
    122c:	02f48863          	beq	s1,a5,125c <mem_copy_handler+0xe0>
    1230:	00842503          	lw	a0,8(s0)
    1234:	00000613          	li	a2,0
    1238:	00c10593          	addi	a1,sp,12
    123c:	49d000ef          	jal	ra,1ed8 <strtoul>
    1240:	00c12783          	lw	a5,12(sp)
    1244:	00050713          	mv	a4,a0
    1248:	0007c783          	lbu	a5,0(a5)
    124c:	00078863          	beqz	a5,125c <mem_copy_handler+0xe0>
    1250:	00004537          	lui	a0,0x4
    1254:	3f850513          	addi	a0,a0,1016 # 43f8 <str.2739+0x370>
    1258:	f4dff06f          	j	11a4 <mem_copy_handler+0x28>
    125c:	00000793          	li	a5,0
    1260:	00279693          	slli	a3,a5,0x2
    1264:	00d98633          	add	a2,s3,a3
    1268:	00d906b3          	add	a3,s2,a3
    126c:	f2f70ee3          	beq	a4,a5,11a8 <mem_copy_handler+0x2c>
    1270:	0006a683          	lw	a3,0(a3)
    1274:	00178793          	addi	a5,a5,1
    1278:	00d62023          	sw	a3,0(a2)
    127c:	fe5ff06f          	j	1260 <mem_copy_handler+0xe4>

00001280 <mem_cmp_handler>:
    1280:	fd010113          	addi	sp,sp,-48
    1284:	02112623          	sw	ra,44(sp)
    1288:	02812423          	sw	s0,40(sp)
    128c:	02912223          	sw	s1,36(sp)
    1290:	03212023          	sw	s2,32(sp)
    1294:	01312e23          	sw	s3,28(sp)
    1298:	01412c23          	sw	s4,24(sp)
    129c:	00200793          	li	a5,2
    12a0:	02a7c863          	blt	a5,a0,12d0 <mem_cmp_handler+0x50>
    12a4:	00004537          	lui	a0,0x4
    12a8:	47450513          	addi	a0,a0,1140 # 4474 <str.2739+0x3ec>
    12ac:	369000ef          	jal	ra,1e14 <printf>
    12b0:	02c12083          	lw	ra,44(sp)
    12b4:	02812403          	lw	s0,40(sp)
    12b8:	02412483          	lw	s1,36(sp)
    12bc:	02012903          	lw	s2,32(sp)
    12c0:	01c12983          	lw	s3,28(sp)
    12c4:	01812a03          	lw	s4,24(sp)
    12c8:	03010113          	addi	sp,sp,48
    12cc:	00008067          	ret
    12d0:	00058913          	mv	s2,a1
    12d4:	00092503          	lw	a0,0(s2)
    12d8:	00000613          	li	a2,0
    12dc:	00c10593          	addi	a1,sp,12
    12e0:	3f9000ef          	jal	ra,1ed8 <strtoul>
    12e4:	00c12783          	lw	a5,12(sp)
    12e8:	00050413          	mv	s0,a0
    12ec:	0007c783          	lbu	a5,0(a5)
    12f0:	00078863          	beqz	a5,1300 <mem_cmp_handler+0x80>
    12f4:	00004537          	lui	a0,0x4
    12f8:	49450513          	addi	a0,a0,1172 # 4494 <str.2739+0x40c>
    12fc:	fb1ff06f          	j	12ac <mem_cmp_handler+0x2c>
    1300:	00492503          	lw	a0,4(s2)
    1304:	00000613          	li	a2,0
    1308:	00c10593          	addi	a1,sp,12
    130c:	3cd000ef          	jal	ra,1ed8 <strtoul>
    1310:	00c12783          	lw	a5,12(sp)
    1314:	00050493          	mv	s1,a0
    1318:	0007c783          	lbu	a5,0(a5)
    131c:	00078863          	beqz	a5,132c <mem_cmp_handler+0xac>
    1320:	00004537          	lui	a0,0x4
    1324:	4a450513          	addi	a0,a0,1188 # 44a4 <str.2739+0x41c>
    1328:	f85ff06f          	j	12ac <mem_cmp_handler+0x2c>
    132c:	00892503          	lw	a0,8(s2)
    1330:	00000613          	li	a2,0
    1334:	00c10593          	addi	a1,sp,12
    1338:	3a1000ef          	jal	ra,1ed8 <strtoul>
    133c:	00c12783          	lw	a5,12(sp)
    1340:	00050913          	mv	s2,a0
    1344:	0007c783          	lbu	a5,0(a5)
    1348:	04078863          	beqz	a5,1398 <mem_cmp_handler+0x118>
    134c:	00004537          	lui	a0,0x4
    1350:	3f850513          	addi	a0,a0,1016 # 43f8 <str.2739+0x370>
    1354:	f59ff06f          	j	12ac <mem_cmp_handler+0x2c>
    1358:	00042603          	lw	a2,0(s0)
    135c:	0004a703          	lw	a4,0(s1)
    1360:	00e60c63          	beq	a2,a4,1378 <mem_cmp_handler+0xf8>
    1364:	00048693          	mv	a3,s1
    1368:	00040593          	mv	a1,s0
    136c:	4b4a0513          	addi	a0,s4,1204
    1370:	2a5000ef          	jal	ra,1e14 <printf>
    1374:	00000793          	li	a5,0
    1378:	00198993          	addi	s3,s3,1
    137c:	00440413          	addi	s0,s0,4
    1380:	00448493          	addi	s1,s1,4
    1384:	fd299ae3          	bne	s3,s2,1358 <mem_cmp_handler+0xd8>
    1388:	02078063          	beqz	a5,13a8 <mem_cmp_handler+0x128>
    138c:	00004537          	lui	a0,0x4
    1390:	51050513          	addi	a0,a0,1296 # 4510 <str.2739+0x488>
    1394:	f19ff06f          	j	12ac <mem_cmp_handler+0x2c>
    1398:	00100793          	li	a5,1
    139c:	00000993          	li	s3,0
    13a0:	00004a37          	lui	s4,0x4
    13a4:	fe1ff06f          	j	1384 <mem_cmp_handler+0x104>
    13a8:	00004537          	lui	a0,0x4
    13ac:	53050513          	addi	a0,a0,1328 # 4530 <str.2739+0x4a8>
    13b0:	efdff06f          	j	12ac <mem_cmp_handler+0x2c>

000013b4 <mem_read_handler>:
    13b4:	fe010113          	addi	sp,sp,-32
    13b8:	00112e23          	sw	ra,28(sp)
    13bc:	00812c23          	sw	s0,24(sp)
    13c0:	00912a23          	sw	s1,20(sp)
    13c4:	01212823          	sw	s2,16(sp)
    13c8:	02a04463          	bgtz	a0,13f0 <mem_read_handler+0x3c>
    13cc:	00004537          	lui	a0,0x4
    13d0:	55850513          	addi	a0,a0,1368 # 4558 <str.2739+0x4d0>
    13d4:	241000ef          	jal	ra,1e14 <printf>
    13d8:	01c12083          	lw	ra,28(sp)
    13dc:	01812403          	lw	s0,24(sp)
    13e0:	01412483          	lw	s1,20(sp)
    13e4:	01012903          	lw	s2,16(sp)
    13e8:	02010113          	addi	sp,sp,32
    13ec:	00008067          	ret
    13f0:	00058413          	mv	s0,a1
    13f4:	00050493          	mv	s1,a0
    13f8:	00042503          	lw	a0,0(s0)
    13fc:	00000613          	li	a2,0
    1400:	00c10593          	addi	a1,sp,12
    1404:	2d5000ef          	jal	ra,1ed8 <strtoul>
    1408:	00c12783          	lw	a5,12(sp)
    140c:	00050913          	mv	s2,a0
    1410:	0007c783          	lbu	a5,0(a5)
    1414:	00078863          	beqz	a5,1424 <mem_read_handler+0x70>
    1418:	00004537          	lui	a0,0x4
    141c:	1d450513          	addi	a0,a0,468 # 41d4 <str.2739+0x14c>
    1420:	fb5ff06f          	j	13d4 <mem_read_handler+0x20>
    1424:	00100793          	li	a5,1
    1428:	02f48863          	beq	s1,a5,1458 <mem_read_handler+0xa4>
    142c:	00442503          	lw	a0,4(s0)
    1430:	00c10593          	addi	a1,sp,12
    1434:	00000613          	li	a2,0
    1438:	2a1000ef          	jal	ra,1ed8 <strtoul>
    143c:	00c12783          	lw	a5,12(sp)
    1440:	00050593          	mv	a1,a0
    1444:	0007c783          	lbu	a5,0(a5)
    1448:	00078a63          	beqz	a5,145c <mem_read_handler+0xa8>
    144c:	00004537          	lui	a0,0x4
    1450:	57450513          	addi	a0,a0,1396 # 4574 <str.2739+0x4ec>
    1454:	f81ff06f          	j	13d4 <mem_read_handler+0x20>
    1458:	00400593          	li	a1,4
    145c:	00090613          	mv	a2,s2
    1460:	00090513          	mv	a0,s2
    1464:	db4ff0ef          	jal	ra,a18 <dump_bytes>
    1468:	f71ff06f          	j	13d8 <mem_read_handler+0x24>

0000146c <mem_test_handler>:
    146c:	fe010113          	addi	sp,sp,-32
    1470:	00112e23          	sw	ra,28(sp)
    1474:	00812c23          	sw	s0,24(sp)
    1478:	00912a23          	sw	s1,20(sp)
    147c:	01212823          	sw	s2,16(sp)
    1480:	02a04463          	bgtz	a0,14a8 <mem_test_handler+0x3c>
    1484:	00004537          	lui	a0,0x4
    1488:	58850513          	addi	a0,a0,1416 # 4588 <str.2739+0x500>
    148c:	189000ef          	jal	ra,1e14 <printf>
    1490:	01c12083          	lw	ra,28(sp)
    1494:	01812403          	lw	s0,24(sp)
    1498:	01412483          	lw	s1,20(sp)
    149c:	01012903          	lw	s2,16(sp)
    14a0:	02010113          	addi	sp,sp,32
    14a4:	00008067          	ret
    14a8:	00058413          	mv	s0,a1
    14ac:	00050493          	mv	s1,a0
    14b0:	00042503          	lw	a0,0(s0)
    14b4:	00000613          	li	a2,0
    14b8:	00c10593          	addi	a1,sp,12
    14bc:	21d000ef          	jal	ra,1ed8 <strtoul>
    14c0:	00c12783          	lw	a5,12(sp)
    14c4:	00050913          	mv	s2,a0
    14c8:	0007c783          	lbu	a5,0(a5)
    14cc:	00078863          	beqz	a5,14dc <mem_test_handler+0x70>
    14d0:	00004537          	lui	a0,0x4
    14d4:	1d450513          	addi	a0,a0,468 # 41d4 <str.2739+0x14c>
    14d8:	fb5ff06f          	j	148c <mem_test_handler+0x20>
    14dc:	00100793          	li	a5,1
    14e0:	02f48863          	beq	s1,a5,1510 <mem_test_handler+0xa4>
    14e4:	00442503          	lw	a0,4(s0)
    14e8:	00c10593          	addi	a1,sp,12
    14ec:	00000613          	li	a2,0
    14f0:	1e9000ef          	jal	ra,1ed8 <strtoul>
    14f4:	00c12783          	lw	a5,12(sp)
    14f8:	00050593          	mv	a1,a0
    14fc:	0007c783          	lbu	a5,0(a5)
    1500:	00078a63          	beqz	a5,1514 <mem_test_handler+0xa8>
    1504:	00004537          	lui	a0,0x4
    1508:	40850513          	addi	a0,a0,1032 # 4408 <str.2739+0x380>
    150c:	f81ff06f          	j	148c <mem_test_handler+0x20>
    1510:	fff00593          	li	a1,-1
    1514:	00090513          	mv	a0,s2
    1518:	114020ef          	jal	ra,362c <memtest>
    151c:	f75ff06f          	j	1490 <mem_test_handler+0x24>

00001520 <mem_speed_handler>:
    1520:	fd010113          	addi	sp,sp,-48
    1524:	02112623          	sw	ra,44(sp)
    1528:	02812423          	sw	s0,40(sp)
    152c:	02912223          	sw	s1,36(sp)
    1530:	03212023          	sw	s2,32(sp)
    1534:	01312e23          	sw	s3,28(sp)
    1538:	01412c23          	sw	s4,24(sp)
    153c:	00100793          	li	a5,1
    1540:	02a7c863          	blt	a5,a0,1570 <mem_speed_handler+0x50>
    1544:	00004537          	lui	a0,0x4
    1548:	5a450513          	addi	a0,a0,1444 # 45a4 <str.2739+0x51c>
    154c:	0c9000ef          	jal	ra,1e14 <printf>
    1550:	02c12083          	lw	ra,44(sp)
    1554:	02812403          	lw	s0,40(sp)
    1558:	02412483          	lw	s1,36(sp)
    155c:	02012903          	lw	s2,32(sp)
    1560:	01c12983          	lw	s3,28(sp)
    1564:	01812a03          	lw	s4,24(sp)
    1568:	03010113          	addi	sp,sp,48
    156c:	00008067          	ret
    1570:	00058413          	mv	s0,a1
    1574:	00050493          	mv	s1,a0
    1578:	00042503          	lw	a0,0(s0)
    157c:	00000613          	li	a2,0
    1580:	00c10593          	addi	a1,sp,12
    1584:	155000ef          	jal	ra,1ed8 <strtoul>
    1588:	00c12783          	lw	a5,12(sp)
    158c:	00050993          	mv	s3,a0
    1590:	0007c783          	lbu	a5,0(a5)
    1594:	00078863          	beqz	a5,15a4 <mem_speed_handler+0x84>
    1598:	00004537          	lui	a0,0x4
    159c:	1d450513          	addi	a0,a0,468 # 41d4 <str.2739+0x14c>
    15a0:	fadff06f          	j	154c <mem_speed_handler+0x2c>
    15a4:	00442503          	lw	a0,4(s0)
    15a8:	00000613          	li	a2,0
    15ac:	00c10593          	addi	a1,sp,12
    15b0:	129000ef          	jal	ra,1ed8 <strtoul>
    15b4:	00c12783          	lw	a5,12(sp)
    15b8:	00050a13          	mv	s4,a0
    15bc:	0007c783          	lbu	a5,0(a5)
    15c0:	00078863          	beqz	a5,15d0 <mem_speed_handler+0xb0>
    15c4:	00004537          	lui	a0,0x4
    15c8:	40850513          	addi	a0,a0,1032 # 4408 <str.2739+0x380>
    15cc:	f81ff06f          	j	154c <mem_speed_handler+0x2c>
    15d0:	00200793          	li	a5,2
    15d4:	00000913          	li	s2,0
    15d8:	06f48263          	beq	s1,a5,163c <mem_speed_handler+0x11c>
    15dc:	00842503          	lw	a0,8(s0)
    15e0:	00000613          	li	a2,0
    15e4:	00c10593          	addi	a1,sp,12
    15e8:	0f1000ef          	jal	ra,1ed8 <strtoul>
    15ec:	00c12783          	lw	a5,12(sp)
    15f0:	00a03933          	snez	s2,a0
    15f4:	0007c783          	lbu	a5,0(a5)
    15f8:	00078863          	beqz	a5,1608 <mem_speed_handler+0xe8>
    15fc:	00004537          	lui	a0,0x4
    1600:	5d450513          	addi	a0,a0,1492 # 45d4 <str.2739+0x54c>
    1604:	f49ff06f          	j	154c <mem_speed_handler+0x2c>
    1608:	00300793          	li	a5,3
    160c:	02f48863          	beq	s1,a5,163c <mem_speed_handler+0x11c>
    1610:	00c42503          	lw	a0,12(s0)
    1614:	00000613          	li	a2,0
    1618:	00c10593          	addi	a1,sp,12
    161c:	0bd000ef          	jal	ra,1ed8 <strtoul>
    1620:	00c12783          	lw	a5,12(sp)
    1624:	00a036b3          	snez	a3,a0
    1628:	0007c783          	lbu	a5,0(a5)
    162c:	00078a63          	beqz	a5,1640 <mem_speed_handler+0x120>
    1630:	00004537          	lui	a0,0x4
    1634:	5f050513          	addi	a0,a0,1520 # 45f0 <str.2739+0x568>
    1638:	f15ff06f          	j	154c <mem_speed_handler+0x2c>
    163c:	00000693          	li	a3,0
    1640:	00090613          	mv	a2,s2
    1644:	000a0593          	mv	a1,s4
    1648:	00098513          	mv	a0,s3
    164c:	599010ef          	jal	ra,33e4 <memspeed>
    1650:	f01ff06f          	j	1550 <mem_speed_handler+0x30>

00001654 <reboot_handler>:
    1654:	f00007b7          	lui	a5,0xf0000
    1658:	00100713          	li	a4,1
    165c:	00e7a023          	sw	a4,0(a5) # f0000000 <_fstack+0xdffff000>
    1660:	00008067          	ret

00001664 <boot_handler>:
    1664:	fd010113          	addi	sp,sp,-48
    1668:	02112623          	sw	ra,44(sp)
    166c:	02812423          	sw	s0,40(sp)
    1670:	02912223          	sw	s1,36(sp)
    1674:	03212023          	sw	s2,32(sp)
    1678:	01312e23          	sw	s3,28(sp)
    167c:	02a04663          	bgtz	a0,16a8 <boot_handler+0x44>
    1680:	00004537          	lui	a0,0x4
    1684:	6f450513          	addi	a0,a0,1780 # 46f4 <str.2739+0x66c>
    1688:	78c000ef          	jal	ra,1e14 <printf>
    168c:	02c12083          	lw	ra,44(sp)
    1690:	02812403          	lw	s0,40(sp)
    1694:	02412483          	lw	s1,36(sp)
    1698:	02012903          	lw	s2,32(sp)
    169c:	01c12983          	lw	s3,28(sp)
    16a0:	03010113          	addi	sp,sp,48
    16a4:	00008067          	ret
    16a8:	00058413          	mv	s0,a1
    16ac:	00050493          	mv	s1,a0
    16b0:	00042503          	lw	a0,0(s0)
    16b4:	00000613          	li	a2,0
    16b8:	00c10593          	addi	a1,sp,12
    16bc:	01d000ef          	jal	ra,1ed8 <strtoul>
    16c0:	00c12783          	lw	a5,12(sp)
    16c4:	00050993          	mv	s3,a0
    16c8:	0007c783          	lbu	a5,0(a5)
    16cc:	00078863          	beqz	a5,16dc <boot_handler+0x78>
    16d0:	00004537          	lui	a0,0x4
    16d4:	1d450513          	addi	a0,a0,468 # 41d4 <str.2739+0x14c>
    16d8:	fb1ff06f          	j	1688 <boot_handler+0x24>
    16dc:	00100793          	li	a5,1
    16e0:	08f48e63          	beq	s1,a5,177c <boot_handler+0x118>
    16e4:	00442503          	lw	a0,4(s0)
    16e8:	00000613          	li	a2,0
    16ec:	00c10593          	addi	a1,sp,12
    16f0:	7e8000ef          	jal	ra,1ed8 <strtoul>
    16f4:	00c12783          	lw	a5,12(sp)
    16f8:	00050913          	mv	s2,a0
    16fc:	0007c783          	lbu	a5,0(a5)
    1700:	00078863          	beqz	a5,1710 <boot_handler+0xac>
    1704:	00004537          	lui	a0,0x4
    1708:	71450513          	addi	a0,a0,1812 # 4714 <str.2739+0x68c>
    170c:	f7dff06f          	j	1688 <boot_handler+0x24>
    1710:	00200793          	li	a5,2
    1714:	02f48863          	beq	s1,a5,1744 <boot_handler+0xe0>
    1718:	00842503          	lw	a0,8(s0)
    171c:	00c10593          	addi	a1,sp,12
    1720:	00000613          	li	a2,0
    1724:	7b4000ef          	jal	ra,1ed8 <strtoul>
    1728:	00c12783          	lw	a5,12(sp)
    172c:	00050593          	mv	a1,a0
    1730:	0007c783          	lbu	a5,0(a5)
    1734:	00078a63          	beqz	a5,1748 <boot_handler+0xe4>
    1738:	00004537          	lui	a0,0x4
    173c:	72450513          	addi	a0,a0,1828 # 4724 <str.2739+0x69c>
    1740:	f49ff06f          	j	1688 <boot_handler+0x24>
    1744:	00000593          	li	a1,0
    1748:	00300793          	li	a5,3
    174c:	0297dc63          	bge	a5,s1,1784 <boot_handler+0x120>
    1750:	00c42503          	lw	a0,12(s0)
    1754:	00c10593          	addi	a1,sp,12
    1758:	00000613          	li	a2,0
    175c:	77c000ef          	jal	ra,1ed8 <strtoul>
    1760:	00c12783          	lw	a5,12(sp)
    1764:	00050593          	mv	a1,a0
    1768:	0007c783          	lbu	a5,0(a5)
    176c:	00078c63          	beqz	a5,1784 <boot_handler+0x120>
    1770:	00004537          	lui	a0,0x4
    1774:	73450513          	addi	a0,a0,1844 # 4734 <str.2739+0x6ac>
    1778:	f11ff06f          	j	1688 <boot_handler+0x24>
    177c:	00000913          	li	s2,0
    1780:	00000593          	li	a1,0
    1784:	00098693          	mv	a3,s3
    1788:	00000613          	li	a2,0
    178c:	00090513          	mv	a0,s2
    1790:	f15fe0ef          	jal	ra,6a4 <boot>

00001794 <sdram_test_handler>:
    1794:	001005b7          	lui	a1,0x100
    1798:	40000537          	lui	a0,0x40000
    179c:	6910106f          	j	362c <memtest>

000017a0 <sdram_mr_write_handler>:
    17a0:	fd010113          	addi	sp,sp,-48
    17a4:	02112623          	sw	ra,44(sp)
    17a8:	02812423          	sw	s0,40(sp)
    17ac:	02912223          	sw	s1,36(sp)
    17b0:	00100793          	li	a5,1
    17b4:	02a7c263          	blt	a5,a0,17d8 <sdram_mr_write_handler+0x38>
    17b8:	00004537          	lui	a0,0x4
    17bc:	79450513          	addi	a0,a0,1940 # 4794 <str.2739+0x70c>
    17c0:	654000ef          	jal	ra,1e14 <printf>
    17c4:	02c12083          	lw	ra,44(sp)
    17c8:	02812403          	lw	s0,40(sp)
    17cc:	02412483          	lw	s1,36(sp)
    17d0:	03010113          	addi	sp,sp,48
    17d4:	00008067          	ret
    17d8:	00058413          	mv	s0,a1
    17dc:	00042503          	lw	a0,0(s0)
    17e0:	00000613          	li	a2,0
    17e4:	01c10593          	addi	a1,sp,28
    17e8:	6f0000ef          	jal	ra,1ed8 <strtoul>
    17ec:	01c12783          	lw	a5,28(sp)
    17f0:	00050493          	mv	s1,a0
    17f4:	0007c783          	lbu	a5,0(a5)
    17f8:	00078863          	beqz	a5,1808 <sdram_mr_write_handler+0x68>
    17fc:	00004537          	lui	a0,0x4
    1800:	7b450513          	addi	a0,a0,1972 # 47b4 <str.2739+0x72c>
    1804:	fbdff06f          	j	17c0 <sdram_mr_write_handler+0x20>
    1808:	00442503          	lw	a0,4(s0)
    180c:	00000613          	li	a2,0
    1810:	01c10593          	addi	a1,sp,28
    1814:	6c4000ef          	jal	ra,1ed8 <strtoul>
    1818:	01c12783          	lw	a5,28(sp)
    181c:	00050413          	mv	s0,a0
    1820:	0007c783          	lbu	a5,0(a5)
    1824:	00078863          	beqz	a5,1834 <sdram_mr_write_handler+0x94>
    1828:	00004537          	lui	a0,0x4
    182c:	19450513          	addi	a0,a0,404 # 4194 <str.2739+0x10c>
    1830:	f91ff06f          	j	17c0 <sdram_mr_write_handler+0x20>
    1834:	3cc020ef          	jal	ra,3c00 <sdram_software_control_on>
    1838:	01041593          	slli	a1,s0,0x10
    183c:	00004537          	lui	a0,0x4
    1840:	0105d593          	srli	a1,a1,0x10
    1844:	0ff4f613          	andi	a2,s1,255
    1848:	7c450513          	addi	a0,a0,1988 # 47c4 <str.2739+0x73c>
    184c:	00b12623          	sw	a1,12(sp)
    1850:	5c4000ef          	jal	ra,1e14 <printf>
    1854:	00c12583          	lw	a1,12(sp)
    1858:	0ff4f513          	andi	a0,s1,255
    185c:	3ec020ef          	jal	ra,3c48 <sdram_mode_register_write>
    1860:	3c4020ef          	jal	ra,3c24 <sdram_software_control_off>
    1864:	f61ff06f          	j	17c4 <sdram_mr_write_handler+0x24>

00001868 <main>:
    1868:	f6010113          	addi	sp,sp,-160
    186c:	08112e23          	sw	ra,156(sp)
    1870:	08812c23          	sw	s0,152(sp)
    1874:	08912a23          	sw	s1,148(sp)
    1878:	09212823          	sw	s2,144(sp)
    187c:	09312623          	sw	s3,140(sp)
    1880:	f0c027b7          	lui	a5,0xf0c02
    1884:	0007a023          	sw	zero,0(a5) # f0c02000 <_fstack+0xe0c01000>
    1888:	30046073          	csrsi	mstatus,8
    188c:	00005437          	lui	s0,0x5
    1890:	0d0020ef          	jal	ra,3960 <uart_init>
    1894:	65440513          	addi	a0,s0,1620 # 5654 <crc_table+0x63c>
    1898:	57c000ef          	jal	ra,1e14 <printf>
    189c:	00005537          	lui	a0,0x5
    18a0:	85450513          	addi	a0,a0,-1964 # 4854 <str.2739+0x7cc>
    18a4:	570000ef          	jal	ra,1e14 <printf>
    18a8:	00005537          	lui	a0,0x5
    18ac:	87c50513          	addi	a0,a0,-1924 # 487c <str.2739+0x7f4>
    18b0:	564000ef          	jal	ra,1e14 <printf>
    18b4:	00005537          	lui	a0,0x5
    18b8:	8a450513          	addi	a0,a0,-1884 # 48a4 <str.2739+0x81c>
    18bc:	558000ef          	jal	ra,1e14 <printf>
    18c0:	00005537          	lui	a0,0x5
    18c4:	8c850513          	addi	a0,a0,-1848 # 48c8 <str.2739+0x840>
    18c8:	54c000ef          	jal	ra,1e14 <printf>
    18cc:	00005537          	lui	a0,0x5
    18d0:	8ec50513          	addi	a0,a0,-1812 # 48ec <str.2739+0x864>
    18d4:	540000ef          	jal	ra,1e14 <printf>
    18d8:	65440513          	addi	a0,s0,1620
    18dc:	538000ef          	jal	ra,1e14 <printf>
    18e0:	00005537          	lui	a0,0x5
    18e4:	91850513          	addi	a0,a0,-1768 # 4918 <str.2739+0x890>
    18e8:	52c000ef          	jal	ra,1e14 <printf>
    18ec:	00005537          	lui	a0,0x5
    18f0:	94050513          	addi	a0,a0,-1728 # 4940 <str.2739+0x8b8>
    18f4:	520000ef          	jal	ra,1e14 <printf>
    18f8:	65440513          	addi	a0,s0,1620
    18fc:	518000ef          	jal	ra,1e14 <printf>
    1900:	aa8ff0ef          	jal	ra,ba8 <crcbios>
    1904:	65440513          	addi	a0,s0,1620
    1908:	50c000ef          	jal	ra,1e14 <printf>
    190c:	00005537          	lui	a0,0x5
    1910:	96450513          	addi	a0,a0,-1692 # 4964 <str.2739+0x8dc>
    1914:	500000ef          	jal	ra,1e14 <printf>
    1918:	65440513          	addi	a0,s0,1620
    191c:	4f8000ef          	jal	ra,1e14 <printf>
    1920:	00005537          	lui	a0,0x5
    1924:	98050513          	addi	a0,a0,-1664 # 4980 <str.2739+0x8f8>
    1928:	4ec000ef          	jal	ra,1e14 <printf>
    192c:	000055b7          	lui	a1,0x5
    1930:	00005537          	lui	a0,0x5
    1934:	03200613          	li	a2,50
    1938:	9b458593          	addi	a1,a1,-1612 # 49b4 <str.2739+0x92c>
    193c:	9c850513          	addi	a0,a0,-1592 # 49c8 <str.2739+0x940>
    1940:	4d4000ef          	jal	ra,1e14 <printf>
    1944:	000055b7          	lui	a1,0x5
    1948:	00005537          	lui	a0,0x5
    194c:	00400693          	li	a3,4
    1950:	02000613          	li	a2,32
    1954:	9e458593          	addi	a1,a1,-1564 # 49e4 <str.2739+0x95c>
    1958:	9f050513          	addi	a0,a0,-1552 # 49f0 <str.2739+0x968>
    195c:	4b8000ef          	jal	ra,1e14 <printf>
    1960:	00005537          	lui	a0,0x5
    1964:	02000593          	li	a1,32
    1968:	a1450513          	addi	a0,a0,-1516 # 4a14 <str.2739+0x98c>
    196c:	4a8000ef          	jal	ra,1e14 <printf>
    1970:	00005537          	lui	a0,0x5
    1974:	a3050513          	addi	a0,a0,-1488 # 4a30 <str.2739+0x9a8>
    1978:	49c000ef          	jal	ra,1e14 <printf>
    197c:	00005537          	lui	a0,0x5
    1980:	a4050513          	addi	a0,a0,-1472 # 4a40 <str.2739+0x9b8>
    1984:	490000ef          	jal	ra,1e14 <printf>
    1988:	00000593          	li	a1,0
    198c:	00010537          	lui	a0,0x10
    1990:	430020ef          	jal	ra,3dc0 <print_size>
    1994:	65440513          	addi	a0,s0,1620
    1998:	47c000ef          	jal	ra,1e14 <printf>
    199c:	00005537          	lui	a0,0x5
    19a0:	a5050513          	addi	a0,a0,-1456 # 4a50 <str.2739+0x9c8>
    19a4:	470000ef          	jal	ra,1e14 <printf>
    19a8:	00000593          	li	a1,0
    19ac:	00001537          	lui	a0,0x1
    19b0:	410020ef          	jal	ra,3dc0 <print_size>
    19b4:	65440513          	addi	a0,s0,1620
    19b8:	45c000ef          	jal	ra,1e14 <printf>
    19bc:	00005537          	lui	a0,0x5
    19c0:	a6050513          	addi	a0,a0,-1440 # 4a60 <str.2739+0x9d8>
    19c4:	450000ef          	jal	ra,1e14 <printf>
    19c8:	00001537          	lui	a0,0x1
    19cc:	00000593          	li	a1,0
    19d0:	80050513          	addi	a0,a0,-2048 # 800 <serialboot+0xd8>
    19d4:	3ec020ef          	jal	ra,3dc0 <print_size>
    19d8:	65440513          	addi	a0,s0,1620
    19dc:	438000ef          	jal	ra,1e14 <printf>
    19e0:	5ac020ef          	jal	ra,3f8c <sdram_get_supported_memory>
    19e4:	00050493          	mv	s1,a0
    19e8:	00005537          	lui	a0,0x5
    19ec:	a7050513          	addi	a0,a0,-1424 # 4a70 <str.2739+0x9e8>
    19f0:	00b12623          	sw	a1,12(sp)
    19f4:	420000ef          	jal	ra,1e14 <printf>
    19f8:	00c12583          	lw	a1,12(sp)
    19fc:	00048513          	mv	a0,s1
    1a00:	3c0020ef          	jal	ra,3dc0 <print_size>
    1a04:	1d8020ef          	jal	ra,3bdc <sdram_get_databits>
    1a08:	00a12623          	sw	a0,12(sp)
    1a0c:	1d8020ef          	jal	ra,3be4 <sdram_get_freq>
    1a10:	000f47b7          	lui	a5,0xf4
    1a14:	24078793          	addi	a5,a5,576 # f4240 <_edata_rom+0xee990>
    1a18:	02f54633          	div	a2,a0,a5
    1a1c:	00c12583          	lw	a1,12(sp)
    1a20:	00005537          	lui	a0,0x5
    1a24:	a8450513          	addi	a0,a0,-1404 # 4a84 <str.2739+0x9fc>
    1a28:	3ec000ef          	jal	ra,1e14 <printf>
    1a2c:	1c4020ef          	jal	ra,3bf0 <sdram_get_cl>
    1a30:	00050593          	mv	a1,a0
    1a34:	00005537          	lui	a0,0x5
    1a38:	a9850513          	addi	a0,a0,-1384 # 4a98 <str.2739+0xa10>
    1a3c:	3d8000ef          	jal	ra,1e14 <printf>
    1a40:	1b8020ef          	jal	ra,3bf8 <sdram_get_cwl>
    1a44:	fff00793          	li	a5,-1
    1a48:	00f50c63          	beq	a0,a5,1a60 <main+0x1f8>
    1a4c:	1ac020ef          	jal	ra,3bf8 <sdram_get_cwl>
    1a50:	00050593          	mv	a1,a0
    1a54:	00005537          	lui	a0,0x5
    1a58:	aa050513          	addi	a0,a0,-1376 # 4aa0 <str.2739+0xa18>
    1a5c:	3b8000ef          	jal	ra,1e14 <printf>
    1a60:	00005537          	lui	a0,0x5
    1a64:	aa850513          	addi	a0,a0,-1368 # 4aa8 <str.2739+0xa20>
    1a68:	3ac000ef          	jal	ra,1e14 <printf>
    1a6c:	00005537          	lui	a0,0x5
    1a70:	aac50513          	addi	a0,a0,-1364 # 4aac <str.2739+0xa24>
    1a74:	3a0000ef          	jal	ra,1e14 <printf>
    1a78:	00000593          	li	a1,0
    1a7c:	02000537          	lui	a0,0x2000
    1a80:	340020ef          	jal	ra,3dc0 <print_size>
    1a84:	65440513          	addi	a0,s0,1620
    1a88:	38c000ef          	jal	ra,1e14 <printf>
    1a8c:	65440513          	addi	a0,s0,1620
    1a90:	384000ef          	jal	ra,1e14 <printf>
    1a94:	00005537          	lui	a0,0x5
    1a98:	ac050513          	addi	a0,a0,-1344 # 4ac0 <str.2739+0xa38>
    1a9c:	378000ef          	jal	ra,1e14 <printf>
    1aa0:	65440513          	addi	a0,s0,1620
    1aa4:	370000ef          	jal	ra,1e14 <printf>
    1aa8:	1e0020ef          	jal	ra,3c88 <sdram_init>
    1aac:	00100793          	li	a5,1
    1ab0:	00050493          	mv	s1,a0
    1ab4:	00f50863          	beq	a0,a5,1ac4 <main+0x25c>
    1ab8:	00005537          	lui	a0,0x5
    1abc:	af450513          	addi	a0,a0,-1292 # 4af4 <str.2739+0xa6c>
    1ac0:	354000ef          	jal	ra,1e14 <printf>
    1ac4:	65440513          	addi	a0,s0,1620
    1ac8:	34c000ef          	jal	ra,1e14 <printf>
    1acc:	a7cff0ef          	jal	ra,d48 <init_dispatcher>
    1ad0:	02048663          	beqz	s1,1afc <main+0x294>
    1ad4:	00005537          	lui	a0,0x5
    1ad8:	b1450513          	addi	a0,a0,-1260 # 4b14 <str.2739+0xa8c>
    1adc:	338000ef          	jal	ra,1e14 <printf>
    1ae0:	c49fe0ef          	jal	ra,728 <serialboot>
    1ae4:	00050863          	beqz	a0,1af4 <main+0x28c>
    1ae8:	00005537          	lui	a0,0x5
    1aec:	b4850513          	addi	a0,a0,-1208 # 4b48 <str.2739+0xac0>
    1af0:	324000ef          	jal	ra,1e14 <printf>
    1af4:	65440513          	addi	a0,s0,1620
    1af8:	31c000ef          	jal	ra,1e14 <printf>
    1afc:	00005537          	lui	a0,0x5
    1b00:	b6050513          	addi	a0,a0,-1184 # 4b60 <str.2739+0xad8>
    1b04:	310000ef          	jal	ra,1e14 <printf>
    1b08:	00005937          	lui	s2,0x5
    1b0c:	000054b7          	lui	s1,0x5
    1b10:	b9490593          	addi	a1,s2,-1132 # 4b94 <str.2739+0xb0c>
    1b14:	ba848513          	addi	a0,s1,-1112 # 4ba8 <str.2739+0xb20>
    1b18:	2fc000ef          	jal	ra,1e14 <printf>
    1b1c:	000059b7          	lui	s3,0x5
    1b20:	04000593          	li	a1,64
    1b24:	04010513          	addi	a0,sp,64
    1b28:	05c000ef          	jal	ra,1b84 <readline>
    1b2c:	04014783          	lbu	a5,64(sp)
    1b30:	02078c63          	beqz	a5,1b68 <main+0x300>
    1b34:	65440513          	addi	a0,s0,1620
    1b38:	2dc000ef          	jal	ra,1e14 <printf>
    1b3c:	02010613          	addi	a2,sp,32
    1b40:	01c10593          	addi	a1,sp,28
    1b44:	04010513          	addi	a0,sp,64
    1b48:	8d4ff0ef          	jal	ra,c1c <get_param>
    1b4c:	00050593          	mv	a1,a0
    1b50:	01c12503          	lw	a0,28(sp)
    1b54:	02010613          	addi	a2,sp,32
    1b58:	958ff0ef          	jal	ra,cb0 <command_dispatcher>
    1b5c:	00051663          	bnez	a0,1b68 <main+0x300>
    1b60:	bac98513          	addi	a0,s3,-1108 # 4bac <str.2739+0xb24>
    1b64:	2b0000ef          	jal	ra,1e14 <printf>
    1b68:	b9490593          	addi	a1,s2,-1132
    1b6c:	ba848513          	addi	a0,s1,-1112
    1b70:	2a4000ef          	jal	ra,1e14 <printf>
    1b74:	fadff06f          	j	1b20 <main+0x2b8>

00001b78 <set_idle_hook>:
    1b78:	100007b7          	lui	a5,0x10000
    1b7c:	14a7a223          	sw	a0,324(a5) # 10000144 <idle_hook_ptr>
    1b80:	00008067          	ret

00001b84 <readline>:
    1b84:	000057b7          	lui	a5,0x5
    1b88:	7187a783          	lw	a5,1816(a5) # 5718 <stdin>
    1b8c:	fc010113          	addi	sp,sp,-64
    1b90:	02812c23          	sw	s0,56(sp)
    1b94:	00f12623          	sw	a5,12(sp)
    1b98:	000057b7          	lui	a5,0x5
    1b9c:	7207a783          	lw	a5,1824(a5) # 5720 <stdout>
    1ba0:	02912a23          	sw	s1,52(sp)
    1ba4:	03212823          	sw	s2,48(sp)
    1ba8:	03312623          	sw	s3,44(sp)
    1bac:	03412423          	sw	s4,40(sp)
    1bb0:	03512223          	sw	s5,36(sp)
    1bb4:	02112e23          	sw	ra,60(sp)
    1bb8:	00050a93          	mv	s5,a0
    1bbc:	00010ea3          	sb	zero,29(sp)
    1bc0:	00000413          	li	s0,0
    1bc4:	100009b7          	lui	s3,0x10000
    1bc8:	100004b7          	lui	s1,0x10000
    1bcc:	00f12423          	sw	a5,8(sp)
    1bd0:	00a00913          	li	s2,10
    1bd4:	00005a37          	lui	s4,0x5
    1bd8:	1449a783          	lw	a5,324(s3) # 10000144 <idle_hook_ptr>
    1bdc:	04079c63          	bnez	a5,1c34 <readline+0xb0>
    1be0:	00c12503          	lw	a0,12(sp)
    1be4:	144000ef          	jal	ra,1d28 <fgetc>
    1be8:	1404c703          	lbu	a4,320(s1) # 10000140 <skip.1899>
    1bec:	0ff57793          	andi	a5,a0,255
    1bf0:	00f10e23          	sb	a5,28(sp)
    1bf4:	fef702e3          	beq	a4,a5,1bd8 <readline+0x54>
    1bf8:	14048023          	sb	zero,320(s1)
    1bfc:	09278c63          	beq	a5,s2,1c94 <readline+0x110>
    1c00:	04f96063          	bltu	s2,a5,1c40 <readline+0xbc>
    1c04:	00700713          	li	a4,7
    1c08:	fce788e3          	beq	a5,a4,1bd8 <readline+0x54>
    1c0c:	00800713          	li	a4,8
    1c10:	08e79863          	bne	a5,a4,1ca0 <readline+0x11c>
    1c14:	fc0402e3          	beqz	s0,1bd8 <readline+0x54>
    1c18:	00812583          	lw	a1,8(sp)
    1c1c:	bc0a0513          	addi	a0,s4,-1088 # 4bc0 <str.2739+0xb38>
    1c20:	fff40413          	addi	s0,s0,-1
    1c24:	180000ef          	jal	ra,1da4 <fputs>
    1c28:	fb1ff06f          	j	1bd8 <readline+0x54>
    1c2c:	1449a783          	lw	a5,324(s3)
    1c30:	000780e7          	jalr	a5
    1c34:	481010ef          	jal	ra,38b4 <uart_read_nonblock>
    1c38:	fe050ae3          	beqz	a0,1c2c <readline+0xa8>
    1c3c:	fa5ff06f          	j	1be0 <readline+0x5c>
    1c40:	00d00713          	li	a4,13
    1c44:	00e78663          	beq	a5,a4,1c50 <readline+0xcc>
    1c48:	07f00713          	li	a4,127
    1c4c:	fc5ff06f          	j	1c10 <readline+0x8c>
    1c50:	15248023          	sb	s2,320(s1)
    1c54:	008a8433          	add	s0,s5,s0
    1c58:	00040023          	sb	zero,0(s0)
    1c5c:	00812583          	lw	a1,8(sp)
    1c60:	00005537          	lui	a0,0x5
    1c64:	65450513          	addi	a0,a0,1620 # 5654 <crc_table+0x63c>
    1c68:	13c000ef          	jal	ra,1da4 <fputs>
    1c6c:	03c12083          	lw	ra,60(sp)
    1c70:	03812403          	lw	s0,56(sp)
    1c74:	03412483          	lw	s1,52(sp)
    1c78:	03012903          	lw	s2,48(sp)
    1c7c:	02c12983          	lw	s3,44(sp)
    1c80:	02812a03          	lw	s4,40(sp)
    1c84:	02412a83          	lw	s5,36(sp)
    1c88:	00000513          	li	a0,0
    1c8c:	04010113          	addi	sp,sp,64
    1c90:	00008067          	ret
    1c94:	00d00793          	li	a5,13
    1c98:	14f48023          	sb	a5,320(s1)
    1c9c:	fb9ff06f          	j	1c54 <readline+0xd0>
    1ca0:	00812583          	lw	a1,8(sp)
    1ca4:	01c10513          	addi	a0,sp,28
    1ca8:	0fc000ef          	jal	ra,1da4 <fputs>
    1cac:	01c14703          	lbu	a4,28(sp)
    1cb0:	008a87b3          	add	a5,s5,s0
    1cb4:	00140413          	addi	s0,s0,1
    1cb8:	00e78023          	sb	a4,0(a5)
    1cbc:	f1dff06f          	j	1bd8 <readline+0x54>

00001cc0 <memcpy>:
    1cc0:	00050313          	mv	t1,a0
    1cc4:	00060e63          	beqz	a2,1ce0 <memcpy+0x20>
    1cc8:	00058383          	lb	t2,0(a1)
    1ccc:	00730023          	sb	t2,0(t1)
    1cd0:	fff60613          	addi	a2,a2,-1
    1cd4:	00130313          	addi	t1,t1,1
    1cd8:	00158593          	addi	a1,a1,1
    1cdc:	fe0616e3          	bnez	a2,1cc8 <memcpy+0x8>
    1ce0:	00008067          	ret

00001ce4 <strcmp>:
    1ce4:	00054603          	lbu	a2,0(a0)
    1ce8:	0005c683          	lbu	a3,0(a1)
    1cec:	00150513          	addi	a0,a0,1
    1cf0:	00158593          	addi	a1,a1,1
    1cf4:	00d61463          	bne	a2,a3,1cfc <strcmp+0x18>
    1cf8:	fe0616e3          	bnez	a2,1ce4 <strcmp>
    1cfc:	40d60533          	sub	a0,a2,a3
    1d00:	00008067          	ret

00001d04 <strnlen>:
    1d04:	00b505b3          	add	a1,a0,a1
    1d08:	00050793          	mv	a5,a0
    1d0c:	00b79663          	bne	a5,a1,1d18 <strnlen+0x14>
    1d10:	40a78533          	sub	a0,a5,a0
    1d14:	00008067          	ret
    1d18:	0007c703          	lbu	a4,0(a5)
    1d1c:	fe070ae3          	beqz	a4,1d10 <strnlen+0xc>
    1d20:	00178793          	addi	a5,a5,1
    1d24:	fe9ff06f          	j	1d0c <strnlen+0x8>

00001d28 <fgetc>:
    1d28:	00254783          	lbu	a5,2(a0)
    1d2c:	0017f793          	andi	a5,a5,1
    1d30:	06078663          	beqz	a5,1d9c <fgetc+0x74>
    1d34:	ff010113          	addi	sp,sp,-16
    1d38:	00055783          	lhu	a5,0(a0)
    1d3c:	00812423          	sw	s0,8(sp)
    1d40:	00112623          	sw	ra,12(sp)
    1d44:	00051023          	sh	zero,0(a0)
    1d48:	00050413          	mv	s0,a0
    1d4c:	00078c63          	beqz	a5,1d64 <fgetc+0x3c>
    1d50:	0ff7f513          	andi	a0,a5,255
    1d54:	00c12083          	lw	ra,12(sp)
    1d58:	00812403          	lw	s0,8(sp)
    1d5c:	01010113          	addi	sp,sp,16
    1d60:	00008067          	ret
    1d64:	00852783          	lw	a5,8(a0)
    1d68:	000780e7          	jalr	a5
    1d6c:	00050793          	mv	a5,a0
    1d70:	0ff57513          	andi	a0,a0,255
    1d74:	fe07d0e3          	bgez	a5,1d54 <fgetc+0x2c>
    1d78:	fff00613          	li	a2,-1
    1d7c:	00240703          	lb	a4,2(s0)
    1d80:	00400693          	li	a3,4
    1d84:	00c78463          	beq	a5,a2,1d8c <fgetc+0x64>
    1d88:	00800693          	li	a3,8
    1d8c:	00d767b3          	or	a5,a4,a3
    1d90:	00f40123          	sb	a5,2(s0)
    1d94:	fff00513          	li	a0,-1
    1d98:	fbdff06f          	j	1d54 <fgetc+0x2c>
    1d9c:	fff00513          	li	a0,-1
    1da0:	00008067          	ret

00001da4 <fputs>:
    1da4:	ff010113          	addi	sp,sp,-16
    1da8:	01212023          	sw	s2,0(sp)
    1dac:	00112623          	sw	ra,12(sp)
    1db0:	00812423          	sw	s0,8(sp)
    1db4:	00912223          	sw	s1,4(sp)
    1db8:	0025c783          	lbu	a5,2(a1)
    1dbc:	fff00913          	li	s2,-1
    1dc0:	0027f793          	andi	a5,a5,2
    1dc4:	00078e63          	beqz	a5,1de0 <fputs+0x3c>
    1dc8:	00050413          	mv	s0,a0
    1dcc:	00058493          	mv	s1,a1
    1dd0:	00000913          	li	s2,0
    1dd4:	00044503          	lbu	a0,0(s0)
    1dd8:	00140413          	addi	s0,s0,1
    1ddc:	02051063          	bnez	a0,1dfc <fputs+0x58>
    1de0:	00c12083          	lw	ra,12(sp)
    1de4:	00812403          	lw	s0,8(sp)
    1de8:	00412483          	lw	s1,4(sp)
    1dec:	00090513          	mv	a0,s2
    1df0:	00012903          	lw	s2,0(sp)
    1df4:	01010113          	addi	sp,sp,16
    1df8:	00008067          	ret
    1dfc:	0044a783          	lw	a5,4(s1)
    1e00:	00048593          	mv	a1,s1
    1e04:	000780e7          	jalr	a5
    1e08:	fc0556e3          	bgez	a0,1dd4 <fputs+0x30>
    1e0c:	fff00913          	li	s2,-1
    1e10:	fc5ff06f          	j	1dd4 <fputs+0x30>

00001e14 <printf>:
    1e14:	fc010113          	addi	sp,sp,-64
    1e18:	02f12a23          	sw	a5,52(sp)
    1e1c:	000057b7          	lui	a5,0x5
    1e20:	02b12223          	sw	a1,36(sp)
    1e24:	00050593          	mv	a1,a0
    1e28:	7207a503          	lw	a0,1824(a5) # 5720 <stdout>
    1e2c:	02c12423          	sw	a2,40(sp)
    1e30:	02410613          	addi	a2,sp,36
    1e34:	00112e23          	sw	ra,28(sp)
    1e38:	02d12623          	sw	a3,44(sp)
    1e3c:	02e12823          	sw	a4,48(sp)
    1e40:	03012c23          	sw	a6,56(sp)
    1e44:	03112e23          	sw	a7,60(sp)
    1e48:	00c12623          	sw	a2,12(sp)
    1e4c:	2d0000ef          	jal	ra,211c <__i_vfprintf>
    1e50:	01c12083          	lw	ra,28(sp)
    1e54:	04010113          	addi	sp,sp,64
    1e58:	00008067          	ret

00001e5c <puts>:
    1e5c:	000057b7          	lui	a5,0x5
    1e60:	7207a583          	lw	a1,1824(a5) # 5720 <stdout>
    1e64:	fe010113          	addi	sp,sp,-32
    1e68:	00812c23          	sw	s0,24(sp)
    1e6c:	00912a23          	sw	s1,20(sp)
    1e70:	00112e23          	sw	ra,28(sp)
    1e74:	0025c783          	lbu	a5,2(a1)
    1e78:	00050413          	mv	s0,a0
    1e7c:	00000493          	li	s1,0
    1e80:	0027f793          	andi	a5,a5,2
    1e84:	02079a63          	bnez	a5,1eb8 <puts+0x5c>
    1e88:	fff00493          	li	s1,-1
    1e8c:	01c12083          	lw	ra,28(sp)
    1e90:	01812403          	lw	s0,24(sp)
    1e94:	00048513          	mv	a0,s1
    1e98:	01412483          	lw	s1,20(sp)
    1e9c:	02010113          	addi	sp,sp,32
    1ea0:	00008067          	ret
    1ea4:	00b12623          	sw	a1,12(sp)
    1ea8:	000780e7          	jalr	a5
    1eac:	00c12583          	lw	a1,12(sp)
    1eb0:	00055463          	bgez	a0,1eb8 <puts+0x5c>
    1eb4:	fff00493          	li	s1,-1
    1eb8:	00044503          	lbu	a0,0(s0)
    1ebc:	00140413          	addi	s0,s0,1
    1ec0:	0045a783          	lw	a5,4(a1)
    1ec4:	fe0510e3          	bnez	a0,1ea4 <puts+0x48>
    1ec8:	00a00513          	li	a0,10
    1ecc:	000780e7          	jalr	a5
    1ed0:	fa055ee3          	bgez	a0,1e8c <puts+0x30>
    1ed4:	fb5ff06f          	j	1e88 <puts+0x2c>

00001ed8 <strtoul>:
    1ed8:	02400793          	li	a5,36
    1edc:	00050813          	mv	a6,a0
    1ee0:	00c7e663          	bltu	a5,a2,1eec <strtoul+0x14>
    1ee4:	00100793          	li	a5,1
    1ee8:	02f61063          	bne	a2,a5,1f08 <strtoul+0x30>
    1eec:	100007b7          	lui	a5,0x10000
    1ef0:	01600713          	li	a4,22
    1ef4:	14e7a423          	sw	a4,328(a5) # 10000148 <errno>
    1ef8:	00000513          	li	a0,0
    1efc:	00058463          	beqz	a1,1f04 <strtoul+0x2c>
    1f00:	0105a023          	sw	a6,0(a1)
    1f04:	00008067          	ret
    1f08:	0ff67893          	andi	a7,a2,255
    1f0c:	00400e13          	li	t3,4
    1f10:	02000313          	li	t1,32
    1f14:	00054783          	lbu	a5,0(a0)
    1f18:	00150713          	addi	a4,a0,1
    1f1c:	ff778693          	addi	a3,a5,-9
    1f20:	0ff6f693          	andi	a3,a3,255
    1f24:	0ade7a63          	bgeu	t3,a3,1fd8 <strtoul+0x100>
    1f28:	0a678863          	beq	a5,t1,1fd8 <strtoul+0x100>
    1f2c:	02b00693          	li	a3,43
    1f30:	0ad78863          	beq	a5,a3,1fe0 <strtoul+0x108>
    1f34:	02d00313          	li	t1,45
    1f38:	00000693          	li	a3,0
    1f3c:	00679863          	bne	a5,t1,1f4c <strtoul+0x74>
    1f40:	00100693          	li	a3,1
    1f44:	00154783          	lbu	a5,1(a0)
    1f48:	00250713          	addi	a4,a0,2
    1f4c:	03000513          	li	a0,48
    1f50:	0aa79263          	bne	a5,a0,1ff4 <strtoul+0x11c>
    1f54:	00074503          	lbu	a0,0(a4)
    1f58:	07800313          	li	t1,120
    1f5c:	02056513          	ori	a0,a0,32
    1f60:	08651463          	bne	a0,t1,1fe8 <strtoul+0x110>
    1f64:	00060663          	beqz	a2,1f70 <strtoul+0x98>
    1f68:	01000513          	li	a0,16
    1f6c:	00a61a63          	bne	a2,a0,1f80 <strtoul+0xa8>
    1f70:	00174783          	lbu	a5,1(a4)
    1f74:	00070813          	mv	a6,a4
    1f78:	01000893          	li	a7,16
    1f7c:	00270713          	addi	a4,a4,2
    1f80:	00000513          	li	a0,0
    1f84:	03900613          	li	a2,57
    1f88:	00f67a63          	bgeu	a2,a5,1f9c <strtoul+0xc4>
    1f8c:	fff78793          	addi	a5,a5,-1
    1f90:	0207e793          	ori	a5,a5,32
    1f94:	fda78793          	addi	a5,a5,-38
    1f98:	0ff7f793          	andi	a5,a5,255
    1f9c:	fd078793          	addi	a5,a5,-48
    1fa0:	0ff7f793          	andi	a5,a5,255
    1fa4:	0517fe63          	bgeu	a5,a7,2000 <strtoul+0x128>
    1fa8:	03153833          	mulhu	a6,a0,a7
    1fac:	03150533          	mul	a0,a0,a7
    1fb0:	00081a63          	bnez	a6,1fc4 <strtoul+0xec>
    1fb4:	00f507b3          	add	a5,a0,a5
    1fb8:	00a7b833          	sltu	a6,a5,a0
    1fbc:	00078513          	mv	a0,a5
    1fc0:	00080463          	beqz	a6,1fc8 <strtoul+0xf0>
    1fc4:	0026e693          	ori	a3,a3,2
    1fc8:	00074783          	lbu	a5,0(a4)
    1fcc:	00070813          	mv	a6,a4
    1fd0:	00170713          	addi	a4,a4,1
    1fd4:	fb5ff06f          	j	1f88 <strtoul+0xb0>
    1fd8:	00070513          	mv	a0,a4
    1fdc:	f39ff06f          	j	1f14 <strtoul+0x3c>
    1fe0:	00000693          	li	a3,0
    1fe4:	f61ff06f          	j	1f44 <strtoul+0x6c>
    1fe8:	f8061ce3          	bnez	a2,1f80 <strtoul+0xa8>
    1fec:	00800893          	li	a7,8
    1ff0:	f91ff06f          	j	1f80 <strtoul+0xa8>
    1ff4:	f80616e3          	bnez	a2,1f80 <strtoul+0xa8>
    1ff8:	00a00893          	li	a7,10
    1ffc:	f85ff06f          	j	1f80 <strtoul+0xa8>
    2000:	0016f793          	andi	a5,a3,1
    2004:	00078463          	beqz	a5,200c <strtoul+0x134>
    2008:	40a00533          	neg	a0,a0
    200c:	0026f693          	andi	a3,a3,2
    2010:	ee0686e3          	beqz	a3,1efc <strtoul+0x24>
    2014:	100007b7          	lui	a5,0x10000
    2018:	02200713          	li	a4,34
    201c:	14e7a423          	sw	a4,328(a5) # 10000148 <errno>
    2020:	fff00513          	li	a0,-1
    2024:	ed9ff06f          	j	1efc <strtoul+0x24>

00002028 <__ultoa_invert>:
    2028:	fd010113          	addi	sp,sp,-48
    202c:	02912223          	sw	s1,36(sp)
    2030:	03212023          	sw	s2,32(sp)
    2034:	01312e23          	sw	s3,28(sp)
    2038:	01412c23          	sw	s4,24(sp)
    203c:	01612823          	sw	s6,16(sp)
    2040:	02112623          	sw	ra,44(sp)
    2044:	02812423          	sw	s0,40(sp)
    2048:	01512a23          	sw	s5,20(sp)
    204c:	01712623          	sw	s7,12(sp)
    2050:	01812423          	sw	s8,8(sp)
    2054:	01912223          	sw	s9,4(sp)
    2058:	2006f793          	andi	a5,a3,512
    205c:	00050993          	mv	s3,a0
    2060:	00058a13          	mv	s4,a1
    2064:	00060913          	mv	s2,a2
    2068:	00068493          	mv	s1,a3
    206c:	02700b13          	li	s6,39
    2070:	00078663          	beqz	a5,207c <__ultoa_invert+0x54>
    2074:	dff6f493          	andi	s1,a3,-513
    2078:	00700b13          	li	s6,7
    207c:	41f4da93          	srai	s5,s1,0x1f
    2080:	00900c93          	li	s9,9
    2084:	00048613          	mv	a2,s1
    2088:	000a8693          	mv	a3,s5
    208c:	00098513          	mv	a0,s3
    2090:	000a0593          	mv	a1,s4
    2094:	3b5000ef          	jal	ra,2c48 <__umoddi3>
    2098:	000a0593          	mv	a1,s4
    209c:	0ff57413          	andi	s0,a0,255
    20a0:	00048613          	mv	a2,s1
    20a4:	00098513          	mv	a0,s3
    20a8:	000a8693          	mv	a3,s5
    20ac:	395000ef          	jal	ra,2c40 <__udivdi3>
    20b0:	00098c13          	mv	s8,s3
    20b4:	000a0b93          	mv	s7,s4
    20b8:	00050993          	mv	s3,a0
    20bc:	00058a13          	mv	s4,a1
    20c0:	008cf663          	bgeu	s9,s0,20cc <__ultoa_invert+0xa4>
    20c4:	01640433          	add	s0,s0,s6
    20c8:	0ff47413          	andi	s0,s0,255
    20cc:	00190913          	addi	s2,s2,1
    20d0:	03040413          	addi	s0,s0,48
    20d4:	fe890fa3          	sb	s0,-1(s2)
    20d8:	015be663          	bltu	s7,s5,20e4 <__ultoa_invert+0xbc>
    20dc:	fb7a94e3          	bne	s5,s7,2084 <__ultoa_invert+0x5c>
    20e0:	fa9c72e3          	bgeu	s8,s1,2084 <__ultoa_invert+0x5c>
    20e4:	02c12083          	lw	ra,44(sp)
    20e8:	02812403          	lw	s0,40(sp)
    20ec:	02412483          	lw	s1,36(sp)
    20f0:	01c12983          	lw	s3,28(sp)
    20f4:	01812a03          	lw	s4,24(sp)
    20f8:	01412a83          	lw	s5,20(sp)
    20fc:	01012b03          	lw	s6,16(sp)
    2100:	00c12b83          	lw	s7,12(sp)
    2104:	00812c03          	lw	s8,8(sp)
    2108:	00412c83          	lw	s9,4(sp)
    210c:	00090513          	mv	a0,s2
    2110:	02012903          	lw	s2,32(sp)
    2114:	03010113          	addi	sp,sp,48
    2118:	00008067          	ret

0000211c <__i_vfprintf>:
    211c:	f9010113          	addi	sp,sp,-112
    2120:	05412c23          	sw	s4,88(sp)
    2124:	06112623          	sw	ra,108(sp)
    2128:	06812423          	sw	s0,104(sp)
    212c:	06912223          	sw	s1,100(sp)
    2130:	07212023          	sw	s2,96(sp)
    2134:	05312e23          	sw	s3,92(sp)
    2138:	05512a23          	sw	s5,84(sp)
    213c:	05612823          	sw	s6,80(sp)
    2140:	05712623          	sw	s7,76(sp)
    2144:	05812423          	sw	s8,72(sp)
    2148:	05912223          	sw	s9,68(sp)
    214c:	05a12023          	sw	s10,64(sp)
    2150:	03b12e23          	sw	s11,60(sp)
    2154:	00254783          	lbu	a5,2(a0)
    2158:	00452a03          	lw	s4,4(a0)
    215c:	0027f793          	andi	a5,a5,2
    2160:	2c078663          	beqz	a5,242c <__i_vfprintf+0x310>
    2164:	000057b7          	lui	a5,0x5
    2168:	bd478793          	addi	a5,a5,-1068 # 4bd4 <str.2739+0xb4c>
    216c:	00005cb7          	lui	s9,0x5
    2170:	00f12023          	sw	a5,0(sp)
    2174:	00005d37          	lui	s10,0x5
    2178:	bccc8793          	addi	a5,s9,-1076 # 4bcc <str.2739+0xb44>
    217c:	00f12223          	sw	a5,4(sp)
    2180:	bc4d0793          	addi	a5,s10,-1084 # 4bc4 <str.2739+0xb3c>
    2184:	00050993          	mv	s3,a0
    2188:	00060493          	mv	s1,a2
    218c:	00000c13          	li	s8,0
    2190:	01810a93          	addi	s5,sp,24
    2194:	00f12423          	sw	a5,8(sp)
    2198:	0005cd83          	lbu	s11,0(a1)
    219c:	280d8a63          	beqz	s11,2430 <__i_vfprintf+0x314>
    21a0:	02500713          	li	a4,37
    21a4:	00158b93          	addi	s7,a1,1
    21a8:	00ed9863          	bne	s11,a4,21b8 <__i_vfprintf+0x9c>
    21ac:	0015cd83          	lbu	s11,1(a1)
    21b0:	00258b93          	addi	s7,a1,2
    21b4:	02ed9063          	bne	s11,a4,21d4 <__i_vfprintf+0xb8>
    21b8:	001c0c13          	addi	s8,s8,1
    21bc:	00098593          	mv	a1,s3
    21c0:	000d8513          	mv	a0,s11
    21c4:	000a00e7          	jalr	s4
    21c8:	26054263          	bltz	a0,242c <__i_vfprintf+0x310>
    21cc:	000b8593          	mv	a1,s7
    21d0:	fc9ff06f          	j	2198 <__i_vfprintf+0x7c>
    21d4:	00000d13          	li	s10,0
    21d8:	00000913          	li	s2,0
    21dc:	00000413          	li	s0,0
    21e0:	01f00593          	li	a1,31
    21e4:	06c00813          	li	a6,108
    21e8:	06800893          	li	a7,104
    21ec:	04c00313          	li	t1,76
    21f0:	06a00e13          	li	t3,106
    21f4:	07a00e93          	li	t4,122
    21f8:	07400f13          	li	t5,116
    21fc:	00900f93          	li	t6,9
    2200:	02a00293          	li	t0,42
    2204:	02e00393          	li	t2,46
    2208:	00a00613          	li	a2,10
    220c:	07f00b13          	li	s6,127
    2210:	01000513          	li	a0,16
    2214:	0485ea63          	bltu	a1,s0,2268 <__i_vfprintf+0x14c>
    2218:	fe0d8693          	addi	a3,s11,-32
    221c:	0ff6f693          	andi	a3,a3,255
    2220:	04d56663          	bltu	a0,a3,226c <__i_vfprintf+0x150>
    2224:	00012783          	lw	a5,0(sp)
    2228:	00269693          	slli	a3,a3,0x2
    222c:	00f686b3          	add	a3,a3,a5
    2230:	0006a683          	lw	a3,0(a3)
    2234:	00068067          	jr	a3
    2238:	00146413          	ori	s0,s0,1
    223c:	000bcd83          	lbu	s11,0(s7)
    2240:	001b8b93          	addi	s7,s7,1
    2244:	fc0d98e3          	bnez	s11,2214 <__i_vfprintf+0xf8>
    2248:	0e00006f          	j	2328 <__i_vfprintf+0x20c>
    224c:	00246413          	ori	s0,s0,2
    2250:	00446413          	ori	s0,s0,4
    2254:	fe9ff06f          	j	223c <__i_vfprintf+0x120>
    2258:	00846413          	ori	s0,s0,8
    225c:	fe1ff06f          	j	223c <__i_vfprintf+0x120>
    2260:	01046413          	ori	s0,s0,16
    2264:	fd9ff06f          	j	223c <__i_vfprintf+0x120>
    2268:	068b6c63          	bltu	s6,s0,22e0 <__i_vfprintf+0x1c4>
    226c:	fd0d8693          	addi	a3,s11,-48
    2270:	0ff6f693          	andi	a3,a3,255
    2274:	02dfe463          	bltu	t6,a3,229c <__i_vfprintf+0x180>
    2278:	04047d93          	andi	s11,s0,64
    227c:	000d8863          	beqz	s11,228c <__i_vfprintf+0x170>
    2280:	02cd0733          	mul	a4,s10,a2
    2284:	00d70d33          	add	s10,a4,a3
    2288:	fb5ff06f          	j	223c <__i_vfprintf+0x120>
    228c:	02c90933          	mul	s2,s2,a2
    2290:	02046413          	ori	s0,s0,32
    2294:	00d90933          	add	s2,s2,a3
    2298:	fa5ff06f          	j	223c <__i_vfprintf+0x120>
    229c:	025d9863          	bne	s11,t0,22cc <__i_vfprintf+0x1b0>
    22a0:	04047d93          	andi	s11,s0,64
    22a4:	0004a683          	lw	a3,0(s1)
    22a8:	00448493          	addi	s1,s1,4
    22ac:	0c0d9e63          	bnez	s11,2388 <__i_vfprintf+0x26c>
    22b0:	0006c863          	bltz	a3,22c0 <__i_vfprintf+0x1a4>
    22b4:	02046413          	ori	s0,s0,32
    22b8:	00068913          	mv	s2,a3
    22bc:	f81ff06f          	j	223c <__i_vfprintf+0x120>
    22c0:	40d00933          	neg	s2,a3
    22c4:	02846413          	ori	s0,s0,40
    22c8:	f75ff06f          	j	223c <__i_vfprintf+0x120>
    22cc:	007d9a63          	bne	s11,t2,22e0 <__i_vfprintf+0x1c4>
    22d0:	04047693          	andi	a3,s0,64
    22d4:	14069e63          	bnez	a3,2430 <__i_vfprintf+0x314>
    22d8:	04046413          	ori	s0,s0,64
    22dc:	f61ff06f          	j	223c <__i_vfprintf+0x120>
    22e0:	010d9c63          	bne	s11,a6,22f8 <__i_vfprintf+0x1dc>
    22e4:	08047693          	andi	a3,s0,128
    22e8:	00068463          	beqz	a3,22f0 <__i_vfprintf+0x1d4>
    22ec:	20046413          	ori	s0,s0,512
    22f0:	08046413          	ori	s0,s0,128
    22f4:	f49ff06f          	j	223c <__i_vfprintf+0x120>
    22f8:	011d9c63          	bne	s11,a7,2310 <__i_vfprintf+0x1f4>
    22fc:	10047693          	andi	a3,s0,256
    2300:	00068463          	beqz	a3,2308 <__i_vfprintf+0x1ec>
    2304:	20046413          	ori	s0,s0,512
    2308:	10046413          	ori	s0,s0,256
    230c:	f31ff06f          	j	223c <__i_vfprintf+0x120>
    2310:	006d9663          	bne	s11,t1,231c <__i_vfprintf+0x200>
    2314:	28046413          	ori	s0,s0,640
    2318:	f25ff06f          	j	223c <__i_vfprintf+0x120>
    231c:	ffcd8ce3          	beq	s11,t3,2314 <__i_vfprintf+0x1f8>
    2320:	f1dd8ee3          	beq	s11,t4,223c <__i_vfprintf+0x120>
    2324:	f1ed8ce3          	beq	s11,t5,223c <__i_vfprintf+0x120>
    2328:	000d5a63          	bgez	s10,233c <__i_vfprintf+0x220>
    232c:	fbf47413          	andi	s0,s0,-65
    2330:	01041413          	slli	s0,s0,0x10
    2334:	01045413          	srli	s0,s0,0x10
    2338:	00000d13          	li	s10,0
    233c:	020de693          	ori	a3,s11,32
    2340:	f9b68613          	addi	a2,a3,-101
    2344:	0ff67613          	andi	a2,a2,255
    2348:	00200593          	li	a1,2
    234c:	00c5f663          	bgeu	a1,a2,2358 <__i_vfprintf+0x23c>
    2350:	06100613          	li	a2,97
    2354:	02c69e63          	bne	a3,a2,2390 <__i_vfprintf+0x274>
    2358:	00748493          	addi	s1,s1,7
    235c:	00412d83          	lw	s11,4(sp)
    2360:	ff84f493          	andi	s1,s1,-8
    2364:	00848493          	addi	s1,s1,8
    2368:	00700b13          	li	s6,7
    236c:	00847413          	andi	s0,s0,8
    2370:	08040e63          	beqz	s0,240c <__i_vfprintf+0x2f0>
    2374:	00000413          	li	s0,0
    2378:	008c07b3          	add	a5,s8,s0
    237c:	088b1c63          	bne	s6,s0,2414 <__i_vfprintf+0x2f8>
    2380:	41690933          	sub	s2,s2,s6
    2384:	3800006f          	j	2704 <__i_vfprintf+0x5e8>
    2388:	00068d13          	mv	s10,a3
    238c:	eb1ff06f          	j	223c <__i_vfprintf+0x120>
    2390:	06300613          	li	a2,99
    2394:	00cd9e63          	bne	s11,a2,23b0 <__i_vfprintf+0x294>
    2398:	0004a703          	lw	a4,0(s1)
    239c:	00100b13          	li	s6,1
    23a0:	00448493          	addi	s1,s1,4
    23a4:	00e10c23          	sb	a4,24(sp)
    23a8:	000a8d93          	mv	s11,s5
    23ac:	fc1ff06f          	j	236c <__i_vfprintf+0x250>
    23b0:	07300613          	li	a2,115
    23b4:	0acd9e63          	bne	s11,a2,2470 <__i_vfprintf+0x354>
    23b8:	0004ad83          	lw	s11,0(s1)
    23bc:	00448c93          	addi	s9,s1,4
    23c0:	000d9463          	bnez	s11,23c8 <__i_vfprintf+0x2ac>
    23c4:	00812d83          	lw	s11,8(sp)
    23c8:	04047693          	andi	a3,s0,64
    23cc:	fff00593          	li	a1,-1
    23d0:	00068463          	beqz	a3,23d8 <__i_vfprintf+0x2bc>
    23d4:	000d0593          	mv	a1,s10
    23d8:	000d8513          	mv	a0,s11
    23dc:	929ff0ef          	jal	ra,1d04 <strnlen>
    23e0:	00050b13          	mv	s6,a0
    23e4:	000c8493          	mv	s1,s9
    23e8:	f85ff06f          	j	236c <__i_vfprintf+0x250>
    23ec:	00098593          	mv	a1,s3
    23f0:	02000513          	li	a0,32
    23f4:	000a00e7          	jalr	s4
    23f8:	02054a63          	bltz	a0,242c <__i_vfprintf+0x310>
    23fc:	fff90913          	addi	s2,s2,-1
    2400:	41240c33          	sub	s8,s0,s2
    2404:	ff2b64e3          	bltu	s6,s2,23ec <__i_vfprintf+0x2d0>
    2408:	f6dff06f          	j	2374 <__i_vfprintf+0x258>
    240c:	012c0433          	add	s0,s8,s2
    2410:	ff1ff06f          	j	2400 <__i_vfprintf+0x2e4>
    2414:	008d87b3          	add	a5,s11,s0
    2418:	0007c503          	lbu	a0,0(a5)
    241c:	00098593          	mv	a1,s3
    2420:	00140413          	addi	s0,s0,1
    2424:	000a00e7          	jalr	s4
    2428:	f40558e3          	bgez	a0,2378 <__i_vfprintf+0x25c>
    242c:	fff00c13          	li	s8,-1
    2430:	06c12083          	lw	ra,108(sp)
    2434:	06812403          	lw	s0,104(sp)
    2438:	06412483          	lw	s1,100(sp)
    243c:	06012903          	lw	s2,96(sp)
    2440:	05c12983          	lw	s3,92(sp)
    2444:	05812a03          	lw	s4,88(sp)
    2448:	05412a83          	lw	s5,84(sp)
    244c:	05012b03          	lw	s6,80(sp)
    2450:	04c12b83          	lw	s7,76(sp)
    2454:	04412c83          	lw	s9,68(sp)
    2458:	04012d03          	lw	s10,64(sp)
    245c:	03c12d83          	lw	s11,60(sp)
    2460:	000c0513          	mv	a0,s8
    2464:	04812c03          	lw	s8,72(sp)
    2468:	07010113          	addi	sp,sp,112
    246c:	00008067          	ret
    2470:	06400613          	li	a2,100
    2474:	00cd8663          	beq	s11,a2,2480 <__i_vfprintf+0x364>
    2478:	06900613          	li	a2,105
    247c:	0ccd9063          	bne	s11,a2,253c <__i_vfprintf+0x420>
    2480:	08047693          	andi	a3,s0,128
    2484:	08068463          	beqz	a3,250c <__i_vfprintf+0x3f0>
    2488:	20047693          	andi	a3,s0,512
    248c:	06068863          	beqz	a3,24fc <__i_vfprintf+0x3e0>
    2490:	00748493          	addi	s1,s1,7
    2494:	ff84f493          	andi	s1,s1,-8
    2498:	0004a503          	lw	a0,0(s1)
    249c:	0044a583          	lw	a1,4(s1)
    24a0:	00848b13          	addi	s6,s1,8
    24a4:	0005dc63          	bgez	a1,24bc <__i_vfprintf+0x3a0>
    24a8:	00a03633          	snez	a2,a0
    24ac:	40b006b3          	neg	a3,a1
    24b0:	40c685b3          	sub	a1,a3,a2
    24b4:	40a00533          	neg	a0,a0
    24b8:	40046413          	ori	s0,s0,1024
    24bc:	fef47813          	andi	a6,s0,-17
    24c0:	01081813          	slli	a6,a6,0x10
    24c4:	00b566b3          	or	a3,a0,a1
    24c8:	01085813          	srli	a6,a6,0x10
    24cc:	00069a63          	bnez	a3,24e0 <__i_vfprintf+0x3c4>
    24d0:	04047413          	andi	s0,s0,64
    24d4:	00040663          	beqz	s0,24e0 <__i_vfprintf+0x3c4>
    24d8:	00000c93          	li	s9,0
    24dc:	160d0863          	beqz	s10,264c <__i_vfprintf+0x530>
    24e0:	01012623          	sw	a6,12(sp)
    24e4:	00a00693          	li	a3,10
    24e8:	000a8613          	mv	a2,s5
    24ec:	b3dff0ef          	jal	ra,2028 <__ultoa_invert>
    24f0:	00c12803          	lw	a6,12(sp)
    24f4:	41550cb3          	sub	s9,a0,s5
    24f8:	1540006f          	j	264c <__i_vfprintf+0x530>
    24fc:	0004a503          	lw	a0,0(s1)
    2500:	00448b13          	addi	s6,s1,4
    2504:	41f55593          	srai	a1,a0,0x1f
    2508:	f9dff06f          	j	24a4 <__i_vfprintf+0x388>
    250c:	10047693          	andi	a3,s0,256
    2510:	0004a503          	lw	a0,0(s1)
    2514:	00448b13          	addi	s6,s1,4
    2518:	fe0686e3          	beqz	a3,2504 <__i_vfprintf+0x3e8>
    251c:	20047693          	andi	a3,s0,512
    2520:	00068863          	beqz	a3,2530 <__i_vfprintf+0x414>
    2524:	01851513          	slli	a0,a0,0x18
    2528:	41855513          	srai	a0,a0,0x18
    252c:	fd9ff06f          	j	2504 <__i_vfprintf+0x3e8>
    2530:	01051513          	slli	a0,a0,0x10
    2534:	41055513          	srai	a0,a0,0x10
    2538:	fcdff06f          	j	2504 <__i_vfprintf+0x3e8>
    253c:	07500613          	li	a2,117
    2540:	04cd9a63          	bne	s11,a2,2594 <__i_vfprintf+0x478>
    2544:	fef47413          	andi	s0,s0,-17
    2548:	01041413          	slli	s0,s0,0x10
    254c:	01045413          	srli	s0,s0,0x10
    2550:	00a00693          	li	a3,10
    2554:	08047613          	andi	a2,s0,128
    2558:	0a060663          	beqz	a2,2604 <__i_vfprintf+0x4e8>
    255c:	20047613          	andi	a2,s0,512
    2560:	08060a63          	beqz	a2,25f4 <__i_vfprintf+0x4d8>
    2564:	00748493          	addi	s1,s1,7
    2568:	ff84f493          	andi	s1,s1,-8
    256c:	0004a503          	lw	a0,0(s1)
    2570:	0044a583          	lw	a1,4(s1)
    2574:	00848b13          	addi	s6,s1,8
    2578:	00b56633          	or	a2,a0,a1
    257c:	0a060a63          	beqz	a2,2630 <__i_vfprintf+0x514>
    2580:	ff947413          	andi	s0,s0,-7
    2584:	01041813          	slli	a6,s0,0x10
    2588:	01085813          	srli	a6,a6,0x10
    258c:	01012623          	sw	a6,12(sp)
    2590:	f59ff06f          	j	24e8 <__i_vfprintf+0x3cc>
    2594:	06f00613          	li	a2,111
    2598:	04cd8863          	beq	s11,a2,25e8 <__i_vfprintf+0x4cc>
    259c:	07000613          	li	a2,112
    25a0:	00cd9a63          	bne	s11,a2,25b4 <__i_vfprintf+0x498>
    25a4:	01046413          	ori	s0,s0,16
    25a8:	01000693          	li	a3,16
    25ac:	07800d93          	li	s11,120
    25b0:	fa5ff06f          	j	2554 <__i_vfprintf+0x438>
    25b4:	07800613          	li	a2,120
    25b8:	00c69c63          	bne	a3,a2,25d0 <__i_vfprintf+0x4b4>
    25bc:	05800613          	li	a2,88
    25c0:	01000693          	li	a3,16
    25c4:	f8cd98e3          	bne	s11,a2,2554 <__i_vfprintf+0x438>
    25c8:	21000693          	li	a3,528
    25cc:	f89ff06f          	j	2554 <__i_vfprintf+0x438>
    25d0:	00098593          	mv	a1,s3
    25d4:	02500513          	li	a0,37
    25d8:	000a00e7          	jalr	s4
    25dc:	e40548e3          	bltz	a0,242c <__i_vfprintf+0x310>
    25e0:	002c0c13          	addi	s8,s8,2
    25e4:	bd9ff06f          	j	21bc <__i_vfprintf+0xa0>
    25e8:	00800693          	li	a3,8
    25ec:	00000d93          	li	s11,0
    25f0:	f65ff06f          	j	2554 <__i_vfprintf+0x438>
    25f4:	0004a503          	lw	a0,0(s1)
    25f8:	00448b13          	addi	s6,s1,4
    25fc:	00000593          	li	a1,0
    2600:	f79ff06f          	j	2578 <__i_vfprintf+0x45c>
    2604:	10047613          	andi	a2,s0,256
    2608:	0004a503          	lw	a0,0(s1)
    260c:	00448b13          	addi	s6,s1,4
    2610:	fe0606e3          	beqz	a2,25fc <__i_vfprintf+0x4e0>
    2614:	20047613          	andi	a2,s0,512
    2618:	00060663          	beqz	a2,2624 <__i_vfprintf+0x508>
    261c:	0ff57513          	andi	a0,a0,255
    2620:	fddff06f          	j	25fc <__i_vfprintf+0x4e0>
    2624:	01051513          	slli	a0,a0,0x10
    2628:	01055513          	srli	a0,a0,0x10
    262c:	fd1ff06f          	j	25fc <__i_vfprintf+0x4e0>
    2630:	fe947813          	andi	a6,s0,-23
    2634:	01081813          	slli	a6,a6,0x10
    2638:	04047413          	andi	s0,s0,64
    263c:	01085813          	srli	a6,a6,0x10
    2640:	f40406e3          	beqz	s0,258c <__i_vfprintf+0x470>
    2644:	00000c93          	li	s9,0
    2648:	f40d12e3          	bnez	s10,258c <__i_vfprintf+0x470>
    264c:	04087693          	andi	a3,a6,64
    2650:	04068063          	beqz	a3,2690 <__i_vfprintf+0x574>
    2654:	ffe87413          	andi	s0,a6,-2
    2658:	01041413          	slli	s0,s0,0x10
    265c:	01045413          	srli	s0,s0,0x10
    2660:	000c8493          	mv	s1,s9
    2664:	01acdc63          	bge	s9,s10,267c <__i_vfprintf+0x560>
    2668:	000d0493          	mv	s1,s10
    266c:	000d9863          	bnez	s11,267c <__i_vfprintf+0x560>
    2670:	fee87413          	andi	s0,a6,-18
    2674:	01041413          	slli	s0,s0,0x10
    2678:	01045413          	srli	s0,s0,0x10
    267c:	01047693          	andi	a3,s0,16
    2680:	08068863          	beqz	a3,2710 <__i_vfprintf+0x5f4>
    2684:	000d9c63          	bnez	s11,269c <__i_vfprintf+0x580>
    2688:	00148493          	addi	s1,s1,1
    268c:	0140006f          	j	26a0 <__i_vfprintf+0x584>
    2690:	000c8493          	mv	s1,s9
    2694:	00080413          	mv	s0,a6
    2698:	fe5ff06f          	j	267c <__i_vfprintf+0x560>
    269c:	00248493          	addi	s1,s1,2
    26a0:	00847593          	andi	a1,s0,8
    26a4:	02059063          	bnez	a1,26c4 <__i_vfprintf+0x5a8>
    26a8:	00147593          	andi	a1,s0,1
    26ac:	08058e63          	beqz	a1,2748 <__i_vfprintf+0x62c>
    26b0:	000c8d13          	mv	s10,s9
    26b4:	0124d863          	bge	s1,s2,26c4 <__i_vfprintf+0x5a8>
    26b8:	409904b3          	sub	s1,s2,s1
    26bc:	01948d33          	add	s10,s1,s9
    26c0:	00090493          	mv	s1,s2
    26c4:	0a068263          	beqz	a3,2768 <__i_vfprintf+0x64c>
    26c8:	00098593          	mv	a1,s3
    26cc:	03000513          	li	a0,48
    26d0:	000a00e7          	jalr	s4
    26d4:	d4054ce3          	bltz	a0,242c <__i_vfprintf+0x310>
    26d8:	060d9c63          	bnez	s11,2750 <__i_vfprintf+0x634>
    26dc:	001c0c13          	addi	s8,s8,1
    26e0:	01ac0db3          	add	s11,s8,s10
    26e4:	418d8733          	sub	a4,s11,s8
    26e8:	0aecc863          	blt	s9,a4,2798 <__i_vfprintf+0x67c>
    26ec:	000c8413          	mv	s0,s9
    26f0:	018c8db3          	add	s11,s9,s8
    26f4:	408d87b3          	sub	a5,s11,s0
    26f8:	0a041c63          	bnez	s0,27b0 <__i_vfprintf+0x694>
    26fc:	40990933          	sub	s2,s2,s1
    2700:	000b0493          	mv	s1,s6
    2704:	00078c13          	mv	s8,a5
    2708:	00f90933          	add	s2,s2,a5
    270c:	0d40006f          	j	27e0 <__i_vfprintf+0x6c4>
    2710:	40647593          	andi	a1,s0,1030
    2714:	f80586e3          	beqz	a1,26a0 <__i_vfprintf+0x584>
    2718:	f71ff06f          	j	2688 <__i_vfprintf+0x56c>
    271c:	00098593          	mv	a1,s3
    2720:	02000513          	li	a0,32
    2724:	00d12623          	sw	a3,12(sp)
    2728:	000a00e7          	jalr	s4
    272c:	d00540e3          	bltz	a0,242c <__i_vfprintf+0x310>
    2730:	00c12683          	lw	a3,12(sp)
    2734:	00148493          	addi	s1,s1,1
    2738:	009c07b3          	add	a5,s8,s1
    273c:	ff24c0e3          	blt	s1,s2,271c <__i_vfprintf+0x600>
    2740:	00078c13          	mv	s8,a5
    2744:	f81ff06f          	j	26c4 <__i_vfprintf+0x5a8>
    2748:	409c0c33          	sub	s8,s8,s1
    274c:	fedff06f          	j	2738 <__i_vfprintf+0x61c>
    2750:	002c0c13          	addi	s8,s8,2
    2754:	00098593          	mv	a1,s3
    2758:	000d8513          	mv	a0,s11
    275c:	000a00e7          	jalr	s4
    2760:	f80550e3          	bgez	a0,26e0 <__i_vfprintf+0x5c4>
    2764:	cc9ff06f          	j	242c <__i_vfprintf+0x310>
    2768:	40647693          	andi	a3,s0,1030
    276c:	f6068ae3          	beqz	a3,26e0 <__i_vfprintf+0x5c4>
    2770:	00247693          	andi	a3,s0,2
    2774:	02000513          	li	a0,32
    2778:	00068463          	beqz	a3,2780 <__i_vfprintf+0x664>
    277c:	02b00513          	li	a0,43
    2780:	40047813          	andi	a6,s0,1024
    2784:	00080463          	beqz	a6,278c <__i_vfprintf+0x670>
    2788:	02d00513          	li	a0,45
    278c:	001c0c13          	addi	s8,s8,1
    2790:	00098593          	mv	a1,s3
    2794:	fc9ff06f          	j	275c <__i_vfprintf+0x640>
    2798:	00098593          	mv	a1,s3
    279c:	03000513          	li	a0,48
    27a0:	001c0c13          	addi	s8,s8,1
    27a4:	000a00e7          	jalr	s4
    27a8:	f2055ee3          	bgez	a0,26e4 <__i_vfprintf+0x5c8>
    27ac:	c81ff06f          	j	242c <__i_vfprintf+0x310>
    27b0:	fff40413          	addi	s0,s0,-1
    27b4:	008a87b3          	add	a5,s5,s0
    27b8:	0007c503          	lbu	a0,0(a5)
    27bc:	00098593          	mv	a1,s3
    27c0:	000a00e7          	jalr	s4
    27c4:	f20558e3          	bgez	a0,26f4 <__i_vfprintf+0x5d8>
    27c8:	c65ff06f          	j	242c <__i_vfprintf+0x310>
    27cc:	00098593          	mv	a1,s3
    27d0:	02000513          	li	a0,32
    27d4:	001c0c13          	addi	s8,s8,1
    27d8:	000a00e7          	jalr	s4
    27dc:	c40548e3          	bltz	a0,242c <__i_vfprintf+0x310>
    27e0:	41890733          	sub	a4,s2,s8
    27e4:	fee044e3          	bgtz	a4,27cc <__i_vfprintf+0x6b0>
    27e8:	9e5ff06f          	j	21cc <__i_vfprintf+0xb0>

000027ec <litex_getc>:
    27ec:	ff010113          	addi	sp,sp,-16
    27f0:	00112623          	sw	ra,12(sp)
    27f4:	0c0010ef          	jal	ra,38b4 <uart_read_nonblock>
    27f8:	fe050ee3          	beqz	a0,27f4 <litex_getc+0x8>
    27fc:	064010ef          	jal	ra,3860 <uart_read>
    2800:	00c12083          	lw	ra,12(sp)
    2804:	01010113          	addi	sp,sp,16
    2808:	00008067          	ret

0000280c <litex_putc>:
    280c:	ff010113          	addi	sp,sp,-16
    2810:	00812423          	sw	s0,8(sp)
    2814:	00112623          	sw	ra,12(sp)
    2818:	00050413          	mv	s0,a0
    281c:	0b4010ef          	jal	ra,38d0 <uart_write>
    2820:	00a00793          	li	a5,10
    2824:	00f41863          	bne	s0,a5,2834 <litex_putc+0x28>
    2828:	00000593          	li	a1,0
    282c:	00d00513          	li	a0,13
    2830:	fddff0ef          	jal	ra,280c <litex_putc>
    2834:	00c12083          	lw	ra,12(sp)
    2838:	00040513          	mv	a0,s0
    283c:	00812403          	lw	s0,8(sp)
    2840:	01010113          	addi	sp,sp,16
    2844:	00008067          	ret

00002848 <__udivmoddi4>:
    2848:	fe010113          	addi	sp,sp,-32
    284c:	00812c23          	sw	s0,24(sp)
    2850:	01212823          	sw	s2,16(sp)
    2854:	01312623          	sw	s3,12(sp)
    2858:	01412423          	sw	s4,8(sp)
    285c:	01512223          	sw	s5,4(sp)
    2860:	00112e23          	sw	ra,28(sp)
    2864:	00912a23          	sw	s1,20(sp)
    2868:	00050413          	mv	s0,a0
    286c:	00058a93          	mv	s5,a1
    2870:	00060a13          	mv	s4,a2
    2874:	00068993          	mv	s3,a3
    2878:	00070913          	mv	s2,a4
    287c:	02059c63          	bnez	a1,28b4 <__udivmoddi4+0x6c>
    2880:	02069063          	bnez	a3,28a0 <__udivmoddi4+0x58>
    2884:	00070863          	beqz	a4,2894 <__udivmoddi4+0x4c>
    2888:	02c577b3          	remu	a5,a0,a2
    288c:	00072223          	sw	zero,4(a4)
    2890:	00f72023          	sw	a5,0(a4)
    2894:	03445433          	divu	s0,s0,s4
    2898:	00000a93          	li	s5,0
    289c:	1100006f          	j	29ac <__udivmoddi4+0x164>
    28a0:	00070663          	beqz	a4,28ac <__udivmoddi4+0x64>
    28a4:	00a92023          	sw	a0,0(s2)
    28a8:	00072223          	sw	zero,4(a4)
    28ac:	00000413          	li	s0,0
    28b0:	0fc0006f          	j	29ac <__udivmoddi4+0x164>
    28b4:	0a061863          	bnez	a2,2964 <__udivmoddi4+0x11c>
    28b8:	00069463          	bnez	a3,28c0 <__udivmoddi4+0x78>
    28bc:	00100073          	ebreak
    28c0:	00051e63          	bnez	a0,28dc <__udivmoddi4+0x94>
    28c4:	00070863          	beqz	a4,28d4 <__udivmoddi4+0x8c>
    28c8:	02d5f7b3          	remu	a5,a1,a3
    28cc:	00072023          	sw	zero,0(a4)
    28d0:	00f72223          	sw	a5,4(a4)
    28d4:	033ad433          	divu	s0,s5,s3
    28d8:	fc1ff06f          	j	2898 <__udivmoddi4+0x50>
    28dc:	fff68793          	addi	a5,a3,-1
    28e0:	00d7f733          	and	a4,a5,a3
    28e4:	02071263          	bnez	a4,2908 <__udivmoddi4+0xc0>
    28e8:	00090863          	beqz	s2,28f8 <__udivmoddi4+0xb0>
    28ec:	00b7f7b3          	and	a5,a5,a1
    28f0:	00a92023          	sw	a0,0(s2)
    28f4:	00f92223          	sw	a5,4(s2)
    28f8:	00098513          	mv	a0,s3
    28fc:	2cc000ef          	jal	ra,2bc8 <__ctzsi2>
    2900:	00aad433          	srl	s0,s5,a0
    2904:	f95ff06f          	j	2898 <__udivmoddi4+0x50>
    2908:	00068513          	mv	a0,a3
    290c:	224000ef          	jal	ra,2b30 <__clzsi2>
    2910:	00050493          	mv	s1,a0
    2914:	000a8513          	mv	a0,s5
    2918:	218000ef          	jal	ra,2b30 <__clzsi2>
    291c:	40a48533          	sub	a0,s1,a0
    2920:	01e00793          	li	a5,30
    2924:	00a7fc63          	bgeu	a5,a0,293c <__udivmoddi4+0xf4>
    2928:	00090663          	beqz	s2,2934 <__udivmoddi4+0xec>
    292c:	00892023          	sw	s0,0(s2)
    2930:	01592223          	sw	s5,4(s2)
    2934:	00000413          	li	s0,0
    2938:	f61ff06f          	j	2898 <__udivmoddi4+0x50>
    293c:	00150613          	addi	a2,a0,1
    2940:	02000693          	li	a3,32
    2944:	40c686b3          	sub	a3,a3,a2
    2948:	00000313          	li	t1,0
    294c:	00d41833          	sll	a6,s0,a3
    2950:	00cade33          	srl	t3,s5,a2
    2954:	00da95b3          	sll	a1,s5,a3
    2958:	00c45433          	srl	s0,s0,a2
    295c:	0085e7b3          	or	a5,a1,s0
    2960:	0e40006f          	j	2a44 <__udivmoddi4+0x1fc>
    2964:	16069c63          	bnez	a3,2adc <__udivmoddi4+0x294>
    2968:	fff60793          	addi	a5,a2,-1
    296c:	00c7f733          	and	a4,a5,a2
    2970:	06071463          	bnez	a4,29d8 <__udivmoddi4+0x190>
    2974:	00090863          	beqz	s2,2984 <__udivmoddi4+0x13c>
    2978:	00a7f7b3          	and	a5,a5,a0
    297c:	00f92023          	sw	a5,0(s2)
    2980:	00092223          	sw	zero,4(s2)
    2984:	00100793          	li	a5,1
    2988:	02fa0263          	beq	s4,a5,29ac <__udivmoddi4+0x164>
    298c:	000a0513          	mv	a0,s4
    2990:	238000ef          	jal	ra,2bc8 <__ctzsi2>
    2994:	02000793          	li	a5,32
    2998:	40a787b3          	sub	a5,a5,a0
    299c:	00fa97b3          	sll	a5,s5,a5
    29a0:	00a45433          	srl	s0,s0,a0
    29a4:	0087e433          	or	s0,a5,s0
    29a8:	00aadab3          	srl	s5,s5,a0
    29ac:	01c12083          	lw	ra,28(sp)
    29b0:	00040513          	mv	a0,s0
    29b4:	01812403          	lw	s0,24(sp)
    29b8:	01412483          	lw	s1,20(sp)
    29bc:	01012903          	lw	s2,16(sp)
    29c0:	00c12983          	lw	s3,12(sp)
    29c4:	00812a03          	lw	s4,8(sp)
    29c8:	000a8593          	mv	a1,s5
    29cc:	00412a83          	lw	s5,4(sp)
    29d0:	02010113          	addi	sp,sp,32
    29d4:	00008067          	ret
    29d8:	00060513          	mv	a0,a2
    29dc:	154000ef          	jal	ra,2b30 <__clzsi2>
    29e0:	00050493          	mv	s1,a0
    29e4:	000a8513          	mv	a0,s5
    29e8:	148000ef          	jal	ra,2b30 <__clzsi2>
    29ec:	40a487b3          	sub	a5,s1,a0
    29f0:	02178613          	addi	a2,a5,33
    29f4:	02000713          	li	a4,32
    29f8:	00000313          	li	t1,0
    29fc:	10e60863          	beq	a2,a4,2b0c <__udivmoddi4+0x2c4>
    2a00:	01f00693          	li	a3,31
    2a04:	00c6ee63          	bltu	a3,a2,2a20 <__udivmoddi4+0x1d8>
    2a08:	40c70733          	sub	a4,a4,a2
    2a0c:	00000313          	li	t1,0
    2a10:	00e41833          	sll	a6,s0,a4
    2a14:	00cade33          	srl	t3,s5,a2
    2a18:	00ea95b3          	sll	a1,s5,a4
    2a1c:	f3dff06f          	j	2958 <__udivmoddi4+0x110>
    2a20:	04000893          	li	a7,64
    2a24:	40c888b3          	sub	a7,a7,a2
    2a28:	00178793          	addi	a5,a5,1
    2a2c:	01141333          	sll	t1,s0,a7
    2a30:	00f45433          	srl	s0,s0,a5
    2a34:	011a98b3          	sll	a7,s5,a7
    2a38:	0088e833          	or	a6,a7,s0
    2a3c:	00000e13          	li	t3,0
    2a40:	00fad7b3          	srl	a5,s5,a5
    2a44:	00000513          	li	a0,0
    2a48:	01f7d693          	srli	a3,a5,0x1f
    2a4c:	001e1713          	slli	a4,t3,0x1
    2a50:	00d76e33          	or	t3,a4,a3
    2a54:	00179793          	slli	a5,a5,0x1
    2a58:	01f85713          	srli	a4,a6,0x1f
    2a5c:	00e7e7b3          	or	a5,a5,a4
    2a60:	fff7c693          	not	a3,a5
    2a64:	01f35713          	srli	a4,t1,0x1f
    2a68:	00181813          	slli	a6,a6,0x1
    2a6c:	00131413          	slli	s0,t1,0x1
    2a70:	00e86833          	or	a6,a6,a4
    2a74:	00a46333          	or	t1,s0,a0
    2a78:	fffe4713          	not	a4,t3
    2a7c:	01468533          	add	a0,a3,s4
    2a80:	00d53533          	sltu	a0,a0,a3
    2a84:	01370733          	add	a4,a4,s3
    2a88:	00e50533          	add	a0,a0,a4
    2a8c:	41f55713          	srai	a4,a0,0x1f
    2a90:	014776b3          	and	a3,a4,s4
    2a94:	40d786b3          	sub	a3,a5,a3
    2a98:	01377733          	and	a4,a4,s3
    2a9c:	00d7b5b3          	sltu	a1,a5,a3
    2aa0:	40ee0733          	sub	a4,t3,a4
    2aa4:	fff60613          	addi	a2,a2,-1
    2aa8:	01f55513          	srli	a0,a0,0x1f
    2aac:	00068793          	mv	a5,a3
    2ab0:	40b70e33          	sub	t3,a4,a1
    2ab4:	f8061ae3          	bnez	a2,2a48 <__udivmoddi4+0x200>
    2ab8:	01f35593          	srli	a1,t1,0x1f
    2abc:	00181813          	slli	a6,a6,0x1
    2ac0:	00131413          	slli	s0,t1,0x1
    2ac4:	00a46433          	or	s0,s0,a0
    2ac8:	0105eab3          	or	s5,a1,a6
    2acc:	ee0900e3          	beqz	s2,29ac <__udivmoddi4+0x164>
    2ad0:	00d92023          	sw	a3,0(s2)
    2ad4:	01c92223          	sw	t3,4(s2)
    2ad8:	ed5ff06f          	j	29ac <__udivmoddi4+0x164>
    2adc:	00068513          	mv	a0,a3
    2ae0:	050000ef          	jal	ra,2b30 <__clzsi2>
    2ae4:	00050493          	mv	s1,a0
    2ae8:	000a8513          	mv	a0,s5
    2aec:	044000ef          	jal	ra,2b30 <__clzsi2>
    2af0:	40a48533          	sub	a0,s1,a0
    2af4:	01f00793          	li	a5,31
    2af8:	e2a7e8e3          	bltu	a5,a0,2928 <__udivmoddi4+0xe0>
    2afc:	00150613          	addi	a2,a0,1
    2b00:	02000893          	li	a7,32
    2b04:	00000313          	li	t1,0
    2b08:	01161a63          	bne	a2,a7,2b1c <__udivmoddi4+0x2d4>
    2b0c:	00040813          	mv	a6,s0
    2b10:	00000e13          	li	t3,0
    2b14:	000a8793          	mv	a5,s5
    2b18:	f2dff06f          	j	2a44 <__udivmoddi4+0x1fc>
    2b1c:	40c888b3          	sub	a7,a7,a2
    2b20:	01141833          	sll	a6,s0,a7
    2b24:	00cade33          	srl	t3,s5,a2
    2b28:	011a95b3          	sll	a1,s5,a7
    2b2c:	e2dff06f          	j	2958 <__udivmoddi4+0x110>

00002b30 <__clzsi2>:
    2b30:	ffff0737          	lui	a4,0xffff0
    2b34:	00e57733          	and	a4,a0,a4
    2b38:	00173713          	seqz	a4,a4
    2b3c:	00471713          	slli	a4,a4,0x4
    2b40:	01000793          	li	a5,16
    2b44:	40e787b3          	sub	a5,a5,a4
    2b48:	00f557b3          	srl	a5,a0,a5
    2b4c:	00010537          	lui	a0,0x10
    2b50:	f0050513          	addi	a0,a0,-256 # ff00 <_edata_rom+0xa650>
    2b54:	00a7f533          	and	a0,a5,a0
    2b58:	00153513          	seqz	a0,a0
    2b5c:	00351513          	slli	a0,a0,0x3
    2b60:	00800693          	li	a3,8
    2b64:	40a686b3          	sub	a3,a3,a0
    2b68:	00d7d7b3          	srl	a5,a5,a3
    2b6c:	0f07f693          	andi	a3,a5,240
    2b70:	0016b693          	seqz	a3,a3
    2b74:	00269693          	slli	a3,a3,0x2
    2b78:	00e50533          	add	a0,a0,a4
    2b7c:	00400713          	li	a4,4
    2b80:	40d70733          	sub	a4,a4,a3
    2b84:	00e7d7b3          	srl	a5,a5,a4
    2b88:	00a68533          	add	a0,a3,a0
    2b8c:	00c7f693          	andi	a3,a5,12
    2b90:	0016b693          	seqz	a3,a3
    2b94:	00169693          	slli	a3,a3,0x1
    2b98:	00200613          	li	a2,2
    2b9c:	40d60733          	sub	a4,a2,a3
    2ba0:	00e7d7b3          	srl	a5,a5,a4
    2ba4:	0017d713          	srli	a4,a5,0x1
    2ba8:	00174713          	xori	a4,a4,1
    2bac:	00177713          	andi	a4,a4,1
    2bb0:	40e00733          	neg	a4,a4
    2bb4:	40f607b3          	sub	a5,a2,a5
    2bb8:	00f777b3          	and	a5,a4,a5
    2bbc:	00a68533          	add	a0,a3,a0
    2bc0:	00a78533          	add	a0,a5,a0
    2bc4:	00008067          	ret

00002bc8 <__ctzsi2>:
    2bc8:	01051693          	slli	a3,a0,0x10
    2bcc:	0106d693          	srli	a3,a3,0x10
    2bd0:	0016b693          	seqz	a3,a3
    2bd4:	00469693          	slli	a3,a3,0x4
    2bd8:	00d557b3          	srl	a5,a0,a3
    2bdc:	0ff7f713          	andi	a4,a5,255
    2be0:	00173713          	seqz	a4,a4
    2be4:	00371713          	slli	a4,a4,0x3
    2be8:	00e7d7b3          	srl	a5,a5,a4
    2bec:	00d706b3          	add	a3,a4,a3
    2bf0:	00f7f713          	andi	a4,a5,15
    2bf4:	00173713          	seqz	a4,a4
    2bf8:	00271713          	slli	a4,a4,0x2
    2bfc:	00e7d7b3          	srl	a5,a5,a4
    2c00:	00d706b3          	add	a3,a4,a3
    2c04:	0037f713          	andi	a4,a5,3
    2c08:	00173713          	seqz	a4,a4
    2c0c:	00171713          	slli	a4,a4,0x1
    2c10:	00e7d7b3          	srl	a5,a5,a4
    2c14:	0017d513          	srli	a0,a5,0x1
    2c18:	fff7c793          	not	a5,a5
    2c1c:	00157613          	andi	a2,a0,1
    2c20:	0017f793          	andi	a5,a5,1
    2c24:	00200513          	li	a0,2
    2c28:	40c50533          	sub	a0,a0,a2
    2c2c:	40f007b3          	neg	a5,a5
    2c30:	00f57533          	and	a0,a0,a5
    2c34:	00d70733          	add	a4,a4,a3
    2c38:	00e50533          	add	a0,a0,a4
    2c3c:	00008067          	ret

00002c40 <__udivdi3>:
    2c40:	00000713          	li	a4,0
    2c44:	c05ff06f          	j	2848 <__udivmoddi4>

00002c48 <__umoddi3>:
    2c48:	fe010113          	addi	sp,sp,-32
    2c4c:	00810713          	addi	a4,sp,8
    2c50:	00112e23          	sw	ra,28(sp)
    2c54:	bf5ff0ef          	jal	ra,2848 <__udivmoddi4>
    2c58:	01c12083          	lw	ra,28(sp)
    2c5c:	00812503          	lw	a0,8(sp)
    2c60:	00c12583          	lw	a1,12(sp)
    2c64:	02010113          	addi	sp,sp,32
    2c68:	00008067          	ret

00002c6c <crc16>:
    2c6c:	00050713          	mv	a4,a0
    2c70:	000056b7          	lui	a3,0x5
    2c74:	00000513          	li	a0,0
    2c78:	00b705b3          	add	a1,a4,a1
    2c7c:	c1868693          	addi	a3,a3,-1000 # 4c18 <crc16_table>
    2c80:	40e587b3          	sub	a5,a1,a4
    2c84:	00f04463          	bgtz	a5,2c8c <crc16+0x20>
    2c88:	00008067          	ret
    2c8c:	00074603          	lbu	a2,0(a4) # ffff0000 <_fstack+0xeffef000>
    2c90:	00855793          	srli	a5,a0,0x8
    2c94:	00170713          	addi	a4,a4,1
    2c98:	00c7c7b3          	xor	a5,a5,a2
    2c9c:	00279793          	slli	a5,a5,0x2
    2ca0:	00f687b3          	add	a5,a3,a5
    2ca4:	0007d603          	lhu	a2,0(a5)
    2ca8:	00851793          	slli	a5,a0,0x8
    2cac:	01079793          	slli	a5,a5,0x10
    2cb0:	0107d793          	srli	a5,a5,0x10
    2cb4:	00f64533          	xor	a0,a2,a5
    2cb8:	fc9ff06f          	j	2c80 <crc16+0x14>

00002cbc <crc32>:
    2cbc:	000056b7          	lui	a3,0x5
    2cc0:	00050713          	mv	a4,a0
    2cc4:	fff00793          	li	a5,-1
    2cc8:	00b508b3          	add	a7,a0,a1
    2ccc:	00700813          	li	a6,7
    2cd0:	01868693          	addi	a3,a3,24 # 5018 <crc_table>
    2cd4:	40e88633          	sub	a2,a7,a4
    2cd8:	04c86e63          	bltu	a6,a2,2d34 <crc32+0x78>
    2cdc:	0035d693          	srli	a3,a1,0x3
    2ce0:	ff800613          	li	a2,-8
    2ce4:	02c686b3          	mul	a3,a3,a2
    2ce8:	ff85f713          	andi	a4,a1,-8
    2cec:	00e50733          	add	a4,a0,a4
    2cf0:	00b685b3          	add	a1,a3,a1
    2cf4:	02058c63          	beqz	a1,2d2c <crc32+0x70>
    2cf8:	00005637          	lui	a2,0x5
    2cfc:	00b705b3          	add	a1,a4,a1
    2d00:	01860613          	addi	a2,a2,24 # 5018 <crc_table>
    2d04:	00074683          	lbu	a3,0(a4)
    2d08:	00170713          	addi	a4,a4,1
    2d0c:	00f6c6b3          	xor	a3,a3,a5
    2d10:	0ff6f693          	andi	a3,a3,255
    2d14:	00269693          	slli	a3,a3,0x2
    2d18:	00d606b3          	add	a3,a2,a3
    2d1c:	0006a683          	lw	a3,0(a3)
    2d20:	0087d793          	srli	a5,a5,0x8
    2d24:	00f6c7b3          	xor	a5,a3,a5
    2d28:	fcb71ee3          	bne	a4,a1,2d04 <crc32+0x48>
    2d2c:	fff7c513          	not	a0,a5
    2d30:	00008067          	ret
    2d34:	00074603          	lbu	a2,0(a4)
    2d38:	00870713          	addi	a4,a4,8
    2d3c:	00f64633          	xor	a2,a2,a5
    2d40:	0ff67613          	andi	a2,a2,255
    2d44:	00261613          	slli	a2,a2,0x2
    2d48:	00c68633          	add	a2,a3,a2
    2d4c:	00062603          	lw	a2,0(a2)
    2d50:	0087d793          	srli	a5,a5,0x8
    2d54:	00f647b3          	xor	a5,a2,a5
    2d58:	ff974603          	lbu	a2,-7(a4)
    2d5c:	00f64633          	xor	a2,a2,a5
    2d60:	0ff67613          	andi	a2,a2,255
    2d64:	00261613          	slli	a2,a2,0x2
    2d68:	00c68633          	add	a2,a3,a2
    2d6c:	00062603          	lw	a2,0(a2)
    2d70:	0087d793          	srli	a5,a5,0x8
    2d74:	00f64633          	xor	a2,a2,a5
    2d78:	ffa74783          	lbu	a5,-6(a4)
    2d7c:	00c7c7b3          	xor	a5,a5,a2
    2d80:	0ff7f793          	andi	a5,a5,255
    2d84:	00279793          	slli	a5,a5,0x2
    2d88:	00f687b3          	add	a5,a3,a5
    2d8c:	0007a303          	lw	t1,0(a5)
    2d90:	ffb74783          	lbu	a5,-5(a4)
    2d94:	00865613          	srli	a2,a2,0x8
    2d98:	00c34333          	xor	t1,t1,a2
    2d9c:	0067c7b3          	xor	a5,a5,t1
    2da0:	0ff7f793          	andi	a5,a5,255
    2da4:	00279793          	slli	a5,a5,0x2
    2da8:	00f687b3          	add	a5,a3,a5
    2dac:	0007a603          	lw	a2,0(a5)
    2db0:	ffc74783          	lbu	a5,-4(a4)
    2db4:	00835313          	srli	t1,t1,0x8
    2db8:	00664633          	xor	a2,a2,t1
    2dbc:	00c7c7b3          	xor	a5,a5,a2
    2dc0:	0ff7f793          	andi	a5,a5,255
    2dc4:	00279793          	slli	a5,a5,0x2
    2dc8:	00f687b3          	add	a5,a3,a5
    2dcc:	0007a303          	lw	t1,0(a5)
    2dd0:	ffd74783          	lbu	a5,-3(a4)
    2dd4:	00865613          	srli	a2,a2,0x8
    2dd8:	00c34333          	xor	t1,t1,a2
    2ddc:	0067c7b3          	xor	a5,a5,t1
    2de0:	0ff7f793          	andi	a5,a5,255
    2de4:	00279793          	slli	a5,a5,0x2
    2de8:	00f687b3          	add	a5,a3,a5
    2dec:	0007a783          	lw	a5,0(a5)
    2df0:	ffe74603          	lbu	a2,-2(a4)
    2df4:	00835313          	srli	t1,t1,0x8
    2df8:	0067c7b3          	xor	a5,a5,t1
    2dfc:	00f64633          	xor	a2,a2,a5
    2e00:	0ff67613          	andi	a2,a2,255
    2e04:	00261613          	slli	a2,a2,0x2
    2e08:	00c68633          	add	a2,a3,a2
    2e0c:	00062303          	lw	t1,0(a2)
    2e10:	fff74603          	lbu	a2,-1(a4)
    2e14:	0087d793          	srli	a5,a5,0x8
    2e18:	00f34333          	xor	t1,t1,a5
    2e1c:	00664633          	xor	a2,a2,t1
    2e20:	0ff67613          	andi	a2,a2,255
    2e24:	00261613          	slli	a2,a2,0x2
    2e28:	00c68633          	add	a2,a3,a2
    2e2c:	00062783          	lw	a5,0(a2)
    2e30:	00835313          	srli	t1,t1,0x8
    2e34:	0067c7b3          	xor	a5,a5,t1
    2e38:	e9dff06f          	j	2cd4 <crc32+0x18>

00002e3c <flush_l2_cache>:
    2e3c:	400007b7          	lui	a5,0x40000
    2e40:	40001737          	lui	a4,0x40001
    2e44:	0007a683          	lw	a3,0(a5) # 40000000 <_fstack+0x2ffff000>
    2e48:	00478793          	addi	a5,a5,4
    2e4c:	fee79ce3          	bne	a5,a4,2e44 <flush_l2_cache+0x8>
    2e50:	00008067          	ret

00002e54 <busy_wait>:
    2e54:	0000c737          	lui	a4,0xc
    2e58:	35070713          	addi	a4,a4,848 # c350 <_edata_rom+0x6aa0>
    2e5c:	02e50533          	mul	a0,a0,a4
    2e60:	f00027b7          	lui	a5,0xf0002
    2e64:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    2e68:	8007a223          	sw	zero,-2044(a5)
    2e6c:	00100713          	li	a4,1
    2e70:	00100693          	li	a3,1
    2e74:	80a7a023          	sw	a0,-2048(a5)
    2e78:	80e7a423          	sw	a4,-2040(a5)
    2e7c:	80e7a623          	sw	a4,-2036(a5)
    2e80:	8107a703          	lw	a4,-2032(a5)
    2e84:	00071463          	bnez	a4,2e8c <busy_wait+0x38>
    2e88:	00008067          	ret
    2e8c:	80d7a623          	sw	a3,-2036(a5)
    2e90:	ff1ff06f          	j	2e80 <busy_wait+0x2c>

00002e94 <busy_wait_us>:
    2e94:	03200713          	li	a4,50
    2e98:	02e50533          	mul	a0,a0,a4
    2e9c:	f00027b7          	lui	a5,0xf0002
    2ea0:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    2ea4:	8007a223          	sw	zero,-2044(a5)
    2ea8:	00100713          	li	a4,1
    2eac:	00100693          	li	a3,1
    2eb0:	80a7a023          	sw	a0,-2048(a5)
    2eb4:	80e7a423          	sw	a4,-2040(a5)
    2eb8:	80e7a623          	sw	a4,-2036(a5)
    2ebc:	8107a703          	lw	a4,-2032(a5)
    2ec0:	00071463          	bnez	a4,2ec8 <busy_wait_us+0x34>
    2ec4:	00008067          	ret
    2ec8:	80d7a623          	sw	a3,-2036(a5)
    2ecc:	ff1ff06f          	j	2ebc <busy_wait_us+0x28>

00002ed0 <print_size>:
    2ed0:	3ff00793          	li	a5,1023
    2ed4:	00a7ea63          	bltu	a5,a0,2ee8 <print_size+0x18>
    2ed8:	00050593          	mv	a1,a0
    2edc:	00005537          	lui	a0,0x5
    2ee0:	41850513          	addi	a0,a0,1048 # 5418 <crc_table+0x400>
    2ee4:	f31fe06f          	j	1e14 <printf>
    2ee8:	001007b7          	lui	a5,0x100
    2eec:	02f57063          	bgeu	a0,a5,2f0c <print_size+0x3c>
    2ef0:	3ff57613          	andi	a2,a0,1023
    2ef4:	06600793          	li	a5,102
    2ef8:	02f65633          	divu	a2,a2,a5
    2efc:	00a55593          	srli	a1,a0,0xa
    2f00:	00005537          	lui	a0,0x5
    2f04:	42050513          	addi	a0,a0,1056 # 5420 <crc_table+0x408>
    2f08:	f0dfe06f          	j	1e14 <printf>
    2f0c:	400007b7          	lui	a5,0x40000
    2f10:	01455593          	srli	a1,a0,0x14
    2f14:	02f57263          	bgeu	a0,a5,2f38 <print_size+0x68>
    2f18:	00a59613          	slli	a2,a1,0xa
    2f1c:	00a55513          	srli	a0,a0,0xa
    2f20:	40c50533          	sub	a0,a0,a2
    2f24:	06600613          	li	a2,102
    2f28:	02c55633          	divu	a2,a0,a2
    2f2c:	00005537          	lui	a0,0x5
    2f30:	42c50513          	addi	a0,a0,1068 # 542c <crc_table+0x414>
    2f34:	fd5ff06f          	j	2f08 <print_size+0x38>
    2f38:	01e55513          	srli	a0,a0,0x1e
    2f3c:	00a51613          	slli	a2,a0,0xa
    2f40:	40c585b3          	sub	a1,a1,a2
    2f44:	06600613          	li	a2,102
    2f48:	02c5d633          	divu	a2,a1,a2
    2f4c:	00050593          	mv	a1,a0
    2f50:	00005537          	lui	a0,0x5
    2f54:	43850513          	addi	a0,a0,1080 # 5438 <crc_table+0x420>
    2f58:	fb1ff06f          	j	2f08 <print_size+0x38>

00002f5c <print_progress>:
    2f5c:	ff010113          	addi	sp,sp,-16
    2f60:	00812423          	sw	s0,8(sp)
    2f64:	00c586b3          	add	a3,a1,a2
    2f68:	00060413          	mv	s0,a2
    2f6c:	00058613          	mv	a2,a1
    2f70:	00050593          	mv	a1,a0
    2f74:	00005537          	lui	a0,0x5
    2f78:	44450513          	addi	a0,a0,1092 # 5444 <crc_table+0x42c>
    2f7c:	00112623          	sw	ra,12(sp)
    2f80:	e95fe0ef          	jal	ra,1e14 <printf>
    2f84:	00040513          	mv	a0,s0
    2f88:	f49ff0ef          	jal	ra,2ed0 <print_size>
    2f8c:	00812403          	lw	s0,8(sp)
    2f90:	00c12083          	lw	ra,12(sp)
    2f94:	00005537          	lui	a0,0x5
    2f98:	45450513          	addi	a0,a0,1108 # 5454 <crc_table+0x43c>
    2f9c:	01010113          	addi	sp,sp,16
    2fa0:	e75fe06f          	j	1e14 <printf>

00002fa4 <memtest_access>:
    2fa4:	aaaab7b7          	lui	a5,0xaaaab
    2fa8:	f0000737          	lui	a4,0xf0000
    2fac:	aaa78793          	addi	a5,a5,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    2fb0:	00872683          	lw	a3,8(a4) # f0000008 <_fstack+0xdffff008>
    2fb4:	00f52023          	sw	a5,0(a0)
    2fb8:	00052783          	lw	a5,0(a0)
    2fbc:	00f52223          	sw	a5,4(a0)
    2fc0:	555557b7          	lui	a5,0x55555
    2fc4:	55578793          	addi	a5,a5,1365 # 55555555 <_fstack+0x45554555>
    2fc8:	00f52023          	sw	a5,0(a0)
    2fcc:	00052783          	lw	a5,0(a0)
    2fd0:	00f52223          	sw	a5,4(a0)
    2fd4:	00872783          	lw	a5,8(a4)
    2fd8:	02d78663          	beq	a5,a3,3004 <memtest_access+0x60>
    2fdc:	00050593          	mv	a1,a0
    2fe0:	00005537          	lui	a0,0x5
    2fe4:	ff010113          	addi	sp,sp,-16
    2fe8:	45c50513          	addi	a0,a0,1116 # 545c <crc_table+0x444>
    2fec:	00112623          	sw	ra,12(sp)
    2ff0:	e25fe0ef          	jal	ra,1e14 <printf>
    2ff4:	00c12083          	lw	ra,12(sp)
    2ff8:	00100513          	li	a0,1
    2ffc:	01010113          	addi	sp,sp,16
    3000:	00008067          	ret
    3004:	00000513          	li	a0,0
    3008:	00008067          	ret

0000300c <memtest_bus>:
    300c:	fe010113          	addi	sp,sp,-32
    3010:	aaaab737          	lui	a4,0xaaaab
    3014:	00812c23          	sw	s0,24(sp)
    3018:	00912a23          	sw	s1,20(sp)
    301c:	00112e23          	sw	ra,28(sp)
    3020:	00050493          	mv	s1,a0
    3024:	0025d413          	srli	s0,a1,0x2
    3028:	00000793          	li	a5,0
    302c:	aaa70713          	addi	a4,a4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    3030:	06879263          	bne	a5,s0,3094 <memtest_bus+0x88>
    3034:	0000500f          	0x500f
    3038:	e05ff0ef          	jal	ra,2e3c <flush_l2_cache>
    303c:	aaaab737          	lui	a4,0xaaaab
    3040:	00000513          	li	a0,0
    3044:	00000793          	li	a5,0
    3048:	aaa70713          	addi	a4,a4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    304c:	04879e63          	bne	a5,s0,30a8 <memtest_bus+0x9c>
    3050:	55555737          	lui	a4,0x55555
    3054:	00000793          	li	a5,0
    3058:	55570713          	addi	a4,a4,1365 # 55555555 <_fstack+0x45554555>
    305c:	06879463          	bne	a5,s0,30c4 <memtest_bus+0xb8>
    3060:	00a12623          	sw	a0,12(sp)
    3064:	0000500f          	0x500f
    3068:	dd5ff0ef          	jal	ra,2e3c <flush_l2_cache>
    306c:	00c12503          	lw	a0,12(sp)
    3070:	55555737          	lui	a4,0x55555
    3074:	00000793          	li	a5,0
    3078:	55570713          	addi	a4,a4,1365 # 55555555 <_fstack+0x45554555>
    307c:	04879e63          	bne	a5,s0,30d8 <memtest_bus+0xcc>
    3080:	01c12083          	lw	ra,28(sp)
    3084:	01812403          	lw	s0,24(sp)
    3088:	01412483          	lw	s1,20(sp)
    308c:	02010113          	addi	sp,sp,32
    3090:	00008067          	ret
    3094:	00279693          	slli	a3,a5,0x2
    3098:	00d486b3          	add	a3,s1,a3
    309c:	00e6a023          	sw	a4,0(a3)
    30a0:	00178793          	addi	a5,a5,1
    30a4:	f8dff06f          	j	3030 <memtest_bus+0x24>
    30a8:	00279693          	slli	a3,a5,0x2
    30ac:	00d486b3          	add	a3,s1,a3
    30b0:	0006a683          	lw	a3,0(a3)
    30b4:	00e68463          	beq	a3,a4,30bc <memtest_bus+0xb0>
    30b8:	00150513          	addi	a0,a0,1
    30bc:	00178793          	addi	a5,a5,1
    30c0:	f8dff06f          	j	304c <memtest_bus+0x40>
    30c4:	00279693          	slli	a3,a5,0x2
    30c8:	00d486b3          	add	a3,s1,a3
    30cc:	00e6a023          	sw	a4,0(a3)
    30d0:	00178793          	addi	a5,a5,1
    30d4:	f89ff06f          	j	305c <memtest_bus+0x50>
    30d8:	00279693          	slli	a3,a5,0x2
    30dc:	00d486b3          	add	a3,s1,a3
    30e0:	0006a683          	lw	a3,0(a3)
    30e4:	00e68463          	beq	a3,a4,30ec <memtest_bus+0xe0>
    30e8:	00150513          	addi	a0,a0,1
    30ec:	00178793          	addi	a5,a5,1
    30f0:	f8dff06f          	j	307c <memtest_bus+0x70>

000030f4 <memtest_addr>:
    30f4:	000107b7          	lui	a5,0x10
    30f8:	0ef5ec63          	bltu	a1,a5,31f0 <memtest_addr+0xfc>
    30fc:	ff010113          	addi	sp,sp,-16
    3100:	0000d6b7          	lui	a3,0xd
    3104:	00812423          	sw	s0,8(sp)
    3108:	00912223          	sw	s1,4(sp)
    310c:	01212023          	sw	s2,0(sp)
    3110:	00112623          	sw	ra,12(sp)
    3114:	00050493          	mv	s1,a0
    3118:	00060913          	mv	s2,a2
    311c:	0025d413          	srli	s0,a1,0x2
    3120:	00100793          	li	a5,1
    3124:	00000713          	li	a4,0
    3128:	00868693          	addi	a3,a3,8 # d008 <_edata_rom+0x7758>
    312c:	08871063          	bne	a4,s0,31ac <memtest_addr+0xb8>
    3130:	0000500f          	0x500f
    3134:	d09ff0ef          	jal	ra,2e3c <flush_l2_cache>
    3138:	0000d637          	lui	a2,0xd
    313c:	000106b7          	lui	a3,0x10
    3140:	00000513          	li	a0,0
    3144:	00000713          	li	a4,0
    3148:	00100793          	li	a5,1
    314c:	00860613          	addi	a2,a2,8 # d008 <_edata_rom+0x7758>
    3150:	fff68693          	addi	a3,a3,-1 # ffff <_edata_rom+0xa74f>
    3154:	08090a63          	beqz	s2,31e8 <memtest_addr+0xf4>
    3158:	0017d593          	srli	a1,a5,0x1
    315c:	0017f793          	andi	a5,a5,1
    3160:	40f007b3          	neg	a5,a5
    3164:	00c7f7b3          	and	a5,a5,a2
    3168:	00b7c7b3          	xor	a5,a5,a1
    316c:	01079793          	slli	a5,a5,0x10
    3170:	0107d793          	srli	a5,a5,0x10
    3174:	00279593          	slli	a1,a5,0x2
    3178:	00b485b3          	add	a1,s1,a1
    317c:	0005a583          	lw	a1,0(a1)
    3180:	00d5f5b3          	and	a1,a1,a3
    3184:	00e58463          	beq	a1,a4,318c <memtest_addr+0x98>
    3188:	00150513          	addi	a0,a0,1
    318c:	00170713          	addi	a4,a4,1
    3190:	fce412e3          	bne	s0,a4,3154 <memtest_addr+0x60>
    3194:	00c12083          	lw	ra,12(sp)
    3198:	00812403          	lw	s0,8(sp)
    319c:	00412483          	lw	s1,4(sp)
    31a0:	00012903          	lw	s2,0(sp)
    31a4:	01010113          	addi	sp,sp,16
    31a8:	00008067          	ret
    31ac:	02090a63          	beqz	s2,31e0 <memtest_addr+0xec>
    31b0:	0017d613          	srli	a2,a5,0x1
    31b4:	0017f793          	andi	a5,a5,1
    31b8:	40f007b3          	neg	a5,a5
    31bc:	00d7f7b3          	and	a5,a5,a3
    31c0:	00c7c7b3          	xor	a5,a5,a2
    31c4:	01079793          	slli	a5,a5,0x10
    31c8:	0107d793          	srli	a5,a5,0x10
    31cc:	00279613          	slli	a2,a5,0x2
    31d0:	00c48633          	add	a2,s1,a2
    31d4:	00e62023          	sw	a4,0(a2)
    31d8:	00170713          	addi	a4,a4,1
    31dc:	f51ff06f          	j	312c <memtest_addr+0x38>
    31e0:	00178793          	addi	a5,a5,1 # 10001 <_edata_rom+0xa751>
    31e4:	fe1ff06f          	j	31c4 <memtest_addr+0xd0>
    31e8:	00178793          	addi	a5,a5,1
    31ec:	f81ff06f          	j	316c <memtest_addr+0x78>
    31f0:	00000513          	li	a0,0
    31f4:	00008067          	ret

000031f8 <memtest_data>:
    31f8:	fc010113          	addi	sp,sp,-64
    31fc:	02912a23          	sw	s1,52(sp)
    3200:	03212823          	sw	s2,48(sp)
    3204:	03312623          	sw	s3,44(sp)
    3208:	03412423          	sw	s4,40(sp)
    320c:	02112e23          	sw	ra,60(sp)
    3210:	02812c23          	sw	s0,56(sp)
    3214:	03512223          	sw	s5,36(sp)
    3218:	03612023          	sw	s6,32(sp)
    321c:	01712e23          	sw	s7,28(sp)
    3220:	01812c23          	sw	s8,24(sp)
    3224:	01912a23          	sw	s9,20(sp)
    3228:	01a12823          	sw	s10,16(sp)
    322c:	01b12623          	sw	s11,12(sp)
    3230:	00050493          	mv	s1,a0
    3234:	00060a13          	mv	s4,a2
    3238:	00068913          	mv	s2,a3
    323c:	0025d993          	srli	s3,a1,0x2
    3240:	0a068263          	beqz	a3,32e4 <memtest_data+0xec>
    3244:	0046a783          	lw	a5,4(a3)
    3248:	0006ab03          	lw	s6,0(a3)
    324c:	04079263          	bnez	a5,3290 <memtest_data+0x98>
    3250:	80200bb7          	lui	s7,0x80200
    3254:	00008c37          	lui	s8,0x8
    3258:	00100413          	li	s0,1
    325c:	00000a93          	li	s5,0
    3260:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    3264:	fffc0c13          	addi	s8,s8,-1 # 7fff <_edata_rom+0x274f>
    3268:	00005cb7          	lui	s9,0x5
    326c:	002a9613          	slli	a2,s5,0x2
    3270:	073a9e63          	bne	s5,s3,32ec <memtest_data+0xf4>
    3274:	00005537          	lui	a0,0x5
    3278:	48c50513          	addi	a0,a0,1164 # 548c <crc_table+0x474>
    327c:	00048593          	mv	a1,s1
    3280:	cddff0ef          	jal	ra,2f5c <print_progress>
    3284:	00005537          	lui	a0,0x5
    3288:	65450513          	addi	a0,a0,1620 # 5654 <crc_table+0x63c>
    328c:	b89fe0ef          	jal	ra,1e14 <printf>
    3290:	0000500f          	0x500f
    3294:	80200bb7          	lui	s7,0x80200
    3298:	00008c37          	lui	s8,0x8
    329c:	ba1ff0ef          	jal	ra,2e3c <flush_l2_cache>
    32a0:	00100413          	li	s0,1
    32a4:	00000a93          	li	s5,0
    32a8:	00000d13          	li	s10,0
    32ac:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    32b0:	fffc0c13          	addi	s8,s8,-1 # 7fff <_edata_rom+0x274f>
    32b4:	00005cb7          	lui	s9,0x5
    32b8:	07a99c63          	bne	s3,s10,3330 <memtest_data+0x138>
    32bc:	0e0b0463          	beqz	s6,33a4 <memtest_data+0x1ac>
    32c0:	00005537          	lui	a0,0x5
    32c4:	00299613          	slli	a2,s3,0x2
    32c8:	00048593          	mv	a1,s1
    32cc:	49850513          	addi	a0,a0,1176 # 5498 <crc_table+0x480>
    32d0:	c8dff0ef          	jal	ra,2f5c <print_progress>
    32d4:	00005537          	lui	a0,0x5
    32d8:	65450513          	addi	a0,a0,1620 # 5654 <crc_table+0x63c>
    32dc:	b39fe0ef          	jal	ra,1e14 <printf>
    32e0:	0c40006f          	j	33a4 <memtest_data+0x1ac>
    32e4:	00100b13          	li	s6,1
    32e8:	f69ff06f          	j	3250 <memtest_data+0x58>
    32ec:	020a0e63          	beqz	s4,3328 <memtest_data+0x130>
    32f0:	00145793          	srli	a5,s0,0x1
    32f4:	00147413          	andi	s0,s0,1
    32f8:	40800433          	neg	s0,s0
    32fc:	01747433          	and	s0,s0,s7
    3300:	00f44433          	xor	s0,s0,a5
    3304:	00c487b3          	add	a5,s1,a2
    3308:	0087a023          	sw	s0,0(a5)
    330c:	018af7b3          	and	a5,s5,s8
    3310:	00079863          	bnez	a5,3320 <memtest_data+0x128>
    3314:	00048593          	mv	a1,s1
    3318:	48cc8513          	addi	a0,s9,1164 # 548c <crc_table+0x474>
    331c:	c41ff0ef          	jal	ra,2f5c <print_progress>
    3320:	001a8a93          	addi	s5,s5,1
    3324:	f49ff06f          	j	326c <memtest_data+0x74>
    3328:	00140413          	addi	s0,s0,1
    332c:	fd9ff06f          	j	3304 <memtest_data+0x10c>
    3330:	040a0663          	beqz	s4,337c <memtest_data+0x184>
    3334:	00145793          	srli	a5,s0,0x1
    3338:	00147413          	andi	s0,s0,1
    333c:	40800433          	neg	s0,s0
    3340:	01747433          	and	s0,s0,s7
    3344:	00f44433          	xor	s0,s0,a5
    3348:	002d1d93          	slli	s11,s10,0x2
    334c:	009d8533          	add	a0,s11,s1
    3350:	00052583          	lw	a1,0(a0)
    3354:	02859863          	bne	a1,s0,3384 <memtest_data+0x18c>
    3358:	018d77b3          	and	a5,s10,s8
    335c:	00079c63          	bnez	a5,3374 <memtest_data+0x17c>
    3360:	000b0a63          	beqz	s6,3374 <memtest_data+0x17c>
    3364:	000d8613          	mv	a2,s11
    3368:	00048593          	mv	a1,s1
    336c:	498c8513          	addi	a0,s9,1176
    3370:	bedff0ef          	jal	ra,2f5c <print_progress>
    3374:	001d0d13          	addi	s10,s10,1
    3378:	f41ff06f          	j	32b8 <memtest_data+0xc0>
    337c:	00140413          	addi	s0,s0,1
    3380:	fc9ff06f          	j	3348 <memtest_data+0x150>
    3384:	001a8a93          	addi	s5,s5,1
    3388:	fc0908e3          	beqz	s2,3358 <memtest_data+0x160>
    338c:	00892783          	lw	a5,8(s2)
    3390:	fc0784e3          	beqz	a5,3358 <memtest_data+0x160>
    3394:	00c92683          	lw	a3,12(s2)
    3398:	00040613          	mv	a2,s0
    339c:	000780e7          	jalr	a5
    33a0:	fa050ce3          	beqz	a0,3358 <memtest_data+0x160>
    33a4:	03c12083          	lw	ra,60(sp)
    33a8:	03812403          	lw	s0,56(sp)
    33ac:	03412483          	lw	s1,52(sp)
    33b0:	03012903          	lw	s2,48(sp)
    33b4:	02c12983          	lw	s3,44(sp)
    33b8:	02812a03          	lw	s4,40(sp)
    33bc:	02012b03          	lw	s6,32(sp)
    33c0:	01c12b83          	lw	s7,28(sp)
    33c4:	01812c03          	lw	s8,24(sp)
    33c8:	01412c83          	lw	s9,20(sp)
    33cc:	01012d03          	lw	s10,16(sp)
    33d0:	00c12d83          	lw	s11,12(sp)
    33d4:	000a8513          	mv	a0,s5
    33d8:	02412a83          	lw	s5,36(sp)
    33dc:	04010113          	addi	sp,sp,64
    33e0:	00008067          	ret

000033e4 <memspeed>:
    33e4:	fe010113          	addi	sp,sp,-32
    33e8:	01312623          	sw	s3,12(sp)
    33ec:	ff058993          	addi	s3,a1,-16
    33f0:	00812c23          	sw	s0,24(sp)
    33f4:	00912a23          	sw	s1,20(sp)
    33f8:	00050413          	mv	s0,a0
    33fc:	00058493          	mv	s1,a1
    3400:	013509b3          	add	s3,a0,s3
    3404:	00050593          	mv	a1,a0
    3408:	00005537          	lui	a0,0x5
    340c:	01412423          	sw	s4,8(sp)
    3410:	4a450513          	addi	a0,a0,1188 # 54a4 <crc_table+0x48c>
    3414:	00068a13          	mv	s4,a3
    3418:	01212823          	sw	s2,16(sp)
    341c:	00112e23          	sw	ra,28(sp)
    3420:	01512223          	sw	s5,4(sp)
    3424:	00060913          	mv	s2,a2
    3428:	9edfe0ef          	jal	ra,1e14 <printf>
    342c:	100a0863          	beqz	s4,353c <memspeed+0x158>
    3430:	00005537          	lui	a0,0x5
    3434:	4b850513          	addi	a0,a0,1208 # 54b8 <crc_table+0x4a0>
    3438:	9ddfe0ef          	jal	ra,1e14 <printf>
    343c:	00048513          	mv	a0,s1
    3440:	a91ff0ef          	jal	ra,2ed0 <print_size>
    3444:	00005537          	lui	a0,0x5
    3448:	4d450513          	addi	a0,a0,1236 # 54d4 <crc_table+0x4bc>
    344c:	9c9fe0ef          	jal	ra,1e14 <printf>
    3450:	f00027b7          	lui	a5,0xf0002
    3454:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3458:	8007a223          	sw	zero,-2044(a5)
    345c:	fff00713          	li	a4,-1
    3460:	80e7a023          	sw	a4,-2048(a5)
    3464:	00100713          	li	a4,1
    3468:	80e7a423          	sw	a4,-2040(a5)
    346c:	08091263          	bnez	s2,34f0 <memspeed+0x10c>
    3470:	80e7a623          	sw	a4,-2036(a5)
    3474:	8107a903          	lw	s2,-2032(a5)
    3478:	fff00713          	li	a4,-1
    347c:	00040793          	mv	a5,s0
    3480:	00e7a023          	sw	a4,0(a5)
    3484:	00e7a223          	sw	a4,4(a5)
    3488:	00e7a423          	sw	a4,8(a5)
    348c:	00e7a623          	sw	a4,12(a5)
    3490:	01078793          	addi	a5,a5,16
    3494:	fef9f6e3          	bgeu	s3,a5,3480 <memspeed+0x9c>
    3498:	f00027b7          	lui	a5,0xf0002
    349c:	00100713          	li	a4,1
    34a0:	00005537          	lui	a0,0x5
    34a4:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    34a8:	4dc50513          	addi	a0,a0,1244 # 54dc <crc_table+0x4c4>
    34ac:	8107aa83          	lw	s5,-2032(a5)
    34b0:	965fe0ef          	jal	ra,1e14 <printf>
    34b4:	02faf537          	lui	a0,0x2faf
    34b8:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa97d0>
    34bc:	02a4b5b3          	mulhu	a1,s1,a0
    34c0:	41590633          	sub	a2,s2,s5
    34c4:	00c936b3          	sltu	a3,s2,a2
    34c8:	40d006b3          	neg	a3,a3
    34cc:	02a48533          	mul	a0,s1,a0
    34d0:	f70ff0ef          	jal	ra,2c40 <__udivdi3>
    34d4:	9fdff0ef          	jal	ra,2ed0 <print_size>
    34d8:	00005537          	lui	a0,0x5
    34dc:	4ec50513          	addi	a0,a0,1260 # 54ec <crc_table+0x4d4>
    34e0:	935fe0ef          	jal	ra,1e14 <printf>
    34e4:	00005537          	lui	a0,0x5
    34e8:	65450513          	addi	a0,a0,1620 # 5654 <crc_table+0x63c>
    34ec:	929fe0ef          	jal	ra,1e14 <printf>
    34f0:	0000500f          	0x500f
    34f4:	949ff0ef          	jal	ra,2e3c <flush_l2_cache>
    34f8:	f00027b7          	lui	a5,0xf0002
    34fc:	00100713          	li	a4,1
    3500:	80e7a423          	sw	a4,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3504:	80e7a623          	sw	a4,-2036(a5)
    3508:	8107a903          	lw	s2,-2032(a5)
    350c:	0024d593          	srli	a1,s1,0x2
    3510:	00058713          	mv	a4,a1
    3514:	00000693          	li	a3,0
    3518:	02071863          	bnez	a4,3548 <memspeed+0x164>
    351c:	0e0a1c63          	bnez	s4,3614 <memspeed+0x230>
    3520:	00042783          	lw	a5,0(s0)
    3524:	00442783          	lw	a5,4(s0)
    3528:	00842783          	lw	a5,8(s0)
    352c:	00c42783          	lw	a5,12(s0)
    3530:	01040413          	addi	s0,s0,16
    3534:	fe89f6e3          	bgeu	s3,s0,3520 <memspeed+0x13c>
    3538:	05c0006f          	j	3594 <memspeed+0x1b0>
    353c:	00005537          	lui	a0,0x5
    3540:	4c450513          	addi	a0,a0,1220 # 54c4 <crc_table+0x4ac>
    3544:	ef5ff06f          	j	3438 <memspeed+0x54>
    3548:	00177793          	andi	a5,a4,1
    354c:	00078463          	beqz	a5,3554 <memspeed+0x170>
    3550:	00168693          	addi	a3,a3,1
    3554:	00175713          	srli	a4,a4,0x1
    3558:	fc1ff06f          	j	3518 <memspeed+0x134>
    355c:	0a070863          	beqz	a4,360c <memspeed+0x228>
    3560:	0017d613          	srli	a2,a5,0x1
    3564:	0017f793          	andi	a5,a5,1
    3568:	40f007b3          	neg	a5,a5
    356c:	00a7f7b3          	and	a5,a5,a0
    3570:	00c7c7b3          	xor	a5,a5,a2
    3574:	00f8f633          	and	a2,a7,a5
    3578:	01068463          	beq	a3,a6,3580 <memspeed+0x19c>
    357c:	02b7f633          	remu	a2,a5,a1
    3580:	00261613          	slli	a2,a2,0x2
    3584:	00c40633          	add	a2,s0,a2
    3588:	00062603          	lw	a2,0(a2)
    358c:	00170713          	addi	a4,a4,1
    3590:	fcb716e3          	bne	a4,a1,355c <memspeed+0x178>
    3594:	f00027b7          	lui	a5,0xf0002
    3598:	00100713          	li	a4,1
    359c:	00005537          	lui	a0,0x5
    35a0:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    35a4:	4f050513          	addi	a0,a0,1264 # 54f0 <crc_table+0x4d8>
    35a8:	8107a403          	lw	s0,-2032(a5)
    35ac:	869fe0ef          	jal	ra,1e14 <printf>
    35b0:	02faf537          	lui	a0,0x2faf
    35b4:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa97d0>
    35b8:	40890633          	sub	a2,s2,s0
    35bc:	00c936b3          	sltu	a3,s2,a2
    35c0:	40d006b3          	neg	a3,a3
    35c4:	02a4b5b3          	mulhu	a1,s1,a0
    35c8:	02a48533          	mul	a0,s1,a0
    35cc:	e74ff0ef          	jal	ra,2c40 <__udivdi3>
    35d0:	901ff0ef          	jal	ra,2ed0 <print_size>
    35d4:	00005537          	lui	a0,0x5
    35d8:	4ec50513          	addi	a0,a0,1260 # 54ec <crc_table+0x4d4>
    35dc:	839fe0ef          	jal	ra,1e14 <printf>
    35e0:	01812403          	lw	s0,24(sp)
    35e4:	01c12083          	lw	ra,28(sp)
    35e8:	01412483          	lw	s1,20(sp)
    35ec:	01012903          	lw	s2,16(sp)
    35f0:	00c12983          	lw	s3,12(sp)
    35f4:	00812a03          	lw	s4,8(sp)
    35f8:	00412a83          	lw	s5,4(sp)
    35fc:	00005537          	lui	a0,0x5
    3600:	65450513          	addi	a0,a0,1620 # 5654 <crc_table+0x63c>
    3604:	02010113          	addi	sp,sp,32
    3608:	80dfe06f          	j	1e14 <printf>
    360c:	00178793          	addi	a5,a5,1
    3610:	f65ff06f          	j	3574 <memspeed+0x190>
    3614:	80200537          	lui	a0,0x80200
    3618:	00000793          	li	a5,0
    361c:	00350513          	addi	a0,a0,3 # 80200003 <_fstack+0x701ff003>
    3620:	00100813          	li	a6,1
    3624:	fff58893          	addi	a7,a1,-1
    3628:	f69ff06f          	j	3590 <memspeed+0x1ac>

0000362c <memtest>:
    362c:	fe010113          	addi	sp,sp,-32
    3630:	00812c23          	sw	s0,24(sp)
    3634:	00912a23          	sw	s1,20(sp)
    3638:	00058413          	mv	s0,a1
    363c:	00050493          	mv	s1,a0
    3640:	00050593          	mv	a1,a0
    3644:	00005537          	lui	a0,0x5
    3648:	50050513          	addi	a0,a0,1280 # 5500 <crc_table+0x4e8>
    364c:	00112e23          	sw	ra,28(sp)
    3650:	01212823          	sw	s2,16(sp)
    3654:	01312623          	sw	s3,12(sp)
    3658:	01412423          	sw	s4,8(sp)
    365c:	01512223          	sw	s5,4(sp)
    3660:	01612023          	sw	s6,0(sp)
    3664:	fb0fe0ef          	jal	ra,1e14 <printf>
    3668:	00040513          	mv	a0,s0
    366c:	865ff0ef          	jal	ra,2ed0 <print_size>
    3670:	00005537          	lui	a0,0x5
    3674:	4d450513          	addi	a0,a0,1236 # 54d4 <crc_table+0x4bc>
    3678:	f9cfe0ef          	jal	ra,1e14 <printf>
    367c:	00048513          	mv	a0,s1
    3680:	925ff0ef          	jal	ra,2fa4 <memtest_access>
    3684:	00000913          	li	s2,0
    3688:	0a051e63          	bnez	a0,3744 <memtest+0x118>
    368c:	20000793          	li	a5,512
    3690:	00050913          	mv	s2,a0
    3694:	00040993          	mv	s3,s0
    3698:	0087f463          	bgeu	a5,s0,36a0 <memtest+0x74>
    369c:	20000993          	li	s3,512
    36a0:	000087b7          	lui	a5,0x8
    36a4:	00040b13          	mv	s6,s0
    36a8:	0087f463          	bgeu	a5,s0,36b0 <memtest+0x84>
    36ac:	00008b37          	lui	s6,0x8
    36b0:	00098593          	mv	a1,s3
    36b4:	00048513          	mv	a0,s1
    36b8:	955ff0ef          	jal	ra,300c <memtest_bus>
    36bc:	00050a93          	mv	s5,a0
    36c0:	00000613          	li	a2,0
    36c4:	000b0593          	mv	a1,s6
    36c8:	00048513          	mv	a0,s1
    36cc:	a29ff0ef          	jal	ra,30f4 <memtest_addr>
    36d0:	00050a13          	mv	s4,a0
    36d4:	00000693          	li	a3,0
    36d8:	00048513          	mv	a0,s1
    36dc:	00100613          	li	a2,1
    36e0:	00040593          	mv	a1,s0
    36e4:	b15ff0ef          	jal	ra,31f8 <memtest_data>
    36e8:	014a87b3          	add	a5,s5,s4
    36ec:	00a787b3          	add	a5,a5,a0
    36f0:	00050493          	mv	s1,a0
    36f4:	06078e63          	beqz	a5,3770 <memtest+0x144>
    36f8:	00199613          	slli	a2,s3,0x1
    36fc:	00005537          	lui	a0,0x5
    3700:	00265613          	srli	a2,a2,0x2
    3704:	000a8593          	mv	a1,s5
    3708:	51050513          	addi	a0,a0,1296 # 5510 <crc_table+0x4f8>
    370c:	f08fe0ef          	jal	ra,1e14 <printf>
    3710:	00005537          	lui	a0,0x5
    3714:	002b5613          	srli	a2,s6,0x2
    3718:	000a0593          	mv	a1,s4
    371c:	52850513          	addi	a0,a0,1320 # 5528 <crc_table+0x510>
    3720:	ef4fe0ef          	jal	ra,1e14 <printf>
    3724:	00005537          	lui	a0,0x5
    3728:	00245613          	srli	a2,s0,0x2
    372c:	00048593          	mv	a1,s1
    3730:	54050513          	addi	a0,a0,1344 # 5540 <crc_table+0x528>
    3734:	ee0fe0ef          	jal	ra,1e14 <printf>
    3738:	00005537          	lui	a0,0x5
    373c:	55850513          	addi	a0,a0,1368 # 5558 <crc_table+0x540>
    3740:	ed4fe0ef          	jal	ra,1e14 <printf>
    3744:	01c12083          	lw	ra,28(sp)
    3748:	01812403          	lw	s0,24(sp)
    374c:	01412483          	lw	s1,20(sp)
    3750:	00c12983          	lw	s3,12(sp)
    3754:	00812a03          	lw	s4,8(sp)
    3758:	00412a83          	lw	s5,4(sp)
    375c:	00012b03          	lw	s6,0(sp)
    3760:	00090513          	mv	a0,s2
    3764:	01012903          	lw	s2,16(sp)
    3768:	02010113          	addi	sp,sp,32
    376c:	00008067          	ret
    3770:	00005537          	lui	a0,0x5
    3774:	56450513          	addi	a0,a0,1380 # 5564 <crc_table+0x54c>
    3778:	e9cfe0ef          	jal	ra,1e14 <printf>
    377c:	00100913          	li	s2,1
    3780:	fc5ff06f          	j	3744 <memtest+0x118>

00003784 <uart_isr>:
    3784:	f0001737          	lui	a4,0xf0001
    3788:	01072683          	lw	a3,16(a4) # f0001010 <_fstack+0xe0000010>
    378c:	01472783          	lw	a5,20(a4)
    3790:	00d7f7b3          	and	a5,a5,a3
    3794:	0027f713          	andi	a4,a5,2
    3798:	00071863          	bnez	a4,37a8 <uart_isr+0x24>
    379c:	0017f793          	andi	a5,a5,1
    37a0:	04079c63          	bnez	a5,37f8 <uart_isr+0x74>
    37a4:	00008067          	ret
    37a8:	10000737          	lui	a4,0x10000
    37ac:	15472803          	lw	a6,340(a4) # 10000154 <rx_consume>
    37b0:	100005b7          	lui	a1,0x10000
    37b4:	f00016b7          	lui	a3,0xf0001
    37b8:	10000637          	lui	a2,0x10000
    37bc:	17058593          	addi	a1,a1,368 # 10000170 <rx_buf>
    37c0:	00200893          	li	a7,2
    37c4:	0086a703          	lw	a4,8(a3) # f0001008 <_fstack+0xe0000008>
    37c8:	fc071ae3          	bnez	a4,379c <uart_isr+0x18>
    37cc:	0006a303          	lw	t1,0(a3)
    37d0:	15862703          	lw	a4,344(a2) # 10000158 <rx_produce>
    37d4:	00170713          	addi	a4,a4,1
    37d8:	07f77713          	andi	a4,a4,127
    37dc:	00e80a63          	beq	a6,a4,37f0 <uart_isr+0x6c>
    37e0:	15862503          	lw	a0,344(a2)
    37e4:	14e62c23          	sw	a4,344(a2)
    37e8:	00a58533          	add	a0,a1,a0
    37ec:	00650023          	sb	t1,0(a0)
    37f0:	0116a823          	sw	a7,16(a3)
    37f4:	fd1ff06f          	j	37c4 <uart_isr+0x40>
    37f8:	100007b7          	lui	a5,0x10000
    37fc:	1507a603          	lw	a2,336(a5) # 10000150 <tx_produce>
    3800:	100006b7          	lui	a3,0x10000
    3804:	100007b7          	lui	a5,0x10000
    3808:	00078513          	mv	a0,a5
    380c:	f00015b7          	lui	a1,0xf0001
    3810:	17068693          	addi	a3,a3,368 # 10000170 <rx_buf>
    3814:	14c7a703          	lw	a4,332(a5) # 1000014c <tx_consume>
    3818:	00c70663          	beq	a4,a2,3824 <uart_isr+0xa0>
    381c:	0045a703          	lw	a4,4(a1) # f0001004 <_fstack+0xe0000004>
    3820:	00070e63          	beqz	a4,383c <uart_isr+0xb8>
    3824:	14c52783          	lw	a5,332(a0)
    3828:	00f61863          	bne	a2,a5,3838 <uart_isr+0xb4>
    382c:	f00017b7          	lui	a5,0xf0001
    3830:	00200713          	li	a4,2
    3834:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    3838:	00008067          	ret
    383c:	14c7a703          	lw	a4,332(a5)
    3840:	00e68733          	add	a4,a3,a4
    3844:	08074703          	lbu	a4,128(a4)
    3848:	00e5a023          	sw	a4,0(a1)
    384c:	14c7a703          	lw	a4,332(a5)
    3850:	00170713          	addi	a4,a4,1
    3854:	07f77713          	andi	a4,a4,127
    3858:	14e7a623          	sw	a4,332(a5)
    385c:	fb9ff06f          	j	3814 <uart_isr+0x90>

00003860 <uart_read>:
    3860:	30002673          	csrr	a2,mstatus
    3864:	10000737          	lui	a4,0x10000
    3868:	00867613          	andi	a2,a2,8
    386c:	15472783          	lw	a5,340(a4) # 10000154 <rx_consume>
    3870:	00070693          	mv	a3,a4
    3874:	10000737          	lui	a4,0x10000
    3878:	02060663          	beqz	a2,38a4 <uart_read+0x44>
    387c:	15872603          	lw	a2,344(a4) # 10000158 <rx_produce>
    3880:	fef60ee3          	beq	a2,a5,387c <uart_read+0x1c>
    3884:	10000737          	lui	a4,0x10000
    3888:	17070713          	addi	a4,a4,368 # 10000170 <rx_buf>
    388c:	00f70733          	add	a4,a4,a5
    3890:	00178793          	addi	a5,a5,1
    3894:	07f7f793          	andi	a5,a5,127
    3898:	00074503          	lbu	a0,0(a4)
    389c:	14f6aa23          	sw	a5,340(a3)
    38a0:	0100006f          	j	38b0 <uart_read+0x50>
    38a4:	15872703          	lw	a4,344(a4)
    38a8:	00000513          	li	a0,0
    38ac:	fcf71ce3          	bne	a4,a5,3884 <uart_read+0x24>
    38b0:	00008067          	ret

000038b4 <uart_read_nonblock>:
    38b4:	10000737          	lui	a4,0x10000
    38b8:	100007b7          	lui	a5,0x10000
    38bc:	1587a783          	lw	a5,344(a5) # 10000158 <rx_produce>
    38c0:	15472503          	lw	a0,340(a4) # 10000154 <rx_consume>
    38c4:	40f50533          	sub	a0,a0,a5
    38c8:	00a03533          	snez	a0,a0
    38cc:	00008067          	ret

000038d0 <uart_write>:
    38d0:	10000737          	lui	a4,0x10000
    38d4:	15072783          	lw	a5,336(a4) # 10000150 <tx_produce>
    38d8:	00178793          	addi	a5,a5,1
    38dc:	07f7f793          	andi	a5,a5,127
    38e0:	30002673          	csrr	a2,mstatus
    38e4:	00867613          	andi	a2,a2,8
    38e8:	100006b7          	lui	a3,0x10000
    38ec:	06060063          	beqz	a2,394c <uart_write+0x7c>
    38f0:	14c6a603          	lw	a2,332(a3) # 1000014c <tx_consume>
    38f4:	fef60ee3          	beq	a2,a5,38f0 <uart_write+0x20>
    38f8:	f0c025b7          	lui	a1,0xf0c02
    38fc:	0005a603          	lw	a2,0(a1) # f0c02000 <_fstack+0xe0c01000>
    3900:	ffd67813          	andi	a6,a2,-3
    3904:	0105a023          	sw	a6,0(a1)
    3908:	14c6a683          	lw	a3,332(a3)
    390c:	15072803          	lw	a6,336(a4)
    3910:	01069863          	bne	a3,a6,3920 <uart_write+0x50>
    3914:	f00015b7          	lui	a1,0xf0001
    3918:	0045a683          	lw	a3,4(a1) # f0001004 <_fstack+0xe0000004>
    391c:	02068e63          	beqz	a3,3958 <uart_write+0x88>
    3920:	100006b7          	lui	a3,0x10000
    3924:	17068693          	addi	a3,a3,368 # 10000170 <rx_buf>
    3928:	010686b3          	add	a3,a3,a6
    392c:	14f72823          	sw	a5,336(a4)
    3930:	08a68023          	sb	a0,128(a3)
    3934:	f00017b7          	lui	a5,0xf0001
    3938:	00300713          	li	a4,3
    393c:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    3940:	f0c027b7          	lui	a5,0xf0c02
    3944:	00c7a023          	sw	a2,0(a5) # f0c02000 <_fstack+0xe0c01000>
    3948:	00c0006f          	j	3954 <uart_write+0x84>
    394c:	14c6a603          	lw	a2,332(a3)
    3950:	faf614e3          	bne	a2,a5,38f8 <uart_write+0x28>
    3954:	00008067          	ret
    3958:	00a5a023          	sw	a0,0(a1)
    395c:	fe5ff06f          	j	3940 <uart_write+0x70>

00003960 <uart_init>:
    3960:	100007b7          	lui	a5,0x10000
    3964:	1407ac23          	sw	zero,344(a5) # 10000158 <rx_produce>
    3968:	100007b7          	lui	a5,0x10000
    396c:	1407aa23          	sw	zero,340(a5) # 10000154 <rx_consume>
    3970:	100007b7          	lui	a5,0x10000
    3974:	1407a823          	sw	zero,336(a5) # 10000150 <tx_produce>
    3978:	100007b7          	lui	a5,0x10000
    397c:	1407a623          	sw	zero,332(a5) # 1000014c <tx_consume>
    3980:	00200713          	li	a4,2
    3984:	f00017b7          	lui	a5,0xf0001
    3988:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    398c:	000047b7          	lui	a5,0x4
    3990:	9f878793          	addi	a5,a5,-1544 # 39f8 <irq_attach>
    3994:	02078c63          	beqz	a5,39cc <uart_init+0x6c>
    3998:	000035b7          	lui	a1,0x3
    399c:	ff010113          	addi	sp,sp,-16
    39a0:	78458593          	addi	a1,a1,1924 # 3784 <uart_isr>
    39a4:	00100513          	li	a0,1
    39a8:	00112623          	sw	ra,12(sp)
    39ac:	04c000ef          	jal	ra,39f8 <irq_attach>
    39b0:	f0c02737          	lui	a4,0xf0c02
    39b4:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    39b8:	00c12083          	lw	ra,12(sp)
    39bc:	0027e793          	ori	a5,a5,2
    39c0:	00f72023          	sw	a5,0(a4)
    39c4:	01010113          	addi	sp,sp,16
    39c8:	00008067          	ret
    39cc:	f0c02737          	lui	a4,0xf0c02
    39d0:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    39d4:	0027e793          	ori	a5,a5,2
    39d8:	00f72023          	sw	a5,0(a4)
    39dc:	00008067          	ret

000039e0 <uart_sync>:
    39e0:	100007b7          	lui	a5,0x10000
    39e4:	1507a783          	lw	a5,336(a5) # 10000150 <tx_produce>
    39e8:	100006b7          	lui	a3,0x10000
    39ec:	14c6a703          	lw	a4,332(a3) # 1000014c <tx_consume>
    39f0:	fef71ee3          	bne	a4,a5,39ec <uart_sync+0xc>
    39f4:	00008067          	ret

000039f8 <irq_attach>:
    39f8:	00200793          	li	a5,2
    39fc:	02a7f663          	bgeu	a5,a0,3a28 <irq_attach+0x30>
    3a00:	00050593          	mv	a1,a0
    3a04:	00005537          	lui	a0,0x5
    3a08:	ff010113          	addi	sp,sp,-16
    3a0c:	57050513          	addi	a0,a0,1392 # 5570 <crc_table+0x558>
    3a10:	00112623          	sw	ra,12(sp)
    3a14:	c00fe0ef          	jal	ra,1e14 <printf>
    3a18:	00c12083          	lw	ra,12(sp)
    3a1c:	fff00513          	li	a0,-1
    3a20:	01010113          	addi	sp,sp,16
    3a24:	00008067          	ret
    3a28:	300026f3          	csrr	a3,mstatus
    3a2c:	30047073          	csrci	mstatus,8
    3a30:	10000737          	lui	a4,0x10000
    3a34:	00251793          	slli	a5,a0,0x2
    3a38:	27070713          	addi	a4,a4,624 # 10000270 <irq_table>
    3a3c:	00f707b3          	add	a5,a4,a5
    3a40:	00b7a023          	sw	a1,0(a5)
    3a44:	0086f793          	andi	a5,a3,8
    3a48:	00078663          	beqz	a5,3a54 <irq_attach+0x5c>
    3a4c:	30046073          	csrsi	mstatus,8
    3a50:	00008067          	ret
    3a54:	30047073          	csrci	mstatus,8
    3a58:	00008067          	ret

00003a5c <irq_detach>:
    3a5c:	00000593          	li	a1,0
    3a60:	f99ff06f          	j	39f8 <irq_attach>

00003a64 <plic_init>:
    3a64:	f0c007b7          	lui	a5,0xf0c00
    3a68:	00100713          	li	a4,1
    3a6c:	00e7a023          	sw	a4,0(a5) # f0c00000 <_fstack+0xe0bff000>
    3a70:	00e7a223          	sw	a4,4(a5)
    3a74:	00e7a423          	sw	a4,8(a5)
    3a78:	00e7a623          	sw	a4,12(a5)
    3a7c:	00e7a823          	sw	a4,16(a5)
    3a80:	00e7aa23          	sw	a4,20(a5)
    3a84:	00e7ac23          	sw	a4,24(a5)
    3a88:	00e7ae23          	sw	a4,28(a5)
    3a8c:	f0c027b7          	lui	a5,0xf0c02
    3a90:	0ff00713          	li	a4,255
    3a94:	00e7a023          	sw	a4,0(a5) # f0c02000 <_fstack+0xe0c01000>
    3a98:	f0e007b7          	lui	a5,0xf0e00
    3a9c:	0007a023          	sw	zero,0(a5) # f0e00000 <_fstack+0xe0dff000>
    3aa0:	00008067          	ret

00003aa4 <isr>:
    3aa4:	fd010113          	addi	sp,sp,-48
    3aa8:	02912223          	sw	s1,36(sp)
    3aac:	100004b7          	lui	s1,0x10000
    3ab0:	03212023          	sw	s2,32(sp)
    3ab4:	01312e23          	sw	s3,28(sp)
    3ab8:	01412c23          	sw	s4,24(sp)
    3abc:	01512a23          	sw	s5,20(sp)
    3ac0:	01612823          	sw	s6,16(sp)
    3ac4:	01712623          	sw	s7,12(sp)
    3ac8:	02112623          	sw	ra,44(sp)
    3acc:	02812423          	sw	s0,40(sp)
    3ad0:	00005937          	lui	s2,0x5
    3ad4:	000059b7          	lui	s3,0x5
    3ad8:	00005a37          	lui	s4,0x5
    3adc:	00005ab7          	lui	s5,0x5
    3ae0:	00005b37          	lui	s6,0x5
    3ae4:	00005bb7          	lui	s7,0x5
    3ae8:	27048493          	addi	s1,s1,624 # 10000270 <irq_table>
    3aec:	f0e007b7          	lui	a5,0xf0e00
    3af0:	0047a403          	lw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    3af4:	02041863          	bnez	s0,3b24 <isr+0x80>
    3af8:	02c12083          	lw	ra,44(sp)
    3afc:	02812403          	lw	s0,40(sp)
    3b00:	02412483          	lw	s1,36(sp)
    3b04:	02012903          	lw	s2,32(sp)
    3b08:	01c12983          	lw	s3,28(sp)
    3b0c:	01812a03          	lw	s4,24(sp)
    3b10:	01412a83          	lw	s5,20(sp)
    3b14:	01012b03          	lw	s6,16(sp)
    3b18:	00c12b83          	lw	s7,12(sp)
    3b1c:	03010113          	addi	sp,sp,48
    3b20:	00008067          	ret
    3b24:	00200793          	li	a5,2
    3b28:	0287e263          	bltu	a5,s0,3b4c <isr+0xa8>
    3b2c:	00241793          	slli	a5,s0,0x2
    3b30:	00f487b3          	add	a5,s1,a5
    3b34:	0007a783          	lw	a5,0(a5)
    3b38:	00078a63          	beqz	a5,3b4c <isr+0xa8>
    3b3c:	000780e7          	jalr	a5
    3b40:	f0e007b7          	lui	a5,0xf0e00
    3b44:	0087a223          	sw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    3b48:	fa5ff06f          	j	3aec <isr+0x48>
    3b4c:	00040593          	mv	a1,s0
    3b50:	57c90513          	addi	a0,s2,1404 # 557c <crc_table+0x564>
    3b54:	ac0fe0ef          	jal	ra,1e14 <printf>
    3b58:	f0c027b7          	lui	a5,0xf0c02
    3b5c:	0007a583          	lw	a1,0(a5) # f0c02000 <_fstack+0xe0c01000>
    3b60:	59c98513          	addi	a0,s3,1436 # 559c <crc_table+0x584>
    3b64:	ab0fe0ef          	jal	ra,1e14 <printf>
    3b68:	f0c017b7          	lui	a5,0xf0c01
    3b6c:	0007a583          	lw	a1,0(a5) # f0c01000 <_fstack+0xe0c00000>
    3b70:	5b8a0513          	addi	a0,s4,1464 # 55b8 <crc_table+0x5a0>
    3b74:	aa0fe0ef          	jal	ra,1e14 <printf>
    3b78:	341025f3          	csrr	a1,mepc
    3b7c:	5d4a8513          	addi	a0,s5,1492 # 55d4 <crc_table+0x5bc>
    3b80:	a94fe0ef          	jal	ra,1e14 <printf>
    3b84:	342025f3          	csrr	a1,mcause
    3b88:	5e8b0513          	addi	a0,s6,1512 # 55e8 <crc_table+0x5d0>
    3b8c:	a88fe0ef          	jal	ra,1e14 <printf>
    3b90:	343025f3          	csrr	a1,mtval
    3b94:	5fcb8513          	addi	a0,s7,1532 # 55fc <crc_table+0x5e4>
    3b98:	a7cfe0ef          	jal	ra,1e14 <printf>
    3b9c:	304025f3          	csrr	a1,mie
    3ba0:	00005537          	lui	a0,0x5
    3ba4:	61050513          	addi	a0,a0,1552 # 5610 <crc_table+0x5f8>
    3ba8:	a6cfe0ef          	jal	ra,1e14 <printf>
    3bac:	344025f3          	csrr	a1,mip
    3bb0:	00005537          	lui	a0,0x5
    3bb4:	62450513          	addi	a0,a0,1572 # 5624 <crc_table+0x60c>
    3bb8:	a5cfe0ef          	jal	ra,1e14 <printf>
    3bbc:	00005537          	lui	a0,0x5
    3bc0:	63850513          	addi	a0,a0,1592 # 5638 <crc_table+0x620>
    3bc4:	a50fe0ef          	jal	ra,1e14 <printf>
    3bc8:	f79ff06f          	j	3b40 <isr+0x9c>

00003bcc <cdelay>:
    3bcc:	00000013          	nop
    3bd0:	fff50513          	addi	a0,a0,-1
    3bd4:	fe051ce3          	bnez	a0,3bcc <cdelay>
    3bd8:	00008067          	ret

00003bdc <sdram_get_databits>:
    3bdc:	01000513          	li	a0,16
    3be0:	00008067          	ret

00003be4 <sdram_get_freq>:
    3be4:	02faf537          	lui	a0,0x2faf
    3be8:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa97d0>
    3bec:	00008067          	ret

00003bf0 <sdram_get_cl>:
    3bf0:	00200513          	li	a0,2
    3bf4:	00008067          	ret

00003bf8 <sdram_get_cwl>:
    3bf8:	00200513          	li	a0,2
    3bfc:	00008067          	ret

00003c00 <sdram_software_control_on>:
    3c00:	f00037b7          	lui	a5,0xf0003
    3c04:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    3c08:	00e00713          	li	a4,14
    3c0c:	00e68a63          	beq	a3,a4,3c20 <sdram_software_control_on+0x20>
    3c10:	00005537          	lui	a0,0x5
    3c14:	80e7a023          	sw	a4,-2048(a5)
    3c18:	65850513          	addi	a0,a0,1624 # 5658 <crc_table+0x640>
    3c1c:	9f8fe06f          	j	1e14 <printf>
    3c20:	00008067          	ret

00003c24 <sdram_software_control_off>:
    3c24:	f00037b7          	lui	a5,0xf0003
    3c28:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    3c2c:	00100713          	li	a4,1
    3c30:	00e68a63          	beq	a3,a4,3c44 <sdram_software_control_off+0x20>
    3c34:	00005537          	lui	a0,0x5
    3c38:	80e7a023          	sw	a4,-2048(a5)
    3c3c:	68050513          	addi	a0,a0,1664 # 5680 <crc_table+0x668>
    3c40:	9d4fe06f          	j	1e14 <printf>
    3c44:	00008067          	ret

00003c48 <sdram_mode_register_write>:
    3c48:	f00037b7          	lui	a5,0xf0003
    3c4c:	80b7a623          	sw	a1,-2036(a5) # f000280c <_fstack+0xe000180c>
    3c50:	80a7a823          	sw	a0,-2032(a5)
    3c54:	00f00713          	li	a4,15
    3c58:	80e7a223          	sw	a4,-2044(a5)
    3c5c:	00100713          	li	a4,1
    3c60:	80e7a423          	sw	a4,-2040(a5)
    3c64:	00008067          	ret

00003c68 <sdram_leveling>:
    3c68:	ff010113          	addi	sp,sp,-16
    3c6c:	00112623          	sw	ra,12(sp)
    3c70:	f91ff0ef          	jal	ra,3c00 <sdram_software_control_on>
    3c74:	fb1ff0ef          	jal	ra,3c24 <sdram_software_control_off>
    3c78:	00c12083          	lw	ra,12(sp)
    3c7c:	00100513          	li	a0,1
    3c80:	01010113          	addi	sp,sp,16
    3c84:	00008067          	ret

00003c88 <sdram_init>:
    3c88:	00005537          	lui	a0,0x5
    3c8c:	fe010113          	addi	sp,sp,-32
    3c90:	400005b7          	lui	a1,0x40000
    3c94:	6a850513          	addi	a0,a0,1704 # 56a8 <crc_table+0x690>
    3c98:	00112e23          	sw	ra,28(sp)
    3c9c:	00812c23          	sw	s0,24(sp)
    3ca0:	00912a23          	sw	s1,20(sp)
    3ca4:	f0003437          	lui	s0,0xf0003
    3ca8:	01212823          	sw	s2,16(sp)
    3cac:	01312623          	sw	s3,12(sp)
    3cb0:	01412423          	sw	s4,8(sp)
    3cb4:	960fe0ef          	jal	ra,1e14 <printf>
    3cb8:	f49ff0ef          	jal	ra,3c00 <sdram_software_control_on>
    3cbc:	80042623          	sw	zero,-2036(s0) # f000280c <_fstack+0xe000180c>
    3cc0:	00e00793          	li	a5,14
    3cc4:	80042823          	sw	zero,-2032(s0)
    3cc8:	00005537          	lui	a0,0x5
    3ccc:	80f42023          	sw	a5,-2048(s0)
    3cd0:	e2050513          	addi	a0,a0,-480 # 4e20 <crc16_table+0x208>
    3cd4:	40000a13          	li	s4,1024
    3cd8:	ef5ff0ef          	jal	ra,3bcc <cdelay>
    3cdc:	81442623          	sw	s4,-2036(s0)
    3ce0:	80042823          	sw	zero,-2032(s0)
    3ce4:	00b00993          	li	s3,11
    3ce8:	81342223          	sw	s3,-2044(s0)
    3cec:	00100493          	li	s1,1
    3cf0:	80942423          	sw	s1,-2040(s0)
    3cf4:	12000793          	li	a5,288
    3cf8:	80f42623          	sw	a5,-2036(s0)
    3cfc:	80042823          	sw	zero,-2032(s0)
    3d00:	00f00913          	li	s2,15
    3d04:	81242223          	sw	s2,-2044(s0)
    3d08:	0c800513          	li	a0,200
    3d0c:	80942423          	sw	s1,-2040(s0)
    3d10:	ebdff0ef          	jal	ra,3bcc <cdelay>
    3d14:	81442623          	sw	s4,-2036(s0)
    3d18:	80042823          	sw	zero,-2032(s0)
    3d1c:	81342223          	sw	s3,-2044(s0)
    3d20:	80942423          	sw	s1,-2040(s0)
    3d24:	80042623          	sw	zero,-2036(s0)
    3d28:	80042823          	sw	zero,-2032(s0)
    3d2c:	00d00993          	li	s3,13
    3d30:	81342223          	sw	s3,-2044(s0)
    3d34:	00400513          	li	a0,4
    3d38:	80942423          	sw	s1,-2040(s0)
    3d3c:	e91ff0ef          	jal	ra,3bcc <cdelay>
    3d40:	80042623          	sw	zero,-2036(s0)
    3d44:	80042823          	sw	zero,-2032(s0)
    3d48:	81342223          	sw	s3,-2044(s0)
    3d4c:	00400513          	li	a0,4
    3d50:	80942423          	sw	s1,-2040(s0)
    3d54:	e79ff0ef          	jal	ra,3bcc <cdelay>
    3d58:	02000793          	li	a5,32
    3d5c:	80f42623          	sw	a5,-2036(s0)
    3d60:	80042823          	sw	zero,-2032(s0)
    3d64:	81242223          	sw	s2,-2044(s0)
    3d68:	0c800513          	li	a0,200
    3d6c:	80942423          	sw	s1,-2040(s0)
    3d70:	e5dff0ef          	jal	ra,3bcc <cdelay>
    3d74:	eb1ff0ef          	jal	ra,3c24 <sdram_software_control_off>
    3d78:	002005b7          	lui	a1,0x200
    3d7c:	40000537          	lui	a0,0x40000
    3d80:	8adff0ef          	jal	ra,362c <memtest>
    3d84:	00050e63          	beqz	a0,3da0 <sdram_init+0x118>
    3d88:	40000537          	lui	a0,0x40000
    3d8c:	00000693          	li	a3,0
    3d90:	00000613          	li	a2,0
    3d94:	002005b7          	lui	a1,0x200
    3d98:	e4cff0ef          	jal	ra,33e4 <memspeed>
    3d9c:	00100513          	li	a0,1
    3da0:	01c12083          	lw	ra,28(sp)
    3da4:	01812403          	lw	s0,24(sp)
    3da8:	01412483          	lw	s1,20(sp)
    3dac:	01012903          	lw	s2,16(sp)
    3db0:	00c12983          	lw	s3,12(sp)
    3db4:	00812a03          	lw	s4,8(sp)
    3db8:	02010113          	addi	sp,sp,32
    3dbc:	00008067          	ret

00003dc0 <print_size>:
    3dc0:	fe010113          	addi	sp,sp,-32
    3dc4:	00812c23          	sw	s0,24(sp)
    3dc8:	00112e23          	sw	ra,28(sp)
    3dcc:	00912a23          	sw	s1,20(sp)
    3dd0:	01212823          	sw	s2,16(sp)
    3dd4:	01312623          	sw	s3,12(sp)
    3dd8:	00050413          	mv	s0,a0
    3ddc:	00058693          	mv	a3,a1
    3de0:	08059063          	bnez	a1,3e60 <print_size+0xa0>
    3de4:	3ff00793          	li	a5,1023
    3de8:	02a7e663          	bltu	a5,a0,3e14 <print_size+0x54>
    3dec:	01812403          	lw	s0,24(sp)
    3df0:	01c12083          	lw	ra,28(sp)
    3df4:	01412483          	lw	s1,20(sp)
    3df8:	01012903          	lw	s2,16(sp)
    3dfc:	00c12983          	lw	s3,12(sp)
    3e00:	00050613          	mv	a2,a0
    3e04:	00005537          	lui	a0,0x5
    3e08:	6c850513          	addi	a0,a0,1736 # 56c8 <crc_table+0x6b0>
    3e0c:	02010113          	addi	sp,sp,32
    3e10:	804fe06f          	j	1e14 <printf>
    3e14:	001007b7          	lui	a5,0x100
    3e18:	04f57463          	bgeu	a0,a5,3e60 <print_size+0xa0>
    3e1c:	06600613          	li	a2,102
    3e20:	00000693          	li	a3,0
    3e24:	3ff57513          	andi	a0,a0,1023
    3e28:	e19fe0ef          	jal	ra,2c40 <__udivdi3>
    3e2c:	00050713          	mv	a4,a0
    3e30:	00005537          	lui	a0,0x5
    3e34:	00058793          	mv	a5,a1
    3e38:	00a45613          	srli	a2,s0,0xa
    3e3c:	00000693          	li	a3,0
    3e40:	6d050513          	addi	a0,a0,1744 # 56d0 <crc_table+0x6b8>
    3e44:	01812403          	lw	s0,24(sp)
    3e48:	01c12083          	lw	ra,28(sp)
    3e4c:	01412483          	lw	s1,20(sp)
    3e50:	01012903          	lw	s2,16(sp)
    3e54:	00c12983          	lw	s3,12(sp)
    3e58:	02010113          	addi	sp,sp,32
    3e5c:	fb9fd06f          	j	1e14 <printf>
    3e60:	00c69793          	slli	a5,a3,0xc
    3e64:	01445913          	srli	s2,s0,0x14
    3e68:	0127e933          	or	s2,a5,s2
    3e6c:	0146d993          	srli	s3,a3,0x14
    3e70:	04069c63          	bnez	a3,3ec8 <print_size+0x108>
    3e74:	400007b7          	lui	a5,0x40000
    3e78:	04f47863          	bgeu	s0,a5,3ec8 <print_size+0x108>
    3e7c:	01695793          	srli	a5,s2,0x16
    3e80:	00a45413          	srli	s0,s0,0xa
    3e84:	00a99593          	slli	a1,s3,0xa
    3e88:	00a91513          	slli	a0,s2,0xa
    3e8c:	00b7e5b3          	or	a1,a5,a1
    3e90:	40a40533          	sub	a0,s0,a0
    3e94:	00a43433          	sltu	s0,s0,a0
    3e98:	40b005b3          	neg	a1,a1
    3e9c:	06600613          	li	a2,102
    3ea0:	00000693          	li	a3,0
    3ea4:	408585b3          	sub	a1,a1,s0
    3ea8:	d99fe0ef          	jal	ra,2c40 <__udivdi3>
    3eac:	00050713          	mv	a4,a0
    3eb0:	00005537          	lui	a0,0x5
    3eb4:	00058793          	mv	a5,a1
    3eb8:	00090613          	mv	a2,s2
    3ebc:	00098693          	mv	a3,s3
    3ec0:	6e050513          	addi	a0,a0,1760 # 56e0 <crc_table+0x6c8>
    3ec4:	f81ff06f          	j	3e44 <print_size+0x84>
    3ec8:	00269793          	slli	a5,a3,0x2
    3ecc:	01e45413          	srli	s0,s0,0x1e
    3ed0:	0087e433          	or	s0,a5,s0
    3ed4:	01e6d493          	srli	s1,a3,0x1e
    3ed8:	01645793          	srli	a5,s0,0x16
    3edc:	00a49593          	slli	a1,s1,0xa
    3ee0:	00a41513          	slli	a0,s0,0xa
    3ee4:	00b7e5b3          	or	a1,a5,a1
    3ee8:	40a90533          	sub	a0,s2,a0
    3eec:	00a93933          	sltu	s2,s2,a0
    3ef0:	40b985b3          	sub	a1,s3,a1
    3ef4:	06600613          	li	a2,102
    3ef8:	00000693          	li	a3,0
    3efc:	412585b3          	sub	a1,a1,s2
    3f00:	d41fe0ef          	jal	ra,2c40 <__udivdi3>
    3f04:	00050713          	mv	a4,a0
    3f08:	00005537          	lui	a0,0x5
    3f0c:	00058793          	mv	a5,a1
    3f10:	00040613          	mv	a2,s0
    3f14:	00048693          	mv	a3,s1
    3f18:	6f050513          	addi	a0,a0,1776 # 56f0 <crc_table+0x6d8>
    3f1c:	f29ff06f          	j	3e44 <print_size+0x84>

00003f20 <print_progress>:
    3f20:	ff010113          	addi	sp,sp,-16
    3f24:	00812423          	sw	s0,8(sp)
    3f28:	00070413          	mv	s0,a4
    3f2c:	00d58733          	add	a4,a1,a3
    3f30:	00912223          	sw	s1,4(sp)
    3f34:	00060813          	mv	a6,a2
    3f38:	00068493          	mv	s1,a3
    3f3c:	008607b3          	add	a5,a2,s0
    3f40:	00b736b3          	sltu	a3,a4,a1
    3f44:	00058613          	mv	a2,a1
    3f48:	00050593          	mv	a1,a0
    3f4c:	00005537          	lui	a0,0x5
    3f50:	00f687b3          	add	a5,a3,a5
    3f54:	70050513          	addi	a0,a0,1792 # 5700 <crc_table+0x6e8>
    3f58:	00080693          	mv	a3,a6
    3f5c:	00112623          	sw	ra,12(sp)
    3f60:	eb5fd0ef          	jal	ra,1e14 <printf>
    3f64:	00048513          	mv	a0,s1
    3f68:	00040593          	mv	a1,s0
    3f6c:	e55ff0ef          	jal	ra,3dc0 <print_size>
    3f70:	00812403          	lw	s0,8(sp)
    3f74:	00c12083          	lw	ra,12(sp)
    3f78:	00412483          	lw	s1,4(sp)
    3f7c:	00005537          	lui	a0,0x5
    3f80:	45450513          	addi	a0,a0,1108 # 5454 <crc_table+0x43c>
    3f84:	01010113          	addi	sp,sp,16
    3f88:	e8dfd06f          	j	1e14 <printf>

00003f8c <sdram_get_supported_memory>:
    3f8c:	02000537          	lui	a0,0x2000
    3f90:	00000593          	li	a1,0
    3f94:	00008067          	ret
