DATA SEGMENT
    MSG1 DB 0DH,0AH,'MUL = $'
    MSG2 DB 0DH,0AH,'DIV = $'  
    ERR DB 0DH,0AH,'DIVIDED BY ZERO IS NOT ALLOWED.$'
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
      
      ; NEWLINE
       MOV AH,2H
       MOV DL, 0DH
       INT 21H    
          
       MOV AH,2H
       MOV DL, 0AH
       INT 21H 
      
      ; SECOND NUMBER
      MOV AH, 1H
      INT 21H  
      SUB AL, '0'
      MOV BH, AL  
      
     ; MUL 
     MOV AH, 09H
     LEA DX, MSG1
     INT 21H  
     
     MOV AL, BL
     MUL BH
     
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
    
     

     ; CHECK ZERO
     MOV AL, BH
     CMP AL, 0
     JE ERROR
                 
     ; DIVISION
     MOV AH, 09H
     LEA DX, MSG2
     INT 21H    
     
                 
     MOV AL, BL
     MOV AH, 0
     DIV BH       ; AL = quotient, AH = remainder
     
     ADD AL, '0'
     MOV DL, AL
     MOV AH, 2H
     INT 21H   
     JMP EXIT
     
     ERROR: 
        MOV AH, 9H
        LEA DX, ERR
        INT 21H
    
    EXIT:    
    MOV AH, 4CH
    INT 21H 
    
CODE ENDS
END START     
