build:
	avr-gcc -O1 -Wall -mmcu=atmega328p main.c -o main.elf
	avr-objcopy -S -O binary main.elf main.bin

flash: build
	avrdude -b 9600 -p m328p -c usbasp -e -U flash:w:main.bin:r

hexdump: build
	hexdump -vC main.bin

clean:
	rm -f main.bin main.elf

