.stack 100H
.data 

message1 DB 'Enter first number: $' 
message2 DB 'Enter second number: $' 
message3 DB 'PROD = $'   

.code
main proc
    
    ;initialize data segment 
    MOV AX,@DATA 
    MOV DS,AX  
    
    ;print message for input first number
    LEA DX, message1
    MOV AH,9
    INT 21h 
    
    MOV AH,1     ; input a single character
    INT 21h
        
    MOV BL,AL          ;BL=AL 
    SUB BL,30H       ; convert hexadecimal to decimal  
    
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
      
     
     
     ;print message for input second number
    LEA DX, message2 
    MOV AH,9
    INT 21h 
     
     MOV AH,1      ; input a single character
    INT 21h 
        
    MOV BH,AL          ;BL=AL 
    SUB BH,30H 
     ;print newline
     MOV AH,2
     MOV DL,13 
     INT 21h
     MOV DL,10 
     INT 33
      
    ;MULTIPLICATION
      
    MOV AX,0 ; both AL=0 and AH=0 
    MOV Al,BL ; AL= BL
    MUL BH ; AL = AL* BH
    
    MOV BL, AL ; BL=AL 
     
     ;print message for print result number
    LEA DX, message3 
    MOV AH,9
    INT 21h 
    
    MOV DL, BL 
    ADD DL,30H 
  
     ;print result
     MOV AH,2
     INT 21h
   
    main endp
end main