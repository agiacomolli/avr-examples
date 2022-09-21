; Load 0x20 into R16 register. Only bit 5 is set.
ldi r16, 0x20

; Write the R16 register content to IO address 0x07. This is the address of
; DDRC register.
out 0x07, r16

; Write the R16 register content to IO address 0x08. This is the address of
; PORTC register.
out 0x08, r16

; Copy R16 register value to R20 register.
mov r20, r16

; Define a label that can be referenced.
label:
    ; xor with R16 and R20. Result will be on R16.
    eor r16, r20
    out 0x08, r16

    ; Jump to label.
    jmp label


