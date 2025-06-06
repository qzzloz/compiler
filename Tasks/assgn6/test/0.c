char* getMessage() {
    return "Hello, world!";
}

float add(float a, float b) {
    return a + b;
}

int main() {
    char* msg;
    float result;

    msg = getMessage();
    result = add(3.5, 2.5);

    return 0;
}