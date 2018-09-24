#include <stdio.h>

int gcd(int a, int b){
  int t;
  while (b !=0 ){
   t = b;
   b = a % b; 
   a = t;
 }
  return a;
}

int main() {
  int a, b;
  printf("Prosim zadejte dve kladna cisla, spocitam vam jejich GCD: ");
  scanf("%d%d", &a, &b);
  int g = gcd(a,b);
  printf("GCD z cisel %d a %d je %d.", a, b, g);
  return 0;
}

