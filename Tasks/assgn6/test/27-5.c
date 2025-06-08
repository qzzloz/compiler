struct Point {
    int x;
    int y;
};

struct Outer {
    struct Point inner;
    int value;
};

void test_nested_struct() {
    struct Outer outer;
    int result;
    
    // Error 27: struct is not a scalar type
    result = !outer;  // Should trigger error 27
}