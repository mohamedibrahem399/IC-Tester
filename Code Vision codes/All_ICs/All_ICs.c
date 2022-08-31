/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : All_ICs
Version : 
Date    : 1/2/2022
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

char check_4002 ();
char check_4006 ();
char check_4007 ();
char check_4008 ();
char check_4009 ();
char check_4010 ();

 
 /*    
 #define LED_4002 PORTD.2
 #define LED_4006 PORTD.3
 #define LED_4007 PORTD.6
 #define LED_4008 PORTD.5
 #define LED_4009 PORTD.4
 */
 #define BUTTON1 PIND.2
 
 #define ON  1
 #define OFF 0
 
 char temp=0;
 char i;
 
 
void main(void)
{
    DDRD    = 0xfb ; //1111 1011
    PORTD   = 0x04 ; //0000 0100 
    
    LED_4002 = ON;
    delay_ms(100);
    LED_4002 = OFF;
    
    LED_4006 = ON;
    delay_ms(100);
    LED_4006 = OFF; 
     
    LED_4007 = ON;
    delay_ms(100);
    LED_4007 = OFF;
    
    LED_4008 = ON;
    delay_ms(100);
    LED_4008 = OFF;
    
    LED_4009 = ON;    
    delay_ms(100);
    LED_4009 = OFF;    

while (1)
      {
      if(BUTTON1 == ON){
      i=0;
        for(i=0;i<6;i++){
            if(i==0){
                temp =check_4006();
                if(temp == 1){ 
                  LED_4002 =OFF;
                  LED_4006 =ON;
                  LED_4007=OFF;
                  LED_4008=OFF;
                  LED_4009=OFF;
                  delay_ms(1000);
                break;}
                 
            }
            else if(i==1){
                
                temp = check_4002();
                delay_ms(50);
                if(temp == 1){
                 LED_4002 =ON;
                 LED_4006=OFF;
                 LED_4007=OFF;
                 LED_4008=OFF;
                 LED_4009=OFF;
                 delay_ms(1000);
                 break;}
                
                
            }
            else if(i==2){
                temp =check_4008();
                if(temp == 1){
                   LED_4002=OFF;
                   LED_4006=OFF; 
                   LED_4007 =OFF;
                   LED_4008=ON;
                   LED_4009=OFF;
                   delay_ms(1000);
                break;}
                
                
            } 
            else if(i==3){
                temp =check_4009();
                if(temp == 1){
                    LED_4002=OFF;
                    LED_4006=OFF; 
                    LED_4007 =OFF;
                    LED_4008=OFF;
                    LED_4009=ON;
                    delay_ms(1000); 
                break;} 
                
       
            }
            else if(i==4){
         
                temp =check_4010();
                if(temp == 1){
                    LED_4002=OFF;
                    LED_4006=OFF; 
                    LED_4007 =OFF;
                    LED_4008=ON;
                    LED_4009=ON;
                    delay_ms(1000);    
                break;}
            }
            else if(i==5){
                
                temp =check_4007();
                if(temp == 1){
                   LED_4002 =OFF;
                   LED_4006=OFF; 
                   LED_4007 =ON;
                   LED_4008=OFF;
                   LED_4009=OFF;
                   delay_ms(1000);
                break;}
            }
        }               
       }
       else{
           DDRD    = 0xfb ; //1111 1011
           PORTD   = 0x04 ; //0000 0100
           temp =0;
           LED_4002=OFF;
           LED_4006=OFF; 
           LED_4007 =OFF;
           LED_4008=OFF;
           LED_4009=OFF;
       }
      }
}

 
 
 
 
 
 char check_4008 (){

     char test = 1;
     char temp =0;
     char i1,i2;
     char a,b;
     char arr1[4] = {0,0,0,0};
     char arr2[4] = {0,0,0,0};
     char arr3[5] = {0,0,0,0,0};
         
     DDRA    = 0xff ; // 1111 1111
     PORTA   = 0x00 ; // 0000 0000
     DDRC    = 0x83 ; // 1000 0011
     PORTC   = 0x7C ; // 0111 1100
     for(PORTC.7=0 ; PORTC.7<2 ; PORTC.7++){
               for (a=0;a<16;a++){
                   delay_ms(50);
                   i1= a;
                   for (i2=0; i2 < 4; i2++){
                        arr1[i2] =   i1%2 ;
                        i1 = i1/2;
                   }

                   delay_ms(50);
                   i1 = arr1[0];
                   arr1[0] = arr1[3];
                   arr1[3] = i1;

                   delay_ms(50);
                   i1 = arr1[1];
                   arr1[1] = arr1[2];
                   arr1[2] = i1;

                   delay_ms(50);
                   PORTA.6 = arr1[3];
                   PORTA.4 = arr1[2];
                   PORTA.2 = arr1[1];
                   PORTA.0 = arr1[0];

                   delay_ms(50);
                   for (b = a%3 ; b < 16 ; b = b+3){
                         i1= b ;
                        for (i2=0; i2 < 4; i2++){//0011
                             arr2[i2] =   i1%2;
                             i1 = i1/2;
                        }

                        delay_ms(50);
                        i1 = arr2[0];
                        arr2[0] = arr2[3];
                        arr2[3] = i1;

                        delay_ms(50);
                        i1 = arr2[1];
                        arr2[1] = arr2[2];
                        arr2[2] = i1;

                        delay_ms(50);
                        PORTA.5 = arr2[3];
                        PORTA.3 = arr2[2];
                        PORTA.1 = arr2[1];
                        PORTC.1 = arr2[0];

                        delay_ms(50);

                        temp = a + b + PORTC.7;

                        for (i2=0; i2 < 5; i2++){
                             arr3[i2] =   temp%2;
                             temp = temp/2;
                        }

                        delay_ms(50);
                        i1 = arr3[0];
                        arr3[0] = arr3[4];
                        arr3[4] = i1;

                        delay_ms(50);
                        i1 = arr3[1];
                        arr3[1] = arr3[3];
                        arr3[3] = i1;

                        delay_ms(50);
                        if(PINC.6 == arr3[4] && PINC.5 == arr3[3] && PINC.4==arr3[2] && PINC.3==arr3[1]){
                            test = ON;
                        }
                        else if(PINC.6!=arr3[4] || PINC.5!=arr3[3] || PINC.4!=arr3[2] || PINC.3!=arr3[1]) {
                            test = OFF;
                            break;
                        }
                   }

               }
           }
     
     return test;      
     }
                     
  


 char check_4002 (){
    
    char test = 1;
    char i1,i2,i3,i4;

        
    DDRA    = 0xdf ; // 1101 1111
    PORTA   = 0x20 ; // 0010 0000

    DDRC    = 0xbf ; // 1011 1111
    PORTC   = 0x40 ; // 0100 0000

    DDRD    = 0xfb ; //1111 1011
    PORTD   = 0x04 ; //0000 0100

    DDRB  = 0xff;
    PORTB = 0x00;

    PORTD.7 = OFF;
    PORTC.5 = ON ;
    PORTD.6 = OFF;
    PORTB.3 = OFF;
for(i1=0; i1<2 ; i1++){

          for(i2=0; i2<2 ; i2++){

          for(i3=0; i3<2 ; i3++){

          for(i4=0; i4<2 ; i4++){

              if( i4 == 1){
                PORTA.6 = ON;
                PORTB.2 = ON;
              }
              else if( i4 == 0){
                 PORTA.6 = OFF;
                 PORTB.2 = OFF;
              }

              if( i3 == 1){
                PORTA.7 = ON;
                PORTB.1 = ON;
              }
              else if( i3 == 0){
                PORTA.7 = OFF;
                PORTB.1 = OFF;
              }

              if( i2 == 1){
                PORTD.4 = ON;
                PORTB.0 = ON;
              }
              else if( i2 == 0){
                PORTD.4 = OFF;
                PORTB.0 = OFF;
              }

              if( i1 == 1){
                PORTC.7 = ON;
                PORTD.5 = ON;
              }
              else if( i1 == 0){
                PORTC.7 = OFF;
                PORTD.5 = OFF;
              }

              delay_ms(10);

              if( PINA.5 == !( PORTA.6 | PORTA.7 | PORTD.4 | PORTD.5 ) || PINC.6 == !( PORTB.2 | PORTB.1 | PORTB.0 | PORTC.7 ) ){
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
    
     return test;      
     }

 
 char check_4006 (){
    
    char test = 1;
    char counter =0;
    
    DDRA    = 0xff ; // 1111 1111
    PORTA   = 0x00 ; // 0000 0000

    DDRC    = 0x3f ; // 0011 1111
    PORTC   = 0xc0 ; // 1100 0000

    DDRB    = 0xf0 ; // 1111 0000
    PORTB   = 0x0f ; // 0000 1111


    DDRD    = 0xfb ; //1111 1011
    PORTD   = 0x04 ; //0000 0100


    PORTC.5 =  ON;
    PORTD.7 = OFF;
    PORTA.7 =  ON;
    PORTA.6 = OFF;
    
           counter = 0;
            while (counter < 4 ){
                PORTA.5 = 1 ;                 // 1 1 1 1
                PORTD.4 = (!PORTA.5 & 0x01);  // 1 0 1 0
                PORTD.5 = ON;                 // 1 1 1 1
                PORTD.6 = OFF ;               // 0 0 0 0

                delay_ms(100);
                PORTA.7 = OFF ;
                delay_ms(100);
                PORTA.7 = ON;
                delay_ms(100);
                counter++;
            }
            counter = 0;
            while (counter < 4 ){

               if(counter ==  0){
                if( PINC.6 == 1 && PINB.0 ==0  && PINB.1 == 0 && PINB.3 == 0 ){
                   test = ON;
                }
                else {
                   test = OFF;
                   break;
                }
               }

               else if (counter == 1){
                 if( PINC.6 == 1  && PINB.0 == 0 && PINB.1 == 0 && PINB.3 == 0 ){
                   test = ON;
                }
                else {
                   test = OFF;
                   break;
                }
               }

               else if (counter == 2){
                 if( PINC.6 == 1  && PINB.0 == 0 && PINB.1 == 0 && PINB.3 == 0  ){
                   test = ON;
                }
                else {
                   test = OFF;
                   break;
                }
               }
               else if (counter == 3){
                 if( PINC.6 == 1  && PINB.0 == 0 && PINB.1 == 0 && PINB.3 == 0 ){
                   test = ON;
                }
                else {
                   test = OFF;
                   break;
                }
               }
               delay_ms(100);
               PORTA.7 = OFF;
               delay_ms(100);
               PORTA.7 = ON;
               counter ++;
               delay_ms(100);
               if(test ==OFF){break;}
            }           

   return test;      
   }


 char check_4007 (){
   char test = 1;
   
    DDRA    = 0xdf ; // 1101 1111
    PORTA   = 0x20 ; // 0010 0000

    DDRD    = 0xdd ; // 1101 1011
    PORTD   = 0x24 ; // 0010 0100

    DDRB    = 0xf7 ; // 1111 0111
    PORTB   = 0x08 ; // 0000 1000

    DDRC    = 0x3f ; // 0011 1111
    PORTC   = 0xc0 ; // 1100 0000



    PORTD.7 = OFF;
    PORTC.5 =  ON;

    PORTA.6 = ON ;
    PORTD.4 = ON ;
    PINB.2 = OFF;
    PINB.0 = ON ;
    
            PORTD.6 = ON;
            PORTA.7 = ON;
            PINB.1 = ON;
            if(PORTA.5 == OFF && PORTD.5 == ON && PINB.3 == OFF && PINC.6 == OFF && PINC.7 == OFF){
                   test = ON;
            }
            else if (PORTA.5 != OFF && PORTD.5 != ON && PINB.3 != OFF && PINC.6 != OFF && PINC.7 != OFF){
                   test = OFF;
                   break;
            }

   return test;      
   }


 char check_4009 (){
    char test = 1;
    char i1,i2;
    char arr1[6] = {0,1,0,1,0,1};

    DDRA    = 0x5f ; // 0101 1111
    PORTA   = 0xa0 ; // 1010 0000

    DDRD    = 0xdb ; // 1101 1011
    PORTD   = 0x24 ; // 0010 0100

    DDRC    = 0xdf ; // 1101 1111
    PORTC   = 0x20 ; // 0010 0000

    DDRB    = 0xfb ; // 1111 1010
    PORTB   = 0x05 ; // 0000 0101

    PORTC.4 = ON;
    PORTD.7  =OFF;
    PORTC.7 = OFF;

    PORTA.4 = ON;
    for(i2=0;i2<2;i2++){
                PORTA.6= arr1[0];
                PORTD.4= arr1[1];
                PORTD.6= arr1[2];
                PORTB.3= arr1[3];
                PORTB.1= arr1[4];
                PORTC.6= arr1[5];
                delay_ms(50);
                if( PINA.5 == !PORTA.6 && PINA.7 == !PORTD.4 && PIND.5 == !PORTD.6 && PINB.2 == !PORTB.3 && PINB.0== !PORTB.1 &&  PINC.5==!PORTC.6 ){
                    test = ON;
                }
                else if( PINA.5 != !PORTA.6 && PINA.7 != !PORTD.4 && PIND.5 != !PORTD.6 && PINB.2 != !PORTB.3 && PINB.0!= !PORTB.1 &&  PINC.5!=!PORTC.6 ){
                    test = OFF;
                    break;
                }
                delay_ms(50);
                if(test= 0){break;}
                for(i1=0;i1<6;i1++){
                    if(arr1[i1]== 1){
                        arr1[i1] =0;
                        }
                    else if(arr1[i1]== 0){
                        arr1[i1] = 1;
                    }
                }

            }           
   return test;      
   }


 char check_4010 (){
    char test = 1;
    char i1,i2;
    char arr1[6] = {0,1,0,1,0,1};

    char test = 1;
    char i1,i2;
    char arr1[6] = {0,1,0,1,0,1};

    DDRA    = 0x5f ; // 0101 1111
    PORTA   = 0xa0 ; // 1010 0000

    DDRD    = 0xdb ; // 1101 1011
    PORTD   = 0x24 ; // 0010 0100

    DDRC    = 0xdf ; // 1101 1111
    PORTC   = 0x20 ; // 0010 0000

    DDRB    = 0xff ; // 1111 1010
    PORTB   = 0x05 ; // 0000 0101

    PORTC.4 = ON;
    PORTD.7  =OFF;
    PORTC.7 = OFF;

    PORTA.4 = ON;
    for(i2=0;i2<2;i2++){
                PORTA.6= arr1[0];
                PORTD.4= arr1[1];
                PORTD.6= arr1[2];
                PORTB.3= arr1[3];
                PORTB.1= arr1[4];
                PORTC.6= arr1[5];
                delay_ms(50);
                if( PINA.5 == PORTA.6 && PINA.7 == PORTD.4 && PIND.5 == PORTD.6 && PINB.2 == PORTB.3 && PINB.0== PORTB.1 &&  PINC.5==PORTC.6 ){
                    test = ON;
                }
                else if( PINA.5 != PORTA.6 && PINA.7 != PORTD.4 && PIND.5 != PORTD.6 && PINB.2 != PORTB.3 && PINB.0!= PORTB.1 &&  PINC.5!=PORTC.6 ){
                    test = OFF;
                    break;
                }
                delay_ms(50);
                if(test= 0){break;}
                for(i1=0;i1<6;i1++){
                    if(arr1[i1]== 1){
                        arr1[i1] =0;
                        }
                    else if(arr1[i1]== 0){
                        arr1[i1] = 1;
                    }
                }

            }             
   return test;      
   }

