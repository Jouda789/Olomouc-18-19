#include <stdio.h>

long long DecToBin (int a){

  int arr[300];
  int j = 0;
  
  while (a > 0){   
   
   arr[j] = (a % 2);
   a = a / 2; 
   j++;
    
  }
  
  int i=0;
  long long new = 0;

  for(i = j-1;i>=0;i--){
    new *= 10;
    new += arr[i]; 
  }

  return new;
}

int main() {
    int n;
    scanf("%d", &n);
    long long bin = DecToBin(n);
    
    int pocet = 1;
    int max = 1;
    
    long long cislo = bin;
    
    int len = 0;
    
    while(cislo){
        len++;
        cislo /= 10;
    }
    
    int i, c1, c2;
    
    for(i=1;i<len-1;i++){
        c1=bin%10;
        c2=bin%100;
        c2 /= 10;
        
        if(c1 == 1 && c2== 1)pocet++;
        else if (c2==1 && c1==0) pocet=1;      
        if (pocet > max) max = pocet;
        bin /= 10;

    }
 
     if (bin==11 && max==pocet) max++;
    
    printf("%d", max);
    
    return 0;
}
