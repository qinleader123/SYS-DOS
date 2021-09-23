; SYS-DOS Kernel

;=========================================================== START
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

call linefeed

call new
;=========================================================== MAIN LOOP
main:

mov ah, 0x02
mov dl, bl
mov dh, cl
int 10
mov ah, 0x00
int 16h

cmp al, 'v'
je cmdv
cmp al, 'b'
je cmdb
cmp al, 'c'
je cmdc
cmp al, 'd'
je cmdd
cmp al, 'f'
je cmdf
cmp al, 'h'
je cmdh

jmp main

;=========================================================== COMMANDS
;-------------------- COMMAND V

cmdv:
mov al, 'V'
call lettergen
call linefeed
call string4
call new

jmp main
;-------------------- COMMAND B
cmdb:
mov al, 'B'
call lettergen

call linefeed
call string6

mov ch, 0
mov cl, 7
mov ah, 1
int 10h

call new

jmp main
;-------------------- COMMAND C
cmdc:

mov ah,06h      ;clear screen instruction
mov al,00h      ;number of lines to scroll
mov bh,0Fh      ;display attribute - colors
mov ch,00d      ;start row
mov cl,00d      ;start col
mov dh,24d      ;end of row
mov dl,79d      ;end of col
int 10h         ;BIOS interrupt

mov dh, 0
mov dl, 0
mov bh, 0
mov ah, 2
int 0x10

call new

jmp main
;-------------------- COMMAND D
cmdd:

mov al, 'D'
call lettergen
call linefeed
call string8

int 0x11
mov cx, ax

or cl, 111111b
not cl

cmp cl, 192d
je _1disk
cmp cl, 128d
je _2disk
cmp cl, 64d
je _3disk
cmp cl, 0d
je _4disk

jmp main

_finishdisk:
call lettergen
call new
jmp main

_1disk:
mov al, '1'
jmp _finishdisk

_2disk:
mov al, '2'
jmp _finishdisk

_3disk:
mov al, '3'
jmp _finishdisk

_4disk:
mov al, '4'
jmp _finishdisk

jmp main
;-------------------- COMMAND F
cmdf:

mov al, 'F'
call lettergen

call linefeed
call string5

mov ch, 6
mov cl, 7
mov ah, 1
int 10h

call new

jmp main
;-------------------- COMMAND H
cmdh:

mov al, 'H'
call lettergen

call linefeed
call string7
call new

jmp main

include 'lib.asm'