/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : TEST_IC_4007
Version :
Date    : 12/29/2021
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

 // PINS USED WITH THIS IC :- A0 - A4 & C5- C1
 // C6 & C0 & A6 - A5 NOT USED

 // NUMBER OF PINS = 14
 //CONNECTION
                  //PINS IN THE CD4007 IC    // IN OR OUT
 #define DP2    PORTA.5  //PIN 1                    //  OUT DP2 = NOT G2
 #define SP2    PORTA.6  //PIN 2                    //  IN SP2 = 1
 #define G2     PORTA.7  //PIN 3                    //  IN G2
 #define SN2    PORTD.4  //PIN 4                    //  IN SN2 = 1
 #define DN2    PORTD.5  //PIN 5                    //  OUT DN2 = G2
 #define G1     PORTD.6  //PIN 6                    //  IN G1
 #define gnd    PORTD.7  //PIN 7                    //  GND
            
 #define DN1    PINB.3   //PIN 8                    //  OUT DN1 // ALWAYS 0
 #define SN3    PINB.2   //PIN 9                    //  IN SN3 = 0
 #define G3     PINB.1   //PIN 10                   //  IN G3
 #define SP3    PINB.0   //PIN 11                   //  IN SP3 = 1
 #define DNP3   PINC.7   //PIN 12                   //  OUT DNP3 = NOT G3
 #define DP1    PINC.6   //PIN 13                   //  OUT DP1 = NOT G1
 #define vcc    PORTC.5   //PIN 14                  //  VCC


 //INPUT  PORTS IN OUR IC :- A5 , D5 , B3 ,C7 , C6        //DDR  = 0 // PORT.0 =   1
 //OUTPUT PORTS IN OUR IC :-  A3-A1 , A5 , C5,C3          //DDR  = 1 // PORT.1 =   0
                          //  DDRA 0010 1110 , PORTA 1101 0001
                          //  DDRC 0011 1000 , PORTC 1100 0111
 #define ON  1
 #define OFF 0

 #define LED_GREEN PORTD.2
 #define LED_RED PORTD.3


 char test = 1;
 char flag = 1;
 

void main(void)
{
    DDRA    = 0xdf ; // 1101 1111
    PORTA   = 0x20 ; // 0010 0000

    DDRD    = 0xdf ; // 1101 1111
    PORTD   = 0x20 ; // 0010 0000

    DDRB    = 0xf7 ; // 1111 0111
    PORTB   = 0x08 ; // 0000 1000
    
    DDRC    = 0x3f ; // 0011 1111
    PORTC   = 0xc0 ; // 1100 0000

    
              
    gnd = OFF;
    vcc =  ON;
    
    SP2 = ON ;
    SN2 = ON ;
    SN3 = OFF;
    SP3 = ON ;


while (1)
      {
      if  (flag == 1){

            G1 = ON;
            G2 = ON;
            G3 = ON;
            if(DP2 == OFF && DN2 == ON && DN1 == OFF && DP1 == OFF && DNP3 == OFF){
                   LED_GREEN = ON;
                   delay_ms(50);
                   LED_GREEN = OFF;
                   test = ON;
            }
            else if (DP2 != OFF && DN2 != ON && DN1 != OFF && DP1 != OFF && DNP3 != OFF){
                   LED_RED = ON;
                   delay_ms(50);
                   LED_RED = OFF;
                   test = OFF;
                   break;
            }
           flag = 0;

      }
      else if( flag == 0){

        if(test == 1){
              LED_RED = OFF;
              LED_GREEN = ON;
        }
        else if(test == 0){
            LED_GREEN = OFF;
            LED_RED = ON;
        }
      }
}
}
