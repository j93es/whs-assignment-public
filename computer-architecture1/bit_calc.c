#include <stdio.h>

unsigned char clear_bit(unsigned char x, int n) {
    return x & ~(1 << n);
}

void print_bits(unsigned char x) {
    for (int i = 7; i >= 0; i--) {
        printf("%d", (x >> i) & 1);
    }
}

unsigned char input_bits() {
    unsigned int origin;
    unsigned char bits = 0;
    int tmp = 1e7;

    printf("비트열을 입력하세요: ");
    scanf("%u", &origin);
    for (int i = 0; i < 8; i++) {
        bits = (bits << 1) | ((origin / tmp) % 10);
        tmp /= 10;
    }
    return bits;
}

int input_index() {
    int index;
    printf("\n0부터 7사이의 초기화할 인덱스를 입력하세요: ");
    scanf("%d", &index);
    if (index < 0 || index > 7) {
        printf("0부터 7사이의 값을 입력하세요.");
        return 1;
    }
    return index;
}

int main(void) {
    unsigned char srcBits;
    unsigned char distBits;
    int taregtIndex;

    srcBits = input_bits();
    taregtIndex = input_index();

    distBits = clear_bit(srcBits, taregtIndex);

    print_bits(distBits);
}