%{
	int ch=0, wd=0, ln=0, sp=0; 
%}

%%
[ ] { sp++; wd++; }
[\n] { ln++; wd++; }
[\t\n] { wd++; }
[^\t\n] { ch++; }
%%

// end of input processing 
int yywrap() {
	return 1;
}

int main() {
	yyin = fopen("1a_in.txt", "r");
	yylex(); //starting part of lex program
	printf("char=%d\t words=%d\t spaces=%d\t lines=%d", ch, wd, sp, ln);
	return 0;
}


