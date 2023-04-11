%{
    #include<stdio.h>
    int sf, pf = 0;
%}

%%
"scanf" {sf++; fprintf(yyout, "readf");}
"printf" {pf++; fprintf(yyout, "writef");}
%%

int main() {
    yyin = fopen("3b_in.c", "r");
    yyout = fopen("3d_out.c", "w");
    yylex();
    printf("Number of scanf: %d\nNumber of printf: %d\n", sf, pf);
    return 0;
}
