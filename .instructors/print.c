#ifdef __unix__

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#elif defined(_WIN32) || defined(WIN32)

#include <windows.h>
#include <stdio.h>

#endif

extern int print(const char **my_string, int str_len);

int main(){
    const char *str1 = "I ";
    const char *str2 = "love ";
    const char *str3 = "assembly!\n";

    printf("%s\n", "Expected: I love assembly!");

    int str1_len = print(&str1, 3);
    int str2_len = print(&str2, 6);
    int str3_len = print(&str3, 11);
    
    printf("%s %d %d %d\n", "String lengths:", str1_len, str2_len, str3_len);
}