// test_error_21.c
int x = 3;

int main() {
    x();  //  x는 함수가 아님 → error 21
    return 0;
}
