
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
      64:	350040ef          	jal	ra,43b4 <isr>
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
     120:	55860613          	addi	a2,a2,1368 # 8674 <_fdata_rom>

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
     15c:	218040ef          	jal	ra,4374 <plic_init>
     160:	000012b7          	lui	t0,0x1
     164:	80028293          	addi	t0,t0,-2048 # 800 <boot+0x18>
     168:	30429073          	csrw	mie,t0
     16c:	465010ef          	jal	ra,1dd0 <main>

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
     1b0:	000079b7          	lui	s3,0x7
     1b4:	26912223          	sw	s1,612(sp)
     1b8:	27212023          	sw	s2,608(sp)
     1bc:	00050493          	mv	s1,a0
     1c0:	00058913          	mv	s2,a1
     1c4:	00100613          	li	a2,1
     1c8:	4f498593          	addi	a1,s3,1268 # 74f4 <str.2779+0xa18>
     1cc:	02410513          	addi	a0,sp,36
     1d0:	26112623          	sw	ra,620(sp)
     1d4:	26812423          	sw	s0,616(sp)
     1d8:	25412c23          	sw	s4,600(sp)
     1dc:	454050ef          	jal	ra,5630 <f_mount>
     1e0:	02051e63          	bnez	a0,21c <copy_file_from_sdcard_to_ram+0x74>
     1e4:	00100613          	li	a2,1
     1e8:	00048593          	mv	a1,s1
     1ec:	00410513          	addi	a0,sp,4
     1f0:	4c8050ef          	jal	ra,56b8 <f_open>
     1f4:	00050413          	mv	s0,a0
     1f8:	02050663          	beqz	a0,224 <copy_file_from_sdcard_to_ram+0x7c>
     1fc:	00007537          	lui	a0,0x7
     200:	00048593          	mv	a1,s1
     204:	8f050513          	addi	a0,a0,-1808 # 68f0 <_frodata>
     208:	2d0020ef          	jal	ra,24d8 <printf>
     20c:	00000613          	li	a2,0
     210:	4f498593          	addi	a1,s3,1268
     214:	00000513          	li	a0,0
     218:	418050ef          	jal	ra,5630 <f_mount>
     21c:	00000513          	li	a0,0
     220:	0ac0006f          	j	2cc <copy_file_from_sdcard_to_ram+0x124>
     224:	00098a13          	mv	s4,s3
     228:	01012983          	lw	s3,16(sp)
     22c:	00007537          	lui	a0,0x7
     230:	00090613          	mv	a2,s2
     234:	00098693          	mv	a3,s3
     238:	00048593          	mv	a1,s1
     23c:	90450513          	addi	a0,a0,-1788 # 6904 <_frodata+0x14>
     240:	298020ef          	jal	ra,24d8 <printf>
     244:	00098513          	mv	a0,s3
     248:	554030ef          	jal	ra,379c <init_progression_bar>
     24c:	00010693          	mv	a3,sp
     250:	00008637          	lui	a2,0x8
     254:	008905b3          	add	a1,s2,s0
     258:	00410513          	addi	a0,sp,4
     25c:	54c050ef          	jal	ra,57a8 <f_read>
     260:	02050263          	beqz	a0,284 <copy_file_from_sdcard_to_ram+0xdc>
     264:	00007537          	lui	a0,0x7
     268:	92c50513          	addi	a0,a0,-1748 # 692c <_frodata+0x3c>
     26c:	26c020ef          	jal	ra,24d8 <printf>
     270:	00410513          	addi	a0,sp,4
     274:	748050ef          	jal	ra,59bc <f_close>
     278:	00000613          	li	a2,0
     27c:	4f4a0593          	addi	a1,s4,1268
     280:	f95ff06f          	j	214 <copy_file_from_sdcard_to_ram+0x6c>
     284:	00012783          	lw	a5,0(sp)
     288:	00078a63          	beqz	a5,29c <copy_file_from_sdcard_to_ram+0xf4>
     28c:	00f40433          	add	s0,s0,a5
     290:	00040513          	mv	a0,s0
     294:	3f4030ef          	jal	ra,3688 <show_progress>
     298:	fb5ff06f          	j	24c <copy_file_from_sdcard_to_ram+0xa4>
     29c:	00040513          	mv	a0,s0
     2a0:	3e8030ef          	jal	ra,3688 <show_progress>
     2a4:	00008537          	lui	a0,0x8
     2a8:	0d050513          	addi	a0,a0,208 # 80d0 <crc_table+0x644>
     2ac:	22c020ef          	jal	ra,24d8 <printf>
     2b0:	00410513          	addi	a0,sp,4
     2b4:	708050ef          	jal	ra,59bc <f_close>
     2b8:	00000613          	li	a2,0
     2bc:	4f4a0593          	addi	a1,s4,1268
     2c0:	00000513          	li	a0,0
     2c4:	36c050ef          	jal	ra,5630 <f_mount>
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
     344:	001f0f13          	addi	t5,t5,1 # 4001001 <_edata_rom+0x3ff8825>
     348:	05e00493          	li	s1,94
     34c:	441f8f93          	addi	t6,t6,1089 # 1440441 <_edata_rom+0x1437c65>
     350:	00900913          	li	s2,9
     354:	00500993          	li	s3,5
     358:	01328293          	addi	t0,t0,19 # 800013 <_edata_rom+0x7f7837>
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
     7f4:	00007537          	lui	a0,0x7
     7f8:	00912a23          	sw	s1,20(sp)
     7fc:	94050513          	addi	a0,a0,-1728 # 6940 <_frodata+0x50>
     800:	00058493          	mv	s1,a1
     804:	00068593          	mv	a1,a3
     808:	00112e23          	sw	ra,28(sp)
     80c:	00c12623          	sw	a2,12(sp)
     810:	00d12423          	sw	a3,8(sp)
     814:	4c5010ef          	jal	ra,24d8 <printf>
     818:	00007537          	lui	a0,0x7
     81c:	96850513          	addi	a0,a0,-1688 # 6968 <_frodata+0x78>
     820:	4b9010ef          	jal	ra,24d8 <printf>
     824:	2cd030ef          	jal	ra,42f0 <uart_sync>
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
     850:	5a5020ef          	jal	ra,35f4 <flush_l2_cache>
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
     8a4:	000079b7          	lui	s3,0x7
     8a8:	f0010113          	addi	sp,sp,-256
     8ac:	00100613          	li	a2,1
     8b0:	4f498593          	addi	a1,s3,1268 # 74f4 <str.2779+0xa18>
     8b4:	28410513          	addi	a0,sp,644
     8b8:	579040ef          	jal	ra,5630 <f_mount>
     8bc:	04051e63          	bnez	a0,918 <sdcardboot_from_json.constprop.0+0xac>
     8c0:	000017b7          	lui	a5,0x1
     8c4:	01010713          	addi	a4,sp,16
     8c8:	fffff437          	lui	s0,0xfffff
     8cc:	8a078793          	addi	a5,a5,-1888 # 8a0 <sdcardboot_from_json.constprop.0+0x34>
     8d0:	00e787b3          	add	a5,a5,a4
     8d4:	77440913          	addi	s2,s0,1908 # fffff774 <_fstack+0xefffe774>
     8d8:	01278933          	add	s2,a5,s2
     8dc:	00007a37          	lui	s4,0x7
     8e0:	00100613          	li	a2,1
     8e4:	99ca0593          	addi	a1,s4,-1636 # 699c <_frodata+0xac>
     8e8:	00090513          	mv	a0,s2
     8ec:	5cd040ef          	jal	ra,56b8 <f_open>
     8f0:	00050493          	mv	s1,a0
     8f4:	06050263          	beqz	a0,958 <sdcardboot_from_json.constprop.0+0xec>
     8f8:	00007537          	lui	a0,0x7
     8fc:	99ca0593          	addi	a1,s4,-1636
     900:	8f050513          	addi	a0,a0,-1808 # 68f0 <_frodata>
     904:	3d5010ef          	jal	ra,24d8 <printf>
     908:	00000613          	li	a2,0
     90c:	4f498593          	addi	a1,s3,1268
     910:	00000513          	li	a0,0
     914:	51d040ef          	jal	ra,5630 <f_mount>
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
     97c:	62d040ef          	jal	ra,57a8 <f_read>
     980:	00090513          	mv	a0,s2
     984:	038050ef          	jal	ra,59bc <f_close>
     988:	4f498593          	addi	a1,s3,1268
     98c:	00000613          	li	a2,0
     990:	00000513          	li	a0,0
     994:	49d040ef          	jal	ra,5630 <f_mount>
     998:	fff00793          	li	a5,-1
     99c:	4b010513          	addi	a0,sp,1200
     9a0:	02f12023          	sw	a5,32(sp)
     9a4:	00012c23          	sw	zero,24(sp)
     9a8:	00012e23          	sw	zero,28(sp)
     9ac:	0dd010ef          	jal	ra,2288 <strlen>
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
     a3c:	00007db7          	lui	s11,0x7
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
     a6c:	7e0010ef          	jal	ra,224c <memset>
     a70:	02000613          	li	a2,32
     a74:	00000593          	li	a1,0
     a78:	00090513          	mv	a0,s2
     a7c:	7d0010ef          	jal	ra,224c <memset>
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
     ac0:	768010ef          	jal	ra,2228 <memcpy>
     ac4:	8b010793          	addi	a5,sp,-1872
     ac8:	00499713          	slli	a4,s3,0x4
     acc:	00e78733          	add	a4,a5,a4
     ad0:	7d872583          	lw	a1,2008(a4)
     ad4:	7dc72603          	lw	a2,2012(a4)
     ad8:	4b010793          	addi	a5,sp,1200
     adc:	00090513          	mv	a0,s2
     ae0:	40b60633          	sub	a2,a2,a1
     ae4:	00b785b3          	add	a1,a5,a1
     ae8:	740010ef          	jal	ra,2228 <memcpy>
     aec:	000077b7          	lui	a5,0x7
     af0:	00800613          	li	a2,8
     af4:	9a878593          	addi	a1,a5,-1624 # 69a8 <_frodata+0xb8>
     af8:	00040513          	mv	a0,s0
     afc:	091010ef          	jal	ra,238c <strncmp>
     b00:	02050863          	beqz	a0,b30 <sdcardboot_from_json.constprop.0+0x2c4>
     b04:	00400613          	li	a2,4
     b08:	9b4d8593          	addi	a1,s11,-1612 # 69b4 <_frodata+0xc4>
     b0c:	00040513          	mv	a0,s0
     b10:	07d010ef          	jal	ra,238c <strncmp>
     b14:	02051263          	bnez	a0,b38 <sdcardboot_from_json.constprop.0+0x2cc>
     b18:	00000613          	li	a2,0
     b1c:	00000593          	li	a1,0
     b20:	00090513          	mv	a0,s2
     b24:	279010ef          	jal	ra,259c <strtoul>
     b28:	00050493          	mv	s1,a0
     b2c:	00100c13          	li	s8,1
     b30:	0ff9f993          	andi	s3,s3,255
     b34:	f0dff06f          	j	a40 <sdcardboot_from_json.constprop.0+0x1d4>
     b38:	000075b7          	lui	a1,0x7
     b3c:	00200613          	li	a2,2
     b40:	9bc58593          	addi	a1,a1,-1604 # 69bc <_frodata+0xcc>
     b44:	00040513          	mv	a0,s0
     b48:	045010ef          	jal	ra,238c <strncmp>
     b4c:	02051c63          	bnez	a0,b84 <sdcardboot_from_json.constprop.0+0x318>
     b50:	7d8d2583          	lw	a1,2008(s10)
     b54:	7dcd2603          	lw	a2,2012(s10)
     b58:	4b010793          	addi	a5,sp,1200
     b5c:	00040513          	mv	a0,s0
     b60:	40b60633          	sub	a2,a2,a1
     b64:	00b785b3          	add	a1,a5,a1
     b68:	6c0010ef          	jal	ra,2228 <memcpy>
     b6c:	00000613          	li	a2,0
     b70:	00000593          	li	a1,0
     b74:	00090513          	mv	a0,s2
     b78:	225010ef          	jal	ra,259c <strtoul>
     b7c:	00050a13          	mv	s4,a0
     b80:	fb1ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>
     b84:	000075b7          	lui	a1,0x7
     b88:	00200613          	li	a2,2
     b8c:	9c058593          	addi	a1,a1,-1600 # 69c0 <_frodata+0xd0>
     b90:	00040513          	mv	a0,s0
     b94:	7f8010ef          	jal	ra,238c <strncmp>
     b98:	00051e63          	bnez	a0,bb4 <sdcardboot_from_json.constprop.0+0x348>
     b9c:	00000613          	li	a2,0
     ba0:	00000593          	li	a1,0
     ba4:	00090513          	mv	a0,s2
     ba8:	1f5010ef          	jal	ra,259c <strtoul>
     bac:	00050a93          	mv	s5,a0
     bb0:	f81ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>
     bb4:	000075b7          	lui	a1,0x7
     bb8:	00200613          	li	a2,2
     bbc:	9c458593          	addi	a1,a1,-1596 # 69c4 <_frodata+0xd4>
     bc0:	00040513          	mv	a0,s0
     bc4:	7c8010ef          	jal	ra,238c <strncmp>
     bc8:	00000613          	li	a2,0
     bcc:	00000593          	li	a1,0
     bd0:	00051a63          	bnez	a0,be4 <sdcardboot_from_json.constprop.0+0x378>
     bd4:	00090513          	mv	a0,s2
     bd8:	1c5010ef          	jal	ra,259c <strtoul>
     bdc:	00050b13          	mv	s6,a0
     be0:	f51ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>
     be4:	00090513          	mv	a0,s2
     be8:	1b5010ef          	jal	ra,259c <strtoul>
     bec:	00050593          	mv	a1,a0
     bf0:	00040513          	mv	a0,s0
     bf4:	db4ff0ef          	jal	ra,1a8 <copy_file_from_sdcard_to_ram>
     bf8:	d20500e3          	beqz	a0,918 <sdcardboot_from_json.constprop.0+0xac>
     bfc:	000c0b93          	mv	s7,s8
     c00:	f20c18e3          	bnez	s8,b30 <sdcardboot_from_json.constprop.0+0x2c4>
     c04:	00000613          	li	a2,0
     c08:	00000593          	li	a1,0
     c0c:	00090513          	mv	a0,s2
     c10:	18d010ef          	jal	ra,259c <strtoul>
     c14:	00050493          	mv	s1,a0
     c18:	00100b93          	li	s7,1
     c1c:	f15ff06f          	j	b30 <sdcardboot_from_json.constprop.0+0x2c4>

00000c20 <serialboot>:
     c20:	00007537          	lui	a0,0x7
     c24:	ec010113          	addi	sp,sp,-320
     c28:	9c850513          	addi	a0,a0,-1592 # 69c8 <_frodata+0xd8>
     c2c:	12112e23          	sw	ra,316(sp)
     c30:	12812c23          	sw	s0,312(sp)
     c34:	13212823          	sw	s2,304(sp)
     c38:	12912a23          	sw	s1,308(sp)
     c3c:	13312623          	sw	s3,300(sp)
     c40:	13412423          	sw	s4,296(sp)
     c44:	13512223          	sw	s5,292(sp)
     c48:	13612023          	sw	s6,288(sp)
     c4c:	11712e23          	sw	s7,284(sp)
     c50:	089010ef          	jal	ra,24d8 <printf>
     c54:	00007537          	lui	a0,0x7
     c58:	9e050513          	addi	a0,a0,-1568 # 69e0 <_frodata+0xf0>
     c5c:	07d010ef          	jal	ra,24d8 <printf>
     c60:	000077b7          	lui	a5,0x7
     c64:	acc78413          	addi	s0,a5,-1332 # 6acc <str.2792>
     c68:	acc78913          	addi	s2,a5,-1332
     c6c:	00044503          	lbu	a0,0(s0)
     c70:	04051a63          	bnez	a0,cc4 <serialboot+0xa4>
     c74:	f00027b7          	lui	a5,0xf0002
     c78:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
     c7c:	00bec737          	lui	a4,0xbec
     c80:	8007a223          	sw	zero,-2044(a5)
     c84:	c2070713          	addi	a4,a4,-992 # bebc20 <_edata_rom+0xbe3444>
     c88:	80e7a023          	sw	a4,-2048(a5)
     c8c:	00100713          	li	a4,1
     c90:	80e7a423          	sw	a4,-2040(a5)
     c94:	80e7a623          	sw	a4,-2036(a5)
     c98:	00000413          	li	s0,0
     c9c:	f00024b7          	lui	s1,0xf0002
     ca0:	05100993          	li	s3,81
     ca4:	01b00a13          	li	s4,27
     ca8:	00e00a93          	li	s5,14
     cac:	00100b13          	li	s6,1
     cb0:	8104a783          	lw	a5,-2032(s1) # f0001810 <_fstack+0xe0000810>
     cb4:	00079e63          	bnez	a5,cd0 <serialboot+0xb0>
     cb8:	00007537          	lui	a0,0x7
     cbc:	a3450513          	addi	a0,a0,-1484 # 6a34 <_frodata+0x144>
     cc0:	1480006f          	j	e08 <serialboot+0x1e8>
     cc4:	51c030ef          	jal	ra,41e0 <uart_write>
     cc8:	00140413          	addi	s0,s0,1
     ccc:	fa1ff06f          	j	c6c <serialboot+0x4c>
     cd0:	4f4030ef          	jal	ra,41c4 <uart_read_nonblock>
     cd4:	08050c63          	beqz	a0,d6c <serialboot+0x14c>
     cd8:	498030ef          	jal	ra,4170 <uart_read>
     cdc:	23350063          	beq	a0,s3,efc <serialboot+0x2dc>
     ce0:	21450e63          	beq	a0,s4,efc <serialboot+0x2dc>
     ce4:	008907b3          	add	a5,s2,s0
     ce8:	0107c783          	lbu	a5,16(a5)
     cec:	06a79c63          	bne	a5,a0,d64 <serialboot+0x144>
     cf0:	00140413          	addi	s0,s0,1
     cf4:	07541c63          	bne	s0,s5,d6c <serialboot+0x14c>
     cf8:	00beca37          	lui	s4,0xbec
     cfc:	00000493          	li	s1,0
     d00:	00100993          	li	s3,1
     d04:	f0002937          	lui	s2,0xf0002
     d08:	c20a0a13          	addi	s4,s4,-992 # bebc20 <_edata_rom+0xbe3444>
     d0c:	00100a93          	li	s5,1
     d10:	00000413          	li	s0,0
     d14:	00200b13          	li	s6,2
     d18:	00300b93          	li	s7,3
     d1c:	4a8030ef          	jal	ra,41c4 <uart_read_nonblock>
     d20:	02050463          	beqz	a0,d48 <serialboot+0x128>
     d24:	04041863          	bnez	s0,d74 <serialboot+0x154>
     d28:	80092423          	sw	zero,-2040(s2) # f0001808 <_fstack+0xe0000808>
     d2c:	80092223          	sw	zero,-2044(s2)
     d30:	81492023          	sw	s4,-2048(s2)
     d34:	81392423          	sw	s3,-2040(s2)
     d38:	81392623          	sw	s3,-2036(s2)
     d3c:	434030ef          	jal	ra,4170 <uart_read>
     d40:	00a10623          	sb	a0,12(sp)
     d44:	00140413          	addi	s0,s0,1
     d48:	81392623          	sw	s3,-2036(s2)
     d4c:	fc0408e3          	beqz	s0,d1c <serialboot+0xfc>
     d50:	81092783          	lw	a5,-2032(s2)
     d54:	fc0794e3          	bnez	a5,d1c <serialboot+0xfc>
     d58:	04500513          	li	a0,69
     d5c:	484030ef          	jal	ra,41e0 <uart_write>
     d60:	fb1ff06f          	j	d10 <serialboot+0xf0>
     d64:	f8650513          	addi	a0,a0,-122
     d68:	00153413          	seqz	s0,a0
     d6c:	8164a623          	sw	s6,-2036(s1)
     d70:	f41ff06f          	j	cb0 <serialboot+0x90>
     d74:	01340a63          	beq	s0,s3,d88 <serialboot+0x168>
     d78:	01641e63          	bne	s0,s6,d94 <serialboot+0x174>
     d7c:	3f4030ef          	jal	ra,4170 <uart_read>
     d80:	00a10723          	sb	a0,14(sp)
     d84:	fc1ff06f          	j	d44 <serialboot+0x124>
     d88:	3e8030ef          	jal	ra,4170 <uart_read>
     d8c:	00a106a3          	sb	a0,13(sp)
     d90:	fb5ff06f          	j	d44 <serialboot+0x124>
     d94:	07740e63          	beq	s0,s7,e10 <serialboot+0x1f0>
     d98:	fa8bd6e3          	bge	s7,s0,d44 <serialboot+0x124>
     d9c:	3d4030ef          	jal	ra,4170 <uart_read>
     da0:	00c14583          	lbu	a1,12(sp)
     da4:	11010793          	addi	a5,sp,272
     da8:	008787b3          	add	a5,a5,s0
     dac:	eea78e23          	sb	a0,-260(a5)
     db0:	00358793          	addi	a5,a1,3
     db4:	f88798e3          	bne	a5,s0,d44 <serialboot+0x124>
     db8:	00e14783          	lbu	a5,14(sp)
     dbc:	00d14703          	lbu	a4,13(sp)
     dc0:	00158593          	addi	a1,a1,1
     dc4:	00879793          	slli	a5,a5,0x8
     dc8:	00e7e7b3          	or	a5,a5,a4
     dcc:	00879413          	slli	s0,a5,0x8
     dd0:	0087d793          	srli	a5,a5,0x8
     dd4:	00f467b3          	or	a5,s0,a5
     dd8:	01079413          	slli	s0,a5,0x10
     ddc:	00f10513          	addi	a0,sp,15
     de0:	01045413          	srli	s0,s0,0x10
     de4:	640020ef          	jal	ra,3424 <crc16>
     de8:	02850a63          	beq	a0,s0,e1c <serialboot+0x1fc>
     dec:	04300513          	li	a0,67
     df0:	3f0030ef          	jal	ra,41e0 <uart_write>
     df4:	00148493          	addi	s1,s1,1
     df8:	10000793          	li	a5,256
     dfc:	f0f49ae3          	bne	s1,a5,d10 <serialboot+0xf0>
     e00:	00007537          	lui	a0,0x7
     e04:	a0c50513          	addi	a0,a0,-1524 # 6a0c <_frodata+0x11c>
     e08:	6d0010ef          	jal	ra,24d8 <printf>
     e0c:	0280006f          	j	e34 <serialboot+0x214>
     e10:	360030ef          	jal	ra,4170 <uart_read>
     e14:	00a107a3          	sb	a0,15(sp)
     e18:	f2dff06f          	j	d44 <serialboot+0x124>
     e1c:	00f14783          	lbu	a5,15(sp)
     e20:	05578263          	beq	a5,s5,e64 <serialboot+0x244>
     e24:	09678463          	beq	a5,s6,eac <serialboot+0x28c>
     e28:	0c079263          	bnez	a5,eec <serialboot+0x2cc>
     e2c:	04b00513          	li	a0,75
     e30:	3b0030ef          	jal	ra,41e0 <uart_write>
     e34:	00100513          	li	a0,1
     e38:	13c12083          	lw	ra,316(sp)
     e3c:	13812403          	lw	s0,312(sp)
     e40:	13412483          	lw	s1,308(sp)
     e44:	13012903          	lw	s2,304(sp)
     e48:	12c12983          	lw	s3,300(sp)
     e4c:	12812a03          	lw	s4,296(sp)
     e50:	12412a83          	lw	s5,292(sp)
     e54:	12012b03          	lw	s6,288(sp)
     e58:	11c12b83          	lw	s7,284(sp)
     e5c:	14010113          	addi	sp,sp,320
     e60:	00008067          	ret
     e64:	01014783          	lbu	a5,16(sp)
     e68:	01114503          	lbu	a0,17(sp)
     e6c:	00c14603          	lbu	a2,12(sp)
     e70:	01879793          	slli	a5,a5,0x18
     e74:	01051513          	slli	a0,a0,0x10
     e78:	00a7e7b3          	or	a5,a5,a0
     e7c:	01314503          	lbu	a0,19(sp)
     e80:	ffc60613          	addi	a2,a2,-4 # 7ffc <crc_table+0x570>
     e84:	01410593          	addi	a1,sp,20
     e88:	00a7e7b3          	or	a5,a5,a0
     e8c:	01214503          	lbu	a0,18(sp)
     e90:	00000493          	li	s1,0
     e94:	00851513          	slli	a0,a0,0x8
     e98:	00a7e533          	or	a0,a5,a0
     e9c:	38c010ef          	jal	ra,2228 <memcpy>
     ea0:	04b00513          	li	a0,75
     ea4:	33c030ef          	jal	ra,41e0 <uart_write>
     ea8:	e69ff06f          	j	d10 <serialboot+0xf0>
     eac:	04b00513          	li	a0,75
     eb0:	330030ef          	jal	ra,41e0 <uart_write>
     eb4:	01014783          	lbu	a5,16(sp)
     eb8:	01114683          	lbu	a3,17(sp)
     ebc:	00000613          	li	a2,0
     ec0:	01879793          	slli	a5,a5,0x18
     ec4:	01069693          	slli	a3,a3,0x10
     ec8:	00d7e7b3          	or	a5,a5,a3
     ecc:	01314683          	lbu	a3,19(sp)
     ed0:	00000593          	li	a1,0
     ed4:	00000513          	li	a0,0
     ed8:	00d7e7b3          	or	a5,a5,a3
     edc:	01214683          	lbu	a3,18(sp)
     ee0:	00869693          	slli	a3,a3,0x8
     ee4:	00d7e6b3          	or	a3,a5,a3
     ee8:	901ff0ef          	jal	ra,7e8 <boot>
     eec:	05500513          	li	a0,85
     ef0:	00148493          	addi	s1,s1,1
     ef4:	2ec030ef          	jal	ra,41e0 <uart_write>
     ef8:	f01ff06f          	j	df8 <serialboot+0x1d8>
     efc:	00007537          	lui	a0,0x7
     f00:	a4050513          	addi	a0,a0,-1472 # 6a40 <_frodata+0x150>
     f04:	5d4010ef          	jal	ra,24d8 <printf>
     f08:	00000513          	li	a0,0
     f0c:	f2dff06f          	j	e38 <serialboot+0x218>

00000f10 <sdcardboot>:
     f10:	00007537          	lui	a0,0x7
     f14:	ff010113          	addi	sp,sp,-16
     f18:	a4c50513          	addi	a0,a0,-1460 # 6a4c <_frodata+0x15c>
     f1c:	00112623          	sw	ra,12(sp)
     f20:	5b8010ef          	jal	ra,24d8 <printf>
     f24:	1b5050ef          	jal	ra,68d8 <fatfs_set_ops_spisdcard>
     f28:	00007537          	lui	a0,0x7
     f2c:	a7050513          	addi	a0,a0,-1424 # 6a70 <_frodata+0x180>
     f30:	5a8010ef          	jal	ra,24d8 <printf>
     f34:	939ff0ef          	jal	ra,86c <sdcardboot_from_json.constprop.0>
     f38:	00007537          	lui	a0,0x7
     f3c:	a8c50513          	addi	a0,a0,-1396 # 6a8c <_frodata+0x19c>
     f40:	598010ef          	jal	ra,24d8 <printf>
     f44:	00007537          	lui	a0,0x7
     f48:	400005b7          	lui	a1,0x40000
     f4c:	aa850513          	addi	a0,a0,-1368 # 6aa8 <_frodata+0x1b8>
     f50:	a58ff0ef          	jal	ra,1a8 <copy_file_from_sdcard_to_ram>
     f54:	00050c63          	beqz	a0,f6c <sdcardboot+0x5c>
     f58:	400006b7          	lui	a3,0x40000
     f5c:	00000613          	li	a2,0
     f60:	00000593          	li	a1,0
     f64:	00000513          	li	a0,0
     f68:	881ff0ef          	jal	ra,7e8 <boot>
     f6c:	00c12083          	lw	ra,12(sp)
     f70:	00007537          	lui	a0,0x7
     f74:	ab450513          	addi	a0,a0,-1356 # 6ab4 <_frodata+0x1c4>
     f78:	01010113          	addi	sp,sp,16
     f7c:	55c0106f          	j	24d8 <printf>

00000f80 <dump_bytes>:
     f80:	fc010113          	addi	sp,sp,-64
     f84:	000087b7          	lui	a5,0x8
     f88:	02912a23          	sw	s1,52(sp)
     f8c:	00058493          	mv	s1,a1
     f90:	6207a583          	lw	a1,1568(a5) # 8620 <stdout>
     f94:	03212823          	sw	s2,48(sp)
     f98:	00050913          	mv	s2,a0
     f9c:	00007537          	lui	a0,0x7
     fa0:	aec50513          	addi	a0,a0,-1300 # 6aec <str.2779+0x10>
     fa4:	03312623          	sw	s3,44(sp)
     fa8:	03412423          	sw	s4,40(sp)
     fac:	03512223          	sw	s5,36(sp)
     fb0:	03612023          	sw	s6,32(sp)
     fb4:	01712e23          	sw	s7,28(sp)
     fb8:	02112e23          	sw	ra,60(sp)
     fbc:	02812c23          	sw	s0,56(sp)
     fc0:	01812c23          	sw	s8,24(sp)
     fc4:	01912a23          	sw	s9,20(sp)
     fc8:	00060993          	mv	s3,a2
     fcc:	00007ab7          	lui	s5,0x7
     fd0:	498010ef          	jal	ra,2468 <fputs>
     fd4:	00007a37          	lui	s4,0x7
     fd8:	00007b37          	lui	s6,0x7
     fdc:	00007bb7          	lui	s7,0x7
     fe0:	04904063          	bgtz	s1,1020 <dump_bytes+0xa0>
     fe4:	03812403          	lw	s0,56(sp)
     fe8:	03c12083          	lw	ra,60(sp)
     fec:	03412483          	lw	s1,52(sp)
     ff0:	03012903          	lw	s2,48(sp)
     ff4:	02c12983          	lw	s3,44(sp)
     ff8:	02812a03          	lw	s4,40(sp)
     ffc:	02412a83          	lw	s5,36(sp)
    1000:	02012b03          	lw	s6,32(sp)
    1004:	01c12b83          	lw	s7,28(sp)
    1008:	01812c03          	lw	s8,24(sp)
    100c:	01412c83          	lw	s9,20(sp)
    1010:	00008537          	lui	a0,0x8
    1014:	0d050513          	addi	a0,a0,208 # 80d0 <crc_table+0x644>
    1018:	04010113          	addi	sp,sp,64
    101c:	4bc0106f          	j	24d8 <printf>
    1020:	01000793          	li	a5,16
    1024:	00048413          	mv	s0,s1
    1028:	0097d463          	bge	a5,s1,1030 <dump_bytes+0xb0>
    102c:	01000413          	li	s0,16
    1030:	00000793          	li	a5,0
    1034:	00f906b3          	add	a3,s2,a5
    1038:	0006a683          	lw	a3,0(a3) # 40000000 <_fstack+0x2ffff000>
    103c:	00f10733          	add	a4,sp,a5
    1040:	00478793          	addi	a5,a5,4
    1044:	00d72023          	sw	a3,0(a4)
    1048:	fe87c6e3          	blt	a5,s0,1034 <dump_bytes+0xb4>
    104c:	fff40793          	addi	a5,s0,-1
    1050:	ffc7f793          	andi	a5,a5,-4
    1054:	00007537          	lui	a0,0x7
    1058:	00478793          	addi	a5,a5,4
    105c:	00098593          	mv	a1,s3
    1060:	afc50513          	addi	a0,a0,-1284 # 6afc <str.2779+0x20>
    1064:	00f90933          	add	s2,s2,a5
    1068:	00000c13          	li	s8,0
    106c:	46c010ef          	jal	ra,24d8 <printf>
    1070:	00007cb7          	lui	s9,0x7
    1074:	018107b3          	add	a5,sp,s8
    1078:	0007c583          	lbu	a1,0(a5)
    107c:	b08c8513          	addi	a0,s9,-1272 # 6b08 <str.2779+0x2c>
    1080:	001c0c13          	addi	s8,s8,1
    1084:	454010ef          	jal	ra,24d8 <printf>
    1088:	ff8416e3          	bne	s0,s8,1074 <dump_bytes+0xf4>
    108c:	00040c13          	mv	s8,s0
    1090:	01000c93          	li	s9,16
    1094:	059c1863          	bne	s8,s9,10e4 <dump_bytes+0x164>
    1098:	508a0513          	addi	a0,s4,1288 # 7508 <str.2779+0xa2c>
    109c:	43c010ef          	jal	ra,24d8 <printf>
    10a0:	00000c13          	li	s8,0
    10a4:	05e00c93          	li	s9,94
    10a8:	018107b3          	add	a5,sp,s8
    10ac:	0007c583          	lbu	a1,0(a5)
    10b0:	fe058793          	addi	a5,a1,-32 # 3fffffe0 <_fstack+0x2fffefe0>
    10b4:	0ff7f793          	andi	a5,a5,255
    10b8:	02fcfe63          	bgeu	s9,a5,10f4 <dump_bytes+0x174>
    10bc:	b14b8513          	addi	a0,s7,-1260 # 6b14 <str.2779+0x38>
    10c0:	418010ef          	jal	ra,24d8 <printf>
    10c4:	001c0c13          	addi	s8,s8,1
    10c8:	ff8410e3          	bne	s0,s8,10a8 <dump_bytes+0x128>
    10cc:	00040c13          	mv	s8,s0
    10d0:	01000c93          	li	s9,16
    10d4:	039c1663          	bne	s8,s9,1100 <dump_bytes+0x180>
    10d8:	408484b3          	sub	s1,s1,s0
    10dc:	008989b3          	add	s3,s3,s0
    10e0:	f01ff06f          	j	fe0 <dump_bytes+0x60>
    10e4:	b10a8513          	addi	a0,s5,-1264 # 6b10 <str.2779+0x34>
    10e8:	3f0010ef          	jal	ra,24d8 <printf>
    10ec:	001c0c13          	addi	s8,s8,1
    10f0:	fa5ff06f          	j	1094 <dump_bytes+0x114>
    10f4:	b18b0513          	addi	a0,s6,-1256 # 6b18 <str.2779+0x3c>
    10f8:	3e0010ef          	jal	ra,24d8 <printf>
    10fc:	fc9ff06f          	j	10c4 <dump_bytes+0x144>
    1100:	508a0513          	addi	a0,s4,1288
    1104:	3d4010ef          	jal	ra,24d8 <printf>
    1108:	001c0c13          	addi	s8,s8,1
    110c:	fc9ff06f          	j	10d4 <dump_bytes+0x154>

00001110 <crcbios>:
    1110:	ff010113          	addi	sp,sp,-16
    1114:	000085b7          	lui	a1,0x8
    1118:	00812423          	sw	s0,8(sp)
    111c:	00000793          	li	a5,0
    1120:	7dc5a403          	lw	s0,2012(a1) # 87dc <_edata_rom>
    1124:	7dc58593          	addi	a1,a1,2012
    1128:	40f585b3          	sub	a1,a1,a5
    112c:	00000513          	li	a0,0
    1130:	00112623          	sw	ra,12(sp)
    1134:	340020ef          	jal	ra,3474 <crc32>
    1138:	02a41063          	bne	s0,a0,1158 <crcbios+0x48>
    113c:	00040593          	mv	a1,s0
    1140:	00812403          	lw	s0,8(sp)
    1144:	00c12083          	lw	ra,12(sp)
    1148:	00007537          	lui	a0,0x7
    114c:	b1c50513          	addi	a0,a0,-1252 # 6b1c <str.2779+0x40>
    1150:	01010113          	addi	sp,sp,16
    1154:	3840106f          	j	24d8 <printf>
    1158:	00050613          	mv	a2,a0
    115c:	00007537          	lui	a0,0x7
    1160:	00040593          	mv	a1,s0
    1164:	b3850513          	addi	a0,a0,-1224 # 6b38 <str.2779+0x5c>
    1168:	370010ef          	jal	ra,24d8 <printf>
    116c:	00812403          	lw	s0,8(sp)
    1170:	00c12083          	lw	ra,12(sp)
    1174:	00007537          	lui	a0,0x7
    1178:	b6450513          	addi	a0,a0,-1180 # 6b64 <str.2779+0x88>
    117c:	01010113          	addi	sp,sp,16
    1180:	3580106f          	j	24d8 <printf>

00001184 <get_param>:
    1184:	00060793          	mv	a5,a2
    1188:	02060713          	addi	a4,a2,32
    118c:	0007a023          	sw	zero,0(a5)
    1190:	00478793          	addi	a5,a5,4
    1194:	fee79ce3          	bne	a5,a4,118c <get_param+0x8>
    1198:	00a5a023          	sw	a0,0(a1)
    119c:	02000713          	li	a4,32
    11a0:	00054783          	lbu	a5,0(a0)
    11a4:	04e78e63          	beq	a5,a4,1200 <get_param+0x7c>
    11a8:	00079663          	bnez	a5,11b4 <get_param+0x30>
    11ac:	00000513          	li	a0,0
    11b0:	00008067          	ret
    11b4:	00150513          	addi	a0,a0,1
    11b8:	fe9ff06f          	j	11a0 <get_param+0x1c>
    11bc:	00178793          	addi	a5,a5,1
    11c0:	02c0006f          	j	11ec <get_param+0x68>
    11c4:	00078023          	sb	zero,0(a5)
    11c8:	00068513          	mv	a0,a3
    11cc:	00178793          	addi	a5,a5,1
    11d0:	0007c683          	lbu	a3,0(a5)
    11d4:	fee68ce3          	beq	a3,a4,11cc <get_param+0x48>
    11d8:	02068e63          	beqz	a3,1214 <get_param+0x90>
    11dc:	00150693          	addi	a3,a0,1
    11e0:	00251513          	slli	a0,a0,0x2
    11e4:	00a60533          	add	a0,a2,a0
    11e8:	00f52023          	sw	a5,0(a0)
    11ec:	0007c583          	lbu	a1,0(a5)
    11f0:	fce58ae3          	beq	a1,a4,11c4 <get_param+0x40>
    11f4:	fc0594e3          	bnez	a1,11bc <get_param+0x38>
    11f8:	00068513          	mv	a0,a3
    11fc:	00008067          	ret
    1200:	00150793          	addi	a5,a0,1
    1204:	00050023          	sb	zero,0(a0)
    1208:	02000713          	li	a4,32
    120c:	00000513          	li	a0,0
    1210:	fc1ff06f          	j	11d0 <get_param+0x4c>
    1214:	00008067          	ret

00001218 <command_dispatcher>:
    1218:	fe010113          	addi	sp,sp,-32
    121c:	00812c23          	sw	s0,24(sp)
    1220:	00912a23          	sw	s1,20(sp)
    1224:	00008437          	lui	s0,0x8
    1228:	000084b7          	lui	s1,0x8
    122c:	01212823          	sw	s2,16(sp)
    1230:	01312623          	sw	s3,12(sp)
    1234:	01412423          	sw	s4,8(sp)
    1238:	00112e23          	sw	ra,28(sp)
    123c:	00050913          	mv	s2,a0
    1240:	00058993          	mv	s3,a1
    1244:	00060a13          	mv	s4,a2
    1248:	62440413          	addi	s0,s0,1572 # 8624 <__bios_cmd_leds>
    124c:	67448493          	addi	s1,s1,1652 # 8674 <_fdata_rom>
    1250:	00941663          	bne	s0,s1,125c <command_dispatcher+0x44>
    1254:	00000513          	li	a0,0
    1258:	0300006f          	j	1288 <command_dispatcher+0x70>
    125c:	00042783          	lw	a5,0(s0)
    1260:	00090513          	mv	a0,s2
    1264:	0047a583          	lw	a1,4(a5)
    1268:	000010ef          	jal	ra,2268 <strcmp>
    126c:	02051e63          	bnez	a0,12a8 <command_dispatcher+0x90>
    1270:	00042783          	lw	a5,0(s0)
    1274:	00098513          	mv	a0,s3
    1278:	000a0593          	mv	a1,s4
    127c:	0007a783          	lw	a5,0(a5)
    1280:	000780e7          	jalr	a5
    1284:	00042503          	lw	a0,0(s0)
    1288:	01c12083          	lw	ra,28(sp)
    128c:	01812403          	lw	s0,24(sp)
    1290:	01412483          	lw	s1,20(sp)
    1294:	01012903          	lw	s2,16(sp)
    1298:	00c12983          	lw	s3,12(sp)
    129c:	00812a03          	lw	s4,8(sp)
    12a0:	02010113          	addi	sp,sp,32
    12a4:	00008067          	ret
    12a8:	00440413          	addi	s0,s0,4
    12ac:	fa5ff06f          	j	1250 <command_dispatcher+0x38>

000012b0 <init_dispatcher>:
    12b0:	ff010113          	addi	sp,sp,-16
    12b4:	00812423          	sw	s0,8(sp)
    12b8:	00912223          	sw	s1,4(sp)
    12bc:	00008437          	lui	s0,0x8
    12c0:	000084b7          	lui	s1,0x8
    12c4:	00112623          	sw	ra,12(sp)
    12c8:	67440413          	addi	s0,s0,1652 # 8674 <_fdata_rom>
    12cc:	67448493          	addi	s1,s1,1652 # 8674 <_fdata_rom>
    12d0:	00941c63          	bne	s0,s1,12e8 <init_dispatcher+0x38>
    12d4:	00c12083          	lw	ra,12(sp)
    12d8:	00812403          	lw	s0,8(sp)
    12dc:	00412483          	lw	s1,4(sp)
    12e0:	01010113          	addi	sp,sp,16
    12e4:	00008067          	ret
    12e8:	00042783          	lw	a5,0(s0)
    12ec:	00440413          	addi	s0,s0,4
    12f0:	000780e7          	jalr	a5
    12f4:	fddff06f          	j	12d0 <init_dispatcher+0x20>

000012f8 <flush_cpu_dcache>:
    12f8:	0000500f          	0x500f
    12fc:	00008067          	ret

00001300 <help_handler>:
    1300:	fe010113          	addi	sp,sp,-32
    1304:	00007537          	lui	a0,0x7
    1308:	01212823          	sw	s2,16(sp)
    130c:	01312623          	sw	s3,12(sp)
    1310:	b9c50513          	addi	a0,a0,-1124 # 6b9c <str.2779+0xc0>
    1314:	00008937          	lui	s2,0x8
    1318:	000079b7          	lui	s3,0x7
    131c:	00912a23          	sw	s1,20(sp)
    1320:	01412423          	sw	s4,8(sp)
    1324:	01512223          	sw	s5,4(sp)
    1328:	01612023          	sw	s6,0(sp)
    132c:	00112e23          	sw	ra,28(sp)
    1330:	00812c23          	sw	s0,24(sp)
    1334:	00000493          	li	s1,0
    1338:	1e8010ef          	jal	ra,2520 <puts>
    133c:	00008a37          	lui	s4,0x8
    1340:	67490913          	addi	s2,s2,1652 # 8674 <_fdata_rom>
    1344:	00007ab7          	lui	s5,0x7
    1348:	b9898993          	addi	s3,s3,-1128 # 6b98 <str.2779+0xbc>
    134c:	00008b37          	lui	s6,0x8
    1350:	00000713          	li	a4,0
    1354:	624a0413          	addi	s0,s4,1572 # 8624 <__bios_cmd_leds>
    1358:	0300006f          	j	1388 <help_handler+0x88>
    135c:	00042783          	lw	a5,0(s0)
    1360:	00c7a683          	lw	a3,12(a5)
    1364:	02969063          	bne	a3,s1,1384 <help_handler+0x84>
    1368:	0087a603          	lw	a2,8(a5)
    136c:	0047a583          	lw	a1,4(a5)
    1370:	00061463          	bnez	a2,1378 <help_handler+0x78>
    1374:	00098613          	mv	a2,s3
    1378:	bc0a8513          	addi	a0,s5,-1088 # 6bc0 <str.2779+0xe4>
    137c:	15c010ef          	jal	ra,24d8 <printf>
    1380:	00100713          	li	a4,1
    1384:	00440413          	addi	s0,s0,4
    1388:	fd241ae3          	bne	s0,s2,135c <help_handler+0x5c>
    138c:	00070663          	beqz	a4,1398 <help_handler+0x98>
    1390:	0d0b0513          	addi	a0,s6,208 # 80d0 <crc_table+0x644>
    1394:	144010ef          	jal	ra,24d8 <printf>
    1398:	00148493          	addi	s1,s1,1
    139c:	00900793          	li	a5,9
    13a0:	faf498e3          	bne	s1,a5,1350 <help_handler+0x50>
    13a4:	01c12083          	lw	ra,28(sp)
    13a8:	01812403          	lw	s0,24(sp)
    13ac:	01412483          	lw	s1,20(sp)
    13b0:	01012903          	lw	s2,16(sp)
    13b4:	00c12983          	lw	s3,12(sp)
    13b8:	00812a03          	lw	s4,8(sp)
    13bc:	00412a83          	lw	s5,4(sp)
    13c0:	00012b03          	lw	s6,0(sp)
    13c4:	02010113          	addi	sp,sp,32
    13c8:	00008067          	ret

000013cc <ident_handler>:
    13cc:	ef010113          	addi	sp,sp,-272
    13d0:	f00017b7          	lui	a5,0xf0001
    13d4:	00010693          	mv	a3,sp
    13d8:	80078713          	addi	a4,a5,-2048 # f0000800 <_fstack+0xdffff800>
    13dc:	10112623          	sw	ra,268(sp)
    13e0:	00068593          	mv	a1,a3
    13e4:	c0078793          	addi	a5,a5,-1024
    13e8:	00072603          	lw	a2,0(a4)
    13ec:	00470713          	addi	a4,a4,4
    13f0:	00168693          	addi	a3,a3,1
    13f4:	fec68fa3          	sb	a2,-1(a3)
    13f8:	fef718e3          	bne	a4,a5,13e8 <ident_handler+0x1c>
    13fc:	00014783          	lbu	a5,0(sp)
    1400:	00079663          	bnez	a5,140c <ident_handler+0x40>
    1404:	000075b7          	lui	a1,0x7
    1408:	b9858593          	addi	a1,a1,-1128 # 6b98 <str.2779+0xbc>
    140c:	00007537          	lui	a0,0x7
    1410:	bcc50513          	addi	a0,a0,-1076 # 6bcc <str.2779+0xf0>
    1414:	0c4010ef          	jal	ra,24d8 <printf>
    1418:	10c12083          	lw	ra,268(sp)
    141c:	11010113          	addi	sp,sp,272
    1420:	00008067          	ret

00001424 <leds_handler>:
    1424:	fe010113          	addi	sp,sp,-32
    1428:	00112e23          	sw	ra,28(sp)
    142c:	00812c23          	sw	s0,24(sp)
    1430:	02a04063          	bgtz	a0,1450 <leds_handler+0x2c>
    1434:	00007537          	lui	a0,0x7
    1438:	bd850513          	addi	a0,a0,-1064 # 6bd8 <str.2779+0xfc>
    143c:	09c010ef          	jal	ra,24d8 <printf>
    1440:	01c12083          	lw	ra,28(sp)
    1444:	01812403          	lw	s0,24(sp)
    1448:	02010113          	addi	sp,sp,32
    144c:	00008067          	ret
    1450:	00058793          	mv	a5,a1
    1454:	0007a503          	lw	a0,0(a5)
    1458:	00000613          	li	a2,0
    145c:	00c10593          	addi	a1,sp,12
    1460:	13c010ef          	jal	ra,259c <strtoul>
    1464:	00c12783          	lw	a5,12(sp)
    1468:	00050413          	mv	s0,a0
    146c:	0007c783          	lbu	a5,0(a5)
    1470:	00078863          	beqz	a5,1480 <leds_handler+0x5c>
    1474:	00007537          	lui	a0,0x7
    1478:	be850513          	addi	a0,a0,-1048 # 6be8 <str.2779+0x10c>
    147c:	fc1ff06f          	j	143c <leds_handler+0x18>
    1480:	00050593          	mv	a1,a0
    1484:	00007537          	lui	a0,0x7
    1488:	bf850513          	addi	a0,a0,-1032 # 6bf8 <str.2779+0x11c>
    148c:	04c010ef          	jal	ra,24d8 <printf>
    1490:	f00027b7          	lui	a5,0xf0002
    1494:	0087a023          	sw	s0,0(a5) # f0002000 <_fstack+0xe0001000>
    1498:	fa9ff06f          	j	1440 <leds_handler+0x1c>

0000149c <crc_handler>:
    149c:	fd010113          	addi	sp,sp,-48
    14a0:	02112623          	sw	ra,44(sp)
    14a4:	02812423          	sw	s0,40(sp)
    14a8:	02912223          	sw	s1,36(sp)
    14ac:	00100793          	li	a5,1
    14b0:	02a7c263          	blt	a5,a0,14d4 <crc_handler+0x38>
    14b4:	00007537          	lui	a0,0x7
    14b8:	c1050513          	addi	a0,a0,-1008 # 6c10 <str.2779+0x134>
    14bc:	01c010ef          	jal	ra,24d8 <printf>
    14c0:	02c12083          	lw	ra,44(sp)
    14c4:	02812403          	lw	s0,40(sp)
    14c8:	02412483          	lw	s1,36(sp)
    14cc:	03010113          	addi	sp,sp,48
    14d0:	00008067          	ret
    14d4:	00058413          	mv	s0,a1
    14d8:	00042503          	lw	a0,0(s0)
    14dc:	00000613          	li	a2,0
    14e0:	01c10593          	addi	a1,sp,28
    14e4:	0b8010ef          	jal	ra,259c <strtoul>
    14e8:	01c12783          	lw	a5,28(sp)
    14ec:	00050493          	mv	s1,a0
    14f0:	0007c783          	lbu	a5,0(a5)
    14f4:	00078863          	beqz	a5,1504 <crc_handler+0x68>
    14f8:	00007537          	lui	a0,0x7
    14fc:	c2850513          	addi	a0,a0,-984 # 6c28 <str.2779+0x14c>
    1500:	fbdff06f          	j	14bc <crc_handler+0x20>
    1504:	00442503          	lw	a0,4(s0)
    1508:	00000613          	li	a2,0
    150c:	01c10593          	addi	a1,sp,28
    1510:	08c010ef          	jal	ra,259c <strtoul>
    1514:	01c12783          	lw	a5,28(sp)
    1518:	0007c783          	lbu	a5,0(a5)
    151c:	00078863          	beqz	a5,152c <crc_handler+0x90>
    1520:	00007537          	lui	a0,0x7
    1524:	c3c50513          	addi	a0,a0,-964 # 6c3c <str.2779+0x160>
    1528:	f95ff06f          	j	14bc <crc_handler+0x20>
    152c:	00a12623          	sw	a0,12(sp)
    1530:	dc9ff0ef          	jal	ra,12f8 <flush_cpu_dcache>
    1534:	0c0020ef          	jal	ra,35f4 <flush_l2_cache>
    1538:	00c12583          	lw	a1,12(sp)
    153c:	00048513          	mv	a0,s1
    1540:	735010ef          	jal	ra,3474 <crc32>
    1544:	00050593          	mv	a1,a0
    1548:	00007537          	lui	a0,0x7
    154c:	c5050513          	addi	a0,a0,-944 # 6c50 <str.2779+0x174>
    1550:	789000ef          	jal	ra,24d8 <printf>
    1554:	f6dff06f          	j	14c0 <crc_handler+0x24>

00001558 <mem_list_handler>:
    1558:	00007537          	lui	a0,0x7
    155c:	ff010113          	addi	sp,sp,-16
    1560:	d3050513          	addi	a0,a0,-720 # 6d30 <str.2779+0x254>
    1564:	00112623          	sw	ra,12(sp)
    1568:	771000ef          	jal	ra,24d8 <printf>
    156c:	00c12083          	lw	ra,12(sp)
    1570:	00007537          	lui	a0,0x7
    1574:	d4c50513          	addi	a0,a0,-692 # 6d4c <str.2779+0x270>
    1578:	01010113          	addi	sp,sp,16
    157c:	7a50006f          	j	2520 <puts>

00001580 <mem_write_handler>:
    1580:	fd010113          	addi	sp,sp,-48
    1584:	02112623          	sw	ra,44(sp)
    1588:	02812423          	sw	s0,40(sp)
    158c:	02912223          	sw	s1,36(sp)
    1590:	03212023          	sw	s2,32(sp)
    1594:	01312e23          	sw	s3,28(sp)
    1598:	01412c23          	sw	s4,24(sp)
    159c:	00100793          	li	a5,1
    15a0:	02a7c863          	blt	a5,a0,15d0 <mem_write_handler+0x50>
    15a4:	00007537          	lui	a0,0x7
    15a8:	e2050513          	addi	a0,a0,-480 # 6e20 <str.2779+0x344>
    15ac:	72d000ef          	jal	ra,24d8 <printf>
    15b0:	02c12083          	lw	ra,44(sp)
    15b4:	02812403          	lw	s0,40(sp)
    15b8:	02412483          	lw	s1,36(sp)
    15bc:	02012903          	lw	s2,32(sp)
    15c0:	01c12983          	lw	s3,28(sp)
    15c4:	01812a03          	lw	s4,24(sp)
    15c8:	03010113          	addi	sp,sp,48
    15cc:	00008067          	ret
    15d0:	00058493          	mv	s1,a1
    15d4:	00050993          	mv	s3,a0
    15d8:	0004a503          	lw	a0,0(s1)
    15dc:	00000613          	li	a2,0
    15e0:	00c10593          	addi	a1,sp,12
    15e4:	7b9000ef          	jal	ra,259c <strtoul>
    15e8:	00c12783          	lw	a5,12(sp)
    15ec:	00050413          	mv	s0,a0
    15f0:	0007c783          	lbu	a5,0(a5)
    15f4:	00078863          	beqz	a5,1604 <mem_write_handler+0x84>
    15f8:	00007537          	lui	a0,0x7
    15fc:	c2850513          	addi	a0,a0,-984 # 6c28 <str.2779+0x14c>
    1600:	fadff06f          	j	15ac <mem_write_handler+0x2c>
    1604:	0044a503          	lw	a0,4(s1)
    1608:	00000613          	li	a2,0
    160c:	00c10593          	addi	a1,sp,12
    1610:	78d000ef          	jal	ra,259c <strtoul>
    1614:	00c12783          	lw	a5,12(sp)
    1618:	00050913          	mv	s2,a0
    161c:	0007c783          	lbu	a5,0(a5)
    1620:	00078863          	beqz	a5,1630 <mem_write_handler+0xb0>
    1624:	00007537          	lui	a0,0x7
    1628:	be850513          	addi	a0,a0,-1048 # 6be8 <str.2779+0x10c>
    162c:	f81ff06f          	j	15ac <mem_write_handler+0x2c>
    1630:	00200793          	li	a5,2
    1634:	08f98063          	beq	s3,a5,16b4 <mem_write_handler+0x134>
    1638:	0084a503          	lw	a0,8(s1)
    163c:	00000613          	li	a2,0
    1640:	00c10593          	addi	a1,sp,12
    1644:	759000ef          	jal	ra,259c <strtoul>
    1648:	00c12783          	lw	a5,12(sp)
    164c:	00050a13          	mv	s4,a0
    1650:	0007c783          	lbu	a5,0(a5)
    1654:	00078863          	beqz	a5,1664 <mem_write_handler+0xe4>
    1658:	00007537          	lui	a0,0x7
    165c:	e4c50513          	addi	a0,a0,-436 # 6e4c <str.2779+0x370>
    1660:	f4dff06f          	j	15ac <mem_write_handler+0x2c>
    1664:	00400713          	li	a4,4
    1668:	00e99c63          	bne	s3,a4,1680 <mem_write_handler+0x100>
    166c:	00c4a503          	lw	a0,12(s1)
    1670:	00000613          	li	a2,0
    1674:	00c10593          	addi	a1,sp,12
    1678:	725000ef          	jal	ra,259c <strtoul>
    167c:	00050713          	mv	a4,a0
    1680:	00040793          	mv	a5,s0
    1684:	00000693          	li	a3,0
    1688:	00200613          	li	a2,2
    168c:	00400593          	li	a1,4
    1690:	00100513          	li	a0,1
    1694:	f1468ee3          	beq	a3,s4,15b0 <mem_write_handler+0x30>
    1698:	02c70463          	beq	a4,a2,16c0 <mem_write_handler+0x140>
    169c:	02b70863          	beq	a4,a1,16cc <mem_write_handler+0x14c>
    16a0:	02a71c63          	bne	a4,a0,16d8 <mem_write_handler+0x158>
    16a4:	01278023          	sb	s2,0(a5)
    16a8:	00178793          	addi	a5,a5,1
    16ac:	00168693          	addi	a3,a3,1
    16b0:	fe5ff06f          	j	1694 <mem_write_handler+0x114>
    16b4:	00100a13          	li	s4,1
    16b8:	00400713          	li	a4,4
    16bc:	fc5ff06f          	j	1680 <mem_write_handler+0x100>
    16c0:	01279023          	sh	s2,0(a5)
    16c4:	00278793          	addi	a5,a5,2
    16c8:	fe5ff06f          	j	16ac <mem_write_handler+0x12c>
    16cc:	0127a023          	sw	s2,0(a5)
    16d0:	00478793          	addi	a5,a5,4
    16d4:	fd9ff06f          	j	16ac <mem_write_handler+0x12c>
    16d8:	00007537          	lui	a0,0x7
    16dc:	e5c50513          	addi	a0,a0,-420 # 6e5c <str.2779+0x380>
    16e0:	ecdff06f          	j	15ac <mem_write_handler+0x2c>

000016e4 <mem_copy_handler>:
    16e4:	fd010113          	addi	sp,sp,-48
    16e8:	02112623          	sw	ra,44(sp)
    16ec:	02812423          	sw	s0,40(sp)
    16f0:	02912223          	sw	s1,36(sp)
    16f4:	03212023          	sw	s2,32(sp)
    16f8:	01312e23          	sw	s3,28(sp)
    16fc:	00100793          	li	a5,1
    1700:	02a7c663          	blt	a5,a0,172c <mem_copy_handler+0x48>
    1704:	00007537          	lui	a0,0x7
    1708:	e6c50513          	addi	a0,a0,-404 # 6e6c <str.2779+0x390>
    170c:	5cd000ef          	jal	ra,24d8 <printf>
    1710:	02c12083          	lw	ra,44(sp)
    1714:	02812403          	lw	s0,40(sp)
    1718:	02412483          	lw	s1,36(sp)
    171c:	02012903          	lw	s2,32(sp)
    1720:	01c12983          	lw	s3,28(sp)
    1724:	03010113          	addi	sp,sp,48
    1728:	00008067          	ret
    172c:	00058413          	mv	s0,a1
    1730:	00050493          	mv	s1,a0
    1734:	00042503          	lw	a0,0(s0)
    1738:	00000613          	li	a2,0
    173c:	00c10593          	addi	a1,sp,12
    1740:	65d000ef          	jal	ra,259c <strtoul>
    1744:	00c12783          	lw	a5,12(sp)
    1748:	00050993          	mv	s3,a0
    174c:	0007c783          	lbu	a5,0(a5)
    1750:	00078863          	beqz	a5,1760 <mem_copy_handler+0x7c>
    1754:	00007537          	lui	a0,0x7
    1758:	e8c50513          	addi	a0,a0,-372 # 6e8c <str.2779+0x3b0>
    175c:	fb1ff06f          	j	170c <mem_copy_handler+0x28>
    1760:	00442503          	lw	a0,4(s0)
    1764:	00000613          	li	a2,0
    1768:	00c10593          	addi	a1,sp,12
    176c:	631000ef          	jal	ra,259c <strtoul>
    1770:	00c12783          	lw	a5,12(sp)
    1774:	00050913          	mv	s2,a0
    1778:	0007c783          	lbu	a5,0(a5)
    177c:	00078863          	beqz	a5,178c <mem_copy_handler+0xa8>
    1780:	00007537          	lui	a0,0x7
    1784:	eac50513          	addi	a0,a0,-340 # 6eac <str.2779+0x3d0>
    1788:	f85ff06f          	j	170c <mem_copy_handler+0x28>
    178c:	00200793          	li	a5,2
    1790:	00100713          	li	a4,1
    1794:	02f48863          	beq	s1,a5,17c4 <mem_copy_handler+0xe0>
    1798:	00842503          	lw	a0,8(s0)
    179c:	00000613          	li	a2,0
    17a0:	00c10593          	addi	a1,sp,12
    17a4:	5f9000ef          	jal	ra,259c <strtoul>
    17a8:	00c12783          	lw	a5,12(sp)
    17ac:	00050713          	mv	a4,a0
    17b0:	0007c783          	lbu	a5,0(a5)
    17b4:	00078863          	beqz	a5,17c4 <mem_copy_handler+0xe0>
    17b8:	00007537          	lui	a0,0x7
    17bc:	e4c50513          	addi	a0,a0,-436 # 6e4c <str.2779+0x370>
    17c0:	f4dff06f          	j	170c <mem_copy_handler+0x28>
    17c4:	00000793          	li	a5,0
    17c8:	00279693          	slli	a3,a5,0x2
    17cc:	00d98633          	add	a2,s3,a3
    17d0:	00d906b3          	add	a3,s2,a3
    17d4:	f2f70ee3          	beq	a4,a5,1710 <mem_copy_handler+0x2c>
    17d8:	0006a683          	lw	a3,0(a3)
    17dc:	00178793          	addi	a5,a5,1
    17e0:	00d62023          	sw	a3,0(a2)
    17e4:	fe5ff06f          	j	17c8 <mem_copy_handler+0xe4>

000017e8 <mem_cmp_handler>:
    17e8:	fd010113          	addi	sp,sp,-48
    17ec:	02112623          	sw	ra,44(sp)
    17f0:	02812423          	sw	s0,40(sp)
    17f4:	02912223          	sw	s1,36(sp)
    17f8:	03212023          	sw	s2,32(sp)
    17fc:	01312e23          	sw	s3,28(sp)
    1800:	01412c23          	sw	s4,24(sp)
    1804:	00200793          	li	a5,2
    1808:	02a7c863          	blt	a5,a0,1838 <mem_cmp_handler+0x50>
    180c:	00007537          	lui	a0,0x7
    1810:	ec850513          	addi	a0,a0,-312 # 6ec8 <str.2779+0x3ec>
    1814:	4c5000ef          	jal	ra,24d8 <printf>
    1818:	02c12083          	lw	ra,44(sp)
    181c:	02812403          	lw	s0,40(sp)
    1820:	02412483          	lw	s1,36(sp)
    1824:	02012903          	lw	s2,32(sp)
    1828:	01c12983          	lw	s3,28(sp)
    182c:	01812a03          	lw	s4,24(sp)
    1830:	03010113          	addi	sp,sp,48
    1834:	00008067          	ret
    1838:	00058913          	mv	s2,a1
    183c:	00092503          	lw	a0,0(s2)
    1840:	00000613          	li	a2,0
    1844:	00c10593          	addi	a1,sp,12
    1848:	555000ef          	jal	ra,259c <strtoul>
    184c:	00c12783          	lw	a5,12(sp)
    1850:	00050413          	mv	s0,a0
    1854:	0007c783          	lbu	a5,0(a5)
    1858:	00078863          	beqz	a5,1868 <mem_cmp_handler+0x80>
    185c:	00007537          	lui	a0,0x7
    1860:	ee850513          	addi	a0,a0,-280 # 6ee8 <str.2779+0x40c>
    1864:	fb1ff06f          	j	1814 <mem_cmp_handler+0x2c>
    1868:	00492503          	lw	a0,4(s2)
    186c:	00000613          	li	a2,0
    1870:	00c10593          	addi	a1,sp,12
    1874:	529000ef          	jal	ra,259c <strtoul>
    1878:	00c12783          	lw	a5,12(sp)
    187c:	00050493          	mv	s1,a0
    1880:	0007c783          	lbu	a5,0(a5)
    1884:	00078863          	beqz	a5,1894 <mem_cmp_handler+0xac>
    1888:	00007537          	lui	a0,0x7
    188c:	ef850513          	addi	a0,a0,-264 # 6ef8 <str.2779+0x41c>
    1890:	f85ff06f          	j	1814 <mem_cmp_handler+0x2c>
    1894:	00892503          	lw	a0,8(s2)
    1898:	00000613          	li	a2,0
    189c:	00c10593          	addi	a1,sp,12
    18a0:	4fd000ef          	jal	ra,259c <strtoul>
    18a4:	00c12783          	lw	a5,12(sp)
    18a8:	00050913          	mv	s2,a0
    18ac:	0007c783          	lbu	a5,0(a5)
    18b0:	04078863          	beqz	a5,1900 <mem_cmp_handler+0x118>
    18b4:	00007537          	lui	a0,0x7
    18b8:	e4c50513          	addi	a0,a0,-436 # 6e4c <str.2779+0x370>
    18bc:	f59ff06f          	j	1814 <mem_cmp_handler+0x2c>
    18c0:	00042603          	lw	a2,0(s0)
    18c4:	0004a703          	lw	a4,0(s1)
    18c8:	00e60c63          	beq	a2,a4,18e0 <mem_cmp_handler+0xf8>
    18cc:	00048693          	mv	a3,s1
    18d0:	00040593          	mv	a1,s0
    18d4:	f08a0513          	addi	a0,s4,-248
    18d8:	401000ef          	jal	ra,24d8 <printf>
    18dc:	00000793          	li	a5,0
    18e0:	00198993          	addi	s3,s3,1
    18e4:	00440413          	addi	s0,s0,4
    18e8:	00448493          	addi	s1,s1,4
    18ec:	fd299ae3          	bne	s3,s2,18c0 <mem_cmp_handler+0xd8>
    18f0:	02078063          	beqz	a5,1910 <mem_cmp_handler+0x128>
    18f4:	00007537          	lui	a0,0x7
    18f8:	f6450513          	addi	a0,a0,-156 # 6f64 <str.2779+0x488>
    18fc:	f19ff06f          	j	1814 <mem_cmp_handler+0x2c>
    1900:	00100793          	li	a5,1
    1904:	00000993          	li	s3,0
    1908:	00007a37          	lui	s4,0x7
    190c:	fe1ff06f          	j	18ec <mem_cmp_handler+0x104>
    1910:	00007537          	lui	a0,0x7
    1914:	f8450513          	addi	a0,a0,-124 # 6f84 <str.2779+0x4a8>
    1918:	efdff06f          	j	1814 <mem_cmp_handler+0x2c>

0000191c <mem_read_handler>:
    191c:	fe010113          	addi	sp,sp,-32
    1920:	00112e23          	sw	ra,28(sp)
    1924:	00812c23          	sw	s0,24(sp)
    1928:	00912a23          	sw	s1,20(sp)
    192c:	01212823          	sw	s2,16(sp)
    1930:	02a04463          	bgtz	a0,1958 <mem_read_handler+0x3c>
    1934:	00007537          	lui	a0,0x7
    1938:	fac50513          	addi	a0,a0,-84 # 6fac <str.2779+0x4d0>
    193c:	39d000ef          	jal	ra,24d8 <printf>
    1940:	01c12083          	lw	ra,28(sp)
    1944:	01812403          	lw	s0,24(sp)
    1948:	01412483          	lw	s1,20(sp)
    194c:	01012903          	lw	s2,16(sp)
    1950:	02010113          	addi	sp,sp,32
    1954:	00008067          	ret
    1958:	00058413          	mv	s0,a1
    195c:	00050493          	mv	s1,a0
    1960:	00042503          	lw	a0,0(s0)
    1964:	00000613          	li	a2,0
    1968:	00c10593          	addi	a1,sp,12
    196c:	431000ef          	jal	ra,259c <strtoul>
    1970:	00c12783          	lw	a5,12(sp)
    1974:	00050913          	mv	s2,a0
    1978:	0007c783          	lbu	a5,0(a5)
    197c:	00078863          	beqz	a5,198c <mem_read_handler+0x70>
    1980:	00007537          	lui	a0,0x7
    1984:	c2850513          	addi	a0,a0,-984 # 6c28 <str.2779+0x14c>
    1988:	fb5ff06f          	j	193c <mem_read_handler+0x20>
    198c:	00100793          	li	a5,1
    1990:	02f48863          	beq	s1,a5,19c0 <mem_read_handler+0xa4>
    1994:	00442503          	lw	a0,4(s0)
    1998:	00c10593          	addi	a1,sp,12
    199c:	00000613          	li	a2,0
    19a0:	3fd000ef          	jal	ra,259c <strtoul>
    19a4:	00c12783          	lw	a5,12(sp)
    19a8:	00050593          	mv	a1,a0
    19ac:	0007c783          	lbu	a5,0(a5)
    19b0:	00078a63          	beqz	a5,19c4 <mem_read_handler+0xa8>
    19b4:	00007537          	lui	a0,0x7
    19b8:	fc850513          	addi	a0,a0,-56 # 6fc8 <str.2779+0x4ec>
    19bc:	f81ff06f          	j	193c <mem_read_handler+0x20>
    19c0:	00400593          	li	a1,4
    19c4:	00090613          	mv	a2,s2
    19c8:	00090513          	mv	a0,s2
    19cc:	db4ff0ef          	jal	ra,f80 <dump_bytes>
    19d0:	f71ff06f          	j	1940 <mem_read_handler+0x24>

000019d4 <mem_test_handler>:
    19d4:	fe010113          	addi	sp,sp,-32
    19d8:	00112e23          	sw	ra,28(sp)
    19dc:	00812c23          	sw	s0,24(sp)
    19e0:	00912a23          	sw	s1,20(sp)
    19e4:	01212823          	sw	s2,16(sp)
    19e8:	02a04463          	bgtz	a0,1a10 <mem_test_handler+0x3c>
    19ec:	00007537          	lui	a0,0x7
    19f0:	fdc50513          	addi	a0,a0,-36 # 6fdc <str.2779+0x500>
    19f4:	2e5000ef          	jal	ra,24d8 <printf>
    19f8:	01c12083          	lw	ra,28(sp)
    19fc:	01812403          	lw	s0,24(sp)
    1a00:	01412483          	lw	s1,20(sp)
    1a04:	01012903          	lw	s2,16(sp)
    1a08:	02010113          	addi	sp,sp,32
    1a0c:	00008067          	ret
    1a10:	00058413          	mv	s0,a1
    1a14:	00050493          	mv	s1,a0
    1a18:	00042503          	lw	a0,0(s0)
    1a1c:	00000613          	li	a2,0
    1a20:	00c10593          	addi	a1,sp,12
    1a24:	379000ef          	jal	ra,259c <strtoul>
    1a28:	00c12783          	lw	a5,12(sp)
    1a2c:	00050913          	mv	s2,a0
    1a30:	0007c783          	lbu	a5,0(a5)
    1a34:	00078863          	beqz	a5,1a44 <mem_test_handler+0x70>
    1a38:	00007537          	lui	a0,0x7
    1a3c:	c2850513          	addi	a0,a0,-984 # 6c28 <str.2779+0x14c>
    1a40:	fb5ff06f          	j	19f4 <mem_test_handler+0x20>
    1a44:	00100793          	li	a5,1
    1a48:	02f48863          	beq	s1,a5,1a78 <mem_test_handler+0xa4>
    1a4c:	00442503          	lw	a0,4(s0)
    1a50:	00c10593          	addi	a1,sp,12
    1a54:	00000613          	li	a2,0
    1a58:	345000ef          	jal	ra,259c <strtoul>
    1a5c:	00c12783          	lw	a5,12(sp)
    1a60:	00050593          	mv	a1,a0
    1a64:	0007c783          	lbu	a5,0(a5)
    1a68:	00078a63          	beqz	a5,1a7c <mem_test_handler+0xa8>
    1a6c:	00007537          	lui	a0,0x7
    1a70:	e5c50513          	addi	a0,a0,-420 # 6e5c <str.2779+0x380>
    1a74:	f81ff06f          	j	19f4 <mem_test_handler+0x20>
    1a78:	fff00593          	li	a1,-1
    1a7c:	00090513          	mv	a0,s2
    1a80:	4bc020ef          	jal	ra,3f3c <memtest>
    1a84:	f75ff06f          	j	19f8 <mem_test_handler+0x24>

00001a88 <mem_speed_handler>:
    1a88:	fd010113          	addi	sp,sp,-48
    1a8c:	02112623          	sw	ra,44(sp)
    1a90:	02812423          	sw	s0,40(sp)
    1a94:	02912223          	sw	s1,36(sp)
    1a98:	03212023          	sw	s2,32(sp)
    1a9c:	01312e23          	sw	s3,28(sp)
    1aa0:	01412c23          	sw	s4,24(sp)
    1aa4:	00100793          	li	a5,1
    1aa8:	02a7c863          	blt	a5,a0,1ad8 <mem_speed_handler+0x50>
    1aac:	00007537          	lui	a0,0x7
    1ab0:	ff850513          	addi	a0,a0,-8 # 6ff8 <str.2779+0x51c>
    1ab4:	225000ef          	jal	ra,24d8 <printf>
    1ab8:	02c12083          	lw	ra,44(sp)
    1abc:	02812403          	lw	s0,40(sp)
    1ac0:	02412483          	lw	s1,36(sp)
    1ac4:	02012903          	lw	s2,32(sp)
    1ac8:	01c12983          	lw	s3,28(sp)
    1acc:	01812a03          	lw	s4,24(sp)
    1ad0:	03010113          	addi	sp,sp,48
    1ad4:	00008067          	ret
    1ad8:	00058413          	mv	s0,a1
    1adc:	00050493          	mv	s1,a0
    1ae0:	00042503          	lw	a0,0(s0)
    1ae4:	00000613          	li	a2,0
    1ae8:	00c10593          	addi	a1,sp,12
    1aec:	2b1000ef          	jal	ra,259c <strtoul>
    1af0:	00c12783          	lw	a5,12(sp)
    1af4:	00050993          	mv	s3,a0
    1af8:	0007c783          	lbu	a5,0(a5)
    1afc:	00078863          	beqz	a5,1b0c <mem_speed_handler+0x84>
    1b00:	00007537          	lui	a0,0x7
    1b04:	c2850513          	addi	a0,a0,-984 # 6c28 <str.2779+0x14c>
    1b08:	fadff06f          	j	1ab4 <mem_speed_handler+0x2c>
    1b0c:	00442503          	lw	a0,4(s0)
    1b10:	00000613          	li	a2,0
    1b14:	00c10593          	addi	a1,sp,12
    1b18:	285000ef          	jal	ra,259c <strtoul>
    1b1c:	00c12783          	lw	a5,12(sp)
    1b20:	00050a13          	mv	s4,a0
    1b24:	0007c783          	lbu	a5,0(a5)
    1b28:	00078863          	beqz	a5,1b38 <mem_speed_handler+0xb0>
    1b2c:	00007537          	lui	a0,0x7
    1b30:	e5c50513          	addi	a0,a0,-420 # 6e5c <str.2779+0x380>
    1b34:	f81ff06f          	j	1ab4 <mem_speed_handler+0x2c>
    1b38:	00200793          	li	a5,2
    1b3c:	00000913          	li	s2,0
    1b40:	06f48263          	beq	s1,a5,1ba4 <mem_speed_handler+0x11c>
    1b44:	00842503          	lw	a0,8(s0)
    1b48:	00000613          	li	a2,0
    1b4c:	00c10593          	addi	a1,sp,12
    1b50:	24d000ef          	jal	ra,259c <strtoul>
    1b54:	00c12783          	lw	a5,12(sp)
    1b58:	00a03933          	snez	s2,a0
    1b5c:	0007c783          	lbu	a5,0(a5)
    1b60:	00078863          	beqz	a5,1b70 <mem_speed_handler+0xe8>
    1b64:	00007537          	lui	a0,0x7
    1b68:	02850513          	addi	a0,a0,40 # 7028 <str.2779+0x54c>
    1b6c:	f49ff06f          	j	1ab4 <mem_speed_handler+0x2c>
    1b70:	00300793          	li	a5,3
    1b74:	02f48863          	beq	s1,a5,1ba4 <mem_speed_handler+0x11c>
    1b78:	00c42503          	lw	a0,12(s0)
    1b7c:	00000613          	li	a2,0
    1b80:	00c10593          	addi	a1,sp,12
    1b84:	219000ef          	jal	ra,259c <strtoul>
    1b88:	00c12783          	lw	a5,12(sp)
    1b8c:	00a036b3          	snez	a3,a0
    1b90:	0007c783          	lbu	a5,0(a5)
    1b94:	00078a63          	beqz	a5,1ba8 <mem_speed_handler+0x120>
    1b98:	00007537          	lui	a0,0x7
    1b9c:	04450513          	addi	a0,a0,68 # 7044 <str.2779+0x568>
    1ba0:	f15ff06f          	j	1ab4 <mem_speed_handler+0x2c>
    1ba4:	00000693          	li	a3,0
    1ba8:	00090613          	mv	a2,s2
    1bac:	000a0593          	mv	a1,s4
    1bb0:	00098513          	mv	a0,s3
    1bb4:	140020ef          	jal	ra,3cf4 <memspeed>
    1bb8:	f01ff06f          	j	1ab8 <mem_speed_handler+0x30>

00001bbc <reboot_handler>:
    1bbc:	f00007b7          	lui	a5,0xf0000
    1bc0:	00100713          	li	a4,1
    1bc4:	00e7a023          	sw	a4,0(a5) # f0000000 <_fstack+0xdffff000>
    1bc8:	00008067          	ret

00001bcc <boot_handler>:
    1bcc:	fd010113          	addi	sp,sp,-48
    1bd0:	02112623          	sw	ra,44(sp)
    1bd4:	02812423          	sw	s0,40(sp)
    1bd8:	02912223          	sw	s1,36(sp)
    1bdc:	03212023          	sw	s2,32(sp)
    1be0:	01312e23          	sw	s3,28(sp)
    1be4:	02a04663          	bgtz	a0,1c10 <boot_handler+0x44>
    1be8:	00007537          	lui	a0,0x7
    1bec:	14850513          	addi	a0,a0,328 # 7148 <str.2779+0x66c>
    1bf0:	0e9000ef          	jal	ra,24d8 <printf>
    1bf4:	02c12083          	lw	ra,44(sp)
    1bf8:	02812403          	lw	s0,40(sp)
    1bfc:	02412483          	lw	s1,36(sp)
    1c00:	02012903          	lw	s2,32(sp)
    1c04:	01c12983          	lw	s3,28(sp)
    1c08:	03010113          	addi	sp,sp,48
    1c0c:	00008067          	ret
    1c10:	00058413          	mv	s0,a1
    1c14:	00050493          	mv	s1,a0
    1c18:	00042503          	lw	a0,0(s0)
    1c1c:	00000613          	li	a2,0
    1c20:	00c10593          	addi	a1,sp,12
    1c24:	179000ef          	jal	ra,259c <strtoul>
    1c28:	00c12783          	lw	a5,12(sp)
    1c2c:	00050993          	mv	s3,a0
    1c30:	0007c783          	lbu	a5,0(a5)
    1c34:	00078863          	beqz	a5,1c44 <boot_handler+0x78>
    1c38:	00007537          	lui	a0,0x7
    1c3c:	c2850513          	addi	a0,a0,-984 # 6c28 <str.2779+0x14c>
    1c40:	fb1ff06f          	j	1bf0 <boot_handler+0x24>
    1c44:	00100793          	li	a5,1
    1c48:	08f48e63          	beq	s1,a5,1ce4 <boot_handler+0x118>
    1c4c:	00442503          	lw	a0,4(s0)
    1c50:	00000613          	li	a2,0
    1c54:	00c10593          	addi	a1,sp,12
    1c58:	145000ef          	jal	ra,259c <strtoul>
    1c5c:	00c12783          	lw	a5,12(sp)
    1c60:	00050913          	mv	s2,a0
    1c64:	0007c783          	lbu	a5,0(a5)
    1c68:	00078863          	beqz	a5,1c78 <boot_handler+0xac>
    1c6c:	00007537          	lui	a0,0x7
    1c70:	16850513          	addi	a0,a0,360 # 7168 <str.2779+0x68c>
    1c74:	f7dff06f          	j	1bf0 <boot_handler+0x24>
    1c78:	00200793          	li	a5,2
    1c7c:	02f48863          	beq	s1,a5,1cac <boot_handler+0xe0>
    1c80:	00842503          	lw	a0,8(s0)
    1c84:	00c10593          	addi	a1,sp,12
    1c88:	00000613          	li	a2,0
    1c8c:	111000ef          	jal	ra,259c <strtoul>
    1c90:	00c12783          	lw	a5,12(sp)
    1c94:	00050593          	mv	a1,a0
    1c98:	0007c783          	lbu	a5,0(a5)
    1c9c:	00078a63          	beqz	a5,1cb0 <boot_handler+0xe4>
    1ca0:	00007537          	lui	a0,0x7
    1ca4:	17850513          	addi	a0,a0,376 # 7178 <str.2779+0x69c>
    1ca8:	f49ff06f          	j	1bf0 <boot_handler+0x24>
    1cac:	00000593          	li	a1,0
    1cb0:	00300793          	li	a5,3
    1cb4:	0297dc63          	bge	a5,s1,1cec <boot_handler+0x120>
    1cb8:	00c42503          	lw	a0,12(s0)
    1cbc:	00c10593          	addi	a1,sp,12
    1cc0:	00000613          	li	a2,0
    1cc4:	0d9000ef          	jal	ra,259c <strtoul>
    1cc8:	00c12783          	lw	a5,12(sp)
    1ccc:	00050593          	mv	a1,a0
    1cd0:	0007c783          	lbu	a5,0(a5)
    1cd4:	00078c63          	beqz	a5,1cec <boot_handler+0x120>
    1cd8:	00007537          	lui	a0,0x7
    1cdc:	18850513          	addi	a0,a0,392 # 7188 <str.2779+0x6ac>
    1ce0:	f11ff06f          	j	1bf0 <boot_handler+0x24>
    1ce4:	00000913          	li	s2,0
    1ce8:	00000593          	li	a1,0
    1cec:	00098693          	mv	a3,s3
    1cf0:	00000613          	li	a2,0
    1cf4:	00090513          	mv	a0,s2
    1cf8:	af1fe0ef          	jal	ra,7e8 <boot>

00001cfc <sdram_test_handler>:
    1cfc:	001005b7          	lui	a1,0x100
    1d00:	40000537          	lui	a0,0x40000
    1d04:	2380206f          	j	3f3c <memtest>

00001d08 <sdram_mr_write_handler>:
    1d08:	fd010113          	addi	sp,sp,-48
    1d0c:	02112623          	sw	ra,44(sp)
    1d10:	02812423          	sw	s0,40(sp)
    1d14:	02912223          	sw	s1,36(sp)
    1d18:	00100793          	li	a5,1
    1d1c:	02a7c263          	blt	a5,a0,1d40 <sdram_mr_write_handler+0x38>
    1d20:	00007537          	lui	a0,0x7
    1d24:	20850513          	addi	a0,a0,520 # 7208 <str.2779+0x72c>
    1d28:	7b0000ef          	jal	ra,24d8 <printf>
    1d2c:	02c12083          	lw	ra,44(sp)
    1d30:	02812403          	lw	s0,40(sp)
    1d34:	02412483          	lw	s1,36(sp)
    1d38:	03010113          	addi	sp,sp,48
    1d3c:	00008067          	ret
    1d40:	00058413          	mv	s0,a1
    1d44:	00042503          	lw	a0,0(s0)
    1d48:	00000613          	li	a2,0
    1d4c:	01c10593          	addi	a1,sp,28
    1d50:	04d000ef          	jal	ra,259c <strtoul>
    1d54:	01c12783          	lw	a5,28(sp)
    1d58:	00050493          	mv	s1,a0
    1d5c:	0007c783          	lbu	a5,0(a5)
    1d60:	00078863          	beqz	a5,1d70 <sdram_mr_write_handler+0x68>
    1d64:	00007537          	lui	a0,0x7
    1d68:	22850513          	addi	a0,a0,552 # 7228 <str.2779+0x74c>
    1d6c:	fbdff06f          	j	1d28 <sdram_mr_write_handler+0x20>
    1d70:	00442503          	lw	a0,4(s0)
    1d74:	00000613          	li	a2,0
    1d78:	01c10593          	addi	a1,sp,28
    1d7c:	021000ef          	jal	ra,259c <strtoul>
    1d80:	01c12783          	lw	a5,28(sp)
    1d84:	00050413          	mv	s0,a0
    1d88:	0007c783          	lbu	a5,0(a5)
    1d8c:	00078863          	beqz	a5,1d9c <sdram_mr_write_handler+0x94>
    1d90:	00007537          	lui	a0,0x7
    1d94:	be850513          	addi	a0,a0,-1048 # 6be8 <str.2779+0x10c>
    1d98:	f91ff06f          	j	1d28 <sdram_mr_write_handler+0x20>
    1d9c:	350040ef          	jal	ra,60ec <sdram_software_control_on>
    1da0:	01041593          	slli	a1,s0,0x10
    1da4:	00007537          	lui	a0,0x7
    1da8:	0105d593          	srli	a1,a1,0x10
    1dac:	0ff4f613          	andi	a2,s1,255
    1db0:	23850513          	addi	a0,a0,568 # 7238 <str.2779+0x75c>
    1db4:	00b12623          	sw	a1,12(sp)
    1db8:	720000ef          	jal	ra,24d8 <printf>
    1dbc:	00c12583          	lw	a1,12(sp)
    1dc0:	0ff4f513          	andi	a0,s1,255
    1dc4:	370040ef          	jal	ra,6134 <sdram_mode_register_write>
    1dc8:	348040ef          	jal	ra,6110 <sdram_software_control_off>
    1dcc:	f61ff06f          	j	1d2c <sdram_mr_write_handler+0x24>

00001dd0 <main>:
    1dd0:	f6010113          	addi	sp,sp,-160
    1dd4:	08112e23          	sw	ra,156(sp)
    1dd8:	08812c23          	sw	s0,152(sp)
    1ddc:	08912a23          	sw	s1,148(sp)
    1de0:	09212823          	sw	s2,144(sp)
    1de4:	09312623          	sw	s3,140(sp)
    1de8:	f0c027b7          	lui	a5,0xf0c02
    1dec:	0007a023          	sw	zero,0(a5) # f0c02000 <_fstack+0xe0c01000>
    1df0:	30046073          	csrsi	mstatus,8
    1df4:	00008437          	lui	s0,0x8
    1df8:	478020ef          	jal	ra,4270 <uart_init>
    1dfc:	0d040513          	addi	a0,s0,208 # 80d0 <crc_table+0x644>
    1e00:	6d8000ef          	jal	ra,24d8 <printf>
    1e04:	00007537          	lui	a0,0x7
    1e08:	2c850513          	addi	a0,a0,712 # 72c8 <str.2779+0x7ec>
    1e0c:	6cc000ef          	jal	ra,24d8 <printf>
    1e10:	00007537          	lui	a0,0x7
    1e14:	2f050513          	addi	a0,a0,752 # 72f0 <str.2779+0x814>
    1e18:	6c0000ef          	jal	ra,24d8 <printf>
    1e1c:	00007537          	lui	a0,0x7
    1e20:	31850513          	addi	a0,a0,792 # 7318 <str.2779+0x83c>
    1e24:	6b4000ef          	jal	ra,24d8 <printf>
    1e28:	00007537          	lui	a0,0x7
    1e2c:	33c50513          	addi	a0,a0,828 # 733c <str.2779+0x860>
    1e30:	6a8000ef          	jal	ra,24d8 <printf>
    1e34:	00007537          	lui	a0,0x7
    1e38:	36050513          	addi	a0,a0,864 # 7360 <str.2779+0x884>
    1e3c:	69c000ef          	jal	ra,24d8 <printf>
    1e40:	0d040513          	addi	a0,s0,208
    1e44:	694000ef          	jal	ra,24d8 <printf>
    1e48:	00007537          	lui	a0,0x7
    1e4c:	38c50513          	addi	a0,a0,908 # 738c <str.2779+0x8b0>
    1e50:	688000ef          	jal	ra,24d8 <printf>
    1e54:	00007537          	lui	a0,0x7
    1e58:	3b450513          	addi	a0,a0,948 # 73b4 <str.2779+0x8d8>
    1e5c:	67c000ef          	jal	ra,24d8 <printf>
    1e60:	0d040513          	addi	a0,s0,208
    1e64:	674000ef          	jal	ra,24d8 <printf>
    1e68:	aa8ff0ef          	jal	ra,1110 <crcbios>
    1e6c:	0d040513          	addi	a0,s0,208
    1e70:	668000ef          	jal	ra,24d8 <printf>
    1e74:	00007537          	lui	a0,0x7
    1e78:	3d850513          	addi	a0,a0,984 # 73d8 <str.2779+0x8fc>
    1e7c:	65c000ef          	jal	ra,24d8 <printf>
    1e80:	0d040513          	addi	a0,s0,208
    1e84:	654000ef          	jal	ra,24d8 <printf>
    1e88:	00007537          	lui	a0,0x7
    1e8c:	3f450513          	addi	a0,a0,1012 # 73f4 <str.2779+0x918>
    1e90:	648000ef          	jal	ra,24d8 <printf>
    1e94:	000075b7          	lui	a1,0x7
    1e98:	00007537          	lui	a0,0x7
    1e9c:	03200613          	li	a2,50
    1ea0:	42858593          	addi	a1,a1,1064 # 7428 <str.2779+0x94c>
    1ea4:	43c50513          	addi	a0,a0,1084 # 743c <str.2779+0x960>
    1ea8:	630000ef          	jal	ra,24d8 <printf>
    1eac:	000075b7          	lui	a1,0x7
    1eb0:	00007537          	lui	a0,0x7
    1eb4:	00400693          	li	a3,4
    1eb8:	02000613          	li	a2,32
    1ebc:	45858593          	addi	a1,a1,1112 # 7458 <str.2779+0x97c>
    1ec0:	46450513          	addi	a0,a0,1124 # 7464 <str.2779+0x988>
    1ec4:	614000ef          	jal	ra,24d8 <printf>
    1ec8:	00007537          	lui	a0,0x7
    1ecc:	02000593          	li	a1,32
    1ed0:	48850513          	addi	a0,a0,1160 # 7488 <str.2779+0x9ac>
    1ed4:	604000ef          	jal	ra,24d8 <printf>
    1ed8:	00007537          	lui	a0,0x7
    1edc:	4a450513          	addi	a0,a0,1188 # 74a4 <str.2779+0x9c8>
    1ee0:	5f8000ef          	jal	ra,24d8 <printf>
    1ee4:	00007537          	lui	a0,0x7
    1ee8:	4b450513          	addi	a0,a0,1204 # 74b4 <str.2779+0x9d8>
    1eec:	5ec000ef          	jal	ra,24d8 <printf>
    1ef0:	00000593          	li	a1,0
    1ef4:	00010537          	lui	a0,0x10
    1ef8:	3b4040ef          	jal	ra,62ac <print_size>
    1efc:	0d040513          	addi	a0,s0,208
    1f00:	5d8000ef          	jal	ra,24d8 <printf>
    1f04:	00007537          	lui	a0,0x7
    1f08:	4c450513          	addi	a0,a0,1220 # 74c4 <str.2779+0x9e8>
    1f0c:	5cc000ef          	jal	ra,24d8 <printf>
    1f10:	00000593          	li	a1,0
    1f14:	00001537          	lui	a0,0x1
    1f18:	394040ef          	jal	ra,62ac <print_size>
    1f1c:	0d040513          	addi	a0,s0,208
    1f20:	5b8000ef          	jal	ra,24d8 <printf>
    1f24:	00007537          	lui	a0,0x7
    1f28:	4d450513          	addi	a0,a0,1236 # 74d4 <str.2779+0x9f8>
    1f2c:	5ac000ef          	jal	ra,24d8 <printf>
    1f30:	00000593          	li	a1,0
    1f34:	10000513          	li	a0,256
    1f38:	374040ef          	jal	ra,62ac <print_size>
    1f3c:	0d040513          	addi	a0,s0,208
    1f40:	598000ef          	jal	ra,24d8 <printf>
    1f44:	534040ef          	jal	ra,6478 <sdram_get_supported_memory>
    1f48:	00050493          	mv	s1,a0
    1f4c:	00007537          	lui	a0,0x7
    1f50:	4e450513          	addi	a0,a0,1252 # 74e4 <str.2779+0xa08>
    1f54:	00b12623          	sw	a1,12(sp)
    1f58:	580000ef          	jal	ra,24d8 <printf>
    1f5c:	00c12583          	lw	a1,12(sp)
    1f60:	00048513          	mv	a0,s1
    1f64:	348040ef          	jal	ra,62ac <print_size>
    1f68:	160040ef          	jal	ra,60c8 <sdram_get_databits>
    1f6c:	00a12623          	sw	a0,12(sp)
    1f70:	160040ef          	jal	ra,60d0 <sdram_get_freq>
    1f74:	000f47b7          	lui	a5,0xf4
    1f78:	24078793          	addi	a5,a5,576 # f4240 <_edata_rom+0xeba64>
    1f7c:	02f54633          	div	a2,a0,a5
    1f80:	00c12583          	lw	a1,12(sp)
    1f84:	00007537          	lui	a0,0x7
    1f88:	4f850513          	addi	a0,a0,1272 # 74f8 <str.2779+0xa1c>
    1f8c:	54c000ef          	jal	ra,24d8 <printf>
    1f90:	14c040ef          	jal	ra,60dc <sdram_get_cl>
    1f94:	00050593          	mv	a1,a0
    1f98:	00007537          	lui	a0,0x7
    1f9c:	50c50513          	addi	a0,a0,1292 # 750c <str.2779+0xa30>
    1fa0:	538000ef          	jal	ra,24d8 <printf>
    1fa4:	140040ef          	jal	ra,60e4 <sdram_get_cwl>
    1fa8:	fff00793          	li	a5,-1
    1fac:	00f50c63          	beq	a0,a5,1fc4 <main+0x1f4>
    1fb0:	134040ef          	jal	ra,60e4 <sdram_get_cwl>
    1fb4:	00050593          	mv	a1,a0
    1fb8:	00007537          	lui	a0,0x7
    1fbc:	51450513          	addi	a0,a0,1300 # 7514 <str.2779+0xa38>
    1fc0:	518000ef          	jal	ra,24d8 <printf>
    1fc4:	00007537          	lui	a0,0x7
    1fc8:	51c50513          	addi	a0,a0,1308 # 751c <str.2779+0xa40>
    1fcc:	50c000ef          	jal	ra,24d8 <printf>
    1fd0:	00007537          	lui	a0,0x7
    1fd4:	52050513          	addi	a0,a0,1312 # 7520 <str.2779+0xa44>
    1fd8:	500000ef          	jal	ra,24d8 <printf>
    1fdc:	00000593          	li	a1,0
    1fe0:	02000537          	lui	a0,0x2000
    1fe4:	2c8040ef          	jal	ra,62ac <print_size>
    1fe8:	0d040513          	addi	a0,s0,208
    1fec:	4ec000ef          	jal	ra,24d8 <printf>
    1ff0:	0d040513          	addi	a0,s0,208
    1ff4:	4e4000ef          	jal	ra,24d8 <printf>
    1ff8:	00007537          	lui	a0,0x7
    1ffc:	53450513          	addi	a0,a0,1332 # 7534 <str.2779+0xa58>
    2000:	4d8000ef          	jal	ra,24d8 <printf>
    2004:	0d040513          	addi	a0,s0,208
    2008:	4d0000ef          	jal	ra,24d8 <printf>
    200c:	168040ef          	jal	ra,6174 <sdram_init>
    2010:	00100793          	li	a5,1
    2014:	00050493          	mv	s1,a0
    2018:	00f50863          	beq	a0,a5,2028 <main+0x258>
    201c:	00007537          	lui	a0,0x7
    2020:	56850513          	addi	a0,a0,1384 # 7568 <str.2779+0xa8c>
    2024:	4b4000ef          	jal	ra,24d8 <printf>
    2028:	0d040513          	addi	a0,s0,208
    202c:	4ac000ef          	jal	ra,24d8 <printf>
    2030:	a80ff0ef          	jal	ra,12b0 <init_dispatcher>
    2034:	02048863          	beqz	s1,2064 <main+0x294>
    2038:	00007537          	lui	a0,0x7
    203c:	58850513          	addi	a0,a0,1416 # 7588 <str.2779+0xaac>
    2040:	498000ef          	jal	ra,24d8 <printf>
    2044:	bddfe0ef          	jal	ra,c20 <serialboot>
    2048:	00050a63          	beqz	a0,205c <main+0x28c>
    204c:	ec5fe0ef          	jal	ra,f10 <sdcardboot>
    2050:	00007537          	lui	a0,0x7
    2054:	5bc50513          	addi	a0,a0,1468 # 75bc <str.2779+0xae0>
    2058:	480000ef          	jal	ra,24d8 <printf>
    205c:	0d040513          	addi	a0,s0,208
    2060:	478000ef          	jal	ra,24d8 <printf>
    2064:	00007537          	lui	a0,0x7
    2068:	5d450513          	addi	a0,a0,1492 # 75d4 <str.2779+0xaf8>
    206c:	46c000ef          	jal	ra,24d8 <printf>
    2070:	00007937          	lui	s2,0x7
    2074:	000074b7          	lui	s1,0x7
    2078:	60890593          	addi	a1,s2,1544 # 7608 <str.2779+0xb2c>
    207c:	61c48513          	addi	a0,s1,1564 # 761c <str.2779+0xb40>
    2080:	458000ef          	jal	ra,24d8 <printf>
    2084:	000079b7          	lui	s3,0x7
    2088:	04000593          	li	a1,64
    208c:	04010513          	addi	a0,sp,64
    2090:	05c000ef          	jal	ra,20ec <readline>
    2094:	04014783          	lbu	a5,64(sp)
    2098:	02078c63          	beqz	a5,20d0 <main+0x300>
    209c:	0d040513          	addi	a0,s0,208
    20a0:	438000ef          	jal	ra,24d8 <printf>
    20a4:	02010613          	addi	a2,sp,32
    20a8:	01c10593          	addi	a1,sp,28
    20ac:	04010513          	addi	a0,sp,64
    20b0:	8d4ff0ef          	jal	ra,1184 <get_param>
    20b4:	00050593          	mv	a1,a0
    20b8:	01c12503          	lw	a0,28(sp)
    20bc:	02010613          	addi	a2,sp,32
    20c0:	958ff0ef          	jal	ra,1218 <command_dispatcher>
    20c4:	00051663          	bnez	a0,20d0 <main+0x300>
    20c8:	62098513          	addi	a0,s3,1568 # 7620 <str.2779+0xb44>
    20cc:	40c000ef          	jal	ra,24d8 <printf>
    20d0:	60890593          	addi	a1,s2,1544
    20d4:	61c48513          	addi	a0,s1,1564
    20d8:	400000ef          	jal	ra,24d8 <printf>
    20dc:	fadff06f          	j	2088 <main+0x2b8>

000020e0 <set_idle_hook>:
    20e0:	100007b7          	lui	a5,0x10000
    20e4:	16a7a623          	sw	a0,364(a5) # 1000016c <idle_hook_ptr>
    20e8:	00008067          	ret

000020ec <readline>:
    20ec:	000087b7          	lui	a5,0x8
    20f0:	6187a783          	lw	a5,1560(a5) # 8618 <stdin>
    20f4:	fc010113          	addi	sp,sp,-64
    20f8:	02812c23          	sw	s0,56(sp)
    20fc:	00f12623          	sw	a5,12(sp)
    2100:	000087b7          	lui	a5,0x8
    2104:	6207a783          	lw	a5,1568(a5) # 8620 <stdout>
    2108:	02912a23          	sw	s1,52(sp)
    210c:	03212823          	sw	s2,48(sp)
    2110:	03312623          	sw	s3,44(sp)
    2114:	03412423          	sw	s4,40(sp)
    2118:	03512223          	sw	s5,36(sp)
    211c:	02112e23          	sw	ra,60(sp)
    2120:	00050a93          	mv	s5,a0
    2124:	00010ea3          	sb	zero,29(sp)
    2128:	00000413          	li	s0,0
    212c:	100009b7          	lui	s3,0x10000
    2130:	100004b7          	lui	s1,0x10000
    2134:	00f12423          	sw	a5,8(sp)
    2138:	00a00913          	li	s2,10
    213c:	00007a37          	lui	s4,0x7
    2140:	16c9a783          	lw	a5,364(s3) # 1000016c <idle_hook_ptr>
    2144:	04079c63          	bnez	a5,219c <readline+0xb0>
    2148:	00c12503          	lw	a0,12(sp)
    214c:	2a0000ef          	jal	ra,23ec <fgetc>
    2150:	1684c703          	lbu	a4,360(s1) # 10000168 <skip.1899>
    2154:	0ff57793          	andi	a5,a0,255
    2158:	00f10e23          	sb	a5,28(sp)
    215c:	fef702e3          	beq	a4,a5,2140 <readline+0x54>
    2160:	16048423          	sb	zero,360(s1)
    2164:	09278c63          	beq	a5,s2,21fc <readline+0x110>
    2168:	04f96063          	bltu	s2,a5,21a8 <readline+0xbc>
    216c:	00700713          	li	a4,7
    2170:	fce788e3          	beq	a5,a4,2140 <readline+0x54>
    2174:	00800713          	li	a4,8
    2178:	08e79863          	bne	a5,a4,2208 <readline+0x11c>
    217c:	fc0402e3          	beqz	s0,2140 <readline+0x54>
    2180:	00812583          	lw	a1,8(sp)
    2184:	634a0513          	addi	a0,s4,1588 # 7634 <str.2779+0xb58>
    2188:	fff40413          	addi	s0,s0,-1
    218c:	2dc000ef          	jal	ra,2468 <fputs>
    2190:	fb1ff06f          	j	2140 <readline+0x54>
    2194:	16c9a783          	lw	a5,364(s3)
    2198:	000780e7          	jalr	a5
    219c:	028020ef          	jal	ra,41c4 <uart_read_nonblock>
    21a0:	fe050ae3          	beqz	a0,2194 <readline+0xa8>
    21a4:	fa5ff06f          	j	2148 <readline+0x5c>
    21a8:	00d00713          	li	a4,13
    21ac:	00e78663          	beq	a5,a4,21b8 <readline+0xcc>
    21b0:	07f00713          	li	a4,127
    21b4:	fc5ff06f          	j	2178 <readline+0x8c>
    21b8:	17248423          	sb	s2,360(s1)
    21bc:	008a8433          	add	s0,s5,s0
    21c0:	00040023          	sb	zero,0(s0)
    21c4:	00812583          	lw	a1,8(sp)
    21c8:	00008537          	lui	a0,0x8
    21cc:	0d050513          	addi	a0,a0,208 # 80d0 <crc_table+0x644>
    21d0:	298000ef          	jal	ra,2468 <fputs>
    21d4:	03c12083          	lw	ra,60(sp)
    21d8:	03812403          	lw	s0,56(sp)
    21dc:	03412483          	lw	s1,52(sp)
    21e0:	03012903          	lw	s2,48(sp)
    21e4:	02c12983          	lw	s3,44(sp)
    21e8:	02812a03          	lw	s4,40(sp)
    21ec:	02412a83          	lw	s5,36(sp)
    21f0:	00000513          	li	a0,0
    21f4:	04010113          	addi	sp,sp,64
    21f8:	00008067          	ret
    21fc:	00d00793          	li	a5,13
    2200:	16f48423          	sb	a5,360(s1)
    2204:	fb9ff06f          	j	21bc <readline+0xd0>
    2208:	00812583          	lw	a1,8(sp)
    220c:	01c10513          	addi	a0,sp,28
    2210:	258000ef          	jal	ra,2468 <fputs>
    2214:	01c14703          	lbu	a4,28(sp)
    2218:	008a87b3          	add	a5,s5,s0
    221c:	00140413          	addi	s0,s0,1
    2220:	00e78023          	sb	a4,0(a5)
    2224:	f1dff06f          	j	2140 <readline+0x54>

00002228 <memcpy>:
    2228:	00050313          	mv	t1,a0
    222c:	00060e63          	beqz	a2,2248 <memcpy+0x20>
    2230:	00058383          	lb	t2,0(a1)
    2234:	00730023          	sb	t2,0(t1)
    2238:	fff60613          	addi	a2,a2,-1
    223c:	00130313          	addi	t1,t1,1
    2240:	00158593          	addi	a1,a1,1
    2244:	fe0616e3          	bnez	a2,2230 <memcpy+0x8>
    2248:	00008067          	ret

0000224c <memset>:
    224c:	00050313          	mv	t1,a0
    2250:	00060a63          	beqz	a2,2264 <memset+0x18>
    2254:	00b30023          	sb	a1,0(t1)
    2258:	fff60613          	addi	a2,a2,-1
    225c:	00130313          	addi	t1,t1,1
    2260:	fe061ae3          	bnez	a2,2254 <memset+0x8>
    2264:	00008067          	ret

00002268 <strcmp>:
    2268:	00054603          	lbu	a2,0(a0)
    226c:	0005c683          	lbu	a3,0(a1)
    2270:	00150513          	addi	a0,a0,1
    2274:	00158593          	addi	a1,a1,1
    2278:	00d61463          	bne	a2,a3,2280 <strcmp+0x18>
    227c:	fe0616e3          	bnez	a2,2268 <strcmp>
    2280:	40d60533          	sub	a0,a2,a3
    2284:	00008067          	ret

00002288 <strlen>:
    2288:	00050793          	mv	a5,a0
    228c:	0007c703          	lbu	a4,0(a5)
    2290:	00178793          	addi	a5,a5,1
    2294:	fe071ce3          	bnez	a4,228c <strlen+0x4>
    2298:	40a78533          	sub	a0,a5,a0
    229c:	fff50513          	addi	a0,a0,-1
    22a0:	00008067          	ret

000022a4 <lldiv>:
    22a4:	fd010113          	addi	sp,sp,-48
    22a8:	01512a23          	sw	s5,20(sp)
    22ac:	00060a93          	mv	s5,a2
    22b0:	02812423          	sw	s0,40(sp)
    22b4:	00068613          	mv	a2,a3
    22b8:	01412c23          	sw	s4,24(sp)
    22bc:	01712623          	sw	s7,12(sp)
    22c0:	00068a13          	mv	s4,a3
    22c4:	00058b93          	mv	s7,a1
    22c8:	00070693          	mv	a3,a4
    22cc:	00050413          	mv	s0,a0
    22d0:	00058513          	mv	a0,a1
    22d4:	000a8593          	mv	a1,s5
    22d8:	02112623          	sw	ra,44(sp)
    22dc:	02912223          	sw	s1,36(sp)
    22e0:	03212023          	sw	s2,32(sp)
    22e4:	01312e23          	sw	s3,28(sp)
    22e8:	01612823          	sw	s6,16(sp)
    22ec:	00070993          	mv	s3,a4
    22f0:	01812423          	sw	s8,8(sp)
    22f4:	419000ef          	jal	ra,2f0c <__divdi3>
    22f8:	00098693          	mv	a3,s3
    22fc:	00050493          	mv	s1,a0
    2300:	00058b13          	mv	s6,a1
    2304:	00050913          	mv	s2,a0
    2308:	00058c13          	mv	s8,a1
    230c:	000a0613          	mv	a2,s4
    2310:	000b8513          	mv	a0,s7
    2314:	000a8593          	mv	a1,s5
    2318:	090010ef          	jal	ra,33a8 <__moddi3>
    231c:	00050793          	mv	a5,a0
    2320:	00058693          	mv	a3,a1
    2324:	020ac263          	bltz	s5,2348 <lldiv+0xa4>
    2328:	0205d063          	bgez	a1,2348 <lldiv+0xa4>
    232c:	00148913          	addi	s2,s1,1
    2330:	414507b3          	sub	a5,a0,s4
    2334:	009934b3          	sltu	s1,s2,s1
    2338:	00f53533          	sltu	a0,a0,a5
    233c:	413585b3          	sub	a1,a1,s3
    2340:	01648c33          	add	s8,s1,s6
    2344:	40a586b3          	sub	a3,a1,a0
    2348:	01242023          	sw	s2,0(s0)
    234c:	01842223          	sw	s8,4(s0)
    2350:	02c12083          	lw	ra,44(sp)
    2354:	00f42423          	sw	a5,8(s0)
    2358:	00d42623          	sw	a3,12(s0)
    235c:	00040513          	mv	a0,s0
    2360:	02812403          	lw	s0,40(sp)
    2364:	02412483          	lw	s1,36(sp)
    2368:	02012903          	lw	s2,32(sp)
    236c:	01c12983          	lw	s3,28(sp)
    2370:	01812a03          	lw	s4,24(sp)
    2374:	01412a83          	lw	s5,20(sp)
    2378:	01012b03          	lw	s6,16(sp)
    237c:	00c12b83          	lw	s7,12(sp)
    2380:	00812c03          	lw	s8,8(sp)
    2384:	03010113          	addi	sp,sp,48
    2388:	00008067          	ret

0000238c <strncmp>:
    238c:	02060a63          	beqz	a2,23c0 <strncmp+0x34>
    2390:	fff60613          	addi	a2,a2,-1
    2394:	00000713          	li	a4,0
    2398:	00e507b3          	add	a5,a0,a4
    239c:	00e586b3          	add	a3,a1,a4
    23a0:	0007c783          	lbu	a5,0(a5)
    23a4:	0006c683          	lbu	a3,0(a3)
    23a8:	00d79863          	bne	a5,a3,23b8 <strncmp+0x2c>
    23ac:	00c70663          	beq	a4,a2,23b8 <strncmp+0x2c>
    23b0:	00170713          	addi	a4,a4,1
    23b4:	fe0792e3          	bnez	a5,2398 <strncmp+0xc>
    23b8:	40d78533          	sub	a0,a5,a3
    23bc:	00008067          	ret
    23c0:	00000513          	li	a0,0
    23c4:	00008067          	ret

000023c8 <strnlen>:
    23c8:	00b505b3          	add	a1,a0,a1
    23cc:	00050793          	mv	a5,a0
    23d0:	00b79663          	bne	a5,a1,23dc <strnlen+0x14>
    23d4:	40a78533          	sub	a0,a5,a0
    23d8:	00008067          	ret
    23dc:	0007c703          	lbu	a4,0(a5)
    23e0:	fe070ae3          	beqz	a4,23d4 <strnlen+0xc>
    23e4:	00178793          	addi	a5,a5,1
    23e8:	fe9ff06f          	j	23d0 <strnlen+0x8>

000023ec <fgetc>:
    23ec:	00254783          	lbu	a5,2(a0)
    23f0:	0017f793          	andi	a5,a5,1
    23f4:	06078663          	beqz	a5,2460 <fgetc+0x74>
    23f8:	ff010113          	addi	sp,sp,-16
    23fc:	00055783          	lhu	a5,0(a0)
    2400:	00812423          	sw	s0,8(sp)
    2404:	00112623          	sw	ra,12(sp)
    2408:	00051023          	sh	zero,0(a0)
    240c:	00050413          	mv	s0,a0
    2410:	00078c63          	beqz	a5,2428 <fgetc+0x3c>
    2414:	0ff7f513          	andi	a0,a5,255
    2418:	00c12083          	lw	ra,12(sp)
    241c:	00812403          	lw	s0,8(sp)
    2420:	01010113          	addi	sp,sp,16
    2424:	00008067          	ret
    2428:	00852783          	lw	a5,8(a0)
    242c:	000780e7          	jalr	a5
    2430:	00050793          	mv	a5,a0
    2434:	0ff57513          	andi	a0,a0,255
    2438:	fe07d0e3          	bgez	a5,2418 <fgetc+0x2c>
    243c:	fff00613          	li	a2,-1
    2440:	00240703          	lb	a4,2(s0)
    2444:	00400693          	li	a3,4
    2448:	00c78463          	beq	a5,a2,2450 <fgetc+0x64>
    244c:	00800693          	li	a3,8
    2450:	00d767b3          	or	a5,a4,a3
    2454:	00f40123          	sb	a5,2(s0)
    2458:	fff00513          	li	a0,-1
    245c:	fbdff06f          	j	2418 <fgetc+0x2c>
    2460:	fff00513          	li	a0,-1
    2464:	00008067          	ret

00002468 <fputs>:
    2468:	ff010113          	addi	sp,sp,-16
    246c:	01212023          	sw	s2,0(sp)
    2470:	00112623          	sw	ra,12(sp)
    2474:	00812423          	sw	s0,8(sp)
    2478:	00912223          	sw	s1,4(sp)
    247c:	0025c783          	lbu	a5,2(a1)
    2480:	fff00913          	li	s2,-1
    2484:	0027f793          	andi	a5,a5,2
    2488:	00078e63          	beqz	a5,24a4 <fputs+0x3c>
    248c:	00050413          	mv	s0,a0
    2490:	00058493          	mv	s1,a1
    2494:	00000913          	li	s2,0
    2498:	00044503          	lbu	a0,0(s0)
    249c:	00140413          	addi	s0,s0,1
    24a0:	02051063          	bnez	a0,24c0 <fputs+0x58>
    24a4:	00c12083          	lw	ra,12(sp)
    24a8:	00812403          	lw	s0,8(sp)
    24ac:	00412483          	lw	s1,4(sp)
    24b0:	00090513          	mv	a0,s2
    24b4:	00012903          	lw	s2,0(sp)
    24b8:	01010113          	addi	sp,sp,16
    24bc:	00008067          	ret
    24c0:	0044a783          	lw	a5,4(s1)
    24c4:	00048593          	mv	a1,s1
    24c8:	000780e7          	jalr	a5
    24cc:	fc0556e3          	bgez	a0,2498 <fputs+0x30>
    24d0:	fff00913          	li	s2,-1
    24d4:	fc5ff06f          	j	2498 <fputs+0x30>

000024d8 <printf>:
    24d8:	fc010113          	addi	sp,sp,-64
    24dc:	02f12a23          	sw	a5,52(sp)
    24e0:	000087b7          	lui	a5,0x8
    24e4:	02b12223          	sw	a1,36(sp)
    24e8:	00050593          	mv	a1,a0
    24ec:	6207a503          	lw	a0,1568(a5) # 8620 <stdout>
    24f0:	02c12423          	sw	a2,40(sp)
    24f4:	02410613          	addi	a2,sp,36
    24f8:	00112e23          	sw	ra,28(sp)
    24fc:	02d12623          	sw	a3,44(sp)
    2500:	02e12823          	sw	a4,48(sp)
    2504:	03012c23          	sw	a6,56(sp)
    2508:	03112e23          	sw	a7,60(sp)
    250c:	00c12623          	sw	a2,12(sp)
    2510:	2d0000ef          	jal	ra,27e0 <__i_vfprintf>
    2514:	01c12083          	lw	ra,28(sp)
    2518:	04010113          	addi	sp,sp,64
    251c:	00008067          	ret

00002520 <puts>:
    2520:	000087b7          	lui	a5,0x8
    2524:	6207a583          	lw	a1,1568(a5) # 8620 <stdout>
    2528:	fe010113          	addi	sp,sp,-32
    252c:	00812c23          	sw	s0,24(sp)
    2530:	00912a23          	sw	s1,20(sp)
    2534:	00112e23          	sw	ra,28(sp)
    2538:	0025c783          	lbu	a5,2(a1)
    253c:	00050413          	mv	s0,a0
    2540:	00000493          	li	s1,0
    2544:	0027f793          	andi	a5,a5,2
    2548:	02079a63          	bnez	a5,257c <puts+0x5c>
    254c:	fff00493          	li	s1,-1
    2550:	01c12083          	lw	ra,28(sp)
    2554:	01812403          	lw	s0,24(sp)
    2558:	00048513          	mv	a0,s1
    255c:	01412483          	lw	s1,20(sp)
    2560:	02010113          	addi	sp,sp,32
    2564:	00008067          	ret
    2568:	00b12623          	sw	a1,12(sp)
    256c:	000780e7          	jalr	a5
    2570:	00c12583          	lw	a1,12(sp)
    2574:	00055463          	bgez	a0,257c <puts+0x5c>
    2578:	fff00493          	li	s1,-1
    257c:	00044503          	lbu	a0,0(s0)
    2580:	00140413          	addi	s0,s0,1
    2584:	0045a783          	lw	a5,4(a1)
    2588:	fe0510e3          	bnez	a0,2568 <puts+0x48>
    258c:	00a00513          	li	a0,10
    2590:	000780e7          	jalr	a5
    2594:	fa055ee3          	bgez	a0,2550 <puts+0x30>
    2598:	fb5ff06f          	j	254c <puts+0x2c>

0000259c <strtoul>:
    259c:	02400793          	li	a5,36
    25a0:	00050813          	mv	a6,a0
    25a4:	00c7e663          	bltu	a5,a2,25b0 <strtoul+0x14>
    25a8:	00100793          	li	a5,1
    25ac:	02f61063          	bne	a2,a5,25cc <strtoul+0x30>
    25b0:	100007b7          	lui	a5,0x10000
    25b4:	01600713          	li	a4,22
    25b8:	16e7a823          	sw	a4,368(a5) # 10000170 <errno>
    25bc:	00000513          	li	a0,0
    25c0:	00058463          	beqz	a1,25c8 <strtoul+0x2c>
    25c4:	0105a023          	sw	a6,0(a1)
    25c8:	00008067          	ret
    25cc:	0ff67893          	andi	a7,a2,255
    25d0:	00400e13          	li	t3,4
    25d4:	02000313          	li	t1,32
    25d8:	00054783          	lbu	a5,0(a0)
    25dc:	00150713          	addi	a4,a0,1
    25e0:	ff778693          	addi	a3,a5,-9
    25e4:	0ff6f693          	andi	a3,a3,255
    25e8:	0ade7a63          	bgeu	t3,a3,269c <strtoul+0x100>
    25ec:	0a678863          	beq	a5,t1,269c <strtoul+0x100>
    25f0:	02b00693          	li	a3,43
    25f4:	0ad78863          	beq	a5,a3,26a4 <strtoul+0x108>
    25f8:	02d00313          	li	t1,45
    25fc:	00000693          	li	a3,0
    2600:	00679863          	bne	a5,t1,2610 <strtoul+0x74>
    2604:	00100693          	li	a3,1
    2608:	00154783          	lbu	a5,1(a0)
    260c:	00250713          	addi	a4,a0,2
    2610:	03000513          	li	a0,48
    2614:	0aa79263          	bne	a5,a0,26b8 <strtoul+0x11c>
    2618:	00074503          	lbu	a0,0(a4)
    261c:	07800313          	li	t1,120
    2620:	02056513          	ori	a0,a0,32
    2624:	08651463          	bne	a0,t1,26ac <strtoul+0x110>
    2628:	00060663          	beqz	a2,2634 <strtoul+0x98>
    262c:	01000513          	li	a0,16
    2630:	00a61a63          	bne	a2,a0,2644 <strtoul+0xa8>
    2634:	00174783          	lbu	a5,1(a4)
    2638:	00070813          	mv	a6,a4
    263c:	01000893          	li	a7,16
    2640:	00270713          	addi	a4,a4,2
    2644:	00000513          	li	a0,0
    2648:	03900613          	li	a2,57
    264c:	00f67a63          	bgeu	a2,a5,2660 <strtoul+0xc4>
    2650:	fff78793          	addi	a5,a5,-1
    2654:	0207e793          	ori	a5,a5,32
    2658:	fda78793          	addi	a5,a5,-38
    265c:	0ff7f793          	andi	a5,a5,255
    2660:	fd078793          	addi	a5,a5,-48
    2664:	0ff7f793          	andi	a5,a5,255
    2668:	0517fe63          	bgeu	a5,a7,26c4 <strtoul+0x128>
    266c:	03153833          	mulhu	a6,a0,a7
    2670:	03150533          	mul	a0,a0,a7
    2674:	00081a63          	bnez	a6,2688 <strtoul+0xec>
    2678:	00f507b3          	add	a5,a0,a5
    267c:	00a7b833          	sltu	a6,a5,a0
    2680:	00078513          	mv	a0,a5
    2684:	00080463          	beqz	a6,268c <strtoul+0xf0>
    2688:	0026e693          	ori	a3,a3,2
    268c:	00074783          	lbu	a5,0(a4)
    2690:	00070813          	mv	a6,a4
    2694:	00170713          	addi	a4,a4,1
    2698:	fb5ff06f          	j	264c <strtoul+0xb0>
    269c:	00070513          	mv	a0,a4
    26a0:	f39ff06f          	j	25d8 <strtoul+0x3c>
    26a4:	00000693          	li	a3,0
    26a8:	f61ff06f          	j	2608 <strtoul+0x6c>
    26ac:	f8061ce3          	bnez	a2,2644 <strtoul+0xa8>
    26b0:	00800893          	li	a7,8
    26b4:	f91ff06f          	j	2644 <strtoul+0xa8>
    26b8:	f80616e3          	bnez	a2,2644 <strtoul+0xa8>
    26bc:	00a00893          	li	a7,10
    26c0:	f85ff06f          	j	2644 <strtoul+0xa8>
    26c4:	0016f793          	andi	a5,a3,1
    26c8:	00078463          	beqz	a5,26d0 <strtoul+0x134>
    26cc:	40a00533          	neg	a0,a0
    26d0:	0026f693          	andi	a3,a3,2
    26d4:	ee0686e3          	beqz	a3,25c0 <strtoul+0x24>
    26d8:	100007b7          	lui	a5,0x10000
    26dc:	02200713          	li	a4,34
    26e0:	16e7a823          	sw	a4,368(a5) # 10000170 <errno>
    26e4:	fff00513          	li	a0,-1
    26e8:	ed9ff06f          	j	25c0 <strtoul+0x24>

000026ec <__ultoa_invert>:
    26ec:	fd010113          	addi	sp,sp,-48
    26f0:	02912223          	sw	s1,36(sp)
    26f4:	03212023          	sw	s2,32(sp)
    26f8:	01312e23          	sw	s3,28(sp)
    26fc:	01412c23          	sw	s4,24(sp)
    2700:	01612823          	sw	s6,16(sp)
    2704:	02112623          	sw	ra,44(sp)
    2708:	02812423          	sw	s0,40(sp)
    270c:	01512a23          	sw	s5,20(sp)
    2710:	01712623          	sw	s7,12(sp)
    2714:	01812423          	sw	s8,8(sp)
    2718:	01912223          	sw	s9,4(sp)
    271c:	2006f793          	andi	a5,a3,512
    2720:	00050993          	mv	s3,a0
    2724:	00058a13          	mv	s4,a1
    2728:	00060913          	mv	s2,a2
    272c:	00068493          	mv	s1,a3
    2730:	02700b13          	li	s6,39
    2734:	00078663          	beqz	a5,2740 <__ultoa_invert+0x54>
    2738:	dff6f493          	andi	s1,a3,-513
    273c:	00700b13          	li	s6,7
    2740:	41f4da93          	srai	s5,s1,0x1f
    2744:	00900c93          	li	s9,9
    2748:	00048613          	mv	a2,s1
    274c:	000a8693          	mv	a3,s5
    2750:	00098513          	mv	a0,s3
    2754:	000a0593          	mv	a1,s4
    2758:	42d000ef          	jal	ra,3384 <__umoddi3>
    275c:	000a0593          	mv	a1,s4
    2760:	0ff57413          	andi	s0,a0,255
    2764:	00048613          	mv	a2,s1
    2768:	00098513          	mv	a0,s3
    276c:	000a8693          	mv	a3,s5
    2770:	40d000ef          	jal	ra,337c <__udivdi3>
    2774:	00098c13          	mv	s8,s3
    2778:	000a0b93          	mv	s7,s4
    277c:	00050993          	mv	s3,a0
    2780:	00058a13          	mv	s4,a1
    2784:	008cf663          	bgeu	s9,s0,2790 <__ultoa_invert+0xa4>
    2788:	01640433          	add	s0,s0,s6
    278c:	0ff47413          	andi	s0,s0,255
    2790:	00190913          	addi	s2,s2,1
    2794:	03040413          	addi	s0,s0,48
    2798:	fe890fa3          	sb	s0,-1(s2)
    279c:	015be663          	bltu	s7,s5,27a8 <__ultoa_invert+0xbc>
    27a0:	fb7a94e3          	bne	s5,s7,2748 <__ultoa_invert+0x5c>
    27a4:	fa9c72e3          	bgeu	s8,s1,2748 <__ultoa_invert+0x5c>
    27a8:	02c12083          	lw	ra,44(sp)
    27ac:	02812403          	lw	s0,40(sp)
    27b0:	02412483          	lw	s1,36(sp)
    27b4:	01c12983          	lw	s3,28(sp)
    27b8:	01812a03          	lw	s4,24(sp)
    27bc:	01412a83          	lw	s5,20(sp)
    27c0:	01012b03          	lw	s6,16(sp)
    27c4:	00c12b83          	lw	s7,12(sp)
    27c8:	00812c03          	lw	s8,8(sp)
    27cc:	00412c83          	lw	s9,4(sp)
    27d0:	00090513          	mv	a0,s2
    27d4:	02012903          	lw	s2,32(sp)
    27d8:	03010113          	addi	sp,sp,48
    27dc:	00008067          	ret

000027e0 <__i_vfprintf>:
    27e0:	f9010113          	addi	sp,sp,-112
    27e4:	05412c23          	sw	s4,88(sp)
    27e8:	06112623          	sw	ra,108(sp)
    27ec:	06812423          	sw	s0,104(sp)
    27f0:	06912223          	sw	s1,100(sp)
    27f4:	07212023          	sw	s2,96(sp)
    27f8:	05312e23          	sw	s3,92(sp)
    27fc:	05512a23          	sw	s5,84(sp)
    2800:	05612823          	sw	s6,80(sp)
    2804:	05712623          	sw	s7,76(sp)
    2808:	05812423          	sw	s8,72(sp)
    280c:	05912223          	sw	s9,68(sp)
    2810:	05a12023          	sw	s10,64(sp)
    2814:	03b12e23          	sw	s11,60(sp)
    2818:	00254783          	lbu	a5,2(a0)
    281c:	00452a03          	lw	s4,4(a0)
    2820:	0027f793          	andi	a5,a5,2
    2824:	2c078663          	beqz	a5,2af0 <__i_vfprintf+0x310>
    2828:	000077b7          	lui	a5,0x7
    282c:	64878793          	addi	a5,a5,1608 # 7648 <str.2779+0xb6c>
    2830:	00007cb7          	lui	s9,0x7
    2834:	00f12023          	sw	a5,0(sp)
    2838:	00007d37          	lui	s10,0x7
    283c:	640c8793          	addi	a5,s9,1600 # 7640 <str.2779+0xb64>
    2840:	00f12223          	sw	a5,4(sp)
    2844:	638d0793          	addi	a5,s10,1592 # 7638 <str.2779+0xb5c>
    2848:	00050993          	mv	s3,a0
    284c:	00060493          	mv	s1,a2
    2850:	00000c13          	li	s8,0
    2854:	01810a93          	addi	s5,sp,24
    2858:	00f12423          	sw	a5,8(sp)
    285c:	0005cd83          	lbu	s11,0(a1)
    2860:	280d8a63          	beqz	s11,2af4 <__i_vfprintf+0x314>
    2864:	02500713          	li	a4,37
    2868:	00158b93          	addi	s7,a1,1
    286c:	00ed9863          	bne	s11,a4,287c <__i_vfprintf+0x9c>
    2870:	0015cd83          	lbu	s11,1(a1)
    2874:	00258b93          	addi	s7,a1,2
    2878:	02ed9063          	bne	s11,a4,2898 <__i_vfprintf+0xb8>
    287c:	001c0c13          	addi	s8,s8,1
    2880:	00098593          	mv	a1,s3
    2884:	000d8513          	mv	a0,s11
    2888:	000a00e7          	jalr	s4
    288c:	26054263          	bltz	a0,2af0 <__i_vfprintf+0x310>
    2890:	000b8593          	mv	a1,s7
    2894:	fc9ff06f          	j	285c <__i_vfprintf+0x7c>
    2898:	00000d13          	li	s10,0
    289c:	00000913          	li	s2,0
    28a0:	00000413          	li	s0,0
    28a4:	01f00593          	li	a1,31
    28a8:	06c00813          	li	a6,108
    28ac:	06800893          	li	a7,104
    28b0:	04c00313          	li	t1,76
    28b4:	06a00e13          	li	t3,106
    28b8:	07a00e93          	li	t4,122
    28bc:	07400f13          	li	t5,116
    28c0:	00900f93          	li	t6,9
    28c4:	02a00293          	li	t0,42
    28c8:	02e00393          	li	t2,46
    28cc:	00a00613          	li	a2,10
    28d0:	07f00b13          	li	s6,127
    28d4:	01000513          	li	a0,16
    28d8:	0485ea63          	bltu	a1,s0,292c <__i_vfprintf+0x14c>
    28dc:	fe0d8693          	addi	a3,s11,-32
    28e0:	0ff6f693          	andi	a3,a3,255
    28e4:	04d56663          	bltu	a0,a3,2930 <__i_vfprintf+0x150>
    28e8:	00012783          	lw	a5,0(sp)
    28ec:	00269693          	slli	a3,a3,0x2
    28f0:	00f686b3          	add	a3,a3,a5
    28f4:	0006a683          	lw	a3,0(a3)
    28f8:	00068067          	jr	a3
    28fc:	00146413          	ori	s0,s0,1
    2900:	000bcd83          	lbu	s11,0(s7)
    2904:	001b8b93          	addi	s7,s7,1
    2908:	fc0d98e3          	bnez	s11,28d8 <__i_vfprintf+0xf8>
    290c:	0e00006f          	j	29ec <__i_vfprintf+0x20c>
    2910:	00246413          	ori	s0,s0,2
    2914:	00446413          	ori	s0,s0,4
    2918:	fe9ff06f          	j	2900 <__i_vfprintf+0x120>
    291c:	00846413          	ori	s0,s0,8
    2920:	fe1ff06f          	j	2900 <__i_vfprintf+0x120>
    2924:	01046413          	ori	s0,s0,16
    2928:	fd9ff06f          	j	2900 <__i_vfprintf+0x120>
    292c:	068b6c63          	bltu	s6,s0,29a4 <__i_vfprintf+0x1c4>
    2930:	fd0d8693          	addi	a3,s11,-48
    2934:	0ff6f693          	andi	a3,a3,255
    2938:	02dfe463          	bltu	t6,a3,2960 <__i_vfprintf+0x180>
    293c:	04047d93          	andi	s11,s0,64
    2940:	000d8863          	beqz	s11,2950 <__i_vfprintf+0x170>
    2944:	02cd0733          	mul	a4,s10,a2
    2948:	00d70d33          	add	s10,a4,a3
    294c:	fb5ff06f          	j	2900 <__i_vfprintf+0x120>
    2950:	02c90933          	mul	s2,s2,a2
    2954:	02046413          	ori	s0,s0,32
    2958:	00d90933          	add	s2,s2,a3
    295c:	fa5ff06f          	j	2900 <__i_vfprintf+0x120>
    2960:	025d9863          	bne	s11,t0,2990 <__i_vfprintf+0x1b0>
    2964:	04047d93          	andi	s11,s0,64
    2968:	0004a683          	lw	a3,0(s1)
    296c:	00448493          	addi	s1,s1,4
    2970:	0c0d9e63          	bnez	s11,2a4c <__i_vfprintf+0x26c>
    2974:	0006c863          	bltz	a3,2984 <__i_vfprintf+0x1a4>
    2978:	02046413          	ori	s0,s0,32
    297c:	00068913          	mv	s2,a3
    2980:	f81ff06f          	j	2900 <__i_vfprintf+0x120>
    2984:	40d00933          	neg	s2,a3
    2988:	02846413          	ori	s0,s0,40
    298c:	f75ff06f          	j	2900 <__i_vfprintf+0x120>
    2990:	007d9a63          	bne	s11,t2,29a4 <__i_vfprintf+0x1c4>
    2994:	04047693          	andi	a3,s0,64
    2998:	14069e63          	bnez	a3,2af4 <__i_vfprintf+0x314>
    299c:	04046413          	ori	s0,s0,64
    29a0:	f61ff06f          	j	2900 <__i_vfprintf+0x120>
    29a4:	010d9c63          	bne	s11,a6,29bc <__i_vfprintf+0x1dc>
    29a8:	08047693          	andi	a3,s0,128
    29ac:	00068463          	beqz	a3,29b4 <__i_vfprintf+0x1d4>
    29b0:	20046413          	ori	s0,s0,512
    29b4:	08046413          	ori	s0,s0,128
    29b8:	f49ff06f          	j	2900 <__i_vfprintf+0x120>
    29bc:	011d9c63          	bne	s11,a7,29d4 <__i_vfprintf+0x1f4>
    29c0:	10047693          	andi	a3,s0,256
    29c4:	00068463          	beqz	a3,29cc <__i_vfprintf+0x1ec>
    29c8:	20046413          	ori	s0,s0,512
    29cc:	10046413          	ori	s0,s0,256
    29d0:	f31ff06f          	j	2900 <__i_vfprintf+0x120>
    29d4:	006d9663          	bne	s11,t1,29e0 <__i_vfprintf+0x200>
    29d8:	28046413          	ori	s0,s0,640
    29dc:	f25ff06f          	j	2900 <__i_vfprintf+0x120>
    29e0:	ffcd8ce3          	beq	s11,t3,29d8 <__i_vfprintf+0x1f8>
    29e4:	f1dd8ee3          	beq	s11,t4,2900 <__i_vfprintf+0x120>
    29e8:	f1ed8ce3          	beq	s11,t5,2900 <__i_vfprintf+0x120>
    29ec:	000d5a63          	bgez	s10,2a00 <__i_vfprintf+0x220>
    29f0:	fbf47413          	andi	s0,s0,-65
    29f4:	01041413          	slli	s0,s0,0x10
    29f8:	01045413          	srli	s0,s0,0x10
    29fc:	00000d13          	li	s10,0
    2a00:	020de693          	ori	a3,s11,32
    2a04:	f9b68613          	addi	a2,a3,-101
    2a08:	0ff67613          	andi	a2,a2,255
    2a0c:	00200593          	li	a1,2
    2a10:	00c5f663          	bgeu	a1,a2,2a1c <__i_vfprintf+0x23c>
    2a14:	06100613          	li	a2,97
    2a18:	02c69e63          	bne	a3,a2,2a54 <__i_vfprintf+0x274>
    2a1c:	00748493          	addi	s1,s1,7
    2a20:	00412d83          	lw	s11,4(sp)
    2a24:	ff84f493          	andi	s1,s1,-8
    2a28:	00848493          	addi	s1,s1,8
    2a2c:	00700b13          	li	s6,7
    2a30:	00847413          	andi	s0,s0,8
    2a34:	08040e63          	beqz	s0,2ad0 <__i_vfprintf+0x2f0>
    2a38:	00000413          	li	s0,0
    2a3c:	008c07b3          	add	a5,s8,s0
    2a40:	088b1c63          	bne	s6,s0,2ad8 <__i_vfprintf+0x2f8>
    2a44:	41690933          	sub	s2,s2,s6
    2a48:	3800006f          	j	2dc8 <__i_vfprintf+0x5e8>
    2a4c:	00068d13          	mv	s10,a3
    2a50:	eb1ff06f          	j	2900 <__i_vfprintf+0x120>
    2a54:	06300613          	li	a2,99
    2a58:	00cd9e63          	bne	s11,a2,2a74 <__i_vfprintf+0x294>
    2a5c:	0004a703          	lw	a4,0(s1)
    2a60:	00100b13          	li	s6,1
    2a64:	00448493          	addi	s1,s1,4
    2a68:	00e10c23          	sb	a4,24(sp)
    2a6c:	000a8d93          	mv	s11,s5
    2a70:	fc1ff06f          	j	2a30 <__i_vfprintf+0x250>
    2a74:	07300613          	li	a2,115
    2a78:	0acd9e63          	bne	s11,a2,2b34 <__i_vfprintf+0x354>
    2a7c:	0004ad83          	lw	s11,0(s1)
    2a80:	00448c93          	addi	s9,s1,4
    2a84:	000d9463          	bnez	s11,2a8c <__i_vfprintf+0x2ac>
    2a88:	00812d83          	lw	s11,8(sp)
    2a8c:	04047693          	andi	a3,s0,64
    2a90:	fff00593          	li	a1,-1
    2a94:	00068463          	beqz	a3,2a9c <__i_vfprintf+0x2bc>
    2a98:	000d0593          	mv	a1,s10
    2a9c:	000d8513          	mv	a0,s11
    2aa0:	929ff0ef          	jal	ra,23c8 <strnlen>
    2aa4:	00050b13          	mv	s6,a0
    2aa8:	000c8493          	mv	s1,s9
    2aac:	f85ff06f          	j	2a30 <__i_vfprintf+0x250>
    2ab0:	00098593          	mv	a1,s3
    2ab4:	02000513          	li	a0,32
    2ab8:	000a00e7          	jalr	s4
    2abc:	02054a63          	bltz	a0,2af0 <__i_vfprintf+0x310>
    2ac0:	fff90913          	addi	s2,s2,-1
    2ac4:	41240c33          	sub	s8,s0,s2
    2ac8:	ff2b64e3          	bltu	s6,s2,2ab0 <__i_vfprintf+0x2d0>
    2acc:	f6dff06f          	j	2a38 <__i_vfprintf+0x258>
    2ad0:	012c0433          	add	s0,s8,s2
    2ad4:	ff1ff06f          	j	2ac4 <__i_vfprintf+0x2e4>
    2ad8:	008d87b3          	add	a5,s11,s0
    2adc:	0007c503          	lbu	a0,0(a5)
    2ae0:	00098593          	mv	a1,s3
    2ae4:	00140413          	addi	s0,s0,1
    2ae8:	000a00e7          	jalr	s4
    2aec:	f40558e3          	bgez	a0,2a3c <__i_vfprintf+0x25c>
    2af0:	fff00c13          	li	s8,-1
    2af4:	06c12083          	lw	ra,108(sp)
    2af8:	06812403          	lw	s0,104(sp)
    2afc:	06412483          	lw	s1,100(sp)
    2b00:	06012903          	lw	s2,96(sp)
    2b04:	05c12983          	lw	s3,92(sp)
    2b08:	05812a03          	lw	s4,88(sp)
    2b0c:	05412a83          	lw	s5,84(sp)
    2b10:	05012b03          	lw	s6,80(sp)
    2b14:	04c12b83          	lw	s7,76(sp)
    2b18:	04412c83          	lw	s9,68(sp)
    2b1c:	04012d03          	lw	s10,64(sp)
    2b20:	03c12d83          	lw	s11,60(sp)
    2b24:	000c0513          	mv	a0,s8
    2b28:	04812c03          	lw	s8,72(sp)
    2b2c:	07010113          	addi	sp,sp,112
    2b30:	00008067          	ret
    2b34:	06400613          	li	a2,100
    2b38:	00cd8663          	beq	s11,a2,2b44 <__i_vfprintf+0x364>
    2b3c:	06900613          	li	a2,105
    2b40:	0ccd9063          	bne	s11,a2,2c00 <__i_vfprintf+0x420>
    2b44:	08047693          	andi	a3,s0,128
    2b48:	08068463          	beqz	a3,2bd0 <__i_vfprintf+0x3f0>
    2b4c:	20047693          	andi	a3,s0,512
    2b50:	06068863          	beqz	a3,2bc0 <__i_vfprintf+0x3e0>
    2b54:	00748493          	addi	s1,s1,7
    2b58:	ff84f493          	andi	s1,s1,-8
    2b5c:	0004a503          	lw	a0,0(s1)
    2b60:	0044a583          	lw	a1,4(s1)
    2b64:	00848b13          	addi	s6,s1,8
    2b68:	0005dc63          	bgez	a1,2b80 <__i_vfprintf+0x3a0>
    2b6c:	00a03633          	snez	a2,a0
    2b70:	40b006b3          	neg	a3,a1
    2b74:	40c685b3          	sub	a1,a3,a2
    2b78:	40a00533          	neg	a0,a0
    2b7c:	40046413          	ori	s0,s0,1024
    2b80:	fef47813          	andi	a6,s0,-17
    2b84:	01081813          	slli	a6,a6,0x10
    2b88:	00b566b3          	or	a3,a0,a1
    2b8c:	01085813          	srli	a6,a6,0x10
    2b90:	00069a63          	bnez	a3,2ba4 <__i_vfprintf+0x3c4>
    2b94:	04047413          	andi	s0,s0,64
    2b98:	00040663          	beqz	s0,2ba4 <__i_vfprintf+0x3c4>
    2b9c:	00000c93          	li	s9,0
    2ba0:	160d0863          	beqz	s10,2d10 <__i_vfprintf+0x530>
    2ba4:	01012623          	sw	a6,12(sp)
    2ba8:	00a00693          	li	a3,10
    2bac:	000a8613          	mv	a2,s5
    2bb0:	b3dff0ef          	jal	ra,26ec <__ultoa_invert>
    2bb4:	00c12803          	lw	a6,12(sp)
    2bb8:	41550cb3          	sub	s9,a0,s5
    2bbc:	1540006f          	j	2d10 <__i_vfprintf+0x530>
    2bc0:	0004a503          	lw	a0,0(s1)
    2bc4:	00448b13          	addi	s6,s1,4
    2bc8:	41f55593          	srai	a1,a0,0x1f
    2bcc:	f9dff06f          	j	2b68 <__i_vfprintf+0x388>
    2bd0:	10047693          	andi	a3,s0,256
    2bd4:	0004a503          	lw	a0,0(s1)
    2bd8:	00448b13          	addi	s6,s1,4
    2bdc:	fe0686e3          	beqz	a3,2bc8 <__i_vfprintf+0x3e8>
    2be0:	20047693          	andi	a3,s0,512
    2be4:	00068863          	beqz	a3,2bf4 <__i_vfprintf+0x414>
    2be8:	01851513          	slli	a0,a0,0x18
    2bec:	41855513          	srai	a0,a0,0x18
    2bf0:	fd9ff06f          	j	2bc8 <__i_vfprintf+0x3e8>
    2bf4:	01051513          	slli	a0,a0,0x10
    2bf8:	41055513          	srai	a0,a0,0x10
    2bfc:	fcdff06f          	j	2bc8 <__i_vfprintf+0x3e8>
    2c00:	07500613          	li	a2,117
    2c04:	04cd9a63          	bne	s11,a2,2c58 <__i_vfprintf+0x478>
    2c08:	fef47413          	andi	s0,s0,-17
    2c0c:	01041413          	slli	s0,s0,0x10
    2c10:	01045413          	srli	s0,s0,0x10
    2c14:	00a00693          	li	a3,10
    2c18:	08047613          	andi	a2,s0,128
    2c1c:	0a060663          	beqz	a2,2cc8 <__i_vfprintf+0x4e8>
    2c20:	20047613          	andi	a2,s0,512
    2c24:	08060a63          	beqz	a2,2cb8 <__i_vfprintf+0x4d8>
    2c28:	00748493          	addi	s1,s1,7
    2c2c:	ff84f493          	andi	s1,s1,-8
    2c30:	0004a503          	lw	a0,0(s1)
    2c34:	0044a583          	lw	a1,4(s1)
    2c38:	00848b13          	addi	s6,s1,8
    2c3c:	00b56633          	or	a2,a0,a1
    2c40:	0a060a63          	beqz	a2,2cf4 <__i_vfprintf+0x514>
    2c44:	ff947413          	andi	s0,s0,-7
    2c48:	01041813          	slli	a6,s0,0x10
    2c4c:	01085813          	srli	a6,a6,0x10
    2c50:	01012623          	sw	a6,12(sp)
    2c54:	f59ff06f          	j	2bac <__i_vfprintf+0x3cc>
    2c58:	06f00613          	li	a2,111
    2c5c:	04cd8863          	beq	s11,a2,2cac <__i_vfprintf+0x4cc>
    2c60:	07000613          	li	a2,112
    2c64:	00cd9a63          	bne	s11,a2,2c78 <__i_vfprintf+0x498>
    2c68:	01046413          	ori	s0,s0,16
    2c6c:	01000693          	li	a3,16
    2c70:	07800d93          	li	s11,120
    2c74:	fa5ff06f          	j	2c18 <__i_vfprintf+0x438>
    2c78:	07800613          	li	a2,120
    2c7c:	00c69c63          	bne	a3,a2,2c94 <__i_vfprintf+0x4b4>
    2c80:	05800613          	li	a2,88
    2c84:	01000693          	li	a3,16
    2c88:	f8cd98e3          	bne	s11,a2,2c18 <__i_vfprintf+0x438>
    2c8c:	21000693          	li	a3,528
    2c90:	f89ff06f          	j	2c18 <__i_vfprintf+0x438>
    2c94:	00098593          	mv	a1,s3
    2c98:	02500513          	li	a0,37
    2c9c:	000a00e7          	jalr	s4
    2ca0:	e40548e3          	bltz	a0,2af0 <__i_vfprintf+0x310>
    2ca4:	002c0c13          	addi	s8,s8,2
    2ca8:	bd9ff06f          	j	2880 <__i_vfprintf+0xa0>
    2cac:	00800693          	li	a3,8
    2cb0:	00000d93          	li	s11,0
    2cb4:	f65ff06f          	j	2c18 <__i_vfprintf+0x438>
    2cb8:	0004a503          	lw	a0,0(s1)
    2cbc:	00448b13          	addi	s6,s1,4
    2cc0:	00000593          	li	a1,0
    2cc4:	f79ff06f          	j	2c3c <__i_vfprintf+0x45c>
    2cc8:	10047613          	andi	a2,s0,256
    2ccc:	0004a503          	lw	a0,0(s1)
    2cd0:	00448b13          	addi	s6,s1,4
    2cd4:	fe0606e3          	beqz	a2,2cc0 <__i_vfprintf+0x4e0>
    2cd8:	20047613          	andi	a2,s0,512
    2cdc:	00060663          	beqz	a2,2ce8 <__i_vfprintf+0x508>
    2ce0:	0ff57513          	andi	a0,a0,255
    2ce4:	fddff06f          	j	2cc0 <__i_vfprintf+0x4e0>
    2ce8:	01051513          	slli	a0,a0,0x10
    2cec:	01055513          	srli	a0,a0,0x10
    2cf0:	fd1ff06f          	j	2cc0 <__i_vfprintf+0x4e0>
    2cf4:	fe947813          	andi	a6,s0,-23
    2cf8:	01081813          	slli	a6,a6,0x10
    2cfc:	04047413          	andi	s0,s0,64
    2d00:	01085813          	srli	a6,a6,0x10
    2d04:	f40406e3          	beqz	s0,2c50 <__i_vfprintf+0x470>
    2d08:	00000c93          	li	s9,0
    2d0c:	f40d12e3          	bnez	s10,2c50 <__i_vfprintf+0x470>
    2d10:	04087693          	andi	a3,a6,64
    2d14:	04068063          	beqz	a3,2d54 <__i_vfprintf+0x574>
    2d18:	ffe87413          	andi	s0,a6,-2
    2d1c:	01041413          	slli	s0,s0,0x10
    2d20:	01045413          	srli	s0,s0,0x10
    2d24:	000c8493          	mv	s1,s9
    2d28:	01acdc63          	bge	s9,s10,2d40 <__i_vfprintf+0x560>
    2d2c:	000d0493          	mv	s1,s10
    2d30:	000d9863          	bnez	s11,2d40 <__i_vfprintf+0x560>
    2d34:	fee87413          	andi	s0,a6,-18
    2d38:	01041413          	slli	s0,s0,0x10
    2d3c:	01045413          	srli	s0,s0,0x10
    2d40:	01047693          	andi	a3,s0,16
    2d44:	08068863          	beqz	a3,2dd4 <__i_vfprintf+0x5f4>
    2d48:	000d9c63          	bnez	s11,2d60 <__i_vfprintf+0x580>
    2d4c:	00148493          	addi	s1,s1,1
    2d50:	0140006f          	j	2d64 <__i_vfprintf+0x584>
    2d54:	000c8493          	mv	s1,s9
    2d58:	00080413          	mv	s0,a6
    2d5c:	fe5ff06f          	j	2d40 <__i_vfprintf+0x560>
    2d60:	00248493          	addi	s1,s1,2
    2d64:	00847593          	andi	a1,s0,8
    2d68:	02059063          	bnez	a1,2d88 <__i_vfprintf+0x5a8>
    2d6c:	00147593          	andi	a1,s0,1
    2d70:	08058e63          	beqz	a1,2e0c <__i_vfprintf+0x62c>
    2d74:	000c8d13          	mv	s10,s9
    2d78:	0124d863          	bge	s1,s2,2d88 <__i_vfprintf+0x5a8>
    2d7c:	409904b3          	sub	s1,s2,s1
    2d80:	01948d33          	add	s10,s1,s9
    2d84:	00090493          	mv	s1,s2
    2d88:	0a068263          	beqz	a3,2e2c <__i_vfprintf+0x64c>
    2d8c:	00098593          	mv	a1,s3
    2d90:	03000513          	li	a0,48
    2d94:	000a00e7          	jalr	s4
    2d98:	d4054ce3          	bltz	a0,2af0 <__i_vfprintf+0x310>
    2d9c:	060d9c63          	bnez	s11,2e14 <__i_vfprintf+0x634>
    2da0:	001c0c13          	addi	s8,s8,1
    2da4:	01ac0db3          	add	s11,s8,s10
    2da8:	418d8733          	sub	a4,s11,s8
    2dac:	0aecc863          	blt	s9,a4,2e5c <__i_vfprintf+0x67c>
    2db0:	000c8413          	mv	s0,s9
    2db4:	018c8db3          	add	s11,s9,s8
    2db8:	408d87b3          	sub	a5,s11,s0
    2dbc:	0a041c63          	bnez	s0,2e74 <__i_vfprintf+0x694>
    2dc0:	40990933          	sub	s2,s2,s1
    2dc4:	000b0493          	mv	s1,s6
    2dc8:	00078c13          	mv	s8,a5
    2dcc:	00f90933          	add	s2,s2,a5
    2dd0:	0d40006f          	j	2ea4 <__i_vfprintf+0x6c4>
    2dd4:	40647593          	andi	a1,s0,1030
    2dd8:	f80586e3          	beqz	a1,2d64 <__i_vfprintf+0x584>
    2ddc:	f71ff06f          	j	2d4c <__i_vfprintf+0x56c>
    2de0:	00098593          	mv	a1,s3
    2de4:	02000513          	li	a0,32
    2de8:	00d12623          	sw	a3,12(sp)
    2dec:	000a00e7          	jalr	s4
    2df0:	d00540e3          	bltz	a0,2af0 <__i_vfprintf+0x310>
    2df4:	00c12683          	lw	a3,12(sp)
    2df8:	00148493          	addi	s1,s1,1
    2dfc:	009c07b3          	add	a5,s8,s1
    2e00:	ff24c0e3          	blt	s1,s2,2de0 <__i_vfprintf+0x600>
    2e04:	00078c13          	mv	s8,a5
    2e08:	f81ff06f          	j	2d88 <__i_vfprintf+0x5a8>
    2e0c:	409c0c33          	sub	s8,s8,s1
    2e10:	fedff06f          	j	2dfc <__i_vfprintf+0x61c>
    2e14:	002c0c13          	addi	s8,s8,2
    2e18:	00098593          	mv	a1,s3
    2e1c:	000d8513          	mv	a0,s11
    2e20:	000a00e7          	jalr	s4
    2e24:	f80550e3          	bgez	a0,2da4 <__i_vfprintf+0x5c4>
    2e28:	cc9ff06f          	j	2af0 <__i_vfprintf+0x310>
    2e2c:	40647693          	andi	a3,s0,1030
    2e30:	f6068ae3          	beqz	a3,2da4 <__i_vfprintf+0x5c4>
    2e34:	00247693          	andi	a3,s0,2
    2e38:	02000513          	li	a0,32
    2e3c:	00068463          	beqz	a3,2e44 <__i_vfprintf+0x664>
    2e40:	02b00513          	li	a0,43
    2e44:	40047813          	andi	a6,s0,1024
    2e48:	00080463          	beqz	a6,2e50 <__i_vfprintf+0x670>
    2e4c:	02d00513          	li	a0,45
    2e50:	001c0c13          	addi	s8,s8,1
    2e54:	00098593          	mv	a1,s3
    2e58:	fc9ff06f          	j	2e20 <__i_vfprintf+0x640>
    2e5c:	00098593          	mv	a1,s3
    2e60:	03000513          	li	a0,48
    2e64:	001c0c13          	addi	s8,s8,1
    2e68:	000a00e7          	jalr	s4
    2e6c:	f2055ee3          	bgez	a0,2da8 <__i_vfprintf+0x5c8>
    2e70:	c81ff06f          	j	2af0 <__i_vfprintf+0x310>
    2e74:	fff40413          	addi	s0,s0,-1
    2e78:	008a87b3          	add	a5,s5,s0
    2e7c:	0007c503          	lbu	a0,0(a5)
    2e80:	00098593          	mv	a1,s3
    2e84:	000a00e7          	jalr	s4
    2e88:	f20558e3          	bgez	a0,2db8 <__i_vfprintf+0x5d8>
    2e8c:	c65ff06f          	j	2af0 <__i_vfprintf+0x310>
    2e90:	00098593          	mv	a1,s3
    2e94:	02000513          	li	a0,32
    2e98:	001c0c13          	addi	s8,s8,1
    2e9c:	000a00e7          	jalr	s4
    2ea0:	c40548e3          	bltz	a0,2af0 <__i_vfprintf+0x310>
    2ea4:	41890733          	sub	a4,s2,s8
    2ea8:	fee044e3          	bgtz	a4,2e90 <__i_vfprintf+0x6b0>
    2eac:	9e5ff06f          	j	2890 <__i_vfprintf+0xb0>

00002eb0 <litex_getc>:
    2eb0:	ff010113          	addi	sp,sp,-16
    2eb4:	00112623          	sw	ra,12(sp)
    2eb8:	30c010ef          	jal	ra,41c4 <uart_read_nonblock>
    2ebc:	fe050ee3          	beqz	a0,2eb8 <litex_getc+0x8>
    2ec0:	2b0010ef          	jal	ra,4170 <uart_read>
    2ec4:	00c12083          	lw	ra,12(sp)
    2ec8:	01010113          	addi	sp,sp,16
    2ecc:	00008067          	ret

00002ed0 <litex_putc>:
    2ed0:	ff010113          	addi	sp,sp,-16
    2ed4:	00812423          	sw	s0,8(sp)
    2ed8:	00112623          	sw	ra,12(sp)
    2edc:	00050413          	mv	s0,a0
    2ee0:	300010ef          	jal	ra,41e0 <uart_write>
    2ee4:	00a00793          	li	a5,10
    2ee8:	00f41863          	bne	s0,a5,2ef8 <litex_putc+0x28>
    2eec:	00000593          	li	a1,0
    2ef0:	00d00513          	li	a0,13
    2ef4:	fddff0ef          	jal	ra,2ed0 <litex_putc>
    2ef8:	00c12083          	lw	ra,12(sp)
    2efc:	00040513          	mv	a0,s0
    2f00:	00812403          	lw	s0,8(sp)
    2f04:	01010113          	addi	sp,sp,16
    2f08:	00008067          	ret

00002f0c <__divdi3>:
    2f0c:	41f5d893          	srai	a7,a1,0x1f
    2f10:	41f6d313          	srai	t1,a3,0x1f
    2f14:	00664733          	xor	a4,a2,t1
    2f18:	011547b3          	xor	a5,a0,a7
    2f1c:	40670633          	sub	a2,a4,t1
    2f20:	0115c5b3          	xor	a1,a1,a7
    2f24:	0066c6b3          	xor	a3,a3,t1
    2f28:	41178533          	sub	a0,a5,a7
    2f2c:	00c73833          	sltu	a6,a4,a2
    2f30:	00a7b7b3          	sltu	a5,a5,a0
    2f34:	406686b3          	sub	a3,a3,t1
    2f38:	411585b3          	sub	a1,a1,a7
    2f3c:	ff010113          	addi	sp,sp,-16
    2f40:	40f585b3          	sub	a1,a1,a5
    2f44:	00000713          	li	a4,0
    2f48:	410686b3          	sub	a3,a3,a6
    2f4c:	00812423          	sw	s0,8(sp)
    2f50:	00112623          	sw	ra,12(sp)
    2f54:	0068c433          	xor	s0,a7,t1
    2f58:	02c000ef          	jal	ra,2f84 <__udivmoddi4>
    2f5c:	00a447b3          	xor	a5,s0,a0
    2f60:	00b445b3          	xor	a1,s0,a1
    2f64:	40878533          	sub	a0,a5,s0
    2f68:	00c12083          	lw	ra,12(sp)
    2f6c:	408585b3          	sub	a1,a1,s0
    2f70:	00812403          	lw	s0,8(sp)
    2f74:	00a7b7b3          	sltu	a5,a5,a0
    2f78:	40f585b3          	sub	a1,a1,a5
    2f7c:	01010113          	addi	sp,sp,16
    2f80:	00008067          	ret

00002f84 <__udivmoddi4>:
    2f84:	fe010113          	addi	sp,sp,-32
    2f88:	00812c23          	sw	s0,24(sp)
    2f8c:	01212823          	sw	s2,16(sp)
    2f90:	01312623          	sw	s3,12(sp)
    2f94:	01412423          	sw	s4,8(sp)
    2f98:	01512223          	sw	s5,4(sp)
    2f9c:	00112e23          	sw	ra,28(sp)
    2fa0:	00912a23          	sw	s1,20(sp)
    2fa4:	00050413          	mv	s0,a0
    2fa8:	00058a93          	mv	s5,a1
    2fac:	00060a13          	mv	s4,a2
    2fb0:	00068993          	mv	s3,a3
    2fb4:	00070913          	mv	s2,a4
    2fb8:	02059c63          	bnez	a1,2ff0 <__udivmoddi4+0x6c>
    2fbc:	02069063          	bnez	a3,2fdc <__udivmoddi4+0x58>
    2fc0:	00070863          	beqz	a4,2fd0 <__udivmoddi4+0x4c>
    2fc4:	02c577b3          	remu	a5,a0,a2
    2fc8:	00072223          	sw	zero,4(a4)
    2fcc:	00f72023          	sw	a5,0(a4)
    2fd0:	03445433          	divu	s0,s0,s4
    2fd4:	00000a93          	li	s5,0
    2fd8:	1100006f          	j	30e8 <__udivmoddi4+0x164>
    2fdc:	00070663          	beqz	a4,2fe8 <__udivmoddi4+0x64>
    2fe0:	00a92023          	sw	a0,0(s2)
    2fe4:	00072223          	sw	zero,4(a4)
    2fe8:	00000413          	li	s0,0
    2fec:	0fc0006f          	j	30e8 <__udivmoddi4+0x164>
    2ff0:	0a061863          	bnez	a2,30a0 <__udivmoddi4+0x11c>
    2ff4:	00069463          	bnez	a3,2ffc <__udivmoddi4+0x78>
    2ff8:	00100073          	ebreak
    2ffc:	00051e63          	bnez	a0,3018 <__udivmoddi4+0x94>
    3000:	00070863          	beqz	a4,3010 <__udivmoddi4+0x8c>
    3004:	02d5f7b3          	remu	a5,a1,a3
    3008:	00072023          	sw	zero,0(a4)
    300c:	00f72223          	sw	a5,4(a4)
    3010:	033ad433          	divu	s0,s5,s3
    3014:	fc1ff06f          	j	2fd4 <__udivmoddi4+0x50>
    3018:	fff68793          	addi	a5,a3,-1
    301c:	00d7f733          	and	a4,a5,a3
    3020:	02071263          	bnez	a4,3044 <__udivmoddi4+0xc0>
    3024:	00090863          	beqz	s2,3034 <__udivmoddi4+0xb0>
    3028:	00b7f7b3          	and	a5,a5,a1
    302c:	00a92023          	sw	a0,0(s2)
    3030:	00f92223          	sw	a5,4(s2)
    3034:	00098513          	mv	a0,s3
    3038:	2cc000ef          	jal	ra,3304 <__ctzsi2>
    303c:	00aad433          	srl	s0,s5,a0
    3040:	f95ff06f          	j	2fd4 <__udivmoddi4+0x50>
    3044:	00068513          	mv	a0,a3
    3048:	224000ef          	jal	ra,326c <__clzsi2>
    304c:	00050493          	mv	s1,a0
    3050:	000a8513          	mv	a0,s5
    3054:	218000ef          	jal	ra,326c <__clzsi2>
    3058:	40a48533          	sub	a0,s1,a0
    305c:	01e00793          	li	a5,30
    3060:	00a7fc63          	bgeu	a5,a0,3078 <__udivmoddi4+0xf4>
    3064:	00090663          	beqz	s2,3070 <__udivmoddi4+0xec>
    3068:	00892023          	sw	s0,0(s2)
    306c:	01592223          	sw	s5,4(s2)
    3070:	00000413          	li	s0,0
    3074:	f61ff06f          	j	2fd4 <__udivmoddi4+0x50>
    3078:	00150613          	addi	a2,a0,1
    307c:	02000693          	li	a3,32
    3080:	40c686b3          	sub	a3,a3,a2
    3084:	00000313          	li	t1,0
    3088:	00d41833          	sll	a6,s0,a3
    308c:	00cade33          	srl	t3,s5,a2
    3090:	00da95b3          	sll	a1,s5,a3
    3094:	00c45433          	srl	s0,s0,a2
    3098:	0085e7b3          	or	a5,a1,s0
    309c:	0e40006f          	j	3180 <__udivmoddi4+0x1fc>
    30a0:	16069c63          	bnez	a3,3218 <__udivmoddi4+0x294>
    30a4:	fff60793          	addi	a5,a2,-1
    30a8:	00c7f733          	and	a4,a5,a2
    30ac:	06071463          	bnez	a4,3114 <__udivmoddi4+0x190>
    30b0:	00090863          	beqz	s2,30c0 <__udivmoddi4+0x13c>
    30b4:	00a7f7b3          	and	a5,a5,a0
    30b8:	00f92023          	sw	a5,0(s2)
    30bc:	00092223          	sw	zero,4(s2)
    30c0:	00100793          	li	a5,1
    30c4:	02fa0263          	beq	s4,a5,30e8 <__udivmoddi4+0x164>
    30c8:	000a0513          	mv	a0,s4
    30cc:	238000ef          	jal	ra,3304 <__ctzsi2>
    30d0:	02000793          	li	a5,32
    30d4:	40a787b3          	sub	a5,a5,a0
    30d8:	00fa97b3          	sll	a5,s5,a5
    30dc:	00a45433          	srl	s0,s0,a0
    30e0:	0087e433          	or	s0,a5,s0
    30e4:	00aadab3          	srl	s5,s5,a0
    30e8:	01c12083          	lw	ra,28(sp)
    30ec:	00040513          	mv	a0,s0
    30f0:	01812403          	lw	s0,24(sp)
    30f4:	01412483          	lw	s1,20(sp)
    30f8:	01012903          	lw	s2,16(sp)
    30fc:	00c12983          	lw	s3,12(sp)
    3100:	00812a03          	lw	s4,8(sp)
    3104:	000a8593          	mv	a1,s5
    3108:	00412a83          	lw	s5,4(sp)
    310c:	02010113          	addi	sp,sp,32
    3110:	00008067          	ret
    3114:	00060513          	mv	a0,a2
    3118:	154000ef          	jal	ra,326c <__clzsi2>
    311c:	00050493          	mv	s1,a0
    3120:	000a8513          	mv	a0,s5
    3124:	148000ef          	jal	ra,326c <__clzsi2>
    3128:	40a487b3          	sub	a5,s1,a0
    312c:	02178613          	addi	a2,a5,33
    3130:	02000713          	li	a4,32
    3134:	00000313          	li	t1,0
    3138:	10e60863          	beq	a2,a4,3248 <__udivmoddi4+0x2c4>
    313c:	01f00693          	li	a3,31
    3140:	00c6ee63          	bltu	a3,a2,315c <__udivmoddi4+0x1d8>
    3144:	40c70733          	sub	a4,a4,a2
    3148:	00000313          	li	t1,0
    314c:	00e41833          	sll	a6,s0,a4
    3150:	00cade33          	srl	t3,s5,a2
    3154:	00ea95b3          	sll	a1,s5,a4
    3158:	f3dff06f          	j	3094 <__udivmoddi4+0x110>
    315c:	04000893          	li	a7,64
    3160:	40c888b3          	sub	a7,a7,a2
    3164:	00178793          	addi	a5,a5,1
    3168:	01141333          	sll	t1,s0,a7
    316c:	00f45433          	srl	s0,s0,a5
    3170:	011a98b3          	sll	a7,s5,a7
    3174:	0088e833          	or	a6,a7,s0
    3178:	00000e13          	li	t3,0
    317c:	00fad7b3          	srl	a5,s5,a5
    3180:	00000513          	li	a0,0
    3184:	01f7d693          	srli	a3,a5,0x1f
    3188:	001e1713          	slli	a4,t3,0x1
    318c:	00d76e33          	or	t3,a4,a3
    3190:	00179793          	slli	a5,a5,0x1
    3194:	01f85713          	srli	a4,a6,0x1f
    3198:	00e7e7b3          	or	a5,a5,a4
    319c:	fff7c693          	not	a3,a5
    31a0:	01f35713          	srli	a4,t1,0x1f
    31a4:	00181813          	slli	a6,a6,0x1
    31a8:	00131413          	slli	s0,t1,0x1
    31ac:	00e86833          	or	a6,a6,a4
    31b0:	00a46333          	or	t1,s0,a0
    31b4:	fffe4713          	not	a4,t3
    31b8:	01468533          	add	a0,a3,s4
    31bc:	00d53533          	sltu	a0,a0,a3
    31c0:	01370733          	add	a4,a4,s3
    31c4:	00e50533          	add	a0,a0,a4
    31c8:	41f55713          	srai	a4,a0,0x1f
    31cc:	014776b3          	and	a3,a4,s4
    31d0:	40d786b3          	sub	a3,a5,a3
    31d4:	01377733          	and	a4,a4,s3
    31d8:	00d7b5b3          	sltu	a1,a5,a3
    31dc:	40ee0733          	sub	a4,t3,a4
    31e0:	fff60613          	addi	a2,a2,-1
    31e4:	01f55513          	srli	a0,a0,0x1f
    31e8:	00068793          	mv	a5,a3
    31ec:	40b70e33          	sub	t3,a4,a1
    31f0:	f8061ae3          	bnez	a2,3184 <__udivmoddi4+0x200>
    31f4:	01f35593          	srli	a1,t1,0x1f
    31f8:	00181813          	slli	a6,a6,0x1
    31fc:	00131413          	slli	s0,t1,0x1
    3200:	00a46433          	or	s0,s0,a0
    3204:	0105eab3          	or	s5,a1,a6
    3208:	ee0900e3          	beqz	s2,30e8 <__udivmoddi4+0x164>
    320c:	00d92023          	sw	a3,0(s2)
    3210:	01c92223          	sw	t3,4(s2)
    3214:	ed5ff06f          	j	30e8 <__udivmoddi4+0x164>
    3218:	00068513          	mv	a0,a3
    321c:	050000ef          	jal	ra,326c <__clzsi2>
    3220:	00050493          	mv	s1,a0
    3224:	000a8513          	mv	a0,s5
    3228:	044000ef          	jal	ra,326c <__clzsi2>
    322c:	40a48533          	sub	a0,s1,a0
    3230:	01f00793          	li	a5,31
    3234:	e2a7e8e3          	bltu	a5,a0,3064 <__udivmoddi4+0xe0>
    3238:	00150613          	addi	a2,a0,1
    323c:	02000893          	li	a7,32
    3240:	00000313          	li	t1,0
    3244:	01161a63          	bne	a2,a7,3258 <__udivmoddi4+0x2d4>
    3248:	00040813          	mv	a6,s0
    324c:	00000e13          	li	t3,0
    3250:	000a8793          	mv	a5,s5
    3254:	f2dff06f          	j	3180 <__udivmoddi4+0x1fc>
    3258:	40c888b3          	sub	a7,a7,a2
    325c:	01141833          	sll	a6,s0,a7
    3260:	00cade33          	srl	t3,s5,a2
    3264:	011a95b3          	sll	a1,s5,a7
    3268:	e2dff06f          	j	3094 <__udivmoddi4+0x110>

0000326c <__clzsi2>:
    326c:	ffff0737          	lui	a4,0xffff0
    3270:	00e57733          	and	a4,a0,a4
    3274:	00173713          	seqz	a4,a4
    3278:	00471713          	slli	a4,a4,0x4
    327c:	01000793          	li	a5,16
    3280:	40e787b3          	sub	a5,a5,a4
    3284:	00f557b3          	srl	a5,a0,a5
    3288:	00010537          	lui	a0,0x10
    328c:	f0050513          	addi	a0,a0,-256 # ff00 <_edata_rom+0x7724>
    3290:	00a7f533          	and	a0,a5,a0
    3294:	00153513          	seqz	a0,a0
    3298:	00351513          	slli	a0,a0,0x3
    329c:	00800693          	li	a3,8
    32a0:	40a686b3          	sub	a3,a3,a0
    32a4:	00d7d7b3          	srl	a5,a5,a3
    32a8:	0f07f693          	andi	a3,a5,240
    32ac:	0016b693          	seqz	a3,a3
    32b0:	00269693          	slli	a3,a3,0x2
    32b4:	00e50533          	add	a0,a0,a4
    32b8:	00400713          	li	a4,4
    32bc:	40d70733          	sub	a4,a4,a3
    32c0:	00e7d7b3          	srl	a5,a5,a4
    32c4:	00a68533          	add	a0,a3,a0
    32c8:	00c7f693          	andi	a3,a5,12
    32cc:	0016b693          	seqz	a3,a3
    32d0:	00169693          	slli	a3,a3,0x1
    32d4:	00200613          	li	a2,2
    32d8:	40d60733          	sub	a4,a2,a3
    32dc:	00e7d7b3          	srl	a5,a5,a4
    32e0:	0017d713          	srli	a4,a5,0x1
    32e4:	00174713          	xori	a4,a4,1
    32e8:	00177713          	andi	a4,a4,1
    32ec:	40e00733          	neg	a4,a4
    32f0:	40f607b3          	sub	a5,a2,a5
    32f4:	00f777b3          	and	a5,a4,a5
    32f8:	00a68533          	add	a0,a3,a0
    32fc:	00a78533          	add	a0,a5,a0
    3300:	00008067          	ret

00003304 <__ctzsi2>:
    3304:	01051693          	slli	a3,a0,0x10
    3308:	0106d693          	srli	a3,a3,0x10
    330c:	0016b693          	seqz	a3,a3
    3310:	00469693          	slli	a3,a3,0x4
    3314:	00d557b3          	srl	a5,a0,a3
    3318:	0ff7f713          	andi	a4,a5,255
    331c:	00173713          	seqz	a4,a4
    3320:	00371713          	slli	a4,a4,0x3
    3324:	00e7d7b3          	srl	a5,a5,a4
    3328:	00d706b3          	add	a3,a4,a3
    332c:	00f7f713          	andi	a4,a5,15
    3330:	00173713          	seqz	a4,a4
    3334:	00271713          	slli	a4,a4,0x2
    3338:	00e7d7b3          	srl	a5,a5,a4
    333c:	00d706b3          	add	a3,a4,a3
    3340:	0037f713          	andi	a4,a5,3
    3344:	00173713          	seqz	a4,a4
    3348:	00171713          	slli	a4,a4,0x1
    334c:	00e7d7b3          	srl	a5,a5,a4
    3350:	0017d513          	srli	a0,a5,0x1
    3354:	fff7c793          	not	a5,a5
    3358:	00157613          	andi	a2,a0,1
    335c:	0017f793          	andi	a5,a5,1
    3360:	00200513          	li	a0,2
    3364:	40c50533          	sub	a0,a0,a2
    3368:	40f007b3          	neg	a5,a5
    336c:	00f57533          	and	a0,a0,a5
    3370:	00d70733          	add	a4,a4,a3
    3374:	00e50533          	add	a0,a0,a4
    3378:	00008067          	ret

0000337c <__udivdi3>:
    337c:	00000713          	li	a4,0
    3380:	c05ff06f          	j	2f84 <__udivmoddi4>

00003384 <__umoddi3>:
    3384:	fe010113          	addi	sp,sp,-32
    3388:	00810713          	addi	a4,sp,8
    338c:	00112e23          	sw	ra,28(sp)
    3390:	bf5ff0ef          	jal	ra,2f84 <__udivmoddi4>
    3394:	01c12083          	lw	ra,28(sp)
    3398:	00812503          	lw	a0,8(sp)
    339c:	00c12583          	lw	a1,12(sp)
    33a0:	02010113          	addi	sp,sp,32
    33a4:	00008067          	ret

000033a8 <__moddi3>:
    33a8:	fe010113          	addi	sp,sp,-32
    33ac:	00812c23          	sw	s0,24(sp)
    33b0:	41f6d893          	srai	a7,a3,0x1f
    33b4:	41f5d413          	srai	s0,a1,0x1f
    33b8:	01164733          	xor	a4,a2,a7
    33bc:	008547b3          	xor	a5,a0,s0
    33c0:	41170633          	sub	a2,a4,a7
    33c4:	40878533          	sub	a0,a5,s0
    33c8:	0116c6b3          	xor	a3,a3,a7
    33cc:	0085c5b3          	xor	a1,a1,s0
    33d0:	00c73833          	sltu	a6,a4,a2
    33d4:	00a7b7b3          	sltu	a5,a5,a0
    33d8:	411686b3          	sub	a3,a3,a7
    33dc:	408585b3          	sub	a1,a1,s0
    33e0:	00810713          	addi	a4,sp,8
    33e4:	40f585b3          	sub	a1,a1,a5
    33e8:	410686b3          	sub	a3,a3,a6
    33ec:	00112e23          	sw	ra,28(sp)
    33f0:	b95ff0ef          	jal	ra,2f84 <__udivmoddi4>
    33f4:	00812583          	lw	a1,8(sp)
    33f8:	00c12783          	lw	a5,12(sp)
    33fc:	01c12083          	lw	ra,28(sp)
    3400:	0085c5b3          	xor	a1,a1,s0
    3404:	40858533          	sub	a0,a1,s0
    3408:	0087c7b3          	xor	a5,a5,s0
    340c:	40878433          	sub	s0,a5,s0
    3410:	00a5b5b3          	sltu	a1,a1,a0
    3414:	40b405b3          	sub	a1,s0,a1
    3418:	01812403          	lw	s0,24(sp)
    341c:	02010113          	addi	sp,sp,32
    3420:	00008067          	ret

00003424 <crc16>:
    3424:	00050713          	mv	a4,a0
    3428:	000076b7          	lui	a3,0x7
    342c:	00000513          	li	a0,0
    3430:	00b705b3          	add	a1,a4,a1
    3434:	68c68693          	addi	a3,a3,1676 # 768c <crc16_table>
    3438:	40e587b3          	sub	a5,a1,a4
    343c:	00f04463          	bgtz	a5,3444 <crc16+0x20>
    3440:	00008067          	ret
    3444:	00074603          	lbu	a2,0(a4) # ffff0000 <_fstack+0xeffef000>
    3448:	00855793          	srli	a5,a0,0x8
    344c:	00170713          	addi	a4,a4,1
    3450:	00c7c7b3          	xor	a5,a5,a2
    3454:	00279793          	slli	a5,a5,0x2
    3458:	00f687b3          	add	a5,a3,a5
    345c:	0007d603          	lhu	a2,0(a5)
    3460:	00851793          	slli	a5,a0,0x8
    3464:	01079793          	slli	a5,a5,0x10
    3468:	0107d793          	srli	a5,a5,0x10
    346c:	00f64533          	xor	a0,a2,a5
    3470:	fc9ff06f          	j	3438 <crc16+0x14>

00003474 <crc32>:
    3474:	000086b7          	lui	a3,0x8
    3478:	00050713          	mv	a4,a0
    347c:	fff00793          	li	a5,-1
    3480:	00b508b3          	add	a7,a0,a1
    3484:	00700813          	li	a6,7
    3488:	a8c68693          	addi	a3,a3,-1396 # 7a8c <crc_table>
    348c:	40e88633          	sub	a2,a7,a4
    3490:	04c86e63          	bltu	a6,a2,34ec <crc32+0x78>
    3494:	0035d693          	srli	a3,a1,0x3
    3498:	ff800613          	li	a2,-8
    349c:	02c686b3          	mul	a3,a3,a2
    34a0:	ff85f713          	andi	a4,a1,-8
    34a4:	00e50733          	add	a4,a0,a4
    34a8:	00b685b3          	add	a1,a3,a1
    34ac:	02058c63          	beqz	a1,34e4 <crc32+0x70>
    34b0:	00008637          	lui	a2,0x8
    34b4:	00b705b3          	add	a1,a4,a1
    34b8:	a8c60613          	addi	a2,a2,-1396 # 7a8c <crc_table>
    34bc:	00074683          	lbu	a3,0(a4)
    34c0:	00170713          	addi	a4,a4,1
    34c4:	00f6c6b3          	xor	a3,a3,a5
    34c8:	0ff6f693          	andi	a3,a3,255
    34cc:	00269693          	slli	a3,a3,0x2
    34d0:	00d606b3          	add	a3,a2,a3
    34d4:	0006a683          	lw	a3,0(a3)
    34d8:	0087d793          	srli	a5,a5,0x8
    34dc:	00f6c7b3          	xor	a5,a3,a5
    34e0:	fcb71ee3          	bne	a4,a1,34bc <crc32+0x48>
    34e4:	fff7c513          	not	a0,a5
    34e8:	00008067          	ret
    34ec:	00074603          	lbu	a2,0(a4)
    34f0:	00870713          	addi	a4,a4,8
    34f4:	00f64633          	xor	a2,a2,a5
    34f8:	0ff67613          	andi	a2,a2,255
    34fc:	00261613          	slli	a2,a2,0x2
    3500:	00c68633          	add	a2,a3,a2
    3504:	00062603          	lw	a2,0(a2)
    3508:	0087d793          	srli	a5,a5,0x8
    350c:	00f647b3          	xor	a5,a2,a5
    3510:	ff974603          	lbu	a2,-7(a4)
    3514:	00f64633          	xor	a2,a2,a5
    3518:	0ff67613          	andi	a2,a2,255
    351c:	00261613          	slli	a2,a2,0x2
    3520:	00c68633          	add	a2,a3,a2
    3524:	00062603          	lw	a2,0(a2)
    3528:	0087d793          	srli	a5,a5,0x8
    352c:	00f64633          	xor	a2,a2,a5
    3530:	ffa74783          	lbu	a5,-6(a4)
    3534:	00c7c7b3          	xor	a5,a5,a2
    3538:	0ff7f793          	andi	a5,a5,255
    353c:	00279793          	slli	a5,a5,0x2
    3540:	00f687b3          	add	a5,a3,a5
    3544:	0007a303          	lw	t1,0(a5)
    3548:	ffb74783          	lbu	a5,-5(a4)
    354c:	00865613          	srli	a2,a2,0x8
    3550:	00c34333          	xor	t1,t1,a2
    3554:	0067c7b3          	xor	a5,a5,t1
    3558:	0ff7f793          	andi	a5,a5,255
    355c:	00279793          	slli	a5,a5,0x2
    3560:	00f687b3          	add	a5,a3,a5
    3564:	0007a603          	lw	a2,0(a5)
    3568:	ffc74783          	lbu	a5,-4(a4)
    356c:	00835313          	srli	t1,t1,0x8
    3570:	00664633          	xor	a2,a2,t1
    3574:	00c7c7b3          	xor	a5,a5,a2
    3578:	0ff7f793          	andi	a5,a5,255
    357c:	00279793          	slli	a5,a5,0x2
    3580:	00f687b3          	add	a5,a3,a5
    3584:	0007a303          	lw	t1,0(a5)
    3588:	ffd74783          	lbu	a5,-3(a4)
    358c:	00865613          	srli	a2,a2,0x8
    3590:	00c34333          	xor	t1,t1,a2
    3594:	0067c7b3          	xor	a5,a5,t1
    3598:	0ff7f793          	andi	a5,a5,255
    359c:	00279793          	slli	a5,a5,0x2
    35a0:	00f687b3          	add	a5,a3,a5
    35a4:	0007a783          	lw	a5,0(a5)
    35a8:	ffe74603          	lbu	a2,-2(a4)
    35ac:	00835313          	srli	t1,t1,0x8
    35b0:	0067c7b3          	xor	a5,a5,t1
    35b4:	00f64633          	xor	a2,a2,a5
    35b8:	0ff67613          	andi	a2,a2,255
    35bc:	00261613          	slli	a2,a2,0x2
    35c0:	00c68633          	add	a2,a3,a2
    35c4:	00062303          	lw	t1,0(a2)
    35c8:	fff74603          	lbu	a2,-1(a4)
    35cc:	0087d793          	srli	a5,a5,0x8
    35d0:	00f34333          	xor	t1,t1,a5
    35d4:	00664633          	xor	a2,a2,t1
    35d8:	0ff67613          	andi	a2,a2,255
    35dc:	00261613          	slli	a2,a2,0x2
    35e0:	00c68633          	add	a2,a3,a2
    35e4:	00062783          	lw	a5,0(a2)
    35e8:	00835313          	srli	t1,t1,0x8
    35ec:	0067c7b3          	xor	a5,a5,t1
    35f0:	e9dff06f          	j	348c <crc32+0x18>

000035f4 <flush_l2_cache>:
    35f4:	400007b7          	lui	a5,0x40000
    35f8:	20078713          	addi	a4,a5,512 # 40000200 <_fstack+0x2ffff200>
    35fc:	0007a683          	lw	a3,0(a5)
    3600:	00478793          	addi	a5,a5,4
    3604:	fee79ce3          	bne	a5,a4,35fc <flush_l2_cache+0x8>
    3608:	00008067          	ret

0000360c <busy_wait>:
    360c:	0000c737          	lui	a4,0xc
    3610:	35070713          	addi	a4,a4,848 # c350 <_edata_rom+0x3b74>
    3614:	02e50533          	mul	a0,a0,a4
    3618:	f00027b7          	lui	a5,0xf0002
    361c:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3620:	8007a223          	sw	zero,-2044(a5)
    3624:	00100713          	li	a4,1
    3628:	00100693          	li	a3,1
    362c:	80a7a023          	sw	a0,-2048(a5)
    3630:	80e7a423          	sw	a4,-2040(a5)
    3634:	80e7a623          	sw	a4,-2036(a5)
    3638:	8107a703          	lw	a4,-2032(a5)
    363c:	00071463          	bnez	a4,3644 <busy_wait+0x38>
    3640:	00008067          	ret
    3644:	80d7a623          	sw	a3,-2036(a5)
    3648:	ff1ff06f          	j	3638 <busy_wait+0x2c>

0000364c <busy_wait_us>:
    364c:	03200713          	li	a4,50
    3650:	02e50533          	mul	a0,a0,a4
    3654:	f00027b7          	lui	a5,0xf0002
    3658:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    365c:	8007a223          	sw	zero,-2044(a5)
    3660:	00100713          	li	a4,1
    3664:	00100693          	li	a3,1
    3668:	80a7a023          	sw	a0,-2048(a5)
    366c:	80e7a423          	sw	a4,-2040(a5)
    3670:	80e7a623          	sw	a4,-2036(a5)
    3674:	8107a703          	lw	a4,-2032(a5)
    3678:	00071463          	bnez	a4,3680 <busy_wait_us+0x34>
    367c:	00008067          	ret
    3680:	80d7a623          	sw	a3,-2036(a5)
    3684:	ff1ff06f          	j	3674 <busy_wait_us+0x28>

00003688 <show_progress>:
    3688:	2d2f87b7          	lui	a5,0x2d2f8
    368c:	fc010113          	addi	sp,sp,-64
    3690:	c5c78793          	addi	a5,a5,-932 # 2d2f7c5c <_fstack+0x1d2f6c5c>
    3694:	02112e23          	sw	ra,60(sp)
    3698:	02812c23          	sw	s0,56(sp)
    369c:	02912a23          	sw	s1,52(sp)
    36a0:	03212823          	sw	s2,48(sp)
    36a4:	03312623          	sw	s3,44(sp)
    36a8:	03412423          	sw	s4,40(sp)
    36ac:	00f12423          	sw	a5,8(sp)
    36b0:	00010623          	sb	zero,12(sp)
    36b4:	04055663          	bgez	a0,3700 <show_progress+0x78>
    36b8:	10000737          	lui	a4,0x10000
    36bc:	17472783          	lw	a5,372(a4) # 10000174 <spin>
    36c0:	03812403          	lw	s0,56(sp)
    36c4:	03c12083          	lw	ra,60(sp)
    36c8:	00178693          	addi	a3,a5,1
    36cc:	16d72a23          	sw	a3,372(a4)
    36d0:	0037f793          	andi	a5,a5,3
    36d4:	02010713          	addi	a4,sp,32
    36d8:	00f707b3          	add	a5,a4,a5
    36dc:	03412483          	lw	s1,52(sp)
    36e0:	03012903          	lw	s2,48(sp)
    36e4:	02c12983          	lw	s3,44(sp)
    36e8:	02812a03          	lw	s4,40(sp)
    36ec:	fe87c583          	lbu	a1,-24(a5)
    36f0:	00008537          	lui	a0,0x8
    36f4:	e8c50513          	addi	a0,a0,-372 # 7e8c <crc_table+0x400>
    36f8:	04010113          	addi	sp,sp,64
    36fc:	dddfe06f          	j	24d8 <printf>
    3700:	100007b7          	lui	a5,0x10000
    3704:	1787a683          	lw	a3,376(a5) # 10000178 <progress_max>
    3708:	00050413          	mv	s0,a0
    370c:	02068663          	beqz	a3,3738 <show_progress+0xb0>
    3710:	05f5e7b7          	lui	a5,0x5f5e
    3714:	10078793          	addi	a5,a5,256 # 5f5e100 <_edata_rom+0x5f55924>
    3718:	02f68063          	beq	a3,a5,3738 <show_progress+0xb0>
    371c:	02800593          	li	a1,40
    3720:	02b51633          	mulh	a2,a0,a1
    3724:	41f6d713          	srai	a4,a3,0x1f
    3728:	02b505b3          	mul	a1,a0,a1
    372c:	01010513          	addi	a0,sp,16
    3730:	b75fe0ef          	jal	ra,22a4 <lldiv>
    3734:	01012403          	lw	s0,16(sp)
    3738:	100004b7          	lui	s1,0x10000
    373c:	02800913          	li	s2,40
    3740:	000089b7          	lui	s3,0x8
    3744:	00008a37          	lui	s4,0x8
    3748:	02c0006f          	j	3774 <show_progress+0xec>
    374c:	0327e733          	rem	a4,a5,s2
    3750:	00071863          	bnez	a4,3760 <show_progress+0xd8>
    3754:	00078663          	beqz	a5,3760 <show_progress+0xd8>
    3758:	0d098513          	addi	a0,s3,208 # 80d0 <crc_table+0x644>
    375c:	d7dfe0ef          	jal	ra,24d8 <printf>
    3760:	e90a0513          	addi	a0,s4,-368 # 7e90 <crc_table+0x404>
    3764:	d75fe0ef          	jal	ra,24d8 <printf>
    3768:	17c4a783          	lw	a5,380(s1) # 1000017c <printed>
    376c:	00178793          	addi	a5,a5,1
    3770:	16f4ae23          	sw	a5,380(s1)
    3774:	17c4a783          	lw	a5,380(s1)
    3778:	fc87cae3          	blt	a5,s0,374c <show_progress+0xc4>
    377c:	03c12083          	lw	ra,60(sp)
    3780:	03812403          	lw	s0,56(sp)
    3784:	03412483          	lw	s1,52(sp)
    3788:	03012903          	lw	s2,48(sp)
    378c:	02c12983          	lw	s3,44(sp)
    3790:	02812a03          	lw	s4,40(sp)
    3794:	04010113          	addi	sp,sp,64
    3798:	00008067          	ret

0000379c <init_progression_bar>:
    379c:	100007b7          	lui	a5,0x10000
    37a0:	1607ae23          	sw	zero,380(a5) # 1000017c <printed>
    37a4:	100007b7          	lui	a5,0x10000
    37a8:	16a7ac23          	sw	a0,376(a5) # 10000178 <progress_max>
    37ac:	100007b7          	lui	a5,0x10000
    37b0:	1607aa23          	sw	zero,372(a5) # 10000174 <spin>
    37b4:	02050463          	beqz	a0,37dc <init_progression_bar+0x40>
    37b8:	05f5e7b7          	lui	a5,0x5f5e
    37bc:	10078793          	addi	a5,a5,256 # 5f5e100 <_edata_rom+0x5f55924>
    37c0:	00f50e63          	beq	a0,a5,37dc <init_progression_bar+0x40>
    37c4:	00007637          	lui	a2,0x7
    37c8:	00008537          	lui	a0,0x8
    37cc:	4f460613          	addi	a2,a2,1268 # 74f4 <str.2779+0xa18>
    37d0:	02800593          	li	a1,40
    37d4:	e9450513          	addi	a0,a0,-364 # 7e94 <crc_table+0x408>
    37d8:	d01fe06f          	j	24d8 <printf>
    37dc:	00008067          	ret

000037e0 <print_size>:
    37e0:	3ff00793          	li	a5,1023
    37e4:	00a7ea63          	bltu	a5,a0,37f8 <print_size+0x18>
    37e8:	00050593          	mv	a1,a0
    37ec:	00008537          	lui	a0,0x8
    37f0:	e9c50513          	addi	a0,a0,-356 # 7e9c <crc_table+0x410>
    37f4:	ce5fe06f          	j	24d8 <printf>
    37f8:	001007b7          	lui	a5,0x100
    37fc:	02f57063          	bgeu	a0,a5,381c <print_size+0x3c>
    3800:	3ff57613          	andi	a2,a0,1023
    3804:	06600793          	li	a5,102
    3808:	02f65633          	divu	a2,a2,a5
    380c:	00a55593          	srli	a1,a0,0xa
    3810:	00008537          	lui	a0,0x8
    3814:	ea450513          	addi	a0,a0,-348 # 7ea4 <crc_table+0x418>
    3818:	cc1fe06f          	j	24d8 <printf>
    381c:	400007b7          	lui	a5,0x40000
    3820:	01455593          	srli	a1,a0,0x14
    3824:	02f57263          	bgeu	a0,a5,3848 <print_size+0x68>
    3828:	00a59613          	slli	a2,a1,0xa
    382c:	00a55513          	srli	a0,a0,0xa
    3830:	40c50533          	sub	a0,a0,a2
    3834:	06600613          	li	a2,102
    3838:	02c55633          	divu	a2,a0,a2
    383c:	00008537          	lui	a0,0x8
    3840:	eb050513          	addi	a0,a0,-336 # 7eb0 <crc_table+0x424>
    3844:	fd5ff06f          	j	3818 <print_size+0x38>
    3848:	01e55513          	srli	a0,a0,0x1e
    384c:	00a51613          	slli	a2,a0,0xa
    3850:	40c585b3          	sub	a1,a1,a2
    3854:	06600613          	li	a2,102
    3858:	02c5d633          	divu	a2,a1,a2
    385c:	00050593          	mv	a1,a0
    3860:	00008537          	lui	a0,0x8
    3864:	ebc50513          	addi	a0,a0,-324 # 7ebc <crc_table+0x430>
    3868:	fb1ff06f          	j	3818 <print_size+0x38>

0000386c <print_progress>:
    386c:	ff010113          	addi	sp,sp,-16
    3870:	00812423          	sw	s0,8(sp)
    3874:	00c586b3          	add	a3,a1,a2
    3878:	00060413          	mv	s0,a2
    387c:	00058613          	mv	a2,a1
    3880:	00050593          	mv	a1,a0
    3884:	00008537          	lui	a0,0x8
    3888:	ec850513          	addi	a0,a0,-312 # 7ec8 <crc_table+0x43c>
    388c:	00112623          	sw	ra,12(sp)
    3890:	c49fe0ef          	jal	ra,24d8 <printf>
    3894:	00040513          	mv	a0,s0
    3898:	f49ff0ef          	jal	ra,37e0 <print_size>
    389c:	00812403          	lw	s0,8(sp)
    38a0:	00c12083          	lw	ra,12(sp)
    38a4:	00008537          	lui	a0,0x8
    38a8:	ed850513          	addi	a0,a0,-296 # 7ed8 <crc_table+0x44c>
    38ac:	01010113          	addi	sp,sp,16
    38b0:	c29fe06f          	j	24d8 <printf>

000038b4 <memtest_access>:
    38b4:	aaaab7b7          	lui	a5,0xaaaab
    38b8:	f0000737          	lui	a4,0xf0000
    38bc:	aaa78793          	addi	a5,a5,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    38c0:	00872683          	lw	a3,8(a4) # f0000008 <_fstack+0xdffff008>
    38c4:	00f52023          	sw	a5,0(a0)
    38c8:	00052783          	lw	a5,0(a0)
    38cc:	00f52223          	sw	a5,4(a0)
    38d0:	555557b7          	lui	a5,0x55555
    38d4:	55578793          	addi	a5,a5,1365 # 55555555 <_fstack+0x45554555>
    38d8:	00f52023          	sw	a5,0(a0)
    38dc:	00052783          	lw	a5,0(a0)
    38e0:	00f52223          	sw	a5,4(a0)
    38e4:	00872783          	lw	a5,8(a4)
    38e8:	02d78663          	beq	a5,a3,3914 <memtest_access+0x60>
    38ec:	00050593          	mv	a1,a0
    38f0:	00008537          	lui	a0,0x8
    38f4:	ff010113          	addi	sp,sp,-16
    38f8:	ee050513          	addi	a0,a0,-288 # 7ee0 <crc_table+0x454>
    38fc:	00112623          	sw	ra,12(sp)
    3900:	bd9fe0ef          	jal	ra,24d8 <printf>
    3904:	00c12083          	lw	ra,12(sp)
    3908:	00100513          	li	a0,1
    390c:	01010113          	addi	sp,sp,16
    3910:	00008067          	ret
    3914:	00000513          	li	a0,0
    3918:	00008067          	ret

0000391c <memtest_bus>:
    391c:	fe010113          	addi	sp,sp,-32
    3920:	aaaab737          	lui	a4,0xaaaab
    3924:	00812c23          	sw	s0,24(sp)
    3928:	00912a23          	sw	s1,20(sp)
    392c:	00112e23          	sw	ra,28(sp)
    3930:	00050493          	mv	s1,a0
    3934:	0025d413          	srli	s0,a1,0x2
    3938:	00000793          	li	a5,0
    393c:	aaa70713          	addi	a4,a4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    3940:	06879263          	bne	a5,s0,39a4 <memtest_bus+0x88>
    3944:	0000500f          	0x500f
    3948:	cadff0ef          	jal	ra,35f4 <flush_l2_cache>
    394c:	aaaab737          	lui	a4,0xaaaab
    3950:	00000513          	li	a0,0
    3954:	00000793          	li	a5,0
    3958:	aaa70713          	addi	a4,a4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    395c:	04879e63          	bne	a5,s0,39b8 <memtest_bus+0x9c>
    3960:	55555737          	lui	a4,0x55555
    3964:	00000793          	li	a5,0
    3968:	55570713          	addi	a4,a4,1365 # 55555555 <_fstack+0x45554555>
    396c:	06879463          	bne	a5,s0,39d4 <memtest_bus+0xb8>
    3970:	00a12623          	sw	a0,12(sp)
    3974:	0000500f          	0x500f
    3978:	c7dff0ef          	jal	ra,35f4 <flush_l2_cache>
    397c:	00c12503          	lw	a0,12(sp)
    3980:	55555737          	lui	a4,0x55555
    3984:	00000793          	li	a5,0
    3988:	55570713          	addi	a4,a4,1365 # 55555555 <_fstack+0x45554555>
    398c:	04879e63          	bne	a5,s0,39e8 <memtest_bus+0xcc>
    3990:	01c12083          	lw	ra,28(sp)
    3994:	01812403          	lw	s0,24(sp)
    3998:	01412483          	lw	s1,20(sp)
    399c:	02010113          	addi	sp,sp,32
    39a0:	00008067          	ret
    39a4:	00279693          	slli	a3,a5,0x2
    39a8:	00d486b3          	add	a3,s1,a3
    39ac:	00e6a023          	sw	a4,0(a3)
    39b0:	00178793          	addi	a5,a5,1
    39b4:	f8dff06f          	j	3940 <memtest_bus+0x24>
    39b8:	00279693          	slli	a3,a5,0x2
    39bc:	00d486b3          	add	a3,s1,a3
    39c0:	0006a683          	lw	a3,0(a3)
    39c4:	00e68463          	beq	a3,a4,39cc <memtest_bus+0xb0>
    39c8:	00150513          	addi	a0,a0,1
    39cc:	00178793          	addi	a5,a5,1
    39d0:	f8dff06f          	j	395c <memtest_bus+0x40>
    39d4:	00279693          	slli	a3,a5,0x2
    39d8:	00d486b3          	add	a3,s1,a3
    39dc:	00e6a023          	sw	a4,0(a3)
    39e0:	00178793          	addi	a5,a5,1
    39e4:	f89ff06f          	j	396c <memtest_bus+0x50>
    39e8:	00279693          	slli	a3,a5,0x2
    39ec:	00d486b3          	add	a3,s1,a3
    39f0:	0006a683          	lw	a3,0(a3)
    39f4:	00e68463          	beq	a3,a4,39fc <memtest_bus+0xe0>
    39f8:	00150513          	addi	a0,a0,1
    39fc:	00178793          	addi	a5,a5,1
    3a00:	f8dff06f          	j	398c <memtest_bus+0x70>

00003a04 <memtest_addr>:
    3a04:	000107b7          	lui	a5,0x10
    3a08:	0ef5ec63          	bltu	a1,a5,3b00 <memtest_addr+0xfc>
    3a0c:	ff010113          	addi	sp,sp,-16
    3a10:	0000d6b7          	lui	a3,0xd
    3a14:	00812423          	sw	s0,8(sp)
    3a18:	00912223          	sw	s1,4(sp)
    3a1c:	01212023          	sw	s2,0(sp)
    3a20:	00112623          	sw	ra,12(sp)
    3a24:	00050493          	mv	s1,a0
    3a28:	00060913          	mv	s2,a2
    3a2c:	0025d413          	srli	s0,a1,0x2
    3a30:	00100793          	li	a5,1
    3a34:	00000713          	li	a4,0
    3a38:	00868693          	addi	a3,a3,8 # d008 <_edata_rom+0x482c>
    3a3c:	08871063          	bne	a4,s0,3abc <memtest_addr+0xb8>
    3a40:	0000500f          	0x500f
    3a44:	bb1ff0ef          	jal	ra,35f4 <flush_l2_cache>
    3a48:	0000d637          	lui	a2,0xd
    3a4c:	000106b7          	lui	a3,0x10
    3a50:	00000513          	li	a0,0
    3a54:	00000713          	li	a4,0
    3a58:	00100793          	li	a5,1
    3a5c:	00860613          	addi	a2,a2,8 # d008 <_edata_rom+0x482c>
    3a60:	fff68693          	addi	a3,a3,-1 # ffff <_edata_rom+0x7823>
    3a64:	08090a63          	beqz	s2,3af8 <memtest_addr+0xf4>
    3a68:	0017d593          	srli	a1,a5,0x1
    3a6c:	0017f793          	andi	a5,a5,1
    3a70:	40f007b3          	neg	a5,a5
    3a74:	00c7f7b3          	and	a5,a5,a2
    3a78:	00b7c7b3          	xor	a5,a5,a1
    3a7c:	01079793          	slli	a5,a5,0x10
    3a80:	0107d793          	srli	a5,a5,0x10
    3a84:	00279593          	slli	a1,a5,0x2
    3a88:	00b485b3          	add	a1,s1,a1
    3a8c:	0005a583          	lw	a1,0(a1)
    3a90:	00d5f5b3          	and	a1,a1,a3
    3a94:	00e58463          	beq	a1,a4,3a9c <memtest_addr+0x98>
    3a98:	00150513          	addi	a0,a0,1
    3a9c:	00170713          	addi	a4,a4,1
    3aa0:	fce412e3          	bne	s0,a4,3a64 <memtest_addr+0x60>
    3aa4:	00c12083          	lw	ra,12(sp)
    3aa8:	00812403          	lw	s0,8(sp)
    3aac:	00412483          	lw	s1,4(sp)
    3ab0:	00012903          	lw	s2,0(sp)
    3ab4:	01010113          	addi	sp,sp,16
    3ab8:	00008067          	ret
    3abc:	02090a63          	beqz	s2,3af0 <memtest_addr+0xec>
    3ac0:	0017d613          	srli	a2,a5,0x1
    3ac4:	0017f793          	andi	a5,a5,1
    3ac8:	40f007b3          	neg	a5,a5
    3acc:	00d7f7b3          	and	a5,a5,a3
    3ad0:	00c7c7b3          	xor	a5,a5,a2
    3ad4:	01079793          	slli	a5,a5,0x10
    3ad8:	0107d793          	srli	a5,a5,0x10
    3adc:	00279613          	slli	a2,a5,0x2
    3ae0:	00c48633          	add	a2,s1,a2
    3ae4:	00e62023          	sw	a4,0(a2)
    3ae8:	00170713          	addi	a4,a4,1
    3aec:	f51ff06f          	j	3a3c <memtest_addr+0x38>
    3af0:	00178793          	addi	a5,a5,1 # 10001 <_edata_rom+0x7825>
    3af4:	fe1ff06f          	j	3ad4 <memtest_addr+0xd0>
    3af8:	00178793          	addi	a5,a5,1
    3afc:	f81ff06f          	j	3a7c <memtest_addr+0x78>
    3b00:	00000513          	li	a0,0
    3b04:	00008067          	ret

00003b08 <memtest_data>:
    3b08:	fc010113          	addi	sp,sp,-64
    3b0c:	02912a23          	sw	s1,52(sp)
    3b10:	03212823          	sw	s2,48(sp)
    3b14:	03312623          	sw	s3,44(sp)
    3b18:	03412423          	sw	s4,40(sp)
    3b1c:	02112e23          	sw	ra,60(sp)
    3b20:	02812c23          	sw	s0,56(sp)
    3b24:	03512223          	sw	s5,36(sp)
    3b28:	03612023          	sw	s6,32(sp)
    3b2c:	01712e23          	sw	s7,28(sp)
    3b30:	01812c23          	sw	s8,24(sp)
    3b34:	01912a23          	sw	s9,20(sp)
    3b38:	01a12823          	sw	s10,16(sp)
    3b3c:	01b12623          	sw	s11,12(sp)
    3b40:	00050493          	mv	s1,a0
    3b44:	00060a13          	mv	s4,a2
    3b48:	00068913          	mv	s2,a3
    3b4c:	0025d993          	srli	s3,a1,0x2
    3b50:	0a068263          	beqz	a3,3bf4 <memtest_data+0xec>
    3b54:	0046a783          	lw	a5,4(a3)
    3b58:	0006ab03          	lw	s6,0(a3)
    3b5c:	04079263          	bnez	a5,3ba0 <memtest_data+0x98>
    3b60:	80200bb7          	lui	s7,0x80200
    3b64:	00008c37          	lui	s8,0x8
    3b68:	00100413          	li	s0,1
    3b6c:	00000a93          	li	s5,0
    3b70:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    3b74:	fffc0c13          	addi	s8,s8,-1 # 7fff <crc_table+0x573>
    3b78:	00008cb7          	lui	s9,0x8
    3b7c:	002a9613          	slli	a2,s5,0x2
    3b80:	073a9e63          	bne	s5,s3,3bfc <memtest_data+0xf4>
    3b84:	00008537          	lui	a0,0x8
    3b88:	f1050513          	addi	a0,a0,-240 # 7f10 <crc_table+0x484>
    3b8c:	00048593          	mv	a1,s1
    3b90:	cddff0ef          	jal	ra,386c <print_progress>
    3b94:	00008537          	lui	a0,0x8
    3b98:	0d050513          	addi	a0,a0,208 # 80d0 <crc_table+0x644>
    3b9c:	93dfe0ef          	jal	ra,24d8 <printf>
    3ba0:	0000500f          	0x500f
    3ba4:	80200bb7          	lui	s7,0x80200
    3ba8:	00008c37          	lui	s8,0x8
    3bac:	a49ff0ef          	jal	ra,35f4 <flush_l2_cache>
    3bb0:	00100413          	li	s0,1
    3bb4:	00000a93          	li	s5,0
    3bb8:	00000d13          	li	s10,0
    3bbc:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    3bc0:	fffc0c13          	addi	s8,s8,-1 # 7fff <crc_table+0x573>
    3bc4:	00008cb7          	lui	s9,0x8
    3bc8:	07a99c63          	bne	s3,s10,3c40 <memtest_data+0x138>
    3bcc:	0e0b0463          	beqz	s6,3cb4 <memtest_data+0x1ac>
    3bd0:	00008537          	lui	a0,0x8
    3bd4:	00299613          	slli	a2,s3,0x2
    3bd8:	00048593          	mv	a1,s1
    3bdc:	f1c50513          	addi	a0,a0,-228 # 7f1c <crc_table+0x490>
    3be0:	c8dff0ef          	jal	ra,386c <print_progress>
    3be4:	00008537          	lui	a0,0x8
    3be8:	0d050513          	addi	a0,a0,208 # 80d0 <crc_table+0x644>
    3bec:	8edfe0ef          	jal	ra,24d8 <printf>
    3bf0:	0c40006f          	j	3cb4 <memtest_data+0x1ac>
    3bf4:	00100b13          	li	s6,1
    3bf8:	f69ff06f          	j	3b60 <memtest_data+0x58>
    3bfc:	020a0e63          	beqz	s4,3c38 <memtest_data+0x130>
    3c00:	00145793          	srli	a5,s0,0x1
    3c04:	00147413          	andi	s0,s0,1
    3c08:	40800433          	neg	s0,s0
    3c0c:	01747433          	and	s0,s0,s7
    3c10:	00f44433          	xor	s0,s0,a5
    3c14:	00c487b3          	add	a5,s1,a2
    3c18:	0087a023          	sw	s0,0(a5)
    3c1c:	018af7b3          	and	a5,s5,s8
    3c20:	00079863          	bnez	a5,3c30 <memtest_data+0x128>
    3c24:	00048593          	mv	a1,s1
    3c28:	f10c8513          	addi	a0,s9,-240 # 7f10 <crc_table+0x484>
    3c2c:	c41ff0ef          	jal	ra,386c <print_progress>
    3c30:	001a8a93          	addi	s5,s5,1
    3c34:	f49ff06f          	j	3b7c <memtest_data+0x74>
    3c38:	00140413          	addi	s0,s0,1
    3c3c:	fd9ff06f          	j	3c14 <memtest_data+0x10c>
    3c40:	040a0663          	beqz	s4,3c8c <memtest_data+0x184>
    3c44:	00145793          	srli	a5,s0,0x1
    3c48:	00147413          	andi	s0,s0,1
    3c4c:	40800433          	neg	s0,s0
    3c50:	01747433          	and	s0,s0,s7
    3c54:	00f44433          	xor	s0,s0,a5
    3c58:	002d1d93          	slli	s11,s10,0x2
    3c5c:	009d8533          	add	a0,s11,s1
    3c60:	00052583          	lw	a1,0(a0)
    3c64:	02859863          	bne	a1,s0,3c94 <memtest_data+0x18c>
    3c68:	018d77b3          	and	a5,s10,s8
    3c6c:	00079c63          	bnez	a5,3c84 <memtest_data+0x17c>
    3c70:	000b0a63          	beqz	s6,3c84 <memtest_data+0x17c>
    3c74:	000d8613          	mv	a2,s11
    3c78:	00048593          	mv	a1,s1
    3c7c:	f1cc8513          	addi	a0,s9,-228
    3c80:	bedff0ef          	jal	ra,386c <print_progress>
    3c84:	001d0d13          	addi	s10,s10,1
    3c88:	f41ff06f          	j	3bc8 <memtest_data+0xc0>
    3c8c:	00140413          	addi	s0,s0,1
    3c90:	fc9ff06f          	j	3c58 <memtest_data+0x150>
    3c94:	001a8a93          	addi	s5,s5,1
    3c98:	fc0908e3          	beqz	s2,3c68 <memtest_data+0x160>
    3c9c:	00892783          	lw	a5,8(s2)
    3ca0:	fc0784e3          	beqz	a5,3c68 <memtest_data+0x160>
    3ca4:	00c92683          	lw	a3,12(s2)
    3ca8:	00040613          	mv	a2,s0
    3cac:	000780e7          	jalr	a5
    3cb0:	fa050ce3          	beqz	a0,3c68 <memtest_data+0x160>
    3cb4:	03c12083          	lw	ra,60(sp)
    3cb8:	03812403          	lw	s0,56(sp)
    3cbc:	03412483          	lw	s1,52(sp)
    3cc0:	03012903          	lw	s2,48(sp)
    3cc4:	02c12983          	lw	s3,44(sp)
    3cc8:	02812a03          	lw	s4,40(sp)
    3ccc:	02012b03          	lw	s6,32(sp)
    3cd0:	01c12b83          	lw	s7,28(sp)
    3cd4:	01812c03          	lw	s8,24(sp)
    3cd8:	01412c83          	lw	s9,20(sp)
    3cdc:	01012d03          	lw	s10,16(sp)
    3ce0:	00c12d83          	lw	s11,12(sp)
    3ce4:	000a8513          	mv	a0,s5
    3ce8:	02412a83          	lw	s5,36(sp)
    3cec:	04010113          	addi	sp,sp,64
    3cf0:	00008067          	ret

00003cf4 <memspeed>:
    3cf4:	fe010113          	addi	sp,sp,-32
    3cf8:	01312623          	sw	s3,12(sp)
    3cfc:	ff058993          	addi	s3,a1,-16
    3d00:	00812c23          	sw	s0,24(sp)
    3d04:	00912a23          	sw	s1,20(sp)
    3d08:	00050413          	mv	s0,a0
    3d0c:	00058493          	mv	s1,a1
    3d10:	013509b3          	add	s3,a0,s3
    3d14:	00050593          	mv	a1,a0
    3d18:	00008537          	lui	a0,0x8
    3d1c:	01412423          	sw	s4,8(sp)
    3d20:	f2850513          	addi	a0,a0,-216 # 7f28 <crc_table+0x49c>
    3d24:	00068a13          	mv	s4,a3
    3d28:	01212823          	sw	s2,16(sp)
    3d2c:	00112e23          	sw	ra,28(sp)
    3d30:	01512223          	sw	s5,4(sp)
    3d34:	00060913          	mv	s2,a2
    3d38:	fa0fe0ef          	jal	ra,24d8 <printf>
    3d3c:	100a0863          	beqz	s4,3e4c <memspeed+0x158>
    3d40:	00008537          	lui	a0,0x8
    3d44:	f3c50513          	addi	a0,a0,-196 # 7f3c <crc_table+0x4b0>
    3d48:	f90fe0ef          	jal	ra,24d8 <printf>
    3d4c:	00048513          	mv	a0,s1
    3d50:	a91ff0ef          	jal	ra,37e0 <print_size>
    3d54:	00007537          	lui	a0,0x7
    3d58:	92450513          	addi	a0,a0,-1756 # 6924 <_frodata+0x34>
    3d5c:	f7cfe0ef          	jal	ra,24d8 <printf>
    3d60:	f00027b7          	lui	a5,0xf0002
    3d64:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3d68:	8007a223          	sw	zero,-2044(a5)
    3d6c:	fff00713          	li	a4,-1
    3d70:	80e7a023          	sw	a4,-2048(a5)
    3d74:	00100713          	li	a4,1
    3d78:	80e7a423          	sw	a4,-2040(a5)
    3d7c:	08091263          	bnez	s2,3e00 <memspeed+0x10c>
    3d80:	80e7a623          	sw	a4,-2036(a5)
    3d84:	8107a903          	lw	s2,-2032(a5)
    3d88:	fff00713          	li	a4,-1
    3d8c:	00040793          	mv	a5,s0
    3d90:	00e7a023          	sw	a4,0(a5)
    3d94:	00e7a223          	sw	a4,4(a5)
    3d98:	00e7a423          	sw	a4,8(a5)
    3d9c:	00e7a623          	sw	a4,12(a5)
    3da0:	01078793          	addi	a5,a5,16
    3da4:	fef9f6e3          	bgeu	s3,a5,3d90 <memspeed+0x9c>
    3da8:	f00027b7          	lui	a5,0xf0002
    3dac:	00100713          	li	a4,1
    3db0:	00008537          	lui	a0,0x8
    3db4:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    3db8:	f5850513          	addi	a0,a0,-168 # 7f58 <crc_table+0x4cc>
    3dbc:	8107aa83          	lw	s5,-2032(a5)
    3dc0:	f18fe0ef          	jal	ra,24d8 <printf>
    3dc4:	02faf537          	lui	a0,0x2faf
    3dc8:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa68a4>
    3dcc:	02a4b5b3          	mulhu	a1,s1,a0
    3dd0:	41590633          	sub	a2,s2,s5
    3dd4:	00c936b3          	sltu	a3,s2,a2
    3dd8:	40d006b3          	neg	a3,a3
    3ddc:	02a48533          	mul	a0,s1,a0
    3de0:	d9cff0ef          	jal	ra,337c <__udivdi3>
    3de4:	9fdff0ef          	jal	ra,37e0 <print_size>
    3de8:	00008537          	lui	a0,0x8
    3dec:	f6850513          	addi	a0,a0,-152 # 7f68 <crc_table+0x4dc>
    3df0:	ee8fe0ef          	jal	ra,24d8 <printf>
    3df4:	00008537          	lui	a0,0x8
    3df8:	0d050513          	addi	a0,a0,208 # 80d0 <crc_table+0x644>
    3dfc:	edcfe0ef          	jal	ra,24d8 <printf>
    3e00:	0000500f          	0x500f
    3e04:	ff0ff0ef          	jal	ra,35f4 <flush_l2_cache>
    3e08:	f00027b7          	lui	a5,0xf0002
    3e0c:	00100713          	li	a4,1
    3e10:	80e7a423          	sw	a4,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3e14:	80e7a623          	sw	a4,-2036(a5)
    3e18:	8107a903          	lw	s2,-2032(a5)
    3e1c:	0024d593          	srli	a1,s1,0x2
    3e20:	00058713          	mv	a4,a1
    3e24:	00000693          	li	a3,0
    3e28:	02071863          	bnez	a4,3e58 <memspeed+0x164>
    3e2c:	0e0a1c63          	bnez	s4,3f24 <memspeed+0x230>
    3e30:	00042783          	lw	a5,0(s0)
    3e34:	00442783          	lw	a5,4(s0)
    3e38:	00842783          	lw	a5,8(s0)
    3e3c:	00c42783          	lw	a5,12(s0)
    3e40:	01040413          	addi	s0,s0,16
    3e44:	fe89f6e3          	bgeu	s3,s0,3e30 <memspeed+0x13c>
    3e48:	05c0006f          	j	3ea4 <memspeed+0x1b0>
    3e4c:	00008537          	lui	a0,0x8
    3e50:	f4850513          	addi	a0,a0,-184 # 7f48 <crc_table+0x4bc>
    3e54:	ef5ff06f          	j	3d48 <memspeed+0x54>
    3e58:	00177793          	andi	a5,a4,1
    3e5c:	00078463          	beqz	a5,3e64 <memspeed+0x170>
    3e60:	00168693          	addi	a3,a3,1
    3e64:	00175713          	srli	a4,a4,0x1
    3e68:	fc1ff06f          	j	3e28 <memspeed+0x134>
    3e6c:	0a070863          	beqz	a4,3f1c <memspeed+0x228>
    3e70:	0017d613          	srli	a2,a5,0x1
    3e74:	0017f793          	andi	a5,a5,1
    3e78:	40f007b3          	neg	a5,a5
    3e7c:	00a7f7b3          	and	a5,a5,a0
    3e80:	00c7c7b3          	xor	a5,a5,a2
    3e84:	00f8f633          	and	a2,a7,a5
    3e88:	01068463          	beq	a3,a6,3e90 <memspeed+0x19c>
    3e8c:	02b7f633          	remu	a2,a5,a1
    3e90:	00261613          	slli	a2,a2,0x2
    3e94:	00c40633          	add	a2,s0,a2
    3e98:	00062603          	lw	a2,0(a2)
    3e9c:	00170713          	addi	a4,a4,1
    3ea0:	fcb716e3          	bne	a4,a1,3e6c <memspeed+0x178>
    3ea4:	f00027b7          	lui	a5,0xf0002
    3ea8:	00100713          	li	a4,1
    3eac:	00008537          	lui	a0,0x8
    3eb0:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    3eb4:	f6c50513          	addi	a0,a0,-148 # 7f6c <crc_table+0x4e0>
    3eb8:	8107a403          	lw	s0,-2032(a5)
    3ebc:	e1cfe0ef          	jal	ra,24d8 <printf>
    3ec0:	02faf537          	lui	a0,0x2faf
    3ec4:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa68a4>
    3ec8:	40890633          	sub	a2,s2,s0
    3ecc:	00c936b3          	sltu	a3,s2,a2
    3ed0:	40d006b3          	neg	a3,a3
    3ed4:	02a4b5b3          	mulhu	a1,s1,a0
    3ed8:	02a48533          	mul	a0,s1,a0
    3edc:	ca0ff0ef          	jal	ra,337c <__udivdi3>
    3ee0:	901ff0ef          	jal	ra,37e0 <print_size>
    3ee4:	00008537          	lui	a0,0x8
    3ee8:	f6850513          	addi	a0,a0,-152 # 7f68 <crc_table+0x4dc>
    3eec:	decfe0ef          	jal	ra,24d8 <printf>
    3ef0:	01812403          	lw	s0,24(sp)
    3ef4:	01c12083          	lw	ra,28(sp)
    3ef8:	01412483          	lw	s1,20(sp)
    3efc:	01012903          	lw	s2,16(sp)
    3f00:	00c12983          	lw	s3,12(sp)
    3f04:	00812a03          	lw	s4,8(sp)
    3f08:	00412a83          	lw	s5,4(sp)
    3f0c:	00008537          	lui	a0,0x8
    3f10:	0d050513          	addi	a0,a0,208 # 80d0 <crc_table+0x644>
    3f14:	02010113          	addi	sp,sp,32
    3f18:	dc0fe06f          	j	24d8 <printf>
    3f1c:	00178793          	addi	a5,a5,1
    3f20:	f65ff06f          	j	3e84 <memspeed+0x190>
    3f24:	80200537          	lui	a0,0x80200
    3f28:	00000793          	li	a5,0
    3f2c:	00350513          	addi	a0,a0,3 # 80200003 <_fstack+0x701ff003>
    3f30:	00100813          	li	a6,1
    3f34:	fff58893          	addi	a7,a1,-1
    3f38:	f69ff06f          	j	3ea0 <memspeed+0x1ac>

00003f3c <memtest>:
    3f3c:	fe010113          	addi	sp,sp,-32
    3f40:	00812c23          	sw	s0,24(sp)
    3f44:	00912a23          	sw	s1,20(sp)
    3f48:	00058413          	mv	s0,a1
    3f4c:	00050493          	mv	s1,a0
    3f50:	00050593          	mv	a1,a0
    3f54:	00008537          	lui	a0,0x8
    3f58:	f7c50513          	addi	a0,a0,-132 # 7f7c <crc_table+0x4f0>
    3f5c:	00112e23          	sw	ra,28(sp)
    3f60:	01212823          	sw	s2,16(sp)
    3f64:	01312623          	sw	s3,12(sp)
    3f68:	01412423          	sw	s4,8(sp)
    3f6c:	01512223          	sw	s5,4(sp)
    3f70:	01612023          	sw	s6,0(sp)
    3f74:	d64fe0ef          	jal	ra,24d8 <printf>
    3f78:	00040513          	mv	a0,s0
    3f7c:	865ff0ef          	jal	ra,37e0 <print_size>
    3f80:	00007537          	lui	a0,0x7
    3f84:	92450513          	addi	a0,a0,-1756 # 6924 <_frodata+0x34>
    3f88:	d50fe0ef          	jal	ra,24d8 <printf>
    3f8c:	00048513          	mv	a0,s1
    3f90:	925ff0ef          	jal	ra,38b4 <memtest_access>
    3f94:	00000913          	li	s2,0
    3f98:	0a051e63          	bnez	a0,4054 <memtest+0x118>
    3f9c:	20000793          	li	a5,512
    3fa0:	00050913          	mv	s2,a0
    3fa4:	00040993          	mv	s3,s0
    3fa8:	0087f463          	bgeu	a5,s0,3fb0 <memtest+0x74>
    3fac:	20000993          	li	s3,512
    3fb0:	000087b7          	lui	a5,0x8
    3fb4:	00040b13          	mv	s6,s0
    3fb8:	0087f463          	bgeu	a5,s0,3fc0 <memtest+0x84>
    3fbc:	00008b37          	lui	s6,0x8
    3fc0:	00098593          	mv	a1,s3
    3fc4:	00048513          	mv	a0,s1
    3fc8:	955ff0ef          	jal	ra,391c <memtest_bus>
    3fcc:	00050a93          	mv	s5,a0
    3fd0:	00000613          	li	a2,0
    3fd4:	000b0593          	mv	a1,s6
    3fd8:	00048513          	mv	a0,s1
    3fdc:	a29ff0ef          	jal	ra,3a04 <memtest_addr>
    3fe0:	00050a13          	mv	s4,a0
    3fe4:	00000693          	li	a3,0
    3fe8:	00048513          	mv	a0,s1
    3fec:	00100613          	li	a2,1
    3ff0:	00040593          	mv	a1,s0
    3ff4:	b15ff0ef          	jal	ra,3b08 <memtest_data>
    3ff8:	014a87b3          	add	a5,s5,s4
    3ffc:	00a787b3          	add	a5,a5,a0
    4000:	00050493          	mv	s1,a0
    4004:	06078e63          	beqz	a5,4080 <memtest+0x144>
    4008:	00199613          	slli	a2,s3,0x1
    400c:	00008537          	lui	a0,0x8
    4010:	00265613          	srli	a2,a2,0x2
    4014:	000a8593          	mv	a1,s5
    4018:	f8c50513          	addi	a0,a0,-116 # 7f8c <crc_table+0x500>
    401c:	cbcfe0ef          	jal	ra,24d8 <printf>
    4020:	00008537          	lui	a0,0x8
    4024:	002b5613          	srli	a2,s6,0x2
    4028:	000a0593          	mv	a1,s4
    402c:	fa450513          	addi	a0,a0,-92 # 7fa4 <crc_table+0x518>
    4030:	ca8fe0ef          	jal	ra,24d8 <printf>
    4034:	00008537          	lui	a0,0x8
    4038:	00245613          	srli	a2,s0,0x2
    403c:	00048593          	mv	a1,s1
    4040:	fbc50513          	addi	a0,a0,-68 # 7fbc <crc_table+0x530>
    4044:	c94fe0ef          	jal	ra,24d8 <printf>
    4048:	00008537          	lui	a0,0x8
    404c:	fd450513          	addi	a0,a0,-44 # 7fd4 <crc_table+0x548>
    4050:	c88fe0ef          	jal	ra,24d8 <printf>
    4054:	01c12083          	lw	ra,28(sp)
    4058:	01812403          	lw	s0,24(sp)
    405c:	01412483          	lw	s1,20(sp)
    4060:	00c12983          	lw	s3,12(sp)
    4064:	00812a03          	lw	s4,8(sp)
    4068:	00412a83          	lw	s5,4(sp)
    406c:	00012b03          	lw	s6,0(sp)
    4070:	00090513          	mv	a0,s2
    4074:	01012903          	lw	s2,16(sp)
    4078:	02010113          	addi	sp,sp,32
    407c:	00008067          	ret
    4080:	00008537          	lui	a0,0x8
    4084:	fe050513          	addi	a0,a0,-32 # 7fe0 <crc_table+0x554>
    4088:	c50fe0ef          	jal	ra,24d8 <printf>
    408c:	00100913          	li	s2,1
    4090:	fc5ff06f          	j	4054 <memtest+0x118>

00004094 <uart_isr>:
    4094:	f0001737          	lui	a4,0xf0001
    4098:	01072683          	lw	a3,16(a4) # f0001010 <_fstack+0xe0000010>
    409c:	01472783          	lw	a5,20(a4)
    40a0:	00d7f7b3          	and	a5,a5,a3
    40a4:	0027f713          	andi	a4,a5,2
    40a8:	00071863          	bnez	a4,40b8 <uart_isr+0x24>
    40ac:	0017f793          	andi	a5,a5,1
    40b0:	04079c63          	bnez	a5,4108 <uart_isr+0x74>
    40b4:	00008067          	ret
    40b8:	10000737          	lui	a4,0x10000
    40bc:	18872803          	lw	a6,392(a4) # 10000188 <rx_consume>
    40c0:	100005b7          	lui	a1,0x10000
    40c4:	f00016b7          	lui	a3,0xf0001
    40c8:	10000637          	lui	a2,0x10000
    40cc:	1ac58593          	addi	a1,a1,428 # 100001ac <rx_buf>
    40d0:	00200893          	li	a7,2
    40d4:	0086a703          	lw	a4,8(a3) # f0001008 <_fstack+0xe0000008>
    40d8:	fc071ae3          	bnez	a4,40ac <uart_isr+0x18>
    40dc:	0006a303          	lw	t1,0(a3)
    40e0:	18c62703          	lw	a4,396(a2) # 1000018c <rx_produce>
    40e4:	00170713          	addi	a4,a4,1
    40e8:	07f77713          	andi	a4,a4,127
    40ec:	00e80a63          	beq	a6,a4,4100 <uart_isr+0x6c>
    40f0:	18c62503          	lw	a0,396(a2)
    40f4:	18e62623          	sw	a4,396(a2)
    40f8:	00a58533          	add	a0,a1,a0
    40fc:	00650023          	sb	t1,0(a0)
    4100:	0116a823          	sw	a7,16(a3)
    4104:	fd1ff06f          	j	40d4 <uart_isr+0x40>
    4108:	100007b7          	lui	a5,0x10000
    410c:	1847a603          	lw	a2,388(a5) # 10000184 <tx_produce>
    4110:	100006b7          	lui	a3,0x10000
    4114:	100007b7          	lui	a5,0x10000
    4118:	00078513          	mv	a0,a5
    411c:	f00015b7          	lui	a1,0xf0001
    4120:	1ac68693          	addi	a3,a3,428 # 100001ac <rx_buf>
    4124:	1807a703          	lw	a4,384(a5) # 10000180 <tx_consume>
    4128:	00c70663          	beq	a4,a2,4134 <uart_isr+0xa0>
    412c:	0045a703          	lw	a4,4(a1) # f0001004 <_fstack+0xe0000004>
    4130:	00070e63          	beqz	a4,414c <uart_isr+0xb8>
    4134:	18052783          	lw	a5,384(a0)
    4138:	00f61863          	bne	a2,a5,4148 <uart_isr+0xb4>
    413c:	f00017b7          	lui	a5,0xf0001
    4140:	00200713          	li	a4,2
    4144:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    4148:	00008067          	ret
    414c:	1807a703          	lw	a4,384(a5)
    4150:	00e68733          	add	a4,a3,a4
    4154:	08074703          	lbu	a4,128(a4)
    4158:	00e5a023          	sw	a4,0(a1)
    415c:	1807a703          	lw	a4,384(a5)
    4160:	00170713          	addi	a4,a4,1
    4164:	07f77713          	andi	a4,a4,127
    4168:	18e7a023          	sw	a4,384(a5)
    416c:	fb9ff06f          	j	4124 <uart_isr+0x90>

00004170 <uart_read>:
    4170:	30002673          	csrr	a2,mstatus
    4174:	10000737          	lui	a4,0x10000
    4178:	00867613          	andi	a2,a2,8
    417c:	18872783          	lw	a5,392(a4) # 10000188 <rx_consume>
    4180:	00070693          	mv	a3,a4
    4184:	10000737          	lui	a4,0x10000
    4188:	02060663          	beqz	a2,41b4 <uart_read+0x44>
    418c:	18c72603          	lw	a2,396(a4) # 1000018c <rx_produce>
    4190:	fef60ee3          	beq	a2,a5,418c <uart_read+0x1c>
    4194:	10000737          	lui	a4,0x10000
    4198:	1ac70713          	addi	a4,a4,428 # 100001ac <rx_buf>
    419c:	00f70733          	add	a4,a4,a5
    41a0:	00178793          	addi	a5,a5,1
    41a4:	07f7f793          	andi	a5,a5,127
    41a8:	00074503          	lbu	a0,0(a4)
    41ac:	18f6a423          	sw	a5,392(a3)
    41b0:	0100006f          	j	41c0 <uart_read+0x50>
    41b4:	18c72703          	lw	a4,396(a4)
    41b8:	00000513          	li	a0,0
    41bc:	fcf71ce3          	bne	a4,a5,4194 <uart_read+0x24>
    41c0:	00008067          	ret

000041c4 <uart_read_nonblock>:
    41c4:	10000737          	lui	a4,0x10000
    41c8:	100007b7          	lui	a5,0x10000
    41cc:	18c7a783          	lw	a5,396(a5) # 1000018c <rx_produce>
    41d0:	18872503          	lw	a0,392(a4) # 10000188 <rx_consume>
    41d4:	40f50533          	sub	a0,a0,a5
    41d8:	00a03533          	snez	a0,a0
    41dc:	00008067          	ret

000041e0 <uart_write>:
    41e0:	10000737          	lui	a4,0x10000
    41e4:	18472783          	lw	a5,388(a4) # 10000184 <tx_produce>
    41e8:	00178793          	addi	a5,a5,1
    41ec:	07f7f793          	andi	a5,a5,127
    41f0:	30002673          	csrr	a2,mstatus
    41f4:	00867613          	andi	a2,a2,8
    41f8:	100006b7          	lui	a3,0x10000
    41fc:	06060063          	beqz	a2,425c <uart_write+0x7c>
    4200:	1806a603          	lw	a2,384(a3) # 10000180 <tx_consume>
    4204:	fef60ee3          	beq	a2,a5,4200 <uart_write+0x20>
    4208:	f0c025b7          	lui	a1,0xf0c02
    420c:	0005a603          	lw	a2,0(a1) # f0c02000 <_fstack+0xe0c01000>
    4210:	ffd67813          	andi	a6,a2,-3
    4214:	0105a023          	sw	a6,0(a1)
    4218:	1806a683          	lw	a3,384(a3)
    421c:	18472803          	lw	a6,388(a4)
    4220:	01069863          	bne	a3,a6,4230 <uart_write+0x50>
    4224:	f00015b7          	lui	a1,0xf0001
    4228:	0045a683          	lw	a3,4(a1) # f0001004 <_fstack+0xe0000004>
    422c:	02068e63          	beqz	a3,4268 <uart_write+0x88>
    4230:	100006b7          	lui	a3,0x10000
    4234:	1ac68693          	addi	a3,a3,428 # 100001ac <rx_buf>
    4238:	010686b3          	add	a3,a3,a6
    423c:	18f72223          	sw	a5,388(a4)
    4240:	08a68023          	sb	a0,128(a3)
    4244:	f00017b7          	lui	a5,0xf0001
    4248:	00300713          	li	a4,3
    424c:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    4250:	f0c027b7          	lui	a5,0xf0c02
    4254:	00c7a023          	sw	a2,0(a5) # f0c02000 <_fstack+0xe0c01000>
    4258:	00c0006f          	j	4264 <uart_write+0x84>
    425c:	1806a603          	lw	a2,384(a3)
    4260:	faf614e3          	bne	a2,a5,4208 <uart_write+0x28>
    4264:	00008067          	ret
    4268:	00a5a023          	sw	a0,0(a1)
    426c:	fe5ff06f          	j	4250 <uart_write+0x70>

00004270 <uart_init>:
    4270:	100007b7          	lui	a5,0x10000
    4274:	1807a623          	sw	zero,396(a5) # 1000018c <rx_produce>
    4278:	100007b7          	lui	a5,0x10000
    427c:	1807a423          	sw	zero,392(a5) # 10000188 <rx_consume>
    4280:	100007b7          	lui	a5,0x10000
    4284:	1807a223          	sw	zero,388(a5) # 10000184 <tx_produce>
    4288:	100007b7          	lui	a5,0x10000
    428c:	1807a023          	sw	zero,384(a5) # 10000180 <tx_consume>
    4290:	00200713          	li	a4,2
    4294:	f00017b7          	lui	a5,0xf0001
    4298:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    429c:	000047b7          	lui	a5,0x4
    42a0:	30878793          	addi	a5,a5,776 # 4308 <irq_attach>
    42a4:	02078c63          	beqz	a5,42dc <uart_init+0x6c>
    42a8:	000045b7          	lui	a1,0x4
    42ac:	ff010113          	addi	sp,sp,-16
    42b0:	09458593          	addi	a1,a1,148 # 4094 <uart_isr>
    42b4:	00100513          	li	a0,1
    42b8:	00112623          	sw	ra,12(sp)
    42bc:	04c000ef          	jal	ra,4308 <irq_attach>
    42c0:	f0c02737          	lui	a4,0xf0c02
    42c4:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    42c8:	00c12083          	lw	ra,12(sp)
    42cc:	0027e793          	ori	a5,a5,2
    42d0:	00f72023          	sw	a5,0(a4)
    42d4:	01010113          	addi	sp,sp,16
    42d8:	00008067          	ret
    42dc:	f0c02737          	lui	a4,0xf0c02
    42e0:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    42e4:	0027e793          	ori	a5,a5,2
    42e8:	00f72023          	sw	a5,0(a4)
    42ec:	00008067          	ret

000042f0 <uart_sync>:
    42f0:	100007b7          	lui	a5,0x10000
    42f4:	1847a783          	lw	a5,388(a5) # 10000184 <tx_produce>
    42f8:	100006b7          	lui	a3,0x10000
    42fc:	1806a703          	lw	a4,384(a3) # 10000180 <tx_consume>
    4300:	fef71ee3          	bne	a4,a5,42fc <uart_sync+0xc>
    4304:	00008067          	ret

00004308 <irq_attach>:
    4308:	00200793          	li	a5,2
    430c:	02a7f663          	bgeu	a5,a0,4338 <irq_attach+0x30>
    4310:	00050593          	mv	a1,a0
    4314:	00008537          	lui	a0,0x8
    4318:	ff010113          	addi	sp,sp,-16
    431c:	fec50513          	addi	a0,a0,-20 # 7fec <crc_table+0x560>
    4320:	00112623          	sw	ra,12(sp)
    4324:	9b4fe0ef          	jal	ra,24d8 <printf>
    4328:	00c12083          	lw	ra,12(sp)
    432c:	fff00513          	li	a0,-1
    4330:	01010113          	addi	sp,sp,16
    4334:	00008067          	ret
    4338:	300026f3          	csrr	a3,mstatus
    433c:	30047073          	csrci	mstatus,8
    4340:	10000737          	lui	a4,0x10000
    4344:	00251793          	slli	a5,a0,0x2
    4348:	4ac70713          	addi	a4,a4,1196 # 100004ac <irq_table>
    434c:	00f707b3          	add	a5,a4,a5
    4350:	00b7a023          	sw	a1,0(a5)
    4354:	0086f793          	andi	a5,a3,8
    4358:	00078663          	beqz	a5,4364 <irq_attach+0x5c>
    435c:	30046073          	csrsi	mstatus,8
    4360:	00008067          	ret
    4364:	30047073          	csrci	mstatus,8
    4368:	00008067          	ret

0000436c <irq_detach>:
    436c:	00000593          	li	a1,0
    4370:	f99ff06f          	j	4308 <irq_attach>

00004374 <plic_init>:
    4374:	f0c007b7          	lui	a5,0xf0c00
    4378:	00100713          	li	a4,1
    437c:	00e7a023          	sw	a4,0(a5) # f0c00000 <_fstack+0xe0bff000>
    4380:	00e7a223          	sw	a4,4(a5)
    4384:	00e7a423          	sw	a4,8(a5)
    4388:	00e7a623          	sw	a4,12(a5)
    438c:	00e7a823          	sw	a4,16(a5)
    4390:	00e7aa23          	sw	a4,20(a5)
    4394:	00e7ac23          	sw	a4,24(a5)
    4398:	00e7ae23          	sw	a4,28(a5)
    439c:	f0c027b7          	lui	a5,0xf0c02
    43a0:	0ff00713          	li	a4,255
    43a4:	00e7a023          	sw	a4,0(a5) # f0c02000 <_fstack+0xe0c01000>
    43a8:	f0e007b7          	lui	a5,0xf0e00
    43ac:	0007a023          	sw	zero,0(a5) # f0e00000 <_fstack+0xe0dff000>
    43b0:	00008067          	ret

000043b4 <isr>:
    43b4:	fd010113          	addi	sp,sp,-48
    43b8:	02912223          	sw	s1,36(sp)
    43bc:	100004b7          	lui	s1,0x10000
    43c0:	03212023          	sw	s2,32(sp)
    43c4:	01312e23          	sw	s3,28(sp)
    43c8:	01412c23          	sw	s4,24(sp)
    43cc:	01512a23          	sw	s5,20(sp)
    43d0:	01612823          	sw	s6,16(sp)
    43d4:	01712623          	sw	s7,12(sp)
    43d8:	02112623          	sw	ra,44(sp)
    43dc:	02812423          	sw	s0,40(sp)
    43e0:	00008937          	lui	s2,0x8
    43e4:	000089b7          	lui	s3,0x8
    43e8:	00008a37          	lui	s4,0x8
    43ec:	00008ab7          	lui	s5,0x8
    43f0:	00008b37          	lui	s6,0x8
    43f4:	00008bb7          	lui	s7,0x8
    43f8:	4ac48493          	addi	s1,s1,1196 # 100004ac <irq_table>
    43fc:	f0e007b7          	lui	a5,0xf0e00
    4400:	0047a403          	lw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    4404:	02041863          	bnez	s0,4434 <isr+0x80>
    4408:	02c12083          	lw	ra,44(sp)
    440c:	02812403          	lw	s0,40(sp)
    4410:	02412483          	lw	s1,36(sp)
    4414:	02012903          	lw	s2,32(sp)
    4418:	01c12983          	lw	s3,28(sp)
    441c:	01812a03          	lw	s4,24(sp)
    4420:	01412a83          	lw	s5,20(sp)
    4424:	01012b03          	lw	s6,16(sp)
    4428:	00c12b83          	lw	s7,12(sp)
    442c:	03010113          	addi	sp,sp,48
    4430:	00008067          	ret
    4434:	00200793          	li	a5,2
    4438:	0287e263          	bltu	a5,s0,445c <isr+0xa8>
    443c:	00241793          	slli	a5,s0,0x2
    4440:	00f487b3          	add	a5,s1,a5
    4444:	0007a783          	lw	a5,0(a5)
    4448:	00078a63          	beqz	a5,445c <isr+0xa8>
    444c:	000780e7          	jalr	a5
    4450:	f0e007b7          	lui	a5,0xf0e00
    4454:	0087a223          	sw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    4458:	fa5ff06f          	j	43fc <isr+0x48>
    445c:	00040593          	mv	a1,s0
    4460:	ff890513          	addi	a0,s2,-8 # 7ff8 <crc_table+0x56c>
    4464:	874fe0ef          	jal	ra,24d8 <printf>
    4468:	f0c027b7          	lui	a5,0xf0c02
    446c:	0007a583          	lw	a1,0(a5) # f0c02000 <_fstack+0xe0c01000>
    4470:	01898513          	addi	a0,s3,24 # 8018 <crc_table+0x58c>
    4474:	864fe0ef          	jal	ra,24d8 <printf>
    4478:	f0c017b7          	lui	a5,0xf0c01
    447c:	0007a583          	lw	a1,0(a5) # f0c01000 <_fstack+0xe0c00000>
    4480:	034a0513          	addi	a0,s4,52 # 8034 <crc_table+0x5a8>
    4484:	854fe0ef          	jal	ra,24d8 <printf>
    4488:	341025f3          	csrr	a1,mepc
    448c:	050a8513          	addi	a0,s5,80 # 8050 <crc_table+0x5c4>
    4490:	848fe0ef          	jal	ra,24d8 <printf>
    4494:	342025f3          	csrr	a1,mcause
    4498:	064b0513          	addi	a0,s6,100 # 8064 <crc_table+0x5d8>
    449c:	83cfe0ef          	jal	ra,24d8 <printf>
    44a0:	343025f3          	csrr	a1,mtval
    44a4:	078b8513          	addi	a0,s7,120 # 8078 <crc_table+0x5ec>
    44a8:	830fe0ef          	jal	ra,24d8 <printf>
    44ac:	304025f3          	csrr	a1,mie
    44b0:	00008537          	lui	a0,0x8
    44b4:	08c50513          	addi	a0,a0,140 # 808c <crc_table+0x600>
    44b8:	820fe0ef          	jal	ra,24d8 <printf>
    44bc:	344025f3          	csrr	a1,mip
    44c0:	00008537          	lui	a0,0x8
    44c4:	0a050513          	addi	a0,a0,160 # 80a0 <crc_table+0x614>
    44c8:	810fe0ef          	jal	ra,24d8 <printf>
    44cc:	00008537          	lui	a0,0x8
    44d0:	0b450513          	addi	a0,a0,180 # 80b4 <crc_table+0x628>
    44d4:	804fe0ef          	jal	ra,24d8 <printf>
    44d8:	f79ff06f          	j	4450 <isr+0x9c>

000044dc <ff_uni2oem>:
    44dc:	07f00793          	li	a5,127
    44e0:	00050713          	mv	a4,a0
    44e4:	00a7e863          	bltu	a5,a0,44f4 <ff_uni2oem+0x18>
    44e8:	01051513          	slli	a0,a0,0x10
    44ec:	01055513          	srli	a0,a0,0x10
    44f0:	00008067          	ret
    44f4:	000107b7          	lui	a5,0x10
    44f8:	00000513          	li	a0,0
    44fc:	04f77063          	bgeu	a4,a5,453c <ff_uni2oem+0x60>
    4500:	1b500793          	li	a5,437
    4504:	02f59c63          	bne	a1,a5,453c <ff_uni2oem+0x60>
    4508:	000086b7          	lui	a3,0x8
    450c:	0f868693          	addi	a3,a3,248 # 80f8 <uc437>
    4510:	00000793          	li	a5,0
    4514:	08000593          	li	a1,128
    4518:	0006d603          	lhu	a2,0(a3)
    451c:	00e60c63          	beq	a2,a4,4534 <ff_uni2oem+0x58>
    4520:	00178793          	addi	a5,a5,1 # 10001 <_edata_rom+0x7825>
    4524:	01079793          	slli	a5,a5,0x10
    4528:	0107d793          	srli	a5,a5,0x10
    452c:	00268693          	addi	a3,a3,2
    4530:	feb794e3          	bne	a5,a1,4518 <ff_uni2oem+0x3c>
    4534:	08078513          	addi	a0,a5,128
    4538:	0ff57513          	andi	a0,a0,255
    453c:	00008067          	ret

00004540 <ff_oem2uni>:
    4540:	07f00793          	li	a5,127
    4544:	02a7f863          	bgeu	a5,a0,4574 <ff_oem2uni+0x34>
    4548:	1b500793          	li	a5,437
    454c:	02f59263          	bne	a1,a5,4570 <ff_oem2uni+0x30>
    4550:	0ff00793          	li	a5,255
    4554:	00a7ee63          	bltu	a5,a0,4570 <ff_oem2uni+0x30>
    4558:	000087b7          	lui	a5,0x8
    455c:	0f878793          	addi	a5,a5,248 # 80f8 <uc437>
    4560:	00151513          	slli	a0,a0,0x1
    4564:	00a78533          	add	a0,a5,a0
    4568:	f0055503          	lhu	a0,-256(a0)
    456c:	00008067          	ret
    4570:	00000513          	li	a0,0
    4574:	00008067          	ret

00004578 <ff_wtoupper>:
    4578:	000107b7          	lui	a5,0x10
    457c:	06f57e63          	bgeu	a0,a5,45f8 <ff_wtoupper+0x80>
    4580:	000086b7          	lui	a3,0x8
    4584:	01051793          	slli	a5,a0,0x10
    4588:	0f868693          	addi	a3,a3,248 # 80f8 <uc437>
    458c:	00001637          	lui	a2,0x1
    4590:	0107d793          	srli	a5,a5,0x10
    4594:	10068713          	addi	a4,a3,256
    4598:	00c56463          	bltu	a0,a2,45a0 <ff_wtoupper+0x28>
    459c:	2f468713          	addi	a4,a3,756
    45a0:	00075683          	lhu	a3,0(a4)
    45a4:	04068863          	beqz	a3,45f4 <ff_wtoupper+0x7c>
    45a8:	04d7e663          	bltu	a5,a3,45f4 <ff_wtoupper+0x7c>
    45ac:	00275603          	lhu	a2,2(a4)
    45b0:	00470713          	addi	a4,a4,4
    45b4:	00865593          	srli	a1,a2,0x8
    45b8:	0ff67613          	andi	a2,a2,255
    45bc:	00d60833          	add	a6,a2,a3
    45c0:	09055a63          	bge	a0,a6,4654 <ff_wtoupper+0xdc>
    45c4:	00800613          	li	a2,8
    45c8:	02b66663          	bltu	a2,a1,45f4 <ff_wtoupper+0x7c>
    45cc:	00008637          	lui	a2,0x8
    45d0:	0d460613          	addi	a2,a2,212 # 80d4 <crc_table+0x648>
    45d4:	00259593          	slli	a1,a1,0x2
    45d8:	00c585b3          	add	a1,a1,a2
    45dc:	0005a603          	lw	a2,0(a1)
    45e0:	00060067          	jr	a2
    45e4:	40d50533          	sub	a0,a0,a3
    45e8:	00151513          	slli	a0,a0,0x1
    45ec:	00a70533          	add	a0,a4,a0
    45f0:	00055783          	lhu	a5,0(a0)
    45f4:	00078513          	mv	a0,a5
    45f8:	00008067          	ret
    45fc:	40d78533          	sub	a0,a5,a3
    4600:	00157513          	andi	a0,a0,1
    4604:	40a787b3          	sub	a5,a5,a0
    4608:	01079793          	slli	a5,a5,0x10
    460c:	0107d793          	srli	a5,a5,0x10
    4610:	fe5ff06f          	j	45f4 <ff_wtoupper+0x7c>
    4614:	ff078793          	addi	a5,a5,-16 # fff0 <_edata_rom+0x7814>
    4618:	ff1ff06f          	j	4608 <ff_wtoupper+0x90>
    461c:	fe078793          	addi	a5,a5,-32
    4620:	fe9ff06f          	j	4608 <ff_wtoupper+0x90>
    4624:	fd078793          	addi	a5,a5,-48
    4628:	fe1ff06f          	j	4608 <ff_wtoupper+0x90>
    462c:	fe678793          	addi	a5,a5,-26
    4630:	fd9ff06f          	j	4608 <ff_wtoupper+0x90>
    4634:	00878793          	addi	a5,a5,8
    4638:	fd1ff06f          	j	4608 <ff_wtoupper+0x90>
    463c:	fb078793          	addi	a5,a5,-80
    4640:	fc9ff06f          	j	4608 <ff_wtoupper+0x90>
    4644:	ffffe737          	lui	a4,0xffffe
    4648:	3a070713          	addi	a4,a4,928 # ffffe3a0 <_fstack+0xefffd3a0>
    464c:	00e787b3          	add	a5,a5,a4
    4650:	fb9ff06f          	j	4608 <ff_wtoupper+0x90>
    4654:	f40596e3          	bnez	a1,45a0 <ff_wtoupper+0x28>
    4658:	00161613          	slli	a2,a2,0x1
    465c:	00c70733          	add	a4,a4,a2
    4660:	f41ff06f          	j	45a0 <ff_wtoupper+0x28>

00004664 <ld_dword>:
    4664:	00354783          	lbu	a5,3(a0)
    4668:	00254703          	lbu	a4,2(a0)
    466c:	00879793          	slli	a5,a5,0x8
    4670:	00e7e7b3          	or	a5,a5,a4
    4674:	00154703          	lbu	a4,1(a0)
    4678:	00879793          	slli	a5,a5,0x8
    467c:	00054503          	lbu	a0,0(a0)
    4680:	00f767b3          	or	a5,a4,a5
    4684:	00879793          	slli	a5,a5,0x8
    4688:	00f56533          	or	a0,a0,a5
    468c:	00008067          	ret

00004690 <mem_cmp>:
    4690:	00050793          	mv	a5,a0
    4694:	00c50633          	add	a2,a0,a2
    4698:	0007c503          	lbu	a0,0(a5)
    469c:	0005c703          	lbu	a4,0(a1)
    46a0:	00178793          	addi	a5,a5,1
    46a4:	00158593          	addi	a1,a1,1
    46a8:	40e50533          	sub	a0,a0,a4
    46ac:	00c78463          	beq	a5,a2,46b4 <mem_cmp+0x24>
    46b0:	fe0504e3          	beqz	a0,4698 <mem_cmp+0x8>
    46b4:	00008067          	ret

000046b8 <clst2sect>:
    46b8:	01052703          	lw	a4,16(a0)
    46bc:	ffe58793          	addi	a5,a1,-2
    46c0:	ffe70713          	addi	a4,a4,-2
    46c4:	00e7fc63          	bgeu	a5,a4,46dc <clst2sect+0x24>
    46c8:	00a55583          	lhu	a1,10(a0)
    46cc:	02452503          	lw	a0,36(a0)
    46d0:	02f585b3          	mul	a1,a1,a5
    46d4:	00a58533          	add	a0,a1,a0
    46d8:	00008067          	ret
    46dc:	00000513          	li	a0,0
    46e0:	00008067          	ret

000046e4 <get_ldnumber>:
    46e4:	00052703          	lw	a4,0(a0)
    46e8:	00050693          	mv	a3,a0
    46ec:	02070463          	beqz	a4,4714 <get_ldnumber+0x30>
    46f0:	00070793          	mv	a5,a4
    46f4:	01f00513          	li	a0,31
    46f8:	03a00593          	li	a1,58
    46fc:	0007c603          	lbu	a2,0(a5)
    4700:	00178793          	addi	a5,a5,1
    4704:	02c57663          	bgeu	a0,a2,4730 <get_ldnumber+0x4c>
    4708:	feb61ae3          	bne	a2,a1,46fc <get_ldnumber+0x18>
    470c:	00270613          	addi	a2,a4,2
    4710:	00c78663          	beq	a5,a2,471c <get_ldnumber+0x38>
    4714:	fff00513          	li	a0,-1
    4718:	00008067          	ret
    471c:	00074603          	lbu	a2,0(a4)
    4720:	03000713          	li	a4,48
    4724:	fff00513          	li	a0,-1
    4728:	fee618e3          	bne	a2,a4,4718 <get_ldnumber+0x34>
    472c:	00f6a023          	sw	a5,0(a3)
    4730:	00000513          	li	a0,0
    4734:	00008067          	ret

00004738 <validate>:
    4738:	ff010113          	addi	sp,sp,-16
    473c:	00912223          	sw	s1,4(sp)
    4740:	00112623          	sw	ra,12(sp)
    4744:	00812423          	sw	s0,8(sp)
    4748:	00058493          	mv	s1,a1
    474c:	02051263          	bnez	a0,4770 <validate+0x38>
    4750:	00900513          	li	a0,9
    4754:	00000793          	li	a5,0
    4758:	00c12083          	lw	ra,12(sp)
    475c:	00812403          	lw	s0,8(sp)
    4760:	00f4a023          	sw	a5,0(s1)
    4764:	00412483          	lw	s1,4(sp)
    4768:	01010113          	addi	sp,sp,16
    476c:	00008067          	ret
    4770:	00052783          	lw	a5,0(a0)
    4774:	00050413          	mv	s0,a0
    4778:	fc078ce3          	beqz	a5,4750 <validate+0x18>
    477c:	0007c703          	lbu	a4,0(a5)
    4780:	fc0708e3          	beqz	a4,4750 <validate+0x18>
    4784:	00455683          	lhu	a3,4(a0)
    4788:	0067d703          	lhu	a4,6(a5)
    478c:	fce692e3          	bne	a3,a4,4750 <validate+0x18>
    4790:	10000737          	lui	a4,0x10000
    4794:	4b872703          	lw	a4,1208(a4) # 100004b8 <FfDiskOps>
    4798:	0017c503          	lbu	a0,1(a5)
    479c:	00472703          	lw	a4,4(a4)
    47a0:	000700e7          	jalr	a4
    47a4:	00157513          	andi	a0,a0,1
    47a8:	fa0514e3          	bnez	a0,4750 <validate+0x18>
    47ac:	00042783          	lw	a5,0(s0)
    47b0:	fa9ff06f          	j	4758 <validate+0x20>

000047b4 <move_window>:
    47b4:	02852783          	lw	a5,40(a0)
    47b8:	06b78063          	beq	a5,a1,4818 <move_window+0x64>
    47bc:	100007b7          	lui	a5,0x10000
    47c0:	4b87a783          	lw	a5,1208(a5) # 100004b8 <FfDiskOps>
    47c4:	ff010113          	addi	sp,sp,-16
    47c8:	00812423          	sw	s0,8(sp)
    47cc:	00912223          	sw	s1,4(sp)
    47d0:	00112623          	sw	ra,12(sp)
    47d4:	00050413          	mv	s0,a0
    47d8:	00058493          	mv	s1,a1
    47dc:	00058613          	mv	a2,a1
    47e0:	0087a783          	lw	a5,8(a5)
    47e4:	02c50593          	addi	a1,a0,44
    47e8:	00154503          	lbu	a0,1(a0)
    47ec:	00100693          	li	a3,1
    47f0:	000780e7          	jalr	a5
    47f4:	00050663          	beqz	a0,4800 <move_window+0x4c>
    47f8:	00100513          	li	a0,1
    47fc:	fff00493          	li	s1,-1
    4800:	02942423          	sw	s1,40(s0)
    4804:	00c12083          	lw	ra,12(sp)
    4808:	00812403          	lw	s0,8(sp)
    480c:	00412483          	lw	s1,4(sp)
    4810:	01010113          	addi	sp,sp,16
    4814:	00008067          	ret
    4818:	00000513          	li	a0,0
    481c:	00008067          	ret

00004820 <get_fat.isra.0>:
    4820:	00100793          	li	a5,1
    4824:	14b7f263          	bgeu	a5,a1,4968 <get_fat.isra.0+0x148>
    4828:	01052703          	lw	a4,16(a0)
    482c:	fe010113          	addi	sp,sp,-32
    4830:	00812c23          	sw	s0,24(sp)
    4834:	00912a23          	sw	s1,20(sp)
    4838:	00112e23          	sw	ra,28(sp)
    483c:	01212823          	sw	s2,16(sp)
    4840:	01312623          	sw	s3,12(sp)
    4844:	00050493          	mv	s1,a0
    4848:	00058413          	mv	s0,a1
    484c:	02e5fe63          	bgeu	a1,a4,4888 <get_fat.isra.0+0x68>
    4850:	00054703          	lbu	a4,0(a0)
    4854:	00200693          	li	a3,2
    4858:	0ad70463          	beq	a4,a3,4900 <get_fat.isra.0+0xe0>
    485c:	00300693          	li	a3,3
    4860:	0cd70c63          	beq	a4,a3,4938 <get_fat.isra.0+0x118>
    4864:	02f71263          	bne	a4,a5,4888 <get_fat.isra.0+0x68>
    4868:	0015d913          	srli	s2,a1,0x1
    486c:	01c52783          	lw	a5,28(a0)
    4870:	00b90933          	add	s2,s2,a1
    4874:	00995593          	srli	a1,s2,0x9
    4878:	00f585b3          	add	a1,a1,a5
    487c:	f39ff0ef          	jal	ra,47b4 <move_window>
    4880:	02050463          	beqz	a0,48a8 <get_fat.isra.0+0x88>
    4884:	fff00793          	li	a5,-1
    4888:	01c12083          	lw	ra,28(sp)
    488c:	01812403          	lw	s0,24(sp)
    4890:	01412483          	lw	s1,20(sp)
    4894:	01012903          	lw	s2,16(sp)
    4898:	00c12983          	lw	s3,12(sp)
    489c:	00078513          	mv	a0,a5
    48a0:	02010113          	addi	sp,sp,32
    48a4:	00008067          	ret
    48a8:	01c4a783          	lw	a5,28(s1)
    48ac:	00190993          	addi	s3,s2,1
    48b0:	0099d593          	srli	a1,s3,0x9
    48b4:	1ff97913          	andi	s2,s2,511
    48b8:	01248933          	add	s2,s1,s2
    48bc:	00f585b3          	add	a1,a1,a5
    48c0:	00048513          	mv	a0,s1
    48c4:	02c94903          	lbu	s2,44(s2)
    48c8:	eedff0ef          	jal	ra,47b4 <move_window>
    48cc:	fa051ce3          	bnez	a0,4884 <get_fat.isra.0+0x64>
    48d0:	1ff9f993          	andi	s3,s3,511
    48d4:	013484b3          	add	s1,s1,s3
    48d8:	02c4c783          	lbu	a5,44(s1)
    48dc:	00147413          	andi	s0,s0,1
    48e0:	00879793          	slli	a5,a5,0x8
    48e4:	0127e7b3          	or	a5,a5,s2
    48e8:	00040663          	beqz	s0,48f4 <get_fat.isra.0+0xd4>
    48ec:	0047d793          	srli	a5,a5,0x4
    48f0:	f99ff06f          	j	4888 <get_fat.isra.0+0x68>
    48f4:	01479793          	slli	a5,a5,0x14
    48f8:	0147d793          	srli	a5,a5,0x14
    48fc:	f8dff06f          	j	4888 <get_fat.isra.0+0x68>
    4900:	01c52783          	lw	a5,28(a0)
    4904:	0085d593          	srli	a1,a1,0x8
    4908:	00f585b3          	add	a1,a1,a5
    490c:	ea9ff0ef          	jal	ra,47b4 <move_window>
    4910:	f6051ae3          	bnez	a0,4884 <get_fat.isra.0+0x64>
    4914:	00141413          	slli	s0,s0,0x1
    4918:	02c48493          	addi	s1,s1,44
    491c:	1fe47413          	andi	s0,s0,510
    4920:	008484b3          	add	s1,s1,s0
    4924:	0014c783          	lbu	a5,1(s1)
    4928:	0004c503          	lbu	a0,0(s1)
    492c:	00879793          	slli	a5,a5,0x8
    4930:	00a7e7b3          	or	a5,a5,a0
    4934:	f55ff06f          	j	4888 <get_fat.isra.0+0x68>
    4938:	01c52783          	lw	a5,28(a0)
    493c:	0075d593          	srli	a1,a1,0x7
    4940:	00f585b3          	add	a1,a1,a5
    4944:	e71ff0ef          	jal	ra,47b4 <move_window>
    4948:	f2051ee3          	bnez	a0,4884 <get_fat.isra.0+0x64>
    494c:	00241413          	slli	s0,s0,0x2
    4950:	02c48513          	addi	a0,s1,44
    4954:	1fc47413          	andi	s0,s0,508
    4958:	00850533          	add	a0,a0,s0
    495c:	d09ff0ef          	jal	ra,4664 <ld_dword>
    4960:	00451793          	slli	a5,a0,0x4
    4964:	f89ff06f          	j	48ec <get_fat.isra.0+0xcc>
    4968:	00100793          	li	a5,1
    496c:	00078513          	mv	a0,a5
    4970:	00008067          	ret

00004974 <dir_next.isra.0>:
    4974:	fe010113          	addi	sp,sp,-32
    4978:	01212823          	sw	s2,16(sp)
    497c:	01052903          	lw	s2,16(a0)
    4980:	00812c23          	sw	s0,24(sp)
    4984:	00912a23          	sw	s1,20(sp)
    4988:	00112e23          	sw	ra,28(sp)
    498c:	01312623          	sw	s3,12(sp)
    4990:	02090913          	addi	s2,s2,32
    4994:	002007b7          	lui	a5,0x200
    4998:	00052483          	lw	s1,0(a0)
    499c:	00050413          	mv	s0,a0
    49a0:	00f96463          	bltu	s2,a5,49a8 <dir_next.isra.0+0x34>
    49a4:	00052c23          	sw	zero,24(a0)
    49a8:	01842783          	lw	a5,24(s0)
    49ac:	00400513          	li	a0,4
    49b0:	02078863          	beqz	a5,49e0 <dir_next.isra.0+0x6c>
    49b4:	1ff97993          	andi	s3,s2,511
    49b8:	08099a63          	bnez	s3,4a4c <dir_next.isra.0+0xd8>
    49bc:	01442583          	lw	a1,20(s0)
    49c0:	00178793          	addi	a5,a5,1 # 200001 <_edata_rom+0x1f7825>
    49c4:	00f42c23          	sw	a5,24(s0)
    49c8:	02059a63          	bnez	a1,49fc <dir_next.isra.0+0x88>
    49cc:	0084d703          	lhu	a4,8(s1)
    49d0:	00595793          	srli	a5,s2,0x5
    49d4:	06e7ec63          	bltu	a5,a4,4a4c <dir_next.isra.0+0xd8>
    49d8:	00042c23          	sw	zero,24(s0)
    49dc:	00400513          	li	a0,4
    49e0:	01c12083          	lw	ra,28(sp)
    49e4:	01812403          	lw	s0,24(sp)
    49e8:	01412483          	lw	s1,20(sp)
    49ec:	01012903          	lw	s2,16(sp)
    49f0:	00c12983          	lw	s3,12(sp)
    49f4:	02010113          	addi	sp,sp,32
    49f8:	00008067          	ret
    49fc:	00a4d783          	lhu	a5,10(s1)
    4a00:	00995713          	srli	a4,s2,0x9
    4a04:	fff78793          	addi	a5,a5,-1
    4a08:	00e7f7b3          	and	a5,a5,a4
    4a0c:	04079063          	bnez	a5,4a4c <dir_next.isra.0+0xd8>
    4a10:	00048513          	mv	a0,s1
    4a14:	e0dff0ef          	jal	ra,4820 <get_fat.isra.0>
    4a18:	00050593          	mv	a1,a0
    4a1c:	00100793          	li	a5,1
    4a20:	00200513          	li	a0,2
    4a24:	fab7fee3          	bgeu	a5,a1,49e0 <dir_next.isra.0+0x6c>
    4a28:	fff00793          	li	a5,-1
    4a2c:	00100513          	li	a0,1
    4a30:	faf588e3          	beq	a1,a5,49e0 <dir_next.isra.0+0x6c>
    4a34:	0104a783          	lw	a5,16(s1)
    4a38:	faf5f0e3          	bgeu	a1,a5,49d8 <dir_next.isra.0+0x64>
    4a3c:	00b42a23          	sw	a1,20(s0)
    4a40:	00048513          	mv	a0,s1
    4a44:	c75ff0ef          	jal	ra,46b8 <clst2sect>
    4a48:	00a42c23          	sw	a0,24(s0)
    4a4c:	02c48493          	addi	s1,s1,44
    4a50:	013484b3          	add	s1,s1,s3
    4a54:	01242823          	sw	s2,16(s0)
    4a58:	00942e23          	sw	s1,28(s0)
    4a5c:	00000513          	li	a0,0
    4a60:	f81ff06f          	j	49e0 <dir_next.isra.0+0x6c>

00004a64 <ld_clust.isra.0>:
    4a64:	01b5c783          	lbu	a5,27(a1)
    4a68:	01a5c703          	lbu	a4,26(a1)
    4a6c:	00879793          	slli	a5,a5,0x8
    4a70:	00e7e7b3          	or	a5,a5,a4
    4a74:	00300713          	li	a4,3
    4a78:	00e51e63          	bne	a0,a4,4a94 <ld_clust.isra.0+0x30>
    4a7c:	0155c703          	lbu	a4,21(a1)
    4a80:	0145c683          	lbu	a3,20(a1)
    4a84:	00871713          	slli	a4,a4,0x8
    4a88:	00d76733          	or	a4,a4,a3
    4a8c:	01071713          	slli	a4,a4,0x10
    4a90:	00e7e7b3          	or	a5,a5,a4
    4a94:	00078513          	mv	a0,a5
    4a98:	00008067          	ret

00004a9c <check_fs>:
    4a9c:	ff010113          	addi	sp,sp,-16
    4aa0:	00812423          	sw	s0,8(sp)
    4aa4:	00912223          	sw	s1,4(sp)
    4aa8:	00112623          	sw	ra,12(sp)
    4aac:	fff00793          	li	a5,-1
    4ab0:	000501a3          	sb	zero,3(a0)
    4ab4:	02f52423          	sw	a5,40(a0)
    4ab8:	00050413          	mv	s0,a0
    4abc:	cf9ff0ef          	jal	ra,47b4 <move_window>
    4ac0:	00400493          	li	s1,4
    4ac4:	06051e63          	bnez	a0,4b40 <check_fs+0xa4>
    4ac8:	22b44783          	lbu	a5,555(s0)
    4acc:	22a44703          	lbu	a4,554(s0)
    4ad0:	00300493          	li	s1,3
    4ad4:	00879793          	slli	a5,a5,0x8
    4ad8:	00e7e7b3          	or	a5,a5,a4
    4adc:	01079793          	slli	a5,a5,0x10
    4ae0:	ffffb737          	lui	a4,0xffffb
    4ae4:	4107d793          	srai	a5,a5,0x10
    4ae8:	a5570713          	addi	a4,a4,-1451 # ffffaa55 <_fstack+0xefff9a55>
    4aec:	04e79a63          	bne	a5,a4,4b40 <check_fs+0xa4>
    4af0:	02c44783          	lbu	a5,44(s0)
    4af4:	0eb00713          	li	a4,235
    4af8:	00050493          	mv	s1,a0
    4afc:	00e78a63          	beq	a5,a4,4b10 <check_fs+0x74>
    4b00:	01878793          	addi	a5,a5,24
    4b04:	0ff7f793          	andi	a5,a5,255
    4b08:	00100713          	li	a4,1
    4b0c:	04f76663          	bltu	a4,a5,4b58 <check_fs+0xbc>
    4b10:	000085b7          	lui	a1,0x8
    4b14:	00300613          	li	a2,3
    4b18:	4a858593          	addi	a1,a1,1192 # 84a8 <cvt2.1220+0xbc>
    4b1c:	06240513          	addi	a0,s0,98
    4b20:	b71ff0ef          	jal	ra,4690 <mem_cmp>
    4b24:	00050e63          	beqz	a0,4b40 <check_fs+0xa4>
    4b28:	000085b7          	lui	a1,0x8
    4b2c:	00500613          	li	a2,5
    4b30:	4ac58593          	addi	a1,a1,1196 # 84ac <cvt2.1220+0xc0>
    4b34:	07e40513          	addi	a0,s0,126
    4b38:	b59ff0ef          	jal	ra,4690 <mem_cmp>
    4b3c:	00051e63          	bnez	a0,4b58 <check_fs+0xbc>
    4b40:	00c12083          	lw	ra,12(sp)
    4b44:	00812403          	lw	s0,8(sp)
    4b48:	00048513          	mv	a0,s1
    4b4c:	00412483          	lw	s1,4(sp)
    4b50:	01010113          	addi	sp,sp,16
    4b54:	00008067          	ret
    4b58:	00200493          	li	s1,2
    4b5c:	fe5ff06f          	j	4b40 <check_fs+0xa4>

00004b60 <mount_volume.isra.0>:
    4b60:	fd010113          	addi	sp,sp,-48
    4b64:	03212023          	sw	s2,32(sp)
    4b68:	02112623          	sw	ra,44(sp)
    4b6c:	02812423          	sw	s0,40(sp)
    4b70:	02912223          	sw	s1,36(sp)
    4b74:	01312e23          	sw	s3,28(sp)
    4b78:	01412c23          	sw	s4,24(sp)
    4b7c:	01512a23          	sw	s5,20(sp)
    4b80:	01612823          	sw	s6,16(sp)
    4b84:	0005a023          	sw	zero,0(a1)
    4b88:	00058913          	mv	s2,a1
    4b8c:	b59ff0ef          	jal	ra,46e4 <get_ldnumber>
    4b90:	30054863          	bltz	a0,4ea0 <mount_volume.isra.0+0x340>
    4b94:	10000737          	lui	a4,0x10000
    4b98:	00251793          	slli	a5,a0,0x2
    4b9c:	19470713          	addi	a4,a4,404 # 10000194 <FatFs>
    4ba0:	00e787b3          	add	a5,a5,a4
    4ba4:	0007a403          	lw	s0,0(a5)
    4ba8:	00050493          	mv	s1,a0
    4bac:	00c00513          	li	a0,12
    4bb0:	02040c63          	beqz	s0,4be8 <mount_volume.isra.0+0x88>
    4bb4:	00892023          	sw	s0,0(s2)
    4bb8:	00044783          	lbu	a5,0(s0)
    4bbc:	10000937          	lui	s2,0x10000
    4bc0:	04079863          	bnez	a5,4c10 <mount_volume.isra.0+0xb0>
    4bc4:	0ff4f513          	andi	a0,s1,255
    4bc8:	00040023          	sb	zero,0(s0)
    4bcc:	00a400a3          	sb	a0,1(s0)
    4bd0:	4b892783          	lw	a5,1208(s2) # 100004b8 <FfDiskOps>
    4bd4:	0007a783          	lw	a5,0(a5)
    4bd8:	000780e7          	jalr	a5
    4bdc:	00157793          	andi	a5,a0,1
    4be0:	00300513          	li	a0,3
    4be4:	04078663          	beqz	a5,4c30 <mount_volume.isra.0+0xd0>
    4be8:	02c12083          	lw	ra,44(sp)
    4bec:	02812403          	lw	s0,40(sp)
    4bf0:	02412483          	lw	s1,36(sp)
    4bf4:	02012903          	lw	s2,32(sp)
    4bf8:	01c12983          	lw	s3,28(sp)
    4bfc:	01812a03          	lw	s4,24(sp)
    4c00:	01412a83          	lw	s5,20(sp)
    4c04:	01012b03          	lw	s6,16(sp)
    4c08:	03010113          	addi	sp,sp,48
    4c0c:	00008067          	ret
    4c10:	4b892783          	lw	a5,1208(s2)
    4c14:	00144503          	lbu	a0,1(s0)
    4c18:	0047a783          	lw	a5,4(a5)
    4c1c:	000780e7          	jalr	a5
    4c20:	00157793          	andi	a5,a0,1
    4c24:	00000513          	li	a0,0
    4c28:	f8079ee3          	bnez	a5,4bc4 <mount_volume.isra.0+0x64>
    4c2c:	fbdff06f          	j	4be8 <mount_volume.isra.0+0x88>
    4c30:	00000593          	li	a1,0
    4c34:	00040513          	mv	a0,s0
    4c38:	e65ff0ef          	jal	ra,4a9c <check_fs>
    4c3c:	00200713          	li	a4,2
    4c40:	00050793          	mv	a5,a0
    4c44:	06e51663          	bne	a0,a4,4cb0 <mount_volume.isra.0+0x150>
    4c48:	00010493          	mv	s1,sp
    4c4c:	1f240913          	addi	s2,s0,498
    4c50:	23240a13          	addi	s4,s0,562
    4c54:	00048993          	mv	s3,s1
    4c58:	00090513          	mv	a0,s2
    4c5c:	a09ff0ef          	jal	ra,4664 <ld_dword>
    4c60:	00a9a023          	sw	a0,0(s3)
    4c64:	01090913          	addi	s2,s2,16
    4c68:	00498993          	addi	s3,s3,4
    4c6c:	ff2a16e3          	bne	s4,s2,4c58 <mount_volume.isra.0+0xf8>
    4c70:	01048913          	addi	s2,s1,16
    4c74:	00100993          	li	s3,1
    4c78:	0004a583          	lw	a1,0(s1)
    4c7c:	00300793          	li	a5,3
    4c80:	00058a63          	beqz	a1,4c94 <mount_volume.isra.0+0x134>
    4c84:	00040513          	mv	a0,s0
    4c88:	e15ff0ef          	jal	ra,4a9c <check_fs>
    4c8c:	00050793          	mv	a5,a0
    4c90:	02a9fa63          	bgeu	s3,a0,4cc4 <mount_volume.isra.0+0x164>
    4c94:	00448493          	addi	s1,s1,4
    4c98:	fe9910e3          	bne	s2,s1,4c78 <mount_volume.isra.0+0x118>
    4c9c:	00400713          	li	a4,4
    4ca0:	00100513          	li	a0,1
    4ca4:	f4e782e3          	beq	a5,a4,4be8 <mount_volume.isra.0+0x88>
    4ca8:	00d00513          	li	a0,13
    4cac:	f3dff06f          	j	4be8 <mount_volume.isra.0+0x88>
    4cb0:	00400713          	li	a4,4
    4cb4:	00100513          	li	a0,1
    4cb8:	f2e788e3          	beq	a5,a4,4be8 <mount_volume.isra.0+0x88>
    4cbc:	00100713          	li	a4,1
    4cc0:	fef764e3          	bltu	a4,a5,4ca8 <mount_volume.isra.0+0x148>
    4cc4:	03844783          	lbu	a5,56(s0)
    4cc8:	03744703          	lbu	a4,55(s0)
    4ccc:	00879793          	slli	a5,a5,0x8
    4cd0:	00e7e7b3          	or	a5,a5,a4
    4cd4:	01079793          	slli	a5,a5,0x10
    4cd8:	4107d793          	srai	a5,a5,0x10
    4cdc:	20000713          	li	a4,512
    4ce0:	fce794e3          	bne	a5,a4,4ca8 <mount_volume.isra.0+0x148>
    4ce4:	04344903          	lbu	s2,67(s0)
    4ce8:	04244503          	lbu	a0,66(s0)
    4cec:	00891913          	slli	s2,s2,0x8
    4cf0:	00a96933          	or	s2,s2,a0
    4cf4:	00091863          	bnez	s2,4d04 <mount_volume.isra.0+0x1a4>
    4cf8:	05040513          	addi	a0,s0,80
    4cfc:	969ff0ef          	jal	ra,4664 <ld_dword>
    4d00:	00050913          	mv	s2,a0
    4d04:	03c44483          	lbu	s1,60(s0)
    4d08:	01242a23          	sw	s2,20(s0)
    4d0c:	00100713          	li	a4,1
    4d10:	fff48793          	addi	a5,s1,-1
    4d14:	00940123          	sb	s1,2(s0)
    4d18:	0ff7f793          	andi	a5,a5,255
    4d1c:	02842b03          	lw	s6,40(s0)
    4d20:	f8f764e3          	bltu	a4,a5,4ca8 <mount_volume.isra.0+0x148>
    4d24:	03944a03          	lbu	s4,57(s0)
    4d28:	010a1793          	slli	a5,s4,0x10
    4d2c:	0107d793          	srli	a5,a5,0x10
    4d30:	00f41523          	sh	a5,10(s0)
    4d34:	f6078ae3          	beqz	a5,4ca8 <mount_volume.isra.0+0x148>
    4d38:	fffa0793          	addi	a5,s4,-1
    4d3c:	0147f7b3          	and	a5,a5,s4
    4d40:	f60794e3          	bnez	a5,4ca8 <mount_volume.isra.0+0x148>
    4d44:	03e44983          	lbu	s3,62(s0)
    4d48:	03d44783          	lbu	a5,61(s0)
    4d4c:	00899993          	slli	s3,s3,0x8
    4d50:	00f9e9b3          	or	s3,s3,a5
    4d54:	01099a93          	slli	s5,s3,0x10
    4d58:	01099993          	slli	s3,s3,0x10
    4d5c:	0109d993          	srli	s3,s3,0x10
    4d60:	01341423          	sh	s3,8(s0)
    4d64:	00f9f793          	andi	a5,s3,15
    4d68:	410ada93          	srai	s5,s5,0x10
    4d6c:	f2079ee3          	bnez	a5,4ca8 <mount_volume.isra.0+0x148>
    4d70:	04044783          	lbu	a5,64(s0)
    4d74:	03f44503          	lbu	a0,63(s0)
    4d78:	00879793          	slli	a5,a5,0x8
    4d7c:	00a7e533          	or	a0,a5,a0
    4d80:	00051663          	bnez	a0,4d8c <mount_volume.isra.0+0x22c>
    4d84:	04c40513          	addi	a0,s0,76
    4d88:	8ddff0ef          	jal	ra,4664 <ld_dword>
    4d8c:	03b44703          	lbu	a4,59(s0)
    4d90:	03a44783          	lbu	a5,58(s0)
    4d94:	00871713          	slli	a4,a4,0x8
    4d98:	00f76733          	or	a4,a4,a5
    4d9c:	f00706e3          	beqz	a4,4ca8 <mount_volume.isra.0+0x148>
    4da0:	03248633          	mul	a2,s1,s2
    4da4:	0049d693          	srli	a3,s3,0x4
    4da8:	00e686b3          	add	a3,a3,a4
    4dac:	00c686b3          	add	a3,a3,a2
    4db0:	eed56ce3          	bltu	a0,a3,4ca8 <mount_volume.isra.0+0x148>
    4db4:	40d507b3          	sub	a5,a0,a3
    4db8:	0347d4b3          	divu	s1,a5,s4
    4dbc:	ef47e6e3          	bltu	a5,s4,4ca8 <mount_volume.isra.0+0x148>
    4dc0:	100007b7          	lui	a5,0x10000
    4dc4:	ff578793          	addi	a5,a5,-11 # ffffff5 <_edata_rom+0xfff7819>
    4dc8:	ee97e0e3          	bltu	a5,s1,4ca8 <mount_volume.isra.0+0x148>
    4dcc:	000107b7          	lui	a5,0x10
    4dd0:	ff578793          	addi	a5,a5,-11 # fff5 <_edata_rom+0x7819>
    4dd4:	0c97fa63          	bgeu	a5,s1,4ea8 <mount_volume.isra.0+0x348>
    4dd8:	00300a13          	li	s4,3
    4ddc:	00248493          	addi	s1,s1,2
    4de0:	00eb0733          	add	a4,s6,a4
    4de4:	00db06b3          	add	a3,s6,a3
    4de8:	00942823          	sw	s1,16(s0)
    4dec:	01642c23          	sw	s6,24(s0)
    4df0:	00e42e23          	sw	a4,28(s0)
    4df4:	02d42223          	sw	a3,36(s0)
    4df8:	00300793          	li	a5,3
    4dfc:	06fa1a63          	bne	s4,a5,4e70 <mount_volume.isra.0+0x310>
    4e00:	05744783          	lbu	a5,87(s0)
    4e04:	05644703          	lbu	a4,86(s0)
    4e08:	00879793          	slli	a5,a5,0x8
    4e0c:	00e7e7b3          	or	a5,a5,a4
    4e10:	00fae7b3          	or	a5,s5,a5
    4e14:	01079793          	slli	a5,a5,0x10
    4e18:	4107d793          	srai	a5,a5,0x10
    4e1c:	e80796e3          	bnez	a5,4ca8 <mount_volume.isra.0+0x148>
    4e20:	05840513          	addi	a0,s0,88
    4e24:	841ff0ef          	jal	ra,4664 <ld_dword>
    4e28:	02a42023          	sw	a0,32(s0)
    4e2c:	00249493          	slli	s1,s1,0x2
    4e30:	1ff48493          	addi	s1,s1,511
    4e34:	0094d493          	srli	s1,s1,0x9
    4e38:	e69968e3          	bltu	s2,s1,4ca8 <mount_volume.isra.0+0x148>
    4e3c:	10000737          	lui	a4,0x10000
    4e40:	19075783          	lhu	a5,400(a4) # 10000190 <Fsid>
    4e44:	01440023          	sb	s4,0(s0)
    4e48:	00000513          	li	a0,0
    4e4c:	00178793          	addi	a5,a5,1
    4e50:	01079793          	slli	a5,a5,0x10
    4e54:	0107d793          	srli	a5,a5,0x10
    4e58:	18f71823          	sh	a5,400(a4)
    4e5c:	00f41323          	sh	a5,6(s0)
    4e60:	100007b7          	lui	a5,0x10000
    4e64:	2ac78793          	addi	a5,a5,684 # 100002ac <LfnBuf>
    4e68:	00f42623          	sw	a5,12(s0)
    4e6c:	d7dff06f          	j	4be8 <mount_volume.isra.0+0x88>
    4e70:	e2098ce3          	beqz	s3,4ca8 <mount_volume.isra.0+0x148>
    4e74:	00e60733          	add	a4,a2,a4
    4e78:	02e42023          	sw	a4,32(s0)
    4e7c:	00200713          	li	a4,2
    4e80:	00ea1663          	bne	s4,a4,4e8c <mount_volume.isra.0+0x32c>
    4e84:	00149493          	slli	s1,s1,0x1
    4e88:	fa9ff06f          	j	4e30 <mount_volume.isra.0+0x2d0>
    4e8c:	02f487b3          	mul	a5,s1,a5
    4e90:	0014f493          	andi	s1,s1,1
    4e94:	0017d793          	srli	a5,a5,0x1
    4e98:	009784b3          	add	s1,a5,s1
    4e9c:	f95ff06f          	j	4e30 <mount_volume.isra.0+0x2d0>
    4ea0:	00b00513          	li	a0,11
    4ea4:	d45ff06f          	j	4be8 <mount_volume.isra.0+0x88>
    4ea8:	00001a37          	lui	s4,0x1
    4eac:	ff5a0a13          	addi	s4,s4,-11 # ff5 <dump_bytes+0x75>
    4eb0:	009a3a33          	sltu	s4,s4,s1
    4eb4:	001a0a13          	addi	s4,s4,1
    4eb8:	f25ff06f          	j	4ddc <mount_volume.isra.0+0x27c>

00004ebc <dir_sdi.constprop.0>:
    4ebc:	fd010113          	addi	sp,sp,-48
    4ec0:	00852583          	lw	a1,8(a0)
    4ec4:	02812423          	sw	s0,40(sp)
    4ec8:	02912223          	sw	s1,36(sp)
    4ecc:	02112623          	sw	ra,44(sp)
    4ed0:	03212023          	sw	s2,32(sp)
    4ed4:	01312e23          	sw	s3,28(sp)
    4ed8:	00052823          	sw	zero,16(a0)
    4edc:	00052483          	lw	s1,0(a0)
    4ee0:	00050413          	mv	s0,a0
    4ee4:	06059463          	bnez	a1,4f4c <dir_sdi.constprop.0+0x90>
    4ee8:	0004c703          	lbu	a4,0(s1)
    4eec:	00200793          	li	a5,2
    4ef0:	00e7f663          	bgeu	a5,a4,4efc <dir_sdi.constprop.0+0x40>
    4ef4:	0204a783          	lw	a5,32(s1)
    4ef8:	04079863          	bnez	a5,4f48 <dir_sdi.constprop.0+0x8c>
    4efc:	0084d783          	lhu	a5,8(s1)
    4f00:	02079263          	bnez	a5,4f24 <dir_sdi.constprop.0+0x68>
    4f04:	00200513          	li	a0,2
    4f08:	02c12083          	lw	ra,44(sp)
    4f0c:	02812403          	lw	s0,40(sp)
    4f10:	02412483          	lw	s1,36(sp)
    4f14:	02012903          	lw	s2,32(sp)
    4f18:	01c12983          	lw	s3,28(sp)
    4f1c:	03010113          	addi	sp,sp,48
    4f20:	00008067          	ret
    4f24:	0204a783          	lw	a5,32(s1)
    4f28:	00f42c23          	sw	a5,24(s0)
    4f2c:	01842783          	lw	a5,24(s0)
    4f30:	00b42a23          	sw	a1,20(s0)
    4f34:	fc0788e3          	beqz	a5,4f04 <dir_sdi.constprop.0+0x48>
    4f38:	02c48493          	addi	s1,s1,44
    4f3c:	00942e23          	sw	s1,28(s0)
    4f40:	00000513          	li	a0,0
    4f44:	fc5ff06f          	j	4f08 <dir_sdi.constprop.0+0x4c>
    4f48:	00078593          	mv	a1,a5
    4f4c:	00a4d783          	lhu	a5,10(s1)
    4f50:	fff00913          	li	s2,-1
    4f54:	00100993          	li	s3,1
    4f58:	02079263          	bnez	a5,4f7c <dir_sdi.constprop.0+0xc0>
    4f5c:	00042503          	lw	a0,0(s0)
    4f60:	8c1ff0ef          	jal	ra,4820 <get_fat.isra.0>
    4f64:	00050593          	mv	a1,a0
    4f68:	03250663          	beq	a0,s2,4f94 <dir_sdi.constprop.0+0xd8>
    4f6c:	f8a9fce3          	bgeu	s3,a0,4f04 <dir_sdi.constprop.0+0x48>
    4f70:	0104a783          	lw	a5,16(s1)
    4f74:	fef564e3          	bltu	a0,a5,4f5c <dir_sdi.constprop.0+0xa0>
    4f78:	f8dff06f          	j	4f04 <dir_sdi.constprop.0+0x48>
    4f7c:	00048513          	mv	a0,s1
    4f80:	00b12623          	sw	a1,12(sp)
    4f84:	f34ff0ef          	jal	ra,46b8 <clst2sect>
    4f88:	00c12583          	lw	a1,12(sp)
    4f8c:	00a42c23          	sw	a0,24(s0)
    4f90:	f9dff06f          	j	4f2c <dir_sdi.constprop.0+0x70>
    4f94:	00100513          	li	a0,1
    4f98:	f71ff06f          	j	4f08 <dir_sdi.constprop.0+0x4c>

00004f9c <follow_path>:
    4f9c:	fb010113          	addi	sp,sp,-80
    4fa0:	03712623          	sw	s7,44(sp)
    4fa4:	00052b83          	lw	s7,0(a0)
    4fa8:	04812423          	sw	s0,72(sp)
    4fac:	05212023          	sw	s2,64(sp)
    4fb0:	04112623          	sw	ra,76(sp)
    4fb4:	04912223          	sw	s1,68(sp)
    4fb8:	03312e23          	sw	s3,60(sp)
    4fbc:	03412c23          	sw	s4,56(sp)
    4fc0:	03512a23          	sw	s5,52(sp)
    4fc4:	03612823          	sw	s6,48(sp)
    4fc8:	03812423          	sw	s8,40(sp)
    4fcc:	03912223          	sw	s9,36(sp)
    4fd0:	03a12023          	sw	s10,32(sp)
    4fd4:	01b12e23          	sw	s11,28(sp)
    4fd8:	00050413          	mv	s0,a0
    4fdc:	00058913          	mv	s2,a1
    4fe0:	02f00693          	li	a3,47
    4fe4:	05c00713          	li	a4,92
    4fe8:	00094783          	lbu	a5,0(s2)
    4fec:	06d78e63          	beq	a5,a3,5068 <follow_path+0xcc>
    4ff0:	06e78c63          	beq	a5,a4,5068 <follow_path+0xcc>
    4ff4:	00042423          	sw	zero,8(s0)
    4ff8:	00094703          	lbu	a4,0(s2)
    4ffc:	01f00793          	li	a5,31
    5000:	06e7f863          	bgeu	a5,a4,5070 <follow_path+0xd4>
    5004:	000089b7          	lui	s3,0x8
    5008:	00010ab7          	lui	s5,0x10
    500c:	4c898993          	addi	s3,s3,1224 # 84c8 <ExCvt>
    5010:	fffa8a93          	addi	s5,s5,-1 # ffff <_edata_rom+0x7823>
    5014:	00042783          	lw	a5,0(s0)
    5018:	00000b13          	li	s6,0
    501c:	01f00493          	li	s1,31
    5020:	00c7ac83          	lw	s9,12(a5)
    5024:	02f00a13          	li	s4,47
    5028:	05c00c13          	li	s8,92
    502c:	07f00d13          	li	s10,127
    5030:	00008db7          	lui	s11,0x8
    5034:	00094503          	lbu	a0,0(s2)
    5038:	00190913          	addi	s2,s2,1
    503c:	1c050a63          	beqz	a0,5210 <follow_path+0x274>
    5040:	1b500593          	li	a1,437
    5044:	cfcff0ef          	jal	ra,4540 <ff_oem2uni>
    5048:	08050063          	beqz	a0,50c8 <follow_path+0x12c>
    504c:	1ca4f263          	bgeu	s1,a0,5210 <follow_path+0x274>
    5050:	1b450a63          	beq	a0,s4,5204 <follow_path+0x268>
    5054:	1b850863          	beq	a0,s8,5204 <follow_path+0x268>
    5058:	0ff00613          	li	a2,255
    505c:	0aad6863          	bltu	s10,a0,510c <follow_path+0x170>
    5060:	4b4d8793          	addi	a5,s11,1204 # 84b4 <cvt2.1220+0xc8>
    5064:	0580006f          	j	50bc <follow_path+0x120>
    5068:	00190913          	addi	s2,s2,1
    506c:	f7dff06f          	j	4fe8 <follow_path+0x4c>
    5070:	f8000793          	li	a5,-128
    5074:	02f405a3          	sb	a5,43(s0)
    5078:	00040513          	mv	a0,s0
    507c:	04812403          	lw	s0,72(sp)
    5080:	04c12083          	lw	ra,76(sp)
    5084:	04412483          	lw	s1,68(sp)
    5088:	04012903          	lw	s2,64(sp)
    508c:	03c12983          	lw	s3,60(sp)
    5090:	03812a03          	lw	s4,56(sp)
    5094:	03412a83          	lw	s5,52(sp)
    5098:	03012b03          	lw	s6,48(sp)
    509c:	02c12b83          	lw	s7,44(sp)
    50a0:	02812c03          	lw	s8,40(sp)
    50a4:	02412c83          	lw	s9,36(sp)
    50a8:	02012d03          	lw	s10,32(sp)
    50ac:	01c12d83          	lw	s11,28(sp)
    50b0:	05010113          	addi	sp,sp,80
    50b4:	e09ff06f          	j	4ebc <dir_sdi.constprop.0>
    50b8:	00178793          	addi	a5,a5,1
    50bc:	0007c703          	lbu	a4,0(a5)
    50c0:	04070663          	beqz	a4,510c <follow_path+0x170>
    50c4:	fee51ae3          	bne	a0,a4,50b8 <follow_path+0x11c>
    50c8:	00600493          	li	s1,6
    50cc:	04c12083          	lw	ra,76(sp)
    50d0:	04812403          	lw	s0,72(sp)
    50d4:	04012903          	lw	s2,64(sp)
    50d8:	03c12983          	lw	s3,60(sp)
    50dc:	03812a03          	lw	s4,56(sp)
    50e0:	03412a83          	lw	s5,52(sp)
    50e4:	03012b03          	lw	s6,48(sp)
    50e8:	02c12b83          	lw	s7,44(sp)
    50ec:	02812c03          	lw	s8,40(sp)
    50f0:	02412c83          	lw	s9,36(sp)
    50f4:	02012d03          	lw	s10,32(sp)
    50f8:	01c12d83          	lw	s11,28(sp)
    50fc:	00048513          	mv	a0,s1
    5100:	04412483          	lw	s1,68(sp)
    5104:	05010113          	addi	sp,sp,80
    5108:	00008067          	ret
    510c:	facb0ee3          	beq	s6,a2,50c8 <follow_path+0x12c>
    5110:	001b1793          	slli	a5,s6,0x1
    5114:	00fc87b3          	add	a5,s9,a5
    5118:	00a79023          	sh	a0,0(a5)
    511c:	001b0b13          	addi	s6,s6,1
    5120:	f15ff06f          	j	5034 <follow_path+0x98>
    5124:	00190913          	addi	s2,s2,1
    5128:	00094783          	lbu	a5,0(s2)
    512c:	fec78ce3          	beq	a5,a2,5124 <follow_path+0x188>
    5130:	fee78ae3          	beq	a5,a4,5124 <follow_path+0x188>
    5134:	00000493          	li	s1,0
    5138:	02000613          	li	a2,32
    513c:	02e00593          	li	a1,46
    5140:	001b1793          	slli	a5,s6,0x1
    5144:	0c0b1a63          	bnez	s6,5218 <follow_path+0x27c>
    5148:	00fc87b3          	add	a5,s9,a5
    514c:	00079023          	sh	zero,0(a5)
    5150:	f60b0ce3          	beqz	s6,50c8 <follow_path+0x12c>
    5154:	00000713          	li	a4,0
    5158:	02000593          	li	a1,32
    515c:	00171793          	slli	a5,a4,0x1
    5160:	00fc87b3          	add	a5,s9,a5
    5164:	0007d603          	lhu	a2,0(a5)
    5168:	00070793          	mv	a5,a4
    516c:	00170713          	addi	a4,a4,1
    5170:	feb606e3          	beq	a2,a1,515c <follow_path+0x1c0>
    5174:	00079663          	bnez	a5,5180 <follow_path+0x1e4>
    5178:	02e00713          	li	a4,46
    517c:	00e61463          	bne	a2,a4,5184 <follow_path+0x1e8>
    5180:	0034e493          	ori	s1,s1,3
    5184:	02e00613          	li	a2,46
    5188:	001b1713          	slli	a4,s6,0x1
    518c:	00ec8733          	add	a4,s9,a4
    5190:	ffe75703          	lhu	a4,-2(a4)
    5194:	00c70663          	beq	a4,a2,51a0 <follow_path+0x204>
    5198:	fffb0b13          	addi	s6,s6,-1
    519c:	fe0b16e3          	bnez	s6,5188 <follow_path+0x1ec>
    51a0:	02040c13          	addi	s8,s0,32
    51a4:	02b40613          	addi	a2,s0,43
    51a8:	000c0713          	mv	a4,s8
    51ac:	02000593          	li	a1,32
    51b0:	00170713          	addi	a4,a4,1
    51b4:	feb70fa3          	sb	a1,-1(a4)
    51b8:	fee61ce3          	bne	a2,a4,51b0 <follow_path+0x214>
    51bc:	00800d93          	li	s11,8
    51c0:	00000d13          	li	s10,0
    51c4:	00000a13          	li	s4,0
    51c8:	02000813          	li	a6,32
    51cc:	02e00893          	li	a7,46
    51d0:	00b00613          	li	a2,11
    51d4:	00008337          	lui	t1,0x8
    51d8:	00178713          	addi	a4,a5,1
    51dc:	00179793          	slli	a5,a5,0x1
    51e0:	00fc87b3          	add	a5,s9,a5
    51e4:	0007d503          	lhu	a0,0(a5)
    51e8:	06050263          	beqz	a0,524c <follow_path+0x2b0>
    51ec:	01050663          	beq	a0,a6,51f8 <follow_path+0x25c>
    51f0:	05151063          	bne	a0,a7,5230 <follow_path+0x294>
    51f4:	05670263          	beq	a4,s6,5238 <follow_path+0x29c>
    51f8:	0034e493          	ori	s1,s1,3
    51fc:	00070793          	mv	a5,a4
    5200:	fd9ff06f          	j	51d8 <follow_path+0x23c>
    5204:	02f00613          	li	a2,47
    5208:	05c00713          	li	a4,92
    520c:	f1dff06f          	j	5128 <follow_path+0x18c>
    5210:	00400493          	li	s1,4
    5214:	f25ff06f          	j	5138 <follow_path+0x19c>
    5218:	00fc8733          	add	a4,s9,a5
    521c:	ffe75703          	lhu	a4,-2(a4)
    5220:	00c70463          	beq	a4,a2,5228 <follow_path+0x28c>
    5224:	f2b712e3          	bne	a4,a1,5148 <follow_path+0x1ac>
    5228:	fffb0b13          	addi	s6,s6,-1
    522c:	f15ff06f          	j	5140 <follow_path+0x1a4>
    5230:	01bd7863          	bgeu	s10,s11,5240 <follow_path+0x2a4>
    5234:	11671c63          	bne	a4,s6,534c <follow_path+0x3b0>
    5238:	0ecd9e63          	bne	s11,a2,5334 <follow_path+0x398>
    523c:	0080006f          	j	5244 <follow_path+0x2a8>
    5240:	0ecd9463          	bne	s11,a2,5328 <follow_path+0x38c>
    5244:	0034e493          	ori	s1,s1,3
    5248:	00b00d93          	li	s11,11
    524c:	02044703          	lbu	a4,32(s0)
    5250:	0e500793          	li	a5,229
    5254:	00f71663          	bne	a4,a5,5260 <follow_path+0x2c4>
    5258:	00500793          	li	a5,5
    525c:	02f40023          	sb	a5,32(s0)
    5260:	00800793          	li	a5,8
    5264:	00fd9663          	bne	s11,a5,5270 <follow_path+0x2d4>
    5268:	002a1a13          	slli	s4,s4,0x2
    526c:	0ffa7a13          	andi	s4,s4,255
    5270:	00ca7793          	andi	a5,s4,12
    5274:	00c00713          	li	a4,12
    5278:	00e78863          	beq	a5,a4,5288 <follow_path+0x2ec>
    527c:	003a7793          	andi	a5,s4,3
    5280:	00300713          	li	a4,3
    5284:	00e79463          	bne	a5,a4,528c <follow_path+0x2f0>
    5288:	0024e493          	ori	s1,s1,2
    528c:	0024f793          	andi	a5,s1,2
    5290:	00079e63          	bnez	a5,52ac <follow_path+0x310>
    5294:	001a7793          	andi	a5,s4,1
    5298:	00078463          	beqz	a5,52a0 <follow_path+0x304>
    529c:	0104e493          	ori	s1,s1,16
    52a0:	004a7a13          	andi	s4,s4,4
    52a4:	000a0463          	beqz	s4,52ac <follow_path+0x310>
    52a8:	0084e493          	ori	s1,s1,8
    52ac:	029405a3          	sb	s1,43(s0)
    52b0:	00040513          	mv	a0,s0
    52b4:	00042d03          	lw	s10,0(s0)
    52b8:	c05ff0ef          	jal	ra,4ebc <dir_sdi.constprop.0>
    52bc:	00050493          	mv	s1,a0
    52c0:	30051a63          	bnez	a0,55d4 <follow_path+0x638>
    52c4:	fff00793          	li	a5,-1
    52c8:	02f42623          	sw	a5,44(s0)
    52cc:	0ff00b13          	li	s6,255
    52d0:	0ff00c93          	li	s9,255
    52d4:	00d00d93          	li	s11,13
    52d8:	01842583          	lw	a1,24(s0)
    52dc:	000d0513          	mv	a0,s10
    52e0:	cd4ff0ef          	jal	ra,47b4 <move_window>
    52e4:	00050493          	mv	s1,a0
    52e8:	2e051663          	bnez	a0,55d4 <follow_path+0x638>
    52ec:	01c42683          	lw	a3,28(s0)
    52f0:	0006c703          	lbu	a4,0(a3)
    52f4:	30070063          	beqz	a4,55f4 <follow_path+0x658>
    52f8:	00b6c603          	lbu	a2,11(a3)
    52fc:	0e500513          	li	a0,229
    5300:	03f67593          	andi	a1,a2,63
    5304:	00b40323          	sb	a1,6(s0)
    5308:	00a70a63          	beq	a4,a0,531c <follow_path+0x380>
    530c:	00867613          	andi	a2,a2,8
    5310:	12060863          	beqz	a2,5440 <follow_path+0x4a4>
    5314:	00f00613          	li	a2,15
    5318:	12c58863          	beq	a1,a2,5448 <follow_path+0x4ac>
    531c:	fff00793          	li	a5,-1
    5320:	02f42623          	sw	a5,44(s0)
    5324:	2500006f          	j	5574 <follow_path+0x5d8>
    5328:	01670663          	beq	a4,s6,5334 <follow_path+0x398>
    532c:	0034e493          	ori	s1,s1,3
    5330:	f0eb6ee3          	bltu	s6,a4,524c <follow_path+0x2b0>
    5334:	002a1a13          	slli	s4,s4,0x2
    5338:	0ffa7a13          	andi	s4,s4,255
    533c:	000b0713          	mv	a4,s6
    5340:	00b00d93          	li	s11,11
    5344:	00800d13          	li	s10,8
    5348:	eb5ff06f          	j	51fc <follow_path+0x260>
    534c:	07f00793          	li	a5,127
    5350:	04a7f663          	bgeu	a5,a0,539c <follow_path+0x400>
    5354:	0024e793          	ori	a5,s1,2
    5358:	1b500593          	li	a1,437
    535c:	00e12223          	sw	a4,4(sp)
    5360:	00f12023          	sw	a5,0(sp)
    5364:	978ff0ef          	jal	ra,44dc <ff_uni2oem>
    5368:	08057593          	andi	a1,a0,128
    536c:	00012783          	lw	a5,0(sp)
    5370:	00412703          	lw	a4,4(sp)
    5374:	02000813          	li	a6,32
    5378:	02e00893          	li	a7,46
    537c:	00b00613          	li	a2,11
    5380:	00008337          	lui	t1,0x8
    5384:	02058a63          	beqz	a1,53b8 <follow_path+0x41c>
    5388:	07f57513          	andi	a0,a0,127
    538c:	00a98533          	add	a0,s3,a0
    5390:	00054503          	lbu	a0,0(a0)
    5394:	00078493          	mv	s1,a5
    5398:	00050a63          	beqz	a0,53ac <follow_path+0x410>
    539c:	4c030793          	addi	a5,t1,1216 # 84c0 <cvt2.1220+0xd4>
    53a0:	0007c583          	lbu	a1,0(a5)
    53a4:	04058e63          	beqz	a1,5400 <follow_path+0x464>
    53a8:	04a59863          	bne	a1,a0,53f8 <follow_path+0x45c>
    53ac:	0034e493          	ori	s1,s1,3
    53b0:	05f00513          	li	a0,95
    53b4:	0340006f          	j	53e8 <follow_path+0x44c>
    53b8:	0ff00593          	li	a1,255
    53bc:	fca5fce3          	bgeu	a1,a0,5394 <follow_path+0x3f8>
    53c0:	fffd8593          	addi	a1,s11,-1
    53c4:	00bd6863          	bltu	s10,a1,53d4 <follow_path+0x438>
    53c8:	0034e493          	ori	s1,s1,3
    53cc:	000d8d13          	mv	s10,s11
    53d0:	e2dff06f          	j	51fc <follow_path+0x260>
    53d4:	01a405b3          	add	a1,s0,s10
    53d8:	00855e13          	srli	t3,a0,0x8
    53dc:	03c58023          	sb	t3,32(a1)
    53e0:	001d0d13          	addi	s10,s10,1
    53e4:	00078493          	mv	s1,a5
    53e8:	01a407b3          	add	a5,s0,s10
    53ec:	02a78023          	sb	a0,32(a5)
    53f0:	001d0d13          	addi	s10,s10,1
    53f4:	e09ff06f          	j	51fc <follow_path+0x260>
    53f8:	00178793          	addi	a5,a5,1
    53fc:	fa5ff06f          	j	53a0 <follow_path+0x404>
    5400:	fbf50793          	addi	a5,a0,-65
    5404:	01079793          	slli	a5,a5,0x10
    5408:	0107d793          	srli	a5,a5,0x10
    540c:	01900593          	li	a1,25
    5410:	00f5e663          	bltu	a1,a5,541c <follow_path+0x480>
    5414:	002a6a13          	ori	s4,s4,2
    5418:	fd1ff06f          	j	53e8 <follow_path+0x44c>
    541c:	f9f50793          	addi	a5,a0,-97
    5420:	01079793          	slli	a5,a5,0x10
    5424:	0107d793          	srli	a5,a5,0x10
    5428:	fcf5e0e3          	bltu	a1,a5,53e8 <follow_path+0x44c>
    542c:	fe050513          	addi	a0,a0,-32
    5430:	01051513          	slli	a0,a0,0x10
    5434:	001a6a13          	ori	s4,s4,1
    5438:	01055513          	srli	a0,a0,0x10
    543c:	fadff06f          	j	53e8 <follow_path+0x44c>
    5440:	00f00613          	li	a2,15
    5444:	14c59063          	bne	a1,a2,5584 <follow_path+0x5e8>
    5448:	02b44603          	lbu	a2,43(s0)
    544c:	04067613          	andi	a2,a2,64
    5450:	10061663          	bnez	a2,555c <follow_path+0x5c0>
    5454:	04077613          	andi	a2,a4,64
    5458:	10060c63          	beqz	a2,5570 <follow_path+0x5d4>
    545c:	0bf77c93          	andi	s9,a4,191
    5460:	01042703          	lw	a4,16(s0)
    5464:	00d6cb03          	lbu	s6,13(a3)
    5468:	02e42623          	sw	a4,44(s0)
    546c:	00d6c703          	lbu	a4,13(a3)
    5470:	11671263          	bne	a4,s6,5574 <follow_path+0x5d8>
    5474:	01b6c703          	lbu	a4,27(a3)
    5478:	01a6c603          	lbu	a2,26(a3)
    547c:	00871713          	slli	a4,a4,0x8
    5480:	00c76733          	or	a4,a4,a2
    5484:	01071713          	slli	a4,a4,0x10
    5488:	41075713          	srai	a4,a4,0x10
    548c:	0e071463          	bnez	a4,5574 <follow_path+0x5d8>
    5490:	0006c703          	lbu	a4,0(a3)
    5494:	00cd2a03          	lw	s4,12(s10)
    5498:	00100513          	li	a0,1
    549c:	03f77713          	andi	a4,a4,63
    54a0:	fff70713          	addi	a4,a4,-1
    54a4:	03b70733          	mul	a4,a4,s11
    54a8:	0ff00813          	li	a6,255
    54ac:	000087b7          	lui	a5,0x8
    54b0:	54878793          	addi	a5,a5,1352 # 8548 <LfnOfs>
    54b4:	00978633          	add	a2,a5,s1
    54b8:	00064583          	lbu	a1,0(a2)
    54bc:	00b685b3          	add	a1,a3,a1
    54c0:	0015c603          	lbu	a2,1(a1)
    54c4:	0005c583          	lbu	a1,0(a1)
    54c8:	00861613          	slli	a2,a2,0x8
    54cc:	00b66633          	or	a2,a2,a1
    54d0:	0a050663          	beqz	a0,557c <follow_path+0x5e0>
    54d4:	00d12623          	sw	a3,12(sp)
    54d8:	00e12023          	sw	a4,0(sp)
    54dc:	08e86c63          	bltu	a6,a4,5574 <follow_path+0x5d8>
    54e0:	00060513          	mv	a0,a2
    54e4:	00c12423          	sw	a2,8(sp)
    54e8:	890ff0ef          	jal	ra,4578 <ff_wtoupper>
    54ec:	00012703          	lw	a4,0(sp)
    54f0:	00a12223          	sw	a0,4(sp)
    54f4:	00170893          	addi	a7,a4,1
    54f8:	00171713          	slli	a4,a4,0x1
    54fc:	00ea0733          	add	a4,s4,a4
    5500:	00075503          	lhu	a0,0(a4)
    5504:	01112023          	sw	a7,0(sp)
    5508:	870ff0ef          	jal	ra,4578 <ff_wtoupper>
    550c:	00412583          	lw	a1,4(sp)
    5510:	06a59263          	bne	a1,a0,5574 <follow_path+0x5d8>
    5514:	00812603          	lw	a2,8(sp)
    5518:	00012883          	lw	a7,0(sp)
    551c:	00c12683          	lw	a3,12(sp)
    5520:	00060513          	mv	a0,a2
    5524:	00088713          	mv	a4,a7
    5528:	0ff00813          	li	a6,255
    552c:	00148493          	addi	s1,s1,1
    5530:	f7b49ee3          	bne	s1,s11,54ac <follow_path+0x510>
    5534:	0006c683          	lbu	a3,0(a3)
    5538:	0406f693          	andi	a3,a3,64
    553c:	00068c63          	beqz	a3,5554 <follow_path+0x5b8>
    5540:	00050a63          	beqz	a0,5554 <follow_path+0x5b8>
    5544:	00171713          	slli	a4,a4,0x1
    5548:	00ea0a33          	add	s4,s4,a4
    554c:	000a5703          	lhu	a4,0(s4)
    5550:	02071263          	bnez	a4,5574 <follow_path+0x5d8>
    5554:	fffc8793          	addi	a5,s9,-1
    5558:	0ff7fc93          	andi	s9,a5,255
    555c:	00040513          	mv	a0,s0
    5560:	c14ff0ef          	jal	ra,4974 <dir_next.isra.0>
    5564:	00050493          	mv	s1,a0
    5568:	d60508e3          	beqz	a0,52d8 <follow_path+0x33c>
    556c:	0680006f          	j	55d4 <follow_path+0x638>
    5570:	ef970ee3          	beq	a4,s9,546c <follow_path+0x4d0>
    5574:	0ff00c93          	li	s9,255
    5578:	fe5ff06f          	j	555c <follow_path+0x5c0>
    557c:	fb5608e3          	beq	a2,s5,552c <follow_path+0x590>
    5580:	ff5ff06f          	j	5574 <follow_path+0x5d8>
    5584:	020c9863          	bnez	s9,55b4 <follow_path+0x618>
    5588:	00b68593          	addi	a1,a3,11
    558c:	00068613          	mv	a2,a3
    5590:	001cd713          	srli	a4,s9,0x1
    5594:	007c9793          	slli	a5,s9,0x7
    5598:	00160613          	addi	a2,a2,1
    559c:	00f767b3          	or	a5,a4,a5
    55a0:	fff64703          	lbu	a4,-1(a2)
    55a4:	00e787b3          	add	a5,a5,a4
    55a8:	0ff7fc93          	andi	s9,a5,255
    55ac:	fec592e3          	bne	a1,a2,5590 <follow_path+0x5f4>
    55b0:	039b0263          	beq	s6,s9,55d4 <follow_path+0x638>
    55b4:	02b44783          	lbu	a5,43(s0)
    55b8:	0017f793          	andi	a5,a5,1
    55bc:	d60790e3          	bnez	a5,531c <follow_path+0x380>
    55c0:	00b00613          	li	a2,11
    55c4:	000c0593          	mv	a1,s8
    55c8:	00068513          	mv	a0,a3
    55cc:	8c4ff0ef          	jal	ra,4690 <mem_cmp>
    55d0:	d40516e3          	bnez	a0,531c <follow_path+0x380>
    55d4:	02b44783          	lbu	a5,43(s0)
    55d8:	02048263          	beqz	s1,55fc <follow_path+0x660>
    55dc:	00400713          	li	a4,4
    55e0:	aee496e3          	bne	s1,a4,50cc <follow_path+0x130>
    55e4:	0047f793          	andi	a5,a5,4
    55e8:	ae0792e3          	bnez	a5,50cc <follow_path+0x130>
    55ec:	00500493          	li	s1,5
    55f0:	addff06f          	j	50cc <follow_path+0x130>
    55f4:	00400493          	li	s1,4
    55f8:	fddff06f          	j	55d4 <follow_path+0x638>
    55fc:	0047f793          	andi	a5,a5,4
    5600:	ac0796e3          	bnez	a5,50cc <follow_path+0x130>
    5604:	00644783          	lbu	a5,6(s0)
    5608:	0107f793          	andi	a5,a5,16
    560c:	fe0780e3          	beqz	a5,55ec <follow_path+0x650>
    5610:	01042783          	lw	a5,16(s0)
    5614:	000bc503          	lbu	a0,0(s7)
    5618:	02cb8593          	addi	a1,s7,44
    561c:	1ff7f793          	andi	a5,a5,511
    5620:	00f585b3          	add	a1,a1,a5
    5624:	c40ff0ef          	jal	ra,4a64 <ld_clust.isra.0>
    5628:	00a42423          	sw	a0,8(s0)
    562c:	9e9ff06f          	j	5014 <follow_path+0x78>

00005630 <f_mount>:
    5630:	fd010113          	addi	sp,sp,-48
    5634:	00a12623          	sw	a0,12(sp)
    5638:	01c10513          	addi	a0,sp,28
    563c:	02812423          	sw	s0,40(sp)
    5640:	02112623          	sw	ra,44(sp)
    5644:	00b12423          	sw	a1,8(sp)
    5648:	00060413          	mv	s0,a2
    564c:	00b12e23          	sw	a1,28(sp)
    5650:	894ff0ef          	jal	ra,46e4 <get_ldnumber>
    5654:	04054e63          	bltz	a0,56b0 <f_mount+0x80>
    5658:	100007b7          	lui	a5,0x10000
    565c:	19478713          	addi	a4,a5,404 # 10000194 <FatFs>
    5660:	00251513          	slli	a0,a0,0x2
    5664:	00e50733          	add	a4,a0,a4
    5668:	00072703          	lw	a4,0(a4)
    566c:	19478793          	addi	a5,a5,404
    5670:	00070463          	beqz	a4,5678 <f_mount+0x48>
    5674:	00070023          	sb	zero,0(a4)
    5678:	00c12703          	lw	a4,12(sp)
    567c:	00070463          	beqz	a4,5684 <f_mount+0x54>
    5680:	00070023          	sb	zero,0(a4)
    5684:	00a78533          	add	a0,a5,a0
    5688:	00e52023          	sw	a4,0(a0)
    568c:	00000513          	li	a0,0
    5690:	00040863          	beqz	s0,56a0 <f_mount+0x70>
    5694:	00c10593          	addi	a1,sp,12
    5698:	00810513          	addi	a0,sp,8
    569c:	cc4ff0ef          	jal	ra,4b60 <mount_volume.isra.0>
    56a0:	02c12083          	lw	ra,44(sp)
    56a4:	02812403          	lw	s0,40(sp)
    56a8:	03010113          	addi	sp,sp,48
    56ac:	00008067          	ret
    56b0:	00b00513          	li	a0,11
    56b4:	fedff06f          	j	56a0 <f_mount+0x70>

000056b8 <f_open>:
    56b8:	f9010113          	addi	sp,sp,-112
    56bc:	06912223          	sw	s1,100(sp)
    56c0:	06112623          	sw	ra,108(sp)
    56c4:	06812423          	sw	s0,104(sp)
    56c8:	07212023          	sw	s2,96(sp)
    56cc:	05312e23          	sw	s3,92(sp)
    56d0:	05412c23          	sw	s4,88(sp)
    56d4:	00b12623          	sw	a1,12(sp)
    56d8:	00900493          	li	s1,9
    56dc:	08050a63          	beqz	a0,5770 <f_open+0xb8>
    56e0:	00050413          	mv	s0,a0
    56e4:	01c10593          	addi	a1,sp,28
    56e8:	00c10513          	addi	a0,sp,12
    56ec:	00060913          	mv	s2,a2
    56f0:	c70ff0ef          	jal	ra,4b60 <mount_volume.isra.0>
    56f4:	00050493          	mv	s1,a0
    56f8:	0a051063          	bnez	a0,5798 <f_open+0xe0>
    56fc:	01c12783          	lw	a5,28(sp)
    5700:	00c12583          	lw	a1,12(sp)
    5704:	02010513          	addi	a0,sp,32
    5708:	02f12023          	sw	a5,32(sp)
    570c:	891ff0ef          	jal	ra,4f9c <follow_path>
    5710:	00050493          	mv	s1,a0
    5714:	08051263          	bnez	a0,5798 <f_open+0xe0>
    5718:	04b10783          	lb	a5,75(sp)
    571c:	0607cc63          	bltz	a5,5794 <f_open+0xdc>
    5720:	02614783          	lbu	a5,38(sp)
    5724:	0107f793          	andi	a5,a5,16
    5728:	06079c63          	bnez	a5,57a0 <f_open+0xe8>
    572c:	01c12983          	lw	s3,28(sp)
    5730:	03c12a03          	lw	s4,60(sp)
    5734:	00197913          	andi	s2,s2,1
    5738:	0009c503          	lbu	a0,0(s3)
    573c:	000a0593          	mv	a1,s4
    5740:	b24ff0ef          	jal	ra,4a64 <ld_clust.isra.0>
    5744:	00a42423          	sw	a0,8(s0)
    5748:	01ca0513          	addi	a0,s4,28
    574c:	f19fe0ef          	jal	ra,4664 <ld_dword>
    5750:	0069d783          	lhu	a5,6(s3)
    5754:	00a42623          	sw	a0,12(s0)
    5758:	01342023          	sw	s3,0(s0)
    575c:	00f41223          	sh	a5,4(s0)
    5760:	01240823          	sb	s2,16(s0)
    5764:	000408a3          	sb	zero,17(s0)
    5768:	00042e23          	sw	zero,28(s0)
    576c:	00042a23          	sw	zero,20(s0)
    5770:	06c12083          	lw	ra,108(sp)
    5774:	06812403          	lw	s0,104(sp)
    5778:	06012903          	lw	s2,96(sp)
    577c:	05c12983          	lw	s3,92(sp)
    5780:	05812a03          	lw	s4,88(sp)
    5784:	00048513          	mv	a0,s1
    5788:	06412483          	lw	s1,100(sp)
    578c:	07010113          	addi	sp,sp,112
    5790:	00008067          	ret
    5794:	00600493          	li	s1,6
    5798:	00042023          	sw	zero,0(s0)
    579c:	fd5ff06f          	j	5770 <f_open+0xb8>
    57a0:	00400493          	li	s1,4
    57a4:	ff5ff06f          	j	5798 <f_open+0xe0>

000057a8 <f_read>:
    57a8:	fb010113          	addi	sp,sp,-80
    57ac:	04812423          	sw	s0,72(sp)
    57b0:	04912223          	sw	s1,68(sp)
    57b4:	05212023          	sw	s2,64(sp)
    57b8:	03312e23          	sw	s3,60(sp)
    57bc:	03412c23          	sw	s4,56(sp)
    57c0:	04112623          	sw	ra,76(sp)
    57c4:	03512a23          	sw	s5,52(sp)
    57c8:	03612823          	sw	s6,48(sp)
    57cc:	03712623          	sw	s7,44(sp)
    57d0:	03812423          	sw	s8,40(sp)
    57d4:	03912223          	sw	s9,36(sp)
    57d8:	03a12023          	sw	s10,32(sp)
    57dc:	01b12e23          	sw	s11,28(sp)
    57e0:	00058993          	mv	s3,a1
    57e4:	0006a023          	sw	zero,0(a3)
    57e8:	00c10593          	addi	a1,sp,12
    57ec:	00050493          	mv	s1,a0
    57f0:	00060913          	mv	s2,a2
    57f4:	00068a13          	mv	s4,a3
    57f8:	f41fe0ef          	jal	ra,4738 <validate>
    57fc:	00050413          	mv	s0,a0
    5800:	08051263          	bnez	a0,5884 <f_read+0xdc>
    5804:	0114c403          	lbu	s0,17(s1)
    5808:	06041e63          	bnez	s0,5884 <f_read+0xdc>
    580c:	0104c783          	lbu	a5,16(s1)
    5810:	00700413          	li	s0,7
    5814:	0017f793          	andi	a5,a5,1
    5818:	06078663          	beqz	a5,5884 <f_read+0xdc>
    581c:	00c4a403          	lw	s0,12(s1)
    5820:	0144a503          	lw	a0,20(s1)
    5824:	40a40433          	sub	s0,s0,a0
    5828:	00897463          	bgeu	s2,s0,5830 <f_read+0x88>
    582c:	00090413          	mv	s0,s2
    5830:	20000a93          	li	s5,512
    5834:	1ff00b13          	li	s6,511
    5838:	10000bb7          	lui	s7,0x10000
    583c:	00100c13          	li	s8,1
    5840:	fff00c93          	li	s9,-1
    5844:	04040063          	beqz	s0,5884 <f_read+0xdc>
    5848:	0144a783          	lw	a5,20(s1)
    584c:	1ff7f713          	andi	a4,a5,511
    5850:	10071a63          	bnez	a4,5964 <f_read+0x1bc>
    5854:	00c12703          	lw	a4,12(sp)
    5858:	00a75d03          	lhu	s10,10(a4)
    585c:	0097d713          	srli	a4,a5,0x9
    5860:	fffd0d13          	addi	s10,s10,-1
    5864:	00ed7d33          	and	s10,s10,a4
    5868:	080d1263          	bnez	s10,58ec <f_read+0x144>
    586c:	04079c63          	bnez	a5,58c4 <f_read+0x11c>
    5870:	0084a503          	lw	a0,8(s1)
    5874:	06ac6063          	bltu	s8,a0,58d4 <f_read+0x12c>
    5878:	00200793          	li	a5,2
    587c:	00f488a3          	sb	a5,17(s1)
    5880:	00200413          	li	s0,2
    5884:	04c12083          	lw	ra,76(sp)
    5888:	00040513          	mv	a0,s0
    588c:	04812403          	lw	s0,72(sp)
    5890:	04412483          	lw	s1,68(sp)
    5894:	04012903          	lw	s2,64(sp)
    5898:	03c12983          	lw	s3,60(sp)
    589c:	03812a03          	lw	s4,56(sp)
    58a0:	03412a83          	lw	s5,52(sp)
    58a4:	03012b03          	lw	s6,48(sp)
    58a8:	02c12b83          	lw	s7,44(sp)
    58ac:	02812c03          	lw	s8,40(sp)
    58b0:	02412c83          	lw	s9,36(sp)
    58b4:	02012d03          	lw	s10,32(sp)
    58b8:	01c12d83          	lw	s11,28(sp)
    58bc:	05010113          	addi	sp,sp,80
    58c0:	00008067          	ret
    58c4:	0184a583          	lw	a1,24(s1)
    58c8:	0004a503          	lw	a0,0(s1)
    58cc:	f55fe0ef          	jal	ra,4820 <get_fat.isra.0>
    58d0:	fa5ff06f          	j	5874 <f_read+0xcc>
    58d4:	01951a63          	bne	a0,s9,58e8 <f_read+0x140>
    58d8:	00100793          	li	a5,1
    58dc:	00f488a3          	sb	a5,17(s1)
    58e0:	00100413          	li	s0,1
    58e4:	fa1ff06f          	j	5884 <f_read+0xdc>
    58e8:	00a4ac23          	sw	a0,24(s1)
    58ec:	00c12d83          	lw	s11,12(sp)
    58f0:	0184a583          	lw	a1,24(s1)
    58f4:	000d8513          	mv	a0,s11
    58f8:	dc1fe0ef          	jal	ra,46b8 <clst2sect>
    58fc:	f6050ee3          	beqz	a0,5878 <f_read+0xd0>
    5900:	00ad0633          	add	a2,s10,a0
    5904:	048b7e63          	bgeu	s6,s0,5960 <f_read+0x1b8>
    5908:	00add783          	lhu	a5,10(s11)
    590c:	00945913          	srli	s2,s0,0x9
    5910:	012d0733          	add	a4,s10,s2
    5914:	00e7f463          	bgeu	a5,a4,591c <f_read+0x174>
    5918:	41a78933          	sub	s2,a5,s10
    591c:	4b8ba783          	lw	a5,1208(s7) # 100004b8 <FfDiskOps>
    5920:	001dc503          	lbu	a0,1(s11)
    5924:	00090693          	mv	a3,s2
    5928:	0087a783          	lw	a5,8(a5)
    592c:	00098593          	mv	a1,s3
    5930:	000780e7          	jalr	a5
    5934:	fa0512e3          	bnez	a0,58d8 <f_read+0x130>
    5938:	00991913          	slli	s2,s2,0x9
    593c:	000a2783          	lw	a5,0(s4)
    5940:	0144a683          	lw	a3,20(s1)
    5944:	41240433          	sub	s0,s0,s2
    5948:	012787b3          	add	a5,a5,s2
    594c:	00fa2023          	sw	a5,0(s4)
    5950:	012989b3          	add	s3,s3,s2
    5954:	01268933          	add	s2,a3,s2
    5958:	0124aa23          	sw	s2,20(s1)
    595c:	ee9ff06f          	j	5844 <f_read+0x9c>
    5960:	00c4ae23          	sw	a2,28(s1)
    5964:	0144a783          	lw	a5,20(s1)
    5968:	00040913          	mv	s2,s0
    596c:	1ff7f793          	andi	a5,a5,511
    5970:	40fa87b3          	sub	a5,s5,a5
    5974:	0087f463          	bgeu	a5,s0,597c <f_read+0x1d4>
    5978:	00078913          	mv	s2,a5
    597c:	01c4a583          	lw	a1,28(s1)
    5980:	00c12503          	lw	a0,12(sp)
    5984:	e31fe0ef          	jal	ra,47b4 <move_window>
    5988:	f40518e3          	bnez	a0,58d8 <f_read+0x130>
    598c:	00c12703          	lw	a4,12(sp)
    5990:	0144a683          	lw	a3,20(s1)
    5994:	02c70713          	addi	a4,a4,44
    5998:	1ff6f693          	andi	a3,a3,511
    599c:	00a687b3          	add	a5,a3,a0
    59a0:	00f707b3          	add	a5,a4,a5
    59a4:	0007c603          	lbu	a2,0(a5)
    59a8:	00a987b3          	add	a5,s3,a0
    59ac:	00150513          	addi	a0,a0,1
    59b0:	00c78023          	sb	a2,0(a5)
    59b4:	fea914e3          	bne	s2,a0,599c <f_read+0x1f4>
    59b8:	f85ff06f          	j	593c <f_read+0x194>

000059bc <f_close>:
    59bc:	fe010113          	addi	sp,sp,-32
    59c0:	00c10593          	addi	a1,sp,12
    59c4:	00812c23          	sw	s0,24(sp)
    59c8:	00112e23          	sw	ra,28(sp)
    59cc:	00050413          	mv	s0,a0
    59d0:	d69fe0ef          	jal	ra,4738 <validate>
    59d4:	00051463          	bnez	a0,59dc <f_close+0x20>
    59d8:	00042023          	sw	zero,0(s0)
    59dc:	01c12083          	lw	ra,28(sp)
    59e0:	01812403          	lw	s0,24(sp)
    59e4:	02010113          	addi	sp,sp,32
    59e8:	00008067          	ret

000059ec <f_lseek>:
    59ec:	fd010113          	addi	sp,sp,-48
    59f0:	01312e23          	sw	s3,28(sp)
    59f4:	00058993          	mv	s3,a1
    59f8:	00c10593          	addi	a1,sp,12
    59fc:	02812423          	sw	s0,40(sp)
    5a00:	03212023          	sw	s2,32(sp)
    5a04:	02112623          	sw	ra,44(sp)
    5a08:	02912223          	sw	s1,36(sp)
    5a0c:	01412c23          	sw	s4,24(sp)
    5a10:	01512a23          	sw	s5,20(sp)
    5a14:	00050413          	mv	s0,a0
    5a18:	d21fe0ef          	jal	ra,4738 <validate>
    5a1c:	00050913          	mv	s2,a0
    5a20:	0e051a63          	bnez	a0,5b14 <f_lseek+0x128>
    5a24:	01144903          	lbu	s2,17(s0)
    5a28:	0e091663          	bnez	s2,5b14 <f_lseek+0x128>
    5a2c:	00c42483          	lw	s1,12(s0)
    5a30:	0099f463          	bgeu	s3,s1,5a38 <f_lseek+0x4c>
    5a34:	00098493          	mv	s1,s3
    5a38:	01442783          	lw	a5,20(s0)
    5a3c:	00042a23          	sw	zero,20(s0)
    5a40:	02049663          	bnez	s1,5a6c <f_lseek+0x80>
    5a44:	00000913          	li	s2,0
    5a48:	0cc0006f          	j	5b14 <f_lseek+0x128>
    5a4c:	00000493          	li	s1,0
    5a50:	01442783          	lw	a5,20(s0)
    5a54:	1ff7f793          	andi	a5,a5,511
    5a58:	fe0786e3          	beqz	a5,5a44 <f_lseek+0x58>
    5a5c:	01c42783          	lw	a5,28(s0)
    5a60:	0a978a63          	beq	a5,s1,5b14 <f_lseek+0x128>
    5a64:	00942e23          	sw	s1,28(s0)
    5a68:	0ac0006f          	j	5b14 <f_lseek+0x128>
    5a6c:	00c12703          	lw	a4,12(sp)
    5a70:	00a75983          	lhu	s3,10(a4)
    5a74:	00999993          	slli	s3,s3,0x9
    5a78:	06078463          	beqz	a5,5ae0 <f_lseek+0xf4>
    5a7c:	fff78793          	addi	a5,a5,-1
    5a80:	fff48713          	addi	a4,s1,-1
    5a84:	03375733          	divu	a4,a4,s3
    5a88:	0337d6b3          	divu	a3,a5,s3
    5a8c:	04d76a63          	bltu	a4,a3,5ae0 <f_lseek+0xf4>
    5a90:	41300733          	neg	a4,s3
    5a94:	01842583          	lw	a1,24(s0)
    5a98:	00f777b3          	and	a5,a4,a5
    5a9c:	00f42a23          	sw	a5,20(s0)
    5aa0:	40f484b3          	sub	s1,s1,a5
    5aa4:	fa0584e3          	beqz	a1,5a4c <f_lseek+0x60>
    5aa8:	fff00a13          	li	s4,-1
    5aac:	00100a93          	li	s5,1
    5ab0:	01442783          	lw	a5,20(s0)
    5ab4:	0299ec63          	bltu	s3,s1,5aec <f_lseek+0x100>
    5ab8:	00f487b3          	add	a5,s1,a5
    5abc:	00f42a23          	sw	a5,20(s0)
    5ac0:	1ff4f793          	andi	a5,s1,511
    5ac4:	f80784e3          	beqz	a5,5a4c <f_lseek+0x60>
    5ac8:	00c12503          	lw	a0,12(sp)
    5acc:	bedfe0ef          	jal	ra,46b8 <clst2sect>
    5ad0:	06050e63          	beqz	a0,5b4c <f_lseek+0x160>
    5ad4:	0094d493          	srli	s1,s1,0x9
    5ad8:	00a484b3          	add	s1,s1,a0
    5adc:	f75ff06f          	j	5a50 <f_lseek+0x64>
    5ae0:	00842583          	lw	a1,8(s0)
    5ae4:	00b42c23          	sw	a1,24(s0)
    5ae8:	fbdff06f          	j	5aa4 <f_lseek+0xb8>
    5aec:	00042503          	lw	a0,0(s0)
    5af0:	013787b3          	add	a5,a5,s3
    5af4:	00f42a23          	sw	a5,20(s0)
    5af8:	d29fe0ef          	jal	ra,4820 <get_fat.isra.0>
    5afc:	413484b3          	sub	s1,s1,s3
    5b00:	00050593          	mv	a1,a0
    5b04:	03451c63          	bne	a0,s4,5b3c <f_lseek+0x150>
    5b08:	00100793          	li	a5,1
    5b0c:	00f408a3          	sb	a5,17(s0)
    5b10:	00100913          	li	s2,1
    5b14:	02c12083          	lw	ra,44(sp)
    5b18:	02812403          	lw	s0,40(sp)
    5b1c:	02412483          	lw	s1,36(sp)
    5b20:	01c12983          	lw	s3,28(sp)
    5b24:	01812a03          	lw	s4,24(sp)
    5b28:	01412a83          	lw	s5,20(sp)
    5b2c:	00090513          	mv	a0,s2
    5b30:	02012903          	lw	s2,32(sp)
    5b34:	03010113          	addi	sp,sp,48
    5b38:	00008067          	ret
    5b3c:	00aaf863          	bgeu	s5,a0,5b4c <f_lseek+0x160>
    5b40:	00c12783          	lw	a5,12(sp)
    5b44:	0107a783          	lw	a5,16(a5)
    5b48:	00f56a63          	bltu	a0,a5,5b5c <f_lseek+0x170>
    5b4c:	00200793          	li	a5,2
    5b50:	00f408a3          	sb	a5,17(s0)
    5b54:	00200913          	li	s2,2
    5b58:	fbdff06f          	j	5b14 <f_lseek+0x128>
    5b5c:	00a42c23          	sw	a0,24(s0)
    5b60:	f51ff06f          	j	5ab0 <f_lseek+0xc4>

00005b64 <f_opendir>:
    5b64:	fd010113          	addi	sp,sp,-48
    5b68:	02112623          	sw	ra,44(sp)
    5b6c:	02812423          	sw	s0,40(sp)
    5b70:	00b12623          	sw	a1,12(sp)
    5b74:	08050a63          	beqz	a0,5c08 <f_opendir+0xa4>
    5b78:	00050413          	mv	s0,a0
    5b7c:	01c10593          	addi	a1,sp,28
    5b80:	00c10513          	addi	a0,sp,12
    5b84:	fddfe0ef          	jal	ra,4b60 <mount_volume.isra.0>
    5b88:	02051a63          	bnez	a0,5bbc <f_opendir+0x58>
    5b8c:	01c12783          	lw	a5,28(sp)
    5b90:	00c12583          	lw	a1,12(sp)
    5b94:	00040513          	mv	a0,s0
    5b98:	00f42023          	sw	a5,0(s0)
    5b9c:	c00ff0ef          	jal	ra,4f9c <follow_path>
    5ba0:	06051863          	bnez	a0,5c10 <f_opendir+0xac>
    5ba4:	02b40783          	lb	a5,43(s0)
    5ba8:	0207c863          	bltz	a5,5bd8 <f_opendir+0x74>
    5bac:	00644783          	lbu	a5,6(s0)
    5bb0:	0107f793          	andi	a5,a5,16
    5bb4:	00079863          	bnez	a5,5bc4 <f_opendir+0x60>
    5bb8:	00500513          	li	a0,5
    5bbc:	00042023          	sw	zero,0(s0)
    5bc0:	0380006f          	j	5bf8 <f_opendir+0x94>
    5bc4:	01c12783          	lw	a5,28(sp)
    5bc8:	01c42583          	lw	a1,28(s0)
    5bcc:	0007c503          	lbu	a0,0(a5)
    5bd0:	e95fe0ef          	jal	ra,4a64 <ld_clust.isra.0>
    5bd4:	00a42423          	sw	a0,8(s0)
    5bd8:	01c12783          	lw	a5,28(sp)
    5bdc:	00040513          	mv	a0,s0
    5be0:	0067d783          	lhu	a5,6(a5)
    5be4:	00f41223          	sh	a5,4(s0)
    5be8:	ad4ff0ef          	jal	ra,4ebc <dir_sdi.constprop.0>
    5bec:	00400793          	li	a5,4
    5bf0:	fcf504e3          	beq	a0,a5,5bb8 <f_opendir+0x54>
    5bf4:	fc0514e3          	bnez	a0,5bbc <f_opendir+0x58>
    5bf8:	02c12083          	lw	ra,44(sp)
    5bfc:	02812403          	lw	s0,40(sp)
    5c00:	03010113          	addi	sp,sp,48
    5c04:	00008067          	ret
    5c08:	00900513          	li	a0,9
    5c0c:	fedff06f          	j	5bf8 <f_opendir+0x94>
    5c10:	00400793          	li	a5,4
    5c14:	faf502e3          	beq	a0,a5,5bb8 <f_opendir+0x54>
    5c18:	fa5ff06f          	j	5bbc <f_opendir+0x58>

00005c1c <f_closedir>:
    5c1c:	fe010113          	addi	sp,sp,-32
    5c20:	00c10593          	addi	a1,sp,12
    5c24:	00812c23          	sw	s0,24(sp)
    5c28:	00112e23          	sw	ra,28(sp)
    5c2c:	00050413          	mv	s0,a0
    5c30:	b09fe0ef          	jal	ra,4738 <validate>
    5c34:	00051463          	bnez	a0,5c3c <f_closedir+0x20>
    5c38:	00042023          	sw	zero,0(s0)
    5c3c:	01c12083          	lw	ra,28(sp)
    5c40:	01812403          	lw	s0,24(sp)
    5c44:	02010113          	addi	sp,sp,32
    5c48:	00008067          	ret

00005c4c <f_readdir>:
    5c4c:	fb010113          	addi	sp,sp,-80
    5c50:	04912223          	sw	s1,68(sp)
    5c54:	00058493          	mv	s1,a1
    5c58:	00c10593          	addi	a1,sp,12
    5c5c:	05212023          	sw	s2,64(sp)
    5c60:	03312e23          	sw	s3,60(sp)
    5c64:	04112623          	sw	ra,76(sp)
    5c68:	04812423          	sw	s0,72(sp)
    5c6c:	03412c23          	sw	s4,56(sp)
    5c70:	03512a23          	sw	s5,52(sp)
    5c74:	03612823          	sw	s6,48(sp)
    5c78:	03712623          	sw	s7,44(sp)
    5c7c:	03812423          	sw	s8,40(sp)
    5c80:	03912223          	sw	s9,36(sp)
    5c84:	03a12023          	sw	s10,32(sp)
    5c88:	01b12e23          	sw	s11,28(sp)
    5c8c:	00050913          	mv	s2,a0
    5c90:	aa9fe0ef          	jal	ra,4738 <validate>
    5c94:	00050993          	mv	s3,a0
    5c98:	3c051c63          	bnez	a0,6070 <f_readdir+0x424>
    5c9c:	00049a63          	bnez	s1,5cb0 <f_readdir+0x64>
    5ca0:	00090513          	mv	a0,s2
    5ca4:	a18ff0ef          	jal	ra,4ebc <dir_sdi.constprop.0>
    5ca8:	00050993          	mv	s3,a0
    5cac:	3c40006f          	j	6070 <f_readdir+0x424>
    5cb0:	00092b03          	lw	s6,0(s2)
    5cb4:	00008a37          	lui	s4,0x8
    5cb8:	00010ab7          	lui	s5,0x10
    5cbc:	0ff00c13          	li	s8,255
    5cc0:	0ff00413          	li	s0,255
    5cc4:	00400513          	li	a0,4
    5cc8:	00d00b93          	li	s7,13
    5ccc:	548a0a13          	addi	s4,s4,1352 # 8548 <LfnOfs>
    5cd0:	fffa8a93          	addi	s5,s5,-1 # ffff <_edata_rom+0x7823>
    5cd4:	01892583          	lw	a1,24(s2)
    5cd8:	00059663          	bnez	a1,5ce4 <f_readdir+0x98>
    5cdc:	16050c63          	beqz	a0,5e54 <f_readdir+0x208>
    5ce0:	11c0006f          	j	5dfc <f_readdir+0x1b0>
    5ce4:	000b0513          	mv	a0,s6
    5ce8:	acdfe0ef          	jal	ra,47b4 <move_window>
    5cec:	10051863          	bnez	a0,5dfc <f_readdir+0x1b0>
    5cf0:	01c92783          	lw	a5,28(s2)
    5cf4:	0007c703          	lbu	a4,0(a5)
    5cf8:	24070263          	beqz	a4,5f3c <f_readdir+0x2f0>
    5cfc:	00b7c683          	lbu	a3,11(a5)
    5d00:	0e500613          	li	a2,229
    5d04:	03f6f693          	andi	a3,a3,63
    5d08:	00d90323          	sb	a3,6(s2)
    5d0c:	10c70263          	beq	a4,a2,5e10 <f_readdir+0x1c4>
    5d10:	02e00613          	li	a2,46
    5d14:	0ec70e63          	beq	a4,a2,5e10 <f_readdir+0x1c4>
    5d18:	fdf6f613          	andi	a2,a3,-33
    5d1c:	00800593          	li	a1,8
    5d20:	0eb60863          	beq	a2,a1,5e10 <f_readdir+0x1c4>
    5d24:	00f00613          	li	a2,15
    5d28:	0ec69c63          	bne	a3,a2,5e20 <f_readdir+0x1d4>
    5d2c:	04077693          	andi	a3,a4,64
    5d30:	0c068e63          	beqz	a3,5e0c <f_readdir+0x1c0>
    5d34:	0bf77413          	andi	s0,a4,191
    5d38:	01092703          	lw	a4,16(s2)
    5d3c:	00d7cc03          	lbu	s8,13(a5)
    5d40:	02e92623          	sw	a4,44(s2)
    5d44:	00d7c703          	lbu	a4,13(a5)
    5d48:	0d871463          	bne	a4,s8,5e10 <f_readdir+0x1c4>
    5d4c:	01b7c703          	lbu	a4,27(a5)
    5d50:	01a7c683          	lbu	a3,26(a5)
    5d54:	00871713          	slli	a4,a4,0x8
    5d58:	00d76733          	or	a4,a4,a3
    5d5c:	01071713          	slli	a4,a4,0x10
    5d60:	41075713          	srai	a4,a4,0x10
    5d64:	0a071663          	bnez	a4,5e10 <f_readdir+0x1c4>
    5d68:	0007c703          	lbu	a4,0(a5)
    5d6c:	00cb2603          	lw	a2,12(s6)
    5d70:	00100813          	li	a6,1
    5d74:	fbf77713          	andi	a4,a4,-65
    5d78:	fff70713          	addi	a4,a4,-1
    5d7c:	03770733          	mul	a4,a4,s7
    5d80:	0ff00893          	li	a7,255
    5d84:	00aa06b3          	add	a3,s4,a0
    5d88:	0006c583          	lbu	a1,0(a3)
    5d8c:	00b785b3          	add	a1,a5,a1
    5d90:	0015c683          	lbu	a3,1(a1)
    5d94:	0005c583          	lbu	a1,0(a1)
    5d98:	00869693          	slli	a3,a3,0x8
    5d9c:	00b6e6b3          	or	a3,a3,a1
    5da0:	06080c63          	beqz	a6,5e18 <f_readdir+0x1cc>
    5da4:	06e8e663          	bltu	a7,a4,5e10 <f_readdir+0x1c4>
    5da8:	00171593          	slli	a1,a4,0x1
    5dac:	00b605b3          	add	a1,a2,a1
    5db0:	00d59023          	sh	a3,0(a1)
    5db4:	00068813          	mv	a6,a3
    5db8:	00170713          	addi	a4,a4,1
    5dbc:	00150513          	addi	a0,a0,1
    5dc0:	fd7512e3          	bne	a0,s7,5d84 <f_readdir+0x138>
    5dc4:	0007c783          	lbu	a5,0(a5)
    5dc8:	0407f793          	andi	a5,a5,64
    5dcc:	00078e63          	beqz	a5,5de8 <f_readdir+0x19c>
    5dd0:	00080c63          	beqz	a6,5de8 <f_readdir+0x19c>
    5dd4:	0ff00793          	li	a5,255
    5dd8:	02e7ec63          	bltu	a5,a4,5e10 <f_readdir+0x1c4>
    5ddc:	00171713          	slli	a4,a4,0x1
    5de0:	00e60733          	add	a4,a2,a4
    5de4:	00071023          	sh	zero,0(a4)
    5de8:	fff40413          	addi	s0,s0,-1
    5dec:	0ff47413          	andi	s0,s0,255
    5df0:	00090513          	mv	a0,s2
    5df4:	b81fe0ef          	jal	ra,4974 <dir_next.isra.0>
    5df8:	ec050ee3          	beqz	a0,5cd4 <f_readdir+0x88>
    5dfc:	00092c23          	sw	zero,24(s2)
    5e00:	00400793          	li	a5,4
    5e04:	eaf512e3          	bne	a0,a5,5ca8 <f_readdir+0x5c>
    5e08:	04c0006f          	j	5e54 <f_readdir+0x208>
    5e0c:	f2870ce3          	beq	a4,s0,5d44 <f_readdir+0xf8>
    5e10:	0ff00413          	li	s0,255
    5e14:	fddff06f          	j	5df0 <f_readdir+0x1a4>
    5e18:	fb5682e3          	beq	a3,s5,5dbc <f_readdir+0x170>
    5e1c:	ff5ff06f          	j	5e10 <f_readdir+0x1c4>
    5e20:	02041663          	bnez	s0,5e4c <f_readdir+0x200>
    5e24:	00b78693          	addi	a3,a5,11
    5e28:	00145713          	srli	a4,s0,0x1
    5e2c:	00178793          	addi	a5,a5,1
    5e30:	00741413          	slli	s0,s0,0x7
    5e34:	00876433          	or	s0,a4,s0
    5e38:	fff7c703          	lbu	a4,-1(a5)
    5e3c:	00e40433          	add	s0,s0,a4
    5e40:	0ff47413          	andi	s0,s0,255
    5e44:	fef692e3          	bne	a3,a5,5e28 <f_readdir+0x1dc>
    5e48:	008c0663          	beq	s8,s0,5e54 <f_readdir+0x208>
    5e4c:	fff00793          	li	a5,-1
    5e50:	02f92623          	sw	a5,44(s2)
    5e54:	00092c83          	lw	s9,0(s2)
    5e58:	00048b23          	sb	zero,22(s1)
    5e5c:	01892783          	lw	a5,24(s2)
    5e60:	20078063          	beqz	a5,6060 <f_readdir+0x414>
    5e64:	02c92703          	lw	a4,44(s2)
    5e68:	fff00793          	li	a5,-1
    5e6c:	16f71663          	bne	a4,a5,5fd8 <f_readdir+0x38c>
    5e70:	01c92403          	lw	s0,28(s2)
    5e74:	00000793          	li	a5,0
    5e78:	00000713          	li	a4,0
    5e7c:	02000593          	li	a1,32
    5e80:	00500513          	li	a0,5
    5e84:	00900813          	li	a6,9
    5e88:	00b00613          	li	a2,11
    5e8c:	02e00893          	li	a7,46
    5e90:	00170713          	addi	a4,a4,1
    5e94:	00e406b3          	add	a3,s0,a4
    5e98:	fff6c683          	lbu	a3,-1(a3)
    5e9c:	02b68663          	beq	a3,a1,5ec8 <f_readdir+0x27c>
    5ea0:	00a69463          	bne	a3,a0,5ea8 <f_readdir+0x25c>
    5ea4:	0e500693          	li	a3,229
    5ea8:	01071a63          	bne	a4,a6,5ebc <f_readdir+0x270>
    5eac:	00f66863          	bltu	a2,a5,5ebc <f_readdir+0x270>
    5eb0:	00f48333          	add	t1,s1,a5
    5eb4:	011304a3          	sb	a7,9(t1)
    5eb8:	00178793          	addi	a5,a5,1
    5ebc:	00f48333          	add	t1,s1,a5
    5ec0:	00d304a3          	sb	a3,9(t1)
    5ec4:	00178793          	addi	a5,a5,1
    5ec8:	fcc714e3          	bne	a4,a2,5e90 <f_readdir+0x244>
    5ecc:	00f48733          	add	a4,s1,a5
    5ed0:	000704a3          	sb	zero,9(a4)
    5ed4:	0164c703          	lbu	a4,22(s1)
    5ed8:	14071663          	bnez	a4,6024 <f_readdir+0x3d8>
    5edc:	12078463          	beqz	a5,6004 <f_readdir+0x3b8>
    5ee0:	ff700613          	li	a2,-9
    5ee4:	00948793          	addi	a5,s1,9
    5ee8:	00800593          	li	a1,8
    5eec:	40960633          	sub	a2,a2,s1
    5ef0:	02e00513          	li	a0,46
    5ef4:	01900813          	li	a6,25
    5ef8:	0007c683          	lbu	a3,0(a5)
    5efc:	00f60733          	add	a4,a2,a5
    5f00:	10068863          	beqz	a3,6010 <f_readdir+0x3c4>
    5f04:	01069713          	slli	a4,a3,0x10
    5f08:	01075713          	srli	a4,a4,0x10
    5f0c:	1aa68263          	beq	a3,a0,60b0 <f_readdir+0x464>
    5f10:	fbf70693          	addi	a3,a4,-65
    5f14:	01069693          	slli	a3,a3,0x10
    5f18:	0106d693          	srli	a3,a3,0x10
    5f1c:	00d86a63          	bltu	a6,a3,5f30 <f_readdir+0x2e4>
    5f20:	00c44683          	lbu	a3,12(s0)
    5f24:	00d5f6b3          	and	a3,a1,a3
    5f28:	00068463          	beqz	a3,5f30 <f_readdir+0x2e4>
    5f2c:	02070713          	addi	a4,a4,32
    5f30:	00e786a3          	sb	a4,13(a5)
    5f34:	00178793          	addi	a5,a5,1
    5f38:	fc1ff06f          	j	5ef8 <f_readdir+0x2ac>
    5f3c:	00400513          	li	a0,4
    5f40:	ebdff06f          	j	5dfc <f_readdir+0x1b0>
    5f44:	000a9a63          	bnez	s5,5f58 <f_readdir+0x30c>
    5f48:	01778733          	add	a4,a5,s7
    5f4c:	01071713          	slli	a4,a4,0x10
    5f50:	01075713          	srli	a4,a4,0x10
    5f54:	02edfe63          	bgeu	s11,a4,5f90 <f_readdir+0x344>
    5f58:	010a9513          	slli	a0,s5,0x10
    5f5c:	1b500593          	li	a1,437
    5f60:	00f56533          	or	a0,a0,a5
    5f64:	414c0433          	sub	s0,s8,s4
    5f68:	d74fe0ef          	jal	ra,44dc <ff_uni2oem>
    5f6c:	04ac7a63          	bgeu	s8,a0,5fc0 <f_readdir+0x374>
    5f70:	088d7663          	bgeu	s10,s0,5ffc <f_readdir+0x3b0>
    5f74:	014487b3          	add	a5,s1,s4
    5f78:	00855713          	srli	a4,a0,0x8
    5f7c:	00e78b23          	sb	a4,22(a5)
    5f80:	00a78ba3          	sb	a0,23(a5)
    5f84:	00200793          	li	a5,2
    5f88:	00fa0a33          	add	s4,s4,a5
    5f8c:	00000793          	li	a5,0
    5f90:	002b0b13          	addi	s6,s6,2
    5f94:	00078a93          	mv	s5,a5
    5f98:	00cca783          	lw	a5,12(s9)
    5f9c:	016787b3          	add	a5,a5,s6
    5fa0:	0007d783          	lhu	a5,0(a5)
    5fa4:	fa0790e3          	bnez	a5,5f44 <f_readdir+0x2f8>
    5fa8:	000a0413          	mv	s0,s4
    5fac:	000a8463          	beqz	s5,5fb4 <f_readdir+0x368>
    5fb0:	00000413          	li	s0,0
    5fb4:	00848433          	add	s0,s1,s0
    5fb8:	00040b23          	sb	zero,22(s0)
    5fbc:	eb5ff06f          	j	5e70 <f_readdir+0x224>
    5fc0:	02050e63          	beqz	a0,5ffc <f_readdir+0x3b0>
    5fc4:	fe0404e3          	beqz	s0,5fac <f_readdir+0x360>
    5fc8:	014487b3          	add	a5,s1,s4
    5fcc:	00a78b23          	sb	a0,22(a5)
    5fd0:	00100793          	li	a5,1
    5fd4:	fb5ff06f          	j	5f88 <f_readdir+0x33c>
    5fd8:	00003bb7          	lui	s7,0x3
    5fdc:	00000b13          	li	s6,0
    5fe0:	00000a13          	li	s4,0
    5fe4:	00000a93          	li	s5,0
    5fe8:	0ff00c13          	li	s8,255
    5fec:	00100d13          	li	s10,1
    5ff0:	800b8b93          	addi	s7,s7,-2048 # 2800 <__i_vfprintf+0x20>
    5ff4:	7ff00d93          	li	s11,2047
    5ff8:	fa1ff06f          	j	5f98 <f_readdir+0x34c>
    5ffc:	00000413          	li	s0,0
    6000:	fadff06f          	j	5fac <f_readdir+0x360>
    6004:	03f00793          	li	a5,63
    6008:	00f48b23          	sb	a5,22(s1)
    600c:	00100713          	li	a4,1
    6010:	00e48733          	add	a4,s1,a4
    6014:	00070b23          	sb	zero,22(a4)
    6018:	00c44783          	lbu	a5,12(s0)
    601c:	00079463          	bnez	a5,6024 <f_readdir+0x3d8>
    6020:	000484a3          	sb	zero,9(s1)
    6024:	00b44783          	lbu	a5,11(s0)
    6028:	01c40513          	addi	a0,s0,28
    602c:	00f48423          	sb	a5,8(s1)
    6030:	e34fe0ef          	jal	ra,4664 <ld_dword>
    6034:	00a4a023          	sw	a0,0(s1)
    6038:	01744783          	lbu	a5,23(s0)
    603c:	01644703          	lbu	a4,22(s0)
    6040:	00879793          	slli	a5,a5,0x8
    6044:	00e7e7b3          	or	a5,a5,a4
    6048:	00f49323          	sh	a5,6(s1)
    604c:	01944783          	lbu	a5,25(s0)
    6050:	01844703          	lbu	a4,24(s0)
    6054:	00879793          	slli	a5,a5,0x8
    6058:	00e7e7b3          	or	a5,a5,a4
    605c:	00f49223          	sh	a5,4(s1)
    6060:	00090513          	mv	a0,s2
    6064:	911fe0ef          	jal	ra,4974 <dir_next.isra.0>
    6068:	00400793          	li	a5,4
    606c:	c2f51ee3          	bne	a0,a5,5ca8 <f_readdir+0x5c>
    6070:	04c12083          	lw	ra,76(sp)
    6074:	04812403          	lw	s0,72(sp)
    6078:	04412483          	lw	s1,68(sp)
    607c:	04012903          	lw	s2,64(sp)
    6080:	03812a03          	lw	s4,56(sp)
    6084:	03412a83          	lw	s5,52(sp)
    6088:	03012b03          	lw	s6,48(sp)
    608c:	02c12b83          	lw	s7,44(sp)
    6090:	02812c03          	lw	s8,40(sp)
    6094:	02412c83          	lw	s9,36(sp)
    6098:	02012d03          	lw	s10,32(sp)
    609c:	01c12d83          	lw	s11,28(sp)
    60a0:	00098513          	mv	a0,s3
    60a4:	03c12983          	lw	s3,60(sp)
    60a8:	05010113          	addi	sp,sp,80
    60ac:	00008067          	ret
    60b0:	01000593          	li	a1,16
    60b4:	e7dff06f          	j	5f30 <f_readdir+0x2e4>

000060b8 <cdelay>:
    60b8:	00000013          	nop
    60bc:	fff50513          	addi	a0,a0,-1
    60c0:	fe051ce3          	bnez	a0,60b8 <cdelay>
    60c4:	00008067          	ret

000060c8 <sdram_get_databits>:
    60c8:	01000513          	li	a0,16
    60cc:	00008067          	ret

000060d0 <sdram_get_freq>:
    60d0:	02faf537          	lui	a0,0x2faf
    60d4:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa68a4>
    60d8:	00008067          	ret

000060dc <sdram_get_cl>:
    60dc:	00200513          	li	a0,2
    60e0:	00008067          	ret

000060e4 <sdram_get_cwl>:
    60e4:	00200513          	li	a0,2
    60e8:	00008067          	ret

000060ec <sdram_software_control_on>:
    60ec:	f00037b7          	lui	a5,0xf0003
    60f0:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    60f4:	00e00713          	li	a4,14
    60f8:	00e68a63          	beq	a3,a4,610c <sdram_software_control_on+0x20>
    60fc:	00008537          	lui	a0,0x8
    6100:	80e7a023          	sw	a4,-2048(a5)
    6104:	55850513          	addi	a0,a0,1368 # 8558 <LfnOfs+0x10>
    6108:	bd0fc06f          	j	24d8 <printf>
    610c:	00008067          	ret

00006110 <sdram_software_control_off>:
    6110:	f00037b7          	lui	a5,0xf0003
    6114:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    6118:	00100713          	li	a4,1
    611c:	00e68a63          	beq	a3,a4,6130 <sdram_software_control_off+0x20>
    6120:	00008537          	lui	a0,0x8
    6124:	80e7a023          	sw	a4,-2048(a5)
    6128:	58050513          	addi	a0,a0,1408 # 8580 <LfnOfs+0x38>
    612c:	bacfc06f          	j	24d8 <printf>
    6130:	00008067          	ret

00006134 <sdram_mode_register_write>:
    6134:	f00037b7          	lui	a5,0xf0003
    6138:	80b7a623          	sw	a1,-2036(a5) # f000280c <_fstack+0xe000180c>
    613c:	80a7a823          	sw	a0,-2032(a5)
    6140:	00f00713          	li	a4,15
    6144:	80e7a223          	sw	a4,-2044(a5)
    6148:	00100713          	li	a4,1
    614c:	80e7a423          	sw	a4,-2040(a5)
    6150:	00008067          	ret

00006154 <sdram_leveling>:
    6154:	ff010113          	addi	sp,sp,-16
    6158:	00112623          	sw	ra,12(sp)
    615c:	f91ff0ef          	jal	ra,60ec <sdram_software_control_on>
    6160:	fb1ff0ef          	jal	ra,6110 <sdram_software_control_off>
    6164:	00c12083          	lw	ra,12(sp)
    6168:	00100513          	li	a0,1
    616c:	01010113          	addi	sp,sp,16
    6170:	00008067          	ret

00006174 <sdram_init>:
    6174:	00008537          	lui	a0,0x8
    6178:	fe010113          	addi	sp,sp,-32
    617c:	400005b7          	lui	a1,0x40000
    6180:	5a850513          	addi	a0,a0,1448 # 85a8 <LfnOfs+0x60>
    6184:	00112e23          	sw	ra,28(sp)
    6188:	00812c23          	sw	s0,24(sp)
    618c:	00912a23          	sw	s1,20(sp)
    6190:	f0003437          	lui	s0,0xf0003
    6194:	01212823          	sw	s2,16(sp)
    6198:	01312623          	sw	s3,12(sp)
    619c:	01412423          	sw	s4,8(sp)
    61a0:	b38fc0ef          	jal	ra,24d8 <printf>
    61a4:	f49ff0ef          	jal	ra,60ec <sdram_software_control_on>
    61a8:	80042623          	sw	zero,-2036(s0) # f000280c <_fstack+0xe000180c>
    61ac:	00e00793          	li	a5,14
    61b0:	80042823          	sw	zero,-2032(s0)
    61b4:	00005537          	lui	a0,0x5
    61b8:	80f42023          	sw	a5,-2048(s0)
    61bc:	e2050513          	addi	a0,a0,-480 # 4e20 <mount_volume.isra.0+0x2c0>
    61c0:	40000a13          	li	s4,1024
    61c4:	ef5ff0ef          	jal	ra,60b8 <cdelay>
    61c8:	81442623          	sw	s4,-2036(s0)
    61cc:	80042823          	sw	zero,-2032(s0)
    61d0:	00b00993          	li	s3,11
    61d4:	81342223          	sw	s3,-2044(s0)
    61d8:	00100493          	li	s1,1
    61dc:	80942423          	sw	s1,-2040(s0)
    61e0:	12000793          	li	a5,288
    61e4:	80f42623          	sw	a5,-2036(s0)
    61e8:	80042823          	sw	zero,-2032(s0)
    61ec:	00f00913          	li	s2,15
    61f0:	81242223          	sw	s2,-2044(s0)
    61f4:	0c800513          	li	a0,200
    61f8:	80942423          	sw	s1,-2040(s0)
    61fc:	ebdff0ef          	jal	ra,60b8 <cdelay>
    6200:	81442623          	sw	s4,-2036(s0)
    6204:	80042823          	sw	zero,-2032(s0)
    6208:	81342223          	sw	s3,-2044(s0)
    620c:	80942423          	sw	s1,-2040(s0)
    6210:	80042623          	sw	zero,-2036(s0)
    6214:	80042823          	sw	zero,-2032(s0)
    6218:	00d00993          	li	s3,13
    621c:	81342223          	sw	s3,-2044(s0)
    6220:	00400513          	li	a0,4
    6224:	80942423          	sw	s1,-2040(s0)
    6228:	e91ff0ef          	jal	ra,60b8 <cdelay>
    622c:	80042623          	sw	zero,-2036(s0)
    6230:	80042823          	sw	zero,-2032(s0)
    6234:	81342223          	sw	s3,-2044(s0)
    6238:	00400513          	li	a0,4
    623c:	80942423          	sw	s1,-2040(s0)
    6240:	e79ff0ef          	jal	ra,60b8 <cdelay>
    6244:	02000793          	li	a5,32
    6248:	80f42623          	sw	a5,-2036(s0)
    624c:	80042823          	sw	zero,-2032(s0)
    6250:	81242223          	sw	s2,-2044(s0)
    6254:	0c800513          	li	a0,200
    6258:	80942423          	sw	s1,-2040(s0)
    625c:	e5dff0ef          	jal	ra,60b8 <cdelay>
    6260:	eb1ff0ef          	jal	ra,6110 <sdram_software_control_off>
    6264:	002005b7          	lui	a1,0x200
    6268:	40000537          	lui	a0,0x40000
    626c:	cd1fd0ef          	jal	ra,3f3c <memtest>
    6270:	00050e63          	beqz	a0,628c <sdram_init+0x118>
    6274:	40000537          	lui	a0,0x40000
    6278:	00000693          	li	a3,0
    627c:	00000613          	li	a2,0
    6280:	002005b7          	lui	a1,0x200
    6284:	a71fd0ef          	jal	ra,3cf4 <memspeed>
    6288:	00100513          	li	a0,1
    628c:	01c12083          	lw	ra,28(sp)
    6290:	01812403          	lw	s0,24(sp)
    6294:	01412483          	lw	s1,20(sp)
    6298:	01012903          	lw	s2,16(sp)
    629c:	00c12983          	lw	s3,12(sp)
    62a0:	00812a03          	lw	s4,8(sp)
    62a4:	02010113          	addi	sp,sp,32
    62a8:	00008067          	ret

000062ac <print_size>:
    62ac:	fe010113          	addi	sp,sp,-32
    62b0:	00812c23          	sw	s0,24(sp)
    62b4:	00112e23          	sw	ra,28(sp)
    62b8:	00912a23          	sw	s1,20(sp)
    62bc:	01212823          	sw	s2,16(sp)
    62c0:	01312623          	sw	s3,12(sp)
    62c4:	00050413          	mv	s0,a0
    62c8:	00058693          	mv	a3,a1
    62cc:	08059063          	bnez	a1,634c <print_size+0xa0>
    62d0:	3ff00793          	li	a5,1023
    62d4:	02a7e663          	bltu	a5,a0,6300 <print_size+0x54>
    62d8:	01812403          	lw	s0,24(sp)
    62dc:	01c12083          	lw	ra,28(sp)
    62e0:	01412483          	lw	s1,20(sp)
    62e4:	01012903          	lw	s2,16(sp)
    62e8:	00c12983          	lw	s3,12(sp)
    62ec:	00050613          	mv	a2,a0
    62f0:	00008537          	lui	a0,0x8
    62f4:	5c850513          	addi	a0,a0,1480 # 85c8 <LfnOfs+0x80>
    62f8:	02010113          	addi	sp,sp,32
    62fc:	9dcfc06f          	j	24d8 <printf>
    6300:	001007b7          	lui	a5,0x100
    6304:	04f57463          	bgeu	a0,a5,634c <print_size+0xa0>
    6308:	06600613          	li	a2,102
    630c:	00000693          	li	a3,0
    6310:	3ff57513          	andi	a0,a0,1023
    6314:	868fd0ef          	jal	ra,337c <__udivdi3>
    6318:	00050713          	mv	a4,a0
    631c:	00008537          	lui	a0,0x8
    6320:	00058793          	mv	a5,a1
    6324:	00a45613          	srli	a2,s0,0xa
    6328:	00000693          	li	a3,0
    632c:	5d050513          	addi	a0,a0,1488 # 85d0 <LfnOfs+0x88>
    6330:	01812403          	lw	s0,24(sp)
    6334:	01c12083          	lw	ra,28(sp)
    6338:	01412483          	lw	s1,20(sp)
    633c:	01012903          	lw	s2,16(sp)
    6340:	00c12983          	lw	s3,12(sp)
    6344:	02010113          	addi	sp,sp,32
    6348:	990fc06f          	j	24d8 <printf>
    634c:	00c69793          	slli	a5,a3,0xc
    6350:	01445913          	srli	s2,s0,0x14
    6354:	0127e933          	or	s2,a5,s2
    6358:	0146d993          	srli	s3,a3,0x14
    635c:	04069c63          	bnez	a3,63b4 <print_size+0x108>
    6360:	400007b7          	lui	a5,0x40000
    6364:	04f47863          	bgeu	s0,a5,63b4 <print_size+0x108>
    6368:	01695793          	srli	a5,s2,0x16
    636c:	00a45413          	srli	s0,s0,0xa
    6370:	00a99593          	slli	a1,s3,0xa
    6374:	00a91513          	slli	a0,s2,0xa
    6378:	00b7e5b3          	or	a1,a5,a1
    637c:	40a40533          	sub	a0,s0,a0
    6380:	00a43433          	sltu	s0,s0,a0
    6384:	40b005b3          	neg	a1,a1
    6388:	06600613          	li	a2,102
    638c:	00000693          	li	a3,0
    6390:	408585b3          	sub	a1,a1,s0
    6394:	fe9fc0ef          	jal	ra,337c <__udivdi3>
    6398:	00050713          	mv	a4,a0
    639c:	00008537          	lui	a0,0x8
    63a0:	00058793          	mv	a5,a1
    63a4:	00090613          	mv	a2,s2
    63a8:	00098693          	mv	a3,s3
    63ac:	5e050513          	addi	a0,a0,1504 # 85e0 <LfnOfs+0x98>
    63b0:	f81ff06f          	j	6330 <print_size+0x84>
    63b4:	00269793          	slli	a5,a3,0x2
    63b8:	01e45413          	srli	s0,s0,0x1e
    63bc:	0087e433          	or	s0,a5,s0
    63c0:	01e6d493          	srli	s1,a3,0x1e
    63c4:	01645793          	srli	a5,s0,0x16
    63c8:	00a49593          	slli	a1,s1,0xa
    63cc:	00a41513          	slli	a0,s0,0xa
    63d0:	00b7e5b3          	or	a1,a5,a1
    63d4:	40a90533          	sub	a0,s2,a0
    63d8:	00a93933          	sltu	s2,s2,a0
    63dc:	40b985b3          	sub	a1,s3,a1
    63e0:	06600613          	li	a2,102
    63e4:	00000693          	li	a3,0
    63e8:	412585b3          	sub	a1,a1,s2
    63ec:	f91fc0ef          	jal	ra,337c <__udivdi3>
    63f0:	00050713          	mv	a4,a0
    63f4:	00008537          	lui	a0,0x8
    63f8:	00058793          	mv	a5,a1
    63fc:	00040613          	mv	a2,s0
    6400:	00048693          	mv	a3,s1
    6404:	5f050513          	addi	a0,a0,1520 # 85f0 <LfnOfs+0xa8>
    6408:	f29ff06f          	j	6330 <print_size+0x84>

0000640c <print_progress>:
    640c:	ff010113          	addi	sp,sp,-16
    6410:	00812423          	sw	s0,8(sp)
    6414:	00070413          	mv	s0,a4
    6418:	00d58733          	add	a4,a1,a3
    641c:	00912223          	sw	s1,4(sp)
    6420:	00060813          	mv	a6,a2
    6424:	00068493          	mv	s1,a3
    6428:	008607b3          	add	a5,a2,s0
    642c:	00b736b3          	sltu	a3,a4,a1
    6430:	00058613          	mv	a2,a1
    6434:	00050593          	mv	a1,a0
    6438:	00008537          	lui	a0,0x8
    643c:	00f687b3          	add	a5,a3,a5
    6440:	60050513          	addi	a0,a0,1536 # 8600 <LfnOfs+0xb8>
    6444:	00080693          	mv	a3,a6
    6448:	00112623          	sw	ra,12(sp)
    644c:	88cfc0ef          	jal	ra,24d8 <printf>
    6450:	00048513          	mv	a0,s1
    6454:	00040593          	mv	a1,s0
    6458:	e55ff0ef          	jal	ra,62ac <print_size>
    645c:	00812403          	lw	s0,8(sp)
    6460:	00c12083          	lw	ra,12(sp)
    6464:	00412483          	lw	s1,4(sp)
    6468:	00008537          	lui	a0,0x8
    646c:	ed850513          	addi	a0,a0,-296 # 7ed8 <crc_table+0x44c>
    6470:	01010113          	addi	sp,sp,16
    6474:	864fc06f          	j	24d8 <printf>

00006478 <sdram_get_supported_memory>:
    6478:	02000537          	lui	a0,0x2000
    647c:	00000593          	li	a1,0
    6480:	00008067          	ret

00006484 <spi_xfer>:
    6484:	f0003737          	lui	a4,0xf0003
    6488:	000017b7          	lui	a5,0x1
    648c:	00a72423          	sw	a0,8(a4) # f0003008 <_fstack+0xe0002008>
    6490:	80178793          	addi	a5,a5,-2047 # 801 <boot+0x19>
    6494:	00f72023          	sw	a5,0(a4)
    6498:	00472783          	lw	a5,4(a4)
    649c:	0017f793          	andi	a5,a5,1
    64a0:	fe078ce3          	beqz	a5,6498 <spi_xfer+0x14>
    64a4:	00c72503          	lw	a0,12(a4)
    64a8:	0ff57513          	andi	a0,a0,255
    64ac:	00008067          	ret

000064b0 <spisdcard_deselect>:
    64b0:	f00037b7          	lui	a5,0xf0003
    64b4:	0007a823          	sw	zero,16(a5) # f0003010 <_fstack+0xe0002010>
    64b8:	0ff00513          	li	a0,255
    64bc:	fc9ff06f          	j	6484 <spi_xfer>

000064c0 <spisdcardread_bytes>:
    64c0:	ff010113          	addi	sp,sp,-16
    64c4:	00812423          	sw	s0,8(sp)
    64c8:	00912223          	sw	s1,4(sp)
    64cc:	01212023          	sw	s2,0(sp)
    64d0:	00112623          	sw	ra,12(sp)
    64d4:	00050913          	mv	s2,a0
    64d8:	00058493          	mv	s1,a1
    64dc:	00000413          	li	s0,0
    64e0:	0ff00513          	li	a0,255
    64e4:	fa1ff0ef          	jal	ra,6484 <spi_xfer>
    64e8:	008907b3          	add	a5,s2,s0
    64ec:	00140413          	addi	s0,s0,1
    64f0:	00a78023          	sb	a0,0(a5)
    64f4:	01041793          	slli	a5,s0,0x10
    64f8:	0107d793          	srli	a5,a5,0x10
    64fc:	fe97e2e3          	bltu	a5,s1,64e0 <spisdcardread_bytes+0x20>
    6500:	00c12083          	lw	ra,12(sp)
    6504:	00812403          	lw	s0,8(sp)
    6508:	00412483          	lw	s1,4(sp)
    650c:	00012903          	lw	s2,0(sp)
    6510:	01010113          	addi	sp,sp,16
    6514:	00008067          	ret

00006518 <spisd_disk_status>:
    6518:	00051863          	bnez	a0,6528 <spisd_disk_status+0x10>
    651c:	100007b7          	lui	a5,0x10000
    6520:	1647c503          	lbu	a0,356(a5) # 10000164 <spisdcardstatus>
    6524:	00008067          	ret
    6528:	00100513          	li	a0,1
    652c:	00008067          	ret

00006530 <spisdcardsend_cmd>:
    6530:	fe010113          	addi	sp,sp,-32
    6534:	01851793          	slli	a5,a0,0x18
    6538:	00812c23          	sw	s0,24(sp)
    653c:	00912a23          	sw	s1,20(sp)
    6540:	00112e23          	sw	ra,28(sp)
    6544:	01212823          	sw	s2,16(sp)
    6548:	4187d793          	srai	a5,a5,0x18
    654c:	00050413          	mv	s0,a0
    6550:	00058493          	mv	s1,a1
    6554:	0207d063          	bgez	a5,6574 <spisdcardsend_cmd+0x44>
    6558:	00000593          	li	a1,0
    655c:	03700513          	li	a0,55
    6560:	fd1ff0ef          	jal	ra,6530 <spisdcardsend_cmd>
    6564:	00a103a3          	sb	a0,7(sp)
    6568:	00100793          	li	a5,1
    656c:	06a7e063          	bltu	a5,a0,65cc <spisdcardsend_cmd+0x9c>
    6570:	07f47413          	andi	s0,s0,127
    6574:	00c00793          	li	a5,12
    6578:	06f40663          	beq	s0,a5,65e4 <spisdcardsend_cmd+0xb4>
    657c:	06040463          	beqz	s0,65e4 <spisdcardsend_cmd+0xb4>
    6580:	f31ff0ef          	jal	ra,64b0 <spisdcard_deselect>
    6584:	f00037b7          	lui	a5,0xf0003
    6588:	00100713          	li	a4,1
    658c:	00e7a823          	sw	a4,16(a5) # f0003010 <_fstack+0xe0002010>
    6590:	0ff00513          	li	a0,255
    6594:	ef1ff0ef          	jal	ra,6484 <spi_xfer>
    6598:	1f400913          	li	s2,500
    659c:	0ff00513          	li	a0,255
    65a0:	ee5ff0ef          	jal	ra,6484 <spi_xfer>
    65a4:	0ff00793          	li	a5,255
    65a8:	02f50e63          	beq	a0,a5,65e4 <spisdcardsend_cmd+0xb4>
    65ac:	fff90913          	addi	s2,s2,-1
    65b0:	01091913          	slli	s2,s2,0x10
    65b4:	00100513          	li	a0,1
    65b8:	01095913          	srli	s2,s2,0x10
    65bc:	850fd0ef          	jal	ra,360c <busy_wait>
    65c0:	fc091ee3          	bnez	s2,659c <spisdcardsend_cmd+0x6c>
    65c4:	eedff0ef          	jal	ra,64b0 <spisdcard_deselect>
    65c8:	0ff00513          	li	a0,255
    65cc:	01c12083          	lw	ra,28(sp)
    65d0:	01812403          	lw	s0,24(sp)
    65d4:	01412483          	lw	s1,20(sp)
    65d8:	01012903          	lw	s2,16(sp)
    65dc:	02010113          	addi	sp,sp,32
    65e0:	00008067          	ret
    65e4:	04046793          	ori	a5,s0,64
    65e8:	00f10423          	sb	a5,8(sp)
    65ec:	0184d793          	srli	a5,s1,0x18
    65f0:	00f104a3          	sb	a5,9(sp)
    65f4:	0104d793          	srli	a5,s1,0x10
    65f8:	00f10523          	sb	a5,10(sp)
    65fc:	0084d793          	srli	a5,s1,0x8
    6600:	00f105a3          	sb	a5,11(sp)
    6604:	00910623          	sb	s1,12(sp)
    6608:	f9500793          	li	a5,-107
    660c:	00040863          	beqz	s0,661c <spisdcardsend_cmd+0xec>
    6610:	00800793          	li	a5,8
    6614:	06f41863          	bne	s0,a5,6684 <spisdcardsend_cmd+0x154>
    6618:	f8700793          	li	a5,-121
    661c:	00f106a3          	sb	a5,13(sp)
    6620:	00000493          	li	s1,0
    6624:	00600913          	li	s2,6
    6628:	00810793          	addi	a5,sp,8
    662c:	009787b3          	add	a5,a5,s1
    6630:	0007c503          	lbu	a0,0(a5)
    6634:	00148493          	addi	s1,s1,1
    6638:	e4dff0ef          	jal	ra,6484 <spi_xfer>
    663c:	ff2496e3          	bne	s1,s2,6628 <spisdcardsend_cmd+0xf8>
    6640:	00c00793          	li	a5,12
    6644:	00f41863          	bne	s0,a5,6654 <spisdcardsend_cmd+0x124>
    6648:	00100593          	li	a1,1
    664c:	00710513          	addi	a0,sp,7
    6650:	e71ff0ef          	jal	ra,64c0 <spisdcardread_bytes>
    6654:	00a00413          	li	s0,10
    6658:	00710513          	addi	a0,sp,7
    665c:	00100593          	li	a1,1
    6660:	e61ff0ef          	jal	ra,64c0 <spisdcardread_bytes>
    6664:	00714503          	lbu	a0,7(sp)
    6668:	01851793          	slli	a5,a0,0x18
    666c:	4187d793          	srai	a5,a5,0x18
    6670:	f407dee3          	bgez	a5,65cc <spisdcardsend_cmd+0x9c>
    6674:	fff40413          	addi	s0,s0,-1
    6678:	0ff47413          	andi	s0,s0,255
    667c:	fc041ee3          	bnez	s0,6658 <spisdcardsend_cmd+0x128>
    6680:	f4dff06f          	j	65cc <spisdcardsend_cmd+0x9c>
    6684:	00100793          	li	a5,1
    6688:	f95ff06f          	j	661c <spisdcardsend_cmd+0xec>

0000668c <spisd_disk_read>:
    668c:	fd010113          	addi	sp,sp,-48
    6690:	03212023          	sw	s2,32(sp)
    6694:	00100913          	li	s2,1
    6698:	00d93933          	sltu	s2,s2,a3
    669c:	01190913          	addi	s2,s2,17
    66a0:	02812423          	sw	s0,40(sp)
    66a4:	00090513          	mv	a0,s2
    66a8:	00058413          	mv	s0,a1
    66ac:	00060593          	mv	a1,a2
    66b0:	02912223          	sw	s1,36(sp)
    66b4:	02112623          	sw	ra,44(sp)
    66b8:	01312e23          	sw	s3,28(sp)
    66bc:	01412c23          	sw	s4,24(sp)
    66c0:	01512a23          	sw	s5,20(sp)
    66c4:	01612823          	sw	s6,16(sp)
    66c8:	01712623          	sw	s7,12(sp)
    66cc:	00068493          	mv	s1,a3
    66d0:	e61ff0ef          	jal	ra,6530 <spisdcardsend_cmd>
    66d4:	04051863          	bnez	a0,6724 <spisd_disk_read+0x98>
    66d8:	00001a37          	lui	s4,0x1
    66dc:	00018b37          	lui	s6,0x18
    66e0:	0fe00b93          	li	s7,254
    66e4:	f00039b7          	lui	s3,0xf0003
    66e8:	801a0a13          	addi	s4,s4,-2047 # 801 <boot+0x19>
    66ec:	02048263          	beqz	s1,6710 <spisd_disk_read+0x84>
    66f0:	6a0b0a93          	addi	s5,s6,1696 # 186a0 <_edata_rom+0xfec4>
    66f4:	0ff00513          	li	a0,255
    66f8:	d8dff0ef          	jal	ra,6484 <spi_xfer>
    66fc:	05750e63          	beq	a0,s7,6758 <spisd_disk_read+0xcc>
    6700:	00100513          	li	a0,1
    6704:	fffa8a93          	addi	s5,s5,-1
    6708:	f45fc0ef          	jal	ra,364c <busy_wait_us>
    670c:	fe0a94e3          	bnez	s5,66f4 <spisd_disk_read+0x68>
    6710:	01200793          	li	a5,18
    6714:	00f91863          	bne	s2,a5,6724 <spisd_disk_read+0x98>
    6718:	00000593          	li	a1,0
    671c:	00c00513          	li	a0,12
    6720:	e11ff0ef          	jal	ra,6530 <spisdcardsend_cmd>
    6724:	d8dff0ef          	jal	ra,64b0 <spisdcard_deselect>
    6728:	02c12083          	lw	ra,44(sp)
    672c:	02812403          	lw	s0,40(sp)
    6730:	02012903          	lw	s2,32(sp)
    6734:	01c12983          	lw	s3,28(sp)
    6738:	01812a03          	lw	s4,24(sp)
    673c:	01412a83          	lw	s5,20(sp)
    6740:	01012b03          	lw	s6,16(sp)
    6744:	00c12b83          	lw	s7,12(sp)
    6748:	00903533          	snez	a0,s1
    674c:	02412483          	lw	s1,36(sp)
    6750:	03010113          	addi	sp,sp,48
    6754:	00008067          	ret
    6758:	0ff00793          	li	a5,255
    675c:	00f9a423          	sw	a5,8(s3) # f0003008 <_fstack+0xe0002008>
    6760:	00100713          	li	a4,1
    6764:	20040793          	addi	a5,s0,512
    6768:	0149a023          	sw	s4,0(s3)
    676c:	0049a683          	lw	a3,4(s3)
    6770:	fee69ee3          	bne	a3,a4,676c <spisd_disk_read+0xe0>
    6774:	00c9a683          	lw	a3,12(s3)
    6778:	00140413          	addi	s0,s0,1
    677c:	fed40fa3          	sb	a3,-1(s0)
    6780:	fef414e3          	bne	s0,a5,6768 <spisd_disk_read+0xdc>
    6784:	0ff00513          	li	a0,255
    6788:	cfdff0ef          	jal	ra,6484 <spi_xfer>
    678c:	0ff00513          	li	a0,255
    6790:	cf5ff0ef          	jal	ra,6484 <spi_xfer>
    6794:	fff48493          	addi	s1,s1,-1
    6798:	f55ff06f          	j	66ec <spisd_disk_read+0x60>

0000679c <spisdcard_init>:
    679c:	fd010113          	addi	sp,sp,-48
    67a0:	02912223          	sw	s1,36(sp)
    67a4:	03212023          	sw	s2,32(sp)
    67a8:	01312e23          	sw	s3,28(sp)
    67ac:	02112623          	sw	ra,44(sp)
    67b0:	02812423          	sw	s0,40(sp)
    67b4:	f00037b7          	lui	a5,0xf0003
    67b8:	07e00713          	li	a4,126
    67bc:	00e7ac23          	sw	a4,24(a5) # f0003018 <_fstack+0xe0002018>
    67c0:	3e800493          	li	s1,1000
    67c4:	f0003937          	lui	s2,0xf0003
    67c8:	00100993          	li	s3,1
    67cc:	00092823          	sw	zero,16(s2) # f0003010 <_fstack+0xe0002010>
    67d0:	00a00413          	li	s0,10
    67d4:	fff40413          	addi	s0,s0,-1
    67d8:	0ff00513          	li	a0,255
    67dc:	0ff47413          	andi	s0,s0,255
    67e0:	ca5ff0ef          	jal	ra,6484 <spi_xfer>
    67e4:	fe0418e3          	bnez	s0,67d4 <spisdcard_init+0x38>
    67e8:	01392823          	sw	s3,16(s2)
    67ec:	00000593          	li	a1,0
    67f0:	00000513          	li	a0,0
    67f4:	d3dff0ef          	jal	ra,6530 <spisdcardsend_cmd>
    67f8:	05350463          	beq	a0,s3,6840 <spisdcard_init+0xa4>
    67fc:	fff48493          	addi	s1,s1,-1
    6800:	01049493          	slli	s1,s1,0x10
    6804:	0104d493          	srli	s1,s1,0x10
    6808:	fc0492e3          	bnez	s1,67cc <spisdcard_init+0x30>
    680c:	02c12083          	lw	ra,44(sp)
    6810:	00040513          	mv	a0,s0
    6814:	02812403          	lw	s0,40(sp)
    6818:	02412483          	lw	s1,36(sp)
    681c:	02012903          	lw	s2,32(sp)
    6820:	01c12983          	lw	s3,28(sp)
    6824:	03010113          	addi	sp,sp,48
    6828:	00008067          	ret
    682c:	f00037b7          	lui	a5,0xf0003
    6830:	00300713          	li	a4,3
    6834:	00e7ac23          	sw	a4,24(a5) # f0003018 <_fstack+0xe0002018>
    6838:	00090413          	mv	s0,s2
    683c:	fd1ff06f          	j	680c <spisdcard_init+0x70>
    6840:	1aa00593          	li	a1,426
    6844:	00800513          	li	a0,8
    6848:	ce9ff0ef          	jal	ra,6530 <spisdcardsend_cmd>
    684c:	00050913          	mv	s2,a0
    6850:	fb351ee3          	bne	a0,s3,680c <spisdcard_init+0x70>
    6854:	00400593          	li	a1,4
    6858:	00c10513          	addi	a0,sp,12
    685c:	c65ff0ef          	jal	ra,64c0 <spisdcardread_bytes>
    6860:	3e800493          	li	s1,1000
    6864:	400005b7          	lui	a1,0x40000
    6868:	0a900513          	li	a0,169
    686c:	cc5ff0ef          	jal	ra,6530 <spisdcardsend_cmd>
    6870:	fa050ee3          	beqz	a0,682c <spisdcard_init+0x90>
    6874:	fff48493          	addi	s1,s1,-1
    6878:	01049493          	slli	s1,s1,0x10
    687c:	00100513          	li	a0,1
    6880:	0104d493          	srli	s1,s1,0x10
    6884:	d89fc0ef          	jal	ra,360c <busy_wait>
    6888:	fc049ee3          	bnez	s1,6864 <spisdcard_init+0xc8>
    688c:	f81ff06f          	j	680c <spisdcard_init+0x70>

00006890 <spisd_disk_initialize>:
    6890:	04051063          	bnez	a0,68d0 <spisd_disk_initialize+0x40>
    6894:	ff010113          	addi	sp,sp,-16
    6898:	00812423          	sw	s0,8(sp)
    689c:	10000437          	lui	s0,0x10000
    68a0:	16444783          	lbu	a5,356(s0) # 10000164 <spisdcardstatus>
    68a4:	00112623          	sw	ra,12(sp)
    68a8:	00078a63          	beqz	a5,68bc <spisd_disk_initialize+0x2c>
    68ac:	ef1ff0ef          	jal	ra,679c <spisdcard_init>
    68b0:	00153513          	seqz	a0,a0
    68b4:	16a40223          	sb	a0,356(s0)
    68b8:	bf9ff0ef          	jal	ra,64b0 <spisdcard_deselect>
    68bc:	16444503          	lbu	a0,356(s0)
    68c0:	00c12083          	lw	ra,12(sp)
    68c4:	00812403          	lw	s0,8(sp)
    68c8:	01010113          	addi	sp,sp,16
    68cc:	00008067          	ret
    68d0:	00100513          	li	a0,1
    68d4:	00008067          	ret

000068d8 <fatfs_set_ops_spisdcard>:
    68d8:	100007b7          	lui	a5,0x10000
    68dc:	10000737          	lui	a4,0x10000
    68e0:	15078793          	addi	a5,a5,336 # 10000150 <SpiSdDiskOps>
    68e4:	4af72c23          	sw	a5,1208(a4) # 100004b8 <FfDiskOps>
    68e8:	00008067          	ret
