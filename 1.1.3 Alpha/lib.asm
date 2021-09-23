;SYS-DOS Kernel Library

;=========================================================== SUBROUTINES

;-------------------- ROUTINE new

new:
call linefeed
call linefeed

mov al, '$'
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

;-------------------- STRING4
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
mov al, '1'
call lettergen
mov al, '.'
call lettergen
mov al, '3'
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
;-------------------- STRING7
string7:

mov al, 'C'
call lettergen
mov al, ':'
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

mov al, 'B'
call lettergen
mov al, ':'
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

mov al, 'D'
call lettergen
mov al, ':'
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

mov al, 'F'
call lettergen
mov al, ':'
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

mov al, 'V'
call lettergen
mov al, ':'
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
;-------------------- STRING8 "# of floppy disk drives: "
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