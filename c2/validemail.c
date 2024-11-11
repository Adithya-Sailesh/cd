%{
    #include<stdio.h>
    int valid=0;
%}

%%

[a-z0-9]+"@"[a-z0-9]+".com" { valid=1; }
[\n] { return 0;}
%%

int main(){
    printf("Enter the mail to check");
    yylex();
    if(valid==1){
        printf("Email Valid");
    }
    else{
        printf("Email Not Valid");
    }
    return 0;
}
int yywrap(){
    return 1;
}
