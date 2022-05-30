@echo off
C:\GnuWin32\bin\flex cat.l
echo "FLEX Compilo la especificacion lexica del archivo cat.l, se creo un archivo lex.yy.c"
pause
C:\MinGW\bin\gcc.exe lex.yy.c -o Compilado.exe
echo "Finalizo la ejecucion del compilador de C sobre el archivo lex.yy.c, se creo un archivo compliado.exe"
pause
Compilado.exe prueba.txt
echo "Se ejecuto el analizador lexico sobre el archivo prueba.txt"
del lex.yy.c
del Compilado.exe
echo "Se borraron los archivos generadis en todo este proceso, finalizando..."
pause