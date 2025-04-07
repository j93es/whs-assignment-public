#include <stdio.h>

int main(void) {
    // 음의 오버플로
    int n = -2147483648;
    n -= 1;
    printf("%d\n", n);

    // 언더플로
    float f = 1.f;
    for (int i = 0; i < 200; i++) {
        f /= 10.f;
    }
    printf("%f\n", f);
}