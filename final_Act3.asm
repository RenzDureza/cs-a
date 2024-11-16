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

%macro CREATE 3
    mov  eax, 8
    mov  ebx, %1
    mov  ecx, 644       
    int  0x80

    mov [fd_out], eax

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, %2
    mov edx, %3
    int 0x80

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, result
    mov edx, 1
    int 0x80
%endmacro

section .data
    menu db "+--------Georgette Calculator--------+", 0xa
            db ": A. Add                              :", 0xa, 0xa
            db ": B. Subtract                         :", 0xa, 0xa
            db ": C. Multiply                         :", 0xa, 0xa
            db ": D. Divide                           :", 0xa, 0xa
            db "+------------------------------------+", 0xa
    menuLen equ $ - menu

    choicePrompt db "Enter your choice: ", 0
    choicePromptLen equ $ - choicePrompt

    num1Int db "Enter the first number: ", 0
    num1IntLen equ $ - num1Int
    num2Int db "Enter the second number: ", 0
    num2IntLen equ $ - num2Int

    resultAdd db 0xa, "The Sum is: ", 0
    resultAddLen equ $ - resultAdd
    resultSub db "The Difference is: ", 0
    resultSubLen equ $ - resultSub
    resultMul db "The Product is: ", 0
    resultMulLen equ $ - resultMul
    resultDiv db "The Quotient is: ", 0
    resultDivLen equ $ - resultDiv

    again db "Try again (Y/N): ", 0
    againLen equ $ - again

    invalidInput db "Invalid Input", 0xa
    invalidLen equ $ - invalidInput

    singleDigit db "Enter two single-digit numbers (both between 0 - 9)", 0xa
    singleDigitLen equ $ - singleDigit

    newLine db 0xa
    newLineLen equ $ - newLine

    fileName db "Georgette Calculator.txt", 0

    goodbye db "Bye... Thank you for using Georgette Calculator", 0xa
    goodbyeLen equ $ - goodbye
section .bss
    num1 resb 5
    num2 resb 5
    result resb 5
    choice resb 5
    tryAgain resb 5
    fd_in resb 1
    fd_out resb 1
section .text
    global _start

_start:
    call displayMenuLoop

    displayMenuLoop:
        PRINT menu, menuLen
        PRINT choicePrompt, choicePromptLen
        READ choice, 5
        cmp byte[choice], 'A'
        je add
        cmp byte[choice], 'B'
        je sub
        cmp byte[choice], 'C'
        je mul
        cmp byte[choice], 'D'
        je div
        jmp invalidChoice

    add:
        call getTwoNumbers
        mov eax, [num1]
        mov ebx, [num2]

        sub eax, '0'
        sub ebx, '0'
        
        add eax, ebx
        add eax, '0'

        mov [result], eax
        PRINT resultAdd, resultAddLen
        PRINT result, 5
        PRINT newLine, newLineLen
        CREATE fileName, resultAdd, resultAddLen
        jmp againPrompt
    
    sub:
        call getTwoNumbers
        movzx eax, byte[num1]
        movzx ebx, byte[num2]

        sub eax, '0'
        sub ebx, '0'
        
        sub eax, ebx
        add eax, '0'
        mov [result], eax
        PRINT resultSub, resultSubLen
        PRINT result, 5
        PRINT newLine, newLineLen
        CREATE fileName, resultSub, resultSubLen
        jmp againPrompt

    mul:
        call getTwoNumbers
        mov al, byte[num1]
        sub al, '0'

        mov bl, byte[num2]
        sub bl, '0'

        mul bl
        add al, '0'
        mov [result], al

        PRINT resultMul, resultMulLen
        PRINT result, 5
        PRINT newLine, newLineLen
        CREATE fileName, resultMul, resultMulLen
        jmp againPrompt
    
    div:
        call getTwoNumbers
        mov al, byte[num1]
        mov bl, byte[num2]

        mov ah, 0
        mov dx, 0

        sub al, '0'
        sub bl, '0'

        div bl
        add al, '0'
        mov byte[result], al
        PRINT resultDiv, resultDivLen
        PRINT result, 1
        PRINT newLine, newLineLen
        CREATE fileName, resultDiv, resultDivLen
        jmp againPrompt
    
    invalidChoice:
        PRINT invalidInput, invalidLen
        PRINT newLine, newLineLen
        jmp againPrompt
    
    againPrompt:
        PRINT again, againLen
        READ tryAgain, 5
        cmp byte [tryAgain], 'Y'
        je displayMenuLoop
        cmp byte [tryAgain], 'N'
        call goodbyeMsg
        je exit
        jmp invalidChoice

    getTwoNumbers:
        PRINT num1Int, num1IntLen
        READ num1, 5
        cmp byte[num1], '1'
        jl invalidInput
        cmp byte[num1], '9'
        jg invalidInput

        PRINT num2Int, num2IntLen
        READ num2, 5
        cmp byte[num2], '1'
        jl invalidInput
        cmp byte[num2], '9'
        jg invalidInput
        ret
    
    goodbyeMsg:
        PRINT goodbye, goodbyeLen
    
    exit:
        mov eax, 1
        xor ebx, ebx
        int 0x80

    



