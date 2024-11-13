section .data
	userMsg	db	"Enter number: "
	lenUsrMsg	equ	$- userMsg
	dispMsg	db	"You entered: "
	lenDispMsg	equ	$- dispMsg
section .bss
	num resb 5
section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUsrMsg
	int 0x80

	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 0x80
	
	mov eax,1 
	mov ebx, 0 		;return 0
	;xor, ebx, ebx	;return 0
	int 0x80
