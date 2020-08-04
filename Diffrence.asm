.stack 100H
.data  

 msg  db 'DIFERENCA = $'  

 .code
main proc  
     ; initialize data segment
       MOV AX,@DATA
       MOV DS,AX
         
    ;input 1st number
       MOV AH,1
       INT 21H
       MOV BL,AL
       SUB BL,30H
        ;print newline
     MOV AH,2
     MOV DL,13 
     INT 21h
     MOV DL,10 
     INT 33
          
    ;input 2nd number
       MOV AH,1
       INT 21H
       MOV BH,AL
       SUB BH,30H 
        ;print newline
     MOV AH,2
     MOV DL,13 
     INT 21h
     MOV DL,10 
     INT 33

    ;inpurt 3rd number 
       MOV AH,1
       INT 21H
       MOV CL,AL
       SUB CL,30H  
        ;print newline
     MOV AH,2
     MOV DL,13 
     INT 21h
     MOV DL,10 
     INT 33
 
    ;inpurt 4th number
       MOV AH,1
       INT 21H
       MOV CH,AL
       SUB CH,30H  
        ;print newline
     MOV AH,2
     MOV DL,13 
     INT 21h
     MOV DL,10 
     INT 33   
       
       MOV AX,0
       MOV AL,BL
       MUL BH 
       MOV BL,AL
     
       MOV AX,0
       MOV AL,CL
       MUL CH 
       MOV CL,AL 
      
       SUB  BL,CL 
                
              ;print message for input second number
    LEA DX, msg 
    MOV AH,9
    INT 21h   
    ;print result
        MOV AH,2
          MOV DL,BL
          ADD DL,30h
        INT 21H
        
        
       main endp
end main
        