.equ PINC, 0x06
.equ DDRC, 0x07
.equ PORTC, 0x08
.equ counter, 0xff

; Load 0x20 into R16 register. Only bit 5 is set. Copy R16 value into R17.
ldi r16, 0x20
mov r17, r16

; Write the R16 register content to DDRC IO register.
out DDRC, r16

; Write the R16 register content to PORTC IO register.
out PORTC, r16

; Load counter value to R18 and R19.
ldi r18, counter
ldi r19, counter

loop:
    ; Read PORTC current value.
    in r20, PINC

    ; Check bit 4 with an AND operation.
    andi r20, 0x10
    brne loop

; Define a label that can be referenced.
blink:
    ; Decrement R18 by one.
    dec r18

    ; Jump to label if R18 isn't zero.
    brne blink

    ; If R18 reach zero, reload counter value.
    ldi r18, counter

    ; Decrement R19 by one.
    dec r19

    ; Jump to label if R19 isn't zero.
    brne blink

    ; If R19 reach zero, reload counter value.
    ldi r19, counter

    ; xor with R16 and R17. Result will be on R16.
    eor r16, r17

    ; Write the R16 content to PORTC IO register.
    out PORTC, r16

    ; Jump to loop label.
    jmp loop

