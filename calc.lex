%{
#include <stdio.h>
#include <string.h>
%}
%{
int  linenum=0;
int i ;
%}
Comment ("/*"([^*]|\*+[^*/])*\*+"/")
NOTComment ("/*"([^*/]+))
%%
[\t] ;
(?i:"if")   {printf("Reserved keyword IF \t ");}
(?i:"int")  {printf("KEYWORD INT\t");}
(?i:"void") {printf("KEYWORD VOID\t");}
(?i:"Return") {printf("KEYWORD RETURN\t");}
((?i:"WHile")) {printf("KEYWORD WHILE\t");}
(?i:"else") {printf("Keyword else\t");}
([a-zA-Z](([a-zA-Z])|([0-9]))*)(([.|#|$|_])?((([a-zA-Z])|([0-9])))+)?  { printf("ID\t");}
[a-zA-Z]*#[(^\W||'\n')] {printf("Error ID in "),linenum;}
[a-zA-Z]*#[(^0-9||'\n')] {printf("Error ID\t");}
(([0-9]+[.][0-9]*)|([0-9]+))([e|E]([+]|[-])?[0-9]+)? {printf("NUM\t");}
(([0-9]+[.][0-9]*)|([0-9]+))([e|E]([+]|[-])[^0-9]) {printf("ERROR NUM in "),linenum;}
[+] {printf("Special symbol Plus\t");}
[-] {printf("Special symbol Minus\t");}
[*] {printf("Special symbol Multiply\t");}
[/] {printf("Special symbol Slash\t");}
[<] {printf("Special symbol less than\t");}
[>] {printf("Special symbol greater than\t");}
[;] {printf("Special symbol semi colon\t");}
[,] {printf("Special symbol comma\t");}
[(] {printf("Special symbol (\t");}
[)] {printf("Special symbol )\t");}
[\[] {printf("Special symbol [\t");}
[\]] {printf("Special symbol ]\t");}
[\!][\=] {printf("Special symbol not equal\t");}
[\=][\=] {printf("Special symbol equal equal\t");}
[\>][\=] {printf("Special symbol greater than or equal\t");}
[\<][\=] {printf("Special symbol less than or equal\t");}
[\{] {printf("Special symbol {\t");}
[\}] {printf("Special symbol }\t");}
[=] {printf("Special symbol equal \t");}
[\n]   { linenum++; printf("line number = %d \n",linenum); }
{Comment} {
  for (i=0; i<yyleng;i++){
    if(yytext[i] == '\n'){  
      linenum++;
      printf("Comment in Line number %d \n",linenum);
    }
  }
}
{NOTComment} {printf("Error comment not closed in "),linenum;}
[^.] {printf("Error not an alphabet of the language in line number %d ",linenum+1);}
%%

main() {
  // lex through the input:
  // open a file handle to a particular file:
  FILE *myfile = fopen("test.txt", "r");
  // make sure it's valid:
  if (!myfile) {
   printf("Error Cannot Open file");
    return -1;
  }
  // set lex to read from it instead of defaulting to STDIN:
  yyin = myfile;
  yylex();
  printf("linenumber = %d \n",linenum+1);
  // [a-zA-Z]+
  // [0-9]+\.[0-9]+ { printf("Betengan");}
  // [0-9]+   { printf("Betengan");}
    // [a-zA-Z]+[a-zA-Z | 0-9]*
  //|[0-9+][.][0-9*]][ [e|E] [[+|-]?][0-9+]]?
  //[[0-9]+|
  //***************************
  //[0-9]+[.][0-9]*|[0-9]+ --> awel bracket fel number
  //*[[.|#|$|_]?[a-zA-Z | 0-9]+]? 
  //[[|*|+|/|<|<|>|>=|=|;|,|{|\]] {printf("special Symbol\t");}
  //[">="] {printf("Special symbol greater than or equal)\t";}
  //["=="] {printf("Special symbol equal equal)\t";}
  //["="] {printf("Special symbol equal)\t";}
  //[<=] {printf("Special symbol less than or equal\t");}
  //([e]|[E])([l]|[L])([s]|[S])([e]|[E]) {printf("Reserved keyword else \t  ");}
//   [\>][\=]{printf("Special symbol >=\t");}
// [\<] [\=]{printf("Special symbol<=\t");}
// [\{] {printf("Special symbol{\t");}
// [\}] {printf("Special symbol}\t");}
  //([a-zA-Z](([a-zA-Z])|([0-9]))*)(([.|#|$|_])?)(([^a-zA-Z])|([^0-9])) {printf("ERROR numbarrr brog\t");}
  //[/][*] {printf("open comment\t");}
// [*][/] {printf("Close comment \t");}
  //   "/*"([^*]|\*+[^*/])*\*+"/" {printf("Comment ");}
  //   "/*"([^*]|[/n]) {printf("bedayet el comment \t");}




//(([0-9]+[.][0-9]*)|([0-9]+))([e|E]([+]|[-])?[a-zA-Z]+) {printf("ERROR NUM\t");}
  
}
