struct Point {
    int x;
    int y;
};

// Test Case 9: Complex expression with non-scalar types
void test_complex_expression() {
    struct Point points[10];
    struct Point single_point;
    int result;
    
    // Error 27: array of structs is not scalar
    if (!points) {  // Should trigger error 27
        result = 1;
    }
    
    // Error 27: struct in logical AND
    if (single_point && 1) {  // Should trigger error 27
        result = 2;
    }
}