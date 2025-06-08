int f(int a){
    return 0;
}

int main(){
    struct S{
        int a;
        int b;
    };
    struct S s1;
    f(s1);
}