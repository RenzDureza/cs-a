%macro PRINT 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

%macro READ 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

section .data
	name db 'Program by: Aldrin Renz Dureza', 0xa
	nameLen equ $ - name

	studNum db 'Student Number: ', 0xa
	studNumLen equ $ - studNum

	promptMonth db 'Enter your birth month (1 - 12): ', 0
	promptMonthLen equ $ - promptMonth

	promptBday db 'Enter your birth day (1 - 31): ', 0
	promptBdayLen equ $ - promptBday

	zodiacSign db 'My Zodiac Sign is: ', 0
	zodiacSignLen equ $ - zodiacSign
section .bss
	month resb 32
	day resb 32
	zodiac resb 32
	zodiacDesc resb 128
section .text
	global _start
_start:
	call dispInfo
	call userIO

	dispInfo:
		PRINT name, nameLen
		PRINT studNum, studNumLen
		ret	

	userIO:
		PRINT promptMonth, promptMonthLen
		READ month, 32
		PRINT promptBday, promptBdayLen
		READ day, 32
	determineZodiac:
		; Convert month and day to integers
		mov eax, month
		sub eax, '0'
		mov [month], eax
		mov eax, day
		sub eax, '0'
		mov [day], eax
	
		; Determine zodiac sign based on month and day
		mov eax, [month]
		mov ebx, [day]
		cmp eax, 3
		jne .notAries
		cmp ebx, 21
		jb .notAries
		mov edi, aries
		mov esi, ariesDesc
		jmp .setZodiac
	.notAries:
		cmp eax, 4
		jne .notAries2
		cmp ebx, 19
		ja .notAries2
		mov edi, aries
		mov esi, ariesDesc
		jmp .setZodiac
	.notAries2:
		cmp eax, 4
		jne .notTaurus
		cmp ebx, 20
		jb .notTaurus
		mov edi, taurus
		mov esi, taurusDesc
		jmp .setZodiac
	.notTaurus:
		cmp eax, 5
		jne .notGemini
		cmp ebx, 20
		ja .notGemini
		mov edi, taurus
		mov esi, taurusDesc
		jmp .setZodiac
	.notGemini:
		cmp eax, 5
		jne .notGemini2
		cmp ebx, 21
		jb .notGemini2
		mov edi, gemini
		mov esi, geminiDesc
		jmp .setZodiac
	.notGemini2:
		cmp eax, 6
		jne .notCancer
		cmp ebx, 20
		ja .notCancer
		mov edi, gemini
		mov esi, geminiDesc
		jmp .setZodiac
	.notCancer:
		cmp eax, 6
		jne .notCancer2
		cmp ebx, 21
		jb .notCancer2
		mov edi, cancer
		mov esi, cancerDesc
		jmp .setZodiac
	.notCancer2:
		cmp eax, 7
		jne .notLeo
		cmp ebx, 22
		ja .notLeo
		mov edi, cancer
		mov esi, cancerDesc
		jmp .setZodiac
	.notLeo:
		cmp eax, 7
		jne .notLeo2
		cmp ebx, 23
		jb .notLeo2
		mov edi, leo
		mov esi, leoDesc
		jmp .setZodiac
	.notLeo2:
		cmp eax, 8
		jne .notVirgo
		cmp ebx, 22
		ja .notVirgo
		mov edi, leo
		mov esi, leoDesc
		jmp .setZodiac
	.notVirgo:
		cmp eax, 8
		jne .notVirgo2
		cmp ebx, 23
		jb .notVirgo2
		mov edi, virgo
		mov esi, virgoDesc
		jmp .setZodiac
	.notVirgo2:
		cmp eax, 9
		jne .notLibra
		cmp ebx, 22
		ja .notLibra
		mov edi, virgo
		mov esi, virgoDesc
		jmp .setZodiac
	.notLibra:
		cmp eax, 9
		jne .notLibra2
		cmp ebx, 23
		jb .notLibra2
		mov edi, libra
		mov esi, libraDesc
		jmp .setZodiac
	.notLibra2:
		cmp eax, 10
		jne .notScorpio
		cmp ebx, 22
		ja .notScorpio
		mov edi, libra
		mov esi, libraDesc
		jmp .setZodiac
	.notScorpio:
		cmp eax, 10
		jne .notScorpio2
		cmp ebx, 23
		jb .notScorpio2
		mov edi, scorpio
		mov esi, scorpioDesc
		jmp .setZodiac
	.notScorpio2:
		cmp eax, 11
		jne .notSagittarius
		cmp ebx, 21
		ja .notSagittarius
		mov edi, scorpio
		mov esi, scorpioDesc
		jmp .setZodiac
	.notSagittarius:
		cmp eax, 11
		jne .notSagittarius2
		cmp ebx, 22
		jb .notSagittarius2
		mov edi, sagittarius
		mov esi, sagittariusDesc
		jmp .setZodiac
	.notSagittarius2:
		cmp eax, 12
		jne .notCapricorn
		cmp ebx, 21
		ja .notCapricorn
		mov edi, sagittarius
		mov esi, sagittariusDesc
		jmp .setZodiac
	.notCapricorn:
		cmp eax, 12
		jne .notCapricorn2
		cmp ebx, 22
		jb .notCapricorn2
		mov edi, capricorn
		mov esi, capricornDesc
		jmp .setZodiac
	.notCapricorn2:
		cmp eax, 1
		jne .notAquarius
		cmp ebx, 19
		ja .notAquarius
		mov edi, capricorn
		mov esi, capricornDesc
		jmp .setZodiac
	.notAquarius:
		cmp eax, 1
		jne .notAquarius2
		cmp ebx, 20
		jb .notAquarius2
		mov edi, aquarius
		mov esi, aquariusDesc
		jmp .setZodiac
	.notAquarius2:
		cmp eax, 2
		jne .notPisces
		cmp ebx, 18
		ja .notPisces
		mov edi, aquarius
		mov esi, aquariusDesc
		jmp .setZodiac
	.notPisces:
		cmp eax, 2
		jne .notPisces2
		cmp ebx, 19
		jb .notPisces2
		mov edi, pisces
		mov esi, piscesDesc
		jmp .setZodiac
	.notPisces2:
		cmp eax, 3
		jne .default
		cmp ebx, 20
		ja .default
		mov edi, pisces
		mov esi, piscesDesc
		jmp .setZodiac
	.default:
		; Default case if no zodiac sign matches
		mov edi, pisces
		mov esi, piscesDesc
	
	.setZodiac:
		mov ecx, 32
		rep movsb
		mov edi, zodiacDesc
		mov esi, ariesDesc
		mov ecx, 128
		rep movsb
		ret ecx, 128
		rep movsb
		ret

	displayZodiac:
		PRINT zodiac, 32
		PRINT zodiacDesc, 128
		ret

	exit:
		mov eax, 1
		xor ebx, ebx
		int 0x80


