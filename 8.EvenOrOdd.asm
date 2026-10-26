DATA SEGMENT
    EVEN_MSG DB 0DH,0AH,'EVEN$'
    ODD_MSG  DB 0DH,0AH,'ODD$'
    ERR_MSG  DB 0DH,0AH,'NOT A NUMBER$'
DATA ENDS

CODE SEGMENT
    START:
        MOV AX, DATA
        MOV DS, AX
        
        MOV CL, 0
        
     INPUT:
        MOV AH, 1H
        INT 21H
        
        CMP AL, 0DH
        JE CHECK
        
        CMP AL, '0'
        JB ERROR 
        CMP AL, '9'
        JA ERROR
        
        MOV BL, AL
        INC CL
        
        CMP CL, 3
        JE CHECK
        JMP INPUT
        
   CHECK:
        CMP CL, 0
        JE ERROR
        
        SUB BL, '0'
        AND BL, 1H
        JZ EVEN
        
        MOV AH, 09H
        LEA DX, ODD_MSG 
        INT 21H
        JMP EXIT
    EVEN:
        MOV AH, 09H
        LEA DX, EVEN_MSG
        INT 21H
        JMP EXIT
    ERROR:
        MOV AH, 09H
        LEA DX, ERR_MSG
        INT 21H

    EXIT:
        MOV AH, 4CH
        INT 21H

CODE ENDS
END START