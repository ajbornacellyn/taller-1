%{
#include "stdio.h"
#include "stdlib.h"
#define NUMBER 400
#define COMMENT 401
#define TEXT 402
#define COMMAND 403
%}
INT[1-9][0-9]*|[0]
FLOAT [0-9]*[.][0-9]+([eE][+-]?[0-9]*|[0])?f?
delim [ \t\n]
ws {delim}+
SEMI [;]
COMMA [,]
ASSIGNOP [=]
RELOP [>]|[<]|[>][=]|[<][=]|[=][=]|[!][=](^[=])
PLUS [+]
MINUS [-]
STAR [*]
DIV [/]
AND [&][&]
OR [|][|]
DOT [.]
NOT [!]
TYPE int|float
LP \(
RP \)
LB \[
RB \]
LC \{
RC \}
STRUCT struct
RETURN return
SELF self
IF if
ELSE else 
WHILE while
SPACE [ \n\t]
ID [a-zA-Z_][a-zA-Z_0-9]*
/*end of definition*/
 
%%
{ws} {/* no hay accion y no hay retorno */}

{INT} {printf("categoria entero: %s\n", yytext);}
{FLOAT} {printf("categoria flotante: %s\n", yytext);}
{SEMI} {printf("categoria fin de linea : %s\n", yytext);}
{COMMA} {printf("categoria simbolo : %s\n", yytext);}
{ASSIGNOP} {printf("categoria operador de asignacion : %s\n", yytext);}
{PLUS} | {MINUS} |{DIV} |{STAR} {printf("categoria operador: %s\n", yytext);}
{RELOP} {printf("categoria a operador relacional: %s\n", yytext);}
{SELF} |{RETURN} |{IF} |{ELSE} |{WHILE} {printf("categoria palabra clave: %s\n", yytext);}
{LP} |{RP} |{LB} |{RB} |{LC} |{RC} {printf("categoria  : %s\n", yytext);}
{ID} {printf("categoria  ID: %s\n", yytext);}

%%
int yywrap() {
  return 1;
}
 
int main(int argc, char** argv) {
   if (argc > 1) {
       if (!(yyin = fopen(argv[1], "r"))) {   
           perror(argv[1]);
           return 1;
       }
   }
   while (yylex());
   return 0;
}