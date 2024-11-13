; input and output operation

section .data
	prompt db 'Enter a number from (0-9): ', 0
	promptLen equ $ - prompt

	result db 'You entered: ', 0
	resultLen equ $ - result

	newLine db 10, 0
	newLineLen equ $ - newLine
section .bss
	input resb 1
		
section .text
	global _start

_start:
	call printPrompt			
	call inputPrompt
	call printResult
	call exit

	printPrompt:
		mov eax, 4
		mov ebx, 1
		mov ecx, prompt
		mov edx, promptLen
		int 0x80
		ret

	inputPrompt:
		mov eax, 3
		mov ebx, 0
		mov ecx, input
		mov edx, 1
		int 0x80
		ret

	printResult:
		mov eax, 4
		mov ebx, 1
		mov ecx, result
		mov edx, resultLen
		int 0x80

		;display the input data
		mov eax, 4
		mov ebx, 1
		mov ecx, input
		mov edx, 1
		int 0x80

		;display newLine
		mov eax, 4
		mov ebx, 1
		mov ecx, newLine
		mov edx, newLineLen
		int 0x80
		ret
				
	exit:
		mov eax, 1
		xor ebx, ebx
		int 0x80
