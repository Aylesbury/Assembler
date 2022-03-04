include 'emu8086.inc'

org 100h

vvod PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the first number: ', 0
call scan_num
PUSH CX
gotoxy 0,1
call pthis
db 13,10, 'Enter the second number: ', 0
call scan_num
MOV ax, cx
PUSH AX     
vvod ENDP

menu PROC
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
db 13, 10, 'Exit the program: 5', 0
gotoxy 0,6
call Pthis
db 13, 10, 'Your choice: ', 0
call SCAN_NUM

CMP CX, 1
JE sum

CMP CX, 2
JE diff

CMP CX, 3
JE  multi

CMP CX, 4
JE seg

CMP CX, 5
JE stop
      
menu ENDP
;------------------------------
sum PROC
pop AX
pop CX   
add ax,cx    
call CLEAR_SCREEN
call pthis
db 13,10, 'Summa: ', 0
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h    
call vvod    
sum ENDP
;------------------------------
diff PROC
POP CX
POP AX
sub ax, cx    
call CLEAR_SCREEN
call pthis
db 13,10, 'Difference: ', 0
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h    
call vvod    
diff ENDP
;------------------------------
multi PROC
POP CX
POP AX
imul cx 
call CLEAR_SCREEN
call pthis
db 13,10, 'Multiplication: ', 0
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h    
call vvod     
multi ENDP
;------------------------------
seg PROC
POP CX
JB invDel
CMP CX, 0
JE null
POP AX
inv2:
CMP AX, 0
JE null
idiv CX
call CLEAR_SCREEN
call pthis
db 13,10, 'Segmentation: ', 0
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
; */*/*/*/*/*/*/*/*/*/*/*/
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
call print_num

null:
gotoxy 0,2
call pthis
db 13,10, 'Division by zero is not possible', 0
mov ah, 1
int 21h
call seg 
mov ah, 1
int 21h
call vvod  
seg ENDP
;------------------------------
wrong PROC
call CLEAR_SCREEN           
call pthis
db 13,10, 'Wrong number press any key', 0
mov ah, 1
int 21h
call vvod
wrong ENDP

stop:
ret
DEFINE_PTHIS
DEFINE_SCAN_NUM
DEFINE_CLEAR_SCREEN
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END
