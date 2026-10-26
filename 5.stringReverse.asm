
CODE SEGMENT
    START: 
        MOV CX, 0; 
    INPUT:
         MOV AH, 1H
         INT 21H
         
         CMP AL, 0DH
         JE REVERSE
         
         PUSH AX
         INC CX
         JMP INPUT 
         
    REVERSE:
        CMP CX, 0
        JE EXIT  
        
        ; new line and cert
        MOV DL, 0DH
        MOV AH, 02H
        INT 21H
        
        MOV DL, 0AH
        MOV AH, 02H
        INT 21H 
         
    PRINT:
        
        POP DX 
        MOV AH, 2H
        INT 21H
        LOOP PRINT 
        
    EXIT:
        MOV AH, 4CH
        INT 21H

CODE ENDS
END START