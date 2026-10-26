CODE SEGMENT
    START:
        MOV CX, 4
        MOV BL, 0
    INPUT:
        MOV AH, 1H
        INT 21H  
       
        SUB AL, 30H   
        
        ADD BL,AL
        LOOP INPUT 

        ; DIVIDE
         MOV AL, BL
         AAM
               
         MOV BH, AH 
         ADD BH, 30H
         MOV BL, AL  
         ADD BL, 30H
        
        ; RESULT 
        MOV DL, 0DH
        MOV AH, 2H
        INT 21H 
        
        MOV DL, 0AH
        MOV AH, 2H
        INT 21H
        
        MOV DL, BH
        MOV AH, 2H 
        INT 21H  
       
        MOV DL, BL
        MOV AH, 2H 
        INT 21H
        
        MOV AH, 4CH
        INT 21H

CODE ENDS
END START