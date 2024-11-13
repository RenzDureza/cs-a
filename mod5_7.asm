;Use cmp with macro and procedure

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

	match db 'Match found!', 0xa
	matchLen equ $ - match

	noMatch db 'No match found!', 0xa
	noMatchLen equ $ - noMatch
	
section .bss
	input resb 50
	
section .text
	global _start
	
_start:
	call prompt
	call readInput
	call checkInput ;checks the first character
	jmp exit

	prompt: 
		PRINT 1, msg, len
		ret
		
	readInput:
		READ 0, input, 50
		ret
		
	checkInput:	
		cmp byte[input], 'A'
		je matchFound
		jmp notMatch

	notMatch:
		PRINT 1, noMatch, noMatchLen
		ret

	matchFound:
		PRINT 1, match, matchLen
		ret
		
	exit:
		mov eax, 1
		xor ebx, ebx
		int 0x80
