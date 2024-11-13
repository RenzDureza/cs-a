; Macros == Function
%macro PRINT 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

section .data
	msg db 'Hello World', 0xa
	len equ $ - msg

	msg2 db 'World', 0xa
	len2 equ $ - msg2
section .text
	global _start
_start:
	PRINT msg, len
	PRINT msg2, len2

	mov eax, 1
	xor ebx, ebx
	int 0x80
