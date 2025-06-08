// 89번 에러 발생 테스트케이스
// semantic_error2(89,id->line,id->name): "unknown identifier kind"

int main() {
    // 이 코드는 enum literal을 일반 변수처럼 선언하려고 시도하는 상황을 가정
    // 또는 symbol table에서 identifier의 kind가 예상치 못한 값을 가지는 경우
    
    enum colors {RED, GREEN, BLUE};
    
    // 정상적인 경우라면 이런 식으로 사용되어야 함
    int x = RED;
    
    // 하지만 만약 parser나 symbol table 구성 과정에서
    // enum literal이 잘못된 kind로 설정되어 
    // declaration_list에 포함되면 89번 에러가 발생할 수 있음
    
    return 0;
}

// 또 다른 가능한 시나리오:
// struct나 union의 field가 declaration_list에 
// 잘못 포함되는 경우

struct Point {
    int x;
    int y;
};

void func() {
    struct Point p;
    return;
}