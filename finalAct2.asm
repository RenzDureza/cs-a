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
    name db "Program by: Aldrin Renz Dureza", 0
    nameLen equ $-name
    studNum db "Student Number: Your student number", 0
    studNumLen equ $-studNum
    promptMonth db "Enter your birth month (1-12): ", 0
    promptMonthLen equ $-promptMonth
    promptBday db "Enter your birthday (1-31): ", 0
    promptBdayLen equ $-promptBday

    ; Zodiac signs and descriptions
    aries db "My Zodiac Sign is Aries", 0
	ariesLen equ $-aries
    ariesDesc db "Short description of Aries: No filter, easily bored, and will do anything on a dare.", 0
	ariesDescLen equ $-ariesDesc

    taurus db "My Zodiac Sign is Taurus", 0
	taurusLen equ $-taurus
    taurusDesc db "Short description of Taurus: Reliable, patient, practical, devoted, responsible, stable.", 0
    taurusDescLen equ $-taurusDesc

	gemini db "My Zodiac Sign is Gemini", 0
	geminiLen equ $-gemini
    geminiDesc db "Short description of Gemini: Gentle, affectionate, curious, adaptable, ability to learn quickly and exchange ideas.", 0
    geminiDescLen equ $-geminiDesc

	cancer db "My Zodiac Sign is Cancer", 0
	cancerLen equ $-cancer
    cancerDesc db "Short description of Cancer: Tenacious, highly imaginative, loyal, emotional, sympathetic, persuasive.", 0
    cancerDescLen equ $-cancerDesc

	leo db "My Zodiac Sign is Leo", 0
	leoLen equ $-leo
    leoDesc db "Short description of Leo: Creative, passionate, generous, warm-hearted, cheerful, humorous.", 0
    leoDescLen equ $-leoDesc

	virgo db "My Zodiac Sign is Virgo", 0
	virgoLen equ $-virgo
    virgoDesc db "Short description of Virgo: Loyal, analytical, kind, hardworking, practical.", 0
    virgoDescLen equ $-virgoDesc

	libra db "My Zodiac Sign is Libra", 0
	libraLen equ $-libra
    libraDesc db "Short description of Libra: Cooperative, diplomatic, gracious, fair-minded, social.", 0
    libraDescLen equ $-libraDesc

	scorpio db "My Zodiac Sign is Scorpio", 0
	scorpioLen equ $-scorpio
    scorpioDesc db "Short description of Scorpio: Resourceful, brave, passionate, stubborn, a true friend.", 0
    scorpioDescLen equ $-scorpioDesc

	sagittarius db "My Zodiac Sign is Sagittarius", 0
	sagittariusLen equ $-sagittarius
    sagittariusDesc db "Short description of Sagittarius: Generous, idealistic, great sense of humor.", 0
    sagittariusDescLen equ $-sagittariusDesc

	capricorn db "My Zodiac Sign is Capricorn", 0
	capricornLen equ $-capricorn
    capricornDesc db "Short description of Capricorn: Responsible, disciplined, self-control, good managers.", 0
    capricornDescLen equ $-capricornDesc

	aquarius db "My Zodiac Sign is Aquarius", 0
	aquariusLen equ $-aquarius
    aquariusDesc db "Short description of Aquarius: Progressive, original, independent, humanitarian.", 0
    aquariusDescLen equ $-aquariusDesc

	pisces db "My Zodiac Sign is Pisces", 0
	piscesLen equ $-pisces
    piscesDesc db "Short description of Pisces: Compassionate, artistic, intuitive, gentle, wise, musical.", 0
	piscesDescLen equ $-piscesDesc

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
    call determineZodiac
    call displayZodiac
    call exit

	dispInfo:
		PRINT name, nameLen
		PRINT studNum, studNumLen
		ret

	userIO:
		PRINT promptMonth, promptMonthLen
		READ month, 32
		PRINT promptBday, promptBdayLen
		READ day, 32
		ret

	determineZodiac:
		mov eax, [month]
		mov ebx, [day]

		; Check for Aries (March 21 - April 19)
		cmp eax, 3
		jne .checkApril
		cmp ebx, 21
		jl .nextZodiac
		jmp .setAries

	.checkApril:
		cmp eax, 4
		jne .checkTaurus
		cmp ebx, 19
		jg .nextZodiac

	.setAries:
		mov edi, aries
		mov esi, ariesDesc
		jmp .setZodiac

	.checkTaurus:
		; Check for Taurus (April 20 - May 20)
		cmp eax, 4
		jne .checkMay
		cmp ebx, 20
		jl .nextZodiac
		jmp .setTaurus

	.checkMay:
		cmp eax, 5
		jne .checkGemini
		cmp ebx, 20
		jg .nextZodiac

	.setTaurus:
		mov edi, taurus
		mov esi, taurusDesc
		jmp .setZodiac

	.checkGemini:
		; Check for Gemini (May 21 - June 20)
		cmp eax, 5
		jne .checkJune
		cmp ebx, 21
		jl .nextZodiac
		jmp .setGemini

	.checkJune:
		cmp eax, 6
		jne .checkCancer
		cmp ebx, 20
		jg .nextZodiac

	.setGemini:
		mov edi, gemini
		mov esi, geminiDesc
		jmp .setZodiac

	.checkCancer:
		; Check for Cancer (June 21 - July 22)
		cmp eax, 6
		jne .checkJuly
		cmp ebx, 21
		jl .nextZodiac
		jmp .setCancer

	.checkJuly:
		cmp eax, 7
		jne .checkLeo
		cmp ebx, 22
		jg .nextZodiac

	.setCancer:
		mov edi, cancer
		mov esi, cancerDesc
		jmp .setZodiac

	.checkLeo:
		; Check for Leo (July 23 - August 22)
		cmp eax, 7
		jne .checkAugust
		cmp ebx, 23
		jl .nextZodiac
		jmp .setLeo

	.checkAugust:
		cmp eax, 8
		jne .checkVirgo
		cmp ebx, 22
		jg .nextZodiac

	.setLeo:
		mov edi, leo
		mov esi, leoDesc
		jmp .setZodiac

	.checkVirgo:
		; Check for Virgo (August 23 - September 22)
		cmp eax, 8
		jne .checkSeptember
		cmp ebx, 23
		jl .nextZodiac
		jmp .setVirgo

	.checkSeptember:
		cmp eax, 9
		jne .checkLibra
		cmp ebx, 22
		jg .nextZodiac

	.setVirgo:
		mov edi, virgo
		mov esi, virgoDesc
		jmp .setZodiac

	.checkLibra:
		; Check for Libra (September 23 - October 22)
		cmp eax, 9
		jne .checkOctober
		cmp ebx, 23
		jl .nextZodiac
		jmp .setLibra

	.checkOctober:
		cmp eax, 10
		jne .checkScorpio
		cmp ebx, 22
		jg .nextZodiac

	.setLibra:
		mov edi, libra
		mov esi, libraDesc
		jmp .setZodiac

	.checkScorpio:
		; Check for Scorpio (October 23 - November 21)
		cmp eax, 10
		jne .checkNovember
		cmp ebx, 23
		jl .nextZodiac
		jmp .setScorpio

	.checkNovember:
		cmp eax, 11
		jne .checkSagittarius
		cmp ebx, 21
		jg .nextZodiac

	.setScorpio:
		mov edi, scorpio
		mov esi, scorpioDesc
		jmp .setZodiac

	.checkSagittarius:
		; Check for Sagittarius (November 22 - December 21)
		cmp eax, 11
		jne .checkDecember
		cmp ebx, 22
		jl .nextZodiac
		jmp .setSagittarius

	.checkDecember:
		cmp eax, 12
		jne .checkCapricorn
		cmp ebx, 21
		jg .nextZodiac

	.setSagittarius:
		mov edi, sagittarius
		mov esi, sagittariusDesc
		jmp .setZodiac

	.checkCapricorn:
		; Check for Capricorn (December 22 - January 19)
		cmp eax, 12
		jne .checkJanuary
		cmp ebx, 22
		jl .nextZodiac
		jmp .setCapricorn

	.checkJanuary:
		cmp eax, 1
		jne .checkAquarius
		cmp ebx, 19
		jg .nextZodiac

	.setCapricorn:
		mov edi, capricorn
		mov esi, capricornDesc
		jmp .setZodiac

	.checkAquarius:
		; Check for Aquarius (January 20 - February 18)
		cmp eax, 1
		jne .checkFebruary
		cmp ebx, 20
		jl .nextZodiac
		jmp .setAquarius

	.checkFebruary:
		cmp eax, 2
		jne .checkPisces
		cmp ebx, 18
		jg .nextZodiac

	.setAquarius:
		mov edi, aquarius
		mov esi, aquariusDesc
		jmp .setZodiac

	.checkPisces:
		; Check for Pisces (February 19 - March 20)
		cmp eax, 2
		jne .checkMarch
		cmp ebx, 19
		jl .nextZodiac
		jmp .setPisces

	.checkMarch:
		cmp eax, 3
		jne .default
		cmp ebx, 20
		jg .nextZodiac

	.setPisces:
		mov edi, pisces
		mov esi, piscesDesc
		jmp .setZodiac

	.default:
		; Default case if no zodiac sign matches
		mov edi, pisces
		mov esi, piscesDesc

	.setZodiac:
		; Copy zodiac sign to zodiac buffer
		mov edi, zodiac
		mov ecx, 32
		rep movsb

		; Copy zodiac description to zodiacDesc buffer
		mov edi, zodiacDesc
		mov esi, zodiacDesc
		mov ecx, 128
		rep movsb
		ret
			
