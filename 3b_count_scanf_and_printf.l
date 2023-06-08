%{
    #include <stdio.h>
    int sf, pf;
%}

%%
"scanf"     {sf++; fprintf(yyout, "readf");}
"printf"    {pf++; fprintf(yyout, "writef");}
%%

int main() {
    yyin = fopen("3b_in.c", "r");
    yyout = fopen("3b_out.c", "w");

    yylex();
    printf("Number of scanf: %d\n", sf);
    printf("Number of printf: %d\n", pf);
    fclose(yyin);
    fclose(yyout);
}

int yywrap() {
    return 1;
}