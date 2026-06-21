package compilador;
import java_cup.runtime.Symbol;

%%

%class Lexer
%public
%unicode
%cup
%line
%column

/* === Definicoes auxiliares (macros) === */
Letra     = [a-zA-Z_]
Digito    = [0-9]
Espaco    = [ \t\r\n\f]+

/* Identificador comeca com letra e pode conter digitos */
Id        = {Letra}({Letra}|{Digito})*

/* Numero inteiro ou real (ex: 42, 3.14) */
Num       = {Digito}+("\."{Digito}+)?

/* Literais de texto */
LitChr    = "'"[^'\n]"'"
LitStr    = \"[^\"]*\"

/* Comentarios de bloco: /* ... */ */
Coment    = "/*" ~"*/"

%%

/* === Regras de analise lexica === */

/* Espacos e comentarios sao ignorados */
{Espaco}   { }
{Coment}   { }

/* Palavras reservadas da linguagem LangZ */
"if"       { return new Symbol(sym.IF,     yyline, yycolumn); }
"else"     { return new Symbol(sym.ELSE,   yyline, yycolumn); }
"while"    { return new Symbol(sym.WHILE,  yyline, yycolumn); }
"for"      { return new Symbol(sym.FOR,    yyline, yycolumn); }
"printf"   { return new Symbol(sym.PRINTF, yyline, yycolumn); }
"scanf"    { return new Symbol(sym.SCANF,  yyline, yycolumn); }
"true"     { return new Symbol(sym.TRUE,   yyline, yycolumn); }
"false"    { return new Symbol(sym.FALSE,  yyline, yycolumn); }

/* Tipos primitivos */
"int"      { return new Symbol(sym.T_INT,  yyline, yycolumn); }
"real"     { return new Symbol(sym.T_REAL, yyline, yycolumn); }
"chr"      { return new Symbol(sym.T_CHR,  yyline, yycolumn); }
"str"      { return new Symbol(sym.T_STR,  yyline, yycolumn); }

/* Operadores relacionais (tokens de dois caracteres antes dos de um) */
"=="       { return new Symbol(sym.EQ,  yyline, yycolumn); }
"!="       { return new Symbol(sym.NEQ, yyline, yycolumn); }
"<="       { return new Symbol(sym.LEQ, yyline, yycolumn); }
">="       { return new Symbol(sym.GEQ, yyline, yycolumn); }

/* Operadores logicos */
"&&"       { return new Symbol(sym.AND, yyline, yycolumn); }
"||"       { return new Symbol(sym.OR,  yyline, yycolumn); }
"!"        { return new Symbol(sym.NOT, yyline, yycolumn); }

/* Operadores aritmeticos e de atribuicao */
"+"        { return new Symbol(sym.PLUS,  yyline, yycolumn); }
"-"        { return new Symbol(sym.MINUS, yyline, yycolumn); }
"*"        { return new Symbol(sym.TIMES, yyline, yycolumn); }
"/"        { return new Symbol(sym.DIV,   yyline, yycolumn); }
"="        { return new Symbol(sym.ATTR,  yyline, yycolumn); }
"<"        { return new Symbol(sym.LT,    yyline, yycolumn); }
">"        { return new Symbol(sym.GT,    yyline, yycolumn); }

/* Delimitadores */
"("        { return new Symbol(sym.LPAR,   yyline, yycolumn); }
")"        { return new Symbol(sym.RPAR,   yyline, yycolumn); }
"{"        { return new Symbol(sym.LBRACE, yyline, yycolumn); }
"}"        { return new Symbol(sym.RBRACE, yyline, yycolumn); }
";"        { return new Symbol(sym.SEMI,   yyline, yycolumn); }

/* Literais de caracter e string */
{LitChr}   { return new Symbol(sym.LIT_CHR, yyline, yycolumn, yytext()); }
{LitStr}   { return new Symbol(sym.LIT_STR, yyline, yycolumn, yytext()); }

/* Identificadores e numeros — vem apos as palavras-chave */
{Id}       { return new Symbol(sym.ID,  yyline, yycolumn, yytext()); }
{Num}      { return new Symbol(sym.NUM, yyline, yycolumn, Double.parseDouble(yytext())); }

/* Qualquer outro caractere e um erro lexico */
.          { System.err.println("Erro Lexico [linha " + (yyline+1) + "]: caractere invalido '" + yytext() + "'"); }