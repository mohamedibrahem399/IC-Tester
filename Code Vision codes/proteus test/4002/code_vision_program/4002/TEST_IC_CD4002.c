/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : TEST_IC_CD4002
Version : 
Date    : 12/27/2021
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
                  //PINS IN THE CD4002 IC    // IN OR OUT
 #define J PINA.0  //PIN 1                    //  OUT1
 #define A PORTA.1 //PIN 2                    //  IN1
 #define B PORTA.2 //PIN 3                    //  IN1
 #define C PORTA.3 //PIN 4                    //  IN1
 #define D PORTA.4 //PIN 5                    //  IN1
        //PORTA.5 //PIN 6                    // NOT USED
        //PORTA.6 //PIN 7                    // GND
        //PORTC.6 //PIN 8                    // NOT USED
 #define E PORTC.5 //PIN 9                    //  IN2
 #define F PORTC.4 //PIN 10                   //  IN2
 #define G PORTC.3 //PIN 11                   //  IN2
 #define H PORTC.2 //PIN 12                   //  IN2
 #define K PINC.1  //PIN 13                   //  OUT2
         //PORTC.0//PIN 14                   //  VCC       
  
 
 //INPUT  PORTS IN OUR IC :- A0 , C1        //DDR  = 0 // PORTA.0 =   1
 //OUTPUT PORTS IN OUR IC :- A1-A4 & C5-C1  //DDR  = 1 // PORTA.1 =   0
 
 #define ON  1
 #define OFF 0
 
 #define LED_GREEN PORTD.2
 #define LED_RED PORTD.3
 
 
 char test = 1;
 char flag = 1;
 char i1,i2,i3,i4;
 
 
void main(void)
{
    DDRA    = 0xfe ; // 1111 1110
    PORTA   = 0x01 ; // 0000 0001
    
    DDRC    = 0xfd ; // 1111 1101
    PORTC   = 0x02 ; // 0000 0010
    
    DDRD    = 0xff ;
    PORTD   = 0x00 ;
    
        
while (1)
      {
      if  (flag == 1){
          
          for(i1=0; i1<2 ; i1++){
              
          for(i2=0; i2<2 ; i2++){
          
          for(i3=0; i3<2 ; i3++){
          
          for(i4=0; i4<2 ; i4++){
              
              if( i4 == 1){
                A = ON;
                E = ON;
              }
              else if( i4 == 0){
                 A = OFF;
                 E = OFF;
              }
              
              if( i3 == 1){
                B = ON;
                F = ON;              
              }
              else if( i3 == 0){
                B = OFF;
                F = OFF;
              }
              
              if( i2 == 1){
                C = ON;
                G = ON;
              }
              else if( i2 == 0){
                C = OFF;
                G = OFF;
              }
              
              if( i1 == 1){
                H = ON;
                D = ON;
              }
              else if( i1 == 0){
                H = OFF;
                D = OFF;
              }

              delay_ms(10);
              
              if( J == !( A | B | C | D ) || K == !( E | F | G | H ) ){
                   LED_GREEN = ON;
                   delay_ms(50);
                   LED_GREEN = OFF;
                   delay_ms(50);
                   test = ON;               
              }
              else{
                   LED_RED = ON;
                   delay_ms(50);
                   LED_RED = OFF;
                   delay_ms(50);
                   test = OFF;
                   break; 
              }
          }
          if( test == OFF){break;}
          }
          if( test == OFF){break;}
          }
          if( test == OFF){break;}
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
