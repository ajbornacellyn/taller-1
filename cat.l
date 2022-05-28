%{
#define NUMBER 400
#define identificador 401
#define COMMENT 402
#define TEXT 403
#define COMMAND 404
%}

%%
[ \t\n]+		;
[0-9]+			|
[0-9]+\.[0-9]+		|
\.[0-9]+		{return NUMBER;}
[a-zA-Z\_]+[a-zA-Z0-9\_]*		{return identificador;}

%%

#include <stdio.h>

int main(argc,argv)
int argc;
char *argv[];
{
int val;
while(val = yylex()) printf("value is %d\n",val);
}

