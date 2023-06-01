import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  final List<Map<String, String>> eventos = [
    {
      'titulo': 'Eventos Esportivos',
      'resumo':
          'O próximo evento Esportivo está marcado no dia 03/06/2023 as 18:30 no Parque do Sabiá.',
    },
    {
      'titulo': 'Congressos',
      'resumo':
          'O congresso ocorre a cada início do semestre, com a presença de todos os professores. Neste semestre ocorreu no dia 20/03.',
    },
    {
      'titulo': 'Palestras',
      'resumo': 'Título: "Introdução à Inteligência Artificial"\n '
          'Data: 10 de Setembro de 2023\n'
          'Local: Auditório Principal \n'
          '\n'
          'Título: "Tendências da Tecnologia da Informação" \n'
          'Data: 10 de Setembro de 2023 \n'
          'Local: Auditório Principal\n',
    },
    {
      'titulo': 'Festival do Turismo',
      'resumo':
          'O Festival do Turismo ocorre a cada semestre. A coordenação da faculdade entra em contato com Empresas para verificar possíveis parcerias, afim de levar os alunos para conhecer a estrutura da empresa.',
    },
    {
      'titulo': 'Projeto Científico',
      'resumo': 'Título: "Impacto da poluição sonora na saúde mental"\n'
          '\n'
          'Objetivo: Investigar o efeito da exposição prolongada à poluição sonora em áreas urbanas densamente povoadas na saúde mental dos moradores.\n'
          '\n'
          '1-Coletar dados sobre os níveis de ruído em diferentes áreas urbanas;\n'
          '2-Realizar questionários e entrevistas com os moradores para avaliar seu bem-estar mental;\n'
          '3-Analisar os dados coletados para identificar possíveis correlações entre a exposição à poluição sonora e problemas de saúde mental;\n'
          '\n'
          'Duração: O projeto será conduzido ao longo de 6 meses, com coleta de dados, análise e apresentação dos resultados',
    },
  ];

  AgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          final evento = eventos[index];

          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 3,
            child: Container(
              height: 100, // Defina a altura desejada aqui
              padding: const EdgeInsets.all(16),
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
