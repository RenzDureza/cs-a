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
    ; Convert month and day to integers
    mov eax, [month]
    sub eax, '0'
    mov [month], eax
    mov eax, [day]
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
    jne .notTaurus
    cmp ebx, 19
    ja .notTaurus
    PRINT aries, ariesLen
    PRINT ariesDesc, ariesDescLen
    jmp .setZodiac
.notTaurus:
    cmp eax, 4
    jne .notTaurus2
    cmp ebx, 20
    jb .notTaurus2
    PRINT taurus, taurusLen
	PRINT taurusDesc, taurusDescLen
    jmp .setZodiac
.notTaurus2:
    cmp eax, 5
    jne .notGemini
    cmp ebx, 20
    ja .notGemini
    PRINT taurus, taurusLen
	PRINT taurusDesc, taurusDescLen
    jmp .setZodiac
.notGemini:
    cmp eax, 5
    jne .notGemini2
    cmp ebx, 21
    jb .notGemini2
	PRINT gemini, geminiLen
	PRINT geminiDesc, geminiDescLen
    jmp .setZodiac
.notGemini2:
    cmp eax, 6
    jne .notCancer
    cmp ebx, 20
    ja .notCancer
    PRINT gemini, geminiLen
	PRINT geminiDesc, geminiDescLen
    jmp .setZodiac
.notCancer:
    cmp eax, 6
    jne .notCancer2
    cmp ebx, 21
    jb .notCancer2
    PRINT cancer, cancerLen
	PRINT cancerDesc, cancerDescLen
    jmp .setZodiac
.notCancer2:
    cmp eax, 7
    jne .notLeo
    cmp ebx, 22
    ja .notLeo
    PRINT cancer, cancerLen
	PRINT cancerDesc, cancerDescLen
    jmp .setZodiac
.notLeo:
    cmp eax, 7
    jne .notLeo2
    cmp ebx, 23
    jb .notLeo2
    PRINT leo, leoLen
	PRINT leoDesc, leoDescLen
    jmp .setZodiac
.notLeo2:
    cmp eax, 8
    jne .notVirgo
    cmp ebx, 22
    ja .notVirgo
    PRINT leo, leoLen
	PRINT leoDesc, leoDescLen
    jmp .setZodiac
.notVirgo:
    cmp eax, 8
    jne .notVirgo2
    cmp ebx, 23
    jb .notVirgo2
    PRINT virgo, virgoLen
	PRINT virgoDesc, virgoDescLen
    jmp .setZodiac
.notVirgo2:
    cmp eax, 9
    jne .notLibra
    cmp ebx, 22
    ja .notLibra
    PRINT virgo, virgoLen
	PRINT virgoDesc, virgoDescLen
    jmp .setZodiac
.notLibra:
    cmp eax, 9
    jne .notLibra2
    cmp ebx, 23
    jb .notLibra2
    PRINT libra, libraLen
	PRINT libraDesc, libraDescLen
    jmp .setZodiac
.notLibra2:
    cmp eax, 10
    jne .notScorpio
    cmp ebx, 22
    ja .notScorpio
    PRINT libra, libraLen
	PRINT libraDesc, libraDescLen
    jmp .setZodiac
.notScorpio:
    cmp eax, 10
    jne .notScorpio2
    cmp ebx, 23
    jb .notScorpio2
    PRINT scorpio, scorpioLen
	PRINT scorpioDesc, scorpioDescLen
    jmp .setZodiac
.notScorpio2:
    cmp eax, 11
    jne .notSagittarius
    cmp ebx, 21
    ja .notSagittarius
    PRINT scorpio, scorpioLen
	PRINT scorpioDesc, scorpioDescLen
    jmp .setZodiac
.notSagittarius:
    cmp eax, 11
    jne .notSagittarius2
    cmp ebx, 22
    jb .notSagittarius2
    PRINT sagittarius, sagittariusLen
	PRINT sagittariusDesc, sagittariusDescLen
    jmp .setZodiac
.notSagittarius2:
    cmp eax, 12
    jne .notCapricorn
    cmp ebx, 21
    ja .notCapricorn
    PRINT sagittarius, sagittariusLen
	PRINT sagittariusDesc, sagittariusDescLen
    jmp .setZodiac
.notCapricorn:
    cmp eax, 12
    jne .notCapricorn2
    cmp ebx, 22
    jb .notCapricorn2
    PRINT capricorn, capricornLen
	PRINT capricornDesc, capricornDescLen
    jmp .setZodiac
.notCapricorn2:
    cmp eax, 1
    jne .notAquarius
    cmp ebx, 19
    ja .notAquarius
    PRINT capricorn, capricornLen
	PRINT capricornDesc, capricornDescLen
    jmp .setZodiac
.notAquarius:
    cmp eax, 1
    jne .notAquarius2
    cmp ebx, 20
    jb .notAquarius2
    PRINT aquarius, aquariusLen
	PRINT aquariusDesc, aquariusDescLen
    jmp .setZodiac
.notAquarius2:
    cmp eax, 2
    jne .notPisces
    cmp ebx, 18
    ja .notPisces
    PRINT aquarius, aquariusLen
	PRINT aquariusDesc, aquariusDescLen
    jmp .setZodiac
.notPisces:
    cmp eax, 2
    jne .notPisces2
    cmp ebx, 19
    jb .notPisces2
    PRINT pisces, piscesLen
	PRINT piscesDesc, piscesDescLen
    jmp .setZodiac
.notPisces2:
    cmp eax, 3
    jne .default
    cmp ebx, 20
    ja .default
    PRINT pisces, piscesLen
	PRINT piscesDesc, piscesDescLen
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

displayZodiac:
    PRINT zodiac, 32
    PRINT zodiacDesc, 128
    ret

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80