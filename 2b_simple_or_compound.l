%{
	#include <stdio.h>
	int compound;
%}

%%
[a-zA-Z]*[ ](and|but|or|however)[ ][a-zA-Z]* 	{compound = 1;}
.												{;}
\n												{;}
%%

int main() {
	printf("Enter the text \n");
	yylex();
	if (compound) {
		printf("\nStatement is compound");
	}
	else {
		printf("\nStatement is simple");
	}
	return 0;
}

