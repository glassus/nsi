#include "stdio.h"
#include "stdlib.h"
#include "string.h"

int main()
{

char saisie[50] = "";
printf("Accès restreint : saisissez votre mot de passe \n");
while (strcmp(saisie,"NSIMAURIAC")!=0)
{
printf("Mot de passe ? \n");
scanf("%s",&saisie);
}

printf("Accès autorisé \n");

return 0;
} 
