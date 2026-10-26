DATA SEGMENT
    MSG1 DB 0DH,0AH,'SUM = $'
    MSG2 DB 0DH,0AH,'DIFFERENCE = $'
DATA ENDS

CODE SEGMENT
START:
      MOV AX, DATA
      MOV DS, AX
      
      ;  FIRST NUMBER
      MOV AH, 1H
      INT 21H  
      SUB AL, '0'
      MOV BL, AL     
      
      ; SECOND NUMBER
      MOV AH, 1H
      INT 21H  
      SUB AL, '0'
      MOV BH, AL  
      
     ; SUM 
     MOV AH, 09H
     LEA DX, MSG1
     INT 21H  
     
     MOV AL, BL
     ADD AL, BH
     AAM
     MOV CL, AH
     MOV CH, AL
     
     MOV DL, CL
     ADD DL, '0'
     MOV AH, 02H
     INT 21H  
     
     MOV DL, CH
     ADD DL, '0'
     MOV AH, 02H
     INT 21H 
    
     
     ; DIFFERENCE
     MOV AH, 09H
     LEA DX, MSG2
     INT 21H
     
     
      MOV AL, BL
      CMP AL, BH
      JAE POSITIVE
      
      MOV AH, 2H
      MOV DL,'-'
      INT 21H 
      XCHG BL,BH
      
      POSITIVE:
        MOV AL, BL
        SUB AL, BH
        
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2H
        INT 21H
        
        MOV AH, 4CH
        INT 21H
CODE ENDS
END START     
