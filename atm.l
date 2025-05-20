%{
#include "atm.tab.h"
#include <string.h>
%}

%%
[0-9]+              { yylval.num = atoi(yytext); return NUMBER; }
login               { return LOGIN; }
logout              { return LOGOUT; }
withdraw            { return WITHDRAW; }
deposit             { return DEPOSIT; }
balance             { return BALANCE; }
[ \t\n]+            ; // ignore whitespace
.                   { return yytext[0]; }
%%
int yywrap() {
    return 1;
}

