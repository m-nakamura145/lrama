/*
 * This is comment for this file.
 */

%{
// Prologue
static int yylex(YYSTYPE *val, YYLTYPE *loc);
static int yyerror(YYLTYPE *loc, const char *str);

%}
%union {
    int i;
}

%rule defined_option(X): /* empty */
                       | X
                       ;

%rule unused_define(X): /* empty */
                      | X
                      ;

%%

program         : defined_option(number) <i>
                ;

%%

static int yylex(YYSTYPE *yylval, YYLTYPE *loc) {
{
  return 0;
}

static int yyerror(YYLTYPE *loc, const char *str) {
{
  return 0;
}

int main(int argc, char *argv[])
{
}
