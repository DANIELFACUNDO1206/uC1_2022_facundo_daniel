;-----------------------------------------------------------------------
 ;P1-Corrimiento_de_Leds.s
 ;Facundo Peña Daniel Jose
 ;Tarjeta: Curiosity Nano PIC18f57q84
 ;Este programa permitira motrar los valores alfanumericos (0-9)y(A-F) en un display anodo comun.
 ;15/01/2023
 ;-----------------------------------------------------------------------
PROCESSOR 18F57Q84
#include "bits_config.inc"   /*config statements should precede project file includes.*/
#include <xc.inc>
#include "Retardos.inc"
PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
Main:
    CALL Config_OSC,1
    CALL Config_Port,1
    
Bucle_boton:	    ;Bucle para el conteo con boton que al presionar me cuente desde A a F
    BTFSS   PORTA,3,0
    GOTO    Letra_A
    
;Conteo de numeros decimales del 0 al 9
    
Numero_0:		
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   00000011B		;Cargo el valor al acumulador (W) en binario para que me muestre un 0
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_1
    GOTO    Numero_1		;Salta a Numero_1
    GOTO    Letra_A		;Salta a la Letra_A
Numero_1:   
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   10011111B		;Cargo el valor al acumulador (W) en binario para que me muestre un 1
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_2
    GOTO    Numero_2		;Salta a Numero_2
    GOTO    Letra_A		;Salta a la Letra_A
Numero_2:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   00100101B		;Cargo el valor al acumulador (W) en binario para que me muestre un 2
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_3
    GOTO    Numero_3		;Salta a Numero_3
    GOTO    Letra_A		;Salta a la Letra_A
Numero_3:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   00001101B		;Cargo el valor al acumulador (W) en binario para que me muestre un 3
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_4
    GOTO    Numero_4		;Salta a Numero_4
    GOTO    Letra_A		;Salta a la Letra_A
Numero_4:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   10011001B		;Cargo el valor al acumulador (W) en binario para que me muestre un 4
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_5
    GOTO    Numero_5		;Salta a Numero_5
    GOTO    Letra_A		;Salta a la Letra_A
Numero_5:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   01001001B		;Cargo el valor al acumulador (W) en binario para que me muestre un 5
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_6
    GOTO    Numero_6		;Salta a Numero_6
    GOTO    Letra_A		;Salta a la Letra_A
Numero_6:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   01000001B		;Cargo el valor al acumulador (W) en binario para que me muestre un 6
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_7
    GOTO    Numero_7		;Salta a Numero_7
    GOTO    Letra_A		;Salta a la Letra_A
Numero_7:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   00011111B		;Cargo el valor al acumulador (W) en binario para que me muestre un 7
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_8
    GOTO    Numero_8		;Salta a Numero_8
    GOTO    Letra_A		;Salta a la Letra_A
Numero_8:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   00000001B		;Cargo el valor al acumulador (W) en binario para que me muestre un 8
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_9
    GOTO    Numero_9		;Salta a Numero_9
    GOTO    Letra_A		;Salta a la Letra_A
Numero_9:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   00011001B		;Cargo el valor al acumulador (W) en binario para que me muestre un 0
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSC   PORTA,3,0		;Si es 0 salta la siguiente instruccion y sino, salta al goto Numero_0
    GOTO    Numero_0		;Salta a Numero_0
    GOTO    Letra_A		;Salta a la Letra_A
    
;Conteo de Letras de A al F  
    
Letra_A:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   00010001B		;Cargo el valor al acumulador (W) en binario para que me muestre un A
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSS   PORTA,3,0		;Si es 1 salta la siguiente instruccion y sino, salta al goto Letra_B
    GOTO    Letra_B		;Salta a la Letra_B
    GOTO    Numero_0		;Salta al Numero_0
Letra_B:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   11000001B		;Cargo el valor al acumulador (W) en binario para que me muestre un B
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSS   PORTA,3,0		;Si es 1 salta la siguiente instruccion y sino, salta al goto Letra_C
    GOTO    Letra_C		;Salta a la Letra_C
    GOTO    Numero_0		;Salta al Numero_0
Letra_C:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   01100011B		;Cargo el valor al acumulador (W) en binario para que me muestre un C
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSS   PORTA,3,0		;Si es 1 salta la siguiente instruccion y sino, salta al goto Letra_D
    GOTO    Letra_D		;Salta a la Letra_D
    GOTO    Numero_0		;Salta al Numero_0
Letra_D:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   10000101B		;Cargo el valor al acumulador (W) en binario para que me muestre un D
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSS   PORTA,3,0		;Si es 1 salta la siguiente instruccion y sino, salta al goto Letra_E
    GOTO    Letra_E		;Salta a la Letra_E
    GOTO    Numero_0		;Salta al Numero_0
Letra_E:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   01100001B		;Cargo el valor al acumulador (W) en binario para que me muestre un E
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSS   PORTA,3,0		;Si es 1 salta la siguiente instruccion y sino, salta al goto Letra_F
    GOTO    Letra_F		;Salta a la Letra_F
    GOTO    Numero_0		;Salta al Numero_0   
Letra_F:
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    MOVLW   01110001B		;Cargo el valor al acumulador (W) en binario para que me muestre un F
    MOVWF   LATD,1		;Muevo del acumulador al registro LATD
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BTFSS   PORTA,3,0		;Si es 1 salta la siguiente instruccion y sino, salta al goto Letra_A
    GOTO    Letra_A		;Salta a la Letra_B
    GOTO    Numero_0		;Salta al Numero_0
    

;Configuracion de Puertos y Oscilador:
    
Config_OSC:		;Configuramos el oscilador interno a una frecuencia de 4MHz
    BANKSEL OSCCON1
    MOVLW   0x60	;seleccionamos el bloque del oscilador interno con un div:1
    MOVWF   OSCCON1,1	;Se carga el valor al Osciloscopio
    MOVLW   0x02	;Seleccionamos la frecuenta del Oscilador(4MHz)
    MOVWF   OSCFRQ,1	
    RETURN
    
Config_Port:		;Hacemos la configuracion de puertos 
   
    BANKSEL PORTD	;port,lat,ansel y tris se encuentran en un mismo banco
    CLRF    PORTD,1	;Mostrara los LEDS Encendidos = ON
    SETF    LATD,1	;Estado inicial de LEDS = OFF
    CLRF    ANSELD,1	;Se usara como: digital
    CLRF    TRISD,1	;Nuestro puerto se usara como: salida
    
    ;Configuracion para el boton RA3:
    BANKSEL PORTA
    CLRF    PORTA,1	;Ya no se escribira nada asi que el LAT ya no se pondra
    CLRF    ANSELA,1	;Puerto A es digital
    BSF	    TRISA,3,1	;Configuramos el boton como entrada 
    BSF	    WPUA,3,1	;Activamos la resistencia Pull Up del pin RA3
    RETURN
        
    
    
    
    
END resetVect