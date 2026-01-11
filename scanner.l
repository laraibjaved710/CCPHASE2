%{
#include "y.tab.h"
#include <stdio.h>
extern int yylineno;
%}

%option yylineno

%%
[ \t\r\n]+          ;
"//".* ;

"ginti"             { return GINTI; }
"pointbro"          { return POINTBRO; }
"agar"              { return AGAR; }
"warna"             { return WARNA; }
"jabtak"            { return JABTAK; }
"nikalo"            { return NIKALO; }

"="                 { return ASSIGN; }
";"                 { return SEMI; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
"+bro"              { return PLUS; }
"-bro"              { return MINUS; }
"**"                { return MUL; }

[0-9]+              { return INTEGER; }
[0-9]*\.[0-9]+      { return FLOAT_VAL; }
[A-Za-z_][A-Za-z0-9_]* { return IDENTIFIER; }

.                   { return yytext[0]; }
%%
int yywrap() { return 1; }
