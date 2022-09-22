#ifndef LCD_H
#define LCD_H

/*
 * Inicializa o LCD.
 *
 * Executa os comandos definidos na inicializacao
 * do LCD (manual do fabricante).
 */
void lcd_init(void);

/*
 * Apaga os dados do LCD.
 */
void lcd_clear(void);

/*
 * Escreve um caractere no LCD.
 */
void lcd_write_char(char c);

/*
 * Escreve uma string no LCD.
 */
void lcd_write_str(char *str);

/*
 * Posiciona o cursor na tela do LCD.
 */
void lcd_set_pos(int lin, int col);

#endif /* LCD_H */

