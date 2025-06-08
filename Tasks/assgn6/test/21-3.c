int x = 42;

int getValue() {
    return x;
}

int main() {
    int result = 0;
    int a = 10;
    float f = 3.14;

    int arr[3] = {1, 2, 3};

    struct Point {
        int x, y;
    } p = {5, 10};

    int *ptr = &a;

    static int stat = 7;

    a();         
    f();         
    arr();       
    p();         
    ptr();      
    stat();     
    x();        
    getValue;   
    getValue(); 

    return 0;
}
