#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main()
{
 //Declaracion de variables
 float a,b,c,x1,x2;
 
 //Se obtiene el valor desde el teclado
 printf("Valor de A: ");
 scanf("%f",&a);
 printf("Valor de B: ");
 scanf("%f",&b);
 printf("Valor de C: ");
 scanf("%f",&c);

 //Se verifica que no halla numero negativo
 //en la parte que se realiza la raiz.
 
 if(((b*b)-(4*a*c))>0){
  //Se evaluan los resultados con la ecuacion.
  x1=(float)(((-1)*b)+(sqrt((b*b)-(4*a*c))))/(2*a);
  x2=(float)(((-1)*b)-(sqrt((b*b)-(4*a*c))))/(2*a);
 
  //Se imprimen en pantalla los resultados.
  printf("X1 = %.2f\n",x1);
  printf("X2 = %.2f\n",x2);
 }
 	else{
  printf("ERROR: La ecuacion no tiene resultado.");
 }
 
}
