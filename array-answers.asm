include 'emu8086.inc'

org 100h
ab dw 50 DUP(0) 
vvod PROC
call CLEAR_SCREEN 
call Pthis
db 13, 10, 'Enter the number of the desired operation', 0
gotoxy 0,1
call Pthis
db 13, 10, 'Summa: 1', 0
gotoxy 0,2
call Pthis
db 13, 10, 'Difference: 2', 0
gotoxy 0,3
call Pthis
db 13, 10, 'Multiplication: 3', 0
gotoxy 0,4
call Pthis
db 13, 10, 'Segmentation: 4', 0
gotoxy 0,5
call Pthis
db 13, 10, 'Increment: 5', 0
gotoxy 0,6
call Pthis
db 13, 10, 'Dicrement: 6', 0
gotoxy 0,7
call Pthis
db 13, 10, 'Bit inversion: 7', 0
gotoxy 0,8
call Pthis
db 13, 10, 'Answers: 8', 0
gotoxy 0,9
call Pthis
db 13, 10, 'Exit the program: 9', 0
gotoxy 0,10
call Pthis
db 13, 10, 'Your choice: ', 0
call SCAN_NUM    
vvod ENDP

vibor PROC
CMP CX, 1
JE sum

CMP CX, 2
JE diff

CMP CX, 3
JE  multi

CMP CX, 4
JE seg

CMP CX, 5
JE increm

CMP CX, 6
JE dicrem

CMP CX, 7
JE bit

CMP CX, 8
JE answers

CMP CX, 9
JE stop

JNE wrong    
vibor ENDP

; Процедура сложения
sum PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the first number: ', 0
call scan_num
mov ax, cx
gotoxy 0,1
call pthis
db 13,10, 'Enter the second number: ', 0
call scan_num
add ax,cx
gotoxy 0,3
call pthis
db 13,10, 'Summa: ', 0
call ans
call vvod 
sum ENDP

; Процедура Вычитания
diff PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the first number: ', 0
call scan_num
mov ax, cx
gotoxy 0,1
call pthis
db 13,10, 'Enter the second number: ', 0
call scan_num
sub ax, cx
gotoxy 0,3
call pthis
db 13,10, 'Difference: ', 0
call ans
call vvod   
diff ENDP

; Процедура Умножения
multi PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the first number: ', 0
call scan_num
mov ax, cx
gotoxy 0,1
call pthis
db 13,10, 'Enter the second number: ', 0
call scan_num
imul cx
gotoxy 0,3
call pthis
db 13,10, 'Multiplication: ', 0
call ans
call vvod  
multi ENDP

; Процедура Деления
seg PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the first number: ', 0
call scan_num
JB invDel
CMP CX, 0
JE null
mov ax, cx
inv2:
gotoxy 0,1
call pthis
db 13,10, 'Enter the second number: ', 0
call scan_num
CMP CX, 0
JE null
idiv cx
gotoxy 0,3
call pthis
db 13,10, 'Segmentation: ', 0
call ans
call vvod 
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
invDel:
neg cx
mov ax, cx
jmp inv2
neg cx
idiv cx
neg ax
gotoxy 0,3
call pthis
db 13,10, 'Segmentation: ', 0
call ans
call vvod
;--------------
null:
gotoxy 0,2
call pthis
db 13,10, 'Division by zero is not possible', 0
mov ah, 1
int 21h
call seg     
seg ENDP

; Процедура инкремента
increm PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the number: ', 0
call scan_num
inc cx
mov ax,cx
gotoxy 0,2
call pthis
db 13,10, 'Increment: ', 0
call ans
call vvod      
increm ENDP

; Процедура дикремента
dicrem PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the number: ', 0
call scan_num
dec cx
mov ax,cx
gotoxy 0,2
call pthis
db 13,10, 'Dicrement: ', 0
call ans
call vvod      
dicrem ENDP

; Процедура побитовой инверсии
bit PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the number: ', 0
call scan_num
neg cx
mov ax,cx 
gotoxy 0,1
call pthis
db 13,10, 'Bit inversion: ', 0
call ans
call vvod   
bit ENDP

; ---------------------------------------------
answers PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Answers: ', 0
MOV DI, 0
MOV Cl, 1

CONTINUE:
ADD Cl, 1
ADD DI, 2
MOV AX, ab[dI]
CMP AX, 0
JE pause
gotoxy 0, Cl
call print_num
JMP CONTINUE
pause:
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
jmp stop        
answers ENDP    

; ---------------------------------------------
wrong PROC
call CLEAR_SCREEN           
call pthis
db 13,10, 'Wrong number press any key', 0
mov ah, 1
int 21h
call vvod
wrong ENDP
; ---------------------------------------------
ans PROC
add DI, 2 
MOV ab[DI],AX
call print_num
mov BX, DI    
ans ENDP
; ---------------------------------------------
stop:

ret
DEFINE_PTHIS
DEFINE_SCAN_NUM
DEFINE_CLEAR_SCREEN
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END



