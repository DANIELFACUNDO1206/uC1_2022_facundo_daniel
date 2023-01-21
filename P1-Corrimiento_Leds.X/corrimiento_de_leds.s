;-----------------------------------------------------------------------
 ;P1-Corrimiento_de_Leds.s
 ;Facundo Peña Daniel Jose
 ;Tarjeta: Curiosity Nano PIC18f57q84
 ;Corrimiento de leds conectados al puerto C,con retardos de 500ms para pares y 250 para impares
 ;15/01/2023
 ;-----------------------------------------------------------------------
Processor 18F57Q84
#include "bits_config.inc"  // config statements should precede project file includes.
#include <xc.inc>
#include "Retardos.inc"
PSECT resetvect,class=CODE,reloc=2
resetvect:
    GOTO Main
PSECT CODE
Main:
    CALL config_osc,1	    ;El call me llevara a la configuracion del oscilador
    CALL config_port,1	    ;El call me llevara a la configuracion de los puertos
Inicio:			    ;Inicio de mi corrimiento
    BTFSC PORTA,3,0	    ;PORTA = 0, si es 0 salta la siguiente instruccion y sino salta al goto
    GOTO Inicio		    ;El goto me va a mandar al inicio otra vez
    
;CORRIMIENTO IMPAR ---> de 250 ms
    
Led_uno:	    ; Corrimiento del Led_uno
    MOVLW 00000000B	    ;Voy a cargar mi W para que todos inicien en 0
    MOVWF LATE,1	    ;Muevo del acumulador al registro LATE
    MOVLW 00000001B	    ;Cargo el W para que mi led del impar encienda
    MOVWF LATE,1	    ;Muevo del acumulador al registro LATE
    CLRF LATC,1		    ; Puerto C igual a 0
    MOVLW 00000001B	    ;Cargo el valor al acumulador haciendo que mi led 1 se prenda
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms   
    BTFSC PORTA,3,0	    ;PORTA = 0, si es 0 salta la siguiente instruccion y sino, salta al goto Led_dos
    GOTO Led_dos	    ;El goto me va a mandar al Led_dos
Parada_1:		    ;Cuando presiono el boton el programa se aplantara en el ultimo led, en este caso el Led_uno
    CALL Retardo_de_250ms   
    CALL Retardo_de_250ms   
    BTFSC PORTA,3,0	    ;PORTA = 0, si es 0 salta la siguiente instruccion y sino, salta al goto Parada_1
    GOTO Parada_1	    ;Este goto me llevara de nuevo a la Parada_1
    GOTO    Led_dos	    ;Me mandara a la etiqueta Led_dos
Led_dos:	    ; Corrimiento del Led_dos
    MOVLW 00000010B	    ;Cargo el valor al acumulador haciendo que mi led 2 se prenda y el anterior se apague
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_tres
    GOTO Led_tres	    ;Salto al Led_tres
Parada_2:	
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_2
    GOTO Parada_2	    ;Salto a la Parada_2
    GOTO    Led_tres	    ;Salto al Led_tres
Led_tres:	    ; Corrimiento del Led_tres   
    MOVLW 00000100B	    ;Cargo el valor al acumulador haciendo que mi led 3 se prenda y el anterior se apague
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_cuatro
    GOTO Led_cuatro	    ;Salto al Led_cuatro
Parada_3:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_3
    GOTO Parada_3	    ;Salto a la Parada_3
    GOTO Led_cuatro	    ;Salto al Led_cuatro
Led_cuatro:	    ; Corrimiento del Led_cuatro
    MOVLW 00001000B	    ;Cargo el valor al acumulador haciendo que mi led 4 se prenda y el anterior se apague
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_cinco
    GOTO Led_cinco	    ;Salto al Led_cinco
Parada_4:
   CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_4
    GOTO Parada_4	    ;Salto a la Parada_4
    GOTO Led_cinco	    ;Salto al Led_cinco
Led_cinco:	    ; Corrimiento del Led_cinco
    MOVLW 00010000B	    ;Cargo el valor al acumulador haciendo que mi led 5 se prenda y el anterior se apague
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms   
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_seis
    GOTO Led_seis	    ;Salto al Led_seis
Parada_5:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_5
    GOTO Parada_5	    ;Salto a la Parada_5
    GOTO Led_seis	    ;Salto al Led_seis
Led_seis:	    ; Corrimiento del Led_seis
    MOVLW 00100000B	    ;Cargo el valor al acumulador haciendo que mi led 6 se prenda y el anterior se apague
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_siete
    GOTO Led_siete	    ;Salto al Led_siete
Parada_6:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_6
    GOTO Parada_6	    ;Salto a la Parada_6
    GOTO Led_siete	    ;Salto al Led_siete
Led_siete:	    ; Corrimiento del Led_siete
    MOVLW 01000000B	    ;Cargo el valor al acumulador haciendo que mi led 7 se prenda y el anterior se apague
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms   
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_ocho
    GOTO Led_ocho	    ;Salto al Led_ocho
Parada_7:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_7
    GOTO Parada_7	    ;Salto a la Parada_7
    GOTO Led_ocho	    ;Salto al Led_ocho
Led_ocho:	    ; Corrimiento del Led_ocho
    MOVLW 10000000B	    ;Cargo el valor al acumulador haciendo que mi led 8 se prenda y el anterior se apague
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_par_1 
    GOTO Led_par_1	    ;Salto al Led_par_1
Parada_8:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_8
    GOTO Parada_8	    ;Salto a la Parada_8
    GOTO Led_par_1	    ;Salto al Led_par_1
    
    

;CORRIMIENTO PAR  ---> de 500 ms   
    
Led_par_1:			
    MOVLW 00000000B	    ;Apagare mi led Impar para posteriormente encender el Par
    MOVWF LATE,1	    ;Muevo del acumulador al registro LATE
    MOVLW 00000010B	    ;Cargo al acumulador para que me encienda mi led Par
    MOVWF LATE,1	    ;Muevo del acumulador al registro LATE
    CALL Retardo_de_250ms
    CLRF LATC,1		    ; Puerto C igual a 0
    MOVLW 00000001B	    ; Cargo el valor al acumulador haciendo que mi led par 1 se prenda 
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_par_2
    GOTO Led_par_2	    ;Salta a Led_par_2
Parada_1L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Parada_1L
    GOTO Parada_1L	    ;Salto a la Parada_1L
    GOTO Led_par_2	    ;Salto al Led_par_2
Led_par_2:   
    CALL Retardo_de_250ms
    MOVLW 00000010B	    ; Cargo el valor al acumulador haciendo que mi led par 2 se prenda 
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_par_3 
    GOTO Led_par_3	    ;Salto al Led_par_3
Parada_2L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Parada_2L
    GOTO Parada_2L	    ;Salto a la Parada_2L
    GOTO Led_par_3	    ;Salto al Led_par_3
Led_par_3:
    CALL Retardo_de_250ms
    MOVLW 00000100B	    ; Cargo el valor al acumulador haciendo que mi led par 3 se prenda 
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_par_4
    GOTO Led_par_4	    ;Salto al Led_par_4
Parada_3L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Parada_3L
    GOTO Parada_3L	    ;Salto a la Parada_3L
    GOTO Led_par_4	    ;Salto al Led_par_4
Led_par_4:
    CALL Retardo_de_250ms
    MOVLW 00001000B	    ; Cargo el valor al acumulador haciendo que mi led par 4 se prenda 
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Led_par_5
    GOTO Led_par_5	    ;Salto al Led_par_5
Parada_4L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Led_par_5
    GOTO Parada_4L	    ;Salto a la Parada_4L
    GOTO Led_par_5	    ;Salto al Led_par_5
Led_par_5:
    CALL Retardo_de_250ms
    MOVLW 00010000B	    ; Cargo el valor al acumulador haciendo que mi led par 5 se prenda
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Led_par_6
    GOTO Led_par_6	    ;Salto al Led_par_5
Parada_5L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_5L
    GOTO Parada_5L	    ;Salto a la Parada_5L
    GOTO Led_par_6	    ;Salto al Led_par_6
Led_par_6:
    CALL Retardo_de_250ms
    MOVLW 00100000B	    ; Cargo el valor al acumulador haciendo que mi led par 6 se prenda
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Led_par_7
    GOTO Led_par_7	    ;Salto al Led_par_7
Parada_6L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_6L
    GOTO Parada_6L	    ;Salto a la Parada_6L
    GOTO Led_par_7	    ;Salto al Led_par_7
Led_par_7:
    CALL Retardo_de_250ms
    MOVLW 01000000B	    ; Cargo el valor al acumulador haciendo que mi led par 7 se prenda
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Led_par_8
    GOTO Led_par_8	    ;Salto al Led_par_8
Parada_7L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_7L
    GOTO Parada_7L	    ;Salto a la Parada_7L
    GOTO Led_par_8	    ;Salto al Led_par_8
Led_par_8:
    CALL Retardo_de_250ms
    MOVLW 10000000B	    ; Cargo el valor al acumulador haciendo que mi led par 8 se prenda
    MOVWF LATC,1	    ;Muevo del acumulador al registro LATC
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta a la Led_uno
    GOTO Led_uno	    ;Salto al Led_uno
Parada_8L:
    CALL Retardo_de_250ms
    CALL Retardo_de_250ms
    BTFSC PORTA,3,0	    ;Si es 0 salta la siguiente instruccion y sino, salta al goto Parada_8L
    GOTO Parada_8L	    ;Salto a la Parada_8L
    GOTO Led_uno	    ;Salto al Led_uno
    
    
;va en el orden de :PORT-LAT-ANSEL-TRIS

;Configuracion de Puertos y Oscilador:
config_osc:
    BANKSEL OSCCON1
    MOVLW 0X60h	    ;SELECIONAMOS EL BLOQUE DEL OSCILADOR INTERNO CON UN DIV:1
    MOVWF OSCCON1,1 ;Se carga el valor al Osciloscopio
    MOVLW 0x02h	    ;Seleccionamos una frecuencia de 4MHZ
    MOVWF OSCFRQ,1
    RETURN
config_port:	    ;Hacemos la configuracion de puertos 
    BANKSEL PORTC   ;Port,Lat,Ansel y Tris se encuentran en un mismo banco
    CLRF PORTC,1    ; PORTF=0
    CLRF LATC,1	    ; Borro los datos del registro LATC
    CLRF ANSELC,1   ; PORTF =digital 
    CLRF TRISC,1    ; como salida
    
    BANKSEL PORTE   
    SETF PORTE,1    ; PORTF=1
    CLRF LATE,1	    ; LATE = 0
    CLRF ANSELE,1   ; PORTF = digital 
    CLRF TRISE,1    ; como salida
;configurando boton 
    BANKSEL PORTA	
    SETF PORTA,1     ;Estado apagado
    CLRF ANSELA,1    ;PORTA = digital 
    BSF TRISA,3,1    ;RA3 = como entrada
    BSF WPUA,3,1     ;Activamos el pull up para el RA3
    RETURN

END resetvect 


