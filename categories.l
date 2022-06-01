/*ANALIZADOR LEXICO*/

/*SECCION DE DEFINICIONES*/
%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
FILE *yyln; /*puntero que utiliza flex, el cual termina parado en el ultimo token que es reconocido*/
#define NUMBER 400
#define TEXT 402
#define COMMAND 403
#define vector 404
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
#define BLOCK 420
#define TREATMENT 421
#define RANK 422
#define ID 423
// palabras reservadas
#define RESERVE 500
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
#define CDF 516
#define FRIEDMAN 517
%}

/********** definiciones regulares ********/

INT [1-9][0-9]*|[0]
FLOAT [0-9]*[.][0-9]+([eE][+-]?[0-9]*|[0])?f?
delim [ \t\n]
WS {delim}+
COMMENT \#[^\n]*[\n]	
TEXT \"[^\"\n]*\"
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
BLOCK block
TREATMENT treatment
RANK rank
ID [a-zA-Z_][a-zA-Z_0-9]*
VECTOR [\{]({INT}|{FLOAT})([,]{INT}|{FLOAT})*[\}]
MODEL {MODELWR}\(({INT}[,]{INT})\)
CDFWORD cdf
FRIEDMANW friedman
CDF {CDFWORD}\({TEXT}[,]{ID}[,]({INT}|{FLOAT})([,]({INT}|{FLOAT}))?\)
FRIEDMAN {FRIEDMANW}\(({MODEL}|{ID})\)

/*si llega aqui, no se encontro ninguan categoria o plabra reservada que coincida con el caracter leido por flex*/
/********** fin definiciones regulares ********/
/*SECCION DE REGLAS*/
%%
{TEXT} {printf("categoria texto constante texto %s", yytext); return(TEXT);}
{WS} {/* no hay accion y no hay retorno */}
{COMMENT} {printf("categoria comentario %s", yytext); return(COMMENT);}
{VECTOR} {printf("categoria vector: %s", yytext); return(VECTOR);}
{INT} {printf("categoria constante numerica entero: %s ", yytext); return(INT);}
{FLOAT} {printf("categoria constante numerica flotante: %s", yytext); return(FLOAT);}
{SEMI} {printf("categoria fin de linea : %s", yytext); return(SEMI);}
{TREATMENT} |
{BLOCK} |
{RANK} |
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
{FLOATWR} |
{BOOLEAN} |
{STRING} {printf("categoria  palabra reservada: %s", yytext); return(RESERVE);}
{ASSIGNOP} {printf("categoria operador de asignacion : %s", yytext); return(ASSIGNOP);}
{OPARIT} {printf("categoria operador aritmetico: %s", yytext); return(OPARIT);}
{RELOP} {printf("categoria a operador relacional: %s", yytext); return(RELOP);}
{PARENTESIS} {printf("categoria  parentesis : %s", yytext); return(PARENTESIS);}
{BRACKETS} {printf("categoria  parentesis cuadrados : %s", yytext); return(BRACKETS);}
{COMMA} {printf("categoria  separador : %s", yytext); return(COMMA);}
{DOT} |
{AND} |
{OR} |
{NOT} {printf("categoria simbolo condicional : %s", yytext);}
{LLAVES} {printf("categoria llaves : %s", yytext); return(LLAVES);}
{ID} {printf("categoria identificador: %s", yytext); return(ID);}
{CDF} {printf("categoria C.D.F: %s", yytext); return(CDF);}
{FRIEDMAN} {printf("categoria funcion Friedman: %s", yytext); return(FRIEDMAN);}
{MODEL} {printf("categoria model: %s", yytext); return(MODEL);}

%%

/********** para recorrer  la entradad y devolver la categoría lexica correspondiente ********/
int main(int argc, char** argv) {
   if (argc > 1) {
       if (!(yyin = fopen(argv[1], "r"))) {   
           perror(argv[1]);
           return 1;
       }
   }
   int val;
   while(val = yylex()) printf(", valor:  %d\n",val);
   return 0;
}

/*funcion de error*/
int yyerror(void){
    return 1;
}