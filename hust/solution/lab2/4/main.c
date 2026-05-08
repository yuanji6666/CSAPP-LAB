#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define COURSE_COUNT 8
#define STUDENT_COUNT 6
#define BENCH_REPEAT 100000

struct student {
    char name[8];
    char sid[11];
    short scores[COURSE_COUNT];
    short total;
};

short calculate_total(const short scores[], int count) {
    int sum = 0;
    int i = 0;

    if (count <= 0) {
        return 0;
    }

    for (i = 0; i < count; ++i) {
        sum += scores[i];
    }

    return (short)sum;
}

int compare_student_desc(const void *a, const void *b) {
    const struct student *sa = (const struct student *)a;
    const struct student *sb = (const struct student *)b;

    return sb->total - sa->total;
}

void sort_students_desc(struct student students[], int n) {
    int i = 0;

    for (i = 1; i < n; ++i) {
        struct student key = students[i];
        int j = i - 1;

        while (j >= 0 && students[j].total < key.total) {
            students[j + 1] = students[j];
            --j;
        }
        students[j + 1] = key;
    }
}

void print_result(const struct student students[], int n) {
    int i = 0;

    printf("\n===== 总成绩排名（高到低）=====");
    printf("%-4s %-10s %-12s %-8s\n", "排名", "姓名", "学号", "总分");
    for (i = 0; i < n; ++i) {
        printf("%-4d %-10s %-12s %-8hd\n", i + 1, students[i].name, students[i].sid, students[i].total);
    }
}

int main() {
    struct student students[STUDENT_COUNT] = {
        {"Yuanji", "U202414862", {80, 70, 90, 100, 60, 75, 85, 95}, 0},
        {"Amy", "2023000002", {90, 88, 92, 86, 91, 89, 87, 90}, 0},
        {"Bob", "2023000003", {60, 65, 70, 75, 80, 85, 90, 95}, 0},
        {"Chen", "2023000004", {85, 82, 88, 90, 87, 86, 89, 84}, 0},
        {"Diana", "2023000005", {92, 90, 95, 91, 93, 94, 92, 91}, 0},
        {"Evan", "2023000006", {78, 75, 80, 82, 79, 81, 77, 83}, 0}
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
            students[i].total = calculate_total(students[i].scores, COURSE_COUNT);
        }
    }
    avg_end = clock();
    avg_elapsed_ms = (double)(avg_end - avg_start);
    
    print_result(students, STUDENT_COUNT);

    sort_start = clock();
    for (r = 0; r < BENCH_REPEAT; ++r) {
        memcpy(students_copy, students, sizeof(students));
        sort_students_desc(students_copy, STUDENT_COUNT);
    }
    sort_end = clock();
    sort_elapsed_ms = (double)(sort_end - sort_start);

    sort_students_desc(students, STUDENT_COUNT);

    print_result(students, STUDENT_COUNT);
    printf("\n总分计算耗时(%d次): %.6f ms (%.3f us)\n", BENCH_REPEAT, avg_elapsed_ms, avg_elapsed_ms * 1000.0);
    printf("排序耗时(%d次): %.6f ms (%.3f us)\n", BENCH_REPEAT, sort_elapsed_ms, sort_elapsed_ms * 1000.0);

    return 0;
}

