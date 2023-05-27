import 'package:flutter/material.dart';
import 'home.dart';

class SelectedCurso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeCurso(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class HomeCurso extends StatefulWidget {
  @override
  State<HomeCurso> createState() {
    return HomeStateCurso();
  }
}

class HomeStateCurso extends State<HomeCurso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Cursos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Sistemas de Informações'),
              onPressed: () => _sobre(context),
            ),
          ]
      ),
      ),
    );
  }

  Future<void> _sobre(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Faculdade Anhanguera De Uberlândia:\n'
              'Sistemas de Informação - N '
              'Mobile da turma de 2023-1\n\n'
              'RA: 3030303030 - Cursando '),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Portal do Aluno'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWidget()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
