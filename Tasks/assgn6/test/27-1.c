struct Point {
    int x;
    int y;
};

void test_not_operator() {
    struct Point p;
    int result;
    
    // Error 27: struct is not a scalar type for NOT operation
    result = !p;  // Should trigger error 27
}