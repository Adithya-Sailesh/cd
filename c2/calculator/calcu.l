%{
    #include "y.tab.h"
%}

%%
[0-9]+ {yylval =atoi(yytext) ; return NUM ;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"(" {return '(';}
")" {return ')';}
[ \t] { }
. { printf("Error");}

%%

int yywrap(){
    return 1;
}

