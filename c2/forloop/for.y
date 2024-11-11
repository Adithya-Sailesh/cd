%{
    #include<stdio.h>
    int yyerror();
    int yylex();
    int valid=0;
%}

%token FOR PARANTHESIS OPERAND OPERATOR COMMA SEMICOLON NEWLINE CURLYBRACE

%%

exp: FOR PARANTHESIS A A B PARANTHESIS CURLYBRACE exp CURLYBRACE NEWLINE | ;
A: OPERAND OPERATOR OPERAND SEMICOLON
    | OPERAND OPERATOR OPERAND COMMA A 
    | SEMICOLON ;

B: OPERAND OPERATOR
    | OPERAND OPERATOR COMMA B
    |
    ;
%%

int yyerror()
{
	valid = 0;
	printf("Invalid.\n");
	return 1;
}
 
void main()
{
	printf("Enter string:\n");
	yyparse();
	if (valid==1){
        printf("Valid.\n");
    }
		
}
