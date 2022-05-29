%{
#define entero 400
#define real 401
#define identificador 402
#define COMMENT 403
#define TEXT 404
#define COMMAND 405
%}

%%
[ \t\n]+		;
[0-9]+[ \t\n]		{return entero;}
entero		|
[0-9]+\.[0-9]+[ \t\n]		|
\.[0-9]+[ \t\n]		|
[0-9]*\.[0-9]+E[\+|\-][0-9]+[ \t\n]		|
[0-9]+E[\+|\-][0-9]+[ \t\n]			{return real;}
[ \t\n]+[a-zA-Z\_]+[a-zA-Z0-9\_]*[ \t\n]		{return identificador;}


%%

#include <stdio.h>

int main(argc,argv)
int argc;
char *argv[];
{
int val;
while(val = yylex()) printf("value is %d\n",val);
}

