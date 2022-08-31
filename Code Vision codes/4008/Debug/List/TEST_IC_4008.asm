
;CodeVisionAVR C Compiler V3.14 Advanced
;(C) Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Build configuration    : Debug
;Chip type              : ATmega32A
;Program type           : Application
;Clock frequency        : 11.059200 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : int, width
;(s)scanf features      : int, width
;External RAM size      : 0
;Data Stack size        : 512 byte(s)
;Heap size              : 0 byte(s)
;Promote 'char' to 'int': Yes
;'char' is unsigned     : Yes
;8 bit enums            : Yes
;Global 'const' stored in FLASH: Yes
;Enhanced function parameter passing: Yes
;Enhanced core instructions: On
;Automatic register allocation for global variables: On
;Smart register allocation: On

	#define _MODEL_SMALL_

	#pragma AVRPART ADMIN PART_NAME ATmega32A
	#pragma AVRPART MEMORY PROG_FLASH 32768
	#pragma AVRPART MEMORY EEPROM 1024
	#pragma AVRPART MEMORY INT_SRAM SIZE 2048
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x085F
	.EQU __DSTACK_SIZE=0x0200
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	PUSH R26
	PUSH R27
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	POP  R27
	POP  R26
	ICALL
	.ENDM

	.MACRO __CALL2EX
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	CALL __EEPROMRDD
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z
	MOVW R30,R0
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _test=R5
	.DEF _flag=R4
	.DEF _temp=R7
	.DEF _i1=R6
	.DEF _i2=R9
	.DEF _a=R8
	.DEF _b=R11

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

;GLOBAL REGISTER VARIABLES INITIALIZATION
__REG_VARS:
	.DB  0x1,0x1,0x0,0x0


__GLOBAL_INI_TBL:
	.DW  0x04
	.DW  0x04
	.DW  __REG_VARS*2

_0xFFFFFFFF:
	.DW  0

#define __GLOBAL_INI_TBL_PRESENT 1

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  MCUCR,R31
	OUT  MCUCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x260

	.CSEG
;/*******************************************************
;This program was created by the
;CodeWizardAVR V3.14 Advanced
;Automatic Program Generator
;© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project : TEST_IC_4008
;Version :
;Date    : 12/28/2021
;Author  :
;Company :
;Comments:
;
;
;Chip type               : ATmega32A
;Program type            : Application
;AVR Core Clock frequency: 11.059200 MHz
;Memory model            : Small
;External RAM size       : 0
;Data Stack size         : 512
;*******************************************************/
;
;#include <mega32a.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;
;#include <delay.h>
;
; // PINS USED WITH THIS IC :- A0 - A6 & C7- C1
; // C0 & A7 NOT USED
;
; // NUMBER OF PINS = 16
; //CONNECTION
;                   //PINS IN THE CD4008 IC    // IN OR OUT
; #define A4    PORTA.4  //PIN 1                    //  IN A4
; #define B3    PORTA.5  //PIN 2                    //  IN B3
; #define A3    PORTA.6  //PIN 3                    //  IN A3
; #define B2    PORTA.7  //PIN 4                    //  IN B2
; #define A2    PORTD.4  //PIN 5                    //  IN A2
; #define B1    PORTD.5  //PIN 6                    //  IN B1
; #define A1    PORTD.6  //PIN 7                    //  IN A1
;             //PORTD.7  //PIN 8                    //  GND
; #define CI    PORTB.3  //PIN 9                    //  IN CI
; #define S1    PINB.2   //PIN 10                   //  OUT S1
; #define S2    PINB.1   //PIN 11                   //  OUT S2
; #define S3    PINB.0   //PIN 12                   //  OUT S3
; #define S4    PINC.7   //PIN 13                   //  OUT S4
; #define CO    PINC.6   //PIN 14                   //  OUT CO
; #define B4    PORTC.5  //PIN 15                   //  IN B4
;            //PORTC.4   //PIN 16                   //  VCC
;
;
; //INPUT  PORTS IN OUR IC :- B2- B0 &  C7,C6     //DDR  = 0 // PORT.0 =   1
; //OUTPUT PORTS IN OUR IC :- A7-A4 & D7-D4 & C4  //DDR  = 1 // PORT.1 =   0
;
; #define ON  1
; #define OFF 0
;
; #define LED_GREEN PORTD.2
; #define LED_RED PORTD.3
;
;
; char test = 1;
; char flag = 1;
; char temp =0;
; char i1,i2;
; char a,b;
; char arr1[4] = {0,0,0,0};
; char arr2[4] = {0,0,0,0};
; char arr3[5] = {0,0,0,0,0};
;
;void main(void)
; 0000 0048 {

	.CSEG
_main:
; .FSTART _main
; 0000 0049     DDRA    = 0xff ; // 1111 1111
	LDI  R30,LOW(255)
	OUT  0x1A,R30
; 0000 004A     PORTA   = 0x00 ; // 0000 0000
	LDI  R30,LOW(0)
	OUT  0x1B,R30
; 0000 004B 
; 0000 004C     DDRC    = 0x3f ; // 0011 1111
	LDI  R30,LOW(63)
	OUT  0x14,R30
; 0000 004D     PORTC   = 0xc0 ; // 1100 0000
	LDI  R30,LOW(192)
	OUT  0x15,R30
; 0000 004E 
; 0000 004F     DDRB    = 0xf8 ; // 1111 1000
	LDI  R30,LOW(248)
	OUT  0x17,R30
; 0000 0050     PORTB   = 0x07 ; // 0000 0111
	LDI  R30,LOW(7)
	OUT  0x18,R30
; 0000 0051 
; 0000 0052     DDRD    = 0xff ;
	LDI  R30,LOW(255)
	OUT  0x11,R30
; 0000 0053     PORTD   = 0x00 ;
	LDI  R30,LOW(0)
	OUT  0x12,R30
; 0000 0054 
; 0000 0055     PORTC.4 = ON;
	SBI  0x15,4
; 0000 0056     PORTD.7 = OFF;
	CBI  0x12,7
; 0000 0057 
; 0000 0058 while (1)
_0x7:
; 0000 0059       {
; 0000 005A       if  (flag == 1){
	LDI  R30,LOW(1)
	CP   R30,R4
	BREQ PC+2
	RJMP _0xA
; 0000 005B            for(CI=0 ; CI<2;CI++){
	CBI  0x18,3
_0xC:
	LDI  R26,0
	SBIC 0x18,3
	LDI  R26,1
	CPI  R26,LOW(0x2)
	BRLO PC+2
	RJMP _0xD
; 0000 005C                for (a=0;a<16;a++){
	CLR  R8
_0x11:
	LDI  R30,LOW(16)
	CP   R8,R30
	BRLO PC+2
	RJMP _0x12
; 0000 005D                    delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 005E                    i1= a;
	MOV  R6,R8
; 0000 005F                    for (i2=0; i2 < 4; i2++){
	CLR  R9
_0x14:
	LDI  R30,LOW(4)
	CP   R9,R30
	BRSH _0x15
; 0000 0060                         arr1[i2] =   i1%2 ;
	MOV  R30,R9
	LDI  R31,0
	SUBI R30,LOW(-_arr1)
	SBCI R31,HIGH(-_arr1)
	RCALL SUBOPT_0x1
; 0000 0061                         i1 = i1/2;
; 0000 0062                    }
	INC  R9
	RJMP _0x14
_0x15:
; 0000 0063 
; 0000 0064                    delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 0065                    i1 = arr1[0];
	LDS  R6,_arr1
; 0000 0066                    arr1[0] = arr1[3];
	__GETB1MN _arr1,3
	STS  _arr1,R30
; 0000 0067                    arr1[3] = i1;
	__PUTBMRN _arr1,3,6
; 0000 0068 
; 0000 0069                    delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 006A                    i1 = arr1[1];
	__GETBRMN 6,_arr1,1
; 0000 006B                    arr1[1] = arr1[2];
	__GETB1MN _arr1,2
	__PUTB1MN _arr1,1
; 0000 006C                    arr1[2] = i1;
	__PUTBMRN _arr1,2,6
; 0000 006D 
; 0000 006E                    delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 006F                    A1 = arr1[3];
	__GETB1MN _arr1,3
	CPI  R30,0
	BRNE _0x16
	CBI  0x12,6
	RJMP _0x17
_0x16:
	SBI  0x12,6
_0x17:
; 0000 0070                    A2 = arr1[2];
	__GETB1MN _arr1,2
	CPI  R30,0
	BRNE _0x18
	CBI  0x12,4
	RJMP _0x19
_0x18:
	SBI  0x12,4
_0x19:
; 0000 0071                    A3 = arr1[1];
	__GETB1MN _arr1,1
	CPI  R30,0
	BRNE _0x1A
	CBI  0x1B,6
	RJMP _0x1B
_0x1A:
	SBI  0x1B,6
_0x1B:
; 0000 0072                    A4 = arr1[0];
	LDS  R30,_arr1
	CPI  R30,0
	BRNE _0x1C
	CBI  0x1B,4
	RJMP _0x1D
_0x1C:
	SBI  0x1B,4
_0x1D:
; 0000 0073 
; 0000 0074                    delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 0075                    for (b = a%3 ; b < 16 ; b = b+3){
	MOV  R26,R8
	CLR  R27
	LDI  R30,LOW(3)
	LDI  R31,HIGH(3)
	CALL __MODW21
	MOV  R11,R30
_0x1F:
	LDI  R30,LOW(16)
	CP   R11,R30
	BRLO PC+2
	RJMP _0x20
; 0000 0076                          i1= b ;
	MOV  R6,R11
; 0000 0077                         for (i2=0; i2 < 4; i2++){//0011
	CLR  R9
_0x22:
	LDI  R30,LOW(4)
	CP   R9,R30
	BRSH _0x23
; 0000 0078                              arr2[i2] =   i1%2;
	MOV  R30,R9
	LDI  R31,0
	SUBI R30,LOW(-_arr2)
	SBCI R31,HIGH(-_arr2)
	RCALL SUBOPT_0x1
; 0000 0079                              i1 = i1/2;
; 0000 007A                         }
	INC  R9
	RJMP _0x22
_0x23:
; 0000 007B 
; 0000 007C                         delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 007D                         i1 = arr2[0];
	LDS  R6,_arr2
; 0000 007E                         arr2[0] = arr2[3];
	__GETB1MN _arr2,3
	STS  _arr2,R30
; 0000 007F                         arr2[3] = i1;
	__PUTBMRN _arr2,3,6
; 0000 0080 
; 0000 0081                         delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 0082                         i1 = arr2[1];
	__GETBRMN 6,_arr2,1
; 0000 0083                         arr2[1] = arr2[2];
	__GETB1MN _arr2,2
	__PUTB1MN _arr2,1
; 0000 0084                         arr2[2] = i1;
	__PUTBMRN _arr2,2,6
; 0000 0085 
; 0000 0086                         delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 0087                         B1 = arr2[3];
	__GETB1MN _arr2,3
	CPI  R30,0
	BRNE _0x24
	CBI  0x12,5
	RJMP _0x25
_0x24:
	SBI  0x12,5
_0x25:
; 0000 0088                         B2 = arr2[2];
	__GETB1MN _arr2,2
	CPI  R30,0
	BRNE _0x26
	CBI  0x1B,7
	RJMP _0x27
_0x26:
	SBI  0x1B,7
_0x27:
; 0000 0089                         B3 = arr2[1];
	__GETB1MN _arr2,1
	CPI  R30,0
	BRNE _0x28
	CBI  0x1B,5
	RJMP _0x29
_0x28:
	SBI  0x1B,5
_0x29:
; 0000 008A                         B4 = arr2[0];
	LDS  R30,_arr2
	CPI  R30,0
	BRNE _0x2A
	CBI  0x15,5
	RJMP _0x2B
_0x2A:
	SBI  0x15,5
_0x2B:
; 0000 008B 
; 0000 008C                         delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 008D 
; 0000 008E                         temp = a + b + CI;
	MOV  R26,R11
	ADD  R26,R8
	LDI  R30,0
	SBIC 0x18,3
	LDI  R30,1
	ADD  R30,R26
	MOV  R7,R30
; 0000 008F 
; 0000 0090                         for (i2=0; i2 < 5; i2++){
	CLR  R9
_0x2D:
	LDI  R30,LOW(5)
	CP   R9,R30
	BRSH _0x2E
; 0000 0091                              arr3[i2] =   temp%2;
	MOV  R30,R9
	LDI  R31,0
	SUBI R30,LOW(-_arr3)
	SBCI R31,HIGH(-_arr3)
	MOVW R0,R30
	MOV  R30,R7
	LDI  R31,0
	LDI  R26,LOW(1)
	LDI  R27,HIGH(1)
	CALL __MANDW12
	MOVW R26,R0
	ST   X,R30
; 0000 0092                              temp = temp/2;
	MOV  R26,R7
	LDI  R27,0
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	CALL __DIVW21
	MOV  R7,R30
; 0000 0093                         }
	INC  R9
	RJMP _0x2D
_0x2E:
; 0000 0094 
; 0000 0095                         delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 0096                         i1 = arr3[0];
	LDS  R6,_arr3
; 0000 0097                         arr3[0] = arr3[4];
	__GETB1MN _arr3,4
	STS  _arr3,R30
; 0000 0098                         arr3[4] = i1;
	__PUTBMRN _arr3,4,6
; 0000 0099 
; 0000 009A                         delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 009B                         i1 = arr3[1];
	__GETBRMN 6,_arr3,1
; 0000 009C                         arr3[1] = arr3[3];
	__GETB1MN _arr3,3
	__PUTB1MN _arr3,1
; 0000 009D                         arr3[3] = i1;
	__PUTBMRN _arr3,3,6
; 0000 009E 
; 0000 009F                         delay_ms(10);
	RCALL SUBOPT_0x0
; 0000 00A0                         if(S1 == arr3[4] && S2 == arr3[3] && S3==arr3[2] && S4==arr3[1]){
	RCALL SUBOPT_0x2
	BRNE _0x30
	RCALL SUBOPT_0x3
	BRNE _0x30
	RCALL SUBOPT_0x4
	BRNE _0x30
	RCALL SUBOPT_0x5
	BREQ _0x31
_0x30:
	RJMP _0x2F
_0x31:
; 0000 00A1                             LED_GREEN = ON;
	SBI  0x12,2
; 0000 00A2                             delay_ms(50);
	LDI  R26,LOW(50)
	LDI  R27,0
	CALL _delay_ms
; 0000 00A3                             LED_GREEN = OFF;
	CBI  0x12,2
; 0000 00A4                             test = ON;
	LDI  R30,LOW(1)
	MOV  R5,R30
; 0000 00A5                         }
; 0000 00A6                         else if(S1!=arr3[4] || S2!=arr3[3] || S3!=arr3[2] || S4!=arr3[1]) {
	RJMP _0x36
_0x2F:
	RCALL SUBOPT_0x2
	BRNE _0x38
	RCALL SUBOPT_0x3
	BRNE _0x38
	RCALL SUBOPT_0x4
	BRNE _0x38
	RCALL SUBOPT_0x5
	BREQ _0x37
_0x38:
; 0000 00A7                             LED_RED = ON;
	SBI  0x12,3
; 0000 00A8                             delay_ms(50);
	LDI  R26,LOW(50)
	LDI  R27,0
	CALL _delay_ms
; 0000 00A9                             LED_RED = OFF;
	CBI  0x12,3
; 0000 00AA                             test = OFF;
	CLR  R5
; 0000 00AB                             //break;
; 0000 00AC                         }
; 0000 00AD                    }
_0x37:
_0x36:
	LDI  R30,LOW(3)
	ADD  R11,R30
	RJMP _0x1F
_0x20:
; 0000 00AE 
; 0000 00AF                }
	INC  R8
	RJMP _0x11
_0x12:
; 0000 00B0            }
	LDI  R30,0
	SBIC 0x18,3
	LDI  R30,1
	SUBI R30,-LOW(1)
	OUT  0x18,R30
	SUBI R30,LOW(1)
	RJMP _0xC
_0xD:
; 0000 00B1            flag = 0;
	CLR  R4
; 0000 00B2 
; 0000 00B3       }
; 0000 00B4       else if( flag == 0){
	RJMP _0x3E
_0xA:
	TST  R4
	BRNE _0x3F
; 0000 00B5 
; 0000 00B6         if(test == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x40
; 0000 00B7               LED_RED = OFF;
	CBI  0x12,3
; 0000 00B8               LED_GREEN = ON;
	SBI  0x12,2
; 0000 00B9         }
; 0000 00BA         else if(test == 0){
	RJMP _0x45
_0x40:
	TST  R5
	BRNE _0x46
; 0000 00BB             LED_GREEN = OFF;
	CBI  0x12,2
; 0000 00BC             LED_RED = ON;
	SBI  0x12,3
; 0000 00BD         }
; 0000 00BE       }
_0x46:
_0x45:
; 0000 00BF }
_0x3F:
_0x3E:
	RJMP _0x7
; 0000 00C0 }
_0x4B:
	RJMP _0x4B
; .FEND

	.DSEG
_arr1:
	.BYTE 0x4
_arr2:
	.BYTE 0x4
_arr3:
	.BYTE 0x5

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 12 TIMES, CODE SIZE REDUCTION:19 WORDS
SUBOPT_0x0:
	LDI  R26,LOW(10)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:11 WORDS
SUBOPT_0x1:
	MOVW R0,R30
	MOV  R30,R6
	LDI  R31,0
	LDI  R26,LOW(1)
	LDI  R27,HIGH(1)
	CALL __MANDW12
	MOVW R26,R0
	ST   X,R30
	MOV  R26,R6
	LDI  R27,0
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	CALL __DIVW21
	MOV  R6,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x2:
	LDI  R26,0
	SBIC 0x16,2
	LDI  R26,1
	__GETB1MN _arr3,4
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x3:
	LDI  R26,0
	SBIC 0x16,1
	LDI  R26,1
	__GETB1MN _arr3,3
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x4:
	LDI  R26,0
	SBIC 0x16,0
	LDI  R26,1
	__GETB1MN _arr3,2
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x5:
	LDI  R26,0
	SBIC 0x13,7
	LDI  R26,1
	__GETB1MN _arr3,1
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET


	.CSEG
_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	wdr
	__DELAY_USW 0xACD
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

__ANEGW1:
	NEG  R31
	NEG  R30
	SBCI R31,0
	RET

__DIVW21U:
	CLR  R0
	CLR  R1
	LDI  R25,16
__DIVW21U1:
	LSL  R26
	ROL  R27
	ROL  R0
	ROL  R1
	SUB  R0,R30
	SBC  R1,R31
	BRCC __DIVW21U2
	ADD  R0,R30
	ADC  R1,R31
	RJMP __DIVW21U3
__DIVW21U2:
	SBR  R26,1
__DIVW21U3:
	DEC  R25
	BRNE __DIVW21U1
	MOVW R30,R26
	MOVW R26,R0
	RET

__DIVW21:
	RCALL __CHKSIGNW
	RCALL __DIVW21U
	BRTC __DIVW211
	RCALL __ANEGW1
__DIVW211:
	RET

__MODW21:
	CLT
	SBRS R27,7
	RJMP __MODW211
	COM  R26
	COM  R27
	ADIW R26,1
	SET
__MODW211:
	SBRC R31,7
	RCALL __ANEGW1
	RCALL __DIVW21U
	MOVW R30,R26
	BRTC __MODW212
	RCALL __ANEGW1
__MODW212:
	RET

__MANDW12:
	CLT
	SBRS R31,7
	RJMP __MANDW121
	RCALL __ANEGW1
	SET
__MANDW121:
	AND  R30,R26
	AND  R31,R27
	BRTC __MANDW122
	RCALL __ANEGW1
__MANDW122:
	RET

__CHKSIGNW:
	CLT
	SBRS R31,7
	RJMP __CHKSW1
	RCALL __ANEGW1
	SET
__CHKSW1:
	SBRS R27,7
	RJMP __CHKSW2
	COM  R26
	COM  R27
	ADIW R26,1
	BLD  R0,0
	INC  R0
	BST  R0,0
__CHKSW2:
	RET

;END OF CODE MARKER
__END_OF_CODE:
