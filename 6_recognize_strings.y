%{
    #include <stdio.h>
%}

%token A B

%%
str: s '\n' {return 0;}
s: A s B {;}
| {;}
%%

int main() {
    printf("Type the string\n");
    if (!yyparse()) {
        printf("Valid string\n");
    }
}

int yyerror() {
    printf("Invalid string\n");
    exit(0);
}
