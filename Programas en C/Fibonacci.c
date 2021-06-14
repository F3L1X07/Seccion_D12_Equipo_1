#include <stdio.h>
#include <stdlib.h>

int main()
{
	int n1,n2,n3, i;
	n1=0;
	n2=1;
	
	for(i=0;i<10;i++){
		n3=n1+n2;
		printf("%d\n",n3);
		n1=n2;
		n2=n3;
	}
	
return 0;
}
