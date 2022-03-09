include 'emu8086.inc'

org 100h

ab dw 20 DUP(0) 
vvod PROC
call CLEAR_SCREEN 
call Pthis
db 13, 10, 'Enter the number of the desired operation', 0
gotoxy 0,1
call Pthis
db 13, 10, 'Input numbers in array: 1', 0
gotoxy 0,2
call Pthis
db 13, 10, 'Convert array: 2', 0
gotoxy 0,3
call Pthis
db 13, 10, 'Exit the program: 3', 0
gotoxy 0,4
call Pthis
db 13, 10, 'Your choice: ', 0
call SCAN_NUM    
vvod ENDP

; --------------------------

vibor PROC
CMP CX, 1
JE input

CMP CX, 2
JE convert

CMP CX, 3
JE  stop

JNE wrong
    
vibor ENDP

; --------------------------

input PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Input any numbers (Max 10 numbers)', 0
gotoxy 0, 2
MOV DI, 0
repll:
call scan_num
add DI, 2
MOV ab[DI],CX
CMP DI, 20
JZ vvod
JNZ repll   
input ENDP

; --------------------------
convert PROC
call CLEAR_SCREEN
call pthis
db 13,10, 'Invert array:', 0
MOV DI, 22
MOV Cl, 1

CONTINUE:
ADD Cl, 1
sub DI, 2
MOV AX, ab[DI]
gotoxy 0, Cl
call print_num

CMP DI, 2
JE pause
JNE CONTINUE

pause:
call pthis
db 13,10, 'Input 1007 to exit the menu ', 0
call scan_num
CMP CX, 1007
JE vvod
mov ah, 1
int 21h
jmp stop     
convert ENDP

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
