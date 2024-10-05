section .data
	;Enrollment Status
	moveCursor3 db 27 '[1;1H'
	moveCursor3_len equ $ - moveCursor3
	msgEnroll db 'Enter Enrollment Status: ' 
	msgEnrollLen equ $ - msgEnroll
	dspEnroll db 'ENROLLMENT STATUS: '
	dspEnrollLen equ $ - dspEnroll
	
	;Term
	msgTerm db 'Enter Term: ' 
	msgTermLen equ $ - msgTerm
	dspTerm db 'Term: '
	dspTermLen equ $ - dspTerm
	
	;Student
	msgStudNum db 'Enter Student#: ' 
	msgStudNumLen equ $ - msgStudNum
	dspStudNum db 'Student#: '
	dspStudNumLen equ $ - dspStudNum
	
	;Name
	msgName db 'Enter Name: ' 
	msgNameLen equ $ - msgName
	dspName db 'Name: '
	dspNameLen equ $ - dspName
	
	;cor
	moveCursor1 db 27, '[7;1H'          
    	moveCursor1_len equ $ - moveCursor1
    	cor db '|------------------------------------------------------------------------------------|', 0xa
	    db '| Courses  |             Title           |Section|Units|Days|       Time      |Room  |', 0xa
	    db '|------------------------------------------------------------------------------------|', 0xa
	    db '| CCS0005  |INFORMATION MANAGEMENT (LEC) |  TN24 |  2  | T  |16:00:00-18:40:00|ONLINE|', 0xa
	    db '|------------------------------------------------------------------------------------|', 0xa
	    db '| CCS0021L |INFORMATION MANAGEMENT (LAB) |  TN24 |  1  | F  |16:00:00-18:50:00|ONLINE|', 0xa
	    db '|------------------------------------------------------------------------------------|', 0xa
	    db '| GED0081  |COLLEGE PHYSICS 1 LECTURE    |  TN24 |  2  | T  |07:00:00-09:40:00|ONLINE|', 0xa
	    db '|------------------------------------------------------------------------------------|', 0xa
	corLen equ $ - cor
	
	;fee
	moveCursor2 db 27, '[16;1H'          ; Move cursor to 1st row, 38th column
    	moveCursor2_len equ $ - moveCursor2
    	fees db 'Tuition Fee(21)', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '43,218.00', 0xa,
	     db 'Miscellaneous Fee', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '9,865.00', 0xa,	
	     db 'ID Validation Fee', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '78.00', 0xa,	
	     db 'ITE Computer Laboratory Fee (CCS0021)', 0x9, 0x9, 0x9, 0x9, 0x9, '3,914.00', 0xa,	
	     db 'ITE Computer Laboratory Fee (CS0070)', 0x9, 0x9, 0x9, 0x9, 0x9,  '3,914.00', 0xa,	
	     db 'ITE Computer Laboratory Fee (CS0003)', 0x9, 0x9, 0x9, 0x9, 0x9,  '3,914.00', 0xa,
	     db 'Science Lab Fee (GED0081)', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '4,007.00', 0xa,	     
	     db 'TOTAL ASSESSMENT', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '68,910.00', 0xa, 0xa, 0xa, 0xa,
	     db 'Down Payment (Upon Enrollment) 40%', 0x9, 0x9, 0x9, 0x9, 0x9, '27,564.00', 0xa,	 	     		
	     db 'Midterm (Oct 14 - Oct 16 2024) 30%', 0x9, 0x9, 0x9, 0x9, 0x9, '20,673.00', 0xa,	 
	     db 'Final (Nov 29 - Dec 04 2024) 30%', 0x9, 0x9, 0x9, 0x9, 0x9, '20,673.00', 0xa,	 
	     db 'Add on: Installment Fee', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '250.00', 0xa,
	feesLen equ $ - fees
    	
section .bss
	enroll resb 10
	term resb 5
	studNum resb 10
	name resb 25
section .text
	global _start:
_start:
	call displayPromtEnroll
	call displayPromtTerm
	call displayPromtStudNum
	call displayPromtName
	
	call displayInputEnroll
	call displayInputTerm
	call displayInputStudNum
	call displayInputName
	call displayCOR
	call displayFees
	
	displayCOR:
    	mov eax, 4
    	mov ebx, 1
    	mov ecx, moveCursor1
    	mov edx, moveCursor1_len
    	int 0x80

    	mov eax, 4
    	mov ebx, 1
    	mov ecx, cor
    	mov edx, corLen
    	int 0x80
    	ret
    	
    	displayFees:
    	mov eax, 4
    	mov ebx, 1
    	mov ecx, moveCursor2
    	mov edx, moveCursor2_len
    	int 0x80

    	mov eax, 4
    	mov ebx, 1
    	mov ecx, fees
    	mov edx, feesLen
    	int 0x80
    	ret
	
	displayPromtEnroll:
	mov eax, 4
   	mov ebx, 1
   	mov ecx, msgEnroll
   	mov edx, msgEnrollLen
   	int 80h

   	mov eax, 3
   	mov ebx, 2
   	mov ecx, enroll  
   	mov edx, 10          
   	int 80h
   	ret
	
	
	displayInputEnroll:
   	mov eax, 4
   	mov ebx, 1
   	mov ecx, dspEnroll
   	mov edx, dspEnrollLen
   	int 80h  

   	mov eax, 4
   	mov ebx, 1
   	mov ecx, enroll
   	mov edx, 10
   	int 80h  
   	ret
   	
   	
   	displayPromtTerm:
	mov eax, 4
   	mov ebx, 1
   	mov ecx, msgTerm
   	mov edx, msgTermLen
   	int 80h

   	mov eax, 3
   	mov ebx, 2
   	mov ecx, term  
   	mov edx, 5          
   	int 80h
   	ret
	
	
	displayInputTerm:
   	mov eax, 4
   	mov ebx, 1
   	mov ecx, dspTerm
   	mov edx, dspTermLen
   	int 80h  

   	mov eax, 4
   	mov ebx, 1
   	mov ecx, term
   	mov edx, 5
   	int 80h
   	ret
   	
   	displayPromtStudNum:
	mov eax, 4
   	mov ebx, 1
   	mov ecx, msgStudNum
   	mov edx, msgStudNumLen
   	int 80h

   	mov eax, 3
   	mov ebx, 2
   	mov ecx, studNum  
   	mov edx, 10          
   	int 80h
   	ret
   	
   	displayInputStudNum:
   	mov eax, 4
   	mov ebx, 1
   	mov ecx, dspStudNum
   	mov edx, dspStudNumLen
   	int 80h  

   	mov eax, 4
   	mov ebx, 1
   	mov ecx, studNum
   	mov edx, 10
   	int 80h
   	ret
   	
   	;name
   	displayPromtName:
	mov eax, 4
   	mov ebx, 1
   	mov ecx, msgName
   	mov edx, msgNameLen
   	int 80h

   	mov eax, 3
   	mov ebx, 2
   	mov ecx, name  
   	mov edx, 25          
   	int 80h
   	ret
   	
   	displayInputName:
   	mov eax, 4
   	mov ebx, 1
   	mov ecx, dspName
   	mov edx, dspNameLen
   	int 80h  

   	mov eax, 4
   	mov ebx, 1
   	mov ecx, name
   	mov edx, 25
   	int 80h
   	ret 
    
    
   	; Exit code
   	mov eax, 1
   	mov ebx, 0
   	int 80h
