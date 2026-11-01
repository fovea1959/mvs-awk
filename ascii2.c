#include <stdio.h>

int main(int argc, char **argv)
{
    const char *p;

    printf("compiled: %02x %02x %02x %02x %02x\n", '^', '[', ']', '!', '|');
    if (argc > 1) {
        printf("received:");
        for (p = argv[1]; *p; p++)
            printf(" %02x", (unsigned char)*p);
        printf("\n");
    }
    return 0;
}
