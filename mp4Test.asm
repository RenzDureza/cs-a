section .data
	clearScreen db 27, '[2J', 0

    cor1 db 27, '[7;3H'          
         db "Courses"
         db 27, '[7;13H'
         db "Title"
         db 27, '[7;42H'
         db "Section"
         db 27, '[7;50H'
         db "Units"
         db 27, '[7;56H'
         db "Days"
         db 27, '[7;62H'
         db "Time"
         db 27, '[7;82H'
         db "Room", 0xa
	cor1Len equ $ - cor1

    cor2 db 27, '[8;3H'          
         db "CCS0005"
         db 27, '[8;13H'
         db "INFORMATION MANAGEMENT (LEC)"
         db 27, '[8;42H'
         db "TN24"
         db 27, '[8;50H'
         db "2"
         db 27, '[8;56H'
         db "T"
         db 27, '[8;62H'
         db "16:00:00-18:40:00"
         db 27, '[8;82H'
         db "ONLINE", 0xa
	cor2Len equ $ - cor2

    cor3 db 27, '[9;3H'          
         db "CCS0023L"
         db 27, '[9;13H'
         db "INFORMATION MANAGEMENT (LAB)"
         db 27, '[9;42H'
         db "TN24"
         db 27, '[9;50H'
         db "1"
         db 27, '[9;56H'
         db "F"
         db 27, '[9;62H'
         db "16:00:00-18:50:00"
         db 27, '[9;82H'
         db "ONLINE", 0xa
	cor3Len equ $ - cor3

    cor4 db 27, '[10;3H'          
         db "GED0081"
         db 27, '[10;13H'
         db "COLLEGE PHYSICS 1 LECTURE"
         db 27, '[10;42H'
         db "TN24"
         db 27, '[10;50H'
         db "2"
         db 27, '[10;56H'
         db "T"
         db 27, '[10;62H'
         db "07:00:00-09:40:00"
         db 27, '[10;82H'
         db "ONLINE", 0xa
	cor4Len equ $ - cor4

section .text
    global _start
_start:
    call clearTheScreen
    call displayCOR

    clearTheScreen:
		mov eax, 4
		mov ebx, 1
		mov ecx, clearScreen
		mov edx, 5
		int 0x80
		ret

    displayCOR:
		mov eax, 4
		mov ebx, 1
		mov ecx, cor1
		mov edx, cor1Len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, cor2
		mov edx, cor2Len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, cor3
		mov edx, cor3Len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, cor4
		mov edx, cor4Len
		int 0x80
		ret

    mov eax, 1
    int 0x80


        
    	

