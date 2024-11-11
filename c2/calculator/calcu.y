
%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();
%}

%token NUM

%%

start:exp { printf("Value is: %d",$1); }
exp: exp '+' factor { $$=$1+$3 ; }
    | exp '-' factor { $$=$1-$3 ; }
    | factor { $$=$1; }
    ;
factor: factor '*' term { $$=$1*$3; }
        | factor '/' term { $$=$1/$3; }
        | term { $$=$1; }
        ;
term : '(' exp ')'  { $$=$2; }
    | NUM   { $$=$1; }
    ;
%%
int main(){
    printf("Enter the number ");
    yyparse();
    return 0;
}
int yyerror(){
    printf("Error happended");
    return 1;
}
