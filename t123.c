#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    double d;

    d = 123456789.0;
    printf("%.30g\n", d);
    printf("%.15g\n", d);
    printf("%.6g\n", d);
    d = strtod("123456789", NULL);
    printf("%d\n", d == 123456789.0);
    return 0;
}
