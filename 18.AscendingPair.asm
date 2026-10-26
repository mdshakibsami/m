CODE SEGMENT
   START:
        MOV AH, 1H
        INT 21H
        MOV BL, AL
        
        MOV AH, 1H
        INT 21H
        MOV BH, AL  
        
        ; logic
        CMP BL,BH
        JBE PRINT   ; Jump below or equal
        
        XCHG BL,BH
        
    PRINT:
        MOV DL, BL
        MOV AH, 2H
        INT 21H
        
        MOV DL,BH
        MOV AH, 2H
        INT 21H
        
        MOV AH, 4CH
        INT 21H

CODE ENDS
END START