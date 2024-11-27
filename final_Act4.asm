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

%macro APPEND 2
    mov eax, 5
    mov ebx, fileName
    mov ecx, 0x441
    mov edx, 0x1A4
    int 0x80

    mov [fd_out], eax

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, %1
    mov edx, %2
    int 0x80

    mov eax, 6
    mov ebx, [fd_out]
    int 0x80
%endmacro

section .data
    receipt db "==============   --Receipt--   ===============", 0xa
    receiptLen equ $ - receipt

    fileName db "Receipt.txt", 0

    menu db "|A. Rice: Plain Rice             - Php 5.00  |", 0xa
        db "|B. Rice: Java Rice              - Php 10.00 |", 0xa
        db "|C. Ulam 1: Fish                 - Php 35.00 |", 0xa
        db "|D. Ulam 2: Pork                 - Php 50.00 |", 0xa
        db "|E. Ulam 3: Vegetable            - Php 20.00 |", 0xa
        db "|F. Dessert: Saging con yelo     - Php 60.00 |", 0xa
    menuLen equ $ - menu

    orderMenu db "===============Georgette Eatery===============", 0xa
        db "|A. Rice: Plain Rice             - Php 5.00  |", 0xa
        db "|B. Rice: Java Rice              - Php 10.00 |", 0xa
        db "|C. Ulam 1: Fish                 - Php 35.00 |", 0xa
        db "|D. Ulam 2: Pork                 - Php 50.00 |", 0xa
        db "|E. Ulam 3: Vegetable            - Php 20.00 |", 0xa
        db "|F. Dessert: Saging con yelo     - Php 60.00 |", 0xa
        db "==============================================", 0xa
    orderMenuLen equ $ - orderMenu

    choicePrompt db "Enter your order: ", 0
    choicePromptLen equ $ - choicePrompt

    tryAgain db "==============================================", 0xa
            db "Do you want to order again? [Y/N]: ", 0
    tryAgainLen equ $ - tryAgain

    exitMessage db "==============================================", 0xa
                db "|Thank you! Please come again!               |", 0xa
                db "==============================================", 0xa 
    exitMessageLen equ $ - exitMessage

    invalidChoice db "Invalid choice. Please try again.", 0xa
    invalidChoiceLen equ $ - invalidChoice

; order messages
    plainRice db "|You ordered Plain Rice          - Php 5.00  |", 0xa
    plainRiceLen equ $ - plainRice

    javaRice  db "|You ordered Java Rice           - Php 10.00 |", 0xa
    javaRiceLen equ $ - javaRice

    fish      db "|You ordered Fish                - Php 35.00 |", 0xa
    fishLen equ $ - fish

    pork      db "|You ordered Pork                - Php 50.00 |", 0xa
    porkLen equ $ - pork
    
    vegetable db "|You ordered Vegetable           - Php 20.00 |", 0xa
    vegetableLen equ $ - vegetable

    sagingConYelo db "|You ordered Saging con yelo     - Php 60.00 |", 0xa
    sagingConYeloLen equ $ - sagingConYelo

; Receipt message 
    plainRice db "==============================================", 0xa
        db "|Plain Rice                      - Php 5.00  |", 0xa
    plainRiceLen equ $ - plainRice

    javaRice db "==============================================", 0xa
            db "|Java Rice                       - Php 10.00 |", 0xa
    javaRiceLen equ $ - javaRice

    fish db "==============================================", 0xa
        db "|Fish                            - Php 35.00 |", 0xa
    fishLen equ $ - fish

    pork db "==============================================", 0xa
        db "|Pork                            - Php 50.00 |", 0xa
    porkLen equ $ - pork
    
    vegetable db "==============================================", 0xa
            db "|Vegetable                       - Php 20.00 |", 0xa
    vegetableLen equ $ - vegetable

    sagingConYelo db "==============================================", 0xa
                db "|Saging con yelo                 - Php 60.00 |", 0xa
    sagingConYeloLen equ $ - sagingConYelo

    newLine db 0xa
    newLineLen equ $ - newLine
section .bss
    choice resb 2
    fd_out resb 1
section .text
    global _start
_start:
    PRINT menu, menuLen
    PRINT newLine, newLineLen
    PRINT newLine, newLineLen

    call createFile
    call displayMenuLoop
    
    displayMenuLoop:
        PRINT orderMenu, orderMenuLen
        PRINT choicePrompt, choicePromptLen
        READ choice, 2

        cmp byte [choice], 'A'
        je plainRiceDisplay
        cmp byte [choice], 'B'
        je javaRiceDisplay
        cmp byte [choice], 'C'
        je fishDisplay
        cmp byte [choice], 'D'
        je porkDisplay
        cmp byte [choice], 'E'
        je vegetableDisplay
        cmp byte [choice], 'F'
        je sagingConYeloDisplay
        jmp printInvalidChoice

    plainRiceDisplay:
        PRINT plainRice, plainRiceLen
        APPEND plainRice, plainRiceLen
        jmp tryAgainPrompt

    javaRiceDisplay:
        PRINT javaRice, javaRiceLen
        APPEND javaRice, javaRiceLen
        jmp tryAgainPrompt
    
    fishDisplay:
        PRINT fish, fishLen
        APPEND fish, fishLen
        jmp tryAgainPrompt
      
    porkDisplay:
        PRINT pork, porkLen
        APPEND pork, porkLen
        jmp tryAgainPrompt
    
    vegetableDisplay:
        PRINT vegetable, vegetableLen
        APPEND vegetable, vegetableLen
        jmp tryAgainPrompt
    
    sagingConYeloDisplay:
        PRINT sagingConYelo, sagingConYeloLen
        APPEND sagingConYelo, sagingConYeloLen
        jmp tryAgainPrompt
    
    tryAgainPrompt:
        PRINT tryAgain, tryAgainLen
        READ choice, 2
        cmp byte[choice], 'Y'
        je displayMenuLoop
        jmp printExitMessage

    printExitMessage:
        APPEND exitMessage, exitMessageLen
        PRINT exitMessage, exitMessageLen
        jmp exit

    printInvalidChoice:
        PRINT invalidChoice, invalidChoiceLen
        jmp displayMenuLoop
    
    PRINT newLine, newLineLen

    createFile:
        mov eax, 5
        mov ebx, fileName
        mov ecx, 0x41
        mov edx, 0x1A4
        int 0x80

        mov [fd_out], eax

        mov eax, 4
        mov ebx, [fd_out]
        mov ecx, receipt 
        mov edx, receiptLen
        int 0x80

        mov eax, 6
        mov ebx, [fd_out]
        int 0x80
        ret

    exit:
        mov eax, 1
        mov ebx, 0
        int 0x80
