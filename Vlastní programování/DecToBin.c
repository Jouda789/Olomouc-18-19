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
  int cislo;
  printf("Zadejte cele cislo a ja vam jej prevedu na binarni reprezentaci: \n");
  scanf("%d", &cislo);
  long long BinRep = DecToBin(cislo);
  printf("Binarni reprezentace cisla %d je %lld.", cislo, BinRep);
  return 0;
}
