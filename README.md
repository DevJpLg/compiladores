# 🖥️ Trabalho P1 - Compiladores - Grupo: João Pedro, Breno e Gabriel

## 📁 Estrutura do Projeto

```text
compiladores/
│
├── bnf.md                       # Especificação formal da gramática (notação BNF)
├── cup.jar                      # Ferramenta CUP (gerador de parser)
├── jflex.jar                    # Ferramenta JFlex (gerador de lexer)
│
└── compilador/
    ├── Lexer.flex               # Especificação JFlex — analisador léxico
    ├── Parser.cup               # Especificação CUP  — analisador sintático
    ├── Main.java                # Programa principal
    │
    ├── teste_io.txt             # ✅ Código correto 1 — leitura e escrita de dados
    ├── teste_condicional.txt    # ✅ Código correto 2 — if/else e while
    ├── teste_loop.txt           # ✅ Código correto 3 — laço for
    │
    ├── erro_sintatico.txt       # ❌ Erro sintático: declaração sem ponto e vírgula
    ├── erro_expressao.txt       # ❌ Erro sintático: if sem parênteses
    └── erro_lexico.txt          # ❌ Erro sintático: bloco sem chave de fechamento
```

## ▶️ Como Rodar

> ⚠️ **Importante:** Os comandos abaixo são para o **Prompt de Comando (CMD)**, não PowerShell.
> Para abrir o CMD na pasta certa: no Explorador de Arquivos, navegue até a pasta `compiladores`, clique na barra de endereço, digite `cmd` e pressione **Enter**.

> Os passos 2 e 3 usam o `java` normal. Os passos 4 e 5 precisam do **caminho completo do JDK 26** porque o sistema tem dois Javas instalados.

---

### Passo 1 — Limpar arquivos gerados anteriormente

```cmd
del /q compilador\*.class compilador\Lexer.java compilador\parser.java compilador\sym.java
```

_(Se for a primeira vez, pode aparecer "não foi possível encontrar" — ignorar e continuar.)_

---

### Passo 2 — Gerar o analisador sintático (CUP → `parser.java` e `sym.java`)

```cmd
java -jar cup.jar -destdir compilador -parser parser -symbols sym compilador\Parser.cup
```

✅ Esperado: mensagem `0 errors and 0 warnings` e `Code written to "parser.java", and "sym.java"`.

---

### Passo 3 — Gerar o analisador léxico (JFlex → `Lexer.java`)

```cmd
java -jar jflex.jar compilador\Lexer.flex
```

✅ Esperado: mensagem `Writing code to "compilador\Lexer.java"`.

---

### Passo 4 — Compilar todos os arquivos Java

```cmd
"C:\Program Files\Java\jdk-26.0.1\bin\javac.exe" -cp ".;cup.jar" compilador\*.java
```

✅ Esperado: sem erros. Avisos de `deprecated API` são normais — não são erros.

---

### Passo 5 — Executar o analisador

```cmd
"C:\Program Files\Java\jdk-26.0.1\bin\java.exe" -cp ".;cup.jar" compilador.Main
```

---

## 🧪 Saída Esperada

```text
=== Linguagem LangZ — Analisador Lexico/Sintatico ===

>> Codigos corretos:

[teste_io.txt]
  OK — sintaxe valida.

[teste_condicional.txt]
  OK — sintaxe valida.

[teste_loop.txt]
  OK — sintaxe valida.

>> Codigos com erros de sintaxe:

[erro_sintatico.txt]
Erro Sintatico [linha 4, col 5]: token inesperado -> preco
  FALHA — Erro fatal [linha 4]: analise interrompida em -> preco

[erro_expressao.txt]
Erro Sintatico [linha 6, col 8]: token inesperado -> pontos
  FALHA — Erro fatal [linha 6]: analise interrompida em -> pontos

[erro_lexico.txt]
Erro Sintatico [linha 0, col 0]: token inesperado -> ?
  FALHA — Erro fatal [linha 0]: analise interrompida em -> fim de arquivo

=== Analise concluida ===
```
> **Nota:** Os caracteres `?` no lugar de `—` podem aparecer dependendo da configuração de codificação (encoding) do terminal do Windows. Isso é apenas visual e não indica um erro na análise.

---

## 📄 Arquivos para Entrega

| Arquivo | Descrição |
|---|---|
| `bnf.md` | Gramática formal da linguagem LangZ em notação BNF |
| `compilador/Lexer.flex` | Especificação JFlex do analisador léxico |
| `compilador/Parser.cup` | Especificação CUP do analisador sintático |
| `compilador/teste_io.txt` | Código correto — leitura e escrita de dados |
| `compilador/teste_condicional.txt` | Código correto — if/else e while |
| `compilador/teste_loop.txt` | Código correto — laço for |
| `compilador/erro_sintatico.txt` | Erro de sintaxe: falta `;` na declaração |
| `compilador/erro_expressao.txt` | Erro de sintaxe: `if` sem parênteses |
| `compilador/erro_lexico.txt` | Erro de sintaxe: bloco sem `}` de fechamento |
