int add(int x);  // 프로토타입 선언

int add(char x) {  // 매개변수 타입 불일치
    return x;
}

int main() {
    return add(5);
}
