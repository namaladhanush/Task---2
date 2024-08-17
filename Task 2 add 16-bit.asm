org 100h

num1 dw 0123h
num2 dw 0456h


start:
    mov ax, num1
    add ax, num2
    
    mov bl, ah
    and bl, 0F0h
    shr bl, 4
    add bl, 30h
    cmp bl, 39h
    jle print_first_digit_high
    add bl, 7

print_first_digit_high:
    mov dl, bl
    mov ah, 02h
    int 21h
    
    mov bl, ah
    and bl, 0Fh
    add bl, 30h
    cmp bl, 39h
    jle print_second_digit_high
    add bl, 7

print_second_digit_high:
    mov dl, bl
    mov ah, 02h
    int 21h

    mov bl, al
    and bl, 0F0h
    shr bl, 4
    add bl, 30h
    cmp bl, 39h
    jle print_first_digit_low
    add bl, 7

print_first_digit_low:
    mov dl, bl
    mov ah, 02h
    int 21h
    
    mov bl, al
    and bl, 0Fh
    add bl, 30h
    cmp bl, 39h
    jle print_second_digit_low
    add bl, 7

print_second_digit_low:
    mov dl, bl
    mov ah, 02h
    int 21h
    
    mov ah, 4Ch
    int 21h
    
ret

