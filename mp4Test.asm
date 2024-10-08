section .data
    moveCursor1 db 27, '[1;1H'          
    moveCursor1_len equ $ - moveCursor1
    cor1 db '| Courses  |             Title           |Section|Units|Days|       Time      |Room  |', 0xa
	cor1Len equ $ - cor1

    moveCursor2 db 27, '[2;1H'          
    moveCursor2_len equ $ - moveCursor2
    cor2 db '| CCS0005  |INFORMATION MANAGEMENT (LEC) |  TN24 |  2  | T  |16:00:00-18:40:00|ONLINE|', 0xa
	cor2Len equ $ - cor2

    moveCursor3 db 27, '[3;1H'          
    moveCursor3_len equ $ - moveCursor3
    cor3 db '| CCS0021L |INFORMATION MANAGEMENT (LAB) |  TN24 |  1  | F  |16:00:00-18:50:00|ONLINE|', 0xa
	cor3Len equ $ - cor3

    moveCursor4 db 27, '[4;1H'          
    moveCursor4_len equ $ - moveCursor4
    cor4 db '| GED0081  |COLLEGE PHYSICS 1 LECTURE    |  TN24 |  2  | T  |07:00:00-09:40:00|ONLINE|', 0xa
	cor4Len equ $ - cor4

section .text
    global _start
    
_start:
    call displayCOR

    displayCOR:
		mov eax, 4
		mov ebx, 1
		mov ecx, moveCursor1
		mov edx, moveCursor1_len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, cor1
		mov edx, cor1Len
		int 0x80
        
        mov eax, 4
		mov ebx, 1
		mov ecx, moveCursor2
		mov edx, moveCursor2_len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, cor2
		mov edx, cor2Len
		int 0x80

        mov eax, 4
		mov ebx, 1
		mov ecx, moveCursor3
		mov edx, moveCursor3_len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, cor3
		mov edx, cor3Len
		int 0x80

        mov eax, 4
		mov ebx, 1
		mov ecx, moveCursor4
		mov edx, moveCursor4_len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, cor4
		mov edx, cor4Len
		int 0x80
		ret

    mov eax, 1
    int 0x80


        
    	

