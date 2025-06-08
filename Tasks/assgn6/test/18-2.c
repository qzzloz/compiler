int main() {
    enum E { A = &main };  // 함수 주소 → 상수 표현식 아님 → 18번
    return 0;
}
