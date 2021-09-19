; SYS-DOS 1.0 Alpha Written by Aiden Moechnig 9/19/2021
;=========================================================== START
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

call string1
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

;=========================================================== ROUTINES
;-------------------- ROUTINE new command entry
new:
call linefeed
call linefeed

mov al, 's'
call lettergen
mov al, 'y'
call lettergen
mov al, 's'
call lettergen
mov al, '>'
call lettergen
ret
;-------------------- ROUTINE lettergen
lettergen:
mov ah, 0x0e
int 10h
ret
;-------------------- ROUTINE line feed
linefeed:
mov cl, dh
mov ah, 2
int 0x10

mov al, 0x0a
call lettergen

add cl, 1
mov dh, cl
mov dl, 0
mov ah, 2
int 0x10

ret
;=========================================================== STRINGS
;-------------------- STRING1 "READY"
string1:
mov al, ' '
call lettergen
mov al, 'R'
call lettergen
mov al, 'E'
call lettergen
mov al, 'A'
call lettergen
mov al, 'D'
call lettergen
mov al, 'Y'
call lettergen
ret
;-------------------- STRING4 "ver1.1"
string4:
mov al, 'v'
call lettergen
mov al, 'e'
call lettergen
mov al, 'r'
call lettergen
mov al, ' '
call lettergen
mov al, '1'
call lettergen
mov al, '.'
call lettergen
mov al, '0'
call lettergen
mov al, ' '
call lettergen
mov al, 'a'
call lettergen
mov al, 'l'
call lettergen
mov al, 'p'
call lettergen
mov al, 'h'
call lettergen
mov al, 'a'
call lettergen
ret
;-------------------- STRING5 "Cursor set to flat"
string5:
mov al, 'C'
call lettergen
mov al, 'u'
call lettergen
mov al, 'r'
call lettergen
mov al, 's'
call lettergen
mov al, 'o'
call lettergen
mov al, 'r'
call lettergen
mov al, ' '
call lettergen
mov al, 's'
call lettergen
mov al, 'e'
call lettergen
mov al, 't'
call lettergen
mov al, ' '
call lettergen
mov al, 't'
call lettergen
mov al, 'o'
call lettergen
mov al, ' '
call lettergen
mov al, 'f'
call lettergen
mov al, 'l'
call lettergen
mov al, 'a'
call lettergen
mov al, 't'
call lettergen
ret
;-------------------- STRING6 "Cursor set to box"
string6:
mov al, 'C'
call lettergen
mov al, 'u'
call lettergen
mov al, 'r'
call lettergen
mov al, 's'
call lettergen
mov al, 'o'
call lettergen
mov al, 'r'
call lettergen
mov al, ' '
call lettergen
mov al, 's'
call lettergen
mov al, 'e'
call lettergen
mov al, 't'
call lettergen
mov al, ' '
call lettergen
mov al, 't'
call lettergen
mov al, 'o'
call lettergen
mov al, ' '
call lettergen
mov al, 'b'
call lettergen
mov al, 'o'
call lettergen
mov al, 'x'
call lettergen
ret
;-------------------- STRING7 "[B] boxcsr, [D] # of flpydsk drives, [F] flatcsr, [M] chk for math co-p [V] version"
string7:
mov al, '['
call lettergen
mov al, 'C'
call lettergen
mov al, ']'
call lettergen
mov al, ' '
call lettergen
mov al, 'c'
call lettergen
mov al, 'l'
call lettergen
mov al, 'e'
call lettergen
mov al, 'a'
call lettergen
mov al, 'r'
call lettergen
mov al, ' '
call lettergen
mov al, 's'
call lettergen
mov al, 'c'
call lettergen
mov al, 'r'
call lettergen
mov al, 'e'
call lettergen
mov al, 'e'
call lettergen
mov al, 'n'
call lettergen

call linefeed

mov al, '['
call lettergen
mov al, 'B'
call lettergen
mov al, ']'
call lettergen
mov al, ' '
call lettergen
mov al, 'b'
call lettergen
mov al, 'o'
call lettergen
mov al, 'x'
call lettergen
mov al, ' '
call lettergen
mov al, 'c'
call lettergen
mov al, 'u'
call lettergen
mov al, 'r'
call lettergen
mov al, 's'
call lettergen
mov al, 'o'
call lettergen
mov al, 'r'
call lettergen

call linefeed

mov al, '['
call lettergen
mov al, 'D'
call lettergen
mov al, ']'
call lettergen
mov al, ' '
call lettergen
mov al, '#'
call lettergen
mov al, ' '
call lettergen
mov al, 'o'
call lettergen
mov al, 'f'
call lettergen
mov al, ' '
call lettergen
mov al, 'f'
call lettergen
mov al, 'l'
call lettergen
mov al, 'o'
call lettergen
mov al, 'p'
call lettergen
mov al, 'p'
call lettergen
mov al, 'y'
call lettergen
mov al, ' '
call lettergen
mov al, 'd'
call lettergen
mov al, 'i'
call lettergen
mov al, 's'
call lettergen
mov al, 'k'
call lettergen
mov al, ' '
call lettergen
mov al, 'd'
call lettergen
mov al, 'r'
call lettergen
mov al, 'i'
call lettergen
mov al, 'v'
call lettergen
mov al, 'e'
call lettergen
mov al, 's'
call lettergen

call linefeed

mov al, '['
call lettergen
mov al, 'F'
call lettergen
mov al, ']'
call lettergen
mov al, ' '
call lettergen
mov al, 'f'
call lettergen
mov al, 'l'
call lettergen
mov al, 'a'
call lettergen
mov al, 't'
call lettergen
mov al, ''
call lettergen
mov al, 'c'
call lettergen
mov al, 'u'
call lettergen
mov al, 'r'
call lettergen
mov al, 's'
call lettergen
mov al, 'o'
call lettergen
mov al, 'r'
call lettergen

call linefeed

mov al, '['
call lettergen
mov al, 'V'
call lettergen
mov al, ']'
call lettergen
mov al, ' '
call lettergen
mov al, 'v'
call lettergen
mov al, 'e'
call lettergen
mov al, 'r'
call lettergen
mov al, 's'
call lettergen
mov al, 'i'
call lettergen
mov al, 'o'
call lettergen
mov al, 'n'
call lettergen
ret
;-------------------- STRING8 "# of flpydsk drives: "
string8:
mov al, '#'
call lettergen
mov al, ' '
call lettergen
mov al, 'o'
call lettergen
mov al, 'f'
call lettergen
mov al, ' '
call lettergen
mov al, 'f'
call lettergen
mov al, 'l'
call lettergen
mov al, 'o'
call lettergen
mov al, 'p'
call lettergen
mov al, 'p'
call lettergen
mov al, 'y'
call lettergen
mov al, ' '
call lettergen
mov al, 'd'
call lettergen
mov al, 'i'
call lettergen
mov al, 's'
call lettergen
mov al, 'k'
call lettergen
mov al, ' '
call lettergen
mov al, 'd'
call lettergen
mov al, 'r'
call lettergen
mov al, 'i'
call lettergen
mov al, 'v'
call lettergen
mov al, 'e'
call lettergen
mov al, 's'
call lettergen
mov al, ':'
call lettergen
mov al, ' '
call lettergen
ret
;-------------------- STRING9 "Math co-p present: "
string9:
mov al, 'M'
call lettergen
mov al, 'a'
call lettergen
mov al, 't'
call lettergen
mov al, 'h'
call lettergen
mov al, ' '
call lettergen
mov al, 'c'
call lettergen
mov al, 'o'
call lettergen
mov al, '-'
call lettergen
mov al, 'p'
call lettergen
mov al, ' '
call lettergen
mov al, 'p'
call lettergen
mov al, 'r'
call lettergen
mov al, 'e'
call lettergen
mov al, 's'
call lettergen
mov al, 'e'
call lettergen
mov al, 'n'
call lettergen
mov al, 't'
call lettergen
mov al, ':'
call lettergen
mov al, ' '
call lettergen
ret