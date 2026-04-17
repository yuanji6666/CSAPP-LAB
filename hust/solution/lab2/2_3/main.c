#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define COURSE_COUNT 8
#define STUDENT_COUNT 3
#define BENCH_REPEAT 100000

struct student {
    char name[8];
    char sid[11];
    short scores[COURSE_COUNT];
    short average;
};

short calculate_average(const short scores[], int count);

int compare_student_desc(const void *a, const void *b) {
    const struct student *sa = (const struct student *)a;
    const struct student *sb = (const struct student *)b;

    return sb->average - sa->average;
}

void print_result(const struct student students[], int n) {
    int i = 0;

    printf("\n===== 平均成绩排名（高到低）=====\n");
    printf("%-4s %-10s %-12s %-8s\n", "排名", "姓名", "学号", "平均分");
    for (i = 0; i < n; ++i) {
        printf("%-4d %-10s %-12s %-8hd\n", i + 1, students[i].name, students[i].sid, students[i].average);
    }
}

int main() {
    struct student students[STUDENT_COUNT] = {
        {"Tom", "2023000001", {80, 70, 90, 100, 60, 75, 85, 95}, 0},
        {"Amy", "2023000002", {90, 88, 92, 86, 91, 89, 87, 90}, 0},
        {"Bob", "2023000003", {60, 65, 70, 75, 80, 85, 90, 95}, 0}
    };
    struct student students_copy[STUDENT_COUNT];
    int i = 0;
    int r = 0;
    clock_t avg_start;
    clock_t avg_end;
    clock_t sort_start;
    clock_t sort_end;
    double avg_elapsed_ms;
    double sort_elapsed_ms;

    avg_start = clock();
    for (r = 0; r < BENCH_REPEAT; ++r) {
        for (i = 0; i < STUDENT_COUNT; ++i) {
            students[i].average = calculate_average(students[i].scores, COURSE_COUNT);
        }
    }
    avg_end = clock();
    avg_elapsed_ms = (double)(avg_end - avg_start) * 1000.0 / CLOCKS_PER_SEC / BENCH_REPEAT;
    
    print_result(students, STUDENT_COUNT);

    sort_start = clock();
    for (r = 0; r < BENCH_REPEAT; ++r) {
        memcpy(students_copy, students, sizeof(students));
        qsort(students_copy, STUDENT_COUNT, sizeof(struct student), compare_student_desc);
    }
    sort_end = clock();
    sort_elapsed_ms = (double)(sort_end - sort_start) * 1000.0 / CLOCKS_PER_SEC / BENCH_REPEAT;

    qsort(students, STUDENT_COUNT, sizeof(struct student), compare_student_desc);

    print_result(students, STUDENT_COUNT);
    printf("\n平均值计算耗时(每次, %d次均值): %.6f ms (%.3f us)\n", BENCH_REPEAT, avg_elapsed_ms, avg_elapsed_ms * 1000.0);
    printf("排序耗时(每次, %d次均值): %.6f ms (%.3f us)\n", BENCH_REPEAT, sort_elapsed_ms, sort_elapsed_ms * 1000.0);

    return 0;
}

