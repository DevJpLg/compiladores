package compilador;
import java_cup.runtime.Symbol;

%%

%class Lexer
%public
%unicode
%cup
%line
%column

Letra     = [a-zA-Z_]
Digito    = [0-9]
Espaco    = [ \t\r\n\f]+

Id        = {Letra}({Letra}|{Digito})*

Num       = {Digito}+("."{Digito}+)?

LitChr    = "'"[^'\n]"'"
LitStr    = \"[^\"]*\"

Coment    = "/*" ~"*/"

%%

{Espaco}   { }
{Coment}   { }

"if"       { return new Symbol(sym.IF,     yyline, yycolumn); }
"else"     { return new Symbol(sym.ELSE,   yyline, yycolumn); }
"while"    { return new Symbol(sym.WHILE,  yyline, yycolumn); }
"for"      { return new Symbol(sym.FOR,    yyline, yycolumn); }
"printf"   { return new Symbol(sym.PRINTF, yyline, yycolumn); }
"scanf"    { return new Symbol(sym.SCANF,  yyline, yycolumn); }
"true"     { return new Symbol(sym.TRUE,   yyline, yycolumn); }
"false"    { return new Symbol(sym.FALSE,  yyline, yycolumn); }

"int"      { return new Symbol(sym.T_INT,  yyline, yycolumn); }
"real"     { return new Symbol(sym.T_REAL, yyline, yycolumn); }
"chr"      { return new Symbol(sym.T_CHR,  yyline, yycolumn); }
"str"      { return new Symbol(sym.T_STR,  yyline, yycolumn); }

"=="       { return new Symbol(sym.EQ,  yyline, yycolumn); }
"!="       { return new Symbol(sym.NEQ, yyline, yycolumn); }
"<="       { return new Symbol(sym.LEQ, yyline, yycolumn); }
">="       { return new Symbol(sym.GEQ, yyline, yycolumn); }

"&&"       { return new Symbol(sym.AND, yyline, yycolumn); }
"||"       { return new Symbol(sym.OR,  yyline, yycolumn); }
"!"        { return new Symbol(sym.NOT, yyline, yycolumn); }

"+"        { return new Symbol(sym.PLUS,  yyline, yycolumn); }
"-"        { return new Symbol(sym.MINUS, yyline, yycolumn); }
"*"        { return new Symbol(sym.TIMES, yyline, yycolumn); }
"/"        { return new Symbol(sym.DIV,   yyline, yycolumn); }
"="        { return new Symbol(sym.ATTR,  yyline, yycolumn); }
"<"        { return new Symbol(sym.LT,    yyline, yycolumn); }
">"        { return new Symbol(sym.GT,    yyline, yycolumn); }

"("        { return new Symbol(sym.LPAR,   yyline, yycolumn); }
")"        { return new Symbol(sym.RPAR,   yyline, yycolumn); }
"{"        { return new Symbol(sym.LBRACE, yyline, yycolumn); }
"}"        { return new Symbol(sym.RBRACE, yyline, yycolumn); }
";"        { return new Symbol(sym.SEMI,   yyline, yycolumn); }

{LitChr}   { return new Symbol(sym.LIT_CHR, yyline, yycolumn, yytext()); }
{LitStr}   { return new Symbol(sym.LIT_STR, yyline, yycolumn, yytext()); }

{Id}       { return new Symbol(sym.ID,  yyline, yycolumn, yytext()); }
{Num}      { return new Symbol(sym.NUM, yyline, yycolumn, Double.parseDouble(yytext())); }

.          { System.err.println("Erro Lexico [linha " + (yyline+1) + "]: caractere invalido '" + yytext() + "'"); }