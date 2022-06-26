%{
    #include <stdio.h>
%}

%token FLOAT
%token INT
%token SUMA

%%
expresion: FLOAT { $$ = $1; }
| INT { $$ = (double) $1; }
| expresion SUMA expresion { $$ = $1 + $3; }
;
%%
