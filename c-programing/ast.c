// target.c:7:5
int main(void) {
    return main1();
}

// target.c:27:6
void error(void) {
    exit(1);
}

// target.c:94:5
int peek(char *s) {
    int i = 0;
    while (s[i] == token[i] && s[i] != 0) {
        i = i + 1;
    }
    return s[i] == token[i];
}

// target.c:102:5
int accept(char *s) {
    if (peek(s)) {
        get_token();
        return 1;
    } else {
        return 0;
    }
}

// target.c:112:6
void expect(char *s) {
    if (accept(s) == 0) {
        error();
    }
}