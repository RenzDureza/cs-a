section .data
	helloMSG db 'Hello '
	helloLen equ $ - helloMSG

	worldMSG db 'World', 0xa
	worldLen equ $ - worldMSG
section .text
	printHello:
		mov eax, 4
		mov ebx, 1
		mov ecx, helloMSG
		mov edx, helloLen
		int 0x80
		ret
		
	printWorld:
		mov eax, 4
		mov ebx, 1
		mov ecx, worldMSG
		mov edx, worldLen
		int 0x80
		ret

	global _start

_start:
	call printHello			
	call printWorld

	;exit
	mov eax, 1
	xor ebx, ebx
	int 0x80
