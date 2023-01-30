PSECT udata_acs
Contador1: DS 1
Contador2: DS 1
  
PSECT code

;Formula para 10us -> T=6+4k -- El valor que nos arroja para los retardos no seran exactos
Retardo_de_10us:	    ;Creamos un retardo de 10uS
    MOVLW   1		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
bucle1:			    ;k*Tcy
    NOP
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle1	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
;Formula para 25us -> T=3k+7
Retardo_de_25us:	    ;Creamos un retardo de 25uS
    MOVLW   6		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
    NOP
bucle2:			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle2	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
;Formula para 50us -> T=4k+6
Retardo_de_50us:	    ;Creamos un retardo de 50uS
    MOVLW   11		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
bucle3:			    ;k*Tcy
    NOP
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle3	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
;Formula para 100us -> T=3k+7
Retardo_de_100us:	    ;Creamos un retardo de 100uS
    MOVLW   31		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
bucle4:			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle4	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
;Formula para 200us -> T=4k+8
Retardo_de_200us:	    ;Creamos un retardo de 200uS
    MOVLW   48		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
    NOP
    NOP
bucle5:			    ;k*Tcy
    NOP
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle5	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
;Formula para 250us -> T=3k+7
Retardo_de_250us:	    ;Creamos un retardo de 250uS
    MOVLW   81		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
    NOP
bucle6:			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle6	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
;Formula para 500us -> T=4k+8
Retardo_de_500us:	    ;Creamos un retardo de 500uS
    MOVLW   123		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
    NOP
    NOP
bucle7:			    ;k*Tcy
    NOP
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle7	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
;Formula para los mS (T=MxNx4uS) 
Retardo_de_1ms:		    ;Creamos un retardo de 1mS
    MOVLW   1		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle8a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249		    ; 1Tcy --- N
    MOVWF   Contador1,0	    ; 1Tcy
bucle8b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle8b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle8a	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
Retardo_de_5ms:		    ;Creamos un retardo de 5mS
    MOVLW   5		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle9a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249            ; 1Tcy
    MOVWF   Contador1,0	    ; 1Tcy
bucle9b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle9b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO    bucle9a
    RETURN		    ; 2Tcy
   
Retardo_de_10ms:	    ;Creamos un retardo de 10mS
    MOVLW   10		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle10a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249		    ; 1Tcy
    MOVWF   Contador1,0	    ; 1Tcy
bucle10b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle10b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle10a	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
Retardo_de_25ms:	    ;Creamos un retardo de 25mS
    MOVLW   25		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle11a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249		    ; 1Tcy
    MOVWF   Contador1,0	    ; 1Tcy
bucle11b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle11b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle11a	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
Retardo_de_50ms:	    ;Creamos un retardo de 50mS
    MOVLW   50		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle12a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249		    ; 1Tcy
    MOVWF   Contador1,0	    ; 1Tcy
bucle12b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle12b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle12a	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
Retardo_de_100ms:	    ;Creamos un retardo de 100mS
    MOVLW   100		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle13a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249		    ; 1Tcy
    MOVWF   Contador1,0	    ; 1Tcy
bucle13b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle13b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle13a	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
Retardo_de_200ms:	    ;Creamos un retardo de 200mS
    MOVLW   200		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle14a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249		    ; 1Tcy
    MOVWF   Contador1,0	    ; 1Tcy
bucle14b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle14b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle14a	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy
Retardo_de_250ms:	    ;Creamos un retardo de 250mS
    MOVLW   250		    ; 1Tcy --- M
    MOVWF   Contador2,0	    ; 1Tcy
bucle15a:		    ; 2Tcy -- Call (el call utiliza 2tcy)
    MOVLW   249		    ; 1Tcy --- M
    MOVWF   Contador1,0	    ; 1Tcy
bucle15b:
    NOP			    ;k*Tcy
    DECFSZ  Contador1,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle15b	    ; (k-1)*2Tcy
    DECFSZ  Contador2,1,0   ;(k-1)+ 3Tcy
    GOTO    bucle15a	    ; (k-1)*2Tcy
    RETURN		    ; 2Tcy


