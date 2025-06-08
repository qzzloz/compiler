int main() {
    enum E { A = -"string" };  // 문자열에 단항 minus → getTypeAndValueOfExpression()에서 직접 18번 발생
    return 0;
}
