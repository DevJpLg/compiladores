package compilador;

import java.io.FileReader;
import java.nio.file.Paths;
import java.io.File;

public class Main {
    public static void main(String[] args) {
        // Pega o diretório atual onde você roda o comando java
        String rootPath = Paths.get("").toAbsolutePath().toString();
        
        // Ajuste aqui: Se os .txt estiverem dentro da pasta 'compilador', deixe assim.
        // Se estiverem na pasta raiz 'trabalho', mude para "/"
        String subPath = "/compilador/"; 

        String[] arquivosTeste = {
            "teste_io.txt", "teste_condicional.txt", "teste_loop.txt",
            "erro_lexico.txt", "erro_sintatico.txt", "erro_expressao.txt"
        };

        for (String arquivo : arquivosTeste) {
            System.out.println("-----------------------------------------");
            String caminhoCompleto = rootPath + subPath + arquivo;
            System.out.println("Lendo arquivo: " + caminhoCompleto);

            try {
                File f = new File(caminhoCompleto);
                if (!f.exists()) {
                    System.out.println("ERRO: Arquivo não encontrado neste local!");
                    continue;
                }

                Lexer lexer = new Lexer(new FileReader(caminhoCompleto));
                parser p = new parser(lexer);
                p.parse();
                System.out.println("Sucesso! Sintaxe correta.");

            } catch (Exception e) {
                System.out.println("ERRO NA COMPILAÇÃO:");
                // Isso vai imprimir o erro real (ex: linha/coluna ou arquivo inexistente)
                e.printStackTrace(); 
            }
        }
    }
}