DATA SEGMENT
    MSG DB "REVERSE BYTE: $"
DATA ENDS

CODE SEGMENT
    START:
         MOV AX, DATA
         MOV DS, AX
         
         ; SET VALUES
         MOV AL, 10011101B
         MOV BL, 0
         MOV CX, 8
         
         ; REVERSE
         REVERSE:
            SHR AL, 1
            RCL BL, 1
            LOOP REVERSE
         
            ; MESSAGE
            MOV AH, 9H
            LEA DX, MSG
            INT 21H
                 
                 
            MOV CX, 8    
         ;PRINT   
         PRINT_BIT:
            SHL BL, 1
            MOV DL, '0'
            JNC DISPLAY
            MOV DL, '1'
           
         DISPLAY:
            MOV AH, 2H
            INT 21H
            LOOP PRINT_BIT       
            
CODE ENDS
END START