## Comando para rodar o Analisador Sintático

java -cp .:/usr/share/java/cup.jar compilador.Main

## Caso seja necessário recompilar tudo, rode esses comandos:

**Apaga tudo para evitar cache**

rm compilador/*.class compilador/Lexer.java compilador/parser.java compilador/sym.java

**Gera o Parser**

java -jar /usr/share/java/cup.jar -destdir compilador -parser parser -symbols sym compilador/Parser.cup

**Gera o Lexer**

jflex compilador/Lexer.flex

**Compila tudo**

javac -cp .:/usr/share/java/cup.jar compilador/*.java

**Roda**

java -cp .:/usr/share/java/cup.jar compilador.Main
