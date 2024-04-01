#ifdef __unix__

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#elif defined(_WIN32) || defined(WIN32)

#include <windows.h>
#include <stdio.h>

#endif

extern int print_less(const char **my_string, int num_skip, int str_len);

int main(){
    const char *str1 = "I ";
    const char *str2 = "love ";
    const char *str3 = "assembly!\n";
    const char *str4 = "Blah blah blah";
    const char *str5 = "string";

    printf("%s\n", "Expected: I bly!");

    int str1_len = print_less(&str1, 0, 3);
    int str2_len = print_less(&str2, 7, 6);
    int str3_len = print_less(&str3, 5, 11);
    int str4_len = print_less(&str4, -1, 15);
    int str5_len = print_less(&str5, 7, 7);

    printf("%s %d %d %d %d %d\n", "String lengths:", str1_len, str2_len, str3_len, str4_len, str5_len);
}