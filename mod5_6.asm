;Combine procedure with macro

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
	call prompt
	call readInput
	call output
	call exit

	prompt: 
		PRINT 1, msg, len
		ret
	readInput:
		READ 0, input, 50
		ret
	output:
		PRINT 1, inputMsg, inputLen
		PRINT 1, input, 50
	exit:
		mov eax, 1
		xor ebx, ebx
		int 0x80
