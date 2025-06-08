// test_error_21.c

int x = 42;

int getValue() {
    return x;
}

int main() {
    int result = 0;
    int a = 10;
    float f = 3.14;

    // 배열 선언 및 초기화
    int arr[3] = {1, 2, 3};

    // 구조체 정의
    struct Point {
        int x, y;
    } p = {5, 10};

    // 포인터 정의
    int *ptr = &a;

    // 정적 변수
    static int stat = 7;

    // 함수 호출처럼 생겼지만 함수가 아닌 식별자들 → 모두 에러 21 발생
    a();         //  변수 호출
    f();         //  float 호출
    arr();       //  배열 호출
    p();         //  구조체 호출
    ptr();       //  포인터 호출
    stat();      //  정적 변수 호출
    x();         //  전역 변수 호출
    getValue;    //  함수 참조만 (괜찮음)
    getValue();  //  실제 함수 호출 (정상)

    return 0;
}
