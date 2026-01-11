%{
#include <stdio.h>
#include <stdlib.h>

/* These prototypes fix the errors you saw */
int yylex(void);
void yyerror(const char *s);

extern int yylineno;
extern char* yytext;
%}

%token IDENTIFIER INTEGER FLOAT_VAL
%token GINTI POINTBRO AGAR WARNA JABTAK NIKALO
%token LBRACE RBRACE LPAREN RPAREN SEMI ASSIGN PLUS MINUS MUL
%left PLUS MINUS
%left MUL

%%
program : LBRACE stmt_list RBRACE { printf("Syntax analysis successful\n"); } ;
stmt_list : stmt stmt_list | stmt ;
stmt : declaration | assignment | if_stmt | loop_stmt | output_stmt ;
declaration : GINTI IDENTIFIER SEMI | POINTBRO IDENTIFIER SEMI ;
assignment  : IDENTIFIER ASSIGN expression SEMI ;
if_stmt     : AGAR LPAREN expression RPAREN LBRACE stmt_list RBRACE WARNA LBRACE stmt_list RBRACE ;
loop_stmt   : JABTAK LPAREN expression RPAREN LBRACE stmt_list RBRACE ;
output_stmt : NIKALO expression SEMI ;
expression : expression PLUS term | expression MINUS term | term ;
term : term MUL factor | factor ;
factor : IDENTIFIER | INTEGER | FLOAT_VAL | LPAREN expression RPAREN ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error at line %d: %s. Found: '%s'\n", yylineno, s, yytext);
}

int main() {
    return yyparse();
}
