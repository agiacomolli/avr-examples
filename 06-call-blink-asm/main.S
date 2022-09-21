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
ldi r16, 0
out PORTC, r16

loop:
    ; Read PORTC current value.
    in r20, PINC

    ; Check bit 4 with an AND operation.
    andi r20, 0x10
    brne loop

    ldi r21, 4
    call blink

    jmp loop

blink:
    ; xor with R16 and R17. Result will be on R16.
    ; Write the R16 content to PORTC IO register.
    ; Call delay.
    eor r16, r17
    out PORTC, r16
    call delay

    eor r16, r17
    out PORTC, r16
    call delay

    dec r21
    brne blink
    ret

delay:
    ldi r18, counter
    ldi r19, counter

delay1:
    dec r18
    brne delay1
    ldi r18, counter
    dec r19
    brne delay1
    ret

