int ctoi(char c) {
    printf("%c\n", c);
    printf("%d\n", c);
    return c - '0';
}

float d_itof(int i) {
    return 2.0 * i; 
}

int main () {
    int x;
    char c;
    c = '2';
    printf("before: %d\n", c);
    x = ctoi(c);
    printf("after: %d\n", x);
    printf("%f\n", d_itof(x));
    return 0;
}