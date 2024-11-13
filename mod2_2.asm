section .data
	prompt	db	"Enter your name: "
	lenPrompt equ $ - prompt

	prompt2	db	"You are: "
	lenPrompt2 equ $ - prompt2
section .bss
	input resb 20
section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt
	mov edx, lenPrompt
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, input
	mov edx, 20
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, prompt2
	mov edx, lenPrompt2
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, input
	mov edx, 20
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
