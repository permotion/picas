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
;    Filename:        main.asm                                                *
;    Date:            18/06/2017                                              *
;    File Version:    1                                                       *
;                                                                             *
;    Author:                                                     *
;    Company:                                                                 *
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


	list		p=12F1822      ; list directive to define processor
	#include	<p12F1822.inc> ; processor specific variable definitions
	#include	<HARDWARE_CFG.inc> ; PIC hardware configuration
	#include	<UART_CFG.inc> ; UART module configuration
	
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

DELAY	EQU 	0X20	; Delays vars
    CBLOCK	DELAY	 
    delay1	; 0X20 delay counter
    delay2	; 0X21 delay counter
    delay3	; 0X22 delay counter
    delay4	; 0X23 delay counter
    ENDC
    
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
    
    CALL UART_INIT
    CALL DELAY_5mS
;------------------------------------------------------------------------------
; PLACE USER PROGRAM HERE
;------------------------------------------------------------------------------
    
    movlw 'A'
    CALL UART_PUTCHAR
    movlw 'B'
    CALL UART_PUTCHAR
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

;******************************************************************************
; UART LIBRARY								      *
; ROUTINES: UART_INIT: Module initialization				      *		      
;	    UART_PUTCHAR: Transmit character (8 bit)			      * 
;	    UART_GETCHAR: Receive character (8 bits)			      *			          
;******************************************************************************  
;-----------------------------------------------
UART_INIT: 
    BANKSEL TXSTA	    ; TRANSMIT STATUS AND CONTROL
    BSF	    TXSTA, BRGH	    ; BRGH = 1, hi-speed SP mode.
    
    ; Setting baud rate
    BANKSEL SPBRG	    ; BAUD RATE GENERATOR			
    ; FOSC/[16 (n+1)]  - n = (FOSC/16/BAUDRATE) - 1
    ; 4800 bauds -->   n = (8.000.000/(16*4800)) - 1 = 103
    #ifdef BAUD_RATE_19200
	#ifdef CLOCK_32MHZ
	    MOVLW   d'103'				   
	#endif
	#ifdef CLOCK_16MHZ
	    MOVLW   d'51'				   
	#endif
	#ifdef CLOCK_8MHZ
	    MOVLW   d'25'				   
	#endif
    #endif

    #ifdef BAUD_RATE_9600
      #ifdef CLOCK_32MHZ
	    MOVLW  d'207'				   
	#endif
	#ifdef CLOCK_16MHZ
	    MOVLW   d'103'				   
	#endif
	#ifdef CLOCK_8MHZ
	    MOVLW   d'51'				   
	#endif
    #endif
                
    #ifdef BAUD_RATE_4800
	#ifdef CLOCK_32MHZ
	    ERROR   "Error - SPADD VALUE TOO BIG FOR THIS BRGH/BRG16 CONFIGURATION"
	#endif
	#ifdef CLOCK_16MHZ
	    MOVLW   d'207'				   
	#endif
	#ifdef CLOCK_8MHZ
	    MOVLW   d'103'				   
	#endif
    #endif            	   
    MOVWF   SPBRG	    ; set Baud Rate Generator        

    ; Setting ping input(Rx) and output(Tx)
    BANKSEL TRISA ; TRI-STATE REGISTER
    BSF	    TRISA, RA5	    ; configured as an input (Rx)
    BCF	    TRISA, RA4	    ; configured as an output (Tx)
    
    BANKSEL APFCON	    ; ALTERNATE PIN FUNCTION CONTROL (select peripheral input and output functions)
    BSF	    APFCON, RXDTSEL ; configure RA5 as Rx (0=RA1 / 1=RA5)
    BSF	    APFCON, TXCKSEL ; configure RA4 as Tx (0=RA0 / 1=RA4)
    
    BANKSEL TXSTA	    ; TRANSMIT STATUS AND CONTROL
    BCF	    TXSTA, SYNC	    ; clear SYNC bit, asynchronous mode (1=Synchronous / 0=Asynchronous)
    BSF	    TXSTA, TXEN	    ; enable transmission
    
    BANKSEL PIE1	    ; PERIPHERAL INTERRUPT ENABLE REGISTER 1
    BCF	    PIE1,  RCIE	    ; disable Receive interrupt
    BCF	    PIE1,  TXIE     ; disable transmit interrupt  

    BANKSEL RCSTA	    ; RECEIVE STATUS AND CONTROL REGISTER
    BSF	    RCSTA, SPEN	    ; set SPEN bit, serial-port enable
    BSF	    RCSTA, CREN	    ; set CREN bit, serial-port receive enable
    
    BANKSEL 0X00
UART_INIT_END:
    RETURN
;-----------------------------------------------
;-----------------------------------------------
UART_PUTCHAR:	; Byte will be copied from W
    BANKSEL TXREG
    MOVWF   TXREG	    ; transmission is initialized
    
    BANKSEL PIR1	    ;PERIPHERAL INTERRUPT REQUEST REGISTER 1
WAITCHAR1		    ;PIR1:  PSPIF   ADIF  RCIF  "TXIF"  SSPIF   CCP1IF   TMR2IF   TMR1IF  
    BTFSS   PIR1,TXIF	    ;TXIF: Transmit Interrupt Flag bit:  1=buffer is empty  0=buffer is full             
    GOTO    WAITCHAR1   
    BANKSEL 0X00	
UART_PUTCHAR_END:
    RETURN
;-----------------------------------------------
;-----------------------------------------------
UART_GETCHAR:	; Byte will be copied to W
WAITCHAR2  
    BANKSEL PIR1
    BTFSS   PIR1,RCIF      ;PIR1:  PSPIF   ADIF "RCIF"  TXIF   SSPIF   CCP1IF   TMR2IF   TMR1IF              
    GOTO    WAITCHAR2      ;RCIF: Receive Interrupt Flag bit:  1= receive buffer is full  0= receive buffer is empty
    BANKSEL RCREG
    MOVFW   RCREG          ; move byte to W
    BANKSEL 0X00
UART_GETCHAR_END:
    RETURN
;******************************************************************************
; END UART LIBRARY							      *			          
;******************************************************************************  
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
    END


