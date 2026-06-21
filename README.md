# 🖥️ LangZ — Compilador Léxico e Sintático - João Pedro, Breno e Gabriel

> **Trabalho P1 — Disciplina de Compiladores**
> Implementação de um analisador léxico e sintático para a linguagem fictícia **LangZ**,
> utilizando as ferramentas **JFlex** (análise léxica) e **CUP** (análise sintática).

---

## 📁 Estrutura do Projeto

```
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

---

## 🔤 Sobre a Linguagem LangZ

A **LangZ** é uma linguagem imperativa fictícia criada para fins didáticos.

| Recurso | Sintaxe |
|---|---|
| **Tipos de dados** | `int`, `real`, `chr`, `str` |
| **Bloco de comandos** | `{` ... `}` |
| **Declaração** | `int x;` |
| **Atribuição** | `x = 10;` |
| **Expressões aritméticas** | `+`, `-`, `*`, `/` |
| **Expressões lógicas** | `&&`, `\|\|`, `!`, `==`, `!=`, `<`, `>`, `<=`, `>=` |
| **Condicional** | `if (cond) { } else { }` |
| **Laço while** | `while (cond) { }` |
| **Laço for** | `for (ini; cond; inc) { }` |
| **Saída** | `printf(expr);` |
| **Entrada** | `scanf(id);` |
| **Comentários** | `/* ... */` |

---

## ▶️ Como Rodar no Windows 11

> ✅ **Pré-requisito:** Ter o **Java JDK** instalado.
> Verifique abrindo o PowerShell e digitando `java -version`. Se aparecer a versão, está pronto.

### Passo 0 — Abrir o PowerShell na pasta certa

Abra o **Explorador de Arquivos**, navegue até a pasta `compiladores`, clique com o **botão direito** em qualquer espaço vazio da pasta e escolha **"Abrir no Terminal"** (ou "Abrir janela do PowerShell aqui").

> ⚠️ Todos os comandos abaixo devem ser rodados **dentro da pasta `compiladores`**.

---

### Passo 1 — Limpar arquivos gerados anteriormente

```powershell
Remove-Item compilador\*.class, compilador\Lexer.java, compilador\parser.java, compilador\sym.java -ErrorAction SilentlyContinue
```

_(Se for a primeira vez, não tem nada para apagar — tudo bem, continua.)_

---

### Passo 2 — Gerar o analisador sintático (CUP → `parser.java` e `sym.java`)

```powershell
java -jar cup.jar -destdir compilador -parser parser -symbols sym compilador\Parser.cup
```

✅ Esperado: mensagem `0 errors and 0 warnings` e `Code written to "parser.java", and "sym.java"`.

---

### Passo 3 — Gerar o analisador léxico (JFlex → `Lexer.java`)

```powershell
java -jar jflex.jar compilador\Lexer.flex
```

✅ Esperado: mensagem `Writing code to "compilador\Lexer.java"`.

---

### Passo 4 — Compilar todos os arquivos Java

```powershell
javac -cp ".;cup.jar" compilador\*.java
```

✅ Esperado: sem erros (avisos de `deprecated API` podem aparecer — é normal, não são erros).

---

### Passo 5 — Executar o analisador

```powershell
java -cp ".;cup.jar" compilador.Main
```

---

## 🧪 Saída Esperada

```
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
  FALHA — Erro fatal [linha 0]: analise interrompida em -> fim de arquivo

=== Analise concluida ===
```

---

## 📄 Arquivos para Entrega

| Arquivo | Descrição |
|---|---|
| `bnf.md` | Gramática formal da linguagem LangZ em notação BNF |
| `compilador/Lexer.flex` | Especificação JFlex do analisador léxico |
| `compilador/Parser.cup` | Especificação CUP do analisador sintático |
| `compilador/teste_io.txt` | Código correto — declarações e I/O |
| `compilador/teste_condicional.txt` | Código correto — if/else e while |
| `compilador/teste_loop.txt` | Código correto — laço for |
| `compilador/erro_sintatico.txt` | Erro de sintaxe: falta `;` na declaração |
| `compilador/erro_expressao.txt` | Erro de sintaxe: `if` sem parênteses |
| `compilador/erro_lexico.txt` | Erro de sintaxe: bloco sem `}` de fechamento |
