; Load 0x20 into R16 register. Only bit 5 is set. Copy R16 value into R17.
ldi r16, 0x20
mov r17, r16

; Write the R16 register content to IO address 0x07. This is the address of
; DDRC register.
out 0x07, r16

; Write the R16 register content to IO address 0x08. This is the address of
; PORTC register.
out 0x08, r16

; Load 0xff to R18 and R19. R18 and R19 will be used as loop counters.
ldi r18, 0xff
ldi r19, 0xff

; Define a label that can be referenced.
loop:
    ; Decrement R18 by one.
    dec r18

    ; Jump to label if R18 isn't zero.
    brne loop

    ; If R18 reach zero, load 0xff again.
    ldi r18, 0xff

    ; Decrement R19 by one.
    dec r19

    ; Jump to label if R19 isn't zero.
    brne loop

    ; If R19 reach zero, load 0xff again.
    ldi r19, 0xff

    ; xor with R16 and R17. Result will be on R16.
    eor r16, r17

    ; Write the R16 content to IO address 0x08.
    out 0x08, r16

    ; Jump to loop label.
    jmp loop

