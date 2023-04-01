; Memory Test for Apple II
; Assembled to $300

        ORG $300

START:  JSR HOME
        JSR PRINT_HEADER
        LDX #$40
ADDR_HI:LDY #$00
ADDR_LO:LDA #$AA
        STA (ADDR_PTR),Y
        CMP (ADDR_PTR),Y
        BEQ CONTINUE1
        JSR PRINT_ERROR
        JMP END_TEST
CONTINUE1:
        LDA #$55
        STA (ADDR_PTR),Y
        CMP (ADDR_PTR),Y
        BEQ CONTINUE2
        JSR PRINT_ERROR
        JMP END_TEST
CONTINUE2:
        INY
        BNE ADDR_LO
        INC ADDR_HI
        CPX ADDR_HI
        BNE ADDR_HI
        JMP END_TEST

PRINT_HEADER:
        LDA #13
        JSR COUT
        LDA #10
        JSR COUT
        LDA #MSG_HEADER
        STA $44
        LDA #<MSG_HEADER
        STA $45
        LDA #0
        STA $46
        JSR COUT
        LDA #13
        JSR COUT
        LDA #10
        JSR COUT
        RTS

PRINT_ERROR:
        LDA #13
        JSR COUT
        LDA #10
        JSR COUT
        LDA #MSG_ERROR
        STA $44
        LDA #<MSG_ERROR
        STA $45
        LDA #0
        STA $46
        JSR COUT
        RTS

HOME:   LDA #$1A
        JSR COUT
        RTS

COUT:   JSR $FDED
        RTS

MSG_HEADER:
        .BYTE "MEMORY TEST",13,10
        .BYTE "============",13,10,0

MSG_ERROR:
        .BYTE "Memory error at address: ",0

END_TEST:
        BRK

ADDR_PTR:
        .WORD $4000

        END START
