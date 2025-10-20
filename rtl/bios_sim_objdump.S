
bios.elf:     file format elf32-littleriscv


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
      64:	184040ef          	jal	ra,41e8 <isr>
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
      c8:	0e05a223          	sw	zero,228(a1) # 100001a8 <smp_lottery_lock>

000000cc <smp_tyranny>:
      cc:	f1402573          	csrr	a0,mhartid
      d0:	02050e63          	beqz	a0,10c <data_init>

000000d4 <smp_slave>:
      d4:	10000517          	auipc	a0,0x10000
      d8:	0d452503          	lw	a0,212(a0) # 100001a8 <smp_lottery_lock>
      dc:	fe050ce3          	beqz	a0,d4 <smp_slave>
      e0:	0220000f          	fence	r,r
      e4:	0000100f          	fence.i
      e8:	10000517          	auipc	a0,0x10000
      ec:	0b452503          	lw	a0,180(a0) # 1000019c <smp_lottery_args>
      f0:	10000597          	auipc	a1,0x10000
      f4:	0b05a583          	lw	a1,176(a1) # 100001a0 <smp_lottery_args+0x4>
      f8:	10000617          	auipc	a2,0x10000
      fc:	0ac62603          	lw	a2,172(a2) # 100001a4 <smp_lottery_args+0x8>
     100:	10000697          	auipc	a3,0x10000
     104:	0986a683          	lw	a3,152(a3) # 10000198 <smp_lottery_target>
     108:	00068067          	jr	a3

0000010c <data_init>:
     10c:	10000517          	auipc	a0,0x10000
     110:	ef450513          	addi	a0,a0,-268 # 10000000 <s_leds>
     114:	10000597          	auipc	a1,0x10000
     118:	05458593          	addi	a1,a1,84 # 10000168 <skip.1899>
     11c:	00008617          	auipc	a2,0x8
     120:	ef060613          	addi	a2,a2,-272 # 800c <_fdata_rom>

00000124 <data_loop>:
     124:	00b50c63          	beq	a0,a1,13c <bss_init>
     128:	00062683          	lw	a3,0(a2)
     12c:	00d52023          	sw	a3,0(a0)
     130:	00450513          	addi	a0,a0,4
     134:	00460613          	addi	a2,a2,4
     138:	fedff06f          	j	124 <data_loop>

0000013c <bss_init>:
     13c:	10000517          	auipc	a0,0x10000
     140:	02c50513          	addi	a0,a0,44 # 10000168 <skip.1899>
     144:	10000597          	auipc	a1,0x10000
     148:	37c58593          	addi	a1,a1,892 # 100004c0 <_ebss>

0000014c <bss_loop>:
     14c:	00b50863          	beq	a0,a1,15c <bss_done>
     150:	00052023          	sw	zero,0(a0)
     154:	00450513          	addi	a0,a0,4
     158:	ff5ff06f          	j	14c <bss_loop>

0000015c <bss_done>:
     15c:	04c040ef          	jal	ra,41a8 <plic_init>
     160:	000012b7          	lui	t0,0x1
     164:	80028293          	addi	t0,t0,-2048 # 800 <boot+0x18>
     168:	30429073          	csrw	mie,t0
     16c:	459010ef          	jal	ra,1dc4 <main>

00000170 <infinit_loop>:
     170:	0000006f          	j	170 <infinit_loop>

00000174 <boot_helper>:
     174:	10000717          	auipc	a4,0x10000
     178:	02a72423          	sw	a0,40(a4) # 1000019c <smp_lottery_args>
     17c:	10000717          	auipc	a4,0x10000
     180:	02b72223          	sw	a1,36(a4) # 100001a0 <smp_lottery_args+0x4>
     184:	10000717          	auipc	a4,0x10000
     188:	02c72023          	sw	a2,32(a4) # 100001a4 <smp_lottery_args+0x8>
     18c:	10000717          	auipc	a4,0x10000
     190:	00d72623          	sw	a3,12(a4) # 10000198 <smp_lottery_target>
     194:	0110000f          	fence	w,w
     198:	00100793          	li	a5,1
     19c:	10000717          	auipc	a4,0x10000
     1a0:	00f72623          	sw	a5,12(a4) # 100001a8 <smp_lottery_lock>
     1a4:	00068067          	jr	a3

000001a8 <copy_file_from_sdcard_to_ram>:
     1a8:	d9010113          	addi	sp,sp,-624
     1ac:	25312e23          	sw	s3,604(sp)
     1b0:	000069b7          	lui	s3,0x6
     1b4:	26912223          	sw	s1,612(sp)
     1b8:	27212023          	sw	s2,608(sp)
     1bc:	00050493          	mv	s1,a0
     1c0:	00058913          	mv	s2,a1
     1c4:	00100613          	li	a2,1
     1c8:	72c98593          	addi	a1,s3,1836 # 672c <str.2794+0x58>
     1cc:	02410513          	addi	a0,sp,36
     1d0:	26112623          	sw	ra,620(sp)
     1d4:	26812423          	sw	s0,616(sp)
     1d8:	25412c23          	sw	s4,600(sp)
     1dc:	288050ef          	jal	ra,5464 <f_mount>
     1e0:	02051e63          	bnez	a0,21c <copy_file_from_sdcard_to_ram+0x74>
     1e4:	00100613          	li	a2,1
     1e8:	00048593          	mv	a1,s1
     1ec:	00410513          	addi	a0,sp,4
     1f0:	2fc050ef          	jal	ra,54ec <f_open>
     1f4:	00050413          	mv	s0,a0
     1f8:	02050663          	beqz	a0,224 <copy_file_from_sdcard_to_ram+0x7c>
     1fc:	00006537          	lui	a0,0x6
     200:	00048593          	mv	a1,s1
     204:	4e850513          	addi	a0,a0,1256 # 64e8 <_frodata>
     208:	0c8020ef          	jal	ra,22d0 <printf>
     20c:	00000613          	li	a2,0
     210:	72c98593          	addi	a1,s3,1836
     214:	00000513          	li	a0,0
     218:	24c050ef          	jal	ra,5464 <f_mount>
     21c:	00000513          	li	a0,0
     220:	0ac0006f          	j	2cc <copy_file_from_sdcard_to_ram+0x124>
     224:	00098a13          	mv	s4,s3
     228:	01012983          	lw	s3,16(sp)
     22c:	00006537          	lui	a0,0x6
     230:	00090613          	mv	a2,s2
     234:	00098693          	mv	a3,s3
     238:	00048593          	mv	a1,s1
     23c:	4fc50513          	addi	a0,a0,1276 # 64fc <_frodata+0x14>
     240:	090020ef          	jal	ra,22d0 <printf>
     244:	00098513          	mv	a0,s3
     248:	34c030ef          	jal	ra,3594 <init_progression_bar>
     24c:	00010693          	mv	a3,sp
     250:	00008637          	lui	a2,0x8
     254:	008905b3          	add	a1,s2,s0
     258:	00410513          	addi	a0,sp,4
     25c:	380050ef          	jal	ra,55dc <f_read>
     260:	02050263          	beqz	a0,284 <copy_file_from_sdcard_to_ram+0xdc>
     264:	00006537          	lui	a0,0x6
     268:	52450513          	addi	a0,a0,1316 # 6524 <_frodata+0x3c>
     26c:	064020ef          	jal	ra,22d0 <printf>
     270:	00410513          	addi	a0,sp,4
     274:	57c050ef          	jal	ra,57f0 <f_close>
     278:	00000613          	li	a2,0
     27c:	72ca0593          	addi	a1,s4,1836
     280:	f95ff06f          	j	214 <copy_file_from_sdcard_to_ram+0x6c>
     284:	00012783          	lw	a5,0(sp)
     288:	00078a63          	beqz	a5,29c <copy_file_from_sdcard_to_ram+0xf4>
     28c:	00f40433          	add	s0,s0,a5
     290:	00040513          	mv	a0,s0
     294:	1ec030ef          	jal	ra,3480 <show_progress>
     298:	fb5ff06f          	j	24c <copy_file_from_sdcard_to_ram+0xa4>
     29c:	00040513          	mv	a0,s0
     2a0:	1e0030ef          	jal	ra,3480 <show_progress>
     2a4:	00008537          	lui	a0,0x8
     2a8:	ab450513          	addi	a0,a0,-1356 # 7ab4 <crc_table+0x69c>
     2ac:	024020ef          	jal	ra,22d0 <printf>
     2b0:	00410513          	addi	a0,sp,4
     2b4:	53c050ef          	jal	ra,57f0 <f_close>
     2b8:	00000613          	li	a2,0
     2bc:	72ca0593          	addi	a1,s4,1836
     2c0:	00000513          	li	a0,0
     2c4:	1a0050ef          	jal	ra,5464 <f_mount>
     2c8:	00100513          	li	a0,1
     2cc:	26c12083          	lw	ra,620(sp)
     2d0:	26812403          	lw	s0,616(sp)
     2d4:	26412483          	lw	s1,612(sp)
     2d8:	26012903          	lw	s2,608(sp)
     2dc:	25c12983          	lw	s3,604(sp)
     2e0:	25812a03          	lw	s4,600(sp)
     2e4:	27010113          	addi	sp,sp,624
     2e8:	00008067          	ret

000002ec <jsmn_parse>:
     2ec:	00050793          	mv	a5,a0
     2f0:	00452503          	lw	a0,4(a0)
     2f4:	fd010113          	addi	sp,sp,-48
     2f8:	04001f37          	lui	t5,0x4001
     2fc:	01440fb7          	lui	t6,0x1440
     300:	008002b7          	lui	t0,0x800
     304:	02812623          	sw	s0,44(sp)
     308:	02912423          	sw	s1,40(sp)
     30c:	03212223          	sw	s2,36(sp)
     310:	03312023          	sw	s3,32(sp)
     314:	01412e23          	sw	s4,28(sp)
     318:	01512c23          	sw	s5,24(sp)
     31c:	01612a23          	sw	s6,20(sp)
     320:	01712823          	sw	s7,16(sp)
     324:	01812623          	sw	s8,12(sp)
     328:	01912423          	sw	s9,8(sp)
     32c:	01a12223          	sw	s10,4(sp)
     330:	01b12023          	sw	s11,0(sp)
     334:	03a00e93          	li	t4,58
     338:	05d00393          	li	t2,93
     33c:	01f00413          	li	s0,31
     340:	00100e13          	li	t3,1
     344:	001f0f13          	addi	t5,t5,1 # 4001001 <_edata_rom+0x3ff8e8d>
     348:	05e00493          	li	s1,94
     34c:	441f8f93          	addi	t6,t6,1089 # 1440441 <_edata_rom+0x14382cd>
     350:	00900913          	li	s2,9
     354:	00500993          	li	s3,5
     358:	01328293          	addi	t0,t0,19 # 800013 <_edata_rom+0x7f7e9f>
     35c:	0007a883          	lw	a7,0(a5)
     360:	00c8f863          	bgeu	a7,a2,370 <jsmn_parse+0x84>
     364:	01158833          	add	a6,a1,a7
     368:	00084803          	lbu	a6,0(a6)
     36c:	04081c63          	bnez	a6,3c4 <jsmn_parse+0xd8>
     370:	00068e63          	beqz	a3,38c <jsmn_parse+0xa0>
     374:	0047a783          	lw	a5,4(a5)
     378:	fff78713          	addi	a4,a5,-1
     37c:	00479793          	slli	a5,a5,0x4
     380:	00f686b3          	add	a3,a3,a5
     384:	fff00793          	li	a5,-1
     388:	42075863          	bgez	a4,7b8 <jsmn_parse+0x4cc>
     38c:	02c12403          	lw	s0,44(sp)
     390:	02812483          	lw	s1,40(sp)
     394:	02412903          	lw	s2,36(sp)
     398:	02012983          	lw	s3,32(sp)
     39c:	01c12a03          	lw	s4,28(sp)
     3a0:	01812a83          	lw	s5,24(sp)
     3a4:	01412b03          	lw	s6,20(sp)
     3a8:	01012b83          	lw	s7,16(sp)
     3ac:	00c12c03          	lw	s8,12(sp)
     3b0:	00812c83          	lw	s9,8(sp)
     3b4:	00412d03          	lw	s10,4(sp)
     3b8:	00012d83          	lw	s11,0(sp)
     3bc:	03010113          	addi	sp,sp,48
     3c0:	00008067          	ret
     3c4:	2fd80063          	beq	a6,t4,6a4 <jsmn_parse+0x3b8>
     3c8:	050eea63          	bltu	t4,a6,41c <jsmn_parse+0x130>
     3cc:	02200313          	li	t1,34
     3d0:	16680c63          	beq	a6,t1,548 <jsmn_parse+0x25c>
     3d4:	03036863          	bltu	t1,a6,404 <jsmn_parse+0x118>
     3d8:	ff780813          	addi	a6,a6,-9
     3dc:	0ff87813          	andi	a6,a6,255
     3e0:	01700313          	li	t1,23
     3e4:	03036463          	bltu	t1,a6,40c <jsmn_parse+0x120>
     3e8:	010e1833          	sll	a6,t3,a6
     3ec:	00587833          	and	a6,a6,t0
     3f0:	00080e63          	beqz	a6,40c <jsmn_parse+0x120>
     3f4:	0007a803          	lw	a6,0(a5)
     3f8:	00180813          	addi	a6,a6,1
     3fc:	0107a023          	sw	a6,0(a5)
     400:	f5dff06f          	j	35c <jsmn_parse+0x70>
     404:	02c00313          	li	t1,44
     408:	2a680463          	beq	a6,t1,6b0 <jsmn_parse+0x3c4>
     40c:	00a00a93          	li	s5,10
     410:	00d00b13          	li	s6,13
     414:	00800b93          	li	s7,8
     418:	3280006f          	j	740 <jsmn_parse+0x454>
     41c:	07b00313          	li	t1,123
     420:	04680c63          	beq	a6,t1,478 <jsmn_parse+0x18c>
     424:	01036e63          	bltu	t1,a6,440 <jsmn_parse+0x154>
     428:	05b00313          	li	t1,91
     42c:	04680663          	beq	a6,t1,478 <jsmn_parse+0x18c>
     430:	fc781ee3          	bne	a6,t2,40c <jsmn_parse+0x120>
     434:	00200b13          	li	s6,2
     438:	fa068ee3          	beqz	a3,3f4 <jsmn_parse+0x108>
     43c:	0140006f          	j	450 <jsmn_parse+0x164>
     440:	07d00313          	li	t1,125
     444:	fc6814e3          	bne	a6,t1,40c <jsmn_parse+0x120>
     448:	00100b13          	li	s6,1
     44c:	fa0684e3          	beqz	a3,3f4 <jsmn_parse+0x108>
     450:	0047a303          	lw	t1,4(a5)
     454:	fff00a13          	li	s4,-1
     458:	fff30813          	addi	a6,t1,-1
     45c:	00431313          	slli	t1,t1,0x4
     460:	00668333          	add	t1,a3,t1
     464:	06085e63          	bgez	a6,4e0 <jsmn_parse+0x1f4>
     468:	fff00893          	li	a7,-1
     46c:	f91814e3          	bne	a6,a7,3f4 <jsmn_parse+0x108>
     470:	ffe00513          	li	a0,-2
     474:	f19ff06f          	j	38c <jsmn_parse+0xa0>
     478:	00150513          	addi	a0,a0,1
     47c:	f6068ce3          	beqz	a3,3f4 <jsmn_parse+0x108>
     480:	0047aa83          	lw	s5,4(a5)
     484:	10eafa63          	bgeu	s5,a4,598 <jsmn_parse+0x2ac>
     488:	001a8313          	addi	t1,s5,1
     48c:	0067a223          	sw	t1,4(a5)
     490:	004a9a13          	slli	s4,s5,0x4
     494:	0087a303          	lw	t1,8(a5)
     498:	01468a33          	add	s4,a3,s4
     49c:	fff00b13          	li	s6,-1
     4a0:	016a2423          	sw	s6,8(s4)
     4a4:	000a2623          	sw	zero,12(s4)
     4a8:	01630c63          	beq	t1,s6,4c0 <jsmn_parse+0x1d4>
     4ac:	00431313          	slli	t1,t1,0x4
     4b0:	00668333          	add	t1,a3,t1
     4b4:	00c32b03          	lw	s6,12(t1)
     4b8:	001b0b13          	addi	s6,s6,1
     4bc:	01632623          	sw	s6,12(t1)
     4c0:	07b00b13          	li	s6,123
     4c4:	00100313          	li	t1,1
     4c8:	01680463          	beq	a6,s6,4d0 <jsmn_parse+0x1e4>
     4cc:	00200313          	li	t1,2
     4d0:	006a2023          	sw	t1,0(s4)
     4d4:	011a2223          	sw	a7,4(s4)
     4d8:	0157a423          	sw	s5,8(a5)
     4dc:	f19ff06f          	j	3f4 <jsmn_parse+0x108>
     4e0:	ff432b83          	lw	s7,-12(t1)
     4e4:	ff030a93          	addi	s5,t1,-16
     4e8:	054b8263          	beq	s7,s4,52c <jsmn_parse+0x240>
     4ec:	ff832303          	lw	t1,-8(t1)
     4f0:	03431e63          	bne	t1,s4,52c <jsmn_parse+0x240>
     4f4:	000aa303          	lw	t1,0(s5)
     4f8:	f7631ce3          	bne	t1,s6,470 <jsmn_parse+0x184>
     4fc:	00188893          	addi	a7,a7,1
     500:	0147a423          	sw	s4,8(a5)
     504:	011aa423          	sw	a7,8(s5)
     508:	00481893          	slli	a7,a6,0x4
     50c:	011688b3          	add	a7,a3,a7
     510:	fff00313          	li	t1,-1
     514:	0048aa03          	lw	s4,4(a7)
     518:	026a0063          	beq	s4,t1,538 <jsmn_parse+0x24c>
     51c:	0088aa03          	lw	s4,8(a7)
     520:	006a1c63          	bne	s4,t1,538 <jsmn_parse+0x24c>
     524:	0107a423          	sw	a6,8(a5)
     528:	ecdff06f          	j	3f4 <jsmn_parse+0x108>
     52c:	fff80813          	addi	a6,a6,-1
     530:	000a8313          	mv	t1,s5
     534:	f31ff06f          	j	464 <jsmn_parse+0x178>
     538:	fff80813          	addi	a6,a6,-1
     53c:	ff088893          	addi	a7,a7,-16
     540:	fc681ae3          	bne	a6,t1,514 <jsmn_parse+0x228>
     544:	eb1ff06f          	j	3f4 <jsmn_parse+0x108>
     548:	00188a13          	addi	s4,a7,1
     54c:	0147a023          	sw	s4,0(a5)
     550:	02200a93          	li	s5,34
     554:	05c00b13          	li	s6,92
     558:	07500b93          	li	s7,117
     55c:	05b00c13          	li	s8,91
     560:	02f00c93          	li	s9,47
     564:	0007a303          	lw	t1,0(a5)
     568:	00c37863          	bgeu	t1,a2,578 <jsmn_parse+0x28c>
     56c:	00658833          	add	a6,a1,t1
     570:	00084803          	lbu	a6,0(a6)
     574:	00081863          	bnez	a6,584 <jsmn_parse+0x298>
     578:	0117a023          	sw	a7,0(a5)
     57c:	ffd00513          	li	a0,-3
     580:	e0dff06f          	j	38c <jsmn_parse+0xa0>
     584:	07581663          	bne	a6,s5,5f0 <jsmn_parse+0x304>
     588:	02068e63          	beqz	a3,5c4 <jsmn_parse+0x2d8>
     58c:	0047a803          	lw	a6,4(a5)
     590:	00e86863          	bltu	a6,a4,5a0 <jsmn_parse+0x2b4>
     594:	0117a023          	sw	a7,0(a5)
     598:	fff00513          	li	a0,-1
     59c:	df1ff06f          	j	38c <jsmn_parse+0xa0>
     5a0:	00180893          	addi	a7,a6,1
     5a4:	00481813          	slli	a6,a6,0x4
     5a8:	0117a223          	sw	a7,4(a5)
     5ac:	01068833          	add	a6,a3,a6
     5b0:	00300893          	li	a7,3
     5b4:	01182023          	sw	a7,0(a6)
     5b8:	01482223          	sw	s4,4(a6)
     5bc:	00682423          	sw	t1,8(a6)
     5c0:	00082623          	sw	zero,12(a6)
     5c4:	0087a803          	lw	a6,8(a5)
     5c8:	fff00893          	li	a7,-1
     5cc:	00150513          	addi	a0,a0,1
     5d0:	e31802e3          	beq	a6,a7,3f4 <jsmn_parse+0x108>
     5d4:	e20680e3          	beqz	a3,3f4 <jsmn_parse+0x108>
     5d8:	00481813          	slli	a6,a6,0x4
     5dc:	01068833          	add	a6,a3,a6
     5e0:	00c82883          	lw	a7,12(a6)
     5e4:	00188893          	addi	a7,a7,1
     5e8:	01182623          	sw	a7,12(a6)
     5ec:	e09ff06f          	j	3f4 <jsmn_parse+0x108>
     5f0:	03681463          	bne	a6,s6,618 <jsmn_parse+0x32c>
     5f4:	00130813          	addi	a6,t1,1
     5f8:	02c87063          	bgeu	a6,a2,618 <jsmn_parse+0x32c>
     5fc:	0107a023          	sw	a6,0(a5)
     600:	01058833          	add	a6,a1,a6
     604:	00084803          	lbu	a6,0(a6)
     608:	070bea63          	bltu	s7,a6,67c <jsmn_parse+0x390>
     60c:	010c6e63          	bltu	s8,a6,628 <jsmn_parse+0x33c>
     610:	01580463          	beq	a6,s5,618 <jsmn_parse+0x32c>
     614:	07981463          	bne	a6,s9,67c <jsmn_parse+0x390>
     618:	0007a803          	lw	a6,0(a5)
     61c:	00180813          	addi	a6,a6,1
     620:	0107a023          	sw	a6,0(a5)
     624:	f41ff06f          	j	564 <jsmn_parse+0x278>
     628:	fa480813          	addi	a6,a6,-92
     62c:	010e1833          	sll	a6,t3,a6
     630:	01f87d33          	and	s10,a6,t6
     634:	fe0d12e3          	bnez	s10,618 <jsmn_parse+0x32c>
     638:	00681d13          	slli	s10,a6,0x6
     63c:	040d5063          	bgez	s10,67c <jsmn_parse+0x390>
     640:	00230313          	addi	t1,t1,2
     644:	0067a023          	sw	t1,0(a5)
     648:	00400d13          	li	s10,4
     64c:	0007a303          	lw	t1,0(a5)
     650:	04c37263          	bgeu	t1,a2,694 <jsmn_parse+0x3a8>
     654:	00658833          	add	a6,a1,t1
     658:	00084803          	lbu	a6,0(a6)
     65c:	02080c63          	beqz	a6,694 <jsmn_parse+0x3a8>
     660:	fd080d93          	addi	s11,a6,-48
     664:	0ffdfd93          	andi	s11,s11,255
     668:	01b97e63          	bgeu	s2,s11,684 <jsmn_parse+0x398>
     66c:	fdf87813          	andi	a6,a6,-33
     670:	fbf80813          	addi	a6,a6,-65
     674:	0ff87813          	andi	a6,a6,255
     678:	0109f663          	bgeu	s3,a6,684 <jsmn_parse+0x398>
     67c:	0117a023          	sw	a7,0(a5)
     680:	df1ff06f          	j	470 <jsmn_parse+0x184>
     684:	00130313          	addi	t1,t1,1
     688:	0067a023          	sw	t1,0(a5)
     68c:	fffd0d13          	addi	s10,s10,-1
     690:	fa0d1ee3          	bnez	s10,64c <jsmn_parse+0x360>
     694:	0007a803          	lw	a6,0(a5)
     698:	fff80813          	addi	a6,a6,-1
     69c:	0107a023          	sw	a6,0(a5)
     6a0:	f79ff06f          	j	618 <jsmn_parse+0x32c>
     6a4:	0047a803          	lw	a6,4(a5)
     6a8:	fff80813          	addi	a6,a6,-1
     6ac:	e79ff06f          	j	524 <jsmn_parse+0x238>
     6b0:	d40682e3          	beqz	a3,3f4 <jsmn_parse+0x108>
     6b4:	0087a803          	lw	a6,8(a5)
     6b8:	fff00893          	li	a7,-1
     6bc:	d3180ce3          	beq	a6,a7,3f4 <jsmn_parse+0x108>
     6c0:	00481813          	slli	a6,a6,0x4
     6c4:	01068833          	add	a6,a3,a6
     6c8:	00082803          	lw	a6,0(a6)
     6cc:	fff80813          	addi	a6,a6,-1
     6d0:	d30e72e3          	bgeu	t3,a6,3f4 <jsmn_parse+0x108>
     6d4:	0047a803          	lw	a6,4(a5)
     6d8:	fff00a13          	li	s4,-1
     6dc:	fff80893          	addi	a7,a6,-1
     6e0:	00481813          	slli	a6,a6,0x4
     6e4:	01068833          	add	a6,a3,a6
     6e8:	d008c6e3          	bltz	a7,3f4 <jsmn_parse+0x108>
     6ec:	ff082303          	lw	t1,-16(a6)
     6f0:	fff30313          	addi	t1,t1,-1
     6f4:	006e6e63          	bltu	t3,t1,710 <jsmn_parse+0x424>
     6f8:	ff482303          	lw	t1,-12(a6)
     6fc:	01430a63          	beq	t1,s4,710 <jsmn_parse+0x424>
     700:	ff882303          	lw	t1,-8(a6)
     704:	01431663          	bne	t1,s4,710 <jsmn_parse+0x424>
     708:	0117a423          	sw	a7,8(a5)
     70c:	ce9ff06f          	j	3f4 <jsmn_parse+0x108>
     710:	fff88893          	addi	a7,a7,-1
     714:	ff080813          	addi	a6,a6,-16
     718:	fd1ff06f          	j	6e8 <jsmn_parse+0x3fc>
     71c:	fe080a13          	addi	s4,a6,-32
     720:	014e1a33          	sll	s4,t3,s4
     724:	01ea7a33          	and	s4,s4,t5
     728:	020a1e63          	bnez	s4,764 <jsmn_parse+0x478>
     72c:	fe080813          	addi	a6,a6,-32
     730:	0ff87813          	andi	a6,a6,255
     734:	f504e4e3          	bltu	s1,a6,67c <jsmn_parse+0x390>
     738:	00130313          	addi	t1,t1,1
     73c:	0067a023          	sw	t1,0(a5)
     740:	0007a303          	lw	t1,0(a5)
     744:	02c37063          	bgeu	t1,a2,764 <jsmn_parse+0x478>
     748:	00658833          	add	a6,a1,t1
     74c:	00084803          	lbu	a6,0(a6)
     750:	00080a63          	beqz	a6,764 <jsmn_parse+0x478>
     754:	030ee463          	bltu	t4,a6,77c <jsmn_parse+0x490>
     758:	fd0462e3          	bltu	s0,a6,71c <jsmn_parse+0x430>
     75c:	010aec63          	bltu	s5,a6,774 <jsmn_parse+0x488>
     760:	fd0bf6e3          	bgeu	s7,a6,72c <jsmn_parse+0x440>
     764:	02069263          	bnez	a3,788 <jsmn_parse+0x49c>
     768:	fff30313          	addi	t1,t1,-1
     76c:	0067a023          	sw	t1,0(a5)
     770:	e55ff06f          	j	5c4 <jsmn_parse+0x2d8>
     774:	fb681ce3          	bne	a6,s6,72c <jsmn_parse+0x440>
     778:	fedff06f          	j	764 <jsmn_parse+0x478>
     77c:	0df87a13          	andi	s4,a6,223
     780:	fa7a16e3          	bne	s4,t2,72c <jsmn_parse+0x440>
     784:	fe1ff06f          	j	764 <jsmn_parse+0x478>
     788:	0047a803          	lw	a6,4(a5)
     78c:	e0e874e3          	bgeu	a6,a4,594 <jsmn_parse+0x2a8>
     790:	00180a13          	addi	s4,a6,1
     794:	00481813          	slli	a6,a6,0x4
     798:	0147a223          	sw	s4,4(a5)
     79c:	01068833          	add	a6,a3,a6
     7a0:	00400a13          	li	s4,4
     7a4:	01482023          	sw	s4,0(a6)
     7a8:	01182223          	sw	a7,4(a6)
     7ac:	00682423          	sw	t1,8(a6)
     7b0:	00082623          	sw	zero,12(a6)
     7b4:	fb5ff06f          	j	768 <jsmn_parse+0x47c>
     7b8:	ff46a603          	lw	a2,-12(a3)
     7bc:	00f60663          	beq	a2,a5,7c8 <jsmn_parse+0x4dc>
     7c0:	ff86a603          	lw	a2,-8(a3)
     7c4:	daf60ce3          	beq	a2,a5,57c <jsmn_parse+0x290>
     7c8:	fff70713          	addi	a4,a4,-1
     7cc:	ff068693          	addi	a3,a3,-16
     7d0:	bb9ff06f          	j	388 <jsmn_parse+0x9c>

000007d4 <jsmn_init>:
     7d4:	fff00793          	li	a5,-1
     7d8:	00052023          	sw	zero,0(a0)
     7dc:	00052223          	sw	zero,4(a0)
     7e0:	00f52423          	sw	a5,8(a0)
     7e4:	00008067          	ret

000007e8 <boot>:
     7e8:	fe010113          	addi	sp,sp,-32
     7ec:	00812c23          	sw	s0,24(sp)
     7f0:	00050413          	mv	s0,a0
     7f4:	00006537          	lui	a0,0x6
     7f8:	00912a23          	sw	s1,20(sp)
     7fc:	53850513          	addi	a0,a0,1336 # 6538 <_frodata+0x50>
     800:	00058493          	mv	s1,a1
     804:	00068593          	mv	a1,a3
     808:	00112e23          	sw	ra,28(sp)
     80c:	00c12623          	sw	a2,12(sp)
     810:	00d12423          	sw	a3,8(sp)
     814:	2bd010ef          	jal	ra,22d0 <printf>
     818:	00006537          	lui	a0,0x6
     81c:	56050513          	addi	a0,a0,1376 # 6560 <_frodata+0x78>
     820:	2b1010ef          	jal	ra,22d0 <printf>
     824:	101030ef          	jal	ra,4124 <uart_sync>
     828:	f0c027b7          	lui	a5,0xf0c02
     82c:	0007a023          	sw	zero,0(a5) # f0c02000 <_fstack+0xe0c01000>
     830:	30047073          	csrci	mstatus,8
     834:	0000100f          	fence.i
     838:	00000013          	nop
     83c:	00000013          	nop
     840:	00000013          	nop
     844:	00000013          	nop
     848:	00000013          	nop
     84c:	0000500f          	0x500f
     850:	39d020ef          	jal	ra,33ec <flush_l2_cache>
     854:	00812683          	lw	a3,8(sp)
     858:	00c12603          	lw	a2,12(sp)
     85c:	00048593          	mv	a1,s1
     860:	00040513          	mv	a0,s0
     864:	911ff0ef          	jal	ra,174 <boot_helper>
     868:	0000006f          	j	868 <boot+0x80>

0000086c <sdcardboot_from_json.constprop.0>:
     86c:	81010113          	addi	sp,sp,-2032
     870:	7d312e23          	sw	s3,2012(sp)
     874:	7e112623          	sw	ra,2028(sp)
     878:	7e812423          	sw	s0,2024(sp)
     87c:	7e912223          	sw	s1,2020(sp)
     880:	7f212023          	sw	s2,2016(sp)
     884:	7d412c23          	sw	s4,2008(sp)
     888:	7d512a23          	sw	s5,2004(sp)
     88c:	7d612823          	sw	s6,2000(sp)
     890:	7d712623          	sw	s7,1996(sp)
     894:	7d812423          	sw	s8,1992(sp)
     898:	7d912223          	sw	s9,1988(sp)
     89c:	7da12023          	sw	s10,1984(sp)
     8a0:	7bb12e23          	sw	s11,1980(sp)
     8a4:	000069b7          	lui	s3,0x6
     8a8:	f0010113          	addi	sp,sp,-256
     8ac:	00100613          	li	a2,1
     8b0:	72c98593          	addi	a1,s3,1836 # 672c <str.2794+0x58>
     8b4:	28410513          	addi	a0,sp,644
     8b8:	3ad040ef          	jal	ra,5464 <f_mount>
     8bc:	04051e63          	bnez	a0,918 <sdcardboot_from_json.constprop.0+0xac>
     8c0:	000017b7          	lui	a5,0x1
     8c4:	01010713          	addi	a4,sp,16
     8c8:	fffff437          	lui	s0,0xfffff
     8cc:	8a078793          	addi	a5,a5,-1888 # 8a0 <sdcardboot_from_json.constprop.0+0x34>
     8d0:	00e787b3          	add	a5,a5,a4
     8d4:	77440913          	addi	s2,s0,1908 # fffff774 <_fstack+0xefffe774>
     8d8:	01278933          	add	s2,a5,s2
     8dc:	00006a37          	lui	s4,0x6
     8e0:	00100613          	li	a2,1
     8e4:	594a0593          	addi	a1,s4,1428 # 6594 <_frodata+0xac>
     8e8:	00090513          	mv	a0,s2
     8ec:	401040ef          	jal	ra,54ec <f_open>
     8f0:	00050493          	mv	s1,a0
     8f4:	06050263          	beqz	a0,958 <sdcardboot_from_json.constprop.0+0xec>
     8f8:	00006537          	lui	a0,0x6
     8fc:	594a0593          	addi	a1,s4,1428
     900:	4e850513          	addi	a0,a0,1256 # 64e8 <_frodata>
     904:	1cd010ef          	jal	ra,22d0 <printf>
     908:	00000613          	li	a2,0
     90c:	72c98593          	addi	a1,s3,1836
     910:	00000513          	li	a0,0
     914:	351040ef          	jal	ra,5464 <f_mount>
     918:	10010113          	addi	sp,sp,256
     91c:	7ec12083          	lw	ra,2028(sp)
     920:	7e812403          	lw	s0,2024(sp)
     924:	7e412483          	lw	s1,2020(sp)
     928:	7e012903          	lw	s2,2016(sp)
     92c:	7dc12983          	lw	s3,2012(sp)
     930:	7d812a03          	lw	s4,2008(sp)
     934:	7d412a83          	lw	s5,2004(sp)
     938:	7d012b03          	lw	s6,2000(sp)
     93c:	7cc12b83          	lw	s7,1996(sp)
     940:	7c812c03          	lw	s8,1992(sp)
     944:	7c412c83          	lw	s9,1988(sp)
     948:	7c012d03          	lw	s10,1984(sp)
     94c:	7bc12d83          	lw	s11,1980(sp)
     950:	7f010113          	addi	sp,sp,2032
     954:	00008067          	ret
     958:	00001a37          	lui	s4,0x1
     95c:	01010713          	addi	a4,sp,16
     960:	8a0a0793          	addi	a5,s4,-1888 # 8a0 <sdcardboot_from_json.constprop.0+0x34>
     964:	00e787b3          	add	a5,a5,a4
     968:	76440693          	addi	a3,s0,1892
     96c:	00d786b3          	add	a3,a5,a3
     970:	40000613          	li	a2,1024
     974:	4b010593          	addi	a1,sp,1200
     978:	00090513          	mv	a0,s2
     97c:	461040ef          	jal	ra,55dc <f_read>
     980:	00090513          	mv	a0,s2
     984:	66d040ef          	jal	ra,57f0 <f_close>
     988:	72c98593          	addi	a1,s3,1836
     98c:	00000613          	li	a2,0
     990:	00000513          	li	a0,0
     994:	2d1040ef          	jal	ra,5464 <f_mount>
     998:	fff00793          	li	a5,-1
     99c:	4b010513          	addi	a0,sp,1200
     9a0:	02f12023          	sw	a5,32(sp)
     9a4:	00012c23          	sw	zero,24(sp)
     9a8:	00012e23          	sw	zero,28(sp)
     9ac:	6d4010ef          	jal	ra,2080 <strlen>
     9b0:	8a0a0793          	addi	a5,s4,-1888
     9b4:	01010593          	addi	a1,sp,16
     9b8:	00b787b3          	add	a5,a5,a1
     9bc:	7d440693          	addi	a3,s0,2004
     9c0:	00d786b3          	add	a3,a5,a3
     9c4:	00050613          	mv	a2,a0
     9c8:	8a0a0793          	addi	a5,s4,-1888
     9cc:	01010513          	addi	a0,sp,16
     9d0:	00a787b3          	add	a5,a5,a0
     9d4:	76840413          	addi	s0,s0,1896
     9d8:	00878533          	add	a0,a5,s0
     9dc:	02000713          	li	a4,32
     9e0:	4b010593          	addi	a1,sp,1200
     9e4:	909ff0ef          	jal	ra,2ec <jsmn_parse>
     9e8:	0ff57513          	andi	a0,a0,255
     9ec:	000a0913          	mv	s2,s4
     9f0:	fff50793          	addi	a5,a0,-1
     9f4:	00f12623          	sw	a5,12(sp)
     9f8:	00090793          	mv	a5,s2
     9fc:	fffffcb7          	lui	s9,0xfffff
     a00:	8a090713          	addi	a4,s2,-1888
     a04:	01010693          	addi	a3,sp,16
     a08:	8a078793          	addi	a5,a5,-1888
     a0c:	794c8413          	addi	s0,s9,1940 # fffff794 <_fstack+0xefffe794>
     a10:	00d70733          	add	a4,a4,a3
     a14:	7b4c8913          	addi	s2,s9,1972
     a18:	00d787b3          	add	a5,a5,a3
     a1c:	00000b13          	li	s6,0
     a20:	00000a93          	li	s5,0
     a24:	00000a13          	li	s4,0
     a28:	00000c13          	li	s8,0
     a2c:	00000b93          	li	s7,0
     a30:	00000993          	li	s3,0
     a34:	00870433          	add	s0,a4,s0
     a38:	01278933          	add	s2,a5,s2
     a3c:	00006db7          	lui	s11,0x6
     a40:	00c12783          	lw	a5,12(sp)
     a44:	00f9ce63          	blt	s3,a5,a60 <sdcardboot_from_json.constprop.0+0x1f4>
     a48:	ec0b88e3          	beqz	s7,918 <sdcardboot_from_json.constprop.0+0xac>
     a4c:	00048693          	mv	a3,s1
     a50:	000b0613          	mv	a2,s6
     a54:	000a8593          	mv	a1,s5
     a58:	000a0513          	mv	a0,s4
     a5c:	d8dff0ef          	jal	ra,7e8 <boot>
     a60:	02000613          	li	a2,32
     a64:	00000593          	li	a1,0
     a68:	00040513          	mv	a0,s0
     a6c:	5d8010ef          	jal	ra,2044 <memset>
     a70:	02000613          	li	a2,32
     a74:	00000593          	li	a1,0
     a78:	00090513          	mv	a0,s2
     a7c:	5c8010ef          	jal	ra,2044 <memset>
     a80:	00499793          	slli	a5,s3,0x4
     a84:	8b010713          	addi	a4,sp,-1872
     a88:	00f70d33          	add	s10,a4,a5
     a8c:	7d4d2683          	lw	a3,2004(s10)
     a90:	00300713          	li	a4,3
     a94:	00198993          	addi	s3,s3,1
     a98:	08e69c63          	bne	a3,a4,b30 <sdcardboot_from_json.constprop.0+0x2c4>
     a9c:	7e0d2683          	lw	a3,2016(s10)
     aa0:	00100713          	li	a4,1
     aa4:	08e69663          	bne	a3,a4,b30 <sdcardboot_from_json.constprop.0+0x2c4>
     aa8:	7d8d2583          	lw	a1,2008(s10)
     aac:	7dcd2603          	lw	a2,2012(s10)
     ab0:	4b010793          	addi	a5,sp,1200
     ab4:	00040513          	mv	a0,s0
     ab8:	40b60633          	sub	a2,a2,a1
     abc:	00b785b3          	add	a1,a5,a1
     ac0:	560010ef          	jal	ra,2020 <memcpy>
     ac4:	8b010793          	addi	a5,sp,-1872
     ac8:	00499713          	slli	a4,s3,0x4
     acc:	00e78733          	add	a4,a5,a4
     ad0:	7d872583          	lw	a1,2008(a4)
     ad4:	7dc72603          	lw	a2,2012(a4)
     ad8:	4b010793          	addi	a5,sp,1200
     adc:	00090513          	mv	a0,s2
     ae0:	40b60633          	sub	a2,a2,a1
     ae4:	00b785b3          	add	a1,a5,a1
     ae8:	538010ef          	jal	ra,2020 <memcpy>
     aec:	000067b7          	lui	a5,0x6
     af0:	00800613          	li	a2,8
     af4:	5a078593          	addi	a1,a5,1440 # 65a0 <_frodata+0xb8>
     af8:	00040513          	mv	a0,s0
     afc:	688010ef          	jal	ra,2184 <strncmp>
     b00:	02050863          	beqz	a0,b30 <sdcardboot_from_json.constprop.0+0x2c4>
     b04:	00400613          	li	a2,4
     b08:	5acd8593          	addi	a1,s11,1452 # 65ac <_frodata+0xc4>
     b0c:	00040513          	mv	a0,s0
     b10:	674010ef          	jal	ra,2184 <strncmp>
     b14:	02051263          	bnez	a0,b38 <sdcardboot_from_json.constprop.0+0x2cc>
     b18:	00000613          	li	a2,0
     b1c:	00000593          	li	a1,0
     b20:	00090513          	mv	a0,s2
     b24:	071010ef          	jal	ra,2394 <strtoul>
     b28:	00050493          	mv	s1,a0
     b2c:	00100c13          	li	s8,1
     b30:	0ff9f993          	andi	s3,s3,255
     b34:	f0dff06f          	j	a40 <sdcardboot_from_json.constprop.0+0x1d4>
     b38:	000065b7          	lui	a1,0x6
     b3c:	00200613          	li	a2,2
     b40:	5b458593          	addi	a1,a1,1460 # 65b4 <_frodata+0xcc>
     b44:	00040513          	mv	a0,s0
     b48:	63c010ef          	jal	ra,2184 <strncmp>
     b4c:	02051c63          	bnez	a0,b84 <sdcardboot_from_json.constprop.0+0x318>
     b50:	7d8d2583          	lw	a1,2008(s10)
     b54:	7dcd2603          	lw	a2,2012(s10)
     b58:	4b010793          	addi	a5,sp,1200
     b5c:	00040513          	mv	a0,s0
     b60:	40b60633          	sub	a2,a2,a1
     b64:	00b785b3          	add	a1,a5,a1
     b68:	4b8010ef          	jal	ra,2020 <memcpy>
     b6c:	00000613          	li	a2,0
     b70:	00000593          	li	a1,0
     b74:	00090513          	mv	a0,s2
     b78:	01d010ef          	jal	ra,2394 <strtoul>
     b7c:	00050a13          	mv	s4,a0
     b80:	fb1ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>
     b84:	000065b7          	lui	a1,0x6
     b88:	00200613          	li	a2,2
     b8c:	5b858593          	addi	a1,a1,1464 # 65b8 <_frodata+0xd0>
     b90:	00040513          	mv	a0,s0
     b94:	5f0010ef          	jal	ra,2184 <strncmp>
     b98:	00051e63          	bnez	a0,bb4 <sdcardboot_from_json.constprop.0+0x348>
     b9c:	00000613          	li	a2,0
     ba0:	00000593          	li	a1,0
     ba4:	00090513          	mv	a0,s2
     ba8:	7ec010ef          	jal	ra,2394 <strtoul>
     bac:	00050a93          	mv	s5,a0
     bb0:	f81ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>
     bb4:	000065b7          	lui	a1,0x6
     bb8:	00200613          	li	a2,2
     bbc:	5bc58593          	addi	a1,a1,1468 # 65bc <_frodata+0xd4>
     bc0:	00040513          	mv	a0,s0
     bc4:	5c0010ef          	jal	ra,2184 <strncmp>
     bc8:	00000613          	li	a2,0
     bcc:	00000593          	li	a1,0
     bd0:	00051a63          	bnez	a0,be4 <sdcardboot_from_json.constprop.0+0x378>
     bd4:	00090513          	mv	a0,s2
     bd8:	7bc010ef          	jal	ra,2394 <strtoul>
     bdc:	00050b13          	mv	s6,a0
     be0:	f51ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>
     be4:	00090513          	mv	a0,s2
     be8:	7ac010ef          	jal	ra,2394 <strtoul>
     bec:	00050593          	mv	a1,a0
     bf0:	00040513          	mv	a0,s0
     bf4:	db4ff0ef          	jal	ra,1a8 <copy_file_from_sdcard_to_ram>
     bf8:	d20500e3          	beqz	a0,918 <sdcardboot_from_json.constprop.0+0xac>
     bfc:	000c0b93          	mv	s7,s8
     c00:	f20c18e3          	bnez	s8,b30 <sdcardboot_from_json.constprop.0+0x2c4>
     c04:	00000613          	li	a2,0
     c08:	00000593          	li	a1,0
     c0c:	00090513          	mv	a0,s2
     c10:	784010ef          	jal	ra,2394 <strtoul>
     c14:	00050493          	mv	s1,a0
     c18:	00100b93          	li	s7,1
     c1c:	f15ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>

00000c20 <serialboot>:
     c20:	00006537          	lui	a0,0x6
     c24:	ec010113          	addi	sp,sp,-320
     c28:	5c050513          	addi	a0,a0,1472 # 65c0 <_frodata+0xd8>
     c2c:	12112e23          	sw	ra,316(sp)
     c30:	12812c23          	sw	s0,312(sp)
     c34:	13212823          	sw	s2,304(sp)
     c38:	12912a23          	sw	s1,308(sp)
     c3c:	13312623          	sw	s3,300(sp)
     c40:	13412423          	sw	s4,296(sp)
     c44:	13512223          	sw	s5,292(sp)
     c48:	13612023          	sw	s6,288(sp)
     c4c:	11712e23          	sw	s7,284(sp)
     c50:	680010ef          	jal	ra,22d0 <printf>
     c54:	00006537          	lui	a0,0x6
     c58:	5d850513          	addi	a0,a0,1496 # 65d8 <_frodata+0xf0>
     c5c:	674010ef          	jal	ra,22d0 <printf>
     c60:	000067b7          	lui	a5,0x6
     c64:	6c478413          	addi	s0,a5,1732 # 66c4 <str.2807>
     c68:	6c478913          	addi	s2,a5,1732
     c6c:	00044503          	lbu	a0,0(s0)
     c70:	04051663          	bnez	a0,cbc <serialboot+0x9c>
     c74:	f00027b7          	lui	a5,0xf0002
     c78:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
     c7c:	8007a223          	sw	zero,-2044(a5)
     c80:	8007a023          	sw	zero,-2048(a5)
     c84:	00100713          	li	a4,1
     c88:	80e7a423          	sw	a4,-2040(a5)
     c8c:	80e7a623          	sw	a4,-2036(a5)
     c90:	00000413          	li	s0,0
     c94:	f00024b7          	lui	s1,0xf0002
     c98:	05100993          	li	s3,81
     c9c:	01b00a13          	li	s4,27
     ca0:	00e00a93          	li	s5,14
     ca4:	00100b13          	li	s6,1
     ca8:	8104a783          	lw	a5,-2032(s1) # f0001810 <_fstack+0xe0000810>
     cac:	00079e63          	bnez	a5,cc8 <serialboot+0xa8>
     cb0:	00006537          	lui	a0,0x6
     cb4:	62c50513          	addi	a0,a0,1580 # 662c <_frodata+0x144>
     cb8:	1440006f          	j	dfc <serialboot+0x1dc>
     cbc:	358030ef          	jal	ra,4014 <uart_write>
     cc0:	00140413          	addi	s0,s0,1
     cc4:	fa9ff06f          	j	c6c <serialboot+0x4c>
     cc8:	330030ef          	jal	ra,3ff8 <uart_read_nonblock>
     ccc:	08050a63          	beqz	a0,d60 <serialboot+0x140>
     cd0:	2d4030ef          	jal	ra,3fa4 <uart_read>
     cd4:	21350e63          	beq	a0,s3,ef0 <serialboot+0x2d0>
     cd8:	21450c63          	beq	a0,s4,ef0 <serialboot+0x2d0>
     cdc:	008907b3          	add	a5,s2,s0
     ce0:	0107c783          	lbu	a5,16(a5)
     ce4:	06a79a63          	bne	a5,a0,d58 <serialboot+0x138>
     ce8:	00140413          	addi	s0,s0,1
     cec:	07541a63          	bne	s0,s5,d60 <serialboot+0x140>
     cf0:	00000493          	li	s1,0
     cf4:	00100993          	li	s3,1
     cf8:	00200a93          	li	s5,2
     cfc:	00300a13          	li	s4,3
     d00:	f0002937          	lui	s2,0xf0002
     d04:	00100b13          	li	s6,1
     d08:	00200b93          	li	s7,2
     d0c:	00000413          	li	s0,0
     d10:	2e8030ef          	jal	ra,3ff8 <uart_read_nonblock>
     d14:	02050463          	beqz	a0,d3c <serialboot+0x11c>
     d18:	04041863          	bnez	s0,d68 <serialboot+0x148>
     d1c:	80092423          	sw	zero,-2040(s2) # f0001808 <_fstack+0xe0000808>
     d20:	80092223          	sw	zero,-2044(s2)
     d24:	80092023          	sw	zero,-2048(s2)
     d28:	81392423          	sw	s3,-2040(s2)
     d2c:	81392623          	sw	s3,-2036(s2)
     d30:	274030ef          	jal	ra,3fa4 <uart_read>
     d34:	00a10623          	sb	a0,12(sp)
     d38:	00140413          	addi	s0,s0,1
     d3c:	81392623          	sw	s3,-2036(s2)
     d40:	fc0408e3          	beqz	s0,d10 <serialboot+0xf0>
     d44:	81092783          	lw	a5,-2032(s2)
     d48:	fc0794e3          	bnez	a5,d10 <serialboot+0xf0>
     d4c:	04500513          	li	a0,69
     d50:	2c4030ef          	jal	ra,4014 <uart_write>
     d54:	fb9ff06f          	j	d0c <serialboot+0xec>
     d58:	f8650513          	addi	a0,a0,-122
     d5c:	00153413          	seqz	s0,a0
     d60:	8164a623          	sw	s6,-2036(s1)
     d64:	f45ff06f          	j	ca8 <serialboot+0x88>
     d68:	01340a63          	beq	s0,s3,d7c <serialboot+0x15c>
     d6c:	01541e63          	bne	s0,s5,d88 <serialboot+0x168>
     d70:	234030ef          	jal	ra,3fa4 <uart_read>
     d74:	00a10723          	sb	a0,14(sp)
     d78:	fc1ff06f          	j	d38 <serialboot+0x118>
     d7c:	228030ef          	jal	ra,3fa4 <uart_read>
     d80:	00a106a3          	sb	a0,13(sp)
     d84:	fb5ff06f          	j	d38 <serialboot+0x118>
     d88:	07440e63          	beq	s0,s4,e04 <serialboot+0x1e4>
     d8c:	fa8a56e3          	bge	s4,s0,d38 <serialboot+0x118>
     d90:	214030ef          	jal	ra,3fa4 <uart_read>
     d94:	00c14583          	lbu	a1,12(sp)
     d98:	11010793          	addi	a5,sp,272
     d9c:	008787b3          	add	a5,a5,s0
     da0:	eea78e23          	sb	a0,-260(a5)
     da4:	00358793          	addi	a5,a1,3
     da8:	f88798e3          	bne	a5,s0,d38 <serialboot+0x118>
     dac:	00e14783          	lbu	a5,14(sp)
     db0:	00d14703          	lbu	a4,13(sp)
     db4:	00158593          	addi	a1,a1,1
     db8:	00879793          	slli	a5,a5,0x8
     dbc:	00e7e7b3          	or	a5,a5,a4
     dc0:	00879413          	slli	s0,a5,0x8
     dc4:	0087d793          	srli	a5,a5,0x8
     dc8:	00f467b3          	or	a5,s0,a5
     dcc:	01079413          	slli	s0,a5,0x10
     dd0:	00f10513          	addi	a0,sp,15
     dd4:	01045413          	srli	s0,s0,0x10
     dd8:	444020ef          	jal	ra,321c <crc16>
     ddc:	02850a63          	beq	a0,s0,e10 <serialboot+0x1f0>
     de0:	04300513          	li	a0,67
     de4:	230030ef          	jal	ra,4014 <uart_write>
     de8:	00148493          	addi	s1,s1,1
     dec:	10000793          	li	a5,256
     df0:	f0f49ee3          	bne	s1,a5,d0c <serialboot+0xec>
     df4:	00006537          	lui	a0,0x6
     df8:	60450513          	addi	a0,a0,1540 # 6604 <_frodata+0x11c>
     dfc:	4d4010ef          	jal	ra,22d0 <printf>
     e00:	0280006f          	j	e28 <serialboot+0x208>
     e04:	1a0030ef          	jal	ra,3fa4 <uart_read>
     e08:	00a107a3          	sb	a0,15(sp)
     e0c:	f2dff06f          	j	d38 <serialboot+0x118>
     e10:	00f14783          	lbu	a5,15(sp)
     e14:	05678263          	beq	a5,s6,e58 <serialboot+0x238>
     e18:	09778463          	beq	a5,s7,ea0 <serialboot+0x280>
     e1c:	0c079263          	bnez	a5,ee0 <serialboot+0x2c0>
     e20:	04b00513          	li	a0,75
     e24:	1f0030ef          	jal	ra,4014 <uart_write>
     e28:	00100513          	li	a0,1
     e2c:	13c12083          	lw	ra,316(sp)
     e30:	13812403          	lw	s0,312(sp)
     e34:	13412483          	lw	s1,308(sp)
     e38:	13012903          	lw	s2,304(sp)
     e3c:	12c12983          	lw	s3,300(sp)
     e40:	12812a03          	lw	s4,296(sp)
     e44:	12412a83          	lw	s5,292(sp)
     e48:	12012b03          	lw	s6,288(sp)
     e4c:	11c12b83          	lw	s7,284(sp)
     e50:	14010113          	addi	sp,sp,320
     e54:	00008067          	ret
     e58:	01014783          	lbu	a5,16(sp)
     e5c:	01114503          	lbu	a0,17(sp)
     e60:	00c14603          	lbu	a2,12(sp)
     e64:	01879793          	slli	a5,a5,0x18
     e68:	01051513          	slli	a0,a0,0x10
     e6c:	00a7e7b3          	or	a5,a5,a0
     e70:	01314503          	lbu	a0,19(sp)
     e74:	ffc60613          	addi	a2,a2,-4 # 7ffc <__bios_cmd_boot>
     e78:	01410593          	addi	a1,sp,20
     e7c:	00a7e7b3          	or	a5,a5,a0
     e80:	01214503          	lbu	a0,18(sp)
     e84:	00000493          	li	s1,0
     e88:	00851513          	slli	a0,a0,0x8
     e8c:	00a7e533          	or	a0,a5,a0
     e90:	190010ef          	jal	ra,2020 <memcpy>
     e94:	04b00513          	li	a0,75
     e98:	17c030ef          	jal	ra,4014 <uart_write>
     e9c:	e71ff06f          	j	d0c <serialboot+0xec>
     ea0:	04b00513          	li	a0,75
     ea4:	170030ef          	jal	ra,4014 <uart_write>
     ea8:	01014783          	lbu	a5,16(sp)
     eac:	01114683          	lbu	a3,17(sp)
     eb0:	00000613          	li	a2,0
     eb4:	01879793          	slli	a5,a5,0x18
     eb8:	01069693          	slli	a3,a3,0x10
     ebc:	00d7e7b3          	or	a5,a5,a3
     ec0:	01314683          	lbu	a3,19(sp)
     ec4:	00000593          	li	a1,0
     ec8:	00000513          	li	a0,0
     ecc:	00d7e7b3          	or	a5,a5,a3
     ed0:	01214683          	lbu	a3,18(sp)
     ed4:	00869693          	slli	a3,a3,0x8
     ed8:	00d7e6b3          	or	a3,a5,a3
     edc:	90dff0ef          	jal	ra,7e8 <boot>
     ee0:	05500513          	li	a0,85
     ee4:	00148493          	addi	s1,s1,1
     ee8:	12c030ef          	jal	ra,4014 <uart_write>
     eec:	f01ff06f          	j	dec <serialboot+0x1cc>
     ef0:	00006537          	lui	a0,0x6
     ef4:	63850513          	addi	a0,a0,1592 # 6638 <_frodata+0x150>
     ef8:	3d8010ef          	jal	ra,22d0 <printf>
     efc:	00000513          	li	a0,0
     f00:	f2dff06f          	j	e2c <serialboot+0x20c>

00000f04 <sdcardboot>:
     f04:	00006537          	lui	a0,0x6
     f08:	ff010113          	addi	sp,sp,-16
     f0c:	64450513          	addi	a0,a0,1604 # 6644 <_frodata+0x15c>
     f10:	00112623          	sw	ra,12(sp)
     f14:	3bc010ef          	jal	ra,22d0 <printf>
     f18:	5b8050ef          	jal	ra,64d0 <fatfs_set_ops_spisdcard>
     f1c:	00006537          	lui	a0,0x6
     f20:	66850513          	addi	a0,a0,1640 # 6668 <_frodata+0x180>
     f24:	3ac010ef          	jal	ra,22d0 <printf>
     f28:	945ff0ef          	jal	ra,86c <sdcardboot_from_json.constprop.0>
     f2c:	00006537          	lui	a0,0x6
     f30:	68450513          	addi	a0,a0,1668 # 6684 <_frodata+0x19c>
     f34:	39c010ef          	jal	ra,22d0 <printf>
     f38:	00006537          	lui	a0,0x6
     f3c:	400005b7          	lui	a1,0x40000
     f40:	6a050513          	addi	a0,a0,1696 # 66a0 <_frodata+0x1b8>
     f44:	a64ff0ef          	jal	ra,1a8 <copy_file_from_sdcard_to_ram>
     f48:	00050c63          	beqz	a0,f60 <sdcardboot+0x5c>
     f4c:	400006b7          	lui	a3,0x40000
     f50:	00000613          	li	a2,0
     f54:	00000593          	li	a1,0
     f58:	00000513          	li	a0,0
     f5c:	88dff0ef          	jal	ra,7e8 <boot>
     f60:	00c12083          	lw	ra,12(sp)
     f64:	00006537          	lui	a0,0x6
     f68:	6ac50513          	addi	a0,a0,1708 # 66ac <_frodata+0x1c4>
     f6c:	01010113          	addi	sp,sp,16
     f70:	3600106f          	j	22d0 <printf>

00000f74 <dump_bytes>:
     f74:	fc010113          	addi	sp,sp,-64
     f78:	000087b7          	lui	a5,0x8
     f7c:	02912a23          	sw	s1,52(sp)
     f80:	00058493          	mv	s1,a1
     f84:	fb87a583          	lw	a1,-72(a5) # 7fb8 <stdout>
     f88:	03212823          	sw	s2,48(sp)
     f8c:	00050913          	mv	s2,a0
     f90:	00006537          	lui	a0,0x6
     f94:	6e450513          	addi	a0,a0,1764 # 66e4 <str.2794+0x10>
     f98:	03312623          	sw	s3,44(sp)
     f9c:	03412423          	sw	s4,40(sp)
     fa0:	03512223          	sw	s5,36(sp)
     fa4:	03612023          	sw	s6,32(sp)
     fa8:	01712e23          	sw	s7,28(sp)
     fac:	02112e23          	sw	ra,60(sp)
     fb0:	02812c23          	sw	s0,56(sp)
     fb4:	01812c23          	sw	s8,24(sp)
     fb8:	01912a23          	sw	s9,20(sp)
     fbc:	00060993          	mv	s3,a2
     fc0:	00006ab7          	lui	s5,0x6
     fc4:	29c010ef          	jal	ra,2260 <fputs>
     fc8:	00008a37          	lui	s4,0x8
     fcc:	00006b37          	lui	s6,0x6
     fd0:	00006bb7          	lui	s7,0x6
     fd4:	04904063          	bgtz	s1,1014 <dump_bytes+0xa0>
     fd8:	03812403          	lw	s0,56(sp)
     fdc:	03c12083          	lw	ra,60(sp)
     fe0:	03412483          	lw	s1,52(sp)
     fe4:	03012903          	lw	s2,48(sp)
     fe8:	02c12983          	lw	s3,44(sp)
     fec:	02812a03          	lw	s4,40(sp)
     ff0:	02412a83          	lw	s5,36(sp)
     ff4:	02012b03          	lw	s6,32(sp)
     ff8:	01c12b83          	lw	s7,28(sp)
     ffc:	01812c03          	lw	s8,24(sp)
    1000:	01412c83          	lw	s9,20(sp)
    1004:	00008537          	lui	a0,0x8
    1008:	ab450513          	addi	a0,a0,-1356 # 7ab4 <crc_table+0x69c>
    100c:	04010113          	addi	sp,sp,64
    1010:	2c00106f          	j	22d0 <printf>
    1014:	01000793          	li	a5,16
    1018:	00048413          	mv	s0,s1
    101c:	0097d463          	bge	a5,s1,1024 <dump_bytes+0xb0>
    1020:	01000413          	li	s0,16
    1024:	00000793          	li	a5,0
    1028:	00f906b3          	add	a3,s2,a5
    102c:	0006a683          	lw	a3,0(a3) # 40000000 <_fstack+0x2ffff000>
    1030:	00f10733          	add	a4,sp,a5
    1034:	00478793          	addi	a5,a5,4
    1038:	00d72023          	sw	a3,0(a4)
    103c:	fe87c6e3          	blt	a5,s0,1028 <dump_bytes+0xb4>
    1040:	fff40793          	addi	a5,s0,-1
    1044:	ffc7f793          	andi	a5,a5,-4
    1048:	00006537          	lui	a0,0x6
    104c:	00478793          	addi	a5,a5,4
    1050:	00098593          	mv	a1,s3
    1054:	6f450513          	addi	a0,a0,1780 # 66f4 <str.2794+0x20>
    1058:	00f90933          	add	s2,s2,a5
    105c:	00000c13          	li	s8,0
    1060:	270010ef          	jal	ra,22d0 <printf>
    1064:	00006cb7          	lui	s9,0x6
    1068:	018107b3          	add	a5,sp,s8
    106c:	0007c583          	lbu	a1,0(a5)
    1070:	700c8513          	addi	a0,s9,1792 # 6700 <str.2794+0x2c>
    1074:	001c0c13          	addi	s8,s8,1
    1078:	258010ef          	jal	ra,22d0 <printf>
    107c:	ff8416e3          	bne	s0,s8,1068 <dump_bytes+0xf4>
    1080:	00040c13          	mv	s8,s0
    1084:	01000c93          	li	s9,16
    1088:	059c1863          	bne	s8,s9,10d8 <dump_bytes+0x164>
    108c:	860a0513          	addi	a0,s4,-1952 # 7860 <crc_table+0x448>
    1090:	240010ef          	jal	ra,22d0 <printf>
    1094:	00000c13          	li	s8,0
    1098:	05e00c93          	li	s9,94
    109c:	018107b3          	add	a5,sp,s8
    10a0:	0007c583          	lbu	a1,0(a5)
    10a4:	fe058793          	addi	a5,a1,-32 # 3fffffe0 <_fstack+0x2fffefe0>
    10a8:	0ff7f793          	andi	a5,a5,255
    10ac:	02fcfe63          	bgeu	s9,a5,10e8 <dump_bytes+0x174>
    10b0:	70cb8513          	addi	a0,s7,1804 # 670c <str.2794+0x38>
    10b4:	21c010ef          	jal	ra,22d0 <printf>
    10b8:	001c0c13          	addi	s8,s8,1
    10bc:	ff8410e3          	bne	s0,s8,109c <dump_bytes+0x128>
    10c0:	00040c13          	mv	s8,s0
    10c4:	01000c93          	li	s9,16
    10c8:	039c1663          	bne	s8,s9,10f4 <dump_bytes+0x180>
    10cc:	408484b3          	sub	s1,s1,s0
    10d0:	008989b3          	add	s3,s3,s0
    10d4:	f01ff06f          	j	fd4 <dump_bytes+0x60>
    10d8:	708a8513          	addi	a0,s5,1800 # 6708 <str.2794+0x34>
    10dc:	1f4010ef          	jal	ra,22d0 <printf>
    10e0:	001c0c13          	addi	s8,s8,1
    10e4:	fa5ff06f          	j	1088 <dump_bytes+0x114>
    10e8:	710b0513          	addi	a0,s6,1808 # 6710 <str.2794+0x3c>
    10ec:	1e4010ef          	jal	ra,22d0 <printf>
    10f0:	fc9ff06f          	j	10b8 <dump_bytes+0x144>
    10f4:	860a0513          	addi	a0,s4,-1952
    10f8:	1d8010ef          	jal	ra,22d0 <printf>
    10fc:	001c0c13          	addi	s8,s8,1
    1100:	fc9ff06f          	j	10c8 <dump_bytes+0x154>

00001104 <crcbios>:
    1104:	ff010113          	addi	sp,sp,-16
    1108:	000085b7          	lui	a1,0x8
    110c:	00812423          	sw	s0,8(sp)
    1110:	00000793          	li	a5,0
    1114:	1745a403          	lw	s0,372(a1) # 8174 <_edata_rom>
    1118:	17458593          	addi	a1,a1,372
    111c:	40f585b3          	sub	a1,a1,a5
    1120:	00000513          	li	a0,0
    1124:	00112623          	sw	ra,12(sp)
    1128:	144020ef          	jal	ra,326c <crc32>
    112c:	02a41063          	bne	s0,a0,114c <crcbios+0x48>
    1130:	00040593          	mv	a1,s0
    1134:	00812403          	lw	s0,8(sp)
    1138:	00c12083          	lw	ra,12(sp)
    113c:	00006537          	lui	a0,0x6
    1140:	71450513          	addi	a0,a0,1812 # 6714 <str.2794+0x40>
    1144:	01010113          	addi	sp,sp,16
    1148:	1880106f          	j	22d0 <printf>
    114c:	00050613          	mv	a2,a0
    1150:	00006537          	lui	a0,0x6
    1154:	00040593          	mv	a1,s0
    1158:	73050513          	addi	a0,a0,1840 # 6730 <str.2794+0x5c>
    115c:	174010ef          	jal	ra,22d0 <printf>
    1160:	00812403          	lw	s0,8(sp)
    1164:	00c12083          	lw	ra,12(sp)
    1168:	00006537          	lui	a0,0x6
    116c:	75c50513          	addi	a0,a0,1884 # 675c <str.2794+0x88>
    1170:	01010113          	addi	sp,sp,16
    1174:	15c0106f          	j	22d0 <printf>

00001178 <get_param>:
    1178:	00060793          	mv	a5,a2
    117c:	02060713          	addi	a4,a2,32
    1180:	0007a023          	sw	zero,0(a5)
    1184:	00478793          	addi	a5,a5,4
    1188:	fee79ce3          	bne	a5,a4,1180 <get_param+0x8>
    118c:	00a5a023          	sw	a0,0(a1)
    1190:	02000713          	li	a4,32
    1194:	00054783          	lbu	a5,0(a0)
    1198:	04e78e63          	beq	a5,a4,11f4 <get_param+0x7c>
    119c:	00079663          	bnez	a5,11a8 <get_param+0x30>
    11a0:	00000513          	li	a0,0
    11a4:	00008067          	ret
    11a8:	00150513          	addi	a0,a0,1
    11ac:	fe9ff06f          	j	1194 <get_param+0x1c>
    11b0:	00178793          	addi	a5,a5,1
    11b4:	02c0006f          	j	11e0 <get_param+0x68>
    11b8:	00078023          	sb	zero,0(a5)
    11bc:	00068513          	mv	a0,a3
    11c0:	00178793          	addi	a5,a5,1
    11c4:	0007c683          	lbu	a3,0(a5)
    11c8:	fee68ce3          	beq	a3,a4,11c0 <get_param+0x48>
    11cc:	02068e63          	beqz	a3,1208 <get_param+0x90>
    11d0:	00150693          	addi	a3,a0,1
    11d4:	00251513          	slli	a0,a0,0x2
    11d8:	00a60533          	add	a0,a2,a0
    11dc:	00f52023          	sw	a5,0(a0)
    11e0:	0007c583          	lbu	a1,0(a5)
    11e4:	fce58ae3          	beq	a1,a4,11b8 <get_param+0x40>
    11e8:	fc0594e3          	bnez	a1,11b0 <get_param+0x38>
    11ec:	00068513          	mv	a0,a3
    11f0:	00008067          	ret
    11f4:	00150793          	addi	a5,a0,1
    11f8:	00050023          	sb	zero,0(a0)
    11fc:	02000713          	li	a4,32
    1200:	00000513          	li	a0,0
    1204:	fc1ff06f          	j	11c4 <get_param+0x4c>
    1208:	00008067          	ret

0000120c <command_dispatcher>:
    120c:	fe010113          	addi	sp,sp,-32
    1210:	00812c23          	sw	s0,24(sp)
    1214:	00912a23          	sw	s1,20(sp)
    1218:	00008437          	lui	s0,0x8
    121c:	000084b7          	lui	s1,0x8
    1220:	01212823          	sw	s2,16(sp)
    1224:	01312623          	sw	s3,12(sp)
    1228:	01412423          	sw	s4,8(sp)
    122c:	00112e23          	sw	ra,28(sp)
    1230:	00050913          	mv	s2,a0
    1234:	00058993          	mv	s3,a1
    1238:	00060a13          	mv	s4,a2
    123c:	fbc40413          	addi	s0,s0,-68 # 7fbc <__bios_cmd_leds>
    1240:	00c48493          	addi	s1,s1,12 # 800c <_fdata_rom>
    1244:	00941663          	bne	s0,s1,1250 <command_dispatcher+0x44>
    1248:	00000513          	li	a0,0
    124c:	0300006f          	j	127c <command_dispatcher+0x70>
    1250:	00042783          	lw	a5,0(s0)
    1254:	00090513          	mv	a0,s2
    1258:	0047a583          	lw	a1,4(a5)
    125c:	605000ef          	jal	ra,2060 <strcmp>
    1260:	02051e63          	bnez	a0,129c <command_dispatcher+0x90>
    1264:	00042783          	lw	a5,0(s0)
    1268:	00098513          	mv	a0,s3
    126c:	000a0593          	mv	a1,s4
    1270:	0007a783          	lw	a5,0(a5)
    1274:	000780e7          	jalr	a5
    1278:	00042503          	lw	a0,0(s0)
    127c:	01c12083          	lw	ra,28(sp)
    1280:	01812403          	lw	s0,24(sp)
    1284:	01412483          	lw	s1,20(sp)
    1288:	01012903          	lw	s2,16(sp)
    128c:	00c12983          	lw	s3,12(sp)
    1290:	00812a03          	lw	s4,8(sp)
    1294:	02010113          	addi	sp,sp,32
    1298:	00008067          	ret
    129c:	00440413          	addi	s0,s0,4
    12a0:	fa5ff06f          	j	1244 <command_dispatcher+0x38>

000012a4 <init_dispatcher>:
    12a4:	ff010113          	addi	sp,sp,-16
    12a8:	00812423          	sw	s0,8(sp)
    12ac:	00912223          	sw	s1,4(sp)
    12b0:	00008437          	lui	s0,0x8
    12b4:	000084b7          	lui	s1,0x8
    12b8:	00112623          	sw	ra,12(sp)
    12bc:	00c40413          	addi	s0,s0,12 # 800c <_fdata_rom>
    12c0:	00c48493          	addi	s1,s1,12 # 800c <_fdata_rom>
    12c4:	00941c63          	bne	s0,s1,12dc <init_dispatcher+0x38>
    12c8:	00c12083          	lw	ra,12(sp)
    12cc:	00812403          	lw	s0,8(sp)
    12d0:	00412483          	lw	s1,4(sp)
    12d4:	01010113          	addi	sp,sp,16
    12d8:	00008067          	ret
    12dc:	00042783          	lw	a5,0(s0)
    12e0:	00440413          	addi	s0,s0,4
    12e4:	000780e7          	jalr	a5
    12e8:	fddff06f          	j	12c4 <init_dispatcher+0x20>

000012ec <flush_cpu_dcache>:
    12ec:	0000500f          	0x500f
    12f0:	00008067          	ret

000012f4 <help_handler>:
    12f4:	fe010113          	addi	sp,sp,-32
    12f8:	00006537          	lui	a0,0x6
    12fc:	01212823          	sw	s2,16(sp)
    1300:	01312623          	sw	s3,12(sp)
    1304:	79450513          	addi	a0,a0,1940 # 6794 <str.2794+0xc0>
    1308:	00008937          	lui	s2,0x8
    130c:	000069b7          	lui	s3,0x6
    1310:	00912a23          	sw	s1,20(sp)
    1314:	01412423          	sw	s4,8(sp)
    1318:	01512223          	sw	s5,4(sp)
    131c:	01612023          	sw	s6,0(sp)
    1320:	00112e23          	sw	ra,28(sp)
    1324:	00812c23          	sw	s0,24(sp)
    1328:	00000493          	li	s1,0
    132c:	7ed000ef          	jal	ra,2318 <puts>
    1330:	00008a37          	lui	s4,0x8
    1334:	00c90913          	addi	s2,s2,12 # 800c <_fdata_rom>
    1338:	00006ab7          	lui	s5,0x6
    133c:	79098993          	addi	s3,s3,1936 # 6790 <str.2794+0xbc>
    1340:	00008b37          	lui	s6,0x8
    1344:	00000713          	li	a4,0
    1348:	fbca0413          	addi	s0,s4,-68 # 7fbc <__bios_cmd_leds>
    134c:	0300006f          	j	137c <help_handler+0x88>
    1350:	00042783          	lw	a5,0(s0)
    1354:	00c7a683          	lw	a3,12(a5)
    1358:	02969063          	bne	a3,s1,1378 <help_handler+0x84>
    135c:	0087a603          	lw	a2,8(a5)
    1360:	0047a583          	lw	a1,4(a5)
    1364:	00061463          	bnez	a2,136c <help_handler+0x78>
    1368:	00098613          	mv	a2,s3
    136c:	7b8a8513          	addi	a0,s5,1976 # 67b8 <str.2794+0xe4>
    1370:	761000ef          	jal	ra,22d0 <printf>
    1374:	00100713          	li	a4,1
    1378:	00440413          	addi	s0,s0,4
    137c:	fd241ae3          	bne	s0,s2,1350 <help_handler+0x5c>
    1380:	00070663          	beqz	a4,138c <help_handler+0x98>
    1384:	ab4b0513          	addi	a0,s6,-1356 # 7ab4 <crc_table+0x69c>
    1388:	749000ef          	jal	ra,22d0 <printf>
    138c:	00148493          	addi	s1,s1,1
    1390:	00900793          	li	a5,9
    1394:	faf498e3          	bne	s1,a5,1344 <help_handler+0x50>
    1398:	01c12083          	lw	ra,28(sp)
    139c:	01812403          	lw	s0,24(sp)
    13a0:	01412483          	lw	s1,20(sp)
    13a4:	01012903          	lw	s2,16(sp)
    13a8:	00c12983          	lw	s3,12(sp)
    13ac:	00812a03          	lw	s4,8(sp)
    13b0:	00412a83          	lw	s5,4(sp)
    13b4:	00012b03          	lw	s6,0(sp)
    13b8:	02010113          	addi	sp,sp,32
    13bc:	00008067          	ret

000013c0 <ident_handler>:
    13c0:	ef010113          	addi	sp,sp,-272
    13c4:	f00017b7          	lui	a5,0xf0001
    13c8:	00010693          	mv	a3,sp
    13cc:	80078713          	addi	a4,a5,-2048 # f0000800 <_fstack+0xdffff800>
    13d0:	10112623          	sw	ra,268(sp)
    13d4:	00068593          	mv	a1,a3
    13d8:	c0078793          	addi	a5,a5,-1024
    13dc:	00072603          	lw	a2,0(a4)
    13e0:	00470713          	addi	a4,a4,4
    13e4:	00168693          	addi	a3,a3,1
    13e8:	fec68fa3          	sb	a2,-1(a3)
    13ec:	fef718e3          	bne	a4,a5,13dc <ident_handler+0x1c>
    13f0:	00014783          	lbu	a5,0(sp)
    13f4:	00079663          	bnez	a5,1400 <ident_handler+0x40>
    13f8:	000065b7          	lui	a1,0x6
    13fc:	79058593          	addi	a1,a1,1936 # 6790 <str.2794+0xbc>
    1400:	00006537          	lui	a0,0x6
    1404:	7c450513          	addi	a0,a0,1988 # 67c4 <str.2794+0xf0>
    1408:	6c9000ef          	jal	ra,22d0 <printf>
    140c:	10c12083          	lw	ra,268(sp)
    1410:	11010113          	addi	sp,sp,272
    1414:	00008067          	ret

00001418 <leds_handler>:
    1418:	fe010113          	addi	sp,sp,-32
    141c:	00112e23          	sw	ra,28(sp)
    1420:	00812c23          	sw	s0,24(sp)
    1424:	02a04063          	bgtz	a0,1444 <leds_handler+0x2c>
    1428:	00006537          	lui	a0,0x6
    142c:	7d050513          	addi	a0,a0,2000 # 67d0 <str.2794+0xfc>
    1430:	6a1000ef          	jal	ra,22d0 <printf>
    1434:	01c12083          	lw	ra,28(sp)
    1438:	01812403          	lw	s0,24(sp)
    143c:	02010113          	addi	sp,sp,32
    1440:	00008067          	ret
    1444:	00058793          	mv	a5,a1
    1448:	0007a503          	lw	a0,0(a5)
    144c:	00000613          	li	a2,0
    1450:	00c10593          	addi	a1,sp,12
    1454:	741000ef          	jal	ra,2394 <strtoul>
    1458:	00c12783          	lw	a5,12(sp)
    145c:	00050413          	mv	s0,a0
    1460:	0007c783          	lbu	a5,0(a5)
    1464:	00078863          	beqz	a5,1474 <leds_handler+0x5c>
    1468:	00006537          	lui	a0,0x6
    146c:	7e050513          	addi	a0,a0,2016 # 67e0 <str.2794+0x10c>
    1470:	fc1ff06f          	j	1430 <leds_handler+0x18>
    1474:	00050593          	mv	a1,a0
    1478:	00006537          	lui	a0,0x6
    147c:	7f050513          	addi	a0,a0,2032 # 67f0 <str.2794+0x11c>
    1480:	651000ef          	jal	ra,22d0 <printf>
    1484:	f00027b7          	lui	a5,0xf0002
    1488:	0087a023          	sw	s0,0(a5) # f0002000 <_fstack+0xe0001000>
    148c:	fa9ff06f          	j	1434 <leds_handler+0x1c>

00001490 <crc_handler>:
    1490:	fd010113          	addi	sp,sp,-48
    1494:	02112623          	sw	ra,44(sp)
    1498:	02812423          	sw	s0,40(sp)
    149c:	02912223          	sw	s1,36(sp)
    14a0:	00100793          	li	a5,1
    14a4:	02a7c263          	blt	a5,a0,14c8 <crc_handler+0x38>
    14a8:	00007537          	lui	a0,0x7
    14ac:	80850513          	addi	a0,a0,-2040 # 6808 <str.2794+0x134>
    14b0:	621000ef          	jal	ra,22d0 <printf>
    14b4:	02c12083          	lw	ra,44(sp)
    14b8:	02812403          	lw	s0,40(sp)
    14bc:	02412483          	lw	s1,36(sp)
    14c0:	03010113          	addi	sp,sp,48
    14c4:	00008067          	ret
    14c8:	00058413          	mv	s0,a1
    14cc:	00042503          	lw	a0,0(s0)
    14d0:	00000613          	li	a2,0
    14d4:	01c10593          	addi	a1,sp,28
    14d8:	6bd000ef          	jal	ra,2394 <strtoul>
    14dc:	01c12783          	lw	a5,28(sp)
    14e0:	00050493          	mv	s1,a0
    14e4:	0007c783          	lbu	a5,0(a5)
    14e8:	00078863          	beqz	a5,14f8 <crc_handler+0x68>
    14ec:	00007537          	lui	a0,0x7
    14f0:	82050513          	addi	a0,a0,-2016 # 6820 <str.2794+0x14c>
    14f4:	fbdff06f          	j	14b0 <crc_handler+0x20>
    14f8:	00442503          	lw	a0,4(s0)
    14fc:	00000613          	li	a2,0
    1500:	01c10593          	addi	a1,sp,28
    1504:	691000ef          	jal	ra,2394 <strtoul>
    1508:	01c12783          	lw	a5,28(sp)
    150c:	0007c783          	lbu	a5,0(a5)
    1510:	00078863          	beqz	a5,1520 <crc_handler+0x90>
    1514:	00007537          	lui	a0,0x7
    1518:	83450513          	addi	a0,a0,-1996 # 6834 <str.2794+0x160>
    151c:	f95ff06f          	j	14b0 <crc_handler+0x20>
    1520:	00a12623          	sw	a0,12(sp)
    1524:	dc9ff0ef          	jal	ra,12ec <flush_cpu_dcache>
    1528:	6c5010ef          	jal	ra,33ec <flush_l2_cache>
    152c:	00c12583          	lw	a1,12(sp)
    1530:	00048513          	mv	a0,s1
    1534:	539010ef          	jal	ra,326c <crc32>
    1538:	00050593          	mv	a1,a0
    153c:	00007537          	lui	a0,0x7
    1540:	84850513          	addi	a0,a0,-1976 # 6848 <str.2794+0x174>
    1544:	58d000ef          	jal	ra,22d0 <printf>
    1548:	f6dff06f          	j	14b4 <crc_handler+0x24>

0000154c <mem_list_handler>:
    154c:	00007537          	lui	a0,0x7
    1550:	ff010113          	addi	sp,sp,-16
    1554:	92850513          	addi	a0,a0,-1752 # 6928 <str.2794+0x254>
    1558:	00112623          	sw	ra,12(sp)
    155c:	575000ef          	jal	ra,22d0 <printf>
    1560:	00c12083          	lw	ra,12(sp)
    1564:	00007537          	lui	a0,0x7
    1568:	94450513          	addi	a0,a0,-1724 # 6944 <str.2794+0x270>
    156c:	01010113          	addi	sp,sp,16
    1570:	5a90006f          	j	2318 <puts>

00001574 <mem_write_handler>:
    1574:	fd010113          	addi	sp,sp,-48
    1578:	02112623          	sw	ra,44(sp)
    157c:	02812423          	sw	s0,40(sp)
    1580:	02912223          	sw	s1,36(sp)
    1584:	03212023          	sw	s2,32(sp)
    1588:	01312e23          	sw	s3,28(sp)
    158c:	01412c23          	sw	s4,24(sp)
    1590:	00100793          	li	a5,1
    1594:	02a7c863          	blt	a5,a0,15c4 <mem_write_handler+0x50>
    1598:	00007537          	lui	a0,0x7
    159c:	a1850513          	addi	a0,a0,-1512 # 6a18 <str.2794+0x344>
    15a0:	531000ef          	jal	ra,22d0 <printf>
    15a4:	02c12083          	lw	ra,44(sp)
    15a8:	02812403          	lw	s0,40(sp)
    15ac:	02412483          	lw	s1,36(sp)
    15b0:	02012903          	lw	s2,32(sp)
    15b4:	01c12983          	lw	s3,28(sp)
    15b8:	01812a03          	lw	s4,24(sp)
    15bc:	03010113          	addi	sp,sp,48
    15c0:	00008067          	ret
    15c4:	00058493          	mv	s1,a1
    15c8:	00050993          	mv	s3,a0
    15cc:	0004a503          	lw	a0,0(s1)
    15d0:	00000613          	li	a2,0
    15d4:	00c10593          	addi	a1,sp,12
    15d8:	5bd000ef          	jal	ra,2394 <strtoul>
    15dc:	00c12783          	lw	a5,12(sp)
    15e0:	00050413          	mv	s0,a0
    15e4:	0007c783          	lbu	a5,0(a5)
    15e8:	00078863          	beqz	a5,15f8 <mem_write_handler+0x84>
    15ec:	00007537          	lui	a0,0x7
    15f0:	82050513          	addi	a0,a0,-2016 # 6820 <str.2794+0x14c>
    15f4:	fadff06f          	j	15a0 <mem_write_handler+0x2c>
    15f8:	0044a503          	lw	a0,4(s1)
    15fc:	00000613          	li	a2,0
    1600:	00c10593          	addi	a1,sp,12
    1604:	591000ef          	jal	ra,2394 <strtoul>
    1608:	00c12783          	lw	a5,12(sp)
    160c:	00050913          	mv	s2,a0
    1610:	0007c783          	lbu	a5,0(a5)
    1614:	00078863          	beqz	a5,1624 <mem_write_handler+0xb0>
    1618:	00006537          	lui	a0,0x6
    161c:	7e050513          	addi	a0,a0,2016 # 67e0 <str.2794+0x10c>
    1620:	f81ff06f          	j	15a0 <mem_write_handler+0x2c>
    1624:	00200793          	li	a5,2
    1628:	08f98063          	beq	s3,a5,16a8 <mem_write_handler+0x134>
    162c:	0084a503          	lw	a0,8(s1)
    1630:	00000613          	li	a2,0
    1634:	00c10593          	addi	a1,sp,12
    1638:	55d000ef          	jal	ra,2394 <strtoul>
    163c:	00c12783          	lw	a5,12(sp)
    1640:	00050a13          	mv	s4,a0
    1644:	0007c783          	lbu	a5,0(a5)
    1648:	00078863          	beqz	a5,1658 <mem_write_handler+0xe4>
    164c:	00007537          	lui	a0,0x7
    1650:	a4450513          	addi	a0,a0,-1468 # 6a44 <str.2794+0x370>
    1654:	f4dff06f          	j	15a0 <mem_write_handler+0x2c>
    1658:	00400713          	li	a4,4
    165c:	00e99c63          	bne	s3,a4,1674 <mem_write_handler+0x100>
    1660:	00c4a503          	lw	a0,12(s1)
    1664:	00000613          	li	a2,0
    1668:	00c10593          	addi	a1,sp,12
    166c:	529000ef          	jal	ra,2394 <strtoul>
    1670:	00050713          	mv	a4,a0
    1674:	00040793          	mv	a5,s0
    1678:	00000693          	li	a3,0
    167c:	00200613          	li	a2,2
    1680:	00400593          	li	a1,4
    1684:	00100513          	li	a0,1
    1688:	f1468ee3          	beq	a3,s4,15a4 <mem_write_handler+0x30>
    168c:	02c70463          	beq	a4,a2,16b4 <mem_write_handler+0x140>
    1690:	02b70863          	beq	a4,a1,16c0 <mem_write_handler+0x14c>
    1694:	02a71c63          	bne	a4,a0,16cc <mem_write_handler+0x158>
    1698:	01278023          	sb	s2,0(a5)
    169c:	00178793          	addi	a5,a5,1
    16a0:	00168693          	addi	a3,a3,1
    16a4:	fe5ff06f          	j	1688 <mem_write_handler+0x114>
    16a8:	00100a13          	li	s4,1
    16ac:	00400713          	li	a4,4
    16b0:	fc5ff06f          	j	1674 <mem_write_handler+0x100>
    16b4:	01279023          	sh	s2,0(a5)
    16b8:	00278793          	addi	a5,a5,2
    16bc:	fe5ff06f          	j	16a0 <mem_write_handler+0x12c>
    16c0:	0127a023          	sw	s2,0(a5)
    16c4:	00478793          	addi	a5,a5,4
    16c8:	fd9ff06f          	j	16a0 <mem_write_handler+0x12c>
    16cc:	00007537          	lui	a0,0x7
    16d0:	a5450513          	addi	a0,a0,-1452 # 6a54 <str.2794+0x380>
    16d4:	ecdff06f          	j	15a0 <mem_write_handler+0x2c>

000016d8 <mem_copy_handler>:
    16d8:	fd010113          	addi	sp,sp,-48
    16dc:	02112623          	sw	ra,44(sp)
    16e0:	02812423          	sw	s0,40(sp)
    16e4:	02912223          	sw	s1,36(sp)
    16e8:	03212023          	sw	s2,32(sp)
    16ec:	01312e23          	sw	s3,28(sp)
    16f0:	00100793          	li	a5,1
    16f4:	02a7c663          	blt	a5,a0,1720 <mem_copy_handler+0x48>
    16f8:	00007537          	lui	a0,0x7
    16fc:	a6450513          	addi	a0,a0,-1436 # 6a64 <str.2794+0x390>
    1700:	3d1000ef          	jal	ra,22d0 <printf>
    1704:	02c12083          	lw	ra,44(sp)
    1708:	02812403          	lw	s0,40(sp)
    170c:	02412483          	lw	s1,36(sp)
    1710:	02012903          	lw	s2,32(sp)
    1714:	01c12983          	lw	s3,28(sp)
    1718:	03010113          	addi	sp,sp,48
    171c:	00008067          	ret
    1720:	00058413          	mv	s0,a1
    1724:	00050493          	mv	s1,a0
    1728:	00042503          	lw	a0,0(s0)
    172c:	00000613          	li	a2,0
    1730:	00c10593          	addi	a1,sp,12
    1734:	461000ef          	jal	ra,2394 <strtoul>
    1738:	00c12783          	lw	a5,12(sp)
    173c:	00050993          	mv	s3,a0
    1740:	0007c783          	lbu	a5,0(a5)
    1744:	00078863          	beqz	a5,1754 <mem_copy_handler+0x7c>
    1748:	00007537          	lui	a0,0x7
    174c:	a8450513          	addi	a0,a0,-1404 # 6a84 <str.2794+0x3b0>
    1750:	fb1ff06f          	j	1700 <mem_copy_handler+0x28>
    1754:	00442503          	lw	a0,4(s0)
    1758:	00000613          	li	a2,0
    175c:	00c10593          	addi	a1,sp,12
    1760:	435000ef          	jal	ra,2394 <strtoul>
    1764:	00c12783          	lw	a5,12(sp)
    1768:	00050913          	mv	s2,a0
    176c:	0007c783          	lbu	a5,0(a5)
    1770:	00078863          	beqz	a5,1780 <mem_copy_handler+0xa8>
    1774:	00007537          	lui	a0,0x7
    1778:	aa450513          	addi	a0,a0,-1372 # 6aa4 <str.2794+0x3d0>
    177c:	f85ff06f          	j	1700 <mem_copy_handler+0x28>
    1780:	00200793          	li	a5,2
    1784:	00100713          	li	a4,1
    1788:	02f48863          	beq	s1,a5,17b8 <mem_copy_handler+0xe0>
    178c:	00842503          	lw	a0,8(s0)
    1790:	00000613          	li	a2,0
    1794:	00c10593          	addi	a1,sp,12
    1798:	3fd000ef          	jal	ra,2394 <strtoul>
    179c:	00c12783          	lw	a5,12(sp)
    17a0:	00050713          	mv	a4,a0
    17a4:	0007c783          	lbu	a5,0(a5)
    17a8:	00078863          	beqz	a5,17b8 <mem_copy_handler+0xe0>
    17ac:	00007537          	lui	a0,0x7
    17b0:	a4450513          	addi	a0,a0,-1468 # 6a44 <str.2794+0x370>
    17b4:	f4dff06f          	j	1700 <mem_copy_handler+0x28>
    17b8:	00000793          	li	a5,0
    17bc:	00279693          	slli	a3,a5,0x2
    17c0:	00d98633          	add	a2,s3,a3
    17c4:	00d906b3          	add	a3,s2,a3
    17c8:	f2f70ee3          	beq	a4,a5,1704 <mem_copy_handler+0x2c>
    17cc:	0006a683          	lw	a3,0(a3)
    17d0:	00178793          	addi	a5,a5,1
    17d4:	00d62023          	sw	a3,0(a2)
    17d8:	fe5ff06f          	j	17bc <mem_copy_handler+0xe4>

000017dc <mem_cmp_handler>:
    17dc:	fd010113          	addi	sp,sp,-48
    17e0:	02112623          	sw	ra,44(sp)
    17e4:	02812423          	sw	s0,40(sp)
    17e8:	02912223          	sw	s1,36(sp)
    17ec:	03212023          	sw	s2,32(sp)
    17f0:	01312e23          	sw	s3,28(sp)
    17f4:	01412c23          	sw	s4,24(sp)
    17f8:	00200793          	li	a5,2
    17fc:	02a7c863          	blt	a5,a0,182c <mem_cmp_handler+0x50>
    1800:	00007537          	lui	a0,0x7
    1804:	ac050513          	addi	a0,a0,-1344 # 6ac0 <str.2794+0x3ec>
    1808:	2c9000ef          	jal	ra,22d0 <printf>
    180c:	02c12083          	lw	ra,44(sp)
    1810:	02812403          	lw	s0,40(sp)
    1814:	02412483          	lw	s1,36(sp)
    1818:	02012903          	lw	s2,32(sp)
    181c:	01c12983          	lw	s3,28(sp)
    1820:	01812a03          	lw	s4,24(sp)
    1824:	03010113          	addi	sp,sp,48
    1828:	00008067          	ret
    182c:	00058913          	mv	s2,a1
    1830:	00092503          	lw	a0,0(s2)
    1834:	00000613          	li	a2,0
    1838:	00c10593          	addi	a1,sp,12
    183c:	359000ef          	jal	ra,2394 <strtoul>
    1840:	00c12783          	lw	a5,12(sp)
    1844:	00050413          	mv	s0,a0
    1848:	0007c783          	lbu	a5,0(a5)
    184c:	00078863          	beqz	a5,185c <mem_cmp_handler+0x80>
    1850:	00007537          	lui	a0,0x7
    1854:	ae050513          	addi	a0,a0,-1312 # 6ae0 <str.2794+0x40c>
    1858:	fb1ff06f          	j	1808 <mem_cmp_handler+0x2c>
    185c:	00492503          	lw	a0,4(s2)
    1860:	00000613          	li	a2,0
    1864:	00c10593          	addi	a1,sp,12
    1868:	32d000ef          	jal	ra,2394 <strtoul>
    186c:	00c12783          	lw	a5,12(sp)
    1870:	00050493          	mv	s1,a0
    1874:	0007c783          	lbu	a5,0(a5)
    1878:	00078863          	beqz	a5,1888 <mem_cmp_handler+0xac>
    187c:	00007537          	lui	a0,0x7
    1880:	af050513          	addi	a0,a0,-1296 # 6af0 <str.2794+0x41c>
    1884:	f85ff06f          	j	1808 <mem_cmp_handler+0x2c>
    1888:	00892503          	lw	a0,8(s2)
    188c:	00000613          	li	a2,0
    1890:	00c10593          	addi	a1,sp,12
    1894:	301000ef          	jal	ra,2394 <strtoul>
    1898:	00c12783          	lw	a5,12(sp)
    189c:	00050913          	mv	s2,a0
    18a0:	0007c783          	lbu	a5,0(a5)
    18a4:	04078863          	beqz	a5,18f4 <mem_cmp_handler+0x118>
    18a8:	00007537          	lui	a0,0x7
    18ac:	a4450513          	addi	a0,a0,-1468 # 6a44 <str.2794+0x370>
    18b0:	f59ff06f          	j	1808 <mem_cmp_handler+0x2c>
    18b4:	00042603          	lw	a2,0(s0)
    18b8:	0004a703          	lw	a4,0(s1)
    18bc:	00e60c63          	beq	a2,a4,18d4 <mem_cmp_handler+0xf8>
    18c0:	00048693          	mv	a3,s1
    18c4:	00040593          	mv	a1,s0
    18c8:	b00a0513          	addi	a0,s4,-1280
    18cc:	205000ef          	jal	ra,22d0 <printf>
    18d0:	00000793          	li	a5,0
    18d4:	00198993          	addi	s3,s3,1
    18d8:	00440413          	addi	s0,s0,4
    18dc:	00448493          	addi	s1,s1,4
    18e0:	fd299ae3          	bne	s3,s2,18b4 <mem_cmp_handler+0xd8>
    18e4:	02078063          	beqz	a5,1904 <mem_cmp_handler+0x128>
    18e8:	00007537          	lui	a0,0x7
    18ec:	b5c50513          	addi	a0,a0,-1188 # 6b5c <str.2794+0x488>
    18f0:	f19ff06f          	j	1808 <mem_cmp_handler+0x2c>
    18f4:	00100793          	li	a5,1
    18f8:	00000993          	li	s3,0
    18fc:	00007a37          	lui	s4,0x7
    1900:	fe1ff06f          	j	18e0 <mem_cmp_handler+0x104>
    1904:	00007537          	lui	a0,0x7
    1908:	b7c50513          	addi	a0,a0,-1156 # 6b7c <str.2794+0x4a8>
    190c:	efdff06f          	j	1808 <mem_cmp_handler+0x2c>

00001910 <mem_read_handler>:
    1910:	fe010113          	addi	sp,sp,-32
    1914:	00112e23          	sw	ra,28(sp)
    1918:	00812c23          	sw	s0,24(sp)
    191c:	00912a23          	sw	s1,20(sp)
    1920:	01212823          	sw	s2,16(sp)
    1924:	02a04463          	bgtz	a0,194c <mem_read_handler+0x3c>
    1928:	00007537          	lui	a0,0x7
    192c:	ba450513          	addi	a0,a0,-1116 # 6ba4 <str.2794+0x4d0>
    1930:	1a1000ef          	jal	ra,22d0 <printf>
    1934:	01c12083          	lw	ra,28(sp)
    1938:	01812403          	lw	s0,24(sp)
    193c:	01412483          	lw	s1,20(sp)
    1940:	01012903          	lw	s2,16(sp)
    1944:	02010113          	addi	sp,sp,32
    1948:	00008067          	ret
    194c:	00058413          	mv	s0,a1
    1950:	00050493          	mv	s1,a0
    1954:	00042503          	lw	a0,0(s0)
    1958:	00000613          	li	a2,0
    195c:	00c10593          	addi	a1,sp,12
    1960:	235000ef          	jal	ra,2394 <strtoul>
    1964:	00c12783          	lw	a5,12(sp)
    1968:	00050913          	mv	s2,a0
    196c:	0007c783          	lbu	a5,0(a5)
    1970:	00078863          	beqz	a5,1980 <mem_read_handler+0x70>
    1974:	00007537          	lui	a0,0x7
    1978:	82050513          	addi	a0,a0,-2016 # 6820 <str.2794+0x14c>
    197c:	fb5ff06f          	j	1930 <mem_read_handler+0x20>
    1980:	00100793          	li	a5,1
    1984:	02f48863          	beq	s1,a5,19b4 <mem_read_handler+0xa4>
    1988:	00442503          	lw	a0,4(s0)
    198c:	00c10593          	addi	a1,sp,12
    1990:	00000613          	li	a2,0
    1994:	201000ef          	jal	ra,2394 <strtoul>
    1998:	00c12783          	lw	a5,12(sp)
    199c:	00050593          	mv	a1,a0
    19a0:	0007c783          	lbu	a5,0(a5)
    19a4:	00078a63          	beqz	a5,19b8 <mem_read_handler+0xa8>
    19a8:	00007537          	lui	a0,0x7
    19ac:	bc050513          	addi	a0,a0,-1088 # 6bc0 <str.2794+0x4ec>
    19b0:	f81ff06f          	j	1930 <mem_read_handler+0x20>
    19b4:	00400593          	li	a1,4
    19b8:	00090613          	mv	a2,s2
    19bc:	00090513          	mv	a0,s2
    19c0:	db4ff0ef          	jal	ra,f74 <dump_bytes>
    19c4:	f71ff06f          	j	1934 <mem_read_handler+0x24>

000019c8 <mem_test_handler>:
    19c8:	fe010113          	addi	sp,sp,-32
    19cc:	00112e23          	sw	ra,28(sp)
    19d0:	00812c23          	sw	s0,24(sp)
    19d4:	00912a23          	sw	s1,20(sp)
    19d8:	01212823          	sw	s2,16(sp)
    19dc:	02a04463          	bgtz	a0,1a04 <mem_test_handler+0x3c>
    19e0:	00007537          	lui	a0,0x7
    19e4:	bd450513          	addi	a0,a0,-1068 # 6bd4 <str.2794+0x500>
    19e8:	0e9000ef          	jal	ra,22d0 <printf>
    19ec:	01c12083          	lw	ra,28(sp)
    19f0:	01812403          	lw	s0,24(sp)
    19f4:	01412483          	lw	s1,20(sp)
    19f8:	01012903          	lw	s2,16(sp)
    19fc:	02010113          	addi	sp,sp,32
    1a00:	00008067          	ret
    1a04:	00058413          	mv	s0,a1
    1a08:	00050493          	mv	s1,a0
    1a0c:	00042503          	lw	a0,0(s0)
    1a10:	00000613          	li	a2,0
    1a14:	00c10593          	addi	a1,sp,12
    1a18:	17d000ef          	jal	ra,2394 <strtoul>
    1a1c:	00c12783          	lw	a5,12(sp)
    1a20:	00050913          	mv	s2,a0
    1a24:	0007c783          	lbu	a5,0(a5)
    1a28:	00078863          	beqz	a5,1a38 <mem_test_handler+0x70>
    1a2c:	00007537          	lui	a0,0x7
    1a30:	82050513          	addi	a0,a0,-2016 # 6820 <str.2794+0x14c>
    1a34:	fb5ff06f          	j	19e8 <mem_test_handler+0x20>
    1a38:	00100793          	li	a5,1
    1a3c:	02f48863          	beq	s1,a5,1a6c <mem_test_handler+0xa4>
    1a40:	00442503          	lw	a0,4(s0)
    1a44:	00c10593          	addi	a1,sp,12
    1a48:	00000613          	li	a2,0
    1a4c:	149000ef          	jal	ra,2394 <strtoul>
    1a50:	00c12783          	lw	a5,12(sp)
    1a54:	00050593          	mv	a1,a0
    1a58:	0007c783          	lbu	a5,0(a5)
    1a5c:	00078a63          	beqz	a5,1a70 <mem_test_handler+0xa8>
    1a60:	00007537          	lui	a0,0x7
    1a64:	a5450513          	addi	a0,a0,-1452 # 6a54 <str.2794+0x380>
    1a68:	f81ff06f          	j	19e8 <mem_test_handler+0x20>
    1a6c:	fff00593          	li	a1,-1
    1a70:	00090513          	mv	a0,s2
    1a74:	314020ef          	jal	ra,3d88 <memtest>
    1a78:	f75ff06f          	j	19ec <mem_test_handler+0x24>

00001a7c <mem_speed_handler>:
    1a7c:	fd010113          	addi	sp,sp,-48
    1a80:	02112623          	sw	ra,44(sp)
    1a84:	02812423          	sw	s0,40(sp)
    1a88:	02912223          	sw	s1,36(sp)
    1a8c:	03212023          	sw	s2,32(sp)
    1a90:	01312e23          	sw	s3,28(sp)
    1a94:	01412c23          	sw	s4,24(sp)
    1a98:	00100793          	li	a5,1
    1a9c:	02a7c863          	blt	a5,a0,1acc <mem_speed_handler+0x50>
    1aa0:	00007537          	lui	a0,0x7
    1aa4:	bf050513          	addi	a0,a0,-1040 # 6bf0 <str.2794+0x51c>
    1aa8:	029000ef          	jal	ra,22d0 <printf>
    1aac:	02c12083          	lw	ra,44(sp)
    1ab0:	02812403          	lw	s0,40(sp)
    1ab4:	02412483          	lw	s1,36(sp)
    1ab8:	02012903          	lw	s2,32(sp)
    1abc:	01c12983          	lw	s3,28(sp)
    1ac0:	01812a03          	lw	s4,24(sp)
    1ac4:	03010113          	addi	sp,sp,48
    1ac8:	00008067          	ret
    1acc:	00058413          	mv	s0,a1
    1ad0:	00050493          	mv	s1,a0
    1ad4:	00042503          	lw	a0,0(s0)
    1ad8:	00000613          	li	a2,0
    1adc:	00c10593          	addi	a1,sp,12
    1ae0:	0b5000ef          	jal	ra,2394 <strtoul>
    1ae4:	00c12783          	lw	a5,12(sp)
    1ae8:	00050993          	mv	s3,a0
    1aec:	0007c783          	lbu	a5,0(a5)
    1af0:	00078863          	beqz	a5,1b00 <mem_speed_handler+0x84>
    1af4:	00007537          	lui	a0,0x7
    1af8:	82050513          	addi	a0,a0,-2016 # 6820 <str.2794+0x14c>
    1afc:	fadff06f          	j	1aa8 <mem_speed_handler+0x2c>
    1b00:	00442503          	lw	a0,4(s0)
    1b04:	00000613          	li	a2,0
    1b08:	00c10593          	addi	a1,sp,12
    1b0c:	089000ef          	jal	ra,2394 <strtoul>
    1b10:	00c12783          	lw	a5,12(sp)
    1b14:	00050a13          	mv	s4,a0
    1b18:	0007c783          	lbu	a5,0(a5)
    1b1c:	00078863          	beqz	a5,1b2c <mem_speed_handler+0xb0>
    1b20:	00007537          	lui	a0,0x7
    1b24:	a5450513          	addi	a0,a0,-1452 # 6a54 <str.2794+0x380>
    1b28:	f81ff06f          	j	1aa8 <mem_speed_handler+0x2c>
    1b2c:	00200793          	li	a5,2
    1b30:	00000913          	li	s2,0
    1b34:	06f48263          	beq	s1,a5,1b98 <mem_speed_handler+0x11c>
    1b38:	00842503          	lw	a0,8(s0)
    1b3c:	00000613          	li	a2,0
    1b40:	00c10593          	addi	a1,sp,12
    1b44:	051000ef          	jal	ra,2394 <strtoul>
    1b48:	00c12783          	lw	a5,12(sp)
    1b4c:	00a03933          	snez	s2,a0
    1b50:	0007c783          	lbu	a5,0(a5)
    1b54:	00078863          	beqz	a5,1b64 <mem_speed_handler+0xe8>
    1b58:	00007537          	lui	a0,0x7
    1b5c:	c2050513          	addi	a0,a0,-992 # 6c20 <str.2794+0x54c>
    1b60:	f49ff06f          	j	1aa8 <mem_speed_handler+0x2c>
    1b64:	00300793          	li	a5,3
    1b68:	02f48863          	beq	s1,a5,1b98 <mem_speed_handler+0x11c>
    1b6c:	00c42503          	lw	a0,12(s0)
    1b70:	00000613          	li	a2,0
    1b74:	00c10593          	addi	a1,sp,12
    1b78:	01d000ef          	jal	ra,2394 <strtoul>
    1b7c:	00c12783          	lw	a5,12(sp)
    1b80:	00a036b3          	snez	a3,a0
    1b84:	0007c783          	lbu	a5,0(a5)
    1b88:	00078a63          	beqz	a5,1b9c <mem_speed_handler+0x120>
    1b8c:	00007537          	lui	a0,0x7
    1b90:	c3c50513          	addi	a0,a0,-964 # 6c3c <str.2794+0x568>
    1b94:	f15ff06f          	j	1aa8 <mem_speed_handler+0x2c>
    1b98:	00000693          	li	a3,0
    1b9c:	00090613          	mv	a2,s2
    1ba0:	000a0593          	mv	a1,s4
    1ba4:	00098513          	mv	a0,s3
    1ba8:	799010ef          	jal	ra,3b40 <memspeed>
    1bac:	f01ff06f          	j	1aac <mem_speed_handler+0x30>

00001bb0 <reboot_handler>:
    1bb0:	f00007b7          	lui	a5,0xf0000
    1bb4:	00100713          	li	a4,1
    1bb8:	00e7a023          	sw	a4,0(a5) # f0000000 <_fstack+0xdffff000>
    1bbc:	00008067          	ret

00001bc0 <boot_handler>:
    1bc0:	fd010113          	addi	sp,sp,-48
    1bc4:	02112623          	sw	ra,44(sp)
    1bc8:	02812423          	sw	s0,40(sp)
    1bcc:	02912223          	sw	s1,36(sp)
    1bd0:	03212023          	sw	s2,32(sp)
    1bd4:	01312e23          	sw	s3,28(sp)
    1bd8:	02a04663          	bgtz	a0,1c04 <boot_handler+0x44>
    1bdc:	00007537          	lui	a0,0x7
    1be0:	d4050513          	addi	a0,a0,-704 # 6d40 <str.2794+0x66c>
    1be4:	6ec000ef          	jal	ra,22d0 <printf>
    1be8:	02c12083          	lw	ra,44(sp)
    1bec:	02812403          	lw	s0,40(sp)
    1bf0:	02412483          	lw	s1,36(sp)
    1bf4:	02012903          	lw	s2,32(sp)
    1bf8:	01c12983          	lw	s3,28(sp)
    1bfc:	03010113          	addi	sp,sp,48
    1c00:	00008067          	ret
    1c04:	00058413          	mv	s0,a1
    1c08:	00050493          	mv	s1,a0
    1c0c:	00042503          	lw	a0,0(s0)
    1c10:	00000613          	li	a2,0
    1c14:	00c10593          	addi	a1,sp,12
    1c18:	77c000ef          	jal	ra,2394 <strtoul>
    1c1c:	00c12783          	lw	a5,12(sp)
    1c20:	00050993          	mv	s3,a0
    1c24:	0007c783          	lbu	a5,0(a5)
    1c28:	00078863          	beqz	a5,1c38 <boot_handler+0x78>
    1c2c:	00007537          	lui	a0,0x7
    1c30:	82050513          	addi	a0,a0,-2016 # 6820 <str.2794+0x14c>
    1c34:	fb1ff06f          	j	1be4 <boot_handler+0x24>
    1c38:	00100793          	li	a5,1
    1c3c:	08f48e63          	beq	s1,a5,1cd8 <boot_handler+0x118>
    1c40:	00442503          	lw	a0,4(s0)
    1c44:	00000613          	li	a2,0
    1c48:	00c10593          	addi	a1,sp,12
    1c4c:	748000ef          	jal	ra,2394 <strtoul>
    1c50:	00c12783          	lw	a5,12(sp)
    1c54:	00050913          	mv	s2,a0
    1c58:	0007c783          	lbu	a5,0(a5)
    1c5c:	00078863          	beqz	a5,1c6c <boot_handler+0xac>
    1c60:	00007537          	lui	a0,0x7
    1c64:	d6050513          	addi	a0,a0,-672 # 6d60 <str.2794+0x68c>
    1c68:	f7dff06f          	j	1be4 <boot_handler+0x24>
    1c6c:	00200793          	li	a5,2
    1c70:	02f48863          	beq	s1,a5,1ca0 <boot_handler+0xe0>
    1c74:	00842503          	lw	a0,8(s0)
    1c78:	00c10593          	addi	a1,sp,12
    1c7c:	00000613          	li	a2,0
    1c80:	714000ef          	jal	ra,2394 <strtoul>
    1c84:	00c12783          	lw	a5,12(sp)
    1c88:	00050593          	mv	a1,a0
    1c8c:	0007c783          	lbu	a5,0(a5)
    1c90:	00078a63          	beqz	a5,1ca4 <boot_handler+0xe4>
    1c94:	00007537          	lui	a0,0x7
    1c98:	d7050513          	addi	a0,a0,-656 # 6d70 <str.2794+0x69c>
    1c9c:	f49ff06f          	j	1be4 <boot_handler+0x24>
    1ca0:	00000593          	li	a1,0
    1ca4:	00300793          	li	a5,3
    1ca8:	0297dc63          	bge	a5,s1,1ce0 <boot_handler+0x120>
    1cac:	00c42503          	lw	a0,12(s0)
    1cb0:	00c10593          	addi	a1,sp,12
    1cb4:	00000613          	li	a2,0
    1cb8:	6dc000ef          	jal	ra,2394 <strtoul>
    1cbc:	00c12783          	lw	a5,12(sp)
    1cc0:	00050593          	mv	a1,a0
    1cc4:	0007c783          	lbu	a5,0(a5)
    1cc8:	00078c63          	beqz	a5,1ce0 <boot_handler+0x120>
    1ccc:	00007537          	lui	a0,0x7
    1cd0:	d8050513          	addi	a0,a0,-640 # 6d80 <str.2794+0x6ac>
    1cd4:	f11ff06f          	j	1be4 <boot_handler+0x24>
    1cd8:	00000913          	li	s2,0
    1cdc:	00000593          	li	a1,0
    1ce0:	00098693          	mv	a3,s3
    1ce4:	00000613          	li	a2,0
    1ce8:	00090513          	mv	a0,s2
    1cec:	afdfe0ef          	jal	ra,7e8 <boot>

00001cf0 <sdram_test_handler>:
    1cf0:	001005b7          	lui	a1,0x100
    1cf4:	40000537          	lui	a0,0x40000
    1cf8:	0900206f          	j	3d88 <memtest>

00001cfc <sdram_mr_write_handler>:
    1cfc:	fd010113          	addi	sp,sp,-48
    1d00:	02112623          	sw	ra,44(sp)
    1d04:	02812423          	sw	s0,40(sp)
    1d08:	02912223          	sw	s1,36(sp)
    1d0c:	00100793          	li	a5,1
    1d10:	02a7c263          	blt	a5,a0,1d34 <sdram_mr_write_handler+0x38>
    1d14:	00007537          	lui	a0,0x7
    1d18:	e0050513          	addi	a0,a0,-512 # 6e00 <str.2794+0x72c>
    1d1c:	5b4000ef          	jal	ra,22d0 <printf>
    1d20:	02c12083          	lw	ra,44(sp)
    1d24:	02812403          	lw	s0,40(sp)
    1d28:	02412483          	lw	s1,36(sp)
    1d2c:	03010113          	addi	sp,sp,48
    1d30:	00008067          	ret
    1d34:	00058413          	mv	s0,a1
    1d38:	00042503          	lw	a0,0(s0)
    1d3c:	00000613          	li	a2,0
    1d40:	01c10593          	addi	a1,sp,28
    1d44:	650000ef          	jal	ra,2394 <strtoul>
    1d48:	01c12783          	lw	a5,28(sp)
    1d4c:	00050493          	mv	s1,a0
    1d50:	0007c783          	lbu	a5,0(a5)
    1d54:	00078863          	beqz	a5,1d64 <sdram_mr_write_handler+0x68>
    1d58:	00007537          	lui	a0,0x7
    1d5c:	e2050513          	addi	a0,a0,-480 # 6e20 <str.2794+0x74c>
    1d60:	fbdff06f          	j	1d1c <sdram_mr_write_handler+0x20>
    1d64:	00442503          	lw	a0,4(s0)
    1d68:	00000613          	li	a2,0
    1d6c:	01c10593          	addi	a1,sp,28
    1d70:	624000ef          	jal	ra,2394 <strtoul>
    1d74:	01c12783          	lw	a5,28(sp)
    1d78:	00050413          	mv	s0,a0
    1d7c:	0007c783          	lbu	a5,0(a5)
    1d80:	00078863          	beqz	a5,1d90 <sdram_mr_write_handler+0x94>
    1d84:	00006537          	lui	a0,0x6
    1d88:	7e050513          	addi	a0,a0,2016 # 67e0 <str.2794+0x10c>
    1d8c:	f91ff06f          	j	1d1c <sdram_mr_write_handler+0x20>
    1d90:	180040ef          	jal	ra,5f10 <sdram_software_control_on>
    1d94:	01041593          	slli	a1,s0,0x10
    1d98:	00007537          	lui	a0,0x7
    1d9c:	0105d593          	srli	a1,a1,0x10
    1da0:	0ff4f613          	andi	a2,s1,255
    1da4:	e3050513          	addi	a0,a0,-464 # 6e30 <str.2794+0x75c>
    1da8:	00b12623          	sw	a1,12(sp)
    1dac:	524000ef          	jal	ra,22d0 <printf>
    1db0:	00c12583          	lw	a1,12(sp)
    1db4:	0ff4f513          	andi	a0,s1,255
    1db8:	1a0040ef          	jal	ra,5f58 <sdram_mode_register_write>
    1dbc:	178040ef          	jal	ra,5f34 <sdram_software_control_off>
    1dc0:	f61ff06f          	j	1d20 <sdram_mr_write_handler+0x24>

00001dc4 <main>:
    1dc4:	f7010113          	addi	sp,sp,-144
    1dc8:	08112623          	sw	ra,140(sp)
    1dcc:	08812423          	sw	s0,136(sp)
    1dd0:	08912223          	sw	s1,132(sp)
    1dd4:	09212023          	sw	s2,128(sp)
    1dd8:	07312e23          	sw	s3,124(sp)
    1ddc:	f0c027b7          	lui	a5,0xf0c02
    1de0:	0007a023          	sw	zero,0(a5) # f0c02000 <_fstack+0xe0c01000>
    1de4:	30046073          	csrsi	mstatus,8
    1de8:	2bc020ef          	jal	ra,40a4 <uart_init>
    1dec:	00007537          	lui	a0,0x7
    1df0:	ec050513          	addi	a0,a0,-320 # 6ec0 <str.2794+0x7ec>
    1df4:	4dc000ef          	jal	ra,22d0 <printf>
    1df8:	00008437          	lui	s0,0x8
    1dfc:	ab440513          	addi	a0,s0,-1356 # 7ab4 <crc_table+0x69c>
    1e00:	4d0000ef          	jal	ra,22d0 <printf>
    1e04:	194040ef          	jal	ra,5f98 <sdram_init>
    1e08:	00100793          	li	a5,1
    1e0c:	00050493          	mv	s1,a0
    1e10:	00f50863          	beq	a0,a5,1e20 <main+0x5c>
    1e14:	00007537          	lui	a0,0x7
    1e18:	ef450513          	addi	a0,a0,-268 # 6ef4 <str.2794+0x820>
    1e1c:	4b4000ef          	jal	ra,22d0 <printf>
    1e20:	ab440513          	addi	a0,s0,-1356
    1e24:	4ac000ef          	jal	ra,22d0 <printf>
    1e28:	c7cff0ef          	jal	ra,12a4 <init_dispatcher>
    1e2c:	02048863          	beqz	s1,1e5c <main+0x98>
    1e30:	00007537          	lui	a0,0x7
    1e34:	f1450513          	addi	a0,a0,-236 # 6f14 <str.2794+0x840>
    1e38:	498000ef          	jal	ra,22d0 <printf>
    1e3c:	de5fe0ef          	jal	ra,c20 <serialboot>
    1e40:	00050a63          	beqz	a0,1e54 <main+0x90>
    1e44:	8c0ff0ef          	jal	ra,f04 <sdcardboot>
    1e48:	00007537          	lui	a0,0x7
    1e4c:	f4850513          	addi	a0,a0,-184 # 6f48 <str.2794+0x874>
    1e50:	480000ef          	jal	ra,22d0 <printf>
    1e54:	ab440513          	addi	a0,s0,-1356
    1e58:	478000ef          	jal	ra,22d0 <printf>
    1e5c:	00007537          	lui	a0,0x7
    1e60:	f6050513          	addi	a0,a0,-160 # 6f60 <str.2794+0x88c>
    1e64:	46c000ef          	jal	ra,22d0 <printf>
    1e68:	00007937          	lui	s2,0x7
    1e6c:	000074b7          	lui	s1,0x7
    1e70:	f9490593          	addi	a1,s2,-108 # 6f94 <str.2794+0x8c0>
    1e74:	fa848513          	addi	a0,s1,-88 # 6fa8 <str.2794+0x8d4>
    1e78:	458000ef          	jal	ra,22d0 <printf>
    1e7c:	000079b7          	lui	s3,0x7
    1e80:	04000593          	li	a1,64
    1e84:	03010513          	addi	a0,sp,48
    1e88:	05c000ef          	jal	ra,1ee4 <readline>
    1e8c:	03014783          	lbu	a5,48(sp)
    1e90:	02078c63          	beqz	a5,1ec8 <main+0x104>
    1e94:	ab440513          	addi	a0,s0,-1356
    1e98:	438000ef          	jal	ra,22d0 <printf>
    1e9c:	01010613          	addi	a2,sp,16
    1ea0:	00c10593          	addi	a1,sp,12
    1ea4:	03010513          	addi	a0,sp,48
    1ea8:	ad0ff0ef          	jal	ra,1178 <get_param>
    1eac:	00050593          	mv	a1,a0
    1eb0:	00c12503          	lw	a0,12(sp)
    1eb4:	01010613          	addi	a2,sp,16
    1eb8:	b54ff0ef          	jal	ra,120c <command_dispatcher>
    1ebc:	00051663          	bnez	a0,1ec8 <main+0x104>
    1ec0:	fac98513          	addi	a0,s3,-84 # 6fac <str.2794+0x8d8>
    1ec4:	40c000ef          	jal	ra,22d0 <printf>
    1ec8:	f9490593          	addi	a1,s2,-108
    1ecc:	fa848513          	addi	a0,s1,-88
    1ed0:	400000ef          	jal	ra,22d0 <printf>
    1ed4:	fadff06f          	j	1e80 <main+0xbc>

00001ed8 <set_idle_hook>:
    1ed8:	100007b7          	lui	a5,0x10000
    1edc:	16a7a623          	sw	a0,364(a5) # 1000016c <idle_hook_ptr>
    1ee0:	00008067          	ret

00001ee4 <readline>:
    1ee4:	000087b7          	lui	a5,0x8
    1ee8:	fb07a783          	lw	a5,-80(a5) # 7fb0 <stdin>
    1eec:	fc010113          	addi	sp,sp,-64
    1ef0:	02812c23          	sw	s0,56(sp)
    1ef4:	00f12623          	sw	a5,12(sp)
    1ef8:	000087b7          	lui	a5,0x8
    1efc:	fb87a783          	lw	a5,-72(a5) # 7fb8 <stdout>
    1f00:	02912a23          	sw	s1,52(sp)
    1f04:	03212823          	sw	s2,48(sp)
    1f08:	03312623          	sw	s3,44(sp)
    1f0c:	03412423          	sw	s4,40(sp)
    1f10:	03512223          	sw	s5,36(sp)
    1f14:	02112e23          	sw	ra,60(sp)
    1f18:	00050a93          	mv	s5,a0
    1f1c:	00010ea3          	sb	zero,29(sp)
    1f20:	00000413          	li	s0,0
    1f24:	100009b7          	lui	s3,0x10000
    1f28:	100004b7          	lui	s1,0x10000
    1f2c:	00f12423          	sw	a5,8(sp)
    1f30:	00a00913          	li	s2,10
    1f34:	00007a37          	lui	s4,0x7
    1f38:	16c9a783          	lw	a5,364(s3) # 1000016c <idle_hook_ptr>
    1f3c:	04079c63          	bnez	a5,1f94 <readline+0xb0>
    1f40:	00c12503          	lw	a0,12(sp)
    1f44:	2a0000ef          	jal	ra,21e4 <fgetc>
    1f48:	1684c703          	lbu	a4,360(s1) # 10000168 <skip.1899>
    1f4c:	0ff57793          	andi	a5,a0,255
    1f50:	00f10e23          	sb	a5,28(sp)
    1f54:	fef702e3          	beq	a4,a5,1f38 <readline+0x54>
    1f58:	16048423          	sb	zero,360(s1)
    1f5c:	09278c63          	beq	a5,s2,1ff4 <readline+0x110>
    1f60:	04f96063          	bltu	s2,a5,1fa0 <readline+0xbc>
    1f64:	00700713          	li	a4,7
    1f68:	fce788e3          	beq	a5,a4,1f38 <readline+0x54>
    1f6c:	00800713          	li	a4,8
    1f70:	08e79863          	bne	a5,a4,2000 <readline+0x11c>
    1f74:	fc0402e3          	beqz	s0,1f38 <readline+0x54>
    1f78:	00812583          	lw	a1,8(sp)
    1f7c:	fc0a0513          	addi	a0,s4,-64 # 6fc0 <str.2794+0x8ec>
    1f80:	fff40413          	addi	s0,s0,-1
    1f84:	2dc000ef          	jal	ra,2260 <fputs>
    1f88:	fb1ff06f          	j	1f38 <readline+0x54>
    1f8c:	16c9a783          	lw	a5,364(s3)
    1f90:	000780e7          	jalr	a5
    1f94:	064020ef          	jal	ra,3ff8 <uart_read_nonblock>
    1f98:	fe050ae3          	beqz	a0,1f8c <readline+0xa8>
    1f9c:	fa5ff06f          	j	1f40 <readline+0x5c>
    1fa0:	00d00713          	li	a4,13
    1fa4:	00e78663          	beq	a5,a4,1fb0 <readline+0xcc>
    1fa8:	07f00713          	li	a4,127
    1fac:	fc5ff06f          	j	1f70 <readline+0x8c>
    1fb0:	17248423          	sb	s2,360(s1)
    1fb4:	008a8433          	add	s0,s5,s0
    1fb8:	00040023          	sb	zero,0(s0)
    1fbc:	00812583          	lw	a1,8(sp)
    1fc0:	00008537          	lui	a0,0x8
    1fc4:	ab450513          	addi	a0,a0,-1356 # 7ab4 <crc_table+0x69c>
    1fc8:	298000ef          	jal	ra,2260 <fputs>
    1fcc:	03c12083          	lw	ra,60(sp)
    1fd0:	03812403          	lw	s0,56(sp)
    1fd4:	03412483          	lw	s1,52(sp)
    1fd8:	03012903          	lw	s2,48(sp)
    1fdc:	02c12983          	lw	s3,44(sp)
    1fe0:	02812a03          	lw	s4,40(sp)
    1fe4:	02412a83          	lw	s5,36(sp)
    1fe8:	00000513          	li	a0,0
    1fec:	04010113          	addi	sp,sp,64
    1ff0:	00008067          	ret
    1ff4:	00d00793          	li	a5,13
    1ff8:	16f48423          	sb	a5,360(s1)
    1ffc:	fb9ff06f          	j	1fb4 <readline+0xd0>
    2000:	00812583          	lw	a1,8(sp)
    2004:	01c10513          	addi	a0,sp,28
    2008:	258000ef          	jal	ra,2260 <fputs>
    200c:	01c14703          	lbu	a4,28(sp)
    2010:	008a87b3          	add	a5,s5,s0
    2014:	00140413          	addi	s0,s0,1
    2018:	00e78023          	sb	a4,0(a5)
    201c:	f1dff06f          	j	1f38 <readline+0x54>

00002020 <memcpy>:
    2020:	00050313          	mv	t1,a0
    2024:	00060e63          	beqz	a2,2040 <memcpy+0x20>
    2028:	00058383          	lb	t2,0(a1) # 100000 <_edata_rom+0xf7e8c>
    202c:	00730023          	sb	t2,0(t1)
    2030:	fff60613          	addi	a2,a2,-1
    2034:	00130313          	addi	t1,t1,1
    2038:	00158593          	addi	a1,a1,1
    203c:	fe0616e3          	bnez	a2,2028 <memcpy+0x8>
    2040:	00008067          	ret

00002044 <memset>:
    2044:	00050313          	mv	t1,a0
    2048:	00060a63          	beqz	a2,205c <memset+0x18>
    204c:	00b30023          	sb	a1,0(t1)
    2050:	fff60613          	addi	a2,a2,-1
    2054:	00130313          	addi	t1,t1,1
    2058:	fe061ae3          	bnez	a2,204c <memset+0x8>
    205c:	00008067          	ret

00002060 <strcmp>:
    2060:	00054603          	lbu	a2,0(a0)
    2064:	0005c683          	lbu	a3,0(a1)
    2068:	00150513          	addi	a0,a0,1
    206c:	00158593          	addi	a1,a1,1
    2070:	00d61463          	bne	a2,a3,2078 <strcmp+0x18>
    2074:	fe0616e3          	bnez	a2,2060 <strcmp>
    2078:	40d60533          	sub	a0,a2,a3
    207c:	00008067          	ret

00002080 <strlen>:
    2080:	00050793          	mv	a5,a0
    2084:	0007c703          	lbu	a4,0(a5)
    2088:	00178793          	addi	a5,a5,1
    208c:	fe071ce3          	bnez	a4,2084 <strlen+0x4>
    2090:	40a78533          	sub	a0,a5,a0
    2094:	fff50513          	addi	a0,a0,-1
    2098:	00008067          	ret

0000209c <lldiv>:
    209c:	fd010113          	addi	sp,sp,-48
    20a0:	01512a23          	sw	s5,20(sp)
    20a4:	00060a93          	mv	s5,a2
    20a8:	02812423          	sw	s0,40(sp)
    20ac:	00068613          	mv	a2,a3
    20b0:	01412c23          	sw	s4,24(sp)
    20b4:	01712623          	sw	s7,12(sp)
    20b8:	00068a13          	mv	s4,a3
    20bc:	00058b93          	mv	s7,a1
    20c0:	00070693          	mv	a3,a4
    20c4:	00050413          	mv	s0,a0
    20c8:	00058513          	mv	a0,a1
    20cc:	000a8593          	mv	a1,s5
    20d0:	02112623          	sw	ra,44(sp)
    20d4:	02912223          	sw	s1,36(sp)
    20d8:	03212023          	sw	s2,32(sp)
    20dc:	01312e23          	sw	s3,28(sp)
    20e0:	01612823          	sw	s6,16(sp)
    20e4:	00070993          	mv	s3,a4
    20e8:	01812423          	sw	s8,8(sp)
    20ec:	419000ef          	jal	ra,2d04 <__divdi3>
    20f0:	00098693          	mv	a3,s3
    20f4:	00050493          	mv	s1,a0
    20f8:	00058b13          	mv	s6,a1
    20fc:	00050913          	mv	s2,a0
    2100:	00058c13          	mv	s8,a1
    2104:	000a0613          	mv	a2,s4
    2108:	000b8513          	mv	a0,s7
    210c:	000a8593          	mv	a1,s5
    2110:	090010ef          	jal	ra,31a0 <__moddi3>
    2114:	00050793          	mv	a5,a0
    2118:	00058693          	mv	a3,a1
    211c:	020ac263          	bltz	s5,2140 <lldiv+0xa4>
    2120:	0205d063          	bgez	a1,2140 <lldiv+0xa4>
    2124:	00148913          	addi	s2,s1,1
    2128:	414507b3          	sub	a5,a0,s4
    212c:	009934b3          	sltu	s1,s2,s1
    2130:	00f53533          	sltu	a0,a0,a5
    2134:	413585b3          	sub	a1,a1,s3
    2138:	01648c33          	add	s8,s1,s6
    213c:	40a586b3          	sub	a3,a1,a0
    2140:	01242023          	sw	s2,0(s0)
    2144:	01842223          	sw	s8,4(s0)
    2148:	02c12083          	lw	ra,44(sp)
    214c:	00f42423          	sw	a5,8(s0)
    2150:	00d42623          	sw	a3,12(s0)
    2154:	00040513          	mv	a0,s0
    2158:	02812403          	lw	s0,40(sp)
    215c:	02412483          	lw	s1,36(sp)
    2160:	02012903          	lw	s2,32(sp)
    2164:	01c12983          	lw	s3,28(sp)
    2168:	01812a03          	lw	s4,24(sp)
    216c:	01412a83          	lw	s5,20(sp)
    2170:	01012b03          	lw	s6,16(sp)
    2174:	00c12b83          	lw	s7,12(sp)
    2178:	00812c03          	lw	s8,8(sp)
    217c:	03010113          	addi	sp,sp,48
    2180:	00008067          	ret

00002184 <strncmp>:
    2184:	02060a63          	beqz	a2,21b8 <strncmp+0x34>
    2188:	fff60613          	addi	a2,a2,-1
    218c:	00000713          	li	a4,0
    2190:	00e507b3          	add	a5,a0,a4
    2194:	00e586b3          	add	a3,a1,a4
    2198:	0007c783          	lbu	a5,0(a5)
    219c:	0006c683          	lbu	a3,0(a3)
    21a0:	00d79863          	bne	a5,a3,21b0 <strncmp+0x2c>
    21a4:	00c70663          	beq	a4,a2,21b0 <strncmp+0x2c>
    21a8:	00170713          	addi	a4,a4,1
    21ac:	fe0792e3          	bnez	a5,2190 <strncmp+0xc>
    21b0:	40d78533          	sub	a0,a5,a3
    21b4:	00008067          	ret
    21b8:	00000513          	li	a0,0
    21bc:	00008067          	ret

000021c0 <strnlen>:
    21c0:	00b505b3          	add	a1,a0,a1
    21c4:	00050793          	mv	a5,a0
    21c8:	00b79663          	bne	a5,a1,21d4 <strnlen+0x14>
    21cc:	40a78533          	sub	a0,a5,a0
    21d0:	00008067          	ret
    21d4:	0007c703          	lbu	a4,0(a5)
    21d8:	fe070ae3          	beqz	a4,21cc <strnlen+0xc>
    21dc:	00178793          	addi	a5,a5,1
    21e0:	fe9ff06f          	j	21c8 <strnlen+0x8>

000021e4 <fgetc>:
    21e4:	00254783          	lbu	a5,2(a0)
    21e8:	0017f793          	andi	a5,a5,1
    21ec:	06078663          	beqz	a5,2258 <fgetc+0x74>
    21f0:	ff010113          	addi	sp,sp,-16
    21f4:	00055783          	lhu	a5,0(a0)
    21f8:	00812423          	sw	s0,8(sp)
    21fc:	00112623          	sw	ra,12(sp)
    2200:	00051023          	sh	zero,0(a0)
    2204:	00050413          	mv	s0,a0
    2208:	00078c63          	beqz	a5,2220 <fgetc+0x3c>
    220c:	0ff7f513          	andi	a0,a5,255
    2210:	00c12083          	lw	ra,12(sp)
    2214:	00812403          	lw	s0,8(sp)
    2218:	01010113          	addi	sp,sp,16
    221c:	00008067          	ret
    2220:	00852783          	lw	a5,8(a0)
    2224:	000780e7          	jalr	a5
    2228:	00050793          	mv	a5,a0
    222c:	0ff57513          	andi	a0,a0,255
    2230:	fe07d0e3          	bgez	a5,2210 <fgetc+0x2c>
    2234:	fff00613          	li	a2,-1
    2238:	00240703          	lb	a4,2(s0)
    223c:	00400693          	li	a3,4
    2240:	00c78463          	beq	a5,a2,2248 <fgetc+0x64>
    2244:	00800693          	li	a3,8
    2248:	00d767b3          	or	a5,a4,a3
    224c:	00f40123          	sb	a5,2(s0)
    2250:	fff00513          	li	a0,-1
    2254:	fbdff06f          	j	2210 <fgetc+0x2c>
    2258:	fff00513          	li	a0,-1
    225c:	00008067          	ret

00002260 <fputs>:
    2260:	ff010113          	addi	sp,sp,-16
    2264:	01212023          	sw	s2,0(sp)
    2268:	00112623          	sw	ra,12(sp)
    226c:	00812423          	sw	s0,8(sp)
    2270:	00912223          	sw	s1,4(sp)
    2274:	0025c783          	lbu	a5,2(a1)
    2278:	fff00913          	li	s2,-1
    227c:	0027f793          	andi	a5,a5,2
    2280:	00078e63          	beqz	a5,229c <fputs+0x3c>
    2284:	00050413          	mv	s0,a0
    2288:	00058493          	mv	s1,a1
    228c:	00000913          	li	s2,0
    2290:	00044503          	lbu	a0,0(s0)
    2294:	00140413          	addi	s0,s0,1
    2298:	02051063          	bnez	a0,22b8 <fputs+0x58>
    229c:	00c12083          	lw	ra,12(sp)
    22a0:	00812403          	lw	s0,8(sp)
    22a4:	00412483          	lw	s1,4(sp)
    22a8:	00090513          	mv	a0,s2
    22ac:	00012903          	lw	s2,0(sp)
    22b0:	01010113          	addi	sp,sp,16
    22b4:	00008067          	ret
    22b8:	0044a783          	lw	a5,4(s1)
    22bc:	00048593          	mv	a1,s1
    22c0:	000780e7          	jalr	a5
    22c4:	fc0556e3          	bgez	a0,2290 <fputs+0x30>
    22c8:	fff00913          	li	s2,-1
    22cc:	fc5ff06f          	j	2290 <fputs+0x30>

000022d0 <printf>:
    22d0:	fc010113          	addi	sp,sp,-64
    22d4:	02f12a23          	sw	a5,52(sp)
    22d8:	000087b7          	lui	a5,0x8
    22dc:	02b12223          	sw	a1,36(sp)
    22e0:	00050593          	mv	a1,a0
    22e4:	fb87a503          	lw	a0,-72(a5) # 7fb8 <stdout>
    22e8:	02c12423          	sw	a2,40(sp)
    22ec:	02410613          	addi	a2,sp,36
    22f0:	00112e23          	sw	ra,28(sp)
    22f4:	02d12623          	sw	a3,44(sp)
    22f8:	02e12823          	sw	a4,48(sp)
    22fc:	03012c23          	sw	a6,56(sp)
    2300:	03112e23          	sw	a7,60(sp)
    2304:	00c12623          	sw	a2,12(sp)
    2308:	2d0000ef          	jal	ra,25d8 <__i_vfprintf>
    230c:	01c12083          	lw	ra,28(sp)
    2310:	04010113          	addi	sp,sp,64
    2314:	00008067          	ret

00002318 <puts>:
    2318:	000087b7          	lui	a5,0x8
    231c:	fb87a583          	lw	a1,-72(a5) # 7fb8 <stdout>
    2320:	fe010113          	addi	sp,sp,-32
    2324:	00812c23          	sw	s0,24(sp)
    2328:	00912a23          	sw	s1,20(sp)
    232c:	00112e23          	sw	ra,28(sp)
    2330:	0025c783          	lbu	a5,2(a1)
    2334:	00050413          	mv	s0,a0
    2338:	00000493          	li	s1,0
    233c:	0027f793          	andi	a5,a5,2
    2340:	02079a63          	bnez	a5,2374 <puts+0x5c>
    2344:	fff00493          	li	s1,-1
    2348:	01c12083          	lw	ra,28(sp)
    234c:	01812403          	lw	s0,24(sp)
    2350:	00048513          	mv	a0,s1
    2354:	01412483          	lw	s1,20(sp)
    2358:	02010113          	addi	sp,sp,32
    235c:	00008067          	ret
    2360:	00b12623          	sw	a1,12(sp)
    2364:	000780e7          	jalr	a5
    2368:	00c12583          	lw	a1,12(sp)
    236c:	00055463          	bgez	a0,2374 <puts+0x5c>
    2370:	fff00493          	li	s1,-1
    2374:	00044503          	lbu	a0,0(s0)
    2378:	00140413          	addi	s0,s0,1
    237c:	0045a783          	lw	a5,4(a1)
    2380:	fe0510e3          	bnez	a0,2360 <puts+0x48>
    2384:	00a00513          	li	a0,10
    2388:	000780e7          	jalr	a5
    238c:	fa055ee3          	bgez	a0,2348 <puts+0x30>
    2390:	fb5ff06f          	j	2344 <puts+0x2c>

00002394 <strtoul>:
    2394:	02400793          	li	a5,36
    2398:	00050813          	mv	a6,a0
    239c:	00c7e663          	bltu	a5,a2,23a8 <strtoul+0x14>
    23a0:	00100793          	li	a5,1
    23a4:	02f61063          	bne	a2,a5,23c4 <strtoul+0x30>
    23a8:	100007b7          	lui	a5,0x10000
    23ac:	01600713          	li	a4,22
    23b0:	16e7a823          	sw	a4,368(a5) # 10000170 <errno>
    23b4:	00000513          	li	a0,0
    23b8:	00058463          	beqz	a1,23c0 <strtoul+0x2c>
    23bc:	0105a023          	sw	a6,0(a1)
    23c0:	00008067          	ret
    23c4:	0ff67893          	andi	a7,a2,255
    23c8:	00400e13          	li	t3,4
    23cc:	02000313          	li	t1,32
    23d0:	00054783          	lbu	a5,0(a0)
    23d4:	00150713          	addi	a4,a0,1
    23d8:	ff778693          	addi	a3,a5,-9
    23dc:	0ff6f693          	andi	a3,a3,255
    23e0:	0ade7a63          	bgeu	t3,a3,2494 <strtoul+0x100>
    23e4:	0a678863          	beq	a5,t1,2494 <strtoul+0x100>
    23e8:	02b00693          	li	a3,43
    23ec:	0ad78863          	beq	a5,a3,249c <strtoul+0x108>
    23f0:	02d00313          	li	t1,45
    23f4:	00000693          	li	a3,0
    23f8:	00679863          	bne	a5,t1,2408 <strtoul+0x74>
    23fc:	00100693          	li	a3,1
    2400:	00154783          	lbu	a5,1(a0)
    2404:	00250713          	addi	a4,a0,2
    2408:	03000513          	li	a0,48
    240c:	0aa79263          	bne	a5,a0,24b0 <strtoul+0x11c>
    2410:	00074503          	lbu	a0,0(a4)
    2414:	07800313          	li	t1,120
    2418:	02056513          	ori	a0,a0,32
    241c:	08651463          	bne	a0,t1,24a4 <strtoul+0x110>
    2420:	00060663          	beqz	a2,242c <strtoul+0x98>
    2424:	01000513          	li	a0,16
    2428:	00a61a63          	bne	a2,a0,243c <strtoul+0xa8>
    242c:	00174783          	lbu	a5,1(a4)
    2430:	00070813          	mv	a6,a4
    2434:	01000893          	li	a7,16
    2438:	00270713          	addi	a4,a4,2
    243c:	00000513          	li	a0,0
    2440:	03900613          	li	a2,57
    2444:	00f67a63          	bgeu	a2,a5,2458 <strtoul+0xc4>
    2448:	fff78793          	addi	a5,a5,-1
    244c:	0207e793          	ori	a5,a5,32
    2450:	fda78793          	addi	a5,a5,-38
    2454:	0ff7f793          	andi	a5,a5,255
    2458:	fd078793          	addi	a5,a5,-48
    245c:	0ff7f793          	andi	a5,a5,255
    2460:	0517fe63          	bgeu	a5,a7,24bc <strtoul+0x128>
    2464:	03153833          	mulhu	a6,a0,a7
    2468:	03150533          	mul	a0,a0,a7
    246c:	00081a63          	bnez	a6,2480 <strtoul+0xec>
    2470:	00f507b3          	add	a5,a0,a5
    2474:	00a7b833          	sltu	a6,a5,a0
    2478:	00078513          	mv	a0,a5
    247c:	00080463          	beqz	a6,2484 <strtoul+0xf0>
    2480:	0026e693          	ori	a3,a3,2
    2484:	00074783          	lbu	a5,0(a4)
    2488:	00070813          	mv	a6,a4
    248c:	00170713          	addi	a4,a4,1
    2490:	fb5ff06f          	j	2444 <strtoul+0xb0>
    2494:	00070513          	mv	a0,a4
    2498:	f39ff06f          	j	23d0 <strtoul+0x3c>
    249c:	00000693          	li	a3,0
    24a0:	f61ff06f          	j	2400 <strtoul+0x6c>
    24a4:	f8061ce3          	bnez	a2,243c <strtoul+0xa8>
    24a8:	00800893          	li	a7,8
    24ac:	f91ff06f          	j	243c <strtoul+0xa8>
    24b0:	f80616e3          	bnez	a2,243c <strtoul+0xa8>
    24b4:	00a00893          	li	a7,10
    24b8:	f85ff06f          	j	243c <strtoul+0xa8>
    24bc:	0016f793          	andi	a5,a3,1
    24c0:	00078463          	beqz	a5,24c8 <strtoul+0x134>
    24c4:	40a00533          	neg	a0,a0
    24c8:	0026f693          	andi	a3,a3,2
    24cc:	ee0686e3          	beqz	a3,23b8 <strtoul+0x24>
    24d0:	100007b7          	lui	a5,0x10000
    24d4:	02200713          	li	a4,34
    24d8:	16e7a823          	sw	a4,368(a5) # 10000170 <errno>
    24dc:	fff00513          	li	a0,-1
    24e0:	ed9ff06f          	j	23b8 <strtoul+0x24>

000024e4 <__ultoa_invert>:
    24e4:	fd010113          	addi	sp,sp,-48
    24e8:	02912223          	sw	s1,36(sp)
    24ec:	03212023          	sw	s2,32(sp)
    24f0:	01312e23          	sw	s3,28(sp)
    24f4:	01412c23          	sw	s4,24(sp)
    24f8:	01612823          	sw	s6,16(sp)
    24fc:	02112623          	sw	ra,44(sp)
    2500:	02812423          	sw	s0,40(sp)
    2504:	01512a23          	sw	s5,20(sp)
    2508:	01712623          	sw	s7,12(sp)
    250c:	01812423          	sw	s8,8(sp)
    2510:	01912223          	sw	s9,4(sp)
    2514:	2006f793          	andi	a5,a3,512
    2518:	00050993          	mv	s3,a0
    251c:	00058a13          	mv	s4,a1
    2520:	00060913          	mv	s2,a2
    2524:	00068493          	mv	s1,a3
    2528:	02700b13          	li	s6,39
    252c:	00078663          	beqz	a5,2538 <__ultoa_invert+0x54>
    2530:	dff6f493          	andi	s1,a3,-513
    2534:	00700b13          	li	s6,7
    2538:	41f4da93          	srai	s5,s1,0x1f
    253c:	00900c93          	li	s9,9
    2540:	00048613          	mv	a2,s1
    2544:	000a8693          	mv	a3,s5
    2548:	00098513          	mv	a0,s3
    254c:	000a0593          	mv	a1,s4
    2550:	42d000ef          	jal	ra,317c <__umoddi3>
    2554:	000a0593          	mv	a1,s4
    2558:	0ff57413          	andi	s0,a0,255
    255c:	00048613          	mv	a2,s1
    2560:	00098513          	mv	a0,s3
    2564:	000a8693          	mv	a3,s5
    2568:	40d000ef          	jal	ra,3174 <__udivdi3>
    256c:	00098c13          	mv	s8,s3
    2570:	000a0b93          	mv	s7,s4
    2574:	00050993          	mv	s3,a0
    2578:	00058a13          	mv	s4,a1
    257c:	008cf663          	bgeu	s9,s0,2588 <__ultoa_invert+0xa4>
    2580:	01640433          	add	s0,s0,s6
    2584:	0ff47413          	andi	s0,s0,255
    2588:	00190913          	addi	s2,s2,1
    258c:	03040413          	addi	s0,s0,48
    2590:	fe890fa3          	sb	s0,-1(s2)
    2594:	015be663          	bltu	s7,s5,25a0 <__ultoa_invert+0xbc>
    2598:	fb7a94e3          	bne	s5,s7,2540 <__ultoa_invert+0x5c>
    259c:	fa9c72e3          	bgeu	s8,s1,2540 <__ultoa_invert+0x5c>
    25a0:	02c12083          	lw	ra,44(sp)
    25a4:	02812403          	lw	s0,40(sp)
    25a8:	02412483          	lw	s1,36(sp)
    25ac:	01c12983          	lw	s3,28(sp)
    25b0:	01812a03          	lw	s4,24(sp)
    25b4:	01412a83          	lw	s5,20(sp)
    25b8:	01012b03          	lw	s6,16(sp)
    25bc:	00c12b83          	lw	s7,12(sp)
    25c0:	00812c03          	lw	s8,8(sp)
    25c4:	00412c83          	lw	s9,4(sp)
    25c8:	00090513          	mv	a0,s2
    25cc:	02012903          	lw	s2,32(sp)
    25d0:	03010113          	addi	sp,sp,48
    25d4:	00008067          	ret

000025d8 <__i_vfprintf>:
    25d8:	f9010113          	addi	sp,sp,-112
    25dc:	05412c23          	sw	s4,88(sp)
    25e0:	06112623          	sw	ra,108(sp)
    25e4:	06812423          	sw	s0,104(sp)
    25e8:	06912223          	sw	s1,100(sp)
    25ec:	07212023          	sw	s2,96(sp)
    25f0:	05312e23          	sw	s3,92(sp)
    25f4:	05512a23          	sw	s5,84(sp)
    25f8:	05612823          	sw	s6,80(sp)
    25fc:	05712623          	sw	s7,76(sp)
    2600:	05812423          	sw	s8,72(sp)
    2604:	05912223          	sw	s9,68(sp)
    2608:	05a12023          	sw	s10,64(sp)
    260c:	03b12e23          	sw	s11,60(sp)
    2610:	00254783          	lbu	a5,2(a0)
    2614:	00452a03          	lw	s4,4(a0)
    2618:	0027f793          	andi	a5,a5,2
    261c:	2c078663          	beqz	a5,28e8 <__i_vfprintf+0x310>
    2620:	000077b7          	lui	a5,0x7
    2624:	fd478793          	addi	a5,a5,-44 # 6fd4 <str.2794+0x900>
    2628:	00007cb7          	lui	s9,0x7
    262c:	00f12023          	sw	a5,0(sp)
    2630:	00007d37          	lui	s10,0x7
    2634:	fccc8793          	addi	a5,s9,-52 # 6fcc <str.2794+0x8f8>
    2638:	00f12223          	sw	a5,4(sp)
    263c:	fc4d0793          	addi	a5,s10,-60 # 6fc4 <str.2794+0x8f0>
    2640:	00050993          	mv	s3,a0
    2644:	00060493          	mv	s1,a2
    2648:	00000c13          	li	s8,0
    264c:	01810a93          	addi	s5,sp,24
    2650:	00f12423          	sw	a5,8(sp)
    2654:	0005cd83          	lbu	s11,0(a1)
    2658:	280d8a63          	beqz	s11,28ec <__i_vfprintf+0x314>
    265c:	02500713          	li	a4,37
    2660:	00158b93          	addi	s7,a1,1
    2664:	00ed9863          	bne	s11,a4,2674 <__i_vfprintf+0x9c>
    2668:	0015cd83          	lbu	s11,1(a1)
    266c:	00258b93          	addi	s7,a1,2
    2670:	02ed9063          	bne	s11,a4,2690 <__i_vfprintf+0xb8>
    2674:	001c0c13          	addi	s8,s8,1
    2678:	00098593          	mv	a1,s3
    267c:	000d8513          	mv	a0,s11
    2680:	000a00e7          	jalr	s4
    2684:	26054263          	bltz	a0,28e8 <__i_vfprintf+0x310>
    2688:	000b8593          	mv	a1,s7
    268c:	fc9ff06f          	j	2654 <__i_vfprintf+0x7c>
    2690:	00000d13          	li	s10,0
    2694:	00000913          	li	s2,0
    2698:	00000413          	li	s0,0
    269c:	01f00593          	li	a1,31
    26a0:	06c00813          	li	a6,108
    26a4:	06800893          	li	a7,104
    26a8:	04c00313          	li	t1,76
    26ac:	06a00e13          	li	t3,106
    26b0:	07a00e93          	li	t4,122
    26b4:	07400f13          	li	t5,116
    26b8:	00900f93          	li	t6,9
    26bc:	02a00293          	li	t0,42
    26c0:	02e00393          	li	t2,46
    26c4:	00a00613          	li	a2,10
    26c8:	07f00b13          	li	s6,127
    26cc:	01000513          	li	a0,16
    26d0:	0485ea63          	bltu	a1,s0,2724 <__i_vfprintf+0x14c>
    26d4:	fe0d8693          	addi	a3,s11,-32
    26d8:	0ff6f693          	andi	a3,a3,255
    26dc:	04d56663          	bltu	a0,a3,2728 <__i_vfprintf+0x150>
    26e0:	00012783          	lw	a5,0(sp)
    26e4:	00269693          	slli	a3,a3,0x2
    26e8:	00f686b3          	add	a3,a3,a5
    26ec:	0006a683          	lw	a3,0(a3)
    26f0:	00068067          	jr	a3
    26f4:	00146413          	ori	s0,s0,1
    26f8:	000bcd83          	lbu	s11,0(s7)
    26fc:	001b8b93          	addi	s7,s7,1
    2700:	fc0d98e3          	bnez	s11,26d0 <__i_vfprintf+0xf8>
    2704:	0e00006f          	j	27e4 <__i_vfprintf+0x20c>
    2708:	00246413          	ori	s0,s0,2
    270c:	00446413          	ori	s0,s0,4
    2710:	fe9ff06f          	j	26f8 <__i_vfprintf+0x120>
    2714:	00846413          	ori	s0,s0,8
    2718:	fe1ff06f          	j	26f8 <__i_vfprintf+0x120>
    271c:	01046413          	ori	s0,s0,16
    2720:	fd9ff06f          	j	26f8 <__i_vfprintf+0x120>
    2724:	068b6c63          	bltu	s6,s0,279c <__i_vfprintf+0x1c4>
    2728:	fd0d8693          	addi	a3,s11,-48
    272c:	0ff6f693          	andi	a3,a3,255
    2730:	02dfe463          	bltu	t6,a3,2758 <__i_vfprintf+0x180>
    2734:	04047d93          	andi	s11,s0,64
    2738:	000d8863          	beqz	s11,2748 <__i_vfprintf+0x170>
    273c:	02cd0733          	mul	a4,s10,a2
    2740:	00d70d33          	add	s10,a4,a3
    2744:	fb5ff06f          	j	26f8 <__i_vfprintf+0x120>
    2748:	02c90933          	mul	s2,s2,a2
    274c:	02046413          	ori	s0,s0,32
    2750:	00d90933          	add	s2,s2,a3
    2754:	fa5ff06f          	j	26f8 <__i_vfprintf+0x120>
    2758:	025d9863          	bne	s11,t0,2788 <__i_vfprintf+0x1b0>
    275c:	04047d93          	andi	s11,s0,64
    2760:	0004a683          	lw	a3,0(s1)
    2764:	00448493          	addi	s1,s1,4
    2768:	0c0d9e63          	bnez	s11,2844 <__i_vfprintf+0x26c>
    276c:	0006c863          	bltz	a3,277c <__i_vfprintf+0x1a4>
    2770:	02046413          	ori	s0,s0,32
    2774:	00068913          	mv	s2,a3
    2778:	f81ff06f          	j	26f8 <__i_vfprintf+0x120>
    277c:	40d00933          	neg	s2,a3
    2780:	02846413          	ori	s0,s0,40
    2784:	f75ff06f          	j	26f8 <__i_vfprintf+0x120>
    2788:	007d9a63          	bne	s11,t2,279c <__i_vfprintf+0x1c4>
    278c:	04047693          	andi	a3,s0,64
    2790:	14069e63          	bnez	a3,28ec <__i_vfprintf+0x314>
    2794:	04046413          	ori	s0,s0,64
    2798:	f61ff06f          	j	26f8 <__i_vfprintf+0x120>
    279c:	010d9c63          	bne	s11,a6,27b4 <__i_vfprintf+0x1dc>
    27a0:	08047693          	andi	a3,s0,128
    27a4:	00068463          	beqz	a3,27ac <__i_vfprintf+0x1d4>
    27a8:	20046413          	ori	s0,s0,512
    27ac:	08046413          	ori	s0,s0,128
    27b0:	f49ff06f          	j	26f8 <__i_vfprintf+0x120>
    27b4:	011d9c63          	bne	s11,a7,27cc <__i_vfprintf+0x1f4>
    27b8:	10047693          	andi	a3,s0,256
    27bc:	00068463          	beqz	a3,27c4 <__i_vfprintf+0x1ec>
    27c0:	20046413          	ori	s0,s0,512
    27c4:	10046413          	ori	s0,s0,256
    27c8:	f31ff06f          	j	26f8 <__i_vfprintf+0x120>
    27cc:	006d9663          	bne	s11,t1,27d8 <__i_vfprintf+0x200>
    27d0:	28046413          	ori	s0,s0,640
    27d4:	f25ff06f          	j	26f8 <__i_vfprintf+0x120>
    27d8:	ffcd8ce3          	beq	s11,t3,27d0 <__i_vfprintf+0x1f8>
    27dc:	f1dd8ee3          	beq	s11,t4,26f8 <__i_vfprintf+0x120>
    27e0:	f1ed8ce3          	beq	s11,t5,26f8 <__i_vfprintf+0x120>
    27e4:	000d5a63          	bgez	s10,27f8 <__i_vfprintf+0x220>
    27e8:	fbf47413          	andi	s0,s0,-65
    27ec:	01041413          	slli	s0,s0,0x10
    27f0:	01045413          	srli	s0,s0,0x10
    27f4:	00000d13          	li	s10,0
    27f8:	020de693          	ori	a3,s11,32
    27fc:	f9b68613          	addi	a2,a3,-101
    2800:	0ff67613          	andi	a2,a2,255
    2804:	00200593          	li	a1,2
    2808:	00c5f663          	bgeu	a1,a2,2814 <__i_vfprintf+0x23c>
    280c:	06100613          	li	a2,97
    2810:	02c69e63          	bne	a3,a2,284c <__i_vfprintf+0x274>
    2814:	00748493          	addi	s1,s1,7
    2818:	00412d83          	lw	s11,4(sp)
    281c:	ff84f493          	andi	s1,s1,-8
    2820:	00848493          	addi	s1,s1,8
    2824:	00700b13          	li	s6,7
    2828:	00847413          	andi	s0,s0,8
    282c:	08040e63          	beqz	s0,28c8 <__i_vfprintf+0x2f0>
    2830:	00000413          	li	s0,0
    2834:	008c07b3          	add	a5,s8,s0
    2838:	088b1c63          	bne	s6,s0,28d0 <__i_vfprintf+0x2f8>
    283c:	41690933          	sub	s2,s2,s6
    2840:	3800006f          	j	2bc0 <__i_vfprintf+0x5e8>
    2844:	00068d13          	mv	s10,a3
    2848:	eb1ff06f          	j	26f8 <__i_vfprintf+0x120>
    284c:	06300613          	li	a2,99
    2850:	00cd9e63          	bne	s11,a2,286c <__i_vfprintf+0x294>
    2854:	0004a703          	lw	a4,0(s1)
    2858:	00100b13          	li	s6,1
    285c:	00448493          	addi	s1,s1,4
    2860:	00e10c23          	sb	a4,24(sp)
    2864:	000a8d93          	mv	s11,s5
    2868:	fc1ff06f          	j	2828 <__i_vfprintf+0x250>
    286c:	07300613          	li	a2,115
    2870:	0acd9e63          	bne	s11,a2,292c <__i_vfprintf+0x354>
    2874:	0004ad83          	lw	s11,0(s1)
    2878:	00448c93          	addi	s9,s1,4
    287c:	000d9463          	bnez	s11,2884 <__i_vfprintf+0x2ac>
    2880:	00812d83          	lw	s11,8(sp)
    2884:	04047693          	andi	a3,s0,64
    2888:	fff00593          	li	a1,-1
    288c:	00068463          	beqz	a3,2894 <__i_vfprintf+0x2bc>
    2890:	000d0593          	mv	a1,s10
    2894:	000d8513          	mv	a0,s11
    2898:	929ff0ef          	jal	ra,21c0 <strnlen>
    289c:	00050b13          	mv	s6,a0
    28a0:	000c8493          	mv	s1,s9
    28a4:	f85ff06f          	j	2828 <__i_vfprintf+0x250>
    28a8:	00098593          	mv	a1,s3
    28ac:	02000513          	li	a0,32
    28b0:	000a00e7          	jalr	s4
    28b4:	02054a63          	bltz	a0,28e8 <__i_vfprintf+0x310>
    28b8:	fff90913          	addi	s2,s2,-1
    28bc:	41240c33          	sub	s8,s0,s2
    28c0:	ff2b64e3          	bltu	s6,s2,28a8 <__i_vfprintf+0x2d0>
    28c4:	f6dff06f          	j	2830 <__i_vfprintf+0x258>
    28c8:	012c0433          	add	s0,s8,s2
    28cc:	ff1ff06f          	j	28bc <__i_vfprintf+0x2e4>
    28d0:	008d87b3          	add	a5,s11,s0
    28d4:	0007c503          	lbu	a0,0(a5)
    28d8:	00098593          	mv	a1,s3
    28dc:	00140413          	addi	s0,s0,1
    28e0:	000a00e7          	jalr	s4
    28e4:	f40558e3          	bgez	a0,2834 <__i_vfprintf+0x25c>
    28e8:	fff00c13          	li	s8,-1
    28ec:	06c12083          	lw	ra,108(sp)
    28f0:	06812403          	lw	s0,104(sp)
    28f4:	06412483          	lw	s1,100(sp)
    28f8:	06012903          	lw	s2,96(sp)
    28fc:	05c12983          	lw	s3,92(sp)
    2900:	05812a03          	lw	s4,88(sp)
    2904:	05412a83          	lw	s5,84(sp)
    2908:	05012b03          	lw	s6,80(sp)
    290c:	04c12b83          	lw	s7,76(sp)
    2910:	04412c83          	lw	s9,68(sp)
    2914:	04012d03          	lw	s10,64(sp)
    2918:	03c12d83          	lw	s11,60(sp)
    291c:	000c0513          	mv	a0,s8
    2920:	04812c03          	lw	s8,72(sp)
    2924:	07010113          	addi	sp,sp,112
    2928:	00008067          	ret
    292c:	06400613          	li	a2,100
    2930:	00cd8663          	beq	s11,a2,293c <__i_vfprintf+0x364>
    2934:	06900613          	li	a2,105
    2938:	0ccd9063          	bne	s11,a2,29f8 <__i_vfprintf+0x420>
    293c:	08047693          	andi	a3,s0,128
    2940:	08068463          	beqz	a3,29c8 <__i_vfprintf+0x3f0>
    2944:	20047693          	andi	a3,s0,512
    2948:	06068863          	beqz	a3,29b8 <__i_vfprintf+0x3e0>
    294c:	00748493          	addi	s1,s1,7
    2950:	ff84f493          	andi	s1,s1,-8
    2954:	0004a503          	lw	a0,0(s1)
    2958:	0044a583          	lw	a1,4(s1)
    295c:	00848b13          	addi	s6,s1,8
    2960:	0005dc63          	bgez	a1,2978 <__i_vfprintf+0x3a0>
    2964:	00a03633          	snez	a2,a0
    2968:	40b006b3          	neg	a3,a1
    296c:	40c685b3          	sub	a1,a3,a2
    2970:	40a00533          	neg	a0,a0
    2974:	40046413          	ori	s0,s0,1024
    2978:	fef47813          	andi	a6,s0,-17
    297c:	01081813          	slli	a6,a6,0x10
    2980:	00b566b3          	or	a3,a0,a1
    2984:	01085813          	srli	a6,a6,0x10
    2988:	00069a63          	bnez	a3,299c <__i_vfprintf+0x3c4>
    298c:	04047413          	andi	s0,s0,64
    2990:	00040663          	beqz	s0,299c <__i_vfprintf+0x3c4>
    2994:	00000c93          	li	s9,0
    2998:	160d0863          	beqz	s10,2b08 <__i_vfprintf+0x530>
    299c:	01012623          	sw	a6,12(sp)
    29a0:	00a00693          	li	a3,10
    29a4:	000a8613          	mv	a2,s5
    29a8:	b3dff0ef          	jal	ra,24e4 <__ultoa_invert>
    29ac:	00c12803          	lw	a6,12(sp)
    29b0:	41550cb3          	sub	s9,a0,s5
    29b4:	1540006f          	j	2b08 <__i_vfprintf+0x530>
    29b8:	0004a503          	lw	a0,0(s1)
    29bc:	00448b13          	addi	s6,s1,4
    29c0:	41f55593          	srai	a1,a0,0x1f
    29c4:	f9dff06f          	j	2960 <__i_vfprintf+0x388>
    29c8:	10047693          	andi	a3,s0,256
    29cc:	0004a503          	lw	a0,0(s1)
    29d0:	00448b13          	addi	s6,s1,4
    29d4:	fe0686e3          	beqz	a3,29c0 <__i_vfprintf+0x3e8>
    29d8:	20047693          	andi	a3,s0,512
    29dc:	00068863          	beqz	a3,29ec <__i_vfprintf+0x414>
    29e0:	01851513          	slli	a0,a0,0x18
    29e4:	41855513          	srai	a0,a0,0x18
    29e8:	fd9ff06f          	j	29c0 <__i_vfprintf+0x3e8>
    29ec:	01051513          	slli	a0,a0,0x10
    29f0:	41055513          	srai	a0,a0,0x10
    29f4:	fcdff06f          	j	29c0 <__i_vfprintf+0x3e8>
    29f8:	07500613          	li	a2,117
    29fc:	04cd9a63          	bne	s11,a2,2a50 <__i_vfprintf+0x478>
    2a00:	fef47413          	andi	s0,s0,-17
    2a04:	01041413          	slli	s0,s0,0x10
    2a08:	01045413          	srli	s0,s0,0x10
    2a0c:	00a00693          	li	a3,10
    2a10:	08047613          	andi	a2,s0,128
    2a14:	0a060663          	beqz	a2,2ac0 <__i_vfprintf+0x4e8>
    2a18:	20047613          	andi	a2,s0,512
    2a1c:	08060a63          	beqz	a2,2ab0 <__i_vfprintf+0x4d8>
    2a20:	00748493          	addi	s1,s1,7
    2a24:	ff84f493          	andi	s1,s1,-8
    2a28:	0004a503          	lw	a0,0(s1)
    2a2c:	0044a583          	lw	a1,4(s1)
    2a30:	00848b13          	addi	s6,s1,8
    2a34:	00b56633          	or	a2,a0,a1
    2a38:	0a060a63          	beqz	a2,2aec <__i_vfprintf+0x514>
    2a3c:	ff947413          	andi	s0,s0,-7
    2a40:	01041813          	slli	a6,s0,0x10
    2a44:	01085813          	srli	a6,a6,0x10
    2a48:	01012623          	sw	a6,12(sp)
    2a4c:	f59ff06f          	j	29a4 <__i_vfprintf+0x3cc>
    2a50:	06f00613          	li	a2,111
    2a54:	04cd8863          	beq	s11,a2,2aa4 <__i_vfprintf+0x4cc>
    2a58:	07000613          	li	a2,112
    2a5c:	00cd9a63          	bne	s11,a2,2a70 <__i_vfprintf+0x498>
    2a60:	01046413          	ori	s0,s0,16
    2a64:	01000693          	li	a3,16
    2a68:	07800d93          	li	s11,120
    2a6c:	fa5ff06f          	j	2a10 <__i_vfprintf+0x438>
    2a70:	07800613          	li	a2,120
    2a74:	00c69c63          	bne	a3,a2,2a8c <__i_vfprintf+0x4b4>
    2a78:	05800613          	li	a2,88
    2a7c:	01000693          	li	a3,16
    2a80:	f8cd98e3          	bne	s11,a2,2a10 <__i_vfprintf+0x438>
    2a84:	21000693          	li	a3,528
    2a88:	f89ff06f          	j	2a10 <__i_vfprintf+0x438>
    2a8c:	00098593          	mv	a1,s3
    2a90:	02500513          	li	a0,37
    2a94:	000a00e7          	jalr	s4
    2a98:	e40548e3          	bltz	a0,28e8 <__i_vfprintf+0x310>
    2a9c:	002c0c13          	addi	s8,s8,2
    2aa0:	bd9ff06f          	j	2678 <__i_vfprintf+0xa0>
    2aa4:	00800693          	li	a3,8
    2aa8:	00000d93          	li	s11,0
    2aac:	f65ff06f          	j	2a10 <__i_vfprintf+0x438>
    2ab0:	0004a503          	lw	a0,0(s1)
    2ab4:	00448b13          	addi	s6,s1,4
    2ab8:	00000593          	li	a1,0
    2abc:	f79ff06f          	j	2a34 <__i_vfprintf+0x45c>
    2ac0:	10047613          	andi	a2,s0,256
    2ac4:	0004a503          	lw	a0,0(s1)
    2ac8:	00448b13          	addi	s6,s1,4
    2acc:	fe0606e3          	beqz	a2,2ab8 <__i_vfprintf+0x4e0>
    2ad0:	20047613          	andi	a2,s0,512
    2ad4:	00060663          	beqz	a2,2ae0 <__i_vfprintf+0x508>
    2ad8:	0ff57513          	andi	a0,a0,255
    2adc:	fddff06f          	j	2ab8 <__i_vfprintf+0x4e0>
    2ae0:	01051513          	slli	a0,a0,0x10
    2ae4:	01055513          	srli	a0,a0,0x10
    2ae8:	fd1ff06f          	j	2ab8 <__i_vfprintf+0x4e0>
    2aec:	fe947813          	andi	a6,s0,-23
    2af0:	01081813          	slli	a6,a6,0x10
    2af4:	04047413          	andi	s0,s0,64
    2af8:	01085813          	srli	a6,a6,0x10
    2afc:	f40406e3          	beqz	s0,2a48 <__i_vfprintf+0x470>
    2b00:	00000c93          	li	s9,0
    2b04:	f40d12e3          	bnez	s10,2a48 <__i_vfprintf+0x470>
    2b08:	04087693          	andi	a3,a6,64
    2b0c:	04068063          	beqz	a3,2b4c <__i_vfprintf+0x574>
    2b10:	ffe87413          	andi	s0,a6,-2
    2b14:	01041413          	slli	s0,s0,0x10
    2b18:	01045413          	srli	s0,s0,0x10
    2b1c:	000c8493          	mv	s1,s9
    2b20:	01acdc63          	bge	s9,s10,2b38 <__i_vfprintf+0x560>
    2b24:	000d0493          	mv	s1,s10
    2b28:	000d9863          	bnez	s11,2b38 <__i_vfprintf+0x560>
    2b2c:	fee87413          	andi	s0,a6,-18
    2b30:	01041413          	slli	s0,s0,0x10
    2b34:	01045413          	srli	s0,s0,0x10
    2b38:	01047693          	andi	a3,s0,16
    2b3c:	08068863          	beqz	a3,2bcc <__i_vfprintf+0x5f4>
    2b40:	000d9c63          	bnez	s11,2b58 <__i_vfprintf+0x580>
    2b44:	00148493          	addi	s1,s1,1
    2b48:	0140006f          	j	2b5c <__i_vfprintf+0x584>
    2b4c:	000c8493          	mv	s1,s9
    2b50:	00080413          	mv	s0,a6
    2b54:	fe5ff06f          	j	2b38 <__i_vfprintf+0x560>
    2b58:	00248493          	addi	s1,s1,2
    2b5c:	00847593          	andi	a1,s0,8
    2b60:	02059063          	bnez	a1,2b80 <__i_vfprintf+0x5a8>
    2b64:	00147593          	andi	a1,s0,1
    2b68:	08058e63          	beqz	a1,2c04 <__i_vfprintf+0x62c>
    2b6c:	000c8d13          	mv	s10,s9
    2b70:	0124d863          	bge	s1,s2,2b80 <__i_vfprintf+0x5a8>
    2b74:	409904b3          	sub	s1,s2,s1
    2b78:	01948d33          	add	s10,s1,s9
    2b7c:	00090493          	mv	s1,s2
    2b80:	0a068263          	beqz	a3,2c24 <__i_vfprintf+0x64c>
    2b84:	00098593          	mv	a1,s3
    2b88:	03000513          	li	a0,48
    2b8c:	000a00e7          	jalr	s4
    2b90:	d4054ce3          	bltz	a0,28e8 <__i_vfprintf+0x310>
    2b94:	060d9c63          	bnez	s11,2c0c <__i_vfprintf+0x634>
    2b98:	001c0c13          	addi	s8,s8,1
    2b9c:	01ac0db3          	add	s11,s8,s10
    2ba0:	418d8733          	sub	a4,s11,s8
    2ba4:	0aecc863          	blt	s9,a4,2c54 <__i_vfprintf+0x67c>
    2ba8:	000c8413          	mv	s0,s9
    2bac:	018c8db3          	add	s11,s9,s8
    2bb0:	408d87b3          	sub	a5,s11,s0
    2bb4:	0a041c63          	bnez	s0,2c6c <__i_vfprintf+0x694>
    2bb8:	40990933          	sub	s2,s2,s1
    2bbc:	000b0493          	mv	s1,s6
    2bc0:	00078c13          	mv	s8,a5
    2bc4:	00f90933          	add	s2,s2,a5
    2bc8:	0d40006f          	j	2c9c <__i_vfprintf+0x6c4>
    2bcc:	40647593          	andi	a1,s0,1030
    2bd0:	f80586e3          	beqz	a1,2b5c <__i_vfprintf+0x584>
    2bd4:	f71ff06f          	j	2b44 <__i_vfprintf+0x56c>
    2bd8:	00098593          	mv	a1,s3
    2bdc:	02000513          	li	a0,32
    2be0:	00d12623          	sw	a3,12(sp)
    2be4:	000a00e7          	jalr	s4
    2be8:	d00540e3          	bltz	a0,28e8 <__i_vfprintf+0x310>
    2bec:	00c12683          	lw	a3,12(sp)
    2bf0:	00148493          	addi	s1,s1,1
    2bf4:	009c07b3          	add	a5,s8,s1
    2bf8:	ff24c0e3          	blt	s1,s2,2bd8 <__i_vfprintf+0x600>
    2bfc:	00078c13          	mv	s8,a5
    2c00:	f81ff06f          	j	2b80 <__i_vfprintf+0x5a8>
    2c04:	409c0c33          	sub	s8,s8,s1
    2c08:	fedff06f          	j	2bf4 <__i_vfprintf+0x61c>
    2c0c:	002c0c13          	addi	s8,s8,2
    2c10:	00098593          	mv	a1,s3
    2c14:	000d8513          	mv	a0,s11
    2c18:	000a00e7          	jalr	s4
    2c1c:	f80550e3          	bgez	a0,2b9c <__i_vfprintf+0x5c4>
    2c20:	cc9ff06f          	j	28e8 <__i_vfprintf+0x310>
    2c24:	40647693          	andi	a3,s0,1030
    2c28:	f6068ae3          	beqz	a3,2b9c <__i_vfprintf+0x5c4>
    2c2c:	00247693          	andi	a3,s0,2
    2c30:	02000513          	li	a0,32
    2c34:	00068463          	beqz	a3,2c3c <__i_vfprintf+0x664>
    2c38:	02b00513          	li	a0,43
    2c3c:	40047813          	andi	a6,s0,1024
    2c40:	00080463          	beqz	a6,2c48 <__i_vfprintf+0x670>
    2c44:	02d00513          	li	a0,45
    2c48:	001c0c13          	addi	s8,s8,1
    2c4c:	00098593          	mv	a1,s3
    2c50:	fc9ff06f          	j	2c18 <__i_vfprintf+0x640>
    2c54:	00098593          	mv	a1,s3
    2c58:	03000513          	li	a0,48
    2c5c:	001c0c13          	addi	s8,s8,1
    2c60:	000a00e7          	jalr	s4
    2c64:	f2055ee3          	bgez	a0,2ba0 <__i_vfprintf+0x5c8>
    2c68:	c81ff06f          	j	28e8 <__i_vfprintf+0x310>
    2c6c:	fff40413          	addi	s0,s0,-1
    2c70:	008a87b3          	add	a5,s5,s0
    2c74:	0007c503          	lbu	a0,0(a5)
    2c78:	00098593          	mv	a1,s3
    2c7c:	000a00e7          	jalr	s4
    2c80:	f20558e3          	bgez	a0,2bb0 <__i_vfprintf+0x5d8>
    2c84:	c65ff06f          	j	28e8 <__i_vfprintf+0x310>
    2c88:	00098593          	mv	a1,s3
    2c8c:	02000513          	li	a0,32
    2c90:	001c0c13          	addi	s8,s8,1
    2c94:	000a00e7          	jalr	s4
    2c98:	c40548e3          	bltz	a0,28e8 <__i_vfprintf+0x310>
    2c9c:	41890733          	sub	a4,s2,s8
    2ca0:	fee044e3          	bgtz	a4,2c88 <__i_vfprintf+0x6b0>
    2ca4:	9e5ff06f          	j	2688 <__i_vfprintf+0xb0>

00002ca8 <litex_getc>:
    2ca8:	ff010113          	addi	sp,sp,-16
    2cac:	00112623          	sw	ra,12(sp)
    2cb0:	348010ef          	jal	ra,3ff8 <uart_read_nonblock>
    2cb4:	fe050ee3          	beqz	a0,2cb0 <litex_getc+0x8>
    2cb8:	2ec010ef          	jal	ra,3fa4 <uart_read>
    2cbc:	00c12083          	lw	ra,12(sp)
    2cc0:	01010113          	addi	sp,sp,16
    2cc4:	00008067          	ret

00002cc8 <litex_putc>:
    2cc8:	ff010113          	addi	sp,sp,-16
    2ccc:	00812423          	sw	s0,8(sp)
    2cd0:	00112623          	sw	ra,12(sp)
    2cd4:	00050413          	mv	s0,a0
    2cd8:	33c010ef          	jal	ra,4014 <uart_write>
    2cdc:	00a00793          	li	a5,10
    2ce0:	00f41863          	bne	s0,a5,2cf0 <litex_putc+0x28>
    2ce4:	00000593          	li	a1,0
    2ce8:	00d00513          	li	a0,13
    2cec:	fddff0ef          	jal	ra,2cc8 <litex_putc>
    2cf0:	00c12083          	lw	ra,12(sp)
    2cf4:	00040513          	mv	a0,s0
    2cf8:	00812403          	lw	s0,8(sp)
    2cfc:	01010113          	addi	sp,sp,16
    2d00:	00008067          	ret

00002d04 <__divdi3>:
    2d04:	41f5d893          	srai	a7,a1,0x1f
    2d08:	41f6d313          	srai	t1,a3,0x1f
    2d0c:	00664733          	xor	a4,a2,t1
    2d10:	011547b3          	xor	a5,a0,a7
    2d14:	40670633          	sub	a2,a4,t1
    2d18:	0115c5b3          	xor	a1,a1,a7
    2d1c:	0066c6b3          	xor	a3,a3,t1
    2d20:	41178533          	sub	a0,a5,a7
    2d24:	00c73833          	sltu	a6,a4,a2
    2d28:	00a7b7b3          	sltu	a5,a5,a0
    2d2c:	406686b3          	sub	a3,a3,t1
    2d30:	411585b3          	sub	a1,a1,a7
    2d34:	ff010113          	addi	sp,sp,-16
    2d38:	40f585b3          	sub	a1,a1,a5
    2d3c:	00000713          	li	a4,0
    2d40:	410686b3          	sub	a3,a3,a6
    2d44:	00812423          	sw	s0,8(sp)
    2d48:	00112623          	sw	ra,12(sp)
    2d4c:	0068c433          	xor	s0,a7,t1
    2d50:	02c000ef          	jal	ra,2d7c <__udivmoddi4>
    2d54:	00a447b3          	xor	a5,s0,a0
    2d58:	00b445b3          	xor	a1,s0,a1
    2d5c:	40878533          	sub	a0,a5,s0
    2d60:	00c12083          	lw	ra,12(sp)
    2d64:	408585b3          	sub	a1,a1,s0
    2d68:	00812403          	lw	s0,8(sp)
    2d6c:	00a7b7b3          	sltu	a5,a5,a0
    2d70:	40f585b3          	sub	a1,a1,a5
    2d74:	01010113          	addi	sp,sp,16
    2d78:	00008067          	ret

00002d7c <__udivmoddi4>:
    2d7c:	fe010113          	addi	sp,sp,-32
    2d80:	00812c23          	sw	s0,24(sp)
    2d84:	01212823          	sw	s2,16(sp)
    2d88:	01312623          	sw	s3,12(sp)
    2d8c:	01412423          	sw	s4,8(sp)
    2d90:	01512223          	sw	s5,4(sp)
    2d94:	00112e23          	sw	ra,28(sp)
    2d98:	00912a23          	sw	s1,20(sp)
    2d9c:	00050413          	mv	s0,a0
    2da0:	00058a93          	mv	s5,a1
    2da4:	00060a13          	mv	s4,a2
    2da8:	00068993          	mv	s3,a3
    2dac:	00070913          	mv	s2,a4
    2db0:	02059c63          	bnez	a1,2de8 <__udivmoddi4+0x6c>
    2db4:	02069063          	bnez	a3,2dd4 <__udivmoddi4+0x58>
    2db8:	00070863          	beqz	a4,2dc8 <__udivmoddi4+0x4c>
    2dbc:	02c577b3          	remu	a5,a0,a2
    2dc0:	00072223          	sw	zero,4(a4)
    2dc4:	00f72023          	sw	a5,0(a4)
    2dc8:	03445433          	divu	s0,s0,s4
    2dcc:	00000a93          	li	s5,0
    2dd0:	1100006f          	j	2ee0 <__udivmoddi4+0x164>
    2dd4:	00070663          	beqz	a4,2de0 <__udivmoddi4+0x64>
    2dd8:	00a92023          	sw	a0,0(s2)
    2ddc:	00072223          	sw	zero,4(a4)
    2de0:	00000413          	li	s0,0
    2de4:	0fc0006f          	j	2ee0 <__udivmoddi4+0x164>
    2de8:	0a061863          	bnez	a2,2e98 <__udivmoddi4+0x11c>
    2dec:	00069463          	bnez	a3,2df4 <__udivmoddi4+0x78>
    2df0:	00100073          	ebreak
    2df4:	00051e63          	bnez	a0,2e10 <__udivmoddi4+0x94>
    2df8:	00070863          	beqz	a4,2e08 <__udivmoddi4+0x8c>
    2dfc:	02d5f7b3          	remu	a5,a1,a3
    2e00:	00072023          	sw	zero,0(a4)
    2e04:	00f72223          	sw	a5,4(a4)
    2e08:	033ad433          	divu	s0,s5,s3
    2e0c:	fc1ff06f          	j	2dcc <__udivmoddi4+0x50>
    2e10:	fff68793          	addi	a5,a3,-1
    2e14:	00d7f733          	and	a4,a5,a3
    2e18:	02071263          	bnez	a4,2e3c <__udivmoddi4+0xc0>
    2e1c:	00090863          	beqz	s2,2e2c <__udivmoddi4+0xb0>
    2e20:	00b7f7b3          	and	a5,a5,a1
    2e24:	00a92023          	sw	a0,0(s2)
    2e28:	00f92223          	sw	a5,4(s2)
    2e2c:	00098513          	mv	a0,s3
    2e30:	2cc000ef          	jal	ra,30fc <__ctzsi2>
    2e34:	00aad433          	srl	s0,s5,a0
    2e38:	f95ff06f          	j	2dcc <__udivmoddi4+0x50>
    2e3c:	00068513          	mv	a0,a3
    2e40:	224000ef          	jal	ra,3064 <__clzsi2>
    2e44:	00050493          	mv	s1,a0
    2e48:	000a8513          	mv	a0,s5
    2e4c:	218000ef          	jal	ra,3064 <__clzsi2>
    2e50:	40a48533          	sub	a0,s1,a0
    2e54:	01e00793          	li	a5,30
    2e58:	00a7fc63          	bgeu	a5,a0,2e70 <__udivmoddi4+0xf4>
    2e5c:	00090663          	beqz	s2,2e68 <__udivmoddi4+0xec>
    2e60:	00892023          	sw	s0,0(s2)
    2e64:	01592223          	sw	s5,4(s2)
    2e68:	00000413          	li	s0,0
    2e6c:	f61ff06f          	j	2dcc <__udivmoddi4+0x50>
    2e70:	00150613          	addi	a2,a0,1
    2e74:	02000693          	li	a3,32
    2e78:	40c686b3          	sub	a3,a3,a2
    2e7c:	00000313          	li	t1,0
    2e80:	00d41833          	sll	a6,s0,a3
    2e84:	00cade33          	srl	t3,s5,a2
    2e88:	00da95b3          	sll	a1,s5,a3
    2e8c:	00c45433          	srl	s0,s0,a2
    2e90:	0085e7b3          	or	a5,a1,s0
    2e94:	0e40006f          	j	2f78 <__udivmoddi4+0x1fc>
    2e98:	16069c63          	bnez	a3,3010 <__udivmoddi4+0x294>
    2e9c:	fff60793          	addi	a5,a2,-1
    2ea0:	00c7f733          	and	a4,a5,a2
    2ea4:	06071463          	bnez	a4,2f0c <__udivmoddi4+0x190>
    2ea8:	00090863          	beqz	s2,2eb8 <__udivmoddi4+0x13c>
    2eac:	00a7f7b3          	and	a5,a5,a0
    2eb0:	00f92023          	sw	a5,0(s2)
    2eb4:	00092223          	sw	zero,4(s2)
    2eb8:	00100793          	li	a5,1
    2ebc:	02fa0263          	beq	s4,a5,2ee0 <__udivmoddi4+0x164>
    2ec0:	000a0513          	mv	a0,s4
    2ec4:	238000ef          	jal	ra,30fc <__ctzsi2>
    2ec8:	02000793          	li	a5,32
    2ecc:	40a787b3          	sub	a5,a5,a0
    2ed0:	00fa97b3          	sll	a5,s5,a5
    2ed4:	00a45433          	srl	s0,s0,a0
    2ed8:	0087e433          	or	s0,a5,s0
    2edc:	00aadab3          	srl	s5,s5,a0
    2ee0:	01c12083          	lw	ra,28(sp)
    2ee4:	00040513          	mv	a0,s0
    2ee8:	01812403          	lw	s0,24(sp)
    2eec:	01412483          	lw	s1,20(sp)
    2ef0:	01012903          	lw	s2,16(sp)
    2ef4:	00c12983          	lw	s3,12(sp)
    2ef8:	00812a03          	lw	s4,8(sp)
    2efc:	000a8593          	mv	a1,s5
    2f00:	00412a83          	lw	s5,4(sp)
    2f04:	02010113          	addi	sp,sp,32
    2f08:	00008067          	ret
    2f0c:	00060513          	mv	a0,a2
    2f10:	154000ef          	jal	ra,3064 <__clzsi2>
    2f14:	00050493          	mv	s1,a0
    2f18:	000a8513          	mv	a0,s5
    2f1c:	148000ef          	jal	ra,3064 <__clzsi2>
    2f20:	40a487b3          	sub	a5,s1,a0
    2f24:	02178613          	addi	a2,a5,33
    2f28:	02000713          	li	a4,32
    2f2c:	00000313          	li	t1,0
    2f30:	10e60863          	beq	a2,a4,3040 <__udivmoddi4+0x2c4>
    2f34:	01f00693          	li	a3,31
    2f38:	00c6ee63          	bltu	a3,a2,2f54 <__udivmoddi4+0x1d8>
    2f3c:	40c70733          	sub	a4,a4,a2
    2f40:	00000313          	li	t1,0
    2f44:	00e41833          	sll	a6,s0,a4
    2f48:	00cade33          	srl	t3,s5,a2
    2f4c:	00ea95b3          	sll	a1,s5,a4
    2f50:	f3dff06f          	j	2e8c <__udivmoddi4+0x110>
    2f54:	04000893          	li	a7,64
    2f58:	40c888b3          	sub	a7,a7,a2
    2f5c:	00178793          	addi	a5,a5,1
    2f60:	01141333          	sll	t1,s0,a7
    2f64:	00f45433          	srl	s0,s0,a5
    2f68:	011a98b3          	sll	a7,s5,a7
    2f6c:	0088e833          	or	a6,a7,s0
    2f70:	00000e13          	li	t3,0
    2f74:	00fad7b3          	srl	a5,s5,a5
    2f78:	00000513          	li	a0,0
    2f7c:	01f7d693          	srli	a3,a5,0x1f
    2f80:	001e1713          	slli	a4,t3,0x1
    2f84:	00d76e33          	or	t3,a4,a3
    2f88:	00179793          	slli	a5,a5,0x1
    2f8c:	01f85713          	srli	a4,a6,0x1f
    2f90:	00e7e7b3          	or	a5,a5,a4
    2f94:	fff7c693          	not	a3,a5
    2f98:	01f35713          	srli	a4,t1,0x1f
    2f9c:	00181813          	slli	a6,a6,0x1
    2fa0:	00131413          	slli	s0,t1,0x1
    2fa4:	00e86833          	or	a6,a6,a4
    2fa8:	00a46333          	or	t1,s0,a0
    2fac:	fffe4713          	not	a4,t3
    2fb0:	01468533          	add	a0,a3,s4
    2fb4:	00d53533          	sltu	a0,a0,a3
    2fb8:	01370733          	add	a4,a4,s3
    2fbc:	00e50533          	add	a0,a0,a4
    2fc0:	41f55713          	srai	a4,a0,0x1f
    2fc4:	014776b3          	and	a3,a4,s4
    2fc8:	40d786b3          	sub	a3,a5,a3
    2fcc:	01377733          	and	a4,a4,s3
    2fd0:	00d7b5b3          	sltu	a1,a5,a3
    2fd4:	40ee0733          	sub	a4,t3,a4
    2fd8:	fff60613          	addi	a2,a2,-1
    2fdc:	01f55513          	srli	a0,a0,0x1f
    2fe0:	00068793          	mv	a5,a3
    2fe4:	40b70e33          	sub	t3,a4,a1
    2fe8:	f8061ae3          	bnez	a2,2f7c <__udivmoddi4+0x200>
    2fec:	01f35593          	srli	a1,t1,0x1f
    2ff0:	00181813          	slli	a6,a6,0x1
    2ff4:	00131413          	slli	s0,t1,0x1
    2ff8:	00a46433          	or	s0,s0,a0
    2ffc:	0105eab3          	or	s5,a1,a6
    3000:	ee0900e3          	beqz	s2,2ee0 <__udivmoddi4+0x164>
    3004:	00d92023          	sw	a3,0(s2)
    3008:	01c92223          	sw	t3,4(s2)
    300c:	ed5ff06f          	j	2ee0 <__udivmoddi4+0x164>
    3010:	00068513          	mv	a0,a3
    3014:	050000ef          	jal	ra,3064 <__clzsi2>
    3018:	00050493          	mv	s1,a0
    301c:	000a8513          	mv	a0,s5
    3020:	044000ef          	jal	ra,3064 <__clzsi2>
    3024:	40a48533          	sub	a0,s1,a0
    3028:	01f00793          	li	a5,31
    302c:	e2a7e8e3          	bltu	a5,a0,2e5c <__udivmoddi4+0xe0>
    3030:	00150613          	addi	a2,a0,1
    3034:	02000893          	li	a7,32
    3038:	00000313          	li	t1,0
    303c:	01161a63          	bne	a2,a7,3050 <__udivmoddi4+0x2d4>
    3040:	00040813          	mv	a6,s0
    3044:	00000e13          	li	t3,0
    3048:	000a8793          	mv	a5,s5
    304c:	f2dff06f          	j	2f78 <__udivmoddi4+0x1fc>
    3050:	40c888b3          	sub	a7,a7,a2
    3054:	01141833          	sll	a6,s0,a7
    3058:	00cade33          	srl	t3,s5,a2
    305c:	011a95b3          	sll	a1,s5,a7
    3060:	e2dff06f          	j	2e8c <__udivmoddi4+0x110>

00003064 <__clzsi2>:
    3064:	ffff0737          	lui	a4,0xffff0
    3068:	00e57733          	and	a4,a0,a4
    306c:	00173713          	seqz	a4,a4
    3070:	00471713          	slli	a4,a4,0x4
    3074:	01000793          	li	a5,16
    3078:	40e787b3          	sub	a5,a5,a4
    307c:	00f557b3          	srl	a5,a0,a5
    3080:	00010537          	lui	a0,0x10
    3084:	f0050513          	addi	a0,a0,-256 # ff00 <_edata_rom+0x7d8c>
    3088:	00a7f533          	and	a0,a5,a0
    308c:	00153513          	seqz	a0,a0
    3090:	00351513          	slli	a0,a0,0x3
    3094:	00800693          	li	a3,8
    3098:	40a686b3          	sub	a3,a3,a0
    309c:	00d7d7b3          	srl	a5,a5,a3
    30a0:	0f07f693          	andi	a3,a5,240
    30a4:	0016b693          	seqz	a3,a3
    30a8:	00269693          	slli	a3,a3,0x2
    30ac:	00e50533          	add	a0,a0,a4
    30b0:	00400713          	li	a4,4
    30b4:	40d70733          	sub	a4,a4,a3
    30b8:	00e7d7b3          	srl	a5,a5,a4
    30bc:	00a68533          	add	a0,a3,a0
    30c0:	00c7f693          	andi	a3,a5,12
    30c4:	0016b693          	seqz	a3,a3
    30c8:	00169693          	slli	a3,a3,0x1
    30cc:	00200613          	li	a2,2
    30d0:	40d60733          	sub	a4,a2,a3
    30d4:	00e7d7b3          	srl	a5,a5,a4
    30d8:	0017d713          	srli	a4,a5,0x1
    30dc:	00174713          	xori	a4,a4,1
    30e0:	00177713          	andi	a4,a4,1
    30e4:	40e00733          	neg	a4,a4
    30e8:	40f607b3          	sub	a5,a2,a5
    30ec:	00f777b3          	and	a5,a4,a5
    30f0:	00a68533          	add	a0,a3,a0
    30f4:	00a78533          	add	a0,a5,a0
    30f8:	00008067          	ret

000030fc <__ctzsi2>:
    30fc:	01051693          	slli	a3,a0,0x10
    3100:	0106d693          	srli	a3,a3,0x10
    3104:	0016b693          	seqz	a3,a3
    3108:	00469693          	slli	a3,a3,0x4
    310c:	00d557b3          	srl	a5,a0,a3
    3110:	0ff7f713          	andi	a4,a5,255
    3114:	00173713          	seqz	a4,a4
    3118:	00371713          	slli	a4,a4,0x3
    311c:	00e7d7b3          	srl	a5,a5,a4
    3120:	00d706b3          	add	a3,a4,a3
    3124:	00f7f713          	andi	a4,a5,15
    3128:	00173713          	seqz	a4,a4
    312c:	00271713          	slli	a4,a4,0x2
    3130:	00e7d7b3          	srl	a5,a5,a4
    3134:	00d706b3          	add	a3,a4,a3
    3138:	0037f713          	andi	a4,a5,3
    313c:	00173713          	seqz	a4,a4
    3140:	00171713          	slli	a4,a4,0x1
    3144:	00e7d7b3          	srl	a5,a5,a4
    3148:	0017d513          	srli	a0,a5,0x1
    314c:	fff7c793          	not	a5,a5
    3150:	00157613          	andi	a2,a0,1
    3154:	0017f793          	andi	a5,a5,1
    3158:	00200513          	li	a0,2
    315c:	40c50533          	sub	a0,a0,a2
    3160:	40f007b3          	neg	a5,a5
    3164:	00f57533          	and	a0,a0,a5
    3168:	00d70733          	add	a4,a4,a3
    316c:	00e50533          	add	a0,a0,a4
    3170:	00008067          	ret

00003174 <__udivdi3>:
    3174:	00000713          	li	a4,0
    3178:	c05ff06f          	j	2d7c <__udivmoddi4>

0000317c <__umoddi3>:
    317c:	fe010113          	addi	sp,sp,-32
    3180:	00810713          	addi	a4,sp,8
    3184:	00112e23          	sw	ra,28(sp)
    3188:	bf5ff0ef          	jal	ra,2d7c <__udivmoddi4>
    318c:	01c12083          	lw	ra,28(sp)
    3190:	00812503          	lw	a0,8(sp)
    3194:	00c12583          	lw	a1,12(sp)
    3198:	02010113          	addi	sp,sp,32
    319c:	00008067          	ret

000031a0 <__moddi3>:
    31a0:	fe010113          	addi	sp,sp,-32
    31a4:	00812c23          	sw	s0,24(sp)
    31a8:	41f6d893          	srai	a7,a3,0x1f
    31ac:	41f5d413          	srai	s0,a1,0x1f
    31b0:	01164733          	xor	a4,a2,a7
    31b4:	008547b3          	xor	a5,a0,s0
    31b8:	41170633          	sub	a2,a4,a7
    31bc:	40878533          	sub	a0,a5,s0
    31c0:	0116c6b3          	xor	a3,a3,a7
    31c4:	0085c5b3          	xor	a1,a1,s0
    31c8:	00c73833          	sltu	a6,a4,a2
    31cc:	00a7b7b3          	sltu	a5,a5,a0
    31d0:	411686b3          	sub	a3,a3,a7
    31d4:	408585b3          	sub	a1,a1,s0
    31d8:	00810713          	addi	a4,sp,8
    31dc:	40f585b3          	sub	a1,a1,a5
    31e0:	410686b3          	sub	a3,a3,a6
    31e4:	00112e23          	sw	ra,28(sp)
    31e8:	b95ff0ef          	jal	ra,2d7c <__udivmoddi4>
    31ec:	00812583          	lw	a1,8(sp)
    31f0:	00c12783          	lw	a5,12(sp)
    31f4:	01c12083          	lw	ra,28(sp)
    31f8:	0085c5b3          	xor	a1,a1,s0
    31fc:	40858533          	sub	a0,a1,s0
    3200:	0087c7b3          	xor	a5,a5,s0
    3204:	40878433          	sub	s0,a5,s0
    3208:	00a5b5b3          	sltu	a1,a1,a0
    320c:	40b405b3          	sub	a1,s0,a1
    3210:	01812403          	lw	s0,24(sp)
    3214:	02010113          	addi	sp,sp,32
    3218:	00008067          	ret

0000321c <crc16>:
    321c:	00050713          	mv	a4,a0
    3220:	000076b7          	lui	a3,0x7
    3224:	00000513          	li	a0,0
    3228:	00b705b3          	add	a1,a4,a1
    322c:	01868693          	addi	a3,a3,24 # 7018 <crc16_table>
    3230:	40e587b3          	sub	a5,a1,a4
    3234:	00f04463          	bgtz	a5,323c <crc16+0x20>
    3238:	00008067          	ret
    323c:	00074603          	lbu	a2,0(a4) # ffff0000 <_fstack+0xeffef000>
    3240:	00855793          	srli	a5,a0,0x8
    3244:	00170713          	addi	a4,a4,1
    3248:	00c7c7b3          	xor	a5,a5,a2
    324c:	00279793          	slli	a5,a5,0x2
    3250:	00f687b3          	add	a5,a3,a5
    3254:	0007d603          	lhu	a2,0(a5)
    3258:	00851793          	slli	a5,a0,0x8
    325c:	01079793          	slli	a5,a5,0x10
    3260:	0107d793          	srli	a5,a5,0x10
    3264:	00f64533          	xor	a0,a2,a5
    3268:	fc9ff06f          	j	3230 <crc16+0x14>

0000326c <crc32>:
    326c:	000076b7          	lui	a3,0x7
    3270:	00050713          	mv	a4,a0
    3274:	fff00793          	li	a5,-1
    3278:	00b508b3          	add	a7,a0,a1
    327c:	00700813          	li	a6,7
    3280:	41868693          	addi	a3,a3,1048 # 7418 <crc_table>
    3284:	40e88633          	sub	a2,a7,a4
    3288:	04c86e63          	bltu	a6,a2,32e4 <crc32+0x78>
    328c:	0035d693          	srli	a3,a1,0x3
    3290:	ff800613          	li	a2,-8
    3294:	02c686b3          	mul	a3,a3,a2
    3298:	ff85f713          	andi	a4,a1,-8
    329c:	00e50733          	add	a4,a0,a4
    32a0:	00b685b3          	add	a1,a3,a1
    32a4:	02058c63          	beqz	a1,32dc <crc32+0x70>
    32a8:	00007637          	lui	a2,0x7
    32ac:	00b705b3          	add	a1,a4,a1
    32b0:	41860613          	addi	a2,a2,1048 # 7418 <crc_table>
    32b4:	00074683          	lbu	a3,0(a4)
    32b8:	00170713          	addi	a4,a4,1
    32bc:	00f6c6b3          	xor	a3,a3,a5
    32c0:	0ff6f693          	andi	a3,a3,255
    32c4:	00269693          	slli	a3,a3,0x2
    32c8:	00d606b3          	add	a3,a2,a3
    32cc:	0006a683          	lw	a3,0(a3)
    32d0:	0087d793          	srli	a5,a5,0x8
    32d4:	00f6c7b3          	xor	a5,a3,a5
    32d8:	fcb71ee3          	bne	a4,a1,32b4 <crc32+0x48>
    32dc:	fff7c513          	not	a0,a5
    32e0:	00008067          	ret
    32e4:	00074603          	lbu	a2,0(a4)
    32e8:	00870713          	addi	a4,a4,8
    32ec:	00f64633          	xor	a2,a2,a5
    32f0:	0ff67613          	andi	a2,a2,255
    32f4:	00261613          	slli	a2,a2,0x2
    32f8:	00c68633          	add	a2,a3,a2
    32fc:	00062603          	lw	a2,0(a2)
    3300:	0087d793          	srli	a5,a5,0x8
    3304:	00f647b3          	xor	a5,a2,a5
    3308:	ff974603          	lbu	a2,-7(a4)
    330c:	00f64633          	xor	a2,a2,a5
    3310:	0ff67613          	andi	a2,a2,255
    3314:	00261613          	slli	a2,a2,0x2
    3318:	00c68633          	add	a2,a3,a2
    331c:	00062603          	lw	a2,0(a2)
    3320:	0087d793          	srli	a5,a5,0x8
    3324:	00f64633          	xor	a2,a2,a5
    3328:	ffa74783          	lbu	a5,-6(a4)
    332c:	00c7c7b3          	xor	a5,a5,a2
    3330:	0ff7f793          	andi	a5,a5,255
    3334:	00279793          	slli	a5,a5,0x2
    3338:	00f687b3          	add	a5,a3,a5
    333c:	0007a303          	lw	t1,0(a5)
    3340:	ffb74783          	lbu	a5,-5(a4)
    3344:	00865613          	srli	a2,a2,0x8
    3348:	00c34333          	xor	t1,t1,a2
    334c:	0067c7b3          	xor	a5,a5,t1
    3350:	0ff7f793          	andi	a5,a5,255
    3354:	00279793          	slli	a5,a5,0x2
    3358:	00f687b3          	add	a5,a3,a5
    335c:	0007a603          	lw	a2,0(a5)
    3360:	ffc74783          	lbu	a5,-4(a4)
    3364:	00835313          	srli	t1,t1,0x8
    3368:	00664633          	xor	a2,a2,t1
    336c:	00c7c7b3          	xor	a5,a5,a2
    3370:	0ff7f793          	andi	a5,a5,255
    3374:	00279793          	slli	a5,a5,0x2
    3378:	00f687b3          	add	a5,a3,a5
    337c:	0007a303          	lw	t1,0(a5)
    3380:	ffd74783          	lbu	a5,-3(a4)
    3384:	00865613          	srli	a2,a2,0x8
    3388:	00c34333          	xor	t1,t1,a2
    338c:	0067c7b3          	xor	a5,a5,t1
    3390:	0ff7f793          	andi	a5,a5,255
    3394:	00279793          	slli	a5,a5,0x2
    3398:	00f687b3          	add	a5,a3,a5
    339c:	0007a783          	lw	a5,0(a5)
    33a0:	ffe74603          	lbu	a2,-2(a4)
    33a4:	00835313          	srli	t1,t1,0x8
    33a8:	0067c7b3          	xor	a5,a5,t1
    33ac:	00f64633          	xor	a2,a2,a5
    33b0:	0ff67613          	andi	a2,a2,255
    33b4:	00261613          	slli	a2,a2,0x2
    33b8:	00c68633          	add	a2,a3,a2
    33bc:	00062303          	lw	t1,0(a2)
    33c0:	fff74603          	lbu	a2,-1(a4)
    33c4:	0087d793          	srli	a5,a5,0x8
    33c8:	00f34333          	xor	t1,t1,a5
    33cc:	00664633          	xor	a2,a2,t1
    33d0:	0ff67613          	andi	a2,a2,255
    33d4:	00261613          	slli	a2,a2,0x2
    33d8:	00c68633          	add	a2,a3,a2
    33dc:	00062783          	lw	a5,0(a2)
    33e0:	00835313          	srli	t1,t1,0x8
    33e4:	0067c7b3          	xor	a5,a5,t1
    33e8:	e9dff06f          	j	3284 <crc32+0x18>

000033ec <flush_l2_cache>:
    33ec:	400007b7          	lui	a5,0x40000
    33f0:	20078713          	addi	a4,a5,512 # 40000200 <_fstack+0x2ffff200>
    33f4:	0007a683          	lw	a3,0(a5)
    33f8:	00478793          	addi	a5,a5,4
    33fc:	fee79ce3          	bne	a5,a4,33f4 <flush_l2_cache+0x8>
    3400:	00008067          	ret

00003404 <busy_wait>:
    3404:	0000c737          	lui	a4,0xc
    3408:	35070713          	addi	a4,a4,848 # c350 <_edata_rom+0x41dc>
    340c:	02e50533          	mul	a0,a0,a4
    3410:	f00027b7          	lui	a5,0xf0002
    3414:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3418:	8007a223          	sw	zero,-2044(a5)
    341c:	00100713          	li	a4,1
    3420:	00100693          	li	a3,1
    3424:	80a7a023          	sw	a0,-2048(a5)
    3428:	80e7a423          	sw	a4,-2040(a5)
    342c:	80e7a623          	sw	a4,-2036(a5)
    3430:	8107a703          	lw	a4,-2032(a5)
    3434:	00071463          	bnez	a4,343c <busy_wait+0x38>
    3438:	00008067          	ret
    343c:	80d7a623          	sw	a3,-2036(a5)
    3440:	ff1ff06f          	j	3430 <busy_wait+0x2c>

00003444 <busy_wait_us>:
    3444:	03200713          	li	a4,50
    3448:	02e50533          	mul	a0,a0,a4
    344c:	f00027b7          	lui	a5,0xf0002
    3450:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3454:	8007a223          	sw	zero,-2044(a5)
    3458:	00100713          	li	a4,1
    345c:	00100693          	li	a3,1
    3460:	80a7a023          	sw	a0,-2048(a5)
    3464:	80e7a423          	sw	a4,-2040(a5)
    3468:	80e7a623          	sw	a4,-2036(a5)
    346c:	8107a703          	lw	a4,-2032(a5)
    3470:	00071463          	bnez	a4,3478 <busy_wait_us+0x34>
    3474:	00008067          	ret
    3478:	80d7a623          	sw	a3,-2036(a5)
    347c:	ff1ff06f          	j	346c <busy_wait_us+0x28>

00003480 <show_progress>:
    3480:	2d2f87b7          	lui	a5,0x2d2f8
    3484:	fc010113          	addi	sp,sp,-64
    3488:	c5c78793          	addi	a5,a5,-932 # 2d2f7c5c <_fstack+0x1d2f6c5c>
    348c:	02112e23          	sw	ra,60(sp)
    3490:	02812c23          	sw	s0,56(sp)
    3494:	02912a23          	sw	s1,52(sp)
    3498:	03212823          	sw	s2,48(sp)
    349c:	03312623          	sw	s3,44(sp)
    34a0:	03412423          	sw	s4,40(sp)
    34a4:	00f12423          	sw	a5,8(sp)
    34a8:	00010623          	sb	zero,12(sp)
    34ac:	04055663          	bgez	a0,34f8 <show_progress+0x78>
    34b0:	10000737          	lui	a4,0x10000
    34b4:	17472783          	lw	a5,372(a4) # 10000174 <spin>
    34b8:	03812403          	lw	s0,56(sp)
    34bc:	03c12083          	lw	ra,60(sp)
    34c0:	00178693          	addi	a3,a5,1
    34c4:	16d72a23          	sw	a3,372(a4)
    34c8:	0037f793          	andi	a5,a5,3
    34cc:	02010713          	addi	a4,sp,32
    34d0:	00f707b3          	add	a5,a4,a5
    34d4:	03412483          	lw	s1,52(sp)
    34d8:	03012903          	lw	s2,48(sp)
    34dc:	02c12983          	lw	s3,44(sp)
    34e0:	02812a03          	lw	s4,40(sp)
    34e4:	fe87c583          	lbu	a1,-24(a5)
    34e8:	00008537          	lui	a0,0x8
    34ec:	81850513          	addi	a0,a0,-2024 # 7818 <crc_table+0x400>
    34f0:	04010113          	addi	sp,sp,64
    34f4:	dddfe06f          	j	22d0 <printf>
    34f8:	100007b7          	lui	a5,0x10000
    34fc:	1787a683          	lw	a3,376(a5) # 10000178 <progress_max>
    3500:	00050413          	mv	s0,a0
    3504:	02068663          	beqz	a3,3530 <show_progress+0xb0>
    3508:	05f5e7b7          	lui	a5,0x5f5e
    350c:	10078793          	addi	a5,a5,256 # 5f5e100 <_edata_rom+0x5f55f8c>
    3510:	02f68063          	beq	a3,a5,3530 <show_progress+0xb0>
    3514:	02800593          	li	a1,40
    3518:	02b51633          	mulh	a2,a0,a1
    351c:	41f6d713          	srai	a4,a3,0x1f
    3520:	02b505b3          	mul	a1,a0,a1
    3524:	01010513          	addi	a0,sp,16
    3528:	b75fe0ef          	jal	ra,209c <lldiv>
    352c:	01012403          	lw	s0,16(sp)
    3530:	100004b7          	lui	s1,0x10000
    3534:	02800913          	li	s2,40
    3538:	000089b7          	lui	s3,0x8
    353c:	00008a37          	lui	s4,0x8
    3540:	02c0006f          	j	356c <show_progress+0xec>
    3544:	0327e733          	rem	a4,a5,s2
    3548:	00071863          	bnez	a4,3558 <show_progress+0xd8>
    354c:	00078663          	beqz	a5,3558 <show_progress+0xd8>
    3550:	ab498513          	addi	a0,s3,-1356 # 7ab4 <crc_table+0x69c>
    3554:	d7dfe0ef          	jal	ra,22d0 <printf>
    3558:	81ca0513          	addi	a0,s4,-2020 # 781c <crc_table+0x404>
    355c:	d75fe0ef          	jal	ra,22d0 <printf>
    3560:	17c4a783          	lw	a5,380(s1) # 1000017c <printed>
    3564:	00178793          	addi	a5,a5,1
    3568:	16f4ae23          	sw	a5,380(s1)
    356c:	17c4a783          	lw	a5,380(s1)
    3570:	fc87cae3          	blt	a5,s0,3544 <show_progress+0xc4>
    3574:	03c12083          	lw	ra,60(sp)
    3578:	03812403          	lw	s0,56(sp)
    357c:	03412483          	lw	s1,52(sp)
    3580:	03012903          	lw	s2,48(sp)
    3584:	02c12983          	lw	s3,44(sp)
    3588:	02812a03          	lw	s4,40(sp)
    358c:	04010113          	addi	sp,sp,64
    3590:	00008067          	ret

00003594 <init_progression_bar>:
    3594:	100007b7          	lui	a5,0x10000
    3598:	1607ae23          	sw	zero,380(a5) # 1000017c <printed>
    359c:	100007b7          	lui	a5,0x10000
    35a0:	16a7ac23          	sw	a0,376(a5) # 10000178 <progress_max>
    35a4:	100007b7          	lui	a5,0x10000
    35a8:	1607aa23          	sw	zero,372(a5) # 10000174 <spin>
    35ac:	02050463          	beqz	a0,35d4 <init_progression_bar+0x40>
    35b0:	05f5e7b7          	lui	a5,0x5f5e
    35b4:	10078793          	addi	a5,a5,256 # 5f5e100 <_edata_rom+0x5f55f8c>
    35b8:	00f50e63          	beq	a0,a5,35d4 <init_progression_bar+0x40>
    35bc:	00006637          	lui	a2,0x6
    35c0:	00008537          	lui	a0,0x8
    35c4:	72c60613          	addi	a2,a2,1836 # 672c <str.2794+0x58>
    35c8:	02800593          	li	a1,40
    35cc:	82050513          	addi	a0,a0,-2016 # 7820 <crc_table+0x408>
    35d0:	d01fe06f          	j	22d0 <printf>
    35d4:	00008067          	ret

000035d8 <print_size>:
    35d8:	3ff00793          	li	a5,1023
    35dc:	00a7ea63          	bltu	a5,a0,35f0 <print_size+0x18>
    35e0:	00050593          	mv	a1,a0
    35e4:	00008537          	lui	a0,0x8
    35e8:	82850513          	addi	a0,a0,-2008 # 7828 <crc_table+0x410>
    35ec:	ce5fe06f          	j	22d0 <printf>
    35f0:	001007b7          	lui	a5,0x100
    35f4:	02f57063          	bgeu	a0,a5,3614 <print_size+0x3c>
    35f8:	3ff57613          	andi	a2,a0,1023
    35fc:	06600793          	li	a5,102
    3600:	02f65633          	divu	a2,a2,a5
    3604:	00a55593          	srli	a1,a0,0xa
    3608:	00008537          	lui	a0,0x8
    360c:	83050513          	addi	a0,a0,-2000 # 7830 <crc_table+0x418>
    3610:	cc1fe06f          	j	22d0 <printf>
    3614:	400007b7          	lui	a5,0x40000
    3618:	01455593          	srli	a1,a0,0x14
    361c:	02f57263          	bgeu	a0,a5,3640 <print_size+0x68>
    3620:	00a59613          	slli	a2,a1,0xa
    3624:	00a55513          	srli	a0,a0,0xa
    3628:	40c50533          	sub	a0,a0,a2
    362c:	06600613          	li	a2,102
    3630:	02c55633          	divu	a2,a0,a2
    3634:	00008537          	lui	a0,0x8
    3638:	83c50513          	addi	a0,a0,-1988 # 783c <crc_table+0x424>
    363c:	fd5ff06f          	j	3610 <print_size+0x38>
    3640:	01e55513          	srli	a0,a0,0x1e
    3644:	00a51613          	slli	a2,a0,0xa
    3648:	40c585b3          	sub	a1,a1,a2
    364c:	06600613          	li	a2,102
    3650:	02c5d633          	divu	a2,a1,a2
    3654:	00050593          	mv	a1,a0
    3658:	00008537          	lui	a0,0x8
    365c:	84850513          	addi	a0,a0,-1976 # 7848 <crc_table+0x430>
    3660:	fb1ff06f          	j	3610 <print_size+0x38>

00003664 <print_progress>:
    3664:	ff010113          	addi	sp,sp,-16
    3668:	00812423          	sw	s0,8(sp)
    366c:	00c586b3          	add	a3,a1,a2
    3670:	00060413          	mv	s0,a2
    3674:	00058613          	mv	a2,a1
    3678:	00050593          	mv	a1,a0
    367c:	00008537          	lui	a0,0x8
    3680:	85450513          	addi	a0,a0,-1964 # 7854 <crc_table+0x43c>
    3684:	00112623          	sw	ra,12(sp)
    3688:	c49fe0ef          	jal	ra,22d0 <printf>
    368c:	00040513          	mv	a0,s0
    3690:	f49ff0ef          	jal	ra,35d8 <print_size>
    3694:	00812403          	lw	s0,8(sp)
    3698:	00c12083          	lw	ra,12(sp)
    369c:	00008537          	lui	a0,0x8
    36a0:	86450513          	addi	a0,a0,-1948 # 7864 <crc_table+0x44c>
    36a4:	01010113          	addi	sp,sp,16
    36a8:	c29fe06f          	j	22d0 <printf>

000036ac <memtest_access>:
    36ac:	aaaab7b7          	lui	a5,0xaaaab
    36b0:	f0000737          	lui	a4,0xf0000
    36b4:	aaa78793          	addi	a5,a5,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    36b8:	00872683          	lw	a3,8(a4) # f0000008 <_fstack+0xdffff008>
    36bc:	00f52023          	sw	a5,0(a0)
    36c0:	00052783          	lw	a5,0(a0)
    36c4:	00f52223          	sw	a5,4(a0)
    36c8:	555557b7          	lui	a5,0x55555
    36cc:	55578793          	addi	a5,a5,1365 # 55555555 <_fstack+0x45554555>
    36d0:	00f52023          	sw	a5,0(a0)
    36d4:	00052783          	lw	a5,0(a0)
    36d8:	00f52223          	sw	a5,4(a0)
    36dc:	00872783          	lw	a5,8(a4)
    36e0:	02d78663          	beq	a5,a3,370c <memtest_access+0x60>
    36e4:	00050593          	mv	a1,a0
    36e8:	00008537          	lui	a0,0x8
    36ec:	ff010113          	addi	sp,sp,-16
    36f0:	86c50513          	addi	a0,a0,-1940 # 786c <crc_table+0x454>
    36f4:	00112623          	sw	ra,12(sp)
    36f8:	bd9fe0ef          	jal	ra,22d0 <printf>
    36fc:	00c12083          	lw	ra,12(sp)
    3700:	00100513          	li	a0,1
    3704:	01010113          	addi	sp,sp,16
    3708:	00008067          	ret
    370c:	00000513          	li	a0,0
    3710:	00008067          	ret

00003714 <memtest_bus>:
    3714:	fe010113          	addi	sp,sp,-32
    3718:	aaaab737          	lui	a4,0xaaaab
    371c:	00912a23          	sw	s1,20(sp)
    3720:	01212823          	sw	s2,16(sp)
    3724:	00112e23          	sw	ra,28(sp)
    3728:	00812c23          	sw	s0,24(sp)
    372c:	01312623          	sw	s3,12(sp)
    3730:	01412423          	sw	s4,8(sp)
    3734:	01512223          	sw	s5,4(sp)
    3738:	01612023          	sw	s6,0(sp)
    373c:	00050913          	mv	s2,a0
    3740:	0025d493          	srli	s1,a1,0x2
    3744:	00000793          	li	a5,0
    3748:	aaa70713          	addi	a4,a4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    374c:	08979263          	bne	a5,s1,37d0 <memtest_bus+0xbc>
    3750:	0000500f          	0x500f
    3754:	aaaaba37          	lui	s4,0xaaaab
    3758:	c95ff0ef          	jal	ra,33ec <flush_l2_cache>
    375c:	00000413          	li	s0,0
    3760:	00000993          	li	s3,0
    3764:	aaaa0a13          	addi	s4,s4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    3768:	19000a93          	li	s5,400
    376c:	00008b37          	lui	s6,0x8
    3770:	06999a63          	bne	s3,s1,37e4 <memtest_bus+0xd0>
    3774:	55555737          	lui	a4,0x55555
    3778:	00000793          	li	a5,0
    377c:	55570713          	addi	a4,a4,1365 # 55555555 <_fstack+0x45554555>
    3780:	08979863          	bne	a5,s1,3810 <memtest_bus+0xfc>
    3784:	0000500f          	0x500f
    3788:	55555a37          	lui	s4,0x55555
    378c:	c61ff0ef          	jal	ra,33ec <flush_l2_cache>
    3790:	00000993          	li	s3,0
    3794:	555a0a13          	addi	s4,s4,1365 # 55555555 <_fstack+0x45554555>
    3798:	19000a93          	li	s5,400
    379c:	00008b37          	lui	s6,0x8
    37a0:	08999263          	bne	s3,s1,3824 <memtest_bus+0x110>
    37a4:	01c12083          	lw	ra,28(sp)
    37a8:	00040513          	mv	a0,s0
    37ac:	01812403          	lw	s0,24(sp)
    37b0:	01412483          	lw	s1,20(sp)
    37b4:	01012903          	lw	s2,16(sp)
    37b8:	00c12983          	lw	s3,12(sp)
    37bc:	00812a03          	lw	s4,8(sp)
    37c0:	00412a83          	lw	s5,4(sp)
    37c4:	00012b03          	lw	s6,0(sp)
    37c8:	02010113          	addi	sp,sp,32
    37cc:	00008067          	ret
    37d0:	00279693          	slli	a3,a5,0x2
    37d4:	00d906b3          	add	a3,s2,a3
    37d8:	00e6a023          	sw	a4,0(a3)
    37dc:	00178793          	addi	a5,a5,1
    37e0:	f6dff06f          	j	374c <memtest_bus+0x38>
    37e4:	00299593          	slli	a1,s3,0x2
    37e8:	00b905b3          	add	a1,s2,a1
    37ec:	0005a603          	lw	a2,0(a1)
    37f0:	01460c63          	beq	a2,s4,3808 <memtest_bus+0xf4>
    37f4:	00140413          	addi	s0,s0,1
    37f8:	008ac863          	blt	s5,s0,3808 <memtest_bus+0xf4>
    37fc:	000a0693          	mv	a3,s4
    3800:	89cb0513          	addi	a0,s6,-1892 # 789c <crc_table+0x484>
    3804:	acdfe0ef          	jal	ra,22d0 <printf>
    3808:	00198993          	addi	s3,s3,1
    380c:	f65ff06f          	j	3770 <memtest_bus+0x5c>
    3810:	00279693          	slli	a3,a5,0x2
    3814:	00d906b3          	add	a3,s2,a3
    3818:	00e6a023          	sw	a4,0(a3)
    381c:	00178793          	addi	a5,a5,1
    3820:	f61ff06f          	j	3780 <memtest_bus+0x6c>
    3824:	00299593          	slli	a1,s3,0x2
    3828:	00b905b3          	add	a1,s2,a1
    382c:	0005a603          	lw	a2,0(a1)
    3830:	01460c63          	beq	a2,s4,3848 <memtest_bus+0x134>
    3834:	00140413          	addi	s0,s0,1
    3838:	008ac863          	blt	s5,s0,3848 <memtest_bus+0x134>
    383c:	000a0693          	mv	a3,s4
    3840:	8c8b0513          	addi	a0,s6,-1848
    3844:	a8dfe0ef          	jal	ra,22d0 <printf>
    3848:	00198993          	addi	s3,s3,1
    384c:	f55ff06f          	j	37a0 <memtest_bus+0x8c>

00003850 <memtest_addr>:
    3850:	000107b7          	lui	a5,0x10
    3854:	0ef5ec63          	bltu	a1,a5,394c <memtest_addr+0xfc>
    3858:	ff010113          	addi	sp,sp,-16
    385c:	0000d6b7          	lui	a3,0xd
    3860:	00812423          	sw	s0,8(sp)
    3864:	00912223          	sw	s1,4(sp)
    3868:	01212023          	sw	s2,0(sp)
    386c:	00112623          	sw	ra,12(sp)
    3870:	00050493          	mv	s1,a0
    3874:	00060913          	mv	s2,a2
    3878:	0025d413          	srli	s0,a1,0x2
    387c:	00100793          	li	a5,1
    3880:	00000713          	li	a4,0
    3884:	00868693          	addi	a3,a3,8 # d008 <_edata_rom+0x4e94>
    3888:	08871063          	bne	a4,s0,3908 <memtest_addr+0xb8>
    388c:	0000500f          	0x500f
    3890:	b5dff0ef          	jal	ra,33ec <flush_l2_cache>
    3894:	0000d637          	lui	a2,0xd
    3898:	000106b7          	lui	a3,0x10
    389c:	00000513          	li	a0,0
    38a0:	00000713          	li	a4,0
    38a4:	00100793          	li	a5,1
    38a8:	00860613          	addi	a2,a2,8 # d008 <_edata_rom+0x4e94>
    38ac:	fff68693          	addi	a3,a3,-1 # ffff <_edata_rom+0x7e8b>
    38b0:	08090a63          	beqz	s2,3944 <memtest_addr+0xf4>
    38b4:	0017d593          	srli	a1,a5,0x1
    38b8:	0017f793          	andi	a5,a5,1
    38bc:	40f007b3          	neg	a5,a5
    38c0:	00c7f7b3          	and	a5,a5,a2
    38c4:	00b7c7b3          	xor	a5,a5,a1
    38c8:	01079793          	slli	a5,a5,0x10
    38cc:	0107d793          	srli	a5,a5,0x10
    38d0:	00279593          	slli	a1,a5,0x2
    38d4:	00b485b3          	add	a1,s1,a1
    38d8:	0005a583          	lw	a1,0(a1)
    38dc:	00d5f5b3          	and	a1,a1,a3
    38e0:	00e58463          	beq	a1,a4,38e8 <memtest_addr+0x98>
    38e4:	00150513          	addi	a0,a0,1
    38e8:	00170713          	addi	a4,a4,1
    38ec:	fce412e3          	bne	s0,a4,38b0 <memtest_addr+0x60>
    38f0:	00c12083          	lw	ra,12(sp)
    38f4:	00812403          	lw	s0,8(sp)
    38f8:	00412483          	lw	s1,4(sp)
    38fc:	00012903          	lw	s2,0(sp)
    3900:	01010113          	addi	sp,sp,16
    3904:	00008067          	ret
    3908:	02090a63          	beqz	s2,393c <memtest_addr+0xec>
    390c:	0017d613          	srli	a2,a5,0x1
    3910:	0017f793          	andi	a5,a5,1
    3914:	40f007b3          	neg	a5,a5
    3918:	00d7f7b3          	and	a5,a5,a3
    391c:	00c7c7b3          	xor	a5,a5,a2
    3920:	01079793          	slli	a5,a5,0x10
    3924:	0107d793          	srli	a5,a5,0x10
    3928:	00279613          	slli	a2,a5,0x2
    392c:	00c48633          	add	a2,s1,a2
    3930:	00e62023          	sw	a4,0(a2)
    3934:	00170713          	addi	a4,a4,1
    3938:	f51ff06f          	j	3888 <memtest_addr+0x38>
    393c:	00178793          	addi	a5,a5,1 # 10001 <_edata_rom+0x7e8d>
    3940:	fe1ff06f          	j	3920 <memtest_addr+0xd0>
    3944:	00178793          	addi	a5,a5,1
    3948:	f81ff06f          	j	38c8 <memtest_addr+0x78>
    394c:	00000513          	li	a0,0
    3950:	00008067          	ret

00003954 <memtest_data>:
    3954:	fc010113          	addi	sp,sp,-64
    3958:	02912a23          	sw	s1,52(sp)
    395c:	03212823          	sw	s2,48(sp)
    3960:	03312623          	sw	s3,44(sp)
    3964:	03412423          	sw	s4,40(sp)
    3968:	02112e23          	sw	ra,60(sp)
    396c:	02812c23          	sw	s0,56(sp)
    3970:	03512223          	sw	s5,36(sp)
    3974:	03612023          	sw	s6,32(sp)
    3978:	01712e23          	sw	s7,28(sp)
    397c:	01812c23          	sw	s8,24(sp)
    3980:	01912a23          	sw	s9,20(sp)
    3984:	01a12823          	sw	s10,16(sp)
    3988:	01b12623          	sw	s11,12(sp)
    398c:	00050493          	mv	s1,a0
    3990:	00060a13          	mv	s4,a2
    3994:	00068913          	mv	s2,a3
    3998:	0025d993          	srli	s3,a1,0x2
    399c:	0a068263          	beqz	a3,3a40 <memtest_data+0xec>
    39a0:	0046a783          	lw	a5,4(a3)
    39a4:	0006ab03          	lw	s6,0(a3)
    39a8:	04079263          	bnez	a5,39ec <memtest_data+0x98>
    39ac:	80200bb7          	lui	s7,0x80200
    39b0:	00008c37          	lui	s8,0x8
    39b4:	00100413          	li	s0,1
    39b8:	00000a93          	li	s5,0
    39bc:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    39c0:	fffc0c13          	addi	s8,s8,-1 # 7fff <__bios_cmd_boot+0x3>
    39c4:	00008cb7          	lui	s9,0x8
    39c8:	002a9613          	slli	a2,s5,0x2
    39cc:	073a9e63          	bne	s5,s3,3a48 <memtest_data+0xf4>
    39d0:	00008537          	lui	a0,0x8
    39d4:	8f450513          	addi	a0,a0,-1804 # 78f4 <crc_table+0x4dc>
    39d8:	00048593          	mv	a1,s1
    39dc:	c89ff0ef          	jal	ra,3664 <print_progress>
    39e0:	00008537          	lui	a0,0x8
    39e4:	ab450513          	addi	a0,a0,-1356 # 7ab4 <crc_table+0x69c>
    39e8:	8e9fe0ef          	jal	ra,22d0 <printf>
    39ec:	0000500f          	0x500f
    39f0:	80200bb7          	lui	s7,0x80200
    39f4:	00008c37          	lui	s8,0x8
    39f8:	9f5ff0ef          	jal	ra,33ec <flush_l2_cache>
    39fc:	00100413          	li	s0,1
    3a00:	00000a93          	li	s5,0
    3a04:	00000d13          	li	s10,0
    3a08:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    3a0c:	fffc0c13          	addi	s8,s8,-1 # 7fff <__bios_cmd_boot+0x3>
    3a10:	00008cb7          	lui	s9,0x8
    3a14:	07a99c63          	bne	s3,s10,3a8c <memtest_data+0x138>
    3a18:	0e0b0463          	beqz	s6,3b00 <memtest_data+0x1ac>
    3a1c:	00008537          	lui	a0,0x8
    3a20:	00299613          	slli	a2,s3,0x2
    3a24:	00048593          	mv	a1,s1
    3a28:	90050513          	addi	a0,a0,-1792 # 7900 <crc_table+0x4e8>
    3a2c:	c39ff0ef          	jal	ra,3664 <print_progress>
    3a30:	00008537          	lui	a0,0x8
    3a34:	ab450513          	addi	a0,a0,-1356 # 7ab4 <crc_table+0x69c>
    3a38:	899fe0ef          	jal	ra,22d0 <printf>
    3a3c:	0c40006f          	j	3b00 <memtest_data+0x1ac>
    3a40:	00100b13          	li	s6,1
    3a44:	f69ff06f          	j	39ac <memtest_data+0x58>
    3a48:	020a0e63          	beqz	s4,3a84 <memtest_data+0x130>
    3a4c:	00145793          	srli	a5,s0,0x1
    3a50:	00147413          	andi	s0,s0,1
    3a54:	40800433          	neg	s0,s0
    3a58:	01747433          	and	s0,s0,s7
    3a5c:	00f44433          	xor	s0,s0,a5
    3a60:	00c487b3          	add	a5,s1,a2
    3a64:	0087a023          	sw	s0,0(a5)
    3a68:	018af7b3          	and	a5,s5,s8
    3a6c:	00079863          	bnez	a5,3a7c <memtest_data+0x128>
    3a70:	00048593          	mv	a1,s1
    3a74:	8f4c8513          	addi	a0,s9,-1804 # 78f4 <crc_table+0x4dc>
    3a78:	bedff0ef          	jal	ra,3664 <print_progress>
    3a7c:	001a8a93          	addi	s5,s5,1
    3a80:	f49ff06f          	j	39c8 <memtest_data+0x74>
    3a84:	00140413          	addi	s0,s0,1
    3a88:	fd9ff06f          	j	3a60 <memtest_data+0x10c>
    3a8c:	040a0663          	beqz	s4,3ad8 <memtest_data+0x184>
    3a90:	00145793          	srli	a5,s0,0x1
    3a94:	00147413          	andi	s0,s0,1
    3a98:	40800433          	neg	s0,s0
    3a9c:	01747433          	and	s0,s0,s7
    3aa0:	00f44433          	xor	s0,s0,a5
    3aa4:	002d1d93          	slli	s11,s10,0x2
    3aa8:	009d8533          	add	a0,s11,s1
    3aac:	00052583          	lw	a1,0(a0)
    3ab0:	02859863          	bne	a1,s0,3ae0 <memtest_data+0x18c>
    3ab4:	018d77b3          	and	a5,s10,s8
    3ab8:	00079c63          	bnez	a5,3ad0 <memtest_data+0x17c>
    3abc:	000b0a63          	beqz	s6,3ad0 <memtest_data+0x17c>
    3ac0:	000d8613          	mv	a2,s11
    3ac4:	00048593          	mv	a1,s1
    3ac8:	900c8513          	addi	a0,s9,-1792
    3acc:	b99ff0ef          	jal	ra,3664 <print_progress>
    3ad0:	001d0d13          	addi	s10,s10,1
    3ad4:	f41ff06f          	j	3a14 <memtest_data+0xc0>
    3ad8:	00140413          	addi	s0,s0,1
    3adc:	fc9ff06f          	j	3aa4 <memtest_data+0x150>
    3ae0:	001a8a93          	addi	s5,s5,1
    3ae4:	fc0908e3          	beqz	s2,3ab4 <memtest_data+0x160>
    3ae8:	00892783          	lw	a5,8(s2)
    3aec:	fc0784e3          	beqz	a5,3ab4 <memtest_data+0x160>
    3af0:	00c92683          	lw	a3,12(s2)
    3af4:	00040613          	mv	a2,s0
    3af8:	000780e7          	jalr	a5
    3afc:	fa050ce3          	beqz	a0,3ab4 <memtest_data+0x160>
    3b00:	03c12083          	lw	ra,60(sp)
    3b04:	03812403          	lw	s0,56(sp)
    3b08:	03412483          	lw	s1,52(sp)
    3b0c:	03012903          	lw	s2,48(sp)
    3b10:	02c12983          	lw	s3,44(sp)
    3b14:	02812a03          	lw	s4,40(sp)
    3b18:	02012b03          	lw	s6,32(sp)
    3b1c:	01c12b83          	lw	s7,28(sp)
    3b20:	01812c03          	lw	s8,24(sp)
    3b24:	01412c83          	lw	s9,20(sp)
    3b28:	01012d03          	lw	s10,16(sp)
    3b2c:	00c12d83          	lw	s11,12(sp)
    3b30:	000a8513          	mv	a0,s5
    3b34:	02412a83          	lw	s5,36(sp)
    3b38:	04010113          	addi	sp,sp,64
    3b3c:	00008067          	ret

00003b40 <memspeed>:
    3b40:	fe010113          	addi	sp,sp,-32
    3b44:	01312623          	sw	s3,12(sp)
    3b48:	ff058993          	addi	s3,a1,-16
    3b4c:	00812c23          	sw	s0,24(sp)
    3b50:	00912a23          	sw	s1,20(sp)
    3b54:	00050413          	mv	s0,a0
    3b58:	00058493          	mv	s1,a1
    3b5c:	013509b3          	add	s3,a0,s3
    3b60:	00050593          	mv	a1,a0
    3b64:	00008537          	lui	a0,0x8
    3b68:	01412423          	sw	s4,8(sp)
    3b6c:	90c50513          	addi	a0,a0,-1780 # 790c <crc_table+0x4f4>
    3b70:	00068a13          	mv	s4,a3
    3b74:	01212823          	sw	s2,16(sp)
    3b78:	00112e23          	sw	ra,28(sp)
    3b7c:	01512223          	sw	s5,4(sp)
    3b80:	00060913          	mv	s2,a2
    3b84:	f4cfe0ef          	jal	ra,22d0 <printf>
    3b88:	100a0863          	beqz	s4,3c98 <memspeed+0x158>
    3b8c:	00008537          	lui	a0,0x8
    3b90:	92050513          	addi	a0,a0,-1760 # 7920 <crc_table+0x508>
    3b94:	f3cfe0ef          	jal	ra,22d0 <printf>
    3b98:	00048513          	mv	a0,s1
    3b9c:	a3dff0ef          	jal	ra,35d8 <print_size>
    3ba0:	00006537          	lui	a0,0x6
    3ba4:	51c50513          	addi	a0,a0,1308 # 651c <_frodata+0x34>
    3ba8:	f28fe0ef          	jal	ra,22d0 <printf>
    3bac:	f00027b7          	lui	a5,0xf0002
    3bb0:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3bb4:	8007a223          	sw	zero,-2044(a5)
    3bb8:	fff00713          	li	a4,-1
    3bbc:	80e7a023          	sw	a4,-2048(a5)
    3bc0:	00100713          	li	a4,1
    3bc4:	80e7a423          	sw	a4,-2040(a5)
    3bc8:	08091263          	bnez	s2,3c4c <memspeed+0x10c>
    3bcc:	80e7a623          	sw	a4,-2036(a5)
    3bd0:	8107a903          	lw	s2,-2032(a5)
    3bd4:	fff00713          	li	a4,-1
    3bd8:	00040793          	mv	a5,s0
    3bdc:	00e7a023          	sw	a4,0(a5)
    3be0:	00e7a223          	sw	a4,4(a5)
    3be4:	00e7a423          	sw	a4,8(a5)
    3be8:	00e7a623          	sw	a4,12(a5)
    3bec:	01078793          	addi	a5,a5,16
    3bf0:	fef9f6e3          	bgeu	s3,a5,3bdc <memspeed+0x9c>
    3bf4:	f00027b7          	lui	a5,0xf0002
    3bf8:	00100713          	li	a4,1
    3bfc:	00008537          	lui	a0,0x8
    3c00:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    3c04:	93c50513          	addi	a0,a0,-1732 # 793c <crc_table+0x524>
    3c08:	8107aa83          	lw	s5,-2032(a5)
    3c0c:	ec4fe0ef          	jal	ra,22d0 <printf>
    3c10:	02faf537          	lui	a0,0x2faf
    3c14:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa6f0c>
    3c18:	02a4b5b3          	mulhu	a1,s1,a0
    3c1c:	41590633          	sub	a2,s2,s5
    3c20:	00c936b3          	sltu	a3,s2,a2
    3c24:	40d006b3          	neg	a3,a3
    3c28:	02a48533          	mul	a0,s1,a0
    3c2c:	d48ff0ef          	jal	ra,3174 <__udivdi3>
    3c30:	9a9ff0ef          	jal	ra,35d8 <print_size>
    3c34:	00008537          	lui	a0,0x8
    3c38:	94c50513          	addi	a0,a0,-1716 # 794c <crc_table+0x534>
    3c3c:	e94fe0ef          	jal	ra,22d0 <printf>
    3c40:	00008537          	lui	a0,0x8
    3c44:	ab450513          	addi	a0,a0,-1356 # 7ab4 <crc_table+0x69c>
    3c48:	e88fe0ef          	jal	ra,22d0 <printf>
    3c4c:	0000500f          	0x500f
    3c50:	f9cff0ef          	jal	ra,33ec <flush_l2_cache>
    3c54:	f00027b7          	lui	a5,0xf0002
    3c58:	00100713          	li	a4,1
    3c5c:	80e7a423          	sw	a4,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3c60:	80e7a623          	sw	a4,-2036(a5)
    3c64:	8107a903          	lw	s2,-2032(a5)
    3c68:	0024d593          	srli	a1,s1,0x2
    3c6c:	00058713          	mv	a4,a1
    3c70:	00000693          	li	a3,0
    3c74:	02071863          	bnez	a4,3ca4 <memspeed+0x164>
    3c78:	0e0a1c63          	bnez	s4,3d70 <memspeed+0x230>
    3c7c:	00042783          	lw	a5,0(s0)
    3c80:	00442783          	lw	a5,4(s0)
    3c84:	00842783          	lw	a5,8(s0)
    3c88:	00c42783          	lw	a5,12(s0)
    3c8c:	01040413          	addi	s0,s0,16
    3c90:	fe89f6e3          	bgeu	s3,s0,3c7c <memspeed+0x13c>
    3c94:	05c0006f          	j	3cf0 <memspeed+0x1b0>
    3c98:	00008537          	lui	a0,0x8
    3c9c:	92c50513          	addi	a0,a0,-1748 # 792c <crc_table+0x514>
    3ca0:	ef5ff06f          	j	3b94 <memspeed+0x54>
    3ca4:	00177793          	andi	a5,a4,1
    3ca8:	00078463          	beqz	a5,3cb0 <memspeed+0x170>
    3cac:	00168693          	addi	a3,a3,1
    3cb0:	00175713          	srli	a4,a4,0x1
    3cb4:	fc1ff06f          	j	3c74 <memspeed+0x134>
    3cb8:	0a070863          	beqz	a4,3d68 <memspeed+0x228>
    3cbc:	0017d613          	srli	a2,a5,0x1
    3cc0:	0017f793          	andi	a5,a5,1
    3cc4:	40f007b3          	neg	a5,a5
    3cc8:	00a7f7b3          	and	a5,a5,a0
    3ccc:	00c7c7b3          	xor	a5,a5,a2
    3cd0:	00f8f633          	and	a2,a7,a5
    3cd4:	01068463          	beq	a3,a6,3cdc <memspeed+0x19c>
    3cd8:	02b7f633          	remu	a2,a5,a1
    3cdc:	00261613          	slli	a2,a2,0x2
    3ce0:	00c40633          	add	a2,s0,a2
    3ce4:	00062603          	lw	a2,0(a2)
    3ce8:	00170713          	addi	a4,a4,1
    3cec:	fcb716e3          	bne	a4,a1,3cb8 <memspeed+0x178>
    3cf0:	f00027b7          	lui	a5,0xf0002
    3cf4:	00100713          	li	a4,1
    3cf8:	00008537          	lui	a0,0x8
    3cfc:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    3d00:	95050513          	addi	a0,a0,-1712 # 7950 <crc_table+0x538>
    3d04:	8107a403          	lw	s0,-2032(a5)
    3d08:	dc8fe0ef          	jal	ra,22d0 <printf>
    3d0c:	02faf537          	lui	a0,0x2faf
    3d10:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa6f0c>
    3d14:	40890633          	sub	a2,s2,s0
    3d18:	00c936b3          	sltu	a3,s2,a2
    3d1c:	40d006b3          	neg	a3,a3
    3d20:	02a4b5b3          	mulhu	a1,s1,a0
    3d24:	02a48533          	mul	a0,s1,a0
    3d28:	c4cff0ef          	jal	ra,3174 <__udivdi3>
    3d2c:	8adff0ef          	jal	ra,35d8 <print_size>
    3d30:	00008537          	lui	a0,0x8
    3d34:	94c50513          	addi	a0,a0,-1716 # 794c <crc_table+0x534>
    3d38:	d98fe0ef          	jal	ra,22d0 <printf>
    3d3c:	01812403          	lw	s0,24(sp)
    3d40:	01c12083          	lw	ra,28(sp)
    3d44:	01412483          	lw	s1,20(sp)
    3d48:	01012903          	lw	s2,16(sp)
    3d4c:	00c12983          	lw	s3,12(sp)
    3d50:	00812a03          	lw	s4,8(sp)
    3d54:	00412a83          	lw	s5,4(sp)
    3d58:	00008537          	lui	a0,0x8
    3d5c:	ab450513          	addi	a0,a0,-1356 # 7ab4 <crc_table+0x69c>
    3d60:	02010113          	addi	sp,sp,32
    3d64:	d6cfe06f          	j	22d0 <printf>
    3d68:	00178793          	addi	a5,a5,1
    3d6c:	f65ff06f          	j	3cd0 <memspeed+0x190>
    3d70:	80200537          	lui	a0,0x80200
    3d74:	00000793          	li	a5,0
    3d78:	00350513          	addi	a0,a0,3 # 80200003 <_fstack+0x701ff003>
    3d7c:	00100813          	li	a6,1
    3d80:	fff58893          	addi	a7,a1,-1
    3d84:	f69ff06f          	j	3cec <memspeed+0x1ac>

00003d88 <memtest>:
    3d88:	fe010113          	addi	sp,sp,-32
    3d8c:	00812c23          	sw	s0,24(sp)
    3d90:	00912a23          	sw	s1,20(sp)
    3d94:	00058413          	mv	s0,a1
    3d98:	00050493          	mv	s1,a0
    3d9c:	00050593          	mv	a1,a0
    3da0:	00008537          	lui	a0,0x8
    3da4:	96050513          	addi	a0,a0,-1696 # 7960 <crc_table+0x548>
    3da8:	00112e23          	sw	ra,28(sp)
    3dac:	01212823          	sw	s2,16(sp)
    3db0:	01312623          	sw	s3,12(sp)
    3db4:	01412423          	sw	s4,8(sp)
    3db8:	01512223          	sw	s5,4(sp)
    3dbc:	d14fe0ef          	jal	ra,22d0 <printf>
    3dc0:	00040513          	mv	a0,s0
    3dc4:	815ff0ef          	jal	ra,35d8 <print_size>
    3dc8:	00006537          	lui	a0,0x6
    3dcc:	51c50513          	addi	a0,a0,1308 # 651c <_frodata+0x34>
    3dd0:	d00fe0ef          	jal	ra,22d0 <printf>
    3dd4:	00048513          	mv	a0,s1
    3dd8:	8d5ff0ef          	jal	ra,36ac <memtest_access>
    3ddc:	00000913          	li	s2,0
    3de0:	0a051663          	bnez	a0,3e8c <memtest+0x104>
    3de4:	08000793          	li	a5,128
    3de8:	00050913          	mv	s2,a0
    3dec:	00040993          	mv	s3,s0
    3df0:	0087f463          	bgeu	a5,s0,3df8 <memtest+0x70>
    3df4:	08000993          	li	s3,128
    3df8:	00098593          	mv	a1,s3
    3dfc:	00048513          	mv	a0,s1
    3e00:	915ff0ef          	jal	ra,3714 <memtest_bus>
    3e04:	00050a93          	mv	s5,a0
    3e08:	00000613          	li	a2,0
    3e0c:	00098593          	mv	a1,s3
    3e10:	00048513          	mv	a0,s1
    3e14:	a3dff0ef          	jal	ra,3850 <memtest_addr>
    3e18:	00050a13          	mv	s4,a0
    3e1c:	00000693          	li	a3,0
    3e20:	00048513          	mv	a0,s1
    3e24:	00100613          	li	a2,1
    3e28:	00040593          	mv	a1,s0
    3e2c:	b29ff0ef          	jal	ra,3954 <memtest_data>
    3e30:	014a87b3          	add	a5,s5,s4
    3e34:	00a787b3          	add	a5,a5,a0
    3e38:	00050493          	mv	s1,a0
    3e3c:	06078c63          	beqz	a5,3eb4 <memtest+0x12c>
    3e40:	00199613          	slli	a2,s3,0x1
    3e44:	00008537          	lui	a0,0x8
    3e48:	00265613          	srli	a2,a2,0x2
    3e4c:	000a8593          	mv	a1,s5
    3e50:	97050513          	addi	a0,a0,-1680 # 7970 <crc_table+0x558>
    3e54:	c7cfe0ef          	jal	ra,22d0 <printf>
    3e58:	00008537          	lui	a0,0x8
    3e5c:	0029d613          	srli	a2,s3,0x2
    3e60:	000a0593          	mv	a1,s4
    3e64:	98850513          	addi	a0,a0,-1656 # 7988 <crc_table+0x570>
    3e68:	c68fe0ef          	jal	ra,22d0 <printf>
    3e6c:	00008537          	lui	a0,0x8
    3e70:	00245613          	srli	a2,s0,0x2
    3e74:	00048593          	mv	a1,s1
    3e78:	9a050513          	addi	a0,a0,-1632 # 79a0 <crc_table+0x588>
    3e7c:	c54fe0ef          	jal	ra,22d0 <printf>
    3e80:	00008537          	lui	a0,0x8
    3e84:	9b850513          	addi	a0,a0,-1608 # 79b8 <crc_table+0x5a0>
    3e88:	c48fe0ef          	jal	ra,22d0 <printf>
    3e8c:	01c12083          	lw	ra,28(sp)
    3e90:	01812403          	lw	s0,24(sp)
    3e94:	01412483          	lw	s1,20(sp)
    3e98:	00c12983          	lw	s3,12(sp)
    3e9c:	00812a03          	lw	s4,8(sp)
    3ea0:	00412a83          	lw	s5,4(sp)
    3ea4:	00090513          	mv	a0,s2
    3ea8:	01012903          	lw	s2,16(sp)
    3eac:	02010113          	addi	sp,sp,32
    3eb0:	00008067          	ret
    3eb4:	00008537          	lui	a0,0x8
    3eb8:	9c450513          	addi	a0,a0,-1596 # 79c4 <crc_table+0x5ac>
    3ebc:	c14fe0ef          	jal	ra,22d0 <printf>
    3ec0:	00100913          	li	s2,1
    3ec4:	fc9ff06f          	j	3e8c <memtest+0x104>

00003ec8 <uart_isr>:
    3ec8:	f0001737          	lui	a4,0xf0001
    3ecc:	01072683          	lw	a3,16(a4) # f0001010 <_fstack+0xe0000010>
    3ed0:	01472783          	lw	a5,20(a4)
    3ed4:	00d7f7b3          	and	a5,a5,a3
    3ed8:	0027f713          	andi	a4,a5,2
    3edc:	00071863          	bnez	a4,3eec <uart_isr+0x24>
    3ee0:	0017f793          	andi	a5,a5,1
    3ee4:	04079c63          	bnez	a5,3f3c <uart_isr+0x74>
    3ee8:	00008067          	ret
    3eec:	10000737          	lui	a4,0x10000
    3ef0:	18872803          	lw	a6,392(a4) # 10000188 <rx_consume>
    3ef4:	100005b7          	lui	a1,0x10000
    3ef8:	f00016b7          	lui	a3,0xf0001
    3efc:	10000637          	lui	a2,0x10000
    3f00:	1ac58593          	addi	a1,a1,428 # 100001ac <rx_buf>
    3f04:	00200893          	li	a7,2
    3f08:	0086a703          	lw	a4,8(a3) # f0001008 <_fstack+0xe0000008>
    3f0c:	fc071ae3          	bnez	a4,3ee0 <uart_isr+0x18>
    3f10:	0006a303          	lw	t1,0(a3)
    3f14:	18c62703          	lw	a4,396(a2) # 1000018c <rx_produce>
    3f18:	00170713          	addi	a4,a4,1
    3f1c:	07f77713          	andi	a4,a4,127
    3f20:	00e80a63          	beq	a6,a4,3f34 <uart_isr+0x6c>
    3f24:	18c62503          	lw	a0,396(a2)
    3f28:	18e62623          	sw	a4,396(a2)
    3f2c:	00a58533          	add	a0,a1,a0
    3f30:	00650023          	sb	t1,0(a0)
    3f34:	0116a823          	sw	a7,16(a3)
    3f38:	fd1ff06f          	j	3f08 <uart_isr+0x40>
    3f3c:	100007b7          	lui	a5,0x10000
    3f40:	1847a603          	lw	a2,388(a5) # 10000184 <tx_produce>
    3f44:	100006b7          	lui	a3,0x10000
    3f48:	100007b7          	lui	a5,0x10000
    3f4c:	00078513          	mv	a0,a5
    3f50:	f00015b7          	lui	a1,0xf0001
    3f54:	1ac68693          	addi	a3,a3,428 # 100001ac <rx_buf>
    3f58:	1807a703          	lw	a4,384(a5) # 10000180 <tx_consume>
    3f5c:	00c70663          	beq	a4,a2,3f68 <uart_isr+0xa0>
    3f60:	0045a703          	lw	a4,4(a1) # f0001004 <_fstack+0xe0000004>
    3f64:	00070e63          	beqz	a4,3f80 <uart_isr+0xb8>
    3f68:	18052783          	lw	a5,384(a0)
    3f6c:	00f61863          	bne	a2,a5,3f7c <uart_isr+0xb4>
    3f70:	f00017b7          	lui	a5,0xf0001
    3f74:	00200713          	li	a4,2
    3f78:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    3f7c:	00008067          	ret
    3f80:	1807a703          	lw	a4,384(a5)
    3f84:	00e68733          	add	a4,a3,a4
    3f88:	08074703          	lbu	a4,128(a4)
    3f8c:	00e5a023          	sw	a4,0(a1)
    3f90:	1807a703          	lw	a4,384(a5)
    3f94:	00170713          	addi	a4,a4,1
    3f98:	07f77713          	andi	a4,a4,127
    3f9c:	18e7a023          	sw	a4,384(a5)
    3fa0:	fb9ff06f          	j	3f58 <uart_isr+0x90>

00003fa4 <uart_read>:
    3fa4:	30002673          	csrr	a2,mstatus
    3fa8:	10000737          	lui	a4,0x10000
    3fac:	00867613          	andi	a2,a2,8
    3fb0:	18872783          	lw	a5,392(a4) # 10000188 <rx_consume>
    3fb4:	00070693          	mv	a3,a4
    3fb8:	10000737          	lui	a4,0x10000
    3fbc:	02060663          	beqz	a2,3fe8 <uart_read+0x44>
    3fc0:	18c72603          	lw	a2,396(a4) # 1000018c <rx_produce>
    3fc4:	fef60ee3          	beq	a2,a5,3fc0 <uart_read+0x1c>
    3fc8:	10000737          	lui	a4,0x10000
    3fcc:	1ac70713          	addi	a4,a4,428 # 100001ac <rx_buf>
    3fd0:	00f70733          	add	a4,a4,a5
    3fd4:	00178793          	addi	a5,a5,1
    3fd8:	07f7f793          	andi	a5,a5,127
    3fdc:	00074503          	lbu	a0,0(a4)
    3fe0:	18f6a423          	sw	a5,392(a3)
    3fe4:	0100006f          	j	3ff4 <uart_read+0x50>
    3fe8:	18c72703          	lw	a4,396(a4)
    3fec:	00000513          	li	a0,0
    3ff0:	fcf71ce3          	bne	a4,a5,3fc8 <uart_read+0x24>
    3ff4:	00008067          	ret

00003ff8 <uart_read_nonblock>:
    3ff8:	10000737          	lui	a4,0x10000
    3ffc:	100007b7          	lui	a5,0x10000
    4000:	18c7a783          	lw	a5,396(a5) # 1000018c <rx_produce>
    4004:	18872503          	lw	a0,392(a4) # 10000188 <rx_consume>
    4008:	40f50533          	sub	a0,a0,a5
    400c:	00a03533          	snez	a0,a0
    4010:	00008067          	ret

00004014 <uart_write>:
    4014:	10000737          	lui	a4,0x10000
    4018:	18472783          	lw	a5,388(a4) # 10000184 <tx_produce>
    401c:	00178793          	addi	a5,a5,1
    4020:	07f7f793          	andi	a5,a5,127
    4024:	30002673          	csrr	a2,mstatus
    4028:	00867613          	andi	a2,a2,8
    402c:	100006b7          	lui	a3,0x10000
    4030:	06060063          	beqz	a2,4090 <uart_write+0x7c>
    4034:	1806a603          	lw	a2,384(a3) # 10000180 <tx_consume>
    4038:	fef60ee3          	beq	a2,a5,4034 <uart_write+0x20>
    403c:	f0c025b7          	lui	a1,0xf0c02
    4040:	0005a603          	lw	a2,0(a1) # f0c02000 <_fstack+0xe0c01000>
    4044:	ffd67813          	andi	a6,a2,-3
    4048:	0105a023          	sw	a6,0(a1)
    404c:	1806a683          	lw	a3,384(a3)
    4050:	18472803          	lw	a6,388(a4)
    4054:	01069863          	bne	a3,a6,4064 <uart_write+0x50>
    4058:	f00015b7          	lui	a1,0xf0001
    405c:	0045a683          	lw	a3,4(a1) # f0001004 <_fstack+0xe0000004>
    4060:	02068e63          	beqz	a3,409c <uart_write+0x88>
    4064:	100006b7          	lui	a3,0x10000
    4068:	1ac68693          	addi	a3,a3,428 # 100001ac <rx_buf>
    406c:	010686b3          	add	a3,a3,a6
    4070:	18f72223          	sw	a5,388(a4)
    4074:	08a68023          	sb	a0,128(a3)
    4078:	f00017b7          	lui	a5,0xf0001
    407c:	00300713          	li	a4,3
    4080:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    4084:	f0c027b7          	lui	a5,0xf0c02
    4088:	00c7a023          	sw	a2,0(a5) # f0c02000 <_fstack+0xe0c01000>
    408c:	00c0006f          	j	4098 <uart_write+0x84>
    4090:	1806a603          	lw	a2,384(a3)
    4094:	faf614e3          	bne	a2,a5,403c <uart_write+0x28>
    4098:	00008067          	ret
    409c:	00a5a023          	sw	a0,0(a1)
    40a0:	fe5ff06f          	j	4084 <uart_write+0x70>

000040a4 <uart_init>:
    40a4:	100007b7          	lui	a5,0x10000
    40a8:	1807a623          	sw	zero,396(a5) # 1000018c <rx_produce>
    40ac:	100007b7          	lui	a5,0x10000
    40b0:	1807a423          	sw	zero,392(a5) # 10000188 <rx_consume>
    40b4:	100007b7          	lui	a5,0x10000
    40b8:	1807a223          	sw	zero,388(a5) # 10000184 <tx_produce>
    40bc:	100007b7          	lui	a5,0x10000
    40c0:	1807a023          	sw	zero,384(a5) # 10000180 <tx_consume>
    40c4:	00200713          	li	a4,2
    40c8:	f00017b7          	lui	a5,0xf0001
    40cc:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    40d0:	000047b7          	lui	a5,0x4
    40d4:	13c78793          	addi	a5,a5,316 # 413c <irq_attach>
    40d8:	02078c63          	beqz	a5,4110 <uart_init+0x6c>
    40dc:	000045b7          	lui	a1,0x4
    40e0:	ff010113          	addi	sp,sp,-16
    40e4:	ec858593          	addi	a1,a1,-312 # 3ec8 <uart_isr>
    40e8:	00100513          	li	a0,1
    40ec:	00112623          	sw	ra,12(sp)
    40f0:	04c000ef          	jal	ra,413c <irq_attach>
    40f4:	f0c02737          	lui	a4,0xf0c02
    40f8:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    40fc:	00c12083          	lw	ra,12(sp)
    4100:	0027e793          	ori	a5,a5,2
    4104:	00f72023          	sw	a5,0(a4)
    4108:	01010113          	addi	sp,sp,16
    410c:	00008067          	ret
    4110:	f0c02737          	lui	a4,0xf0c02
    4114:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    4118:	0027e793          	ori	a5,a5,2
    411c:	00f72023          	sw	a5,0(a4)
    4120:	00008067          	ret

00004124 <uart_sync>:
    4124:	100007b7          	lui	a5,0x10000
    4128:	1847a783          	lw	a5,388(a5) # 10000184 <tx_produce>
    412c:	100006b7          	lui	a3,0x10000
    4130:	1806a703          	lw	a4,384(a3) # 10000180 <tx_consume>
    4134:	fef71ee3          	bne	a4,a5,4130 <uart_sync+0xc>
    4138:	00008067          	ret

0000413c <irq_attach>:
    413c:	00200793          	li	a5,2
    4140:	02a7f663          	bgeu	a5,a0,416c <irq_attach+0x30>
    4144:	00050593          	mv	a1,a0
    4148:	00008537          	lui	a0,0x8
    414c:	ff010113          	addi	sp,sp,-16
    4150:	9d050513          	addi	a0,a0,-1584 # 79d0 <crc_table+0x5b8>
    4154:	00112623          	sw	ra,12(sp)
    4158:	978fe0ef          	jal	ra,22d0 <printf>
    415c:	00c12083          	lw	ra,12(sp)
    4160:	fff00513          	li	a0,-1
    4164:	01010113          	addi	sp,sp,16
    4168:	00008067          	ret
    416c:	300026f3          	csrr	a3,mstatus
    4170:	30047073          	csrci	mstatus,8
    4174:	10000737          	lui	a4,0x10000
    4178:	00251793          	slli	a5,a0,0x2
    417c:	4ac70713          	addi	a4,a4,1196 # 100004ac <irq_table>
    4180:	00f707b3          	add	a5,a4,a5
    4184:	00b7a023          	sw	a1,0(a5)
    4188:	0086f793          	andi	a5,a3,8
    418c:	00078663          	beqz	a5,4198 <irq_attach+0x5c>
    4190:	30046073          	csrsi	mstatus,8
    4194:	00008067          	ret
    4198:	30047073          	csrci	mstatus,8
    419c:	00008067          	ret

000041a0 <irq_detach>:
    41a0:	00000593          	li	a1,0
    41a4:	f99ff06f          	j	413c <irq_attach>

000041a8 <plic_init>:
    41a8:	f0c007b7          	lui	a5,0xf0c00
    41ac:	00100713          	li	a4,1
    41b0:	00e7a023          	sw	a4,0(a5) # f0c00000 <_fstack+0xe0bff000>
    41b4:	00e7a223          	sw	a4,4(a5)
    41b8:	00e7a423          	sw	a4,8(a5)
    41bc:	00e7a623          	sw	a4,12(a5)
    41c0:	00e7a823          	sw	a4,16(a5)
    41c4:	00e7aa23          	sw	a4,20(a5)
    41c8:	00e7ac23          	sw	a4,24(a5)
    41cc:	00e7ae23          	sw	a4,28(a5)
    41d0:	f0c027b7          	lui	a5,0xf0c02
    41d4:	0ff00713          	li	a4,255
    41d8:	00e7a023          	sw	a4,0(a5) # f0c02000 <_fstack+0xe0c01000>
    41dc:	f0e007b7          	lui	a5,0xf0e00
    41e0:	0007a023          	sw	zero,0(a5) # f0e00000 <_fstack+0xe0dff000>
    41e4:	00008067          	ret

000041e8 <isr>:
    41e8:	fd010113          	addi	sp,sp,-48
    41ec:	02912223          	sw	s1,36(sp)
    41f0:	100004b7          	lui	s1,0x10000
    41f4:	03212023          	sw	s2,32(sp)
    41f8:	01312e23          	sw	s3,28(sp)
    41fc:	01412c23          	sw	s4,24(sp)
    4200:	01512a23          	sw	s5,20(sp)
    4204:	01612823          	sw	s6,16(sp)
    4208:	01712623          	sw	s7,12(sp)
    420c:	02112623          	sw	ra,44(sp)
    4210:	02812423          	sw	s0,40(sp)
    4214:	00008937          	lui	s2,0x8
    4218:	000089b7          	lui	s3,0x8
    421c:	00008a37          	lui	s4,0x8
    4220:	00008ab7          	lui	s5,0x8
    4224:	00008b37          	lui	s6,0x8
    4228:	00008bb7          	lui	s7,0x8
    422c:	4ac48493          	addi	s1,s1,1196 # 100004ac <irq_table>
    4230:	f0e007b7          	lui	a5,0xf0e00
    4234:	0047a403          	lw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    4238:	02041863          	bnez	s0,4268 <isr+0x80>
    423c:	02c12083          	lw	ra,44(sp)
    4240:	02812403          	lw	s0,40(sp)
    4244:	02412483          	lw	s1,36(sp)
    4248:	02012903          	lw	s2,32(sp)
    424c:	01c12983          	lw	s3,28(sp)
    4250:	01812a03          	lw	s4,24(sp)
    4254:	01412a83          	lw	s5,20(sp)
    4258:	01012b03          	lw	s6,16(sp)
    425c:	00c12b83          	lw	s7,12(sp)
    4260:	03010113          	addi	sp,sp,48
    4264:	00008067          	ret
    4268:	00200793          	li	a5,2
    426c:	0287e263          	bltu	a5,s0,4290 <isr+0xa8>
    4270:	00241793          	slli	a5,s0,0x2
    4274:	00f487b3          	add	a5,s1,a5
    4278:	0007a783          	lw	a5,0(a5)
    427c:	00078a63          	beqz	a5,4290 <isr+0xa8>
    4280:	000780e7          	jalr	a5
    4284:	f0e007b7          	lui	a5,0xf0e00
    4288:	0087a223          	sw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    428c:	fa5ff06f          	j	4230 <isr+0x48>
    4290:	00040593          	mv	a1,s0
    4294:	9dc90513          	addi	a0,s2,-1572 # 79dc <crc_table+0x5c4>
    4298:	838fe0ef          	jal	ra,22d0 <printf>
    429c:	f0c027b7          	lui	a5,0xf0c02
    42a0:	0007a583          	lw	a1,0(a5) # f0c02000 <_fstack+0xe0c01000>
    42a4:	9fc98513          	addi	a0,s3,-1540 # 79fc <crc_table+0x5e4>
    42a8:	828fe0ef          	jal	ra,22d0 <printf>
    42ac:	f0c017b7          	lui	a5,0xf0c01
    42b0:	0007a583          	lw	a1,0(a5) # f0c01000 <_fstack+0xe0c00000>
    42b4:	a18a0513          	addi	a0,s4,-1512 # 7a18 <crc_table+0x600>
    42b8:	818fe0ef          	jal	ra,22d0 <printf>
    42bc:	341025f3          	csrr	a1,mepc
    42c0:	a34a8513          	addi	a0,s5,-1484 # 7a34 <crc_table+0x61c>
    42c4:	80cfe0ef          	jal	ra,22d0 <printf>
    42c8:	342025f3          	csrr	a1,mcause
    42cc:	a48b0513          	addi	a0,s6,-1464 # 7a48 <crc_table+0x630>
    42d0:	800fe0ef          	jal	ra,22d0 <printf>
    42d4:	343025f3          	csrr	a1,mtval
    42d8:	a5cb8513          	addi	a0,s7,-1444 # 7a5c <crc_table+0x644>
    42dc:	ff5fd0ef          	jal	ra,22d0 <printf>
    42e0:	304025f3          	csrr	a1,mie
    42e4:	00008537          	lui	a0,0x8
    42e8:	a7050513          	addi	a0,a0,-1424 # 7a70 <crc_table+0x658>
    42ec:	fe5fd0ef          	jal	ra,22d0 <printf>
    42f0:	344025f3          	csrr	a1,mip
    42f4:	00008537          	lui	a0,0x8
    42f8:	a8450513          	addi	a0,a0,-1404 # 7a84 <crc_table+0x66c>
    42fc:	fd5fd0ef          	jal	ra,22d0 <printf>
    4300:	00008537          	lui	a0,0x8
    4304:	a9850513          	addi	a0,a0,-1384 # 7a98 <crc_table+0x680>
    4308:	fc9fd0ef          	jal	ra,22d0 <printf>
    430c:	f79ff06f          	j	4284 <isr+0x9c>

00004310 <ff_uni2oem>:
    4310:	07f00793          	li	a5,127
    4314:	00050713          	mv	a4,a0
    4318:	00a7e863          	bltu	a5,a0,4328 <ff_uni2oem+0x18>
    431c:	01051513          	slli	a0,a0,0x10
    4320:	01055513          	srli	a0,a0,0x10
    4324:	00008067          	ret
    4328:	000107b7          	lui	a5,0x10
    432c:	00000513          	li	a0,0
    4330:	04f77063          	bgeu	a4,a5,4370 <ff_uni2oem+0x60>
    4334:	1b500793          	li	a5,437
    4338:	02f59c63          	bne	a1,a5,4370 <ff_uni2oem+0x60>
    433c:	000086b7          	lui	a3,0x8
    4340:	adc68693          	addi	a3,a3,-1316 # 7adc <uc437>
    4344:	00000793          	li	a5,0
    4348:	08000593          	li	a1,128
    434c:	0006d603          	lhu	a2,0(a3)
    4350:	00e60c63          	beq	a2,a4,4368 <ff_uni2oem+0x58>
    4354:	00178793          	addi	a5,a5,1 # 10001 <_edata_rom+0x7e8d>
    4358:	01079793          	slli	a5,a5,0x10
    435c:	0107d793          	srli	a5,a5,0x10
    4360:	00268693          	addi	a3,a3,2
    4364:	feb794e3          	bne	a5,a1,434c <ff_uni2oem+0x3c>
    4368:	08078513          	addi	a0,a5,128
    436c:	0ff57513          	andi	a0,a0,255
    4370:	00008067          	ret

00004374 <ff_oem2uni>:
    4374:	07f00793          	li	a5,127
    4378:	02a7f863          	bgeu	a5,a0,43a8 <ff_oem2uni+0x34>
    437c:	1b500793          	li	a5,437
    4380:	02f59263          	bne	a1,a5,43a4 <ff_oem2uni+0x30>
    4384:	0ff00793          	li	a5,255
    4388:	00a7ee63          	bltu	a5,a0,43a4 <ff_oem2uni+0x30>
    438c:	000087b7          	lui	a5,0x8
    4390:	adc78793          	addi	a5,a5,-1316 # 7adc <uc437>
    4394:	00151513          	slli	a0,a0,0x1
    4398:	00a78533          	add	a0,a5,a0
    439c:	f0055503          	lhu	a0,-256(a0)
    43a0:	00008067          	ret
    43a4:	00000513          	li	a0,0
    43a8:	00008067          	ret

000043ac <ff_wtoupper>:
    43ac:	000107b7          	lui	a5,0x10
    43b0:	06f57e63          	bgeu	a0,a5,442c <ff_wtoupper+0x80>
    43b4:	000086b7          	lui	a3,0x8
    43b8:	01051793          	slli	a5,a0,0x10
    43bc:	adc68693          	addi	a3,a3,-1316 # 7adc <uc437>
    43c0:	00001637          	lui	a2,0x1
    43c4:	0107d793          	srli	a5,a5,0x10
    43c8:	10068713          	addi	a4,a3,256
    43cc:	00c56463          	bltu	a0,a2,43d4 <ff_wtoupper+0x28>
    43d0:	2f468713          	addi	a4,a3,756
    43d4:	00075683          	lhu	a3,0(a4)
    43d8:	04068863          	beqz	a3,4428 <ff_wtoupper+0x7c>
    43dc:	04d7e663          	bltu	a5,a3,4428 <ff_wtoupper+0x7c>
    43e0:	00275603          	lhu	a2,2(a4)
    43e4:	00470713          	addi	a4,a4,4
    43e8:	00865593          	srli	a1,a2,0x8
    43ec:	0ff67613          	andi	a2,a2,255
    43f0:	00d60833          	add	a6,a2,a3
    43f4:	09055a63          	bge	a0,a6,4488 <ff_wtoupper+0xdc>
    43f8:	00800613          	li	a2,8
    43fc:	02b66663          	bltu	a2,a1,4428 <ff_wtoupper+0x7c>
    4400:	00008637          	lui	a2,0x8
    4404:	ab860613          	addi	a2,a2,-1352 # 7ab8 <crc_table+0x6a0>
    4408:	00259593          	slli	a1,a1,0x2
    440c:	00c585b3          	add	a1,a1,a2
    4410:	0005a603          	lw	a2,0(a1)
    4414:	00060067          	jr	a2
    4418:	40d50533          	sub	a0,a0,a3
    441c:	00151513          	slli	a0,a0,0x1
    4420:	00a70533          	add	a0,a4,a0
    4424:	00055783          	lhu	a5,0(a0)
    4428:	00078513          	mv	a0,a5
    442c:	00008067          	ret
    4430:	40d78533          	sub	a0,a5,a3
    4434:	00157513          	andi	a0,a0,1
    4438:	40a787b3          	sub	a5,a5,a0
    443c:	01079793          	slli	a5,a5,0x10
    4440:	0107d793          	srli	a5,a5,0x10
    4444:	fe5ff06f          	j	4428 <ff_wtoupper+0x7c>
    4448:	ff078793          	addi	a5,a5,-16 # fff0 <_edata_rom+0x7e7c>
    444c:	ff1ff06f          	j	443c <ff_wtoupper+0x90>
    4450:	fe078793          	addi	a5,a5,-32
    4454:	fe9ff06f          	j	443c <ff_wtoupper+0x90>
    4458:	fd078793          	addi	a5,a5,-48
    445c:	fe1ff06f          	j	443c <ff_wtoupper+0x90>
    4460:	fe678793          	addi	a5,a5,-26
    4464:	fd9ff06f          	j	443c <ff_wtoupper+0x90>
    4468:	00878793          	addi	a5,a5,8
    446c:	fd1ff06f          	j	443c <ff_wtoupper+0x90>
    4470:	fb078793          	addi	a5,a5,-80
    4474:	fc9ff06f          	j	443c <ff_wtoupper+0x90>
    4478:	ffffe737          	lui	a4,0xffffe
    447c:	3a070713          	addi	a4,a4,928 # ffffe3a0 <_fstack+0xefffd3a0>
    4480:	00e787b3          	add	a5,a5,a4
    4484:	fb9ff06f          	j	443c <ff_wtoupper+0x90>
    4488:	f40596e3          	bnez	a1,43d4 <ff_wtoupper+0x28>
    448c:	00161613          	slli	a2,a2,0x1
    4490:	00c70733          	add	a4,a4,a2
    4494:	f41ff06f          	j	43d4 <ff_wtoupper+0x28>

00004498 <ld_dword>:
    4498:	00354783          	lbu	a5,3(a0)
    449c:	00254703          	lbu	a4,2(a0)
    44a0:	00879793          	slli	a5,a5,0x8
    44a4:	00e7e7b3          	or	a5,a5,a4
    44a8:	00154703          	lbu	a4,1(a0)
    44ac:	00879793          	slli	a5,a5,0x8
    44b0:	00054503          	lbu	a0,0(a0)
    44b4:	00f767b3          	or	a5,a4,a5
    44b8:	00879793          	slli	a5,a5,0x8
    44bc:	00f56533          	or	a0,a0,a5
    44c0:	00008067          	ret

000044c4 <mem_cmp>:
    44c4:	00050793          	mv	a5,a0
    44c8:	00c50633          	add	a2,a0,a2
    44cc:	0007c503          	lbu	a0,0(a5)
    44d0:	0005c703          	lbu	a4,0(a1)
    44d4:	00178793          	addi	a5,a5,1
    44d8:	00158593          	addi	a1,a1,1
    44dc:	40e50533          	sub	a0,a0,a4
    44e0:	00c78463          	beq	a5,a2,44e8 <mem_cmp+0x24>
    44e4:	fe0504e3          	beqz	a0,44cc <mem_cmp+0x8>
    44e8:	00008067          	ret

000044ec <clst2sect>:
    44ec:	01052703          	lw	a4,16(a0)
    44f0:	ffe58793          	addi	a5,a1,-2
    44f4:	ffe70713          	addi	a4,a4,-2
    44f8:	00e7fc63          	bgeu	a5,a4,4510 <clst2sect+0x24>
    44fc:	00a55583          	lhu	a1,10(a0)
    4500:	02452503          	lw	a0,36(a0)
    4504:	02f585b3          	mul	a1,a1,a5
    4508:	00a58533          	add	a0,a1,a0
    450c:	00008067          	ret
    4510:	00000513          	li	a0,0
    4514:	00008067          	ret

00004518 <get_ldnumber>:
    4518:	00052703          	lw	a4,0(a0)
    451c:	00050693          	mv	a3,a0
    4520:	02070463          	beqz	a4,4548 <get_ldnumber+0x30>
    4524:	00070793          	mv	a5,a4
    4528:	01f00513          	li	a0,31
    452c:	03a00593          	li	a1,58
    4530:	0007c603          	lbu	a2,0(a5)
    4534:	00178793          	addi	a5,a5,1
    4538:	02c57663          	bgeu	a0,a2,4564 <get_ldnumber+0x4c>
    453c:	feb61ae3          	bne	a2,a1,4530 <get_ldnumber+0x18>
    4540:	00270613          	addi	a2,a4,2
    4544:	00c78663          	beq	a5,a2,4550 <get_ldnumber+0x38>
    4548:	fff00513          	li	a0,-1
    454c:	00008067          	ret
    4550:	00074603          	lbu	a2,0(a4)
    4554:	03000713          	li	a4,48
    4558:	fff00513          	li	a0,-1
    455c:	fee618e3          	bne	a2,a4,454c <get_ldnumber+0x34>
    4560:	00f6a023          	sw	a5,0(a3)
    4564:	00000513          	li	a0,0
    4568:	00008067          	ret

0000456c <validate>:
    456c:	ff010113          	addi	sp,sp,-16
    4570:	00912223          	sw	s1,4(sp)
    4574:	00112623          	sw	ra,12(sp)
    4578:	00812423          	sw	s0,8(sp)
    457c:	00058493          	mv	s1,a1
    4580:	02051263          	bnez	a0,45a4 <validate+0x38>
    4584:	00900513          	li	a0,9
    4588:	00000793          	li	a5,0
    458c:	00c12083          	lw	ra,12(sp)
    4590:	00812403          	lw	s0,8(sp)
    4594:	00f4a023          	sw	a5,0(s1)
    4598:	00412483          	lw	s1,4(sp)
    459c:	01010113          	addi	sp,sp,16
    45a0:	00008067          	ret
    45a4:	00052783          	lw	a5,0(a0)
    45a8:	00050413          	mv	s0,a0
    45ac:	fc078ce3          	beqz	a5,4584 <validate+0x18>
    45b0:	0007c703          	lbu	a4,0(a5)
    45b4:	fc0708e3          	beqz	a4,4584 <validate+0x18>
    45b8:	00455683          	lhu	a3,4(a0)
    45bc:	0067d703          	lhu	a4,6(a5)
    45c0:	fce692e3          	bne	a3,a4,4584 <validate+0x18>
    45c4:	10000737          	lui	a4,0x10000
    45c8:	4b872703          	lw	a4,1208(a4) # 100004b8 <FfDiskOps>
    45cc:	0017c503          	lbu	a0,1(a5)
    45d0:	00472703          	lw	a4,4(a4)
    45d4:	000700e7          	jalr	a4
    45d8:	00157513          	andi	a0,a0,1
    45dc:	fa0514e3          	bnez	a0,4584 <validate+0x18>
    45e0:	00042783          	lw	a5,0(s0)
    45e4:	fa9ff06f          	j	458c <validate+0x20>

000045e8 <move_window>:
    45e8:	02852783          	lw	a5,40(a0)
    45ec:	06b78063          	beq	a5,a1,464c <move_window+0x64>
    45f0:	100007b7          	lui	a5,0x10000
    45f4:	4b87a783          	lw	a5,1208(a5) # 100004b8 <FfDiskOps>
    45f8:	ff010113          	addi	sp,sp,-16
    45fc:	00812423          	sw	s0,8(sp)
    4600:	00912223          	sw	s1,4(sp)
    4604:	00112623          	sw	ra,12(sp)
    4608:	00050413          	mv	s0,a0
    460c:	00058493          	mv	s1,a1
    4610:	00058613          	mv	a2,a1
    4614:	0087a783          	lw	a5,8(a5)
    4618:	02c50593          	addi	a1,a0,44
    461c:	00154503          	lbu	a0,1(a0)
    4620:	00100693          	li	a3,1
    4624:	000780e7          	jalr	a5
    4628:	00050663          	beqz	a0,4634 <move_window+0x4c>
    462c:	00100513          	li	a0,1
    4630:	fff00493          	li	s1,-1
    4634:	02942423          	sw	s1,40(s0)
    4638:	00c12083          	lw	ra,12(sp)
    463c:	00812403          	lw	s0,8(sp)
    4640:	00412483          	lw	s1,4(sp)
    4644:	01010113          	addi	sp,sp,16
    4648:	00008067          	ret
    464c:	00000513          	li	a0,0
    4650:	00008067          	ret

00004654 <get_fat.isra.0>:
    4654:	00100793          	li	a5,1
    4658:	14b7f263          	bgeu	a5,a1,479c <get_fat.isra.0+0x148>
    465c:	01052703          	lw	a4,16(a0)
    4660:	fe010113          	addi	sp,sp,-32
    4664:	00812c23          	sw	s0,24(sp)
    4668:	00912a23          	sw	s1,20(sp)
    466c:	00112e23          	sw	ra,28(sp)
    4670:	01212823          	sw	s2,16(sp)
    4674:	01312623          	sw	s3,12(sp)
    4678:	00050493          	mv	s1,a0
    467c:	00058413          	mv	s0,a1
    4680:	02e5fe63          	bgeu	a1,a4,46bc <get_fat.isra.0+0x68>
    4684:	00054703          	lbu	a4,0(a0)
    4688:	00200693          	li	a3,2
    468c:	0ad70463          	beq	a4,a3,4734 <get_fat.isra.0+0xe0>
    4690:	00300693          	li	a3,3
    4694:	0cd70c63          	beq	a4,a3,476c <get_fat.isra.0+0x118>
    4698:	02f71263          	bne	a4,a5,46bc <get_fat.isra.0+0x68>
    469c:	0015d913          	srli	s2,a1,0x1
    46a0:	01c52783          	lw	a5,28(a0)
    46a4:	00b90933          	add	s2,s2,a1
    46a8:	00995593          	srli	a1,s2,0x9
    46ac:	00f585b3          	add	a1,a1,a5
    46b0:	f39ff0ef          	jal	ra,45e8 <move_window>
    46b4:	02050463          	beqz	a0,46dc <get_fat.isra.0+0x88>
    46b8:	fff00793          	li	a5,-1
    46bc:	01c12083          	lw	ra,28(sp)
    46c0:	01812403          	lw	s0,24(sp)
    46c4:	01412483          	lw	s1,20(sp)
    46c8:	01012903          	lw	s2,16(sp)
    46cc:	00c12983          	lw	s3,12(sp)
    46d0:	00078513          	mv	a0,a5
    46d4:	02010113          	addi	sp,sp,32
    46d8:	00008067          	ret
    46dc:	01c4a783          	lw	a5,28(s1)
    46e0:	00190993          	addi	s3,s2,1
    46e4:	0099d593          	srli	a1,s3,0x9
    46e8:	1ff97913          	andi	s2,s2,511
    46ec:	01248933          	add	s2,s1,s2
    46f0:	00f585b3          	add	a1,a1,a5
    46f4:	00048513          	mv	a0,s1
    46f8:	02c94903          	lbu	s2,44(s2)
    46fc:	eedff0ef          	jal	ra,45e8 <move_window>
    4700:	fa051ce3          	bnez	a0,46b8 <get_fat.isra.0+0x64>
    4704:	1ff9f993          	andi	s3,s3,511
    4708:	013484b3          	add	s1,s1,s3
    470c:	02c4c783          	lbu	a5,44(s1)
    4710:	00147413          	andi	s0,s0,1
    4714:	00879793          	slli	a5,a5,0x8
    4718:	0127e7b3          	or	a5,a5,s2
    471c:	00040663          	beqz	s0,4728 <get_fat.isra.0+0xd4>
    4720:	0047d793          	srli	a5,a5,0x4
    4724:	f99ff06f          	j	46bc <get_fat.isra.0+0x68>
    4728:	01479793          	slli	a5,a5,0x14
    472c:	0147d793          	srli	a5,a5,0x14
    4730:	f8dff06f          	j	46bc <get_fat.isra.0+0x68>
    4734:	01c52783          	lw	a5,28(a0)
    4738:	0085d593          	srli	a1,a1,0x8
    473c:	00f585b3          	add	a1,a1,a5
    4740:	ea9ff0ef          	jal	ra,45e8 <move_window>
    4744:	f6051ae3          	bnez	a0,46b8 <get_fat.isra.0+0x64>
    4748:	00141413          	slli	s0,s0,0x1
    474c:	02c48493          	addi	s1,s1,44
    4750:	1fe47413          	andi	s0,s0,510
    4754:	008484b3          	add	s1,s1,s0
    4758:	0014c783          	lbu	a5,1(s1)
    475c:	0004c503          	lbu	a0,0(s1)
    4760:	00879793          	slli	a5,a5,0x8
    4764:	00a7e7b3          	or	a5,a5,a0
    4768:	f55ff06f          	j	46bc <get_fat.isra.0+0x68>
    476c:	01c52783          	lw	a5,28(a0)
    4770:	0075d593          	srli	a1,a1,0x7
    4774:	00f585b3          	add	a1,a1,a5
    4778:	e71ff0ef          	jal	ra,45e8 <move_window>
    477c:	f2051ee3          	bnez	a0,46b8 <get_fat.isra.0+0x64>
    4780:	00241413          	slli	s0,s0,0x2
    4784:	02c48513          	addi	a0,s1,44
    4788:	1fc47413          	andi	s0,s0,508
    478c:	00850533          	add	a0,a0,s0
    4790:	d09ff0ef          	jal	ra,4498 <ld_dword>
    4794:	00451793          	slli	a5,a0,0x4
    4798:	f89ff06f          	j	4720 <get_fat.isra.0+0xcc>
    479c:	00100793          	li	a5,1
    47a0:	00078513          	mv	a0,a5
    47a4:	00008067          	ret

000047a8 <dir_next.isra.0>:
    47a8:	fe010113          	addi	sp,sp,-32
    47ac:	01212823          	sw	s2,16(sp)
    47b0:	01052903          	lw	s2,16(a0)
    47b4:	00812c23          	sw	s0,24(sp)
    47b8:	00912a23          	sw	s1,20(sp)
    47bc:	00112e23          	sw	ra,28(sp)
    47c0:	01312623          	sw	s3,12(sp)
    47c4:	02090913          	addi	s2,s2,32
    47c8:	002007b7          	lui	a5,0x200
    47cc:	00052483          	lw	s1,0(a0)
    47d0:	00050413          	mv	s0,a0
    47d4:	00f96463          	bltu	s2,a5,47dc <dir_next.isra.0+0x34>
    47d8:	00052c23          	sw	zero,24(a0)
    47dc:	01842783          	lw	a5,24(s0)
    47e0:	00400513          	li	a0,4
    47e4:	02078863          	beqz	a5,4814 <dir_next.isra.0+0x6c>
    47e8:	1ff97993          	andi	s3,s2,511
    47ec:	08099a63          	bnez	s3,4880 <dir_next.isra.0+0xd8>
    47f0:	01442583          	lw	a1,20(s0)
    47f4:	00178793          	addi	a5,a5,1 # 200001 <_edata_rom+0x1f7e8d>
    47f8:	00f42c23          	sw	a5,24(s0)
    47fc:	02059a63          	bnez	a1,4830 <dir_next.isra.0+0x88>
    4800:	0084d703          	lhu	a4,8(s1)
    4804:	00595793          	srli	a5,s2,0x5
    4808:	06e7ec63          	bltu	a5,a4,4880 <dir_next.isra.0+0xd8>
    480c:	00042c23          	sw	zero,24(s0)
    4810:	00400513          	li	a0,4
    4814:	01c12083          	lw	ra,28(sp)
    4818:	01812403          	lw	s0,24(sp)
    481c:	01412483          	lw	s1,20(sp)
    4820:	01012903          	lw	s2,16(sp)
    4824:	00c12983          	lw	s3,12(sp)
    4828:	02010113          	addi	sp,sp,32
    482c:	00008067          	ret
    4830:	00a4d783          	lhu	a5,10(s1)
    4834:	00995713          	srli	a4,s2,0x9
    4838:	fff78793          	addi	a5,a5,-1
    483c:	00e7f7b3          	and	a5,a5,a4
    4840:	04079063          	bnez	a5,4880 <dir_next.isra.0+0xd8>
    4844:	00048513          	mv	a0,s1
    4848:	e0dff0ef          	jal	ra,4654 <get_fat.isra.0>
    484c:	00050593          	mv	a1,a0
    4850:	00100793          	li	a5,1
    4854:	00200513          	li	a0,2
    4858:	fab7fee3          	bgeu	a5,a1,4814 <dir_next.isra.0+0x6c>
    485c:	fff00793          	li	a5,-1
    4860:	00100513          	li	a0,1
    4864:	faf588e3          	beq	a1,a5,4814 <dir_next.isra.0+0x6c>
    4868:	0104a783          	lw	a5,16(s1)
    486c:	faf5f0e3          	bgeu	a1,a5,480c <dir_next.isra.0+0x64>
    4870:	00b42a23          	sw	a1,20(s0)
    4874:	00048513          	mv	a0,s1
    4878:	c75ff0ef          	jal	ra,44ec <clst2sect>
    487c:	00a42c23          	sw	a0,24(s0)
    4880:	02c48493          	addi	s1,s1,44
    4884:	013484b3          	add	s1,s1,s3
    4888:	01242823          	sw	s2,16(s0)
    488c:	00942e23          	sw	s1,28(s0)
    4890:	00000513          	li	a0,0
    4894:	f81ff06f          	j	4814 <dir_next.isra.0+0x6c>

00004898 <ld_clust.isra.0>:
    4898:	01b5c783          	lbu	a5,27(a1)
    489c:	01a5c703          	lbu	a4,26(a1)
    48a0:	00879793          	slli	a5,a5,0x8
    48a4:	00e7e7b3          	or	a5,a5,a4
    48a8:	00300713          	li	a4,3
    48ac:	00e51e63          	bne	a0,a4,48c8 <ld_clust.isra.0+0x30>
    48b0:	0155c703          	lbu	a4,21(a1)
    48b4:	0145c683          	lbu	a3,20(a1)
    48b8:	00871713          	slli	a4,a4,0x8
    48bc:	00d76733          	or	a4,a4,a3
    48c0:	01071713          	slli	a4,a4,0x10
    48c4:	00e7e7b3          	or	a5,a5,a4
    48c8:	00078513          	mv	a0,a5
    48cc:	00008067          	ret

000048d0 <check_fs>:
    48d0:	ff010113          	addi	sp,sp,-16
    48d4:	00812423          	sw	s0,8(sp)
    48d8:	00912223          	sw	s1,4(sp)
    48dc:	00112623          	sw	ra,12(sp)
    48e0:	fff00793          	li	a5,-1
    48e4:	000501a3          	sb	zero,3(a0)
    48e8:	02f52423          	sw	a5,40(a0)
    48ec:	00050413          	mv	s0,a0
    48f0:	cf9ff0ef          	jal	ra,45e8 <move_window>
    48f4:	00400493          	li	s1,4
    48f8:	06051e63          	bnez	a0,4974 <check_fs+0xa4>
    48fc:	22b44783          	lbu	a5,555(s0)
    4900:	22a44703          	lbu	a4,554(s0)
    4904:	00300493          	li	s1,3
    4908:	00879793          	slli	a5,a5,0x8
    490c:	00e7e7b3          	or	a5,a5,a4
    4910:	01079793          	slli	a5,a5,0x10
    4914:	ffffb737          	lui	a4,0xffffb
    4918:	4107d793          	srai	a5,a5,0x10
    491c:	a5570713          	addi	a4,a4,-1451 # ffffaa55 <_fstack+0xefff9a55>
    4920:	04e79a63          	bne	a5,a4,4974 <check_fs+0xa4>
    4924:	02c44783          	lbu	a5,44(s0)
    4928:	0eb00713          	li	a4,235
    492c:	00050493          	mv	s1,a0
    4930:	00e78a63          	beq	a5,a4,4944 <check_fs+0x74>
    4934:	01878793          	addi	a5,a5,24
    4938:	0ff7f793          	andi	a5,a5,255
    493c:	00100713          	li	a4,1
    4940:	04f76663          	bltu	a4,a5,498c <check_fs+0xbc>
    4944:	000085b7          	lui	a1,0x8
    4948:	00300613          	li	a2,3
    494c:	e8c58593          	addi	a1,a1,-372 # 7e8c <cvt2.1220+0xbc>
    4950:	06240513          	addi	a0,s0,98
    4954:	b71ff0ef          	jal	ra,44c4 <mem_cmp>
    4958:	00050e63          	beqz	a0,4974 <check_fs+0xa4>
    495c:	000085b7          	lui	a1,0x8
    4960:	00500613          	li	a2,5
    4964:	e9058593          	addi	a1,a1,-368 # 7e90 <cvt2.1220+0xc0>
    4968:	07e40513          	addi	a0,s0,126
    496c:	b59ff0ef          	jal	ra,44c4 <mem_cmp>
    4970:	00051e63          	bnez	a0,498c <check_fs+0xbc>
    4974:	00c12083          	lw	ra,12(sp)
    4978:	00812403          	lw	s0,8(sp)
    497c:	00048513          	mv	a0,s1
    4980:	00412483          	lw	s1,4(sp)
    4984:	01010113          	addi	sp,sp,16
    4988:	00008067          	ret
    498c:	00200493          	li	s1,2
    4990:	fe5ff06f          	j	4974 <check_fs+0xa4>

00004994 <mount_volume.isra.0>:
    4994:	fd010113          	addi	sp,sp,-48
    4998:	03212023          	sw	s2,32(sp)
    499c:	02112623          	sw	ra,44(sp)
    49a0:	02812423          	sw	s0,40(sp)
    49a4:	02912223          	sw	s1,36(sp)
    49a8:	01312e23          	sw	s3,28(sp)
    49ac:	01412c23          	sw	s4,24(sp)
    49b0:	01512a23          	sw	s5,20(sp)
    49b4:	01612823          	sw	s6,16(sp)
    49b8:	0005a023          	sw	zero,0(a1)
    49bc:	00058913          	mv	s2,a1
    49c0:	b59ff0ef          	jal	ra,4518 <get_ldnumber>
    49c4:	30054863          	bltz	a0,4cd4 <mount_volume.isra.0+0x340>
    49c8:	10000737          	lui	a4,0x10000
    49cc:	00251793          	slli	a5,a0,0x2
    49d0:	19470713          	addi	a4,a4,404 # 10000194 <FatFs>
    49d4:	00e787b3          	add	a5,a5,a4
    49d8:	0007a403          	lw	s0,0(a5)
    49dc:	00050493          	mv	s1,a0
    49e0:	00c00513          	li	a0,12
    49e4:	02040c63          	beqz	s0,4a1c <mount_volume.isra.0+0x88>
    49e8:	00892023          	sw	s0,0(s2)
    49ec:	00044783          	lbu	a5,0(s0)
    49f0:	10000937          	lui	s2,0x10000
    49f4:	04079863          	bnez	a5,4a44 <mount_volume.isra.0+0xb0>
    49f8:	0ff4f513          	andi	a0,s1,255
    49fc:	00040023          	sb	zero,0(s0)
    4a00:	00a400a3          	sb	a0,1(s0)
    4a04:	4b892783          	lw	a5,1208(s2) # 100004b8 <FfDiskOps>
    4a08:	0007a783          	lw	a5,0(a5)
    4a0c:	000780e7          	jalr	a5
    4a10:	00157793          	andi	a5,a0,1
    4a14:	00300513          	li	a0,3
    4a18:	04078663          	beqz	a5,4a64 <mount_volume.isra.0+0xd0>
    4a1c:	02c12083          	lw	ra,44(sp)
    4a20:	02812403          	lw	s0,40(sp)
    4a24:	02412483          	lw	s1,36(sp)
    4a28:	02012903          	lw	s2,32(sp)
    4a2c:	01c12983          	lw	s3,28(sp)
    4a30:	01812a03          	lw	s4,24(sp)
    4a34:	01412a83          	lw	s5,20(sp)
    4a38:	01012b03          	lw	s6,16(sp)
    4a3c:	03010113          	addi	sp,sp,48
    4a40:	00008067          	ret
    4a44:	4b892783          	lw	a5,1208(s2)
    4a48:	00144503          	lbu	a0,1(s0)
    4a4c:	0047a783          	lw	a5,4(a5)
    4a50:	000780e7          	jalr	a5
    4a54:	00157793          	andi	a5,a0,1
    4a58:	00000513          	li	a0,0
    4a5c:	f8079ee3          	bnez	a5,49f8 <mount_volume.isra.0+0x64>
    4a60:	fbdff06f          	j	4a1c <mount_volume.isra.0+0x88>
    4a64:	00000593          	li	a1,0
    4a68:	00040513          	mv	a0,s0
    4a6c:	e65ff0ef          	jal	ra,48d0 <check_fs>
    4a70:	00200713          	li	a4,2
    4a74:	00050793          	mv	a5,a0
    4a78:	06e51663          	bne	a0,a4,4ae4 <mount_volume.isra.0+0x150>
    4a7c:	00010493          	mv	s1,sp
    4a80:	1f240913          	addi	s2,s0,498
    4a84:	23240a13          	addi	s4,s0,562
    4a88:	00048993          	mv	s3,s1
    4a8c:	00090513          	mv	a0,s2
    4a90:	a09ff0ef          	jal	ra,4498 <ld_dword>
    4a94:	00a9a023          	sw	a0,0(s3)
    4a98:	01090913          	addi	s2,s2,16
    4a9c:	00498993          	addi	s3,s3,4
    4aa0:	ff2a16e3          	bne	s4,s2,4a8c <mount_volume.isra.0+0xf8>
    4aa4:	01048913          	addi	s2,s1,16
    4aa8:	00100993          	li	s3,1
    4aac:	0004a583          	lw	a1,0(s1)
    4ab0:	00300793          	li	a5,3
    4ab4:	00058a63          	beqz	a1,4ac8 <mount_volume.isra.0+0x134>
    4ab8:	00040513          	mv	a0,s0
    4abc:	e15ff0ef          	jal	ra,48d0 <check_fs>
    4ac0:	00050793          	mv	a5,a0
    4ac4:	02a9fa63          	bgeu	s3,a0,4af8 <mount_volume.isra.0+0x164>
    4ac8:	00448493          	addi	s1,s1,4
    4acc:	fe9910e3          	bne	s2,s1,4aac <mount_volume.isra.0+0x118>
    4ad0:	00400713          	li	a4,4
    4ad4:	00100513          	li	a0,1
    4ad8:	f4e782e3          	beq	a5,a4,4a1c <mount_volume.isra.0+0x88>
    4adc:	00d00513          	li	a0,13
    4ae0:	f3dff06f          	j	4a1c <mount_volume.isra.0+0x88>
    4ae4:	00400713          	li	a4,4
    4ae8:	00100513          	li	a0,1
    4aec:	f2e788e3          	beq	a5,a4,4a1c <mount_volume.isra.0+0x88>
    4af0:	00100713          	li	a4,1
    4af4:	fef764e3          	bltu	a4,a5,4adc <mount_volume.isra.0+0x148>
    4af8:	03844783          	lbu	a5,56(s0)
    4afc:	03744703          	lbu	a4,55(s0)
    4b00:	00879793          	slli	a5,a5,0x8
    4b04:	00e7e7b3          	or	a5,a5,a4
    4b08:	01079793          	slli	a5,a5,0x10
    4b0c:	4107d793          	srai	a5,a5,0x10
    4b10:	20000713          	li	a4,512
    4b14:	fce794e3          	bne	a5,a4,4adc <mount_volume.isra.0+0x148>
    4b18:	04344903          	lbu	s2,67(s0)
    4b1c:	04244503          	lbu	a0,66(s0)
    4b20:	00891913          	slli	s2,s2,0x8
    4b24:	00a96933          	or	s2,s2,a0
    4b28:	00091863          	bnez	s2,4b38 <mount_volume.isra.0+0x1a4>
    4b2c:	05040513          	addi	a0,s0,80
    4b30:	969ff0ef          	jal	ra,4498 <ld_dword>
    4b34:	00050913          	mv	s2,a0
    4b38:	03c44483          	lbu	s1,60(s0)
    4b3c:	01242a23          	sw	s2,20(s0)
    4b40:	00100713          	li	a4,1
    4b44:	fff48793          	addi	a5,s1,-1
    4b48:	00940123          	sb	s1,2(s0)
    4b4c:	0ff7f793          	andi	a5,a5,255
    4b50:	02842b03          	lw	s6,40(s0)
    4b54:	f8f764e3          	bltu	a4,a5,4adc <mount_volume.isra.0+0x148>
    4b58:	03944a03          	lbu	s4,57(s0)
    4b5c:	010a1793          	slli	a5,s4,0x10
    4b60:	0107d793          	srli	a5,a5,0x10
    4b64:	00f41523          	sh	a5,10(s0)
    4b68:	f6078ae3          	beqz	a5,4adc <mount_volume.isra.0+0x148>
    4b6c:	fffa0793          	addi	a5,s4,-1
    4b70:	0147f7b3          	and	a5,a5,s4
    4b74:	f60794e3          	bnez	a5,4adc <mount_volume.isra.0+0x148>
    4b78:	03e44983          	lbu	s3,62(s0)
    4b7c:	03d44783          	lbu	a5,61(s0)
    4b80:	00899993          	slli	s3,s3,0x8
    4b84:	00f9e9b3          	or	s3,s3,a5
    4b88:	01099a93          	slli	s5,s3,0x10
    4b8c:	01099993          	slli	s3,s3,0x10
    4b90:	0109d993          	srli	s3,s3,0x10
    4b94:	01341423          	sh	s3,8(s0)
    4b98:	00f9f793          	andi	a5,s3,15
    4b9c:	410ada93          	srai	s5,s5,0x10
    4ba0:	f2079ee3          	bnez	a5,4adc <mount_volume.isra.0+0x148>
    4ba4:	04044783          	lbu	a5,64(s0)
    4ba8:	03f44503          	lbu	a0,63(s0)
    4bac:	00879793          	slli	a5,a5,0x8
    4bb0:	00a7e533          	or	a0,a5,a0
    4bb4:	00051663          	bnez	a0,4bc0 <mount_volume.isra.0+0x22c>
    4bb8:	04c40513          	addi	a0,s0,76
    4bbc:	8ddff0ef          	jal	ra,4498 <ld_dword>
    4bc0:	03b44703          	lbu	a4,59(s0)
    4bc4:	03a44783          	lbu	a5,58(s0)
    4bc8:	00871713          	slli	a4,a4,0x8
    4bcc:	00f76733          	or	a4,a4,a5
    4bd0:	f00706e3          	beqz	a4,4adc <mount_volume.isra.0+0x148>
    4bd4:	03248633          	mul	a2,s1,s2
    4bd8:	0049d693          	srli	a3,s3,0x4
    4bdc:	00e686b3          	add	a3,a3,a4
    4be0:	00c686b3          	add	a3,a3,a2
    4be4:	eed56ce3          	bltu	a0,a3,4adc <mount_volume.isra.0+0x148>
    4be8:	40d507b3          	sub	a5,a0,a3
    4bec:	0347d4b3          	divu	s1,a5,s4
    4bf0:	ef47e6e3          	bltu	a5,s4,4adc <mount_volume.isra.0+0x148>
    4bf4:	100007b7          	lui	a5,0x10000
    4bf8:	ff578793          	addi	a5,a5,-11 # ffffff5 <_edata_rom+0xfff7e81>
    4bfc:	ee97e0e3          	bltu	a5,s1,4adc <mount_volume.isra.0+0x148>
    4c00:	000107b7          	lui	a5,0x10
    4c04:	ff578793          	addi	a5,a5,-11 # fff5 <_edata_rom+0x7e81>
    4c08:	0c97fa63          	bgeu	a5,s1,4cdc <mount_volume.isra.0+0x348>
    4c0c:	00300a13          	li	s4,3
    4c10:	00248493          	addi	s1,s1,2
    4c14:	00eb0733          	add	a4,s6,a4
    4c18:	00db06b3          	add	a3,s6,a3
    4c1c:	00942823          	sw	s1,16(s0)
    4c20:	01642c23          	sw	s6,24(s0)
    4c24:	00e42e23          	sw	a4,28(s0)
    4c28:	02d42223          	sw	a3,36(s0)
    4c2c:	00300793          	li	a5,3
    4c30:	06fa1a63          	bne	s4,a5,4ca4 <mount_volume.isra.0+0x310>
    4c34:	05744783          	lbu	a5,87(s0)
    4c38:	05644703          	lbu	a4,86(s0)
    4c3c:	00879793          	slli	a5,a5,0x8
    4c40:	00e7e7b3          	or	a5,a5,a4
    4c44:	00fae7b3          	or	a5,s5,a5
    4c48:	01079793          	slli	a5,a5,0x10
    4c4c:	4107d793          	srai	a5,a5,0x10
    4c50:	e80796e3          	bnez	a5,4adc <mount_volume.isra.0+0x148>
    4c54:	05840513          	addi	a0,s0,88
    4c58:	841ff0ef          	jal	ra,4498 <ld_dword>
    4c5c:	02a42023          	sw	a0,32(s0)
    4c60:	00249493          	slli	s1,s1,0x2
    4c64:	1ff48493          	addi	s1,s1,511
    4c68:	0094d493          	srli	s1,s1,0x9
    4c6c:	e69968e3          	bltu	s2,s1,4adc <mount_volume.isra.0+0x148>
    4c70:	10000737          	lui	a4,0x10000
    4c74:	19075783          	lhu	a5,400(a4) # 10000190 <Fsid>
    4c78:	01440023          	sb	s4,0(s0)
    4c7c:	00000513          	li	a0,0
    4c80:	00178793          	addi	a5,a5,1
    4c84:	01079793          	slli	a5,a5,0x10
    4c88:	0107d793          	srli	a5,a5,0x10
    4c8c:	18f71823          	sh	a5,400(a4)
    4c90:	00f41323          	sh	a5,6(s0)
    4c94:	100007b7          	lui	a5,0x10000
    4c98:	2ac78793          	addi	a5,a5,684 # 100002ac <LfnBuf>
    4c9c:	00f42623          	sw	a5,12(s0)
    4ca0:	d7dff06f          	j	4a1c <mount_volume.isra.0+0x88>
    4ca4:	e2098ce3          	beqz	s3,4adc <mount_volume.isra.0+0x148>
    4ca8:	00e60733          	add	a4,a2,a4
    4cac:	02e42023          	sw	a4,32(s0)
    4cb0:	00200713          	li	a4,2
    4cb4:	00ea1663          	bne	s4,a4,4cc0 <mount_volume.isra.0+0x32c>
    4cb8:	00149493          	slli	s1,s1,0x1
    4cbc:	fa9ff06f          	j	4c64 <mount_volume.isra.0+0x2d0>
    4cc0:	02f487b3          	mul	a5,s1,a5
    4cc4:	0014f493          	andi	s1,s1,1
    4cc8:	0017d793          	srli	a5,a5,0x1
    4ccc:	009784b3          	add	s1,a5,s1
    4cd0:	f95ff06f          	j	4c64 <mount_volume.isra.0+0x2d0>
    4cd4:	00b00513          	li	a0,11
    4cd8:	d45ff06f          	j	4a1c <mount_volume.isra.0+0x88>
    4cdc:	00001a37          	lui	s4,0x1
    4ce0:	ff5a0a13          	addi	s4,s4,-11 # ff5 <dump_bytes+0x81>
    4ce4:	009a3a33          	sltu	s4,s4,s1
    4ce8:	001a0a13          	addi	s4,s4,1
    4cec:	f25ff06f          	j	4c10 <mount_volume.isra.0+0x27c>

00004cf0 <dir_sdi.constprop.0>:
    4cf0:	fd010113          	addi	sp,sp,-48
    4cf4:	00852583          	lw	a1,8(a0)
    4cf8:	02812423          	sw	s0,40(sp)
    4cfc:	02912223          	sw	s1,36(sp)
    4d00:	02112623          	sw	ra,44(sp)
    4d04:	03212023          	sw	s2,32(sp)
    4d08:	01312e23          	sw	s3,28(sp)
    4d0c:	00052823          	sw	zero,16(a0)
    4d10:	00052483          	lw	s1,0(a0)
    4d14:	00050413          	mv	s0,a0
    4d18:	06059463          	bnez	a1,4d80 <dir_sdi.constprop.0+0x90>
    4d1c:	0004c703          	lbu	a4,0(s1)
    4d20:	00200793          	li	a5,2
    4d24:	00e7f663          	bgeu	a5,a4,4d30 <dir_sdi.constprop.0+0x40>
    4d28:	0204a783          	lw	a5,32(s1)
    4d2c:	04079863          	bnez	a5,4d7c <dir_sdi.constprop.0+0x8c>
    4d30:	0084d783          	lhu	a5,8(s1)
    4d34:	02079263          	bnez	a5,4d58 <dir_sdi.constprop.0+0x68>
    4d38:	00200513          	li	a0,2
    4d3c:	02c12083          	lw	ra,44(sp)
    4d40:	02812403          	lw	s0,40(sp)
    4d44:	02412483          	lw	s1,36(sp)
    4d48:	02012903          	lw	s2,32(sp)
    4d4c:	01c12983          	lw	s3,28(sp)
    4d50:	03010113          	addi	sp,sp,48
    4d54:	00008067          	ret
    4d58:	0204a783          	lw	a5,32(s1)
    4d5c:	00f42c23          	sw	a5,24(s0)
    4d60:	01842783          	lw	a5,24(s0)
    4d64:	00b42a23          	sw	a1,20(s0)
    4d68:	fc0788e3          	beqz	a5,4d38 <dir_sdi.constprop.0+0x48>
    4d6c:	02c48493          	addi	s1,s1,44
    4d70:	00942e23          	sw	s1,28(s0)
    4d74:	00000513          	li	a0,0
    4d78:	fc5ff06f          	j	4d3c <dir_sdi.constprop.0+0x4c>
    4d7c:	00078593          	mv	a1,a5
    4d80:	00a4d783          	lhu	a5,10(s1)
    4d84:	fff00913          	li	s2,-1
    4d88:	00100993          	li	s3,1
    4d8c:	02079263          	bnez	a5,4db0 <dir_sdi.constprop.0+0xc0>
    4d90:	00042503          	lw	a0,0(s0)
    4d94:	8c1ff0ef          	jal	ra,4654 <get_fat.isra.0>
    4d98:	00050593          	mv	a1,a0
    4d9c:	03250663          	beq	a0,s2,4dc8 <dir_sdi.constprop.0+0xd8>
    4da0:	f8a9fce3          	bgeu	s3,a0,4d38 <dir_sdi.constprop.0+0x48>
    4da4:	0104a783          	lw	a5,16(s1)
    4da8:	fef564e3          	bltu	a0,a5,4d90 <dir_sdi.constprop.0+0xa0>
    4dac:	f8dff06f          	j	4d38 <dir_sdi.constprop.0+0x48>
    4db0:	00048513          	mv	a0,s1
    4db4:	00b12623          	sw	a1,12(sp)
    4db8:	f34ff0ef          	jal	ra,44ec <clst2sect>
    4dbc:	00c12583          	lw	a1,12(sp)
    4dc0:	00a42c23          	sw	a0,24(s0)
    4dc4:	f9dff06f          	j	4d60 <dir_sdi.constprop.0+0x70>
    4dc8:	00100513          	li	a0,1
    4dcc:	f71ff06f          	j	4d3c <dir_sdi.constprop.0+0x4c>

00004dd0 <follow_path>:
    4dd0:	fb010113          	addi	sp,sp,-80
    4dd4:	03712623          	sw	s7,44(sp)
    4dd8:	00052b83          	lw	s7,0(a0)
    4ddc:	04812423          	sw	s0,72(sp)
    4de0:	05212023          	sw	s2,64(sp)
    4de4:	04112623          	sw	ra,76(sp)
    4de8:	04912223          	sw	s1,68(sp)
    4dec:	03312e23          	sw	s3,60(sp)
    4df0:	03412c23          	sw	s4,56(sp)
    4df4:	03512a23          	sw	s5,52(sp)
    4df8:	03612823          	sw	s6,48(sp)
    4dfc:	03812423          	sw	s8,40(sp)
    4e00:	03912223          	sw	s9,36(sp)
    4e04:	03a12023          	sw	s10,32(sp)
    4e08:	01b12e23          	sw	s11,28(sp)
    4e0c:	00050413          	mv	s0,a0
    4e10:	00058913          	mv	s2,a1
    4e14:	02f00693          	li	a3,47
    4e18:	05c00713          	li	a4,92
    4e1c:	00094783          	lbu	a5,0(s2)
    4e20:	06d78e63          	beq	a5,a3,4e9c <follow_path+0xcc>
    4e24:	06e78c63          	beq	a5,a4,4e9c <follow_path+0xcc>
    4e28:	00042423          	sw	zero,8(s0)
    4e2c:	00094703          	lbu	a4,0(s2)
    4e30:	01f00793          	li	a5,31
    4e34:	06e7f863          	bgeu	a5,a4,4ea4 <follow_path+0xd4>
    4e38:	000089b7          	lui	s3,0x8
    4e3c:	00010ab7          	lui	s5,0x10
    4e40:	eac98993          	addi	s3,s3,-340 # 7eac <ExCvt>
    4e44:	fffa8a93          	addi	s5,s5,-1 # ffff <_edata_rom+0x7e8b>
    4e48:	00042783          	lw	a5,0(s0)
    4e4c:	00000b13          	li	s6,0
    4e50:	01f00493          	li	s1,31
    4e54:	00c7ac83          	lw	s9,12(a5)
    4e58:	02f00a13          	li	s4,47
    4e5c:	05c00c13          	li	s8,92
    4e60:	07f00d13          	li	s10,127
    4e64:	00008db7          	lui	s11,0x8
    4e68:	00094503          	lbu	a0,0(s2)
    4e6c:	00190913          	addi	s2,s2,1
    4e70:	1c050a63          	beqz	a0,5044 <follow_path+0x274>
    4e74:	1b500593          	li	a1,437
    4e78:	cfcff0ef          	jal	ra,4374 <ff_oem2uni>
    4e7c:	08050063          	beqz	a0,4efc <follow_path+0x12c>
    4e80:	1ca4f263          	bgeu	s1,a0,5044 <follow_path+0x274>
    4e84:	1b450a63          	beq	a0,s4,5038 <follow_path+0x268>
    4e88:	1b850863          	beq	a0,s8,5038 <follow_path+0x268>
    4e8c:	0ff00613          	li	a2,255
    4e90:	0aad6863          	bltu	s10,a0,4f40 <follow_path+0x170>
    4e94:	e98d8793          	addi	a5,s11,-360 # 7e98 <cvt2.1220+0xc8>
    4e98:	0580006f          	j	4ef0 <follow_path+0x120>
    4e9c:	00190913          	addi	s2,s2,1
    4ea0:	f7dff06f          	j	4e1c <follow_path+0x4c>
    4ea4:	f8000793          	li	a5,-128
    4ea8:	02f405a3          	sb	a5,43(s0)
    4eac:	00040513          	mv	a0,s0
    4eb0:	04812403          	lw	s0,72(sp)
    4eb4:	04c12083          	lw	ra,76(sp)
    4eb8:	04412483          	lw	s1,68(sp)
    4ebc:	04012903          	lw	s2,64(sp)
    4ec0:	03c12983          	lw	s3,60(sp)
    4ec4:	03812a03          	lw	s4,56(sp)
    4ec8:	03412a83          	lw	s5,52(sp)
    4ecc:	03012b03          	lw	s6,48(sp)
    4ed0:	02c12b83          	lw	s7,44(sp)
    4ed4:	02812c03          	lw	s8,40(sp)
    4ed8:	02412c83          	lw	s9,36(sp)
    4edc:	02012d03          	lw	s10,32(sp)
    4ee0:	01c12d83          	lw	s11,28(sp)
    4ee4:	05010113          	addi	sp,sp,80
    4ee8:	e09ff06f          	j	4cf0 <dir_sdi.constprop.0>
    4eec:	00178793          	addi	a5,a5,1
    4ef0:	0007c703          	lbu	a4,0(a5)
    4ef4:	04070663          	beqz	a4,4f40 <follow_path+0x170>
    4ef8:	fee51ae3          	bne	a0,a4,4eec <follow_path+0x11c>
    4efc:	00600493          	li	s1,6
    4f00:	04c12083          	lw	ra,76(sp)
    4f04:	04812403          	lw	s0,72(sp)
    4f08:	04012903          	lw	s2,64(sp)
    4f0c:	03c12983          	lw	s3,60(sp)
    4f10:	03812a03          	lw	s4,56(sp)
    4f14:	03412a83          	lw	s5,52(sp)
    4f18:	03012b03          	lw	s6,48(sp)
    4f1c:	02c12b83          	lw	s7,44(sp)
    4f20:	02812c03          	lw	s8,40(sp)
    4f24:	02412c83          	lw	s9,36(sp)
    4f28:	02012d03          	lw	s10,32(sp)
    4f2c:	01c12d83          	lw	s11,28(sp)
    4f30:	00048513          	mv	a0,s1
    4f34:	04412483          	lw	s1,68(sp)
    4f38:	05010113          	addi	sp,sp,80
    4f3c:	00008067          	ret
    4f40:	facb0ee3          	beq	s6,a2,4efc <follow_path+0x12c>
    4f44:	001b1793          	slli	a5,s6,0x1
    4f48:	00fc87b3          	add	a5,s9,a5
    4f4c:	00a79023          	sh	a0,0(a5)
    4f50:	001b0b13          	addi	s6,s6,1
    4f54:	f15ff06f          	j	4e68 <follow_path+0x98>
    4f58:	00190913          	addi	s2,s2,1
    4f5c:	00094783          	lbu	a5,0(s2)
    4f60:	fec78ce3          	beq	a5,a2,4f58 <follow_path+0x188>
    4f64:	fee78ae3          	beq	a5,a4,4f58 <follow_path+0x188>
    4f68:	00000493          	li	s1,0
    4f6c:	02000613          	li	a2,32
    4f70:	02e00593          	li	a1,46
    4f74:	001b1793          	slli	a5,s6,0x1
    4f78:	0c0b1a63          	bnez	s6,504c <follow_path+0x27c>
    4f7c:	00fc87b3          	add	a5,s9,a5
    4f80:	00079023          	sh	zero,0(a5)
    4f84:	f60b0ce3          	beqz	s6,4efc <follow_path+0x12c>
    4f88:	00000713          	li	a4,0
    4f8c:	02000593          	li	a1,32
    4f90:	00171793          	slli	a5,a4,0x1
    4f94:	00fc87b3          	add	a5,s9,a5
    4f98:	0007d603          	lhu	a2,0(a5)
    4f9c:	00070793          	mv	a5,a4
    4fa0:	00170713          	addi	a4,a4,1
    4fa4:	feb606e3          	beq	a2,a1,4f90 <follow_path+0x1c0>
    4fa8:	00079663          	bnez	a5,4fb4 <follow_path+0x1e4>
    4fac:	02e00713          	li	a4,46
    4fb0:	00e61463          	bne	a2,a4,4fb8 <follow_path+0x1e8>
    4fb4:	0034e493          	ori	s1,s1,3
    4fb8:	02e00613          	li	a2,46
    4fbc:	001b1713          	slli	a4,s6,0x1
    4fc0:	00ec8733          	add	a4,s9,a4
    4fc4:	ffe75703          	lhu	a4,-2(a4)
    4fc8:	00c70663          	beq	a4,a2,4fd4 <follow_path+0x204>
    4fcc:	fffb0b13          	addi	s6,s6,-1
    4fd0:	fe0b16e3          	bnez	s6,4fbc <follow_path+0x1ec>
    4fd4:	02040c13          	addi	s8,s0,32
    4fd8:	02b40613          	addi	a2,s0,43
    4fdc:	000c0713          	mv	a4,s8
    4fe0:	02000593          	li	a1,32
    4fe4:	00170713          	addi	a4,a4,1
    4fe8:	feb70fa3          	sb	a1,-1(a4)
    4fec:	fee61ce3          	bne	a2,a4,4fe4 <follow_path+0x214>
    4ff0:	00800d93          	li	s11,8
    4ff4:	00000d13          	li	s10,0
    4ff8:	00000a13          	li	s4,0
    4ffc:	02000813          	li	a6,32
    5000:	02e00893          	li	a7,46
    5004:	00b00613          	li	a2,11
    5008:	00008337          	lui	t1,0x8
    500c:	00178713          	addi	a4,a5,1
    5010:	00179793          	slli	a5,a5,0x1
    5014:	00fc87b3          	add	a5,s9,a5
    5018:	0007d503          	lhu	a0,0(a5)
    501c:	06050263          	beqz	a0,5080 <follow_path+0x2b0>
    5020:	01050663          	beq	a0,a6,502c <follow_path+0x25c>
    5024:	05151063          	bne	a0,a7,5064 <follow_path+0x294>
    5028:	05670263          	beq	a4,s6,506c <follow_path+0x29c>
    502c:	0034e493          	ori	s1,s1,3
    5030:	00070793          	mv	a5,a4
    5034:	fd9ff06f          	j	500c <follow_path+0x23c>
    5038:	02f00613          	li	a2,47
    503c:	05c00713          	li	a4,92
    5040:	f1dff06f          	j	4f5c <follow_path+0x18c>
    5044:	00400493          	li	s1,4
    5048:	f25ff06f          	j	4f6c <follow_path+0x19c>
    504c:	00fc8733          	add	a4,s9,a5
    5050:	ffe75703          	lhu	a4,-2(a4)
    5054:	00c70463          	beq	a4,a2,505c <follow_path+0x28c>
    5058:	f2b712e3          	bne	a4,a1,4f7c <follow_path+0x1ac>
    505c:	fffb0b13          	addi	s6,s6,-1
    5060:	f15ff06f          	j	4f74 <follow_path+0x1a4>
    5064:	01bd7863          	bgeu	s10,s11,5074 <follow_path+0x2a4>
    5068:	11671c63          	bne	a4,s6,5180 <follow_path+0x3b0>
    506c:	0ecd9e63          	bne	s11,a2,5168 <follow_path+0x398>
    5070:	0080006f          	j	5078 <follow_path+0x2a8>
    5074:	0ecd9463          	bne	s11,a2,515c <follow_path+0x38c>
    5078:	0034e493          	ori	s1,s1,3
    507c:	00b00d93          	li	s11,11
    5080:	02044703          	lbu	a4,32(s0)
    5084:	0e500793          	li	a5,229
    5088:	00f71663          	bne	a4,a5,5094 <follow_path+0x2c4>
    508c:	00500793          	li	a5,5
    5090:	02f40023          	sb	a5,32(s0)
    5094:	00800793          	li	a5,8
    5098:	00fd9663          	bne	s11,a5,50a4 <follow_path+0x2d4>
    509c:	002a1a13          	slli	s4,s4,0x2
    50a0:	0ffa7a13          	andi	s4,s4,255
    50a4:	00ca7793          	andi	a5,s4,12
    50a8:	00c00713          	li	a4,12
    50ac:	00e78863          	beq	a5,a4,50bc <follow_path+0x2ec>
    50b0:	003a7793          	andi	a5,s4,3
    50b4:	00300713          	li	a4,3
    50b8:	00e79463          	bne	a5,a4,50c0 <follow_path+0x2f0>
    50bc:	0024e493          	ori	s1,s1,2
    50c0:	0024f793          	andi	a5,s1,2
    50c4:	00079e63          	bnez	a5,50e0 <follow_path+0x310>
    50c8:	001a7793          	andi	a5,s4,1
    50cc:	00078463          	beqz	a5,50d4 <follow_path+0x304>
    50d0:	0104e493          	ori	s1,s1,16
    50d4:	004a7a13          	andi	s4,s4,4
    50d8:	000a0463          	beqz	s4,50e0 <follow_path+0x310>
    50dc:	0084e493          	ori	s1,s1,8
    50e0:	029405a3          	sb	s1,43(s0)
    50e4:	00040513          	mv	a0,s0
    50e8:	00042d03          	lw	s10,0(s0)
    50ec:	c05ff0ef          	jal	ra,4cf0 <dir_sdi.constprop.0>
    50f0:	00050493          	mv	s1,a0
    50f4:	30051a63          	bnez	a0,5408 <follow_path+0x638>
    50f8:	fff00793          	li	a5,-1
    50fc:	02f42623          	sw	a5,44(s0)
    5100:	0ff00b13          	li	s6,255
    5104:	0ff00c93          	li	s9,255
    5108:	00d00d93          	li	s11,13
    510c:	01842583          	lw	a1,24(s0)
    5110:	000d0513          	mv	a0,s10
    5114:	cd4ff0ef          	jal	ra,45e8 <move_window>
    5118:	00050493          	mv	s1,a0
    511c:	2e051663          	bnez	a0,5408 <follow_path+0x638>
    5120:	01c42683          	lw	a3,28(s0)
    5124:	0006c703          	lbu	a4,0(a3)
    5128:	30070063          	beqz	a4,5428 <follow_path+0x658>
    512c:	00b6c603          	lbu	a2,11(a3)
    5130:	0e500513          	li	a0,229
    5134:	03f67593          	andi	a1,a2,63
    5138:	00b40323          	sb	a1,6(s0)
    513c:	00a70a63          	beq	a4,a0,5150 <follow_path+0x380>
    5140:	00867613          	andi	a2,a2,8
    5144:	12060863          	beqz	a2,5274 <follow_path+0x4a4>
    5148:	00f00613          	li	a2,15
    514c:	12c58863          	beq	a1,a2,527c <follow_path+0x4ac>
    5150:	fff00793          	li	a5,-1
    5154:	02f42623          	sw	a5,44(s0)
    5158:	2500006f          	j	53a8 <follow_path+0x5d8>
    515c:	01670663          	beq	a4,s6,5168 <follow_path+0x398>
    5160:	0034e493          	ori	s1,s1,3
    5164:	f0eb6ee3          	bltu	s6,a4,5080 <follow_path+0x2b0>
    5168:	002a1a13          	slli	s4,s4,0x2
    516c:	0ffa7a13          	andi	s4,s4,255
    5170:	000b0713          	mv	a4,s6
    5174:	00b00d93          	li	s11,11
    5178:	00800d13          	li	s10,8
    517c:	eb5ff06f          	j	5030 <follow_path+0x260>
    5180:	07f00793          	li	a5,127
    5184:	04a7f663          	bgeu	a5,a0,51d0 <follow_path+0x400>
    5188:	0024e793          	ori	a5,s1,2
    518c:	1b500593          	li	a1,437
    5190:	00e12223          	sw	a4,4(sp)
    5194:	00f12023          	sw	a5,0(sp)
    5198:	978ff0ef          	jal	ra,4310 <ff_uni2oem>
    519c:	08057593          	andi	a1,a0,128
    51a0:	00012783          	lw	a5,0(sp)
    51a4:	00412703          	lw	a4,4(sp)
    51a8:	02000813          	li	a6,32
    51ac:	02e00893          	li	a7,46
    51b0:	00b00613          	li	a2,11
    51b4:	00008337          	lui	t1,0x8
    51b8:	02058a63          	beqz	a1,51ec <follow_path+0x41c>
    51bc:	07f57513          	andi	a0,a0,127
    51c0:	00a98533          	add	a0,s3,a0
    51c4:	00054503          	lbu	a0,0(a0)
    51c8:	00078493          	mv	s1,a5
    51cc:	00050a63          	beqz	a0,51e0 <follow_path+0x410>
    51d0:	ea430793          	addi	a5,t1,-348 # 7ea4 <cvt2.1220+0xd4>
    51d4:	0007c583          	lbu	a1,0(a5)
    51d8:	04058e63          	beqz	a1,5234 <follow_path+0x464>
    51dc:	04a59863          	bne	a1,a0,522c <follow_path+0x45c>
    51e0:	0034e493          	ori	s1,s1,3
    51e4:	05f00513          	li	a0,95
    51e8:	0340006f          	j	521c <follow_path+0x44c>
    51ec:	0ff00593          	li	a1,255
    51f0:	fca5fce3          	bgeu	a1,a0,51c8 <follow_path+0x3f8>
    51f4:	fffd8593          	addi	a1,s11,-1
    51f8:	00bd6863          	bltu	s10,a1,5208 <follow_path+0x438>
    51fc:	0034e493          	ori	s1,s1,3
    5200:	000d8d13          	mv	s10,s11
    5204:	e2dff06f          	j	5030 <follow_path+0x260>
    5208:	01a405b3          	add	a1,s0,s10
    520c:	00855e13          	srli	t3,a0,0x8
    5210:	03c58023          	sb	t3,32(a1)
    5214:	001d0d13          	addi	s10,s10,1
    5218:	00078493          	mv	s1,a5
    521c:	01a407b3          	add	a5,s0,s10
    5220:	02a78023          	sb	a0,32(a5)
    5224:	001d0d13          	addi	s10,s10,1
    5228:	e09ff06f          	j	5030 <follow_path+0x260>
    522c:	00178793          	addi	a5,a5,1
    5230:	fa5ff06f          	j	51d4 <follow_path+0x404>
    5234:	fbf50793          	addi	a5,a0,-65
    5238:	01079793          	slli	a5,a5,0x10
    523c:	0107d793          	srli	a5,a5,0x10
    5240:	01900593          	li	a1,25
    5244:	00f5e663          	bltu	a1,a5,5250 <follow_path+0x480>
    5248:	002a6a13          	ori	s4,s4,2
    524c:	fd1ff06f          	j	521c <follow_path+0x44c>
    5250:	f9f50793          	addi	a5,a0,-97
    5254:	01079793          	slli	a5,a5,0x10
    5258:	0107d793          	srli	a5,a5,0x10
    525c:	fcf5e0e3          	bltu	a1,a5,521c <follow_path+0x44c>
    5260:	fe050513          	addi	a0,a0,-32
    5264:	01051513          	slli	a0,a0,0x10
    5268:	001a6a13          	ori	s4,s4,1
    526c:	01055513          	srli	a0,a0,0x10
    5270:	fadff06f          	j	521c <follow_path+0x44c>
    5274:	00f00613          	li	a2,15
    5278:	14c59063          	bne	a1,a2,53b8 <follow_path+0x5e8>
    527c:	02b44603          	lbu	a2,43(s0)
    5280:	04067613          	andi	a2,a2,64
    5284:	10061663          	bnez	a2,5390 <follow_path+0x5c0>
    5288:	04077613          	andi	a2,a4,64
    528c:	10060c63          	beqz	a2,53a4 <follow_path+0x5d4>
    5290:	0bf77c93          	andi	s9,a4,191
    5294:	01042703          	lw	a4,16(s0)
    5298:	00d6cb03          	lbu	s6,13(a3)
    529c:	02e42623          	sw	a4,44(s0)
    52a0:	00d6c703          	lbu	a4,13(a3)
    52a4:	11671263          	bne	a4,s6,53a8 <follow_path+0x5d8>
    52a8:	01b6c703          	lbu	a4,27(a3)
    52ac:	01a6c603          	lbu	a2,26(a3)
    52b0:	00871713          	slli	a4,a4,0x8
    52b4:	00c76733          	or	a4,a4,a2
    52b8:	01071713          	slli	a4,a4,0x10
    52bc:	41075713          	srai	a4,a4,0x10
    52c0:	0e071463          	bnez	a4,53a8 <follow_path+0x5d8>
    52c4:	0006c703          	lbu	a4,0(a3)
    52c8:	00cd2a03          	lw	s4,12(s10)
    52cc:	00100513          	li	a0,1
    52d0:	03f77713          	andi	a4,a4,63
    52d4:	fff70713          	addi	a4,a4,-1
    52d8:	03b70733          	mul	a4,a4,s11
    52dc:	0ff00813          	li	a6,255
    52e0:	000087b7          	lui	a5,0x8
    52e4:	f2c78793          	addi	a5,a5,-212 # 7f2c <LfnOfs>
    52e8:	00978633          	add	a2,a5,s1
    52ec:	00064583          	lbu	a1,0(a2)
    52f0:	00b685b3          	add	a1,a3,a1
    52f4:	0015c603          	lbu	a2,1(a1)
    52f8:	0005c583          	lbu	a1,0(a1)
    52fc:	00861613          	slli	a2,a2,0x8
    5300:	00b66633          	or	a2,a2,a1
    5304:	0a050663          	beqz	a0,53b0 <follow_path+0x5e0>
    5308:	00d12623          	sw	a3,12(sp)
    530c:	00e12023          	sw	a4,0(sp)
    5310:	08e86c63          	bltu	a6,a4,53a8 <follow_path+0x5d8>
    5314:	00060513          	mv	a0,a2
    5318:	00c12423          	sw	a2,8(sp)
    531c:	890ff0ef          	jal	ra,43ac <ff_wtoupper>
    5320:	00012703          	lw	a4,0(sp)
    5324:	00a12223          	sw	a0,4(sp)
    5328:	00170893          	addi	a7,a4,1
    532c:	00171713          	slli	a4,a4,0x1
    5330:	00ea0733          	add	a4,s4,a4
    5334:	00075503          	lhu	a0,0(a4)
    5338:	01112023          	sw	a7,0(sp)
    533c:	870ff0ef          	jal	ra,43ac <ff_wtoupper>
    5340:	00412583          	lw	a1,4(sp)
    5344:	06a59263          	bne	a1,a0,53a8 <follow_path+0x5d8>
    5348:	00812603          	lw	a2,8(sp)
    534c:	00012883          	lw	a7,0(sp)
    5350:	00c12683          	lw	a3,12(sp)
    5354:	00060513          	mv	a0,a2
    5358:	00088713          	mv	a4,a7
    535c:	0ff00813          	li	a6,255
    5360:	00148493          	addi	s1,s1,1
    5364:	f7b49ee3          	bne	s1,s11,52e0 <follow_path+0x510>
    5368:	0006c683          	lbu	a3,0(a3)
    536c:	0406f693          	andi	a3,a3,64
    5370:	00068c63          	beqz	a3,5388 <follow_path+0x5b8>
    5374:	00050a63          	beqz	a0,5388 <follow_path+0x5b8>
    5378:	00171713          	slli	a4,a4,0x1
    537c:	00ea0a33          	add	s4,s4,a4
    5380:	000a5703          	lhu	a4,0(s4)
    5384:	02071263          	bnez	a4,53a8 <follow_path+0x5d8>
    5388:	fffc8793          	addi	a5,s9,-1
    538c:	0ff7fc93          	andi	s9,a5,255
    5390:	00040513          	mv	a0,s0
    5394:	c14ff0ef          	jal	ra,47a8 <dir_next.isra.0>
    5398:	00050493          	mv	s1,a0
    539c:	d60508e3          	beqz	a0,510c <follow_path+0x33c>
    53a0:	0680006f          	j	5408 <follow_path+0x638>
    53a4:	ef970ee3          	beq	a4,s9,52a0 <follow_path+0x4d0>
    53a8:	0ff00c93          	li	s9,255
    53ac:	fe5ff06f          	j	5390 <follow_path+0x5c0>
    53b0:	fb5608e3          	beq	a2,s5,5360 <follow_path+0x590>
    53b4:	ff5ff06f          	j	53a8 <follow_path+0x5d8>
    53b8:	020c9863          	bnez	s9,53e8 <follow_path+0x618>
    53bc:	00b68593          	addi	a1,a3,11
    53c0:	00068613          	mv	a2,a3
    53c4:	001cd713          	srli	a4,s9,0x1
    53c8:	007c9793          	slli	a5,s9,0x7
    53cc:	00160613          	addi	a2,a2,1
    53d0:	00f767b3          	or	a5,a4,a5
    53d4:	fff64703          	lbu	a4,-1(a2)
    53d8:	00e787b3          	add	a5,a5,a4
    53dc:	0ff7fc93          	andi	s9,a5,255
    53e0:	fec592e3          	bne	a1,a2,53c4 <follow_path+0x5f4>
    53e4:	039b0263          	beq	s6,s9,5408 <follow_path+0x638>
    53e8:	02b44783          	lbu	a5,43(s0)
    53ec:	0017f793          	andi	a5,a5,1
    53f0:	d60790e3          	bnez	a5,5150 <follow_path+0x380>
    53f4:	00b00613          	li	a2,11
    53f8:	000c0593          	mv	a1,s8
    53fc:	00068513          	mv	a0,a3
    5400:	8c4ff0ef          	jal	ra,44c4 <mem_cmp>
    5404:	d40516e3          	bnez	a0,5150 <follow_path+0x380>
    5408:	02b44783          	lbu	a5,43(s0)
    540c:	02048263          	beqz	s1,5430 <follow_path+0x660>
    5410:	00400713          	li	a4,4
    5414:	aee496e3          	bne	s1,a4,4f00 <follow_path+0x130>
    5418:	0047f793          	andi	a5,a5,4
    541c:	ae0792e3          	bnez	a5,4f00 <follow_path+0x130>
    5420:	00500493          	li	s1,5
    5424:	addff06f          	j	4f00 <follow_path+0x130>
    5428:	00400493          	li	s1,4
    542c:	fddff06f          	j	5408 <follow_path+0x638>
    5430:	0047f793          	andi	a5,a5,4
    5434:	ac0796e3          	bnez	a5,4f00 <follow_path+0x130>
    5438:	00644783          	lbu	a5,6(s0)
    543c:	0107f793          	andi	a5,a5,16
    5440:	fe0780e3          	beqz	a5,5420 <follow_path+0x650>
    5444:	01042783          	lw	a5,16(s0)
    5448:	000bc503          	lbu	a0,0(s7)
    544c:	02cb8593          	addi	a1,s7,44
    5450:	1ff7f793          	andi	a5,a5,511
    5454:	00f585b3          	add	a1,a1,a5
    5458:	c40ff0ef          	jal	ra,4898 <ld_clust.isra.0>
    545c:	00a42423          	sw	a0,8(s0)
    5460:	9e9ff06f          	j	4e48 <follow_path+0x78>

00005464 <f_mount>:
    5464:	fd010113          	addi	sp,sp,-48
    5468:	00a12623          	sw	a0,12(sp)
    546c:	01c10513          	addi	a0,sp,28
    5470:	02812423          	sw	s0,40(sp)
    5474:	02112623          	sw	ra,44(sp)
    5478:	00b12423          	sw	a1,8(sp)
    547c:	00060413          	mv	s0,a2
    5480:	00b12e23          	sw	a1,28(sp)
    5484:	894ff0ef          	jal	ra,4518 <get_ldnumber>
    5488:	04054e63          	bltz	a0,54e4 <f_mount+0x80>
    548c:	100007b7          	lui	a5,0x10000
    5490:	19478713          	addi	a4,a5,404 # 10000194 <FatFs>
    5494:	00251513          	slli	a0,a0,0x2
    5498:	00e50733          	add	a4,a0,a4
    549c:	00072703          	lw	a4,0(a4)
    54a0:	19478793          	addi	a5,a5,404
    54a4:	00070463          	beqz	a4,54ac <f_mount+0x48>
    54a8:	00070023          	sb	zero,0(a4)
    54ac:	00c12703          	lw	a4,12(sp)
    54b0:	00070463          	beqz	a4,54b8 <f_mount+0x54>
    54b4:	00070023          	sb	zero,0(a4)
    54b8:	00a78533          	add	a0,a5,a0
    54bc:	00e52023          	sw	a4,0(a0)
    54c0:	00000513          	li	a0,0
    54c4:	00040863          	beqz	s0,54d4 <f_mount+0x70>
    54c8:	00c10593          	addi	a1,sp,12
    54cc:	00810513          	addi	a0,sp,8
    54d0:	cc4ff0ef          	jal	ra,4994 <mount_volume.isra.0>
    54d4:	02c12083          	lw	ra,44(sp)
    54d8:	02812403          	lw	s0,40(sp)
    54dc:	03010113          	addi	sp,sp,48
    54e0:	00008067          	ret
    54e4:	00b00513          	li	a0,11
    54e8:	fedff06f          	j	54d4 <f_mount+0x70>

000054ec <f_open>:
    54ec:	f9010113          	addi	sp,sp,-112
    54f0:	06912223          	sw	s1,100(sp)
    54f4:	06112623          	sw	ra,108(sp)
    54f8:	06812423          	sw	s0,104(sp)
    54fc:	07212023          	sw	s2,96(sp)
    5500:	05312e23          	sw	s3,92(sp)
    5504:	05412c23          	sw	s4,88(sp)
    5508:	00b12623          	sw	a1,12(sp)
    550c:	00900493          	li	s1,9
    5510:	08050a63          	beqz	a0,55a4 <f_open+0xb8>
    5514:	00050413          	mv	s0,a0
    5518:	01c10593          	addi	a1,sp,28
    551c:	00c10513          	addi	a0,sp,12
    5520:	00060913          	mv	s2,a2
    5524:	c70ff0ef          	jal	ra,4994 <mount_volume.isra.0>
    5528:	00050493          	mv	s1,a0
    552c:	0a051063          	bnez	a0,55cc <f_open+0xe0>
    5530:	01c12783          	lw	a5,28(sp)
    5534:	00c12583          	lw	a1,12(sp)
    5538:	02010513          	addi	a0,sp,32
    553c:	02f12023          	sw	a5,32(sp)
    5540:	891ff0ef          	jal	ra,4dd0 <follow_path>
    5544:	00050493          	mv	s1,a0
    5548:	08051263          	bnez	a0,55cc <f_open+0xe0>
    554c:	04b10783          	lb	a5,75(sp)
    5550:	0607cc63          	bltz	a5,55c8 <f_open+0xdc>
    5554:	02614783          	lbu	a5,38(sp)
    5558:	0107f793          	andi	a5,a5,16
    555c:	06079c63          	bnez	a5,55d4 <f_open+0xe8>
    5560:	01c12983          	lw	s3,28(sp)
    5564:	03c12a03          	lw	s4,60(sp)
    5568:	00197913          	andi	s2,s2,1
    556c:	0009c503          	lbu	a0,0(s3)
    5570:	000a0593          	mv	a1,s4
    5574:	b24ff0ef          	jal	ra,4898 <ld_clust.isra.0>
    5578:	00a42423          	sw	a0,8(s0)
    557c:	01ca0513          	addi	a0,s4,28
    5580:	f19fe0ef          	jal	ra,4498 <ld_dword>
    5584:	0069d783          	lhu	a5,6(s3)
    5588:	00a42623          	sw	a0,12(s0)
    558c:	01342023          	sw	s3,0(s0)
    5590:	00f41223          	sh	a5,4(s0)
    5594:	01240823          	sb	s2,16(s0)
    5598:	000408a3          	sb	zero,17(s0)
    559c:	00042e23          	sw	zero,28(s0)
    55a0:	00042a23          	sw	zero,20(s0)
    55a4:	06c12083          	lw	ra,108(sp)
    55a8:	06812403          	lw	s0,104(sp)
    55ac:	06012903          	lw	s2,96(sp)
    55b0:	05c12983          	lw	s3,92(sp)
    55b4:	05812a03          	lw	s4,88(sp)
    55b8:	00048513          	mv	a0,s1
    55bc:	06412483          	lw	s1,100(sp)
    55c0:	07010113          	addi	sp,sp,112
    55c4:	00008067          	ret
    55c8:	00600493          	li	s1,6
    55cc:	00042023          	sw	zero,0(s0)
    55d0:	fd5ff06f          	j	55a4 <f_open+0xb8>
    55d4:	00400493          	li	s1,4
    55d8:	ff5ff06f          	j	55cc <f_open+0xe0>

000055dc <f_read>:
    55dc:	fb010113          	addi	sp,sp,-80
    55e0:	04812423          	sw	s0,72(sp)
    55e4:	04912223          	sw	s1,68(sp)
    55e8:	05212023          	sw	s2,64(sp)
    55ec:	03312e23          	sw	s3,60(sp)
    55f0:	03412c23          	sw	s4,56(sp)
    55f4:	04112623          	sw	ra,76(sp)
    55f8:	03512a23          	sw	s5,52(sp)
    55fc:	03612823          	sw	s6,48(sp)
    5600:	03712623          	sw	s7,44(sp)
    5604:	03812423          	sw	s8,40(sp)
    5608:	03912223          	sw	s9,36(sp)
    560c:	03a12023          	sw	s10,32(sp)
    5610:	01b12e23          	sw	s11,28(sp)
    5614:	00058993          	mv	s3,a1
    5618:	0006a023          	sw	zero,0(a3)
    561c:	00c10593          	addi	a1,sp,12
    5620:	00050493          	mv	s1,a0
    5624:	00060913          	mv	s2,a2
    5628:	00068a13          	mv	s4,a3
    562c:	f41fe0ef          	jal	ra,456c <validate>
    5630:	00050413          	mv	s0,a0
    5634:	08051263          	bnez	a0,56b8 <f_read+0xdc>
    5638:	0114c403          	lbu	s0,17(s1)
    563c:	06041e63          	bnez	s0,56b8 <f_read+0xdc>
    5640:	0104c783          	lbu	a5,16(s1)
    5644:	00700413          	li	s0,7
    5648:	0017f793          	andi	a5,a5,1
    564c:	06078663          	beqz	a5,56b8 <f_read+0xdc>
    5650:	00c4a403          	lw	s0,12(s1)
    5654:	0144a503          	lw	a0,20(s1)
    5658:	40a40433          	sub	s0,s0,a0
    565c:	00897463          	bgeu	s2,s0,5664 <f_read+0x88>
    5660:	00090413          	mv	s0,s2
    5664:	20000a93          	li	s5,512
    5668:	1ff00b13          	li	s6,511
    566c:	10000bb7          	lui	s7,0x10000
    5670:	00100c13          	li	s8,1
    5674:	fff00c93          	li	s9,-1
    5678:	04040063          	beqz	s0,56b8 <f_read+0xdc>
    567c:	0144a783          	lw	a5,20(s1)
    5680:	1ff7f713          	andi	a4,a5,511
    5684:	10071a63          	bnez	a4,5798 <f_read+0x1bc>
    5688:	00c12703          	lw	a4,12(sp)
    568c:	00a75d03          	lhu	s10,10(a4)
    5690:	0097d713          	srli	a4,a5,0x9
    5694:	fffd0d13          	addi	s10,s10,-1
    5698:	00ed7d33          	and	s10,s10,a4
    569c:	080d1263          	bnez	s10,5720 <f_read+0x144>
    56a0:	04079c63          	bnez	a5,56f8 <f_read+0x11c>
    56a4:	0084a503          	lw	a0,8(s1)
    56a8:	06ac6063          	bltu	s8,a0,5708 <f_read+0x12c>
    56ac:	00200793          	li	a5,2
    56b0:	00f488a3          	sb	a5,17(s1)
    56b4:	00200413          	li	s0,2
    56b8:	04c12083          	lw	ra,76(sp)
    56bc:	00040513          	mv	a0,s0
    56c0:	04812403          	lw	s0,72(sp)
    56c4:	04412483          	lw	s1,68(sp)
    56c8:	04012903          	lw	s2,64(sp)
    56cc:	03c12983          	lw	s3,60(sp)
    56d0:	03812a03          	lw	s4,56(sp)
    56d4:	03412a83          	lw	s5,52(sp)
    56d8:	03012b03          	lw	s6,48(sp)
    56dc:	02c12b83          	lw	s7,44(sp)
    56e0:	02812c03          	lw	s8,40(sp)
    56e4:	02412c83          	lw	s9,36(sp)
    56e8:	02012d03          	lw	s10,32(sp)
    56ec:	01c12d83          	lw	s11,28(sp)
    56f0:	05010113          	addi	sp,sp,80
    56f4:	00008067          	ret
    56f8:	0184a583          	lw	a1,24(s1)
    56fc:	0004a503          	lw	a0,0(s1)
    5700:	f55fe0ef          	jal	ra,4654 <get_fat.isra.0>
    5704:	fa5ff06f          	j	56a8 <f_read+0xcc>
    5708:	01951a63          	bne	a0,s9,571c <f_read+0x140>
    570c:	00100793          	li	a5,1
    5710:	00f488a3          	sb	a5,17(s1)
    5714:	00100413          	li	s0,1
    5718:	fa1ff06f          	j	56b8 <f_read+0xdc>
    571c:	00a4ac23          	sw	a0,24(s1)
    5720:	00c12d83          	lw	s11,12(sp)
    5724:	0184a583          	lw	a1,24(s1)
    5728:	000d8513          	mv	a0,s11
    572c:	dc1fe0ef          	jal	ra,44ec <clst2sect>
    5730:	f6050ee3          	beqz	a0,56ac <f_read+0xd0>
    5734:	00ad0633          	add	a2,s10,a0
    5738:	048b7e63          	bgeu	s6,s0,5794 <f_read+0x1b8>
    573c:	00add783          	lhu	a5,10(s11)
    5740:	00945913          	srli	s2,s0,0x9
    5744:	012d0733          	add	a4,s10,s2
    5748:	00e7f463          	bgeu	a5,a4,5750 <f_read+0x174>
    574c:	41a78933          	sub	s2,a5,s10
    5750:	4b8ba783          	lw	a5,1208(s7) # 100004b8 <FfDiskOps>
    5754:	001dc503          	lbu	a0,1(s11)
    5758:	00090693          	mv	a3,s2
    575c:	0087a783          	lw	a5,8(a5)
    5760:	00098593          	mv	a1,s3
    5764:	000780e7          	jalr	a5
    5768:	fa0512e3          	bnez	a0,570c <f_read+0x130>
    576c:	00991913          	slli	s2,s2,0x9
    5770:	000a2783          	lw	a5,0(s4)
    5774:	0144a683          	lw	a3,20(s1)
    5778:	41240433          	sub	s0,s0,s2
    577c:	012787b3          	add	a5,a5,s2
    5780:	00fa2023          	sw	a5,0(s4)
    5784:	012989b3          	add	s3,s3,s2
    5788:	01268933          	add	s2,a3,s2
    578c:	0124aa23          	sw	s2,20(s1)
    5790:	ee9ff06f          	j	5678 <f_read+0x9c>
    5794:	00c4ae23          	sw	a2,28(s1)
    5798:	0144a783          	lw	a5,20(s1)
    579c:	00040913          	mv	s2,s0
    57a0:	1ff7f793          	andi	a5,a5,511
    57a4:	40fa87b3          	sub	a5,s5,a5
    57a8:	0087f463          	bgeu	a5,s0,57b0 <f_read+0x1d4>
    57ac:	00078913          	mv	s2,a5
    57b0:	01c4a583          	lw	a1,28(s1)
    57b4:	00c12503          	lw	a0,12(sp)
    57b8:	e31fe0ef          	jal	ra,45e8 <move_window>
    57bc:	f40518e3          	bnez	a0,570c <f_read+0x130>
    57c0:	00c12703          	lw	a4,12(sp)
    57c4:	0144a683          	lw	a3,20(s1)
    57c8:	02c70713          	addi	a4,a4,44
    57cc:	1ff6f693          	andi	a3,a3,511
    57d0:	00a687b3          	add	a5,a3,a0
    57d4:	00f707b3          	add	a5,a4,a5
    57d8:	0007c603          	lbu	a2,0(a5)
    57dc:	00a987b3          	add	a5,s3,a0
    57e0:	00150513          	addi	a0,a0,1
    57e4:	00c78023          	sb	a2,0(a5)
    57e8:	fea914e3          	bne	s2,a0,57d0 <f_read+0x1f4>
    57ec:	f85ff06f          	j	5770 <f_read+0x194>

000057f0 <f_close>:
    57f0:	fe010113          	addi	sp,sp,-32
    57f4:	00c10593          	addi	a1,sp,12
    57f8:	00812c23          	sw	s0,24(sp)
    57fc:	00112e23          	sw	ra,28(sp)
    5800:	00050413          	mv	s0,a0
    5804:	d69fe0ef          	jal	ra,456c <validate>
    5808:	00051463          	bnez	a0,5810 <f_close+0x20>
    580c:	00042023          	sw	zero,0(s0)
    5810:	01c12083          	lw	ra,28(sp)
    5814:	01812403          	lw	s0,24(sp)
    5818:	02010113          	addi	sp,sp,32
    581c:	00008067          	ret

00005820 <f_lseek>:
    5820:	fd010113          	addi	sp,sp,-48
    5824:	01312e23          	sw	s3,28(sp)
    5828:	00058993          	mv	s3,a1
    582c:	00c10593          	addi	a1,sp,12
    5830:	02812423          	sw	s0,40(sp)
    5834:	03212023          	sw	s2,32(sp)
    5838:	02112623          	sw	ra,44(sp)
    583c:	02912223          	sw	s1,36(sp)
    5840:	01412c23          	sw	s4,24(sp)
    5844:	01512a23          	sw	s5,20(sp)
    5848:	00050413          	mv	s0,a0
    584c:	d21fe0ef          	jal	ra,456c <validate>
    5850:	00050913          	mv	s2,a0
    5854:	0e051a63          	bnez	a0,5948 <f_lseek+0x128>
    5858:	01144903          	lbu	s2,17(s0)
    585c:	0e091663          	bnez	s2,5948 <f_lseek+0x128>
    5860:	00c42483          	lw	s1,12(s0)
    5864:	0099f463          	bgeu	s3,s1,586c <f_lseek+0x4c>
    5868:	00098493          	mv	s1,s3
    586c:	01442783          	lw	a5,20(s0)
    5870:	00042a23          	sw	zero,20(s0)
    5874:	02049663          	bnez	s1,58a0 <f_lseek+0x80>
    5878:	00000913          	li	s2,0
    587c:	0cc0006f          	j	5948 <f_lseek+0x128>
    5880:	00000493          	li	s1,0
    5884:	01442783          	lw	a5,20(s0)
    5888:	1ff7f793          	andi	a5,a5,511
    588c:	fe0786e3          	beqz	a5,5878 <f_lseek+0x58>
    5890:	01c42783          	lw	a5,28(s0)
    5894:	0a978a63          	beq	a5,s1,5948 <f_lseek+0x128>
    5898:	00942e23          	sw	s1,28(s0)
    589c:	0ac0006f          	j	5948 <f_lseek+0x128>
    58a0:	00c12703          	lw	a4,12(sp)
    58a4:	00a75983          	lhu	s3,10(a4)
    58a8:	00999993          	slli	s3,s3,0x9
    58ac:	06078463          	beqz	a5,5914 <f_lseek+0xf4>
    58b0:	fff78793          	addi	a5,a5,-1
    58b4:	fff48713          	addi	a4,s1,-1
    58b8:	03375733          	divu	a4,a4,s3
    58bc:	0337d6b3          	divu	a3,a5,s3
    58c0:	04d76a63          	bltu	a4,a3,5914 <f_lseek+0xf4>
    58c4:	41300733          	neg	a4,s3
    58c8:	01842583          	lw	a1,24(s0)
    58cc:	00f777b3          	and	a5,a4,a5
    58d0:	00f42a23          	sw	a5,20(s0)
    58d4:	40f484b3          	sub	s1,s1,a5
    58d8:	fa0584e3          	beqz	a1,5880 <f_lseek+0x60>
    58dc:	fff00a13          	li	s4,-1
    58e0:	00100a93          	li	s5,1
    58e4:	01442783          	lw	a5,20(s0)
    58e8:	0299ec63          	bltu	s3,s1,5920 <f_lseek+0x100>
    58ec:	00f487b3          	add	a5,s1,a5
    58f0:	00f42a23          	sw	a5,20(s0)
    58f4:	1ff4f793          	andi	a5,s1,511
    58f8:	f80784e3          	beqz	a5,5880 <f_lseek+0x60>
    58fc:	00c12503          	lw	a0,12(sp)
    5900:	bedfe0ef          	jal	ra,44ec <clst2sect>
    5904:	06050e63          	beqz	a0,5980 <f_lseek+0x160>
    5908:	0094d493          	srli	s1,s1,0x9
    590c:	00a484b3          	add	s1,s1,a0
    5910:	f75ff06f          	j	5884 <f_lseek+0x64>
    5914:	00842583          	lw	a1,8(s0)
    5918:	00b42c23          	sw	a1,24(s0)
    591c:	fbdff06f          	j	58d8 <f_lseek+0xb8>
    5920:	00042503          	lw	a0,0(s0)
    5924:	013787b3          	add	a5,a5,s3
    5928:	00f42a23          	sw	a5,20(s0)
    592c:	d29fe0ef          	jal	ra,4654 <get_fat.isra.0>
    5930:	413484b3          	sub	s1,s1,s3
    5934:	00050593          	mv	a1,a0
    5938:	03451c63          	bne	a0,s4,5970 <f_lseek+0x150>
    593c:	00100793          	li	a5,1
    5940:	00f408a3          	sb	a5,17(s0)
    5944:	00100913          	li	s2,1
    5948:	02c12083          	lw	ra,44(sp)
    594c:	02812403          	lw	s0,40(sp)
    5950:	02412483          	lw	s1,36(sp)
    5954:	01c12983          	lw	s3,28(sp)
    5958:	01812a03          	lw	s4,24(sp)
    595c:	01412a83          	lw	s5,20(sp)
    5960:	00090513          	mv	a0,s2
    5964:	02012903          	lw	s2,32(sp)
    5968:	03010113          	addi	sp,sp,48
    596c:	00008067          	ret
    5970:	00aaf863          	bgeu	s5,a0,5980 <f_lseek+0x160>
    5974:	00c12783          	lw	a5,12(sp)
    5978:	0107a783          	lw	a5,16(a5)
    597c:	00f56a63          	bltu	a0,a5,5990 <f_lseek+0x170>
    5980:	00200793          	li	a5,2
    5984:	00f408a3          	sb	a5,17(s0)
    5988:	00200913          	li	s2,2
    598c:	fbdff06f          	j	5948 <f_lseek+0x128>
    5990:	00a42c23          	sw	a0,24(s0)
    5994:	f51ff06f          	j	58e4 <f_lseek+0xc4>

00005998 <f_opendir>:
    5998:	fd010113          	addi	sp,sp,-48
    599c:	02112623          	sw	ra,44(sp)
    59a0:	02812423          	sw	s0,40(sp)
    59a4:	00b12623          	sw	a1,12(sp)
    59a8:	08050a63          	beqz	a0,5a3c <f_opendir+0xa4>
    59ac:	00050413          	mv	s0,a0
    59b0:	01c10593          	addi	a1,sp,28
    59b4:	00c10513          	addi	a0,sp,12
    59b8:	fddfe0ef          	jal	ra,4994 <mount_volume.isra.0>
    59bc:	02051a63          	bnez	a0,59f0 <f_opendir+0x58>
    59c0:	01c12783          	lw	a5,28(sp)
    59c4:	00c12583          	lw	a1,12(sp)
    59c8:	00040513          	mv	a0,s0
    59cc:	00f42023          	sw	a5,0(s0)
    59d0:	c00ff0ef          	jal	ra,4dd0 <follow_path>
    59d4:	06051863          	bnez	a0,5a44 <f_opendir+0xac>
    59d8:	02b40783          	lb	a5,43(s0)
    59dc:	0207c863          	bltz	a5,5a0c <f_opendir+0x74>
    59e0:	00644783          	lbu	a5,6(s0)
    59e4:	0107f793          	andi	a5,a5,16
    59e8:	00079863          	bnez	a5,59f8 <f_opendir+0x60>
    59ec:	00500513          	li	a0,5
    59f0:	00042023          	sw	zero,0(s0)
    59f4:	0380006f          	j	5a2c <f_opendir+0x94>
    59f8:	01c12783          	lw	a5,28(sp)
    59fc:	01c42583          	lw	a1,28(s0)
    5a00:	0007c503          	lbu	a0,0(a5)
    5a04:	e95fe0ef          	jal	ra,4898 <ld_clust.isra.0>
    5a08:	00a42423          	sw	a0,8(s0)
    5a0c:	01c12783          	lw	a5,28(sp)
    5a10:	00040513          	mv	a0,s0
    5a14:	0067d783          	lhu	a5,6(a5)
    5a18:	00f41223          	sh	a5,4(s0)
    5a1c:	ad4ff0ef          	jal	ra,4cf0 <dir_sdi.constprop.0>
    5a20:	00400793          	li	a5,4
    5a24:	fcf504e3          	beq	a0,a5,59ec <f_opendir+0x54>
    5a28:	fc0514e3          	bnez	a0,59f0 <f_opendir+0x58>
    5a2c:	02c12083          	lw	ra,44(sp)
    5a30:	02812403          	lw	s0,40(sp)
    5a34:	03010113          	addi	sp,sp,48
    5a38:	00008067          	ret
    5a3c:	00900513          	li	a0,9
    5a40:	fedff06f          	j	5a2c <f_opendir+0x94>
    5a44:	00400793          	li	a5,4
    5a48:	faf502e3          	beq	a0,a5,59ec <f_opendir+0x54>
    5a4c:	fa5ff06f          	j	59f0 <f_opendir+0x58>

00005a50 <f_closedir>:
    5a50:	fe010113          	addi	sp,sp,-32
    5a54:	00c10593          	addi	a1,sp,12
    5a58:	00812c23          	sw	s0,24(sp)
    5a5c:	00112e23          	sw	ra,28(sp)
    5a60:	00050413          	mv	s0,a0
    5a64:	b09fe0ef          	jal	ra,456c <validate>
    5a68:	00051463          	bnez	a0,5a70 <f_closedir+0x20>
    5a6c:	00042023          	sw	zero,0(s0)
    5a70:	01c12083          	lw	ra,28(sp)
    5a74:	01812403          	lw	s0,24(sp)
    5a78:	02010113          	addi	sp,sp,32
    5a7c:	00008067          	ret

00005a80 <f_readdir>:
    5a80:	fb010113          	addi	sp,sp,-80
    5a84:	04912223          	sw	s1,68(sp)
    5a88:	00058493          	mv	s1,a1
    5a8c:	00c10593          	addi	a1,sp,12
    5a90:	05212023          	sw	s2,64(sp)
    5a94:	03312e23          	sw	s3,60(sp)
    5a98:	04112623          	sw	ra,76(sp)
    5a9c:	04812423          	sw	s0,72(sp)
    5aa0:	03412c23          	sw	s4,56(sp)
    5aa4:	03512a23          	sw	s5,52(sp)
    5aa8:	03612823          	sw	s6,48(sp)
    5aac:	03712623          	sw	s7,44(sp)
    5ab0:	03812423          	sw	s8,40(sp)
    5ab4:	03912223          	sw	s9,36(sp)
    5ab8:	03a12023          	sw	s10,32(sp)
    5abc:	01b12e23          	sw	s11,28(sp)
    5ac0:	00050913          	mv	s2,a0
    5ac4:	aa9fe0ef          	jal	ra,456c <validate>
    5ac8:	00050993          	mv	s3,a0
    5acc:	3c051c63          	bnez	a0,5ea4 <f_readdir+0x424>
    5ad0:	00049a63          	bnez	s1,5ae4 <f_readdir+0x64>
    5ad4:	00090513          	mv	a0,s2
    5ad8:	a18ff0ef          	jal	ra,4cf0 <dir_sdi.constprop.0>
    5adc:	00050993          	mv	s3,a0
    5ae0:	3c40006f          	j	5ea4 <f_readdir+0x424>
    5ae4:	00092b03          	lw	s6,0(s2)
    5ae8:	00008a37          	lui	s4,0x8
    5aec:	00010ab7          	lui	s5,0x10
    5af0:	0ff00c13          	li	s8,255
    5af4:	0ff00413          	li	s0,255
    5af8:	00400513          	li	a0,4
    5afc:	00d00b93          	li	s7,13
    5b00:	f2ca0a13          	addi	s4,s4,-212 # 7f2c <LfnOfs>
    5b04:	fffa8a93          	addi	s5,s5,-1 # ffff <_edata_rom+0x7e8b>
    5b08:	01892583          	lw	a1,24(s2)
    5b0c:	00059663          	bnez	a1,5b18 <f_readdir+0x98>
    5b10:	16050c63          	beqz	a0,5c88 <f_readdir+0x208>
    5b14:	11c0006f          	j	5c30 <f_readdir+0x1b0>
    5b18:	000b0513          	mv	a0,s6
    5b1c:	acdfe0ef          	jal	ra,45e8 <move_window>
    5b20:	10051863          	bnez	a0,5c30 <f_readdir+0x1b0>
    5b24:	01c92783          	lw	a5,28(s2)
    5b28:	0007c703          	lbu	a4,0(a5)
    5b2c:	24070263          	beqz	a4,5d70 <f_readdir+0x2f0>
    5b30:	00b7c683          	lbu	a3,11(a5)
    5b34:	0e500613          	li	a2,229
    5b38:	03f6f693          	andi	a3,a3,63
    5b3c:	00d90323          	sb	a3,6(s2)
    5b40:	10c70263          	beq	a4,a2,5c44 <f_readdir+0x1c4>
    5b44:	02e00613          	li	a2,46
    5b48:	0ec70e63          	beq	a4,a2,5c44 <f_readdir+0x1c4>
    5b4c:	fdf6f613          	andi	a2,a3,-33
    5b50:	00800593          	li	a1,8
    5b54:	0eb60863          	beq	a2,a1,5c44 <f_readdir+0x1c4>
    5b58:	00f00613          	li	a2,15
    5b5c:	0ec69c63          	bne	a3,a2,5c54 <f_readdir+0x1d4>
    5b60:	04077693          	andi	a3,a4,64
    5b64:	0c068e63          	beqz	a3,5c40 <f_readdir+0x1c0>
    5b68:	0bf77413          	andi	s0,a4,191
    5b6c:	01092703          	lw	a4,16(s2)
    5b70:	00d7cc03          	lbu	s8,13(a5)
    5b74:	02e92623          	sw	a4,44(s2)
    5b78:	00d7c703          	lbu	a4,13(a5)
    5b7c:	0d871463          	bne	a4,s8,5c44 <f_readdir+0x1c4>
    5b80:	01b7c703          	lbu	a4,27(a5)
    5b84:	01a7c683          	lbu	a3,26(a5)
    5b88:	00871713          	slli	a4,a4,0x8
    5b8c:	00d76733          	or	a4,a4,a3
    5b90:	01071713          	slli	a4,a4,0x10
    5b94:	41075713          	srai	a4,a4,0x10
    5b98:	0a071663          	bnez	a4,5c44 <f_readdir+0x1c4>
    5b9c:	0007c703          	lbu	a4,0(a5)
    5ba0:	00cb2603          	lw	a2,12(s6)
    5ba4:	00100813          	li	a6,1
    5ba8:	fbf77713          	andi	a4,a4,-65
    5bac:	fff70713          	addi	a4,a4,-1
    5bb0:	03770733          	mul	a4,a4,s7
    5bb4:	0ff00893          	li	a7,255
    5bb8:	00aa06b3          	add	a3,s4,a0
    5bbc:	0006c583          	lbu	a1,0(a3)
    5bc0:	00b785b3          	add	a1,a5,a1
    5bc4:	0015c683          	lbu	a3,1(a1)
    5bc8:	0005c583          	lbu	a1,0(a1)
    5bcc:	00869693          	slli	a3,a3,0x8
    5bd0:	00b6e6b3          	or	a3,a3,a1
    5bd4:	06080c63          	beqz	a6,5c4c <f_readdir+0x1cc>
    5bd8:	06e8e663          	bltu	a7,a4,5c44 <f_readdir+0x1c4>
    5bdc:	00171593          	slli	a1,a4,0x1
    5be0:	00b605b3          	add	a1,a2,a1
    5be4:	00d59023          	sh	a3,0(a1)
    5be8:	00068813          	mv	a6,a3
    5bec:	00170713          	addi	a4,a4,1
    5bf0:	00150513          	addi	a0,a0,1
    5bf4:	fd7512e3          	bne	a0,s7,5bb8 <f_readdir+0x138>
    5bf8:	0007c783          	lbu	a5,0(a5)
    5bfc:	0407f793          	andi	a5,a5,64
    5c00:	00078e63          	beqz	a5,5c1c <f_readdir+0x19c>
    5c04:	00080c63          	beqz	a6,5c1c <f_readdir+0x19c>
    5c08:	0ff00793          	li	a5,255
    5c0c:	02e7ec63          	bltu	a5,a4,5c44 <f_readdir+0x1c4>
    5c10:	00171713          	slli	a4,a4,0x1
    5c14:	00e60733          	add	a4,a2,a4
    5c18:	00071023          	sh	zero,0(a4)
    5c1c:	fff40413          	addi	s0,s0,-1
    5c20:	0ff47413          	andi	s0,s0,255
    5c24:	00090513          	mv	a0,s2
    5c28:	b81fe0ef          	jal	ra,47a8 <dir_next.isra.0>
    5c2c:	ec050ee3          	beqz	a0,5b08 <f_readdir+0x88>
    5c30:	00092c23          	sw	zero,24(s2)
    5c34:	00400793          	li	a5,4
    5c38:	eaf512e3          	bne	a0,a5,5adc <f_readdir+0x5c>
    5c3c:	04c0006f          	j	5c88 <f_readdir+0x208>
    5c40:	f2870ce3          	beq	a4,s0,5b78 <f_readdir+0xf8>
    5c44:	0ff00413          	li	s0,255
    5c48:	fddff06f          	j	5c24 <f_readdir+0x1a4>
    5c4c:	fb5682e3          	beq	a3,s5,5bf0 <f_readdir+0x170>
    5c50:	ff5ff06f          	j	5c44 <f_readdir+0x1c4>
    5c54:	02041663          	bnez	s0,5c80 <f_readdir+0x200>
    5c58:	00b78693          	addi	a3,a5,11
    5c5c:	00145713          	srli	a4,s0,0x1
    5c60:	00178793          	addi	a5,a5,1
    5c64:	00741413          	slli	s0,s0,0x7
    5c68:	00876433          	or	s0,a4,s0
    5c6c:	fff7c703          	lbu	a4,-1(a5)
    5c70:	00e40433          	add	s0,s0,a4
    5c74:	0ff47413          	andi	s0,s0,255
    5c78:	fef692e3          	bne	a3,a5,5c5c <f_readdir+0x1dc>
    5c7c:	008c0663          	beq	s8,s0,5c88 <f_readdir+0x208>
    5c80:	fff00793          	li	a5,-1
    5c84:	02f92623          	sw	a5,44(s2)
    5c88:	00092c83          	lw	s9,0(s2)
    5c8c:	00048b23          	sb	zero,22(s1)
    5c90:	01892783          	lw	a5,24(s2)
    5c94:	20078063          	beqz	a5,5e94 <f_readdir+0x414>
    5c98:	02c92703          	lw	a4,44(s2)
    5c9c:	fff00793          	li	a5,-1
    5ca0:	16f71663          	bne	a4,a5,5e0c <f_readdir+0x38c>
    5ca4:	01c92403          	lw	s0,28(s2)
    5ca8:	00000793          	li	a5,0
    5cac:	00000713          	li	a4,0
    5cb0:	02000593          	li	a1,32
    5cb4:	00500513          	li	a0,5
    5cb8:	00900813          	li	a6,9
    5cbc:	00b00613          	li	a2,11
    5cc0:	02e00893          	li	a7,46
    5cc4:	00170713          	addi	a4,a4,1
    5cc8:	00e406b3          	add	a3,s0,a4
    5ccc:	fff6c683          	lbu	a3,-1(a3)
    5cd0:	02b68663          	beq	a3,a1,5cfc <f_readdir+0x27c>
    5cd4:	00a69463          	bne	a3,a0,5cdc <f_readdir+0x25c>
    5cd8:	0e500693          	li	a3,229
    5cdc:	01071a63          	bne	a4,a6,5cf0 <f_readdir+0x270>
    5ce0:	00f66863          	bltu	a2,a5,5cf0 <f_readdir+0x270>
    5ce4:	00f48333          	add	t1,s1,a5
    5ce8:	011304a3          	sb	a7,9(t1)
    5cec:	00178793          	addi	a5,a5,1
    5cf0:	00f48333          	add	t1,s1,a5
    5cf4:	00d304a3          	sb	a3,9(t1)
    5cf8:	00178793          	addi	a5,a5,1
    5cfc:	fcc714e3          	bne	a4,a2,5cc4 <f_readdir+0x244>
    5d00:	00f48733          	add	a4,s1,a5
    5d04:	000704a3          	sb	zero,9(a4)
    5d08:	0164c703          	lbu	a4,22(s1)
    5d0c:	14071663          	bnez	a4,5e58 <f_readdir+0x3d8>
    5d10:	12078463          	beqz	a5,5e38 <f_readdir+0x3b8>
    5d14:	ff700613          	li	a2,-9
    5d18:	00948793          	addi	a5,s1,9
    5d1c:	00800593          	li	a1,8
    5d20:	40960633          	sub	a2,a2,s1
    5d24:	02e00513          	li	a0,46
    5d28:	01900813          	li	a6,25
    5d2c:	0007c683          	lbu	a3,0(a5)
    5d30:	00f60733          	add	a4,a2,a5
    5d34:	10068863          	beqz	a3,5e44 <f_readdir+0x3c4>
    5d38:	01069713          	slli	a4,a3,0x10
    5d3c:	01075713          	srli	a4,a4,0x10
    5d40:	1aa68263          	beq	a3,a0,5ee4 <f_readdir+0x464>
    5d44:	fbf70693          	addi	a3,a4,-65
    5d48:	01069693          	slli	a3,a3,0x10
    5d4c:	0106d693          	srli	a3,a3,0x10
    5d50:	00d86a63          	bltu	a6,a3,5d64 <f_readdir+0x2e4>
    5d54:	00c44683          	lbu	a3,12(s0)
    5d58:	00d5f6b3          	and	a3,a1,a3
    5d5c:	00068463          	beqz	a3,5d64 <f_readdir+0x2e4>
    5d60:	02070713          	addi	a4,a4,32
    5d64:	00e786a3          	sb	a4,13(a5)
    5d68:	00178793          	addi	a5,a5,1
    5d6c:	fc1ff06f          	j	5d2c <f_readdir+0x2ac>
    5d70:	00400513          	li	a0,4
    5d74:	ebdff06f          	j	5c30 <f_readdir+0x1b0>
    5d78:	000a9a63          	bnez	s5,5d8c <f_readdir+0x30c>
    5d7c:	01778733          	add	a4,a5,s7
    5d80:	01071713          	slli	a4,a4,0x10
    5d84:	01075713          	srli	a4,a4,0x10
    5d88:	02edfe63          	bgeu	s11,a4,5dc4 <f_readdir+0x344>
    5d8c:	010a9513          	slli	a0,s5,0x10
    5d90:	1b500593          	li	a1,437
    5d94:	00f56533          	or	a0,a0,a5
    5d98:	414c0433          	sub	s0,s8,s4
    5d9c:	d74fe0ef          	jal	ra,4310 <ff_uni2oem>
    5da0:	04ac7a63          	bgeu	s8,a0,5df4 <f_readdir+0x374>
    5da4:	088d7663          	bgeu	s10,s0,5e30 <f_readdir+0x3b0>
    5da8:	014487b3          	add	a5,s1,s4
    5dac:	00855713          	srli	a4,a0,0x8
    5db0:	00e78b23          	sb	a4,22(a5)
    5db4:	00a78ba3          	sb	a0,23(a5)
    5db8:	00200793          	li	a5,2
    5dbc:	00fa0a33          	add	s4,s4,a5
    5dc0:	00000793          	li	a5,0
    5dc4:	002b0b13          	addi	s6,s6,2
    5dc8:	00078a93          	mv	s5,a5
    5dcc:	00cca783          	lw	a5,12(s9)
    5dd0:	016787b3          	add	a5,a5,s6
    5dd4:	0007d783          	lhu	a5,0(a5)
    5dd8:	fa0790e3          	bnez	a5,5d78 <f_readdir+0x2f8>
    5ddc:	000a0413          	mv	s0,s4
    5de0:	000a8463          	beqz	s5,5de8 <f_readdir+0x368>
    5de4:	00000413          	li	s0,0
    5de8:	00848433          	add	s0,s1,s0
    5dec:	00040b23          	sb	zero,22(s0)
    5df0:	eb5ff06f          	j	5ca4 <f_readdir+0x224>
    5df4:	02050e63          	beqz	a0,5e30 <f_readdir+0x3b0>
    5df8:	fe0404e3          	beqz	s0,5de0 <f_readdir+0x360>
    5dfc:	014487b3          	add	a5,s1,s4
    5e00:	00a78b23          	sb	a0,22(a5)
    5e04:	00100793          	li	a5,1
    5e08:	fb5ff06f          	j	5dbc <f_readdir+0x33c>
    5e0c:	00003bb7          	lui	s7,0x3
    5e10:	00000b13          	li	s6,0
    5e14:	00000a13          	li	s4,0
    5e18:	00000a93          	li	s5,0
    5e1c:	0ff00c13          	li	s8,255
    5e20:	00100d13          	li	s10,1
    5e24:	800b8b93          	addi	s7,s7,-2048 # 2800 <__i_vfprintf+0x228>
    5e28:	7ff00d93          	li	s11,2047
    5e2c:	fa1ff06f          	j	5dcc <f_readdir+0x34c>
    5e30:	00000413          	li	s0,0
    5e34:	fadff06f          	j	5de0 <f_readdir+0x360>
    5e38:	03f00793          	li	a5,63
    5e3c:	00f48b23          	sb	a5,22(s1)
    5e40:	00100713          	li	a4,1
    5e44:	00e48733          	add	a4,s1,a4
    5e48:	00070b23          	sb	zero,22(a4)
    5e4c:	00c44783          	lbu	a5,12(s0)
    5e50:	00079463          	bnez	a5,5e58 <f_readdir+0x3d8>
    5e54:	000484a3          	sb	zero,9(s1)
    5e58:	00b44783          	lbu	a5,11(s0)
    5e5c:	01c40513          	addi	a0,s0,28
    5e60:	00f48423          	sb	a5,8(s1)
    5e64:	e34fe0ef          	jal	ra,4498 <ld_dword>
    5e68:	00a4a023          	sw	a0,0(s1)
    5e6c:	01744783          	lbu	a5,23(s0)
    5e70:	01644703          	lbu	a4,22(s0)
    5e74:	00879793          	slli	a5,a5,0x8
    5e78:	00e7e7b3          	or	a5,a5,a4
    5e7c:	00f49323          	sh	a5,6(s1)
    5e80:	01944783          	lbu	a5,25(s0)
    5e84:	01844703          	lbu	a4,24(s0)
    5e88:	00879793          	slli	a5,a5,0x8
    5e8c:	00e7e7b3          	or	a5,a5,a4
    5e90:	00f49223          	sh	a5,4(s1)
    5e94:	00090513          	mv	a0,s2
    5e98:	911fe0ef          	jal	ra,47a8 <dir_next.isra.0>
    5e9c:	00400793          	li	a5,4
    5ea0:	c2f51ee3          	bne	a0,a5,5adc <f_readdir+0x5c>
    5ea4:	04c12083          	lw	ra,76(sp)
    5ea8:	04812403          	lw	s0,72(sp)
    5eac:	04412483          	lw	s1,68(sp)
    5eb0:	04012903          	lw	s2,64(sp)
    5eb4:	03812a03          	lw	s4,56(sp)
    5eb8:	03412a83          	lw	s5,52(sp)
    5ebc:	03012b03          	lw	s6,48(sp)
    5ec0:	02c12b83          	lw	s7,44(sp)
    5ec4:	02812c03          	lw	s8,40(sp)
    5ec8:	02412c83          	lw	s9,36(sp)
    5ecc:	02012d03          	lw	s10,32(sp)
    5ed0:	01c12d83          	lw	s11,28(sp)
    5ed4:	00098513          	mv	a0,s3
    5ed8:	03c12983          	lw	s3,60(sp)
    5edc:	05010113          	addi	sp,sp,80
    5ee0:	00008067          	ret
    5ee4:	01000593          	li	a1,16
    5ee8:	e7dff06f          	j	5d64 <f_readdir+0x2e4>

00005eec <sdram_get_databits>:
    5eec:	01000513          	li	a0,16
    5ef0:	00008067          	ret

00005ef4 <sdram_get_freq>:
    5ef4:	02faf537          	lui	a0,0x2faf
    5ef8:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa6f0c>
    5efc:	00008067          	ret

00005f00 <sdram_get_cl>:
    5f00:	00200513          	li	a0,2
    5f04:	00008067          	ret

00005f08 <sdram_get_cwl>:
    5f08:	00200513          	li	a0,2
    5f0c:	00008067          	ret

00005f10 <sdram_software_control_on>:
    5f10:	f00037b7          	lui	a5,0xf0003
    5f14:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    5f18:	00e00713          	li	a4,14
    5f1c:	00e68a63          	beq	a3,a4,5f30 <sdram_software_control_on+0x20>
    5f20:	00008537          	lui	a0,0x8
    5f24:	80e7a023          	sw	a4,-2048(a5)
    5f28:	f3c50513          	addi	a0,a0,-196 # 7f3c <LfnOfs+0x10>
    5f2c:	ba4fc06f          	j	22d0 <printf>
    5f30:	00008067          	ret

00005f34 <sdram_software_control_off>:
    5f34:	f00037b7          	lui	a5,0xf0003
    5f38:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    5f3c:	00100713          	li	a4,1
    5f40:	00e68a63          	beq	a3,a4,5f54 <sdram_software_control_off+0x20>
    5f44:	00008537          	lui	a0,0x8
    5f48:	80e7a023          	sw	a4,-2048(a5)
    5f4c:	f6450513          	addi	a0,a0,-156 # 7f64 <LfnOfs+0x38>
    5f50:	b80fc06f          	j	22d0 <printf>
    5f54:	00008067          	ret

00005f58 <sdram_mode_register_write>:
    5f58:	f00037b7          	lui	a5,0xf0003
    5f5c:	80b7a623          	sw	a1,-2036(a5) # f000280c <_fstack+0xe000180c>
    5f60:	80a7a823          	sw	a0,-2032(a5)
    5f64:	00f00713          	li	a4,15
    5f68:	80e7a223          	sw	a4,-2044(a5)
    5f6c:	00100713          	li	a4,1
    5f70:	80e7a423          	sw	a4,-2040(a5)
    5f74:	00008067          	ret

00005f78 <sdram_leveling>:
    5f78:	ff010113          	addi	sp,sp,-16
    5f7c:	00112623          	sw	ra,12(sp)
    5f80:	f91ff0ef          	jal	ra,5f10 <sdram_software_control_on>
    5f84:	fb1ff0ef          	jal	ra,5f34 <sdram_software_control_off>
    5f88:	00c12083          	lw	ra,12(sp)
    5f8c:	00100513          	li	a0,1
    5f90:	01010113          	addi	sp,sp,16
    5f94:	00008067          	ret

00005f98 <sdram_init>:
    5f98:	00008537          	lui	a0,0x8
    5f9c:	ff010113          	addi	sp,sp,-16
    5fa0:	400005b7          	lui	a1,0x40000
    5fa4:	f8c50513          	addi	a0,a0,-116 # 7f8c <LfnOfs+0x60>
    5fa8:	00112623          	sw	ra,12(sp)
    5fac:	b24fc0ef          	jal	ra,22d0 <printf>
    5fb0:	f61ff0ef          	jal	ra,5f10 <sdram_software_control_on>
    5fb4:	f00037b7          	lui	a5,0xf0003
    5fb8:	8007a623          	sw	zero,-2036(a5) # f000280c <_fstack+0xe000180c>
    5fbc:	8007a823          	sw	zero,-2032(a5)
    5fc0:	00e00713          	li	a4,14
    5fc4:	80e7a023          	sw	a4,-2048(a5)
    5fc8:	40000593          	li	a1,1024
    5fcc:	80b7a623          	sw	a1,-2036(a5)
    5fd0:	8007a823          	sw	zero,-2032(a5)
    5fd4:	00b00613          	li	a2,11
    5fd8:	80c7a223          	sw	a2,-2044(a5)
    5fdc:	00100713          	li	a4,1
    5fe0:	80e7a423          	sw	a4,-2040(a5)
    5fe4:	12000693          	li	a3,288
    5fe8:	80d7a623          	sw	a3,-2036(a5)
    5fec:	8007a823          	sw	zero,-2032(a5)
    5ff0:	00f00693          	li	a3,15
    5ff4:	80d7a223          	sw	a3,-2044(a5)
    5ff8:	80e7a423          	sw	a4,-2040(a5)
    5ffc:	80b7a623          	sw	a1,-2036(a5)
    6000:	8007a823          	sw	zero,-2032(a5)
    6004:	80c7a223          	sw	a2,-2044(a5)
    6008:	80e7a423          	sw	a4,-2040(a5)
    600c:	8007a623          	sw	zero,-2036(a5)
    6010:	8007a823          	sw	zero,-2032(a5)
    6014:	00d00613          	li	a2,13
    6018:	80c7a223          	sw	a2,-2044(a5)
    601c:	80e7a423          	sw	a4,-2040(a5)
    6020:	8007a623          	sw	zero,-2036(a5)
    6024:	8007a823          	sw	zero,-2032(a5)
    6028:	80c7a223          	sw	a2,-2044(a5)
    602c:	80e7a423          	sw	a4,-2040(a5)
    6030:	02000613          	li	a2,32
    6034:	80c7a623          	sw	a2,-2036(a5)
    6038:	8007a823          	sw	zero,-2032(a5)
    603c:	80d7a223          	sw	a3,-2044(a5)
    6040:	80e7a423          	sw	a4,-2040(a5)
    6044:	ef1ff0ef          	jal	ra,5f34 <sdram_software_control_off>
    6048:	08000593          	li	a1,128
    604c:	40000537          	lui	a0,0x40000
    6050:	d39fd0ef          	jal	ra,3d88 <memtest>
    6054:	00050e63          	beqz	a0,6070 <sdram_init+0xd8>
    6058:	40000537          	lui	a0,0x40000
    605c:	00000693          	li	a3,0
    6060:	00000613          	li	a2,0
    6064:	08000593          	li	a1,128
    6068:	ad9fd0ef          	jal	ra,3b40 <memspeed>
    606c:	00100513          	li	a0,1
    6070:	00c12083          	lw	ra,12(sp)
    6074:	01010113          	addi	sp,sp,16
    6078:	00008067          	ret

0000607c <spi_xfer>:
    607c:	f0003737          	lui	a4,0xf0003
    6080:	000017b7          	lui	a5,0x1
    6084:	00a72423          	sw	a0,8(a4) # f0003008 <_fstack+0xe0002008>
    6088:	80178793          	addi	a5,a5,-2047 # 801 <boot+0x19>
    608c:	00f72023          	sw	a5,0(a4)
    6090:	00472783          	lw	a5,4(a4)
    6094:	0017f793          	andi	a5,a5,1
    6098:	fe078ce3          	beqz	a5,6090 <spi_xfer+0x14>
    609c:	00c72503          	lw	a0,12(a4)
    60a0:	0ff57513          	andi	a0,a0,255
    60a4:	00008067          	ret

000060a8 <spisdcard_deselect>:
    60a8:	f00037b7          	lui	a5,0xf0003
    60ac:	0007a823          	sw	zero,16(a5) # f0003010 <_fstack+0xe0002010>
    60b0:	0ff00513          	li	a0,255
    60b4:	fc9ff06f          	j	607c <spi_xfer>

000060b8 <spisdcardread_bytes>:
    60b8:	ff010113          	addi	sp,sp,-16
    60bc:	00812423          	sw	s0,8(sp)
    60c0:	00912223          	sw	s1,4(sp)
    60c4:	01212023          	sw	s2,0(sp)
    60c8:	00112623          	sw	ra,12(sp)
    60cc:	00050913          	mv	s2,a0
    60d0:	00058493          	mv	s1,a1
    60d4:	00000413          	li	s0,0
    60d8:	0ff00513          	li	a0,255
    60dc:	fa1ff0ef          	jal	ra,607c <spi_xfer>
    60e0:	008907b3          	add	a5,s2,s0
    60e4:	00140413          	addi	s0,s0,1
    60e8:	00a78023          	sb	a0,0(a5)
    60ec:	01041793          	slli	a5,s0,0x10
    60f0:	0107d793          	srli	a5,a5,0x10
    60f4:	fe97e2e3          	bltu	a5,s1,60d8 <spisdcardread_bytes+0x20>
    60f8:	00c12083          	lw	ra,12(sp)
    60fc:	00812403          	lw	s0,8(sp)
    6100:	00412483          	lw	s1,4(sp)
    6104:	00012903          	lw	s2,0(sp)
    6108:	01010113          	addi	sp,sp,16
    610c:	00008067          	ret

00006110 <spisd_disk_status>:
    6110:	00051863          	bnez	a0,6120 <spisd_disk_status+0x10>
    6114:	100007b7          	lui	a5,0x10000
    6118:	1647c503          	lbu	a0,356(a5) # 10000164 <spisdcardstatus>
    611c:	00008067          	ret
    6120:	00100513          	li	a0,1
    6124:	00008067          	ret

00006128 <spisdcardsend_cmd>:
    6128:	fe010113          	addi	sp,sp,-32
    612c:	01851793          	slli	a5,a0,0x18
    6130:	00812c23          	sw	s0,24(sp)
    6134:	00912a23          	sw	s1,20(sp)
    6138:	00112e23          	sw	ra,28(sp)
    613c:	01212823          	sw	s2,16(sp)
    6140:	4187d793          	srai	a5,a5,0x18
    6144:	00050413          	mv	s0,a0
    6148:	00058493          	mv	s1,a1
    614c:	0207d063          	bgez	a5,616c <spisdcardsend_cmd+0x44>
    6150:	00000593          	li	a1,0
    6154:	03700513          	li	a0,55
    6158:	fd1ff0ef          	jal	ra,6128 <spisdcardsend_cmd>
    615c:	00a103a3          	sb	a0,7(sp)
    6160:	00100793          	li	a5,1
    6164:	06a7e063          	bltu	a5,a0,61c4 <spisdcardsend_cmd+0x9c>
    6168:	07f47413          	andi	s0,s0,127
    616c:	00c00793          	li	a5,12
    6170:	06f40663          	beq	s0,a5,61dc <spisdcardsend_cmd+0xb4>
    6174:	06040463          	beqz	s0,61dc <spisdcardsend_cmd+0xb4>
    6178:	f31ff0ef          	jal	ra,60a8 <spisdcard_deselect>
    617c:	f00037b7          	lui	a5,0xf0003
    6180:	00100713          	li	a4,1
    6184:	00e7a823          	sw	a4,16(a5) # f0003010 <_fstack+0xe0002010>
    6188:	0ff00513          	li	a0,255
    618c:	ef1ff0ef          	jal	ra,607c <spi_xfer>
    6190:	1f400913          	li	s2,500
    6194:	0ff00513          	li	a0,255
    6198:	ee5ff0ef          	jal	ra,607c <spi_xfer>
    619c:	0ff00793          	li	a5,255
    61a0:	02f50e63          	beq	a0,a5,61dc <spisdcardsend_cmd+0xb4>
    61a4:	fff90913          	addi	s2,s2,-1
    61a8:	01091913          	slli	s2,s2,0x10
    61ac:	00100513          	li	a0,1
    61b0:	01095913          	srli	s2,s2,0x10
    61b4:	a50fd0ef          	jal	ra,3404 <busy_wait>
    61b8:	fc091ee3          	bnez	s2,6194 <spisdcardsend_cmd+0x6c>
    61bc:	eedff0ef          	jal	ra,60a8 <spisdcard_deselect>
    61c0:	0ff00513          	li	a0,255
    61c4:	01c12083          	lw	ra,28(sp)
    61c8:	01812403          	lw	s0,24(sp)
    61cc:	01412483          	lw	s1,20(sp)
    61d0:	01012903          	lw	s2,16(sp)
    61d4:	02010113          	addi	sp,sp,32
    61d8:	00008067          	ret
    61dc:	04046793          	ori	a5,s0,64
    61e0:	00f10423          	sb	a5,8(sp)
    61e4:	0184d793          	srli	a5,s1,0x18
    61e8:	00f104a3          	sb	a5,9(sp)
    61ec:	0104d793          	srli	a5,s1,0x10
    61f0:	00f10523          	sb	a5,10(sp)
    61f4:	0084d793          	srli	a5,s1,0x8
    61f8:	00f105a3          	sb	a5,11(sp)
    61fc:	00910623          	sb	s1,12(sp)
    6200:	f9500793          	li	a5,-107
    6204:	00040863          	beqz	s0,6214 <spisdcardsend_cmd+0xec>
    6208:	00800793          	li	a5,8
    620c:	06f41863          	bne	s0,a5,627c <spisdcardsend_cmd+0x154>
    6210:	f8700793          	li	a5,-121
    6214:	00f106a3          	sb	a5,13(sp)
    6218:	00000493          	li	s1,0
    621c:	00600913          	li	s2,6
    6220:	00810793          	addi	a5,sp,8
    6224:	009787b3          	add	a5,a5,s1
    6228:	0007c503          	lbu	a0,0(a5)
    622c:	00148493          	addi	s1,s1,1
    6230:	e4dff0ef          	jal	ra,607c <spi_xfer>
    6234:	ff2496e3          	bne	s1,s2,6220 <spisdcardsend_cmd+0xf8>
    6238:	00c00793          	li	a5,12
    623c:	00f41863          	bne	s0,a5,624c <spisdcardsend_cmd+0x124>
    6240:	00100593          	li	a1,1
    6244:	00710513          	addi	a0,sp,7
    6248:	e71ff0ef          	jal	ra,60b8 <spisdcardread_bytes>
    624c:	00a00413          	li	s0,10
    6250:	00710513          	addi	a0,sp,7
    6254:	00100593          	li	a1,1
    6258:	e61ff0ef          	jal	ra,60b8 <spisdcardread_bytes>
    625c:	00714503          	lbu	a0,7(sp)
    6260:	01851793          	slli	a5,a0,0x18
    6264:	4187d793          	srai	a5,a5,0x18
    6268:	f407dee3          	bgez	a5,61c4 <spisdcardsend_cmd+0x9c>
    626c:	fff40413          	addi	s0,s0,-1
    6270:	0ff47413          	andi	s0,s0,255
    6274:	fc041ee3          	bnez	s0,6250 <spisdcardsend_cmd+0x128>
    6278:	f4dff06f          	j	61c4 <spisdcardsend_cmd+0x9c>
    627c:	00100793          	li	a5,1
    6280:	f95ff06f          	j	6214 <spisdcardsend_cmd+0xec>

00006284 <spisd_disk_read>:
    6284:	fd010113          	addi	sp,sp,-48
    6288:	03212023          	sw	s2,32(sp)
    628c:	00100913          	li	s2,1
    6290:	00d93933          	sltu	s2,s2,a3
    6294:	01190913          	addi	s2,s2,17
    6298:	02812423          	sw	s0,40(sp)
    629c:	00090513          	mv	a0,s2
    62a0:	00058413          	mv	s0,a1
    62a4:	00060593          	mv	a1,a2
    62a8:	02912223          	sw	s1,36(sp)
    62ac:	02112623          	sw	ra,44(sp)
    62b0:	01312e23          	sw	s3,28(sp)
    62b4:	01412c23          	sw	s4,24(sp)
    62b8:	01512a23          	sw	s5,20(sp)
    62bc:	01612823          	sw	s6,16(sp)
    62c0:	01712623          	sw	s7,12(sp)
    62c4:	00068493          	mv	s1,a3
    62c8:	e61ff0ef          	jal	ra,6128 <spisdcardsend_cmd>
    62cc:	04051863          	bnez	a0,631c <spisd_disk_read+0x98>
    62d0:	00001a37          	lui	s4,0x1
    62d4:	00018b37          	lui	s6,0x18
    62d8:	0fe00b93          	li	s7,254
    62dc:	f00039b7          	lui	s3,0xf0003
    62e0:	801a0a13          	addi	s4,s4,-2047 # 801 <boot+0x19>
    62e4:	02048263          	beqz	s1,6308 <spisd_disk_read+0x84>
    62e8:	6a0b0a93          	addi	s5,s6,1696 # 186a0 <_edata_rom+0x1052c>
    62ec:	0ff00513          	li	a0,255
    62f0:	d8dff0ef          	jal	ra,607c <spi_xfer>
    62f4:	05750e63          	beq	a0,s7,6350 <spisd_disk_read+0xcc>
    62f8:	00100513          	li	a0,1
    62fc:	fffa8a93          	addi	s5,s5,-1
    6300:	944fd0ef          	jal	ra,3444 <busy_wait_us>
    6304:	fe0a94e3          	bnez	s5,62ec <spisd_disk_read+0x68>
    6308:	01200793          	li	a5,18
    630c:	00f91863          	bne	s2,a5,631c <spisd_disk_read+0x98>
    6310:	00000593          	li	a1,0
    6314:	00c00513          	li	a0,12
    6318:	e11ff0ef          	jal	ra,6128 <spisdcardsend_cmd>
    631c:	d8dff0ef          	jal	ra,60a8 <spisdcard_deselect>
    6320:	02c12083          	lw	ra,44(sp)
    6324:	02812403          	lw	s0,40(sp)
    6328:	02012903          	lw	s2,32(sp)
    632c:	01c12983          	lw	s3,28(sp)
    6330:	01812a03          	lw	s4,24(sp)
    6334:	01412a83          	lw	s5,20(sp)
    6338:	01012b03          	lw	s6,16(sp)
    633c:	00c12b83          	lw	s7,12(sp)
    6340:	00903533          	snez	a0,s1
    6344:	02412483          	lw	s1,36(sp)
    6348:	03010113          	addi	sp,sp,48
    634c:	00008067          	ret
    6350:	0ff00793          	li	a5,255
    6354:	00f9a423          	sw	a5,8(s3) # f0003008 <_fstack+0xe0002008>
    6358:	00100713          	li	a4,1
    635c:	20040793          	addi	a5,s0,512
    6360:	0149a023          	sw	s4,0(s3)
    6364:	0049a683          	lw	a3,4(s3)
    6368:	fee69ee3          	bne	a3,a4,6364 <spisd_disk_read+0xe0>
    636c:	00c9a683          	lw	a3,12(s3)
    6370:	00140413          	addi	s0,s0,1
    6374:	fed40fa3          	sb	a3,-1(s0)
    6378:	fef414e3          	bne	s0,a5,6360 <spisd_disk_read+0xdc>
    637c:	0ff00513          	li	a0,255
    6380:	cfdff0ef          	jal	ra,607c <spi_xfer>
    6384:	0ff00513          	li	a0,255
    6388:	cf5ff0ef          	jal	ra,607c <spi_xfer>
    638c:	fff48493          	addi	s1,s1,-1
    6390:	f55ff06f          	j	62e4 <spisd_disk_read+0x60>

00006394 <spisdcard_init>:
    6394:	fd010113          	addi	sp,sp,-48
    6398:	02912223          	sw	s1,36(sp)
    639c:	03212023          	sw	s2,32(sp)
    63a0:	01312e23          	sw	s3,28(sp)
    63a4:	02112623          	sw	ra,44(sp)
    63a8:	02812423          	sw	s0,40(sp)
    63ac:	f00037b7          	lui	a5,0xf0003
    63b0:	07e00713          	li	a4,126
    63b4:	00e7ac23          	sw	a4,24(a5) # f0003018 <_fstack+0xe0002018>
    63b8:	3e800493          	li	s1,1000
    63bc:	f0003937          	lui	s2,0xf0003
    63c0:	00100993          	li	s3,1
    63c4:	00092823          	sw	zero,16(s2) # f0003010 <_fstack+0xe0002010>
    63c8:	00a00413          	li	s0,10
    63cc:	fff40413          	addi	s0,s0,-1
    63d0:	0ff00513          	li	a0,255
    63d4:	0ff47413          	andi	s0,s0,255
    63d8:	ca5ff0ef          	jal	ra,607c <spi_xfer>
    63dc:	fe0418e3          	bnez	s0,63cc <spisdcard_init+0x38>
    63e0:	01392823          	sw	s3,16(s2)
    63e4:	00000593          	li	a1,0
    63e8:	00000513          	li	a0,0
    63ec:	d3dff0ef          	jal	ra,6128 <spisdcardsend_cmd>
    63f0:	05350463          	beq	a0,s3,6438 <spisdcard_init+0xa4>
    63f4:	fff48493          	addi	s1,s1,-1
    63f8:	01049493          	slli	s1,s1,0x10
    63fc:	0104d493          	srli	s1,s1,0x10
    6400:	fc0492e3          	bnez	s1,63c4 <spisdcard_init+0x30>
    6404:	02c12083          	lw	ra,44(sp)
    6408:	00040513          	mv	a0,s0
    640c:	02812403          	lw	s0,40(sp)
    6410:	02412483          	lw	s1,36(sp)
    6414:	02012903          	lw	s2,32(sp)
    6418:	01c12983          	lw	s3,28(sp)
    641c:	03010113          	addi	sp,sp,48
    6420:	00008067          	ret
    6424:	f00037b7          	lui	a5,0xf0003
    6428:	00300713          	li	a4,3
    642c:	00e7ac23          	sw	a4,24(a5) # f0003018 <_fstack+0xe0002018>
    6430:	00090413          	mv	s0,s2
    6434:	fd1ff06f          	j	6404 <spisdcard_init+0x70>
    6438:	1aa00593          	li	a1,426
    643c:	00800513          	li	a0,8
    6440:	ce9ff0ef          	jal	ra,6128 <spisdcardsend_cmd>
    6444:	00050913          	mv	s2,a0
    6448:	fb351ee3          	bne	a0,s3,6404 <spisdcard_init+0x70>
    644c:	00400593          	li	a1,4
    6450:	00c10513          	addi	a0,sp,12
    6454:	c65ff0ef          	jal	ra,60b8 <spisdcardread_bytes>
    6458:	3e800493          	li	s1,1000
    645c:	400005b7          	lui	a1,0x40000
    6460:	0a900513          	li	a0,169
    6464:	cc5ff0ef          	jal	ra,6128 <spisdcardsend_cmd>
    6468:	fa050ee3          	beqz	a0,6424 <spisdcard_init+0x90>
    646c:	fff48493          	addi	s1,s1,-1
    6470:	01049493          	slli	s1,s1,0x10
    6474:	00100513          	li	a0,1
    6478:	0104d493          	srli	s1,s1,0x10
    647c:	f89fc0ef          	jal	ra,3404 <busy_wait>
    6480:	fc049ee3          	bnez	s1,645c <spisdcard_init+0xc8>
    6484:	f81ff06f          	j	6404 <spisdcard_init+0x70>

00006488 <spisd_disk_initialize>:
    6488:	04051063          	bnez	a0,64c8 <spisd_disk_initialize+0x40>
    648c:	ff010113          	addi	sp,sp,-16
    6490:	00812423          	sw	s0,8(sp)
    6494:	10000437          	lui	s0,0x10000
    6498:	16444783          	lbu	a5,356(s0) # 10000164 <spisdcardstatus>
    649c:	00112623          	sw	ra,12(sp)
    64a0:	00078a63          	beqz	a5,64b4 <spisd_disk_initialize+0x2c>
    64a4:	ef1ff0ef          	jal	ra,6394 <spisdcard_init>
    64a8:	00153513          	seqz	a0,a0
    64ac:	16a40223          	sb	a0,356(s0)
    64b0:	bf9ff0ef          	jal	ra,60a8 <spisdcard_deselect>
    64b4:	16444503          	lbu	a0,356(s0)
    64b8:	00c12083          	lw	ra,12(sp)
    64bc:	00812403          	lw	s0,8(sp)
    64c0:	01010113          	addi	sp,sp,16
    64c4:	00008067          	ret
    64c8:	00100513          	li	a0,1
    64cc:	00008067          	ret

000064d0 <fatfs_set_ops_spisdcard>:
    64d0:	100007b7          	lui	a5,0x10000
    64d4:	10000737          	lui	a4,0x10000
    64d8:	15078793          	addi	a5,a5,336 # 10000150 <SpiSdDiskOps>
    64dc:	4af72c23          	sw	a5,1208(a4) # 100004b8 <FfDiskOps>
    64e0:	00008067          	ret
