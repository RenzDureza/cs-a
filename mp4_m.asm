section .data
	;Clear Screen
	clearScreen db 27, '[2J', 0

	;Enrollment Status
	moveCursor3 db 27 '[9;1H'
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
	msgStudNum db 'Enter Student no.: ' 
	msgStudNumLen equ $ - msgStudNum
	dspStudNum db 'Student no.: '
	dspStudNumLen equ $ - dspStudNum
	
	;Name
	msgName db 'Enter Name: ' 
	msgNameLen equ $ - msgName
	dspName db 'Name: '
	dspNameLen equ $ - dspName
	
	;School Year
	msgSchoolYear db 'Enter School Year: '
	msgSchoolYearLen equ $ - msgSchoolYear
	dspSchoolYear db 'School Year: '
	dspSchoolYearLen equ $ - dspSchoolYear
	
	;College
	msgCollege db 'Enter College: '
	msgCollegeLen equ $ - msgCollege
	dspCollege db 'College: '
	dspCollegeLen equ $ - dspCollege
	
	;Year Level
	msgYearLevel db 'Enter Year Level: '
	msgYearLevelLen equ $ - msgYearLevel
	dspYearLevel db 'Year Level: '
	dspYearLevelLen equ $ - dspYearLevel
	
	;Program
	msgProgram db 'Enter Program: '
	msgProgramLen equ $ - msgProgram
	dspProgram db 'Program: '
	dspProgramLen equ $ - dspProgram

	;cor
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
         db "Room"
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
         db "ONLINE"
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
         db "ONLINE"
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
         db "ONLINE"
	cor4Len equ $ - cor4
	
	;fee
	tuition db 27, '[12;3H'          
    		db 'Tuition Fee(21)', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '43,218.00', 0xa,
			db 27, '[13;3H' 
    		db 'Miscellaneous Fee', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '9,865.00', 0xa,	
			db 27, '[14;3H' 
			db 'ID Validation Fee', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '78.00', 0xa,	
			db 27, '[15;3H' 
			db 'ITE Computer Laboratory Fee (CCS0021)', 0x9, 0x9, 0x9, 0x9, 0x9, '3,914.00', 0xa,	
			db 27, '[16;3H' 
			db 'ITE Computer Laboratory Fee (CS0070)', 0x9, 0x9, 0x9, 0x9, 0x9,  '3,914.00', 0xa,	
			db 27, '[17;3H' 
			db 'ITE Computer Laboratory Fee (CS0003)', 0x9, 0x9, 0x9, 0x9, 0x9,  '3,914.00', 0xa,
			db 27, '[18;3H' 
			db 'Science Lab Fee (GED0081)', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '4,007.00', 0xa,	     
			db 27, '[19;3H' 
			db 'TOTAL ASSESSMENT', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '68,910.00', 0xa, 0xa, 0xa, 0xa,
			db 27, '[20;3H' 
			db 'Down Payment (Upon Enrollment) 40%', 0x9, 0x9, 0x9, 0x9, 0x9, '27,564.00', 0xa,	 	 
			db 27, '[21;3H'     		
			db 'Midterm (Oct 14 - Oct 16 2024) 30%', 0x9, 0x9, 0x9, 0x9, 0x9, '20,673.00', 0xa,	
			db 27, '[22;3H'  
			db 'Final (Nov 29 - Dec 04 2024) 30%', 0x9, 0x9, 0x9, 0x9, 0x9, '20,673.00', 0xa,	
			db 27, '[23;3H'  
			db 'Add on: Installment Fee', 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, '250.00', 0xa,
	tuitionLen equ $ - tuition
    	
section .bss
	enroll resb 50
	enrollLen equ $ - enroll

	term resb 50
	termLen equ $ - term

	studNum resb 50
	studNumLen equ $ - studNum

	name resb 50
	nameLen equ $ - name

	schoolYear resb 50
	schoolYearLen equ $ - schoolYear

	college resb 50
	collegeLen equ $ - college

	yearLevel resb 50
	yearLevelLen equ $ - yearLevel

	program resb 50
	programLen equ $ - program
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
	
	call clearTheScreen

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

	clearTheScreen:
		mov eax, 4
		mov ebx, 1
		mov ecx, clearScreen
		mov edx, 4
		int 0x80
		ret
	
	displayPromtEnroll:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgEnroll
		mov edx, msgEnrollLen
		int 0x80

		mov eax, 3
		mov ebx, 0
		mov ecx, enroll  
		mov edx, enrollLen      
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
		mov edx, enrollLen
		int 0x80  
		ret
   	
   	displayPromtTerm:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgTerm
		mov edx, msgTermLen
		int 0x80

		mov eax, 3
		mov ebx, 0
		mov ecx, term  
		mov edx, termLen          
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
		mov edx, termLen
		int 0x80
		ret
   	
   	displayPromtStudNum:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgStudNum
		mov edx, msgStudNumLen
		int 0x80

		mov eax, 3
		mov ebx, 0
		mov ecx, studNum  
		mov edx, studNumLen          
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
		mov edx, studNumLen
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
		mov ebx, 0
		mov ecx, name  
		mov edx, nameLen          
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
		mov edx, nameLen
		int 0x80
		ret 
    
   	displayPromtSchoolYear:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgSchoolYear
		mov edx, msgSchoolYearLen
		int 0x80

		mov eax, 3
		mov ebx, 0
		mov ecx, schoolYear  
		mov edx, schoolYearLen          
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
		mov edx, schoolYearLen
		int 0x80
		ret 
    
	displayPromtCollege:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgCollege
		mov edx, msgCollegeLen
		int 0x80

		mov eax, 3
		mov ebx, 0
		mov ecx, college  
		mov edx, collegeLen          
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
		mov edx, collegeLen
		int 0x80
		ret 
    
	displayPromtYearLevel:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgYearLevel
		mov edx, msgYearLevelLen
		int 0x80

		mov eax, 3
		mov ebx, 0
		mov ecx, yearLevel  
		mov edx, yearLevelLen         
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
		mov edx, yearLevelLen
		int 0x80
		ret 
    
	displayPromtProgram:
		mov eax, 4
		mov ebx, 1
		mov ecx, msgProgram
		mov edx, msgProgramLen
		int 0x80

		mov eax, 3
		mov ebx, 0
		mov ecx, program  
		mov edx, programLen          
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
		mov edx, programLen
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
    	
    displayFees:
		mov eax, 4
		mov ebx, 1
		mov ecx, tuition
		mov edx, tuitionLen
		int 0x80
		ret

    mov eax, 1
    int 0x80