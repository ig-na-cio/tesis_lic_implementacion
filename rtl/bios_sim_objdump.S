
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
      64:	38c040ef          	jal	ra,43f0 <isr>
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
     120:	5e860613          	addi	a2,a2,1512 # 8704 <_fdata_rom>

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
     15c:	254040ef          	jal	ra,43b0 <plic_init>
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
     1c8:	52c98593          	addi	a1,s3,1324 # 752c <str.2797+0xa18>
     1cc:	02410513          	addi	a0,sp,36
     1d0:	26112623          	sw	ra,620(sp)
     1d4:	26812423          	sw	s0,616(sp)
     1d8:	25412c23          	sw	s4,600(sp)
     1dc:	490050ef          	jal	ra,566c <f_mount>
     1e0:	02051e63          	bnez	a0,21c <copy_file_from_sdcard_to_ram+0x74>
     1e4:	00100613          	li	a2,1
     1e8:	00048593          	mv	a1,s1
     1ec:	00410513          	addi	a0,sp,4
     1f0:	504050ef          	jal	ra,56f4 <f_open>
     1f4:	00050413          	mv	s0,a0
     1f8:	02050663          	beqz	a0,224 <copy_file_from_sdcard_to_ram+0x7c>
     1fc:	00007537          	lui	a0,0x7
     200:	00048593          	mv	a1,s1
     204:	92850513          	addi	a0,a0,-1752 # 6928 <_etext>
     208:	2d0020ef          	jal	ra,24d8 <printf>
     20c:	00000613          	li	a2,0
     210:	52c98593          	addi	a1,s3,1324
     214:	00000513          	li	a0,0
     218:	454050ef          	jal	ra,566c <f_mount>
     21c:	00000513          	li	a0,0
     220:	0ac0006f          	j	2cc <copy_file_from_sdcard_to_ram+0x124>
     224:	00098a13          	mv	s4,s3
     228:	01012983          	lw	s3,16(sp)
     22c:	00007537          	lui	a0,0x7
     230:	00090613          	mv	a2,s2
     234:	00098693          	mv	a3,s3
     238:	00048593          	mv	a1,s1
     23c:	93c50513          	addi	a0,a0,-1732 # 693c <_etext+0x14>
     240:	298020ef          	jal	ra,24d8 <printf>
     244:	00098513          	mv	a0,s3
     248:	554030ef          	jal	ra,379c <init_progression_bar>
     24c:	00010693          	mv	a3,sp
     250:	00008637          	lui	a2,0x8
     254:	008905b3          	add	a1,s2,s0
     258:	00410513          	addi	a0,sp,4
     25c:	588050ef          	jal	ra,57e4 <f_read>
     260:	02050263          	beqz	a0,284 <copy_file_from_sdcard_to_ram+0xdc>
     264:	00007537          	lui	a0,0x7
     268:	96450513          	addi	a0,a0,-1692 # 6964 <_etext+0x3c>
     26c:	26c020ef          	jal	ra,24d8 <printf>
     270:	00410513          	addi	a0,sp,4
     274:	784050ef          	jal	ra,59f8 <f_close>
     278:	00000613          	li	a2,0
     27c:	52ca0593          	addi	a1,s4,1324
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
     2a8:	16050513          	addi	a0,a0,352 # 8160 <crc_table+0x69c>
     2ac:	22c020ef          	jal	ra,24d8 <printf>
     2b0:	00410513          	addi	a0,sp,4
     2b4:	744050ef          	jal	ra,59f8 <f_close>
     2b8:	00000613          	li	a2,0
     2bc:	52ca0593          	addi	a1,s4,1324
     2c0:	00000513          	li	a0,0
     2c4:	3a8050ef          	jal	ra,566c <f_mount>
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
     344:	001f0f13          	addi	t5,t5,1 # 4001001 <_edata_rom+0x3ff8795>
     348:	05e00493          	li	s1,94
     34c:	441f8f93          	addi	t6,t6,1089 # 1440441 <_edata_rom+0x1437bd5>
     350:	00900913          	li	s2,9
     354:	00500993          	li	s3,5
     358:	01328293          	addi	t0,t0,19 # 800013 <_edata_rom+0x7f77a7>
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
     7fc:	97850513          	addi	a0,a0,-1672 # 6978 <_etext+0x50>
     800:	00058493          	mv	s1,a1
     804:	00068593          	mv	a1,a3
     808:	00112e23          	sw	ra,28(sp)
     80c:	00c12623          	sw	a2,12(sp)
     810:	00d12423          	sw	a3,8(sp)
     814:	4c5010ef          	jal	ra,24d8 <printf>
     818:	00007537          	lui	a0,0x7
     81c:	9a050513          	addi	a0,a0,-1632 # 69a0 <_etext+0x78>
     820:	4b9010ef          	jal	ra,24d8 <printf>
     824:	309030ef          	jal	ra,432c <uart_sync>
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
     8b0:	52c98593          	addi	a1,s3,1324 # 752c <str.2797+0xa18>
     8b4:	28410513          	addi	a0,sp,644
     8b8:	5b5040ef          	jal	ra,566c <f_mount>
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
     8e4:	9d4a0593          	addi	a1,s4,-1580 # 69d4 <_etext+0xac>
     8e8:	00090513          	mv	a0,s2
     8ec:	609040ef          	jal	ra,56f4 <f_open>
     8f0:	00050493          	mv	s1,a0
     8f4:	06050263          	beqz	a0,958 <sdcardboot_from_json.constprop.0+0xec>
     8f8:	00007537          	lui	a0,0x7
     8fc:	9d4a0593          	addi	a1,s4,-1580
     900:	92850513          	addi	a0,a0,-1752 # 6928 <_etext>
     904:	3d5010ef          	jal	ra,24d8 <printf>
     908:	00000613          	li	a2,0
     90c:	52c98593          	addi	a1,s3,1324
     910:	00000513          	li	a0,0
     914:	559040ef          	jal	ra,566c <f_mount>
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
     97c:	669040ef          	jal	ra,57e4 <f_read>
     980:	00090513          	mv	a0,s2
     984:	074050ef          	jal	ra,59f8 <f_close>
     988:	52c98593          	addi	a1,s3,1324
     98c:	00000613          	li	a2,0
     990:	00000513          	li	a0,0
     994:	4d9040ef          	jal	ra,566c <f_mount>
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
     af4:	9e078593          	addi	a1,a5,-1568 # 69e0 <_etext+0xb8>
     af8:	00040513          	mv	a0,s0
     afc:	091010ef          	jal	ra,238c <strncmp>
     b00:	02050863          	beqz	a0,b30 <sdcardboot_from_json.constprop.0+0x2c4>
     b04:	00400613          	li	a2,4
     b08:	9ecd8593          	addi	a1,s11,-1556 # 69ec <_etext+0xc4>
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
     b40:	9f458593          	addi	a1,a1,-1548 # 69f4 <_etext+0xcc>
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
     b8c:	9f858593          	addi	a1,a1,-1544 # 69f8 <_etext+0xd0>
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
     bbc:	9fc58593          	addi	a1,a1,-1540 # 69fc <_etext+0xd4>
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
     c28:	a0050513          	addi	a0,a0,-1536 # 6a00 <_etext+0xd8>
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
     c58:	a1850513          	addi	a0,a0,-1512 # 6a18 <_etext+0xf0>
     c5c:	07d010ef          	jal	ra,24d8 <printf>
     c60:	000077b7          	lui	a5,0x7
     c64:	b0478413          	addi	s0,a5,-1276 # 6b04 <str.2810>
     c68:	b0478913          	addi	s2,a5,-1276
     c6c:	00044503          	lbu	a0,0(s0)
     c70:	04051a63          	bnez	a0,cc4 <serialboot+0xa4>
     c74:	f00027b7          	lui	a5,0xf0002
     c78:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
     c7c:	00bec737          	lui	a4,0xbec
     c80:	8007a223          	sw	zero,-2044(a5)
     c84:	c2070713          	addi	a4,a4,-992 # bebc20 <_edata_rom+0xbe33b4>
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
     cbc:	a6c50513          	addi	a0,a0,-1428 # 6a6c <_etext+0x144>
     cc0:	1480006f          	j	e08 <serialboot+0x1e8>
     cc4:	558030ef          	jal	ra,421c <uart_write>
     cc8:	00140413          	addi	s0,s0,1
     ccc:	fa1ff06f          	j	c6c <serialboot+0x4c>
     cd0:	530030ef          	jal	ra,4200 <uart_read_nonblock>
     cd4:	08050c63          	beqz	a0,d6c <serialboot+0x14c>
     cd8:	4d4030ef          	jal	ra,41ac <uart_read>
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
     d08:	c20a0a13          	addi	s4,s4,-992 # bebc20 <_edata_rom+0xbe33b4>
     d0c:	00100a93          	li	s5,1
     d10:	00000413          	li	s0,0
     d14:	00200b13          	li	s6,2
     d18:	00300b93          	li	s7,3
     d1c:	4e4030ef          	jal	ra,4200 <uart_read_nonblock>
     d20:	02050463          	beqz	a0,d48 <serialboot+0x128>
     d24:	04041863          	bnez	s0,d74 <serialboot+0x154>
     d28:	80092423          	sw	zero,-2040(s2) # f0001808 <_fstack+0xe0000808>
     d2c:	80092223          	sw	zero,-2044(s2)
     d30:	81492023          	sw	s4,-2048(s2)
     d34:	81392423          	sw	s3,-2040(s2)
     d38:	81392623          	sw	s3,-2036(s2)
     d3c:	470030ef          	jal	ra,41ac <uart_read>
     d40:	00a10623          	sb	a0,12(sp)
     d44:	00140413          	addi	s0,s0,1
     d48:	81392623          	sw	s3,-2036(s2)
     d4c:	fc0408e3          	beqz	s0,d1c <serialboot+0xfc>
     d50:	81092783          	lw	a5,-2032(s2)
     d54:	fc0794e3          	bnez	a5,d1c <serialboot+0xfc>
     d58:	04500513          	li	a0,69
     d5c:	4c0030ef          	jal	ra,421c <uart_write>
     d60:	fb1ff06f          	j	d10 <serialboot+0xf0>
     d64:	f8650513          	addi	a0,a0,-122
     d68:	00153413          	seqz	s0,a0
     d6c:	8164a623          	sw	s6,-2036(s1)
     d70:	f41ff06f          	j	cb0 <serialboot+0x90>
     d74:	01340a63          	beq	s0,s3,d88 <serialboot+0x168>
     d78:	01641e63          	bne	s0,s6,d94 <serialboot+0x174>
     d7c:	430030ef          	jal	ra,41ac <uart_read>
     d80:	00a10723          	sb	a0,14(sp)
     d84:	fc1ff06f          	j	d44 <serialboot+0x124>
     d88:	424030ef          	jal	ra,41ac <uart_read>
     d8c:	00a106a3          	sb	a0,13(sp)
     d90:	fb5ff06f          	j	d44 <serialboot+0x124>
     d94:	07740e63          	beq	s0,s7,e10 <serialboot+0x1f0>
     d98:	fa8bd6e3          	bge	s7,s0,d44 <serialboot+0x124>
     d9c:	410030ef          	jal	ra,41ac <uart_read>
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
     df0:	42c030ef          	jal	ra,421c <uart_write>
     df4:	00148493          	addi	s1,s1,1
     df8:	10000793          	li	a5,256
     dfc:	f0f49ae3          	bne	s1,a5,d10 <serialboot+0xf0>
     e00:	00007537          	lui	a0,0x7
     e04:	a4450513          	addi	a0,a0,-1468 # 6a44 <_etext+0x11c>
     e08:	6d0010ef          	jal	ra,24d8 <printf>
     e0c:	0280006f          	j	e34 <serialboot+0x214>
     e10:	39c030ef          	jal	ra,41ac <uart_read>
     e14:	00a107a3          	sb	a0,15(sp)
     e18:	f2dff06f          	j	d44 <serialboot+0x124>
     e1c:	00f14783          	lbu	a5,15(sp)
     e20:	05578263          	beq	a5,s5,e64 <serialboot+0x244>
     e24:	09678463          	beq	a5,s6,eac <serialboot+0x28c>
     e28:	0c079263          	bnez	a5,eec <serialboot+0x2cc>
     e2c:	04b00513          	li	a0,75
     e30:	3ec030ef          	jal	ra,421c <uart_write>
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
     e80:	ffc60613          	addi	a2,a2,-4 # 7ffc <crc_table+0x538>
     e84:	01410593          	addi	a1,sp,20
     e88:	00a7e7b3          	or	a5,a5,a0
     e8c:	01214503          	lbu	a0,18(sp)
     e90:	00000493          	li	s1,0
     e94:	00851513          	slli	a0,a0,0x8
     e98:	00a7e533          	or	a0,a5,a0
     e9c:	38c010ef          	jal	ra,2228 <memcpy>
     ea0:	04b00513          	li	a0,75
     ea4:	378030ef          	jal	ra,421c <uart_write>
     ea8:	e69ff06f          	j	d10 <serialboot+0xf0>
     eac:	04b00513          	li	a0,75
     eb0:	36c030ef          	jal	ra,421c <uart_write>
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
     ef4:	328030ef          	jal	ra,421c <uart_write>
     ef8:	f01ff06f          	j	df8 <serialboot+0x1d8>
     efc:	00007537          	lui	a0,0x7
     f00:	a7850513          	addi	a0,a0,-1416 # 6a78 <_etext+0x150>
     f04:	5d4010ef          	jal	ra,24d8 <printf>
     f08:	00000513          	li	a0,0
     f0c:	f2dff06f          	j	e38 <serialboot+0x218>

00000f10 <sdcardboot>:
     f10:	00007537          	lui	a0,0x7
     f14:	ff010113          	addi	sp,sp,-16
     f18:	a8450513          	addi	a0,a0,-1404 # 6a84 <_etext+0x15c>
     f1c:	00112623          	sw	ra,12(sp)
     f20:	5b8010ef          	jal	ra,24d8 <printf>
     f24:	1f1050ef          	jal	ra,6914 <fatfs_set_ops_spisdcard>
     f28:	00007537          	lui	a0,0x7
     f2c:	aa850513          	addi	a0,a0,-1368 # 6aa8 <_etext+0x180>
     f30:	5a8010ef          	jal	ra,24d8 <printf>
     f34:	939ff0ef          	jal	ra,86c <sdcardboot_from_json.constprop.0>
     f38:	00007537          	lui	a0,0x7
     f3c:	ac450513          	addi	a0,a0,-1340 # 6ac4 <_etext+0x19c>
     f40:	598010ef          	jal	ra,24d8 <printf>
     f44:	00007537          	lui	a0,0x7
     f48:	400005b7          	lui	a1,0x40000
     f4c:	ae050513          	addi	a0,a0,-1312 # 6ae0 <_etext+0x1b8>
     f50:	a58ff0ef          	jal	ra,1a8 <copy_file_from_sdcard_to_ram>
     f54:	00050c63          	beqz	a0,f6c <sdcardboot+0x5c>
     f58:	400006b7          	lui	a3,0x40000
     f5c:	00000613          	li	a2,0
     f60:	00000593          	li	a1,0
     f64:	00000513          	li	a0,0
     f68:	881ff0ef          	jal	ra,7e8 <boot>
     f6c:	00c12083          	lw	ra,12(sp)
     f70:	00007537          	lui	a0,0x7
     f74:	aec50513          	addi	a0,a0,-1300 # 6aec <_etext+0x1c4>
     f78:	01010113          	addi	sp,sp,16
     f7c:	55c0106f          	j	24d8 <printf>

00000f80 <dump_bytes>:
     f80:	fc010113          	addi	sp,sp,-64
     f84:	000087b7          	lui	a5,0x8
     f88:	02912a23          	sw	s1,52(sp)
     f8c:	00058493          	mv	s1,a1
     f90:	6b07a583          	lw	a1,1712(a5) # 86b0 <stdout>
     f94:	03212823          	sw	s2,48(sp)
     f98:	00050913          	mv	s2,a0
     f9c:	00007537          	lui	a0,0x7
     fa0:	b2450513          	addi	a0,a0,-1244 # 6b24 <str.2797+0x10>
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
    1014:	16050513          	addi	a0,a0,352 # 8160 <crc_table+0x69c>
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
    1060:	b3450513          	addi	a0,a0,-1228 # 6b34 <str.2797+0x20>
    1064:	00f90933          	add	s2,s2,a5
    1068:	00000c13          	li	s8,0
    106c:	46c010ef          	jal	ra,24d8 <printf>
    1070:	00007cb7          	lui	s9,0x7
    1074:	018107b3          	add	a5,sp,s8
    1078:	0007c583          	lbu	a1,0(a5)
    107c:	b40c8513          	addi	a0,s9,-1216 # 6b40 <str.2797+0x2c>
    1080:	001c0c13          	addi	s8,s8,1
    1084:	454010ef          	jal	ra,24d8 <printf>
    1088:	ff8416e3          	bne	s0,s8,1074 <dump_bytes+0xf4>
    108c:	00040c13          	mv	s8,s0
    1090:	01000c93          	li	s9,16
    1094:	059c1863          	bne	s8,s9,10e4 <dump_bytes+0x164>
    1098:	540a0513          	addi	a0,s4,1344 # 7540 <str.2797+0xa2c>
    109c:	43c010ef          	jal	ra,24d8 <printf>
    10a0:	00000c13          	li	s8,0
    10a4:	05e00c93          	li	s9,94
    10a8:	018107b3          	add	a5,sp,s8
    10ac:	0007c583          	lbu	a1,0(a5)
    10b0:	fe058793          	addi	a5,a1,-32 # 3fffffe0 <_fstack+0x2fffefe0>
    10b4:	0ff7f793          	andi	a5,a5,255
    10b8:	02fcfe63          	bgeu	s9,a5,10f4 <dump_bytes+0x174>
    10bc:	b4cb8513          	addi	a0,s7,-1204 # 6b4c <str.2797+0x38>
    10c0:	418010ef          	jal	ra,24d8 <printf>
    10c4:	001c0c13          	addi	s8,s8,1
    10c8:	ff8410e3          	bne	s0,s8,10a8 <dump_bytes+0x128>
    10cc:	00040c13          	mv	s8,s0
    10d0:	01000c93          	li	s9,16
    10d4:	039c1663          	bne	s8,s9,1100 <dump_bytes+0x180>
    10d8:	408484b3          	sub	s1,s1,s0
    10dc:	008989b3          	add	s3,s3,s0
    10e0:	f01ff06f          	j	fe0 <dump_bytes+0x60>
    10e4:	b48a8513          	addi	a0,s5,-1208 # 6b48 <str.2797+0x34>
    10e8:	3f0010ef          	jal	ra,24d8 <printf>
    10ec:	001c0c13          	addi	s8,s8,1
    10f0:	fa5ff06f          	j	1094 <dump_bytes+0x114>
    10f4:	b50b0513          	addi	a0,s6,-1200 # 6b50 <str.2797+0x3c>
    10f8:	3e0010ef          	jal	ra,24d8 <printf>
    10fc:	fc9ff06f          	j	10c4 <dump_bytes+0x144>
    1100:	540a0513          	addi	a0,s4,1344
    1104:	3d4010ef          	jal	ra,24d8 <printf>
    1108:	001c0c13          	addi	s8,s8,1
    110c:	fc9ff06f          	j	10d4 <dump_bytes+0x154>

00001110 <crcbios>:
    1110:	ff010113          	addi	sp,sp,-16
    1114:	000095b7          	lui	a1,0x9
    1118:	00812423          	sw	s0,8(sp)
    111c:	00000793          	li	a5,0
    1120:	86c5a403          	lw	s0,-1940(a1) # 886c <_edata_rom>
    1124:	86c58593          	addi	a1,a1,-1940
    1128:	40f585b3          	sub	a1,a1,a5
    112c:	00000513          	li	a0,0
    1130:	00112623          	sw	ra,12(sp)
    1134:	340020ef          	jal	ra,3474 <crc32>
    1138:	02a41063          	bne	s0,a0,1158 <crcbios+0x48>
    113c:	00040593          	mv	a1,s0
    1140:	00812403          	lw	s0,8(sp)
    1144:	00c12083          	lw	ra,12(sp)
    1148:	00007537          	lui	a0,0x7
    114c:	b5450513          	addi	a0,a0,-1196 # 6b54 <str.2797+0x40>
    1150:	01010113          	addi	sp,sp,16
    1154:	3840106f          	j	24d8 <printf>
    1158:	00050613          	mv	a2,a0
    115c:	00007537          	lui	a0,0x7
    1160:	00040593          	mv	a1,s0
    1164:	b7050513          	addi	a0,a0,-1168 # 6b70 <str.2797+0x5c>
    1168:	370010ef          	jal	ra,24d8 <printf>
    116c:	00812403          	lw	s0,8(sp)
    1170:	00c12083          	lw	ra,12(sp)
    1174:	00007537          	lui	a0,0x7
    1178:	b9c50513          	addi	a0,a0,-1124 # 6b9c <str.2797+0x88>
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
    1248:	6b440413          	addi	s0,s0,1716 # 86b4 <__bios_cmd_leds>
    124c:	70448493          	addi	s1,s1,1796 # 8704 <_fdata_rom>
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
    12c8:	70440413          	addi	s0,s0,1796 # 8704 <_fdata_rom>
    12cc:	70448493          	addi	s1,s1,1796 # 8704 <_fdata_rom>
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
    1310:	bd450513          	addi	a0,a0,-1068 # 6bd4 <str.2797+0xc0>
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
    1340:	70490913          	addi	s2,s2,1796 # 8704 <_fdata_rom>
    1344:	00007ab7          	lui	s5,0x7
    1348:	bd098993          	addi	s3,s3,-1072 # 6bd0 <str.2797+0xbc>
    134c:	00008b37          	lui	s6,0x8
    1350:	00000713          	li	a4,0
    1354:	6b4a0413          	addi	s0,s4,1716 # 86b4 <__bios_cmd_leds>
    1358:	0300006f          	j	1388 <help_handler+0x88>
    135c:	00042783          	lw	a5,0(s0)
    1360:	00c7a683          	lw	a3,12(a5)
    1364:	02969063          	bne	a3,s1,1384 <help_handler+0x84>
    1368:	0087a603          	lw	a2,8(a5)
    136c:	0047a583          	lw	a1,4(a5)
    1370:	00061463          	bnez	a2,1378 <help_handler+0x78>
    1374:	00098613          	mv	a2,s3
    1378:	bf8a8513          	addi	a0,s5,-1032 # 6bf8 <str.2797+0xe4>
    137c:	15c010ef          	jal	ra,24d8 <printf>
    1380:	00100713          	li	a4,1
    1384:	00440413          	addi	s0,s0,4
    1388:	fd241ae3          	bne	s0,s2,135c <help_handler+0x5c>
    138c:	00070663          	beqz	a4,1398 <help_handler+0x98>
    1390:	160b0513          	addi	a0,s6,352 # 8160 <crc_table+0x69c>
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
    1408:	bd058593          	addi	a1,a1,-1072 # 6bd0 <str.2797+0xbc>
    140c:	00007537          	lui	a0,0x7
    1410:	c0450513          	addi	a0,a0,-1020 # 6c04 <str.2797+0xf0>
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
    1438:	c1050513          	addi	a0,a0,-1008 # 6c10 <str.2797+0xfc>
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
    1478:	c2050513          	addi	a0,a0,-992 # 6c20 <str.2797+0x10c>
    147c:	fc1ff06f          	j	143c <leds_handler+0x18>
    1480:	00050593          	mv	a1,a0
    1484:	00007537          	lui	a0,0x7
    1488:	c3050513          	addi	a0,a0,-976 # 6c30 <str.2797+0x11c>
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
    14b8:	c4850513          	addi	a0,a0,-952 # 6c48 <str.2797+0x134>
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
    14fc:	c6050513          	addi	a0,a0,-928 # 6c60 <str.2797+0x14c>
    1500:	fbdff06f          	j	14bc <crc_handler+0x20>
    1504:	00442503          	lw	a0,4(s0)
    1508:	00000613          	li	a2,0
    150c:	01c10593          	addi	a1,sp,28
    1510:	08c010ef          	jal	ra,259c <strtoul>
    1514:	01c12783          	lw	a5,28(sp)
    1518:	0007c783          	lbu	a5,0(a5)
    151c:	00078863          	beqz	a5,152c <crc_handler+0x90>
    1520:	00007537          	lui	a0,0x7
    1524:	c7450513          	addi	a0,a0,-908 # 6c74 <str.2797+0x160>
    1528:	f95ff06f          	j	14bc <crc_handler+0x20>
    152c:	00a12623          	sw	a0,12(sp)
    1530:	dc9ff0ef          	jal	ra,12f8 <flush_cpu_dcache>
    1534:	0c0020ef          	jal	ra,35f4 <flush_l2_cache>
    1538:	00c12583          	lw	a1,12(sp)
    153c:	00048513          	mv	a0,s1
    1540:	735010ef          	jal	ra,3474 <crc32>
    1544:	00050593          	mv	a1,a0
    1548:	00007537          	lui	a0,0x7
    154c:	c8850513          	addi	a0,a0,-888 # 6c88 <str.2797+0x174>
    1550:	789000ef          	jal	ra,24d8 <printf>
    1554:	f6dff06f          	j	14c0 <crc_handler+0x24>

00001558 <mem_list_handler>:
    1558:	00007537          	lui	a0,0x7
    155c:	ff010113          	addi	sp,sp,-16
    1560:	d6850513          	addi	a0,a0,-664 # 6d68 <str.2797+0x254>
    1564:	00112623          	sw	ra,12(sp)
    1568:	771000ef          	jal	ra,24d8 <printf>
    156c:	00c12083          	lw	ra,12(sp)
    1570:	00007537          	lui	a0,0x7
    1574:	d8450513          	addi	a0,a0,-636 # 6d84 <str.2797+0x270>
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
    15a8:	e5850513          	addi	a0,a0,-424 # 6e58 <str.2797+0x344>
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
    15fc:	c6050513          	addi	a0,a0,-928 # 6c60 <str.2797+0x14c>
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
    1628:	c2050513          	addi	a0,a0,-992 # 6c20 <str.2797+0x10c>
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
    165c:	e8450513          	addi	a0,a0,-380 # 6e84 <str.2797+0x370>
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
    16dc:	e9450513          	addi	a0,a0,-364 # 6e94 <str.2797+0x380>
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
    1708:	ea450513          	addi	a0,a0,-348 # 6ea4 <str.2797+0x390>
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
    1758:	ec450513          	addi	a0,a0,-316 # 6ec4 <str.2797+0x3b0>
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
    1784:	ee450513          	addi	a0,a0,-284 # 6ee4 <str.2797+0x3d0>
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
    17bc:	e8450513          	addi	a0,a0,-380 # 6e84 <str.2797+0x370>
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
    1810:	f0050513          	addi	a0,a0,-256 # 6f00 <str.2797+0x3ec>
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
    1860:	f2050513          	addi	a0,a0,-224 # 6f20 <str.2797+0x40c>
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
    188c:	f3050513          	addi	a0,a0,-208 # 6f30 <str.2797+0x41c>
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
    18b8:	e8450513          	addi	a0,a0,-380 # 6e84 <str.2797+0x370>
    18bc:	f59ff06f          	j	1814 <mem_cmp_handler+0x2c>
    18c0:	00042603          	lw	a2,0(s0)
    18c4:	0004a703          	lw	a4,0(s1)
    18c8:	00e60c63          	beq	a2,a4,18e0 <mem_cmp_handler+0xf8>
    18cc:	00048693          	mv	a3,s1
    18d0:	00040593          	mv	a1,s0
    18d4:	f40a0513          	addi	a0,s4,-192
    18d8:	401000ef          	jal	ra,24d8 <printf>
    18dc:	00000793          	li	a5,0
    18e0:	00198993          	addi	s3,s3,1
    18e4:	00440413          	addi	s0,s0,4
    18e8:	00448493          	addi	s1,s1,4
    18ec:	fd299ae3          	bne	s3,s2,18c0 <mem_cmp_handler+0xd8>
    18f0:	02078063          	beqz	a5,1910 <mem_cmp_handler+0x128>
    18f4:	00007537          	lui	a0,0x7
    18f8:	f9c50513          	addi	a0,a0,-100 # 6f9c <str.2797+0x488>
    18fc:	f19ff06f          	j	1814 <mem_cmp_handler+0x2c>
    1900:	00100793          	li	a5,1
    1904:	00000993          	li	s3,0
    1908:	00007a37          	lui	s4,0x7
    190c:	fe1ff06f          	j	18ec <mem_cmp_handler+0x104>
    1910:	00007537          	lui	a0,0x7
    1914:	fbc50513          	addi	a0,a0,-68 # 6fbc <str.2797+0x4a8>
    1918:	efdff06f          	j	1814 <mem_cmp_handler+0x2c>

0000191c <mem_read_handler>:
    191c:	fe010113          	addi	sp,sp,-32
    1920:	00112e23          	sw	ra,28(sp)
    1924:	00812c23          	sw	s0,24(sp)
    1928:	00912a23          	sw	s1,20(sp)
    192c:	01212823          	sw	s2,16(sp)
    1930:	02a04463          	bgtz	a0,1958 <mem_read_handler+0x3c>
    1934:	00007537          	lui	a0,0x7
    1938:	fe450513          	addi	a0,a0,-28 # 6fe4 <str.2797+0x4d0>
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
    1984:	c6050513          	addi	a0,a0,-928 # 6c60 <str.2797+0x14c>
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
    19b8:	00050513          	mv	a0,a0
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
    19f0:	01450513          	addi	a0,a0,20 # 7014 <str.2797+0x500>
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
    1a3c:	c6050513          	addi	a0,a0,-928 # 6c60 <str.2797+0x14c>
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
    1a70:	e9450513          	addi	a0,a0,-364 # 6e94 <str.2797+0x380>
    1a74:	f81ff06f          	j	19f4 <mem_test_handler+0x20>
    1a78:	fff00593          	li	a1,-1
    1a7c:	00090513          	mv	a0,s2
    1a80:	510020ef          	jal	ra,3f90 <memtest>
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
    1ab0:	03050513          	addi	a0,a0,48 # 7030 <str.2797+0x51c>
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
    1b04:	c6050513          	addi	a0,a0,-928 # 6c60 <str.2797+0x14c>
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
    1b30:	e9450513          	addi	a0,a0,-364 # 6e94 <str.2797+0x380>
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
    1b68:	06050513          	addi	a0,a0,96 # 7060 <str.2797+0x54c>
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
    1b9c:	07c50513          	addi	a0,a0,124 # 707c <str.2797+0x568>
    1ba0:	f15ff06f          	j	1ab4 <mem_speed_handler+0x2c>
    1ba4:	00000693          	li	a3,0
    1ba8:	00090613          	mv	a2,s2
    1bac:	000a0593          	mv	a1,s4
    1bb0:	00098513          	mv	a0,s3
    1bb4:	194020ef          	jal	ra,3d48 <memspeed>
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
    1bec:	18050513          	addi	a0,a0,384 # 7180 <str.2797+0x66c>
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
    1c3c:	c6050513          	addi	a0,a0,-928 # 6c60 <str.2797+0x14c>
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
    1c70:	1a050513          	addi	a0,a0,416 # 71a0 <str.2797+0x68c>
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
    1ca4:	1b050513          	addi	a0,a0,432 # 71b0 <str.2797+0x69c>
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
    1cdc:	1c050513          	addi	a0,a0,448 # 71c0 <str.2797+0x6ac>
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
    1d04:	28c0206f          	j	3f90 <memtest>

00001d08 <sdram_mr_write_handler>:
    1d08:	fd010113          	addi	sp,sp,-48
    1d0c:	02112623          	sw	ra,44(sp)
    1d10:	02812423          	sw	s0,40(sp)
    1d14:	02912223          	sw	s1,36(sp)
    1d18:	00100793          	li	a5,1
    1d1c:	02a7c263          	blt	a5,a0,1d40 <sdram_mr_write_handler+0x38>
    1d20:	00007537          	lui	a0,0x7
    1d24:	24050513          	addi	a0,a0,576 # 7240 <str.2797+0x72c>
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
    1d68:	26050513          	addi	a0,a0,608 # 7260 <str.2797+0x74c>
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
    1d94:	c2050513          	addi	a0,a0,-992 # 6c20 <str.2797+0x10c>
    1d98:	f91ff06f          	j	1d28 <sdram_mr_write_handler+0x20>
    1d9c:	38c040ef          	jal	ra,6128 <sdram_software_control_on>
    1da0:	01041593          	slli	a1,s0,0x10
    1da4:	00007537          	lui	a0,0x7
    1da8:	0105d593          	srli	a1,a1,0x10
    1dac:	0ff4f613          	andi	a2,s1,255
    1db0:	27050513          	addi	a0,a0,624 # 7270 <str.2797+0x75c>
    1db4:	00b12623          	sw	a1,12(sp)
    1db8:	720000ef          	jal	ra,24d8 <printf>
    1dbc:	00c12583          	lw	a1,12(sp)
    1dc0:	0ff4f513          	andi	a0,s1,255
    1dc4:	3ac040ef          	jal	ra,6170 <sdram_mode_register_write>
    1dc8:	384040ef          	jal	ra,614c <sdram_software_control_off>
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
    1df8:	4b4020ef          	jal	ra,42ac <uart_init>
    1dfc:	16040513          	addi	a0,s0,352 # 8160 <crc_table+0x69c>
    1e00:	6d8000ef          	jal	ra,24d8 <printf>
    1e04:	00007537          	lui	a0,0x7
    1e08:	30050513          	addi	a0,a0,768 # 7300 <str.2797+0x7ec>
    1e0c:	6cc000ef          	jal	ra,24d8 <printf>
    1e10:	00007537          	lui	a0,0x7
    1e14:	32850513          	addi	a0,a0,808 # 7328 <str.2797+0x814>
    1e18:	6c0000ef          	jal	ra,24d8 <printf>
    1e1c:	00007537          	lui	a0,0x7
    1e20:	35050513          	addi	a0,a0,848 # 7350 <str.2797+0x83c>
    1e24:	6b4000ef          	jal	ra,24d8 <printf>
    1e28:	00007537          	lui	a0,0x7
    1e2c:	37450513          	addi	a0,a0,884 # 7374 <str.2797+0x860>
    1e30:	6a8000ef          	jal	ra,24d8 <printf>
    1e34:	00007537          	lui	a0,0x7
    1e38:	39850513          	addi	a0,a0,920 # 7398 <str.2797+0x884>
    1e3c:	69c000ef          	jal	ra,24d8 <printf>
    1e40:	16040513          	addi	a0,s0,352
    1e44:	694000ef          	jal	ra,24d8 <printf>
    1e48:	00007537          	lui	a0,0x7
    1e4c:	3c450513          	addi	a0,a0,964 # 73c4 <str.2797+0x8b0>
    1e50:	688000ef          	jal	ra,24d8 <printf>
    1e54:	00007537          	lui	a0,0x7
    1e58:	3ec50513          	addi	a0,a0,1004 # 73ec <str.2797+0x8d8>
    1e5c:	67c000ef          	jal	ra,24d8 <printf>
    1e60:	16040513          	addi	a0,s0,352
    1e64:	674000ef          	jal	ra,24d8 <printf>
    1e68:	aa8ff0ef          	jal	ra,1110 <crcbios>
    1e6c:	16040513          	addi	a0,s0,352
    1e70:	668000ef          	jal	ra,24d8 <printf>
    1e74:	00007537          	lui	a0,0x7
    1e78:	41050513          	addi	a0,a0,1040 # 7410 <str.2797+0x8fc>
    1e7c:	65c000ef          	jal	ra,24d8 <printf>
    1e80:	16040513          	addi	a0,s0,352
    1e84:	654000ef          	jal	ra,24d8 <printf>
    1e88:	00007537          	lui	a0,0x7
    1e8c:	42c50513          	addi	a0,a0,1068 # 742c <str.2797+0x918>
    1e90:	648000ef          	jal	ra,24d8 <printf>
    1e94:	000075b7          	lui	a1,0x7
    1e98:	00007537          	lui	a0,0x7
    1e9c:	03200613          	li	a2,50
    1ea0:	46058593          	addi	a1,a1,1120 # 7460 <str.2797+0x94c>
    1ea4:	47450513          	addi	a0,a0,1140 # 7474 <str.2797+0x960>
    1ea8:	630000ef          	jal	ra,24d8 <printf>
    1eac:	000075b7          	lui	a1,0x7
    1eb0:	00007537          	lui	a0,0x7
    1eb4:	00400693          	li	a3,4
    1eb8:	02000613          	li	a2,32
    1ebc:	49058593          	addi	a1,a1,1168 # 7490 <str.2797+0x97c>
    1ec0:	49c50513          	addi	a0,a0,1180 # 749c <str.2797+0x988>
    1ec4:	614000ef          	jal	ra,24d8 <printf>
    1ec8:	00007537          	lui	a0,0x7
    1ecc:	02000593          	li	a1,32
    1ed0:	4c050513          	addi	a0,a0,1216 # 74c0 <str.2797+0x9ac>
    1ed4:	604000ef          	jal	ra,24d8 <printf>
    1ed8:	00007537          	lui	a0,0x7
    1edc:	4dc50513          	addi	a0,a0,1244 # 74dc <str.2797+0x9c8>
    1ee0:	5f8000ef          	jal	ra,24d8 <printf>
    1ee4:	00007537          	lui	a0,0x7
    1ee8:	4ec50513          	addi	a0,a0,1260 # 74ec <str.2797+0x9d8>
    1eec:	5ec000ef          	jal	ra,24d8 <printf>
    1ef0:	00000593          	li	a1,0
    1ef4:	00010537          	lui	a0,0x10
    1ef8:	3f0040ef          	jal	ra,62e8 <print_size>
    1efc:	16040513          	addi	a0,s0,352
    1f00:	5d8000ef          	jal	ra,24d8 <printf>
    1f04:	00007537          	lui	a0,0x7
    1f08:	4fc50513          	addi	a0,a0,1276 # 74fc <str.2797+0x9e8>
    1f0c:	5cc000ef          	jal	ra,24d8 <printf>
    1f10:	00000593          	li	a1,0
    1f14:	00001537          	lui	a0,0x1
    1f18:	3d0040ef          	jal	ra,62e8 <print_size>
    1f1c:	16040513          	addi	a0,s0,352
    1f20:	5b8000ef          	jal	ra,24d8 <printf>
    1f24:	00007537          	lui	a0,0x7
    1f28:	50c50513          	addi	a0,a0,1292 # 750c <str.2797+0x9f8>
    1f2c:	5ac000ef          	jal	ra,24d8 <printf>
    1f30:	00000593          	li	a1,0
    1f34:	10000513          	li	a0,256
    1f38:	3b0040ef          	jal	ra,62e8 <print_size>
    1f3c:	16040513          	addi	a0,s0,352
    1f40:	598000ef          	jal	ra,24d8 <printf>
    1f44:	570040ef          	jal	ra,64b4 <sdram_get_supported_memory>
    1f48:	00050493          	mv	s1,a0
    1f4c:	00007537          	lui	a0,0x7
    1f50:	51c50513          	addi	a0,a0,1308 # 751c <str.2797+0xa08>
    1f54:	00b12623          	sw	a1,12(sp)
    1f58:	580000ef          	jal	ra,24d8 <printf>
    1f5c:	00c12583          	lw	a1,12(sp)
    1f60:	00048513          	mv	a0,s1
    1f64:	384040ef          	jal	ra,62e8 <print_size>
    1f68:	19c040ef          	jal	ra,6104 <sdram_get_databits>
    1f6c:	00a12623          	sw	a0,12(sp)
    1f70:	19c040ef          	jal	ra,610c <sdram_get_freq>
    1f74:	000f47b7          	lui	a5,0xf4
    1f78:	24078793          	addi	a5,a5,576 # f4240 <_edata_rom+0xeb9d4>
    1f7c:	02f54633          	div	a2,a0,a5
    1f80:	00c12583          	lw	a1,12(sp)
    1f84:	00007537          	lui	a0,0x7
    1f88:	53050513          	addi	a0,a0,1328 # 7530 <str.2797+0xa1c>
    1f8c:	54c000ef          	jal	ra,24d8 <printf>
    1f90:	188040ef          	jal	ra,6118 <sdram_get_cl>
    1f94:	00050593          	mv	a1,a0
    1f98:	00007537          	lui	a0,0x7
    1f9c:	54450513          	addi	a0,a0,1348 # 7544 <str.2797+0xa30>
    1fa0:	538000ef          	jal	ra,24d8 <printf>
    1fa4:	17c040ef          	jal	ra,6120 <sdram_get_cwl>
    1fa8:	fff00793          	li	a5,-1
    1fac:	00f50c63          	beq	a0,a5,1fc4 <main+0x1f4>
    1fb0:	170040ef          	jal	ra,6120 <sdram_get_cwl>
    1fb4:	00050593          	mv	a1,a0
    1fb8:	00007537          	lui	a0,0x7
    1fbc:	54c50513          	addi	a0,a0,1356 # 754c <str.2797+0xa38>
    1fc0:	518000ef          	jal	ra,24d8 <printf>
    1fc4:	00007537          	lui	a0,0x7
    1fc8:	55450513          	addi	a0,a0,1364 # 7554 <str.2797+0xa40>
    1fcc:	50c000ef          	jal	ra,24d8 <printf>
    1fd0:	00007537          	lui	a0,0x7
    1fd4:	55850513          	addi	a0,a0,1368 # 7558 <str.2797+0xa44>
    1fd8:	500000ef          	jal	ra,24d8 <printf>
    1fdc:	00000593          	li	a1,0
    1fe0:	02000537          	lui	a0,0x2000
    1fe4:	304040ef          	jal	ra,62e8 <print_size>
    1fe8:	16040513          	addi	a0,s0,352
    1fec:	4ec000ef          	jal	ra,24d8 <printf>
    1ff0:	16040513          	addi	a0,s0,352
    1ff4:	4e4000ef          	jal	ra,24d8 <printf>
    1ff8:	00007537          	lui	a0,0x7
    1ffc:	56c50513          	addi	a0,a0,1388 # 756c <str.2797+0xa58>
    2000:	4d8000ef          	jal	ra,24d8 <printf>
    2004:	16040513          	addi	a0,s0,352
    2008:	4d0000ef          	jal	ra,24d8 <printf>
    200c:	1a4040ef          	jal	ra,61b0 <sdram_init>
    2010:	00100793          	li	a5,1
    2014:	00050493          	mv	s1,a0
    2018:	00f50863          	beq	a0,a5,2028 <main+0x258>
    201c:	00007537          	lui	a0,0x7
    2020:	5a050513          	addi	a0,a0,1440 # 75a0 <str.2797+0xa8c>
    2024:	4b4000ef          	jal	ra,24d8 <printf>
    2028:	16040513          	addi	a0,s0,352
    202c:	4ac000ef          	jal	ra,24d8 <printf>
    2030:	a80ff0ef          	jal	ra,12b0 <init_dispatcher>
    2034:	02048863          	beqz	s1,2064 <main+0x294>
    2038:	00007537          	lui	a0,0x7
    203c:	5c050513          	addi	a0,a0,1472 # 75c0 <str.2797+0xaac>
    2040:	498000ef          	jal	ra,24d8 <printf>
    2044:	bddfe0ef          	jal	ra,c20 <serialboot>
    2048:	00050a63          	beqz	a0,205c <main+0x28c>
    204c:	ec5fe0ef          	jal	ra,f10 <sdcardboot>
    2050:	00007537          	lui	a0,0x7
    2054:	5f450513          	addi	a0,a0,1524 # 75f4 <str.2797+0xae0>
    2058:	480000ef          	jal	ra,24d8 <printf>
    205c:	16040513          	addi	a0,s0,352
    2060:	478000ef          	jal	ra,24d8 <printf>
    2064:	00007537          	lui	a0,0x7
    2068:	60c50513          	addi	a0,a0,1548 # 760c <str.2797+0xaf8>
    206c:	46c000ef          	jal	ra,24d8 <printf>
    2070:	00007937          	lui	s2,0x7
    2074:	000074b7          	lui	s1,0x7
    2078:	64090593          	addi	a1,s2,1600 # 7640 <str.2797+0xb2c>
    207c:	65448513          	addi	a0,s1,1620 # 7654 <str.2797+0xb40>
    2080:	458000ef          	jal	ra,24d8 <printf>
    2084:	000079b7          	lui	s3,0x7
    2088:	04000593          	li	a1,64
    208c:	04010513          	addi	a0,sp,64
    2090:	05c000ef          	jal	ra,20ec <readline>
    2094:	04014783          	lbu	a5,64(sp)
    2098:	02078c63          	beqz	a5,20d0 <main+0x300>
    209c:	16040513          	addi	a0,s0,352
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
    20c8:	65898513          	addi	a0,s3,1624 # 7658 <str.2797+0xb44>
    20cc:	40c000ef          	jal	ra,24d8 <printf>
    20d0:	64090593          	addi	a1,s2,1600
    20d4:	65448513          	addi	a0,s1,1620
    20d8:	400000ef          	jal	ra,24d8 <printf>
    20dc:	fadff06f          	j	2088 <main+0x2b8>

000020e0 <set_idle_hook>:
    20e0:	100007b7          	lui	a5,0x10000
    20e4:	16a7a623          	sw	a0,364(a5) # 1000016c <idle_hook_ptr>
    20e8:	00008067          	ret

000020ec <readline>:
    20ec:	000087b7          	lui	a5,0x8
    20f0:	6a87a783          	lw	a5,1704(a5) # 86a8 <stdin>
    20f4:	fc010113          	addi	sp,sp,-64
    20f8:	02812c23          	sw	s0,56(sp)
    20fc:	00f12623          	sw	a5,12(sp)
    2100:	000087b7          	lui	a5,0x8
    2104:	6b07a783          	lw	a5,1712(a5) # 86b0 <stdout>
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
    2184:	66ca0513          	addi	a0,s4,1644 # 766c <str.2797+0xb58>
    2188:	fff40413          	addi	s0,s0,-1
    218c:	2dc000ef          	jal	ra,2468 <fputs>
    2190:	fb1ff06f          	j	2140 <readline+0x54>
    2194:	16c9a783          	lw	a5,364(s3)
    2198:	000780e7          	jalr	a5
    219c:	064020ef          	jal	ra,4200 <uart_read_nonblock>
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
    21cc:	16050513          	addi	a0,a0,352 # 8160 <crc_table+0x69c>
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
    24ec:	6b07a503          	lw	a0,1712(a5) # 86b0 <stdout>
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
    2524:	6b07a583          	lw	a1,1712(a5) # 86b0 <stdout>
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
    282c:	68078793          	addi	a5,a5,1664 # 7680 <str.2797+0xb6c>
    2830:	00007cb7          	lui	s9,0x7
    2834:	00f12023          	sw	a5,0(sp)
    2838:	00007d37          	lui	s10,0x7
    283c:	678c8793          	addi	a5,s9,1656 # 7678 <str.2797+0xb64>
    2840:	00f12223          	sw	a5,4(sp)
    2844:	670d0793          	addi	a5,s10,1648 # 7670 <str.2797+0xb5c>
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
    2eb8:	348010ef          	jal	ra,4200 <uart_read_nonblock>
    2ebc:	fe050ee3          	beqz	a0,2eb8 <litex_getc+0x8>
    2ec0:	2ec010ef          	jal	ra,41ac <uart_read>
    2ec4:	00c12083          	lw	ra,12(sp)
    2ec8:	01010113          	addi	sp,sp,16
    2ecc:	00008067          	ret

00002ed0 <litex_putc>:
    2ed0:	ff010113          	addi	sp,sp,-16
    2ed4:	00812423          	sw	s0,8(sp)
    2ed8:	00112623          	sw	ra,12(sp)
    2edc:	00050413          	mv	s0,a0
    2ee0:	33c010ef          	jal	ra,421c <uart_write>
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
    328c:	f0050513          	addi	a0,a0,-256 # ff00 <_edata_rom+0x7694>
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
    3434:	6c468693          	addi	a3,a3,1732 # 76c4 <crc16_table>
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
    3488:	ac468693          	addi	a3,a3,-1340 # 7ac4 <crc_table>
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
    34b8:	ac460613          	addi	a2,a2,-1340 # 7ac4 <crc_table>
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
    3610:	35070713          	addi	a4,a4,848 # c350 <_edata_rom+0x3ae4>
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
    36f4:	ec450513          	addi	a0,a0,-316 # 7ec4 <crc_table+0x400>
    36f8:	04010113          	addi	sp,sp,64
    36fc:	dddfe06f          	j	24d8 <printf>
    3700:	100007b7          	lui	a5,0x10000
    3704:	1787a683          	lw	a3,376(a5) # 10000178 <progress_max>
    3708:	00050413          	mv	s0,a0
    370c:	02068663          	beqz	a3,3738 <show_progress+0xb0>
    3710:	05f5e7b7          	lui	a5,0x5f5e
    3714:	10078793          	addi	a5,a5,256 # 5f5e100 <_edata_rom+0x5f55894>
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
    3758:	16098513          	addi	a0,s3,352 # 8160 <crc_table+0x69c>
    375c:	d7dfe0ef          	jal	ra,24d8 <printf>
    3760:	ec8a0513          	addi	a0,s4,-312 # 7ec8 <crc_table+0x404>
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
    37bc:	10078793          	addi	a5,a5,256 # 5f5e100 <_edata_rom+0x5f55894>
    37c0:	00f50e63          	beq	a0,a5,37dc <init_progression_bar+0x40>
    37c4:	00007637          	lui	a2,0x7
    37c8:	00008537          	lui	a0,0x8
    37cc:	52c60613          	addi	a2,a2,1324 # 752c <str.2797+0xa18>
    37d0:	02800593          	li	a1,40
    37d4:	ecc50513          	addi	a0,a0,-308 # 7ecc <crc_table+0x408>
    37d8:	d01fe06f          	j	24d8 <printf>
    37dc:	00008067          	ret

000037e0 <print_size>:
    37e0:	3ff00793          	li	a5,1023
    37e4:	00a7ea63          	bltu	a5,a0,37f8 <print_size+0x18>
    37e8:	00050593          	mv	a1,a0
    37ec:	00008537          	lui	a0,0x8
    37f0:	ed450513          	addi	a0,a0,-300 # 7ed4 <crc_table+0x410>
    37f4:	ce5fe06f          	j	24d8 <printf>
    37f8:	001007b7          	lui	a5,0x100
    37fc:	02f57063          	bgeu	a0,a5,381c <print_size+0x3c>
    3800:	3ff57613          	andi	a2,a0,1023
    3804:	06600793          	li	a5,102
    3808:	02f65633          	divu	a2,a2,a5
    380c:	00a55593          	srli	a1,a0,0xa
    3810:	00008537          	lui	a0,0x8
    3814:	edc50513          	addi	a0,a0,-292 # 7edc <crc_table+0x418>
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
    3840:	ee850513          	addi	a0,a0,-280 # 7ee8 <crc_table+0x424>
    3844:	fd5ff06f          	j	3818 <print_size+0x38>
    3848:	01e55513          	srli	a0,a0,0x1e
    384c:	00a51613          	slli	a2,a0,0xa
    3850:	40c585b3          	sub	a1,a1,a2
    3854:	06600613          	li	a2,102
    3858:	02c5d633          	divu	a2,a1,a2
    385c:	00050593          	mv	a1,a0
    3860:	00008537          	lui	a0,0x8
    3864:	ef450513          	addi	a0,a0,-268 # 7ef4 <crc_table+0x430>
    3868:	fb1ff06f          	j	3818 <print_size+0x38>

0000386c <print_progress>:
    386c:	ff010113          	addi	sp,sp,-16
    3870:	00812423          	sw	s0,8(sp)
    3874:	00c586b3          	add	a3,a1,a2
    3878:	00060413          	mv	s0,a2
    387c:	00058613          	mv	a2,a1
    3880:	00050593          	mv	a1,a0
    3884:	00008537          	lui	a0,0x8
    3888:	f0050513          	addi	a0,a0,-256 # 7f00 <crc_table+0x43c>
    388c:	00112623          	sw	ra,12(sp)
    3890:	c49fe0ef          	jal	ra,24d8 <printf>
    3894:	00040513          	mv	a0,s0
    3898:	f49ff0ef          	jal	ra,37e0 <print_size>
    389c:	00812403          	lw	s0,8(sp)
    38a0:	00c12083          	lw	ra,12(sp)
    38a4:	00008537          	lui	a0,0x8
    38a8:	f1050513          	addi	a0,a0,-240 # 7f10 <crc_table+0x44c>
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
    38f8:	f1850513          	addi	a0,a0,-232 # 7f18 <crc_table+0x454>
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
    3924:	00912a23          	sw	s1,20(sp)
    3928:	01212823          	sw	s2,16(sp)
    392c:	00112e23          	sw	ra,28(sp)
    3930:	00812c23          	sw	s0,24(sp)
    3934:	01312623          	sw	s3,12(sp)
    3938:	01412423          	sw	s4,8(sp)
    393c:	01512223          	sw	s5,4(sp)
    3940:	01612023          	sw	s6,0(sp)
    3944:	00050913          	mv	s2,a0
    3948:	0025d493          	srli	s1,a1,0x2
    394c:	00000793          	li	a5,0
    3950:	aaa70713          	addi	a4,a4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    3954:	08979263          	bne	a5,s1,39d8 <memtest_bus+0xbc>
    3958:	0000500f          	0x500f
    395c:	aaaaba37          	lui	s4,0xaaaab
    3960:	c95ff0ef          	jal	ra,35f4 <flush_l2_cache>
    3964:	00000413          	li	s0,0
    3968:	00000993          	li	s3,0
    396c:	aaaa0a13          	addi	s4,s4,-1366 # aaaaaaaa <_fstack+0x9aaa9aaa>
    3970:	19000a93          	li	s5,400
    3974:	00008b37          	lui	s6,0x8
    3978:	06999a63          	bne	s3,s1,39ec <memtest_bus+0xd0>
    397c:	55555737          	lui	a4,0x55555
    3980:	00000793          	li	a5,0
    3984:	55570713          	addi	a4,a4,1365 # 55555555 <_fstack+0x45554555>
    3988:	08979863          	bne	a5,s1,3a18 <memtest_bus+0xfc>
    398c:	0000500f          	0x500f
    3990:	55555a37          	lui	s4,0x55555
    3994:	c61ff0ef          	jal	ra,35f4 <flush_l2_cache>
    3998:	00000993          	li	s3,0
    399c:	555a0a13          	addi	s4,s4,1365 # 55555555 <_fstack+0x45554555>
    39a0:	19000a93          	li	s5,400
    39a4:	00008b37          	lui	s6,0x8
    39a8:	08999263          	bne	s3,s1,3a2c <memtest_bus+0x110>
    39ac:	01c12083          	lw	ra,28(sp)
    39b0:	00040513          	mv	a0,s0
    39b4:	01812403          	lw	s0,24(sp)
    39b8:	01412483          	lw	s1,20(sp)
    39bc:	01012903          	lw	s2,16(sp)
    39c0:	00c12983          	lw	s3,12(sp)
    39c4:	00812a03          	lw	s4,8(sp)
    39c8:	00412a83          	lw	s5,4(sp)
    39cc:	00012b03          	lw	s6,0(sp)
    39d0:	02010113          	addi	sp,sp,32
    39d4:	00008067          	ret
    39d8:	00279693          	slli	a3,a5,0x2
    39dc:	00d906b3          	add	a3,s2,a3
    39e0:	00e6a023          	sw	a4,0(a3)
    39e4:	00178793          	addi	a5,a5,1
    39e8:	f6dff06f          	j	3954 <memtest_bus+0x38>
    39ec:	00299593          	slli	a1,s3,0x2
    39f0:	00b905b3          	add	a1,s2,a1
    39f4:	0005a603          	lw	a2,0(a1)
    39f8:	01460c63          	beq	a2,s4,3a10 <memtest_bus+0xf4>
    39fc:	00140413          	addi	s0,s0,1
    3a00:	008ac863          	blt	s5,s0,3a10 <memtest_bus+0xf4>
    3a04:	000a0693          	mv	a3,s4
    3a08:	f48b0513          	addi	a0,s6,-184 # 7f48 <crc_table+0x484>
    3a0c:	acdfe0ef          	jal	ra,24d8 <printf>
    3a10:	00198993          	addi	s3,s3,1
    3a14:	f65ff06f          	j	3978 <memtest_bus+0x5c>
    3a18:	00279693          	slli	a3,a5,0x2
    3a1c:	00d906b3          	add	a3,s2,a3
    3a20:	00e6a023          	sw	a4,0(a3)
    3a24:	00178793          	addi	a5,a5,1
    3a28:	f61ff06f          	j	3988 <memtest_bus+0x6c>
    3a2c:	00299593          	slli	a1,s3,0x2
    3a30:	00b905b3          	add	a1,s2,a1
    3a34:	0005a603          	lw	a2,0(a1)
    3a38:	01460c63          	beq	a2,s4,3a50 <memtest_bus+0x134>
    3a3c:	00140413          	addi	s0,s0,1
    3a40:	008ac863          	blt	s5,s0,3a50 <memtest_bus+0x134>
    3a44:	000a0693          	mv	a3,s4
    3a48:	f74b0513          	addi	a0,s6,-140
    3a4c:	a8dfe0ef          	jal	ra,24d8 <printf>
    3a50:	00198993          	addi	s3,s3,1
    3a54:	f55ff06f          	j	39a8 <memtest_bus+0x8c>

00003a58 <memtest_addr>:
    3a58:	000107b7          	lui	a5,0x10
    3a5c:	0ef5ec63          	bltu	a1,a5,3b54 <memtest_addr+0xfc>
    3a60:	ff010113          	addi	sp,sp,-16
    3a64:	0000d6b7          	lui	a3,0xd
    3a68:	00812423          	sw	s0,8(sp)
    3a6c:	00912223          	sw	s1,4(sp)
    3a70:	01212023          	sw	s2,0(sp)
    3a74:	00112623          	sw	ra,12(sp)
    3a78:	00050493          	mv	s1,a0
    3a7c:	00060913          	mv	s2,a2
    3a80:	0025d413          	srli	s0,a1,0x2
    3a84:	00100793          	li	a5,1
    3a88:	00000713          	li	a4,0
    3a8c:	00868693          	addi	a3,a3,8 # d008 <_edata_rom+0x479c>
    3a90:	08871063          	bne	a4,s0,3b10 <memtest_addr+0xb8>
    3a94:	0000500f          	0x500f
    3a98:	b5dff0ef          	jal	ra,35f4 <flush_l2_cache>
    3a9c:	0000d637          	lui	a2,0xd
    3aa0:	000106b7          	lui	a3,0x10
    3aa4:	00000513          	li	a0,0
    3aa8:	00000713          	li	a4,0
    3aac:	00100793          	li	a5,1
    3ab0:	00860613          	addi	a2,a2,8 # d008 <_edata_rom+0x479c>
    3ab4:	fff68693          	addi	a3,a3,-1 # ffff <_edata_rom+0x7793>
    3ab8:	08090a63          	beqz	s2,3b4c <memtest_addr+0xf4>
    3abc:	0017d593          	srli	a1,a5,0x1
    3ac0:	0017f793          	andi	a5,a5,1
    3ac4:	40f007b3          	neg	a5,a5
    3ac8:	00c7f7b3          	and	a5,a5,a2
    3acc:	00b7c7b3          	xor	a5,a5,a1
    3ad0:	01079793          	slli	a5,a5,0x10
    3ad4:	0107d793          	srli	a5,a5,0x10
    3ad8:	00279593          	slli	a1,a5,0x2
    3adc:	00b485b3          	add	a1,s1,a1
    3ae0:	0005a583          	lw	a1,0(a1)
    3ae4:	00d5f5b3          	and	a1,a1,a3
    3ae8:	00e58463          	beq	a1,a4,3af0 <memtest_addr+0x98>
    3aec:	00150513          	addi	a0,a0,1
    3af0:	00170713          	addi	a4,a4,1
    3af4:	fce412e3          	bne	s0,a4,3ab8 <memtest_addr+0x60>
    3af8:	00c12083          	lw	ra,12(sp)
    3afc:	00812403          	lw	s0,8(sp)
    3b00:	00412483          	lw	s1,4(sp)
    3b04:	00012903          	lw	s2,0(sp)
    3b08:	01010113          	addi	sp,sp,16
    3b0c:	00008067          	ret
    3b10:	02090a63          	beqz	s2,3b44 <memtest_addr+0xec>
    3b14:	0017d613          	srli	a2,a5,0x1
    3b18:	0017f793          	andi	a5,a5,1
    3b1c:	40f007b3          	neg	a5,a5
    3b20:	00d7f7b3          	and	a5,a5,a3
    3b24:	00c7c7b3          	xor	a5,a5,a2
    3b28:	01079793          	slli	a5,a5,0x10
    3b2c:	0107d793          	srli	a5,a5,0x10
    3b30:	00279613          	slli	a2,a5,0x2
    3b34:	00c48633          	add	a2,s1,a2
    3b38:	00e62023          	sw	a4,0(a2)
    3b3c:	00170713          	addi	a4,a4,1
    3b40:	f51ff06f          	j	3a90 <memtest_addr+0x38>
    3b44:	00178793          	addi	a5,a5,1 # 10001 <_edata_rom+0x7795>
    3b48:	fe1ff06f          	j	3b28 <memtest_addr+0xd0>
    3b4c:	00178793          	addi	a5,a5,1
    3b50:	f81ff06f          	j	3ad0 <memtest_addr+0x78>
    3b54:	00000513          	li	a0,0
    3b58:	00008067          	ret

00003b5c <memtest_data>:
    3b5c:	fc010113          	addi	sp,sp,-64
    3b60:	02912a23          	sw	s1,52(sp)
    3b64:	03212823          	sw	s2,48(sp)
    3b68:	03312623          	sw	s3,44(sp)
    3b6c:	03412423          	sw	s4,40(sp)
    3b70:	02112e23          	sw	ra,60(sp)
    3b74:	02812c23          	sw	s0,56(sp)
    3b78:	03512223          	sw	s5,36(sp)
    3b7c:	03612023          	sw	s6,32(sp)
    3b80:	01712e23          	sw	s7,28(sp)
    3b84:	01812c23          	sw	s8,24(sp)
    3b88:	01912a23          	sw	s9,20(sp)
    3b8c:	01a12823          	sw	s10,16(sp)
    3b90:	01b12623          	sw	s11,12(sp)
    3b94:	00050493          	mv	s1,a0
    3b98:	00060a13          	mv	s4,a2
    3b9c:	00068913          	mv	s2,a3
    3ba0:	0025d993          	srli	s3,a1,0x2
    3ba4:	0a068263          	beqz	a3,3c48 <memtest_data+0xec>
    3ba8:	0046a783          	lw	a5,4(a3)
    3bac:	0006ab03          	lw	s6,0(a3)
    3bb0:	04079263          	bnez	a5,3bf4 <memtest_data+0x98>
    3bb4:	80200bb7          	lui	s7,0x80200
    3bb8:	00008c37          	lui	s8,0x8
    3bbc:	00100413          	li	s0,1
    3bc0:	00000a93          	li	s5,0
    3bc4:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    3bc8:	fffc0c13          	addi	s8,s8,-1 # 7fff <crc_table+0x53b>
    3bcc:	00008cb7          	lui	s9,0x8
    3bd0:	002a9613          	slli	a2,s5,0x2
    3bd4:	073a9e63          	bne	s5,s3,3c50 <memtest_data+0xf4>
    3bd8:	00008537          	lui	a0,0x8
    3bdc:	fa050513          	addi	a0,a0,-96 # 7fa0 <crc_table+0x4dc>
    3be0:	00048593          	mv	a1,s1
    3be4:	c89ff0ef          	jal	ra,386c <print_progress>
    3be8:	00008537          	lui	a0,0x8
    3bec:	16050513          	addi	a0,a0,352 # 8160 <crc_table+0x69c>
    3bf0:	8e9fe0ef          	jal	ra,24d8 <printf>
    3bf4:	0000500f          	0x500f
    3bf8:	80200bb7          	lui	s7,0x80200
    3bfc:	00008c37          	lui	s8,0x8
    3c00:	9f5ff0ef          	jal	ra,35f4 <flush_l2_cache>
    3c04:	00100413          	li	s0,1
    3c08:	00000a93          	li	s5,0
    3c0c:	00000d13          	li	s10,0
    3c10:	003b8b93          	addi	s7,s7,3 # 80200003 <_fstack+0x701ff003>
    3c14:	fffc0c13          	addi	s8,s8,-1 # 7fff <crc_table+0x53b>
    3c18:	00008cb7          	lui	s9,0x8
    3c1c:	07a99c63          	bne	s3,s10,3c94 <memtest_data+0x138>
    3c20:	0e0b0463          	beqz	s6,3d08 <memtest_data+0x1ac>
    3c24:	00008537          	lui	a0,0x8
    3c28:	00299613          	slli	a2,s3,0x2
    3c2c:	00048593          	mv	a1,s1
    3c30:	fac50513          	addi	a0,a0,-84 # 7fac <crc_table+0x4e8>
    3c34:	c39ff0ef          	jal	ra,386c <print_progress>
    3c38:	00008537          	lui	a0,0x8
    3c3c:	16050513          	addi	a0,a0,352 # 8160 <crc_table+0x69c>
    3c40:	899fe0ef          	jal	ra,24d8 <printf>
    3c44:	0c40006f          	j	3d08 <memtest_data+0x1ac>
    3c48:	00100b13          	li	s6,1
    3c4c:	f69ff06f          	j	3bb4 <memtest_data+0x58>
    3c50:	020a0e63          	beqz	s4,3c8c <memtest_data+0x130>
    3c54:	00145793          	srli	a5,s0,0x1
    3c58:	00147413          	andi	s0,s0,1
    3c5c:	40800433          	neg	s0,s0
    3c60:	01747433          	and	s0,s0,s7
    3c64:	00f44433          	xor	s0,s0,a5
    3c68:	00c487b3          	add	a5,s1,a2
    3c6c:	0087a023          	sw	s0,0(a5)
    3c70:	018af7b3          	and	a5,s5,s8
    3c74:	00079863          	bnez	a5,3c84 <memtest_data+0x128>
    3c78:	00048593          	mv	a1,s1
    3c7c:	fa0c8513          	addi	a0,s9,-96 # 7fa0 <crc_table+0x4dc>
    3c80:	bedff0ef          	jal	ra,386c <print_progress>
    3c84:	001a8a93          	addi	s5,s5,1
    3c88:	f49ff06f          	j	3bd0 <memtest_data+0x74>
    3c8c:	00140413          	addi	s0,s0,1
    3c90:	fd9ff06f          	j	3c68 <memtest_data+0x10c>
    3c94:	040a0663          	beqz	s4,3ce0 <memtest_data+0x184>
    3c98:	00145793          	srli	a5,s0,0x1
    3c9c:	00147413          	andi	s0,s0,1
    3ca0:	40800433          	neg	s0,s0
    3ca4:	01747433          	and	s0,s0,s7
    3ca8:	00f44433          	xor	s0,s0,a5
    3cac:	002d1d93          	slli	s11,s10,0x2
    3cb0:	009d8533          	add	a0,s11,s1
    3cb4:	00052583          	lw	a1,0(a0)
    3cb8:	02859863          	bne	a1,s0,3ce8 <memtest_data+0x18c>
    3cbc:	018d77b3          	and	a5,s10,s8
    3cc0:	00079c63          	bnez	a5,3cd8 <memtest_data+0x17c>
    3cc4:	000b0a63          	beqz	s6,3cd8 <memtest_data+0x17c>
    3cc8:	000d8613          	mv	a2,s11
    3ccc:	00048593          	mv	a1,s1
    3cd0:	facc8513          	addi	a0,s9,-84
    3cd4:	b99ff0ef          	jal	ra,386c <print_progress>
    3cd8:	001d0d13          	addi	s10,s10,1
    3cdc:	f41ff06f          	j	3c1c <memtest_data+0xc0>
    3ce0:	00140413          	addi	s0,s0,1
    3ce4:	fc9ff06f          	j	3cac <memtest_data+0x150>
    3ce8:	001a8a93          	addi	s5,s5,1
    3cec:	fc0908e3          	beqz	s2,3cbc <memtest_data+0x160>
    3cf0:	00892783          	lw	a5,8(s2)
    3cf4:	fc0784e3          	beqz	a5,3cbc <memtest_data+0x160>
    3cf8:	00c92683          	lw	a3,12(s2)
    3cfc:	00040613          	mv	a2,s0
    3d00:	000780e7          	jalr	a5
    3d04:	fa050ce3          	beqz	a0,3cbc <memtest_data+0x160>
    3d08:	03c12083          	lw	ra,60(sp)
    3d0c:	03812403          	lw	s0,56(sp)
    3d10:	03412483          	lw	s1,52(sp)
    3d14:	03012903          	lw	s2,48(sp)
    3d18:	02c12983          	lw	s3,44(sp)
    3d1c:	02812a03          	lw	s4,40(sp)
    3d20:	02012b03          	lw	s6,32(sp)
    3d24:	01c12b83          	lw	s7,28(sp)
    3d28:	01812c03          	lw	s8,24(sp)
    3d2c:	01412c83          	lw	s9,20(sp)
    3d30:	01012d03          	lw	s10,16(sp)
    3d34:	00c12d83          	lw	s11,12(sp)
    3d38:	000a8513          	mv	a0,s5
    3d3c:	02412a83          	lw	s5,36(sp)
    3d40:	04010113          	addi	sp,sp,64
    3d44:	00008067          	ret

00003d48 <memspeed>:
    3d48:	fe010113          	addi	sp,sp,-32
    3d4c:	01312623          	sw	s3,12(sp)
    3d50:	ff058993          	addi	s3,a1,-16
    3d54:	00812c23          	sw	s0,24(sp)
    3d58:	00912a23          	sw	s1,20(sp)
    3d5c:	00050413          	mv	s0,a0
    3d60:	00058493          	mv	s1,a1
    3d64:	013509b3          	add	s3,a0,s3
    3d68:	00050593          	mv	a1,a0
    3d6c:	00008537          	lui	a0,0x8
    3d70:	01412423          	sw	s4,8(sp)
    3d74:	fb850513          	addi	a0,a0,-72 # 7fb8 <crc_table+0x4f4>
    3d78:	00068a13          	mv	s4,a3
    3d7c:	01212823          	sw	s2,16(sp)
    3d80:	00112e23          	sw	ra,28(sp)
    3d84:	01512223          	sw	s5,4(sp)
    3d88:	00060913          	mv	s2,a2
    3d8c:	f4cfe0ef          	jal	ra,24d8 <printf>
    3d90:	100a0863          	beqz	s4,3ea0 <memspeed+0x158>
    3d94:	00008537          	lui	a0,0x8
    3d98:	fcc50513          	addi	a0,a0,-52 # 7fcc <crc_table+0x508>
    3d9c:	f3cfe0ef          	jal	ra,24d8 <printf>
    3da0:	00048513          	mv	a0,s1
    3da4:	a3dff0ef          	jal	ra,37e0 <print_size>
    3da8:	00007537          	lui	a0,0x7
    3dac:	95c50513          	addi	a0,a0,-1700 # 695c <_etext+0x34>
    3db0:	f28fe0ef          	jal	ra,24d8 <printf>
    3db4:	f00027b7          	lui	a5,0xf0002
    3db8:	8007a423          	sw	zero,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3dbc:	8007a223          	sw	zero,-2044(a5)
    3dc0:	fff00713          	li	a4,-1
    3dc4:	80e7a023          	sw	a4,-2048(a5)
    3dc8:	00100713          	li	a4,1
    3dcc:	80e7a423          	sw	a4,-2040(a5)
    3dd0:	08091263          	bnez	s2,3e54 <memspeed+0x10c>
    3dd4:	80e7a623          	sw	a4,-2036(a5)
    3dd8:	8107a903          	lw	s2,-2032(a5)
    3ddc:	fff00713          	li	a4,-1
    3de0:	00040793          	mv	a5,s0
    3de4:	00e7a023          	sw	a4,0(a5)
    3de8:	00e7a223          	sw	a4,4(a5)
    3dec:	00e7a423          	sw	a4,8(a5)
    3df0:	00e7a623          	sw	a4,12(a5)
    3df4:	01078793          	addi	a5,a5,16
    3df8:	fef9f6e3          	bgeu	s3,a5,3de4 <memspeed+0x9c>
    3dfc:	f00027b7          	lui	a5,0xf0002
    3e00:	00100713          	li	a4,1
    3e04:	00008537          	lui	a0,0x8
    3e08:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    3e0c:	fe850513          	addi	a0,a0,-24 # 7fe8 <crc_table+0x524>
    3e10:	8107aa83          	lw	s5,-2032(a5)
    3e14:	ec4fe0ef          	jal	ra,24d8 <printf>
    3e18:	02faf537          	lui	a0,0x2faf
    3e1c:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa6814>
    3e20:	02a4b5b3          	mulhu	a1,s1,a0
    3e24:	41590633          	sub	a2,s2,s5
    3e28:	00c936b3          	sltu	a3,s2,a2
    3e2c:	40d006b3          	neg	a3,a3
    3e30:	02a48533          	mul	a0,s1,a0
    3e34:	d48ff0ef          	jal	ra,337c <__udivdi3>
    3e38:	9a9ff0ef          	jal	ra,37e0 <print_size>
    3e3c:	00008537          	lui	a0,0x8
    3e40:	ff850513          	addi	a0,a0,-8 # 7ff8 <crc_table+0x534>
    3e44:	e94fe0ef          	jal	ra,24d8 <printf>
    3e48:	00008537          	lui	a0,0x8
    3e4c:	16050513          	addi	a0,a0,352 # 8160 <crc_table+0x69c>
    3e50:	e88fe0ef          	jal	ra,24d8 <printf>
    3e54:	0000500f          	0x500f
    3e58:	f9cff0ef          	jal	ra,35f4 <flush_l2_cache>
    3e5c:	f00027b7          	lui	a5,0xf0002
    3e60:	00100713          	li	a4,1
    3e64:	80e7a423          	sw	a4,-2040(a5) # f0001808 <_fstack+0xe0000808>
    3e68:	80e7a623          	sw	a4,-2036(a5)
    3e6c:	8107a903          	lw	s2,-2032(a5)
    3e70:	0024d593          	srli	a1,s1,0x2
    3e74:	00058713          	mv	a4,a1
    3e78:	00000693          	li	a3,0
    3e7c:	02071863          	bnez	a4,3eac <memspeed+0x164>
    3e80:	0e0a1c63          	bnez	s4,3f78 <memspeed+0x230>
    3e84:	00042783          	lw	a5,0(s0)
    3e88:	00442783          	lw	a5,4(s0)
    3e8c:	00842783          	lw	a5,8(s0)
    3e90:	00c42783          	lw	a5,12(s0)
    3e94:	01040413          	addi	s0,s0,16
    3e98:	fe89f6e3          	bgeu	s3,s0,3e84 <memspeed+0x13c>
    3e9c:	05c0006f          	j	3ef8 <memspeed+0x1b0>
    3ea0:	00008537          	lui	a0,0x8
    3ea4:	fd850513          	addi	a0,a0,-40 # 7fd8 <crc_table+0x514>
    3ea8:	ef5ff06f          	j	3d9c <memspeed+0x54>
    3eac:	00177793          	andi	a5,a4,1
    3eb0:	00078463          	beqz	a5,3eb8 <memspeed+0x170>
    3eb4:	00168693          	addi	a3,a3,1
    3eb8:	00175713          	srli	a4,a4,0x1
    3ebc:	fc1ff06f          	j	3e7c <memspeed+0x134>
    3ec0:	0a070863          	beqz	a4,3f70 <memspeed+0x228>
    3ec4:	0017d613          	srli	a2,a5,0x1
    3ec8:	0017f793          	andi	a5,a5,1
    3ecc:	40f007b3          	neg	a5,a5
    3ed0:	00a7f7b3          	and	a5,a5,a0
    3ed4:	00c7c7b3          	xor	a5,a5,a2
    3ed8:	00f8f633          	and	a2,a7,a5
    3edc:	01068463          	beq	a3,a6,3ee4 <memspeed+0x19c>
    3ee0:	02b7f633          	remu	a2,a5,a1
    3ee4:	00261613          	slli	a2,a2,0x2
    3ee8:	00c40633          	add	a2,s0,a2
    3eec:	00062603          	lw	a2,0(a2)
    3ef0:	00170713          	addi	a4,a4,1
    3ef4:	fcb716e3          	bne	a4,a1,3ec0 <memspeed+0x178>
    3ef8:	f00027b7          	lui	a5,0xf0002
    3efc:	00100713          	li	a4,1
    3f00:	00008537          	lui	a0,0x8
    3f04:	80e7a623          	sw	a4,-2036(a5) # f000180c <_fstack+0xe000080c>
    3f08:	ffc50513          	addi	a0,a0,-4 # 7ffc <crc_table+0x538>
    3f0c:	8107a403          	lw	s0,-2032(a5)
    3f10:	dc8fe0ef          	jal	ra,24d8 <printf>
    3f14:	02faf537          	lui	a0,0x2faf
    3f18:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa6814>
    3f1c:	40890633          	sub	a2,s2,s0
    3f20:	00c936b3          	sltu	a3,s2,a2
    3f24:	40d006b3          	neg	a3,a3
    3f28:	02a4b5b3          	mulhu	a1,s1,a0
    3f2c:	02a48533          	mul	a0,s1,a0
    3f30:	c4cff0ef          	jal	ra,337c <__udivdi3>
    3f34:	8adff0ef          	jal	ra,37e0 <print_size>
    3f38:	00008537          	lui	a0,0x8
    3f3c:	ff850513          	addi	a0,a0,-8 # 7ff8 <crc_table+0x534>
    3f40:	d98fe0ef          	jal	ra,24d8 <printf>
    3f44:	01812403          	lw	s0,24(sp)
    3f48:	01c12083          	lw	ra,28(sp)
    3f4c:	01412483          	lw	s1,20(sp)
    3f50:	01012903          	lw	s2,16(sp)
    3f54:	00c12983          	lw	s3,12(sp)
    3f58:	00812a03          	lw	s4,8(sp)
    3f5c:	00412a83          	lw	s5,4(sp)
    3f60:	00008537          	lui	a0,0x8
    3f64:	16050513          	addi	a0,a0,352 # 8160 <crc_table+0x69c>
    3f68:	02010113          	addi	sp,sp,32
    3f6c:	d6cfe06f          	j	24d8 <printf>
    3f70:	00178793          	addi	a5,a5,1
    3f74:	f65ff06f          	j	3ed8 <memspeed+0x190>
    3f78:	80200537          	lui	a0,0x80200
    3f7c:	00000793          	li	a5,0
    3f80:	00350513          	addi	a0,a0,3 # 80200003 <_fstack+0x701ff003>
    3f84:	00100813          	li	a6,1
    3f88:	fff58893          	addi	a7,a1,-1
    3f8c:	f69ff06f          	j	3ef4 <memspeed+0x1ac>

00003f90 <memtest>:
    3f90:	fe010113          	addi	sp,sp,-32
    3f94:	00812c23          	sw	s0,24(sp)
    3f98:	00912a23          	sw	s1,20(sp)
    3f9c:	00058413          	mv	s0,a1
    3fa0:	00050493          	mv	s1,a0
    3fa4:	00050593          	mv	a1,a0
    3fa8:	00008537          	lui	a0,0x8
    3fac:	00c50513          	addi	a0,a0,12 # 800c <crc_table+0x548>
    3fb0:	00112e23          	sw	ra,28(sp)
    3fb4:	01212823          	sw	s2,16(sp)
    3fb8:	01312623          	sw	s3,12(sp)
    3fbc:	01412423          	sw	s4,8(sp)
    3fc0:	01512223          	sw	s5,4(sp)
    3fc4:	d14fe0ef          	jal	ra,24d8 <printf>
    3fc8:	00040513          	mv	a0,s0
    3fcc:	815ff0ef          	jal	ra,37e0 <print_size>
    3fd0:	00007537          	lui	a0,0x7
    3fd4:	95c50513          	addi	a0,a0,-1700 # 695c <_etext+0x34>
    3fd8:	d00fe0ef          	jal	ra,24d8 <printf>
    3fdc:	00048513          	mv	a0,s1
    3fe0:	8d5ff0ef          	jal	ra,38b4 <memtest_access>
    3fe4:	00000913          	li	s2,0
    3fe8:	0a051663          	bnez	a0,4094 <memtest+0x104>
    3fec:	08000793          	li	a5,128
    3ff0:	00050913          	mv	s2,a0
    3ff4:	00040993          	mv	s3,s0
    3ff8:	0087f463          	bgeu	a5,s0,4000 <memtest+0x70>
    3ffc:	08000993          	li	s3,128
    4000:	00098593          	mv	a1,s3
    4004:	00048513          	mv	a0,s1
    4008:	915ff0ef          	jal	ra,391c <memtest_bus>
    400c:	00050a93          	mv	s5,a0
    4010:	00000613          	li	a2,0
    4014:	00098593          	mv	a1,s3
    4018:	00048513          	mv	a0,s1
    401c:	a3dff0ef          	jal	ra,3a58 <memtest_addr>
    4020:	00050a13          	mv	s4,a0
    4024:	00000693          	li	a3,0
    4028:	00048513          	mv	a0,s1
    402c:	00100613          	li	a2,1
    4030:	00040593          	mv	a1,s0
    4034:	b29ff0ef          	jal	ra,3b5c <memtest_data>
    4038:	014a87b3          	add	a5,s5,s4
    403c:	00a787b3          	add	a5,a5,a0
    4040:	00050493          	mv	s1,a0
    4044:	06078c63          	beqz	a5,40bc <memtest+0x12c>
    4048:	00199613          	slli	a2,s3,0x1
    404c:	00008537          	lui	a0,0x8
    4050:	00265613          	srli	a2,a2,0x2
    4054:	000a8593          	mv	a1,s5
    4058:	01c50513          	addi	a0,a0,28 # 801c <crc_table+0x558>
    405c:	c7cfe0ef          	jal	ra,24d8 <printf>
    4060:	00008537          	lui	a0,0x8
    4064:	0029d613          	srli	a2,s3,0x2
    4068:	000a0593          	mv	a1,s4
    406c:	03450513          	addi	a0,a0,52 # 8034 <crc_table+0x570>
    4070:	c68fe0ef          	jal	ra,24d8 <printf>
    4074:	00008537          	lui	a0,0x8
    4078:	00245613          	srli	a2,s0,0x2
    407c:	00048593          	mv	a1,s1
    4080:	04c50513          	addi	a0,a0,76 # 804c <crc_table+0x588>
    4084:	c54fe0ef          	jal	ra,24d8 <printf>
    4088:	00008537          	lui	a0,0x8
    408c:	06450513          	addi	a0,a0,100 # 8064 <crc_table+0x5a0>
    4090:	c48fe0ef          	jal	ra,24d8 <printf>
    4094:	01c12083          	lw	ra,28(sp)
    4098:	01812403          	lw	s0,24(sp)
    409c:	01412483          	lw	s1,20(sp)
    40a0:	00c12983          	lw	s3,12(sp)
    40a4:	00812a03          	lw	s4,8(sp)
    40a8:	00412a83          	lw	s5,4(sp)
    40ac:	00090513          	mv	a0,s2
    40b0:	01012903          	lw	s2,16(sp)
    40b4:	02010113          	addi	sp,sp,32
    40b8:	00008067          	ret
    40bc:	00008537          	lui	a0,0x8
    40c0:	07050513          	addi	a0,a0,112 # 8070 <crc_table+0x5ac>
    40c4:	c14fe0ef          	jal	ra,24d8 <printf>
    40c8:	00100913          	li	s2,1
    40cc:	fc9ff06f          	j	4094 <memtest+0x104>

000040d0 <uart_isr>:
    40d0:	f0001737          	lui	a4,0xf0001
    40d4:	01072683          	lw	a3,16(a4) # f0001010 <_fstack+0xe0000010>
    40d8:	01472783          	lw	a5,20(a4)
    40dc:	00d7f7b3          	and	a5,a5,a3
    40e0:	0027f713          	andi	a4,a5,2
    40e4:	00071863          	bnez	a4,40f4 <uart_isr+0x24>
    40e8:	0017f793          	andi	a5,a5,1
    40ec:	04079c63          	bnez	a5,4144 <uart_isr+0x74>
    40f0:	00008067          	ret
    40f4:	10000737          	lui	a4,0x10000
    40f8:	18872803          	lw	a6,392(a4) # 10000188 <rx_consume>
    40fc:	100005b7          	lui	a1,0x10000
    4100:	f00016b7          	lui	a3,0xf0001
    4104:	10000637          	lui	a2,0x10000
    4108:	1ac58593          	addi	a1,a1,428 # 100001ac <rx_buf>
    410c:	00200893          	li	a7,2
    4110:	0086a703          	lw	a4,8(a3) # f0001008 <_fstack+0xe0000008>
    4114:	fc071ae3          	bnez	a4,40e8 <uart_isr+0x18>
    4118:	0006a303          	lw	t1,0(a3)
    411c:	18c62703          	lw	a4,396(a2) # 1000018c <rx_produce>
    4120:	00170713          	addi	a4,a4,1
    4124:	07f77713          	andi	a4,a4,127
    4128:	00e80a63          	beq	a6,a4,413c <uart_isr+0x6c>
    412c:	18c62503          	lw	a0,396(a2)
    4130:	18e62623          	sw	a4,396(a2)
    4134:	00a58533          	add	a0,a1,a0
    4138:	00650023          	sb	t1,0(a0)
    413c:	0116a823          	sw	a7,16(a3)
    4140:	fd1ff06f          	j	4110 <uart_isr+0x40>
    4144:	100007b7          	lui	a5,0x10000
    4148:	1847a603          	lw	a2,388(a5) # 10000184 <tx_produce>
    414c:	100006b7          	lui	a3,0x10000
    4150:	100007b7          	lui	a5,0x10000
    4154:	00078513          	mv	a0,a5
    4158:	f00015b7          	lui	a1,0xf0001
    415c:	1ac68693          	addi	a3,a3,428 # 100001ac <rx_buf>
    4160:	1807a703          	lw	a4,384(a5) # 10000180 <tx_consume>
    4164:	00c70663          	beq	a4,a2,4170 <uart_isr+0xa0>
    4168:	0045a703          	lw	a4,4(a1) # f0001004 <_fstack+0xe0000004>
    416c:	00070e63          	beqz	a4,4188 <uart_isr+0xb8>
    4170:	18052783          	lw	a5,384(a0)
    4174:	00f61863          	bne	a2,a5,4184 <uart_isr+0xb4>
    4178:	f00017b7          	lui	a5,0xf0001
    417c:	00200713          	li	a4,2
    4180:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    4184:	00008067          	ret
    4188:	1807a703          	lw	a4,384(a5)
    418c:	00e68733          	add	a4,a3,a4
    4190:	08074703          	lbu	a4,128(a4)
    4194:	00e5a023          	sw	a4,0(a1)
    4198:	1807a703          	lw	a4,384(a5)
    419c:	00170713          	addi	a4,a4,1
    41a0:	07f77713          	andi	a4,a4,127
    41a4:	18e7a023          	sw	a4,384(a5)
    41a8:	fb9ff06f          	j	4160 <uart_isr+0x90>

000041ac <uart_read>:
    41ac:	30002673          	csrr	a2,mstatus
    41b0:	10000737          	lui	a4,0x10000
    41b4:	00867613          	andi	a2,a2,8
    41b8:	18872783          	lw	a5,392(a4) # 10000188 <rx_consume>
    41bc:	00070693          	mv	a3,a4
    41c0:	10000737          	lui	a4,0x10000
    41c4:	02060663          	beqz	a2,41f0 <uart_read+0x44>
    41c8:	18c72603          	lw	a2,396(a4) # 1000018c <rx_produce>
    41cc:	fef60ee3          	beq	a2,a5,41c8 <uart_read+0x1c>
    41d0:	10000737          	lui	a4,0x10000
    41d4:	1ac70713          	addi	a4,a4,428 # 100001ac <rx_buf>
    41d8:	00f70733          	add	a4,a4,a5
    41dc:	00178793          	addi	a5,a5,1
    41e0:	07f7f793          	andi	a5,a5,127
    41e4:	00074503          	lbu	a0,0(a4)
    41e8:	18f6a423          	sw	a5,392(a3)
    41ec:	0100006f          	j	41fc <uart_read+0x50>
    41f0:	18c72703          	lw	a4,396(a4)
    41f4:	00000513          	li	a0,0
    41f8:	fcf71ce3          	bne	a4,a5,41d0 <uart_read+0x24>
    41fc:	00008067          	ret

00004200 <uart_read_nonblock>:
    4200:	10000737          	lui	a4,0x10000
    4204:	100007b7          	lui	a5,0x10000
    4208:	18c7a783          	lw	a5,396(a5) # 1000018c <rx_produce>
    420c:	18872503          	lw	a0,392(a4) # 10000188 <rx_consume>
    4210:	40f50533          	sub	a0,a0,a5
    4214:	00a03533          	snez	a0,a0
    4218:	00008067          	ret

0000421c <uart_write>:
    421c:	10000737          	lui	a4,0x10000
    4220:	18472783          	lw	a5,388(a4) # 10000184 <tx_produce>
    4224:	00178793          	addi	a5,a5,1
    4228:	07f7f793          	andi	a5,a5,127
    422c:	30002673          	csrr	a2,mstatus
    4230:	00867613          	andi	a2,a2,8
    4234:	100006b7          	lui	a3,0x10000
    4238:	06060063          	beqz	a2,4298 <uart_write+0x7c>
    423c:	1806a603          	lw	a2,384(a3) # 10000180 <tx_consume>
    4240:	fef60ee3          	beq	a2,a5,423c <uart_write+0x20>
    4244:	f0c025b7          	lui	a1,0xf0c02
    4248:	0005a603          	lw	a2,0(a1) # f0c02000 <_fstack+0xe0c01000>
    424c:	ffd67813          	andi	a6,a2,-3
    4250:	0105a023          	sw	a6,0(a1)
    4254:	1806a683          	lw	a3,384(a3)
    4258:	18472803          	lw	a6,388(a4)
    425c:	01069863          	bne	a3,a6,426c <uart_write+0x50>
    4260:	f00015b7          	lui	a1,0xf0001
    4264:	0045a683          	lw	a3,4(a1) # f0001004 <_fstack+0xe0000004>
    4268:	02068e63          	beqz	a3,42a4 <uart_write+0x88>
    426c:	100006b7          	lui	a3,0x10000
    4270:	1ac68693          	addi	a3,a3,428 # 100001ac <rx_buf>
    4274:	010686b3          	add	a3,a3,a6
    4278:	18f72223          	sw	a5,388(a4)
    427c:	08a68023          	sb	a0,128(a3)
    4280:	f00017b7          	lui	a5,0xf0001
    4284:	00300713          	li	a4,3
    4288:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    428c:	f0c027b7          	lui	a5,0xf0c02
    4290:	00c7a023          	sw	a2,0(a5) # f0c02000 <_fstack+0xe0c01000>
    4294:	00c0006f          	j	42a0 <uart_write+0x84>
    4298:	1806a603          	lw	a2,384(a3)
    429c:	faf614e3          	bne	a2,a5,4244 <uart_write+0x28>
    42a0:	00008067          	ret
    42a4:	00a5a023          	sw	a0,0(a1)
    42a8:	fe5ff06f          	j	428c <uart_write+0x70>

000042ac <uart_init>:
    42ac:	100007b7          	lui	a5,0x10000
    42b0:	1807a623          	sw	zero,396(a5) # 1000018c <rx_produce>
    42b4:	100007b7          	lui	a5,0x10000
    42b8:	1807a423          	sw	zero,392(a5) # 10000188 <rx_consume>
    42bc:	100007b7          	lui	a5,0x10000
    42c0:	1807a223          	sw	zero,388(a5) # 10000184 <tx_produce>
    42c4:	100007b7          	lui	a5,0x10000
    42c8:	1807a023          	sw	zero,384(a5) # 10000180 <tx_consume>
    42cc:	00200713          	li	a4,2
    42d0:	f00017b7          	lui	a5,0xf0001
    42d4:	00e7aa23          	sw	a4,20(a5) # f0001014 <_fstack+0xe0000014>
    42d8:	000047b7          	lui	a5,0x4
    42dc:	34478793          	addi	a5,a5,836 # 4344 <irq_attach>
    42e0:	02078c63          	beqz	a5,4318 <uart_init+0x6c>
    42e4:	000045b7          	lui	a1,0x4
    42e8:	ff010113          	addi	sp,sp,-16
    42ec:	0d058593          	addi	a1,a1,208 # 40d0 <uart_isr>
    42f0:	00100513          	li	a0,1
    42f4:	00112623          	sw	ra,12(sp)
    42f8:	04c000ef          	jal	ra,4344 <irq_attach>
    42fc:	f0c02737          	lui	a4,0xf0c02
    4300:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    4304:	00c12083          	lw	ra,12(sp)
    4308:	0027e793          	ori	a5,a5,2
    430c:	00f72023          	sw	a5,0(a4)
    4310:	01010113          	addi	sp,sp,16
    4314:	00008067          	ret
    4318:	f0c02737          	lui	a4,0xf0c02
    431c:	00072783          	lw	a5,0(a4) # f0c02000 <_fstack+0xe0c01000>
    4320:	0027e793          	ori	a5,a5,2
    4324:	00f72023          	sw	a5,0(a4)
    4328:	00008067          	ret

0000432c <uart_sync>:
    432c:	100007b7          	lui	a5,0x10000
    4330:	1847a783          	lw	a5,388(a5) # 10000184 <tx_produce>
    4334:	100006b7          	lui	a3,0x10000
    4338:	1806a703          	lw	a4,384(a3) # 10000180 <tx_consume>
    433c:	fef71ee3          	bne	a4,a5,4338 <uart_sync+0xc>
    4340:	00008067          	ret

00004344 <irq_attach>:
    4344:	00200793          	li	a5,2
    4348:	02a7f663          	bgeu	a5,a0,4374 <irq_attach+0x30>
    434c:	00050593          	mv	a1,a0
    4350:	00008537          	lui	a0,0x8
    4354:	ff010113          	addi	sp,sp,-16
    4358:	07c50513          	addi	a0,a0,124 # 807c <crc_table+0x5b8>
    435c:	00112623          	sw	ra,12(sp)
    4360:	978fe0ef          	jal	ra,24d8 <printf>
    4364:	00c12083          	lw	ra,12(sp)
    4368:	fff00513          	li	a0,-1
    436c:	01010113          	addi	sp,sp,16
    4370:	00008067          	ret
    4374:	300026f3          	csrr	a3,mstatus
    4378:	30047073          	csrci	mstatus,8
    437c:	10000737          	lui	a4,0x10000
    4380:	00251793          	slli	a5,a0,0x2
    4384:	4ac70713          	addi	a4,a4,1196 # 100004ac <irq_table>
    4388:	00f707b3          	add	a5,a4,a5
    438c:	00b7a023          	sw	a1,0(a5)
    4390:	0086f793          	andi	a5,a3,8
    4394:	00078663          	beqz	a5,43a0 <irq_attach+0x5c>
    4398:	30046073          	csrsi	mstatus,8
    439c:	00008067          	ret
    43a0:	30047073          	csrci	mstatus,8
    43a4:	00008067          	ret

000043a8 <irq_detach>:
    43a8:	00000593          	li	a1,0
    43ac:	f99ff06f          	j	4344 <irq_attach>

000043b0 <plic_init>:
    43b0:	f0c007b7          	lui	a5,0xf0c00
    43b4:	00100713          	li	a4,1
    43b8:	00e7a023          	sw	a4,0(a5) # f0c00000 <_fstack+0xe0bff000>
    43bc:	00e7a223          	sw	a4,4(a5)
    43c0:	00e7a423          	sw	a4,8(a5)
    43c4:	00e7a623          	sw	a4,12(a5)
    43c8:	00e7a823          	sw	a4,16(a5)
    43cc:	00e7aa23          	sw	a4,20(a5)
    43d0:	00e7ac23          	sw	a4,24(a5)
    43d4:	00e7ae23          	sw	a4,28(a5)
    43d8:	f0c027b7          	lui	a5,0xf0c02
    43dc:	0ff00713          	li	a4,255
    43e0:	00e7a023          	sw	a4,0(a5) # f0c02000 <_fstack+0xe0c01000>
    43e4:	f0e007b7          	lui	a5,0xf0e00
    43e8:	0007a023          	sw	zero,0(a5) # f0e00000 <_fstack+0xe0dff000>
    43ec:	00008067          	ret

000043f0 <isr>:
    43f0:	fd010113          	addi	sp,sp,-48
    43f4:	02912223          	sw	s1,36(sp)
    43f8:	100004b7          	lui	s1,0x10000
    43fc:	03212023          	sw	s2,32(sp)
    4400:	01312e23          	sw	s3,28(sp)
    4404:	01412c23          	sw	s4,24(sp)
    4408:	01512a23          	sw	s5,20(sp)
    440c:	01612823          	sw	s6,16(sp)
    4410:	01712623          	sw	s7,12(sp)
    4414:	02112623          	sw	ra,44(sp)
    4418:	02812423          	sw	s0,40(sp)
    441c:	00008937          	lui	s2,0x8
    4420:	000089b7          	lui	s3,0x8
    4424:	00008a37          	lui	s4,0x8
    4428:	00008ab7          	lui	s5,0x8
    442c:	00008b37          	lui	s6,0x8
    4430:	00008bb7          	lui	s7,0x8
    4434:	4ac48493          	addi	s1,s1,1196 # 100004ac <irq_table>
    4438:	f0e007b7          	lui	a5,0xf0e00
    443c:	0047a403          	lw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    4440:	02041863          	bnez	s0,4470 <isr+0x80>
    4444:	02c12083          	lw	ra,44(sp)
    4448:	02812403          	lw	s0,40(sp)
    444c:	02412483          	lw	s1,36(sp)
    4450:	02012903          	lw	s2,32(sp)
    4454:	01c12983          	lw	s3,28(sp)
    4458:	01812a03          	lw	s4,24(sp)
    445c:	01412a83          	lw	s5,20(sp)
    4460:	01012b03          	lw	s6,16(sp)
    4464:	00c12b83          	lw	s7,12(sp)
    4468:	03010113          	addi	sp,sp,48
    446c:	00008067          	ret
    4470:	00200793          	li	a5,2
    4474:	0287e263          	bltu	a5,s0,4498 <isr+0xa8>
    4478:	00241793          	slli	a5,s0,0x2
    447c:	00f487b3          	add	a5,s1,a5
    4480:	0007a783          	lw	a5,0(a5)
    4484:	00078a63          	beqz	a5,4498 <isr+0xa8>
    4488:	000780e7          	jalr	a5
    448c:	f0e007b7          	lui	a5,0xf0e00
    4490:	0087a223          	sw	s0,4(a5) # f0e00004 <_fstack+0xe0dff004>
    4494:	fa5ff06f          	j	4438 <isr+0x48>
    4498:	00040593          	mv	a1,s0
    449c:	08890513          	addi	a0,s2,136 # 8088 <crc_table+0x5c4>
    44a0:	838fe0ef          	jal	ra,24d8 <printf>
    44a4:	f0c027b7          	lui	a5,0xf0c02
    44a8:	0007a583          	lw	a1,0(a5) # f0c02000 <_fstack+0xe0c01000>
    44ac:	0a898513          	addi	a0,s3,168 # 80a8 <crc_table+0x5e4>
    44b0:	828fe0ef          	jal	ra,24d8 <printf>
    44b4:	f0c017b7          	lui	a5,0xf0c01
    44b8:	0007a583          	lw	a1,0(a5) # f0c01000 <_fstack+0xe0c00000>
    44bc:	0c4a0513          	addi	a0,s4,196 # 80c4 <crc_table+0x600>
    44c0:	818fe0ef          	jal	ra,24d8 <printf>
    44c4:	341025f3          	csrr	a1,mepc
    44c8:	0e0a8513          	addi	a0,s5,224 # 80e0 <crc_table+0x61c>
    44cc:	80cfe0ef          	jal	ra,24d8 <printf>
    44d0:	342025f3          	csrr	a1,mcause
    44d4:	0f4b0513          	addi	a0,s6,244 # 80f4 <crc_table+0x630>
    44d8:	800fe0ef          	jal	ra,24d8 <printf>
    44dc:	343025f3          	csrr	a1,mtval
    44e0:	108b8513          	addi	a0,s7,264 # 8108 <crc_table+0x644>
    44e4:	ff5fd0ef          	jal	ra,24d8 <printf>
    44e8:	304025f3          	csrr	a1,mie
    44ec:	00008537          	lui	a0,0x8
    44f0:	11c50513          	addi	a0,a0,284 # 811c <crc_table+0x658>
    44f4:	fe5fd0ef          	jal	ra,24d8 <printf>
    44f8:	344025f3          	csrr	a1,mip
    44fc:	00008537          	lui	a0,0x8
    4500:	13050513          	addi	a0,a0,304 # 8130 <crc_table+0x66c>
    4504:	fd5fd0ef          	jal	ra,24d8 <printf>
    4508:	00008537          	lui	a0,0x8
    450c:	14450513          	addi	a0,a0,324 # 8144 <crc_table+0x680>
    4510:	fc9fd0ef          	jal	ra,24d8 <printf>
    4514:	f79ff06f          	j	448c <isr+0x9c>

00004518 <ff_uni2oem>:
    4518:	07f00793          	li	a5,127
    451c:	00050713          	mv	a4,a0
    4520:	00a7e863          	bltu	a5,a0,4530 <ff_uni2oem+0x18>
    4524:	01051513          	slli	a0,a0,0x10
    4528:	01055513          	srli	a0,a0,0x10
    452c:	00008067          	ret
    4530:	000107b7          	lui	a5,0x10
    4534:	00000513          	li	a0,0
    4538:	04f77063          	bgeu	a4,a5,4578 <ff_uni2oem+0x60>
    453c:	1b500793          	li	a5,437
    4540:	02f59c63          	bne	a1,a5,4578 <ff_uni2oem+0x60>
    4544:	000086b7          	lui	a3,0x8
    4548:	18868693          	addi	a3,a3,392 # 8188 <uc437>
    454c:	00000793          	li	a5,0
    4550:	08000593          	li	a1,128
    4554:	0006d603          	lhu	a2,0(a3)
    4558:	00e60c63          	beq	a2,a4,4570 <ff_uni2oem+0x58>
    455c:	00178793          	addi	a5,a5,1 # 10001 <_edata_rom+0x7795>
    4560:	01079793          	slli	a5,a5,0x10
    4564:	0107d793          	srli	a5,a5,0x10
    4568:	00268693          	addi	a3,a3,2
    456c:	feb794e3          	bne	a5,a1,4554 <ff_uni2oem+0x3c>
    4570:	08078513          	addi	a0,a5,128
    4574:	0ff57513          	andi	a0,a0,255
    4578:	00008067          	ret

0000457c <ff_oem2uni>:
    457c:	07f00793          	li	a5,127
    4580:	02a7f863          	bgeu	a5,a0,45b0 <ff_oem2uni+0x34>
    4584:	1b500793          	li	a5,437
    4588:	02f59263          	bne	a1,a5,45ac <ff_oem2uni+0x30>
    458c:	0ff00793          	li	a5,255
    4590:	00a7ee63          	bltu	a5,a0,45ac <ff_oem2uni+0x30>
    4594:	000087b7          	lui	a5,0x8
    4598:	18878793          	addi	a5,a5,392 # 8188 <uc437>
    459c:	00151513          	slli	a0,a0,0x1
    45a0:	00a78533          	add	a0,a5,a0
    45a4:	f0055503          	lhu	a0,-256(a0)
    45a8:	00008067          	ret
    45ac:	00000513          	li	a0,0
    45b0:	00008067          	ret

000045b4 <ff_wtoupper>:
    45b4:	000107b7          	lui	a5,0x10
    45b8:	06f57e63          	bgeu	a0,a5,4634 <ff_wtoupper+0x80>
    45bc:	000086b7          	lui	a3,0x8
    45c0:	01051793          	slli	a5,a0,0x10
    45c4:	18868693          	addi	a3,a3,392 # 8188 <uc437>
    45c8:	00001637          	lui	a2,0x1
    45cc:	0107d793          	srli	a5,a5,0x10
    45d0:	10068713          	addi	a4,a3,256
    45d4:	00c56463          	bltu	a0,a2,45dc <ff_wtoupper+0x28>
    45d8:	2f468713          	addi	a4,a3,756
    45dc:	00075683          	lhu	a3,0(a4)
    45e0:	04068863          	beqz	a3,4630 <ff_wtoupper+0x7c>
    45e4:	04d7e663          	bltu	a5,a3,4630 <ff_wtoupper+0x7c>
    45e8:	00275603          	lhu	a2,2(a4)
    45ec:	00470713          	addi	a4,a4,4
    45f0:	00865593          	srli	a1,a2,0x8
    45f4:	0ff67613          	andi	a2,a2,255
    45f8:	00d60833          	add	a6,a2,a3
    45fc:	09055a63          	bge	a0,a6,4690 <ff_wtoupper+0xdc>
    4600:	00800613          	li	a2,8
    4604:	02b66663          	bltu	a2,a1,4630 <ff_wtoupper+0x7c>
    4608:	00008637          	lui	a2,0x8
    460c:	16460613          	addi	a2,a2,356 # 8164 <crc_table+0x6a0>
    4610:	00259593          	slli	a1,a1,0x2
    4614:	00c585b3          	add	a1,a1,a2
    4618:	0005a603          	lw	a2,0(a1)
    461c:	00060067          	jr	a2
    4620:	40d50533          	sub	a0,a0,a3
    4624:	00151513          	slli	a0,a0,0x1
    4628:	00a70533          	add	a0,a4,a0
    462c:	00055783          	lhu	a5,0(a0)
    4630:	00078513          	mv	a0,a5
    4634:	00008067          	ret
    4638:	40d78533          	sub	a0,a5,a3
    463c:	00157513          	andi	a0,a0,1
    4640:	40a787b3          	sub	a5,a5,a0
    4644:	01079793          	slli	a5,a5,0x10
    4648:	0107d793          	srli	a5,a5,0x10
    464c:	fe5ff06f          	j	4630 <ff_wtoupper+0x7c>
    4650:	ff078793          	addi	a5,a5,-16 # fff0 <_edata_rom+0x7784>
    4654:	ff1ff06f          	j	4644 <ff_wtoupper+0x90>
    4658:	fe078793          	addi	a5,a5,-32
    465c:	fe9ff06f          	j	4644 <ff_wtoupper+0x90>
    4660:	fd078793          	addi	a5,a5,-48
    4664:	fe1ff06f          	j	4644 <ff_wtoupper+0x90>
    4668:	fe678793          	addi	a5,a5,-26
    466c:	fd9ff06f          	j	4644 <ff_wtoupper+0x90>
    4670:	00878793          	addi	a5,a5,8
    4674:	fd1ff06f          	j	4644 <ff_wtoupper+0x90>
    4678:	fb078793          	addi	a5,a5,-80
    467c:	fc9ff06f          	j	4644 <ff_wtoupper+0x90>
    4680:	ffffe737          	lui	a4,0xffffe
    4684:	3a070713          	addi	a4,a4,928 # ffffe3a0 <_fstack+0xefffd3a0>
    4688:	00e787b3          	add	a5,a5,a4
    468c:	fb9ff06f          	j	4644 <ff_wtoupper+0x90>
    4690:	f40596e3          	bnez	a1,45dc <ff_wtoupper+0x28>
    4694:	00161613          	slli	a2,a2,0x1
    4698:	00c70733          	add	a4,a4,a2
    469c:	f41ff06f          	j	45dc <ff_wtoupper+0x28>

000046a0 <ld_dword>:
    46a0:	00354783          	lbu	a5,3(a0)
    46a4:	00254703          	lbu	a4,2(a0)
    46a8:	00879793          	slli	a5,a5,0x8
    46ac:	00e7e7b3          	or	a5,a5,a4
    46b0:	00154703          	lbu	a4,1(a0)
    46b4:	00879793          	slli	a5,a5,0x8
    46b8:	00054503          	lbu	a0,0(a0)
    46bc:	00f767b3          	or	a5,a4,a5
    46c0:	00879793          	slli	a5,a5,0x8
    46c4:	00f56533          	or	a0,a0,a5
    46c8:	00008067          	ret

000046cc <mem_cmp>:
    46cc:	00050793          	mv	a5,a0
    46d0:	00c50633          	add	a2,a0,a2
    46d4:	0007c503          	lbu	a0,0(a5)
    46d8:	0005c703          	lbu	a4,0(a1)
    46dc:	00178793          	addi	a5,a5,1
    46e0:	00158593          	addi	a1,a1,1
    46e4:	40e50533          	sub	a0,a0,a4
    46e8:	00c78463          	beq	a5,a2,46f0 <mem_cmp+0x24>
    46ec:	fe0504e3          	beqz	a0,46d4 <mem_cmp+0x8>
    46f0:	00008067          	ret

000046f4 <clst2sect>:
    46f4:	01052703          	lw	a4,16(a0)
    46f8:	ffe58793          	addi	a5,a1,-2
    46fc:	ffe70713          	addi	a4,a4,-2
    4700:	00e7fc63          	bgeu	a5,a4,4718 <clst2sect+0x24>
    4704:	00a55583          	lhu	a1,10(a0)
    4708:	02452503          	lw	a0,36(a0)
    470c:	02f585b3          	mul	a1,a1,a5
    4710:	00a58533          	add	a0,a1,a0
    4714:	00008067          	ret
    4718:	00000513          	li	a0,0
    471c:	00008067          	ret

00004720 <get_ldnumber>:
    4720:	00052703          	lw	a4,0(a0)
    4724:	00050693          	mv	a3,a0
    4728:	02070463          	beqz	a4,4750 <get_ldnumber+0x30>
    472c:	00070793          	mv	a5,a4
    4730:	01f00513          	li	a0,31
    4734:	03a00593          	li	a1,58
    4738:	0007c603          	lbu	a2,0(a5)
    473c:	00178793          	addi	a5,a5,1
    4740:	02c57663          	bgeu	a0,a2,476c <get_ldnumber+0x4c>
    4744:	feb61ae3          	bne	a2,a1,4738 <get_ldnumber+0x18>
    4748:	00270613          	addi	a2,a4,2
    474c:	00c78663          	beq	a5,a2,4758 <get_ldnumber+0x38>
    4750:	fff00513          	li	a0,-1
    4754:	00008067          	ret
    4758:	00074603          	lbu	a2,0(a4)
    475c:	03000713          	li	a4,48
    4760:	fff00513          	li	a0,-1
    4764:	fee618e3          	bne	a2,a4,4754 <get_ldnumber+0x34>
    4768:	00f6a023          	sw	a5,0(a3)
    476c:	00000513          	li	a0,0
    4770:	00008067          	ret

00004774 <validate>:
    4774:	ff010113          	addi	sp,sp,-16
    4778:	00912223          	sw	s1,4(sp)
    477c:	00112623          	sw	ra,12(sp)
    4780:	00812423          	sw	s0,8(sp)
    4784:	00058493          	mv	s1,a1
    4788:	02051263          	bnez	a0,47ac <validate+0x38>
    478c:	00900513          	li	a0,9
    4790:	00000793          	li	a5,0
    4794:	00c12083          	lw	ra,12(sp)
    4798:	00812403          	lw	s0,8(sp)
    479c:	00f4a023          	sw	a5,0(s1)
    47a0:	00412483          	lw	s1,4(sp)
    47a4:	01010113          	addi	sp,sp,16
    47a8:	00008067          	ret
    47ac:	00052783          	lw	a5,0(a0)
    47b0:	00050413          	mv	s0,a0
    47b4:	fc078ce3          	beqz	a5,478c <validate+0x18>
    47b8:	0007c703          	lbu	a4,0(a5)
    47bc:	fc0708e3          	beqz	a4,478c <validate+0x18>
    47c0:	00455683          	lhu	a3,4(a0)
    47c4:	0067d703          	lhu	a4,6(a5)
    47c8:	fce692e3          	bne	a3,a4,478c <validate+0x18>
    47cc:	10000737          	lui	a4,0x10000
    47d0:	4b872703          	lw	a4,1208(a4) # 100004b8 <FfDiskOps>
    47d4:	0017c503          	lbu	a0,1(a5)
    47d8:	00472703          	lw	a4,4(a4)
    47dc:	000700e7          	jalr	a4
    47e0:	00157513          	andi	a0,a0,1
    47e4:	fa0514e3          	bnez	a0,478c <validate+0x18>
    47e8:	00042783          	lw	a5,0(s0)
    47ec:	fa9ff06f          	j	4794 <validate+0x20>

000047f0 <move_window>:
    47f0:	02852783          	lw	a5,40(a0)
    47f4:	06b78063          	beq	a5,a1,4854 <move_window+0x64>
    47f8:	100007b7          	lui	a5,0x10000
    47fc:	4b87a783          	lw	a5,1208(a5) # 100004b8 <FfDiskOps>
    4800:	ff010113          	addi	sp,sp,-16
    4804:	00812423          	sw	s0,8(sp)
    4808:	00912223          	sw	s1,4(sp)
    480c:	00112623          	sw	ra,12(sp)
    4810:	00050413          	mv	s0,a0
    4814:	00058493          	mv	s1,a1
    4818:	00058613          	mv	a2,a1
    481c:	0087a783          	lw	a5,8(a5)
    4820:	02c50593          	addi	a1,a0,44
    4824:	00154503          	lbu	a0,1(a0)
    4828:	00100693          	li	a3,1
    482c:	000780e7          	jalr	a5
    4830:	00050663          	beqz	a0,483c <move_window+0x4c>
    4834:	00100513          	li	a0,1
    4838:	fff00493          	li	s1,-1
    483c:	02942423          	sw	s1,40(s0)
    4840:	00c12083          	lw	ra,12(sp)
    4844:	00812403          	lw	s0,8(sp)
    4848:	00412483          	lw	s1,4(sp)
    484c:	01010113          	addi	sp,sp,16
    4850:	00008067          	ret
    4854:	00000513          	li	a0,0
    4858:	00008067          	ret

0000485c <get_fat.isra.0>:
    485c:	00100793          	li	a5,1
    4860:	14b7f263          	bgeu	a5,a1,49a4 <get_fat.isra.0+0x148>
    4864:	01052703          	lw	a4,16(a0)
    4868:	fe010113          	addi	sp,sp,-32
    486c:	00812c23          	sw	s0,24(sp)
    4870:	00912a23          	sw	s1,20(sp)
    4874:	00112e23          	sw	ra,28(sp)
    4878:	01212823          	sw	s2,16(sp)
    487c:	01312623          	sw	s3,12(sp)
    4880:	00050493          	mv	s1,a0
    4884:	00058413          	mv	s0,a1
    4888:	02e5fe63          	bgeu	a1,a4,48c4 <get_fat.isra.0+0x68>
    488c:	00054703          	lbu	a4,0(a0)
    4890:	00200693          	li	a3,2
    4894:	0ad70463          	beq	a4,a3,493c <get_fat.isra.0+0xe0>
    4898:	00300693          	li	a3,3
    489c:	0cd70c63          	beq	a4,a3,4974 <get_fat.isra.0+0x118>
    48a0:	02f71263          	bne	a4,a5,48c4 <get_fat.isra.0+0x68>
    48a4:	0015d913          	srli	s2,a1,0x1
    48a8:	01c52783          	lw	a5,28(a0)
    48ac:	00b90933          	add	s2,s2,a1
    48b0:	00995593          	srli	a1,s2,0x9
    48b4:	00f585b3          	add	a1,a1,a5
    48b8:	f39ff0ef          	jal	ra,47f0 <move_window>
    48bc:	02050463          	beqz	a0,48e4 <get_fat.isra.0+0x88>
    48c0:	fff00793          	li	a5,-1
    48c4:	01c12083          	lw	ra,28(sp)
    48c8:	01812403          	lw	s0,24(sp)
    48cc:	01412483          	lw	s1,20(sp)
    48d0:	01012903          	lw	s2,16(sp)
    48d4:	00c12983          	lw	s3,12(sp)
    48d8:	00078513          	mv	a0,a5
    48dc:	02010113          	addi	sp,sp,32
    48e0:	00008067          	ret
    48e4:	01c4a783          	lw	a5,28(s1)
    48e8:	00190993          	addi	s3,s2,1
    48ec:	0099d593          	srli	a1,s3,0x9
    48f0:	1ff97913          	andi	s2,s2,511
    48f4:	01248933          	add	s2,s1,s2
    48f8:	00f585b3          	add	a1,a1,a5
    48fc:	00048513          	mv	a0,s1
    4900:	02c94903          	lbu	s2,44(s2)
    4904:	eedff0ef          	jal	ra,47f0 <move_window>
    4908:	fa051ce3          	bnez	a0,48c0 <get_fat.isra.0+0x64>
    490c:	1ff9f993          	andi	s3,s3,511
    4910:	013484b3          	add	s1,s1,s3
    4914:	02c4c783          	lbu	a5,44(s1)
    4918:	00147413          	andi	s0,s0,1
    491c:	00879793          	slli	a5,a5,0x8
    4920:	0127e7b3          	or	a5,a5,s2
    4924:	00040663          	beqz	s0,4930 <get_fat.isra.0+0xd4>
    4928:	0047d793          	srli	a5,a5,0x4
    492c:	f99ff06f          	j	48c4 <get_fat.isra.0+0x68>
    4930:	01479793          	slli	a5,a5,0x14
    4934:	0147d793          	srli	a5,a5,0x14
    4938:	f8dff06f          	j	48c4 <get_fat.isra.0+0x68>
    493c:	01c52783          	lw	a5,28(a0)
    4940:	0085d593          	srli	a1,a1,0x8
    4944:	00f585b3          	add	a1,a1,a5
    4948:	ea9ff0ef          	jal	ra,47f0 <move_window>
    494c:	f6051ae3          	bnez	a0,48c0 <get_fat.isra.0+0x64>
    4950:	00141413          	slli	s0,s0,0x1
    4954:	02c48493          	addi	s1,s1,44
    4958:	1fe47413          	andi	s0,s0,510
    495c:	008484b3          	add	s1,s1,s0
    4960:	0014c783          	lbu	a5,1(s1)
    4964:	0004c503          	lbu	a0,0(s1)
    4968:	00879793          	slli	a5,a5,0x8
    496c:	00a7e7b3          	or	a5,a5,a0
    4970:	f55ff06f          	j	48c4 <get_fat.isra.0+0x68>
    4974:	01c52783          	lw	a5,28(a0)
    4978:	0075d593          	srli	a1,a1,0x7
    497c:	00f585b3          	add	a1,a1,a5
    4980:	e71ff0ef          	jal	ra,47f0 <move_window>
    4984:	f2051ee3          	bnez	a0,48c0 <get_fat.isra.0+0x64>
    4988:	00241413          	slli	s0,s0,0x2
    498c:	02c48513          	addi	a0,s1,44
    4990:	1fc47413          	andi	s0,s0,508
    4994:	00850533          	add	a0,a0,s0
    4998:	d09ff0ef          	jal	ra,46a0 <ld_dword>
    499c:	00451793          	slli	a5,a0,0x4
    49a0:	f89ff06f          	j	4928 <get_fat.isra.0+0xcc>
    49a4:	00100793          	li	a5,1
    49a8:	00078513          	mv	a0,a5
    49ac:	00008067          	ret

000049b0 <dir_next.isra.0>:
    49b0:	fe010113          	addi	sp,sp,-32
    49b4:	01212823          	sw	s2,16(sp)
    49b8:	01052903          	lw	s2,16(a0)
    49bc:	00812c23          	sw	s0,24(sp)
    49c0:	00912a23          	sw	s1,20(sp)
    49c4:	00112e23          	sw	ra,28(sp)
    49c8:	01312623          	sw	s3,12(sp)
    49cc:	02090913          	addi	s2,s2,32
    49d0:	002007b7          	lui	a5,0x200
    49d4:	00052483          	lw	s1,0(a0)
    49d8:	00050413          	mv	s0,a0
    49dc:	00f96463          	bltu	s2,a5,49e4 <dir_next.isra.0+0x34>
    49e0:	00052c23          	sw	zero,24(a0)
    49e4:	01842783          	lw	a5,24(s0)
    49e8:	00400513          	li	a0,4
    49ec:	02078863          	beqz	a5,4a1c <dir_next.isra.0+0x6c>
    49f0:	1ff97993          	andi	s3,s2,511
    49f4:	08099a63          	bnez	s3,4a88 <dir_next.isra.0+0xd8>
    49f8:	01442583          	lw	a1,20(s0)
    49fc:	00178793          	addi	a5,a5,1 # 200001 <_edata_rom+0x1f7795>
    4a00:	00f42c23          	sw	a5,24(s0)
    4a04:	02059a63          	bnez	a1,4a38 <dir_next.isra.0+0x88>
    4a08:	0084d703          	lhu	a4,8(s1)
    4a0c:	00595793          	srli	a5,s2,0x5
    4a10:	06e7ec63          	bltu	a5,a4,4a88 <dir_next.isra.0+0xd8>
    4a14:	00042c23          	sw	zero,24(s0)
    4a18:	00400513          	li	a0,4
    4a1c:	01c12083          	lw	ra,28(sp)
    4a20:	01812403          	lw	s0,24(sp)
    4a24:	01412483          	lw	s1,20(sp)
    4a28:	01012903          	lw	s2,16(sp)
    4a2c:	00c12983          	lw	s3,12(sp)
    4a30:	02010113          	addi	sp,sp,32
    4a34:	00008067          	ret
    4a38:	00a4d783          	lhu	a5,10(s1)
    4a3c:	00995713          	srli	a4,s2,0x9
    4a40:	fff78793          	addi	a5,a5,-1
    4a44:	00e7f7b3          	and	a5,a5,a4
    4a48:	04079063          	bnez	a5,4a88 <dir_next.isra.0+0xd8>
    4a4c:	00048513          	mv	a0,s1
    4a50:	e0dff0ef          	jal	ra,485c <get_fat.isra.0>
    4a54:	00050593          	mv	a1,a0
    4a58:	00100793          	li	a5,1
    4a5c:	00200513          	li	a0,2
    4a60:	fab7fee3          	bgeu	a5,a1,4a1c <dir_next.isra.0+0x6c>
    4a64:	fff00793          	li	a5,-1
    4a68:	00100513          	li	a0,1
    4a6c:	faf588e3          	beq	a1,a5,4a1c <dir_next.isra.0+0x6c>
    4a70:	0104a783          	lw	a5,16(s1)
    4a74:	faf5f0e3          	bgeu	a1,a5,4a14 <dir_next.isra.0+0x64>
    4a78:	00b42a23          	sw	a1,20(s0)
    4a7c:	00048513          	mv	a0,s1
    4a80:	c75ff0ef          	jal	ra,46f4 <clst2sect>
    4a84:	00a42c23          	sw	a0,24(s0)
    4a88:	02c48493          	addi	s1,s1,44
    4a8c:	013484b3          	add	s1,s1,s3
    4a90:	01242823          	sw	s2,16(s0)
    4a94:	00942e23          	sw	s1,28(s0)
    4a98:	00000513          	li	a0,0
    4a9c:	f81ff06f          	j	4a1c <dir_next.isra.0+0x6c>

00004aa0 <ld_clust.isra.0>:
    4aa0:	01b5c783          	lbu	a5,27(a1)
    4aa4:	01a5c703          	lbu	a4,26(a1)
    4aa8:	00879793          	slli	a5,a5,0x8
    4aac:	00e7e7b3          	or	a5,a5,a4
    4ab0:	00300713          	li	a4,3
    4ab4:	00e51e63          	bne	a0,a4,4ad0 <ld_clust.isra.0+0x30>
    4ab8:	0155c703          	lbu	a4,21(a1)
    4abc:	0145c683          	lbu	a3,20(a1)
    4ac0:	00871713          	slli	a4,a4,0x8
    4ac4:	00d76733          	or	a4,a4,a3
    4ac8:	01071713          	slli	a4,a4,0x10
    4acc:	00e7e7b3          	or	a5,a5,a4
    4ad0:	00078513          	mv	a0,a5
    4ad4:	00008067          	ret

00004ad8 <check_fs>:
    4ad8:	ff010113          	addi	sp,sp,-16
    4adc:	00812423          	sw	s0,8(sp)
    4ae0:	00912223          	sw	s1,4(sp)
    4ae4:	00112623          	sw	ra,12(sp)
    4ae8:	fff00793          	li	a5,-1
    4aec:	000501a3          	sb	zero,3(a0)
    4af0:	02f52423          	sw	a5,40(a0)
    4af4:	00050413          	mv	s0,a0
    4af8:	cf9ff0ef          	jal	ra,47f0 <move_window>
    4afc:	00400493          	li	s1,4
    4b00:	06051e63          	bnez	a0,4b7c <check_fs+0xa4>
    4b04:	22b44783          	lbu	a5,555(s0)
    4b08:	22a44703          	lbu	a4,554(s0)
    4b0c:	00300493          	li	s1,3
    4b10:	00879793          	slli	a5,a5,0x8
    4b14:	00e7e7b3          	or	a5,a5,a4
    4b18:	01079793          	slli	a5,a5,0x10
    4b1c:	ffffb737          	lui	a4,0xffffb
    4b20:	4107d793          	srai	a5,a5,0x10
    4b24:	a5570713          	addi	a4,a4,-1451 # ffffaa55 <_fstack+0xefff9a55>
    4b28:	04e79a63          	bne	a5,a4,4b7c <check_fs+0xa4>
    4b2c:	02c44783          	lbu	a5,44(s0)
    4b30:	0eb00713          	li	a4,235
    4b34:	00050493          	mv	s1,a0
    4b38:	00e78a63          	beq	a5,a4,4b4c <check_fs+0x74>
    4b3c:	01878793          	addi	a5,a5,24
    4b40:	0ff7f793          	andi	a5,a5,255
    4b44:	00100713          	li	a4,1
    4b48:	04f76663          	bltu	a4,a5,4b94 <check_fs+0xbc>
    4b4c:	000085b7          	lui	a1,0x8
    4b50:	00300613          	li	a2,3
    4b54:	53858593          	addi	a1,a1,1336 # 8538 <cvt2.1220+0xbc>
    4b58:	06240513          	addi	a0,s0,98
    4b5c:	b71ff0ef          	jal	ra,46cc <mem_cmp>
    4b60:	00050e63          	beqz	a0,4b7c <check_fs+0xa4>
    4b64:	000085b7          	lui	a1,0x8
    4b68:	00500613          	li	a2,5
    4b6c:	53c58593          	addi	a1,a1,1340 # 853c <cvt2.1220+0xc0>
    4b70:	07e40513          	addi	a0,s0,126
    4b74:	b59ff0ef          	jal	ra,46cc <mem_cmp>
    4b78:	00051e63          	bnez	a0,4b94 <check_fs+0xbc>
    4b7c:	00c12083          	lw	ra,12(sp)
    4b80:	00812403          	lw	s0,8(sp)
    4b84:	00048513          	mv	a0,s1
    4b88:	00412483          	lw	s1,4(sp)
    4b8c:	01010113          	addi	sp,sp,16
    4b90:	00008067          	ret
    4b94:	00200493          	li	s1,2
    4b98:	fe5ff06f          	j	4b7c <check_fs+0xa4>

00004b9c <mount_volume.isra.0>:
    4b9c:	fd010113          	addi	sp,sp,-48
    4ba0:	03212023          	sw	s2,32(sp)
    4ba4:	02112623          	sw	ra,44(sp)
    4ba8:	02812423          	sw	s0,40(sp)
    4bac:	02912223          	sw	s1,36(sp)
    4bb0:	01312e23          	sw	s3,28(sp)
    4bb4:	01412c23          	sw	s4,24(sp)
    4bb8:	01512a23          	sw	s5,20(sp)
    4bbc:	01612823          	sw	s6,16(sp)
    4bc0:	0005a023          	sw	zero,0(a1)
    4bc4:	00058913          	mv	s2,a1
    4bc8:	b59ff0ef          	jal	ra,4720 <get_ldnumber>
    4bcc:	30054863          	bltz	a0,4edc <mount_volume.isra.0+0x340>
    4bd0:	10000737          	lui	a4,0x10000
    4bd4:	00251793          	slli	a5,a0,0x2
    4bd8:	19470713          	addi	a4,a4,404 # 10000194 <FatFs>
    4bdc:	00e787b3          	add	a5,a5,a4
    4be0:	0007a403          	lw	s0,0(a5)
    4be4:	00050493          	mv	s1,a0
    4be8:	00c00513          	li	a0,12
    4bec:	02040c63          	beqz	s0,4c24 <mount_volume.isra.0+0x88>
    4bf0:	00892023          	sw	s0,0(s2)
    4bf4:	00044783          	lbu	a5,0(s0)
    4bf8:	10000937          	lui	s2,0x10000
    4bfc:	04079863          	bnez	a5,4c4c <mount_volume.isra.0+0xb0>
    4c00:	0ff4f513          	andi	a0,s1,255
    4c04:	00040023          	sb	zero,0(s0)
    4c08:	00a400a3          	sb	a0,1(s0)
    4c0c:	4b892783          	lw	a5,1208(s2) # 100004b8 <FfDiskOps>
    4c10:	0007a783          	lw	a5,0(a5)
    4c14:	000780e7          	jalr	a5
    4c18:	00157793          	andi	a5,a0,1
    4c1c:	00300513          	li	a0,3
    4c20:	04078663          	beqz	a5,4c6c <mount_volume.isra.0+0xd0>
    4c24:	02c12083          	lw	ra,44(sp)
    4c28:	02812403          	lw	s0,40(sp)
    4c2c:	02412483          	lw	s1,36(sp)
    4c30:	02012903          	lw	s2,32(sp)
    4c34:	01c12983          	lw	s3,28(sp)
    4c38:	01812a03          	lw	s4,24(sp)
    4c3c:	01412a83          	lw	s5,20(sp)
    4c40:	01012b03          	lw	s6,16(sp)
    4c44:	03010113          	addi	sp,sp,48
    4c48:	00008067          	ret
    4c4c:	4b892783          	lw	a5,1208(s2)
    4c50:	00144503          	lbu	a0,1(s0)
    4c54:	0047a783          	lw	a5,4(a5)
    4c58:	000780e7          	jalr	a5
    4c5c:	00157793          	andi	a5,a0,1
    4c60:	00000513          	li	a0,0
    4c64:	f8079ee3          	bnez	a5,4c00 <mount_volume.isra.0+0x64>
    4c68:	fbdff06f          	j	4c24 <mount_volume.isra.0+0x88>
    4c6c:	00000593          	li	a1,0
    4c70:	00040513          	mv	a0,s0
    4c74:	e65ff0ef          	jal	ra,4ad8 <check_fs>
    4c78:	00200713          	li	a4,2
    4c7c:	00050793          	mv	a5,a0
    4c80:	06e51663          	bne	a0,a4,4cec <mount_volume.isra.0+0x150>
    4c84:	00010493          	mv	s1,sp
    4c88:	1f240913          	addi	s2,s0,498
    4c8c:	23240a13          	addi	s4,s0,562
    4c90:	00048993          	mv	s3,s1
    4c94:	00090513          	mv	a0,s2
    4c98:	a09ff0ef          	jal	ra,46a0 <ld_dword>
    4c9c:	00a9a023          	sw	a0,0(s3)
    4ca0:	01090913          	addi	s2,s2,16
    4ca4:	00498993          	addi	s3,s3,4
    4ca8:	ff2a16e3          	bne	s4,s2,4c94 <mount_volume.isra.0+0xf8>
    4cac:	01048913          	addi	s2,s1,16
    4cb0:	00100993          	li	s3,1
    4cb4:	0004a583          	lw	a1,0(s1)
    4cb8:	00300793          	li	a5,3
    4cbc:	00058a63          	beqz	a1,4cd0 <mount_volume.isra.0+0x134>
    4cc0:	00040513          	mv	a0,s0
    4cc4:	e15ff0ef          	jal	ra,4ad8 <check_fs>
    4cc8:	00050793          	mv	a5,a0
    4ccc:	02a9fa63          	bgeu	s3,a0,4d00 <mount_volume.isra.0+0x164>
    4cd0:	00448493          	addi	s1,s1,4
    4cd4:	fe9910e3          	bne	s2,s1,4cb4 <mount_volume.isra.0+0x118>
    4cd8:	00400713          	li	a4,4
    4cdc:	00100513          	li	a0,1
    4ce0:	f4e782e3          	beq	a5,a4,4c24 <mount_volume.isra.0+0x88>
    4ce4:	00d00513          	li	a0,13
    4ce8:	f3dff06f          	j	4c24 <mount_volume.isra.0+0x88>
    4cec:	00400713          	li	a4,4
    4cf0:	00100513          	li	a0,1
    4cf4:	f2e788e3          	beq	a5,a4,4c24 <mount_volume.isra.0+0x88>
    4cf8:	00100713          	li	a4,1
    4cfc:	fef764e3          	bltu	a4,a5,4ce4 <mount_volume.isra.0+0x148>
    4d00:	03844783          	lbu	a5,56(s0)
    4d04:	03744703          	lbu	a4,55(s0)
    4d08:	00879793          	slli	a5,a5,0x8
    4d0c:	00e7e7b3          	or	a5,a5,a4
    4d10:	01079793          	slli	a5,a5,0x10
    4d14:	4107d793          	srai	a5,a5,0x10
    4d18:	20000713          	li	a4,512
    4d1c:	fce794e3          	bne	a5,a4,4ce4 <mount_volume.isra.0+0x148>
    4d20:	04344903          	lbu	s2,67(s0)
    4d24:	04244503          	lbu	a0,66(s0)
    4d28:	00891913          	slli	s2,s2,0x8
    4d2c:	00a96933          	or	s2,s2,a0
    4d30:	00091863          	bnez	s2,4d40 <mount_volume.isra.0+0x1a4>
    4d34:	05040513          	addi	a0,s0,80
    4d38:	969ff0ef          	jal	ra,46a0 <ld_dword>
    4d3c:	00050913          	mv	s2,a0
    4d40:	03c44483          	lbu	s1,60(s0)
    4d44:	01242a23          	sw	s2,20(s0)
    4d48:	00100713          	li	a4,1
    4d4c:	fff48793          	addi	a5,s1,-1
    4d50:	00940123          	sb	s1,2(s0)
    4d54:	0ff7f793          	andi	a5,a5,255
    4d58:	02842b03          	lw	s6,40(s0)
    4d5c:	f8f764e3          	bltu	a4,a5,4ce4 <mount_volume.isra.0+0x148>
    4d60:	03944a03          	lbu	s4,57(s0)
    4d64:	010a1793          	slli	a5,s4,0x10
    4d68:	0107d793          	srli	a5,a5,0x10
    4d6c:	00f41523          	sh	a5,10(s0)
    4d70:	f6078ae3          	beqz	a5,4ce4 <mount_volume.isra.0+0x148>
    4d74:	fffa0793          	addi	a5,s4,-1
    4d78:	0147f7b3          	and	a5,a5,s4
    4d7c:	f60794e3          	bnez	a5,4ce4 <mount_volume.isra.0+0x148>
    4d80:	03e44983          	lbu	s3,62(s0)
    4d84:	03d44783          	lbu	a5,61(s0)
    4d88:	00899993          	slli	s3,s3,0x8
    4d8c:	00f9e9b3          	or	s3,s3,a5
    4d90:	01099a93          	slli	s5,s3,0x10
    4d94:	01099993          	slli	s3,s3,0x10
    4d98:	0109d993          	srli	s3,s3,0x10
    4d9c:	01341423          	sh	s3,8(s0)
    4da0:	00f9f793          	andi	a5,s3,15
    4da4:	410ada93          	srai	s5,s5,0x10
    4da8:	f2079ee3          	bnez	a5,4ce4 <mount_volume.isra.0+0x148>
    4dac:	04044783          	lbu	a5,64(s0)
    4db0:	03f44503          	lbu	a0,63(s0)
    4db4:	00879793          	slli	a5,a5,0x8
    4db8:	00a7e533          	or	a0,a5,a0
    4dbc:	00051663          	bnez	a0,4dc8 <mount_volume.isra.0+0x22c>
    4dc0:	04c40513          	addi	a0,s0,76
    4dc4:	8ddff0ef          	jal	ra,46a0 <ld_dword>
    4dc8:	03b44703          	lbu	a4,59(s0)
    4dcc:	03a44783          	lbu	a5,58(s0)
    4dd0:	00871713          	slli	a4,a4,0x8
    4dd4:	00f76733          	or	a4,a4,a5
    4dd8:	f00706e3          	beqz	a4,4ce4 <mount_volume.isra.0+0x148>
    4ddc:	03248633          	mul	a2,s1,s2
    4de0:	0049d693          	srli	a3,s3,0x4
    4de4:	00e686b3          	add	a3,a3,a4
    4de8:	00c686b3          	add	a3,a3,a2
    4dec:	eed56ce3          	bltu	a0,a3,4ce4 <mount_volume.isra.0+0x148>
    4df0:	40d507b3          	sub	a5,a0,a3
    4df4:	0347d4b3          	divu	s1,a5,s4
    4df8:	ef47e6e3          	bltu	a5,s4,4ce4 <mount_volume.isra.0+0x148>
    4dfc:	100007b7          	lui	a5,0x10000
    4e00:	ff578793          	addi	a5,a5,-11 # ffffff5 <_edata_rom+0xfff7789>
    4e04:	ee97e0e3          	bltu	a5,s1,4ce4 <mount_volume.isra.0+0x148>
    4e08:	000107b7          	lui	a5,0x10
    4e0c:	ff578793          	addi	a5,a5,-11 # fff5 <_edata_rom+0x7789>
    4e10:	0c97fa63          	bgeu	a5,s1,4ee4 <mount_volume.isra.0+0x348>
    4e14:	00300a13          	li	s4,3
    4e18:	00248493          	addi	s1,s1,2
    4e1c:	00eb0733          	add	a4,s6,a4
    4e20:	00db06b3          	add	a3,s6,a3
    4e24:	00942823          	sw	s1,16(s0)
    4e28:	01642c23          	sw	s6,24(s0)
    4e2c:	00e42e23          	sw	a4,28(s0)
    4e30:	02d42223          	sw	a3,36(s0)
    4e34:	00300793          	li	a5,3
    4e38:	06fa1a63          	bne	s4,a5,4eac <mount_volume.isra.0+0x310>
    4e3c:	05744783          	lbu	a5,87(s0)
    4e40:	05644703          	lbu	a4,86(s0)
    4e44:	00879793          	slli	a5,a5,0x8
    4e48:	00e7e7b3          	or	a5,a5,a4
    4e4c:	00fae7b3          	or	a5,s5,a5
    4e50:	01079793          	slli	a5,a5,0x10
    4e54:	4107d793          	srai	a5,a5,0x10
    4e58:	e80796e3          	bnez	a5,4ce4 <mount_volume.isra.0+0x148>
    4e5c:	05840513          	addi	a0,s0,88
    4e60:	841ff0ef          	jal	ra,46a0 <ld_dword>
    4e64:	02a42023          	sw	a0,32(s0)
    4e68:	00249493          	slli	s1,s1,0x2
    4e6c:	1ff48493          	addi	s1,s1,511
    4e70:	0094d493          	srli	s1,s1,0x9
    4e74:	e69968e3          	bltu	s2,s1,4ce4 <mount_volume.isra.0+0x148>
    4e78:	10000737          	lui	a4,0x10000
    4e7c:	19075783          	lhu	a5,400(a4) # 10000190 <Fsid>
    4e80:	01440023          	sb	s4,0(s0)
    4e84:	00000513          	li	a0,0
    4e88:	00178793          	addi	a5,a5,1
    4e8c:	01079793          	slli	a5,a5,0x10
    4e90:	0107d793          	srli	a5,a5,0x10
    4e94:	18f71823          	sh	a5,400(a4)
    4e98:	00f41323          	sh	a5,6(s0)
    4e9c:	100007b7          	lui	a5,0x10000
    4ea0:	2ac78793          	addi	a5,a5,684 # 100002ac <LfnBuf>
    4ea4:	00f42623          	sw	a5,12(s0)
    4ea8:	d7dff06f          	j	4c24 <mount_volume.isra.0+0x88>
    4eac:	e2098ce3          	beqz	s3,4ce4 <mount_volume.isra.0+0x148>
    4eb0:	00e60733          	add	a4,a2,a4
    4eb4:	02e42023          	sw	a4,32(s0)
    4eb8:	00200713          	li	a4,2
    4ebc:	00ea1663          	bne	s4,a4,4ec8 <mount_volume.isra.0+0x32c>
    4ec0:	00149493          	slli	s1,s1,0x1
    4ec4:	fa9ff06f          	j	4e6c <mount_volume.isra.0+0x2d0>
    4ec8:	02f487b3          	mul	a5,s1,a5
    4ecc:	0014f493          	andi	s1,s1,1
    4ed0:	0017d793          	srli	a5,a5,0x1
    4ed4:	009784b3          	add	s1,a5,s1
    4ed8:	f95ff06f          	j	4e6c <mount_volume.isra.0+0x2d0>
    4edc:	00b00513          	li	a0,11
    4ee0:	d45ff06f          	j	4c24 <mount_volume.isra.0+0x88>
    4ee4:	00001a37          	lui	s4,0x1
    4ee8:	ff5a0a13          	addi	s4,s4,-11 # ff5 <dump_bytes+0x75>
    4eec:	009a3a33          	sltu	s4,s4,s1
    4ef0:	001a0a13          	addi	s4,s4,1
    4ef4:	f25ff06f          	j	4e18 <mount_volume.isra.0+0x27c>

00004ef8 <dir_sdi.constprop.0>:
    4ef8:	fd010113          	addi	sp,sp,-48
    4efc:	00852583          	lw	a1,8(a0)
    4f00:	02812423          	sw	s0,40(sp)
    4f04:	02912223          	sw	s1,36(sp)
    4f08:	02112623          	sw	ra,44(sp)
    4f0c:	03212023          	sw	s2,32(sp)
    4f10:	01312e23          	sw	s3,28(sp)
    4f14:	00052823          	sw	zero,16(a0)
    4f18:	00052483          	lw	s1,0(a0)
    4f1c:	00050413          	mv	s0,a0
    4f20:	06059463          	bnez	a1,4f88 <dir_sdi.constprop.0+0x90>
    4f24:	0004c703          	lbu	a4,0(s1)
    4f28:	00200793          	li	a5,2
    4f2c:	00e7f663          	bgeu	a5,a4,4f38 <dir_sdi.constprop.0+0x40>
    4f30:	0204a783          	lw	a5,32(s1)
    4f34:	04079863          	bnez	a5,4f84 <dir_sdi.constprop.0+0x8c>
    4f38:	0084d783          	lhu	a5,8(s1)
    4f3c:	02079263          	bnez	a5,4f60 <dir_sdi.constprop.0+0x68>
    4f40:	00200513          	li	a0,2
    4f44:	02c12083          	lw	ra,44(sp)
    4f48:	02812403          	lw	s0,40(sp)
    4f4c:	02412483          	lw	s1,36(sp)
    4f50:	02012903          	lw	s2,32(sp)
    4f54:	01c12983          	lw	s3,28(sp)
    4f58:	03010113          	addi	sp,sp,48
    4f5c:	00008067          	ret
    4f60:	0204a783          	lw	a5,32(s1)
    4f64:	00f42c23          	sw	a5,24(s0)
    4f68:	01842783          	lw	a5,24(s0)
    4f6c:	00b42a23          	sw	a1,20(s0)
    4f70:	fc0788e3          	beqz	a5,4f40 <dir_sdi.constprop.0+0x48>
    4f74:	02c48493          	addi	s1,s1,44
    4f78:	00942e23          	sw	s1,28(s0)
    4f7c:	00000513          	li	a0,0
    4f80:	fc5ff06f          	j	4f44 <dir_sdi.constprop.0+0x4c>
    4f84:	00078593          	mv	a1,a5
    4f88:	00a4d783          	lhu	a5,10(s1)
    4f8c:	fff00913          	li	s2,-1
    4f90:	00100993          	li	s3,1
    4f94:	02079263          	bnez	a5,4fb8 <dir_sdi.constprop.0+0xc0>
    4f98:	00042503          	lw	a0,0(s0)
    4f9c:	8c1ff0ef          	jal	ra,485c <get_fat.isra.0>
    4fa0:	00050593          	mv	a1,a0
    4fa4:	03250663          	beq	a0,s2,4fd0 <dir_sdi.constprop.0+0xd8>
    4fa8:	f8a9fce3          	bgeu	s3,a0,4f40 <dir_sdi.constprop.0+0x48>
    4fac:	0104a783          	lw	a5,16(s1)
    4fb0:	fef564e3          	bltu	a0,a5,4f98 <dir_sdi.constprop.0+0xa0>
    4fb4:	f8dff06f          	j	4f40 <dir_sdi.constprop.0+0x48>
    4fb8:	00048513          	mv	a0,s1
    4fbc:	00b12623          	sw	a1,12(sp)
    4fc0:	f34ff0ef          	jal	ra,46f4 <clst2sect>
    4fc4:	00c12583          	lw	a1,12(sp)
    4fc8:	00a42c23          	sw	a0,24(s0)
    4fcc:	f9dff06f          	j	4f68 <dir_sdi.constprop.0+0x70>
    4fd0:	00100513          	li	a0,1
    4fd4:	f71ff06f          	j	4f44 <dir_sdi.constprop.0+0x4c>

00004fd8 <follow_path>:
    4fd8:	fb010113          	addi	sp,sp,-80
    4fdc:	03712623          	sw	s7,44(sp)
    4fe0:	00052b83          	lw	s7,0(a0)
    4fe4:	04812423          	sw	s0,72(sp)
    4fe8:	05212023          	sw	s2,64(sp)
    4fec:	04112623          	sw	ra,76(sp)
    4ff0:	04912223          	sw	s1,68(sp)
    4ff4:	03312e23          	sw	s3,60(sp)
    4ff8:	03412c23          	sw	s4,56(sp)
    4ffc:	03512a23          	sw	s5,52(sp)
    5000:	03612823          	sw	s6,48(sp)
    5004:	03812423          	sw	s8,40(sp)
    5008:	03912223          	sw	s9,36(sp)
    500c:	03a12023          	sw	s10,32(sp)
    5010:	01b12e23          	sw	s11,28(sp)
    5014:	00050413          	mv	s0,a0
    5018:	00058913          	mv	s2,a1
    501c:	02f00693          	li	a3,47
    5020:	05c00713          	li	a4,92
    5024:	00094783          	lbu	a5,0(s2)
    5028:	06d78e63          	beq	a5,a3,50a4 <follow_path+0xcc>
    502c:	06e78c63          	beq	a5,a4,50a4 <follow_path+0xcc>
    5030:	00042423          	sw	zero,8(s0)
    5034:	00094703          	lbu	a4,0(s2)
    5038:	01f00793          	li	a5,31
    503c:	06e7f863          	bgeu	a5,a4,50ac <follow_path+0xd4>
    5040:	000089b7          	lui	s3,0x8
    5044:	00010ab7          	lui	s5,0x10
    5048:	55898993          	addi	s3,s3,1368 # 8558 <ExCvt>
    504c:	fffa8a93          	addi	s5,s5,-1 # ffff <_edata_rom+0x7793>
    5050:	00042783          	lw	a5,0(s0)
    5054:	00000b13          	li	s6,0
    5058:	01f00493          	li	s1,31
    505c:	00c7ac83          	lw	s9,12(a5)
    5060:	02f00a13          	li	s4,47
    5064:	05c00c13          	li	s8,92
    5068:	07f00d13          	li	s10,127
    506c:	00008db7          	lui	s11,0x8
    5070:	00094503          	lbu	a0,0(s2)
    5074:	00190913          	addi	s2,s2,1
    5078:	1c050a63          	beqz	a0,524c <follow_path+0x274>
    507c:	1b500593          	li	a1,437
    5080:	cfcff0ef          	jal	ra,457c <ff_oem2uni>
    5084:	08050063          	beqz	a0,5104 <follow_path+0x12c>
    5088:	1ca4f263          	bgeu	s1,a0,524c <follow_path+0x274>
    508c:	1b450a63          	beq	a0,s4,5240 <follow_path+0x268>
    5090:	1b850863          	beq	a0,s8,5240 <follow_path+0x268>
    5094:	0ff00613          	li	a2,255
    5098:	0aad6863          	bltu	s10,a0,5148 <follow_path+0x170>
    509c:	544d8793          	addi	a5,s11,1348 # 8544 <cvt2.1220+0xc8>
    50a0:	0580006f          	j	50f8 <follow_path+0x120>
    50a4:	00190913          	addi	s2,s2,1
    50a8:	f7dff06f          	j	5024 <follow_path+0x4c>
    50ac:	f8000793          	li	a5,-128
    50b0:	02f405a3          	sb	a5,43(s0)
    50b4:	00040513          	mv	a0,s0
    50b8:	04812403          	lw	s0,72(sp)
    50bc:	04c12083          	lw	ra,76(sp)
    50c0:	04412483          	lw	s1,68(sp)
    50c4:	04012903          	lw	s2,64(sp)
    50c8:	03c12983          	lw	s3,60(sp)
    50cc:	03812a03          	lw	s4,56(sp)
    50d0:	03412a83          	lw	s5,52(sp)
    50d4:	03012b03          	lw	s6,48(sp)
    50d8:	02c12b83          	lw	s7,44(sp)
    50dc:	02812c03          	lw	s8,40(sp)
    50e0:	02412c83          	lw	s9,36(sp)
    50e4:	02012d03          	lw	s10,32(sp)
    50e8:	01c12d83          	lw	s11,28(sp)
    50ec:	05010113          	addi	sp,sp,80
    50f0:	e09ff06f          	j	4ef8 <dir_sdi.constprop.0>
    50f4:	00178793          	addi	a5,a5,1
    50f8:	0007c703          	lbu	a4,0(a5)
    50fc:	04070663          	beqz	a4,5148 <follow_path+0x170>
    5100:	fee51ae3          	bne	a0,a4,50f4 <follow_path+0x11c>
    5104:	00600493          	li	s1,6
    5108:	04c12083          	lw	ra,76(sp)
    510c:	04812403          	lw	s0,72(sp)
    5110:	04012903          	lw	s2,64(sp)
    5114:	03c12983          	lw	s3,60(sp)
    5118:	03812a03          	lw	s4,56(sp)
    511c:	03412a83          	lw	s5,52(sp)
    5120:	03012b03          	lw	s6,48(sp)
    5124:	02c12b83          	lw	s7,44(sp)
    5128:	02812c03          	lw	s8,40(sp)
    512c:	02412c83          	lw	s9,36(sp)
    5130:	02012d03          	lw	s10,32(sp)
    5134:	01c12d83          	lw	s11,28(sp)
    5138:	00048513          	mv	a0,s1
    513c:	04412483          	lw	s1,68(sp)
    5140:	05010113          	addi	sp,sp,80
    5144:	00008067          	ret
    5148:	facb0ee3          	beq	s6,a2,5104 <follow_path+0x12c>
    514c:	001b1793          	slli	a5,s6,0x1
    5150:	00fc87b3          	add	a5,s9,a5
    5154:	00a79023          	sh	a0,0(a5)
    5158:	001b0b13          	addi	s6,s6,1
    515c:	f15ff06f          	j	5070 <follow_path+0x98>
    5160:	00190913          	addi	s2,s2,1
    5164:	00094783          	lbu	a5,0(s2)
    5168:	fec78ce3          	beq	a5,a2,5160 <follow_path+0x188>
    516c:	fee78ae3          	beq	a5,a4,5160 <follow_path+0x188>
    5170:	00000493          	li	s1,0
    5174:	02000613          	li	a2,32
    5178:	02e00593          	li	a1,46
    517c:	001b1793          	slli	a5,s6,0x1
    5180:	0c0b1a63          	bnez	s6,5254 <follow_path+0x27c>
    5184:	00fc87b3          	add	a5,s9,a5
    5188:	00079023          	sh	zero,0(a5)
    518c:	f60b0ce3          	beqz	s6,5104 <follow_path+0x12c>
    5190:	00000713          	li	a4,0
    5194:	02000593          	li	a1,32
    5198:	00171793          	slli	a5,a4,0x1
    519c:	00fc87b3          	add	a5,s9,a5
    51a0:	0007d603          	lhu	a2,0(a5)
    51a4:	00070793          	mv	a5,a4
    51a8:	00170713          	addi	a4,a4,1
    51ac:	feb606e3          	beq	a2,a1,5198 <follow_path+0x1c0>
    51b0:	00079663          	bnez	a5,51bc <follow_path+0x1e4>
    51b4:	02e00713          	li	a4,46
    51b8:	00e61463          	bne	a2,a4,51c0 <follow_path+0x1e8>
    51bc:	0034e493          	ori	s1,s1,3
    51c0:	02e00613          	li	a2,46
    51c4:	001b1713          	slli	a4,s6,0x1
    51c8:	00ec8733          	add	a4,s9,a4
    51cc:	ffe75703          	lhu	a4,-2(a4)
    51d0:	00c70663          	beq	a4,a2,51dc <follow_path+0x204>
    51d4:	fffb0b13          	addi	s6,s6,-1
    51d8:	fe0b16e3          	bnez	s6,51c4 <follow_path+0x1ec>
    51dc:	02040c13          	addi	s8,s0,32
    51e0:	02b40613          	addi	a2,s0,43
    51e4:	000c0713          	mv	a4,s8
    51e8:	02000593          	li	a1,32
    51ec:	00170713          	addi	a4,a4,1
    51f0:	feb70fa3          	sb	a1,-1(a4)
    51f4:	fee61ce3          	bne	a2,a4,51ec <follow_path+0x214>
    51f8:	00800d93          	li	s11,8
    51fc:	00000d13          	li	s10,0
    5200:	00000a13          	li	s4,0
    5204:	02000813          	li	a6,32
    5208:	02e00893          	li	a7,46
    520c:	00b00613          	li	a2,11
    5210:	00008337          	lui	t1,0x8
    5214:	00178713          	addi	a4,a5,1
    5218:	00179793          	slli	a5,a5,0x1
    521c:	00fc87b3          	add	a5,s9,a5
    5220:	0007d503          	lhu	a0,0(a5)
    5224:	06050263          	beqz	a0,5288 <follow_path+0x2b0>
    5228:	01050663          	beq	a0,a6,5234 <follow_path+0x25c>
    522c:	05151063          	bne	a0,a7,526c <follow_path+0x294>
    5230:	05670263          	beq	a4,s6,5274 <follow_path+0x29c>
    5234:	0034e493          	ori	s1,s1,3
    5238:	00070793          	mv	a5,a4
    523c:	fd9ff06f          	j	5214 <follow_path+0x23c>
    5240:	02f00613          	li	a2,47
    5244:	05c00713          	li	a4,92
    5248:	f1dff06f          	j	5164 <follow_path+0x18c>
    524c:	00400493          	li	s1,4
    5250:	f25ff06f          	j	5174 <follow_path+0x19c>
    5254:	00fc8733          	add	a4,s9,a5
    5258:	ffe75703          	lhu	a4,-2(a4)
    525c:	00c70463          	beq	a4,a2,5264 <follow_path+0x28c>
    5260:	f2b712e3          	bne	a4,a1,5184 <follow_path+0x1ac>
    5264:	fffb0b13          	addi	s6,s6,-1
    5268:	f15ff06f          	j	517c <follow_path+0x1a4>
    526c:	01bd7863          	bgeu	s10,s11,527c <follow_path+0x2a4>
    5270:	11671c63          	bne	a4,s6,5388 <follow_path+0x3b0>
    5274:	0ecd9e63          	bne	s11,a2,5370 <follow_path+0x398>
    5278:	0080006f          	j	5280 <follow_path+0x2a8>
    527c:	0ecd9463          	bne	s11,a2,5364 <follow_path+0x38c>
    5280:	0034e493          	ori	s1,s1,3
    5284:	00b00d93          	li	s11,11
    5288:	02044703          	lbu	a4,32(s0)
    528c:	0e500793          	li	a5,229
    5290:	00f71663          	bne	a4,a5,529c <follow_path+0x2c4>
    5294:	00500793          	li	a5,5
    5298:	02f40023          	sb	a5,32(s0)
    529c:	00800793          	li	a5,8
    52a0:	00fd9663          	bne	s11,a5,52ac <follow_path+0x2d4>
    52a4:	002a1a13          	slli	s4,s4,0x2
    52a8:	0ffa7a13          	andi	s4,s4,255
    52ac:	00ca7793          	andi	a5,s4,12
    52b0:	00c00713          	li	a4,12
    52b4:	00e78863          	beq	a5,a4,52c4 <follow_path+0x2ec>
    52b8:	003a7793          	andi	a5,s4,3
    52bc:	00300713          	li	a4,3
    52c0:	00e79463          	bne	a5,a4,52c8 <follow_path+0x2f0>
    52c4:	0024e493          	ori	s1,s1,2
    52c8:	0024f793          	andi	a5,s1,2
    52cc:	00079e63          	bnez	a5,52e8 <follow_path+0x310>
    52d0:	001a7793          	andi	a5,s4,1
    52d4:	00078463          	beqz	a5,52dc <follow_path+0x304>
    52d8:	0104e493          	ori	s1,s1,16
    52dc:	004a7a13          	andi	s4,s4,4
    52e0:	000a0463          	beqz	s4,52e8 <follow_path+0x310>
    52e4:	0084e493          	ori	s1,s1,8
    52e8:	029405a3          	sb	s1,43(s0)
    52ec:	00040513          	mv	a0,s0
    52f0:	00042d03          	lw	s10,0(s0)
    52f4:	c05ff0ef          	jal	ra,4ef8 <dir_sdi.constprop.0>
    52f8:	00050493          	mv	s1,a0
    52fc:	30051a63          	bnez	a0,5610 <follow_path+0x638>
    5300:	fff00793          	li	a5,-1
    5304:	02f42623          	sw	a5,44(s0)
    5308:	0ff00b13          	li	s6,255
    530c:	0ff00c93          	li	s9,255
    5310:	00d00d93          	li	s11,13
    5314:	01842583          	lw	a1,24(s0)
    5318:	000d0513          	mv	a0,s10
    531c:	cd4ff0ef          	jal	ra,47f0 <move_window>
    5320:	00050493          	mv	s1,a0
    5324:	2e051663          	bnez	a0,5610 <follow_path+0x638>
    5328:	01c42683          	lw	a3,28(s0)
    532c:	0006c703          	lbu	a4,0(a3)
    5330:	30070063          	beqz	a4,5630 <follow_path+0x658>
    5334:	00b6c603          	lbu	a2,11(a3)
    5338:	0e500513          	li	a0,229
    533c:	03f67593          	andi	a1,a2,63
    5340:	00b40323          	sb	a1,6(s0)
    5344:	00a70a63          	beq	a4,a0,5358 <follow_path+0x380>
    5348:	00867613          	andi	a2,a2,8
    534c:	12060863          	beqz	a2,547c <follow_path+0x4a4>
    5350:	00f00613          	li	a2,15
    5354:	12c58863          	beq	a1,a2,5484 <follow_path+0x4ac>
    5358:	fff00793          	li	a5,-1
    535c:	02f42623          	sw	a5,44(s0)
    5360:	2500006f          	j	55b0 <follow_path+0x5d8>
    5364:	01670663          	beq	a4,s6,5370 <follow_path+0x398>
    5368:	0034e493          	ori	s1,s1,3
    536c:	f0eb6ee3          	bltu	s6,a4,5288 <follow_path+0x2b0>
    5370:	002a1a13          	slli	s4,s4,0x2
    5374:	0ffa7a13          	andi	s4,s4,255
    5378:	000b0713          	mv	a4,s6
    537c:	00b00d93          	li	s11,11
    5380:	00800d13          	li	s10,8
    5384:	eb5ff06f          	j	5238 <follow_path+0x260>
    5388:	07f00793          	li	a5,127
    538c:	04a7f663          	bgeu	a5,a0,53d8 <follow_path+0x400>
    5390:	0024e793          	ori	a5,s1,2
    5394:	1b500593          	li	a1,437
    5398:	00e12223          	sw	a4,4(sp)
    539c:	00f12023          	sw	a5,0(sp)
    53a0:	978ff0ef          	jal	ra,4518 <ff_uni2oem>
    53a4:	08057593          	andi	a1,a0,128
    53a8:	00012783          	lw	a5,0(sp)
    53ac:	00412703          	lw	a4,4(sp)
    53b0:	02000813          	li	a6,32
    53b4:	02e00893          	li	a7,46
    53b8:	00b00613          	li	a2,11
    53bc:	00008337          	lui	t1,0x8
    53c0:	02058a63          	beqz	a1,53f4 <follow_path+0x41c>
    53c4:	07f57513          	andi	a0,a0,127
    53c8:	00a98533          	add	a0,s3,a0
    53cc:	00054503          	lbu	a0,0(a0)
    53d0:	00078493          	mv	s1,a5
    53d4:	00050a63          	beqz	a0,53e8 <follow_path+0x410>
    53d8:	55030793          	addi	a5,t1,1360 # 8550 <cvt2.1220+0xd4>
    53dc:	0007c583          	lbu	a1,0(a5)
    53e0:	04058e63          	beqz	a1,543c <follow_path+0x464>
    53e4:	04a59863          	bne	a1,a0,5434 <follow_path+0x45c>
    53e8:	0034e493          	ori	s1,s1,3
    53ec:	05f00513          	li	a0,95
    53f0:	0340006f          	j	5424 <follow_path+0x44c>
    53f4:	0ff00593          	li	a1,255
    53f8:	fca5fce3          	bgeu	a1,a0,53d0 <follow_path+0x3f8>
    53fc:	fffd8593          	addi	a1,s11,-1
    5400:	00bd6863          	bltu	s10,a1,5410 <follow_path+0x438>
    5404:	0034e493          	ori	s1,s1,3
    5408:	000d8d13          	mv	s10,s11
    540c:	e2dff06f          	j	5238 <follow_path+0x260>
    5410:	01a405b3          	add	a1,s0,s10
    5414:	00855e13          	srli	t3,a0,0x8
    5418:	03c58023          	sb	t3,32(a1)
    541c:	001d0d13          	addi	s10,s10,1
    5420:	00078493          	mv	s1,a5
    5424:	01a407b3          	add	a5,s0,s10
    5428:	02a78023          	sb	a0,32(a5)
    542c:	001d0d13          	addi	s10,s10,1
    5430:	e09ff06f          	j	5238 <follow_path+0x260>
    5434:	00178793          	addi	a5,a5,1
    5438:	fa5ff06f          	j	53dc <follow_path+0x404>
    543c:	fbf50793          	addi	a5,a0,-65
    5440:	01079793          	slli	a5,a5,0x10
    5444:	0107d793          	srli	a5,a5,0x10
    5448:	01900593          	li	a1,25
    544c:	00f5e663          	bltu	a1,a5,5458 <follow_path+0x480>
    5450:	002a6a13          	ori	s4,s4,2
    5454:	fd1ff06f          	j	5424 <follow_path+0x44c>
    5458:	f9f50793          	addi	a5,a0,-97
    545c:	01079793          	slli	a5,a5,0x10
    5460:	0107d793          	srli	a5,a5,0x10
    5464:	fcf5e0e3          	bltu	a1,a5,5424 <follow_path+0x44c>
    5468:	fe050513          	addi	a0,a0,-32
    546c:	01051513          	slli	a0,a0,0x10
    5470:	001a6a13          	ori	s4,s4,1
    5474:	01055513          	srli	a0,a0,0x10
    5478:	fadff06f          	j	5424 <follow_path+0x44c>
    547c:	00f00613          	li	a2,15
    5480:	14c59063          	bne	a1,a2,55c0 <follow_path+0x5e8>
    5484:	02b44603          	lbu	a2,43(s0)
    5488:	04067613          	andi	a2,a2,64
    548c:	10061663          	bnez	a2,5598 <follow_path+0x5c0>
    5490:	04077613          	andi	a2,a4,64
    5494:	10060c63          	beqz	a2,55ac <follow_path+0x5d4>
    5498:	0bf77c93          	andi	s9,a4,191
    549c:	01042703          	lw	a4,16(s0)
    54a0:	00d6cb03          	lbu	s6,13(a3)
    54a4:	02e42623          	sw	a4,44(s0)
    54a8:	00d6c703          	lbu	a4,13(a3)
    54ac:	11671263          	bne	a4,s6,55b0 <follow_path+0x5d8>
    54b0:	01b6c703          	lbu	a4,27(a3)
    54b4:	01a6c603          	lbu	a2,26(a3)
    54b8:	00871713          	slli	a4,a4,0x8
    54bc:	00c76733          	or	a4,a4,a2
    54c0:	01071713          	slli	a4,a4,0x10
    54c4:	41075713          	srai	a4,a4,0x10
    54c8:	0e071463          	bnez	a4,55b0 <follow_path+0x5d8>
    54cc:	0006c703          	lbu	a4,0(a3)
    54d0:	00cd2a03          	lw	s4,12(s10)
    54d4:	00100513          	li	a0,1
    54d8:	03f77713          	andi	a4,a4,63
    54dc:	fff70713          	addi	a4,a4,-1
    54e0:	03b70733          	mul	a4,a4,s11
    54e4:	0ff00813          	li	a6,255
    54e8:	000087b7          	lui	a5,0x8
    54ec:	5d878793          	addi	a5,a5,1496 # 85d8 <LfnOfs>
    54f0:	00978633          	add	a2,a5,s1
    54f4:	00064583          	lbu	a1,0(a2)
    54f8:	00b685b3          	add	a1,a3,a1
    54fc:	0015c603          	lbu	a2,1(a1)
    5500:	0005c583          	lbu	a1,0(a1)
    5504:	00861613          	slli	a2,a2,0x8
    5508:	00b66633          	or	a2,a2,a1
    550c:	0a050663          	beqz	a0,55b8 <follow_path+0x5e0>
    5510:	00d12623          	sw	a3,12(sp)
    5514:	00e12023          	sw	a4,0(sp)
    5518:	08e86c63          	bltu	a6,a4,55b0 <follow_path+0x5d8>
    551c:	00060513          	mv	a0,a2
    5520:	00c12423          	sw	a2,8(sp)
    5524:	890ff0ef          	jal	ra,45b4 <ff_wtoupper>
    5528:	00012703          	lw	a4,0(sp)
    552c:	00a12223          	sw	a0,4(sp)
    5530:	00170893          	addi	a7,a4,1
    5534:	00171713          	slli	a4,a4,0x1
    5538:	00ea0733          	add	a4,s4,a4
    553c:	00075503          	lhu	a0,0(a4)
    5540:	01112023          	sw	a7,0(sp)
    5544:	870ff0ef          	jal	ra,45b4 <ff_wtoupper>
    5548:	00412583          	lw	a1,4(sp)
    554c:	06a59263          	bne	a1,a0,55b0 <follow_path+0x5d8>
    5550:	00812603          	lw	a2,8(sp)
    5554:	00012883          	lw	a7,0(sp)
    5558:	00c12683          	lw	a3,12(sp)
    555c:	00060513          	mv	a0,a2
    5560:	00088713          	mv	a4,a7
    5564:	0ff00813          	li	a6,255
    5568:	00148493          	addi	s1,s1,1
    556c:	f7b49ee3          	bne	s1,s11,54e8 <follow_path+0x510>
    5570:	0006c683          	lbu	a3,0(a3)
    5574:	0406f693          	andi	a3,a3,64
    5578:	00068c63          	beqz	a3,5590 <follow_path+0x5b8>
    557c:	00050a63          	beqz	a0,5590 <follow_path+0x5b8>
    5580:	00171713          	slli	a4,a4,0x1
    5584:	00ea0a33          	add	s4,s4,a4
    5588:	000a5703          	lhu	a4,0(s4)
    558c:	02071263          	bnez	a4,55b0 <follow_path+0x5d8>
    5590:	fffc8793          	addi	a5,s9,-1
    5594:	0ff7fc93          	andi	s9,a5,255
    5598:	00040513          	mv	a0,s0
    559c:	c14ff0ef          	jal	ra,49b0 <dir_next.isra.0>
    55a0:	00050493          	mv	s1,a0
    55a4:	d60508e3          	beqz	a0,5314 <follow_path+0x33c>
    55a8:	0680006f          	j	5610 <follow_path+0x638>
    55ac:	ef970ee3          	beq	a4,s9,54a8 <follow_path+0x4d0>
    55b0:	0ff00c93          	li	s9,255
    55b4:	fe5ff06f          	j	5598 <follow_path+0x5c0>
    55b8:	fb5608e3          	beq	a2,s5,5568 <follow_path+0x590>
    55bc:	ff5ff06f          	j	55b0 <follow_path+0x5d8>
    55c0:	020c9863          	bnez	s9,55f0 <follow_path+0x618>
    55c4:	00b68593          	addi	a1,a3,11
    55c8:	00068613          	mv	a2,a3
    55cc:	001cd713          	srli	a4,s9,0x1
    55d0:	007c9793          	slli	a5,s9,0x7
    55d4:	00160613          	addi	a2,a2,1
    55d8:	00f767b3          	or	a5,a4,a5
    55dc:	fff64703          	lbu	a4,-1(a2)
    55e0:	00e787b3          	add	a5,a5,a4
    55e4:	0ff7fc93          	andi	s9,a5,255
    55e8:	fec592e3          	bne	a1,a2,55cc <follow_path+0x5f4>
    55ec:	039b0263          	beq	s6,s9,5610 <follow_path+0x638>
    55f0:	02b44783          	lbu	a5,43(s0)
    55f4:	0017f793          	andi	a5,a5,1
    55f8:	d60790e3          	bnez	a5,5358 <follow_path+0x380>
    55fc:	00b00613          	li	a2,11
    5600:	000c0593          	mv	a1,s8
    5604:	00068513          	mv	a0,a3
    5608:	8c4ff0ef          	jal	ra,46cc <mem_cmp>
    560c:	d40516e3          	bnez	a0,5358 <follow_path+0x380>
    5610:	02b44783          	lbu	a5,43(s0)
    5614:	02048263          	beqz	s1,5638 <follow_path+0x660>
    5618:	00400713          	li	a4,4
    561c:	aee496e3          	bne	s1,a4,5108 <follow_path+0x130>
    5620:	0047f793          	andi	a5,a5,4
    5624:	ae0792e3          	bnez	a5,5108 <follow_path+0x130>
    5628:	00500493          	li	s1,5
    562c:	addff06f          	j	5108 <follow_path+0x130>
    5630:	00400493          	li	s1,4
    5634:	fddff06f          	j	5610 <follow_path+0x638>
    5638:	0047f793          	andi	a5,a5,4
    563c:	ac0796e3          	bnez	a5,5108 <follow_path+0x130>
    5640:	00644783          	lbu	a5,6(s0)
    5644:	0107f793          	andi	a5,a5,16
    5648:	fe0780e3          	beqz	a5,5628 <follow_path+0x650>
    564c:	01042783          	lw	a5,16(s0)
    5650:	000bc503          	lbu	a0,0(s7)
    5654:	02cb8593          	addi	a1,s7,44
    5658:	1ff7f793          	andi	a5,a5,511
    565c:	00f585b3          	add	a1,a1,a5
    5660:	c40ff0ef          	jal	ra,4aa0 <ld_clust.isra.0>
    5664:	00a42423          	sw	a0,8(s0)
    5668:	9e9ff06f          	j	5050 <follow_path+0x78>

0000566c <f_mount>:
    566c:	fd010113          	addi	sp,sp,-48
    5670:	00a12623          	sw	a0,12(sp)
    5674:	01c10513          	addi	a0,sp,28
    5678:	02812423          	sw	s0,40(sp)
    567c:	02112623          	sw	ra,44(sp)
    5680:	00b12423          	sw	a1,8(sp)
    5684:	00060413          	mv	s0,a2
    5688:	00b12e23          	sw	a1,28(sp)
    568c:	894ff0ef          	jal	ra,4720 <get_ldnumber>
    5690:	04054e63          	bltz	a0,56ec <f_mount+0x80>
    5694:	100007b7          	lui	a5,0x10000
    5698:	19478713          	addi	a4,a5,404 # 10000194 <FatFs>
    569c:	00251513          	slli	a0,a0,0x2
    56a0:	00e50733          	add	a4,a0,a4
    56a4:	00072703          	lw	a4,0(a4)
    56a8:	19478793          	addi	a5,a5,404
    56ac:	00070463          	beqz	a4,56b4 <f_mount+0x48>
    56b0:	00070023          	sb	zero,0(a4)
    56b4:	00c12703          	lw	a4,12(sp)
    56b8:	00070463          	beqz	a4,56c0 <f_mount+0x54>
    56bc:	00070023          	sb	zero,0(a4)
    56c0:	00a78533          	add	a0,a5,a0
    56c4:	00e52023          	sw	a4,0(a0)
    56c8:	00000513          	li	a0,0
    56cc:	00040863          	beqz	s0,56dc <f_mount+0x70>
    56d0:	00c10593          	addi	a1,sp,12
    56d4:	00810513          	addi	a0,sp,8
    56d8:	cc4ff0ef          	jal	ra,4b9c <mount_volume.isra.0>
    56dc:	02c12083          	lw	ra,44(sp)
    56e0:	02812403          	lw	s0,40(sp)
    56e4:	03010113          	addi	sp,sp,48
    56e8:	00008067          	ret
    56ec:	00b00513          	li	a0,11
    56f0:	fedff06f          	j	56dc <f_mount+0x70>

000056f4 <f_open>:
    56f4:	f9010113          	addi	sp,sp,-112
    56f8:	06912223          	sw	s1,100(sp)
    56fc:	06112623          	sw	ra,108(sp)
    5700:	06812423          	sw	s0,104(sp)
    5704:	07212023          	sw	s2,96(sp)
    5708:	05312e23          	sw	s3,92(sp)
    570c:	05412c23          	sw	s4,88(sp)
    5710:	00b12623          	sw	a1,12(sp)
    5714:	00900493          	li	s1,9
    5718:	08050a63          	beqz	a0,57ac <f_open+0xb8>
    571c:	00050413          	mv	s0,a0
    5720:	01c10593          	addi	a1,sp,28
    5724:	00c10513          	addi	a0,sp,12
    5728:	00060913          	mv	s2,a2
    572c:	c70ff0ef          	jal	ra,4b9c <mount_volume.isra.0>
    5730:	00050493          	mv	s1,a0
    5734:	0a051063          	bnez	a0,57d4 <f_open+0xe0>
    5738:	01c12783          	lw	a5,28(sp)
    573c:	00c12583          	lw	a1,12(sp)
    5740:	02010513          	addi	a0,sp,32
    5744:	02f12023          	sw	a5,32(sp)
    5748:	891ff0ef          	jal	ra,4fd8 <follow_path>
    574c:	00050493          	mv	s1,a0
    5750:	08051263          	bnez	a0,57d4 <f_open+0xe0>
    5754:	04b10783          	lb	a5,75(sp)
    5758:	0607cc63          	bltz	a5,57d0 <f_open+0xdc>
    575c:	02614783          	lbu	a5,38(sp)
    5760:	0107f793          	andi	a5,a5,16
    5764:	06079c63          	bnez	a5,57dc <f_open+0xe8>
    5768:	01c12983          	lw	s3,28(sp)
    576c:	03c12a03          	lw	s4,60(sp)
    5770:	00197913          	andi	s2,s2,1
    5774:	0009c503          	lbu	a0,0(s3)
    5778:	000a0593          	mv	a1,s4
    577c:	b24ff0ef          	jal	ra,4aa0 <ld_clust.isra.0>
    5780:	00a42423          	sw	a0,8(s0)
    5784:	01ca0513          	addi	a0,s4,28
    5788:	f19fe0ef          	jal	ra,46a0 <ld_dword>
    578c:	0069d783          	lhu	a5,6(s3)
    5790:	00a42623          	sw	a0,12(s0)
    5794:	01342023          	sw	s3,0(s0)
    5798:	00f41223          	sh	a5,4(s0)
    579c:	01240823          	sb	s2,16(s0)
    57a0:	000408a3          	sb	zero,17(s0)
    57a4:	00042e23          	sw	zero,28(s0)
    57a8:	00042a23          	sw	zero,20(s0)
    57ac:	06c12083          	lw	ra,108(sp)
    57b0:	06812403          	lw	s0,104(sp)
    57b4:	06012903          	lw	s2,96(sp)
    57b8:	05c12983          	lw	s3,92(sp)
    57bc:	05812a03          	lw	s4,88(sp)
    57c0:	00048513          	mv	a0,s1
    57c4:	06412483          	lw	s1,100(sp)
    57c8:	07010113          	addi	sp,sp,112
    57cc:	00008067          	ret
    57d0:	00600493          	li	s1,6
    57d4:	00042023          	sw	zero,0(s0)
    57d8:	fd5ff06f          	j	57ac <f_open+0xb8>
    57dc:	00400493          	li	s1,4
    57e0:	ff5ff06f          	j	57d4 <f_open+0xe0>

000057e4 <f_read>:
    57e4:	fb010113          	addi	sp,sp,-80
    57e8:	04812423          	sw	s0,72(sp)
    57ec:	04912223          	sw	s1,68(sp)
    57f0:	05212023          	sw	s2,64(sp)
    57f4:	03312e23          	sw	s3,60(sp)
    57f8:	03412c23          	sw	s4,56(sp)
    57fc:	04112623          	sw	ra,76(sp)
    5800:	03512a23          	sw	s5,52(sp)
    5804:	03612823          	sw	s6,48(sp)
    5808:	03712623          	sw	s7,44(sp)
    580c:	03812423          	sw	s8,40(sp)
    5810:	03912223          	sw	s9,36(sp)
    5814:	03a12023          	sw	s10,32(sp)
    5818:	01b12e23          	sw	s11,28(sp)
    581c:	00058993          	mv	s3,a1
    5820:	0006a023          	sw	zero,0(a3)
    5824:	00c10593          	addi	a1,sp,12
    5828:	00050493          	mv	s1,a0
    582c:	00060913          	mv	s2,a2
    5830:	00068a13          	mv	s4,a3
    5834:	f41fe0ef          	jal	ra,4774 <validate>
    5838:	00050413          	mv	s0,a0
    583c:	08051263          	bnez	a0,58c0 <f_read+0xdc>
    5840:	0114c403          	lbu	s0,17(s1)
    5844:	06041e63          	bnez	s0,58c0 <f_read+0xdc>
    5848:	0104c783          	lbu	a5,16(s1)
    584c:	00700413          	li	s0,7
    5850:	0017f793          	andi	a5,a5,1
    5854:	06078663          	beqz	a5,58c0 <f_read+0xdc>
    5858:	00c4a403          	lw	s0,12(s1)
    585c:	0144a503          	lw	a0,20(s1)
    5860:	40a40433          	sub	s0,s0,a0
    5864:	00897463          	bgeu	s2,s0,586c <f_read+0x88>
    5868:	00090413          	mv	s0,s2
    586c:	20000a93          	li	s5,512
    5870:	1ff00b13          	li	s6,511
    5874:	10000bb7          	lui	s7,0x10000
    5878:	00100c13          	li	s8,1
    587c:	fff00c93          	li	s9,-1
    5880:	04040063          	beqz	s0,58c0 <f_read+0xdc>
    5884:	0144a783          	lw	a5,20(s1)
    5888:	1ff7f713          	andi	a4,a5,511
    588c:	10071a63          	bnez	a4,59a0 <f_read+0x1bc>
    5890:	00c12703          	lw	a4,12(sp)
    5894:	00a75d03          	lhu	s10,10(a4)
    5898:	0097d713          	srli	a4,a5,0x9
    589c:	fffd0d13          	addi	s10,s10,-1
    58a0:	00ed7d33          	and	s10,s10,a4
    58a4:	080d1263          	bnez	s10,5928 <f_read+0x144>
    58a8:	04079c63          	bnez	a5,5900 <f_read+0x11c>
    58ac:	0084a503          	lw	a0,8(s1)
    58b0:	06ac6063          	bltu	s8,a0,5910 <f_read+0x12c>
    58b4:	00200793          	li	a5,2
    58b8:	00f488a3          	sb	a5,17(s1)
    58bc:	00200413          	li	s0,2
    58c0:	04c12083          	lw	ra,76(sp)
    58c4:	00040513          	mv	a0,s0
    58c8:	04812403          	lw	s0,72(sp)
    58cc:	04412483          	lw	s1,68(sp)
    58d0:	04012903          	lw	s2,64(sp)
    58d4:	03c12983          	lw	s3,60(sp)
    58d8:	03812a03          	lw	s4,56(sp)
    58dc:	03412a83          	lw	s5,52(sp)
    58e0:	03012b03          	lw	s6,48(sp)
    58e4:	02c12b83          	lw	s7,44(sp)
    58e8:	02812c03          	lw	s8,40(sp)
    58ec:	02412c83          	lw	s9,36(sp)
    58f0:	02012d03          	lw	s10,32(sp)
    58f4:	01c12d83          	lw	s11,28(sp)
    58f8:	05010113          	addi	sp,sp,80
    58fc:	00008067          	ret
    5900:	0184a583          	lw	a1,24(s1)
    5904:	0004a503          	lw	a0,0(s1)
    5908:	f55fe0ef          	jal	ra,485c <get_fat.isra.0>
    590c:	fa5ff06f          	j	58b0 <f_read+0xcc>
    5910:	01951a63          	bne	a0,s9,5924 <f_read+0x140>
    5914:	00100793          	li	a5,1
    5918:	00f488a3          	sb	a5,17(s1)
    591c:	00100413          	li	s0,1
    5920:	fa1ff06f          	j	58c0 <f_read+0xdc>
    5924:	00a4ac23          	sw	a0,24(s1)
    5928:	00c12d83          	lw	s11,12(sp)
    592c:	0184a583          	lw	a1,24(s1)
    5930:	000d8513          	mv	a0,s11
    5934:	dc1fe0ef          	jal	ra,46f4 <clst2sect>
    5938:	f6050ee3          	beqz	a0,58b4 <f_read+0xd0>
    593c:	00ad0633          	add	a2,s10,a0
    5940:	048b7e63          	bgeu	s6,s0,599c <f_read+0x1b8>
    5944:	00add783          	lhu	a5,10(s11)
    5948:	00945913          	srli	s2,s0,0x9
    594c:	012d0733          	add	a4,s10,s2
    5950:	00e7f463          	bgeu	a5,a4,5958 <f_read+0x174>
    5954:	41a78933          	sub	s2,a5,s10
    5958:	4b8ba783          	lw	a5,1208(s7) # 100004b8 <FfDiskOps>
    595c:	001dc503          	lbu	a0,1(s11)
    5960:	00090693          	mv	a3,s2
    5964:	0087a783          	lw	a5,8(a5)
    5968:	00098593          	mv	a1,s3
    596c:	000780e7          	jalr	a5
    5970:	fa0512e3          	bnez	a0,5914 <f_read+0x130>
    5974:	00991913          	slli	s2,s2,0x9
    5978:	000a2783          	lw	a5,0(s4)
    597c:	0144a683          	lw	a3,20(s1)
    5980:	41240433          	sub	s0,s0,s2
    5984:	012787b3          	add	a5,a5,s2
    5988:	00fa2023          	sw	a5,0(s4)
    598c:	012989b3          	add	s3,s3,s2
    5990:	01268933          	add	s2,a3,s2
    5994:	0124aa23          	sw	s2,20(s1)
    5998:	ee9ff06f          	j	5880 <f_read+0x9c>
    599c:	00c4ae23          	sw	a2,28(s1)
    59a0:	0144a783          	lw	a5,20(s1)
    59a4:	00040913          	mv	s2,s0
    59a8:	1ff7f793          	andi	a5,a5,511
    59ac:	40fa87b3          	sub	a5,s5,a5
    59b0:	0087f463          	bgeu	a5,s0,59b8 <f_read+0x1d4>
    59b4:	00078913          	mv	s2,a5
    59b8:	01c4a583          	lw	a1,28(s1)
    59bc:	00c12503          	lw	a0,12(sp)
    59c0:	e31fe0ef          	jal	ra,47f0 <move_window>
    59c4:	f40518e3          	bnez	a0,5914 <f_read+0x130>
    59c8:	00c12703          	lw	a4,12(sp)
    59cc:	0144a683          	lw	a3,20(s1)
    59d0:	02c70713          	addi	a4,a4,44
    59d4:	1ff6f693          	andi	a3,a3,511
    59d8:	00a687b3          	add	a5,a3,a0
    59dc:	00f707b3          	add	a5,a4,a5
    59e0:	0007c603          	lbu	a2,0(a5)
    59e4:	00a987b3          	add	a5,s3,a0
    59e8:	00150513          	addi	a0,a0,1
    59ec:	00c78023          	sb	a2,0(a5)
    59f0:	fea914e3          	bne	s2,a0,59d8 <f_read+0x1f4>
    59f4:	f85ff06f          	j	5978 <f_read+0x194>

000059f8 <f_close>:
    59f8:	fe010113          	addi	sp,sp,-32
    59fc:	00c10593          	addi	a1,sp,12
    5a00:	00812c23          	sw	s0,24(sp)
    5a04:	00112e23          	sw	ra,28(sp)
    5a08:	00050413          	mv	s0,a0
    5a0c:	d69fe0ef          	jal	ra,4774 <validate>
    5a10:	00051463          	bnez	a0,5a18 <f_close+0x20>
    5a14:	00042023          	sw	zero,0(s0)
    5a18:	01c12083          	lw	ra,28(sp)
    5a1c:	01812403          	lw	s0,24(sp)
    5a20:	02010113          	addi	sp,sp,32
    5a24:	00008067          	ret

00005a28 <f_lseek>:
    5a28:	fd010113          	addi	sp,sp,-48
    5a2c:	01312e23          	sw	s3,28(sp)
    5a30:	00058993          	mv	s3,a1
    5a34:	00c10593          	addi	a1,sp,12
    5a38:	02812423          	sw	s0,40(sp)
    5a3c:	03212023          	sw	s2,32(sp)
    5a40:	02112623          	sw	ra,44(sp)
    5a44:	02912223          	sw	s1,36(sp)
    5a48:	01412c23          	sw	s4,24(sp)
    5a4c:	01512a23          	sw	s5,20(sp)
    5a50:	00050413          	mv	s0,a0
    5a54:	d21fe0ef          	jal	ra,4774 <validate>
    5a58:	00050913          	mv	s2,a0
    5a5c:	0e051a63          	bnez	a0,5b50 <f_lseek+0x128>
    5a60:	01144903          	lbu	s2,17(s0)
    5a64:	0e091663          	bnez	s2,5b50 <f_lseek+0x128>
    5a68:	00c42483          	lw	s1,12(s0)
    5a6c:	0099f463          	bgeu	s3,s1,5a74 <f_lseek+0x4c>
    5a70:	00098493          	mv	s1,s3
    5a74:	01442783          	lw	a5,20(s0)
    5a78:	00042a23          	sw	zero,20(s0)
    5a7c:	02049663          	bnez	s1,5aa8 <f_lseek+0x80>
    5a80:	00000913          	li	s2,0
    5a84:	0cc0006f          	j	5b50 <f_lseek+0x128>
    5a88:	00000493          	li	s1,0
    5a8c:	01442783          	lw	a5,20(s0)
    5a90:	1ff7f793          	andi	a5,a5,511
    5a94:	fe0786e3          	beqz	a5,5a80 <f_lseek+0x58>
    5a98:	01c42783          	lw	a5,28(s0)
    5a9c:	0a978a63          	beq	a5,s1,5b50 <f_lseek+0x128>
    5aa0:	00942e23          	sw	s1,28(s0)
    5aa4:	0ac0006f          	j	5b50 <f_lseek+0x128>
    5aa8:	00c12703          	lw	a4,12(sp)
    5aac:	00a75983          	lhu	s3,10(a4)
    5ab0:	00999993          	slli	s3,s3,0x9
    5ab4:	06078463          	beqz	a5,5b1c <f_lseek+0xf4>
    5ab8:	fff78793          	addi	a5,a5,-1
    5abc:	fff48713          	addi	a4,s1,-1
    5ac0:	03375733          	divu	a4,a4,s3
    5ac4:	0337d6b3          	divu	a3,a5,s3
    5ac8:	04d76a63          	bltu	a4,a3,5b1c <f_lseek+0xf4>
    5acc:	41300733          	neg	a4,s3
    5ad0:	01842583          	lw	a1,24(s0)
    5ad4:	00f777b3          	and	a5,a4,a5
    5ad8:	00f42a23          	sw	a5,20(s0)
    5adc:	40f484b3          	sub	s1,s1,a5
    5ae0:	fa0584e3          	beqz	a1,5a88 <f_lseek+0x60>
    5ae4:	fff00a13          	li	s4,-1
    5ae8:	00100a93          	li	s5,1
    5aec:	01442783          	lw	a5,20(s0)
    5af0:	0299ec63          	bltu	s3,s1,5b28 <f_lseek+0x100>
    5af4:	00f487b3          	add	a5,s1,a5
    5af8:	00f42a23          	sw	a5,20(s0)
    5afc:	1ff4f793          	andi	a5,s1,511
    5b00:	f80784e3          	beqz	a5,5a88 <f_lseek+0x60>
    5b04:	00c12503          	lw	a0,12(sp)
    5b08:	bedfe0ef          	jal	ra,46f4 <clst2sect>
    5b0c:	06050e63          	beqz	a0,5b88 <f_lseek+0x160>
    5b10:	0094d493          	srli	s1,s1,0x9
    5b14:	00a484b3          	add	s1,s1,a0
    5b18:	f75ff06f          	j	5a8c <f_lseek+0x64>
    5b1c:	00842583          	lw	a1,8(s0)
    5b20:	00b42c23          	sw	a1,24(s0)
    5b24:	fbdff06f          	j	5ae0 <f_lseek+0xb8>
    5b28:	00042503          	lw	a0,0(s0)
    5b2c:	013787b3          	add	a5,a5,s3
    5b30:	00f42a23          	sw	a5,20(s0)
    5b34:	d29fe0ef          	jal	ra,485c <get_fat.isra.0>
    5b38:	413484b3          	sub	s1,s1,s3
    5b3c:	00050593          	mv	a1,a0
    5b40:	03451c63          	bne	a0,s4,5b78 <f_lseek+0x150>
    5b44:	00100793          	li	a5,1
    5b48:	00f408a3          	sb	a5,17(s0)
    5b4c:	00100913          	li	s2,1
    5b50:	02c12083          	lw	ra,44(sp)
    5b54:	02812403          	lw	s0,40(sp)
    5b58:	02412483          	lw	s1,36(sp)
    5b5c:	01c12983          	lw	s3,28(sp)
    5b60:	01812a03          	lw	s4,24(sp)
    5b64:	01412a83          	lw	s5,20(sp)
    5b68:	00090513          	mv	a0,s2
    5b6c:	02012903          	lw	s2,32(sp)
    5b70:	03010113          	addi	sp,sp,48
    5b74:	00008067          	ret
    5b78:	00aaf863          	bgeu	s5,a0,5b88 <f_lseek+0x160>
    5b7c:	00c12783          	lw	a5,12(sp)
    5b80:	0107a783          	lw	a5,16(a5)
    5b84:	00f56a63          	bltu	a0,a5,5b98 <f_lseek+0x170>
    5b88:	00200793          	li	a5,2
    5b8c:	00f408a3          	sb	a5,17(s0)
    5b90:	00200913          	li	s2,2
    5b94:	fbdff06f          	j	5b50 <f_lseek+0x128>
    5b98:	00a42c23          	sw	a0,24(s0)
    5b9c:	f51ff06f          	j	5aec <f_lseek+0xc4>

00005ba0 <f_opendir>:
    5ba0:	fd010113          	addi	sp,sp,-48
    5ba4:	02112623          	sw	ra,44(sp)
    5ba8:	02812423          	sw	s0,40(sp)
    5bac:	00b12623          	sw	a1,12(sp)
    5bb0:	08050a63          	beqz	a0,5c44 <f_opendir+0xa4>
    5bb4:	00050413          	mv	s0,a0
    5bb8:	01c10593          	addi	a1,sp,28
    5bbc:	00c10513          	addi	a0,sp,12
    5bc0:	fddfe0ef          	jal	ra,4b9c <mount_volume.isra.0>
    5bc4:	02051a63          	bnez	a0,5bf8 <f_opendir+0x58>
    5bc8:	01c12783          	lw	a5,28(sp)
    5bcc:	00c12583          	lw	a1,12(sp)
    5bd0:	00040513          	mv	a0,s0
    5bd4:	00f42023          	sw	a5,0(s0)
    5bd8:	c00ff0ef          	jal	ra,4fd8 <follow_path>
    5bdc:	06051863          	bnez	a0,5c4c <f_opendir+0xac>
    5be0:	02b40783          	lb	a5,43(s0)
    5be4:	0207c863          	bltz	a5,5c14 <f_opendir+0x74>
    5be8:	00644783          	lbu	a5,6(s0)
    5bec:	0107f793          	andi	a5,a5,16
    5bf0:	00079863          	bnez	a5,5c00 <f_opendir+0x60>
    5bf4:	00500513          	li	a0,5
    5bf8:	00042023          	sw	zero,0(s0)
    5bfc:	0380006f          	j	5c34 <f_opendir+0x94>
    5c00:	01c12783          	lw	a5,28(sp)
    5c04:	01c42583          	lw	a1,28(s0)
    5c08:	0007c503          	lbu	a0,0(a5)
    5c0c:	e95fe0ef          	jal	ra,4aa0 <ld_clust.isra.0>
    5c10:	00a42423          	sw	a0,8(s0)
    5c14:	01c12783          	lw	a5,28(sp)
    5c18:	00040513          	mv	a0,s0
    5c1c:	0067d783          	lhu	a5,6(a5)
    5c20:	00f41223          	sh	a5,4(s0)
    5c24:	ad4ff0ef          	jal	ra,4ef8 <dir_sdi.constprop.0>
    5c28:	00400793          	li	a5,4
    5c2c:	fcf504e3          	beq	a0,a5,5bf4 <f_opendir+0x54>
    5c30:	fc0514e3          	bnez	a0,5bf8 <f_opendir+0x58>
    5c34:	02c12083          	lw	ra,44(sp)
    5c38:	02812403          	lw	s0,40(sp)
    5c3c:	03010113          	addi	sp,sp,48
    5c40:	00008067          	ret
    5c44:	00900513          	li	a0,9
    5c48:	fedff06f          	j	5c34 <f_opendir+0x94>
    5c4c:	00400793          	li	a5,4
    5c50:	faf502e3          	beq	a0,a5,5bf4 <f_opendir+0x54>
    5c54:	fa5ff06f          	j	5bf8 <f_opendir+0x58>

00005c58 <f_closedir>:
    5c58:	fe010113          	addi	sp,sp,-32
    5c5c:	00c10593          	addi	a1,sp,12
    5c60:	00812c23          	sw	s0,24(sp)
    5c64:	00112e23          	sw	ra,28(sp)
    5c68:	00050413          	mv	s0,a0
    5c6c:	b09fe0ef          	jal	ra,4774 <validate>
    5c70:	00051463          	bnez	a0,5c78 <f_closedir+0x20>
    5c74:	00042023          	sw	zero,0(s0)
    5c78:	01c12083          	lw	ra,28(sp)
    5c7c:	01812403          	lw	s0,24(sp)
    5c80:	02010113          	addi	sp,sp,32
    5c84:	00008067          	ret

00005c88 <f_readdir>:
    5c88:	fb010113          	addi	sp,sp,-80
    5c8c:	04912223          	sw	s1,68(sp)
    5c90:	00058493          	mv	s1,a1
    5c94:	00c10593          	addi	a1,sp,12
    5c98:	05212023          	sw	s2,64(sp)
    5c9c:	03312e23          	sw	s3,60(sp)
    5ca0:	04112623          	sw	ra,76(sp)
    5ca4:	04812423          	sw	s0,72(sp)
    5ca8:	03412c23          	sw	s4,56(sp)
    5cac:	03512a23          	sw	s5,52(sp)
    5cb0:	03612823          	sw	s6,48(sp)
    5cb4:	03712623          	sw	s7,44(sp)
    5cb8:	03812423          	sw	s8,40(sp)
    5cbc:	03912223          	sw	s9,36(sp)
    5cc0:	03a12023          	sw	s10,32(sp)
    5cc4:	01b12e23          	sw	s11,28(sp)
    5cc8:	00050913          	mv	s2,a0
    5ccc:	aa9fe0ef          	jal	ra,4774 <validate>
    5cd0:	00050993          	mv	s3,a0
    5cd4:	3c051c63          	bnez	a0,60ac <f_readdir+0x424>
    5cd8:	00049a63          	bnez	s1,5cec <f_readdir+0x64>
    5cdc:	00090513          	mv	a0,s2
    5ce0:	a18ff0ef          	jal	ra,4ef8 <dir_sdi.constprop.0>
    5ce4:	00050993          	mv	s3,a0
    5ce8:	3c40006f          	j	60ac <f_readdir+0x424>
    5cec:	00092b03          	lw	s6,0(s2)
    5cf0:	00008a37          	lui	s4,0x8
    5cf4:	00010ab7          	lui	s5,0x10
    5cf8:	0ff00c13          	li	s8,255
    5cfc:	0ff00413          	li	s0,255
    5d00:	00400513          	li	a0,4
    5d04:	00d00b93          	li	s7,13
    5d08:	5d8a0a13          	addi	s4,s4,1496 # 85d8 <LfnOfs>
    5d0c:	fffa8a93          	addi	s5,s5,-1 # ffff <_edata_rom+0x7793>
    5d10:	01892583          	lw	a1,24(s2)
    5d14:	00059663          	bnez	a1,5d20 <f_readdir+0x98>
    5d18:	16050c63          	beqz	a0,5e90 <f_readdir+0x208>
    5d1c:	11c0006f          	j	5e38 <f_readdir+0x1b0>
    5d20:	000b0513          	mv	a0,s6
    5d24:	acdfe0ef          	jal	ra,47f0 <move_window>
    5d28:	10051863          	bnez	a0,5e38 <f_readdir+0x1b0>
    5d2c:	01c92783          	lw	a5,28(s2)
    5d30:	0007c703          	lbu	a4,0(a5)
    5d34:	24070263          	beqz	a4,5f78 <f_readdir+0x2f0>
    5d38:	00b7c683          	lbu	a3,11(a5)
    5d3c:	0e500613          	li	a2,229
    5d40:	03f6f693          	andi	a3,a3,63
    5d44:	00d90323          	sb	a3,6(s2)
    5d48:	10c70263          	beq	a4,a2,5e4c <f_readdir+0x1c4>
    5d4c:	02e00613          	li	a2,46
    5d50:	0ec70e63          	beq	a4,a2,5e4c <f_readdir+0x1c4>
    5d54:	fdf6f613          	andi	a2,a3,-33
    5d58:	00800593          	li	a1,8
    5d5c:	0eb60863          	beq	a2,a1,5e4c <f_readdir+0x1c4>
    5d60:	00f00613          	li	a2,15
    5d64:	0ec69c63          	bne	a3,a2,5e5c <f_readdir+0x1d4>
    5d68:	04077693          	andi	a3,a4,64
    5d6c:	0c068e63          	beqz	a3,5e48 <f_readdir+0x1c0>
    5d70:	0bf77413          	andi	s0,a4,191
    5d74:	01092703          	lw	a4,16(s2)
    5d78:	00d7cc03          	lbu	s8,13(a5)
    5d7c:	02e92623          	sw	a4,44(s2)
    5d80:	00d7c703          	lbu	a4,13(a5)
    5d84:	0d871463          	bne	a4,s8,5e4c <f_readdir+0x1c4>
    5d88:	01b7c703          	lbu	a4,27(a5)
    5d8c:	01a7c683          	lbu	a3,26(a5)
    5d90:	00871713          	slli	a4,a4,0x8
    5d94:	00d76733          	or	a4,a4,a3
    5d98:	01071713          	slli	a4,a4,0x10
    5d9c:	41075713          	srai	a4,a4,0x10
    5da0:	0a071663          	bnez	a4,5e4c <f_readdir+0x1c4>
    5da4:	0007c703          	lbu	a4,0(a5)
    5da8:	00cb2603          	lw	a2,12(s6)
    5dac:	00100813          	li	a6,1
    5db0:	fbf77713          	andi	a4,a4,-65
    5db4:	fff70713          	addi	a4,a4,-1
    5db8:	03770733          	mul	a4,a4,s7
    5dbc:	0ff00893          	li	a7,255
    5dc0:	00aa06b3          	add	a3,s4,a0
    5dc4:	0006c583          	lbu	a1,0(a3)
    5dc8:	00b785b3          	add	a1,a5,a1
    5dcc:	0015c683          	lbu	a3,1(a1)
    5dd0:	0005c583          	lbu	a1,0(a1)
    5dd4:	00869693          	slli	a3,a3,0x8
    5dd8:	00b6e6b3          	or	a3,a3,a1
    5ddc:	06080c63          	beqz	a6,5e54 <f_readdir+0x1cc>
    5de0:	06e8e663          	bltu	a7,a4,5e4c <f_readdir+0x1c4>
    5de4:	00171593          	slli	a1,a4,0x1
    5de8:	00b605b3          	add	a1,a2,a1
    5dec:	00d59023          	sh	a3,0(a1)
    5df0:	00068813          	mv	a6,a3
    5df4:	00170713          	addi	a4,a4,1
    5df8:	00150513          	addi	a0,a0,1
    5dfc:	fd7512e3          	bne	a0,s7,5dc0 <f_readdir+0x138>
    5e00:	0007c783          	lbu	a5,0(a5)
    5e04:	0407f793          	andi	a5,a5,64
    5e08:	00078e63          	beqz	a5,5e24 <f_readdir+0x19c>
    5e0c:	00080c63          	beqz	a6,5e24 <f_readdir+0x19c>
    5e10:	0ff00793          	li	a5,255
    5e14:	02e7ec63          	bltu	a5,a4,5e4c <f_readdir+0x1c4>
    5e18:	00171713          	slli	a4,a4,0x1
    5e1c:	00e60733          	add	a4,a2,a4
    5e20:	00071023          	sh	zero,0(a4)
    5e24:	fff40413          	addi	s0,s0,-1
    5e28:	0ff47413          	andi	s0,s0,255
    5e2c:	00090513          	mv	a0,s2
    5e30:	b81fe0ef          	jal	ra,49b0 <dir_next.isra.0>
    5e34:	ec050ee3          	beqz	a0,5d10 <f_readdir+0x88>
    5e38:	00092c23          	sw	zero,24(s2)
    5e3c:	00400793          	li	a5,4
    5e40:	eaf512e3          	bne	a0,a5,5ce4 <f_readdir+0x5c>
    5e44:	04c0006f          	j	5e90 <f_readdir+0x208>
    5e48:	f2870ce3          	beq	a4,s0,5d80 <f_readdir+0xf8>
    5e4c:	0ff00413          	li	s0,255
    5e50:	fddff06f          	j	5e2c <f_readdir+0x1a4>
    5e54:	fb5682e3          	beq	a3,s5,5df8 <f_readdir+0x170>
    5e58:	ff5ff06f          	j	5e4c <f_readdir+0x1c4>
    5e5c:	02041663          	bnez	s0,5e88 <f_readdir+0x200>
    5e60:	00b78693          	addi	a3,a5,11
    5e64:	00145713          	srli	a4,s0,0x1
    5e68:	00178793          	addi	a5,a5,1
    5e6c:	00741413          	slli	s0,s0,0x7
    5e70:	00876433          	or	s0,a4,s0
    5e74:	fff7c703          	lbu	a4,-1(a5)
    5e78:	00e40433          	add	s0,s0,a4
    5e7c:	0ff47413          	andi	s0,s0,255
    5e80:	fef692e3          	bne	a3,a5,5e64 <f_readdir+0x1dc>
    5e84:	008c0663          	beq	s8,s0,5e90 <f_readdir+0x208>
    5e88:	fff00793          	li	a5,-1
    5e8c:	02f92623          	sw	a5,44(s2)
    5e90:	00092c83          	lw	s9,0(s2)
    5e94:	00048b23          	sb	zero,22(s1)
    5e98:	01892783          	lw	a5,24(s2)
    5e9c:	20078063          	beqz	a5,609c <f_readdir+0x414>
    5ea0:	02c92703          	lw	a4,44(s2)
    5ea4:	fff00793          	li	a5,-1
    5ea8:	16f71663          	bne	a4,a5,6014 <f_readdir+0x38c>
    5eac:	01c92403          	lw	s0,28(s2)
    5eb0:	00000793          	li	a5,0
    5eb4:	00000713          	li	a4,0
    5eb8:	02000593          	li	a1,32
    5ebc:	00500513          	li	a0,5
    5ec0:	00900813          	li	a6,9
    5ec4:	00b00613          	li	a2,11
    5ec8:	02e00893          	li	a7,46
    5ecc:	00170713          	addi	a4,a4,1
    5ed0:	00e406b3          	add	a3,s0,a4
    5ed4:	fff6c683          	lbu	a3,-1(a3)
    5ed8:	02b68663          	beq	a3,a1,5f04 <f_readdir+0x27c>
    5edc:	00a69463          	bne	a3,a0,5ee4 <f_readdir+0x25c>
    5ee0:	0e500693          	li	a3,229
    5ee4:	01071a63          	bne	a4,a6,5ef8 <f_readdir+0x270>
    5ee8:	00f66863          	bltu	a2,a5,5ef8 <f_readdir+0x270>
    5eec:	00f48333          	add	t1,s1,a5
    5ef0:	011304a3          	sb	a7,9(t1)
    5ef4:	00178793          	addi	a5,a5,1
    5ef8:	00f48333          	add	t1,s1,a5
    5efc:	00d304a3          	sb	a3,9(t1)
    5f00:	00178793          	addi	a5,a5,1
    5f04:	fcc714e3          	bne	a4,a2,5ecc <f_readdir+0x244>
    5f08:	00f48733          	add	a4,s1,a5
    5f0c:	000704a3          	sb	zero,9(a4)
    5f10:	0164c703          	lbu	a4,22(s1)
    5f14:	14071663          	bnez	a4,6060 <f_readdir+0x3d8>
    5f18:	12078463          	beqz	a5,6040 <f_readdir+0x3b8>
    5f1c:	ff700613          	li	a2,-9
    5f20:	00948793          	addi	a5,s1,9
    5f24:	00800593          	li	a1,8
    5f28:	40960633          	sub	a2,a2,s1
    5f2c:	02e00513          	li	a0,46
    5f30:	01900813          	li	a6,25
    5f34:	0007c683          	lbu	a3,0(a5)
    5f38:	00f60733          	add	a4,a2,a5
    5f3c:	10068863          	beqz	a3,604c <f_readdir+0x3c4>
    5f40:	01069713          	slli	a4,a3,0x10
    5f44:	01075713          	srli	a4,a4,0x10
    5f48:	1aa68263          	beq	a3,a0,60ec <f_readdir+0x464>
    5f4c:	fbf70693          	addi	a3,a4,-65
    5f50:	01069693          	slli	a3,a3,0x10
    5f54:	0106d693          	srli	a3,a3,0x10
    5f58:	00d86a63          	bltu	a6,a3,5f6c <f_readdir+0x2e4>
    5f5c:	00c44683          	lbu	a3,12(s0)
    5f60:	00d5f6b3          	and	a3,a1,a3
    5f64:	00068463          	beqz	a3,5f6c <f_readdir+0x2e4>
    5f68:	02070713          	addi	a4,a4,32
    5f6c:	00e786a3          	sb	a4,13(a5)
    5f70:	00178793          	addi	a5,a5,1
    5f74:	fc1ff06f          	j	5f34 <f_readdir+0x2ac>
    5f78:	00400513          	li	a0,4
    5f7c:	ebdff06f          	j	5e38 <f_readdir+0x1b0>
    5f80:	000a9a63          	bnez	s5,5f94 <f_readdir+0x30c>
    5f84:	01778733          	add	a4,a5,s7
    5f88:	01071713          	slli	a4,a4,0x10
    5f8c:	01075713          	srli	a4,a4,0x10
    5f90:	02edfe63          	bgeu	s11,a4,5fcc <f_readdir+0x344>
    5f94:	010a9513          	slli	a0,s5,0x10
    5f98:	1b500593          	li	a1,437
    5f9c:	00f56533          	or	a0,a0,a5
    5fa0:	414c0433          	sub	s0,s8,s4
    5fa4:	d74fe0ef          	jal	ra,4518 <ff_uni2oem>
    5fa8:	04ac7a63          	bgeu	s8,a0,5ffc <f_readdir+0x374>
    5fac:	088d7663          	bgeu	s10,s0,6038 <f_readdir+0x3b0>
    5fb0:	014487b3          	add	a5,s1,s4
    5fb4:	00855713          	srli	a4,a0,0x8
    5fb8:	00e78b23          	sb	a4,22(a5)
    5fbc:	00a78ba3          	sb	a0,23(a5)
    5fc0:	00200793          	li	a5,2
    5fc4:	00fa0a33          	add	s4,s4,a5
    5fc8:	00000793          	li	a5,0
    5fcc:	002b0b13          	addi	s6,s6,2
    5fd0:	00078a93          	mv	s5,a5
    5fd4:	00cca783          	lw	a5,12(s9)
    5fd8:	016787b3          	add	a5,a5,s6
    5fdc:	0007d783          	lhu	a5,0(a5)
    5fe0:	fa0790e3          	bnez	a5,5f80 <f_readdir+0x2f8>
    5fe4:	000a0413          	mv	s0,s4
    5fe8:	000a8463          	beqz	s5,5ff0 <f_readdir+0x368>
    5fec:	00000413          	li	s0,0
    5ff0:	00848433          	add	s0,s1,s0
    5ff4:	00040b23          	sb	zero,22(s0)
    5ff8:	eb5ff06f          	j	5eac <f_readdir+0x224>
    5ffc:	02050e63          	beqz	a0,6038 <f_readdir+0x3b0>
    6000:	fe0404e3          	beqz	s0,5fe8 <f_readdir+0x360>
    6004:	014487b3          	add	a5,s1,s4
    6008:	00a78b23          	sb	a0,22(a5)
    600c:	00100793          	li	a5,1
    6010:	fb5ff06f          	j	5fc4 <f_readdir+0x33c>
    6014:	00003bb7          	lui	s7,0x3
    6018:	00000b13          	li	s6,0
    601c:	00000a13          	li	s4,0
    6020:	00000a93          	li	s5,0
    6024:	0ff00c13          	li	s8,255
    6028:	00100d13          	li	s10,1
    602c:	800b8b93          	addi	s7,s7,-2048 # 2800 <__i_vfprintf+0x20>
    6030:	7ff00d93          	li	s11,2047
    6034:	fa1ff06f          	j	5fd4 <f_readdir+0x34c>
    6038:	00000413          	li	s0,0
    603c:	fadff06f          	j	5fe8 <f_readdir+0x360>
    6040:	03f00793          	li	a5,63
    6044:	00f48b23          	sb	a5,22(s1)
    6048:	00100713          	li	a4,1
    604c:	00e48733          	add	a4,s1,a4
    6050:	00070b23          	sb	zero,22(a4)
    6054:	00c44783          	lbu	a5,12(s0)
    6058:	00079463          	bnez	a5,6060 <f_readdir+0x3d8>
    605c:	000484a3          	sb	zero,9(s1)
    6060:	00b44783          	lbu	a5,11(s0)
    6064:	01c40513          	addi	a0,s0,28
    6068:	00f48423          	sb	a5,8(s1)
    606c:	e34fe0ef          	jal	ra,46a0 <ld_dword>
    6070:	00a4a023          	sw	a0,0(s1)
    6074:	01744783          	lbu	a5,23(s0)
    6078:	01644703          	lbu	a4,22(s0)
    607c:	00879793          	slli	a5,a5,0x8
    6080:	00e7e7b3          	or	a5,a5,a4
    6084:	00f49323          	sh	a5,6(s1)
    6088:	01944783          	lbu	a5,25(s0)
    608c:	01844703          	lbu	a4,24(s0)
    6090:	00879793          	slli	a5,a5,0x8
    6094:	00e7e7b3          	or	a5,a5,a4
    6098:	00f49223          	sh	a5,4(s1)
    609c:	00090513          	mv	a0,s2
    60a0:	911fe0ef          	jal	ra,49b0 <dir_next.isra.0>
    60a4:	00400793          	li	a5,4
    60a8:	c2f51ee3          	bne	a0,a5,5ce4 <f_readdir+0x5c>
    60ac:	04c12083          	lw	ra,76(sp)
    60b0:	04812403          	lw	s0,72(sp)
    60b4:	04412483          	lw	s1,68(sp)
    60b8:	04012903          	lw	s2,64(sp)
    60bc:	03812a03          	lw	s4,56(sp)
    60c0:	03412a83          	lw	s5,52(sp)
    60c4:	03012b03          	lw	s6,48(sp)
    60c8:	02c12b83          	lw	s7,44(sp)
    60cc:	02812c03          	lw	s8,40(sp)
    60d0:	02412c83          	lw	s9,36(sp)
    60d4:	02012d03          	lw	s10,32(sp)
    60d8:	01c12d83          	lw	s11,28(sp)
    60dc:	00098513          	mv	a0,s3
    60e0:	03c12983          	lw	s3,60(sp)
    60e4:	05010113          	addi	sp,sp,80
    60e8:	00008067          	ret
    60ec:	01000593          	li	a1,16
    60f0:	e7dff06f          	j	5f6c <f_readdir+0x2e4>

000060f4 <cdelay>:
    60f4:	00000013          	nop
    60f8:	fff50513          	addi	a0,a0,-1
    60fc:	fe051ce3          	bnez	a0,60f4 <cdelay>
    6100:	00008067          	ret

00006104 <sdram_get_databits>:
    6104:	01000513          	li	a0,16
    6108:	00008067          	ret

0000610c <sdram_get_freq>:
    610c:	02faf537          	lui	a0,0x2faf
    6110:	08050513          	addi	a0,a0,128 # 2faf080 <_edata_rom+0x2fa6814>
    6114:	00008067          	ret

00006118 <sdram_get_cl>:
    6118:	00200513          	li	a0,2
    611c:	00008067          	ret

00006120 <sdram_get_cwl>:
    6120:	00200513          	li	a0,2
    6124:	00008067          	ret

00006128 <sdram_software_control_on>:
    6128:	f00037b7          	lui	a5,0xf0003
    612c:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    6130:	00e00713          	li	a4,14
    6134:	00e68a63          	beq	a3,a4,6148 <sdram_software_control_on+0x20>
    6138:	00008537          	lui	a0,0x8
    613c:	80e7a023          	sw	a4,-2048(a5)
    6140:	5e850513          	addi	a0,a0,1512 # 85e8 <LfnOfs+0x10>
    6144:	b94fc06f          	j	24d8 <printf>
    6148:	00008067          	ret

0000614c <sdram_software_control_off>:
    614c:	f00037b7          	lui	a5,0xf0003
    6150:	8007a683          	lw	a3,-2048(a5) # f0002800 <_fstack+0xe0001800>
    6154:	00100713          	li	a4,1
    6158:	00e68a63          	beq	a3,a4,616c <sdram_software_control_off+0x20>
    615c:	00008537          	lui	a0,0x8
    6160:	80e7a023          	sw	a4,-2048(a5)
    6164:	61050513          	addi	a0,a0,1552 # 8610 <LfnOfs+0x38>
    6168:	b70fc06f          	j	24d8 <printf>
    616c:	00008067          	ret

00006170 <sdram_mode_register_write>:
    6170:	f00037b7          	lui	a5,0xf0003
    6174:	80b7a623          	sw	a1,-2036(a5) # f000280c <_fstack+0xe000180c>
    6178:	80a7a823          	sw	a0,-2032(a5)
    617c:	00f00713          	li	a4,15
    6180:	80e7a223          	sw	a4,-2044(a5)
    6184:	00100713          	li	a4,1
    6188:	80e7a423          	sw	a4,-2040(a5)
    618c:	00008067          	ret

00006190 <sdram_leveling>:
    6190:	ff010113          	addi	sp,sp,-16
    6194:	00112623          	sw	ra,12(sp)
    6198:	f91ff0ef          	jal	ra,6128 <sdram_software_control_on>
    619c:	fb1ff0ef          	jal	ra,614c <sdram_software_control_off>
    61a0:	00c12083          	lw	ra,12(sp)
    61a4:	00100513          	li	a0,1
    61a8:	01010113          	addi	sp,sp,16
    61ac:	00008067          	ret

000061b0 <sdram_init>:
    61b0:	00008537          	lui	a0,0x8
    61b4:	fe010113          	addi	sp,sp,-32
    61b8:	400005b7          	lui	a1,0x40000
    61bc:	63850513          	addi	a0,a0,1592 # 8638 <LfnOfs+0x60>
    61c0:	00112e23          	sw	ra,28(sp)
    61c4:	00812c23          	sw	s0,24(sp)
    61c8:	00912a23          	sw	s1,20(sp)
    61cc:	f0003437          	lui	s0,0xf0003
    61d0:	01212823          	sw	s2,16(sp)
    61d4:	01312623          	sw	s3,12(sp)
    61d8:	01412423          	sw	s4,8(sp)
    61dc:	afcfc0ef          	jal	ra,24d8 <printf>
    61e0:	f49ff0ef          	jal	ra,6128 <sdram_software_control_on>
    61e4:	80042623          	sw	zero,-2036(s0) # f000280c <_fstack+0xe000180c>
    61e8:	00e00793          	li	a5,14
    61ec:	80042823          	sw	zero,-2032(s0)
    61f0:	00005537          	lui	a0,0x5
    61f4:	80f42023          	sw	a5,-2048(s0)
    61f8:	e2050513          	addi	a0,a0,-480 # 4e20 <mount_volume.isra.0+0x284>
    61fc:	40000a13          	li	s4,1024
    6200:	ef5ff0ef          	jal	ra,60f4 <cdelay>
    6204:	81442623          	sw	s4,-2036(s0)
    6208:	80042823          	sw	zero,-2032(s0)
    620c:	00b00993          	li	s3,11
    6210:	81342223          	sw	s3,-2044(s0)
    6214:	00100493          	li	s1,1
    6218:	80942423          	sw	s1,-2040(s0)
    621c:	12000793          	li	a5,288
    6220:	80f42623          	sw	a5,-2036(s0)
    6224:	80042823          	sw	zero,-2032(s0)
    6228:	00f00913          	li	s2,15
    622c:	81242223          	sw	s2,-2044(s0)
    6230:	0c800513          	li	a0,200
    6234:	80942423          	sw	s1,-2040(s0)
    6238:	ebdff0ef          	jal	ra,60f4 <cdelay>
    623c:	81442623          	sw	s4,-2036(s0)
    6240:	80042823          	sw	zero,-2032(s0)
    6244:	81342223          	sw	s3,-2044(s0)
    6248:	80942423          	sw	s1,-2040(s0)
    624c:	80042623          	sw	zero,-2036(s0)
    6250:	80042823          	sw	zero,-2032(s0)
    6254:	00d00993          	li	s3,13
    6258:	81342223          	sw	s3,-2044(s0)
    625c:	00400513          	li	a0,4
    6260:	80942423          	sw	s1,-2040(s0)
    6264:	e91ff0ef          	jal	ra,60f4 <cdelay>
    6268:	80042623          	sw	zero,-2036(s0)
    626c:	80042823          	sw	zero,-2032(s0)
    6270:	81342223          	sw	s3,-2044(s0)
    6274:	00400513          	li	a0,4
    6278:	80942423          	sw	s1,-2040(s0)
    627c:	e79ff0ef          	jal	ra,60f4 <cdelay>
    6280:	02000793          	li	a5,32
    6284:	80f42623          	sw	a5,-2036(s0)
    6288:	80042823          	sw	zero,-2032(s0)
    628c:	81242223          	sw	s2,-2044(s0)
    6290:	0c800513          	li	a0,200
    6294:	80942423          	sw	s1,-2040(s0)
    6298:	e5dff0ef          	jal	ra,60f4 <cdelay>
    629c:	eb1ff0ef          	jal	ra,614c <sdram_software_control_off>
    62a0:	08000593          	li	a1,128
    62a4:	40000537          	lui	a0,0x40000
    62a8:	ce9fd0ef          	jal	ra,3f90 <memtest>
    62ac:	00050e63          	beqz	a0,62c8 <sdram_init+0x118>
    62b0:	40000537          	lui	a0,0x40000
    62b4:	00000693          	li	a3,0
    62b8:	00000613          	li	a2,0
    62bc:	08000593          	li	a1,128
    62c0:	a89fd0ef          	jal	ra,3d48 <memspeed>
    62c4:	00100513          	li	a0,1
    62c8:	01c12083          	lw	ra,28(sp)
    62cc:	01812403          	lw	s0,24(sp)
    62d0:	01412483          	lw	s1,20(sp)
    62d4:	01012903          	lw	s2,16(sp)
    62d8:	00c12983          	lw	s3,12(sp)
    62dc:	00812a03          	lw	s4,8(sp)
    62e0:	02010113          	addi	sp,sp,32
    62e4:	00008067          	ret

000062e8 <print_size>:
    62e8:	fe010113          	addi	sp,sp,-32
    62ec:	00812c23          	sw	s0,24(sp)
    62f0:	00112e23          	sw	ra,28(sp)
    62f4:	00912a23          	sw	s1,20(sp)
    62f8:	01212823          	sw	s2,16(sp)
    62fc:	01312623          	sw	s3,12(sp)
    6300:	00050413          	mv	s0,a0
    6304:	00058693          	mv	a3,a1
    6308:	08059063          	bnez	a1,6388 <print_size+0xa0>
    630c:	3ff00793          	li	a5,1023
    6310:	02a7e663          	bltu	a5,a0,633c <print_size+0x54>
    6314:	01812403          	lw	s0,24(sp)
    6318:	01c12083          	lw	ra,28(sp)
    631c:	01412483          	lw	s1,20(sp)
    6320:	01012903          	lw	s2,16(sp)
    6324:	00c12983          	lw	s3,12(sp)
    6328:	00050613          	mv	a2,a0
    632c:	00008537          	lui	a0,0x8
    6330:	65850513          	addi	a0,a0,1624 # 8658 <LfnOfs+0x80>
    6334:	02010113          	addi	sp,sp,32
    6338:	9a0fc06f          	j	24d8 <printf>
    633c:	001007b7          	lui	a5,0x100
    6340:	04f57463          	bgeu	a0,a5,6388 <print_size+0xa0>
    6344:	06600613          	li	a2,102
    6348:	00000693          	li	a3,0
    634c:	3ff57513          	andi	a0,a0,1023
    6350:	82cfd0ef          	jal	ra,337c <__udivdi3>
    6354:	00050713          	mv	a4,a0
    6358:	00008537          	lui	a0,0x8
    635c:	00058793          	mv	a5,a1
    6360:	00a45613          	srli	a2,s0,0xa
    6364:	00000693          	li	a3,0
    6368:	66050513          	addi	a0,a0,1632 # 8660 <LfnOfs+0x88>
    636c:	01812403          	lw	s0,24(sp)
    6370:	01c12083          	lw	ra,28(sp)
    6374:	01412483          	lw	s1,20(sp)
    6378:	01012903          	lw	s2,16(sp)
    637c:	00c12983          	lw	s3,12(sp)
    6380:	02010113          	addi	sp,sp,32
    6384:	954fc06f          	j	24d8 <printf>
    6388:	00c69793          	slli	a5,a3,0xc
    638c:	01445913          	srli	s2,s0,0x14
    6390:	0127e933          	or	s2,a5,s2
    6394:	0146d993          	srli	s3,a3,0x14
    6398:	04069c63          	bnez	a3,63f0 <print_size+0x108>
    639c:	400007b7          	lui	a5,0x40000
    63a0:	04f47863          	bgeu	s0,a5,63f0 <print_size+0x108>
    63a4:	01695793          	srli	a5,s2,0x16
    63a8:	00a45413          	srli	s0,s0,0xa
    63ac:	00a99593          	slli	a1,s3,0xa
    63b0:	00a91513          	slli	a0,s2,0xa
    63b4:	00b7e5b3          	or	a1,a5,a1
    63b8:	40a40533          	sub	a0,s0,a0
    63bc:	00a43433          	sltu	s0,s0,a0
    63c0:	40b005b3          	neg	a1,a1
    63c4:	06600613          	li	a2,102
    63c8:	00000693          	li	a3,0
    63cc:	408585b3          	sub	a1,a1,s0
    63d0:	fadfc0ef          	jal	ra,337c <__udivdi3>
    63d4:	00050713          	mv	a4,a0
    63d8:	00008537          	lui	a0,0x8
    63dc:	00058793          	mv	a5,a1
    63e0:	00090613          	mv	a2,s2
    63e4:	00098693          	mv	a3,s3
    63e8:	67050513          	addi	a0,a0,1648 # 8670 <LfnOfs+0x98>
    63ec:	f81ff06f          	j	636c <print_size+0x84>
    63f0:	00269793          	slli	a5,a3,0x2
    63f4:	01e45413          	srli	s0,s0,0x1e
    63f8:	0087e433          	or	s0,a5,s0
    63fc:	01e6d493          	srli	s1,a3,0x1e
    6400:	01645793          	srli	a5,s0,0x16
    6404:	00a49593          	slli	a1,s1,0xa
    6408:	00a41513          	slli	a0,s0,0xa
    640c:	00b7e5b3          	or	a1,a5,a1
    6410:	40a90533          	sub	a0,s2,a0
    6414:	00a93933          	sltu	s2,s2,a0
    6418:	40b985b3          	sub	a1,s3,a1
    641c:	06600613          	li	a2,102
    6420:	00000693          	li	a3,0
    6424:	412585b3          	sub	a1,a1,s2
    6428:	f55fc0ef          	jal	ra,337c <__udivdi3>
    642c:	00050713          	mv	a4,a0
    6430:	00008537          	lui	a0,0x8
    6434:	00058793          	mv	a5,a1
    6438:	00040613          	mv	a2,s0
    643c:	00048693          	mv	a3,s1
    6440:	68050513          	addi	a0,a0,1664 # 8680 <LfnOfs+0xa8>
    6444:	f29ff06f          	j	636c <print_size+0x84>

00006448 <print_progress>:
    6448:	ff010113          	addi	sp,sp,-16
    644c:	00812423          	sw	s0,8(sp)
    6450:	00070413          	mv	s0,a4
    6454:	00d58733          	add	a4,a1,a3
    6458:	00912223          	sw	s1,4(sp)
    645c:	00060813          	mv	a6,a2
    6460:	00068493          	mv	s1,a3
    6464:	008607b3          	add	a5,a2,s0
    6468:	00b736b3          	sltu	a3,a4,a1
    646c:	00058613          	mv	a2,a1
    6470:	00050593          	mv	a1,a0
    6474:	00008537          	lui	a0,0x8
    6478:	00f687b3          	add	a5,a3,a5
    647c:	69050513          	addi	a0,a0,1680 # 8690 <LfnOfs+0xb8>
    6480:	00080693          	mv	a3,a6
    6484:	00112623          	sw	ra,12(sp)
    6488:	850fc0ef          	jal	ra,24d8 <printf>
    648c:	00048513          	mv	a0,s1
    6490:	00040593          	mv	a1,s0
    6494:	e55ff0ef          	jal	ra,62e8 <print_size>
    6498:	00812403          	lw	s0,8(sp)
    649c:	00c12083          	lw	ra,12(sp)
    64a0:	00412483          	lw	s1,4(sp)
    64a4:	00008537          	lui	a0,0x8
    64a8:	f1050513          	addi	a0,a0,-240 # 7f10 <crc_table+0x44c>
    64ac:	01010113          	addi	sp,sp,16
    64b0:	828fc06f          	j	24d8 <printf>

000064b4 <sdram_get_supported_memory>:
    64b4:	02000537          	lui	a0,0x2000
    64b8:	00000593          	li	a1,0
    64bc:	00008067          	ret

000064c0 <spi_xfer>:
    64c0:	f0003737          	lui	a4,0xf0003
    64c4:	000017b7          	lui	a5,0x1
    64c8:	00a72423          	sw	a0,8(a4) # f0003008 <_fstack+0xe0002008>
    64cc:	80178793          	addi	a5,a5,-2047 # 801 <boot+0x19>
    64d0:	00f72023          	sw	a5,0(a4)
    64d4:	00472783          	lw	a5,4(a4)
    64d8:	0017f793          	andi	a5,a5,1
    64dc:	fe078ce3          	beqz	a5,64d4 <spi_xfer+0x14>
    64e0:	00c72503          	lw	a0,12(a4)
    64e4:	0ff57513          	andi	a0,a0,255
    64e8:	00008067          	ret

000064ec <spisdcard_deselect>:
    64ec:	f00037b7          	lui	a5,0xf0003
    64f0:	0007a823          	sw	zero,16(a5) # f0003010 <_fstack+0xe0002010>
    64f4:	0ff00513          	li	a0,255
    64f8:	fc9ff06f          	j	64c0 <spi_xfer>

000064fc <spisdcardread_bytes>:
    64fc:	ff010113          	addi	sp,sp,-16
    6500:	00812423          	sw	s0,8(sp)
    6504:	00912223          	sw	s1,4(sp)
    6508:	01212023          	sw	s2,0(sp)
    650c:	00112623          	sw	ra,12(sp)
    6510:	00050913          	mv	s2,a0
    6514:	00058493          	mv	s1,a1
    6518:	00000413          	li	s0,0
    651c:	0ff00513          	li	a0,255
    6520:	fa1ff0ef          	jal	ra,64c0 <spi_xfer>
    6524:	008907b3          	add	a5,s2,s0
    6528:	00140413          	addi	s0,s0,1
    652c:	00a78023          	sb	a0,0(a5)
    6530:	01041793          	slli	a5,s0,0x10
    6534:	0107d793          	srli	a5,a5,0x10
    6538:	fe97e2e3          	bltu	a5,s1,651c <spisdcardread_bytes+0x20>
    653c:	00c12083          	lw	ra,12(sp)
    6540:	00812403          	lw	s0,8(sp)
    6544:	00412483          	lw	s1,4(sp)
    6548:	00012903          	lw	s2,0(sp)
    654c:	01010113          	addi	sp,sp,16
    6550:	00008067          	ret

00006554 <spisd_disk_status>:
    6554:	00051863          	bnez	a0,6564 <spisd_disk_status+0x10>
    6558:	100007b7          	lui	a5,0x10000
    655c:	1647c503          	lbu	a0,356(a5) # 10000164 <spisdcardstatus>
    6560:	00008067          	ret
    6564:	00100513          	li	a0,1
    6568:	00008067          	ret

0000656c <spisdcardsend_cmd>:
    656c:	fe010113          	addi	sp,sp,-32
    6570:	01851793          	slli	a5,a0,0x18
    6574:	00812c23          	sw	s0,24(sp)
    6578:	00912a23          	sw	s1,20(sp)
    657c:	00112e23          	sw	ra,28(sp)
    6580:	01212823          	sw	s2,16(sp)
    6584:	4187d793          	srai	a5,a5,0x18
    6588:	00050413          	mv	s0,a0
    658c:	00058493          	mv	s1,a1
    6590:	0207d063          	bgez	a5,65b0 <spisdcardsend_cmd+0x44>
    6594:	00000593          	li	a1,0
    6598:	03700513          	li	a0,55
    659c:	fd1ff0ef          	jal	ra,656c <spisdcardsend_cmd>
    65a0:	00a103a3          	sb	a0,7(sp)
    65a4:	00100793          	li	a5,1
    65a8:	06a7e063          	bltu	a5,a0,6608 <spisdcardsend_cmd+0x9c>
    65ac:	07f47413          	andi	s0,s0,127
    65b0:	00c00793          	li	a5,12
    65b4:	06f40663          	beq	s0,a5,6620 <spisdcardsend_cmd+0xb4>
    65b8:	06040463          	beqz	s0,6620 <spisdcardsend_cmd+0xb4>
    65bc:	f31ff0ef          	jal	ra,64ec <spisdcard_deselect>
    65c0:	f00037b7          	lui	a5,0xf0003
    65c4:	00100713          	li	a4,1
    65c8:	00e7a823          	sw	a4,16(a5) # f0003010 <_fstack+0xe0002010>
    65cc:	0ff00513          	li	a0,255
    65d0:	ef1ff0ef          	jal	ra,64c0 <spi_xfer>
    65d4:	1f400913          	li	s2,500
    65d8:	0ff00513          	li	a0,255
    65dc:	ee5ff0ef          	jal	ra,64c0 <spi_xfer>
    65e0:	0ff00793          	li	a5,255
    65e4:	02f50e63          	beq	a0,a5,6620 <spisdcardsend_cmd+0xb4>
    65e8:	fff90913          	addi	s2,s2,-1
    65ec:	01091913          	slli	s2,s2,0x10
    65f0:	00100513          	li	a0,1
    65f4:	01095913          	srli	s2,s2,0x10
    65f8:	814fd0ef          	jal	ra,360c <busy_wait>
    65fc:	fc091ee3          	bnez	s2,65d8 <spisdcardsend_cmd+0x6c>
    6600:	eedff0ef          	jal	ra,64ec <spisdcard_deselect>
    6604:	0ff00513          	li	a0,255
    6608:	01c12083          	lw	ra,28(sp)
    660c:	01812403          	lw	s0,24(sp)
    6610:	01412483          	lw	s1,20(sp)
    6614:	01012903          	lw	s2,16(sp)
    6618:	02010113          	addi	sp,sp,32
    661c:	00008067          	ret
    6620:	04046793          	ori	a5,s0,64
    6624:	00f10423          	sb	a5,8(sp)
    6628:	0184d793          	srli	a5,s1,0x18
    662c:	00f104a3          	sb	a5,9(sp)
    6630:	0104d793          	srli	a5,s1,0x10
    6634:	00f10523          	sb	a5,10(sp)
    6638:	0084d793          	srli	a5,s1,0x8
    663c:	00f105a3          	sb	a5,11(sp)
    6640:	00910623          	sb	s1,12(sp)
    6644:	f9500793          	li	a5,-107
    6648:	00040863          	beqz	s0,6658 <spisdcardsend_cmd+0xec>
    664c:	00800793          	li	a5,8
    6650:	06f41863          	bne	s0,a5,66c0 <spisdcardsend_cmd+0x154>
    6654:	f8700793          	li	a5,-121
    6658:	00f106a3          	sb	a5,13(sp)
    665c:	00000493          	li	s1,0
    6660:	00600913          	li	s2,6
    6664:	00810793          	addi	a5,sp,8
    6668:	009787b3          	add	a5,a5,s1
    666c:	0007c503          	lbu	a0,0(a5)
    6670:	00148493          	addi	s1,s1,1
    6674:	e4dff0ef          	jal	ra,64c0 <spi_xfer>
    6678:	ff2496e3          	bne	s1,s2,6664 <spisdcardsend_cmd+0xf8>
    667c:	00c00793          	li	a5,12
    6680:	00f41863          	bne	s0,a5,6690 <spisdcardsend_cmd+0x124>
    6684:	00100593          	li	a1,1
    6688:	00710513          	addi	a0,sp,7
    668c:	e71ff0ef          	jal	ra,64fc <spisdcardread_bytes>
    6690:	00a00413          	li	s0,10
    6694:	00710513          	addi	a0,sp,7
    6698:	00100593          	li	a1,1
    669c:	e61ff0ef          	jal	ra,64fc <spisdcardread_bytes>
    66a0:	00714503          	lbu	a0,7(sp)
    66a4:	01851793          	slli	a5,a0,0x18
    66a8:	4187d793          	srai	a5,a5,0x18
    66ac:	f407dee3          	bgez	a5,6608 <spisdcardsend_cmd+0x9c>
    66b0:	fff40413          	addi	s0,s0,-1
    66b4:	0ff47413          	andi	s0,s0,255
    66b8:	fc041ee3          	bnez	s0,6694 <spisdcardsend_cmd+0x128>
    66bc:	f4dff06f          	j	6608 <spisdcardsend_cmd+0x9c>
    66c0:	00100793          	li	a5,1
    66c4:	f95ff06f          	j	6658 <spisdcardsend_cmd+0xec>

000066c8 <spisd_disk_read>:
    66c8:	fd010113          	addi	sp,sp,-48
    66cc:	03212023          	sw	s2,32(sp)
    66d0:	00100913          	li	s2,1
    66d4:	00d93933          	sltu	s2,s2,a3
    66d8:	01190913          	addi	s2,s2,17
    66dc:	02812423          	sw	s0,40(sp)
    66e0:	00090513          	mv	a0,s2
    66e4:	00058413          	mv	s0,a1
    66e8:	00060593          	mv	a1,a2
    66ec:	02912223          	sw	s1,36(sp)
    66f0:	02112623          	sw	ra,44(sp)
    66f4:	01312e23          	sw	s3,28(sp)
    66f8:	01412c23          	sw	s4,24(sp)
    66fc:	01512a23          	sw	s5,20(sp)
    6700:	01612823          	sw	s6,16(sp)
    6704:	01712623          	sw	s7,12(sp)
    6708:	00068493          	mv	s1,a3
    670c:	e61ff0ef          	jal	ra,656c <spisdcardsend_cmd>
    6710:	04051863          	bnez	a0,6760 <spisd_disk_read+0x98>
    6714:	00001a37          	lui	s4,0x1
    6718:	00018b37          	lui	s6,0x18
    671c:	0fe00b93          	li	s7,254
    6720:	f00039b7          	lui	s3,0xf0003
    6724:	801a0a13          	addi	s4,s4,-2047 # 801 <boot+0x19>
    6728:	02048263          	beqz	s1,674c <spisd_disk_read+0x84>
    672c:	6a0b0a93          	addi	s5,s6,1696 # 186a0 <_edata_rom+0xfe34>
    6730:	0ff00513          	li	a0,255
    6734:	d8dff0ef          	jal	ra,64c0 <spi_xfer>
    6738:	05750e63          	beq	a0,s7,6794 <spisd_disk_read+0xcc>
    673c:	00100513          	li	a0,1
    6740:	fffa8a93          	addi	s5,s5,-1
    6744:	f09fc0ef          	jal	ra,364c <busy_wait_us>
    6748:	fe0a94e3          	bnez	s5,6730 <spisd_disk_read+0x68>
    674c:	01200793          	li	a5,18
    6750:	00f91863          	bne	s2,a5,6760 <spisd_disk_read+0x98>
    6754:	00000593          	li	a1,0
    6758:	00c00513          	li	a0,12
    675c:	e11ff0ef          	jal	ra,656c <spisdcardsend_cmd>
    6760:	d8dff0ef          	jal	ra,64ec <spisdcard_deselect>
    6764:	02c12083          	lw	ra,44(sp)
    6768:	02812403          	lw	s0,40(sp)
    676c:	02012903          	lw	s2,32(sp)
    6770:	01c12983          	lw	s3,28(sp)
    6774:	01812a03          	lw	s4,24(sp)
    6778:	01412a83          	lw	s5,20(sp)
    677c:	01012b03          	lw	s6,16(sp)
    6780:	00c12b83          	lw	s7,12(sp)
    6784:	00903533          	snez	a0,s1
    6788:	02412483          	lw	s1,36(sp)
    678c:	03010113          	addi	sp,sp,48
    6790:	00008067          	ret
    6794:	0ff00793          	li	a5,255
    6798:	00f9a423          	sw	a5,8(s3) # f0003008 <_fstack+0xe0002008>
    679c:	00100713          	li	a4,1
    67a0:	20040793          	addi	a5,s0,512
    67a4:	0149a023          	sw	s4,0(s3)
    67a8:	0049a683          	lw	a3,4(s3)
    67ac:	fee69ee3          	bne	a3,a4,67a8 <spisd_disk_read+0xe0>
    67b0:	00c9a683          	lw	a3,12(s3)
    67b4:	00140413          	addi	s0,s0,1
    67b8:	fed40fa3          	sb	a3,-1(s0)
    67bc:	fef414e3          	bne	s0,a5,67a4 <spisd_disk_read+0xdc>
    67c0:	0ff00513          	li	a0,255
    67c4:	cfdff0ef          	jal	ra,64c0 <spi_xfer>
    67c8:	0ff00513          	li	a0,255
    67cc:	cf5ff0ef          	jal	ra,64c0 <spi_xfer>
    67d0:	fff48493          	addi	s1,s1,-1
    67d4:	f55ff06f          	j	6728 <spisd_disk_read+0x60>

000067d8 <spisdcard_init>:
    67d8:	fd010113          	addi	sp,sp,-48
    67dc:	02912223          	sw	s1,36(sp)
    67e0:	03212023          	sw	s2,32(sp)
    67e4:	01312e23          	sw	s3,28(sp)
    67e8:	02112623          	sw	ra,44(sp)
    67ec:	02812423          	sw	s0,40(sp)
    67f0:	f00037b7          	lui	a5,0xf0003
    67f4:	07e00713          	li	a4,126
    67f8:	00e7ac23          	sw	a4,24(a5) # f0003018 <_fstack+0xe0002018>
    67fc:	3e800493          	li	s1,1000
    6800:	f0003937          	lui	s2,0xf0003
    6804:	00100993          	li	s3,1
    6808:	00092823          	sw	zero,16(s2) # f0003010 <_fstack+0xe0002010>
    680c:	00a00413          	li	s0,10
    6810:	fff40413          	addi	s0,s0,-1
    6814:	0ff00513          	li	a0,255
    6818:	0ff47413          	andi	s0,s0,255
    681c:	ca5ff0ef          	jal	ra,64c0 <spi_xfer>
    6820:	fe0418e3          	bnez	s0,6810 <spisdcard_init+0x38>
    6824:	01392823          	sw	s3,16(s2)
    6828:	00000593          	li	a1,0
    682c:	00000513          	li	a0,0
    6830:	d3dff0ef          	jal	ra,656c <spisdcardsend_cmd>
    6834:	05350463          	beq	a0,s3,687c <spisdcard_init+0xa4>
    6838:	fff48493          	addi	s1,s1,-1
    683c:	01049493          	slli	s1,s1,0x10
    6840:	0104d493          	srli	s1,s1,0x10
    6844:	fc0492e3          	bnez	s1,6808 <spisdcard_init+0x30>
    6848:	02c12083          	lw	ra,44(sp)
    684c:	00040513          	mv	a0,s0
    6850:	02812403          	lw	s0,40(sp)
    6854:	02412483          	lw	s1,36(sp)
    6858:	02012903          	lw	s2,32(sp)
    685c:	01c12983          	lw	s3,28(sp)
    6860:	03010113          	addi	sp,sp,48
    6864:	00008067          	ret
    6868:	f00037b7          	lui	a5,0xf0003
    686c:	00300713          	li	a4,3
    6870:	00e7ac23          	sw	a4,24(a5) # f0003018 <_fstack+0xe0002018>
    6874:	00090413          	mv	s0,s2
    6878:	fd1ff06f          	j	6848 <spisdcard_init+0x70>
    687c:	1aa00593          	li	a1,426
    6880:	00800513          	li	a0,8
    6884:	ce9ff0ef          	jal	ra,656c <spisdcardsend_cmd>
    6888:	00050913          	mv	s2,a0
    688c:	fb351ee3          	bne	a0,s3,6848 <spisdcard_init+0x70>
    6890:	00400593          	li	a1,4
    6894:	00c10513          	addi	a0,sp,12
    6898:	c65ff0ef          	jal	ra,64fc <spisdcardread_bytes>
    689c:	3e800493          	li	s1,1000
    68a0:	400005b7          	lui	a1,0x40000
    68a4:	0a900513          	li	a0,169
    68a8:	cc5ff0ef          	jal	ra,656c <spisdcardsend_cmd>
    68ac:	fa050ee3          	beqz	a0,6868 <spisdcard_init+0x90>
    68b0:	fff48493          	addi	s1,s1,-1
    68b4:	01049493          	slli	s1,s1,0x10
    68b8:	00100513          	li	a0,1
    68bc:	0104d493          	srli	s1,s1,0x10
    68c0:	d4dfc0ef          	jal	ra,360c <busy_wait>
    68c4:	fc049ee3          	bnez	s1,68a0 <spisdcard_init+0xc8>
    68c8:	f81ff06f          	j	6848 <spisdcard_init+0x70>

000068cc <spisd_disk_initialize>:
    68cc:	04051063          	bnez	a0,690c <spisd_disk_initialize+0x40>
    68d0:	ff010113          	addi	sp,sp,-16
    68d4:	00812423          	sw	s0,8(sp)
    68d8:	10000437          	lui	s0,0x10000
    68dc:	16444783          	lbu	a5,356(s0) # 10000164 <spisdcardstatus>
    68e0:	00112623          	sw	ra,12(sp)
    68e4:	00078a63          	beqz	a5,68f8 <spisd_disk_initialize+0x2c>
    68e8:	ef1ff0ef          	jal	ra,67d8 <spisdcard_init>
    68ec:	00153513          	seqz	a0,a0
    68f0:	16a40223          	sb	a0,356(s0)
    68f4:	bf9ff0ef          	jal	ra,64ec <spisdcard_deselect>
    68f8:	16444503          	lbu	a0,356(s0)
    68fc:	00c12083          	lw	ra,12(sp)
    6900:	00812403          	lw	s0,8(sp)
    6904:	01010113          	addi	sp,sp,16
    6908:	00008067          	ret
    690c:	00100513          	li	a0,1
    6910:	00008067          	ret

00006914 <fatfs_set_ops_spisdcard>:
    6914:	100007b7          	lui	a5,0x10000
    6918:	10000737          	lui	a4,0x10000
    691c:	15078793          	addi	a5,a5,336 # 10000150 <SpiSdDiskOps>
    6920:	4af72c23          	sw	a5,1208(a4) # 100004b8 <FfDiskOps>
    6924:	00008067          	ret
