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
    
    result = !outer;
}