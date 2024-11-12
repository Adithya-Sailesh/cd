
%{ 
#include<stdio.h> 
%} 
%token ID NUMBER 
%left '+' '-' 
%left '*' '/' 
%% 
stmt:expr {printf("valid Expression\n");} 
; 
expr: expr '+' expr 
| expr '-' expr 
| expr '*' expr 
| expr '/' expr 
| '(' expr ')' 
| NUMBER 
| ID 
; 
%% 
int main () 
{ 
do 
{printf("Enter the expression\n"); 
yyparse(); 
}while(1); 
return 1; 
} 
int yyerror (char *msg) 
{ printf("Invalid Expression\n"); 
} 
yywrap() 
{ 
return(1); 
} 
