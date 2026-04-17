/*
要求：
（1）输入的第0个人姓名(name)为自己的名字，分数为学号的最后两位； 
（2）编写指定接口的函数完成数据压缩
    压缩函数有两个： int  pack_student_bytebybyte(student* s, int sno, char *buf);
                  int  pack_student_whole(student* s, int sno, char *buf);
    s为待压缩数组的起始地址； sno 为压缩人数； buf 为压缩存储区的首地址；两个函数的返回均是调用函数压缩后的字节数。
    pack_student_bytebybyte要求一个字节一个字节的向buf中写数据；
    pack_student_whole要求对short、float字段都只能用一条语句整体写入，用strcpy实现串的写入。
（3）使用指定方式调用压缩函数
    beforecompress数组的前N1（N1=2）个记录压缩调用pack_student_bytebybyte 完成；后N2（N2==3）个记录压缩调用pack_student_whole，两种压缩函数都只调用1次。
（4）使用指定的函数完成数据的解压
    解压函数的格式：int restore_student(char *buf, int len, student* s);
    buf 为压缩区域存储区的首地址；
    len为buf中存放数据的长度；
    s为存放解压数据的结构数组的起始地址；返回解压的人数。解压时不允许使用函数接口之外的信息（即不允许定义其他全局变量）
（5）仿照调试时看到的内存数据，以十六进制的形式，输出message的前40个字节的内容，并与调试时在内存窗口观察到的message的前40个字节比较是否一致。
（6）打印压缩前(beforecompress)、解压后(decompress)的结果，以及压缩前、压缩后存放数据的长度。
（7）对于第0个学生的score，根据浮点数的编码规则指出其个部分的编码，并与观察到的内存表示比较，验证是否一致。
（8）指出结构数组中个元素的存放规律，指出字符串数组、short类型的数、float型的数的存放规律。
*/
#include<stdio.h>
#include<string.h>
#include<stdint.h>

const int N = 5;

typedef struct student {
    char  name[8];
    short  age;
    float  score;
    char  remark[200]; 
} Student;

Student beforecompress[N] = {
    {"Yuanji", 20, 62, "First student"},
    {"Alice", 19, 88.0, "Second student"},
    {"Bob", 21, 92.3, "Third student"},
    {"Carol", 20, 87.5, "Fourth student"},
    {"David", 22, 90.0, "Fifth student"}
};

Student decompress[N];

char message[1000];

void print_student(Student s){
    printf("%s %d %f %s\n", s.name, s.age, s.score, s.remark);
}

int pack_student_bytebybyte(Student* s, int sno, char *buf){
    char* p = buf;
    for(int i = 0 ; i < sno ; i++){
        for(int j = 0; j < 8; j++){
            char c = s[i].name[j];
            *p++ = c;
            if(c == '\0') break;
        }

        char* a = (char*)&(s[i].age);
        *(p++) = *(a++);
        *(p++) = *(a++);

        char* sc = (char*)&(s[i].score);
        *(p++) = *(sc++);
        *(p++) = *(sc++);
        *(p++) = *(sc++);
        *(p++) = *(sc++);

        for(int j = 0; j < 200; j++){
            char c = s[i].remark[j];
            *p++ = c;
            if(c == '\0') break;
        }
    }
    return (p - buf);
}

int pack_student_whole(Student* s, int sno, char *buf){
    char* p = buf;
    for(int i = 0 ; i < sno ; i++){
        strcpy(p, s[i].name);
        p += strlen(p) + 1;
        memcpy(p, &s[i].age, 2);
        p += 2;
        memcpy(p, &s[i].score, 4);
        p += 4;
        strcpy(p, s[i].remark);
        p += strlen(p) + 1;
    }
    return (p - buf);
}

int restore_student(char* buf, int len, Student* s){
    char* p = buf;
    int count = 0;
    while ((p - buf) < len) {
        char* q = p;
        while ((q - buf) < len && *q != '\0') q++;
        if ((q - buf) >= len) break; 
        size_t slen = q - p;
        size_t copylen = slen < 7 ? slen : 7;
        memcpy(s[count].name, p, copylen);
        s[count].name[copylen] = '\0';
        for(size_t z = copylen+1; z < 8; z++) s[count].name[z] = 0;
        p = q + 1;

        if ((p - buf) + 2 + 4 > len) break;
        memcpy(&s[count].age, p, 2);
        p += 2;
        memcpy(&s[count].score, p, 4);
        p += 4;

        q = p;
        while ((q - buf) < len && *q != '\0') q++;
        if ((q - buf) >= len) break;
        slen = q - p;
        copylen = slen < 199 ? slen : 199;
        memcpy(s[count].remark, p, copylen);
        s[count].remark[copylen] = '\0';
        for(size_t z = copylen+1; z < 200; z++) s[count].remark[z] = 0;
        p = q + 1;

        count++;
    }
    return count;
}

int main(){
        char buf[10000];
        int len1, len2, total_compressed;

        printf("Before compress:\n");
        for(int i = 0 ; i < N ; i++){
         print_student(beforecompress[i]);
        }

        len1 = pack_student_bytebybyte(beforecompress, 2, buf);
        printf("len1=%d\n", len1);
        len2 = pack_student_whole(&beforecompress[2], 3, &buf[len1]);
        printf("len2=%d\n", len2);
        total_compressed = len1 + len2;

        int copy_len = (total_compressed < (int)sizeof(message)) ? total_compressed : (int)sizeof(message);
        memcpy(message, buf, copy_len);
        printf("\nMessage first 40 bytes:\n");
        int show = (40 < copy_len) ? 40 : copy_len;
        for(int i = 0; i < show; i++) printf("%02x ", (unsigned char)message[i]);
        printf("\n");

        int restored = restore_student(buf, total_compressed, decompress);

        printf("\nAfter decompress (restored %d records):\n", restored);
        for(int i = 0 ; i < restored ; i++){
         print_student(decompress[i]);
        }
        printf("\nUncompressed size: %zu bytes\n", sizeof(beforecompress));
        printf("Compressed size: %d bytes (len1=%d len2=%d)\n", total_compressed, len1, len2);

    return 0;

}
