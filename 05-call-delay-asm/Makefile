PROJECT=main

all: build

build: $(PROJECT).bin

$(PROJECT).elf: $(PROJECT).S
	avr-gcc -Wall -mmcu=atmega328p -nostartfiles $(PROJECT).S -o $(PROJECT).elf

$(PROJECT).bin: $(PROJECT).elf
	avr-objcopy -S -O binary $(PROJECT).elf $(PROJECT).bin

check:
	avrdude -b 9600 -p m328p -c usbasp -v

hexdump: $(PROJECT).bin
	hexdump -vC $(PROJECT).bin

flash: $(PROJECT).bin
	avrdude -b 9600 -p m328p -c usbasp -e -U flash:w:$(PROJECT).bin:r

clean:
	rm -rf $(PROJECT).elf $(PROJECT).bin

