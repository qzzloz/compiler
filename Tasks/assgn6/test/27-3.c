int my_function() {
    return 42;
}

void test_not_with_function() {
    int result;
    
    // Error 27: function type is not scalar for NOT operation
    result = !my_function;  // Should trigger error 27
}