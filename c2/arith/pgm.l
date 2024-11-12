%{ 
#include "y.tab.h" 
extern int yylval; 
%} 
%% 
[a-zA-Z] {return ID;} 
[0-9] {return NUMBER;} 
\n  { printf ("reached end of 
line\n"); return 0; 
} 
.  
{ printf ("found other data \"%s\"\n", 
yytext); return yytext[0]; 
/* so yacc can see things like '+', '-', and '=' */ 
}
