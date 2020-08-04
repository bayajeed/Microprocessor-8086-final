.stack 10H
.data  
 msg1  db  'enter first number: $'
 msg2 db  'enter second number: $'
 msg3 db  'SOMA = $'
 
.code
main proc  
     ; initialize data segment
       MOV AX,@DATA
       MOV DS,AX 
       ;print input message
        MOV AH,9
        LEA DX,msg1
        INT 21h
       MOV AH,1; input a single character
       INT 21h ;execute function
        
      MOV BL,AL;BL=AL 
     ;print newline
     MOV AH,2
     MOV DL,13
     INT 21h
     MOV DL,10
     INT 33
           ;print input message
        MOV AH,9
       LEA DX,msg2
       INT 21h
       MOV AH,1
       INT 21h  
       MOV BH,AL
   
     ;ADD
     ADD BH,BL; BH=BH+BL
     SUB BH,30H ;to get correct decimal digit  
      
        
     ;print newline
     MOV AH,2
     MOV DL,13
     INT 21h
     MOV DL,10
     INT 33  
     ;print input message
        MOV AH,9
        LEA DX,msg3
        INT 21h  
     ;print result
       MOV AH,2 
       MOV DL,BH
       INT 21h
  
    main endp
end main