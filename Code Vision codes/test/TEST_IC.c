/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
? Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : TEST_IC
Version : 
Date    : 12/28/2021
Author  : 
Company : 
Comments: 


Chip type               : ATmega32A
Program type            : Application
AVR Core Clock frequency: 11.059200 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 512
*******************************************************/
#include <mega32a.h>

#include <delay.h>

 // PINS USED WITH THIS IC :- A0 - A6 & C7- C1
 // C0 & A7 NOT USED

 // NUMBER OF PINS = 16
 //CONNECTION 
                   //PINS IN THE CD4008 IC    // IN OR OUT
 #define A4    PORTA.0  //PIN 1                    //  IN A4
 #define B3    PORTA.1  //PIN 2                    //  IN B3
 #define A3    PORTA.2  //PIN 3                    //  IN A3
 #define B2    PORTA.3  //PIN 4                    //  IN B2
 #define A2    PORTA.4  //PIN 5                    //  IN A2
 #define B1    PORTA.5  //PIN 6                    //  IN B1
 #define A1    PORTA.6  //PIN 7                    //  IN A1
             //PORTA.7  //PIN 8                    //  GND
 #define CI    PORTC.7  //PIN 9                    //  IN CI
 #define S1    PINC.6   //PIN 10                   //  OUT S1
 #define S2    PINC.5   //PIN 11                   //  OUT S2
 #define S3    PINC.4   //PIN 12                   //  OUT S3
 #define S4    PINC.3   //PIN 13                   //  OUT S4
 #define CO    PINC.2   //PIN 14                   //  OUT CO
 #define B4    PORTC.1  //PIN 15                   //  IN B4
            //PORTC.0   //PIN 16                   //  VCC       
  
 
 //INPUT  PORTS IN OUR IC :- C6-C2            //DDR  = 0 // PORT.0 =   1
 //OUTPUT PORTS IN OUR IC :- A6-A0 & C7 & C1  //DDR  = 1 // PORT.1 =   0
 
void main(void)
{
    DDRA    = 0xff ; // 1111 1111
    PORTA   = 0x00 ; // 0000 0000
    
    DDRC    = 0x83 ; // 1000 0011
    PORTC   = 0x7C ; // 0111 1100

        
while (1)
      {

}
}
