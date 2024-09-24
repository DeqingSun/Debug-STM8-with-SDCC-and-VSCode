#include "STM8L101F3.h" //https://github.com/gicking/STM8_headers/tree/master

volatile uint8_t a = 0;
volatile uint32_t delay_count = 500000;

void main(void){

    // by default, the CLK_CKDIVR is 3, so it will divide the 16M clock by 8
    // switch to 16MHz (default is 2MHz)
    sfr_CLK.CKDIVR.byte = 0x00;

    // LED
    sfr_PORTC.DDR.byte |= 1<<3;
    sfr_PORTC.CR1.byte |= 1<<3;
    sfr_PORTC.CR2.byte |= 1<<3;
    sfr_PORTC.ODR.byte |= (1<<3);
    
    while(1){
        a = 0;

        sfr_PORTC.ODR.byte |= (1<<3);
        for(uint32_t i=0; i<delay_count; i++){
            __asm__("nop");
        }

        a = 1;

        a = a + 2;

        sfr_PORTC.ODR.byte &= ~(1<<3);
        for(uint32_t i=0; i<delay_count; i++){
            __asm__("nop");
        }

    }

}