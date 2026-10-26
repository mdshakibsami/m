DATA SEGMENT
    MSG DB 0DH, 0AH, 'GRADE = $'
    AP  DB 'A+$'
    A   DB 'A$'
    B   DB 'B$'
    C   DB 'C$'  
DATA ENDS

CODE SEGMENT
    START:
          MOV AX, DATA
          MOV DS, AX
          
          ; READ MARKS
          MOV AH, 1H
          INT 21H
          SUB AL, 30H
          MOV BL, AL
          
          MOV AH, 1H
          INT 21H
          SUB AL, 30H
          MOV BH, AL
          
          ; CALCULATE MARKS = TENS*10+UNITS
          MOV AL, BL
          MOV DL, 10
          MUL DL
          ADD AL, BH
          MOV BL, AL
          
          ;GRAD CHECKING
           CMP BL, 80
           JAE GRADE_AP
        
           CMP BL, 70
           JAE GRADE_A
        
           CMP BL, 60
           JAE GRADE_B
        
           LEA DX, C
           JMP PRINT 
           
           
        GRADE_AP:
            LEA DX, AP
            JMP PRINT
        
        GRADE_A:
            LEA DX, A
            JMP PRINT
        
        GRADE_B:
            LEA DX, B
        
        PRINT:
            MOV AH, 09H
            INT 21H
        
            MOV AH, 4CH
            INT 21H

CODE ENDS
END START