ASSUME CS:CODE, DS:DATA
DATA SEGMENT 
MSG1 DB 0AH,0DH,"Enter the character: $"
MSG2 DB 0AH,0DH,"Count: $"
STR DB 30H DUP("?")
DATA ENDS

CODE SEGMENT 
START:
	MOV AX,DATA
	MOV DS,AX
	LEA SI,STR
	LEA DX,MSG1
	MOV AH,09H
	INT 21H
	
	MOV AH,01H
	INT 21H

	MOV BL,AL
	MOV CX,0000

L1:	MOV AH,01H
	INT 21H
	MOV [SI],AL
	CMP [SI],0DH
	INC SI
	JE DONE
	CMP [SI-01H],BL
	JNE L1
	
	INC CX
	MOV AX,CX
	AAA
	MOV CX,AX

DONE:	LEA DX,MSG2
	MOV ah,09h
	INT 21H

	MOV DL,CH
	MOV AH,09H
	INT 21H

	MOV DL,CL
	MOV AH,09H
	INT 21H

	MOV AH,4CH
	INT 21H

CODE ENDS
END START