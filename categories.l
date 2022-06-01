/*ANALIZADOR LEXICO*/

/*SECCION DE DEFINICIONES*/
%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
FILE *yyln; /*puntero que utiliza flex, el cual termina parado en el ultimo token que es reconocido*/
#define PI 3.1415
#define E 2.7182
#define NUMBER 400
#define COMMENT 401
#define TEXT 402
#define COMMAND 403
#define vector 404
#define comentario 405
#define INT 406
#define FLOAT 407
#define WS 408
#define COMMENT 409
#define SEMI 410
#define COMMA 411
#define ASSIGNOP 412
#define RELOP 413
#define OPARIT 414
#define PARENTESIS 415
#define BRACKETS 416
#define LLAVES 417
#define VECTOR 418
#define MODEL 419
// palabras reservadas
#define RETURN 500
#define SELF 501
#define IF 502
#define ELSE 503 
#define WHILE 504
#define FOR 505
#define TRUE 506
#define FALSE 507
#define CHAR 508
#define INTWR 509
#define FLOATWR 510
#define BOOLEAN 511
#define STRING 512
#define DEF 513
#define MODELWR 514 
#define VECTORWR 515
%}

/********** definiciones regulares ********/

INT [1-9][0-9]*|[0]
FLOAT [0-9]*[.][0-9]+([eE][+-]?[0-9]*|[0])?f?
delim [ \t\n]
WS {delim}+
COMMENT \#[^\n]*[\n]	
SEMI [;]
COMMA [,]
ASSIGNOP [=]
RELOP [>]|[<]|[>][=]|[<][=]|[=][=]|[!][=](^[=])
OPARIT [+]|[-]|[*]|[/]
PARENTESIS [\(]|[\)]
BRACKETS [\[]|[\]]
LLAVES [\{]|[\}]
AND [&][&]
OR [|][|]
DOT [.]
NOT [!]
RETURN return
SELF self
IF if
ELSE else 
WHILE while
FOR for
TRUE true
FALSE false
CHAR char
INTWR int
FLOATWR float
BOOLEAN boolean
STRING string
DEF def
MODELWR model
VECTORWR vector
ID [a-zA-Z_][a-zA-Z_0-9]*
VECTOR [\{]({INT}|{FLOAT})([,]{INT}|{FLOAT})*[\}][\n]
MODEL [\{]({INT}[\,]{INT})  [\}]

/*si llega aqui, no se encontro ninguan categoria o plabra reservada que coincida con el caracter leido por flex*/
/********** fin definiciones regulares ********/
/*SECCION DE REGLAS*/
%%
{WS} {/* no hay accion y no hay retorno */}
{COMMENT} {printf("categoria  comentario: %s\n", yytext);}
{VECTOR} {printf("categoria vector: %s\n", yytext);}
{INT} {printf("categoria constante numerica entero: %s\n", yytext);}
{FLOAT} {printf("categoria constante numerica flotante: %s\n", yytext);}
{SEMI} {printf("categoria fin de linea : %s\n", yytext);}
{RETURN} |
{SELF} |
{IF} |
{ELSE} |
{FOR} |
{WHILE} |
{DEF} |
{TRUE} |
{FALSE} |
{CHAR} |
{INTWR} | 
{VECTORWR} |
{MODELWR} |
{FLOATWR} |
{BOOLEAN} |
{STRING} {printf("categoria  palabra reservada: %s\n", yytext);}
{ASSIGNOP} {printf("categoria operador de asignacion : %s\n", yytext);}
{OPARIT} {printf("categoria operador aritmetico: %s\n", yytext);}
{RELOP} {printf("categoria a operador relacional: %s\n", yytext);}
{PARENTESIS} {printf("categoria  parentesis : %s\n", yytext);}
{BRACKETS} {printf("categoria  parentesis cuadrados : %s\n", yytext);}
{COMMA} {printf("categoria  separador : %s\n", yytext);}
{DOT} |
{AND} |
{OR} |
{NOT} {printf("categoria simbolo condicional : %s\n", yytext);}
{LLAVES} {printf("categoria  llaves : %s\n", yytext);}
{ID} {printf("categoria  identificador: %s\n", yytext);}

%%

/********** para recorrer  la entradad y devolver la categoría lexica correspondiente ********/
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

/*funcion de error*/
int yyerror(void){
    printf("\nError lexico: caracter invalido");
    return 1;
}