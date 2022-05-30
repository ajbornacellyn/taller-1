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
%}

/*SECCION DE OPCIONES*/
/*lee solo un fichero de entrada*/
%option noyywrap 

/*SECCION DE TOKENS Y EXPRESIONES REGULARES*/
%%
TRUE                    ["1"]
FALSE                   ["0"]
CHAR                    [a-zA-Z]
DIGITO                  [0-9]
INT                     (-?[1-9][0-9]{0,4})|0
SUMA                    ["+"]
RESTA                   ["-"]
MULTIPLICACION          ["*"]
DIVISION                ["/"]
MODULO                  ["%"]
AND                     "&&"
OR                      ["|"]
IGUAL                   "=="
MAYOR                   [">"]
MENOR                   ["<"]
MAYOR_IGUAL             ">="
MENOR_IGUAL             "<="
DIFERENTE               "!="
NUEVA_LINEA             [";"]
ESPACIO                 [" "]
COMENTARIO              ["#"]
STRING                  "^[^;""]*" 
PARENTESIS_REDONDOS     \"("|")"
PARENTESIS_CUADRADOS    \"["|"]"
LLAVES                  \"{"|"}"
ASIGNACION              ":="
VECTOR                  "["({STRING},)*"]"
MATRIX                  "["({VECTOR},)*"]"
IDENTIFICADOR           "matrix."{STRING}

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
%%

/*SECCION DE REGLAS*/
%%
{TRUE}                   {printf("\nTRUE (%s)", yytex);}
{FALSE}                  {printf("\nFALSE (%s)", yytex);} 
{CHAR}                   {printf("\nCHAR (%s)", yytex);} 
{DIGITO}                 {printf("\nDIGITO (%s)", yytex);} 
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

yyerror(); 
//si llega aqui, no se encontro ninguan categoria o plabra reservada que coincida con el caracter leido por flex
%%

/*comprueba si el archivo se puede abrir y lo lee*/
int main(int argc,char *argv[]){
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

/*funcion de error*/
int yyerror(void){
    printf("\nError lexico: caracter invalido");
    return(1)
}

