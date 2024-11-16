section .data
menu db "Georgette Calculator", 0xA
     db "A. Addition", 0xA
     db "B. Subtraction", 0xA
     db "C. Multiplication", 0xA
     db "D. Division", 0xA
     db "Enter your choice: ", 0
invalid_input db "Invalid Input. Try again.", 0xA, 0
prompt1 db "Enter the first digit (0-9): ", 0
prompt2 db "Enter the second digit (0-9): ", 0
result_msg db "The result is: ", 0
output_written db "(Output written to file)", 0xA, 0
try_again db "Try again (Y/N): ", 0
goodbye db "Bye...Thank you for using Georgette Calculator", 0xA, 0
file_name db "georgette_output.txt", 0

section .bss
choice resb 1
num1 resb 1
num2 resb 1
result resb 1
try_again_input resb 1

section .text
global _start

_start:
    ; Display menu
    call display_menu

menu_loop:
    ; Read user choice
    call get_input
    mov [choice], al

    ; Validate and process choice
    call validate_choice
    cmp al, 0
    je invalid_choice

    ; Get two numbers from the user
    call get_two_numbers

    ; Perform operation
    call perform_operation

    ; Display result
    call display_result

    ; Write result to file
    call write_to_file

    ; Ask try again
    call ask_try_again
    cmp byte [try_again_input], 'Y'
    je menu_loop

    ; Exit program
    mov edx, lengoodbye
    mov ecx, goodbye
    call print_string
    jmp exit

invalid_choice:
    ; Handle invalid input
    mov edx, leninvalid_input
    mov ecx, invalid_input
    call print_string
    jmp menu_loop

; Procedure: display_menu
display_menu:
    mov edx, lenmenu
    mov ecx, menu
    call print_string
    ret

; Procedure: validate_choice
validate_choice:
    mov al, [choice]
    cmp al, 'A'
    je valid
    cmp al, 'B'
    je valid
    cmp al, 'C'
    je valid
    cmp al, 'D'
    je valid
    mov al, 0
    ret
valid:
    mov al, 1
    ret

; Procedure: get_two_numbers
get_two_numbers:
    ; Get first number
    mov edx, len prompt1
    mov ecx, prompt1
    call print_string
    call get_input
    sub al, '0'
    mov [num1], al

    ; Get second number
    mov edx, len prompt2
    mov ecx, prompt2
    call print_string
    call get_input
    sub al, '0'
    mov [num2], al
    ret

; Procedure: perform_operation
perform_operation:
    mov al, [choice]
    mov bl, [num1]
    mov cl, [num2]
    cmp al, 'A'
    je add
    cmp al, 'B'
    je subtract
    cmp al, 'C'
    je multiply
    cmp al, 'D'
    je divide
    ret
add:
    add bl, cl
    jmp save_result
subtract:
    sub bl, cl
    jmp save_result
multiply:
    mul cl
    mov bl, al
    jmp save_result
divide:
    xor ah, ah
    div cl
    mov bl, al
    jmp save_result
save_result:
    mov [result], bl
    ret

; Procedure: display_result
display_result:
    mov edx, len result_msg
    mov ecx, result_msg
    call print_string
    mov al, [result]
    add al, '0'
    mov [num1], al
    mov edx, 1
    mov ecx, num1
    call print_string
    mov edx, len output_written
    mov ecx, output_written
    call print_string
    ret

; Procedure: write_to_file
write_to_file:
    ; Implement file writing logic
    ; Placeholder code (requires syscall for file I/O)
    ret

; Procedure: ask_try_again
ask_try_again:
    mov edx, len try_again
    mov ecx, try_again
    call print_string
    call get_input
    mov [try_again_input], al
    ret

; Procedure: get_input
get_input:
    ; Placeholder for input reading
    ret

; Procedure: print_string
print_string:
    ; Syscall to print strings
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

exit:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
