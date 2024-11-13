;Addition

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
	prompt db 'Enter a number: ', 0
	promptLen equ $ - prompt

	result db 'Answer is: !', 0
	resultLen equ $ - result

	newLine db 0xa
	newLineLen equ $ - newLine
section .bss
	num1 resb 4
	num2 resb 4
	input resb 32
	
section .text
	global _start
	
_start:
	call displayPrompt
	call read1stNum
	call read2ndNum
	call addNum
	call exit

	displayPrompt:
		PRINT 1, prompt, promptLen
		ret

	read1stNum:
		READ 0, num1, 4
		ret

	read2ndNum:
		PRINT 1, prompt, promptLen
		READ 0, num2, 4
		ret

	addNum:
		mov eax, [num1]
		sub eax, '0'
		mov ebx, [num2]
		sub ebx, '0'

		add eax, ebx
		add eax, '0'

		mov [input], eax

		PRINT 1, result, resultLen
		PRINT 1, input, 32
		PRINT 1, newLine, newLineLen
		ret

	exit:
		mov eax, 4
		xor ebx, ebx
		int 0x80
		
		
