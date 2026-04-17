.text
.globl _calculate_average
.p2align 2

// short calculate_average(const short scores[], int count)
// x0: scores pointer, w1: count
_calculate_average:
    // Guard: if count <= 0, return 0
    cmp     w1, #1
    b.lt    Lret_zero

    mov     w8, wzr        // sum = 0
    mov     w9, wzr        // i = 0

Lloop:
    cmp     w9, w1
    b.ge    Ldone_sum

    ldrsh   w10, [x0, w9, sxtw #1]
    add     w8, w8, w10
    add     w9, w9, #1
    b       Lloop

Ldone_sum:
    sdiv    w8, w8, w1
    sxth    w0, w8
    ret

Lret_zero:
    mov     w0, wzr
    ret
