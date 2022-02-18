include 'emu8086.inc'
org 100h

replay:
call CLEAR_SCREEN
call pthis
db 13,10, 'Enter the first number: ', 0
call scan_num

mov ax, cx
mov bx, cx


gotoxy 0,1
call pthis
db 13,10, 'Enter the second number: ', 0
call scan_num

cmp cx,0
je null

add ax,cx

gotoxy 0,2
call pthis
db 13,10, 'Sum: ', 0
call print_num
  
mov ax, bx
sub ax, cx

gotoxy 0,3
call pthis
db 13,10, 'Difference: ', 0
call print_num

mov ax,bx
imul cx

call pthis
db 13,10, 'Multiplication: ', 0
call print_num

mov ax,bx
idiv cx 

call pthis
db 13,10, 'Segmentation: ', 0
call print_num

inc dx
                   
call pthis
db 13,10, 'Change the sign of the first number: ', 0
call print_num

mov ah, 1
int 21h
jmp replay


null:

add ax,cx

gotoxy 0,3
call pthis
db 13,10, 'Sum: ', 0
call print_num

mov ax, bx
sub ax, cx

gotoxy 0,4
call pthis
db 13,10, 'Difference: ', 0
call print_num

mov ax,bx
imul cx

call pthis
db 13,10, 'Multiplication: ', 0
call print_num

gotoxy 0,6
call pthis
db 13,10, 'Segmentation: This number is Null', 0

mov ah, 1
int 21h
JMP replay

ret
DEFINE_PTHIS
DEFINE_SCAN_NUM
DEFINE_CLEAR_SCREEN
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS


