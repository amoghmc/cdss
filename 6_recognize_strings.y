%{
    #include <stdio.h>
%}

%token A B

%%
str: s '\n' {printf("Valid string\n"); return 0;}
s: A s B {;}
| {;}
%%

int main() {
    printf("Type the string\n");
    yyparse();
}

int yyerror() {
    printf("Invalid string\n");
    exit(0);
}
