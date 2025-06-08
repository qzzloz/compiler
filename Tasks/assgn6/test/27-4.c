union Data {
    int i;
    float f;
};

void main() {
    union Data data;
    int result;
    
    result = !data;
}