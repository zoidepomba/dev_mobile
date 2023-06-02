import 'package:flutter/material.dart';

class HistoricoEscolarScreen extends StatefulWidget {
  const HistoricoEscolarScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HistoricoEscolarScreenState createState() => _HistoricoEscolarScreenState();
}

class _HistoricoEscolarScreenState extends State<HistoricoEscolarScreen> {
  String filtro = 'Todas';

  List<HistoricoItemData> historicoItems = [
    HistoricoItemData(
      materia: 'Sistemas de Computação e de Informação',
      periodo: '1º Semestre',
      nota: 7.5,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Matemática Discreta',
      periodo: '1º Semestre',
      nota: 5.5,
      status: StatusAvaliacao.reprovado,
    ),
    HistoricoItemData(
      materia: 'Algoritmos e Técnicas de Programação',
      periodo: '1º Semestre',
      nota: 10,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Auditoria de Sistemas',
      periodo: '1º Semestre',
      nota: 9,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Gerenciamento e Qualidade de Software',
      periodo: '2º Semestre',
      nota: 7,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Modelagem de Dados',
      periodo: '2º Semestre',
      nota: 6,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Programação Orientada a Objetos',
      periodo: '2º Semestre',
      nota: 6.5,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Gestão de Projetos',
      periodo: '2º Semestre',
      nota: 7.5,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Programação Web',
      periodo: '3º Semestre',
      nota: 9,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Análise de Sistemas',
      periodo: '3º Semestre',
      nota: 9.5,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Sistemas Distribuídos',
      periodo: '3º Semestre',
      nota: 10,
      status: StatusAvaliacao.aprovado,
    ),
    HistoricoItemData(
      materia: 'Engenharia de Software',
      periodo: '3º Semestre',
      nota: 5,
      status: StatusAvaliacao.reprovado,
    ),
    HistoricoItemData(
      materia: 'Desenvolvimento Mobile',
      periodo: '4º Semestre',
      nota: -1,
      status: StatusAvaliacao.cursando,
    ),
    HistoricoItemData(
      materia: 'Trabalho de conclusão de curso I',
      periodo: '4º Semestre',
      nota: -1,
      status: StatusAvaliacao.cursando,
    ),
    HistoricoItemData(
      materia: 'Programação Web II',
      periodo: '4º Semestre',
      nota: -1,
      status: StatusAvaliacao.cursando,
    ),
    HistoricoItemData(
      materia: 'Programação Orientada a Objetos II',
      periodo: '4º Semestre',
      nota: -1,
      status: StatusAvaliacao.cursando,
    ),
    HistoricoItemData(
      materia: 'Trabalho de conclusão de curso II',
      periodo: '5º Semestre',
      nota: -1,
      status: StatusAvaliacao.aCursar,
    ),
    HistoricoItemData(
      materia: 'Projeto de Sistemas',
      periodo: '5º Semestre',
      nota: -1,
      status: StatusAvaliacao.aCursar,
    ),
    HistoricoItemData(
      materia: 'Desenvolvimento de Sistemas de Informação',
      periodo: '5º Semestre',
      nota: -1,
      status: StatusAvaliacao.aCursar,
    ),
    HistoricoItemData(
      materia: 'Desenvolvimento Mobile II',
      periodo: '5º Semestre',
      nota: -1,
      status: StatusAvaliacao.aCursar,
    ),
  ];

  List<HistoricoItemData> historicoFiltrado = [];

  @override
  void initState() {
    super.initState();
    filtrarMaterias();
  }

  void filtrarMaterias() {
    if (filtro == 'Todas') {
      historicoFiltrado = historicoItems;
    } else if (filtro == 'Aprovadas') {
      historicoFiltrado = historicoItems
          .where((item) => item.status == StatusAvaliacao.aprovado)
          .toList();
    } else if (filtro == 'Reprovadas') {
      historicoFiltrado = historicoItems
          .where((item) => item.status == StatusAvaliacao.reprovado)
          .toList();
    } else if (filtro == 'A Cursar') {
      historicoFiltrado = historicoItems
          .where((item) => item.status == StatusAvaliacao.aCursar)
          .toList();
    } else if (filtro == 'Cursando') {
      historicoFiltrado = historicoItems
          .where((item) => item.status == StatusAvaliacao.cursando)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico Escolar'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Histórico Escolar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                value: filtro,
                onChanged: (value) {
                  setState(() {
                    filtro = value!;
                    filtrarMaterias();
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 'Todas',
                    child: Text('Todas'),
                  ),
                  DropdownMenuItem(
                    value: 'Cursando',
                    child: Text('Cursando'),
                  ),
                  DropdownMenuItem(
                    value: 'Aprovadas',
                    child: Text('Aprovadas'),
                  ),
                  DropdownMenuItem(
                    value: 'Reprovadas',
                    child: Text('Reprovadas'),
                  ),
                  DropdownMenuItem(
                    value: 'A Cursar',
                    child: Text('A Cursar'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: historicoFiltrado.length,
                itemBuilder: (context, index) {
                  final item = historicoFiltrado[index];
                  return HistoricoItem(
                    materia: item.materia,
                    periodo: item.periodo,
                    nota: item.nota,
                    status: item.status,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoricoItemData {
  final String materia;
  final String periodo;
  final double nota;
  final StatusAvaliacao status;

  HistoricoItemData({
    required this.materia,
    required this.periodo,
    required this.nota,
    required this.status,
  });
}

enum StatusAvaliacao { aprovado, reprovado, aCursar, cursando }

class HistoricoItem extends StatelessWidget {
  final String materia;
  final String periodo;
  final double nota;
  final StatusAvaliacao status;

  const HistoricoItem({
    Key? key,
    required this.materia,
    required this.periodo,
    required this.nota,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    switch (status) {
      case StatusAvaliacao.aprovado:
        statusColor = Colors.green;
        statusText = 'Aprovado';
        break;
      case StatusAvaliacao.reprovado:
        statusColor = Colors.red;
        statusText = 'Reprovado';
        break;
      case StatusAvaliacao.aCursar:
        statusColor = Colors.grey;
        statusText = 'A Cursar';
        break;
      case StatusAvaliacao.cursando:
        statusColor = Colors.blue;
        statusText = 'Cursando';
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            materia,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Período: $periodo',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nota: ${nota >= 0 ? nota.toStringAsFixed(1) : "-"}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
