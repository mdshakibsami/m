DATA SEGMENT
    MSG DB 0DH,0AH,'AFTER POP = $'
DATA ENDS

CODE SEGMENT
    START:
        MOV AX, DATA
        MOV DS, AX
         
        ; PUSH
        MOV AH, 1H
        INT 21H
        MOV AH, 0
        PUSH AX  
        
        MOV AH, 1H
        INT 21H
        MOV AH, 0
        PUSH AX  
        
        ;POP
        
        MOV AH, 9H
        LEA DX, MSG
        INT 21H
        
        POP DX
        MOV AH, 2H
        INT 21H
        
        POP DX
        MOV AH, 2H
        INT 21H

CODE ENDS
END START