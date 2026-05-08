# calculate_total assembly implementation
# short calculate_total(const short scores[], int count)
# rdi = scores pointer (first param)
# esi = count (second param)
# return value in rax

.global calculate_total
.text

calculate_total:
    test    %edi, %edi          # if (count <= 0)
    jle     .L_zero              # return 0
    xor     %eax, %eax           # sum = 0
    xor     %ecx, %ecx           # i = 0
    
.L_loop:
    cmp     %edi, %ecx           # compare i with count
    jge     .L_done              # if i >= count, exit loop
    
    movswl  (%rdi,%rcx,2), %r8d  # load scores[i] (sign extend)
    add     %r8d, %eax           # sum += scores[i]
    addl    $1, %ecx             # i++
    
    jmp     .L_loop
    
.L_done:
    movsxd  %eax, %rax           # sign extend int result to 64-bit
    ret
    
.L_zero:
    xor     %eax, %eax           # return 0
    ret
