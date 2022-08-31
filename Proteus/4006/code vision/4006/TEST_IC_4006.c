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
#include <stdio.h>

 // PINS USED WITH THIS IC :- A0 - A4 & C5- C1
 // C6 & C0 & A6 - A5 NOT USED

 // NUMBER OF PINS = 14
 //CONNECTION 
                  //PINS IN THE CD4002 IC    // IN OR OUT
 #define D1    PORTA.5   //PIN 1                    //  IN D1
             //PORTA.6  //PIN 2                    //  NOT USED
 #define CLK   PORTA.7  //PIN 3                    //  CLK
 #define D2    PORTD.4  //PIN 4                    //  IN D2
 #define D3    PORTD.5  //PIN 5                    //  IN D3
 #define D4    PORTD.6  //PIN 6                    //  IN D4
 #define GND   PORTD.7  //PIN 7                    //  GND
            
            
 #define D4_P4 PINB.3   //PIN 8                    //  OUT D4+4
 #define D4_P5 PINB.2   //PIN 9                    //  OUT D4+5
 #define D3_P4 PINB.1   //PIN 10                   //  OUT D3+4
 #define D2_P4 PINB.0   //PIN 11                   //  OUT D2+4
 #define D2_P5 PINC.7   //PIN 12                   //  OUT D2+5
 #define D1_P4 PINC.6   //PIN 13                   //  OUT D1+4
 #define vcc   PORTC.5  //PIN 14                   //  VCC       
  
 
 //INPUT  PORTS IN OUR IC :- B3-B0 & C7 - C6        //DDR  = 0 // PORT.0 =   1
 //OUTPUT PORTS IN OUR IC :- A6-A1        //DDR  = 1 // PORT.1 =   0
 
 #define ON  1
 #define OFF 0
 
 #define LED_GREEN PORTD.2
 #define LED_RED PORTD.3
 
 
 char test = 1;
 char flag = 1;
 char counter =0;
 
 
void main(void)
{
    DDRA    = 0xff ; // 1111 1111
    PORTA   = 0x00 ; // 0000 0000
    
    DDRC    = 0x3f ; // 0011 1111
    PORTC   = 0xc0 ; // 1100 0000
    
    DDRB    = 0xf0 ; // 1111 0000
    PORTB   = 0x0f ; // 0000 1111
    
    
    DDRD    = 0xff ;
    PORTD   = 0x00 ;
    

    vcc =  ON;
    GND = OFF;
    
    PORTA.6 = OFF;
    
    CLK = OFF;
        
while (1)
      {
      if  (flag == 1){

        counter = 0;
            while (counter < 4 ){
                D1 = counter%2 && 0x01 ; // 0 1 0 1 
                D2 = (!D1 & 0x01);       // 1 0 1 0
                D3 = ON;                 // 1 1 1 1
                D4 = OFF ;               // 0 0 0 0
                
                delay_ms(50);  
                CLK = ON ;
                delay_ms(50);
                CLK = OFF;
                delay_ms(50);
                counter++;
            }
            counter = 0;
            while (counter < 4 ){
               
               if(counter ==  0){
                if( D1_P4 == 0 && D2_P4 == 1 && D3_P4 == 1 && D4_P4 == 0 ){
                   LED_GREEN = ON;
                   delay_ms(50);
                   LED_GREEN = OFF;
                   test = ON; 
                }
                else {
                   LED_RED = ON;
                   delay_ms(50);
                   LED_RED = OFF;
                   test = OFF;
                   break;
                }
               }
               
               else if (counter == 1){
                 if( D1_P4 == 1  && D2_P4 == 0 && D3_P4 == 1 && D4_P4 == 0 ){
                   LED_GREEN = ON;
                   delay_ms(50);
                   LED_GREEN = OFF;
                   test = ON; 
                }
                else {
                   LED_RED = ON;
                   delay_ms(50);
                   LED_RED = OFF;
                   test = OFF;
                   break;
                }
               }
               
               else if (counter == 2){
                 if( D1_P4 == 0 && D2_P4 == 1 && D3_P4 == 1 && D4_P4 == 0 ){
                   LED_GREEN = ON;
                   delay_ms(50);
                   LED_GREEN = OFF;
                   test = ON; 
                }
                else {
                   LED_RED = ON;
                   delay_ms(50);
                   LED_RED = OFF;
                   test = OFF;
                   break;
                }
               }
               else if (counter == 3){
                 if( D1_P4 == 1  && D2_P4 == 0 && D3_P4 == 1 && D4_P4 == 0){
                   LED_GREEN = ON;
                   delay_ms(50);
                   LED_GREEN = OFF;
                   test = ON; 
                }
                else {
                   LED_RED = ON;
                   delay_ms(50);
                   LED_RED = OFF;
                   test = OFF;
                   break;
                }
               }
               delay_ms(50);  
               CLK = ON ;
               delay_ms(50);
               CLK = OFF;
               counter ++;
               delay_ms(50);  
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
