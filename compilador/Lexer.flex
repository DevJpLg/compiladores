package compilador;
import java_cup.runtime.Symbol;

%%

%class Lexer
%public
%unicode
%cup
%line
%column

/* --- MACROS --- */
Letra = [a-zA-Z]
Digito = [0-9]

/* Ignora espaços, tabs e novas linhas */
Espaco = [ \t\r\n\f]+

/* Identificadores: Letra seguida de letras ou números */
Identificador = {Letra}({Letra}|{Digito})*

/* Números: Aceita inteiros (10) e reais (10.5) */
Numero = {Digito}+(\.{Digito}+)?

/* Comentários: Tudo entre / e / */
Comentario = "/*" ~"*/"

%%

/* --- REGRAS --- */

/* 1. Ignorar Espaços e Comentários (IMPORTANTE: Deve vir antes de tudo) */
{Espaco}     { /* Ignora e não retorna nada */ }
{Comentario} { /* Ignora e não retorna nada */ }

/* 2. Palavras-chave */
"if"         { return new Symbol(sym.IF, yyline, yycolumn); }
"else"       { return new Symbol(sym.ELSE, yyline, yycolumn); }
"while"      { return new Symbol(sym.WHILE, yyline, yycolumn); }
"for"        { return new Symbol(sym.FOR, yyline, yycolumn); }
"input"      { return new Symbol(sym.INPUT, yyline, yycolumn); }
"output"     { return new Symbol(sym.OUTPUT, yyline, yycolumn); }

/* 3. Tipos de Dados */
"int"        { return new Symbol(sym.TIPO_INT, yyline, yycolumn); }
"real"       { return new Symbol(sym.TIPO_REAL, yyline, yycolumn); }
"chr"        { return new Symbol(sym.TIPO_CHR, yyline, yycolumn); }
"str"        { return new Symbol(sym.TIPO_STR, yyline, yycolumn); }

/* 4. Literais Booleanos */
"true"       { return new Symbol(sym.TRUE, yyline, yycolumn); }
"false"      { return new Symbol(sym.FALSE, yyline, yycolumn); }

/* 5. Operadores e Pontuação */
"+"          { return new Symbol(sym.MAIS, yyline, yycolumn); }
"-"          { return new Symbol(sym.MENOS, yyline, yycolumn); }
"*"          { return new Symbol(sym.MULT, yyline, yycolumn); }
"/"          { return new Symbol(sym.DIV, yyline, yycolumn); }
"="          { return new Symbol(sym.IGUAL, yyline, yycolumn); }
"=="         { return new Symbol(sym.IGUAL_IGUAL, yyline, yycolumn); }
"<"          { return new Symbol(sym.MENOR, yyline, yycolumn); }
">"          { return new Symbol(sym.MAIOR, yyline, yycolumn); }
"("          { return new Symbol(sym.ABRE_PAR, yyline, yycolumn); }
")"          { return new Symbol(sym.FECHA_PAR, yyline, yycolumn); }
"{"          { return new Symbol(sym.ABRE_CHAVE, yyline, yycolumn); }
"}"          { return new Symbol(sym.FECHA_CHAVE, yyline, yycolumn); }
";"          { return new Symbol(sym.PONTO_VIRGULA, yyline, yycolumn); }

/* 6. Identificadores e Números (Token dinâmico) */
{Identificador} { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }

{Numero}        { 
    /* CORREÇÃO CRÍTICA: Lê como double para aceitar ponto, converte para int */
    double val = Double.parseDouble(yytext());
    return new Symbol(sym.NUM, yyline, yycolumn, (int) val); 
}

/* 7. Erro para qualquer caractere não reconhecido */
.            { System.err.println("Caracter ilegal: " + yytext()); }