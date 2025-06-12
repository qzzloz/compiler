int value = 100;

void printValue() {
    int value = 50;
    printf("Local value: %d\n", value);
}

int main() {
    printValue();
    printf("Global value: %d\n", value);
    return 0;
}
