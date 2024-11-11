#include<stdio.h>
#include<string.h>
char states[10][10],result[10][10];
int n;
void add(char a[],int i){
    strcpy(result[i],a);
}
void display(int c,char g[]){
    int k=0;
    printf("eclosure of %s ={ ",g);
    while(k<c){
        printf("%s",result[k]);
        k++;
    }
    printf("} \n");
}
void main(){
    FILE *in;
    in=fopen("input.txt","r");
    printf("Enter the number of states");
    scanf("%d",&n);
    printf("Enter the states");
    for(int i=0;i<n;i++){
        scanf("%s",states[i]);
    }
    for(int j=0;j<n;j++){
        char copy[5],state[5],state1[5],state2[5],input[5];
        int i=0;
        strcpy(state,states[j]);
        strcpy(copy,state);
         add(state, i++);
        while(!feof(in)){
            fscanf(in,"%s %s %s",state1,input,state2);
            if (strcmp(state,state1)==0){
                if(strcmp(input,"e")==0){
                    add(state2,i);
                    i++;
                    strcpy(state,state2);
                }
            }
        }
        display(i,copy);
        rewind(in);
    }
    fclose(in);
}

//input.txt
// q0 a q1
// q0 e q2
// q1 b q0
// q1 e q2
// q2 a q0
