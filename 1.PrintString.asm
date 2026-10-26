DATA SEGMENT
    MSG DB 'Assembly is so hard to understand! $'   ,
DATA ENDS

CODE SEGMENT
    START:
        MOV AX, DATA
        MOV DS, AX
        
        MOV AH, 9H
        LEA DX, MSG
        INT 21H
        
        MOV AH, 4CH
        INT 21H
ENDS CODE
END START