#include <avr/io.h>
#include <util/delay.h>

void lcd_clock(void)
{
	// Gera pulso no enable.
	PORTB = PORTB & ~(1 << 7); // EN = 0
	PORTB = PORTB |  (1 << 7); // EN = 1
	PORTB = PORTB & ~(1 << 7); // EN = 0
}

void lcd_clear(void)
{

}

void lcd_init(void)
{
	// Configura todo o PORTD como saida.
	DDRD = 0xFF;
	DDRC = 0xff;

	// Configura PB6 e PB7 como saidas.
	DDRB = 0xC0;

	// Passo 1.
	// RS RW D7 D6 D5 D4 D3 D2 D1 D0
	// 0  0  0  0  1  1  0  0  0  0
	PORTB = PORTB & ~(1 << 6); // RS = 0
	PORTD = 0x30;	// 0011 0000
	// Gera pulso no enable.
	lcd_clock();
	_delay_ms(5);
	
	// Passo 2.
	// RS RW D7 D6 D5 D4 D3 D2 D1 D0
	// 0  0  0  0  1  1  0  0  0  0
	//PORTB = PORTB & ~(1 << 6); // RS = 0
	//PORTD = 0x30;	// 0011 0000
	// Gera pulso no enable.
	lcd_clock();
	_delay_ms(1);

	// Passo 3.
	// RS RW D7 D6 D5 D4 D3 D2 D1 D0
	// 0  0  0  0  1  1  0  0  0  0
	//PORTB = PORTB & ~(1 << 6); // RS = 0
	//PORTD = 0x30;	// 0011 0000
	// Gera pulso no enable.
	lcd_clock();
	_delay_ms(100);

	// Passo 4: limpa o LCD
	// RS RW D7 D6 D5 D4 D3 D2 D1 D0
	// 0  0  0  0  0  0  0  0  0  1
	//PORTB = PORTB & ~(1 << 6); // RS = 0
	PORTD = 0x01;	// 0000 0001
	// Gera pulso no enable.
	lcd_clock();
	_delay_ms(50);

	// Passo 5: liga o display, liga o cursor e faz piscar.
	// RS RW D7 D6 D5 D4 D3 D2 D1 D0
	// 0  0  0  0  0  0  1  1  1  1
	//PORTB = PORTB & ~(1 << 6); // RS = 0
	PORTD = 0x0F;	// 0000 1111
	// Gera pulso no enable.
	lcd_clock();
	_delay_ms(1);

	// Passo 6: escreve o caracter A
	// RS RW D7 D6 D5 D4 D3 D2 D1 D0
	// 1  0  0  1  0  0  0  0  0  1
	PORTB = PORTB | (1 << 6); // RS = 1
	PORTD = 0x41;	// 0100 0001
	// Gera pulso no enable.
	lcd_clock();
	_delay_ms(1);
}

void lcd_write_char(char c)
{
	PORTB = PORTB | (1 << 6); // RS = 1
	PORTD = c;
	// Gera pulso no enable.
	lcd_clock();
	_delay_ms(1);
}

void lcd_write_str(char *str)
{
	/*
	int i = 0;

	while (str[i] != '\0') {
		lcd_write_char(str[i]);
		i++;
	}
	*/

	/*
	int i = 0;

	while (*(str + i) != 0) {
		lcd_write_char(*(str + i));
	}
	*/

	while (*str)
		lcd_write_char(*str++);
}

