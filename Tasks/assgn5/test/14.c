struct A;
struct B {
    struct A a;  // A의 정의가 없음 → 불완전 선언
};

int main() {
    return 0;
}
