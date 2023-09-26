#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int k = 0, stk_index = 0, i = 0, j = 0, len = 0;
char inp_str[16], stk[15];
void check();
void stk_fun();

int main(){
    printf("GRAMMAR is E->E+E \n E->E*E \n E->(E) \n E->id");
    printf("\nenter input string ");
    gets(inp_str);
    len = strlen(inp_str);
    printf("stack \t input \t action");
    for (i = 0; j < len; i++, j++) {
        if (inp_str[j] == 'i' && inp_str[j + 1] == 'd') {
            stk[i] = inp_str[j];
            stk[i + 1] = inp_str[j + 1];
            stk[i + 2] = '\0';
            inp_str[j] = ' ';
            inp_str[j + 1] = ' ';
            printf("\n$%s\t%s$\t%s", stk, inp_str, "SHIFT->id");
            check();
        }
        else {
            stk[i] = inp_str[j];
            stk[i + 1] = '\0';
            inp_str[j] = ' ';
            printf("\n$%s\t%s$\t%s", stk, inp_str, "SHIFT->symbols");
            check();
        }
    }
}

void check() {
    for (stk_index = 0; stk_index < len; stk_index++)
        if (stk[stk_index] == 'i' && stk[stk_index + 1] == 'd') {
            stk_fun();
            j++;
        }
    for (stk_index = 0; stk_index < len; stk_index++)
        if (stk[stk_index] == 'E' && stk[stk_index + 1] == '+' && stk[stk_index + 2] == 'E') {
            stk_fun();
            i -= 2;
        }
    for (stk_index = 0; stk_index < len; stk_index++)
        if (stk[stk_index] == 'E' && stk[stk_index + 1] == '*' && stk[stk_index + 2] == 'E') {
            stk_fun();
            i -= 2;
        }
    for (stk_index = 0; stk_index < len; stk_index++)
        if (stk[stk_index] == '(' && stk[stk_index + 1] == 'E' && stk[stk_index + 2] == ')') {
            stk_fun();
            i -= 2;
        }
}

void stk_fun() {
    stk[stk_index] = 'E';
    stk[stk_index + 1] = '\0';
    printf("\n$%s\t%s$\t%s", stk, inp_str, "REDUCE TO E");
}