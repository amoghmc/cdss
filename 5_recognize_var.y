%{
%}

%token L D

%%
var:  L E {printf("Valid variable\n"); return 0;} 
E: E L  ;
| E D   ;
|       ;
%%

int main() {
    printf("Type the variable\n"); 
    yyparse();
}

yyerror() {
    printf("Invalid variable\n");
    exit(0);
}


