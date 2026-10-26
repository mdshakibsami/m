DATA SEGMENT
    PROMPT DB "ENTER A CHARACTER: $"
    RESULT DB 0AH, 0DH, "RESULT : $"
DATA ENDS

CODE SEGMENT
    START:
        MOV AX, DATA
        MOV DS, AX
        
        MOV AH, 9H
        LEA DX, PROMPT
        INT 21H
        
        MOV AH, 1H
        INT 21H 
        
        CMP AL,'A'
        JL NOT_UPPER
        CMP AL, 'Z'
        JG NOT_UPPER
        ADD AL,20H
        JMP DISPLAY
        
        NOT_UPPER:
            CMP AL,'a'
            JL DISPLAY
            CMP AL,'z'
            JG DISPLAY  
            SUB AL, 20H
        DISPLAY:     
            MOV BL, AL
            
            MOV AH, 9H
            LEA DX, RESULT
            INT 21H
        
            MOV AH, 2H
            MOV DL, BL
            INT 21H
            
            MOV AH, 4CH
            INT 21H
        
CODE ENDS
END START