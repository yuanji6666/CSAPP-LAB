.text
.globl _calculate_average
.p2align 2

// Optimized short calculate_average(const short scores[], int count)
// ABI: x0 = scores, w1 = count, return w0
_calculate_average:
    // [opt] Fast guard path: avoid divide-by-zero and useless work.
    cmp     w1, #1
    b.lt    Lret_zero

    // [opt] Bind hot variables to registers (no stack frame):
    // x2 = current pointer, x3 = end pointer for unrolled loop,
    // x4 = total end pointer, w8 = running sum, w9/w10/w11/w12 = temps.
    mov     x2, x0
    uxtw    x4, w1
    add     x4, x0, x4, lsl #1      // x4 = scores + count * sizeof(short)
    mov     w8, wzr                  // sum = 0

    // [opt] Loop unrolling by 4 elements:
    // process 8 bytes per iteration to reduce branch overhead.
    and     w9, w1, #~3              // w9 = count rounded down to multiple of 4
    cbz     w9, Ltail_prepare
    uxtw    x3, w9
    add     x3, x0, x3, lsl #1       // x3 = end pointer of unrolled part

Lloop4:
    // [opt] Post-index loads keep pointer update in load instruction.
    ldrsh   w10, [x2], #2
    ldrsh   w11, [x2], #2
    ldrsh   w12, [x2], #2
    ldrsh   w13, [x2], #2

    // [opt] Accumulate in register only (no memory traffic in loop body).
    add     w8, w8, w10
    add     w8, w8, w11
    add     w8, w8, w12
    add     w8, w8, w13

    cmp     x2, x3
    b.lo    Lloop4

Ltail_prepare:
    // [opt] Tail loop for remaining count % 4 elements.
    cmp     x2, x4
    b.hs    Ldone_sum

Ltail:
    ldrsh   w10, [x2], #2
    add     w8, w8, w10
    cmp     x2, x4
    b.lo    Ltail

Ldone_sum:
    // [opt] Keep division at end only once.
    sdiv    w8, w8, w1
    sxth    w0, w8
    ret

Lret_zero:
    mov     w0, wzr
    ret
