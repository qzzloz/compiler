union Data {
    int i;
    float f;
};

void test_union_in_logical_op() {
    union Data data;
    int result;
    
    // Error 27: union is not a scalar type
    result = !data;  // Should trigger error 27
}