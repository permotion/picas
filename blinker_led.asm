;******************************************************************************
;   This file is a basic code template for code generation on the             *
;   PIC12F1822. This file contains the basic code building blocks to build    *
;   upon.                                                                     *
;                                                                             *
;   Refer to the MPASM User's Guide for additional information on             *
;   features of the assembler.                                                *
;                                                                             *
;   Refer to the respective data sheet for additional                         *
;   information on the instruction set.                                       *
;                                                                             *
;******************************************************************************
;                                                                             *
;    Filename:      main.asm                                                  *
;    Date:          18/06/2017                                                *
;    File Version:  1                                                         *
;                                                                             *
;    Author:        permotion	                                              *
;    Company:       PICAS                                                     *
;                                                                             *
;                                                                             *
;******************************************************************************
;                                                                             *
;    Files Required: P12F1822.INC                                             *
;                                                                             *
;******************************************************************************
;                                                                             *
;    Notes:                                                                   *
;                                                                             *
;******************************************************************************
;                                                                             *
;    Revision History:                                                        *
;                                                                             *
;******************************************************************************


	list		p=12F1822	    ; list directive to define processor
	#include	<p12F1822.inc>	    ; processor specific variable definitions
	#include	<HARDWARE_CFG.inc>  ; hardware definitions
	
	#ifdef	CLOCK_32MHZ 
	    #define FREQ_CLOCK  d'32000000'
	#endif
	#ifdef	CLOCK_16MHZ
	    #define FREQ_CLOCK  d'16000000'
	#endif
	#ifdef	CLOCK_8MHZ
	    #define FREQ_CLOCK  d'8000000'
	#endif
	#ifdef	CLOCK_4MHZ
	    #define FREQ_CLOCK  d'4000000' 
	#endif
;------------------------------------------------------------------------------
;
; CONFIGURATION WORD SETUP
;
; The 'CONFIG' directive is used to embed the configuration word within the 
; .asm file. The lables following the directive are located in the respective 
; .inc file.  See the data sheet for additional information on configuration 
; word settings.
;
;------------------------------------------------------------------------------    

    __CONFIG _CONFIG1, _FOSC_INTOSC & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_OFF & _CLKOUTEN_OFF & _IESO_OFF & _FCMEN_OFF
    __CONFIG _CONFIG2, _WRT_OFF & _PLLEN_OFF & _STVREN_OFF & _BORV_19 & _LVP_OFF

;------------------------------------------------------------------------------
; VARIABLE DEFINITIONS
;
; Available Data Memory divided into Bank 0-15.  Each Bank may contain 
; Special Function Registers, General Purpose Registers, and Access RAM 
;
;------------------------------------------------------------------------------

delay1        EQU    0x7D        ; Sample user registers (common RAM)
delay2        EQU    0x7E        ; 
delay3        EQU    0x7F        ; 

;------------------------------------------------------------------------------
; EEPROM INITIALIZATION
;
; The 12F1822 has 256 bytes of non-volatile EEPROM, starting at address 0xF000
; 
;------------------------------------------------------------------------------

DATAEE    ORG  0xF000
    DE    "MCHP"  ; Place 'M' 'C' 'H' 'P' at address 0,1,2,3

;------------------------------------------------------------------------------
; RESET VECTOR
;------------------------------------------------------------------------------

    ORG     0x0000            ; processor reset vector
    CALL    SETUP	      ; program configuration routine
    GOTO    START             ; When using debug header, first inst.
                              ; may be passed over by ICD2.  

;------------------------------------------------------------------------------
; INTERRUPT SERVICE ROUTINE
;------------------------------------------------------------------------------

    ORG      0x0004

;------------------------------------------------------------------------------
; USER INTERRUPT SERVICE ROUTINE GOES HERE
;------------------------------------------------------------------------------

; Note the 12F1822 family automatically handles context restoration for 
; W, STATUS, BSR, FSR, and PCLATH where previous templates for 16F families
; required manual restoration.  Shadow registers store these SFR values, and
; shadow registers may be modified since they are readable and writable for
; modification to the context restoration.    

    RETFIE                    ; return from interrupt
    
;------------------------------------------------------------------------------
; MAIN PROGRAM
;------------------------------------------------------------------------------

START

;------------------------------------------------------------------------------
; PLACE USER PROGRAM HERE
;------------------------------------------------------------------------------
    
    BANKSEL PORTA
BLINKER_LOOP    
    BSF	    PORTA, RA5 ; green led
    BSF	    PORTA, RA4 ; yellow led
    BSF	    PORTA, RA2 ; blue led & buzzer
    CALL    DELAY_500mS
    BCF	    PORTA, RA5
    BCF	    PORTA, RA4
    BCF	    PORTA, RA2
    CALL    DELAY_500mS
    
    GOTO BLINKER_LOOP
    
    GOTO $
    
;-----------------------------------------------
SETUP:
    BANKSEL OSCCON ; OSCILLATOR CONTROL REGISTER
    #if (FREQ_CLOCK == d'32000000') ;1110
    MOVLW   B'01110000'
    #endif 
    #if (FREQ_CLOCK == d'16000000') ;1111
    MOVLW   B'01111000'
    #endif
    #if (FREQ_CLOCK == d'8000000') ;1110
    MOVLW   B'01110000'
    #endif
    #if (FREQ_CLOCK == d'4000000') ;1101
    MOVLW   B'01101000'
    #endif
    MOVWF   OSCCON
    
    ;INITIALIZING PORTA
    BANKSEL PORTA
    CLRF PORTA
    BANKSEL ANSELA ; ANALOG SELECT (PORT A)
    CLRF    ANSELA ; configure all RAx as digital I/O
    BANKSEL TRISA ; TRI-STATE REGISTER
    CLRF    TRISA ; configure all RAx as a digital output
    
SETUP_END:
    RETURN
;-----------------------------------------------
    
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
    
    END





