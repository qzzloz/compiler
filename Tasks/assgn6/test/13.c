// test_error_13.c
int main() {
    int a;
    struct Dummy { int x; } s;
    
    // 다음 줄에서 13번 오류 발생 예상
    -s;

    return 0;
}
