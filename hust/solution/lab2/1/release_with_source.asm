
main_release:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000004b0 <_calculate_average>:
;     for (i = 0; i < count; ++i) {
1000004b0: 7100043f    	cmp	w1, #0x1
1000004b4: 540000eb    	b.lt	0x1000004d0 <_calculate_average+0x20>
1000004b8: 2a0103e8    	mov	w8, w1
1000004bc: 7100803f    	cmp	w1, #0x20
1000004c0: 540000c2    	b.hs	0x1000004d8 <_calculate_average+0x28>
1000004c4: d2800009    	mov	x9, #0x0                ; =0
1000004c8: 5280000a    	mov	w10, #0x0               ; =0
;     for (i = 0; i < count; ++i) {
1000004cc: 14000025    	b	0x100000560 <_calculate_average+0xb0>
1000004d0: 5280000a    	mov	w10, #0x0               ; =0
1000004d4: 14000029    	b	0x100000578 <_calculate_average+0xc8>
1000004d8: 6f00e400    	movi.2d	v0, #0000000000000000
;     for (i = 0; i < count; ++i) {
1000004dc: 927b6509    	and	x9, x8, #0x7fffffe0
1000004e0: 6f00e401    	movi.2d	v1, #0000000000000000
1000004e4: 9100800a    	add	x10, x0, #0x20
1000004e8: aa0903eb    	mov	x11, x9
1000004ec: 6f00e403    	movi.2d	v3, #0000000000000000
1000004f0: 6f00e404    	movi.2d	v4, #0000000000000000
1000004f4: 6f00e405    	movi.2d	v5, #0000000000000000
1000004f8: 6f00e402    	movi.2d	v2, #0000000000000000
1000004fc: 6f00e407    	movi.2d	v7, #0000000000000000
100000500: 6f00e406    	movi.2d	v6, #0000000000000000
;         sum += scores[i];
100000504: ad7f4550    	ldp	q16, q17, [x10, #-0x20]
100000508: 4e701021    	saddw2.4s	v1, v1, v16
10000050c: 0e701000    	saddw.4s	v0, v0, v16
100000510: acc24950    	ldp	q16, q18, [x10], #0x40
100000514: 4e711084    	saddw2.4s	v4, v4, v17
100000518: 0e711063    	saddw.4s	v3, v3, v17
10000051c: 4e701042    	saddw2.4s	v2, v2, v16
100000520: 0e7010a5    	saddw.4s	v5, v5, v16
100000524: 4e7210c6    	saddw2.4s	v6, v6, v18
100000528: 0e7210e7    	saddw.4s	v7, v7, v18
;     for (i = 0; i < count; ++i) {
10000052c: f100816b    	subs	x11, x11, #0x20
100000530: 54fffea1    	b.ne	0x100000504 <_calculate_average+0x54>
100000534: 4ea08460    	add.4s	v0, v3, v0
100000538: 4ea18481    	add.4s	v1, v4, v1
10000053c: 4ea584e3    	add.4s	v3, v7, v5
100000540: 4ea08460    	add.4s	v0, v3, v0
100000544: 4ea284c2    	add.4s	v2, v6, v2
100000548: 4ea18441    	add.4s	v1, v2, v1
10000054c: 4ea18400    	add.4s	v0, v0, v1
100000550: 4eb1b800    	addv.4s	s0, v0
100000554: 1e26000a    	fmov	w10, s0
100000558: eb08013f    	cmp	x9, x8
10000055c: 540000e0    	b.eq	0x100000578 <_calculate_average+0xc8>
100000560: 8b09040b    	add	x11, x0, x9, lsl #1
100000564: cb090108    	sub	x8, x8, x9
;         sum += scores[i];
100000568: 78c02569    	ldrsh	w9, [x11], #0x2
10000056c: 0b09014a    	add	w10, w10, w9
;     for (i = 0; i < count; ++i) {
100000570: f1000508    	subs	x8, x8, #0x1
100000574: 54ffffa1    	b.ne	0x100000568 <_calculate_average+0xb8>
;     return (short)(sum / count);
100000578: 1ac10d48    	sdiv	w8, w10, w1
10000057c: 13003d00    	sxth	w0, w8
100000580: d65f03c0    	ret

0000000100000584 <_compare_student_desc>:
;     return sb->average - sa->average;
100000584: 79c04828    	ldrsh	w8, [x1, #0x24]
100000588: 79c04809    	ldrsh	w9, [x0, #0x24]
10000058c: 4b090100    	sub	w0, w8, w9
100000590: d65f03c0    	ret

0000000100000594 <_print_result>:
; void print_result(const struct student students[], int n) {
100000594: d10143ff    	sub	sp, sp, #0x50
100000598: a90257f6    	stp	x22, x21, [sp, #0x20]
10000059c: a9034ff4    	stp	x20, x19, [sp, #0x30]
1000005a0: a9047bfd    	stp	x29, x30, [sp, #0x40]
1000005a4: 910103fd    	add	x29, sp, #0x40
1000005a8: aa0103f4    	mov	x20, x1
1000005ac: aa0003f3    	mov	x19, x0
;     printf("\n===== 平均成绩排名（高到低）=====\n");
1000005b0: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
1000005b4: 91265800    	add	x0, x0, #0x996
1000005b8: 940000cb    	bl	0x1000008e4 <_qsort+0x1000008e4>
;     printf("%-4s %-10s %-12s %-8s\n", "排名", "姓名", "学号", "平均分");
1000005bc: 90000008    	adrp	x8, 0x100000000 <_qsort+0x100000000>
1000005c0: 9124a108    	add	x8, x8, #0x928
1000005c4: 90000009    	adrp	x9, 0x100000000 <_qsort+0x100000000>
1000005c8: 91248529    	add	x9, x9, #0x921
1000005cc: 9000000a    	adrp	x10, 0x100000000 <_qsort+0x100000000>
1000005d0: 9124694a    	add	x10, x10, #0x91a
1000005d4: 9000000b    	adrp	x11, 0x100000000 <_qsort+0x100000000>
1000005d8: 91244d6b    	add	x11, x11, #0x913
1000005dc: a90123e9    	stp	x9, x8, [sp, #0x10]
1000005e0: a9002beb    	stp	x11, x10, [sp]
1000005e4: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
1000005e8: 9123f000    	add	x0, x0, #0x8fc
1000005ec: 940000bb    	bl	0x1000008d8 <_qsort+0x1000008d8>
;     for (i = 0; i < n; ++i) {
1000005f0: 7100069f    	cmp	w20, #0x1
1000005f4: 540001eb    	b.lt	0x100000630 <_print_result+0x9c>
1000005f8: 2a1403f5    	mov	w21, w20
1000005fc: 52800036    	mov	w22, #0x1               ; =1
100000600: 90000014    	adrp	x20, 0x100000000 <_qsort+0x100000000>
100000604: 9124ca94    	add	x20, x20, #0x932
;         printf("%-4d %-10s %-12s %-8hd\n", i + 1, students[i].name, students[i].sid, students[i].average);
100000608: 91002268    	add	x8, x19, #0x8
10000060c: 79804a69    	ldrsh	x9, [x19, #0x24]
100000610: a90127e8    	stp	x8, x9, [sp, #0x10]
100000614: a9004ff6    	stp	x22, x19, [sp]
100000618: aa1403e0    	mov	x0, x20
10000061c: 940000af    	bl	0x1000008d8 <_qsort+0x1000008d8>
;     for (i = 0; i < n; ++i) {
100000620: 91009a73    	add	x19, x19, #0x26
100000624: 110006d6    	add	w22, w22, #0x1
100000628: f10006b5    	subs	x21, x21, #0x1
10000062c: 54fffee1    	b.ne	0x100000608 <_print_result+0x74>
; }
100000630: a9447bfd    	ldp	x29, x30, [sp, #0x40]
100000634: a9434ff4    	ldp	x20, x19, [sp, #0x30]
100000638: a94257f6    	ldp	x22, x21, [sp, #0x20]
10000063c: 910143ff    	add	sp, sp, #0x50
100000640: d65f03c0    	ret

0000000100000644 <_main>:
; int main() {
100000644: d104c3ff    	sub	sp, sp, #0x130
100000648: 6d0c23e9    	stp	d9, d8, [sp, #0xc0]
10000064c: a90d6ffc    	stp	x28, x27, [sp, #0xd0]
100000650: a90e67fa    	stp	x26, x25, [sp, #0xe0]
100000654: a90f5ff8    	stp	x24, x23, [sp, #0xf0]
100000658: a91057f6    	stp	x22, x21, [sp, #0x100]
10000065c: a9114ff4    	stp	x20, x19, [sp, #0x110]
100000660: a9127bfd    	stp	x29, x30, [sp, #0x120]
100000664: 910483fd    	add	x29, sp, #0x120
100000668: 90000028    	adrp	x8, 0x100004000 <_qsort+0x100004000>
10000066c: f9400508    	ldr	x8, [x8, #0x8]
100000670: f9400108    	ldr	x8, [x8]
100000674: f81903a8    	stur	x8, [x29, #-0x70]
;     struct student students[STUDENT_COUNT] = {
100000678: 90000008    	adrp	x8, 0x100000000 <_qsort+0x100000000>
10000067c: 91271108    	add	x8, x8, #0x9c4
100000680: ad420500    	ldp	q0, q1, [x8, #0x40]
100000684: ad0387e0    	stp	q0, q1, [sp, #0x70]
100000688: 3dc01900    	ldr	q0, [x8, #0x60]
10000068c: 3d8027e0    	str	q0, [sp, #0x90]
100000690: ad400500    	ldp	q0, q1, [x8]
100000694: ad0187e0    	stp	q0, q1, [sp, #0x30]
100000698: ad410101    	ldp	q1, q0, [x8, #0x20]
10000069c: ad0283e1    	stp	q1, q0, [sp, #0x50]
;     avg_start = clock();
1000006a0: 9400008b    	bl	0x1000008cc <_qsort+0x1000008cc>
1000006a4: f90017e0    	str	x0, [sp, #0x28]
1000006a8: 52800a33    	mov	w19, #0x51              ; =81
;         students[i].average = calculate_average(students[i].scores, COURSE_COUNT);
1000006ac: 7900abf3    	strh	w19, [sp, #0x54]
1000006b0: 9100c3fc    	add	x28, sp, #0x30
1000006b4: 91009b9b    	add	x27, x28, #0x26
1000006b8: 52800b28    	mov	w8, #0x59               ; =89
1000006bc: 7900f7e8    	strh	w8, [sp, #0x7a]
1000006c0: 9101339a    	add	x26, x28, #0x4c
1000006c4: 528009a8    	mov	w8, #0x4d               ; =77
1000006c8: 790143e8    	strh	w8, [sp, #0xa0]
;     avg_end = clock();
1000006cc: 94000080    	bl	0x1000008cc <_qsort+0x1000008cc>
1000006d0: f90013e0    	str	x0, [sp, #0x20]
;     printf("\n===== 平均成绩排名（高到低）=====\n");
1000006d4: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
1000006d8: 91265800    	add	x0, x0, #0x996
1000006dc: 94000082    	bl	0x1000008e4 <_qsort+0x1000008e4>
;     printf("%-4s %-10s %-12s %-8s\n", "排名", "姓名", "学号", "平均分");
1000006e0: 90000008    	adrp	x8, 0x100000000 <_qsort+0x100000000>
1000006e4: 9124a108    	add	x8, x8, #0x928
1000006e8: 90000009    	adrp	x9, 0x100000000 <_qsort+0x100000000>
1000006ec: 91248529    	add	x9, x9, #0x921
1000006f0: 9000000a    	adrp	x10, 0x100000000 <_qsort+0x100000000>
1000006f4: 9124694a    	add	x10, x10, #0x91a
1000006f8: 9000000b    	adrp	x11, 0x100000000 <_qsort+0x100000000>
1000006fc: 91244d6b    	add	x11, x11, #0x913
100000700: a90123e9    	stp	x9, x8, [sp, #0x10]
100000704: a9002beb    	stp	x11, x10, [sp]
100000708: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
10000070c: 9123f000    	add	x0, x0, #0x8fc
100000710: 94000072    	bl	0x1000008d8 <_qsort+0x1000008d8>
;         printf("%-4d %-10s %-12s %-8hd\n", i + 1, students[i].name, students[i].sid, students[i].average);
100000714: b27d0394    	orr	x20, x28, #0x8
100000718: a9014ff4    	stp	x20, x19, [sp, #0x10]
10000071c: 52800028    	mov	w8, #0x1                ; =1
100000720: a90073e8    	stp	x8, x28, [sp]
100000724: 90000015    	adrp	x21, 0x100000000 <_qsort+0x100000000>
100000728: 9124cab5    	add	x21, x21, #0x932
10000072c: aa1503e0    	mov	x0, x21
100000730: 9400006a    	bl	0x1000008d8 <_qsort+0x1000008d8>
100000734: 9100bb96    	add	x22, x28, #0x2e
100000738: 7980f7e8    	ldrsh	x8, [sp, #0x7a]
10000073c: a90123f6    	stp	x22, x8, [sp, #0x10]
100000740: 52800048    	mov	w8, #0x2                ; =2
100000744: a9006fe8    	stp	x8, x27, [sp]
100000748: aa1503e0    	mov	x0, x21
10000074c: 94000063    	bl	0x1000008d8 <_qsort+0x1000008d8>
100000750: 91015397    	add	x23, x28, #0x54
100000754: 798143e8    	ldrsh	x8, [sp, #0xa0]
100000758: a90123f7    	stp	x23, x8, [sp, #0x10]
10000075c: 52800073    	mov	w19, #0x3               ; =3
100000760: a9006bf3    	stp	x19, x26, [sp]
100000764: aa1503e0    	mov	x0, x21
100000768: 9400005c    	bl	0x1000008d8 <_qsort+0x1000008d8>
;     sort_start = clock();
10000076c: 94000058    	bl	0x1000008cc <_qsort+0x1000008cc>
100000770: aa0003f8    	mov	x24, x0
;     qsort(students, STUDENT_COUNT, sizeof(struct student), compare_student_desc);
100000774: 90000003    	adrp	x3, 0x100000000 <_qsort+0x100000000>
100000778: 91161063    	add	x3, x3, #0x584
10000077c: 9100c3e0    	add	x0, sp, #0x30
100000780: 52800061    	mov	w1, #0x3                ; =3
100000784: 528004c2    	mov	w2, #0x26               ; =38
100000788: 9400005a    	bl	0x1000008f0 <_qsort+0x1000008f0>
;     sort_end = clock();
10000078c: 94000050    	bl	0x1000008cc <_qsort+0x1000008cc>
100000790: aa0003f9    	mov	x25, x0
;     printf("\n===== 平均成绩排名（高到低）=====\n");
100000794: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
100000798: 91265800    	add	x0, x0, #0x996
10000079c: 94000052    	bl	0x1000008e4 <_qsort+0x1000008e4>
;     printf("%-4s %-10s %-12s %-8s\n", "排名", "姓名", "学号", "平均分");
1000007a0: 90000008    	adrp	x8, 0x100000000 <_qsort+0x100000000>
1000007a4: 9124a109    	add	x9, x8, #0x928
1000007a8: 90000008    	adrp	x8, 0x100000000 <_qsort+0x100000000>
1000007ac: 91248508    	add	x8, x8, #0x921
1000007b0: a90127e8    	stp	x8, x9, [sp, #0x10]
1000007b4: 90000008    	adrp	x8, 0x100000000 <_qsort+0x100000000>
1000007b8: 91246909    	add	x9, x8, #0x91a
1000007bc: 90000008    	adrp	x8, 0x100000000 <_qsort+0x100000000>
1000007c0: 91244d08    	add	x8, x8, #0x913
1000007c4: a90027e8    	stp	x8, x9, [sp]
1000007c8: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
1000007cc: 9123f000    	add	x0, x0, #0x8fc
1000007d0: 94000042    	bl	0x1000008d8 <_qsort+0x1000008d8>
;         printf("%-4d %-10s %-12s %-8hd\n", i + 1, students[i].name, students[i].sid, students[i].average);
1000007d4: 7980abe8    	ldrsh	x8, [sp, #0x54]
1000007d8: a90123f4    	stp	x20, x8, [sp, #0x10]
1000007dc: 52800028    	mov	w8, #0x1                ; =1
1000007e0: a90073e8    	stp	x8, x28, [sp]
1000007e4: aa1503e0    	mov	x0, x21
1000007e8: 9400003c    	bl	0x1000008d8 <_qsort+0x1000008d8>
1000007ec: 7980f7e8    	ldrsh	x8, [sp, #0x7a]
1000007f0: a90123f6    	stp	x22, x8, [sp, #0x10]
1000007f4: 52800048    	mov	w8, #0x2                ; =2
1000007f8: a9006fe8    	stp	x8, x27, [sp]
1000007fc: aa1503e0    	mov	x0, x21
100000800: 94000036    	bl	0x1000008d8 <_qsort+0x1000008d8>
100000804: 798143e8    	ldrsh	x8, [sp, #0xa0]
100000808: a90123f7    	stp	x23, x8, [sp, #0x10]
10000080c: a9006bf3    	stp	x19, x26, [sp]
100000810: aa1503e0    	mov	x0, x21
100000814: 94000031    	bl	0x1000008d8 <_qsort+0x1000008d8>
;     sort_elapsed_ms = (double)(sort_end - sort_start) * 1000.0 / CLOCKS_PER_SEC;
100000818: cb180328    	sub	x8, x25, x24
10000081c: 9e630100    	ucvtf	d0, x8
100000820: d2c80008    	mov	x8, #0x400000000000     ; =70368744177664
100000824: f2e811e8    	movk	x8, #0x408f, lsl #48
100000828: 9e670108    	fmov	d8, x8
10000082c: 1e680800    	fmul	d0, d0, d8
100000830: d2d09008    	mov	x8, #0x848000000000     ; =145685290680320
100000834: f2e825c8    	movk	x8, #0x412e, lsl #48
100000838: 9e670101    	fmov	d1, x8
10000083c: 1e611809    	fdiv	d9, d0, d1
100000840: a94223e9    	ldp	x9, x8, [sp, #0x20]
;     avg_elapsed_ms = (double)(avg_end - avg_start) * 1000.0 / CLOCKS_PER_SEC;
100000844: cb080128    	sub	x8, x9, x8
100000848: 9e630100    	ucvtf	d0, x8
10000084c: 1e680800    	fmul	d0, d0, d8
100000850: 1e611800    	fdiv	d0, d0, d1
;     printf("\n平均值计算耗时: %.6f ms (%.3f us)\n", avg_elapsed_ms, avg_elapsed_ms * 1000.0);
100000854: 1e680801    	fmul	d1, d0, d8
100000858: 6d0007e0    	stp	d0, d1, [sp]
10000085c: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
100000860: 91252800    	add	x0, x0, #0x94a
100000864: 9400001d    	bl	0x1000008d8 <_qsort+0x1000008d8>
;     printf("排序耗时: %.6f ms (%.3f us)\n", sort_elapsed_ms, sort_elapsed_ms * 1000.0);
100000868: 1e680920    	fmul	d0, d9, d8
10000086c: 6d0003e9    	stp	d9, d0, [sp]
100000870: 90000000    	adrp	x0, 0x100000000 <_qsort+0x100000000>
100000874: 9125d400    	add	x0, x0, #0x975
100000878: 94000018    	bl	0x1000008d8 <_qsort+0x1000008d8>
10000087c: f85903a8    	ldur	x8, [x29, #-0x70]
100000880: 90000029    	adrp	x9, 0x100004000 <_qsort+0x100004000>
100000884: f9400529    	ldr	x9, [x9, #0x8]
100000888: f9400129    	ldr	x9, [x9]
10000088c: eb08013f    	cmp	x9, x8
100000890: 54000161    	b.ne	0x1000008bc <_main+0x278>
;     return 0;
100000894: 52800000    	mov	w0, #0x0                ; =0
100000898: a9527bfd    	ldp	x29, x30, [sp, #0x120]
10000089c: a9514ff4    	ldp	x20, x19, [sp, #0x110]
1000008a0: a95057f6    	ldp	x22, x21, [sp, #0x100]
1000008a4: a94f5ff8    	ldp	x24, x23, [sp, #0xf0]
1000008a8: a94e67fa    	ldp	x26, x25, [sp, #0xe0]
1000008ac: a94d6ffc    	ldp	x28, x27, [sp, #0xd0]
1000008b0: 6d4c23e9    	ldp	d9, d8, [sp, #0xc0]
1000008b4: 9104c3ff    	add	sp, sp, #0x130
1000008b8: d65f03c0    	ret
1000008bc: 94000001    	bl	0x1000008c0 <_qsort+0x1000008c0>

Disassembly of section __TEXT,__stubs:

00000001000008c0 <__stubs>:
1000008c0: 90000030    	adrp	x16, 0x100004000 <_qsort+0x100004000>
1000008c4: f9400210    	ldr	x16, [x16]
1000008c8: d61f0200    	br	x16
1000008cc: 90000030    	adrp	x16, 0x100004000 <_qsort+0x100004000>
1000008d0: f9400a10    	ldr	x16, [x16, #0x10]
1000008d4: d61f0200    	br	x16
1000008d8: 90000030    	adrp	x16, 0x100004000 <_qsort+0x100004000>
1000008dc: f9400e10    	ldr	x16, [x16, #0x18]
1000008e0: d61f0200    	br	x16
1000008e4: 90000030    	adrp	x16, 0x100004000 <_qsort+0x100004000>
1000008e8: f9401210    	ldr	x16, [x16, #0x20]
1000008ec: d61f0200    	br	x16
1000008f0: 90000030    	adrp	x16, 0x100004000 <_qsort+0x100004000>
1000008f4: f9401610    	ldr	x16, [x16, #0x28]
1000008f8: d61f0200    	br	x16
