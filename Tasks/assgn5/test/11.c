inline extern int func() {  // 잘못된 함수 지정자 조합
    return 1;
}

int main() {
    return func();
}
