// test_error_19.c
int x = 10;

enum MyEnum {
    A = x   // x는 enum literal이 아님 → 에러 19
};

int main() {
    return 0;
}
