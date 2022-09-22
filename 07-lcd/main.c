#include <avr/io.h>
#include <util/delay.h>
#include "lcd.h"

// PORTD -> dados do LCD
// PB6	 -> RS do LCD
// PB7 	 -> EN do LCD

int main(void)
{
	lcd_init();

	lcd_clear();

	lcd_write_char('O');
	lcd_write_char('i');
	lcd_write_char(' ');

	lcd_write_str("oi, str");
	
	while (1) {
		PORTC ^= 1 << 5;
		_delay_ms(1000);
	}

	return 0;	
}

