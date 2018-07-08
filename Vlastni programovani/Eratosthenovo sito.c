#include <stdio.h>

void Sito(int n){
	
	int Prime[n+1];
	int i, j;
	
	for(i=0;i<=n;i++){
		Prime[i]=1;
	}
	
	for (i=2; i*i<=n; i++)
    {
        if (Prime[i] == 1)
        {
            for (j=i*2; j<=n; j += i)
                Prime[j] = 0;
        }
    }
 
    for (i=2; i<=n; i++)
       if (Prime[i])
          printf("%d ", i);	
}

int main()
{
	int N;
    printf("Kolik chcete vypsat prvnich prvocisel?\n");
    scanf("%d", &N);
    Sito(N);
    return 0;
}
