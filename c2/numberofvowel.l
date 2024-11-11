%{
    #include<stdio.h>
    int v=0,c=0,n=0;
%}
%%
[aeiouAEIOU] { v++;}
[^aeiouAEIOU] { c++; }
%%
int main(){
    printf("Enter the string :");
    yylex();
    printf("Vowel :%d\n",v);
    printf("Not Vowel :%d\n",c-1);
    return 0;
}
int yywrap(){
    return 1;
}
