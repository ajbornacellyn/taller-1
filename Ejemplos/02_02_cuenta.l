%{
unsigned charCount = 0, wordCount = 0, lineCount = 0;
%}
word [a-zA-Z]+
eol \n
%%
{word} {wordCount++; charCount += yyleng; }
{eol} {charCount++; lineCount++;}
. charCount++;
%%

int main(argc,argv)
int argc;
char **argv;
{
	if (argc > 1) {
		FILE *file;

		file = fopen("texto.txt", "r");
		if (!file) {
			fprintf(stderr,"could not open %s\n","texto.txt");
			exit(1);
		}
		yyin = file;
	}
	yylex();
	printf("%d %d %d\n",charCount, wordCount, lineCount);
	return 0;
}
