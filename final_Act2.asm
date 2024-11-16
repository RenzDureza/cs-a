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
    name db "Programed by: Aldrin Renz Dureza", 0xa
    nameLen equ $ - name

    studNum db "Student Number: 202311496", 0xa
    studNumLen equ $ - studNum

    border db "-----------------------------------------------", 0xa
    borderLen equ $ - border

    promptMonth db "Enter birth month (1 - 12): ", 0
    promptMonthLen equ $ - promptMonth

    promptDay db "Enter birth day (1 - 31): ", 0
    promptDayLen equ $ - promptDay

    displayAquariusMsg db "My Zodiac Sign is Aquarius!", 0xa, "Short description of Aquarius:", 0xa, 0x9, "Innovative, independent, and humanitarian, Aquarius seeks to bring change and think outside the box.", 0xa
                        db " .-'-._.-'-._.- ", 0xa
                        db " .-'-._.-'-._.- ", 0xa
    displayAquariusMsgLen equ $ - displayAquariusMsg

    displayPiscesMsg db "My Zodiac Sign is Pisces!", 0xa, "Short description of Pisces:", 0xa, 0x9, "Compassionate, artistic, intuitive, gentle, wise, and musical, Pisces are the most sensitive sign.", 0xa
                    db "     `-.    .-'   ", 0xa
                    db "        :  :      ", 0xa
                    db "      --:--:--    ", 0xa
                    db "        :  :      ", 0xa
                    db "     .-'    `-.   ", 0xa
    displayPiscesMsgLen equ $ - displayPiscesMsg

    displayAriesMsg db "My Zodiac Sign is Aries!", 0xa, "Short description of Aries:", 0xa, 0x9, "Courageous, determined, confident, enthusiastic, optimistic, honest, and passionate, Aries are natural leaders.", 0xa
                    db "   .-.   .-.  ", 0xa
                    db "  (_  \ /  _) ", 0xa 
                    db "       |      ", 0xa
                    db "       |      ", 0xa
    displayAriesMsgLen equ $ - displayAriesMsg

    displayTaurusMsg db "My Zodiac Sign is Taurus!", 0xa, "Short description of Taurus:", 0xa, 0x9, "Reliable, patient, practical, devoted, responsible, and stable, Taurus are the anchor of the Zodiac.", 0xa
                    db"    .     . ", 0xa
                    db"    '.___.' ", 0xa    
                    db"    .'   `. ", 0xa
                    db"   :       :", 0xa
                    db"   :       :", 0xa
                    db"    `.___.' ", 0xa
    displayTaurusMsgLen equ $ - displayTaurusMsg

    displayGeminiMsg db "My Zodiac Sign is Gemini!", 0xa, "Short description of Gemini", 0xa, 0x9, "Gentle, affectionate, curious, adaptable, ability to learn quickly and exchange ideas, Gemini are the life of the party.", 0xa
                    db"    ._____. ", 0xa
                    db"      | |   ", 0xa   
                    db"      | |   ", 0xa
                    db"     _|_|_  ", 0xa
                    db"    '     ' ", 0xa
    displayGeminiMsgLen equ $ - displayGeminiMsg

    displayCancerMsg db "My Zodiac Sign is Cancer", 0xa, "Short description of Cancer:", 0xa, 0x9, "Emotional, group oriented, seeks security, family, and tradition, Cancer are the nurturers of the Zodiac.", 0xa
                    db "      .--.  ", 0xa
                    db "     /   _`.", 0xa  
                    db "    (_) ( ) ", 0xa
                    db "   '.    /  ", 0xa
                    db "     `--'   ", 0xa
    displayCancerMsgLen equ $ - displayCancerMsg

    displayLeoMsg db "My Zodiac Sign is Leo!", 0xa, "Short description of Leo:", 0xa, 0x9, "Generous, organized, protective, beautiful, and charismatic, Leo are the natural leaders of the Zodiac.", 0xa
                db "       .--.  ", 0xa
                db "      (    ) ", 0xa
                db "     (_)  /  ", 0xa
                db "         (_, ", 0xa
    displayLeoMsgLen equ $ - displayLeoMsg

    displayVirgoMsg db "My Zodiac Sign is Virgo!", 0xa, "Short description of Virgo:", 0xa, 0x9, "Practical, loyal, gentle, and analytical, Virgo are the perfectionists of the Zodiac.", 0xa
                    db"    _           ", 0xa
                    db"   ' `:--.--.   ", 0xa
                    db"      |  |  |_  ", 0xa
                    db"      |  |  | ) ", 0xa
                    db"      |  |  |/  ", 0xa
                    db"           (J   ", 0xa
    displayVirgoMsgLen equ $ - displayVirgoMsg

    displayLibraMsg db "My Zodiac Sign is Libra!", 0xa, "Short description of Libra:", 0xa, 0x9, "Social, fair-minded, diplomatic, gracious, and cooperative, Libra are the fair-minded diplomat of the Zodiac.", 0xa
                    db "     __     ", 0xa
                    db "___.'  '.___", 0xa
                    db "____________", 0xa
    displayLibraMsgLen equ $ - displayLibraMsg

    displayScorpioMsg db "My Zodiac Sign is Scorpio!", 0xa, "Short description of Scorpio:", 0xa, 0x9, "Passionate, stubborn, resourceful, brave, and a true friend, Scorpio are the friend everyone needs.", 0xa
                    db "   _             ", 0xa
                    db "  ' `:--.--.     ", 0xa
                    db "     |  |  |     ", 0xa      
                    db "     |  |  |     ", 0xa
                    db "     |  |  |  ..,", 0xa
                    db "           `---':", 0xa
    displayScorpioMsgLen equ $ - displayScorpioMsg

    displaySagittariusMsg db "My Zodiac Sign is Sagittarius!", 0xa, "Short description of Sagittarius:", 0xa, 0x9, "Generous, idealistic, great sense of humor, Sagittarius are the travelers of the Zodiac.", 0xa
                        db "            ... ", 0xa
                        db "           .':  ", 0xa     
                        db "         .'     ", 0xa
                        db "     `..'       ", 0xa
                        db "    .'`.        ", 0xa
    displaySagittariusMsgLen equ $ - displaySagittariusMsg

    displayCapricornMsg db "My Zodiac Sign is Capricorn!", 0xa, "Short description of Capricorn:", 0xa, 0x9, "Responsible, disciplined, self-control, good managers, Capricorn are the masters of self-control and have the ability to lead the way.", 0xa
                        db "            _  ", 0xa
                        db "    \      /_) ", 0xa
                        db "     \    /`.  ", 0xa
                        db "      \  /   ; ", 0xa
                        db "       \/ __.' ", 0xa
    displayCapricornMsgLen equ $ - displayCapricornMsg

    invalidMonthMsg db "Invalid month!", 0xa
    invalidMonthMsgLen equ $ - invalidMonthMsg
    
section .bss
    month resb 5
    day resb 5
section .text
    global _start
_start:
    call credentials
    call promptIO
    call janCheck
    jmp exit

    credentials:
        PRINT name, nameLen
        PRINT studNum, studNumLen
        PRINT border, borderLen
        ret

    promptIO:
        PRINT promptMonth, promptMonthLen
        READ month, 5

        PRINT promptDay, promptDayLen
        READ day, 5

        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, '10'
        add eax, ebx
        ret 

    janCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, '10'
        add eax, ebx
        
        cmp eax, 1
        je january
        jmp febCheck

    febCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 2
        je february
        jmp marCheck

    marCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 3
        je march
        jmp aprCheck

    aprCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 4
        je april
        jmp mayCheck

    mayCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 5
        je may
        jmp junCheck
        
    junCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 6
        je june
        jmp julCheck

    julCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 7
        je july
        jmp augCheck

    augCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 8
        je august
        jmp sepCheck
        
    sepCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 9
        je september
        jmp octCheck

    octCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 10
        je october
        jmp novCheck

    novCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 11
        je november
        jmp decCheck

    decCheck:
        movzx eax, byte[month]
        sub eax, '0'

        movzx ebx, byte[month + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 12
        je december
        jmp invalidMonth
    
    january:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 20
        jg displayAquarius
        jmp displayCapricorn

    february:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 18
        jg displayPisces
        jmp displayAquarius

    march:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 20
        jg displayPisces
        jmp displayAries
        
    april:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 19
        jg displayTaurus
        jmp displayAries

    may:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 20
        jg displayGemini
        jmp displayTaurus

    june:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 20
        jg displayCancer
        jmp displayGemini

    july:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 22
        jg displayLeo
        jmp displayCancer

    august:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 22
        jg displayVirgo
        jmp displayLeo
        
    september:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 22
        jg displayLibra
        jmp displayVirgo

    october:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 22
        jg displayScorpio
        jmp displayLibra

    november:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 21
        jg displaySagittarius
        jmp displayScorpio

    december:
        movzx eax, byte[day]
        sub eax, '0'

        movzx ebx, byte[day + 1]
        sub ebx, '0'

        imul eax, 10
        add eax, ebx

        cmp eax, 21
        jg displayCapricorn
        jmp displaySagittarius

    displayAquarius:
        PRINT displayAquariusMsg, displayAquariusMsgLen
        jmp exit

    displayPisces:
        PRINT displayPiscesMsg, displayPiscesMsgLen
        jmp exit

    displayAries:
        PRINT displayAriesMsg, displayAriesMsgLen
        jmp exit

    displayTaurus:
        PRINT displayTaurusMsg, displayTaurusMsgLen
        jmp exit

    displayGemini:
        PRINT displayGeminiMsg, displayGeminiMsgLen
        jmp exit

    displayCancer:
        PRINT displayCancerMsg, displayCancerMsgLen
        jmp exit

    displayLeo:
        PRINT displayLeoMsg, displayLeoMsgLen
        jmp exit
        
    displayVirgo:
        PRINT displayVirgoMsg, displayVirgoMsgLen
        jmp exit

    displayLibra:
        PRINT displayLibraMsg, displayLibraMsgLen
        jmp exit

    displayScorpio:
        PRINT displayScorpioMsg, displayScorpioMsgLen
        jmp exit

    displaySagittarius:
        PRINT displaySagittariusMsg, displaySagittariusMsgLen
        jmp exit

    displayCapricorn:
        PRINT displayCapricornMsg, displayCapricornMsgLen
        jmp exit

    invalidMonth:
        PRINT invalidMonthMsg, invalidMonthMsgLen
        jmp exit

    exit:
        mov eax, 1
        xor ebx, ebx
        int 0x80
        ret
