<bloco_comandos> ::= "{" <lista_comandos>> "}"

<lista_comandos> ::= <comando> <lista_comandos> | <comando>

<comando>        ::= <declaracao> | <atribuicao> | <if_else> | <for> | <while> | <io>

<declaracao>     ::= <tipo> <identificador> ";"

<tipo>           ::= "int" | "real" | "chr" | "str"

<atribuicao>     ::= <identificador> "=" <expressao> ";"

<if_else>        ::= "if" "(" <expressao> ")" <bloco_comandos> <opt_else>

<opt_else>       ::= "else" <bloco_comandos> | ε

<while>          ::= "while" "(" <expressao> ")" <bloco_comandos>

<for>            ::= "for" "(" <atribuicao> <expressao> ";" <atribuicao> ")" <bloco_comandos>

<io>             ::= "input" "(" <identificador> ")" ";" | "output" "(" <expressao> ")" ";"

<expressao>      ::= <expressao> <operador> <termo> | <termo>

<termo>          ::= <identificador> | <numero> | "true" | "false" | "(" <expressao> ")"

<operador>       ::= "+" | "-" | "*" | "/" | "==" | "<" | ">" 