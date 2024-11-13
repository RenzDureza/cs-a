%macro PRINT 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

%macro READ 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

section .data
	name db 'Program by: Aldrin Renz Dureza', 0xa
	nameLen equ $ - name

	studNum db 'Student Number: ', 0xa
	studNumLen equ $ - studNum

	promptMonth db 'Enter your birth month (1 - 12): ', 0
	promptMonthLen equ $ - promptMonth

	promptBday db 'Enter your birth day (1 - 31): ', 0
	promptBdayLen equ $ - promptBday

	zodiacSign db 'My Zodiac Sign is: ', 0
	zodiacSignLen equ $ - zodiacSign
section .bss
	month resb 32
	day resb 32
section .text
	global _start
_start:
	call dispInfo
	call userIO

	dispInfo:
		PRINT name, nameLen
		PRINT studNum, studNumLen
		ret	

	userIO:
		PRINT promptMonth, promptMonthLen
		READ month, 32
		PRINT promptBday, promptBdayLen
		READ day, 32
		ret
		
	testPrint:
		PRINT month, 32
		PRINT day, 32
		ret
		
	exit:
		mov eax, 1
		xor ebx, ebx
		int 0x80
		
