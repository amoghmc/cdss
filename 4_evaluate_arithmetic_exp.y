%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token num
%left '+''-'
%left '*''/'

%%
input: exp      {printf("%d\n", $$); return 0;}
exp: exp'+'exp  {$$=$1+$3;}
|exp'-'exp      {$$=$1-$3;}
|exp'*'exp      {$$=$1*$3;}
|exp'/'exp      {if ($3 == 0) {
                    printf("Divide by 0 error\n"); 
                    return 0;
                }
                else
                    $$=$1/$3;}
|'('exp')'      {$$=$2;}
|num            {$$=$1;};
%%

int main() {
    printf("Enter an expression:\n");
    yyparse();
}

int yyerror() {
    printf("Invalid expression\n");
    exit(0);
}

