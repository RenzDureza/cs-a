; Using macro with input output

%macro PRINT 3
	mov eax, 4
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
%endmacro

%macro READ 3
	mov eax, 3
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
%endmacro

section .data
	msg db 'Enter a string: ', 0
	len equ $ - msg

	inputMsg db 'You entered: ', 0
	inputLen equ $ - inputMsg

	newLine db 10, 0
	newLineLen equ $ - newLine
section .bss
	input resb 50
section .text
	global _start
_start:
	PRINT 1, msg, len 
	READ 0, input, 50
	PRINT 1, inputMsg, inputLen
	PRINT 1, input, 50
	PRINT 1, newLine, newLineLen

	mov eax, 1
	xor ebx, ebx
	int 0x80
