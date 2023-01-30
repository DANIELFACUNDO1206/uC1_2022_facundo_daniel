
PROCESSOR 18F57Q84
#include "Bit_config.inc"   //config statements should precede project file includes.//
#include <xc.inc>
#include "Retardos.inc"
;-----------------------------------------------------------------------
 ;Examen_parcial_2.s
 ;@AUTOR: Facundo Peña Daniel Jose
 ;Tarjeta: Curiosity Nano PIC18f57q84
 ;Funcion: Inicia prendiendo y apagando el led de la placa,si presiono el boton del pic hace la secuencia pedida, 
 ;La secuencia se detiene cuando se presione otro pulsador externo conectado en el pin RB4 o hasta que el número de
 ;repeticiones sea. El retardo entre el encendido y apagado de los leds será de 250 ms.
 ;Otro pulsador externo conectado al RF2 reinicia toda la secuencia y apaga los leds.
 ;Mientras no se active ninguna interrupción, el programa principal, realice un toggle del led de la placa cada 500 ms.
 ;@DATE: 30/01/2023
 ;@grupo: 06
 ;-----------------------------------------------------------------------
    
    
PSECT udata_acs		    ;PSECT que indica que utilizare la parte de memoria de Access RAM
;Guarda (DS) un byte en Accsess RAM
counter:	DS	1	    
parada1_int1:	DS	1
Evidenciar_led:	DS	1
Reinicio2_int2:	DS	1
repetir_5:	DS	1
offset:		DS	1	    

    
PSECT resetVect,class=CODE,reloc=2  
resetVect:
    GOTO Main  

    
;-  -  -  -  -  -  -  -   
;Prioridad baja -->  codigo de INT0 
PSECT ISRVectlowpriority,class=CODE,reloc=2    
ISRVectlowpriority:
    MOVLW   0x00		;Voy a cargar mi W con 0, el 0 sirve para que salte y continue
    MOVWF   parada1_int1,0	;Muevo del acumulador a parada1_int1
    MOVWF   Reinicio2_int2,0	;Muevo del acumulador a Reinicio2_int2 
    MOVLW   0x05		;Voy a cargar mi W con 5, para que se repita 5 veces la secuencia de leds
    MOVWF   repetir_5,0		;Muevo del acumulador a repetir_5
    BTFSS   PIR1,0,0		;Consulta si se produce la INT0
    GOTO    Exit		;Me mandara a la etiqueta Exit
    GOTO    recargar		;Me mandara a la etiqueta recargar
Exit:    
    RETFIE			;Retorno de interrupcion
     
;Alta prioridad    -->   Codigo INT1, INT2 
PSECT ISRVecthighpriority,class=CODE,reloc=2  
ISRVecthighpriority:
    BTFSC   PIR6,0,0		;Consultara si se produce la INT1
    GOTO    Pausar_leds		;Me mandara a la etiqueta Detener_leds
Off_leds:
    BTFSC   PIR10,0,0		;Consultara si se produce la INT2
    BCF	    PIR10,0,0		;Limpiaremos el flag de INT2
    CLRF    LATC,1		;Puerto C igual a 0
    SETF    Reinicio2_int2,0	;El contenido del registro Reinicio2_int2 es puesto a uno.
Salida_Int:
    RETFIE			;Retorno de interrupcion

;-  -  -  -  -  -  -  - 
PSECT CODE  
Main:
    CAll    Config_OSC,1	;El call me llevara a la configuracion del oscilador
    CALL    Config_PORT,1	;El call me llevara a la configuracion de puertos
    CALL    Config_PPS,1	;El call me llevara a la configuracion de PPS
    CALL    Config_INTX,1	;El call me llevara a la configuracion de INTX

Led_del_PIC:
    ;Programa principal
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BSF	    LATF,3,0		;Apagamos el led de la placa
    CALL    Retardo_de_250ms
    CALL    Retardo_de_250ms
    BCF	    LATF,3,0		;Encendemos el led de la placa
    GOTO    Led_del_PIC		;Me mandara a la etiqueta Led_del_PIC y asi se hara un bucle	

;-  -  -  -  -  -  -  -
    
recargar:
    BCF	    PIR1,0,0	    ;Se limpia el flag
    MOVLW   0x0A	    ;Definimos el counter
    MOVWF   counter,0	    ;El numero de offset -> es 0 counter=10
    MOVLW   0x00	    ;Voy a cargar mi W con 0
    MOVWF   offset,0	    ;El valor inicial del offset es cero
    GOTO    Bucle	    ;Me mandara a la etiqueta Bucle
    
Bucle:   
    ;Configuracion de la tabla
    
    BANKSEL PCLATU
    MOVLW   low highword(Tabla_leds) 
    MOVWF   PCLATU,1		     ;Mueve del acumulador al registro PCLATU 
    MOVLW   high(Tabla_leds)	     
    MOVWF   PCLATH,1		     ;Mueve del acumulador al registro PCLATU 	
    RLNCF   offset,0,0		     ;Se multiplica el contenido del offset x2
    CALL    Tabla_leds		     ;Me hara un salto a Tabla_leds
    BTFSC   Reinicio2_int2,1,0	     
    GOTO    Exit		     
    BTFSC   parada1_int1,1,0	     ;Me mandara a la etiqueta goto Exit cuando parada1_int1 finaliza la INT0
    GOTO    Exit		     ;Lleva a Exit cuando parada1_int finaliza la INT0
    MOVWF   LATC,0		     ;Cargo los valores de la tabla a todo mi puerto C
    MOVWF   Evidenciar_led,0
    CALL    Retardo_de_250ms
    DECFSZ  counter,1,0		     ;(conunter)-1=0, saltara la siguiente instruccion 
    GOTO    Inc_offset
    GOTO    Sequence_5

Sequence_5:
    DECFSZ  repetir_5,1,0    ;(f)-1=(d). Si el resultado después de decrementar (d)  es cero, entonces salta una instrucción
    GOTO    recargar	     ;Me mandara a la etiqueta recargar
    GOTO    Exit	     ;Me mandara a la etiqueta Exit
    
Inc_offset:
    INCF    offset,1,0	     ;(offset)+1
    GOTO    Bucle	     ;Me mandara a la etiqueta Bucle

   
Tabla_leds:
    
    ;Tabla para corrimiento de los leds
    
    ADDWF   PCL,1,0	    ;El contenido del acumulador (w) + PCL  = (offset) + PCL(contador de programa)
    RETLW   10000001B	    ;offset: 0
    RETLW   01000010B	    ;offset: 1
    RETLW   00100100B	    ;offset: 2
    RETLW   00011000B	    ;offset: 3
    RETLW   00000000B	    ;offset: 4
    RETLW   00011000B	    ;offset: 5
    RETLW   00100100B	    ;offset: 6
    RETLW   01000010B	    ;offset: 7
    RETLW   10000001B	    ;offset: 8
    RETLW   00000000B	    ;offset: 9
    RETURN  
    
;-  -  -  -  -  -  -  -
    
Pausar_leds:
    
    BCF	    PIR6,0,0		;Limpiaremos el falg en INT1
    MOVF    Evidenciar_led,0,0	;(f)--->(w)
    MOVWF   LATC,1		;Muevo del acumulador al registro LATC
    SETF    parada1_int1,0	;El contenido de parada1_int1 es puesto a uno
    GOTO    Salida_Int		;Me mandara a la etiqueta Salida_Int


    
     
;-  -  -  -  -  -  -  - 
;CONFIGURACION DE SUBRUTINAS
Config_OSC:
    BANKSEL OSCCON1
    MOVLW   0x60		;SELECIONAMOS EL BLOQUE DEL OSCILADOR INTERNO CON UN DIV:1
    MOVWF   OSCCON1,1		;Se carga el valor al Osciloscopio
    MOVLW   0x02		;Seleccionamos una frecuencia de 4MHZ
    MOVWF   OSCFRQ,1
    RETURN
    
Config_PORT:
    ;Configuracion de led del pic
    BANKSEL PORTF	
    BCF	    PORTF,3,1
    BSF	    LATF,3,1
    CLRF    ANSELF,1 
    BCF	    TRISF,3,1
    
    ;Configuracion de button RF2
    BCF	    PORTF,2,1
    BSF	    TRISF,2,1
    BSF	    WPUF,2,1

    ;Configuracion de button RB4
    BANKSEL PORTB
    BCF    PORTB,4,1
    BCF    ANSELB,4,1
    BSF     TRISB,4,1     ; Puerto Entrada 
    BSF	    WPUB,4,1
    
    ;Configuracion de button del uC
    BANKSEL PORTA	
    BCF	    PORTA,3,1
    CLRF    ANSELA,1 
    BSF	    TRISA,3,1
    BSF	    WPUA,3,1
    
    ;Configuracion del puerto C
    BANKSEL PORTC	
    SETF    PORTC,1
    CLRF    LATC,1
    CLRF    ANSELC,1
    CLRF    TRISC,1
    RETURN
       
Config_PPS:
    BANKSEL INT0PPS
    MOVLW   0x03
    MOVWF   INT0PPS,1	;INT0 --> RA3
    
    BANKSEL INT1PPS
    MOVLW   0x0C
    MOVWF   INT1PPS,1	;INT1 --> RB4
    
    BANKSEL INT2PPS
    MOVLW   0x2A
    MOVWF   INT2PPS,1	;INT2 --> RF2
    RETURN
    
    
Config_INTX:
;    Paso a paso para configurar interrupcion:
;    1. Definiremos prioridades
;    2. Configuramos interrupciones
;    3. Limpiamos el flag
;    4. Habilitamos la interrupcion
;    5. Finalmente Habilitar las interrupciones globales
    
    BSF	    INTCON0,5,0 ;Este habilita prioridades
    BANKSEL IPR1
    BCF	    IPR1,0,1    ; INT0 de baja prioridad
    BSF	    IPR6,0,1    ; INT1 de alta prioridad
    BSF	    IPR10,0,1   ; INT2 de alta prioridad
    
   ;Config. INT0
    BCF	INTCON0,0,0 ; INT0 por flanco de bajada
    BCF	PIR1,0,0    ; Limpiamos el flag de interrupcion INT0
    BSF	PIE1,0,0    ; Se habilita la interrupcion ext0
    
    
   ;Config. INT1
    BCF	INTCON0,1,0 ; INTCON0<INT1EDG> = 0 --> INT0 por flanco de bajada
    BCF	PIR6,0,0    ; PIR6<INT1IF> = 0 -- limpiamos el flag de interrupcion
    BSF	PIE6,0,0    ; Se habilita la interrupcion ext1
   
   
   
   ;Config. INT2
    BCF	INTCON0,2,0 ; INT0 por flanco de bajada
    BCF	PIR10,0,0    ; Limpiaremos el flag de interrupcion
    BSF	PIE10,0,0    ; Se habilita la interrupcion ext2
    
   ;Config. GLOBAL
    BSF	INTCON0,7,0 ; Se habilitan las interrupciones de forma global
    BSF	INTCON0,6,0 ; Se habilitan las interrupciones de baja prioridad
    RETURN
    


    
END resetVect



