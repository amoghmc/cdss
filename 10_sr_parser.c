#include <stdio.h>
#include <stdlib.h>
#include <curses.h>
#include <string.h>
int k = 0, stk_index = 0, i = 0, j = 0, c = 0;
char inp_str[16], ac[20], stk[15], act[10];
void check();

int main()
{
    puts("GRAMMAR is E->E+E \n E->E*E \n E->(E) \n E->id");
    puts("enter input string ");
    gets(inp_str);
    c = strlen(inp_str);
    strcpy(act, "SHIFT->");
    puts("stack \t input \t action");
    for (k = 0, i = 0; j < c; k++, i++, j++)
    {
        if (inp_str[j] == 'i' && inp_str[j + 1] == 'd')
        {
            stk[i] = inp_str[j];
            stk[i + 1] = inp_str[j + 1];
            stk[i + 2] = '\0';
            inp_str[j] = ' ';
            inp_str[j + 1] = ' ';
            printf("\n$%s\t%s$\t%sid", stk, inp_str, act);
            check();
        }
        else
        {
            stk[i] = inp_str[j];
            stk[i + 1] = '\0';
            inp_str[j] = ' ';
            printf("\n$%s\t%s$\t%ssymbols", stk, inp_str, act);
            check();
        }
    }
    getch();
}

void check()
{
    strcpy(ac, "REDUCE TO E");
    for (stk_index = 0; stk_index < c; stk_index++)
        if (stk[stk_index] == 'i' && stk[stk_index + 1] == 'd')
        {
            stk[stk_index] = 'E';
            stk[stk_index + 1] = '\0';
            printf("\n$%s\t%s$\t%s", stk, inp_str, ac);
            j++;
        }
    for (stk_index = 0; stk_index < c; stk_index++)
        if (stk[stk_index] == 'E' && stk[stk_index + 1] == '+' && stk[stk_index + 2] == 'E')
        {
            stk[stk_index] = 'E';
            stk[stk_index + 1] = '\0';
            stk[stk_index + 2] = '\0';
            printf("\n$%s\t%s$\t%s", stk, inp_str, ac);
            i = i - 2;
        }
    for (stk_index = 0; stk_index < c; stk_index++)
        if (stk[stk_index] == 'E' && stk[stk_index + 1] == '*' && stk[stk_index + 2] == 'E')
        {
            stk[stk_index] = 'E';
            stk[stk_index + 1] = '\0';
            stk[stk_index + 1] = '\0';
            printf("\n$%s\t%s$\t%s", stk, inp_str, ac);
            i = i - 2;
        }
    for (stk_index = 0; stk_index < c; stk_index++)
        if (stk[stk_index] == '(' && stk[stk_index + 1] == 'E' && stk[stk_index + 2] == ')')
        {
            stk[stk_index] = 'E';
            stk[stk_index + 1] = '\0';
            stk[stk_index + 1] = '\0';
            printf("\n$%s\t%s$\t%s", stk, inp_str, ac);
            i = i - 2;
        }
}