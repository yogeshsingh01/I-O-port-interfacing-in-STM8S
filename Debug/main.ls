   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  63                     ; 3 void myDelay()
  63                     ; 4 {
  65                     	switch	.text
  66  0000               _myDelay:
  68  0000 5204          	subw	sp,#4
  69       00000004      OFST:	set	4
  72                     ; 6    for(i=0;i<10;i++)
  74  0002 5f            	clrw	x
  75  0003 1f01          	ldw	(OFST-3,sp),x
  77  0005               L33:
  78                     ; 8        for(j=0;j<100;j++);
  80  0005 5f            	clrw	x
  81  0006 1f03          	ldw	(OFST-1,sp),x
  83  0008               L14:
  87  0008 1e03          	ldw	x,(OFST-1,sp)
  88  000a 1c0001        	addw	x,#1
  89  000d 1f03          	ldw	(OFST-1,sp),x
  93  000f 9c            	rvf
  94  0010 1e03          	ldw	x,(OFST-1,sp)
  95  0012 a30064        	cpw	x,#100
  96  0015 2ff1          	jrslt	L14
  97                     ; 6    for(i=0;i<10;i++)
  99  0017 1e01          	ldw	x,(OFST-3,sp)
 100  0019 1c0001        	addw	x,#1
 101  001c 1f01          	ldw	(OFST-3,sp),x
 105  001e 9c            	rvf
 106  001f 1e01          	ldw	x,(OFST-3,sp)
 107  0021 a3000a        	cpw	x,#10
 108  0024 2fdf          	jrslt	L33
 109                     ; 10 }  
 112  0026 5b04          	addw	sp,#4
 113  0028 81            	ret
 137                     ; 12 main()
 137                     ; 13 {
 138                     	switch	.text
 139  0029               _main:
 143                     ; 14 	GPIOD->DDR &= ~(1<<4);
 145  0029 72195011      	bres	20497,#4
 146                     ; 15 	GPIOD->CR1 |= (1<<4);
 148  002d 72185012      	bset	20498,#4
 149                     ; 17 	GPIOD->DDR |= (1<<1);
 151  0031 72125011      	bset	20497,#1
 152                     ; 18 	 GPIOD->CR1 |= (1<<1);  // PD.0 as Push Pull Type Output
 154  0035 72125012      	bset	20498,#1
 155  0039               L75:
 156                     ; 21 			 if(!((GPIOD->IDR) & (1<<4)))
 158  0039 c65010        	ld	a,20496
 159  003c a510          	bcp	a,#16
 160  003e 2606          	jrne	L36
 161                     ; 22 			key=1;
 163  0040 35010000      	mov	_key,#1
 165  0044 2002          	jra	L56
 166  0046               L36:
 167                     ; 24 			key=0;
 169  0046 3f00          	clr	_key
 170  0048               L56:
 171                     ; 25       if(key==0)
 173  0048 3d00          	tnz	_key
 174  004a 2604          	jrne	L76
 175                     ; 26 			GPIOD->ODR |= (1<<1);  // PD.1 and PD.2 = 1
 177  004c 7212500f      	bset	20495,#1
 178  0050               L76:
 179                     ; 27 			if(key==1)
 181  0050 b600          	ld	a,_key
 182  0052 a101          	cp	a,#1
 183  0054 26e3          	jrne	L75
 184                     ; 28 			GPIOD->ODR &= ~(1<<1);
 186  0056 7213500f      	bres	20495,#1
 187  005a 20dd          	jra	L75
 232                     	xdef	_main
 233                     	switch	.ubsct
 234  0000               _key:
 235  0000 00            	ds.b	1
 236                     	xdef	_key
 237                     	xdef	_myDelay
 257                     	end
