#include <stdio.h>

int main() {
    int a, b, c;
    writef("Enter values of a and b\n");
    readf("%d%d", &a, &b);
    c = a + b;
    writef("Sum = %d", c);
    return 0;
}