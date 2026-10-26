CODE SEGMENT
    START:
        MOV AH, 01H
        INT 21H

        CMP AL, ' '
        JNE START

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START