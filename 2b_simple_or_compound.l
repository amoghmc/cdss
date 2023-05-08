%{
	#include <stdio.h>
	int valid;
%}

%%
[a-zA-Z]*[ ](and|but|or|however)[ ][a-zA-Z]* {valid = 1;}
.|[\n] {;}
%%

int main() {
	printf("Enter the text \n");
	yylex();
	if (valid) {
		printf("\nStatement is compound");
	}
	else {
		printf("\nStatement is simple");
	}
	return 0;
}

