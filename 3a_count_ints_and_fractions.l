%{
	#include <stdio.h>
	#include <stdlib.h>
	int pi = 0, ni = 0, pf = 0, nf = 0;
%}

%%
[-][0-9]+ 			{ni++;}
[+]?[0-9]+ 			{pi++;}
[-][0-9]*\.[0-9]+ 	{nf++;}
[+]?[0-9]*\.[0-9]+ 	{pf++;}
%%

int main() {
	yyin = fopen("3a_in.txt", "r");
	yylex();
	
	printf("Positive ints %d\n", pi);
	printf("Negative ints %d\n", ni);
	printf("Positive fractions %d\n", pf);
	printf("Negative fractions %d\n", nf);
}

int yywrap() {
	return 1;
}

