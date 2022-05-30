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
%}

/*SECCION DE OPCIONES*/
/*lee solo un fichero de entrada*/
%option noyywrap 

/********** definiciones regulares ********/

INT [1-9][0-9]*|[0]
FLOAT [0-9]*[.][0-9]+([eE][+-]?[0-9]*|[0])?f?
delim [ \t\n]
ws {delim}+
SEMI [;]
COMMA [,]
ASSIGNOP [=]
RELOP [>]|[<]|[>][=]|[<][=]|[=][=]|[!][=](^[=])
OPARIT [+]|[-]|[*]|[/]
BRACKETS [\(]|[\)]|[\]|[\]]|[\{]|[\}]
AND [&][&]
OR [|][|]
DOT [.]
NOT [!]
TYPE int|float
RETURN return
SELF self
IF if
ELSE else 
WHILE while
SPACE [ \n\t]
ID [a-zA-Z_][a-zA-Z_0-9]*

/*SECCION DE TOKENS Y EXPRESIONES REGULARES*/
TRUE                    ["1"]
FALSE                   ["0"]
CHAR                    [a-zA-Z]
DIGITO                  [0-9]
/* INT                     [-?[1-9][0-9]{0,4}]|0 */
SUMA                    ["+"]
RESTA                   ["-"]
MULTIPLICACION          ["*"]
DIVISION                ["/"]
MODULO                  ["%"]
/* AND                     ["&&"] */
/* OR                      ["|"] */
IGUAL                   ["=="]
MAYOR                   [">"]
MENOR                   ["<"]
MAYOR_IGUAL             [">="]
MENOR_IGUAL             ["<="]
DIFERENTE               ["!="]
NUEVA_LINEA             [";"]
ESPACIO                 [" "]
COMENTARIO              ["#"]
STRING                  "^[^;""]*" 
PARENTESIS_REDONDOS     [\(|\)]
PARENTESIS_CUADRADOS    [\[|\]]
LLAVES                  [\{|\}]
ASIGNACION              [":="]
VECTOR                  "["({STRING},)*"]"
MATRIX                  "["({VECTOR},)*"]"
IDENTIFICADOR           ["matrix."{STRING}"]

OP_IF                   "if"|"IF"
OP_ELSE                 "else"|"ELSE"
OP_WHILE                "while"|"WHILE"
DEF_TRUE                "true"|"TRUE"
DEF_FALSE               "false"|"FALSE"
DEF_CHAR                "char"|"CHAR"
DEF_DIGITO              "digit"|"DIGIT"
DEF_INT                 "int"|"INT"
DEF_STRING              "string"|"STRING" 
DEF_VECTOR              "vector"|"VECTOR"
DEF_MATRIX              "matrix"|"MATRIX"
DEF_IDENTIFICADOR       "identificador"|"identificador"

/********** fin definiciones regulares ********/
/*SECCION DE REGLAS*/
%%
{ws} {/* no hay accion y no hay retorno */}

{INT} {printf("categoria entero: %s\n", yytext);}
{FLOAT} {printf("categoria flotante: %s\n", yytext);}
{SEMI} {printf("categoria fin de linea : %s\n", yytext);}
{COMMA} {printf("categoria simbolo : %s\n", yytext);}
{ASSIGNOP} {printf("categoria operador de asignacion : %s\n", yytext);}
{OPARIT} {printf("categoria operador: %s\n", yytext);}
{RELOP} {printf("categoria a operador relacional: %s\n", yytext);}
{BRACKETS} {printf("categoria  parentesis : %s\n", yytext);}
{RETURN} |
{IF} |
{ELSE} |
{WHILE} {printf("categoria palabra reservada: %s\n", yytext);}
{ID} {printf("categoria  ID: %s\n", yytext);}

{TRUE}                   {printf("TRUE %s\n", yytex);}
{FALSE}                  {printf("FALSE %s\n", yytex);} 
{CHAR}                   {printf("CHAR %s\n", yytex);} 
{DIGITO}                 {printf("DIGITO %s\n", yytex);} 
{INT}                    {printf("\nINT (%s)", yytex);} 
{SUMA}                   {printf("\nSUMA (%s)", yytex);} 
{RESTA}                  {printf("\nRESTA (%s)", yytex);} 
{MULTIPLICACION}         {printf("\nMULTIPLICACION (%s)", yytex);} 
{DIVISION}               {printf("\nDIVISION (%s)", yytex);} 
{MODULO}                 {printf("\nMODULO (%s)", yytex);} 
{AND}                    {printf("\nAND (%s)", yytex);} 
{OR}                     {printf("\nOR (%s)", yytex);} 
{IGUAL}                  {printf("\nIGUAL (%s)", yytex);} 
{MAYOR}                  {printf("\nMAYOR (%s)", yytex);} 
{MENOR}                  {printf("\nMENOR (%s)", yytex);} 
{MAYOR_IGUAL}            {printf("\nMAYOR_IGUAL (%s)", yytex);} 
{MENOR_IGUAL}            {printf("\nMENOR_IGUAL (%s)", yytex);} 
{DIFERENTE}              {printf("\nDIFERENTE (%s)", yytex);} 
{NUEVA_LINEA}            {printf("\nNUEVA_LINEA (%s)", yytex);} 
{ESPACIO}                {printf("\nESPACIO (%s)", yytex);} 
{COMENTARIO}             {printf("\nCOMENTARIO (%s)", yytex);} 
{STRING}                 {printf("\nSTRING (%s)", yytex);} 
{PARENTESIS_REDONDOS}    {printf("\nPARENTESIS_REDONDOS (%s)", yytex);} 
{PARENTESIS_CUADRADOS}   {printf("\nPARENTESIS_CUADRADOS (%s)", yytex);} 
{LLAVES}                 {printf("\nLLAVES (%s)", yytex);} 
{ASIGNACION}             {printf("\nASIGNACION (%s)", yytex);} 
{VECTOR}                 {printf("\nVECTOR (%s)", yytex);}
{MATRIX}                 {printf("\nMATRIX (%s)", yytex);} 
{IDENTIFICADOR}          {printf("\nIDENTIFICADOR (%s)", yytex);} 

{OP_IF}                  {printf("\nPalabra Reservada if: (%s)", yytex);} 
{OP_ELSE}                {printf("\nPalabra Reservada else: (%s)", yytex);} 
{OP_WHILE}               {printf("\nPalabra Reservada while: (%s)", yytex);} 
{DEF_TRUE}               {printf("\nPalabra Reservada true: (%s)", yytex);} 
{DEF_FALSE}              {printf("\nPalabra Reservada false: (%s)", yytex);} 
{DEF_CHAR}               {printf("\nPalabra Reservada char: (%s)", yytex);} 
{DEF_DIGITO}             {printf("\nPalabra Reservada digito: (%s)", yytex);} 
{DEF_INT}                {printf("\nPalabra Reservada int: (%s)", yytex);} 
{DEF_STRING}             {printf("\nPalabra Reservada string: (%s)", yytex);} 
{DEF_VECTOR}             {printf("\nPalabra Reservada vector: (%s)", yytex);} 
{DEF_MATRIX}             {printf("\nPalabra Reservada matrix: (%s)", yytex);} 
{DEF_IDENTIFICADOR}      {printf("\nPalabra Reservada identificador: (%s)", yytex);} 

%%

/*comprueba si el archivo se puede abrir y lo lee*/
/* int main(int argc,char *argv[]){
    if ((yyin = fopen(argv[1], "rt")) == NULL){ 
        printf("\nNo se puede abrir el archivo")
        return 1;
    }
    else{
        printf("\nEL archivo se abrio correctamente")
        yylex();
    }
    print("\nFLEX finalizo la lectura del archivo")
    fclose(yyin);
    return 0;
} 

yyerror(); 
//si llega aqui, no se encontro ninguan categoria o plabra reservada que coincida con el caracter leido por flex
*/


int yywrap() {
  return 1;
}

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
    return(1)
}