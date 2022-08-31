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

 // PINS USED WITH THIS IC :- A1 - A6 & C7- C4 & C2-C1
 // C0 & C3 & A7 & A0 NOT USED

 // NUMBER OF PINS = 16
 //CONNECTION 
                   //PINS IN THE CD4010 IC    // IN OR OUT
 #define VDD   PORTA.0  //PIN 1                    //  IN HIGH ALWAYSE
 #define G     PINA.1   //PIN 2                    //  OUT A
 #define A     PORTA.2  //PIN 3                    //  IN A
 #define H     PINA.3   //PIN 4                    //  OUT B
 #define B     PORTA.4  //PIN 5                    //  IN B
 #define I     PINA.5   //PIN 6                    //  OUT C
 #define C     PORTA.6  //PIN 7                    //  IN C
             //PORTA.7  //PIN 8                    //  GND VSS
 #define D     PORTC.7  //PIN 9                    //  IN D
 #define J     PINC.6   //PIN 10                   //  OUT D
 #define E     PORTC.5  //PIN 11                   //  IN E
 #define K     PINC.4   //PIN 12                   //  OUT E
             //PINC.3   //PIN 13                   //  NOT USED
 #define F     PORTC.2  //PIN 14                   //  IN F
 #define L     PINC.1   //PIN 15                   //  OUT F
            //PORTC.0   //PIN 16                   //  VDD       
  
 
 //INPUT  PORTS IN OUR IC :- A1 , A3 , A5  ,C6 ,C4 ,C1          //DDR  = 0 // PORT.0 =   1
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
    DDRA    = 0x55 ; // 0101 0101
    PORTA   = 0xAA ; // 1010 1010 
    
    DDRC    = 0xA4 ; // 1010 0100
    PORTC   = 0x5B ; // 0101 1011
    
    DDRD    = 0xff ;
    PORTD   = 0x00 ;
    
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
