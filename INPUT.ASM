.STACK 100H ;DECLARE STACK SEGMENT
.DATA ;DECLARE DATA SEGMENT

.CODE ; DECLARE CODE SEGMENT

;DECLARE A PROCEDURE
BUBT  PROC ; PROCEDURE BEGIN
       ;INPUT A SINGLE CHARACTER
      MOV AH,1  ;A FUNCTION THAT INPUT A
               ;SINGLE CHARACTER 
               ; AH=1
      INT 21H ; INT MEANS INTERRUPT
         ; 21H IS A SERVICE ROUTINE
         ; IT EXCECUTES INPUT FUNCTION
    MOV BL,AL ; BL=AL COPY VALUE AL TO BL
    ; PRINT A NEW LINE
     MOV AH,2;PRINT A SINGLE CHARACTER
   MOV DL,10 ; 10 MEANS NEWLINE CHARACTER
   INT 33
   MOV DL,13;13 MEANS CURSOR RETURN
   ; AT THE BEGINING OF LEFT MARGIN
   INT 21H ; EXECUTE FUNCTION
   
  ; PRINT RESULT THAT INPUT
  MOV  DL,BL
  INT 21H
                                      
BUBT ENDP ; ENDP MEANS END PROCEDURE
       ;HERE PROCEDURE FINISH
END BUBT ; EXIT FROM PROGRAM       