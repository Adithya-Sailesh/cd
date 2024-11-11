%{
    #include<stdio.h>
    int valid=1;
%}

%%

[a-zA-Z0-9]* {
    for(int i=0;i<yyleng;i++){
        if(yytext[i]=='a' && yytext[i+1]=='a'){
            valid=0;
            break;
        }
    }
}
[\n] {
    return 0;
}
%%

int main(){
    printf("Enter the name to check(aa)");
    yylex();
    if(valid==1){
        printf("no aa");
    }
    else{
        printf("contains aa");
    }
    return 0;
}
int yywrap(){
    return 1;
}
