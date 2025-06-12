int add(int a, int b) { return a + b; }
int multiply(int a, int b) { return a * b; }

int operate(int x, int y, int (*func)(int, int)) {
    return func(x, y);
}

int main() {
    printf("Add: %d\n", operate(3, 4, add));
    printf("Multiply: %d\n", operate(3, 4, multiply));
    return 0;
}
