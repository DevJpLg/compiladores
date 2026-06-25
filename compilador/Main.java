package compilador;

import java.io.FileReader;
import java.io.File;
import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) {
        String raiz    = Paths.get("").toAbsolutePath().toString();
        String pasta   = raiz + "/compilador/";

        String[] corretos = { "teste_io.txt", "teste_condicional.txt", "teste_loop.txt" };
        String[] erros    = { "erro_sintatico.txt", "erro_expressao.txt", "erro_bloco.txt" };

        System.out.println("=== Linguagem LangZ — Analisador Lexico/Sintatico ===\n");

        System.out.println(">> Codigos corretos:");
        rodar(pasta, corretos);

        System.out.println("\n>> Codigos com erros de sintaxe:");
        rodar(pasta, erros);

        System.out.println("\n=== Analise concluida ===");
    }

    private static void rodar(String pasta, String[] arquivos) {
        for (String nome : arquivos) {
            System.out.println("\n[" + nome + "]");
            String caminho = pasta + nome;

            try {
                File f = new File(caminho);
                if (!f.exists()) {
                    System.out.println("  Arquivo nao encontrado.");
                    continue;
                }

                Lexer  lex = new Lexer(new FileReader(caminho));
                parser p   = new parser(lex);
                p.parse();
                System.out.println("  OK — sintaxe valida.");

            } catch (Exception e) {
                System.out.println("  FALHA — " + e.getMessage());
            }
        }
    }
}