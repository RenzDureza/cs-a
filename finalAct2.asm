section .data
    prompt_month db "Enter birth month (1 - 12): ", 0
    prompt_month_len equ $ - prompt_month
    prompt_day db "Enter birth day (1 - 31): ", 0
    prompt_day_len equ $ - prompt_day
    msg_aries db "You are Aries!", 10, 0
    msg_taurus db "You are Taurus!", 10, 0
    msg_gemini db "You are Gemini!", 10, 0
    msg_cancer db "You are Cancer!", 10, 0
    msg_leo db "You are Leo!", 10, 0
    msg_virgo db "You are Virgo!", 10, 0
    msg_libra db "You are Libra!", 10, 0
    msg_scorpio db "You are Scorpio!", 10, 0
    msg_sagittarius db "You are Sagittarius!", 10, 0
    msg_capricorn db "You are Capricorn!", 10, 0
    msg_aquarius db "You are Aquarius!", 10, 0
    msg_pisces db "You are Pisces!", 10, 0

section .bss
    month resb 3       ; Reserve 3 bytes for month input (to handle 2 digits and null terminator)
    day resb 3         ; Reserve 3 bytes for day input (to handle 2 digits and null terminator)

section .text
    global _start

_start:
    ; Prompt for birth month
    mov eax, 4               ; sys_write syscall
    mov ebx, 1               ; file descriptor (stdout)
    mov ecx, prompt_month
    mov edx, prompt_month_len ; length of the string
    int 0x80                 ; make syscall

    ; Read month input from user (up to 2 characters)
    mov eax, 3               ; sys_read syscall
    mov ebx, 0               ; file descriptor (stdin)
    mov ecx, month           ; store input in 'month' variable
    mov edx, 3               ; read up to 3 bytes (2 digits and newline)
    int 0x80                 ; make syscall

    ; Strip newline from month input (if present)
    mov al, byte [month + 2]  ; check for newline (ASCII 0x0A)
    cmp al, 0x0A
    je strip_newline_month
    jmp month_to_decimal      ; skip newline check if not found

strip_newline_month:
    mov byte [month + 2], 0   ; replace newline with null terminator

month_to_decimal:
    xor ebx, ebx             ; clear ebx for month result
    mov ecx, 0               ; index to start at first character
month_loop:
    mov al, byte [month + ecx]
    cmp al, 0                ; check for null terminator (end of input)
    je day_prompt            ; if null, move to day input
    sub al, '0'              ; convert ASCII to numeric
    imul ebx, ebx, 10        ; multiply existing number by 10
    add ebx, eax             ; add the new digit
    inc ecx                  ; move to the next character
    jmp month_loop

day_prompt:
    ; Prompt for birth day
    mov eax, 4               ; sys_write syscall
    mov ebx, 1               ; file descriptor (stdout)
    mov ecx, prompt_day
    mov edx, prompt_day_len  ; length of the string
    int 0x80                 ; make syscall

    ; Read day input from user (up to 2 characters)
    mov eax, 3               ; sys_read syscall
    mov ebx, 0               ; file descriptor (stdin)
    mov ecx, day             ; store input in 'day' variable
    mov edx, 3               ; read up to 3 bytes (2 digits and newline)
    int 0x80                 ; make syscall

    ; Strip newline from day input (if present)
    mov al, byte [day + 2]    ; check for newline (ASCII 0x0A)
    cmp al, 0x0A
    je strip_newline_day
    jmp day_to_decimal        ; skip newline check if not found

strip_newline_day:
    mov byte [day + 2], 0     ; replace newline with null terminator

day_to_decimal:
    xor ecx, ecx             ; clear ecx for day result
    mov edx, 0               ; index to start at first character
day_loop:
    mov al, byte [day + edx]
    cmp al, 0                ; check for null terminator (end of input)
    je zodiac_check          ; if null, proceed to zodiac check
    sub al, '0'              ; convert ASCII to numeric
    imul ecx, ecx, 10        ; multiply existing number by 10
    add ecx, eax             ; add the new digit
    inc edx                  ; move to the next character
    jmp day_loop

zodiac_check:
    ; Debugging print to verify month and day
    ; Display month (ebx) and day (ecx) for debugging
    mov eax, 4               ; sys_write syscall
    mov ebx, 1               ; file descriptor (stdout)
    mov ecx, month           ; pointer to month string
    mov edx, 3               ; print the month number
    int 0x80

    mov eax, 4               ; sys_write syscall
    mov ebx, 1               ; file descriptor (stdout)
    mov ecx, day             ; pointer to day string
    mov edx, 3               ; print the day number
    int 0x80

    ; Now check for the zodiac sign based on month and day
    ; Default to Capricorn
    mov edx, msg_capricorn

    ; January (1)
    cmp ebx, 1
    je january_check
    ; February (2)
    cmp ebx, 2
    je february_check
    ; March (3)
    cmp ebx, 3
    je march_check
    ; April (4)
    cmp ebx, 4
    je april_check
    ; May (5)
    cmp ebx, 5
    je may_check
    ; June (6)
    cmp ebx, 6
    je june_check
    ; July (7)
    cmp ebx, 7
    je july_check
    ; August (8)
    cmp ebx, 8
    je august_check
    ; September (9)
    cmp ebx, 9
    je september_check
    ; October (10)
    cmp ebx, 10
    je october_check
    ; November (11)
    cmp ebx, 11
    je november_check
    ; December (12)
    cmp ebx, 12
    je december_check
    jmp display              ; skip to display if no month match

january_check:
    cmp ecx, 20
    jl display_capricorn
    jmp display_aquarius

february_check:
    cmp ecx, 19
    jle display_aquarius
    jmp display_pisces

march_check:
    cmp ecx, 21
    jl display_pisces
    jmp display_aries

april_check:
    cmp ecx, 20
    jl display_aries
    jmp display_taurus

may_check:
    cmp ecx, 21
    jl display_taurus
    jmp display_gemini

june_check:
    cmp ecx, 21
    jl display_gemini
    jmp display_cancer

july_check:
    cmp ecx, 23
    jl display_cancer
    jmp display_leo

august_check:
    cmp ecx, 23
    jl display_leo
    jmp display_virgo

september_check:
    cmp ecx, 23
    jl display_virgo
    jmp display_libra

october_check:
    cmp ecx, 23
    jl display_libra
    jmp display_scorpio

november_check:
    cmp ecx, 22
    jl display_scorpio
    jmp display_sagittarius

december_check:
    cmp ecx, 22
    jl display_sagittarius
    jmp display_capricorn

display:
    ; Output the result message
    mov eax, 4               ; sys_write syscall
    mov ebx, 1               ; file descriptor (stdout)
    int 0x80                 ; make syscall

    ; Exit the program
    mov eax, 1               ; sys_exit syscall
    xor ebx, ebx             ; exit code 0
    int 0x80                 ; make syscall
