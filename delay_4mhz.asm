;******************************************************************************
; DELAY 4MHZ LIBRARY							      *
; ROUTINES: DELAY_5mS: 5 milliseconds delay				      *
;									      *
; Based on http://www.piclist.com/techref/piclist/codegen/delay.htm	      *
;******************************************************************************  
;-----------------------------------------------    
; Delay = 0.5 seconds = 500000 cycles
; Clock frequency = 4 MHz
; Based on http://www.piclist.com/techref/piclist/codegen/delay.htm
DELAY_500mS:
	movlw	0x03
	movwf	delay1
	movlw	0x18
	movwf	delay2
	movlw	0x02
	movwf	delay3
DELAY_500mS_loop_0
	decfsz	delay1, f
	goto	$+2
	decfsz	delay2, f
	goto	$+2
	decfsz	delay3, f
	goto	DELAY_500mS_loop_0
			;6 cycles
	goto	$+1
	goto	$+1
	goto	$+1
DELAY_500mS_END: 
    RETURN
;-----------------------------------------------
;******************************************************************************
; END DELAY LIBRARY							      *			          
;******************************************************************************