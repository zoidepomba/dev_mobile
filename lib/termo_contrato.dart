import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ContractScreen extends StatelessWidget {
  final List<String> semesters = [
    '1º Semestre - 2023',
    '2º Semestre - 2022',
    '1º Semestre - 2022',
    '2º Semestre - 2021',
    '1º Semestre - 2021',
    '2º Semestre - 2020',
    '1º Semestre - 2020',
    '2º Semestre - 2019',
    '1º Semestre - 2019',
  ];

  ContractScreen({super.key}); // Exemplo de semestres

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termos e Contratos'),
      ),
      body: ListView.builder(
        itemCount: semesters.length,
        itemBuilder: (context, index) {
          final semester = semesters[index];
          return buildListItem(context, semester);
        },
      ),
    );
  }

  Widget buildListItem(BuildContext context, String semester) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 80,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            title: Text(semester),
            onTap: () {
              downloadContract(semester, context);
            },
          ),
        ));
  }

  Future<void> downloadContract(String semester, BuildContext context) async {
    String contractUrl =
        'https://drive.google.com/file/d/1HP_aZM0-bALwfm-6w0_UVV-4mcN8Yyh5/view?usp=drive_link'; // Substitua pelo URL real do arquivo PDF correspondente ao semestre

    final response = await http.get(Uri.parse(contractUrl));

    if (response.statusCode == 200) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String filePath = '$appDocPath/contrato_$semester.pdf';

      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Download Concluído'),
            content: Text('O contrato do $semester foi baixado com sucesso.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro no Download'),
            content: Text('Ocorreu um erro ao baixar o contrato do $semester.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
