; find largest number        
.stack 20h
.data
msg db 'Input size of number:$'
msg1 db 'Now input integer numbers according to your given size:$'
msg2 db 'the largest number is:$'

number1 db 1 ; int i =1

number2 db 1
large db 0
.code

main proc 
    ; initialize data segment
    mov ax,@data
    mov ds,ax
    
    ; print input message
    
    lea dx,msg
    mov ah,9
    int 21h
    
     
    ;input size that will be the total numbers
    
    
    MOV CL,0 
    MOV CH,10
    TOP:
    MOV AH,1 ;input a single character
    INT 21H
    
    CMP AL,13 ; AL -13
    JNE CAL
    JMP LAST
    CAL:
     MOV BL,AL
     SUB BL,30H
     MOV AL,CL ; AL = CL =0
     MUL CH  ;  AL = AL * CH = 0 * 10 = 0
     MOV CL,AL 
     ADD CL,BL
     JMP TOP
     LAST:  
     MOV number1,CL
     
     
     
     ;print new line
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 33
        
    ; print input message
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    ;print new line
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 33    
  
  
  MOV DL,number1  
AGAIN:    
    
      
    ;input  number
    
    
    MOV CL,0 
    MOV CH,10D
    TOP1:
    MOV AH,1
    INT 21H
    CMP AL,32D
    JNE CAL1
    JMP LAST1
    CAL1:
     MOV BL,AL
     SUB BL,30H
     MOV AL,CL
     MUL CH
     MOV CL,AL 
     ADD CL,BL
     JMP TOP1
     LAST1:  
     MOV number2,CL 
     
     
  mov dh,large    
  cmp  dh,CL
  jb  REPLACE
  ja NEXT   
      
      
  REPLACE:  mov large,CL
  
  
  NEXT:dec dl    
  cmp dl,0    
  jne AGAIN     
      
     
     ;print new line
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 33
     
     
     
  ; print  message
         lea dx,msg2
    mov ah,9
    int 21h 
    
;mov dl,large
;add dl,30h
;;print result
;mov ah,2  
;int 21h

  mov bl,large
  ;Store result into STACK 
     MOV AX,BX
     MOV CL,10D
     MOV CH,0
     ;AND AX,0
     ;MOV AX,BX
     TOP5:
     DIV CL  ;  AL = AX/CL   & AH= AX%CL
     AND DX,0
     MOV DL,AH
     PUSH DX
     INC CH
     AND AH,0
     CMP AL,0
     JNE TOP5 
     
     
     ;print result     
     
     MOV AH,2 
     TOP6:
     POP DX
     ADD DL,30H
     INT 21H   
     DEC CH
     CMP CH,0
     JNE TOP6 

  
    
    main endp
end main