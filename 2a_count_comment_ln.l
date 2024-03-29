%{
	#include <stdio.h>
	int ml = 0;
	int sl = 0;
%}

%%
"/*"[a-zA-Z0-9' '\t\n]*"*/" {ml++;}
"//".* 						{sl++;}
%%

int main() {
	yyin = fopen("2a_f1.txt", "r");
	yyout = fopen("2a_f2.txt", "w");

	yylex();
	fclose(yyin);
	fclose(yyout);
	
	printf("Number of single line comments: %d\n", sl);
	printf("Number of multiline comments: %d\n", ml);
}

int yywrap() {
	return 1;
}