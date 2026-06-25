# Gramática BNF — Linguagem LangZ

A linguagem **LangZ** é uma linguagem fictícia de uso didático, com suporte a
tipos primitivos, estruturas de controle e operações de entrada e saída.

---

## Estrutura Geral

```
<programa> ::= <bloco>
```

Um programa LangZ é formado por um único bloco delimitado por chaves.

---

## Blocos e Comandos

```
<bloco> ::= "{" <lista_cmds> "}"
           | "{" "}"

<lista_cmds> ::= <cmd> <lista_cmds>
               | <cmd>

<cmd> ::= <decl>
        | <atrib>
        | <se_senao>
        | <enquanto>
        | <para>
        | <escrever>
        | <ler>
        | <bloco>
```

---

## Declaração e Atribuição

```
<decl>  ::= <tipo> <id> ";"

<tipo>  ::= "int" | "real" | "chr" | "str"

<atrib> ::= <id> "=" <expr> ";"
```

---

## Estruturas de Controle

```
<se_senao>  ::= "if" "(" <expr> ")" <bloco> <opt_senao>

<opt_senao> ::= "else" <bloco>
              | ε

<enquanto>  ::= "while" "(" <expr> ")" <bloco>

<para>      ::= "for" "(" <atrib> <expr> ";" <atrib_inc> ")" <bloco>

<atrib_inc> ::= <id> "=" <expr>
```

---

## Entrada e Saída

```
<escrever> ::= "printf" "(" <expr> ")" ";"

<ler>      ::= "scanf"  "(" <id>   ")" ";"
```

---

## Expressões

```
<expr> ::= <expr> <op_arit> <expr>
         | <expr> <op_rel>  <expr>
         | <expr> <op_log>  <expr>
         | "!" <expr>
         | <termo>

<termo> ::= <id>
           | <num>
           | <lit_chr>
           | <lit_str>
           | "true"
           | "false"
           | "(" <expr> ")"
```

---

## Operadores

```
<op_arit> ::= "+" | "-" | "*" | "/"

<op_rel>  ::= "==" | "!=" | "<" | ">" | "<=" | ">="

<op_log>  ::= "&&" | "||"
```

---

## Elementos Léxicos

```
<id>      ::= letra ( letra | digito )*
<num>     ::= digito+ ( "." digito+ )?
<lit_chr> ::= "'" caractere "'"
<lit_str> ::= '"' { caractere } '"'
<letra>   ::= [a-zA-Z_]
<digito>  ::= [0-9]
```
