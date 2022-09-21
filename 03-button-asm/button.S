; Some useful defines to avoid crypticaly values.
.equ PINC, 0x06
.equ DDRC, 0x07
.equ PORTC, 0x08

; Configure only PC5 as output.
ldi r16, 0x20
out DDRC, r16

loop:
    ; Read PORTC current value.
    in r16, PINC

    ; Check bit 4 with an AND operation.
    andi r16, 0x10

    ; Logical shift left with the result.
    lsl r16

    ; Write the result to PORTC.
    out PORTC, r16

    ; Jump to loop label.
    jmp loop

