/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : TEST_IC_4010
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
 // NUMBER OF PINS = 16
 //CONNECTION 
                   //PINS IN THE CD4009 IC    // IN OR OUT
 #define VDD   PORTA.4  //PIN 1                    //  IN HIGH ALWAYS
 #define G     PINA.5   //PIN 2                    //  OUT !A
 #define A     PORTA.6  //PIN 3                    //  IN A
 #define H     PINA.7  //PIN 4                    //  OUT !B
 #define B     PORTD.4  //PIN 5                    //  IN B
 #define I     PIND.5   //PIN 6                    //  OUT !C
 #define C     PORTD.6  //PIN 7                    //  IN C
 #define gnd   PORTD.7  //PIN 8                    //  GND VSS 
             
 #define D     PORTB.3  //PIN 9                    //  IN D
 #define J     PINB.2   //PIN 10                   //  OUT !D
 #define E     PORTB.1  //PIN 11                   //  IN E
 #define K     PINB.0  //PIN 12                   //  OUT !E
             //PINC.7   //PIN 13                   //  NOT USED
 #define F     PORTC.6  //PIN 14                   //  IN F
 #define L     PINC.5   //PIN 15                   //  OUT !F
 #define vcc   PORTC.4   //PIN 16                   //  VDD       
  
 
 //INPUT  PORTS IN OUR IC :- A5 A7 D5 B2 B0 C5          //DDR  = 0 // PORT.0 =   1
 //OUTPUT PORTS IN OUR IC :- A0 ,A2, A4, A6, C7 , C5 , C2       //DDR  = 1 // PORT.1 =   0
                 //DDRA  0101 0101 PORTA 1010 1010
                 //DDRC  1010 0100 PORTC 0101 1011       
 #define ON  1
 #define OFF 0
 
 #define LED_GREEN PORTD.2
 #define LED_RED PORTD.3
 
 
 char test = 1;
 char flag = 1;
 char i1,i2; 
 char arr1[6] = {0,1,0,1,0,1};
 
 
void main(void)
{
    DDRA    = 0x5f ; // 0101 1111
    PORTA   = 0xa0 ; // 1010 0000 
    
    DDRD    = 0xdf ; // 1101 1111
    PORTD   = 0x20 ; // 0010 0000
    
    DDRC    = 0xdf ; // 1101 1111
    PORTC   = 0x20 ; // 0010 0000
    
    DDRB    = 0xff ; // 1111 1010
    PORTB   = 0x05 ; // 0000 0101
    
    vcc = ON;
    gnd  =OFF;
    PORTC.7 = OFF;
    
    VDD = ON;
        
while (1)
      {
      if  (flag == 1){ 
            for(i2=0;i2<2;i2++){
                A= arr1[0];
                B= arr1[1];
                C= arr1[2];
                D= arr1[3];
                E= arr1[4];
                F= arr1[5];
                delay_ms(10);
                if( G == A && H == B && I == C && J == D && K== E &&  L==F ){
                    LED_GREEN = ON;
                    delay_ms(50);
                    LED_GREEN = OFF;
                    test = ON;
                }
                else if( G != A && H != B && I != C && J != D && K!= E &&  L!=F ){
                    LED_RED = ON;
                    delay_ms(50);
                    LED_RED = OFF;
                    test = OFF;
                    break;
                }
                delay_ms(10);
                for(i1=0;i1<6;i1++){
                    if(arr1[i1]== 1){
                        arr1[i1] =0;
                        }
                    else if(arr1[i1]== 0){          
                        arr1[i1] = 1;
                    }
                }
                
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
