#include "stm8s.h"
void myDelay(void);
void myDelay()
{
   int i,j;
   for(i=0;i<10;i++)
   {
       for(j=0;j<100;j++);
   } 
}  
bool key;
main()
{
	GPIOD->DDR &= ~(1<<4);
	GPIOD->CR1 |= (1<<4);
	
	GPIOD->DDR |= (1<<1);
	 GPIOD->CR1 |= (1<<1);  // PD.0 as Push Pull Type Output
     while (1)
     {
			 if(!((GPIOD->IDR) & (1<<4)))
			key=1;
			else
			key=0;
      if(key==0)
			GPIOD->ODR |= (1<<1);  // PD.1 and PD.2 = 1
			else
			GPIOD->ODR &= ~(1<<1);
            
     }
		 
	
}
