;******************************************************************************
; DELAY 16MHZ LIBRARY							      *
; ROUTINES: DELAY_5mS: 5 milliseconds delay				      *
;	    DELAY_500mS: 500 milliseconds delay				      *
; Based on http://www.piclist.com/techref/piclist/codegen/delay.htm	      *
;******************************************************************************  
;-----------------------------------------------
DELAY_5mS:
; Delay = 0.005 seconds
; Clock frequency = 16 MHz
; Actual delay = 0.005 seconds = 20000 cycles
; Error = 0 %
	movlw	0x9F
	movwf	delay1
	movlw	0x10
	movwf	delay2
DELAY_5mS_loop
	decfsz	delay1, f
	goto	$+2
	decfsz	delay2, f
	goto	DELAY_5mS_loop

			;2 cycles
	goto	$+1
DELAY_5mS_END:
    RETURN
;-----------------------------------------------
;-----------------------------------------------
DELAY_500mS:
; Delay = 0.5 seconds
; Clock frequency = 16 MHz
; Actual delay = 0.5 seconds = 2000000 cycles
; Error = 0 %
	BANKSEL	DELAY
	movlw	0x11
	movwf	delay1
	movlw	0x5D
	movwf	delay2
	movlw	0x05
	movwf	delay3
DELAY_500mS_loop
	decfsz	delay1, f
	goto	$+2
	decfsz	delay2, f
	goto	$+2
	decfsz	delay3, f
	goto	DELAY_500mS_loop

			;4 cycles
	goto	$+1
	goto	$+1
DELAY_500mS_END:
    RETURN
;-----------------------------------------------
;******************************************************************************
; END DELAY LIBRARY							      *			          
;******************************************************************************