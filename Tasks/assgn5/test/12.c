int func();  // 프로토타입은 int

char func() {  // 실제 구현은 char 타입 리턴
    return 'a';
}

int main() {
    return func();
}
