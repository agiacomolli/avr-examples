all: build

build:
	avr-gcc -Wall -mmcu=atmega328p -nostartfiles button.S -o button.elf
	avr-objcopy -S -O binary button.elf button.bin

check:
	avrdude -b 9600 -p m328p -c usbasp -v

hexdump:
	hexdump -vC button.bin

flash:
	avrdude -b 9600 -p m328p -c usbasp -e -U flash:w:button.bin:r

clean:
	rm button.elf button.bin

