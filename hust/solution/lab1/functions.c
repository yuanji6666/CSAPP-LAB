/*
按照要求完成给定的功能，并自动判断程序的运行结果是否正确。（从逻辑电路与门、或门、非门等等角度，实现CPU的常见功能。所谓自动判断，即用简单的方式实现指定功能，并判断两个函数的输出是否相同。）

(1) int absVal(int x);      返回 x 的绝对值
仅使用 !、 ~、 &、 ^、 |、 +、 <<、 >>， 运算次数不超过 10次
判断函数： int absVal_standard(int x)  { return (x < 0) ? -x : x;}

(2) int negate(int x);      不使用负号，实现 -x
判断函数： int netgate_standard(int x)  { return -x;}

(3) int bitAnd(int x, int y);  仅使用 ~ 和 |，实现 &
判断函数： int bitAnd_standard(int x, int y)  { return x & y;}

(4) int bitOr(int x, int y);    仅使用 ~ 和 &，实现 |

(5) int bitXor(int x, int y);   仅使用 ~ 和 &，实现 ^

(6) int isTmax(int x);    判断x是否为最大的正整数（7FFFFFFF）， 只能使用 !、 ~、 &、 ^、 |、 +

(7) int bitCount(int x);   统计x的二进制表示中 1 的个数
                只能使用，! ~ & ^ | + << >> ，运算次数不超过 40次 

(8) int bitMask(int highbit, int lowbit); 产生从lowbit 到 highbit 全为1，其他位为0的数。例如bitMask(5,3) = 0x38 ；要求只使用 ! ~ & ^ | + << >> ；运算次数不超过 16次。

(9) int addOK(int x, int y);  当x+y 会产生溢出时返回1，否则返回 0
仅使用 !、 ~、 &、 ^、 |、 +、 <<、 >>， 运算次数不超过 20次

(10) int byteSwap(int x, int n, int m);  将x的第n个字节与第m个字节交换，返回交换后的结果。 n、m的取值在 0~3之间。
例：byteSwap(0x12345678, 1, 3) = 0x56341278  
   byteSwap(0xDEADBEEF, 0, 2) = 0xDEEFBEAD
仅使用 !、 ~、 &、 ^、 |、 +、 <<、 >>， 运算次数不超过 25次

(11) int bang(int x)    当 x =0 时，返回 1; 其他情况返回 0。实现逻辑非(!)
例：bang(3) = 0；  bang(0) =1;
仅使用 ~、 &、 ^、 | 、+、 <<、 >>，运算次数不超过 12次
提示：只有当 x=0时，x与 -x的最高二进制位会同时为0。

(12) int bitParity(int x)    当 x有奇数个二进制位0，返回1；否则返回0
例：bitParity (5) = 0；  bitParity (7) = 1; 
仅使用 ! 、~、 &、 ^、 | 、+ 、<< 、>>  ，运算次数不超过 20次。
提示：只有当 x的高字与低字的对应位（第0位对应第16位，第1位对应第17位，依次类推）同时为1，则出现了成对的二进制位1，此时，可以将对应的二进制位置为0，不会影响二进制位1的个数的奇偶性判断。
*/
#include <stdio.h>
#include <limits.h>

int displayBit(int x){
    unsigned int* a = (unsigned int*) (&x);
    unsigned int mask = 1;

    for(int i = 31 ; i >= 0 ; i--){
        if ((mask << i) & (*a)) {
            printf("1");
        }
        else{
            printf("0");
        }
    }
    
    printf("\n");
    return 0;
}

int absVal(int x){
    return x^(x>>31) + 1 + ~(x>>31);
}

int negate(int x){
    return ~x + 1;
}

int bitAnd(int x, int y){
    return ~( (~x) | (~y) );
}

int bitOr(int x, int y){
    return ~( (~x) & (~y) );
}

int bitXor(int x, int y){
    return ~( ~(x & ~y) & ~(~x & y) );
}

int isTmax(int x){
    int cond = ~(x ^ (x + 1));
    return (!cond) & !!(x + 1);
}

int bitCount(int x){
    unsigned int ux = (unsigned int)x;
    unsigned int m1 = 0x55555555;
    unsigned int m2 = 0x33333333;
    unsigned int m4 = 0x0f0f0f0f;
    unsigned int m8 = 0x00ff00ff;
    unsigned int m16 = 0x0000ffff;

    ux = (ux & m1) + ((ux >> 1) & m1);
    ux = (ux & m2) + ((ux >> 2) & m2);
    ux = (ux & m4) + ((ux >> 4) & m4);
    ux = (ux & m8) + ((ux >> 8) & m8);
    ux = (ux & m16) + ((ux >> 16) & m16);
    return (int)ux;
}

int bitMask(int highbit, int lowbit){
        unsigned int ones = ~0u;
        unsigned int left = ones << lowbit;
        unsigned int right = ones >> (31 - highbit);
        return (int)(left & right);
}

int addOK(int x, int y){
    int sum = x + y;
    int ovf = ((~(x ^ y)) & (x ^ sum)) >> 31 & 1;
    return ovf;
}

int byteSwap(int x, int n, int m){
    unsigned int ux = (unsigned int)x;
    unsigned int nshift = (unsigned int)(n << 3);
    unsigned int mshift = (unsigned int)(m << 3);
    unsigned int bn = (ux >> nshift) & 0xFFu;
    unsigned int bm = (ux >> mshift) & 0xFFu;
    unsigned int mask = (0xFFu << nshift) | (0xFFu << mshift);
    ux = ux & ~mask;
    ux |= (bn << mshift) | (bm << nshift);
    return (int)ux;
}

int bang(int x){
    return ((x | (~x + 1)) >> 31) + 1;
}

int bitParity(int x){
    unsigned int ux = (unsigned int)x;
    ux ^= ux >> 16;
    ux ^= ux >> 8;
    ux ^= ux >> 4;
    ux ^= ux >> 2;
    ux ^= ux >> 1;
    return (int)(ux & 1u);
}

int absVal_standard(int x){
    return (x < 0) ? -x : x;
}

int negate_standard(int x){
    return -x;
}

int bitAnd_standard(int x, int y){
    return x & y;
}

int bitOr_standard(int x, int y){
    return x | y;
}

int bitXor_standard(int x, int y){
    return x ^ y;
}

int isTmax_standard(int x){
    return x == 0x7fffffff;
}

int bitCount_standard(int x){
    unsigned int ux = (unsigned int)x;
    int cnt = 0;
    while(ux){
        cnt += ux & 1u;
        ux >>= 1;
    }
    return cnt;
}

int bitMask_standard(int highbit, int lowbit){
    if(highbit < lowbit) return 0;
    int width = highbit - lowbit + 1;
    if(width >= 32) return ~0;
    unsigned int mask = ((1u << width) - 1u) << lowbit;
    return (int)mask;
}

int addOK_standard(int x, int y){
    long long s = (long long)x + (long long)y;
    return (s > INT_MAX || s < INT_MIN) ? 1 : 0;
}

int byteSwap_standard(int x, int n, int m){
    unsigned int ux = (unsigned int)x;
    unsigned int nshift = (unsigned int)(n << 3);
    unsigned int mshift = (unsigned int)(m << 3);
    unsigned int bn = (ux >> nshift) & 0xFFu;
    unsigned int bm = (ux >> mshift) & 0xFFu;
    ux &= ~(0xFFu << nshift);
    ux &= ~(0xFFu << mshift);
    ux |= (bn << mshift) | (bm << nshift);
    return (int)ux;
}

int bang_standard(int x){
    return !x;
}

int bitParity_standard(int x){
    unsigned int ux = (unsigned int)x;
    int p = 0;
    while(ux){
        p ^= (ux & 1u);
        ux >>= 1;
    }
    return p;
}
