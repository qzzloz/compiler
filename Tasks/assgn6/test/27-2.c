void test_not_with_array() {
    int arr[5];
    int result;
    
    // Error 27: array is not a scalar type for NOT operation
    result = !arr;  // Should trigger error 27
}
