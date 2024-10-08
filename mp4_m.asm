section .data
	;Clear Screen
	;clearScreen db 27, '[2J', 0

	;Enrollment Status
	moveCursor3 db 27 '[9;1H'
	moveCursor3_len equ $ - moveCursor3
	msgEnroll db 'Enter Enrollment Status: ' , 0
	msgEnrollLen equ $ - msgEnroll
	dspEnroll db 'ENROLLMENT STATUS: ', 0
	dspEnrollLen equ $ - dspEnroll
	
	;Term
	msgTerm db 'Enter Term: ' 
	msgTermLen equ $ - msgTerm
	dspTerm db 'Term: ', 0
	dspTermLen equ $ - dspTerm
	
	;Student
	msgStudNum db 'Enter Student no.: ' 
	msgStudNumLen equ $ - msgStudNum
	dspStudNum db 'Student no.: ', 0
	dspStudNumLen equ $ - dspStudNum
	
	;Name
	msgName db 'Enter Name: ' 
	msgNameLen equ $ - msgName
	dspName db 'Name: ', 0
	dspNameLen equ $ - dspName
	
	;School Year
	msgSchoolYear db 'Enter School Year: '
	msgSchoolYearLen equ $ - msgSchoolYear
	dspSchoolYear db 'School Year: ', 0
	dspSchoolYearLen equ $ - dspSchoolYear
	
	;College
	msgCollege db 'Enter College: '
	msgCollegeLen equ $ - msgCollege
	dspCollege db 'College: ', 0
	dspCollegeLen equ $ - dspCollege
	
	;Year Level
	msgYearLevel db 'Enter Year Level: '
	msgYearLevelLen equ $ - msgYearLevel
	dspYearLevel db 'Year Level: ', 0
	dspYearLevelLen equ $ - dspYearLevel
	
	;Program
	msgProgram db 'Enter Program: '
	msgProgramLen equ $ - msgProgram
	dspProgram db 'Program: ', 0
	dspProgramLen equ $ - dspProgram

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
	moveCursor2 db 27, '[16;1H'          
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
	enroll resb 50
	term resb 50
	studNum resb 50
	name resb 50
	schoolYear resb 50
	college resb 50
	yearLevel resb 50
	program resb 50
	
section .text
	global _start
_start:
	call displayPromtEnroll
	call displayPromtTerm
	call displayPromtStudNum
	call displayPromtName
	call displayPromtSchoolYear
	call displayPromtCollege
	call displayPromtYearLevel
	call displayPromtProgram
	
	;call clearTheScreen

	call displayInputEnroll
	call displayInputTerm
	call displayInputStudNum
	call displayInputName
	call displayInputSchoolYear
	call displayInputCollege
	call displayInputYearLevel
	call displayInputProgram
	
	call displayCOR
	call displayFees

	; Exit code
   	mov eax, 1
   	int 0x80

	;clearTheScreen:
	;	mov eax, 4
	;	mov ebx, 1
	;	mov ecx, clearScreen
	;	mov edx, 5
	;	int 0x80
	;	ret
	
	displayPromtEnroll:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgEnroll
		mov edx, msgEnrollLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, enroll  
		mov edx, 50         
		int 0x80
		ret
	
	displayInputEnroll:
		mov eax, 4	
		mov ebx, 1
		mov ecx, moveCursor3
		mov edx, moveCursor3_len
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, dspEnroll
		mov edx, dspEnrollLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, enroll
		mov edx, 50
		int 0x80  
		ret
   	
   	displayPromtTerm:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgTerm
		mov edx, msgTermLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, term  
		mov edx, 50          
		int 0x80
		ret
	
	displayInputTerm:
		mov eax, 4
		mov ebx, 1
		mov ecx, dspTerm
		mov edx, dspTermLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, term
		mov edx, 50
		int 0x80
		ret
   	
   	displayPromtStudNum:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgStudNum
		mov edx, msgStudNumLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, studNum  
		mov edx, 50          
		int 0x80
		ret
   	
   	displayInputStudNum:
		mov eax, 4
		mov ebx, 1
		mov ecx, dspStudNum
		mov edx, dspStudNumLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, studNum
		mov edx, 50
		int 0x80
		ret
   	
   	;name
   	displayPromtName:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgName
		mov edx, msgNameLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, name  
		mov edx, 50          
		int 0x80
		ret
		
   	displayInputName:
		mov eax, 4
		mov ebx, 1
		mov ecx, dspName
		mov edx, dspNameLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, name
		mov edx, 50
		int 0x80
		ret 
    
   	displayPromtSchoolYear:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgSchoolYear
		mov edx, msgSchoolYearLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, schoolYear  
		mov edx, 50          
		int 0x80
		ret
		
   	displayInputSchoolYear:
		mov eax, 4
		mov ebx, 1
		mov ecx, dspSchoolYear
		mov edx, dspSchoolYearLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, schoolYear
		mov edx, 50
		int 0x80
		ret 
    
	displayPromtCollege:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgCollege
		mov edx, msgCollegeLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, college  
		mov edx, 50          
		int 0x80
		ret
    
   	displayInputCollege:
		mov eax, 4
		mov ebx, 1
		mov ecx, dspCollege
		mov edx, dspCollegeLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, college
		mov edx, 50
		int 0x80
		ret 
    
	displayPromtYearLevel:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgYearLevel
		mov edx, msgYearLevelLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, yearLevel  
		mov edx, 50         
		int 0x80
		ret
    
   	displayInputYearLevel:
		mov eax, 4
		mov ebx, 1
		mov ecx, dspYearLevel
		mov edx, dspYearLevelLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, yearLevel
		mov edx, 50
		int 0x80
		ret 
    
	displayPromtProgram:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgProgram
		mov edx, msgProgramLen
		int 0x80

		mov eax, 3
		mov ebx, 2
		mov ecx, program  
		mov edx, 50          
		int 0x80
		ret
    
   	displayInputProgram:
		mov eax, 4
		mov ebx, 1
		mov ecx, dspProgram
		mov edx, dspProgramLen
		int 0x80  

		mov eax, 4
		mov ebx, 1
		mov ecx, program
		mov edx, 50
		int 0x80
		ret

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

