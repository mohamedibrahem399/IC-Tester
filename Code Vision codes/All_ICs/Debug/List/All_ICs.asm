
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
	.DEF _temp=R5
	.DEF _i=R4

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
	.DB  0x0

_0x77:
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0

__GLOBAL_INI_TBL:
	.DW  0x01
	.DW  0x05
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
;Project : All_ICs
;Version :
;Date    : 1/2/2022
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
;char check_4002 ();
;char check_4006 ();
;char check_4007 ();
;char check_4008 ();
;char check_4009 ();
;char check_4010 ();
;
;
;
; #define LED_4002 PORTD.2
; #define LED_4006 PORTD.3
; #define LED_4007 PORTD.6
; #define LED_4008 PORTD.5
; #define LED_4009 PORTD.4
; #define BUTTON1 PIND.7
;
; #define ON  1
; #define OFF 0
;
; char temp=0;
; char i;
;
;
;void main(void)
; 0000 0033 {

	.CSEG
_main:
; .FSTART _main
; 0000 0034     DDRA    = 0x55 ; // 0101 0101
	RCALL SUBOPT_0x0
; 0000 0035     PORTA   = 0xAA ; // 1010 1010
; 0000 0036 
; 0000 0037     DDRC    = 0xA4 ; // 1010 0100
; 0000 0038     PORTC   = 0x5B ; // 0101 1011
; 0000 0039 
; 0000 003A     DDRD  = 0x7f;
	LDI  R30,LOW(127)
	OUT  0x11,R30
; 0000 003B     PORTD = 0x80;
	LDI  R30,LOW(128)
	OUT  0x12,R30
; 0000 003C 
; 0000 003D     LED_4002 = ON;
	SBI  0x12,2
; 0000 003E     delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 003F     LED_4002 = OFF;
	CBI  0x12,2
; 0000 0040 
; 0000 0041     LED_4006 = ON;
	SBI  0x12,3
; 0000 0042     delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 0043     LED_4006 = OFF;
	CBI  0x12,3
; 0000 0044 
; 0000 0045     LED_4007 = ON;
	SBI  0x12,6
; 0000 0046     delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 0047     LED_4007 = OFF;
	CBI  0x12,6
; 0000 0048 
; 0000 0049     LED_4008 = ON;
	SBI  0x12,5
; 0000 004A     delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 004B     LED_4008 = OFF;
	CBI  0x12,5
; 0000 004C 
; 0000 004D     LED_4009 = ON;
	SBI  0x12,4
; 0000 004E     delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 004F     LED_4009 = OFF;
	CBI  0x12,4
; 0000 0050 
; 0000 0051 while (1)
_0x17:
; 0000 0052       {
; 0000 0053       if(BUTTON1 == ON){
	SBIS 0x10,7
	RJMP _0x1A
; 0000 0054       i=0;
	CLR  R4
; 0000 0055         for(i=0;i<6;i++){
	CLR  R4
_0x1C:
	LDI  R30,LOW(6)
	CP   R4,R30
	BRLO PC+2
	RJMP _0x1D
; 0000 0056             if(i==0){
	TST  R4
	BRNE _0x1E
; 0000 0057                 temp =check_4006();
	RCALL _check_4006
	MOV  R5,R30
; 0000 0058                 if(temp == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x1F
; 0000 0059                   LED_4002 =OFF;
	CBI  0x12,2
; 0000 005A                   LED_4006 =ON;
	SBI  0x12,3
; 0000 005B                   LED_4007=OFF;
	RCALL SUBOPT_0x2
; 0000 005C                   LED_4008=OFF;
; 0000 005D                   LED_4009=OFF;
; 0000 005E                   delay_ms(1000);
; 0000 005F                 break;}
	RJMP _0x1D
; 0000 0060 
; 0000 0061             }
_0x1F:
; 0000 0062             else if(i==1){
	RJMP _0x2A
_0x1E:
	LDI  R30,LOW(1)
	CP   R30,R4
	BRNE _0x2B
; 0000 0063 
; 0000 0064                 temp = check_4002();
	RCALL _check_4002
	MOV  R5,R30
; 0000 0065                 delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 0066                 if(temp == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x2C
; 0000 0067                  LED_4002 =ON;
	SBI  0x12,2
; 0000 0068                  LED_4006=OFF;
	CBI  0x12,3
; 0000 0069                  LED_4007=OFF;
	RCALL SUBOPT_0x2
; 0000 006A                  LED_4008=OFF;
; 0000 006B                  LED_4009=OFF;
; 0000 006C                  delay_ms(1000);
; 0000 006D                  break;}
	RJMP _0x1D
; 0000 006E 
; 0000 006F 
; 0000 0070             }
_0x2C:
; 0000 0071             else if(i==2){
	RJMP _0x37
_0x2B:
	LDI  R30,LOW(2)
	CP   R30,R4
	BRNE _0x38
; 0000 0072                 temp =check_4008();
	RCALL _check_4008
	MOV  R5,R30
; 0000 0073                 if(temp == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x39
; 0000 0074                    LED_4002=OFF;
	CBI  0x12,2
; 0000 0075                    LED_4006=OFF;
	CBI  0x12,3
; 0000 0076                    LED_4007 =OFF;
	CBI  0x12,6
; 0000 0077                    LED_4008=ON;
	SBI  0x12,5
; 0000 0078                    LED_4009=OFF;
	CBI  0x12,4
; 0000 0079                    delay_ms(1000);
	RCALL SUBOPT_0x4
; 0000 007A                 break;}
	RJMP _0x1D
; 0000 007B 
; 0000 007C 
; 0000 007D             }
_0x39:
; 0000 007E             else if(i==3){
	RJMP _0x44
_0x38:
	LDI  R30,LOW(3)
	CP   R30,R4
	BRNE _0x45
; 0000 007F                 temp =check_4009();
	RCALL _check_4009
	MOV  R5,R30
; 0000 0080                 if(temp == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x46
; 0000 0081                     LED_4002=OFF;
	CBI  0x12,2
; 0000 0082                     LED_4006=OFF;
	CBI  0x12,3
; 0000 0083                     LED_4007 =OFF;
	CBI  0x12,6
; 0000 0084                     LED_4008=OFF;
	CBI  0x12,5
; 0000 0085                     LED_4009=ON;
	SBI  0x12,4
; 0000 0086                     delay_ms(1000);
	RCALL SUBOPT_0x4
; 0000 0087                 break;}
	RJMP _0x1D
; 0000 0088 
; 0000 0089 
; 0000 008A             }
_0x46:
; 0000 008B             else if(i==4){
	RJMP _0x51
_0x45:
	LDI  R30,LOW(4)
	CP   R30,R4
	BRNE _0x52
; 0000 008C 
; 0000 008D                 temp =check_4010();
	RCALL _check_4010
	MOV  R5,R30
; 0000 008E                 if(temp == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x53
; 0000 008F                     LED_4002=OFF;
	CBI  0x12,2
; 0000 0090                     LED_4006=OFF;
	CBI  0x12,3
; 0000 0091                     LED_4007 =OFF;
	CBI  0x12,6
; 0000 0092                     LED_4008=ON;
	SBI  0x12,5
; 0000 0093                     LED_4009=ON;
	SBI  0x12,4
; 0000 0094                     delay_ms(1000);
	RCALL SUBOPT_0x4
; 0000 0095                 break;}
	RJMP _0x1D
; 0000 0096             }
_0x53:
; 0000 0097             else if(i==5){
	RJMP _0x5E
_0x52:
	LDI  R30,LOW(5)
	CP   R30,R4
	BRNE _0x5F
; 0000 0098 
; 0000 0099                 temp =check_4007();
	RCALL _check_4007
	MOV  R5,R30
; 0000 009A                 if(temp == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x60
; 0000 009B                    LED_4002 =OFF;
	CBI  0x12,2
; 0000 009C                    LED_4006=OFF;
	CBI  0x12,3
; 0000 009D                    LED_4007 =ON;
	SBI  0x12,6
; 0000 009E                    LED_4008=OFF;
	CBI  0x12,5
; 0000 009F                    LED_4009=OFF;
	CBI  0x12,4
; 0000 00A0                    delay_ms(1000);
	RCALL SUBOPT_0x4
; 0000 00A1                 break;}
	RJMP _0x1D
; 0000 00A2             }
_0x60:
; 0000 00A3         }
_0x5F:
_0x5E:
_0x51:
_0x44:
_0x37:
_0x2A:
	INC  R4
	RJMP _0x1C
_0x1D:
; 0000 00A4        }
; 0000 00A5        else{
	RJMP _0x6B
_0x1A:
; 0000 00A6        LED_4002=OFF;
	CBI  0x12,2
; 0000 00A7        LED_4006=OFF;
	CBI  0x12,3
; 0000 00A8        LED_4007 =OFF;
	CBI  0x12,6
; 0000 00A9        LED_4008=OFF;
	CBI  0x12,5
; 0000 00AA        LED_4009=OFF;
	CBI  0x12,4
; 0000 00AB        }
_0x6B:
; 0000 00AC       }
	RJMP _0x17
; 0000 00AD }
_0x76:
	RJMP _0x76
; .FEND
;
;
;
;
;
;
; char check_4008 (){
; 0000 00B4 char check_4008 (){
_check_4008:
; .FSTART _check_4008
; 0000 00B5 
; 0000 00B6      char test = 1;
; 0000 00B7      char temp =0;
; 0000 00B8      char i1,i2;
; 0000 00B9      char a,b;
; 0000 00BA      char arr1[4] = {0,0,0,0};
; 0000 00BB      char arr2[4] = {0,0,0,0};
; 0000 00BC      char arr3[5] = {0,0,0,0,0};
; 0000 00BD 
; 0000 00BE      DDRA    = 0xff ; // 1111 1111
	SBIW R28,13
	LDI  R24,13
	LDI  R26,LOW(0)
	LDI  R27,HIGH(0)
	LDI  R30,LOW(_0x77*2)
	LDI  R31,HIGH(_0x77*2)
	CALL __INITLOCB
	CALL __SAVELOCR6
;	test -> R17
;	temp -> R16
;	i1 -> R19
;	i2 -> R18
;	a -> R21
;	b -> R20
;	arr1 -> Y+15
;	arr2 -> Y+11
;	arr3 -> Y+6
	RCALL SUBOPT_0x5
; 0000 00BF      PORTA   = 0x00 ; // 0000 0000
; 0000 00C0      DDRC    = 0x83 ; // 1000 0011
	LDI  R30,LOW(131)
	OUT  0x14,R30
; 0000 00C1      PORTC   = 0x7C ; // 0111 1100
	LDI  R30,LOW(124)
	OUT  0x15,R30
; 0000 00C2      for(PORTC.7=0 ; PORTC.7<2 ; PORTC.7++){
	CBI  0x15,7
_0x79:
	LDI  R26,0
	SBIC 0x15,7
	LDI  R26,1
	CPI  R26,LOW(0x2)
	BRLO PC+2
	RJMP _0x7A
; 0000 00C3                for (a=0;a<16;a++){
	LDI  R21,LOW(0)
_0x7E:
	CPI  R21,16
	BRLO PC+2
	RJMP _0x7F
; 0000 00C4                    delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00C5                    i1= a;
	MOV  R19,R21
; 0000 00C6                    for (i2=0; i2 < 4; i2++){
	LDI  R18,LOW(0)
_0x81:
	CPI  R18,4
	BRSH _0x82
; 0000 00C7                         arr1[i2] =   i1%2 ;
	MOV  R30,R18
	LDI  R31,0
	MOVW R26,R28
	ADIW R26,15
	RCALL SUBOPT_0x6
; 0000 00C8                         i1 = i1/2;
; 0000 00C9                    }
	SUBI R18,-1
	RJMP _0x81
_0x82:
; 0000 00CA 
; 0000 00CB                    delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00CC                    i1 = arr1[0];
	LDD  R19,Y+15
; 0000 00CD                    arr1[0] = arr1[3];
	LDD  R30,Y+18
	STD  Y+15,R30
; 0000 00CE                    arr1[3] = i1;
	MOVW R30,R28
	ADIW R30,18
	ST   Z,R19
; 0000 00CF 
; 0000 00D0                    delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00D1                    i1 = arr1[1];
	LDD  R19,Y+16
; 0000 00D2                    arr1[1] = arr1[2];
	LDD  R30,Y+17
	STD  Y+16,R30
; 0000 00D3                    arr1[2] = i1;
	MOVW R30,R28
	ADIW R30,17
	ST   Z,R19
; 0000 00D4 
; 0000 00D5                    delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00D6                    PORTA.6 = arr1[3];
	LDD  R30,Y+18
	CPI  R30,0
	BRNE _0x83
	CBI  0x1B,6
	RJMP _0x84
_0x83:
	SBI  0x1B,6
_0x84:
; 0000 00D7                    PORTA.4 = arr1[2];
	LDD  R30,Y+17
	CPI  R30,0
	BRNE _0x85
	CBI  0x1B,4
	RJMP _0x86
_0x85:
	SBI  0x1B,4
_0x86:
; 0000 00D8                    PORTA.2 = arr1[1];
	LDD  R30,Y+16
	CPI  R30,0
	BRNE _0x87
	CBI  0x1B,2
	RJMP _0x88
_0x87:
	SBI  0x1B,2
_0x88:
; 0000 00D9                    PORTA.0 = arr1[0];
	LDD  R30,Y+15
	CPI  R30,0
	BRNE _0x89
	CBI  0x1B,0
	RJMP _0x8A
_0x89:
	SBI  0x1B,0
_0x8A:
; 0000 00DA 
; 0000 00DB                    delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00DC                    for (b = a%3 ; b < 16 ; b = b+3){
	MOV  R26,R21
	CLR  R27
	LDI  R30,LOW(3)
	LDI  R31,HIGH(3)
	CALL __MODW21
	MOV  R20,R30
_0x8C:
	CPI  R20,16
	BRLO PC+2
	RJMP _0x8D
; 0000 00DD                          i1= b ;
	MOV  R19,R20
; 0000 00DE                         for (i2=0; i2 < 4; i2++){//0011
	LDI  R18,LOW(0)
_0x8F:
	CPI  R18,4
	BRSH _0x90
; 0000 00DF                              arr2[i2] =   i1%2;
	MOV  R30,R18
	LDI  R31,0
	MOVW R26,R28
	ADIW R26,11
	RCALL SUBOPT_0x6
; 0000 00E0                              i1 = i1/2;
; 0000 00E1                         }
	SUBI R18,-1
	RJMP _0x8F
_0x90:
; 0000 00E2 
; 0000 00E3                         delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00E4                         i1 = arr2[0];
	LDD  R19,Y+11
; 0000 00E5                         arr2[0] = arr2[3];
	LDD  R30,Y+14
	STD  Y+11,R30
; 0000 00E6                         arr2[3] = i1;
	MOVW R30,R28
	ADIW R30,14
	ST   Z,R19
; 0000 00E7 
; 0000 00E8                         delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00E9                         i1 = arr2[1];
	LDD  R19,Y+12
; 0000 00EA                         arr2[1] = arr2[2];
	LDD  R30,Y+13
	STD  Y+12,R30
; 0000 00EB                         arr2[2] = i1;
	MOVW R30,R28
	ADIW R30,13
	ST   Z,R19
; 0000 00EC 
; 0000 00ED                         delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00EE                         PORTA.5 = arr2[3];
	LDD  R30,Y+14
	CPI  R30,0
	BRNE _0x91
	CBI  0x1B,5
	RJMP _0x92
_0x91:
	SBI  0x1B,5
_0x92:
; 0000 00EF                         PORTA.3 = arr2[2];
	LDD  R30,Y+13
	CPI  R30,0
	BRNE _0x93
	CBI  0x1B,3
	RJMP _0x94
_0x93:
	SBI  0x1B,3
_0x94:
; 0000 00F0                         PORTA.1 = arr2[1];
	LDD  R30,Y+12
	CPI  R30,0
	BRNE _0x95
	CBI  0x1B,1
	RJMP _0x96
_0x95:
	SBI  0x1B,1
_0x96:
; 0000 00F1                         PORTC.1 = arr2[0];
	LDD  R30,Y+11
	CPI  R30,0
	BRNE _0x97
	CBI  0x15,1
	RJMP _0x98
_0x97:
	SBI  0x15,1
_0x98:
; 0000 00F2 
; 0000 00F3                         delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00F4 
; 0000 00F5                         temp = a + b + PORTC.7;
	MOV  R26,R20
	ADD  R26,R21
	LDI  R30,0
	SBIC 0x15,7
	LDI  R30,1
	ADD  R30,R26
	MOV  R16,R30
; 0000 00F6 
; 0000 00F7                         for (i2=0; i2 < 5; i2++){
	LDI  R18,LOW(0)
_0x9A:
	CPI  R18,5
	BRSH _0x9B
; 0000 00F8                              arr3[i2] =   temp%2;
	MOV  R30,R18
	LDI  R31,0
	MOVW R26,R28
	ADIW R26,6
	ADD  R30,R26
	ADC  R31,R27
	MOVW R0,R30
	MOV  R30,R16
	LDI  R31,0
	LDI  R26,LOW(1)
	LDI  R27,HIGH(1)
	CALL __MANDW12
	MOVW R26,R0
	ST   X,R30
; 0000 00F9                              temp = temp/2;
	MOV  R26,R16
	LDI  R27,0
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	CALL __DIVW21
	MOV  R16,R30
; 0000 00FA                         }
	SUBI R18,-1
	RJMP _0x9A
_0x9B:
; 0000 00FB 
; 0000 00FC                         delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 00FD                         i1 = arr3[0];
	LDD  R19,Y+6
; 0000 00FE                         arr3[0] = arr3[4];
	LDD  R30,Y+10
	STD  Y+6,R30
; 0000 00FF                         arr3[4] = i1;
	MOVW R30,R28
	ADIW R30,10
	ST   Z,R19
; 0000 0100 
; 0000 0101                         delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 0102                         i1 = arr3[1];
	LDD  R19,Y+7
; 0000 0103                         arr3[1] = arr3[3];
	LDD  R30,Y+9
	STD  Y+7,R30
; 0000 0104                         arr3[3] = i1;
	MOVW R30,R28
	ADIW R30,9
	ST   Z,R19
; 0000 0105 
; 0000 0106                         delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 0107                         if(PINC.6 == arr3[4] && PINC.5 == arr3[3] && PINC.4==arr3[2] && PINC.3==arr3[1]){
	RCALL SUBOPT_0x7
	BRNE _0x9D
	RCALL SUBOPT_0x8
	BRNE _0x9D
	RCALL SUBOPT_0x9
	BRNE _0x9D
	RCALL SUBOPT_0xA
	BREQ _0x9E
_0x9D:
	RJMP _0x9C
_0x9E:
; 0000 0108                             test = ON;
	LDI  R17,LOW(1)
; 0000 0109                         }
; 0000 010A                         else if(PINC.6!=arr3[4] || PINC.5!=arr3[3] || PINC.4!=arr3[2] || PINC.3!=arr3[1]) {
	RJMP _0x9F
_0x9C:
	RCALL SUBOPT_0x7
	BRNE _0xA1
	RCALL SUBOPT_0x8
	BRNE _0xA1
	RCALL SUBOPT_0x9
	BRNE _0xA1
	RCALL SUBOPT_0xA
	BREQ _0xA0
_0xA1:
; 0000 010B                             test = OFF;
	LDI  R17,LOW(0)
; 0000 010C                             break;
	RJMP _0x8D
; 0000 010D                         }
; 0000 010E                    }
_0xA0:
_0x9F:
	SUBI R20,-LOW(3)
	RJMP _0x8C
_0x8D:
; 0000 010F 
; 0000 0110                }
	SUBI R21,-1
	RJMP _0x7E
_0x7F:
; 0000 0111            }
	LDI  R30,0
	SBIC 0x15,7
	LDI  R30,1
	SUBI R30,-LOW(1)
	OUT  0x15,R30
	SUBI R30,LOW(1)
	RJMP _0x79
_0x7A:
; 0000 0112 
; 0000 0113      return test;
	MOV  R30,R17
	CALL __LOADLOCR6
	ADIW R28,19
	RET
; 0000 0114      }
; .FEND
;
;
;
;
; char check_4002 (){
; 0000 0119 char check_4002 (){
_check_4002:
; .FSTART _check_4002
; 0000 011A 
; 0000 011B     char test = 1;
; 0000 011C     char i1,i2,i3,i4;
; 0000 011D 
; 0000 011E 
; 0000 011F     DDRA    = 0xfe ; // 1111 1110
	CALL __SAVELOCR6
;	test -> R17
;	i1 -> R16
;	i2 -> R19
;	i3 -> R18
;	i4 -> R21
	LDI  R17,1
	LDI  R30,LOW(254)
	OUT  0x1A,R30
; 0000 0120     PORTA   = 0x01 ; // 0000 0001
	LDI  R30,LOW(1)
	OUT  0x1B,R30
; 0000 0121 
; 0000 0122     DDRC    = 0xfd ; // 1111 1101
	LDI  R30,LOW(253)
	OUT  0x14,R30
; 0000 0123     PORTC   = 0x02 ; // 0000 0010
	LDI  R30,LOW(2)
	OUT  0x15,R30
; 0000 0124     PORTA.6 = OFF;
	CBI  0x1B,6
; 0000 0125 
; 0000 0126     for(i1=0; i1<2 ; i1++){
	LDI  R16,LOW(0)
_0xA6:
	CPI  R16,2
	BRLO PC+2
	RJMP _0xA7
; 0000 0127 
; 0000 0128           for(i2=0; i2<2 ; i2++){
	LDI  R19,LOW(0)
_0xA9:
	CPI  R19,2
	BRLO PC+2
	RJMP _0xAA
; 0000 0129 
; 0000 012A           for(i3=0; i3<2 ; i3++){
	LDI  R18,LOW(0)
_0xAC:
	CPI  R18,2
	BRLO PC+2
	RJMP _0xAD
; 0000 012B 
; 0000 012C           for(i4=0; i4<2 ; i4++){
	LDI  R21,LOW(0)
_0xAF:
	CPI  R21,2
	BRLO PC+2
	RJMP _0xB0
; 0000 012D 
; 0000 012E               if( i4 == 1){
	CPI  R21,1
	BRNE _0xB1
; 0000 012F                 PORTA.1 = ON;
	SBI  0x1B,1
; 0000 0130                 PORTC.5 = ON;
	SBI  0x15,5
; 0000 0131               }
; 0000 0132               else if( i4 == 0){
	RJMP _0xB6
_0xB1:
	CPI  R21,0
	BRNE _0xB7
; 0000 0133                  PORTA.1 = OFF;
	CBI  0x1B,1
; 0000 0134                  PORTC.5 = OFF;
	CBI  0x15,5
; 0000 0135               }
; 0000 0136 
; 0000 0137               if( i3 == 1){
_0xB7:
_0xB6:
	CPI  R18,1
	BRNE _0xBC
; 0000 0138                 PORTA.2 = ON;
	SBI  0x1B,2
; 0000 0139                 PORTC.4 = ON;
	SBI  0x15,4
; 0000 013A               }
; 0000 013B               else if( i3 == 0){
	RJMP _0xC1
_0xBC:
	CPI  R18,0
	BRNE _0xC2
; 0000 013C                 PORTA.2 = OFF;
	CBI  0x1B,2
; 0000 013D                 PORTC.4 = OFF;
	CBI  0x15,4
; 0000 013E               }
; 0000 013F 
; 0000 0140               if( i2 == 1){
_0xC2:
_0xC1:
	CPI  R19,1
	BRNE _0xC7
; 0000 0141                 PORTA.3 = ON;
	SBI  0x1B,3
; 0000 0142                 PORTC.3 = ON;
	SBI  0x15,3
; 0000 0143               }
; 0000 0144               else if( i2 == 0){
	RJMP _0xCC
_0xC7:
	CPI  R19,0
	BRNE _0xCD
; 0000 0145                 PORTA.3 = OFF;
	CBI  0x1B,3
; 0000 0146                 PORTC.3 = OFF;
	CBI  0x15,3
; 0000 0147               }
; 0000 0148 
; 0000 0149               if( i1 == 1){
_0xCD:
_0xCC:
	CPI  R16,1
	BRNE _0xD2
; 0000 014A                 PORTC.2 = ON;
	SBI  0x15,2
; 0000 014B                 PORTA.4 = ON;
	SBI  0x1B,4
; 0000 014C               }
; 0000 014D               else if( i1 == 0){
	RJMP _0xD7
_0xD2:
	CPI  R16,0
	BRNE _0xD8
; 0000 014E                 PORTC.2 = OFF;
	CBI  0x15,2
; 0000 014F                 PORTA.4 = OFF;
	CBI  0x1B,4
; 0000 0150               }
; 0000 0151 
; 0000 0152               delay_ms(50);
_0xD8:
_0xD7:
	RCALL SUBOPT_0x3
; 0000 0153 
; 0000 0154               if( PINA.0 == !( PORTA.1 | PORTA.2 | PORTA.3 | PORTA.4 ) || PINC.1 == !( PORTC.5 | PORTC.4 | PORTC.3 | POR ...
	LDI  R30,0
	SBIC 0x19,0
	LDI  R30,1
	MOV  R0,R30
	LDI  R26,0
	SBIC 0x1B,1
	LDI  R26,1
	LDI  R30,0
	SBIC 0x1B,2
	LDI  R30,1
	OR   R30,R26
	MOV  R26,R30
	LDI  R30,0
	SBIC 0x1B,3
	LDI  R30,1
	OR   R30,R26
	MOV  R26,R30
	LDI  R30,0
	SBIC 0x1B,4
	LDI  R30,1
	OR   R30,R26
	CALL __LNEGB1
	CP   R30,R0
	BREQ _0xDE
	LDI  R30,0
	SBIC 0x13,1
	LDI  R30,1
	MOV  R0,R30
	LDI  R26,0
	SBIC 0x15,5
	LDI  R26,1
	LDI  R30,0
	SBIC 0x15,4
	LDI  R30,1
	OR   R30,R26
	MOV  R26,R30
	LDI  R30,0
	SBIC 0x15,3
	LDI  R30,1
	OR   R30,R26
	MOV  R26,R30
	LDI  R30,0
	SBIC 0x15,2
	LDI  R30,1
	OR   R30,R26
	CALL __LNEGB1
	CP   R30,R0
	BRNE _0xDD
_0xDE:
; 0000 0155                    test = ON;
	LDI  R17,LOW(1)
; 0000 0156               }
; 0000 0157               else{
	RJMP _0xE0
_0xDD:
; 0000 0158                    test = OFF;
	LDI  R17,LOW(0)
; 0000 0159                    break;
	RJMP _0xB0
; 0000 015A               }
_0xE0:
; 0000 015B           }
	SUBI R21,-1
	RJMP _0xAF
_0xB0:
; 0000 015C           if( test == OFF){break;}
	CPI  R17,0
	BREQ _0xAD
; 0000 015D           }
	SUBI R18,-1
	RJMP _0xAC
_0xAD:
; 0000 015E           if( test == OFF){break;}
	CPI  R17,0
	BREQ _0xAA
; 0000 015F           }
	SUBI R19,-1
	RJMP _0xA9
_0xAA:
; 0000 0160           if( test == OFF){break;}
	CPI  R17,0
	BREQ _0xA7
; 0000 0161           }
	SUBI R16,-1
	RJMP _0xA6
_0xA7:
; 0000 0162 
; 0000 0163      return test;
	MOV  R30,R17
	CALL __LOADLOCR6
	ADIW R28,6
	RET
; 0000 0164      }
; .FEND
;
;
; char check_4006 (){
; 0000 0167 char check_4006 (){
_check_4006:
; .FSTART _check_4006
; 0000 0168 
; 0000 0169     char test = 1;
; 0000 016A     char counter =0;
; 0000 016B 
; 0000 016C     DDRA    = 0xff ; // 1111 1110
	ST   -Y,R17
	ST   -Y,R16
;	test -> R17
;	counter -> R16
	RCALL SUBOPT_0x5
; 0000 016D     PORTA   = 0x00 ; // 0000 0001
; 0000 016E 
; 0000 016F     DDRC    = 0x00 ; // 1111 1101
	LDI  R30,LOW(0)
	OUT  0x14,R30
; 0000 0170     PORTC   = 0xff ; // 0000 0010
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0171 
; 0000 0172     //PORTA.6 = OFF;
; 0000 0173     PORTA.2 =   ON;
	SBI  0x1B,2
; 0000 0174 
; 0000 0175             counter = 0;
	LDI  R16,LOW(0)
; 0000 0176             while (counter < 4 ){
_0xE6:
	CPI  R16,4
	BRSH _0xE8
; 0000 0177                 PORTA.0 = counter%2 && 0x01 ; // 1 1 1 1
	MOV  R26,R16
	CLR  R27
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	CALL __MODW21
	SBIW R30,0
	BREQ _0xE9
	LDI  R30,LOW(1)
	CPI  R30,0
	BREQ _0xE9
	LDI  R30,1
	RJMP _0xEA
_0xE9:
	LDI  R30,0
_0xEA:
	CPI  R30,0
	BRNE _0xEB
	CBI  0x1B,0
	RJMP _0xEC
_0xEB:
	SBI  0x1B,0
_0xEC:
; 0000 0178                 PORTA.3 = (!PORTA.0 & 0x01);       // 1 0 1 0
	LDI  R26,0
	SBIS 0x1B,0
	LDI  R26,1
	LDI  R30,LOW(1)
	AND  R30,R26
	BRNE _0xED
	CBI  0x1B,3
	RJMP _0xEE
_0xED:
	SBI  0x1B,3
_0xEE:
; 0000 0179                 PORTA.4 = ON;                 // 1 1 1 1
	SBI  0x1B,4
; 0000 017A                 PORTA.5 = OFF ;               // 0 0 0 0
	CBI  0x1B,5
; 0000 017B 
; 0000 017C                 delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 017D                 PORTA.2 = OFF ;
	CBI  0x1B,2
; 0000 017E                 delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 017F                 PORTA.2 = ON;
	SBI  0x1B,2
; 0000 0180                 delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 0181                 counter++;
	SUBI R16,-1
; 0000 0182             }
	RJMP _0xE6
_0xE8:
; 0000 0183             counter = 0;
	LDI  R16,LOW(0)
; 0000 0184             while (counter < 4 ){
_0xF7:
	CPI  R16,4
	BRLO PC+2
	RJMP _0xF9
; 0000 0185 
; 0000 0186                if(counter ==  0){
	CPI  R16,0
	BRNE _0xFA
; 0000 0187                 if( PINC.1 == 1 && PINC.3 ==0  && PINC.4 == 0 && PINC.6 == 0 ){
	SBIS 0x13,1
	RJMP _0xFC
	SBIC 0x13,3
	RJMP _0xFC
	SBIC 0x13,4
	RJMP _0xFC
	SBIS 0x13,6
	RJMP _0xFD
_0xFC:
	RJMP _0xFB
_0xFD:
; 0000 0188                    test = ON;
	LDI  R17,LOW(1)
; 0000 0189                 }
; 0000 018A                 else {
	RJMP _0xFE
_0xFB:
; 0000 018B                    test = OFF;
	LDI  R17,LOW(0)
; 0000 018C                    break;
	RJMP _0xF9
; 0000 018D                 }
_0xFE:
; 0000 018E                }
; 0000 018F 
; 0000 0190                else if (counter == 1){
	RJMP _0xFF
_0xFA:
	CPI  R16,1
	BRNE _0x100
; 0000 0191                  if( PINC.1 == 1  && PINC.3 == 0 && PINC.4 == 0 && PINC.6 == 0 ){
	SBIS 0x13,1
	RJMP _0x102
	SBIC 0x13,3
	RJMP _0x102
	SBIC 0x13,4
	RJMP _0x102
	SBIS 0x13,6
	RJMP _0x103
_0x102:
	RJMP _0x101
_0x103:
; 0000 0192                    test = ON;
	LDI  R17,LOW(1)
; 0000 0193                 }
; 0000 0194                 else {
	RJMP _0x104
_0x101:
; 0000 0195                    test = OFF;
	LDI  R17,LOW(0)
; 0000 0196                    break;
	RJMP _0xF9
; 0000 0197                 }
_0x104:
; 0000 0198                }
; 0000 0199 
; 0000 019A                else if (counter == 2){
	RJMP _0x105
_0x100:
	CPI  R16,2
	BRNE _0x106
; 0000 019B                  if( PINC.1 == 0  && PINC.3 == 0 && PINC.4 == 0 && PINC.6 == 0  ){
	SBIC 0x13,1
	RJMP _0x108
	SBIC 0x13,3
	RJMP _0x108
	SBIC 0x13,4
	RJMP _0x108
	SBIS 0x13,6
	RJMP _0x109
_0x108:
	RJMP _0x107
_0x109:
; 0000 019C                    test = ON;
	LDI  R17,LOW(1)
; 0000 019D                 }
; 0000 019E                 else {
	RJMP _0x10A
_0x107:
; 0000 019F                    test = OFF;
	LDI  R17,LOW(0)
; 0000 01A0                    break;
	RJMP _0xF9
; 0000 01A1                 }
_0x10A:
; 0000 01A2                }
; 0000 01A3                else if (counter == 3){
	RJMP _0x10B
_0x106:
	CPI  R16,3
	BRNE _0x10C
; 0000 01A4                  if( PINC.1 == 1  && PINC.3 == 0 && PINC.4 == 0 && PINC.6 == 0 ){
	SBIS 0x13,1
	RJMP _0x10E
	SBIC 0x13,3
	RJMP _0x10E
	SBIC 0x13,4
	RJMP _0x10E
	SBIS 0x13,6
	RJMP _0x10F
_0x10E:
	RJMP _0x10D
_0x10F:
; 0000 01A5                    test = ON;
	LDI  R17,LOW(1)
; 0000 01A6                 }
; 0000 01A7                 else {
	RJMP _0x110
_0x10D:
; 0000 01A8                    test = OFF;
	LDI  R17,LOW(0)
; 0000 01A9                    break;
	RJMP _0xF9
; 0000 01AA                 }
_0x110:
; 0000 01AB                }
; 0000 01AC                delay_ms(100);
_0x10C:
_0x10B:
_0x105:
_0xFF:
	RCALL SUBOPT_0x1
; 0000 01AD                PORTA.2 = OFF;
	CBI  0x1B,2
; 0000 01AE                delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 01AF                PORTA.2 = ON;
	SBI  0x1B,2
; 0000 01B0                counter ++;
	SUBI R16,-1
; 0000 01B1                delay_ms(100);
	RCALL SUBOPT_0x1
; 0000 01B2             }
	RJMP _0xF7
_0xF9:
; 0000 01B3 
; 0000 01B4    return test;
	MOV  R30,R17
	LD   R16,Y+
	LD   R17,Y+
	RET
; 0000 01B5    }
; .FEND
;
;
; char check_4007 (){
; 0000 01B8 char check_4007 (){
_check_4007:
; .FSTART _check_4007
; 0000 01B9    char test = 1;
; 0000 01BA 
; 0000 01BB    DDRA    = 0x6e ; // 0110 1110
	ST   -Y,R17
;	test -> R17
	LDI  R17,1
	LDI  R30,LOW(110)
	OUT  0x1A,R30
; 0000 01BC    PORTA   = 0x91 ; // 1001 0001
	LDI  R30,LOW(145)
	OUT  0x1B,R30
; 0000 01BD 
; 0000 01BE    DDRC    = 0x38 ; // 0011 1000
	LDI  R30,LOW(56)
	OUT  0x14,R30
; 0000 01BF    PORTC   = 0xc7 ; // 1100 0111
	LDI  R30,LOW(199)
	OUT  0x15,R30
; 0000 01C0 
; 0000 01C1     PORTA.6 = OFF;
	CBI  0x1B,6
; 0000 01C2     PORTA.1 = ON ;
	SBI  0x1B,1
; 0000 01C3     PORTA.3 = ON ;
	SBI  0x1B,3
; 0000 01C4     PINC.5 = OFF;
	CBI  0x13,5
; 0000 01C5     PINC.3 = ON ;
	SBI  0x13,3
; 0000 01C6 
; 0000 01C7     PORTA.5 = ON;
	SBI  0x1B,5
; 0000 01C8             PORTA.2 = ON;
	SBI  0x1B,2
; 0000 01C9             PINC.4 = ON;
	SBI  0x13,4
; 0000 01CA             if(PORTA.0 == OFF && PORTA.4 == ON && PINC.6 == OFF && PINC.1 == OFF && PINC.2 == OFF){
	SBIC 0x1B,0
	RJMP _0x126
	SBIS 0x1B,4
	RJMP _0x126
	SBIC 0x13,6
	RJMP _0x126
	SBIC 0x13,1
	RJMP _0x126
	SBIS 0x13,2
	RJMP _0x127
_0x126:
	RJMP _0x125
_0x127:
; 0000 01CB                    test = ON;
	LDI  R17,LOW(1)
; 0000 01CC             }
; 0000 01CD             else if (PORTA.0 != OFF && PORTA.4 != ON && PINC.6 != OFF && PINC.1 != OFF && PINC.2 != OFF){
	RJMP _0x128
_0x125:
	SBIS 0x1B,0
	RJMP _0x12A
	SBIC 0x1B,4
	RJMP _0x12A
	SBIS 0x13,6
	RJMP _0x12A
	SBIS 0x13,1
	RJMP _0x12A
	SBIC 0x13,2
	RJMP _0x12B
_0x12A:
	RJMP _0x129
_0x12B:
; 0000 01CE                    test = OFF;
	LDI  R17,LOW(0)
; 0000 01CF             }
; 0000 01D0 
; 0000 01D1 
; 0000 01D2    return test;
_0x129:
_0x128:
	MOV  R30,R17
	LD   R17,Y+
	RET
; 0000 01D3    }
; .FEND
;
;
; char check_4009 (){
; 0000 01D6 char check_4009 (){
_check_4009:
; .FSTART _check_4009
; 0000 01D7     char test = 1;
; 0000 01D8     char i1,i2;
; 0000 01D9     char arr1[6] = {0,1,0,1,0,1};
; 0000 01DA 
; 0000 01DB     DDRA    = 0x55 ; // 0101 0101
	RCALL SUBOPT_0xB
;	test -> R17
;	i1 -> R16
;	i2 -> R19
;	arr1 -> Y+4
; 0000 01DC     PORTA   = 0xAA ; // 1010 1010
; 0000 01DD 
; 0000 01DE     DDRC    = 0xA4 ; // 1010 0100
; 0000 01DF     PORTC   = 0x5B ; // 0101 1011
; 0000 01E0 
; 0000 01E1     PORTA.0 = ON;
	SBI  0x1B,0
; 0000 01E2 
; 0000 01E3     for(i2=0;i2<2;i2++){
	LDI  R19,LOW(0)
_0x12F:
	CPI  R19,2
	BRLO PC+2
	RJMP _0x130
; 0000 01E4                 PORTA.2= arr1[0];
	LDD  R30,Y+4
	CPI  R30,0
	BRNE _0x131
	CBI  0x1B,2
	RJMP _0x132
_0x131:
	SBI  0x1B,2
_0x132:
; 0000 01E5                 PORTA.4= arr1[1];
	LDD  R30,Y+5
	CPI  R30,0
	BRNE _0x133
	CBI  0x1B,4
	RJMP _0x134
_0x133:
	SBI  0x1B,4
_0x134:
; 0000 01E6                 PORTA.6= arr1[2];
	LDD  R30,Y+6
	CPI  R30,0
	BRNE _0x135
	CBI  0x1B,6
	RJMP _0x136
_0x135:
	SBI  0x1B,6
_0x136:
; 0000 01E7                 PORTC.7= arr1[3];
	LDD  R30,Y+7
	CPI  R30,0
	BRNE _0x137
	CBI  0x15,7
	RJMP _0x138
_0x137:
	SBI  0x15,7
_0x138:
; 0000 01E8                 PORTC.5= arr1[4];
	LDD  R30,Y+8
	CPI  R30,0
	BRNE _0x139
	CBI  0x15,5
	RJMP _0x13A
_0x139:
	SBI  0x15,5
_0x13A:
; 0000 01E9                 PORTC.2= arr1[5];
	LDD  R30,Y+9
	CPI  R30,0
	BRNE _0x13B
	CBI  0x15,2
	RJMP _0x13C
_0x13B:
	SBI  0x15,2
_0x13C:
; 0000 01EA                 delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 01EB                 if( PINA.1 == !PORTA.2 && PINA.3 == !PORTA.4 && PINA.5 == !PORTA.6 && PINC.6 == !PORTC.7 && PINC.4== !PO ...
	RCALL SUBOPT_0xC
	BRNE _0x13E
	RCALL SUBOPT_0xD
	BRNE _0x13E
	RCALL SUBOPT_0xE
	BRNE _0x13E
	RCALL SUBOPT_0xF
	BRNE _0x13E
	RCALL SUBOPT_0x10
	BRNE _0x13E
	RCALL SUBOPT_0x11
	BREQ _0x13F
_0x13E:
	RJMP _0x13D
_0x13F:
; 0000 01EC                     test = ON;
	LDI  R17,LOW(1)
; 0000 01ED                 }
; 0000 01EE                 else if( PINA.1 != !PORTA.2 && PINA.3 != !PORTA.4 && PINA.5 != !PORTA.6 && PINC.6 != !PORTC.7 && PINC.4! ...
	RJMP _0x140
_0x13D:
	RCALL SUBOPT_0xC
	BREQ _0x142
	RCALL SUBOPT_0xD
	BREQ _0x142
	RCALL SUBOPT_0xE
	BREQ _0x142
	RCALL SUBOPT_0xF
	BREQ _0x142
	RCALL SUBOPT_0x10
	BREQ _0x142
	RCALL SUBOPT_0x11
	BRNE _0x143
_0x142:
	RJMP _0x141
_0x143:
; 0000 01EF                     test = OFF;
	LDI  R17,LOW(0)
; 0000 01F0                     break;
	RJMP _0x130
; 0000 01F1                 }
; 0000 01F2                 delay_ms(50);
_0x141:
_0x140:
	RCALL SUBOPT_0x3
; 0000 01F3                 for(i1=0;i1<6;i1++){
	LDI  R16,LOW(0)
_0x145:
	CPI  R16,6
	BRSH _0x146
; 0000 01F4                     if(arr1[i1]== 1){
	RCALL SUBOPT_0x12
	LD   R26,X
	CPI  R26,LOW(0x1)
	BRNE _0x147
; 0000 01F5                         arr1[i1] =0;
	RCALL SUBOPT_0x12
	LDI  R30,LOW(0)
	RJMP _0x168
; 0000 01F6                         }
; 0000 01F7                     else if(arr1[i1]== 0){
_0x147:
	RCALL SUBOPT_0x12
	LD   R30,X
	CPI  R30,0
	BRNE _0x149
; 0000 01F8                         arr1[i1] = 1;
	RCALL SUBOPT_0x12
	LDI  R30,LOW(1)
_0x168:
	ST   X,R30
; 0000 01F9                     }
; 0000 01FA                 }
_0x149:
	SUBI R16,-1
	RJMP _0x145
_0x146:
; 0000 01FB 
; 0000 01FC             }
	SUBI R19,-1
	RJMP _0x12F
_0x130:
; 0000 01FD    return test;
	RJMP _0x2000001
; 0000 01FE    }
; .FEND
;
;
; char check_4010 (){
; 0000 0201 char check_4010 (){
_check_4010:
; .FSTART _check_4010
; 0000 0202     char test = 1;
; 0000 0203     char i1,i2;
; 0000 0204     char arr1[6] = {0,1,0,1,0,1};
; 0000 0205 
; 0000 0206     DDRA    = 0x55 ; // 0101 0101
	RCALL SUBOPT_0xB
;	test -> R17
;	i1 -> R16
;	i2 -> R19
;	arr1 -> Y+4
; 0000 0207     PORTA   = 0xAA ; // 1010 1010
; 0000 0208 
; 0000 0209     DDRC    = 0xA4 ; // 1010 0100
; 0000 020A     PORTC   = 0x5B ; // 0101 1011
; 0000 020B 
; 0000 020C     PORTA.0 = ON;
	SBI  0x1B,0
; 0000 020D 
; 0000 020E     for(i2=0;i2<2;i2++){
	LDI  R19,LOW(0)
_0x14D:
	CPI  R19,2
	BRLO PC+2
	RJMP _0x14E
; 0000 020F                 PORTA.2= arr1[0];
	LDD  R30,Y+4
	CPI  R30,0
	BRNE _0x14F
	CBI  0x1B,2
	RJMP _0x150
_0x14F:
	SBI  0x1B,2
_0x150:
; 0000 0210                 PORTA.4= arr1[1];
	LDD  R30,Y+5
	CPI  R30,0
	BRNE _0x151
	CBI  0x1B,4
	RJMP _0x152
_0x151:
	SBI  0x1B,4
_0x152:
; 0000 0211                 PORTA.6= arr1[2];
	LDD  R30,Y+6
	CPI  R30,0
	BRNE _0x153
	CBI  0x1B,6
	RJMP _0x154
_0x153:
	SBI  0x1B,6
_0x154:
; 0000 0212                 PORTC.7= arr1[3];
	LDD  R30,Y+7
	CPI  R30,0
	BRNE _0x155
	CBI  0x15,7
	RJMP _0x156
_0x155:
	SBI  0x15,7
_0x156:
; 0000 0213                 PORTC.5= arr1[4];
	LDD  R30,Y+8
	CPI  R30,0
	BRNE _0x157
	CBI  0x15,5
	RJMP _0x158
_0x157:
	SBI  0x15,5
_0x158:
; 0000 0214                 PORTC.2= arr1[5];
	LDD  R30,Y+9
	CPI  R30,0
	BRNE _0x159
	CBI  0x15,2
	RJMP _0x15A
_0x159:
	SBI  0x15,2
_0x15A:
; 0000 0215                 delay_ms(50);
	RCALL SUBOPT_0x3
; 0000 0216                 if( PINA.1 == PORTA.2 && PINA.3 == PORTA.4 && PINA.5 == PORTA.6 && PINC.6 == PORTC.7 && PINC.4== PORTC.5 ...
	RCALL SUBOPT_0x13
	BRNE _0x15C
	RCALL SUBOPT_0x14
	BRNE _0x15C
	RCALL SUBOPT_0x15
	BRNE _0x15C
	RCALL SUBOPT_0x16
	BRNE _0x15C
	RCALL SUBOPT_0x17
	BRNE _0x15C
	RCALL SUBOPT_0x18
	BREQ _0x15D
_0x15C:
	RJMP _0x15B
_0x15D:
; 0000 0217                     test = ON;
	LDI  R17,LOW(1)
; 0000 0218                 }
; 0000 0219                 else if( PINA.1 != PORTA.2 && PINA.3 != PORTA.4 && PINA.5 != PORTA.6 && PINC.6 != PORTC.7 && PINC.4!= PO ...
	RJMP _0x15E
_0x15B:
	RCALL SUBOPT_0x13
	BREQ _0x160
	RCALL SUBOPT_0x14
	BREQ _0x160
	RCALL SUBOPT_0x15
	BREQ _0x160
	RCALL SUBOPT_0x16
	BREQ _0x160
	RCALL SUBOPT_0x17
	BREQ _0x160
	RCALL SUBOPT_0x18
	BRNE _0x161
_0x160:
	RJMP _0x15F
_0x161:
; 0000 021A                     test = OFF;
	LDI  R17,LOW(0)
; 0000 021B                     break;
	RJMP _0x14E
; 0000 021C                 }
; 0000 021D                 delay_ms(50);
_0x15F:
_0x15E:
	RCALL SUBOPT_0x3
; 0000 021E                 for(i1=0;i1<6;i1++){
	LDI  R16,LOW(0)
_0x163:
	CPI  R16,6
	BRSH _0x164
; 0000 021F                     if(arr1[i1]== 1){
	RCALL SUBOPT_0x12
	LD   R26,X
	CPI  R26,LOW(0x1)
	BRNE _0x165
; 0000 0220                         arr1[i1] =0;
	RCALL SUBOPT_0x12
	LDI  R30,LOW(0)
	RJMP _0x169
; 0000 0221                         }
; 0000 0222                     else if(arr1[i1]== 0){
_0x165:
	RCALL SUBOPT_0x12
	LD   R30,X
	CPI  R30,0
	BRNE _0x167
; 0000 0223                         arr1[i1] = 1;
	RCALL SUBOPT_0x12
	LDI  R30,LOW(1)
_0x169:
	ST   X,R30
; 0000 0224                     }
; 0000 0225                 }
_0x167:
	SUBI R16,-1
	RJMP _0x163
_0x164:
; 0000 0226 
; 0000 0227             }
	SUBI R19,-1
	RJMP _0x14D
_0x14E:
; 0000 0228    return test;
_0x2000001:
	MOV  R30,R17
	CALL __LOADLOCR4
	ADIW R28,10
	RET
; 0000 0229    }
; .FEND
;

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x0:
	LDI  R30,LOW(85)
	OUT  0x1A,R30
	LDI  R30,LOW(170)
	OUT  0x1B,R30
	LDI  R30,LOW(164)
	OUT  0x14,R30
	LDI  R30,LOW(91)
	OUT  0x15,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 11 TIMES, CODE SIZE REDUCTION:17 WORDS
SUBOPT_0x1:
	LDI  R26,LOW(100)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x2:
	CBI  0x12,6
	CBI  0x12,5
	CBI  0x12,4
	LDI  R26,LOW(1000)
	LDI  R27,HIGH(1000)
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 18 TIMES, CODE SIZE REDUCTION:31 WORDS
SUBOPT_0x3:
	LDI  R26,LOW(50)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x4:
	LDI  R26,LOW(1000)
	LDI  R27,HIGH(1000)
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x5:
	LDI  R17,1
	LDI  R16,0
	LDI  R30,LOW(255)
	OUT  0x1A,R30
	LDI  R30,LOW(0)
	OUT  0x1B,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x6:
	ADD  R30,R26
	ADC  R31,R27
	MOVW R0,R30
	MOV  R30,R19
	LDI  R31,0
	LDI  R26,LOW(1)
	LDI  R27,HIGH(1)
	CALL __MANDW12
	MOVW R26,R0
	ST   X,R30
	MOV  R26,R19
	LDI  R27,0
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	CALL __DIVW21
	MOV  R19,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x7:
	LDI  R26,0
	SBIC 0x13,6
	LDI  R26,1
	LDD  R30,Y+10
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x8:
	LDI  R26,0
	SBIC 0x13,5
	LDI  R26,1
	LDD  R30,Y+9
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x9:
	LDI  R26,0
	SBIC 0x13,4
	LDI  R26,1
	LDD  R30,Y+8
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0xA:
	LDI  R26,0
	SBIC 0x13,3
	LDI  R26,1
	LDD  R30,Y+7
	LDI  R27,0
	SBRC R26,7
	SER  R27
	LDI  R31,0
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0xB:
	SBIW R28,6
	LDI  R30,LOW(0)
	ST   Y,R30
	LDI  R30,LOW(1)
	STD  Y+1,R30
	LDI  R30,LOW(0)
	STD  Y+2,R30
	LDI  R30,LOW(1)
	STD  Y+3,R30
	LDI  R30,LOW(0)
	STD  Y+4,R30
	LDI  R30,LOW(1)
	STD  Y+5,R30
	CALL __SAVELOCR4
	LDI  R17,1
	RJMP SUBOPT_0x0

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0xC:
	LDI  R26,0
	SBIC 0x19,1
	LDI  R26,1
	LDI  R30,0
	SBIS 0x1B,2
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0xD:
	LDI  R26,0
	SBIC 0x19,3
	LDI  R26,1
	LDI  R30,0
	SBIS 0x1B,4
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0xE:
	LDI  R26,0
	SBIC 0x19,5
	LDI  R26,1
	LDI  R30,0
	SBIS 0x1B,6
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0xF:
	LDI  R26,0
	SBIC 0x13,6
	LDI  R26,1
	LDI  R30,0
	SBIS 0x15,7
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x10:
	LDI  R26,0
	SBIC 0x13,4
	LDI  R26,1
	LDI  R30,0
	SBIS 0x15,5
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x11:
	LDI  R26,0
	SBIC 0x13,1
	LDI  R26,1
	LDI  R30,0
	SBIS 0x15,2
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:25 WORDS
SUBOPT_0x12:
	MOV  R30,R16
	LDI  R31,0
	MOVW R26,R28
	ADIW R26,4
	ADD  R26,R30
	ADC  R27,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x13:
	LDI  R26,0
	SBIC 0x19,1
	LDI  R26,1
	LDI  R30,0
	SBIC 0x1B,2
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x14:
	LDI  R26,0
	SBIC 0x19,3
	LDI  R26,1
	LDI  R30,0
	SBIC 0x1B,4
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x15:
	LDI  R26,0
	SBIC 0x19,5
	LDI  R26,1
	LDI  R30,0
	SBIC 0x1B,6
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x16:
	LDI  R26,0
	SBIC 0x13,6
	LDI  R26,1
	LDI  R30,0
	SBIC 0x15,7
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x17:
	LDI  R26,0
	SBIC 0x13,4
	LDI  R26,1
	LDI  R30,0
	SBIC 0x15,5
	LDI  R30,1
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x18:
	LDI  R26,0
	SBIC 0x13,1
	LDI  R26,1
	LDI  R30,0
	SBIC 0x15,2
	LDI  R30,1
	CP   R30,R26
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

__LNEGB1:
	TST  R30
	LDI  R30,1
	BREQ __LNEGB1F
	CLR  R30
__LNEGB1F:
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

__SAVELOCR6:
	ST   -Y,R21
__SAVELOCR5:
	ST   -Y,R20
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR6:
	LDD  R21,Y+5
__LOADLOCR5:
	LDD  R20,Y+4
__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

__INITLOCB:
__INITLOCW:
	ADD  R26,R28
	ADC  R27,R29
__INITLOC0:
	LPM  R0,Z+
	ST   X+,R0
	DEC  R24
	BRNE __INITLOC0
	RET

;END OF CODE MARKER
__END_OF_CODE:
