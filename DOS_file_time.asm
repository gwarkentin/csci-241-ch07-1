; Program: DOS_file_time (Chapter 7)
; Description: Show file time in DOS 16 bit style using bit shifts
; Student:     Gabriel Warkentin
; Date:        03/23/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

INCLUDE Irvine32.inc

.data

msg1 BYTE "Please enter 16-bit hexadecimal (4-digit, e.g., 1207): ",0
msg2 BYTE "Your equivalent binary is ",0
msg3 BYTE 0dh,0ah,"Your DOS file time is ",0

.code
main9 PROC
	mov edx, OFFSET msg1
	call WriteString

	call ReadHex
	mov edx, OFFSET msg2
	call WriteString

	mov ebx, 2
	call WriteBinB
	mov edx, OFFSET msg3
	call WriteString

	call ShowFileTime
	call CrLf
	exit
main9 ENDP

;------------------------------------------------------------
ShowFileTime PROC
;
; Shows translation of 16 bit hex to DOS file time
; Receives: EAX = 16 bit hex input. Accepts out of range stuff
; Returns: nothing
;------------------------------------------------------------
	mov ebx, eax			; save eax in ecx since WriteDec prints eax
	shr eax, 11
	Call Write2DigitDec
	Call WriteCol
	mov eax, ebx
	shl eax, 5+16			; clear out left
	shr eax, 10+16			; move to lowest bits
	Call Write2DigitDec
	Call WriteCol
	mov eax, ebx
	shl eax, 11+16
	shr eax, 10+16			; shift one less to multiply by two
	Call Write2DigitDec
	ret
ShowFileTime ENDP

;------------------------------------------------------------
Write2DigitDec PROC
; Uses edx
; Write Decimal in EAX as two digits adding leading zeros
; Receives: EAX
; Returns: nothing
;------------------------------------------------------------
	cmp EAX, 9
	ja L1
	mov edx, eax
	mov al, '0'
	call WriteChar
	mov eax, edx
L1:
	call WriteDec
	ret
Write2DigitDec ENDP

;------------------------------------------------------------
WriteCol PROC
; Not so sure that this needed to be a PROC...
; Writes Colon character ":"
; Receives: nothing
; Returns: nothing
;------------------------------------------------------------
	mov al, ":"
	call WriteChar
	ret
WriteCol ENDP

END; main9