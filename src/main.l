%{

#include <stdio.h>
#include <string.h>
int num1 = 0, num2 = 0, num3 = 0;
%}

CARACTER [a-zA-Z0-9]


EMAIL {CARACTER}+[@]({CARACTER}+[.]*)+
UNICAMP {CARACTER}+[@](({CARACTER}+[.])*(unicamp\.br))
FEEC {CARACTER}+[@](({CARACTER}+[.])*(fee\.unicamp\.br))

%%
{FEEC} {
  num1++;
  num2++;
  num3++;
}

{UNICAMP} {
  num1++;
  num2++;
}

{EMAIL} {
  num1++;
}

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;

%%

int main() {
  yylex();
  printf("%d %d %d\n", num1, num2, num3);
  return 0;
}
