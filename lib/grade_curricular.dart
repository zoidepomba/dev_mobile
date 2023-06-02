import 'package:flutter/material.dart';

class HomeGrade extends StatelessWidget {
  final List<Map<String, String>> GradeCurricular = [
    {
      'titulo': 'Programação Orientada a Objetos 2',
      'resumo': 'Professor: Angela / Sala: C38\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'O que é orientação a objetos?\n'
          'Ideia básica da Orientação a objetos (OO)\n'
          'Classes, Atributos, Métodos e objetos o que são cada um?\n'
          'Começar com POO\n',
    },
    {
      'titulo': 'Desenvolvimento WEB',
      'resumo': 'Professor: Bruno Messias / Sala: C31\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'O que é programação web?\n'
          'A evolução da programação\n'
          'As diferenças entre programação e codificação\n'
          'Por que é importante aprender a programar web?\n'
          'Sites para aprender como programar de graça\n'
          'Conclusão da matéria',
    },
    {
      'titulo': 'Desenvolvimento Mobile',
      'resumo': 'Professor: Hebert / Sala: C31\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'O que é desenvolvimento mobile?\n'
          'O que faz um desenvolvedor mobile?\n'
          'Comparação com outros perfis de profissionais\n'
          'Quais as linguagens utilizamos no Desenvolvimento Mobile?\n'
          'Quais as principais plataformas de desenvolvimento mobile?\n'
          'Quais são os tipos de desenvolvimento mobile?\n'
          'Qual a importância do desenvolvimento mobile para o mercado?\n'
          'Quais são os desafios do desenvolvimento para mobile?',
    },
    {
      'titulo': 'Segurança da Informação',
      'resumo': 'Professor: Daniel / Sala: C51\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'Introdução a Segurança da Informação\n'
          'Aulas Dinâmicas e teoria\n'
          'Aulas práticas\n'
          'Estudo sem internet\n'
          'Métodos Hiperlink\n'
          'Gestão de Tempo',
    },
    {
      'titulo': 'Programação em Banco de Dados',
      'resumo': 'Professor: Adriano / Sala: C41\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'Introdução a Banco de Dados\n'
          'Calendário Acadêmico\n'
          'Explos de uso da linguagem SQL\n'
          'Aprendendo a usar o draw.io 1\n'
          'Aulas práticas com SQL\n',
    },
    {
      'titulo': 'B.I - Business Intelligence',
      'resumo': 'Professor: Herbert / Sala: C11\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'Aprendendo sobre o python e sua performance\n'
          'O que faz cada função dentro de B.I\n'
          'Extração de dados de fontes diversas\n'
          'Manipulação dos dados\n'
          'Métodos Hiperlink\n'
          'Uso aplicado do PowerBI',
    },
    {
      'titulo': 'Modelagem de Dados',
      'resumo': 'Professor: Adriano / Sala: C71\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'O que e modelage de dados e pra que serve\n'
          'Calendário Acadêmico\n'
          'Aprendendo a usar o draw.io 1\n'
          'Aprendendo a usar o draw.io 2\n'
          'Aprendendo a usar o draw.io 3\n'
          'Aprendendo a usar o draw.io 4\n'
          'Aprendendo a usar o draw.io 5',
    },
    {
      'titulo': 'Projeto de Extensão',
      'resumo': 'Professor: Maxxwell / Sala: C81\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'Onde se aplica o projeto de extensão\n'
          'Explicação sobre o modelo do PDCA\n'
          'Explicação sobre o relatório final do projeto de extensão\n'
          'Avaliação de trabalhos\n'
          'Aplicação da ABNT em seu relatório\n'
          'Gestão do tempo de trabalho',
    },
    {
      'titulo': 'Trabalho de Conclusão de Curso',
      'resumo': 'Professor: Herbert / Sala: C81\n\n'
          'Aqui está a sua grade de conteúdos desta matéria:\n\n'
          'Aplicação da ABNT em seu trabalho\n'
          'Margeamento de páginas\n'
          'Como deve ser o corpo do texto\n'
          'Como devem ser as referências bibliograficas\n'
          'Técnicas para defesa do TCC\n'
          'Montagem da apresentação para defesa do TCC',
    },
  ];

  HomeGrade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Curricular'),
      ),
      body: ListView.builder(
        itemCount: GradeCurricular.length,
        itemBuilder: (context, index) {
          final evento = GradeCurricular[index];

          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 3,
            child: Container(
              height: 100, // Defina a altura desejada aqui
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: ListTile(
                title: Text(
                  evento['titulo']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  evento['resumo']!,
                  maxLines: 2, // Defina o número máximo de linhas para o resumo
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  _mostrarResumoEvento(
                    context,
                    evento['titulo']!,
                    evento['resumo']!,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _mostrarResumoEvento(
      BuildContext context, String titulo, String resumo) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(resumo),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
