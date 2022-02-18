include 'emu8086.inc'
org 100h
         
; Ïðîöåäóðà ââîäà ÷èñëà
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
db 13, 10, 'Exit the program: 8', 0
gotoxy 0,9
call Pthis
db 13, 10, 'Your choice: ', 0
call SCAN_NUM
vvod ENDP   
; Êîíåö ïðîöåäóðû


; Ñðàâíåíèå ÷èñåë
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
JE stop

JNE wrong
; Êîíåö ñðàâíåíèÿ ÷èñåë
 
; Ïðîöåäóðà ñëîæåíèÿ
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
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
call sum      
sum ENDP  

; Ïðîöåäóðà Âû÷èòàíèÿ
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
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
call diff   
diff ENDP

; Ïðîöåäóðà Óìíîæåíèÿ
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
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
call multi   
multi ENDP

; Ïðîöåäóðà Äåëåíèÿ
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
call print_num
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
call print_num

;--------------
null:
gotoxy 0,2
call pthis
db 13,10, 'Division by zero is not possible', 0
mov ah, 1
int 21h
call seg     
seg ENDP

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
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
call increm       
increm ENDP

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
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
call dicrem      
dicrem ENDP

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
call print_num
gotoxy 0,2
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
call bit      
bit ENDP

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
