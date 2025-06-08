struct Point {
    int x;
    int y;
};

void test_complex_expression() {
    struct Point points[10];
    struct Point single_point;
    int result;
    
    if (!points) {
        result = 1;
    }
    
    if (single_point && 1) {
        result = 2;
    }
}