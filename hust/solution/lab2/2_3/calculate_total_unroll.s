2# Optimized calculate_total with loop unrolling
# short calculate_total(const short scores[], int count)
# rdi = scores pointer
# esi = count

.text
.globl calculate_total
.type calculate_total, @function

calculate_total:
    test    %esi, %esi
    jle     .L_zero

    xor     %eax, %eax
    xor     %ecx, %ecx
    mov     %esi, %r8d
    and     $-4, %r8d

.L_loop:
    cmp     %r8d, %ecx
    jge     .L_tail

    movswl  (%rdi,%rcx,2), %edx
    add     %edx, %eax
    movswl  2(%rdi,%rcx,2), %edx
    add     %edx, %eax
    movswl  4(%rdi,%rcx,2), %edx
    add     %edx, %eax
    movswl  6(%rdi,%rcx,2), %edx
    add     %edx, %eax
    add     $4, %ecx
    jmp     .L_loop

.L_tail:
    cmp     %esi, %ecx
    jge     .L_done

    movswl  (%rdi,%rcx,2), %edx
    add     %edx, %eax
    add     $1, %ecx
    jmp     .L_tail

.L_done:
    cltq
    ret

.L_zero:
    xor     %eax, %eax
    ret

.size calculate_total, .-calculate_total

.section .note.GNU-stack,"",@progbits
